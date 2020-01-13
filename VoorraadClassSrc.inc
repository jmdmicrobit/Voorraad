!--------------------------------------------------------------------
! APPLICATION:  VoorrDct.APP   
! PROCEDURE:    VoorraadClassSource
! INC file:     VoorraadClassSrc.inc
!--------------------------------------------------------------------

VoorraadClass.VerwerkGekoppeldeVerkoop      PROCEDURE(LONG PRM:PlanningID, LONG PRM:OverboekingPlanningID, LONG PRM:CelID)
BufferID            USHORT
FileID              USHORT
CODE
	GLO:GebruikerLogHandelingOpmerking = 'VerwerkGekoppeldeVerkoop'			
	
	IF PRM:OverboekingPlanningID > 0 THEN
		FileID = Access:Planning.SaveFile()
		BufferID = Access:Planning.SaveBuffer()
		
		CLEAR(Pla:Record)
		Pla:PlanningID = PRM:OverboekingPlanningID 
		IF (Access:Planning.TryFetch(Pla:PK_Planning) = Level:Benign) THEN
			IF Pla:OverboekingPlanningID = PRM:PlanningID THEN  
				Pla:CelID = PRM:CelID
				Access:Planning.Update()
			END
		END
			
		Access:Planning.RestoreFile(FileID)
		Access:Planning.RestoreBuffer(BufferID)	
	END
	
	GLO:GebruikerLogHandelingOpmerking = ''			
	
VoorraadClass.BerekenPlanningMutatieGrootte PROCEDURE(LONG PRM:PlanningID)
BufferID                                        USHORT
FileID                                          USHORT
SAV:MutatieKG                                   LIKE(Pla:MutatieKG)
SAV:MutatiePallets                              LIKE(Pla:MutatiePallets)
SAV:MutatieGemaakt                              LIKE(Pla:MutatieGemaakt)
CODE
	GLO:GebruikerLogHandelingOpmerking = 'BerekenPlanningMutatieGrootte'

	BufferID = Access:Mutatie.SaveBuffer()
	FileID = Access:Mutatie.SaveFile()
	
	CLEAR(Pla:Record)
	Pla:PlanningID = PRM:PlanningID
    IF Access:Planning.TryFetch(Pla:PK_Planning) = Level:Benign THEN
        SAV:MutatieKG = Pla:MutatieKG 
        SAV:MutatiePallets = Pla:MutatiePallets 
        SAV:MutatieGemaakt = Pla:MutatieGemaakt
		Pla:MutatieKG = 0
		Pla:MutatiePallets = 0

		CLEAR(Mut:Record)
		Mut:PlanningID = Pla:PlanningID
		SET(Mut:Mutatie_FK02, Mut:Mutatie_FK02)
		LOOP UNTIL Access:Mutatie.Next()
			IF Mut:PlanningID <> Pla:PlanningID THEN BREAK.
			
			IF Pla:InkoopID > 0 THEN
				Pla:MutatieKG += Mut:InslagKG
				Pla:MutatiePallets += Mut:InslagPallet
			ELSIF Pla:VerkoopID > 0 THEN
				Pla:MutatieKG += Mut:UitslagKG
				Pla:MutatiePallets += Mut:UitslagPallet
			ELSE
				! Overboeking (Inslag = Uitslag)
				Pla:MutatieKG += Mut:InslagKG
				Pla:MutatiePallets += Mut:InslagPallet
			END
        END
        IF Pla:MutatieKG <>0 OR PLA:MutatiePallets<>0
            Pla:MutatieGemaakt = TRUE
        END
        
	    IF NOT (SAV:MutatieKG = Pla:MutatieKG AND SAV:MutatiePallets = Pla:MutatiePallets AND SAV:MutatieGemaakt = Pla:MutatieGemaakt)
            Access:Planning.Update() 
        END
    ELSE
        Message('Foutmelding :'&CLIP(ERROR())&' bij VoorraadClass.BerekenPlanningMutatieGrootte('&PRM:PlanningID&')')
	END
	
	Access:Mutatie.RestoreFile(FileID)
	Access:Mutatie.RestoreBuffer(BufferID)
	
	GLO:GebruikerLogHandelingOpmerking = ''
	
	
VoorraadClass.BepaalHuidigeVoorraad       PROCEDURE(LONG PRM:PartijID, LONG PRM:CelID)
CODE
    CLEAR(PCV:Record)
    PCV:PartijID = PRM:PartijID
    PCV:CelID = PRM:CelID
	IF (Access:PartijCelVoorraad.TryFetch(PCV:FK1_PartijCelVoorraad) = Level:Benign)
		RETURN PCV:PartijCelVoorraadKG
	ELSE
		RETURN 0
	END
    
!	CLEAR(VVPar:Record)
!	VVPar:PartijID = Mut:PartijID
!	VVPar:CelID = Mut:CelID
!	IF (Access:ViewVoorraadPartij.TryFetch(VVPar:PartijID_CelID_K) = Level:Benign)
!		RETURN VVPar:VoorraadKG
!	ELSE
!		RETURN 0
!	END
	
	
VoorraadClass.VerwijderPlanningMutaties     PROCEDURE(LONG PRM:PlanningID, BYTE PRM:TestOnly)
PartijID                                        LONG
InkoopID                                        LONG
VerkoopID                                        LONG
PlanningVerwerkt                                BYTE
CODE
    db.DebugOut('VoorraadClass.VerwijderPlanningMutaties(' & PRM:PlanningID & ', ' & PRM:TestOnly & ')')
    CLEAR(Pla:Record)
    Pla:PlanningID = PRM:PlanningID
    IF (Access:Planning.Fetch(Pla:PK_Planning) = Level:Benign)
        IF Pla:VerkoopID <> 0 THEN
			! Mutaties behorende bij een verkoop-regel zijn UITslagen.
			! Deze kunnen zonder verdere voorraad-controle worden verwijderd.
            CLEAR(Mut:Record)
            Mut:PlanningID = Pla:PlanningID
			! Controleren of de bijbehorende mutaties allemaal uitslagen zijn
            SET(Mut:Mutatie_FK02, Mut:Mutatie_FK02)
            LOOP UNTIL Access:Mutatie.Next()
                IF Mut:PlanningID <> Pla:PlanningID THEN BREAK.
                IF CLIP(Mut:SoortMutatie) <> 'UIT' THEN
                    MESSAGE('Onverwachte niet-uitslag mutatie (' & Mut:MutatieID & ', ' & Mut:SoortMutatie & ')', 'Niet-uitslag mutatie', ICON:Exclamation)
                    RETURN False
                END
            END
			
            IF NOT(PRM:TestOnly)
                CLEAR(Mut:Record)
                Mut:PlanningID = Pla:PlanningID
                SET(Mut:Mutatie_FK02, Mut:Mutatie_FK02)
                LOOP UNTIL Access:Mutatie.Next()
                    IF Mut:PlanningID <> Pla:PlanningID THEN BREAK.
					
                    db.DebugOut('VoorraadClass.VerwijderPlanningMutaties - Verwijderen UIT-mutaties (' & MUT:MutatieID & ', ' & MUT:PlanningID & ')')
                    Access:Mutatie.DeleteRecord(0)
                END
                Pla:MutatieGemaakt = 0
                Pla:Verwerkt = 0
                Pla:Gewogen = 0
                Pla:MutatieKG = 0 
                Pla:MutatiePallets = 0
                Access:Planning.Update()
            END
            PlanningVerwerkt=FALSE
            VERKOOPID=Pla:VerkoopID
            Clear(PLA:Record)
            Pla:VerkoopID=VerkoopID
            Set(Pla:Planning_FK02,Pla:Planning_FK02)
            Loop Until Access:Planning.Next()
                IF NOT Pla:InkoopID=VERkoopID THEN BREAK.
                IF (Pla:Verwerkt)
                    PlanningVerwerkt=TRUE
                    Break
                END    
            END
            Clear(Ver2:Record)
            Ver2:VerkoopID=VerkoopID
            IF Access:Verkoop.Fetch(Ver2:PK_Verkoop)=Level:Benign
                IF Ver2:Verwerkt<>PlanningVerwerkt
                    Ver2:Verwerkt=PlanningVerwerkt
                    Access:Verkoop.Update()
                END
            END

            RETURN True
        ELSIF Pla:InkoopID <> 0 THEN
			! Controleren of de bijbehorende mutaties allemaal inslagen zijn
            PartijID = -1
			! Mutaties behorende bij een inkoop-regel zijn INslagen.
			! Deze kunnen zonder verdere voorraad-controle worden verwijderd.
            CLEAR(Mut:Record)
            Mut:PlanningID = Pla:PlanningID
            SET(Mut:Mutatie_FK02, Mut:Mutatie_FK02)
            LOOP UNTIL Access:Mutatie.Next()
                IF Mut:PlanningID <> Pla:PlanningID THEN BREAK.
                IF CLIP(Mut:SoortMutatie) <> 'IN'  AND CLIP(Mut:SoortMutatie) <> 'EIN' THEN
                    MESSAGE('Onverwachte niet-inslag mutatie (' & Mut:MutatieID & ', ' & Mut:SoortMutatie & ')', 'Niet-uitslag mutatie', ICON:Exclamation)
                    RETURN False
                END
                IF PartijID = -1 THEN
                    PartijID = Mut:PartijID
                ELSE
                    IF PartijID <> Mut:PartijID THEN
                        MESSAGE('Onverwachte inslag-mutatie van een andere partij ('& PartijID & ') i.p.v. (' & Mut:PartijID & ')', 'Onverwachte Partijnummer', ICON:Exclamation)
                    END
                END
            END
            IF PartijID <> -1 THEN
                IF PartijID<>0          ! toegoeved 13-1-2020
				! Controleren of er nog andere mutaties zijn met de ingeslagen partij, dan deze inslagen
                    CLEAR(Mut:Record)
                    Mut:PartijID = PartijID
                    SET(Mut:Mutatie_FK01, Mut:Mutatie_FK01)
                    LOOP UNTIL Access:Mutatie.Next()
                        IF Mut:PartijID <> PartijID THEN BREAK.
                        IF Mut:PlanningID = Pla:PlanningID THEN CYCLE.
                        MESSAGE('Er zijn nog mutaties uitgevoerd met de ingeslagen partij ' & PartijID & '. De inslag-mutaties kunnen daarom niet verwijderd worden.', 'Partij al gemuteerd', ICON:Exclamation)
                        RETURN False
                    END
                END
                ! Nu kijken of de verwerkt flag van de inkoop teruggedraaid moet worden
                PlanningVerwerkt=FALSE
                INKOOPID=Pla:InkoopID
                Clear(PLA:Record)
                Pla:InkoopID=InkoopID
                Set(Pla:Planning_FK01,Pla:Planning_FK01)
                Loop Until Access:Planning.Next()
                    IF NOT Pla:InkoopID=InkoopID THEN BREAK.
                    IF (Pla:Verwerkt)
                        PlanningVerwerkt=FALSE
                        Break
                    END    
                END
                Clear(INK:Record)
                Ink:InkoopID=InkoopID
                IF Access:Inkoop.Fetch(Ink:PK_Inkoop)=Level:Benign
                    IF Ink:Verwerkt<>PlanningVerwerkt
                        Ink:Verwerkt=PlanningVerwerkt
                        Access:Inkoop.Update()
                    END
                END
                
                IF NOT(PRM:TestOnly)
                    CLEAR(Mut:Record)
                    Mut:PlanningID = Pla:PlanningID
                    SET(Mut:Mutatie_FK02, Mut:Mutatie_FK02)
                    LOOP UNTIL Access:Mutatie.Next()
                        IF Mut:PlanningID <> Pla:PlanningID THEN BREAK.
                        db.DebugOut('VoorraadClass.VerwijderPlanningMutaties - Verwijderen IN-mutaties (' & MUT:MutatieID & ', ' & MUT:PlanningID & ')')
                        Access:Mutatie.DeleteRecord(0)
                    END
                END
            END
				
            IF NOT(PRM:TestOnly)
                Pla:MutatieGemaakt = 0
                Pla:Verwerkt = 0
                Pla:Gewogen = 0
                Pla:MutatieKG = 0
                Pla:MutatiePallets = 0
                Access:Planning.Update()
            END
        ELSE
            MESSAGE('VoorraadClass.VerwijderPlanningMutaties ondersteunt alleen inkopen / verkopen')
            RETURN False
        END
    ELSE
        RETURN False
    END
	
	
	
	
VoorraadClass.VerwijderVerkoopMutaties      PROCEDURE(LONG PRM:VerkoopID, BYTE PRM:TestOnly)
GeenFouten BYTE
CODE
	CLEAR(Ver2:Record)
	Ver2:VerkoopID = PRM:VerkoopID
	IF (Access:Verkoop.Fetch(Ver2:PK_Verkoop) = Level:Benign) THEN
		GeenFouten = True
		
		CLEAR(Pla:Record)
		Pla:VerkoopID = Ver2:VerkoopID
		SET(Pla:Planning_FK02, Pla:Planning_FK02)
		LOOP UNTIL Access:Planning.Next()
			IF Pla:VerkoopID <> Ver2:VerkoopID THEN BREAK.
			GeenFouten = SELF.VerwijderPlanningMutaties(Pla:PlanningID, 1)
			IF NOT(GeenFouten) THEN BREAK.
		END
		
		IF GeenFouten AND NOT(PRM:TestOnly)
			CLEAR(Pla:Record)
			Pla:VerkoopID = Ver2:VerkoopID
			SET(Pla:Planning_FK02, Pla:Planning_FK02)
			LOOP UNTIL Access:Planning.Next()
				IF Pla:VerkoopID <> Ver2:VerkoopID THEN BREAK.
				SELF.VerwijderPlanningMutaties(Pla:PlanningID)
			END
			
			RETURN True
		ELSE
			RETURN GeenFouten
		END
	ELSE
		RETURN False
	END
VoorraadClass.VerwijderInkoopMutaties       PROCEDURE(LONG PRM:InkoopID, BYTE PRM:TestOnly)
GeenFouten BYTE
CODE
	CLEAR(Ink:Record)
	Ink:InkoopID = PRM:InkoopID
	IF (Access:Inkoop.Fetch(Ink:PK_Inkoop) = Level:Benign) THEN
		GeenFouten = True
		
		CLEAR(Pla:Record)
		Pla:InkoopID = Ink:InkoopID
		SET(Pla:Planning_FK01, Pla:Planning_FK01)
		LOOP UNTIL Access:Planning.Next()
			IF Pla:InkoopID <> Ink:InkoopID THEN BREAK.
			GeenFouten = SELF.VerwijderPlanningMutaties(Pla:PlanningID, 1)
			IF NOT(GeenFouten) THEN BREAK.
		END
		
		IF GeenFouten AND NOT(PRM:TestOnly)
			CLEAR(Pla:Record)
			Pla:InkoopID = Ink:InkoopID
			SET(Pla:Planning_FK01, Pla:Planning_FK01)
			LOOP UNTIL Access:Planning.Next()
				IF Pla:InkoopID <> Ink:InkoopID THEN BREAK.
				
				SELF.VerwijderPlanningMutaties(Pla:PlanningID)
			END
			
			RETURN True
		ELSE
			RETURN GeenFouten
		END
	ELSE
		RETURN False
	END
VoorraadClass.BerekenPartijInkoopPrijs      PROCEDURE(<LONG PRM:PartijID>)
TotaalKG                                        DECIMAL(11,2)
PartijKG                                        DECIMAL(11,2)
PartijKGPrijs                                   DECIMAL(12,3)
PlanningKG                                      DECIMAL(11,2)

SavedInkoopBuffer                               USHORT
SavedInkoopFile                                 USHORT
CODE
    db.DebugOut('VoorraadClass.BerekenPartijInkoopPrijs :'&PRM:PartijID)
	GLO:GebruikerLogHandelingOpmerking = 'VoorraadClass.BerekenPartijInkoopPrijs'
	
	SavedInkoopBuffer = Access:Inkoop.SaveBuffer()
	SavedInkoopFile = Access:Inkoop.SaveFile()
	
	IF NOT(OMITTED(2)) THEN
		CLEAR(Par:Record)
		Par:PartijID = PRM:PartijID
		IF (Access:Partij.Fetch(Par:Partij_PK) <> Level:Benign) THEN RETURN.
	END

	TotaalKG = 0
	PartijKG = 0
	
	CLEAR(Ink:Record)
	Ink:InkoopID = Par:InkoopID
	IF (Access:Inkoop.Fetch(Ink:PK_Inkoop) = Level:Benign) THEN
		! Alle planning-regels van de inkoop doorlopen
		CLEAR(Pla:Record)
		Pla:InkoopID = Ink:InkoopID
		SET(Pla:Planning_FK01, Pla:Planning_FK01)
		LOOP UNTIL Access:Planning.Next()
			IF Pla:InkoopID <> Ink:InkoopID THEN BREAK.
			
			! Bepaal KG's op basis van de mutatie indien mogelijk / anders op basis van de planning
			PlanningKG = 0
			
			CLEAR(Mut:Record)
			Mut:PlanningID = Pla:PlanningID
			SET(Mut:Mutatie_FK02, Mut:Mutatie_FK02)
			LOOP UNTIL Access:Mutatie.Next()
				IF Mut:PlanningID <> Pla:PlanningID THEN BREAK.
				PlanningKG += Mut:InslagKG
			END
			
			IF PlanningKG = 0 THEN
				PlanningKG = Pla:KG
			END
			
			!db.DebugOut('BerekenInkoopPrijs - Planning: ' & PlanningKG & ', ' & Pla:InkoopID & '=' & Par:InkoopPlanningID)
			
			TotaalKG += PlanningKG
			IF Pla:PlanningID = Par:InkoopPlanningID THEN
				PartijKG += PlanningKG
				PartijKGPrijs = Pla:InkoopKGPrijs
			END
		END
		
		Par:InkoopKGPrijs = PartijKGPrijs
		Par:BerekendeInkoopKGPrijs = PartijKGPrijs + ((Ink:ExtraKosten + Ink:TransportKosten)/ TotaalKG)
		db.DebugOut('BerekenInkoopPrijs: ' & Par:BerekendeInkoopKGPrijs & ', ' & Ink:ExtraKosten & ', ' & Ink:TransportKosten & ', ' & TotaalKG & ', ' & PartijKG & ', ' & PartijKGPrijs)
	ELSE
		Par:InkoopKGPrijs = 0
		Par:BerekendeInkoopKGPrijs = 0
	END
	
	IF NOT(OMITTED(2)) THEN
		Access:Partij.Update()
	END
	
	Access:Inkoop.RestoreBuffer(SavedInkoopBuffer)
	Access:Inkoop.RestoreFile(SavedInkoopFile)
	
	GLO:GebruikerLogHandelingOpmerking = ''
VoorraadClass.BerekenPartijenInkoopPrijs    PROCEDURE(<LONG PRM:InkoopID>, <LONG PRM:UitgezonderdPartij>)
SavedMutatieBuffer                              USHORT
SavedPlanningBuffer                             USHORT
SavedMutatieFile	                            USHORT
SavedPlanningFile                               USHORT
CODE
	IF NOT(OMITTED(2)) THEN
		CLEAR(Ink:Record)
		Ink:InkoopID = PRM:InkoopID
        IF (Access:Inkoop.Fetch(Ink:PK_Inkoop) <> Level:Benign) THEN 
            db.DebugOut('VoorraadClass.BerekenPartijenInkoopPrijs met Inkoop kan niet gevonden worden:'&ERROR())
            RETURN
        END    
	END
	
	! Alle planning-regels van de inkoop doorlopen
	CLEAR(Pla:Record)
	Pla:InkoopID = Ink:InkoopID
	SET(Pla:Planning_FK01, Pla:Planning_FK01)
	LOOP UNTIL Access:Planning.Next()
		IF Pla:InkoopID <> Ink:InkoopID THEN BREAK.
		
        db.DebugOut('VoorraadClass.BerekenPartijenInkoopPrijs Pla:PlanningID'&Pla:PlanningID&' inkoopid '&Pla:InkoopId)
        ! de eerste keer krijgen we errorcode()33 Record Not Available, eens kijken of ik kan testen of Mutatie bestand geopend is
		CLEAR(Mut:Record)
        Mut:PlanningID = Pla:PlanningID
		SET(Mut:Mutatie_FK02, Mut:Mutatie_FK02)
        LOOP UNTIL Access:Mutatie.Next()
			IF Mut:PlanningID <> Pla:PlanningID THEN BREAK.
			
			IF NOT(OMITTED(3)) AND PRM:UitgezonderdPartij = Mut:PartijID THEN CYCLE.
			
			SavedMutatieBuffer = Access:Mutatie.SaveBuffer()
			SavedMutatieFile = Access:Mutatie.SaveFile()
			SavedPlanningBuffer = Access:Planning.SaveBuffer()
			SavedPlanningFile = Access:Planning.SaveFile()
			SELF.BerekenPartijInkoopPrijs(Mut:PartijID)
			Access:Mutatie.RestoreBuffer(SavedMutatieBuffer)
			Access:Mutatie.RestoreFile(SavedMutatieFile)
			Access:Planning.RestoreBuffer(SavedPlanningBuffer)
			Access:Planning.RestoreFile(SavedPlanningFile)
        END
        db.DebugOut('VoorraadClass.BerekenPartijenInkoopPrijs Mutatieloop'&CLIP(ERROR())&'|'&CLIP(FileERROR()))
        
    END
VoorraadClass.ControleerCelLocatie      PROCEDURE(LONG PRM:CelID, LONG PRM:CelLocatieID)
CODE
    CLEAR(CL:Record)
    CL:CelLocatieID = PRM:CelLocatieID
    IF Access:CelLocatie.TryFetch(CL:PK_CelLocatie) = Level:Benign THEN
        IF CL:CelID <> PRM:CelID THEN
            RETURN 0
        ELSE
            RETURN PRM:CelLocatieID
        END
    ELSE
        RETURN 0
    END
        
!----------------------------------------
VoorraadClass.ResetPartijCelControle        PROCEDURE()
CODE
    db.DebugOut('VoorraadClass.ResetPartijCelControle')
    FREE(GLO:PartijCelControleQ)   
VoorraadClass.AddPartijCelControle      PROCEDURE(LONG PRM:PartijID, LONG PRM:CelID, REAL PRM:KG, REAL PRM:Pallets)
CODE
    db.DebugOut('VoorraadClass.ResetPartijCelControle')
    PCC:PartijID = PRM:PartijID
    PCC:CelID = PRM:CelID
    GET(GLO:PartijCelControleQ, +PCC:PartijID, +PCC:CelID)
    IF ERROR() THEN
        PCC:PartijID = PRM:PartijID
        PCC:CelID = PRM:CelID
        PCC:KG = PRM:KG
        PCC:Pallets = PRM:Pallets
        ADD(GLO:PartijCelControleQ, +PCC:PartijID, +PCC:CelID)
        
        db.DebugOut('VoorraadClass.ResetPartijCelControle - ADD (' & RECORDS(GLO:PartijCelControleQ))
    ELSE
        PCC:KG += PRM:KG
        PCC:Pallets += PRM:Pallets
        PUT(GLO:PartijCelControleQ, +PCC:PartijID, +PCC:CelID)
        
        db.DebugOut('VoorraadClass.ResetPartijCelControle - PUT (' & RECORDS(GLO:PartijCelControleQ))
    END
VoorraadClass.AddPartijCelControleOverboeking       PROCEDURE(LONG PRM:PartijID, LONG PRM:VanCelID, LONG PRM:NaarCelID, REAL PRM:KG, REAL PRM:Pallets)
CODE
    ! Nieuwe mutaties meenemen
    IF NOT(PRM:KG = 0 AND PRM:Pallets = 0) THEN
        ! Nieuwe OUIT-toevoegen, deze moet dus van de huidige voorraadstand worden afgetrokken.
        VoorraadClass.AddPartijCelControle(PRM:PartijID, PRM:VanCelID, -PRM:KG, -PRM:Pallets)
    
        ! Nieuwe OIN-toevoegen
        VoorraadClass.AddPartijCelControle(PRM:PartijID, PRM:NaarCelID, PRM:KG, PRM:Pallets)
    END    
    
VoorraadClass.PartijCelControleOK   PROCEDURE()
CODE
    LOOP i# = 1 TO RECORDS(GLO:PartijCelControleQ)
        GET(GLO:PartijCelControleQ, i#)
        
        CLEAR(VVPar:Record)
        VVPar:PartijID = PCC:PartijID
        VVPar:CelID = PCC:CelID
        IF (Access:ViewVoorraadPartij.Fetch(VVPar:PartijID_CelID_K) = Level:Benign) THEN
            db.DebugOut('Controle: ' & PCC:PartijID & '.' & PCC:CelID & ' = ' & VVPar:VoorraadKG & ' + ' & PCC:KG & ' / ' & VVPar:VoorraadPallets & ' + ' & PCC:Pallets)
            IF VVPar:VoorraadKG + PCC:KG < 0 THEN
                RETURN CLIP('Negatieve voorraad van ' & CLIP(LEFT(FORMAT(VVPar:VoorraadKG + PCC:KG, @n-12`2))) & ' KG voor partij/cel ' & CLIP(PCC:PartijID) & '.' & CLIP(PCC:CelID))
            END
            
            ! Pallet-standen negeren
            !IF VVPar:VoorraadPallets + PCC:Pallets < 0 THEN
            !    RETURN CLIP('Negatieve voorraad van ' & CLIP(LEFT(FORMAT(VVPar:VoorraadPallets + PCC:Pallets, @n_10))) & ' pallets voor partij/cel ' & CLIP(PCC:PartijID) & '.' & CLIP(PCC:CelID))
            !END
        ELSE
            errorcode# = ERRORCODE()

            db.DebugOut('Controle: ' & PCC:PartijID & '.' & PCC:CelID & ' = ' & PCC:KG & ' / ' & PCC:Pallets)
            
            IF errorcode# = 35 THEN! File Not Found
                IF PCC:KG < 0 THEN
                    RETURN CLIP('Negatieve voorraad van ' & CLIP(LEFT(FORMAT(PCC:KG, @n-12`2))) & ' KG voor partij/cel ' & CLIP(PCC:PartijID) & '.' & CLIP(PCC:CelID))
                END
                
                ! Pallet-standen negeren
                !IF PCC:Pallets < 0 THEN
                !    RETURN CLIP('Negatieve voorraad van ' & CLIP(LEFT(FORMAT(PCC:Pallets, @n_10))) & ' pallets voor partij/cel ' & CLIP(PCC:PartijID) & '.' & CLIP(PCC:CelID))
                !END
            ELSE
                RETURN CLIP('Onverwachte fout ' & CLIP(errorcode#) & ' in VoorraadClass.PartijCelControleOK op bestand ViewVoorraadPartij')
            END
        END
    END
    
    RETURN ''
