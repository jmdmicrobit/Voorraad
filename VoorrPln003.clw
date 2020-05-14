

   MEMBER('VoorrPln.clw')                                  ! This is a MEMBER module


   INCLUDE('ABDROPS.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('VOORRPLN003.INC'),ONCE        !Local module procedure declarations
                     END


!!! <summary>
!!! Generated from procedure template - Window
!!! Form Mutatie
!!! </summary>
UpdateOverboekPlanningVanuitVV PROCEDURE 

CurrentTab           STRING(80)                            ! 
Loc:Memo             CSTRING(101)                          ! 
Loc:Transport        CSTRING(101)                          ! 
Loc:KG               DECIMAL(10,2)                         ! 
Loc:CelID            LONG                                  ! 
Loc:CelLokatieID     LONG                                  ! 
Loc:Pallets          LONG                                  ! 
Loc:Artikel          CSTRING(100)                          ! 
LOC:PlanningDatum    DATE                                  ! 
LOC:PlanningTijdstip TIME                                  ! 
ActionMessage        CSTRING(40)                           ! 
Loc:ArtikelID        CSTRING(31)                           ! 
Loc:RelatieID        LONG                                  ! 
Loc:ArtikelOms       CSTRING(101)                          ! 
Loc:Leverancieroms   CSTRING(101)                          ! 
Loc:VerpakkingsID    LONG                                  ! 
Loc:VerpakkingOms    CSTRING(51)                           ! 
LOC:Instructie       CSTRING(101)                          ! 
Loc:OverboekSoort    CSTRING(21)                           ! 
FDCB7::View:FileDropCombo VIEW(ACel)
                       PROJECT(ACel:CelOms)
                       PROJECT(ACel:CelID)
                     END
FDB9::View:FileDrop  VIEW(ACelLocatie)
                       PROJECT(ACL:Locatienaam)
                       PROJECT(ACL:CelLocatieID)
                     END
Queue:FileDropCombo  QUEUE                            !
ACel:CelOms            LIKE(ACel:CelOms)              !List box control field - type derived from field
ACel:CelID             LIKE(ACel:CelID)               !Primary key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
Queue:FileDrop       QUEUE                            !
ACL:Locatienaam        LIKE(ACL:Locatienaam)          !List box control field - type derived from field
ACL:CelLocatieID       LIKE(ACL:CelLocatieID)         !Primary key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
LocEnableEnterByTab  BYTE(1)                               !Used by the ENTER Instead of Tab template
EnterByTabManager    EnterByTabClass
History::Mut:Record  LIKE(Mut:RECORD),THREAD
QuickWindow          WINDOW('OVERBOEKEN'),AT(,,415,257),FONT('MS Sans Serif',8,,,CHARSET:DEFAULT),RESIZE,CENTER, |
  GRAY,IMM,MDI,HLP('UpdateUitslagMutatie'),SYSTEM
                       SHEET,AT(4,4,403,226),USE(?CurrentTab)
                         TAB('&1) General'),USE(?Tab:1)
                           PROMPT('Invoerdatum'),AT(8,22),USE(?Mut:DatumTijd_DATE:Prompt),TRN
                           ENTRY(@d6-),AT(85,21,64,10),USE(Mut:DatumTijd_DATE),DISABLE
                           PROMPT('Invoertijd:'),AT(163,21),USE(?Mut:DatumTijd_TIME:Prompt),TRN
                           ENTRY(@t7),AT(199,22,64,10),USE(Mut:DatumTijd_TIME),DISABLE
                           PROMPT('Artikel:'),AT(8,37),USE(?PROMPT1)
                           ENTRY(@s60),AT(85,37,309,10),USE(Art:ArtikelOms),COLOR(COLOR:White),DISABLE,READONLY
                           PROMPT('Verpakking:'),AT(9,52),USE(?PROMPT2)
                           ENTRY(@s50),AT(85,53,309,10),USE(Ver:VerpakkingOmschrijving),COLOR(COLOR:White),DISABLE
                           PROMPT('Leverancier:'),AT(9,68),USE(?PROMPT4)
                           ENTRY(@s50),AT(85,69,309,10),USE(Rel:FirmaNaam),COLOR(COLOR:White),DISABLE
                           PROMPT('Cel:'),AT(9,85),USE(?CEL:CelOms:Prompt)
                           ENTRY(@s50),AT(85,85,309,10),USE(CEL:CelOms),COLOR(COLOR:White),DISABLE
                           PROMPT('Overboek Soort:'),AT(10,110),USE(?Pla:OverboekSoort:Prompt)
                           LIST,AT(85,111,309,10),USE(Loc:OverboekSoort),DROP(5),FROM('Overboeking|Verplaatsing|Co' & |
  'rrectie|Afboeking')
                           STRING('Ingeslagen:'),AT(9,123),USE(?STRING1)
                           ENTRY(@n-15`2),AT(85,123,60,10),USE(Mut:InslagKG),RIGHT,COLOR(COLOR:White),DISABLE
                           PROMPT('KG'),AT(152,123),USE(?Loc:KG:Prompt),RIGHT
                           ENTRY(@n-14.),AT(199,123,60,10),USE(Mut:InslagPallet),RIGHT,COLOR(COLOR:White),DISABLE
                           PROMPT('Pallets'),AT(264,123),USE(?Loc:Pallets:Prompt),RIGHT
                           PROMPT('Datum:'),AT(10,186),USE(?LOC:PlanningDatum:Prompt)
                           ENTRY(@d6-),AT(85,186,60,10),USE(LOC:PlanningDatum)
                           PROMPT('Tijdstip:'),AT(168,186),USE(?LOC:PlanningTijdstip:Prompt)
                           ENTRY(@t7),AT(198,186,60,10),USE(LOC:PlanningTijdstip)
                           PROMPT('Overboeken:'),AT(10,138),USE(?Mut:UitslagKG:Prompt)
                           ENTRY(@n14`2),AT(85,138,60,10),USE(Loc:KG),RIGHT(1)
                           PROMPT('KG'),AT(151,138),USE(?PROMPT5)
                           ENTRY(@n14.),AT(198,138,60,10),USE(Loc:Pallets),RIGHT(1)
                           PROMPT('Pallets'),AT(264,138),USE(?Mut:UitslagPallet:Prompt)
                           STRING('Cel:'),AT(10,154),USE(?STRING2)
                           COMBO(@s20),AT(85,154,173,10),USE(ACel:CelOms),DROP(5),FORMAT('200L(2)|M~Omschrijving~@s50@'), |
  FROM(Queue:FileDropCombo),IMM
                           PROMPT('Locatie'),AT(11,170),USE(?PROMPT3)
                           LIST,AT(85,170,173,10),USE(ACL:Locatienaam),DROP(25),FORMAT('200L(2)|M~Locatienaam~L(0)@s50@'), |
  FROM(Queue:FileDrop)
                           PROMPT('Instructie:'),AT(10,199),USE(?LOC:Instructie:Prompt)
                           ENTRY(@s100),AT(85,200,309,10),USE(LOC:Instructie)
                           PROMPT('Transport:'),AT(10,214),USE(?Loc:Transport:Prompt)
                           ENTRY(@s100),AT(85,214,309,10),USE(Loc:Transport)
                           PROMPT('Locatienaam:'),AT(9,98),USE(?CL:Locatienaam:Prompt)
                           ENTRY(@s50),AT(85,98,309,10),USE(CL:Locatienaam),DISABLE
                         END
                       END
                       BUTTON('&OK'),AT(305,235,49,14),USE(?OK),LEFT,ICON('WAOK.ICO'),DEFAULT,FLAT,MSG('Accept dat' & |
  'a and close the window'),TIP('Accept data and close the window')
                       BUTTON('&Cancel'),AT(358,235,49,14),USE(?Cancel),LEFT,ICON('WACANCEL.ICO'),FLAT,MSG('Cancel operation'), |
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
Reset                  PROCEDURE(BYTE Force=0),DERIVED
Run                    PROCEDURE(),BYTE,PROC,DERIVED
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED
TakeCompleted          PROCEDURE(),BYTE,PROC,DERIVED
TakeEvent              PROCEDURE(),BYTE,PROC,DERIVED
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
Resizer              CLASS(WindowResizeClass)
Init                   PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)
                     END

FDCB7                CLASS(FileDropComboClass)             ! File drop combo manager
Q                      &Queue:FileDropCombo           !Reference to browse queue type
                     END

FDB9                 CLASS(FileDropClass)                  ! File drop manager
Q                      &Queue:FileDrop                !Reference to display queue
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
    ActionMessage = 'Record Will Be Added'
  OF ChangeRecord
    ActionMessage = 'Record Will Be Changed'
  END
  QuickWindow{PROP:Text} = ActionMessage                   ! Display status message in title bar
  PARENT.Ask


ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('UpdateOverboekPlanningVanuitVV')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Mut:DatumTijd_DATE:Prompt
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
  SELF.AddUpdateFile(Access:Mutatie)
  SELF.HistoryKey = CtrlH
  SELF.AddHistoryFile(Mut:Record,History::Mut:Record)
  SELF.AddHistoryField(?Mut:DatumTijd_DATE,4)
  SELF.AddHistoryField(?Mut:DatumTijd_TIME,5)
  SELF.AddHistoryField(?Mut:InslagKG,8)
  SELF.AddHistoryField(?Mut:InslagPallet,9)
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  Relate:ACel.Open                                         ! File ACel used by this procedure, so make sure it's RelationManager is open
  Relate:ACelLocatie.Open                                  ! File ACelLocatie used by this procedure, so make sure it's RelationManager is open
  Relate:Mutatie.Open                                      ! File Mutatie used by this procedure, so make sure it's RelationManager is open
  Relate:Planning.SetOpenRelated()
  Relate:Planning.Open                                     ! File Planning used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Primary &= Relate:Mutatie
  IF SELF.Request = ViewRecord AND NOT SELF.BatchProcessing ! Setup actions for ViewOnly Mode
    SELF.InsertAction = Insert:None
    SELF.DeleteAction = Delete:None
    SELF.ChangeAction = Change:None
    SELF.CancelAction = Cancel:Cancel
    SELF.OkControl = 0
  ELSE
    SELF.ChangeAction = Change:Caller                      ! Changes allowed
    SELF.CancelAction = Cancel:Cancel+Cancel:Query         ! Confirm cancel
    SELF.OkControl = ?OK
    IF SELF.PrimeUpdate() THEN RETURN Level:Notify.
  END
  SELF.Open(QuickWindow)                                   ! Open window
   IF Self.Request=ChangeRecord 
  	Clear(PAR:Record)
  	Par:PartijID = Mut:PartijID
  	IF Access:Partij.TryFetch(Par:Partij_PK) = Level:Benign
  		Loc:ArtikelID = Par:ArtikelID
  		Loc:RelatieID = Par:Leverancier
  		Loc:VerpakkingsID = Par:VerpakkingID
  	ELSE
  		Loc:ArtikelID = 0
  		Loc:RelatieID = 0
  		Loc:VerpakkingsID = 0
  	.
  		
  	LOC:PlanningDatum = TODAY()
  	LOC:PlanningTijdstip = CLOCK()
  		
  	Loc:CelID = 0
  	Loc:KG = Mut:InslagKG
  	Loc:Pallets = Mut:InslagPallet
  ELSE
  	RETURN Level:Cancel
  END
  IF GLO:HidePlanningInstructie = 0 THEN
      HIDE(?LOC:Instructie)
      HIDE(?LOC:Instructie:Prompt)
  END
  WinAlertMouseZoom()
  Do DefineListboxStyle
  IF SELF.Request = ViewRecord                             ! Configure controls for View Only mode
    ?Mut:DatumTijd_DATE{PROP:ReadOnly} = True
    ?Mut:DatumTijd_TIME{PROP:ReadOnly} = True
    ?Art:ArtikelOms{PROP:ReadOnly} = True
    ?Ver:VerpakkingOmschrijving{PROP:ReadOnly} = True
    ?Rel:FirmaNaam{PROP:ReadOnly} = True
    ?CEL:CelOms{PROP:ReadOnly} = True
    DISABLE(?Loc:OverboekSoort)
    ?Mut:InslagKG{PROP:ReadOnly} = True
    ?Mut:InslagPallet{PROP:ReadOnly} = True
    ?LOC:PlanningDatum{PROP:ReadOnly} = True
    ?LOC:PlanningTijdstip{PROP:ReadOnly} = True
    ?Loc:KG{PROP:ReadOnly} = True
    ?Loc:Pallets{PROP:ReadOnly} = True
    DISABLE(?ACel:CelOms)
    DISABLE(?ACL:Locatienaam)
    ?LOC:Instructie{PROP:ReadOnly} = True
    ?Loc:Transport{PROP:ReadOnly} = True
    ?CL:Locatienaam{PROP:ReadOnly} = True
  END
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('UpdateOverboekPlanningVanuitVV',QuickWindow) ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  FDCB7.Init(ACel:CelOms,?ACel:CelOms,Queue:FileDropCombo.ViewPosition,FDCB7::View:FileDropCombo,Queue:FileDropCombo,Relate:ACel,ThisWindow,GlobalErrors,0,1,0)
  FDCB7.Q &= Queue:FileDropCombo
  FDCB7.AddSortOrder(ACel:CEL_PK)
  FDCB7.AddField(ACel:CelOms,FDCB7.Q.ACel:CelOms) !List box control field - type derived from field
  FDCB7.AddField(ACel:CelID,FDCB7.Q.ACel:CelID) !Primary key field - type derived from field
  FDCB7.AddUpdateField(ACel:CelID,Loc:CelID)
  ThisWindow.AddItem(FDCB7.WindowComponent)
  FDCB7.DefaultFill = 0
  FDB9.Init(?ACL:Locatienaam,Queue:FileDrop.ViewPosition,FDB9::View:FileDrop,Queue:FileDrop,Relate:ACelLocatie,ThisWindow)
  FDB9.Q &= Queue:FileDrop
  FDB9.AddSortOrder(ACL:FK_CelLocatie)
  FDB9.AddRange(ACL:CelID,ACel:CelID)
  FDB9.AddField(ACL:Locatienaam,FDB9.Q.ACL:Locatienaam) !List box control field - type derived from field
  FDB9.AddField(ACL:CelLocatieID,FDB9.Q.ACL:CelLocatieID) !Primary key field - type derived from field
  FDB9.AddUpdateField(ACL:CelLocatieID,Loc:CelLokatieID)
  ThisWindow.AddItem(FDB9.WindowComponent)
  FDB9.DefaultFill = 0
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
    Relate:ACel.Close
    Relate:ACelLocatie.Close
    Relate:Mutatie.Close
    Relate:Planning.Close
  END
  IF SELF.Opened
    INIMgr.Update('UpdateOverboekPlanningVanuitVV',QuickWindow) ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.PrimeUpdate PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.PrimeUpdate()
    If returnValue = Level:Fatal  ! delete just occured
      ThisNetRefresh.Send('|Mutatie|ACel|ACelLocatie|') ! NetTalk (NetRefresh)
    End
  RETURN ReturnValue


ThisWindow.Reset PROCEDURE(BYTE Force=0)

  CODE
  SELF.ForcedReset += Force
  IF QuickWindow{Prop:AcceptAll} THEN RETURN.
  Par:PartijID = Mut:PartijID                              ! Assign linking field value
  Access:Partij.Fetch(Par:Partij_PK)
  Ver:VerpakkingID = Par:VerpakkingID                      ! Assign linking field value
  Access:Verpakking.Fetch(Ver:Verpakking_PK)
  Rel:RelatieID = Par:Leverancier                          ! Assign linking field value
  Access:Relatie.Fetch(Rel:Relatie_PK)
  Art:ArtikelID = Par:ArtikelID                            ! Assign linking field value
  Access:ViewArtikel.Fetch(Art:Artikel_PK)
  CEL:CelID = Mut:CelID                                    ! Assign linking field value
  Access:Cel.Fetch(CEL:CEL_PK)
  CL:CelLocatieID = Mut:CelLocatieID                       ! Assign linking field value
  Access:CelLocatie.Fetch(CL:PK_CelLocatie)
  PARENT.Reset(Force)


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
  LOOP
    IF Looped
      RETURN Level:Notify
    ELSE
      Looped = 1
    END
  	IF LOC:CelID = 0 THEN
  		SELECT(?ACel:CelOms)
  		RETURN ReturnValue
  	.
  	
  		
  ReturnValue = PARENT.TakeCompleted()
  	CLEAR(Pla:Record)
  	Pla:ArtikelID = Par:ArtikelID
  	Pla:PartijID=Mut:PartijID
  	Pla:KG=Loc:KG
  	Pla:Pallets =Loc:Pallets 
  	Pla:Planning_DATE=Loc:PlanningDatum
  	Pla:Planning_TIME=Loc:PlanningTijdstip
      Pla:CelID=Mut:CelID
      Pla:CelLocatieID=Mut:CelLocatieID
      Pla:OverboekingCelID=Loc:CelID
      Pla:OverboekCelLocatieID=Loc:CelLokatieID
  	Pla:Verwerkt=false
  	Pla:Leverancier=Par:Leverancier
  	Pla:Instructie=LOC:Instructie
  	Pla:Transport=Loc:Transport
  	Pla:Memo=Loc:Memo
  
      Pla:OverboekSoort=Loc:OverboekSoort
      Pla:NieuwKG=Loc:KG
      Pla:NieuwPallets=Loc:Pallets
  
  	IF NOT(Access:Planning.TryInsert() = Level:Benign)
  		IF ERRORCODE() = 90 THEN
  			MESSAGE('Overboeking record kon niet worden aangemaakt | SQL Error('&FILEERRORCODE()&'):'&FILEERROR()&')')
  		ELSE
  			MESSAGE('Overboeking record kon niet worden aangemaakt | Error('&ERRORCODE()&'):'&ERROR()&')')
  		.
  	.
    ThisNetRefresh.Send('|Mutatie|ACel|ACelLocatie|') ! NetTalk (NetRefresh)
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


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window

