

   MEMBER('VoorrVrd.clw')                                  ! This is a MEMBER module


   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('VOORRVRD006.INC'),ONCE        !Local module procedure declarations
                     END


!!! <summary>
!!! Generated from procedure template - Window
!!! Form Mutatie
!!! </summary>
UpdateVoorraadVerloop PROCEDURE 

CurrentTab           STRING(80)                            ! 
ActionMessage        CSTRING(40)                           ! 
LocEnableEnterByTab  BYTE(1)                               !Used by the ENTER Instead of Tab template
EnterByTabManager    EnterByTabClass
History::Mut:Record  LIKE(Mut:RECORD),THREAD
QuickWindow          WINDOW('Form Mutatie'),AT(,,256,182),FONT('MS Sans Serif',8,,FONT:regular,CHARSET:DEFAULT), |
  RESIZE,CENTER,GRAY,IMM,MDI,HLP('UpdateVoorraadVerloop'),SYSTEM
                       SHEET,AT(4,4,248,156),USE(?CurrentTab)
                         TAB('&1) General'),USE(?Tab:1)
                           PROMPT('Mutatie ID:'),AT(8,20),USE(?Mut:MutatieID:Prompt),TRN
                           ENTRY(@n-14),AT(88,20,64,10),USE(Mut:MutatieID)
                           PROMPT('Datum Tijd DATE:'),AT(8,34),USE(?Mut:DatumTijd_DATE:Prompt),TRN
                           ENTRY(@d17),AT(88,34,104,10),USE(Mut:DatumTijd_DATE)
                           PROMPT('Datum Tijd TIME:'),AT(8,48),USE(?Mut:DatumTijd_TIME:Prompt),TRN
                           ENTRY(@t7),AT(88,48,104,10),USE(Mut:DatumTijd_TIME)
                           PROMPT('Partij ID:'),AT(8,62),USE(?Mut:PartijID:Prompt),TRN
                           ENTRY(@n-14),AT(88,62,64,10),USE(Mut:PartijID)
                           PROMPT('Cel ID:'),AT(8,76),USE(?Mut:CelID:Prompt),RIGHT,TRN
                           ENTRY(@n-14),AT(88,76,64,10),USE(Mut:CelID),RIGHT(1)
                           PROMPT('Inslag KG:'),AT(8,90),USE(?Mut:InslagKG:Prompt),TRN
                           ENTRY(@n-10`2),AT(88,90,104,10),USE(Mut:InslagKG),DECIMAL(12)
                           PROMPT('Inslag Pallet:'),AT(8,104),USE(?Mut:InslagPallet:Prompt),TRN
                           ENTRY(@n-14),AT(88,104,64,10),USE(Mut:InslagPallet)
                           PROMPT('Uitslag KG:'),AT(8,118),USE(?Mut:UitslagKG:Prompt),TRN
                           ENTRY(@n-10`2),AT(88,118,104,10),USE(Mut:UitslagKG),DECIMAL(12)
                           PROMPT('Uitslag Pallet:'),AT(8,132),USE(?Mut:UitslagPallet:Prompt),TRN
                           ENTRY(@n-14),AT(88,132,64,10),USE(Mut:UitslagPallet)
                         END
                         TAB('&2) General (cont.)'),USE(?Tab:2)
                           PROMPT('Uitslag ID:'),AT(8,34),USE(?Mut:UitslagID:Prompt),RIGHT,TRN
                           PROMPT('Soort Mutatie:'),AT(8,48),USE(?Mut:SoortMutatie:Prompt),TRN
                           ENTRY(@s4),AT(88,48,40,10),USE(Mut:SoortMutatie)
                           PROMPT('Naar CELID:'),AT(8,90),USE(?Mut:NaarCELID:Prompt),RIGHT,TRN
                           ENTRY(@n-14),AT(88,90,64,10),USE(Mut:NaarCELID),RIGHT(1)
                           PROMPT('Reden Afboeking:'),AT(8,104),USE(?Mut:RedenAfboeking:Prompt),TRN
                           ENTRY(@s39),AT(88,104,160,10),USE(Mut:RedenAfboeking)
                           PROMPT('Artikel ID:'),AT(8,118),USE(?Mut:ArtikelID:Prompt),CENTER,TRN
                           ENTRY(@s30),AT(88,118,124,10),USE(Mut:ArtikelID),DECIMAL
                           PROMPT('Planning ID:'),AT(8,132),USE(?Mut:PlanningID:Prompt),CENTER,TRN
                           ENTRY(@n-14),AT(88,132,64,10),USE(Mut:PlanningID),DECIMAL,REQ
                         END
                       END
                       BUTTON('&OK'),AT(97,164,49,14),USE(?OK),LEFT,ICON('WAOK.ICO'),DEFAULT,FLAT,MSG('Accept dat' & |
  'a and close the window'),TIP('Accept data and close the window')
                       BUTTON('&Cancel'),AT(150,164,49,14),USE(?Cancel),LEFT,ICON('WACANCEL.ICO'),FLAT,MSG('Cancel operation'), |
  TIP('Cancel operation')
                       BUTTON('&Help'),AT(203,164,49,14),USE(?Help),LEFT,ICON('WAHELP.ICO'),FLAT,MSG('See Help Window'), |
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
  GlobalErrors.SetProcedureName('UpdateVoorraadVerloop')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Mut:MutatieID:Prompt
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.HistoryKey = CtrlH
  SELF.AddHistoryFile(Mut:Record,History::Mut:Record)
  SELF.AddHistoryField(?Mut:MutatieID,1)
  SELF.AddHistoryField(?Mut:DatumTijd_DATE,4)
  SELF.AddHistoryField(?Mut:DatumTijd_TIME,5)
  SELF.AddHistoryField(?Mut:PartijID,6)
  SELF.AddHistoryField(?Mut:CelID,7)
  SELF.AddHistoryField(?Mut:InslagKG,8)
  SELF.AddHistoryField(?Mut:InslagPallet,9)
  SELF.AddHistoryField(?Mut:UitslagKG,10)
  SELF.AddHistoryField(?Mut:UitslagPallet,11)
  SELF.AddHistoryField(?Mut:SoortMutatie,13)
  SELF.AddHistoryField(?Mut:NaarCELID,14)
  SELF.AddHistoryField(?Mut:RedenAfboeking,15)
  SELF.AddHistoryField(?Mut:ArtikelID,16)
  SELF.AddHistoryField(?Mut:PlanningID,17)
  SELF.AddUpdateFile(Access:Mutatie)
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
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
    ?Mut:MutatieID{PROP:ReadOnly} = True
    ?Mut:DatumTijd_DATE{PROP:ReadOnly} = True
    ?Mut:DatumTijd_TIME{PROP:ReadOnly} = True
    ?Mut:PartijID{PROP:ReadOnly} = True
    ?Mut:CelID{PROP:ReadOnly} = True
    ?Mut:InslagKG{PROP:ReadOnly} = True
    ?Mut:InslagPallet{PROP:ReadOnly} = True
    ?Mut:UitslagKG{PROP:ReadOnly} = True
    ?Mut:UitslagPallet{PROP:ReadOnly} = True
    ?Mut:SoortMutatie{PROP:ReadOnly} = True
    ?Mut:NaarCELID{PROP:ReadOnly} = True
    ?Mut:RedenAfboeking{PROP:ReadOnly} = True
    ?Mut:ArtikelID{PROP:ReadOnly} = True
    ?Mut:PlanningID{PROP:ReadOnly} = True
  END
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('UpdateVoorraadVerloop',QuickWindow)        ! Restore window settings from non-volatile store
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
    Relate:Mutatie.Close
  END
  IF SELF.Opened
    INIMgr.Update('UpdateVoorraadVerloop',QuickWindow)     ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.PrimeUpdate PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.PrimeUpdate()
    If returnValue = Level:Fatal  ! delete just occured
      ThisNetRefresh.Send('|Mutatie|') ! NetTalk (NetRefresh)
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
    ThisNetRefresh.Send('|Mutatie|') ! NetTalk (NetRefresh)
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

