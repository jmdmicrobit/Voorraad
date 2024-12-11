

   MEMBER('VoorrStm.clw')                                  ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABPOPUP.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('VOORRSTM021.INC'),ONCE        !Local module procedure declarations
                     END


!!! <summary>
!!! Generated from procedure template - Window
!!! Browse the PalletBladSjabloon file
!!! </summary>
BrowsePalletBladSjabloon PROCEDURE 

CurrentTab           STRING(80)                            ! 
LOC:DefaultPalletBladSjabloonID LONG                       ! 
BRW1::View:Browse    VIEW(PalletBladSjabloon)
                       PROJECT(PBS:PalletBladSjabloonNaam)
                       PROJECT(PBS:PalletBladSjabloonID)
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
PBS:PalletBladSjabloonNaam LIKE(PBS:PalletBladSjabloonNaam) !List box control field - type derived from field
PBS:PalletBladSjabloonNaam_NormalFG LONG              !Normal forground color
PBS:PalletBladSjabloonNaam_NormalBG LONG              !Normal background color
PBS:PalletBladSjabloonNaam_SelectedFG LONG            !Selected forground color
PBS:PalletBladSjabloonNaam_SelectedBG LONG            !Selected background color
PBS:PalletBladSjabloonID LIKE(PBS:PalletBladSjabloonID) !Browse hot field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
LocEnableEnterByTab  BYTE(1)                               !Used by the ENTER Instead of Tab template
EnterByTabManager    EnterByTabClass
QuickWindow          WINDOW('Overzicht Palletblad-sjablonen'),AT(,,358,198),FONT('Microsoft Sans Serif',8,,FONT:regular, |
  CHARSET:DEFAULT),RESIZE,CENTER,GRAY,IMM,MAX,MDI,HLP('BrowsePalletBladSjabloon'),SYSTEM
                       LIST,AT(7,24,343,129),USE(?Browse:1),HVSCROLL,FORMAT('80L(2)|M*~Omschrijving / Taal~@s50@'), |
  FROM(Queue:Browse:1),IMM,MSG('Browsing the PalletBladSjabloon file')
                       BUTTON('&Toevoegen'),AT(161,158,63,14),USE(?Insert:3),LEFT,ICON('WAINSERT.ICO'),FLAT,MSG('Insert a Record'), |
  TIP('Insert a Record')
                       BUTTON('&Wijzigen'),AT(227,158,58,14),USE(?Change:3),LEFT,ICON('WACHANGE.ICO'),DEFAULT,FLAT, |
  MSG('Change the Record'),TIP('Change the Record')
                       BUTTON('&Verwijderen'),AT(289,158,61,14),USE(?Delete:3),LEFT,ICON('WADELETE.ICO'),FLAT,MSG('Delete the Record'), |
  TIP('Delete the Record')
                       SHEET,AT(4,4,350,172),USE(?CurrentTab:2)
                         TAB('&Palletblad-sjablonen'),USE(?Tab:2)
                           BUTTON('Kies Standaard-vertaling'),AT(9,158),USE(?BUTTON1)
                         END
                       END
                       BUTTON('&Sluiten'),AT(302,180,49,14),USE(?Close),LEFT,ICON('WACLOSE.ICO'),FLAT,MSG('Close Window'), |
  TIP('Close Window')
                     END

ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
Run                    PROCEDURE(USHORT Number,BYTE Request),BYTE,PROC,DERIVED
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED
TakeEvent              PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
BRW1                 CLASS(BrowseClass)                    ! Browse using ?Browse:1
Q                      &Queue:Browse:1                !Reference to browse queue
Fetch                  PROCEDURE(BYTE Direction),DERIVED
Init                   PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)
SetQueueRecord         PROCEDURE(),DERIVED
                     END

BRW1::Sort0:Locator  StepLocatorClass                      ! Default Locator
Resizer              CLASS(WindowResizeClass)
Init                   PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)
                     END


  CODE
? DEBUGHOOK(PalletBladSjabloon:Record)
  GlobalResponse = ThisWindow.Run()                        ! Opens the window and starts an Accept Loop

!---------------------------------------------------------------------------
DefineListboxStyle ROUTINE
!|
!| This routine create all the styles to be shared in this window
!| It`s called after the window open
!|
!---------------------------------------------------------------------------
RefreshDefaultPalletBladSjabloon    ROUTINE
    LOC:DefaultPalletBladSjabloonID = GETINI('Palletblad','StandaardVertaling',,'.\Voorraad.ini')
    BRW1.ResetQueue(Reset:Queue)

ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('BrowsePalletBladSjabloon')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Browse:1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
  IF SELF.Request = SelectRecord
     SELF.AddItem(?Close,RequestCancelled)                 ! Add the close control to the window manger
  ELSE
     SELF.AddItem(?Close,RequestCompleted)                 ! Add the close control to the window manger
  END
  Relate:PalletBladSjabloon.Open                           ! File PalletBladSjabloon used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:PalletBladSjabloon,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1.ActiveInvisible = 1
  BRW1.RetainRow = 0
  BRW1.AddSortOrder(,PBS:PK_PalletBladSjabloon)            ! Add the sort order for PBS:PK_PalletBladSjabloon for sort order 1
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort0:Locator.Init(,PBS:PalletBladSjabloonID,,BRW1) ! Initialize the browse locator using  using key: PBS:PK_PalletBladSjabloon , PBS:PalletBladSjabloonID
  BRW1.AddField(PBS:PalletBladSjabloonNaam,BRW1.Q.PBS:PalletBladSjabloonNaam) ! Field PBS:PalletBladSjabloonNaam is a hot field or requires assignment from browse
  BRW1.AddField(PBS:PalletBladSjabloonID,BRW1.Q.PBS:PalletBladSjabloonID) ! Field PBS:PalletBladSjabloonID is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('BrowsePalletBladSjabloon',QuickWindow)     ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  BRW1.AskProcedure = 1                                    ! Will call: UpdatePalletBladSjabloon
  SELF.SetAlerts()
  DO RefreshDefaultPalletBladSjabloon
  EnterByTabManager.Init(False)
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:PalletBladSjabloon.Close
  END
  IF SELF.Opened
    INIMgr.Update('BrowsePalletBladSjabloon',QuickWindow)  ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.Run PROCEDURE(USHORT Number,BYTE Request)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Run(Number,Request)
  IF SELF.Request = ViewRecord
    ReturnValue = RequestCancelled                         ! Always return RequestCancelled if the form was opened in ViewRecord mode
  ELSE
    GlobalRequest = Request
    UpdatePalletBladSjabloon
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
    OF ?BUTTON1
      ThisWindow.Update()
      GET(BRW1.Q, CHOICE(?Browse:1))
      IF NOT(ERROR()) THEN
          PUTINI('Palletblad','StandaardVertaling',BRW1.Q.PBS:PalletBladSjabloonID,PQ:IniFile)
          
          DO RefreshDefaultPalletBladSjabloon
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


BRW1.Fetch PROCEDURE(BYTE Direction)

  CODE
  PARENT.Fetch(Direction)
  ! Kleuren van de cellen bij partijen ouder dan XX dagen
  LOOP GreenBarIndex#=1 TO RECORDS(SELF.Q)
      GET(SELF.Q, GreenBarIndex#)
      IF NOT(ERROR()) THEN
          IF SELF.Q.PBS:PalletBladSjabloonID = LOC:DefaultPalletBladSjabloonID THEN
              SELF.Q.PBS:PalletBladSjabloonNaam_NormalFG = Color:White
              SELF.Q.PBS:PalletBladSjabloonNaam_NormalBG = Color:Blue
              SELF.Q.PBS:PalletBladSjabloonNaam_SelectedFG = Color:White
              SELF.Q.PBS:PalletBladSjabloonNaam_SelectedBG = Color:Blue
              PUT(SELF.Q)
          END
      END        
  END


BRW1.Init PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)

  CODE
  PARENT.Init(ListBox,Posit,V,Q,RM,WM)
  IF WM.Request <> ViewRecord                              ! If called for anything other than ViewMode, make the insert, change & delete controls available
    SELF.InsertControl=?Insert:3
    SELF.ChangeControl=?Change:3
    SELF.DeleteControl=?Delete:3
  END


BRW1.SetQueueRecord PROCEDURE

  CODE
  PARENT.SetQueueRecord
  
  SELF.Q.PBS:PalletBladSjabloonNaam_NormalFG = -1          ! Set color values for PBS:PalletBladSjabloonNaam
  SELF.Q.PBS:PalletBladSjabloonNaam_NormalBG = -1
  SELF.Q.PBS:PalletBladSjabloonNaam_SelectedFG = -1
  SELF.Q.PBS:PalletBladSjabloonNaam_SelectedBG = -1


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window

