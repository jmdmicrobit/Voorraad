

   MEMBER('VoorrPln.clw')                                  ! This is a MEMBER module


   INCLUDE('ABDROPS.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABUTIL.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('VOORRPLN033.INC'),ONCE        !Local module procedure declarations
                     END


!!! <summary>
!!! Generated from procedure template - Window
!!! Form Planning
!!! </summary>
UpdateOverboeking PROCEDURE (PRM:ArtikelID, PRM:PartijCelID,PRM:CelLocatieID, PRM:OverboekingPlanningID, PRM:KG)

CurrentTab           STRING(80)                            ! 
ActionMessage        CSTRING(40)                           ! 
LOC:VerpakkingID     LONG                                  ! 
LOC:CelID            LONG                                  ! 
LOC:VoorraadKG       LONG                                  ! 
LOC:VoorraadPallets  LONG                                  ! 
LOC:PartijCelID      CSTRING(26)                           ! 
LOC:ArtikelID        CSTRING(31)                           ! 
LOC:Planning         STRING(8)                             ! 
LOC:VerpakkingID2    LONG                                  ! 
LOC:CelID2           LONG                                  ! 
LOC:Memo             CSTRING(101)                          ! 
LOC:Instructie       CSTRING(101)                          ! 
LOC:Transport        CSTRING(101)                          ! 
LOC:PressedOK        BYTE                                  ! 
LOC:BeschikbareVoorraad DECIMAL(9,2)                       ! 
LOC:OrigineelPartijCelID1 CSTRING(26)                      ! 
LOC:OrigineelVerkoopKG DECIMAL(9,2)                        ! 
LOC:VerkoopKG        DECIMAL(9,2)                          ! 
Loc:NieuwKG          DECIMAL(10,2)                         ! 
Loc:NieuwPallet      LONG                                  ! 
Loc:OverboekSoort    CSTRING(51)                           ! 
FDCB7::View:FileDropCombo VIEW(ViewArtikel)
                       PROJECT(Art:ArtikelOms)
                     END
FDCB8::View:FileDropCombo VIEW(Verpakking)
                       PROJECT(Ver:VerpakkingOmschrijving)
                     END
FDCB9::View:FileDropCombo VIEW(Cel)
                       PROJECT(CEL:CelOms)
                       PROJECT(CEL:CelID)
                     END
FDCB4::View:FileDropCombo VIEW(ViewVoorraadPartij)
                       PROJECT(VVPar:PartijCelID)
                       PROJECT(VVPar:VoorraadKG)
                       PROJECT(VVPar:PartijID)
                       PROJECT(VVPar:CelID)
                       JOIN(ACel:CEL_PK,VVPar:CelID)
                         PROJECT(ACel:CelOms)
                         PROJECT(ACel:CelID)
                       END
                       JOIN(Par:Partij_PK,VVPar:PartijID)
                         PROJECT(Par:PartijID)
                         PROJECT(Par:ExternPartijnr)
                         PROJECT(Par:AanmaakDatum_DATE)
                         PROJECT(Par:Leverancier)
                         PROJECT(Par:VerpakkingID)
                         JOIN(AREL:Relatie_PK,Par:Leverancier)
                           PROJECT(AREL:FirmaNaam)
                           PROJECT(AREL:RelatieID)
                         END
                         JOIN(AVP:Verpakking_PK,Par:VerpakkingID)
                           PROJECT(AVP:VerpakkingOmschrijving)
                           PROJECT(AVP:VerpakkingID)
                         END
                       END
                       JOIN(VPPar:PartijCelID_K,VVPar:PartijCelID)
                         PROJECT(VPPar:PartijCelID)
                       END
                       JOIN(VPParT:PK_ViewPlanningPartijTotaal,VVPar:PartijID)
                         PROJECT(VPParT:VerkoopKG)
                         PROJECT(VPParT:PartijID)
                       END
                       JOIN(VVParT:PK_ViewVoorraadPartijTotaal,VVPar:PartijID)
                         PROJECT(VVParT:VoorraadKG)
                         PROJECT(VVParT:PartijID)
                       END
                     END
FDCB13::View:FileDropCombo VIEW(AAACel)
                       PROJECT(AAACel:CelOms)
                       PROJECT(AAACel:CelID)
                     END
FDCB14::View:FileDropCombo VIEW(ACelLocatie)
                       PROJECT(ACL:Locatienaam)
                       PROJECT(ACL:CelLocatieID)
                       PROJECT(ACL:CelID)
                     END
Queue:FileDropCombo  QUEUE                            !
Art:ArtikelOms         LIKE(Art:ArtikelOms)           !List box control field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
Queue:FileDropCombo:1 QUEUE                           !
Ver:VerpakkingOmschrijving LIKE(Ver:VerpakkingOmschrijving) !List box control field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
Queue:FileDropCombo:2 QUEUE                           !
CEL:CelOms             LIKE(CEL:CelOms)               !List box control field - type derived from field
CEL:CelID              LIKE(CEL:CelID)                !Primary key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
Queue:FileDropCombo:3 QUEUE                           !
VVPar:PartijCelID      LIKE(VVPar:PartijCelID)        !List box control field - type derived from field
Par:PartijID           LIKE(Par:PartijID)             !List box control field - type derived from field
Par:ExternPartijnr     LIKE(Par:ExternPartijnr)       !List box control field - type derived from field
VVParT:VoorraadKG      LIKE(VVParT:VoorraadKG)        !List box control field - type derived from field
VPParT:VerkoopKG       LIKE(VPParT:VerkoopKG)         !List box control field - type derived from field
Par:AanmaakDatum_DATE  LIKE(Par:AanmaakDatum_DATE)    !List box control field - type derived from field
ACel:CelOms            LIKE(ACel:CelOms)              !List box control field - type derived from field
VVPar:VoorraadKG       LIKE(VVPar:VoorraadKG)         !List box control field - type derived from field
LOC:VerkoopKG          LIKE(LOC:VerkoopKG)            !List box control field - type derived from local data
LOC:BeschikbareVoorraad LIKE(LOC:BeschikbareVoorraad) !List box control field - type derived from local data
AREL:FirmaNaam         LIKE(AREL:FirmaNaam)           !List box control field - type derived from field
AVP:VerpakkingOmschrijving LIKE(AVP:VerpakkingOmschrijving) !List box control field - type derived from field
VVPar:PartijID         LIKE(VVPar:PartijID)           !Browse hot field - type derived from field
ACel:CelID             LIKE(ACel:CelID)               !Related join file key field - type derived from field
AREL:RelatieID         LIKE(AREL:RelatieID)           !Related join file key field - type derived from field
AVP:VerpakkingID       LIKE(AVP:VerpakkingID)         !Related join file key field - type derived from field
VPPar:PartijCelID      LIKE(VPPar:PartijCelID)        !Related join file key field - type derived from field
VPParT:PartijID        LIKE(VPParT:PartijID)          !Related join file key field - type derived from field
VVParT:PartijID        LIKE(VVParT:PartijID)          !Related join file key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
Queue:FileDropCombo:4 QUEUE                           !
AAACel:CelOms          LIKE(AAACel:CelOms)            !List box control field - type derived from field
AAACel:CelID           LIKE(AAACel:CelID)             !Browse hot field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
Queue:FileDropCombo:5 QUEUE                           !
ACL:Locatienaam        LIKE(ACL:Locatienaam)          !List box control field - type derived from field
ACL:CelLocatieID       LIKE(ACL:CelLocatieID)         !Browse hot field - type derived from field
ACL:CelID              LIKE(ACL:CelID)                !Browse hot field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
LocEnableEnterByTab  BYTE(1)                               !Used by the ENTER Instead of Tab template
EnterByTabManager    EnterByTabClass
History::Pla:Record  LIKE(Pla:RECORD),THREAD
QuickWindow          WINDOW('Form Planning'),AT(,,359,330),FONT('MS Sans Serif',8,,,CHARSET:DEFAULT),DOUBLE,CENTER, |
  GRAY,IMM,MDI,HLP('UpdatePlanning'),SYSTEM
                       SHEET,AT(4,4,355,307),USE(?CurrentTab)
                         TAB('&1) General'),USE(?Tab:1)
                           PROMPT('Artikel:'),AT(9,26),USE(?Pla:ArtikelID:Prompt),TRN
                           COMBO(@s60),AT(69,27,282,10),USE(Art:ArtikelOms),DROP(25),FORMAT('240L(2)~Omschrijving~L(3)@s60@'), |
  FROM(Queue:FileDropCombo),REQ
                           PROMPT('Partij:'),AT(9,42),USE(?PROMPT1),TRN
                           COMBO(@s25),AT(69,42,177,10),USE(VVPar:PartijCelID),DROP(25,700),FORMAT('0L(2)|~Partij.' & |
  'Cel~C(0)@s25@[39R(2)|M~Intern~C(0)@n-14.@45L(2)|M~Extern~C(1)@s20@52R(2)|M~Voorraad ' & |
  '(KG)~C(0)@n-12`2@54R(2)|M~Verkocht (KG)~C(0)@n-12`2@47L(2)|~Inslagdatum~C(0)@d17@](2' & |
  '51)|~Partij~[40L(2)|M~Cel~C(0)@s50@50R(2)|M~Voorraad (KG)~C(0)@n-12`2@55R(2)|M~Verko' & |
  'cht (KG)~C(0)@n-13`2@78R(2)|M~Beschikbaar (KG)~C(0)@n-13`2@](211)|~Cel~74L(2)|M~Leve' & |
  'rancier~C(0)@s50@80L(2)|M~Verpakking~C(0)@s50@'),FROM(Queue:FileDropCombo:3),IMM
                           BUTTON('Leeg'),AT(251,40,34),USE(?LeegPartij)
                           BUTTON('Neem voorraad'),AT(287,40),USE(?NeemVoorraad)
                           PROMPT('Verpakking:'),AT(9,58),USE(?Pla:VerpakkingID:Prompt),TRN
                           COMBO(@s50),AT(69,58,282,10),USE(Ver:VerpakkingOmschrijving),DROP(25),FORMAT('200L(2)~Om' & |
  'schrijving~L(3)@s50@'),FROM(Queue:FileDropCombo:1),IMM
                           PROMPT('Van Cel:'),AT(9,73),USE(?Pla:CelID:Prompt),TRN
                           COMBO(@s50),AT(69,74,282,10),USE(CEL:CelOms),DROP(25),FORMAT('200L(2)~Omschrijving~L(3)@s50@'), |
  FROM(Queue:FileDropCombo:2),IMM
                           PROMPT('Locatie:'),AT(21,86),USE(?PROMPT3),TRN
                           STRING(@S10),AT(68,88),USE(CL:Locatienaam,,?CL:Locatienaam:2),FONT('Microsoft Sans Serif', |
  ,,FONT:bold),TRN
                           PROMPT('Overboek Soort:'),AT(9,99),USE(?Loc:OverboekSoort:Prompt)
                           LIST,AT(69,99,282,10),USE(Loc:OverboekSoort),DROP(5),FROM('Overboeking|Verplaatsing|Cor' & |
  'rectie|Afboeking')
                           PROMPT('Naar Cel:'),AT(9,113),USE(?PROMPT2),TRN
                           COMBO(@s50),AT(69,114,282,10),USE(AAACel:CelOms),DROP(5),FORMAT('200L(2)|M~Omschrijving~@s50@'), |
  FROM(Queue:FileDropCombo:4),IMM
                           STRING('Locatie:'),AT(19,128),USE(?STRING1),TRN
                           COMBO(@s50),AT(69,129,282,10),USE(ACL:Locatienaam),VSCROLL,DROP(25),FORMAT('200L(2)|M~L' & |
  'ocatienaam~L(0)@s50@'),FROM(Queue:FileDropCombo:5),IMM
                           PROMPT('KG:'),AT(9,144),USE(?Pla:KG:Prompt),TRN
                           ENTRY(@n12_`2),AT(69,144,64,10),USE(Pla:KG),RIGHT(2),REQ
                           PROMPT('Pallets:'),AT(9,160),USE(?Pla:Pallets:Prompt),TRN
                           ENTRY(@n14),AT(69,160,64,10),USE(Pla:Pallets),RIGHT(2)
                           PROMPT('Nieuw KG:'),AT(173,145,53,10),USE(?Loc:NieuwKG:Prompt)
                           ENTRY(@n12_`2),AT(254,146,54,9),USE(Pla:NieuwKG)
                           PROMPT('Nieuw Pallets:'),AT(173,162),USE(?Loc:NieuwPallet:Prompt)
                           ENTRY(@n-14),AT(254,161,60,10),USE(Pla:NieuwPallets),RIGHT(2)
                           PROMPT('Datum:'),AT(11,175),USE(?Pla:Planning_DATE:Prompt),TRN
                           ENTRY(@d6-),AT(69,175,64,10),USE(Pla:Planning_DATE),RIGHT(2)
                           BUTTON('...'),AT(137,173,12,12),USE(?Calendar)
                           PROMPT('Tijdstip:'),AT(173,176),USE(?Pla:Planning_TIME:Prompt),TRN
                           ENTRY(@t7),AT(254,176,41,10),USE(Pla:Planning_TIME),RIGHT(2)
                           PROMPT('Instructie:'),AT(11,189),USE(?Pla:Instructie:Prompt),CENTER,TRN
                           TEXT,AT(69,189,282,58),USE(Pla:Instructie,,?Pla:Instructie:2)
                           PROMPT('Transport:'),AT(11,251),USE(?Pla:Transport:Prompt),TRN
                           TEXT,AT(69,252,283,50),USE(Pla:Transport,,?Pla:Transport:2)
                         END
                       END
                       BUTTON('&OK'),AT(235,314,49,14),USE(?OK),LEFT,ICON('WAOK.ICO'),DEFAULT,FLAT,MSG('Accept dat' & |
  'a and close the window'),TIP('Accept data and close the window')
                       BUTTON('&Annuleren'),AT(287,314,69,14),USE(?Cancel),LEFT,ICON('WACANCEL.ICO'),FLAT,MSG('Cancel operation'), |
  TIP('Cancel operation')
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
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
FDCB7                CLASS(FileDropComboClass)             ! File drop combo manager
Q                      &Queue:FileDropCombo           !Reference to browse queue type
                     END

FDCB8                CLASS(FileDropComboClass)             ! File drop combo manager
Q                      &Queue:FileDropCombo:1         !Reference to browse queue type
                     END

FDCB9                CLASS(FileDropComboClass)             ! File drop combo manager
Q                      &Queue:FileDropCombo:2         !Reference to browse queue type
                     END

FDCB4                CLASS(FileDropComboClass)             ! File drop combo manager
Q                      &Queue:FileDropCombo:3         !Reference to browse queue type
SetQueueRecord         PROCEDURE(),DERIVED
                     END

FDCB13               CLASS(FileDropComboClass)             ! File drop combo manager
Q                      &Queue:FileDropCombo:4         !Reference to browse queue type
                     END

FDCB14               CLASS(FileDropComboClass)             ! File drop combo manager
Q                      &Queue:FileDropCombo:5         !Reference to browse queue type
                     END

Resizer              CLASS(WindowResizeClass)
Init                   PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)
                     END

Calendar11           CalendarClass
LocalClass          CLASS
HideControls           PROCEDURE()
                    END
Boeksoort           GROUP
Afboeking               String('Afboeking')
Verplaatsing            String('Verplaatsing')
Correctie               String('Correctie')
Overboeking             String('Overboeking')
                    END
CurCtrlFeq          LONG
FieldColorQueue     QUEUE
Feq                   LONG
OldColor              LONG
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

ThisWindow.Ask PROCEDURE

  CODE
  CASE SELF.Request                                        ! Configure the action message text
  OF ViewRecord
    ActionMessage = 'View Record'
  OF InsertRecord
    ActionMessage = 'Overboeking wordt toegevoegd'
  OF ChangeRecord
    ActionMessage = 'Record Will Be Changed'
  END
  QuickWindow{PROP:Text} = ActionMessage                   ! Display status message in title bar
  PARENT.Ask


ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('UpdateOverboeking')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Pla:ArtikelID:Prompt
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.HistoryKey = CtrlH
  SELF.AddHistoryFile(Pla:Record,History::Pla:Record)
  SELF.AddHistoryField(?Pla:KG,5)
  SELF.AddHistoryField(?Pla:Pallets,6)
  SELF.AddHistoryField(?Pla:NieuwKG,64)
  SELF.AddHistoryField(?Pla:NieuwPallets,65)
  SELF.AddHistoryField(?Pla:Planning_DATE,9)
  SELF.AddHistoryField(?Pla:Planning_TIME,10)
  SELF.AddHistoryField(?Pla:Instructie:2,20)
  SELF.AddHistoryField(?Pla:Transport:2,21)
  SELF.AddUpdateFile(Access:Planning)
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  Relate:AAACel.Open                                       ! File AAACel used by this procedure, so make sure it's RelationManager is open
  Relate:ACelLocatie.Open                                  ! File ACelLocatie used by this procedure, so make sure it's RelationManager is open
  Relate:APlanning.Open                                    ! File APlanning used by this procedure, so make sure it's RelationManager is open
  Relate:Cel.SetOpenRelated()
  Relate:Cel.Open                                          ! File Cel used by this procedure, so make sure it's RelationManager is open
  Relate:Mutatie.Open                                      ! File Mutatie used by this procedure, so make sure it's RelationManager is open
  Relate:Planning.SetOpenRelated()
  Relate:Planning.Open                                     ! File Planning used by this procedure, so make sure it's RelationManager is open
  Relate:Verpakking.Open                                   ! File Verpakking used by this procedure, so make sure it's RelationManager is open
  Relate:ViewArtikel.Open                                  ! File ViewArtikel used by this procedure, so make sure it's RelationManager is open
  Relate:ViewPlanningPartij.Open                           ! File ViewPlanningPartij used by this procedure, so make sure it's RelationManager is open
  Relate:ViewVoorraadPartij.Open                           ! File ViewVoorraadPartij used by this procedure, so make sure it's RelationManager is open
  Access:CelLocatie.UseFile                                ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:Relatie.UseFile                                   ! File referenced in 'Other Files' so need to inform it's FileManager
  SELF.FilesOpened = True
  SELF.Primary &= Relate:Planning
  IF SELF.Request = ViewRecord AND NOT SELF.BatchProcessing ! Setup actions for ViewOnly Mode
    SELF.InsertAction = Insert:None
    SELF.DeleteAction = Delete:None
    SELF.ChangeAction = Change:None
    SELF.CancelAction = Cancel:Cancel
    SELF.OkControl = 0
  ELSE
    SELF.ChangeAction = Change:Caller                      ! Changes allowed
    SELF.CancelAction = Cancel:Cancel                      ! No confirm cancel
    SELF.OkControl = ?OK
    IF SELF.PrimeUpdate() THEN RETURN Level:Notify.
  END
  SELF.Open(QuickWindow)                                   ! Open window
  	IF Self.Request = InsertRecord THEN
  		!Access:Planning.PrimeRecord(false)	
  		Pla:VerkoopID = 0
  		Pla:InkoopID = 0
  		Pla:ArtikelID = PRM:ArtikelID
  		LOC:PartijCelID = PRM:PartijCelID
  		Pla:CelLocatieID = PRM:CelLocatieID
  		Pla:KG = PRM:KG
  		Pla:Pallets = 0
  		Pla:Geprint = false
  		Pla:Verwerkt = false
  		Pla:MutatieGemaakt = false
  		Pla:Leverancier = 0
  		Pla:OverboekingCelID = 0
  		Pla:Instructie = ''
  		Pla:Transport = ''
  		Pla:PartijID = 0
  		Pla:Memo = ''
  		Pla:OverboekingPlanningID = PRM:OverboekingPlanningID
  		
  		CLEAR(VVPar:Record)
  		VVPar:PartijCelID = LOC:PartijCelID
  		IF (Access:ViewVoorraadPartij.TryFetch(VVPar:PartijCelID_K) = Level:Benign)
  			Pla:CelID = VVPar:CelID
  			Pla:VerpakkingID = VVPar:VerpakkingID
  		.
  		!Message(PRM:CelLocatieID,'PRM:CelLocatieID')
  		CL:CelLocatieID=PRM:CelLocatieID
  		Access:CelLocatie.Fetch(CL:PK_CelLocatie)
  		
  		Pla:Planning_DATE = TODAY()
  		Pla:Planning_TIME = CLOCK()
  	.
  
  	IF Self.Request=ChangeRecord 
  		IF Pla:Verwerkt = true OR Pla:MutatieGemaakt = true THEN
  			! Aanpassen, niet hier (zit geen voorraadcontrole op), maar in het voorraadverloop
  			MESSAGE('Geplande overboeking is reeds omgezet in voorraad-mutaties, wijzig deze in het voorraad-verloop')
  			RETURN RequestCancelled
  		.
  
  		IF Pla:PartijID <> 0 AND Pla:CelID <> 0
  			LOC:PartijCelID = CLIP(FORMAT(Pla:PartijID, @N05)) & '.' & CLIP(Pla:CelID)
  		ELSE
  			LOC:PartijCelID = ''
  		.
  	END
  
  	LOC:OrigineelPartijCelID1 = LOC:PartijCelID
  	LOC:OrigineelVerkoopKG = Pla:KG
  
  	CLEAR(VVPar:Record)
  	VVPar:PartijCelID = LOC:PartijCelID
  	IF (Access:ViewVoorraadPartij.TryFetch(VVPar:PartijCelID_K) <> Level:Benign)
  		LOC:PartijCelID = ''
  		Pla:PartijID=0
  		CLEAR(VVPar:Record)
  	ELSE
  		IF VVPar:ArtikelID <> Pla:ArtikelID THEN
  			LOC:PartijCelID = ''
  			Pla:PartijID=0
  			CLEAR(VVPar:Record)
  		.
  	.
  
  	IF NOT(LOC:PartijCelID='')
  		DISABLE(?Ver:VerpakkingOmschrijving)
  		DISABLE(?Cel:CelOms)
  	ELSE
  		DISABLE(?NeemVoorraad)
  		DISABLE(?LeegPartij)
  	.
  	
  	CLEAR(CEL:Record)
  	Cel:CelID=Pla:CelID
  	IF (Access:Cel.TryFetch(Cel:Cel_PK) <> Level:Benign) THEN CLEAR(CEL:Record).
  
      Clear(CL:Record)
      CL:CelLocatieID=Pla:CelLocatieID
      IF Access:CelLocatie.Fetch(CL:PK_CelLocatie)=Level:Benign
      END
      
      Clear(ACL:Record)
      ACL:CelLocatieID=Pla:OverboekCelLocatieID
      IF Access:ACelLocatie.Fetch(ACL:PK_CelLocatie)=Level:Benign
      END
  
      LOC:PressedOK = false
  
      IF GLO:HidePlanningInstructie = 1 THEN
          HIDE(?Pla:Instructie:2)
          HIDE(?Pla:Instructie:Prompt)
          ?Pla:Transport:Prompt{PROP:Ypos} = ?Pla:Instructie:2{PROP:Ypos}      !175
          ?Pla:Transport:2{PROP:Ypos} = ?Pla:Instructie:Prompt{PROP:Ypos} ! 189           ! 175    
          ?Pla:Transport:2{PROP:Height} = 110
      END
      IF Pla:OverboekSoort='' THEN Pla:OverboekSoort='Overboeking'.
      Loc:OverboekSoort=Pla:OverboekSoort
      LocalClass.HideControls()
  WinAlertMouseZoom()
  Do DefineListboxStyle
  IF SELF.Request = ViewRecord                             ! Configure controls for View Only mode
    DISABLE(?Art:ArtikelOms)
    DISABLE(?VVPar:PartijCelID)
    HIDE(?LeegPartij)
    HIDE(?NeemVoorraad)
    DISABLE(?Ver:VerpakkingOmschrijving)
    DISABLE(?CEL:CelOms)
    DISABLE(?Loc:OverboekSoort)
    DISABLE(?AAACel:CelOms)
    DISABLE(?ACL:Locatienaam)
    DISABLE(?Pla:KG)
    DISABLE(?Pla:Pallets)
    ?Pla:NieuwKG{PROP:ReadOnly} = True
    ?Pla:NieuwPallets{PROP:ReadOnly} = True
    DISABLE(?Pla:Planning_DATE)
    DISABLE(?Calendar)
    DISABLE(?Pla:Planning_TIME)
    DISABLE(?Pla:Instructie:2)
    DISABLE(?Pla:Transport:2)
  END
  Resizer.Init(AppStrategy:NoResize,Resize:SetMinSize)     ! Don't change the windows controls when window resized
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  FDCB7.Init(Art:ArtikelOms,?Art:ArtikelOms,Queue:FileDropCombo.ViewPosition,FDCB7::View:FileDropCombo,Queue:FileDropCombo,Relate:ViewArtikel,ThisWindow,GlobalErrors,0,0,0)
  FDCB7.RemoveDuplicatesFlag = TRUE
  FDCB7.Q &= Queue:FileDropCombo
  FDCB7.AddSortOrder(Art:Artikel_FK01)
  FDCB7.AddField(Art:ArtikelOms,FDCB7.Q.Art:ArtikelOms) !List box control field - type derived from field
  FDCB7.AddUpdateField(Art:ArtikelID,Pla:ArtikelID)
  ThisWindow.AddItem(FDCB7.WindowComponent)
  FDCB7.DefaultFill = 0
  FDCB8.Init(Ver:VerpakkingOmschrijving,?Ver:VerpakkingOmschrijving,Queue:FileDropCombo:1.ViewPosition,FDCB8::View:FileDropCombo,Queue:FileDropCombo:1,Relate:Verpakking,ThisWindow,GlobalErrors,0,1,0)
  FDCB8.Q &= Queue:FileDropCombo:1
  FDCB8.AddSortOrder(Ver:Verpakking_PK)
  FDCB8.AddField(Ver:VerpakkingOmschrijving,FDCB8.Q.Ver:VerpakkingOmschrijving) !List box control field - type derived from field
  FDCB8.AddUpdateField(Ver:VerpakkingID,Pla:VerpakkingID)
  ThisWindow.AddItem(FDCB8.WindowComponent)
  FDCB8.DefaultFill = 0
  FDCB9.Init(CEL:CelOms,?CEL:CelOms,Queue:FileDropCombo:2.ViewPosition,FDCB9::View:FileDropCombo,Queue:FileDropCombo:2,Relate:Cel,ThisWindow,GlobalErrors,0,1,0)
  FDCB9.Q &= Queue:FileDropCombo:2
  FDCB9.AddSortOrder(CEL:CEL_PK)
  FDCB9.AddField(CEL:CelOms,FDCB9.Q.CEL:CelOms) !List box control field - type derived from field
  FDCB9.AddField(CEL:CelID,FDCB9.Q.CEL:CelID) !Primary key field - type derived from field
  FDCB9.AddUpdateField(CEL:CelID,Pla:CelID)
  ThisWindow.AddItem(FDCB9.WindowComponent)
  FDCB9.DefaultFill = 0
  FDCB4.Init(VVPar:PartijCelID,?VVPar:PartijCelID,Queue:FileDropCombo:3.ViewPosition,FDCB4::View:FileDropCombo,Queue:FileDropCombo:3,Relate:ViewVoorraadPartij,ThisWindow,GlobalErrors,0,0,0)
  FDCB4.Q &= Queue:FileDropCombo:3
  FDCB4.AddSortOrder(VVPar:ArtikelID_PartijID_CelID_K)
  FDCB4.AddRange(VVPar:ArtikelID,Pla:ArtikelID)
  FDCB4.SetFilter('VVPar:VoorraadKG>0')
  FDCB4.AddField(VVPar:PartijCelID,FDCB4.Q.VVPar:PartijCelID) !List box control field - type derived from field
  FDCB4.AddField(Par:PartijID,FDCB4.Q.Par:PartijID) !List box control field - type derived from field
  FDCB4.AddField(Par:ExternPartijnr,FDCB4.Q.Par:ExternPartijnr) !List box control field - type derived from field
  FDCB4.AddField(VVParT:VoorraadKG,FDCB4.Q.VVParT:VoorraadKG) !List box control field - type derived from field
  FDCB4.AddField(VPParT:VerkoopKG,FDCB4.Q.VPParT:VerkoopKG) !List box control field - type derived from field
  FDCB4.AddField(Par:AanmaakDatum_DATE,FDCB4.Q.Par:AanmaakDatum_DATE) !List box control field - type derived from field
  FDCB4.AddField(ACel:CelOms,FDCB4.Q.ACel:CelOms) !List box control field - type derived from field
  FDCB4.AddField(VVPar:VoorraadKG,FDCB4.Q.VVPar:VoorraadKG) !List box control field - type derived from field
  FDCB4.AddField(LOC:VerkoopKG,FDCB4.Q.LOC:VerkoopKG) !List box control field - type derived from local data
  FDCB4.AddField(LOC:BeschikbareVoorraad,FDCB4.Q.LOC:BeschikbareVoorraad) !List box control field - type derived from local data
  FDCB4.AddField(AREL:FirmaNaam,FDCB4.Q.AREL:FirmaNaam) !List box control field - type derived from field
  FDCB4.AddField(AVP:VerpakkingOmschrijving,FDCB4.Q.AVP:VerpakkingOmschrijving) !List box control field - type derived from field
  FDCB4.AddField(VVPar:PartijID,FDCB4.Q.VVPar:PartijID) !Browse hot field - type derived from field
  FDCB4.AddField(ACel:CelID,FDCB4.Q.ACel:CelID) !Related join file key field - type derived from field
  FDCB4.AddField(AREL:RelatieID,FDCB4.Q.AREL:RelatieID) !Related join file key field - type derived from field
  FDCB4.AddField(AVP:VerpakkingID,FDCB4.Q.AVP:VerpakkingID) !Related join file key field - type derived from field
  FDCB4.AddField(VPPar:PartijCelID,FDCB4.Q.VPPar:PartijCelID) !Related join file key field - type derived from field
  FDCB4.AddField(VPParT:PartijID,FDCB4.Q.VPParT:PartijID) !Related join file key field - type derived from field
  FDCB4.AddField(VVParT:PartijID,FDCB4.Q.VVParT:PartijID) !Related join file key field - type derived from field
  FDCB4.AddUpdateField(VVPar:PartijCelID,LOC:PartijCelID)
  FDCB4.AddUpdateField(Par:VerpakkingID,LOC:VerpakkingID)
  FDCB4.AddUpdateField(VVPar:CelID,LOC:CelID)
  FDCB4.AddUpdateField(VVPar:PartijID,Pla:PartijID)
  ThisWindow.AddItem(FDCB4.WindowComponent)
  FDCB4.DefaultFill = 0
  FDCB13.Init(AAACel:CelOms,?AAACel:CelOms,Queue:FileDropCombo:4.ViewPosition,FDCB13::View:FileDropCombo,Queue:FileDropCombo:4,Relate:AAACel,ThisWindow,GlobalErrors,0,1,0)
  FDCB13.Q &= Queue:FileDropCombo:4
  FDCB13.AddSortOrder(AAACel:CEL_PK)
  FDCB13.AddField(AAACel:CelOms,FDCB13.Q.AAACel:CelOms) !List box control field - type derived from field
  FDCB13.AddField(AAACel:CelID,FDCB13.Q.AAACel:CelID) !Browse hot field - type derived from field
  FDCB13.AddUpdateField(AAACel:CelID,Pla:OverboekingCelID)
  ThisWindow.AddItem(FDCB13.WindowComponent)
  FDCB13.DefaultFill = 0
  FDCB14.Init(ACL:Locatienaam,?ACL:Locatienaam,Queue:FileDropCombo:5.ViewPosition,FDCB14::View:FileDropCombo,Queue:FileDropCombo:5,Relate:ACelLocatie,ThisWindow,GlobalErrors,0,1,0)
  FDCB14.Q &= Queue:FileDropCombo:5
  FDCB14.AddSortOrder(ACL:FK_CelLocatie)
  FDCB14.AddRange(ACL:CelID,Pla:OverboekingCelID)
  FDCB14.AddField(ACL:Locatienaam,FDCB14.Q.ACL:Locatienaam) !List box control field - type derived from field
  FDCB14.AddField(ACL:CelLocatieID,FDCB14.Q.ACL:CelLocatieID) !Browse hot field - type derived from field
  FDCB14.AddField(ACL:CelID,FDCB14.Q.ACL:CelID) !Browse hot field - type derived from field
  FDCB14.AddUpdateField(ACL:CelLocatieID,Pla:OverboekCelLocatieID)
  ThisWindow.AddItem(FDCB14.WindowComponent)
  FDCB14.DefaultFill = 0
  SELF.SetAlerts()
  EnterByTabManager.ExcludeControl(?Cancel)
  EnterByTabManager.ExcludeControl(?OK)
  EnterByTabManager.Init(False)
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:AAACel.Close
    Relate:ACelLocatie.Close
    Relate:APlanning.Close
    Relate:Cel.Close
    Relate:Mutatie.Close
    Relate:Planning.Close
    Relate:Verpakking.Close
    Relate:ViewArtikel.Close
    Relate:ViewPlanningPartij.Close
    Relate:ViewVoorraadPartij.Close
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.PrimeUpdate PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.PrimeUpdate()
    If returnValue = Level:Fatal  ! delete just occured
      ThisNetRefresh.Send('|Planning|ViewArtikel|Verpakking|Cel|ViewVoorraadPartij|AAACel|ACelLocatie|') ! NetTalk (NetRefresh)
    End
  		If returnValue = Level:Fatal  ! delete just occured
  			NetRefreshPlanningViews()
  		End
  RETURN ReturnValue


ThisWindow.Run PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  	IF Globalrequest=DeleteRecord
  		IF Pla:Verwerkt
  			RETURN RequestCancelled
  			
  			IF MESSAGE('Deze overboeking is al verwerkt, zeker dat deze overboeking en bijbehorende mutaties verwijderd moeten worden?','Verwerkte overboeking',ICON:Exclamation,BUTTON:Yes+BUTTON:No,BUTTON:No,1) <> BUTTON:Yes
  				RETURN ReturnValue
  			END
  
  			CLEAR(Mut:RECORD)
  			Mut:PlanningID = Pla:PlanningID
  			SET(Mut:Mutatie_FK02, Mut:Mutatie_FK02)
  			
  			LOOP UNTIL Access:Mutatie.Next()
  				IF Mut:PlanningID <> Pla:PlanningID THEN BREAK.
  				
  				IF Mut:SoortMutatie = 'OUIT' THEN
  					Access:Mutatie.DeleteRecord(0)
  				ELSIF Mut:SoortMutatie = 'OIN' THEN
  					Access:Mutatie.DeleteRecord(0)
  				END
  			.
  		END
  	END
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
    CASE ACCEPTED()
    OF ?LeegPartij
      IF MESSAGE('Zeker weten dat er geen partij meer geselecteerd moet zijn?', 'Geen partij', ICON:Exclamation, BUTTON:Yes+BUTTON:No, BUTTON:No) = BUTTON:Yes THEN
      	LOC:PartijCelID = ''
      	VVPar:PartijCelID = ''
      	Pla:PartijID = 0
      
      	DISPLAY(?VVPar:PartijCelID)
      
      	ENABLE(?Ver:VerpakkingOmschrijving)
      	ENABLE(?Cel:CelOms)
      	DISABLE(?NeemVoorraad)
      	DISABLE(?LeegPartij)
      END
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?VVPar:PartijCelID
      IF NOT(LOC:PartijCelID='')
      	Pla:VerpakkingID = LOC:VerpakkingID
      	Pla:CelID = LOC:CelID
      
      	db.DebugOut('PartijAccepted:'&Pla:VErpakkingID&','&Pla:CelID)
      
      	!FDCB8.ResetQueue(false)
      	!FDCB9.ResetQueue(false)
      
      	db.DebugOut('PartijAccepted-EVENT:'&EVENT())
      
      	!IF NOT(EVENT() = EVENT:Completed)
      		CLEAR(Ver:record)
      		Ver:VerpakkingID=Pla:VerpakkingID
      		Access:Verpakking.TryFetch(Ver:Verpakking_PK)
      
      		CLEAR(Cel:Record)
      		Cel:CelID=Pla:CelID
      		Access:Cel.TryFetch(Cel:CEL_PK)
      	
      		DISABLE(?Ver:VerpakkingOmschrijving)
      		DISABLE(?CEL:CelOms)
      		ENABLE(?NeemVoorraad)
      		ENABLE(?LeegPartij)
      
      		DISPLAY(?Ver:VerpakkingOmschrijving)
      		DISPLAY(?Cel:CelOms)
      
      	    IF Pla:KG = 0 !OR Pla:KG > VVPar:VoorraadKG
      			Pla:KG = FDCB4.Q.LOC:BeschikbareVoorraad
      		.
      
      		IF Pla:Pallets = 0 !OR Pla:Pallets > VVPar:VoorraadPallets
      			Pla:Pallets = VVPar:VoorraadPallets
      		.
      	!.
      END
    OF ?NeemVoorraad
      ThisWindow.Update()
      IF NOT(LOC:PartijCelID = '')
      	Pla:KG = VVPar:VoorraadKG
      	Pla:Pallets = VVPar:VoorraadPallets
      	DISPLAY(?Pla:KG)
      	DISPLAY(?Pla:Pallets)
      .
    OF ?Loc:OverboekSoort
          LocalClass.HideControls()
    OF ?AAACel:CelOms
      If 0{PROP:AcceptAll} = False Then
          If NOT ACL:CelID = AAACel:CelID Then
              Clear(ACL:Locatienaam)
              Clear(Pla:CelLocatieID)
              Display(?ACL:Locatienaam)
          End
      End
    OF ?Calendar
      ThisWindow.Update()
      Calendar11.SelectOnClose = True
      Calendar11.Ask('Select a Date',Pla:Planning_DATE)
      IF Calendar11.Response = RequestCompleted THEN
      Pla:Planning_DATE=Calendar11.SelectedDate
      DISPLAY(?Pla:Planning_DATE)
      END
      ThisWindow.Reset(True)
    OF ?OK
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
  IF Pla:CelID = 0 AND (Loc:OverboekSoort = Boeksoort.Overboeking OR Loc:OverboekSoort = Boeksoort.Verplaatsing)
  	Select(?CEL:CelOms)
  	RETURN ReturnValue
  .
  
  IF Pla:OverboekingCelID = 0 AND (Loc:OverboekSoort = Boeksoort.Overboeking OR Loc:OverboekSoort = Boeksoort.Verplaatsing)
  	Select(?AAACel:CelOms)
  	RETURN ReturnValue
  .
  
  IF Pla:CelLocatieID = 0 AND (Loc:OverboekSoort = Boeksoort.Overboeking OR Loc:OverboekSoort = Boeksoort.Verplaatsing)
      Select(?ACL:Locatienaam)
      RETURN ReturnValue
  .
  
  IF ACL:CelID <> Pla:OverboekingCelID THEN
      Message('Cel van de gekozen locatie komt niet overeen met de geselecteerde cel.|Selecteer opnieuw de locatie.')
      Select(?ACL:Locatienaam)
      RETURN ReturnValue
  .
  
  !IF Lco:OverboekSoort = 
   
  LOOP
    IF Looped
      RETURN Level:Notify
    ELSE
      Looped = 1
    END
  	IF Pla:Verwerkt OR Pla:MutatieGemaakt
  		IF NOT(MESSAGE('Deze overboeking is al verwerkt, Weet u zeker dat deze overboeking en bijbehorende mutaties gewijzigd moet worden?','Verwerkte overboeking',ICON:Exclamation,BUTTON:Yes+BUTTON:No,BUTTON:No,1) = BUTTON:Yes)
  			RETURN Level:Benign
  		END
  	END
  ReturnValue = PARENT.TakeCompleted()
  	IF Pla:Verwerkt OR Pla:MutatieGemaakt
  		CLEAR(Mut:RECORD)
  		Mut:PlanningID = Pla:PlanningID
  		SET(Mut:Mutatie_FK02, Mut:Mutatie_FK02)
  		LOOP UNTIL Access:Mutatie.Next()
  			IF Mut:PlanningID <> Pla:PlanningID THEN BREAK.
  
  			IF Mut:SoortMutatie = 'OUIT' THEN
  				Mut:DatumTijd_DATE = Pla:Planning_DATE
  				Mut:DatumTijd_TIME = Pla:Planning_TIME + 1
  				Mut:UitslagKG = Pla:KG
  				Mut:UitslagPallet = Pla:Pallets
  				Mut:NaarCELID = Pla:OverboekingCelID
  				Access:Mutatie.Update()
  			ELSIF Mut:SoortMutatie = 'OIN' THEN
  				Mut:DatumTijd_DATE = Pla:Planning_DATE
  				Mut:DatumTijd_TIME = Pla:Planning_TIME
  				Mut:InslagKG = Pla:KG
  				Mut:InslagPallet = Pla:Pallets
  				Mut:NaarCELID = Pla:CelID
  				Access:Mutatie.Update()
  			END
  		.
  	END
    ThisNetRefresh.Send('|Planning|ViewArtikel|Verpakking|Cel|ViewVoorraadPartij|AAACel|ACelLocatie|') ! NetTalk (NetRefresh)
  	NetRefreshPlanningViews()
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

LocalClass.HideControls    PROCEDURE()
CODE
    IF NOT INLIST(Loc:OverboekSoort,Boeksoort.Afboeking, Boeksoort.Verplaatsing, Boeksoort.Correctie, Boeksoort.Overboeking)
        Message('Onbekende OverBoeksoort '&Loc:OverboekSoort)
    END
    
   
    ?Pla:Transport:Prompt{Prop:Hide}=CHOOSE(Loc:OverboekSoort= Boeksoort.Overboeking, FALSE, TRUE)
    ?Pla:Transport:2{Prop:Hide}=CHOOSE(Loc:OverboekSoort= Boeksoort.Overboeking, FALSE, TRUE)
    
    ?PROMPT2{Prop:Hide}=CHOOSE(Loc:OverboekSoort = Boeksoort.Afboeking OR Loc:OverboekSoort = Boeksoort.Correctie, TRUE, FALSE)
    ?AAACel:CelOms{Prop:Hide}=CHOOSE(Loc:OverboekSoort = Boeksoort.Afboeking OR Loc:OverboekSoort = Boeksoort.Correctie, TRUE, FALSE)
    ?STRING1{Prop:Hide}=CHOOSE(Loc:OverboekSoort = Boeksoort.Afboeking OR Loc:OverboekSoort = Boeksoort.Correctie, TRUE, FALSE)
    ?ACL:Locatienaam{Prop:Hide}=CHOOSE(Loc:OverboekSoort = Boeksoort.Afboeking OR Loc:OverboekSoort = Boeksoort.Correctie, TRUE, FALSE)
    
    ?Pla:KG:Prompt{Prop:Disable}=CHOOSE(Loc:OverboekSoort = Boeksoort.Afboeking OR Loc:OverboekSoort=Boeksoort.Correctie, TRUE, FALSE)
    ?Pla:KG{Prop:Disable}=CHOOSE(Loc:OverboekSoort = Boeksoort.Afboeking OR Loc:OverboekSoort=Boeksoort.Correctie, TRUE, FALSE)
    ?Pla:Pallets:Prompt{Prop:Disable}=CHOOSE(Loc:OverboekSoort = Boeksoort.Afboeking OR Loc:OverboekSoort=Boeksoort.Correctie, TRUE, FALSE)
    ?Pla:Pallets{Prop:Disable}=CHOOSE(Loc:OverboekSoort = Boeksoort.Afboeking OR Loc:OverboekSoort=Boeksoort.Correctie, TRUE, FALSE)
    
    ?Pla:NieuwKG{Prop:Hide}=CHOOSE(Loc:OverboekSoort = Boeksoort.Correctie, FALSE, TRUE)
    ?Loc:NieuwKG:Prompt{Prop:Hide}=CHOOSE(Loc:OverboekSoort = Boeksoort.Correctie, FALSE, TRUE)
    ?Pla:NieuwPallets{Prop:Hide}=CHOOSE(Loc:OverboekSoort = Boeksoort.Correctie, FALSE, TRUE)
    ?Loc:NieuwPallet:Prompt{Prop:Hide}=CHOOSE(Loc:OverboekSoort = Boeksoort.Correctie, FALSE, TRUE)
    
    Case Loc:OverboekSoort
    OF 'Overboeking'
    OF 'Verplaatsing'
    OF 'Afboeking'
    OF 'Correctie'
    ELSE
        Message('Onbekende OverBoeksoort '&Loc:OverboekSoort)
        
        END

FDCB4.SetQueueRecord PROCEDURE

  CODE
  CLEAR(VPPar:Record)
  VPPar:PartijCelID=VVPar:PartijCelID
  Access:ViewPlanningPartij.TryFetch(VPPar:PartijCelID_K)
  
  LOC:VerkoopKG = VPPar:VerkoopKG
  !Het betreft een overboeking, die wordt niet bij de VerkoopKG-telling meegenomen
  !IF VVPar:PartijCelID = LOC:OrigineelPartijCelID THEN
  !	LOC:VerkoopKG -= LOC:OrigineelVerkoopKG
  !.
  
  LOC:BeschikbareVoorraad = VVPar:VoorraadKG - LOC:VerkoopKG
  
  
  
  PARENT.SetQueueRecord
  


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window

