

   MEMBER('VoorrPln.clw')                                  ! This is a MEMBER module


   INCLUDE('ABDROPS.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABUTIL.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('VOORRPLN012.INC'),ONCE        !Local module procedure declarations
                     END


!!! <summary>
!!! Generated from procedure template - Window
!!! Form Planning
!!! </summary>
UpdateAOverboeking PROCEDURE (PRM:Request, PRM:ArtikelID, PRM:PartijCelID,PRM:CelLocatieID, PRM:OverboekingPlanningID, PRM:KG)

udpt            UltimateDebugProcedureTracker
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
LOC:OrigineelPartijCelID CSTRING(26)                       ! 
LOC:OrigineelVerkoopKG DECIMAL(9,2)                        ! 
LOC:VerkoopKG        DECIMAL(9,2)                          ! 
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
                       PROJECT(VVPar:CelID)
                       PROJECT(VVPar:PartijID)
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
ACL:CelLocatieID       LIKE(ACL:CelLocatieID)         !Primary key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
LocEnableEnterByTab  BYTE(1)                               !Used by the ENTER Instead of Tab template
EnterByTabManager    EnterByTabClass
History::APla:Record LIKE(APla:RECORD),THREAD
QuickWindow          WINDOW('Form Planning'),AT(,,367,306),FONT('MS Sans Serif',8,,,CHARSET:DEFAULT),DOUBLE,CENTER, |
  GRAY,IMM,MDI,HLP('UpdatePlanning'),SYSTEM
                       SHEET,AT(4,4,355,282),USE(?CurrentTab)
                         TAB('&1) General'),USE(?Tab:1)
                           PROMPT('Artikel:'),AT(9,26),USE(?APla:ArtikelID:Prompt),TRN
                           COMBO(@s60),AT(69,27,282,10),USE(Art:ArtikelOms),DROP(25),FORMAT('240L(2)~Omschrijving~L(3)@s60@'), |
  FROM(Queue:FileDropCombo),REQ
                           PROMPT('Partij:'),AT(9,42),USE(?PROMPT1)
                           COMBO(@s25),AT(69,42,177,10),USE(VVPar:PartijCelID),DROP(25,700),FORMAT('0L(2)|~Partij.' & |
  'Cel~C(0)@s25@[39R(2)|M~Intern~C(0)@n-14.@45L(2)|M~Extern~C(1)@s20@52R(2)|M~Voorraad ' & |
  '(KG)~C(0)@n-12`2@54R(2)|M~Verkocht (KG)~C(0)@n-12`2@47L(2)|~Inslagdatum~C(0)@d17@](2' & |
  '51)|~Partij~[40L(2)|M~Cel~C(0)@s50@50R(2)|M~Voorraad (KG)~C(0)@n-12`2@55R(2)|M~Verko' & |
  'cht (KG)~C(0)@n-13`2@78R(2)|M~Beschikbaar (KG)~C(0)@n-13`2@](211)|~Cel~74L(2)|M~Leve' & |
  'rancier~C(0)@s50@80L(2)|M~Verpakking~C(0)@s50@'),FROM(Queue:FileDropCombo:3),IMM
                           PROMPT('Verpakking:'),AT(9,58),USE(?APla:VerpakkingID:Prompt),TRN
                           COMBO(@s50),AT(69,58,282,10),USE(Ver:VerpakkingOmschrijving),DROP(25),FORMAT('200L(2)~Om' & |
  'schrijving~L(3)@s50@'),FROM(Queue:FileDropCombo:1),IMM
                           PROMPT('Van Cel:'),AT(9,73),USE(?APla:CelID:Prompt),TRN
                           COMBO(@s50),AT(69,74,282,10),USE(CEL:CelOms),DROP(25),FORMAT('200L(2)~Omschrijving~L(3)@s50@'), |
  FROM(Queue:FileDropCombo:2),IMM
                           PROMPT('Tot Cel:'),AT(9,99),USE(?PROMPT2)
                           COMBO(@s50),AT(69,100,282,10),USE(AAACel:CelOms),DROP(5),FORMAT('200L(2)|M~Omschrijving~@s50@'), |
  FROM(Queue:FileDropCombo:4),IMM
                           PROMPT('KG:'),AT(9,130),USE(?APla:KG:Prompt),TRN
                           COMBO(@s50),AT(69,115,282,10),USE(ACL:Locatienaam),VSCROLL,DROP(25),FORMAT('200L(2)|M~L' & |
  'ocatienaam~L(0)@s50@'),FROM(Queue:FileDropCombo:5),IMM
                           ENTRY(@n12_`2),AT(70,130,64,10),USE(APla:KG),RIGHT(2),REQ
                           PROMPT('Pallets:'),AT(9,146),USE(?APla:Pallets:Prompt),TRN
                           ENTRY(@n14),AT(70,146,64,10),USE(APla:Pallets),RIGHT(2)
                           PROMPT('Datum:'),AT(9,161),USE(?APla:Planning_DATE:Prompt),TRN
                           ENTRY(@d6-),AT(70,161,64,10),USE(APla:Planning_DATE),RIGHT(2)
                           BUTTON('...'),AT(137,159,12,12),USE(?Calendar)
                           PROMPT('Tijdstip:'),AT(173,162),USE(?APla:Planning_TIME:Prompt),TRN
                           ENTRY(@t7),AT(205,162,41,10),USE(APla:Planning_TIME),RIGHT(2)
                           PROMPT('Instructie:'),AT(9,175),USE(?APla:Instructie:Prompt),CENTER
                           PROMPT('Transport:'),AT(9,231),USE(?APla:Transport:Prompt)
                           BUTTON('Leeg'),AT(251,40,34),USE(?LeegPartij)
                           BUTTON('Neem voorraad'),AT(287,40),USE(?NeemVoorraad)
                           STRING('Locatie:'),AT(19,114),USE(?STRING1)
                           PROMPT('Locatie:'),AT(21,86),USE(?PROMPT3),HIDE
                           STRING(@S10),AT(68,88),USE(CL:Locatienaam,,?CL:Locatienaam:2),FONT('Microsoft Sans Serif', |
  ,,FONT:bold),HIDE
                           TEXT,AT(70,175,280),USE(APla:Instructie,,?APla:Instructie:2)
                           TEXT,AT(70,230,279),USE(APla:Transport,,?APla:Transport:2)
                         END
                       END
                       BUTTON('&OK'),AT(244,290,49,14),USE(?OK),LEFT,ICON('WAOK.ICO'),DEFAULT,FLAT,MSG('Accept dat' & |
  'a and close the window'),TIP('Accept data and close the window')
                       BUTTON('&Annuleren'),AT(296,290,69,14),USE(?Cancel),LEFT,ICON('WACANCEL.ICO'),FLAT,MSG('Cancel operation'), |
  TIP('Cancel operation')
                       STRING(@N_10),AT(309,4),USE(APla:PlanningID)
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
CurCtrlFeq          LONG
FieldColorQueue     QUEUE
Feq                   LONG
OldColor              LONG
                    END

  CODE
? DEBUGHOOK(AAACel:Record)
? DEBUGHOOK(ACelLocatie:Record)
? DEBUGHOOK(APlanning:Record)
? DEBUGHOOK(Cel:Record)
? DEBUGHOOK(CelLocatie:Record)
? DEBUGHOOK(Mutatie:Record)
? DEBUGHOOK(Relatie:Record)
? DEBUGHOOK(Verpakking:Record)
? DEBUGHOOK(ViewArtikel:Record)
? DEBUGHOOK(ViewPlanningPartij:Record)
? DEBUGHOOK(ViewVoorraadPartij:Record)
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
        udpt.Init(UD,'UpdateAOverboeking','VoorrPln012.clw','VoorrPln.DLL','06/28/2024 @ 01:22PM')    
             
  GlobalErrors.SetProcedureName('UpdateAOverboeking')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?APla:ArtikelID:Prompt
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.HistoryKey = CtrlH
  SELF.AddHistoryFile(APla:Record,History::APla:Record)
  SELF.AddHistoryField(?APla:KG,5)
  SELF.AddHistoryField(?APla:Pallets,6)
  SELF.AddHistoryField(?APla:Planning_DATE,9)
  SELF.AddHistoryField(?APla:Planning_TIME,10)
  SELF.AddHistoryField(?APla:Instructie:2,20)
  SELF.AddHistoryField(?APla:Transport:2,21)
  SELF.AddHistoryField(?APla:PlanningID,1)
  SELF.AddUpdateFile(Access:APlanning)
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  Relate:AAACel.Open                                       ! File AAACel used by this procedure, so make sure it's RelationManager is open
  Relate:ACelLocatie.Open                                  ! File ACelLocatie used by this procedure, so make sure it's RelationManager is open
  Relate:APlanning.Open                                    ! File APlanning used by this procedure, so make sure it's RelationManager is open
  Relate:Cel.SetOpenRelated()
  Relate:Cel.Open                                          ! File Cel used by this procedure, so make sure it's RelationManager is open
  Relate:Mutatie.Open                                      ! File Mutatie used by this procedure, so make sure it's RelationManager is open
  Relate:Relatie.SetOpenRelated()
  Relate:Relatie.Open                                      ! File Relatie used by this procedure, so make sure it's RelationManager is open
  Relate:Verpakking.Open                                   ! File Verpakking used by this procedure, so make sure it's RelationManager is open
  Relate:ViewArtikel.Open                                  ! File ViewArtikel used by this procedure, so make sure it's RelationManager is open
  Relate:ViewPlanningPartij.Open                           ! File ViewPlanningPartij used by this procedure, so make sure it's RelationManager is open
  Relate:ViewVoorraadPartij.Open                           ! File ViewVoorraadPartij used by this procedure, so make sure it's RelationManager is open
  Access:CelLocatie.UseFile                                ! File referenced in 'Other Files' so need to inform it's FileManager
  SELF.FilesOpened = True
  SELF.Primary &= Relate:APlanning
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
  	IF PRM:Request = InsertRecord THEN
  		APla:VerkoopID = 0
  		APla:InkoopID = 0
  		APla:ArtikelID = PRM:ArtikelID
  		LOC:PartijCelID = PRM:PartijCelID
  		APla:OverboekingCelID = 0
  		APla:CelLocatieID = 0
  		!APla:CelLocatieID = PRM:CelLocatieID
  		APla:KG = PRM:KG
  		APla:Pallets = 0
  		APla:Geprint = false
  		APla:Verwerkt = false
  		APla:MutatieGemaakt = false
  		APla:Leverancier = 0
  		APla:OverboekingCelID = 0
  		APla:Instructie = ''
  		APla:Transport = ''
  		APla:PartijID = 0
  		APla:Memo = ''
  		APla:OverboekingPlanningID = PRM:OverboekingPlanningID
  		
  		CLEAR(VVPar:Record)
  		VVPar:PartijCelID = LOC:PartijCelID
  		IF (Access:ViewVoorraadPartij.TryFetch(VVPar:PartijCelID_K) = Level:Benign)
  			APla:CelID = VVPar:CelID
  			APla:VerpakkingID = VVPar:VerpakkingID
  		.
  		!Message(PRM:CelLocatieID,'PRM:CelLocatieID')
  		CL:CelLocatieID=PRM:CelLocatieID
  		Access:CelLocatie.Fetch(CL:PK_CelLocatie)
  		
  		APla:Planning_DATE = TODAY()
  		APla:Planning_TIME = CLOCK()
  	ELSIF PRM:Request = ChangeRecord THEN
  		IF APla:Verwerkt = TRUE OR APla:MutatieGemaakt = TRUE THEN
  			! Aanpassen, niet hier (zit geen voorraadcontrole op), maar in het voorraadverloop
  			MESSAGE('Geplande overboeking is reeds omgezet in voorraad-mutaties, wijzig deze in het voorraad-verloop')
  			RETURN RequestCancelled
  		.
  
  		IF APla:PartijID <> 0 AND APla:CelID <> 0
  			LOC:PartijCelID = CLIP(FORMAT(APla:PartijID, @N05)) & '.' & CLIP(APla:CelID)
  		ELSE
  			LOC:PartijCelID = ''
  		END
  	END
  
  	LOC:OrigineelPartijCelID = LOC:PartijCelID
  	LOC:OrigineelVerkoopKG = APla:KG
  
  	CLEAR(VVPar:Record)
  	VVPar:PartijCelID = LOC:PartijCelID
  	IF (Access:ViewVoorraadPartij.TryFetch(VVPar:PartijCelID_K) <> Level:Benign)
  		LOC:PartijCelID = ''
  		APla:PartijID=0
  		CLEAR(VVPar:Record)
  	ELSE
  		IF VVPar:ArtikelID <> APla:ArtikelID THEN
  			LOC:PartijCelID = ''
  			APla:PartijID=0
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
  	Cel:CelID=APla:CelID
  	IF (Access:Cel.TryFetch(Cel:Cel_PK) <> Level:Benign) THEN CLEAR(CEL:Record).
  
  	CLEAR(AAACel:Record)
  	AAACel:CelID = APla:OverboekingCelID
  	IF (Access:AAACel.TryFetch(AAACel:Cel_PK) <> Level:Benign) THEN CLEAR(AAACEL:Record).
  
  	CLEAR(ACL:Record)
  	ACL:CelLocatieID = APla:CelLocatieID
  	IF (Access:ACelLocatie.TryFetch(ACel:CEL_PK) <> Level:Benign) THEN CLEAR(ACL:Record).
  
  	LOC:PressedOK = false
  
      IF GLO:HidePlanningInstructie = 1 THEN
          HIDE(?APla:Instructie:2)
          HIDE(?APla:Instructie:Prompt)
          ?APla:Transport:2{Prop:Ypos} = 175
          ?APla:Transport:2{Prop:Height} = 110        
          ?APla:Transport:Prompt{Prop:Ypos} = 175
      END
  Do DefineListboxStyle
  Alert(AltKeyPressed)  ! WinEvent : These keys cause a program to crash on Windows 7 and Windows 10.
  Alert(F10Key)         !
  Alert(CtrlF10)        !
  Alert(ShiftF10)       !
  Alert(CtrlShiftF10)   !
  Alert(AltSpace)       !
  WinAlertMouseZoom()
  QuickWindow{Prop:Alrt,255} = CtrlShiftP
  IF SELF.Request = ViewRecord                             ! Configure controls for View Only mode
    DISABLE(?Art:ArtikelOms)
    DISABLE(?VVPar:PartijCelID)
    DISABLE(?Ver:VerpakkingOmschrijving)
    DISABLE(?CEL:CelOms)
    DISABLE(?AAACel:CelOms)
    DISABLE(?ACL:Locatienaam)
    ?APla:KG{PROP:ReadOnly} = True
    ?APla:Pallets{PROP:ReadOnly} = True
    ?APla:Planning_DATE{PROP:ReadOnly} = True
    DISABLE(?Calendar)
    ?APla:Planning_TIME{PROP:ReadOnly} = True
    DISABLE(?LeegPartij)
    DISABLE(?NeemVoorraad)
  END
  Resizer.Init(AppStrategy:NoResize,Resize:SetMinSize)     ! Don't change the windows controls when window resized
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('UpdateAOverboeking',QuickWindow)           ! Restore window settings from non-volatile store
  FDCB7.Init(Art:ArtikelOms,?Art:ArtikelOms,Queue:FileDropCombo.ViewPosition,FDCB7::View:FileDropCombo,Queue:FileDropCombo,Relate:ViewArtikel,ThisWindow,GlobalErrors,0,0,0)
  FDCB7.RemoveDuplicatesFlag = TRUE
  FDCB7.Q &= Queue:FileDropCombo
  FDCB7.AddSortOrder(Art:Artikel_FK01)
  FDCB7.AddField(Art:ArtikelOms,FDCB7.Q.Art:ArtikelOms) !List box control field - type derived from field
  FDCB7.AddUpdateField(Art:ArtikelID,APla:ArtikelID)
  ThisWindow.AddItem(FDCB7.WindowComponent)
  FDCB7.DefaultFill = 0
  FDCB8.Init(Ver:VerpakkingOmschrijving,?Ver:VerpakkingOmschrijving,Queue:FileDropCombo:1.ViewPosition,FDCB8::View:FileDropCombo,Queue:FileDropCombo:1,Relate:Verpakking,ThisWindow,GlobalErrors,0,1,0)
  FDCB8.Q &= Queue:FileDropCombo:1
  FDCB8.AddSortOrder(Ver:Verpakking_PK)
  FDCB8.AddField(Ver:VerpakkingOmschrijving,FDCB8.Q.Ver:VerpakkingOmschrijving) !List box control field - type derived from field
  FDCB8.AddUpdateField(Ver:VerpakkingID,APla:VerpakkingID)
  ThisWindow.AddItem(FDCB8.WindowComponent)
  FDCB8.DefaultFill = 0
  FDCB9.Init(CEL:CelOms,?CEL:CelOms,Queue:FileDropCombo:2.ViewPosition,FDCB9::View:FileDropCombo,Queue:FileDropCombo:2,Relate:Cel,ThisWindow,GlobalErrors,0,1,0)
  FDCB9.Q &= Queue:FileDropCombo:2
  FDCB9.AddSortOrder(CEL:CEL_PK)
  FDCB9.AddField(CEL:CelOms,FDCB9.Q.CEL:CelOms) !List box control field - type derived from field
  FDCB9.AddField(CEL:CelID,FDCB9.Q.CEL:CelID) !Primary key field - type derived from field
  FDCB9.AddUpdateField(CEL:CelID,APla:CelID)
  ThisWindow.AddItem(FDCB9.WindowComponent)
  FDCB9.DefaultFill = 0
  FDCB4.Init(VVPar:PartijCelID,?VVPar:PartijCelID,Queue:FileDropCombo:3.ViewPosition,FDCB4::View:FileDropCombo,Queue:FileDropCombo:3,Relate:ViewVoorraadPartij,ThisWindow,GlobalErrors,0,0,0)
  FDCB4.Q &= Queue:FileDropCombo:3
  FDCB4.AddSortOrder(VVPar:ArtikelID_PartijID_CelID_K)
  FDCB4.AddRange(VVPar:ArtikelID,APla:ArtikelID)
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
  FDCB4.AddField(ACel:CelID,FDCB4.Q.ACel:CelID) !Related join file key field - type derived from field
  FDCB4.AddField(AREL:RelatieID,FDCB4.Q.AREL:RelatieID) !Related join file key field - type derived from field
  FDCB4.AddField(AVP:VerpakkingID,FDCB4.Q.AVP:VerpakkingID) !Related join file key field - type derived from field
  FDCB4.AddField(VPPar:PartijCelID,FDCB4.Q.VPPar:PartijCelID) !Related join file key field - type derived from field
  FDCB4.AddField(VPParT:PartijID,FDCB4.Q.VPParT:PartijID) !Related join file key field - type derived from field
  FDCB4.AddField(VVParT:PartijID,FDCB4.Q.VVParT:PartijID) !Related join file key field - type derived from field
  FDCB4.AddUpdateField(VVPar:PartijCelID,LOC:PartijCelID)
  FDCB4.AddUpdateField(Par:VerpakkingID,LOC:VerpakkingID)
  FDCB4.AddUpdateField(VVPar:CelID,LOC:CelID)
  FDCB4.AddUpdateField(VVPar:PartijID,APla:PartijID)
  ThisWindow.AddItem(FDCB4.WindowComponent)
  FDCB4.DefaultFill = 0
  FDCB13.Init(AAACel:CelOms,?AAACel:CelOms,Queue:FileDropCombo:4.ViewPosition,FDCB13::View:FileDropCombo,Queue:FileDropCombo:4,Relate:AAACel,ThisWindow,GlobalErrors,0,1,0)
  FDCB13.Q &= Queue:FileDropCombo:4
  FDCB13.AddSortOrder(AAACel:CEL_PK)
  FDCB13.AddField(AAACel:CelOms,FDCB13.Q.AAACel:CelOms) !List box control field - type derived from field
  FDCB13.AddField(AAACel:CelID,FDCB13.Q.AAACel:CelID) !Browse hot field - type derived from field
  FDCB13.AddUpdateField(AAACel:CelID,APla:OverboekingCelID)
  ThisWindow.AddItem(FDCB13.WindowComponent)
  FDCB13.DefaultFill = 0
  FDCB14.Init(ACL:Locatienaam,?ACL:Locatienaam,Queue:FileDropCombo:5.ViewPosition,FDCB14::View:FileDropCombo,Queue:FileDropCombo:5,Relate:ACelLocatie,ThisWindow,GlobalErrors,0,1,0)
  FDCB14.Q &= Queue:FileDropCombo:5
  FDCB14.AddSortOrder(ACL:FK_CelLocatie)
  FDCB14.AddRange(ACL:CelID,APla:OverboekingCelID)
  FDCB14.AddField(ACL:Locatienaam,FDCB14.Q.ACL:Locatienaam) !List box control field - type derived from field
  FDCB14.AddField(ACL:CelLocatieID,FDCB14.Q.ACL:CelLocatieID) !Primary key field - type derived from field
  FDCB14.AddUpdateField(ACL:CelLocatieID,APla:CelLocatieID)
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
    Relate:Relatie.Close
    Relate:Verpakking.Close
    Relate:ViewArtikel.Close
    Relate:ViewPlanningPartij.Close
    Relate:ViewVoorraadPartij.Close
  END
  IF SELF.Opened
    INIMgr.Update('UpdateAOverboeking',QuickWindow)        ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
            
   
  RETURN ReturnValue


ThisWindow.PrimeUpdate PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.PrimeUpdate()
    If returnValue = Level:Fatal  ! delete just occured
      ThisNetRefresh.Send('|APlanning|ViewArtikel|Verpakking|Cel|ViewVoorraadPartij|AAACel|ACelLocatie|') ! NetTalk (NetRefresh)
    End
  		If returnValue = Level:Fatal  ! delete just occured
  			NetRefreshPlanningViews()
  		End
  RETURN ReturnValue


ThisWindow.Run PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  	IF Globalrequest=DeleteRecord
  		IF APla:Verwerkt
  			RETURN RequestCancelled
  			
  			IF MESSAGE('Deze overboeking is al verwerkt, zeker dat deze overboeking en bijbehorende mutaties verwijderd moeten worden?','Verwerkte overboeking',ICON:Exclamation,BUTTON:Yes+BUTTON:No,BUTTON:No,1) <> BUTTON:Yes
  				RETURN ReturnValue
  			END
  
  			CLEAR(Mut:RECORD)
  			Mut:PlanningID = APla:PlanningID
  			SET(Mut:Mutatie_FK02, Mut:Mutatie_FK02)
  			
  			LOOP UNTIL Access:Mutatie.Next()
  				IF Mut:PlanningID <> APla:PlanningID THEN BREAK.
  				
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
      LOC:PartijCelID = ''
      VVPar:PartijCelID = ''
      APla:PartijID = 0
      
      DISPLAY(?VVPar:PartijCelID)
      
      ENABLE(?Ver:VerpakkingOmschrijving)
      ENABLE(?Cel:CelOms)
      DISABLE(?NeemVoorraad)
      DISABLE(?LeegPartij)
    OF ?OK
      db.DebugOut('OK ' & APla:PlanningID)
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?VVPar:PartijCelID
      IF NOT(LOC:PartijCelID='')
      	APla:VerpakkingID = LOC:VerpakkingID
      	APla:CelID = LOC:CelID
      
      	db.DebugOut('PartijAccepted:'&APla:VerpakkingID&','&APla:CelID)
      
      	!FDCB8.ResetQueue(false)
      	!FDCB9.ResetQueue(false)
      
      	db.DebugOut('PartijAccepted-EVENT:'&EVENT())
      
      	!IF NOT(EVENT() = EVENT:Completed)
      		CLEAR(Ver:record)
      		Ver:VerpakkingID=APla:VerpakkingID
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
      
      	    IF APla:KG = 0 !OR APla:KG > VVPar:VoorraadKG
      			APla:KG = FDCB4.Q.LOC:BeschikbareVoorraad
      		.
      
      		IF APla:Pallets = 0 !OR APla:Pallets > VVPar:VoorraadPallets
      			APla:Pallets = VVPar:VoorraadPallets
      		.
      	!.
      END
    OF ?Calendar
      ThisWindow.Update()
      Calendar11.SelectOnClose = True
      Calendar11.Ask('Selecteer een datum',APla:Planning_DATE)
      IF Calendar11.Response = RequestCompleted THEN
      APla:Planning_DATE=Calendar11.SelectedDate
      DISPLAY(?APla:Planning_DATE)
      END
      ThisWindow.Reset(True)
    OF ?NeemVoorraad
      ThisWindow.Update()
      IF NOT(LOC:PartijCelID = '')
      	APla:KG = VVPar:VoorraadKG
      	APla:Pallets = VVPar:VoorraadPallets
      	DISPLAY(?APla:KG)
      	DISPLAY(?APla:Pallets)
      .
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
  IF APla:CelID = 0 THEN
  	Select(?CEL:CelOms)
  	RETURN ReturnValue
  .
  
  IF APla:OverboekingCelID = 0 THEN
  	Select(?AAACel:CelOms)
  	RETURN ReturnValue
  .
  LOOP
    IF Looped
      RETURN Level:Notify
    ELSE
      Looped = 1
    END
  	IF APla:Verwerkt OR APla:MutatieGemaakt
  		IF NOT(MESSAGE('Deze overboeking is al verwerkt, zeker dat deze overboeking en bijbehorende mutaties gewijzigd moet worden?','Verwerkte overboeking',ICON:Exclamation,BUTTON:Yes+BUTTON:No,BUTTON:No,1) = BUTTON:Yes)
  			RETURN Level:Benign
  		END
  	END
  ReturnValue = PARENT.TakeCompleted()
  	IF APla:Verwerkt OR APla:MutatieGemaakt
  		CLEAR(Mut:RECORD)
  		Mut:PlanningID = AAPla:PlanningID
  		SET(Mut:Mutatie_FK02, Mut:Mutatie_FK02)
  		
  		LOOP UNTIL Access:Mutatie.Next()
  			IF Mut:PlanningID <> AAPla:PlanningID THEN BREAK.
  
  			IF Mut:SoortMutatie = 'OUIT' THEN
  				Mut:DatumTijd_DATE = APla:Planning_DATE
  				Mut:DatumTijd_TIME = APla:Planning_TIME + 1
  				Mut:UitslagKG = APla:KG
  				Mut:UitslagPallet = APla:Pallets
  				Mut:NaarCELID = APla:OverboekingCelID
  				Access:Mutatie.Update()
  			ELSIF Mut:SoortMutatie = 'OIN' THEN
  				Mut:DatumTijd_DATE = APla:Planning_DATE
  				Mut:DatumTijd_TIME = APla:Planning_TIME
  				Mut:InslagKG = APla:KG
  				Mut:InslagPallet = APla:Pallets
  				Mut:NaarCELID = APla:CelID
  				Access:Mutatie.Update()
  			END
  		.
  	END
    ThisNetRefresh.Send('|APlanning|ViewArtikel|Verpakking|Cel|ViewVoorraadPartij|AAACel|ACelLocatie|') ! NetTalk (NetRefresh)
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
  If event() = event:VisibleOnDesktop !or event() = event:moved
    ds_VisibleOnDesktop()
  end
     IF KEYCODE()=CtrlShiftP AND EVENT() = Event:PreAlertKey
       CYCLE
     END
     IF KEYCODE()=CtrlShiftP  
        UD.ShowProcedureInfo('UpdateAOverboeking',UD.SetApplicationName('VoorrPln','DLL'),QuickWindow{PROP:Hlp},'10/06/2011 @ 04:10PM','06/28/2024 @ 01:22PM','10/11/2024 @ 01:54PM')  
    
       CYCLE
     END
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

