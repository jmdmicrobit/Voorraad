

   MEMBER('VoorrVrd.clw')                                  ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABPOPUP.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('VOORRVRD012.INC'),ONCE        !Local module procedure declarations
                     END


!!! <summary>
!!! Generated from procedure template - Window
!!! Browse the ViewVoorraad file
!!! </summary>
BrowsePartijVoorraadVIEW PROCEDURE 

LOC:TempFormat       STRING(2000)                          ! 
Loc:Start            LONG                                  ! 
LOC:CelLocatieNamen  CSTRING('<0>{50}')                    ! 
CurrentTab           STRING(80)                            ! 
LOC:NotifyCode       LONG                                  ! 
LOC:Cel1KG           DECIMAL(9,2)                          ! 
LOC:Cel2KG           DECIMAL(9,2)                          ! 
LOC:Cel3KG           DECIMAL(9,2)                          ! 
LOC:Cel4KG           DECIMAL(9,2)                          ! 
LOC:Cel5KG           DECIMAL(9,2)                          ! 
LOC:Cel6KG           DECIMAL(9,2)                          ! 
LOC:Cel7KG           DECIMAL(9,2)                          ! 
LOC:Cel8KG           DECIMAL(9,2)                          ! 
LOC:Cel9KG           DECIMAL(9,2)                          ! 
LOC:Cel10KG          DECIMAL(9,2)                          ! 
LOC:Cel11KG          DECIMAL(9,2)                          ! 
LOC:Cel12KG          DECIMAL(9,2)                          ! 
LOC:Cel13KG          DECIMAL(9,2)                          ! 
LOC:Cel14KG          DECIMAL(9,2)                          ! 
LOC:Cel15KG          DECIMAL(9,2)                          ! 
Loc:CelID2           LONG                                  ! 
Loc:CelID            LONG                                  ! 
LOC:CelPointer       LONG                                  ! 
LOC:CelValue         DECIMAL(9,2)                          ! 
Loc:CelOms           CSTRING(51)                           ! 
Loc:TotaalKG         LONG                                  ! 
Loc:TotaalPallets    LONG                                  ! 
LOC:VVCTVoorraadKG   DECIMAL(9,2)                          ! 
LOC:ArtikelID        CSTRING('<0>{30}')                    ! 
LOC:PartijCelID      CSTRING('<0>{25}')                    ! 
Loc:CelLocatieID     LONG                                  ! 
LOC:PartijVoorraadSortering STRING(20)                     ! 
LOC:ZoekVak          STRING(20)                            ! 
LOC:DatumNU          LONG                                  ! 
LOC:TotaalVoorraad   DECIMAL(12,2)                         ! 
Loc:LegeVoorraadVerbergen BYTE                             ! 
LOC:VoorraadKG       DECIMAL(9,2)                          ! 
LOC:PartijRoodkleurenNaDagen LONG                          ! 
Loc:PeilDatum        DATE                                  ! 
Loc:RegelKG          LONG                                  ! 
Loc:RegelVerkoop     REAL                                  ! 
Loc:SaldoKG          DECIMAL(9,2)                          ! 
BRW2::View:Browse    VIEW(ViewVoorraadPartij_INDEXED)
                       PROJECT(VVParI:ArtikelID)
                       PROJECT(VVParI:ArtikelOms)
                       PROJECT(VVParI:PartijID)
                       PROJECT(VVParI:ExternPartijnr)
                       PROJECT(VVParI:CelOms)
                       PROJECT(VVParI:BerekendeInkoopKGPrijs)
                       PROJECT(VVParI:AanmaakDatum_DATE)
                       PROJECT(VVParI:VerpakkingOmschrijving)
                       PROJECT(VVParI:LeverancierFirmanaam)
                       PROJECT(VVParI:AanmaakDatum_GROUP)
                       PROJECT(VVParI:CelID)
                       PROJECT(VVParI:InslagKG)
                       PROJECT(VVParI:UitslagKG)
                       JOIN(VPPar:PartijID_CelID_K,VVParI:PartijID,VVParI:CelID)
                         PROJECT(VPPar:VerkoopKG)
                         PROJECT(VPPar:PartijID)
                         PROJECT(VPPar:CelID)
                       END
                       JOIN(VVParT:PK_ViewVoorraadPartijTotaal,VVParI:PartijID)
                         PROJECT(VVParT:VoorraadKG)
                         PROJECT(VVParT:PartijID)
                       END
                       JOIN(VPParT:PK_ViewPlanningPartijTotaal,VVParI:PartijID)
                         PROJECT(VPParT:VerkoopKG)
                         PROJECT(VPParT:PartijID)
                       END
                     END
Queue:Browse         QUEUE                            !Queue declaration for browse/combo box using ?List
VVParI:ArtikelID       LIKE(VVParI:ArtikelID)         !List box control field - type derived from field
VVParI:ArtikelID_NormalFG LONG                        !Normal forground color
VVParI:ArtikelID_NormalBG LONG                        !Normal background color
VVParI:ArtikelID_SelectedFG LONG                      !Selected forground color
VVParI:ArtikelID_SelectedBG LONG                      !Selected background color
VVParI:ArtikelOms      LIKE(VVParI:ArtikelOms)        !List box control field - type derived from field
VVParI:ArtikelOms_NormalFG LONG                       !Normal forground color
VVParI:ArtikelOms_NormalBG LONG                       !Normal background color
VVParI:ArtikelOms_SelectedFG LONG                     !Selected forground color
VVParI:ArtikelOms_SelectedBG LONG                     !Selected background color
VVParI:PartijID        LIKE(VVParI:PartijID)          !List box control field - type derived from field
VVParI:PartijID_NormalFG LONG                         !Normal forground color
VVParI:PartijID_NormalBG LONG                         !Normal background color
VVParI:PartijID_SelectedFG LONG                       !Selected forground color
VVParI:PartijID_SelectedBG LONG                       !Selected background color
VVParI:ExternPartijnr  LIKE(VVParI:ExternPartijnr)    !List box control field - type derived from field
VVParI:ExternPartijnr_NormalFG LONG                   !Normal forground color
VVParI:ExternPartijnr_NormalBG LONG                   !Normal background color
VVParI:ExternPartijnr_SelectedFG LONG                 !Selected forground color
VVParI:ExternPartijnr_SelectedBG LONG                 !Selected background color
VVParT:VoorraadKG      LIKE(VVParT:VoorraadKG)        !List box control field - type derived from field
VVParT:VoorraadKG_NormalFG LONG                       !Normal forground color
VVParT:VoorraadKG_NormalBG LONG                       !Normal background color
VVParT:VoorraadKG_SelectedFG LONG                     !Selected forground color
VVParT:VoorraadKG_SelectedBG LONG                     !Selected background color
VVParT:VoorraadKG_Style LONG                          !Field style
VPParT:VerkoopKG       LIKE(VPParT:VerkoopKG)         !List box control field - type derived from field
VPParT:VerkoopKG_NormalFG LONG                        !Normal forground color
VPParT:VerkoopKG_NormalBG LONG                        !Normal background color
VPParT:VerkoopKG_SelectedFG LONG                      !Selected forground color
VPParT:VerkoopKG_SelectedBG LONG                      !Selected background color
VPParT:VerkoopKG_Style LONG                           !Field style
VVParI:CelOms          LIKE(VVParI:CelOms)            !List box control field - type derived from field
VVParI:CelOms_NormalFG LONG                           !Normal forground color
VVParI:CelOms_NormalBG LONG                           !Normal background color
VVParI:CelOms_SelectedFG LONG                         !Selected forground color
VVParI:CelOms_SelectedBG LONG                         !Selected background color
LOC:CelLocatieNamen    LIKE(LOC:CelLocatieNamen)      !List box control field - type derived from local data
LOC:CelLocatieNamen_NormalFG LONG                     !Normal forground color
LOC:CelLocatieNamen_NormalBG LONG                     !Normal background color
LOC:CelLocatieNamen_SelectedFG LONG                   !Selected forground color
LOC:CelLocatieNamen_SelectedBG LONG                   !Selected background color
LOC:VoorraadKG         LIKE(LOC:VoorraadKG)           !List box control field - type derived from local data
LOC:VoorraadKG_NormalFG LONG                          !Normal forground color
LOC:VoorraadKG_NormalBG LONG                          !Normal background color
LOC:VoorraadKG_SelectedFG LONG                        !Selected forground color
LOC:VoorraadKG_SelectedBG LONG                        !Selected background color
VPPar:VerkoopKG        LIKE(VPPar:VerkoopKG)          !List box control field - type derived from field
VPPar:VerkoopKG_NormalFG LONG                         !Normal forground color
VPPar:VerkoopKG_NormalBG LONG                         !Normal background color
VPPar:VerkoopKG_SelectedFG LONG                       !Selected forground color
VPPar:VerkoopKG_SelectedBG LONG                       !Selected background color
Loc:SaldoKG            LIKE(Loc:SaldoKG)              !List box control field - type derived from local data
Loc:SaldoKG_NormalFG   LONG                           !Normal forground color
Loc:SaldoKG_NormalBG   LONG                           !Normal background color
Loc:SaldoKG_SelectedFG LONG                           !Selected forground color
Loc:SaldoKG_SelectedBG LONG                           !Selected background color
VVParI:BerekendeInkoopKGPrijs LIKE(VVParI:BerekendeInkoopKGPrijs) !List box control field - type derived from field
VVParI:BerekendeInkoopKGPrijs_NormalFG LONG           !Normal forground color
VVParI:BerekendeInkoopKGPrijs_NormalBG LONG           !Normal background color
VVParI:BerekendeInkoopKGPrijs_SelectedFG LONG         !Selected forground color
VVParI:BerekendeInkoopKGPrijs_SelectedBG LONG         !Selected background color
VVParI:AanmaakDatum_DATE LIKE(VVParI:AanmaakDatum_DATE) !List box control field - type derived from field
VVParI:AanmaakDatum_DATE_NormalFG LONG                !Normal forground color
VVParI:AanmaakDatum_DATE_NormalBG LONG                !Normal background color
VVParI:AanmaakDatum_DATE_SelectedFG LONG              !Selected forground color
VVParI:AanmaakDatum_DATE_SelectedBG LONG              !Selected background color
VVParI:VerpakkingOmschrijving LIKE(VVParI:VerpakkingOmschrijving) !List box control field - type derived from field
VVParI:VerpakkingOmschrijving_NormalFG LONG           !Normal forground color
VVParI:VerpakkingOmschrijving_NormalBG LONG           !Normal background color
VVParI:VerpakkingOmschrijving_SelectedFG LONG         !Selected forground color
VVParI:VerpakkingOmschrijving_SelectedBG LONG         !Selected background color
VVParI:LeverancierFirmanaam LIKE(VVParI:LeverancierFirmanaam) !List box control field - type derived from field
VVParI:LeverancierFirmanaam_NormalFG LONG             !Normal forground color
VVParI:LeverancierFirmanaam_NormalBG LONG             !Normal background color
VVParI:LeverancierFirmanaam_SelectedFG LONG           !Selected forground color
VVParI:LeverancierFirmanaam_SelectedBG LONG           !Selected background color
VVParI:AanmaakDatum_GROUP STRING(SIZE(VVParI:AanmaakDatum_GROUP)) !Browse hot field - STRING defined to hold GROUP's contents
VVParI:CelID           LIKE(VVParI:CelID)             !Browse hot field - type derived from field
VVParI:InslagKG        LIKE(VVParI:InslagKG)          !Browse hot field - type derived from field
VVParI:UitslagKG       LIKE(VVParI:UitslagKG)         !Browse hot field - type derived from field
VPPar:PartijID         LIKE(VPPar:PartijID)           !Related join file key field - type derived from field
VPPar:CelID            LIKE(VPPar:CelID)              !Related join file key field - type derived from field
VVParT:PartijID        LIKE(VVParT:PartijID)          !Related join file key field - type derived from field
VPParT:PartijID        LIKE(VPParT:PartijID)          !Related join file key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
LocEnableEnterByTab  BYTE(1)                               !Used by the ENTER Instead of Tab template
EnterByTabManager    EnterByTabClass
NetLocalRefreshDate     Long     ! NetTalk (NetRefresh)
NetLocalRefreshTime     Long
NetLocalDependancies    String('|ViewVoorraadPartij_INDEXED|ViewPlanningPartij|ViewVoorraadPartijTotaal|ViewPlanningPartijTotaal|')
QuickWindow          WINDOW('Partij-Voorraad (View)'),AT(,,609,282),FONT('MS Sans Serif',8,,,CHARSET:DEFAULT),RESIZE, |
  CENTER,GRAY,IMM,MAX,MDI,HLP('BrowseVoorraad'),SYSTEM
                       SHEET,AT(4,4,603,250),USE(?CurrentTab)
                         TAB('Partij-voorraden'),USE(?TAB1)
                           ENTRY(@s20),AT(364,30,88),USE(LOC:ZoekVak)
                           PROMPT('Zoeken:'),AT(332,31),USE(?PROMPT1)
                           PROMPT('in sortering:'),AT(461,31),USE(?LOC:PartijVoorraadSortering:Prompt)
                           LIST,AT(501,30,90,13),USE(LOC:PartijVoorraadSortering),DROP(10),FROM('Op artikel|#Op ar' & |
  'tikel|Op intern partijnr.|#Op intern partijnr.|Op extern partijnr.|#Op extern partij' & |
  'nr.|Op aanmaakdatum|#Op aanmaakdatum'),IMM
                         END
                         TAB('Partij-voorraad op Peildatum'),USE(?TAB2)
                           PROMPT('Peilatum:'),AT(386,28),USE(?Loc:PeilDatum:Prompt)
                           SPIN(@d17),AT(425,28,60,10),USE(Loc:PeilDatum)
                         END
                       END
                       BUTTON('&Sluiten'),AT(555,257,49,14),USE(?Close),LEFT,ICON('WACLOSE.ICO'),FLAT,MSG('Close Window'), |
  TIP('Close Window')
                       BUTTON('&Ververs Scherm'),AT(469,257,83,14),USE(?Close:2),LEFT,ICON('REFRESH.ICO'),FLAT,MSG('Close Window'), |
  TIP('Close Window')
                       BUTTON('Partij-voorraad verloop'),AT(5,26),USE(?PartijVoorraadVerloop)
                       LIST,AT(5,47,587,199),USE(?List),HVSCROLL,FORMAT('[50L(2)|M*~ID~C(0)@s30@240L(2)|M*~Oms' & |
  'chrijving~C(0)@s60@](150)|~Artikel~[43R(2)|M*~Intern~C(0)@n_10@40R(2)|M*~Extern~C(0)' & |
  '@s20@56R(2)|M*Y~Voorraad (KG)~C(0)@n-13`2@57R(2)|M*Y~Verkocht (KG)~C(0)@n-13`2@]|~Pa' & |
  'rtij~[59L(2)|M*~Cel~C(0)@s50@77L(2)|M*~Locatie~C(0)@s50@56R(2)|M*~Voorraad (KG)~C(0)' & |
  '@n-13`2@Z(1)57R(2)|M*~Verkocht (KG)~C(0)@n-13`2@Z(1)56R(2)|M*~Saldo (KG)~D(12)@n-13.' & |
  '2@Z(1)]|~Cel~61R(2)|M*~Inkoop KG-Prijs~C(0)@n14`3@[40R(2)|M*~Datum ~C(0)@d17@](46)|~' & |
  'Aanmaak~60L(2)|M*~Verpakking~C(0)@s50@200L(2)|M*~Leverancier~C(0)@s50@'),FROM(Queue:Browse), |
  IMM
                       BUTTON('Overboeken'),AT(99,26,73),USE(?Overboeken2)
                       BUTTON('Extra stickers'),AT(176,26),USE(?ExtraStickers)
                       BUTTON('Corrigeer cel/locatie'),AT(237,26),USE(?WijzigLocatie)
                       BUTTON('Excel'),AT(5,257,55,14),USE(?Excel),LEFT,ICON('Excel.ico')
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
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED
Export2Excel           PROCEDURE(LONG pTab, STRING pSortering) ! New method added to this class instance
                     END

Toolbar              ToolbarClass
BRW2                 CLASS(BrowseClass)                    ! Browse using ?List
Q                      &Queue:Browse                  !Reference to browse queue
Fetch                  PROCEDURE(BYTE Direction),DERIVED
ResetSort              PROCEDURE(BYTE Force),BYTE,PROC,DERIVED
SetQueueRecord         PROCEDURE(),DERIVED
ValidateRecord         PROCEDURE(),BYTE,DERIVED
                     END

BRW2::Sort0:Locator  IncrementalLocatorClass               ! Default Locator
BRW2::Sort1:Locator  IncrementalLocatorClass               ! Conditional Locator - CLIP(LOC:PartijVoorraadSortering) = CLIP('Op extern partijnr.')
BRW2::Sort2:Locator  IncrementalLocatorClass               ! Conditional Locator - CLIP(LOC:PartijVoorraadSortering) = CLIP('Op intern partijnr.')
BRW2::Sort3:Locator  StepLocatorClass                      ! Conditional Locator - CLIP(LOC:PartijVoorraadSortering) = CLIP('Op aanmaakdatum')
BRW2::Sort4:Locator  IncrementalLocatorClass               ! Conditional Locator - Choice(?CurrentTab)=2
Resizer              CLASS(WindowResizeClass)
Init                   PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)
                     END

LocalClass          CLASS
PartijVoorraadopPeilDatum       Procedure(*CString, Long, Long, *LONG, *REAL)
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
  !Style for ?List
  !------------------------------------
  ?List{PROPSTYLE:FontName, 1}      = 'MS Sans Serif'
  ?List{PROPSTYLE:FontSize, 1}      = 10
  ?List{PROPSTYLE:FontStyle, 1}     = 700
  ?List{PROPSTYLE:TextColor, 1}     = -1
  ?List{PROPSTYLE:BackColor, 1}     = -1
  ?List{PROPSTYLE:TextSelected, 1}  = -1
  ?List{PROPSTYLE:BackSelected, 1}  = -1
  !------------------------------------
!---------------------------------------------------------------------------
VulCelKG ROUTINE
	CASE LOC:CelPointer
	OF 0
		LOC:Cel1KG = LOC:CelValue
	OF 1
		LOC:Cel2KG = LOC:CelValue
	OF 2
		LOC:Cel3KG = LOC:CelValue
	OF 3
		LOC:Cel4KG = LOC:CelValue
	OF 4
		LOC:Cel5KG = LOC:CelValue
	OF 5
		LOC:Cel6KG = LOC:CelValue
	OF 6
		LOC:Cel7KG = LOC:CelValue
	OF 7
		LOC:Cel8KG = LOC:CelValue
	OF 8
		LOC:Cel9KG = LOC:CelValue
	OF 9
		LOC:Cel10KG = LOC:CelValue
	OF 10
		LOC:Cel11KG = LOC:CelValue
	OF 11
		LOC:Cel12KG = LOC:CelValue
	OF 12
		LOC:Cel13KG = LOC:CelValue
	OF 13
		LOC:Cel14KG = LOC:CelValue
	OF 14
		LOC:Cel15KG = LOC:CelValue
	END
	EXIT
TrekLijntjes        ROUTINE
    If IGB:BekijkenPrijzen = 1 Then
        Loc:Ole{'Application.Range(A'&Loc:Rij&':M'&Loc:Rij&').Select'}
    Else
        Loc:Ole{'Application.Range(A'&Loc:Rij&':O'&Loc:Rij&').Select'}    
    End
    
    Loc:Ole{'Application.Selection.Borders(9).Weight'}=2 ! xlEdgeBottom
    Loc:Ole{'Application.Selection.Borders(10).Weight'}=2 ! xlEdgeRight
    Loc:Ole{'Application.Selection.Borders(7).Weight'}=2 ! xlEdgeLeft
    Loc:Ole{'Application.Selection.Borders(8).Weight'}=2 ! xlEdgeTop
    Loc:Ole{'Application.Selection.Borders(11).Weight'}=2 ! xlInsideVertical
!    Loc:Ole{'Application.Selection.Borders(12).Weight'}=2 ! xlInsideHorizontal
    
    EXIT    
Vet ROUTINE    
    If IGB:BekijkenPrijzen = 1 Then
        Loc:Ole{'Application.Range(A'&Loc:Rij&':M'&Loc:Rij&').Font.Bold'}=True
    Else
        Loc:Ole{'Application.Range(A'&Loc:Rij&':O'&Loc:Rij&').Font.Bold'}=True
    End
    
    EXIT

ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

TempFormat CSTRING(10000)
  CODE
  GlobalErrors.SetProcedureName('BrowsePartijVoorraadVIEW')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  GLO:PartijVoorraad_ThreadID = THREAD()
  
  LOC:PartijVoorraadSortering = 'Op artikel'
  Loc:LegeVoorraadVerbergen=TRUE
  Loc:PeilDatum=TODAY()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?LOC:ZoekVak
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('Loc:PeilDatum',Loc:PeilDatum)                      ! Added by: BrowseBox(ABC)
  BIND('LOC:CelLocatieNamen',LOC:CelLocatieNamen)          ! Added by: BrowseBox(ABC)
  BIND('LOC:VoorraadKG',LOC:VoorraadKG)                    ! Added by: BrowseBox(ABC)
  BIND('Loc:SaldoKG',Loc:SaldoKG)                          ! Added by: BrowseBox(ABC)
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  IF SELF.Request = SelectRecord
     SELF.AddItem(?Close,RequestCancelled)                 ! Add the close control to the window manger
  ELSE
     SELF.AddItem(?Close,RequestCompleted)                 ! Add the close control to the window manger
  END
  Relate:AACel.Open                                        ! File AACel used by this procedure, so make sure it's RelationManager is open
  Relate:AViewVoorraadCelTotaal.Open                       ! File AViewVoorraadCelTotaal used by this procedure, so make sure it's RelationManager is open
  Relate:ViewPartijCelLocaties.Open                        ! File ViewPartijCelLocaties used by this procedure, so make sure it's RelationManager is open
  Relate:ViewVoorraadPartij_INDEXED.Open                   ! File ViewVoorraadPartij_INDEXED used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  LOC:PartijRoodkleurenNaDagen = GETINI('Voorraad','PartijRoodkleurenNaDagen',180,'.\Voorraad.ini')
  BRW2.Init(?List,Queue:Browse.ViewPosition,BRW2::View:Browse,Queue:Browse,Relate:ViewVoorraadPartij_INDEXED,SELF) ! Initialize the browse manager
  BRW2.SetUseMRP(False)
  SELF.Open(QuickWindow)                                   ! Open window
  !0{Prop:Text}=CLIP(0{Prop:Text}) & '(' & CLIP(LEFT(FORMAT(GLO:PartijVoorraad_ThreadID,@N_10))) & ')'
  
  IF IGB:BekijkenPrijzen <> 1 THEN
  	! Prijzen niet tonen, format string wijzigen 53R(2)|M*~Inkoop KG-Prijs
      startidx# = INSTRING(CLIP('Inkoop KG-Prijs'), CLIP(?List{PROP:Format}), 1, 1)
  
      IF (startidx# - 10 > 0)
          ! Gevonden
          TempFormat = ?List{PROP:Format}
          ?List{PROP:Format} = SUB(TempFormat, 1, startidx# - 11) & '0' & CLIP(SUB(TempFormat, startidx# - 8, LEN(TempFormat)))
          !?List{PROP:Format} = SUB(TempFormat, 1, (startidx# - 10) - 1) & '0' & SUB(TempFormat, (startidx# - 10) + 2, LEN(TempFormat) - (startidx# - 10) + 2)
      END
  END
  WinAlertMouseZoom()
  Do DefineListboxStyle
  BRW2.Q &= Queue:Browse
  BRW2.FileLoaded = 1                                      ! This is a 'file loaded' browse
  BRW2.AddSortOrder(,VVParI:ArtikelOms_PartijID_CelID_K)   ! Add the sort order for VVParI:ArtikelOms_PartijID_CelID_K for sort order 1
  BRW2.AddLocator(BRW2::Sort1:Locator)                     ! Browse has a locator for sort order 1
  BRW2::Sort1:Locator.Init(?LOC:ZoekVak,VVParI:ArtikelOms,1,BRW2) ! Initialize the browse locator using ?LOC:ZoekVak using key: VVParI:ArtikelOms_PartijID_CelID_K , VVParI:ArtikelOms
  BRW2.SetFilter('(VVParI:InslagKG<<>VVParI:UitslagKG OR VPPar:VerkoopKG <<> 0)') ! Apply filter expression to browse
  BRW2.AddResetField(LOC:PartijVoorraadSortering)          ! Apply the reset field
  BRW2.AddSortOrder(,VVParI:PartijID_CelID_K)              ! Add the sort order for VVParI:PartijID_CelID_K for sort order 2
  BRW2.AddLocator(BRW2::Sort2:Locator)                     ! Browse has a locator for sort order 2
  BRW2::Sort2:Locator.Init(?LOC:ZoekVak,VVParI:PartijID,1,BRW2) ! Initialize the browse locator using ?LOC:ZoekVak using key: VVParI:PartijID_CelID_K , VVParI:PartijID
  BRW2.AddResetField(LOC:PartijVoorraadSortering)          ! Apply the reset field
  BRW2.AddSortOrder(,VVParI:PartijID_CelID_K)              ! Add the sort order for VVParI:PartijID_CelID_K for sort order 3
  BRW2.AddLocator(BRW2::Sort3:Locator)                     ! Browse has a locator for sort order 3
  BRW2::Sort3:Locator.Init(,VVParI:PartijID,1,BRW2)        ! Initialize the browse locator using  using key: VVParI:PartijID_CelID_K , VVParI:PartijID
  BRW2.SetFilter('(VVParI:InslagKG<<>VVParI:UitslagKG)')   ! Apply filter expression to browse
  BRW2.AddSortOrder(,VVParI:ArtikelOms_PartijID_CelID_K)   ! Add the sort order for VVParI:ArtikelOms_PartijID_CelID_K for sort order 4
  BRW2.AddLocator(BRW2::Sort4:Locator)                     ! Browse has a locator for sort order 4
  BRW2::Sort4:Locator.Init(,VVParI:ArtikelOms,1,BRW2)      ! Initialize the browse locator using  using key: VVParI:ArtikelOms_PartijID_CelID_K , VVParI:ArtikelOms
  BRW2.SetFilter('((Loc:PeilDatum=TODAY() AND (VVParI:InslagKG<<>VVParI:UitslagKG OR VPPar:VerkoopKG <<> 0)) OR Loc:PeilDatum<<>TODAY())') ! Apply filter expression to browse
  BRW2.AddResetField(Loc:PeilDatum)                        ! Apply the reset field
  BRW2.AddSortOrder(,VVParI:ArtikelOms_PartijID_CelID_K)   ! Add the sort order for VVParI:ArtikelOms_PartijID_CelID_K for sort order 5
  BRW2.AddLocator(BRW2::Sort0:Locator)                     ! Browse has a locator for sort order 5
  BRW2::Sort0:Locator.Init(?LOC:ZoekVak,VVParI:ArtikelOms,1,BRW2) ! Initialize the browse locator using ?LOC:ZoekVak using key: VVParI:ArtikelOms_PartijID_CelID_K , VVParI:ArtikelOms
  BRW2.SetFilter('(VVParI:InslagKG<<>VVParI:UitslagKG OR VPPar:VerkoopKG <<> 0)') ! Apply filter expression to browse
  BRW2.AddResetField(LOC:PartijVoorraadSortering)          ! Apply the reset field
  BRW2.AddField(VVParI:ArtikelID,BRW2.Q.VVParI:ArtikelID)  ! Field VVParI:ArtikelID is a hot field or requires assignment from browse
  BRW2.AddField(VVParI:ArtikelOms,BRW2.Q.VVParI:ArtikelOms) ! Field VVParI:ArtikelOms is a hot field or requires assignment from browse
  BRW2.AddField(VVParI:PartijID,BRW2.Q.VVParI:PartijID)    ! Field VVParI:PartijID is a hot field or requires assignment from browse
  BRW2.AddField(VVParI:ExternPartijnr,BRW2.Q.VVParI:ExternPartijnr) ! Field VVParI:ExternPartijnr is a hot field or requires assignment from browse
  BRW2.AddField(VVParT:VoorraadKG,BRW2.Q.VVParT:VoorraadKG) ! Field VVParT:VoorraadKG is a hot field or requires assignment from browse
  BRW2.AddField(VPParT:VerkoopKG,BRW2.Q.VPParT:VerkoopKG)  ! Field VPParT:VerkoopKG is a hot field or requires assignment from browse
  BRW2.AddField(VVParI:CelOms,BRW2.Q.VVParI:CelOms)        ! Field VVParI:CelOms is a hot field or requires assignment from browse
  BRW2.AddField(LOC:CelLocatieNamen,BRW2.Q.LOC:CelLocatieNamen) ! Field LOC:CelLocatieNamen is a hot field or requires assignment from browse
  BRW2.AddField(LOC:VoorraadKG,BRW2.Q.LOC:VoorraadKG)      ! Field LOC:VoorraadKG is a hot field or requires assignment from browse
  BRW2.AddField(VPPar:VerkoopKG,BRW2.Q.VPPar:VerkoopKG)    ! Field VPPar:VerkoopKG is a hot field or requires assignment from browse
  BRW2.AddField(Loc:SaldoKG,BRW2.Q.Loc:SaldoKG)            ! Field Loc:SaldoKG is a hot field or requires assignment from browse
  BRW2.AddField(VVParI:BerekendeInkoopKGPrijs,BRW2.Q.VVParI:BerekendeInkoopKGPrijs) ! Field VVParI:BerekendeInkoopKGPrijs is a hot field or requires assignment from browse
  BRW2.AddField(VVParI:AanmaakDatum_DATE,BRW2.Q.VVParI:AanmaakDatum_DATE) ! Field VVParI:AanmaakDatum_DATE is a hot field or requires assignment from browse
  BRW2.AddField(VVParI:VerpakkingOmschrijving,BRW2.Q.VVParI:VerpakkingOmschrijving) ! Field VVParI:VerpakkingOmschrijving is a hot field or requires assignment from browse
  BRW2.AddField(VVParI:LeverancierFirmanaam,BRW2.Q.VVParI:LeverancierFirmanaam) ! Field VVParI:LeverancierFirmanaam is a hot field or requires assignment from browse
  BRW2.AddField(VVParI:AanmaakDatum_GROUP,BRW2.Q.VVParI:AanmaakDatum_GROUP) ! Field VVParI:AanmaakDatum_GROUP is a hot field or requires assignment from browse
  BRW2.AddField(VVParI:CelID,BRW2.Q.VVParI:CelID)          ! Field VVParI:CelID is a hot field or requires assignment from browse
  BRW2.AddField(VVParI:InslagKG,BRW2.Q.VVParI:InslagKG)    ! Field VVParI:InslagKG is a hot field or requires assignment from browse
  BRW2.AddField(VVParI:UitslagKG,BRW2.Q.VVParI:UitslagKG)  ! Field VVParI:UitslagKG is a hot field or requires assignment from browse
  BRW2.AddField(VPPar:PartijID,BRW2.Q.VPPar:PartijID)      ! Field VPPar:PartijID is a hot field or requires assignment from browse
  BRW2.AddField(VPPar:CelID,BRW2.Q.VPPar:CelID)            ! Field VPPar:CelID is a hot field or requires assignment from browse
  BRW2.AddField(VVParT:PartijID,BRW2.Q.VVParT:PartijID)    ! Field VVParT:PartijID is a hot field or requires assignment from browse
  BRW2.AddField(VPParT:PartijID,BRW2.Q.VPParT:PartijID)    ! Field VPParT:PartijID is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface)                        ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('BrowsePartijVoorraadVIEW',QuickWindow)     ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  BRW2.AddToolbarTarget(Toolbar)                           ! Browse accepts toolbar control
  SELF.SetAlerts()
  NetLocalRefreshDate = today()         ! NetTalk (NetRefresh)
  NetLocalRefreshTime = clock()
  EnterByTabManager.Init(False)
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  GLO:PartijVoorraad_ThreadID = 0
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:AACel.Close
    Relate:AViewVoorraadCelTotaal.Close
    Relate:ViewPartijCelLocaties.Close
    Relate:ViewVoorraadPartij_INDEXED.Close
  END
  IF SELF.Opened
    INIMgr.Update('BrowsePartijVoorraadVIEW',QuickWindow)  ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.Reset PROCEDURE(BYTE Force=0)

  CODE
  FREE(CelLocatieQueue)
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
  			Message('AUB een schermprint maken en naar JMD mailen','Request = ViewRecord',ICON:Hand)
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
    OF ?PartijVoorraadVerloop
      ! Planningrecord inlezen
      Get(BRW2.Q, Choice(?List))
      IF NOT(ERROR()) THEN
          IF CLIP(BRW2.Q.VVParI:ArtikelID) <> '' THEN
      		BrowseVoorraadVerloopPerPartij(CLIP(BRW2.Q.VVParI:ArtikelID), CLIP(BRW2.Q.VVParI:PartijID))
      		!ThisWindow.Reset(True)  ! uitgeschakeld want hierdoor wordt niet veranderd
              Select(?List)
      	ELSE
      		MESSAGE('Geen voorraad-regel geselecteerd')
          .
      END
    OF ?Overboeken2
      Get(BRW2.Q,Choice(?List))
      IF NOT(ERROR()) THEN
          LOC:ArtikelID = CLIP(BRW2.Q.VVParI:ArtikelID)
          LOC:PartijCelID = CLIP(FORMAT(BRW2.Q.VVParI:PartijID, @N05)) & '.' & CLIP(BRW2.Q.VVParI:CelID)
      
          Loc:CelLocatieID = 0
      ELSE
          CYCLE
      END
      
    OF ?ExtraStickers
      ! Planningrecord inlezen
      Get(BRW2.Q, Choice(?List))
      IF NOT(ERROR()) THEN
          CLEAR(Par:Record)
          Par:PartijID = BRW2.Q.VVParI:PartijID
          IF NOT(Access:Partij.TryFetch(Par:Partij_PK) = Level:Benign)
              Message('Partij kan niet gevonden worden','Fout',Icon:Hand)
          ELSE
              aantalpallets# = ReportPalletStickers()
          END
      END    
    OF ?WijzigLocatie
      Get(BRW2.Q,Choice(?List))
      IF NOT(ERROR()) THEN
          WijzigLocatie(BRW2.Q.VVParI:PartijID, BRW2.Q.VVParI:CelID)
          ThisWindow.Reset(1)
      END
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?Close:2
      ThisWindow.Update()
      ThisWindow.Reset(1)
    OF ?Overboeken2
      ThisWindow.Update()
      GlobalRequest = InsertRecord
      UpdateOverboeking(LOC:ArtikelID, LOC:PartijCelID,Loc:CelLocatieID)
      ThisWindow.Reset
    OF ?Excel
      ThisWindow.Update()
      Case Choice(?CurrentTab)
      Of 1
          ThisWindow.Export2Excel(1, Clip(LOC:PartijVoorraadSortering))
      Of 2
          ThisWindow.Export2Excel(2, '')
      End
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
    OF EVENT:Notify
        ! Focus overnemen
        !NOTIFICATION(LOC:NotifyCode)
        !IF LOC:NotifyCode = 1 THEN
            ThisWindow{Prop:Active} = 1
        !END
    OF EVENT:OpenWindow
        post(event:visibleondesktop)
    END
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue

ThisWindow.Export2Excel PROCEDURE(LONG pTab, STRING pSortering)

!ThisWindow.Export2Excel PROCEDURE(LONG pTab, STRING pSortering) - DATA

  CODE
  !ThisWindow.Export2Excel PROCEDURE(LONG pTab, STRING pSortering) - CODE
  !Message('Export2Excel PROCEDURE(LONG pTab = '& pTab &', STRING pSortering = '''& pSortering &''') - QRec = '& Records(BRW2.Q))
  db.DebugOut('Export2Excel PROCEDURE(LONG pTab = '& pTab &', STRING pSortering = '''& pSortering &''')')
  SETCURSOR(CURSOR:Wait)
  GlobalClass.InitExcelOle
  GlobalClass.MaakExcel('')
      
  !Loc:Ole{'Sheets.Add'}
  Case pTab
  Of 1
      Loc:Ole{'Sheets("Blad1").Name'} = 'Partijvoorraad'
  Of 2
      Loc:Ole{'Sheets("Blad1").Name'} = 'Partijvoorraad_op_Peildatum'
  End
  
  !omdat de browse op File staat kunnen we de    
  LOC:Rij = 1
  Loc:Ole{'Application.Range(A'&Loc:Rij&').Value'}='Partijvoorraad' & Choose(pTab=2, ' voor peildatum '&Format(Loc:PeilDatum,@d06-), ' '&Clip(pSortering))
  Do Vet
          
  LOC:Rij += 2
  Loc:Ole{'Application.Range(A'&Loc:Rij&').Value'}='Artikel'
  Loc:Ole{'Application.Range(C'&Loc:Rij&').Value'}='Partij'
  Loc:Ole{'Application.Range(G'&Loc:Rij&').Value'}='Cel'
  Loc:Ole{'Application.Range(L'&Loc:Rij&').Value'}='Aanmaak'
  Do Vet        
  
  LOC:Rij += 1
  Loc:Ole{'Application.Range(A'&Loc:Rij&').Value'}='ID'
  Loc:Ole{'Application.Range(B'&Loc:Rij&').Value'}='Omschrijving'
  
  Loc:Ole{'Application.Range(C'&Loc:Rij&').Value'}='Intern'
  Loc:Ole{'Application.Range(D'&Loc:Rij&').Value'}='Extern'
  Loc:Ole{'Application.Range(E'&Loc:Rij&').Value'}='Voorraad (KG)'
  Loc:Ole{'Application.Range(F'&Loc:Rij&').Value'}='Verkocht (KG)'
  
  Loc:Ole{'Application.Range(G'&Loc:Rij&').Value'}='Cel'
  Loc:Ole{'Application.Range(H'&Loc:Rij&').Value'}='Locatie'
  Loc:Ole{'Application.Range(I'&Loc:Rij&').Value'}='Voorraad (KG)'
  Loc:Ole{'Application.Range(J'&Loc:Rij&').Value'}='Verkocht (KG)'
  Loc:Ole{'Application.Range(K'&Loc:Rij&').Value'}='Saldo (KG)'
  
  Loc:Ole{'Application.Range(L'&Loc:Rij&').Value'}='Datum'
  Loc:Ole{'Application.Range(M'&Loc:Rij&').Value'}='Verpakking'
  Loc:Ole{'Application.Range(N'&Loc:Rij&').Value'}='Leverancier'
  
  If IGB:BekijkenPrijzen = 1 Then
      Loc:Ole{'Application.Range(O'&Loc:Rij&').Value'}='Inkoop KG-Prijs'
  End
  
  Do Vet        
  !Do TrekLijntjes        
          
  LOOP i# = 1 TO Records(BRW2.Q)
      GET(BRW2.Q, i#)
      If Error() Then Break.
      
      Loc:Rij+=1
      Loc:Ole{'Application.Range(A'&Loc:Rij&').Value'}=BRW2.Q.VVParI:ArtikelID    
      Loc:Ole{'Application.Range(B'&Loc:Rij&').Value'}=BRW2.Q.VVParI:ArtikelOms
  
      Loc:Ole{'Application.Range(C'&Loc:Rij&').Value'}=BRW2.Q.VVParI:PartijID
      Loc:Ole{'Application.Range(D'&Loc:Rij&').Value'}=BRW2.Q.VVParI:ExternPartijnr
      Loc:Ole{'Application.Range(E'&Loc:Rij&').Value'}=BRW2.Q.VVParT:VoorraadKG
      Loc:Ole{'Application.Range(F'&Loc:Rij&').Value'}=BRW2.Q.VPParT:VerkoopKG
  
      Loc:Ole{'Application.Range(G'&Loc:Rij&').Value'}=BRW2.Q.VVParI:CelOms
      Loc:Ole{'Application.Range(H'&Loc:Rij&').Value'}=BRW2.Q.LOC:CelLocatieNamen
      Loc:Ole{'Application.Range(I'&Loc:Rij&').Value'}=BRW2.Q.LOC:VoorraadKG
      Loc:Ole{'Application.Range(J'&Loc:Rij&').Value'}=BRW2.Q.VPPar:VerkoopKG
      Loc:Ole{'Application.Range(K'&Loc:Rij&').Value'}=BRW2.Q.Loc:SaldoKG
  
      Loc:Ole{'Application.Range(L'&Loc:Rij&').Value'}=Format(BRW2.Q.VVParI:AanmaakDatum_DATE,@D06-)
      Loc:Ole{'Application.Range(M'&Loc:Rij&').Value'}=BRW2.Q.VVParI:VerpakkingOmschrijving
      Loc:Ole{'Application.Range(N'&Loc:Rij&').Value'}=BRW2.Q.VVParI:LeverancierFirmanaam
      
      If IGB:BekijkenPrijzen = 1 Then
          Loc:Ole{'Application.Range(O'&Loc:Rij&').Value'}=FORMAT(BRW2.Q.VVParI:BerekendeInkoopKGPrijs, @n-13`2)
      End
      
      Do TrekLijntjes
  END
          
  Loc:Ole{'Cells.Select'}
  Loc:Ole{'Application.Selection.Font.Name'} = 'Ariel'
  Loc:Ole{'Application.Selection.Font.Size'} = 11
  Loc:Ole{'Cells(1,1).Select'}
  
  If IGB:BekijkenPrijzen = 1 Then
      Loc:Ole{'Application.Columns(A:M).AutoFit'}
  Else
      Loc:Ole{'Application.Columns(A:O).AutoFit'}
  End
  Loc:Ole{'Application.Rows(1:'&Loc:Rij&').AutoFit'}
  Loc:Ole{'Application.ActiveSheet.PageSetup.Zoom'} = 75 != Loc:Ole{'Application.ActiveSheet.PageSetup.BlackAndWhite'}!
  Loc:Ole{'Application.ActiveSheet.PageSetup.Orientation'} = 2 != Landscape
  Loc:Ole{'Application.ActiveSheet.PageSetup.TopMargin'} = 30 != Points (1/72 inch
  Loc:Ole{'Application.ActiveSheet.PageSetup.BottomMargin'} = 30 != Points (1/72 inch
  Loc:Ole{'Application.ActiveSheet.PageSetup.LeftMargin'} = 30 != Points (1/72 inch
  Loc:Ole{'Application.ActiveSheet.PageSetup.RightMargin'} = 30 != Points (1/72 inch
  
  Loc:Ole{'Application.Visible'}=true ! nu pas excel laten zien
  DESTROY(LOC:Ole)
  
  SETCURSOR()


LocalClass.PartijVoorraadopPeilDatum        Procedure(*CString pArtikelID, Long pPartijID, LONG pCelID,  *LONG pVoorraad, *REAL pVerkocht)
CODE
    !LocalClass.PartijVoorraadopPeilDatum(VVParI:ArtikelID ,VVParI:PartijID , VVParT:VoorraadKG, VPParT:VerkoopKG, VVParI:InslagKG, VVParI:UitslagKG, VPPar:VerkoopKG)
    ! pVoorraad = VVParT:VoorraadKG
    ! pVerkocht = VPParT:VerkoopKG
    ! pCelVoorraad = Loc:Voorraad
    ! pCelVerkocht = VPPar:VerkoopKG
    Clear(pVoorraad)
    Clear(pVerkocht)
    
!    CLEAR(AVVCT:Record)
!    AViewVoorraadCelTotaal{PROP:SQL} = 'SELECT TOP (100) PERCENT dbo.Mutatie.ArtikelID, dbo.Mutatie.CelID, '&| 
!        'SUM(dbo.Mutatie.InslagKG) AS kg, '&|
!        'SUM(dbo.Mutatie.InslagPallet) AS pallets, '&|
!        'SUM(dbo.Mutatie.UitslagKG) AS VerkoopKG, '&|
!        'SUM(dbo.Mutatie.UitslagPallet) AS VerkoopPallet, '&|
!        'dbo.ViewArtikel.ArtikelOms FROM dbo.Mutatie INNER JOIN ' & |
!	'dbo.ViewArtikel ON dbo.Mutatie.ArtikelID = dbo.ViewArtikel.ArtikelID LEFT OUTER JOIN ' & |
!	'dbo.Partij ON dbo.Mutatie.PartijID = dbo.Partij.PartijID ' & |
!        'WHERE dbo.Mutatie.ArtikelID = <39>'&pArtikelID&'<39> AND dbo.Mutatie.PartijID = '&pPartijID& |
!        ' AND dbo.Mutatie.CelID = '&pCelID&' AND (dbo.Mutatie.DatumTijd is NULL OR dbo.Mutatie.DatumTijd <= ' & CHR(39) & CLIP(FORMAT(LOC:PeilDatum,@d2-)) & ' 23:59' & CHR(39) & ') ' & |
!	'GROUP BY dbo.Mutatie.CelID, dbo.Mutatie.ArtikelID, dbo.ViewArtikel.ArtikelOms ' & |
!	'ORDER BY dbo.Mutatie.CelID'
    CLEAR(AVVCT:Record)
    AViewVoorraadCelTotaal{PROP:SQL} = 'SELECT TOP (100) PERCENT dbo.Mutatie.ArtikelID, dbo.Mutatie.CelID, '&| 
        'SUM(CASE WHEN dbo.Mutatie.SoortMutatie = <39>OUIT<39> THEN -dbo.Mutatie.[UitslagKG] '&|
			'WHEN dbo.Mutatie.SoortMutatie = <39>UIT<39> THEN -dbo.Mutatie.[UitslagKG] '&|
			'WHEN dbo.Mutatie.SoortMutatie = <39>EUIT<39> THEN -dbo.Mutatie.[UitslagKG] '&|
			'WHEN dbo.Mutatie.SoortMutatie = <39>IN<39> THEN dbo.Mutatie.[InslagKG] '&|
	    	'WHEN dbo.Mutatie.SoortMutatie = <39>OIN<39> THEN dbo.Mutatie.[InslagKG] '&|
			'WHEN dbo.Mutatie.SoortMutatie = <39>EIN<39> THEN dbo.Mutatie.[InslagKG] '&|
            'ELSE 0 '&|
            'END) AS kg, '&|
        'SUM(CASE WHEN dbo.Mutatie.SoortMutatie = <39>OUIT<39> THEN -dbo.Mutatie.[UitslagPallet] '&|
			'WHEN dbo.Mutatie.SoortMutatie = <39>EUIT<39> THEN -dbo.Mutatie.[UitslagPallet] '&|
			'WHEN dbo.Mutatie.SoortMutatie = <39>UIT<39> THEN -dbo.Mutatie.[UitslagPallet] '&|
			'WHEN dbo.Mutatie.SoortMutatie = <39>IN<39> THEN dbo.Mutatie.[InslagPallet] '&|
	    	'WHEN dbo.Mutatie.SoortMutatie = <39>OIN<39> THEN dbo.Mutatie.[InslagPallet] '&|
			'WHEN dbo.Mutatie.SoortMutatie = <39>EIN<39> THEN dbo.Mutatie.[InslagPallet] '&|
            'ELSE 0 '&|
            'END) AS pallets, '&|
        '0 AS VerkoopKG, '&|
        '0 AS VerkoopPallet, '&|
        'dbo.ViewArtikel.ArtikelOms FROM dbo.Mutatie INNER JOIN ' & |
	'dbo.ViewArtikel ON dbo.Mutatie.ArtikelID = dbo.ViewArtikel.ArtikelID LEFT OUTER JOIN ' & |
	'dbo.Partij ON dbo.Mutatie.PartijID = dbo.Partij.PartijID ' & |
        'WHERE dbo.Mutatie.ArtikelID = <39>'&pArtikelID&'<39> AND dbo.Mutatie.PartijID = '&pPartijID& |
        ' AND dbo.Mutatie.CelID = '&pCelID&' AND (dbo.Mutatie.DatumTijd is NULL OR dbo.Mutatie.DatumTijd <= ' & CHR(39) & CLIP(FORMAT(LOC:PeilDatum,@d2-)) & ' 23:59' & CHR(39) & ') ' & |
	'GROUP BY dbo.Mutatie.CelID, dbo.Mutatie.ArtikelID, dbo.ViewArtikel.ArtikelOms ' & |
        'ORDER BY dbo.Mutatie.CelID'
    IF ERRORCODE()=90
        Message('File Error '&FILEERROR())
    END
    
    LOOP UNTIL ACCESS:AViewVoorraadCelTotaal.Next()
        pVoorraad+ = AVVCT:kg
        pVerkocht+= AVVCT:VerkoopKG
    END
    
    db.DebugOut('LocalClass.PartijVoorraadopPeilDatum Artikelid:'&pArtikelID&' en PartijID:'&pPartijID&|
        'Cel '&pCelID&' Voorraad '&pVoorraad&' Verkocht '&pVerkocht)
    RETURN

BRW2.Fetch PROCEDURE(BYTE Direction)

GreenBarIndex   LONG,AUTO
  CODE
  PARENT.Fetch(Direction)
  !----------------------------------------------------------------------
    LOOP GreenBarIndex=1 TO RECORDS(SELF.Q)
      GET(SELF.Q,GreenBarIndex)
      SELF.Q.VVParI:ArtikelID_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for VVParI:ArtikelID
      SELF.Q.VVParI:ArtikelID_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.VVParI:ArtikelID_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.VVParI:ArtikelID_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.VVParI:ArtikelOms_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for VVParI:ArtikelOms
      SELF.Q.VVParI:ArtikelOms_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.VVParI:ArtikelOms_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.VVParI:ArtikelOms_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.VVParI:PartijID_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for VVParI:PartijID
      SELF.Q.VVParI:PartijID_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.VVParI:PartijID_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.VVParI:PartijID_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.VVParI:ExternPartijnr_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for VVParI:ExternPartijnr
      SELF.Q.VVParI:ExternPartijnr_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.VVParI:ExternPartijnr_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.VVParI:ExternPartijnr_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.VVParT:VoorraadKG_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for VVParT:VoorraadKG
      SELF.Q.VVParT:VoorraadKG_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.VVParT:VoorraadKG_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.VVParT:VoorraadKG_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.VPParT:VerkoopKG_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for VPParT:VerkoopKG
      SELF.Q.VPParT:VerkoopKG_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.VPParT:VerkoopKG_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.VPParT:VerkoopKG_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.VVParI:CelOms_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for VVParI:CelOms
      SELF.Q.VVParI:CelOms_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.VVParI:CelOms_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.VVParI:CelOms_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.LOC:CelLocatieNamen_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for LOC:CelLocatieNamen
      SELF.Q.LOC:CelLocatieNamen_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.LOC:CelLocatieNamen_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.LOC:CelLocatieNamen_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.LOC:VoorraadKG_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for LOC:VoorraadKG
      SELF.Q.LOC:VoorraadKG_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.LOC:VoorraadKG_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.LOC:VoorraadKG_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.VPPar:VerkoopKG_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for VPPar:VerkoopKG
      SELF.Q.VPPar:VerkoopKG_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.VPPar:VerkoopKG_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.VPPar:VerkoopKG_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Loc:SaldoKG_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for Loc:SaldoKG
      SELF.Q.Loc:SaldoKG_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.Loc:SaldoKG_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.Loc:SaldoKG_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.VVParI:BerekendeInkoopKGPrijs_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for VVParI:BerekendeInkoopKGPrijs
      SELF.Q.VVParI:BerekendeInkoopKGPrijs_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.VVParI:BerekendeInkoopKGPrijs_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.VVParI:BerekendeInkoopKGPrijs_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.VVParI:AanmaakDatum_DATE_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for VVParI:AanmaakDatum_DATE
      SELF.Q.VVParI:AanmaakDatum_DATE_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.VVParI:AanmaakDatum_DATE_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.VVParI:AanmaakDatum_DATE_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.VVParI:VerpakkingOmschrijving_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for VVParI:VerpakkingOmschrijving
      SELF.Q.VVParI:VerpakkingOmschrijving_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.VVParI:VerpakkingOmschrijving_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.VVParI:VerpakkingOmschrijving_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.VVParI:LeverancierFirmanaam_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for VVParI:LeverancierFirmanaam
      SELF.Q.VVParI:LeverancierFirmanaam_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.VVParI:LeverancierFirmanaam_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.VVParI:LeverancierFirmanaam_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      PUT(SELF.Q)
    END
  !----------------------------------------------------------------------
  ! Kleuren van de cellen bij partijen ouder dan XX dagen
  LOOP GreenBarIndex=1 TO RECORDS(SELF.Q)
      GET(SELF.Q, GreenBarIndex)
      IF NOT(ERROR()) THEN
          IF SELF.Q.VVParI:AanmaakDatum_DATE < (TODAY() - LOC:PartijRoodkleurenNaDagen) THEN
              SELF.Q.VVParI:AanmaakDatum_DATE_NormalFG = Color:Black
              SELF.Q.VVParI:AanmaakDatum_DATE_NormalBG = Color:Red
              SELF.Q.VVParI:AanmaakDatum_DATE_SelectedFG = Color:Black
              SELF.Q.VVParI:AanmaakDatum_DATE_SelectedBG = Color:Red
              PUT(SELF.Q)
          END
      END        
  END


BRW2.ResetSort PROCEDURE(BYTE Force)

ReturnValue          BYTE,AUTO

  CODE
  IF CLIP(LOC:PartijVoorraadSortering) = CLIP('Op extern partijnr.')
    RETURN SELF.SetSort(1,Force)
  ELSIF CLIP(LOC:PartijVoorraadSortering) = CLIP('Op intern partijnr.')
    RETURN SELF.SetSort(2,Force)
  ELSIF CLIP(LOC:PartijVoorraadSortering) = CLIP('Op aanmaakdatum')
    RETURN SELF.SetSort(3,Force)
  ELSIF Choice(?CurrentTab)=2
    RETURN SELF.SetSort(4,Force)
  ELSE
    RETURN SELF.SetSort(5,Force)
  END
  ReturnValue = PARENT.ResetSort(Force)
  RETURN ReturnValue


BRW2.SetQueueRecord PROCEDURE

  CODE
  IF CHOICE(?CurrentTab)=2 AND Loc:PeilDatum<>TODAY()
          ! getVoorraad met peildatum
      !LocalClass.PartijVoorraadopPeilDatum(VVParI:ArtikelID ,VVParI:PartijID ,VVParI:CelID,  VVParT:VoorraadKG, VPParT:VerkoopKG, LOC:VoorraadKG, VPPar:VerkoopKG)
      LOC:VoorraadKG = Loc:RegelKG
      !VPPar:VerkoopKg=Loc:RegelVerkoop
      db.DebugOut('SetQ '&CHOICE(?CurrentTab)&' '&Loc:RegelKG&'-'&Loc:RegelVerkoop)
  ELSE
      LOC:VoorraadKG = VVParI:InslagKG - VVParI:UitslagKG
  END
        
          
  LOC:CelLocatieNamen = CLIP(CachingClass.GetCelLocatieNaam(VVParI:PartijID, VVParI:CelID))
  
  Loc:SaldoKG=LOC:VoorraadKG-VPPar:VerkoopKG
  PARENT.SetQueueRecord
  
  SELF.Q.VVParT:VoorraadKG_Style = 0 ! 
  SELF.Q.VPParT:VerkoopKG_Style = 0 ! 
  !----------------------------------------------------------------------
      SELF.Q.VVParI:ArtikelID_NormalFG   = CHOOSE(CHOICE(?List) % 2,-1,-1) ! Set color values for VVParI:ArtikelID
      SELF.Q.VVParI:ArtikelID_NormalBG   = CHOOSE(CHOICE(?List) % 2,-1,8454143)
      SELF.Q.VVParI:ArtikelID_SelectedFG = CHOOSE(CHOICE(?List) % 2,-1,8454143)
      SELF.Q.VVParI:ArtikelID_SelectedBG = CHOOSE(CHOICE(?List) % 2,-1,-1)
      SELF.Q.VVParI:ArtikelOms_NormalFG   = CHOOSE(CHOICE(?List) % 2,-1,-1) ! Set color values for VVParI:ArtikelOms
      SELF.Q.VVParI:ArtikelOms_NormalBG   = CHOOSE(CHOICE(?List) % 2,-1,8454143)
      SELF.Q.VVParI:ArtikelOms_SelectedFG = CHOOSE(CHOICE(?List) % 2,-1,8454143)
      SELF.Q.VVParI:ArtikelOms_SelectedBG = CHOOSE(CHOICE(?List) % 2,-1,-1)
      SELF.Q.VVParI:PartijID_NormalFG   = CHOOSE(CHOICE(?List) % 2,-1,-1) ! Set color values for VVParI:PartijID
      SELF.Q.VVParI:PartijID_NormalBG   = CHOOSE(CHOICE(?List) % 2,-1,8454143)
      SELF.Q.VVParI:PartijID_SelectedFG = CHOOSE(CHOICE(?List) % 2,-1,8454143)
      SELF.Q.VVParI:PartijID_SelectedBG = CHOOSE(CHOICE(?List) % 2,-1,-1)
      SELF.Q.VVParI:ExternPartijnr_NormalFG   = CHOOSE(CHOICE(?List) % 2,-1,-1) ! Set color values for VVParI:ExternPartijnr
      SELF.Q.VVParI:ExternPartijnr_NormalBG   = CHOOSE(CHOICE(?List) % 2,-1,8454143)
      SELF.Q.VVParI:ExternPartijnr_SelectedFG = CHOOSE(CHOICE(?List) % 2,-1,8454143)
      SELF.Q.VVParI:ExternPartijnr_SelectedBG = CHOOSE(CHOICE(?List) % 2,-1,-1)
      SELF.Q.VVParT:VoorraadKG_NormalFG   = CHOOSE(CHOICE(?List) % 2,-1,-1) ! Set color values for VVParT:VoorraadKG
      SELF.Q.VVParT:VoorraadKG_NormalBG   = CHOOSE(CHOICE(?List) % 2,-1,8454143)
      SELF.Q.VVParT:VoorraadKG_SelectedFG = CHOOSE(CHOICE(?List) % 2,-1,8454143)
      SELF.Q.VVParT:VoorraadKG_SelectedBG = CHOOSE(CHOICE(?List) % 2,-1,-1)
      SELF.Q.VPParT:VerkoopKG_NormalFG   = CHOOSE(CHOICE(?List) % 2,-1,-1) ! Set color values for VPParT:VerkoopKG
      SELF.Q.VPParT:VerkoopKG_NormalBG   = CHOOSE(CHOICE(?List) % 2,-1,8454143)
      SELF.Q.VPParT:VerkoopKG_SelectedFG = CHOOSE(CHOICE(?List) % 2,-1,8454143)
      SELF.Q.VPParT:VerkoopKG_SelectedBG = CHOOSE(CHOICE(?List) % 2,-1,-1)
      SELF.Q.VVParI:CelOms_NormalFG   = CHOOSE(CHOICE(?List) % 2,-1,-1) ! Set color values for VVParI:CelOms
      SELF.Q.VVParI:CelOms_NormalBG   = CHOOSE(CHOICE(?List) % 2,-1,8454143)
      SELF.Q.VVParI:CelOms_SelectedFG = CHOOSE(CHOICE(?List) % 2,-1,8454143)
      SELF.Q.VVParI:CelOms_SelectedBG = CHOOSE(CHOICE(?List) % 2,-1,-1)
      SELF.Q.LOC:CelLocatieNamen_NormalFG   = CHOOSE(CHOICE(?List) % 2,-1,-1) ! Set color values for LOC:CelLocatieNamen
      SELF.Q.LOC:CelLocatieNamen_NormalBG   = CHOOSE(CHOICE(?List) % 2,-1,8454143)
      SELF.Q.LOC:CelLocatieNamen_SelectedFG = CHOOSE(CHOICE(?List) % 2,-1,8454143)
      SELF.Q.LOC:CelLocatieNamen_SelectedBG = CHOOSE(CHOICE(?List) % 2,-1,-1)
      SELF.Q.LOC:VoorraadKG_NormalFG   = CHOOSE(CHOICE(?List) % 2,-1,-1) ! Set color values for LOC:VoorraadKG
      SELF.Q.LOC:VoorraadKG_NormalBG   = CHOOSE(CHOICE(?List) % 2,-1,8454143)
      SELF.Q.LOC:VoorraadKG_SelectedFG = CHOOSE(CHOICE(?List) % 2,-1,8454143)
      SELF.Q.LOC:VoorraadKG_SelectedBG = CHOOSE(CHOICE(?List) % 2,-1,-1)
      SELF.Q.VPPar:VerkoopKG_NormalFG   = CHOOSE(CHOICE(?List) % 2,-1,-1) ! Set color values for VPPar:VerkoopKG
      SELF.Q.VPPar:VerkoopKG_NormalBG   = CHOOSE(CHOICE(?List) % 2,-1,8454143)
      SELF.Q.VPPar:VerkoopKG_SelectedFG = CHOOSE(CHOICE(?List) % 2,-1,8454143)
      SELF.Q.VPPar:VerkoopKG_SelectedBG = CHOOSE(CHOICE(?List) % 2,-1,-1)
      SELF.Q.Loc:SaldoKG_NormalFG   = CHOOSE(CHOICE(?List) % 2,-1,-1) ! Set color values for Loc:SaldoKG
      SELF.Q.Loc:SaldoKG_NormalBG   = CHOOSE(CHOICE(?List) % 2,-1,8454143)
      SELF.Q.Loc:SaldoKG_SelectedFG = CHOOSE(CHOICE(?List) % 2,-1,8454143)
      SELF.Q.Loc:SaldoKG_SelectedBG = CHOOSE(CHOICE(?List) % 2,-1,-1)
      SELF.Q.VVParI:BerekendeInkoopKGPrijs_NormalFG   = CHOOSE(CHOICE(?List) % 2,-1,-1) ! Set color values for VVParI:BerekendeInkoopKGPrijs
      SELF.Q.VVParI:BerekendeInkoopKGPrijs_NormalBG   = CHOOSE(CHOICE(?List) % 2,-1,8454143)
      SELF.Q.VVParI:BerekendeInkoopKGPrijs_SelectedFG = CHOOSE(CHOICE(?List) % 2,-1,8454143)
      SELF.Q.VVParI:BerekendeInkoopKGPrijs_SelectedBG = CHOOSE(CHOICE(?List) % 2,-1,-1)
      SELF.Q.VVParI:AanmaakDatum_DATE_NormalFG   = CHOOSE(CHOICE(?List) % 2,-1,-1) ! Set color values for VVParI:AanmaakDatum_DATE
      SELF.Q.VVParI:AanmaakDatum_DATE_NormalBG   = CHOOSE(CHOICE(?List) % 2,-1,8454143)
      SELF.Q.VVParI:AanmaakDatum_DATE_SelectedFG = CHOOSE(CHOICE(?List) % 2,-1,8454143)
      SELF.Q.VVParI:AanmaakDatum_DATE_SelectedBG = CHOOSE(CHOICE(?List) % 2,-1,-1)
      SELF.Q.VVParI:VerpakkingOmschrijving_NormalFG   = CHOOSE(CHOICE(?List) % 2,-1,-1) ! Set color values for VVParI:VerpakkingOmschrijving
      SELF.Q.VVParI:VerpakkingOmschrijving_NormalBG   = CHOOSE(CHOICE(?List) % 2,-1,8454143)
      SELF.Q.VVParI:VerpakkingOmschrijving_SelectedFG = CHOOSE(CHOICE(?List) % 2,-1,8454143)
      SELF.Q.VVParI:VerpakkingOmschrijving_SelectedBG = CHOOSE(CHOICE(?List) % 2,-1,-1)
      SELF.Q.VVParI:LeverancierFirmanaam_NormalFG   = CHOOSE(CHOICE(?List) % 2,-1,-1) ! Set color values for VVParI:LeverancierFirmanaam
      SELF.Q.VVParI:LeverancierFirmanaam_NormalBG   = CHOOSE(CHOICE(?List) % 2,-1,8454143)
      SELF.Q.VVParI:LeverancierFirmanaam_SelectedFG = CHOOSE(CHOICE(?List) % 2,-1,8454143)
      SELF.Q.VVParI:LeverancierFirmanaam_SelectedBG = CHOOSE(CHOICE(?List) % 2,-1,-1)
  !----------------------------------------------------------------------


BRW2.ValidateRecord PROCEDURE

ReturnValue          BYTE,AUTO

BRW2::RecordStatus   BYTE,AUTO
  CODE
  ReturnValue = PARENT.ValidateRecord()
  IF CHOICE(?CurrentTab)=2 AND Loc:PeilDatum<>TODAY()
          ! getVoorraad met peildatum
      LocalClass.PartijVoorraadopPeilDatum(VVParI:ArtikelID ,VVParI:PartijID ,VVParI:CelID , |
          Loc:RegelKG, Loc:RegelVerkoop)
      
      db.DebugOut('ValQ '&CHOICE(?CurrentTab)&' '&Loc:RegelKG&'-'&|
          Loc:RegelVerkoop&' '&VVParI:ArtikelID&' ,'&VVParI:PartijID&' ,'&VVParI:CelID&|
          ', '&LOC:VoorraadKG&', '&VPPar:VerkoopKG)
      
      IF Loc:RegelKG = Loc:RegelVerkoop THEN Return Record:Filtered.
  ELSE
      IF VVParI:InslagKG=VVParI:UitslagKG AND VPPar:VerkoopKG = 0 THEN Return Record:Filtered.
  END
  BRW2::RecordStatus=ReturnValue
  RETURN ReturnValue


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window
  SELF.SetStrategy(?List, Resize:FixLeft+Resize:FixTop, Resize:ConstantRight+Resize:ConstantBottom) ! Override strategy for ?List
  SELF.SetStrategy(?PartijVoorraadVerloop, Resize:FixLeft+Resize:FixTop, Resize:LockSize) ! Override strategy for ?PartijVoorraadVerloop
  SELF.SetStrategy(?Overboeken2, Resize:FixLeft+Resize:FixTop, Resize:LockSize) ! Override strategy for ?Overboeken2
  SELF.SetStrategy(?ExtraStickers, Resize:FixLeft+Resize:FixTop, Resize:LockSize) ! Override strategy for ?ExtraStickers
  SELF.SetStrategy(?WijzigLocatie, Resize:FixLeft+Resize:FixTop, Resize:LockSize) ! Override strategy for ?WijzigLocatie
  SELF.SetStrategy(?PROMPT1, Resize:FixRight+Resize:FixTop, Resize:LockSize) ! Override strategy for ?PROMPT1
  SELF.SetStrategy(?LOC:ZoekVak, Resize:FixRight+Resize:FixTop, Resize:LockSize) ! Override strategy for ?LOC:ZoekVak
  SELF.SetStrategy(?LOC:PartijVoorraadSortering:Prompt, Resize:FixRight+Resize:FixTop, Resize:LockSize) ! Override strategy for ?LOC:PartijVoorraadSortering:Prompt
  SELF.SetStrategy(?LOC:PartijVoorraadSortering, Resize:FixRight+Resize:FixTop, Resize:LockSize) ! Override strategy for ?LOC:PartijVoorraadSortering
  SELF.SetStrategy(?Close, Resize:FixRight+Resize:FixBottom, Resize:LockSize) ! Override strategy for ?Close
  SELF.SetStrategy(?Close:2, Resize:FixRight+Resize:FixBottom, Resize:LockSize) ! Override strategy for ?Close:2

