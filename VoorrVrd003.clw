

   MEMBER('VoorrVrd.clw')                                  ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABDROPS.INC'),ONCE
   INCLUDE('ABPOPUP.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('VOORRVRD003.INC'),ONCE        !Local module procedure declarations
                     END


!!! <summary>
!!! Generated from procedure template - Window
!!! Browse the VoorraadVerloop file
!!! </summary>
BrowseVoorraadVerloop PROCEDURE (ArtikelID)

LOC:ArtikelID        CSTRING(31)                           ! 
LOC:LeverancierID    LONG                                  ! 
LOC:Klant            STRING(40)                            ! 
LOC:SoortMutatieFilter LONG                                ! 
LOC:EINFilter        STRING(10)                            ! 
LOC:EOUTFilter       STRING(10)                            ! 
LOC:HandmatigTonen   BYTE                                  ! 
LOC:PartijID         LONG                                  ! 
LOC:Leverancier      STRING(50)                            ! 
CurrentTab           STRING(80)                            ! 
LOC:TotaalKG         REAL                                  ! 
LOC:TotaalPallets    LONG                                  ! 
LOC:VerpakkingOmschrijving STRING(30)                      ! 
LOC:Locatienamen     STRING(50)                            ! 
Loc:KlantNaam        CSTRING(51)                           ! 
LOC:KlantID          LONG                                  ! 
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
LOC:KlantSaldoQueue  QUEUE,PRE(KSD)                        ! 
MutatieID            LONG                                  ! 
KG                   DECIMAL(10,2)                         ! 
Pallets              LONG                                  ! 
                     END                                   ! 
LOC:PartijSaldoQueue QUEUE,PRE(PSLD)                       ! 
MutatieID            LONG                                  ! 
KG                   DECIMAL(11,2)                         ! 
Pallets              LONG                                  ! 
                     END                                   ! 
LOC:VanDatum         LONG                                  ! 
LOC:TMDatum          LONG                                  ! 
LOC:TotaalUitslagKG  DECIMAL(12,2)                         ! 
LOC:TotaalInslagKG   DECIMAL(12,2)                         ! 
LOC:PrijsKG          DECIMAL(10,3)                         ! 
LOC:TimingMeting     LONG,DIM(7)                           ! 
FDCB7::View:FileDropCombo VIEW(Partij)
                       PROJECT(Par:PartijID)
                       PROJECT(Par:ExternPartijnr)
                     END
FDCB6::View:FileDropCombo VIEW(AARelatie)
                       PROJECT(AARel:FirmaNaam)
                       PROJECT(AARel:Type)
                     END
FDCB8::View:FileDropCombo VIEW(ARelatie)
                       PROJECT(AREL:FirmaNaam)
                       PROJECT(AREL:Type)
                       PROJECT(AREL:RelatieID)
                     END
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
                       PROJECT(VVL:VerkoopRelatie)
                       PROJECT(VVL:InkoopRelatie)
                       PROJECT(VVL:MutatieID)
                       PROJECT(VVL:VerpakkingOmschrijving)
                       PROJECT(VVL:PartijRelatie)
                       PROJECT(VVL:PartijLeverancier)
                       PROJECT(VVL:ArtikelID)
                       PROJECT(VVL:DatumTijd)
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
LOC:TotaalPallets      LIKE(LOC:TotaalPallets)        !Browse hot field - type derived from local data
VVL:VerkoopRelatie     LIKE(VVL:VerkoopRelatie)       !Browse hot field - type derived from field
VVL:InkoopRelatie      LIKE(VVL:InkoopRelatie)        !Browse hot field - type derived from field
VVL:MutatieID          LIKE(VVL:MutatieID)            !Browse hot field - type derived from field
VVL:VerpakkingOmschrijving LIKE(VVL:VerpakkingOmschrijving) !Browse hot field - type derived from field
VVL:PartijRelatie      LIKE(VVL:PartijRelatie)        !Browse hot field - type derived from field
VVL:PartijLeverancier  LIKE(VVL:PartijLeverancier)    !Browse hot field - type derived from field
VVL:ArtikelID          LIKE(VVL:ArtikelID)            !Browse key field - type derived from field
VVL:DatumTijd          LIKE(VVL:DatumTijd)            !Browse key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
Queue:FileDropCombo  QUEUE                            !
Par:PartijID           LIKE(Par:PartijID)             !List box control field - type derived from field
Par:ExternPartijnr     LIKE(Par:ExternPartijnr)       !List box control field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
Queue:FileDropCombo:2 QUEUE                           !
AARel:FirmaNaam        LIKE(AARel:FirmaNaam)          !List box control field - type derived from field
AARel:Type             LIKE(AARel:Type)               !Browse hot field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
Queue:FileDropCombo:1 QUEUE                           !
AREL:FirmaNaam         LIKE(AREL:FirmaNaam)           !List box control field - type derived from field
AREL:Type              LIKE(AREL:Type)                !Browse hot field - type derived from field
AREL:RelatieID         LIKE(AREL:RelatieID)           !Browse hot field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
LocEnableEnterByTab  BYTE(1)                               !Used by the ENTER Instead of Tab template
EnterByTabManager    EnterByTabClass
NetLocalRefreshDate     Long     ! NetTalk (NetRefresh)
NetLocalRefreshTime     Long
NetLocalDependancies    String('|Partij|AARelatie|ARelatie|VoorraadVerloop|')
QuickWindow          WINDOW('Voorraad-verloop'),AT(,,586,329),FONT('MS Sans Serif',8,,FONT:regular,CHARSET:DEFAULT), |
  RESIZE,CENTER,GRAY,IMM,MAX,MDI,HLP('BrowseVoorraadVerloop'),SYSTEM
                       LIST,AT(11,76,560,209),USE(?Browse:1),HVSCROLL,FORMAT('[50R(2)|M*@d6-@80R(2)|M*@t7@](75' & |
  ')|~Datum~81L|M*~Klant~C(0)@s40@75L(2)|M*~Leverancier~C(0)@s50@79L(2)|M*~Verpakking~C' & |
  '(0)@s30@[30L(2)|M*~Cel~C(0)@s50@30L(2)|M*~Locatie~C(0)@s50@]|~Cel~24C|M*~Type~@s4@[3' & |
  '9R(2)|M*~Intern~C(0)@n-_14@60R(2)|M*~Extern~C(0)@s20@](82)|~Partijnummer~[55R(2)|M*~' & |
  'KG~C(0)@n-15`2B@40R(2)|M*~KG-Prijs~C(0)@n13`3B@](99)|~Inslag~[55R(2)|M*~KG~C(0)@n-15' & |
  '`2B@40R(2)|M*~KG Prijs~C(0)@n-14`3B@](99)|~Uitslag~[50R(2)|M*Y~KG~C(12)@n-13`2@](86)' & |
  '|~Saldo~50R(2)|*~Planning-ID~C(0)@n_10B@50R(2)|*~Inkoop-ID~C(0)@n_10B@50R(2)|M*~Verk' & |
  'oop-ID~C(0)@n_10B@'),FROM(Queue:Browse:1),IMM,MSG('Browsing the VoorraadVerloop file')
                       SHEET,AT(4,39,580,268),USE(?CurrentTab)
                         TAB('&1) Alle'),USE(?Tab:2)
                         END
                         TAB('&2) Regulier'),USE(?TAB2)
                         END
                         TAB('&3) Per Partij'),USE(?Tab:3)
                           PROMPT('Partij:<0DH,0AH>'),AT(12,60),USE(?PROMPT1)
                           COMBO(@s10),AT(38,60,137,11),USE(Par:PartijID),RIGHT(1),DROP(5),FORMAT('56R(2)|M~Partij' & |
  'nr.~C(0)@n_10@60L(2)|M~Extern partijnr.~L(1)@n_10@'),FROM(Queue:FileDropCombo)
                         END
                         TAB('&4) Per Leverancier'),USE(?TAB1)
                           PROMPT('Leverancier:'),AT(12,60),USE(?PROMPT3)
                           COMBO(@s50),AT(59,58,193,12),USE(AARel:FirmaNaam,,?AARel:FirmaNaam:2),DROP(25,300),FORMAT('200L(2)|M~' & |
  'Firma Naam~L(0)@s50@'),FROM(Queue:FileDropCombo:2)
                           BUTTON('...'),AT(257,57),USE(?BUTTON1),HIDE
                         END
                         TAB('&5) Per Klant'),USE(?TAB3)
                           COMBO(@S50),AT(36,58,185,12),USE(AREL:FirmaNaam),DROP(25),FORMAT('200L(2)|M~Firma Naam~L(0)@s50@'), |
  FROM(Queue:FileDropCombo:1)
                           PROMPT('Klant:'),AT(11,60),USE(?PROMPT4)
                         END
                       END
                       BUTTON('&Close'),AT(533,309,49,14),USE(?Close),LEFT,ICON('WACLOSE.ICO'),FLAT,MSG('Close Window'), |
  TIP('Close Window')
                       ENTRY(@s30),AT(37,20,129,14),USE(LOC:ArtikelID),DISABLE,REQ
                       PROMPT('Artikel:'),AT(7,23,26,13),USE(?PROMPT2)
                       BUTTON('Overboeking plannen'),AT(5,311,92),USE(?Overboeken)
                       STRING(@S50),AT(175,23,236),USE(Art:ArtikelOms),FONT('Microsoft Sans Serif',,,FONT:bold,CHARSET:ANSI)
                       BUTTON('Handmatige correctie'),AT(101,311,83),USE(?HandmatigeCorrectie)
                       BUTTON('Verwijderen EUIT/EIN'),AT(188,311,107),USE(?VerwijderEINUIT)
                       PROMPT('Filter:'),AT(463,23),USE(?LOC:SoortMutatieFilter:Prompt)
                       LIST,AT(487,20,,14),USE(LOC:SoortMutatieFilter),RIGHT(1),DROP(5),FROM('Alle|#0|Inslag|#' & |
  '1|IN|#2|Uitslag|#3|UIT|#4')
                       PROMPT('Van'),AT(7,5,,14),USE(?LOC:VanDatum:Prompt)
                       SPIN(@d6-),AT(38,3,52,13),USE(LOC:VanDatum),RIGHT(1)
                       PROMPT('t/m'),AT(95,5,,14),USE(?LOC:TMDatum:Prompt)
                       SPIN(@d6-),AT(114,3,53,14),USE(LOC:TMDatum),RIGHT(1)
                       STRING(@N-15`2),AT(517,290,53,10),USE(LOC:TotaalUitslagKG),RIGHT
                       STRING(@N-15`2),AT(389,290,53,10),USE(LOC:TotaalInslagKG),RIGHT
                       STRING('Totaal Uitslag (KG):'),AT(454,290),USE(?UitslagString)
                       STRING('Totaal Inslag (KG):'),AT(326,290),USE(?InslagString)
                       BUTTON('Excel'),AT(300,311,43,14),USE(?Excel)
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
TakeNewSelection       PROCEDURE(),BYTE,PROC,DERIVED
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
FDCB7                CLASS(FileDropComboClass)             ! File drop combo manager
Q                      &Queue:FileDropCombo           !Reference to browse queue type
                     END

FDCB6                CLASS(FileDropComboClass)             ! File drop combo manager
Q                      &Queue:FileDropCombo:2         !Reference to browse queue type
                     END

FDCB8                CLASS(FileDropComboClass)             ! File drop combo manager
Q                      &Queue:FileDropCombo:1         !Reference to browse queue type
                     END

BRW1                 CLASS(BrowseClass)                    ! Browse using ?Browse:1
Q                      &Queue:Browse:1                !Reference to browse queue
Fetch                  PROCEDURE(BYTE Direction),DERIVED
ResetFromView          PROCEDURE(),DERIVED
ResetSort              PROCEDURE(BYTE Force),BYTE,PROC,DERIVED
SetQueueRecord         PROCEDURE(),DERIVED
ValidateRecord         PROCEDURE(),BYTE,DERIVED
                     END

BRW1::Sort4:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 5
Resizer              CLASS(WindowResizeClass)
Init                   PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)
                     END

ExcelClass         Class
InitOle                 Procedure()
MaakExcel               Procedure()         ! Lege worksheey toevoegen
OpenExcel               Procedure(String pBestandsnaam)
SluitExcel              Procedure(Byte pCloseExcel)
BepaalKolom             Procedure(LONG pKolomNr),String
SchrijfExcel            Procedure(String pKolom, LONG pRij, String pValue)
MaakWerkBlad            Procedure(<String pWerkbladNaam>)
                   End
Loc:Ole            CString(21)
Loc:Rij            Long
Loc:OleInit        Byte


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
RefreshQueues       ROUTINE
    db.DebugOut('RefreshQueues:' & CHOICE(?CurrentTab))

    IF CHOICE(?CurrentTab) = 1
        IF RECORDS(LOC:SaldoQueue) = 0 THEN
            DO VulSaldoQueue
        END            
    ELSIF CHOICE(?CurrentTab) = 2
        IF RECORDS(LOC:HSaldoQueue) = 0 THEN
            DO VulHandmatigSaldoQueue
        END
    ELSIF CHOICE(?CurrentTab) = 3 OR CHOICE(?CurrentTab) = 0
        IF RECORDS(LOC:PartijSaldoQueue) = 0 THEN
            DO VulPartijSaldoQueue
        END
    ELSIF CHOICE(?CurrentTab) = 4
        IF RECORDS(LOC:LeverancierSaldoQueue) = 0 THEN
            DO VulLeverancierSaldoQueue
        END
    ELSIF CHOICE(?CurrentTab) = 4
        IF RECORDS(LOC:KlantSaldoQueue) = 0 THEN
            DO VulKlantSaldoQueue
        END
    END    
VulLeverancierSaldoQueue    ROUTINE
    timingmeting# = CLOCK()
    timingmeting1# = 0    
    timingmeting2# = 0    
    timingmeting3# = 0
    
	LOC:TotaalKG = 0
	LOC:TotaalPallets = 0;
	
	FREE(LOC:LeverancierSaldoQueue)
	
	!CLEAR(AVVL:Record)
	!AVVL:ArtikelID = LOC:ArtikelID
	!CLEAR(AVVL:DatumTijd_DATE,-1)
	!CLEAR(AVVL:DatumTijd_TIME,-1)
	!CLEAR(AVVL:MutatieID,1)
    !SET(AVVL:ArtikelID_DatumTijdD_MutatieID_K, AVVL:ArtikelID_DatumTijdD_MutatieID_K)
    
    timingmeting1# = CLOCK()
    
    AVoorraadVerloop{PROP:SQL} = 'SELECT * FROM VoorraadVerloop ' &|
        'WHERE ArtikelID = ''' & CLIP(LOC:ArtikelID) & ''' ORDER BY DatumTijd, MutatieID DESC'
    
    timingmeting1# = CLOCK() - timingmeting1#

    eerste# = false
    timingmetinglos# = CLOCK()
    
    LOOP UNTIL Access:AVoorraadVerloop.Next() ! Previous()
        timingmetinglos# = CLOCK() - timingmetinglos#
        
        IF NOT(eerste#)
            timingmeting2# = timingmetinglos#
            eerste# = TRUE
        ELSE
            IF timingmeting3# = 0 THEN
                timingmeting3# = timingmetinglos#
            END
        END
        
		!IF AVVL:ArtikelID <> LOC:ArtikelID THEN BREAK.
        IF AVVL:PartijLeverancier <> LOC:LeverancierID THEN

            timingmetinglos# = CLOCK()
            CYCLE
        .

		IF CLIP(AVVL:SoortMutatie) = 'IN' OR CLIP(AVVL:SoortMutatie) = 'EIN' OR CLIP(AVVL:SoortMutatie) = 'OIN'
			LOC:TotaalKG += AVVL:InslagKG
			LOC:TotaalPallets += AVVL:InslagPallet
		ELSIF CLIP(AVVL:SoortMutatie) = 'UIT' OR CLIP(AVVL:SoortMutatie) = 'EUIT' OR CLIP(AVVL:SoortMutatie) = 'OUIT'
			LOC:TotaalKG -= AVVL:UitslagKG
			LOC:TotaalPallets -= AVVL:UitslagPallet
		.
		
		LSD:MutatieID = AVVL:MutatieID
		LSD:KG = LOC:TotaalKG
		LSD:Pallets = LOC:TotaalPallets
        ADD(LOC:LeverancierSaldoQueue, +LSD:MutatieID)
        
        timingmetinglos# = CLOCK()
    .
    
    CLEAR(Sne:Record)
    Sne:Gebruiker = IGB:WindowsInlog
    Sne:Datum_DATE = TODAY()
    Sne:Datum_TIME = CLOCK()
    Sne:Meetpunt = 'BrowseVoorraadVerloop - VulLeverancierSaldoQueue'
    Sne:Meting = (CLOCK() - timingmeting#)
    Sne:Waarde1 = CHOICE(?CurrentTab)
    Sne:Waarde2 = LOC:ArtikelID
    Sne:Waarde3 = LOC:LeverancierID
    Sne:Waarde4 = timingmeting1#
    Sne:Waarde5 = timingmeting2#
    Sne:Waarde6 = timingmeting3#
    Access:SnelheidLogging.Insert()    
	EXIT
VulKlantSaldoQueue    ROUTINE
    timingmeting# = CLOCK()
    timingmeting1# = 0    
    timingmeting2# = 0    
    timingmeting3# = 0

	LOC:TotaalKG = 0
	LOC:TotaalPallets = 0;
    
	FREE(LOC:KlantSaldoQueue)
	
	!CLEAR(AVVL:Record)
	!AVVL:ArtikelID = LOC:ArtikelID
	!CLEAR(AVVL:DatumTijd_DATE,-1)
	!CLEAR(AVVL:DatumTijd_TIME,-1)
	!CLEAR(AVVL:MutatieID,1)
    !SET(AVVL:ArtikelID_DatumTijdD_MutatieID_K, AVVL:ArtikelID_DatumTijdD_MutatieID_K)

    timingmeting1# = CLOCK()
    
    AVoorraadVerloop{PROP:SQL} = 'SELECT * FROM VoorraadVerloop ' &|
        'WHERE ArtikelID = ''' & CLIP(LOC:ArtikelID) & ''' ORDER BY DatumTijd, MutatieID DESC'

    timingmeting1# = CLOCK() - timingmeting1#

    eerste# = false
    timingmetinglos# = CLOCK()
    
    LOOP UNTIL Access:AVoorraadVerloop.Next() ! Previous()
        timingmetinglos# = CLOCK() - timingmetinglos#
        
        IF NOT(eerste#)
            timingmeting2# = timingmetinglos#
            eerste# = TRUE
        ELSE
            IF timingmeting3# = 0 THEN
                timingmeting3# = timingmetinglos#
            END
        END
        
        IF AVVL:VerkoopRelatieID <> LOC:KlantID THEN
            timingmetinglos# = CLOCK()
            CYCLE
        .

		IF CLIP(AVVL:SoortMutatie) = 'IN' OR CLIP(AVVL:SoortMutatie) = 'EIN' OR CLIP(AVVL:SoortMutatie) = 'OIN'
			LOC:TotaalKG += AVVL:InslagKG
			LOC:TotaalPallets += AVVL:InslagPallet
		ELSIF CLIP(AVVL:SoortMutatie) = 'UIT' OR CLIP(AVVL:SoortMutatie) = 'EUIT' OR CLIP(AVVL:SoortMutatie) = 'OUIT'
			LOC:TotaalKG -= AVVL:UitslagKG
			LOC:TotaalPallets -= AVVL:UitslagPallet
		.
		
		KSD:MutatieID = AVVL:MutatieID
		KSD:KG = LOC:TotaalKG
		KSD:Pallets = LOC:TotaalPallets
        ADD(LOC:KlantSaldoQueue, +KSD:MutatieID)

        timingmetinglos# = CLOCK()
    .
    
    CLEAR(Sne:Record)
    Sne:Gebruiker = IGB:WindowsInlog
    Sne:Datum_DATE = TODAY()
    Sne:Datum_TIME = CLOCK()
    Sne:Meetpunt = 'BrowseVoorraadVerloop - VulKlantSaldoQueue'
    Sne:Meting = (CLOCK() - timingmeting#)
    Sne:Waarde1 = CHOICE(?CurrentTab)
    Sne:Waarde2 = LOC:ArtikelID
    Sne:Waarde3 = LOC:KlantID
    Sne:Waarde4 = timingmeting1#
    Sne:Waarde5 = timingmeting2#
    Sne:Waarde6 = timingmeting3#
    Access:SnelheidLogging.Insert()    
	EXIT
VulSaldoQueue       ROUTINE
    timingmeting# = CLOCK()
    timingmeting1# = 0    
    timingmeting2# = 0    
    timingmeting3# = 0

	LOC:TotaalKG = 0
	LOC:TotaalPallets = 0;
    
	FREE(LOC:SaldoQueue)
	
	!CLEAR(AVVL:Record)
	!AVVL:ArtikelID = LOC:ArtikelID
	!CLEAR(AVVL:DatumTijd_DATE,-1)
	!CLEAR(AVVL:DatumTijd_TIME,-1)
	!CLEAR(AVVL:MutatieID,1)
    !SET(AVVL:ArtikelID_DatumTijdD_MutatieID_K, AVVL:ArtikelID_DatumTijdD_MutatieID_K)
    
    timingmeting1# = CLOCK()
    
    AVoorraadVerloop{PROP:SQL} = 'SELECT * FROM VoorraadVerloop ' &|
        'WHERE ArtikelID = ''' & CLIP(LOC:ArtikelID) & ''' ORDER BY DatumTijd, MutatieID DESC'

    timingmeting1# = CLOCK() - timingmeting1#

    eerste# = false
    timingmetinglos# = CLOCK()
    
    LOOP UNTIL Access:AVoorraadVerloop.Next() ! Previous()
        timingmetinglos# = CLOCK() - timingmetinglos#
        
        IF NOT(eerste#)
            timingmeting2# = timingmetinglos#
            eerste# = TRUE
        ELSE
            IF timingmeting3# = 0 THEN
                timingmeting3# = timingmetinglos#
            END
        END
    
		IF CLIP(AVVL:SoortMutatie) = 'IN' OR CLIP(AVVL:SoortMutatie) = 'EIN' OR CLIP(AVVL:SoortMutatie) = 'OIN'
			LOC:TotaalKG += AVVL:InslagKG
			LOC:TotaalPallets += AVVL:InslagPallet
		ELSIF CLIP(AVVL:SoortMutatie) = 'UIT' OR CLIP(AVVL:SoortMutatie) = 'EUIT' OR CLIP(AVVL:SoortMutatie) = 'OUIT'
			LOC:TotaalKG -= AVVL:UitslagKG
			LOC:TotaalPallets -= AVVL:UitslagPallet
		.
		
		SLD:MutatieID = AVVL:MutatieID
		SLD:KG = LOC:TotaalKG
		SLD:Pallets = LOC:TotaalPallets
        ADD(LOC:SaldoQueue, +SLD:MutatieID)
        
        timingmetinglos# = CLOCK()
    .
    
    CLEAR(Sne:Record)
    Sne:Gebruiker = IGB:WindowsInlog
    Sne:Datum_DATE = TODAY()
    Sne:Datum_TIME = CLOCK()
    Sne:Meetpunt = 'BrowseVoorraadVerloop - VulSaldoQueue'
    Sne:Meting = (CLOCK() - timingmeting#)
    Sne:Waarde1 = CHOICE(?CurrentTab)
    Sne:Waarde2 = LOC:ArtikelID
    Sne:Waarde3 = timingmeting1#
    Sne:Waarde4 = timingmeting2#
    Sne:Waarde5 = timingmeting3#
    Access:SnelheidLogging.Insert()    
	EXIT
VulHandmatigSaldoQueue       ROUTINE
    timingmeting# = CLOCK()
    timingmeting1# = 0    
    timingmeting2# = 0    
    timingmeting3# = 0
    
	LOC:TotaalKG = 0
	LOC:TotaalPallets = 0;
    
	FREE(LOC:HSaldoQueue)
	
	!CLEAR(AVVL:Record)
	!AVVL:ArtikelID = LOC:ArtikelID
	!CLEAR(AVVL:DatumTijd_DATE,-1)
	!CLEAR(AVVL:DatumTijd_TIME,-1)
	!CLEAR(AVVL:MutatieID,1)
    !SET(AVVL:ArtikelID_DatumTijdD_MutatieID_K, AVVL:ArtikelID_DatumTijdD_MutatieID_K)
    
    timingmeting1# = CLOCK()
    
    AVoorraadVerloop{PROP:SQL} = 'SELECT * FROM VoorraadVerloop ' &|
        'WHERE ArtikelID = ''' & CLIP(LOC:ArtikelID) & ''' ORDER BY DatumTijd, MutatieID DESC'

    timingmeting1# = CLOCK() - timingmeting1#

    eerste# = false
    timingmetinglos# = CLOCK()
    
    LOOP UNTIL Access:AVoorraadVerloop.Next() ! Previous()
        timingmetinglos# = CLOCK() - timingmetinglos#
        
        IF NOT(eerste#)
            timingmeting2# = timingmetinglos#
            eerste# = TRUE
        ELSE
            IF timingmeting3# = 0 THEN
                timingmeting3# = timingmetinglos#
            END
        END

		!IF CLIP(AVVL:SoortMutatie) = 'IN' OR CLIP(AVVL:SoortMutatie) = 'EIN' OR CLIP(AVVL:SoortMutatie) = 'OIN'
		IF CLIP(AVVL:SoortMutatie) = 'IN' OR CLIP(AVVL:SoortMutatie) = 'OIN'
			LOC:TotaalKG += AVVL:InslagKG
			LOC:TotaalPallets += AVVL:InslagPallet
		!ELSIF CLIP(AVVL:SoortMutatie) = 'UIT' OR CLIP(AVVL:SoortMutatie) = 'EUIT' OR CLIP(AVVL:SoortMutatie) = 'OUIT'
		ELSIF CLIP(AVVL:SoortMutatie) = 'UIT' OR CLIP(AVVL:SoortMutatie) = 'OUIT'
			LOC:TotaalKG -= AVVL:UitslagKG
			LOC:TotaalPallets -= AVVL:UitslagPallet
		.
		
		HSLD:MutatieID = AVVL:MutatieID
		HSLD:KG = LOC:TotaalKG
		HSLD:Pallets = LOC:TotaalPallets
        ADD(LOC:HSaldoQueue, +HSLD:MutatieID)
        
        timingmetinglos# = CLOCK()
    .

    CLEAR(Sne:Record)
    Sne:Gebruiker = IGB:WindowsInlog
    Sne:Datum_DATE = TODAY()
    Sne:Datum_TIME = CLOCK()
    Sne:Meetpunt = 'BrowseVoorraadVerloop - VulHandmatigSaldoQueue'
    Sne:Meting = (CLOCK() - timingmeting#)
    Sne:Waarde1 = CHOICE(?CurrentTab)
    Sne:Waarde2 = LOC:ArtikelID
    Sne:Waarde3 = timingmeting1#
    Sne:Waarde4 = timingmeting2#
    Sne:Waarde5 = timingmeting3#
    Access:SnelheidLogging.Insert()    
	EXIT
VulPartijSaldoQueue ROUTINE
    timingmeting# = CLOCK()
    timingmeting1# = 0    
    timingmeting2# = 0    
    timingmeting3# = 0
    
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
    
    timingmeting1# = CLOCK()
    
    AVoorraadVerloop{PROP:SQL} = 'SELECT * FROM VoorraadVerloop ' &|
        'WHERE ArtikelID = ''' & CLIP(LOC:ArtikelID) & ''' AND PartijID = ' & CLIP(FORMAT(LOC:PartijID, @N_10)) & ' ORDER BY DatumTijd, MutatieID DESC'

    timingmeting1# = CLOCK() - timingmeting1#

    eerste# = false
    timingmetinglos# = CLOCK()
    
    LOOP UNTIL Access:AVoorraadVerloop.Next() ! Previous()
        timingmetinglos# = CLOCK() - timingmetinglos#
        
        IF NOT(eerste#)
            timingmeting2# = timingmetinglos#
            eerste# = TRUE
        ELSE
            IF timingmeting3# = 0 THEN
                timingmeting3# = timingmetinglos#
            END
        END

		IF CLIP(AVVL:SoortMutatie) = 'IN' OR CLIP(AVVL:SoortMutatie) = 'EIN' OR CLIP(AVVL:SoortMutatie) = 'OIN' THEN
			LOC:TotaalKG += AVVL:InslagKG
			LOC:TotaalPallets += AVVL:InslagPallet
		ELSIF CLIP(AVVL:SoortMutatie) = 'UIT' OR CLIP(AVVL:SoortMutatie) = 'EUIT' OR CLIP(AVVL:SoortMutatie) = 'OUIT' THEN
			LOC:TotaalKG -= AVVL:UitslagKG
			LOC:TotaalPallets -= AVVL:UitslagPallet
		.
		
		PSLD:MutatieID = AVVL:MutatieID
		PSLD:KG = LOC:TotaalKG
		PSLD:Pallets = LOC:TotaalPallets
        ADD(LOC:PartijSaldoQueue, +PSLD:MutatieID)
        
        timingmetinglos# = CLOCK()
    .
    
    CLEAR(Sne:Record)
    Sne:Gebruiker = IGB:WindowsInlog
    Sne:Datum_DATE = TODAY()
    Sne:Datum_TIME = CLOCK()
    Sne:Meetpunt = 'BrowseVoorraadVerloop - VulPartijSaldoQueue'
    Sne:Meting = (CLOCK() - timingmeting#)
    Sne:Waarde1 = CHOICE(?CurrentTab)
    Sne:Waarde2 = LOC:ArtikelID
    Sne:Waarde3 = LOC:PartijID
    Sne:Waarde4 = timingmeting1#
    Sne:Waarde5 = timingmeting2#
    Sne:Waarde6 = timingmeting3#
    Access:SnelheidLogging.Insert()    
    EXIT

ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

TempFormat          CSTRING(10000)
SearchString CSTRING(1000)
  CODE
  GlobalErrors.SetProcedureName('BrowseVoorraadVerloop')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Browse:1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('LOC:VanDatum',LOC:VanDatum)                        ! Added by: BrowseBox(ABC)
  BIND('LOC:TMDatum',LOC:TMDatum)                          ! Added by: BrowseBox(ABC)
  BIND('LOC:SoortMutatieFilter',LOC:SoortMutatieFilter)    ! Added by: BrowseBox(ABC)
  BIND('LOC:PartijID',LOC:PartijID)                        ! Added by: BrowseBox(ABC)
  BIND('LOC:LeverancierID',LOC:LeverancierID)              ! Added by: BrowseBox(ABC)
  BIND('Loc:KlantNaam',Loc:KlantNaam)                      ! Added by: BrowseBox(ABC)
  BIND('LOC:Klant',LOC:Klant)                              ! Added by: BrowseBox(ABC)
  BIND('LOC:Leverancier',LOC:Leverancier)                  ! Added by: BrowseBox(ABC)
  BIND('LOC:VerpakkingOmschrijving',LOC:VerpakkingOmschrijving) ! Added by: BrowseBox(ABC)
  BIND('LOC:TotaalKG',LOC:TotaalKG)                        ! Added by: BrowseBox(ABC)
  BIND('LOC:TotaalPallets',LOC:TotaalPallets)              ! Added by: BrowseBox(ABC)
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  IF SELF.Request = SelectRecord
     SELF.AddItem(?Close,RequestCancelled)                 ! Add the close control to the window manger
  ELSE
     SELF.AddItem(?Close,RequestCompleted)                 ! Add the close control to the window manger
  END
  Relate:AARelatie.Open                                    ! File AARelatie used by this procedure, so make sure it's RelationManager is open
  Relate:ARelatie.Open                                     ! File ARelatie used by this procedure, so make sure it's RelationManager is open
  Relate:AVoorraadVerloop.Open                             ! File AVoorraadVerloop used by this procedure, so make sure it's RelationManager is open
  Relate:Inkoop.SetOpenRelated()
  Relate:Inkoop.Open                                       ! File Inkoop used by this procedure, so make sure it's RelationManager is open
  Relate:Mutatie.Open                                      ! File Mutatie used by this procedure, so make sure it's RelationManager is open
  Relate:Partij.Open                                       ! File Partij used by this procedure, so make sure it's RelationManager is open
  Relate:SnelheidLogging.Open                              ! File SnelheidLogging used by this procedure, so make sure it's RelationManager is open
  Relate:Verpakking.Open                                   ! File Verpakking used by this procedure, so make sure it's RelationManager is open
  Relate:ViewArtikel.Open                                  ! File ViewArtikel used by this procedure, so make sure it's RelationManager is open
  Relate:VoorraadVerloop.Open                              ! File VoorraadVerloop used by this procedure, so make sure it's RelationManager is open
  Access:Relatie.UseFile                                   ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:Planning.UseFile                                  ! File referenced in 'Other Files' so need to inform it's FileManager
  SELF.FilesOpened = True
  BUFFER(AVoorraadVerloop, 100)
  BUFFER(VoorraadVerloop, 100)
  LOC:ArtikelID = ArtikelID
  
  Clear(Art:Record)
  Art:ArtikelID = LOC:ArtikelID
  Access:ViewArtikel.Fetch(Art:Artikel_PK)
  
  IF AARel:RelatieID <> 0 THEN
      IF Access:AARelatie.TryFetch(AAREL:Relatie_PK) = Level:Benign THEN
          LOC:LeverancierID = AAREL:RelatieID
      ELSE
          CLEAR(AAREL:Record)
          LOC:LeverancierID = 0
      END
  ELSE
      CLEAR(AARel:Record)
      LOC:LeverancierID = 0
  END
  
  IF AREL:RelatieID <> 0 THEN
      IF Access:ARelatie.TryFetch(AREL:Relatie_PK) = Level:Benign THEN
          LOC:Klant = AREL:RelatieID
          Loc:KlantNaam = AREL:FirmaNaam
      ELSE
          CLEAR(AREL:Record)
          LOC:Klant = 0
          LOC:KlantNaam = ''
      END
  ELSE    
      CLEAR(AREL:Record)
      LOC:Klant = 0
      LOC:KlantNaam = ''
  END    
  
  StandaardVoorraadverloopPeriode#=GETINI('Voorraad','StandaardVoorraadverloopPeriode',60,'.\Voorraad.ini')
  LOC:VanDatum = TODAY() - StandaardVoorraadverloopPeriode#
  LOC:TMDatum = TODAY()
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:VoorraadVerloop,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  WinAlertMouseZoom()
  ! SELECT(?CurrentTab, 3)			! uitgeschakeld HG) 6-8-2012
  SELECT(?CurrentTab, 1)
  Do RefreshQueues
  
  IF IGB:BekijkenPrijzen <> 1 THEN
  	! Prijzen niet tonen, format string wijzigen 60R(2)|M*~KG-Prijs~C(0)
      SearchString = 'KG-Prijs'
      startidx# = INSTRING(CLIP(SearchString), CLIP(?Browse:1{PROP:Format}), 1, 1)
      db.DebugOut('INSTRING:' & startidx# & '-' & LEN(CLIP(?Browse:1{PROP:Format})))
      IF (startidx# - LEN(CLIP(SearchString)) > 0)
          ! Gevonden
          TempFormat = ?Browse:1{PROP:Format}
      	db.DebugOut(SUB(TempFormat, startidx# - 15, 30))
          db.DebugOut('SUB:' & LEN(SUB(TempFormat, 1, startidx#)) & '-' & LEN(SearchString))
          ?Browse:1{PROP:Format} = SUB(TempFormat, 1, startidx# - 11) & '0' & CLIP(SUB(TempFormat, startidx# - 8, LEN(TempFormat)))
          !C7 ?Browse:1{PROP:Format} = SUB(TempFormat, 1, (startidx# - LEN(CLIP(SearchString))) - 1) & '0' & SUB(TempFormat, (startidx# - LEN(CLIP(SearchString))) + 2, LEN(TempFormat) - (startidx# - LEN(CLIP(SearchString))) + 2)
      END
      
      SearchString = 'KG Prijs'
      startidx# = INSTRING(CLIP(SearchString), CLIP(?Browse:1{PROP:Format}), 1, 1)
      IF (startidx# - LEN(SearchString) > 0)
          ! Gevonden
          TempFormat = ?Browse:1{PROP:Format}
          ?Browse:1{PROP:Format} = SUB(TempFormat, 1, startidx# - 11) & '0' & CLIP(SUB(TempFormat, startidx# - 8, LEN(TempFormat)))
          !C7 ?Browse:1{PROP:Format} = SUB(TempFormat, 1, (startidx# - LEN(CLIP(SearchString))) - 1) & '0' & SUB(TempFormat, (startidx# - LEN(CLIP(SearchString))) + 2, LEN(TempFormat) - (startidx# - LEN(CLIP(SearchString))) + 2)
      END
  END
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1.FileLoaded = 1                                      ! This is a 'file loaded' browse
  BRW1.AddSortOrder(,VVL:ArtikelID_DatumTijdD_MutatieID_K) ! Add the sort order for VVL:ArtikelID_DatumTijdD_MutatieID_K for sort order 1
  BRW1.AddRange(VVL:ArtikelID,LOC:ArtikelID)               ! Add single value range limit for sort order 1
  BRW1.SetFilter('((VVL:SoortMutatie=''IN'' OR VVL:SoortMutatie=''UIT'' OR VVL:SoortMutatie=''OIN'' OR VVL:SoortMutatie=''OUIT'') AND VVL:DatumTijd_DATE >= LOC:VanDatum AND VVL:DatumTijd_DATE << (LOC:TMDatum + 1) AND (LOC:SoortMutatieFilter = 0 OR (LOC:SoortMutatieFilter = 1 AND (VVL:SoortMutatie = ''IN'' OR VVL:SoortMutatie = ''EIN'' OR VVL:SoortMutatie = ''OIN'')) OR (LOC:SoortMutatieFilter = 2 AND VVL:SoortMutatie = ''IN'') OR (LOC:SoortMutatieFilter = 3 AND (VVL:SoortMutatie = ''UIT'' OR VVL:SoortMutatie = ''EUIT'' OR VVL:SoortMutatie = ''OUIT'')) OR (LOC:SoortMutatieFilter = 4 AND VVL:SoortMutatie = ''UIT'')))') ! Apply filter expression to browse
  BRW1.AddResetField(LOC:SoortMutatieFilter)               ! Apply the reset field
  BRW1.AddResetField(LOC:TMDatum)                          ! Apply the reset field
  BRW1.AddResetField(LOC:VanDatum)                         ! Apply the reset field
  BRW1.AddSortOrder(,VVL:ArtikelID_PartijID_DatumTijdD_MutatieID_K) ! Add the sort order for VVL:ArtikelID_PartijID_DatumTijdD_MutatieID_K for sort order 2
  BRW1.SetFilter('(VVL:PartijID = LOC:PartijID AND VVL:DatumTijd_DATE >= LOC:VanDatum AND VVL:DatumTijd_DATE << (LOC:TMDatum + 1) AND (LOC:SoortMutatieFilter = 0 OR (LOC:SoortMutatieFilter = 1 AND (VVL:SoortMutatie = ''IN'' OR VVL:SoortMutatie = ''EIN'' OR VVL:SoortMutatie = ''OIN'')) OR (LOC:SoortMutatieFilter = 2 AND VVL:SoortMutatie = ''IN'') OR (LOC:SoortMutatieFilter = 3 AND (VVL:SoortMutatie = ''UIT'' OR VVL:SoortMutatie = ''EUIT'' OR VVL:SoortMutatie = ''OUIT'')) OR (LOC:SoortMutatieFilter = 4 AND VVL:SoortMutatie = ''UIT'')))') ! Apply filter expression to browse
  BRW1.AddResetField(LOC:SoortMutatieFilter)               ! Apply the reset field
  BRW1.AddResetField(LOC:TMDatum)                          ! Apply the reset field
  BRW1.AddResetField(LOC:VanDatum)                         ! Apply the reset field
  BRW1.AddSortOrder(,VVL:ArtikelID_DatumTijdD_MutatieID_K) ! Add the sort order for VVL:ArtikelID_DatumTijdD_MutatieID_K for sort order 3
  BRW1.AddRange(VVL:ArtikelID,LOC:ArtikelID)               ! Add single value range limit for sort order 3
  BRW1.SetFilter('(VVL:PartijLeverancier = LOC:LeverancierID AND VVL:DatumTijd_DATE >= LOC:VanDatum AND VVL:DatumTijd_DATE << (LOC:TMDatum + 1) AND (LOC:SoortMutatieFilter = 0 OR (LOC:SoortMutatieFilter = 1 AND (VVL:SoortMutatie = ''IN'' OR VVL:SoortMutatie = ''EIN'' OR VVL:SoortMutatie = ''OIN'')) OR (LOC:SoortMutatieFilter = 2 AND VVL:SoortMutatie = ''IN'') OR (LOC:SoortMutatieFilter = 3 AND (VVL:SoortMutatie = ''UIT'' OR VVL:SoortMutatie = ''EUIT'' OR VVL:SoortMutatie = ''OUIT'')) OR (LOC:SoortMutatieFilter = 4 AND VVL:SoortMutatie = ''UIT'')))') ! Apply filter expression to browse
  BRW1.AddResetField(LOC:SoortMutatieFilter)               ! Apply the reset field
  BRW1.AddResetField(LOC:TMDatum)                          ! Apply the reset field
  BRW1.AddResetField(LOC:VanDatum)                         ! Apply the reset field
  BRW1.AddSortOrder(,VVL:ArtikelID_DatumTijdD_MutatieID_K) ! Add the sort order for VVL:ArtikelID_DatumTijdD_MutatieID_K for sort order 4
  BRW1.AddRange(VVL:ArtikelID,LOC:ArtikelID)               ! Add single value range limit for sort order 4
  BRW1.AddLocator(BRW1::Sort4:Locator)                     ! Browse has a locator for sort order 4
  BRW1::Sort4:Locator.Init(,VVL:DatumTijd,1,BRW1)          ! Initialize the browse locator using  using key: VVL:ArtikelID_DatumTijdD_MutatieID_K , VVL:DatumTijd
  BRW1.SetFilter('(Loc:KlantNaam=VVL:VerkoopRelatie AND VVL:DatumTijd_DATE >= LOC:VanDatum AND VVL:DatumTijd_DATE << (LOC:TMDatum + 1) AND (LOC:SoortMutatieFilter = 0 OR (LOC:SoortMutatieFilter = 1 AND (VVL:SoortMutatie = ''IN'' OR VVL:SoortMutatie = ''EIN'' OR VVL:SoortMutatie = ''OIN'')) OR (LOC:SoortMutatieFilter = 2 AND VVL:SoortMutatie = ''IN'') OR (LOC:SoortMutatieFilter = 3 AND (VVL:SoortMutatie = ''UIT'' OR VVL:SoortMutatie = ''EUIT'' OR VVL:SoortMutatie = ''OUIT'')) OR (LOC:SoortMutatieFilter = 4 AND VVL:SoortMutatie = ''UIT'')))') ! Apply filter expression to browse
  BRW1.AddResetField(LOC:SoortMutatieFilter)               ! Apply the reset field
  BRW1.AddResetField(LOC:TMDatum)                          ! Apply the reset field
  BRW1.AddResetField(LOC:VanDatum)                         ! Apply the reset field
  BRW1.AddSortOrder(,VVL:ArtikelID_DatumTijdD_MutatieID_K) ! Add the sort order for VVL:ArtikelID_DatumTijdD_MutatieID_K for sort order 5
  BRW1.AddRange(VVL:ArtikelID,LOC:ArtikelID)               ! Add single value range limit for sort order 5
  BRW1.SetFilter('(VVL:DatumTijd_DATE >= LOC:VanDatum AND VVL:DatumTijd_DATE << (LOC:TMDatum + 1) AND (LOC:SoortMutatieFilter = 0 OR (LOC:SoortMutatieFilter = 1 AND (VVL:SoortMutatie = ''IN'' OR VVL:SoortMutatie = ''EIN'' OR VVL:SoortMutatie = ''OIN'')) OR (LOC:SoortMutatieFilter = 2 AND VVL:SoortMutatie = ''IN'') OR (LOC:SoortMutatieFilter = 3 AND (VVL:SoortMutatie = ''UIT'' OR VVL:SoortMutatie = ''EUIT'' OR VVL:SoortMutatie = ''OUIT'')) OR (LOC:SoortMutatieFilter = 4 AND VVL:SoortMutatie = ''UIT'')))') ! Apply filter expression to browse
  BRW1.AddResetField(LOC:SoortMutatieFilter)               ! Apply the reset field
  BRW1.AddResetField(LOC:TMDatum)                          ! Apply the reset field
  BRW1.AddResetField(LOC:VanDatum)                         ! Apply the reset field
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
  BRW1.AddField(LOC:TotaalPallets,BRW1.Q.LOC:TotaalPallets) ! Field LOC:TotaalPallets is a hot field or requires assignment from browse
  BRW1.AddField(VVL:VerkoopRelatie,BRW1.Q.VVL:VerkoopRelatie) ! Field VVL:VerkoopRelatie is a hot field or requires assignment from browse
  BRW1.AddField(VVL:InkoopRelatie,BRW1.Q.VVL:InkoopRelatie) ! Field VVL:InkoopRelatie is a hot field or requires assignment from browse
  BRW1.AddField(VVL:MutatieID,BRW1.Q.VVL:MutatieID)        ! Field VVL:MutatieID is a hot field or requires assignment from browse
  BRW1.AddField(VVL:VerpakkingOmschrijving,BRW1.Q.VVL:VerpakkingOmschrijving) ! Field VVL:VerpakkingOmschrijving is a hot field or requires assignment from browse
  BRW1.AddField(VVL:PartijRelatie,BRW1.Q.VVL:PartijRelatie) ! Field VVL:PartijRelatie is a hot field or requires assignment from browse
  BRW1.AddField(VVL:PartijLeverancier,BRW1.Q.VVL:PartijLeverancier) ! Field VVL:PartijLeverancier is a hot field or requires assignment from browse
  BRW1.AddField(VVL:ArtikelID,BRW1.Q.VVL:ArtikelID)        ! Field VVL:ArtikelID is a hot field or requires assignment from browse
  BRW1.AddField(VVL:DatumTijd,BRW1.Q.VVL:DatumTijd)        ! Field VVL:DatumTijd is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('BrowseVoorraadVerloop',QuickWindow)        ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  FDCB7.Init(Par:PartijID,?Par:PartijID,Queue:FileDropCombo.ViewPosition,FDCB7::View:FileDropCombo,Queue:FileDropCombo,Relate:Partij,ThisWindow,GlobalErrors,0,1,0)
  FDCB7.Q &= Queue:FileDropCombo
  FDCB7.AddSortOrder(Par:Partij_FK01)
  FDCB7.AddRange(Par:ArtikelID,LOC:ArtikelID)
  FDCB7.AddField(Par:PartijID,FDCB7.Q.Par:PartijID) !List box control field - type derived from field
  FDCB7.AddField(Par:ExternPartijnr,FDCB7.Q.Par:ExternPartijnr) !List box control field - type derived from field
  FDCB7.AddUpdateField(Par:PartijID,LOC:PartijID)
  ThisWindow.AddItem(FDCB7.WindowComponent)
  FDCB7.DefaultFill = 0
  FDCB6.Init(AARel:FirmaNaam,?AARel:FirmaNaam:2,Queue:FileDropCombo:2.ViewPosition,FDCB6::View:FileDropCombo,Queue:FileDropCombo:2,Relate:AARelatie,ThisWindow,GlobalErrors,0,1,0)
  FDCB6.RemoveDuplicatesFlag = TRUE
  FDCB6.Q &= Queue:FileDropCombo:2
  FDCB6.AddSortOrder(AARel:Relatie_FK01)
  FDCB6.SetFilter('AARel:Type=''S''')
  FDCB6.AddField(AARel:FirmaNaam,FDCB6.Q.AARel:FirmaNaam) !List box control field - type derived from field
  FDCB6.AddField(AARel:Type,FDCB6.Q.AARel:Type) !Browse hot field - type derived from field
  FDCB6.AddUpdateField(AARel:RelatieID,LOC:LeverancierID)
  ThisWindow.AddItem(FDCB6.WindowComponent)
  FDCB6.DefaultFill = 0
  FDCB8.Init(AREL:FirmaNaam,?AREL:FirmaNaam,Queue:FileDropCombo:1.ViewPosition,FDCB8::View:FileDropCombo,Queue:FileDropCombo:1,Relate:ARelatie,ThisWindow,GlobalErrors,0,1,0)
  FDCB8.Q &= Queue:FileDropCombo:1
  FDCB8.AddSortOrder(AREL:Relatie_FK01)
  FDCB8.SetFilter('ARel:Type=''C''')
  FDCB8.AddField(AREL:FirmaNaam,FDCB8.Q.AREL:FirmaNaam) !List box control field - type derived from field
  FDCB8.AddField(AREL:Type,FDCB8.Q.AREL:Type) !Browse hot field - type derived from field
  FDCB8.AddField(AREL:RelatieID,FDCB8.Q.AREL:RelatieID) !Browse hot field - type derived from field
  FDCB8.AddUpdateField(AREL:FirmaNaam,Loc:KlantNaam)
  FDCB8.AddUpdateField(AREL:RelatieID,LOC:KlantID)
  ThisWindow.AddItem(FDCB8.WindowComponent)
  FDCB8.DefaultFill = 0
  SELF.SetAlerts()
  NetLocalRefreshDate = today()         ! NetTalk (NetRefresh)
  NetLocalRefreshTime = clock()
  EnterByTabManager.Init(False)
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  FLUSH(VoorraadVerloop)
  FLUSH(AVoorraadVerloop)
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:AARelatie.Close
    Relate:ARelatie.Close
    Relate:AVoorraadVerloop.Close
    Relate:Inkoop.Close
    Relate:Mutatie.Close
    Relate:Partij.Close
    Relate:SnelheidLogging.Close
    Relate:Verpakking.Close
    Relate:ViewArtikel.Close
    Relate:VoorraadVerloop.Close
  END
  IF SELF.Opened
    INIMgr.Update('BrowseVoorraadVerloop',QuickWindow)     ! Save window data to non-volatile store
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
    OF ?Par:PartijID
      DO VulPartijSaldoQueue
      BRW1.ResetQueue(Reset:Queue)
      BRW1.ResetFromView()
    OF ?AARel:FirmaNaam:2
          DO VulLeverancierSaldoQueue
      	BRW1.ResetQueue(Reset:Queue)
          BRW1.ResetFromView()
    OF ?BUTTON1
      ThisWindow.Update()
      GlobalRequest = SelectRecord
      SelectARelatie('S')
      ThisWindow.Reset
      IF GlobalResponse=RequestCompleted
          AAREL:Record = ARel:Record    
          LOC:LeverancierID = AARel:RelatieID
          FDCB6.ResetQueue(Reset:Queue)
          DO VulLeverancierSaldoQueue
          BRW1.ResetQueue(Reset:Queue)
      END
    OF ?AREL:FirmaNaam
          DO VulKlantSaldoQueue
      	BRW1.ResetQueue(Reset:Queue)
          BRW1.ResetFromView()
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
      	NetRefreshPlanningViews()	
      	!NOTIFY(2, GLO:Overboeking_ThreadID)
      	!NOTIFY(2, GLO:Planning_ThreadID)
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
      			Par:PartijID = BRW1.Q.VVL:PartijID
      
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
      NetRefreshVoorraadViews()
    OF ?VerwijderEINUIT
      ThisWindow.Update()
      Get(BRW1.Q ,Choice(?Browse:1))
      If Not Error()
      	CLEAR(Mut:Record)
      	Mut:MutatieID=BRW1.Q.VVL:MutatieID
      	IF (Access:Mutatie.TryFetch(Mut:Mutatie_PK) = Level:Benign)
      		db.DebugOut('UpdateMutatie:'&Mut:MutatieID& ', ' & Mut:SoortMutatie)
      		IF Mut:SoortMutatie = 'EIN' OR Mut:SoortMutatie = 'EUIT' THEN 
      			Access:Mutatie.DeleteRecord()
      			
      			!Do RefreshQueues
      			!BRW1.ResetQueue(0)
      			!ThisWindow.Reset(True)
      		.
      	.
      .
      
      NetRefreshVoorraadViews()
    OF ?Excel
      ThisWindow.Update()
          ! Export
          SETCURSOR(CURSOR:Wait)
      ExcelClass.InitOle()
      ExcelClass.MaakExcel()
      Loc:Rij=1
      ExcelClass.SchrijfExcel('A',Loc:Rij,'Datum')
      ExcelClass.SchrijfExcel('B',Loc:Rij,'Tijd')
      ExcelClass.SchrijfExcel('C',Loc:Rij,'Klant')
      ExcelClass.SchrijfExcel('D',Loc:Rij,'Leverancier')
      ExcelClass.SchrijfExcel('E',Loc:Rij,'Verpakking')
      ExcelClass.SchrijfExcel('F',Loc:Rij,'Cel')
      ExcelClass.SchrijfExcel('G',Loc:Rij,'Locatie')
      ExcelClass.SchrijfExcel('H',Loc:Rij,'Type')
      ExcelClass.SchrijfExcel('I',Loc:Rij,'Intern Partijnr')
      ExcelClass.SchrijfExcel('J',Loc:Rij,'Extern Partijnr')
      ExcelClass.SchrijfExcel('K',Loc:Rij,'Inslag KG')
      ExcelClass.SchrijfExcel('L',Loc:Rij,'Prijs')
      ExcelClass.SchrijfExcel('M',Loc:Rij,'Uitslag KG')
      ExcelClass.SchrijfExcel('N',Loc:Rij,'Prijs')
      ExcelClass.SchrijfExcel('O',Loc:Rij,'Saldo KG')
      ExcelClass.SchrijfExcel('P',Loc:Rij,'Planning ID')
      ExcelClass.SchrijfExcel('Q',Loc:Rij,'Verkoop ID')
      ExcelClass.SchrijfExcel('R',Loc:Rij,'Inkoop ID')
      Loop i#=1 to Records(BRW1.Q)
          Loc:Rij+=1
          Get(Brw1.q,i#)
          ExcelClass.SchrijfExcel('A',Loc:Rij,BRW1.Q.VVL:DatumTijd_DATE-36161)
          Loc:Ole{'Application.Range(A'&Loc:Rij&').NumberFormat'}='dd-mm-jjjj'
          ExcelClass.SchrijfExcel('B',Loc:Rij,Format(BRW1.Q.VVL:DatumTijd_TIME,@T04))
          ExcelClass.SchrijfExcel('C',Loc:Rij,BRW1.Q.LOC:Klant)
          ExcelClass.SchrijfExcel('D',Loc:Rij,BRW1.Q.LOC:Leverancier)
          ExcelClass.SchrijfExcel('E',Loc:Rij,BRW1.Q.LOC:VerpakkingOmschrijving)
          ExcelClass.SchrijfExcel('F',Loc:Rij,BRW1.Q.VVL:CelOms)
          ExcelClass.SchrijfExcel('G',Loc:Rij,BRW1.Q.VVL:Locatienaam)
          ExcelClass.SchrijfExcel('H',Loc:Rij,BRW1.Q.VVL:SoortMutatie)
          ExcelClass.SchrijfExcel('I',Loc:Rij,BRW1.Q.VVL:PartijID)
          ExcelClass.SchrijfExcel('J',Loc:Rij,BRW1.Q.VVL:ExternPartijnr)
          ExcelClass.SchrijfExcel('K',Loc:Rij,BRW1.Q.VVL:InslagKG)
          ExcelClass.SchrijfExcel('L',Loc:Rij,Format(BRW1.Q.VVL:BerekendeInkoopKGPrijs,@n-11`3))
          ExcelClass.SchrijfExcel('M',Loc:Rij,BRW1.Q.VVL:UitslagKG)
          ExcelClass.SchrijfExcel('N',Loc:Rij,Format(BRW1.Q.VVL:VerkoopKGPrijs,@n-11`3))
          ExcelClass.SchrijfExcel('O',Loc:Rij,BRW1.Q.LOC:TotaalKG)
          ExcelClass.SchrijfExcel('P',Loc:Rij,BRW1.Q.VVL:PlanningID)
          ExcelClass.SchrijfExcel('Q',Loc:Rij,BRW1.Q.VVL:VerkoopID)
          ExcelClass.SchrijfExcel('R',Loc:Rij,BRW1.Q.VVL:InkoopID)
      END
      ExcelClass.SluitExcel(FALSE)    
          SETCURSOR()
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
          ! Alle queues leeg-gooien i.v.m. potentieele wijziging. Queues worden on-demand opnieuw opgebouwd.   
          FREE(LOC:KlantSaldoQueue)
          FREE(LOC:HSaldoQueue)
          FREE(LOC:SaldoQueue)
          FREE(LOC:LeverancierSaldoQueue)
          FREE(LOC:PartijSaldoQueue)
      
          DO RefreshQueues
          BRW1.ResetQueue(Reset:Queue)
          Self.Reset(1)                      ! NetTalk (NetRefresh)
  	End
  
  	IF FALSE 
    If ThisNetRefresh.NeedReset(NetLocalRefreshDate,NetLocalRefreshTime,NetLocalDependancies) ! NetTalk (NetRefresh)
      Self.Reset(1)                      ! NetTalk (NetRefresh)
    End
  	END
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
    CASE FIELD()
    OF ?CurrentTab
      ! Als de geselecteerde tab, veranderd dan moet mogelijk een van de queues herbouwd worden
      DO RefreshQueues
    END
  ReturnValue = PARENT.TakeNewSelection()
    CASE FIELD()
    OF ?LOC:SoortMutatieFilter
      !BRW1.ResetQueue(0)
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

ExcelClass.SluitExcel       Procedure(Byte pCloseExcel)
   Code
   If pCloseExcel
       Loc:Ole{'Application.Workbooks.Close'}
   END     
   Loc:Ole{'Application.Visible'}=true  ! nu pas excel laten zien
   Loc:Ole{'Prop:Deactivate'}
   Destroy(Loc:Ole)
   RETURN
ExcelClass.SchrijfExcel         Procedure(String pKolom,LONG pRij, String pValue)
   Code
   Loc:Ole{'Application.Range('&Clip(pKolom)&pRij&').Value'}=pValue
   RETURN
ExcelClass.MaakWerkBlad         Procedure(<String pWerkbladNaam>)
   Code
   Loc:Ole{'Application.ActiveWorkBook.Sheets.Add'}
   IF pWerkbladNaam<>''
    Loc:Ole{'Application.ActiveWorkBook.ActiveSheet.Name'}=Clip(pWerkbladNaam)
   End
   ! Loc:Ole{'Application.ActiveWorkBook.Sheets.Select'}
   RETURN
ExcelClass.BepaalKolom    Procedure(LONG pKolomNr)
PRM:KolomString  string(3)
Loc:TweedeLetter    Long
Loc:EersteLetter    Long
    CODE
    pKolomNr-=1
    Loc:TweedeLetter=pKolomNr  % 26
    Loc:EersteLetter=Int(pKolomNr /26)

    if Loc:EersteLetter<>0
       PRM:KolomString[1]=Chr(64+Loc:EersteLetter)       ! chr(65)= 'A'
       PRM:KolomString[2]=Chr(65+Loc:TweedeLetter)
    Else
       PRM:KolomString[1]=Chr(65+Loc:TweedeLetter)
    End

    RETURN(PRM:KolomString)
ExcelClass.InitOle     Procedure
    code
    Loc:Ole  = Create(0,Create:Ole)
    Loc:Ole{Prop:Create}='Excel.Application'

    Loc:Ole{Prop:DoVerb}=1                               !  dit doet iedereen dus ik ook
    Loc:Ole{'Application.WindowState'}=1                 !  maximaliseer scherm
    Loc:Ole{'Application.Visible'}=True ! nu pas excel laten zien
    RETURN
ExcelClass.MaakExcel       Procedure
    CODE
    Loc:Ole{'Application.Workbooks.Add'}            ! leeg worksheet openen
    RETURN
ExcelClass.OpenExcel       Procedure(String pBestandsnaam)
    Code
    Loc:Ole{'Application.Workbooks.Open ("'&pBestandsnaam&'")'}           ! leeg worksheet openen
    RETURN

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
      PUT(SELF.Q)
    END
  !----------------------------------------------------------------------


BRW1.ResetFromView PROCEDURE

LOC:TotaalUitslagKG:Sum REAL                               ! Sum variable for browse totals
LOC:TotaalInslagKG:Sum REAL                                ! Sum variable for browse totals
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
    LOC:TotaalUitslagKG:Sum += VVL:UitslagKG
    LOC:TotaalInslagKG:Sum += VVL:InslagKG
  END
  SELF.View{PROP:IPRequestCount} = 0
  LOC:TotaalUitslagKG = LOC:TotaalUitslagKG:Sum
  LOC:TotaalInslagKG = LOC:TotaalInslagKG:Sum
  PARENT.ResetFromView
  Relate:VoorraadVerloop.SetQuickScan(0)
  SETCURSOR()


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
  ELSE
    RETURN SELF.SetSort(5,Force)
  END
  ReturnValue = PARENT.ResetSort(Force)
  RETURN ReturnValue


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
  		!db.DebugOut('VoorraadVerloop E1:'&VVL:PlanningID)
  		Access:Planning.TryFetch(Pla:PK_Planning)
  		!db.DebugOut('VoorraadVerloop E2:'&Pla:PlanningID&','&Pla:Leverancier&','&Pla:VerpakkingID)
  
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
  
  	IF CHOICE(?CurrentTab) = 1
  		CLEAR(LOC:SaldoQueue)
  		SLD:MutatieID = VVL:MutatieID
  		GET(LOC:SaldoQueue, +SLD:MutatieID)
  		IF NOT(ERROR())
  			LOC:TotaalKG = SLD:KG
  			LOC:TotaalPallets = SLD:Pallets
  		ELSE
  			LOC:TotaalKG = 0
  			LOC:TotaalPallets = 0
  		.
  	ELSIF CHOICE(?CurrentTab) = 2
  		CLEAR(LOC:HSaldoQueue)
  		HSLD:MutatieID = VVL:MutatieID
  		GET(LOC:HSaldoQueue, +HSLD:MutatieID)
  		IF NOT(ERROR())
  			LOC:TotaalKG = HSLD:KG
  			LOC:TotaalPallets = HSLD:Pallets
  		ELSE
  			LOC:TotaalKG = 0
  			LOC:TotaalPallets = 0
  		.
  	ELSIF CHOICE(?CurrentTab) = 3
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
  	ELSIF CHOICE(?CurrentTab) = 4
  		CLEAR(LOC:LeverancierSaldoQueue)
  		LSD:MutatieID = VVL:MutatieID
  		GET(LOC:LeverancierSaldoQueue, +LSD:MutatieID)
  		IF NOT(ERROR())
  			LOC:TotaalKG = LSD:KG
  			LOC:TotaalPallets = LSD:Pallets
  		ELSE
  			LOC:TotaalKG = 0
  			LOC:TotaalPallets = 0
  		.
  	ELSIF CHOICE(?CurrentTab) = 5
  		CLEAR(LOC:KlantSaldoQueue)
  		KSD:MutatieID = VVL:MutatieID
  		GET(LOC:KlantSaldoQueue, +KSD:MutatieID)
  		IF NOT(ERROR())
  			LOC:TotaalKG = KSD:KG
  			LOC:TotaalPallets = KSD:Pallets
  		ELSE
  			LOC:TotaalKG = 0
  			LOC:TotaalPallets = 0
  		.
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
  !----------------------------------------------------------------------


BRW1.ValidateRecord PROCEDURE

ReturnValue          BYTE,AUTO

BRW1::RecordStatus   BYTE,AUTO
  CODE
  omit('nope')
  db.DebugOut('ValidateRecord1:'&LOC:SoortMutatieFilter & ',' & VVL:SoortMutatie)
  IF LOC:SoortMutatieFilter = 1 THEN
  	! IN
  	IF NOT(VVL:SoortMutatie = 'IN' OR VVL:SoortMutatie = 'EIN' OR VVL:SoortMutatie = 'OIN')
  		RETURN Record:Filtered
  	.
  ELSIF LOC:SoortMutatieFilter = 3 THEN
  	! UIT
  	IF NOT(VVL:SoortMutatie = 'UIT' OR VVL:SoortMutatie = 'EUIT' OR VVL:SoortMutatie = 'OUIT')
  		RETURN Record:Filtered
  	.
  ELSIF LOC:SoortMutatieFilter = 2 THEN
  	! UIT
  	IF NOT(VVL:SoortMutatie = 'IN')
  		RETURN Record:Filtered
  	.
  ELSIF LOC:SoortMutatieFilter = 4 THEN
  	! UIT
  	IF NOT(VVL:SoortMutatie = 'UIT')
  		RETURN Record:Filtered
  	.
  .
  db.DebugOut('ValidateRecord2:'&LOC:SoortMutatieFilter & ',' & VVL:SoortMutatie)
  'nope'
  
  !AND ((LOC:SoortMutatieFilter = 1 AND (VVL:SoortMutatie = 'IN' OR VVL:SoortMutatie = 'EIN' OR VVL:SoortMutatie = 'OIN')) OR (LOC:SoortMutatieFilter = 2 AND VVL:SoortMutatie = 'IN') OR (LOC:SoortMutatieFilter = 3 AND (VVL:SoortMutatie = 'UIT' OR VVL:SoortMutatie = 'EUIT' OR VVL:SoortMutatie = 'OUIT')) OR (LOC:SoortMutatieFilter = 4 AND VVL:SoortMutatie = 'UIT'))
  ReturnValue = PARENT.ValidateRecord()
  BRW1::RecordStatus=ReturnValue
  RETURN ReturnValue


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window
  SELF.SetStrategy(?AARel:FirmaNaam:2, Resize:FixLeft+Resize:FixTop, Resize:LockSize) ! Override strategy for ?AARel:FirmaNaam:2
  SELF.SetStrategy(?PROMPT2, Resize:FixLeft+Resize:FixTop, Resize:LockSize) ! Override strategy for ?PROMPT2
  SELF.SetStrategy(?LOC:ArtikelID, Resize:FixLeft+Resize:FixTop, Resize:LockSize) ! Override strategy for ?LOC:ArtikelID
  SELF.SetStrategy(?Art:ArtikelOms, Resize:FixLeft+Resize:FixTop, Resize:LockSize) ! Override strategy for ?Art:ArtikelOms
  SELF.SetStrategy(?HandmatigeCorrectie, Resize:FixLeft+Resize:FixBottom, Resize:LockSize) ! Override strategy for ?HandmatigeCorrectie
  SELF.SetStrategy(?VerwijderEINUIT, Resize:FixLeft+Resize:FixBottom, Resize:LockSize) ! Override strategy for ?VerwijderEINUIT
  SELF.SetStrategy(?Overboeken, Resize:FixLeft+Resize:FixBottom, Resize:LockSize) ! Override strategy for ?Overboeken
  SELF.SetStrategy(?LOC:SoortMutatieFilter:Prompt, Resize:FixRight+Resize:FixTop, Resize:LockSize) ! Override strategy for ?LOC:SoortMutatieFilter:Prompt
  SELF.SetStrategy(?LOC:SoortMutatieFilter, Resize:FixRight+Resize:FixTop, Resize:LockSize) ! Override strategy for ?LOC:SoortMutatieFilter
  SELF.SetStrategy(?InslagString, Resize:FixRight+Resize:FixBottom, Resize:LockSize) ! Override strategy for ?InslagString
  SELF.SetStrategy(?LOC:TotaalInslagKG, Resize:FixRight+Resize:FixBottom, Resize:LockSize) ! Override strategy for ?LOC:TotaalInslagKG
  SELF.SetStrategy(?UitslagString, Resize:FixRight+Resize:FixBottom, Resize:LockSize) ! Override strategy for ?UitslagString
  SELF.SetStrategy(?LOC:TotaalUitslagKG, Resize:FixRight+Resize:FixBottom, Resize:LockSize) ! Override strategy for ?LOC:TotaalUitslagKG

