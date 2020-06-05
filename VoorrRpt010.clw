

   MEMBER('VoorrRpt.clw')                                  ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABDROPS.INC'),ONCE
   INCLUDE('ABREPORT.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE

                     MAP
                       INCLUDE('VOORRRPT010.INC'),ONCE        !Local module procedure declarations
                     END


!!! <summary>
!!! Generated from procedure template - Report
!!! </summary>
ReportCMR PROCEDURE (PRM:PlanningID)

udpt            UltimateDebugProcedureTracker
Progress:Thermometer BYTE                                  ! 
Loc:ArtikelQ         QUEUE,PRE(LAQ)                        ! 
ArtikelID            CSTRING(31)                           ! 
VerpakkingOmschrijving CSTRING(51)                         ! 
ArtikelOms           CSTRING(61)                           ! 
BrutoKG              DECIMAL(7,2)                          ! 
NettoKG              DECIMAL(7,2)                          ! 
Gewogen              BYTE                                  ! 
Pallets              LONG                                  ! 
Partijnr             LONG                                  ! 
                     END                                   ! 
LOC:PlanningID       LONG                                  ! 
LOC:ExtraDocumenten  STRING(255)                           ! 
Loc:Artikel          STRING(1200)                          ! 
LOC:ArtikelBepaald   CSTRING(1201)                         ! 
LOC:ArtikelWide      STRING(1200)                          ! 
Loc:Expediteur       CSTRING(1001)                         ! 
Loc:Geadresseerde    CSTRING(101)                          ! 
Loc:AfleveringAdres  STRING(600)                           ! 
Loc:AfkomstAdres     STRING(600)                           ! 
LOC:Instructie       STRING(600)                           ! 
LOC:AfleveringsPlaats STRING(250)                          ! 
LOC:OpgemaaktTe      STRING(300)                           ! 
LOC:HandtekeningStempelAfzender STRING(300)                ! 
LOC:Kenteken         STRING(255)                           ! 
LOC:Frankeringsvoorschrift STRING(255)                     ! 
LOC:Transporteur     STRING(255)                           ! 
LOC:TransporteurExtra STRING(255)                          ! 
LOC:OpmerkingenVervoerder STRING(255)                      ! 
LOC:SpecialeOvereenkomst STRING(255)                       ! 
Loc:CMRPrinter       CSTRING(199)                          ! 
SAV:Printer          CSTRING(199)                          ! 
SAV:PaperBin         LONG                                  ! 
Loc:IsTruckClear     BYTE                                  ! 
Loc:IsPackingGoodsOK BYTE                                  ! 
Loc:ISDriverDressedCorrectly BYTE                          ! 
Loc:EC_LabelsOnTheGoods BYTE                               ! 
LOC:PalletSoort1     STRING(10)                            ! 
LOC:PalletSoort5     STRING(10)                            ! 
LOC:PalletSoort3     STRING(10)                            ! 
LOC:PalletSoort6     STRING(10)                            ! 
LOC:PalletSoort1_OUT LONG                                  ! 
LOC:PalletSoort2_OUT LONG                                  ! 
LOC:PalletSoort3_IN  LONG                                  ! 
LOC:PalletSoort3_OUT LONG                                  ! 
LOC:PalletSoort2_IN  LONG                                  ! 
LOC:PalletSoort1_IN  LONG                                  ! 
LOC:PalletSoort4_IN  LONG                                  ! 
LOC:PalletSoort4_OUT LONG                                  ! 
LOC:AantalRegels     LONG                                  ! 
LOC:TransporteurID   LONG                                  ! 
LOC:Country          STRING(60)                            ! 
LOC:VerkoopID        LONG                                  ! 
LOC:ArtikelOms       STRING(160)                           ! 
LOC:NettoKG          DECIMAL(7,2)                          ! 
LOC:BrutoKG          DECIMAL(7,2)                          ! 
LOC:Waarschuwing     STRING(100)                           ! 
Loc:Printer          STRING(20)                            ! 
Loc:CMRnr            LONG                                  ! 
Loc:SavePath         STRING(255)                           ! 
Loc:TMPDirectory     STRING(255)                           ! 
Loc:Commando         CSTRING(10000)                        ! 
Loc:TmpAtt           STRING(255)                           ! 
Loc:Landscape        BYTE                                  ! 
Loc:LandscapeOverride BYTE                                 ! 
Loc:MailButtonID     LONG                                  ! 
Process:View         VIEW(Planning)
                       PROJECT(Pla:PlanningID)
                       PROJECT(Pla:VerkoopID)
                       JOIN(Ver2:PK_Verkoop,Pla:VerkoopID)
                         PROJECT(Ver2:Instructie)
                         PROJECT(Ver2:Klant)
                         JOIN(AREL:Relatie_PK,Ver2:Klant)
                           PROJECT(AREL:Adres1)
                           PROJECT(AREL:FirmaNaam)
                           PROJECT(AREL:Plaats)
                           PROJECT(AREL:Postcode)
                         END
                       END
                     END
FDCB2::View:FileDropCombo VIEW(ViewTransporteur)
                       PROJECT(VTRA:FirmaNaam)
                       PROJECT(VTRA:Plaats)
                     END
Queue:FileDropCombo  QUEUE                            !
VTRA:FirmaNaam         LIKE(VTRA:FirmaNaam)           !List box control field - type derived from field
VTRA:Plaats            LIKE(VTRA:Plaats)              !List box control field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
LocEnableEnterByTab  BYTE(1)                               !Used by the ENTER Instead of Tab template
EnterByTabManager    EnterByTabClass
ProgressWindow       WINDOW('Progress....'),AT(,,393,389),FONT('Microsoft Sans Serif',10,,,CHARSET:DEFAULT),DOUBLE, |
  CENTER,GRAY,TIMER(1)
                       PROGRESS,AT(274,350,111,16),USE(Progress:Thermometer),RANGE(0,100)
                       STRING(''),AT(274,313,111,19),USE(?Progress:UserString),CENTER
                       STRING(''),AT(274,291,111,19),USE(?Progress:PctText),CENTER
                       PROMPT('Printer:'),AT(214,7),USE(?Loc:Printer:Prompt)
                       LIST,AT(243,6,141,10),USE(Loc:Printer,,?Loc:Printer:2),DROP(3),FROM('Kies Printer|Recep' & |
  'tie|Vrieshuis')
                       TEXT,AT(14,6,178,38),USE(Loc:Expediteur)
                       TEXT,AT(14,48,178,26),USE(Loc:Geadresseerde)
                       TEXT,AT(14,78,178,26),USE(Loc:AfleveringAdres)
                       TEXT,AT(14,108,178,23),USE(Loc:AfkomstAdres)
                       TEXT,AT(14,136,178,26),USE(LOC:ExtraDocumenten)
                       TEXT,AT(14,167,224,60),USE(Loc:Artikel),VSCROLL
                       ENTRY(@n13.),AT(287,178,46,10),USE(LOC:PalletSoort1_OUT,,?LOC:PalletSoort1_OUT:2),RIGHT
                       ENTRY(@n14.),AT(339,178,46,10),USE(LOC:PalletSoort1_IN),RIGHT
                       ENTRY(@n14.),AT(287,194,46,10),USE(LOC:PalletSoort2_OUT),RIGHT
                       ENTRY(@n14.),AT(339,194,46,10),USE(LOC:PalletSoort2_IN),RIGHT
                       ENTRY(@n14.),AT(287,209,46,10),USE(LOC:PalletSoort3_OUT),RIGHT
                       ENTRY(@n14.),AT(338,209,47,10),USE(LOC:PalletSoort3_IN),RIGHT
                       ENTRY(@n14.),AT(287,224,46,8),USE(LOC:PalletSoort4_OUT),RIGHT
                       ENTRY(@n14.),AT(339,224,46,8),USE(LOC:PalletSoort4_IN),RIGHT
                       TEXT,AT(15,249,178,44),USE(LOC:Instructie)
                       CHECK('Is Truck Clean ?'),AT(195,287),USE(Loc:IsTruckClear)
                       CHECK('Is Packing Goods OK?'),AT(195,297),USE(Loc:IsPackingGoodsOK)
                       CHECK('Is Driver Dressed Correctly?'),AT(195,307),USE(Loc:ISDriverDressedCorrectly)
                       CHECK('EC Labels On The Goods?'),AT(195,319),USE(Loc:EC_LabelsOnTheGoods)
                       TEXT,AT(15,297,178,18),USE(LOC:Frankeringsvoorschrift)
                       TEXT,AT(213,48,171,26),USE(LOC:Transporteur)
                       TEXT,AT(213,78,171,26),USE(LOC:TransporteurExtra)
                       TEXT,AT(213,108,171,54),USE(LOC:OpmerkingenVervoerder)
                       TEXT,AT(214,249,171,34),USE(LOC:SpecialeOvereenkomst)
                       TEXT,AT(15,319,178,20),USE(LOC:OpgemaaktTe)
                       TEXT,AT(15,343,98,28),USE(LOC:HandtekeningStempelAfzender)
                       TEXT,AT(127,343,108,28),USE(LOC:Kenteken)
                       STRING('23'),AT(117,343),USE(?STRING1)
                       STRING('22'),AT(3,343),USE(?STRING2)
                       STRING('1'),AT(6,6),USE(?STRING3)
                       STRING('2'),AT(6,48,,10),USE(?STRING4)
                       STRING('3'),AT(6,78,4,10),USE(?STRING5)
                       STRING('4'),AT(6,106),USE(?STRING6)
                       STRING('5'),AT(6,138),USE(?STRING7)
                       STRING('16'),AT(202,48),USE(?STRING8)
                       STRING('17'),AT(202,78),USE(?STRING9)
                       STRING('18'),AT(202,108),USE(?STRING10)
                       STRING('6'),AT(6,169),USE(?STRING11)
                       STRING('13'),AT(3,249),USE(?STRING12)
                       STRING('14'),AT(3,297),USE(?STRING13)
                       STRING('21'),AT(4,319),USE(?STRING14)
                       STRING('19'),AT(203,249),USE(?STRING15)
                       STRING('OUT'),AT(302,165),USE(?STRING16)
                       PROMPT('IN'),AT(358,165),USE(?PROMPT4)
                       STRING(@s10),AT(242,179,40),USE(LOC:PalletSoort1)
                       STRING(@s10),AT(242,194,40),USE(LOC:PalletSoort5)
                       STRING(@s10),AT(242,208,40),USE(LOC:PalletSoort3)
                       STRING(@s10),AT(242,223,40),USE(LOC:PalletSoort6)
                       PROMPT('Transporteur:'),AT(81,376),USE(?PROMPT1)
                       COMBO(@s50),AT(127,376,108,8),USE(VTRA:FirmaNaam),DROP(5),FORMAT('100L(2)|M~Firmanaam~C' & |
  '(0)@s50@400L(2)|M~Plaats~C(0)@s100@'),FROM(Queue:FileDropCombo),IMM
                       BUTTON('Leeg'),AT(239,373,24),USE(?BtnLeeg)
                       BUTTON('Pause'),AT(274,368,58,19),USE(?Pause)
                       BUTTON('Cancel'),AT(336,368,50,19),USE(?Progress:Cancel)
                       BUTTON('Vul artikelen opnieuw'),AT(13,231),USE(?VulArtikelOpnieuw)
                       STRING(@S100),AT(98,234,287),USE(LOC:Waarschuwing),FONT(,,,FONT:bold)
                     END

Report               REPORT,AT(800,800,7160,10960),PRE(RPT),PAPER(PAPER:A4),FONT('Arial',10,,,CHARSET:ANSI),THOUS
BreakOnPlanning        BREAK(Pla:PlanningID),USE(?BREAK1)
                         HEADER,AT(0,0,7115,4000),USE(?GROUPHEADER1)
                           TEXT,AT(80,0,3400,920),USE(Loc:Expediteur)
                           TEXT,AT(80,960,3400,800),USE(Loc:Geadresseerde)
                           TEXT,AT(80,1760,3400,640),USE(Loc:AfleveringAdres)
                           TEXT,AT(80,2640,3400,680),USE(Loc:AfkomstAdres)
                           TEXT,AT(80,3320,3400,640),USE(LOC:ExtraDocumenten)
                           TEXT,AT(3560,960,3400),USE(LOC:Transporteur)
                           TEXT,AT(3560,1960,3400,640),USE(LOC:TransporteurExtra)
                           TEXT,AT(3560,2640,3400,1320),USE(LOC:OpmerkingenVervoerder)
                           STRING(@n_6B),AT(5320,-119),USE(Loc:CMRnr),FONT(,16),RIGHT(40)
                         END
PlanningDetail           DETAIL,AT(0,0,7115,2854),USE(?DETAIL1)
                           BOX,AT(4604,1417,2440,1280),USE(?BOX1),COLOR(COLOR:Black),LINEWIDTH(1)
                           BOX,AT(4604,1740,2440,240),USE(?BOX3),COLOR(COLOR:Black),LINEWIDTH(1)
                           BOX,AT(4604,2219,2440,240),USE(?BOX4),COLOR(COLOR:Black),LINEWIDTH(1)
                           BOX,AT(5635,1417,760,1280),USE(?BOX2),COLOR(COLOR:Black),LINEWIDTH(1)
                           TEXT,AT(80,0,6958,2781),USE(LOC:ArtikelWide),TRN
                           TEXT,AT(80,0,4440,2781),USE(Loc:Artikel,,?Loc:Artikel:2),TRN
                           STRING('OUT'),AT(5917,1562),USE(?STRING1)
                           STRING('IN'),AT(6635,1562),USE(?STRING2)
                           STRING(@n14.B),AT(5844,2010),USE(LOC:PalletSoort2_IN),RIGHT(40)
                           STRING(@n14.B),AT(5844,1771),USE(LOC:PalletSoort1_IN),RIGHT(40)
                           STRING(@n14.B),AT(5844,2250),USE(LOC:PalletSoort3_IN),RIGHT(40)
                           STRING(@n14.B),AT(5844,2490),USE(LOC:PalletSoort4_IN),RIGHT(40)
                           STRING(@N14.B),AT(5156,1771),USE(LOC:PalletSoort1_OUT),RIGHT(40)
                           STRING(@n14.B),AT(5156,2010),USE(LOC:PalletSoort2_OUT),RIGHT(40)
                           STRING(@n14.B),AT(5156,2250),USE(LOC:PalletSoort3_OUT),RIGHT(40)
                           STRING(@n14.B),AT(5156,2490),USE(LOC:PalletSoort4_OUT),RIGHT(40)
                           STRING(@s10),AT(4719,1771),USE(LOC:PalletSoort1)
                           STRING(@s10),AT(4719,2010),USE(LOC:PalletSoort5)
                           STRING(@s10),AT(4719,2250),USE(LOC:PalletSoort3)
                           STRING(@s10),AT(4719,2490),USE(LOC:PalletSoort6)
                         END
                         FOOTER,AT(0,0,7120,3800),USE(?GROUPFOOTER1)
                           TEXT,AT(80,0,3440,1719),USE(LOC:Instructie)
                           TEXT,AT(562,2375,3440,240),USE(LOC:OpgemaaktTe)
                           TEXT,AT(80,2600,2280,960),USE(LOC:HandtekeningStempelAfzender)
                           TEXT,AT(2360,2600,2320,960),USE(LOC:Kenteken)
                           TEXT,AT(3560,40,3520),USE(LOC:SpecialeOvereenkomst)
                           TEXT,AT(562,1896,3440,520),USE(LOC:Frankeringsvoorschrift)
                         END
                       END
                     END
    omit('***',WE::CantCloseNowSetHereDone=1)  !Getting Nested omit compile error, then uncheck the "Check for duplicate CantCloseNowSetHere variable declaration" in the WinEvent local template
WE::CantCloseNowSetHereDone equate(1)
WE::CantCloseNowSetHere     long
    !***
ThisWindow           CLASS(ReportManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Init                   PROCEDURE(ProcessClass PC,<REPORT R>,<PrintPreviewClass PV>)
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
OpenReport             PROCEDURE(),BYTE,PROC,DERIVED
Paused                 BYTE
Timer                  LONG
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED
TakeEvent              PROCEDURE(),BYTE,PROC,DERIVED
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED
                     END

ThisReport           CLASS(ProcessClass)                   ! Process Manager
Close                  PROCEDURE(),DERIVED
TakeRecord             PROCEDURE(),BYTE,PROC,DERIVED
                     END

ProgressMgr          StepLongClass                         ! Progress Manager
Resizer              CLASS(WindowResizeClass)
Init                   PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)
                     END

FDCB2                CLASS(FileDropComboClass)             ! File drop combo manager
Q                      &Queue:FileDropCombo           !Reference to browse queue type
                     END

LocalClass          CLASS
SchrijfPalletMutatie    Procedure(LONG, LONG, LONG, LONG, LONG)
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
VulLocArtikel       ROUTINE
DATA

st  StringTheory
AantalLijenVak6     LONG(16)
HoogteArtikelRegel  LONG(4)         
AantalCMRRegels     LONG(0)
ArtikelLayout       LONG
CODE
    LOC:ArtikelBepaald=''
    ! 2018-5-12 Als Rel:CMROpmerking is gevuld, dit elke regel printen
    ! dus eerst kijken hoeveek regels de CMR Rel:CMROpmerking
    st.SetValue(AREL:CMROpmerking)
    st.Split('<13,10>')
    AantalCMRRegels = st.Records()
    ArtikelLayout = 4   ! grootste lay-out
    LOOP
        IF ((ArtikelLayout+AantalCMRRegels))*RECORDS(Loc:ArtikelQ)<=16
            Break       ! gevonden deze past
        END
        ArtikelLayout-= 1 
        IF ArtikelLayout<=1 THEN BREAK.
    END
    
    !Message('AantalLijenVak6:'&AantalLijenVak6&'|AantalCMRRegels:'&AantalCMRRegels&'|HoogteArtikelRegel:'&HoogteArtikelRegel&'|ArtikelLayout:'&ArtikelLayout&'|RECORDS(Loc:ArtikelQ):'&RECORDS(Loc:ArtikelQ))   
    Loop i#=1 TO RECORDS(Loc:ArtikelQ)
        GET(Loc:ArtikelQ,i#)
        If CLIP(LOC:ArtikelBepaald) <> ''
            LOC:ArtikelBepaald = CLIP(LOC:ArtikelBepaald)&'<13,10>'
        END
        CASE ArtikelLayout 
        of  4
            LOC:ArtikelBepaald = CLIP(LOC:ArtikelBepaald)&'Lot: ' & CLIP(LAQ:Partijnr) & |
                '<13><10>' & CLIP(LAQ:ArtikelOms) & |
                '<13><10>' & 'BRUTO: ' & CLIP(LEFT(FORMAT(LAQ:BrutoKG,'@n10`2'))) & ' kg / NETTO: ' & CLIP(LEFT(FORMAT(LAQ:NettoKG,'@n10`2'))) & ' kg' & |
                '<13><10>' & CLIP(LEFT(FORMAT(LAQ:Pallets,'@N10.'))) & ' pallets'&|
                CHOOSE(AantalCMRRegels>0,'<13><10>','') &AREL:CMROpmerking
        of 3
            LOC:ArtikelBepaald = CLIP(LOC:ArtikelBepaald)&'Lot: ' & CLIP(LAQ:Partijnr) & |
                    '' & CLIP(LAQ:ArtikelOms) & |
                    '<13><10>' & 'BRUTO: ' & CLIP(LEFT(FORMAT(LAQ:BrutoKG,'@n10`2'))) & ' kg / NETTO: ' & CLIP(LEFT(FORMAT(LAQ:NettoKG,'@n10`2'))) & ' kg' & |
                    '<13><10>' & CLIP(LEFT(FORMAT(LAQ:Pallets,'@N10.'))) & ' pallets' & |
                CHOOSE(AantalCMRRegels>0,'<13><10>','') &AREL:CMROpmerking
        of 2    
                LOC:ArtikelBepaald = CLIP(LOC:ArtikelBepaald)&'Lot: ' & CLIP(LAQ:Partijnr) & |
                    '' & CLIP(LAQ:ArtikelOms) & |
                    '<13><10>' & 'BRUTO: ' & CLIP(LEFT(FORMAT(LAQ:BrutoKG,'@n10`2'))) & ' kg / NETTO: ' & CLIP(LEFT(FORMAT(LAQ:NettoKG,'@n10`2'))) & ' kg' & |
                    '' & CLIP(LEFT(FORMAT(LAQ:Pallets,'@N10.'))) & ' pallets' & |
                CHOOSE(AantalCMRRegels>0,'<13><10>','') &AREL:CMROpmerking
        ELSE
                LOC:ArtikelBepaald = CLIP(LOC:ArtikelBepaald)&'Lot: ' & CLIP(LAQ:Partijnr) & |
                    '' & CLIP(LAQ:ArtikelOms) & |
                    '' & 'BRUTO: ' & CLIP(LEFT(FORMAT(LAQ:BrutoKG,'@n10`2'))) & ' kg / NETTO: ' & CLIP(LEFT(FORMAT(LAQ:NettoKG,'@n10`2'))) & ' kg' & |
                    '' & CLIP(LEFT(FORMAT(LAQ:Pallets,'@N10.'))) & ' pallets' & |
                CHOOSE(AantalCMRRegels>0,'<13><10>','') &AREL:CMROpmerking
        END
    END
                
    
    EXIT
VulArtikelQueue     ROUTINE
	LOC:Waarschuwing = ''
	
	FREE(Loc:ArtikelQ)
	! dit geldt voor alle regels van deze verkoop
	! eerst even aantal regels tellen er zijn 15 regels beschikbaar
	LOC:AantalRegels=0
    WegingGevonden# = false
    
    Clear(Pla:Record)
    Pla:VerkoopID = Ver2:VerkoopID
    Set(Pla:Planning_FK02,Pla:Planning_FK02)
    Loop Until Access:Planning.Next()
        if Pla:VerkoopID <> Ver2:VerkoopID then break.
        
        MutatieGevonden# = false
        CLEAR(Mut:Record)
        Mut:PlanningID=Pla:PlanningID
        SET(Mut:Mutatie_FK02,Mut:Mutatie_FK02)
        LOOP UNTIL Access:Mutatie.Next()
            IF Mut:PlanningID <> Pla:PlanningID THEN BREAK.
            
            MutatieGevonden# = true
            
            CLEAR(Par:Record)
            Par:PartijID=Mut:PartijID
            Access:Partij.Fetch(Par:Partij_PK)

            CLEAR(Art:Record)
            Art:ArtikelID=Par:ArtikelID
            Access:ViewArtikel.Fetch(Art:Artikel_PK)
            
            CLEAR(Ver:Record)
            Ver:VerpakkingID=Par:VerpakkingID
            Access:Verpakking.Fetch(Ver:Verpakking_PK)
            
            IF CLIP(Mut:AlternatieveArtikelOms) = '' THEN
                LOC:ArtikelOms = GlobalClass.CMRArtikelOms(Ver2:Klant, Art:ArtikelID)
            ELSE
                LOC:ArtikelOms = Mut:AlternatieveArtikelOms
            END
            

            LOC:NettoKG = 0
            LOC:BrutoKG = 0
            
            WegingGevonden# = false
            
            CLEAR(Weg:Record)
            Weg:MutatieID = Mut:MutatieID
            SET(Weg:FK_Weging, Weg:FK_Weging)
            LOOP UNTIL Access:Weging.Next()
                IF Weg:MutatieID <> Mut:MutatieID THEN BREAK.
                
                WegingGevonden# = true
                
                LAQ:ArtikelID=Art:ArtikelID
                LAQ:VerpakkingOmschrijving=Ver:VerpakkingOmschrijving
                GET(Loc:ArtikelQ,+LAQ:ArtikelID,+LAQ:VerpakkingOmschrijving)
                IF ERROR()
                    LAQ:ArtikelID=Art:ArtikelID
                    LAQ:VerpakkingOmschrijving=Ver:VerpakkingOmschrijving
                    LAQ:ArtikelOms=LOC:ArtikelOms
                    LAQ:BrutoKG=Weg:BrutoGewicht
                    LAQ:NettoKG=Weg:NettoGewicht
                    LAQ:Pallets=1 ! Elke weging is 1 pallet
                    LAQ:Gewogen=1
                    LAQ:Partijnr=Mut:PartijID 
                    ADD(Loc:ArtikelQ)
                ELSE
                    IF NOT(LAQ:Gewogen) THEN
                        LAQ:Gewogen=1
                        LAQ:BrutoKG=Weg:BrutoGewicht
                        LAQ:NettoKG=Weg:NettoGewicht
                        LAQ:Pallets=1 ! Elke weging is 1 pallet
                    ELSE
                        LAQ:BrutoKG+=Weg:BrutoGewicht
                        LAQ:NettoKG+=Weg:NettoGewicht
                        LAQ:Pallets+=1 ! Elke weging is 1 pallet
                    END
                    PUT(Loc:ArtikelQ)
                END	
            END
            
            IF NOT(WegingGevonden#) THEN
               ! Geen weging, dan mutatie-kg overnemen indien het artikel/verpakking nog geen weging heeft.
               LAQ:ArtikelID=Art:ArtikelID
               LAQ:VerpakkingOmschrijving=Ver:VerpakkingOmschrijving
               GET(Loc:ArtikelQ,+LAQ:ArtikelID,+LAQ:VerpakkingOmschrijving)
               IF ERROR()
                  LAQ:ArtikelID=Art:ArtikelID
                  LAQ:VerpakkingOmschrijving=Ver:VerpakkingOmschrijving
                  LAQ:ArtikelOms=LOC:ArtikelOms
                  LAQ:BrutoKG=Mut:UitslagKG
                  LAQ:NettoKG=Mut:UitslagKG
                  LAQ:Pallets=Mut:UitslagPallet
                  LAQ:Gewogen=0
                  LAQ:Partijnr=Mut:PartijID 
                  ADD(Loc:ArtikelQ)
               ELSE
                 ! IF NOT(LAQ:Gewogen)
                     LAQ:BrutoKG+=Mut:UitslagKG
                     LAQ:NettoKG+=Mut:UitslagKG
                     LAQ:Pallets+=Mut:UitslagPallet
                     PUT(Loc:ArtikelQ)
                 ! END
               END
            END
        END
        
        IF NOT(MutatieGevonden#) ! Planning niet meer meenemen (Dimitri 18-2-2011)
            LOC:Waarschuwing = 'Let op: planning-regel met partijnr. ' &  Pla:PartijID & ' en ' & Pla:KG & ' KG heeft geen mutatie/weging.'
            ! Bijbehorende mutatie bestaat niet, gebruik planningsgegevens
            Par:PartijID=Pla:PartijID
            Access:Partij.Fetch(Par:Partij_PK)

            Art:ArtikelID=Pla:ArtikelID
            Access:ViewArtikel.Fetch(Art:Artikel_PK)

            IF CLIP(Pla:AlternatieveArtikelOms) = '' THEN
                LOC:ArtikelOms = GlobalClass.CMRArtikelOms(Ver2:Klant, Pla:ArtikelID)
            ELSE
                LOC:ArtikelOms = Pla:AlternatieveArtikelOms
            END
            
            Ver:VerpakkingID=Pla:VerpakkingID
            Access:Verpakking.Fetch(Ver:Verpakking_PK)

            Rel:RelatieID=Pla:Leverancier
            Access:Relatie.Fetch(Rel:Relatie_PK)
            
            LAQ:ArtikelID=Pla:ArtikelID
            LAQ:VerpakkingOmschrijving=Ver:VerpakkingOmschrijving
            GET(Loc:ArtikelQ,+LAQ:ArtikelID,+LAQ:VerpakkingOmschrijving)
            IF ERROR()
                LAQ:ArtikelID=Art:ArtikelID
                LAQ:VerpakkingOmschrijving=Ver:VerpakkingOmschrijving
                LAQ:ArtikelOms=LOC:ArtikelOms
                LAQ:BrutoKG=Pla:KG
                LAQ:NettoKG=Pla:KG
                LAQ:Pallets=Pla:Pallets
                LAQ:Gewogen=0
                LAQ:Partijnr=Pla:PartijID  !Mut:PartijID - MS(20180508): WR12540: verkeerd lotnummer wordt geprint
                Add(Loc:ArtikelQ)
            ELSE
                IF NOT(LAQ:Gewogen)
                    LAQ:BrutoKG+=Pla:KG
                    LAQ:NettoKG+=Pla:KG
                    LAQ:Pallets+=Pla:Pallets
                    Put(Loc:ArtikelQ)
                END
            END	
        END
    END
	
	EXIT
VulArtikelQueue_BAK     ROUTINE
	LOC:Waarschuwing = ''
	
	FREE(Loc:ArtikelQ)
	! dit geldt voor alle regels van deze verkoop
	! eerst even aantal regels tellen er zijn 15 regels beschikbaar
	LOC:AantalRegels=0
    WegingGevonden# = false
    
    Clear(Pla:Record)
	Pla:VerkoopID = Ver2:VerkoopID
	Set(Pla:Planning_FK02,Pla:Planning_FK02)
	Loop Until Access:Planning.Next()
		if Not Pla:VerkoopID = Ver2:VerkoopID then break.
		LOC:AantalRegels+=1

		MutatieGevonden# = false
		CLEAR(Mut:Record)
		Mut:PlanningID=Pla:PlanningID
		SET(Mut:Mutatie_FK02,Mut:Mutatie_FK02)
		LOOP UNTIL Access:Mutatie.Next()
            IF NOT Mut:PlanningID=Pla:PlanningID THEN BREAK.

            CLEAR(Weg:Record)
            Weg:MutatieID = Mut:MutatieID
            SET(Weg:FK_Weging,Weg:FK_Weging)
            IF Access:Weging.Next() = Level:Benign THEN
                IF Weg:MutatieID = Mut:MutatieID THEN
                    ! Mutaties heeft een weging
                    WegingGevonden# = true
                END
            END
            
			IF (NOT(MutatieGevonden#))
				MutatieGevonden# = true
			ELSE
				LOC:AantalRegels+=1
            END
		END
    END
    
    IF WegingGevonden#
        ! Alleen de gewogen KG komen op de CMR
        Clear(Pla:Record)
        Pla:VerkoopID = Ver2:VerkoopID
        Set(Pla:Planning_FK02,Pla:Planning_FK02)
        Loop Until Access:Planning.Next()
            if Pla:VerkoopID <> Ver2:VerkoopID then break.
            
            CLEAR(Mut:Record)
            Mut:PlanningID=Pla:PlanningID
            SET(Mut:Mutatie_FK02,Mut:Mutatie_FK02)
            LOOP UNTIL Access:Mutatie.Next()
                IF Mut:PlanningID <> Pla:PlanningID THEN BREAK.
                
                CLEAR(Par:Record)
                Par:PartijID=Mut:PartijID
                Access:Partij.Fetch(Par:Partij_PK)

                CLEAR(Art:Record)
                Art:ArtikelID=Par:ArtikelID
                Access:ViewArtikel.Fetch(Art:Artikel_PK)
                
                CLEAR(Ver:Record)
                Ver:VerpakkingID=Par:VerpakkingID
                Access:Verpakking.Fetch(Ver:Verpakking_PK)
                
                LOC:ArtikelOms = CLIP(Art:ArtikelOms)
                LOC:NettoKG = 0
                LOC:BrutoKG = 0
                
                CLEAR(Weg:Record)
                Weg:MutatieID = Mut:MutatieID
                SET(Weg:FK_Weging, Weg:FK_Weging)
                LOOP UNTIL Access:Weging.Next()
                    IF Weg:MutatieID <> Mut:MutatieID THEN BREAK.
                    db.DebugOut('ReportCMR - WegingGevonden' & Mut:PlanningID)
                    
                    LAQ:ArtikelID=Art:ArtikelID
                    LAQ:VerpakkingOmschrijving=Ver:VerpakkingOmschrijving
                    GET(Loc:ArtikelQ,+LAQ:ArtikelID,+LAQ:VerpakkingOmschrijving)
                    IF ERROR()
                       LAQ:ArtikelID=Art:ArtikelID
                       LAQ:VerpakkingOmschrijving=Ver:VerpakkingOmschrijving
                       LAQ:ArtikelOms=LOC:ArtikelOms
                       LAQ:BrutoKG=Weg:BrutoGewicht
                       LAQ:NettoKG=Weg:NettoGewicht
                       LAQ:Pallets=1 ! Elke weging is 1 pallet
                       Add(Loc:ArtikelQ)
                    ELSE
                       LAQ:BrutoKG+=Weg:BrutoGewicht
                       LAQ:NettoKG+=Weg:NettoGewicht
                       LAQ:Pallets+=1 ! Elke weging is 1 pallet
                       Put(Loc:ArtikelQ)
                    END	
                END
            END
        END
    ELSE
        ! Op de oude manier, waarbij alle planning/mutatie KG's op de CMR komen
        Clear(Pla:Record)
        Pla:VerkoopID = Ver2:VerkoopID
        Set(Pla:Planning_FK02,Pla:Planning_FK02)
        Loop Until Access:Planning.Next()
            if Not Pla:VerkoopID = Ver2:VerkoopID then break.
            
            found# = false
            
            CLEAR(Mut:Record)
            Mut:PlanningID=Pla:PlanningID
            SET(Mut:Mutatie_FK02,Mut:Mutatie_FK02)
            LOOP UNTIL Access:Mutatie.Next()
                IF NOT Mut:PlanningID=Pla:PlanningID THEN BREAK.
                
                found# = true
                
                ! Bijbehorende mutatie bestaat
                Par:PartijID=Mut:PartijID
                Access:Partij.Fetch(Par:Partij_PK)

                Art:ArtikelID=Par:ArtikelID
                Access:ViewArtikel.Fetch(Art:Artikel_PK)
                
                LOC:ArtikelOms = CLIP(Art:ArtikelOms)
                LOC:NettoKG = 0
                LOC:BrutoKG = 0
                
                CLEAR(Weg:WegingID)
                Weg:MutatieID = Mut:MutatieID
                SET(Weg:FK_Weging, Weg:FK_Weging)
                LOOP UNTIL Access:Weging.Next()
                    IF NOT Weg:MutatieID = Mut:MutatieID THEN BREAK.
                    
                    LOC:NettoKG = LOC:NettoKG + Weg:NettoGewicht
                    LOC:BrutoKG = LOC:BrutoKG + Weg:BrutoGewicht
                .

                IF LOC:NettoKG = 0
                    LOC:NettoKG = Mut:UitslagKG
                END
                    
                IF LOC:BrutoKG = 0
                    LOC:BrutoKG = Mut:UitslagKG
                END
                
                IF (CLIP(AREL:ItemCode)<> '')
                    CLEAR(Art2:Record)
                    Art2:ex_artcode=AREL:ItemCode
                    Art2:artcode=Art:ArtikelID
                    IF (Access:ArtikelOmschrijvingExtra.TryFetch(Art2:PK_ArtikelOmschrijvingExtra) = Level:Benign)
                        LOC:ArtikelOms = CLIP(Art2:tekst)
                    END
                .

                Ver:VerpakkingID=Par:VerpakkingID
                Access:Verpakking.Fetch(Ver:Verpakking_PK)

                Rel:RelatieID=Par:Leverancier
                Access:Relatie.Fetch(Rel:Relatie_PK)
                
                LAQ:ArtikelID=Art:ArtikelID
                LAQ:VerpakkingOmschrijving=Ver:VerpakkingOmschrijving
                GET(Loc:ArtikelQ,+LAQ:ArtikelID,+LAQ:VerpakkingOmschrijving)
                IF ERROR()
                   LAQ:ArtikelID=Art:ArtikelID
                   LAQ:VerpakkingOmschrijving=Ver:VerpakkingOmschrijving
                   LAQ:ArtikelOms=LOC:ArtikelOms
                   LAQ:BrutoKG=LOC:BrutoKG
                   LAQ:NettoKG=LOC:NettoKG
                   LAQ:Pallets=Mut:UitslagPallet
                    Add(Loc:ArtikelQ)
                ELSE
                   LAQ:BrutoKG+=LOC:BrutoKG
                   LAQ:NettoKG+=LOC:NettoKG
                   LAQ:Pallets+=Mut:UitslagPallet
                    Put(Loc:ArtikelQ)
                END	
            END
            
            IF NOT(found#) ! Planning niet meer meenemen (Dimitri 18-2-2011)
                LOC:Waarschuwing = 'Let op: planning-regel met partijnr. ' &  Pla:PartijID & ' en ' & Pla:KG & ' KG heeft geen mutatie/weging.'
                ! Bijbehorende mutatie bestaat niet, gebruik planningsgegevens
                Par:PartijID=Pla:PartijID
                Access:Partij.Fetch(Par:Partij_PK)

                Art:ArtikelID=Pla:ArtikelID
                Access:ViewArtikel.Fetch(Art:Artikel_PK)

                LOC:ArtikelOms = CLIP(Art:ArtikelOms)
                
                IF (CLIP(AREL:ItemCode)<> '')
                    CLEAR(Art2:Record)
                    Art2:ex_artcode=AREL:ItemCode
                    Art2:artcode=Art:ArtikelID
                    IF (Access:ArtikelOmschrijvingExtra.TryFetch(Art2:PK_ArtikelOmschrijvingExtra) = Level:Benign)
                        LOC:ArtikelOms = CLIP(Art2:tekst)
                    END
                END
                
                Ver:VerpakkingID=Pla:VerpakkingID
                Access:Verpakking.Fetch(Ver:Verpakking_PK)

                Rel:RelatieID=Pla:Leverancier
                Access:Relatie.Fetch(Rel:Relatie_PK)
                
                LAQ:ArtikelID=Pla:ArtikelID
                LAQ:VerpakkingOmschrijving=Ver:VerpakkingOmschrijving
                GET(Loc:ArtikelQ,+LAQ:ArtikelID,+LAQ:VerpakkingOmschrijving)
                IF ERROR()
                    LAQ:ArtikelID=Art:ArtikelID
                    LAQ:VerpakkingOmschrijving=Ver:VerpakkingOmschrijving
                    LAQ:ArtikelOms=LOC:ArtikelOms
                    LAQ:BrutoKG=Pla:KG
                    LAQ:NettoKG=Pla:KG
                    LAQ:Pallets=Pla:Pallets
                    Add(Loc:ArtikelQ)
                ELSE
                    LAQ:BrutoKG+=Pla:KG
                    LAQ:NettoKG+=Pla:KG
                    LAQ:Pallets+=Pla:Pallets
                    Put(Loc:ArtikelQ)
                END	
            END
        END
	END
	
	EXIT
SavePalletAdministratie     ROUTINE
    
    LocalClass.SchrijfPalletMutatie(LOC:VerkoopID, LOC:PlanningID,1, LOC:PalletSoort1_IN, LOC:PalletSoort1_OUT)
    LocalClass.SchrijfPalletMutatie(LOC:VerkoopID, LOC:PlanningID,5, LOC:PalletSoort2_IN, LOC:PalletSoort2_OUT)
    LocalClass.SchrijfPalletMutatie(LOC:VerkoopID, LOC:PlanningID,3, LOC:PalletSoort3_IN, LOC:PalletSoort3_OUT)
    LocalClass.SchrijfPalletMutatie(LOC:VerkoopID, LOC:PlanningID,6, LOC:PalletSoort4_IN, LOC:PalletSoort4_OUT)
!	! Bijwerken Pallet administratie
!    palletsoort# = 1
!
!    LOOP UNTIL palletsoort# > 4
!        found# = 0
!        CLEAR(Pal:Record)
!        Pal:VerkoopID=LOC:VerkoopID
!        CLEAR(Pal:PalletMutatieID,-1)
!        SET(Pal:PalletMutatie_FK4, Pal:PalletMutatie_FK4)
!        LOOP UNTIL Access:PalletMutatie.Next()
!            IF Pal:VerkoopID<>LOC:VerkoopID THEN BREAK.
!			
!            IF Pal:PalletSoortID=palletsoort# THEN
!                Access:PalletMutatie.DeleteRecord(0)
!                CYCLE
!				!found# = 1
!				
!				!CASE palletsoort#
!				!OF 1
!			    !  Pal:Uitgaand = LOC:PalletSoort1_OUT
!				!	Pal:Inkomend = LOC:PalletSoort1_IN
!				!	Access:PalletMutatie.TryUpdate()
!				!	BREAK
!			    !OF 2
!			    !  Pal:Uitgaand = LOC:PalletSoort2_OUT
!				!	Pal:Inkomend = LOC:PalletSoort2_IN
!				!	Access:PalletMutatie.TryUpdate()
!				!	BREAK
!			    !OF 3
!			    !  Pal:Uitgaand = LOC:PalletSoort3_OUT
!				!	Pal:Inkomend = LOC:PalletSoort3_IN
!				!	Access:PalletMutatie.TryUpdate()
!				!	BREAK
!			    !OF 4
!			    !  Pal:Uitgaand = LOC:PalletSoort4_OUT
!				!	Pal:Inkomend = LOC:PalletSoort4_IN
!				!	Access:PalletMutatie.TryUpdate()
!				!	BREAK
!				!.
!            .
!        .
!		
!        if NOT(found#)
!            CLEAR(Pal:Record)
!            Pal:PalletSoortID = palletsoort#
!            Pal:VerkoopID = LOC:VerkoopID
!			
!            Pla:PlanningID=LOC:PlanningID
!            Access:Planning.TryFetch(Pla:PK_Planning)
!            Ver2:VerkoopID=Pla:VerkoopID
!            Access:Verkoop.TryFetch(Ver2:PK_Verkoop)
!			
!            Pal:RelatieID = Ver2:Klant
!            Pal:DatumTijd = Ver2:Planning			
!			
!            CASE palletsoort#
!            OF 1
!                Pal:Uitgaand = LOC:PalletSoort1_OUT
!                Pal:Inkomend = LOC:PalletSoort1_IN
!            OF 5
!                Pal:Uitgaand = LOC:PalletSoort2_OUT
!                Pal:Inkomend = LOC:PalletSoort2_IN
!            OF 3
!                Pal:Uitgaand = LOC:PalletSoort3_OUT
!                Pal:Inkomend = LOC:PalletSoort3_IN
!            OF 6
!                Pal:Uitgaand = LOC:PalletSoort4_OUT
!                Pal:Inkomend = LOC:PalletSoort4_IN
!            .
!            Access:PalletMutatie.Insert()
!            if(LOC:TransporteurID > 0)
!				!CLEAR(Tra:Record)
!				!Tra:TransporteurID=LOC:TransporteurID
!				!message(Tra:TransporteurID)
!				!Access:Transporteur.TryFetch(Tra:PK_Transporteur)
!				!message(Tra:RelatieID)
!                db.DebugOut('PalletMutatie wegschrijven voor Transporteur ' & LOC:TransporteurID)
!                Pal:RelatieID = LOC:TransporteurID
!                Pal:Transporteur = 1
!                Access:PalletMutatie.Insert()
!            .
!        .
!        palletsoort# += 1
!    .
!	
    NOTIFY(2, GLO:PalletAdministratie_ThreadID)	
    EXIT
LoadPalletAdministratie     ROUTINE
	db.DebugOut('LoadPalletAdministratie1:'&LOC:TransporteurID)
	
	! Bijwerken Pallet administratie
	CLEAR(Pal:Record)
	Pal:VerkoopID=LOC:VerkoopID
	CLEAR(Pal:PalletMutatieID,-1)
	SET(Pal:PalletMutatie_FK4, Pal:PalletMutatie_FK4)
	LOOP UNTIL Access:PalletMutatie.Next()
        IF Pal:VerkoopID<>LOC:VerkoopID THEN BREAK.
        ! ALLEEN DE KLANT PALLETMUTATIES
        if Pal:Transporteur=true then cycle.
        
	   CASE Pal:PalletSoortID
	   OF 1
		 LOC:PalletSoort1_OUT = Pal:Uitgaand
		 LOC:PalletSoort1_IN = Pal:Inkomend
	   OF 5
		 LOC:PalletSoort2_OUT = Pal:Uitgaand
		 LOC:PalletSoort2_IN = Pal:Inkomend
	   OF 3
		 LOC:PalletSoort3_OUT = Pal:Uitgaand
		 LOC:PalletSoort3_IN = Pal:Inkomend
	   OF 6
		 LOC:PalletSoort4_OUT = Pal:Uitgaand
		 LOC:PalletSoort4_IN = Pal:Inkomend
		.
		
		IF Pal:Transporteur = 1 THEN
			LOC:TransporteurID = Pal:RelatieID
		.
	.
	
	db.DebugOut('LoadPalletAdministratie2:'&LOC:TransporteurID)

	EXIT

ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
        udpt.Init(UD,'ReportCMR','VoorrRpt010.clw','VoorrRpt.DLL','06/02/2020 @ 02:25PM')    
             
  GlobalErrors.SetProcedureName('ReportCMR')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  	Loc:IsTruckClear = TRUE
  	Loc:IsPackingGoodsOK = TRUE
  	Loc:ISDriverDressedCorrectly = TRUE
  	Loc:EC_LabelsOnTheGoods = TRUE
  	Loc:Printer='Kies Printer'
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:APlanning.Open                                    ! File APlanning used by this procedure, so make sure it's RelationManager is open
  Relate:AViewArtikel.Open                                 ! File AViewArtikel used by this procedure, so make sure it's RelationManager is open
  Relate:ArtikelOmschrijvingExtra.Open                     ! File ArtikelOmschrijvingExtra used by this procedure, so make sure it's RelationManager is open
  Relate:ArtikelOmschrijvingExtraGroep.Open                ! File ArtikelOmschrijvingExtraGroep used by this procedure, so make sure it's RelationManager is open
  Relate:CMR.Open                                          ! File CMR used by this procedure, so make sure it's RelationManager is open
  Relate:Mutatie.Open                                      ! File Mutatie used by this procedure, so make sure it's RelationManager is open
  Relate:PalletMutatie.SetOpenRelated()
  Relate:PalletMutatie.Open                                ! File PalletMutatie used by this procedure, so make sure it's RelationManager is open
  Relate:PalletVerloop.Open                                ! File PalletVerloop used by this procedure, so make sure it's RelationManager is open
  Relate:Partij.Open                                       ! File Partij used by this procedure, so make sure it's RelationManager is open
  Relate:RelatieAdres.Open                                 ! File RelatieAdres used by this procedure, so make sure it's RelationManager is open
  Relate:RelatieArtikelOmschrijving.Open                   ! File RelatieArtikelOmschrijving used by this procedure, so make sure it's RelationManager is open
  Relate:Transporteur.Open                                 ! File Transporteur used by this procedure, so make sure it's RelationManager is open
  Relate:Verpakking.Open                                   ! File Verpakking used by this procedure, so make sure it's RelationManager is open
  Relate:ViewArtikel.Open                                  ! File ViewArtikel used by this procedure, so make sure it's RelationManager is open
  Relate:ViewTransporteur.Open                             ! File ViewTransporteur used by this procedure, so make sure it's RelationManager is open
  Relate:Weging.Open                                       ! File Weging used by this procedure, so make sure it's RelationManager is open
  Access:Relatie.UseFile                                   ! File referenced in 'Other Files' so need to inform it's FileManager
  SELF.FilesOpened = True
  	CLEAR(VTRA:Record)	
  	LOC:TransporteurID = 0
  	LOC:PlanningID = PRM:PlanningID
  
  	Clear(Pla:Record)
  	Pla:PlanningID = LOC:PlanningID
  	IF Access:Planning.Fetch(Pla:PK_Planning) <> Level:Benign
  		RETURN ReturnValue
  	.
  
  	LOC:VerkoopID=Pla:VerkoopID
  	Ver2:VerkoopID=Pla:VerkoopID
  	Access:Verkoop.Fetch(Ver2:PK_Verkoop)
  
      ! O.a. nodig voor bepalen van alternative artikelnaam
  	AREL:RelatieID=Ver2:Klant
  	Access:ARelatie.Fetch(AREL:Relatie_PK)
  
  	db.DebugOut('PrintCMR(' & LOC:PlanningID & '=' & Pla:PlanningID & ',' & Pla:VerkoopID & '=' & Ver2:VerkoopID & ',' & Ver2:Klant & '=' & AREL:RelatieID & ')')
  
  	CLEAR(CMR:Record)
  	CMR:VerkoopID = LOC:VerkoopID
  	SET(CMR:CMR_FK1,CMR:CMR_FK1)
  	found# = false
  	IF (Access:CMR.TryNext() = Level:Benign)
  		db.DebugOut('Ophalen CMR ' & CMR:VerkoopID & ' gelukt')
  		IF (CMR:VerkoopID = LOC:VerkoopID)
  			found# = TRUE
  			db.DebugOut('Ophalen CMR ' & CMR:VerkoopID & ' gelukt klopt')
  		END
  	ELSE
  		db.DebugOut('Ophalen CMR ' & LOC:VerkoopID & ' failed')
  	END
  
  	IF(NOT(found#))
  		Loc:Expediteur='Ven Poultry B.V.<13><10>Postbus 467 <13><10>5700 AL Helmond Holland<13><10>BTWnr: NL802389521B01'
  
  		LOC:Country = ARel:Country
  		IF LOC:Country = '' THEN
  			LOC:Country = 'Holland'
  		.
  
  		db.DebugOut('RelatieID:' & AREL:RelatieID)
  		
  		RAD:ID=Ver2:KlantAlternatiefAdres
  		Access:RelatieAdres.Fetch(RAD:PK_RelatieAdres)
  		IF ERROR() OR RAD:RelatieID <> Ver2:Klant THEN
  			Loc:Geadresseerde=CLIP(AREL:FirmaNaam)&'<13><10>'&CLIP(AREL:Adres1)&'<13><10>'&CLIP(AREL:Postcode)&' '&CLIP(AREL:Plaats) & ', ' & CLIP(LOC:Country)
  			Loc:AfleveringAdres=CLIP(AREL:FirmaNaam)&'<13><10>'&CLIP(AREL:Adres1)&'<13><10>'&CLIP(AREL:Postcode)&' '&CLIP(AREL:Plaats) & ', ' & CLIP(LOC:Country)
  			Loc:AfleveringsPlaats=CLIP(AREL:Plaats) & ', ' & CLIP(LOC:Country)
  			db.DebugOut('Geen alternatief adres:' & AREL:RelatieID)
  		ELSE
  			Loc:Geadresseerde=CLIP(AREL:FirmaNaam)&'<13><10>'&CLIP(AREL:Adres1)&'<13><10>'&CLIP(AREL:Postcode)&' '&CLIP(AREL:Plaats) & ', ' & CLIP(LOC:Country)
  			Loc:AfleveringAdres=CLIP(RAD:Adres1)&'<13><10>'&CLIP(RAD:Adres2)
  			IF RAD:Postcode<>'' THEN
  				Loc:AfleveringAdres=CLIP(Loc:AfleveringAdres)&'<13><10>'&CLIP(RAD:Postcode)&' '&CLIP(RAD:Plaats)
  			ELSE
  				Loc:AfleveringAdres=CLIP(Loc:AfleveringAdres)&'<13><10>'&CLIP(RAD:Plaats)
  			.
  			IF RAD:LAND<>'' THEN
  				Loc:AfleveringAdres=CLIP(Loc:AfleveringAdres)&', '&CLIP(RAD:LAND)
  				Loc:AfleveringsPlaats=CLIP(RAD:Plaats)&', '&CLIP(RAD:LAND)
  			ELSE
  				Loc:AfleveringsPlaats=CLIP(RAD:Plaats)
  			.
  
  			db.DebugOut('Alternatief adres:' & RAD:ID)
  		.
  
  		Loc:AfkomstAdres='Lierop, Holland     ' & CLIP(FORMAT(TODAY(),'@d17'))
  		LOC:ExtraDocumenten=''
  		LOC:Transporteur='Transport:<13><10>Truck:<13><10>Container:'
  		LOC:TransporteurExtra=''
  		LOC:OpmerkingenVervoerder='Geboekt<13><10>Aankomst<13><10>Vertrek'
  
  		DO VulArtikelQueue
          DO VulLocArtikel
          Loc:Artikel = LOC:ArtikelBepaald
  		
  		!IF CLIP(Par:InslagQATemperatuur1) <> ''
  		!	LOC:Instructie = 'Temperatuur: ' & CLIP(LEFT(FORMAT(Par:InslagQATemperatuur1, '@n-5.0'))) & '° Celsius'
  		!ELSE	
  			LOC:Instructie = 'Temperatuur: -18° Celsius'
  		!END
  		
  		LOC:SpecialeOvereenkomst = 'Officiële dierenarts<13><10>AEM vd Pluijm NL0859'
  		LOC:Frankeringsvoorschrift = 'Franco '& CLIP(LOC:AfleveringsPlaats)
  		LOC:OpgemaaktTe = 'Lierop, Holland     ' & CLIP(FORMAT(TODAY(),'@d17'))
  		LOC:HandtekeningStempelAfzender = 'Ven Poultry B.V.<13><10>P.O. Box 467<13><10>NL-5700 AL Helmond<13><10>Tel:+31 (0)492-537066<13><10>www.venpoultry.nl'
  		LOC:Kenteken = 'Transport:<13><10>Truck:<13><10>Container:'
  	ELSE
  		Loc:Expediteur=CMR:Expediteur
  		Loc:Geadresseerde=CMR:Geadresseerde
  		LOC:Transporteur=CMR:Transporteur
  		Loc:AfleveringAdres=CMR:AfleverAdres
  		LOC:TransporteurExtra=CMR:TransporteurExtra
  		Loc:AfkomstAdres=CMR:AfkomstAdres
  		LOC:OpmerkingenVervoerder=CMR:OpmerkingenVervoerder
  		LOC:ExtraDocumenten=CMR:ExtraDocumenten
          Loc:Artikel=CMR:Artikel
          
  		DO VulArtikelQueue
          DO VulLocArtikel
          IF CLIP(Loc:Artikel) <> CLIP(LOC:ArtikelBepaald) THEN
              LOC:Waarschuwing = 'Let op: Huidige CMR-artikeltekst is niet dezelfde als deze opnieuw gevuld wordt.'
           END
  		LOC:Instructie=CMR:Instructie
  		LOC:SpecialeOvereenkomst=CMR:SpecialeOvereenkomst
  		LOC:Frankeringsvoorschrift=CMR:Frankeringsvoorschrift
  		Loc:IsTruckClear=CMR:IsTruckClean
  		Loc:IsPackingGoodsOK=CMR:IsPackingGoodsOK
  		Loc:ISDriverDressedCorrectly=CMR:ISDriverDressedCorrectly
  		Loc:EC_LabelsOnTheGoods=CMR:EC_LabelsOnTheGoods
  		LOC:OpgemaaktTe=CMR:OpgemaaktTe
  		LOC:HandtekeningStempelAfzender=CMR:HandtekeningStempelAfzender
  		LOC:Kenteken=CMR:Kenteken
  	.
  
  	! PalletSoort
  	LOC:PalletSoort1 = 'H1'
  	LOC:PalletSoort5 = 'BLOK'
  	LOC:PalletSoort3 = 'Euro'
  	LOC:PalletSoort6 = 'CHEP'
  		
  	DO LoadPalletAdministratie
  SELF.Open(ProgressWindow)                                ! Open window
  WinAlertMouseZoom()
  Do DefineListboxStyle
  ProgressWindow{Prop:Alrt,255} = CtrlShiftP
  Resizer.Init(AppStrategy:Surface)                        ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  ProgressMgr.Init(ScrollSort:AllowNumeric,)
  ThisReport.Init(Process:View, Relate:Planning, ?Progress:PctText, Progress:Thermometer, ProgressMgr, Pla:PlanningID)
  ThisReport.AddSortOrder(Pla:PK_Planning)
  ThisReport.AddRange(Pla:PlanningID,LOC:PlanningID)
  SELF.AddItem(?Progress:Cancel,RequestCancelled)
  SELF.Init(ThisReport,Report)
  ?Progress:UserString{PROP:Text} = ''
  Relate:Planning.SetQuickScan(1,Propagate:OneMany)
  ProgressWindow{PROP:Timer} = 10                          ! Assign timer interval
  FDCB2.Init(VTRA:FirmaNaam,?VTRA:FirmaNaam,Queue:FileDropCombo.ViewPosition,FDCB2::View:FileDropCombo,Queue:FileDropCombo,Relate:ViewTransporteur,ThisWindow,GlobalErrors,0,1,0)
  FDCB2.Q &= Queue:FileDropCombo
  FDCB2.AddSortOrder(VTRA:ViewTransporteur_FK1)
  FDCB2.AddField(VTRA:FirmaNaam,FDCB2.Q.VTRA:FirmaNaam) !List box control field - type derived from field
  FDCB2.AddField(VTRA:Plaats,FDCB2.Q.VTRA:Plaats) !List box control field - type derived from field
  FDCB2.AddUpdateField(VTRA:RelatieID,LOC:TransporteurID)
  ThisWindow.AddItem(FDCB2.WindowComponent)
  FDCB2.DefaultFill = 0
  ASSERT(~SELF.DeferWindow) ! A hidden Go button is not smart ...
  SELF.KeepVisible = 1
  SELF.DeferOpenReport = 1
  SELF.Timer = TARGET{PROP:Timer}
  TARGET{PROP:Timer} = 0
  ?Pause{PROP:Text} = 'Start'
  SELF.Paused = 1
  ?Progress:Cancel{PROP:Key} = EscKey
  SELF.SetAlerts()
  EnterByTabManager.Init(False)
  RETURN ReturnValue


ThisWindow.Init PROCEDURE(ProcessClass PC,<REPORT R>,<PrintPreviewClass PV>)

  CODE
  PARENT.Init(PC,R,PV)
  WinAlertMouseZoom()


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:APlanning.Close
    Relate:AViewArtikel.Close
    Relate:ArtikelOmschrijvingExtra.Close
    Relate:ArtikelOmschrijvingExtraGroep.Close
    Relate:CMR.Close
    Relate:Mutatie.Close
    Relate:PalletMutatie.Close
    Relate:PalletVerloop.Close
    Relate:Partij.Close
    Relate:RelatieAdres.Close
    Relate:RelatieArtikelOmschrijving.Close
    Relate:Transporteur.Close
    Relate:Verpakking.Close
    Relate:ViewArtikel.Close
    Relate:ViewTransporteur.Close
    Relate:Weging.Close
  END
  ProgressMgr.Kill()
  GlobalErrors.SetProcedureName
            
   
  IF BAND(Keystate(),KeyStateUD:Shift) 
        UD.ShowProcedureInfo('ReportCMR',UD.SetApplicationName('VoorrRpt','DLL'),ProgressWindow{PROP:Hlp},'06/10/2011 @ 11:53AM','06/02/2020 @ 02:25PM','06/03/2020 @ 11:38AM')  
    
  END
  RETURN ReturnValue


ThisWindow.OpenReport PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
      SAV:Printer=PRINTER{PROPPRINT:Device}
  	Case Loc:Printer
  	of 'Receptie'
  		Loc:CMRPrinter=GETINI('Printer','CMR',,'.\Voorraad.ini')
  	of 'Vrieshuis'
          Loc:CMRPrinter=GETINI('Printer','CMR-Vrieshuis',,'.\Voorraad.ini')
          !SAV:PaperBin = PRINTER{PROPPRINT:PaperBin} ! Niet meer via deze prop regelen (vaak problemen), maar door deze printer in te stellen op de server met standaard deze paperbin
  		!PRINTER{PROPPRINT:PaperBin}=GETINI('Printer','CMR-Vrieshuis Lade',,'.\Voorraad.ini')
          !PRINTER{PROPPRINT:Copies}=GETINI('Printer','CMR-Vrieshuis Kopie',1,'.\Voorraad.ini') ! werkt niet meer goed in de C8-versie?
  	END
  	IF Loc:CMRPrinter<>''
  		PRINTER{PROPPRINT:Device}=Loc:CMRPrinter
  	End
  ReturnValue = PARENT.OpenReport()
      If CLIP(LOC:Printer) = 'Vrieshuis' THEN
          REPORT{PROPPRINT:Copies} = GETINI('Printer','CMR-Vrieshuis Kopie',1,'.\Voorraad.ini')    
      END
      If CLIP(LOC:Printer) = 'Receptie' THEN
          REPORT{PROPPRINT:Copies} = GETINI('Printer','CMR Kopie',1,'.\Voorraad.ini')    
      END
  
      If Not RETURNValue				! Instructie memo vullen
  		if Loc:IsTruckClear
  			LOC:Instructie = Clip(LOC:Instructie)&'<13><10> Is Truck Clean: Yes'
  		ELSE
  			LOC:Instructie = Clip(LOC:Instructie)&'<13><10> Is Truck Clean: No'
  		END
  		if Loc:IsPackingGoodsOK
  			LOC:Instructie = Clip(LOC:Instructie)&'<13><10> Is Packing goods OK: Yes'
  		ELSE
  			LOC:Instructie = Clip(LOC:Instructie)&'<13><10> Is Packing goods OK: No'
  		END
  		if Loc:ISDriverDressedCorrectly
  			LOC:Instructie = Clip(LOC:Instructie)&'<13><10> Is Driver Dressed Correctly: Yes'
  		ELSE
  			LOC:Instructie = Clip(LOC:Instructie)&'<13><10> Is Driver Dressed Correctly: No'
  		END
  		if Loc:EC_LabelsOnTheGoods
  			LOC:Instructie = Clip(LOC:Instructie)&'<13><10> EC Labels on the goods: Yes'
  		ELSE
  			LOC:Instructie = Clip(LOC:Instructie)&'<13><10> EC Labels on the goods: No'
  		END
  
  		if LOC:AantalRegels > 7
  			LOC:ArtikelWide = Loc:Artikel
  			LOC:Artikel = ''
  		END
  		IF Loc:Printer= 'Vrieshuis'
  			Loc:CMRnr=GETINI('Printer','CMRnr',0,'.\Voorraad.ini')
  			PUTINI('Printer','CMRnr',Loc:CMRnr+1,'.\Voorraad.ini')
  			! in de layout van de laserprinter moet alles 5 MM naar rechts = 0,200 Inch
  			Report$?Loc:Expediteur{PROP:Xpos}=Report$?Loc:Expediteur{PROP:Xpos}+200
  			Report$?Loc:Geadresseerde{Prop:Xpos}=Report$?Loc:Geadresseerde{Prop:Xpos}+200
  			Report$?LOC:Transporteur{Prop:Xpos}=Report$?LOC:Transporteur{Prop:Xpos}+200
  			Report$?LOC:TransporteurExtra{Prop:Xpos}=Report$?LOC:TransporteurExtra{Prop:Xpos}+200
  			Report$?Loc:AfleveringAdres{PROP:Xpos}=Report$?Loc:AfleveringAdres{PROP:Xpos}+200
  			Report$?Loc:AfkomstAdres{PROP:Xpos}=Report$?Loc:AfkomstAdres{PROP:Xpos}+200
  			Report$?LOC:ExtraDocumenten{PROP:Xpos}=Report$?LOC:ExtraDocumenten{PROP:Xpos}+200
  			Report$?LOC:OpmerkingenVervoerder{PROP:Xpos}=Report$?LOC:OpmerkingenVervoerder{PROP:Xpos}+200
  			Report$?Loc:Artikel:2{PROP:Xpos}=Report$?Loc:Artikel:2{PROP:Xpos}+200
  			Report$?LOC:Instructie{PROP:Xpos}=Report$?LOC:Instructie{PROP:Xpos}+200
  			Report$?LOC:SpecialeOvereenkomst{PROP:Xpos}=Report$?LOC:SpecialeOvereenkomst{PROP:Xpos}+200
  			Report$?LOC:Frankeringsvoorschrift{PROP:Xpos}=Report$?LOC:Frankeringsvoorschrift{PROP:Xpos}+200
  			Report$?LOC:Frankeringsvoorschrift{PROP:Ypos}=Report$?LOC:Frankeringsvoorschrift{PROP:Ypos}-200
  			Report$?LOC:OpgemaaktTe{PROP:ypos}=Report$?LOC:OpgemaaktTe{PROP:ypos}-200
  			Report$?LOC:HandtekeningStempelAfzender{PROP:Xpos}=Report$?LOC:HandtekeningStempelAfzender{PROP:Xpos}+200
  			Report$?LOC:Kenteken{PROP:Xpos}=Report$?LOC:Kenteken{PROP:Xpos}+200
  		END	
  
  
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
    OF ?BtnLeeg
      LOC:TransporteurID = 0
      CLEAR(VTRA:Record)
      FDCB2.ResetQueue(True)
      ThisWindow.Reset(True)
    OF ?Pause
      IF Loc:Printer='Kies Printer'
      	Message('Vergeet niet een printer te kiezen','Printer', Icon:Hand)
      	Select(?Loc:Printer:2)
      	CYCLE
      END	      
      IF SELF.Paused
        TARGET{PROP:Timer} = SELF.Timer
        ?Pause{PROP:Text} = 'Pause'
      ELSE
        SELF.Timer = TARGET{PROP:Timer}
        TARGET{PROP:Timer} = 0
        ?Pause{PROP:Text} = 'Restart'
      END
      SELF.Paused = 1 - SELF.Paused
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?Pause
      ThisWindow.Update()
      	DO SavePalletAdministratie
      
      	CLEAR(CMR:Record)
      	CMR:VerkoopID = LOC:VerkoopID
      	SET(CMR:CMR_FK1,CMR:CMR_FK1)
      
      	found# = false
      	IF (Access:CMR.TryNext() = Level:Benign)
      		IF (CMR:VerkoopID = LOC:VerkoopID)
      			found# = TRUE
      		END
      	END
      
      	IF (NOT(found#))
      		CLEAR(CMR:Record)
      		db.Debugout('CMR ' & LOC:VerkoopID & ' primen')
      	.
      
      	CMR:VerkoopID = LOC:VerkoopID
      	CMR:Expediteur=Loc:Expediteur
      	CMR:Geadresseerde=Loc:Geadresseerde
      	CMR:Transporteur=LOC:Transporteur
      	CMR:AfleverAdres=Loc:AfleveringAdres
      	CMR:TransporteurExtra=LOC:TransporteurExtra
      	CMR:AfkomstAdres=Loc:AfkomstAdres
      	CMR:OpmerkingenVervoerder=LOC:OpmerkingenVervoerder
      	CMR:ExtraDocumenten=LOC:ExtraDocumenten
      	CMR:Artikel=Loc:Artikel
      	CMR:Instructie=LOC:Instructie
      	CMR:SpecialeOvereenkomst=LOC:SpecialeOvereenkomst
      	CMR:Frankeringsvoorschrift=LOC:Frankeringsvoorschrift
      	CMR:IsTruckClean=Loc:IsTruckClear
      	CMR:IsPackingGoodsOK=Loc:IsPackingGoodsOK
      	CMR:ISDriverDressedCorrectly=Loc:ISDriverDressedCorrectly
      	CMR:EC_LabelsOnTheGoods=Loc:EC_LabelsOnTheGoods
      	CMR:OpgemaaktTe=LOC:OpgemaaktTe
      	CMR:HandtekeningStempelAfzender=LOC:HandtekeningStempelAfzender
      	CMR:Kenteken=LOC:Kenteken
      
      	IF (NOT(found#))
      		db.Debugout('CMR ' & LOC:VerkoopID & ' inserten:' & found#)
      		Access:CMR.Insert()
      	ELSE
      		db.Debugout('CMR ' & LOC:VerkoopID & ' updaten')
      		Access:CMR.Update()
      	.
    OF ?Progress:Cancel
      ThisWindow.Update()
      IF MESSAGE('Pallet-administratie en CMR-historie bijwerken?', 'Opslaan', ICON:Question, BUTTON:Yes+BUTTON:No, BUTTON:Yes,1) = BUTTON:Yes
      	DO SavePalletAdministratie
      
      	CLEAR(CMR:Record)
      	CMR:VerkoopID = LOC:VerkoopID
      	SET(CMR:CMR_FK1,CMR:CMR_FK1)
      
      	found# = false
      	IF (Access:CMR.TryNext() = Level:Benign)
      		IF (CMR:VerkoopID = LOC:VerkoopID)
      			found# = TRUE
      		END
      	END
      
      	IF (NOT(found#))
      		CLEAR(CMR:Record)
      		!Access:CMR.PrimeRecord(true)
      		db.Debugout('CMR ' & LOC:VerkoopID & ' primen')
      	.
      
      	CMR:VerkoopID=LOC:VerkoopID
      	CMR:Expediteur=Loc:Expediteur
      	CMR:Geadresseerde=Loc:Geadresseerde
      	CMR:Transporteur=LOC:Transporteur
      	CMR:AfleverAdres=Loc:AfleveringAdres
      	CMR:TransporteurExtra=LOC:TransporteurExtra
      	CMR:AfkomstAdres=Loc:AfkomstAdres
      	CMR:OpmerkingenVervoerder=LOC:OpmerkingenVervoerder
      	CMR:ExtraDocumenten=LOC:ExtraDocumenten
      	CMR:Artikel=Loc:Artikel
      	CMR:Instructie=LOC:Instructie
      	CMR:SpecialeOvereenkomst=LOC:SpecialeOvereenkomst
      	CMR:Frankeringsvoorschrift=LOC:Frankeringsvoorschrift
      	CMR:IsTruckClean=Loc:IsTruckClear
      	CMR:IsPackingGoodsOK=Loc:IsPackingGoodsOK
      	CMR:ISDriverDressedCorrectly=Loc:ISDriverDressedCorrectly
      	CMR:EC_LabelsOnTheGoods=Loc:EC_LabelsOnTheGoods
      	CMR:OpgemaaktTe=LOC:OpgemaaktTe
      	CMR:HandtekeningStempelAfzender=LOC:HandtekeningStempelAfzender
      	CMR:Kenteken=LOC:Kenteken
      
      	IF (NOT(found#))
      		db.Debugout('CMR ' & LOC:VerkoopID & ' inserten:' & found#)
      		Access:CMR.Insert()
      	ELSE
      		db.Debugout('CMR ' & LOC:VerkoopID & ' updaten')
      		Access:CMR.Update()
      	.
      .
    OF ?VulArtikelOpnieuw
      ThisWindow.Update()
      DO VulArtikelQueue
      DO VulLocArtikel
      Loc:Artikel = LOC:ArtikelBepaald
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
    OF EVENT:Timer
      IF SELF.Paused THEN RETURN Level:Benign .
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

LocalClass.SchrijfPalletMutatie     Procedure(LONG pVerkoopID, pPlanningID, LONG pPalletSoort, LONG pInkomend, LONG pUitgaand)

CODE
    Pla:PlanningID=pPlanningID
    Access:Planning.TryFetch(Pla:PK_Planning)
    Ver2:VerkoopID=pVerkoopID
    Access:Verkoop.TryFetch(Ver2:PK_Verkoop)
    
    CLEAR(Pal:Record)
    Pal:VerkoopID=pVerkoopID
    Pal:PalletSoortID=pPalletSoort
    Pal:Transporteur=0
    IF Access:PalletMutatie.Fetch(Pal:PalletMutatie_FK5)= Level:Benign
        Pal:Uitgaand = pUitgaand
        Pal:Inkomend = pInkomend
        Access:PalletMutatie.Update()
    ELSIF pUitgaand<>0 OR pInkomend<>0
        CLEAR(Pal:Record)
        Pal:PalletSoortID = pPalletSoort
        Pal:VerkoopID = LOC:VerkoopID
			
        Pla:PlanningID=pPlanningID
        Access:Planning.TryFetch(Pla:PK_Planning)
        Ver2:VerkoopID=pVerkoopID
        Access:Verkoop.TryFetch(Ver2:PK_Verkoop)
			
        Pal:RelatieID = Ver2:Klant
        Pal:DatumTijd = Ver2:Planning			
			
        Pal:Uitgaand = pUitgaand
        Pal:Inkomend = pInkomend
        Access:PalletMutatie.Insert()
    END
    
    !~niet meer naar de transporteur
!    if(LOC:TransporteurID > 0)
!				!CLEAR(Tra:Record)
!				!Tra:TransporteurID=LOC:TransporteurID
!				!message(Tra:TransporteurID)
!				!Access:Transporteur.TryFetch(Tra:PK_Transporteur)
!				!message(Tra:RelatieID)
!        db.DebugOut('PalletMutatie wegschrijven voor Transporteur ' & LOC:TransporteurID)
!        Pal:RelatieID = LOC:TransporteurID
!        Pal:Transporteur = 1
!        Access:PalletMutatie.Insert()
!    .
    RETURN
    
                    

ThisReport.Close PROCEDURE

  CODE
  PARENT.Close
      if SAV:Printer<>''
          PRINTER{PROPPRINT:Device}=SAV:Printer
      END
  
      if SAV:PaperBin<>''
          !PRINTER{PROPPRINT:PaperBin}=SAV:PaperBin
          PRINTER{PROPPRINT:Copies}=1
      END
  
  


ThisReport.TakeRecord PROCEDURE

ReturnValue          BYTE,AUTO

SkipDetails BYTE
  CODE
  ReturnValue = PARENT.TakeRecord()
  PRINT(RPT:PlanningDetail)
  RETURN ReturnValue


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window
  SELF.SetStrategy(?Loc:IsTruckClear, Resize:Reposition, Resize:LockSize) ! Override strategy for ?Loc:IsTruckClear
  SELF.SetStrategy(?Loc:IsPackingGoodsOK, Resize:Reposition, Resize:LockSize) ! Override strategy for ?Loc:IsPackingGoodsOK
  SELF.SetStrategy(?Loc:ISDriverDressedCorrectly, Resize:Reposition, Resize:LockSize) ! Override strategy for ?Loc:ISDriverDressedCorrectly
  SELF.SetStrategy(?Loc:EC_LabelsOnTheGoods, Resize:Reposition, Resize:LockSize) ! Override strategy for ?Loc:EC_LabelsOnTheGoods

