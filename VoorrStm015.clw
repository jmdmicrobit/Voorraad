

   MEMBER('VoorrStm.clw')                                  ! This is a MEMBER module


   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('VOORRSTM015.INC'),ONCE        !Local module procedure declarations
                     END


!!! <summary>
!!! Generated from procedure template - Window
!!! Form CelLocatie
!!! </summary>
UpdateCelLocatie PROCEDURE 

CurrentTab           STRING(80)                            ! 
ActionMessage        CSTRING(40)                           ! 
LocEnableEnterByTab  BYTE(1)                               !Used by the ENTER Instead of Tab template
EnterByTabManager    EnterByTabClass
History::CL:Record   LIKE(CL:RECORD),THREAD
QuickWindow          WINDOW('Form CelLocatie'),AT(,,284,185),FONT('MS Sans Serif',8,,FONT:regular,CHARSET:DEFAULT), |
  DOUBLE,CENTER,GRAY,IMM,MDI,HLP('UpdateCelLocatie'),SYSTEM
                       SHEET,AT(4,4,276,153),USE(?CurrentTab)
                         TAB('&1) General'),USE(?Tab:1)
                           PROMPT('Cel Locatie ID:'),AT(8,20),USE(?CL:CelLocatieID:Prompt),TRN
                           ENTRY(@n_10),AT(72,20,64,10),USE(CL:CelLocatieID),DISABLE
                           PROMPT('Cel ID:'),AT(8,34),USE(?CL:CelID:Prompt),TRN
                           ENTRY(@n_10),AT(72,34,64,10),USE(CL:CelID),DISABLE
                           PROMPT('Locatienaam:'),AT(8,48),USE(?CL:Locatienaam:Prompt),TRN
                           ENTRY(@s50),AT(72,48,204,10),USE(CL:Locatienaam)
                           PROMPT('XPos:'),AT(8,60),USE(?CL:XPos:Prompt)
                           ENTRY(@n4),AT(72,59,60,10),USE(CL:XPos),RIGHT(1)
                           PROMPT('YPos:'),AT(8,73),USE(?CL:YPos:Prompt)
                           ENTRY(@n4),AT(72,72,60,10),USE(CL:YPos),RIGHT(1)
                           PROMPT('Breedte:'),AT(8,85),USE(?CL:Breedte:Prompt)
                           ENTRY(@n4),AT(72,85,60,10),USE(CL:Breedte),RIGHT(1)
                           PROMPT('Lengte:'),AT(8,97),USE(?CL:Lengte:Prompt)
                           ENTRY(@n4),AT(72,97,60,10),USE(CL:Lengte),RIGHT(1)
                           PROMPT('Hoogte:'),AT(9,110),USE(?CL:Hoogte:Prompt)
                           ENTRY(@n4),AT(72,110,60,10),USE(CL:Hoogte),RIGHT(1)
                           PROMPT('Direction:'),AT(9,127),USE(?CL:Direction:Prompt)
                           LIST,AT(72,125,181),USE(CL:Direction),DROP(4),FROM('LinksRechts|RechtsLinks|BovenOnder|' & |
  'OnderBoven')
                         END
                       END
                       BUTTON('&OK'),AT(178,169,49,14),USE(?OK),LEFT,ICON('WAOK.ICO'),DEFAULT,FLAT,MSG('Accept dat' & |
  'a and close the window'),TIP('Accept data and close the window')
                       BUTTON('&Cancel'),AT(231,169,49,14),USE(?Cancel),LEFT,ICON('WACANCEL.ICO'),FLAT,MSG('Cancel operation'), |
  TIP('Cancel operation')
                     END

ThisWindow           CLASS(WindowManager)
Ask                    PROCEDURE(),DERIVED
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
Run                    PROCEDURE(),BYTE,PROC,DERIVED
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED
TakeEvent              PROCEDURE(),BYTE,PROC,DERIVED
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
? DEBUGHOOK(CelLocatie:Record)
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
  GlobalErrors.SetProcedureName('UpdateCelLocatie')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?CL:CelLocatieID:Prompt
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
  SELF.HistoryKey = CtrlH
  SELF.AddHistoryFile(CL:Record,History::CL:Record)
  SELF.AddHistoryField(?CL:CelLocatieID,1)
  SELF.AddHistoryField(?CL:CelID,2)
  SELF.AddHistoryField(?CL:Locatienaam,3)
  SELF.AddHistoryField(?CL:XPos,4)
  SELF.AddHistoryField(?CL:YPos,5)
  SELF.AddHistoryField(?CL:Breedte,6)
  SELF.AddHistoryField(?CL:Lengte,7)
  SELF.AddHistoryField(?CL:Hoogte,8)
  SELF.AddHistoryField(?CL:Direction,9)
  SELF.AddUpdateFile(Access:CelLocatie)
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  Relate:CelLocatie.SetOpenRelated()
  Relate:CelLocatie.Open                                   ! File CelLocatie used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Primary &= Relate:CelLocatie
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
  Do DefineListboxStyle
  IF SELF.Request = ViewRecord                             ! Configure controls for View Only mode
    ?CL:CelLocatieID{PROP:ReadOnly} = True
    ?CL:CelID{PROP:ReadOnly} = True
    ?CL:Locatienaam{PROP:ReadOnly} = True
    ?CL:XPos{PROP:ReadOnly} = True
    ?CL:YPos{PROP:ReadOnly} = True
    ?CL:Breedte{PROP:ReadOnly} = True
    ?CL:Lengte{PROP:ReadOnly} = True
    ?CL:Hoogte{PROP:ReadOnly} = True
    DISABLE(?CL:Direction)
  END
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('UpdateCelLocatie',QuickWindow)             ! Restore window settings from non-volatile store
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
    Relate:CelLocatie.Close
  END
  IF SELF.Opened
    INIMgr.Update('UpdateCelLocatie',QuickWindow)          ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
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
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window

