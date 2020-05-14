

   MEMBER('VoorrPln.clw')                                  ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABDROPS.INC'),ONCE
   INCLUDE('ABPOPUP.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('VOORRPLN012.INC'),ONCE        !Local module procedure declarations
                     END


!!! <summary>
!!! Generated from procedure template - Window
!!! Form Planning
!!! </summary>
UpdatePlanningVerkoop PROCEDURE 

LOC:OverboekingPlanningID LONG                             ! 
CurrentTab           STRING(80)                            ! 
LOC:PartijVerkoopKG  DECIMAL(10,2)                         ! 
ActionMessage        CSTRING(40)                           ! 
LOC:VerpakkingID     LONG                                  ! 
LOC:CelID            LONG                                  ! 
LOC:VoorraadKG       LONG                                  ! 
LOC:VoorraadPallets  LONG                                  ! 
LOC:PartijCelID      CSTRING(26)                           ! 
LOC:ArtikelID        CSTRING(31)                           ! 
Loc:GewichtPallet    DECIMAL(7,3)                          ! 
LOC:Planning         STRING(8)                             ! 
LOC:VerpakkingID2    LONG                                  ! 
LOC:CelID2           LONG                                  ! 
LOC:Memo             CSTRING(101)                          ! 
LOC:Instructie       CSTRING(101)                          ! 
Loc:GewichtDoos      DECIMAL(7,3)                          ! 
LOC:Transport        CSTRING(101)                          ! 
Loc:LotID            LONG                                  ! 
Loc:PlantNumber      CSTRING(51)                           ! 
Loc:DeliveryDate     STRING(8)                             ! 
Loc:Valuta           CSTRING(51)                           ! 
LOC:PressedOK        BYTE                                  ! 
LOC:BeschikbareVoorraad DECIMAL(9,2)                       ! 
LOC:BeschikbarePartijVoorraad DECIMAL(10,2)                ! 
LOC:OrigineelPartijCelID_TMP CSTRING(26)                   ! 
LOC:OrigineelPartijID LONG                                 ! 
LOC:OrigineelVerkoopKG DECIMAL(9,2)                        ! 
LOC:VerkoopKG        DECIMAL(9,2)                          ! 
LOC:VerkoopKGPrijs   DECIMAL(9,3)                          ! 
LOC:BAK_Gemaakt      BYTE                                  ! 
LOC:BAK_CelID        LONG                                  ! 
LOC:BAK_PartijID     LONG                                  ! 
LOC:BAK_VerpakkingID LONG                                  ! 
LOC:BufferID         USHORT                                ! 
LOC:FileID           USHORT                                ! 
LOC:PlanningActiviteitID LONG                              ! 
LOC:CMRArtikelOms    CSTRING(101)                          ! 
LOC:LastArtikelID    CSTRING(31)                           ! 
LOC:LastKG           DECIMAL(10,2)                         ! 
Loc:GNCode           CSTRING(21)                           ! 
FDCB8::View:FileDropCombo VIEW(Verpakking)
                       PROJECT(Ver:VerpakkingOmschrijving)
                       PROJECT(Ver:InhoudKG)
                     END
FDCB9::View:FileDropCombo VIEW(Cel)
                       PROJECT(CEL:CelOms)
                       PROJECT(CEL:CelID)
                     END
FDCB4::View:FileDropCombo VIEW(ViewVoorraadPartij)
                       PROJECT(VVPar:PartijCelID)
                       PROJECT(VVPar:PartijID)
                       PROJECT(VVPar:CelID)
                       PROJECT(VVPar:BerekendeInkoopKGPrijs)
                       PROJECT(VVPar:Locatienaam)
                       PROJECT(VVPar:VoorraadKG)
                       JOIN(ACel:CEL_PK,VVPar:CelID)
                         PROJECT(ACel:CelOms)
                         PROJECT(ACel:CelID)
                       END
                       JOIN(Par:Partij_PK,VVPar:PartijID)
                         PROJECT(Par:PartijID)
                         PROJECT(Par:ExternPartijnr)
                         PROJECT(Par:AanmaakDatum_DATE)
                         PROJECT(Par:Leverancier)
                         PROJECT(Par:VerpakkingID)
                         JOIN(AREL:Relatie_PK,Par:Leverancier)
                           PROJECT(AREL:FirmaNaam)
                           PROJECT(AREL:RelatieID)
                         END
                         JOIN(AVP:Verpakking_PK,Par:VerpakkingID)
                           PROJECT(AVP:VerpakkingOmschrijving)
                           PROJECT(AVP:VerpakkingID)
                         END
                       END
                       JOIN(VPPar:PartijCelID_K,VVPar:PartijCelID)
                         PROJECT(VPPar:VerkoopKG)
                         PROJECT(VPPar:PartijCelID)
                       END
                       JOIN(VVParT:PK_ViewVoorraadPartijTotaal,VVPar:PartijID)
                         PROJECT(VVParT:VoorraadKG)
                         PROJECT(VVParT:PartijID)
                       END
                       JOIN(VPParT:PK_ViewPlanningPartijTotaal,VVPar:PartijID)
                         PROJECT(VPParT:VerkoopKG)
                         PROJECT(VPParT:PartijID)
                       END
                     END
FDCB6::View:FileDropCombo VIEW(ViewArtikel)
                       PROJECT(Art:ArtikelOms)
                       PROJECT(Art:ArtikelID)
                     END
BRW12::View:Browse   VIEW(Activiteit)
                       PROJECT(ACT:Datum)
                       PROJECT(ACT:Tijd)
                       PROJECT(ACT:Omschrijving)
                       PROJECT(ACT:DatumTijd)
                       PROJECT(ACT:ActiviteitID)
                       PROJECT(ACT:PlanningID)
                     END
Queue:Browse         QUEUE                            !Queue declaration for browse/combo box using ?List
ACT:Datum              LIKE(ACT:Datum)                !List box control field - type derived from field
ACT:Tijd               LIKE(ACT:Tijd)                 !List box control field - type derived from field
ACT:Omschrijving       LIKE(ACT:Omschrijving)         !List box control field - type derived from field
ACT:DatumTijd          LIKE(ACT:DatumTijd)            !Browse hot field - type derived from field
ACT:ActiviteitID       LIKE(ACT:ActiviteitID)         !Primary key field - type derived from field
ACT:PlanningID         LIKE(ACT:PlanningID)           !Browse key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
BRW7::View:Browse    VIEW(KostenStamgeg)
                       PROJECT(Kos:Omschrijving)
                       PROJECT(Kos:KostenID)
                       PROJECT(Kos:Soort)
                       PROJECT(Kos:Prijs)
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?ExtraKostenList
Kos:Omschrijving       LIKE(Kos:Omschrijving)         !List box control field - type derived from field
Ext:Aantal             LIKE(Ext:Aantal)               !List box control field - type derived from field
Ext:Prijs              LIKE(Ext:Prijs)                !List box control field - type derived from field
Ext:ExtraKosten        LIKE(Ext:ExtraKosten)          !List box control field - type derived from field
Kos:KostenID           LIKE(Kos:KostenID)             !Browse hot field - type derived from field
Kos:Soort              LIKE(Kos:Soort)                !Browse hot field - type derived from field
Kos:Prijs              LIKE(Kos:Prijs)                !Browse hot field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
FDB14::View:FileDrop VIEW(GNCode)
                       PROJECT(GNC:GNCode)
                       PROJECT(GNC:Benaming_NL)
                     END
Queue:FileDropCombo:1 QUEUE                           !
Ver:VerpakkingOmschrijving LIKE(Ver:VerpakkingOmschrijving) !List box control field - type derived from field
Ver:InhoudKG           LIKE(Ver:InhoudKG)             !Browse hot field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
Queue:FileDropCombo:2 QUEUE                           !
CEL:CelOms             LIKE(CEL:CelOms)               !List box control field - type derived from field
CEL:CelID              LIKE(CEL:CelID)                !Primary key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
Queue:FileDropCombo:3 QUEUE                           !
VVPar:PartijCelID      LIKE(VVPar:PartijCelID)        !List box control field - type derived from field
VVPar:PartijID         LIKE(VVPar:PartijID)           !List box control field - type derived from field
Par:PartijID           LIKE(Par:PartijID)             !List box control field - type derived from field
Par:ExternPartijnr     LIKE(Par:ExternPartijnr)       !List box control field - type derived from field
VVPar:CelID            LIKE(VVPar:CelID)              !List box control field - type derived from field
Par:AanmaakDatum_DATE  LIKE(Par:AanmaakDatum_DATE)    !List box control field - type derived from field
VVPar:BerekendeInkoopKGPrijs LIKE(VVPar:BerekendeInkoopKGPrijs) !List box control field - type derived from field
VVParT:VoorraadKG      LIKE(VVParT:VoorraadKG)        !List box control field - type derived from field
VVParT:VoorraadKG_Style LONG                          !Field style
LOC:PartijVerkoopKG    LIKE(LOC:PartijVerkoopKG)      !List box control field - type derived from local data
LOC:BeschikbarePartijVoorraad LIKE(LOC:BeschikbarePartijVoorraad) !List box control field - type derived from local data
ACel:CelOms            LIKE(ACel:CelOms)              !List box control field - type derived from field
VVPar:Locatienaam      LIKE(VVPar:Locatienaam)        !List box control field - type derived from field
VVPar:VoorraadKG       LIKE(VVPar:VoorraadKG)         !List box control field - type derived from field
LOC:VerkoopKG          LIKE(LOC:VerkoopKG)            !List box control field - type derived from local data
LOC:BeschikbareVoorraad LIKE(LOC:BeschikbareVoorraad) !List box control field - type derived from local data
AREL:FirmaNaam         LIKE(AREL:FirmaNaam)           !List box control field - type derived from field
AVP:VerpakkingOmschrijving LIKE(AVP:VerpakkingOmschrijving) !List box control field - type derived from field
VPParT:VerkoopKG       LIKE(VPParT:VerkoopKG)         !Browse hot field - type derived from field
VPPar:VerkoopKG        LIKE(VPPar:VerkoopKG)          !Browse hot field - type derived from field
ACel:CelID             LIKE(ACel:CelID)               !Related join file key field - type derived from field
AREL:RelatieID         LIKE(AREL:RelatieID)           !Related join file key field - type derived from field
AVP:VerpakkingID       LIKE(AVP:VerpakkingID)         !Related join file key field - type derived from field
VPPar:PartijCelID      LIKE(VPPar:PartijCelID)        !Related join file key field - type derived from field
VVParT:PartijID        LIKE(VVParT:PartijID)          !Related join file key field - type derived from field
VPParT:PartijID        LIKE(VPParT:PartijID)          !Related join file key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
Queue:FileDropCombo  QUEUE                            !
Art:ArtikelOms         LIKE(Art:ArtikelOms)           !List box control field - type derived from field
Art:ArtikelID          LIKE(Art:ArtikelID)            !List box control field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
Queue:FileDrop       QUEUE                            !
GNC:GNCode             LIKE(GNC:GNCode)               !List box control field - type derived from field
GNC:Benaming_NL        LIKE(GNC:Benaming_NL)          !List box control field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
History::Pla:Record  LIKE(Pla:RECORD),THREAD
NetLocalRefreshDate     Long     ! NetTalk (NetRefresh)
NetLocalRefreshTime     Long
NetLocalDependancies    String('|Planning|Verpakking|Cel|ViewVoorraadPartij|ACel|Partij|ARelatie|AVerpakking|ViewPlanningPartij|ViewVoorraadPartijTotaal|ViewPlanningPartijTotaal|ViewArtikel|Activiteit|KostenStamgeg|GNCode|')
QuickWindow          WINDOW('Form Planning'),AT(,,497,360),FONT('MS Sans Serif',8,,,CHARSET:DEFAULT),DOUBLE,CENTER, |
  GRAY,IMM,MDI,HLP('UpdatePlanning'),SYSTEM
                       SHEET,AT(4,4,491,337),USE(?CurrentTab)
                         TAB('&1) Verkoop-regel'),USE(?Tab:1)
                           PROMPT('Artikel:'),AT(7,26),USE(?Pla:ArtikelID:Prompt),TRN
                           COMBO(@s60),AT(69,27,282,10),USE(Art:ArtikelOms),DROP(5),FORMAT('187L(2)|M~Omschrijving' & |
  '~@s60@120L(2)|M~ID~@s30@'),FROM(Queue:FileDropCombo),IMM
                           GROUP('Artikelomschrijving (CMR / Palletblad)'),AT(7,38,483,44),USE(?GROUP2),BOXED
                             STRING('Klant-specifieke artikelnaam:'),AT(11,50),USE(?STRING1)
                             STRING(@s99),AT(117,50,281),USE(LOC:CMRArtikelOms),FONT('Microsoft Sans Serif',,,FONT:regular), |
  LEFT
                             PROMPT('Artikelomschrijving:'),AT(10,66,103,12),USE(?Pla:AlternatieveArtikelOms:Prompt)
                             BUTTON,AT(118,65,33,14),USE(?OvernemenButton),FONT('Microsoft Sans Serif',,COLOR:BTNFACE,FONT:regular), |
  ICON('overnemen.png'),TIP('Overnemen klant-specifieke artikelnaam')
                             BUTTON('Wijzigen'),AT(405,45,57,14),USE(?ChangeCMRArtikel),FONT('Microsoft Sans Serif',,,FONT:regular), |
  LEFT,ICON('WAChange.ico')
                             TEXT,AT(155,62,333,17),USE(Pla:AlternatieveArtikelOms)
                           END
                           PROMPT('Partij:'),AT(7,87),USE(?PROMPT1)
                           COMBO(@s25),AT(69,87,177,10),USE(VVPar:PartijCelID),HVSCROLL,DROP(25,800),FORMAT('50L(2)|~Pa' & |
  'rtij.Cel~C(0)@s25@0L(2)~Partij ID~C(0)@n_10@[39R(2)|M~Intern~C(0)@n_10@60R(2)|M~Exte' & |
  'rn~C(1)@s20@](78)|~Partijnummer~0L(2)~Cel ID~C(1)@n_10@44L(2)|~Inslagdatum~C(0)@d17@' & |
  '52R(2)|~Inkoop KG-Prijs~C(0)@n13`3@[49R(2)|Y~Voorraad~C(0)@n-12`2@65R(2)|~Geplande V' & |
  'erkoop~C(0)@n-14`2@60R(2)|~Beschikbaar~D(12)@n-14`2@](171)|~KG (Partij)~[40L(2)|M~Ce' & |
  'l~C(0)@s50@20L(2)|M@s50@]|~Cel~[43R(2)|M~Voorraad~C(0)@n-12`2@Z(1)62R(2)|M~Geplande ' & |
  'Verkoop~C(0)@n-13`2@Z(1)56R(2)|M~Beschikbaar~C(0)@n-13`2@Z(1)](160)|~KG (Cel)~74L(2)' & |
  '|M~Leverancier~C(0)@s50@80L(2)|M~Verpakking~C(0)@s50@'),FROM(Queue:FileDropCombo:3),IMM
                           PROMPT('Verpakking:'),AT(7,103),USE(?Pla:VerpakkingID:Prompt),TRN
                           COMBO(@s50),AT(69,103,282,10),USE(Ver:VerpakkingOmschrijving),VSCROLL,DROP(25),FORMAT('200L(2)~Om' & |
  'schrijving~L(3)@s50@'),FROM(Queue:FileDropCombo:1),IMM
                           PROMPT('Cel:'),AT(7,119),USE(?Pla:CelID:Prompt),TRN
                           COMBO(@s50),AT(69,119,282,10),USE(CEL:CelOms),VSCROLL,DROP(25),FORMAT('200L(2)~Omschrij' & |
  'ving~L(3)@s50@'),FROM(Queue:FileDropCombo:2),IMM
                           PROMPT('KG:'),AT(7,134),USE(?Pla:KG:Prompt),TRN
                           ENTRY(@n-12_`2),AT(69,134,64,10),USE(Pla:KG),RIGHT(2),IMM,REQ
                           PROMPT('Pallets:'),AT(7,148),USE(?Pla:Pallets:Prompt),TRN
                           ENTRY(@n-14.),AT(69,148,64,10),USE(Pla:Pallets),RIGHT(2)
                           PROMPT('Dozen:'),AT(7,163),USE(?Pla:Dozen:Prompt)
                           ENTRY(@n-14),AT(69,163,64,10),USE(Pla:Dozen),RIGHT(2)
                           PROMPT('Gross Weight:'),AT(173,163),USE(?Pla:GrossWeight:Prompt)
                           ENTRY(@n-11.3),AT(222,163,60,10),USE(Pla:GrossWeight),RIGHT(2)
                           PROMPT('Datum:'),AT(7,177),USE(?Pla:Planning_DATE:Prompt),HIDE,TRN
                           ENTRY(@d6-),AT(69,177,64,10),USE(Pla:Planning_DATE),RIGHT(2),HIDE
                           PROMPT('Tijdstip:'),AT(173,177),USE(?Pla:Planning_TIME:Prompt),HIDE,TRN
                           ENTRY(@t7),AT(218,177,64,10),USE(Pla:Planning_TIME),RIGHT(2),HIDE
                           PROMPT('Instructie:'),AT(7,191),USE(?Pla:Instructie:Prompt),CENTER
                           TEXT,AT(69,193,282,57),USE(Pla:Instructie,,?Pla:Instructie:2)
                           PROMPT('Transport:'),AT(7,255),USE(?Pla:Transport:Prompt)
                           TEXT,AT(69,255,215,52),USE(Pla:Transport,,?Pla:Transport:2)
                           PROMPT('Prijs per KG:'),AT(7,311),USE(?Pla:VerkoopKGPrijs:Prompt)
                           ENTRY(@n-13`3),AT(69,311,60,10),USE(Pla:VerkoopKGPrijs),RIGHT(2)
                           GROUP('Palletblad-data'),AT(357,86,133,151),USE(?GROUP1),BOXED
                             PROMPT('Afleverdatum (12):'),AT(362,105),USE(?Pla:UitslagPalletbladDueDate12_DATE:Prompt)
                             ENTRY(@D6-B),AT(433,105,50,10),USE(Pla:UitslagPalletbladDueDate12_DATE)
                             PROMPT('Productiedatum (11):'),AT(362,121),USE(?Pla:UitslagPalletbladProductionDate11_DATE:Prompt)
                             ENTRY(@D6-B),AT(433,121,50,10),USE(Pla:UitslagPalletbladProductionDate11_DATE)
                             PROMPT('THT (15):'),AT(362,134),USE(?Pla:UitslagPalletbladSellByDate15_DATE:Prompt)
                             ENTRY(@D6-B),AT(433,134,50,10),USE(Pla:UitslagPalletbladSellByDate15_DATE)
                             PROMPT('Harvast Date (7007)'),AT(361,147),USE(?Pla:UitslagPalletbladHarvastDate7007_DATE:Prompt)
                             ENTRY(@d6-B),AT(433,147,50,10),USE(Pla:UitslagPalletbladHarvastDate7007_DATE)
                             PROMPT('Origin Live Bird:'),AT(362,160),USE(?Pla:UitslagPalletbladOriginLiveBird:Prompt)
                             ENTRY(@s50),AT(433,159,60,10),USE(Pla:UitslagPalletbladOriginLiveBird)
                             PROMPT('Origin Slauther House:'),AT(362,177),USE(?Pla:UitslagPalletbladOriginSlautherHouse:Prompt)
                             ENTRY(@s50),AT(433,176,60,10),USE(Pla:UitslagPalletbladOriginSlautherHouse)
                             PROMPT('Origin Processing:'),AT(362,194),USE(?Pla:UitslagPalletbladOriginProcessing:Prompt)
                             ENTRY(@s19),AT(433,193,60,10),USE(Pla:UitslagPalletbladOriginProcessing)
                             PROMPT('Origin Packing:'),AT(362,213),USE(?Pla:UitslagPalletbladOriginPacking:Prompt)
                             ENTRY(@s19),AT(433,212,60,10),USE(Pla:UitslagPalletbladOriginPacking)
                           END
                           BUTTON('Leeg'),AT(251,86,34),USE(?LeegPartij)
                           BUTTON('Neem voorraad'),AT(287,86),USE(?NeemVoorraad)
                           PROMPT('Valuta:'),AT(157,310),USE(?Pla:Valuta:Prompt)
                           LIST,AT(188,311,,10),USE(Pla:Valuta),DISABLE,DROP(10,50),FORMAT('@s50'),FROM('Euro|#Euro' & |
  '|Dollar|#Dollar|Pond|#Pond')
                           PROMPT('Koersverschil:'),AT(277,311),USE(?Pla:Koersverschil:Prompt)
                           ENTRY(@n-15.3),AT(331,311,60,10),USE(Pla:Koersverschil),RIGHT(2),DISABLE
                           STRING(@n-13`3),AT(430,311),USE(Pla:ExtraKosten)
                           PROMPT('Totaal:'),AT(395,311),USE(?PROMPT2)
                           PROMPT('Lot ID:'),AT(7,327),USE(?Pla:LotID:Prompt)
                           LIST,AT(69,327,71,10),USE(Pla:LotID),RIGHT(1),DROP(3),FROM('1|2|3')
                           PROMPT('Plant Number:'),AT(157,327),USE(?Pla:PlantNumber:Prompt)
                           ENTRY(@s50),AT(207,327,60,10),USE(Pla:PlantNumber)
                           PROMPT('DeliveryDate:'),AT(283,327),USE(?Pla:DeliveryDate_DATE:Prompt)
                           ENTRY(@d6-),AT(333,327,60,10),USE(Pla:DeliveryDate_DATE)
                           LIST,AT(289,255,194,52),USE(?ExtraKostenList),ALRT(MouseLeft2),FORMAT('81L(2)|M~Extra k' & |
  'osten~@s60@34R(2)|M~Aantal~@n12_`2@32R(2)|M~Prijs~R(0)@n-15.3@64R(2)|M~Extra Kosten~' & |
  'R(0)@n-15.3@'),FROM(Queue:Browse:1)
                           STRING('GNCode:'),AT(356,27),USE(?STRING2)
                           LIST,AT(392,26,,10),USE(GNC:GNCode),DROP(25,200),FORMAT('57L(2)|M~GNC ode~L(0)@s20@400L' & |
  '(2)|M~Benaming NL~L(0)@s100@'),FROM(Queue:FileDrop)
                         END
                         TAB('2) Activiteiten'),USE(?TAB1)
                           LIST,AT(11,25,339,241),USE(?List),HVSCROLL,FORMAT('61L(2)|M~Datum~C(0)@d6-@36L(2)|M~Tij' & |
  'd~C(0)@t7B@1020L(2)|M~Omschrijving~@s255@'),FROM(Queue:Browse),IMM
                           BUTTON('&Toevoegen'),AT(11,271,65,17),USE(?Insert),LEFT,ICON('wainsert.ico'),FLAT
                           BUTTON('&Wijzigen'),AT(79,271,55,17),USE(?Change),LEFT,ICON('wachange.ico'),FLAT
                           BUTTON('&Verwijderen'),AT(137,271,69,17),USE(?Delete),LEFT,ICON('wadelete.ico'),FLAT
                         END
                       END
                       BUTTON('&OK'),AT(371,345,49,14),USE(?OK),LEFT,ICON('WAOK.ICO'),DEFAULT,FLAT,MSG('Accept dat' & |
  'a and close the window'),TIP('Accept data and close the window')
                       BUTTON('&Annuleren'),AT(424,345,69,14),USE(?Cancel),LEFT,ICON('WACANCEL.ICO'),FLAT,MSG('Cancel operation'), |
  TIP('Cancel operation')
                       BUTTON('Overboeking koppelen'),AT(3,345,103,14),USE(?KoppelOverboeking),LEFT,ICON('WACANCEL.ICO'), |
  FLAT
                       BUTTON('Verwijderen'),AT(103,345,62,14),USE(?DeleteOverboeking),LEFT,ICON('WACancel.ico'), |
  FLAT,HIDE
                       STRING(@N_10),AT(445,4),USE(Pla:PlanningID)
                     END

    omit('***',WE::CantCloseNowSetHereDone=1)  !Getting Nested omit compile error, then uncheck the "Check for duplicate CantCloseNowSetHere variable declaration" in the WinEvent local template
WE::CantCloseNowSetHereDone equate(1)
WE::CantCloseNowSetHere     long
    !***
ThisWindow           CLASS(WindowManager)
Ask                    PROCEDURE(),DERIVED
ChangeAction           PROCEDURE(),BYTE,DERIVED
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
PrimeFields            PROCEDURE(),PROC,DERIVED
PrimeUpdate            PROCEDURE(),BYTE,PROC,DERIVED
Reset                  PROCEDURE(BYTE Force=0),DERIVED
Run                    PROCEDURE(),BYTE,PROC,DERIVED
Run                    PROCEDURE(USHORT Number,BYTE Request),BYTE,PROC,DERIVED
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED
TakeCloseEvent         PROCEDURE(),BYTE,PROC,DERIVED
TakeCompleted          PROCEDURE(),BYTE,PROC,DERIVED
TakeEvent              PROCEDURE(),BYTE,PROC,DERIVED
TakeFieldEvent         PROCEDURE(),BYTE,PROC,DERIVED
TakeSelected           PROCEDURE(),BYTE,PROC,DERIVED
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED
DeleteGekoppeldeOverboeking PROCEDURE(), BYTE              ! New method added to this class instance
                     END

Toolbar              ToolbarClass
FDCB8                CLASS(FileDropComboClass)             ! File drop combo manager
Q                      &Queue:FileDropCombo:1         !Reference to browse queue type
                     END

FDCB9                CLASS(FileDropComboClass)             ! File drop combo manager
Q                      &Queue:FileDropCombo:2         !Reference to browse queue type
                     END

FDCB4                CLASS(FileDropComboClass)             ! File drop combo manager
Q                      &Queue:FileDropCombo:3         !Reference to browse queue type
SetQueueRecord         PROCEDURE(),DERIVED
                     END

FDCB6                CLASS(FileDropComboClass)             ! File drop combo manager
Q                      &Queue:FileDropCombo           !Reference to browse queue type
                     END

BRW12                CLASS(BrowseClass)                    ! Browse using ?List
Q                      &Queue:Browse                  !Reference to browse queue
Init                   PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)
PrimeRecord            PROCEDURE(BYTE SuppressClear = 0),BYTE,PROC,DERIVED
SetAlerts              PROCEDURE(),DERIVED
                     END

BRW12::Sort0:Locator StepLocatorClass                      ! Default Locator
BRW7                 CLASS(BrowseClass)                    ! Browse using ?ExtraKostenList
Q                      &Queue:Browse:1                !Reference to browse queue
ResetFromView          PROCEDURE(),DERIVED
SetQueueRecord         PROCEDURE(),DERIVED
                     END

BRW7::Sort0:Locator  StepLocatorClass                      ! Default Locator
FDB14                CLASS(FileDropClass)                  ! File drop manager
Q                      &Queue:FileDrop                !Reference to display queue
                     END

LOC:BufferID1               USHORT
LOC:FileID1					USHORT
LOC:BufferID2               USHORT
LOC:FileID2					USHORT
CurCtrlFeq          LONG
FieldColorQueue     QUEUE
Feq                   LONG
OldColor              LONG
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
  !Style for ?VVPar:PartijCelID
  !------------------------------------
  ?VVPar:PartijCelID{PROPSTYLE:FontName, 1}      = 'MS Sans Serif'
  ?VVPar:PartijCelID{PROPSTYLE:FontSize, 1}      = 10
  ?VVPar:PartijCelID{PROPSTYLE:FontStyle, 1}     = 700
  ?VVPar:PartijCelID{PROPSTYLE:TextColor, 1}     = -1
  ?VVPar:PartijCelID{PROPSTYLE:BackColor, 1}     = -1
  ?VVPar:PartijCelID{PROPSTYLE:TextSelected, 1}  = -1
  ?VVPar:PartijCelID{PROPSTYLE:BackSelected, 1}  = -1
  !------------------------------------
!---------------------------------------------------------------------------
RefreshKoppelOverboeking  ROUTINE
	IF Pla:OverboekingPlanningID > 0 THEN
		CLEAR(APla:Record)
		APla:PlanningID = Pla:OverboekingPlanningID
		IF (Access:APlanning.TryFetch(APla:PK_Planning) = Level:Benign)
			?KoppelOverboeking{PROP:Icon} = 'WAOK.ICO'
			UNHIDE(?DeleteOverboeking)
			EXIT
		END
	END
	?KoppelOverboeking{PROP:Icon} = 'WACancel.ICO'
	HIDE(?DeleteOverboeking)
	EXIT
LeegPartijCel       ROUTINE
	Pla:PartijID = 0
	LOC:PartijCelID = ''
	CLEAR(VVPar:Record)

	DISPLAY(?VVPar:PartijCelID)

	ENABLE(?Ver:VerpakkingOmschrijving)
	ENABLE(?Cel:CelOms)
	DISABLE(?NeemVoorraad)
	DISABLE(?LeegPartij)
	
	EXIT
LeegPartijCelTotaal       ROUTINE
	Pla:PartijID = 0
	LOC:PartijCelID = ''
    CLEAR(VVPar:Record)
    Pla:VerpakkingID = 0
    CLEAR(Ver:Record)
    Pla:CelID = 0
    CLEAR(Cel:Record)

    DISPLAY(?VVPar:PartijCelID)
    DISPLAY(?Ver:VerpakkingOmschrijving)
    DISPLAY(?Cel:CelOms)

	ENABLE(?Ver:VerpakkingOmschrijving)
	ENABLE(?Cel:CelOms)
	DISABLE(?NeemVoorraad)
	DISABLE(?LeegPartij)
	
	EXIT
LeegCelVerpakking       ROUTINE
    Pla:CelID = 0
    Pla:VerpakkingID = 0
    CLEAR(Cel:Record)
    CLEAR(Ver:Record)

    DISPLAY(?CEL:CelOms)
    DISPLAY(?Ver:VerpakkingOmschrijving)
	
	EXIT
MaakBackup          ROUTINE
	! Backup maken zodat als de partij/cel geen voorraad heeft (en de dropcombo op leeg komt te staan)
	! toch deze partij/cel bewaard blijft.
	IF Pla:PartijID <> 0 AND Pla:CelID <> 0 THEN
		LOC:BAK_Gemaakt = 1
		LOC:BAK_CelID = Pla:CelID
		LOC:BAK_PartijID = Pla:PartijID
		LOC:BAK_VerpakkingID = Pla:VerpakkingID
	ELSE
		LOC:BAK_Gemaakt = 0
	END
ZetBackupTerug      ROUTINE
	! Backup maken zodat als de partij/cel geen voorraad heeft (en de dropcombo op leeg komt te staan)
	! toch deze partij/cel bewaard blijft.
	IF LOC:BAK_Gemaakt THEN
		IF LOC:PartijCelID = CLIP(FORMAT(LOC:BAK_PartijID,@N05)) &  '.' & CLIP(LOC:BAK_CelID) THEN
			db.DebugOut('ZetBackupTerug - Backup teruggezet')
			Pla:CelID = LOC:BAK_CelID
			Pla:PartijID = LOC:BAK_PartijID
			Pla:VerpakkingID = LOC:BAK_VerpakkingID
			EXIT
		END
	END	
	
	db.DebugOut('ZetBackupTerug - Backup niet teruggezet')
BepaalCMRArtikelOms ROUTINE
   ! db.debugout('BepaalCMRArtikelOms - ' & Pla:ArtikelID)
    LOC:CMRArtikelOms = GlobalClass.CMRArtikelOms(Ver2:Klant, Pla:ArtikelID)
    DISPLAY(?LOC:CMRArtikelOms)
    EXIT
UpdatePartijFilter  ROUTINE
    db.DebugOut('UpdatePartijFilter - 1 :' & Pla:KG)
    IF (LOC:LastKG >= 0 AND Pla:KG < 0) OR (LOC:LastKG < 0 AND Pla:KG >= 0) THEN
        LOC:LastKG = Pla:KG
        FDCB4.ResetQueue(1)   
    END        
    db.DebugOut('UpdatePartijFilter - 2')
    EXIT
ShowGNCode          ROUTINE
    
    Clear(GNA:Record)
    GNA:ArtikelID=Pla:ArtikelID
    IF Access:GNCodeArtikelen.Fetch(GNA:GNCodeArtikelen_FK1)=Level:Benign
        Loc:GNCode=GNA:GNCode
        GNC:GNCode=GNA:GNCode
        ?GNC:GNCode{PROP:Disable}=TRUE
    ELSE
        Clear(Loc:GNCode)
        Clear(GNC:GNCode)
        ?GNC:GNCode{PROP:Disable}=FALSE
    END
    EXIT
    

ThisWindow.Ask PROCEDURE

  CODE
  CASE SELF.Request                                        ! Configure the action message text
  OF ViewRecord
    ActionMessage = 'View Record'
  OF InsertRecord
    ActionMessage = 'Record Will Be Added'
  OF ChangeRecord
    ActionMessage = 'Record Will Be Changed'
  END
  QuickWindow{PROP:Text} = ActionMessage                   ! Display status message in title bar
  PARENT.Ask


ThisWindow.ChangeAction PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  DO ZetBackupTerug
  ReturnValue = PARENT.ChangeAction()
  RETURN ReturnValue


ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('UpdatePlanningVerkoop')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Pla:ArtikelID:Prompt
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('ACT:ActiviteitID',ACT:ActiviteitID)                ! Added by: BrowseBox(ABC)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
  SELF.AddUpdateFile(Access:Planning)
  SELF.HistoryKey = CtrlH
  SELF.AddHistoryFile(Pla:Record,History::Pla:Record)
  SELF.AddHistoryField(?Pla:AlternatieveArtikelOms,41)
  SELF.AddHistoryField(?Pla:KG,5)
  SELF.AddHistoryField(?Pla:Pallets,6)
  SELF.AddHistoryField(?Pla:Dozen,60)
  SELF.AddHistoryField(?Pla:GrossWeight,61)
  SELF.AddHistoryField(?Pla:Planning_DATE,9)
  SELF.AddHistoryField(?Pla:Planning_TIME,10)
  SELF.AddHistoryField(?Pla:Instructie:2,20)
  SELF.AddHistoryField(?Pla:Transport:2,21)
  SELF.AddHistoryField(?Pla:VerkoopKGPrijs,28)
  SELF.AddHistoryField(?Pla:UitslagPalletbladDueDate12_DATE,31)
  SELF.AddHistoryField(?Pla:UitslagPalletbladProductionDate11_DATE,35)
  SELF.AddHistoryField(?Pla:UitslagPalletbladSellByDate15_DATE,39)
  SELF.AddHistoryField(?Pla:UitslagPalletbladHarvastDate7007_DATE,68)
  SELF.AddHistoryField(?Pla:UitslagPalletbladOriginLiveBird,44)
  SELF.AddHistoryField(?Pla:UitslagPalletbladOriginSlautherHouse,45)
  SELF.AddHistoryField(?Pla:UitslagPalletbladOriginProcessing,46)
  SELF.AddHistoryField(?Pla:UitslagPalletbladOriginPacking,47)
  SELF.AddHistoryField(?Pla:Valuta,48)
  SELF.AddHistoryField(?Pla:Koersverschil,49)
  SELF.AddHistoryField(?Pla:ExtraKosten,50)
  SELF.AddHistoryField(?Pla:LotID,51)
  SELF.AddHistoryField(?Pla:PlantNumber,52)
  SELF.AddHistoryField(?Pla:DeliveryDate_DATE,55)
  SELF.AddHistoryField(?Pla:PlanningID,1)
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  Relate:AAPlanning.Open                                   ! File AAPlanning used by this procedure, so make sure it's RelationManager is open
  Relate:APlanning.Open                                    ! File APlanning used by this procedure, so make sure it's RelationManager is open
  Relate:AViewArtikel.Open                                 ! File AViewArtikel used by this procedure, so make sure it's RelationManager is open
  Relate:AViewVoorraadPartij.Open                          ! File AViewVoorraadPartij used by this procedure, so make sure it's RelationManager is open
  Relate:Activiteit.Open                                   ! File Activiteit used by this procedure, so make sure it's RelationManager is open
  Relate:ArtikelOmschrijvingExtra.Open                     ! File ArtikelOmschrijvingExtra used by this procedure, so make sure it's RelationManager is open
  Relate:Cel.SetOpenRelated()
  Relate:Cel.Open                                          ! File Cel used by this procedure, so make sure it's RelationManager is open
  Relate:ExtraKosten.Open                                  ! File ExtraKosten used by this procedure, so make sure it's RelationManager is open
  Relate:GNCode.Open                                       ! File GNCode used by this procedure, so make sure it's RelationManager is open
  Relate:GNCodeArtikelen.Open                              ! File GNCodeArtikelen used by this procedure, so make sure it's RelationManager is open
  Relate:Inkoop.SetOpenRelated()
  Relate:Inkoop.Open                                       ! File Inkoop used by this procedure, so make sure it's RelationManager is open
  Relate:KostenStamgeg.Open                                ! File KostenStamgeg used by this procedure, so make sure it's RelationManager is open
  Relate:RelatieArtikelOmschrijving.Open                   ! File RelatieArtikelOmschrijving used by this procedure, so make sure it's RelationManager is open
  Relate:Verpakking.Open                                   ! File Verpakking used by this procedure, so make sure it's RelationManager is open
  Relate:ViewArtikel.Open                                  ! File ViewArtikel used by this procedure, so make sure it's RelationManager is open
  Relate:ViewPlanningPartij.Open                           ! File ViewPlanningPartij used by this procedure, so make sure it's RelationManager is open
  Relate:ViewVoorraadPartij.Open                           ! File ViewVoorraadPartij used by this procedure, so make sure it's RelationManager is open
  Access:Verkoop.UseFile                                   ! File referenced in 'Other Files' so need to inform it's FileManager
  SELF.FilesOpened = True
  SELF.Primary &= Relate:Planning
  IF SELF.Request = ViewRecord AND NOT SELF.BatchProcessing ! Setup actions for ViewOnly Mode
    SELF.InsertAction = Insert:None
    SELF.DeleteAction = Delete:None
    SELF.ChangeAction = Change:None
    SELF.CancelAction = Cancel:Cancel
    SELF.OkControl = 0
  ELSE
    SELF.InsertAction = Insert:Query
    SELF.ChangeAction = Change:Caller                      ! Changes allowed
    SELF.CancelAction = Cancel:Cancel                      ! No confirm cancel
    SELF.OkControl = ?OK
    IF SELF.PrimeUpdate() THEN RETURN Level:Notify.
  END
  LOC:PlanningActiviteitID = Pla:PlanningID ! Selector voor de Browse, anders wordt bij het inserten van een Activiteit de planning-record leeggegooid.\
  
  LOC:LastArtikelID = Pla:ArtikelID
  
  Loc:GewichtDoos= GETINI('ProForma','Loc:GewichtDoos',0.3,'.\Voorraad.ini')
  Loc:GewichtPallet= GETINI('ProForma','Loc:GewichtPallet',20,'.\Voorraad.ini')
  
  BRW12.Init(?List,Queue:Browse.ViewPosition,BRW12::View:Browse,Queue:Browse,Relate:Activiteit,SELF) ! Initialize the browse manager
  BRW7.Init(?ExtraKostenList,Queue:Browse:1.ViewPosition,BRW7::View:Browse,Queue:Browse:1,Relate:KostenStamgeg,SELF) ! Initialize the browse manager
  !SELF.AutoRefresh=False
  SELF.Open(QuickWindow)                                   ! Open window
  IF IGB:BekijkenPrijzen <> 1 THEN
  	! Prijzen niet tonen
  	?VVPar:PartijCelID{PROPLIST:Width, 5} = 0
  	
  	HIDE(?Pla:VerkoopKGPrijs)
      HIDE(?Pla:VerkoopKGPrijs:Prompt)
      HIDE(?ExtraKostenList)
  END
  
  IF (GLO:HidePlanningInstructie = 1) THEN
      HIDE(?Pla:Instructie:2)
      HIDE(?Pla:Instructie:Prompt)
      
      ?Pla:Transport:Prompt{Prop:YPos} = 179
      ?Pla:Transport:2{Prop:YPos} = 176
      ?Pla:Transport:2{Prop:Height} = 110
  END
  
  IF Self.Request=ChangeRecord 
  	LOC:OverboekingPlanningID = Pla:OverboekingPlanningID
  	
  	DO MaakBackup
  
  	IF Pla:PartijID <> 0 AND Pla:CelID <> 0
  		LOC:PartijCelID = CLIP(FORMAT(Pla:PartijID, @N05)) & '.' & CLIP(Pla:CelID)
  		LOC:OrigineelPartijID = Pla:PartijID
  	ELSE
  		LOC:PartijCelID = ''
  		LOC:OrigineelPartijID = 0
      END
      IF Pla:LotID=0
          IF Pla:PartijID<>0
              Clear(Par:Record)
              Par:PartijID=Pla:PartijID
              IF Access:Partij.Fetch(Par:Partij_PK)=Level:Benign
                  Clear(AREL:Record)
                  AREL:RelatieID=Par:Leverancier
                  IF Access:ARelatie.Fetch(ARel:Relatie_PK)=Level:Benign
                      Pla:LotID = AREL:LotID
                  END
              END
          END
      END
      DO ShowGNCode
      
  ELSIF Self.Request=InsertRecord 
      LOC:OrigineelPartijID = 0
      LOC:PartijCelID = ''
  !    PLA:Valuta='Euro'
  !    Pla:Koersverschil=1
  !    Pla:PlantNumber='NL5664EG'
  !    Pla:DeliveryDate_DATE=Ver2:Planning_DATE
      CLEAR(Pla:LotID)
  END
  
  LOC:OrigineelPartijCelID_TMP = LOC:PartijCelID
  LOC:OrigineelVerkoopKG = Pla:KG
  
  LOC:LastKG = Pla:KG
  
  CLEAR(VVPar:Record)
  VVPar:PartijCelID = LOC:PartijCelID
  IF (Access:ViewVoorraadPartij.TryFetch(VVPar:PartijCelID_K) <> Level:Benign)
  	DO LeegPartijCel
  ELSE
  	IF VVPar:ArtikelID <> Pla:ArtikelID THEN
  		DO LeegPartijCel
  	.
  .
  
  IF NOT(LOC:PartijCelID='')
  	DISABLE(?Ver:VerpakkingOmschrijving)
  	DISABLE(?Cel:CelOms)
  ELSE
  	DISABLE(?NeemVoorraad)
  	DISABLE(?LeegPartij)
  .
  
  LOC:PressedOK = false
  
  DO RefreshKoppelOverboeking
  WinAlertMouseZoom()
  Do DefineListboxStyle
  IF SELF.Request = ViewRecord                             ! Configure controls for View Only mode
    DISABLE(?Art:ArtikelOms)
    HIDE(?OvernemenButton)
    HIDE(?ChangeCMRArtikel)
    DISABLE(?VVPar:PartijCelID)
    DISABLE(?Ver:VerpakkingOmschrijving)
    DISABLE(?CEL:CelOms)
    DISABLE(?Pla:KG)
    DISABLE(?Pla:Pallets)
    ?Pla:Dozen{PROP:ReadOnly} = True
    ?Pla:GrossWeight{PROP:ReadOnly} = True
    DISABLE(?Pla:Planning_DATE)
    DISABLE(?Pla:Planning_TIME)
    DISABLE(?Pla:Instructie:2)
    DISABLE(?Pla:Transport:2)
    DISABLE(?Pla:VerkoopKGPrijs)
    DISABLE(?Pla:UitslagPalletbladDueDate12_DATE)
    DISABLE(?Pla:UitslagPalletbladProductionDate11_DATE)
    DISABLE(?Pla:UitslagPalletbladSellByDate15_DATE)
    ?Pla:UitslagPalletbladHarvastDate7007_DATE{PROP:ReadOnly} = True
    ?Pla:UitslagPalletbladOriginLiveBird{PROP:ReadOnly} = True
    ?Pla:UitslagPalletbladOriginSlautherHouse{PROP:ReadOnly} = True
    ?Pla:UitslagPalletbladOriginProcessing{PROP:ReadOnly} = True
    ?Pla:UitslagPalletbladOriginPacking{PROP:ReadOnly} = True
    HIDE(?LeegPartij)
    HIDE(?NeemVoorraad)
    DISABLE(?Pla:Valuta)
    ?Pla:Koersverschil{PROP:ReadOnly} = True
    DISABLE(?Pla:LotID)
    ?Pla:PlantNumber{PROP:ReadOnly} = True
    ?Pla:DeliveryDate_DATE{PROP:ReadOnly} = True
    DISABLE(?GNC:GNCode)
    DISABLE(?Insert)
    DISABLE(?Change)
    DISABLE(?Delete)
    DISABLE(?KoppelOverboeking)
    DISABLE(?DeleteOverboeking)
  END
  BRW12.Q &= Queue:Browse
  BRW12.FileLoaded = 1                                     ! This is a 'file loaded' browse
  BRW12.AddSortOrder(,ACT:FK1_Activiteit)                  ! Add the sort order for ACT:FK1_Activiteit for sort order 1
  BRW12.AddRange(ACT:PlanningID,LOC:PlanningActiviteitID)  ! Add single value range limit for sort order 1
  BRW12.AddLocator(BRW12::Sort0:Locator)                   ! Browse has a locator for sort order 1
  BRW12::Sort0:Locator.Init(,ACT:DatumTijd,1,BRW12)        ! Initialize the browse locator using  using key: ACT:FK1_Activiteit , ACT:DatumTijd
  BRW12.AddField(ACT:Datum,BRW12.Q.ACT:Datum)              ! Field ACT:Datum is a hot field or requires assignment from browse
  BRW12.AddField(ACT:Tijd,BRW12.Q.ACT:Tijd)                ! Field ACT:Tijd is a hot field or requires assignment from browse
  BRW12.AddField(ACT:Omschrijving,BRW12.Q.ACT:Omschrijving) ! Field ACT:Omschrijving is a hot field or requires assignment from browse
  BRW12.AddField(ACT:DatumTijd,BRW12.Q.ACT:DatumTijd)      ! Field ACT:DatumTijd is a hot field or requires assignment from browse
  BRW12.AddField(ACT:ActiviteitID,BRW12.Q.ACT:ActiviteitID) ! Field ACT:ActiviteitID is a hot field or requires assignment from browse
  BRW12.AddField(ACT:PlanningID,BRW12.Q.ACT:PlanningID)    ! Field ACT:PlanningID is a hot field or requires assignment from browse
  BRW7.Q &= Queue:Browse:1
  BRW7.AddSortOrder(,Kos:PK_KostenStamgeg)                 ! Add the sort order for Kos:PK_KostenStamgeg for sort order 1
  BRW7.AddLocator(BRW7::Sort0:Locator)                     ! Browse has a locator for sort order 1
  BRW7::Sort0:Locator.Init(,Kos:KostenID,,BRW7)            ! Initialize the browse locator using  using key: Kos:PK_KostenStamgeg , Kos:KostenID
  BRW7.SetFilter('(Kos:Soort=''A'')')                      ! Apply filter expression to browse
  BRW7.AddField(Kos:Omschrijving,BRW7.Q.Kos:Omschrijving)  ! Field Kos:Omschrijving is a hot field or requires assignment from browse
  BRW7.AddField(Ext:Aantal,BRW7.Q.Ext:Aantal)              ! Field Ext:Aantal is a hot field or requires assignment from browse
  BRW7.AddField(Ext:Prijs,BRW7.Q.Ext:Prijs)                ! Field Ext:Prijs is a hot field or requires assignment from browse
  BRW7.AddField(Ext:ExtraKosten,BRW7.Q.Ext:ExtraKosten)    ! Field Ext:ExtraKosten is a hot field or requires assignment from browse
  BRW7.AddField(Kos:KostenID,BRW7.Q.Kos:KostenID)          ! Field Kos:KostenID is a hot field or requires assignment from browse
  BRW7.AddField(Kos:Soort,BRW7.Q.Kos:Soort)                ! Field Kos:Soort is a hot field or requires assignment from browse
  BRW7.AddField(Kos:Prijs,BRW7.Q.Kos:Prijs)                ! Field Kos:Prijs is a hot field or requires assignment from browse
  INIMgr.Fetch('UpdatePlanningVerkoop',QuickWindow)        ! Restore window settings from non-volatile store
  FDCB8.Init(Ver:VerpakkingOmschrijving,?Ver:VerpakkingOmschrijving,Queue:FileDropCombo:1.ViewPosition,FDCB8::View:FileDropCombo,Queue:FileDropCombo:1,Relate:Verpakking,ThisWindow,GlobalErrors,0,1,0)
  FDCB8.Q &= Queue:FileDropCombo:1
  FDCB8.AddSortOrder(Ver:Verpakking_PK)
  FDCB8.AddField(Ver:VerpakkingOmschrijving,FDCB8.Q.Ver:VerpakkingOmschrijving) !List box control field - type derived from field
  FDCB8.AddField(Ver:InhoudKG,FDCB8.Q.Ver:InhoudKG) !Browse hot field - type derived from field
  FDCB8.AddUpdateField(Ver:VerpakkingID,Pla:VerpakkingID)
  ThisWindow.AddItem(FDCB8.WindowComponent)
  FDCB8.DefaultFill = 0
  FDCB9.Init(CEL:CelOms,?CEL:CelOms,Queue:FileDropCombo:2.ViewPosition,FDCB9::View:FileDropCombo,Queue:FileDropCombo:2,Relate:Cel,ThisWindow,GlobalErrors,0,1,0)
  FDCB9.Q &= Queue:FileDropCombo:2
  FDCB9.AddSortOrder(CEL:CEL_PK)
  FDCB9.AddField(CEL:CelOms,FDCB9.Q.CEL:CelOms) !List box control field - type derived from field
  FDCB9.AddField(CEL:CelID,FDCB9.Q.CEL:CelID) !Primary key field - type derived from field
  FDCB9.AddUpdateField(CEL:CelID,Pla:CelID)
  ThisWindow.AddItem(FDCB9.WindowComponent)
  FDCB9.DefaultFill = 0
  FDCB4.Init(VVPar:PartijCelID,?VVPar:PartijCelID,Queue:FileDropCombo:3.ViewPosition,FDCB4::View:FileDropCombo,Queue:FileDropCombo:3,Relate:ViewVoorraadPartij,ThisWindow,GlobalErrors,0,0,0)
  FDCB4.Q &= Queue:FileDropCombo:3
  FDCB4.AddSortOrder(VVPar:ArtikelID_PartijID_CelID_K)
  FDCB4.AddRange(VVPar:ArtikelID,Pla:ArtikelID)
  FDCB4.SetFilter('(Pla:KG>=0 AND (VVPar:VoorraadKG>0 OR VPPar:VerkoopKG<<>0)) OR (Pla:KG << 0)')
  FDCB4.AddField(VVPar:PartijCelID,FDCB4.Q.VVPar:PartijCelID) !List box control field - type derived from field
  FDCB4.AddField(VVPar:PartijID,FDCB4.Q.VVPar:PartijID) !List box control field - type derived from field
  FDCB4.AddField(Par:PartijID,FDCB4.Q.Par:PartijID) !List box control field - type derived from field
  FDCB4.AddField(Par:ExternPartijnr,FDCB4.Q.Par:ExternPartijnr) !List box control field - type derived from field
  FDCB4.AddField(VVPar:CelID,FDCB4.Q.VVPar:CelID) !List box control field - type derived from field
  FDCB4.AddField(Par:AanmaakDatum_DATE,FDCB4.Q.Par:AanmaakDatum_DATE) !List box control field - type derived from field
  FDCB4.AddField(VVPar:BerekendeInkoopKGPrijs,FDCB4.Q.VVPar:BerekendeInkoopKGPrijs) !List box control field - type derived from field
  FDCB4.AddField(VVParT:VoorraadKG,FDCB4.Q.VVParT:VoorraadKG) !List box control field - type derived from field
  FDCB4.AddField(LOC:PartijVerkoopKG,FDCB4.Q.LOC:PartijVerkoopKG) !List box control field - type derived from local data
  FDCB4.AddField(LOC:BeschikbarePartijVoorraad,FDCB4.Q.LOC:BeschikbarePartijVoorraad) !List box control field - type derived from local data
  FDCB4.AddField(ACel:CelOms,FDCB4.Q.ACel:CelOms) !List box control field - type derived from field
  FDCB4.AddField(VVPar:Locatienaam,FDCB4.Q.VVPar:Locatienaam) !List box control field - type derived from field
  FDCB4.AddField(VVPar:VoorraadKG,FDCB4.Q.VVPar:VoorraadKG) !List box control field - type derived from field
  FDCB4.AddField(LOC:VerkoopKG,FDCB4.Q.LOC:VerkoopKG) !List box control field - type derived from local data
  FDCB4.AddField(LOC:BeschikbareVoorraad,FDCB4.Q.LOC:BeschikbareVoorraad) !List box control field - type derived from local data
  FDCB4.AddField(AREL:FirmaNaam,FDCB4.Q.AREL:FirmaNaam) !List box control field - type derived from field
  FDCB4.AddField(AVP:VerpakkingOmschrijving,FDCB4.Q.AVP:VerpakkingOmschrijving) !List box control field - type derived from field
  FDCB4.AddField(VPParT:VerkoopKG,FDCB4.Q.VPParT:VerkoopKG) !Browse hot field - type derived from field
  FDCB4.AddField(VPPar:VerkoopKG,FDCB4.Q.VPPar:VerkoopKG) !Browse hot field - type derived from field
  FDCB4.AddField(ACel:CelID,FDCB4.Q.ACel:CelID) !Related join file key field - type derived from field
  FDCB4.AddField(AREL:RelatieID,FDCB4.Q.AREL:RelatieID) !Related join file key field - type derived from field
  FDCB4.AddField(AVP:VerpakkingID,FDCB4.Q.AVP:VerpakkingID) !Related join file key field - type derived from field
  FDCB4.AddField(VPPar:PartijCelID,FDCB4.Q.VPPar:PartijCelID) !Related join file key field - type derived from field
  FDCB4.AddField(VVParT:PartijID,FDCB4.Q.VVParT:PartijID) !Related join file key field - type derived from field
  FDCB4.AddField(VPParT:PartijID,FDCB4.Q.VPParT:PartijID) !Related join file key field - type derived from field
  FDCB4.AddUpdateField(VVPar:PartijID,Pla:PartijID)
  FDCB4.AddUpdateField(Par:VerpakkingID,LOC:VerpakkingID)
  FDCB4.AddUpdateField(VVPar:CelID,LOC:CelID)
  FDCB4.AddUpdateField(VVPar:PartijCelID,LOC:PartijCelID)
  ThisWindow.AddItem(FDCB4.WindowComponent)
  FDCB4.DefaultFill = 0
  FDCB6.Init(Art:ArtikelOms,?Art:ArtikelOms,Queue:FileDropCombo.ViewPosition,FDCB6::View:FileDropCombo,Queue:FileDropCombo,Relate:ViewArtikel,ThisWindow,GlobalErrors,0,1,0)
  FDCB6.Q &= Queue:FileDropCombo
  FDCB6.AddSortOrder(Art:Artikel_FK01)
  FDCB6.AddField(Art:ArtikelOms,FDCB6.Q.Art:ArtikelOms) !List box control field - type derived from field
  FDCB6.AddField(Art:ArtikelID,FDCB6.Q.Art:ArtikelID) !List box control field - type derived from field
  FDCB6.AddUpdateField(Art:ArtikelID,Pla:ArtikelID)
  ThisWindow.AddItem(FDCB6.WindowComponent)
  FDCB6.DefaultFill = 0
  BRW12.AskProcedure = 1                                   ! Will call: UpdateActiviteit((Ver2:Planning_DATE))
  FDB14.Init(?GNC:GNCode,Queue:FileDrop.ViewPosition,FDB14::View:FileDrop,Queue:FileDrop,Relate:GNCode,ThisWindow)
  FDB14.Q &= Queue:FileDrop
  FDB14.AddSortOrder(GNC:GNCode_PK)
  FDB14.AddField(GNC:GNCode,FDB14.Q.GNC:GNCode) !List box control field - type derived from field
  FDB14.AddField(GNC:Benaming_NL,FDB14.Q.GNC:Benaming_NL) !List box control field - type derived from field
  FDB14.AddUpdateField(GNC:GNCode,Loc:GNCode)
  ThisWindow.AddItem(FDB14.WindowComponent)
  FDB14.DefaultFill = 0
  BRW12.AddToolbarTarget(Toolbar)                          ! Browse accepts toolbar control
  BRW7.AddToolbarTarget(Toolbar)                           ! Browse accepts toolbar control
  SELF.SetAlerts()
  NetLocalRefreshDate = today()         ! NetTalk (NetRefresh)
  NetLocalRefreshTime = clock()
  DO BepaalCMRArtikelOms
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:AAPlanning.Close
    Relate:APlanning.Close
    Relate:AViewArtikel.Close
    Relate:AViewVoorraadPartij.Close
    Relate:Activiteit.Close
    Relate:ArtikelOmschrijvingExtra.Close
    Relate:Cel.Close
    Relate:ExtraKosten.Close
    Relate:GNCode.Close
    Relate:GNCodeArtikelen.Close
    Relate:Inkoop.Close
    Relate:KostenStamgeg.Close
    Relate:RelatieArtikelOmschrijving.Close
    Relate:Verpakking.Close
    Relate:ViewArtikel.Close
    Relate:ViewPlanningPartij.Close
    Relate:ViewVoorraadPartij.Close
  END
  IF SELF.Opened
    INIMgr.Update('UpdatePlanningVerkoop',QuickWindow)     ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.PrimeFields PROCEDURE

  CODE
  Pla:Valuta = Ver2:Valuta
  Pla:Koersverschil = Ver2:Koersverschil
  Pla:PlantNumber = 'NL5664EG'
  Pla:DeliveryDate_DATE = Ver2:Planning_DATE
  Pla:Transport = Loc:Transport
  PARENT.PrimeFields


ThisWindow.PrimeUpdate PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.PrimeUpdate()
    If returnValue = Level:Fatal  ! delete just occured
      ThisNetRefresh.Send('|') ! NetTalk (NetRefresh)
    End
  	!	If returnValue = Level:Fatal  ! delete just occured
  	!		NetRefreshPlanningViews()
  	!	End
  RETURN ReturnValue


ThisWindow.Reset PROCEDURE(BYTE Force=0)

  CODE
  SELF.ForcedReset += Force
  IF QuickWindow{Prop:AcceptAll} THEN RETURN.
  db.Debugout('ThisWindow.Reset:'&Force)
    NetLocalRefreshDate = today()         ! NetTalk (NetRefresh)
    NetLocalRefreshTime = clock()
  PARENT.Reset(Force)


ThisWindow.Run PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Run()
  IF SELF.Request = ViewRecord                             ! In View Only mode always signal RequestCancelled
    ReturnValue = RequestCancelled
  END
  RETURN ReturnValue


ThisWindow.Run PROCEDURE(USHORT Number,BYTE Request)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Run(Number,Request)
  IF SELF.Request = ViewRecord
    ReturnValue = RequestCancelled                         ! Always return RequestCancelled if the form was opened in ViewRecord mode
  ELSE
    GlobalRequest = Request
    UpdateActiviteit((Ver2:Planning_DATE))
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
    OF ?LeegPartij
      IF MESSAGE('Zeker weten dat er geen partij meer geselecteerd moet zijn?', 'Geen partij', ICON:Exclamation, BUTTON:Yes+BUTTON:No, BUTTON:No) = BUTTON:Yes THEN
      	DO LeegPartijCelTotaal
      END
    OF ?OK
      IF CLIP(LOC:PartijCelID) <> '' AND LOC:PartijCelID = FDCB4.Q.VVPar:PartijCelID  THEN
      	IF FDCB4.Q.LOC:BeschikbarePartijVoorraad < FDCB4.Q.LOC:BeschikbareVoorraad THEN
      		IF Pla:KG > FDCB4.Q.LOC:BeschikbarePartijVoorraad THEN
      			IF MESSAGE('Let op: Te verkopen aantal KG (' & FORMAT(Pla:KG, @N-12`2) & ' kg) is groter dan de beschikbare voorraad van de gehele partij (' & FORMAT(FDCB4.Q.LOC:BeschikbarePartijVoorraad, @N-12`2) & ' kg). Toch doorgaan?', 'Te weinig beschikbare voorraad', ICON:Exclamation, BUTTON:YES+BUTTON:NO, BUTTON:NO) = BUTTON:NO THEN
      				RETURN ReturnValue
      			.
      		END
      	ELSE
      		IF Pla:KG > FDCB4.Q.LOC:BeschikbareVoorraad THEN
      			IF MESSAGE('Let op: Te verkopen aantal KG (' & FORMAT(Pla:KG, @N-12`2) & ' kg) is groter dan de beschikbare voorraad in de cel (' & FORMAT(FDCB4.Q.LOC:BeschikbareVoorraad, @N-12`2) & ' kg). Toch doorgaan?', 'Te weinig beschikbare voorraad', ICON:Exclamation, BUTTON:YES+BUTTON:NO, BUTTON:NO) = BUTTON:NO THEN
      				RETURN ReturnValue
      			.
      		END
      	END
      END
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?Art:ArtikelOms
      ! Controleren of artikel klopt met de geselecteerde partij
      CLEAR(AVVPar:Record)
      AVVPar:PartijCelID=LOC:PartijCelID
      IF Access:AViewVoorraadPartij.TryFetch(AVVPar:PartijCelID_K) = Level:Benign
      	IF AVVPar:ArtikelID <> Pla:ArtikelID THEN
              DO LeegPartijCel
              DO LeegCelVerpakking
      	.
      ELSE
      	DO LeegPartijCel
      .
      
      DO SHowGNCode
      FDCB4.ResetQueue(false)
      DO BepaalCMRArtikelOms
      
      db.DebugOut('Accepted - ' & LOC:LastArtikelID & ' <= ' & Pla:ArtikelID & ' - ' & LOC:CMRArtikelOms)
      
      IF CLIP(LOC:LastArtikelID) <> CLIP(Pla:ArtikelID) THEN
          Pla:AlternatieveArtikelOms = LOC:CMRArtikelOms
          LOC:LastArtikelID = CLIP(Pla:ArtikelID)
          DISPLAY(?Pla:AlternatieveArtikelOms)
      END
    OF ?OvernemenButton
      ThisWindow.Update()
      Pla:AlternatieveArtikelOms = LOC:CMRArtikelOms
      DISPLAY(?Pla:AlternatieveArtikelOms)
    OF ?ChangeCMRArtikel
      ThisWindow.Update()
      CLEAR(RAO:Record)
      RAO:RelatieID = Ver2:Klant
      RAO:ArtikelID = Pla:ArtikelID
      IF Access:RelatieArtikelOmschrijving.Fetch(RAO:FK1_RelatieArtikelOmschrijving) = Level:Benign THEN
          GlobalRequest = ChangeRecord
          UpdateRelatieArtikelOmschrijving()
      ELSE
          IF Ver2:Klant > 0 AND Pla:ArtikelID > 0 THEN
              CLEAR(RAO:Record)
              RAO:RelatieID = Ver2:Klant
              RAO:ArtikelID = Pla:ArtikelID
              GlobalRequest = InsertRecord
              UpdateRelatieArtikelOmschrijving()
          END
      END
      
      LOC:CMRArtikelOms = GlobalClass.CMRArtikelOms(Ver2:Klant, Pla:ArtikelID)
    OF ?VVPar:PartijCelID
      IF NOT(CLIP(LOC:PartijCelID)='')
          Pla:VerpakkingID = LOC:VerpakkingID
          Pla:CelID = LOC:CelID
      	
          ! 
          PLA:PartijID=SUB(LOC:PartijCelID,1,5)
          db.DebugOut('PartijAccepted:'&Pla:VerpakkingID&','&Pla:CelID&','&PLA:PartijID)
      
      	!IF NOT(EVENT() = EVENT:Completed)
          CLEAR(Ver:record)
          Ver:VerpakkingID=Pla:VerpakkingID
          Access:Verpakking.TryFetch(Ver:Verpakking_PK)
      
          CLEAR(Cel:Record)
          Cel:CelID=Pla:CelID
          Access:Cel.TryFetch(Cel:CEL_PK)
      
          DISABLE(?Ver:VerpakkingOmschrijving)
          DISABLE(?CEL:CelOms)
          ENABLE(?NeemVoorraad)
          ENABLE(?LeegPartij)
      
          DISPLAY(?Ver:VerpakkingOmschrijving)
          DISPLAY(?Cel:CelOms)
      
          IF Pla:KG = 0 !OR Pla:KG > VVPar:VoorraadKG
              IF FDCB4.Q.LOC:BeschikbarePartijVoorraad < FDCB4.Q.LOC:BeschikbareVoorraad THEN
                  Pla:KG = FDCB4.Q.LOC:BeschikbarePartijVoorraad
              ELSE
                  Pla:KG = FDCB4.Q.LOC:BeschikbareVoorraad
              END
          .
      
          IF Pla:Pallets = 0 !OR Pla:Pallets > VVPar:VoorraadPallets
              Pla:Pallets = VVPar:VoorraadPallets
          .
          IF Pla:PartijID<>0
              Clear(Par:Record)
              Par:PartijID=Pla:PartijID
              IF Access:Partij.Fetch(Par:Partij_PK)=Level:Benign
                  Clear(AREL:Record)
                  AREL:RelatieID=Par:Leverancier
                  IF Access:ARelatie.Fetch(ARel:Relatie_PK)=Level:Benign
                      Pla:LotID = AREL:LotID
                      Display(?Pla:LotID)
                  ELSE
                      db.DebugOut('Relatie '&Par:Leverancier&' niet gevonden')
                  END
              ELSE
                  db.DebugOut('Partij '&Pla:PartijID&' niet gevonden')
              END
          END
      
              
      	!.
      ELSE
          DO LeegPartijCel
          db.DebugOut('LeegPartijCel3')
      END
    OF ?Pla:KG
      DO UpdatePartijFilter
      ! Als KG wordt ingevoerd automatisch de dozen berekenen
      IF 0{PROP:AcceptAll}=FALSE 
          !IF Pla:Dozen=0 AND Ver:InhoudKG<>0
          IF Ver:InhoudKG<>0
              Pla:Dozen=Pla:KG/Ver:InhoudKG
              DISPLAY(?Pla:Dozen)
          END
      END
      
    OF ?Pla:Pallets
      ! Als GrossWeight berekening wordt ingevoerd automatisch de dozen berekenen
      IF 0{PROP:AcceptAll}=FALSE 
          Pla:GrossWeight=Pla:KG+(Pla:Dozen*Loc:GewichtDoos)+Pla:Pallets*Loc:GewichtPallet
          DISPLAY(?Pla:GrossWeight)
      END
      
    OF ?Pla:Dozen
      ! Als GrossWeight berekening wordt ingevoerd automatisch de dozen berekenen
      IF 0{PROP:AcceptAll}=FALSE 
          Pla:GrossWeight=Pla:KG+(Pla:Dozen*Loc:GewichtDoos)+Pla:Pallets*Loc:GewichtPallet
          DISPLAY(?Pla:GrossWeight)
      END
      
    OF ?NeemVoorraad
      ThisWindow.Update()
      IF NOT(CLIP(LOC:PartijCelID) = '')
      	Pla:KG = VVPar:VoorraadKG
      	Pla:Pallets = VVPar:VoorraadPallets
      	DISPLAY(?Pla:KG)
      	DISPLAY(?Pla:Pallets)
      .
    OF ?Pla:LotID
      IF Pla:PartijID<>0
          Clear(Par:Record)
          Par:PartijID=Pla:PartijID
          IF Access:Partij.Fetch(Par:Partij_PK)=Level:Benign
              Clear(AREL:Record)
              AREL:RelatieID=Par:Leverancier
              IF Access:ARelatie.Fetch(ARel:Relatie_PK)=Level:Benign
                  IF Pla:LotID<>AREL:LotID
                      IF Message('Wilt u LotID '&Pla:LotID&' standaard maken voor de Leverancier '&AREL:FirmaNaam,'LotID verschilt',ICON:Question,Button:Yes+Button:No,Button:Yes)=Button:Yes
                          AREL:LotID=Pla:LotID
                          Access:ARelatie.Update()
              
                      END
                  END
              ELSE
                  Message('Relatiegegevens kunnen niet opgehaald worden:'&ERROR())
              END
      
          END
      
      END
      
      
    OF ?GNC:GNCode
      ! Toevoegen aan de Code
      IF Loc:GNCode<>'' AND 0{PROP:AcceptAll}=FALSE
          Clear(GNA:Record)
          GNA:GNCode=Loc:GNCode
          GNA:ArtikelID=Pla:ArtikelID
          Access:GNCodeArtikelen.Insert()
          ?GNC:GNCode{PROP:Disable}=TRUE
      END
    OF ?OK
      ThisWindow.Update()
      IF SELF.Request = ViewRecord AND NOT SELF.BatchProcessing THEN
         POST(EVENT:CloseWindow)
      END
    OF ?KoppelOverboeking
      ThisWindow.Update()
      ! Overboeking koppelen
      db.DebugOut('UpdatePlanningVerkoop1:' & ThisWindow.Request)
      
      LOC:FileID = Access:Planning.SaveFile()
      LOC:BufferID = Access:Planning.SaveBuffer()
      
      AAPla:Record = Pla:Record
      
      IF (AAPla:OverboekingPlanningID > 0)
      	CLEAR(APla:Record)
      	APla:PlanningID = AAPla:OverboekingPlanningID
      	IF (Access:APlanning.TryFetch(APla:PK_Planning) <> Level:Benign)
      		CLEAR(APla:Record)
      	END
      END
      
      IF (AAPla:OverboekingPlanningID > 0 AND AAPla:OverboekingPlanningID = APla:PlanningID) THEN
      	Action# = ChangeRecord
      ELSE
      	Access:APlanning.PrimeRecord(0)
      	Access:APlanning.TryInsert()
      	
      	Action# = InsertRecord
      END
      
      GlobalRequest = ChangeRecord
      
      db.DebugOut('UpdatePlanningVerkoop2:' & GlobalRequest)
      
      UpdateAOverboeking(Action#, AAPla:ArtikelID, CLIP(FORMAT(AAPla:PartijID, @N05)) & '.' & CLIP(AAPla:CelID), AAPla:CelLocatieID, AAPla:PlanningID, AAPla:KG)
      
      IF GlobalResponse = RequestCompleted THEN
      	db.DebugOut('RequestCompleted:' & APla:PlanningID)
      	NewPlanningID# = APla:PlanningID
      	Access:Planning.RestoreFile(LOC:FileID)
      	Access:Planning.RestoreBuffer(LOC:BufferID)
      	db.DebugOut('RequestCompleted2:' & Pla:PlanningID & ',' & APla:PlanningID)
      	Pla:OverboekingPlanningID = NewPlanningID#	
      ELSE
      	IF Action# = InsertRecord
      		Access:APlanning.DeleteRecord(0)
      	END
      	
      	db.DebugOut('RequestCancelled')
      	Access:Planning.RestoreFile(LOC:FileID)
      	Access:Planning.RestoreBuffer(LOC:BufferID)
      END
      
      db.DebugOut('UpdatePlanningVerkoop3:' & ThisWindow.Request)
      
      DO RefreshKoppelOverboeking
    OF ?DeleteOverboeking
      ThisWindow.Update()
      IF(ThisWindow.DeleteGekoppeldeOverboeking()) THEN
      	DO RefreshKoppelOverboeking
      END
    END
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue


ThisWindow.TakeCloseEvent PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  IF SELF.Response = RequestCancelled THEN
  	IF SELF.Request = InsertRecord THEN
  		IF Pla:OverboekingPlanningID > 0 THEN
  			MESSAGE('Er is een overboeking gekoppeld aan deze verkoopregel. Wijziging annuleren kan daarom niet.','Annuleren niet mogelijk', ICON:Exclamation)
  			RETURN Level:Notify
  		END
  	ELSIF SELF.Request = ChangeRecord THEN
  		IF Pla:OverboekingPlanningID <> LOC:OverboekingPlanningID THEN
  			MESSAGE('Gekoppelde overboeking is gewijzigd/verwijderd. Deze wijziging annuleren kan daarom niet.', 'Annuleren niet mogelijk', ICON:Exclamation)
  			RETURN Level:Notify
  		END
  	END
  END
  ReturnValue = PARENT.TakeCloseEvent()
  RETURN ReturnValue


ThisWindow.TakeCompleted PROCEDURE

ReturnValue          BYTE,AUTO

Looped BYTE
  CODE
  LOOP
    IF Looped
      RETURN Level:Notify
    ELSE
      Looped = 1
    END
  LOC:ArtikelID = Pla:ArtikelID
  LOC:Planning = Pla:Planning
  LOC:VerpakkingID2 = Pla:VerpakkingID
  LOC:CelID2 = Pla:CelID
  LOC:Memo = Pla:Memo
  LOC:Instructie = Pla:Instructie
  LOC:Transport = Pla:Transport
  LOC:VerkoopKGPrijs = Pla:VerkoopKGPrijs
  Loc:LotID=Pla:LotID
  Loc:PlantNumber=Pla:PlantNumber
  Loc:DeliveryDate=Pla:DeliveryDate
  Loc:Valuta=Pla:Valuta
  ReturnValue = PARENT.TakeCompleted()
  Pla:ArtikelID = LOC:ArtikelID
  Pla:Planning = LOC:Planning
  Pla:VerpakkingID = LOC:VerpakkingID2
  Pla:CelID = LOC:CelID2
  Pla:Memo = LOC:Memo
  Pla:Instructie = LOC:Instructie
  Pla:Transport = LOC:Transport
  Pla:VerkoopKGPrijs = LOC:VerkoopKGPrijs
  Pla:LotID=Loc:LotID
  Pla:PlantNumber=Loc:PlantNumber
  Pla:DeliveryDate=Loc:DeliveryDate
  Pla:Valuta=Loc:Valuta
    ThisNetRefresh.Send('|') ! NetTalk (NetRefresh)
  ! NetRefreshPlanningViews()
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue


ThisWindow.TakeEvent PROCEDURE

ReturnValue          BYTE,AUTO

Looped BYTE
  CODE
  !If ThisNetRefresh.NeedReset(NetLocalRefreshDate,NetLocalRefreshTime,NetLocalDependancies) ! NetTalk (NetRefresh)
  !    db.Debugout('Refresh')
  !  End
    If ThisNetRefresh.NeedReset(NetLocalRefreshDate,NetLocalRefreshTime,NetLocalDependancies) ! NetTalk (NetRefresh)
      Self.Reset(1)                      ! NetTalk (NetRefresh)
    End
  LOOP                                                     ! This method receives all events
    IF Looped
      RETURN Level:Notify
    ELSE
      Looped = 1
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
  CASE FIELD()
  OF ?ExtraKostenList
    CASE EVENT()
    OF EVENT:PreAlertKey
      IF Keycode()=MouseRight2
          CYCLE
      END
    END
  END
  ReturnValue = PARENT.TakeFieldEvent()
  CASE FIELD()
  OF ?ExtraKostenList
    CASE EVENT()
    OF EVENT:AlertKey
      IF KeyCODE()=MouseLeft2
          Rij#=?ExtraKostenList{PROPLIST:MouseDownRow}
          GET(BRW7.Q,Rij#)
          IF NOT ERROR()
              Clear(Ext:Record)
              Ext:PlanningID=Pla:PlanningID
              Ext:KostenID=BRW7.Q.Kos:KostenID
              IF Access:ExtraKosten.Fetch(Ext:FK3_ExtraKosten)
                  Access:ExtraKosten.PrimeRecord()
                  Ext:PlanningID=Pla:PlanningID
                  Ext:KostenID=BRW7.Q.Kos:KostenID
                  Ext:Prijs=BRW7.Q.Ext:Prijs
                  Access:ExtraKosten.Insert()
                  Clear(Ext:Record)
                  Ext:PlanningID=Pla:PlanningID
                  Ext:KostenID=BRW7.Q.Kos:KostenID
                  Access:ExtraKosten.Fetch(Ext:FK3_ExtraKosten)
              END
              GlobalRequest=ChangeRecord
              UpdateExtraKosten
              BRW7.ResetQueue(true)  
              BRW7.ResetFromView()    ! hier wordt het totaal pas bijgewerkt
          END
          CYCLE
      END
    END
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
    CASE FIELD()
    OF ?Pla:Dozen
      IF 0{PROP:AcceptAll}=FALSE 
          ?Pla:Dozen{PROP:Touched}=TRUE
      END
      
    END
  ReturnValue = PARENT.TakeSelected()
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

ThisWindow.DeleteGekoppeldeOverboeking PROCEDURE()

  CODE
  IF (Pla:OverboekingPlanningID > 0)
  	CLEAR(APla:Record)
  	APla:PlanningID = Pla:OverboekingPlanningID
  	IF (Access:APlanning.TryFetch(APla:PK_Planning) = Level:Benign)
  		IF APla:MutatieGemaakt THEN
  			MESSAGE('Mutaties zijn al gemaakt voor deze overboeking, de overboeking kan daarom niet verwijderd worden.')
  			RETURN False
  		ELSE
  			Access:APlanning.DeleteRecord(0)
  			Pla:OverboekingPlanningID = 0
  			RETURN True
  		END
  	END
  END
  
  RETURN True



FDCB4.SetQueueRecord PROCEDURE

  CODE
  LOC:VerkoopKG = VPPar:VerkoopKG
  LOC:PartijVerkoopKG = VPParT:VerkoopKG
  
  IF VVPar:PartijCelID = LOC:OrigineelPartijCelID_TMP THEN
  	LOC:VerkoopKG -= LOC:OrigineelVerkoopKG
  .
  
  IF VVPar:PartijID = LOC:OrigineelPartijID THEN
  	LOC:PartijVerkoopKG -= LOC:OrigineelVerkoopKG
  END
  
  LOC:BeschikbareVoorraad = VVPar:VoorraadKG - LOC:VerkoopKG
  LOC:BeschikbarePartijVoorraad = VVParT:VoorraadKG - LOC:PartijVerkoopKG
  PARENT.SetQueueRecord
  
  SELF.Q.VVParT:VoorraadKG_Style = 0 ! 


BRW12.Init PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)

  CODE
  PARENT.Init(ListBox,Posit,V,Q,RM,WM)
  IF WM.Request <> ViewRecord                              ! If called for anything other than ViewMode, make the insert, change & delete controls available
    SELF.InsertControl=?Insert
    SELF.ChangeControl=?Change
    SELF.DeleteControl=?Delete
  END


BRW12.PrimeRecord PROCEDURE(BYTE SuppressClear = 0)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.PrimeRecord(SuppressClear)
  ACT:PlanningID = Pla:PlanningID
  ACT:Datum = TODAY()
  RETURN ReturnValue


BRW12.SetAlerts PROCEDURE

  CODE
  SELF.EditViaPopup = False
  PARENT.SetAlerts


BRW7.ResetFromView PROCEDURE

Pla:ExtraKosten:Sum  REAL                                  ! Sum variable for browse totals
  CODE
  SETCURSOR(Cursor:Wait)
  Relate:KostenStamgeg.SetQuickScan(1)
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
    Pla:ExtraKosten:Sum += Ext:ExtraKosten
  END
  SELF.View{PROP:IPRequestCount} = 0
  Pla:ExtraKosten = Pla:ExtraKosten:Sum
  PARENT.ResetFromView
  Relate:KostenStamgeg.SetQuickScan(0)
  SETCURSOR()


BRW7.SetQueueRecord PROCEDURE

  CODE
      ! als bij de kostengege de prijs is ingevoerd deze hier overnemen
  Clear(Ext:Record)
  Ext:PlanningID=Pla:PlanningID
  Ext:KostenID=Kos:KostenID
  IF Access:ExtraKosten.Fetch(Ext:FK3_ExtraKosten)
      Ext:Prijs=Kos:Prijs
  ELSE
      ! dan laat hij het sowiesow goed zien
  END
  PARENT.SetQueueRecord
  

