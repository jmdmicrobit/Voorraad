

   MEMBER('VoorrVrd.clw')                                  ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABDROPS.INC'),ONCE
   INCLUDE('ABPOPUP.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('VOORRVRD005.INC'),ONCE        !Local module procedure declarations
                     END


!!! <summary>
!!! Generated from procedure template - Window
!!! PalletAdministratie Verloop
!!! </summary>
BrowsePallets PROCEDURE 

udpt            UltimateDebugProcedureTracker
CurrentTab           STRING(80)                            ! 
LOC:PalletSoort      STRING(20)                            ! 
LOC:Saldo            DECIMAL(9,2)                          ! 
LOC:PalletSoortChoice LONG                                 ! 
LOC:KlantSaldoIn     LONG                                  ! 
Loc:PalletSoortID    LONG                                  ! 
LOC:HandmatigMutatie BYTE                                  ! 
LOC:DatumNu          DATE                                  ! 
LOC:Firmanaam        STRING(50)                            ! 
LOC:MatchingMutatie  BYTE                                  ! 
LOC:RelatieID1       LONG                                  ! 
LOC:RelatieID2       LONG                                  ! 
LOC:RelatieID3       LONG                                  ! 
LOC:TimingMeting     LONG,DIM(10)                          ! 
LOC:VanafDatum       DATE                                  ! 
LOC:TMDatum          DATE                                  ! 
LOC:VanafDatumOLD    LONG                                  ! 
LOC:TMDatumOLD       LONG                                  ! 
BRW1::View:Browse    VIEW(PalletVerloop)
                       PROJECT(Pal3:FirmaNaam)
                       PROJECT(Pal3:Transporteur)
                       PROJECT(Pal3:Planning_DATE)
                       PROJECT(Pal3:Planning_TIME)
                       PROJECT(Pal3:Inkomend)
                       PROJECT(Pal3:Uitgaand)
                       PROJECT(Pal3:Opmerking)
                       PROJECT(Pal3:PalletSoortID)
                       PROJECT(Pal3:Saldo)
                       PROJECT(Pal3:SaldoTotaal)
                       PROJECT(Pal3:RelatieID)
                       PROJECT(Pal3:VerkoopID)
                       PROJECT(Pal3:Planning)
                       PROJECT(Pal3:PalletMutatieID)
                       JOIN(Pal:PalletMutatie_PK,Pal3:PalletMutatieID)
                         PROJECT(Pal:PalletMutatieID)
                       END
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
Pal3:FirmaNaam         LIKE(Pal3:FirmaNaam)           !List box control field - type derived from field
Pal3:FirmaNaam_NormalFG LONG                          !Normal forground color
Pal3:FirmaNaam_NormalBG LONG                          !Normal background color
Pal3:FirmaNaam_SelectedFG LONG                        !Selected forground color
Pal3:FirmaNaam_SelectedBG LONG                        !Selected background color
Pal3:FirmaNaam_Style   LONG                           !Field style
Pal3:Transporteur      LIKE(Pal3:Transporteur)        !List box control field - type derived from field
Pal3:Transporteur_NormalFG LONG                       !Normal forground color
Pal3:Transporteur_NormalBG LONG                       !Normal background color
Pal3:Transporteur_SelectedFG LONG                     !Selected forground color
Pal3:Transporteur_SelectedBG LONG                     !Selected background color
Pal3:Transporteur_Icon LONG                           !Entry's icon ID
LOC:PalletSoort        LIKE(LOC:PalletSoort)          !List box control field - type derived from local data
LOC:PalletSoort_NormalFG LONG                         !Normal forground color
LOC:PalletSoort_NormalBG LONG                         !Normal background color
LOC:PalletSoort_SelectedFG LONG                       !Selected forground color
LOC:PalletSoort_SelectedBG LONG                       !Selected background color
Pal3:Planning_DATE     LIKE(Pal3:Planning_DATE)       !List box control field - type derived from field
Pal3:Planning_DATE_NormalFG LONG                      !Normal forground color
Pal3:Planning_DATE_NormalBG LONG                      !Normal background color
Pal3:Planning_DATE_SelectedFG LONG                    !Selected forground color
Pal3:Planning_DATE_SelectedBG LONG                    !Selected background color
Pal3:Planning_TIME     LIKE(Pal3:Planning_TIME)       !List box control field - type derived from field
Pal3:Planning_TIME_NormalFG LONG                      !Normal forground color
Pal3:Planning_TIME_NormalBG LONG                      !Normal background color
Pal3:Planning_TIME_SelectedFG LONG                    !Selected forground color
Pal3:Planning_TIME_SelectedBG LONG                    !Selected background color
Pal3:Inkomend          LIKE(Pal3:Inkomend)            !List box control field - type derived from field
Pal3:Inkomend_NormalFG LONG                           !Normal forground color
Pal3:Inkomend_NormalBG LONG                           !Normal background color
Pal3:Inkomend_SelectedFG LONG                         !Selected forground color
Pal3:Inkomend_SelectedBG LONG                         !Selected background color
Pal3:Uitgaand          LIKE(Pal3:Uitgaand)            !List box control field - type derived from field
Pal3:Uitgaand_NormalFG LONG                           !Normal forground color
Pal3:Uitgaand_NormalBG LONG                           !Normal background color
Pal3:Uitgaand_SelectedFG LONG                         !Selected forground color
Pal3:Uitgaand_SelectedBG LONG                         !Selected background color
LOC:Saldo              LIKE(LOC:Saldo)                !List box control field - type derived from local data
LOC:Saldo_NormalFG     LONG                           !Normal forground color
LOC:Saldo_NormalBG     LONG                           !Normal background color
LOC:Saldo_SelectedFG   LONG                           !Selected forground color
LOC:Saldo_SelectedBG   LONG                           !Selected background color
LOC:KlantSaldoIn       LIKE(LOC:KlantSaldoIn)         !List box control field - type derived from local data
LOC:KlantSaldoIn_NormalFG LONG                        !Normal forground color
LOC:KlantSaldoIn_NormalBG LONG                        !Normal background color
LOC:KlantSaldoIn_SelectedFG LONG                      !Selected forground color
LOC:KlantSaldoIn_SelectedBG LONG                      !Selected background color
LOC:Firmanaam          LIKE(LOC:Firmanaam)            !List box control field - type derived from local data
LOC:Firmanaam_NormalFG LONG                           !Normal forground color
LOC:Firmanaam_NormalBG LONG                           !Normal background color
LOC:Firmanaam_SelectedFG LONG                         !Selected forground color
LOC:Firmanaam_SelectedBG LONG                         !Selected background color
LOC:MatchingMutatie    LIKE(LOC:MatchingMutatie)      !List box control field - type derived from local data
LOC:MatchingMutatie_NormalFG LONG                     !Normal forground color
LOC:MatchingMutatie_NormalBG LONG                     !Normal background color
LOC:MatchingMutatie_SelectedFG LONG                   !Selected forground color
LOC:MatchingMutatie_SelectedBG LONG                   !Selected background color
LOC:MatchingMutatie_Icon LONG                         !Entry's icon ID
LOC:HandmatigMutatie   LIKE(LOC:HandmatigMutatie)     !List box control field - type derived from local data
LOC:HandmatigMutatie_NormalFG LONG                    !Normal forground color
LOC:HandmatigMutatie_NormalBG LONG                    !Normal background color
LOC:HandmatigMutatie_SelectedFG LONG                  !Selected forground color
LOC:HandmatigMutatie_SelectedBG LONG                  !Selected background color
LOC:HandmatigMutatie_Icon LONG                        !Entry's icon ID
Pal3:Opmerking         LIKE(Pal3:Opmerking)           !List box control field - type derived from field
Pal3:Opmerking_NormalFG LONG                          !Normal forground color
Pal3:Opmerking_NormalBG LONG                          !Normal background color
Pal3:Opmerking_SelectedFG LONG                        !Selected forground color
Pal3:Opmerking_SelectedBG LONG                        !Selected background color
Pal:PalletMutatieID    LIKE(Pal:PalletMutatieID)      !List box control field - type derived from field
Pal:PalletMutatieID_NormalFG LONG                     !Normal forground color
Pal:PalletMutatieID_NormalBG LONG                     !Normal background color
Pal:PalletMutatieID_SelectedFG LONG                   !Selected forground color
Pal:PalletMutatieID_SelectedBG LONG                   !Selected background color
Pal3:PalletSoortID     LIKE(Pal3:PalletSoortID)       !List box control field - type derived from field
Pal3:PalletSoortID_NormalFG LONG                      !Normal forground color
Pal3:PalletSoortID_NormalBG LONG                      !Normal background color
Pal3:PalletSoortID_SelectedFG LONG                    !Selected forground color
Pal3:PalletSoortID_SelectedBG LONG                    !Selected background color
Pal3:Saldo             LIKE(Pal3:Saldo)               !Browse hot field - type derived from field
Pal3:SaldoTotaal       LIKE(Pal3:SaldoTotaal)         !Browse hot field - type derived from field
Pal3:RelatieID         LIKE(Pal3:RelatieID)           !Browse hot field - type derived from field
Pal3:VerkoopID         LIKE(Pal3:VerkoopID)           !Browse hot field - type derived from field
AARel:NietActief       LIKE(AARel:NietActief)         !Browse hot field - type derived from field
Pal3:Planning          LIKE(Pal3:Planning)            !Browse key field - type derived from field
Pal3:PalletMutatieID   LIKE(Pal3:PalletMutatieID)     !Browse key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
FDCB3::View:FileDropCombo VIEW(Relatie)
                       PROJECT(Rel:FirmaNaam)
                       PROJECT(Rel:Type)
                       PROJECT(Rel:RelatieID)
                       PROJECT(Rel:NietActief)
                     END
FDCB5::View:FileDropCombo VIEW(ViewTransporteur)
                       PROJECT(VTRA:FirmaNaam)
                       PROJECT(VTRA:Plaats)
                       PROJECT(VTRA:RelatieID)
                     END
FDCB6::View:FileDropCombo VIEW(AARelatie)
                       PROJECT(AARel:FirmaNaam)
                       PROJECT(AARel:Type)
                       PROJECT(AARel:RelatieID)
                       PROJECT(AARel:NietActief)
                     END
Queue:FileDropCombo  QUEUE                            !
Rel:FirmaNaam          LIKE(Rel:FirmaNaam)            !List box control field - type derived from field
Rel:FirmaNaam_NormalFG LONG                           !Normal forground color
Rel:FirmaNaam_NormalBG LONG                           !Normal background color
Rel:FirmaNaam_SelectedFG LONG                         !Selected forground color
Rel:FirmaNaam_SelectedBG LONG                         !Selected background color
Rel:Type               LIKE(Rel:Type)                 !Browse hot field - type derived from field
Rel:RelatieID          LIKE(Rel:RelatieID)            !Browse hot field - type derived from field
Rel:NietActief         LIKE(Rel:NietActief)           !Browse hot field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
Queue:FileDropCombo:1 QUEUE                           !
VTRA:FirmaNaam         LIKE(VTRA:FirmaNaam)           !List box control field - type derived from field
VTRA:FirmaNaam_NormalFG LONG                          !Normal forground color
VTRA:FirmaNaam_NormalBG LONG                          !Normal background color
VTRA:FirmaNaam_SelectedFG LONG                        !Selected forground color
VTRA:FirmaNaam_SelectedBG LONG                        !Selected background color
VTRA:Plaats            LIKE(VTRA:Plaats)              !List box control field - type derived from field
VTRA:RelatieID         LIKE(VTRA:RelatieID)           !Browse hot field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
Queue:FileDropCombo:2 QUEUE                           !
AARel:FirmaNaam        LIKE(AARel:FirmaNaam)          !List box control field - type derived from field
AARel:FirmaNaam_NormalFG LONG                         !Normal forground color
AARel:FirmaNaam_NormalBG LONG                         !Normal background color
AARel:FirmaNaam_SelectedFG LONG                       !Selected forground color
AARel:FirmaNaam_SelectedBG LONG                       !Selected background color
AARel:Type             LIKE(AARel:Type)               !Browse hot field - type derived from field
AARel:RelatieID        LIKE(AARel:RelatieID)          !Browse hot field - type derived from field
AARel:NietActief       LIKE(AARel:NietActief)         !Browse hot field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
LocEnableEnterByTab  BYTE(1)                               !Used by the ENTER Instead of Tab template
EnterByTabManager    EnterByTabClass
NetLocalRefreshDate     Long     ! NetTalk (NetRefresh)
NetLocalRefreshTime     Long
NetLocalDependancies    String('|PalletVerloop|PalletMutatie|Relatie|ViewTransporteur|AARelatie|')
QuickWindow          WINDOW('Pallet-Administratieverloop'),AT(,,453,291),FONT('MS Sans Serif',8,,FONT:regular,CHARSET:DEFAULT), |
  RESIZE,CENTER,GRAY,MAX,MDI,HLP('BrowsePallets'),SYSTEM,IMM
                       SHEET,AT(3,25,447,244),USE(?CurrentTab)
                         TAB('&1) Per klant'),USE(?Tab:2)
                           COMBO(@s50),AT(39,46,219,11),USE(Rel:FirmaNaam),DROP(25),FORMAT('200L(2)|M*~Firmanaam~C(0)@s50@'), |
  FROM(Queue:FileDropCombo),IMM
                           PROMPT('Klant:'),AT(13,47),USE(?PROMPT1)
                           BUTTON('Excel'),AT(12,250,55,15),USE(?Excel:1),LEFT,ICON('Excel.ico')
                           BUTTON('...'),AT(265,45,22,14),USE(?Lookup:1),HIDE
                         END
                         TAB('&2) Per leverancier'),USE(?TAB2)
                           COMBO(@s100),AT(59,47,196,10),USE(AARel:FirmaNaam),DROP(25),FORMAT('200L(2)|M*~Firmanaa' & |
  'm~C(0)@s50@'),FROM(Queue:FileDropCombo:2)
                           STRING('Leverancier:'),AT(15,47),USE(?STRING2)
                           BUTTON('...'),AT(261,45,21),USE(?Lookup:2),HIDE
                           BUTTON('Excel'),AT(13,249,55,15),USE(?Excel:2),LEFT,ICON('Excel.ico')
                         END
                         TAB('&3) Per Transporteur'),USE(?TAB1)
                           PROMPT('Transporteur:'),AT(12,46),USE(?PROMPT2)
                           COMBO(@s50),AT(61,46,207,10),USE(VTRA:FirmaNaam),DROP(25),FORMAT('200L(2)|M*~Firma Naam' & |
  '~C(0)@s50@400L(2)|M~Plaats~C(0)@s100@'),FROM(Queue:FileDropCombo:1),IMM
                           BUTTON('Excel'),AT(13,249,55,15),USE(?Excel:3),LEFT,ICON('Excel.ico')
                         END
                         TAB('&4) Alle'),USE(?Tab:3)
                         END
                       END
                       LIST,AT(336,46,101,11),USE(LOC:PalletSoortChoice),DROP(10),FROM('H1|#1|1-way|#2|Euro|#3' & |
  '|CKW|#4|BLOK|#5|CHEP|#6|E2|#7')
                       PROMPT('Pallet Soort:'),AT(289,47),USE(?LOC:PalletSoortChoice:Prompt)
                       LIST,AT(13,63,429,182),USE(?Browse:1),HVSCROLL,FORMAT('160L(2)|M*Y~Firmanaam~C(0)@s50@5' & |
  '0C|M*I~Transporteur~@p p@60L(2)|M*~Palletsoort~C(0)@s20@[45R(2)|M*@d6-@40R(2)|M*@t1@' & |
  '](73)|~Datum~[54R(2)|M*~IN~C(0)@n-14.@51R(2)|M*~UIT~C(0)@n-14.@56R(2)|M*~Saldo*~C(0)' & |
  '@n-14.@](158)|~ ~55R(2)|*~IN (Klant)~C(1)@n-14.@80L(2)|M*~Klant~C(0)@s50@40L(2)|*I~C' & |
  'ontrole~C(0)@PP@45L(2)|*I~Handmatig~C(0)@PP@100L(2)|*~Omschrijving~C(0)@s50@0L(2)*~P' & |
  'allet Mutatie ID~C(0)@n-14@0L(-50)|M*@n-14@'),FROM(Queue:Browse:1),IMM,MSG('Browsing t' & |
  'he PalletVerloop file')
                       BUTTON('&Toevoegen'),AT(305,249,43,15),USE(?Insert)
                       BUTTON('&Wijzigen'),AT(353,249,43,15),USE(?Change)
                       BUTTON('&Verwijderen'),AT(401,249,43,15),USE(?Delete)
                       BUTTON('&Sluiten'),AT(397,272,49,14),USE(?Close),LEFT,ICON('WACLOSE.ICO'),FLAT,MSG('Close Window'), |
  TIP('Close Window')
                       STRING('* Saldo''s worden per tijdstip bepaald, bij meerdere pallet-mutaties op hetzelf' & |
  'de tijdstip worden deze dus gecombineerd.'),AT(3,274),USE(?STRING3)
                       PROMPT('Bekijken vanaf:'),AT(6,4),USE(?LOC:VanafDatum:Prompt:3)
                       SPIN(@d6-),AT(59,3,60,10),USE(LOC:VanafDatum)
                       PROMPT('t/m'),AT(125,4),USE(?LOC:TMDatum:Prompt)
                       SPIN(@d6-),AT(146,3,60,10),USE(LOC:TMDatum)
                     END

ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
Reset                  PROCEDURE(BYTE Force=0),DERIVED
Run                    PROCEDURE(USHORT Number,BYTE Request),BYTE,PROC,DERIVED
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED
TakeEvent              PROCEDURE(),BYTE,PROC,DERIVED
TakeNewSelection       PROCEDURE(),BYTE,PROC,DERIVED
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED
Export2Excel           PROCEDURE(Long pTab)                ! New method added to this class instance
                     END

Toolbar              ToolbarClass
BRW1                 CLASS(BrowseClass)                    ! Browse using ?Browse:1
Q                      &Queue:Browse:1                !Reference to browse queue
ApplyRange             PROCEDURE(),BYTE,PROC,DERIVED
Fetch                  PROCEDURE(BYTE Direction),DERIVED
Init                   PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)
ResetQueue             PROCEDURE(BYTE ResetMode),DERIVED
ResetSort              PROCEDURE(BYTE Force),BYTE,PROC,DERIVED
SetQueueRecord         PROCEDURE(),DERIVED
SetSort                PROCEDURE(BYTE NewOrder,BYTE Force),BYTE,PROC,DERIVED
                     END

BRW1::Sort3:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 2
BRW1::Sort2:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 3
BRW1::Sort1:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 4
Resizer              CLASS(WindowResizeClass)
Init                   PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)
                     END

FDCB3                CLASS(FileDropComboClass)             ! File drop combo manager
Q                      &Queue:FileDropCombo           !Reference to browse queue type
SetQueueRecord         PROCEDURE(),DERIVED
                     END

FDCB5                CLASS(FileDropComboClass)             ! File drop combo manager
Q                      &Queue:FileDropCombo:1         !Reference to browse queue type
SetQueueRecord         PROCEDURE(),DERIVED
                     END

FDCB6                CLASS(FileDropComboClass)             ! File drop combo manager
Q                      &Queue:FileDropCombo:2         !Reference to browse queue type
SetQueueRecord         PROCEDURE(),DERIVED
                     END

PalletMutatieQueue QUEUE, PRE(PMQ)
VerkoopID               LONG
PalletSoortID           LONG
Transporteur            BYTE
Inkomend                LONG
FirmaNaam               CSTRING(50)
KlantSaldoIn            LONG
					END

  CODE
? DEBUGHOOK(AARelatie:Record)
? DEBUGHOOK(APalletMutatie:Record)
? DEBUGHOOK(APalletVerloop:Record)
? DEBUGHOOK(ARelatie:Record)
? DEBUGHOOK(PalletVerloop:Record)
? DEBUGHOOK(Relatie:Record)
? DEBUGHOOK(SnelheidLogging:Record)
? DEBUGHOOK(ViewTransporteur:Record)
  GlobalResponse = ThisWindow.Run()                        ! Opens the window and starts an Accept Loop

!---------------------------------------------------------------------------
DefineListboxStyle ROUTINE
!|
!| This routine create all the styles to be shared in this window
!| It`s called after the window open
!|
 ?Browse:1{PROPSTYLE:TextColor, 1}     = Color:Red
  !------------------------------------
  !Style for ?Browse:1
  !------------------------------------
!---------------------------------------------------------------------------
VulPalletMutatieQueue       ROUTINE
    IF LOC:VanafDatum <> LOC:VanafDatumOLD OR LOC:TMDatum <> LOC:TMDatumOLD THEN
        FREE(PalletMutatieQueue)

        i# = 1
        
        APalletMutatie{PROP:SQL} = 'SELECT PalletMutatieID, PalletSoortID, PlanningID, PalletMutatie.RelatieID, '&|
            'Inkomend, Uitgaand, Transporteur, DatumTijd, FirmaNaam AS Opmerking, VerkoopID FROM '&|
            'PalletMutatie LEFT OUTER JOIN Relatie_SyncExact ON PalletMutatie.RelatieID = Relatie_SyncExact.RelatieID '&|
            'WHERE DatumTijd >= ''' & FORMAT(LOC:VanafDatum, @D1-) & ''' AND DatumTijd < ''' & FORMAT(LOC:TMDatum + 1, @D1-) & ''' ORDER BY '&|
            'VerkoopID, PalletSoortID, Transporteur'

        eerste# = false
        
        LOOP UNTIL Access:APalletMutatie.Next() ! Previous()
            IF NOT(eerste#)
                eerste# = TRUE
            ELSE
            END
        
            db.debugout('APalletMutaties:' & i# & ' - ' & APM:VerkoopID) 
            i# += 1
            CLEAR(PalletMutatieQueue)
            PMQ:VerkoopID = APM:VerkoopID
            PMQ:PalletSoortID = APM:PalletSoortID
            PMQ:Transporteur = APM:Transporteur
            PMQ:Inkomend = APM:Inkomend
            
            IF APM:Transporteur = 0 THEN
                PMQ:FirmaNaam = APM:Opmerking
                PMQ:KlantSaldoIn = APM:Inkomend
            END
            
            ADD(PalletMutatieQueue, +PMQ:VerkoopID, +PMQ:PalletSoortID, +PMQ:Transporteur)
            
        END

        LOC:VanafDatumOLD = LOC:VanafDatum
        LOC:TMDatumOLD = LOC:TMDatum
        
        BRW1.ResetQueue(Reset:Queue)
    END
TrekLijntjes        Routine
	IF CHOICE(?CurrentTab) = 3 ! Per transporteur
		Loc:Ole{'Application.Range(A'&Loc:Rij&':H'&Loc:Rij&').Select'}
	ELSE
		Loc:Ole{'Application.Range(A'&Loc:Rij&':F'&Loc:Rij&').Select'}
	.
	
	Loc:Ole{'Application.Selection.Borders(9).Weight'}=2 ! xlEdgeBottom
	Loc:Ole{'Application.Selection.Borders(10).Weight'}=2 ! xlEdgeRight
	Loc:Ole{'Application.Selection.Borders(7).Weight'}=2 ! xlEdgeLeft
	Loc:Ole{'Application.Selection.Borders(8).Weight'}=2 ! xlEdgeTop
	Loc:Ole{'Application.Selection.Borders(11).Weight'}=2 ! xlInsideVertical
!      ?Ole{'Application.Selection.Borders(12).Weight'}=2 ! xlInsideHorizontal
Vet                     Routine
	  Loc:Ole{'Application.Range(A'&Loc:Rij&':K'&Loc:Rij&').Font.Bold'}=True
ResizeKolommen      ROUTINE
    IF CHOICE(?CurrentTab) = 1 OR CHOICE(?CurrentTab) = 2 THEN
		?Browse:1{PROPLIST:Width, 2} = 0
        
		?Browse:1{PROPLIST:Width, 9} = 0
		?Browse:1{PROPLIST:Width, 10} = 0
		?Browse:1{PROPLIST:Width, 11} = 0
		?Browse:1{PROPLIST:Width, 12} = 0
	ELSE
		IF CHOICE(?CurrentTab) = 3
            ?Browse:1{PROPLIST:Width, 2} = 0
            
			?Browse:1{PROPLIST:Width, 9} = 55
			?Browse:1{PROPLIST:Width, 10} = 80
			?Browse:1{PROPLIST:Width, 11} = 0
			?Browse:1{PROPLIST:Width, 12} = 0
        ELSE
			?Browse:1{PROPLIST:Width, 2} = 50
            
			?Browse:1{PROPLIST:Width, 9} = 0
			?Browse:1{PROPLIST:Width, 10} = 0
			?Browse:1{PROPLIST:Width, 11} = 40
			?Browse:1{PROPLIST:Width, 12} = 45
		.
	.

	
	EXIT

ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
        udpt.Init(UD,'BrowsePallets','VoorrVrd005.clw','VoorrVrd.DLL','02/21/2023 @ 03:36PM')    
             
  GlobalErrors.SetProcedureName('BrowsePallets')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  StandaardPalletverloopPeriode#=GETINI('Voorraad','StandaardPalletverloopPeriode',60,PQ:IniFile)
  
  GLO:PalletAdministratie_ThreadID = THREAD()
  LOC:PalletSoortChoice = 1
  LOC:VanafDatum = TODAY() - StandaardPalletverloopPeriode#
  LOC:TMDatum = TODAY()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Rel:FirmaNaam
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('LOC:VanafDatum',LOC:VanafDatum)                    ! Added by: BrowseBox(ABC)
  BIND('LOC:TMDatum',LOC:TMDatum)                          ! Added by: BrowseBox(ABC)
  BIND('LOC:PalletSoort',LOC:PalletSoort)                  ! Added by: BrowseBox(ABC)
  BIND('LOC:Saldo',LOC:Saldo)                              ! Added by: BrowseBox(ABC)
  BIND('LOC:KlantSaldoIn',LOC:KlantSaldoIn)                ! Added by: BrowseBox(ABC)
  BIND('LOC:Firmanaam',LOC:Firmanaam)                      ! Added by: BrowseBox(ABC)
  BIND('LOC:MatchingMutatie',LOC:MatchingMutatie)          ! Added by: BrowseBox(ABC)
  BIND('LOC:HandmatigMutatie',LOC:HandmatigMutatie)        ! Added by: BrowseBox(ABC)
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  IF SELF.Request = SelectRecord
     SELF.AddItem(?Close,RequestCancelled)                 ! Add the close control to the window manger
  ELSE
     SELF.AddItem(?Close,RequestCompleted)                 ! Add the close control to the window manger
  END
  Relate:AARelatie.Open                                    ! File AARelatie used by this procedure, so make sure it's RelationManager is open
  Relate:APalletMutatie.Open                               ! File APalletMutatie used by this procedure, so make sure it's RelationManager is open
  Relate:APalletVerloop.Open                               ! File APalletVerloop used by this procedure, so make sure it's RelationManager is open
  Relate:ARelatie.Open                                     ! File ARelatie used by this procedure, so make sure it's RelationManager is open
  Relate:PalletVerloop.Open                                ! File PalletVerloop used by this procedure, so make sure it's RelationManager is open
  Relate:Relatie.SetOpenRelated()
  Relate:Relatie.Open                                      ! File Relatie used by this procedure, so make sure it's RelationManager is open
  Relate:SnelheidLogging.Open                              ! File SnelheidLogging used by this procedure, so make sure it's RelationManager is open
  Relate:ViewTransporteur.Open                             ! File ViewTransporteur used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:PalletVerloop,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  Do DefineListboxStyle
  QuickWindow{Prop:Alrt,255} = CtrlShiftP
  BRW1.Q &= Queue:Browse:1
  BRW1.FileLoaded = 1                                      ! This is a 'file loaded' browse
  BRW1.AddSortOrder(,Pal3:PalletVerloop_FK2)               ! Add the sort order for Pal3:PalletVerloop_FK2 for sort order 1
  BRW1.AddRange(Pal3:PalletSoortID,LOC:PalletSoortChoice)  ! Add single value range limit for sort order 1
  BRW1.AddLocator(BRW1::Sort3:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort3:Locator.Init(,Pal3:Planning,1,BRW1)          ! Initialize the browse locator using  using key: Pal3:PalletVerloop_FK2 , Pal3:Planning
  BRW1.SetFilter('(Pal3:Transporteur = 0 AND Pal3:Planning_DATE >= LOC:VanafDatum AND Pal3:Planning_DATE << (LOC:TMDatum + 1))') ! Apply filter expression to browse
  BRW1.AddResetField(LOC:PalletSoortChoice)                ! Apply the reset field
  BRW1.AddSortOrder(,Pal3:PalletVerloop_FK2)               ! Add the sort order for Pal3:PalletVerloop_FK2 for sort order 2
  BRW1.AddRange(Pal3:PalletSoortID,LOC:PalletSoortChoice)  ! Add single value range limit for sort order 2
  BRW1.AddLocator(BRW1::Sort2:Locator)                     ! Browse has a locator for sort order 2
  BRW1::Sort2:Locator.Init(,Pal3:Planning,1,BRW1)          ! Initialize the browse locator using  using key: Pal3:PalletVerloop_FK2 , Pal3:Planning
  BRW1.SetFilter('(Pal3:Transporteur = 1 AND Pal3:Planning_DATE >= LOC:VanafDatum AND Pal3:Planning_DATE << (LOC:TMDatum+1))') ! Apply filter expression to browse
  BRW1.AddResetField(LOC:PalletSoortChoice)                ! Apply the reset field
  BRW1.AddSortOrder(,Pal3:PalletVerloop_FK1)               ! Add the sort order for Pal3:PalletVerloop_FK1 for sort order 3
  BRW1.AddRange(Pal3:PalletSoortID,LOC:PalletSoortChoice)  ! Add single value range limit for sort order 3
  BRW1.AddLocator(BRW1::Sort1:Locator)                     ! Browse has a locator for sort order 3
  BRW1::Sort1:Locator.Init(,Pal3:Planning,1,BRW1)          ! Initialize the browse locator using  using key: Pal3:PalletVerloop_FK1 , Pal3:Planning
  BRW1.SetFilter('(Pal3:Planning_DATE >= LOC:VanafDatum AND Pal3:Planning_DATE << (LOC:TMDatum + 1))') ! Apply filter expression to browse
  BRW1.AddResetField(LOC:PalletSoortChoice)                ! Apply the reset field
  BRW1.AddSortOrder(,Pal3:PalletVerloop_FK2)               ! Add the sort order for Pal3:PalletVerloop_FK2 for sort order 4
  BRW1.AddRange(Pal3:PalletSoortID,LOC:PalletSoortChoice)  ! Add single value range limit for sort order 4
  BRW1.SetFilter('(Pal3:Transporteur = 0 AND Pal3:Planning_DATE >= LOC:VanafDatum AND Pal3:Planning_DATE << (LOC:TMDatum+1))') ! Apply filter expression to browse
  BRW1.AddResetField(LOC:PalletSoortChoice)                ! Apply the reset field
  ?Browse:1{PROP:IconList,1} = '~off.ico'
  ?Browse:1{PROP:IconList,2} = '~on.ico'
  BRW1.AddField(Pal3:FirmaNaam,BRW1.Q.Pal3:FirmaNaam)      ! Field Pal3:FirmaNaam is a hot field or requires assignment from browse
  BRW1.AddField(Pal3:Transporteur,BRW1.Q.Pal3:Transporteur) ! Field Pal3:Transporteur is a hot field or requires assignment from browse
  BRW1.AddField(LOC:PalletSoort,BRW1.Q.LOC:PalletSoort)    ! Field LOC:PalletSoort is a hot field or requires assignment from browse
  BRW1.AddField(Pal3:Planning_DATE,BRW1.Q.Pal3:Planning_DATE) ! Field Pal3:Planning_DATE is a hot field or requires assignment from browse
  BRW1.AddField(Pal3:Planning_TIME,BRW1.Q.Pal3:Planning_TIME) ! Field Pal3:Planning_TIME is a hot field or requires assignment from browse
  BRW1.AddField(Pal3:Inkomend,BRW1.Q.Pal3:Inkomend)        ! Field Pal3:Inkomend is a hot field or requires assignment from browse
  BRW1.AddField(Pal3:Uitgaand,BRW1.Q.Pal3:Uitgaand)        ! Field Pal3:Uitgaand is a hot field or requires assignment from browse
  BRW1.AddField(LOC:Saldo,BRW1.Q.LOC:Saldo)                ! Field LOC:Saldo is a hot field or requires assignment from browse
  BRW1.AddField(LOC:KlantSaldoIn,BRW1.Q.LOC:KlantSaldoIn)  ! Field LOC:KlantSaldoIn is a hot field or requires assignment from browse
  BRW1.AddField(LOC:Firmanaam,BRW1.Q.LOC:Firmanaam)        ! Field LOC:Firmanaam is a hot field or requires assignment from browse
  BRW1.AddField(LOC:MatchingMutatie,BRW1.Q.LOC:MatchingMutatie) ! Field LOC:MatchingMutatie is a hot field or requires assignment from browse
  BRW1.AddField(LOC:HandmatigMutatie,BRW1.Q.LOC:HandmatigMutatie) ! Field LOC:HandmatigMutatie is a hot field or requires assignment from browse
  BRW1.AddField(Pal3:Opmerking,BRW1.Q.Pal3:Opmerking)      ! Field Pal3:Opmerking is a hot field or requires assignment from browse
  BRW1.AddField(Pal:PalletMutatieID,BRW1.Q.Pal:PalletMutatieID) ! Field Pal:PalletMutatieID is a hot field or requires assignment from browse
  BRW1.AddField(Pal3:PalletSoortID,BRW1.Q.Pal3:PalletSoortID) ! Field Pal3:PalletSoortID is a hot field or requires assignment from browse
  BRW1.AddField(Pal3:Saldo,BRW1.Q.Pal3:Saldo)              ! Field Pal3:Saldo is a hot field or requires assignment from browse
  BRW1.AddField(Pal3:SaldoTotaal,BRW1.Q.Pal3:SaldoTotaal)  ! Field Pal3:SaldoTotaal is a hot field or requires assignment from browse
  BRW1.AddField(Pal3:RelatieID,BRW1.Q.Pal3:RelatieID)      ! Field Pal3:RelatieID is a hot field or requires assignment from browse
  BRW1.AddField(Pal3:VerkoopID,BRW1.Q.Pal3:VerkoopID)      ! Field Pal3:VerkoopID is a hot field or requires assignment from browse
  BRW1.AddField(AARel:NietActief,BRW1.Q.AARel:NietActief)  ! Field AARel:NietActief is a hot field or requires assignment from browse
  BRW1.AddField(Pal3:Planning,BRW1.Q.Pal3:Planning)        ! Field Pal3:Planning is a hot field or requires assignment from browse
  BRW1.AddField(Pal3:PalletMutatieID,BRW1.Q.Pal3:PalletMutatieID) ! Field Pal3:PalletMutatieID is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('BrowsePallets',QuickWindow)                ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  BRW1.AskProcedure = 1                                    ! Will call: UpdatePalletMutatie(LOC:PalletSoortChoice, CHOICE(?CurrentTab), Rel:RelatieID,AARel:RelatieID, VTRA:RelatieID)
  FDCB3.Init(Rel:FirmaNaam,?Rel:FirmaNaam,Queue:FileDropCombo.ViewPosition,FDCB3::View:FileDropCombo,Queue:FileDropCombo,Relate:Relatie,ThisWindow,GlobalErrors,0,1,0)
  FDCB3.RemoveDuplicatesFlag = TRUE
  FDCB3.Q &= Queue:FileDropCombo
  FDCB3.AddSortOrder(Rel:Relatie_FK01)
  FDCB3.SetFilter('(REL:Type = ''C'')')
  FDCB3.AddField(Rel:FirmaNaam,FDCB3.Q.Rel:FirmaNaam) !List box control field - type derived from field
  FDCB3.AddField(Rel:Type,FDCB3.Q.Rel:Type) !Browse hot field - type derived from field
  FDCB3.AddField(Rel:RelatieID,FDCB3.Q.Rel:RelatieID) !Browse hot field - type derived from field
  FDCB3.AddField(Rel:NietActief,FDCB3.Q.Rel:NietActief) !Browse hot field - type derived from field
  FDCB3.AddUpdateField(Rel:RelatieID,LOC:RelatieID1)
  ThisWindow.AddItem(FDCB3.WindowComponent)
  FDCB3.DefaultFill = 0
  FDCB5.Init(VTRA:FirmaNaam,?VTRA:FirmaNaam,Queue:FileDropCombo:1.ViewPosition,FDCB5::View:FileDropCombo,Queue:FileDropCombo:1,Relate:ViewTransporteur,ThisWindow,GlobalErrors,0,1,0)
  FDCB5.Q &= Queue:FileDropCombo:1
  FDCB5.AddSortOrder(VTRA:ViewTransporteur_FK1)
  FDCB5.AddField(VTRA:FirmaNaam,FDCB5.Q.VTRA:FirmaNaam) !List box control field - type derived from field
  FDCB5.AddField(VTRA:Plaats,FDCB5.Q.VTRA:Plaats) !List box control field - type derived from field
  FDCB5.AddField(VTRA:RelatieID,FDCB5.Q.VTRA:RelatieID) !Browse hot field - type derived from field
  FDCB5.AddUpdateField(VTRA:RelatieID,LOC:RelatieID3)
  ThisWindow.AddItem(FDCB5.WindowComponent)
  FDCB5.DefaultFill = 0
  FDCB6.Init(AARel:FirmaNaam,?AARel:FirmaNaam,Queue:FileDropCombo:2.ViewPosition,FDCB6::View:FileDropCombo,Queue:FileDropCombo:2,Relate:AARelatie,ThisWindow,GlobalErrors,0,1,0)
  FDCB6.RemoveDuplicatesFlag = TRUE
  FDCB6.Q &= Queue:FileDropCombo:2
  FDCB6.AddSortOrder(AARel:Relatie_FK01)
  FDCB6.SetFilter('(AAREL:Type = ''S'')')
  FDCB6.AddField(AARel:FirmaNaam,FDCB6.Q.AARel:FirmaNaam) !List box control field - type derived from field
  FDCB6.AddField(AARel:Type,FDCB6.Q.AARel:Type) !Browse hot field - type derived from field
  FDCB6.AddField(AARel:RelatieID,FDCB6.Q.AARel:RelatieID) !Browse hot field - type derived from field
  FDCB6.AddField(AARel:NietActief,FDCB6.Q.AARel:NietActief) !Browse hot field - type derived from field
  FDCB6.AddUpdateField(AARel:RelatieID,LOC:RelatieID2)
  ThisWindow.AddItem(FDCB6.WindowComponent)
  FDCB6.DefaultFill = 0
  SELF.SetAlerts()
  NetLocalRefreshDate = today()         ! NetTalk (NetRefresh)
  NetLocalRefreshTime = clock()
  BUFFER(PalletVerloop, 100)
  BUFFER(APalletMutatie, 100)
  DO VulPalletMutatieQueue
  DO ResizeKolommen
  EnterByTabManager.Init(False)
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  GLO:PalletAdministratie_ThreadID = 0
  FLUSH(APalletMutatie)
  FLUSH(PalletVerloop)
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:AARelatie.Close
    Relate:APalletMutatie.Close
    Relate:APalletVerloop.Close
    Relate:ARelatie.Close
    Relate:PalletVerloop.Close
    Relate:Relatie.Close
    Relate:SnelheidLogging.Close
    Relate:ViewTransporteur.Close
  END
  IF SELF.Opened
    INIMgr.Update('BrowsePallets',QuickWindow)             ! Save window data to non-volatile store
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
    UpdatePalletMutatie(LOC:PalletSoortChoice, CHOICE(?CurrentTab), Rel:RelatieID,AARel:RelatieID, VTRA:RelatieID)
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
    OF ?Excel:2
      ThisWindow.Export2Excel(2)
      !LOC:TransporteurExcel = 2
      !	DO ExportExcel
    OF ?LOC:VanafDatum
      DO VulPalletMutatieQueue
    OF ?LOC:TMDatum
      DO VulPalletMutatieQueue
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?Rel:FirmaNaam
      ! Handmatig resetten i.p.v. met reset-field omdat het refreshen dan ook tijdens het auto-comppleten gebeurd.
      BRW1.ResetQueue(Reset:Done)
      Post(EVENT:ScrollTop,?Browse:1)
    OF ?Excel:1
      ThisWindow.Update()
      ThisWindow.Export2Excel(1)
      !LOC:TransporteurExcel = 0
      !	DO ExportExcel
    OF ?Lookup:1
      ThisWindow.Update()
      GlobalRequest = SelectRecord
      SelectARelatie('C')
      ThisWindow.Reset
      	if globalresponse=RequestCompleted
      		Loc:RelatieID1 = AREL:RelatieID
              FDCB3.ResetQueue(True)
              
              ! Handmatig resetten i.p.v. met reset-field omdat het refreshen dan ook tijdens het auto-comppleten gebeurd.
              BRW1.ResetQueue(Reset:Done)
      	END
      
    OF ?AARel:FirmaNaam
      ! Handmatig resetten i.p.v. met reset-field omdat het refreshen dan ook tijdens het auto-comppleten gebeurd.
      BRW1.ResetQueue(Reset:Done)
      Post(EVENT:ScrollTop,?Browse:1)
    OF ?Lookup:2
      ThisWindow.Update()
      GlobalRequest = SelectRecord
      SelectARelatie('S')
      ThisWindow.Reset
      	if globalresponse=RequestCompleted
      		Loc:RelatieID2 = AREL:RelatieID
              FDCB6.ResetQueue(True)
              
              ! Handmatig resetten i.p.v. met reset-field omdat het refreshen dan ook tijdens het auto-comppleten gebeurd.
              BRW1.ResetQueue(Reset:Done)
      	END
    OF ?VTRA:FirmaNaam
      ! Handmatig resetten i.p.v. met reset-field omdat het refreshen dan ook tijdens het auto-comppleten gebeurd.
      BRW1.ResetQueue(Reset:Done)
      Post(EVENT:ScrollTop,?Browse:1)
    OF ?Excel:3
      ThisWindow.Update()
      ThisWindow.Export2Excel(3)
      !LOC:TransporteurExcel = 1
      !	DO ExportExcel
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
        UD.ShowProcedureInfo('BrowsePallets',UD.SetApplicationName('VoorrVrd','DLL'),QuickWindow{PROP:Hlp},'10/07/2011 @ 08:55AM','02/21/2023 @ 03:36PM','10/11/2024 @ 01:55PM')  
    
       CYCLE
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
    CASE FIELD()
    OF ?LOC:VanafDatum
      DO VulPalletMutatieQueue
    OF ?LOC:TMDatum
      DO VulPalletMutatieQueue
    END
  ReturnValue = PARENT.TakeNewSelection()
    CASE FIELD()
    OF ?CurrentTab
      DO ResizeKolommen
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
    OF EVENT:Notify
      	NOTIFICATION(NotifyCode#)
      	IF NotifyCode# = 1
      		0{Prop:Active}=TRUE
      	ELSIF NotifyCode# = 2
      		ThisWindow.Reset(True)
      	.
    END
  ReturnValue = PARENT.TakeWindowEvent()
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue

ThisWindow.Export2Excel PROCEDURE(Long pTab)

  CODE
  db.DebugOut('Export2Excel')
  SETCURSOR(CURSOR:Wait)
  GlobalClass.InitExcelOle
  GlobalClass.MaakExcel('')
  	
  Loc:Ole{'Sheets.Add'}
  Loc:Ole{'Sheets("Blad1").Name'} = 'H1'
  Loc:Ole{'Sheets("Blad2").Name'} = '1-way'
  Loc:Ole{'Sheets.Add'}
  Loc:Ole{'Sheets("Blad3").Name'} = 'Euro'
  Loc:Ole{'Sheets.Add'}
  Loc:Ole{'Sheets("Blad4").Name'} = 'CKW'
  Loc:Ole{'Sheets.Add'}
  Loc:Ole{'Sheets("Blad5").Name'} = 'BLOK'
  Loc:Ole{'Sheets.Add'}
  Loc:Ole{'Sheets("Blad6").Name'} = 'CHEP'
  Loc:Ole{'Sheets.Add'}
  Loc:Ole{'Sheets("Blad7").Name'} = 'E2'
  
  palletsoort# = 1
  LOOP UNTIL palletsoort# > 7
      CASE palletsoort#
      OF 1
          Loc:Ole{'Sheets("H1").Select'}
      OF 2
          Loc:Ole{'Sheets("1-way").Select'}
      OF 3
          Loc:Ole{'Sheets("Euro").Select'}
      OF 4
          Loc:Ole{'Sheets("CKW").Select'}
      OF 5
          Loc:Ole{'Sheets("BLOK").Select'}
      OF 6
          Loc:Ole{'Sheets("CHEP").Select'}
      OF 7
          Loc:Ole{'Sheets("E2").Select'}
      .
  		
      LOC:Rij = 1
      Loc:Ole{'Application.Range(A'&Loc:Rij&').Value'}='Emballage'
      LOC:DatumNu = TODAY()
      Do Vet
          
      LOC:Rij += 1
  !    Execute  (Loc:DAtumNU%7 )+ 1
  !        Loc:Ole{'Application.Range(A2).Value'}='Zondag '&Format(Loc:DAtumNU,@d6-) 
  !        Loc:Ole{'Application.Range(A2).Value'}='Maandag '&Format(Loc:DAtumNU,@d6-) 
  !        Loc:Ole{'Application.Range(A2).Value'}='Dinsdag '&Format(Loc:DAtumNU,@d6-) 
  !        Loc:Ole{'Application.Range(A2).Value'}='Woensdag '&Format(Loc:DAtumNU,@d6-) 
  !        Loc:Ole{'Application.Range(A2).Value'}='Donderdag '&Format(Loc:DAtumNU,@d6-) 
  !        Loc:Ole{'Application.Range(A2).Value'}='Vrijdag '&Format(Loc:DAtumNU,@d6-) 
  !        Loc:Ole{'Application.Range(A2).Value'}='Zaterdag '&Format(Loc:DAtumNU,@d6-) 
  !    End
      Loc:Ole{'Application.Range(A2).Value'}='Vanaf '&Format(LOC:VanafDatum,@d6-)&' t/m '&Format(LOC:TMDatum,@d6-)  
      Do Vet
  		
      LOC:Rij += 1
  		!IF NOT(LOC:TransporteurExcel)
      CASE pTab
      OF 1
          AREL:RelatieID=LOC:RelatieID1 !Rel:RelatieID
      OF 2
          AREL:RelatieID=LOC:RelatieID2 !AARel:RelatieID
      OF 3
          AREL:RelatieID=LOC:RelatieID3 !VTRA:RelatieID
      .
          
      Access:ARelatie.TryFetch(AREL:Relatie_PK)
      Loc:Ole{'Application.Range(A3).Value'}=AREL:FirmaNaam
      Do Vet
          
      LOC:Rij += 1
      CASE palletsoort#
      OF 1
          Loc:Ole{'Application.Range(A4).Value'}='H1'
      OF 2
          Loc:Ole{'Application.Range(A4).Value'}='1-way'
      OF 3
          Loc:Ole{'Application.Range(A4).Value'}='Euro'
      OF 4
          Loc:Ole{'Application.Range(A4).Value'}='CKW'
      OF 5
          Loc:Ole{'Application.Range(A4).Value'}='BLOK'
      OF 6
          Loc:Ole{'Application.Range(A4).Value'}='CHEP'
      OF 7
          Loc:Ole{'Application.Range(A4).Value'}='E2'
      .	
      DO Vet
          
      Loc:Rij += 2
      Loc:Ole{'Application.Range(A'&Loc:Rij&').Value'}='Datum'
      Loc:Ole{'Application.Range(B'&Loc:Rij&').Value'}='Tijdstip'
      Loc:Ole{'Application.Range(C'&Loc:Rij&').Value'}='In'
      Loc:Ole{'Application.Range(D'&Loc:Rij&').Value'}='Uit'
      Loc:Ole{'Application.Range(E'&Loc:Rij&').Value'}='Saldo'
      Loc:Ole{'Application.Range(F'&Loc:Rij&').Value'}='Opmerking'
      IF pTab = 3 ! Per transporteur
          Loc:Ole{'Application.Range(G'&Loc:Rij&').Value'}='IN (Klant)'
          Loc:Ole{'Application.Range(H'&Loc:Rij&').Value'}='Klant'
      END
  		
      Loc:Ole{'Application.Columns(A:A).ColumnWidth'}=11
      Loc:Ole{'Application.Columns(B:B).ColumnWidth'}=10
      Loc:Ole{'Application.Columns(C:C).ColumnWidth'}=10
      Loc:Ole{'Application.Columns(D:D).ColumnWidth'}=10
      Loc:Ole{'Application.Columns(E:E).ColumnWidth'}=10
      Loc:Ole{'Application.Columns(F:F).ColumnWidth'}=20
      IF pTab = 3 ! Per transporteur
          Loc:Ole{'Application.Columns(G:G).ColumnWidth'}=10
          Loc:Ole{'Application.Columns(H:H).ColumnWidth'}=20
      End
          
      Do TrekLijntjes
      Do Vet
          
      CASE pTab 		!LOC:TransporteurExcel
      OF 1
          relatieid# = LOC:RelatieID1 !Rel:RelatieID
          transporteur# = 0
      OF 2
          relatieid# = LOC:RelatieID2 !AARel:RelatieID
          transporteur# = 0
      OF 3
          relatieid# = LOC:RelatieID3 !VTRA:RelatieID
          transporteur# = 1
      END
          
  
      ! PalletVerloop is een view zonder indexes. Accessen met SETs is daarom erg sloom.
      APalletVerloop{PROP:SQL} = 'SELECT * FROM PalletVerloop '&|
          'WHERE RelatieID = ' & CLIP(FORMAT(relatieid#, @N_10)) &|
          ' AND Transporteur = ' & CLIP(FORMAT(transporteur#, @N_10)) &|
          ' AND Planning >= <39>' & CLIP(FORMAT(LOC:VanafDatum, @D10-)) &|
          ' <39> AND Planning <=  <39>' & CLIP(FORMAT(LOC:TMDatum, @D10-)) &|
          ' <39> AND PalletSoortID = ' & CLIP(FORMAT(palletsoort#, @N_10)) & ' ORDER BY Planning DESC, PalletMutatieID DESC'
          
      db.DebugOut('SELECT * FROM PalletVerloop '&|
          'WHERE RelatieID = ' & CLIP(FORMAT(relatieid#, @N_10)) &|
          ' AND Transporteur = ' & CLIP(FORMAT(transporteur#, @N_10)) &|
          ' AND Planning >=  <39>' & CLIP(FORMAT(LOC:VanafDatum, @D10-)) &|
          ' <39> AND Planning <=  <39>' & CLIP(FORMAT(LOC:TMDatum, @D10-)) &|
          ' <39> AND PalletSoortID = ' & CLIP(FORMAT(palletsoort#, @N_10)) & ' ORDER BY Planning DESC, PalletMutatieID DESC')
          
      LOOP UNTIL Access:APalletVerloop.Next()
      	! Ophalen bijbehorende palletmutatie voor APM:PlanningID/APM:Opmerking
          CLEAR(APM:Record)
          APM:PalletMutatieID = APal3:PalletMutatieID
          Access:APalletMutatie.TryFetch(APM:PalletMutatie_PK)
              
          Loc:Rij+=1
          Loc:Ole{'Application.Range(A'&Loc:Rij&').Value'}=Format(APal3:Planning_DATE,@d6-)
          Loc:Ole{'Application.Range(B'&Loc:Rij&').Value'}=Format(APal3:Planning_TIME,@t01)
          Loc:Ole{'Application.Range(C'&Loc:Rij&').Value'}=APal3:Inkomend
          Loc:Ole{'Application.Range(D'&Loc:Rij&').Value'}=APal3:Uitgaand
          Loc:Ole{'Application.Range(E'&Loc:Rij&').Value'}=APal3:Saldo
          Loc:Ole{'Application.Range(F'&Loc:Rij&').Value'}=APM:Opmerking
  			
          IF pTab = 3 THEN ! Per transporteur
              LOC:KlantSaldoIn = 0
              LOC:Firmanaam = ''
  				
  				! Ophalen bijbehorende palletmutatie voor APM:VerkoopID
              palletSoortID# = APal3:PalletSoortID
              verkoopID# = APM:VerkoopID
  				
              IF APM:VerkoopID <> 0 THEN
                  CLEAR(APM:PalletMutatieID,-1)
                  SET(APM:PalletMutatie_FK4, APM:PalletMutatie_FK4)
  
                  LOOP UNTIL Access:APalletMutatie.Next()
                      IF APM:VerkoopID <> verkoopID# THEN BREAK.
                      IF APM:PalletSoortID <> palletSoortID# THEN CYCLE.
                      IF APM:Transporteur = 1 THEN CYCLE.
  					   
                      IF APM:Transporteur = 0 THEN
                          CLEAR(AREL:Record)
                          AREL:RelatieID = APM:RelatieID
                          IF (Access:ARelatie.Fetch(AREL:Relatie_PK) = Level:Benign)
                              LOC:Firmanaam = AREL:FirmaNaam
                              LOC:KlantSaldoIn = APM:Inkomend
                              BREAK
                          .
                      .
                  .
              .
                  
              Loc:Ole{'Application.Range(G'&Loc:Rij&').Value'}=LOC:KlantSaldoIn
              Loc:Ole{'Application.Range(H'&Loc:Rij&').Value'}=LOC:Firmanaam
          .
  			
          Do TrekLijntjes
      .
          
      Loc:Ole{'Cells.Select'}
      Loc:Ole{'Application.Selection.Font.Name'} = 'Ariel'
      Loc:Ole{'Application.Selection.Font.Size'} = 11
      Loc:Ole{'Cells(1,1).Select'}
  		
      Loc:Ole{'Application.Columns(A:H).AutoFit'}
      Loc:Ole{'Application.Rows(1:'&Loc:Rij&').AutoFit'}
      Loc:Ole{'Application.ActiveSheet.PageSetup.Zoom'} = 75 != Loc:Ole{'Application.ActiveSheet.PageSetup.BlackAndWhite'}!
      Loc:Ole{'Application.ActiveSheet.PageSetup.Orientation'} = 2 != Landscape
      Loc:Ole{'Application.ActiveSheet.PageSetup.TopMargin'} = 30 != Points (1/72 inch
      Loc:Ole{'Application.ActiveSheet.PageSetup.BottomMargin'} = 30 != Points (1/72 inch
      Loc:Ole{'Application.ActiveSheet.PageSetup.LeftMargin'} = 30 != Points (1/72 inch
      Loc:Ole{'Application.ActiveSheet.PageSetup.RightMargin'} = 30 != Points (1/72 inch
  		
      palletsoort# += 1
  .
  	
  Loc:Ole{'Sheets("H1").Select'}
  Loc:Ole{'Application.Visible'}=true ! nu pas excel laten zien
  DESTROY(LOC:Ole)
  
  SETCURSOR()
  



BRW1.ApplyRange PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  IF CHOICE(?CurrentTab) = 2 AND POINTER(SELF.Order)=1
      GET(SELF.Order.RangeList.List,1)
      SELF.Order.RangeList.List.Right = LOC:RelatieID2 ! Pal3:RelatieID
  ELSIF CHOICE(?CurrentTab) = 3 AND POINTER(SELF.Order)=2
      GET(SELF.Order.RangeList.List,1)
      SELF.Order.RangeList.List.Right = LOC:RelatieID3 ! Pal3:RelatieID
  ELSIF CHOICE(?CurrentTab) = 4 AND POINTER(SELF.Order)=3
  ELSE
      IF POINTER(SELF.Order)=4
         GET(SELF.Order.RangeList.List,1)
         SELF.Order.RangeList.List.Right = LOC:RelatieID1 ! Pal3:RelatieID
      END
  END
  ReturnValue = PARENT.ApplyRange()
  RETURN ReturnValue


BRW1.Fetch PROCEDURE(BYTE Direction)

GreenBarIndex   LONG,AUTO
  CODE
  PARENT.Fetch(Direction)
  !----------------------------------------------------------------------
    LOOP GreenBarIndex=1 TO RECORDS(SELF.Q)
      GET(SELF.Q,GreenBarIndex)
      SELF.Q.Pal3:FirmaNaam_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for Pal3:FirmaNaam
      SELF.Q.Pal3:FirmaNaam_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.Pal3:FirmaNaam_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.Pal3:FirmaNaam_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pal3:Transporteur_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for Pal3:Transporteur
      SELF.Q.Pal3:Transporteur_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.Pal3:Transporteur_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.Pal3:Transporteur_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.LOC:PalletSoort_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for LOC:PalletSoort
      SELF.Q.LOC:PalletSoort_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.LOC:PalletSoort_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.LOC:PalletSoort_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pal3:Planning_DATE_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for Pal3:Planning_DATE
      SELF.Q.Pal3:Planning_DATE_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.Pal3:Planning_DATE_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.Pal3:Planning_DATE_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pal3:Planning_TIME_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for Pal3:Planning_TIME
      SELF.Q.Pal3:Planning_TIME_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.Pal3:Planning_TIME_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.Pal3:Planning_TIME_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pal3:Inkomend_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for Pal3:Inkomend
      SELF.Q.Pal3:Inkomend_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.Pal3:Inkomend_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.Pal3:Inkomend_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pal3:Uitgaand_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for Pal3:Uitgaand
      SELF.Q.Pal3:Uitgaand_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.Pal3:Uitgaand_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.Pal3:Uitgaand_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.LOC:Saldo_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for LOC:Saldo
      SELF.Q.LOC:Saldo_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.LOC:Saldo_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.LOC:Saldo_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.LOC:KlantSaldoIn_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for LOC:KlantSaldoIn
      SELF.Q.LOC:KlantSaldoIn_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.LOC:KlantSaldoIn_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.LOC:KlantSaldoIn_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.LOC:Firmanaam_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for LOC:Firmanaam
      SELF.Q.LOC:Firmanaam_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.LOC:Firmanaam_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.LOC:Firmanaam_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.LOC:MatchingMutatie_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for LOC:MatchingMutatie
      SELF.Q.LOC:MatchingMutatie_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.LOC:MatchingMutatie_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.LOC:MatchingMutatie_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.LOC:HandmatigMutatie_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for LOC:HandmatigMutatie
      SELF.Q.LOC:HandmatigMutatie_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.LOC:HandmatigMutatie_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.LOC:HandmatigMutatie_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pal3:Opmerking_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for Pal3:Opmerking
      SELF.Q.Pal3:Opmerking_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.Pal3:Opmerking_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.Pal3:Opmerking_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pal:PalletMutatieID_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for Pal:PalletMutatieID
      SELF.Q.Pal:PalletMutatieID_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.Pal:PalletMutatieID_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.Pal:PalletMutatieID_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pal3:PalletSoortID_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for Pal3:PalletSoortID
      SELF.Q.Pal3:PalletSoortID_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.Pal3:PalletSoortID_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.Pal3:PalletSoortID_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      PUT(SELF.Q)
    END
  !----------------------------------------------------------------------


BRW1.Init PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)

  CODE
  PARENT.Init(ListBox,Posit,V,Q,RM,WM)
  IF WM.Request <> ViewRecord                              ! If called for anything other than ViewMode, make the insert, change & delete controls available
    SELF.InsertControl=?Insert
    SELF.ChangeControl=?Change
    SELF.DeleteControl=?Delete
  END


BRW1.ResetQueue PROCEDURE(BYTE ResetMode)

MetingTijd LONG
  CODE
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
  ELSE
    RETURN SELF.SetSort(4,Force)
  END
  ReturnValue = PARENT.ResetSort(Force)
  RETURN ReturnValue


BRW1.SetQueueRecord PROCEDURE

  CODE
      LOC:KlantSaldoIn = 0
  	LOC:Firmanaam = ''
  
  	CASE CHOICE(?CurrentTab)
  	OF 1 OROF 2 OROF 3
  		! Per klant/transporteur
  		LOC:Saldo = Pal3:Saldo
  		
  		IF CHOICE(?CurrentTab) = 3 THEN
  			IF Pal3:VerkoopID <> 0 THEN
  				CLEAR(PalletMutatieQueue)
  				PMQ:VerkoopID = Pal3:VerkoopID
  				PMQ:PalletSoortID = Pal3:PalletSoortID
  				PMQ:Transporteur = 0
  				GET(PalletMutatieQueue, +PMQ:VerkoopID, +PMQ:PalletSoortID, +PMQ:Transporteur)
  				IF NOT(ERROR()) THEN
  					IF PMQ:VerkoopID = Pal3:VerkoopID AND PMQ:PalletSoortID = Pal3:PalletSoortID AND PMQ:Transporteur = 0 THEN
  						LOC:KlantSaldoIn = PMQ:Inkomend
  						LOC:Firmanaam = PMQ:FirmaNaam
  					END
  				END
  			END
  		END
  	OF 4
  		! Alle
  		LOC:Saldo = Pal3:SaldoTotaal
  		
  		! Controleren of een palletmutatie ook een mutatie bij de transporteur
  		! heeft en vice versa
  		LOC:MatchingMutatie = false
  		LOC:HandmatigMutatie = false
  
  		IF Pal3:VerkoopID <> 0 THEN
  			CLEAR(PalletMutatieQueue)
  			PMQ:VerkoopID = Pal3:VerkoopID
  			PMQ:PalletSoortID = Pal3:PalletSoortID
  			IF Pal3:Transporteur THEN
  				transporteur# = 1
  			ELSE
  				transporteur# = 0				
  			END
  			PMQ:Transporteur = transporteur#
  			GET(PalletMutatieQueue, +PMQ:VerkoopID, +PMQ:PalletSoortID, +PMQ:Transporteur)
  			IF NOT(ERROR()) THEN
  				IF PMQ:VerkoopID = Pal3:VerkoopID AND PMQ:PalletSoortID = Pal3:PalletSoortID AND PMQ:Transporteur = transporteur# THEN
  					LOC:MatchingMutatie = true
  				END
  			END
  		ELSE
  			! Handmatig
  			LOC:HandmatigMutatie = true
  		.
  	.
  
  	! 'H1'|'1-way'|'Euro'|'CKW'
  	CASE Pal3:PalletSoortID
  	OF 1
  		LOC:PalletSoort = 'H1'
  	OF 2
  		LOC:PalletSoort = '1-way'
  	OF 3
  		LOC:PalletSoort = 'Euro'
  	OF 4
  		LOC:PalletSoort = 'CKW'
  	OF 5
  		LOC:PalletSoort = 'BLOK'
  	OF 6
        LOC:PalletSoort = 'CHEP'
    OF 7
  		LOC:PalletSoort = 'E2'
      .
  
     
  PARENT.SetQueueRecord
  
  IF (AARel:NietActief)
    SELF.Q.Pal3:FirmaNaam_Style = 1 ! 1
  ELSE
    SELF.Q.Pal3:FirmaNaam_Style = 0 ! 0
  END
  IF (Pal3:Transporteur)
    SELF.Q.Pal3:Transporteur_Icon = 2                      ! Set icon from icon list
  ELSE
    SELF.Q.Pal3:Transporteur_Icon = 1                      ! Set icon from icon list
  END
  IF (LOC:MatchingMutatie)
    SELF.Q.LOC:MatchingMutatie_Icon = 2                    ! Set icon from icon list
  ELSE
    SELF.Q.LOC:MatchingMutatie_Icon = 1                    ! Set icon from icon list
  END
  IF (LOC:HandmatigMutatie)
    SELF.Q.LOC:HandmatigMutatie_Icon = 2                   ! Set icon from icon list
  ELSE
    SELF.Q.LOC:HandmatigMutatie_Icon = 1                   ! Set icon from icon list
  END
  !----------------------------------------------------------------------
      SELF.Q.Pal3:FirmaNaam_NormalFG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1) ! Set color values for Pal3:FirmaNaam
      SELF.Q.Pal3:FirmaNaam_NormalBG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,8454143)
      SELF.Q.Pal3:FirmaNaam_SelectedFG = CHOOSE(CHOICE(?Browse:1) % 2,-1,8454143)
      SELF.Q.Pal3:FirmaNaam_SelectedBG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.Pal3:Transporteur_NormalFG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1) ! Set color values for Pal3:Transporteur
      SELF.Q.Pal3:Transporteur_NormalBG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,8454143)
      SELF.Q.Pal3:Transporteur_SelectedFG = CHOOSE(CHOICE(?Browse:1) % 2,-1,8454143)
      SELF.Q.Pal3:Transporteur_SelectedBG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.LOC:PalletSoort_NormalFG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1) ! Set color values for LOC:PalletSoort
      SELF.Q.LOC:PalletSoort_NormalBG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,8454143)
      SELF.Q.LOC:PalletSoort_SelectedFG = CHOOSE(CHOICE(?Browse:1) % 2,-1,8454143)
      SELF.Q.LOC:PalletSoort_SelectedBG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.Pal3:Planning_DATE_NormalFG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1) ! Set color values for Pal3:Planning_DATE
      SELF.Q.Pal3:Planning_DATE_NormalBG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,8454143)
      SELF.Q.Pal3:Planning_DATE_SelectedFG = CHOOSE(CHOICE(?Browse:1) % 2,-1,8454143)
      SELF.Q.Pal3:Planning_DATE_SelectedBG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.Pal3:Planning_TIME_NormalFG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1) ! Set color values for Pal3:Planning_TIME
      SELF.Q.Pal3:Planning_TIME_NormalBG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,8454143)
      SELF.Q.Pal3:Planning_TIME_SelectedFG = CHOOSE(CHOICE(?Browse:1) % 2,-1,8454143)
      SELF.Q.Pal3:Planning_TIME_SelectedBG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.Pal3:Inkomend_NormalFG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1) ! Set color values for Pal3:Inkomend
      SELF.Q.Pal3:Inkomend_NormalBG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,8454143)
      SELF.Q.Pal3:Inkomend_SelectedFG = CHOOSE(CHOICE(?Browse:1) % 2,-1,8454143)
      SELF.Q.Pal3:Inkomend_SelectedBG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.Pal3:Uitgaand_NormalFG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1) ! Set color values for Pal3:Uitgaand
      SELF.Q.Pal3:Uitgaand_NormalBG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,8454143)
      SELF.Q.Pal3:Uitgaand_SelectedFG = CHOOSE(CHOICE(?Browse:1) % 2,-1,8454143)
      SELF.Q.Pal3:Uitgaand_SelectedBG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.LOC:Saldo_NormalFG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1) ! Set color values for LOC:Saldo
      SELF.Q.LOC:Saldo_NormalBG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,8454143)
      SELF.Q.LOC:Saldo_SelectedFG = CHOOSE(CHOICE(?Browse:1) % 2,-1,8454143)
      SELF.Q.LOC:Saldo_SelectedBG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.LOC:KlantSaldoIn_NormalFG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1) ! Set color values for LOC:KlantSaldoIn
      SELF.Q.LOC:KlantSaldoIn_NormalBG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,8454143)
      SELF.Q.LOC:KlantSaldoIn_SelectedFG = CHOOSE(CHOICE(?Browse:1) % 2,-1,8454143)
      SELF.Q.LOC:KlantSaldoIn_SelectedBG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.LOC:Firmanaam_NormalFG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1) ! Set color values for LOC:Firmanaam
      SELF.Q.LOC:Firmanaam_NormalBG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,8454143)
      SELF.Q.LOC:Firmanaam_SelectedFG = CHOOSE(CHOICE(?Browse:1) % 2,-1,8454143)
      SELF.Q.LOC:Firmanaam_SelectedBG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.LOC:MatchingMutatie_NormalFG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1) ! Set color values for LOC:MatchingMutatie
      SELF.Q.LOC:MatchingMutatie_NormalBG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,8454143)
      SELF.Q.LOC:MatchingMutatie_SelectedFG = CHOOSE(CHOICE(?Browse:1) % 2,-1,8454143)
      SELF.Q.LOC:MatchingMutatie_SelectedBG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.LOC:HandmatigMutatie_NormalFG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1) ! Set color values for LOC:HandmatigMutatie
      SELF.Q.LOC:HandmatigMutatie_NormalBG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,8454143)
      SELF.Q.LOC:HandmatigMutatie_SelectedFG = CHOOSE(CHOICE(?Browse:1) % 2,-1,8454143)
      SELF.Q.LOC:HandmatigMutatie_SelectedBG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.Pal3:Opmerking_NormalFG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1) ! Set color values for Pal3:Opmerking
      SELF.Q.Pal3:Opmerking_NormalBG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,8454143)
      SELF.Q.Pal3:Opmerking_SelectedFG = CHOOSE(CHOICE(?Browse:1) % 2,-1,8454143)
      SELF.Q.Pal3:Opmerking_SelectedBG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.Pal:PalletMutatieID_NormalFG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1) ! Set color values for Pal:PalletMutatieID
      SELF.Q.Pal:PalletMutatieID_NormalBG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,8454143)
      SELF.Q.Pal:PalletMutatieID_SelectedFG = CHOOSE(CHOICE(?Browse:1) % 2,-1,8454143)
      SELF.Q.Pal:PalletMutatieID_SelectedBG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.Pal3:PalletSoortID_NormalFG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1) ! Set color values for Pal3:PalletSoortID
      SELF.Q.Pal3:PalletSoortID_NormalBG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,8454143)
      SELF.Q.Pal3:PalletSoortID_SelectedFG = CHOOSE(CHOICE(?Browse:1) % 2,-1,8454143)
      SELF.Q.Pal3:PalletSoortID_SelectedBG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
  !----------------------------------------------------------------------


BRW1.SetSort PROCEDURE(BYTE NewOrder,BYTE Force)

ReturnValue          BYTE,AUTO

_starttijd              TIME
  CODE
  _starttijd = CLOCK()
  ReturnValue = PARENT.SetSort(NewOrder,Force)
  IF ReturnValue
      LogSetSort('Pallet',' NewOrder: '&NewOrder&' Force: '&Force& ' ReturnValue: '&ReturnValue&' '&(Clock()-_starttijd)/100&' sec')
  END
  RETURN ReturnValue


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window
  SELF.SetStrategy(?PROMPT1, Resize:FixLeft+Resize:FixTop, Resize:LockSize) ! Override strategy for ?PROMPT1
  SELF.SetStrategy(?Rel:FirmaNaam, Resize:FixLeft+Resize:FixTop, Resize:LockSize) ! Override strategy for ?Rel:FirmaNaam
  SELF.SetStrategy(?LOC:PalletSoortChoice, Resize:FixRight+Resize:FixTop, Resize:LockSize) ! Override strategy for ?LOC:PalletSoortChoice
  SELF.SetStrategy(?VTRA:FirmaNaam, Resize:FixLeft+Resize:FixTop, Resize:LockSize) ! Override strategy for ?VTRA:FirmaNaam
  SELF.SetStrategy(?PROMPT2, Resize:FixLeft+Resize:FixTop, Resize:LockSize) ! Override strategy for ?PROMPT2
  SELF.SetStrategy(?Close, Resize:FixRight+Resize:FixBottom, Resize:LockSize) ! Override strategy for ?Close
  SELF.SetStrategy(?STRING2, Resize:FixLeft+Resize:FixTop, Resize:LockSize) ! Override strategy for ?STRING2
  SELF.SetStrategy(?AARel:FirmaNaam, Resize:FixLeft+Resize:FixTop, Resize:LockSize) ! Override strategy for ?AARel:FirmaNaam
  SELF.SetStrategy(?STRING3, Resize:FixLeft+Resize:FixBottom, Resize:LockSize) ! Override strategy for ?STRING3
  SELF.SetStrategy(?Lookup:1, Resize:FixLeft+Resize:FixTop, Resize:LockSize) ! Override strategy for ?Lookup:1
  SELF.SetStrategy(?Lookup:2, Resize:FixLeft+Resize:FixTop, Resize:LockSize) ! Override strategy for ?Lookup:2
  SELF.SetStrategy(?LOC:PalletSoortChoice:Prompt, Resize:FixRight+Resize:FixTop, Resize:LockSize) ! Override strategy for ?LOC:PalletSoortChoice:Prompt
  SELF.SetStrategy(?Excel:1, Resize:FixLeft+Resize:FixBottom, Resize:LockSize) ! Override strategy for ?Excel:1
  SELF.SetStrategy(?Excel:3, Resize:FixLeft+Resize:FixBottom, Resize:LockSize) ! Override strategy for ?Excel:3
  SELF.SetStrategy(?Excel:2, Resize:FixLeft+Resize:FixBottom, Resize:LockSize) ! Override strategy for ?Excel:2


FDCB3.SetQueueRecord PROCEDURE

  CODE
  PARENT.SetQueueRecord
  
  IF (Rel:NietActief)
    SELF.Q.Rel:FirmaNaam_NormalFG = -1                     ! Set conditional color values for Rel:FirmaNaam
    SELF.Q.Rel:FirmaNaam_NormalBG = 255
    SELF.Q.Rel:FirmaNaam_SelectedFG = 255
    SELF.Q.Rel:FirmaNaam_SelectedBG = -1
  ELSE
    SELF.Q.Rel:FirmaNaam_NormalFG = -1                     ! Set color values for Rel:FirmaNaam
    SELF.Q.Rel:FirmaNaam_NormalBG = -1
    SELF.Q.Rel:FirmaNaam_SelectedFG = -1
    SELF.Q.Rel:FirmaNaam_SelectedBG = -1
  END


FDCB5.SetQueueRecord PROCEDURE

  CODE
  PARENT.SetQueueRecord
  
  SELF.Q.VTRA:FirmaNaam_NormalFG = -1                      ! Set color values for VTRA:FirmaNaam
  SELF.Q.VTRA:FirmaNaam_NormalBG = -1
  SELF.Q.VTRA:FirmaNaam_SelectedFG = -1
  SELF.Q.VTRA:FirmaNaam_SelectedBG = -1


FDCB6.SetQueueRecord PROCEDURE

  CODE
  PARENT.SetQueueRecord
  
  IF (AARel:NietActief)
    SELF.Q.AARel:FirmaNaam_NormalFG = -1                   ! Set conditional color values for AARel:FirmaNaam
    SELF.Q.AARel:FirmaNaam_NormalBG = 255
    SELF.Q.AARel:FirmaNaam_SelectedFG = 255
    SELF.Q.AARel:FirmaNaam_SelectedBG = -1
  ELSE
    SELF.Q.AARel:FirmaNaam_NormalFG = -1                   ! Set color values for AARel:FirmaNaam
    SELF.Q.AARel:FirmaNaam_NormalBG = -1
    SELF.Q.AARel:FirmaNaam_SelectedFG = -1
    SELF.Q.AARel:FirmaNaam_SelectedBG = -1
  END

