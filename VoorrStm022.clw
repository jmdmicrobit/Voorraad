

   MEMBER('VoorrStm.clw')                                  ! This is a MEMBER module


   INCLUDE('ABDROPS.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('VOORRSTM022.INC'),ONCE        !Local module procedure declarations
                     END


!!! <summary>
!!! Generated from procedure template - Window
!!! Form Rapporten
!!! </summary>
UpdateRapporten PROCEDURE 

CurrentTab           STRING(80)                            ! 
ActionMessage        CSTRING(40)                           ! 
LocEnableEnterByTab  BYTE(1)                               !Used by the ENTER Instead of Tab template
EnterByTabManager    EnterByTabClass
History::Rap:Record  LIKE(Rap:RECORD),THREAD
QuickWindow          WINDOW('Form Rapporten'),AT(,,358,214),FONT('Microsoft Sans Serif',8,,FONT:regular,CHARSET:DEFAULT), |
  RESIZE,CENTER,GRAY,IMM,MDI,HLP('UpdateRapporten'),SYSTEM
                       SHEET,AT(4,4,350,179),USE(?CurrentTab)
                         TAB('&1) General'),USE(?Tab:1)
                           PROMPT('Rapport ID:'),AT(8,20),USE(?Rap:RapportID:Prompt),TRN
                           ENTRY(@n-14),AT(88,20,64,10),USE(Rap:RapportID),DISABLE
                           PROMPT('Onderwerp:'),AT(8,34),USE(?Rap:Onderwerp:Prompt),TRN
                           ENTRY(@s50),AT(88,34,204,10),USE(Rap:Onderwerp)
                           PROMPT('Titel:'),AT(8,48),USE(?Rap:Titel:Prompt),TRN
                           ENTRY(@s50),AT(88,48,204,10),USE(Rap:Titel)
                           PROMPT('Emails:'),AT(8,62),USE(?Rap:Emails:Prompt),TRN
                           ENTRY(@s255),AT(88,62,262,10),USE(Rap:Emails)
                           CHECK('Maandag:'),AT(88,76,70,8),USE(Rap:Maandag)
                           CHECK('Dinsdag:'),AT(162,76,70,8),USE(Rap:Dinsdag)
                           CHECK('Woensdag:'),AT(236,76,70,8),USE(Rap:Woensdag)
                           CHECK('Donderdag:'),AT(88,88,70,8),USE(Rap:Donderdag)
                           CHECK('Vrijdag:'),AT(162,88,70,8),USE(Rap:Vrijdag)
                           CHECK('Zaterdag:'),AT(236,88,70,8),USE(Rap:Zaterdag)
                           CHECK('Zondag:'),AT(88,100,70,8),USE(Rap:Zondag)
                           PROMPT('Lst Execution DATE:'),AT(8,112),USE(?Rap:LstExecution_DATE:Prompt),TRN
                           ENTRY(@d17),AT(88,112,104,10),USE(Rap:LstExecution_DATE)
                           PROMPT('Lst Execution TIME:'),AT(8,126),USE(?Rap:LstExecution_TIME:Prompt),TRN
                           ENTRY(@t7),AT(88,126,104,10),USE(Rap:LstExecution_TIME)
                           PROMPT('Lst Response:'),AT(8,140),USE(?Rap:LstResponse:Prompt),TRN
                           ENTRY(@s255),AT(88,140,262,10),USE(Rap:LstResponse)
                           PROMPT('Rapport Source:'),AT(8,157),USE(?Rap:RapportSource:Prompt)
                           ENTRY(@s50),AT(88,157,262,10),USE(Rap:RapportSource,,?Rap:RapportSource:2)
                         END
                       END
                       BUTTON('&OK'),AT(250,195,49,14),USE(?OK),LEFT,ICON('WAOK.ICO'),DEFAULT,FLAT,MSG('Accept dat' & |
  'a and close the window'),TIP('Accept data and close the window')
                       BUTTON('&Cancel'),AT(303,195,49,14),USE(?Cancel),LEFT,ICON('WACANCEL.ICO'),FLAT,MSG('Cancel operation'), |
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
  OF DeleteRecord
    GlobalErrors.Throw(Msg:DeleteIllegal)
    RETURN
  END
  QuickWindow{PROP:Text} = ActionMessage                   ! Display status message in title bar
  PARENT.Ask


ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('UpdateRapporten')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Rap:RapportID:Prompt
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
  SELF.HistoryKey = CtrlH
  SELF.AddHistoryFile(Rap:Record,History::Rap:Record)
  SELF.AddHistoryField(?Rap:RapportID,1)
  SELF.AddHistoryField(?Rap:Onderwerp,2)
  SELF.AddHistoryField(?Rap:Titel,3)
  SELF.AddHistoryField(?Rap:Emails,4)
  SELF.AddHistoryField(?Rap:Maandag,5)
  SELF.AddHistoryField(?Rap:Dinsdag,6)
  SELF.AddHistoryField(?Rap:Woensdag,7)
  SELF.AddHistoryField(?Rap:Donderdag,8)
  SELF.AddHistoryField(?Rap:Vrijdag,9)
  SELF.AddHistoryField(?Rap:Zaterdag,10)
  SELF.AddHistoryField(?Rap:Zondag,11)
  SELF.AddHistoryField(?Rap:LstExecution_DATE,14)
  SELF.AddHistoryField(?Rap:LstExecution_TIME,15)
  SELF.AddHistoryField(?Rap:LstResponse,16)
  SELF.AddHistoryField(?Rap:RapportSource:2,17)
  SELF.AddUpdateFile(Access:Rapporten)
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  Relate:Rapporten.Open                                    ! File Rapporten used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Primary &= Relate:Rapporten
  IF SELF.Request = ViewRecord AND NOT SELF.BatchProcessing ! Setup actions for ViewOnly Mode
    SELF.InsertAction = Insert:None
    SELF.DeleteAction = Delete:None
    SELF.ChangeAction = Change:None
    SELF.CancelAction = Cancel:Cancel
    SELF.OkControl = 0
  ELSE
    SELF.DeleteAction = Delete:None                        ! Deletes not allowed
    SELF.ChangeAction = Change:Caller                      ! Changes allowed
    SELF.CancelAction = Cancel:Cancel+Cancel:Query         ! Confirm cancel
    SELF.OkControl = ?OK
    IF SELF.PrimeUpdate() THEN RETURN Level:Notify.
  END
  SELF.Open(QuickWindow)                                   ! Open window
  WinAlertMouseZoom()
  Do DefineListboxStyle
  IF SELF.Request = ViewRecord                             ! Configure controls for View Only mode
    ?Rap:RapportID{PROP:ReadOnly} = True
    ?Rap:Onderwerp{PROP:ReadOnly} = True
    ?Rap:Titel{PROP:ReadOnly} = True
    ?Rap:Emails{PROP:ReadOnly} = True
    ?Rap:LstExecution_DATE{PROP:ReadOnly} = True
    ?Rap:LstExecution_TIME{PROP:ReadOnly} = True
    ?Rap:LstResponse{PROP:ReadOnly} = True
    ?Rap:RapportSource:2{PROP:ReadOnly} = True
  END
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('UpdateRapporten',QuickWindow)              ! Restore window settings from non-volatile store
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
    Relate:Rapporten.Close
  END
  IF SELF.Opened
    INIMgr.Update('UpdateRapporten',QuickWindow)           ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.PrimeUpdate PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.PrimeUpdate()
    If returnValue = Level:Fatal  ! delete just occured
      ThisNetRefresh.Send('|Rapporten|') ! NetTalk (NetRefresh)
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
    ThisNetRefresh.Send('|Rapporten|') ! NetTalk (NetRefresh)
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
!!! Generated from procedure template - Window
!!! </summary>
WindowVerpakkingSamenvoegen PROCEDURE 

Loc:VerpakkingID     LONG                                  ! 
Loc:NewVerpakkingID  LONG                                  ! 
FDB3::View:FileDrop  VIEW(AVerpakking)
                       PROJECT(AVP:VerpakkingID)
                       PROJECT(AVP:VerpakkingOmschrijving)
                       PROJECT(AVP:Description)
                       PROJECT(AVP:InhoudKG)
                     END
Queue:FileDrop       QUEUE                            !
AVP:VerpakkingID       LIKE(AVP:VerpakkingID)         !List box control field - type derived from field
AVP:VerpakkingOmschrijving LIKE(AVP:VerpakkingOmschrijving) !List box control field - type derived from field
AVP:Description        LIKE(AVP:Description)          !List box control field - type derived from field
AVP:InhoudKG           LIKE(AVP:InhoudKG)             !List box control field - type derived from field
Loc:VerpakkingID       LIKE(Loc:VerpakkingID)         !Browse hot field - type derived from local data
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
LocEnableEnterByTab  BYTE(1)                               !Used by the ENTER Instead of Tab template
EnterByTabManager    EnterByTabClass
Window               WINDOW('Verpakking samenvoegen:'),AT(,,588,100),FONT('Microsoft Sans Serif',8),GRAY
                       PROMPT('Verpakking ID:'),AT(15,23),USE(?Ver:VerpakkingID:Prompt)
                       ENTRY(@n4),AT(65,22,27,10),USE(Ver:VerpakkingID),DISABLE
                       PROMPT('Verpakking Omschrijving:'),AT(99,23),USE(?Ver:VerpakkingOmschrijving:Prompt)
                       ENTRY(@s50),AT(184,23,148,10),USE(Ver:VerpakkingOmschrijving),DISABLE
                       PROMPT('Description'),AT(339,25),USE(?Ver:Description:Prompt)
                       ENTRY(@s50),AT(379,24,97,10),USE(Ver:Description),DISABLE
                       PROMPT('Inhoud KG:'),AT(483,24),USE(?Ver:InhoudKG:Prompt)
                       ENTRY(@n-10.3),AT(533,23,47,10),USE(Ver:InhoudKG),DECIMAL(1),DISABLE
                       STRING('Samenvoegen naar:'),AT(15,42),USE(?STRING1)
                       LIST,AT(89,42,491,12),USE(?NewVerpakkingID),DROP(25,500),FORMAT('60L(2)|M~Verpakking ID' & |
  '~L(0)@n4@127L(2)|M~Verpakking Omschrijving~L(0)@s50@119L(2)|M~Description~L(0)@s50@4' & |
  '4L(2)|M~Inhoud KG~D(12)@n-10.3@'),FROM(Queue:FileDrop)
                       BUTTON('SamenVoegen'),AT(518,71),USE(?Samenvoegen)
                       BUTTON('Cancel'),AT(464,71),USE(?Cancel)
                     END

    omit('***',WE::CantCloseNowSetHereDone=1)  !Getting Nested omit compile error, then uncheck the "Check for duplicate CantCloseNowSetHere variable declaration" in the WinEvent local template
WE::CantCloseNowSetHereDone equate(1)
WE::CantCloseNowSetHere     long
    !***
ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED
TakeEvent              PROCEDURE(),BYTE,PROC,DERIVED
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
FDB3                 CLASS(FileDropClass)                  ! File drop manager
Q                      &Queue:FileDrop                !Reference to display queue
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
  GlobalErrors.SetProcedureName('WindowVerpakkingSamenvoegen')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Ver:VerpakkingID:Prompt
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('Loc:VerpakkingID',Loc:VerpakkingID)                ! Added by: FileDrop(ABC)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  Loc:VerpakkingID=Ver:VerpakkingID
  Relate:AVerpakking.Open                                  ! File AVerpakking used by this procedure, so make sure it's RelationManager is open
  Relate:BulkOverboeking.Open                              ! File BulkOverboeking used by this procedure, so make sure it's RelationManager is open
  Relate:Partij.Open                                       ! File Partij used by this procedure, so make sure it's RelationManager is open
  Relate:Planning.SetOpenRelated()
  Relate:Planning.Open                                     ! File Planning used by this procedure, so make sure it's RelationManager is open
  Relate:Verpakking.Open                                   ! File Verpakking used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(Window)                                        ! Open window
  WinAlertMouseZoom()
  Do DefineListboxStyle
  INIMgr.Fetch('WindowVerpakkingSamenvoegen',Window)       ! Restore window settings from non-volatile store
  FDB3.Init(?NewVerpakkingID,Queue:FileDrop.ViewPosition,FDB3::View:FileDrop,Queue:FileDrop,Relate:AVerpakking,ThisWindow)
  FDB3.Q &= Queue:FileDrop
  FDB3.AddSortOrder(AVP:Verpakking_PK)
  FDB3.SetFilter('AVP:VerpakkingID<<>Loc:VerpakkingID')
  FDB3.AddField(AVP:VerpakkingID,FDB3.Q.AVP:VerpakkingID) !List box control field - type derived from field
  FDB3.AddField(AVP:VerpakkingOmschrijving,FDB3.Q.AVP:VerpakkingOmschrijving) !List box control field - type derived from field
  FDB3.AddField(AVP:Description,FDB3.Q.AVP:Description) !List box control field - type derived from field
  FDB3.AddField(AVP:InhoudKG,FDB3.Q.AVP:InhoudKG) !List box control field - type derived from field
  FDB3.AddField(Loc:VerpakkingID,FDB3.Q.Loc:VerpakkingID) !Browse hot field - type derived from local data
  FDB3.AddUpdateField(AVP:VerpakkingID,Loc:NewVerpakkingID)
  ThisWindow.AddItem(FDB3.WindowComponent)
  FDB3.DefaultFill = 0
  SELF.SetAlerts()
  EnterByTabManager.ExcludeControl(?Cancel)
  EnterByTabManager.Init(False)
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:AVerpakking.Close
    Relate:BulkOverboeking.Close
    Relate:Partij.Close
    Relate:Planning.Close
    Relate:Verpakking.Close
  END
  IF SELF.Opened
    INIMgr.Update('WindowVerpakkingSamenvoegen',Window)    ! Save window data to non-volatile store
  END
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
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?Samenvoegen
      ThisWindow.Update()
      if Loc:NewVerpakkingID=0
          Message('Naar verpakking invullen')
          CYCLE
      END
      
      !Message('Overboeken van '&Loc:VerpakkingID&' naar '&Loc:NewVerpakkingID)
      SetCursor(CURSOR:Wait)
      Verpakking{Prop:SQL}='UPDATE BulkOverboeking SET VerpakkingID='&Loc:NewVerpakkingID&' WHERE VerpakkingID='&Loc:VerpakkingID
      IF Access:Verpakking.Next()=Level:Benign
      END
      Verpakking{Prop:SQL}='UPDATE Planning SET VerpakkingID='&Loc:NewVerpakkingID&' WHERE VerpakkingID='&Loc:VerpakkingID
      IF Access:Verpakking.Next()=Level:Benign
      END
      Verpakking{Prop:SQL}='UPDATE Partij SET VerpakkingID='&Loc:NewVerpakkingID&' WHERE VerpakkingID='&Loc:VerpakkingID
      IF Access:Verpakking.Next()=Level:Benign
      END
      
      Clear(Ver:Record)
      Ver:VerpakkingID=Loc:VerpakkingID
      if Access:Verpakking.Fetch(Ver:Verpakking_PK)=Level:Benign
          Access:Verpakking.DeleteRecord(False)
      END
      
      SetCursor()
      
      Post(EVENT:CloseDown)
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

