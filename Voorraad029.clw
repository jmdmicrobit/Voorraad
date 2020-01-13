

   MEMBER('Voorraad.clw')                                  ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABPOPUP.INC'),ONCE
   INCLUDE('ABREPORT.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('VOORRAAD029.INC'),ONCE        !Local module procedure declarations
                     END


!!! <summary>
!!! Generated from procedure template - Process
!!! het aanroepen van de voorraadclas heb ik uitgeschakeld !!!!
!!! </summary>
VulPartij_InkoopKGPrijs PROCEDURE 

Progress:Thermometer BYTE                                  ! 
Process:View         VIEW(Partij)
                     END
LocEnableEnterByTab  BYTE(1)                               !Used by the ENTER Instead of Tab template
EnterByTabManager    EnterByTabClass
ProgressWindow       WINDOW('Process Partij'),AT(,,142,59),FONT('MS Sans Serif',8,,FONT:regular,CHARSET:DEFAULT), |
  DOUBLE,CENTER,GRAY,TIMER(1)
                       PROGRESS,AT(15,15,111,12),USE(Progress:Thermometer),RANGE(0,100)
                       STRING(''),AT(0,3,141,10),USE(?Progress:UserString),CENTER
                       STRING(''),AT(0,30,141,10),USE(?Progress:PctText),CENTER
                       BUTTON('Cancel'),AT(46,42,49,15),USE(?Progress:Cancel),LEFT,ICON('WACANCEL.ICO'),FLAT,MSG('Cancel Process'), |
  TIP('Cancel Process')
                     END

    omit('***',WE::CantCloseNowSetHereDone=1)  !Getting Nested omit compile error, then uncheck the "Check for duplicate CantCloseNowSetHere variable declaration" in the WinEvent local template
WE::CantCloseNowSetHereDone equate(1)
WE::CantCloseNowSetHere     long
    !***
ThisWindow           CLASS(ReportManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Init                   PROCEDURE(ProcessClass PC,<REPORT R>,<PrintPreviewClass PV>)
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
TakeEvent              PROCEDURE(),BYTE,PROC,DERIVED
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED
                     END

ThisProcess          CLASS(ProcessClass)                   ! Process Manager
TakeRecord             PROCEDURE(),BYTE,PROC,DERIVED
                     END

ProgressMgr          StepLongClass                         ! Progress Manager

  CODE
  GlobalResponse = ThisWindow.Run()                        ! Opens the window and starts an Accept Loop

!---------------------------------------------------------------------------
DefineListboxStyle ROUTINE
!|
!| This routine create all the styles to be shared in this window
!| It`s called after the window open
!|
!---------------------------------------------------------------------------

ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('VulPartij_InkoopKGPrijs')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:APlanning.Open                                    ! File APlanning used by this procedure, so make sure it's RelationManager is open
  Relate:Inkoop.SetOpenRelated()
  Relate:Inkoop.Open                                       ! File Inkoop used by this procedure, so make sure it's RelationManager is open
  Relate:Mutatie.Open                                      ! File Mutatie used by this procedure, so make sure it's RelationManager is open
  Relate:Partij.Open                                       ! File Partij used by this procedure, so make sure it's RelationManager is open
  Access:Planning.UseFile                                  ! File referenced in 'Other Files' so need to inform it's FileManager
  SELF.FilesOpened = True
  SELF.Open(ProgressWindow)                                ! Open window
  WinAlertMouseZoom()
  Do DefineListboxStyle
  INIMgr.Fetch('VulPartij_InkoopKGPrijs',ProgressWindow)   ! Restore window settings from non-volatile store
  ProgressWindow{Prop:Timer} = 10                          ! Assign timer interval
  ProgressMgr.Init(ScrollSort:AllowNumeric,)
  ThisProcess.Init(Process:View, Relate:Partij, ?Progress:PctText, Progress:Thermometer, ProgressMgr, Par:PartijID)
  ThisProcess.AddSortOrder(Par:Partij_PK)
  ProgressWindow{Prop:Text} = 'Processing Records'
  ?Progress:PctText{Prop:Text} = '0% Completed'
  SELF.Init(ThisProcess)
  SELF.SetUseMRP(False)
  ?Progress:UserString{Prop:Text}=''
  SELF.AddItem(?Progress:Cancel, RequestCancelled)
  SEND(Partij,'QUICKSCAN=on')
  SELF.SetAlerts()
  EnterByTabManager.Init(False)
  RETURN ReturnValue


ThisWindow.Init PROCEDURE(ProcessClass PC,<REPORT R>,<PrintPreviewClass PV>)

  CODE
  PARENT.Init(PC,R,PV)
  WinAlertMouseZoom()


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
        ThisNetRefresh.Send('|Partij|') ! NetTalk (NetRefresh)
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:APlanning.Close
    Relate:Inkoop.Close
    Relate:Mutatie.Close
    Relate:Partij.Close
  END
  IF SELF.Opened
    INIMgr.Update('VulPartij_InkoopKGPrijs',ProgressWindow) ! Save window data to non-volatile store
  END
  ProgressMgr.Kill()
  GlobalErrors.SetProcedureName
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
    OF EVENT:OpenWindow
        WE::CantCloseNow += 1
        WE::CantCloseNowSetHere = 1
    END
  ReturnValue = PARENT.TakeWindowEvent()
    CASE EVENT()
    OF EVENT:CloseWindow
      if WE::CantCloseNow > 0 and ReturnValue = Level:Benign and WE::CantCloseNowSetHere
        WE::CantCloseNow -= 1
        WE::CantCloseNowSetHere = 0
      end
    OF EVENT:OpenWindow
        post(event:visibleondesktop)
    END
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue


ThisProcess.TakeRecord PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  Clear(Mut:Record)
  Mut:PartijID = Par:PartijID
  SET(Mut:Mutatie_FK01, Mut:Mutatie_FK01)
  LOOP UNTIL Access:Mutatie.TryNext()
      IF NOT(Mut:PartijID = Par:PartijID) THEN BREAK.
      IF NOT(CLIP(Mut:SoortMutatie) = 'IN') THEN CYCLE.
      
      CLEAR(APla:Record)
      APla:PlanningID = Mut:PlanningID
      IF(Access:APlanning.TryFetch(APla:PK_Planning) = Level:Benign)
          Par:InkoopID = APla:InkoopID
          Par:InkoopPlanningID = APla:PlanningID
      END
  .
  
  !VoorraadClass.BerekenPartijInkoopPrijs()
  ReturnValue = PARENT.TakeRecord()
  PUT(Process:View)
  IF ERRORCODE()
    GlobalErrors.ThrowFile(Msg:PutFailed,'Process:View')
    ThisWindow.Response = RequestCompleted
    ReturnValue = Level:Fatal
  END
  RETURN ReturnValue

!!! <summary>
!!! Generated from procedure template - Window
!!! Browse the Pallet file
!!! </summary>
BrowsePallet PROCEDURE 

CurrentTab           STRING(80)                            ! 
BRW1::View:Browse    VIEW(Pallet)
                       PROJECT(PLL:PalletID)
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
PLL:PalletID           LIKE(PLL:PalletID)             !List box control field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
LocEnableEnterByTab  BYTE(1)                               !Used by the ENTER Instead of Tab template
EnterByTabManager    EnterByTabClass
NetLocalRefreshDate     Long     ! NetTalk (NetRefresh)
NetLocalRefreshTime     Long
NetLocalDependancies    String('|Pallet|')
QuickWindow          WINDOW('Browse the Pallet file'),AT(,,224,198),FONT('Microsoft Sans Serif',8,,FONT:regular, |
  CHARSET:DEFAULT),RESIZE,CENTER,GRAY,IMM,MDI,HLP('BrowsePallet'),SYSTEM
                       LIST,AT(8,30,208,124),USE(?Browse:1),HVSCROLL,FORMAT('64R(2)|M~Pallet ID~C(0)@n-14@'),FROM(Queue:Browse:1), |
  IMM,MSG('Browsing the Pallet file')
                       BUTTON('&View'),AT(8,158,49,14),USE(?View:2),LEFT,ICON('WAVIEW.ICO'),FLAT,MSG('View Record'), |
  TIP('View Record')
                       BUTTON('&Insert'),AT(61,158,49,14),USE(?Insert:3),LEFT,ICON('WAINSERT.ICO'),FLAT,MSG('Insert a Record'), |
  TIP('Insert a Record')
                       BUTTON('&Change'),AT(114,158,49,14),USE(?Change:3),LEFT,ICON('WACHANGE.ICO'),DEFAULT,FLAT, |
  MSG('Change the Record'),TIP('Change the Record')
                       BUTTON('&Delete'),AT(167,158,49,14),USE(?Delete:3),LEFT,ICON('WADELETE.ICO'),FLAT,MSG('Delete the Record'), |
  TIP('Delete the Record')
                       SHEET,AT(4,4,216,172),USE(?CurrentTab)
                         TAB('&1) PK_Pallet'),USE(?Tab:2)
                         END
                       END
                       BUTTON('&Close'),AT(118,180,49,14),USE(?Close),LEFT,ICON('WACLOSE.ICO'),FLAT,MSG('Close Window'), |
  TIP('Close Window')
                       BUTTON('&Help'),AT(171,180,49,14),USE(?Help),LEFT,ICON('WAHELP.ICO'),FLAT,MSG('See Help Window'), |
  STD(STD:Help),TIP('See Help Window')
                     END

    omit('***',WE::CantCloseNowSetHereDone=1)  !Getting Nested omit compile error, then uncheck the "Check for duplicate CantCloseNowSetHere variable declaration" in the WinEvent local template
WE::CantCloseNowSetHereDone equate(1)
WE::CantCloseNowSetHere     long
    !***
ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
Reset                  PROCEDURE(BYTE Force=0),DERIVED
Run                    PROCEDURE(USHORT Number,BYTE Request),BYTE,PROC,DERIVED
TakeEvent              PROCEDURE(),BYTE,PROC,DERIVED
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
BRW1                 CLASS(BrowseClass)                    ! Browse using ?Browse:1
Q                      &Queue:Browse:1                !Reference to browse queue
Init                   PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)
                     END

BRW1::Sort0:Locator  StepLocatorClass                      ! Default Locator
Resizer              CLASS(WindowResizeClass)
Init                   PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)
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

ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('BrowsePallet')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Browse:1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  IF SELF.Request = SelectRecord
     SELF.AddItem(?Close,RequestCancelled)                 ! Add the close control to the window manger
  ELSE
     SELF.AddItem(?Close,RequestCompleted)                 ! Add the close control to the window manger
  END
  Relate:Pallet.Open                                       ! File Pallet used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:Pallet,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  WinAlertMouseZoom()
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1.ActiveInvisible = 1
  BRW1.RetainRow = 0
  BRW1.AddSortOrder(,PLL:PK_Pallet)                        ! Add the sort order for PLL:PK_Pallet for sort order 1
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort0:Locator.Init(,PLL:PalletID,,BRW1)            ! Initialize the browse locator using  using key: PLL:PK_Pallet , PLL:PalletID
  BRW1.AddField(PLL:PalletID,BRW1.Q.PLL:PalletID)          ! Field PLL:PalletID is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('BrowsePallet',QuickWindow)                 ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  BRW1.AskProcedure = 1                                    ! Will call: UpdatePallet
  SELF.SetAlerts()
  NetLocalRefreshDate = today()         ! NetTalk (NetRefresh)
  NetLocalRefreshTime = clock()
  EnterByTabManager.Init(False)
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:Pallet.Close
  END
  IF SELF.Opened
    INIMgr.Update('BrowsePallet',QuickWindow)              ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.Reset PROCEDURE(BYTE Force=0)

  CODE
  SELF.ForcedReset += Force
  IF QuickWindow{Prop:AcceptAll} THEN RETURN.
    NetLocalRefreshDate = today()         ! NetTalk (NetRefresh)
    NetLocalRefreshTime = clock()
  PARENT.Reset(Force)


ThisWindow.Run PROCEDURE(USHORT Number,BYTE Request)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Run(Number,Request)
  IF SELF.Request = ViewRecord
    ReturnValue = RequestCancelled                         ! Always return RequestCancelled if the form was opened in ViewRecord mode
  ELSE
    GlobalRequest = Request
    UpdatePallet
    ReturnValue = GlobalResponse
  END
  RETURN ReturnValue


ThisWindow.TakeEvent PROCEDURE

ReturnValue          BYTE,AUTO

Looped BYTE
  CODE
    If ThisNetRefresh.NeedReset(NetLocalRefreshDate,NetLocalRefreshTime,NetLocalDependancies) ! NetTalk (NetRefresh)
      Self.Reset(1)                      ! NetTalk (NetRefresh)
    End
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


BRW1.Init PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)

  CODE
  PARENT.Init(ListBox,Posit,V,Q,RM,WM)
  IF WM.Request <> ViewRecord                              ! If called for anything other than ViewMode, make the insert, change & delete controls available
    SELF.InsertControl=?Insert:3
    SELF.ChangeControl=?Change:3
    SELF.DeleteControl=?Delete:3
  END
  SELF.ViewControl = ?View:2                               ! Setup the control used to initiate view only mode


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window

!!! <summary>
!!! Generated from procedure template - Window
!!! Form Pallet
!!! </summary>
UpdatePallet PROCEDURE 

CurrentTab           STRING(80)                            ! 
ActionMessage        CSTRING(40)                           ! 
LocEnableEnterByTab  BYTE(1)                               !Used by the ENTER Instead of Tab template
EnterByTabManager    EnterByTabClass
History::PLL:Record  LIKE(PLL:RECORD),THREAD
QuickWindow          WINDOW('Form Pallet'),AT(,,163,56),FONT('Microsoft Sans Serif',8,,FONT:regular,CHARSET:DEFAULT), |
  RESIZE,CENTER,GRAY,IMM,MDI,HLP('UpdatePallet'),SYSTEM
                       SHEET,AT(4,4,155,30),USE(?CurrentTab)
                         TAB('&1) General'),USE(?Tab:1)
                           PROMPT('Pallet ID:'),AT(8,20),USE(?PLL:PalletID:Prompt),TRN
                           ENTRY(@n-14),AT(61,20,64,10),USE(PLL:PalletID),RIGHT(1)
                         END
                       END
                       BUTTON('&OK'),AT(4,38,49,14),USE(?OK),LEFT,ICON('WAOK.ICO'),DEFAULT,FLAT,MSG('Accept dat' & |
  'a and close the window'),TIP('Accept data and close the window')
                       BUTTON('&Cancel'),AT(57,38,49,14),USE(?Cancel),LEFT,ICON('WACANCEL.ICO'),FLAT,MSG('Cancel operation'), |
  TIP('Cancel operation')
                       BUTTON('&Help'),AT(110,38,49,14),USE(?Help),LEFT,ICON('WAHELP.ICO'),FLAT,MSG('See Help Window'), |
  STD(STD:Help),TIP('See Help Window')
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
Resizer              CLASS(WindowResizeClass)
Init                   PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)
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
  GlobalErrors.SetProcedureName('UpdatePallet')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?PLL:PalletID:Prompt
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.HistoryKey = CtrlH
  SELF.AddHistoryFile(PLL:Record,History::PLL:Record)
  SELF.AddHistoryField(?PLL:PalletID,1)
  SELF.AddUpdateFile(Access:Pallet)
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  Relate:Pallet.Open                                       ! File Pallet used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Primary &= Relate:Pallet
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
  WinAlertMouseZoom()
  Do DefineListboxStyle
  IF SELF.Request = ViewRecord                             ! Configure controls for View Only mode
    ?PLL:PalletID{PROP:ReadOnly} = True
  END
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('UpdatePallet',QuickWindow)                 ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
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
    Relate:Pallet.Close
  END
  IF SELF.Opened
    INIMgr.Update('UpdatePallet',QuickWindow)              ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.PrimeUpdate PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.PrimeUpdate()
    If returnValue = Level:Fatal  ! delete just occured
      ThisNetRefresh.Send('|Pallet|') ! NetTalk (NetRefresh)
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
  ReturnValue = PARENT.TakeCompleted()
    ThisNetRefresh.Send('|Pallet|') ! NetTalk (NetRefresh)
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

!!! <summary>
!!! Generated from procedure template - Process
!!! </summary>
ProcessCelLocatieVullen PROCEDURE 

Progress:Thermometer BYTE                                  ! 
Process:View         VIEW(Partij)
                     END
LocEnableEnterByTab  BYTE(1)                               !Used by the ENTER Instead of Tab template
EnterByTabManager    EnterByTabClass
ProgressWindow       WINDOW('Progress...'),AT(,,142,59),DOUBLE,CENTER,GRAY,TIMER(1)
                       PROGRESS,AT(15,15,111,12),USE(Progress:Thermometer),RANGE(0,100)
                       STRING(''),AT(0,3,141,10),USE(?Progress:UserString),CENTER
                       STRING(''),AT(0,30,141,10),USE(?Progress:PctText),CENTER
                       BUTTON('Cancel'),AT(45,42,50,15),USE(?Progress:Cancel)
                     END

    omit('***',WE::CantCloseNowSetHereDone=1)  !Getting Nested omit compile error, then uncheck the "Check for duplicate CantCloseNowSetHere variable declaration" in the WinEvent local template
WE::CantCloseNowSetHereDone equate(1)
WE::CantCloseNowSetHere     long
    !***
ThisWindow           CLASS(ReportManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Init                   PROCEDURE(ProcessClass PC,<REPORT R>,<PrintPreviewClass PV>)
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
TakeEvent              PROCEDURE(),BYTE,PROC,DERIVED
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED
                     END

ThisProcess          CLASS(ProcessClass)                   ! Process Manager
TakeRecord             PROCEDURE(),BYTE,PROC,DERIVED
                     END

ProgressMgr          StepLongClass                         ! Progress Manager

  CODE
  GlobalResponse = ThisWindow.Run()                        ! Opens the window and starts an Accept Loop

!---------------------------------------------------------------------------
DefineListboxStyle ROUTINE
!|
!| This routine create all the styles to be shared in this window
!| It`s called after the window open
!|
!---------------------------------------------------------------------------

ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('ProcessCelLocatieVullen')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:Mutatie.Open                                      ! File Mutatie used by this procedure, so make sure it's RelationManager is open
  Relate:Partij.Open                                       ! File Partij used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(ProgressWindow)                                ! Open window
  WinAlertMouseZoom()
  Do DefineListboxStyle
  INIMgr.Fetch('ProcessCelLocatieVullen',ProgressWindow)   ! Restore window settings from non-volatile store
  ProgressWindow{Prop:Timer} = 10                          ! Assign timer interval
  ProgressMgr.Init(ScrollSort:AllowNumeric,)
  ThisProcess.Init(Process:View, Relate:Partij, ?Progress:PctText, Progress:Thermometer, ProgressMgr, Par:PartijID)
  ThisProcess.AddSortOrder(Par:Partij_PK)
  ProgressWindow{Prop:Text} = 'Processing Records'
  ?Progress:PctText{Prop:Text} = '0% Completed'
  SELF.Init(ThisProcess)
  ?Progress:UserString{Prop:Text}='CelLocaties Vullen'
  SELF.AddItem(?Progress:Cancel, RequestCancelled)
  SEND(Partij,'QUICKSCAN=on')
  SELF.SetAlerts()
  EnterByTabManager.Init(False)
  RETURN ReturnValue


ThisWindow.Init PROCEDURE(ProcessClass PC,<REPORT R>,<PrintPreviewClass PV>)

  CODE
  PARENT.Init(PC,R,PV)
  WinAlertMouseZoom()


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
        ThisNetRefresh.Send('|Partij|') ! NetTalk (NetRefresh)
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:Mutatie.Close
    Relate:Partij.Close
  END
  IF SELF.Opened
    INIMgr.Update('ProcessCelLocatieVullen',ProgressWindow) ! Save window data to non-volatile store
  END
  ProgressMgr.Kill()
  GlobalErrors.SetProcedureName
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
    OF EVENT:OpenWindow
        WE::CantCloseNow += 1
        WE::CantCloseNowSetHere = 1
    END
  ReturnValue = PARENT.TakeWindowEvent()
    CASE EVENT()
    OF EVENT:CloseWindow
      if WE::CantCloseNow > 0 and ReturnValue = Level:Benign and WE::CantCloseNowSetHere
        WE::CantCloseNow -= 1
        WE::CantCloseNowSetHere = 0
      end
    OF EVENT:OpenWindow
        post(event:visibleondesktop)
    END
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue


ThisProcess.TakeRecord PROCEDURE

ReturnValue          BYTE,AUTO

InslagQ             QUEUE
_celid                  LONG
_cellocatieid           LONG
_inslagkg               decimal(10,2)
_inslagpallets          LONG
_uitslagkg              decimal(10,2)
_uitslagpallets         LONG
                    END
_CurrentKg          LONG
_CurrentPallet      LONG
_VoorraadKg          LONG
_VoorraadPallet     LONG
dubbelelocatie      BOOL
savecelid           LONG
  CODE
  ! Mutaties doorlopen
  FREE(InslagQ)
  IF Par:PartijID=27026
      Message('Debuggen')
  END
  
  Clear(InslagQ)
  Clear(Mut:Record)
  Mut:PartijID=Par:PartijID
  Set(Mut:Mutatie_FK01,Mut:Mutatie_FK01)
  Loop UNtil Access:Mutatie.Next()
      IF NOT Mut:PartijID=Par:PartijID THEN BREAK.
      IF Mut:SoortMutatie='UIT' AND Mut:CelLocatieID=0 
          ! bijbehorende InslagMutatie erbij zoeken
          Clear(InslagQ)
          InslagQ._celid=Mut:CelID
          GET(InslagQ,+InslagQ._celid)
          IF ERROR()
              Clear(InslagQ)
              InslagQ._celid=Mut:CelID
              Inslagq._cellocatieid=0
              Inslagq._uitslagkg=-Mut:InslagKG+Mut:UitslagKG
              Inslagq._uitslagpallets=-Mut:InslagPallet+Mut:UitslagPallet
              Add(InslagQ,+InslagQ._celid,+Inslagq._cellocatieid)
          ELSE
              Inslagq._uitslagkg+=-Mut:InslagKG+Mut:UitslagKG
              Inslagq._uitslagpallets+=-Mut:InslagPallet+Mut:UitslagPallet
              PUT(InslagQ,+InslagQ._celid,+Inslagq._cellocatieid)
          END
      ELSE
          InslagQ._celid=Mut:CelID
          Inslagq._cellocatieid=Mut:CelLocatieID
          GET(InslagQ,+InslagQ._celid,+Inslagq._cellocatieid)
          IF ERROR()
              InslagQ._celid=Mut:CelID
              Inslagq._cellocatieid=Mut:CelLocatieID
              Inslagq._inslagkg=Mut:InslagKG-Mut:UitslagKG
              Inslagq._inslagpallets=Mut:InslagPallet-Mut:UitslagPallet
              Add(InslagQ,+InslagQ._celid,+Inslagq._cellocatieid)
          ELSE
              Inslagq._inslagkg+=Mut:InslagKG-Mut:UitslagKG
              Inslagq._inslagpallets+=Mut:InslagPallet-Mut:UitslagPallet
              PUT(InslagQ,+InslagQ._celid,+Inslagq._cellocatieid)
          END
      END    
  END
  
  Loop i#=1 TO Records(InslagQ)
      GET(InslagQ,i#)
      IF InslagQ._inslagkg = 0 THEN CYCLE.            ! vaak verplaatsingen
      dubbelelocatie=FALSE
      savecelid=InslagQ._celid
      ! als er meerdere locaties zijn voor 1 cel dan niet corrigeren
      Loop j#=1 TO Records(InslagQ)
          GET(InslagQ,j#)
          IF i#=j# THEN CYCLE.        ! dit is hijzelf
          IF InslagQ._inslagkg = 0 THEN CYCLE.            ! vaak verplaatsingen
          IF savecelid=InslagQ._celid
              dubbelelocatie=TRUE
              BREAK
          END
      END
      IF dubbelelocatie THEN CYCLE.
      GET(InslagQ,i#)
      ! als er voorraad is 
      _VoorraadKg=Inslagq._inslagkg-InslagQ._uitslagkg
      _VoorraadPallet=Inslagq._inslagpallets-InslagQ._inslagpallets
      Clear(_CurrentKg)
      CLEAR(_CurrentPallet)
      IF _VoorraadKg>0
          ! dan deze uitslag orders bijwerken
          Clear(Mut:Record)
          Mut:PartijID=Par:PartijID
          Set(Mut:Mutatie_FK01,Mut:Mutatie_FK01)
          Loop UNtil Access:Mutatie.Next()
              IF NOT Mut:PartijID=Par:PartijID THEN BREAK.
              IF Mut:SoortMutatie='UIT' AND Mut:CelLocatieID=0 AND Mut:CelID=InslagQ._celid 
                  ! AND _CurrentKg+Mut:UitslagKG < InslagQ._inslagkg)
                  Mut:CelLocatieID = InslagQ._cellocatieid
                  Access:Mutatie.Update()
                  _CurrentKg+=Mut:UitslagKG
                  _CurrentPallet+=Mut:UitslagPallet
              END
          END        
      END
  END
  ReturnValue = PARENT.TakeRecord()
  RETURN ReturnValue

!!! <summary>
!!! Generated from procedure template - Process
!!! Uit GebruikerLog File Partij, Verkoop en Planning terughalen
!!! </summary>
ProcessGebruikerLogTerugzetten PROCEDURE 

Progress:Thermometer BYTE                                  ! 
Loc:SQLCommando      CSTRING(64000)                        ! 
Process:View         VIEW(GebruikerLog)
                       PROJECT(Log:Handeling)
                       PROJECT(Log:HandelingOpmerking)
                       PROJECT(Log:ID)
                       PROJECT(Log:RecordInhoudPre)
                       PROJECT(Log:Tabel)
                       PROJECT(Log:Uitgevoerd)
                     END
LocEnableEnterByTab  BYTE(1)                               !Used by the ENTER Instead of Tab template
EnterByTabManager    EnterByTabClass
ProgressWindow       WINDOW('Process GebruikerLog'),AT(,,142,76),FONT('Microsoft Sans Serif',8,,FONT:regular,CHARSET:DEFAULT), |
  DOUBLE,CENTER,GRAY,TIMER(1)
                       PROGRESS,AT(15,15,111,12),USE(Progress:Thermometer),RANGE(0,100)
                       STRING(''),AT(0,3,141,10),USE(?Progress:UserString),CENTER
                       STRING(''),AT(0,30,141,10),USE(?Progress:PctText),CENTER
                       BUTTON('Pause'),AT(15,57,53,15),USE(?Pause),LEFT,ICON('WAOK.ico'),DEFAULT,FLAT
                       BUTTON('Cancel'),AT(76,57,49,15),USE(?Progress:Cancel),LEFT,ICON('WACANCEL.ICO'),FLAT,MSG('Cancel Process'), |
  TIP('Cancel Process')
                     END

    omit('***',WE::CantCloseNowSetHereDone=1)  !Getting Nested omit compile error, then uncheck the "Check for duplicate CantCloseNowSetHere variable declaration" in the WinEvent local template
WE::CantCloseNowSetHereDone equate(1)
WE::CantCloseNowSetHere     long
    !***
ThisWindow           CLASS(ReportManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Init                   PROCEDURE(ProcessClass PC,<REPORT R>,<PrintPreviewClass PV>)
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
Paused                 BYTE
Timer                  LONG
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED
TakeEvent              PROCEDURE(),BYTE,PROC,DERIVED
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED
                     END

ThisProcess          CLASS(ProcessClass)                   ! Process Manager
TakeRecord             PROCEDURE(),BYTE,PROC,DERIVED
                     END

ProgressMgr          StepLongClass                         ! Progress Manager
! ----- st --------------------------------------------------------------------------
st                   Class(StringTheory)
    ! derived method declarations
                     End  ! st
! ----- end st -----------------------------------------------------------------------
! ----- str --------------------------------------------------------------------------
str                  Class(StringTheory)
    ! derived method declarations
                     End  ! str
! ----- end str -----------------------------------------------------------------------
! ----- stVeld --------------------------------------------------------------------------
stVeld               Class(StringTheory)
    ! derived method declarations
                     End  ! stVeld
! ----- end stVeld -----------------------------------------------------------------------
LocalClass          CLASS
RestorePartij           PROCEDURE(String)
RestorePlanning         PROCEDURE(String)
RestoreVerkoop          PROCEDURE(String)
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

ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('ProcessGebruikerLogTerugzetten')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:GebruikerLog.Open                                 ! File GebruikerLog used by this procedure, so make sure it's RelationManager is open
  Relate:Partij.Open                                       ! File Partij used by this procedure, so make sure it's RelationManager is open
  Relate:Planning.SetOpenRelated()
  Relate:Planning.Open                                     ! File Planning used by this procedure, so make sure it's RelationManager is open
  Access:Verkoop.UseFile                                   ! File referenced in 'Other Files' so need to inform it's FileManager
  SELF.FilesOpened = True
  !  ! kan ik hier identity insert uitzetten
  !Partij{Prop:SQL}= 'SET IDENTITY_INSERT dbo.Partij ON'
  !IF ERROR() THEN STOP('Error '&ERROR()&'|'&FILEERROR()).
  !Planning{Prop:SQL}= 'SET IDENTITY_INSERT dbo.Planning ON'
  !IF ERROR() THEN STOP('Error '&ERROR()&'|'&FILEERROR()).
  !Verkoop{Prop:SQL}= 'SET IDENTITY_INSERT dbo.Verkoop ON'
  !IF ERROR() THEN STOP('Error '&ERROR()&'|'&FILEERROR()).
  SELF.Open(ProgressWindow)                                ! Open window
  WinAlertMouseZoom()
  Do DefineListboxStyle
  INIMgr.Fetch('ProcessGebruikerLogTerugzetten',ProgressWindow) ! Restore window settings from non-volatile store
  ProgressWindow{Prop:Timer} = 10                          ! Assign timer interval
  ProgressMgr.Init(ScrollSort:AllowNumeric,)
  ThisProcess.Init(Process:View, Relate:GebruikerLog, ?Progress:PctText, Progress:Thermometer, ProgressMgr, Log:ID)
  ThisProcess.AddSortOrder(Log:PK_GebruikerLog)
  ProgressWindow{Prop:Text} = 'Processing Records'
  ?Progress:PctText{Prop:Text} = '0% Completed'
  SELF.Init(ThisProcess)
  ?Progress:UserString{Prop:Text}='Partijen terughalen'
  SELF.AddItem(?Progress:Cancel, RequestCancelled)
    ! 2019-8-28 is deze gebruikt voor het terughalen van de partijen
        !ThisProcess.SetFilter('Log:Handeling=''Delete'' and Log:HandelingOpmerking=''BrowseInkoop''And Log:Tabel=''Partij''')
    ! 2019-10-11 Terughalen verkoop en Planning
        ThisProcess.SetFilter('Log:Handeling=''Delete'' and Log:Uitgevoerd>=''2019-10-11 14:58:29'' and LOG:Uitgevoerd <=''2019-10-11 14:58:31''')
  !ThisProcess.SetFilter('Log:Handeling=''Delete'' and Log:Uitgevoerd_DATE=''2019-10-11'' and LOG:Uitgevoerd_TIME <=''14:58:29''and LOG:Uitgevoerd_TIME <=''14:58:31''')
  !ThisProcess.SetFilter('Log:ID=1939290')
  SEND(GebruikerLog,'QUICKSCAN=on')
  ASSERT(~SELF.DeferWindow) ! A hidden Go button is not smart ...
  SELF.KeepVisible = 1
  SELF.DeferOpenReport = 1
  SELF.Timer = TARGET{PROP:Timer}
  TARGET{PROP:Timer} = 0
  ?Pause{PROP:Text} = 'Start'
  SELF.Paused = 1
  ?Progress:Cancel{PROP:Key} = EscKey
  SELF.SetAlerts()
  EnterByTabManager.Init(False)
  RETURN ReturnValue


ThisWindow.Init PROCEDURE(ProcessClass PC,<REPORT R>,<PrintPreviewClass PV>)

  CODE
  PARENT.Init(PC,R,PV)
  WinAlertMouseZoom()


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
        ThisNetRefresh.Send('|GebruikerLog|') ! NetTalk (NetRefresh)
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
  !! kan ik hier identity insert uitzetten
  !Partij{Prop:SQL}= 'SET IDENTITY_INSERT dbo.Partij OFF'
  !IF ERROR() THEN STOP('Error '&ERROR()&'|'&FILEERROR()).
  !Planning{Prop:SQL}= 'SET IDENTITY_INSERT dbo.Planning OFF'
  !IF ERROR() THEN STOP('Error '&ERROR()&'|'&FILEERROR()).
  !Verkoop{Prop:SQL}= 'SET IDENTITY_INSERT dbo.Verkoop OFF'
  !IF ERROR() THEN STOP('Error '&ERROR()&'|'&FILEERROR()).
    Relate:GebruikerLog.Close
    Relate:Partij.Close
    Relate:Planning.Close
  END
  IF SELF.Opened
    INIMgr.Update('ProcessGebruikerLogTerugzetten',ProgressWindow) ! Save window data to non-volatile store
  END
  ProgressMgr.Kill()
  GlobalErrors.SetProcedureName
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
    OF ?Pause
      IF SELF.Paused
        TARGET{PROP:Timer} = SELF.Timer
        ?Pause{PROP:Text} = 'Pause'
      ELSE
        SELF.Timer = TARGET{PROP:Timer}
        TARGET{PROP:Timer} = 0
        ?Pause{PROP:Text} = 'Restart'
      END
      SELF.Paused = 1 - SELF.Paused
    END
  ReturnValue = PARENT.TakeAccepted()
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
    OF EVENT:OpenWindow
        WE::CantCloseNow += 1
        WE::CantCloseNowSetHere = 1
    OF EVENT:Timer
      IF SELF.Paused THEN RETURN Level:Benign .
    END
  ReturnValue = PARENT.TakeWindowEvent()
    CASE EVENT()
    OF EVENT:CloseWindow
      if WE::CantCloseNow > 0 and ReturnValue = Level:Benign and WE::CantCloseNowSetHere
        WE::CantCloseNow -= 1
        WE::CantCloseNowSetHere = 0
      end
    OF EVENT:OpenWindow
        post(event:visibleondesktop)
    END
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue

LocalClass.RestorePartij    PROCEDURE(_RecordInhoudPre)
Code 
  ! kan ik hier identity insert uitzetten
    Partij{Prop:SQL}= 'SET IDENTITY_INSERT dbo.Partij ON'
    IF ERROR() THEN STOP('Error '&ERROR()&'|'&FILEERROR()).
    Clear(Par:Record)

    St.SetValue(_RecordInhoudPre)
    st.split('<13,10>') 
    loop i# = 1 to st.Records()
        Str.SetValue(St.GetLine(i#))      ! PAR:PARTIJID=30292            ,  5-12-1883            ,  0:05            , 3
        Str.Split(',')
        stVeld.SetValue(Str.GetLine(1))    ! PAR:PARTIJID=30292               
        stVeld.After('=')
    !SETCLIPBOARD(stVeld.Before('=')&'|'&stVeld.After('='))             !PAR:PARTIJID|30292              
        Case stVeld.Before('=')
        OF 'PAR:PARTIJID'
            Par:PartijID=stVeld.After('=')
        OF 'PAR:ARTIKELID'
            Par:ArtikelID=stVeld.After('=')
        OF 'PAR:AANMAAKDATUM_DATE'    
            Par:AanmaakDatum_DATE=stVeld.After('=')
        OF 'PAR:AANMAAKDATUM_TIME'    
            Par:AanmaakDatum_TIME=0
        OF 'PAR:KG'
            Par:KG=stVeld.After('=')
        OF  'PAR:PALLETS'   
            Par:Pallets=stVeld.After('=')
        OF 'PAR:VERPAKKINGID'
            Par:VerpakkingID=stVeld.After('=')
        OF 'PAR:LEVERANCIER'
            Par:Leverancier=stVeld.After('=')
        of 'PAR:VERWERKT'
            Par:Verwerkt=stVeld.After('=')
        of 'PAR:CELID'
            Par:CELID=stVeld.After('=')
        of 'PAR:PALLETSGEPRINT'
            Par:PalletsGeprint=stVeld.After('=')
        of 'PAR:REFERENTIE'
            Par:Referentie=stVeld.After('=')
        of 'PAR:INSLAGQATEMPERATUUR1'
            PAR:INSLAGQATEMPERATUUR1=stVeld.After('=')
        of 'PAR:EXTERNPARTIJNR'
            PAR:EXTERNPARTIJNR=stVeld.After('=')
        of 'PAR:BEREKENDEINKOOPKGPRIJS'
            PAR:BEREKENDEINKOOPKGPRIJS=stVeld.After('=')
        of 'PAR:INKOOPID'
            PAR:INKOOPID=stVeld.After('=')
        of 'PAR:INKOOPPLANNINGID'
            PAR:INKOOPPLANNINGID=stVeld.After('=')
        of 'PAR:INKOOPKGPRIJS'
            PAR:INKOOPKGPRIJS=stVeld.After('=')
        of 'PAR:INSLAGQATRANSPORTMIDDELSCHOON'
            PAR:INSLAGQATRANSPORTMIDDELSCHOON=stVeld.After('=')
        of 'PAR:INSLAGQAVERPAKKINGSCHOONGESLOTEN'
            PAR:INSLAGQAVERPAKKINGSCHOONGESLOTEN=stVeld.After('=')
        of 'PAR:INSLAGQAIDENTIFICATIEMERKENVERPAKKING'
            PAR:INSLAGQAIDENTIFICATIEMERKENVERPAKKING=stVeld.After('=')
        of 'PAR:INSLAGQAUITGEVOERDDOOR'
            PAR:INSLAGQAUITGEVOERDDOOR=stVeld.After('=')
        of 'PAR:INSLAGQATEMPERATUUR2'
            PAR:INSLAGQATEMPERATUUR2=stVeld.After('=')
        of 'PAR:INSLAGQATEMPERATUUR3'
            PAR:INSLAGQATEMPERATUUR3=stVeld.After('=')
        of 'PAR:INSLAGQAACTIEAFWIJKINGEN'
            PAR:INSLAGQAACTIEAFWIJKINGEN=stVeld.After('=')
        of 'PAR:VERPAKKINGKLASSEID'
            PAR:VERPAKKINGKLASSEID=stVeld.After('=')
        of 'PAR:CORRIGERENDEMAATREGEL'
            PAR:CORRIGERENDEMAATREGEL=stVeld.After('=')
        of 'PAR:AFGEHANDELD'
            PAR:AFGEHANDELD=stVeld.After('=')
        of 'PAR:INSLAGQAISGEURKLEURPRODUCTEIGEN'
            PAR:INSLAGQAISGEURKLEURPRODUCTEIGEN=stVeld.After('=')
        of 'PAR:INSLAGQAGEENGLASBREUK'
            PAR:INSLAGQAGEENGLASBREUK=stVeld.After('=')
        of 'PAR:INSLAGQATEMPERATUURVERVOERMIDDEL'
            PAR:INSLAGQATEMPERATUURVERVOERMIDDEL=stVeld.After('=')
        of 'PAR:CORRECTIEVEMAATREGEL'
            PAR:CORRECTIEVEMAATREGEL=stVeld.After('=')
        END    
    End
    Loc:SQLCommando='INSERT INTO dbo.Partij(PartijID, ArtikelID, Aanmaakdatum, KG, Pallets'&|
        ', VerpakkingID,Leverancier, Verwerkt, CELID, PalletsGeprint, Referentie,Planinstructie'&|
        ', InslagQATemperatuur1, ExternPartijnr, BerekendeInkoopKGPrijs, InkoopID, InkoopPlanningID'&|
        ', InkoopKGPrijs, InslagQATransportmiddelSchoon, InslagQAVerpakkingSchoonGesloten'&|
        ', InslagQAIdentificatieMerkenVerpakking, InslagQAUitgevoerdDoor, InslagQATemperatuur2 '&|
        ', InslagQATemperatuur3, InslagQAActieAfwijkingen, VerpakkingKlasseID, CorrigerendeMaatregel '&|
        ', Afgehandeld, InslagQAIsGeurKleurProductEigen, InslagQAGeenGlasbreuk, InslagQATemperatuurVervoermiddel, CorrectieveMaatregel) VALUES('& |
        Par:PartijID&',<39>'&Par:ArtikelID&'<39>,<39>'&Format(Par:AanmaakDatum_DATE,@D10-)&' 00:00<39>,'&Par:KG&','&Par:Pallets&|
        ', '&Par:VerpakkingID &|
        ', '&Par:Leverancier&|
        ', '&Par:Verwerkt&|
        ', '&Par:CELID&|
        ', '&Par:PalletsGeprint&|
        ', <39>'&Par:Referentie&'<39>'&|
        ', <39>'&Par:Planinstructie&'<39>'&|
        ', <39>'&Par:InslagQATemperatuur1&'<39>'&|
        ', <39>'&Par:ExternPartijnr&'<39>'&|
        ', '&Par:BerekendeInkoopKGPrijs&|
        ', '&Par:InkoopID&|
        ', '&Par:InkoopPlanningID&|
        ', '&Par:InkoopKGPrijs&|
        ', '&Par:InslagQATransportmiddelSchoon&|
        ', '&Par:InslagQAVerpakkingSchoonGesloten&|
        ', '&Par:InslagQAIdentificatieMerkenVerpakking&|
        ', <39>'&Par:InslagQAUitgevoerdDoor&'<39>'&|
        ', <39>'&Par:InslagQATemperatuur2&'<39>'&|
        ', <39>'&Par:InslagQATemperatuur3&'<39>'&|
        ', <39>'&Par:InslagQAActieAfwijkingen&'<39>'&|
        ', '&Par:VerpakkingKlasseID&|
        ', <39>'&Par:CorrigerendeMaatregel&'<39>'&|
        ', <39>'&Par:Afgehandeld&'<39>'&|
        ', '&Par:InslagQAIsGeurKleurProductEigen&|
        ', '&Par:InslagQAGeenGlasbreuk&|
        ', <39>'&Par:InslagQATemperatuurVervoermiddel&'<39>'&|
        ', <39>'&Par:CorrectieveMaatregel&'<39>'&|
        ')'
    SetClipBoard(Loc:SQLCommando)
    Partij{Prop:SQL}=Loc:SQLCommando
   !Access:Partij.Insert()
!Add(Partij)
    IF ERROR() THEN STOP('Error '&ERROR()&'|'&FILEERROR()).

! kan ik hier identity insert uitzetten
    Partij{Prop:SQL}= 'SET IDENTITY_INSERT dbo.Partij OFF'
    IF ERROR() THEN STOP('Error '&ERROR()&'|'&FILEERROR()).

    RETURN

LocalClass.RestoreVerkoop    PROCEDURE(_RecordInhoudPre)
Code 
    Verkoop{Prop:SQL}= 'SET IDENTITY_INSERT dbo.Verkoop ON'
    IF ERROR() THEN STOP('Error '&ERROR()&'|'&FILEERROR()).
    Clear(Ver2:Record)

    St.SetValue(_RecordInhoudPre)
    st.split('<13,10>') 
    loop i# = 1 to st.Records()
        Str.SetValue(St.GetLine(i#))      ! VerkoopID | READONLY=37226            , 30-11-1902            ,  0:06            , 3
        Str.Split(',')
        stVeld.SetValue(Str.GetLine(1))    ! VerkoopID | READONLY=37226
        stVeld.After('=')
        Case stVeld.Before('=')
        OF 'VerkoopID | READONLY'
            Ver2:VerkoopID=stVeld.After('=')
        OF 'VER2:KLANT'
            VER2:KLANT=stVeld.After('=')
        OF 'VER2:VERWERKT'    
            VER2:VERWERKT=stVeld.After('=')
        OF 'VER2:PLANNING_DATE'    
            VER2:PLANNING_DATE=stVeld.After('=')
        OF 'VER2:PLANNING_TIME'    
            VER2:PLANNING_TIME=0
        OF 'VER2:INSTRUCTIE'
            VER2:INSTRUCTIE=stVeld.After('=')
        OF  'VER2:TRANSPORT'   
            VER2:TRANSPORT=stVeld.After('=')
        OF 'VER2:KLANTALTERNATIEFADRES'
            VER2:KLANTALTERNATIEFADRES=stVeld.After('=')
        OF 'VER2:EXTRAKOSTEN'
            VER2:EXTRAKOSTEN=stVeld.After('=')
        of 'VER2:EXTRAKOSTENTEKST'
            VER2:EXTRAKOSTENTEKST=stVeld.After('=')
        of 'VER2:EXTERNVERKOOPID'
            VER2:EXTERNVERKOOPID=stVeld.After('=')
        of 'VER2:NEGATIEVEORDER'
            VER2:NEGATIEVEORDER=stVeld.After('=')
        of 'VER2:REDENRETOUR'
            VER2:REDENRETOUR=stVeld.After('=')
        of 'VER2:CONFIRMATIONDATE_DATE'
            VER2:CONFIRMATIONDATE_DATE=stVeld.After('=')
        of 'VER2:CONFIRMATIONDATE_TIME'
            VER2:CONFIRMATIONDATE_TIME=0
        of 'VER2:GEBRUIKERID'
            VER2:GEBRUIKERID=stVeld.After('=')
        of 'VER2:BEVESTIGINGGEPRINT_DATE'
            VER2:BEVESTIGINGGEPRINT_DATE=stVeld.After('=')
        of 'VER2:BEVESTIGINGGEPRINT_TIME'
            VER2:BEVESTIGINGGEPRINT_TIME=stVeld.After('=')
        of 'VER2:DELIVERYTERMSID'
            VER2:DELIVERYTERMSID=stVeld.After('=')
        of 'VER2:RETOURDATUM_DATE'
            VER2:RETOURDATUM_DATE=stVeld.After('=')
        of 'VER2:RETOURDATUM_TIME'
            VER2:RETOURDATUM_TIME=stVeld.After('=')
        of 'VER2:EXPORTED'
            VER2:EXPORTED=stVeld.After('=')
        of 'VER2:VALUTA'
            VER2:VALUTA=stVeld.After('=')
        of 'VER2:KOERSVERSCHIL'
            VER2:KOERSVERSCHIL=stVeld.After('=')
        of 'VER2:CONTAINERNR'
            VER2:CONTAINERNR=stVeld.After('=')
        of 'VER2:SEALNR'
            VER2:SEALNR=stVeld.After('=')
        of 'VER2:VESSEL'
            VER2:VESSEL=stVeld.After('=')
        of 'VER2:PROFORMAMEMO'
            VER2:PROFORMAMEMO=stVeld.After('=')
        of 'VER2:TARRACONTAINER'
            VER2:TARRACONTAINER=stVeld.After('=')
        of 'VER2:LAADHAVEN'
            VER2:LAADHAVEN=stVeld.After('=')
        of 'VER2:LOSHAVEN'
            VER2:LOSHAVEN=stVeld.After('=')
        of 'VER2:BOEKINGSNR'
            VER2:BOEKINGSNR=stVeld.After('=')
        of 'VER2:BESCWAIVER'
            VER2:BESCWAIVER=stVeld.After('=')
        of 'VER2:EXPRESSERELEASE'
            VER2:EXPRESSERELEASE=stVeld.After('=')
        of 'VER2:AAN'
            VER2:AAN=stVeld.After('=')
        of 'VER2:OMSCHRIJVINGGOEDEREN'
            VER2:OMSCHRIJVINGGOEDEREN=stVeld.After('=')
        END    
    End
    Loc:SQLCommando='INSERT INTO [dbo].[Verkoop] ' & |
'           ([VerkoopID] ' & |
'           ,[Klant] ' & |
'           ,[Verwerkt] ' & |
'           ,[Planning] ' & |
'           ,[Instructie] ' & |
'           ,[Transport] ' & |
'           ,[KlantAlternatiefAdres] ' & |
'           ,[ExtraKosten] ' & |
'           ,[ExtraKostenTekst] ' & |
'           ,[ExternVerkoopID] ' & |
'           ,[NegatieveOrder] ' & |
'           ,[RedenRetour] ' & |
'           ,[ConfirmationDate] ' & |
'           ,[GebruikerID] ' & |
'           ,[BevestigingGeprint] ' & |
'           ,[DeliveryTermsID] ' & |
'           ,[RetourDatum] ' & |
'           ,[Exported] ' & |
'           ,[Valuta] ' & |
'           ,[Koersverschil] ' & |
'           ,[Containernr] ' & |
'           ,[Sealnr] ' & |
'           ,[Vessel] ' & |
'           ,[ProFormaMemo] ' & |
'           ,[TarraContainer] ' & |
'           ,[Laadhaven] ' & |
'           ,[Loshaven] ' & |
'           ,[Boekingsnr] ' & |
'           ,[BESCWaiver] ' & |
'           ,[ExpresseRelease] ' & |
'           ,[Aan] ' & |
'           ,[OmschrijvingGoederen]) ' & |
        '            VALUES('& |
        Ver2:VerkoopID&|
        ','&Ver2:Klant&|
        ','&Ver2:Verwerkt&|
        ',<39>'&Format(Ver2:Planning_DATE,@D10-)&' 00:00<39>'&|
        ',<39>'&Ver2:Instructie&'<39>'&|
        ',<39>'&Ver2:Transport&'<39>'&|
        ', '&Ver2:KlantAlternatiefAdres &|
        ', '&Ver2:ExtraKosten&|
        ', <39>'&Ver2:ExtraKostenTekst&'<39>'&|
        ', <39>'&Ver2:ExternVerkoopID&'<39>'&|
        ', <39>'&Ver2:NegatieveOrder&'<39>'&|
        ', <39>'&Ver2:RedenRetour&'<39>'&|
        ', <39>'&Format(Ver2:ConfirmationDate_DATE,@D10-)&' '&Format(Ver2:ConfirmationDate_TIME,@T01)&'<39>'&|
        ', '&Ver2:GebruikerID&|
        ', <39>'&CHOOSE(Ver2:BevestigingGeprint_DATE=0,'1900-01-01',Format(Ver2:BevestigingGeprint_DATE,@D010-))&' '&Format(Ver2:BevestigingGeprint_TIME,@T01)&'<39>'&|
        ', '&Ver2:DeliveryTermsID&|
        ', <39>'&CHOOSE(Ver2:RetourDatum_DATE=0,'1900-01-01',Format(Ver2:RetourDatum_DATE,@D010-))&' '&Format(Ver2:RetourDatum_TIME,@T01)&'<39>'&|
        ', '&Ver2:Exported&|
        ', <39>'&Ver2:Valuta&'<39>'&|
        ', '&Ver2:Koersverschil&|
        ', <39>'&Ver2:Containernr&'<39>'&|
        ', <39>'&Ver2:Sealnr&'<39>'&|
        ', <39>'&Ver2:Vessel&'<39>'&|
        ', <39>'&Ver2:ProFormaMemo&'<39>'&|
        ', <39>'&Ver2:TarraContainer&'<39>'&|
        ', <39>'&Ver2:Laadhaven&'<39>'&|
        ', <39>'&Ver2:Loshaven&'<39>'&|
        ', <39>'&Ver2:Boekingsnr&'<39>'&|
        ', <39>'&Ver2:BESCWaiver&'<39>'&|
        ', '&Ver2:ExpresseRelease&|
        ', <39>'&Ver2:Aan&'<39>'&|
        ', <39>'&Ver2:OmschrijvingGoederen&'<39>'&|
        ')'
    SetClipBoard(Loc:SQLCommando)
    Verkoop{Prop:SQL}=Loc:SQLCommando
   !Access:Partij.Insert()
!Add(Partij)
    IF ERROR() THEN STOP('Error '&ERROR()&'|'&FILEERROR()).

    Verkoop{Prop:SQL}= 'SET IDENTITY_INSERT dbo.Verkoop OFF'
    IF ERROR() THEN STOP('Error '&ERROR()&'|'&FILEERROR()).

    RETURN

LocalClass.RestorePlanning    PROCEDURE(_RecordInhoudPre)
Code 
    Planning{Prop:SQL}= 'SET IDENTITY_INSERT dbo.Planning ON'
    IF ERROR() THEN STOP('Error '&ERROR()&'|'&FILEERROR()).
    Clear(Par:Record)

    St.SetValue(_RecordInhoudPre)
    st.split('<13,10>') 
    loop i# = 1 to st.Records()
        Str.SetValue(St.GetLine(i#))      ! PAR:PARTIJID=30292            ,  5-12-1883            ,  0:05            , 3
        Str.Split(',')
        stVeld.SetValue(Str.GetLine(1))    ! PAR:PARTIJID=30292               
        stVeld.After('=')
    !SETCLIPBOARD(stVeld.Before('=')&'|'&stVeld.After('='))             !PAR:PARTIJID|30292              
        Case stVeld.Before('=')
        OF 'PlanningID | READONLY'
            Pla:PlanningID=stVeld.After('=')
        OF 'PLA:VERKOOPID'
            PLA:VERKOOPID=stVeld.After('=')
        OF 'PLA:INKOOPID'    
            PLA:INKOOPID=stVeld.After('=')
        OF 'PLA:ARTIKELID'    
            PLA:ARTIKELID=stVeld.After('=')
        OF 'PLA:KG'
            PLA:KG=stVeld.After('=')
        OF  'PLA:PALLETS'   
            PLA:PALLETS=stVeld.After('=')
        OF 'PLA:PLANNING_DATE'
            PLA:PLANNING_DATE=stVeld.After('=')
        OF 'PLA:PLANNING_TIME'
            PLA:PLANNING_TIME=stVeld.After('=')
        of 'PLA:VERPAKKINGID'
            PLA:VERPAKKINGID=stVeld.After('=')
        of 'PLA:CELID'
            PLA:CELID=stVeld.After('=')
        of 'PLA:PARTIJID'
            PLA:PARTIJID=stVeld.After('=')
        of 'PLA:MEMO'
            PLA:MEMO=stVeld.After('=')
        of 'PLA:MUTATIEGEMAAKT'
            PLA:MUTATIEGEMAAKT=stVeld.After('=')
        of 'PLA:GEPRINT'
            PLA:GEPRINT=stVeld.After('=')
        of 'PLA:VERWERKT'
            PLA:VERWERKT=stVeld.After('=')
        of 'PLA:LEVERANCIER'
            PLA:LEVERANCIER=stVeld.After('=')
        of 'PLA:OVERBOEKINGCELID'
            PLA:OVERBOEKINGCELID=stVeld.After('=')
        of 'PLA:INSTRUCTIE'
            PLA:INSTRUCTIE=stVeld.After('=')
        of 'PLA:TRANSPORT'
            PLA:TRANSPORT=stVeld.After('=')
        of 'PLA:GEWOGEN'
            PLA:GEWOGEN=stVeld.After('=')
        of 'PLA:CELLOCATIEID'
            PLA:CELLOCATIEID=stVeld.After('=')
        of 'PLA:MUTATIEKG'
            PLA:MUTATIEKG=stVeld.After('=')
        of 'PLA:MUTATIEPALLETS'
            PLA:MUTATIEPALLETS=stVeld.After('=')
        of 'PLA:OVERBOEKINGPLANNINGID'
            PLA:OVERBOEKINGPLANNINGID=stVeld.After('=')
        of 'PLA:INKOOPKGPRIJS'
            PLA:INKOOPKGPRIJS=stVeld.After('=')
        of 'PLA:VERKOOPKGPRIJS'
            PLA:VERKOOPKGPRIJS=stVeld.After('=')
        of 'PLA:UITSLAGPALLETBLADDUEDATE12'
            PLA:UITSLAGPALLETBLADDUEDATE12=stVeld.After('=')
        of 'PLA:UITSLAGPALLETBLADDUEDATE12_DATE'
            PLA:UITSLAGPALLETBLADDUEDATE12_DATE=stVeld.After('=')
        of 'PLA:UITSLAGPALLETBLADDUEDATE12_TIME'
            PLA:UITSLAGPALLETBLADDUEDATE12_TIME=stVeld.After('=')
        of 'PLA:UITSLAGPALLETBLADPRODUCTIONDATE11_DATE'
            PLA:UITSLAGPALLETBLADPRODUCTIONDATE11_DATE=stVeld.After('=')
        of 'PLA:UITSLAGPALLETBLADPRODUCTIONDATE11_TIME'
            PLA:UITSLAGPALLETBLADPRODUCTIONDATE11_TIME=stVeld.After('=')
        of 'PLA:UITSLAGPALLETBLADSELLBYDATE15_DATE'
            PLA:UITSLAGPALLETBLADSELLBYDATE15_DATE=stVeld.After('=')
        of 'PLA:UITSLAGPALLETBLADSELLBYDATE15_TIME'
            PLA:UITSLAGPALLETBLADSELLBYDATE15_TIME=stVeld.After('=')
        of 'PLA:ALTERNATIEVEARTIKELOMS'
            PLA:ALTERNATIEVEARTIKELOMS=stVeld.After('=')
        of 'PLA:VERPAKKINGKLASSEID'
            PLA:VERPAKKINGKLASSEID=stVeld.After('=')
        of 'PLA:AANTALVERPAKKINGEN'
            PLA:AANTALVERPAKKINGEN=stVeld.After('=')
        of 'PLA:UITSLAGPALLETBLADORIGINLIVEBIRD'
            PLA:UITSLAGPALLETBLADORIGINLIVEBIRD=stVeld.After('=')
        of 'PLA:UITSLAGPALLETBLADORIGINSLAUTHERHOUSE'
            PLA:UITSLAGPALLETBLADORIGINSLAUTHERHOUSE=stVeld.After('=')
        of 'PLA:UITSLAGPALLETBLADORIGINPROCESSING'
            PLA:UITSLAGPALLETBLADORIGINPROCESSING=stVeld.After('=')
        of 'PLA:UITSLAGPALLETBLADORIGINPACKING'
            PLA:UITSLAGPALLETBLADORIGINPACKING=stVeld.After('=')
        of 'PLA:VALUTA'
            PLA:VALUTA=stVeld.After('=')
        of 'PLA:KOERSVERSCHIL'
            PLA:KOERSVERSCHIL=stVeld.After('=')
        of 'PLA:EXTRAKOSTEN'
            PLA:EXTRAKOSTEN=stVeld.After('=')
        of 'PLA:LOTID'
            PLA:LOTID=stVeld.After('=')
        of 'PLA:PLANTNUMBER'
            PLA:PLANTNUMBER=stVeld.After('=')
        of 'PLA:DELIVERYDATE_DATE'
            PLA:DELIVERYDATE_DATE=stVeld.After('=')
        of 'PLA:DELIVERYDATE_TIME'
            PLA:DELIVERYDATE_TIME=stVeld.After('=')
        of 'PLA:PLANNINGIDRETOUR'
            PLA:PLANNINGIDRETOUR=stVeld.After('=')
        of 'PLA:PLANNINGIDPARENT'
            PLA:PLANNINGIDPARENT=stVeld.After('=')
        of 'PLA:AANVULLING'
            PLA:AANVULLING=stVeld.After('=')
        of 'PLA:DOZEN'
            PLA:DOZEN=stVeld.After('=')
        of 'PLA:GROSSWEIGHT'
            PLA:GROSSWEIGHT=stVeld.After('=')
        of 'PLA:OVERBOEKSOORT'
            PLA:OVERBOEKSOORT=stVeld.After('=')
        of 'PLA:OverboekCelLocatieID'
            PLA:OverboekCelLocatieID=stVeld.After('=')
        of 'PLA:NieuwKg'
            PLA:NieuwKg=stVeld.After('=')
        of 'PLA:NieuwPallets'
            PLA:NieuwPallets=stVeld.After('=')
        END    
    End
    Loc:SQLCommando= |
        'INSERT INTO [dbo].[Planning] ' & |
'           ([PlanningID] ' & |
'           ,[VerkoopID] ' & |
'           ,[InkoopID] ' & |
'           ,[ArtikelID] ' & |
'           ,[KG] ' & |
'           ,[Pallets] ' & |
'           ,[Planning] ' & |
'           ,[VerpakkingID] ' & |
'           ,[CelID] ' & |
'           ,[PartijID] ' & |
'           ,[Memo] ' & |
'           ,[MutatieGemaakt] ' & |
'           ,[Geprint] ' & |
'           ,[Verwerkt] ' & |
'           ,[Leverancier] ' & |
'           ,[OverboekingCelID] ' & |
'           ,[Instructie] ' & |
'           ,[Transport] ' & |
'           ,[Gewogen] ' & |
'           ,[CelLocatieID] ' & |
'           ,[MutatieKG] ' & |
'           ,[MutatiePallets] ' & |
'           ,[OverboekingPlanningID] ' & |
'           ,[InkoopKGPrijs] ' & |
'           ,[VerkoopKGPrijs] ' & |
'           ,[UitslagPalletbladDueDate12] ' & |
'           ,[UitslagPalletbladProductionDate11] ' & |
'           ,[UitslagPalletbladSellByDate15] ' & |
'           ,[AlternatieveArtikelOms] ' & |
'           ,[VerpakkingKlasseID] ' & |
'           ,[AantalVerpakkingen] ' & |
'           ,[UitslagPalletbladOriginLiveBird] ' & |
'           ,[UitslagPalletbladOriginSlautherHouse] ' & |
'           ,[UitslagPalletbladOriginProcessing] ' & |
'           ,[UitslagPalletbladOriginPacking] ' & |
'           ,[Valuta] ' & |
'           ,[Koersverschil] ' & |
'           ,[ExtraKosten] ' & |
'           ,[LotID] ' & |
'           ,[PlantNumber] ' & |
'           ,[DeliveryDate] ' & |
'           ,[PlanningIDRetour] ' & |
'           ,[PlanningIDParent] ' & |
'           ,[Aanvulling] ' & |
'           ,[Dozen] ' & |
'           ,[GrossWeight] ' & |
'           ,[OverboekSoort] ' & |
'           ,[OverboekCelLocatieID] ' & |
'           ,[NieuwKg] ' & |
'           ,[NieuwPallets]) ' & |
'     VALUES (' & |
        Pla:PlanningID&|
        ', '&Pla:VerkoopID &|
        ', '&Pla:InkoopID&|
        ', '&Pla:ArtikelID&|
        ', '&Pla:KG&|
        ', '&Pla:Pallets&|
        ', <39>'&CHOOSE(Pla:Planning_DATE=0,'1900-01-01',Format(Pla:Planning_DATE,@D010-))&' '&Format(Pla:Planning_TIME,@T01)&'<39>'&|
        ', '&Pla:VerpakkingID &|
        ', '&Pla:CelID&|
        ', '&Pla:PartijID&|
        ', <39>'&Pla:Memo&'<39>'&|
        ', '&Pla:MutatieGemaakt&|
        ', '&Pla:Geprint&|
        ', '&Pla:Verwerkt&|
        ', '&Pla:Leverancier&|
        ', '&Pla:OverboekingCelID&|
        ', <39>'&Pla:Instructie&'<39>'&|
        ', <39>'&Pla:Transport&'<39>'&|
        ', '&Pla:Gewogen&|
        ', '&Pla:CelLocatieID&|
        ', '&Pla:MutatieKG&|
        ', '&Pla:MutatiePallets&|
        ', '&Pla:OverboekingPlanningID&|
        ', '&Pla:InkoopKGPrijs&|
        ', '&Pla:VerkoopKGPrijs&|
        ', <39>'&CHOOSE(Pla:UitslagPalletbladDueDate12_DATE=0,'1900-01-01',Format(Pla:UitslagPalletbladDueDate12_DATE,@D010-))&' '&Format(Pla:UitslagPalletbladDueDate12_TIME,@T01)&'<39>'&|
        ', <39>'&CHOOSE(Pla:UitslagPalletbladProductionDate11_DATE=0,'1900-01-01',Format(Pla:UitslagPalletbladProductionDate11_DATE,@D010-))&' '&Format(Pla:UitslagPalletbladProductionDate11_TIME,@T01)&'<39>'&|
        ', <39>'&CHOOSE(Pla:UitslagPalletbladSellByDate15_DATE=0,'1900-01-01',Format(Pla:UitslagPalletbladSellByDate15_DATE,@D010-))&' '&Format(Pla:UitslagPalletbladSellByDate15_TIME,@T01)&'<39>'&|
        ', <39>'&Pla:AlternatieveArtikelOms&'<39>'&|
        ', '&Pla:VerpakkingKlasseID&|
        ', '&Pla:AantalVerpakkingen&|
        ', <39>'&Pla:UitslagPalletbladOriginLiveBird&'<39>'&|
        ', <39>'&Pla:UitslagPalletbladOriginSlautherHouse&'<39>'&|
        ', <39>'&Pla:UitslagPalletbladOriginProcessing&'<39>'&|
        ', <39>'&Pla:UitslagPalletbladOriginPacking&'<39>'&|
        ', <39>'&Pla:Valuta&'<39>'&|
        ', '&Pla:Koersverschil&|
        ', '&Pla:ExtraKosten&|
        ', '&Pla:LotID&|
        ', <39>'&Pla:PlantNumber&'<39>'&|
        ', <39>'&CHOOSE(Pla:DeliveryDate_DATE=0,'1900-01-01',Format(Pla:DeliveryDate_DATE,@D010-))&' '&Format(Pla:DeliveryDate_TIME,@T01)&'<39>'&|
        ', '&Pla:PlanningIDRetour&|
        ', '&Pla:PlanningIDParent&|
        ', <39>'&Pla:Aanvulling&'<39>'&|
        ', '&Pla:Dozen&|
        ', '&Pla:GrossWeight&|
        ', <39>'&Pla:OverboekSoort&'<39>'&|
        ', '&Pla:OverboekCelLocatieID&|
        ', '&Pla:NieuwKG&|
        ', '&Pla:NieuwPallets&|
        ')'
    SetClipBoard(Loc:SQLCommando)
    Planning{Prop:SQL}=Loc:SQLCommando
   !Access:Partij.Insert()
!Add(Partij)
    IF ERROR() THEN STOP('Error '&ERROR()&'|'&FILEERROR()).

    Planning{Prop:SQL}= 'SET IDENTITY_INSERT dbo.Planning OFF'
    IF ERROR() THEN STOP('Error '&ERROR()&'|'&FILEERROR()).
    Return


ThisProcess.TakeRecord PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
      Case Log:Tabel
      of 'Partij'
          LocalClass.RestorePartij(Log:RecordInhoudPre)
      of 'Verkoop'
          LocalClass.RestoreVerkoop(Log:RecordInhoudPre)
      of 'Planning'
          LocalClass.RestorePlanning(Log:RecordInhoudPre)
      End
  ReturnValue = PARENT.TakeRecord()
  RETURN ReturnValue

