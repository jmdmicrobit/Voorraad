!--------------------------------------------------------------------
! APPLICATION:  VoorrDct.APP   
! PROCEDURE:    CachingClassSource
! INC file:     CachingClassSrc.inc
!--------------------------------------------------------------------

CachingClass.GetVerkoopArtikelen PROCEDURE(LONG PRM:VerkoopID)
SQLFile                                 &File
SQLGroup 								&GROUP
SQLField                                ANY
LastVerkoopID                           LONG
Artikelen								CSTRING(512)
CODE
    IF RECORDS(VerkoopArtikelQueue) = 0 THEN
        timingmeting# = CLOCK()
		SQLFile &= NEW(File)

		SQLFile{Prop:Driver}='MSSQL'
		SQLFile{Prop:DriverString}='/BUSYHANDLING=2'
		SQLFile{Prop:Owner}=GLO:Owner
		SQLFile{Prop:Sql}='SELECT Planning.VerkoopID, Planning.KG, ViewArtikel.ArtikelOms, Planning.MutatieGemaakt, Planning.MutatieKG '&|
			'FROM Planning INNER JOIN ViewArtikel ON ViewArtikel.ArtikelID = Planning.ArtikelID '&|
			'WHERE Planning.VerkoopID > 0 ORDER BY Planning.VerkoopID, Planning.PlanningID'

		LastVerkoopID = -1
		LaatsteRecord# = 0
		
		FIXFORMAT(SQLFile)	
		IF ERROR() THEN STOP(ERROR()&' bij de fixformat').
		SQLGroup &= SQLFile{Prop:Record}
		
		LOOP
			Next(SQLFile)
			IF ERROR() THEN LaatsteRecord# = 1.
			
			
			SQLField &= WHAT(SQLGroup,1)
			IF (LastVerkoopID <> SQLField OR LaatsteRecord#) THEN
				IF LastVerkoopID <> -1 THEN
					VAQ:VerkoopID = LastVerkoopID
					VAQ:Artikelen = Artikelen
					ADD(VerkoopArtikelQueue, +VAQ:VerkoopID)
				END
				
				IF LaatsteRecord# THEN
					BREAK
				ELSE
					LastVerkoopID = SQLField
					
					SQLField &= WHAT(SQLGroup,4) ! Pla:MutatieGemaakt
					IF SQLField = 1 THEN
						SQLField &= WHAT(SQLGroup,5)
					ELSE
						SQLField &= WHAT(SQLGroup,2)
					END
					Artikelen = CLIP(LEFT(FORMAT(SQLField,@n-12_`2))) & ' kg'
					SQLField &= WHAT(SQLGroup,3)
					Artikelen = CLIP(Artikelen) & ' ' & CLIP(SQLField)
				END
			ELSE
				SQLField &= WHAT(SQLGroup,4) ! Pla:MutatieGemaakt
				IF SQLField = 1 THEN
					SQLField &= WHAT(SQLGroup,5)
				ELSE
					SQLField &= WHAT(SQLGroup,2)
				END
				Artikelen = CLIP(Artikelen) & ' | ' & CLIP(LEFT(FORMAT(SQLField,@n-12_`2))) & ' kg'
				SQLField &= WHAT(SQLGroup,3)
				Artikelen = CLIP(Artikelen) & ' ' & CLIP(SQLField)
			END
		END	
		
		CLOSE(SQLFile)
		IF ERROR() THEN STOP(ERROR()&' bij de close').
		DISPOSE(SQLFile)
        IF ERROR() THEN STOP(ERROR()&' bij de dispose').
        
        GLO:TimingMeting[1] = CLOCK() - timingmeting#
        GlobalClass.RefreshTiming()
    END

	VAQ:VerkoopID = PRM:VerkoopID
	GET(VerkoopArtikelQueue, +VAQ:VerkoopID)
	IF NOT(ERROR()) THEN
		RETURN CLIP(VAQ:Artikelen)
	ELSE
		RETURN ''
	END

CachingClass.GetInkoopArtikelen PROCEDURE(LONG PRM:InkoopID)
SQLFile                                 &File
SQLGroup 								&GROUP
SQLField                                ANY
LastInkoopID                           LONG
Artikelen								CSTRING(512)
CODE
    IF RECORDS(InkoopArtikelQueue) = 0 THEN
        timingmeting# = CLOCK()
        
		SQLFile &= NEW(File)

		SQLFile{Prop:Driver}='MSSQL'
		SQLFile{Prop:DriverString}='/BUSYHANDLING=2'
		SQLFile{Prop:Owner}=GLO:Owner
		SQLFile{Prop:Sql}='SELECT Planning.InkoopID, Planning.KG, ViewArtikel.ArtikelOms, Planning.MutatieGemaakt, Planning.MutatieKG '&|
			'FROM Planning INNER JOIN ViewArtikel ON ViewArtikel.ArtikelID = Planning.ArtikelID '&|
			'WHERE Planning.InkoopID > 0 ORDER BY Planning.InkoopID, Planning.PlanningID'

		LastInkoopID = -1
		LaatsteRecord# = 0
		
		FIXFORMAT(SQLFile)
		IF ERROR() THEN STOP(ERROR()&' bij de fixformat').
		SQLGroup &= SQLFile{Prop:Record}
		
		LOOP
			Next(SQLFile)
			IF ERROR() THEN LaatsteRecord# = 1.
			
			SQLField &= WHAT(SQLGroup,1)
			IF (LastInkoopID <> SQLField OR LaatsteRecord#) THEN
				IF LastInkoopID <> -1 THEN
					IAQ:InkoopID = LastInkoopID
					IAQ:Artikelen = Artikelen
					ADD(InkoopArtikelQueue, +IAQ:InkoopID)
				END
				
				IF LaatsteRecord# THEN
					BREAK
				ELSE
					LastInkoopID = SQLField
					SQLField &= WHAT(SQLGroup,4) ! Pla:MutatieGemaakt
					IF SQLField = 1 THEN
						SQLField &= WHAT(SQLGroup,5)
					ELSE
						SQLField &= WHAT(SQLGroup,2)
					END
					
					Artikelen = CLIP(LEFT(FORMAT(SQLField,@n-12_`2))) & ' kg'
					SQLField &= WHAT(SQLGroup,3)
					Artikelen = CLIP(Artikelen) & ' ' & CLIP(SQLField)
				END
			ELSE
				SQLField &= WHAT(SQLGroup,4) ! Pla:MutatieGemaakt
				IF SQLField = 1 THEN
					SQLField &= WHAT(SQLGroup,5)
				ELSE
					SQLField &= WHAT(SQLGroup,2)
				END
				Artikelen = CLIP(Artikelen) & ' | ' & CLIP(LEFT(FORMAT(SQLField,@n-12_`2))) & ' kg'
				SQLField &= WHAT(SQLGroup,3)
				Artikelen = CLIP(Artikelen) & ' ' & CLIP(SQLField)
			END
		END	
		
		CLOSE(SQLFile)
		IF ERROR() THEN STOP(ERROR()&' bij de close').
		DISPOSE(SQLFile)
        IF ERROR() THEN STOP(ERROR()&' bij de dispose').
        
        GLO:TimingMeting[2] = CLOCK() - timingmeting#
        GlobalClass.RefreshTiming()
	END

	IAQ:InkoopID = PRM:InkoopID
	GET(InkoopArtikelQueue, +IAQ:InkoopID)
	IF NOT(ERROR()) THEN
		RETURN CLIP(IAQ:Artikelen)
	ELSE
		RETURN ''
	END

CachingClass.GetCelLocatieNaam PROCEDURE(LONG PRM:PartijID, LONG PRM:CelID)
CODE
    IF RECORDS(CelLocatieQueue)=0
        !timingmeting# = CLOCK()
        
		BUFFER(ViewPartijCelLocaties,5000)
		CLEAR(VPCL:Record)	
		SET(VPCL:ViewPartijCelLocaties_PK,VPCL:ViewPartijCelLocaties_PK)
		Loop Until Access:ViewPartijCelLocaties.Next()
			CLQ:PartijID=VPCL:PartijID
			CLQ:CelID=VPCL:CELID
			GET(CelLocatieQueue,+CLQ:PartijID,+CLQ:CelID)
			IF ERROR()
				CLQ:PartijID=VPCL:PartijID
				CLQ:CelID=VPCL:CELID
				if CLIP(VPCL:CelLocatienaam) = ''
					CLQ:LocatieNaam='?'
				ELSE
					CLQ:LocatieNaam=VPCL:CelLocatienaam 
				END			
				ADD(CelLocatieQueue,+CLQ:PartijID,+CLQ:CelID)
			ELSE
				if CLIP(VPCL:CelLocatienaam) = ''
					! Controle of er een vraagteken in staat
					IF INSTRING('?',CLIP(CLQ:LocatieNaam),1,1)=0 ! Not Found
						CLQ:LocatieNaam = CLIP(CLQ:LocatieNaam) & ', ?' 
					END	
				ELSE
					CLQ:LocatieNaam = CLIP(CLQ:LocatieNaam) & ', ' & CLIP(VPCL:CelLocatienaam)
				END	
				PUT(CelLocatieQueue)
			END
        END	
        
        FLUSH(ViewPartijCelLocaties)
		
		Loop i#=1 to Records(CelLocatieQueue)
			GET(CelLocatieQueue,i#)
			IF CLQ:LocatieNaam='?' THEN 
				!Clear(CLQ:LocatieNaam)
                CLQ:LocatieNaam = ''
				PUT(CelLocatieQueue)
			END
        END	
        
        !GLO:TimingMeting[3] = CLOCK() - timingmeting#
        !GlobalClass.RefreshTiming()
	END

	CLQ:PartijID=PRM:PartijID
	CLQ:CelID=PRM:CELID
	GET(CelLocatieQueue,+CLQ:PartijID,+CLQ:CelID)
	IF ERROR()
		Return('')
	ELSE
		Return(CLIP(CLQ:LocatieNaam))
	END
