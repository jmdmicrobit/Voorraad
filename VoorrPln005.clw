

   MEMBER('VoorrPln.clw')                                  ! This is a MEMBER module


   INCLUDE('ABDROPS.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('VOORRPLN005.INC'),ONCE        !Local module procedure declarations
                     END


!!! <summary>
!!! Generated from procedure template - Window
!!! Form Mutatie
!!! </summary>
UpdateEUitslagMutatie PROCEDURE 

CurrentTab           STRING(80)                            ! 
ActionMessage        CSTRING(40)                           ! 
FDCB8::View:FileDropCombo VIEW(Cel)
                       PROJECT(CEL:CelOms)
                       PROJECT(CEL:CelID)
                     END
Queue:FileDropCombo  QUEUE                            !
CEL:CelOms             LIKE(CEL:CelOms)               !List box control field - type derived from field
CEL:CelID              LIKE(CEL:CelID)                !Primary key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
LocEnableEnterByTab  BYTE(1)                               !Used by the ENTER Instead of Tab template
EnterByTabManager    EnterByTabClass
History::Mut:Record  LIKE(Mut:RECORD),THREAD
QuickWindow          WINDOW('Form Mutatie'),AT(,,249,93),FONT('MS Sans Serif',8,,FONT:regular,CHARSET:DEFAULT), |
  RESIZE,CENTER,GRAY,IMM,MDI,HLP('UpdateEUitslagMutatie'),SYSTEM
                       BUTTON('&OK'),AT(136,68,49,14),USE(?OK),LEFT,ICON('WAOK.ICO'),DEFAULT,FLAT,MSG('Accept dat' & |
  'a and close the window'),TIP('Accept data and close the window')
                       BUTTON('&Cancel'),AT(189,68,49,14),USE(?Cancel),LEFT,ICON('WACANCEL.ICO'),FLAT,MSG('Cancel operation'), |
  TIP('Cancel operation')
                       ENTRY(@s39),AT(77,54,160,10),USE(Mut:RedenAfboeking)
                       PROMPT('Reden Afboeking:'),AT(9,54),USE(?Mut:RedenAfboeking:Prompt),TRN
                       ENTRY(@n12`2),AT(76,9,64,10),USE(Mut:UitslagKG),RIGHT
                       PROMPT('Uitslag KG:'),AT(9,9),USE(?Mut:UitslagKG:Prompt),TRN
                       ENTRY(@n14.),AT(76,24,64,10),USE(Mut:UitslagPallet),RIGHT
                       PROMPT('Uitslag Pallet:'),AT(9,24),USE(?Mut:UitslagPallet:Prompt),TRN
                       PROMPT('Cel:'),AT(9,38),USE(?PROMPT1)
                       COMBO(@s50),AT(77,39,160,10),USE(CEL:CelOms),DROP(5),FORMAT('200L(2)|M~Omschrijving~@s50@'), |
  FROM(Queue:FileDropCombo),IMM
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
FDCB8                CLASS(FileDropComboClass)             ! File drop combo manager
Q                      &Queue:FileDropCombo           !Reference to browse queue type
                     END

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
  GlobalErrors.SetProcedureName('UpdateEUitslagMutatie')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?OK
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
  SELF.AddUpdateFile(Access:Mutatie)
  SELF.HistoryKey = CtrlH
  SELF.AddHistoryFile(Mut:Record,History::Mut:Record)
  SELF.AddHistoryField(?Mut:RedenAfboeking,15)
  SELF.AddHistoryField(?Mut:UitslagKG,10)
  SELF.AddHistoryField(?Mut:UitslagPallet,11)
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  Relate:Cel.SetOpenRelated()
  Relate:Cel.Open                                          ! File Cel used by this procedure, so make sure it's RelationManager is open
  Relate:Mutatie.Open                                      ! File Mutatie used by this procedure, so make sure it's RelationManager is open
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
  WinAlertMouseZoom()
  Do DefineListboxStyle
  IF SELF.Request = ViewRecord                             ! Configure controls for View Only mode
    ?Mut:RedenAfboeking{PROP:ReadOnly} = True
    ?Mut:UitslagKG{PROP:ReadOnly} = True
    ?Mut:UitslagPallet{PROP:ReadOnly} = True
    DISABLE(?CEL:CelOms)
  END
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('UpdateEUitslagMutatie',QuickWindow)        ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  FDCB8.Init(CEL:CelOms,?CEL:CelOms,Queue:FileDropCombo.ViewPosition,FDCB8::View:FileDropCombo,Queue:FileDropCombo,Relate:Cel,ThisWindow,GlobalErrors,0,1,0)
  FDCB8.Q &= Queue:FileDropCombo
  FDCB8.AddSortOrder(CEL:CEL_PK)
  FDCB8.AddField(CEL:CelOms,FDCB8.Q.CEL:CelOms) !List box control field - type derived from field
  FDCB8.AddField(CEL:CelID,FDCB8.Q.CEL:CelID) !Primary key field - type derived from field
  FDCB8.AddUpdateField(CEL:CelID,Mut:CelID)
  ThisWindow.AddItem(FDCB8.WindowComponent)
  FDCB8.DefaultFill = 0
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
    Relate:Cel.Close
    Relate:Mutatie.Close
  END
  IF SELF.Opened
    INIMgr.Update('UpdateEUitslagMutatie',QuickWindow)     ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.PrimeUpdate PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.PrimeUpdate()
    If returnValue = Level:Fatal  ! delete just occured
      ThisNetRefresh.Send('|Mutatie|Cel|') ! NetTalk (NetRefresh)
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
    ThisNetRefresh.Send('|Mutatie|Cel|') ! NetTalk (NetRefresh)
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

