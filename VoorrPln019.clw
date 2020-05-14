

   MEMBER('VoorrPln.clw')                                  ! This is a MEMBER module


   INCLUDE('ABDROPS.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('VOORRPLN019.INC'),ONCE        !Local module procedure declarations
                     END


!!! <summary>
!!! Generated from procedure template - Window
!!! Window
!!! </summary>
UpdateUitslagMutatieWegingQueue PROCEDURE 

LOC:CancelButton     BYTE                                  ! 
FDCB6::View:FileDropCombo VIEW(PalletSoort)
                       PROJECT(PalSrt:PalletOmschrijving)
                       PROJECT(PalSrt:Tarra)
                       PROJECT(PalSrt:PalletSoortID)
                     END
Queue:FileDropCombo:1 QUEUE                           !
PalSrt:PalletOmschrijving LIKE(PalSrt:PalletOmschrijving) !List box control field - type derived from field
PalSrt:Tarra           LIKE(PalSrt:Tarra)             !List box control field - type derived from field
PalSrt:PalletSoortID   LIKE(PalSrt:PalletSoortID)     !Primary key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
LocEnableEnterByTab  BYTE(1)                               !Used by the ENTER Instead of Tab template
EnterByTabManager    EnterByTabClass
QuickWindow          WINDOW('Weging'),AT(,,193,74),FONT('MS Sans Serif',8,,FONT:regular,CHARSET:DEFAULT),DOUBLE, |
  CENTER,GRAY,IMM,HLP('UpdateUitslagMutatieWegingQueue'),SYSTEM
                       PROMPT('Bruto-gewicht (KG):'),AT(6,7),USE(?WGQ:BrutoGewichtKG:Prompt)
                       ENTRY(@n14`2),AT(83,6,60,10),USE(WGQ:BrutoGewichtKG),RIGHT
                       PROMPT('Palletsoort:'),AT(6,22),USE(?PROMPT1)
                       COMBO(@s10),AT(83,22,97,10),USE(PalSrt:PalletOmschrijving),DROP(5),FORMAT('49L(2)|M~Pal' & |
  'letsoort~C(0)@s10@32R(2)|M~Tarra (KG)~C(0)@n8`2@'),FROM(Queue:FileDropCombo:1),IMM
                       BUTTON('&OK'),AT(79,54,49,14),USE(?Ok),LEFT,ICON('WAOK.ICO'),FLAT,MSG('Accept operation'), |
  TIP('Accept Operation')
                       BUTTON('&Cancel'),AT(132,54,49,14),USE(?Cancel),LEFT,ICON('WACANCEL.ICO'),FLAT,MSG('Cancel Operation'), |
  TIP('Cancel Operation')
                       STRING(@D6-B),AT(83,36),USE(WGQ:Datum)
                       STRING(@t1B),AT(131,36),USE(WGQ:Tijd)
                       PROMPT('Tijdstip weging:'),AT(6,36),USE(?PROMPT2)
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
Resizer              CLASS(WindowResizeClass)
Init                   PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)
                     END

FDCB6                CLASS(FileDropComboClass)             ! File drop combo manager
Q                      &Queue:FileDropCombo:1         !Reference to browse queue type
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
  GlobalErrors.SetProcedureName('UpdateUitslagMutatieWegingQueue')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?WGQ:BrutoGewichtKG:Prompt
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
  IF SELF.Request = SelectRecord
     SELF.AddItem(?Ok,RequestCancelled)                    ! Add the close control to the window manger
  ELSE
     SELF.AddItem(?Ok,RequestCompleted)                    ! Add the close control to the window manger
  END
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  Relate:PalletSoort.Open                                  ! File PalletSoort used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  CLEAR(PalSrt:Record)
  PalSrt:PalletSoortID = WGQ:PalletsoortID
  Access:PalletSoort.TryFetch(PalSrt:PK_PalletSoort)
  
  LOC:CancelButton = 0
  SELF.Open(QuickWindow)                                   ! Open window
  WinAlertMouseZoom()
  Do DefineListboxStyle
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('UpdateUitslagMutatieWegingQueue',QuickWindow) ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  FDCB6.Init(PalSrt:PalletOmschrijving,?PalSrt:PalletOmschrijving,Queue:FileDropCombo:1.ViewPosition,FDCB6::View:FileDropCombo,Queue:FileDropCombo:1,Relate:PalletSoort,ThisWindow,GlobalErrors,0,1,0)
  FDCB6.Q &= Queue:FileDropCombo:1
  FDCB6.AddSortOrder(PalSrt:FK_PalletSoort)
  FDCB6.AddField(PalSrt:PalletOmschrijving,FDCB6.Q.PalSrt:PalletOmschrijving) !List box control field - type derived from field
  FDCB6.AddField(PalSrt:Tarra,FDCB6.Q.PalSrt:Tarra) !List box control field - type derived from field
  FDCB6.AddField(PalSrt:PalletSoortID,FDCB6.Q.PalSrt:PalletSoortID) !Primary key field - type derived from field
  FDCB6.AddUpdateField(PalSrt:PalletSoortID,WGQ:PalletsoortID)
  FDCB6.AddUpdateField(PalSrt:PalletOmschrijving,WGQ:Palletsoort)
  ThisWindow.AddItem(FDCB6.WindowComponent)
  FDCB6.DefaultFill = 0
  SELF.SetAlerts()
  EnterByTabManager.ExcludeControl(?Cancel)
  EnterByTabManager.ExcludeControl(?Ok)
  EnterByTabManager.Init(False)
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:PalletSoort.Close
  END
  IF SELF.Opened
    INIMgr.Update('UpdateUitslagMutatieWegingQueue',QuickWindow) ! Save window data to non-volatile store
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
    CASE ACCEPTED()
    OF ?Cancel
      LOC:CancelButton = 1
    END
  IF LOC:CancelButton = 0
  	IF WGQ:PalletsoortID <> 0 THEN
  		CLEAR(PalSrt:Record)
  		PalSrt:PalletSoortID = WGQ:PalletsoortID
  		Access:PalletSoort.TryFetch(PalSrt:PK_PalletSoort)
  		
  		WGQ:NettoGewichtKG = WGQ:BrutoGewichtKG - PalSrt:Tarra
  		
  		IF WGQ:NettoGewichtKG <= 0 THEN RETURN RequestCancelled.
  	ELSE 
  		Return RequestCancelled
  	.
  .
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

