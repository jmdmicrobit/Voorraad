

   MEMBER('VoorrVrd.clw')                                  ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABPOPUP.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('VOORRVRD011.INC'),ONCE        !Local module procedure declarations
                     END


!!! <summary>
!!! Generated from procedure template - Window
!!! Browse the ViewPalletTegoeden file
!!! </summary>
BrowsePalletTegoeden PROCEDURE 

udpt            UltimateDebugProcedureTracker
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
                         PROJECT(Rel:NietActief)
                         PROJECT(Rel:RelatieID)
                       END
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
PTG:RelatieID          LIKE(PTG:RelatieID)            !List box control field - type derived from field
PTG:RelatieID_NormalFG LONG                           !Normal forground color
PTG:RelatieID_NormalBG LONG                           !Normal background color
PTG:RelatieID_SelectedFG LONG                         !Selected forground color
PTG:RelatieID_SelectedBG LONG                         !Selected background color
Rel:FirmaNaam          LIKE(Rel:FirmaNaam)            !List box control field - type derived from field
Rel:FirmaNaam_NormalFG LONG                           !Normal forground color
Rel:FirmaNaam_NormalBG LONG                           !Normal background color
Rel:FirmaNaam_SelectedFG LONG                         !Selected forground color
Rel:FirmaNaam_SelectedBG LONG                         !Selected background color
Rel:FirmaNaam_Style    LONG                           !Field style
PTG:Transporteur       LIKE(PTG:Transporteur)         !List box control field - type derived from field
PTG:Transporteur_NormalFG LONG                        !Normal forground color
PTG:Transporteur_NormalBG LONG                        !Normal background color
PTG:Transporteur_SelectedFG LONG                      !Selected forground color
PTG:Transporteur_SelectedBG LONG                      !Selected background color
PTG:Transporteur_Icon  LONG                           !Entry's icon ID
LOC:PalletNaam         LIKE(LOC:PalletNaam)           !List box control field - type derived from local data
LOC:PalletNaam_NormalFG LONG                          !Normal forground color
LOC:PalletNaam_NormalBG LONG                          !Normal background color
LOC:PalletNaam_SelectedFG LONG                        !Selected forground color
LOC:PalletNaam_SelectedBG LONG                        !Selected background color
PTG:Inkomend           LIKE(PTG:Inkomend)             !List box control field - type derived from field
PTG:Inkomend_NormalFG  LONG                           !Normal forground color
PTG:Inkomend_NormalBG  LONG                           !Normal background color
PTG:Inkomend_SelectedFG LONG                          !Selected forground color
PTG:Inkomend_SelectedBG LONG                          !Selected background color
PTG:Uitgaand           LIKE(PTG:Uitgaand)             !List box control field - type derived from field
PTG:Uitgaand_NormalFG  LONG                           !Normal forground color
PTG:Uitgaand_NormalBG  LONG                           !Normal background color
PTG:Uitgaand_SelectedFG LONG                          !Selected forground color
PTG:Uitgaand_SelectedBG LONG                          !Selected background color
LOC:Totaal             LIKE(LOC:Totaal)               !List box control field - type derived from local data
LOC:Totaal_NormalFG    LONG                           !Normal forground color
LOC:Totaal_NormalBG    LONG                           !Normal background color
LOC:Totaal_SelectedFG  LONG                           !Selected forground color
LOC:Totaal_SelectedBG  LONG                           !Selected background color
LOC:Dummy              LIKE(LOC:Dummy)                !List box control field - type derived from local data
LOC:Dummy_NormalFG     LONG                           !Normal forground color
LOC:Dummy_NormalBG     LONG                           !Normal background color
LOC:Dummy_SelectedFG   LONG                           !Selected forground color
LOC:Dummy_SelectedBG   LONG                           !Selected background color
PTG:PalletSoortID      LIKE(PTG:PalletSoortID)        !Browse hot field - type derived from field
Rel:NietActief         LIKE(Rel:NietActief)           !Browse hot field - type derived from field
Rel:RelatieID          LIKE(Rel:RelatieID)            !Related join file key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
LocEnableEnterByTab  BYTE(1)                               !Used by the ENTER Instead of Tab template
EnterByTabManager    EnterByTabClass
NetLocalRefreshDate     Long     ! NetTalk (NetRefresh)
NetLocalRefreshTime     Long
NetLocalDependancies    String('|ViewPalletTegoeden|Relatie|')
QuickWindow          WINDOW('Pallet-tegoeden'),AT(,,511,288),FONT('MS Sans Serif',8,,FONT:regular,CHARSET:DEFAULT), |
  RESIZE,CENTER,GRAY,IMM,MAX,MDI,HLP('BrowsePalletTegoeden'),SYSTEM
                       SHEET,AT(2,1,507,284),USE(?SHEET1)
                         TAB('&1) Alleen Actief met Saldo'),USE(?TAB1)
                         END
                         TAB('&2) Alle'),USE(?TAB2)
                         END
                       END
                       LIST,AT(11,46,483,206),USE(?Browse:1),HVSCROLL,FORMAT('46L(2)|M*~Klant-Nr~C(0)@n_10@204' & |
  'L(2)|M*Y~Firmanaam~C(0)@s50@52C|M*I~Transporteur~@p p@36L|M*~Pallettype~C(0)@s20@[54' & |
  'R(2)|M*~Inkomend~C(0)@n-14.@56R(2)|M*~Uitgaand~C(0)@n-14.@60R(2)|M*~Totaal~C(1)@n-14' & |
  '.@](167)|~Pallets~4L(2)|M*@s1@'),FROM(Queue:Browse:1),IMM,MSG('Browsing the ViewPall' & |
  'etTegoeden file')
                       LIST,AT(397,25,97,10),USE(LOC:PalletSoortID),DROP(10),FROM('H1|#1|1-way|#2|Euro|#3|CKW|' & |
  '#4|BLOK|#5|CHEP|#6|E2|#7|Alle|#99')
                       PROMPT('Pallet Soort:'),AT(353,25),USE(?PROMPT1)
                       GROUP('Fu&zzy Search Options'),AT(119,18,199,24),USE(?FuzzyGroup),BOXED
                         ENTRY(@S255),AT(123,28,100,10),USE(?FuzzyQuery)
                         BUTTON('&Search'),AT(227,26,42,12),USE(?FuzzyGo),DEFAULT
                         BUTTON('&Clear'),AT(271,26,42,12),USE(?FuzzyClear)
                       END
                       CHECK('Nul-standen verbergen'),AT(11,25),USE(LOC:AlleenTegoedenTonen),HIDE,VALUE('1','0')
                       BUTTON('&Sluiten'),AT(445,266,49,14),USE(?Close),LEFT,ICON('WACLOSE.ICO'),FLAT,MSG('Close Window'), |
  TIP('Close Window')
                       BUTTON('Excel'),AT(2,257,57,24),USE(?Excell),LEFT,ICON('Excel.ico')
                     END
FuzzyOrder3          BYTE,AUTO
FuzzyQuery3          STRING(255)

ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
Reset                  PROCEDURE(BYTE Force=0),DERIVED
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED
TakeEvent              PROCEDURE(),BYTE,PROC,DERIVED
TakeSelected           PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
BRW1                 CLASS(BrowseClass)                    ! Browse using ?Browse:1
Q                      &Queue:Browse:1                !Reference to browse queue
Fetch                  PROCEDURE(BYTE Direction),DERIVED
InitSort               PROCEDURE(BYTE NewOrder),BYTE,DERIVED
ResetSort              PROCEDURE(BYTE Force),BYTE,PROC,DERIVED
SetQueueRecord         PROCEDURE(),DERIVED
ValidateRecord         PROCEDURE(),BYTE,DERIVED
                     END

BRW1::Sort0:Locator  StepLocatorClass                      ! Default Locator
BRW1::Sort1:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?Sheet1)=1
BRW1::Sort2:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?Sheet1)=2
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
  !------------------------------------
  !Style for ?Browse:1
  !------------------------------------
   ?Browse:1{PROPSTYLE:TextColor, 1}     = Color:Red
!---------------------------------------------------------------------------

ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
        udpt.Init(UD,'BrowsePalletTegoeden','VoorrVrd011.clw','VoorrVrd.DLL','02/27/2023 @ 10:17PM')    
             
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
  Do DefineListboxStyle
  QuickWindow{Prop:Alrt,255} = CtrlShiftP
  BRW1.Q &= Queue:Browse:1
  BRW1.FileLoaded = 1                                      ! This is a 'file loaded' browse
  BRW1.AddSortOrder(,PTG:ViewPalletTegoeden_PK)            ! Add the sort order for PTG:ViewPalletTegoeden_PK for sort order 1
  BRW1.AddLocator(BRW1::Sort1:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort1:Locator.Init(,PTG:PalletSoortID,1,BRW1)      ! Initialize the browse locator using  using key: PTG:ViewPalletTegoeden_PK , PTG:PalletSoortID
  BRW1.SetFilter('(((PTG:PalletSoortID = LOC:PalletSoortID) OR LOC:PalletSoortID = 99) AND NOT Rel:NietActief)') ! Apply filter expression to browse
  BRW1.AddSortOrder(,PTG:ViewPalletTegoeden_PK)            ! Add the sort order for PTG:ViewPalletTegoeden_PK for sort order 2
  BRW1.AddLocator(BRW1::Sort2:Locator)                     ! Browse has a locator for sort order 2
  BRW1::Sort2:Locator.Init(,PTG:PalletSoortID,1,BRW1)      ! Initialize the browse locator using  using key: PTG:ViewPalletTegoeden_PK , PTG:PalletSoortID
  BRW1.SetFilter('(((PTG:PalletSoortID = LOC:PalletSoortID) OR LOC:PalletSoortID = 99))') ! Apply filter expression to browse
  BRW1.AddSortOrder(,PTG:ViewPalletTegoeden_PK)            ! Add the sort order for PTG:ViewPalletTegoeden_PK for sort order 3
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 3
  BRW1::Sort0:Locator.Init(,PTG:PalletSoortID,1,BRW1)      ! Initialize the browse locator using  using key: PTG:ViewPalletTegoeden_PK , PTG:PalletSoortID
  BRW1.AppendOrder('+Rel:FirmaNaam')                       ! Append an additional sort order
  BRW1.SetFilter('((PTG:PalletSoortID = LOC:PalletSoortID) OR LOC:PalletSoortID = 99)') ! Apply filter expression to browse
  BRW1.AddResetField(LOC:AlleenTegoedenTonen)              ! Apply the reset field
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
  BRW1.AddField(Rel:NietActief,BRW1.Q.Rel:NietActief)      ! Field Rel:NietActief is a hot field or requires assignment from browse
  BRW1.AddField(Rel:RelatieID,BRW1.Q.Rel:RelatieID)        ! Field Rel:RelatieID is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  ?FuzzyQuery{PROP:Use} = FuzzyQuery3
  FuzzyOrder3 = BRW1.AddSortOrder()
  BRW1.AppendOrder('200-FuzzyMatch(FuzzyQuery3,PTG:RelatieID&'' ''&Rel:FirmaNaam&'' ''&PTG:Transporteur&'' ''&LOC:PalletNaam&'' ''&PTG:Inkomend&'' ''&PTG:Uitgaand&'' ''&LOC:Totaal&'' ''&LOC:Dummy&'' ''&PTG:PalletSoortID&'' ''&Rel:NietActief&'' ''&Rel:RelatieID)')
  BRW1.SetFilter('FuzzyMatch(FuzzyQuery3,PTG:RelatieID&'' ''&Rel:FirmaNaam&'' ''&PTG:Transporteur&'' ''&LOC:PalletNaam&'' ''&PTG:Inkomend&'' ''&PTG:Uitgaand&'' ''&LOC:Totaal&'' ''&LOC:Dummy&'' ''&PTG:PalletSoortID&'' ''&Rel:NietActief&'' ''&Rel:RelatieID)>=1', 'FuzzyFilter')
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
    OF ?LOC:PalletSoortID
          UD.Debug('Palletsoort selector accepted')
          BRW1.ResetQueue(Reset:Queue)
    OF ?FuzzyGo
      ThisWindow.Update()
      LOC:PalletSoortID = 99
      DISPLAY(?LOC:PalletSoortID)
      BRW1.ResetSort(1)
    OF ?FuzzyClear
      ThisWindow.Update()
      BRW1.ResetSort(1)
    OF ?Excell
      ThisWindow.Update()
      ReportPalletTegoedenExcel(LOC:AlleenTegoedenTonen)
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
     IF KEYCODE()=CtrlShiftP AND EVENT() = Event:PreAlertKey
       CYCLE
     END
     IF KEYCODE()=CtrlShiftP  
        UD.ShowProcedureInfo('BrowsePalletTegoeden',UD.SetApplicationName('VoorrVrd','DLL'),QuickWindow{PROP:Hlp},'10/07/2011 @ 08:55AM','02/27/2023 @ 10:17PM','10/11/2024 @ 01:55PM')  
    
       CYCLE
     END
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue


ThisWindow.TakeSelected PROCEDURE

ReturnValue          BYTE,AUTO

Looped BYTE
  CODE
  LOOP                                                     ! This method receives all Selected events
    IF Looped
      RETURN Level:Notify
    ELSE
      Looped = 1
    END
  ReturnValue = PARENT.TakeSelected()
    CASE FIELD()
    OF ?LOC:PalletSoortID
          UD.Debug('Palletsoort selector selected')
          !    BRW1.ResetQueue(Reset:Queue)
    END
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue


BRW1.Fetch PROCEDURE(BYTE Direction)

GreenBarIndex   LONG,AUTO
  CODE
  PARENT.Fetch(Direction)
  !----------------------------------------------------------------------
    LOOP GreenBarIndex=1 TO RECORDS(SELF.Q)
      GET(SELF.Q,GreenBarIndex)
      SELF.Q.PTG:RelatieID_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for PTG:RelatieID
      SELF.Q.PTG:RelatieID_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.PTG:RelatieID_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.PTG:RelatieID_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Rel:FirmaNaam_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for Rel:FirmaNaam
      SELF.Q.Rel:FirmaNaam_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.Rel:FirmaNaam_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.Rel:FirmaNaam_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.PTG:Transporteur_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for PTG:Transporteur
      SELF.Q.PTG:Transporteur_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.PTG:Transporteur_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.PTG:Transporteur_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.LOC:PalletNaam_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for LOC:PalletNaam
      SELF.Q.LOC:PalletNaam_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.LOC:PalletNaam_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.LOC:PalletNaam_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.PTG:Inkomend_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for PTG:Inkomend
      SELF.Q.PTG:Inkomend_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.PTG:Inkomend_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.PTG:Inkomend_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.PTG:Uitgaand_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for PTG:Uitgaand
      SELF.Q.PTG:Uitgaand_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.PTG:Uitgaand_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.PTG:Uitgaand_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.LOC:Totaal_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for LOC:Totaal
      SELF.Q.LOC:Totaal_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.LOC:Totaal_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.LOC:Totaal_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.LOC:Dummy_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for LOC:Dummy
      SELF.Q.LOC:Dummy_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.LOC:Dummy_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.LOC:Dummy_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      PUT(SELF.Q)
    END
  !----------------------------------------------------------------------


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
  IF CHOICE(?Sheet1)=1
    RETURN SELF.SetSort(1,Force)
  ELSIF CHOICE(?Sheet1)=2
    RETURN SELF.SetSort(2,Force)
  ELSE
    RETURN SELF.SetSort(3,Force)
  END
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
  OF 7
  	LOC:PalletNaam = 'E2'
  END
  PARENT.SetQueueRecord
  
  IF (Rel:NietActief)
    SELF.Q.Rel:FirmaNaam_Style = 1 ! 1
  ELSE
    SELF.Q.Rel:FirmaNaam_Style = 0 ! 0
  END
  IF (PTG:Transporteur)
    SELF.Q.PTG:Transporteur_Icon = 2                       ! Set icon from icon list
  ELSE
    SELF.Q.PTG:Transporteur_Icon = 1                       ! Set icon from icon list
  END
  !----------------------------------------------------------------------
      SELF.Q.PTG:RelatieID_NormalFG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1) ! Set color values for PTG:RelatieID
      SELF.Q.PTG:RelatieID_NormalBG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,8454143)
      SELF.Q.PTG:RelatieID_SelectedFG = CHOOSE(CHOICE(?Browse:1) % 2,-1,8454143)
      SELF.Q.PTG:RelatieID_SelectedBG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.Rel:FirmaNaam_NormalFG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1) ! Set color values for Rel:FirmaNaam
      SELF.Q.Rel:FirmaNaam_NormalBG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,8454143)
      SELF.Q.Rel:FirmaNaam_SelectedFG = CHOOSE(CHOICE(?Browse:1) % 2,-1,8454143)
      SELF.Q.Rel:FirmaNaam_SelectedBG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.PTG:Transporteur_NormalFG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1) ! Set color values for PTG:Transporteur
      SELF.Q.PTG:Transporteur_NormalBG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,8454143)
      SELF.Q.PTG:Transporteur_SelectedFG = CHOOSE(CHOICE(?Browse:1) % 2,-1,8454143)
      SELF.Q.PTG:Transporteur_SelectedBG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.LOC:PalletNaam_NormalFG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1) ! Set color values for LOC:PalletNaam
      SELF.Q.LOC:PalletNaam_NormalBG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,8454143)
      SELF.Q.LOC:PalletNaam_SelectedFG = CHOOSE(CHOICE(?Browse:1) % 2,-1,8454143)
      SELF.Q.LOC:PalletNaam_SelectedBG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.PTG:Inkomend_NormalFG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1) ! Set color values for PTG:Inkomend
      SELF.Q.PTG:Inkomend_NormalBG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,8454143)
      SELF.Q.PTG:Inkomend_SelectedFG = CHOOSE(CHOICE(?Browse:1) % 2,-1,8454143)
      SELF.Q.PTG:Inkomend_SelectedBG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.PTG:Uitgaand_NormalFG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1) ! Set color values for PTG:Uitgaand
      SELF.Q.PTG:Uitgaand_NormalBG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,8454143)
      SELF.Q.PTG:Uitgaand_SelectedFG = CHOOSE(CHOICE(?Browse:1) % 2,-1,8454143)
      SELF.Q.PTG:Uitgaand_SelectedBG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.LOC:Totaal_NormalFG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1) ! Set color values for LOC:Totaal
      SELF.Q.LOC:Totaal_NormalBG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,8454143)
      SELF.Q.LOC:Totaal_SelectedFG = CHOOSE(CHOICE(?Browse:1) % 2,-1,8454143)
      SELF.Q.LOC:Totaal_SelectedBG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.LOC:Dummy_NormalFG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1) ! Set color values for LOC:Dummy
      SELF.Q.LOC:Dummy_NormalBG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,8454143)
      SELF.Q.LOC:Dummy_SelectedFG = CHOOSE(CHOICE(?Browse:1) % 2,-1,8454143)
      SELF.Q.LOC:Dummy_SelectedBG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
  !----------------------------------------------------------------------
  IF SELF.Q.Rel:NietActief
      UD.Debug(Self.Q.Rel:RelatieID)
      UD.Debug(Self.Q.Rel:NietActief)
        SELF.Q.Rel:FirmaNaam_NormalBG   = COLOR:Red
        SELF.Q.Rel:FirmaNaam_SelectedFG = COLOR:Red
    END


BRW1.ValidateRecord PROCEDURE

ReturnValue          BYTE,AUTO

BRW1::RecordStatus   BYTE,AUTO
  CODE
  LOC:Totaal = PTG:Uitgaand - PTG:Inkomend
  
  IF PTG:Uitgaand = 0 AND PTG:Inkomend = 0 THEN RETURN Record:Filtered.
  
  IF CHOICE(?SHEET1)=1 AND LOC:Totaal = 0 THEN RETURN Record:Filtered.
  ! IF LOC:Totaal = 0 AND LOC:AlleenTegoedenTonen THEN RETURN Record:Filtered.
  ReturnValue = PARENT.ValidateRecord()
  BRW1::RecordStatus=ReturnValue
  RETURN ReturnValue


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window
  SELF.SetStrategy(?FuzzyGroup, Resize:FixNearestX + Resize:FixNearestY, Resize:LockSize)

