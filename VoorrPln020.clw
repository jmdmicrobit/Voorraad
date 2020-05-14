

   MEMBER('VoorrPln.clw')                                  ! This is a MEMBER module


   INCLUDE('ABDROPS.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('VOORRPLN020.INC'),ONCE        !Local module procedure declarations
                     END


!!! <summary>
!!! Generated from procedure template - Window
!!! </summary>
WindowInslag PROCEDURE 

Loc:FirmaNaam        CSTRING(51)                           ! 
Loc:ArtikelOmschrijving CSTRING(51)                        ! 
Loc:VerpakkingsOmschrijving CSTRING(51)                    ! 
LOC:CelID1           LONG                                  ! 
LOC:CelLocatieID1    LONG                                  ! 
LOC:CelID2           LONG                                  ! 
LOC:CelLocatieID2    LONG                                  ! 
LOC:CelID3           LONG                                  ! 
LOC:CelLocatieID3    LONG                                  ! 
LOC:CelID4           LONG                                  ! 
LOC:CelLocatieID4    LONG                                  ! 
LOC:KG1              DECIMAL(10,2)                         ! 
LOC:KG2              DECIMAL(10,2)                         ! 
LOC:KG3              DECIMAL(10,2)                         ! 
LOC:KG4              DECIMAL(10,2)                         ! 
LOC:KGTeller         DECIMAL(10,2)                         ! 
LOC:Pallets1         LONG                                  ! 
LOC:Pallets2         LONG                                  ! 
LOC:Pallets3         LONG                                  ! 
LOC:Pallets4         LONG                                  ! 
LOC:PalletsTeller    LONG                                  ! 
ActionMessage        CSTRING(40)                           ! 
LOC:KGBalans         STRING(20)                            ! 
LOC:PalletsBalans    STRING(20)                            ! 
LOC:NegatieveVoorraad BYTE                                 ! 
LOC:SavedPartijBuffer USHORT                               ! 
LOC:SavedPartijFile  USHORT                                ! 
FDCB1::View:FileDropCombo VIEW(Relatie)
                       PROJECT(Rel:FirmaNaam)
                       PROJECT(Rel:Type)
                     END
FDCB3::View:FileDropCombo VIEW(Verpakking)
                       PROJECT(Ver:VerpakkingOmschrijving)
                     END
FDCB5::View:FileDropCombo VIEW(Cel)
                       PROJECT(CEL:CelOms)
                       PROJECT(CEL:CelID)
                     END
FDCB8::View:FileDropCombo VIEW(ACel)
                       PROJECT(ACel:CelOms)
                       PROJECT(ACel:CelID)
                     END
FDCB9::View:FileDropCombo VIEW(AACel)
                       PROJECT(AACel:CelOms)
                       PROJECT(AACel:CelID)
                     END
FDCB7::View:FileDropCombo VIEW(AAACel)
                       PROJECT(AAACel:CelOms)
                       PROJECT(AAACel:CelID)
                     END
FDCB10::View:FileDropCombo VIEW(ViewArtikel)
                       PROJECT(Art:ArtikelOms)
                     END
FDCB11::View:FileDropCombo VIEW(CelLocatie)
                       PROJECT(CL:Locatienaam)
                       PROJECT(CL:CelLocatieID)
                     END
FDCB12::View:FileDropCombo VIEW(ACelLocatie)
                       PROJECT(ACL:Locatienaam)
                       PROJECT(ACL:CelLocatieID)
                     END
FDCB13::View:FileDropCombo VIEW(AACelLocatie)
                       PROJECT(AACL:Locatienaam)
                       PROJECT(AACL:CelLocatieID)
                     END
FDCB14::View:FileDropCombo VIEW(AAAACelLocatie)
                       PROJECT(AAAACL:Locatienaam)
                       PROJECT(AAAACL:CelLocatieID)
                     END
Queue:FileDropCombo  QUEUE                            !
Rel:FirmaNaam          LIKE(Rel:FirmaNaam)            !List box control field - type derived from field
Rel:Type               LIKE(Rel:Type)                 !Browse hot field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
Queue:FileDropCombo:2 QUEUE                           !
Ver:VerpakkingOmschrijving LIKE(Ver:VerpakkingOmschrijving) !List box control field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
Queue:FileDropCombo:3 QUEUE                           !
CEL:CelOms             LIKE(CEL:CelOms)               !List box control field - type derived from field
CEL:CelID              LIKE(CEL:CelID)                !Primary key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
Queue:FileDropCombo:4 QUEUE                           !
ACel:CelOms            LIKE(ACel:CelOms)              !List box control field - type derived from field
ACel:CelID             LIKE(ACel:CelID)               !Primary key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
Queue:FileDropCombo:5 QUEUE                           !
AACel:CelOms           LIKE(AACel:CelOms)             !List box control field - type derived from field
AACel:CelID            LIKE(AACel:CelID)              !Primary key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
Queue:FileDropCombo:6 QUEUE                           !
AAACel:CelOms          LIKE(AAACel:CelOms)            !List box control field - type derived from field
AAACel:CelID           LIKE(AAACel:CelID)             !Primary key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
Queue:FileDropCombo:7 QUEUE                           !
Art:ArtikelOms         LIKE(Art:ArtikelOms)           !List box control field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
Queue:FileDropCombo:1 QUEUE                           !
CL:Locatienaam         LIKE(CL:Locatienaam)           !List box control field - type derived from field
CL:CelLocatieID        LIKE(CL:CelLocatieID)          !Primary key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
Queue:FileDropCombo:8 QUEUE                           !
ACL:Locatienaam        LIKE(ACL:Locatienaam)          !List box control field - type derived from field
ACL:CelLocatieID       LIKE(ACL:CelLocatieID)         !Primary key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
Queue:FileDropCombo:9 QUEUE                           !
AACL:Locatienaam       LIKE(AACL:Locatienaam)         !List box control field - type derived from field
AACL:CelLocatieID      LIKE(AACL:CelLocatieID)        !Primary key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
Queue:FileDropCombo:10 QUEUE                          !
AAAACL:Locatienaam     LIKE(AAAACL:Locatienaam)       !List box control field - type derived from field
AAAACL:CelLocatieID    LIKE(AAAACL:CelLocatieID)      !Primary key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
LocEnableEnterByTab  BYTE(1)                               !Used by the ENTER Instead of Tab template
EnterByTabManager    EnterByTabClass
Window               WINDOW('Inslaan Partij'),AT(,,493,387),FONT('MS Sans Serif',8),ICON('WAOK.ICO'),GRAY,MDI,SYSTEM,IMM
                       PROMPT('Referentie:'),AT(7,66),USE(?Par:Referentie:Prompt)
                       ENTRY(@s50),AT(76,65,205,10),USE(Par:Referentie)
                       PROMPT('Extern Partijnr:'),AT(7,82),USE(?Par:ExternPartijnr:Prompt),RIGHT
                       ENTRY(@s20),AT(76,81,83,10),USE(Par:ExternPartijnr)
                       PROMPT('Hoeveelheid (kg)'),AT(174,95),USE(?Loc:Hoeveelheid:Prompt),RIGHT
                       ENTRY(@n12_`2),AT(170,108,60,10),USE(Par:KG),RIGHT(2),REQ
                       PROMPT('Aantal Pallets:'),AT(246,95),USE(?Loc:AantalPallets:Prompt),RIGHT
                       ENTRY(@n14.),AT(238,108,60,10),USE(Par:Pallets),RIGHT(2),REQ
                       STRING('Totaal:'),AT(75,106),USE(?STRING1)
                       COMBO(@s50),AT(75,127,84,10),USE(CEL:CelOms),DROP(15),FORMAT('200L(2)~Cel~@s50@'),FROM(Queue:FileDropCombo:3), |
  IMM,REQ
                       COMBO(@s50),AT(75,140,,10),USE(CL:Locatienaam),VSCROLL,DROP(5),FORMAT('200L(2)|M~Locati' & |
  'enaam~L(0)@s50@'),FROM(Queue:FileDropCombo:1),IMM
                       ENTRY(@n12_`2),AT(170,127,60,10),USE(LOC:KG1),RIGHT(2)
                       ENTRY(@n14.),AT(238,127,60,10),USE(LOC:Pallets1),RIGHT(2)
                       COMBO(@s50),AT(75,153,84,10),USE(ACel:CelOms),DROP(15),FORMAT('200L(2)|M~Cel~@s50@'),FROM(Queue:FileDropCombo:4), |
  IMM
                       COMBO(@s50),AT(75,164,,10),USE(ACL:Locatienaam),VSCROLL,DROP(5),FORMAT('200L(2)|M~Locat' & |
  'ienaam~L(0)@s50@'),FROM(Queue:FileDropCombo:8),IMM
                       ENTRY(@n12_`2),AT(170,153,60,10),USE(LOC:KG2),RIGHT(2)
                       ENTRY(@n14.),AT(238,153,60,10),USE(LOC:Pallets2),RIGHT(2)
                       COMBO(@s50),AT(75,177,84,10),USE(AACel:CelOms),DROP(15),FORMAT('200L(2)|M~Cel~@s50@'),FROM(Queue:FileDropCombo:5), |
  IMM
                       COMBO(@s50),AT(75,189,,10),USE(AACL:Locatienaam),VSCROLL,DROP(5),FORMAT('200L(2)|M~Loca' & |
  'tienaam~@s50@'),FROM(Queue:FileDropCombo:9),IMM
                       ENTRY(@n12_`2),AT(170,177,60,10),USE(LOC:KG3),RIGHT(2)
                       ENTRY(@n14.),AT(238,177,60,10),USE(LOC:Pallets3),RIGHT(2)
                       COMBO(@s20),AT(75,201,84,10),USE(AAACel:CelOms),DROP(15),FORMAT('200L(2)|M~Cel~@s50@'),FROM(Queue:FileDropCombo:6), |
  IMM
                       COMBO(@s50),AT(75,214,,10),USE(AAAACL:Locatienaam),VSCROLL,DROP(5),FORMAT('200L(2)|M~Lo' & |
  'catienaam~L(0)@s50@'),FROM(Queue:FileDropCombo:10),IMM
                       ENTRY(@n12_`2),AT(170,201,60,10),USE(LOC:KG4),RIGHT(2)
                       ENTRY(@n14.),AT(238,201,60,10),USE(LOC:Pallets4),RIGHT(2)
                       PROMPT('Aanmaakdatum:'),AT(7,6),USE(?PROMPT4)
                       BUTTON('OK'),AT(195,351,47,14),USE(?OKButton),LEFT,ICON('WAOK.ICO'),DEFAULT,REQ
                       BUTTON('&Annuleer'),AT(244,351,52,14),USE(?CancelButton),LEFT,ICON('WACancel.ico'),STD(STD:Close)
                       PROMPT('Aanmaak Datum DATE:'),AT(86,7,0,0),USE(?Par:AanmaakDatum_DATE:Prompt)
                       ENTRY(@d6-),AT(76,6,53,9),USE(Par:AanmaakDatum_DATE),RIGHT
                       PROMPT('Aanmaak Datum TIME:'),AT(201,5,0,0),USE(?Par:AanmaakDatum_TIME:Prompt)
                       ENTRY(@t7),AT(141,6,31,9),USE(Par:AanmaakDatum_TIME),RIGHT
                       COMBO(@s50),AT(76,50,205,10),USE(Rel:FirmaNaam),DROP(25),FORMAT('200L(2)~Firmanaam~@s50@'), |
  FROM(Queue:FileDropCombo),IMM,REQ
                       COMBO(@s50),AT(76,35,205,10),USE(Ver:VerpakkingOmschrijving),DROP(25),FORMAT('200L(2)~Ve' & |
  'rpakking~@s50@'),FROM(Queue:FileDropCombo:2),IMM,REQ
                       COMBO(@s60),AT(76,20,205,10),USE(Art:ArtikelOms,,?Art:ArtikelOms:2),DROP(5),FORMAT('240L(2)|M~' & |
  'Artikel Oms~L(0)@s60@'),FROM(Queue:FileDropCombo:7),IMM
                       PROMPT('Leverancier:<0DH,0AH>'),AT(7,50,65),USE(?PROMPT1)
                       PROMPT('Verpakking:'),AT(7,34),USE(?PROMPT3)
                       PROMPT('Artikel:'),AT(7,21),USE(?PROMPT2)
                       STRING('BalansKG'),AT(167,225,61),USE(?KGBalans),RIGHT
                       STRING('BalansPallets'),AT(236,225,61),USE(?PalletsBalans),RIGHT
                       STRING(@N_10),AT(255,5),USE(Par:PartijID)
                       PROMPT('Partij-nummer:'),AT(206,5),USE(?PROMPT5)
                       GROUP('Kwaliteit'),AT(308,1,176,386),USE(?GROUP1),BOXED
                         CHECK('Is transportmiddel schoon?'),AT(313,12),USE(Par:InslagQATransportmiddelSchoon),VALUE('1', |
  '0')
                         CHECK('Is verpakking schoon en gesloten?'),AT(313,25),USE(Par:InslagQAVerpakkingSchoonGesloten), |
  VALUE('1','0')
                         CHECK('Identificatie merken aanwezig op verpakkingen?'),AT(313,37,167),USE(Par:InslagQAIdentificatieMerkenVerpakking), |
  VALUE('1','0')
                         CHECK('Is geur kleur producteigen?'),AT(313,49),USE(Par:InslagQAIsGeurKleurProductEigen)
                         CHECK('Geen glasbreuk?'),AT(313,61),USE(Par:InslagQAGeenGlasbreuk)
                         PROMPT('Behandeld door:'),AT(315,74),USE(?PROMPT6)
                         ENTRY(@s40),AT(371,74,108,10),USE(Par:InslagQAUitgevoerdDoor)
                         PROMPT('Gemeten temperaturen:'),AT(314,86),USE(?Par:InslagQATemperatuur1:Prompt)
                         ENTRY(@s20),AT(315,97,50,10),USE(Par:InslagQATemperatuur1),LEFT(2)
                         ENTRY(@s20),AT(371,97,50,10),USE(Par:InslagQATemperatuur2)
                         ENTRY(@s20),AT(430,97,50,10),USE(Par:InslagQATemperatuur3)
                         PROMPT('Temperatuur Vervoermiddel:'),AT(314,109),USE(?Par:InslagQATemperatuurVervoermiddel:Prompt)
                         ENTRY(@s20),AT(407,109,60,10),USE(Par:InslagQATemperatuurVervoermiddel)
                         PROMPT('Afwijking:'),AT(314,120),USE(?Par:InslagQAActieAfwijkingen:Prompt)
                         TEXT,AT(315,130,165,29),USE(Par:InslagQAActieAfwijkingen),HVSCROLL
                         PROMPT('Oorzaak:'),AT(315,158),USE(?Par:oorzaak:Prompt)
                         TEXT,AT(315,168,165,29),USE(Par:Oorzaak),HVSCROLL
                         PROMPT('Transport Bedrijf:'),AT(315,199),USE(?Par:TransportBedrijfPrompt)
                         TEXT,AT(315,213,165,29),USE(Par:TransportBedrijf),HVSCROLL
                         TEXT,AT(315,257,165,29),USE(Par:CorrectieveMaatregel,,?Par:CorrectieveMaatregel:2),HVSCROLL
                         PROMPT('Corrigerende Maatregel / voorkomen:'),AT(314,286),USE(?Par:CorrigerendeMaatregel:Prompt)
                         PROMPT('Afgehandeld:'),AT(314,334),USE(?Par:Afgehandeld:Prompt)
                         TEXT,AT(315,299,165,34),USE(Par:CorrigerendeMaatregel,,?Par:CorrigerendeMaatregel:2),HVSCROLL
                         TEXT,AT(315,345,165,36),USE(Par:Afgehandeld,,?Par:Afgehandeld:2),HVSCROLL
                         PROMPT('CorrectieveMaatregel / Direct actie'),AT(314,246),USE(?Par:CorrectieveMaatregel:Prompt)
                       END
                     END

    omit('***',WE::CantCloseNowSetHereDone=1)  !Getting Nested omit compile error, then uncheck the "Check for duplicate CantCloseNowSetHere variable declaration" in the WinEvent local template
WE::CantCloseNowSetHereDone equate(1)
WE::CantCloseNowSetHere     long
    !***
ThisWindow           CLASS(WindowManager)
Ask                    PROCEDURE(),DERIVED
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
PrimeUpdate            PROCEDURE(),BYTE,PROC,DERIVED
Run                    PROCEDURE(),BYTE,PROC,DERIVED
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED
TakeCompleted          PROCEDURE(),BYTE,PROC,DERIVED
TakeEvent              PROCEDURE(),BYTE,PROC,DERIVED
TakeFieldEvent         PROCEDURE(),BYTE,PROC,DERIVED
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED
VerwijderDubbeleInslag PROCEDURE(Par:Record PartijRecord, LONG CelID) ! New method added to this class instance
                     END

Toolbar              ToolbarClass
FDCB1                CLASS(FileDropComboClass)             ! File drop combo manager
Q                      &Queue:FileDropCombo           !Reference to browse queue type
                     END

FDCB3                CLASS(FileDropComboClass)             ! File drop combo manager
Q                      &Queue:FileDropCombo:2         !Reference to browse queue type
                     END

FDCB5                CLASS(FileDropComboClass)             ! File drop combo manager
Q                      &Queue:FileDropCombo:3         !Reference to browse queue type
                     END

FDCB8                CLASS(FileDropComboClass)             ! File drop combo manager
Q                      &Queue:FileDropCombo:4         !Reference to browse queue type
                     END

FDCB9                CLASS(FileDropComboClass)             ! File drop combo manager
Q                      &Queue:FileDropCombo:5         !Reference to browse queue type
                     END

FDCB7                CLASS(FileDropComboClass)             ! File drop combo manager
Q                      &Queue:FileDropCombo:6         !Reference to browse queue type
                     END

FDCB10               CLASS(FileDropComboClass)             ! File drop combo manager
Q                      &Queue:FileDropCombo:7         !Reference to browse queue type
                     END

FDCB11               CLASS(FileDropComboClass)             ! File drop combo manager
Q                      &Queue:FileDropCombo:1         !Reference to browse queue type
                     END

FDCB12               CLASS(FileDropComboClass)             ! File drop combo manager
Q                      &Queue:FileDropCombo:8         !Reference to browse queue type
                     END

FDCB13               CLASS(FileDropComboClass)             ! File drop combo manager
Q                      &Queue:FileDropCombo:9         !Reference to browse queue type
                     END

FDCB14               CLASS(FileDropComboClass)             ! File drop combo manager
Q                      &Queue:FileDropCombo:10        !Reference to browse queue type
                     END


  CODE
  GlobalResponse = ThisWindow.Run()                        ! Opens the window and starts an Accept Loop

!---------------------------------------------------------------------------
DefineListboxStyle ROUTINE
!|
!| This routine create all the styles to be shared in this window
!| It`s called after the window open
!|
!---------------------------------------------------------------------------
ControleerVoorraad  ROUTINE
	LOC:NegatieveVoorraad = false
	Clear(Mut:Record)
	Mut:PartijID = Par:PartijID
	SET(Mut:Mutatie_FK01, Mut:Mutatie_FK01)
	LOOP
		IF NOT(Access:Mutatie.Next() = Level:Benign) THEN BREAK.
		IF NOT(Mut:PartijID = Par:PartijID) THEN BREAK.
		
		IF Mut:SoortMutatie = 'IN' THEN
			! Deze mutatie wordt verwijderd, controleer wat het gevolg is van de
			! inslag-wijziging
			
			LOC:KGTeller = 0
			LOC:PalletsTeller = 0
			
			IF Par:ArtikelID <> Mut:ArtikelID
				db.DebugOut('Ongelijk artikel:'&Par:ArtikelID & ',' & Mut:ArtikelID)
				
				! Ander artikel, inslag-wijzigingen zijn dus niet relevant
				CLEAR(VVPar:Record)
				VVPar:ArtikelID = Mut:ArtikelID
				VVPar:PartijID = Mut:PartijID
				VVPar:CelID = Mut:CelID
				IF (Access:ViewVoorraadPartij.TryFetch(VVPar:ArtikelID_PartijID_CelID_K) = Level:Benign)
					IF VVPar:VoorraadKG < Mut:InslagKG !OR VVPar:VoorraadPallets < Mut:InslagPallet THEN
						DO MessageNietMogelijk
						BREAK
					.
				ELSE
					DO MessageNietMogelijk
					BREAK
				.
			ELSE
				! Zelfde artikel, inslag-wijzigingen zijn dus relevant
				IF LOC:CelID1 = Mut:CelID
					LOC:KGTeller+=LOC:KG1
					LOC:PalletsTeller+=LOC:Pallets1
				.
				
				IF LOC:CelID2 = Mut:CelID
					LOC:KGTeller+=LOC:KG2
					LOC:PalletsTeller+=LOC:Pallets2
				.

				IF LOC:CelID3 = Mut:CelID
					LOC:KGTeller+=LOC:KG3
					LOC:PalletsTeller+=LOC:Pallets3
				.

				IF LOC:CelID4 = Mut:CelID
					LOC:KGTeller+=LOC:KG4
					LOC:PalletsTeller+=LOC:Pallets4
				.
				
				db.DebugOut('Zelfde artikel:'&LOC:KGTeller&','&LOC:PalletsTeller)
				
				CLEAR(VVPar:Record)
				VVPar:ArtikelID = Mut:ArtikelID
				VVPar:PartijID = Mut:PartijID
				VVPar:CelID = Mut:CelID
				IF (Access:ViewVoorraadPartij.TryFetch(VVPar:ArtikelID_PartijID_CelID_K) = Level:Benign)
					IF VVPar:VoorraadKG + LOC:KGTeller < Mut:InslagKG !OR VVPar:VoorraadPallets + LOC:PalletsTeller < Mut:InslagPallet THEN
						LOC:NegatieveVoorraad = TRUE
						DO MessageNietMogelijk
						BREAK
					.
				ELSE
					IF LOC:KGTeller < Mut:InslagKG !OR LOC:PalletsTeller < Mut:InslagPallet THEN
						DO MessageNietMogelijk
						BREAK
					.
				.
			.
		END
	END
	
	EXIT
MessageNietMogelijk ROUTINE
	Cel:CelID = Mut:CelID
	Access:Cel.TryFetch(Cel:CEL_PK)
	MESSAGE('Inslagwijziging niet mogelijk, resulteert in negatieve voorraad (' & |
		CLIP(Format(VVPar:VoorraadKG, @n-14`2)) & '+' & | 
		CLIP(Format(LOC:KGTeller, @n-14`2)) & '-' & | 
		CLIP(Format(Mut:InslagKG, @n-14`2)) & '=' & | 
		CLIP(Format((VVPar:VoorraadKG + LOC:KGTeller) - Mut:InslagKG, @n-14`2)) & | 
		') in cel '& CLIP(CEL:CelOms) & ' voor deze partij.')
	LOC:NegatieveVoorraad = TRUE
	EXIT
MutatieToLokaal     ROUTINE
	! Vullen regels
	i# = 1
	Clear(Mut:Record)
	Mut:PartijID = Par:PartijID
	SET(Mut:Mutatie_FK01, Mut:Mutatie_FK01)
	LOOP
		IF NOT(Access:Mutatie.TryNext() = Level:Benign) THEN BREAK.
		IF NOT(Mut:PartijID = Par:PartijID) THEN BREAK.
		
		IF i# = 1
			CLEAR(APla:Record)
			APla:PlanningID = Mut:PlanningID
			Access:APlanning.TryFetch(APla:PK_Planning)
		.
		
		IF Mut:SoortMutatie = 'IN' THEN
			CASE i#
			OF 1
				LOC:CelID1 = Mut:CelID
				LOC:CelLocatieID1 = Mut:CelLocatieID
				LOC:KG1 = Mut:InslagKG
				LOC:Pallets1 = Mut:InslagPallet
			OF 2
				LOC:CelID2 = Mut:CelID
				LOC:CelLocatieID2 = Mut:CelLocatieID
				LOC:KG2 = Mut:InslagKG
				LOC:Pallets2 = Mut:InslagPallet
			OF 3
				LOC:CelID3 = Mut:CelID
				LOC:CelLocatieID3 = Mut:CelLocatieID
				LOC:KG3 = Mut:InslagKG
				LOC:Pallets3 = Mut:InslagPallet
			OF 4
				LOC:CelID4 = Mut:CelID
				LOC:CelLocatieID4 = Mut:CelLocatieID
				LOC:KG4 = Mut:InslagKG
				LOC:Pallets4 = Mut:InslagPallet
			ELSE
				MESSAGE('Teveel inslagen bij partij')
			.
			i# = i# + 1
		END
	END
	EXIT
WisMutaties         ROUTINE
	! Vullen regels
	Clear(Mut:Record)
	Mut:PartijID = Par:PartijID
	SET(Mut:Mutatie_FK01, Mut:Mutatie_FK01)
	LOOP
		IF NOT(Access:Mutatie.Next() = Level:Benign) THEN BREAK.
		IF NOT(Mut:PartijID = Par:PartijID) THEN BREAK.
		
		IF Mut:SoortMutatie = 'IN' THEN
			db.DebugOut('Wis mutatie ' & Mut:MutatieID)			
			Access:Mutatie.DeleteRecord(false)
		END
	END
	
	EXIT
BerekenTotaal       ROUTINE
	IF Par:KG = (LOC:KG1+LOC:KG2+LOC:KG3+LOC:KG4)
		LOC:KGBalans = 'Klopt'
	ELSE
		LOC:KGBalans = format(Par:KG - (LOC:KG1+LOC:KG2+LOC:KG3+LOC:KG4), @n-10`2)
	.
	
	IF Par:Pallets = (LOC:Pallets1+LOC:Pallets2+LOC:Pallets3+LOC:Pallets4)
		LOC:PalletsBalans = 'Klopt'
	ELSE
		LOC:PalletsBalans = format(Par:Pallets - (LOC:Pallets1+LOC:Pallets2+LOC:Pallets3+LOC:Pallets4), @n-14.)
	.
	
	?KGBalans{Prop:Text}=LOC:KGBalans
	?PalletsBalans{Prop:Text}=LOC:PalletsBalans
	
	EXIT
LaadDropComboTables ROUTINE
	Clear(Art:Record)
	Art:ArtikelID = Par:ArtikelID
	Access:ViewArtikel.Fetch(Art:Artikel_PK)

	Clear(Ver:Record)
	Ver:VerpakkingID = Par:VerpakkingID
	Access:Verpakking.Fetch(Ver:Verpakking_PK)

	Clear(Rel:Record)
	Rel:RelatieID = Par:Leverancier
	Access:Relatie.Fetch(Rel:Relatie_PK)
	
	Clear(Cel:Record)
	CEL:CelID = LOC:CelID1
	Access:Cel.Fetch(Cel:Cel_PK)
	
	Clear(ACel:Record)
	ACEL:CelID = LOC:CelID2
	Access:ACel.Fetch(ACel:Cel_PK)
	
	Clear(AACel:Record)
	AACEL:CelID = LOC:CelID3
	Access:AACel.Fetch(AACel:Cel_PK)

	Clear(AAAACel:Record)
	AAAACEL:CelID = LOC:CelID4
	Access:AAAACel.Fetch(AAAACel:Cel_PK)

	CLEAR(CL:Record)
	CL:CelLocatieID = LOC:CelLocatieID1
	Access:CelLocatie.Fetch(CL:PK_CelLocatie)
	IF CL:CelID <> LOC:CelID1 THEN CLEAR(CL:Record).
	
	CLEAR(ACL:Record)
	ACL:CelLocatieID = LOC:CelLocatieID2
	Access:ACelLocatie.Fetch(ACL:PK_CelLocatie)
	IF ACL:CelID <> LOC:CelID2 THEN CLEAR(ACL:Record).
	
	CLEAR(AACL:Record)
	AACL:CelLocatieID = LOC:CelLocatieID3
	Access:AACelLocatie.Fetch(AACL:PK_CelLocatie)
	IF AACL:CelID <> LOC:CelID3 THEN CLEAR(AACL:Record).
	
	CLEAR(AAAACL:Record)
	AAAACL:CelLocatieID = LOC:CelLocatieID4
	Access:AAAACelLocatie.Fetch(AAAACL:PK_CelLocatie)
	IF AAAACL:CelID <> LOC:CelID4 THEN CLEAR(AAAACL:Record).
	
	EXIT
OphalenTemperaturen ROUTINE
    ! Temperatuur
    db.debugout('InslagTemp:' & Par:InslagQATemperatuur1 & ',' & Par:InslagQATemperatuur2& ',' & Par:InslagQATemperatuur3 & Par:InkoopID)
    IF (CLIP(Par:InslagQATemperatuur1) = '' OR CLIP(Par:InslagQATemperatuur1) = '-18')  AND CLIP(Par:InslagQATemperatuur2) = '' AND CLIP(Par:InslagQATemperatuur3) = '' THEN
        ! Inkoop ophalen gelukt
        CLEAR(APar:Record)
        APar:InkoopID = Par:InkoopID
        SET(APar:Partij_FK03, APar:Partij_FK03)
        LOOP UNTIL Access:APartij.Next()
            IF APar:InkoopID <> Par:InkoopID THEN BREAK.
            IF APar:PartijID = Par:PartijID THEN CYCLE.
            
            IF CLIP(APar:InslagQATemperatuur1) <> '' OR CLIP(APar:InslagQATemperatuur2) <> '' OR CLIP(APar:InslagQATemperatuur3) <> '' THEN
                Par:InslagQATemperatuur1 = APar:InslagQATemperatuur1
                Par:InslagQATemperatuur2 = APar:InslagQATemperatuur2
                Par:InslagQATemperatuur3 = APar:InslagQATemperatuur3
                EXIT
            END
        END
    END

ThisWindow.Ask PROCEDURE

  CODE
  CASE SELF.Request                                        ! Configure the action message text
  OF ViewRecord
    ActionMessage = 'View Record'
  OF InsertRecord
    ActionMessage = 'Record will be Added'
  OF ChangeRecord
    ActionMessage = 'Record will be Changed'
  END
  PARENT.Ask


ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('WindowInslag')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Par:Referentie:Prompt
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
  SELF.AddUpdateFile(Access:Partij)
  Relate:AAAACelLocatie.Open                               ! File AAAACelLocatie used by this procedure, so make sure it's RelationManager is open
  Relate:AAACel.Open                                       ! File AAACel used by this procedure, so make sure it's RelationManager is open
  Relate:AAACelLocatie.Open                                ! File AAACelLocatie used by this procedure, so make sure it's RelationManager is open
  Relate:AACel.Open                                        ! File AACel used by this procedure, so make sure it's RelationManager is open
  Relate:AACelLocatie.Open                                 ! File AACelLocatie used by this procedure, so make sure it's RelationManager is open
  Relate:ACel.Open                                         ! File ACel used by this procedure, so make sure it's RelationManager is open
  Relate:ACelLocatie.Open                                  ! File ACelLocatie used by this procedure, so make sure it's RelationManager is open
  Relate:AMutatie.Open                                     ! File AMutatie used by this procedure, so make sure it's RelationManager is open
  Relate:APartij.Open                                      ! File APartij used by this procedure, so make sure it's RelationManager is open
  Relate:APlanning.Open                                    ! File APlanning used by this procedure, so make sure it's RelationManager is open
  Relate:Cel.SetOpenRelated()
  Relate:Cel.Open                                          ! File Cel used by this procedure, so make sure it's RelationManager is open
  Relate:DubbeleInslagMutaties.Open                        ! File DubbeleInslagMutaties used by this procedure, so make sure it's RelationManager is open
  Relate:Inkoop.SetOpenRelated()
  Relate:Inkoop.Open                                       ! File Inkoop used by this procedure, so make sure it's RelationManager is open
  Relate:Mutatie.Open                                      ! File Mutatie used by this procedure, so make sure it's RelationManager is open
  Relate:Partij.Open                                       ! File Partij used by this procedure, so make sure it's RelationManager is open
  Relate:Verpakking.Open                                   ! File Verpakking used by this procedure, so make sure it's RelationManager is open
  Relate:ViewArtikel.Open                                  ! File ViewArtikel used by this procedure, so make sure it's RelationManager is open
  Relate:ViewVoorraadPartij.Open                           ! File ViewVoorraadPartij used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Primary &= Relate:Partij
  IF SELF.Request = ViewRecord AND NOT SELF.BatchProcessing ! Setup actions for ViewOnly Mode
    SELF.InsertAction = Insert:None
    SELF.DeleteAction = Delete:None
    SELF.ChangeAction = Change:None
    SELF.CancelAction = Cancel:Cancel
    SELF.OkControl = 0
  ELSE
    SELF.ChangeAction = Change:Caller                      ! Changes allowed
    SELF.OkControl = ?OKButton
    IF SELF.PrimeUpdate() THEN RETURN Level:Notify.
  END
  db.DebugOut('WindowInslag ACTION: '& ThisWindow.Request)
  
  IF (ThisWindow.Request = InsertRecord)
  	Access:APlanning.TryFetch(APla:PK_Planning)
  	db.DebugOut('Partij-init: ' & APla:InkoopID & ', ' & APla:PlanningID)
  	
  	Access:Partij.PrimeRecord(false)
  
  	Par:ArtikelID = APla:ArtikelID
  	Par:KG	= APla:KG
  	Par:Pallets	= APla:Pallets
  	Par:VerpakkingID = APla:VerpakkingID
  	!Par:CelID = Pla:CelID
      
      Par:InslagQAIdentificatieMerkenVerpakking = 1
      Par:InslagQATransportmiddelSchoon = 1
      Par:InslagQAVerpakkingSchoonGesloten = 1
      Par:InslagQAIsGeurKleurProductEigen=1
      Par:InslagQAGeenGlasbreuk=1
      
  	Clear(Ink:Record)
  	Ink:InkoopID = APla:InkoopID
  	Access:Inkoop.Fetch(Ink:PK_Inkoop)
  	Par:Leverancier = Ink:Leverancier
  	
  	Par:InkoopID = APla:InkoopID
  	Par:InkoopPlanningID = APla:PlanningID
  
  	!Par:AanmaakDatum_DATE = TODAY()
  	!Par:AanmaakDatum_TIME = CLOCK()
  	
  	Par:AanmaakDatum_DATE = Ink:Planning_DATE
  	Par:AanmaakDatum_TIME = Ink:Planning_TIME
  	
  	LOC:CelID1 = APla:CelID
  	LOC:CelLocatieID1 = APla:CelLocatieID
  	
  	CLEAR(AAAACL:Record)
  	AAAACL:CelLocatieID = LOC:CelLocatieID1
  	Access:AAAACelLocatie.TryFetch(AAAACL:PK_CelLocatie)
  	IF LOC:CelID1 <> AAAACL:CelID THEN LOC:CelLocatieID1 = 0.
  	
  	LOC:KG1 = Par:KG
  	LOC:Pallets1 = Par:Pallets
  
  	LOC:CelID2 = 0
  	LOC:CelLocatieID2 = 0
  	LOC:KG2 = 0
  	LOC:Pallets2 = 0
  
  	LOC:CelID3 = 0
  	LOC:CelLocatieID3 = 0
  	LOC:KG3 = 0
  	LOC:Pallets3 = 0
  
  	LOC:CelID4 = 0
  	LOC:CelLocatieID4 = 0
  	LOC:KG4 = 0
  	LOC:Pallets4 = 0
  	
  	DO LaadDropComboTables
  ELSIF ThisWindow.Request = ChangeRecord OR ThisWindow.Request = ViewRecord
  	! APlanning wordt vanuit de mutatie opgehaald
  	DO MutatieToLokaal
  	
  	db.DebugOut('Partij-init: ' & APla:InkoopID & ', ' & APla:PlanningID)
  	Par:InkoopID = APla:InkoopID
  	Par:InkoopPlanningID = APla:PlanningID
  	
  	! Na het terugzetten is er nog geen mutatie terwijl de partij wel bestaat, vul dan ook vanuit de planning
  	IF LOC:CelID1 = 0 AND LOC:CelLocatieID1 = 0 THEN
  		LOC:CelID1 = APla:CelID
  		LOC:KG1 = Par:KG
  		LOC:Pallets1 = Par:Pallets
  		LOC:CelLocatieID1 = APla:CelLocatieID
  		
  		CLEAR(AAAACL:Record)
  		AAAACL:CelLocatieID = LOC:CelLocatieID1
  		Access:AAAACelLocatie.TryFetch(AAAACL:PK_CelLocatie)
  		IF LOC:CelID1 <> AAAACL:CelID THEN LOC:CelLocatieID1 = 0.
  	END
  	
  	DO LaadDropComboTables
  ELSE
  	RETURN ReturnValue
  END
  
  DO OphalenTemperaturen
  SELF.Open(Window)                                        ! Open window
  DO BerekenTotaal
  WinAlertMouseZoom()
  Do DefineListboxStyle
  INIMgr.Fetch('WindowInslag',Window)                      ! Restore window settings from non-volatile store
  FDCB1.Init(Rel:FirmaNaam,?Rel:FirmaNaam,Queue:FileDropCombo.ViewPosition,FDCB1::View:FileDropCombo,Queue:FileDropCombo,Relate:Relatie,ThisWindow,GlobalErrors,0,0,0)
  FDCB1.RemoveDuplicatesFlag = TRUE
  FDCB1.Q &= Queue:FileDropCombo
  FDCB1.AddSortOrder(Rel:Relatie_FK01)
  FDCB1.SetFilter('Rel:Type=''S''')
  FDCB1.AddField(Rel:FirmaNaam,FDCB1.Q.Rel:FirmaNaam) !List box control field - type derived from field
  FDCB1.AddField(Rel:Type,FDCB1.Q.Rel:Type) !Browse hot field - type derived from field
  FDCB1.AddUpdateField(Rel:RelatieID,Par:Leverancier)
  ThisWindow.AddItem(FDCB1.WindowComponent)
  FDCB1.DefaultFill = 0
  FDCB3.Init(Ver:VerpakkingOmschrijving,?Ver:VerpakkingOmschrijving,Queue:FileDropCombo:2.ViewPosition,FDCB3::View:FileDropCombo,Queue:FileDropCombo:2,Relate:Verpakking,ThisWindow,GlobalErrors,0,0,0)
  FDCB3.Q &= Queue:FileDropCombo:2
  FDCB3.AddSortOrder(Ver:Verpakking_PK)
  FDCB3.AddField(Ver:VerpakkingOmschrijving,FDCB3.Q.Ver:VerpakkingOmschrijving) !List box control field - type derived from field
  FDCB3.AddUpdateField(Ver:VerpakkingID,Par:VerpakkingID)
  ThisWindow.AddItem(FDCB3.WindowComponent)
  FDCB3.DefaultFill = 0
  FDCB5.Init(CEL:CelOms,?CEL:CelOms,Queue:FileDropCombo:3.ViewPosition,FDCB5::View:FileDropCombo,Queue:FileDropCombo:3,Relate:Cel,ThisWindow,GlobalErrors,0,1,0)
  FDCB5.Q &= Queue:FileDropCombo:3
  FDCB5.AddSortOrder(CEL:CEL_PK)
  FDCB5.AddField(CEL:CelOms,FDCB5.Q.CEL:CelOms) !List box control field - type derived from field
  FDCB5.AddField(CEL:CelID,FDCB5.Q.CEL:CelID) !Primary key field - type derived from field
  FDCB5.AddUpdateField(CEL:CelID,LOC:CelID1)
  ThisWindow.AddItem(FDCB5.WindowComponent)
  FDCB5.DefaultFill = 0
  FDCB8.Init(ACel:CelOms,?ACel:CelOms,Queue:FileDropCombo:4.ViewPosition,FDCB8::View:FileDropCombo,Queue:FileDropCombo:4,Relate:ACel,ThisWindow,GlobalErrors,0,1,0)
  FDCB8.Q &= Queue:FileDropCombo:4
  FDCB8.AddSortOrder(ACel:CEL_PK)
  FDCB8.AddField(ACel:CelOms,FDCB8.Q.ACel:CelOms) !List box control field - type derived from field
  FDCB8.AddField(ACel:CelID,FDCB8.Q.ACel:CelID) !Primary key field - type derived from field
  FDCB8.AddUpdateField(ACel:CelID,LOC:CelID2)
  ThisWindow.AddItem(FDCB8.WindowComponent)
  FDCB8.DefaultFill = 0
  FDCB9.Init(AACel:CelOms,?AACel:CelOms,Queue:FileDropCombo:5.ViewPosition,FDCB9::View:FileDropCombo,Queue:FileDropCombo:5,Relate:AACel,ThisWindow,GlobalErrors,0,1,0)
  FDCB9.Q &= Queue:FileDropCombo:5
  FDCB9.AddSortOrder(AACel:CEL_PK)
  FDCB9.AddField(AACel:CelOms,FDCB9.Q.AACel:CelOms) !List box control field - type derived from field
  FDCB9.AddField(AACel:CelID,FDCB9.Q.AACel:CelID) !Primary key field - type derived from field
  FDCB9.AddUpdateField(AACel:CelID,LOC:CelID3)
  ThisWindow.AddItem(FDCB9.WindowComponent)
  FDCB9.DefaultFill = 0
  FDCB7.Init(AAACel:CelOms,?AAACel:CelOms,Queue:FileDropCombo:6.ViewPosition,FDCB7::View:FileDropCombo,Queue:FileDropCombo:6,Relate:AAACel,ThisWindow,GlobalErrors,0,1,0)
  FDCB7.Q &= Queue:FileDropCombo:6
  FDCB7.AddSortOrder(AAACel:CEL_PK)
  FDCB7.AddField(AAACel:CelOms,FDCB7.Q.AAACel:CelOms) !List box control field - type derived from field
  FDCB7.AddField(AAACel:CelID,FDCB7.Q.AAACel:CelID) !Primary key field - type derived from field
  FDCB7.AddUpdateField(AAACel:CelID,LOC:CelID4)
  ThisWindow.AddItem(FDCB7.WindowComponent)
  FDCB7.DefaultFill = 0
  FDCB10.Init(Art:ArtikelOms,?Art:ArtikelOms:2,Queue:FileDropCombo:7.ViewPosition,FDCB10::View:FileDropCombo,Queue:FileDropCombo:7,Relate:ViewArtikel,ThisWindow,GlobalErrors,0,0,0)
  FDCB10.RemoveDuplicatesFlag = TRUE
  FDCB10.Q &= Queue:FileDropCombo:7
  FDCB10.AddSortOrder(Art:Artikel_FK01)
  FDCB10.AddField(Art:ArtikelOms,FDCB10.Q.Art:ArtikelOms) !List box control field - type derived from field
  FDCB10.AddUpdateField(Art:ArtikelID,Par:ArtikelID)
  ThisWindow.AddItem(FDCB10.WindowComponent)
  FDCB10.DefaultFill = 0
  FDCB11.Init(CL:Locatienaam,?CL:Locatienaam,Queue:FileDropCombo:1.ViewPosition,FDCB11::View:FileDropCombo,Queue:FileDropCombo:1,Relate:CelLocatie,ThisWindow,GlobalErrors,0,1,0)
  FDCB11.Q &= Queue:FileDropCombo:1
  FDCB11.AddSortOrder(CL:FK_CelLocatie)
  FDCB11.AddRange(CL:CelID,LOC:CelID1)
  FDCB11.AddField(CL:Locatienaam,FDCB11.Q.CL:Locatienaam) !List box control field - type derived from field
  FDCB11.AddField(CL:CelLocatieID,FDCB11.Q.CL:CelLocatieID) !Primary key field - type derived from field
  FDCB11.AddUpdateField(CL:CelLocatieID,LOC:CelLocatieID1)
  ThisWindow.AddItem(FDCB11.WindowComponent)
  FDCB11.DefaultFill = 0
  FDCB12.Init(ACL:Locatienaam,?ACL:Locatienaam,Queue:FileDropCombo:8.ViewPosition,FDCB12::View:FileDropCombo,Queue:FileDropCombo:8,Relate:ACelLocatie,ThisWindow,GlobalErrors,0,1,0)
  FDCB12.Q &= Queue:FileDropCombo:8
  FDCB12.AddSortOrder(ACL:FK_CelLocatie)
  FDCB12.AddRange(ACL:CelID,LOC:CelID2)
  FDCB12.AddField(ACL:Locatienaam,FDCB12.Q.ACL:Locatienaam) !List box control field - type derived from field
  FDCB12.AddField(ACL:CelLocatieID,FDCB12.Q.ACL:CelLocatieID) !Primary key field - type derived from field
  FDCB12.AddUpdateField(ACL:CelLocatieID,LOC:CelLocatieID2)
  ThisWindow.AddItem(FDCB12.WindowComponent)
  FDCB12.DefaultFill = 0
  FDCB13.Init(AACL:Locatienaam,?AACL:Locatienaam,Queue:FileDropCombo:9.ViewPosition,FDCB13::View:FileDropCombo,Queue:FileDropCombo:9,Relate:AACelLocatie,ThisWindow,GlobalErrors,0,1,0)
  FDCB13.Q &= Queue:FileDropCombo:9
  FDCB13.AddSortOrder(AACL:FK_CelLocatie)
  FDCB13.AddRange(AACL:CelID,LOC:CelID3)
  FDCB13.AddField(AACL:Locatienaam,FDCB13.Q.AACL:Locatienaam) !List box control field - type derived from field
  FDCB13.AddField(AACL:CelLocatieID,FDCB13.Q.AACL:CelLocatieID) !Primary key field - type derived from field
  FDCB13.AddUpdateField(AACL:CelLocatieID,LOC:CelLocatieID3)
  ThisWindow.AddItem(FDCB13.WindowComponent)
  FDCB13.DefaultFill = 0
  FDCB14.Init(AAAACL:Locatienaam,?AAAACL:Locatienaam,Queue:FileDropCombo:10.ViewPosition,FDCB14::View:FileDropCombo,Queue:FileDropCombo:10,Relate:AAAACelLocatie,ThisWindow,GlobalErrors,0,1,0)
  FDCB14.Q &= Queue:FileDropCombo:10
  FDCB14.AddSortOrder(AAAACL:FK_CelLocatie)
  FDCB14.AddRange(AAAACL:CelID,LOC:CelID4)
  FDCB14.AddField(AAAACL:Locatienaam,FDCB14.Q.AAAACL:Locatienaam) !List box control field - type derived from field
  FDCB14.AddField(AAAACL:CelLocatieID,FDCB14.Q.AAAACL:CelLocatieID) !Primary key field - type derived from field
  FDCB14.AddUpdateField(AAAACL:CelLocatieID,LOC:CelLocatieID4)
  ThisWindow.AddItem(FDCB14.WindowComponent)
  FDCB14.DefaultFill = 0
  SELF.SetAlerts()
  EnterByTabManager.Init(False)
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:AAAACelLocatie.Close
    Relate:AAACel.Close
    Relate:AAACelLocatie.Close
    Relate:AACel.Close
    Relate:AACelLocatie.Close
    Relate:ACel.Close
    Relate:ACelLocatie.Close
    Relate:AMutatie.Close
    Relate:APartij.Close
    Relate:APlanning.Close
    Relate:Cel.Close
    Relate:DubbeleInslagMutaties.Close
    Relate:Inkoop.Close
    Relate:Mutatie.Close
    Relate:Partij.Close
    Relate:Verpakking.Close
    Relate:ViewArtikel.Close
    Relate:ViewVoorraadPartij.Close
  END
  IF SELF.Opened
    INIMgr.Update('WindowInslag',Window)                   ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.PrimeUpdate PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.PrimeUpdate()
  	If returnValue = Level:Fatal  ! delete just occured
  		NetRefreshPlanningViews()
  		NetRefreshVoorraadViews()
  	End
    If returnValue = Level:Fatal  ! delete just occured
      ThisNetRefresh.Send('|Relatie|Verpakking|Cel|ACel|AACel|AAACel|ViewArtikel|CelLocatie|ACelLocatie|AACelLocatie|AAAACelLocatie|Partij|') ! NetTalk (NetRefresh)
    End
  RETURN ReturnValue


ThisWindow.Run PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Run()
  IF SELF.Request = ViewRecord                             ! In View Only mode always signal RequestCancelled
    ReturnValue = RequestCancelled
  END
  RETURN ReturnValue


ThisWindow.TakeAccepted PROCEDURE

ReturnValue          BYTE,AUTO

Looped BYTE
  CODE
  LOOP                                                     ! This method receive all EVENT:Accepted's
    IF Looped
      RETURN Level:Notify
    ELSE
      Looped = 1
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?Par:KG
      IF LOC:KG2 = 0 AND LOC:KG3 = 0 AND LOC:KG4 = 0
      	LOC:KG1 = Par:KG
      	DISPLAY(?LOC:KG1)
      .
      DO BerekenTotaal
    OF ?Par:Pallets
      IF LOC:Pallets2 = 0 AND LOC:Pallets3 = 0 AND LOC:Pallets4 = 0
      	LOC:Pallets1 = Par:Pallets
      	DISPLAY(?LOC:Pallets1)
      .
      DO BerekenTotaal
    OF ?LOC:KG1
      IF LOC:KG2 = 0
      	IF (Par:KG - LOC:KG1 - LOC:KG3 - LOC:KG4) >= 0
      		LOC:KG2 = Par:KG - LOC:KG1 - LOC:KG3 - LOC:KG4
      		DISPLAY(?LOC:KG2)
      	.
      .
      DO BerekenTotaal
    OF ?LOC:Pallets1
      IF LOC:Pallets2 = 0
      	IF (Par:Pallets - LOC:Pallets1 - LOC:Pallets3 - LOC:Pallets4) >= 0
      		LOC:Pallets2 = Par:Pallets - LOC:Pallets1 - LOC:Pallets3 - LOC:Pallets4
      		DISPLAY(?LOC:Pallets2)
      	.
      .
      DO BerekenTotaal
    OF ?LOC:KG2
      IF LOC:KG3 = 0
      	IF (Par:KG - LOC:KG1 - LOC:KG2 - LOC:KG4) >= 0 
      		LOC:KG3 = Par:KG - LOC:KG1 - LOC:KG2 - LOC:KG4
      		DISPLAY(?LOC:KG3)
      	.
      .
      DO BerekenTotaal
    OF ?LOC:Pallets2
      IF LOC:Pallets3 = 0
      	IF (Par:Pallets - LOC:Pallets1 - LOC:Pallets2 - LOC:Pallets4) >= 0
      		LOC:Pallets3 = Par:Pallets - LOC:Pallets1 - LOC:Pallets2 - LOC:Pallets4
      		DISPLAY(?LOC:Pallets3)
      	.
      .
      DO BerekenTotaal
    OF ?LOC:KG3
      IF LOC:KG4 = 0
      	IF (Par:KG - LOC:KG1 - LOC:KG2 - LOC:KG3 > 0)
      		LOC:KG4 = Par:KG - LOC:KG1 - LOC:KG2 - LOC:KG3
      		DISPLAY(?LOC:KG4)
      	.
      .
      DO BerekenTotaal
    OF ?LOC:Pallets3
      IF LOC:Pallets4 = 0
      	IF (Par:Pallets - LOC:Pallets1 - LOC:Pallets2 - LOC:Pallets3) >= 0
      		LOC:Pallets4 = Par:Pallets - LOC:Pallets1 - LOC:Pallets2 - LOC:Pallets3
      		DISPLAY(?LOC:Pallets4)
      	.
      .
      DO BerekenTotaal
    OF ?LOC:KG4
      DO BerekenTotaal
    OF ?LOC:Pallets4
      DO BerekenTotaal
    OF ?OKButton
      ThisWindow.Update()
      IF SELF.Request = ViewRecord AND NOT SELF.BatchProcessing THEN
         POST(EVENT:CloseWindow)
      END
    END
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue


ThisWindow.TakeCompleted PROCEDURE

ReturnValue          BYTE,AUTO

Looped BYTE
  CODE
  LOOP
    IF Looped
      RETURN Level:Notify
    ELSE
      Looped = 1
    END
  DO BerekenTotaal
  
  IF Par:ArtikelID = 0 THEN
  	SELECT(?Art:ArtikelOms:2)
  	RETURN Level:Notify
  END
  
  IF Par:Leverancier = 0 THEN
  	SELECT(?Rel:FirmaNaam)
  	RETURN Level:Notify
  END
  
  IF Par:VerpakkingID = 0 THEN
  	SELECT(?Ver:VerpakkingOmschrijving)
  	RETURN Level:Notify
  END
  
  omit('zelfdecel')
  IF LOC:CelID1 <> 0 AND (LOC:CelID1 = LOC:CelID2 OR	LOC:CelID1 = LOC:CelID3 OR LOC:CelID1 = LOC:CelID4)
  	MESSAGE('Cel ' & CLIP(LOC:CelID1) & ' is meer dan 1 keer ingevoerd','Cel 1',Icon:Hand)
  	Select(?CEL:CelOms)
  	RETURN Level:Notify
  .
  
  IF LOC:CelID2 <> 0 AND (LOC:CelID2 = LOC:CelID3 OR LOC:CelID2 = LOC:CelID4)
  	MESSAGE('Cel ' & CLIP(LOC:CelID2) & ' is meer dan 1 keer ingevoerd','Cel 2',Icon:Hand)
  	Select(?ACEL:CelOms)
  	RETURN Level:Notify
  .
  
  IF LOC:CelID3 <> 0 AND (LOC:CelID3 = LOC:CelID4)
  	MESSAGE('Cel ' & CLIP(LOC:CelID3) & ' is meer dan 1 keer ingevoerd','Cel 3',Icon:Hand)
  	Select(?AACEL:CelOms)
  	RETURN Level:Notify
  .
  'zelfdecel'
  
  IF (LOC:KG1<>0 OR LOC:Pallets1<>0) AND LOC:CelID1 = 0 THEN
  	SELECT(?CEL:CelOms)
  	RETURN Level:Notify
  .
  
  IF (LOC:KG2<>0 OR LOC:Pallets2<>0) AND LOC:CelID2 = 0 THEN
  	SELECT(?ACEL:CelOms)
  	RETURN Level:Notify
  .
  
  IF (LOC:KG3<>0 OR LOC:Pallets3<>0) AND LOC:CelID3 = 0 THEN
  	SELECT(?AACEL:CelOms)
  	RETURN Level:Notify
  .
  
  IF (LOC:KG4<>0 OR LOC:Pallets4<>0) AND LOC:CelID4 = 0 THEN
  	SELECT(?AAACEL:CelOms)
  	RETURN Level:Notify
  .
  
  IF LOC:PalletsBalans<>'Klopt' OR LOC:KGBalans<>'Klopt'
  	MESSAGE('Mutatietotalen niet gelijk aan partijtotaal.')
  	RETURN Level:Notify
  .
  
  IF ThisWindow.Request = InsertRecord THEN
  	! Nog controleren of niet een andere gebruiker ondertussen de inslag al heeft gedaan
  	Access:APlanning.TryFetch(APla:PK_Planning)
  	IF APla:MutatieGemaakt THEN
  		MESSAGE('Inslag is reeds gedaan')
  		RETURN Level:Notify
  	.
  ELSE
  	! Wijziging, controleren of de voorraad niet negatief wordt
  	DO ControleerVoorraad
  	
  	IF LOC:NegatieveVoorraad THEN
  		RETURN Level:Notify
  	.
  .
  
  ReturnValue = PARENT.TakeCompleted()
  ! weet ik nu het partij nummer
  IF (ThisWindow.Request = ChangeRecord)
  	DO WisMutaties
  END
  
  ! Toevoegen mutaties
  IF LOC:CelID1<>0 AND (LOC:Pallets1<>0 OR LOC:KG1<>0)
  	Access:Mutatie.PrimeRecord()
  	Mut:PartijID = Par:PartijID 
  	Mut:InslagKG = LOC:KG1
  	Mut:InslagPallet = LOC:Pallets1 
  	Mut:CelID = LOC:CelID1
  	
  	CLEAR(AAACL:Record)	
  	AAACL:CelLocatieID = LOC:CelLocatieID1
  	Access:AAACelLocatie.TryFetch(AAACL:PK_CelLocatie)
  	IF Mut:CelID <> AAACL:CelID THEN LOC:CelLocatieID1 = 0.
  	
  	Mut:CelLocatieID = LOC:CelLocatieID1
  	Mut:SoortMutatie = 'IN'
  	Mut:PlanningID = APla:PlanningID
  	Mut:ArtikelID = Par:ArtikelID
  	Mut:DatumTijd_DATE = Par:AanmaakDatum_DATE
  	Mut:DatumTijd_TIME = Par:AanmaakDatum_TIME
  	Access:Mutatie.Insert()
  	
  	! Controleren op spook-dubbele inslagen
  	!ThisWindow.VerwijderDubbeleInslag(Par:Record, LOC:CelID1)
  END
  
  IF LOC:CelID2<>0 AND (LOC:Pallets2<>0 OR LOC:KG2<>0)
  	Access:Mutatie.PrimeRecord()
  	Mut:PartijID = Par:PartijID 
  	Mut:InslagKG = LOC:KG2
  	Mut:InslagPallet = LOC:Pallets2
  	Mut:CelID = LOC:CelID2
  
  	CLEAR(AAACL:Record)	
  	AAACL:CelLocatieID = LOC:CelLocatieID2
  	Access:AAACelLocatie.TryFetch(AAACL:PK_CelLocatie)
  	IF Mut:CelID <> AAACL:CelID THEN LOC:CelLocatieID2 = 0.
  	
  	Mut:CelLocatieID = LOC:CelLocatieID2
  	Mut:SoortMutatie = 'IN'
  	Mut:PlanningID = APla:PlanningID
  	Mut:ArtikelID = Par:ArtikelID
  	Mut:DatumTijd_DATE = Par:AanmaakDatum_DATE
  	Mut:DatumTijd_TIME = Par:AanmaakDatum_TIME
  	Access:Mutatie.Insert()
  	
  	! Controleren op spook-dubbele inslagen
  	!ThisWindow.VerwijderDubbeleInslag(Par:Record, LOC:CelID2)
  END
  
  IF LOC:CelID3<>0 AND (LOC:Pallets3<>0 OR LOC:KG3<>0)
  	Access:Mutatie.PrimeRecord()
  	Mut:PartijID = Par:PartijID 
  	Mut:InslagKG = LOC:KG3
  	Mut:InslagPallet = LOC:Pallets3
  	Mut:CelID = LOC:CelID3
  	
  	CLEAR(AAACL:Record)
  	AAACL:CelLocatieID = LOC:CelLocatieID3
  	Access:AAACelLocatie.TryFetch(AAACL:PK_CelLocatie)
  	IF Mut:CelID <> AAACL:CelID THEN LOC:CelLocatieID3 = 0.
  
  	Mut:CelLocatieID = LOC:CelLocatieID3
  	Mut:SoortMutatie = 'IN'
  	Mut:PlanningID = APla:PlanningID
  	Mut:ArtikelID = Par:ArtikelID
  	Mut:DatumTijd_DATE = Par:AanmaakDatum_DATE
  	Mut:DatumTijd_TIME = Par:AanmaakDatum_TIME
  	Access:Mutatie.Insert()
  	
  	! Controleren op spook-dubbele inslagen
  	!ThisWindow.VerwijderDubbeleInslag(Par:Record, LOC:CelID3)
  END
  
  IF LOC:CelID4<>0 AND (LOC:Pallets4<>0 OR LOC:KG4<>0)
  	Access:Mutatie.PrimeRecord()
  	Mut:PartijID = Par:PartijID 
  	Mut:InslagKG = LOC:KG4
  	Mut:InslagPallet = LOC:Pallets4
  	Mut:CelID = LOC:CelID4
  
  	CLEAR(AAACL:Record)
  	AAACL:CelLocatieID = LOC:CelLocatieID4
  	Access:AAACelLocatie.TryFetch(AAACL:PK_CelLocatie)
  	IF Mut:CelID <> AAACL:CelID THEN LOC:CelLocatieID4 = 0.
  	
  	Mut:CelLocatieID = LOC:CelLocatieID4
  	Mut:SoortMutatie = 'IN'
  	Mut:PlanningID = APla:PlanningID
  	Mut:ArtikelID = Par:ArtikelID
  	Mut:DatumTijd_DATE = Par:AanmaakDatum_DATE
  	Mut:DatumTijd_TIME = Par:AanmaakDatum_TIME
  	Access:Mutatie.Insert()
  	
  	! Controleren op spook-dubbele inslagen
  	!ThisWindow.VerwijderDubbeleInslag(Par:Record, LOC:CelID4)
  END
  
  VoorraadClass.BerekenPlanningMutatieGrootte(APla:PlanningID)
  
  LOC:SavedPartijBuffer = Access:Partij.SaveBuffer()
  LOC:SavedPartijFile = Access:Partij.SaveFile()
  VoorraadClass.BerekenPartijenInkoopPrijs(APla:InkoopID)
  Access:Partij.RestoreFile(LOC:SavedPartijFile)
  Access:Partij.RestoreBuffer(LOC:SavedPartijBuffer)
  
  !Access:Partij.Update()
    ThisNetRefresh.Send('|Relatie|Verpakking|Cel|ACel|AACel|AAACel|ViewArtikel|CelLocatie|ACelLocatie|AACelLocatie|AAAACelLocatie|Partij|') ! NetTalk (NetRefresh)
  	NetRefreshPlanningViews()
  	NetRefreshVoorraadViews()
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue


ThisWindow.TakeEvent PROCEDURE

ReturnValue          BYTE,AUTO

Looped BYTE
  CODE
  LOOP                                                     ! This method receives all events
    IF Looped
      RETURN Level:Notify
    ELSE
      Looped = 1
    END
  IF EnterByTabManager.TakeEvent()
     RETURN(Level:Notify)
  END
  ReturnValue = PARENT.TakeEvent()
  if event() = event:VisibleOnDesktop
    ds_VisibleOnDesktop()
  end
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue


ThisWindow.TakeFieldEvent PROCEDURE

ReturnValue          BYTE,AUTO

Looped BYTE
  CODE
  LOOP                                                     ! This method receives all field specific events
    IF Looped
      RETURN Level:Notify
    ELSE
      Looped = 1
    END
  ReturnValue = PARENT.TakeFieldEvent()
  ?Par:InslagQATransportmiddelSchoon{PROP:Background}=CHOOSE(Par:InslagQATransportmiddelSchoon,COLOR:NONE,COLOR:RED)
  ?Par:InslagQAVerpakkingSchoonGesloten{PROP:Background}=CHOOSE(Par:InslagQAVerpakkingSchoonGesloten,COLOR:NONE,COLOR:RED)
  ?Par:InslagQAIdentificatieMerkenVerpakking{PROP:Background}=CHOOSE(Par:InslagQAIdentificatieMerkenVerpakking,COLOR:NONE,COLOR:RED)
  ?Par:InslagQAIsGeurKleurProductEigen{PROP:Background}=CHOOSE(Par:InslagQAIsGeurKleurProductEigen,COLOR:NONE,COLOR:RED)
  ?Par:InslagQAGeenGlasbreuk{PROP:Background}=CHOOSE(Par:InslagQAGeenGlasbreuk,COLOR:NONE,COLOR:RED)
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue


ThisWindow.TakeWindowEvent PROCEDURE

ReturnValue          BYTE,AUTO

Looped BYTE
  CODE
  LOOP                                                     ! This method receives all window specific events
    IF Looped
      RETURN Level:Notify
    ELSE
      Looped = 1
    END
    CASE EVENT()
    OF EVENT:CloseDown
      if WE::CantCloseNow
        WE::MustClose = 1
        cycle
      else
        self.CancelAction = cancel:cancel
        self.response = requestcancelled
      end
    END
  ReturnValue = PARENT.TakeWindowEvent()
    CASE EVENT()
    OF EVENT:OpenWindow
        post(event:visibleondesktop)
    END
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue

ThisWindow.VerwijderDubbeleInslag PROCEDURE(Par:Record PartijRecord, LONG CelID)

  CODE
  	CLEAR(Dub:Record)
  	Dub:PartijID = PartijRecord:PartijID
  	Dub:CelID = CelID
  	IF (Access:DubbeleInslagMutaties.TryFetch(Dub:Partij_CelID_K) = Level:Benign)
  		IF (Dub:AantalInslagen > 1)
  			!MESSAGE((Dub:AantalInslagen - 1) & ' dubbele inslag gedetecteerd (Partij: ' & Dub:PartijID & ' / Cel-ID: ' & Dub:CelID & '): deze dubbelen worden nu verwijderd')
  			aantal_verwijderen# = (Dub:AantalInslagen - 1)
  			AMut:PartijID = PartijRecord:PartijID
  			AMut:DatumTijd_DATE = PartijRecord:AanmaakDatum_GROUP:AanmaakDatum_DATE
  			AMut:DatumTijd_TIME = PartijRecord:AanmaakDatum_GROUP:AanmaakDatum_TIME
  			SET(AMut:Mutatie_FK01, AMut:Mutatie_FK01)
  			
  			LOOP
  				Access:AMutatie.Next()
  				IF ERROR() THEN BREAK.
  				IF AMut:PartijID <> PartijRecord:PartijID OR |
  					AMut:DatumTijd_DATE <> PartijRecord:AanmaakDatum_GROUP:AanmaakDatum_DATE OR |
  					AMut:DatumTijd_TIME <> PartijRecord:AanmaakDatum_GROUP:AanmaakDatum_TIME THEN BREAK.
  				IF AMut:CelID <> CelID OR AMut:SoortMutatie <> 'IN' THEN CYCLE.
  			
  				Access:AMutatie.DeleteRecord(False)
  				aantal_verwijderen# -= 1
  				
  				IF (aantal_verwijderen# = 0) THEN BREAK.
  			.			
   		.
  	END


