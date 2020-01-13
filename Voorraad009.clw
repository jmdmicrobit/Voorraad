

   MEMBER('Voorraad.clw')                                  ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABPOPUP.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('VOORRAAD009.INC'),ONCE        !Local module procedure declarations
                     END


!!! <summary>
!!! Generated from procedure template - Window
!!! Browse the Partij file
!!! </summary>
BrowsePartijZonderInslag PROCEDURE 

CurrentTab           STRING(80)                            ! 
BRW1::View:Browse    VIEW(Partij)
                       PROJECT(Par:PartijID)
                       PROJECT(Par:ArtikelID)
                       PROJECT(Par:AanmaakDatum_DATE)
                       PROJECT(Par:AanmaakDatum_TIME)
                       PROJECT(Par:KG)
                       PROJECT(Par:Pallets)
                       PROJECT(Par:VerpakkingID)
                       PROJECT(Par:Leverancier)
                       PROJECT(Par:Verwerkt)
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
Par:PartijID           LIKE(Par:PartijID)             !List box control field - type derived from field
Par:ArtikelID          LIKE(Par:ArtikelID)            !List box control field - type derived from field
Par:AanmaakDatum_DATE  LIKE(Par:AanmaakDatum_DATE)    !List box control field - type derived from field
Par:AanmaakDatum_TIME  LIKE(Par:AanmaakDatum_TIME)    !List box control field - type derived from field
Par:KG                 LIKE(Par:KG)                   !List box control field - type derived from field
Par:Pallets            LIKE(Par:Pallets)              !List box control field - type derived from field
Par:VerpakkingID       LIKE(Par:VerpakkingID)         !List box control field - type derived from field
Par:Leverancier        LIKE(Par:Leverancier)          !List box control field - type derived from field
Par:Verwerkt           LIKE(Par:Verwerkt)             !List box control field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
LocEnableEnterByTab  BYTE(1)                               !Used by the ENTER Instead of Tab template
EnterByTabManager    EnterByTabClass
NetLocalRefreshDate     Long     ! NetTalk (NetRefresh)
NetLocalRefreshTime     Long
NetLocalDependancies    String('|Partij|')
QuickWindow          WINDOW('Browse the Partij file'),AT(,,358,198),FONT('MS Sans Serif',8,,FONT:regular,CHARSET:DEFAULT), |
  RESIZE,CENTER,GRAY,IMM,MDI,HLP('BrowsePartijZonderInslag'),SYSTEM
                       LIST,AT(8,30,342,146),USE(?Browse:1),HVSCROLL,FORMAT('64R(2)|M~Partij ID~C(0)@n-14@80L(' & |
  '2)|M~Artikel ID~@s30@80R(2)|M~Aanmaak Datum DATE~C(0)@d17@80R(2)|M~Aanmaak Datum TIM' & |
  'E~C(0)@t7@80D(42)|M~KG~C(0)@n-10`2@64R(2)|M~Pallets~C(0)@n-14@64R(2)|M~Verpakking ID' & |
  '~C(0)@n-14@64R(2)|M~Leverancier~C(0)@n-14@36R(2)|M~Verwerkt~C(0)@n3@'),FROM(Queue:Browse:1), |
  IMM,MSG('Browsing the Partij file')
                       SHEET,AT(4,4,350,172),USE(?CurrentTab)
                         TAB('&1) Partij_PK'),USE(?Tab:2)
                         END
                       END
                       BUTTON('&Close'),AT(252,180,49,14),USE(?Close),LEFT,ICON('WACLOSE.ICO'),FLAT,MSG('Close Window'), |
  TIP('Close Window')
                       BUTTON('&Help'),AT(305,180,49,14),USE(?Help),LEFT,ICON('WAHELP.ICO'),FLAT,MSG('See Help Window'), |
  STD(STD:Help),TIP('See Help Window')
                     END

    omit('***',WE::CantCloseNowSetHereDone=1)  !Getting Nested omit compile error, then uncheck the "Check for duplicate CantCloseNowSetHere variable declaration" in the WinEvent local template
WE::CantCloseNowSetHereDone equate(1)
WE::CantCloseNowSetHere     long
    !***
ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
Reset                  PROCEDURE(BYTE Force=0),DERIVED
TakeEvent              PROCEDURE(),BYTE,PROC,DERIVED
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
BRW1                 CLASS(BrowseClass)                    ! Browse using ?Browse:1
Q                      &Queue:Browse:1                !Reference to browse queue
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
  GlobalErrors.SetProcedureName('BrowsePartijZonderInslag')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Browse:1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  IF SELF.Request = SelectRecord
     SELF.AddItem(?Close,RequestCancelled)                 ! Add the close control to the window manger
  ELSE
     SELF.AddItem(?Close,RequestCompleted)                 ! Add the close control to the window manger
  END
  Relate:Mutatie.Open                                      ! File Mutatie used by this procedure, so make sure it's RelationManager is open
  Relate:Partij.Open                                       ! File Partij used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:Partij,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  WinAlertMouseZoom()
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1.FileLoaded = 1                                      ! This is a 'file loaded' browse
  BRW1.ActiveInvisible = 1
  BRW1.RetainRow = 0
  BRW1.AddSortOrder(,Par:Partij_PK)                        ! Add the sort order for Par:Partij_PK for sort order 1
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort0:Locator.Init(,Par:PartijID,,BRW1)            ! Initialize the browse locator using  using key: Par:Partij_PK , Par:PartijID
  BRW1.AddField(Par:PartijID,BRW1.Q.Par:PartijID)          ! Field Par:PartijID is a hot field or requires assignment from browse
  BRW1.AddField(Par:ArtikelID,BRW1.Q.Par:ArtikelID)        ! Field Par:ArtikelID is a hot field or requires assignment from browse
  BRW1.AddField(Par:AanmaakDatum_DATE,BRW1.Q.Par:AanmaakDatum_DATE) ! Field Par:AanmaakDatum_DATE is a hot field or requires assignment from browse
  BRW1.AddField(Par:AanmaakDatum_TIME,BRW1.Q.Par:AanmaakDatum_TIME) ! Field Par:AanmaakDatum_TIME is a hot field or requires assignment from browse
  BRW1.AddField(Par:KG,BRW1.Q.Par:KG)                      ! Field Par:KG is a hot field or requires assignment from browse
  BRW1.AddField(Par:Pallets,BRW1.Q.Par:Pallets)            ! Field Par:Pallets is a hot field or requires assignment from browse
  BRW1.AddField(Par:VerpakkingID,BRW1.Q.Par:VerpakkingID)  ! Field Par:VerpakkingID is a hot field or requires assignment from browse
  BRW1.AddField(Par:Leverancier,BRW1.Q.Par:Leverancier)    ! Field Par:Leverancier is a hot field or requires assignment from browse
  BRW1.AddField(Par:Verwerkt,BRW1.Q.Par:Verwerkt)          ! Field Par:Verwerkt is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('BrowsePartijZonderInslag',QuickWindow)     ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
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
    Relate:Partij.Close
  END
  IF SELF.Opened
    INIMgr.Update('BrowsePartijZonderInslag',QuickWindow)  ! Save window data to non-volatile store
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


BRW1.ValidateRecord PROCEDURE

ReturnValue          BYTE,AUTO

BRW1::RecordStatus   BYTE,AUTO
  CODE
  found# = 0
  CLEAR(Mut:Record)
  Mut:PartijID=Par:PartijID
  SET(Mut:Mutatie_FK01, Mut:Mutatie_FK01)
  LOOP UNTIL Access:Mutatie.Next()
  	IF Mut:PartijID <> Par:PartijID THEN BREAK.
  	
  	IF CLIP(Mut:SoortMutatie) <> 'IN' THEN
  		CYCLE
  	ELSE
  		found# = 1
  		BREAK
  	.
  .
  
  
  IF found# = 1 THEN RETURN Record:Filtered.
  
  ReturnValue = PARENT.ValidateRecord()
  BRW1::RecordStatus=ReturnValue
  RETURN ReturnValue


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window

