

   MEMBER('VoorrPln.clw')                                  ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABDROPS.INC'),ONCE
   INCLUDE('ABPOPUP.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('VOORRPLN007.INC'),ONCE        !Local module procedure declarations
                     END


!!! <summary>
!!! Generated from procedure template - Window
!!! Browse the Verkoop file
!!! </summary>
BrowseVerkoop PROCEDURE 

Loc:Leverancier      LONG                                  ! 
Loc:Leverancier2     LONG                                  ! 
Loc:Leverancier3     LONG                                  ! 
LOC:NietVerwerkt     BYTE                                  ! 
CurrentTab           STRING(80)                            ! 
Loc:DatumLeeg        DATE                                  ! 
LOC:Verwerkt         BYTE                                  ! 
LOC:Artikelen        STRING(300)                           ! 
Loc:Firmanaam        CSTRING(51)                           ! 
Loc:Firmanaam2       STRING(250)                           ! 
LOC:Datum            DATE                                  ! 
LOC:Tijdstip         TIME                                  ! 
LOC:CurrentKlant     LONG                                  ! 
LOC:TimingMeting     LONG,DIM(10)                          ! 
Loc:True             BYTE                                  ! 
Loc:ExportBestand    CSTRING(256)                          ! 
BRW1::View:Browse    VIEW(Verkoop)
                       PROJECT(Ver2:VerkoopID)
                       PROJECT(Ver2:Planning_DATE)
                       PROJECT(Ver2:Planning_TIME)
                       PROJECT(Ver2:Verwerkt)
                       PROJECT(Ver2:Klant)
                       PROJECT(Ver2:Exported)
                       PROJECT(Ver2:Planning)
                       JOIN(AAARel:Relatie_PK)
                         PROJECT(AAARel:FirmaNaam)
                       END
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
Ver2:VerkoopID         LIKE(Ver2:VerkoopID)           !List box control field - type derived from field
Ver2:VerkoopID_NormalFG LONG                          !Normal forground color
Ver2:VerkoopID_NormalBG LONG                          !Normal background color
Ver2:VerkoopID_SelectedFG LONG                        !Selected forground color
Ver2:VerkoopID_SelectedBG LONG                        !Selected background color
AAARel:FirmaNaam       LIKE(AAARel:FirmaNaam)         !List box control field - type derived from field
AAARel:FirmaNaam_NormalFG LONG                        !Normal forground color
AAARel:FirmaNaam_NormalBG LONG                        !Normal background color
AAARel:FirmaNaam_SelectedFG LONG                      !Selected forground color
AAARel:FirmaNaam_SelectedBG LONG                      !Selected background color
Ver2:Planning_DATE     LIKE(Ver2:Planning_DATE)       !List box control field - type derived from field
Ver2:Planning_DATE_NormalFG LONG                      !Normal forground color
Ver2:Planning_DATE_NormalBG LONG                      !Normal background color
Ver2:Planning_DATE_SelectedFG LONG                    !Selected forground color
Ver2:Planning_DATE_SelectedBG LONG                    !Selected background color
Ver2:Planning_TIME     LIKE(Ver2:Planning_TIME)       !List box control field - type derived from field
Ver2:Planning_TIME_NormalFG LONG                      !Normal forground color
Ver2:Planning_TIME_NormalBG LONG                      !Normal background color
Ver2:Planning_TIME_SelectedFG LONG                    !Selected forground color
Ver2:Planning_TIME_SelectedBG LONG                    !Selected background color
Ver2:Verwerkt          LIKE(Ver2:Verwerkt)            !List box control field - type derived from field
Ver2:Verwerkt_NormalFG LONG                           !Normal forground color
Ver2:Verwerkt_NormalBG LONG                           !Normal background color
Ver2:Verwerkt_SelectedFG LONG                         !Selected forground color
Ver2:Verwerkt_SelectedBG LONG                         !Selected background color
Ver2:Verwerkt_Icon     LONG                           !Entry's icon ID
LOC:Artikelen          LIKE(LOC:Artikelen)            !List box control field - type derived from local data
LOC:Artikelen_NormalFG LONG                           !Normal forground color
LOC:Artikelen_NormalBG LONG                           !Normal background color
LOC:Artikelen_SelectedFG LONG                         !Selected forground color
LOC:Artikelen_SelectedBG LONG                         !Selected background color
Ver2:Klant             LIKE(Ver2:Klant)               !Browse hot field - type derived from field
Ver2:Exported          LIKE(Ver2:Exported)            !Browse hot field - type derived from field
Ver2:Planning          LIKE(Ver2:Planning)            !Browse key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
FDCB5::View:FileDropCombo VIEW(Relatie)
                       PROJECT(Rel:FirmaNaam)
                       PROJECT(Rel:Type)
                     END
FDCB2::View:FileDropCombo VIEW(AARelatie)
                       PROJECT(AARel:FirmaNaam)
                       PROJECT(AARel:RelatieID)
                       PROJECT(AARel:Type)
                     END
FDCB9::View:FileDropCombo VIEW(ARelatie)
                       PROJECT(AREL:FirmaNaam)
                       PROJECT(AREL:Type)
                     END
Queue:FileDropCombo  QUEUE                            !
Rel:FirmaNaam          LIKE(Rel:FirmaNaam)            !Browse hot field - type derived from field
Rel:Type               LIKE(Rel:Type)                 !Browse hot field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
Queue:FileDropCombo:1 QUEUE                           !
AARel:FirmaNaam        LIKE(AARel:FirmaNaam)          !List box control field - type derived from field
AARel:RelatieID        LIKE(AARel:RelatieID)          !Browse hot field - type derived from field
AARel:Type             LIKE(AARel:Type)               !Browse hot field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
Queue:FileDropCombo:2 QUEUE                           !
AREL:FirmaNaam         LIKE(AREL:FirmaNaam)           !List box control field - type derived from field
AREL:Type              LIKE(AREL:Type)                !Browse hot field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
LocEnableEnterByTab  BYTE(1)                               !Used by the ENTER Instead of Tab template
EnterByTabManager    EnterByTabClass
NetLocalRefreshDate     Long     ! NetTalk (NetRefresh)
NetLocalRefreshTime     Long
NetLocalDependancies    String('|Verkoop|AAARelatie|Relatie|AARelatie|ARelatie|')
QuickWindow          WINDOW('Verkoop'),AT(,,667,217),FONT('MS Sans Serif',8,,,CHARSET:DEFAULT),RESIZE,MAXIMIZE, |
  CENTER,GRAY,IMM,MAX,MDI,HLP('BrowseInkoop'),SYSTEM
                       LIST,AT(11,58,652,128),USE(?Browse:1),HVSCROLL,FORMAT('45R(2)|*~Verkoop-ID~C(0)@n_10@20' & |
  '0L(2)|M*~Afnemer~C(0)@s50@[50L(2)|M*@d6-b@40L(2)|M*@t7b@]|~Tijdstip~37C|*I~Verwerkt~' & |
  '@p p@1020L(2)|*~Artikelen~C(0)@s255@'),FROM(Queue:Browse:1),IMM,MSG('Browsing the Inkoop file')
                       BUTTON('Rapport'),AT(198,39),USE(?SJABLOON)
                       BUTTON('Kopieer'),AT(335,39),USE(?KOPIEER)
                       BUTTON('&Invoegen'),AT(9,39,58,14),USE(?Insert:3),LEFT,ICON('WAINSERT.ICO'),FLAT,MSG('Insert a Record'), |
  TIP('Insert a Record')
                       BUTTON('&Wijzigen'),AT(75,39,53,14),USE(?Change:3),LEFT,ICON('WACHANGE.ICO'),DEFAULT,FLAT, |
  MSG('Change the Record'),TIP('Change the Record')
                       BUTTON('&Verwijderen'),AT(132,39,62,14),USE(?Delete:3),LEFT,ICON('WADELETE.ICO'),FLAT,MSG('Delete the Record'), |
  TIP('Delete the Record')
                       SHEET,AT(4,4,661,192),USE(?CurrentTab)
                         TAB('&1) Onverwerkte verkopen'),USE(?Tab:2)
                         END
                         TAB('&2) Onverwerkte verkopen (zonder datum)'),USE(?TAB4)
                         END
                         TAB('&3) Onverwerkte verkopen gesorteerd op planning'),USE(?Tab:3)
                         END
                         TAB('&4) Onverwerkte verkopen per klant'),USE(?TAB1)
                           COMBO(@s50),AT(377,39,163,12),USE(Rel:FirmaNaam),DROP(25),FORMAT('200L(2)|M~Firmanaam~C(0)@s50@'), |
  FROM(Queue:FileDropCombo),IMM
                           BUTTON('...'),AT(544,39,28,14),USE(?BUTTON2)
                         END
                         TAB('&5) Verwerkte verkopen'),USE(?TAB2)
                         END
                         TAB('&6) Verwerkte verkopen per klant'),USE(?TAB3)
                           COMBO(@s50),AT(379,39,157,13),USE(AARel:FirmaNaam),DROP(25),FORMAT('200L(2)|M~Firma Naa' & |
  'm~L(0)@s50@'),FROM(Queue:FileDropCombo:1),IMM
                           BUTTON('...'),AT(539,38),USE(?BUTTON3)
                         END
                         TAB('&7) Gefactureerde verkopen'),USE(?TAB5)
                         END
                         TAB('&8) Gefactureerde verkopen per klant'),USE(?TAB6)
                           COMBO(@s50),AT(292,39,223,13),USE(AREL:FirmaNaam),DROP(25),FORMAT('200L(2)|M~Firma Naam' & |
  '~L(0)@s50@'),FROM(Queue:FileDropCombo:2),IMM
                         END
                       END
                       BUTTON('&Sluiten'),AT(614,201,49,14),USE(?Close),LEFT,ICON('WACLOSE.ICO'),FLAT,MSG('Close Window'), |
  TIP('Close Window')
                       BUTTON('Weeglijst'),AT(5,199,63),USE(?WeeglijstButton)
                       BUTTON('Weeglijst (Excel)'),AT(71,199,71),USE(?WeeglijstExcelButton)
                       BUTTON('Sjabloon'),AT(291,39,43,14),USE(?SJABLOON:2)
                       BUTTON('Ververs Scherm'),AT(522,201,81,14),USE(?RefreshButton),LEFT,ICON('REFRESH.ICO'),FLAT
                       BUTTON('Bevestiging'),AT(245,39,41,14),USE(?Bevestiging)
                       BUTTON('XML naar Exact'),AT(377,39,57,14),USE(?Xml)
                       BUTTON('Retour Rapport'),AT(429,39,64,14),USE(?RetourRapport)
                       BUTTON,AT(629,38,26,14),USE(?Terug),ICON(ICON:VCRback),TIP('Terug naar verwerkt')
                       BUTTON('Export naar Excel'),AT(145,198,71,15),USE(?Export)
                       BUTTON('XML naar Exact Invoice'),AT(219,199,83,14),USE(?XmlInvoice)
                       BUTTON('PackLijst'),AT(307,199),USE(?PackLijst)
                       BUTTON('PackLijst gegevens'),AT(355,199),USE(?ExportData)
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
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED
TakeEvent              PROCEDURE(),BYTE,PROC,DERIVED
TakeFieldEvent         PROCEDURE(),BYTE,PROC,DERIVED
TakeNewSelection       PROCEDURE(),BYTE,PROC,DERIVED
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
BRW1                 CLASS(BrowseClass)                    ! Browse using ?Browse:1
Q                      &Queue:Browse:1                !Reference to browse queue
ApplyRange             PROCEDURE(),BYTE,PROC,DERIVED
Ask                    PROCEDURE(BYTE Request),BYTE,PROC,DERIVED
Fetch                  PROCEDURE(BYTE Direction),DERIVED
Init                   PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)
NotifyUpdateError      PROCEDURE(),BYTE,DERIVED
ResetQueue             PROCEDURE(BYTE ResetMode),DERIVED
ResetSort              PROCEDURE(BYTE Force),BYTE,PROC,DERIVED
SetQueueRecord         PROCEDURE(),DERIVED
ValidateRecord         PROCEDURE(),BYTE,DERIVED
                     END

BRW1::Sort5:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 2
BRW1::Sort6:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 7
BRW1::Sort7:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 8
Resizer              CLASS(WindowResizeClass)
Init                   PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)
                     END

FDCB5                CLASS(FileDropComboClass)             ! File drop combo manager
Q                      &Queue:FileDropCombo           !Reference to browse queue type
SetQueueRecord         PROCEDURE(),DERIVED
                     END

FDCB2                CLASS(FileDropComboClass)             ! File drop combo manager
Q                      &Queue:FileDropCombo:1         !Reference to browse queue type
SetQueueRecord         PROCEDURE(),DERIVED
                     END

FDCB9                CLASS(FileDropComboClass)             ! File drop combo manager
Q                      &Queue:FileDropCombo:2         !Reference to browse queue type
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
VulCurrentKlant     ROUTINE
    db.DebugOut('VulCurrentKlant' & CHOICE(?CurrentTab) & ',' & LOC:CurrentKlant & ', ' & Loc:Leverancier & ',' & Loc:Leverancier2)
    
    IF CHOICE(?CurrentTab) = 4 THEN
        LOC:CurrentKlant = Loc:Leverancier
    ELSIF CHOICE(?CurrentTab) = 6 THEN
        LOC:CurrentKlant = Loc:Leverancier2
    ELSE
        LOC:CurrentKlant = 0
    END

ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('BrowseVerkoop')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  GLO:Verkoop_ThreadID = THREAD()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Browse:1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('LOC:NietVerwerkt',LOC:NietVerwerkt)                ! Added by: BrowseBox(ABC)
  BIND('LOC:Leverancier',LOC:Leverancier)                  ! Added by: BrowseBox(ABC)
  BIND('LOC:Verwerkt',LOC:Verwerkt)                        ! Added by: BrowseBox(ABC)
  BIND('LOC:Leverancier2',LOC:Leverancier2)                ! Added by: BrowseBox(ABC)
  BIND('Ver2:VerkoopID',Ver2:VerkoopID)                    ! Added by: BrowseBox(ABC)
  BIND('LOC:Artikelen',LOC:Artikelen)                      ! Added by: BrowseBox(ABC)
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  IF SELF.Request = SelectRecord
     SELF.AddItem(?Close,RequestCancelled)                 ! Add the close control to the window manger
  ELSE
     SELF.AddItem(?Close,RequestCompleted)                 ! Add the close control to the window manger
  END
  	LOC:NietVerwerkt = false
  	LOC:Verwerkt = true
  Loc:True = true
  Loc:ExportBestand=GETINI('Exact','ExportBestand','','.\Voorraad.ini')
  Relate:AAARelatie.Open                                   ! File AAARelatie used by this procedure, so make sure it's RelationManager is open
  Relate:AARelatie.Open                                    ! File AARelatie used by this procedure, so make sure it's RelationManager is open
  Relate:APlanning.Open                                    ! File APlanning used by this procedure, so make sure it's RelationManager is open
  Relate:ARelatie.Open                                     ! File ARelatie used by this procedure, so make sure it's RelationManager is open
  Relate:AVerkoop.Open                                     ! File AVerkoop used by this procedure, so make sure it's RelationManager is open
  Relate:Planning.SetOpenRelated()
  Relate:Planning.Open                                     ! File Planning used by this procedure, so make sure it's RelationManager is open
  Relate:ViewArtikel.Open                                  ! File ViewArtikel used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:Verkoop,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  WinAlertMouseZoom()
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1.FileLoaded = 1                                      ! This is a 'file loaded' browse
  BRW1.AddSortOrder(,Ver2:Verwerkt_PlanningD_K)            ! Add the sort order for Ver2:Verwerkt_PlanningD_K for sort order 1
  BRW1.AddLocator(BRW1::Sort5:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort5:Locator.Init(,Ver2:Verwerkt,1,BRW1)          ! Initialize the browse locator using  using key: Ver2:Verwerkt_PlanningD_K , Ver2:Verwerkt
  BRW1.SetFilter('(Ver2:Verwerkt = LOC:NietVerwerkt AND Ver2:Klant<<>0)') ! Apply filter expression to browse
  BRW1.AddSortOrder(,Ver2:Verwerkt_PlanningD_K)            ! Add the sort order for Ver2:Verwerkt_PlanningD_K for sort order 2
  BRW1.SetFilter('(Ver2:Verwerkt = LOC:NietVerwerkt AND Ver2:Planning_DATE > DATE(1,1,1900) AND Ver2:Klant<<>0)') ! Apply filter expression to browse
  BRW1.AddSortOrder(,Ver2:Verwerkt_VerkoopIDD_K)           ! Add the sort order for Ver2:Verwerkt_VerkoopIDD_K for sort order 3
  BRW1.SetFilter('(Ver2:Verwerkt = LOC:NietVerwerkt AND Ver2:Klant=LOC:Leverancier)') ! Apply filter expression to browse
  BRW1.AddResetField(Loc:Leverancier)                      ! Apply the reset field
  BRW1.AddSortOrder(,Ver2:Verwerkt_PlanningD_K)            ! Add the sort order for Ver2:Verwerkt_PlanningD_K for sort order 4
  BRW1.SetFilter('(Ver2:Verwerkt = LOC:Verwerkt AND (NULL(Ver2:Exported) OR Ver2:Exported=0) AND Ver2:Klant<<>0)') ! Apply filter expression to browse
  BRW1.AddSortOrder(,Ver2:Verwerkt_PlanningD_K)            ! Add the sort order for Ver2:Verwerkt_PlanningD_K for sort order 5
  BRW1.SetFilter('(Ver2:Verwerkt = LOC:Verwerkt AND Ver2:Klant=LOC:Leverancier2 AND (NULL(Ver2:Exported)  OR Ver2:Exported=0))') ! Apply filter expression to browse
  BRW1.AddResetField(Loc:Leverancier2)                     ! Apply the reset field
  BRW1.AddSortOrder(,Ver2:Verkoop_FK2)                     ! Add the sort order for Ver2:Verkoop_FK2 for sort order 6
  BRW1.AddRange(Ver2:Exported,Loc:True)                    ! Add single value range limit for sort order 6
  BRW1.AddLocator(BRW1::Sort6:Locator)                     ! Browse has a locator for sort order 6
  BRW1::Sort6:Locator.Init(,Ver2:VerkoopID,,BRW1)          ! Initialize the browse locator using  using key: Ver2:Verkoop_FK2 , Ver2:VerkoopID
  BRW1.SetFilter('(Ver2:Klant<<>0)')                       ! Apply filter expression to browse
  BRW1.AddSortOrder(,Ver2:Verkoop_FK3)                     ! Add the sort order for Ver2:Verkoop_FK3 for sort order 7
  BRW1.AddRange(Ver2:Klant,Loc:Leverancier3)               ! Add single value range limit for sort order 7
  BRW1.AddLocator(BRW1::Sort7:Locator)                     ! Browse has a locator for sort order 7
  BRW1::Sort7:Locator.Init(,Ver2:VerkoopID,,BRW1)          ! Initialize the browse locator using  using key: Ver2:Verkoop_FK3 , Ver2:VerkoopID
  BRW1.AddSortOrder(,Ver2:Verwerkt_VerkoopIDD_K)           ! Add the sort order for Ver2:Verwerkt_VerkoopIDD_K for sort order 8
  BRW1.SetFilter('(Ver2:Verwerkt = LOC:NietVerwerkt AND Ver2:Klant<<>0)') ! Apply filter expression to browse
  ?Browse:1{PROP:IconList,1} = '~off.ico'
  ?Browse:1{PROP:IconList,2} = '~on.ico'
  BRW1.AddField(Ver2:VerkoopID,BRW1.Q.Ver2:VerkoopID)      ! Field Ver2:VerkoopID is a hot field or requires assignment from browse
  BRW1.AddField(AAARel:FirmaNaam,BRW1.Q.AAARel:FirmaNaam)  ! Field AAARel:FirmaNaam is a hot field or requires assignment from browse
  BRW1.AddField(Ver2:Planning_DATE,BRW1.Q.Ver2:Planning_DATE) ! Field Ver2:Planning_DATE is a hot field or requires assignment from browse
  BRW1.AddField(Ver2:Planning_TIME,BRW1.Q.Ver2:Planning_TIME) ! Field Ver2:Planning_TIME is a hot field or requires assignment from browse
  BRW1.AddField(Ver2:Verwerkt,BRW1.Q.Ver2:Verwerkt)        ! Field Ver2:Verwerkt is a hot field or requires assignment from browse
  BRW1.AddField(LOC:Artikelen,BRW1.Q.LOC:Artikelen)        ! Field LOC:Artikelen is a hot field or requires assignment from browse
  BRW1.AddField(Ver2:Klant,BRW1.Q.Ver2:Klant)              ! Field Ver2:Klant is a hot field or requires assignment from browse
  BRW1.AddField(Ver2:Exported,BRW1.Q.Ver2:Exported)        ! Field Ver2:Exported is a hot field or requires assignment from browse
  BRW1.AddField(Ver2:Planning,BRW1.Q.Ver2:Planning)        ! Field Ver2:Planning is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('BrowseVerkoop',QuickWindow)                ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  BRW1.AskProcedure = 1                                    ! Will call: UpdateVerkoop((LOC:CurrentKlant))
  FDCB5.Init(Rel:FirmaNaam,?Rel:FirmaNaam,Queue:FileDropCombo.ViewPosition,FDCB5::View:FileDropCombo,Queue:FileDropCombo,Relate:Relatie,ThisWindow,GlobalErrors,0,0,0)
  FDCB5.RemoveDuplicatesFlag = TRUE
  FDCB5.Q &= Queue:FileDropCombo
  FDCB5.AddSortOrder(Rel:Relatie_FK01)
  FDCB5.SetFilter('Rel:Type=''C''')
  FDCB5.AddField(Rel:FirmaNaam,FDCB5.Q.Rel:FirmaNaam) !Browse hot field - type derived from field
  FDCB5.AddField(Rel:Type,FDCB5.Q.Rel:Type) !Browse hot field - type derived from field
  FDCB5.AddUpdateField(Rel:RelatieID,Loc:Leverancier)
  ThisWindow.AddItem(FDCB5.WindowComponent)
  FDCB5.DefaultFill = 0
  FDCB2.Init(AARel:FirmaNaam,?AARel:FirmaNaam,Queue:FileDropCombo:1.ViewPosition,FDCB2::View:FileDropCombo,Queue:FileDropCombo:1,Relate:AARelatie,ThisWindow,GlobalErrors,0,0,0)
  FDCB2.Q &= Queue:FileDropCombo:1
  FDCB2.AddSortOrder(AARel:Relatie_FK01)
  FDCB2.SetFilter('AAREL:Type=''C''')
  FDCB2.AddField(AARel:FirmaNaam,FDCB2.Q.AARel:FirmaNaam) !List box control field - type derived from field
  FDCB2.AddField(AARel:RelatieID,FDCB2.Q.AARel:RelatieID) !Browse hot field - type derived from field
  FDCB2.AddField(AARel:Type,FDCB2.Q.AARel:Type) !Browse hot field - type derived from field
  FDCB2.AddUpdateField(AARel:RelatieID,Loc:Leverancier2)
  ThisWindow.AddItem(FDCB2.WindowComponent)
  FDCB2.DefaultFill = 0
  FDCB9.Init(AREL:FirmaNaam,?AREL:FirmaNaam,Queue:FileDropCombo:2.ViewPosition,FDCB9::View:FileDropCombo,Queue:FileDropCombo:2,Relate:ARelatie,ThisWindow,GlobalErrors,0,1,0)
  FDCB9.EntryCompletion = FALSE
  FDCB9.Q &= Queue:FileDropCombo:2
  FDCB9.AddSortOrder(AREL:Relatie_FK01)
  FDCB9.SetFilter('AREL:Type=''C''')
  FDCB9.AddField(AREL:FirmaNaam,FDCB9.Q.AREL:FirmaNaam) !List box control field - type derived from field
  FDCB9.AddField(AREL:Type,FDCB9.Q.AREL:Type) !Browse hot field - type derived from field
  FDCB9.AddUpdateField(AREL:RelatieID,Loc:Leverancier3)
  ThisWindow.AddItem(FDCB9.WindowComponent)
  FDCB9.DefaultFill = 0
  SELF.SetAlerts()
  NetLocalRefreshDate = today()         ! NetTalk (NetRefresh)
  NetLocalRefreshTime = clock()
  EnterByTabManager.Init(False)
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  GLO:Verkoop_ThreadID = 0
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:AAARelatie.Close
    Relate:AARelatie.Close
    Relate:APlanning.Close
    Relate:ARelatie.Close
    Relate:AVerkoop.Close
    Relate:Planning.Close
    Relate:ViewArtikel.Close
  END
  IF SELF.Opened
    INIMgr.Update('BrowseVerkoop',QuickWindow)             ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.Reset PROCEDURE(BYTE Force=0)

  CODE
  FREE(VerkoopArtikelQueue)
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
    UpdateVerkoop((LOC:CurrentKlant))
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
    CASE ACCEPTED()
    OF ?SJABLOON
      ! Planningrecord inlezen
      Get(BRW1.Q,Choice(?Browse:1))
      Clear(Ver2:Record)
      Ver2:VerkoopID = BRW1.Q.Ver2:VerkoopID
      IF Access:Verkoop.TryFetch(Ver2:PK_Verkoop) <> Level:Benign THEN
      	RETURN ReturnValue
      END
      
      ReportVerkoop(Ver2:VerkoopID,FALSE)
    OF ?BUTTON2
      AREL:FirmaNaam=Rel:FirmaNaam
    OF ?BUTTON3
      AREL:FirmaNaam=AARel:FirmaNaam
    OF ?WeeglijstButton
      Get(BRW1.Q,Choice(?Browse:1))
      ReportWeeglijst('Verkoop', BRW1.Q.Ver2:VerkoopID)
    OF ?WeeglijstExcelButton
      Get(BRW1.Q,Choice(?Browse:1))
      ReportWeeglijstExcel('Verkoop', BRW1.Q.Ver2:VerkoopID)
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?KOPIEER
      ThisWindow.Update()
      ! Kopieren
      GLO:GebruikerLogHandelingOpmerking = 'Kopieren verkoop'
      
      Get(BRW1.Q,Choice(?Browse:1))
      AVe:VerkoopID = BRW1.Q.Ver2:VerkoopID
      IF Access:AVerkoop.TryFetch(AVe:PK_Verkoop) = Level:Benign
      	Access:Verkoop.PrimeRecord(false)
      	Ver2:Klant = AVE:Klant
      	!Ver2:Planning_DATE=today()
          !uitgeschakeld 18-4-2017
      	!Ver2:Planning_DATE=AVE:Planning_DATE
      	!Ver2:Planning_TIME=AVE:Planning_TIME
      	Ver2:Instructie=CLIP(AVe:Instructie)
      	Ver2:Transport=CLIP(AVe:Transport)
      	Ver2:ExtraKosten=AVE:ExtraKosten
      	Ver2:ExtraKostenTekst=CLIP(AVE:ExtraKostenTekst)
          Ver2:KlantAlternatiefAdres=AVe:KlantAlternatiefAdres
          Ver2:Verwerkt=FALSE
          Ver2:Exported=FALSE
          IF Access:Verkoop.TryInsert() = Level:Benign
      		CLEAR(APla:Record)
      		APla:VerkoopID = AVe:VerkoopID
      		SET(APla:Planning_FK02, APla:Planning_FK02)
      		LOOP
      			Access:APlanning.Next()
      			IF ERROR() THEN BREAK.
      			IF APla:VerkoopID <> AVe:VerkoopID THEN BREAK.
      			
      			Access:Planning.PrimeRecord(false)
      			Pla:VerkoopID = Ver2:VerkoopID
      			Pla:ArtikelID = CLIP(APla:ArtikelID)
      			Pla:PartijID = APla:PartijID
      			Pla:KG = APla:KG
      			Pla:Pallets = APla:Pallets
      			Pla:VerpakkingID = APla:VerpakkingID
      			Pla:CelID = APla:CelID
      			Pla:Memo = CLIP(APla:Memo)
      			Pla:Instructie = CLIP(APla:Instructie)
      			Pla:Transport = CLIP(APla:Transport)
      			Pla:InkoopKGPrijs = APla:InkoopKGPrijs
                  Pla:VerkoopKGPrijs = APla:VerkoopKGPrijs
                  APla:Geprint=FALSE
                  APla:Verwerkt=FALSE
                  
      			Access:Planning.TryInsert()
              .
      		Access:Verkoop.TryFetch(Ver2:PK_Verkoop)
      		verkoopid# = Ver2:VerkoopID
      		
      		GlobalRequest = ChangeRecord
      		UpdateVerkoop()
      		
      		IF GlobalResponse = RequestCancelled THEN
      !			CLEAR(Pla:Record)
      !			Pla:VerkoopID=verkoopid#
      !			SET(Pla:Planning_FK02, Pla:Planning_FK02)
      !			LOOP
      !				Access:Planning.Next()
      !				IF ERROR() THEN BREAK.
      !				IF Pla:VerkoopID <> verkoopid# THEN BREAK.
      !				
      !				!db.DebugOut('Verwijderen planning:' & Pla:PlanningID)
      !				Access:Planning.DeleteRecord(false)
      !			.
      			
      			CLEAR(Ver2:Record)
      			Ver2:VerkoopID = verkoopid#
                  Access:Verkoop.TryFetch(Ver2:PK_Verkoop)
                  Relate:Verkoop.Delete(false)
      			!Access:Verkoop.DeleteRecord(false)
      		ELSE
      			NetRefreshPlanningViews()
      			ThisWindow.Reset(1)
      			! DE NIEUWE REGEL SELECTEREN
      			LOOP I#=1 TO RECORDS(BRW1.q)
      				GET(BRW1.Q,I#)
      				IF BRW1.Q.Ver2:VerkoopID = verkoopid#
      					SELECT(?Browse:1,I#)
      					BREAK
      				END
      			END
      		.
      	ELSE
      		MESSAGE('Verkoop kon niet gekopieerd worden.' & ERRORCODE())
      	.
      .
      GLO:GebruikerLogHandelingOpmerking = ''
    OF ?CurrentTab
      DO VulCurrentKlant
    OF ?BUTTON2
      ThisWindow.Update()
      GlobalRequest = SelectRecord
      SelectArelatie('C')
      ThisWindow.Reset
      	IF globalresponse=RequestCompleted
      		Loc:Leverancier = AREL:RelatieID
              FDCB5.ResetQueue(True)
              
              DO VulCurrentKlant
      	END
    OF ?BUTTON3
      ThisWindow.Update()
      GlobalRequest = SelectRecord
      SelectArelatie('C')
      ThisWindow.Reset
      	if globalresponse=RequestCompleted
      		Loc:Leverancier2 = AREL:RelatieID
              FDCB2.ResetQueue(True)
              
              DO VulCurrentKlant
      	END
    OF ?SJABLOON:2
      ThisWindow.Update()
      WindowCallSjabloon('Verkoop',Ver2:VerkoopID)
      ThisWindow.Reset
    OF ?RefreshButton
      ThisWindow.Update()
      ThisWindow.Reset(1)
    OF ?Bevestiging
      ThisWindow.Update()
      ReportVerkoopBevestiging(Ver2:VerkoopID)
      ThisWindow.Reset
    OF ?Xml
      ThisWindow.Update()
      ExportInvoiceXML(VER:Record,,'Order')
      ThisWindow.Reset
      BRW1.ResetQueue(False)
      Select(?Browse:1)
    OF ?RetourRapport
      ThisWindow.Update()
      ! Planningrecord inlezen
      Get(BRW1.Q,Choice(?Browse:1))
      Clear(Ver2:Record)
      Ver2:VerkoopID = BRW1.Q.Ver2:VerkoopID
      IF Access:Verkoop.TryFetch(Ver2:PK_Verkoop) <> Level:Benign THEN
      	RETURN ReturnValue
      END
      
      ReportVerkoop(Ver2:VerkoopID,TRUE)
    OF ?Terug
      ThisWindow.Update()
      GLO:GebruikerLogHandelingOpmerking='Terugzetten Exported'
      Clear(Ver2:Record)
      Ver2:VerkoopID=BRW1.Q.Ver2:VerkoopID
      IF Access:Verkoop.Fetch(Ver2:PK_Verkoop)=Level:Benign
          Ver2:Exported=FALSE
          Access:Verkoop.Update()
          BRW1.ResetQueue(False)
      ELSE
          Message('Verkoop kan niet gevonden wopren '&ERROR())
      END
      GLO:GebruikerLogHandelingOpmerking=''
      Select(?Browse:1)
    OF ?Export
      ThisWindow.Update()
      IF Choice(?CurrentTab) = 4
          ExportVerkoop(Choice(?CurrentTab), Loc:Leverancier)    ! export
      ELSIF Choice(?CurrentTab) = 6
          ExportVerkoop(Choice(?CurrentTab), Loc:Leverancier2)    ! export
      ELSIF Choice(?CurrentTab) = 8
          ExportVerkoop(Choice(?CurrentTab), Loc:Leverancier3)    ! export
      ELSE    
          ExportVerkoop(Choice(?CurrentTab), 0)    ! export
      END
    OF ?XmlInvoice
      ThisWindow.Update()
      ExportInvoiceXML(Ver:Record,,'Invoice')
      ThisWindow.Reset
    OF ?PackLijst
      ThisWindow.Update()
      ReportPackLijst(Ver2:VerkoopID)
      ThisWindow.Reset
    OF ?ExportData
      ThisWindow.Update()
      GlobalRequest = ChangeRecord
      UpdateVerkoopExport()
      ThisWindow.Reset
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
      db.DebugOut('Template stuurt een netrefresh')
    End
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


ThisWindow.TakeFieldEvent PROCEDURE

ReturnValue          BYTE,AUTO

Looped BYTE
  CODE
  LOOP                                                     ! This method receives all field specific events
    IF Looped
      RETURN Level:Notify
    ELSE
      Looped = 1
    END
  ReturnValue = PARENT.TakeFieldEvent()
  IF Loc:ExportBestand='' 
      IF ?Xml{Prop:Hide}=FALSE
          ?Xml{Prop:Hide}=TRUE
          ?Terug{Prop:Hide}=TRUE
      END
  ELSE
      IF INRANGE(CHOICE(?CurrentTab),1,4) 
          IF ?Xml{Prop:Hide}=FALSE
              ?Xml{Prop:Hide}=TRUE
          END    
          IF ?Terug{Prop:Hide}=FALSE
              ?Terug{Prop:Hide}=TRUE
          END    
          IF ?XmlInvoice{Prop:Hide}=FALSE
              ?XmlInvoice{Prop:Hide}=TRUE
          END    
      ELSIF INRANGE(CHOICE(?CurrentTab),5,6) 
          IF ?Xml{Prop:Hide}=TRUE
              ?Xml{Prop:Hide}=FALSE
          END
          IF ?Terug{Prop:Hide}=FALSE
              ?Terug{Prop:Hide}=TRUE
          END    
          IF ?XmlInvoice{Prop:Hide}=TRUE
              ?XmlInvoice{Prop:Hide}=FALSE
          END    
      ELSIF INRANGE(CHOICE(?CurrentTab),7,8) 
          IF ?Xml{Prop:Hide}=FALSE
              ?Xml{Prop:Hide}=TRUE
          END    
          IF ?Terug{Prop:Hide}=TRUE
              ?Terug{Prop:Hide}=FALSE
          END    
          IF ?XmlInvoice{Prop:Hide}=TRUE          ! tijdelijk ook op deze tab laten zien 
              ?XmlInvoice{Prop:Hide}=FALSE
          END    
  !        IF ?XmlInvoice{Prop:Hide}=FALSE
  !            ?XmlInvoice{Prop:Hide}=TRUE
  !        END    
      END  
  END
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue


ThisWindow.TakeNewSelection PROCEDURE

ReturnValue          BYTE,AUTO

Looped BYTE
  CODE
  LOOP                                                     ! This method receives all NewSelection events
    IF Looped
      RETURN Level:Notify
    ELSE
      Looped = 1
    END
  ReturnValue = PARENT.TakeNewSelection()
    CASE FIELD()
    OF ?CurrentTab
      DO VulCurrentKlant
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
    OF EVENT:Notify
        ! Focus overnemen
        !NOTIFICATION(LOC:NotifyCode)
        !IF LOC:NotifyCode = 1 THEN
            ThisWindow{Prop:Active} = 1
        !END
      	
         !NOTIFICATION(NotifyCode#)
      	!IF NotifyCode# = 1
      	!	0{Prop:Active}=TRUE
      	!ELSIF NotifyCode# = 2
      		!ThisWindow.Reset(True)
      		!ThisWindow.Reset(True)
      	!	BRW1.ResetQueue(True)
      	!.
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


BRW1.ApplyRange PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  IF CHOICE(?CurrentTab) = 2 AND POINTER(SELF.Order)=1
  ELSIF CHOICE(?CurrentTab) = 3 AND POINTER(SELF.Order)=2
  ELSIF CHOICE(?CurrentTab) = 4 AND POINTER(SELF.Order)=3
  ELSIF CHOICE(?CurrentTab) = 5 AND POINTER(SELF.Order)=4
  ELSIF CHOICE(?CurrentTab) = 6 AND POINTER(SELF.Order)=5
  ELSIF CHOICE(?CurrentTab) = 7 AND POINTER(SELF.Order)=6
  ELSIF CHOICE(?CurrentTab) = 8 AND POINTER(SELF.Order)=7
      GET(SELF.Order.RangeList.List,1)
      SELF.Order.RangeList.List.Right = Loc:True ! Ver2:Exported
  ELSE
  END
  ReturnValue = PARENT.ApplyRange()
  RETURN ReturnValue


BRW1.Ask PROCEDURE(BYTE Request)

ReturnValue          BYTE,AUTO

  CODE
  IF Request = ChangeRecord AND (Ver2:Verwerkt AND IGB:Verwerken=0) AND (Ver2:Exported AND IGB:Administrator=0)
     Request = ViewRecord     ! 2018-1-29 Weer geactiveerd 2019-4-19 IGB:Verwerken van gemaakt
  ELSIF Request = DeleteRecord AND Ver2:Verwerkt THEN
      MESSAGE('Geplande verkoop is al verwerkt. Kan dus niet meer verwijderd worden.', 'Al uitgevoerd', ICON:Exclamation)
      RETURN Level:Benign
  END
  ReturnValue = PARENT.Ask(Request)
  IF ReturnValue = RequestCompleted THEN
     ! ThisWindow.Reset(1)                ! deze ook uitgeschakeld omdat dit via de netrefresh anders dubbel loopt
  END
  RETURN ReturnValue


BRW1.Fetch PROCEDURE(BYTE Direction)

GreenBarIndex   LONG,AUTO
  CODE
  PARENT.Fetch(Direction)
  !----------------------------------------------------------------------
    LOOP GreenBarIndex=1 TO RECORDS(SELF.Q)
      GET(SELF.Q,GreenBarIndex)
      SELF.Q.Ver2:VerkoopID_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for Ver2:VerkoopID
      SELF.Q.Ver2:VerkoopID_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.Ver2:VerkoopID_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Ver2:VerkoopID_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.AAARel:FirmaNaam_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for AAARel:FirmaNaam
      SELF.Q.AAARel:FirmaNaam_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.AAARel:FirmaNaam_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.AAARel:FirmaNaam_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Ver2:Planning_DATE_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for Ver2:Planning_DATE
      SELF.Q.Ver2:Planning_DATE_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.Ver2:Planning_DATE_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Ver2:Planning_DATE_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Ver2:Planning_TIME_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for Ver2:Planning_TIME
      SELF.Q.Ver2:Planning_TIME_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.Ver2:Planning_TIME_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Ver2:Planning_TIME_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Ver2:Verwerkt_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for Ver2:Verwerkt
      SELF.Q.Ver2:Verwerkt_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.Ver2:Verwerkt_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Ver2:Verwerkt_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.LOC:Artikelen_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for LOC:Artikelen
      SELF.Q.LOC:Artikelen_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.LOC:Artikelen_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.LOC:Artikelen_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      PUT(SELF.Q)
    END
  !----------------------------------------------------------------------


BRW1.Init PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)

  CODE
  PARENT.Init(ListBox,Posit,V,Q,RM,WM)
  IF WM.Request <> ViewRecord                              ! If called for anything other than ViewMode, make the insert, change & delete controls available
    SELF.InsertControl=?Insert:3
    SELF.ChangeControl=?Change:3
    SELF.DeleteControl=?Delete:3
  END


BRW1.NotifyUpdateError PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  !	Return ReturnValue ! anders krijg ik een update foutmelding
  
  ReturnValue = PARENT.NotifyUpdateError()
  RETURN ReturnValue


BRW1.ResetQueue PROCEDURE(BYTE ResetMode)

  CODE
  DO VulCurrentKlant
  
  PARENT.ResetQueue(ResetMode)


BRW1.ResetSort PROCEDURE(BYTE Force)

ReturnValue          BYTE,AUTO

  CODE
  IF CHOICE(?CurrentTab) = 2
    RETURN SELF.SetSort(1,Force)
  ELSIF CHOICE(?CurrentTab) = 3
    RETURN SELF.SetSort(2,Force)
  ELSIF CHOICE(?CurrentTab) = 4
    RETURN SELF.SetSort(3,Force)
  ELSIF CHOICE(?CurrentTab) = 5
    RETURN SELF.SetSort(4,Force)
  ELSIF CHOICE(?CurrentTab) = 6
    RETURN SELF.SetSort(5,Force)
  ELSIF CHOICE(?CurrentTab) = 7
    RETURN SELF.SetSort(6,Force)
  ELSIF CHOICE(?CurrentTab) = 8
    RETURN SELF.SetSort(7,Force)
  ELSE
    RETURN SELF.SetSort(8,Force)
  END
  ReturnValue = PARENT.ResetSort(Force)
  RETURN ReturnValue


BRW1.SetQueueRecord PROCEDURE

  CODE
  LOC:Artikelen = CachingClass.GetVerkoopArtikelen(Ver2:VerkoopID)
  PARENT.SetQueueRecord
  
  IF (Ver2:Verwerkt)
    SELF.Q.Ver2:Verwerkt_Icon = 2                          ! Set icon from icon list
  ELSE
    SELF.Q.Ver2:Verwerkt_Icon = 1                          ! Set icon from icon list
  END
  !----------------------------------------------------------------------
      SELF.Q.Ver2:VerkoopID_NormalFG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1) ! Set color values for Ver2:VerkoopID
      SELF.Q.Ver2:VerkoopID_NormalBG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,8454143)
      SELF.Q.Ver2:VerkoopID_SelectedFG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.Ver2:VerkoopID_SelectedBG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.AAARel:FirmaNaam_NormalFG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1) ! Set color values for AAARel:FirmaNaam
      SELF.Q.AAARel:FirmaNaam_NormalBG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,8454143)
      SELF.Q.AAARel:FirmaNaam_SelectedFG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.AAARel:FirmaNaam_SelectedBG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.Ver2:Planning_DATE_NormalFG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1) ! Set color values for Ver2:Planning_DATE
      SELF.Q.Ver2:Planning_DATE_NormalBG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,8454143)
      SELF.Q.Ver2:Planning_DATE_SelectedFG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.Ver2:Planning_DATE_SelectedBG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.Ver2:Planning_TIME_NormalFG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1) ! Set color values for Ver2:Planning_TIME
      SELF.Q.Ver2:Planning_TIME_NormalBG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,8454143)
      SELF.Q.Ver2:Planning_TIME_SelectedFG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.Ver2:Planning_TIME_SelectedBG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.Ver2:Verwerkt_NormalFG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1) ! Set color values for Ver2:Verwerkt
      SELF.Q.Ver2:Verwerkt_NormalBG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,8454143)
      SELF.Q.Ver2:Verwerkt_SelectedFG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.Ver2:Verwerkt_SelectedBG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.LOC:Artikelen_NormalFG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1) ! Set color values for LOC:Artikelen
      SELF.Q.LOC:Artikelen_NormalBG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,8454143)
      SELF.Q.LOC:Artikelen_SelectedFG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.LOC:Artikelen_SelectedBG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
  !----------------------------------------------------------------------


BRW1.ValidateRecord PROCEDURE

ReturnValue          BYTE,AUTO

BRW1::RecordStatus   BYTE,AUTO
  CODE
  ReturnValue = PARENT.ValidateRecord()
  !IF VER2:Klant = 0 THEN RETURN Record:Filtered. ! Records die een andere gebruiker aan het toevoegen is, niet tonen.
  !Bovenstaand in de filter gezet
  IF CHOICE(?CurrentTab) = 2
      IF Ver2:Planning_DATE > DATE(1,1,1900) THEN
          RETURN Record:Filtered
      END
  END
  BRW1::RecordStatus=ReturnValue
  RETURN ReturnValue


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window
  SELF.SetStrategy(?Rel:FirmaNaam, Resize:FixLeft+Resize:FixTop, Resize:LockSize) ! Override strategy for ?Rel:FirmaNaam
  SELF.SetStrategy(?AARel:FirmaNaam, Resize:FixLeft+Resize:FixTop, Resize:LockSize) ! Override strategy for ?AARel:FirmaNaam
  SELF.SetStrategy(?Insert:3, Resize:FixLeft+Resize:FixTop, Resize:LockSize) ! Override strategy for ?Insert:3
  SELF.SetStrategy(?Change:3, Resize:FixLeft+Resize:FixTop, Resize:LockSize) ! Override strategy for ?Change:3
  SELF.SetStrategy(?Delete:3, Resize:FixLeft+Resize:FixTop, Resize:LockSize) ! Override strategy for ?Delete:3
  SELF.SetStrategy(?BUTTON3, Resize:FixLeft+Resize:FixTop, Resize:LockSize) ! Override strategy for ?BUTTON3
  SELF.SetStrategy(?BUTTON2, Resize:FixLeft+Resize:FixTop, Resize:LockSize) ! Override strategy for ?BUTTON2
  SELF.SetStrategy(?SJABLOON, Resize:FixLeft+Resize:FixTop, Resize:LockSize) ! Override strategy for ?SJABLOON
  SELF.SetStrategy(?KOPIEER, Resize:FixLeft+Resize:FixTop, Resize:LockSize) ! Override strategy for ?KOPIEER
  SELF.SetStrategy(?SJABLOON:2, Resize:FixLeft+Resize:FixTop, Resize:LockSize) ! Override strategy for ?SJABLOON:2
  SELF.SetStrategy(?RefreshButton, Resize:FixRight+Resize:FixBottom, Resize:LockSize) ! Override strategy for ?RefreshButton
  SELF.SetStrategy(?PackLijst, Resize:FixLeft+Resize:FixBottom, Resize:LockSize) ! Override strategy for ?PackLijst
  SELF.SetStrategy(?ExportData, Resize:FixLeft+Resize:FixBottom, Resize:LockSize) ! Override strategy for ?ExportData


FDCB5.SetQueueRecord PROCEDURE

  CODE
  	i#=INSTRING('<39>',REL:FirmaNaam,1,1)
  	if i#
  		Loc:Firmanaam = Sub(REL:FirmaNaam,1,i#-1)&SUB(REL:FirmaNaam,i#+1,51)
  	ELSE
  		Loc:Firmanaam = REL:FirmaNaam
  	End	
  PARENT.SetQueueRecord
  


FDCB2.SetQueueRecord PROCEDURE

  CODE
  	i#=INSTRING('<39>',AARel:FirmaNaam,1,1)
  	if i#
  		Loc:Firmanaam2 = Sub(AARel:FirmaNaam,1,i#-1)&SUB(AARel:FirmaNaam,i#+1,51)
  	ELSE
  		Loc:Firmanaam2 = AARel:FirmaNaam
  	End	
  PARENT.SetQueueRecord
  

