

   MEMBER('VoorrStm.clw')                                  ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABPOPUP.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('VOORRSTM016.INC'),ONCE        !Local module procedure declarations
                     END


!!! <summary>
!!! Generated from procedure template - Window
!!! Form Cel
!!! </summary>
UpdateCel PROCEDURE 

CurrentTab           STRING(80)                            ! 
ActionMessage        CSTRING(40)                           ! 
BRW10::View:Browse   VIEW(CelLocatie)
                       PROJECT(CL:Locatienaam)
                       PROJECT(CL:XPos)
                       PROJECT(CL:YPos)
                       PROJECT(CL:Breedte)
                       PROJECT(CL:Lengte)
                       PROJECT(CL:Hoogte)
                       PROJECT(CL:Direction)
                       PROJECT(CL:CelLocatieID)
                       PROJECT(CL:CelID)
                     END
Queue:Browse         QUEUE                            !Queue declaration for browse/combo box using ?List
CL:Locatienaam         LIKE(CL:Locatienaam)           !List box control field - type derived from field
CL:XPos                LIKE(CL:XPos)                  !List box control field - type derived from field
CL:YPos                LIKE(CL:YPos)                  !List box control field - type derived from field
CL:Breedte             LIKE(CL:Breedte)               !List box control field - type derived from field
CL:Lengte              LIKE(CL:Lengte)                !List box control field - type derived from field
CL:Hoogte              LIKE(CL:Hoogte)                !List box control field - type derived from field
CL:Direction           LIKE(CL:Direction)             !List box control field - type derived from field
CL:CelLocatieID        LIKE(CL:CelLocatieID)          !Primary key field - type derived from field
CL:CelID               LIKE(CL:CelID)                 !Browse key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
LocEnableEnterByTab  BYTE(1)                               !Used by the ENTER Instead of Tab template
EnterByTabManager    EnterByTabClass
History::CEL:Record  LIKE(CEL:RECORD),THREAD
NetLocalRefreshDate     Long     ! NetTalk (NetRefresh)
NetLocalRefreshTime     Long
NetLocalDependancies    String('|Cel|CelLocatie|')
QuickWindow          WINDOW('Form Cel'),AT(,,273,244),FONT('MS Sans Serif',8,,,CHARSET:DEFAULT),DOUBLE,CENTER,GRAY, |
  IMM,MDI,HLP('UpdateCel'),SYSTEM
                       SHEET,AT(4,4,265,214),USE(?CurrentTab)
                         TAB('&1) General'),USE(?Tab:1)
                           PROMPT('Cel ID:'),AT(8,20),USE(?CEL:CelID:Prompt),RIGHT,TRN
                           ENTRY(@n-14),AT(61,20,64,10),USE(CEL:CelID),RIGHT(1),DISABLE
                           PROMPT('Cel Omschrijving:'),AT(8,34),USE(?CEL:CelOms:Prompt),TRN
                           ENTRY(@s50),AT(61,34,204,10),USE(CEL:CelOms),REQ
                           PROMPT('Breedte:'),AT(8,47),USE(?CEL:Breedte:Prompt)
                           ENTRY(@n-14),AT(61,46,60,10),USE(CEL:Breedte),RIGHT(1)
                           PROMPT('Lengte:'),AT(8,59),USE(?CEL:Lengte:Prompt)
                           ENTRY(@n-14),AT(61,58,60,10),USE(CEL:Lengte),RIGHT(1)
                           LIST,AT(61,73,204,122),USE(?List),FORMAT('47L(2)|M~Locatienaam~@s50@26L(2)|M~XPos~L(1)@' & |
  'n4@27L(2)|M~YPos~L(1)@n4@31L(2)|M~Breedte~L(1)@n4@26L(2)|M~Lengte~L(1)@n4@28L(2)|M~H' & |
  'oogte~L(1)@n4@200L(2)|M~Direction~L(0)@s50@'),FROM(Queue:Browse),IMM
                           BUTTON('&Change'),AT(179,199,42,12),USE(?Change)
                           BUTTON('&Insert'),AT(139,199,42,12),USE(?Insert)
                           BUTTON('&Delete'),AT(223,199,42,12),USE(?Delete)
                         END
                       END
                       BUTTON('&OK'),AT(165,221,49,14),USE(?OK),LEFT,ICON('WAOK.ICO'),DEFAULT,FLAT,MSG('Accept dat' & |
  'a and close the window'),TIP('Accept data and close the window')
                       BUTTON('&Cancel'),AT(217,221,49,14),USE(?Cancel),LEFT,ICON('WACANCEL.ICO'),FLAT,MSG('Cancel operation'), |
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
Run                    PROCEDURE(USHORT Number,BYTE Request),BYTE,PROC,DERIVED
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED
TakeCompleted          PROCEDURE(),BYTE,PROC,DERIVED
TakeEvent              PROCEDURE(),BYTE,PROC,DERIVED
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
Resizer              CLASS(WindowResizeClass)
Init                   PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)
                     END

BRW10                CLASS(BrowseClass)                    ! Browse using ?List
Q                      &Queue:Browse                  !Reference to browse queue
Init                   PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)
                     END

BRW10::Sort0:Locator StepLocatorClass                      ! Default Locator
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
  GlobalErrors.SetProcedureName('UpdateCel')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?CEL:CelID:Prompt
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
  SELF.HistoryKey = CtrlH
  SELF.AddHistoryFile(CEL:Record,History::CEL:Record)
  SELF.AddHistoryField(?CEL:CelID,1)
  SELF.AddHistoryField(?CEL:CelOms,2)
  SELF.AddHistoryField(?CEL:Breedte,3)
  SELF.AddHistoryField(?CEL:Lengte,4)
  SELF.AddUpdateFile(Access:Cel)
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  Relate:Cel.SetOpenRelated()
  Relate:Cel.Open                                          ! File Cel used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Primary &= Relate:Cel
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
  BRW10.Init(?List,Queue:Browse.ViewPosition,BRW10::View:Browse,Queue:Browse,Relate:CelLocatie,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  WinAlertMouseZoom()
  Do DefineListboxStyle
  IF SELF.Request = ViewRecord                             ! Configure controls for View Only mode
    ?CEL:CelID{PROP:ReadOnly} = True
    ?CEL:CelOms{PROP:ReadOnly} = True
    ?CEL:Breedte{PROP:ReadOnly} = True
    ?CEL:Lengte{PROP:ReadOnly} = True
    DISABLE(?Change)
    DISABLE(?Insert)
    DISABLE(?Delete)
  END
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  BRW10.Q &= Queue:Browse
  BRW10.ActiveInvisible = 1
  BRW10.RetainRow = 0
  BRW10.AddSortOrder(,CL:FK_CelLocatie)                    ! Add the sort order for CL:FK_CelLocatie for sort order 1
  BRW10.AddRange(CL:CelID,Relate:CelLocatie,Relate:Cel)    ! Add file relationship range limit for sort order 1
  BRW10.AddLocator(BRW10::Sort0:Locator)                   ! Browse has a locator for sort order 1
  BRW10::Sort0:Locator.Init(,CL:CelLocatieID,1,BRW10)      ! Initialize the browse locator using  using key: CL:FK_CelLocatie , CL:CelLocatieID
  BRW10.AddField(CL:Locatienaam,BRW10.Q.CL:Locatienaam)    ! Field CL:Locatienaam is a hot field or requires assignment from browse
  BRW10.AddField(CL:XPos,BRW10.Q.CL:XPos)                  ! Field CL:XPos is a hot field or requires assignment from browse
  BRW10.AddField(CL:YPos,BRW10.Q.CL:YPos)                  ! Field CL:YPos is a hot field or requires assignment from browse
  BRW10.AddField(CL:Breedte,BRW10.Q.CL:Breedte)            ! Field CL:Breedte is a hot field or requires assignment from browse
  BRW10.AddField(CL:Lengte,BRW10.Q.CL:Lengte)              ! Field CL:Lengte is a hot field or requires assignment from browse
  BRW10.AddField(CL:Hoogte,BRW10.Q.CL:Hoogte)              ! Field CL:Hoogte is a hot field or requires assignment from browse
  BRW10.AddField(CL:Direction,BRW10.Q.CL:Direction)        ! Field CL:Direction is a hot field or requires assignment from browse
  BRW10.AddField(CL:CelLocatieID,BRW10.Q.CL:CelLocatieID)  ! Field CL:CelLocatieID is a hot field or requires assignment from browse
  BRW10.AddField(CL:CelID,BRW10.Q.CL:CelID)                ! Field CL:CelID is a hot field or requires assignment from browse
  INIMgr.Fetch('UpdateCel',QuickWindow)                    ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  BRW10.AskProcedure = 1                                   ! Will call: UpdateCelLocatie
  BRW10.AddToolbarTarget(Toolbar)                          ! Browse accepts toolbar control
  SELF.SetAlerts()
  NetLocalRefreshDate = today()         ! NetTalk (NetRefresh)
  NetLocalRefreshTime = clock()
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
    Relate:Cel.Close
  END
  IF SELF.Opened
    INIMgr.Update('UpdateCel',QuickWindow)                 ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.PrimeUpdate PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.PrimeUpdate()
    If returnValue = Level:Fatal  ! delete just occured
      ThisNetRefresh.Send('|Cel|CelLocatie|CelLocatie|') ! NetTalk (NetRefresh)
    End
  RETURN ReturnValue


ThisWindow.Reset PROCEDURE(BYTE Force=0)

  CODE
  SELF.ForcedReset += Force
  IF QuickWindow{Prop:AcceptAll} THEN RETURN.
    NetLocalRefreshDate = today()         ! NetTalk (NetRefresh)
    NetLocalRefreshTime = clock()
  PARENT.Reset(Force)


ThisWindow.Run PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Run()
  IF SELF.Request = ViewRecord                             ! In View Only mode always signal RequestCancelled
    ReturnValue = RequestCancelled
  END
  RETURN ReturnValue


ThisWindow.Run PROCEDURE(USHORT Number,BYTE Request)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Run(Number,Request)
  IF SELF.Request = ViewRecord
    ReturnValue = RequestCancelled                         ! Always return RequestCancelled if the form was opened in ViewRecord mode
  ELSE
    GlobalRequest = Request
    UpdateCelLocatie
    ReturnValue = GlobalResponse
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
    ThisNetRefresh.Send('|Cel|CelLocatie|CelLocatie|') ! NetTalk (NetRefresh)
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
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


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window


BRW10.Init PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)

  CODE
  PARENT.Init(ListBox,Posit,V,Q,RM,WM)
  IF WM.Request <> ViewRecord                              ! If called for anything other than ViewMode, make the insert, change & delete controls available
    SELF.InsertControl=?Insert
    SELF.ChangeControl=?Change
    SELF.DeleteControl=?Delete
  END

