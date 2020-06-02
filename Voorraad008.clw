

   MEMBER('Voorraad.clw')                                  ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABPOPUP.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('VOORRAAD008.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('VOORRAAD007.INC'),ONCE        !Req'd for module callout resolution
                     END


!!! <summary>
!!! Generated from procedure template - Window
!!! Browse the Mutatie file
!!! </summary>
BrowseRareMutaties PROCEDURE 

udpt            UltimateDebugProcedureTracker
CurrentTab           STRING(80)                            ! 
BRW1::View:Browse    VIEW(Mutatie)
                       PROJECT(Mut:MutatieID)
                       PROJECT(Mut:DatumTijd_DATE)
                       PROJECT(Mut:DatumTijd_TIME)
                       PROJECT(Mut:PartijID)
                       PROJECT(Mut:InslagKG)
                       PROJECT(Mut:InslagPallet)
                       PROJECT(Mut:UitslagKG)
                       PROJECT(Mut:UitslagPallet)
                       PROJECT(Mut:CelID)
                       JOIN(CEL:CEL_PK,Mut:CelID)
                         PROJECT(CEL:CelOms)
                       END
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
Mut:MutatieID          LIKE(Mut:MutatieID)            !List box control field - type derived from field
Mut:DatumTijd_DATE     LIKE(Mut:DatumTijd_DATE)       !List box control field - type derived from field
Mut:DatumTijd_TIME     LIKE(Mut:DatumTijd_TIME)       !List box control field - type derived from field
Mut:PartijID           LIKE(Mut:PartijID)             !List box control field - type derived from field
CEL:CelOms             LIKE(CEL:CelOms)               !List box control field - type derived from field
Mut:InslagKG           LIKE(Mut:InslagKG)             !List box control field - type derived from field
Mut:InslagPallet       LIKE(Mut:InslagPallet)         !List box control field - type derived from field
Mut:UitslagKG          LIKE(Mut:UitslagKG)            !List box control field - type derived from field
Mut:UitslagPallet      LIKE(Mut:UitslagPallet)        !List box control field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
LocEnableEnterByTab  BYTE(1)                               !Used by the ENTER Instead of Tab template
EnterByTabManager    EnterByTabClass
NetLocalRefreshDate     Long     ! NetTalk (NetRefresh)
NetLocalRefreshTime     Long
NetLocalDependancies    String('|Mutatie|Cel|')
QuickWindow          WINDOW('Overzicht rare mutaties'),AT(,,358,188),FONT('MS Sans Serif',8,,FONT:regular,CHARSET:DEFAULT), |
  RESIZE,CENTER,GRAY,IMM,MAX,MDI,HLP('BrowseRareMutaties'),SYSTEM
                       LIST,AT(8,10,342,124),USE(?Browse:1),HVSCROLL,FORMAT('48R(2)|M~Mutatie ID~C(0)@n_10@[48' & |
  'R(2)|M@d17@80R(2)|M@t7@](80)|~Tijdstip~44R(2)|M~Partij ID~C(0)@n_10@86L(2)|M~Cel~C(0' & |
  ')@s50@[55D(28)|M~KG~C(0)@n-15`2@64R(2)|M~Pallets~C(0)@n-14.@](105)|~Inslag~[53D(26)|' & |
  'M~KG~C(0)@n-15`2@64R(2)|M~Pallets~C(0)@n-14.@]|~Uitslag~'),FROM(Queue:Browse:1),IMM,MSG('Browsing t' & |
  'he Mutatie file')
                       BUTTON('&Change'),AT(301,145,49,14),USE(?Change),LEFT,ICON('WACHANGE.ICO'),FLAT,MSG('Change the Record'), |
  TIP('Change the Record')
                       BUTTON('&Close'),AT(301,166,49,14),USE(?Close),LEFT,ICON('WACLOSE.ICO'),FLAT,MSG('Close Window'), |
  TIP('Close Window')
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
ValidateRecord         PROCEDURE(),BYTE,DERIVED
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
        udpt.Init(UD,'BrowseRareMutaties','Voorraad008.clw','Voorraad.EXE','07/03/2014 @ 11:14AM')    
             
  GlobalErrors.SetProcedureName('BrowseRareMutaties')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Browse:1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('Mut:MutatieID',Mut:MutatieID)                      ! Added by: BrowseBox(ABC)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
  IF SELF.Request = SelectRecord
     SELF.AddItem(?Close,RequestCancelled)                 ! Add the close control to the window manger
  ELSE
     SELF.AddItem(?Close,RequestCompleted)                 ! Add the close control to the window manger
  END
  Relate:Mutatie.Open                                      ! File Mutatie used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:Mutatie,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  WinAlertMouseZoom()
  Do DefineListboxStyle
  QuickWindow{Prop:Alrt,255} = CtrlShiftP
  BRW1.Q &= Queue:Browse:1
  BRW1.FileLoaded = 1                                      ! This is a 'file loaded' browse
  BRW1.ActiveInvisible = 1
  BRW1.RetainRow = 0
  BRW1.AddSortOrder(,Mut:Mutatie_PK)                       ! Add the sort order for Mut:Mutatie_PK for sort order 1
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort0:Locator.Init(,Mut:MutatieID,1,BRW1)          ! Initialize the browse locator using  using key: Mut:Mutatie_PK , Mut:MutatieID
  BRW1.AddField(Mut:MutatieID,BRW1.Q.Mut:MutatieID)        ! Field Mut:MutatieID is a hot field or requires assignment from browse
  BRW1.AddField(Mut:DatumTijd_DATE,BRW1.Q.Mut:DatumTijd_DATE) ! Field Mut:DatumTijd_DATE is a hot field or requires assignment from browse
  BRW1.AddField(Mut:DatumTijd_TIME,BRW1.Q.Mut:DatumTijd_TIME) ! Field Mut:DatumTijd_TIME is a hot field or requires assignment from browse
  BRW1.AddField(Mut:PartijID,BRW1.Q.Mut:PartijID)          ! Field Mut:PartijID is a hot field or requires assignment from browse
  BRW1.AddField(CEL:CelOms,BRW1.Q.CEL:CelOms)              ! Field CEL:CelOms is a hot field or requires assignment from browse
  BRW1.AddField(Mut:InslagKG,BRW1.Q.Mut:InslagKG)          ! Field Mut:InslagKG is a hot field or requires assignment from browse
  BRW1.AddField(Mut:InslagPallet,BRW1.Q.Mut:InslagPallet)  ! Field Mut:InslagPallet is a hot field or requires assignment from browse
  BRW1.AddField(Mut:UitslagKG,BRW1.Q.Mut:UitslagKG)        ! Field Mut:UitslagKG is a hot field or requires assignment from browse
  BRW1.AddField(Mut:UitslagPallet,BRW1.Q.Mut:UitslagPallet) ! Field Mut:UitslagPallet is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('BrowseRareMutaties',QuickWindow)           ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  BRW1.AskProcedure = 1                                    ! Will call: UpdateRareMutatie
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
    Relate:Mutatie.Close
  END
  IF SELF.Opened
    INIMgr.Update('BrowseRareMutaties',QuickWindow)        ! Save window data to non-volatile store
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
    UpdateRareMutatie
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
     IF KEYCODE()=CtrlShiftP AND EVENT() = Event:PreAlertKey
       CYCLE
     END
     IF KEYCODE()=CtrlShiftP  
        UD.ShowProcedureInfo('BrowseRareMutaties',UD.SetApplicationName('Voorraad','EXE'),QuickWindow{PROP:Hlp},'07/06/2010 @ 11:11AM','07/03/2014 @ 11:14AM','05/26/2020 @ 12:10PM')  
    
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


BRW1.Init PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)

  CODE
  PARENT.Init(ListBox,Posit,V,Q,RM,WM)
  IF WM.Request <> ViewRecord                              ! If called for anything other than ViewMode, make the insert, change & delete controls available
    SELF.ChangeControl=?Change
  END


BRW1.ValidateRecord PROCEDURE

ReturnValue          BYTE,AUTO

BRW1::RecordStatus   BYTE,AUTO
  CODE
  Access:Mutatie.TryFetch(Mut:Mutatie_PK)
  
  IF Mut:SoortMutatie = 'IN' OR Mut:SoortMutatie = 'EIN' OR Mut:SoortMutatie = 'OIN'
  	IF Mut:UitslagKG = 0 OR Mut:UitslagPallet = 0 THEN
  		RETURN Record:Filtered
  	.
  .
  
  IF Mut:SoortMutatie = 'UIT' OR Mut:SoortMutatie = 'EUIT' OR Mut:SoortMutatie = 'OUIT'
  	IF Mut:InslagKG = 0 OR Mut:InslagPallet = 0 THEN
  		RETURN Record:Filtered
  	.
  .
  ReturnValue = PARENT.ValidateRecord()
  BRW1::RecordStatus=ReturnValue
  RETURN ReturnValue


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window

