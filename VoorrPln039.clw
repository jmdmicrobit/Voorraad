

   MEMBER('VoorrPln.clw')                                  ! This is a MEMBER module


   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('VOORRPLN039.INC'),ONCE        !Local module procedure declarations
                     END


!!! <summary>
!!! Generated from procedure template - Window
!!! Form Mutatie
!!! </summary>
UpdateMutatieKwaliteit PROCEDURE 

udpt            UltimateDebugProcedureTracker
CurrentTab           STRING(80)                            ! 
ActionMessage        CSTRING(40)                           ! 
Loc:TemperaturenKopieren BYTE                              ! 
Loc:PlanningID       LONG                                  ! 
LocEnableEnterByTab  BYTE(1)                               !Used by the ENTER Instead of Tab template
EnterByTabManager    EnterByTabClass
History::Mut:Record  LIKE(Mut:RECORD),THREAD
QuickWindow          WINDOW('Form Mutatie'),AT(,,445,415),FONT('Microsoft Sans Serif',8,,FONT:regular,CHARSET:DEFAULT), |
  RESIZE,CENTER,GRAY,IMM,MDI,HLP('UpdateMutatieKlachten'),SYSTEM
                       SHEET,AT(4,4,432,392),USE(?CurrentTab)
                         TAB('&1) General'),USE(?Tab:1)
                           CHECK('Is transportmiddel schoon?'),AT(11,25,148,8),USE(Mut:UitslagQATransportmiddelSchoon), |
  VALUE('1','0')
                           CHECK('Is verpakking schoon en gesloten:'),AT(11,37,164,8),USE(Mut:UitslagQAVerpakkingSchoonGesloten), |
  VALUE('1','0')
                           CHECK('Identificatie merken aanwezig op verpakkingen?'),AT(11,49,166,8),USE(Mut:UitslagQAIdentificatieMerkenVerpakking), |
  VALUE('1','0')
                           CHECK('Is geur kleur producteigen?'),AT(11,60,164,8),USE(Mut:UitslagQAIsGeurKleurProductEigen)
                           CHECK('Geen glasbreuk?'),AT(11,72,112,8),USE(Mut:UitslagQAGeenGlasbreuk)
                           PROMPT('Gemeten temperaturen:'),AT(11,107),USE(?Mut:UitslagQATemperatuur2:Prompt),TRN
                           ENTRY(@s40),AT(187,81,164,10),USE(Mut:UitslagQAUitgevoerdDoor)
                           ENTRY(@s21),AT(187,106,88,10),USE(Mut:UitslagQATemperatuur2)
                           ENTRY(@s20),AT(187,121,84,10),USE(Mut:UitslagQATemperatuur3)
                           PROMPT('Gemeten temperaturen:'),AT(11,121),USE(?Mut:UitslagQATemperatuur3:Prompt),TRN
                           PROMPT('Temperatuur Vervoermiddel:'),AT(11,135),USE(?Mut:UitslagQATemperatuurVervoermiddel:Prompt), |
  TRN
                           ENTRY(@s20),AT(187,135,84,10),USE(Mut:UitslagQATemperatuurVervoermiddel)
                           PROMPT('Afwijkingen:'),AT(11,152),USE(?Mut:UitslagQAActieAfwijkingen:Prompt),TRN
                           TEXT,AT(187,152,231,37),USE(Mut:UitslagQAActieAfwijkingen,,?Mut:UitslagQAActieAfwijkingen:2), |
  VSCROLL
                           PROMPT('Uitgevoerd door:'),AT(11,81),USE(?Mut:UitslagQAUitgevoerdDoor:Prompt),TRN
                           PROMPT('CorrectieveMaatregel / Direct actie'),AT(11,267),USE(?Mut:CorrectieveMaatregel:Prompt), |
  TRN
                           TEXT,AT(187,194,231,37),USE(Mut:Oorzaak),VSCROLL
                           TEXT,AT(187,236,231,28),USE(Mut:TransportBedrijf),VSCROLL
                           TEXT,AT(187,268,231,37),USE(Mut:CorrectieveMaatregel,,?Mut:CorrectieveMaatregel:2)
                           PROMPT('Corrigerende Maatregel / voorkomen:'),AT(11,310),USE(?Mut:CorrigerendeMaatregel:Prompt)
                           TEXT,AT(187,311,231,37),USE(Mut:CorrigerendeMaatregel,,?Mut:CorrigerendeMaatregel:2)
                           PROMPT('Afgehandeld:'),AT(11,353),USE(?Mut:Afgehandeld:Prompt),TRN
                           TEXT,AT(187,353,231,37),USE(Mut:Afgehandeld,,?Mut:Afgehandeld:2)
                           PROMPT('Gemeten temperaturen:'),AT(11,94),USE(?Mut:UitslagQATemperatuur1:Prompt)
                           ENTRY(@s20),AT(187,93,88,10),USE(Mut:UitslagQATemperatuur1)
                           CHECK('Temperaturen Kopieren:'),AT(303,92),USE(Loc:TemperaturenKopieren)
                           PROMPT('Oorzaak:'),AT(11,193),USE(?Mut:Oorzaak:Prompt),TRN
                           PROMPT('Transport Bedrijf:'),AT(11,235),USE(?Mut:transportbedrijf:Prompt),TRN
                         END
                       END
                       BUTTON('&OK'),AT(331,399,49,14),USE(?OK),LEFT,ICON('WAOK.ICO'),DEFAULT,FLAT,MSG('Accept dat' & |
  'a and close the window'),TIP('Accept data and close the window')
                       BUTTON('&Cancel'),AT(386,399,49,14),USE(?Cancel),LEFT,ICON('WACANCEL.ICO'),FLAT,MSG('Cancel operation'), |
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
LocalClass          CLASS
RandomTemp              PROCEDURE(),String
                    END

  CODE
? DEBUGHOOK(Mutatie:Record)
? DEBUGHOOK(Planning:Record)
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
    ActionMessage = 'Bekijk Mutatie Kwaliteit'
  OF InsertRecord
    GlobalErrors.Throw(Msg:InsertIllegal)
    RETURN
  OF ChangeRecord
    ActionMessage = 'Wijzig Mutatie Kwaliteit'
  OF DeleteRecord
    GlobalErrors.Throw(Msg:DeleteIllegal)
    RETURN
  END
  QuickWindow{PROP:Text} = ActionMessage                   ! Display status message in title bar
  PARENT.Ask


ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
        udpt.Init(UD,'UpdateMutatieKwaliteit','VoorrPln039.clw','VoorrPln.DLL','06/28/2024 @ 01:22PM')    
             
  GlobalErrors.SetProcedureName('UpdateMutatieKwaliteit')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Mut:UitslagQATransportmiddelSchoon
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.HistoryKey = CtrlH
  SELF.AddHistoryFile(Mut:Record,History::Mut:Record)
  SELF.AddHistoryField(?Mut:UitslagQATransportmiddelSchoon,20)
  SELF.AddHistoryField(?Mut:UitslagQAVerpakkingSchoonGesloten,21)
  SELF.AddHistoryField(?Mut:UitslagQAIdentificatieMerkenVerpakking,22)
  SELF.AddHistoryField(?Mut:UitslagQAIsGeurKleurProductEigen,48)
  SELF.AddHistoryField(?Mut:UitslagQAGeenGlasbreuk,49)
  SELF.AddHistoryField(?Mut:UitslagQAUitgevoerdDoor,27)
  SELF.AddHistoryField(?Mut:UitslagQATemperatuur2,24)
  SELF.AddHistoryField(?Mut:UitslagQATemperatuur3,25)
  SELF.AddHistoryField(?Mut:UitslagQATemperatuurVervoermiddel,51)
  SELF.AddHistoryField(?Mut:UitslagQAActieAfwijkingen:2,26)
  SELF.AddHistoryField(?Mut:Oorzaak,60)
  SELF.AddHistoryField(?Mut:TransportBedrijf,61)
  SELF.AddHistoryField(?Mut:CorrectieveMaatregel:2,50)
  SELF.AddHistoryField(?Mut:CorrigerendeMaatregel:2,46)
  SELF.AddHistoryField(?Mut:Afgehandeld:2,47)
  SELF.AddHistoryField(?Mut:UitslagQATemperatuur1,23)
  SELF.AddUpdateFile(Access:Mutatie)
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
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
    SELF.InsertAction = Insert:None                        ! Inserts not allowed
    SELF.DeleteAction = Delete:None                        ! Deletes not allowed
    SELF.ChangeAction = Change:Caller                      ! Changes allowed
    SELF.CancelAction = Cancel:Cancel+Cancel:Query         ! Confirm cancel
    SELF.OkControl = ?OK
    IF SELF.PrimeUpdate() THEN RETURN Level:Notify.
  END
  SELF.Open(QuickWindow)                                   ! Open window
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
    ?Mut:UitslagQAUitgevoerdDoor{PROP:ReadOnly} = True
    ?Mut:UitslagQATemperatuur2{PROP:ReadOnly} = True
    ?Mut:UitslagQATemperatuur3{PROP:ReadOnly} = True
    ?Mut:UitslagQATemperatuurVervoermiddel{PROP:ReadOnly} = True
    ?Mut:UitslagQATemperatuur1{PROP:ReadOnly} = True
  END
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('UpdateMutatieKwaliteit',QuickWindow)       ! Restore window settings from non-volatile store
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
    Relate:Planning.Close
  END
  IF SELF.Opened
    INIMgr.Update('UpdateMutatieKwaliteit',QuickWindow)    ! Save window data to non-volatile store
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
    OF ?Loc:TemperaturenKopieren
      IF Loc:TemperaturenKopieren
          IF Mut:UitslagQATemperatuur1='' THEN Mut:UitslagQATemperatuur1=LocalClass.RandomTemp().
          IF Mut:UitslagQATemperatuur2='' THEN Mut:UitslagQATemperatuur2=LocalClass.RandomTemp().
          IF Mut:UitslagQATemperatuur3='' THEN Mut:UitslagQATemperatuur3=LocalClass.RandomTemp().
          IF Mut:UitslagQATemperatuurVervoermiddel=0 THEN Mut:UitslagQATemperatuurVervoermiddel=LocalClass.RandomTemp().
          Loc:PlanningID=Mut:PlanningID
          DISPLAY()
      END
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
    ! na het wegschrijven hetzelfde doen voor alle regels van deze Verkoop
  IF Loc:TemperaturenKopieren AND Loc:PlanningID<>0
      db.Debugout('Loc:TemperaturenKopieren '&Loc:PlanningID)
      db.Debugout('Loc:TemperaturenKopieren '&Loc:PlanningID)
      Clear(Pla:Record)
      Pla:PlanningID=Loc:PlanningID
      IF Access:Planning.Fetch(Pla:PK_Planning)=Level:Benign
          db.Debugout('Via Planning verkoop gevonden '&Pla:VerkoopID)
          VerkoopID#=Pla:VerkoopID
          Clear(Pla:Record)
          Pla:VerkoopID=VerkoopID#
          SET(Pla:Planning_FK02,Pla:Planning_FK02)
          LOOP UNTIL Access:Planning.Next()
              IF NOT Pla:VerkoopID=VerkoopID# THEN BREAK.
              db.Debugout('Loop door Planning Skip dadelijk  '&Pla:PlanningID&' '&Loc:PlanningID)
              IF NOT Pla:PlanningID=Loc:PlanningID 
                  db.Debugout('Loop door Planning GeSkipped ? '&Pla:PlanningID&' '&Loc:PlanningID)
                  Clear(Mut:Record)
                  Mut:PlanningID=Pla:PlanningID
                  Set(Mut:Mutatie_FK02,Mut:Mutatie_FK02)
                  Loop Until Access:Mutatie.Next()
                      IF NOT Mut:PlanningID=Pla:PlanningID THEN BREAK.
                      IF Mut:UitslagQATemperatuur1='' THEN Mut:UitslagQATemperatuur1=LocalClass.RandomTemp().
                      IF Mut:UitslagQATemperatuur2='' THEN Mut:UitslagQATemperatuur2=LocalClass.RandomTemp().
                      IF Mut:UitslagQATemperatuur3='' THEN Mut:UitslagQATemperatuur3=LocalClass.RandomTemp().
                      IF Mut:UitslagQATemperatuurVervoermiddel=0 THEN Mut:UitslagQATemperatuurVervoermiddel=LocalClass.RandomTemp().
                      Access:Mutatie.Update()
                      db.Debugout('Mutatie opgeslagen '&Mut:MutatieID&' '&Pla:PlanningID)
                  END
              END
          END
      ELSE
          db.Debugout('Via Planning verkoop niet gevonden '&Loc:PlanningID&' '&ERROR())
      END
  END
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
  If event() = event:VisibleOnDesktop !or event() = event:moved
    ds_VisibleOnDesktop()
  end
     IF KEYCODE()=CtrlShiftP AND EVENT() = Event:PreAlertKey
       CYCLE
     END
     IF KEYCODE()=CtrlShiftP  
        UD.ShowProcedureInfo('UpdateMutatieKwaliteit',UD.SetApplicationName('VoorrPln','DLL'),QuickWindow{PROP:Hlp},'01/31/2020 @ 09:47AM','06/28/2024 @ 01:22PM','10/11/2024 @ 01:55PM')  
    
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

LocalClass.RandomTemp       PROCEDURE
        ! tussen 18.0 2n 20.6

_RandomInt      LONG
CODE
    _RandomInt=RANDOM(-206,-180)
    
RETURN _RandomInt/10


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window

