

   MEMBER('Voorraad.clw')                                  ! This is a MEMBER module


   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('VOORRAAD027.INC'),ONCE        !Local module procedure declarations
                     END


!!! <summary>
!!! Generated from procedure template - Window
!!! Form GebruikerLog
!!! </summary>
UpdateGebruikerLog PROCEDURE 

udpt            UltimateDebugProcedureTracker
CurrentTab           STRING(80)                            ! 
ActionMessage        CSTRING(40)                           ! 
LocEnableEnterByTab  BYTE(1)                               !Used by the ENTER Instead of Tab template
EnterByTabManager    EnterByTabClass
History::Log:Record  LIKE(Log:RECORD),THREAD
QuickWindow          WINDOW('Form GebruikerLog'),AT(,,463,332),FONT('MS Sans Serif',8,,FONT:regular,CHARSET:DEFAULT), |
  DOUBLE,CENTER,GRAY,IMM,MDI,HLP('UpdateGebruikerLog'),SYSTEM
                       BUTTON('&OK'),AT(347,316,49,14),USE(?OK),LEFT,ICON('WAOK.ICO'),DEFAULT,FLAT,MSG('Accept dat' & |
  'a and close the window'),TIP('Accept data and close the window')
                       BUTTON('&Annuleren'),AT(399,316,61,14),USE(?Cancel),LEFT,ICON('WACANCEL.ICO'),FLAT,MSG('Cancel operation'), |
  TIP('Cancel operation')
                       ENTRY(@t7),AT(153,31,31,10),USE(Log:Uitgevoerd_TIME)
                       PROMPT('Gebruiker:'),AT(3,3),USE(?Log:WindowsInlog:Prompt),TRN
                       ENTRY(@s50),AT(87,3,204,10),USE(Log:WindowsInlog)
                       PROMPT('Uitgevoerd:'),AT(3,31),USE(?Log:Uitgevoerd_DATE:Prompt),TRN
                       ENTRY(@d17),AT(87,31,60,10),USE(Log:Uitgevoerd_DATE)
                       PROMPT('Handeling:'),AT(3,59),USE(?Log:Handeling:Prompt),TRN
                       ENTRY(@s20),AT(87,59,84,10),USE(Log:Handeling)
                       PROMPT('Handeling Opmerking:'),AT(3,73),USE(?Log:HandelingOpmerking:Prompt),TRN
                       ENTRY(@s100),AT(87,73,258,10),USE(Log:HandelingOpmerking)
                       PROMPT('Tabel:'),AT(3,102),USE(?Log:Tabel:Prompt),TRN
                       ENTRY(@s30),AT(87,102,124,10),USE(Log:Tabel)
                       PROMPT('Record Inhoud:'),AT(3,116),USE(?Log:RecordInhoudPre:Prompt),TRN
                       PROMPT('PC:'),AT(2,17),USE(?Log:Werkstation:Prompt)
                       ENTRY(@s30),AT(87,17,204,10),USE(Log:Werkstation)
                       TEXT,AT(87,117,373,194),USE(Log:RecordInhoudPre,,?Log:RecordInhoudPre:2),HVSCROLL,BOXED
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
    GlobalErrors.Throw(Msg:InsertIllegal)
    RETURN
  OF ChangeRecord
    GlobalErrors.Throw(Msg:UpdateIllegal)
    RETURN
  OF DeleteRecord
    GlobalErrors.Throw(Msg:DeleteIllegal)
    RETURN
  END
  QuickWindow{PROP:Text} = ActionMessage                   ! Display status message in title bar
  PARENT.Ask


ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
        udpt.Init(UD,'UpdateGebruikerLog','Voorraad027.clw','Voorraad.EXE','05/26/2020 @ 12:06PM')    
             
  GlobalErrors.SetProcedureName('UpdateGebruikerLog')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?OK
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
  SELF.HistoryKey = CtrlH
  SELF.AddHistoryFile(Log:Record,History::Log:Record)
  SELF.AddHistoryField(?Log:Uitgevoerd_TIME,7)
  SELF.AddHistoryField(?Log:WindowsInlog,2)
  SELF.AddHistoryField(?Log:Uitgevoerd_DATE,6)
  SELF.AddHistoryField(?Log:Handeling,8)
  SELF.AddHistoryField(?Log:HandelingOpmerking,9)
  SELF.AddHistoryField(?Log:Tabel,10)
  SELF.AddHistoryField(?Log:Werkstation,3)
  SELF.AddHistoryField(?Log:RecordInhoudPre:2,11)
  SELF.AddUpdateFile(Access:GebruikerLog)
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  Relate:GebruikerLog.Open                                 ! File GebruikerLog used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Primary &= Relate:GebruikerLog
  IF SELF.Request = ViewRecord AND NOT SELF.BatchProcessing ! Setup actions for ViewOnly Mode
    SELF.InsertAction = Insert:None
    SELF.DeleteAction = Delete:None
    SELF.ChangeAction = Change:None
    SELF.CancelAction = Cancel:Cancel
    SELF.OkControl = 0
  ELSE
    SELF.InsertAction = Insert:None                        ! Inserts not allowed
    SELF.DeleteAction = Delete:None                        ! Deletes not allowed
    SELF.ChangeAction = Change:None                        ! Changes not allowed
    SELF.CancelAction = Cancel:Cancel+Cancel:Query         ! Confirm cancel
    SELF.OkControl = ?OK
    IF SELF.PrimeUpdate() THEN RETURN Level:Notify.
  END
  SELF.Open(QuickWindow)                                   ! Open window
  WinAlertMouseZoom()
  Do DefineListboxStyle
  QuickWindow{Prop:Alrt,255} = CtrlShiftP
  IF SELF.Request = ViewRecord                             ! Configure controls for View Only mode
    ?Log:Uitgevoerd_TIME{PROP:ReadOnly} = True
    ?Log:WindowsInlog{PROP:ReadOnly} = True
    ?Log:Uitgevoerd_DATE{PROP:ReadOnly} = True
    ?Log:Handeling{PROP:ReadOnly} = True
    ?Log:HandelingOpmerking{PROP:ReadOnly} = True
    ?Log:Tabel{PROP:ReadOnly} = True
    ?Log:Werkstation{PROP:ReadOnly} = True
    ?Log:RecordInhoudPre:2{PROP:ReadOnly} = True
  END
  INIMgr.Fetch('UpdateGebruikerLog',QuickWindow)           ! Restore window settings from non-volatile store
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
    Relate:GebruikerLog.Close
  END
  IF SELF.Opened
    INIMgr.Update('UpdateGebruikerLog',QuickWindow)        ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
            
   
  RETURN ReturnValue


ThisWindow.PrimeUpdate PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.PrimeUpdate()
    If returnValue = Level:Fatal  ! delete just occured
      ThisNetRefresh.Send('|GebruikerLog|') ! NetTalk (NetRefresh)
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
    ThisNetRefresh.Send('|GebruikerLog|') ! NetTalk (NetRefresh)
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
     IF KEYCODE()=CtrlShiftP AND EVENT() = Event:PreAlertKey
       CYCLE
     END
     IF KEYCODE()=CtrlShiftP  
        UD.ShowProcedureInfo('UpdateGebruikerLog',UD.SetApplicationName('Voorraad','EXE'),QuickWindow{PROP:Hlp},'09/08/2011 @ 04:17PM','05/26/2020 @ 12:06PM','05/26/2020 @ 12:10PM')  
    
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

