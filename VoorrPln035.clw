

   MEMBER('VoorrPln.clw')                                  ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABDROPS.INC'),ONCE
   INCLUDE('ABPOPUP.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('VOORRPLN035.INC'),ONCE        !Local module procedure declarations
                     END


!!! <summary>
!!! Generated from procedure template - Window
!!! Browse the Inkoop file
!!! </summary>
BrowseInkoop PROCEDURE 

Loc:Leverancier      LONG                                  ! 
LOC:Verwerkt         BYTE                                  ! 
LOC:NietVerwerkt     BYTE                                  ! 
CurrentTab           STRING(80)                            ! 
Loc:DatumLeeg        DATE                                  ! 
Loc:Artikelen        STRING(250)                           ! 
Loc:Leverancier2     LONG                                  ! 
LOC:Firmanaam        STRING(250)                           ! 
LOC:Firmanaam2       STRING(250)                           ! 
LOC:CurrentLeverancier LONG                                ! 
BRW1::View:Browse    VIEW(Inkoop)
                       PROJECT(Ink:InkoopID)
                       PROJECT(Ink:Planning_DATE)
                       PROJECT(Ink:Planning_TIME)
                       PROJECT(Ink:Verwerkt)
                       PROJECT(Ink:Leverancier)
                       PROJECT(Ink:Planning)
                       JOIN(Rel:Relatie_PK,Ink:Leverancier)
                         PROJECT(Rel:FirmaNaam)
                         PROJECT(Rel:RelatieID)
                       END
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
Ink:InkoopID           LIKE(Ink:InkoopID)             !List box control field - type derived from field
Ink:InkoopID_NormalFG  LONG                           !Normal forground color
Ink:InkoopID_NormalBG  LONG                           !Normal background color
Ink:InkoopID_SelectedFG LONG                          !Selected forground color
Ink:InkoopID_SelectedBG LONG                          !Selected background color
Rel:FirmaNaam          LIKE(Rel:FirmaNaam)            !List box control field - type derived from field
Rel:FirmaNaam_NormalFG LONG                           !Normal forground color
Rel:FirmaNaam_NormalBG LONG                           !Normal background color
Rel:FirmaNaam_SelectedFG LONG                         !Selected forground color
Rel:FirmaNaam_SelectedBG LONG                         !Selected background color
Ink:Planning_DATE      LIKE(Ink:Planning_DATE)        !List box control field - type derived from field
Ink:Planning_DATE_NormalFG LONG                       !Normal forground color
Ink:Planning_DATE_NormalBG LONG                       !Normal background color
Ink:Planning_DATE_SelectedFG LONG                     !Selected forground color
Ink:Planning_DATE_SelectedBG LONG                     !Selected background color
Ink:Planning_TIME      LIKE(Ink:Planning_TIME)        !List box control field - type derived from field
Ink:Planning_TIME_NormalFG LONG                       !Normal forground color
Ink:Planning_TIME_NormalBG LONG                       !Normal background color
Ink:Planning_TIME_SelectedFG LONG                     !Selected forground color
Ink:Planning_TIME_SelectedBG LONG                     !Selected background color
Ink:Verwerkt           LIKE(Ink:Verwerkt)             !List box control field - type derived from field
Ink:Verwerkt_NormalFG  LONG                           !Normal forground color
Ink:Verwerkt_NormalBG  LONG                           !Normal background color
Ink:Verwerkt_SelectedFG LONG                          !Selected forground color
Ink:Verwerkt_SelectedBG LONG                          !Selected background color
Ink:Verwerkt_Icon      LONG                           !Entry's icon ID
Loc:Artikelen          LIKE(Loc:Artikelen)            !List box control field - type derived from local data
Loc:Artikelen_NormalFG LONG                           !Normal forground color
Loc:Artikelen_NormalBG LONG                           !Normal background color
Loc:Artikelen_SelectedFG LONG                         !Selected forground color
Loc:Artikelen_SelectedBG LONG                         !Selected background color
Ink:Leverancier        LIKE(Ink:Leverancier)          !Browse hot field - type derived from field
Ink:Planning           LIKE(Ink:Planning)             !Browse key field - type derived from field
Rel:RelatieID          LIKE(Rel:RelatieID)            !Related join file key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
FDCB5::View:FileDropCombo VIEW(ARelatie)
                       PROJECT(AREL:FirmaNaam)
                       PROJECT(AREL:Type)
                     END
FDCB2::View:FileDropCombo VIEW(AARelatie)
                       PROJECT(AARel:FirmaNaam)
                       PROJECT(AARel:Type)
                     END
Queue:FileDropCombo  QUEUE                            !
LOC:Firmanaam          LIKE(LOC:Firmanaam)            !List box control field - type derived from local data
AREL:FirmaNaam         LIKE(AREL:FirmaNaam)           !Browse hot field - type derived from field
AREL:Type              LIKE(AREL:Type)                !Browse hot field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
Queue:FileDropCombo:1 QUEUE                           !
LOC:Firmanaam2         LIKE(LOC:Firmanaam2)           !List box control field - type derived from local data
AARel:FirmaNaam        LIKE(AARel:FirmaNaam)          !Browse hot field - type derived from field
AARel:Type             LIKE(AARel:Type)               !Browse hot field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
LocEnableEnterByTab  BYTE(1)                               !Used by the ENTER Instead of Tab template
EnterByTabManager    EnterByTabClass
NetLocalRefreshDate     Long     ! NetTalk (NetRefresh)
NetLocalRefreshTime     Long
NetLocalDependancies    String('|Inkoop|Relatie|ARelatie|AARelatie|')
QuickWindow          WINDOW('Inkoop'),AT(,,562,214),FONT('MS Sans Serif',8,,,CHARSET:DEFAULT),RESIZE,MAXIMIZE,CENTER, |
  GRAY,IMM,MAX,MDI,HLP('BrowseInkoop'),SYSTEM
                       LIST,AT(9,52,540,135),USE(?Browse:1),HVSCROLL,FORMAT('52R(4)|*~Inkoop-ID~C(0)@n_10@200L' & |
  '(2)|*~Leverancier~C(0)@s50@[47R(2)|M*~Datum~C(0)@d6-B@29R(2)|M*~Tijd~C(0)@t7B@]|~Pla' & |
  'nning~36R(2)|M*I~Verwerkt~C(0)@p p@186L(2)|M*~Artikelen~C(0)@s250@'),FROM(Queue:Browse:1), |
  IMM,MSG('Browsing the Inkoop file')
                       BUTTON('Rapport'),AT(192,34),USE(?SjabloonButton)
                       BUTTON('Kopieer'),AT(282,34),USE(?KopieerButton)
                       BUTTON('&Toevoegen'),AT(9,34,65,14),USE(?Insert:3),LEFT,ICON('WAINSERT.ICO'),FLAT,MSG('Insert a Record'), |
  TIP('Insert a Record')
                       BUTTON('&Wijzigen'),AT(75,34,49,14),USE(?Change:3),LEFT,ICON('WACHANGE.ICO'),DEFAULT,FLAT, |
  MSG('Change the Record'),TIP('Change the Record')
                       BUTTON('&Verwijderen'),AT(127,34,61,14),USE(?Delete:3),LEFT,ICON('WADELETE.ICO'),FLAT,MSG('Delete the Record'), |
  TIP('Delete the Record')
                       SHEET,AT(4,4,556,188),USE(?CurrentTab)
                         TAB('&1) Onverwerkte inkopen'),USE(?Tab:2)
                         END
                         TAB('&2) Onverwerkte inkopen (zonder datum)'),USE(?TAB4)
                         END
                         TAB('&3) Onverwerkte inkopen gesorteerd op planning'),USE(?Tab:3)
                         END
                         TAB('&4) Onverwerkte inkopen per leverancier'),USE(?TAB1)
                           COMBO(@s50),AT(327,36,155,10),USE(AREL:FirmaNaam),DROP(25),FORMAT('200L(2)M~Firmanaam~C(0)@s250@'), |
  FROM(Queue:FileDropCombo),IMM
                           BUTTON('...'),AT(487,36,29,11),USE(?LookupLeverancier)
                         END
                         TAB('&5) Verwerkte inkopen'),USE(?TAB2)
                         END
                         TAB('&6) Verwerkte inkopen per leverancier'),USE(?TAB3)
                           COMBO(@s100),AT(328,35,168,11),USE(AARel:FirmaNaam),DROP(25),FORMAT('200L(2)|M~Firmanaa' & |
  'm~C(0)@s250@'),FROM(Queue:FileDropCombo:1),IMM
                           BUTTON('...'),AT(501,34,,12),USE(?LookupAleverancier)
                         END
                       END
                       BUTTON('&Sluiten'),AT(509,196,49,14),USE(?Close),LEFT,ICON('WACLOSE.ICO'),FLAT,MSG('Close Window'), |
  TIP('Close Window')
                       BUTTON('Weeglijst'),AT(4,196,71),USE(?WeeglijstButton)
                       BUTTON('Weeglijst (Excel)'),AT(79,196,80),USE(?WeeglijstExcelButton)
                       BUTTON('Sjabloon'),AT(237,34,43,14),USE(?SjabloonButton:2)
                       BUTTON('Ververs Scherm'),AT(419,197,79,14),USE(?RefreshButton),LEFT,ICON('REFRESH.ICO'),FLAT
                       BUTTON('Retour Rapport'),AT(325,34,60,14),USE(?SjabloonButton:3)
                       BUTTON('Inkoopbevestiging'),AT(389,34,60,14),USE(?Inkoopbevestiging)
                       BUTTON('Export naar Exact'),AT(163,196),USE(?ExportnaarExact)
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
TakeNewSelection       PROCEDURE(),BYTE,PROC,DERIVED
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
BRW1                 CLASS(BrowseClass)                    ! Browse using ?Browse:1
Q                      &Queue:Browse:1                !Reference to browse queue
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


  CODE
  GlobalResponse = ThisWindow.Run()                        ! Opens the window and starts an Accept Loop

!---------------------------------------------------------------------------
DefineListboxStyle ROUTINE
!|
!| This routine create all the styles to be shared in this window
!| It`s called after the window open
!|
!---------------------------------------------------------------------------
VulCurrentLeverancier       ROUTINE
    IF CHOICE(?CurrentTab) = 4 THEN
        LOC:CurrentLeverancier = Loc:Leverancier
    ELSIF CHOICE(?CurrentTab) = 6 THEN
        LOC:CurrentLeverancier = Loc:Leverancier2
    ELSE
        LOC:CurrentLeverancier = 0
    END

ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('BrowseInkoop')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  GLO:Inkoop_ThreadID = THREAD()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Browse:1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('LOC:NietVerwerkt',LOC:NietVerwerkt)                ! Added by: BrowseBox(ABC)
  BIND('Loc:Leverancier',Loc:Leverancier)                  ! Added by: BrowseBox(ABC)
  BIND('LOC:Verwerkt',LOC:Verwerkt)                        ! Added by: BrowseBox(ABC)
  BIND('Loc:Leverancier2',Loc:Leverancier2)                ! Added by: BrowseBox(ABC)
  BIND('Ink:InkoopID',Ink:InkoopID)                        ! Added by: BrowseBox(ABC)
  BIND('Loc:Artikelen',Loc:Artikelen)                      ! Added by: BrowseBox(ABC)
  BIND('LOC:Firmanaam2',LOC:Firmanaam2)                    ! Added by: FileDropCombo(ABC)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
  IF SELF.Request = SelectRecord
     SELF.AddItem(?Close,RequestCancelled)                 ! Add the close control to the window manger
  ELSE
     SELF.AddItem(?Close,RequestCompleted)                 ! Add the close control to the window manger
  END
  	LOC:Verwerkt = 1
  	LOC:NietVerwerkt = 0
  Relate:AARelatie.Open                                    ! File AARelatie used by this procedure, so make sure it's RelationManager is open
  Relate:AInkoop.Open                                      ! File AInkoop used by this procedure, so make sure it's RelationManager is open
  Relate:APlanning.Open                                    ! File APlanning used by this procedure, so make sure it's RelationManager is open
  Relate:ARelatie.Open                                     ! File ARelatie used by this procedure, so make sure it's RelationManager is open
  Relate:Inkoop.SetOpenRelated()
  Relate:Inkoop.Open                                       ! File Inkoop used by this procedure, so make sure it's RelationManager is open
  Relate:ViewArtikel.Open                                  ! File ViewArtikel used by this procedure, so make sure it's RelationManager is open
  Access:Planning.UseFile                                  ! File referenced in 'Other Files' so need to inform it's FileManager
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:Inkoop,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  0{Prop:Text}=CLIP(0{Prop:Text}) !& ' (' & CLIP(LEFT(FORMAT(GLO:Inkoop_ThreadID,@N_10))) & ')'
  WinAlertMouseZoom()
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1.FileLoaded = 1                                      ! This is a 'file loaded' browse
  BRW1.AddSortOrder(,Ink:Verwerkt_PlanningD_K)             ! Add the sort order for Ink:Verwerkt_PlanningD_K for sort order 1
  BRW1.AddLocator(BRW1::Sort5:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort5:Locator.Init(,Ink:Verwerkt,1,BRW1)           ! Initialize the browse locator using  using key: Ink:Verwerkt_PlanningD_K , Ink:Verwerkt
  BRW1.SetFilter('(Ink:Verwerkt = LOC:NietVerwerkt)')      ! Apply filter expression to browse
  BRW1.AddSortOrder(,Ink:Verwerkt_PlanningD_K)             ! Add the sort order for Ink:Verwerkt_PlanningD_K for sort order 2
  BRW1.SetFilter('(Ink:Verwerkt = LOC:NietVerwerkt AND Ink:Planning_DATE > DATE(1,1,1900))') ! Apply filter expression to browse
  BRW1.AddSortOrder(,Ink:Verwerkt_InkoopIDD_K)             ! Add the sort order for Ink:Verwerkt_InkoopIDD_K for sort order 3
  BRW1.SetFilter('(Ink:Verwerkt = LOC:NietVerwerkt AND Ink:Leverancier = Loc:Leverancier)') ! Apply filter expression to browse
  BRW1.AddResetField(Loc:Leverancier)                      ! Apply the reset field
  BRW1.AddSortOrder(,Ink:Verwerkt_PlanningD_K)             ! Add the sort order for Ink:Verwerkt_PlanningD_K for sort order 4
  BRW1.SetFilter('(Ink:Verwerkt = LOC:Verwerkt)')          ! Apply filter expression to browse
  BRW1.AddSortOrder(,Ink:Verwerkt_PlanningD_K)             ! Add the sort order for Ink:Verwerkt_PlanningD_K for sort order 5
  BRW1.SetFilter('(Ink:Verwerkt = LOC:Verwerkt AND Ink:Leverancier = Loc:Leverancier2)') ! Apply filter expression to browse
  BRW1.AddResetField(Loc:Leverancier2)                     ! Apply the reset field
  BRW1.AddSortOrder(,Ink:Verwerkt_InkoopIDD_K)             ! Add the sort order for Ink:Verwerkt_InkoopIDD_K for sort order 6
  BRW1.SetFilter('(Ink:Verwerkt = LOC:NietVerwerkt)')      ! Apply filter expression to browse
  ?Browse:1{PROP:IconList,1} = '~off.ico'
  ?Browse:1{PROP:IconList,2} = '~on.ico'
  BRW1.AddField(Ink:InkoopID,BRW1.Q.Ink:InkoopID)          ! Field Ink:InkoopID is a hot field or requires assignment from browse
  BRW1.AddField(Rel:FirmaNaam,BRW1.Q.Rel:FirmaNaam)        ! Field Rel:FirmaNaam is a hot field or requires assignment from browse
  BRW1.AddField(Ink:Planning_DATE,BRW1.Q.Ink:Planning_DATE) ! Field Ink:Planning_DATE is a hot field or requires assignment from browse
  BRW1.AddField(Ink:Planning_TIME,BRW1.Q.Ink:Planning_TIME) ! Field Ink:Planning_TIME is a hot field or requires assignment from browse
  BRW1.AddField(Ink:Verwerkt,BRW1.Q.Ink:Verwerkt)          ! Field Ink:Verwerkt is a hot field or requires assignment from browse
  BRW1.AddField(Loc:Artikelen,BRW1.Q.Loc:Artikelen)        ! Field Loc:Artikelen is a hot field or requires assignment from browse
  BRW1.AddField(Ink:Leverancier,BRW1.Q.Ink:Leverancier)    ! Field Ink:Leverancier is a hot field or requires assignment from browse
  BRW1.AddField(Ink:Planning,BRW1.Q.Ink:Planning)          ! Field Ink:Planning is a hot field or requires assignment from browse
  BRW1.AddField(Rel:RelatieID,BRW1.Q.Rel:RelatieID)        ! Field Rel:RelatieID is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('BrowseInkoop',QuickWindow)                 ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  BRW1.AskProcedure = 1                                    ! Will call: UpdateInkoop((LOC:CurrentLeverancier))
  FDCB5.Init(AREL:FirmaNaam,?AREL:FirmaNaam,Queue:FileDropCombo.ViewPosition,FDCB5::View:FileDropCombo,Queue:FileDropCombo,Relate:ARelatie,ThisWindow,GlobalErrors,0,0,0)
  FDCB5.RemoveDuplicatesFlag = TRUE
  FDCB5.Q &= Queue:FileDropCombo
  FDCB5.AddSortOrder(AREL:Relatie_FK01)
  FDCB5.SetFilter('AREL:Type=''S''')
  FDCB5.AddField(LOC:Firmanaam,FDCB5.Q.LOC:Firmanaam) !List box control field - type derived from local data
  FDCB5.AddField(AREL:FirmaNaam,FDCB5.Q.AREL:FirmaNaam) !Browse hot field - type derived from field
  FDCB5.AddField(AREL:Type,FDCB5.Q.AREL:Type) !Browse hot field - type derived from field
  FDCB5.AddUpdateField(AREL:RelatieID,Loc:Leverancier)
  ThisWindow.AddItem(FDCB5.WindowComponent)
  FDCB5.DefaultFill = 0
  FDCB2.Init(AARel:FirmaNaam,?AARel:FirmaNaam,Queue:FileDropCombo:1.ViewPosition,FDCB2::View:FileDropCombo,Queue:FileDropCombo:1,Relate:AARelatie,ThisWindow,GlobalErrors,0,0,0)
  FDCB2.RemoveDuplicatesFlag = TRUE
  FDCB2.Q &= Queue:FileDropCombo:1
  FDCB2.AddSortOrder(AARel:Relatie_FK01)
  FDCB2.SetFilter('AARel:Type=''S''')
  FDCB2.AddField(LOC:Firmanaam2,FDCB2.Q.LOC:Firmanaam2) !List box control field - type derived from local data
  FDCB2.AddField(AARel:FirmaNaam,FDCB2.Q.AARel:FirmaNaam) !Browse hot field - type derived from field
  FDCB2.AddField(AARel:Type,FDCB2.Q.AARel:Type) !Browse hot field - type derived from field
  FDCB2.AddUpdateField(AARel:RelatieID,Loc:Leverancier2)
  ThisWindow.AddItem(FDCB2.WindowComponent)
  FDCB2.DefaultFill = 0
  SELF.SetAlerts()
  NetLocalRefreshDate = today()         ! NetTalk (NetRefresh)
  NetLocalRefreshTime = clock()
  EnterByTabManager.Init(False)
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  GLO:Inkoop_ThreadID = 0
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:AARelatie.Close
    Relate:AInkoop.Close
    Relate:APlanning.Close
    Relate:ARelatie.Close
    Relate:Inkoop.Close
    Relate:ViewArtikel.Close
  END
  IF SELF.Opened
    INIMgr.Update('BrowseInkoop',QuickWindow)              ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.Reset PROCEDURE(BYTE Force=0)

  CODE
  FREE(InkoopArtikelQueue)
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
    UpdateInkoop((LOC:CurrentLeverancier))
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
    OF ?SjabloonButton
      Get(BRW1.Q,Choice(?Browse:1))
      CLEAR(Ink:Record)
      Ink:InkoopID = BRW1.Q.Ink:InkoopID
      IF (Access:Inkoop.TryFetch(Ink:PK_Inkoop) <> Level:Benign)
      	RETURN ReturnValue
      .
      
      ReportInkoop(Ink:InkoopID, FALSE)
    OF ?LookupAleverancier
      	AREL:FirmaNaam=AARel:FirmaNaam
    OF ?WeeglijstButton
      Get(BRW1.Q,Choice(?Browse:1))
      ReportWeeglijst('Inkoop', BRW1.Q.Ink:InkoopID)
    OF ?SjabloonButton:3
      Get(BRW1.Q,Choice(?Browse:1))
      CLEAR(Ink:Record)
      Ink:InkoopID = BRW1.Q.Ink:InkoopID
      IF (Access:Inkoop.TryFetch(Ink:PK_Inkoop) <> Level:Benign)
      	RETURN ReturnValue
      .
      
      ReportInkoop(Ink:InkoopID, TRUE)
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?KopieerButton
      ThisWindow.Update()
      ! Kopieren
      GLO:GebruikerLogHandelingOpmerking = 'Kopieren Inkoop'
      
      Get(BRW1.Q,Choice(?Browse:1))
      
      CLEAR(AInk:Record)
      AInk:InkoopID = BRW1.Q.Ink:InkoopID
      IF (Access:AInkoop.TryFetch(AInk:PK_Inkoop) = Level:Benign)
      	Access:Inkoop.PrimeRecord(false)
      	Ink:Leverancier=AInk:Leverancier
      	!Ink:Planning_DATE=today()
          !Uitgeschakeld 18-4-2017
      	!Ink:Planning_DATE=AInk:Planning_DATE
      	!Ink:Planning_TIME=AInk:Planning_TIME
      	Ink:Instructie=CLIP(AInk:Instructie)
      	Ink:Transport=CLIP(AInk:Transport)
      	Ink:LeverancierAlternatiefAdres=AInk:LeverancierAlternatiefAdres
      	Ink:TransportKosten=AInk:TransportKosten
      	Ink:ExtraKosten=AInk:ExtraKosten
      	Ink:ExtraKostenTekst=CLIP(AInk:ExtraKostenTekst)
          IF Access:Inkoop.TryInsert() = Level:Benign
              GLO:TimingMeting[1] = CLOCK() - timingmeting#
              
      		CLEAR(APla:Record)
      		APla:InkoopID =	AInk:InkoopID
      		SET(APla:Planning_FK01, APla:Planning_FK01)
      		LOOP
      			Access:APlanning.TryNext()
      			IF ERROR() THEN BREAK.
      			IF APla:InkoopID <> AInk:InkoopID THEN BREAK.
      			
      			Access:Planning.PrimeRecord(false)
      			Pla:InkoopID = Ink:InkoopID
      			Pla:ArtikelID = CLIP(APla:ArtikelID)
      			Pla:KG = APla:KG
      			Pla:Pallets = APla:Pallets
      			Pla:VerpakkingID = APla:VerpakkingID
      			Pla:CelID = APla:CelID
      			Pla:Memo = CLIP(APla:Memo)
      			Pla:Instructie = CLIP(APla:Instructie)
      			Pla:Transport = CLIP(APla:Transport)
      			Pla:InkoopKGPrijs = APla:InkoopKGPrijs
      			Pla:VerkoopKGPrijs = APla:VerkoopKGPrijs
      			Access:Planning.TryInsert()
              .
              
              GLO:TimingMeting[2] = CLOCK() - timingmeting# - GLO:TimingMeting[1]
      		
      		Access:Inkoop.TryFetch(Ink:PK_Inkoop)
      		inkoopid# = Ink:InkoopID
      		
      		GlobalRequest = ChangeRecord
      		UpdateInkoop()
      
      		IF GlobalResponse = RequestCancelled THEN
      !			CLEAR(Pla:Record)
      !			Pla:InkoopID = inkoopid#
      !			SET(Pla:Planning_FK01, Pla:Planning_FK01)
      !			LOOP
      !				Access:Planning.Next()
      !				IF ERROR() THEN BREAK.
      !				IF Pla:InkoopID <> inkoopid# THEN BREAK.
      !				
      !				db.DebugOut('Verwijderen planning:' & Pla:PlanningID)
      !				Access:Planning.DeleteRecord(false)
      !			.
      			
      			CLEAR(Ink:Record)
      			Ink:InkoopID = inkoopid#
      			Access:Inkoop.TryFetch(Ink:PK_Inkoop)
      			Relate:Inkoop.Delete(false) ! Ook planning-records meenemen
      		ELSE
      			NetRefreshPlanningViews()
      			GLO:TimingMeting[3] = CLOCK() - timingmeting# - GLO:TimingMeting[2]
      			ThisWindow.Reset(1)
      			GLO:TimingMeting[4] = CLOCK() - timingmeting# - GLO:TimingMeting[3]
      			! ERVOOR ZORGEN DAT DE ORIGINELE REGEL WEER GESELECTEERD WORDT
      			LOOP I#=1 TO RECORDS(BRW1.Q)
      				GET(BRW1.Q,I#)
      				IF BRW1.Q.Ink:InkoopID = inkoopid#
      					SELECT(?Browse:1,I#)
      					BREAK
      				END
      			END
              .
      	ELSE
      		MESSAGE('Inkoop kon niet gekopieerd worden.' & ERRORCODE())
      	.
      .
      
      GLO:GebruikerLogHandelingOpmerking = ''
    OF ?CurrentTab
      ! Omdat het nu met filters werkt ipv range wordt de leverancier niet meer standaard ingevuld.
      DO VulCurrentLeverancier
    OF ?LookupLeverancier
      ThisWindow.Update()
      GlobalRequest = SelectRecord
      SelectArelatie('S')
      ThisWindow.Reset
      	if globalresponse=RequestCompleted
      		Loc:Leverancier = AREL:RelatieID
              FDCB5.ResetQueue(True)
              
              DO VulCurrentLeverancier
      	END
      		
    OF ?LookupAleverancier
      ThisWindow.Update()
      GlobalRequest = SelectRecord
      SelectArelatie('S')
      ThisWindow.Reset
      	if globalresponse=RequestCompleted
      		Loc:Leverancier2 = AREL:RelatieID
              FDCB2.ResetQueue(True)
              
              DO VulCurrentLeverancier
      	END
    OF ?WeeglijstExcelButton
      ThisWindow.Update()
      Get(BRW1.Q,Choice(?Browse:1))
      ReportWeeglijstExcel('Inkoop', BRW1.Q.Ink:InkoopID)
    OF ?SjabloonButton:2
      ThisWindow.Update()
      WindowCallSjabloon('Inkoop',Ink:InkoopID)
      ThisWindow.Reset
    OF ?RefreshButton
      ThisWindow.Update()
      ThisWindow.Reset(1)
    OF ?Inkoopbevestiging
      ThisWindow.Update()
      ReportInkoopBevestiging(Ink:InkoopID)
      ThisWindow.Reset
    OF ?ExportnaarExact
      ThisWindow.Update()
      ExportInvoiceXML(,Ink:Record, 'PurchaseOrder')
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
      ! Omdat het nu met filters werkt ipv range wordt de leverancier niet meer standaard ingevuld.
      DO VulCurrentLeverancier
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
      	!.	
      	!ELSIF NotifyCode# = 2
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


BRW1.Ask PROCEDURE(BYTE Request)

ReturnValue          BYTE,AUTO

  CODE
  IF Request = ChangeRecord AND Ink:Verwerkt AND IGB:Administrator=0 THEN
    ! Request = ViewRecord         ! weer geactiveerd op 2018-1-29 omdat de verwerkte inkoop+verkoop aangepast kunnen worden
      ! Uitgezet op 16 maart omdat de prijzen wel nog aangepast mogen worden
  ELSIF Request = DeleteRecord AND Ink:Verwerkt THEN
      MESSAGE('Geplande inkoop is al verwerkt. Kan dus niet meer verwijderd worden.', 'Al uitgevoerd', ICON:Exclamation)
      RETURN Level:Benign
  END
  ReturnValue = PARENT.Ask(Request)
  IF ReturnValue = RequestCompleted THEN
    !  ThisWindow.Reset(1)                   ! deze kan ik uitschakelen omdat de refresh ook al door de form wordt uitgevoerd via netrefresh
  END
  RETURN ReturnValue


BRW1.Fetch PROCEDURE(BYTE Direction)

GreenBarIndex   LONG,AUTO
  CODE
  PARENT.Fetch(Direction)
  !----------------------------------------------------------------------
    LOOP GreenBarIndex=1 TO RECORDS(SELF.Q)
      GET(SELF.Q,GreenBarIndex)
      SELF.Q.Ink:InkoopID_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for Ink:InkoopID
      SELF.Q.Ink:InkoopID_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.Ink:InkoopID_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Ink:InkoopID_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Rel:FirmaNaam_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for Rel:FirmaNaam
      SELF.Q.Rel:FirmaNaam_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.Rel:FirmaNaam_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Rel:FirmaNaam_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Ink:Planning_DATE_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for Ink:Planning_DATE
      SELF.Q.Ink:Planning_DATE_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.Ink:Planning_DATE_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Ink:Planning_DATE_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Ink:Planning_TIME_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for Ink:Planning_TIME
      SELF.Q.Ink:Planning_TIME_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.Ink:Planning_TIME_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Ink:Planning_TIME_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Ink:Verwerkt_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for Ink:Verwerkt
      SELF.Q.Ink:Verwerkt_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.Ink:Verwerkt_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Ink:Verwerkt_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Loc:Artikelen_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for Loc:Artikelen
      SELF.Q.Loc:Artikelen_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.Loc:Artikelen_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Loc:Artikelen_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
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
  DO VulCurrentLeverancier	
  
  
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
  ELSE
    RETURN SELF.SetSort(6,Force)
  END
  ReturnValue = PARENT.ResetSort(Force)
  RETURN ReturnValue


BRW1.SetQueueRecord PROCEDURE

  CODE
  LOC:Artikelen = CachingClass.GetInkoopArtikelen(Ink:InkoopID)
  PARENT.SetQueueRecord
  
  IF (Ink:Verwerkt)
    SELF.Q.Ink:Verwerkt_Icon = 2                           ! Set icon from icon list
  ELSE
    SELF.Q.Ink:Verwerkt_Icon = 1                           ! Set icon from icon list
  END
  !----------------------------------------------------------------------
      SELF.Q.Ink:InkoopID_NormalFG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1) ! Set color values for Ink:InkoopID
      SELF.Q.Ink:InkoopID_NormalBG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,8454143)
      SELF.Q.Ink:InkoopID_SelectedFG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.Ink:InkoopID_SelectedBG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.Rel:FirmaNaam_NormalFG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1) ! Set color values for Rel:FirmaNaam
      SELF.Q.Rel:FirmaNaam_NormalBG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,8454143)
      SELF.Q.Rel:FirmaNaam_SelectedFG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.Rel:FirmaNaam_SelectedBG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.Ink:Planning_DATE_NormalFG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1) ! Set color values for Ink:Planning_DATE
      SELF.Q.Ink:Planning_DATE_NormalBG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,8454143)
      SELF.Q.Ink:Planning_DATE_SelectedFG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.Ink:Planning_DATE_SelectedBG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.Ink:Planning_TIME_NormalFG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1) ! Set color values for Ink:Planning_TIME
      SELF.Q.Ink:Planning_TIME_NormalBG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,8454143)
      SELF.Q.Ink:Planning_TIME_SelectedFG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.Ink:Planning_TIME_SelectedBG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.Ink:Verwerkt_NormalFG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1) ! Set color values for Ink:Verwerkt
      SELF.Q.Ink:Verwerkt_NormalBG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,8454143)
      SELF.Q.Ink:Verwerkt_SelectedFG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.Ink:Verwerkt_SelectedBG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.Loc:Artikelen_NormalFG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1) ! Set color values for Loc:Artikelen
      SELF.Q.Loc:Artikelen_NormalBG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,8454143)
      SELF.Q.Loc:Artikelen_SelectedFG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.Loc:Artikelen_SelectedBG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
  !----------------------------------------------------------------------


BRW1.ValidateRecord PROCEDURE

ReturnValue          BYTE,AUTO

BRW1::RecordStatus   BYTE,AUTO
  CODE
  ReturnValue = PARENT.ValidateRecord()
  IF Ink:Leverancier = 0 THEN RETURN Record:Filtered. ! Records die een andere gebruiker aan het toevoegen is, niet tonen.
  
  IF CHOICE(?CurrentTab) = 2
      IF Ink:Planning_DATE > DATE(1,1,1900) THEN
          RETURN Record:Filtered
      END
  END
  BRW1::RecordStatus=ReturnValue
  RETURN ReturnValue


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window
  SELF.SetStrategy(?Insert:3, Resize:FixLeft+Resize:FixTop, Resize:LockSize) ! Override strategy for ?Insert:3
  SELF.SetStrategy(?Change:3, Resize:FixLeft+Resize:FixTop, Resize:LockSize) ! Override strategy for ?Change:3
  SELF.SetStrategy(?Delete:3, Resize:FixLeft+Resize:FixTop, Resize:LockSize) ! Override strategy for ?Delete:3
  SELF.SetStrategy(?AREL:FirmaNaam, Resize:FixLeft+Resize:FixTop, Resize:LockSize) ! Override strategy for ?AREL:FirmaNaam
  SELF.SetStrategy(?AARel:FirmaNaam, Resize:FixLeft+Resize:FixTop, Resize:LockSize) ! Override strategy for ?AARel:FirmaNaam
  SELF.SetStrategy(?WeeglijstButton, Resize:FixLeft+Resize:FixBottom, Resize:LockSize) ! Override strategy for ?WeeglijstButton
  SELF.SetStrategy(?SjabloonButton, Resize:FixLeft+Resize:FixTop, Resize:LockSize) ! Override strategy for ?SjabloonButton
  SELF.SetStrategy(?KopieerButton, Resize:FixLeft+Resize:FixTop, Resize:LockSize) ! Override strategy for ?KopieerButton
  SELF.SetStrategy(?SjabloonButton:2, Resize:FixLeft+Resize:FixTop, Resize:LockSize) ! Override strategy for ?SjabloonButton:2
  SELF.SetStrategy(?RefreshButton, Resize:FixRight+Resize:FixBottom, Resize:LockSize) ! Override strategy for ?RefreshButton


FDCB5.SetQueueRecord PROCEDURE

  CODE
  	i#=INSTRING('<39>',AREL:FirmaNaam,1,1)
  	IF i#
  		Loc:Firmanaam = Sub(AREL:FirmaNaam,1,i#-1)&SUB(AREL:FirmaNaam,i#+1,51)
  	ELSE
  		Loc:Firmanaam = AREL:FirmaNaam
  	END
  PARENT.SetQueueRecord
  


FDCB2.SetQueueRecord PROCEDURE

  CODE
  	i#=INSTRING('<39>',AAREL:FirmaNaam,1,1)
  	IF i#
  		Loc:Firmanaam2 = Sub(AAREL:FirmaNaam,1,i#-1)&SUB(AAREL:FirmaNaam,i#+1,51)
  	ELSE
  		Loc:Firmanaam2 = AAREL:FirmaNaam
  	END
  PARENT.SetQueueRecord
  

