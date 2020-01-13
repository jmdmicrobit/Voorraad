

   MEMBER('VoorrVrd.clw')                                  ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABPOPUP.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('VOORRVRD014.INC'),ONCE        !Local module procedure declarations
                     END


!!! <summary>
!!! Generated from procedure template - Window
!!! Browse the ViewPalletTegoeden file
!!! </summary>
BrowsePalletTegoeden PROCEDURE 

CurrentTab           STRING(80)                            ! 
LOC:PalletSoortID    LONG                                  ! 
LOC:PalletNaam       STRING(20)                            ! 
LOC:Totaal           LONG                                  ! 
LOC:AlleenTegoedenTonen BYTE                               ! 
LOC:Dummy            STRING(1)                             ! 
BRW1::View:Browse    VIEW(ViewPalletTegoeden)
                       PROJECT(PTG:RelatieID)
                       PROJECT(PTG:Transporteur)
                       PROJECT(PTG:Inkomend)
                       PROJECT(PTG:Uitgaand)
                       PROJECT(PTG:PalletSoortID)
                       JOIN(Rel:Relatie_PK,PTG:RelatieID)
                         PROJECT(Rel:FirmaNaam)
                         PROJECT(Rel:RelatieID)
                       END
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
PTG:RelatieID          LIKE(PTG:RelatieID)            !List box control field - type derived from field
Rel:FirmaNaam          LIKE(Rel:FirmaNaam)            !List box control field - type derived from field
PTG:Transporteur       LIKE(PTG:Transporteur)         !List box control field - type derived from field
PTG:Transporteur_Icon  LONG                           !Entry's icon ID
LOC:PalletNaam         LIKE(LOC:PalletNaam)           !List box control field - type derived from local data
PTG:Inkomend           LIKE(PTG:Inkomend)             !List box control field - type derived from field
PTG:Uitgaand           LIKE(PTG:Uitgaand)             !List box control field - type derived from field
LOC:Totaal             LIKE(LOC:Totaal)               !List box control field - type derived from local data
LOC:Dummy              LIKE(LOC:Dummy)                !List box control field - type derived from local data
PTG:PalletSoortID      LIKE(PTG:PalletSoortID)        !Browse hot field - type derived from field
Rel:RelatieID          LIKE(Rel:RelatieID)            !Related join file key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
LocEnableEnterByTab  BYTE(1)                               !Used by the ENTER Instead of Tab template
EnterByTabManager    EnterByTabClass
NetLocalRefreshDate     Long     ! NetTalk (NetRefresh)
NetLocalRefreshTime     Long
NetLocalDependancies    String('|ViewPalletTegoeden|Relatie|')
QuickWindow          WINDOW('Pallet-tegoeden'),AT(,,489,270),FONT('MS Sans Serif',8,,FONT:regular,CHARSET:DEFAULT), |
  RESIZE,CENTER,GRAY,IMM,MAX,MDI,HLP('BrowsePalletTegoeden'),SYSTEM
                       LIST,AT(3,31,483,206),USE(?Browse:1),HVSCROLL,FORMAT('46L(2)|M~Klant-Nr~C(0)@n_10@204L(' & |
  '2)|M~Firmanaam~C(0)@s50@52C|MI~Transporteur~C(0)@p p@36L|M~Pallettype~C(0)@s20@[54R(' & |
  '2)|M~Inkomend~C(0)@n-14.@56R(2)|M~Uitgaand~C(0)@n-14.@60R(2)|M~Totaal~C(1)@n-14.@](1' & |
  '67)|~Pallets~4L(2)|M@s1@'),FROM(Queue:Browse:1),IMM,MSG('Browsing the ViewPalletTegoeden file')
                       BUTTON('&Sluiten'),AT(438,241,49,14),USE(?Close),LEFT,ICON('WACLOSE.ICO'),FLAT,MSG('Close Window'), |
  TIP('Close Window')
                       LIST,AT(389,13,97,10),USE(LOC:PalletSoortID,,?LOC:PalletSoortID:2),DROP(7),FROM('H1|#1|1-wa' & |
  'y|#2|Euro|#3|CKW|#4|BLOK|#6|CHEP|#7|Alle|#99')
                       PROMPT('Pallet Soort:'),AT(345,13),USE(?PROMPT1)
                       CHECK('Nul-standen verbergen'),AT(2,10),USE(LOC:AlleenTegoedenTonen),VALUE('1','0')
                       BUTTON('Excel'),AT(2,241,57,24),USE(?BUTTON1),LEFT,ICON('Excel.ico')
                       GROUP('Fu&zzy Search Options'),AT(103,1,199,24),USE(?FuzzyGroup),BOXED
                         ENTRY(@S255),AT(107,11,100,10),USE(?FuzzyQuery)
                         BUTTON('&Search'),AT(211,10,42,12),USE(?FuzzyGo),DEFAULT
                         BUTTON('&Clear'),AT(255,10,42,12),USE(?FuzzyClear)
                       END
                     END
FuzzyOrder3          BYTE,AUTO
FuzzyQuery3          STRING(255)

    omit('***',WE::CantCloseNowSetHereDone=1)  !Getting Nested omit compile error, then uncheck the "Check for duplicate CantCloseNowSetHere variable declaration" in the WinEvent local template
WE::CantCloseNowSetHereDone equate(1)
WE::CantCloseNowSetHere     long
    !***
ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
Reset                  PROCEDURE(BYTE Force=0),DERIVED
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED
TakeEvent              PROCEDURE(),BYTE,PROC,DERIVED
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
BRW1                 CLASS(BrowseClass)                    ! Browse using ?Browse:1
Q                      &Queue:Browse:1                !Reference to browse queue
InitSort               PROCEDURE(BYTE NewOrder),BYTE,DERIVED
ResetSort              PROCEDURE(BYTE Force),BYTE,PROC,DERIVED
SetQueueRecord         PROCEDURE(),DERIVED
ValidateRecord         PROCEDURE(),BYTE,DERIVED
                     END

BRW1::Sort0:Locator  StepLocatorClass                      ! Default Locator
Resizer              CLASS(WindowResizeClass)
Init                   PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)
                     END


  CODE
? DEBUGHOOK(ViewPalletTegoeden:Record)
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
  GlobalErrors.SetProcedureName('BrowsePalletTegoeden')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Browse:1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('LOC:PalletSoortID',LOC:PalletSoortID)              ! Added by: BrowseBox(ABC)
  BIND('FuzzyMatch',FuzzyMatch)                            ! Added by: BrowseFuzzyMatching(ABC)
  BIND('LOC:PalletNaam',LOC:PalletNaam)                    ! Added by: BrowseBox(ABC)
  BIND('LOC:Totaal',LOC:Totaal)                            ! Added by: BrowseBox(ABC)
  BIND('LOC:Dummy',LOC:Dummy)                              ! Added by: BrowseBox(ABC)
  BIND('FuzzyQuery3',FuzzyQuery3)                          ! Added by: BrowseFuzzyMatching(ABC)
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  IF SELF.Request = SelectRecord
     SELF.AddItem(?Close,RequestCancelled)                 ! Add the close control to the window manger
  ELSE
     SELF.AddItem(?Close,RequestCompleted)                 ! Add the close control to the window manger
  END
  Relate:ViewPalletTegoeden.Open                           ! File ViewPalletTegoeden used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  LOC:AlleenTegoedenTonen = 1
  LOC:PalletSoortID = 99
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:ViewPalletTegoeden,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  WinAlertMouseZoom()
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1.FileLoaded = 1                                      ! This is a 'file loaded' browse
  BRW1.AddSortOrder(,PTG:ViewPalletTegoeden_PK)            ! Add the sort order for PTG:ViewPalletTegoeden_PK for sort order 1
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort0:Locator.Init(,PTG:PalletSoortID,1,BRW1)      ! Initialize the browse locator using  using key: PTG:ViewPalletTegoeden_PK , PTG:PalletSoortID
  BRW1.SetFilter('((PTG:PalletSoortID = LOC:PalletSoortID) OR LOC:PalletSoortID = 99)') ! Apply filter expression to browse
  BRW1.AddResetField(LOC:AlleenTegoedenTonen)              ! Apply the reset field
  BRW1.AddResetField(LOC:PalletSoortID)                    ! Apply the reset field
  ?Browse:1{PROP:IconList,1} = '~off.ico'
  ?Browse:1{PROP:IconList,2} = '~on.ico'
  BRW1.AddField(PTG:RelatieID,BRW1.Q.PTG:RelatieID)        ! Field PTG:RelatieID is a hot field or requires assignment from browse
  BRW1.AddField(Rel:FirmaNaam,BRW1.Q.Rel:FirmaNaam)        ! Field Rel:FirmaNaam is a hot field or requires assignment from browse
  BRW1.AddField(PTG:Transporteur,BRW1.Q.PTG:Transporteur)  ! Field PTG:Transporteur is a hot field or requires assignment from browse
  BRW1.AddField(LOC:PalletNaam,BRW1.Q.LOC:PalletNaam)      ! Field LOC:PalletNaam is a hot field or requires assignment from browse
  BRW1.AddField(PTG:Inkomend,BRW1.Q.PTG:Inkomend)          ! Field PTG:Inkomend is a hot field or requires assignment from browse
  BRW1.AddField(PTG:Uitgaand,BRW1.Q.PTG:Uitgaand)          ! Field PTG:Uitgaand is a hot field or requires assignment from browse
  BRW1.AddField(LOC:Totaal,BRW1.Q.LOC:Totaal)              ! Field LOC:Totaal is a hot field or requires assignment from browse
  BRW1.AddField(LOC:Dummy,BRW1.Q.LOC:Dummy)                ! Field LOC:Dummy is a hot field or requires assignment from browse
  BRW1.AddField(PTG:PalletSoortID,BRW1.Q.PTG:PalletSoortID) ! Field PTG:PalletSoortID is a hot field or requires assignment from browse
  BRW1.AddField(Rel:RelatieID,BRW1.Q.Rel:RelatieID)        ! Field Rel:RelatieID is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  ?FuzzyQuery{PROP:Use} = FuzzyQuery3
  FuzzyOrder3 = BRW1.AddSortOrder()
  BRW1.AppendOrder('200-FuzzyMatch(FuzzyQuery3,PTG:RelatieID&'' ''&Rel:FirmaNaam&'' ''&PTG:Transporteur&'' ''&LOC:PalletNaam&'' ''&PTG:Inkomend&'' ''&PTG:Uitgaand&'' ''&LOC:Totaal&'' ''&LOC:Dummy&'' ''&PTG:PalletSoortID&'' ''&Rel:RelatieID)')
  BRW1.SetFilter('FuzzyMatch(FuzzyQuery3,PTG:RelatieID&'' ''&Rel:FirmaNaam&'' ''&PTG:Transporteur&'' ''&LOC:PalletNaam&'' ''&PTG:Inkomend&'' ''&PTG:Uitgaand&'' ''&LOC:Totaal&'' ''&LOC:Dummy&'' ''&PTG:PalletSoortID&'' ''&Rel:RelatieID)>=1', 'FuzzyFilter')
  INIMgr.Fetch('BrowsePalletTegoeden',QuickWindow)         ! Restore window settings from non-volatile store
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
    Relate:ViewPalletTegoeden.Close
  END
  IF SELF.Opened
    INIMgr.Update('BrowsePalletTegoeden',QuickWindow)      ! Save window data to non-volatile store
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
      ReportPalletTegoedenExcel(LOC:AlleenTegoedenTonen)
    OF ?FuzzyGo
      ThisWindow.Update()
      LOC:PalletSoortID = 99
      DISPLAY(?LOC:PalletSoortID:2)
      BRW1.ResetSort(1)
    OF ?FuzzyClear
      ThisWindow.Update()
      BRW1.ResetSort(1)
    END
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
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


BRW1.InitSort PROCEDURE(BYTE NewOrder)

ReturnValue          BYTE,AUTO

  CODE
  SORT(BRW1.Q, +BRW1.Q.PTG:PalletSoortID, +BRW1.Q.Rel:FirmaNaam, +BRW1.Q.PTG:Transporteur)
  ReturnValue = PARENT.InitSort(NewOrder)
  RETURN ReturnValue


BRW1.ResetSort PROCEDURE(BYTE Force)

ReturnValue          BYTE,AUTO

FuzzyMatched         BYTE(False),STATIC
  CODE
  IF EVENT() = EVENT:Accepted
    CASE ACCEPTED()
    OF ?FuzzyGo
      IF FuzzyQuery3
        FuzzyMatched = True
        RETURN SELF.SetSort(FuzzyOrder3, Force)
      END
    OF ?FuzzyClear
      FuzzyMatched = False
      CLEAR(FuzzyQuery3)
    END
  END
  IF FuzzyMatched = True THEN RETURN PARENT.ResetSort(Force).
  RETURN SELF.SetSort(1,Force)
  ReturnValue = PARENT.ResetSort(Force)
  RETURN ReturnValue


BRW1.SetQueueRecord PROCEDURE

  CODE
  CASE PTG:PalletSoortID
  OF 1
  	LOC:PalletNaam = 'H1'
  OF 2
  	LOC:PalletNaam = '1-way'
  OF 3
  	LOC:PalletNaam = 'Euro'
  OF 4
  	LOC:PalletNaam = 'CKW'
  OF 5
  	LOC:PalletNaam = 'BLOK'
  OF 6
  	LOC:PalletNaam = 'CHEP'
  END
  PARENT.SetQueueRecord
  
  IF (PTG:Transporteur)
    SELF.Q.PTG:Transporteur_Icon = 2                       ! Set icon from icon list
  ELSE
    SELF.Q.PTG:Transporteur_Icon = 1                       ! Set icon from icon list
  END


BRW1.ValidateRecord PROCEDURE

ReturnValue          BYTE,AUTO

BRW1::RecordStatus   BYTE,AUTO
  CODE
  LOC:Totaal = PTG:Uitgaand - PTG:Inkomend
  
  IF PTG:Uitgaand = 0 AND PTG:Inkomend = 0 THEN RETURN Record:Filtered.
  IF LOC:Totaal = 0 AND LOC:AlleenTegoedenTonen THEN RETURN Record:Filtered.
  ReturnValue = PARENT.ValidateRecord()
  BRW1::RecordStatus=ReturnValue
  RETURN ReturnValue


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window
  SELF.SetStrategy(?FuzzyGroup, Resize:FixNearestX + Resize:FixNearestY, Resize:LockSize)

