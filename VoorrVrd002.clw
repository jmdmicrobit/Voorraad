

   MEMBER('VoorrVrd.clw')                                  ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABPOPUP.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('VOORRVRD002.INC'),ONCE        !Local module procedure declarations
                     END


!!! <summary>
!!! Generated from procedure template - Window
!!! Browse the VoorraadVerloop file
!!! </summary>
BrowseVoorraadVerloopPerPartij PROCEDURE (ArtikelID, PartijID)

LOC:ArtikelID        CSTRING(31)                           ! 
LOC:LeverancierID    LONG                                  ! 
LOC:Klant            STRING(40)                            ! 
LOC:EINFilter        STRING(10)                            ! 
LOC:EOUTFilter       STRING(10)                            ! 
LOC:HandmatigTonen   BYTE                                  ! 
LOC:PartijID         LONG                                  ! 
LOC:Leverancier      STRING(50)                            ! 
CurrentTab           STRING(80)                            ! 
LOC:TotaalKG         REAL                                  ! 
LOC:TotaalPallets    LONG                                  ! 
LOC:VerpakkingOmschrijving STRING(30)                      ! 
LOC:SoortMutatieFilter LONG                                ! 
LOC:TotaalInslagKG   DECIMAL(12,2)                         ! 
LOC:TotaalUitslagKG  DECIMAL(12,2)                         ! 
LOC:LeverancierSaldoQueue QUEUE,PRE(LSD)                   ! 
MutatieID            LONG                                  ! 
KG                   DECIMAL(9,2)                          ! 
Pallets              LONG                                  ! 
                     END                                   ! 
LOC:SaldoQueue       QUEUE,PRE(SLD)                        ! 
MutatieID            LONG                                  ! 
KG                   DECIMAL(11,2)                         ! 
Pallets              LONG                                  ! 
                     END                                   ! 
LOC:HSaldoQueue      QUEUE,PRE(HSLD)                       ! 
MutatieID            LONG                                  ! 
KG                   DECIMAL(11,2)                         ! 
Pallets              LONG                                  ! 
                     END                                   ! 
LOC:PartijSaldoQueue QUEUE,PRE(PSLD)                       ! 
MutatieID            LONG                                  ! 
KG                   DECIMAL(11,2)                         ! 
Pallets              LONG                                  ! 
                     END                                   ! 
LOC:PrijsKG          DECIMAL(10,3)                         ! 
BRW1::View:Browse    VIEW(VoorraadVerloop)
                       PROJECT(VVL:DatumTijd_DATE)
                       PROJECT(VVL:DatumTijd_TIME)
                       PROJECT(VVL:CelOms)
                       PROJECT(VVL:Locatienaam)
                       PROJECT(VVL:SoortMutatie)
                       PROJECT(VVL:PartijID)
                       PROJECT(VVL:ExternPartijnr)
                       PROJECT(VVL:InslagKG)
                       PROJECT(VVL:BerekendeInkoopKGPrijs)
                       PROJECT(VVL:UitslagKG)
                       PROJECT(VVL:VerkoopKGPrijs)
                       PROJECT(VVL:PlanningID)
                       PROJECT(VVL:InkoopID)
                       PROJECT(VVL:VerkoopID)
                       PROJECT(VVL:MutatieID)
                       PROJECT(VVL:VerkoopRelatie)
                       PROJECT(VVL:InkoopRelatie)
                       PROJECT(VVL:VerpakkingOmschrijving)
                       PROJECT(VVL:PartijRelatie)
                       PROJECT(VVL:PartijLeverancier)
                       PROJECT(VVL:ArtikelID)
                       PROJECT(VVL:DatumTijd)
                       PROJECT(VVL:CelID)
                       JOIN(CEL:CEL_PK,VVL:CelID)
                         PROJECT(CEL:CelID)
                       END
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
VVL:DatumTijd_DATE     LIKE(VVL:DatumTijd_DATE)       !List box control field - type derived from field
VVL:DatumTijd_DATE_NormalFG LONG                      !Normal forground color
VVL:DatumTijd_DATE_NormalBG LONG                      !Normal background color
VVL:DatumTijd_DATE_SelectedFG LONG                    !Selected forground color
VVL:DatumTijd_DATE_SelectedBG LONG                    !Selected background color
VVL:DatumTijd_TIME     LIKE(VVL:DatumTijd_TIME)       !List box control field - type derived from field
VVL:DatumTijd_TIME_NormalFG LONG                      !Normal forground color
VVL:DatumTijd_TIME_NormalBG LONG                      !Normal background color
VVL:DatumTijd_TIME_SelectedFG LONG                    !Selected forground color
VVL:DatumTijd_TIME_SelectedBG LONG                    !Selected background color
LOC:Klant              LIKE(LOC:Klant)                !List box control field - type derived from local data
LOC:Klant_NormalFG     LONG                           !Normal forground color
LOC:Klant_NormalBG     LONG                           !Normal background color
LOC:Klant_SelectedFG   LONG                           !Selected forground color
LOC:Klant_SelectedBG   LONG                           !Selected background color
LOC:Leverancier        LIKE(LOC:Leverancier)          !List box control field - type derived from local data
LOC:Leverancier_NormalFG LONG                         !Normal forground color
LOC:Leverancier_NormalBG LONG                         !Normal background color
LOC:Leverancier_SelectedFG LONG                       !Selected forground color
LOC:Leverancier_SelectedBG LONG                       !Selected background color
LOC:VerpakkingOmschrijving LIKE(LOC:VerpakkingOmschrijving) !List box control field - type derived from local data
LOC:VerpakkingOmschrijving_NormalFG LONG              !Normal forground color
LOC:VerpakkingOmschrijving_NormalBG LONG              !Normal background color
LOC:VerpakkingOmschrijving_SelectedFG LONG            !Selected forground color
LOC:VerpakkingOmschrijving_SelectedBG LONG            !Selected background color
VVL:CelOms             LIKE(VVL:CelOms)               !List box control field - type derived from field
VVL:CelOms_NormalFG    LONG                           !Normal forground color
VVL:CelOms_NormalBG    LONG                           !Normal background color
VVL:CelOms_SelectedFG  LONG                           !Selected forground color
VVL:CelOms_SelectedBG  LONG                           !Selected background color
VVL:Locatienaam        LIKE(VVL:Locatienaam)          !List box control field - type derived from field
VVL:Locatienaam_NormalFG LONG                         !Normal forground color
VVL:Locatienaam_NormalBG LONG                         !Normal background color
VVL:Locatienaam_SelectedFG LONG                       !Selected forground color
VVL:Locatienaam_SelectedBG LONG                       !Selected background color
VVL:SoortMutatie       LIKE(VVL:SoortMutatie)         !List box control field - type derived from field
VVL:SoortMutatie_NormalFG LONG                        !Normal forground color
VVL:SoortMutatie_NormalBG LONG                        !Normal background color
VVL:SoortMutatie_SelectedFG LONG                      !Selected forground color
VVL:SoortMutatie_SelectedBG LONG                      !Selected background color
VVL:PartijID           LIKE(VVL:PartijID)             !List box control field - type derived from field
VVL:PartijID_NormalFG  LONG                           !Normal forground color
VVL:PartijID_NormalBG  LONG                           !Normal background color
VVL:PartijID_SelectedFG LONG                          !Selected forground color
VVL:PartijID_SelectedBG LONG                          !Selected background color
VVL:ExternPartijnr     LIKE(VVL:ExternPartijnr)       !List box control field - type derived from field
VVL:ExternPartijnr_NormalFG LONG                      !Normal forground color
VVL:ExternPartijnr_NormalBG LONG                      !Normal background color
VVL:ExternPartijnr_SelectedFG LONG                    !Selected forground color
VVL:ExternPartijnr_SelectedBG LONG                    !Selected background color
VVL:InslagKG           LIKE(VVL:InslagKG)             !List box control field - type derived from field
VVL:InslagKG_NormalFG  LONG                           !Normal forground color
VVL:InslagKG_NormalBG  LONG                           !Normal background color
VVL:InslagKG_SelectedFG LONG                          !Selected forground color
VVL:InslagKG_SelectedBG LONG                          !Selected background color
VVL:BerekendeInkoopKGPrijs LIKE(VVL:BerekendeInkoopKGPrijs) !List box control field - type derived from field
VVL:BerekendeInkoopKGPrijs_NormalFG LONG              !Normal forground color
VVL:BerekendeInkoopKGPrijs_NormalBG LONG              !Normal background color
VVL:BerekendeInkoopKGPrijs_SelectedFG LONG            !Selected forground color
VVL:BerekendeInkoopKGPrijs_SelectedBG LONG            !Selected background color
VVL:UitslagKG          LIKE(VVL:UitslagKG)            !List box control field - type derived from field
VVL:UitslagKG_NormalFG LONG                           !Normal forground color
VVL:UitslagKG_NormalBG LONG                           !Normal background color
VVL:UitslagKG_SelectedFG LONG                         !Selected forground color
VVL:UitslagKG_SelectedBG LONG                         !Selected background color
VVL:VerkoopKGPrijs     LIKE(VVL:VerkoopKGPrijs)       !List box control field - type derived from field
VVL:VerkoopKGPrijs_NormalFG LONG                      !Normal forground color
VVL:VerkoopKGPrijs_NormalBG LONG                      !Normal background color
VVL:VerkoopKGPrijs_SelectedFG LONG                    !Selected forground color
VVL:VerkoopKGPrijs_SelectedBG LONG                    !Selected background color
LOC:TotaalKG           LIKE(LOC:TotaalKG)             !List box control field - type derived from local data
LOC:TotaalKG_NormalFG  LONG                           !Normal forground color
LOC:TotaalKG_NormalBG  LONG                           !Normal background color
LOC:TotaalKG_SelectedFG LONG                          !Selected forground color
LOC:TotaalKG_SelectedBG LONG                          !Selected background color
LOC:TotaalKG_Style     LONG                           !Field style
VVL:PlanningID         LIKE(VVL:PlanningID)           !List box control field - type derived from field
VVL:PlanningID_NormalFG LONG                          !Normal forground color
VVL:PlanningID_NormalBG LONG                          !Normal background color
VVL:PlanningID_SelectedFG LONG                        !Selected forground color
VVL:PlanningID_SelectedBG LONG                        !Selected background color
VVL:InkoopID           LIKE(VVL:InkoopID)             !List box control field - type derived from field
VVL:InkoopID_NormalFG  LONG                           !Normal forground color
VVL:InkoopID_NormalBG  LONG                           !Normal background color
VVL:InkoopID_SelectedFG LONG                          !Selected forground color
VVL:InkoopID_SelectedBG LONG                          !Selected background color
VVL:VerkoopID          LIKE(VVL:VerkoopID)            !List box control field - type derived from field
VVL:VerkoopID_NormalFG LONG                           !Normal forground color
VVL:VerkoopID_NormalBG LONG                           !Normal background color
VVL:VerkoopID_SelectedFG LONG                         !Selected forground color
VVL:VerkoopID_SelectedBG LONG                         !Selected background color
VVL:MutatieID          LIKE(VVL:MutatieID)            !List box control field - type derived from field
VVL:MutatieID_NormalFG LONG                           !Normal forground color
VVL:MutatieID_NormalBG LONG                           !Normal background color
VVL:MutatieID_SelectedFG LONG                         !Selected forground color
VVL:MutatieID_SelectedBG LONG                         !Selected background color
LOC:TotaalPallets      LIKE(LOC:TotaalPallets)        !Browse hot field - type derived from local data
VVL:VerkoopRelatie     LIKE(VVL:VerkoopRelatie)       !Browse hot field - type derived from field
VVL:InkoopRelatie      LIKE(VVL:InkoopRelatie)        !Browse hot field - type derived from field
VVL:VerpakkingOmschrijving LIKE(VVL:VerpakkingOmschrijving) !Browse hot field - type derived from field
VVL:PartijRelatie      LIKE(VVL:PartijRelatie)        !Browse hot field - type derived from field
VVL:PartijLeverancier  LIKE(VVL:PartijLeverancier)    !Browse hot field - type derived from field
VVL:ArtikelID          LIKE(VVL:ArtikelID)            !Browse key field - type derived from field
VVL:DatumTijd          LIKE(VVL:DatumTijd)            !Browse key field - type derived from field
CEL:CelID              LIKE(CEL:CelID)                !Related join file key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
LocEnableEnterByTab  BYTE(1)                               !Used by the ENTER Instead of Tab template
EnterByTabManager    EnterByTabClass
NetLocalRefreshDate     Long     ! NetTalk (NetRefresh)
NetLocalRefreshTime     Long
NetLocalDependancies    String('|VoorraadVerloop|Cel|')
QuickWindow          WINDOW('Partij voorraad-verloop'),AT(,,586,306),FONT('MS Sans Serif',8,,FONT:regular,CHARSET:DEFAULT), |
  RESIZE,CENTER,GRAY,IMM,MAX,MDI,HLP('BrowseVoorraadVerloop'),SYSTEM
                       LIST,AT(9,37,570,229),USE(?Browse:1),HVSCROLL,FORMAT('[50R(2)|M*@d6-@80R(2)|M*@t7@](75)' & |
  '|~Datum~81L|M*~Klant~C(0)@s40@75L(2)|M*~Leverancier~C(0)@s50@79L(2)|M*~Verpakking~C(' & |
  '0)@s30@[30L(2)|M*~Cel~C(0)@s50@30L(2)|M*~Locatie~C(0)@s50@]|~Cel~24C|M*~Type~@s4@[39' & |
  'R(2)|M*~Intern~C(0)@n-_14@60R(2)|M*~Extern~C(0)@s20@](82)|~Partijnummer~[56R(2)|M*~K' & |
  'G~C(0)@n-15`2B@60R(2)|M*~KG-Prijs~C(0)@n13`3B@/](110)|~Inslag~[55R(2)|M*~KG~C(0)@n-1' & |
  '5`2B@60R(2)|M*~KG Prijs~C(0)@n-14`3B@](108)|~Uitslag~[50R(2)|M*Y~KG~C(0)@n-13`2@](52' & |
  ')|~Saldo~50R(2)|M*~Planning-ID~C(0)@n_10B@50R(2)|M*~Inkoop-ID~C(0)@n_10B@50R(2)|M*~V' & |
  'erkoop-ID~C(0)@n_10B@60R(2)|M*~Mutatie ID~C(0)@n_10B@'),FROM(Queue:Browse:1),IMM,MSG('Browsing t' & |
  'he VoorraadVerloop file')
                       SHEET,AT(4,18,580,265),USE(?CurrentTab)
                         TAB('&1) Alle'),USE(?Tab:2)
                           PROMPT('Totaal Inslag (KG):'),AT(335,269),USE(?LOC:TotaalInslagKG:Prompt)
                           PROMPT('Totaal Uitslag (KG)'),AT(459,269),USE(?LOC:TotaalUitslagKG:Prompt)
                           STRING(@N-15`2),AT(522,269),USE(LOC:TotaalUitslagKG,,?LOC:TotaalUitslagKG:2),RIGHT
                           STRING(@N-15`2),AT(394,269),USE(LOC:TotaalInslagKG,,?LOC:TotaalInslagKG:2),RIGHT
                         END
                       END
                       BUTTON('&Close'),AT(533,284,49,14),USE(?Close),LEFT,ICON('WACLOSE.ICO'),FLAT,MSG('Close Window'), |
  TIP('Close Window')
                       ENTRY(@s30),AT(37,2,122,10),USE(LOC:ArtikelID),DISABLE,REQ
                       PROMPT('Artikel:'),AT(7,1,26,13),USE(?ArtikelPrompt)
                       BUTTON('Overboeking plannen'),AT(5,286,92),USE(?Overboeken)
                       STRING(@S50),AT(167,3,236),USE(Art:ArtikelOms),FONT('Microsoft Sans Serif',,,FONT:bold,CHARSET:ANSI)
                       BUTTON('Handmatige correctie'),AT(101,286,83),USE(?HandmatigeCorrectie)
                       PROMPT('Filter:'),AT(472,6),USE(?LOC:SoortMutatieFilter:Prompt)
                       LIST,AT(493,4,78,12),USE(LOC:SoortMutatieFilter,,?LOC:SoortMutatieFilter:2),RIGHT(1),DROP(5), |
  FROM('Alle|#0|Inslag|#1|IN|#2|Uitslag|#3|UIT|#4')
                     END

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
ApplyRange             PROCEDURE(),BYTE,PROC,DERIVED
Fetch                  PROCEDURE(BYTE Direction),DERIVED
ResetFromView          PROCEDURE(),DERIVED
SetQueueRecord         PROCEDURE(),DERIVED
                     END

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
  !------------------------------------
  !Style for ?Browse:1
  !------------------------------------
!---------------------------------------------------------------------------
RefreshQueues ROUTINE
	DO VulPartijSaldoQueue
VulPartijSaldoQueue ROUTINE
	LOC:TotaalKG = 0
	LOC:TotaalPallets = 0;
	
	FREE(LOC:PartijSaldoQueue)
	
	!CLEAR(AVVL:Record)
	!AVVL:ArtikelID = LOC:ArtikelID
	!AVVL:PartijID = LOC:PartijID
	!CLEAR(AVVL:DatumTijd_DATE,-1)
	!CLEAR(AVVL:DatumTijd_TIME,-1)
	!CLEAR(AVVL:MutatieID,1)
    !SET(AVVL:ArtikelID_PartijID_DatumTijdD_MutatieID_K, AVVL:ArtikelID_PartijID_DatumTijdD_MutatieID_K)
    AVoorraadVerloop{PROP:SQL} = 'SELECT * FROM VoorraadVerloop ' &|
        'WHERE ArtikelID = ''' & CLIP(LOC:ArtikelID) & ''' AND PartijID = ' & CLIP(FORMAT(LOC:PartijID, @N_10)) & ' ORDER BY DatumTijd, MutatieID DESC'
    
	LOOP UNTIL Access:AVoorraadVerloop.Next()
		!IF AVVL:ArtikelID <> LOC:ArtikelID OR AVVL:PartijID <> LOC:PartijID THEN BREAK.

		IF CLIP(AVVL:SoortMutatie) = 'IN' OR CLIP(AVVL:SoortMutatie) = 'EIN' OR CLIP(AVVL:SoortMutatie) = 'OIN'
			LOC:TotaalKG += AVVL:InslagKG
			LOC:TotaalPallets += AVVL:InslagPallet
		ELSIF CLIP(AVVL:SoortMutatie) = 'UIT' OR CLIP(AVVL:SoortMutatie) = 'EUIT' OR CLIP(AVVL:SoortMutatie) = 'OUIT'
			LOC:TotaalKG -= AVVL:UitslagKG
			LOC:TotaalPallets -= AVVL:UitslagPallet
		.
		
		PSLD:MutatieID = AVVL:MutatieID
		PSLD:KG = LOC:TotaalKG
		PSLD:Pallets = LOC:TotaalPallets
		ADD(LOC:PartijSaldoQueue, +PSLD:MutatieID)
	.

ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

TempFormat          CSTRING(10000)
SearchString CSTRING(1000)
  CODE
  GlobalErrors.SetProcedureName('BrowseVoorraadVerloopPerPartij')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Browse:1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('LOC:SoortMutatieFilter',LOC:SoortMutatieFilter)    ! Added by: BrowseBox(ABC)
  BIND('LOC:Klant',LOC:Klant)                              ! Added by: BrowseBox(ABC)
  BIND('LOC:Leverancier',LOC:Leverancier)                  ! Added by: BrowseBox(ABC)
  BIND('LOC:VerpakkingOmschrijving',LOC:VerpakkingOmschrijving) ! Added by: BrowseBox(ABC)
  BIND('LOC:TotaalKG',LOC:TotaalKG)                        ! Added by: BrowseBox(ABC)
  BIND('LOC:TotaalPallets',LOC:TotaalPallets)              ! Added by: BrowseBox(ABC)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
  IF SELF.Request = SelectRecord
     SELF.AddItem(?Close,RequestCancelled)                 ! Add the close control to the window manger
  ELSE
     SELF.AddItem(?Close,RequestCompleted)                 ! Add the close control to the window manger
  END
  Relate:ARelatie.Open                                     ! File ARelatie used by this procedure, so make sure it's RelationManager is open
  Relate:AVoorraadVerloop.Open                             ! File AVoorraadVerloop used by this procedure, so make sure it's RelationManager is open
  Relate:Inkoop.SetOpenRelated()
  Relate:Inkoop.Open                                       ! File Inkoop used by this procedure, so make sure it's RelationManager is open
  Relate:Mutatie.Open                                      ! File Mutatie used by this procedure, so make sure it's RelationManager is open
  Relate:Verpakking.Open                                   ! File Verpakking used by this procedure, so make sure it's RelationManager is open
  Relate:ViewArtikel.Open                                  ! File ViewArtikel used by this procedure, so make sure it's RelationManager is open
  Relate:VoorraadVerloop.Open                              ! File VoorraadVerloop used by this procedure, so make sure it's RelationManager is open
  Access:Relatie.UseFile                                   ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:Planning.UseFile                                  ! File referenced in 'Other Files' so need to inform it's FileManager
  SELF.FilesOpened = True
  BUFFER(AVoorraadVerloop, 100)
  BUFFER(VoorraadVerloop, 100)
  LOC:ArtikelID = ArtikelID
  LOC:PartijID = PartijID
  LOC:LeverancierID = 0
  
  CLEAR(Art:Record)
  Art:ArtikelID = LOC:ArtikelID
  Access:ViewArtikel.TryFetch(Art:Artikel_PK)
  
  LOC:SoortMutatieFilter = 0
  
  Do RefreshQueues
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:VoorraadVerloop,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  IF IGB:BekijkenPrijzen <> 1 THEN
  	! Prijzen niet tonen, format string wijzigen 60R(2)|M*~KG-Prijs~C(0) naar 0R(2)|M*~KG-Prijs~C(0)
      SearchString = 'KG-Prijs'
      startidx# = INSTRING(CLIP(SearchString), CLIP(?Browse:1{PROP:Format}), 1, 1)
      IF (startidx# - LEN(CLIP(SearchString)) > 0)
          ! Gevonden
          TempFormat = ?Browse:1{PROP:Format}
          ?Browse:1{PROP:Format} = SUB(TempFormat, 1, startidx# - 11) & '0' & CLIP(SUB(TempFormat, startidx# - 8, LEN(TempFormat)))
      END
      
      SearchString = 'KG Prijs'
      startidx# = INSTRING(CLIP(SearchString), CLIP(?Browse:1{PROP:Format}), 1, 1)
      IF (startidx# - LEN(SearchString) > 0)
      !    ! Gevonden
          TempFormat = ?Browse:1{PROP:Format}
          ?Browse:1{PROP:Format} = SUB(TempFormat, 1, startidx# - 11) & '0' & CLIP(SUB(TempFormat, startidx# - 8, LEN(TempFormat)))
      END
  END
  WinAlertMouseZoom()
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1.FileLoaded = 1                                      ! This is a 'file loaded' browse
  BRW1.AddSortOrder(,VVL:ArtikelID_PartijID_DatumTijdD_MutatieID_K) ! Add the sort order for VVL:ArtikelID_PartijID_DatumTijdD_MutatieID_K for sort order 1
  BRW1.AddRange(VVL:PartijID,LOC:PartijID)                 ! Add single value range limit for sort order 1
  BRW1.SetFilter('((LOC:SoortMutatieFilter = 0 OR (LOC:SoortMutatieFilter = 1 AND (VVL:SoortMutatie = ''IN'' OR VVL:SoortMutatie = ''EIN'' OR VVL:SoortMutatie = ''OIN'')) OR (LOC:SoortMutatieFilter = 2 AND VVL:SoortMutatie = ''IN'') OR (LOC:SoortMutatieFilter = 3 AND (VVL:SoortMutatie = ''UIT'' OR VVL:SoortMutatie = ''EUIT'' OR VVL:SoortMutatie = ''OUIT'')) OR (LOC:SoortMutatieFilter = 4 AND VVL:SoortMutatie = ''UIT'')))') ! Apply filter expression to browse
  BRW1.AddResetField(LOC:SoortMutatieFilter)               ! Apply the reset field
  BRW1.AddField(VVL:DatumTijd_DATE,BRW1.Q.VVL:DatumTijd_DATE) ! Field VVL:DatumTijd_DATE is a hot field or requires assignment from browse
  BRW1.AddField(VVL:DatumTijd_TIME,BRW1.Q.VVL:DatumTijd_TIME) ! Field VVL:DatumTijd_TIME is a hot field or requires assignment from browse
  BRW1.AddField(LOC:Klant,BRW1.Q.LOC:Klant)                ! Field LOC:Klant is a hot field or requires assignment from browse
  BRW1.AddField(LOC:Leverancier,BRW1.Q.LOC:Leverancier)    ! Field LOC:Leverancier is a hot field or requires assignment from browse
  BRW1.AddField(LOC:VerpakkingOmschrijving,BRW1.Q.LOC:VerpakkingOmschrijving) ! Field LOC:VerpakkingOmschrijving is a hot field or requires assignment from browse
  BRW1.AddField(VVL:CelOms,BRW1.Q.VVL:CelOms)              ! Field VVL:CelOms is a hot field or requires assignment from browse
  BRW1.AddField(VVL:Locatienaam,BRW1.Q.VVL:Locatienaam)    ! Field VVL:Locatienaam is a hot field or requires assignment from browse
  BRW1.AddField(VVL:SoortMutatie,BRW1.Q.VVL:SoortMutatie)  ! Field VVL:SoortMutatie is a hot field or requires assignment from browse
  BRW1.AddField(VVL:PartijID,BRW1.Q.VVL:PartijID)          ! Field VVL:PartijID is a hot field or requires assignment from browse
  BRW1.AddField(VVL:ExternPartijnr,BRW1.Q.VVL:ExternPartijnr) ! Field VVL:ExternPartijnr is a hot field or requires assignment from browse
  BRW1.AddField(VVL:InslagKG,BRW1.Q.VVL:InslagKG)          ! Field VVL:InslagKG is a hot field or requires assignment from browse
  BRW1.AddField(VVL:BerekendeInkoopKGPrijs,BRW1.Q.VVL:BerekendeInkoopKGPrijs) ! Field VVL:BerekendeInkoopKGPrijs is a hot field or requires assignment from browse
  BRW1.AddField(VVL:UitslagKG,BRW1.Q.VVL:UitslagKG)        ! Field VVL:UitslagKG is a hot field or requires assignment from browse
  BRW1.AddField(VVL:VerkoopKGPrijs,BRW1.Q.VVL:VerkoopKGPrijs) ! Field VVL:VerkoopKGPrijs is a hot field or requires assignment from browse
  BRW1.AddField(LOC:TotaalKG,BRW1.Q.LOC:TotaalKG)          ! Field LOC:TotaalKG is a hot field or requires assignment from browse
  BRW1.AddField(VVL:PlanningID,BRW1.Q.VVL:PlanningID)      ! Field VVL:PlanningID is a hot field or requires assignment from browse
  BRW1.AddField(VVL:InkoopID,BRW1.Q.VVL:InkoopID)          ! Field VVL:InkoopID is a hot field or requires assignment from browse
  BRW1.AddField(VVL:VerkoopID,BRW1.Q.VVL:VerkoopID)        ! Field VVL:VerkoopID is a hot field or requires assignment from browse
  BRW1.AddField(VVL:MutatieID,BRW1.Q.VVL:MutatieID)        ! Field VVL:MutatieID is a hot field or requires assignment from browse
  BRW1.AddField(LOC:TotaalPallets,BRW1.Q.LOC:TotaalPallets) ! Field LOC:TotaalPallets is a hot field or requires assignment from browse
  BRW1.AddField(VVL:VerkoopRelatie,BRW1.Q.VVL:VerkoopRelatie) ! Field VVL:VerkoopRelatie is a hot field or requires assignment from browse
  BRW1.AddField(VVL:InkoopRelatie,BRW1.Q.VVL:InkoopRelatie) ! Field VVL:InkoopRelatie is a hot field or requires assignment from browse
  BRW1.AddField(VVL:VerpakkingOmschrijving,BRW1.Q.VVL:VerpakkingOmschrijving) ! Field VVL:VerpakkingOmschrijving is a hot field or requires assignment from browse
  BRW1.AddField(VVL:PartijRelatie,BRW1.Q.VVL:PartijRelatie) ! Field VVL:PartijRelatie is a hot field or requires assignment from browse
  BRW1.AddField(VVL:PartijLeverancier,BRW1.Q.VVL:PartijLeverancier) ! Field VVL:PartijLeverancier is a hot field or requires assignment from browse
  BRW1.AddField(VVL:ArtikelID,BRW1.Q.VVL:ArtikelID)        ! Field VVL:ArtikelID is a hot field or requires assignment from browse
  BRW1.AddField(VVL:DatumTijd,BRW1.Q.VVL:DatumTijd)        ! Field VVL:DatumTijd is a hot field or requires assignment from browse
  BRW1.AddField(CEL:CelID,BRW1.Q.CEL:CelID)                ! Field CEL:CelID is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('BrowseVoorraadVerloopPerPartij',QuickWindow) ! Restore window settings from non-volatile store
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
  FLUSH(AVoorraadVerloop)
  FLUSH(VoorraadVerloop)
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:ARelatie.Close
    Relate:AVoorraadVerloop.Close
    Relate:Inkoop.Close
    Relate:Mutatie.Close
    Relate:Verpakking.Close
    Relate:ViewArtikel.Close
    Relate:VoorraadVerloop.Close
  END
  IF SELF.Opened
    INIMgr.Update('BrowseVoorraadVerloopPerPartij',QuickWindow) ! Save window data to non-volatile store
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
    OF ?Overboeken
      ThisWindow.Update()
      Get(BRW1.Q ,Choice(?Browse:1))
      If Not Error() 
      	IF (BRW1.Q.VVL:SoortMutatie = 'IN' OR BRW1.Q.VVL:SoortMutatie = 'OIN')
      		CLEAR(Mut:Record)
      		Mut:MutatieID=BRW1.Q.VVL:MutatieID
      		IF (Access:Mutatie.TryFetch(Mut:Mutatie_PK) = Level:Benign)
      			GlobalRequest = ChangeRecord
      			UpdateOverboekPlanningVanuitVV
      		END
      	ELSE
      		Message('Geselecteerde mutatie is geen inslag.')
      	END
      END
      	NOTIFY(2, GLO:Overboeking_ThreadID)
      	NOTIFY(2, GLO:Planning_ThreadID)
    OF ?HandmatigeCorrectie
      ThisWindow.Update()
      Get(BRW1.Q ,Choice(?Browse:1))
      If Not Error()
      	CLEAR(Mut:Record)
      	Mut:MutatieID=BRW1.Q.VVL:MutatieID
      	IF (Access:Mutatie.TryFetch(Mut:Mutatie_PK) = Level:Benign)
      		db.DebugOut('UpdateMutatie:'&Mut:MutatieID& ', ' & Mut:SoortMutatie)
      		CASE Mut:SoortMutatie
      		OF 'UIT'
      			GlobalRequest = ChangeRecord
      			UpdateUitslagMutatie()
      		OF 'EUIT'
      			GlobalRequest = ChangeRecord
      			UpdateEUitslagMutatie()
      		OF 'IN'
      			CLEAR(Par:Record)
      			Par:PartijID = VVL:PartijID
      
      			IF Access:Partij.TryFetch(Par:Partij_PK) = Level:Benign
      				GlobalRequest = ChangeRecord
      				WindowInslag()
      			ELSE
      				MESSAGE('Inslag heeft geen bekend partijnummer', '', ICON:Hand)
      			.
      		OF 'EIN'
      			GlobalRequest = ChangeRecord
      			UpdateEInslagMutatie()
      		OF 'OIN' OROF 'OUIT'
      			IF Mut:SoortMutatie = 'OIN'
      				! Ophalen bijbehorende OUIT-mutatie
      				planningID# = Mut:PlanningID
      				CLEAR(Mut:MutatieID, -1)
      				SET(Mut:Mutatie_FK02, Mut:Mutatie_FK02)
      				LOOP
      					Access:Mutatie.Next()
      					IF ERROR() THEN BREAK.
      					IF planningID# <> Mut:PlanningID THEN BREAK.
      					
      					IF Mut:SoortMutatie = 'OUIT'
      						GlobalRequest = ChangeRecord
      						UpdateOverboekMutatie()
      						BREAK
      					END
      				END
      			ELSE
      				GlobalRequest = ChangeRecord
      				UpdateOverboekMutatie()
      			.
      		.
      	End
      End
      
      DO RefreshQueues
      BRW1.ResetQueue(0)
      ThisWindow.Reset(True)
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
    OF EVENT:Notify
      	!NOTIFICATION(NotifyCode#)
      	!db.DebugOut('BrowseVoorraadVerloop.Notify('&NotifyCode#&')')
      	!IF NotifyCode# = 1
      	!	0{Prop:Active}=TRUE
      	!ELSIF NotifyCode# = 2
      	!	DO RefreshQueues
      	!	ThisWindow.Reset(True)
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
         GET(SELF.Order.RangeList.List,1)
         SELF.Order.RangeList.List.Right = LOC:ArtikelID ! VVL:ArtikelID
  ReturnValue = PARENT.ApplyRange()
  RETURN ReturnValue


BRW1.Fetch PROCEDURE(BYTE Direction)

GreenBarIndex   LONG,AUTO
  CODE
  PARENT.Fetch(Direction)
  !----------------------------------------------------------------------
    LOOP GreenBarIndex=1 TO RECORDS(SELF.Q)
      GET(SELF.Q,GreenBarIndex)
      SELF.Q.VVL:DatumTijd_DATE_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for VVL:DatumTijd_DATE
      SELF.Q.VVL:DatumTijd_DATE_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.VVL:DatumTijd_DATE_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.VVL:DatumTijd_DATE_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.VVL:DatumTijd_TIME_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for VVL:DatumTijd_TIME
      SELF.Q.VVL:DatumTijd_TIME_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.VVL:DatumTijd_TIME_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.VVL:DatumTijd_TIME_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.LOC:Klant_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for LOC:Klant
      SELF.Q.LOC:Klant_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.LOC:Klant_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.LOC:Klant_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.LOC:Leverancier_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for LOC:Leverancier
      SELF.Q.LOC:Leverancier_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.LOC:Leverancier_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.LOC:Leverancier_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.LOC:VerpakkingOmschrijving_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for LOC:VerpakkingOmschrijving
      SELF.Q.LOC:VerpakkingOmschrijving_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.LOC:VerpakkingOmschrijving_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.LOC:VerpakkingOmschrijving_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.VVL:CelOms_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for VVL:CelOms
      SELF.Q.VVL:CelOms_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.VVL:CelOms_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.VVL:CelOms_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.VVL:Locatienaam_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for VVL:Locatienaam
      SELF.Q.VVL:Locatienaam_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.VVL:Locatienaam_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.VVL:Locatienaam_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.VVL:SoortMutatie_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for VVL:SoortMutatie
      SELF.Q.VVL:SoortMutatie_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.VVL:SoortMutatie_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.VVL:SoortMutatie_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.VVL:PartijID_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for VVL:PartijID
      SELF.Q.VVL:PartijID_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.VVL:PartijID_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.VVL:PartijID_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.VVL:ExternPartijnr_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for VVL:ExternPartijnr
      SELF.Q.VVL:ExternPartijnr_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.VVL:ExternPartijnr_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.VVL:ExternPartijnr_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.VVL:InslagKG_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for VVL:InslagKG
      SELF.Q.VVL:InslagKG_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.VVL:InslagKG_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.VVL:InslagKG_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.VVL:BerekendeInkoopKGPrijs_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for VVL:BerekendeInkoopKGPrijs
      SELF.Q.VVL:BerekendeInkoopKGPrijs_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.VVL:BerekendeInkoopKGPrijs_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.VVL:BerekendeInkoopKGPrijs_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.VVL:UitslagKG_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for VVL:UitslagKG
      SELF.Q.VVL:UitslagKG_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.VVL:UitslagKG_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.VVL:UitslagKG_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.VVL:VerkoopKGPrijs_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for VVL:VerkoopKGPrijs
      SELF.Q.VVL:VerkoopKGPrijs_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.VVL:VerkoopKGPrijs_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.VVL:VerkoopKGPrijs_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.LOC:TotaalKG_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for LOC:TotaalKG
      SELF.Q.LOC:TotaalKG_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.LOC:TotaalKG_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.LOC:TotaalKG_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.VVL:PlanningID_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for VVL:PlanningID
      SELF.Q.VVL:PlanningID_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.VVL:PlanningID_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.VVL:PlanningID_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.VVL:InkoopID_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for VVL:InkoopID
      SELF.Q.VVL:InkoopID_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.VVL:InkoopID_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.VVL:InkoopID_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.VVL:VerkoopID_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for VVL:VerkoopID
      SELF.Q.VVL:VerkoopID_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.VVL:VerkoopID_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.VVL:VerkoopID_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.VVL:MutatieID_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for VVL:MutatieID
      SELF.Q.VVL:MutatieID_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.VVL:MutatieID_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.VVL:MutatieID_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      PUT(SELF.Q)
    END
  !----------------------------------------------------------------------


BRW1.ResetFromView PROCEDURE

LOC:TotaalInslagKG:Sum REAL                                ! Sum variable for browse totals
LOC:TotaalUitslagKG:Sum REAL                               ! Sum variable for browse totals
  CODE
  SETCURSOR(Cursor:Wait)
  Relate:VoorraadVerloop.SetQuickScan(1)
  SELF.Reset
  IF SELF.UseMRP
     IF SELF.View{PROP:IPRequestCount} = 0
          SELF.View{PROP:IPRequestCount} = 60
     END
  END
  LOOP
    IF SELF.UseMRP
       IF SELF.View{PROP:IPRequestCount} = 0
            SELF.View{PROP:IPRequestCount} = 60
       END
    END
    CASE SELF.Next()
    OF Level:Notify
      BREAK
    OF Level:Fatal
      SETCURSOR()
      RETURN
    END
    SELF.SetQueueRecord
    LOC:TotaalInslagKG:Sum += VVL:InslagKG
    LOC:TotaalUitslagKG:Sum += VVL:UitslagKG
  END
  SELF.View{PROP:IPRequestCount} = 0
  LOC:TotaalInslagKG = LOC:TotaalInslagKG:Sum
  LOC:TotaalUitslagKG = LOC:TotaalUitslagKG:Sum
  PARENT.ResetFromView
  Relate:VoorraadVerloop.SetQuickScan(0)
  SETCURSOR()


BRW1.SetQueueRecord PROCEDURE

  CODE
  	!db.DebugOut('VoorraadVerloop1:'&VVL:MutatieID&',' & VVL:PartijRelatie)
  	LOC:Leverancier = VVL:PartijRelatie
  	LOC:Klant = ''
  	LOC:VerpakkingOmschrijving = VVL:VerpakkingOmschrijving
  	!db.DebugOut('VoorraadVerloop2:'&VVL:MutatieID&',' & VVL:PartijRelatie)
  
  	IF CLIP(VVL:SoortMutatie) = 'UIT'
  		LOC:Klant = VVL:VerkoopRelatie
  	.
  
  	! Tijdelijk voor EIN
  	IF CLIP(VVL:SoortMutatie) = 'EIN'
  		CLEAR(Pla:Record)
  		Pla:PlanningID = VVL:PlanningID
  		db.DebugOut('VoorraadVerloop E1:'&VVL:PlanningID)
  		Access:Planning.TryFetch(Pla:PK_Planning)
  		db.DebugOut('VoorraadVerloop E2:'&Pla:PlanningID&','&Pla:Leverancier&','&Pla:VerpakkingID)
  
  		!LOC:Leverancier = VVL:InkoopRelatie
  		CLEAR(Rel:Record)
  		Rel:RelatieID = Pla:Leverancier
  		Access:Relatie.TryFetch(Rel:Relatie_PK)
  		LOC:Leverancier = Rel:FirmaNaam
  		
  		CLEAR(Ver:Record)
  		Ver:VerpakkingID=Pla:VerpakkingID
  		Access:Verpakking.TryFetch(Ver:Verpakking_PK)
  		LOC:VerpakkingOmschrijving = Ver:VerpakkingOmschrijving
  	.
  
  	IF CLIP(VVL:SoortMutatie) = 'EUIT' THEN
  		CLEAR(Pla:Record)
  		Pla:PlanningID = VVL:PlanningID
  		!db.DebugOut('VoorraadVerloop E1:'&VVL:PlanningID)
  		Access:Planning.TryFetch(Pla:PK_Planning)
  		!db.DebugOut('VoorraadVerloop E2:'&Pla:PlanningID&','&Pla:Leverancier&','&Pla:VerpakkingID)
  
  		LOC:Klant = VVL:VerkoopRelatie
  		
  		IF LOC:Leverancier = ''
  			CLEAR(Rel:Record)
  			Rel:RelatieID = Pla:Leverancier
  			Access:Relatie.TryFetch(Rel:Relatie_PK)
  			LOC:Leverancier = Rel:FirmaNaam
  		.
  		
  		IF LOC:VerpakkingOmschrijving = ''
  			CLEAR(Ver:Record)
  			Ver:VerpakkingID=Pla:VerpakkingID
  			Access:Verpakking.TryFetch(Ver:Verpakking_PK)
  			LOC:VerpakkingOmschrijving = Ver:VerpakkingOmschrijving
  		.
  	.
  
  	CLEAR(LOC:PartijSaldoQueue)
  	PSLD:MutatieID = VVL:MutatieID
  	GET(LOC:PartijSaldoQueue, +PSLD:MutatieID)
  	IF NOT(ERROR())
  		LOC:TotaalKG = PSLD:KG
  		LOC:TotaalPallets = PSLD:Pallets
  	ELSE
  		LOC:TotaalKG = 0
  		LOC:TotaalPallets = 0
  	.
  PARENT.SetQueueRecord
  
  SELF.Q.LOC:TotaalKG_Style = 0 ! 
  !----------------------------------------------------------------------
      SELF.Q.VVL:DatumTijd_DATE_NormalFG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1) ! Set color values for VVL:DatumTijd_DATE
      SELF.Q.VVL:DatumTijd_DATE_NormalBG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,8454143)
      SELF.Q.VVL:DatumTijd_DATE_SelectedFG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.VVL:DatumTijd_DATE_SelectedBG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.VVL:DatumTijd_TIME_NormalFG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1) ! Set color values for VVL:DatumTijd_TIME
      SELF.Q.VVL:DatumTijd_TIME_NormalBG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,8454143)
      SELF.Q.VVL:DatumTijd_TIME_SelectedFG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.VVL:DatumTijd_TIME_SelectedBG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.LOC:Klant_NormalFG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1) ! Set color values for LOC:Klant
      SELF.Q.LOC:Klant_NormalBG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,8454143)
      SELF.Q.LOC:Klant_SelectedFG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.LOC:Klant_SelectedBG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.LOC:Leverancier_NormalFG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1) ! Set color values for LOC:Leverancier
      SELF.Q.LOC:Leverancier_NormalBG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,8454143)
      SELF.Q.LOC:Leverancier_SelectedFG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.LOC:Leverancier_SelectedBG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.LOC:VerpakkingOmschrijving_NormalFG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1) ! Set color values for LOC:VerpakkingOmschrijving
      SELF.Q.LOC:VerpakkingOmschrijving_NormalBG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,8454143)
      SELF.Q.LOC:VerpakkingOmschrijving_SelectedFG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.LOC:VerpakkingOmschrijving_SelectedBG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.VVL:CelOms_NormalFG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1) ! Set color values for VVL:CelOms
      SELF.Q.VVL:CelOms_NormalBG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,8454143)
      SELF.Q.VVL:CelOms_SelectedFG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.VVL:CelOms_SelectedBG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.VVL:Locatienaam_NormalFG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1) ! Set color values for VVL:Locatienaam
      SELF.Q.VVL:Locatienaam_NormalBG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,8454143)
      SELF.Q.VVL:Locatienaam_SelectedFG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.VVL:Locatienaam_SelectedBG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.VVL:SoortMutatie_NormalFG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1) ! Set color values for VVL:SoortMutatie
      SELF.Q.VVL:SoortMutatie_NormalBG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,8454143)
      SELF.Q.VVL:SoortMutatie_SelectedFG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.VVL:SoortMutatie_SelectedBG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.VVL:PartijID_NormalFG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1) ! Set color values for VVL:PartijID
      SELF.Q.VVL:PartijID_NormalBG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,8454143)
      SELF.Q.VVL:PartijID_SelectedFG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.VVL:PartijID_SelectedBG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.VVL:ExternPartijnr_NormalFG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1) ! Set color values for VVL:ExternPartijnr
      SELF.Q.VVL:ExternPartijnr_NormalBG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,8454143)
      SELF.Q.VVL:ExternPartijnr_SelectedFG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.VVL:ExternPartijnr_SelectedBG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.VVL:InslagKG_NormalFG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1) ! Set color values for VVL:InslagKG
      SELF.Q.VVL:InslagKG_NormalBG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,8454143)
      SELF.Q.VVL:InslagKG_SelectedFG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.VVL:InslagKG_SelectedBG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.VVL:BerekendeInkoopKGPrijs_NormalFG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1) ! Set color values for VVL:BerekendeInkoopKGPrijs
      SELF.Q.VVL:BerekendeInkoopKGPrijs_NormalBG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,8454143)
      SELF.Q.VVL:BerekendeInkoopKGPrijs_SelectedFG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.VVL:BerekendeInkoopKGPrijs_SelectedBG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.VVL:UitslagKG_NormalFG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1) ! Set color values for VVL:UitslagKG
      SELF.Q.VVL:UitslagKG_NormalBG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,8454143)
      SELF.Q.VVL:UitslagKG_SelectedFG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.VVL:UitslagKG_SelectedBG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.VVL:VerkoopKGPrijs_NormalFG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1) ! Set color values for VVL:VerkoopKGPrijs
      SELF.Q.VVL:VerkoopKGPrijs_NormalBG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,8454143)
      SELF.Q.VVL:VerkoopKGPrijs_SelectedFG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.VVL:VerkoopKGPrijs_SelectedBG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.LOC:TotaalKG_NormalFG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1) ! Set color values for LOC:TotaalKG
      SELF.Q.LOC:TotaalKG_NormalBG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,8454143)
      SELF.Q.LOC:TotaalKG_SelectedFG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.LOC:TotaalKG_SelectedBG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.VVL:PlanningID_NormalFG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1) ! Set color values for VVL:PlanningID
      SELF.Q.VVL:PlanningID_NormalBG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,8454143)
      SELF.Q.VVL:PlanningID_SelectedFG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.VVL:PlanningID_SelectedBG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.VVL:InkoopID_NormalFG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1) ! Set color values for VVL:InkoopID
      SELF.Q.VVL:InkoopID_NormalBG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,8454143)
      SELF.Q.VVL:InkoopID_SelectedFG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.VVL:InkoopID_SelectedBG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.VVL:VerkoopID_NormalFG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1) ! Set color values for VVL:VerkoopID
      SELF.Q.VVL:VerkoopID_NormalBG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,8454143)
      SELF.Q.VVL:VerkoopID_SelectedFG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.VVL:VerkoopID_SelectedBG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.VVL:MutatieID_NormalFG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1) ! Set color values for VVL:MutatieID
      SELF.Q.VVL:MutatieID_NormalBG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,8454143)
      SELF.Q.VVL:MutatieID_SelectedFG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.VVL:MutatieID_SelectedBG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
  !----------------------------------------------------------------------


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window
  SELF.SetStrategy(?LOC:TotaalInslagKG:Prompt, Resize:FixRight+Resize:FixBottom, Resize:LockSize) ! Override strategy for ?LOC:TotaalInslagKG:Prompt
  SELF.SetStrategy(?LOC:TotaalInslagKG:2, Resize:FixRight+Resize:FixBottom, Resize:LockSize) ! Override strategy for ?LOC:TotaalInslagKG:2
  SELF.SetStrategy(?LOC:TotaalUitslagKG:Prompt, Resize:FixRight+Resize:FixBottom, Resize:LockSize) ! Override strategy for ?LOC:TotaalUitslagKG:Prompt
  SELF.SetStrategy(?LOC:TotaalUitslagKG:2, Resize:FixRight+Resize:FixBottom, Resize:LockSize) ! Override strategy for ?LOC:TotaalUitslagKG:2

