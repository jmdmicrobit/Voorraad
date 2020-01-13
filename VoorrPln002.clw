

   MEMBER('VoorrPln.clw')                                  ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABDROPS.INC'),ONCE
   INCLUDE('ABPOPUP.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABUTIL.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('VOORRPLN002.INC'),ONCE        !Local module procedure declarations
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
                             ENTRY(@D6-B),AT(433,124,50,10),USE(Pla:UitslagPalletbladProductionDate11_DATE)
                             PROMPT('THT (15):'),AT(362,137),USE(?Pla:UitslagPalletbladSellByDate15_DATE:Prompt)
                             ENTRY(@D6-B),AT(433,140,50,10),USE(Pla:UitslagPalletbladSellByDate15_DATE)
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
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
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
  SELF.AddUpdateFile(Access:Planning)
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
  

!!! <summary>
!!! Generated from procedure template - Window
!!! Form Planning
!!! </summary>
UpdateAOverboeking PROCEDURE (PRM:Request, PRM:ArtikelID, PRM:PartijCelID,PRM:CelLocatieID, PRM:OverboekingPlanningID, PRM:KG)

CurrentTab           STRING(80)                            ! 
ActionMessage        CSTRING(40)                           ! 
LOC:VerpakkingID     LONG                                  ! 
LOC:CelID            LONG                                  ! 
LOC:VoorraadKG       LONG                                  ! 
LOC:VoorraadPallets  LONG                                  ! 
LOC:PartijCelID      CSTRING(26)                           ! 
LOC:ArtikelID        CSTRING(31)                           ! 
LOC:Planning         STRING(8)                             ! 
LOC:VerpakkingID2    LONG                                  ! 
LOC:CelID2           LONG                                  ! 
LOC:Memo             CSTRING(101)                          ! 
LOC:Instructie       CSTRING(101)                          ! 
LOC:Transport        CSTRING(101)                          ! 
LOC:PressedOK        BYTE                                  ! 
LOC:BeschikbareVoorraad DECIMAL(9,2)                       ! 
LOC:OrigineelPartijCelID CSTRING(26)                       ! 
LOC:OrigineelVerkoopKG DECIMAL(9,2)                        ! 
LOC:VerkoopKG        DECIMAL(9,2)                          ! 
FDCB7::View:FileDropCombo VIEW(ViewArtikel)
                       PROJECT(Art:ArtikelOms)
                     END
FDCB8::View:FileDropCombo VIEW(Verpakking)
                       PROJECT(Ver:VerpakkingOmschrijving)
                     END
FDCB9::View:FileDropCombo VIEW(Cel)
                       PROJECT(CEL:CelOms)
                       PROJECT(CEL:CelID)
                     END
FDCB4::View:FileDropCombo VIEW(ViewVoorraadPartij)
                       PROJECT(VVPar:PartijCelID)
                       PROJECT(VVPar:VoorraadKG)
                       PROJECT(VVPar:CelID)
                       PROJECT(VVPar:PartijID)
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
                         PROJECT(VPPar:PartijCelID)
                       END
                       JOIN(VPParT:PK_ViewPlanningPartijTotaal,VVPar:PartijID)
                         PROJECT(VPParT:VerkoopKG)
                         PROJECT(VPParT:PartijID)
                       END
                       JOIN(VVParT:PK_ViewVoorraadPartijTotaal,VVPar:PartijID)
                         PROJECT(VVParT:VoorraadKG)
                         PROJECT(VVParT:PartijID)
                       END
                     END
FDCB13::View:FileDropCombo VIEW(AAACel)
                       PROJECT(AAACel:CelOms)
                       PROJECT(AAACel:CelID)
                     END
FDCB14::View:FileDropCombo VIEW(ACelLocatie)
                       PROJECT(ACL:Locatienaam)
                       PROJECT(ACL:CelLocatieID)
                     END
Queue:FileDropCombo  QUEUE                            !
Art:ArtikelOms         LIKE(Art:ArtikelOms)           !List box control field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
Queue:FileDropCombo:1 QUEUE                           !
Ver:VerpakkingOmschrijving LIKE(Ver:VerpakkingOmschrijving) !List box control field - type derived from field
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
Par:PartijID           LIKE(Par:PartijID)             !List box control field - type derived from field
Par:ExternPartijnr     LIKE(Par:ExternPartijnr)       !List box control field - type derived from field
VVParT:VoorraadKG      LIKE(VVParT:VoorraadKG)        !List box control field - type derived from field
VPParT:VerkoopKG       LIKE(VPParT:VerkoopKG)         !List box control field - type derived from field
Par:AanmaakDatum_DATE  LIKE(Par:AanmaakDatum_DATE)    !List box control field - type derived from field
ACel:CelOms            LIKE(ACel:CelOms)              !List box control field - type derived from field
VVPar:VoorraadKG       LIKE(VVPar:VoorraadKG)         !List box control field - type derived from field
LOC:VerkoopKG          LIKE(LOC:VerkoopKG)            !List box control field - type derived from local data
LOC:BeschikbareVoorraad LIKE(LOC:BeschikbareVoorraad) !List box control field - type derived from local data
AREL:FirmaNaam         LIKE(AREL:FirmaNaam)           !List box control field - type derived from field
AVP:VerpakkingOmschrijving LIKE(AVP:VerpakkingOmschrijving) !List box control field - type derived from field
ACel:CelID             LIKE(ACel:CelID)               !Related join file key field - type derived from field
AREL:RelatieID         LIKE(AREL:RelatieID)           !Related join file key field - type derived from field
AVP:VerpakkingID       LIKE(AVP:VerpakkingID)         !Related join file key field - type derived from field
VPPar:PartijCelID      LIKE(VPPar:PartijCelID)        !Related join file key field - type derived from field
VPParT:PartijID        LIKE(VPParT:PartijID)          !Related join file key field - type derived from field
VVParT:PartijID        LIKE(VVParT:PartijID)          !Related join file key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
Queue:FileDropCombo:4 QUEUE                           !
AAACel:CelOms          LIKE(AAACel:CelOms)            !List box control field - type derived from field
AAACel:CelID           LIKE(AAACel:CelID)             !Browse hot field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
Queue:FileDropCombo:5 QUEUE                           !
ACL:Locatienaam        LIKE(ACL:Locatienaam)          !List box control field - type derived from field
ACL:CelLocatieID       LIKE(ACL:CelLocatieID)         !Primary key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
LocEnableEnterByTab  BYTE(1)                               !Used by the ENTER Instead of Tab template
EnterByTabManager    EnterByTabClass
History::APla:Record LIKE(APla:RECORD),THREAD
QuickWindow          WINDOW('Form Planning'),AT(,,367,306),FONT('MS Sans Serif',8,,,CHARSET:DEFAULT),DOUBLE,CENTER, |
  GRAY,IMM,MDI,HLP('UpdatePlanning'),SYSTEM
                       SHEET,AT(4,4,355,282),USE(?CurrentTab)
                         TAB('&1) General'),USE(?Tab:1)
                           PROMPT('Artikel:'),AT(9,26),USE(?APla:ArtikelID:Prompt),TRN
                           COMBO(@s60),AT(69,27,282,10),USE(Art:ArtikelOms),DROP(25),FORMAT('240L(2)~Omschrijving~L(3)@s60@'), |
  FROM(Queue:FileDropCombo),REQ
                           PROMPT('Partij:'),AT(9,42),USE(?PROMPT1)
                           COMBO(@s25),AT(69,42,177,10),USE(VVPar:PartijCelID),DROP(25,700),FORMAT('0L(2)|~Partij.' & |
  'Cel~C(0)@s25@[39R(2)|M~Intern~C(0)@n-14.@45L(2)|M~Extern~C(1)@s20@52R(2)|M~Voorraad ' & |
  '(KG)~C(0)@n-12`2@54R(2)|M~Verkocht (KG)~C(0)@n-12`2@47L(2)|~Inslagdatum~C(0)@d17@](2' & |
  '51)|~Partij~[40L(2)|M~Cel~C(0)@s50@50R(2)|M~Voorraad (KG)~C(0)@n-12`2@55R(2)|M~Verko' & |
  'cht (KG)~C(0)@n-13`2@78R(2)|M~Beschikbaar (KG)~C(0)@n-13`2@](211)|~Cel~74L(2)|M~Leve' & |
  'rancier~C(0)@s50@80L(2)|M~Verpakking~C(0)@s50@'),FROM(Queue:FileDropCombo:3),IMM
                           PROMPT('Verpakking:'),AT(9,58),USE(?APla:VerpakkingID:Prompt),TRN
                           COMBO(@s50),AT(69,58,282,10),USE(Ver:VerpakkingOmschrijving),DROP(25),FORMAT('200L(2)~Om' & |
  'schrijving~L(3)@s50@'),FROM(Queue:FileDropCombo:1),IMM
                           PROMPT('Van Cel:'),AT(9,73),USE(?APla:CelID:Prompt),TRN
                           COMBO(@s50),AT(69,74,282,10),USE(CEL:CelOms),DROP(25),FORMAT('200L(2)~Omschrijving~L(3)@s50@'), |
  FROM(Queue:FileDropCombo:2),IMM
                           PROMPT('Tot Cel:'),AT(9,99),USE(?PROMPT2)
                           COMBO(@s50),AT(69,100,282,10),USE(AAACel:CelOms),DROP(5),FORMAT('200L(2)|M~Omschrijving~@s50@'), |
  FROM(Queue:FileDropCombo:4),IMM
                           PROMPT('KG:'),AT(9,130),USE(?APla:KG:Prompt),TRN
                           COMBO(@s50),AT(69,115,282,10),USE(ACL:Locatienaam),VSCROLL,DROP(25),FORMAT('200L(2)|M~L' & |
  'ocatienaam~L(0)@s50@'),FROM(Queue:FileDropCombo:5),IMM
                           ENTRY(@n12_`2),AT(70,130,64,10),USE(APla:KG),RIGHT(2),REQ
                           PROMPT('Pallets:'),AT(9,146),USE(?APla:Pallets:Prompt),TRN
                           ENTRY(@n14),AT(70,146,64,10),USE(APla:Pallets),RIGHT(2)
                           PROMPT('Datum:'),AT(9,161),USE(?APla:Planning_DATE:Prompt),TRN
                           ENTRY(@d6-),AT(70,161,64,10),USE(APla:Planning_DATE),RIGHT(2)
                           BUTTON('...'),AT(137,159,12,12),USE(?Calendar)
                           PROMPT('Tijdstip:'),AT(173,162),USE(?APla:Planning_TIME:Prompt),TRN
                           ENTRY(@t7),AT(205,162,41,10),USE(APla:Planning_TIME),RIGHT(2)
                           PROMPT('Instructie:'),AT(9,175),USE(?APla:Instructie:Prompt),CENTER
                           PROMPT('Transport:'),AT(9,231),USE(?APla:Transport:Prompt)
                           BUTTON('Leeg'),AT(251,40,34),USE(?LeegPartij)
                           BUTTON('Neem voorraad'),AT(287,40),USE(?NeemVoorraad)
                           STRING('Locatie:'),AT(19,114),USE(?STRING1)
                           PROMPT('Locatie:'),AT(21,86),USE(?PROMPT3),HIDE
                           STRING(@S10),AT(68,88),USE(CL:Locatienaam,,?CL:Locatienaam:2),FONT('Microsoft Sans Serif', |
  ,,FONT:bold),HIDE
                           TEXT,AT(70,175,280),USE(APla:Instructie,,?APla:Instructie:2)
                           TEXT,AT(70,230,279),USE(APla:Transport,,?APla:Transport:2)
                         END
                       END
                       BUTTON('&OK'),AT(244,290,49,14),USE(?OK),LEFT,ICON('WAOK.ICO'),DEFAULT,FLAT,MSG('Accept dat' & |
  'a and close the window'),TIP('Accept data and close the window')
                       BUTTON('&Annuleren'),AT(296,290,69,14),USE(?Cancel),LEFT,ICON('WACANCEL.ICO'),FLAT,MSG('Cancel operation'), |
  TIP('Cancel operation')
                       STRING(@N_10),AT(309,4),USE(APla:PlanningID)
                     END

    omit('***',WE::CantCloseNowSetHereDone=1)  !Getting Nested omit compile error, then uncheck the "Check for duplicate CantCloseNowSetHere variable declaration" in the WinEvent local template
WE::CantCloseNowSetHereDone equate(1)
WE::CantCloseNowSetHere     long
    !***
ThisWindow           CLASS(WindowManager)
Ask                    PROCEDURE(),DERIVED
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
PrimeUpdate            PROCEDURE(),BYTE,PROC,DERIVED
Run                    PROCEDURE(),BYTE,PROC,DERIVED
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED
TakeCompleted          PROCEDURE(),BYTE,PROC,DERIVED
TakeEvent              PROCEDURE(),BYTE,PROC,DERIVED
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
FDCB7                CLASS(FileDropComboClass)             ! File drop combo manager
Q                      &Queue:FileDropCombo           !Reference to browse queue type
                     END

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

FDCB13               CLASS(FileDropComboClass)             ! File drop combo manager
Q                      &Queue:FileDropCombo:4         !Reference to browse queue type
                     END

FDCB14               CLASS(FileDropComboClass)             ! File drop combo manager
Q                      &Queue:FileDropCombo:5         !Reference to browse queue type
                     END

Resizer              CLASS(WindowResizeClass)
Init                   PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)
                     END

Calendar11           CalendarClass
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
!---------------------------------------------------------------------------

ThisWindow.Ask PROCEDURE

  CODE
  CASE SELF.Request                                        ! Configure the action message text
  OF ViewRecord
    ActionMessage = 'View Record'
  OF InsertRecord
    ActionMessage = 'Overboeking wordt toegevoegd'
  OF ChangeRecord
    ActionMessage = 'Record Will Be Changed'
  END
  QuickWindow{PROP:Text} = ActionMessage                   ! Display status message in title bar
  PARENT.Ask


ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('UpdateAOverboeking')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?APla:ArtikelID:Prompt
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.HistoryKey = CtrlH
  SELF.AddHistoryFile(APla:Record,History::APla:Record)
  SELF.AddHistoryField(?APla:KG,5)
  SELF.AddHistoryField(?APla:Pallets,6)
  SELF.AddHistoryField(?APla:Planning_DATE,9)
  SELF.AddHistoryField(?APla:Planning_TIME,10)
  SELF.AddHistoryField(?APla:Instructie:2,20)
  SELF.AddHistoryField(?APla:Transport:2,21)
  SELF.AddHistoryField(?APla:PlanningID,1)
  SELF.AddUpdateFile(Access:APlanning)
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  Relate:AAACel.Open                                       ! File AAACel used by this procedure, so make sure it's RelationManager is open
  Relate:ACelLocatie.Open                                  ! File ACelLocatie used by this procedure, so make sure it's RelationManager is open
  Relate:APlanning.Open                                    ! File APlanning used by this procedure, so make sure it's RelationManager is open
  Relate:Cel.SetOpenRelated()
  Relate:Cel.Open                                          ! File Cel used by this procedure, so make sure it's RelationManager is open
  Relate:Mutatie.Open                                      ! File Mutatie used by this procedure, so make sure it's RelationManager is open
  Relate:Relatie.SetOpenRelated()
  Relate:Relatie.Open                                      ! File Relatie used by this procedure, so make sure it's RelationManager is open
  Relate:Verpakking.Open                                   ! File Verpakking used by this procedure, so make sure it's RelationManager is open
  Relate:ViewArtikel.Open                                  ! File ViewArtikel used by this procedure, so make sure it's RelationManager is open
  Relate:ViewPlanningPartij.Open                           ! File ViewPlanningPartij used by this procedure, so make sure it's RelationManager is open
  Relate:ViewVoorraadPartij.Open                           ! File ViewVoorraadPartij used by this procedure, so make sure it's RelationManager is open
  Access:CelLocatie.UseFile                                ! File referenced in 'Other Files' so need to inform it's FileManager
  SELF.FilesOpened = True
  SELF.Primary &= Relate:APlanning
  IF SELF.Request = ViewRecord AND NOT SELF.BatchProcessing ! Setup actions for ViewOnly Mode
    SELF.InsertAction = Insert:None
    SELF.DeleteAction = Delete:None
    SELF.ChangeAction = Change:None
    SELF.CancelAction = Cancel:Cancel
    SELF.OkControl = 0
  ELSE
    SELF.ChangeAction = Change:Caller                      ! Changes allowed
    SELF.CancelAction = Cancel:Cancel                      ! No confirm cancel
    SELF.OkControl = ?OK
    IF SELF.PrimeUpdate() THEN RETURN Level:Notify.
  END
  SELF.Open(QuickWindow)                                   ! Open window
  	IF PRM:Request = InsertRecord THEN
  		APla:VerkoopID = 0
  		APla:InkoopID = 0
  		APla:ArtikelID = PRM:ArtikelID
  		LOC:PartijCelID = PRM:PartijCelID
  		APla:OverboekingCelID = 0
  		APla:CelLocatieID = 0
  		!APla:CelLocatieID = PRM:CelLocatieID
  		APla:KG = PRM:KG
  		APla:Pallets = 0
  		APla:Geprint = false
  		APla:Verwerkt = false
  		APla:MutatieGemaakt = false
  		APla:Leverancier = 0
  		APla:OverboekingCelID = 0
  		APla:Instructie = ''
  		APla:Transport = ''
  		APla:PartijID = 0
  		APla:Memo = ''
  		APla:OverboekingPlanningID = PRM:OverboekingPlanningID
  		
  		CLEAR(VVPar:Record)
  		VVPar:PartijCelID = LOC:PartijCelID
  		IF (Access:ViewVoorraadPartij.TryFetch(VVPar:PartijCelID_K) = Level:Benign)
  			APla:CelID = VVPar:CelID
  			APla:VerpakkingID = VVPar:VerpakkingID
  		.
  		!Message(PRM:CelLocatieID,'PRM:CelLocatieID')
  		CL:CelLocatieID=PRM:CelLocatieID
  		Access:CelLocatie.Fetch(CL:PK_CelLocatie)
  		
  		APla:Planning_DATE = TODAY()
  		APla:Planning_TIME = CLOCK()
  	ELSIF PRM:Request = ChangeRecord THEN
  		IF APla:Verwerkt = TRUE OR APla:MutatieGemaakt = TRUE THEN
  			! Aanpassen, niet hier (zit geen voorraadcontrole op), maar in het voorraadverloop
  			MESSAGE('Geplande overboeking is reeds omgezet in voorraad-mutaties, wijzig deze in het voorraad-verloop')
  			RETURN RequestCancelled
  		.
  
  		IF APla:PartijID <> 0 AND APla:CelID <> 0
  			LOC:PartijCelID = CLIP(FORMAT(APla:PartijID, @N05)) & '.' & CLIP(APla:CelID)
  		ELSE
  			LOC:PartijCelID = ''
  		END
  	END
  
  	LOC:OrigineelPartijCelID = LOC:PartijCelID
  	LOC:OrigineelVerkoopKG = APla:KG
  
  	CLEAR(VVPar:Record)
  	VVPar:PartijCelID = LOC:PartijCelID
  	IF (Access:ViewVoorraadPartij.TryFetch(VVPar:PartijCelID_K) <> Level:Benign)
  		LOC:PartijCelID = ''
  		APla:PartijID=0
  		CLEAR(VVPar:Record)
  	ELSE
  		IF VVPar:ArtikelID <> APla:ArtikelID THEN
  			LOC:PartijCelID = ''
  			APla:PartijID=0
  			CLEAR(VVPar:Record)
  		.
  	.
  
  	IF NOT(LOC:PartijCelID='')
  		DISABLE(?Ver:VerpakkingOmschrijving)
  		DISABLE(?Cel:CelOms)
  	ELSE
  		DISABLE(?NeemVoorraad)
  		DISABLE(?LeegPartij)
  	.
  	
  	CLEAR(CEL:Record)
  	Cel:CelID=APla:CelID
  	IF (Access:Cel.TryFetch(Cel:Cel_PK) <> Level:Benign) THEN CLEAR(CEL:Record).
  
  	CLEAR(AAACel:Record)
  	AAACel:CelID = APla:OverboekingCelID
  	IF (Access:AAACel.TryFetch(AAACel:Cel_PK) <> Level:Benign) THEN CLEAR(AAACEL:Record).
  
  	CLEAR(ACL:Record)
  	ACL:CelLocatieID = APla:CelLocatieID
  	IF (Access:ACelLocatie.TryFetch(ACel:CEL_PK) <> Level:Benign) THEN CLEAR(ACL:Record).
  
  	LOC:PressedOK = false
  
      IF GLO:HidePlanningInstructie = 1 THEN
          HIDE(?APla:Instructie:2)
          HIDE(?APla:Instructie:Prompt)
          ?APla:Transport:2{Prop:Ypos} = 175
          ?APla:Transport:2{Prop:Height} = 110        
          ?APla:Transport:Prompt{Prop:Ypos} = 175
      END
  WinAlertMouseZoom()
  Do DefineListboxStyle
  IF SELF.Request = ViewRecord                             ! Configure controls for View Only mode
    DISABLE(?Art:ArtikelOms)
    DISABLE(?VVPar:PartijCelID)
    DISABLE(?Ver:VerpakkingOmschrijving)
    DISABLE(?CEL:CelOms)
    DISABLE(?AAACel:CelOms)
    DISABLE(?ACL:Locatienaam)
    ?APla:KG{PROP:ReadOnly} = True
    ?APla:Pallets{PROP:ReadOnly} = True
    ?APla:Planning_DATE{PROP:ReadOnly} = True
    DISABLE(?Calendar)
    ?APla:Planning_TIME{PROP:ReadOnly} = True
    DISABLE(?LeegPartij)
    DISABLE(?NeemVoorraad)
  END
  Resizer.Init(AppStrategy:NoResize,Resize:SetMinSize)     ! Don't change the windows controls when window resized
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('UpdateAOverboeking',QuickWindow)           ! Restore window settings from non-volatile store
  FDCB7.Init(Art:ArtikelOms,?Art:ArtikelOms,Queue:FileDropCombo.ViewPosition,FDCB7::View:FileDropCombo,Queue:FileDropCombo,Relate:ViewArtikel,ThisWindow,GlobalErrors,0,0,0)
  FDCB7.RemoveDuplicatesFlag = TRUE
  FDCB7.Q &= Queue:FileDropCombo
  FDCB7.AddSortOrder(Art:Artikel_FK01)
  FDCB7.AddField(Art:ArtikelOms,FDCB7.Q.Art:ArtikelOms) !List box control field - type derived from field
  FDCB7.AddUpdateField(Art:ArtikelID,APla:ArtikelID)
  ThisWindow.AddItem(FDCB7.WindowComponent)
  FDCB7.DefaultFill = 0
  FDCB8.Init(Ver:VerpakkingOmschrijving,?Ver:VerpakkingOmschrijving,Queue:FileDropCombo:1.ViewPosition,FDCB8::View:FileDropCombo,Queue:FileDropCombo:1,Relate:Verpakking,ThisWindow,GlobalErrors,0,1,0)
  FDCB8.Q &= Queue:FileDropCombo:1
  FDCB8.AddSortOrder(Ver:Verpakking_PK)
  FDCB8.AddField(Ver:VerpakkingOmschrijving,FDCB8.Q.Ver:VerpakkingOmschrijving) !List box control field - type derived from field
  FDCB8.AddUpdateField(Ver:VerpakkingID,APla:VerpakkingID)
  ThisWindow.AddItem(FDCB8.WindowComponent)
  FDCB8.DefaultFill = 0
  FDCB9.Init(CEL:CelOms,?CEL:CelOms,Queue:FileDropCombo:2.ViewPosition,FDCB9::View:FileDropCombo,Queue:FileDropCombo:2,Relate:Cel,ThisWindow,GlobalErrors,0,1,0)
  FDCB9.Q &= Queue:FileDropCombo:2
  FDCB9.AddSortOrder(CEL:CEL_PK)
  FDCB9.AddField(CEL:CelOms,FDCB9.Q.CEL:CelOms) !List box control field - type derived from field
  FDCB9.AddField(CEL:CelID,FDCB9.Q.CEL:CelID) !Primary key field - type derived from field
  FDCB9.AddUpdateField(CEL:CelID,APla:CelID)
  ThisWindow.AddItem(FDCB9.WindowComponent)
  FDCB9.DefaultFill = 0
  FDCB4.Init(VVPar:PartijCelID,?VVPar:PartijCelID,Queue:FileDropCombo:3.ViewPosition,FDCB4::View:FileDropCombo,Queue:FileDropCombo:3,Relate:ViewVoorraadPartij,ThisWindow,GlobalErrors,0,0,0)
  FDCB4.Q &= Queue:FileDropCombo:3
  FDCB4.AddSortOrder(VVPar:ArtikelID_PartijID_CelID_K)
  FDCB4.AddRange(VVPar:ArtikelID,APla:ArtikelID)
  FDCB4.SetFilter('VVPar:VoorraadKG>0')
  FDCB4.AddField(VVPar:PartijCelID,FDCB4.Q.VVPar:PartijCelID) !List box control field - type derived from field
  FDCB4.AddField(Par:PartijID,FDCB4.Q.Par:PartijID) !List box control field - type derived from field
  FDCB4.AddField(Par:ExternPartijnr,FDCB4.Q.Par:ExternPartijnr) !List box control field - type derived from field
  FDCB4.AddField(VVParT:VoorraadKG,FDCB4.Q.VVParT:VoorraadKG) !List box control field - type derived from field
  FDCB4.AddField(VPParT:VerkoopKG,FDCB4.Q.VPParT:VerkoopKG) !List box control field - type derived from field
  FDCB4.AddField(Par:AanmaakDatum_DATE,FDCB4.Q.Par:AanmaakDatum_DATE) !List box control field - type derived from field
  FDCB4.AddField(ACel:CelOms,FDCB4.Q.ACel:CelOms) !List box control field - type derived from field
  FDCB4.AddField(VVPar:VoorraadKG,FDCB4.Q.VVPar:VoorraadKG) !List box control field - type derived from field
  FDCB4.AddField(LOC:VerkoopKG,FDCB4.Q.LOC:VerkoopKG) !List box control field - type derived from local data
  FDCB4.AddField(LOC:BeschikbareVoorraad,FDCB4.Q.LOC:BeschikbareVoorraad) !List box control field - type derived from local data
  FDCB4.AddField(AREL:FirmaNaam,FDCB4.Q.AREL:FirmaNaam) !List box control field - type derived from field
  FDCB4.AddField(AVP:VerpakkingOmschrijving,FDCB4.Q.AVP:VerpakkingOmschrijving) !List box control field - type derived from field
  FDCB4.AddField(ACel:CelID,FDCB4.Q.ACel:CelID) !Related join file key field - type derived from field
  FDCB4.AddField(AREL:RelatieID,FDCB4.Q.AREL:RelatieID) !Related join file key field - type derived from field
  FDCB4.AddField(AVP:VerpakkingID,FDCB4.Q.AVP:VerpakkingID) !Related join file key field - type derived from field
  FDCB4.AddField(VPPar:PartijCelID,FDCB4.Q.VPPar:PartijCelID) !Related join file key field - type derived from field
  FDCB4.AddField(VPParT:PartijID,FDCB4.Q.VPParT:PartijID) !Related join file key field - type derived from field
  FDCB4.AddField(VVParT:PartijID,FDCB4.Q.VVParT:PartijID) !Related join file key field - type derived from field
  FDCB4.AddUpdateField(VVPar:PartijCelID,LOC:PartijCelID)
  FDCB4.AddUpdateField(Par:VerpakkingID,LOC:VerpakkingID)
  FDCB4.AddUpdateField(VVPar:CelID,LOC:CelID)
  FDCB4.AddUpdateField(VVPar:PartijID,APla:PartijID)
  ThisWindow.AddItem(FDCB4.WindowComponent)
  FDCB4.DefaultFill = 0
  FDCB13.Init(AAACel:CelOms,?AAACel:CelOms,Queue:FileDropCombo:4.ViewPosition,FDCB13::View:FileDropCombo,Queue:FileDropCombo:4,Relate:AAACel,ThisWindow,GlobalErrors,0,1,0)
  FDCB13.Q &= Queue:FileDropCombo:4
  FDCB13.AddSortOrder(AAACel:CEL_PK)
  FDCB13.AddField(AAACel:CelOms,FDCB13.Q.AAACel:CelOms) !List box control field - type derived from field
  FDCB13.AddField(AAACel:CelID,FDCB13.Q.AAACel:CelID) !Browse hot field - type derived from field
  FDCB13.AddUpdateField(AAACel:CelID,APla:OverboekingCelID)
  ThisWindow.AddItem(FDCB13.WindowComponent)
  FDCB13.DefaultFill = 0
  FDCB14.Init(ACL:Locatienaam,?ACL:Locatienaam,Queue:FileDropCombo:5.ViewPosition,FDCB14::View:FileDropCombo,Queue:FileDropCombo:5,Relate:ACelLocatie,ThisWindow,GlobalErrors,0,1,0)
  FDCB14.Q &= Queue:FileDropCombo:5
  FDCB14.AddSortOrder(ACL:FK_CelLocatie)
  FDCB14.AddRange(ACL:CelID,APla:OverboekingCelID)
  FDCB14.AddField(ACL:Locatienaam,FDCB14.Q.ACL:Locatienaam) !List box control field - type derived from field
  FDCB14.AddField(ACL:CelLocatieID,FDCB14.Q.ACL:CelLocatieID) !Primary key field - type derived from field
  FDCB14.AddUpdateField(ACL:CelLocatieID,APla:CelLocatieID)
  ThisWindow.AddItem(FDCB14.WindowComponent)
  FDCB14.DefaultFill = 0
  SELF.SetAlerts()
  EnterByTabManager.ExcludeControl(?Cancel)
  EnterByTabManager.ExcludeControl(?OK)
  EnterByTabManager.Init(False)
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:AAACel.Close
    Relate:ACelLocatie.Close
    Relate:APlanning.Close
    Relate:Cel.Close
    Relate:Mutatie.Close
    Relate:Relatie.Close
    Relate:Verpakking.Close
    Relate:ViewArtikel.Close
    Relate:ViewPlanningPartij.Close
    Relate:ViewVoorraadPartij.Close
  END
  IF SELF.Opened
    INIMgr.Update('UpdateAOverboeking',QuickWindow)        ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.PrimeUpdate PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.PrimeUpdate()
    If returnValue = Level:Fatal  ! delete just occured
      ThisNetRefresh.Send('|APlanning|ViewArtikel|Verpakking|Cel|ViewVoorraadPartij|AAACel|ACelLocatie|') ! NetTalk (NetRefresh)
    End
  		If returnValue = Level:Fatal  ! delete just occured
  			NetRefreshPlanningViews()
  		End
  RETURN ReturnValue


ThisWindow.Run PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  	IF Globalrequest=DeleteRecord
  		IF APla:Verwerkt
  			RETURN RequestCancelled
  			
  			IF MESSAGE('Deze overboeking is al verwerkt, zeker dat deze overboeking en bijbehorende mutaties verwijderd moeten worden?','Verwerkte overboeking',ICON:Exclamation,BUTTON:Yes+BUTTON:No,BUTTON:No,1) <> BUTTON:Yes
  				RETURN ReturnValue
  			END
  
  			CLEAR(Mut:RECORD)
  			Mut:PlanningID = APla:PlanningID
  			SET(Mut:Mutatie_FK02, Mut:Mutatie_FK02)
  			
  			LOOP UNTIL Access:Mutatie.Next()
  				IF Mut:PlanningID <> APla:PlanningID THEN BREAK.
  				
  				IF Mut:SoortMutatie = 'OUIT' THEN
  					Access:Mutatie.DeleteRecord(0)
  				ELSIF Mut:SoortMutatie = 'OIN' THEN
  					Access:Mutatie.DeleteRecord(0)
  				END
  			.
  		END
  	END
  ReturnValue = PARENT.Run()
  IF SELF.Request = ViewRecord                             ! In View Only mode always signal RequestCancelled
    ReturnValue = RequestCancelled
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
      LOC:PartijCelID = ''
      VVPar:PartijCelID = ''
      APla:PartijID = 0
      
      DISPLAY(?VVPar:PartijCelID)
      
      ENABLE(?Ver:VerpakkingOmschrijving)
      ENABLE(?Cel:CelOms)
      DISABLE(?NeemVoorraad)
      DISABLE(?LeegPartij)
    OF ?OK
      db.DebugOut('OK ' & APla:PlanningID)
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?VVPar:PartijCelID
      IF NOT(LOC:PartijCelID='')
      	APla:VerpakkingID = LOC:VerpakkingID
      	APla:CelID = LOC:CelID
      
      	db.DebugOut('PartijAccepted:'&APla:VerpakkingID&','&APla:CelID)
      
      	!FDCB8.ResetQueue(false)
      	!FDCB9.ResetQueue(false)
      
      	db.DebugOut('PartijAccepted-EVENT:'&EVENT())
      
      	!IF NOT(EVENT() = EVENT:Completed)
      		CLEAR(Ver:record)
      		Ver:VerpakkingID=APla:VerpakkingID
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
      
      	    IF APla:KG = 0 !OR APla:KG > VVPar:VoorraadKG
      			APla:KG = FDCB4.Q.LOC:BeschikbareVoorraad
      		.
      
      		IF APla:Pallets = 0 !OR APla:Pallets > VVPar:VoorraadPallets
      			APla:Pallets = VVPar:VoorraadPallets
      		.
      	!.
      END
    OF ?Calendar
      ThisWindow.Update()
      Calendar11.SelectOnClose = True
      Calendar11.Ask('Selecteer een datum',APla:Planning_DATE)
      IF Calendar11.Response = RequestCompleted THEN
      APla:Planning_DATE=Calendar11.SelectedDate
      DISPLAY(?APla:Planning_DATE)
      END
      ThisWindow.Reset(True)
    OF ?NeemVoorraad
      ThisWindow.Update()
      IF NOT(LOC:PartijCelID = '')
      	APla:KG = VVPar:VoorraadKG
      	APla:Pallets = VVPar:VoorraadPallets
      	DISPLAY(?APla:KG)
      	DISPLAY(?APla:Pallets)
      .
    OF ?OK
      ThisWindow.Update()
      IF SELF.Request = ViewRecord AND NOT SELF.BatchProcessing THEN
         POST(EVENT:CloseWindow)
      END
    END
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue


ThisWindow.TakeCompleted PROCEDURE

ReturnValue          BYTE,AUTO

Looped BYTE
  CODE
  IF APla:CelID = 0 THEN
  	Select(?CEL:CelOms)
  	RETURN ReturnValue
  .
  
  IF APla:OverboekingCelID = 0 THEN
  	Select(?AAACel:CelOms)
  	RETURN ReturnValue
  .
  LOOP
    IF Looped
      RETURN Level:Notify
    ELSE
      Looped = 1
    END
  	IF APla:Verwerkt OR APla:MutatieGemaakt
  		IF NOT(MESSAGE('Deze overboeking is al verwerkt, zeker dat deze overboeking en bijbehorende mutaties gewijzigd moet worden?','Verwerkte overboeking',ICON:Exclamation,BUTTON:Yes+BUTTON:No,BUTTON:No,1) = BUTTON:Yes)
  			RETURN Level:Benign
  		END
  	END
  ReturnValue = PARENT.TakeCompleted()
  	IF APla:Verwerkt OR APla:MutatieGemaakt
  		CLEAR(Mut:RECORD)
  		Mut:PlanningID = AAPla:PlanningID
  		SET(Mut:Mutatie_FK02, Mut:Mutatie_FK02)
  		
  		LOOP UNTIL Access:Mutatie.Next()
  			IF Mut:PlanningID <> AAPla:PlanningID THEN BREAK.
  
  			IF Mut:SoortMutatie = 'OUIT' THEN
  				Mut:DatumTijd_DATE = APla:Planning_DATE
  				Mut:DatumTijd_TIME = APla:Planning_TIME + 1
  				Mut:UitslagKG = APla:KG
  				Mut:UitslagPallet = APla:Pallets
  				Mut:NaarCELID = APla:OverboekingCelID
  				Access:Mutatie.Update()
  			ELSIF Mut:SoortMutatie = 'OIN' THEN
  				Mut:DatumTijd_DATE = APla:Planning_DATE
  				Mut:DatumTijd_TIME = APla:Planning_TIME
  				Mut:InslagKG = APla:KG
  				Mut:InslagPallet = APla:Pallets
  				Mut:NaarCELID = APla:CelID
  				Access:Mutatie.Update()
  			END
  		.
  	END
    ThisNetRefresh.Send('|APlanning|ViewArtikel|Verpakking|Cel|ViewVoorraadPartij|AAACel|ACelLocatie|') ! NetTalk (NetRefresh)
  	NetRefreshPlanningViews()
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


FDCB4.SetQueueRecord PROCEDURE

  CODE
  CLEAR(VPPar:Record)
  VPPar:PartijCelID=VVPar:PartijCelID
  Access:ViewPlanningPartij.TryFetch(VPPar:PartijCelID_K)
  
  LOC:VerkoopKG = VPPar:VerkoopKG
  !Het betreft een overboeking, die wordt niet bij de VerkoopKG-telling meegenomen
  !IF VVPar:PartijCelID = LOC:OrigineelPartijCelID THEN
  !	LOC:VerkoopKG -= LOC:OrigineelVerkoopKG
  !.
  
  LOC:BeschikbareVoorraad = VVPar:VoorraadKG - LOC:VerkoopKG
  
  
  
  PARENT.SetQueueRecord
  


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window

!!! <summary>
!!! Generated from procedure template - Window
!!! Form Activiteit
!!! </summary>
UpdateActiviteit PROCEDURE (PRM:Datum)

CurrentTab           STRING(80)                            ! 
ActionMessage        CSTRING(40)                           ! 
LocEnableEnterByTab  BYTE(1)                               !Used by the ENTER Instead of Tab template
EnterByTabManager    EnterByTabClass
History::ACT:Record  LIKE(ACT:RECORD),THREAD
QuickWindow          WINDOW('Form Activiteit'),AT(,,347,63),FONT('Microsoft Sans Serif',8,,FONT:regular,CHARSET:DEFAULT), |
  DOUBLE,CENTER,GRAY,IMM,MDI,HLP('UpdateActiviteit'),SYSTEM
                       PROMPT('Datum/tijd:'),AT(6,9),USE(?ACT:Datum:Prompt),TRN
                       ENTRY(@d6-),AT(55,10,50,10),USE(ACT:Datum),RIGHT(2)
                       ENTRY(@t7B),AT(112,10,28,10),USE(ACT:Tijd),RIGHT(2)
                       PROMPT('Omschrijving:'),AT(6,26),USE(?ACT:Omschrijving:Prompt),TRN
                       ENTRY(@s255),AT(55,26,282,10),USE(ACT:Omschrijving),LEFT
                       BUTTON('&OK'),AT(236,41,49,14),USE(?OK),LEFT,ICON('WAOK.ICO'),DEFAULT,FLAT,MSG('Accept dat' & |
  'a and close the window'),TIP('Accept data and close the window')
                       BUTTON('&Cancel'),AT(289,41,49,14),USE(?Cancel),LEFT,ICON('WACANCEL.ICO'),FLAT,MSG('Cancel operation'), |
  TIP('Cancel operation')
                       CHECK('Uitgevoerd'),AT(283,9),USE(ACT:Uitgevoerd),VALUE('1','0')
                     END

    omit('***',WE::CantCloseNowSetHereDone=1)  !Getting Nested omit compile error, then uncheck the "Check for duplicate CantCloseNowSetHere variable declaration" in the WinEvent local template
WE::CantCloseNowSetHereDone equate(1)
WE::CantCloseNowSetHere     long
    !***
ThisWindow           CLASS(WindowManager)
Ask                    PROCEDURE(),DERIVED
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
PrimeUpdate            PROCEDURE(),BYTE,PROC,DERIVED
Run                    PROCEDURE(),BYTE,PROC,DERIVED
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED
TakeCompleted          PROCEDURE(),BYTE,PROC,DERIVED
TakeEvent              PROCEDURE(),BYTE,PROC,DERIVED
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
Resizer              CLASS(WindowResizeClass)
Init                   PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)
                     END

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
!---------------------------------------------------------------------------

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


ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('UpdateActiviteit')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?ACT:Datum:Prompt
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.HistoryKey = CtrlH
  SELF.AddHistoryFile(ACT:Record,History::ACT:Record)
  SELF.AddHistoryField(?ACT:Datum,5)
  SELF.AddHistoryField(?ACT:Tijd,6)
  SELF.AddHistoryField(?ACT:Omschrijving,7)
  SELF.AddHistoryField(?ACT:Uitgevoerd,8)
  SELF.AddUpdateFile(Access:Activiteit)
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  Relate:Activiteit.Open                                   ! File Activiteit used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Primary &= Relate:Activiteit
  IF SELF.Request = ViewRecord AND NOT SELF.BatchProcessing ! Setup actions for ViewOnly Mode
    SELF.InsertAction = Insert:None
    SELF.DeleteAction = Delete:None
    SELF.ChangeAction = Change:None
    SELF.CancelAction = Cancel:Cancel
    SELF.OkControl = 0
  ELSE
    SELF.ChangeAction = Change:Caller                      ! Changes allowed
    SELF.CancelAction = Cancel:Cancel+Cancel:Query         ! Confirm cancel
    SELF.OkControl = ?OK
    IF SELF.PrimeUpdate() THEN RETURN Level:Notify.
  END
  IF SELF.Request = InsertRecord THEN
      IF PRM:Datum=0
          ACT:Datum = TODAY()
      ELSE
          ACT:Datum = PRM:Datum
      END
  END
  SELF.Open(QuickWindow)                                   ! Open window
  WinAlertMouseZoom()
  Do DefineListboxStyle
  IF SELF.Request = ViewRecord                             ! Configure controls for View Only mode
    ?ACT:Datum{PROP:ReadOnly} = True
    ?ACT:Tijd{PROP:ReadOnly} = True
    ?ACT:Omschrijving{PROP:ReadOnly} = True
  END
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('UpdateActiviteit',QuickWindow)             ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  SELF.SetAlerts()
  EnterByTabManager.ExcludeControl(?Cancel)
  EnterByTabManager.ExcludeControl(?OK)
  EnterByTabManager.Init(False)
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:Activiteit.Close
  END
  IF SELF.Opened
    INIMgr.Update('UpdateActiviteit',QuickWindow)          ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.PrimeUpdate PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.PrimeUpdate()
    If returnValue = Level:Fatal  ! delete just occured
      ThisNetRefresh.Send('|Activiteit|') ! NetTalk (NetRefresh)
    End
  RETURN ReturnValue


ThisWindow.Run PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Run()
  IF SELF.Request = ViewRecord                             ! In View Only mode always signal RequestCancelled
    ReturnValue = RequestCancelled
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
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?OK
      ThisWindow.Update()
      IF SELF.Request = ViewRecord AND NOT SELF.BatchProcessing THEN
         POST(EVENT:CloseWindow)
      END
    END
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
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
  ReturnValue = PARENT.TakeCompleted()
    ThisNetRefresh.Send('|Activiteit|') ! NetTalk (NetRefresh)
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


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window

!!! <summary>
!!! Generated from procedure template - Window
!!! </summary>
BrowseSSOPRegistratie PROCEDURE 

Loc:Datum            DATE                                  ! 
Loc:TijdStip         TIME                                  ! 
Loc:ControleDoor     CSTRING(101)                          ! 
Loc:RegistratieQ     QUEUE,PRE(LRQ)                        ! 
Categorie            CSTRING(40)                           ! 
Object               CSTRING(40)                           ! 
Resultaat            STRING(1)                             ! 
Opmerking            CSTRING(1001)                         ! 
CorrigerendeActie    CSTRING(1001)                         ! 
ObjID                LONG                                  ! 
                     END                                   ! 
LocEnableEnterByTab  BYTE(1)                               !Used by the ENTER Instead of Tab template
EnterByTabManager    EnterByTabClass
Window               WINDOW('SSOP Registratie'),AT(,,667,337),FONT('Microsoft Sans Serif',8,,FONT:regular),RESIZE, |
  GRAY,IMM,MAX,MDI,SYSTEM
                       BUTTON('Sluiten'),AT(599,313,64),USE(?Close),LEFT,ICON('WAClose.ico')
                       PROMPT('Registratiedatum:'),AT(13,12),USE(?Loc:Datum:Prompt)
                       SPIN(@d6-),AT(73,13,60,10),USE(Loc:Datum)
                       PROMPT('Tijdstip:'),AT(139,12),USE(?Loc:TijdStip:Prompt)
                       SPIN(@t1),AT(167,13,36,10),USE(Loc:TijdStip)
                       PROMPT('Controle Door:'),AT(208,12),USE(?Loc:ControleDoor:Prompt)
                       ENTRY(@s100),AT(259,13,107,10),USE(Loc:ControleDoor)
                       LIST,AT(14,31,651,277),USE(?List),VSCROLL,ALRT(MouseLeft2),FORMAT('100L(2)|_M~Categorie' & |
  '~L(1)@s39@100L(2)|_M~Object~L(1)@s39@46L(2)|_M~Resultaat~L(0)@s1@200L(2)|_M~Opmerkin' & |
  'g~L(0)@s255@200L(2)|_M~Corrigerende Actie~L(0)@s255@'),FROM(Loc:RegistratieQ)
                       BUTTON('&Insert'),AT(217,313,40,12),USE(?Insert),KEY(InsertKey),DISABLE,HIDE
                       BUTTON('&Edit'),AT(269,313,40,12),USE(?Change),KEY(CtrlEnter)
                       BUTTON('&Delete'),AT(327,313,40,12),USE(?Delete),KEY(DeleteKey),DISABLE,HIDE
                       BUTTON('Opslaan'),AT(531,313,64,23),USE(?Opslaan),LEFT,ICON('WAOK.ico')
                       BUTTON('Vul regels'),AT(375,7),USE(?VulRegels)
                     END

QEIP4:SaveEntry      GROUP,PRE(QEIP4)
Categorie              LIKE(LRQ:Categorie)
Object                 LIKE(LRQ:Object)
Resultaat              LIKE(LRQ:Resultaat)
Opmerking              LIKE(LRQ:Opmerking)
CorrigerendeActie      LIKE(LRQ:CorrigerendeActie)
                     END
QEIP4:Fields         FieldPairsClass
QEIP4:PopupString    STRING(20)
QEIP4:PopupMgr       PopupClass
QEIP4:EditList       QUEUE(EditQueue),PRE(QEIP4)
                     END
QEIP4:EM             CLASS(EIPManager)
TabAction              BYTE
EnterAction            BYTE
ArrowAction            BYTE
FocusLossAction        BYTE
CurrentChoice          LONG,PRIVATE
AddControl             PROCEDURE(<EditClass EC>,UNSIGNED Column,BYTE AutoFree = 0)
ClearColumn            PROCEDURE,DERIVED
Init                   PROCEDURE,BYTE,DERIVED,PROC
InitControls           PROCEDURE,DERIVED
Kill                   PROCEDURE,PROC,BYTE,DERIVED
Next                   PROCEDURE,PROTECTED
GetEdit                PROCEDURE,BYTE,DERIVED,PROTECTED
PrimeRecord            PROCEDURE(BYTE SuppressClear = 0)
ResetColumn            PROCEDURE,DERIVED,PROTECTED
Run                    PROCEDURE(BYTE Req),BYTE
TakeAction             PROCEDURE(UNSIGNED Action),DERIVED
TakeCompleted          PROCEDURE(BYTE Force),DERIVED   ! Note this does -not- override the WindowManager variant
TakeEvent              PROCEDURE,DERIVED,BYTE,PROC
TakeFieldEvent         PROCEDURE,DERIVED,BYTE,PROC
TakeFocusLoss          PROCEDURE,DERIVED
TakeNewSelection       PROCEDURE,DERIVED,BYTE,PROC
                     END

QEIP4::LRQ:Resultaat CLASS(EditDropListClass)
CreateControl          PROCEDURE(),DERIVED                      ! Method added to host embed code
Init                   PROCEDURE(UNSIGNED FieldNumber,UNSIGNED ListBox,*? UseVar),DERIVED ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                      ! Method added to host embed code
SetAlerts              PROCEDURE(),DERIVED                      ! Method added to host embed code
SetReadOnly            PROCEDURE(BYTE State),DERIVED            ! Method added to host embed code
TakeAccepted           PROCEDURE(BYTE Action),BYTE,DERIVED      ! Method added to host embed code
TakeEvent              PROCEDURE(UNSIGNED Event),BYTE,DERIVED   ! Method added to host embed code
                     END
QEIP4::LRQ:Opmerking CLASS(EditTextClass)
CreateControl          PROCEDURE(),DERIVED                      ! Method added to host embed code
Init                   PROCEDURE(UNSIGNED FieldNumber,UNSIGNED ListBox,*? UseVar),DERIVED ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                      ! Method added to host embed code
SetAlerts              PROCEDURE(),DERIVED                      ! Method added to host embed code
SetReadOnly            PROCEDURE(BYTE State),DERIVED            ! Method added to host embed code
TakeAccepted           PROCEDURE(BYTE Action),BYTE,DERIVED      ! Method added to host embed code
TakeEvent              PROCEDURE(UNSIGNED Event),BYTE,DERIVED   ! Method added to host embed code
                     END
QEIP4::LRQ:CorrigerendeActie CLASS(EditTextClass)
CreateControl          PROCEDURE(),DERIVED                      ! Method added to host embed code
Init                   PROCEDURE(UNSIGNED FieldNumber,UNSIGNED ListBox,*? UseVar),DERIVED ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                      ! Method added to host embed code
SetAlerts              PROCEDURE(),DERIVED                      ! Method added to host embed code
SetReadOnly            PROCEDURE(BYTE State),DERIVED            ! Method added to host embed code
TakeAccepted           PROCEDURE(BYTE Action),BYTE,DERIVED      ! Method added to host embed code
TakeEvent              PROCEDURE(UNSIGNED Event),BYTE,DERIVED   ! Method added to host embed code
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
TakeFieldEvent         PROCEDURE(),BYTE,PROC,DERIVED
TakeNewSelection       PROCEDURE(),BYTE,PROC,DERIVED
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
Resizer              CLASS(WindowResizeClass)
Init                   PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)
                     END

LocalClass          CLASS
VulResultaatQ           PROCEDURE()
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

ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('BrowseSSOPRegistratie')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Close
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  IF SELF.Request = SelectRecord
     SELF.AddItem(?Close,RequestCancelled)                 ! Add the close control to the window manger
  ELSE
     SELF.AddItem(?Close,RequestCompleted)                 ! Add the close control to the window manger
  END
      Loc:Datum=Today()
  Relate:SSOPCategorie.Open                                ! File SSOPCategorie used by this procedure, so make sure it's RelationManager is open
  Relate:SSOPObject.Open                                   ! File SSOPObject used by this procedure, so make sure it's RelationManager is open
  Relate:SSOPRegistratie.Open                              ! File SSOPRegistratie used by this procedure, so make sure it's RelationManager is open
  Relate:SSOPTijd.Open                                     ! File SSOPTijd used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(Window)                                        ! Open window
  LocalClass.VulResultaatQ()
  WinAlertMouseZoom()
  Do DefineListboxStyle
  Resizer.Init(AppStrategy:Spread)                         ! Controls will spread out as the window gets bigger
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('BrowseSSOPRegistratie',Window)             ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
    ?List{PROP:LineHeight}=10
  SELF.SetAlerts()
  QEIP4:Fields.Init()
  QEIP4:Fields.AddPair(QEIP4:SaveEntry.Categorie,Loc:RegistratieQ.Categorie)
  QEIP4:Fields.AddPair(QEIP4:SaveEntry.Object,Loc:RegistratieQ.Object)
  QEIP4:Fields.AddPair(QEIP4:SaveEntry.Resultaat,Loc:RegistratieQ.Resultaat)
  QEIP4:Fields.AddPair(QEIP4:SaveEntry.Opmerking,Loc:RegistratieQ.Opmerking)
  QEIP4:Fields.AddPair(QEIP4:SaveEntry.CorrigerendeActie,Loc:RegistratieQ.CorrigerendeActie)
  QEIP4:PopupMgr.Init()
  QEIP4:PopupMgr.AddItemMimic('Add',?Insert)
  QEIP4:PopupMgr.AddItemMimic('Edit',?Change)
  QEIP4:PopupMgr.AddItemMimic('Delete',?Delete)
  GlobalErrors.AddErrors(QEIP:Errors)
  ?List{Prop:Alrt,QEIP:MouseLeft2Index} = MouseLeft2
  ?List{Prop:Alrt,QEIP:MouseRightIndex} = MouseRight
  EnterByTabManager.Init(False)
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:SSOPCategorie.Close
    Relate:SSOPObject.Close
    Relate:SSOPRegistratie.Close
    Relate:SSOPTijd.Close
  END
  IF SELF.Opened
    INIMgr.Update('BrowseSSOPRegistratie',Window)          ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.Reset PROCEDURE(BYTE Force=0)

  CODE
  SELF.ForcedReset += Force
  IF Window{Prop:AcceptAll} THEN RETURN.
  PARENT.Reset(Force)
  IF RECORDS(Loc:RegistratieQ)
     ?Change{PROP:Disable} = FALSE
     ?Delete{PROP:Disable} = FALSE
  ELSE
     ?Change{PROP:Disable} = TRUE
     ?Delete{PROP:Disable} = TRUE
  END


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
    OF ?Loc:Datum
          LocalClass.VulResultaatQ()
    OF ?Insert
      ThisWindow.Update()
      LOOP
        ThisWindow.VCRRequest = VCR:None
        IF KEYCODE() = MouseRightUp
          SETKEYCODE(0)
        END
        ReturnValue = QEIP4:EM.Run(InsertRecord)
        CASE ThisWindow.VCRRequest
          OF VCR:Forward
             IF POINTER(Loc:RegistratieQ) < RECORDS(Loc:RegistratieQ)
                ?List{PROP:Selected} = POINTER(Loc:RegistratieQ)
             ELSE
                ThisWindow.VCRRequest = VCR:None
             END
          OF VCR:Backward
             IF POINTER(Loc:RegistratieQ) > 1
                ?List{PROP:Selected} = POINTER(Loc:RegistratieQ)
             ELSE
                ThisWindow.VCRRequest = VCR:None
             END
        END
      UNTIL ThisWindow.VCRRequest = VCR:None
      SELECT(?List)
      ThisWindow.Reset()
    OF ?Change
      ThisWindow.Update()
      LOOP
        ThisWindow.VCRRequest = VCR:None
        IF KEYCODE() = MouseRightUp
          SETKEYCODE(0)
        END
        ReturnValue = QEIP4:EM.Run(ChangeRecord)
        CASE ThisWindow.VCRRequest
          OF VCR:Forward
             IF POINTER(Loc:RegistratieQ) < RECORDS(Loc:RegistratieQ)
                GET(Loc:RegistratieQ,POINTER(Loc:RegistratieQ)+1)
                ?List{PROP:Selected} = POINTER(Loc:RegistratieQ)
             ELSE
                ThisWindow.VCRRequest = VCR:None
             END
          OF VCR:Backward
             IF POINTER(Loc:RegistratieQ) > 1
                GET(Loc:RegistratieQ,POINTER(Loc:RegistratieQ)-1)
                ?List{PROP:Selected} = POINTER(Loc:RegistratieQ)
             ELSE
                ThisWindow.VCRRequest = VCR:None
             END
        END
      UNTIL ThisWindow.VCRRequest = VCR:None
      SELECT(?List)
      ThisWindow.Reset()
    OF ?Delete
      ThisWindow.Update()
      ReturnValue = QEIP4:EM.Run(DeleteRecord)
      ThisWindow.Reset()
    OF ?Opslaan
      ThisWindow.Update()
              ! datum uitlezen
      Clear(STijd:Record)
      STijd:DatumTijd_DATE=Loc:Datum
      Set(STijd:SSOPTijd_FK1,STijd:SSOPTijd_FK1)
      IF ACCESS:SSOPTijd.Next()=Level:Benign AND STijd:DatumTijd_DATE=Loc:Datum
          STijd:DatumTijd_TIME=Loc:TijdStip
          STijd:Door=Loc:ControleDoor
          Access:SSOPTIjd.Update()
      ELSE
          Clear(STijd:Record)
          STijd:DatumTijd_DATE=Loc:Datum
          STijd:DatumTijd_TIME=Loc:TijdStip
          STijd:Door=Loc:ControleDoor
          Access:SSOPTIjd.Insert()
      END
              
      Loop i#=1 To Records(Loc:RegistratieQ)
          GET(Loc:RegistratieQ,i#)
          Clear(SReg:Record)
          SReg:ObjID=LRQ:ObjID
          SReg:Datum_DATE=Loc:Datum
          IF Access:SSOPRegistratie.Fetch(SReg:SSOPRegistratie_FK1)<>Level:Benign
              Clear(SReg:Record)
              SReg:ObjID=LRQ:ObjID
              SReg:Datum_DATE=Loc:Datum
              SReg:Resultaat=LRQ:Resultaat
              SReg:Opmerking=LRQ:Opmerking
              SReg:CorrigerendeActie=LRQ:CorrigerendeActie
              SReg:TijdID=STijd:TijdID
              Access:SSOPRegistratie.Insert()
          ELSE
              SReg:TijdID=STijd:TijdID
              SReg:Resultaat=LRQ:Resultaat
              SReg:Opmerking=LRQ:Opmerking
              SReg:CorrigerendeActie=LRQ:CorrigerendeActie
              Access:SSOPRegistratie.Update
          END
      END
      
          
    OF ?VulRegels
      ThisWindow.Update()
      Loop i#=1 to Records(Loc:RegistratieQ)
          Get(Loc:RegistratieQ,i#)
          IF LRQ:Resultaat=''
              LRQ:Resultaat='V'
              Put(Loc:RegistratieQ)
          END
      END
      Display()
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
  IF Loc:TijdStip=0 OR Loc:ControleDoor=''
      DISABLE(?VulRegels)
      DISABLE(?Opslaan)
  ELSE
      ENABLE(?VulRegels)
      ENABLE(?Opslaan)
  END
  CASE FIELD()
  OF ?List
    CASE EVENT()
    OF EVENT:AlertKey
      CASE KEYCODE()
        OF MouseLeft2
           IF ~?Change{PROP:Disable} AND RECORDS(Loc:RegistratieQ)
              POST(EVENT:Accepted,?Change)
           END
        OF MouseRight
           QEIP4:PopupString = QEIP4:PopupMgr.Ask()
      END
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
    OF ?Loc:Datum
          LocalClass.VulResultaatQ()
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

LocalClass.VulResultaatQ    PROCEDURE()
CODE
    Clear(Loc:TijdStip)
    Clear(Loc:ControleDoor)
    Clear(STijd:Record)
    STijd:DatumTijd_DATE=Loc:Datum
    Set(STijd:SSOPTijd_FK1,STijd:SSOPTijd_FK1)
    IF ACCESS:SSOPTijd.Next()=Level:Benign AND STijd:DatumTijd_DATE=Loc:Datum
        Loc:TijdStip=STijd:DatumTijd_TIME
        Loc:ControleDoor=STijd:Door
    END
    Display(?Loc:ControleDoor)
    Display(?Loc:TijdStip)
    Free(Loc:RegistratieQ)
    Clear(SCat:Record)
    Set(SCat:SSOPCategorie_PK,SCat:SSOPCategorie_PK)
    Loop Until Access:SSOPCategorie.Next()
        Clear(SObj:Record)
        SObj:CatergorieID=SCat:CategorieID
        Set(SObj:SSOPObject_FK1,SObj:SSOPObject_FK1)
        Loop Until Access:SsopObject.Next()
            IF NOT(SObj:CatergorieID=SCat:CategorieID) THEN Break.
            IF NOT ((Loc:Datum%7=1 AND SObj:Maandag) OR | 
                (Loc:Datum%7=2 AND SObj:Dinsdag) OR | 
                (Loc:Datum%7=3 AND SObj:Woensdag) OR | 
                (Loc:Datum%7=4 AND SObj:Donderdag) OR | 
                (Loc:Datum%7=5 AND SObj:Vrijdag))
                CYCLE
            END
            Clear(Loc:RegistratieQ)
            LRQ:Categorie=SCat:Omschrijving
            LRQ:Object=SObj:Omschrijving
            Clear(SReg:Record)
            SReg:ObjID=SObj:ObjID
            SReg:Datum_DATE=Loc:Datum
            IF Access:SSOPRegistratie.Fetch(SReg:SSOPRegistratie_FK1)=Level:Benign
                LRQ:Resultaat=SReg:Resultaat
                LRQ:Opmerking=SReg:Opmerking
                LRQ:CorrigerendeActie=SReg:CorrigerendeActie
            ELSE
               ! LRQ:Resultaat='V'
            END
            LRQ:ObjID=SObj:ObjID
            Add(Loc:RegistratieQ)
        END
    END 
    Return
QEIP4:EM.AddControl            PROCEDURE(<EditClass E>,UNSIGNED Column,BYTE AutoFree)
  CODE
  PARENT.AddControl(E,Column,AutoFree)
  RETURN

QEIP4:EM.ClearColumn           PROCEDURE
  CODE
  IF KEYCODE() <> EscKey
     IF SELF.LastColumn
        UPDATE
        GET(SELF.EQ,SELF.Column)
        PUT(Loc:RegistratieQ)
        ASSERT(~ERRORCODE())
     END
  END
  PARENT.ClearColumn()
  RETURN

QEIP4:EM.Init                  PROCEDURE
RetVal BYTE(RequestCancelled)
AtEnd  BYTE,AUTO
  CODE
  SELF.TabAction = EIPAction:Always+EIPAction:Remain
  SELF.EnterAction = EIPAction:Always+EIPAction:Remain
  SELF.FocusLossAction = EIPAction:Always
  SELF.ArrowAction = EIPAction:Always+EIPAction:Remain
  SELF.Arrow &= SELF.ArrowAction
  SELF.Enter &= SELF.EnterAction
  SELF.EQ &= QEIP4:EditList
  SELF.Errors &= NULL
  SELF.Fields &= QEIP4:Fields
  SELF.FocusLoss &= SELF.FocusLossAction
  SELF.ListControl = ?List
  SELF.Tab &= SELF.TabAction
  SELF.VCRRequest &= ThisWindow.VCRRequest
  SELF.AddControl(,1,0)
  SELF.AddControl(,2,0)
  SELF.AddControl(QEIP4::LRQ:Resultaat,3,0)
  SELF.AddControl(QEIP4::LRQ:Opmerking,4,0)
  SELF.AddControl(QEIP4::LRQ:CorrigerendeActie,5,0)
  SELF.CurrentChoice = CHOICE(?List)
  IF ~SELF.CurrentChoice
     SELF.CurrentChoice = 1
     ?List{PROP:Selected} = 1
  END
  GET(Loc:RegistratieQ,SELF.CurrentChoice)
  CASE SELF.Req
  OF InsertRecord
    IF RECORDS(Loc:RegistratieQ)
      AtEnd = CHOOSE(SELF.CurrentChoice = RECORDS(Loc:RegistratieQ))
      CASE(SELF.Insert)
        OF EIPAction:Before
           !Default
        OF EIPAction:Append
           SELF.CurrentChoice = RECORDS(Loc:RegistratieQ)+1
      ELSE
           SELF.CurrentChoice += 1
      END
    ELSE
      SELF.CurrentChoice = 1
    END
    SELF.PrimeRecord()
    ADD(Loc:RegistratieQ,SELF.CurrentChoice)
    ASSERT(~ERRORCODE())
    DISPLAY(?List)
    SELECT(?List,SELF.CurrentChoice)
    SELF.Column = 1
  OF DeleteRecord
    RetVal = CHOOSE(GlobalErrors.Throw(Msg:ConfirmDelete) = Level:Benign,RequestCompleted,RequestCancelled)
    IF RetVal = RequestCompleted
       DELETE(Loc:RegistratieQ)
    END
    SELF.Response = RetVal
    RETURN Level:Fatal
  OF ChangeRecord
    QEIP4:SaveEntry = Loc:RegistratieQ
    IF KEYCODE() = MouseLeft2
      SELF.Column = ?List{PROPLIST:MouseUpField}
    END
  ELSE
    ASSERT(0)
  END
  GET(Loc:RegistratieQ,SELF.CurrentChoice)
  SELF.Fields.AssignRightToLeft()
  ?List{PROP:Alrt,QEIP:MouseLeft2Index} = 0 ! Prevent alert short-stopping double click
  RetVal = PARENT.Init()
  RETURN(RetVal)

QEIP4:EM.InitControls          PROCEDURE
  CODE
  SELF.EQ.Field = 1
  PARENT.InitControls()
  RETURN

QEIP4:EM.Kill                  PROCEDURE
ReturnValue BYTE,AUTO
I           LONG,AUTO
J           LONG,AUTO
  CODE
  ReturnValue = PARENT.Kill()
  !Now dispose of any edit classes we created
  J = RECORDS(QEIP4:EditList)
  LOOP I = 1 TO J
    GET(QEIP4:EditList,I)
    IF ~QEIP4:EditList.Control &= NULL AND QEIP4:EditList.FreeUp = TRUE
       DISPOSE(QEIP4:EditList.Control)
    END
  END
  !and free up the edit queue
  FREE(QEIP4:EditList)
  RETURN(ReturnValue)

QEIP4:EM.Next                  PROCEDURE
  CODE
  PARENT.Next()
  RETURN

QEIP4:EM.GetEdit               PROCEDURE
ReturnValue BYTE,AUTO
  CODE
  ReturnValue = PARENT.GetEdit()
  RETURN(ReturnValue)

QEIP4:EM.PrimeRecord           PROCEDURE(BYTE SC)
  CODE
  IF ~SC
     CLEAR(Loc:RegistratieQ)
  END
  CLEAR(Loc:RegistratieQ.LRQ:Categorie)
  CLEAR(Loc:RegistratieQ.LRQ:Object)
  Loc:RegistratieQ.LRQ:Resultaat = 'Voldoende'
  CLEAR(Loc:RegistratieQ.LRQ:Opmerking)
  CLEAR(Loc:RegistratieQ.LRQ:CorrigerendeActie)
  RETURN

QEIP4:EM.ResetColumn           PROCEDURE
  CODE
  PARENT.ResetColumn()
  RETURN

QEIP4:EM.Run                   PROCEDURE(BYTE Req)
ReturnValue BYTE,AUTO
  CODE
  ReturnValue = PARENT.Run(Req)
  RETURN(ReturnValue)

QEIP4:EM.TakeAction            PROCEDURE(UNSIGNED Action)
  CODE
  PARENT.TakeAction(Action)

QEIP4:EM.TakeCompleted         PROCEDURE(BYTE Force)
SaveAns UNSIGNED,AUTO
  CODE
  SELF.Again = 0
  SELF.ClearColumn
  SaveAns = CHOOSE(Force = 0,Button:Yes,Force)
  IF SELF.Fields.Equal()
      SaveAns = Button:No
  ELSE
     IF ~Force
        SaveAns = GlobalErrors.Message(Msg:SaveRecord,Button:Yes+Button:No+Button:Cancel,Button:Yes)
     END
  END
  Force = 0
  SELF.Response = RequestCancelled
  CASE SaveAns
    OF Button:Cancel
       SELF.Again = 1
    OF Button:No
       IF SELF.Req = InsertRecord
          DELETE(Loc:RegistratieQ)
          IF SELF.CurrentChoice AND SELF.Insert <> EIPAction:Before
             SELF.CurrentChoice -= 1
          END
       ELSE
          SELF.Fields.AssignLeftToRight
          PUT(Loc:RegistratieQ)
       END
    OF Button:Yes
       SELF.Response = RequestCompleted
  END
  PARENT.TakeCompleted(Force)
  RETURN

QEIP4:EM.TakeEvent             PROCEDURE
ReturnValue BYTE,AUTO
  CODE
  ReturnValue = PARENT.TakeEvent()
  RETURN(ReturnValue)

QEIP4:EM.TakeFieldEvent        PROCEDURE
ReturnValue BYTE,AUTO
  CODE
  ReturnValue = PARENT.TakeFieldEvent()
  RETURN(ReturnValue)

QEIP4:EM.TakeFocusLoss         PROCEDURE
  CODE
  PARENT.TakeFocusLoss()
  RETURN

QEIP4:EM.TakeNewSelection      PROCEDURE
ReturnValue BYTE,AUTO
  CODE
  IF FIELD() = ?List
    IF CHOICE(?List) = SELF.CurrentChoice
      ReturnValue = PARENT.TakeNewSelection()
    ELSE                                  ! Focus change to different record
      SELF.TakeFocusLoss
      IF SELF.Again
        SELECT(?List,SELF.CurrentChoice)
        ReturnValue = Level:Benign
      ELSE
        SELF.CurrentChoice = CHOICE(?List)
        SELF.Response = RequestCancelled           ! Avoid cursor following 'new' record
        ReturnValue = Level:Fatal
      END
    END
  END
  RETURN(ReturnValue)



QEIP4::LRQ:Resultaat.CreateControl    PROCEDURE
  CODE
  PARENT.CreateControl()
  Self.Feq{Prop:From}='Voldoende|#V|Onvoldoende|#O|Niet van toepassing|#X'
  Self.Feq{Prop:Drop}=3   
  Self.Feq{PROP:Width}=100
  RETURN

QEIP4::LRQ:Resultaat.Init    PROCEDURE(UNSIGNED FieldNumber,UNSIGNED ListBox,*? UseVar)
  CODE
  PARENT.Init(FieldNumber,ListBox,UseVar)
  RETURN

QEIP4::LRQ:Resultaat.Kill    PROCEDURE
  CODE
  PARENT.Kill()
  RETURN

QEIP4::LRQ:Resultaat.SetAlerts    PROCEDURE
  CODE
  PARENT.SetAlerts()
  RETURN

QEIP4::LRQ:Resultaat.SetReadOnly    PROCEDURE(BYTE State)
  CODE
  PARENT.SetReadOnly(State)
  RETURN

QEIP4::LRQ:Resultaat.TakeAccepted    PROCEDURE(BYTE Action)
ReturnValue BYTE
  CODE
  ReturnValue = PARENT.TakeAccepted(Action)
  RETURN(ReturnValue)

QEIP4::LRQ:Resultaat.TakeEvent    PROCEDURE(UNSIGNED Event)
ReturnValue BYTE
  CODE
  ReturnValue = PARENT.TakeEvent(Event)
  RETURN(ReturnValue)



QEIP4::LRQ:Opmerking.CreateControl    PROCEDURE
  CODE
  PARENT.CreateControl()
  RETURN

QEIP4::LRQ:Opmerking.Init    PROCEDURE(UNSIGNED FieldNumber,UNSIGNED ListBox,*? UseVar)
  CODE
  PARENT.Init(FieldNumber,ListBox,UseVar)
  RETURN

QEIP4::LRQ:Opmerking.Kill    PROCEDURE
  CODE
  PARENT.Kill()
  RETURN

QEIP4::LRQ:Opmerking.SetAlerts    PROCEDURE
  CODE
  PARENT.SetAlerts()
  RETURN

QEIP4::LRQ:Opmerking.SetReadOnly    PROCEDURE(BYTE State)
  CODE
  PARENT.SetReadOnly(State)
  RETURN

QEIP4::LRQ:Opmerking.TakeAccepted    PROCEDURE(BYTE Action)
ReturnValue BYTE
  CODE
  ReturnValue = PARENT.TakeAccepted(Action)
  RETURN(ReturnValue)

QEIP4::LRQ:Opmerking.TakeEvent    PROCEDURE(UNSIGNED Event)
ReturnValue BYTE
  CODE
  ReturnValue = PARENT.TakeEvent(Event)
  RETURN(ReturnValue)



QEIP4::LRQ:CorrigerendeActie.CreateControl    PROCEDURE
  CODE
  PARENT.CreateControl()
  RETURN

QEIP4::LRQ:CorrigerendeActie.Init    PROCEDURE(UNSIGNED FieldNumber,UNSIGNED ListBox,*? UseVar)
  CODE
  PARENT.Init(FieldNumber,ListBox,UseVar)
  RETURN

QEIP4::LRQ:CorrigerendeActie.Kill    PROCEDURE
  CODE
  PARENT.Kill()
  RETURN

QEIP4::LRQ:CorrigerendeActie.SetAlerts    PROCEDURE
  CODE
  PARENT.SetAlerts()
  RETURN

QEIP4::LRQ:CorrigerendeActie.SetReadOnly    PROCEDURE(BYTE State)
  CODE
  PARENT.SetReadOnly(State)
  RETURN

QEIP4::LRQ:CorrigerendeActie.TakeAccepted    PROCEDURE(BYTE Action)
ReturnValue BYTE
  CODE
  ReturnValue = PARENT.TakeAccepted(Action)
  RETURN(ReturnValue)

QEIP4::LRQ:CorrigerendeActie.TakeEvent    PROCEDURE(UNSIGNED Event)
ReturnValue BYTE
  CODE
  ReturnValue = PARENT.TakeEvent(Event)
  RETURN(ReturnValue)


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window

!!! <summary>
!!! Generated from procedure template - Window
!!! Planning
!!! </summary>
BrowsePlanning PROCEDURE 

CurrentTab           STRING(80)                            ! 
Loc:DatumNu          DATE                                  ! 
LOC:DatumNuLast      DATE                                  ! 
Loc:DatumVanSQL      LONG                                  ! 
Loc:DatumTotSQL      LONG                                  ! 
LOC:ExcelMacroFile   STRING(500)                           ! 
LOC:ExcelPageBreak   LONG                                  ! 
LOC:Getransferd      BYTE                                  ! 
LOC:Tijdstip         TIME                                  ! 
Loc:ATijdstip        TIME                                  ! 
LOC:Locatienaam      STRING(50)                            ! 
LOC:Locatienaam2     STRING(50)                            ! 
LOC:Locatienaam3     STRING(50)                            ! 
Loc:RegelNu1         LONG                                  ! 
Loc:RegelNu2         LONG                                  ! 
LOC:SelectedFocus    LONG                                  ! 
LOC:SelectedFocusRow LONG,DIM(6)                           ! 
LOC:SkipRestoreFocus LONG                                  ! 
LOC:InkoopKG1        DECIMAL(10,2)                         ! 
LOC:InkoopKG2        DECIMAL(10,2)                         ! 
LOC:OverboekingKG1   DECIMAL(10,2)                         ! 
LOC:OverboekingKG2   DECIMAL(10,2)                         ! 
LOC:VerkoopKG1       DECIMAL(10,2)                         ! 
LOC:VerkoopKG2       DECIMAL(10,2)                         ! 
LOC:VerkoopKG3       DECIMAL(7,2)                          ! 
LOC:InkoopPallets1   LONG                                  ! 
LOC:InkoopPallets2   LONG                                  ! 
LOC:OverboekingPallets1 LONG                               ! 
LOC:OverboekingPallets2 LONG                               ! 
LOC:VerkoopPallets1  LONG                                  ! 
LOC:VerkoopPallets2  LONG                                  ! 
LOC:VerkoopPallets3  LONG                                  ! 
LOC:ActiviteitTabColor LONG                                ! 
LOC:VerkoopCelOms    CSTRING(51)                           ! 
BRW6::View:Browse    VIEW(PlanningInkoop)
                       PROJECT(Pla2:ArtikelID)
                       PROJECT(Pla2:ArtikelOms)
                       PROJECT(Pla2:FirmaNaam)
                       PROJECT(Pla2:Instructie)
                       PROJECT(Pla2:VerpakkingOmschrijving)
                       PROJECT(Pla2:Planning_TIME)
                       PROJECT(Pla2:MutatieGemaakt)
                       PROJECT(Pla2:Geprint)
                       PROJECT(Pla2:Verwerkt)
                       PROJECT(Pla2:Gewogen)
                       PROJECT(Pla2:CelOms)
                       PROJECT(Pla2:Locatienaam)
                       PROJECT(Pla2:Transport)
                       PROJECT(Pla2:PlanningID)
                       PROJECT(Pla2:InkoopID)
                       PROJECT(Pla2:KG)
                       PROJECT(Pla2:MutatieKG)
                       PROJECT(Pla2:MutatiePallets)
                       PROJECT(Pla2:Pallets)
                       PROJECT(Pla2:Planning)
                     END
Queue:Browse         QUEUE                            !Queue declaration for browse/combo box using ?InkoopList
Pla2:ArtikelID         LIKE(Pla2:ArtikelID)           !List box control field - type derived from field
Pla2:ArtikelID_NormalFG LONG                          !Normal forground color
Pla2:ArtikelID_NormalBG LONG                          !Normal background color
Pla2:ArtikelID_SelectedFG LONG                        !Selected forground color
Pla2:ArtikelID_SelectedBG LONG                        !Selected background color
Pla2:ArtikelOms        LIKE(Pla2:ArtikelOms)          !List box control field - type derived from field
Pla2:ArtikelOms_NormalFG LONG                         !Normal forground color
Pla2:ArtikelOms_NormalBG LONG                         !Normal background color
Pla2:ArtikelOms_SelectedFG LONG                       !Selected forground color
Pla2:ArtikelOms_SelectedBG LONG                       !Selected background color
Pla2:FirmaNaam         LIKE(Pla2:FirmaNaam)           !List box control field - type derived from field
Pla2:FirmaNaam_NormalFG LONG                          !Normal forground color
Pla2:FirmaNaam_NormalBG LONG                          !Normal background color
Pla2:FirmaNaam_SelectedFG LONG                        !Selected forground color
Pla2:FirmaNaam_SelectedBG LONG                        !Selected background color
LOC:InkoopKG1          LIKE(LOC:InkoopKG1)            !List box control field - type derived from local data
LOC:InkoopKG1_NormalFG LONG                           !Normal forground color
LOC:InkoopKG1_NormalBG LONG                           !Normal background color
LOC:InkoopKG1_SelectedFG LONG                         !Selected forground color
LOC:InkoopKG1_SelectedBG LONG                         !Selected background color
Pla2:Instructie        LIKE(Pla2:Instructie)          !List box control field - type derived from field
Pla2:Instructie_NormalFG LONG                         !Normal forground color
Pla2:Instructie_NormalBG LONG                         !Normal background color
Pla2:Instructie_SelectedFG LONG                       !Selected forground color
Pla2:Instructie_SelectedBG LONG                       !Selected background color
Pla2:VerpakkingOmschrijving LIKE(Pla2:VerpakkingOmschrijving) !List box control field - type derived from field
Pla2:VerpakkingOmschrijving_NormalFG LONG             !Normal forground color
Pla2:VerpakkingOmschrijving_NormalBG LONG             !Normal background color
Pla2:VerpakkingOmschrijving_SelectedFG LONG           !Selected forground color
Pla2:VerpakkingOmschrijving_SelectedBG LONG           !Selected background color
Pla2:Planning_TIME     LIKE(Pla2:Planning_TIME)       !List box control field - type derived from field
Pla2:Planning_TIME_NormalFG LONG                      !Normal forground color
Pla2:Planning_TIME_NormalBG LONG                      !Normal background color
Pla2:Planning_TIME_SelectedFG LONG                    !Selected forground color
Pla2:Planning_TIME_SelectedBG LONG                    !Selected background color
LOC:InkoopPallets1     LIKE(LOC:InkoopPallets1)       !List box control field - type derived from local data
LOC:InkoopPallets1_NormalFG LONG                      !Normal forground color
LOC:InkoopPallets1_NormalBG LONG                      !Normal background color
LOC:InkoopPallets1_SelectedFG LONG                    !Selected forground color
LOC:InkoopPallets1_SelectedBG LONG                    !Selected background color
Pla2:MutatieGemaakt    LIKE(Pla2:MutatieGemaakt)      !List box control field - type derived from field
Pla2:MutatieGemaakt_NormalFG LONG                     !Normal forground color
Pla2:MutatieGemaakt_NormalBG LONG                     !Normal background color
Pla2:MutatieGemaakt_SelectedFG LONG                   !Selected forground color
Pla2:MutatieGemaakt_SelectedBG LONG                   !Selected background color
Pla2:MutatieGemaakt_Icon LONG                         !Entry's icon ID
Pla2:Geprint           LIKE(Pla2:Geprint)             !List box control field - type derived from field
Pla2:Geprint_NormalFG  LONG                           !Normal forground color
Pla2:Geprint_NormalBG  LONG                           !Normal background color
Pla2:Geprint_SelectedFG LONG                          !Selected forground color
Pla2:Geprint_SelectedBG LONG                          !Selected background color
Pla2:Geprint_Icon      LONG                           !Entry's icon ID
LOC:Getransferd        LIKE(LOC:Getransferd)          !List box control field - type derived from local data
LOC:Getransferd_NormalFG LONG                         !Normal forground color
LOC:Getransferd_NormalBG LONG                         !Normal background color
LOC:Getransferd_SelectedFG LONG                       !Selected forground color
LOC:Getransferd_SelectedBG LONG                       !Selected background color
LOC:Getransferd_Icon   LONG                           !Entry's icon ID
Pla2:Verwerkt          LIKE(Pla2:Verwerkt)            !List box control field - type derived from field
Pla2:Verwerkt_NormalFG LONG                           !Normal forground color
Pla2:Verwerkt_NormalBG LONG                           !Normal background color
Pla2:Verwerkt_SelectedFG LONG                         !Selected forground color
Pla2:Verwerkt_SelectedBG LONG                         !Selected background color
Pla2:Verwerkt_Icon     LONG                           !Entry's icon ID
Pla2:Gewogen           LIKE(Pla2:Gewogen)             !List box control field - type derived from field
Pla2:Gewogen_NormalFG  LONG                           !Normal forground color
Pla2:Gewogen_NormalBG  LONG                           !Normal background color
Pla2:Gewogen_SelectedFG LONG                          !Selected forground color
Pla2:Gewogen_SelectedBG LONG                          !Selected background color
Pla2:Gewogen_Icon      LONG                           !Entry's icon ID
Pla2:CelOms            LIKE(Pla2:CelOms)              !List box control field - type derived from field
Pla2:CelOms_NormalFG   LONG                           !Normal forground color
Pla2:CelOms_NormalBG   LONG                           !Normal background color
Pla2:CelOms_SelectedFG LONG                           !Selected forground color
Pla2:CelOms_SelectedBG LONG                           !Selected background color
Pla2:Locatienaam       LIKE(Pla2:Locatienaam)         !List box control field - type derived from field
Pla2:Locatienaam_NormalFG LONG                        !Normal forground color
Pla2:Locatienaam_NormalBG LONG                        !Normal background color
Pla2:Locatienaam_SelectedFG LONG                      !Selected forground color
Pla2:Locatienaam_SelectedBG LONG                      !Selected background color
Pla2:Transport         LIKE(Pla2:Transport)           !List box control field - type derived from field
Pla2:Transport_NormalFG LONG                          !Normal forground color
Pla2:Transport_NormalBG LONG                          !Normal background color
Pla2:Transport_SelectedFG LONG                        !Selected forground color
Pla2:Transport_SelectedBG LONG                        !Selected background color
Pla2:PlanningID        LIKE(Pla2:PlanningID)          !List box control field - type derived from field
Pla2:PlanningID_NormalFG LONG                         !Normal forground color
Pla2:PlanningID_NormalBG LONG                         !Normal background color
Pla2:PlanningID_SelectedFG LONG                       !Selected forground color
Pla2:PlanningID_SelectedBG LONG                       !Selected background color
Pla2:InkoopID          LIKE(Pla2:InkoopID)            !Browse hot field - type derived from field
Pla2:KG                LIKE(Pla2:KG)                  !Browse hot field - type derived from field
Pla2:MutatieKG         LIKE(Pla2:MutatieKG)           !Browse hot field - type derived from field
Pla2:MutatiePallets    LIKE(Pla2:MutatiePallets)      !Browse hot field - type derived from field
Pla2:Pallets           LIKE(Pla2:Pallets)             !Browse hot field - type derived from field
Pla2:Planning          LIKE(Pla2:Planning)            !Browse key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
BRW1::View:Browse    VIEW(PlanningVerkoop)
                       PROJECT(Pla3:ArtikelID)
                       PROJECT(Pla3:ArtikelOms)
                       PROJECT(Pla3:FirmaNaam)
                       PROJECT(Pla3:PartijID)
                       PROJECT(Pla3:ExternPartijnr)
                       PROJECT(Pla3:Instructie)
                       PROJECT(Pla3:VerpakkingOmschrijving)
                       PROJECT(Pla3:Planning_TIME)
                       PROJECT(Pla3:MutatieGemaakt)
                       PROJECT(Pla3:Geprint)
                       PROJECT(Pla3:Verwerkt)
                       PROJECT(Pla3:Gewogen)
                       PROJECT(Pla3:CelOms)
                       PROJECT(Pla3:HerkomstOverboekingCelOms)
                       PROJECT(Pla3:LeverancierFirmaNaam)
                       PROJECT(Pla3:Transport)
                       PROJECT(Pla3:PlanningID)
                       PROJECT(Pla3:VerkoopID)
                       PROJECT(Pla3:CelID)
                       PROJECT(Pla3:KG)
                       PROJECT(Pla3:MutatieKG)
                       PROJECT(Pla3:Pallets)
                       PROJECT(Pla3:MutatiePallets)
                       PROJECT(Pla3:Planning)
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?VerkoopList
Pla3:ArtikelID         LIKE(Pla3:ArtikelID)           !List box control field - type derived from field
Pla3:ArtikelID_NormalFG LONG                          !Normal forground color
Pla3:ArtikelID_NormalBG LONG                          !Normal background color
Pla3:ArtikelID_SelectedFG LONG                        !Selected forground color
Pla3:ArtikelID_SelectedBG LONG                        !Selected background color
Pla3:ArtikelOms        LIKE(Pla3:ArtikelOms)          !List box control field - type derived from field
Pla3:ArtikelOms_NormalFG LONG                         !Normal forground color
Pla3:ArtikelOms_NormalBG LONG                         !Normal background color
Pla3:ArtikelOms_SelectedFG LONG                       !Selected forground color
Pla3:ArtikelOms_SelectedBG LONG                       !Selected background color
Pla3:FirmaNaam         LIKE(Pla3:FirmaNaam)           !List box control field - type derived from field
Pla3:FirmaNaam_NormalFG LONG                          !Normal forground color
Pla3:FirmaNaam_NormalBG LONG                          !Normal background color
Pla3:FirmaNaam_SelectedFG LONG                        !Selected forground color
Pla3:FirmaNaam_SelectedBG LONG                        !Selected background color
Pla3:PartijID          LIKE(Pla3:PartijID)            !List box control field - type derived from field
Pla3:PartijID_NormalFG LONG                           !Normal forground color
Pla3:PartijID_NormalBG LONG                           !Normal background color
Pla3:PartijID_SelectedFG LONG                         !Selected forground color
Pla3:PartijID_SelectedBG LONG                         !Selected background color
Pla3:ExternPartijnr    LIKE(Pla3:ExternPartijnr)      !List box control field - type derived from field
Pla3:ExternPartijnr_NormalFG LONG                     !Normal forground color
Pla3:ExternPartijnr_NormalBG LONG                     !Normal background color
Pla3:ExternPartijnr_SelectedFG LONG                   !Selected forground color
Pla3:ExternPartijnr_SelectedBG LONG                   !Selected background color
LOC:VerkoopKG1         LIKE(LOC:VerkoopKG1)           !List box control field - type derived from local data
LOC:VerkoopKG1_NormalFG LONG                          !Normal forground color
LOC:VerkoopKG1_NormalBG LONG                          !Normal background color
LOC:VerkoopKG1_SelectedFG LONG                        !Selected forground color
LOC:VerkoopKG1_SelectedBG LONG                        !Selected background color
Pla3:Instructie        LIKE(Pla3:Instructie)          !List box control field - type derived from field
Pla3:Instructie_NormalFG LONG                         !Normal forground color
Pla3:Instructie_NormalBG LONG                         !Normal background color
Pla3:Instructie_SelectedFG LONG                       !Selected forground color
Pla3:Instructie_SelectedBG LONG                       !Selected background color
Pla3:Instructie_Tip    STRING(80)                     !Field tooltip
Pla3:VerpakkingOmschrijving LIKE(Pla3:VerpakkingOmschrijving) !List box control field - type derived from field
Pla3:VerpakkingOmschrijving_NormalFG LONG             !Normal forground color
Pla3:VerpakkingOmschrijving_NormalBG LONG             !Normal background color
Pla3:VerpakkingOmschrijving_SelectedFG LONG           !Selected forground color
Pla3:VerpakkingOmschrijving_SelectedBG LONG           !Selected background color
Pla3:Planning_TIME     LIKE(Pla3:Planning_TIME)       !List box control field - type derived from field
Pla3:Planning_TIME_NormalFG LONG                      !Normal forground color
Pla3:Planning_TIME_NormalBG LONG                      !Normal background color
Pla3:Planning_TIME_SelectedFG LONG                    !Selected forground color
Pla3:Planning_TIME_SelectedBG LONG                    !Selected background color
LOC:VerkoopPallets1    LIKE(LOC:VerkoopPallets1)      !List box control field - type derived from local data
LOC:VerkoopPallets1_NormalFG LONG                     !Normal forground color
LOC:VerkoopPallets1_NormalBG LONG                     !Normal background color
LOC:VerkoopPallets1_SelectedFG LONG                   !Selected forground color
LOC:VerkoopPallets1_SelectedBG LONG                   !Selected background color
Pla3:MutatieGemaakt    LIKE(Pla3:MutatieGemaakt)      !List box control field - type derived from field
Pla3:MutatieGemaakt_NormalFG LONG                     !Normal forground color
Pla3:MutatieGemaakt_NormalBG LONG                     !Normal background color
Pla3:MutatieGemaakt_SelectedFG LONG                   !Selected forground color
Pla3:MutatieGemaakt_SelectedBG LONG                   !Selected background color
Pla3:MutatieGemaakt_Icon LONG                         !Entry's icon ID
Pla3:Geprint           LIKE(Pla3:Geprint)             !List box control field - type derived from field
Pla3:Geprint_NormalFG  LONG                           !Normal forground color
Pla3:Geprint_NormalBG  LONG                           !Normal background color
Pla3:Geprint_SelectedFG LONG                          !Selected forground color
Pla3:Geprint_SelectedBG LONG                          !Selected background color
Pla3:Geprint_Icon      LONG                           !Entry's icon ID
Pla3:Verwerkt          LIKE(Pla3:Verwerkt)            !List box control field - type derived from field
Pla3:Verwerkt_NormalFG LONG                           !Normal forground color
Pla3:Verwerkt_NormalBG LONG                           !Normal background color
Pla3:Verwerkt_SelectedFG LONG                         !Selected forground color
Pla3:Verwerkt_SelectedBG LONG                         !Selected background color
Pla3:Verwerkt_Icon     LONG                           !Entry's icon ID
Pla3:Gewogen           LIKE(Pla3:Gewogen)             !List box control field - type derived from field
Pla3:Gewogen_NormalFG  LONG                           !Normal forground color
Pla3:Gewogen_NormalBG  LONG                           !Normal background color
Pla3:Gewogen_SelectedFG LONG                          !Selected forground color
Pla3:Gewogen_SelectedBG LONG                          !Selected background color
Pla3:Gewogen_Icon      LONG                           !Entry's icon ID
Pla3:CelOms            LIKE(Pla3:CelOms)              !List box control field - type derived from field
Pla3:CelOms_NormalFG   LONG                           !Normal forground color
Pla3:CelOms_NormalBG   LONG                           !Normal background color
Pla3:CelOms_SelectedFG LONG                           !Selected forground color
Pla3:CelOms_SelectedBG LONG                           !Selected background color
LOC:Locatienaam        LIKE(LOC:Locatienaam)          !List box control field - type derived from local data
LOC:Locatienaam_NormalFG LONG                         !Normal forground color
LOC:Locatienaam_NormalBG LONG                         !Normal background color
LOC:Locatienaam_SelectedFG LONG                       !Selected forground color
LOC:Locatienaam_SelectedBG LONG                       !Selected background color
Pla3:HerkomstOverboekingCelOms LIKE(Pla3:HerkomstOverboekingCelOms) !List box control field - type derived from field
Pla3:HerkomstOverboekingCelOms_NormalFG LONG          !Normal forground color
Pla3:HerkomstOverboekingCelOms_NormalBG LONG          !Normal background color
Pla3:HerkomstOverboekingCelOms_SelectedFG LONG        !Selected forground color
Pla3:HerkomstOverboekingCelOms_SelectedBG LONG        !Selected background color
Pla3:LeverancierFirmaNaam LIKE(Pla3:LeverancierFirmaNaam) !List box control field - type derived from field
Pla3:LeverancierFirmaNaam_NormalFG LONG               !Normal forground color
Pla3:LeverancierFirmaNaam_NormalBG LONG               !Normal background color
Pla3:LeverancierFirmaNaam_SelectedFG LONG             !Selected forground color
Pla3:LeverancierFirmaNaam_SelectedBG LONG             !Selected background color
Pla3:Transport         LIKE(Pla3:Transport)           !List box control field - type derived from field
Pla3:Transport_NormalFG LONG                          !Normal forground color
Pla3:Transport_NormalBG LONG                          !Normal background color
Pla3:Transport_SelectedFG LONG                        !Selected forground color
Pla3:Transport_SelectedBG LONG                        !Selected background color
Pla3:Transport_Tip     STRING(80)                     !Field tooltip
Pla3:PlanningID        LIKE(Pla3:PlanningID)          !List box control field - type derived from field
Pla3:PlanningID_NormalFG LONG                         !Normal forground color
Pla3:PlanningID_NormalBG LONG                         !Normal background color
Pla3:PlanningID_SelectedFG LONG                       !Selected forground color
Pla3:PlanningID_SelectedBG LONG                       !Selected background color
Pla3:PlanningID_Tip    STRING(80)                     !Field tooltip
Pla3:VerkoopID         LIKE(Pla3:VerkoopID)           !Browse hot field - type derived from field
Pla3:CelID             LIKE(Pla3:CelID)               !Browse hot field - type derived from field
LOC:Getransferd        LIKE(LOC:Getransferd)          !Browse hot field - type derived from local data
Pla3:KG                LIKE(Pla3:KG)                  !Browse hot field - type derived from field
Pla3:MutatieKG         LIKE(Pla3:MutatieKG)           !Browse hot field - type derived from field
Pla3:Pallets           LIKE(Pla3:Pallets)             !Browse hot field - type derived from field
Pla3:MutatiePallets    LIKE(Pla3:MutatiePallets)      !Browse hot field - type derived from field
Pla3:Planning          LIKE(Pla3:Planning)            !Browse key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
BRW8::View:Browse    VIEW(PlanningOverboeking)
                       PROJECT(Pla4:ArtikelID)
                       PROJECT(Pla4:ArtikelOms)
                       PROJECT(Pla4:FirmaNaam)
                       PROJECT(Pla4:PartijID)
                       PROJECT(Pla4:ExternPartijnr)
                       PROJECT(Pla4:Instructie)
                       PROJECT(Pla4:VerpakkingOmschrijving)
                       PROJECT(Pla4:Planning_TIME)
                       PROJECT(Pla4:MutatieGemaakt)
                       PROJECT(Pla4:Verwerkt)
                       PROJECT(Pla4:CelOms)
                       PROJECT(Pla4:Locatienaam)
                       PROJECT(Pla4:NaarCelOms)
                       PROJECT(Pla4:Transport)
                       PROJECT(Pla4:PlanningID)
                       PROJECT(Pla4:KG)
                       PROJECT(Pla4:MutatieKG)
                       PROJECT(Pla4:Pallets)
                       PROJECT(Pla4:MutatiePallets)
                       PROJECT(Pla4:Planning)
                     END
Queue:Browse:2       QUEUE                            !Queue declaration for browse/combo box using ?OverboekList
Pla4:ArtikelID         LIKE(Pla4:ArtikelID)           !List box control field - type derived from field
Pla4:ArtikelID_NormalFG LONG                          !Normal forground color
Pla4:ArtikelID_NormalBG LONG                          !Normal background color
Pla4:ArtikelID_SelectedFG LONG                        !Selected forground color
Pla4:ArtikelID_SelectedBG LONG                        !Selected background color
Pla4:ArtikelOms        LIKE(Pla4:ArtikelOms)          !List box control field - type derived from field
Pla4:ArtikelOms_NormalFG LONG                         !Normal forground color
Pla4:ArtikelOms_NormalBG LONG                         !Normal background color
Pla4:ArtikelOms_SelectedFG LONG                       !Selected forground color
Pla4:ArtikelOms_SelectedBG LONG                       !Selected background color
Pla4:FirmaNaam         LIKE(Pla4:FirmaNaam)           !List box control field - type derived from field
Pla4:FirmaNaam_NormalFG LONG                          !Normal forground color
Pla4:FirmaNaam_NormalBG LONG                          !Normal background color
Pla4:FirmaNaam_SelectedFG LONG                        !Selected forground color
Pla4:FirmaNaam_SelectedBG LONG                        !Selected background color
Pla4:PartijID          LIKE(Pla4:PartijID)            !List box control field - type derived from field
Pla4:PartijID_NormalFG LONG                           !Normal forground color
Pla4:PartijID_NormalBG LONG                           !Normal background color
Pla4:PartijID_SelectedFG LONG                         !Selected forground color
Pla4:PartijID_SelectedBG LONG                         !Selected background color
Pla4:ExternPartijnr    LIKE(Pla4:ExternPartijnr)      !List box control field - type derived from field
Pla4:ExternPartijnr_NormalFG LONG                     !Normal forground color
Pla4:ExternPartijnr_NormalBG LONG                     !Normal background color
Pla4:ExternPartijnr_SelectedFG LONG                   !Selected forground color
Pla4:ExternPartijnr_SelectedBG LONG                   !Selected background color
LOC:OverboekingKG1     LIKE(LOC:OverboekingKG1)       !List box control field - type derived from local data
LOC:OverboekingKG1_NormalFG LONG                      !Normal forground color
LOC:OverboekingKG1_NormalBG LONG                      !Normal background color
LOC:OverboekingKG1_SelectedFG LONG                    !Selected forground color
LOC:OverboekingKG1_SelectedBG LONG                    !Selected background color
APla4:OverboekSoort    LIKE(APla4:OverboekSoort)      !List box control field - type derived from field
APla4:OverboekSoort_NormalFG LONG                     !Normal forground color
APla4:OverboekSoort_NormalBG LONG                     !Normal background color
APla4:OverboekSoort_SelectedFG LONG                   !Selected forground color
APla4:OverboekSoort_SelectedBG LONG                   !Selected background color
Pla4:Instructie        LIKE(Pla4:Instructie)          !List box control field - type derived from field
Pla4:Instructie_NormalFG LONG                         !Normal forground color
Pla4:Instructie_NormalBG LONG                         !Normal background color
Pla4:Instructie_SelectedFG LONG                       !Selected forground color
Pla4:Instructie_SelectedBG LONG                       !Selected background color
Pla4:VerpakkingOmschrijving LIKE(Pla4:VerpakkingOmschrijving) !List box control field - type derived from field
Pla4:VerpakkingOmschrijving_NormalFG LONG             !Normal forground color
Pla4:VerpakkingOmschrijving_NormalBG LONG             !Normal background color
Pla4:VerpakkingOmschrijving_SelectedFG LONG           !Selected forground color
Pla4:VerpakkingOmschrijving_SelectedBG LONG           !Selected background color
Pla4:Planning_TIME     LIKE(Pla4:Planning_TIME)       !List box control field - type derived from field
Pla4:Planning_TIME_NormalFG LONG                      !Normal forground color
Pla4:Planning_TIME_NormalBG LONG                      !Normal background color
Pla4:Planning_TIME_SelectedFG LONG                    !Selected forground color
Pla4:Planning_TIME_SelectedBG LONG                    !Selected background color
LOC:OverboekingPallets1 LIKE(LOC:OverboekingPallets1) !List box control field - type derived from local data
LOC:OverboekingPallets1_NormalFG LONG                 !Normal forground color
LOC:OverboekingPallets1_NormalBG LONG                 !Normal background color
LOC:OverboekingPallets1_SelectedFG LONG               !Selected forground color
LOC:OverboekingPallets1_SelectedBG LONG               !Selected background color
Pla4:MutatieGemaakt    LIKE(Pla4:MutatieGemaakt)      !List box control field - type derived from field
Pla4:MutatieGemaakt_NormalFG LONG                     !Normal forground color
Pla4:MutatieGemaakt_NormalBG LONG                     !Normal background color
Pla4:MutatieGemaakt_SelectedFG LONG                   !Selected forground color
Pla4:MutatieGemaakt_SelectedBG LONG                   !Selected background color
Pla4:MutatieGemaakt_Icon LONG                         !Entry's icon ID
LOC:Getransferd        LIKE(LOC:Getransferd)          !List box control field - type derived from local data
LOC:Getransferd_NormalFG LONG                         !Normal forground color
LOC:Getransferd_NormalBG LONG                         !Normal background color
LOC:Getransferd_SelectedFG LONG                       !Selected forground color
LOC:Getransferd_SelectedBG LONG                       !Selected background color
LOC:Getransferd_Icon   LONG                           !Entry's icon ID
Pla4:Verwerkt          LIKE(Pla4:Verwerkt)            !List box control field - type derived from field
Pla4:Verwerkt_NormalFG LONG                           !Normal forground color
Pla4:Verwerkt_NormalBG LONG                           !Normal background color
Pla4:Verwerkt_SelectedFG LONG                         !Selected forground color
Pla4:Verwerkt_SelectedBG LONG                         !Selected background color
Pla4:Verwerkt_Icon     LONG                           !Entry's icon ID
Pla4:CelOms            LIKE(Pla4:CelOms)              !List box control field - type derived from field
Pla4:CelOms_NormalFG   LONG                           !Normal forground color
Pla4:CelOms_NormalBG   LONG                           !Normal background color
Pla4:CelOms_SelectedFG LONG                           !Selected forground color
Pla4:CelOms_SelectedBG LONG                           !Selected background color
Pla4:Locatienaam       LIKE(Pla4:Locatienaam)         !List box control field - type derived from field
Pla4:Locatienaam_NormalFG LONG                        !Normal forground color
Pla4:Locatienaam_NormalBG LONG                        !Normal background color
Pla4:Locatienaam_SelectedFG LONG                      !Selected forground color
Pla4:Locatienaam_SelectedBG LONG                      !Selected background color
Pla4:NaarCelOms        LIKE(Pla4:NaarCelOms)          !List box control field - type derived from field
Pla4:NaarCelOms_NormalFG LONG                         !Normal forground color
Pla4:NaarCelOms_NormalBG LONG                         !Normal background color
Pla4:NaarCelOms_SelectedFG LONG                       !Selected forground color
Pla4:NaarCelOms_SelectedBG LONG                       !Selected background color
APla4:NaarLocatienaam  LIKE(APla4:NaarLocatienaam)    !List box control field - type derived from field
APla4:NaarLocatienaam_NormalFG LONG                   !Normal forground color
APla4:NaarLocatienaam_NormalBG LONG                   !Normal background color
APla4:NaarLocatienaam_SelectedFG LONG                 !Selected forground color
APla4:NaarLocatienaam_SelectedBG LONG                 !Selected background color
Pla4:Transport         LIKE(Pla4:Transport)           !List box control field - type derived from field
Pla4:Transport_NormalFG LONG                          !Normal forground color
Pla4:Transport_NormalBG LONG                          !Normal background color
Pla4:Transport_SelectedFG LONG                        !Selected forground color
Pla4:Transport_SelectedBG LONG                        !Selected background color
Pla4:PlanningID        LIKE(Pla4:PlanningID)          !Browse hot field - type derived from field
Pla4:KG                LIKE(Pla4:KG)                  !Browse hot field - type derived from field
Pla4:MutatieKG         LIKE(Pla4:MutatieKG)           !Browse hot field - type derived from field
Pla4:Pallets           LIKE(Pla4:Pallets)             !Browse hot field - type derived from field
Pla4:MutatiePallets    LIKE(Pla4:MutatiePallets)      !Browse hot field - type derived from field
Pla4:Planning          LIKE(Pla4:Planning)            !Browse key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
BRW3::View:Browse    VIEW(APlanningInkoop)
                       PROJECT(APla2:ArtikelID)
                       PROJECT(APla2:ArtikelOms)
                       PROJECT(APla2:FirmaNaam)
                       PROJECT(APla2:Instructie)
                       PROJECT(APla2:VerpakkingOmschrijving)
                       PROJECT(APla2:Planning_TIME)
                       PROJECT(APla2:MutatieGemaakt)
                       PROJECT(APla2:Geprint)
                       PROJECT(APla2:Verwerkt)
                       PROJECT(APla2:Gewogen)
                       PROJECT(APla2:CelOms)
                       PROJECT(APla2:Locatienaam)
                       PROJECT(APla2:Transport)
                       PROJECT(APla2:PlanningID)
                       PROJECT(APla2:InkoopID)
                       PROJECT(APla2:KG)
                       PROJECT(APla2:MutatieKG)
                       PROJECT(APla2:MutatiePallets)
                       PROJECT(APla2:Pallets)
                       PROJECT(APla2:Planning)
                     END
Queue:Browse:3       QUEUE                            !Queue declaration for browse/combo box using ?InkoopList2
APla2:ArtikelID        LIKE(APla2:ArtikelID)          !List box control field - type derived from field
APla2:ArtikelID_NormalFG LONG                         !Normal forground color
APla2:ArtikelID_NormalBG LONG                         !Normal background color
APla2:ArtikelID_SelectedFG LONG                       !Selected forground color
APla2:ArtikelID_SelectedBG LONG                       !Selected background color
APla2:ArtikelOms       LIKE(APla2:ArtikelOms)         !List box control field - type derived from field
APla2:ArtikelOms_NormalFG LONG                        !Normal forground color
APla2:ArtikelOms_NormalBG LONG                        !Normal background color
APla2:ArtikelOms_SelectedFG LONG                      !Selected forground color
APla2:ArtikelOms_SelectedBG LONG                      !Selected background color
APla2:FirmaNaam        LIKE(APla2:FirmaNaam)          !List box control field - type derived from field
APla2:FirmaNaam_NormalFG LONG                         !Normal forground color
APla2:FirmaNaam_NormalBG LONG                         !Normal background color
APla2:FirmaNaam_SelectedFG LONG                       !Selected forground color
APla2:FirmaNaam_SelectedBG LONG                       !Selected background color
LOC:InkoopKG2          LIKE(LOC:InkoopKG2)            !List box control field - type derived from local data
LOC:InkoopKG2_NormalFG LONG                           !Normal forground color
LOC:InkoopKG2_NormalBG LONG                           !Normal background color
LOC:InkoopKG2_SelectedFG LONG                         !Selected forground color
LOC:InkoopKG2_SelectedBG LONG                         !Selected background color
APla2:Instructie       LIKE(APla2:Instructie)         !List box control field - type derived from field
APla2:Instructie_NormalFG LONG                        !Normal forground color
APla2:Instructie_NormalBG LONG                        !Normal background color
APla2:Instructie_SelectedFG LONG                      !Selected forground color
APla2:Instructie_SelectedBG LONG                      !Selected background color
APla2:VerpakkingOmschrijving LIKE(APla2:VerpakkingOmschrijving) !List box control field - type derived from field
APla2:VerpakkingOmschrijving_NormalFG LONG            !Normal forground color
APla2:VerpakkingOmschrijving_NormalBG LONG            !Normal background color
APla2:VerpakkingOmschrijving_SelectedFG LONG          !Selected forground color
APla2:VerpakkingOmschrijving_SelectedBG LONG          !Selected background color
APla2:Planning_TIME    LIKE(APla2:Planning_TIME)      !List box control field - type derived from field
APla2:Planning_TIME_NormalFG LONG                     !Normal forground color
APla2:Planning_TIME_NormalBG LONG                     !Normal background color
APla2:Planning_TIME_SelectedFG LONG                   !Selected forground color
APla2:Planning_TIME_SelectedBG LONG                   !Selected background color
LOC:InkoopPallets2     LIKE(LOC:InkoopPallets2)       !List box control field - type derived from local data
LOC:InkoopPallets2_NormalFG LONG                      !Normal forground color
LOC:InkoopPallets2_NormalBG LONG                      !Normal background color
LOC:InkoopPallets2_SelectedFG LONG                    !Selected forground color
LOC:InkoopPallets2_SelectedBG LONG                    !Selected background color
APla2:MutatieGemaakt   LIKE(APla2:MutatieGemaakt)     !List box control field - type derived from field
APla2:MutatieGemaakt_NormalFG LONG                    !Normal forground color
APla2:MutatieGemaakt_NormalBG LONG                    !Normal background color
APla2:MutatieGemaakt_SelectedFG LONG                  !Selected forground color
APla2:MutatieGemaakt_SelectedBG LONG                  !Selected background color
APla2:MutatieGemaakt_Icon LONG                        !Entry's icon ID
APla2:Geprint          LIKE(APla2:Geprint)            !List box control field - type derived from field
APla2:Geprint_NormalFG LONG                           !Normal forground color
APla2:Geprint_NormalBG LONG                           !Normal background color
APla2:Geprint_SelectedFG LONG                         !Selected forground color
APla2:Geprint_SelectedBG LONG                         !Selected background color
APla2:Geprint_Icon     LONG                           !Entry's icon ID
LOC:Getransferd        LIKE(LOC:Getransferd)          !List box control field - type derived from local data
LOC:Getransferd_NormalFG LONG                         !Normal forground color
LOC:Getransferd_NormalBG LONG                         !Normal background color
LOC:Getransferd_SelectedFG LONG                       !Selected forground color
LOC:Getransferd_SelectedBG LONG                       !Selected background color
LOC:Getransferd_Icon   LONG                           !Entry's icon ID
APla2:Verwerkt         LIKE(APla2:Verwerkt)           !List box control field - type derived from field
APla2:Verwerkt_NormalFG LONG                          !Normal forground color
APla2:Verwerkt_NormalBG LONG                          !Normal background color
APla2:Verwerkt_SelectedFG LONG                        !Selected forground color
APla2:Verwerkt_SelectedBG LONG                        !Selected background color
APla2:Verwerkt_Icon    LONG                           !Entry's icon ID
APla2:Gewogen          LIKE(APla2:Gewogen)            !List box control field - type derived from field
APla2:Gewogen_NormalFG LONG                           !Normal forground color
APla2:Gewogen_NormalBG LONG                           !Normal background color
APla2:Gewogen_SelectedFG LONG                         !Selected forground color
APla2:Gewogen_SelectedBG LONG                         !Selected background color
APla2:Gewogen_Icon     LONG                           !Entry's icon ID
APla2:CelOms           LIKE(APla2:CelOms)             !List box control field - type derived from field
APla2:CelOms_NormalFG  LONG                           !Normal forground color
APla2:CelOms_NormalBG  LONG                           !Normal background color
APla2:CelOms_SelectedFG LONG                          !Selected forground color
APla2:CelOms_SelectedBG LONG                          !Selected background color
APla2:Locatienaam      LIKE(APla2:Locatienaam)        !List box control field - type derived from field
APla2:Locatienaam_NormalFG LONG                       !Normal forground color
APla2:Locatienaam_NormalBG LONG                       !Normal background color
APla2:Locatienaam_SelectedFG LONG                     !Selected forground color
APla2:Locatienaam_SelectedBG LONG                     !Selected background color
APla2:Transport        LIKE(APla2:Transport)          !List box control field - type derived from field
APla2:Transport_NormalFG LONG                         !Normal forground color
APla2:Transport_NormalBG LONG                         !Normal background color
APla2:Transport_SelectedFG LONG                       !Selected forground color
APla2:Transport_SelectedBG LONG                       !Selected background color
APla2:PlanningID       LIKE(APla2:PlanningID)         !List box control field - type derived from field
APla2:PlanningID_NormalFG LONG                        !Normal forground color
APla2:PlanningID_NormalBG LONG                        !Normal background color
APla2:PlanningID_SelectedFG LONG                      !Selected forground color
APla2:PlanningID_SelectedBG LONG                      !Selected background color
APla2:InkoopID         LIKE(APla2:InkoopID)           !Browse hot field - type derived from field
APla2:KG               LIKE(APla2:KG)                 !Browse hot field - type derived from field
APla2:MutatieKG        LIKE(APla2:MutatieKG)          !Browse hot field - type derived from field
APla2:MutatiePallets   LIKE(APla2:MutatiePallets)     !Browse hot field - type derived from field
APla2:Pallets          LIKE(APla2:Pallets)            !Browse hot field - type derived from field
APla2:Planning         LIKE(APla2:Planning)           !Browse key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
BRW9::View:Browse    VIEW(APlanningOverboeking)
                       PROJECT(APla4:ArtikelID)
                       PROJECT(APla4:ArtikelOms)
                       PROJECT(APla4:FirmaNaam)
                       PROJECT(APla4:PartijID)
                       PROJECT(APla4:ExternPartijnr)
                       PROJECT(APla4:Instructie)
                       PROJECT(APla4:VerpakkingOmschrijving)
                       PROJECT(APla4:Planning_TIME)
                       PROJECT(APla4:OverboekSoort)
                       PROJECT(APla4:MutatieGemaakt)
                       PROJECT(APla4:Verwerkt)
                       PROJECT(APla4:CelOms)
                       PROJECT(APla4:Locatienaam)
                       PROJECT(APla4:NaarCelOms)
                       PROJECT(APla4:NaarLocatienaam)
                       PROJECT(APla4:Transport)
                       PROJECT(APla4:PlanningID)
                       PROJECT(APla4:KG)
                       PROJECT(APla4:MutatieKG)
                       PROJECT(APla4:Pallets)
                       PROJECT(APla4:MutatiePallets)
                       PROJECT(APla4:Planning)
                     END
Queue:Browse:4       QUEUE                            !Queue declaration for browse/combo box using ?OverboekList2
APla4:ArtikelID        LIKE(APla4:ArtikelID)          !List box control field - type derived from field
APla4:ArtikelID_NormalFG LONG                         !Normal forground color
APla4:ArtikelID_NormalBG LONG                         !Normal background color
APla4:ArtikelID_SelectedFG LONG                       !Selected forground color
APla4:ArtikelID_SelectedBG LONG                       !Selected background color
APla4:ArtikelOms       LIKE(APla4:ArtikelOms)         !List box control field - type derived from field
APla4:ArtikelOms_NormalFG LONG                        !Normal forground color
APla4:ArtikelOms_NormalBG LONG                        !Normal background color
APla4:ArtikelOms_SelectedFG LONG                      !Selected forground color
APla4:ArtikelOms_SelectedBG LONG                      !Selected background color
APla4:FirmaNaam        LIKE(APla4:FirmaNaam)          !List box control field - type derived from field
APla4:FirmaNaam_NormalFG LONG                         !Normal forground color
APla4:FirmaNaam_NormalBG LONG                         !Normal background color
APla4:FirmaNaam_SelectedFG LONG                       !Selected forground color
APla4:FirmaNaam_SelectedBG LONG                       !Selected background color
APla4:PartijID         LIKE(APla4:PartijID)           !List box control field - type derived from field
APla4:PartijID_NormalFG LONG                          !Normal forground color
APla4:PartijID_NormalBG LONG                          !Normal background color
APla4:PartijID_SelectedFG LONG                        !Selected forground color
APla4:PartijID_SelectedBG LONG                        !Selected background color
APla4:ExternPartijnr   LIKE(APla4:ExternPartijnr)     !List box control field - type derived from field
APla4:ExternPartijnr_NormalFG LONG                    !Normal forground color
APla4:ExternPartijnr_NormalBG LONG                    !Normal background color
APla4:ExternPartijnr_SelectedFG LONG                  !Selected forground color
APla4:ExternPartijnr_SelectedBG LONG                  !Selected background color
LOC:OverboekingKG2     LIKE(LOC:OverboekingKG2)       !List box control field - type derived from local data
LOC:OverboekingKG2_NormalFG LONG                      !Normal forground color
LOC:OverboekingKG2_NormalBG LONG                      !Normal background color
LOC:OverboekingKG2_SelectedFG LONG                    !Selected forground color
LOC:OverboekingKG2_SelectedBG LONG                    !Selected background color
APla4:Instructie       LIKE(APla4:Instructie)         !List box control field - type derived from field
APla4:Instructie_NormalFG LONG                        !Normal forground color
APla4:Instructie_NormalBG LONG                        !Normal background color
APla4:Instructie_SelectedFG LONG                      !Selected forground color
APla4:Instructie_SelectedBG LONG                      !Selected background color
APla4:VerpakkingOmschrijving LIKE(APla4:VerpakkingOmschrijving) !List box control field - type derived from field
APla4:VerpakkingOmschrijving_NormalFG LONG            !Normal forground color
APla4:VerpakkingOmschrijving_NormalBG LONG            !Normal background color
APla4:VerpakkingOmschrijving_SelectedFG LONG          !Selected forground color
APla4:VerpakkingOmschrijving_SelectedBG LONG          !Selected background color
APla4:Planning_TIME    LIKE(APla4:Planning_TIME)      !List box control field - type derived from field
APla4:Planning_TIME_NormalFG LONG                     !Normal forground color
APla4:Planning_TIME_NormalBG LONG                     !Normal background color
APla4:Planning_TIME_SelectedFG LONG                   !Selected forground color
APla4:Planning_TIME_SelectedBG LONG                   !Selected background color
LOC:OverboekingPallets2 LIKE(LOC:OverboekingPallets2) !List box control field - type derived from local data
LOC:OverboekingPallets2_NormalFG LONG                 !Normal forground color
LOC:OverboekingPallets2_NormalBG LONG                 !Normal background color
LOC:OverboekingPallets2_SelectedFG LONG               !Selected forground color
LOC:OverboekingPallets2_SelectedBG LONG               !Selected background color
APla4:OverboekSoort    LIKE(APla4:OverboekSoort)      !List box control field - type derived from field
APla4:OverboekSoort_NormalFG LONG                     !Normal forground color
APla4:OverboekSoort_NormalBG LONG                     !Normal background color
APla4:OverboekSoort_SelectedFG LONG                   !Selected forground color
APla4:OverboekSoort_SelectedBG LONG                   !Selected background color
APla4:MutatieGemaakt   LIKE(APla4:MutatieGemaakt)     !List box control field - type derived from field
APla4:MutatieGemaakt_NormalFG LONG                    !Normal forground color
APla4:MutatieGemaakt_NormalBG LONG                    !Normal background color
APla4:MutatieGemaakt_SelectedFG LONG                  !Selected forground color
APla4:MutatieGemaakt_SelectedBG LONG                  !Selected background color
APla4:MutatieGemaakt_Icon LONG                        !Entry's icon ID
LOC:Getransferd        LIKE(LOC:Getransferd)          !List box control field - type derived from local data
LOC:Getransferd_NormalFG LONG                         !Normal forground color
LOC:Getransferd_NormalBG LONG                         !Normal background color
LOC:Getransferd_SelectedFG LONG                       !Selected forground color
LOC:Getransferd_SelectedBG LONG                       !Selected background color
LOC:Getransferd_Icon   LONG                           !Entry's icon ID
APla4:Verwerkt         LIKE(APla4:Verwerkt)           !List box control field - type derived from field
APla4:Verwerkt_NormalFG LONG                          !Normal forground color
APla4:Verwerkt_NormalBG LONG                          !Normal background color
APla4:Verwerkt_SelectedFG LONG                        !Selected forground color
APla4:Verwerkt_SelectedBG LONG                        !Selected background color
APla4:Verwerkt_Icon    LONG                           !Entry's icon ID
APla4:CelOms           LIKE(APla4:CelOms)             !List box control field - type derived from field
APla4:CelOms_NormalFG  LONG                           !Normal forground color
APla4:CelOms_NormalBG  LONG                           !Normal background color
APla4:CelOms_SelectedFG LONG                          !Selected forground color
APla4:CelOms_SelectedBG LONG                          !Selected background color
APla4:Locatienaam      LIKE(APla4:Locatienaam)        !List box control field - type derived from field
APla4:Locatienaam_NormalFG LONG                       !Normal forground color
APla4:Locatienaam_NormalBG LONG                       !Normal background color
APla4:Locatienaam_SelectedFG LONG                     !Selected forground color
APla4:Locatienaam_SelectedBG LONG                     !Selected background color
APla4:NaarCelOms       LIKE(APla4:NaarCelOms)         !List box control field - type derived from field
APla4:NaarCelOms_NormalFG LONG                        !Normal forground color
APla4:NaarCelOms_NormalBG LONG                        !Normal background color
APla4:NaarCelOms_SelectedFG LONG                      !Selected forground color
APla4:NaarCelOms_SelectedBG LONG                      !Selected background color
APla4:NaarLocatienaam  LIKE(APla4:NaarLocatienaam)    !List box control field - type derived from field
APla4:NaarLocatienaam_NormalFG LONG                   !Normal forground color
APla4:NaarLocatienaam_NormalBG LONG                   !Normal background color
APla4:NaarLocatienaam_SelectedFG LONG                 !Selected forground color
APla4:NaarLocatienaam_SelectedBG LONG                 !Selected background color
APla4:Transport        LIKE(APla4:Transport)          !List box control field - type derived from field
APla4:Transport_NormalFG LONG                         !Normal forground color
APla4:Transport_NormalBG LONG                         !Normal background color
APla4:Transport_SelectedFG LONG                       !Selected forground color
APla4:Transport_SelectedBG LONG                       !Selected background color
APla4:PlanningID       LIKE(APla4:PlanningID)         !Browse hot field - type derived from field
APla4:KG               LIKE(APla4:KG)                 !Browse hot field - type derived from field
APla4:MutatieKG        LIKE(APla4:MutatieKG)          !Browse hot field - type derived from field
APla4:Pallets          LIKE(APla4:Pallets)            !Browse hot field - type derived from field
APla4:MutatiePallets   LIKE(APla4:MutatiePallets)     !Browse hot field - type derived from field
APla4:Planning         LIKE(APla4:Planning)           !Browse key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
BRW12::View:Browse   VIEW(APlanningVerkoop)
                       PROJECT(APla3:ArtikelID)
                       PROJECT(APla3:ArtikelOms)
                       PROJECT(APla3:FirmaNaam)
                       PROJECT(APla3:PartijID)
                       PROJECT(APla3:ExternPartijnr)
                       PROJECT(APla3:Instructie)
                       PROJECT(APla3:VerpakkingOmschrijving)
                       PROJECT(APla3:Planning_TIME)
                       PROJECT(APla3:MutatieGemaakt)
                       PROJECT(APla3:Geprint)
                       PROJECT(APla3:Verwerkt)
                       PROJECT(APla3:Gewogen)
                       PROJECT(APla3:CelOms)
                       PROJECT(APla3:HerkomstOverboekingCelOms)
                       PROJECT(APla3:LeverancierFirmaNaam)
                       PROJECT(APla3:Transport)
                       PROJECT(APla3:PlanningID)
                       PROJECT(APla3:VerkoopID)
                       PROJECT(APla3:CelID)
                       PROJECT(APla3:MutatieKG)
                       PROJECT(APla3:KG)
                       PROJECT(APla3:Pallets)
                       PROJECT(APla3:MutatiePallets)
                       PROJECT(APla3:Planning)
                     END
Queue:Browse:5       QUEUE                            !Queue declaration for browse/combo box using ?VerkoopList:2
APla3:ArtikelID        LIKE(APla3:ArtikelID)          !List box control field - type derived from field
APla3:ArtikelID_NormalFG LONG                         !Normal forground color
APla3:ArtikelID_NormalBG LONG                         !Normal background color
APla3:ArtikelID_SelectedFG LONG                       !Selected forground color
APla3:ArtikelID_SelectedBG LONG                       !Selected background color
APla3:ArtikelOms       LIKE(APla3:ArtikelOms)         !List box control field - type derived from field
APla3:ArtikelOms_NormalFG LONG                        !Normal forground color
APla3:ArtikelOms_NormalBG LONG                        !Normal background color
APla3:ArtikelOms_SelectedFG LONG                      !Selected forground color
APla3:ArtikelOms_SelectedBG LONG                      !Selected background color
APla3:FirmaNaam        LIKE(APla3:FirmaNaam)          !List box control field - type derived from field
APla3:FirmaNaam_NormalFG LONG                         !Normal forground color
APla3:FirmaNaam_NormalBG LONG                         !Normal background color
APla3:FirmaNaam_SelectedFG LONG                       !Selected forground color
APla3:FirmaNaam_SelectedBG LONG                       !Selected background color
APla3:PartijID         LIKE(APla3:PartijID)           !List box control field - type derived from field
APla3:PartijID_NormalFG LONG                          !Normal forground color
APla3:PartijID_NormalBG LONG                          !Normal background color
APla3:PartijID_SelectedFG LONG                        !Selected forground color
APla3:PartijID_SelectedBG LONG                        !Selected background color
APla3:ExternPartijnr   LIKE(APla3:ExternPartijnr)     !List box control field - type derived from field
APla3:ExternPartijnr_NormalFG LONG                    !Normal forground color
APla3:ExternPartijnr_NormalBG LONG                    !Normal background color
APla3:ExternPartijnr_SelectedFG LONG                  !Selected forground color
APla3:ExternPartijnr_SelectedBG LONG                  !Selected background color
LOC:VerkoopKG2         LIKE(LOC:VerkoopKG2)           !List box control field - type derived from local data
LOC:VerkoopKG2_NormalFG LONG                          !Normal forground color
LOC:VerkoopKG2_NormalBG LONG                          !Normal background color
LOC:VerkoopKG2_SelectedFG LONG                        !Selected forground color
LOC:VerkoopKG2_SelectedBG LONG                        !Selected background color
APla3:Instructie       LIKE(APla3:Instructie)         !List box control field - type derived from field
APla3:Instructie_NormalFG LONG                        !Normal forground color
APla3:Instructie_NormalBG LONG                        !Normal background color
APla3:Instructie_SelectedFG LONG                      !Selected forground color
APla3:Instructie_SelectedBG LONG                      !Selected background color
APla3:Instructie_Tip   STRING(80)                     !Field tooltip
APla3:VerpakkingOmschrijving LIKE(APla3:VerpakkingOmschrijving) !List box control field - type derived from field
APla3:VerpakkingOmschrijving_NormalFG LONG            !Normal forground color
APla3:VerpakkingOmschrijving_NormalBG LONG            !Normal background color
APla3:VerpakkingOmschrijving_SelectedFG LONG          !Selected forground color
APla3:VerpakkingOmschrijving_SelectedBG LONG          !Selected background color
APla3:Planning_TIME    LIKE(APla3:Planning_TIME)      !List box control field - type derived from field
APla3:Planning_TIME_NormalFG LONG                     !Normal forground color
APla3:Planning_TIME_NormalBG LONG                     !Normal background color
APla3:Planning_TIME_SelectedFG LONG                   !Selected forground color
APla3:Planning_TIME_SelectedBG LONG                   !Selected background color
LOC:VerkoopPallets2    LIKE(LOC:VerkoopPallets2)      !List box control field - type derived from local data
LOC:VerkoopPallets2_NormalFG LONG                     !Normal forground color
LOC:VerkoopPallets2_NormalBG LONG                     !Normal background color
LOC:VerkoopPallets2_SelectedFG LONG                   !Selected forground color
LOC:VerkoopPallets2_SelectedBG LONG                   !Selected background color
APla3:MutatieGemaakt   LIKE(APla3:MutatieGemaakt)     !List box control field - type derived from field
APla3:MutatieGemaakt_NormalFG LONG                    !Normal forground color
APla3:MutatieGemaakt_NormalBG LONG                    !Normal background color
APla3:MutatieGemaakt_SelectedFG LONG                  !Selected forground color
APla3:MutatieGemaakt_SelectedBG LONG                  !Selected background color
APla3:MutatieGemaakt_Icon LONG                        !Entry's icon ID
APla3:Geprint          LIKE(APla3:Geprint)            !List box control field - type derived from field
APla3:Geprint_NormalFG LONG                           !Normal forground color
APla3:Geprint_NormalBG LONG                           !Normal background color
APla3:Geprint_SelectedFG LONG                         !Selected forground color
APla3:Geprint_SelectedBG LONG                         !Selected background color
APla3:Geprint_Icon     LONG                           !Entry's icon ID
APla3:Verwerkt         LIKE(APla3:Verwerkt)           !List box control field - type derived from field
APla3:Verwerkt_NormalFG LONG                          !Normal forground color
APla3:Verwerkt_NormalBG LONG                          !Normal background color
APla3:Verwerkt_SelectedFG LONG                        !Selected forground color
APla3:Verwerkt_SelectedBG LONG                        !Selected background color
APla3:Verwerkt_Icon    LONG                           !Entry's icon ID
APla3:Gewogen          LIKE(APla3:Gewogen)            !List box control field - type derived from field
APla3:Gewogen_NormalFG LONG                           !Normal forground color
APla3:Gewogen_NormalBG LONG                           !Normal background color
APla3:Gewogen_SelectedFG LONG                         !Selected forground color
APla3:Gewogen_SelectedBG LONG                         !Selected background color
APla3:Gewogen_Icon     LONG                           !Entry's icon ID
APla3:CelOms           LIKE(APla3:CelOms)             !List box control field - type derived from field
APla3:CelOms_NormalFG  LONG                           !Normal forground color
APla3:CelOms_NormalBG  LONG                           !Normal background color
APla3:CelOms_SelectedFG LONG                          !Selected forground color
APla3:CelOms_SelectedBG LONG                          !Selected background color
LOC:Locatienaam        LIKE(LOC:Locatienaam)          !List box control field - type derived from local data
LOC:Locatienaam_NormalFG LONG                         !Normal forground color
LOC:Locatienaam_NormalBG LONG                         !Normal background color
LOC:Locatienaam_SelectedFG LONG                       !Selected forground color
LOC:Locatienaam_SelectedBG LONG                       !Selected background color
APla3:HerkomstOverboekingCelOms LIKE(APla3:HerkomstOverboekingCelOms) !List box control field - type derived from field
APla3:HerkomstOverboekingCelOms_NormalFG LONG         !Normal forground color
APla3:HerkomstOverboekingCelOms_NormalBG LONG         !Normal background color
APla3:HerkomstOverboekingCelOms_SelectedFG LONG       !Selected forground color
APla3:HerkomstOverboekingCelOms_SelectedBG LONG       !Selected background color
APla3:LeverancierFirmaNaam LIKE(APla3:LeverancierFirmaNaam) !List box control field - type derived from field
APla3:LeverancierFirmaNaam_NormalFG LONG              !Normal forground color
APla3:LeverancierFirmaNaam_NormalBG LONG              !Normal background color
APla3:LeverancierFirmaNaam_SelectedFG LONG            !Selected forground color
APla3:LeverancierFirmaNaam_SelectedBG LONG            !Selected background color
APla3:Transport        LIKE(APla3:Transport)          !List box control field - type derived from field
APla3:Transport_NormalFG LONG                         !Normal forground color
APla3:Transport_NormalBG LONG                         !Normal background color
APla3:Transport_SelectedFG LONG                       !Selected forground color
APla3:Transport_SelectedBG LONG                       !Selected background color
APla3:Transport_Tip    STRING(80)                     !Field tooltip
APla3:PlanningID       LIKE(APla3:PlanningID)         !List box control field - type derived from field
APla3:PlanningID_NormalFG LONG                        !Normal forground color
APla3:PlanningID_NormalBG LONG                        !Normal background color
APla3:PlanningID_SelectedFG LONG                      !Selected forground color
APla3:PlanningID_SelectedBG LONG                      !Selected background color
APla3:PlanningID_Tip   STRING(80)                     !Field tooltip
APla3:VerkoopID        LIKE(APla3:VerkoopID)          !Browse hot field - type derived from field
APla3:CelID            LIKE(APla3:CelID)              !Browse hot field - type derived from field
APla3:MutatieKG        LIKE(APla3:MutatieKG)          !Browse hot field - type derived from field
LOC:Getransferd        LIKE(LOC:Getransferd)          !Browse hot field - type derived from local data
APla3:KG               LIKE(APla3:KG)                 !Browse hot field - type derived from field
APla3:Pallets          LIKE(APla3:Pallets)            !Browse hot field - type derived from field
APla3:MutatiePallets   LIKE(APla3:MutatiePallets)     !Browse hot field - type derived from field
APla3:Planning         LIKE(APla3:Planning)           !Browse key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
BRW11::View:Browse   VIEW(Activiteit)
                       PROJECT(ACT:Datum)
                       PROJECT(ACT:Tijd)
                       PROJECT(ACT:Uitgevoerd)
                       PROJECT(ACT:Omschrijving)
                       PROJECT(ACT:ActiviteitID)
                       PROJECT(ACT:DatumTijd)
                       PROJECT(ACT:PlanningID)
                       JOIN(AAPla3:PlanningID_K,ACT:PlanningID)
                         PROJECT(AAPla3:ArtikelID)
                         PROJECT(AAPla3:ArtikelOms)
                         PROJECT(AAPla3:FirmaNaam)
                         PROJECT(AAPla3:PartijID)
                         PROJECT(AAPla3:ExternPartijnr)
                         PROJECT(AAPla3:Planning_TIME)
                         PROJECT(AAPla3:Planning_DATE)
                         PROJECT(AAPla3:Instructie)
                         PROJECT(AAPla3:VerpakkingOmschrijving)
                         PROJECT(AAPla3:MutatieGemaakt)
                         PROJECT(AAPla3:Geprint)
                         PROJECT(AAPla3:Verwerkt)
                         PROJECT(AAPla3:Gewogen)
                         PROJECT(AAPla3:CelOms)
                         PROJECT(AAPla3:LeverancierFirmaNaam)
                         PROJECT(AAPla3:Transport)
                         PROJECT(AAPla3:PlanningID)
                         PROJECT(AAPla3:MutatieKG)
                         PROJECT(AAPla3:MutatiePallets)
                         PROJECT(AAPla3:KG)
                         PROJECT(AAPla3:Pallets)
                       END
                     END
Queue:Browse:6       QUEUE                            !Queue declaration for browse/combo box using ?List
ACT:Datum              LIKE(ACT:Datum)                !List box control field - type derived from field
ACT:Datum_NormalFG     LONG                           !Normal forground color
ACT:Datum_NormalBG     LONG                           !Normal background color
ACT:Datum_SelectedFG   LONG                           !Selected forground color
ACT:Datum_SelectedBG   LONG                           !Selected background color
ACT:Tijd               LIKE(ACT:Tijd)                 !List box control field - type derived from field
ACT:Tijd_NormalFG      LONG                           !Normal forground color
ACT:Tijd_NormalBG      LONG                           !Normal background color
ACT:Tijd_SelectedFG    LONG                           !Selected forground color
ACT:Tijd_SelectedBG    LONG                           !Selected background color
ACT:Uitgevoerd         LIKE(ACT:Uitgevoerd)           !List box control field - type derived from field
ACT:Uitgevoerd_NormalFG LONG                          !Normal forground color
ACT:Uitgevoerd_NormalBG LONG                          !Normal background color
ACT:Uitgevoerd_SelectedFG LONG                        !Selected forground color
ACT:Uitgevoerd_SelectedBG LONG                        !Selected background color
ACT:Uitgevoerd_Icon    LONG                           !Entry's icon ID
ACT:Omschrijving       LIKE(ACT:Omschrijving)         !List box control field - type derived from field
ACT:Omschrijving_NormalFG LONG                        !Normal forground color
ACT:Omschrijving_NormalBG LONG                        !Normal background color
ACT:Omschrijving_SelectedFG LONG                      !Selected forground color
ACT:Omschrijving_SelectedBG LONG                      !Selected background color
AAPla3:ArtikelID       LIKE(AAPla3:ArtikelID)         !List box control field - type derived from field
AAPla3:ArtikelID_NormalFG LONG                        !Normal forground color
AAPla3:ArtikelID_NormalBG LONG                        !Normal background color
AAPla3:ArtikelID_SelectedFG LONG                      !Selected forground color
AAPla3:ArtikelID_SelectedBG LONG                      !Selected background color
AAPla3:ArtikelOms      LIKE(AAPla3:ArtikelOms)        !List box control field - type derived from field
AAPla3:ArtikelOms_NormalFG LONG                       !Normal forground color
AAPla3:ArtikelOms_NormalBG LONG                       !Normal background color
AAPla3:ArtikelOms_SelectedFG LONG                     !Selected forground color
AAPla3:ArtikelOms_SelectedBG LONG                     !Selected background color
AAPla3:FirmaNaam       LIKE(AAPla3:FirmaNaam)         !List box control field - type derived from field
AAPla3:FirmaNaam_NormalFG LONG                        !Normal forground color
AAPla3:FirmaNaam_NormalBG LONG                        !Normal background color
AAPla3:FirmaNaam_SelectedFG LONG                      !Selected forground color
AAPla3:FirmaNaam_SelectedBG LONG                      !Selected background color
AAPla3:PartijID        LIKE(AAPla3:PartijID)          !List box control field - type derived from field
AAPla3:PartijID_NormalFG LONG                         !Normal forground color
AAPla3:PartijID_NormalBG LONG                         !Normal background color
AAPla3:PartijID_SelectedFG LONG                       !Selected forground color
AAPla3:PartijID_SelectedBG LONG                       !Selected background color
AAPla3:ExternPartijnr  LIKE(AAPla3:ExternPartijnr)    !List box control field - type derived from field
AAPla3:ExternPartijnr_NormalFG LONG                   !Normal forground color
AAPla3:ExternPartijnr_NormalBG LONG                   !Normal background color
AAPla3:ExternPartijnr_SelectedFG LONG                 !Selected forground color
AAPla3:ExternPartijnr_SelectedBG LONG                 !Selected background color
LOC:VerkoopKG3         LIKE(LOC:VerkoopKG3)           !List box control field - type derived from local data
LOC:VerkoopKG3_NormalFG LONG                          !Normal forground color
LOC:VerkoopKG3_NormalBG LONG                          !Normal background color
LOC:VerkoopKG3_SelectedFG LONG                        !Selected forground color
LOC:VerkoopKG3_SelectedBG LONG                        !Selected background color
AAPla3:Planning_TIME   LIKE(AAPla3:Planning_TIME)     !List box control field - type derived from field
AAPla3:Planning_TIME_NormalFG LONG                    !Normal forground color
AAPla3:Planning_TIME_NormalBG LONG                    !Normal background color
AAPla3:Planning_TIME_SelectedFG LONG                  !Selected forground color
AAPla3:Planning_TIME_SelectedBG LONG                  !Selected background color
AAPla3:Planning_DATE   LIKE(AAPla3:Planning_DATE)     !List box control field - type derived from field
AAPla3:Planning_DATE_NormalFG LONG                    !Normal forground color
AAPla3:Planning_DATE_NormalBG LONG                    !Normal background color
AAPla3:Planning_DATE_SelectedFG LONG                  !Selected forground color
AAPla3:Planning_DATE_SelectedBG LONG                  !Selected background color
AAPla3:Instructie      LIKE(AAPla3:Instructie)        !List box control field - type derived from field
AAPla3:Instructie_NormalFG LONG                       !Normal forground color
AAPla3:Instructie_NormalBG LONG                       !Normal background color
AAPla3:Instructie_SelectedFG LONG                     !Selected forground color
AAPla3:Instructie_SelectedBG LONG                     !Selected background color
AAPla3:Instructie_Tip  STRING(80)                     !Field tooltip
AAPla3:VerpakkingOmschrijving LIKE(AAPla3:VerpakkingOmschrijving) !List box control field - type derived from field
AAPla3:VerpakkingOmschrijving_NormalFG LONG           !Normal forground color
AAPla3:VerpakkingOmschrijving_NormalBG LONG           !Normal background color
AAPla3:VerpakkingOmschrijving_SelectedFG LONG         !Selected forground color
AAPla3:VerpakkingOmschrijving_SelectedBG LONG         !Selected background color
LOC:VerkoopPallets3    LIKE(LOC:VerkoopPallets3)      !List box control field - type derived from local data
LOC:VerkoopPallets3_NormalFG LONG                     !Normal forground color
LOC:VerkoopPallets3_NormalBG LONG                     !Normal background color
LOC:VerkoopPallets3_SelectedFG LONG                   !Selected forground color
LOC:VerkoopPallets3_SelectedBG LONG                   !Selected background color
AAPla3:MutatieGemaakt  LIKE(AAPla3:MutatieGemaakt)    !List box control field - type derived from field
AAPla3:MutatieGemaakt_NormalFG LONG                   !Normal forground color
AAPla3:MutatieGemaakt_NormalBG LONG                   !Normal background color
AAPla3:MutatieGemaakt_SelectedFG LONG                 !Selected forground color
AAPla3:MutatieGemaakt_SelectedBG LONG                 !Selected background color
AAPla3:MutatieGemaakt_Icon LONG                       !Entry's icon ID
AAPla3:Geprint         LIKE(AAPla3:Geprint)           !List box control field - type derived from field
AAPla3:Geprint_NormalFG LONG                          !Normal forground color
AAPla3:Geprint_NormalBG LONG                          !Normal background color
AAPla3:Geprint_SelectedFG LONG                        !Selected forground color
AAPla3:Geprint_SelectedBG LONG                        !Selected background color
AAPla3:Geprint_Icon    LONG                           !Entry's icon ID
AAPla3:Verwerkt        LIKE(AAPla3:Verwerkt)          !List box control field - type derived from field
AAPla3:Verwerkt_NormalFG LONG                         !Normal forground color
AAPla3:Verwerkt_NormalBG LONG                         !Normal background color
AAPla3:Verwerkt_SelectedFG LONG                       !Selected forground color
AAPla3:Verwerkt_SelectedBG LONG                       !Selected background color
AAPla3:Verwerkt_Icon   LONG                           !Entry's icon ID
AAPla3:Gewogen         LIKE(AAPla3:Gewogen)           !List box control field - type derived from field
AAPla3:Gewogen_NormalFG LONG                          !Normal forground color
AAPla3:Gewogen_NormalBG LONG                          !Normal background color
AAPla3:Gewogen_SelectedFG LONG                        !Selected forground color
AAPla3:Gewogen_SelectedBG LONG                        !Selected background color
AAPla3:Gewogen_Icon    LONG                           !Entry's icon ID
AAPla3:CelOms          LIKE(AAPla3:CelOms)            !List box control field - type derived from field
AAPla3:CelOms_NormalFG LONG                           !Normal forground color
AAPla3:CelOms_NormalBG LONG                           !Normal background color
AAPla3:CelOms_SelectedFG LONG                         !Selected forground color
AAPla3:CelOms_SelectedBG LONG                         !Selected background color
LOC:Locatienaam3       LIKE(LOC:Locatienaam3)         !List box control field - type derived from local data
LOC:Locatienaam3_NormalFG LONG                        !Normal forground color
LOC:Locatienaam3_NormalBG LONG                        !Normal background color
LOC:Locatienaam3_SelectedFG LONG                      !Selected forground color
LOC:Locatienaam3_SelectedBG LONG                      !Selected background color
AAPla3:LeverancierFirmaNaam LIKE(AAPla3:LeverancierFirmaNaam) !List box control field - type derived from field
AAPla3:LeverancierFirmaNaam_NormalFG LONG             !Normal forground color
AAPla3:LeverancierFirmaNaam_NormalBG LONG             !Normal background color
AAPla3:LeverancierFirmaNaam_SelectedFG LONG           !Selected forground color
AAPla3:LeverancierFirmaNaam_SelectedBG LONG           !Selected background color
AAPla3:Transport       LIKE(AAPla3:Transport)         !List box control field - type derived from field
AAPla3:Transport_NormalFG LONG                        !Normal forground color
AAPla3:Transport_NormalBG LONG                        !Normal background color
AAPla3:Transport_SelectedFG LONG                      !Selected forground color
AAPla3:Transport_SelectedBG LONG                      !Selected background color
AAPla3:Transport_Tip   STRING(80)                     !Field tooltip
AAPla3:PlanningID      LIKE(AAPla3:PlanningID)        !List box control field - type derived from field
AAPla3:PlanningID_NormalFG LONG                       !Normal forground color
AAPla3:PlanningID_NormalBG LONG                       !Normal background color
AAPla3:PlanningID_SelectedFG LONG                     !Selected forground color
AAPla3:PlanningID_SelectedBG LONG                     !Selected background color
AAPla3:PlanningID_Tip  STRING(80)                     !Field tooltip
AAPla3:MutatieKG       LIKE(AAPla3:MutatieKG)         !Browse hot field - type derived from field
AAPla3:MutatiePallets  LIKE(AAPla3:MutatiePallets)    !Browse hot field - type derived from field
AAPla3:KG              LIKE(AAPla3:KG)                !Browse hot field - type derived from field
AAPla3:Pallets         LIKE(AAPla3:Pallets)           !Browse hot field - type derived from field
ACT:ActiviteitID       LIKE(ACT:ActiviteitID)         !Primary key field - type derived from field
ACT:DatumTijd          LIKE(ACT:DatumTijd)            !Browse key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
LocEnableEnterByTab  BYTE(1)                               !Used by the ENTER Instead of Tab template
EnterByTabManager    EnterByTabClass
NetLocalRefreshDate     Long     ! NetTalk (NetRefresh)
NetLocalRefreshTime     Long
NetLocalDependancies    String('|PlanningInkoop|PlanningVerkoop|PlanningOverboeking|APlanningInkoop|APlanningOverboeking|APlanningVerkoop|Activiteit|AAPlanningVerkoop|')
QuickWindow          WINDOW('Planning'),AT(,,851,396),FONT('MS Sans Serif',8,,,CHARSET:DEFAULT),RESIZE,MAXIMIZE, |
  CENTER,GRAY,MAX,MDI,HLP('BrowsePlanning'),SYSTEM,IMM
                       BUTTON,AT(413,0,33,31),USE(?Calendar),ICON(ICON:Zoom)
                       SHEET,AT(-1,16,850,361),USE(?SHEET2)
                         TAB('Alles'),USE(?Inkoop:2)
                           LIST,AT(4,51,838,75),USE(?InkoopList),HVSCROLL,FORMAT('[30L(2)|M*~ID~C(0)@s30@70L(2)|M*' & |
  '~Omschrijving~C(0)@s60@]|M~Artikel~110L(2)|M*~Leverancier~C(0)@s50@40R(2)|M*~KG~C(0)' & |
  '@n-14`2@170L(2)|M*~Instructie~C(0)@s100@50L(2)|M*~Verpakking~C(0)@s50@22L(2)|M*~Tijd' & |
  '~C(0)@t7@30R(2)|M*~Pallets~C(1)@n_10@20C(2)|M*I~Inslag~C(0)@p p@20C(2)|M*I~Print~C(0' & |
  ')@p p@30C(2)|M*I~Transfer~C(0)@p p@30C(2)|M*I~Verwerkt~C(0)@p p@30C(2)|M*I~Gewogen~C' & |
  '(0)@p p@[30L(2)|M*~Cel~C(0)@s50@30L(2)|M*~Locatie~C(0)@s50@]|M~Cel~86L(2)|M*~Transpo' & |
  'rt~C(0)@s100@50R(2)|M*~Planning-ID~C(2)@n_10@'),FROM(Queue:Browse),IMM
                           BUTTON('Inslag'),AT(7,130,53),USE(?InkoopInslag),COLOR(00EBCE87h)
                           BUTTON('Palletstickers'),AT(309,130,57),USE(?InkoopPrint),COLOR(0000D7FFh)
                           BUTTON('Verwerkt'),AT(137,130),USE(?InkoopVerwerk),COLOR(00EBCE87h)
                           LIST,AT(4,281,838,75),USE(?VerkoopList),HVSCROLL,FORMAT('[30L(2)|M*~ID~C(0)@s30@70L(2)|' & |
  'M*~Omschrijving~C(0)@s60@]|M~Artikel~110L(2)|M*~Afnemer~C(0)@s50@[30R(2)|M*~Intern~C' & |
  '(0)@n_10B@30R(2)|M*~Extern~C(1)@s20@](82)|M~Partij-nummer~40R(2)|M*~KG~C(0)@n-14`2@1' & |
  '70L(2)|M*P~Instructie~C(2)@s100@50L(2)|M*~Verpakking~C(0)@s50@22L(2)|M*~Tijd~C(0)@t7' & |
  '@30R(2)|M*~Pallets~C(1)@n_10@22R(2)|M*I~Uitslag~C(0)@p p@20C(2)|M*I~Print~C(0)@p p@3' & |
  '0C(2)|M*I~Verwerkt~C(0)@p p@30C(2)|M*I~Gewogen~C(0)@p p@[20L(2)|M*@s50@40L(2)|M*@s50' & |
  '@]|M~Cel~50L(2)|M*~Herkomst Cel~C(0)@s50@50L(2)|M*~Leverancier~C(0)@s50@50L(2)|M*P~T' & |
  'ransport~C(0)@s100@60R(2)|M*P~Planning ID~C(0)@n_10@'),FROM(Queue:Browse:1),IMM,TIP('?')
                           BUTTON('Handmatig verwerken'),AT(757,33),USE(?InkoopHVerwerkt),COLOR(00EBCE87h)
                           BUTTON('Verwerkt'),AT(137,360),USE(?VerkoopVerwerkt),COLOR(00EBCE87h)
                           BUTTON('Print CMR'),AT(371,360),USE(?VerkoopPrintCMR),COLOR(0000D7FFh)
                           BUTTON('Uitslag'),AT(7,360,53),USE(?VerkoopUitslag),COLOR(00EBCE87h)
                           BUTTON('Overboeken'),AT(7,242,53),USE(?OverboekDoen),COLOR(00EBCE87h)
                           BUTTON('Handmatig verwerken'),AT(757,264),USE(?VerkoopHVerwerkt),COLOR(00EBCE87h)
                           BUTTON('Verwerkt'),AT(137,242),USE(?OverboekVerwerkt),COLOR(00EBCE87h)
                           BUTTON('Transfers'),AT(793,242,50),USE(?Ritten),COLOR(00CBC0FFh)
                           BUTTON('Bulk Overboeken'),AT(63,242),USE(?BulkOverboeken),COLOR(00EBCE87h)
                           BUTTON('Palletstickers'),AT(309,242),USE(?PrintOverboekingStickers),COLOR(0000D7FFh)
                           BUTTON('Transfers'),AT(793,131,50),USE(?TransferInkoopButton),COLOR(00CBC0FFh)
                           LIST,AT(4,165,838,75),USE(?OverboekList),HVSCROLL,FORMAT('[30L(2)|M*~ID~C(0)@s30@70L(2)' & |
  '|M*~Omschrijving~C(0)@s60@]|M~Artikel~110L(2)|M*~Leverancier~C(0)@s50@[30R(2)|M*~Int' & |
  'ern~C(0)@n_10B@30R(2)|M*~Extern~C(1)@s20@]|M~Partij-nummer~40R(2)|M*~KG~C(0)@n-14`2@' & |
  '51R(2)|M*~Overboek Soort~L(0)@s50@170L(2)|M*~Instructie~C(0)@s100@50L(2)|M*~Verpakki' & |
  'ng~C(0)@s50@22R(2)|M*~Tijd~C(0)@t7@30R(2)|M*~Pallets~C(1)@n_10@43R(2)|M*I~Overgeboek' & |
  't~C(0)@p p@35C(2)|M*I~Transfer~C(0)@p p@35C(2)|M*I~Verwerkt~C(0)@p p@[20L(2)|M*~Van~' & |
  'C(0)@s50@50L(2)|M*~Locatie~C(0)@s50@20L(2)|M*~Naar~C(0)@s50@200L(2)|M*~Locatienaam~C' & |
  '(0)@s50@](144)|M~Cel~50L(2)|M*~Transport~C(0)@s100@'),FROM(Queue:Browse:2),IMM,MSG('Browsing Records')
                           PROMPT('Verkopen'),AT(5,267),USE(?VerkopenString),FONT('Microsoft Sans Serif',,,FONT:bold)
                           STRING('Overboekingen'),AT(7,151),USE(?OverboekingString),FONT('Microsoft Sans Serif',,,FONT:bold)
                           STRING('Inkopen'),AT(5,36),USE(?InkoopString),FONT('Microsoft Sans Serif',,,FONT:bold)
                           BUTTON('Uitslag via weging'),AT(63,360,71),USE(?UitslagWeging),COLOR(00EBCE87h)
                           BUTTON('Inslag via weging'),AT(63,130,71),USE(?InslagWeging),COLOR(00EBCE87h)
                           BUTTON('Weeglijst'),AT(637,130),USE(?WeeglijstInkoop),COLOR(00DDA0DDh)
                           BUTTON('Weeglijst (Excel)'),AT(684,130),USE(?WeeglijstExcelInkoop),COLOR(00DDA0DDh)
                           BUTTON('Weeglijst (Excel)'),AT(684,360,69,14),USE(?WeeglijstExcelVerkoop),COLOR(00DDA0DDh)
                           BUTTON('Weeglijst'),AT(637,360,44,14),USE(?WeeglijstVerkoop),COLOR(00DDA0DDh)
                           BUTTON('Inslag-rapport'),AT(247,130),USE(?PrintInslagRapport),COLOR(0000D7FFh)
                           BUTTON('Uitslag-rapport'),AT(247,360,59),USE(?PrintUitslagRapport),COLOR(0000D7FFh)
                           BUTTON('Terugdraaien'),AT(184,360),USE(?VerkoopTerugdraaienButton),COLOR(00EBCE87h)
                           BUTTON('Terugdraaien'),AT(184,130,58),USE(?InkoopTerugdraaienButton),COLOR(00EBCE87h)
                           BUTTON('Rapport'),AT(594,242,38,14),USE(?OverboekRapport),COLOR(0000D7FFh)
                           BUTTON('Sjabloon'),AT(549,360),USE(?VerkoopSjabloon),COLOR(0000D7FFh)
                           BUTTON('Sjabloon'),AT(549,242,43,14),USE(?OverboekSjabloon),COLOR(0000D7FFh)
                           BUTTON('Rapport'),AT(594,360,38),USE(?VerkoopRapport),COLOR(0000D7FFh)
                           BUTTON('Palletbladen'),AT(421,360,48,14),USE(?VerkoopPrintPalletblad),COLOR(0000D7FFh)
                           BUTTON('Palletstickers'),AT(309,360,57,14),USE(?PrintVerkoopStickers),COLOR(0000D7FFh)
                           BUTTON('Palletbladen (Export)'),AT(473,360,72,14),USE(?VerkoopPalletbladExport),COLOR(0000D7FFh)
                         END
                         TAB('Inkoop'),USE(?TAB1)
                           LIST,AT(5,52,839,300),USE(?InkoopList2),HVSCROLL,FORMAT('[30L(2)|M*~ID~C(0)@s30@70L(2)|' & |
  'M*~Omschrijving~C(0)@s60@]|M~Artikel~110L(2)|M*~Leverancier~C(0)@s50@40R(2)|M*~KG~C(' & |
  '0)@n-14`2@170L(2)|M*~Instructie~C(0)@s100@50L(2)|M*~Verpakking~C(0)@s50@22R(2)|M*~Ti' & |
  'jd~C(0)@t7@30R(2)|M*~Pallets~C(1)@n_10@20C(2)|M*I~Inslag~C(0)@p p@20C(2)|M*I~Print~C' & |
  '(0)@p p@30C(2)|M*I~Transfer~C(0)@p p@30C(2)|M*I~Verwerkt~C(0)@p p@30C(2)|M*I~Gewogen' & |
  '~C(0)@p p@[30L(2)|M*~Cel~C(0)@s50@30L(2)|M*~Locatie~C(0)@s50@]|M~Cel~86L(2)|M*~Trans' & |
  'port~C(0)@s100@50R(2)|M*~Planning-ID~C(2)@n_10@'),FROM(Queue:Browse:3),IMM
                           BUTTON('Verwerkt'),AT(131,356,43,14),USE(?InkoopVerwerk2),COLOR(00EBCE87h)
                           BUTTON('Palletstickers'),AT(303,357,57,14),USE(?InkoopPrint2),COLOR(0000D7FFh)
                           BUTTON('Inslag'),AT(5,356,53,14),USE(?InkoopInslag2),COLOR(00EBCE87h)
                           BUTTON('Transfers'),AT(796,357,50,14),USE(?TransferButton2),COLOR(00CBC0FFh)
                           BUTTON('Handmatig verwerken'),AT(680,34,85,14),USE(?InkoopHVerwerkt2),COLOR(00EBCE87h)
                           BUTTON('Inslag via weging'),AT(61,356,65),USE(?InslagWeging2),COLOR(00EBCE87h)
                           BUTTON('Weeglijst'),AT(629,357,44,14),USE(?Weeglijst2),COLOR(00DDA0DDh)
                           BUTTON('Weeglijst (Excel)'),AT(677,357,69,14),USE(?WeeglijstExcel2),COLOR(00DDA0DDh)
                           BUTTON('Inslag-rapport'),AT(240,357),USE(?InslagRapportButton2),COLOR(0000D7FFh)
                           BUTTON('Terugdraaien'),AT(178,356),USE(?InkoopTerugdraaien2),COLOR(00EBCE87h)
                         END
                         TAB('Overboeken'),USE(?TAB2)
                           LIST,AT(5,36,840,320),USE(?OverboekList2),HVSCROLL,FORMAT('[30L(2)|M*~ID~C(0)@s30@70L(2' & |
  ')|M*~Omschrijving~C(0)@s60@]|M~Artikel~110L(2)|M*~Leverancier~C(0)@s50@[30R(2)|M*~In' & |
  'tern~C(0)@n_10B@30R(2)|M*~Extern~C(1)@s20@]|M~Partij-nummer~40L(2)|M*~KG~C(0)@n-14`2' & |
  '@170L(2)|M*~Instructie~C(0)@s100@50L(2)|M*~Verpakking~C(0)@s50@22R(2)|M*~Tijd~C(0)@t' & |
  '7@30R(2)|M*~Pallets~C(1)@n_10@56L(2)|M*~Overboek Soort~@s50@30R(2)|M*I~Overboek~C(0)' & |
  '@p p@30C(2)|M*I~Transfer~C(0)@p p@30C(2)|M*I~Verwerkt~C(0)@p p@[20L(2)|M*~Van~C(0)@s' & |
  '50@50L(2)|M*~Locatie~C(0)@s50@20L(2)|M*~Naar~C(0)@s50@200L(2)|M*~Locatienaam~C(0)@s5' & |
  '0@](141)|M~Cel~50L(2)|M*~Transport~C(0)@s100@'),FROM(Queue:Browse:4),IMM,MSG('Browsing Records')
                           BUTTON('Palletstickers'),AT(307,359,57,14),USE(?OverboekPrintStickers3),COLOR(0000D7FFh)
                           BUTTON('Bulk Overboeken'),AT(58,359,71,14),USE(?BulkOverboeken3),COLOR(00EBCE87h)
                           BUTTON('Verwerkt'),AT(133,359,43,14),USE(?OverboekVerwerkt3),COLOR(00EBCE87h)
                           BUTTON('Overboeken'),AT(2,359,53,14),USE(?OverboekDoen3),COLOR(00EBCE87h)
                           BUTTON('Sjabloon'),AT(543,359,48,14),USE(?OverboekSjabloon3),COLOR(0000D7FFh)
                           BUTTON('Transfers'),AT(793,359,50,14),USE(?OverboekTransfers3),COLOR(00CBC0FFh)
                           BUTTON('Rapport'),AT(595,359,48,14),USE(?OverboekRapport3),COLOR(0000D7FFh)
                         END
                         TAB('Verkoop'),USE(?TAB3)
                           LIST,AT(4,54,841,300),USE(?VerkoopList:2),HVSCROLL,FORMAT('[30L(2)|M*~ID~C(0)@s30@70L(2' & |
  ')|M*~Omschrijving~C(0)@s60@]|M~Artikel~110L(2)|M*~Afnemer~C(0)@s50@[30R(2)|M*~Intern' & |
  '~C(0)@n_10B@30R(2)|M*~Extern~C(1)@s20@](80)|M~Partij-nummer~40R(2)|M*~KG~C(0)@n-14`2' & |
  '@170L(2)|M*P~Instructie~C(2)@s100@50L(2)|M*~Verpakking~C(0)@s50@22R(2)|M*~Tijd~C(0)@' & |
  't7@30R(2)|M*~Pallets~C(1)@n_10@22R(2)|M*I~Uitslag~C(0)@p p@20C(2)|M*I~Print~C(0)@p p' & |
  '@30C(2)|M*I~Verwerkt~C(0)@p p@30C(2)|M*I~Gewogen~C(0)@p p@[20L(2)|M*@s50@40L(2)|M*@s' & |
  '50@]|M~Cel~50L(2)|M*~Herkomst Cel~C(0)@s50@50L(2)|M*~Leverancier~C(0)@s50@50L(2)|M*P' & |
  '~Transport~C(0)@s100@60L(2)|M*P~Planning ID~L(0)@n-14@'),FROM(Queue:Browse:5),IMM
                           BUTTON('Sjabloon'),AT(539,358,43,14),USE(?VerkoopSjabloon4),COLOR(0000D7FFh)
                           BUTTON('Uitslag'),AT(3,358,41,14),USE(?VerkoopUitslag4),COLOR(00EBCE87h)
                           BUTTON('Print CMR'),AT(360,358,48,14),USE(?VerkoopPrintCMR4),COLOR(0000D7FFh)
                           BUTTON('Verwerkt'),AT(121,358,43,14),USE(?VerkoopVerwerkt4),COLOR(00EBCE87h)
                           BUTTON('Handmatig verwerken'),AT(767,35,76,14),USE(?VerkoopHVerwerkt4),COLOR(00EBCE87h)
                           BUTTON('Uitslag via weging'),AT(45,358),USE(?VerkoopUitslagWeging4),COLOR(00EBCE87h)
                           BUTTON('Weeglijst'),AT(631,358,44,14),USE(?Weeglijst4),COLOR(00DDA0DDh)
                           BUTTON('Weeglijst (Excel)'),AT(678,358,69,14),USE(?WeeglijstExcel4),COLOR(00DDA0DDh)
                           BUTTON('Uitslag-rapport'),AT(229,358),USE(?UitslagRapport4),COLOR(0000D7FFh)
                           BUTTON('Terugdraaien'),AT(168,358),USE(?VerkoopTerugdraaienButton4),COLOR(00EBCE87h)
                           BUTTON('Rapport'),AT(586,358),USE(?VerkoopRapport4),COLOR(0000D7FFh)
                           BUTTON('Palletbladen'),AT(411,358,48,14),USE(?VerkoopPrintPalletblad:2),COLOR(0000D7FFh)
                           BUTTON('Palletstickers'),AT(296,358,63,14),USE(?PrintVerkoopStickers:2),COLOR(0000D7FFh)
                           BUTTON('Palletbladen (Export)'),AT(463,358,73,14),USE(?VerkoopPalletbladExport2),COLOR(0000D7FFh)
                         END
                         TAB('Activiteiten'),USE(?ActiviteitTab)
                           LIST,AT(6,39,759,312),USE(?List),HVSCROLL,FORMAT('[63L(2)|M*~Datum~C(0)@d6-@40L(2)|M*~T' & |
  'ijd~C(0)@t7B@37L(2)|M*I~Uitgevoerd~C(0)@p p@200L(2)|M*~Omschrijving~@s255@]|~Activit' & |
  'eit~[30L(2)|M*~ID~C(0)@s30@66L(2)|M*~Omschrijving~C(0)@s60@]|M~Artikel~110L(2)|M*~Af' & |
  'nemer~C(0)@s50@[30R(2)|M*~Intern~C(0)@n_10B@30R(2)|M*~Extern~C(1)@s20@]|M~Partij-num' & |
  'mer~40R(2)|M*~KG~C(0)@n-14`2@[22R(2)|M*~Tijd~C(0)@t7@40R(2)|M*~Datum~C(0)@d6-@](67)|' & |
  '~Ingepland~170L(2)|M*P~Instructie~C(2)@s100@50L(2)|M*~Verpakking~C(0)@s50@30R(2)|M*~' & |
  'Pallets~C(1)@n_10@22R(2)|M*I~Uitslag~C(0)@p p@20C(2)|M*I~Print~C(0)@p p@30C(2)|M*I~V' & |
  'erwerkt~C(0)@p p@30C(2)|M*I~Gewogen~C(0)@p p@[20L(2)|M*@s50@40L(2)|M*@s50@]|M~Cel~50' & |
  'L(2)|M*~Leverancier~C(0)@s50@50L(2)|M*P~Transport~C(0)@s100@60L(2)|M*P~Planning ID~L(0)@n-14@'), |
  FROM(Queue:Browse:6),IMM
                           BUTTON('&Toevoegen'),AT(5,354,70,20),USE(?Insert),LEFT,ICON('wainsert.ico'),FLAT
                           BUTTON('&Wijzigen'),AT(78,354,59,20),USE(?Change),LEFT,ICON('wachange.ico'),FLAT
                           BUTTON('&Verwijderen'),AT(141,354,70,20),USE(?Delete),LEFT,ICON('wadelete.ico'),FLAT
                         END
                       END
                       BUTTON('&Sluiten'),AT(796,380,51,14),USE(?Close),LEFT,ICON('WACLOSE.ICO'),FLAT,MSG('Close Window'), |
  TIP('Close Window')
                       PROMPT('Planningsdatum:'),AT(207,0),USE(?Loc:DatumNu:Prompt)
                       SPIN(@d6-),AT(273,1,60,10),USE(Loc:DatumNu),FONT('Microsoft Sans Serif',,,FONT:regular,CHARSET:ANSI)
                       BUTTON,AT(338,0,35,31),USE(?Gister),ICON('ÿ<02H>ƒ<07FH>')
                       BUTTON,AT(375,0,35,31),USE(?Morgen),ICON('ÿ<02H>„<07FH>')
                       BUTTON('Excel'),AT(4,378,49),USE(?VerkoopExcel),LEFT,ICON('Excel.ico'),FLAT
                       BUTTON('&Ververs Scherm'),AT(704,380,81,14),USE(?RefreshButton),LEFT,ICON('REFRESH.ICO'),FLAT, |
  MSG('Close Window'),TIP('Close Window')
                       PANEL,AT(132,2,41,11),USE(?ActiviteitPanel),BEVEL(1),FILL(COLOR:Red),HIDE
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
GetMutatie             PROCEDURE(LONG PRM:PlanningID, String PRM:Soort) ! New method added to this class instance
InslagReport           PROCEDURE(LONG PRM:PlanningID)      ! New method added to this class instance
UitslagReport          PROCEDURE(LONG PRM:PlanningID)      ! New method added to this class instance
HandleButton           PROCEDURE(STRING PRM:Functie, STRING PRM:InkOvrVer, BOOL PRM:LosseTab) ! New method added to this class instance
RegelVerwerkt          PROCEDURE(), BYTE                   ! New method added to this class instance
GetGetransferd         PROCEDURE(LONG PRM:PlanningID), BYTE ! New method added to this class instance
                     END

Toolbar              ToolbarClass
BRW6                 CLASS(BrowseClass)                    ! Browse using ?InkoopList
Q                      &Queue:Browse                  !Reference to browse queue
Fetch                  PROCEDURE(BYTE Direction),DERIVED
ResetQueue             PROCEDURE(BYTE ResetMode),DERIVED
SetQueueRecord         PROCEDURE(),DERIVED
                     END

BRW1                 CLASS(BrowseClass)                    ! Browse using ?VerkoopList
Q                      &Queue:Browse:1                !Reference to browse queue
Fetch                  PROCEDURE(BYTE Direction),DERIVED
ResetQueue             PROCEDURE(BYTE ResetMode),DERIVED
SetQueueRecord         PROCEDURE(),DERIVED
                     END

BRW8                 CLASS(BrowseClass)                    ! Browse using ?OverboekList
Q                      &Queue:Browse:2                !Reference to browse queue
Fetch                  PROCEDURE(BYTE Direction),DERIVED
ResetQueue             PROCEDURE(BYTE ResetMode),DERIVED
SetQueueRecord         PROCEDURE(),DERIVED
                     END

BRW3                 CLASS(BrowseClass)                    ! Browse using ?InkoopList2
Q                      &Queue:Browse:3                !Reference to browse queue
Fetch                  PROCEDURE(BYTE Direction),DERIVED
ResetQueue             PROCEDURE(BYTE ResetMode),DERIVED
SetQueueRecord         PROCEDURE(),DERIVED
                     END

BRW9                 CLASS(BrowseClass)                    ! Browse using ?OverboekList2
Q                      &Queue:Browse:4                !Reference to browse queue
Fetch                  PROCEDURE(BYTE Direction),DERIVED
ResetQueue             PROCEDURE(BYTE ResetMode),DERIVED
SetQueueRecord         PROCEDURE(),DERIVED
                     END

BRW12                CLASS(BrowseClass)                    ! Browse using ?VerkoopList:2
Q                      &Queue:Browse:5                !Reference to browse queue
Fetch                  PROCEDURE(BYTE Direction),DERIVED
ResetQueue             PROCEDURE(BYTE ResetMode),DERIVED
SetQueueRecord         PROCEDURE(),DERIVED
                     END

BRW11                CLASS(BrowseClass)                    ! Browse using ?List
Q                      &Queue:Browse:6                !Reference to browse queue
Fetch                  PROCEDURE(BYTE Direction),DERIVED
Init                   PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)
PrimeRecord            PROCEDURE(BYTE SuppressClear = 0),BYTE,PROC,DERIVED
ResetQueue             PROCEDURE(BYTE ResetMode),DERIVED
SetQueueRecord         PROCEDURE(),DERIVED
                     END

Resizer              CLASS(WindowResizeClass)
Init                   PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)
                     END

Calendar5            CalendarClass
GetransferdQueue    QUEUE, PRE(TQ)
PlanningID              LONG
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
TrekLijntjes            Routine
	  Loc:Ole{'Application.Range(A'&Loc:Rij&':P'&Loc:Rij&').Select'}
	  Loc:Ole{'Application.Selection.Borders(9).Weight'}=2 ! xlEdgeBottom
      Loc:Ole{'Application.Selection.Borders(10).Weight'}=2 ! xlEdgeRight
      Loc:Ole{'Application.Selection.Borders(7).Weight'}=2 ! xlEdgeLeft
      Loc:Ole{'Application.Selection.Borders(8).Weight'}=2 ! xlEdgeTop
      Loc:Ole{'Application.Selection.Borders(11).Weight'}=2 ! xlInsideVertical
!      ?Ole{'Application.Selection.Borders(12).Weight'}=2 ! xlInsideHorizontal
Vet                     Routine
	  Loc:Ole{'Application.Range(A'&Loc:Rij&':P'&Loc:Rij&').Font.Bold'}=True
UpdateInkoopVerkoopVerwerkStatus    ROUTINE         ! de parent inkoop of verkoop of verwerkt zetten als alle regels verwerkt zijn
DATA
verkoopid       LONG
inkoopid        LONG                    
verkoopverwerkt Byte                
inkoopverwerkt  Byte                

CODE
    
	GLO:GebruikerLogHandelingOpmerking = 'BrowsePlanning - UpdateInkoopVerkoopVerwerkStatus'
	
	IF Pla:VerkoopID > 0 THEN
		verkoopid = Pla:VerkoopID
		verkoopverwerkt = true
		! kijken of er één planningregel nog niet verwerkt is 
		CLEAR(Pla:PlanningID,-1)
		SET(Pla:Planning_FK02,Pla:Planning_FK02)
		LOOP UNTIL Access:Planning.Next()
			IF Pla:VerkoopID <> verkoopid THEN BREAK.
			IF NOT(Pla:Verwerkt)
				verkoopverwerkt = false
				BREAK
			END
		END
		Ver2:VerkoopID = verkoopid
		IF Access:Verkoop.Fetch(Ver2:PK_Verkoop)
			Message('Verkoop kan niet ingelezen worden','Fout:UpdateInkoopVerkoopVerwerkStatus',Icon:Hand)
			EXIT
		END
		IF Ver2:Verwerkt <> verkoopverwerkt
            Ver2:Verwerkt = verkoopverwerkt         ! wegschrijven of de hele verkoop verwerkt is
            Access:Verkoop.Update()
            IF ERROR() THEN
                IF ERRORCODE() = 90 THEN
                    MESSAGE('Verkoop-record kon niet worden bijgewerkt | SQL Error('&FILEERRORCODE()&'):'&FILEERROR()&')')
                ELSE
                    MESSAGE('Verkoop-record kon niet worden bijgewerkt | Error('&ERRORCODE()&'):'&ERROR()&')')
                .
            .
        END    
	ELSIF Pla:InkoopID > 0 THEN
		inkoopid = Pla:InkoopID
		inkoopverwerkt = true
		CLEAR(Pla:PlanningID,-1)
		SET(Pla:Planning_FK01,Pla:Planning_FK01)
		LOOP UNTIL Access:Planning.Next()
			IF Pla:InkoopID <> inkoopid THEN BREAK.
			IF NOT(Pla:Verwerkt)
				inkoopverwerkt = false
				BREAK
			END
		END
		Ink:InkoopID = inkoopid
		IF Access:Inkoop.Fetch(Ink:PK_Inkoop)
			Message('Inkoop kan niet ingelezen worden','Fout:UpdateInkoopVerkoopVerwerkStatus',Icon:Hand)
			EXIT
        END
        IF Ink:Verwerkt <> inkoopverwerkt
            Ink:Verwerkt = inkoopverwerkt
            Access:Inkoop.Update()
            IF ERROR() THEN
                  IF ERRORCODE() = 90 THEN
                      MESSAGE('Inkoop-record kon niet worden bijgewerkt | SQL Error('&FILEERRORCODE()&'):'&FILEERROR()&')')
                  ELSE
                      MESSAGE('Inkoop-record kon niet worden bijgewerkt | Error('&ERRORCODE()&'):'&ERROR()&')')
                .
            .
        END    
	.
	GLO:GebruikerLogHandelingOpmerking = ''
ExportExcel         ROUTINE
    ! Alle gebruikte queueus vervessen (ook als deze momenteel onzichtbaar zijn)
    BRW6.ActiveInvisible = true
    BRW6.ResetQueue(Reset:Queue)
    BRW8.ActiveInvisible = true
    BRW8.ResetQueue(Reset:Queue)
    BRW1.ActiveInvisible = true
    BRW1.ResetQueue(Reset:Queue)
    
    GlobalClass.InitExcelOle
	GlobalClass.MaakExcel('')
	
	LOC:ExcelPageBreak = GETINI('Excel', 'PageBreak', '60','.\Voorraad.ini')
	
	Execute (Loc:DAtumNU%7 )+ 1
    	Loc:Ole{'Application.Range(A1).Value'}='Zondag '&Format(Loc:DAtumNU,@d6-) 
    	Loc:Ole{'Application.Range(A1).Value'}='Maandag '&Format(Loc:DAtumNU,@d6-) 
    	Loc:Ole{'Application.Range(A1).Value'}='Dinsdag '&Format(Loc:DAtumNU,@d6-) 
    	Loc:Ole{'Application.Range(A1).Value'}='Woensdag '&Format(Loc:DAtumNU,@d6-) 
    	Loc:Ole{'Application.Range(A1).Value'}='Donderdag '&Format(Loc:DAtumNU,@d6-) 
    	Loc:Ole{'Application.Range(A1).Value'}='Vrijdag '&Format(Loc:DAtumNU,@d6-) 
    	Loc:Ole{'Application.Range(A1).Value'}='Zaterdag '&Format(Loc:DAtumNU,@d6-) 
	End	

	LOC:Rij = 2
	Loc:Ole{'Application.Range(A'&Loc:Rij&').Value'}='Inkopen'
	Do Vet

	Loc:Rij+=1
   	Loc:Ole{'Application.Range(A'&Loc:Rij&').Value'}='Klant'
   	Loc:Ole{'Application.Range(B'&Loc:Rij&').Value'}='Laadtijd'
   	Loc:Ole{'Application.Range(C'&Loc:Rij&').Value'}='KG'
   	Loc:Ole{'Application.Range(D'&Loc:Rij&').Value'}='Pallets'
   	Loc:Ole{'Application.Range(E'&Loc:Rij&').Value'}='Ingeslagen'
   	Loc:Ole{'Application.Range(F'&Loc:Rij&').Value'}='Gepr.'
   	Loc:Ole{'Application.Range(G'&Loc:Rij&').Value'}='Transfer'
   	Loc:Ole{'Application.Range(H'&Loc:Rij&').Value'}='Verw.' 
   	Loc:Ole{'Application.Range(I'&Loc:Rij&').Value'}='Gewogen' 
   	Loc:Ole{'Application.Range(J'&Loc:Rij&').Value'}='Cel' 
   	Loc:Ole{'Application.Range(K'&Loc:Rij&').Value'}='Locatie' 
   	Loc:Ole{'Application.Range(L'&Loc:Rij&').Value'}='Product' 
    Loc:Ole{'Application.Range(M'&Loc:Rij&').Value'}='Instructie'
    Loc:Ole{'Application.Range(N'&Loc:Rij&').Value'}='Verpakking'
   	Loc:Ole{'Application.Range(O'&Loc:Rij&').Value'}='Transport'
	!Loc:Ole{'Application.Range(K'&Loc:Rij&').Value'}='Memo'
   	Loc:Ole{'Application.Columns(A:A).ColumnWidth'}=30
   	Loc:Ole{'Application.Columns(B:B).ColumnWidth'}=8
   	Loc:Ole{'Application.Columns(C:C).ColumnWidth'}=6
   	Loc:Ole{'Application.Columns(D:D).ColumnWidth'}=7
   	Loc:Ole{'Application.Columns(E:E).ColumnWidth'}=12
   	Loc:Ole{'Application.Columns(F:F).ColumnWidth'}=6
   	Loc:Ole{'Application.Columns(G:G).ColumnWidth'}=10
   	Loc:Ole{'Application.Columns(H:K).ColumnWidth'}=6
   	Loc:Ole{'Application.Columns(L:L).ColumnWidth'}=30
   	Loc:Ole{'Application.Columns(M:M).ColumnWidth'}=30
    Loc:Ole{'Application.Columns(N:N).ColumnWidth'}=30
    Loc:Ole{'Application.Columns(O:O).ColumnWidth'}=15
    Loc:Ole{'Application.Columns(P:P).ColumnWidth'}=30    
   	!Loc:Ole{'Application.Columns(L:L).ColumnWidth'}=15
	Do TrekLijntjes
	Do Vet
	! okay nu door de queu lopen 
		Loop i# = 1 To RECORDS(BRW6.Q)
			Loc:Rij+=1
			Get(BRW6.Q,i#)
		   	Loc:Ole{'Application.Range(A'&Loc:Rij&').Value'}=BRW6.Q.Pla2:FirmaNaam
		   	Loc:Ole{'Application.Range(B'&Loc:Rij&').Value'}=Format(BRW6.Q.Pla2:Planning_TIME,@t01)
		   	Loc:Ole{'Application.Range(C'&Loc:Rij&').Value'}=BRW6.Q.LOC:InkoopKG1
			Loc:Ole{'Application.Range(D'&Loc:Rij&').Value'}=BRW6.Q.LOC:InkoopPallets1
			IF BRW6.Q.Pla2:MutatieGemaakt = 1
				Loc:Ole{'Application.Range(E'&Loc:Rij&').Value'}='X'.
					
			IF BRW6.Q.Pla2:Geprint = 1
				Loc:Ole{'Application.Range(F'&Loc:Rij&').Value'}='X'.

			IF BRW6.Q.LOC:Getransferd = 1
				Loc:Ole{'Application.Range(G'&Loc:Rij&').Value'}='X'.
			
			IF BRW6.Q.Pla2:Verwerkt = 1
				Loc:Ole{'Application.Range(H'&Loc:Rij&').Value'}='X'.

			IF BRW6.Q.Pla2:Gewogen = 1
				Loc:Ole{'Application.Range(I'&Loc:Rij&').Value'}='X'.
				
		   	Loc:Ole{'Application.Range(J'&Loc:Rij&').Value'}=BRW6.Q.Pla2:CelOms
		   	Loc:Ole{'Application.Range(K'&Loc:Rij&').Value'}=BRW6.Q.Pla2:Locatienaam
		   	Loc:Ole{'Application.Range(L'&Loc:Rij&').Value'}=BRW6.Q.Pla2:Artikeloms
            Loc:Ole{'Application.Range(M'&Loc:Rij&').Value'}=BRW6.Q.Pla2:Instructie
            Loc:Ole{'Application.Range(N'&Loc:Rij&').Value'}=BRW6.Q.Pla2:VerpakkingOmschrijving
		   	Loc:Ole{'Application.Range(O'&Loc:Rij&').Value'}=BRW6.Q.Pla2:Transport
			Do TrekLijntjes			
		END
	
	! dan de overboeking
	!IF Loc:Rij < 20 Then Loc:Rij = 19.

	IF (Loc:Rij + RECORDS(BRW8.Q) + 3) >= LOC:ExcelPageBreak AND LOC:Rij < (LOC:ExcelPageBreak - 2) THEN 
		LOC:Rij = LOC:ExcelPageBreak - 2
	.
	
	Loc:Rij += 2
	
	Loc:Ole{'Application.Range(A'&Loc:Rij&').Value'}='Overboekingen'
	Do Vet
				
		Loc:Rij+=1
		   Loc:Ole{'Application.Range(A'&Loc:Rij&').Value'}='Partijnr. (Int./Ext.)'
		   Loc:Ole{'Application.Range(B'&Loc:Rij&').Value'}='Laadtijd'
		   Loc:Ole{'Application.Range(C'&Loc:Rij&').Value'}='KG' 
		   Loc:Ole{'Application.Range(D'&Loc:Rij&').Value'}='Pallets' 
		   Loc:Ole{'Application.Range(E'&Loc:Rij&').Value'}='Van Cel' 
		   Loc:Ole{'Application.Range(F'&Loc:Rij&').Value'}='Naar Cel' 
		   Loc:Ole{'Application.Range(G'&Loc:Rij&').Value'}='Transfer'
		   Loc:Ole{'Application.Range(H'&Loc:Rij&').Value'}='Verw.' 
		   Loc:Ole{'Application.Range(L'&Loc:Rij&').Value'}='Product' 
		   Loc:Ole{'Application.Range(M'&Loc:Rij&').Value'}='Instructie'
           Loc:Ole{'Application.Range(N'&Loc:Rij&').Value'}='Verpakking'
           Loc:Ole{'Application.Range(O'&Loc:Rij&').Value'}='Transport'
		Do TrekLijntjes
		Do Vet
		Loop i# = 1 To RECORDS(BRW8.Q)
			Loc:Rij+=1
			Get(BRW8.Q,i#)
			IF CLIP(BRW8.Q.Pla4:ExternPartijnr) = '' THEN
				Loc:Ole{'Application.Range(A'&Loc:Rij&').Value'}=CLIP(BRW8.Q.Pla4:PartijID)
			ELSE
				Loc:Ole{'Application.Range(A'&Loc:Rij&').Value'}=CLIP(BRW8.Q.Pla4:PartijID) & '/' & CLIP(BRW8.Q.Pla4:ExternPartijnr)
			.
		   	Loc:Ole{'Application.Range(B'&Loc:Rij&').Value'}=Format(BRW8.Q.Pla4:Planning_TIME,@t01)
			Loc:Ole{'Application.Range(C'&Loc:Rij&').Value'}=BRW8.Q.LOC:OverboekingKG1
			Loc:Ole{'Application.Range(D'&Loc:Rij&').Value'}=BRW8.Q.LOC:OverboekingPallets1
			Loc:Ole{'Application.Range(E'&Loc:Rij&').Value'}=BRW8.Q.Pla4:CelOms
			Loc:Ole{'Application.Range(F'&Loc:Rij&').Value'}=CLIP(BRW8.Q.Pla4:NaarCelOms) & '.' & CLIP(BRW8.Q.Pla4:Locatienaam)
			
			IF BRW8.Q.LOC:Getransferd = 1
				Loc:Ole{'Application.Range(G'&Loc:Rij&').Value'}='X'.
			
			IF BRW8.Q.Pla4:Verwerkt = 1
				Loc:Ole{'Application.Range(H'&Loc:Rij&').Value'}='X'.
			
			Loc:Ole{'Application.Range(L'&Loc:Rij&').Value'}=BRW8.Q.Pla4:Artikeloms
            Loc:Ole{'Application.Range(M'&Loc:Rij&').Value'}=BRW8.Q.Pla4:Instructie
            Loc:Ole{'Application.Range(N'&Loc:Rij&').Value'}=BRW8.Q.Pla4:VerpakkingOmschrijving
			Loc:Ole{'Application.Range(O'&Loc:Rij&').Value'}=BRW8.Q.Pla4:Transport
			Do TrekLijntjes			
		END

	! en tenslotte de uitslagen
		!IF Loc:Rij < 30 Then Loc:Rij = 29.
	IF (Loc:Rij + RECORDS(BRW1.Q) + 3) >= LOC:ExcelPageBreak AND LOC:Rij < (LOC:ExcelPageBreak - 2) THEN 
		LOC:Rij = LOC:ExcelPageBreak - 2
	.
	Loc:Rij+=2
	
	Loc:Ole{'Application.Range(A'&Loc:Rij&').Value'}='Verkopen'
	Do Vet
				
	Loc:Rij+=1
   	Loc:Ole{'Application.Range(A'&Loc:Rij&').Value'}='Afnemer'
   	Loc:Ole{'Application.Range(B'&Loc:Rij&').Value'}='Laadtijd'
   	Loc:Ole{'Application.Range(C'&Loc:Rij&').Value'}='KG' 
   	Loc:Ole{'Application.Range(D'&Loc:Rij&').Value'}='Pallets' 
    Loc:Ole{'Application.Range(E'&Loc:Rij&').Value'}='Partijnr. (Int./Ext.)'
   	Loc:Ole{'Application.Range(F'&Loc:Rij&').Value'}='Gepr.' 
	Loc:Ole{'Application.Range(G'&Loc:Rij&').Value'}=''
	Loc:Ole{'Application.Range(H'&Loc:Rij&').Value'}='Verw.'
   	Loc:Ole{'Application.Range(I'&Loc:Rij&').Value'}='Gewogen' 
   	Loc:Ole{'Application.Range(J'&Loc:Rij&').Value'}='Cel' 
   	Loc:Ole{'Application.Range(K'&Loc:Rij&').Value'}='Locatie' 
   	Loc:Ole{'Application.Range(L'&Loc:Rij&').Value'}='Product' 
   	Loc:Ole{'Application.Range(M'&Loc:Rij&').Value'}='Instructie'
    Loc:Ole{'Application.Range(N'&Loc:Rij&').Value'}='Verpakking'
    Loc:Ole{'Application.Range(O'&Loc:Rij&').Value'}='Transport'
    Loc:Ole{'Application.Range(P'&Loc:Rij&').Value'}='Leverancier'    
	!Loc:Ole{'Application.Range(K'&Loc:Rij&').Value'}='Memo'
	Do TrekLijntjes
	Do Vet
		Loop i# = 1 To RECORDS(BRW1.Q)
			Loc:Rij+=1
			Get(BRW1.Q,i#)
		   	Loc:Ole{'Application.Range(A'&Loc:Rij&').Value'}=BRW1.Q.Pla3:FirmaNaam
		   	Loc:Ole{'Application.Range(B'&Loc:Rij&').Value'}=FORMAT(BRW1.Q.Pla3:Planning_TIME,@t01)
		   	Loc:Ole{'Application.Range(C'&Loc:Rij&').Value'}=BRW1.Q.LOC:VerkoopKG1
		   	Loc:Ole{'Application.Range(D'&Loc:Rij&').Value'}=BRW1.Q.LOC:VerkoopPallets1
			IF BRW1.Q.Pla3:ExternPartijnr = 0 THEN
				IF BRW1.Q.Pla3:PartijID > 0 THEN
					Loc:Ole{'Application.Range(E'&Loc:Rij&').Value'}=CLIP(BRW1.Q.Pla3:PartijID)
				.
			ELSE
				Loc:Ole{'Application.Range(E'&Loc:Rij&').Value'}=CLIP(BRW1.Q.Pla3:PartijID) & '/' & CLIP(BRW1.Q.Pla3:ExternPartijnr)
			.
			
			IF BRW1.Q.Pla3:Geprint = 1
				Loc:Ole{'Application.Range(F'&Loc:Rij&').Value'}='X'.

			IF BRW1.Q.Pla3:Verwerkt = 1
				Loc:Ole{'Application.Range(H'&Loc:Rij&').Value'}='X'.
			
			IF BRW1.Q.Pla3:Gewogen = 1
				Loc:Ole{'Application.Range(I'&Loc:Rij&').Value'}='X'.
			
			Loc:Ole{'Application.Range(J'&Loc:Rij&').Value'}=BRW1.Q.PLA3:CelOms
			Loc:Ole{'Application.Range(K'&Loc:Rij&').Value'}=BRW1.Q.Loc:Locatienaam
            Loc:Ole{'Application.Range(L'&Loc:Rij&').Value'}=BRW1.Q.pla3:ArtikelOms
            
            Loc:Ole{'Application.Range(M'&Loc:Rij&').Value'}=BRW1.Q.Pla3:Instructie
            Loc:Ole{'Application.Range(N'&Loc:Rij&').Value'}=BRW1.Q.Pla3:VerpakkingOmschrijving            
            Loc:Ole{'Application.Range(O'&Loc:Rij&').Value'}=BRW1.Q.Pla3:Transport
		   	Loc:Ole{'Application.Range(P'&Loc:Rij&').Value'}=BRW1.Q.Pla3:LeverancierFirmaNaam
		   	!Loc:Ole{'Application.Range(L'&Loc:Rij&').Value'}=BRW1.Q.Pla:Memo
			Do TrekLijntjes
		END
   !	Loc:Ole{'Application.Columns(A:S).AutoFit'}
	Loc:Ole{'Cells.Select'}
	Loc:Ole{'Application.Selection.Font.Name'} = 'Ariel'
	Loc:Ole{'Application.Selection.Font.Size'} = 11
	
	Loc:Ole{'Application.Rows(1:'&Loc:Rij&').AutoFit'}
	Loc:Ole{'Application.ActiveSheet.PageSetup.Zoom'} = 50 != Loc:Ole{'Application.ActiveSheet.PageSetup.BlackAndWhite'}!
	Loc:Ole{'Application.ActiveSheet.PageSetup.Orientation'} = 2 != Landscape
	Loc:Ole{'Application.ActiveSheet.PageSetup.TopMargin'} = 30 != Points (1/72 inch
	Loc:Ole{'Application.ActiveSheet.PageSetup.BottomMargin'} = 30 != Points (1/72 inch
	Loc:Ole{'Application.ActiveSheet.PageSetup.LeftMargin'} = 30 != Points (1/72 inch
	Loc:Ole{'Application.ActiveSheet.PageSetup.RightMargin'} = 30 != Points (1/72 inch
	
	Loc:Ole{'Application.Visible'}=true ! nu pas excel laten zien
	Loc:Ole{'Application.ActiveWindow.SelectedSheets.PrintPreview'}
	!LOC:ExcelMacroFile = CLIP(GETINI('Excel', 'MacroXLS',,'.\Voorraad.ini'))
	
	!Loc:Ole{'Application.Workbooks.Open('&CLIP(LOC:ExcelMacroFile)&')'}
	
	!pos# = INSTRING('\', CLIP(LOC:ExcelMacroFile), -1, LEN(CLIP(LOC:ExcelMacroFile)))
	!Loc:Ole{'Application.Run('&CLIP(SUB(CLIP(LOC:ExcelMacroFile), pos# + 1, LEN(CLIP(LOC:ExcelMacroFile)) - pos#)) & '!Macro1)'}

	
ConvertDatum        ROUTINE
	IF NOT(LOC:DatumNuLast = LOC:DatumNu) THEN
		IF YEAR(LOC:DatumNu) < 2005
			Loc:DatumVanSQL = DATE(1,1,2005) - 36163
			Loc:DatumTotSQL = DATE(1,1,2005) - 36163 + 1
		ELSE
			Loc:DatumVanSQL = LOC:DatumNu - 36163
			Loc:DatumTotSQL = LOC:DatumNu - 36163 + 1
		.
		
		LOC:DatumNuLast = LOC:DatumNu

		db.DebugOut('ConvertDatum - RefreshBrowses')
		
		DO RefreshBrowses
	END
RefreshBrowses      ROUTINE
    db.DebugOut('RefreshBrowses')
	BRW1.ResetQueue(0)
	BRW3.ResetQueue(0)
    BRW6.ResetQueue(0)
    
	BRW8.ResetQueue(0)
	BRW9.ResetQueue(0)
    BRW12.ResetQueue(0)
    
    BRW11.ResetQueue(Reset:Done)
    
    !DO KleurActiviteitTab
RefreshWindow       ROUTINE
	NetRefreshPlanningViews()
    NetRefreshVoorraadViews()
        
    ThisWindow.Reset(1)
    
    DO KleurActiviteitTab
    
	EXIT
KleurActiviteitTab  ROUTINE
    ! Gekleurde tabs werken niet in Vista
    CLEAR(ACT:Record)
    ACT:Datum = LOC:DatumNu
    SET(ACT:FK2_Activiteit, ACT:FK2_Activiteit)
    LOOP UNTIL Access:Activiteit.Next()
        IF ACT:Datum <> LOC:DatumNu THEN BREAK.
        IF ACT:Uitgevoerd = 1 THEN CYCLE.
        
        UNHIDE(?ActiviteitPanel)
        EXIT
    END
    
    HIDE(?ActiviteitPanel)
    
!    IF CHOICE(?SHEET2) = 5 THEN
!        ?ActiviteitTab{PROP:Background} = LOC:ActiviteitTabColor
!    ELSE
!        CLEAR(ACT:Record)
!        ACT:Datum = LOC:DatumNu
!        SET(ACT:FK2_Activiteit, ACT:FK2_Activiteit)
!        IF Access:Activiteit.Next() = Level:Benign THEN
!            IF ACT:Datum = LOC:DatumNu THEN 
!                ?ActiviteitTab{PROP:Background} = COLOR:Red
!                EXIT
!            END
!        END
!        
!        ?ActiviteitTab{PROP:Background} = LOC:ActiviteitTabColor
!    END
!    
!    DISPLAY(?ActiviteitTab)
    

ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('BrowsePlanning')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  GLO:Planning_ThreadID = THREAD() 
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Calendar
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('LOC:DatumVanSQL',LOC:DatumVanSQL)                  ! Added by: BrowseBox(ABC)
  BIND('Loc:DatumTotSQL',Loc:DatumTotSQL)                  ! Added by: BrowseBox(ABC)
  BIND('LOC:InkoopKG1',LOC:InkoopKG1)                      ! Added by: BrowseBox(ABC)
  BIND('LOC:InkoopPallets1',LOC:InkoopPallets1)            ! Added by: BrowseBox(ABC)
  BIND('LOC:Getransferd',LOC:Getransferd)                  ! Added by: BrowseBox(ABC)
  BIND('LOC:VerkoopKG1',LOC:VerkoopKG1)                    ! Added by: BrowseBox(ABC)
  BIND('LOC:VerkoopPallets1',LOC:VerkoopPallets1)          ! Added by: BrowseBox(ABC)
  BIND('LOC:Locatienaam',LOC:Locatienaam)                  ! Added by: BrowseBox(ABC)
  BIND('LOC:OverboekingKG1',LOC:OverboekingKG1)            ! Added by: BrowseBox(ABC)
  BIND('LOC:OverboekingPallets1',LOC:OverboekingPallets1)  ! Added by: BrowseBox(ABC)
  BIND('LOC:InkoopKG2',LOC:InkoopKG2)                      ! Added by: BrowseBox(ABC)
  BIND('LOC:InkoopPallets2',LOC:InkoopPallets2)            ! Added by: BrowseBox(ABC)
  BIND('LOC:OverboekingKG2',LOC:OverboekingKG2)            ! Added by: BrowseBox(ABC)
  BIND('LOC:OverboekingPallets2',LOC:OverboekingPallets2)  ! Added by: BrowseBox(ABC)
  BIND('LOC:VerkoopKG2',LOC:VerkoopKG2)                    ! Added by: BrowseBox(ABC)
  BIND('LOC:VerkoopPallets2',LOC:VerkoopPallets2)          ! Added by: BrowseBox(ABC)
  BIND('LOC:VerkoopKG3',LOC:VerkoopKG3)                    ! Added by: BrowseBox(ABC)
  BIND('LOC:VerkoopPallets3',LOC:VerkoopPallets3)          ! Added by: BrowseBox(ABC)
  BIND('LOC:Locatienaam3',LOC:Locatienaam3)                ! Added by: BrowseBox(ABC)
  BIND('ACT:ActiviteitID',ACT:ActiviteitID)                ! Added by: BrowseBox(ABC)
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  IF SELF.Request = SelectRecord
     SELF.AddItem(?Close,RequestCancelled)                 ! Add the close control to the window manger
  ELSE
     SELF.AddItem(?Close,RequestCompleted)                 ! Add the close control to the window manger
  END
  Relate:AMutatie.Open                                     ! File AMutatie used by this procedure, so make sure it's RelationManager is open
  Relate:APlanning.Open                                    ! File APlanning used by this procedure, so make sure it's RelationManager is open
  Relate:APlanningInkoop.Open                              ! File APlanningInkoop used by this procedure, so make sure it's RelationManager is open
  Relate:APlanningOverboeking.Open                         ! File APlanningOverboeking used by this procedure, so make sure it's RelationManager is open
  Relate:APlanningVerkoop.Open                             ! File APlanningVerkoop used by this procedure, so make sure it's RelationManager is open
  Relate:Activiteit.Open                                   ! File Activiteit used by this procedure, so make sure it's RelationManager is open
  Relate:BulkOverboeking.Open                              ! File BulkOverboeking used by this procedure, so make sure it's RelationManager is open
  Relate:CelLocatie.SetOpenRelated()
  Relate:CelLocatie.Open                                   ! File CelLocatie used by this procedure, so make sure it's RelationManager is open
  Relate:Inkoop.SetOpenRelated()
  Relate:Inkoop.Open                                       ! File Inkoop used by this procedure, so make sure it's RelationManager is open
  Relate:Mutatie.Open                                      ! File Mutatie used by this procedure, so make sure it's RelationManager is open
  Relate:OverboekingRit.SetOpenRelated()
  Relate:OverboekingRit.Open                               ! File OverboekingRit used by this procedure, so make sure it's RelationManager is open
  Relate:Partij.Open                                       ! File Partij used by this procedure, so make sure it's RelationManager is open
  Relate:PlanningInkoop.Open                               ! File PlanningInkoop used by this procedure, so make sure it's RelationManager is open
  Relate:PlanningOverboeking.Open                          ! File PlanningOverboeking used by this procedure, so make sure it's RelationManager is open
  Relate:PlanningVerkoop.Open                              ! File PlanningVerkoop used by this procedure, so make sure it's RelationManager is open
  Relate:Sjabloon.Open                                     ! File Sjabloon used by this procedure, so make sure it's RelationManager is open
  Relate:ViewPartijCelLocaties.Open                        ! File ViewPartijCelLocaties used by this procedure, so make sure it's RelationManager is open
  Relate:ViewVoorraadCelTotaal.Open                        ! File ViewVoorraadCelTotaal used by this procedure, so make sure it's RelationManager is open
  Relate:ViewVoorraadPartij.Open                           ! File ViewVoorraadPartij used by this procedure, so make sure it's RelationManager is open
  Access:Planning.UseFile                                  ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:Verkoop.UseFile                                   ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:OverboekingRitRegel.UseFile                       ! File referenced in 'Other Files' so need to inform it's FileManager
  SELF.FilesOpened = True
  BUFFER(PlanningInkoop, 500)
  BUFFER(PlanningVerkoop, 500)
  BUFFER(PlanningOverboeking, 500)
  BUFFER(APlanningInkoop, 500)
  BUFFER(APlanningVerkoop, 500)
  BUFFER(APlanningOverboeking, 500)
  BRW6.Init(?InkoopList,Queue:Browse.ViewPosition,BRW6::View:Browse,Queue:Browse,Relate:PlanningInkoop,SELF) ! Initialize the browse manager
  BRW1.Init(?VerkoopList,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:PlanningVerkoop,SELF) ! Initialize the browse manager
  BRW1.SetUseMRP(False)
  BRW8.Init(?OverboekList,Queue:Browse:2.ViewPosition,BRW8::View:Browse,Queue:Browse:2,Relate:PlanningOverboeking,SELF) ! Initialize the browse manager
  BRW3.Init(?InkoopList2,Queue:Browse:3.ViewPosition,BRW3::View:Browse,Queue:Browse:3,Relate:APlanningInkoop,SELF) ! Initialize the browse manager
  BRW9.Init(?OverboekList2,Queue:Browse:4.ViewPosition,BRW9::View:Browse,Queue:Browse:4,Relate:APlanningOverboeking,SELF) ! Initialize the browse manager
  BRW12.Init(?VerkoopList:2,Queue:Browse:5.ViewPosition,BRW12::View:Browse,Queue:Browse:5,Relate:APlanningVerkoop,SELF) ! Initialize the browse manager
  BRW11.Init(?List,Queue:Browse:6.ViewPosition,BRW11::View:Browse,Queue:Browse:6,Relate:Activiteit,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  LOC:ActiviteitTabColor = ?ActiviteitTab{PROP:Background}
  
  !0{Prop:Text}=CLIP(0{Prop:Text}) & ' (' & CLIP(LEFT(FORMAT(GLO:Planning_ThreadID,@N_10))) & ')'
  
  IF NOT(IGB:MakenVerkoopMutatie OR IGB:Verwerken) THEN
  	DISABLE(?VerkoopHVerwerkt)
  	DISABLE(?VerkoopHVerwerkt4)
  	DISABLE(?VerkoopTerugdraaienButton)
  	DISABLE(?VerkoopTerugdraaienButton4)
  	DISABLE(?VerkoopVerwerkt)
  	DISABLE(?VerkoopVerwerkt4)
  END
  
  IF NOT(IGB:Verwerken) THEN
      DISABLE(?InkoopTerugdraaienButton)
      DISABLE(?InkoopTerugdraaien2)
      DISABLE(?InkoopVerwerk)
      DISABLE(?InkoopVerwerk2)
      DISABLE(?InkoopHVerwerkt)
      DISABLE(?InkoopHVerwerkt2)
      DISABLE(?TransferInkoopButton)
      DISABLE(?TransferButton2)
      
      DISABLE(?BulkOverboeken)
      DISABLE(?BulkOverboeken3)
      DISABLE(?OverboekVerwerkt)
      DISABLE(?OverboekVerwerkt3)
      DISABLE(?Ritten)
      DISABLE(?OverboekTransfers3)
  END
  
  IF GLO:HidePlanningInstructie THEN
      ?InkoopList{PROPLIST:Width, 5} = 0
      ?InkoopList2{PROPLIST:Width, 5} = 0
      ?VerkoopList{PROPLIST:Width, 7} = 0
      ?VerkoopList:2{PROPLIST:Width, 7} = 0
      ?OverboekList{PROPLIST:Width, 7} = 0
      ?OverboekList2{PROPLIST:Width, 7} = 0    
  END
  WinAlertMouseZoom()
  Do DefineListboxStyle
  BRW6.Q &= Queue:Browse
  BRW6.FileLoaded = 1                                      ! This is a 'file loaded' browse
  BRW6.AddSortOrder(,Pla2:Planning_FirmaNaam_K)            ! Add the sort order for Pla2:Planning_FirmaNaam_K for sort order 1
  BRW6.SetFilter('(Pla2:Planning >= LOC:DatumVanSQL AND Pla2:Planning << Loc:DatumTotSQL)') ! Apply filter expression to browse
  ?InkoopList{PROP:IconList,1} = '~off.ico'
  ?InkoopList{PROP:IconList,2} = '~on.ico'
  BRW6.AddField(Pla2:ArtikelID,BRW6.Q.Pla2:ArtikelID)      ! Field Pla2:ArtikelID is a hot field or requires assignment from browse
  BRW6.AddField(Pla2:ArtikelOms,BRW6.Q.Pla2:ArtikelOms)    ! Field Pla2:ArtikelOms is a hot field or requires assignment from browse
  BRW6.AddField(Pla2:FirmaNaam,BRW6.Q.Pla2:FirmaNaam)      ! Field Pla2:FirmaNaam is a hot field or requires assignment from browse
  BRW6.AddField(LOC:InkoopKG1,BRW6.Q.LOC:InkoopKG1)        ! Field LOC:InkoopKG1 is a hot field or requires assignment from browse
  BRW6.AddField(Pla2:Instructie,BRW6.Q.Pla2:Instructie)    ! Field Pla2:Instructie is a hot field or requires assignment from browse
  BRW6.AddField(Pla2:VerpakkingOmschrijving,BRW6.Q.Pla2:VerpakkingOmschrijving) ! Field Pla2:VerpakkingOmschrijving is a hot field or requires assignment from browse
  BRW6.AddField(Pla2:Planning_TIME,BRW6.Q.Pla2:Planning_TIME) ! Field Pla2:Planning_TIME is a hot field or requires assignment from browse
  BRW6.AddField(LOC:InkoopPallets1,BRW6.Q.LOC:InkoopPallets1) ! Field LOC:InkoopPallets1 is a hot field or requires assignment from browse
  BRW6.AddField(Pla2:MutatieGemaakt,BRW6.Q.Pla2:MutatieGemaakt) ! Field Pla2:MutatieGemaakt is a hot field or requires assignment from browse
  BRW6.AddField(Pla2:Geprint,BRW6.Q.Pla2:Geprint)          ! Field Pla2:Geprint is a hot field or requires assignment from browse
  BRW6.AddField(LOC:Getransferd,BRW6.Q.LOC:Getransferd)    ! Field LOC:Getransferd is a hot field or requires assignment from browse
  BRW6.AddField(Pla2:Verwerkt,BRW6.Q.Pla2:Verwerkt)        ! Field Pla2:Verwerkt is a hot field or requires assignment from browse
  BRW6.AddField(Pla2:Gewogen,BRW6.Q.Pla2:Gewogen)          ! Field Pla2:Gewogen is a hot field or requires assignment from browse
  BRW6.AddField(Pla2:CelOms,BRW6.Q.Pla2:CelOms)            ! Field Pla2:CelOms is a hot field or requires assignment from browse
  BRW6.AddField(Pla2:Locatienaam,BRW6.Q.Pla2:Locatienaam)  ! Field Pla2:Locatienaam is a hot field or requires assignment from browse
  BRW6.AddField(Pla2:Transport,BRW6.Q.Pla2:Transport)      ! Field Pla2:Transport is a hot field or requires assignment from browse
  BRW6.AddField(Pla2:PlanningID,BRW6.Q.Pla2:PlanningID)    ! Field Pla2:PlanningID is a hot field or requires assignment from browse
  BRW6.AddField(Pla2:InkoopID,BRW6.Q.Pla2:InkoopID)        ! Field Pla2:InkoopID is a hot field or requires assignment from browse
  BRW6.AddField(Pla2:KG,BRW6.Q.Pla2:KG)                    ! Field Pla2:KG is a hot field or requires assignment from browse
  BRW6.AddField(Pla2:MutatieKG,BRW6.Q.Pla2:MutatieKG)      ! Field Pla2:MutatieKG is a hot field or requires assignment from browse
  BRW6.AddField(Pla2:MutatiePallets,BRW6.Q.Pla2:MutatiePallets) ! Field Pla2:MutatiePallets is a hot field or requires assignment from browse
  BRW6.AddField(Pla2:Pallets,BRW6.Q.Pla2:Pallets)          ! Field Pla2:Pallets is a hot field or requires assignment from browse
  BRW6.AddField(Pla2:Planning,BRW6.Q.Pla2:Planning)        ! Field Pla2:Planning is a hot field or requires assignment from browse
  BRW1.Q &= Queue:Browse:1
  BRW1.FileLoaded = 1                                      ! This is a 'file loaded' browse
  BRW1.AddSortOrder(,Pla3:Planning_FirmaNaam_K)            ! Add the sort order for Pla3:Planning_FirmaNaam_K for sort order 1
  BRW1.SetFilter('(Pla3:Planning >= LOC:DatumVanSQL AND Pla3:Planning << Loc:DatumTotSQL)') ! Apply filter expression to browse
  ?VerkoopList{PROP:IconList,1} = '~off.ico'
  ?VerkoopList{PROP:IconList,2} = '~on.ico'
  BRW1.AddField(Pla3:ArtikelID,BRW1.Q.Pla3:ArtikelID)      ! Field Pla3:ArtikelID is a hot field or requires assignment from browse
  BRW1.AddField(Pla3:ArtikelOms,BRW1.Q.Pla3:ArtikelOms)    ! Field Pla3:ArtikelOms is a hot field or requires assignment from browse
  BRW1.AddField(Pla3:FirmaNaam,BRW1.Q.Pla3:FirmaNaam)      ! Field Pla3:FirmaNaam is a hot field or requires assignment from browse
  BRW1.AddField(Pla3:PartijID,BRW1.Q.Pla3:PartijID)        ! Field Pla3:PartijID is a hot field or requires assignment from browse
  BRW1.AddField(Pla3:ExternPartijnr,BRW1.Q.Pla3:ExternPartijnr) ! Field Pla3:ExternPartijnr is a hot field or requires assignment from browse
  BRW1.AddField(LOC:VerkoopKG1,BRW1.Q.LOC:VerkoopKG1)      ! Field LOC:VerkoopKG1 is a hot field or requires assignment from browse
  BRW1.AddField(Pla3:Instructie,BRW1.Q.Pla3:Instructie)    ! Field Pla3:Instructie is a hot field or requires assignment from browse
  BRW1.AddField(Pla3:VerpakkingOmschrijving,BRW1.Q.Pla3:VerpakkingOmschrijving) ! Field Pla3:VerpakkingOmschrijving is a hot field or requires assignment from browse
  BRW1.AddField(Pla3:Planning_TIME,BRW1.Q.Pla3:Planning_TIME) ! Field Pla3:Planning_TIME is a hot field or requires assignment from browse
  BRW1.AddField(LOC:VerkoopPallets1,BRW1.Q.LOC:VerkoopPallets1) ! Field LOC:VerkoopPallets1 is a hot field or requires assignment from browse
  BRW1.AddField(Pla3:MutatieGemaakt,BRW1.Q.Pla3:MutatieGemaakt) ! Field Pla3:MutatieGemaakt is a hot field or requires assignment from browse
  BRW1.AddField(Pla3:Geprint,BRW1.Q.Pla3:Geprint)          ! Field Pla3:Geprint is a hot field or requires assignment from browse
  BRW1.AddField(Pla3:Verwerkt,BRW1.Q.Pla3:Verwerkt)        ! Field Pla3:Verwerkt is a hot field or requires assignment from browse
  BRW1.AddField(Pla3:Gewogen,BRW1.Q.Pla3:Gewogen)          ! Field Pla3:Gewogen is a hot field or requires assignment from browse
  BRW1.AddField(Pla3:CelOms,BRW1.Q.Pla3:CelOms)            ! Field Pla3:CelOms is a hot field or requires assignment from browse
  BRW1.AddField(LOC:Locatienaam,BRW1.Q.LOC:Locatienaam)    ! Field LOC:Locatienaam is a hot field or requires assignment from browse
  BRW1.AddField(Pla3:HerkomstOverboekingCelOms,BRW1.Q.Pla3:HerkomstOverboekingCelOms) ! Field Pla3:HerkomstOverboekingCelOms is a hot field or requires assignment from browse
  BRW1.AddField(Pla3:LeverancierFirmaNaam,BRW1.Q.Pla3:LeverancierFirmaNaam) ! Field Pla3:LeverancierFirmaNaam is a hot field or requires assignment from browse
  BRW1.AddField(Pla3:Transport,BRW1.Q.Pla3:Transport)      ! Field Pla3:Transport is a hot field or requires assignment from browse
  BRW1.AddField(Pla3:PlanningID,BRW1.Q.Pla3:PlanningID)    ! Field Pla3:PlanningID is a hot field or requires assignment from browse
  BRW1.AddField(Pla3:VerkoopID,BRW1.Q.Pla3:VerkoopID)      ! Field Pla3:VerkoopID is a hot field or requires assignment from browse
  BRW1.AddField(Pla3:CelID,BRW1.Q.Pla3:CelID)              ! Field Pla3:CelID is a hot field or requires assignment from browse
  BRW1.AddField(LOC:Getransferd,BRW1.Q.LOC:Getransferd)    ! Field LOC:Getransferd is a hot field or requires assignment from browse
  BRW1.AddField(Pla3:KG,BRW1.Q.Pla3:KG)                    ! Field Pla3:KG is a hot field or requires assignment from browse
  BRW1.AddField(Pla3:MutatieKG,BRW1.Q.Pla3:MutatieKG)      ! Field Pla3:MutatieKG is a hot field or requires assignment from browse
  BRW1.AddField(Pla3:Pallets,BRW1.Q.Pla3:Pallets)          ! Field Pla3:Pallets is a hot field or requires assignment from browse
  BRW1.AddField(Pla3:MutatiePallets,BRW1.Q.Pla3:MutatiePallets) ! Field Pla3:MutatiePallets is a hot field or requires assignment from browse
  BRW1.AddField(Pla3:Planning,BRW1.Q.Pla3:Planning)        ! Field Pla3:Planning is a hot field or requires assignment from browse
  BRW8.Q &= Queue:Browse:2
  BRW8.FileLoaded = 1                                      ! This is a 'file loaded' browse
  BRW8.AddSortOrder(,Pla4:Planning_FirmaNaam_k)            ! Add the sort order for Pla4:Planning_FirmaNaam_k for sort order 1
  BRW8.SetFilter('(Pla4:Planning >= LOC:DatumVanSQL AND Pla4:Planning << Loc:DatumTotSQL)') ! Apply filter expression to browse
  ?OverboekList{PROP:IconList,1} = '~off.ico'
  ?OverboekList{PROP:IconList,2} = '~on.ico'
  BRW8.AddField(Pla4:ArtikelID,BRW8.Q.Pla4:ArtikelID)      ! Field Pla4:ArtikelID is a hot field or requires assignment from browse
  BRW8.AddField(Pla4:ArtikelOms,BRW8.Q.Pla4:ArtikelOms)    ! Field Pla4:ArtikelOms is a hot field or requires assignment from browse
  BRW8.AddField(Pla4:FirmaNaam,BRW8.Q.Pla4:FirmaNaam)      ! Field Pla4:FirmaNaam is a hot field or requires assignment from browse
  BRW8.AddField(Pla4:PartijID,BRW8.Q.Pla4:PartijID)        ! Field Pla4:PartijID is a hot field or requires assignment from browse
  BRW8.AddField(Pla4:ExternPartijnr,BRW8.Q.Pla4:ExternPartijnr) ! Field Pla4:ExternPartijnr is a hot field or requires assignment from browse
  BRW8.AddField(LOC:OverboekingKG1,BRW8.Q.LOC:OverboekingKG1) ! Field LOC:OverboekingKG1 is a hot field or requires assignment from browse
  BRW8.AddField(APla4:OverboekSoort,BRW8.Q.APla4:OverboekSoort) ! Field APla4:OverboekSoort is a hot field or requires assignment from browse
  BRW8.AddField(Pla4:Instructie,BRW8.Q.Pla4:Instructie)    ! Field Pla4:Instructie is a hot field or requires assignment from browse
  BRW8.AddField(Pla4:VerpakkingOmschrijving,BRW8.Q.Pla4:VerpakkingOmschrijving) ! Field Pla4:VerpakkingOmschrijving is a hot field or requires assignment from browse
  BRW8.AddField(Pla4:Planning_TIME,BRW8.Q.Pla4:Planning_TIME) ! Field Pla4:Planning_TIME is a hot field or requires assignment from browse
  BRW8.AddField(LOC:OverboekingPallets1,BRW8.Q.LOC:OverboekingPallets1) ! Field LOC:OverboekingPallets1 is a hot field or requires assignment from browse
  BRW8.AddField(Pla4:MutatieGemaakt,BRW8.Q.Pla4:MutatieGemaakt) ! Field Pla4:MutatieGemaakt is a hot field or requires assignment from browse
  BRW8.AddField(LOC:Getransferd,BRW8.Q.LOC:Getransferd)    ! Field LOC:Getransferd is a hot field or requires assignment from browse
  BRW8.AddField(Pla4:Verwerkt,BRW8.Q.Pla4:Verwerkt)        ! Field Pla4:Verwerkt is a hot field or requires assignment from browse
  BRW8.AddField(Pla4:CelOms,BRW8.Q.Pla4:CelOms)            ! Field Pla4:CelOms is a hot field or requires assignment from browse
  BRW8.AddField(Pla4:Locatienaam,BRW8.Q.Pla4:Locatienaam)  ! Field Pla4:Locatienaam is a hot field or requires assignment from browse
  BRW8.AddField(Pla4:NaarCelOms,BRW8.Q.Pla4:NaarCelOms)    ! Field Pla4:NaarCelOms is a hot field or requires assignment from browse
  BRW8.AddField(APla4:NaarLocatienaam,BRW8.Q.APla4:NaarLocatienaam) ! Field APla4:NaarLocatienaam is a hot field or requires assignment from browse
  BRW8.AddField(Pla4:Transport,BRW8.Q.Pla4:Transport)      ! Field Pla4:Transport is a hot field or requires assignment from browse
  BRW8.AddField(Pla4:PlanningID,BRW8.Q.Pla4:PlanningID)    ! Field Pla4:PlanningID is a hot field or requires assignment from browse
  BRW8.AddField(Pla4:KG,BRW8.Q.Pla4:KG)                    ! Field Pla4:KG is a hot field or requires assignment from browse
  BRW8.AddField(Pla4:MutatieKG,BRW8.Q.Pla4:MutatieKG)      ! Field Pla4:MutatieKG is a hot field or requires assignment from browse
  BRW8.AddField(Pla4:Pallets,BRW8.Q.Pla4:Pallets)          ! Field Pla4:Pallets is a hot field or requires assignment from browse
  BRW8.AddField(Pla4:MutatiePallets,BRW8.Q.Pla4:MutatiePallets) ! Field Pla4:MutatiePallets is a hot field or requires assignment from browse
  BRW8.AddField(Pla4:Planning,BRW8.Q.Pla4:Planning)        ! Field Pla4:Planning is a hot field or requires assignment from browse
  BRW3.Q &= Queue:Browse:3
  BRW3.FileLoaded = 1                                      ! This is a 'file loaded' browse
  BRW3.AddSortOrder(,APla2:Planning_FirmaNaam_K)           ! Add the sort order for APla2:Planning_FirmaNaam_K for sort order 1
  BRW3.SetFilter('(APla2:Planning >= LOC:DatumVanSQL AND APla2:Planning << Loc:DatumTotSQL)') ! Apply filter expression to browse
  ?InkoopList2{PROP:IconList,1} = '~off.ico'
  ?InkoopList2{PROP:IconList,2} = '~on.ico'
  BRW3.AddField(APla2:ArtikelID,BRW3.Q.APla2:ArtikelID)    ! Field APla2:ArtikelID is a hot field or requires assignment from browse
  BRW3.AddField(APla2:ArtikelOms,BRW3.Q.APla2:ArtikelOms)  ! Field APla2:ArtikelOms is a hot field or requires assignment from browse
  BRW3.AddField(APla2:FirmaNaam,BRW3.Q.APla2:FirmaNaam)    ! Field APla2:FirmaNaam is a hot field or requires assignment from browse
  BRW3.AddField(LOC:InkoopKG2,BRW3.Q.LOC:InkoopKG2)        ! Field LOC:InkoopKG2 is a hot field or requires assignment from browse
  BRW3.AddField(APla2:Instructie,BRW3.Q.APla2:Instructie)  ! Field APla2:Instructie is a hot field or requires assignment from browse
  BRW3.AddField(APla2:VerpakkingOmschrijving,BRW3.Q.APla2:VerpakkingOmschrijving) ! Field APla2:VerpakkingOmschrijving is a hot field or requires assignment from browse
  BRW3.AddField(APla2:Planning_TIME,BRW3.Q.APla2:Planning_TIME) ! Field APla2:Planning_TIME is a hot field or requires assignment from browse
  BRW3.AddField(LOC:InkoopPallets2,BRW3.Q.LOC:InkoopPallets2) ! Field LOC:InkoopPallets2 is a hot field or requires assignment from browse
  BRW3.AddField(APla2:MutatieGemaakt,BRW3.Q.APla2:MutatieGemaakt) ! Field APla2:MutatieGemaakt is a hot field or requires assignment from browse
  BRW3.AddField(APla2:Geprint,BRW3.Q.APla2:Geprint)        ! Field APla2:Geprint is a hot field or requires assignment from browse
  BRW3.AddField(LOC:Getransferd,BRW3.Q.LOC:Getransferd)    ! Field LOC:Getransferd is a hot field or requires assignment from browse
  BRW3.AddField(APla2:Verwerkt,BRW3.Q.APla2:Verwerkt)      ! Field APla2:Verwerkt is a hot field or requires assignment from browse
  BRW3.AddField(APla2:Gewogen,BRW3.Q.APla2:Gewogen)        ! Field APla2:Gewogen is a hot field or requires assignment from browse
  BRW3.AddField(APla2:CelOms,BRW3.Q.APla2:CelOms)          ! Field APla2:CelOms is a hot field or requires assignment from browse
  BRW3.AddField(APla2:Locatienaam,BRW3.Q.APla2:Locatienaam) ! Field APla2:Locatienaam is a hot field or requires assignment from browse
  BRW3.AddField(APla2:Transport,BRW3.Q.APla2:Transport)    ! Field APla2:Transport is a hot field or requires assignment from browse
  BRW3.AddField(APla2:PlanningID,BRW3.Q.APla2:PlanningID)  ! Field APla2:PlanningID is a hot field or requires assignment from browse
  BRW3.AddField(APla2:InkoopID,BRW3.Q.APla2:InkoopID)      ! Field APla2:InkoopID is a hot field or requires assignment from browse
  BRW3.AddField(APla2:KG,BRW3.Q.APla2:KG)                  ! Field APla2:KG is a hot field or requires assignment from browse
  BRW3.AddField(APla2:MutatieKG,BRW3.Q.APla2:MutatieKG)    ! Field APla2:MutatieKG is a hot field or requires assignment from browse
  BRW3.AddField(APla2:MutatiePallets,BRW3.Q.APla2:MutatiePallets) ! Field APla2:MutatiePallets is a hot field or requires assignment from browse
  BRW3.AddField(APla2:Pallets,BRW3.Q.APla2:Pallets)        ! Field APla2:Pallets is a hot field or requires assignment from browse
  BRW3.AddField(APla2:Planning,BRW3.Q.APla2:Planning)      ! Field APla2:Planning is a hot field or requires assignment from browse
  BRW9.Q &= Queue:Browse:4
  BRW9.FileLoaded = 1                                      ! This is a 'file loaded' browse
  BRW9.AddSortOrder(,APla4:Planning_FirmaNaam_k)           ! Add the sort order for APla4:Planning_FirmaNaam_k for sort order 1
  BRW9.SetFilter('(APla4:Planning >= LOC:DatumVanSQL AND APla4:Planning << Loc:DatumTotSQL)') ! Apply filter expression to browse
  ?OverboekList2{PROP:IconList,1} = '~off.ico'
  ?OverboekList2{PROP:IconList,2} = '~on.ico'
  BRW9.AddField(APla4:ArtikelID,BRW9.Q.APla4:ArtikelID)    ! Field APla4:ArtikelID is a hot field or requires assignment from browse
  BRW9.AddField(APla4:ArtikelOms,BRW9.Q.APla4:ArtikelOms)  ! Field APla4:ArtikelOms is a hot field or requires assignment from browse
  BRW9.AddField(APla4:FirmaNaam,BRW9.Q.APla4:FirmaNaam)    ! Field APla4:FirmaNaam is a hot field or requires assignment from browse
  BRW9.AddField(APla4:PartijID,BRW9.Q.APla4:PartijID)      ! Field APla4:PartijID is a hot field or requires assignment from browse
  BRW9.AddField(APla4:ExternPartijnr,BRW9.Q.APla4:ExternPartijnr) ! Field APla4:ExternPartijnr is a hot field or requires assignment from browse
  BRW9.AddField(LOC:OverboekingKG2,BRW9.Q.LOC:OverboekingKG2) ! Field LOC:OverboekingKG2 is a hot field or requires assignment from browse
  BRW9.AddField(APla4:Instructie,BRW9.Q.APla4:Instructie)  ! Field APla4:Instructie is a hot field or requires assignment from browse
  BRW9.AddField(APla4:VerpakkingOmschrijving,BRW9.Q.APla4:VerpakkingOmschrijving) ! Field APla4:VerpakkingOmschrijving is a hot field or requires assignment from browse
  BRW9.AddField(APla4:Planning_TIME,BRW9.Q.APla4:Planning_TIME) ! Field APla4:Planning_TIME is a hot field or requires assignment from browse
  BRW9.AddField(LOC:OverboekingPallets2,BRW9.Q.LOC:OverboekingPallets2) ! Field LOC:OverboekingPallets2 is a hot field or requires assignment from browse
  BRW9.AddField(APla4:OverboekSoort,BRW9.Q.APla4:OverboekSoort) ! Field APla4:OverboekSoort is a hot field or requires assignment from browse
  BRW9.AddField(APla4:MutatieGemaakt,BRW9.Q.APla4:MutatieGemaakt) ! Field APla4:MutatieGemaakt is a hot field or requires assignment from browse
  BRW9.AddField(LOC:Getransferd,BRW9.Q.LOC:Getransferd)    ! Field LOC:Getransferd is a hot field or requires assignment from browse
  BRW9.AddField(APla4:Verwerkt,BRW9.Q.APla4:Verwerkt)      ! Field APla4:Verwerkt is a hot field or requires assignment from browse
  BRW9.AddField(APla4:CelOms,BRW9.Q.APla4:CelOms)          ! Field APla4:CelOms is a hot field or requires assignment from browse
  BRW9.AddField(APla4:Locatienaam,BRW9.Q.APla4:Locatienaam) ! Field APla4:Locatienaam is a hot field or requires assignment from browse
  BRW9.AddField(APla4:NaarCelOms,BRW9.Q.APla4:NaarCelOms)  ! Field APla4:NaarCelOms is a hot field or requires assignment from browse
  BRW9.AddField(APla4:NaarLocatienaam,BRW9.Q.APla4:NaarLocatienaam) ! Field APla4:NaarLocatienaam is a hot field or requires assignment from browse
  BRW9.AddField(APla4:Transport,BRW9.Q.APla4:Transport)    ! Field APla4:Transport is a hot field or requires assignment from browse
  BRW9.AddField(APla4:PlanningID,BRW9.Q.APla4:PlanningID)  ! Field APla4:PlanningID is a hot field or requires assignment from browse
  BRW9.AddField(APla4:KG,BRW9.Q.APla4:KG)                  ! Field APla4:KG is a hot field or requires assignment from browse
  BRW9.AddField(APla4:MutatieKG,BRW9.Q.APla4:MutatieKG)    ! Field APla4:MutatieKG is a hot field or requires assignment from browse
  BRW9.AddField(APla4:Pallets,BRW9.Q.APla4:Pallets)        ! Field APla4:Pallets is a hot field or requires assignment from browse
  BRW9.AddField(APla4:MutatiePallets,BRW9.Q.APla4:MutatiePallets) ! Field APla4:MutatiePallets is a hot field or requires assignment from browse
  BRW9.AddField(APla4:Planning,BRW9.Q.APla4:Planning)      ! Field APla4:Planning is a hot field or requires assignment from browse
  BRW12.Q &= Queue:Browse:5
  BRW12.AddSortOrder(,APla3:Planning_FirmaNaam_K)          ! Add the sort order for APla3:Planning_FirmaNaam_K for sort order 1
  BRW12.SetFilter('(APla3:Planning >= LOC:DatumVanSQL AND APla3:Planning << Loc:DatumTotSQL)') ! Apply filter expression to browse
  ?VerkoopList:2{PROP:IconList,1} = '~off.ico'
  ?VerkoopList:2{PROP:IconList,2} = '~on.ico'
  BRW12.AddField(APla3:ArtikelID,BRW12.Q.APla3:ArtikelID)  ! Field APla3:ArtikelID is a hot field or requires assignment from browse
  BRW12.AddField(APla3:ArtikelOms,BRW12.Q.APla3:ArtikelOms) ! Field APla3:ArtikelOms is a hot field or requires assignment from browse
  BRW12.AddField(APla3:FirmaNaam,BRW12.Q.APla3:FirmaNaam)  ! Field APla3:FirmaNaam is a hot field or requires assignment from browse
  BRW12.AddField(APla3:PartijID,BRW12.Q.APla3:PartijID)    ! Field APla3:PartijID is a hot field or requires assignment from browse
  BRW12.AddField(APla3:ExternPartijnr,BRW12.Q.APla3:ExternPartijnr) ! Field APla3:ExternPartijnr is a hot field or requires assignment from browse
  BRW12.AddField(LOC:VerkoopKG2,BRW12.Q.LOC:VerkoopKG2)    ! Field LOC:VerkoopKG2 is a hot field or requires assignment from browse
  BRW12.AddField(APla3:Instructie,BRW12.Q.APla3:Instructie) ! Field APla3:Instructie is a hot field or requires assignment from browse
  BRW12.AddField(APla3:VerpakkingOmschrijving,BRW12.Q.APla3:VerpakkingOmschrijving) ! Field APla3:VerpakkingOmschrijving is a hot field or requires assignment from browse
  BRW12.AddField(APla3:Planning_TIME,BRW12.Q.APla3:Planning_TIME) ! Field APla3:Planning_TIME is a hot field or requires assignment from browse
  BRW12.AddField(LOC:VerkoopPallets2,BRW12.Q.LOC:VerkoopPallets2) ! Field LOC:VerkoopPallets2 is a hot field or requires assignment from browse
  BRW12.AddField(APla3:MutatieGemaakt,BRW12.Q.APla3:MutatieGemaakt) ! Field APla3:MutatieGemaakt is a hot field or requires assignment from browse
  BRW12.AddField(APla3:Geprint,BRW12.Q.APla3:Geprint)      ! Field APla3:Geprint is a hot field or requires assignment from browse
  BRW12.AddField(APla3:Verwerkt,BRW12.Q.APla3:Verwerkt)    ! Field APla3:Verwerkt is a hot field or requires assignment from browse
  BRW12.AddField(APla3:Gewogen,BRW12.Q.APla3:Gewogen)      ! Field APla3:Gewogen is a hot field or requires assignment from browse
  BRW12.AddField(APla3:CelOms,BRW12.Q.APla3:CelOms)        ! Field APla3:CelOms is a hot field or requires assignment from browse
  BRW12.AddField(LOC:Locatienaam,BRW12.Q.LOC:Locatienaam)  ! Field LOC:Locatienaam is a hot field or requires assignment from browse
  BRW12.AddField(APla3:HerkomstOverboekingCelOms,BRW12.Q.APla3:HerkomstOverboekingCelOms) ! Field APla3:HerkomstOverboekingCelOms is a hot field or requires assignment from browse
  BRW12.AddField(APla3:LeverancierFirmaNaam,BRW12.Q.APla3:LeverancierFirmaNaam) ! Field APla3:LeverancierFirmaNaam is a hot field or requires assignment from browse
  BRW12.AddField(APla3:Transport,BRW12.Q.APla3:Transport)  ! Field APla3:Transport is a hot field or requires assignment from browse
  BRW12.AddField(APla3:PlanningID,BRW12.Q.APla3:PlanningID) ! Field APla3:PlanningID is a hot field or requires assignment from browse
  BRW12.AddField(APla3:VerkoopID,BRW12.Q.APla3:VerkoopID)  ! Field APla3:VerkoopID is a hot field or requires assignment from browse
  BRW12.AddField(APla3:CelID,BRW12.Q.APla3:CelID)          ! Field APla3:CelID is a hot field or requires assignment from browse
  BRW12.AddField(APla3:MutatieKG,BRW12.Q.APla3:MutatieKG)  ! Field APla3:MutatieKG is a hot field or requires assignment from browse
  BRW12.AddField(LOC:Getransferd,BRW12.Q.LOC:Getransferd)  ! Field LOC:Getransferd is a hot field or requires assignment from browse
  BRW12.AddField(APla3:KG,BRW12.Q.APla3:KG)                ! Field APla3:KG is a hot field or requires assignment from browse
  BRW12.AddField(APla3:Pallets,BRW12.Q.APla3:Pallets)      ! Field APla3:Pallets is a hot field or requires assignment from browse
  BRW12.AddField(APla3:MutatiePallets,BRW12.Q.APla3:MutatiePallets) ! Field APla3:MutatiePallets is a hot field or requires assignment from browse
  BRW12.AddField(APla3:Planning,BRW12.Q.APla3:Planning)    ! Field APla3:Planning is a hot field or requires assignment from browse
  BRW11.Q &= Queue:Browse:6
  BRW11.AddSortOrder(,ACT:FK2_Activiteit)                  ! Add the sort order for ACT:FK2_Activiteit for sort order 1
  BRW11.SetFilter('(ACT:DatumTijd >= LOC:DatumVanSQL AND ACT:DatumTijd << Loc:DatumTotSQL)') ! Apply filter expression to browse
  ?List{PROP:IconList,1} = '~off.ico'
  ?List{PROP:IconList,2} = '~on.ico'
  BRW11.AddField(ACT:Datum,BRW11.Q.ACT:Datum)              ! Field ACT:Datum is a hot field or requires assignment from browse
  BRW11.AddField(ACT:Tijd,BRW11.Q.ACT:Tijd)                ! Field ACT:Tijd is a hot field or requires assignment from browse
  BRW11.AddField(ACT:Uitgevoerd,BRW11.Q.ACT:Uitgevoerd)    ! Field ACT:Uitgevoerd is a hot field or requires assignment from browse
  BRW11.AddField(ACT:Omschrijving,BRW11.Q.ACT:Omschrijving) ! Field ACT:Omschrijving is a hot field or requires assignment from browse
  BRW11.AddField(AAPla3:ArtikelID,BRW11.Q.AAPla3:ArtikelID) ! Field AAPla3:ArtikelID is a hot field or requires assignment from browse
  BRW11.AddField(AAPla3:ArtikelOms,BRW11.Q.AAPla3:ArtikelOms) ! Field AAPla3:ArtikelOms is a hot field or requires assignment from browse
  BRW11.AddField(AAPla3:FirmaNaam,BRW11.Q.AAPla3:FirmaNaam) ! Field AAPla3:FirmaNaam is a hot field or requires assignment from browse
  BRW11.AddField(AAPla3:PartijID,BRW11.Q.AAPla3:PartijID)  ! Field AAPla3:PartijID is a hot field or requires assignment from browse
  BRW11.AddField(AAPla3:ExternPartijnr,BRW11.Q.AAPla3:ExternPartijnr) ! Field AAPla3:ExternPartijnr is a hot field or requires assignment from browse
  BRW11.AddField(LOC:VerkoopKG3,BRW11.Q.LOC:VerkoopKG3)    ! Field LOC:VerkoopKG3 is a hot field or requires assignment from browse
  BRW11.AddField(AAPla3:Planning_TIME,BRW11.Q.AAPla3:Planning_TIME) ! Field AAPla3:Planning_TIME is a hot field or requires assignment from browse
  BRW11.AddField(AAPla3:Planning_DATE,BRW11.Q.AAPla3:Planning_DATE) ! Field AAPla3:Planning_DATE is a hot field or requires assignment from browse
  BRW11.AddField(AAPla3:Instructie,BRW11.Q.AAPla3:Instructie) ! Field AAPla3:Instructie is a hot field or requires assignment from browse
  BRW11.AddField(AAPla3:VerpakkingOmschrijving,BRW11.Q.AAPla3:VerpakkingOmschrijving) ! Field AAPla3:VerpakkingOmschrijving is a hot field or requires assignment from browse
  BRW11.AddField(LOC:VerkoopPallets3,BRW11.Q.LOC:VerkoopPallets3) ! Field LOC:VerkoopPallets3 is a hot field or requires assignment from browse
  BRW11.AddField(AAPla3:MutatieGemaakt,BRW11.Q.AAPla3:MutatieGemaakt) ! Field AAPla3:MutatieGemaakt is a hot field or requires assignment from browse
  BRW11.AddField(AAPla3:Geprint,BRW11.Q.AAPla3:Geprint)    ! Field AAPla3:Geprint is a hot field or requires assignment from browse
  BRW11.AddField(AAPla3:Verwerkt,BRW11.Q.AAPla3:Verwerkt)  ! Field AAPla3:Verwerkt is a hot field or requires assignment from browse
  BRW11.AddField(AAPla3:Gewogen,BRW11.Q.AAPla3:Gewogen)    ! Field AAPla3:Gewogen is a hot field or requires assignment from browse
  BRW11.AddField(AAPla3:CelOms,BRW11.Q.AAPla3:CelOms)      ! Field AAPla3:CelOms is a hot field or requires assignment from browse
  BRW11.AddField(LOC:Locatienaam3,BRW11.Q.LOC:Locatienaam3) ! Field LOC:Locatienaam3 is a hot field or requires assignment from browse
  BRW11.AddField(AAPla3:LeverancierFirmaNaam,BRW11.Q.AAPla3:LeverancierFirmaNaam) ! Field AAPla3:LeverancierFirmaNaam is a hot field or requires assignment from browse
  BRW11.AddField(AAPla3:Transport,BRW11.Q.AAPla3:Transport) ! Field AAPla3:Transport is a hot field or requires assignment from browse
  BRW11.AddField(AAPla3:PlanningID,BRW11.Q.AAPla3:PlanningID) ! Field AAPla3:PlanningID is a hot field or requires assignment from browse
  BRW11.AddField(AAPla3:MutatieKG,BRW11.Q.AAPla3:MutatieKG) ! Field AAPla3:MutatieKG is a hot field or requires assignment from browse
  BRW11.AddField(AAPla3:MutatiePallets,BRW11.Q.AAPla3:MutatiePallets) ! Field AAPla3:MutatiePallets is a hot field or requires assignment from browse
  BRW11.AddField(AAPla3:KG,BRW11.Q.AAPla3:KG)              ! Field AAPla3:KG is a hot field or requires assignment from browse
  BRW11.AddField(AAPla3:Pallets,BRW11.Q.AAPla3:Pallets)    ! Field AAPla3:Pallets is a hot field or requires assignment from browse
  BRW11.AddField(ACT:ActiviteitID,BRW11.Q.ACT:ActiviteitID) ! Field ACT:ActiviteitID is a hot field or requires assignment from browse
  BRW11.AddField(ACT:DatumTijd,BRW11.Q.ACT:DatumTijd)      ! Field ACT:DatumTijd is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Resize,Resize:SetMinSize)       ! Controls will change size as the window gets bigger
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  BRW11.AskProcedure = 4                                   ! Will call: UpdateActiviteit((LOC:DatumNu))
  BRW12.AddToolbarTarget(Toolbar)                          ! Browse accepts toolbar control
  BRW11.AddToolbarTarget(Toolbar)                          ! Browse accepts toolbar control
  SELF.SetAlerts()
  NetLocalRefreshDate = today()         ! NetTalk (NetRefresh)
  NetLocalRefreshTime = clock()
  Loc:DatumNu = TODAY()
  LOC:DatumNuLast = 0
  
  DO ConvertDatum
  SELF.Reset(1)
  		
  EnterByTabManager.Init(False)
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  FLUSH(PlanningInkoop)
  FLUSH(PlanningVerkoop)
  FLUSH(PlanningOverboeking)
  FLUSH(APlanningInkoop)
  FLUSH(APlanningVerkoop)
  FLUSH(APlanningOverboeking)
  
  GLO:Planning_ThreadID = 0
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:AMutatie.Close
    Relate:APlanning.Close
    Relate:APlanningInkoop.Close
    Relate:APlanningOverboeking.Close
    Relate:APlanningVerkoop.Close
    Relate:Activiteit.Close
    Relate:BulkOverboeking.Close
    Relate:CelLocatie.Close
    Relate:Inkoop.Close
    Relate:Mutatie.Close
    Relate:OverboekingRit.Close
    Relate:Partij.Close
    Relate:PlanningInkoop.Close
    Relate:PlanningOverboeking.Close
    Relate:PlanningVerkoop.Close
    Relate:Sjabloon.Close
    Relate:ViewPartijCelLocaties.Close
    Relate:ViewVoorraadCelTotaal.Close
    Relate:ViewVoorraadPartij.Close
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.Reset PROCEDURE(BYTE Force=0)

  CODE
  		FREE(GetransferdQueue)
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
    ReturnValue = RequestCancelled                         ! Always return RequestCancelled if the form was opened in ViewRecord mode
  ELSE
    GlobalRequest = Request
    EXECUTE Number
      UpdateActiviteit((LOC:DatumNu))
      UpdateActiviteit((LOC:DatumNu))
      UpdateActiviteit((LOC:DatumNu))
      UpdateActiviteit((LOC:DatumNu))
    END
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
    OF ?InkoopInslag
      !Get(BRW6.Q,Choice(?VerkoopList))
      !IF NOT ERROR()
      !	ThisWIndow.GetMutatie(Brw6.Q.Pla2:PlanningID,'Inslag')
      !END	
      
      db.DebugOut('INSLAG DOEN1 ' & APla:PartijID)
      
      ! Planningrecord inlezen
      Get(BRW6.Q,Choice(?InkoopList))
      APla:PlanningID = BRW6.Q.Pla2:PlanningID
      IF Access:APlanning.Fetch(APla:PK_Planning)
        Message('Planning regel kan niet ingelezen worden','Fout',Icon:Hand)
        CYCLE
      END
      
      IF APla:Verwerkt = TRUE
        Message('Planning regel is verwerkt','Waarschuwing',Icon:Hand)
        CYCLE
      END
      
      GLO:GebruikerLogHandelingOpmerking = 'InkoopInslaan'
      
      CLEAR(Par:Record)
      Par:PartijID = APla:PartijID
      IF Access:Partij.TryFetch(Par:Partij_PK) = Level:Benign
      	db.DebugOut('INSLAG DOEN2a ' & APla:PartijID)
      	GlobalRequest = ChangeRecord
      	
      	IF(APla:Gewogen)
      		WindowInslagWeging()
      	ELSE
      		WindowInslag()
      	END
      
          IF GlobalResponse = RequestCompleted
              Clear(APla:REcord)
              APla:PlanningID = BRW6.Q.Pla2:PlanningID
              IF Access:APlanning.Fetch(APla:PK_Planning)
                  Message('Planning regel kan niet ingelezen worden','Fout',Icon:Hand)
              END
      		APla:MutatieGemaakt = TRUE
      		Access:APlanning.Update()
      	END
      ELSE
      	db.DebugOut('INSLAG DOEN2b ' & APla:PartijID)
      	GlobalRequest = InsertRecord
      	WindowInslag()
      
      	IF GlobalResponse = RequestCompleted
              Clear(APla:REcord)
              APla:PlanningID = BRW6.Q.Pla2:PlanningID
              IF Access:APlanning.Fetch(APla:PK_Planning)
                  Message('Planning regel kan niet ingelezen worden','Fout',Icon:Hand)
              END
      		APla:MutatieGemaakt = TRUE
      		APla:PartijID = Par:PartijID
      		Access:APlanning.Update()
      	END
      END
      
      GLO:GebruikerLogHandelingOpmerking = ''
      DO RefreshWindow      
    OF ?InkoopPrint
              ! Planningrecord inlezen
      		Get(BRW6.Q,Choice(?InkoopList))
      		Pla:PlanningID = BRW6.Q.Pla2:PlanningID
      		IF Access:Planning.Fetch(Pla:PK_Planning)
      			Message('Planning regel kan niet ingelezen worden','Fout',Icon:Hand)
      			CYCLE
      		Else
      			if Pla:PartijID = 0
      				Message('Deze partij is nog niet ingeslagen','Fout',Icon:Hand)
      				Cycle
      			End
      			Clear(PAR:Record)
      			Par:PartijID = Pla:PartijID
      			IF Access:Partij.Fetch(Par:Partij_PK)
      				Message('Partij '&Pla:PartijID&' kan niet gevonden worden ','Fout',Icon:Hand)
      				cycle
      			End	
      		END
      
      		aantalpallets# = ReportPalletStickers()
      		IF GlobalResponse = RequestCompleted			
      			Clear(Par:Record)
      			Par:PartijID = Pla:PartijID
      			IF NOT(Access:Partij.Fetch(Par:Partij_PK))
      				Par:PalletsGeprint=Par:PalletsGeprint+aantalpallets#
      				Access:Partij.Update()
      			ELSE
      				Message('Partij '&Pla:PartijID&' kan niet gevonden worden ','Fout',Icon:Hand)
      			.
      			Pla:Geprint = TRUE
      			Access:Planning.Update()
      			!BRW6.ResetQueue(false)
      			!BRW3.ResetQueue(false)
      		END
    OF ?InkoopVerwerk
      db.DebugOut('INSLAG DOEN1 ' & APla:PartijID)
      
      ! Planningrecord inlezen
      Get(BRW6.Q,Choice(?InkoopList))
      APla:PlanningID = BRW6.Q.Pla2:PlanningID
      IF Access:APlanning.Fetch(APla:PK_Planning)
        Message('Planning regel kan niet ingelezen worden','Fout',Icon:Hand)
        CYCLE
      END
      
      IF APla:Verwerkt = TRUE
        Message('Planning regel is verwerkt','Fout',Icon:Hand)
        CYCLE
      END
      
      CLEAR(Par:Record)
      Par:PartijID = APla:PartijID
      IF Access:Partij.TryFetch(Par:Partij_PK) = Level:Benign
      	db.DebugOut('INSLAG DOEN2a ' & APla:PartijID)
      	GlobalRequest = ChangeRecord
      	IF APla:Gewogen THEN
              GLO:GebruikerLogHandelingOpmerking = 'InkoopVerwerktWeging'
      		WindowInslagWeging()
          ELSE
              GLO:GebruikerLogHandelingOpmerking = 'InkoopVerwerkt'
      		WindowInslag()
      	END
      
      	IF GlobalResponse = RequestCompleted
              ! Planningrecord inlezen
      			
      		!GlobalRequest = ChangeRecord
      		!UpdateInslag
      		!IF GlobalResponse = RequestCompleted
      			
      		APla:MutatieGemaakt = TRUE
      		APla:Verwerkt = TRUE
      		Access:APlanning.Update()
      		
      		!ReportInslag
      
      		CLEAR(Pla:Record)
      		Pla:PlanningID=BRW6.Q.Pla2:PlanningID
      		IF (Access:Planning.TryFetch(Pla:PK_Planning) = Level:Benign)
      			DO UpdateInkoopVerkoopVerwerkStatus
      		.
      		
      		!BRW6.ResetQueue(false)
      	END
      ELSE
      	MESSAGE('Planning regel is nog niet ingeslagen|Er bestaat nog geen partij')
      END
      
      GLO:GebruikerLogHandelingOpmerking = ''
      DO RefreshWindow
    OF ?VerkoopVerwerkt
      		Get(BRW1.Q,Choice(?VerkoopList))
      		IF NOT ERROR()
      			ThisWindow.GetMutatie(Brw1.Q.Pla3:PlanningID,'VerwerkUitslag')
      		END	
    OF ?VerkoopPrintCMR
          Loc:RegelNu1 = Choice(?VerkoopList)
          Get(BRW1.Q, Choice(?VerkoopList))
          db.DebugOut('CMR-planningID:' & BRW1.Q.Pla3:PlanningID)
      	APla:PlanningID=BRW1.Q.Pla3:PlanningID
      	IF Access:APlanning.TryFetch(APla:PK_Planning) <> Level:Benign
      		Message('Planningregel kan niet ingelezen worden','Fout',Icon:Hand)
      		CYCLE
      	END
    OF ?VerkoopUitslag
      		Get(BRW1.Q,Choice(?VerkoopList))
      		IF NOT ERROR()
      			ThisWindow.GetMutatie(Brw1.Q.Pla3:PlanningID,'Uitslag')
      		END	
    OF ?OverboekDoen
      	Get(BRW8.Q,Choice(?OverboekList))
      	Pla:PlanningID = BRW8.Q.Pla4:PlanningID
      	IF Access:Planning.Fetch(Pla:PK_Planning)
      		Message('Planning regel kan niet ingelezen worden','Fout',Icon:Hand)
      		CYCLE
      	END
      
      	IF Pla:Verwerkt = TRUE
      		Message('Planning-uitslag regel is reeds verwerkt ','Fout',Icon:Hand)
      		CYCLE
      	END
      
      	GLO:GebruikerLogHandelingOpmerking = 'OverboekDoen'
      
      	db.DebugOut('OverboekDoen - Zoeken mutatie ' & Pla:PlanningID)
      	mutatieID# = 0
      	CLEAR(Mut:Record)
      	Mut:PlanningID = Pla:PlanningID
      	SET(Mut:Mutatie_FK02, Mut:Mutatie_FK02)
      	LOOP UNTIL Access:Mutatie.Next()
      		IF Mut:PlanningID <> Pla:PlanningID THEN BREAK.
      		
      		IF Mut:SoortMutatie = 'OUIT' THEN
      			db.DebugOut('OverboekDoen - Zoeken mutatie - Gevonden ' & Mut:MutatieID)
      			mutatieID# = Mut:MutatieID
      			BREAK
      		.
      	.
      
      	CLEAR(Mut:Record)
      	Mut:MutatieID=mutatieID#
      	IF (mutatieID# = 0 OR Access:Mutatie.TryFetch(Mut:Mutatie_PK) <> Level:Benign)
      		Clear(Mut:Record)
      		Mut:ArtikelID = Pla:ArtikelID
      		Mut:UitslagKG = Pla:KG
      		Mut:UitslagPallet = Pla:Pallets
      		Mut:CelID = Pla:CelID
      		Mut:PlanningID = Pla:PlanningID
      
      		GlobalRequest = InsertRecord
      		db.DebugOut('OverboekDoen - Insert - UpdateOverboekMutatie')
      		UpdateOverboekMutatie
      	ELSE
      		GlobalRequest = ChangeRecord
      		db.DebugOut('OverboekDoen - Change - UpdateOverboekMutatie')		
      		UpdateOverboekMutatie
      	END
      	
      	IF GlobalResponse = RequestCompleted
      		Pla:MutatieGemaakt = TRUE
      		Access:Planning.Update()
      		
      		VoorraadClass.VerwerkGekoppeldeVerkoop(Pla:PlanningID, Pla:OverboekingPlanningID, Mut:NaarCelID)
      		!BRW8.ResetQueue(true)
      	END		
      
      	GLO:GebruikerLogHandelingOpmerking = ''
      DO RefreshWindow
    OF ?VerkoopHVerwerkt
      		Get(BRW1.Q,Choice(?VerkoopList))
      		IF NOT ERROR()
      			ThisWIndow.GetMutatie(Brw1.Q.Pla3:PlanningID,'VerwerkHandUitslag')
      		END	
    OF ?TransferInkoopButton
      BrowseTransfers(LOC:DatumNU)
      
      !BRW6.ResetQueue(false)
      
      	  DO RefreshWindow
    OF ?UitslagWeging
      		Get(BRW1.Q,Choice(?VerkoopList))
      		IF NOT ERROR()
      			ThisWindow.GetMutatie(Brw1.Q.Pla3:PlanningID,'UitslagWeging')
      		END	
      
         
    OF ?InslagWeging
      db.DebugOut('INSLAG DOEN1 ' & APla:PartijID)
      
      ! Planningrecord inlezen
      Get(BRW6.Q,Choice(?InkoopList))
      APla:PlanningID = BRW6.Q.Pla2:PlanningID
      IF Access:APlanning.Fetch(APla:PK_Planning)
        Message('Planning regel kan niet ingelezen worden','Fout',Icon:Hand)
        CYCLE
      END
      
      IF APla:Verwerkt = TRUE
        Message('Planning regel is verwerkt','Fout',Icon:Hand)
        CYCLE
      END
      
      GLO:GebruikerLogHandelingOpmerking = 'InkoopWeging'
      
      CLEAR(Par:Record)
      Par:PartijID = APla:PartijID
      IF Access:Partij.TryFetch(Par:Partij_PK) = Level:Benign
      	db.DebugOut('INSLAG DOEN2a ' & APla:PartijID)
      	GlobalRequest = ChangeRecord
      	WindowInslagWeging()
      
          IF GlobalResponse = RequestCompleted
              GLO:GebruikerLogHandelingOpmerking = 'RequestCompleted - WindowInslagWeging()'
                  ! 2017-10-4 Hier de planning opnieuw inlezen omdat deze door de Weging aangepast is en weggeschreven is
                  ! Maar als we nu alleen één veld willen aanpassen hij de hele oude buffer laat zien????
                  Clear(APla:Record)
                  APla:PlanningID=BRW6.Q.Pla2:PlanningID
                  IF Access:APlanning.Fetch(APla:PK_Planning) <> Level:Benign
                      Message('APlanning-inslag regel kan niet opnieuw ingelezen worden','Fout',Icon:Hand)
                  END
      		APla:MutatieGemaakt = TRUE
      		APla:Gewogen = true		
      		Access:APlanning.Update()
      	END
      ELSE
      	db.DebugOut('INSLAG DOEN2b ' & APla:PartijID)
      	GlobalRequest = InsertRecord
      	WindowInslagWeging()
      
          IF GlobalResponse = RequestCompleted
              GLO:GebruikerLogHandelingOpmerking = 'RequestCompleted - WindowInslagWeging()'
                  ! 2017-10-4 Hier de planning opnieuw inlezen omdat deze door de Weging aangepast is en weggeschreven is
                  ! Maar als we nu alleen één veld willen aanpassen hij de hele oude buffer laat zien????
                  Clear(APla:Record)
                  APla:PlanningID=BRW6.Q.Pla2:PlanningID
                  IF Access:APlanning.Fetch(APla:PK_Planning) <> Level:Benign
                      Message('APlanning-inslag regel kan niet opnieuw ingelezen worden','Fout',Icon:Hand)
                  END
      		APla:MutatieGemaakt = TRUE
      		APla:PartijID = Par:PartijID
      		APla:Gewogen = true
      		Access:APlanning.Update()
      	END
      END
      
      GLO:GebruikerLogHandelingOpmerking = ''
      DO RefreshWindow
    OF ?WeeglijstInkoop
      GET(BRW6.Q, CHOICE(?InkoopList))
      ReportWeeglijst('Inkoop', BRW6.Q.Pla2:InkoopID)
    OF ?WeeglijstExcelInkoop
      GET(BRW6.Q, CHOICE(?InkoopList))
      ReportWeeglijstExcel('Inkoop', BRW6.Q.Pla2:InkoopID)
    OF ?WeeglijstExcelVerkoop
      GET(BRW1.Q, CHOICE(?VerkoopList))
      ReportWeeglijstExcel('Verkoop', BRW1.Q.PLA3:VerkoopID)
    OF ?WeeglijstVerkoop
      GET(BRW1.Q, CHOICE(?VerkoopList))
      ReportWeeglijst('Verkoop', BRW1.Q.PLA3:VerkoopID)
    OF ?PrintUitslagRapport
      Get(BRW1.Q,Choice(?VerkoopList))
      ThisWindow.UitslagReport(BRW1.Q.Pla3:PlanningID)
    OF ?VerkoopPrintPalletblad
      Get(BRW1.Q, Choice(?VerkoopList))
      IF NOT(ERROR()) THEN
          ThisWindow.GetMutatie(Brw1.Q.Pla3:PlanningID,'UitslagWeging_PalletBlad')
      END    
    OF ?PrintVerkoopStickers
      ! Planningrecord inlezen
      Get(BRW1.Q, Choice(?VerkoopList))
      db.DebugOut('Print palletstickers:' & BRW1.Q.Pla3:PartijID)
      CLEAR(Par:Record)
      Par:PartijID = BRW1.Q.Pla3:PartijID
      IF NOT(Access:Partij.TryFetch(Par:Partij_PK) = Level:Benign)
      	Message('Partij kan niet gevonden worden','Fout',Icon:Hand)
      	CYCLE
      END
      
      aantalpallets# = ReportPalletStickers()
      IF GlobalResponse = RequestCompleted
      	IF NOT(Access:Partij.Fetch(Par:Partij_PK))
      		Par:PalletsGeprint=Par:PalletsGeprint+aantalpallets#
      		Access:Partij.Update()
      	.
      END
      
      DO RefreshWindow
    OF ?VerkoopPalletbladExport
      Get(BRW1.Q, Choice(?VerkoopList))
      IF NOT(ERROR()) THEN
          ThisWindow.GetMutatie(Brw1.Q.Pla3:PlanningID,'UitslagWeging_PalletBlad_Export')
      END
    OF ?InkoopPrint2
                        		! Planningrecord inlezen
      		Get(BRW3.Q,Choice(?InkoopList2))
      		Pla:PlanningID = BRW3.Q.APla2:PlanningID
      		IF Access:Planning.Fetch(Pla:PK_Planning)
      			Message('Planning regel kan niet ingelezen worden','Fout',Icon:Hand)
      			CYCLE
      		Else
      			if Pla:PartijID = 0
      				Message('Deze partij is nog niet ingeslagen','Fout',Icon:Hand)
      				Cycle
      			End
      			Clear(PAR:Record)
      			Par:PartijID = Pla:PartijID
      			IF Access:Partij.Fetch(Par:Partij_PK)
      				Message('Partij '&Pla:PartijID&' kan niet gevonden worden ','Fout',Icon:Hand)
      				cycle
      			End	
      		END
      
      		aantalpallets# = ReportPalletStickers()
      		IF GlobalResponse = RequestCompleted
      			Clear(Par:Record)
      			Par:PartijID = Pla:PartijID
      			IF NOT(Access:Partij.Fetch(Par:Partij_PK))
      				Par:PalletsGeprint=Par:PalletsGeprint+aantalpallets#
      				Access:Partij.Update()
      			ELSE
      				Message('Partij '&Pla:PartijID&' kan niet gevonden worden ','Fout',Icon:Hand)
      			.
      			Pla:Geprint = TRUE
      			Access:Planning.Update()
      			!BRW3.ResetQueue(false)
      			!BRW6.ResetQueue(false)
      		END
    OF ?TransferButton2
      BrowseTransfers(LOC:DatumNU)
      
      !BRW3.ResetQueue(false)
      
      	  DO RefreshWindow      
    OF ?Weeglijst2
      GET(BRW3.Q, CHOICE(?InkoopList2))
      ReportWeeglijst('Inkoop', BRW3.Q.APla2:InkoopID)
    OF ?WeeglijstExcel2
      GET(BRW3.Q, CHOICE(?InkoopList2))
      ReportWeeglijstExcel('Inkoop', BRW3.Q.APla2:InkoopID)
    OF ?InslagRapportButton2
      Get(BRW3.Q,Choice(?InkoopList2))
      ThisWindow.InslagReport(BRW3.Q.APla2:PlanningID)
    OF ?InkoopTerugdraaien2
      GLO:GebruikerLogHandelingOpmerking = 'InkoopTerugdraaien'
      ThisWindow.HandleButton('Terugdraaien', 'INK', 1)
      GLO:GebruikerLogHandelingOpmerking = ''
    OF ?OverboekDoen3
      	Get(BRW9.Q,Choice(?OverboekList2))
      	Pla:PlanningID = BRW9.Q.APla4:PlanningID
      	IF Access:Planning.Fetch(Pla:PK_Planning)
      		Message('Planning regel kan niet ingelezen worden','Fout',Icon:Hand)
      		CYCLE
      	END
      
      	IF Pla:Verwerkt = TRUE
      		Message('Planning-uitslag regel is reeds verwerkt ','Fout',Icon:Hand)
      		CYCLE
      	END
      
      	GLO:GebruikerLogHandelingOpmerking = 'OverboekDoen'
      
      	mutatieID# = 0
      	CLEAR(Mut:Record)
      	Mut:PlanningID = Pla:PlanningID
      	SET(Mut:Mutatie_FK02, Mut:Mutatie_FK02)
      	LOOP
      		Access:Mutatie.Next()
      		IF ERROR() THEN BREAK.
      		IF Mut:PlanningID <> Pla:PlanningID THEN BREAK.
      		
      		IF Mut:SoortMutatie = 'OUIT' THEN
      			mutatieID# = Mut:MutatieID
      			BREAK
      		.
      	.
      
      	CLEAR(Mut:Record)
      	Mut:MutatieID=mutatieID#
      	IF (mutatieID# = 0 or Access:Mutatie.TryFetch(Mut:Mutatie_PK) <> Level:Benign)
      		Clear(Mut:Record)
      		Mut:ArtikelID = Pla:ArtikelID
      		Mut:UitslagKG= Pla:KG
      		Mut:UitslagPallet = Pla:Pallets
      		Mut:CelID = Pla:CelID
      		Mut:PlanningID = Pla:PlanningID
      
      		GlobalRequest = InsertRecord
      		UpdateOverboekMutatie
      	ELSE
      		GlobalRequest = ChangeRecord
      		UpdateOverboekMutatie
      	END
      	
      	IF GlobalResponse = RequestCompleted
      		Pla:MutatieGemaakt = TRUE
      		Access:Planning.Update()
      		
      		VoorraadClass.VerwerkGekoppeldeVerkoop(Pla:PlanningID, Pla:OverboekingPlanningID, Mut:NaarCelID)
      			
      		!BRW9.ResetQueue(true)
      	END
      
      	GLO:GebruikerLogHandelingOpmerking = ''
      
      DO RefreshWindow      
    OF ?OverboekSjabloon3
      	Get(BRW9.Q,Choice(?OverboekList2))
      	IF ERROR() THEN
      		MESSAGE('Geen overboeking geselecteerd')
      		RETURN ReturnValue
      	.
      
      	APla:PlanningID = BRW9.Q.APla4:PlanningID
      	IF Access:APlanning.TryFetch(APla:PK_Planning) <> Level:Benign THEN
      		MESSAGE('Geen overboeking geselecteerd')
      		RETURN ReturnValue
      	.
      
      	ReportOverboeking(APla:PlanningID)
    OF ?OverboekTransfers3
      BrowseTransfers(LOC:DatumNU)
      
      !BRW9.ResetQueue(false)
      
      DO RefreshWindow     
    OF ?VerkoopSjabloon4
       Get(BRW12.Q,Choice(?VerkoopList:2))
      IF ERROR() THEN
      	MESSAGE('Geen verkoop geselecteerd')
      	RETURN ReturnValue
      .
      
       Ver2:VerkoopID = BRW12.Q.APla3:VerkoopID
      IF Access:Verkoop.TryFetch(Ver2:PK_Verkoop) <> Level:Benign THEN
      	MESSAGE('Geen verkoop geselecteerd')
      	RETURN ReturnValue
      .
      
      WindowCallSjabloon('VerkoopMutaties', Ver2:VerkoopID)
    OF ?VerkoopUitslag4
          ! Planningrecord inlezen
      	Get(BRW12.Q,Choice(?VerkoopList:2))
      	IF NOT ERROR()
      		ThisWindow.GetMutatie(Brw12.Q.APla3:PlanningID,'Uitslag')
          END	
      
      !Loc:RegelNu2 = Choice(?VerkoopList:2)
      !Get(BRW12.Q,Choice(?VerkoopList:2))
      !Pla:PlanningID = BRW12.Q.APla3:PlanningID
      !IF Access:Planning.Fetch(Pla:PK_Planning)
      !    Message('Planning-uitslag regel kan niet ingelezen worden','Fout',Icon:Hand)
      !    CYCLE
      !END
      !
      
      !
      !IF	Pla:Verwerkt = TRUE			
      !    Message('Planning-uitslag regel is reeds verwerkt ','Fout',Icon:Hand)
      !    CYCLE
      !END
      !
      !mutatieID# = 0
      !CLEAR(Mut:Record)
      !Mut:PlanningID = Pla:PlanningID
      !SET(Mut:Mutatie_FK02, Mut:Mutatie_FK02)
      !LOOP
      !    Access:Mutatie.Next()
      !    IF ERROR() THEN BREAK.
      !    IF Mut:PlanningID <> Pla:PlanningID THEN BREAK.
      !		
      !    IF Mut:SoortMutatie = 'UIT' THEN
      !        mutatieID# = Mut:MutatieID
      !        BREAK
      !    .
      !.
      !
      !CLEAR(Mut:Record)
      !Mut:MutatieID=mutatieID#
      !IF (mutatieID# = 0 or Access:Mutatie.TryFetch(Mut:Mutatie_PK) <> Level:Benign)
      !    Clear(Mut:Record)
      !    Mut:ArtikelID = Pla:ArtikelID
      !    Mut:UitslagKG= Pla:KG
      !    Mut:UitslagPallet = Pla:Pallets
      !    Mut:CelID = Pla:CelID
      !    Mut:PlanningID = Pla:PlanningID
      !    Clear(Ver2:Record)
      !    Ver2:VerkoopID = Pla:VerkoopID
      !    Access:Verkoop.Fetch(Ver2:PK_Verkoop)
      !		! Hier moet ik de klant eigenlijk ophalen 
      !
      !    db.DebugOut('UpdateUitslagMutatie-InsertRecord')
      !		
      !    GlobalRequest = InsertRecord
      !    UpdateUitslagMutatie
      !ELSE
      !    Clear(Ver2:Record)
      !    Ver2:VerkoopID = Pla:VerkoopID
      !    Access:Verkoop.Fetch(Ver2:PK_Verkoop)
      !		! Hier moet ik de klant eigenlijk ophalen 
      !		
      !    db.DebugOut('UpdateUitslagMutatie-ChangeRecord')
      !
      !    GlobalRequest = ChangeRecord
      !    UpdateUitslagMutatie
      !END
      !	
      !IF GlobalResponse = RequestCompleted
      !    Pla:PlanningID = BRW12.Q.APla3:PlanningID
      !    IF Access:Planning.Fetch(Pla:PK_Planning)
      !        Message('Planning-uitslag regel kan niet terug ingelezen worden','Fout',Icon:Hand)
      !    ELSE
      !        
      !        Pla:MutatieGemaakt = TRUE
      !        Access:Planning.Update()
      !    END
      !        
      !END
    OF ?VerkoopPrintCMR4
          Loc:RegelNu2 = Choice(?VerkoopList:2)
       	     Get(BRW12.Q, Choice(?VerkoopList:2))
         ! db.DebugOut('CMR-planningID:' & BRW10.Q.APla3:PlanningID)
       	APla:PlanningID=BRW12.Q.APla3:PlanningID
      	IF Access:APlanning.TryFetch(APla:PK_Planning) <> Level:Benign
      		Message('Planningregel kan niet ingelezen worden','Fout',Icon:Hand)
      		CYCLE
      	END
      
      	ReportCMR(APla:PlanningID)
    OF ?VerkoopVerwerkt4
      		Get(BRW12.Q,Choice(?VerkoopList:2))
      		IF NOT ERROR()
      			ThisWindow.GetMutatie(Brw12.Q.APla3:PlanningID,'VerwerkUitslag')
              END
    OF ?VerkoopHVerwerkt4
      	Get(BRW12.Q,Choice(?VerkoopList:2))
      	IF NOT ERROR()
      		ThisWIndow.GetMutatie(Brw12.Q.APla3:PlanningID,'VerwerkHandUitslag')
      	END	
      !  ! Planningrecord inlezen
      !  Loc:RegelNu2 = Choice(?VerkoopList:2)
      !	Get(BRW12.Q,Choice(?VerkoopList:2))
      !	Pla:PlanningID = BRW12.Q.APLA3:PlanningID
      !		IF Access:Planning.Fetch(Pla:PK_Planning)
      !			Message('Planning-uitslag regel kan niet ingelezen worden','Fout',Icon:Hand)
      !			CYCLE
      !		END
      !	IF	Pla:Verwerkt = TRUE			
      !		Message('Planning-uitslag regel is reeds verwerkt ','Fout',Icon:Hand)
      !			CYCLE
      !	END
      !
      !	!CLEAR(Cel:Record)
      !	!Cel:CelID = Pla:CelID
      !	!IF Access:Cel.TryFetch(CEL:CEL_PK) <> Level:Benign
      !	!	Message('Bij deze planning-uitslag regel is geen geldige cel geselecteerd.','Fout',Icon:Hand)
      !	!	CYCLE
      !	!END
      !
      !	CLEAR(Art:Record)
      !	Art:ArtikelID=Pla:ArtikelID
      !	IF Access:ViewArtikel.TryFetch(Art:Artikel_PK) <> Level:Benign
      !		MESSAGE('Bij deze planning-uitslag regel is geen geldig artikel geselecteerd.','Fout',Icon:Hand)
      !		CYCLE
      !	.
      !
      !	! Voorraad controleren
      !!	VVCT:CeliD = Pla:CelID
      !!	VVCT:ArtikelOms = Art:ArtikelOms
      !!	VVCT:ArtikelID = Art:ArtikelID
      !!	IF Access:ViewVoorraadCelTotaal.TryFetch(VVCT:ViewVoorraadCelTotaal_PK) = Level:Benign
      !		!IF VVCT:pallets < Pla:Pallets OR VVCT:kg < Pla:KG
      !!		IF VVCT:kg < Pla:KG
      !!			MESSAGE('Voor deze planning-uitslag regel is niet voldoende voorraad (' & VVCT:kg & ' kg) gevonden.','Fout',Icon:Hand)
      !!			CYCLE
      !!		.
      !!	ELSE
      !!		MESSAGE('Voor deze planning-uitslag regel is niet voldoende voorraad (0 kg / 0 pallets) gevonden.','Fout',Icon:Hand)
      !!		CYCLE
      !!	.
      !
      !		Clear(Mut:Record)
      !		Mut:ArtikelID = Pla:ArtikelID
      !		Mut:UitslagKG= Pla:KG
      !		Mut:UitslagPallet= Pla:Pallets
      !		!= Pla:VerpakkingID
      !		Mut:CelID = Pla:CelID
      !		Clear(Ver2:Record)
      !		Ver2:VerkoopID = Pla:VerkoopID
      !		Access:Verkoop.Fetch(Ver2:PK_Verkoop)
      !		! hier moet ik de klant eigenlijk ophalen 
      !
      !		!GlobalRequest = InsertRecord
      !		!UpdateUitslagMutatie
      !		Mut:DatumTijd_DATE=TODAY()
      !		Mut:DatumTijd_TIME=CLOCK()
      !		!Mut:PartijID=Pla:PartijID
      !		Mut:SoortMutatie='EUIT'
      !		Mut:PlanningID=Pla:PlanningID
      !
      !		IF NOT(Access:Mutatie.Insert() = Level:Benign)
      !			IF ERRORCODE() = 90 THEN
      !				MESSAGE('Mutatie-record kon niet worden aangemaakt | SQL Error('&FILEERRORCODE()&'):'&FILEERROR()&')')
      !			ELSE
      !				MESSAGE('Mutatie-record kon niet worden aangemaakt | Error('&ERRORCODE()&'):'&ERROR()&')')
      !			.
      !		ELSE
      !			Pla:Verwerkt = TRUE
      !			Pla:MutatieGemaakt = TRUE
      !			Access:Planning.Update()
      !			
      !			DO UpdateInkoopVerkoopVerwerkStatus
      !		END
    OF ?VerkoopUitslagWeging4
      		Get(BRW12.Q,Choice(?VerkoopList:2))
      		IF NOT ERROR()
      			ThisWindow.GetMutatie(Brw12.Q.APla3:PlanningID,'UitslagWeging')
              END	
      
      !    ! Planningrecord inlezen
      !    Loc:RegelNu2 = Choice(?VerkoopList:2)
      ! 	Get(BRW12.Q,Choice(?VerkoopList:2))
      !  	Pla:PlanningID = BRW12.Q.APla3:PlanningID
      !	IF Access:Planning.Fetch(Pla:PK_Planning)
      !		Message('Planning-uitslag regel kan niet ingelezen worden','Fout',Icon:Hand)
      !		CYCLE
      !	END
      !
      !	IF	Pla:Verwerkt = TRUE			
      !		Message('Planning-uitslag regel is reeds verwerkt ','Fout',Icon:Hand)
      !		CYCLE
      !	END
      !
      !	mutatieID# = 0
      !	CLEAR(Mut:Record)
      !	Mut:PlanningID = Pla:PlanningID
      !	SET(Mut:Mutatie_FK02, Mut:Mutatie_FK02)
      !	LOOP
      !		Access:Mutatie.Next()
      !		IF ERROR() THEN BREAK.
      !		IF Mut:PlanningID <> Pla:PlanningID THEN BREAK.
      !		
      !		IF Mut:SoortMutatie = 'UIT' THEN
      !			mutatieID# = Mut:MutatieID
      !			BREAK
      !		.
      !	.
      !
      !	CLEAR(Mut:Record)
      !	Mut:MutatieID=mutatieID#
      !	IF (mutatieID# = 0 or Access:Mutatie.TryFetch(Mut:Mutatie_PK) <> Level:Benign)
      !		Clear(Mut:Record)
      !		Mut:ArtikelID = Pla:ArtikelID
      !		Mut:UitslagKG= Pla:KG
      !		Mut:UitslagPallet = Pla:Pallets
      !		Mut:CelID = Pla:CelID
      !		Mut:PlanningID = Pla:PlanningID
      !		Clear(Ver2:Record)
      !		Ver2:VerkoopID = Pla:VerkoopID
      !		Access:Verkoop.Fetch(Ver2:PK_Verkoop)
      !		! Hier moet ik de klant eigenlijk ophalen 
      !
      !		db.DebugOut('UpdateUitslagMutatie-InsertRecord')
      !		
      !		GlobalRequest = InsertRecord
      !		UpdateUitslagMutatieWeging
      !	ELSE
      !		Clear(Ver2:Record)
      !		Ver2:VerkoopID = Pla:VerkoopID
      !		Access:Verkoop.Fetch(Ver2:PK_Verkoop)
      !		! Hier moet ik de klant eigenlijk ophalen 
      !		
      !		db.DebugOut('UpdateUitslagMutatie-ChangeRecord')
      !
      !		GlobalRequest = ChangeRecord
      !		UpdateUitslagMutatieWeging
      !	END
      !	
      !	IF GlobalResponse = RequestCompleted
      !		Pla:MutatieGemaakt = TRUE
      !		Pla:Gewogen = TRUE
      !		Access:Planning.Update()
      !			
      !		Post(EVENT:Accepted,?Morgen)
      !		Post(EVENT:Accepted,?Gister)
      !	END
    OF ?WeeglijstExcel4
      GET(BRW12.Q, CHOICE(?VerkoopList:2))
      ReportWeeglijstExcel('Verkoop', BRW12.Q.APla3:VerkoopID)
    OF ?UitslagRapport4
      Get(BRW12.Q,Choice(?VerkoopList:2))
      ThisWindow.UitslagReport(BRW12.Q.APla3:PlanningID)
    OF ?VerkoopPrintPalletblad:2
      Get(BRW12.Q, Choice(?VerkoopList:2))
      IF NOT(ERROR()) THEN
          ThisWindow.GetMutatie(Brw12.Q.APla3:PlanningID,'UitslagWeging_PalletBlad')
      END
    OF ?PrintVerkoopStickers:2
      ! Planningrecord inlezen
      Get(BRW1.Q, Choice(?VerkoopList:2))
      CLEAR(Par:Record)
      Par:PartijID = BRW12.Q.APla3:PartijID
      IF NOT(Access:Partij.TryFetch(Par:Partij_PK) = Level:Benign)
      	Message('Partij kan niet gevonden worden','Fout',Icon:Hand)
      	CYCLE
      END
      
      aantalpallets# = ReportPalletStickers()
      IF GlobalResponse = RequestCompleted
      	IF NOT(Access:Partij.Fetch(Par:Partij_PK))
      		Par:PalletsGeprint=Par:PalletsGeprint+aantalpallets#
      		Access:Partij.Update()
      	.
      END
      
      DO RefreshWindow
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?Calendar
      ThisWindow.Update()
      Calendar5.SelectOnClose = True
      Calendar5.Ask('Select a Date')
      IF Calendar5.Response = RequestCompleted THEN
      	LOC:DatumNu = Calendar5.SelectedDate
      	DISPLAY(?LOC:DatumNu)
      	DO ConvertDatum
      .
      IF Calendar5.Response = RequestCompleted THEN
      END
    OF ?InkoopHVerwerkt
      ThisWindow.Update()
          ! Planningrecord inlezen
      	Get(BRW6.Q,Choice(?InkoopList))
      	Pla:PlanningID = BRW6.Q.Pla2:PlanningID
      	IF Access:Planning.Fetch(Pla:PK_Planning)
      		Message('Planning-inslag regel kan niet ingelezen worden','Fout',Icon:Hand)
      		CYCLE
      	END
      
      	IF Pla:Verwerkt = TRUE
      		Message('Planning-inslag regel is reeds verwerkt ','Fout',Icon:Hand)
      		CYCLE
      	END
      
      	!CLEAR(Cel:Record)
      	!Cel:CelID = Pla:CelID
      	!IF Access:Cel.TryFetch(CEL:CEL_PK) <> Level:Benign
      	!	Message('Bij deze planning-inslag regel is geen geldige cel geselecteerd.','Fout',Icon:Hand)
      	!	CYCLE
      	!END
      
      	CLEAR(Art:Record)
      	Art:ArtikelID=Pla:ArtikelID
      	IF Access:ViewArtikel.TryFetch(Art:Artikel_PK) <> Level:Benign
      		MESSAGE('Bij deze planning-inslag regel is geen geldig artikel geselecteerd.','Fout',Icon:Hand)
      		CYCLE
      	.
      
      	GLO:GebruikerLogHandelingOpmerking = 'InkoopHVerwerkt'
      
      	Clear(Mut:Record)
      	Access:Mutatie.PrimeRecord(true)
      	Mut:ArtikelID = Pla:ArtikelID
      	Mut:CelID = Pla:CelID
      	Mut:InslagKG= Pla:KG
      	Mut:InslagPallet= Pla:Pallets
      	Clear(Ver2:Record)
      	Ver2:VerkoopID = Pla:VerkoopID
      	Access:Verkoop.Fetch(Ver2:PK_Verkoop)
      	! hier moet ik de klant eigenlijk ophalen 
      
      	!GlobalRequest = InsertRecord
      	!UpdateUitslagMutatie
      	Mut:DatumTijd_DATE=TODAY()
      	Mut:DatumTijd_TIME=CLOCK()
      	Mut:SoortMutatie='EIN'
      	Mut:PlanningID=Pla:PlanningID
      	IF NOT(Access:Mutatie.Insert() = Level:Benign)
      		IF ERRORCODE() = 90 THEN
      			MESSAGE('Mutatie-record kon niet worden aangemaakt | SQL Error('&FILEERRORCODE()&'):'&FILEERROR()&')')
      		ELSE
      			MESSAGE('Mutatie-record kon niet worden aangemaakt | Error('&ERRORCODE()&'):'&ERROR()&')')
      		.
      	ELSE
      		Pla:Verwerkt = TRUE
      		Pla:MutatieGemaakt = TRUE
      		Access:Planning.Update()
      		
      		DO UpdateInkoopVerkoopVerwerkStatus
      		
      		!BRW6.ResetQueue(false)
      		!DISPLAY
      	END
      
      	GLO:GebruikerLogHandelingOpmerking = ''
      DO RefreshWindow      
    OF ?VerkoopPrintCMR
      ThisWindow.Update()
      ReportCMR(APla:PlanningID)
      ThisWindow.Reset
      IF GlobalResponse=RequestCompleted
      	! Bijwerken
      	verkoopID# = APla:VerkoopID
      	
      	CLEAR(APla:PlanningID,-1)
      	SET(APla:Planning_FK02, APla:Planning_FK02)
      	LOOP UNTIL Access:APlanning.Next()
      		IF verkoopID# <> APla:VerkoopID THEN BREAK.
      		
      		APla:Geprint = TRUE
      		Access:APlanning.Update();
      	END
      
      	DO RefreshWindow	
      END
    OF ?VerkoopHVerwerkt
      ThisWindow.Update()
      DO RefreshWindow      
    OF ?OverboekVerwerkt
      ThisWindow.Update()
      Get(BRW8.Q,Choice(?OverboekList))
      Pla:PlanningID = BRW8.Q.Pla4:PlanningID
      IF Access:Planning.Fetch(Pla:PK_Planning)
      	Message('Planning regel kan niet ingelezen worden','Fout',Icon:Hand)
      	CYCLE
      END
      
      IF Pla:Verwerkt = TRUE
      	Message('Planning-uitslag regel is reeds verwerkt ','Fout',Icon:Hand)
      	CYCLE
      END
      
      GLO:GebruikerLogHandelingOpmerking = 'OverboekVerwerkt'
      
      bulk# = 0
      CLEAR(BOV:Record)
      BOV:PlanningID = Pla:PlanningID
      SET(BOV:FK1_BulkOverboeking, BOV:FK1_BulkOverboeking)
      Access:BulkOverboeking.Next()
      IF NOT(ERROR())
      	IF BOV:PlanningID = Pla:PlanningID THEN
      		bulk# = 1
      	.
      .
      
      IF NOT(bulk#)
      	! Gewone overboeking
      	mutatieID# = 0
      	CLEAR(Mut:Record)
      	Mut:PlanningID = Pla:PlanningID
      	SET(Mut:Mutatie_FK02, Mut:Mutatie_FK02)
      	LOOP
      		Access:Mutatie.Next()
      		IF ERROR() THEN BREAK.
      		IF Mut:PlanningID <> Pla:PlanningID THEN BREAK.
      		
      		IF Mut:SoortMutatie = 'OUIT' THEN
      			mutatieID# = Mut:MutatieID
      			BREAK
      		.
      	.
      
      	CLEAR(Mut:Record)
      	Mut:MutatieID=mutatieID#
      	IF (mutatieID# = 0 or Access:Mutatie.TryFetch(Mut:Mutatie_PK) <> Level:Benign)
      		Clear(Mut:Record)
      		Mut:ArtikelID = Pla:ArtikelID
      		Mut:UitslagKG= Pla:KG
      		Mut:UitslagPallet = Pla:Pallets
      		Mut:CelID = Pla:CelID
      		Mut:PlanningID = Pla:PlanningID
      
      		GlobalRequest = InsertRecord
      		UpdateOverboekMutatie
      	ELSE
      		GlobalRequest = ChangeRecord
      		UpdateOverboekMutatie
      	END
      	
          IF GlobalResponse = RequestCompleted
              ! 2019-7-19 Regel wordt leeggemaakt
              IF Access:Planning.Fetch(Pla:PK_Planning)<>Level:Benign
                  Message('Planning kan niet teuggelezen')
              END
              
      		Pla:Verwerkt = TRUE
      		Pla:MutatieGemaakt = TRUE
      		Access:Planning.Update()
      		
      		VoorraadClass.VerwerkGekoppeldeVerkoop(Pla:PlanningID, Pla:OverboekingPlanningID, Mut:NaarCelID)
      		
      		BRW8.ResetQueue(true)
      	END
      ELSE
      	! Bulk-overboeking
      	GlobalRequest = ChangeRecord
      	BulkOverboekMutatieWijzigen
      	
      	IF GlobalResponse = RequestCompleted
      		Pla:Verwerkt = TRUE
      		Pla:MutatieGemaakt = TRUE
      		Access:Planning.Update()
      		
      		VoorraadClass.VerwerkGekoppeldeVerkoop(Pla:PlanningID, Pla:OverboekingPlanningID, BOV:NaarCelID)
      		
      		!BRW8.ResetQueue(true)
      	ELSE
      		! Controleer of er nog mutaties gekoppeld zijn aan deze bulk-overboeking
      		verwijder# = 0
      		CLEAR(BOV:Record)
      		BOV:PlanningID = Pla:PlanningID
      		SET(BOV:FK1_BulkOverboeking, BOV:FK1_BulkOverboeking)
      		Access:BulkOverboeking.Next()
      		IF NOT(ERROR())
      			IF BOV:PlanningID = Pla:PlanningID THEN
      				verwijder# = 1
      				
      				CLEAR(Mut:Record)
      				Mut:BulkOverboekingID = BOV:BulkOverboekingID
      				SET(Mut:Mutatie_FK04, Mut:Mutatie_FK04)
      				LOOP
      					Access:Mutatie.Next()
      					IF ERROR() THEN BREAK.
      					IF Mut:BulkOverboekingID <> BOV:BulkOverboekingID THEN BREAK.
      					
      					verwijder# = 0
      					BREAK
      				.
      			.
      		.
      		
      		IF verwijder#
      			Access:BulkOverboeking.DeleteRecord(false)
      			
      			Pla:Verwerkt = FALSE
      			Pla:MutatieGemaakt = FALSE
      			Access:Planning.Update()
      				
      			!BRW8.ResetQueue(true)
      		.
      	END
      .
      
      GLO:GebruikerLogHandelingOpmerking = ''
      DO RefreshWindow      
    OF ?Ritten
      ThisWindow.Update()
      BrowseTransfers(LOC:DatumNu)
      
      !BRW8.ResetQueue(false)
      DO RefreshWindow      
    OF ?BulkOverboeken
      ThisWindow.Update()
      Get(BRW8.Q,Choice(?OverboekList))
      Pla:PlanningID = BRW8.Q.Pla4:PlanningID
      IF Access:Planning.Fetch(Pla:PK_Planning)
      	Message('Planning regel kan niet ingelezen worden.','Fout',Icon:Hand)
      	CYCLE
      END
      
      IF Pla:Verwerkt = TRUE
      	Message('Planning-uitslag regel is reeds verwerkt.','Fout',Icon:Hand)
      	CYCLE
      END
      
      GLO:GebruikerLogHandelingOpmerking = 'BulkOverboeken'
      
      exists# = 0
      CLEAR(BOV:Record)
      db.DebugOut('BulkOverboeken:' & Pla:PlanningID)
      BOV:PlanningID = Pla:PlanningID
      SET(BOV:FK1_BulkOverboeking, BOV:FK1_BulkOverboeking)
      Access:BulkOverboeking.Next()
      IF NOT(ERROR())
      	db.DebugOut('BulkOverboeken:' & BOV:PlanningID)
      	IF BOV:PlanningID = Pla:PlanningID THEN
      		exists# = 1
      	.
      .
      
      IF (exists#)
      	GlobalRequest = ChangeRecord
      	BulkOverboekMutatieWijzigen
      	
      	IF GlobalResponse = RequestCancelled THEN
      		! Controleer of er nog mutaties gekoppeld zijn aan deze bulk-overboeking
      		verwijder# = 0
      		CLEAR(BOV:Record)
      		BOV:PlanningID = Pla:PlanningID
      		SET(BOV:FK1_BulkOverboeking, BOV:FK1_BulkOverboeking)
      		Access:BulkOverboeking.Next()
      		IF NOT(ERROR())
      			IF BOV:PlanningID = Pla:PlanningID THEN
      				verwijder# = 1
      				
      				CLEAR(Mut:Record)
      				Mut:BulkOverboekingID = BOV:BulkOverboekingID
      				SET(Mut:Mutatie_FK04, Mut:Mutatie_FK04)
      				LOOP
      					Access:Mutatie.Next()
      					IF ERROR() THEN BREAK.
      					IF Mut:BulkOverboekingID <> BOV:BulkOverboekingID THEN BREAK.
      					
      					verwijder# = 0
      					BREAK
      				.
      			.
      		.
      		
      		IF verwijder#
      			Access:BulkOverboeking.DeleteRecord(false)
      			
      			Pla:Verwerkt = FALSE
      			Pla:MutatieGemaakt = FALSE
      			Access:Planning.Update()
      				
      			!BRW8.ResetQueue(true)
      		.
      	ELSIF GlobalRequest = RequestCompleted
      		VoorraadClass.VerwerkGekoppeldeVerkoop(Pla:PlanningID, Pla:OverboekingPlanningID, BOV:NaarCelID)
      	END
      ELSE
      	IF Pla:MutatieGemaakt = TRUE
      		Message('Van de planning-uitslag is al een gewone overboeking gemaakt.','Fout',Icon:Hand)
      		CYCLE
      	.
      	
      	GlobalRequest = InsertRecord
      	BulkOverboekMutatieMaken
      	
      	IF GlobalResponse = RequestCompleted
      		Pla:MutatieGemaakt = TRUE
      		Access:Planning.Update()
      
      		VoorraadClass.VerwerkGekoppeldeVerkoop(Pla:PlanningID, Pla:OverboekingPlanningID, BOV:NaarCelID)
      	END	
      END
      
      GLO:GebruikerLogHandelingOpmerking = ''
      DO RefreshWindow      
    OF ?PrintOverboekingStickers
      ThisWindow.Update()
      ! Planningrecord inlezen
      Get(BRW8.Q, Choice(?OverboekList))
      CLEAR(Par:Record)
      Par:PartijID = BRW8.Q.Pla4:PartijID
      IF NOT(Access:Partij.TryFetch(Par:Partij_PK) = Level:Benign)
      	Message('Partij kan niet gevonden worden','Fout',Icon:Hand)
      	CYCLE
      END
      
      !message(Par:PartijID)
      
      aantalpallets# = ReportPalletStickers()
      IF GlobalResponse = RequestCompleted
      	IF NOT(Access:Partij.Fetch(Par:Partij_PK))
      		Par:PalletsGeprint=Par:PalletsGeprint+aantalpallets#
      		Access:Partij.Update()
      	.
      	!BRW8.ResetQueue(false)
      END
      DO RefreshWindow
    OF ?PrintInslagRapport
      ThisWindow.Update()
      Get(BRW6.Q,Choice(?InkoopList))
      ThisWindow.InslagReport(BRW6.Q.Pla2:PlanningID)
    OF ?VerkoopTerugdraaienButton
      ThisWindow.Update()
      ThisWindow.HandleButton('Terugdraaien', 'VER', 0)
    OF ?InkoopTerugdraaienButton
      ThisWindow.Update()
      GLO:GebruikerLogHandelingOpmerking = 'InkoopTerugdraaien'
      ThisWindow.HandleButton('Terugdraaien', 'INK', 0)
      GLO:GebruikerLogHandelingOpmerking = ''
    OF ?OverboekRapport
      ThisWindow.Update()
      Get(BRW8.Q,Choice(?OverboekList))
      IF ERROR() THEN
      	MESSAGE('Geen overboeking geselecteerd')
      	RETURN ReturnValue
      .
      
      APla:PlanningID = BRW8.Q.Pla4:PlanningID
      IF Access:APlanning.TryFetch(APla:PK_Planning) <> Level:Benign THEN
      	MESSAGE('Geen overboeking geselecteerd')
      	RETURN ReturnValue
      .
      
      ReportOverboeking(APla:PlanningID)
    OF ?VerkoopSjabloon
      ThisWindow.Update()
      Get(BRW1.Q,Choice(?VerkoopList))
      IF ERROR() THEN
      	MESSAGE('Geen verkoop geselecteerd')
      	RETURN ReturnValue
      .
      
      CLEAR(Ver2:Record)
      Ver2:VerkoopID = BRW1.Q.Pla3:VerkoopID
      IF Access:Verkoop.TryFetch(Ver2:PK_Verkoop) <> Level:Benign THEN
      	MESSAGE('Geen verkoop geselecteerd')
      	RETURN ReturnValue
      .
      
      WindowCallSjabloon('VerkoopMutaties', Ver2:VerkoopID)
    OF ?OverboekSjabloon
      ThisWindow.Update()
      	!IF AARel:RelatieID = 0 THEN
      	!	MESSAGE('Geen overboeking geselecteerd')
      	!	RETURN ReturnValue
      	!.
      
      	Get(BRW8.Q,Choice(?OverboekList))
      	IF ERROR() THEN
      		MESSAGE('Geen overboeking geselecteerd')
      		RETURN ReturnValue
      	.
      
      	APla:PlanningID = BRW8.Q.Pla4:PlanningID
      	IF Access:APlanning.TryFetch(APla:PK_Planning) <> Level:Benign THEN
      		MESSAGE('Geen overboeking geselecteerd')
      		RETURN ReturnValue
      	.
      
      	WindowCallSjabloon('Overboeking',APla:PlanningID)
    OF ?VerkoopRapport
      ThisWindow.Update()
      Get(BRW1.Q,Choice(?VerkoopList))
      IF ERROR() THEN
      	MESSAGE('Geen verkoop geselecteerd')
      	RETURN ReturnValue
      .
      
      CLEAR(Ver2:Record)
      Ver2:VerkoopID = BRW1.Q.Pla3:VerkoopID
      IF Access:Verkoop.TryFetch(Ver2:PK_Verkoop) <> Level:Benign THEN
      	MESSAGE('Geen verkoop geselecteerd')
      	RETURN ReturnValue
      .
      
      ReportVerkoopMutaties(Ver2:VerkoopID)
    OF ?InkoopVerwerk2
      ThisWindow.Update()
      db.DebugOut('INSLAG DOEN1 ' & APla:PartijID)
      
      ! Planningrecord inlezen
      Get(BRW3.Q,Choice(?InkoopList2))
      APla:PlanningID = BRW3.Q.APla2:PlanningID
      IF Access:APlanning.Fetch(APla:PK_Planning)
        Message('Planning regel kan niet ingelezen worden','Fout',Icon:Hand)
        CYCLE
      END
      
      IF APla:Verwerkt = TRUE
        Message('Planning regel is verwerkt','Fout',Icon:Hand)
        CYCLE
      END
      
      GLO:GebruikerLogHandelingOpmerking = 'InkoopVerwerkt'
      
      CLEAR(Par:Record)
      Par:PartijID = APla:PartijID
      IF Access:Partij.TryFetch(Par:Partij_PK) = Level:Benign
      	db.DebugOut('INSLAG DOEN2a ' & APla:PartijID)
      	GlobalRequest = ChangeRecord
      	IF APla:Gewogen THEN
              GLO:GebruikerLogHandelingOpmerking = 'InkoopVerwerktWeging'
      		WindowInslagWeging()
          ELSE
              GLO:GebruikerLogHandelingOpmerking = 'InkoopVerwerkt'
      		WindowInslag()
      	END
      
      	IF GlobalResponse = RequestCompleted
              ! Planningrecord inlezen
      			
      		!GlobalRequest = ChangeRecord
      		!UpdateInslag
      		!IF GlobalResponse = RequestCompleted
      			
      		APla:MutatieGemaakt = TRUE
      		APla:Verwerkt = TRUE
      		Access:APlanning.Update()
      		
      		!ReportInslag
      
      		CLEAR(Pla:Record)
      		Pla:PlanningID=BRW3.Q.APla2:PlanningID
      		Access:Planning.TryFetch(Pla:PK_Planning)
      		IF (Access:Planning.TryFetch(Pla:PK_Planning) = Level:Benign)
      			DO UpdateInkoopVerkoopVerwerkStatus
      		.
      		
      		!BRW3.ResetQueue(false)
      	END
      ELSE
      	MESSAGE('Planning regel is nog niet ingeslagen.|Er bestaat nog geen partij.')
      END
      
      GLO:GebruikerLogHandelingOpmerking = ''
      DO RefreshWindow      
    OF ?InkoopInslag2
      ThisWindow.Update()
      db.DebugOut('INSLAG DOEN1 ' & APla:PartijID)
      
      ! Planningrecord inlezen
      Get(BRW3.Q,Choice(?InkoopList2))
      APla:PlanningID = BRW3.Q.APla2:PlanningID
      IF Access:APlanning.Fetch(APla:PK_Planning)
        Message('Planning regel kan niet ingelezen worden','Fout',Icon:Hand)
        CYCLE
      END
      
      IF APla:Verwerkt = TRUE
        Message('Planning regel is verwerkt','Fout',Icon:Hand)
        CYCLE
      END
      
      GLO:GebruikerLogHandelingOpmerking = 'InkoopInslaan'
      
      CLEAR(Par:Record)
      Par:PartijID = APla:PartijID
      IF Access:Partij.TryFetch(Par:Partij_PK) = Level:Benign
      	db.DebugOut('INSLAG DOEN2a ' & APla:PartijID)
      	GlobalRequest = ChangeRecord
      	WindowInslag()
      
          IF GlobalResponse = RequestCompleted
              Clear(APla:REcord)
              APla:PlanningID = BRW3.Q.APla2:PlanningID
              IF Access:APlanning.Fetch(APla:PK_Planning)
                  Message('Planning regel kan niet ingelezen worden','Fout',Icon:Hand)
              END
              
      		APla:MutatieGemaakt = TRUE
      		Access:APlanning.Update()
      	END
      ELSE
      	db.DebugOut('INSLAG DOEN2b ' & APla:PartijID)
      	GlobalRequest = InsertRecord
      	WindowInslag()
      
          IF GlobalResponse = RequestCompleted
              Clear(APla:REcord)
              APla:PlanningID = BRW3.Q.APla2:PlanningID
              IF Access:APlanning.Fetch(APla:PK_Planning)
                  Message('Planning regel kan niet ingelezen worden','Fout',Icon:Hand)
              END
              
      		APla:MutatieGemaakt = TRUE
      		APla:PartijID = Par:PartijID
      		Access:APlanning.Update()
      	END
      END
      
      GLO:GebruikerLogHandelingOpmerking = ''
      DO RefreshWindow      
    OF ?InkoopHVerwerkt2
      ThisWindow.Update()
          ! Planningrecord inlezen
      	Get(BRW3.Q,Choice(?InkoopList2))
      	Pla:PlanningID = BRW3.Q.APla2:PlanningID
      	IF Access:Planning.Fetch(Pla:PK_Planning)
      		Message('Planning-inslag regel kan niet ingelezen worden','Fout',Icon:Hand)
      		CYCLE
      	END
      
      	IF Pla:Verwerkt = TRUE
      		Message('Planning-inslag regel is reeds verwerkt ','Fout',Icon:Hand)
      		CYCLE
      	END
      
      	!CLEAR(Cel:Record)
      	!Cel:CelID = Pla:CelID
      	!IF Access:Cel.TryFetch(CEL:CEL_PK) <> Level:Benign
      	!	Message('Bij deze planning-inslag regel is geen geldige cel geselecteerd.','Fout',Icon:Hand)
      	!	CYCLE
      	!END
      
      	CLEAR(Art:Record)
      	Art:ArtikelID=Pla:ArtikelID
      	IF Access:ViewArtikel.TryFetch(Art:Artikel_PK) <> Level:Benign
      		MESSAGE('Bij deze planning-inslag regel is geen geldig artikel geselecteerd.','Fout',Icon:Hand)
      		CYCLE
      	.
      
      	GLO:GebruikerLogHandelingOpmerking = 'InkoopHVerwerkt'
      
      	Clear(Mut:Record)
      	Access:Mutatie.PrimeRecord(true)
      	Mut:ArtikelID = Pla:ArtikelID
      	Mut:CelID = Pla:CelID
      	Mut:InslagKG= Pla:KG
      	Mut:InslagPallet= Pla:Pallets
      	Clear(Ver2:Record)
      	Ver2:VerkoopID = Pla:VerkoopID
      	Access:Verkoop.Fetch(Ver2:PK_Verkoop)
      	! hier moet ik de klant eigenlijk ophalen 
      
      	!GlobalRequest = InsertRecord
      	!UpdateUitslagMutatie
      	Mut:DatumTijd_DATE=TODAY()
      	Mut:DatumTijd_TIME=CLOCK()
      	Mut:SoortMutatie='EIN'
      	Mut:PlanningID=Pla:PlanningID
      	IF NOT(Access:Mutatie.Insert() = Level:Benign)
      		IF ERRORCODE() = 90 THEN
      			MESSAGE('Mutatie-record kon niet worden aangemaakt | SQL Error('&FILEERRORCODE()&'):'&FILEERROR()&')')
      		ELSE
      			MESSAGE('Mutatie-record kon niet worden aangemaakt | Error('&ERRORCODE()&'):'&ERROR()&')')
      		.
      	ELSE
      		Pla:Verwerkt = TRUE
      		Pla:MutatieGemaakt = TRUE
      		Access:Planning.Update()
      		
      		DO UpdateInkoopVerkoopVerwerkStatus
      		
      		!BRW3.ResetQueue(false)
      		!DISPLAY
      	END
      
      	GLO:GebruikerLogHandelingOpmerking = ''
      DO RefreshWindow
    OF ?InslagWeging2
      ThisWindow.Update()
      db.DebugOut('INSLAG DOEN1 ' & APla:PartijID)
      
      ! Planningrecord inlezen
      Get(BRW3.Q,Choice(?InkoopList2))
      APla:PlanningID = BRW3.Q.APla2:PlanningID
      IF Access:APlanning.Fetch(APla:PK_Planning)
        Message('Planning regel kan niet ingelezen worden','Fout',Icon:Hand)
        CYCLE
      END
      
      IF APla:Verwerkt = TRUE
        Message('Planning regel is verwerkt','Fout',Icon:Hand)
        CYCLE
      END
      
      GLO:GebruikerLogHandelingOpmerking = 'InkoopWeging'
      
      CLEAR(Par:Record)
      Par:PartijID = APla:PartijID
      IF Access:Partij.TryFetch(Par:Partij_PK) = Level:Benign
      	db.DebugOut('INSLAG DOEN2a ' & APla:PartijID)
      	GlobalRequest = ChangeRecord
      	WindowInslagWeging()
      
          IF GlobalResponse = RequestCompleted
              GLO:GebruikerLogHandelingOpmerking = 'RequestCompleted - WindowInslagWeging()'
              ! 2017-10-4 Hier de planning opnieuw inlezen omdat deze door de Weging aangepast is en weggeschreven is
              ! Maar als we nu alleen één veld willen aanpassen hij de hele oude buffer laat zien????
              Clear(APla:Record)
              APla:PlanningID=BRW3.Q.APla2:PlanningID
              IF Access:APlanning.Fetch(APla:PK_Planning) <> Level:Benign
                  Message('APlanning-inslag regel kan niet opnieuw ingelezen worden','Fout',Icon:Hand)
              END
      		APla:MutatieGemaakt = TRUE
      		APla:Gewogen = true		
      		Access:APlanning.Update()
      	END
      ELSE
      	db.DebugOut('INSLAG DOEN2b ' & APla:PartijID)
      	GlobalRequest = InsertRecord
      	WindowInslagWeging()
      
      	IF GlobalResponse = RequestCompleted
              GLO:GebruikerLogHandelingOpmerking = 'RequestCompleted - WindowInslagWeging()'
              ! 2017-10-4 Hier de planning opnieuw inlezen omdat deze door de Weging aangepast is en weggeschreven is
              ! Maar als we nu alleen één veld willen aanpassen hij de hele oude buffer laat zien????
              Clear(APla:Record)
              APla:PlanningID=BRW3.Q.APla2:PlanningID
              IF Access:APlanning.Fetch(APla:PK_Planning) <> Level:Benign
                  Message('APlanning-inslag regel kan niet opnieuw ingelezen worden','Fout',Icon:Hand)
              END
      		APla:MutatieGemaakt = TRUE
      		APla:PartijID = Par:PartijID
      		APla:Gewogen = true
      		Access:APlanning.Update()
      	END
      END
      
      GLO:GebruikerLogHandelingOpmerking = ''
      DO RefreshWindow      
    OF ?OverboekPrintStickers3
      ThisWindow.Update()
      ! Planningrecord inlezen
      Get(BRW9.Q, Choice(?OverboekList2))
      CLEAR(Par:Record)
      Par:PartijID = BRW9.Q.APla4:PartijID
      IF NOT(Access:Partij.TryFetch(Par:Partij_PK) = Level:Benign)
      	Message('Partij kan niet gevonden worden','Fout',Icon:Hand)
      	CYCLE
      END
      
      !message(Par:PartijID)
      
      aantalpallets# = ReportPalletStickers()
      IF GlobalResponse = RequestCompleted
      	IF NOT(Access:Partij.Fetch(Par:Partij_PK))
      		Par:PalletsGeprint=Par:PalletsGeprint+aantalpallets#
      		Access:Partij.Update()
      	.
      	!BRW9.ResetQueue(false)
      END
      DO RefreshWindow
    OF ?BulkOverboeken3
      ThisWindow.Update()
      Get(BRW9.Q,Choice(?OverboekList2))
      Pla:PlanningID = BRW9.Q.APla4:PlanningID
      IF Access:Planning.Fetch(Pla:PK_Planning)
      	Message('Planning regel kan niet ingelezen worden.','Fout',Icon:Hand)
      	CYCLE
      END
      
      IF Pla:Verwerkt = TRUE
      	Message('Planning-uitslag regel is reeds verwerkt.','Fout',Icon:Hand)
      	CYCLE
      END
      
      GLO:GebruikerLogHandelingOpmerking = 'BulkOverboeken'
      
      exists# = 0
      CLEAR(BOV:Record)
      db.DebugOut('BulkOverboeken:' & Pla:PlanningID)
      BOV:PlanningID = Pla:PlanningID
      SET(BOV:FK1_BulkOverboeking, BOV:FK1_BulkOverboeking)
      Access:BulkOverboeking.Next()
      IF NOT(ERROR())
      	db.DebugOut('BulkOverboeken:' & BOV:PlanningID)
      	IF BOV:PlanningID = Pla:PlanningID THEN
      		exists# = 1
      	.
      .
      
      IF (exists#)
      	GlobalRequest = ChangeRecord
      	BulkOverboekMutatieWijzigen
      	
      	IF GlobalResponse = RequestCancelled THEN
      		! Controleer of er nog mutaties gekoppeld zijn aan deze bulk-overboeking
      		verwijder# = 0
      		CLEAR(BOV:Record)
      		BOV:PlanningID = Pla:PlanningID
      		SET(BOV:FK1_BulkOverboeking, BOV:FK1_BulkOverboeking)
      		Access:BulkOverboeking.Next()
      		IF NOT(ERROR())
      			IF BOV:PlanningID = Pla:PlanningID THEN
      				verwijder# = 1
      				
      				CLEAR(Mut:Record)
      				Mut:BulkOverboekingID = BOV:BulkOverboekingID
      				SET(Mut:Mutatie_FK04, Mut:Mutatie_FK04)
      				LOOP
      					Access:Mutatie.Next()
      					IF ERROR() THEN BREAK.
      					IF Mut:BulkOverboekingID <> BOV:BulkOverboekingID THEN BREAK.
      					
      					verwijder# = 0
      					BREAK
      				.
      			.
      		.
      		
      		IF verwijder#
      			Access:BulkOverboeking.DeleteRecord(false)
      			
      			Pla:Verwerkt = FALSE
      			Pla:MutatieGemaakt = FALSE
      			Access:Planning.Update()
      				
      			!BRW9.ResetQueue(true)
      		.
      	.
      ELSE
      	IF Pla:MutatieGemaakt = TRUE
      		Message('Van de planning-uitslag is al een gewone overboeking gemaakt.','Fout',Icon:Hand)
      		CYCLE
      	.
      	
      	GlobalRequest = InsertRecord
      	BulkOverboekMutatieMaken
      	
      	IF GlobalResponse = RequestCompleted
      		Pla:MutatieGemaakt = TRUE
      		Access:Planning.Update()
      		
      		VoorraadClass.VerwerkGekoppeldeVerkoop(Pla:PlanningID, Pla:OverboekingPlanningID, BOV:NaarCelID)
      			
      		!BRW9.ResetQueue(true)
      	END	
      END
      
      GLO:GebruikerLogHandelingOpmerking = ''
      DO RefreshWindow      
    OF ?OverboekVerwerkt3
      ThisWindow.Update()
      Get(BRW9.Q,Choice(?OverboekList2))
      Pla:PlanningID = BRW9.Q.APla4:PlanningID
      IF Access:Planning.Fetch(Pla:PK_Planning)
      	Message('Planning regel kan niet ingelezen worden','Fout',Icon:Hand)
      	CYCLE
      END
      
      IF Pla:Verwerkt = TRUE
      	Message('Planning-uitslag regel is reeds verwerkt ','Fout',Icon:Hand)
      	CYCLE
      END
      
      GLO:GebruikerLogHandelingOpmerking = 'OverboekVerwerkt'
      
      bulk# = 0
      CLEAR(BOV:Record)
      BOV:PlanningID = Pla:PlanningID
      SET(BOV:FK1_BulkOverboeking, BOV:FK1_BulkOverboeking)
      Access:BulkOverboeking.Next()
      IF NOT(ERROR())
      	IF BOV:PlanningID = Pla:PlanningID THEN
      		bulk# = 1
      	.
      .
      
      IF NOT(bulk#)
      	! Gewone overboeking
      	mutatieID# = 0
      	CLEAR(Mut:Record)
      	Mut:PlanningID = Pla:PlanningID
      	SET(Mut:Mutatie_FK02, Mut:Mutatie_FK02)
      	LOOP
      		Access:Mutatie.Next()
      		IF ERROR() THEN BREAK.
      		IF Mut:PlanningID <> Pla:PlanningID THEN BREAK.
      		
      		IF Mut:SoortMutatie = 'OUIT' THEN
      			mutatieID# = Mut:MutatieID
      			BREAK
      		.
      	.
      
      	CLEAR(Mut:Record)
      	Mut:MutatieID=mutatieID#
      	IF (mutatieID# = 0 or Access:Mutatie.TryFetch(Mut:Mutatie_PK) <> Level:Benign)
      		Clear(Mut:Record)
      		Mut:ArtikelID = Pla:ArtikelID
      		Mut:UitslagKG= Pla:KG
      		Mut:UitslagPallet = Pla:Pallets
      		Mut:CelID = Pla:CelID
      		Mut:PlanningID = Pla:PlanningID
      
      		GlobalRequest = InsertRecord
      		UpdateOverboekMutatie
      	ELSE
      		GlobalRequest = ChangeRecord
      		UpdateOverboekMutatie
      	END
      	
      	IF GlobalResponse = RequestCompleted
      		Pla:Verwerkt = TRUE
      		Pla:MutatieGemaakt = TRUE
      		Access:Planning.Update()
      
      		VoorraadClass.VerwerkGekoppeldeVerkoop(Pla:PlanningID, Pla:OverboekingPlanningID, Mut:NaarCelID)
      		
      		!BRW9.ResetQueue(true)
      	END
      ELSE
      	! Bulk-overboeking
      	GlobalRequest = ChangeRecord
      	BulkOverboekMutatieWijzigen
      	
      	IF GlobalResponse = RequestCompleted
      		Pla:Verwerkt = TRUE
      		Pla:MutatieGemaakt = TRUE
      		Access:Planning.Update()
      		
      		VoorraadClass.VerwerkGekoppeldeVerkoop(Pla:PlanningID, Pla:OverboekingPlanningID, BOV:NaarCelID)
      			
      		!BRW9.ResetQueue(true)
      	ELSE
      		! Controleer of er nog mutaties gekoppeld zijn aan deze bulk-overboeking
      		verwijder# = 0
      		CLEAR(BOV:Record)
      		BOV:PlanningID = Pla:PlanningID
      		SET(BOV:FK1_BulkOverboeking, BOV:FK1_BulkOverboeking)
      		Access:BulkOverboeking.Next()
      		IF NOT(ERROR())
      			IF BOV:PlanningID = Pla:PlanningID THEN
      				verwijder# = 1
      				
      				CLEAR(Mut:Record)
      				Mut:BulkOverboekingID = BOV:BulkOverboekingID
      				SET(Mut:Mutatie_FK04, Mut:Mutatie_FK04)
      				LOOP
      					Access:Mutatie.Next()
      					IF ERROR() THEN BREAK.
      					IF Mut:BulkOverboekingID <> BOV:BulkOverboekingID THEN BREAK.
      					
      					verwijder# = 0
      					BREAK
      				.
      			.
      		.
      		
      		IF verwijder#
      			Access:BulkOverboeking.DeleteRecord(false)
      			
      			Pla:Verwerkt = FALSE
      			Pla:MutatieGemaakt = FALSE
      			Access:Planning.Update()
      				
      			!BRW9.ResetQueue(true)
      		.
      	END
      .
      	  DO RefreshWindow
    OF ?OverboekRapport3
      ThisWindow.Update()
      	!IF AARel:RelatieID = 0 THEN
      	!	MESSAGE('Geen overboeking geselecteerd')
      	!	RETURN ReturnValue
      	!.
      
      	Get(BRW9.Q,Choice(?OverboekList2))
      	IF ERROR() THEN
      		MESSAGE('Geen overboeking geselecteerd')
      		RETURN ReturnValue
      	.
      
      	APla:PlanningID = BRW9.Q.APla4:PlanningID
      	IF Access:APlanning.TryFetch(APla:PK_Planning) <> Level:Benign THEN
      		MESSAGE('Geen overboeking geselecteerd')
      		RETURN ReturnValue
      	.
      
      	WindowCallSjabloon('Overboeking',APla:PlanningID)
    OF ?VerkoopUitslag4
      ThisWindow.Update()
      DO RefreshWindow
    OF ?VerkoopPrintCMR4
      ThisWindow.Update()
      IF GlobalResponse=RequestCompleted
      	! Bijwerken
      	verkoopID# = APla:VerkoopID
      	
      	CLEAR(APla:PlanningID,-1)
      	SET(APla:Planning_FK02, APla:Planning_FK02)
      	LOOP
      		Access:APlanning.Next()
      		IF ERROR() THEN BREAK.
      		IF verkoopID# <> APla:VerkoopID THEN BREAK.
      		
      		APla:Geprint = TRUE
      		Access:APlanning.Update();
      	END
      	
      	DO RefreshWindow
      END
    OF ?VerkoopHVerwerkt4
      ThisWindow.Update()
      DO RefreshWindow      
    OF ?Weeglijst4
      ThisWindow.Update()
      GET(BRW12.Q, CHOICE(?VerkoopList:2))
      ReportWeeglijst('Verkoop', BRW12.Q.APla3:VerkoopID)
    OF ?VerkoopTerugdraaienButton4
      ThisWindow.Update()
      ThisWindow.HandleButton('Terugdraaien', 'VER', 1)
    OF ?VerkoopRapport4
      ThisWindow.Update()
       Get(BRW12.Q,Choice(?VerkoopList:2))
      IF ERROR() THEN
      	MESSAGE('Geen verkoop geselecteerd')
      	RETURN ReturnValue
      .
      
       Ver2:VerkoopID = BRW12.Q.APla3:VerkoopID
      IF Access:Verkoop.TryFetch(Ver2:PK_Verkoop) <> Level:Benign THEN
      	MESSAGE('Geen verkoop geselecteerd')
      	RETURN ReturnValue
      .
      
      ReportVerkoopMutaties(Ver2:VerkoopID)
    OF ?VerkoopPalletbladExport2
      ThisWindow.Update()
      Get(BRW12.Q, Choice(?VerkoopList:2))
      IF NOT(ERROR()) THEN
          ThisWindow.GetMutatie(Brw12.Q.APla3:PlanningID,'UitslagWeging_PalletBlad_Export')
      END
    OF ?Gister
      ThisWindow.Update()
      Loc:DatumNu -= 1
      DISPLAY(?Loc:DatumNu)
      
      DO ConvertDatum
    OF ?Morgen
      ThisWindow.Update()
      Loc:DatumNu+=1
      DISPLAY(?Loc:DatumNu)
      
      DO ConvertDatum
    OF ?VerkoopExcel
      ThisWindow.Update()
      DO ExportExcel
    OF ?RefreshButton
      ThisWindow.Update()
      DO RefreshBrowses
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
  CASE FIELD()
  OF ?Loc:DatumNu
    DO ConvertDatum
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
    OF ?SHEET2
      IF CHOICE(?SHEET2) = 5 THEN
          HIDE(?VerkoopExcel)
      ELSE
          UNHIDE(?VerkoopExcel)
      END
      
      DO KleurActiviteitTab
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

ThisWindow.GetMutatie PROCEDURE(LONG PRM:PlanningID, String PRM:Soort)

Loc:MutatieID		LONG

  CODE
      db.Debugout('Start Get Mutatie')
      Clear(Pla:Record)
      Pla:PlanningID=PRM:PlanningID
      IF Access:Planning.Fetch(Pla:PK_Planning) <> Level:Benign
          Message('Planning-uitslag regel kan niet ingelezen worden','Fout',Icon:Hand)
          Return
      ELSIF PRM:Soort='VerwerkUitslag' or PRM:Soort='VerwerkHandUitslag'   
          IF Pla:VerkoopKGPrijs=0
              Message('Planning-uitslag regel heeft verkoopprijs van 0 en kan niet verwerkt worden','Fout',Icon:Hand)
              Return
          END    
      END
      ! zoek bijbehorende mutatie hierbij anders blijft Loc:MutatieID op nul
      Loc:mutatieID = 0
      CLEAR(Mut:Record)
      Mut:PlanningID = Pla:PlanningID
      SET(Mut:Mutatie_FK02, Mut:Mutatie_FK02)
      LOOP Until Access:Mutatie.Next()
          IF Mut:PlanningID <> Pla:PlanningID THEN BREAK. 		
          Case PRM:Soort
          of 'Uitslag' orof 'UitslagWeging' orof 'UitslagWeging_PalletBlad' orof 'VerwerkUitslag' orof 'VerwerkHandUitslag' orof 'UitslagWeging_PalletBlad_Export'
              IF Mut:SoortMutatie = 'UIT' THEN
                  Loc:mutatieID = Mut:MutatieID
                  BREAK
              .
          of 'Inkoop'
          of 'Overboek'
          ELSE
              Message('Onbekende soort:'&PRM:Soort,'Fout',Icon:Hand)
          END
      END
            
      CLEAR(Mut:Record)
      Mut:MutatieID=Loc:mutatieID
      IF (Loc:mutatieID = 0 or Access:Mutatie.TryFetch(Mut:Mutatie_PK) <> Level:Benign)
          ! Dus mutatie bestaat nog niet
          IF PRM:Soort='UitslagWeging_PalletBlad' or PRM:Soort = 'UitslagWeging_PalletBlad_Export' THEN
              MESSAGE('Er is nog geen uitslag uitgevoerd. Palletbladen kunnen dus nog niet geprint/geexporteerd worden')
              RETURN
          ELSIF PRM:Soort= 'VerwerkUitslag'
              Message('Planning regel is nog niet uitgeslagen','Fout',Icon:Hand)
              RETURN
          END	
          GLO:GebruikerLogHandelingOpmerking = PRM:Soort
  
          Clear(Mut:Record)
          Mut:ArtikelID = Pla:ArtikelID
          Mut:UitslagKG= Pla:KG
          Mut:UitslagPallet = Pla:Pallets
          Mut:CelID = Pla:CelID
          Mut:PlanningID = Pla:PlanningID
          Clear(Ver2:Record)
          Ver2:VerkoopID = Pla:VerkoopID
          Access:Verkoop.Fetch(Ver2:PK_Verkoop)       ! Hier moet ik de klant eigenlijk ophalen 
                    
          IF PRM:Soort= 'VerwerkHandUitslag'
              Mut:DatumTijd_DATE=TODAY()
              Mut:DatumTijd_TIME=CLOCK()
              Mut:SoortMutatie='EUIT'
              Mut:PlanningID=Pla:PlanningID
              IF NOT(Access:Mutatie.Insert() = Level:Benign)
                  IF ERRORCODE() = 90 THEN
                      MESSAGE('Mutatie-record kon niet worden aangemaakt | SQL Error('&FILEERRORCODE()&'):'&FILEERROR()&')')
                  ELSE
                      MESSAGE('Mutatie-record kon niet worden aangemaakt | Error('&ERRORCODE()&'):'&ERROR()&')')
                  END
              ELSE
                  Pla:Verwerkt = TRUE
                  Pla:MutatieGemaakt = TRUE
                  Access:Planning.Update()
                  VoorraadClass.BerekenPlanningMutatieGrootte(Pla:PlanningID)
                  DO UpdateInkoopVerkoopVerwerkStatus
              END			
          ELSE
              GlobalRequest = InsertRecord
              IF PRM:Soort = 'Uitslag' THEN
                  db.Debugout('Start UpdateUitslagMutatie')
                  UpdateUitslagMutatie
                  db.Debugout('Start UpdateUitslagMutatie')
              ELSIF PRM:Soort = 'UitslagWeging' THEN
                  UpdateUitslagMutatieWeging
              END
          END	
          GLO:GebruikerLogHandelingOpmerking = ''
      ELSE        ! dus mutatie wel bestaat en ingelezen is 
          GLO:GebruikerLogHandelingOpmerking = PRM:Soort
          IF PRM:Soort= 'VerwerkHandUitslag'
              Message('Er is al een mutatie regel gemaakt  ','Fout',Icon:Hand)
              RETURN
          END
          Clear(Ver2:Record)
          Ver2:VerkoopID = Pla:VerkoopID
          Access:Verkoop.Fetch(Ver2:PK_Verkoop)
                    ! Hier moet ik de klant eigenlijk ophalen 
                    
          IF PRM:Soort = 'UitslagWeging_PalletBlad' or PRM:Soort = 'UitslagWeging_PalletBlad_Export' THEN
              IF Pla:Gewogen = TRUE
                  !GlobalRequest = ViewRecord         ! 2018-1-30 alleen lezen in de form zetten
                  GlobalRequest = ChangeRecord
              ELSE
                  MESSAGE('Planningsregel is niet via weging uitgeslagen en bevat dus geen palletbladen.')
                  RETURN
              END
          ELSE
              IF Pla:Verwerkt = TRUE
                  Message('Planning-uitslag regel is reeds verwerkt ','Let Op',Icon:Hand)
                  RETURN
                          !GlobalRequest = ViewRecord
              ELSE
                  GlobalRequest = ChangeRecord
              END
          END
          IF PRM:Soort = 'UitslagWeging_PalletBlad_Export' THEN
              db.debugOut('BrowsePlanning - WindowPalletbladExport - ' & Pla:PlanningID & ', ' & Pla:VerkoopID)
              WindowPalletbladExport
              RETURN
          ELSE                
              IF Pla:Gewogen = TRUE THEN
                  UpdateUitslagMutatieWeging
              ELSE
                  db.Debugout('Start UpdateUitslagMutatie')
                  UpdateUitslagMutatie
                  db.Debugout('Start UpdateUitslagMutatie')
              END
          END
          GLO:GebruikerLogHandelingOpmerking = ''
      END
      IF GlobalResponse = RequestCompleted
          db.Debugout('RequestCompleted')
          GLO:GebruikerLogHandelingOpmerking = PRM:Soort & ' - ' & 'RequestCompleted'
          IF PRM:Soort<> 'VerwerkHandUitslag'
              ! 2017-10-4 Hier de planning opnieuw inlezen omdat deze door de Weging aangepast is en weggeschreven is
              ! Maar als we nu alleen één veld willen aanpassen hij de hele oude buffer laat zien????
              Clear(Pla:Record)
              Pla:PlanningID=PRM:PlanningID
              IF Access:Planning.Fetch(Pla:PK_Planning) <> Level:Benign
                  Message('Planning-uitslag regel kan niet opnieuw ingelezen worden','Fout',Icon:Hand)
              END
              ! alleen updaten als nodig 2018-6-21
              IF Pla:MutatieGemaakt = FALSE OR (PRM:Soort= 'VerwerkUitslag' AND Pla:Verwerkt = FALSE) OR Pla:PartijID <> Mut:PartijID
                  Pla:PartijID = Mut:PartijID
                  Pla:MutatieGemaakt = TRUE
                  IF PRM:Soort= 'VerwerkUitslag'
                      Pla:Verwerkt = TRUE
                  END	
                  Access:Planning.Update()
              END
              IF PRM:Soort= 'VerwerkUitslag'			
                      !ReportUitslag
                  CLEAR(Par:Record)
                  Par:PartijID = Mut:PartijID
                  Access:Partij.TryFetch(Par:Partij_PK)
                  DO UpdateInkoopVerkoopVerwerkStatus
              END	
          END	
          GLO:GebruikerLogHandelingOpmerking = ''
          DO RefreshWindow
          db.Debugout('RequestCompleted')
      END
      RETURN


ThisWindow.InslagReport PROCEDURE(LONG PRM:PlanningID)

  CODE
  	! Planningrecord inlezen
  	APla:PlanningID = PRM:PlanningID
  	IF Access:APlanning.Fetch(APla:PK_Planning)
  		Message('Planning-regel kan niet ingelezen worden.','Fout',Icon:Hand)
  	ELSE
  		IF APla:Verwerkt = TRUE
  			! ReportInslag print op basis van de3 huidige partij
  			CLEAR(Par:Record)
  			Par:PartijID = APla:PartijID
  
  			IF Access:Partij.TryFetch(Par:Partij_PK) = Level:Benign
  				db.DebugOut('ReportInslag(' & Par:PartijID & ')')
  				ReportInslag()
  			ELSE
  				Message('Partij ' & APla:PartijID & ' kan niet ingelezen worden.','Fout',Icon:Hand)
  			END
  		ELSE
  			Message('Planning-regel is nog niet verwerkt.','Fout',Icon:Hand)
  		END
  	END


ThisWindow.UitslagReport PROCEDURE(LONG PRM:PlanningID)

  CODE
  	CLEAR(Pla:Record)
  	Pla:PlanningID = PRM:PlanningID
  	IF Access:Planning.TryFetch(Pla:PK_Planning) = Level:Benign
  		IF Pla:Verwerkt = TRUE THEN
  			ReportUitslag()
  		ELSE
  			Message('Planning-regel is nog niet verwerkt.','Fout',Icon:Hand)
  		END
  	ELSE
  		Message('Planning-regel kan niet ingelezen worden.','Fout',Icon:Hand)
  	END


ThisWindow.HandleButton PROCEDURE(STRING PRM:Functie, STRING PRM:InkOvrVer, BOOL PRM:LosseTab)

  CODE
  IF NOT(PRM:LosseTab) THEN
  	! Tabblad Planning
  	IF PRM:InkOvrVer = 'INK' THEN
  		Get(BRW6.Q,Choice(?InkoopList))
  		IF ERROR() THEN RETURN.
  			
  		CLEAR(Pla:Record)
  		Pla:PlanningID = BRW6.Q.Pla2:PlanningID
  		IF (Access:Planning.Fetch(Pla:PK_Planning) <> Level:Benign) THEN RETURN.
  	ELSIF PRM:InkOvrVer = 'OVR' THEN
  		Get(BRW8.Q,Choice(?OverboekList))
  		IF ERROR() THEN RETURN.
  		
  		CLEAR(Pla:Record)
  		Pla:PlanningID = BRW8.Q.Pla4:PlanningID
  		IF (Access:Planning.Fetch(Pla:PK_Planning) <> Level:Benign) THEN RETURN.
  	ELSIF PRM:InkOvrVer = 'VER' THEN
  		Get(BRW1.Q,Choice(?VerkoopList))
  		IF ERROR() THEN RETURN.
  
  		CLEAR(Pla:Record)
  		Pla:PlanningID = BRW1.Q.Pla3:PlanningID
  		IF (Access:Planning.Fetch(Pla:PK_Planning) <> Level:Benign) THEN RETURN.
  	END
  ELSE
  	! Tabblad Inkoop, Overboeking en Verkoop
  	IF PRM:InkOvrVer = 'INK' THEN
  		Get(BRW3.Q,Choice(?InkoopList2))
  		IF ERROR() THEN RETURN.
  			
  		CLEAR(Pla:Record)
  		Pla:PlanningID = BRW3.Q.APla2:PlanningID
  		IF (Access:Planning.Fetch(Pla:PK_Planning) <> Level:Benign) THEN RETURN.
  	ELSIF PRM:InkOvrVer = 'OVR' THEN
  		Get(BRW9.Q,Choice(?OverboekList2))
  		IF ERROR() THEN RETURN.
  		
  		CLEAR(Pla:Record)
  		Pla:PlanningID = BRW9.Q.APla4:PlanningID
  		IF (Access:Planning.Fetch(Pla:PK_Planning) <> Level:Benign) THEN RETURN.
  	ELSIF PRM:InkOvrVer = 'VER' THEN
  		Get(BRW12.Q, Choice(?VerkoopList:2))
  		IF ERROR() THEN RETURN.
  
  		CLEAR(Pla:Record)
  		Pla:PlanningID = BRW12.Q.APla3:PlanningID
  		IF (Access:Planning.Fetch(Pla:PK_Planning) <> Level:Benign) THEN RETURN.
  	END
  END
  
  IF CLIP(PRM:Functie) = 'Terugdraaien'
  	!IF NOT(SELF.RegelVerwerkt())
  		IF MESSAGE('Mutaties terugdraaien? De bijbehorende mutaties en mogelijke wegingen worden verwijderd.', 'Planning-regel terugdraaien', ICON:Exclamation, BUTTON:Yes+BUTTON:No, BUTTON:No) =  BUTTON:Yes THEN
  			IF VoorraadClass.VerwijderPlanningMutaties(Pla:PlanningID)
  				DO RefreshWindow
  			END
  		END
  	!END
  ELSE
  	MESSAGE('HandleButton - Onbekende functie: ' & CLIP(PRM:Functie))
  END


ThisWindow.RegelVerwerkt PROCEDURE()

  CODE
  	IF Pla:Verwerkt
  		MESSAGE('Planning-regel is al verwerkt.')
  	END
  	
  	RETURN Pla:Verwerkt


ThisWindow.GetGetransferd PROCEDURE(LONG PRM:PlanningID)

!SQLFile                                 &File
!SQLGroup 								&GROUP
!SQLField                                ANY

  CODE
  ! Uitgeschakeld 2019-6-19 ivm performence (overboekingen worden niet meer gebruikt sinds 2018
  !  IF RECORDS(GetransferdQueue) = 0 THEN
  !  	SQLFile &= NEW(File)
  !  	SQLFile{Prop:Driver}='MSSQL'
  !  	SQLFile{Prop:DriverString}='/BUSYHANDLING=2'
  !  	SQLFile{Prop:Owner}=GLO:Owner
  !  	SQLFile{Prop:Sql}='SELECT dbo.OverboekingRitRegel.PlanningID FROM OverboekingRitRegel '&|
  !  		'INNER JOIN dbo.OverboekingRit ON dbo.OverboekingRit.OverboekingRitID = dbo.OverboekingRitRegel.OverboekingRitID '&|
  !  		'ORDER BY dbo.OverboekingRitRegel.PlanningID'
  !  			
  !  	FIXFORMAT(SQLFile)	
  !  	IF ERROR() THEN STOP(ERROR()&' bij de fixformat').
  !  	SQLGroup &= SQLFile{Prop:Record}
  !  	
  !  	LOOP
  !  		Next(SQLFile)
  !  		IF ERROR() Then Break.
  !  		
  !  		SQLField &= WHAT(SQLGroup,1)
  !  		TQ:PlanningID = SQLField
  !  		ADD(GetransferdQueue, +TQ:PlanningID)
  !  	 	IF ERROR() THEN STOP(ERROR()&' bij toevoegen aan GetransferdQueue').
  !  	END	
  !  	
  !  	CLOSE(SQLFile)
  !  	 IF ERROR() THEN STOP(ERROR()&' bij de close').
  !  	DISPOSE(SQLFile)
  !  	IF ERROR() THEN STOP(ERROR()&' bij de dispose').
  !  END
  !  
  !  TQ:PlanningID = PRM:PlanningID
  !  GET(GetransferdQueue, +TQ:PlanningID)
  !  IF NOT(ERROR()) THEN
  !        RETURN 1
  !    ELSE
  !    RETURN 0
  !   END
    Clear(ORR:Record)
    Set(OverboekingRitRegel)
    OverboekingRitRegel{Prop:Where}='PlanningID='&PRM:PlanningID
    IF Access:OverboekingRitRegel.Next()=Level:Benign
        RETURN 1
    ELSE
        RETURN 0
    END
  



BRW6.Fetch PROCEDURE(BYTE Direction)

GreenBarIndex   LONG,AUTO
  CODE
  PARENT.Fetch(Direction)
  !----------------------------------------------------------------------
    LOOP GreenBarIndex=1 TO RECORDS(SELF.Q)
      GET(SELF.Q,GreenBarIndex)
      SELF.Q.Pla2:ArtikelID_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for Pla2:ArtikelID
      SELF.Q.Pla2:ArtikelID_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.Pla2:ArtikelID_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla2:ArtikelID_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla2:ArtikelOms_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for Pla2:ArtikelOms
      SELF.Q.Pla2:ArtikelOms_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.Pla2:ArtikelOms_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla2:ArtikelOms_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla2:FirmaNaam_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for Pla2:FirmaNaam
      SELF.Q.Pla2:FirmaNaam_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.Pla2:FirmaNaam_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla2:FirmaNaam_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.LOC:InkoopKG1_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for LOC:InkoopKG1
      SELF.Q.LOC:InkoopKG1_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.LOC:InkoopKG1_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.LOC:InkoopKG1_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla2:Instructie_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for Pla2:Instructie
      SELF.Q.Pla2:Instructie_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.Pla2:Instructie_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla2:Instructie_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla2:VerpakkingOmschrijving_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for Pla2:VerpakkingOmschrijving
      SELF.Q.Pla2:VerpakkingOmschrijving_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.Pla2:VerpakkingOmschrijving_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla2:VerpakkingOmschrijving_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla2:Planning_TIME_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for Pla2:Planning_TIME
      SELF.Q.Pla2:Planning_TIME_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.Pla2:Planning_TIME_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla2:Planning_TIME_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.LOC:InkoopPallets1_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for LOC:InkoopPallets1
      SELF.Q.LOC:InkoopPallets1_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.LOC:InkoopPallets1_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.LOC:InkoopPallets1_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla2:MutatieGemaakt_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for Pla2:MutatieGemaakt
      SELF.Q.Pla2:MutatieGemaakt_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.Pla2:MutatieGemaakt_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla2:MutatieGemaakt_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla2:Geprint_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for Pla2:Geprint
      SELF.Q.Pla2:Geprint_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.Pla2:Geprint_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla2:Geprint_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.LOC:Getransferd_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for LOC:Getransferd
      SELF.Q.LOC:Getransferd_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.LOC:Getransferd_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.LOC:Getransferd_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla2:Verwerkt_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for Pla2:Verwerkt
      SELF.Q.Pla2:Verwerkt_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.Pla2:Verwerkt_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla2:Verwerkt_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla2:Gewogen_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for Pla2:Gewogen
      SELF.Q.Pla2:Gewogen_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.Pla2:Gewogen_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla2:Gewogen_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla2:CelOms_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for Pla2:CelOms
      SELF.Q.Pla2:CelOms_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.Pla2:CelOms_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla2:CelOms_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla2:Locatienaam_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for Pla2:Locatienaam
      SELF.Q.Pla2:Locatienaam_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.Pla2:Locatienaam_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla2:Locatienaam_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla2:Transport_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for Pla2:Transport
      SELF.Q.Pla2:Transport_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.Pla2:Transport_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla2:Transport_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla2:PlanningID_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for Pla2:PlanningID
      SELF.Q.Pla2:PlanningID_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.Pla2:PlanningID_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla2:PlanningID_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      PUT(SELF.Q)
    END
  !----------------------------------------------------------------------


BRW6.ResetQueue PROCEDURE(BYTE ResetMode)

  CODE
  	db.DebugOut('START DUUR PlanningInkoop.ResetQueue')
  	pre_timing# = CLOCK()
  PARENT.ResetQueue(ResetMode)
  	post_timing# = CLOCK()
  	db.DebugOut('METING DUUR PlanningInkoop.ResetQueue : ' & (post_timing# - pre_timing#))


BRW6.SetQueueRecord PROCEDURE

  CODE
  LOC:Getransferd = ThisWindow.GetGetransferd(Pla2:PlanningID)
  
  IF Pla2:MutatieGemaakt THEN
  	LOC:InkoopKG1 = Pla2:MutatieKG
  	LOC:InkoopPallets1 = Pla2:MutatiePallets
  ELSE
  	LOC:InkoopKG1 = Pla2:KG
  	LOC:InkoopPallets1 = Pla2:Pallets
  END
  PARENT.SetQueueRecord
  
  IF (Pla2:MutatieGemaakt)
    SELF.Q.Pla2:MutatieGemaakt_Icon = 2                    ! Set icon from icon list
  ELSE
    SELF.Q.Pla2:MutatieGemaakt_Icon = 1                    ! Set icon from icon list
  END
  IF (Pla2:Geprint)
    SELF.Q.Pla2:Geprint_Icon = 2                           ! Set icon from icon list
  ELSE
    SELF.Q.Pla2:Geprint_Icon = 1                           ! Set icon from icon list
  END
  IF (LOC:Getransferd)
    SELF.Q.LOC:Getransferd_Icon = 2                        ! Set icon from icon list
  ELSE
    SELF.Q.LOC:Getransferd_Icon = 1                        ! Set icon from icon list
  END
  IF (Pla2:Verwerkt)
    SELF.Q.Pla2:Verwerkt_Icon = 2                          ! Set icon from icon list
  ELSE
    SELF.Q.Pla2:Verwerkt_Icon = 1                          ! Set icon from icon list
  END
  IF (Pla2:Gewogen)
    SELF.Q.Pla2:Gewogen_Icon = 2                           ! Set icon from icon list
  ELSE
    SELF.Q.Pla2:Gewogen_Icon = 1                           ! Set icon from icon list
  END
  !----------------------------------------------------------------------
      SELF.Q.Pla2:ArtikelID_NormalFG   = CHOOSE(CHOICE(?InkoopList) % 2,-1,-1) ! Set color values for Pla2:ArtikelID
      SELF.Q.Pla2:ArtikelID_NormalBG   = CHOOSE(CHOICE(?InkoopList) % 2,-1,8454143)
      SELF.Q.Pla2:ArtikelID_SelectedFG = CHOOSE(CHOICE(?InkoopList) % 2,-1,-1)
      SELF.Q.Pla2:ArtikelID_SelectedBG = CHOOSE(CHOICE(?InkoopList) % 2,-1,-1)
      SELF.Q.Pla2:ArtikelOms_NormalFG   = CHOOSE(CHOICE(?InkoopList) % 2,-1,-1) ! Set color values for Pla2:ArtikelOms
      SELF.Q.Pla2:ArtikelOms_NormalBG   = CHOOSE(CHOICE(?InkoopList) % 2,-1,8454143)
      SELF.Q.Pla2:ArtikelOms_SelectedFG = CHOOSE(CHOICE(?InkoopList) % 2,-1,-1)
      SELF.Q.Pla2:ArtikelOms_SelectedBG = CHOOSE(CHOICE(?InkoopList) % 2,-1,-1)
      SELF.Q.Pla2:FirmaNaam_NormalFG   = CHOOSE(CHOICE(?InkoopList) % 2,-1,-1) ! Set color values for Pla2:FirmaNaam
      SELF.Q.Pla2:FirmaNaam_NormalBG   = CHOOSE(CHOICE(?InkoopList) % 2,-1,8454143)
      SELF.Q.Pla2:FirmaNaam_SelectedFG = CHOOSE(CHOICE(?InkoopList) % 2,-1,-1)
      SELF.Q.Pla2:FirmaNaam_SelectedBG = CHOOSE(CHOICE(?InkoopList) % 2,-1,-1)
      SELF.Q.LOC:InkoopKG1_NormalFG   = CHOOSE(CHOICE(?InkoopList) % 2,-1,-1) ! Set color values for LOC:InkoopKG1
      SELF.Q.LOC:InkoopKG1_NormalBG   = CHOOSE(CHOICE(?InkoopList) % 2,-1,8454143)
      SELF.Q.LOC:InkoopKG1_SelectedFG = CHOOSE(CHOICE(?InkoopList) % 2,-1,-1)
      SELF.Q.LOC:InkoopKG1_SelectedBG = CHOOSE(CHOICE(?InkoopList) % 2,-1,-1)
      SELF.Q.Pla2:Instructie_NormalFG   = CHOOSE(CHOICE(?InkoopList) % 2,-1,-1) ! Set color values for Pla2:Instructie
      SELF.Q.Pla2:Instructie_NormalBG   = CHOOSE(CHOICE(?InkoopList) % 2,-1,8454143)
      SELF.Q.Pla2:Instructie_SelectedFG = CHOOSE(CHOICE(?InkoopList) % 2,-1,-1)
      SELF.Q.Pla2:Instructie_SelectedBG = CHOOSE(CHOICE(?InkoopList) % 2,-1,-1)
      SELF.Q.Pla2:VerpakkingOmschrijving_NormalFG   = CHOOSE(CHOICE(?InkoopList) % 2,-1,-1) ! Set color values for Pla2:VerpakkingOmschrijving
      SELF.Q.Pla2:VerpakkingOmschrijving_NormalBG   = CHOOSE(CHOICE(?InkoopList) % 2,-1,8454143)
      SELF.Q.Pla2:VerpakkingOmschrijving_SelectedFG = CHOOSE(CHOICE(?InkoopList) % 2,-1,-1)
      SELF.Q.Pla2:VerpakkingOmschrijving_SelectedBG = CHOOSE(CHOICE(?InkoopList) % 2,-1,-1)
      SELF.Q.Pla2:Planning_TIME_NormalFG   = CHOOSE(CHOICE(?InkoopList) % 2,-1,-1) ! Set color values for Pla2:Planning_TIME
      SELF.Q.Pla2:Planning_TIME_NormalBG   = CHOOSE(CHOICE(?InkoopList) % 2,-1,8454143)
      SELF.Q.Pla2:Planning_TIME_SelectedFG = CHOOSE(CHOICE(?InkoopList) % 2,-1,-1)
      SELF.Q.Pla2:Planning_TIME_SelectedBG = CHOOSE(CHOICE(?InkoopList) % 2,-1,-1)
      SELF.Q.LOC:InkoopPallets1_NormalFG   = CHOOSE(CHOICE(?InkoopList) % 2,-1,-1) ! Set color values for LOC:InkoopPallets1
      SELF.Q.LOC:InkoopPallets1_NormalBG   = CHOOSE(CHOICE(?InkoopList) % 2,-1,8454143)
      SELF.Q.LOC:InkoopPallets1_SelectedFG = CHOOSE(CHOICE(?InkoopList) % 2,-1,-1)
      SELF.Q.LOC:InkoopPallets1_SelectedBG = CHOOSE(CHOICE(?InkoopList) % 2,-1,-1)
      SELF.Q.Pla2:MutatieGemaakt_NormalFG   = CHOOSE(CHOICE(?InkoopList) % 2,-1,-1) ! Set color values for Pla2:MutatieGemaakt
      SELF.Q.Pla2:MutatieGemaakt_NormalBG   = CHOOSE(CHOICE(?InkoopList) % 2,-1,8454143)
      SELF.Q.Pla2:MutatieGemaakt_SelectedFG = CHOOSE(CHOICE(?InkoopList) % 2,-1,-1)
      SELF.Q.Pla2:MutatieGemaakt_SelectedBG = CHOOSE(CHOICE(?InkoopList) % 2,-1,-1)
      SELF.Q.Pla2:Geprint_NormalFG   = CHOOSE(CHOICE(?InkoopList) % 2,-1,-1) ! Set color values for Pla2:Geprint
      SELF.Q.Pla2:Geprint_NormalBG   = CHOOSE(CHOICE(?InkoopList) % 2,-1,8454143)
      SELF.Q.Pla2:Geprint_SelectedFG = CHOOSE(CHOICE(?InkoopList) % 2,-1,-1)
      SELF.Q.Pla2:Geprint_SelectedBG = CHOOSE(CHOICE(?InkoopList) % 2,-1,-1)
      SELF.Q.LOC:Getransferd_NormalFG   = CHOOSE(CHOICE(?InkoopList) % 2,-1,-1) ! Set color values for LOC:Getransferd
      SELF.Q.LOC:Getransferd_NormalBG   = CHOOSE(CHOICE(?InkoopList) % 2,-1,8454143)
      SELF.Q.LOC:Getransferd_SelectedFG = CHOOSE(CHOICE(?InkoopList) % 2,-1,-1)
      SELF.Q.LOC:Getransferd_SelectedBG = CHOOSE(CHOICE(?InkoopList) % 2,-1,-1)
      SELF.Q.Pla2:Verwerkt_NormalFG   = CHOOSE(CHOICE(?InkoopList) % 2,-1,-1) ! Set color values for Pla2:Verwerkt
      SELF.Q.Pla2:Verwerkt_NormalBG   = CHOOSE(CHOICE(?InkoopList) % 2,-1,8454143)
      SELF.Q.Pla2:Verwerkt_SelectedFG = CHOOSE(CHOICE(?InkoopList) % 2,-1,-1)
      SELF.Q.Pla2:Verwerkt_SelectedBG = CHOOSE(CHOICE(?InkoopList) % 2,-1,-1)
      SELF.Q.Pla2:Gewogen_NormalFG   = CHOOSE(CHOICE(?InkoopList) % 2,-1,-1) ! Set color values for Pla2:Gewogen
      SELF.Q.Pla2:Gewogen_NormalBG   = CHOOSE(CHOICE(?InkoopList) % 2,-1,8454143)
      SELF.Q.Pla2:Gewogen_SelectedFG = CHOOSE(CHOICE(?InkoopList) % 2,-1,-1)
      SELF.Q.Pla2:Gewogen_SelectedBG = CHOOSE(CHOICE(?InkoopList) % 2,-1,-1)
      SELF.Q.Pla2:CelOms_NormalFG   = CHOOSE(CHOICE(?InkoopList) % 2,-1,-1) ! Set color values for Pla2:CelOms
      SELF.Q.Pla2:CelOms_NormalBG   = CHOOSE(CHOICE(?InkoopList) % 2,-1,8454143)
      SELF.Q.Pla2:CelOms_SelectedFG = CHOOSE(CHOICE(?InkoopList) % 2,-1,-1)
      SELF.Q.Pla2:CelOms_SelectedBG = CHOOSE(CHOICE(?InkoopList) % 2,-1,-1)
      SELF.Q.Pla2:Locatienaam_NormalFG   = CHOOSE(CHOICE(?InkoopList) % 2,-1,-1) ! Set color values for Pla2:Locatienaam
      SELF.Q.Pla2:Locatienaam_NormalBG   = CHOOSE(CHOICE(?InkoopList) % 2,-1,8454143)
      SELF.Q.Pla2:Locatienaam_SelectedFG = CHOOSE(CHOICE(?InkoopList) % 2,-1,-1)
      SELF.Q.Pla2:Locatienaam_SelectedBG = CHOOSE(CHOICE(?InkoopList) % 2,-1,-1)
      SELF.Q.Pla2:Transport_NormalFG   = CHOOSE(CHOICE(?InkoopList) % 2,-1,-1) ! Set color values for Pla2:Transport
      SELF.Q.Pla2:Transport_NormalBG   = CHOOSE(CHOICE(?InkoopList) % 2,-1,8454143)
      SELF.Q.Pla2:Transport_SelectedFG = CHOOSE(CHOICE(?InkoopList) % 2,-1,-1)
      SELF.Q.Pla2:Transport_SelectedBG = CHOOSE(CHOICE(?InkoopList) % 2,-1,-1)
      SELF.Q.Pla2:PlanningID_NormalFG   = CHOOSE(CHOICE(?InkoopList) % 2,-1,-1) ! Set color values for Pla2:PlanningID
      SELF.Q.Pla2:PlanningID_NormalBG   = CHOOSE(CHOICE(?InkoopList) % 2,-1,8454143)
      SELF.Q.Pla2:PlanningID_SelectedFG = CHOOSE(CHOICE(?InkoopList) % 2,-1,-1)
      SELF.Q.Pla2:PlanningID_SelectedBG = CHOOSE(CHOICE(?InkoopList) % 2,-1,-1)
  !----------------------------------------------------------------------


BRW1.Fetch PROCEDURE(BYTE Direction)

GreenBarIndex   LONG,AUTO
  CODE
  PARENT.Fetch(Direction)
  !----------------------------------------------------------------------
    LOOP GreenBarIndex=1 TO RECORDS(SELF.Q)
      GET(SELF.Q,GreenBarIndex)
      SELF.Q.Pla3:ArtikelID_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for Pla3:ArtikelID
      SELF.Q.Pla3:ArtikelID_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.Pla3:ArtikelID_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla3:ArtikelID_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla3:ArtikelOms_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for Pla3:ArtikelOms
      SELF.Q.Pla3:ArtikelOms_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.Pla3:ArtikelOms_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla3:ArtikelOms_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla3:FirmaNaam_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for Pla3:FirmaNaam
      SELF.Q.Pla3:FirmaNaam_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.Pla3:FirmaNaam_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla3:FirmaNaam_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla3:PartijID_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for Pla3:PartijID
      SELF.Q.Pla3:PartijID_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.Pla3:PartijID_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla3:PartijID_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla3:ExternPartijnr_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for Pla3:ExternPartijnr
      SELF.Q.Pla3:ExternPartijnr_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.Pla3:ExternPartijnr_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla3:ExternPartijnr_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.LOC:VerkoopKG1_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for LOC:VerkoopKG1
      SELF.Q.LOC:VerkoopKG1_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.LOC:VerkoopKG1_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.LOC:VerkoopKG1_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla3:Instructie_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for Pla3:Instructie
      SELF.Q.Pla3:Instructie_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.Pla3:Instructie_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla3:Instructie_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla3:VerpakkingOmschrijving_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for Pla3:VerpakkingOmschrijving
      SELF.Q.Pla3:VerpakkingOmschrijving_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.Pla3:VerpakkingOmschrijving_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla3:VerpakkingOmschrijving_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla3:Planning_TIME_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for Pla3:Planning_TIME
      SELF.Q.Pla3:Planning_TIME_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.Pla3:Planning_TIME_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla3:Planning_TIME_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.LOC:VerkoopPallets1_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for LOC:VerkoopPallets1
      SELF.Q.LOC:VerkoopPallets1_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.LOC:VerkoopPallets1_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.LOC:VerkoopPallets1_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla3:MutatieGemaakt_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for Pla3:MutatieGemaakt
      SELF.Q.Pla3:MutatieGemaakt_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.Pla3:MutatieGemaakt_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla3:MutatieGemaakt_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla3:Geprint_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for Pla3:Geprint
      SELF.Q.Pla3:Geprint_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.Pla3:Geprint_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla3:Geprint_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla3:Verwerkt_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for Pla3:Verwerkt
      SELF.Q.Pla3:Verwerkt_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.Pla3:Verwerkt_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla3:Verwerkt_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla3:Gewogen_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for Pla3:Gewogen
      SELF.Q.Pla3:Gewogen_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.Pla3:Gewogen_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla3:Gewogen_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla3:CelOms_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for Pla3:CelOms
      SELF.Q.Pla3:CelOms_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.Pla3:CelOms_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla3:CelOms_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.LOC:Locatienaam_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for LOC:Locatienaam
      SELF.Q.LOC:Locatienaam_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.LOC:Locatienaam_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.LOC:Locatienaam_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla3:HerkomstOverboekingCelOms_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for Pla3:HerkomstOverboekingCelOms
      SELF.Q.Pla3:HerkomstOverboekingCelOms_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.Pla3:HerkomstOverboekingCelOms_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla3:HerkomstOverboekingCelOms_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla3:LeverancierFirmaNaam_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for Pla3:LeverancierFirmaNaam
      SELF.Q.Pla3:LeverancierFirmaNaam_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.Pla3:LeverancierFirmaNaam_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla3:LeverancierFirmaNaam_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla3:Transport_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for Pla3:Transport
      SELF.Q.Pla3:Transport_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.Pla3:Transport_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla3:Transport_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla3:PlanningID_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for Pla3:PlanningID
      SELF.Q.Pla3:PlanningID_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.Pla3:PlanningID_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla3:PlanningID_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      PUT(SELF.Q)
    END
  !----------------------------------------------------------------------


BRW1.ResetQueue PROCEDURE(BYTE ResetMode)

  CODE
  db.DebugOut('START DUUR PlanningVerkoop.ResetQueue')
  pre_timing# = CLOCK()
  PARENT.ResetQueue(ResetMode)
  post_timing# = CLOCK()
  db.DebugOut('METING DUUR PlanningVerkoop.ResetQueue : ' & (post_timing# - pre_timing#))


BRW1.SetQueueRecord PROCEDURE

  CODE
  LOC:Locatienaam = CachingClass.GetCelLocatieNaam(Pla3:PartijID,Pla3:CelID)
  
  IF Pla3:MutatieGemaakt THEN
  	LOC:VerkoopKG1 = Pla3:MutatieKG
  	LOC:VerkoopPallets1 = Pla3:MutatiePallets
  ELSE
  	LOC:VerkoopKG1 = Pla3:KG
  	LOC:VerkoopPallets1 = Pla3:Pallets
  END
  PARENT.SetQueueRecord
  
  CLEAR (SELF.Q.Pla3:Instructie_Tip)
  IF (Pla3:MutatieGemaakt)
    SELF.Q.Pla3:MutatieGemaakt_Icon = 2                    ! Set icon from icon list
  ELSE
    SELF.Q.Pla3:MutatieGemaakt_Icon = 1                    ! Set icon from icon list
  END
  IF (Pla3:Geprint)
    SELF.Q.Pla3:Geprint_Icon = 2                           ! Set icon from icon list
  ELSE
    SELF.Q.Pla3:Geprint_Icon = 1                           ! Set icon from icon list
  END
  IF (Pla3:Verwerkt)
    SELF.Q.Pla3:Verwerkt_Icon = 2                          ! Set icon from icon list
  ELSE
    SELF.Q.Pla3:Verwerkt_Icon = 1                          ! Set icon from icon list
  END
  IF (Pla3:Gewogen)
    SELF.Q.Pla3:Gewogen_Icon = 2                           ! Set icon from icon list
  ELSE
    SELF.Q.Pla3:Gewogen_Icon = 1                           ! Set icon from icon list
  END
  CLEAR (SELF.Q.Pla3:Transport_Tip)
  CLEAR (SELF.Q.Pla3:PlanningID_Tip)
  !----------------------------------------------------------------------
      SELF.Q.Pla3:ArtikelID_NormalFG   = CHOOSE(CHOICE(?VerkoopList) % 2,-1,-1) ! Set color values for Pla3:ArtikelID
      SELF.Q.Pla3:ArtikelID_NormalBG   = CHOOSE(CHOICE(?VerkoopList) % 2,-1,8454143)
      SELF.Q.Pla3:ArtikelID_SelectedFG = CHOOSE(CHOICE(?VerkoopList) % 2,-1,-1)
      SELF.Q.Pla3:ArtikelID_SelectedBG = CHOOSE(CHOICE(?VerkoopList) % 2,-1,-1)
      SELF.Q.Pla3:ArtikelOms_NormalFG   = CHOOSE(CHOICE(?VerkoopList) % 2,-1,-1) ! Set color values for Pla3:ArtikelOms
      SELF.Q.Pla3:ArtikelOms_NormalBG   = CHOOSE(CHOICE(?VerkoopList) % 2,-1,8454143)
      SELF.Q.Pla3:ArtikelOms_SelectedFG = CHOOSE(CHOICE(?VerkoopList) % 2,-1,-1)
      SELF.Q.Pla3:ArtikelOms_SelectedBG = CHOOSE(CHOICE(?VerkoopList) % 2,-1,-1)
      SELF.Q.Pla3:FirmaNaam_NormalFG   = CHOOSE(CHOICE(?VerkoopList) % 2,-1,-1) ! Set color values for Pla3:FirmaNaam
      SELF.Q.Pla3:FirmaNaam_NormalBG   = CHOOSE(CHOICE(?VerkoopList) % 2,-1,8454143)
      SELF.Q.Pla3:FirmaNaam_SelectedFG = CHOOSE(CHOICE(?VerkoopList) % 2,-1,-1)
      SELF.Q.Pla3:FirmaNaam_SelectedBG = CHOOSE(CHOICE(?VerkoopList) % 2,-1,-1)
      SELF.Q.Pla3:PartijID_NormalFG   = CHOOSE(CHOICE(?VerkoopList) % 2,-1,-1) ! Set color values for Pla3:PartijID
      SELF.Q.Pla3:PartijID_NormalBG   = CHOOSE(CHOICE(?VerkoopList) % 2,-1,8454143)
      SELF.Q.Pla3:PartijID_SelectedFG = CHOOSE(CHOICE(?VerkoopList) % 2,-1,-1)
      SELF.Q.Pla3:PartijID_SelectedBG = CHOOSE(CHOICE(?VerkoopList) % 2,-1,-1)
      SELF.Q.Pla3:ExternPartijnr_NormalFG   = CHOOSE(CHOICE(?VerkoopList) % 2,-1,-1) ! Set color values for Pla3:ExternPartijnr
      SELF.Q.Pla3:ExternPartijnr_NormalBG   = CHOOSE(CHOICE(?VerkoopList) % 2,-1,8454143)
      SELF.Q.Pla3:ExternPartijnr_SelectedFG = CHOOSE(CHOICE(?VerkoopList) % 2,-1,-1)
      SELF.Q.Pla3:ExternPartijnr_SelectedBG = CHOOSE(CHOICE(?VerkoopList) % 2,-1,-1)
      SELF.Q.LOC:VerkoopKG1_NormalFG   = CHOOSE(CHOICE(?VerkoopList) % 2,-1,-1) ! Set color values for LOC:VerkoopKG1
      SELF.Q.LOC:VerkoopKG1_NormalBG   = CHOOSE(CHOICE(?VerkoopList) % 2,-1,8454143)
      SELF.Q.LOC:VerkoopKG1_SelectedFG = CHOOSE(CHOICE(?VerkoopList) % 2,-1,-1)
      SELF.Q.LOC:VerkoopKG1_SelectedBG = CHOOSE(CHOICE(?VerkoopList) % 2,-1,-1)
      SELF.Q.Pla3:Instructie_NormalFG   = CHOOSE(CHOICE(?VerkoopList) % 2,-1,-1) ! Set color values for Pla3:Instructie
      SELF.Q.Pla3:Instructie_NormalBG   = CHOOSE(CHOICE(?VerkoopList) % 2,-1,8454143)
      SELF.Q.Pla3:Instructie_SelectedFG = CHOOSE(CHOICE(?VerkoopList) % 2,-1,-1)
      SELF.Q.Pla3:Instructie_SelectedBG = CHOOSE(CHOICE(?VerkoopList) % 2,-1,-1)
      SELF.Q.Pla3:VerpakkingOmschrijving_NormalFG   = CHOOSE(CHOICE(?VerkoopList) % 2,-1,-1) ! Set color values for Pla3:VerpakkingOmschrijving
      SELF.Q.Pla3:VerpakkingOmschrijving_NormalBG   = CHOOSE(CHOICE(?VerkoopList) % 2,-1,8454143)
      SELF.Q.Pla3:VerpakkingOmschrijving_SelectedFG = CHOOSE(CHOICE(?VerkoopList) % 2,-1,-1)
      SELF.Q.Pla3:VerpakkingOmschrijving_SelectedBG = CHOOSE(CHOICE(?VerkoopList) % 2,-1,-1)
      SELF.Q.Pla3:Planning_TIME_NormalFG   = CHOOSE(CHOICE(?VerkoopList) % 2,-1,-1) ! Set color values for Pla3:Planning_TIME
      SELF.Q.Pla3:Planning_TIME_NormalBG   = CHOOSE(CHOICE(?VerkoopList) % 2,-1,8454143)
      SELF.Q.Pla3:Planning_TIME_SelectedFG = CHOOSE(CHOICE(?VerkoopList) % 2,-1,-1)
      SELF.Q.Pla3:Planning_TIME_SelectedBG = CHOOSE(CHOICE(?VerkoopList) % 2,-1,-1)
      SELF.Q.LOC:VerkoopPallets1_NormalFG   = CHOOSE(CHOICE(?VerkoopList) % 2,-1,-1) ! Set color values for LOC:VerkoopPallets1
      SELF.Q.LOC:VerkoopPallets1_NormalBG   = CHOOSE(CHOICE(?VerkoopList) % 2,-1,8454143)
      SELF.Q.LOC:VerkoopPallets1_SelectedFG = CHOOSE(CHOICE(?VerkoopList) % 2,-1,-1)
      SELF.Q.LOC:VerkoopPallets1_SelectedBG = CHOOSE(CHOICE(?VerkoopList) % 2,-1,-1)
      SELF.Q.Pla3:MutatieGemaakt_NormalFG   = CHOOSE(CHOICE(?VerkoopList) % 2,-1,-1) ! Set color values for Pla3:MutatieGemaakt
      SELF.Q.Pla3:MutatieGemaakt_NormalBG   = CHOOSE(CHOICE(?VerkoopList) % 2,-1,8454143)
      SELF.Q.Pla3:MutatieGemaakt_SelectedFG = CHOOSE(CHOICE(?VerkoopList) % 2,-1,-1)
      SELF.Q.Pla3:MutatieGemaakt_SelectedBG = CHOOSE(CHOICE(?VerkoopList) % 2,-1,-1)
      SELF.Q.Pla3:Geprint_NormalFG   = CHOOSE(CHOICE(?VerkoopList) % 2,-1,-1) ! Set color values for Pla3:Geprint
      SELF.Q.Pla3:Geprint_NormalBG   = CHOOSE(CHOICE(?VerkoopList) % 2,-1,8454143)
      SELF.Q.Pla3:Geprint_SelectedFG = CHOOSE(CHOICE(?VerkoopList) % 2,-1,-1)
      SELF.Q.Pla3:Geprint_SelectedBG = CHOOSE(CHOICE(?VerkoopList) % 2,-1,-1)
      SELF.Q.Pla3:Verwerkt_NormalFG   = CHOOSE(CHOICE(?VerkoopList) % 2,-1,-1) ! Set color values for Pla3:Verwerkt
      SELF.Q.Pla3:Verwerkt_NormalBG   = CHOOSE(CHOICE(?VerkoopList) % 2,-1,8454143)
      SELF.Q.Pla3:Verwerkt_SelectedFG = CHOOSE(CHOICE(?VerkoopList) % 2,-1,-1)
      SELF.Q.Pla3:Verwerkt_SelectedBG = CHOOSE(CHOICE(?VerkoopList) % 2,-1,-1)
      SELF.Q.Pla3:Gewogen_NormalFG   = CHOOSE(CHOICE(?VerkoopList) % 2,-1,-1) ! Set color values for Pla3:Gewogen
      SELF.Q.Pla3:Gewogen_NormalBG   = CHOOSE(CHOICE(?VerkoopList) % 2,-1,8454143)
      SELF.Q.Pla3:Gewogen_SelectedFG = CHOOSE(CHOICE(?VerkoopList) % 2,-1,-1)
      SELF.Q.Pla3:Gewogen_SelectedBG = CHOOSE(CHOICE(?VerkoopList) % 2,-1,-1)
      SELF.Q.Pla3:CelOms_NormalFG   = CHOOSE(CHOICE(?VerkoopList) % 2,-1,-1) ! Set color values for Pla3:CelOms
      SELF.Q.Pla3:CelOms_NormalBG   = CHOOSE(CHOICE(?VerkoopList) % 2,-1,8454143)
      SELF.Q.Pla3:CelOms_SelectedFG = CHOOSE(CHOICE(?VerkoopList) % 2,-1,-1)
      SELF.Q.Pla3:CelOms_SelectedBG = CHOOSE(CHOICE(?VerkoopList) % 2,-1,-1)
      SELF.Q.LOC:Locatienaam_NormalFG   = CHOOSE(CHOICE(?VerkoopList) % 2,-1,-1) ! Set color values for LOC:Locatienaam
      SELF.Q.LOC:Locatienaam_NormalBG   = CHOOSE(CHOICE(?VerkoopList) % 2,-1,8454143)
      SELF.Q.LOC:Locatienaam_SelectedFG = CHOOSE(CHOICE(?VerkoopList) % 2,-1,-1)
      SELF.Q.LOC:Locatienaam_SelectedBG = CHOOSE(CHOICE(?VerkoopList) % 2,-1,-1)
      SELF.Q.Pla3:HerkomstOverboekingCelOms_NormalFG   = CHOOSE(CHOICE(?VerkoopList) % 2,-1,-1) ! Set color values for Pla3:HerkomstOverboekingCelOms
      SELF.Q.Pla3:HerkomstOverboekingCelOms_NormalBG   = CHOOSE(CHOICE(?VerkoopList) % 2,-1,8454143)
      SELF.Q.Pla3:HerkomstOverboekingCelOms_SelectedFG = CHOOSE(CHOICE(?VerkoopList) % 2,-1,-1)
      SELF.Q.Pla3:HerkomstOverboekingCelOms_SelectedBG = CHOOSE(CHOICE(?VerkoopList) % 2,-1,-1)
      SELF.Q.Pla3:LeverancierFirmaNaam_NormalFG   = CHOOSE(CHOICE(?VerkoopList) % 2,-1,-1) ! Set color values for Pla3:LeverancierFirmaNaam
      SELF.Q.Pla3:LeverancierFirmaNaam_NormalBG   = CHOOSE(CHOICE(?VerkoopList) % 2,-1,8454143)
      SELF.Q.Pla3:LeverancierFirmaNaam_SelectedFG = CHOOSE(CHOICE(?VerkoopList) % 2,-1,-1)
      SELF.Q.Pla3:LeverancierFirmaNaam_SelectedBG = CHOOSE(CHOICE(?VerkoopList) % 2,-1,-1)
      SELF.Q.Pla3:Transport_NormalFG   = CHOOSE(CHOICE(?VerkoopList) % 2,-1,-1) ! Set color values for Pla3:Transport
      SELF.Q.Pla3:Transport_NormalBG   = CHOOSE(CHOICE(?VerkoopList) % 2,-1,8454143)
      SELF.Q.Pla3:Transport_SelectedFG = CHOOSE(CHOICE(?VerkoopList) % 2,-1,-1)
      SELF.Q.Pla3:Transport_SelectedBG = CHOOSE(CHOICE(?VerkoopList) % 2,-1,-1)
      SELF.Q.Pla3:PlanningID_NormalFG   = CHOOSE(CHOICE(?VerkoopList) % 2,-1,-1) ! Set color values for Pla3:PlanningID
      SELF.Q.Pla3:PlanningID_NormalBG   = CHOOSE(CHOICE(?VerkoopList) % 2,-1,8454143)
      SELF.Q.Pla3:PlanningID_SelectedFG = CHOOSE(CHOICE(?VerkoopList) % 2,-1,-1)
      SELF.Q.Pla3:PlanningID_SelectedBG = CHOOSE(CHOICE(?VerkoopList) % 2,-1,-1)
  !----------------------------------------------------------------------
  If SELF.Q.LOC:VerkoopKG1<0
  	Self.Q.LOC:VerkoopKG1_NormalFG   = Color:Red
  	Self.Q.LOC:VerkoopKG1_NormalBG   = Color:Red
  	Self.Q.LOC:VerkoopKG1_SelectedFG = Color:Red
  	Self.Q.LOC:VerkoopKG1_SelectedBG = Color:Red
  	Self.Q.LOC:VerkoopPallets1_NormalFG   = Color:Red
  	Self.Q.LOC:VerkoopPallets1_SelectedFG = Color:Red
  END


BRW8.Fetch PROCEDURE(BYTE Direction)

GreenBarIndex   LONG,AUTO
  CODE
  PARENT.Fetch(Direction)
  !----------------------------------------------------------------------
    LOOP GreenBarIndex=1 TO RECORDS(SELF.Q)
      GET(SELF.Q,GreenBarIndex)
      SELF.Q.Pla4:ArtikelID_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for Pla4:ArtikelID
      SELF.Q.Pla4:ArtikelID_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.Pla4:ArtikelID_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla4:ArtikelID_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla4:ArtikelOms_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for Pla4:ArtikelOms
      SELF.Q.Pla4:ArtikelOms_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.Pla4:ArtikelOms_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla4:ArtikelOms_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla4:FirmaNaam_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for Pla4:FirmaNaam
      SELF.Q.Pla4:FirmaNaam_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.Pla4:FirmaNaam_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla4:FirmaNaam_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla4:PartijID_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for Pla4:PartijID
      SELF.Q.Pla4:PartijID_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.Pla4:PartijID_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla4:PartijID_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla4:ExternPartijnr_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for Pla4:ExternPartijnr
      SELF.Q.Pla4:ExternPartijnr_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.Pla4:ExternPartijnr_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla4:ExternPartijnr_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.LOC:OverboekingKG1_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for LOC:OverboekingKG1
      SELF.Q.LOC:OverboekingKG1_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.LOC:OverboekingKG1_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.LOC:OverboekingKG1_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.APla4:OverboekSoort_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for APla4:OverboekSoort
      SELF.Q.APla4:OverboekSoort_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.APla4:OverboekSoort_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.APla4:OverboekSoort_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla4:Instructie_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for Pla4:Instructie
      SELF.Q.Pla4:Instructie_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.Pla4:Instructie_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla4:Instructie_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla4:VerpakkingOmschrijving_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for Pla4:VerpakkingOmschrijving
      SELF.Q.Pla4:VerpakkingOmschrijving_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.Pla4:VerpakkingOmschrijving_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla4:VerpakkingOmschrijving_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla4:Planning_TIME_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for Pla4:Planning_TIME
      SELF.Q.Pla4:Planning_TIME_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.Pla4:Planning_TIME_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla4:Planning_TIME_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.LOC:OverboekingPallets1_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for LOC:OverboekingPallets1
      SELF.Q.LOC:OverboekingPallets1_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.LOC:OverboekingPallets1_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.LOC:OverboekingPallets1_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla4:MutatieGemaakt_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for Pla4:MutatieGemaakt
      SELF.Q.Pla4:MutatieGemaakt_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.Pla4:MutatieGemaakt_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla4:MutatieGemaakt_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.LOC:Getransferd_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for LOC:Getransferd
      SELF.Q.LOC:Getransferd_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.LOC:Getransferd_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.LOC:Getransferd_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla4:Verwerkt_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for Pla4:Verwerkt
      SELF.Q.Pla4:Verwerkt_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.Pla4:Verwerkt_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla4:Verwerkt_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla4:CelOms_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for Pla4:CelOms
      SELF.Q.Pla4:CelOms_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.Pla4:CelOms_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla4:CelOms_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla4:Locatienaam_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for Pla4:Locatienaam
      SELF.Q.Pla4:Locatienaam_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.Pla4:Locatienaam_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla4:Locatienaam_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla4:NaarCelOms_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for Pla4:NaarCelOms
      SELF.Q.Pla4:NaarCelOms_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.Pla4:NaarCelOms_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla4:NaarCelOms_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.APla4:NaarLocatienaam_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for APla4:NaarLocatienaam
      SELF.Q.APla4:NaarLocatienaam_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.APla4:NaarLocatienaam_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.APla4:NaarLocatienaam_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla4:Transport_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for Pla4:Transport
      SELF.Q.Pla4:Transport_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.Pla4:Transport_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla4:Transport_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      PUT(SELF.Q)
    END
  !----------------------------------------------------------------------


BRW8.ResetQueue PROCEDURE(BYTE ResetMode)

  CODE
  db.DebugOut('START DUUR PlanningOverboeking.ResetQueue')
  pre_timing# = CLOCK()
  PARENT.ResetQueue(ResetMode)
  post_timing# = CLOCK()
  db.DebugOut('METING DUUR PlanningOverboeking.ResetQueue : ' & (post_timing# - pre_timing#))


BRW8.SetQueueRecord PROCEDURE

  CODE
  LOC:Getransferd = ThisWindow.GetGetransferd(Pla4:PlanningID)
  
  IF Pla4:MutatieGemaakt THEN
  	LOC:OverboekingKG1 = Pla4:MutatieKG
  	LOC:OverboekingPallets1 = Pla4:MutatiePallets
  ELSE
  	LOC:OverboekingKG1 = Pla4:KG
  	LOC:OverboekingPallets1 = Pla4:Pallets
  END
  PARENT.SetQueueRecord
  
  IF (Pla4:MutatieGemaakt)
    SELF.Q.Pla4:MutatieGemaakt_Icon = 2                    ! Set icon from icon list
  ELSE
    SELF.Q.Pla4:MutatieGemaakt_Icon = 1                    ! Set icon from icon list
  END
  IF (LOC:Getransferd)
    SELF.Q.LOC:Getransferd_Icon = 2                        ! Set icon from icon list
  ELSE
    SELF.Q.LOC:Getransferd_Icon = 1                        ! Set icon from icon list
  END
  IF (Pla4:Verwerkt)
    SELF.Q.Pla4:Verwerkt_Icon = 2                          ! Set icon from icon list
  ELSE
    SELF.Q.Pla4:Verwerkt_Icon = 1                          ! Set icon from icon list
  END
  !----------------------------------------------------------------------
      SELF.Q.Pla4:ArtikelID_NormalFG   = CHOOSE(CHOICE(?OverboekList) % 2,-1,-1) ! Set color values for Pla4:ArtikelID
      SELF.Q.Pla4:ArtikelID_NormalBG   = CHOOSE(CHOICE(?OverboekList) % 2,-1,8454143)
      SELF.Q.Pla4:ArtikelID_SelectedFG = CHOOSE(CHOICE(?OverboekList) % 2,-1,-1)
      SELF.Q.Pla4:ArtikelID_SelectedBG = CHOOSE(CHOICE(?OverboekList) % 2,-1,-1)
      SELF.Q.Pla4:ArtikelOms_NormalFG   = CHOOSE(CHOICE(?OverboekList) % 2,-1,-1) ! Set color values for Pla4:ArtikelOms
      SELF.Q.Pla4:ArtikelOms_NormalBG   = CHOOSE(CHOICE(?OverboekList) % 2,-1,8454143)
      SELF.Q.Pla4:ArtikelOms_SelectedFG = CHOOSE(CHOICE(?OverboekList) % 2,-1,-1)
      SELF.Q.Pla4:ArtikelOms_SelectedBG = CHOOSE(CHOICE(?OverboekList) % 2,-1,-1)
      SELF.Q.Pla4:FirmaNaam_NormalFG   = CHOOSE(CHOICE(?OverboekList) % 2,-1,-1) ! Set color values for Pla4:FirmaNaam
      SELF.Q.Pla4:FirmaNaam_NormalBG   = CHOOSE(CHOICE(?OverboekList) % 2,-1,8454143)
      SELF.Q.Pla4:FirmaNaam_SelectedFG = CHOOSE(CHOICE(?OverboekList) % 2,-1,-1)
      SELF.Q.Pla4:FirmaNaam_SelectedBG = CHOOSE(CHOICE(?OverboekList) % 2,-1,-1)
      SELF.Q.Pla4:PartijID_NormalFG   = CHOOSE(CHOICE(?OverboekList) % 2,-1,-1) ! Set color values for Pla4:PartijID
      SELF.Q.Pla4:PartijID_NormalBG   = CHOOSE(CHOICE(?OverboekList) % 2,-1,8454143)
      SELF.Q.Pla4:PartijID_SelectedFG = CHOOSE(CHOICE(?OverboekList) % 2,-1,-1)
      SELF.Q.Pla4:PartijID_SelectedBG = CHOOSE(CHOICE(?OverboekList) % 2,-1,-1)
      SELF.Q.Pla4:ExternPartijnr_NormalFG   = CHOOSE(CHOICE(?OverboekList) % 2,-1,-1) ! Set color values for Pla4:ExternPartijnr
      SELF.Q.Pla4:ExternPartijnr_NormalBG   = CHOOSE(CHOICE(?OverboekList) % 2,-1,8454143)
      SELF.Q.Pla4:ExternPartijnr_SelectedFG = CHOOSE(CHOICE(?OverboekList) % 2,-1,-1)
      SELF.Q.Pla4:ExternPartijnr_SelectedBG = CHOOSE(CHOICE(?OverboekList) % 2,-1,-1)
      SELF.Q.LOC:OverboekingKG1_NormalFG   = CHOOSE(CHOICE(?OverboekList) % 2,-1,-1) ! Set color values for LOC:OverboekingKG1
      SELF.Q.LOC:OverboekingKG1_NormalBG   = CHOOSE(CHOICE(?OverboekList) % 2,-1,8454143)
      SELF.Q.LOC:OverboekingKG1_SelectedFG = CHOOSE(CHOICE(?OverboekList) % 2,-1,-1)
      SELF.Q.LOC:OverboekingKG1_SelectedBG = CHOOSE(CHOICE(?OverboekList) % 2,-1,-1)
      SELF.Q.APla4:OverboekSoort_NormalFG   = CHOOSE(CHOICE(?OverboekList) % 2,-1,-1) ! Set color values for APla4:OverboekSoort
      SELF.Q.APla4:OverboekSoort_NormalBG   = CHOOSE(CHOICE(?OverboekList) % 2,-1,8454143)
      SELF.Q.APla4:OverboekSoort_SelectedFG = CHOOSE(CHOICE(?OverboekList) % 2,-1,-1)
      SELF.Q.APla4:OverboekSoort_SelectedBG = CHOOSE(CHOICE(?OverboekList) % 2,-1,-1)
      SELF.Q.Pla4:Instructie_NormalFG   = CHOOSE(CHOICE(?OverboekList) % 2,-1,-1) ! Set color values for Pla4:Instructie
      SELF.Q.Pla4:Instructie_NormalBG   = CHOOSE(CHOICE(?OverboekList) % 2,-1,8454143)
      SELF.Q.Pla4:Instructie_SelectedFG = CHOOSE(CHOICE(?OverboekList) % 2,-1,-1)
      SELF.Q.Pla4:Instructie_SelectedBG = CHOOSE(CHOICE(?OverboekList) % 2,-1,-1)
      SELF.Q.Pla4:VerpakkingOmschrijving_NormalFG   = CHOOSE(CHOICE(?OverboekList) % 2,-1,-1) ! Set color values for Pla4:VerpakkingOmschrijving
      SELF.Q.Pla4:VerpakkingOmschrijving_NormalBG   = CHOOSE(CHOICE(?OverboekList) % 2,-1,8454143)
      SELF.Q.Pla4:VerpakkingOmschrijving_SelectedFG = CHOOSE(CHOICE(?OverboekList) % 2,-1,-1)
      SELF.Q.Pla4:VerpakkingOmschrijving_SelectedBG = CHOOSE(CHOICE(?OverboekList) % 2,-1,-1)
      SELF.Q.Pla4:Planning_TIME_NormalFG   = CHOOSE(CHOICE(?OverboekList) % 2,-1,-1) ! Set color values for Pla4:Planning_TIME
      SELF.Q.Pla4:Planning_TIME_NormalBG   = CHOOSE(CHOICE(?OverboekList) % 2,-1,8454143)
      SELF.Q.Pla4:Planning_TIME_SelectedFG = CHOOSE(CHOICE(?OverboekList) % 2,-1,-1)
      SELF.Q.Pla4:Planning_TIME_SelectedBG = CHOOSE(CHOICE(?OverboekList) % 2,-1,-1)
      SELF.Q.LOC:OverboekingPallets1_NormalFG   = CHOOSE(CHOICE(?OverboekList) % 2,-1,-1) ! Set color values for LOC:OverboekingPallets1
      SELF.Q.LOC:OverboekingPallets1_NormalBG   = CHOOSE(CHOICE(?OverboekList) % 2,-1,8454143)
      SELF.Q.LOC:OverboekingPallets1_SelectedFG = CHOOSE(CHOICE(?OverboekList) % 2,-1,-1)
      SELF.Q.LOC:OverboekingPallets1_SelectedBG = CHOOSE(CHOICE(?OverboekList) % 2,-1,-1)
      SELF.Q.Pla4:MutatieGemaakt_NormalFG   = CHOOSE(CHOICE(?OverboekList) % 2,-1,-1) ! Set color values for Pla4:MutatieGemaakt
      SELF.Q.Pla4:MutatieGemaakt_NormalBG   = CHOOSE(CHOICE(?OverboekList) % 2,-1,8454143)
      SELF.Q.Pla4:MutatieGemaakt_SelectedFG = CHOOSE(CHOICE(?OverboekList) % 2,-1,-1)
      SELF.Q.Pla4:MutatieGemaakt_SelectedBG = CHOOSE(CHOICE(?OverboekList) % 2,-1,-1)
      SELF.Q.LOC:Getransferd_NormalFG   = CHOOSE(CHOICE(?OverboekList) % 2,-1,-1) ! Set color values for LOC:Getransferd
      SELF.Q.LOC:Getransferd_NormalBG   = CHOOSE(CHOICE(?OverboekList) % 2,-1,8454143)
      SELF.Q.LOC:Getransferd_SelectedFG = CHOOSE(CHOICE(?OverboekList) % 2,-1,-1)
      SELF.Q.LOC:Getransferd_SelectedBG = CHOOSE(CHOICE(?OverboekList) % 2,-1,-1)
      SELF.Q.Pla4:Verwerkt_NormalFG   = CHOOSE(CHOICE(?OverboekList) % 2,-1,-1) ! Set color values for Pla4:Verwerkt
      SELF.Q.Pla4:Verwerkt_NormalBG   = CHOOSE(CHOICE(?OverboekList) % 2,-1,8454143)
      SELF.Q.Pla4:Verwerkt_SelectedFG = CHOOSE(CHOICE(?OverboekList) % 2,-1,-1)
      SELF.Q.Pla4:Verwerkt_SelectedBG = CHOOSE(CHOICE(?OverboekList) % 2,-1,-1)
      SELF.Q.Pla4:CelOms_NormalFG   = CHOOSE(CHOICE(?OverboekList) % 2,-1,-1) ! Set color values for Pla4:CelOms
      SELF.Q.Pla4:CelOms_NormalBG   = CHOOSE(CHOICE(?OverboekList) % 2,-1,8454143)
      SELF.Q.Pla4:CelOms_SelectedFG = CHOOSE(CHOICE(?OverboekList) % 2,-1,-1)
      SELF.Q.Pla4:CelOms_SelectedBG = CHOOSE(CHOICE(?OverboekList) % 2,-1,-1)
      SELF.Q.Pla4:Locatienaam_NormalFG   = CHOOSE(CHOICE(?OverboekList) % 2,-1,-1) ! Set color values for Pla4:Locatienaam
      SELF.Q.Pla4:Locatienaam_NormalBG   = CHOOSE(CHOICE(?OverboekList) % 2,-1,8454143)
      SELF.Q.Pla4:Locatienaam_SelectedFG = CHOOSE(CHOICE(?OverboekList) % 2,-1,-1)
      SELF.Q.Pla4:Locatienaam_SelectedBG = CHOOSE(CHOICE(?OverboekList) % 2,-1,-1)
      SELF.Q.Pla4:NaarCelOms_NormalFG   = CHOOSE(CHOICE(?OverboekList) % 2,-1,-1) ! Set color values for Pla4:NaarCelOms
      SELF.Q.Pla4:NaarCelOms_NormalBG   = CHOOSE(CHOICE(?OverboekList) % 2,-1,8454143)
      SELF.Q.Pla4:NaarCelOms_SelectedFG = CHOOSE(CHOICE(?OverboekList) % 2,-1,-1)
      SELF.Q.Pla4:NaarCelOms_SelectedBG = CHOOSE(CHOICE(?OverboekList) % 2,-1,-1)
      SELF.Q.APla4:NaarLocatienaam_NormalFG   = CHOOSE(CHOICE(?OverboekList) % 2,-1,-1) ! Set color values for APla4:NaarLocatienaam
      SELF.Q.APla4:NaarLocatienaam_NormalBG   = CHOOSE(CHOICE(?OverboekList) % 2,-1,8454143)
      SELF.Q.APla4:NaarLocatienaam_SelectedFG = CHOOSE(CHOICE(?OverboekList) % 2,-1,-1)
      SELF.Q.APla4:NaarLocatienaam_SelectedBG = CHOOSE(CHOICE(?OverboekList) % 2,-1,-1)
      SELF.Q.Pla4:Transport_NormalFG   = CHOOSE(CHOICE(?OverboekList) % 2,-1,-1) ! Set color values for Pla4:Transport
      SELF.Q.Pla4:Transport_NormalBG   = CHOOSE(CHOICE(?OverboekList) % 2,-1,8454143)
      SELF.Q.Pla4:Transport_SelectedFG = CHOOSE(CHOICE(?OverboekList) % 2,-1,-1)
      SELF.Q.Pla4:Transport_SelectedBG = CHOOSE(CHOICE(?OverboekList) % 2,-1,-1)
  !----------------------------------------------------------------------


BRW3.Fetch PROCEDURE(BYTE Direction)

GreenBarIndex   LONG,AUTO
  CODE
  PARENT.Fetch(Direction)
  !----------------------------------------------------------------------
    LOOP GreenBarIndex=1 TO RECORDS(SELF.Q)
      GET(SELF.Q,GreenBarIndex)
      SELF.Q.APla2:ArtikelID_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for APla2:ArtikelID
      SELF.Q.APla2:ArtikelID_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.APla2:ArtikelID_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.APla2:ArtikelID_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.APla2:ArtikelOms_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for APla2:ArtikelOms
      SELF.Q.APla2:ArtikelOms_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.APla2:ArtikelOms_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.APla2:ArtikelOms_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.APla2:FirmaNaam_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for APla2:FirmaNaam
      SELF.Q.APla2:FirmaNaam_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.APla2:FirmaNaam_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.APla2:FirmaNaam_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.LOC:InkoopKG2_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for LOC:InkoopKG2
      SELF.Q.LOC:InkoopKG2_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.LOC:InkoopKG2_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.LOC:InkoopKG2_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.APla2:Instructie_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for APla2:Instructie
      SELF.Q.APla2:Instructie_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.APla2:Instructie_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.APla2:Instructie_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.APla2:VerpakkingOmschrijving_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for APla2:VerpakkingOmschrijving
      SELF.Q.APla2:VerpakkingOmschrijving_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.APla2:VerpakkingOmschrijving_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.APla2:VerpakkingOmschrijving_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.APla2:Planning_TIME_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for APla2:Planning_TIME
      SELF.Q.APla2:Planning_TIME_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.APla2:Planning_TIME_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.APla2:Planning_TIME_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.LOC:InkoopPallets2_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for LOC:InkoopPallets2
      SELF.Q.LOC:InkoopPallets2_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.LOC:InkoopPallets2_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.LOC:InkoopPallets2_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.APla2:MutatieGemaakt_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for APla2:MutatieGemaakt
      SELF.Q.APla2:MutatieGemaakt_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.APla2:MutatieGemaakt_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.APla2:MutatieGemaakt_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.APla2:Geprint_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for APla2:Geprint
      SELF.Q.APla2:Geprint_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.APla2:Geprint_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.APla2:Geprint_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.LOC:Getransferd_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for LOC:Getransferd
      SELF.Q.LOC:Getransferd_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.LOC:Getransferd_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.LOC:Getransferd_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.APla2:Verwerkt_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for APla2:Verwerkt
      SELF.Q.APla2:Verwerkt_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.APla2:Verwerkt_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.APla2:Verwerkt_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.APla2:Gewogen_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for APla2:Gewogen
      SELF.Q.APla2:Gewogen_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.APla2:Gewogen_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.APla2:Gewogen_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.APla2:CelOms_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for APla2:CelOms
      SELF.Q.APla2:CelOms_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.APla2:CelOms_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.APla2:CelOms_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.APla2:Locatienaam_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for APla2:Locatienaam
      SELF.Q.APla2:Locatienaam_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.APla2:Locatienaam_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.APla2:Locatienaam_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.APla2:Transport_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for APla2:Transport
      SELF.Q.APla2:Transport_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.APla2:Transport_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.APla2:Transport_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.APla2:PlanningID_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for APla2:PlanningID
      SELF.Q.APla2:PlanningID_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.APla2:PlanningID_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.APla2:PlanningID_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      PUT(SELF.Q)
    END
  !----------------------------------------------------------------------


BRW3.ResetQueue PROCEDURE(BYTE ResetMode)

  CODE
  	db.DebugOut('START DUUR APlanningInkoop.ResetQueue')
  	pre_timing# = CLOCK()
  PARENT.ResetQueue(ResetMode)
  	post_timing# = CLOCK()
  	db.DebugOut('METING DUUR APlanningInkoop.ResetQueue : ' & (post_timing# - pre_timing#))


BRW3.SetQueueRecord PROCEDURE

  CODE
  LOC:Getransferd = ThisWindow.GetGetransferd(APla2:PlanningID)
  
  IF APla2:MutatieGemaakt THEN
  	LOC:InkoopKG2 = APla2:MutatieKG
  	LOC:InkoopPallets2 = APla2:MutatiePallets
  ELSE
  	LOC:InkoopKG2 = APla2:KG
  	LOC:InkoopPallets2 = APla2:Pallets
  END
  PARENT.SetQueueRecord
  
  IF (APla2:MutatieGemaakt)
    SELF.Q.APla2:MutatieGemaakt_Icon = 2                   ! Set icon from icon list
  ELSE
    SELF.Q.APla2:MutatieGemaakt_Icon = 1                   ! Set icon from icon list
  END
  IF (APla2:Geprint)
    SELF.Q.APla2:Geprint_Icon = 2                          ! Set icon from icon list
  ELSE
    SELF.Q.APla2:Geprint_Icon = 1                          ! Set icon from icon list
  END
  IF (LOC:Getransferd)
    SELF.Q.LOC:Getransferd_Icon = 2                        ! Set icon from icon list
  ELSE
    SELF.Q.LOC:Getransferd_Icon = 1                        ! Set icon from icon list
  END
  IF (APla2:Verwerkt)
    SELF.Q.APla2:Verwerkt_Icon = 2                         ! Set icon from icon list
  ELSE
    SELF.Q.APla2:Verwerkt_Icon = 1                         ! Set icon from icon list
  END
  IF (APla2:Gewogen)
    SELF.Q.APla2:Gewogen_Icon = 2                          ! Set icon from icon list
  ELSE
    SELF.Q.APla2:Gewogen_Icon = 1                          ! Set icon from icon list
  END
  !----------------------------------------------------------------------
      SELF.Q.APla2:ArtikelID_NormalFG   = CHOOSE(CHOICE(?InkoopList2) % 2,-1,-1) ! Set color values for APla2:ArtikelID
      SELF.Q.APla2:ArtikelID_NormalBG   = CHOOSE(CHOICE(?InkoopList2) % 2,-1,8454143)
      SELF.Q.APla2:ArtikelID_SelectedFG = CHOOSE(CHOICE(?InkoopList2) % 2,-1,-1)
      SELF.Q.APla2:ArtikelID_SelectedBG = CHOOSE(CHOICE(?InkoopList2) % 2,-1,-1)
      SELF.Q.APla2:ArtikelOms_NormalFG   = CHOOSE(CHOICE(?InkoopList2) % 2,-1,-1) ! Set color values for APla2:ArtikelOms
      SELF.Q.APla2:ArtikelOms_NormalBG   = CHOOSE(CHOICE(?InkoopList2) % 2,-1,8454143)
      SELF.Q.APla2:ArtikelOms_SelectedFG = CHOOSE(CHOICE(?InkoopList2) % 2,-1,-1)
      SELF.Q.APla2:ArtikelOms_SelectedBG = CHOOSE(CHOICE(?InkoopList2) % 2,-1,-1)
      SELF.Q.APla2:FirmaNaam_NormalFG   = CHOOSE(CHOICE(?InkoopList2) % 2,-1,-1) ! Set color values for APla2:FirmaNaam
      SELF.Q.APla2:FirmaNaam_NormalBG   = CHOOSE(CHOICE(?InkoopList2) % 2,-1,8454143)
      SELF.Q.APla2:FirmaNaam_SelectedFG = CHOOSE(CHOICE(?InkoopList2) % 2,-1,-1)
      SELF.Q.APla2:FirmaNaam_SelectedBG = CHOOSE(CHOICE(?InkoopList2) % 2,-1,-1)
      SELF.Q.LOC:InkoopKG2_NormalFG   = CHOOSE(CHOICE(?InkoopList2) % 2,-1,-1) ! Set color values for LOC:InkoopKG2
      SELF.Q.LOC:InkoopKG2_NormalBG   = CHOOSE(CHOICE(?InkoopList2) % 2,-1,8454143)
      SELF.Q.LOC:InkoopKG2_SelectedFG = CHOOSE(CHOICE(?InkoopList2) % 2,-1,-1)
      SELF.Q.LOC:InkoopKG2_SelectedBG = CHOOSE(CHOICE(?InkoopList2) % 2,-1,-1)
      SELF.Q.APla2:Instructie_NormalFG   = CHOOSE(CHOICE(?InkoopList2) % 2,-1,-1) ! Set color values for APla2:Instructie
      SELF.Q.APla2:Instructie_NormalBG   = CHOOSE(CHOICE(?InkoopList2) % 2,-1,8454143)
      SELF.Q.APla2:Instructie_SelectedFG = CHOOSE(CHOICE(?InkoopList2) % 2,-1,-1)
      SELF.Q.APla2:Instructie_SelectedBG = CHOOSE(CHOICE(?InkoopList2) % 2,-1,-1)
      SELF.Q.APla2:VerpakkingOmschrijving_NormalFG   = CHOOSE(CHOICE(?InkoopList2) % 2,-1,-1) ! Set color values for APla2:VerpakkingOmschrijving
      SELF.Q.APla2:VerpakkingOmschrijving_NormalBG   = CHOOSE(CHOICE(?InkoopList2) % 2,-1,8454143)
      SELF.Q.APla2:VerpakkingOmschrijving_SelectedFG = CHOOSE(CHOICE(?InkoopList2) % 2,-1,-1)
      SELF.Q.APla2:VerpakkingOmschrijving_SelectedBG = CHOOSE(CHOICE(?InkoopList2) % 2,-1,-1)
      SELF.Q.APla2:Planning_TIME_NormalFG   = CHOOSE(CHOICE(?InkoopList2) % 2,-1,-1) ! Set color values for APla2:Planning_TIME
      SELF.Q.APla2:Planning_TIME_NormalBG   = CHOOSE(CHOICE(?InkoopList2) % 2,-1,8454143)
      SELF.Q.APla2:Planning_TIME_SelectedFG = CHOOSE(CHOICE(?InkoopList2) % 2,-1,-1)
      SELF.Q.APla2:Planning_TIME_SelectedBG = CHOOSE(CHOICE(?InkoopList2) % 2,-1,-1)
      SELF.Q.LOC:InkoopPallets2_NormalFG   = CHOOSE(CHOICE(?InkoopList2) % 2,-1,-1) ! Set color values for LOC:InkoopPallets2
      SELF.Q.LOC:InkoopPallets2_NormalBG   = CHOOSE(CHOICE(?InkoopList2) % 2,-1,8454143)
      SELF.Q.LOC:InkoopPallets2_SelectedFG = CHOOSE(CHOICE(?InkoopList2) % 2,-1,-1)
      SELF.Q.LOC:InkoopPallets2_SelectedBG = CHOOSE(CHOICE(?InkoopList2) % 2,-1,-1)
      SELF.Q.APla2:MutatieGemaakt_NormalFG   = CHOOSE(CHOICE(?InkoopList2) % 2,-1,-1) ! Set color values for APla2:MutatieGemaakt
      SELF.Q.APla2:MutatieGemaakt_NormalBG   = CHOOSE(CHOICE(?InkoopList2) % 2,-1,8454143)
      SELF.Q.APla2:MutatieGemaakt_SelectedFG = CHOOSE(CHOICE(?InkoopList2) % 2,-1,-1)
      SELF.Q.APla2:MutatieGemaakt_SelectedBG = CHOOSE(CHOICE(?InkoopList2) % 2,-1,-1)
      SELF.Q.APla2:Geprint_NormalFG   = CHOOSE(CHOICE(?InkoopList2) % 2,-1,-1) ! Set color values for APla2:Geprint
      SELF.Q.APla2:Geprint_NormalBG   = CHOOSE(CHOICE(?InkoopList2) % 2,-1,8454143)
      SELF.Q.APla2:Geprint_SelectedFG = CHOOSE(CHOICE(?InkoopList2) % 2,-1,-1)
      SELF.Q.APla2:Geprint_SelectedBG = CHOOSE(CHOICE(?InkoopList2) % 2,-1,-1)
      SELF.Q.LOC:Getransferd_NormalFG   = CHOOSE(CHOICE(?InkoopList2) % 2,-1,-1) ! Set color values for LOC:Getransferd
      SELF.Q.LOC:Getransferd_NormalBG   = CHOOSE(CHOICE(?InkoopList2) % 2,-1,8454143)
      SELF.Q.LOC:Getransferd_SelectedFG = CHOOSE(CHOICE(?InkoopList2) % 2,-1,-1)
      SELF.Q.LOC:Getransferd_SelectedBG = CHOOSE(CHOICE(?InkoopList2) % 2,-1,-1)
      SELF.Q.APla2:Verwerkt_NormalFG   = CHOOSE(CHOICE(?InkoopList2) % 2,-1,-1) ! Set color values for APla2:Verwerkt
      SELF.Q.APla2:Verwerkt_NormalBG   = CHOOSE(CHOICE(?InkoopList2) % 2,-1,8454143)
      SELF.Q.APla2:Verwerkt_SelectedFG = CHOOSE(CHOICE(?InkoopList2) % 2,-1,-1)
      SELF.Q.APla2:Verwerkt_SelectedBG = CHOOSE(CHOICE(?InkoopList2) % 2,-1,-1)
      SELF.Q.APla2:Gewogen_NormalFG   = CHOOSE(CHOICE(?InkoopList2) % 2,-1,-1) ! Set color values for APla2:Gewogen
      SELF.Q.APla2:Gewogen_NormalBG   = CHOOSE(CHOICE(?InkoopList2) % 2,-1,8454143)
      SELF.Q.APla2:Gewogen_SelectedFG = CHOOSE(CHOICE(?InkoopList2) % 2,-1,-1)
      SELF.Q.APla2:Gewogen_SelectedBG = CHOOSE(CHOICE(?InkoopList2) % 2,-1,-1)
      SELF.Q.APla2:CelOms_NormalFG   = CHOOSE(CHOICE(?InkoopList2) % 2,-1,-1) ! Set color values for APla2:CelOms
      SELF.Q.APla2:CelOms_NormalBG   = CHOOSE(CHOICE(?InkoopList2) % 2,-1,8454143)
      SELF.Q.APla2:CelOms_SelectedFG = CHOOSE(CHOICE(?InkoopList2) % 2,-1,-1)
      SELF.Q.APla2:CelOms_SelectedBG = CHOOSE(CHOICE(?InkoopList2) % 2,-1,-1)
      SELF.Q.APla2:Locatienaam_NormalFG   = CHOOSE(CHOICE(?InkoopList2) % 2,-1,-1) ! Set color values for APla2:Locatienaam
      SELF.Q.APla2:Locatienaam_NormalBG   = CHOOSE(CHOICE(?InkoopList2) % 2,-1,8454143)
      SELF.Q.APla2:Locatienaam_SelectedFG = CHOOSE(CHOICE(?InkoopList2) % 2,-1,-1)
      SELF.Q.APla2:Locatienaam_SelectedBG = CHOOSE(CHOICE(?InkoopList2) % 2,-1,-1)
      SELF.Q.APla2:Transport_NormalFG   = CHOOSE(CHOICE(?InkoopList2) % 2,-1,-1) ! Set color values for APla2:Transport
      SELF.Q.APla2:Transport_NormalBG   = CHOOSE(CHOICE(?InkoopList2) % 2,-1,8454143)
      SELF.Q.APla2:Transport_SelectedFG = CHOOSE(CHOICE(?InkoopList2) % 2,-1,-1)
      SELF.Q.APla2:Transport_SelectedBG = CHOOSE(CHOICE(?InkoopList2) % 2,-1,-1)
      SELF.Q.APla2:PlanningID_NormalFG   = CHOOSE(CHOICE(?InkoopList2) % 2,-1,-1) ! Set color values for APla2:PlanningID
      SELF.Q.APla2:PlanningID_NormalBG   = CHOOSE(CHOICE(?InkoopList2) % 2,-1,8454143)
      SELF.Q.APla2:PlanningID_SelectedFG = CHOOSE(CHOICE(?InkoopList2) % 2,-1,-1)
      SELF.Q.APla2:PlanningID_SelectedBG = CHOOSE(CHOICE(?InkoopList2) % 2,-1,-1)
  !----------------------------------------------------------------------


BRW9.Fetch PROCEDURE(BYTE Direction)

GreenBarIndex   LONG,AUTO
  CODE
  PARENT.Fetch(Direction)
  !----------------------------------------------------------------------
    LOOP GreenBarIndex=1 TO RECORDS(SELF.Q)
      GET(SELF.Q,GreenBarIndex)
      SELF.Q.APla4:ArtikelID_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for APla4:ArtikelID
      SELF.Q.APla4:ArtikelID_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.APla4:ArtikelID_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.APla4:ArtikelID_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.APla4:ArtikelOms_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for APla4:ArtikelOms
      SELF.Q.APla4:ArtikelOms_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.APla4:ArtikelOms_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.APla4:ArtikelOms_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.APla4:FirmaNaam_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for APla4:FirmaNaam
      SELF.Q.APla4:FirmaNaam_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.APla4:FirmaNaam_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.APla4:FirmaNaam_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.APla4:PartijID_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for APla4:PartijID
      SELF.Q.APla4:PartijID_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.APla4:PartijID_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.APla4:PartijID_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.APla4:ExternPartijnr_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for APla4:ExternPartijnr
      SELF.Q.APla4:ExternPartijnr_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.APla4:ExternPartijnr_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.APla4:ExternPartijnr_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.LOC:OverboekingKG2_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for LOC:OverboekingKG2
      SELF.Q.LOC:OverboekingKG2_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.LOC:OverboekingKG2_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.LOC:OverboekingKG2_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.APla4:Instructie_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for APla4:Instructie
      SELF.Q.APla4:Instructie_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.APla4:Instructie_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.APla4:Instructie_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.APla4:VerpakkingOmschrijving_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for APla4:VerpakkingOmschrijving
      SELF.Q.APla4:VerpakkingOmschrijving_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.APla4:VerpakkingOmschrijving_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.APla4:VerpakkingOmschrijving_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.APla4:Planning_TIME_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for APla4:Planning_TIME
      SELF.Q.APla4:Planning_TIME_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.APla4:Planning_TIME_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.APla4:Planning_TIME_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.LOC:OverboekingPallets2_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for LOC:OverboekingPallets2
      SELF.Q.LOC:OverboekingPallets2_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.LOC:OverboekingPallets2_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.LOC:OverboekingPallets2_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.APla4:OverboekSoort_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for APla4:OverboekSoort
      SELF.Q.APla4:OverboekSoort_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.APla4:OverboekSoort_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.APla4:OverboekSoort_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.APla4:MutatieGemaakt_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for APla4:MutatieGemaakt
      SELF.Q.APla4:MutatieGemaakt_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.APla4:MutatieGemaakt_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.APla4:MutatieGemaakt_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.LOC:Getransferd_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for LOC:Getransferd
      SELF.Q.LOC:Getransferd_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.LOC:Getransferd_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.LOC:Getransferd_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.APla4:Verwerkt_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for APla4:Verwerkt
      SELF.Q.APla4:Verwerkt_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.APla4:Verwerkt_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.APla4:Verwerkt_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.APla4:CelOms_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for APla4:CelOms
      SELF.Q.APla4:CelOms_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.APla4:CelOms_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.APla4:CelOms_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.APla4:Locatienaam_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for APla4:Locatienaam
      SELF.Q.APla4:Locatienaam_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.APla4:Locatienaam_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.APla4:Locatienaam_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.APla4:NaarCelOms_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for APla4:NaarCelOms
      SELF.Q.APla4:NaarCelOms_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.APla4:NaarCelOms_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.APla4:NaarCelOms_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.APla4:NaarLocatienaam_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for APla4:NaarLocatienaam
      SELF.Q.APla4:NaarLocatienaam_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.APla4:NaarLocatienaam_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.APla4:NaarLocatienaam_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.APla4:Transport_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for APla4:Transport
      SELF.Q.APla4:Transport_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.APla4:Transport_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.APla4:Transport_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      PUT(SELF.Q)
    END
  !----------------------------------------------------------------------


BRW9.ResetQueue PROCEDURE(BYTE ResetMode)

  CODE
  db.DebugOut('START DUUR APlanningOverboeking.ResetQueue')
  pre_timing# = CLOCK()
  PARENT.ResetQueue(ResetMode)
  post_timing# = CLOCK()
  db.DebugOut('METING DUUR APlanningOverboeking.ResetQueue : ' & (post_timing# - pre_timing#))


BRW9.SetQueueRecord PROCEDURE

  CODE
  LOC:Getransferd = ThisWindow.GetGetransferd(APla4:PlanningID)
  
  IF APla4:MutatieGemaakt THEN
  	LOC:OverboekingPallets2 = APla4:MutatiePallets
  	LOC:OverboekingKG2 = APla4:MutatieKG
  ELSE
  	LOC:OverboekingPallets2 = APla4:Pallets
  	LOC:OverboekingKG2 = APla4:KG
  END
  PARENT.SetQueueRecord
  
  IF (APla4:MutatieGemaakt)
    SELF.Q.APla4:MutatieGemaakt_Icon = 2                   ! Set icon from icon list
  ELSE
    SELF.Q.APla4:MutatieGemaakt_Icon = 1                   ! Set icon from icon list
  END
  IF (LOC:Getransferd)
    SELF.Q.LOC:Getransferd_Icon = 2                        ! Set icon from icon list
  ELSE
    SELF.Q.LOC:Getransferd_Icon = 1                        ! Set icon from icon list
  END
  IF (APla4:Verwerkt)
    SELF.Q.APla4:Verwerkt_Icon = 2                         ! Set icon from icon list
  ELSE
    SELF.Q.APla4:Verwerkt_Icon = 1                         ! Set icon from icon list
  END
  !----------------------------------------------------------------------
      SELF.Q.APla4:ArtikelID_NormalFG   = CHOOSE(CHOICE(?OverboekList2) % 2,-1,-1) ! Set color values for APla4:ArtikelID
      SELF.Q.APla4:ArtikelID_NormalBG   = CHOOSE(CHOICE(?OverboekList2) % 2,-1,8454143)
      SELF.Q.APla4:ArtikelID_SelectedFG = CHOOSE(CHOICE(?OverboekList2) % 2,-1,-1)
      SELF.Q.APla4:ArtikelID_SelectedBG = CHOOSE(CHOICE(?OverboekList2) % 2,-1,-1)
      SELF.Q.APla4:ArtikelOms_NormalFG   = CHOOSE(CHOICE(?OverboekList2) % 2,-1,-1) ! Set color values for APla4:ArtikelOms
      SELF.Q.APla4:ArtikelOms_NormalBG   = CHOOSE(CHOICE(?OverboekList2) % 2,-1,8454143)
      SELF.Q.APla4:ArtikelOms_SelectedFG = CHOOSE(CHOICE(?OverboekList2) % 2,-1,-1)
      SELF.Q.APla4:ArtikelOms_SelectedBG = CHOOSE(CHOICE(?OverboekList2) % 2,-1,-1)
      SELF.Q.APla4:FirmaNaam_NormalFG   = CHOOSE(CHOICE(?OverboekList2) % 2,-1,-1) ! Set color values for APla4:FirmaNaam
      SELF.Q.APla4:FirmaNaam_NormalBG   = CHOOSE(CHOICE(?OverboekList2) % 2,-1,8454143)
      SELF.Q.APla4:FirmaNaam_SelectedFG = CHOOSE(CHOICE(?OverboekList2) % 2,-1,-1)
      SELF.Q.APla4:FirmaNaam_SelectedBG = CHOOSE(CHOICE(?OverboekList2) % 2,-1,-1)
      SELF.Q.APla4:PartijID_NormalFG   = CHOOSE(CHOICE(?OverboekList2) % 2,-1,-1) ! Set color values for APla4:PartijID
      SELF.Q.APla4:PartijID_NormalBG   = CHOOSE(CHOICE(?OverboekList2) % 2,-1,8454143)
      SELF.Q.APla4:PartijID_SelectedFG = CHOOSE(CHOICE(?OverboekList2) % 2,-1,-1)
      SELF.Q.APla4:PartijID_SelectedBG = CHOOSE(CHOICE(?OverboekList2) % 2,-1,-1)
      SELF.Q.APla4:ExternPartijnr_NormalFG   = CHOOSE(CHOICE(?OverboekList2) % 2,-1,-1) ! Set color values for APla4:ExternPartijnr
      SELF.Q.APla4:ExternPartijnr_NormalBG   = CHOOSE(CHOICE(?OverboekList2) % 2,-1,8454143)
      SELF.Q.APla4:ExternPartijnr_SelectedFG = CHOOSE(CHOICE(?OverboekList2) % 2,-1,-1)
      SELF.Q.APla4:ExternPartijnr_SelectedBG = CHOOSE(CHOICE(?OverboekList2) % 2,-1,-1)
      SELF.Q.LOC:OverboekingKG2_NormalFG   = CHOOSE(CHOICE(?OverboekList2) % 2,-1,-1) ! Set color values for LOC:OverboekingKG2
      SELF.Q.LOC:OverboekingKG2_NormalBG   = CHOOSE(CHOICE(?OverboekList2) % 2,-1,8454143)
      SELF.Q.LOC:OverboekingKG2_SelectedFG = CHOOSE(CHOICE(?OverboekList2) % 2,-1,-1)
      SELF.Q.LOC:OverboekingKG2_SelectedBG = CHOOSE(CHOICE(?OverboekList2) % 2,-1,-1)
      SELF.Q.APla4:Instructie_NormalFG   = CHOOSE(CHOICE(?OverboekList2) % 2,-1,-1) ! Set color values for APla4:Instructie
      SELF.Q.APla4:Instructie_NormalBG   = CHOOSE(CHOICE(?OverboekList2) % 2,-1,8454143)
      SELF.Q.APla4:Instructie_SelectedFG = CHOOSE(CHOICE(?OverboekList2) % 2,-1,-1)
      SELF.Q.APla4:Instructie_SelectedBG = CHOOSE(CHOICE(?OverboekList2) % 2,-1,-1)
      SELF.Q.APla4:VerpakkingOmschrijving_NormalFG   = CHOOSE(CHOICE(?OverboekList2) % 2,-1,-1) ! Set color values for APla4:VerpakkingOmschrijving
      SELF.Q.APla4:VerpakkingOmschrijving_NormalBG   = CHOOSE(CHOICE(?OverboekList2) % 2,-1,8454143)
      SELF.Q.APla4:VerpakkingOmschrijving_SelectedFG = CHOOSE(CHOICE(?OverboekList2) % 2,-1,-1)
      SELF.Q.APla4:VerpakkingOmschrijving_SelectedBG = CHOOSE(CHOICE(?OverboekList2) % 2,-1,-1)
      SELF.Q.APla4:Planning_TIME_NormalFG   = CHOOSE(CHOICE(?OverboekList2) % 2,-1,-1) ! Set color values for APla4:Planning_TIME
      SELF.Q.APla4:Planning_TIME_NormalBG   = CHOOSE(CHOICE(?OverboekList2) % 2,-1,8454143)
      SELF.Q.APla4:Planning_TIME_SelectedFG = CHOOSE(CHOICE(?OverboekList2) % 2,-1,-1)
      SELF.Q.APla4:Planning_TIME_SelectedBG = CHOOSE(CHOICE(?OverboekList2) % 2,-1,-1)
      SELF.Q.LOC:OverboekingPallets2_NormalFG   = CHOOSE(CHOICE(?OverboekList2) % 2,-1,-1) ! Set color values for LOC:OverboekingPallets2
      SELF.Q.LOC:OverboekingPallets2_NormalBG   = CHOOSE(CHOICE(?OverboekList2) % 2,-1,8454143)
      SELF.Q.LOC:OverboekingPallets2_SelectedFG = CHOOSE(CHOICE(?OverboekList2) % 2,-1,-1)
      SELF.Q.LOC:OverboekingPallets2_SelectedBG = CHOOSE(CHOICE(?OverboekList2) % 2,-1,-1)
      SELF.Q.APla4:OverboekSoort_NormalFG   = CHOOSE(CHOICE(?OverboekList2) % 2,-1,-1) ! Set color values for APla4:OverboekSoort
      SELF.Q.APla4:OverboekSoort_NormalBG   = CHOOSE(CHOICE(?OverboekList2) % 2,-1,8454143)
      SELF.Q.APla4:OverboekSoort_SelectedFG = CHOOSE(CHOICE(?OverboekList2) % 2,-1,-1)
      SELF.Q.APla4:OverboekSoort_SelectedBG = CHOOSE(CHOICE(?OverboekList2) % 2,-1,-1)
      SELF.Q.APla4:MutatieGemaakt_NormalFG   = CHOOSE(CHOICE(?OverboekList2) % 2,-1,-1) ! Set color values for APla4:MutatieGemaakt
      SELF.Q.APla4:MutatieGemaakt_NormalBG   = CHOOSE(CHOICE(?OverboekList2) % 2,-1,8454143)
      SELF.Q.APla4:MutatieGemaakt_SelectedFG = CHOOSE(CHOICE(?OverboekList2) % 2,-1,-1)
      SELF.Q.APla4:MutatieGemaakt_SelectedBG = CHOOSE(CHOICE(?OverboekList2) % 2,-1,-1)
      SELF.Q.LOC:Getransferd_NormalFG   = CHOOSE(CHOICE(?OverboekList2) % 2,-1,-1) ! Set color values for LOC:Getransferd
      SELF.Q.LOC:Getransferd_NormalBG   = CHOOSE(CHOICE(?OverboekList2) % 2,-1,8454143)
      SELF.Q.LOC:Getransferd_SelectedFG = CHOOSE(CHOICE(?OverboekList2) % 2,-1,-1)
      SELF.Q.LOC:Getransferd_SelectedBG = CHOOSE(CHOICE(?OverboekList2) % 2,-1,-1)
      SELF.Q.APla4:Verwerkt_NormalFG   = CHOOSE(CHOICE(?OverboekList2) % 2,-1,-1) ! Set color values for APla4:Verwerkt
      SELF.Q.APla4:Verwerkt_NormalBG   = CHOOSE(CHOICE(?OverboekList2) % 2,-1,8454143)
      SELF.Q.APla4:Verwerkt_SelectedFG = CHOOSE(CHOICE(?OverboekList2) % 2,-1,-1)
      SELF.Q.APla4:Verwerkt_SelectedBG = CHOOSE(CHOICE(?OverboekList2) % 2,-1,-1)
      SELF.Q.APla4:CelOms_NormalFG   = CHOOSE(CHOICE(?OverboekList2) % 2,-1,-1) ! Set color values for APla4:CelOms
      SELF.Q.APla4:CelOms_NormalBG   = CHOOSE(CHOICE(?OverboekList2) % 2,-1,8454143)
      SELF.Q.APla4:CelOms_SelectedFG = CHOOSE(CHOICE(?OverboekList2) % 2,-1,-1)
      SELF.Q.APla4:CelOms_SelectedBG = CHOOSE(CHOICE(?OverboekList2) % 2,-1,-1)
      SELF.Q.APla4:Locatienaam_NormalFG   = CHOOSE(CHOICE(?OverboekList2) % 2,-1,-1) ! Set color values for APla4:Locatienaam
      SELF.Q.APla4:Locatienaam_NormalBG   = CHOOSE(CHOICE(?OverboekList2) % 2,-1,8454143)
      SELF.Q.APla4:Locatienaam_SelectedFG = CHOOSE(CHOICE(?OverboekList2) % 2,-1,-1)
      SELF.Q.APla4:Locatienaam_SelectedBG = CHOOSE(CHOICE(?OverboekList2) % 2,-1,-1)
      SELF.Q.APla4:NaarCelOms_NormalFG   = CHOOSE(CHOICE(?OverboekList2) % 2,-1,-1) ! Set color values for APla4:NaarCelOms
      SELF.Q.APla4:NaarCelOms_NormalBG   = CHOOSE(CHOICE(?OverboekList2) % 2,-1,8454143)
      SELF.Q.APla4:NaarCelOms_SelectedFG = CHOOSE(CHOICE(?OverboekList2) % 2,-1,-1)
      SELF.Q.APla4:NaarCelOms_SelectedBG = CHOOSE(CHOICE(?OverboekList2) % 2,-1,-1)
      SELF.Q.APla4:NaarLocatienaam_NormalFG   = CHOOSE(CHOICE(?OverboekList2) % 2,-1,-1) ! Set color values for APla4:NaarLocatienaam
      SELF.Q.APla4:NaarLocatienaam_NormalBG   = CHOOSE(CHOICE(?OverboekList2) % 2,-1,8454143)
      SELF.Q.APla4:NaarLocatienaam_SelectedFG = CHOOSE(CHOICE(?OverboekList2) % 2,-1,-1)
      SELF.Q.APla4:NaarLocatienaam_SelectedBG = CHOOSE(CHOICE(?OverboekList2) % 2,-1,-1)
      SELF.Q.APla4:Transport_NormalFG   = CHOOSE(CHOICE(?OverboekList2) % 2,-1,-1) ! Set color values for APla4:Transport
      SELF.Q.APla4:Transport_NormalBG   = CHOOSE(CHOICE(?OverboekList2) % 2,-1,8454143)
      SELF.Q.APla4:Transport_SelectedFG = CHOOSE(CHOICE(?OverboekList2) % 2,-1,-1)
      SELF.Q.APla4:Transport_SelectedBG = CHOOSE(CHOICE(?OverboekList2) % 2,-1,-1)
  !----------------------------------------------------------------------


BRW12.Fetch PROCEDURE(BYTE Direction)

GreenBarIndex   LONG,AUTO
  CODE
  PARENT.Fetch(Direction)
  !----------------------------------------------------------------------
    LOOP GreenBarIndex=1 TO RECORDS(SELF.Q)
      GET(SELF.Q,GreenBarIndex)
      SELF.Q.APla3:ArtikelID_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for APla3:ArtikelID
      SELF.Q.APla3:ArtikelID_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.APla3:ArtikelID_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.APla3:ArtikelID_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.APla3:ArtikelOms_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for APla3:ArtikelOms
      SELF.Q.APla3:ArtikelOms_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.APla3:ArtikelOms_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.APla3:ArtikelOms_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.APla3:FirmaNaam_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for APla3:FirmaNaam
      SELF.Q.APla3:FirmaNaam_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.APla3:FirmaNaam_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.APla3:FirmaNaam_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.APla3:PartijID_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for APla3:PartijID
      SELF.Q.APla3:PartijID_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.APla3:PartijID_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.APla3:PartijID_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.APla3:ExternPartijnr_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for APla3:ExternPartijnr
      SELF.Q.APla3:ExternPartijnr_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.APla3:ExternPartijnr_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.APla3:ExternPartijnr_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.LOC:VerkoopKG2_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for LOC:VerkoopKG2
      SELF.Q.LOC:VerkoopKG2_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.LOC:VerkoopKG2_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.LOC:VerkoopKG2_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.APla3:Instructie_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for APla3:Instructie
      SELF.Q.APla3:Instructie_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.APla3:Instructie_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.APla3:Instructie_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.APla3:VerpakkingOmschrijving_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for APla3:VerpakkingOmschrijving
      SELF.Q.APla3:VerpakkingOmschrijving_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.APla3:VerpakkingOmschrijving_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.APla3:VerpakkingOmschrijving_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.APla3:Planning_TIME_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for APla3:Planning_TIME
      SELF.Q.APla3:Planning_TIME_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.APla3:Planning_TIME_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.APla3:Planning_TIME_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.LOC:VerkoopPallets2_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for LOC:VerkoopPallets2
      SELF.Q.LOC:VerkoopPallets2_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.LOC:VerkoopPallets2_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.LOC:VerkoopPallets2_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.APla3:MutatieGemaakt_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for APla3:MutatieGemaakt
      SELF.Q.APla3:MutatieGemaakt_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.APla3:MutatieGemaakt_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.APla3:MutatieGemaakt_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.APla3:Geprint_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for APla3:Geprint
      SELF.Q.APla3:Geprint_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.APla3:Geprint_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.APla3:Geprint_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.APla3:Verwerkt_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for APla3:Verwerkt
      SELF.Q.APla3:Verwerkt_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.APla3:Verwerkt_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.APla3:Verwerkt_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.APla3:Gewogen_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for APla3:Gewogen
      SELF.Q.APla3:Gewogen_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.APla3:Gewogen_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.APla3:Gewogen_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.APla3:CelOms_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for APla3:CelOms
      SELF.Q.APla3:CelOms_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.APla3:CelOms_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.APla3:CelOms_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.LOC:Locatienaam_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for LOC:Locatienaam
      SELF.Q.LOC:Locatienaam_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.LOC:Locatienaam_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.LOC:Locatienaam_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.APla3:HerkomstOverboekingCelOms_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for APla3:HerkomstOverboekingCelOms
      SELF.Q.APla3:HerkomstOverboekingCelOms_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.APla3:HerkomstOverboekingCelOms_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.APla3:HerkomstOverboekingCelOms_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.APla3:LeverancierFirmaNaam_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for APla3:LeverancierFirmaNaam
      SELF.Q.APla3:LeverancierFirmaNaam_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.APla3:LeverancierFirmaNaam_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.APla3:LeverancierFirmaNaam_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.APla3:Transport_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for APla3:Transport
      SELF.Q.APla3:Transport_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.APla3:Transport_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.APla3:Transport_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.APla3:PlanningID_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for APla3:PlanningID
      SELF.Q.APla3:PlanningID_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.APla3:PlanningID_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.APla3:PlanningID_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      PUT(SELF.Q)
    END
  !----------------------------------------------------------------------


BRW12.ResetQueue PROCEDURE(BYTE ResetMode)

  CODE
  db.DebugOut('START DUUR APlanningVerkoop.ResetQueue')
  pre_timing# = CLOCK()
  PARENT.ResetQueue(ResetMode)
  post_timing# = CLOCK()
  db.DebugOut('METING DUUR APlanningVerkoop.ResetQueue : ' & (post_timing# - pre_timing#))


BRW12.SetQueueRecord PROCEDURE

  CODE
  LOC:Locatienaam = CachingClass.GetCelLocatieNaam(APla3:PartijID,APla3:CelID)
  
  IF APla3:MutatieGemaakt THEN
  	LOC:VerkoopKG2 = APla3:MutatieKG
  	LOC:VerkoopPallets2 = APla3:MutatiePallets
  ELSE
  	LOC:VerkoopKG2 = APla3:KG
  	LOC:VerkoopPallets2 = APla3:Pallets
  END
  PARENT.SetQueueRecord
  If SELF.Q.LOC:VerkoopKG2<0
  	Self.Q.LOC:VerkoopKG2_NormalFG   = Color:Red
  	Self.Q.LOC:VerkoopKG2_NormalBG   = Color:Red
  	Self.Q.LOC:VerkoopKG2_SelectedFG = Color:Red
  	Self.Q.LOC:VerkoopKG2_SelectedBG = Color:Red
  	Self.Q.LOC:VerkoopPallets2_NormalFG   = Color:Red
  	Self.Q.LOC:VerkoopPallets2_SelectedFG = Color:Red
  END
  
  CLEAR (SELF.Q.APla3:Instructie_Tip)
  IF (APla3:MutatieGemaakt)
    SELF.Q.APla3:MutatieGemaakt_Icon = 2                   ! Set icon from icon list
  ELSE
    SELF.Q.APla3:MutatieGemaakt_Icon = 1                   ! Set icon from icon list
  END
  IF (APla3:Geprint)
    SELF.Q.APla3:Geprint_Icon = 2                          ! Set icon from icon list
  ELSE
    SELF.Q.APla3:Geprint_Icon = 1                          ! Set icon from icon list
  END
  IF (APla3:Verwerkt)
    SELF.Q.APla3:Verwerkt_Icon = 2                         ! Set icon from icon list
  ELSE
    SELF.Q.APla3:Verwerkt_Icon = 1                         ! Set icon from icon list
  END
  IF (APla3:Gewogen)
    SELF.Q.APla3:Gewogen_Icon = 2                          ! Set icon from icon list
  ELSE
    SELF.Q.APla3:Gewogen_Icon = 1                          ! Set icon from icon list
  END
  CLEAR (SELF.Q.APla3:Transport_Tip)
  CLEAR (SELF.Q.APla3:PlanningID_Tip)
  !----------------------------------------------------------------------
      SELF.Q.APla3:ArtikelID_NormalFG   = CHOOSE(CHOICE(?VerkoopList:2) % 2,-1,-1) ! Set color values for APla3:ArtikelID
      SELF.Q.APla3:ArtikelID_NormalBG   = CHOOSE(CHOICE(?VerkoopList:2) % 2,-1,8454143)
      SELF.Q.APla3:ArtikelID_SelectedFG = CHOOSE(CHOICE(?VerkoopList:2) % 2,-1,-1)
      SELF.Q.APla3:ArtikelID_SelectedBG = CHOOSE(CHOICE(?VerkoopList:2) % 2,-1,-1)
      SELF.Q.APla3:ArtikelOms_NormalFG   = CHOOSE(CHOICE(?VerkoopList:2) % 2,-1,-1) ! Set color values for APla3:ArtikelOms
      SELF.Q.APla3:ArtikelOms_NormalBG   = CHOOSE(CHOICE(?VerkoopList:2) % 2,-1,8454143)
      SELF.Q.APla3:ArtikelOms_SelectedFG = CHOOSE(CHOICE(?VerkoopList:2) % 2,-1,-1)
      SELF.Q.APla3:ArtikelOms_SelectedBG = CHOOSE(CHOICE(?VerkoopList:2) % 2,-1,-1)
      SELF.Q.APla3:FirmaNaam_NormalFG   = CHOOSE(CHOICE(?VerkoopList:2) % 2,-1,-1) ! Set color values for APla3:FirmaNaam
      SELF.Q.APla3:FirmaNaam_NormalBG   = CHOOSE(CHOICE(?VerkoopList:2) % 2,-1,8454143)
      SELF.Q.APla3:FirmaNaam_SelectedFG = CHOOSE(CHOICE(?VerkoopList:2) % 2,-1,-1)
      SELF.Q.APla3:FirmaNaam_SelectedBG = CHOOSE(CHOICE(?VerkoopList:2) % 2,-1,-1)
      SELF.Q.APla3:PartijID_NormalFG   = CHOOSE(CHOICE(?VerkoopList:2) % 2,-1,-1) ! Set color values for APla3:PartijID
      SELF.Q.APla3:PartijID_NormalBG   = CHOOSE(CHOICE(?VerkoopList:2) % 2,-1,8454143)
      SELF.Q.APla3:PartijID_SelectedFG = CHOOSE(CHOICE(?VerkoopList:2) % 2,-1,-1)
      SELF.Q.APla3:PartijID_SelectedBG = CHOOSE(CHOICE(?VerkoopList:2) % 2,-1,-1)
      SELF.Q.APla3:ExternPartijnr_NormalFG   = CHOOSE(CHOICE(?VerkoopList:2) % 2,-1,-1) ! Set color values for APla3:ExternPartijnr
      SELF.Q.APla3:ExternPartijnr_NormalBG   = CHOOSE(CHOICE(?VerkoopList:2) % 2,-1,8454143)
      SELF.Q.APla3:ExternPartijnr_SelectedFG = CHOOSE(CHOICE(?VerkoopList:2) % 2,-1,-1)
      SELF.Q.APla3:ExternPartijnr_SelectedBG = CHOOSE(CHOICE(?VerkoopList:2) % 2,-1,-1)
      SELF.Q.LOC:VerkoopKG2_NormalFG   = CHOOSE(CHOICE(?VerkoopList:2) % 2,-1,-1) ! Set color values for LOC:VerkoopKG2
      SELF.Q.LOC:VerkoopKG2_NormalBG   = CHOOSE(CHOICE(?VerkoopList:2) % 2,-1,8454143)
      SELF.Q.LOC:VerkoopKG2_SelectedFG = CHOOSE(CHOICE(?VerkoopList:2) % 2,-1,-1)
      SELF.Q.LOC:VerkoopKG2_SelectedBG = CHOOSE(CHOICE(?VerkoopList:2) % 2,-1,-1)
      SELF.Q.APla3:Instructie_NormalFG   = CHOOSE(CHOICE(?VerkoopList:2) % 2,-1,-1) ! Set color values for APla3:Instructie
      SELF.Q.APla3:Instructie_NormalBG   = CHOOSE(CHOICE(?VerkoopList:2) % 2,-1,8454143)
      SELF.Q.APla3:Instructie_SelectedFG = CHOOSE(CHOICE(?VerkoopList:2) % 2,-1,-1)
      SELF.Q.APla3:Instructie_SelectedBG = CHOOSE(CHOICE(?VerkoopList:2) % 2,-1,-1)
      SELF.Q.APla3:VerpakkingOmschrijving_NormalFG   = CHOOSE(CHOICE(?VerkoopList:2) % 2,-1,-1) ! Set color values for APla3:VerpakkingOmschrijving
      SELF.Q.APla3:VerpakkingOmschrijving_NormalBG   = CHOOSE(CHOICE(?VerkoopList:2) % 2,-1,8454143)
      SELF.Q.APla3:VerpakkingOmschrijving_SelectedFG = CHOOSE(CHOICE(?VerkoopList:2) % 2,-1,-1)
      SELF.Q.APla3:VerpakkingOmschrijving_SelectedBG = CHOOSE(CHOICE(?VerkoopList:2) % 2,-1,-1)
      SELF.Q.APla3:Planning_TIME_NormalFG   = CHOOSE(CHOICE(?VerkoopList:2) % 2,-1,-1) ! Set color values for APla3:Planning_TIME
      SELF.Q.APla3:Planning_TIME_NormalBG   = CHOOSE(CHOICE(?VerkoopList:2) % 2,-1,8454143)
      SELF.Q.APla3:Planning_TIME_SelectedFG = CHOOSE(CHOICE(?VerkoopList:2) % 2,-1,-1)
      SELF.Q.APla3:Planning_TIME_SelectedBG = CHOOSE(CHOICE(?VerkoopList:2) % 2,-1,-1)
      SELF.Q.LOC:VerkoopPallets2_NormalFG   = CHOOSE(CHOICE(?VerkoopList:2) % 2,-1,-1) ! Set color values for LOC:VerkoopPallets2
      SELF.Q.LOC:VerkoopPallets2_NormalBG   = CHOOSE(CHOICE(?VerkoopList:2) % 2,-1,8454143)
      SELF.Q.LOC:VerkoopPallets2_SelectedFG = CHOOSE(CHOICE(?VerkoopList:2) % 2,-1,-1)
      SELF.Q.LOC:VerkoopPallets2_SelectedBG = CHOOSE(CHOICE(?VerkoopList:2) % 2,-1,-1)
      SELF.Q.APla3:MutatieGemaakt_NormalFG   = CHOOSE(CHOICE(?VerkoopList:2) % 2,-1,-1) ! Set color values for APla3:MutatieGemaakt
      SELF.Q.APla3:MutatieGemaakt_NormalBG   = CHOOSE(CHOICE(?VerkoopList:2) % 2,-1,8454143)
      SELF.Q.APla3:MutatieGemaakt_SelectedFG = CHOOSE(CHOICE(?VerkoopList:2) % 2,-1,-1)
      SELF.Q.APla3:MutatieGemaakt_SelectedBG = CHOOSE(CHOICE(?VerkoopList:2) % 2,-1,-1)
      SELF.Q.APla3:Geprint_NormalFG   = CHOOSE(CHOICE(?VerkoopList:2) % 2,-1,-1) ! Set color values for APla3:Geprint
      SELF.Q.APla3:Geprint_NormalBG   = CHOOSE(CHOICE(?VerkoopList:2) % 2,-1,8454143)
      SELF.Q.APla3:Geprint_SelectedFG = CHOOSE(CHOICE(?VerkoopList:2) % 2,-1,-1)
      SELF.Q.APla3:Geprint_SelectedBG = CHOOSE(CHOICE(?VerkoopList:2) % 2,-1,-1)
      SELF.Q.APla3:Verwerkt_NormalFG   = CHOOSE(CHOICE(?VerkoopList:2) % 2,-1,-1) ! Set color values for APla3:Verwerkt
      SELF.Q.APla3:Verwerkt_NormalBG   = CHOOSE(CHOICE(?VerkoopList:2) % 2,-1,8454143)
      SELF.Q.APla3:Verwerkt_SelectedFG = CHOOSE(CHOICE(?VerkoopList:2) % 2,-1,-1)
      SELF.Q.APla3:Verwerkt_SelectedBG = CHOOSE(CHOICE(?VerkoopList:2) % 2,-1,-1)
      SELF.Q.APla3:Gewogen_NormalFG   = CHOOSE(CHOICE(?VerkoopList:2) % 2,-1,-1) ! Set color values for APla3:Gewogen
      SELF.Q.APla3:Gewogen_NormalBG   = CHOOSE(CHOICE(?VerkoopList:2) % 2,-1,8454143)
      SELF.Q.APla3:Gewogen_SelectedFG = CHOOSE(CHOICE(?VerkoopList:2) % 2,-1,-1)
      SELF.Q.APla3:Gewogen_SelectedBG = CHOOSE(CHOICE(?VerkoopList:2) % 2,-1,-1)
      SELF.Q.APla3:CelOms_NormalFG   = CHOOSE(CHOICE(?VerkoopList:2) % 2,-1,-1) ! Set color values for APla3:CelOms
      SELF.Q.APla3:CelOms_NormalBG   = CHOOSE(CHOICE(?VerkoopList:2) % 2,-1,8454143)
      SELF.Q.APla3:CelOms_SelectedFG = CHOOSE(CHOICE(?VerkoopList:2) % 2,-1,-1)
      SELF.Q.APla3:CelOms_SelectedBG = CHOOSE(CHOICE(?VerkoopList:2) % 2,-1,-1)
      SELF.Q.LOC:Locatienaam_NormalFG   = CHOOSE(CHOICE(?VerkoopList:2) % 2,-1,-1) ! Set color values for LOC:Locatienaam
      SELF.Q.LOC:Locatienaam_NormalBG   = CHOOSE(CHOICE(?VerkoopList:2) % 2,-1,8454143)
      SELF.Q.LOC:Locatienaam_SelectedFG = CHOOSE(CHOICE(?VerkoopList:2) % 2,-1,-1)
      SELF.Q.LOC:Locatienaam_SelectedBG = CHOOSE(CHOICE(?VerkoopList:2) % 2,-1,-1)
      SELF.Q.APla3:HerkomstOverboekingCelOms_NormalFG   = CHOOSE(CHOICE(?VerkoopList:2) % 2,-1,-1) ! Set color values for APla3:HerkomstOverboekingCelOms
      SELF.Q.APla3:HerkomstOverboekingCelOms_NormalBG   = CHOOSE(CHOICE(?VerkoopList:2) % 2,-1,8454143)
      SELF.Q.APla3:HerkomstOverboekingCelOms_SelectedFG = CHOOSE(CHOICE(?VerkoopList:2) % 2,-1,-1)
      SELF.Q.APla3:HerkomstOverboekingCelOms_SelectedBG = CHOOSE(CHOICE(?VerkoopList:2) % 2,-1,-1)
      SELF.Q.APla3:LeverancierFirmaNaam_NormalFG   = CHOOSE(CHOICE(?VerkoopList:2) % 2,-1,-1) ! Set color values for APla3:LeverancierFirmaNaam
      SELF.Q.APla3:LeverancierFirmaNaam_NormalBG   = CHOOSE(CHOICE(?VerkoopList:2) % 2,-1,8454143)
      SELF.Q.APla3:LeverancierFirmaNaam_SelectedFG = CHOOSE(CHOICE(?VerkoopList:2) % 2,-1,-1)
      SELF.Q.APla3:LeverancierFirmaNaam_SelectedBG = CHOOSE(CHOICE(?VerkoopList:2) % 2,-1,-1)
      SELF.Q.APla3:Transport_NormalFG   = CHOOSE(CHOICE(?VerkoopList:2) % 2,-1,-1) ! Set color values for APla3:Transport
      SELF.Q.APla3:Transport_NormalBG   = CHOOSE(CHOICE(?VerkoopList:2) % 2,-1,8454143)
      SELF.Q.APla3:Transport_SelectedFG = CHOOSE(CHOICE(?VerkoopList:2) % 2,-1,-1)
      SELF.Q.APla3:Transport_SelectedBG = CHOOSE(CHOICE(?VerkoopList:2) % 2,-1,-1)
      SELF.Q.APla3:PlanningID_NormalFG   = CHOOSE(CHOICE(?VerkoopList:2) % 2,-1,-1) ! Set color values for APla3:PlanningID
      SELF.Q.APla3:PlanningID_NormalBG   = CHOOSE(CHOICE(?VerkoopList:2) % 2,-1,8454143)
      SELF.Q.APla3:PlanningID_SelectedFG = CHOOSE(CHOICE(?VerkoopList:2) % 2,-1,-1)
      SELF.Q.APla3:PlanningID_SelectedBG = CHOOSE(CHOICE(?VerkoopList:2) % 2,-1,-1)
  !----------------------------------------------------------------------


BRW11.Fetch PROCEDURE(BYTE Direction)

GreenBarIndex   LONG,AUTO
  CODE
  PARENT.Fetch(Direction)
  !----------------------------------------------------------------------
    LOOP GreenBarIndex=1 TO RECORDS(SELF.Q)
      GET(SELF.Q,GreenBarIndex)
      SELF.Q.ACT:Datum_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for ACT:Datum
      SELF.Q.ACT:Datum_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.ACT:Datum_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.ACT:Datum_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.ACT:Tijd_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for ACT:Tijd
      SELF.Q.ACT:Tijd_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.ACT:Tijd_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.ACT:Tijd_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.ACT:Uitgevoerd_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for ACT:Uitgevoerd
      SELF.Q.ACT:Uitgevoerd_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.ACT:Uitgevoerd_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.ACT:Uitgevoerd_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.ACT:Omschrijving_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for ACT:Omschrijving
      SELF.Q.ACT:Omschrijving_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.ACT:Omschrijving_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.ACT:Omschrijving_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.AAPla3:ArtikelID_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for AAPla3:ArtikelID
      SELF.Q.AAPla3:ArtikelID_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.AAPla3:ArtikelID_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.AAPla3:ArtikelID_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.AAPla3:ArtikelOms_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for AAPla3:ArtikelOms
      SELF.Q.AAPla3:ArtikelOms_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.AAPla3:ArtikelOms_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.AAPla3:ArtikelOms_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.AAPla3:FirmaNaam_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for AAPla3:FirmaNaam
      SELF.Q.AAPla3:FirmaNaam_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.AAPla3:FirmaNaam_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.AAPla3:FirmaNaam_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.AAPla3:PartijID_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for AAPla3:PartijID
      SELF.Q.AAPla3:PartijID_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.AAPla3:PartijID_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.AAPla3:PartijID_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.AAPla3:ExternPartijnr_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for AAPla3:ExternPartijnr
      SELF.Q.AAPla3:ExternPartijnr_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.AAPla3:ExternPartijnr_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.AAPla3:ExternPartijnr_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.LOC:VerkoopKG3_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for LOC:VerkoopKG3
      SELF.Q.LOC:VerkoopKG3_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.LOC:VerkoopKG3_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.LOC:VerkoopKG3_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.AAPla3:Planning_TIME_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for AAPla3:Planning_TIME
      SELF.Q.AAPla3:Planning_TIME_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.AAPla3:Planning_TIME_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.AAPla3:Planning_TIME_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.AAPla3:Planning_DATE_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for AAPla3:Planning_DATE
      SELF.Q.AAPla3:Planning_DATE_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.AAPla3:Planning_DATE_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.AAPla3:Planning_DATE_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.AAPla3:Instructie_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for AAPla3:Instructie
      SELF.Q.AAPla3:Instructie_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.AAPla3:Instructie_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.AAPla3:Instructie_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.AAPla3:VerpakkingOmschrijving_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for AAPla3:VerpakkingOmschrijving
      SELF.Q.AAPla3:VerpakkingOmschrijving_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.AAPla3:VerpakkingOmschrijving_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.AAPla3:VerpakkingOmschrijving_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.LOC:VerkoopPallets3_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for LOC:VerkoopPallets3
      SELF.Q.LOC:VerkoopPallets3_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.LOC:VerkoopPallets3_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.LOC:VerkoopPallets3_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.AAPla3:MutatieGemaakt_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for AAPla3:MutatieGemaakt
      SELF.Q.AAPla3:MutatieGemaakt_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.AAPla3:MutatieGemaakt_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.AAPla3:MutatieGemaakt_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.AAPla3:Geprint_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for AAPla3:Geprint
      SELF.Q.AAPla3:Geprint_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.AAPla3:Geprint_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.AAPla3:Geprint_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.AAPla3:Verwerkt_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for AAPla3:Verwerkt
      SELF.Q.AAPla3:Verwerkt_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.AAPla3:Verwerkt_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.AAPla3:Verwerkt_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.AAPla3:Gewogen_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for AAPla3:Gewogen
      SELF.Q.AAPla3:Gewogen_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.AAPla3:Gewogen_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.AAPla3:Gewogen_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.AAPla3:CelOms_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for AAPla3:CelOms
      SELF.Q.AAPla3:CelOms_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.AAPla3:CelOms_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.AAPla3:CelOms_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.LOC:Locatienaam3_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for LOC:Locatienaam3
      SELF.Q.LOC:Locatienaam3_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.LOC:Locatienaam3_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.LOC:Locatienaam3_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.AAPla3:LeverancierFirmaNaam_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for AAPla3:LeverancierFirmaNaam
      SELF.Q.AAPla3:LeverancierFirmaNaam_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.AAPla3:LeverancierFirmaNaam_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.AAPla3:LeverancierFirmaNaam_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.AAPla3:Transport_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for AAPla3:Transport
      SELF.Q.AAPla3:Transport_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.AAPla3:Transport_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.AAPla3:Transport_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.AAPla3:PlanningID_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for AAPla3:PlanningID
      SELF.Q.AAPla3:PlanningID_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.AAPla3:PlanningID_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.AAPla3:PlanningID_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      PUT(SELF.Q)
    END
  !----------------------------------------------------------------------


BRW11.Init PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)

  CODE
  PARENT.Init(ListBox,Posit,V,Q,RM,WM)
  IF WM.Request <> ViewRecord                              ! If called for anything other than ViewMode, make the insert, change & delete controls available
    SELF.InsertControl=?Insert
    SELF.ChangeControl=?Change
    SELF.DeleteControl=?Delete
  END


BRW11.PrimeRecord PROCEDURE(BYTE SuppressClear = 0)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.PrimeRecord(SuppressClear)
  ACT:Datum = TODAY()
  RETURN ReturnValue


BRW11.ResetQueue PROCEDURE(BYTE ResetMode)

  CODE
  DO KleurActiviteitTab
  PARENT.ResetQueue(ResetMode)


BRW11.SetQueueRecord PROCEDURE

  CODE
  LOC:Locatienaam3 = CachingClass.GetCelLocatieNaam(AAPla3:PartijID,AAPla3:CelID)
  
  IF AAPla3:MutatieGemaakt THEN
  	LOC:VerkoopKG3 = AAPla3:MutatieKG
  	LOC:VerkoopPallets3 = AAPla3:MutatiePallets
  ELSE
  	LOC:VerkoopKG3 = AAPla3:KG
  	LOC:VerkoopPallets3 = AAPla3:Pallets
  END
  PARENT.SetQueueRecord
  If SELF.Q.LOC:VerkoopKG3<0
  	Self.Q.LOC:VerkoopKG3_NormalFG   = Color:Red
  	Self.Q.LOC:VerkoopKG3_NormalBG   = Color:Red
  	Self.Q.LOC:VerkoopKG3_SelectedFG = Color:Red
  	Self.Q.LOC:VerkoopKG3_SelectedBG = Color:Red
  	Self.Q.LOC:VerkoopPallets3_NormalFG   = Color:Red
  	Self.Q.LOC:VerkoopPallets3_SelectedFG = Color:Red
  END
  
  IF (ACT:Uitgevoerd = 1)
    SELF.Q.ACT:Uitgevoerd_Icon = 2                         ! Set icon from icon list
  ELSE
    SELF.Q.ACT:Uitgevoerd_Icon = 1                         ! Set icon from icon list
  END
  CLEAR (SELF.Q.AAPla3:Instructie_Tip)
  IF (AAPla3:MutatieGemaakt=1)
    SELF.Q.AAPla3:MutatieGemaakt_Icon = 2                  ! Set icon from icon list
  ELSE
    SELF.Q.AAPla3:MutatieGemaakt_Icon = 1                  ! Set icon from icon list
  END
  IF (AAPla3:Geprint=1)
    SELF.Q.AAPla3:Geprint_Icon = 2                         ! Set icon from icon list
  ELSE
    SELF.Q.AAPla3:Geprint_Icon = 1                         ! Set icon from icon list
  END
  IF (AAPla3:Verwerkt=1)
    SELF.Q.AAPla3:Verwerkt_Icon = 2                        ! Set icon from icon list
  ELSE
    SELF.Q.AAPla3:Verwerkt_Icon = 1                        ! Set icon from icon list
  END
  IF (AAPla3:Gewogen=1)
    SELF.Q.AAPla3:Gewogen_Icon = 2                         ! Set icon from icon list
  ELSE
    SELF.Q.AAPla3:Gewogen_Icon = 1                         ! Set icon from icon list
  END
  CLEAR (SELF.Q.AAPla3:Transport_Tip)
  CLEAR (SELF.Q.AAPla3:PlanningID_Tip)
  !----------------------------------------------------------------------
      SELF.Q.ACT:Datum_NormalFG   = CHOOSE(CHOICE(?List) % 2,-1,-1) ! Set color values for ACT:Datum
      SELF.Q.ACT:Datum_NormalBG   = CHOOSE(CHOICE(?List) % 2,-1,8454143)
      SELF.Q.ACT:Datum_SelectedFG = CHOOSE(CHOICE(?List) % 2,-1,-1)
      SELF.Q.ACT:Datum_SelectedBG = CHOOSE(CHOICE(?List) % 2,-1,-1)
      SELF.Q.ACT:Tijd_NormalFG   = CHOOSE(CHOICE(?List) % 2,-1,-1) ! Set color values for ACT:Tijd
      SELF.Q.ACT:Tijd_NormalBG   = CHOOSE(CHOICE(?List) % 2,-1,8454143)
      SELF.Q.ACT:Tijd_SelectedFG = CHOOSE(CHOICE(?List) % 2,-1,-1)
      SELF.Q.ACT:Tijd_SelectedBG = CHOOSE(CHOICE(?List) % 2,-1,-1)
      SELF.Q.ACT:Uitgevoerd_NormalFG   = CHOOSE(CHOICE(?List) % 2,-1,-1) ! Set color values for ACT:Uitgevoerd
      SELF.Q.ACT:Uitgevoerd_NormalBG   = CHOOSE(CHOICE(?List) % 2,-1,8454143)
      SELF.Q.ACT:Uitgevoerd_SelectedFG = CHOOSE(CHOICE(?List) % 2,-1,-1)
      SELF.Q.ACT:Uitgevoerd_SelectedBG = CHOOSE(CHOICE(?List) % 2,-1,-1)
      SELF.Q.ACT:Omschrijving_NormalFG   = CHOOSE(CHOICE(?List) % 2,-1,-1) ! Set color values for ACT:Omschrijving
      SELF.Q.ACT:Omschrijving_NormalBG   = CHOOSE(CHOICE(?List) % 2,-1,8454143)
      SELF.Q.ACT:Omschrijving_SelectedFG = CHOOSE(CHOICE(?List) % 2,-1,-1)
      SELF.Q.ACT:Omschrijving_SelectedBG = CHOOSE(CHOICE(?List) % 2,-1,-1)
      SELF.Q.AAPla3:ArtikelID_NormalFG   = CHOOSE(CHOICE(?List) % 2,-1,-1) ! Set color values for AAPla3:ArtikelID
      SELF.Q.AAPla3:ArtikelID_NormalBG   = CHOOSE(CHOICE(?List) % 2,-1,8454143)
      SELF.Q.AAPla3:ArtikelID_SelectedFG = CHOOSE(CHOICE(?List) % 2,-1,-1)
      SELF.Q.AAPla3:ArtikelID_SelectedBG = CHOOSE(CHOICE(?List) % 2,-1,-1)
      SELF.Q.AAPla3:ArtikelOms_NormalFG   = CHOOSE(CHOICE(?List) % 2,-1,-1) ! Set color values for AAPla3:ArtikelOms
      SELF.Q.AAPla3:ArtikelOms_NormalBG   = CHOOSE(CHOICE(?List) % 2,-1,8454143)
      SELF.Q.AAPla3:ArtikelOms_SelectedFG = CHOOSE(CHOICE(?List) % 2,-1,-1)
      SELF.Q.AAPla3:ArtikelOms_SelectedBG = CHOOSE(CHOICE(?List) % 2,-1,-1)
      SELF.Q.AAPla3:FirmaNaam_NormalFG   = CHOOSE(CHOICE(?List) % 2,-1,-1) ! Set color values for AAPla3:FirmaNaam
      SELF.Q.AAPla3:FirmaNaam_NormalBG   = CHOOSE(CHOICE(?List) % 2,-1,8454143)
      SELF.Q.AAPla3:FirmaNaam_SelectedFG = CHOOSE(CHOICE(?List) % 2,-1,-1)
      SELF.Q.AAPla3:FirmaNaam_SelectedBG = CHOOSE(CHOICE(?List) % 2,-1,-1)
      SELF.Q.AAPla3:PartijID_NormalFG   = CHOOSE(CHOICE(?List) % 2,-1,-1) ! Set color values for AAPla3:PartijID
      SELF.Q.AAPla3:PartijID_NormalBG   = CHOOSE(CHOICE(?List) % 2,-1,8454143)
      SELF.Q.AAPla3:PartijID_SelectedFG = CHOOSE(CHOICE(?List) % 2,-1,-1)
      SELF.Q.AAPla3:PartijID_SelectedBG = CHOOSE(CHOICE(?List) % 2,-1,-1)
      SELF.Q.AAPla3:ExternPartijnr_NormalFG   = CHOOSE(CHOICE(?List) % 2,-1,-1) ! Set color values for AAPla3:ExternPartijnr
      SELF.Q.AAPla3:ExternPartijnr_NormalBG   = CHOOSE(CHOICE(?List) % 2,-1,8454143)
      SELF.Q.AAPla3:ExternPartijnr_SelectedFG = CHOOSE(CHOICE(?List) % 2,-1,-1)
      SELF.Q.AAPla3:ExternPartijnr_SelectedBG = CHOOSE(CHOICE(?List) % 2,-1,-1)
      SELF.Q.LOC:VerkoopKG3_NormalFG   = CHOOSE(CHOICE(?List) % 2,-1,-1) ! Set color values for LOC:VerkoopKG3
      SELF.Q.LOC:VerkoopKG3_NormalBG   = CHOOSE(CHOICE(?List) % 2,-1,8454143)
      SELF.Q.LOC:VerkoopKG3_SelectedFG = CHOOSE(CHOICE(?List) % 2,-1,-1)
      SELF.Q.LOC:VerkoopKG3_SelectedBG = CHOOSE(CHOICE(?List) % 2,-1,-1)
      SELF.Q.AAPla3:Planning_TIME_NormalFG   = CHOOSE(CHOICE(?List) % 2,-1,-1) ! Set color values for AAPla3:Planning_TIME
      SELF.Q.AAPla3:Planning_TIME_NormalBG   = CHOOSE(CHOICE(?List) % 2,-1,8454143)
      SELF.Q.AAPla3:Planning_TIME_SelectedFG = CHOOSE(CHOICE(?List) % 2,-1,-1)
      SELF.Q.AAPla3:Planning_TIME_SelectedBG = CHOOSE(CHOICE(?List) % 2,-1,-1)
      SELF.Q.AAPla3:Planning_DATE_NormalFG   = CHOOSE(CHOICE(?List) % 2,-1,-1) ! Set color values for AAPla3:Planning_DATE
      SELF.Q.AAPla3:Planning_DATE_NormalBG   = CHOOSE(CHOICE(?List) % 2,-1,8454143)
      SELF.Q.AAPla3:Planning_DATE_SelectedFG = CHOOSE(CHOICE(?List) % 2,-1,-1)
      SELF.Q.AAPla3:Planning_DATE_SelectedBG = CHOOSE(CHOICE(?List) % 2,-1,-1)
      SELF.Q.AAPla3:Instructie_NormalFG   = CHOOSE(CHOICE(?List) % 2,-1,-1) ! Set color values for AAPla3:Instructie
      SELF.Q.AAPla3:Instructie_NormalBG   = CHOOSE(CHOICE(?List) % 2,-1,8454143)
      SELF.Q.AAPla3:Instructie_SelectedFG = CHOOSE(CHOICE(?List) % 2,-1,-1)
      SELF.Q.AAPla3:Instructie_SelectedBG = CHOOSE(CHOICE(?List) % 2,-1,-1)
      SELF.Q.AAPla3:VerpakkingOmschrijving_NormalFG   = CHOOSE(CHOICE(?List) % 2,-1,-1) ! Set color values for AAPla3:VerpakkingOmschrijving
      SELF.Q.AAPla3:VerpakkingOmschrijving_NormalBG   = CHOOSE(CHOICE(?List) % 2,-1,8454143)
      SELF.Q.AAPla3:VerpakkingOmschrijving_SelectedFG = CHOOSE(CHOICE(?List) % 2,-1,-1)
      SELF.Q.AAPla3:VerpakkingOmschrijving_SelectedBG = CHOOSE(CHOICE(?List) % 2,-1,-1)
      SELF.Q.LOC:VerkoopPallets3_NormalFG   = CHOOSE(CHOICE(?List) % 2,-1,-1) ! Set color values for LOC:VerkoopPallets3
      SELF.Q.LOC:VerkoopPallets3_NormalBG   = CHOOSE(CHOICE(?List) % 2,-1,8454143)
      SELF.Q.LOC:VerkoopPallets3_SelectedFG = CHOOSE(CHOICE(?List) % 2,-1,-1)
      SELF.Q.LOC:VerkoopPallets3_SelectedBG = CHOOSE(CHOICE(?List) % 2,-1,-1)
      SELF.Q.AAPla3:MutatieGemaakt_NormalFG   = CHOOSE(CHOICE(?List) % 2,-1,-1) ! Set color values for AAPla3:MutatieGemaakt
      SELF.Q.AAPla3:MutatieGemaakt_NormalBG   = CHOOSE(CHOICE(?List) % 2,-1,8454143)
      SELF.Q.AAPla3:MutatieGemaakt_SelectedFG = CHOOSE(CHOICE(?List) % 2,-1,-1)
      SELF.Q.AAPla3:MutatieGemaakt_SelectedBG = CHOOSE(CHOICE(?List) % 2,-1,-1)
      SELF.Q.AAPla3:Geprint_NormalFG   = CHOOSE(CHOICE(?List) % 2,-1,-1) ! Set color values for AAPla3:Geprint
      SELF.Q.AAPla3:Geprint_NormalBG   = CHOOSE(CHOICE(?List) % 2,-1,8454143)
      SELF.Q.AAPla3:Geprint_SelectedFG = CHOOSE(CHOICE(?List) % 2,-1,-1)
      SELF.Q.AAPla3:Geprint_SelectedBG = CHOOSE(CHOICE(?List) % 2,-1,-1)
      SELF.Q.AAPla3:Verwerkt_NormalFG   = CHOOSE(CHOICE(?List) % 2,-1,-1) ! Set color values for AAPla3:Verwerkt
      SELF.Q.AAPla3:Verwerkt_NormalBG   = CHOOSE(CHOICE(?List) % 2,-1,8454143)
      SELF.Q.AAPla3:Verwerkt_SelectedFG = CHOOSE(CHOICE(?List) % 2,-1,-1)
      SELF.Q.AAPla3:Verwerkt_SelectedBG = CHOOSE(CHOICE(?List) % 2,-1,-1)
      SELF.Q.AAPla3:Gewogen_NormalFG   = CHOOSE(CHOICE(?List) % 2,-1,-1) ! Set color values for AAPla3:Gewogen
      SELF.Q.AAPla3:Gewogen_NormalBG   = CHOOSE(CHOICE(?List) % 2,-1,8454143)
      SELF.Q.AAPla3:Gewogen_SelectedFG = CHOOSE(CHOICE(?List) % 2,-1,-1)
      SELF.Q.AAPla3:Gewogen_SelectedBG = CHOOSE(CHOICE(?List) % 2,-1,-1)
      SELF.Q.AAPla3:CelOms_NormalFG   = CHOOSE(CHOICE(?List) % 2,-1,-1) ! Set color values for AAPla3:CelOms
      SELF.Q.AAPla3:CelOms_NormalBG   = CHOOSE(CHOICE(?List) % 2,-1,8454143)
      SELF.Q.AAPla3:CelOms_SelectedFG = CHOOSE(CHOICE(?List) % 2,-1,-1)
      SELF.Q.AAPla3:CelOms_SelectedBG = CHOOSE(CHOICE(?List) % 2,-1,-1)
      SELF.Q.LOC:Locatienaam3_NormalFG   = CHOOSE(CHOICE(?List) % 2,-1,-1) ! Set color values for LOC:Locatienaam3
      SELF.Q.LOC:Locatienaam3_NormalBG   = CHOOSE(CHOICE(?List) % 2,-1,8454143)
      SELF.Q.LOC:Locatienaam3_SelectedFG = CHOOSE(CHOICE(?List) % 2,-1,-1)
      SELF.Q.LOC:Locatienaam3_SelectedBG = CHOOSE(CHOICE(?List) % 2,-1,-1)
      SELF.Q.AAPla3:LeverancierFirmaNaam_NormalFG   = CHOOSE(CHOICE(?List) % 2,-1,-1) ! Set color values for AAPla3:LeverancierFirmaNaam
      SELF.Q.AAPla3:LeverancierFirmaNaam_NormalBG   = CHOOSE(CHOICE(?List) % 2,-1,8454143)
      SELF.Q.AAPla3:LeverancierFirmaNaam_SelectedFG = CHOOSE(CHOICE(?List) % 2,-1,-1)
      SELF.Q.AAPla3:LeverancierFirmaNaam_SelectedBG = CHOOSE(CHOICE(?List) % 2,-1,-1)
      SELF.Q.AAPla3:Transport_NormalFG   = CHOOSE(CHOICE(?List) % 2,-1,-1) ! Set color values for AAPla3:Transport
      SELF.Q.AAPla3:Transport_NormalBG   = CHOOSE(CHOICE(?List) % 2,-1,8454143)
      SELF.Q.AAPla3:Transport_SelectedFG = CHOOSE(CHOICE(?List) % 2,-1,-1)
      SELF.Q.AAPla3:Transport_SelectedBG = CHOOSE(CHOICE(?List) % 2,-1,-1)
      SELF.Q.AAPla3:PlanningID_NormalFG   = CHOOSE(CHOICE(?List) % 2,-1,-1) ! Set color values for AAPla3:PlanningID
      SELF.Q.AAPla3:PlanningID_NormalBG   = CHOOSE(CHOICE(?List) % 2,-1,8454143)
      SELF.Q.AAPla3:PlanningID_SelectedFG = CHOOSE(CHOICE(?List) % 2,-1,-1)
      SELF.Q.AAPla3:PlanningID_SelectedBG = CHOOSE(CHOICE(?List) % 2,-1,-1)
  !----------------------------------------------------------------------


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window
  SELF.SetStrategy(?InkoopPrint, Resize:FixLeft, Resize:LockSize) ! Override strategy for ?InkoopPrint
  SELF.SetStrategy(?Calendar, Resize:FixLeft+Resize:FixTop, Resize:LockSize) ! Override strategy for ?Calendar
  SELF.SetStrategy(?InkoopVerwerk, Resize:FixLeft, Resize:LockSize) ! Override strategy for ?InkoopVerwerk
  SELF.SetStrategy(?InkoopInslag, Resize:FixLeft, Resize:LockSize) ! Override strategy for ?InkoopInslag
  SELF.SetStrategy(?InkoopHVerwerkt, Resize:FixRight, Resize:LockSize) ! Override strategy for ?InkoopHVerwerkt
  SELF.SetStrategy(?VerkoopUitslag, Resize:FixLeft, Resize:LockSize) ! Override strategy for ?VerkoopUitslag
  SELF.SetStrategy(?VerkoopHVerwerkt, Resize:FixRight, Resize:LockSize) ! Override strategy for ?VerkoopHVerwerkt
  SELF.SetStrategy(?VerkoopPrintCMR, Resize:FixLeft, Resize:LockSize) ! Override strategy for ?VerkoopPrintCMR
  SELF.SetStrategy(?VerkoopExcel, Resize:FixLeft, Resize:LockSize) ! Override strategy for ?VerkoopExcel
  SELF.SetStrategy(?Loc:DatumNu:Prompt, Resize:FixLeft+Resize:FixTop, Resize:LockSize) ! Override strategy for ?Loc:DatumNu:Prompt
  SELF.SetStrategy(?Loc:DatumNu, Resize:FixLeft+Resize:FixTop, Resize:LockSize) ! Override strategy for ?Loc:DatumNu
  SELF.SetStrategy(?OverboekDoen, Resize:FixLeft, Resize:LockSize) ! Override strategy for ?OverboekDoen
  SELF.SetStrategy(?OverboekVerwerkt, Resize:FixLeft, Resize:LockSize) ! Override strategy for ?OverboekVerwerkt
  SELF.SetStrategy(?Ritten, Resize:FixRight, Resize:LockSize) ! Override strategy for ?Ritten
  SELF.SetStrategy(?BulkOverboeken, Resize:FixLeft, Resize:LockSize) ! Override strategy for ?BulkOverboeken
  SELF.SetStrategy(?PrintOverboekingStickers, Resize:FixLeft, Resize:LockSize) ! Override strategy for ?PrintOverboekingStickers
  SELF.SetStrategy(?TransferButton2, Resize:FixRight, Resize:LockSize) ! Override strategy for ?TransferButton2
  SELF.SetStrategy(?InkoopString, Resize:FixLeft, Resize:LockSize) ! Override strategy for ?InkoopString
  SELF.SetStrategy(?OverboekingString, Resize:FixLeft, Resize:LockSize) ! Override strategy for ?OverboekingString
  SELF.SetStrategy(?VerkopenString, Resize:FixLeft, Resize:LockSize) ! Override strategy for ?VerkopenString
  SELF.SetStrategy(?VerkoopSjabloon, Resize:FixLeft, Resize:LockSize) ! Override strategy for ?VerkoopSjabloon
  SELF.SetStrategy(?UitslagWeging, Resize:FixLeft, Resize:LockSize) ! Override strategy for ?UitslagWeging
  SELF.SetStrategy(?InslagWeging, Resize:FixLeft, Resize:LockSize) ! Override strategy for ?InslagWeging
  SELF.SetStrategy(?Gister, Resize:FixLeft+Resize:FixTop, Resize:LockSize) ! Override strategy for ?Gister
  SELF.SetStrategy(?Morgen, Resize:FixLeft+Resize:FixTop, Resize:LockSize) ! Override strategy for ?Morgen
  SELF.SetStrategy(?PrintInslagRapport, Resize:FixLeft, Resize:LockSize) ! Override strategy for ?PrintInslagRapport
  SELF.SetStrategy(?PrintUitslagRapport, Resize:FixLeft, Resize:LockSize) ! Override strategy for ?PrintUitslagRapport
  SELF.SetStrategy(?InkoopTerugdraaienButton, Resize:FixLeft, Resize:LockSize) ! Override strategy for ?InkoopTerugdraaienButton
  SELF.SetStrategy(?VerkoopTerugdraaienButton, Resize:FixLeft, Resize:LockSize) ! Override strategy for ?VerkoopTerugdraaienButton
  SELF.SetStrategy(?VerkoopVerwerkt, Resize:FixLeft, Resize:LockSize) ! Override strategy for ?VerkoopVerwerkt
  SELF.SetStrategy(?VerkoopRapport, Resize:FixLeft, Resize:LockSize) ! Override strategy for ?VerkoopRapport
  SELF.SetStrategy(?Ritten, Resize:FixRight, Resize:LockSize) ! Override strategy for ?Ritten
  SELF.SetStrategy(?WeeglijstInkoop, Resize:FixLeft, Resize:LockSize) ! Override strategy for ?WeeglijstInkoop
  SELF.SetStrategy(?WeeglijstExcelInkoop, Resize:FixLeft, Resize:LockSize) ! Override strategy for ?WeeglijstExcelInkoop
  SELF.SetStrategy(?WeeglijstVerkoop, Resize:FixLeft, Resize:LockSize) ! Override strategy for ?WeeglijstVerkoop
  SELF.SetStrategy(?WeeglijstExcelVerkoop, Resize:FixLeft, Resize:LockSize) ! Override strategy for ?WeeglijstExcelVerkoop
  SELF.SetStrategy(?OverboekSjabloon, Resize:FixLeft, Resize:LockSize) ! Override strategy for ?OverboekSjabloon
  SELF.SetStrategy(?OverboekRapport, Resize:FixLeft, Resize:LockSize) ! Override strategy for ?OverboekRapport
  SELF.SetStrategy(?TransferInkoopButton, Resize:FixRight, Resize:LockSize) ! Override strategy for ?TransferInkoopButton
  SELF.SetStrategy(?InkoopInslag2, Resize:FixLeft+Resize:FixBottom, Resize:LockSize) ! Override strategy for ?InkoopInslag2
  SELF.SetStrategy(?InkoopVerwerk2, Resize:FixLeft+Resize:FixBottom, Resize:LockSize) ! Override strategy for ?InkoopVerwerk2
  SELF.SetStrategy(?InkoopPrint2, Resize:FixLeft+Resize:FixBottom, Resize:LockSize) ! Override strategy for ?InkoopPrint2
  SELF.SetStrategy(?TransferButton2, Resize:FixRight+Resize:FixBottom, Resize:LockSize) ! Override strategy for ?TransferButton2
  SELF.SetStrategy(?InkoopHVerwerkt2, Resize:FixRight+Resize:FixTop, Resize:LockSize) ! Override strategy for ?InkoopHVerwerkt2
  SELF.SetStrategy(?InslagWeging2, Resize:FixLeft+Resize:FixBottom, Resize:LockSize) ! Override strategy for ?InslagWeging2
  SELF.SetStrategy(?Weeglijst2, Resize:FixLeft+Resize:FixBottom, Resize:LockSize) ! Override strategy for ?Weeglijst2
  SELF.SetStrategy(?WeeglijstExcel2, Resize:FixLeft+Resize:FixBottom, Resize:LockSize) ! Override strategy for ?WeeglijstExcel2
  SELF.SetStrategy(?InslagRapportButton2, Resize:FixLeft+Resize:FixBottom, Resize:LockSize) ! Override strategy for ?InslagRapportButton2
  SELF.SetStrategy(?InkoopTerugdraaien2, Resize:FixLeft+Resize:FixBottom, Resize:LockSize) ! Override strategy for ?InkoopTerugdraaien2
  SELF.SetStrategy(?OverboekPrintStickers3, Resize:FixLeft+Resize:FixBottom, Resize:LockSize) ! Override strategy for ?OverboekPrintStickers3
  SELF.SetStrategy(?BulkOverboeken3, Resize:FixLeft+Resize:FixBottom, Resize:LockSize) ! Override strategy for ?BulkOverboeken3
  SELF.SetStrategy(?OverboekVerwerkt3, Resize:FixLeft+Resize:FixBottom, Resize:LockSize) ! Override strategy for ?OverboekVerwerkt3
  SELF.SetStrategy(?OverboekDoen3, Resize:FixLeft+Resize:FixBottom, Resize:LockSize) ! Override strategy for ?OverboekDoen3
  SELF.SetStrategy(?OverboekSjabloon3, Resize:FixLeft+Resize:FixBottom, Resize:LockSize) ! Override strategy for ?OverboekSjabloon3
  SELF.SetStrategy(?OverboekTransfers3, Resize:FixRight+Resize:FixBottom, Resize:LockSize) ! Override strategy for ?OverboekTransfers3
  SELF.SetStrategy(?OverboekRapport3, Resize:FixLeft+Resize:FixBottom, Resize:LockSize) ! Override strategy for ?OverboekRapport3
  SELF.SetStrategy(?VerkoopSjabloon4, Resize:FixLeft+Resize:FixBottom, Resize:LockSize) ! Override strategy for ?VerkoopSjabloon4
  SELF.SetStrategy(?VerkoopUitslag4, Resize:FixLeft+Resize:FixBottom, Resize:LockSize) ! Override strategy for ?VerkoopUitslag4
  SELF.SetStrategy(?VerkoopPrintCMR4, Resize:FixLeft+Resize:FixBottom, Resize:LockSize) ! Override strategy for ?VerkoopPrintCMR4
  SELF.SetStrategy(?VerkoopVerwerkt4, Resize:FixLeft+Resize:FixBottom, Resize:LockSize) ! Override strategy for ?VerkoopVerwerkt4
  SELF.SetStrategy(?VerkoopHVerwerkt4, Resize:FixRight+Resize:FixTop, Resize:LockSize) ! Override strategy for ?VerkoopHVerwerkt4
  SELF.SetStrategy(?VerkoopUitslagWeging4, Resize:FixLeft+Resize:FixBottom, Resize:LockSize) ! Override strategy for ?VerkoopUitslagWeging4
  SELF.SetStrategy(?Weeglijst4, Resize:FixLeft+Resize:FixBottom, Resize:LockSize) ! Override strategy for ?Weeglijst4
  SELF.SetStrategy(?WeeglijstExcel4, Resize:FixLeft+Resize:FixBottom, Resize:LockSize) ! Override strategy for ?WeeglijstExcel4
  SELF.SetStrategy(?UitslagRapport4, Resize:FixLeft+Resize:FixBottom, Resize:LockSize) ! Override strategy for ?UitslagRapport4
  SELF.SetStrategy(?VerkoopTerugdraaienButton4, Resize:FixLeft+Resize:FixBottom, Resize:LockSize) ! Override strategy for ?VerkoopTerugdraaienButton4
  SELF.SetStrategy(?VerkoopRapport4, Resize:FixLeft+Resize:FixBottom, Resize:LockSize) ! Override strategy for ?VerkoopRapport4
  SELF.SetStrategy(?VerkoopPrintPalletblad:2, Resize:FixLeft+Resize:FixBottom, Resize:LockSize) ! Override strategy for ?VerkoopPrintPalletblad:2
  SELF.SetStrategy(?VerkoopPrintPalletblad, Resize:FixLeft, Resize:LockSize) ! Override strategy for ?VerkoopPrintPalletblad
  SELF.SetStrategy(?RefreshButton, Resize:FixRight+Resize:FixBottom, Resize:LockSize) ! Override strategy for ?RefreshButton
  SELF.SetStrategy(?Close, Resize:FixRight+Resize:FixBottom, Resize:LockSize) ! Override strategy for ?Close
  SELF.SetStrategy(?List, Resize:FixLeft+Resize:FixTop, Resize:ConstantRight+Resize:ConstantBottom) ! Override strategy for ?List
  SELF.SetStrategy(?Insert, Resize:FixLeft+Resize:FixBottom, Resize:LockSize) ! Override strategy for ?Insert
  SELF.SetStrategy(?Change, Resize:FixLeft+Resize:FixBottom, Resize:LockSize) ! Override strategy for ?Change
  SELF.SetStrategy(?Delete, Resize:FixLeft+Resize:FixBottom, Resize:LockSize) ! Override strategy for ?Delete
  SELF.SetStrategy(?ActiviteitPanel, Resize:FixLeft+Resize:FixTop, Resize:LockSize) ! Override strategy for ?ActiviteitPanel
  SELF.SetStrategy(?SHEET2, Resize:FixLeft+Resize:FixTop, Resize:ConstantRight+Resize:ConstantBottom) ! Override strategy for ?SHEET2
  SELF.SetStrategy(?VerkoopExcel, Resize:FixLeft+Resize:FixBottom, Resize:LockSize) ! Override strategy for ?VerkoopExcel
  SELF.SetStrategy(?PrintVerkoopStickers:2, Resize:FixLeft+Resize:FixBottom, Resize:LockSize) ! Override strategy for ?PrintVerkoopStickers:2
  SELF.SetStrategy(?PrintVerkoopStickers, Resize:FixLeft, Resize:LockSize) ! Override strategy for ?PrintVerkoopStickers
  SELF.SetStrategy(?VerkoopList:2, Resize:FixLeft+Resize:FixTop, Resize:ConstantRight+Resize:ConstantBottom) ! Override strategy for ?VerkoopList:2
  SELF.SetStrategy(?InkoopList2, Resize:FixLeft+Resize:FixTop, Resize:ConstantRight+Resize:ConstantBottom) ! Override strategy for ?InkoopList2
  SELF.SetStrategy(?OverboekList2, Resize:FixLeft+Resize:FixTop, Resize:ConstantRight+Resize:ConstantBottom) ! Override strategy for ?OverboekList2
  SELF.SetStrategy(?VerkoopPalletbladExport2, Resize:FixLeft+Resize:FixBottom, Resize:LockSize) ! Override strategy for ?VerkoopPalletbladExport2
  SELF.SetStrategy(?VerkoopPalletbladExport, Resize:FixLeft, Resize:LockSize) ! Override strategy for ?VerkoopPalletbladExport

!!! <summary>
!!! Generated from procedure template - Window
!!! </summary>
WindowInslagWeging PROCEDURE 

Loc:FirmaNaam        CSTRING(51)                           ! 
Loc:ArtikelOmschrijving CSTRING(51)                        ! 
Loc:VerpakkingsOmschrijving CSTRING(51)                    ! 
LOC:CelID1           LONG                                  ! 
LOC:CelLocatieID1    LONG                                  ! 
LOC:CelLocatieID2    LONG                                  ! 
LOC:CelLocatieID3    LONG                                  ! 
LOC:CelLocatieID4    LONG                                  ! 
LOC:CelID2           LONG                                  ! 
LOC:CelID3           LONG                                  ! 
LOC:CelID4           LONG                                  ! 
LOC:KG1              DECIMAL(10,2)                         ! 
LOC:KG2              DECIMAL(10,2)                         ! 
LOC:KG3              DECIMAL(10,2)                         ! 
LOC:KG4              DECIMAL(10,2)                         ! 
LOC:KGTeller         DECIMAL(10,2)                         ! 
LOC:Pallets1         LONG                                  ! 
LOC:Pallets2         LONG                                  ! 
LOC:Pallets3         LONG                                  ! 
LOC:Pallets4         LONG                                  ! 
LOC:PalletsTeller    LONG                                  ! 
ActionMessage        CSTRING(40)                           ! 
LOC:KGBalans         STRING(20)                            ! 
LOC:PalletsBalans    STRING(20)                            ! 
LOC:NegatieveVoorraad BYTE                                 ! 
LOC:PlaGeprint       BYTE                                  ! 
LOC:WegingQueue4     QUEUE,PRE(WGQ4)                       ! 
BrutoGewichtKG       DECIMAL(10,2)                         ! 
Palletsoort          CSTRING(11)                           ! 
PalletsoortID        LONG                                  ! 
NettoGewichtKG       DECIMAL(10,2)                         ! 
Datum                DATE                                  ! 
Tijd                 TIME                                  ! 
                     END                                   ! 
LOC:WegingQueue3     QUEUE,PRE(WGQ3)                       ! 
BrutoGewichtKG       DECIMAL(10,2)                         ! 
Palletsoort          CSTRING(11)                           ! 
PalletsoortID        LONG                                  ! 
NettoGewichtKG       DECIMAL(10,2)                         ! 
Datum                DATE                                  ! 
Tijd                 TIME                                  ! 
                     END                                   ! 
LOC:WegingQueue2     QUEUE,PRE(WGQ2)                       ! 
BrutoGewichtKG       DECIMAL(10,2)                         ! 
Palletsoort          CSTRING(11)                           ! 
PalletsoortID        LONG                                  ! 
NettoGewichtKG       DECIMAL(10,2)                         ! 
Datum                DATE                                  ! 
Tijd                 TIME                                  ! 
                     END                                   ! 
LOC:WegingQueue1     QUEUE,PRE(WGQ1)                       ! 
BrutoGewichtKG       DECIMAL(10,2)                         ! 
Palletsoort          CSTRING(11)                           ! 
PalletsoortID        LONG                                  ! 
NettoGewichtKG       DECIMAL(10,2)                         ! 
Datum                DATE                                  ! 
Tijd                 TIME                                  ! 
                     END                                   ! 
LOC:SavedPartijBuffer USHORT                               ! 
LOC:SavedPartijFile  USHORT                                ! 
FDCB1::View:FileDropCombo VIEW(Relatie)
                       PROJECT(Rel:FirmaNaam)
                       PROJECT(Rel:Type)
                     END
FDCB3::View:FileDropCombo VIEW(Verpakking)
                       PROJECT(Ver:VerpakkingOmschrijving)
                     END
FDCB5::View:FileDropCombo VIEW(Cel)
                       PROJECT(CEL:CelOms)
                       PROJECT(CEL:CelID)
                     END
FDCB8::View:FileDropCombo VIEW(ACel)
                       PROJECT(ACel:CelOms)
                       PROJECT(ACel:CelID)
                     END
FDCB9::View:FileDropCombo VIEW(AACel)
                       PROJECT(AACel:CelOms)
                       PROJECT(AACel:CelID)
                     END
FDCB7::View:FileDropCombo VIEW(AAACel)
                       PROJECT(AAACel:CelOms)
                       PROJECT(AAACel:CelID)
                     END
FDCB10::View:FileDropCombo VIEW(ViewArtikel)
                       PROJECT(Art:ArtikelOms)
                     END
FDCB11::View:FileDropCombo VIEW(ACelLocatie)
                       PROJECT(ACL:Locatienaam)
                       PROJECT(ACL:CelLocatieID)
                     END
FDCB12::View:FileDropCombo VIEW(AACelLocatie)
                       PROJECT(AACL:Locatienaam)
                       PROJECT(AACL:CelLocatieID)
                     END
FDCB13::View:FileDropCombo VIEW(AAACelLocatie)
                       PROJECT(AAACL:Locatienaam)
                       PROJECT(AAACL:CelLocatieID)
                     END
FDCB15::View:FileDropCombo VIEW(AAAACelLocatie)
                       PROJECT(AAAACL:Locatienaam)
                       PROJECT(AAAACL:CelLocatieID)
                     END
Queue:FileDropCombo  QUEUE                            !
Rel:FirmaNaam          LIKE(Rel:FirmaNaam)            !List box control field - type derived from field
Rel:Type               LIKE(Rel:Type)                 !Browse hot field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
Queue:FileDropCombo:2 QUEUE                           !
Ver:VerpakkingOmschrijving LIKE(Ver:VerpakkingOmschrijving) !List box control field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
Queue:FileDropCombo:3 QUEUE                           !
CEL:CelOms             LIKE(CEL:CelOms)               !List box control field - type derived from field
CEL:CelID              LIKE(CEL:CelID)                !Primary key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
Queue:FileDropCombo:4 QUEUE                           !
ACel:CelOms            LIKE(ACel:CelOms)              !List box control field - type derived from field
ACel:CelID             LIKE(ACel:CelID)               !Primary key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
Queue:FileDropCombo:5 QUEUE                           !
AACel:CelOms           LIKE(AACel:CelOms)             !List box control field - type derived from field
AACel:CelID            LIKE(AACel:CelID)              !Primary key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
Queue:FileDropCombo:6 QUEUE                           !
AAACel:CelOms          LIKE(AAACel:CelOms)            !List box control field - type derived from field
AAACel:CelID           LIKE(AAACel:CelID)             !Primary key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
Queue:FileDropCombo:7 QUEUE                           !
Art:ArtikelOms         LIKE(Art:ArtikelOms)           !List box control field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
Queue:FileDropCombo:1 QUEUE                           !
ACL:Locatienaam        LIKE(ACL:Locatienaam)          !List box control field - type derived from field
ACL:CelLocatieID       LIKE(ACL:CelLocatieID)         !Primary key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
Queue:FileDropCombo:8 QUEUE                           !
AACL:Locatienaam       LIKE(AACL:Locatienaam)         !List box control field - type derived from field
AACL:CelLocatieID      LIKE(AACL:CelLocatieID)        !Primary key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
Queue:FileDropCombo:9 QUEUE                           !
AAACL:Locatienaam      LIKE(AAACL:Locatienaam)        !List box control field - type derived from field
AAACL:CelLocatieID     LIKE(AAACL:CelLocatieID)       !Primary key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
Queue:FileDropCombo:10 QUEUE                          !
AAAACL:Locatienaam     LIKE(AAAACL:Locatienaam)       !List box control field - type derived from field
AAAACL:CelLocatieID    LIKE(AAAACL:CelLocatieID)      !Primary key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
LocEnableEnterByTab  BYTE(1)                               !Used by the ENTER Instead of Tab template
EnterByTabManager    EnterByTabClass
Window               WINDOW('Inslaan Partij'),AT(,,678,334),FONT('MS Sans Serif',8),ICON('WAOK.ICO'),GRAY,MDI,SYSTEM,IMM
                       PROMPT('Artikel:'),AT(7,21),USE(?PROMPT2)
                       PROMPT('Verpakking:'),AT(7,34),USE(?PROMPT3)
                       PROMPT('Leverancier:<0DH,0AH>'),AT(7,50),USE(?PROMPT1)
                       PROMPT('Extern Partijnr:'),AT(7,83),USE(?Par:ExternPartijnr:Prompt),RIGHT
                       ENTRY(@s20),AT(76,81,96,10),USE(Par:ExternPartijnr),LEFT
                       PROMPT('Hoeveelheid (kg)'),AT(333,3),USE(?Loc:Hoeveelheid:Prompt),RIGHT
                       ENTRY(@n12_`2),AT(329,20,60,10),USE(Par:KG),RIGHT(2),REQ
                       PROMPT('Aantal Pallets:'),AT(404,3),USE(?Loc:AantalPallets:Prompt),RIGHT
                       ENTRY(@n14.),AT(397,20,60,10),USE(Par:Pallets),RIGHT(2),REQ
                       BUTTON('Print Stickers'),AT(463,17),USE(?PrintStickersButton)
                       STRING('Totaal:'),AT(234,18),USE(?STRING1)
                       COMBO(@s50),AT(233,49,84,10),USE(CEL:CelOms),DROP(15),FORMAT('200L(2)~Cel~@s50@'),FROM(Queue:FileDropCombo:3), |
  IMM,REQ
                       COMBO(@s50),AT(233,65,155,10),USE(ACL:Locatienaam),DROP(5),FORMAT('200L(2)|M~Locatienaam~@s50@'), |
  FROM(Queue:FileDropCombo:1),IMM
                       ENTRY(@n12_`2),AT(329,49,60,10),USE(LOC:KG1),RIGHT(2)
                       ENTRY(@n14.),AT(397,49,60,10),USE(LOC:Pallets1),RIGHT(2)
                       BUTTON('Vul vanuit weging'),AT(395,63,61,37),USE(?BUTTON1)
                       LIST,AT(461,49,213,49),USE(?WegingList1),VSCROLL,FORMAT('50R(2)|~Bruto (KG)~C(0)@n14`2@' & |
  '40C|~Palletsoort~@s10@0C(2)@n-14@50R(2)|~Netto (KG)~C(0)@n14`2@'),FROM(LOC:WegingQueue1)
                       BUTTON('Toevoegen'),AT(461,101,41,14),USE(?ToevoegenWeging1)
                       BUTTON('Wijzigen'),AT(505,101,31,14),USE(?WijzigenWeging1)
                       BUTTON('Verwijderen'),AT(539,101,41,14),USE(?VerwijderenWeging1)
                       BUTTON('Etiket'),AT(589,101),USE(?EtiketButton1)
                       BUTTON('Weeg Nu'),AT(631,101,45,14),USE(?WeegNu1)
                       COMBO(@s50),AT(233,122,84,10),USE(ACel:CelOms),DROP(15),FORMAT('200L(2)|M~Cel~@s50@'),FROM(Queue:FileDropCombo:4), |
  IMM
                       COMBO(@s50),AT(233,138,155,10),USE(AACL:Locatienaam),DROP(5),FORMAT('200L(2)|M~Locatienaam~@s50@'), |
  FROM(Queue:FileDropCombo:8),IMM
                       ENTRY(@n12_`2),AT(329,122,60,10),USE(LOC:KG2),RIGHT(2)
                       ENTRY(@n14.),AT(397,122,60,10),USE(LOC:Pallets2),RIGHT(2)
                       BUTTON('Vul vanuit weging'),AT(396,136,61,37),USE(?BUTTON1:2)
                       LIST,AT(461,122,213,49),USE(?WegingList2),VSCROLL,FORMAT('50R(2)|~Bruto (KG)~C(0)@n14`2' & |
  '@40C|~Palletsoort~@s10@0C(2)@n-14@50R(2)|~Netto (KG)~C(0)@n14`2@'),FROM(LOC:WegingQueue2)
                       BUTTON('Toevoegen'),AT(461,174,41,14),USE(?ToevoegenWeging2)
                       BUTTON('Verwijderen'),AT(539,174,41,14),USE(?VerwijderenWeging2)
                       BUTTON('Wijzigen'),AT(505,174,31,14),USE(?WijzigenWeging2)
                       BUTTON('Etiket'),AT(588,174,33,14),USE(?EtiketButton2)
                       BUTTON('Weeg Nu'),AT(631,174,45,14),USE(?WeegNu2)
                       COMBO(@s50),AT(233,196,84,10),USE(AACel:CelOms),DROP(15),FORMAT('200L(2)|M~Cel~@s50@'),FROM(Queue:FileDropCombo:5), |
  IMM
                       COMBO(@s50),AT(233,212,155,10),USE(AAACL:Locatienaam),DROP(5),FORMAT('200L(2)|M~Locatie' & |
  'naam~@s50@'),FROM(Queue:FileDropCombo:9),IMM
                       ENTRY(@n12_`2),AT(329,196,60,10),USE(LOC:KG3),RIGHT(2)
                       ENTRY(@n14.),AT(397,196,60,10),USE(LOC:Pallets3),RIGHT(2)
                       LIST,AT(461,196,213,49),USE(?WegingList3),VSCROLL,FORMAT('50R(2)|~Bruto (KG)~C(0)@n14`2' & |
  '@40C|~Palletsoort~@s10@0C(2)@n-14@50R(2)|~Netto (KG)~C(0)@n14`2@'),FROM(LOC:WegingQueue3)
                       BUTTON('Vul vanuit weging'),AT(396,210,61,37),USE(?BUTTON1:3)
                       BUTTON('Toevoegen'),AT(461,247,41,14),USE(?ToevoegenWeging3)
                       BUTTON('Verwijderen'),AT(539,247,41,14),USE(?VerwijderenWeging3)
                       BUTTON('Wijzigen'),AT(505,247,31,14),USE(?WijzigenWeging3)
                       BUTTON('Etiket'),AT(588,247,33,14),USE(?EtiketButton3)
                       BUTTON('Weeg Nu'),AT(631,247,45,14),USE(?WeegNu3)
                       COMBO(@s20),AT(233,269,84,10),USE(AAACel:CelOms),DROP(15),FORMAT('200L(2)|M~Cel~@s50@'),FROM(Queue:FileDropCombo:6), |
  IMM
                       COMBO(@s50),AT(233,283,155,10),USE(AAAACL:Locatienaam),DROP(5),FORMAT('200L(2)|M~Locati' & |
  'enaam~@s50@'),FROM(Queue:FileDropCombo:10),IMM
                       ENTRY(@n12_`2),AT(329,269,60,10),USE(LOC:KG4),RIGHT(2)
                       ENTRY(@n14.),AT(397,269,60,10),USE(LOC:Pallets4),RIGHT(2)
                       BUTTON('Vul vanuit weging'),AT(396,282,61,37),USE(?BUTTON1:4)
                       LIST,AT(461,267,213,49),USE(?WegingList4),VSCROLL,FORMAT('50R(2)|~Bruto (KG)~C(0)@n14`2' & |
  '@40C|~Palletsoort~@s10@0C(2)@n-14@50R(2)|~Netto (KG)~C(0)@n14`2@'),FROM(LOC:WegingQueue4)
                       BUTTON('Toevoegen'),AT(460,317,41,14),USE(?ToevoegenWeging4)
                       BUTTON('Wijzigen'),AT(505,317,31,14),USE(?WijzigenWeging4)
                       BUTTON('Verwijderen'),AT(539,317,41,14),USE(?VerwijderenWeging4)
                       BUTTON('Etiket'),AT(588,317,33,14),USE(?EtiketButton4)
                       BUTTON('Weeg Nu'),AT(631,317,45,14),USE(?WeegNu4)
                       PROMPT('Aanmaakdatum:'),AT(7,6),USE(?PROMPT4)
                       BUTTON('OK'),AT(180,80,47,14),USE(?OKButton),LEFT,ICON('WAOK.ICO'),DEFAULT,REQ
                       BUTTON('&Annuleer'),AT(231,80,52,14),USE(?CancelButton),LEFT,ICON('WACancel.ico'),STD(STD:Close)
                       PROMPT('Aanmaak Datum DATE:'),AT(86,7,0,0),USE(?Par:AanmaakDatum_DATE:Prompt)
                       ENTRY(@d6-),AT(76,6,53,9),USE(Par:AanmaakDatum_DATE),RIGHT
                       PROMPT('Aanmaak Datum TIME:'),AT(201,5,0,0),USE(?Par:AanmaakDatum_TIME:Prompt)
                       ENTRY(@t7),AT(141,6,31,9),USE(Par:AanmaakDatum_TIME),RIGHT
                       STRING('BalansKG'),AT(327,34,61),USE(?KGBalans),RIGHT
                       STRING('BalansPallets'),AT(396,34,61),USE(?PalletsBalans),RIGHT
                       STRING(@N_10),AT(627,3),USE(Par:PartijID,,?Par:PartijID:2)
                       PROMPT('Referentie:'),AT(7,66),USE(?Par:Referentie:Prompt)
                       COMBO(@s50),AT(76,50,150,10),USE(Rel:FirmaNaam),DROP(25),FORMAT('200L(2)~Firmanaam~@s50@'), |
  FROM(Queue:FileDropCombo),IMM,REQ
                       COMBO(@s50),AT(76,35,150,10),USE(Ver:VerpakkingOmschrijving),DROP(25),FORMAT('200L(2)~Ve' & |
  'rpakking~@s50@'),FROM(Queue:FileDropCombo:2),IMM,REQ
                       COMBO(@s60),AT(76,20,150,10),USE(Art:ArtikelOms,,?Art:ArtikelOms:2),DROP(5),FORMAT('240L(2)|M~' & |
  'Artikel Oms~L(0)@s60@'),FROM(Queue:FileDropCombo:7),IMM
                       ENTRY(@s50),AT(76,65,150,10),USE(Par:Referentie)
                       PROMPT('Partij-nr.:'),AT(594,3),USE(?PROMPT5)
                       GROUP('Kwaliteit'),AT(7,95,220,236),USE(?GROUP1),BOXED
                         CHECK('Is transportmiddel schoon?'),AT(12,105),USE(Par:InslagQATransportmiddelSchoon),VALUE('1', |
  '0')
                         CHECK('Is verpakking schoon en gesloten?'),AT(12,116),USE(Par:InslagQAVerpakkingSchoonGesloten), |
  VALUE('1','0')
                         CHECK('Identificatie merken aanwezig op verpakkingen?'),AT(12,127,167),USE(Par:InslagQAIdentificatieMerkenVerpakking), |
  VALUE('1','0')
                         CHECK('Is geur/kleur producteigen?'),AT(12,139),USE(Par:InslagQAIsGeurKleurProductEigen)
                         CHECK('Geen glasbreuk?'),AT(12,150),USE(Par:InslagQAGeenGlasbreuk)
                         PROMPT('Behandeld door:'),AT(12,164),USE(?PROMPT6)
                         ENTRY(@s40),AT(70,164,107,10),USE(Par:InslagQAUitgevoerdDoor)
                         PROMPT('Gemeten temperaturen:'),AT(12,175),USE(?Par:InslagQATemperatuur1:Prompt)
                         ENTRY(@s20),AT(13,183,52,10),USE(Par:InslagQATemperatuur1)
                         ENTRY(@s20),AT(70,183,50,10),USE(Par:InslagQATemperatuur2)
                         ENTRY(@s20),AT(128,183,50,10),USE(Par:InslagQATemperatuur3)
                         PROMPT('Temperatuur Vervoermiddel:'),AT(12,196),USE(?Par:InslagQATemperatuurVervoermiddel:Prompt)
                         ENTRY(@s20),AT(105,196,60,10),USE(Par:InslagQATemperatuurVervoermiddel)
                         PROMPT('Afwijking:'),AT(12,209),USE(?Par:InslagQAActieAfwijkingen:Prompt)
                         TEXT,AT(97,209,125,33),USE(Par:InslagQAActieAfwijkingen,,?Par:InslagQAActieAfwijkingen:2)
                         PROMPT('Corrigerende Maatregel:'),AT(13,274),USE(?Par:CorrigerendeMaatregel:Prompt)
                         TEXT,AT(97,247,125,25),USE(Par:CorrectieveMaatregel,,?Par:CorrectieveMaatregel:2)
                         PROMPT('Afgehandeld:'),AT(15,301),USE(?Par:Afgehandeld:Prompt)
                         TEXT,AT(97,277,125,20),USE(Par:CorrigerendeMaatregel,,?Par:CorrigerendeMaatregel:2),HVSCROLL
                         TEXT,AT(97,302,125,23),USE(Par:Afgehandeld,,?Par:Afgehandeld:2),HVSCROLL
                         PROMPT('CorrectieveMaatregel'),AT(13,244),USE(?Par:CorrectieveMaatregel:Prompt)
                       END
                     END

    omit('***',WE::CantCloseNowSetHereDone=1)  !Getting Nested omit compile error, then uncheck the "Check for duplicate CantCloseNowSetHere variable declaration" in the WinEvent local template
WE::CantCloseNowSetHereDone equate(1)
WE::CantCloseNowSetHere     long
    !***
ThisWindow           CLASS(WindowManager)
Ask                    PROCEDURE(),DERIVED
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
PrimeUpdate            PROCEDURE(),BYTE,PROC,DERIVED
Run                    PROCEDURE(),BYTE,PROC,DERIVED
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED
TakeCloseEvent         PROCEDURE(),BYTE,PROC,DERIVED
TakeCompleted          PROCEDURE(),BYTE,PROC,DERIVED
TakeEvent              PROCEDURE(),BYTE,PROC,DERIVED
TakeFieldEvent         PROCEDURE(),BYTE,PROC,DERIVED
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED
VerwijderDubbeleInslag PROCEDURE(Par:Record PartijRecord, LONG CelID) ! New method added to this class instance
                     END

Toolbar              ToolbarClass
FDCB1                CLASS(FileDropComboClass)             ! File drop combo manager
Q                      &Queue:FileDropCombo           !Reference to browse queue type
                     END

FDCB3                CLASS(FileDropComboClass)             ! File drop combo manager
Q                      &Queue:FileDropCombo:2         !Reference to browse queue type
                     END

FDCB5                CLASS(FileDropComboClass)             ! File drop combo manager
Q                      &Queue:FileDropCombo:3         !Reference to browse queue type
                     END

FDCB8                CLASS(FileDropComboClass)             ! File drop combo manager
Q                      &Queue:FileDropCombo:4         !Reference to browse queue type
                     END

FDCB9                CLASS(FileDropComboClass)             ! File drop combo manager
Q                      &Queue:FileDropCombo:5         !Reference to browse queue type
                     END

FDCB7                CLASS(FileDropComboClass)             ! File drop combo manager
Q                      &Queue:FileDropCombo:6         !Reference to browse queue type
                     END

FDCB10               CLASS(FileDropComboClass)             ! File drop combo manager
Q                      &Queue:FileDropCombo:7         !Reference to browse queue type
                     END

FDCB11               CLASS(FileDropComboClass)             ! File drop combo manager
Q                      &Queue:FileDropCombo:1         !Reference to browse queue type
                     END

FDCB12               CLASS(FileDropComboClass)             ! File drop combo manager
Q                      &Queue:FileDropCombo:8         !Reference to browse queue type
                     END

FDCB13               CLASS(FileDropComboClass)             ! File drop combo manager
Q                      &Queue:FileDropCombo:9         !Reference to browse queue type
                     END

FDCB15               CLASS(FileDropComboClass)             ! File drop combo manager
Q                      &Queue:FileDropCombo:10        !Reference to browse queue type
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
ControleerVoorraad  ROUTINE
	LOC:NegatieveVoorraad = false
	Clear(Mut:Record)
	Mut:PartijID = Par:PartijID
	SET(Mut:Mutatie_FK01, Mut:Mutatie_FK01)
	LOOP
		IF NOT(Access:Mutatie.Next() = Level:Benign) THEN BREAK.
		IF NOT(Mut:PartijID = Par:PartijID) THEN BREAK.
		
		IF Mut:SoortMutatie = 'IN' THEN
			! Deze mutatie wordt verwijderd, controleer wat het gevolg is van de
			! inslag-wijziging
			
			LOC:KGTeller = 0
			LOC:PalletsTeller = 0
			
			IF Par:ArtikelID <> Mut:ArtikelID
				db.DebugOut('Ongelijk artikel:'&Par:ArtikelID & ',' & Mut:ArtikelID)
				
				! Ander artikel, inslag-wijzigingen zijn dus niet relevant
				CLEAR(VVPar:Record)
				VVPar:ArtikelID = Mut:ArtikelID
				VVPar:PartijID = Mut:PartijID
				VVPar:CelID = Mut:CelID
				IF (Access:ViewVoorraadPartij.TryFetch(VVPar:ArtikelID_PartijID_CelID_K) = Level:Benign)
					IF VVPar:VoorraadKG < Mut:InslagKG !OR VVPar:VoorraadPallets < Mut:InslagPallet THEN
						DO MessageNietMogelijk
						BREAK
					.
				ELSE
					DO MessageNietMogelijk
					BREAK
				.
			ELSE
				! Zelfde artikel, inslag-wijzigingen zijn dus relevant
				IF LOC:CelID1 = Mut:CelID
					LOC:KGTeller+=LOC:KG1
					LOC:PalletsTeller+=LOC:Pallets1
				.
				
				IF LOC:CelID2 = Mut:CelID
					LOC:KGTeller+=LOC:KG2
					LOC:PalletsTeller+=LOC:Pallets2
				.

				IF LOC:CelID3 = Mut:CelID
					LOC:KGTeller+=LOC:KG3
					LOC:PalletsTeller+=LOC:Pallets3
				.

				IF LOC:CelID4 = Mut:CelID
					LOC:KGTeller+=LOC:KG4
					LOC:PalletsTeller+=LOC:Pallets4
				.
				
				db.DebugOut('Zelfde artikel:'&LOC:KGTeller&','&LOC:PalletsTeller)
				
				CLEAR(VVPar:Record)
				VVPar:ArtikelID = Mut:ArtikelID
				VVPar:PartijID = Mut:PartijID
				VVPar:CelID = Mut:CelID
				IF (Access:ViewVoorraadPartij.TryFetch(VVPar:ArtikelID_PartijID_CelID_K) = Level:Benign)
					IF VVPar:VoorraadKG + LOC:KGTeller < Mut:InslagKG !OR VVPar:VoorraadPallets + LOC:PalletsTeller < Mut:InslagPallet THEN
						LOC:NegatieveVoorraad = TRUE
						DO MessageNietMogelijk
						BREAK
					.
				ELSE
					IF LOC:KGTeller < Mut:InslagKG !OR LOC:PalletsTeller < Mut:InslagPallet THEN
						DO MessageNietMogelijk
						BREAK
					.
				.
			.
		END
	END
	
	EXIT
MessageNietMogelijk ROUTINE
	Cel:CelID = Mut:CelID
	Access:Cel.TryFetch(Cel:CEL_PK)
	MESSAGE('Inslagwijziging niet mogelijk, resulteert in negatieve voorraad (' & |
		CLIP(Format(VVPar:VoorraadKG, @n-14`2)) & '+' & | 
		CLIP(Format(LOC:KGTeller, @n-14`2)) & '-' & | 
		CLIP(Format(Mut:InslagKG, @n-14`2)) & '=' & | 
		CLIP(Format((VVPar:VoorraadKG + LOC:KGTeller) - Mut:InslagKG, @n-14`2)) & | 
		') in cel '& CLIP(CEL:CelOms) & ' voor deze partij.')
	LOC:NegatieveVoorraad = TRUE
	EXIT
MutatieToLokaal     ROUTINE
	! Vullen regels
	i# = 1
	Clear(Mut:Record)
	Mut:PartijID = Par:PartijID
	SET(Mut:Mutatie_FK01, Mut:Mutatie_FK01)
	LOOP
		IF NOT(Access:Mutatie.TryNext() = Level:Benign) THEN BREAK.
		IF NOT(Mut:PartijID = Par:PartijID) THEN BREAK.
		
		IF i# = 1
			CLEAR(APla:Record)
			APla:PlanningID = Mut:PlanningID
			Access:APlanning.TryFetch(APla:PK_Planning)
		.
		
		IF Mut:SoortMutatie = 'IN' THEN
			CASE i#
			OF 1
				LOC:CelID1 = Mut:CelID
				LOC:CelLocatieID1 = Mut:CelLocatieID
				LOC:KG1 = Mut:InslagKG
				LOC:Pallets1 = Mut:InslagPallet
				
				! Wegingen toevoegen
				CLEAR(Weg:Record)
				Weg:MutatieID = Mut:MutatieID
				SET(Weg:FK_Weging,Weg:FK_Weging)
				LOOP
					Access:Weging.Next()
					IF ERROR() THEN BREAK.
					IF Weg:MutatieID <> Mut:MutatieID THEN BREAK.
					
					CLEAR(PalSrt:Record)
					PalSrt:PalletSoortID = Weg:PalletSoortID
					Access:PalletSoort.TryFetch(PalSrt:PK_PalletSoort)
					
					WGQ1:BrutoGewichtKG=Weg:BrutoGewicht
					WGQ1:NettoGewichtKG=Weg:NettoGewicht
					WGQ1:PalletsoortID=Weg:PalletSoortID
					WGQ1:Palletsoort=PalSrt:PalletOmschrijving
					WGQ1:Datum = Weg:WeegDatum
					WGQ1:Tijd = Weg:WeegTijdstip
					ADD(LOC:WegingQueue1)
				.				
			OF 2
				LOC:CelID2 = Mut:CelID
				LOC:CelLocatieID2 = Mut:CelLocatieID
				LOC:KG2 = Mut:InslagKG
				LOC:Pallets2 = Mut:InslagPallet

				! Wegingen toevoegen
				CLEAR(Weg:Record)
				Weg:MutatieID = Mut:MutatieID
				SET(Weg:FK_Weging,Weg:FK_Weging)
				LOOP
					Access:Weging.Next()
					IF ERROR() THEN BREAK.
					IF Weg:MutatieID <> Mut:MutatieID THEN BREAK.
					
					CLEAR(PalSrt:Record)
					PalSrt:PalletSoortID = Weg:PalletSoortID
					Access:PalletSoort.TryFetch(PalSrt:PK_PalletSoort)
					
					WGQ2:BrutoGewichtKG=Weg:BrutoGewicht
					WGQ2:NettoGewichtKG=Weg:NettoGewicht
					WGQ2:PalletsoortID=Weg:PalletSoortID
					WGQ2:Palletsoort=PalSrt:PalletOmschrijving
					WGQ2:Datum = Weg:WeegDatum
					WGQ2:Tijd = Weg:WeegTijdstip
					ADD(LOC:WegingQueue2)
				.				
			OF 3
				LOC:CelID3 = Mut:CelID
				LOC:CelLocatieID3 = Mut:CelLocatieID
				LOC:KG3 = Mut:InslagKG
				LOC:Pallets3 = Mut:InslagPallet

				! Wegingen toevoegen
				CLEAR(Weg:Record)
				Weg:MutatieID = Mut:MutatieID
				SET(Weg:FK_Weging,Weg:FK_Weging)
				LOOP
					Access:Weging.Next()
					IF ERROR() THEN BREAK.
					IF Weg:MutatieID <> Mut:MutatieID THEN BREAK.
					
					CLEAR(PalSrt:Record)
					PalSrt:PalletSoortID = Weg:PalletSoortID
					Access:PalletSoort.TryFetch(PalSrt:PK_PalletSoort)
					
					WGQ3:BrutoGewichtKG=Weg:BrutoGewicht
					WGQ3:NettoGewichtKG=Weg:NettoGewicht
					WGQ3:PalletsoortID=Weg:PalletSoortID
					WGQ3:Palletsoort=PalSrt:PalletOmschrijving
					WGQ3:Datum = Weg:WeegDatum
					WGQ3:Tijd = Weg:WeegTijdstip
					ADD(LOC:WegingQueue3)
				.				
			OF 4
				LOC:CelID4 = Mut:CelID
				LOC:CelLocatieID4 = Mut:CelLocatieID
				LOC:KG4 = Mut:InslagKG
				LOC:Pallets4 = Mut:InslagPallet

				! Wegingen toevoegen
				CLEAR(Weg:Record)
				Weg:MutatieID = Mut:MutatieID
				SET(Weg:FK_Weging,Weg:FK_Weging)
				LOOP
					Access:Weging.Next()
					IF ERROR() THEN BREAK.
					IF Weg:MutatieID <> Mut:MutatieID THEN BREAK.
					
					CLEAR(PalSrt:Record)
					PalSrt:PalletSoortID = Weg:PalletSoortID
					Access:PalletSoort.TryFetch(PalSrt:PK_PalletSoort)
					
					WGQ4:BrutoGewichtKG=Weg:BrutoGewicht
					WGQ4:NettoGewichtKG=Weg:NettoGewicht
					WGQ4:PalletsoortID=Weg:PalletSoortID
					WGQ4:Palletsoort=PalSrt:PalletOmschrijving
					WGQ4:Datum = Weg:WeegDatum
					WGQ4:Tijd = Weg:WeegTijdstip
					ADD(LOC:WegingQueue4)
				.				
			ELSE
				MESSAGE('Teveel inslagen bij partij')
			.
			i# = i# + 1
		END
	END
	EXIT
WisMutaties         ROUTINE
	! Vullen regels
	Clear(Mut:Record)
	Mut:PartijID = Par:PartijID
	SET(Mut:Mutatie_FK01, Mut:Mutatie_FK01)
	LOOP
		IF NOT(Access:Mutatie.Next() = Level:Benign) THEN BREAK.
		IF NOT(Mut:PartijID = Par:PartijID) THEN BREAK.

		IF Mut:SoortMutatie = 'IN' THEN
			! Verwijderen weging gekoppeld aan de mutatie
			CLEAR(Weg:Record)
			Weg:MutatieID=Mut:MutatieID
			SET(Weg:FK_Weging,Weg:FK_Weging)
			LOOP
				IF NOT(Access:Weging.Next() = Level:Benign) THEN BREAK.
				IF NOT(Weg:MutatieID = Mut:MutatieID) THEN BREAK.
				
				Access:Weging.DeleteRecord(false)
			.
			
			
			db.DebugOut('Wis mutatie ' & Mut:MutatieID)			
			Access:Mutatie.DeleteRecord(false)
		END
	END
	EXIT
BerekenTotaal       ROUTINE
	IF Par:KG = (LOC:KG1+LOC:KG2+LOC:KG3+LOC:KG4)
		LOC:KGBalans = 'Klopt'
	ELSE
		LOC:KGBalans = format(Par:KG - (LOC:KG1+LOC:KG2+LOC:KG3+LOC:KG4), @n-10`2)
	.
	
	IF Par:Pallets = (LOC:Pallets1+LOC:Pallets2+LOC:Pallets3+LOC:Pallets4)
		LOC:PalletsBalans = 'Klopt'
	ELSE
		LOC:PalletsBalans = format(Par:Pallets - (LOC:Pallets1+LOC:Pallets2+LOC:Pallets3+LOC:Pallets4), @n-14.)
	.
	
	?KGBalans{Prop:Text}=LOC:KGBalans
	?PalletsBalans{Prop:Text}=LOC:PalletsBalans
	
	! Bereken weging-totalen
	GLO:TotaalWegingKG = 0
	GLO:TotaalWegingPallets = 0
	LOOP i# = 1 TO RECORDS(LOC:WegingQueue1)
		GET(LOC:WegingQueue1, i#)
		GLO:TotaalWegingKG += WGQ1:NettoGewichtKG
		GLO:TotaalWegingPallets += 1
	END
	
	LOOP i# = 1 TO RECORDS(LOC:WegingQueue2)
		GET(LOC:WegingQueue2, i#)
		GLO:TotaalWegingKG += WGQ2:NettoGewichtKG
		GLO:TotaalWegingPallets += 1
	END
	
	LOOP i# = 1 TO RECORDS(LOC:WegingQueue3)
		GET(LOC:WegingQueue3, i#)
		GLO:TotaalWegingKG += WGQ3:NettoGewichtKG
		GLO:TotaalWegingPallets += 1
	END
	
	LOOP i# = 1 TO RECORDS(LOC:WegingQueue4)
		GET(LOC:WegingQueue4, i#)
		GLO:TotaalWegingKG += WGQ4:NettoGewichtKG
		GLO:TotaalWegingPallets += 1
	END

	EXIT
LaadDropComboTables ROUTINE
	Clear(Art:Record)
	Art:ArtikelID = Par:ArtikelID
	Access:ViewArtikel.Fetch(Art:Artikel_PK)

	Clear(Ver:Record)
	Ver:VerpakkingID = Par:VerpakkingID
	Access:Verpakking.Fetch(Ver:Verpakking_PK)

	Clear(Rel:Record)
	Rel:RelatieID = Par:Leverancier
	Access:Relatie.Fetch(Rel:Relatie_PK)
	
	Clear(Cel:Record)
	CEL:CelID = LOC:CelID1
	Access:Cel.Fetch(Cel:Cel_PK)
	
	Clear(ACel:Record)
	ACEL:CelID = LOC:CelID2
	Access:ACel.Fetch(ACel:Cel_PK)
	
	Clear(AACel:Record)
	AACEL:CelID = LOC:CelID3
	Access:AACel.Fetch(AACel:Cel_PK)

	Clear(AAAACel:Record)
	AAAACEL:CelID = LOC:CelID4
	Access:AAAACel.Fetch(AAAACel:Cel_PK)
	
	CLEAR(ACL:Record)
	ACL:CelLocatieID = LOC:CelLocatieID1
	Access:ACelLocatie.Fetch(ACL:PK_CelLocatie)
	IF ACL:CelID <> LOC:CelID1 THEN CLEAR(ACL:Record).
	
	CLEAR(AACL:Record)
	AACL:CelLocatieID = LOC:CelLocatieID2
	Access:AACelLocatie.Fetch(AACL:PK_CelLocatie)
	IF AACL:CelID <> LOC:CelID2 THEN CLEAR(AACL:Record).
	
	CLEAR(AAACL:Record)
	AAACL:CelLocatieID = LOC:CelLocatieID3
	Access:AAACelLocatie.Fetch(AAACL:PK_CelLocatie)
	IF AAACL:CelID <> LOC:CelID3 THEN CLEAR(AAACL:Record).
	
	CLEAR(AAAACL:Record)
	AAAACL:CelLocatieID = LOC:CelLocatieID4
	Access:AAAACelLocatie.Fetch(AAAACL:PK_CelLocatie)
	IF AAAACL:CelID <> LOC:CelID4 THEN CLEAR(AAAACL:Record).
	
	EXIT
OphalenTemperaturen ROUTINE
    ! Temperatuur
    db.debugout('InslagTemp:' & Par:InslagQATemperatuur1 & ',' & Par:InslagQATemperatuur2& ',' & Par:InslagQATemperatuur3 & Par:InkoopID)
    IF (CLIP(Par:InslagQATemperatuur1) = '' OR CLIP(Par:InslagQATemperatuur1) = '-18')  AND CLIP(Par:InslagQATemperatuur2) = '' AND CLIP(Par:InslagQATemperatuur3) = '' THEN
        ! Inkoop ophalen gelukt
        CLEAR(APar:Record)
        APar:InkoopID = Par:InkoopID
        SET(APar:Partij_FK03, APar:Partij_FK03)
        LOOP UNTIL Access:APartij.Next()
            IF APar:InkoopID <> Par:InkoopID THEN BREAK.
            IF APar:PartijID = Par:PartijID THEN CYCLE.
            
            IF CLIP(APar:InslagQATemperatuur1) <> '' OR CLIP(APar:InslagQATemperatuur2) <> '' OR CLIP(APar:InslagQATemperatuur3) <> '' THEN
                Par:InslagQATemperatuur1 = APar:InslagQATemperatuur1
                Par:InslagQATemperatuur2 = APar:InslagQATemperatuur2
                Par:InslagQATemperatuur3 = APar:InslagQATemperatuur3
                EXIT
            END
        END
    END

ThisWindow.Ask PROCEDURE

  CODE
  CASE SELF.Request                                        ! Configure the action message text
  OF ViewRecord
    ActionMessage = 'View Record'
  OF InsertRecord
    ActionMessage = 'Record will be Added'
  OF ChangeRecord
    ActionMessage = 'Record will be Changed'
  END
  PARENT.Ask


ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('WindowInslagWeging')
  	!GlobalRequest = InsertRecord
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?PROMPT2
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddUpdateFile(Access:Partij)
  Relate:AAAACelLocatie.Open                               ! File AAAACelLocatie used by this procedure, so make sure it's RelationManager is open
  Relate:AAACel.Open                                       ! File AAACel used by this procedure, so make sure it's RelationManager is open
  Relate:AAACelLocatie.Open                                ! File AAACelLocatie used by this procedure, so make sure it's RelationManager is open
  Relate:AACel.Open                                        ! File AACel used by this procedure, so make sure it's RelationManager is open
  Relate:AACelLocatie.Open                                 ! File AACelLocatie used by this procedure, so make sure it's RelationManager is open
  Relate:ACel.Open                                         ! File ACel used by this procedure, so make sure it's RelationManager is open
  Relate:ACelLocatie.Open                                  ! File ACelLocatie used by this procedure, so make sure it's RelationManager is open
  Relate:AMutatie.Open                                     ! File AMutatie used by this procedure, so make sure it's RelationManager is open
  Relate:APartij.Open                                      ! File APartij used by this procedure, so make sure it's RelationManager is open
  Relate:APlanning.Open                                    ! File APlanning used by this procedure, so make sure it's RelationManager is open
  Relate:Cel.SetOpenRelated()
  Relate:Cel.Open                                          ! File Cel used by this procedure, so make sure it's RelationManager is open
  Relate:DubbeleInslagMutaties.Open                        ! File DubbeleInslagMutaties used by this procedure, so make sure it's RelationManager is open
  Relate:Inkoop.SetOpenRelated()
  Relate:Inkoop.Open                                       ! File Inkoop used by this procedure, so make sure it's RelationManager is open
  Relate:Mutatie.Open                                      ! File Mutatie used by this procedure, so make sure it's RelationManager is open
  Relate:PalletSoort.Open                                  ! File PalletSoort used by this procedure, so make sure it's RelationManager is open
  Relate:Partij.Open                                       ! File Partij used by this procedure, so make sure it's RelationManager is open
  Relate:Verpakking.Open                                   ! File Verpakking used by this procedure, so make sure it's RelationManager is open
  Relate:ViewArtikel.Open                                  ! File ViewArtikel used by this procedure, so make sure it's RelationManager is open
  Relate:ViewVoorraadPartij.Open                           ! File ViewVoorraadPartij used by this procedure, so make sure it's RelationManager is open
  Relate:Weging.Open                                       ! File Weging used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Primary &= Relate:Partij
  IF SELF.Request = ViewRecord AND NOT SELF.BatchProcessing ! Setup actions for ViewOnly Mode
    SELF.InsertAction = Insert:None
    SELF.DeleteAction = Delete:None
    SELF.ChangeAction = Change:None
    SELF.CancelAction = Cancel:Cancel
    SELF.OkControl = 0
  ELSE
    SELF.ChangeAction = Change:Caller                      ! Changes allowed
    SELF.OkControl = ?OKButton
    IF SELF.PrimeUpdate() THEN RETURN Level:Notify.
  END
  db.DebugOut('WindowInslag ACTION: '& ThisWindow.Request)
  
  IF (ThisWindow.Request = InsertRecord)
  	Access:APlanning.TryFetch(APla:PK_Planning)
      LOC:PlaGeprint = APla:Geprint
      
  	Access:Partij.PrimeRecord(false)
  
  	Par:ArtikelID = APla:ArtikelID
  	Par:KG	= APla:KG
  	Par:Pallets	= APla:Pallets
  	Par:VerpakkingID = APla:VerpakkingID
  	!Par:CelID = Pla:CelID
      
      Par:InkoopID = APla:InkoopID
      Par:InkoopPlanningID = APla:PlanningID
      
      Par:InslagQAIdentificatieMerkenVerpakking = 1
      Par:InslagQATransportmiddelSchoon = 1
      Par:InslagQAVerpakkingSchoonGesloten = 1
      Par:InslagQAIsGeurKleurProductEigen=1
      Par:InslagQAGeenGlasbreuk=1
      
  	Clear(Ink:Record)
  	Ink:InkoopID = APla:InkoopID
  	Access:Inkoop.Fetch(Ink:PK_Inkoop)
  	Par:Leverancier = Ink:Leverancier
  
  	!Par:AanmaakDatum_DATE = TODAY()
  	!Par:AanmaakDatum_TIME = CLOCK()
  	
  	Par:AanmaakDatum_DATE = Ink:Planning_DATE
  	Par:AanmaakDatum_TIME = Ink:Planning_TIME
  	
  	LOC:CelID1 = APla:CelID
  	LOC:KG1 = Par:KG
  	LOC:Pallets1 = Par:Pallets
  	LOC:CelLocatieID1 = APla:CelLocatieID
  
  	CL:CelLocatieID = LOC:CelLocatieID1
  	Access:CelLocatie.TryFetch(CL:PK_CelLocatie)
  	IF LOC:CelID1 <> CL:CelID THEN LOC:CelLocatieID1 = 0.
  	
  	LOC:CelID2 = 0
  	LOC:KG2 = 0
  	LOC:Pallets2 = 0
  
  	LOC:CelID3 = 0
  	LOC:KG3 = 0
  	LOC:Pallets3 = 0
  
  	LOC:CelID4 = 0
  	LOC:KG4 = 0
  	LOC:Pallets4 = 0
  	
  	DO LaadDropComboTables
  ELSIF ThisWindow.Request = ChangeRecord OR ThisWindow.Request = ViewRecord
  	! APlanning wordt vanuit de mutatie opgehaald
      DO MutatieToLokaal
      
      Par:InkoopID = APla:InkoopID
      Par:InkoopPlanningID = APla:PlanningID
  	
  	IF LOC:CelID1 = 0 AND LOC:CelLocatieID1 = 0 THEN
  		LOC:CelID1 = APla:CelID
  		LOC:KG1 = Par:KG
  		LOC:Pallets1 = Par:Pallets
  		LOC:CelLocatieID1 = APla:CelLocatieID
  
  		CL:CelLocatieID = LOC:CelLocatieID1
  		Access:CelLocatie.TryFetch(CL:PK_CelLocatie)
  		IF LOC:CelID1 <> CL:CelID THEN LOC:CelLocatieID1 = 0.
  	END
  	
  	DO LaadDropComboTables
  ELSE
  	RETURN ReturnValue
  END
  
  DO OphalenTemperaturen
  SELF.Open(Window)                                        ! Open window
  DO BerekenTotaal
  WinAlertMouseZoom()
  Do DefineListboxStyle
  INIMgr.Fetch('WindowInslagWeging',Window)                ! Restore window settings from non-volatile store
  FDCB1.Init(Rel:FirmaNaam,?Rel:FirmaNaam,Queue:FileDropCombo.ViewPosition,FDCB1::View:FileDropCombo,Queue:FileDropCombo,Relate:Relatie,ThisWindow,GlobalErrors,0,0,0)
  FDCB1.RemoveDuplicatesFlag = TRUE
  FDCB1.Q &= Queue:FileDropCombo
  FDCB1.AddSortOrder(Rel:Relatie_FK01)
  FDCB1.SetFilter('Rel:Type=''S''')
  FDCB1.AddField(Rel:FirmaNaam,FDCB1.Q.Rel:FirmaNaam) !List box control field - type derived from field
  FDCB1.AddField(Rel:Type,FDCB1.Q.Rel:Type) !Browse hot field - type derived from field
  FDCB1.AddUpdateField(Rel:RelatieID,Par:Leverancier)
  ThisWindow.AddItem(FDCB1.WindowComponent)
  FDCB1.DefaultFill = 0
  FDCB3.Init(Ver:VerpakkingOmschrijving,?Ver:VerpakkingOmschrijving,Queue:FileDropCombo:2.ViewPosition,FDCB3::View:FileDropCombo,Queue:FileDropCombo:2,Relate:Verpakking,ThisWindow,GlobalErrors,0,0,0)
  FDCB3.Q &= Queue:FileDropCombo:2
  FDCB3.AddSortOrder(Ver:Verpakking_PK)
  FDCB3.AddField(Ver:VerpakkingOmschrijving,FDCB3.Q.Ver:VerpakkingOmschrijving) !List box control field - type derived from field
  FDCB3.AddUpdateField(Ver:VerpakkingID,Par:VerpakkingID)
  ThisWindow.AddItem(FDCB3.WindowComponent)
  FDCB3.DefaultFill = 0
  FDCB5.Init(CEL:CelOms,?CEL:CelOms,Queue:FileDropCombo:3.ViewPosition,FDCB5::View:FileDropCombo,Queue:FileDropCombo:3,Relate:Cel,ThisWindow,GlobalErrors,0,1,0)
  FDCB5.Q &= Queue:FileDropCombo:3
  FDCB5.AddSortOrder(CEL:CEL_PK)
  FDCB5.AddField(CEL:CelOms,FDCB5.Q.CEL:CelOms) !List box control field - type derived from field
  FDCB5.AddField(CEL:CelID,FDCB5.Q.CEL:CelID) !Primary key field - type derived from field
  FDCB5.AddUpdateField(CEL:CelID,LOC:CelID1)
  ThisWindow.AddItem(FDCB5.WindowComponent)
  FDCB5.DefaultFill = 0
  FDCB8.Init(ACel:CelOms,?ACel:CelOms,Queue:FileDropCombo:4.ViewPosition,FDCB8::View:FileDropCombo,Queue:FileDropCombo:4,Relate:ACel,ThisWindow,GlobalErrors,0,1,0)
  FDCB8.Q &= Queue:FileDropCombo:4
  FDCB8.AddSortOrder(ACel:CEL_PK)
  FDCB8.AddField(ACel:CelOms,FDCB8.Q.ACel:CelOms) !List box control field - type derived from field
  FDCB8.AddField(ACel:CelID,FDCB8.Q.ACel:CelID) !Primary key field - type derived from field
  FDCB8.AddUpdateField(ACel:CelID,LOC:CelID2)
  ThisWindow.AddItem(FDCB8.WindowComponent)
  FDCB8.DefaultFill = 0
  FDCB9.Init(AACel:CelOms,?AACel:CelOms,Queue:FileDropCombo:5.ViewPosition,FDCB9::View:FileDropCombo,Queue:FileDropCombo:5,Relate:AACel,ThisWindow,GlobalErrors,0,1,0)
  FDCB9.Q &= Queue:FileDropCombo:5
  FDCB9.AddSortOrder(AACel:CEL_PK)
  FDCB9.AddField(AACel:CelOms,FDCB9.Q.AACel:CelOms) !List box control field - type derived from field
  FDCB9.AddField(AACel:CelID,FDCB9.Q.AACel:CelID) !Primary key field - type derived from field
  FDCB9.AddUpdateField(AACel:CelID,LOC:CelID3)
  ThisWindow.AddItem(FDCB9.WindowComponent)
  FDCB9.DefaultFill = 0
  FDCB7.Init(AAACel:CelOms,?AAACel:CelOms,Queue:FileDropCombo:6.ViewPosition,FDCB7::View:FileDropCombo,Queue:FileDropCombo:6,Relate:AAACel,ThisWindow,GlobalErrors,0,1,0)
  FDCB7.Q &= Queue:FileDropCombo:6
  FDCB7.AddSortOrder(AAACel:CEL_PK)
  FDCB7.AddField(AAACel:CelOms,FDCB7.Q.AAACel:CelOms) !List box control field - type derived from field
  FDCB7.AddField(AAACel:CelID,FDCB7.Q.AAACel:CelID) !Primary key field - type derived from field
  FDCB7.AddUpdateField(AAACel:CelID,LOC:CelID4)
  ThisWindow.AddItem(FDCB7.WindowComponent)
  FDCB7.DefaultFill = 0
  FDCB10.Init(Art:ArtikelOms,?Art:ArtikelOms:2,Queue:FileDropCombo:7.ViewPosition,FDCB10::View:FileDropCombo,Queue:FileDropCombo:7,Relate:ViewArtikel,ThisWindow,GlobalErrors,0,0,0)
  FDCB10.RemoveDuplicatesFlag = TRUE
  FDCB10.Q &= Queue:FileDropCombo:7
  FDCB10.AddSortOrder(Art:Artikel_FK01)
  FDCB10.AddField(Art:ArtikelOms,FDCB10.Q.Art:ArtikelOms) !List box control field - type derived from field
  FDCB10.AddUpdateField(Art:ArtikelID,Par:ArtikelID)
  ThisWindow.AddItem(FDCB10.WindowComponent)
  FDCB10.DefaultFill = 0
  FDCB11.Init(ACL:Locatienaam,?ACL:Locatienaam,Queue:FileDropCombo:1.ViewPosition,FDCB11::View:FileDropCombo,Queue:FileDropCombo:1,Relate:ACelLocatie,ThisWindow,GlobalErrors,0,1,0)
  FDCB11.Q &= Queue:FileDropCombo:1
  FDCB11.AddSortOrder(ACL:FK_CelLocatie)
  FDCB11.AddRange(ACL:CelID,LOC:CelID1)
  FDCB11.AddField(ACL:Locatienaam,FDCB11.Q.ACL:Locatienaam) !List box control field - type derived from field
  FDCB11.AddField(ACL:CelLocatieID,FDCB11.Q.ACL:CelLocatieID) !Primary key field - type derived from field
  FDCB11.AddUpdateField(ACL:CelLocatieID,LOC:CelLocatieID1)
  ThisWindow.AddItem(FDCB11.WindowComponent)
  FDCB11.DefaultFill = 0
  FDCB12.Init(AACL:Locatienaam,?AACL:Locatienaam,Queue:FileDropCombo:8.ViewPosition,FDCB12::View:FileDropCombo,Queue:FileDropCombo:8,Relate:AACelLocatie,ThisWindow,GlobalErrors,0,1,0)
  FDCB12.Q &= Queue:FileDropCombo:8
  FDCB12.AddSortOrder(AACL:FK_CelLocatie)
  FDCB12.AddRange(AACL:CelID,LOC:CelID2)
  FDCB12.AddField(AACL:Locatienaam,FDCB12.Q.AACL:Locatienaam) !List box control field - type derived from field
  FDCB12.AddField(AACL:CelLocatieID,FDCB12.Q.AACL:CelLocatieID) !Primary key field - type derived from field
  FDCB12.AddUpdateField(AACL:CelLocatieID,LOC:CelLocatieID2)
  ThisWindow.AddItem(FDCB12.WindowComponent)
  FDCB12.DefaultFill = 0
  FDCB13.Init(AAACL:Locatienaam,?AAACL:Locatienaam,Queue:FileDropCombo:9.ViewPosition,FDCB13::View:FileDropCombo,Queue:FileDropCombo:9,Relate:AAACelLocatie,ThisWindow,GlobalErrors,0,1,0)
  FDCB13.Q &= Queue:FileDropCombo:9
  FDCB13.AddSortOrder(AAACL:FK_CelLocatie)
  FDCB13.AddRange(AAACL:CelID,LOC:CelID3)
  FDCB13.AddField(AAACL:Locatienaam,FDCB13.Q.AAACL:Locatienaam) !List box control field - type derived from field
  FDCB13.AddField(AAACL:CelLocatieID,FDCB13.Q.AAACL:CelLocatieID) !Primary key field - type derived from field
  FDCB13.AddUpdateField(AAACL:CelLocatieID,LOC:CelLocatieID3)
  ThisWindow.AddItem(FDCB13.WindowComponent)
  FDCB13.DefaultFill = 0
  FDCB15.Init(AAAACL:Locatienaam,?AAAACL:Locatienaam,Queue:FileDropCombo:10.ViewPosition,FDCB15::View:FileDropCombo,Queue:FileDropCombo:10,Relate:AAAACelLocatie,ThisWindow,GlobalErrors,0,1,0)
  FDCB15.Q &= Queue:FileDropCombo:10
  FDCB15.AddSortOrder(AAAACL:FK_CelLocatie)
  FDCB15.AddRange(AAAACL:CelID,LOC:CelID4)
  FDCB15.AddField(AAAACL:Locatienaam,FDCB15.Q.AAAACL:Locatienaam) !List box control field - type derived from field
  FDCB15.AddField(AAAACL:CelLocatieID,FDCB15.Q.AAAACL:CelLocatieID) !Primary key field - type derived from field
  FDCB15.AddUpdateField(AAAACL:CelLocatieID,LOC:CelLocatieID4)
  ThisWindow.AddItem(FDCB15.WindowComponent)
  FDCB15.DefaultFill = 0
  SELF.SetAlerts()
  EnterByTabManager.Init(False)
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:AAAACelLocatie.Close
    Relate:AAACel.Close
    Relate:AAACelLocatie.Close
    Relate:AACel.Close
    Relate:AACelLocatie.Close
    Relate:ACel.Close
    Relate:ACelLocatie.Close
    Relate:AMutatie.Close
    Relate:APartij.Close
    Relate:APlanning.Close
    Relate:Cel.Close
    Relate:DubbeleInslagMutaties.Close
    Relate:Inkoop.Close
    Relate:Mutatie.Close
    Relate:PalletSoort.Close
    Relate:Partij.Close
    Relate:Verpakking.Close
    Relate:ViewArtikel.Close
    Relate:ViewVoorraadPartij.Close
    Relate:Weging.Close
  END
  IF SELF.Opened
    INIMgr.Update('WindowInslagWeging',Window)             ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.PrimeUpdate PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.PrimeUpdate()
  	If returnValue = Level:Fatal  ! delete just occured
  		NetRefreshPlanningViews()
  		NetRefreshVoorraadViews()
  	End
    If returnValue = Level:Fatal  ! delete just occured
      ThisNetRefresh.Send('|Relatie|Verpakking|Cel|ACel|AACel|AAACel|ViewArtikel|ACelLocatie|AACelLocatie|AAACelLocatie|AAAACelLocatie|Partij|') ! NetTalk (NetRefresh)
    End
  RETURN ReturnValue


ThisWindow.Run PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Run()
  IF SELF.Request = ViewRecord                             ! In View Only mode always signal RequestCancelled
    ReturnValue = RequestCancelled
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
    OF ?BUTTON1
      LOC:KG1 = 0
      
      LOOP i# = 1 TO RECORDS(LOC:WegingQueue1)
      	GET(LOC:WegingQueue1, i#)
      	LOC:KG1 += WGQ1:NettoGewichtKG
      END
      
      LOC:Pallets1 = RECORDS(LOC:WegingQueue1)
      
      Par:KG = LOC:KG1 + LOC:KG2 + LOC:KG3 + LOC:KG4
      Par:Pallets = LOC:Pallets1 + LOC:Pallets2 + LOC:Pallets3 + LOC:Pallets4
      
      DISPLAY(?LOC:KG1)
      DISPLAY(?LOC:Pallets1)
      
      DISPLAY(?Par:KG)
      DISPLAY(?Par:Pallets)
      
      DO BerekenTotaal
      
    OF ?ToevoegenWeging1
      FREE(GLO:WegingQueue)
      WGQ:BrutoGewichtKG=0
      WGQ:NettoGewichtKG=0
      WGQ:PalletsoortID=0
      WGQ:Palletsoort=''
      WGQ:Datum=0
      WGQ:Tijd=0
    OF ?WijzigenWeging1
      CLEAR(LOC:WegingQueue1)
      GET(LOC:WegingQueue1, Choice(?WegingList1))
      IF NOT(ERROR()) THEN
      	WGQ:BrutoGewichtKG = WGQ1:BrutoGewichtKG
      	WGQ:Palletsoort = WGQ1:Palletsoort
      	WGQ:PalletsoortID = WGQ1:PalletsoortID
      	WGQ:NettoGewichtKG = WGQ1:NettoGewichtKG
      	WGQ:Datum = WGQ1:Datum
      	WGQ:Tijd = WGQ1:Tijd
      ELSE
      	CYCLE
      .
    OF ?VerwijderenWeging1
      CLEAR(LOC:WegingQueue1)
      GET(LOC:WegingQueue1, Choice(?WegingList1))
      IF NOT(ERROR()) THEN
      	DELETE(LOC:WegingQueue1)
      ELSE
      	CYCLE
      .
    OF ?EtiketButton1
      CLEAR(LOC:WegingQueue1)
      GET(LOC:WegingQueue1, Choice(?WegingList1))
      IF NOT(ERROR()) THEN
      	FREE(GLO:WegingQueue)
      	WGQ:BrutoGewichtKG = WGQ1:BrutoGewichtKG 
      	WGQ:Palletsoort = WGQ1:Palletsoort
      	WGQ:PalletsoortID = WGQ1:PalletsoortID
      	WGQ:NettoGewichtKG = WGQ1:NettoGewichtKG
      	ADD(GLO:WegingQueue)
      	ReportDymoStickers(2, 0)
      END
    OF ?BUTTON1:2
      LOC:KG2 = 0
      
      LOOP i# = 1 TO RECORDS(LOC:WegingQueue2)
      	GET(LOC:WegingQueue2, i#)
      	LOC:KG2 += WGQ2:NettoGewichtKG
      END
      
      LOC:Pallets2 = RECORDS(LOC:WegingQueue2)
      
      Par:KG = LOC:KG1 + LOC:KG2 + LOC:KG3 + LOC:KG4
      Par:Pallets = LOC:Pallets1 + LOC:Pallets2 + LOC:Pallets3 + LOC:Pallets4
      
      DISPLAY(?LOC:KG2)
      DISPLAY(?LOC:Pallets2)
      
      DISPLAY(?Par:KG)
      DISPLAY(?Par:Pallets)
      
      DO BerekenTotaal
    OF ?ToevoegenWeging2
      FREE(GLO:WegingQueue)
      WGQ:BrutoGewichtKG=0
      WGQ:NettoGewichtKG=0
      WGQ:PalletsoortID=0
      WGQ:Palletsoort=''
      WGQ:Datum=0
      WGQ:Tijd=0
    OF ?VerwijderenWeging2
      CLEAR(LOC:WegingQueue2)
      GET(LOC:WegingQueue2, Choice(?WegingList2))
      IF NOT(ERROR()) THEN
      	DELETE(LOC:WegingQueue2)
      ELSE
      	CYCLE
      .
    OF ?WijzigenWeging2
      CLEAR(LOC:WegingQueue2)
      GET(LOC:WegingQueue2, Choice(?WegingList2))
      IF NOT(ERROR()) THEN
      	WGQ:BrutoGewichtKG = WGQ2:BrutoGewichtKG
      	WGQ:Palletsoort = WGQ2:Palletsoort
      	WGQ:PalletsoortID = WGQ2:PalletsoortID
      	WGQ:NettoGewichtKG = WGQ2:NettoGewichtKG
      	WGQ:Datum = WGQ2:Datum
      	WGQ:Tijd = WGQ2:Tijd
      ELSE
      	CYCLE
      .
    OF ?EtiketButton2
      CLEAR(LOC:WegingQueue2)
      GET(LOC:WegingQueue2, Choice(?WegingList2))
      IF NOT(ERROR()) THEN
      	FREE(GLO:WegingQueue)
      	WGQ:BrutoGewichtKG = WGQ2:BrutoGewichtKG 
      	WGQ:Palletsoort = WGQ2:Palletsoort
      	WGQ:PalletsoortID = WGQ2:PalletsoortID
      	WGQ:NettoGewichtKG = WGQ2:NettoGewichtKG
      	ADD(GLO:WegingQueue)
      	ReportDymoStickers(2, 0)
      END
    OF ?BUTTON1:3
      LOC:KG3 = 0
      
      LOOP i# = 1 TO RECORDS(LOC:WegingQueue3)
      	GET(LOC:WegingQueue3, i#)
      	LOC:KG3 += WGQ3:NettoGewichtKG
      END
      
      LOC:Pallets3 = RECORDS(LOC:WegingQueue3)
      
      Par:KG = LOC:KG1 + LOC:KG2 + LOC:KG3 + LOC:KG4
      Par:Pallets = LOC:Pallets1 + LOC:Pallets2 + LOC:Pallets3 + LOC:Pallets4
      
      DISPLAY(?LOC:KG3)
      DISPLAY(?LOC:Pallets3)
      
      DISPLAY(?Par:KG)
      DISPLAY(?Par:Pallets)
      
      DO BerekenTotaal
    OF ?ToevoegenWeging3
      FREE(GLO:WegingQueue)
      WGQ:BrutoGewichtKG=0
      WGQ:NettoGewichtKG=0
      WGQ:PalletsoortID=0
      WGQ:Palletsoort=''
      WGQ:Datum=0
      WGQ:Tijd=0
    OF ?VerwijderenWeging3
      CLEAR(LOC:WegingQueue3)
      GET(LOC:WegingQueue3, Choice(?WegingList3))
      IF NOT(ERROR()) THEN
      	DELETE(LOC:WegingQueue3)
      ELSE
      	CYCLE
      .
    OF ?WijzigenWeging3
      CLEAR(LOC:WegingQueue3)
      GET(LOC:WegingQueue3, Choice(?WegingList3))
      IF NOT(ERROR()) THEN
      	WGQ:BrutoGewichtKG = WGQ3:BrutoGewichtKG
      	WGQ:Palletsoort = WGQ3:Palletsoort
      	WGQ:PalletsoortID = WGQ3:PalletsoortID
      	WGQ:NettoGewichtKG = WGQ3:NettoGewichtKG
      	WGQ:Datum = WGQ3:Datum
      	WGQ:Tijd = WGQ3:Tijd
      ELSE
      	CYCLE
      .
    OF ?EtiketButton3
      CLEAR(LOC:WegingQueue3)
      GET(LOC:WegingQueue3, Choice(?WegingList3))
      IF NOT(ERROR()) THEN
      	FREE(GLO:WegingQueue)
      	WGQ:BrutoGewichtKG = WGQ3:BrutoGewichtKG 
      	WGQ:Palletsoort = WGQ3:Palletsoort
      	WGQ:PalletsoortID = WGQ3:PalletsoortID
      	WGQ:NettoGewichtKG = WGQ3:NettoGewichtKG
      	ADD(GLO:WegingQueue)
      	ReportDymoStickers(2, 0)
      END
    OF ?BUTTON1:4
      LOC:KG4 = 0
      
      LOOP i# = 1 TO RECORDS(LOC:WegingQueue4)
      	GET(LOC:WegingQueue4, i#)
      	LOC:KG4 += WGQ4:NettoGewichtKG
      END
      
      LOC:Pallets4 = RECORDS(LOC:WegingQueue4)
      
      Par:KG = LOC:KG1 + LOC:KG2 + LOC:KG3 + LOC:KG4
      Par:Pallets = LOC:Pallets1 + LOC:Pallets2 + LOC:Pallets3 + LOC:Pallets4
      
      DISPLAY(?Par:KG)
      DISPLAY(?Par:Pallets)
      
      DISPLAY(?LOC:KG4)
      DISPLAY(?LOC:Pallets4)
      DO BerekenTotaal
    OF ?ToevoegenWeging4
      FREE(GLO:WegingQueue)
      WGQ:BrutoGewichtKG=0
      WGQ:NettoGewichtKG=0
      WGQ:PalletsoortID=0
      WGQ:Palletsoort=''
      WGQ:Datum=0
      WGQ:Tijd=0
    OF ?WijzigenWeging4
      CLEAR(LOC:WegingQueue4)
      GET(LOC:WegingQueue4, Choice(?WegingList4))
      IF NOT(ERROR()) THEN
      	WGQ:BrutoGewichtKG = WGQ4:BrutoGewichtKG
      	WGQ:Palletsoort = WGQ4:Palletsoort
      	WGQ:PalletsoortID = WGQ4:PalletsoortID
      	WGQ:NettoGewichtKG = WGQ4:NettoGewichtKG
      	WGQ:Datum = WGQ4:Datum
      	WGQ:Tijd = WGQ4:Tijd
      ELSE
      	CYCLE
      .
    OF ?VerwijderenWeging4
      CLEAR(LOC:WegingQueue4)
      GET(LOC:WegingQueue4, Choice(?WegingList4))
      IF NOT(ERROR()) THEN
      	DELETE(LOC:WegingQueue4)
      ELSE
      	CYCLE
      .
    OF ?EtiketButton4
      CLEAR(LOC:WegingQueue4)
      GET(LOC:WegingQueue4, Choice(?WegingList4))
      IF NOT(ERROR()) THEN
      	FREE(GLO:WegingQueue)
      	WGQ:BrutoGewichtKG = WGQ4:BrutoGewichtKG 
      	WGQ:Palletsoort = WGQ4:Palletsoort
      	WGQ:PalletsoortID = WGQ4:PalletsoortID
      	WGQ:NettoGewichtKG = WGQ4:NettoGewichtKG
      	ADD(GLO:WegingQueue)
      	ReportDymoStickers(2, 0)
      END
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?Par:KG
      IF LOC:KG2 = 0 AND LOC:KG3 = 0 AND LOC:KG4 = 0
      	LOC:KG1 = Par:KG
      	DISPLAY(?LOC:KG1)
      .
      DO BerekenTotaal
    OF ?Par:Pallets
      IF LOC:Pallets2 = 0 AND LOC:Pallets3 = 0 AND LOC:Pallets4 = 0
      	LOC:Pallets1 = Par:Pallets
      	DISPLAY(?LOC:Pallets1)
      .
      DO BerekenTotaal
    OF ?PrintStickersButton
      ThisWindow.Update()
      		APar:Record = Par:Record
      		aantalpallets# = ReportPalletStickers()
      		Par:Record = APar:Record
      
      		IF GlobalResponse = RequestCompleted			
      			Par:PalletsGeprint=Par:PalletsGeprint+aantalpallets#
      			
      			IF (ThisWindow.Request <> InsertRecord)
      				! Als het geen insert is, dan is de wijziging direct zeker
      				APla:Geprint = 1
      				Access:APlanning.Update()
      			ELSE
      				! Is een insert dus, bij het bevestigen (TakeCompleted) pas definitief maken.
      				LOC:PlaGeprint = 1
      			END
      		END
    OF ?LOC:KG1
      IF LOC:KG2 = 0
      	IF (Par:KG - LOC:KG1 - LOC:KG3 - LOC:KG4) >= 0
      		LOC:KG2 = Par:KG - LOC:KG1 - LOC:KG3 - LOC:KG4
      		DISPLAY(?LOC:KG2)
      	.
      .
      DO BerekenTotaal
    OF ?LOC:Pallets1
      IF LOC:Pallets2 = 0
      	IF (Par:Pallets - LOC:Pallets1 - LOC:Pallets3 - LOC:Pallets4) >= 0
      		LOC:Pallets2 = Par:Pallets - LOC:Pallets1 - LOC:Pallets3 - LOC:Pallets4
      		DISPLAY(?LOC:Pallets2)
      	.
      .
      DO BerekenTotaal
    OF ?ToevoegenWeging1
      ThisWindow.Update()
      GlobalRequest = InsertRecord
      UpdateUitslagMutatieWegingQueue()
      ThisWindow.Reset
      IF GLOBALResponse = RequestCompleted THEN
      	WGQ1:BrutoGewichtKG = WGQ:BrutoGewichtKG
      	WGQ1:Palletsoort = WGQ:Palletsoort
      	WGQ1:PalletsoortID = WGQ:PalletsoortID
      	WGQ1:NettoGewichtKG = WGQ:NettoGewichtKG
      	WGQ1:Datum = WGQ:Datum
      	WGQ1:Tijd = WGQ:Tijd
      	ADD(LOC:WegingQueue1)
      .
    OF ?WijzigenWeging1
      ThisWindow.Update()
      GlobalRequest = ChangeRecord
      UpdateUitslagMutatieWegingQueue()
      ThisWindow.Reset
      IF GLOBALResponse = RequestCompleted THEN
      	WGQ1:BrutoGewichtKG = WGQ:BrutoGewichtKG
      	WGQ1:Palletsoort = WGQ:Palletsoort
      	WGQ1:PalletsoortID = WGQ:PalletsoortID
      	WGQ1:NettoGewichtKG = WGQ:NettoGewichtKG
      	WGQ1:Datum = WGQ:Datum
      	WGQ1:Tijd = WGQ:Tijd
      	PUT(LOC:WegingQueue1)
      .
    OF ?WeegNu1
      ThisWindow.Update()
      WeegWindow()
      ThisWindow.Reset
      IF GLOBALResponse = RequestCompleted THEN
      	LOOP i# = 1 TO RECORDS(GLO:WegingQueue)
      		GET(GLO:WegingQueue, i#)
      		WGQ1:BrutoGewichtKG = WGQ:BrutoGewichtKG
      		WGQ1:Palletsoort = WGQ:Palletsoort
      		WGQ1:PalletsoortID = WGQ:PalletsoortID
      		WGQ1:NettoGewichtKG = WGQ:NettoGewichtKG
      		WGQ1:Datum = WGQ:Datum
      		WGQ1:Tijd = WGQ:Tijd
      		ADD(LOC:WegingQueue1)
      	.
      .
    OF ?LOC:KG2
      IF LOC:KG3 = 0
      	IF (Par:KG - LOC:KG1 - LOC:KG2 - LOC:KG4) >= 0 
      		LOC:KG3 = Par:KG - LOC:KG1 - LOC:KG2 - LOC:KG4
      		DISPLAY(?LOC:KG3)
      	.
      .
      DO BerekenTotaal
    OF ?LOC:Pallets2
      IF LOC:Pallets3 = 0
      	IF (Par:Pallets - LOC:Pallets1 - LOC:Pallets2 - LOC:Pallets4) >= 0
      		LOC:Pallets3 = Par:Pallets - LOC:Pallets1 - LOC:Pallets2 - LOC:Pallets4
      		DISPLAY(?LOC:Pallets3)
      	.
      .
      DO BerekenTotaal
    OF ?ToevoegenWeging2
      ThisWindow.Update()
      GlobalRequest = InsertRecord
      UpdateUitslagMutatieWegingQueue()
      ThisWindow.Reset
      IF GLOBALResponse = RequestCompleted THEN
      	WGQ2:BrutoGewichtKG = WGQ:BrutoGewichtKG
      	WGQ2:Palletsoort = WGQ:Palletsoort
      	WGQ2:PalletsoortID = WGQ:PalletsoortID
      	WGQ2:NettoGewichtKG = WGQ:NettoGewichtKG
      	WGQ2:Datum = WGQ:Datum
      	WGQ2:Tijd = WGQ:Tijd
      	ADD(LOC:WegingQueue2)
      .
    OF ?WijzigenWeging2
      ThisWindow.Update()
      GlobalRequest = ChangeRecord
      UpdateUitslagMutatieWegingQueue()
      ThisWindow.Reset
      IF GLOBALResponse = RequestCompleted THEN
      	WGQ2:BrutoGewichtKG = WGQ:BrutoGewichtKG
      	WGQ2:Palletsoort = WGQ:Palletsoort
      	WGQ2:PalletsoortID = WGQ:PalletsoortID
      	WGQ2:NettoGewichtKG = WGQ:NettoGewichtKG
      	WGQ2:Datum = WGQ:Datum
      	WGQ2:Tijd = WGQ:Tijd
      	PUT(LOC:WegingQueue2)
      .
    OF ?WeegNu2
      ThisWindow.Update()
      WeegWindow()
      ThisWindow.Reset
      IF GLOBALResponse = RequestCompleted THEN
      	LOOP i# = 1 TO RECORDS(GLO:WegingQueue)
      		GET(GLO:WegingQueue, i#)
      		WGQ2:BrutoGewichtKG = WGQ:BrutoGewichtKG
      		WGQ2:Palletsoort = WGQ:Palletsoort
      		WGQ2:PalletsoortID = WGQ:PalletsoortID
      		WGQ2:NettoGewichtKG = WGQ:NettoGewichtKG
      		WGQ2:Datum = WGQ:Datum
      		WGQ2:Tijd = WGQ:Tijd
      		ADD(LOC:WegingQueue2)
      	.
      .
    OF ?LOC:KG3
      IF LOC:KG4 = 0
      	IF (Par:KG - LOC:KG1 - LOC:KG2 - LOC:KG3 > 0)
      		LOC:KG4 = Par:KG - LOC:KG1 - LOC:KG2 - LOC:KG3
      		DISPLAY(?LOC:KG4)
      	.
      .
      DO BerekenTotaal
    OF ?LOC:Pallets3
      IF LOC:Pallets4 = 0
      	IF (Par:Pallets - LOC:Pallets1 - LOC:Pallets2 - LOC:Pallets3) >= 0
      		LOC:Pallets4 = Par:Pallets - LOC:Pallets1 - LOC:Pallets2 - LOC:Pallets3
      		DISPLAY(?LOC:Pallets4)
      	.
      .
      DO BerekenTotaal
    OF ?ToevoegenWeging3
      ThisWindow.Update()
      GlobalRequest = InsertRecord
      UpdateUitslagMutatieWegingQueue()
      ThisWindow.Reset
      IF GLOBALResponse = RequestCompleted THEN
      	WGQ3:BrutoGewichtKG = WGQ:BrutoGewichtKG
      	WGQ3:Palletsoort = WGQ:Palletsoort
      	WGQ3:PalletsoortID = WGQ:PalletsoortID
      	WGQ3:NettoGewichtKG = WGQ:NettoGewichtKG
      	WGQ3:Datum = WGQ:Datum
      	WGQ3:Tijd = WGQ:Tijd
      	ADD(LOC:WegingQueue3)
      .
    OF ?WijzigenWeging3
      ThisWindow.Update()
      GlobalRequest = ChangeRecord
      UpdateUitslagMutatieWegingQueue()
      ThisWindow.Reset
      IF GLOBALResponse = RequestCompleted THEN
      	WGQ3:BrutoGewichtKG = WGQ:BrutoGewichtKG
      	WGQ3:Palletsoort = WGQ:Palletsoort
      	WGQ3:PalletsoortID = WGQ:PalletsoortID
      	WGQ3:NettoGewichtKG = WGQ:NettoGewichtKG
      	WGQ3:Datum = WGQ:Datum
      	WGQ3:Tijd = WGQ:Tijd
      	PUT(LOC:WegingQueue3)
      .
    OF ?WeegNu3
      ThisWindow.Update()
      WeegWindow()
      ThisWindow.Reset
      IF GLOBALResponse = RequestCompleted THEN
      	LOOP i# = 1 TO RECORDS(GLO:WegingQueue)
      		GET(GLO:WegingQueue, i#)
      		WGQ3:BrutoGewichtKG = WGQ:BrutoGewichtKG
      		WGQ3:Palletsoort = WGQ:Palletsoort
      		WGQ3:PalletsoortID = WGQ:PalletsoortID
      		WGQ3:NettoGewichtKG = WGQ:NettoGewichtKG
      		WGQ3:Datum = WGQ:Datum
      		WGQ3:Tijd = WGQ:Tijd
      		ADD(LOC:WegingQueue3)
      	.
      .
    OF ?LOC:KG4
      DO BerekenTotaal
    OF ?LOC:Pallets4
      DO BerekenTotaal
    OF ?ToevoegenWeging4
      ThisWindow.Update()
      GlobalRequest = InsertRecord
      UpdateUitslagMutatieWegingQueue()
      ThisWindow.Reset
      IF GLOBALResponse = RequestCompleted THEN
      	WGQ4:BrutoGewichtKG = WGQ:BrutoGewichtKG
      	WGQ4:Palletsoort = WGQ:Palletsoort
      	WGQ4:PalletsoortID = WGQ:PalletsoortID
      	WGQ4:NettoGewichtKG = WGQ:NettoGewichtKG
      	WGQ4:Datum = WGQ:Datum
      	WGQ4:Tijd = WGQ:Tijd
      	ADD(LOC:WegingQueue4)
      .
    OF ?WijzigenWeging4
      ThisWindow.Update()
      GlobalRequest = ChangeRecord
      UpdateUitslagMutatieWegingQueue()
      ThisWindow.Reset
      IF GLOBALResponse = RequestCompleted THEN
      	WGQ4:BrutoGewichtKG = WGQ:BrutoGewichtKG
      	WGQ4:Palletsoort = WGQ:Palletsoort
      	WGQ4:PalletsoortID = WGQ:PalletsoortID
      	WGQ4:NettoGewichtKG = WGQ:NettoGewichtKG
      	WGQ4:Datum = WGQ:Datum
      	WGQ4:Tijd = WGQ:Tijd
      	PUT(LOC:WegingQueue4)
      .
    OF ?WeegNu4
      ThisWindow.Update()
      WeegWindow()
      ThisWindow.Reset
      IF GLOBALResponse = RequestCompleted THEN
      	LOOP i# = 1 TO RECORDS(GLO:WegingQueue)
      		GET(GLO:WegingQueue, i#)
      		WGQ4:BrutoGewichtKG = WGQ:BrutoGewichtKG
      		WGQ4:Palletsoort = WGQ:Palletsoort
      		WGQ4:PalletsoortID = WGQ:PalletsoortID
      		WGQ4:NettoGewichtKG = WGQ:NettoGewichtKG
      		WGQ4:Datum = WGQ:Datum
      		WGQ4:Tijd = WGQ:Tijd
      		ADD(LOC:WegingQueue4)
      	.
      .
    OF ?OKButton
      ThisWindow.Update()
      IF SELF.Request = ViewRecord AND NOT SELF.BatchProcessing THEN
         POST(EVENT:CloseWindow)
      END
    END
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue


ThisWindow.TakeCloseEvent PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  db.DebugOut('TakeCloseEvent: ' & ThisWindow.Request & ' -  ' & ThisWindow.Response)
  
  IF ThisWindow.Request = InsertRecord AND LOC:PlaGeprint AND ThisWindow.Response = RequestCancelled THEN
  	IF MESSAGE('Pallet-stickers zijn geprint. Als er nu geannuleerd wordt, dan kunnen deze stickers niet gebruikt worden omdat er een nieuw partijnummer zal worden toegekend. Toch doorgaan met annuleren?.', 'Pallet-stickers al geprint', ICON:Exclamation, BUTTON:Yes+BUTTON:No, BUTTON:No) <> BUTTON:Yes
  		RETURN Level:Notify
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
  db.DebugOut('TakeCompleted: ' & ThisWindow.Request & ' -  ' & ThisWindow.Response)
  DO BerekenTotaal
  
  IF Par:ArtikelID = 0 THEN
  	SELECT(?Art:ArtikelOms:2)
  	RETURN Level:Notify
  END
  
  IF Par:Leverancier = 0 THEN
  	SELECT(?Rel:FirmaNaam)
  	RETURN Level:Notify
  END
  
  IF Par:VerpakkingID = 0 THEN
  	SELECT(?Ver:VerpakkingOmschrijving)
  	RETURN Level:Notify
  END
  
  omit('celmeerderekeren')
  IF LOC:CelID1 <> 0 AND (LOC:CelID1 = LOC:CelID2 OR	LOC:CelID1 = LOC:CelID3 OR LOC:CelID1 = LOC:CelID4)
  	MESSAGE('Cel ' & CLIP(LOC:CelID1) & ' is meer dan 1 keer ingevoerd')
  	Select(?CEL:CelOms)
  	RETURN Level:Notify
  .
  
  IF LOC:CelID2 <> 0 AND (LOC:CelID2 = LOC:CelID3 OR LOC:CelID2 = LOC:CelID4)
  	MESSAGE('Cel ' & CLIP(LOC:CelID2) & ' is meer dan 1 keer ingevoerd')
  	Select(?ACEL:CelOms)
  	RETURN Level:Notify
  .
  
  IF LOC:CelID3 <> 0 AND (LOC:CelID3 = LOC:CelID4)
  	MESSAGE('Cel ' & CLIP(LOC:CelID3) & ' is meer dan 1 keer ingevoerd')
  	Select(?AACEL:CelOms)
  	RETURN Level:Notify
  .
  'celmeerderekeren'
  
  IF (LOC:KG1<>0 OR LOC:Pallets1<>0) AND LOC:CelID1 = 0 THEN
  	SELECT(?CEL:CelOms)
  	RETURN Level:Notify
  .
  
  IF (LOC:KG2<>0 OR LOC:Pallets2<>0) AND LOC:CelID2 = 0 THEN
  	SELECT(?ACEL:CelOms)
  	RETURN Level:Notify
  .
  
  IF (LOC:KG3<>0 OR LOC:Pallets3<>0) AND LOC:CelID3 = 0 THEN
  	SELECT(?AACEL:CelOms)
  	RETURN Level:Notify
  .
  
  IF (LOC:KG4<>0 OR LOC:Pallets4<>0) AND LOC:CelID4 = 0 THEN
  	SELECT(?AAACEL:CelOms)
  	RETURN Level:Notify
  .
  
  IF LOC:PalletsBalans<>'Klopt' OR LOC:KGBalans<>'Klopt'
  	MESSAGE('Mutatietotalen niet gelijk aan partijtotaal.')
  	RETURN Level:Notify
  .
  
  IF ThisWindow.Request = InsertRecord THEN
  	! Nog controleren of niet een andere gebruiker ondertussen de inslag al heeft gedaan
  	Access:APlanning.TryFetch(APla:PK_Planning)
  	IF APla:MutatieGemaakt THEN
  		MESSAGE('Inslag is reeds gedaan')
  		RETURN Level:Notify
  	.
  ELSE
  	! Wijziging, controleren of de voorraad niet negatief wordt
  	DO ControleerVoorraad
  	
  	IF LOC:NegatieveVoorraad THEN
  		RETURN Level:Notify
  	.
  .
  ReturnValue = PARENT.TakeCompleted()
  IF (ThisWindow.Request = ChangeRecord)
  	DO WisMutaties
  END
  
  IF (ThisWindow.Request = InsertRecord)
  	! Palletstickers kunnen ook binnen dit venster direct worden geprint
  	APla:Geprint = LOC:PlaGeprint
  	Access:APlanning.Update()
  END
  
  ! Toevoegen mutaties
  IF LOC:CelID1<>0 AND (LOC:Pallets1<>0 OR LOC:KG1<>0)
  	Access:Mutatie.PrimeRecord()
  	Mut:PartijID = Par:PartijID 
  	Mut:InslagKG = LOC:KG1
  	Mut:InslagPallet = LOC:Pallets1 
  	Mut:CelID = LOC:CelID1
  	Mut:CelLocatieID = LOC:CelLocatieID1
  	
  	CLEAR(CL:Record)	
  	CL:CelLocatieID = LOC:CelLocatieID1
  	Access:CelLocatie.TryFetch(CL:PK_CelLocatie)
  	IF Mut:CelID <> CL:CelID THEN LOC:CelLocatieID1 = 0.
  
  	Mut:SoortMutatie = 'IN'
  	Mut:PlanningID = APla:PlanningID
  	Mut:ArtikelID = Par:ArtikelID
  	Mut:DatumTijd_DATE = Par:AanmaakDatum_DATE
  	Mut:DatumTijd_TIME = Par:AanmaakDatum_TIME
  	Access:Mutatie.Insert()
  	
  	! Opslaan wegingen
  	LOOP i# = 1 TO RECORDS(LOC:WegingQueue1)
  		GET(LOC:WegingQueue1, i#)
  		
  		Access:Weging.PrimeRecord(false)
  		Weg:MutatieID = Mut:MutatieID
  		Weg:BrutoGewicht = WGQ1:BrutoGewichtKG
  		Weg:NettoGewicht = WGQ1:NettoGewichtKG
  		Weg:PalletSoortID = WGQ1:PalletsoortID
  		Weg:Tarra = WGQ1:BrutoGewichtKG - WGQ1:NettoGewichtKG
  		Weg:WeegDatum = WGQ1:Datum
  		Weg:WeegTijdstip = WGQ1:Tijd
  		Access:Weging.Insert()
  	END	
  	
  	! Controleren op spook-dubbele inslagen
  	!ThisWindow.VerwijderDubbeleInslag(Par:Record, LOC:CelID1)
  END
  
  IF LOC:CelID2<>0 AND (LOC:Pallets2<>0 OR LOC:KG2<>0)
  	Access:Mutatie.PrimeRecord()
  	Mut:PartijID = Par:PartijID 
  	Mut:InslagKG = LOC:KG2
  	Mut:InslagPallet = LOC:Pallets2
  	Mut:CelID = LOC:CelID2
  	Mut:CelLocatieID = LOC:CelLocatieID2	
  	
  	CLEAR(CL:Record)	
  	CL:CelLocatieID = LOC:CelLocatieID2
  	Access:CelLocatie.TryFetch(CL:PK_CelLocatie)
  	IF Mut:CelID <> CL:CelID THEN LOC:CelLocatieID2 = 0.
  	
  	Mut:SoortMutatie = 'IN'
  	Mut:PlanningID = APla:PlanningID
  	Mut:ArtikelID = Par:ArtikelID
  	Mut:DatumTijd_DATE = Par:AanmaakDatum_DATE
  	Mut:DatumTijd_TIME = Par:AanmaakDatum_TIME
  	Access:Mutatie.Insert()
  	
  	! Opslaan wegingen
  	LOOP i# = 1 TO RECORDS(LOC:WegingQueue2)
  		GET(LOC:WegingQueue2, i#)
  		
  		Access:Weging.PrimeRecord(false)
  		Weg:MutatieID = Mut:MutatieID
  		Weg:BrutoGewicht = WGQ2:BrutoGewichtKG
  		Weg:NettoGewicht = WGQ2:NettoGewichtKG
  		Weg:PalletSoortID = WGQ2:PalletsoortID
  		Weg:Tarra = WGQ2:BrutoGewichtKG - WGQ2:NettoGewichtKG
  		Weg:WeegDatum = WGQ2:Datum
  		Weg:WeegTijdstip = WGQ2:Tijd
  		Access:Weging.Insert()
  	END
  	
  	! Controleren op spook-dubbele inslagen
  	!ThisWindow.VerwijderDubbeleInslag(Par:Record, LOC:CelID2)
  END
  
  IF LOC:CelID3<>0 AND (LOC:Pallets3<>0 OR LOC:KG3<>0)
  	Access:Mutatie.PrimeRecord()
  	Mut:PartijID = Par:PartijID 
  	Mut:InslagKG = LOC:KG3
  	Mut:InslagPallet = LOC:Pallets3
  	Mut:CelID = LOC:CelID3
  	Mut:CelLocatieID = LOC:CelLocatieID3	
  	
  	CLEAR(CL:Record)	
  	CL:CelLocatieID = LOC:CelLocatieID3
  	Access:CelLocatie.TryFetch(CL:PK_CelLocatie)
  	IF Mut:CelID <> CL:CelID THEN LOC:CelLocatieID3 = 0.
  
  	Mut:SoortMutatie = 'IN'
  	Mut:PlanningID = APla:PlanningID
  	Mut:ArtikelID = Par:ArtikelID
  	Mut:DatumTijd_DATE = Par:AanmaakDatum_DATE
  	Mut:DatumTijd_TIME = Par:AanmaakDatum_TIME
  	Access:Mutatie.Insert()
  	
  	! Opslaan wegingen
  	LOOP i# = 1 TO RECORDS(LOC:WegingQueue3)
  		GET(LOC:WegingQueue3, i#)
  		
  		Access:Weging.PrimeRecord(false)
  		Weg:MutatieID = Mut:MutatieID
  		Weg:BrutoGewicht = WGQ3:BrutoGewichtKG
  		Weg:NettoGewicht = WGQ3:NettoGewichtKG
  		Weg:PalletSoortID = WGQ3:PalletsoortID
  		Weg:Tarra = WGQ3:BrutoGewichtKG - WGQ3:NettoGewichtKG
  		Weg:WeegDatum = WGQ3:Datum
  		Weg:WeegTijdstip = WGQ3:Tijd
  		Access:Weging.Insert()
  	END
  
  	! Controleren op spook-dubbele inslagen
  	!ThisWindow.VerwijderDubbeleInslag(Par:Record, LOC:CelID3)
  END
  
  IF LOC:CelID4<>0 AND (LOC:Pallets4<>0 OR LOC:KG4<>0)
  	Access:Mutatie.PrimeRecord()
  	Mut:PartijID = Par:PartijID 
  	Mut:InslagKG = LOC:KG4
  	Mut:InslagPallet = LOC:Pallets4
  	Mut:CelID = LOC:CelID4
  	Mut:CelLocatieID = LOC:CelLocatieID4	
  	
  	CLEAR(CL:Record)	
  	CL:CelLocatieID = LOC:CelLocatieID4
  	Access:CelLocatie.TryFetch(CL:PK_CelLocatie)
  	IF Mut:CelID <> CL:CelID THEN LOC:CelLocatieID4 = 0.
  	
  	Mut:SoortMutatie = 'IN'
  	Mut:PlanningID = APla:PlanningID
  	Mut:ArtikelID = Par:ArtikelID
  	Mut:DatumTijd_DATE = Par:AanmaakDatum_DATE
  	Mut:DatumTijd_TIME = Par:AanmaakDatum_TIME
  	Access:Mutatie.Insert()
  
  	! Opslaan wegingen
  	LOOP i# = 1 TO RECORDS(LOC:WegingQueue4)
  		GET(LOC:WegingQueue4, i#)
  		
  		Access:Weging.PrimeRecord(false)
  		Weg:MutatieID = Mut:MutatieID
  		Weg:BrutoGewicht = WGQ4:BrutoGewichtKG
  		Weg:NettoGewicht = WGQ4:NettoGewichtKG
  		Weg:PalletSoortID = WGQ4:PalletsoortID
  		Weg:Tarra = WGQ4:BrutoGewichtKG - WGQ4:NettoGewichtKG
  		Weg:WeegDatum = WGQ4:Datum
  		Weg:WeegTijdstip = WGQ4:Tijd
  		Access:Weging.Insert()
  	END
  	
  	! Controleren op spook-dubbele inslagen
  	!ThisWindow.VerwijderDubbeleInslag(Par:Record, LOC:CelID4)
  END
  
  VoorraadClass.BerekenPlanningMutatieGrootte(APla:PlanningID)
  
  LOC:SavedPartijBuffer = Access:Partij.SaveBuffer()
  LOC:SavedPartijFile = Access:Partij.SaveFile()
  VoorraadClass.BerekenPartijenInkoopPrijs(APla:InkoopID)
  Access:Partij.RestoreFile(LOC:SavedPartijFile)
  Access:Partij.RestoreBuffer(LOC:SavedPartijBuffer)
    ThisNetRefresh.Send('|Relatie|Verpakking|Cel|ACel|AACel|AAACel|ViewArtikel|ACelLocatie|AACelLocatie|AAACelLocatie|AAAACelLocatie|Partij|') ! NetTalk (NetRefresh)
  	NetRefreshPlanningViews()
  	NetRefreshVoorraadViews()
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
  ?Par:InslagQATransportmiddelSchoon{PROP:Background}=CHOOSE(Par:InslagQATransportmiddelSchoon,COLOR:NONE,COLOR:RED)
  ?Par:InslagQAVerpakkingSchoonGesloten{PROP:Background}=CHOOSE(Par:InslagQAVerpakkingSchoonGesloten,COLOR:NONE,COLOR:RED)
  ?Par:InslagQAIdentificatieMerkenVerpakking{PROP:Background}=CHOOSE(Par:InslagQAIdentificatieMerkenVerpakking,COLOR:NONE,COLOR:RED)
  ?Par:InslagQAIsGeurKleurProductEigen{PROP:Background}=CHOOSE(Par:InslagQAIsGeurKleurProductEigen,COLOR:NONE,COLOR:RED)
  ?Par:InslagQAGeenGlasbreuk{PROP:Background}=CHOOSE(Par:InslagQAGeenGlasbreuk,COLOR:NONE,COLOR:RED)
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

ThisWindow.VerwijderDubbeleInslag PROCEDURE(Par:Record PartijRecord, LONG CelID)

  CODE
  	CLEAR(Dub:Record)
  	Dub:PartijID = PartijRecord:PartijID
  	Dub:CelID = CelID
  	IF (Access:DubbeleInslagMutaties.TryFetch(Dub:Partij_CelID_K) = Level:Benign)
  		IF (Dub:AantalInslagen > 1)
  			!MESSAGE((Dub:AantalInslagen - 1) & ' dubbele inslag gedetecteerd (Partij: ' & Dub:PartijID & ' / Cel-ID: ' & Dub:CelID & '): deze dubbelen worden nu verwijderd')
  			aantal_verwijderen# = (Dub:AantalInslagen - 1)
  			AMut:PartijID = PartijRecord:PartijID
  			AMut:DatumTijd_DATE = PartijRecord:AanmaakDatum_GROUP:AanmaakDatum_DATE
  			AMut:DatumTijd_TIME = PartijRecord:AanmaakDatum_GROUP:AanmaakDatum_TIME
  			SET(AMut:Mutatie_FK01, AMut:Mutatie_FK01)
  			
  			LOOP
  				Access:AMutatie.Next()
  				IF ERROR() THEN BREAK.
  				IF AMut:PartijID <> PartijRecord:PartijID OR |
  					AMut:DatumTijd_DATE <> PartijRecord:AanmaakDatum_GROUP:AanmaakDatum_DATE OR |
  					AMut:DatumTijd_TIME <> PartijRecord:AanmaakDatum_GROUP:AanmaakDatum_TIME THEN BREAK.
  				IF AMut:CelID <> CelID OR AMut:SoortMutatie <> 'IN' THEN CYCLE.
  			
  				Access:AMutatie.DeleteRecord(False)
  				aantal_verwijderen# -= 1
  				
  				IF (aantal_verwijderen# = 0) THEN BREAK.
  			.			
   		.
  	END


!!! <summary>
!!! Generated from procedure template - Window
!!! </summary>
WeegWindow PROCEDURE 

LOC:Debug            BYTE                                  ! 
LOC:PortID_Koord     LONG                                  ! 
LOC:PortID_Weeg      LONG                                  ! 
LOC:PortString_Weeg  STRING(50)                            ! 
LOC:PortString_Koord STRING(50)                            ! 
LOC:Gewicht          DECIMAL(9,2)                          ! 
LOC:PalletSoortID    LONG                                  ! 
LOC:PalletTarra      DECIMAL(10,2)                         ! 
LOC:Result           LONG                                  ! 
LOC:TempChar         STRING(1)                             ! 
Loc:AantalPogingen   LONG                                  ! 
LOC:ByteCounter1     LONG                                  ! 
LOC:ByteCounter2     LONG                                  ! 
Loc:Stabiel          BYTE                                  ! 
Loc:SendString       STRING(20)                            ! 
Loc:ReceiveString2   STRING(255)                           ! 
Loc:AanHetKoordGetrokken BYTE                              ! 
LOC:DymoEtiketPrinten LONG                                 ! 
LOC:PalletBladPrinten BYTE                                 ! 
LOC:GebruikKoord     BYTE                                  ! 
LOC:NieuweWeegschaal BYTE                                  ! 
LOC:AantalPallets    LONG                                  ! 
LOC:TotaalNettoKG    DECIMAL(9,2)                          ! 
LOC:Loggen           BYTE                                  ! 
Loc:GewichtQ         QUEUE,PRE(LGQ)                        ! 
Tijd                 TIME                                  ! 
Gewicht              DECIMAL(9,2)                          ! 
Receivestring1       STRING(255)                           ! 
ReceiveString2       STRING(255)                           ! 
                     END                                   ! 
FDCB3::View:FileDropCombo VIEW(PalletSoort)
                       PROJECT(PalSrt:PalletOmschrijving)
                       PROJECT(PalSrt:Tarra)
                       PROJECT(PalSrt:PalletSoortID)
                     END
Queue:FileDropCombo  QUEUE                            !
PalSrt:PalletOmschrijving LIKE(PalSrt:PalletOmschrijving) !List box control field - type derived from field
PalSrt:Tarra           LIKE(PalSrt:Tarra)             !Browse hot field - type derived from field
PalSrt:PalletSoortID   LIKE(PalSrt:PalletSoortID)     !Primary key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
LocEnableEnterByTab  BYTE(1)                               !Used by the ENTER Instead of Tab template
EnterByTabManager    EnterByTabClass
QuickWindow          WINDOW('Weegschaal'),AT(,,554,441),FONT('MS Sans Serif',8,,FONT:regular,CHARSET:DEFAULT),DOUBLE, |
  CENTER,GRAY,IMM,HLP('WeegWindow'),SYSTEM,TIMER(10)
                       SHEET,AT(-3,2,555,437),USE(?SHEET1)
                         TAB('Weging'),USE(?TAB1)
                           STRING('Palletsoort:'),AT(1,84),USE(?STRING2),FONT('Microsoft Sans Serif',12,,,CHARSET:ANSI), |
  TRN
                           COMBO(@s10),AT(3,100,385,49),USE(PalSrt:PalletOmschrijving),FONT('Microsoft Sans Serif',38, |
  ,,CHARSET:ANSI),VSCROLL,DROP(5),FORMAT('40L(2)|M~Omschrijving~@s10@'),FROM(Queue:FileDropCombo), |
  IMM
                           BUTTON('WEEG'),AT(392,99,149,94),USE(?WeegButton),FONT('Microsoft Sans Serif',38,,,CHARSET:ANSI), |
  KEY(EnterKey),DEFAULT
                           STRING('Huidige weegstand (KG):'),AT(1,155),USE(?STRING1),FONT('Microsoft Sans Serif',12,, |
  ,CHARSET:ANSI),TRN
                           ENTRY(@n-14`2),AT(3,172,384),USE(LOC:Gewicht),FONT('Microsoft Sans Serif',48,,,CHARSET:ANSI), |
  RIGHT
                           LIST,AT(3,230,539,74),USE(?WegingQueue),VSCROLL,FORMAT('100R(2)|~Bruto (KG)~C(0)@n14`2@' & |
  '45C(2)|~Palletsoort~C(0)@s10@0C(2)@n-14@110R(2)|~Netto (KG)~C(0)@n14`2@0R(2)@d17@0R(' & |
  '2)@t7@60R(2)|~Pallet ID~C(1)@n_10@'),FROM(GLO:WegingQueue)
                           BUTTON('OK'),AT(286,366,121,68),USE(?Ok),FONT('Microsoft Sans Serif',38,,,CHARSET:ANSI),ICON('WAOK.ICO'), |
  MSG('Accept operation'),TIP('Accept Operation')
                           BUTTON('SLUIT'),AT(417,366,121,68),USE(?Cancel),FONT('Microsoft Sans Serif',38,,,CHARSET:ANSI), |
  ICON('WACANCEL.ICO'),MSG('Cancel Operation'),TIP('Cancel Operation')
                           CHECK('Gebruik koord'),AT(392,83),USE(LOC:GebruikKoord),FONT('Microsoft Sans Serif',12,,,CHARSET:ANSI), |
  TRN,VALUE('1','0')
                           STRING(@N_3),AT(277,320,66),USE(LOC:AantalPallets),FONT('Microsoft Sans Serif',40),RIGHT,TRN
                           PROMPT('Aantal pallets:'),AT(277,304),USE(?PROMPT1),FONT('Microsoft Sans Serif',12,,,CHARSET:ANSI), |
  TRN
                           PROMPT('Totaal netto (KG):'),AT(455,304),USE(?PROMPT2),FONT('Microsoft Sans Serif',12,,,CHARSET:ANSI), |
  TRN
                           STRING(@N-13`2),AT(357,320,185,40),USE(LOC:TotaalNettoKG),FONT('Microsoft Sans Serif',40), |
  RIGHT,TRN
                           GROUP('Partij'),AT(4,20,539,57),USE(?GROUP1),BOXED,TRN
                             PROMPT('Partij-ID:'),AT(7,30),USE(?PROMPT3),TRN
                             STRING(@N_10),AT(36,30),USE(Par:PartijID),TRN
                             PROMPT('Externe Partij-ID:'),AT(7,44),USE(?PROMPT4),TRN
                             STRING(@S20),AT(62,44),USE(Par:ExternPartijnr),TRN
                             STRING(@s60),AT(117,30,185),USE(Art:ArtikelOms),TRN
                             PROMPT('Artikel:'),AT(90,30),USE(?PROMPT6),TRN
                             PROMPT('Referentie:'),AT(147,44),USE(?PROMPT5),TRN
                             STRING(@S50),AT(191,44,111),USE(Par:Referentie),TRN
                             PROMPT('Totaal (KG):'),AT(147,58),USE(?PROMPT9),TRN
                             STRING(@n12`2),AT(191,58),USE(Par:KG),TRN
                             PROMPT('Totaal (Pallets):'),AT(310,58),USE(?PROMPT10),TRN
                             STRING(@N13`2),AT(365,58),USE(Par:Pallets),TRN
                             STRING(@S50),AT(364,44,171),USE(Ver:VerpakkingOmschrijving),TRN
                             PROMPT('Verpakking:'),AT(310,44),USE(?PROMPT7),TRN
                             PROMPT('Leverancier:'),AT(310,30),USE(?PROMPT8),TRN
                             STRING(@S50),AT(364,30,171),USE(Rel:FirmaNaam),TRN
                           END
                           BUTTON('VERWIJDER'),AT(391,195,149,30),USE(?VerwijderButton),FONT('Microsoft Sans Serif',24, |
  ,FONT:bold)
                           GROUP('Dymo-etiket printen?'),AT(3,308,271,62),USE(?GROUP2),FONT('Microsoft Sans Serif',12, |
  ,,CHARSET:ANSI),BOXED,TRN
                             BUTTON('1X'),AT(99,320,81,48),USE(?DymoPrintButton),FONT('Microsoft Sans Serif',38,,,CHARSET:ANSI)
                             BUTTON('NIET'),AT(185,320,81,48),USE(?DymoGeenPrintButton),FONT('Microsoft Sans Serif',38, |
  ,,CHARSET:ANSI)
                           END
                           GROUP('Palletblad printen?'),AT(2,371,271,64),USE(?GROUP3),FONT('Microsoft Sans Serif',12, |
  ,,CHARSET:ANSI),BOXED,TRN
                             BUTTON('2X'),AT(11,385,81,48),USE(?Palletblad2PrintButton),FONT('Microsoft Sans Serif',38, |
  ,,CHARSET:ANSI)
                             BUTTON('1X'),AT(99,385,81,48),USE(?PalletbladPrintButton),FONT('Microsoft Sans Serif',38,, |
  ,CHARSET:ANSI)
                             BUTTON('NIET'),AT(185,385,81,48),USE(?PalletbladGeenPrintButton),FONT('Microsoft Sans Serif', |
  38,,,CHARSET:ANSI)
                           END
                         END
                         TAB('Systeemgegevens'),USE(?TAB2)
                           STRING(@S1),AT(39,31),USE(LOC:TempChar)
                           STRING(@n_6),AT(39,39),USE(LOC:ByteCounter2)
                           LIST,AT(3,54,503,218),USE(?LIST1),VSCROLL,FORMAT('40L(2)|M~Tijd~C(0)@t4@60R(2)|M~Gewich' & |
  't~C(1)@n-13`2@100L(2)|M~Receivestring (ASCII)~C(0)@s255@1020L(2)|M~Receivestring (De' & |
  'c)~C(0)@s255@'),FROM(Loc:GewichtQ)
                           CHECK('Loggen'),AT(465,277),USE(LOC:Loggen),VALUE('1','0')
                         END
                       END
                     END

    omit('***',WE::CantCloseNowSetHereDone=1)  !Getting Nested omit compile error, then uncheck the "Check for duplicate CantCloseNowSetHere variable declaration" in the WinEvent local template
WE::CantCloseNowSetHereDone equate(1)
WE::CantCloseNowSetHere     long
    !***
ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED
TakeCloseEvent         PROCEDURE(),BYTE,PROC,DERIVED
TakeEvent              PROCEDURE(),BYTE,PROC,DERIVED
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
Resizer              CLASS(WindowResizeClass)
Init                   PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)
                     END

FDCB3                CLASS(FileDropComboClass)             ! File drop combo manager
Q                      &Queue:FileDropCombo           !Reference to browse queue type
                     END

WeegClass           CLASS
Stabiel                 PROCEDURE(LONG), BYTE
SavGewicht          	LONG,DIM(10)
					End

  CODE
  GlobalResponse = ThisWindow.Run()                        ! Opens the window and starts an Accept Loop

!---------------------------------------------------------------------------
DefineListboxStyle ROUTINE
!|
!| This routine create all the styles to be shared in this window
!| It`s called after the window open
!|
!---------------------------------------------------------------------------
WeegButton          ROUTINE
	IF Loc:Stabiel = 1 OR NOT(LOC:PortID_Weeg >= 0) THEN
		IF (LOC:Gewicht) > 0
			CLEAR(APalSrt:Record)
			APalSrt:PalletSoortID = LOC:PalletSoortID
            Access:APalletSoort.TryFetch(APalSrt:PK_PalletSoort)
            
            CLEAR(PLL:Record)
            Access:Pallet.Insert()

			CLEAR(GLO:WegingQueue)
			WGQ:BrutoGewichtKG = LOC:Gewicht + LOC:PalletTarra
			WGQ:Palletsoort = APalSrt:PalletOmschrijving
			WGQ:PalletsoortID = LOC:PalletSoortID
			WGQ:NettoGewichtKG = LOC:Gewicht
			WGQ:Datum = TODAY()
            WGQ:Tijd = CLOCK()
            WGQ:PalletID = PLL:PalletID
			ADD(GLO:WegingQueue)
			
			DO BerekenTotaals
						
			IF LOC:DymoEtiketPrinten
				ReportDymoStickers(2, RECORDS(GLO:WegingQueue))
            END
            
            IF LOC:PalletBladPrinten > 0
                ! GLO:PalletBlad-variabelen worden gevuld bij het drukken op de Weeg Nu-knop voorafgaand aan deze window.
                ReportPalletBladEnkel(WGQ:PalletID, LOC:Gewicht, FALSE, LOC:PalletBladPrinten)
            END    
		END
	END
	
	EXIT
BerekenTotaals      ROUTINE
	LOC:TotaalNettoKG = GLO:TotaalWegingKG
	LOOP i# = 1 TO RECORDS(GLO:WegingQueue)
		GET(GLO:WegingQueue, i#)
		LOC:TotaalNettoKG += WGQ:NettoGewichtKG
	END
	
	LOC:AantalPallets = GLO:TotaalWegingPallets + RECORDS(GLO:WegingQueue)
	
	DISPLAY(?LOC:TotaalNettoKG)
	DISPLAY(?LOC:AantalPallets)
	
	EXIT
UpdatePalletBladPrintButton ROUTINE
    CASE LOC:PalletBladPrinten
    OF 0
        ?PalletbladGeenPrintButton{PROP:Background} = COLOR:Green
        ?PalletbladPrintButton{PROP:Background} = COLOR:BTNFACE
        ?Palletblad2PrintButton{PROP:Background} = COLOR:BTNFACE
    OF 1
        ?PalletbladGeenPrintButton{PROP:Background} = COLOR:BTNFACE
        ?PalletbladPrintButton{PROP:Background} = COLOR:Green
        ?Palletblad2PrintButton{PROP:Background} = COLOR:BTNFACE
    OF 2
        ?PalletbladGeenPrintButton{PROP:Background} = COLOR:BTNFACE
        ?PalletbladPrintButton{PROP:Background} = COLOR:BTNFACE
        ?Palletblad2PrintButton{PROP:Background} = COLOR:Green
    END
UpdateDymoPrintButton ROUTINE
    CASE LOC:DymoEtiketPrinten
    OF 0
        ?DymoGeenPrintButton{PROP:Background} = COLOR:Green
        ?DymoPrintButton{PROP:Background} = COLOR:BTNFACE
    OF 1
        ?DymoGeenPrintButton{PROP:Background} = COLOR:BTNFACE
        ?DymoPrintButton{PROP:Background} = COLOR:Green
    END

ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('WeegWindow')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?STRING2
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  IF SELF.Request = SelectRecord
     SELF.AddItem(?Ok,RequestCancelled)                    ! Add the close control to the window manger
  ELSE
     SELF.AddItem(?Ok,RequestCompleted)                    ! Add the close control to the window manger
  END
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  Relate:APalletSoort.Open                                 ! File APalletSoort used by this procedure, so make sure it's RelationManager is open
  Relate:Pallet.Open                                       ! File Pallet used by this procedure, so make sure it's RelationManager is open
  Relate:PalletSoort.Open                                  ! File PalletSoort used by this procedure, so make sure it's RelationManager is open
  Relate:Partij.Open                                       ! File Partij used by this procedure, so make sure it's RelationManager is open
  Relate:Relatie.SetOpenRelated()
  Relate:Relatie.Open                                      ! File Relatie used by this procedure, so make sure it's RelationManager is open
  Relate:Verpakking.Open                                   ! File Verpakking used by this procedure, so make sure it's RelationManager is open
  Relate:ViewArtikel.Open                                  ! File ViewArtikel used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(QuickWindow)                                   ! Open window
  LOC:GebruikKoord=GETINI('Weeg','GebruikKoord',0,'.\Voorraad.ini')
  LOC:PortString_Koord=GETINI('Weeg','PortKoord',,'.\Voorraad.ini')
  LOC:PortString_Weeg=GETINI('Weeg','PortWeeg',,'.\Voorraad.ini')
  LOC:NieuweWeegschaal=GETINI('Weeg','NieuweWeegschaal',0,'.\Voorraad.ini')
  LOC:Loggen=GETINI('Weeg','Loggen',0,'.\Voorraad.ini')
  Loc:AantalPogingen = GETINI('Weeg','AantalPogingen',5,'.\Voorraad.ini')
  
  IF CLIP(LOC:PortString_Koord) <> ''
      LOC:PortID_Koord = NewPort(LOC:PortString_Koord)
      IF LOC:PortID_Koord < 0                           ! there was an Error
          MESSAGE('COM-port van het koord kon niet geopend worden: ' & LOC:PortID_Koord,LOC:PortString_Koord)
          LOC:Debug = 1
      END
  ELSE
      HIDE(?LOC:GebruikKoord)
  END
  
  IF CLIP(LOC:PortString_Weeg) <> ''
      LOC:PortID_Weeg = NewPort(LOC:PortString_Weeg)
      IF LOC:PortID_Weeg < 0                           ! there was an Error
          MESSAGE('COM-port van de weegschaal kon niet geopend worden: ' & LOC:PortID_Weeg,LOC:PortString_Weeg)
      ELSE
          IF (LOC:Debug = 1) THEN LOC:Debug = 0.
      END
  END
  
  LOC:DymoEtiketPrinten = GETINI('Weeg','DymoEtiketPrinten', 1, '.\Voorraad.ini')
  DO UpdateDymoPrintButton
  LOC:PalletBladPrinten = GETINI('Weeg','PalletBladPrinten', 1, '.\Voorraad.ini')
  DO UpdatePalletBladPrintButton
  
  LOC:PalletSoortID = 1
  PalSrt:PalletSoortID = 1
  Access:PalletSoort.TryFetch(PalSrt:PK_PalletSoort)
  LOC:PalletTarra = PalSrt:Tarra
  
  FREE(GLO:WegingQueue)
  DO BerekenTotaals
  WinAlertMouseZoom()
  Do DefineListboxStyle
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('WeegWindow',QuickWindow)                   ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  FDCB3.Init(PalSrt:PalletOmschrijving,?PalSrt:PalletOmschrijving,Queue:FileDropCombo.ViewPosition,FDCB3::View:FileDropCombo,Queue:FileDropCombo,Relate:PalletSoort,ThisWindow,GlobalErrors,0,1,0)
  FDCB3.Q &= Queue:FileDropCombo
  FDCB3.AddSortOrder(PalSrt:FK_PalletSoort)
  FDCB3.AddField(PalSrt:PalletOmschrijving,FDCB3.Q.PalSrt:PalletOmschrijving) !List box control field - type derived from field
  FDCB3.AddField(PalSrt:Tarra,FDCB3.Q.PalSrt:Tarra) !Browse hot field - type derived from field
  FDCB3.AddField(PalSrt:PalletSoortID,FDCB3.Q.PalSrt:PalletSoortID) !Primary key field - type derived from field
  FDCB3.AddUpdateField(PalSrt:PalletSoortID,LOC:PalletSoortID)
  FDCB3.AddUpdateField(PalSrt:Tarra,LOC:PalletTarra)
  ThisWindow.AddItem(FDCB3.WindowComponent)
  FDCB3.DefaultFill = 0
  SELF.SetAlerts()
  EnterByTabManager.ExcludeControl(?Cancel)
  EnterByTabManager.ExcludeControl(?Ok)
  EnterByTabManager.Init(False)
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF NOT(LOC:Debug)
  	KillAllPorts()
  END
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:APalletSoort.Close
    Relate:Pallet.Close
    Relate:PalletSoort.Close
    Relate:Partij.Close
    Relate:Relatie.Close
    Relate:Verpakking.Close
    Relate:ViewArtikel.Close
  END
  IF SELF.Opened
    INIMgr.Update('WeegWindow',QuickWindow)                ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
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
    OF ?LOC:GebruikKoord
      PUTINI('Weeg','GebruikKoord',LOC:GebruikKoord,'.\Voorraad.ini')
    OF ?VerwijderButton
      ! Verwijder geselecteerde weging-regel
      GET(GLO:WegingQueue, CHOICE(?WegingQueue))
      IF NOT(ERROR()) THEN
      	DELETE(GLO:WegingQueue)
      	DO BerekenTotaals
      END
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?PalSrt:PalletOmschrijving
      	! na selectie de weegbutton selecteren
      	Select(?WeegButton)
    OF ?WeegButton
      ThisWindow.Update()
      DO WeegButton
    OF ?DymoPrintButton
      ThisWindow.Update()
      LOC:DymoEtiketPrinten = 1
      PUTINI('Weeg','DymoEtiketPrinten', LOC:DymoEtiketPrinten, '.\Voorraad.ini')
      DO UpdateDymoPrintButton
    OF ?DymoGeenPrintButton
      ThisWindow.Update()
      LOC:DymoEtiketPrinten = 0
      PUTINI('Weeg','DymoEtiketPrinten', LOC:DymoEtiketPrinten, '.\Voorraad.ini')
      DO UpdateDymoPrintButton
    OF ?Palletblad2PrintButton
      ThisWindow.Update()
      LOC:PalletBladPrinten = 2
      PUTINI('Weeg','PalletBladPrinten', LOC:PalletBladPrinten, '.\Voorraad.ini')
      DO UpdatePalletBladPrintButton
    OF ?PalletbladPrintButton
      ThisWindow.Update()
      LOC:PalletBladPrinten = 1
      PUTINI('Weeg','PalletBladPrinten', LOC:PalletBladPrinten, '.\Voorraad.ini')
      DO UpdatePalletBladPrintButton
    OF ?PalletbladGeenPrintButton
      ThisWindow.Update()
      LOC:PalletBladPrinten = 0
      PUTINI('Weeg','PalletBladPrinten', LOC:PalletBladPrinten, '.\Voorraad.ini')
      DO UpdatePalletBladPrintButton
    OF ?LOC:Loggen
      PUTINI('Weeg','Loggen',LOC:Loggen,'.\Voorraad.ini')
    END
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue


ThisWindow.TakeCloseEvent PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  IF MESSAGE('Weet u zeker dat u dit venster wilt sluiten? ', 'Venster sluiten', ICON:Exclamation, BUTTON:YES+BUTTON:NO, BUTTON:NO) <> BUTTON:YES THEN RETURN Level:Notify.
  ReturnValue = PARENT.TakeCloseEvent()
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
    END
  ReturnValue = PARENT.TakeWindowEvent()
    CASE EVENT()
    OF EVENT:OpenWindow
        post(event:visibleondesktop)
    OF EVENT:Timer
      ! Babbelen met het koord/weegschaal
      0{Prop:Timer}=0
      ! LOC:Gewicht nog vullen met de uitgelezen waarde
      
      IF NOT(LOC:Debug)
      	IF LOC:PortID_Weeg >= 0
      		! at this point there may or may not be characters waiting in the recieve buffer.
      		! if there are I can get the characters out of the buffer one at a time
      		LOOP
      			! Get 1 character if it's waiting
      			LOC:Result = ReadPort(LOC:PortID_Weeg, LOC:TempChar, 1)	
      			! there were charaters waiting
      			IF LOC:Result > 0
      				LGQ:ReceiveString2 = CLIP(CLIP(LGQ:Receivestring2) & ',' & VAL(LOC:TempChar))
      				IF VAL(LOC:TempChar)=10 or VAL(LOC:TempChar)=0 then cycle. !en lees de volgende in
      				
      				IF LOC:ByteCounter2 >= 20 or VAL(LOC:TempChar)= 13 then      ! 20 posities of een enter
      					IF NOT(LOC:NieuweWeegschaal) THEN ! Oude weegschaal
      						! als de laatste een 1 is dan skippen
      						IF SUB(CLIP(LGQ:Receivestring1),-1,1)='0'
      						   LGQ:Gewicht= Sub(LGQ:Receivestring1,1,LEN(CLIP(LGQ:Receivestring1))-13)
      						   LOC:Gewicht= (LGQ:Gewicht - LOC:PalletTarra)
      						   Loc:Stabiel = WeegClass.Stabiel(LOC:Gewicht)
      						ELSE
      						   LGQ:Gewicht=0
      						!   LOC:Gewicht=0
      						!   Loc:Stabiel=FALSE
      						END
      					ELSE ! Nieuwe weegschaal
      						! als de laatste een 1 is dan skippen
      						IF SUB(LGQ:Receivestring1,3,1) = '+' ! Derde karakter is een +
      							LGQ:Gewicht= CLIP(Sub(LGQ:Receivestring1,4, LEN(LGQ:Receivestring1) - 3))
      							LOC:Gewicht= (LGQ:Gewicht - LOC:PalletTarra)
      							Loc:Stabiel = WeegClass.Stabiel(LOC:Gewicht)
      						ELSE
      						   LGQ:Gewicht=0
      						!   LOC:Gewicht=0
      						!   Loc:Stabiel=FALSE
      						END
      					END
      					
      					IF (LOC:Loggen = 1)
      						 LGQ:Tijd=CLOCK()
      						 Add(Loc:GewichtQ)						! Uitgeschakeld want dit heb ik alleen voor de test nodig
      					END
      					
      					Clear(LGQ:Tijd)
      					Clear(LGQ:Gewicht)
      					Clear(LGQ:Receivestring1)
      					Clear(LGQ:Receivestring2)
      					LOC:ByteCounter2 = 0
      				.  
      				LGQ:Receivestring1 = CLIP(LGQ:Receivestring1) & LOC:TempChar             ! see note 2
      				LOC:ByteCounter2 = LOC:ByteCounter2 + 1
      			ELSE
      				! there are no more characters waiting so break out of the loop.
      				BREAK                       
      			.
      		.
      	END
      
      	IF(LOC:GebruikKoord)
      		IF Loc:Stabiel=FALSE
      			?WeegButton{PROP:Color}=COLOR:Red
      			Loc:AanHetKoordGetrokken=FALSE
      			
      			! Buffer leeglezen
      			IF LOC:PortID_Koord >= 0
      				LOOP 
      					LOC:Result = ReadPort(LOC:PortID_Koord, LOC:TempChar, 1)
      					IF LOC:Result <= 0 THEN BREAK.
      				.
      			.
      		ELSE
      			IF Loc:AanHetKoordGetrokken=FALSE
      				?WeegButton{PROP:Color}=COLOR:Yellow 
      				Loc:SendString='$016BB'
      				Loc:SendString = CLIP(Loc:SendString) & CHR(13)
      				if WritePort(LOC:PortID_Koord,Loc:SendString, 0). 
      
      				IF LOC:PortID_Koord >= 0
      					! Voor test zaken nu opvragen of er aan de schakelaar wordt getrokken
      					LOOP
      						! Get 1 character if it's waiting
      						LOC:Result = ReadPort(LOC:PortID_Koord, LOC:TempChar, 1)
      						
      						IF LOC:Result > 0			! there were charaters waiting
      							IF LOC:ByteCounter1 >= 50 or VAL(LOC:TempChar)= 13 then      ! 20 posities of een enter
      								IF INSTRING('!000E0056',Loc:ReceiveString2,1,1) THEN 
      									Loc:AanHetKoordGetrokken=TRUE
      									DO WeegButton
      									
      									! Buffer leeglezen
      									LOOP 
      										LOC:Result = ReadPort(LOC:PortID_Koord, LOC:TempChar, 1)
      										IF LOC:Result <= 0 THEN BREAK.
      									.
      									
      									BREAK
      								.
      								Clear(Loc:ReceiveString2)
      								LOC:ByteCounter1 = 0
      								Cycle
      							END	
      							 Loc:ReceiveString2 = CLIP(Loc:ReceiveString2) & LOC:TempChar             
      							   LOC:ByteCounter1 += 1
      						ELSE
      							! There are no more characters waiting so break out of the loop.
      							BREAK                       
      						.
      					.
      				END
      			ELSE
      				! Buffer leeglezen
      				IF LOC:PortID_Koord >= 0
      					LOOP 
      						LOC:Result = ReadPort(LOC:PortID_Koord, LOC:TempChar, 1)
      						IF LOC:Result <= 0 THEN BREAK.
      					.
      				.
      				
      				?WeegButton{PROP:Color}=COLOR:Lime
      			END	
      		END
      	ELSE
      		IF Loc:Stabiel=FALSE
      			?WeegButton{PROP:Color}=COLOR:Red
      		ELSE
      			?WeegButton{PROP:Color}=COLOR:Yellow 
      		END
      	END
      ELSE
      	LOC:Gewicht = 50
      END
      !IF (LOC:Loggen = 1)
      !	 Add(Loc:GewichtQ)						! Uitgeschakeld want dit heb ik alleen voor de test nodig
      !END
      
      Display(?Loc:Gewicht)
      DISPLAY
      
      
      
      0{Prop:Timer}=10
    END
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue

WeegClass.Stabiel   PROCEDURE(LONG PRM:Gewicht)

CODE
	IF PRM:Gewicht<=0 THEN RETURN FALSE.
	WeegClass.SavGewicht[10]=WeegClass.SavGewicht[9]
	WeegClass.SavGewicht[9]=WeegClass.SavGewicht[8]
	WeegClass.SavGewicht[8]=WeegClass.SavGewicht[7]
	WeegClass.SavGewicht[7]=WeegClass.SavGewicht[6]
	WeegClass.SavGewicht[6]=WeegClass.SavGewicht[5]
	WeegClass.SavGewicht[5]=WeegClass.SavGewicht[4]
	WeegClass.SavGewicht[4]=WeegClass.SavGewicht[3]
	WeegClass.SavGewicht[3]=WeegClass.SavGewicht[2]
	WeegClass.SavGewicht[2]=WeegClass.SavGewicht[1]
	WeegClass.SavGewicht[1]=PRM:GEWICHT
	DISPLAY
	Loop i#=1 to Loc:AantalPogingen				! omdat als ik er 10 vraag het te lang duurt (was hierna 5)
		IF NOT WeegClass.SavGewicht[i#]=PRM:GEWICHT
			RETURN FALSE
		END
	End
	RETURN TRUE

Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window

!!! <summary>
!!! Generated from procedure template - Window
!!! Window
!!! </summary>
UpdateUitslagMutatieWegingQueue PROCEDURE 

LOC:CancelButton     BYTE                                  ! 
FDCB6::View:FileDropCombo VIEW(PalletSoort)
                       PROJECT(PalSrt:PalletOmschrijving)
                       PROJECT(PalSrt:Tarra)
                       PROJECT(PalSrt:PalletSoortID)
                     END
Queue:FileDropCombo:1 QUEUE                           !
PalSrt:PalletOmschrijving LIKE(PalSrt:PalletOmschrijving) !List box control field - type derived from field
PalSrt:Tarra           LIKE(PalSrt:Tarra)             !List box control field - type derived from field
PalSrt:PalletSoortID   LIKE(PalSrt:PalletSoortID)     !Primary key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
LocEnableEnterByTab  BYTE(1)                               !Used by the ENTER Instead of Tab template
EnterByTabManager    EnterByTabClass
QuickWindow          WINDOW('Weging'),AT(,,193,74),FONT('MS Sans Serif',8,,FONT:regular,CHARSET:DEFAULT),DOUBLE, |
  CENTER,GRAY,IMM,HLP('UpdateUitslagMutatieWegingQueue'),SYSTEM
                       PROMPT('Bruto-gewicht (KG):'),AT(6,7),USE(?WGQ:BrutoGewichtKG:Prompt)
                       ENTRY(@n14`2),AT(83,6,60,10),USE(WGQ:BrutoGewichtKG),RIGHT
                       PROMPT('Palletsoort:'),AT(6,22),USE(?PROMPT1)
                       COMBO(@s10),AT(83,22,97,10),USE(PalSrt:PalletOmschrijving),DROP(5),FORMAT('49L(2)|M~Pal' & |
  'letsoort~C(0)@s10@32R(2)|M~Tarra (KG)~C(0)@n8`2@'),FROM(Queue:FileDropCombo:1),IMM
                       BUTTON('&OK'),AT(79,54,49,14),USE(?Ok),LEFT,ICON('WAOK.ICO'),FLAT,MSG('Accept operation'), |
  TIP('Accept Operation')
                       BUTTON('&Cancel'),AT(132,54,49,14),USE(?Cancel),LEFT,ICON('WACANCEL.ICO'),FLAT,MSG('Cancel Operation'), |
  TIP('Cancel Operation')
                       STRING(@D6-B),AT(83,36),USE(WGQ:Datum)
                       STRING(@t1B),AT(131,36),USE(WGQ:Tijd)
                       PROMPT('Tijdstip weging:'),AT(6,36),USE(?PROMPT2)
                     END

    omit('***',WE::CantCloseNowSetHereDone=1)  !Getting Nested omit compile error, then uncheck the "Check for duplicate CantCloseNowSetHere variable declaration" in the WinEvent local template
WE::CantCloseNowSetHereDone equate(1)
WE::CantCloseNowSetHere     long
    !***
ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED
TakeEvent              PROCEDURE(),BYTE,PROC,DERIVED
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
Resizer              CLASS(WindowResizeClass)
Init                   PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)
                     END

FDCB6                CLASS(FileDropComboClass)             ! File drop combo manager
Q                      &Queue:FileDropCombo:1         !Reference to browse queue type
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

ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('UpdateUitslagMutatieWegingQueue')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?WGQ:BrutoGewichtKG:Prompt
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  IF SELF.Request = SelectRecord
     SELF.AddItem(?Ok,RequestCancelled)                    ! Add the close control to the window manger
  ELSE
     SELF.AddItem(?Ok,RequestCompleted)                    ! Add the close control to the window manger
  END
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  Relate:PalletSoort.Open                                  ! File PalletSoort used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  CLEAR(PalSrt:Record)
  PalSrt:PalletSoortID = WGQ:PalletsoortID
  Access:PalletSoort.TryFetch(PalSrt:PK_PalletSoort)
  
  LOC:CancelButton = 0
  SELF.Open(QuickWindow)                                   ! Open window
  WinAlertMouseZoom()
  Do DefineListboxStyle
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('UpdateUitslagMutatieWegingQueue',QuickWindow) ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  FDCB6.Init(PalSrt:PalletOmschrijving,?PalSrt:PalletOmschrijving,Queue:FileDropCombo:1.ViewPosition,FDCB6::View:FileDropCombo,Queue:FileDropCombo:1,Relate:PalletSoort,ThisWindow,GlobalErrors,0,1,0)
  FDCB6.Q &= Queue:FileDropCombo:1
  FDCB6.AddSortOrder(PalSrt:FK_PalletSoort)
  FDCB6.AddField(PalSrt:PalletOmschrijving,FDCB6.Q.PalSrt:PalletOmschrijving) !List box control field - type derived from field
  FDCB6.AddField(PalSrt:Tarra,FDCB6.Q.PalSrt:Tarra) !List box control field - type derived from field
  FDCB6.AddField(PalSrt:PalletSoortID,FDCB6.Q.PalSrt:PalletSoortID) !Primary key field - type derived from field
  FDCB6.AddUpdateField(PalSrt:PalletSoortID,WGQ:PalletsoortID)
  FDCB6.AddUpdateField(PalSrt:PalletOmschrijving,WGQ:Palletsoort)
  ThisWindow.AddItem(FDCB6.WindowComponent)
  FDCB6.DefaultFill = 0
  SELF.SetAlerts()
  EnterByTabManager.ExcludeControl(?Cancel)
  EnterByTabManager.ExcludeControl(?Ok)
  EnterByTabManager.Init(False)
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:PalletSoort.Close
  END
  IF SELF.Opened
    INIMgr.Update('UpdateUitslagMutatieWegingQueue',QuickWindow) ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
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
    OF ?Cancel
      LOC:CancelButton = 1
    END
  IF LOC:CancelButton = 0
  	IF WGQ:PalletsoortID <> 0 THEN
  		CLEAR(PalSrt:Record)
  		PalSrt:PalletSoortID = WGQ:PalletsoortID
  		Access:PalletSoort.TryFetch(PalSrt:PK_PalletSoort)
  		
  		WGQ:NettoGewichtKG = WGQ:BrutoGewichtKG - PalSrt:Tarra
  		
  		IF WGQ:NettoGewichtKG <= 0 THEN RETURN RequestCancelled.
  	ELSE 
  		Return RequestCancelled
  	.
  .
  ReturnValue = PARENT.TakeAccepted()
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


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window

!!! <summary>
!!! Generated from procedure template - Window
!!! </summary>
WindowInslag PROCEDURE 

Loc:FirmaNaam        CSTRING(51)                           ! 
Loc:ArtikelOmschrijving CSTRING(51)                        ! 
Loc:VerpakkingsOmschrijving CSTRING(51)                    ! 
LOC:CelID1           LONG                                  ! 
LOC:CelLocatieID1    LONG                                  ! 
LOC:CelID2           LONG                                  ! 
LOC:CelLocatieID2    LONG                                  ! 
LOC:CelID3           LONG                                  ! 
LOC:CelLocatieID3    LONG                                  ! 
LOC:CelID4           LONG                                  ! 
LOC:CelLocatieID4    LONG                                  ! 
LOC:KG1              DECIMAL(10,2)                         ! 
LOC:KG2              DECIMAL(10,2)                         ! 
LOC:KG3              DECIMAL(10,2)                         ! 
LOC:KG4              DECIMAL(10,2)                         ! 
LOC:KGTeller         DECIMAL(10,2)                         ! 
LOC:Pallets1         LONG                                  ! 
LOC:Pallets2         LONG                                  ! 
LOC:Pallets3         LONG                                  ! 
LOC:Pallets4         LONG                                  ! 
LOC:PalletsTeller    LONG                                  ! 
ActionMessage        CSTRING(40)                           ! 
LOC:KGBalans         STRING(20)                            ! 
LOC:PalletsBalans    STRING(20)                            ! 
LOC:NegatieveVoorraad BYTE                                 ! 
LOC:SavedPartijBuffer USHORT                               ! 
LOC:SavedPartijFile  USHORT                                ! 
FDCB1::View:FileDropCombo VIEW(Relatie)
                       PROJECT(Rel:FirmaNaam)
                       PROJECT(Rel:Type)
                     END
FDCB3::View:FileDropCombo VIEW(Verpakking)
                       PROJECT(Ver:VerpakkingOmschrijving)
                     END
FDCB5::View:FileDropCombo VIEW(Cel)
                       PROJECT(CEL:CelOms)
                       PROJECT(CEL:CelID)
                     END
FDCB8::View:FileDropCombo VIEW(ACel)
                       PROJECT(ACel:CelOms)
                       PROJECT(ACel:CelID)
                     END
FDCB9::View:FileDropCombo VIEW(AACel)
                       PROJECT(AACel:CelOms)
                       PROJECT(AACel:CelID)
                     END
FDCB7::View:FileDropCombo VIEW(AAACel)
                       PROJECT(AAACel:CelOms)
                       PROJECT(AAACel:CelID)
                     END
FDCB10::View:FileDropCombo VIEW(ViewArtikel)
                       PROJECT(Art:ArtikelOms)
                     END
FDCB11::View:FileDropCombo VIEW(CelLocatie)
                       PROJECT(CL:Locatienaam)
                       PROJECT(CL:CelLocatieID)
                     END
FDCB12::View:FileDropCombo VIEW(ACelLocatie)
                       PROJECT(ACL:Locatienaam)
                       PROJECT(ACL:CelLocatieID)
                     END
FDCB13::View:FileDropCombo VIEW(AACelLocatie)
                       PROJECT(AACL:Locatienaam)
                       PROJECT(AACL:CelLocatieID)
                     END
FDCB14::View:FileDropCombo VIEW(AAAACelLocatie)
                       PROJECT(AAAACL:Locatienaam)
                       PROJECT(AAAACL:CelLocatieID)
                     END
Queue:FileDropCombo  QUEUE                            !
Rel:FirmaNaam          LIKE(Rel:FirmaNaam)            !List box control field - type derived from field
Rel:Type               LIKE(Rel:Type)                 !Browse hot field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
Queue:FileDropCombo:2 QUEUE                           !
Ver:VerpakkingOmschrijving LIKE(Ver:VerpakkingOmschrijving) !List box control field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
Queue:FileDropCombo:3 QUEUE                           !
CEL:CelOms             LIKE(CEL:CelOms)               !List box control field - type derived from field
CEL:CelID              LIKE(CEL:CelID)                !Primary key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
Queue:FileDropCombo:4 QUEUE                           !
ACel:CelOms            LIKE(ACel:CelOms)              !List box control field - type derived from field
ACel:CelID             LIKE(ACel:CelID)               !Primary key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
Queue:FileDropCombo:5 QUEUE                           !
AACel:CelOms           LIKE(AACel:CelOms)             !List box control field - type derived from field
AACel:CelID            LIKE(AACel:CelID)              !Primary key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
Queue:FileDropCombo:6 QUEUE                           !
AAACel:CelOms          LIKE(AAACel:CelOms)            !List box control field - type derived from field
AAACel:CelID           LIKE(AAACel:CelID)             !Primary key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
Queue:FileDropCombo:7 QUEUE                           !
Art:ArtikelOms         LIKE(Art:ArtikelOms)           !List box control field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
Queue:FileDropCombo:1 QUEUE                           !
CL:Locatienaam         LIKE(CL:Locatienaam)           !List box control field - type derived from field
CL:CelLocatieID        LIKE(CL:CelLocatieID)          !Primary key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
Queue:FileDropCombo:8 QUEUE                           !
ACL:Locatienaam        LIKE(ACL:Locatienaam)          !List box control field - type derived from field
ACL:CelLocatieID       LIKE(ACL:CelLocatieID)         !Primary key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
Queue:FileDropCombo:9 QUEUE                           !
AACL:Locatienaam       LIKE(AACL:Locatienaam)         !List box control field - type derived from field
AACL:CelLocatieID      LIKE(AACL:CelLocatieID)        !Primary key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
Queue:FileDropCombo:10 QUEUE                          !
AAAACL:Locatienaam     LIKE(AAAACL:Locatienaam)       !List box control field - type derived from field
AAAACL:CelLocatieID    LIKE(AAAACL:CelLocatieID)      !Primary key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
LocEnableEnterByTab  BYTE(1)                               !Used by the ENTER Instead of Tab template
EnterByTabManager    EnterByTabClass
Window               WINDOW('Inslaan Partij'),AT(,,493,323),FONT('MS Sans Serif',8),ICON('WAOK.ICO'),GRAY,MDI,SYSTEM,IMM
                       PROMPT('Referentie:'),AT(7,66),USE(?Par:Referentie:Prompt)
                       ENTRY(@s50),AT(76,65,205,10),USE(Par:Referentie)
                       PROMPT('Extern Partijnr:'),AT(7,82),USE(?Par:ExternPartijnr:Prompt),RIGHT
                       ENTRY(@s20),AT(76,81,83,10),USE(Par:ExternPartijnr)
                       PROMPT('Hoeveelheid (kg)'),AT(174,95),USE(?Loc:Hoeveelheid:Prompt),RIGHT
                       ENTRY(@n12_`2),AT(170,108,60,10),USE(Par:KG),RIGHT(2),REQ
                       PROMPT('Aantal Pallets:'),AT(246,95),USE(?Loc:AantalPallets:Prompt),RIGHT
                       ENTRY(@n14.),AT(238,108,60,10),USE(Par:Pallets),RIGHT(2),REQ
                       STRING('Totaal:'),AT(75,106),USE(?STRING1)
                       COMBO(@s50),AT(75,127,84,10),USE(CEL:CelOms),DROP(15),FORMAT('200L(2)~Cel~@s50@'),FROM(Queue:FileDropCombo:3), |
  IMM,REQ
                       COMBO(@s50),AT(75,140,,10),USE(CL:Locatienaam),VSCROLL,DROP(5),FORMAT('200L(2)|M~Locati' & |
  'enaam~L(0)@s50@'),FROM(Queue:FileDropCombo:1),IMM
                       ENTRY(@n12_`2),AT(170,127,60,10),USE(LOC:KG1),RIGHT(2)
                       ENTRY(@n14.),AT(238,127,60,10),USE(LOC:Pallets1),RIGHT(2)
                       COMBO(@s50),AT(75,153,84,10),USE(ACel:CelOms),DROP(15),FORMAT('200L(2)|M~Cel~@s50@'),FROM(Queue:FileDropCombo:4), |
  IMM
                       COMBO(@s50),AT(75,164,,10),USE(ACL:Locatienaam),VSCROLL,DROP(5),FORMAT('200L(2)|M~Locat' & |
  'ienaam~L(0)@s50@'),FROM(Queue:FileDropCombo:8),IMM
                       ENTRY(@n12_`2),AT(170,153,60,10),USE(LOC:KG2),RIGHT(2)
                       ENTRY(@n14.),AT(238,153,60,10),USE(LOC:Pallets2),RIGHT(2)
                       COMBO(@s50),AT(75,177,84,10),USE(AACel:CelOms),DROP(15),FORMAT('200L(2)|M~Cel~@s50@'),FROM(Queue:FileDropCombo:5), |
  IMM
                       COMBO(@s50),AT(75,189,,10),USE(AACL:Locatienaam),VSCROLL,DROP(5),FORMAT('200L(2)|M~Loca' & |
  'tienaam~@s50@'),FROM(Queue:FileDropCombo:9),IMM
                       ENTRY(@n12_`2),AT(170,177,60,10),USE(LOC:KG3),RIGHT(2)
                       ENTRY(@n14.),AT(238,177,60,10),USE(LOC:Pallets3),RIGHT(2)
                       COMBO(@s20),AT(75,201,84,10),USE(AAACel:CelOms),DROP(15),FORMAT('200L(2)|M~Cel~@s50@'),FROM(Queue:FileDropCombo:6), |
  IMM
                       COMBO(@s50),AT(75,214,,10),USE(AAAACL:Locatienaam),VSCROLL,DROP(5),FORMAT('200L(2)|M~Lo' & |
  'catienaam~L(0)@s50@'),FROM(Queue:FileDropCombo:10),IMM
                       ENTRY(@n12_`2),AT(170,201,60,10),USE(LOC:KG4),RIGHT(2)
                       ENTRY(@n14.),AT(238,201,60,10),USE(LOC:Pallets4),RIGHT(2)
                       PROMPT('Aanmaakdatum:'),AT(7,6),USE(?PROMPT4)
                       BUTTON('OK'),AT(193,302,47,14),USE(?OKButton),LEFT,ICON('WAOK.ICO'),DEFAULT,REQ
                       BUTTON('&Annuleer'),AT(243,302,52,14),USE(?CancelButton),LEFT,ICON('WACancel.ico'),STD(STD:Close)
                       PROMPT('Aanmaak Datum DATE:'),AT(86,7,0,0),USE(?Par:AanmaakDatum_DATE:Prompt)
                       ENTRY(@d6-),AT(76,6,53,9),USE(Par:AanmaakDatum_DATE),RIGHT
                       PROMPT('Aanmaak Datum TIME:'),AT(201,5,0,0),USE(?Par:AanmaakDatum_TIME:Prompt)
                       ENTRY(@t7),AT(141,6,31,9),USE(Par:AanmaakDatum_TIME),RIGHT
                       COMBO(@s50),AT(76,50,205,10),USE(Rel:FirmaNaam),DROP(25),FORMAT('200L(2)~Firmanaam~@s50@'), |
  FROM(Queue:FileDropCombo),IMM,REQ
                       COMBO(@s50),AT(76,35,205,10),USE(Ver:VerpakkingOmschrijving),DROP(25),FORMAT('200L(2)~Ve' & |
  'rpakking~@s50@'),FROM(Queue:FileDropCombo:2),IMM,REQ
                       COMBO(@s60),AT(76,20,205,10),USE(Art:ArtikelOms,,?Art:ArtikelOms:2),DROP(5),FORMAT('240L(2)|M~' & |
  'Artikel Oms~L(0)@s60@'),FROM(Queue:FileDropCombo:7),IMM
                       PROMPT('Leverancier:<0DH,0AH>'),AT(7,50,65),USE(?PROMPT1)
                       PROMPT('Verpakking:'),AT(7,34),USE(?PROMPT3)
                       PROMPT('Artikel:'),AT(7,21),USE(?PROMPT2)
                       STRING('BalansKG'),AT(167,225,61),USE(?KGBalans),RIGHT
                       STRING('BalansPallets'),AT(236,225,61),USE(?PalletsBalans),RIGHT
                       STRING(@N_10),AT(255,5),USE(Par:PartijID)
                       PROMPT('Partij-nummer:'),AT(206,5),USE(?PROMPT5)
                       GROUP('Kwaliteit'),AT(308,6,176,311),USE(?GROUP1),BOXED
                         CHECK('Is transportmiddel schoon?'),AT(313,17),USE(Par:InslagQATransportmiddelSchoon),VALUE('1', |
  '0')
                         CHECK('Is verpakking schoon en gesloten?'),AT(313,30),USE(Par:InslagQAVerpakkingSchoonGesloten), |
  VALUE('1','0')
                         CHECK('Identificatie merken aanwezig op verpakkingen?'),AT(313,42,167),USE(Par:InslagQAIdentificatieMerkenVerpakking), |
  VALUE('1','0')
                         CHECK('Is geur kleur producteigen?'),AT(313,54),USE(Par:InslagQAIsGeurKleurProductEigen)
                         CHECK('Geen glasbreuk?'),AT(313,66),USE(Par:InslagQAGeenGlasbreuk)
                         PROMPT('Behandeld door:'),AT(315,79),USE(?PROMPT6)
                         ENTRY(@s40),AT(371,79,108,10),USE(Par:InslagQAUitgevoerdDoor)
                         PROMPT('Gemeten temperaturen:'),AT(314,93),USE(?Par:InslagQATemperatuur1:Prompt)
                         ENTRY(@s20),AT(315,108,50,10),USE(Par:InslagQATemperatuur1),LEFT(2)
                         ENTRY(@s20),AT(371,108,50,10),USE(Par:InslagQATemperatuur2)
                         ENTRY(@s20),AT(430,108,50,10),USE(Par:InslagQATemperatuur3)
                         PROMPT('Temperatuur Vervoermiddel:'),AT(314,123),USE(?Par:InslagQATemperatuurVervoermiddel:Prompt)
                         ENTRY(@s20),AT(407,123,60,10),USE(Par:InslagQATemperatuurVervoermiddel)
                         PROMPT('Afwijking:'),AT(314,137),USE(?Par:InslagQAActieAfwijkingen:Prompt)
                         TEXT,AT(315,148,165,29),USE(Par:InslagQAActieAfwijkingen),HVSCROLL
                         TEXT,AT(315,189,165,29),USE(Par:CorrectieveMaatregel,,?Par:CorrectieveMaatregel:2),HVSCROLL
                         PROMPT('Corrigerende Maatregel:'),AT(314,218),USE(?Par:CorrigerendeMaatregel:Prompt)
                         PROMPT('Afgehandeld:'),AT(314,270),USE(?Par:Afgehandeld:Prompt)
                         TEXT,AT(315,231,165,34),USE(Par:CorrigerendeMaatregel,,?Par:CorrigerendeMaatregel:2),HVSCROLL
                         TEXT,AT(315,280,165,36),USE(Par:Afgehandeld,,?Par:Afgehandeld:2),HVSCROLL
                         PROMPT('CorrectieveMaatregel'),AT(314,178),USE(?Par:CorrectieveMaatregel:Prompt)
                       END
                     END

    omit('***',WE::CantCloseNowSetHereDone=1)  !Getting Nested omit compile error, then uncheck the "Check for duplicate CantCloseNowSetHere variable declaration" in the WinEvent local template
WE::CantCloseNowSetHereDone equate(1)
WE::CantCloseNowSetHere     long
    !***
ThisWindow           CLASS(WindowManager)
Ask                    PROCEDURE(),DERIVED
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
PrimeUpdate            PROCEDURE(),BYTE,PROC,DERIVED
Run                    PROCEDURE(),BYTE,PROC,DERIVED
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED
TakeCompleted          PROCEDURE(),BYTE,PROC,DERIVED
TakeEvent              PROCEDURE(),BYTE,PROC,DERIVED
TakeFieldEvent         PROCEDURE(),BYTE,PROC,DERIVED
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED
VerwijderDubbeleInslag PROCEDURE(Par:Record PartijRecord, LONG CelID) ! New method added to this class instance
                     END

Toolbar              ToolbarClass
FDCB1                CLASS(FileDropComboClass)             ! File drop combo manager
Q                      &Queue:FileDropCombo           !Reference to browse queue type
                     END

FDCB3                CLASS(FileDropComboClass)             ! File drop combo manager
Q                      &Queue:FileDropCombo:2         !Reference to browse queue type
                     END

FDCB5                CLASS(FileDropComboClass)             ! File drop combo manager
Q                      &Queue:FileDropCombo:3         !Reference to browse queue type
                     END

FDCB8                CLASS(FileDropComboClass)             ! File drop combo manager
Q                      &Queue:FileDropCombo:4         !Reference to browse queue type
                     END

FDCB9                CLASS(FileDropComboClass)             ! File drop combo manager
Q                      &Queue:FileDropCombo:5         !Reference to browse queue type
                     END

FDCB7                CLASS(FileDropComboClass)             ! File drop combo manager
Q                      &Queue:FileDropCombo:6         !Reference to browse queue type
                     END

FDCB10               CLASS(FileDropComboClass)             ! File drop combo manager
Q                      &Queue:FileDropCombo:7         !Reference to browse queue type
                     END

FDCB11               CLASS(FileDropComboClass)             ! File drop combo manager
Q                      &Queue:FileDropCombo:1         !Reference to browse queue type
                     END

FDCB12               CLASS(FileDropComboClass)             ! File drop combo manager
Q                      &Queue:FileDropCombo:8         !Reference to browse queue type
                     END

FDCB13               CLASS(FileDropComboClass)             ! File drop combo manager
Q                      &Queue:FileDropCombo:9         !Reference to browse queue type
                     END

FDCB14               CLASS(FileDropComboClass)             ! File drop combo manager
Q                      &Queue:FileDropCombo:10        !Reference to browse queue type
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
ControleerVoorraad  ROUTINE
	LOC:NegatieveVoorraad = false
	Clear(Mut:Record)
	Mut:PartijID = Par:PartijID
	SET(Mut:Mutatie_FK01, Mut:Mutatie_FK01)
	LOOP
		IF NOT(Access:Mutatie.Next() = Level:Benign) THEN BREAK.
		IF NOT(Mut:PartijID = Par:PartijID) THEN BREAK.
		
		IF Mut:SoortMutatie = 'IN' THEN
			! Deze mutatie wordt verwijderd, controleer wat het gevolg is van de
			! inslag-wijziging
			
			LOC:KGTeller = 0
			LOC:PalletsTeller = 0
			
			IF Par:ArtikelID <> Mut:ArtikelID
				db.DebugOut('Ongelijk artikel:'&Par:ArtikelID & ',' & Mut:ArtikelID)
				
				! Ander artikel, inslag-wijzigingen zijn dus niet relevant
				CLEAR(VVPar:Record)
				VVPar:ArtikelID = Mut:ArtikelID
				VVPar:PartijID = Mut:PartijID
				VVPar:CelID = Mut:CelID
				IF (Access:ViewVoorraadPartij.TryFetch(VVPar:ArtikelID_PartijID_CelID_K) = Level:Benign)
					IF VVPar:VoorraadKG < Mut:InslagKG !OR VVPar:VoorraadPallets < Mut:InslagPallet THEN
						DO MessageNietMogelijk
						BREAK
					.
				ELSE
					DO MessageNietMogelijk
					BREAK
				.
			ELSE
				! Zelfde artikel, inslag-wijzigingen zijn dus relevant
				IF LOC:CelID1 = Mut:CelID
					LOC:KGTeller+=LOC:KG1
					LOC:PalletsTeller+=LOC:Pallets1
				.
				
				IF LOC:CelID2 = Mut:CelID
					LOC:KGTeller+=LOC:KG2
					LOC:PalletsTeller+=LOC:Pallets2
				.

				IF LOC:CelID3 = Mut:CelID
					LOC:KGTeller+=LOC:KG3
					LOC:PalletsTeller+=LOC:Pallets3
				.

				IF LOC:CelID4 = Mut:CelID
					LOC:KGTeller+=LOC:KG4
					LOC:PalletsTeller+=LOC:Pallets4
				.
				
				db.DebugOut('Zelfde artikel:'&LOC:KGTeller&','&LOC:PalletsTeller)
				
				CLEAR(VVPar:Record)
				VVPar:ArtikelID = Mut:ArtikelID
				VVPar:PartijID = Mut:PartijID
				VVPar:CelID = Mut:CelID
				IF (Access:ViewVoorraadPartij.TryFetch(VVPar:ArtikelID_PartijID_CelID_K) = Level:Benign)
					IF VVPar:VoorraadKG + LOC:KGTeller < Mut:InslagKG !OR VVPar:VoorraadPallets + LOC:PalletsTeller < Mut:InslagPallet THEN
						LOC:NegatieveVoorraad = TRUE
						DO MessageNietMogelijk
						BREAK
					.
				ELSE
					IF LOC:KGTeller < Mut:InslagKG !OR LOC:PalletsTeller < Mut:InslagPallet THEN
						DO MessageNietMogelijk
						BREAK
					.
				.
			.
		END
	END
	
	EXIT
MessageNietMogelijk ROUTINE
	Cel:CelID = Mut:CelID
	Access:Cel.TryFetch(Cel:CEL_PK)
	MESSAGE('Inslagwijziging niet mogelijk, resulteert in negatieve voorraad (' & |
		CLIP(Format(VVPar:VoorraadKG, @n-14`2)) & '+' & | 
		CLIP(Format(LOC:KGTeller, @n-14`2)) & '-' & | 
		CLIP(Format(Mut:InslagKG, @n-14`2)) & '=' & | 
		CLIP(Format((VVPar:VoorraadKG + LOC:KGTeller) - Mut:InslagKG, @n-14`2)) & | 
		') in cel '& CLIP(CEL:CelOms) & ' voor deze partij.')
	LOC:NegatieveVoorraad = TRUE
	EXIT
MutatieToLokaal     ROUTINE
	! Vullen regels
	i# = 1
	Clear(Mut:Record)
	Mut:PartijID = Par:PartijID
	SET(Mut:Mutatie_FK01, Mut:Mutatie_FK01)
	LOOP
		IF NOT(Access:Mutatie.TryNext() = Level:Benign) THEN BREAK.
		IF NOT(Mut:PartijID = Par:PartijID) THEN BREAK.
		
		IF i# = 1
			CLEAR(APla:Record)
			APla:PlanningID = Mut:PlanningID
			Access:APlanning.TryFetch(APla:PK_Planning)
		.
		
		IF Mut:SoortMutatie = 'IN' THEN
			CASE i#
			OF 1
				LOC:CelID1 = Mut:CelID
				LOC:CelLocatieID1 = Mut:CelLocatieID
				LOC:KG1 = Mut:InslagKG
				LOC:Pallets1 = Mut:InslagPallet
			OF 2
				LOC:CelID2 = Mut:CelID
				LOC:CelLocatieID2 = Mut:CelLocatieID
				LOC:KG2 = Mut:InslagKG
				LOC:Pallets2 = Mut:InslagPallet
			OF 3
				LOC:CelID3 = Mut:CelID
				LOC:CelLocatieID3 = Mut:CelLocatieID
				LOC:KG3 = Mut:InslagKG
				LOC:Pallets3 = Mut:InslagPallet
			OF 4
				LOC:CelID4 = Mut:CelID
				LOC:CelLocatieID4 = Mut:CelLocatieID
				LOC:KG4 = Mut:InslagKG
				LOC:Pallets4 = Mut:InslagPallet
			ELSE
				MESSAGE('Teveel inslagen bij partij')
			.
			i# = i# + 1
		END
	END
	EXIT
WisMutaties         ROUTINE
	! Vullen regels
	Clear(Mut:Record)
	Mut:PartijID = Par:PartijID
	SET(Mut:Mutatie_FK01, Mut:Mutatie_FK01)
	LOOP
		IF NOT(Access:Mutatie.Next() = Level:Benign) THEN BREAK.
		IF NOT(Mut:PartijID = Par:PartijID) THEN BREAK.
		
		IF Mut:SoortMutatie = 'IN' THEN
			db.DebugOut('Wis mutatie ' & Mut:MutatieID)			
			Access:Mutatie.DeleteRecord(false)
		END
	END
	
	EXIT
BerekenTotaal       ROUTINE
	IF Par:KG = (LOC:KG1+LOC:KG2+LOC:KG3+LOC:KG4)
		LOC:KGBalans = 'Klopt'
	ELSE
		LOC:KGBalans = format(Par:KG - (LOC:KG1+LOC:KG2+LOC:KG3+LOC:KG4), @n-10`2)
	.
	
	IF Par:Pallets = (LOC:Pallets1+LOC:Pallets2+LOC:Pallets3+LOC:Pallets4)
		LOC:PalletsBalans = 'Klopt'
	ELSE
		LOC:PalletsBalans = format(Par:Pallets - (LOC:Pallets1+LOC:Pallets2+LOC:Pallets3+LOC:Pallets4), @n-14.)
	.
	
	?KGBalans{Prop:Text}=LOC:KGBalans
	?PalletsBalans{Prop:Text}=LOC:PalletsBalans
	
	EXIT
LaadDropComboTables ROUTINE
	Clear(Art:Record)
	Art:ArtikelID = Par:ArtikelID
	Access:ViewArtikel.Fetch(Art:Artikel_PK)

	Clear(Ver:Record)
	Ver:VerpakkingID = Par:VerpakkingID
	Access:Verpakking.Fetch(Ver:Verpakking_PK)

	Clear(Rel:Record)
	Rel:RelatieID = Par:Leverancier
	Access:Relatie.Fetch(Rel:Relatie_PK)
	
	Clear(Cel:Record)
	CEL:CelID = LOC:CelID1
	Access:Cel.Fetch(Cel:Cel_PK)
	
	Clear(ACel:Record)
	ACEL:CelID = LOC:CelID2
	Access:ACel.Fetch(ACel:Cel_PK)
	
	Clear(AACel:Record)
	AACEL:CelID = LOC:CelID3
	Access:AACel.Fetch(AACel:Cel_PK)

	Clear(AAAACel:Record)
	AAAACEL:CelID = LOC:CelID4
	Access:AAAACel.Fetch(AAAACel:Cel_PK)

	CLEAR(CL:Record)
	CL:CelLocatieID = LOC:CelLocatieID1
	Access:CelLocatie.Fetch(CL:PK_CelLocatie)
	IF CL:CelID <> LOC:CelID1 THEN CLEAR(CL:Record).
	
	CLEAR(ACL:Record)
	ACL:CelLocatieID = LOC:CelLocatieID2
	Access:ACelLocatie.Fetch(ACL:PK_CelLocatie)
	IF ACL:CelID <> LOC:CelID2 THEN CLEAR(ACL:Record).
	
	CLEAR(AACL:Record)
	AACL:CelLocatieID = LOC:CelLocatieID3
	Access:AACelLocatie.Fetch(AACL:PK_CelLocatie)
	IF AACL:CelID <> LOC:CelID3 THEN CLEAR(AACL:Record).
	
	CLEAR(AAAACL:Record)
	AAAACL:CelLocatieID = LOC:CelLocatieID4
	Access:AAAACelLocatie.Fetch(AAAACL:PK_CelLocatie)
	IF AAAACL:CelID <> LOC:CelID4 THEN CLEAR(AAAACL:Record).
	
	EXIT
OphalenTemperaturen ROUTINE
    ! Temperatuur
    db.debugout('InslagTemp:' & Par:InslagQATemperatuur1 & ',' & Par:InslagQATemperatuur2& ',' & Par:InslagQATemperatuur3 & Par:InkoopID)
    IF (CLIP(Par:InslagQATemperatuur1) = '' OR CLIP(Par:InslagQATemperatuur1) = '-18')  AND CLIP(Par:InslagQATemperatuur2) = '' AND CLIP(Par:InslagQATemperatuur3) = '' THEN
        ! Inkoop ophalen gelukt
        CLEAR(APar:Record)
        APar:InkoopID = Par:InkoopID
        SET(APar:Partij_FK03, APar:Partij_FK03)
        LOOP UNTIL Access:APartij.Next()
            IF APar:InkoopID <> Par:InkoopID THEN BREAK.
            IF APar:PartijID = Par:PartijID THEN CYCLE.
            
            IF CLIP(APar:InslagQATemperatuur1) <> '' OR CLIP(APar:InslagQATemperatuur2) <> '' OR CLIP(APar:InslagQATemperatuur3) <> '' THEN
                Par:InslagQATemperatuur1 = APar:InslagQATemperatuur1
                Par:InslagQATemperatuur2 = APar:InslagQATemperatuur2
                Par:InslagQATemperatuur3 = APar:InslagQATemperatuur3
                EXIT
            END
        END
    END

ThisWindow.Ask PROCEDURE

  CODE
  CASE SELF.Request                                        ! Configure the action message text
  OF ViewRecord
    ActionMessage = 'View Record'
  OF InsertRecord
    ActionMessage = 'Record will be Added'
  OF ChangeRecord
    ActionMessage = 'Record will be Changed'
  END
  PARENT.Ask


ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('WindowInslag')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Par:Referentie:Prompt
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddUpdateFile(Access:Partij)
  Relate:AAAACelLocatie.Open                               ! File AAAACelLocatie used by this procedure, so make sure it's RelationManager is open
  Relate:AAACel.Open                                       ! File AAACel used by this procedure, so make sure it's RelationManager is open
  Relate:AAACelLocatie.Open                                ! File AAACelLocatie used by this procedure, so make sure it's RelationManager is open
  Relate:AACel.Open                                        ! File AACel used by this procedure, so make sure it's RelationManager is open
  Relate:AACelLocatie.Open                                 ! File AACelLocatie used by this procedure, so make sure it's RelationManager is open
  Relate:ACel.Open                                         ! File ACel used by this procedure, so make sure it's RelationManager is open
  Relate:ACelLocatie.Open                                  ! File ACelLocatie used by this procedure, so make sure it's RelationManager is open
  Relate:AMutatie.Open                                     ! File AMutatie used by this procedure, so make sure it's RelationManager is open
  Relate:APartij.Open                                      ! File APartij used by this procedure, so make sure it's RelationManager is open
  Relate:APlanning.Open                                    ! File APlanning used by this procedure, so make sure it's RelationManager is open
  Relate:Cel.SetOpenRelated()
  Relate:Cel.Open                                          ! File Cel used by this procedure, so make sure it's RelationManager is open
  Relate:DubbeleInslagMutaties.Open                        ! File DubbeleInslagMutaties used by this procedure, so make sure it's RelationManager is open
  Relate:Inkoop.SetOpenRelated()
  Relate:Inkoop.Open                                       ! File Inkoop used by this procedure, so make sure it's RelationManager is open
  Relate:Mutatie.Open                                      ! File Mutatie used by this procedure, so make sure it's RelationManager is open
  Relate:Partij.Open                                       ! File Partij used by this procedure, so make sure it's RelationManager is open
  Relate:Verpakking.Open                                   ! File Verpakking used by this procedure, so make sure it's RelationManager is open
  Relate:ViewArtikel.Open                                  ! File ViewArtikel used by this procedure, so make sure it's RelationManager is open
  Relate:ViewVoorraadPartij.Open                           ! File ViewVoorraadPartij used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Primary &= Relate:Partij
  IF SELF.Request = ViewRecord AND NOT SELF.BatchProcessing ! Setup actions for ViewOnly Mode
    SELF.InsertAction = Insert:None
    SELF.DeleteAction = Delete:None
    SELF.ChangeAction = Change:None
    SELF.CancelAction = Cancel:Cancel
    SELF.OkControl = 0
  ELSE
    SELF.ChangeAction = Change:Caller                      ! Changes allowed
    SELF.OkControl = ?OKButton
    IF SELF.PrimeUpdate() THEN RETURN Level:Notify.
  END
  db.DebugOut('WindowInslag ACTION: '& ThisWindow.Request)
  
  IF (ThisWindow.Request = InsertRecord)
  	Access:APlanning.TryFetch(APla:PK_Planning)
  	db.DebugOut('Partij-init: ' & APla:InkoopID & ', ' & APla:PlanningID)
  	
  	Access:Partij.PrimeRecord(false)
  
  	Par:ArtikelID = APla:ArtikelID
  	Par:KG	= APla:KG
  	Par:Pallets	= APla:Pallets
  	Par:VerpakkingID = APla:VerpakkingID
  	!Par:CelID = Pla:CelID
      
      Par:InslagQAIdentificatieMerkenVerpakking = 1
      Par:InslagQATransportmiddelSchoon = 1
      Par:InslagQAVerpakkingSchoonGesloten = 1
      Par:InslagQAIsGeurKleurProductEigen=1
      Par:InslagQAGeenGlasbreuk=1
      
  	Clear(Ink:Record)
  	Ink:InkoopID = APla:InkoopID
  	Access:Inkoop.Fetch(Ink:PK_Inkoop)
  	Par:Leverancier = Ink:Leverancier
  	
  	Par:InkoopID = APla:InkoopID
  	Par:InkoopPlanningID = APla:PlanningID
  
  	!Par:AanmaakDatum_DATE = TODAY()
  	!Par:AanmaakDatum_TIME = CLOCK()
  	
  	Par:AanmaakDatum_DATE = Ink:Planning_DATE
  	Par:AanmaakDatum_TIME = Ink:Planning_TIME
  	
  	LOC:CelID1 = APla:CelID
  	LOC:CelLocatieID1 = APla:CelLocatieID
  	
  	CLEAR(AAAACL:Record)
  	AAAACL:CelLocatieID = LOC:CelLocatieID1
  	Access:AAAACelLocatie.TryFetch(AAAACL:PK_CelLocatie)
  	IF LOC:CelID1 <> AAAACL:CelID THEN LOC:CelLocatieID1 = 0.
  	
  	LOC:KG1 = Par:KG
  	LOC:Pallets1 = Par:Pallets
  
  	LOC:CelID2 = 0
  	LOC:CelLocatieID2 = 0
  	LOC:KG2 = 0
  	LOC:Pallets2 = 0
  
  	LOC:CelID3 = 0
  	LOC:CelLocatieID3 = 0
  	LOC:KG3 = 0
  	LOC:Pallets3 = 0
  
  	LOC:CelID4 = 0
  	LOC:CelLocatieID4 = 0
  	LOC:KG4 = 0
  	LOC:Pallets4 = 0
  	
  	DO LaadDropComboTables
  ELSIF ThisWindow.Request = ChangeRecord OR ThisWindow.Request = ViewRecord
  	! APlanning wordt vanuit de mutatie opgehaald
  	DO MutatieToLokaal
  	
  	db.DebugOut('Partij-init: ' & APla:InkoopID & ', ' & APla:PlanningID)
  	Par:InkoopID = APla:InkoopID
  	Par:InkoopPlanningID = APla:PlanningID
  	
  	! Na het terugzetten is er nog geen mutatie terwijl de partij wel bestaat, vul dan ook vanuit de planning
  	IF LOC:CelID1 = 0 AND LOC:CelLocatieID1 = 0 THEN
  		LOC:CelID1 = APla:CelID
  		LOC:KG1 = Par:KG
  		LOC:Pallets1 = Par:Pallets
  		LOC:CelLocatieID1 = APla:CelLocatieID
  		
  		CLEAR(AAAACL:Record)
  		AAAACL:CelLocatieID = LOC:CelLocatieID1
  		Access:AAAACelLocatie.TryFetch(AAAACL:PK_CelLocatie)
  		IF LOC:CelID1 <> AAAACL:CelID THEN LOC:CelLocatieID1 = 0.
  	END
  	
  	DO LaadDropComboTables
  ELSE
  	RETURN ReturnValue
  END
  
  DO OphalenTemperaturen
  SELF.Open(Window)                                        ! Open window
  DO BerekenTotaal
  WinAlertMouseZoom()
  Do DefineListboxStyle
  INIMgr.Fetch('WindowInslag',Window)                      ! Restore window settings from non-volatile store
  FDCB1.Init(Rel:FirmaNaam,?Rel:FirmaNaam,Queue:FileDropCombo.ViewPosition,FDCB1::View:FileDropCombo,Queue:FileDropCombo,Relate:Relatie,ThisWindow,GlobalErrors,0,0,0)
  FDCB1.RemoveDuplicatesFlag = TRUE
  FDCB1.Q &= Queue:FileDropCombo
  FDCB1.AddSortOrder(Rel:Relatie_FK01)
  FDCB1.SetFilter('Rel:Type=''S''')
  FDCB1.AddField(Rel:FirmaNaam,FDCB1.Q.Rel:FirmaNaam) !List box control field - type derived from field
  FDCB1.AddField(Rel:Type,FDCB1.Q.Rel:Type) !Browse hot field - type derived from field
  FDCB1.AddUpdateField(Rel:RelatieID,Par:Leverancier)
  ThisWindow.AddItem(FDCB1.WindowComponent)
  FDCB1.DefaultFill = 0
  FDCB3.Init(Ver:VerpakkingOmschrijving,?Ver:VerpakkingOmschrijving,Queue:FileDropCombo:2.ViewPosition,FDCB3::View:FileDropCombo,Queue:FileDropCombo:2,Relate:Verpakking,ThisWindow,GlobalErrors,0,0,0)
  FDCB3.Q &= Queue:FileDropCombo:2
  FDCB3.AddSortOrder(Ver:Verpakking_PK)
  FDCB3.AddField(Ver:VerpakkingOmschrijving,FDCB3.Q.Ver:VerpakkingOmschrijving) !List box control field - type derived from field
  FDCB3.AddUpdateField(Ver:VerpakkingID,Par:VerpakkingID)
  ThisWindow.AddItem(FDCB3.WindowComponent)
  FDCB3.DefaultFill = 0
  FDCB5.Init(CEL:CelOms,?CEL:CelOms,Queue:FileDropCombo:3.ViewPosition,FDCB5::View:FileDropCombo,Queue:FileDropCombo:3,Relate:Cel,ThisWindow,GlobalErrors,0,1,0)
  FDCB5.Q &= Queue:FileDropCombo:3
  FDCB5.AddSortOrder(CEL:CEL_PK)
  FDCB5.AddField(CEL:CelOms,FDCB5.Q.CEL:CelOms) !List box control field - type derived from field
  FDCB5.AddField(CEL:CelID,FDCB5.Q.CEL:CelID) !Primary key field - type derived from field
  FDCB5.AddUpdateField(CEL:CelID,LOC:CelID1)
  ThisWindow.AddItem(FDCB5.WindowComponent)
  FDCB5.DefaultFill = 0
  FDCB8.Init(ACel:CelOms,?ACel:CelOms,Queue:FileDropCombo:4.ViewPosition,FDCB8::View:FileDropCombo,Queue:FileDropCombo:4,Relate:ACel,ThisWindow,GlobalErrors,0,1,0)
  FDCB8.Q &= Queue:FileDropCombo:4
  FDCB8.AddSortOrder(ACel:CEL_PK)
  FDCB8.AddField(ACel:CelOms,FDCB8.Q.ACel:CelOms) !List box control field - type derived from field
  FDCB8.AddField(ACel:CelID,FDCB8.Q.ACel:CelID) !Primary key field - type derived from field
  FDCB8.AddUpdateField(ACel:CelID,LOC:CelID2)
  ThisWindow.AddItem(FDCB8.WindowComponent)
  FDCB8.DefaultFill = 0
  FDCB9.Init(AACel:CelOms,?AACel:CelOms,Queue:FileDropCombo:5.ViewPosition,FDCB9::View:FileDropCombo,Queue:FileDropCombo:5,Relate:AACel,ThisWindow,GlobalErrors,0,1,0)
  FDCB9.Q &= Queue:FileDropCombo:5
  FDCB9.AddSortOrder(AACel:CEL_PK)
  FDCB9.AddField(AACel:CelOms,FDCB9.Q.AACel:CelOms) !List box control field - type derived from field
  FDCB9.AddField(AACel:CelID,FDCB9.Q.AACel:CelID) !Primary key field - type derived from field
  FDCB9.AddUpdateField(AACel:CelID,LOC:CelID3)
  ThisWindow.AddItem(FDCB9.WindowComponent)
  FDCB9.DefaultFill = 0
  FDCB7.Init(AAACel:CelOms,?AAACel:CelOms,Queue:FileDropCombo:6.ViewPosition,FDCB7::View:FileDropCombo,Queue:FileDropCombo:6,Relate:AAACel,ThisWindow,GlobalErrors,0,1,0)
  FDCB7.Q &= Queue:FileDropCombo:6
  FDCB7.AddSortOrder(AAACel:CEL_PK)
  FDCB7.AddField(AAACel:CelOms,FDCB7.Q.AAACel:CelOms) !List box control field - type derived from field
  FDCB7.AddField(AAACel:CelID,FDCB7.Q.AAACel:CelID) !Primary key field - type derived from field
  FDCB7.AddUpdateField(AAACel:CelID,LOC:CelID4)
  ThisWindow.AddItem(FDCB7.WindowComponent)
  FDCB7.DefaultFill = 0
  FDCB10.Init(Art:ArtikelOms,?Art:ArtikelOms:2,Queue:FileDropCombo:7.ViewPosition,FDCB10::View:FileDropCombo,Queue:FileDropCombo:7,Relate:ViewArtikel,ThisWindow,GlobalErrors,0,0,0)
  FDCB10.RemoveDuplicatesFlag = TRUE
  FDCB10.Q &= Queue:FileDropCombo:7
  FDCB10.AddSortOrder(Art:Artikel_FK01)
  FDCB10.AddField(Art:ArtikelOms,FDCB10.Q.Art:ArtikelOms) !List box control field - type derived from field
  FDCB10.AddUpdateField(Art:ArtikelID,Par:ArtikelID)
  ThisWindow.AddItem(FDCB10.WindowComponent)
  FDCB10.DefaultFill = 0
  FDCB11.Init(CL:Locatienaam,?CL:Locatienaam,Queue:FileDropCombo:1.ViewPosition,FDCB11::View:FileDropCombo,Queue:FileDropCombo:1,Relate:CelLocatie,ThisWindow,GlobalErrors,0,1,0)
  FDCB11.Q &= Queue:FileDropCombo:1
  FDCB11.AddSortOrder(CL:FK_CelLocatie)
  FDCB11.AddRange(CL:CelID,LOC:CelID1)
  FDCB11.AddField(CL:Locatienaam,FDCB11.Q.CL:Locatienaam) !List box control field - type derived from field
  FDCB11.AddField(CL:CelLocatieID,FDCB11.Q.CL:CelLocatieID) !Primary key field - type derived from field
  FDCB11.AddUpdateField(CL:CelLocatieID,LOC:CelLocatieID1)
  ThisWindow.AddItem(FDCB11.WindowComponent)
  FDCB11.DefaultFill = 0
  FDCB12.Init(ACL:Locatienaam,?ACL:Locatienaam,Queue:FileDropCombo:8.ViewPosition,FDCB12::View:FileDropCombo,Queue:FileDropCombo:8,Relate:ACelLocatie,ThisWindow,GlobalErrors,0,1,0)
  FDCB12.Q &= Queue:FileDropCombo:8
  FDCB12.AddSortOrder(ACL:FK_CelLocatie)
  FDCB12.AddRange(ACL:CelID,LOC:CelID2)
  FDCB12.AddField(ACL:Locatienaam,FDCB12.Q.ACL:Locatienaam) !List box control field - type derived from field
  FDCB12.AddField(ACL:CelLocatieID,FDCB12.Q.ACL:CelLocatieID) !Primary key field - type derived from field
  FDCB12.AddUpdateField(ACL:CelLocatieID,LOC:CelLocatieID2)
  ThisWindow.AddItem(FDCB12.WindowComponent)
  FDCB12.DefaultFill = 0
  FDCB13.Init(AACL:Locatienaam,?AACL:Locatienaam,Queue:FileDropCombo:9.ViewPosition,FDCB13::View:FileDropCombo,Queue:FileDropCombo:9,Relate:AACelLocatie,ThisWindow,GlobalErrors,0,1,0)
  FDCB13.Q &= Queue:FileDropCombo:9
  FDCB13.AddSortOrder(AACL:FK_CelLocatie)
  FDCB13.AddRange(AACL:CelID,LOC:CelID3)
  FDCB13.AddField(AACL:Locatienaam,FDCB13.Q.AACL:Locatienaam) !List box control field - type derived from field
  FDCB13.AddField(AACL:CelLocatieID,FDCB13.Q.AACL:CelLocatieID) !Primary key field - type derived from field
  FDCB13.AddUpdateField(AACL:CelLocatieID,LOC:CelLocatieID3)
  ThisWindow.AddItem(FDCB13.WindowComponent)
  FDCB13.DefaultFill = 0
  FDCB14.Init(AAAACL:Locatienaam,?AAAACL:Locatienaam,Queue:FileDropCombo:10.ViewPosition,FDCB14::View:FileDropCombo,Queue:FileDropCombo:10,Relate:AAAACelLocatie,ThisWindow,GlobalErrors,0,1,0)
  FDCB14.Q &= Queue:FileDropCombo:10
  FDCB14.AddSortOrder(AAAACL:FK_CelLocatie)
  FDCB14.AddRange(AAAACL:CelID,LOC:CelID4)
  FDCB14.AddField(AAAACL:Locatienaam,FDCB14.Q.AAAACL:Locatienaam) !List box control field - type derived from field
  FDCB14.AddField(AAAACL:CelLocatieID,FDCB14.Q.AAAACL:CelLocatieID) !Primary key field - type derived from field
  FDCB14.AddUpdateField(AAAACL:CelLocatieID,LOC:CelLocatieID4)
  ThisWindow.AddItem(FDCB14.WindowComponent)
  FDCB14.DefaultFill = 0
  SELF.SetAlerts()
  EnterByTabManager.Init(False)
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:AAAACelLocatie.Close
    Relate:AAACel.Close
    Relate:AAACelLocatie.Close
    Relate:AACel.Close
    Relate:AACelLocatie.Close
    Relate:ACel.Close
    Relate:ACelLocatie.Close
    Relate:AMutatie.Close
    Relate:APartij.Close
    Relate:APlanning.Close
    Relate:Cel.Close
    Relate:DubbeleInslagMutaties.Close
    Relate:Inkoop.Close
    Relate:Mutatie.Close
    Relate:Partij.Close
    Relate:Verpakking.Close
    Relate:ViewArtikel.Close
    Relate:ViewVoorraadPartij.Close
  END
  IF SELF.Opened
    INIMgr.Update('WindowInslag',Window)                   ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.PrimeUpdate PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.PrimeUpdate()
  	If returnValue = Level:Fatal  ! delete just occured
  		NetRefreshPlanningViews()
  		NetRefreshVoorraadViews()
  	End
    If returnValue = Level:Fatal  ! delete just occured
      ThisNetRefresh.Send('|Relatie|Verpakking|Cel|ACel|AACel|AAACel|ViewArtikel|CelLocatie|ACelLocatie|AACelLocatie|AAAACelLocatie|Partij|') ! NetTalk (NetRefresh)
    End
  RETURN ReturnValue


ThisWindow.Run PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Run()
  IF SELF.Request = ViewRecord                             ! In View Only mode always signal RequestCancelled
    ReturnValue = RequestCancelled
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
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?Par:KG
      IF LOC:KG2 = 0 AND LOC:KG3 = 0 AND LOC:KG4 = 0
      	LOC:KG1 = Par:KG
      	DISPLAY(?LOC:KG1)
      .
      DO BerekenTotaal
    OF ?Par:Pallets
      IF LOC:Pallets2 = 0 AND LOC:Pallets3 = 0 AND LOC:Pallets4 = 0
      	LOC:Pallets1 = Par:Pallets
      	DISPLAY(?LOC:Pallets1)
      .
      DO BerekenTotaal
    OF ?LOC:KG1
      IF LOC:KG2 = 0
      	IF (Par:KG - LOC:KG1 - LOC:KG3 - LOC:KG4) >= 0
      		LOC:KG2 = Par:KG - LOC:KG1 - LOC:KG3 - LOC:KG4
      		DISPLAY(?LOC:KG2)
      	.
      .
      DO BerekenTotaal
    OF ?LOC:Pallets1
      IF LOC:Pallets2 = 0
      	IF (Par:Pallets - LOC:Pallets1 - LOC:Pallets3 - LOC:Pallets4) >= 0
      		LOC:Pallets2 = Par:Pallets - LOC:Pallets1 - LOC:Pallets3 - LOC:Pallets4
      		DISPLAY(?LOC:Pallets2)
      	.
      .
      DO BerekenTotaal
    OF ?LOC:KG2
      IF LOC:KG3 = 0
      	IF (Par:KG - LOC:KG1 - LOC:KG2 - LOC:KG4) >= 0 
      		LOC:KG3 = Par:KG - LOC:KG1 - LOC:KG2 - LOC:KG4
      		DISPLAY(?LOC:KG3)
      	.
      .
      DO BerekenTotaal
    OF ?LOC:Pallets2
      IF LOC:Pallets3 = 0
      	IF (Par:Pallets - LOC:Pallets1 - LOC:Pallets2 - LOC:Pallets4) >= 0
      		LOC:Pallets3 = Par:Pallets - LOC:Pallets1 - LOC:Pallets2 - LOC:Pallets4
      		DISPLAY(?LOC:Pallets3)
      	.
      .
      DO BerekenTotaal
    OF ?LOC:KG3
      IF LOC:KG4 = 0
      	IF (Par:KG - LOC:KG1 - LOC:KG2 - LOC:KG3 > 0)
      		LOC:KG4 = Par:KG - LOC:KG1 - LOC:KG2 - LOC:KG3
      		DISPLAY(?LOC:KG4)
      	.
      .
      DO BerekenTotaal
    OF ?LOC:Pallets3
      IF LOC:Pallets4 = 0
      	IF (Par:Pallets - LOC:Pallets1 - LOC:Pallets2 - LOC:Pallets3) >= 0
      		LOC:Pallets4 = Par:Pallets - LOC:Pallets1 - LOC:Pallets2 - LOC:Pallets3
      		DISPLAY(?LOC:Pallets4)
      	.
      .
      DO BerekenTotaal
    OF ?LOC:KG4
      DO BerekenTotaal
    OF ?LOC:Pallets4
      DO BerekenTotaal
    OF ?OKButton
      ThisWindow.Update()
      IF SELF.Request = ViewRecord AND NOT SELF.BatchProcessing THEN
         POST(EVENT:CloseWindow)
      END
    END
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
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
  DO BerekenTotaal
  
  IF Par:ArtikelID = 0 THEN
  	SELECT(?Art:ArtikelOms:2)
  	RETURN Level:Notify
  END
  
  IF Par:Leverancier = 0 THEN
  	SELECT(?Rel:FirmaNaam)
  	RETURN Level:Notify
  END
  
  IF Par:VerpakkingID = 0 THEN
  	SELECT(?Ver:VerpakkingOmschrijving)
  	RETURN Level:Notify
  END
  
  omit('zelfdecel')
  IF LOC:CelID1 <> 0 AND (LOC:CelID1 = LOC:CelID2 OR	LOC:CelID1 = LOC:CelID3 OR LOC:CelID1 = LOC:CelID4)
  	MESSAGE('Cel ' & CLIP(LOC:CelID1) & ' is meer dan 1 keer ingevoerd','Cel 1',Icon:Hand)
  	Select(?CEL:CelOms)
  	RETURN Level:Notify
  .
  
  IF LOC:CelID2 <> 0 AND (LOC:CelID2 = LOC:CelID3 OR LOC:CelID2 = LOC:CelID4)
  	MESSAGE('Cel ' & CLIP(LOC:CelID2) & ' is meer dan 1 keer ingevoerd','Cel 2',Icon:Hand)
  	Select(?ACEL:CelOms)
  	RETURN Level:Notify
  .
  
  IF LOC:CelID3 <> 0 AND (LOC:CelID3 = LOC:CelID4)
  	MESSAGE('Cel ' & CLIP(LOC:CelID3) & ' is meer dan 1 keer ingevoerd','Cel 3',Icon:Hand)
  	Select(?AACEL:CelOms)
  	RETURN Level:Notify
  .
  'zelfdecel'
  
  IF (LOC:KG1<>0 OR LOC:Pallets1<>0) AND LOC:CelID1 = 0 THEN
  	SELECT(?CEL:CelOms)
  	RETURN Level:Notify
  .
  
  IF (LOC:KG2<>0 OR LOC:Pallets2<>0) AND LOC:CelID2 = 0 THEN
  	SELECT(?ACEL:CelOms)
  	RETURN Level:Notify
  .
  
  IF (LOC:KG3<>0 OR LOC:Pallets3<>0) AND LOC:CelID3 = 0 THEN
  	SELECT(?AACEL:CelOms)
  	RETURN Level:Notify
  .
  
  IF (LOC:KG4<>0 OR LOC:Pallets4<>0) AND LOC:CelID4 = 0 THEN
  	SELECT(?AAACEL:CelOms)
  	RETURN Level:Notify
  .
  
  IF LOC:PalletsBalans<>'Klopt' OR LOC:KGBalans<>'Klopt'
  	MESSAGE('Mutatietotalen niet gelijk aan partijtotaal.')
  	RETURN Level:Notify
  .
  
  IF ThisWindow.Request = InsertRecord THEN
  	! Nog controleren of niet een andere gebruiker ondertussen de inslag al heeft gedaan
  	Access:APlanning.TryFetch(APla:PK_Planning)
  	IF APla:MutatieGemaakt THEN
  		MESSAGE('Inslag is reeds gedaan')
  		RETURN Level:Notify
  	.
  ELSE
  	! Wijziging, controleren of de voorraad niet negatief wordt
  	DO ControleerVoorraad
  	
  	IF LOC:NegatieveVoorraad THEN
  		RETURN Level:Notify
  	.
  .
  
  ReturnValue = PARENT.TakeCompleted()
  ! weet ik nu het partij nummer
  IF (ThisWindow.Request = ChangeRecord)
  	DO WisMutaties
  END
  
  ! Toevoegen mutaties
  IF LOC:CelID1<>0 AND (LOC:Pallets1<>0 OR LOC:KG1<>0)
  	Access:Mutatie.PrimeRecord()
  	Mut:PartijID = Par:PartijID 
  	Mut:InslagKG = LOC:KG1
  	Mut:InslagPallet = LOC:Pallets1 
  	Mut:CelID = LOC:CelID1
  	
  	CLEAR(AAACL:Record)	
  	AAACL:CelLocatieID = LOC:CelLocatieID1
  	Access:AAACelLocatie.TryFetch(AAACL:PK_CelLocatie)
  	IF Mut:CelID <> AAACL:CelID THEN LOC:CelLocatieID1 = 0.
  	
  	Mut:CelLocatieID = LOC:CelLocatieID1
  	Mut:SoortMutatie = 'IN'
  	Mut:PlanningID = APla:PlanningID
  	Mut:ArtikelID = Par:ArtikelID
  	Mut:DatumTijd_DATE = Par:AanmaakDatum_DATE
  	Mut:DatumTijd_TIME = Par:AanmaakDatum_TIME
  	Access:Mutatie.Insert()
  	
  	! Controleren op spook-dubbele inslagen
  	!ThisWindow.VerwijderDubbeleInslag(Par:Record, LOC:CelID1)
  END
  
  IF LOC:CelID2<>0 AND (LOC:Pallets2<>0 OR LOC:KG2<>0)
  	Access:Mutatie.PrimeRecord()
  	Mut:PartijID = Par:PartijID 
  	Mut:InslagKG = LOC:KG2
  	Mut:InslagPallet = LOC:Pallets2
  	Mut:CelID = LOC:CelID2
  
  	CLEAR(AAACL:Record)	
  	AAACL:CelLocatieID = LOC:CelLocatieID2
  	Access:AAACelLocatie.TryFetch(AAACL:PK_CelLocatie)
  	IF Mut:CelID <> AAACL:CelID THEN LOC:CelLocatieID2 = 0.
  	
  	Mut:CelLocatieID = LOC:CelLocatieID2
  	Mut:SoortMutatie = 'IN'
  	Mut:PlanningID = APla:PlanningID
  	Mut:ArtikelID = Par:ArtikelID
  	Mut:DatumTijd_DATE = Par:AanmaakDatum_DATE
  	Mut:DatumTijd_TIME = Par:AanmaakDatum_TIME
  	Access:Mutatie.Insert()
  	
  	! Controleren op spook-dubbele inslagen
  	!ThisWindow.VerwijderDubbeleInslag(Par:Record, LOC:CelID2)
  END
  
  IF LOC:CelID3<>0 AND (LOC:Pallets3<>0 OR LOC:KG3<>0)
  	Access:Mutatie.PrimeRecord()
  	Mut:PartijID = Par:PartijID 
  	Mut:InslagKG = LOC:KG3
  	Mut:InslagPallet = LOC:Pallets3
  	Mut:CelID = LOC:CelID3
  	
  	CLEAR(AAACL:Record)
  	AAACL:CelLocatieID = LOC:CelLocatieID3
  	Access:AAACelLocatie.TryFetch(AAACL:PK_CelLocatie)
  	IF Mut:CelID <> AAACL:CelID THEN LOC:CelLocatieID3 = 0.
  
  	Mut:CelLocatieID = LOC:CelLocatieID3
  	Mut:SoortMutatie = 'IN'
  	Mut:PlanningID = APla:PlanningID
  	Mut:ArtikelID = Par:ArtikelID
  	Mut:DatumTijd_DATE = Par:AanmaakDatum_DATE
  	Mut:DatumTijd_TIME = Par:AanmaakDatum_TIME
  	Access:Mutatie.Insert()
  	
  	! Controleren op spook-dubbele inslagen
  	!ThisWindow.VerwijderDubbeleInslag(Par:Record, LOC:CelID3)
  END
  
  IF LOC:CelID4<>0 AND (LOC:Pallets4<>0 OR LOC:KG4<>0)
  	Access:Mutatie.PrimeRecord()
  	Mut:PartijID = Par:PartijID 
  	Mut:InslagKG = LOC:KG4
  	Mut:InslagPallet = LOC:Pallets4
  	Mut:CelID = LOC:CelID4
  
  	CLEAR(AAACL:Record)
  	AAACL:CelLocatieID = LOC:CelLocatieID4
  	Access:AAACelLocatie.TryFetch(AAACL:PK_CelLocatie)
  	IF Mut:CelID <> AAACL:CelID THEN LOC:CelLocatieID4 = 0.
  	
  	Mut:CelLocatieID = LOC:CelLocatieID4
  	Mut:SoortMutatie = 'IN'
  	Mut:PlanningID = APla:PlanningID
  	Mut:ArtikelID = Par:ArtikelID
  	Mut:DatumTijd_DATE = Par:AanmaakDatum_DATE
  	Mut:DatumTijd_TIME = Par:AanmaakDatum_TIME
  	Access:Mutatie.Insert()
  	
  	! Controleren op spook-dubbele inslagen
  	!ThisWindow.VerwijderDubbeleInslag(Par:Record, LOC:CelID4)
  END
  
  VoorraadClass.BerekenPlanningMutatieGrootte(APla:PlanningID)
  
  LOC:SavedPartijBuffer = Access:Partij.SaveBuffer()
  LOC:SavedPartijFile = Access:Partij.SaveFile()
  VoorraadClass.BerekenPartijenInkoopPrijs(APla:InkoopID)
  Access:Partij.RestoreFile(LOC:SavedPartijFile)
  Access:Partij.RestoreBuffer(LOC:SavedPartijBuffer)
  
  !Access:Partij.Update()
    ThisNetRefresh.Send('|Relatie|Verpakking|Cel|ACel|AACel|AAACel|ViewArtikel|CelLocatie|ACelLocatie|AACelLocatie|AAAACelLocatie|Partij|') ! NetTalk (NetRefresh)
  	NetRefreshPlanningViews()
  	NetRefreshVoorraadViews()
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
  ?Par:InslagQATransportmiddelSchoon{PROP:Background}=CHOOSE(Par:InslagQATransportmiddelSchoon,COLOR:NONE,COLOR:RED)
  ?Par:InslagQAVerpakkingSchoonGesloten{PROP:Background}=CHOOSE(Par:InslagQAVerpakkingSchoonGesloten,COLOR:NONE,COLOR:RED)
  ?Par:InslagQAIdentificatieMerkenVerpakking{PROP:Background}=CHOOSE(Par:InslagQAIdentificatieMerkenVerpakking,COLOR:NONE,COLOR:RED)
  ?Par:InslagQAIsGeurKleurProductEigen{PROP:Background}=CHOOSE(Par:InslagQAIsGeurKleurProductEigen,COLOR:NONE,COLOR:RED)
  ?Par:InslagQAGeenGlasbreuk{PROP:Background}=CHOOSE(Par:InslagQAGeenGlasbreuk,COLOR:NONE,COLOR:RED)
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

ThisWindow.VerwijderDubbeleInslag PROCEDURE(Par:Record PartijRecord, LONG CelID)

  CODE
  	CLEAR(Dub:Record)
  	Dub:PartijID = PartijRecord:PartijID
  	Dub:CelID = CelID
  	IF (Access:DubbeleInslagMutaties.TryFetch(Dub:Partij_CelID_K) = Level:Benign)
  		IF (Dub:AantalInslagen > 1)
  			!MESSAGE((Dub:AantalInslagen - 1) & ' dubbele inslag gedetecteerd (Partij: ' & Dub:PartijID & ' / Cel-ID: ' & Dub:CelID & '): deze dubbelen worden nu verwijderd')
  			aantal_verwijderen# = (Dub:AantalInslagen - 1)
  			AMut:PartijID = PartijRecord:PartijID
  			AMut:DatumTijd_DATE = PartijRecord:AanmaakDatum_GROUP:AanmaakDatum_DATE
  			AMut:DatumTijd_TIME = PartijRecord:AanmaakDatum_GROUP:AanmaakDatum_TIME
  			SET(AMut:Mutatie_FK01, AMut:Mutatie_FK01)
  			
  			LOOP
  				Access:AMutatie.Next()
  				IF ERROR() THEN BREAK.
  				IF AMut:PartijID <> PartijRecord:PartijID OR |
  					AMut:DatumTijd_DATE <> PartijRecord:AanmaakDatum_GROUP:AanmaakDatum_DATE OR |
  					AMut:DatumTijd_TIME <> PartijRecord:AanmaakDatum_GROUP:AanmaakDatum_TIME THEN BREAK.
  				IF AMut:CelID <> CelID OR AMut:SoortMutatie <> 'IN' THEN CYCLE.
  			
  				Access:AMutatie.DeleteRecord(False)
  				aantal_verwijderen# -= 1
  				
  				IF (aantal_verwijderen# = 0) THEN BREAK.
  			.			
   		.
  	END


!!! <summary>
!!! Generated from procedure template - Window
!!! Window
!!! </summary>
UpdateUitslagMutatieQueueWeging PROCEDURE (PRM:ArtikelID, PRM:QueueID)

LOC:AantalKG         DECIMAL(10,2)                         ! 
LOC:QueueID          LONG                                  ! 
LOC:AantalPallets    LONG                                  ! 
LOC:PartijCelID      STRING(25)                            ! 
LOC:CelID            LONG                                  ! 
LOC:PartijID         LONG                                  ! 
Loc:CelLokatieID     LONG                                  ! 
LOC:PartijVoorraadKG DECIMAL(10,2)                         ! 
LOC:PartijVoorraadPallet LONG                              ! 
LOC:LeverancierFirmanaam STRING(50)                        ! 
LOC:VerpakkingOmschrijving CSTRING(51)                     ! 
LOC:ArtikelID        CSTRING(31)                           ! 
LOC:WegingQueue      QUEUE,PRE(WQ)                         ! 
BrutoGewichtKG       DECIMAL(10,2)                         ! 
PalletSoort          CSTRING(11)                           ! 
PalletSoortID        LONG                                  ! 
NettoGewichtKG       DECIMAL(10,2)                         ! 
Datum                DATE                                  ! 
Tijd                 TIME                                  ! 
PalletID             LONG                                  ! 
                     END                                   ! 
FDCB6::View:FileDropCombo VIEW(AAAAViewVoorraadPartij)
                       PROJECT(AAAAVVPar:PartijCelID)
                       PROJECT(AAAAVVPar:PartijID)
                       PROJECT(AAAAVVPar:ExternPartijnr)
                       PROJECT(AAAAVVPar:CelOms)
                       PROJECT(AAAAVVPar:AanmaakDatum_DATE)
                       PROJECT(AAAAVVPar:BerekendeInkoopKGPrijs)
                       PROJECT(AAAAVVPar:VerpakkingOmschrijving)
                       PROJECT(AAAAVVPar:LeverancierFirmanaam)
                       PROJECT(AAAAVVPar:VoorraadKG)
                       PROJECT(AAAAVVPar:VoorraadPallets)
                       PROJECT(AAAAVVPar:CelID)
                     END
FDCB8::View:FileDropCombo VIEW(CelLocatie)
                       PROJECT(CL:Locatienaam)
                       PROJECT(CL:CelLocatieID)
                     END
Queue:FileDropCombo  QUEUE                            !
AAAAVVPar:PartijCelID  LIKE(AAAAVVPar:PartijCelID)    !List box control field - type derived from field
AAAAVVPar:PartijID     LIKE(AAAAVVPar:PartijID)       !List box control field - type derived from field
AAAAVVPar:ExternPartijnr LIKE(AAAAVVPar:ExternPartijnr) !List box control field - type derived from field
AAAAVVPar:CelOms       LIKE(AAAAVVPar:CelOms)         !List box control field - type derived from field
AAAAVVPar:AanmaakDatum_DATE LIKE(AAAAVVPar:AanmaakDatum_DATE) !List box control field - type derived from field
AAAAVVPar:BerekendeInkoopKGPrijs LIKE(AAAAVVPar:BerekendeInkoopKGPrijs) !List box control field - type derived from field
LOC:PartijVoorraadKG   LIKE(LOC:PartijVoorraadKG)     !List box control field - type derived from local data
LOC:PartijVoorraadPallet LIKE(LOC:PartijVoorraadPallet) !List box control field - type derived from local data
AAAAVVPar:VerpakkingOmschrijving LIKE(AAAAVVPar:VerpakkingOmschrijving) !List box control field - type derived from field
AAAAVVPar:LeverancierFirmanaam LIKE(AAAAVVPar:LeverancierFirmanaam) !List box control field - type derived from field
AAAAVVPar:VoorraadKG   LIKE(AAAAVVPar:VoorraadKG)     !Browse hot field - type derived from field
AAAAVVPar:VoorraadPallets LIKE(AAAAVVPar:VoorraadPallets) !Browse hot field - type derived from field
AAAAVVPar:CelID        LIKE(AAAAVVPar:CelID)          !Browse hot field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
Queue:FileDropCombo:1 QUEUE                           !
CL:Locatienaam         LIKE(CL:Locatienaam)           !List box control field - type derived from field
CL:CelLocatieID        LIKE(CL:CelLocatieID)          !Primary key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
LocEnableEnterByTab  BYTE(1)                               !Used by the ENTER Instead of Tab template
EnterByTabManager    EnterByTabClass
QuickWindow          WINDOW('Extra uitslag-mutaties'),AT(,,397,195),FONT('MS Sans Serif',8,,FONT:regular,CHARSET:DEFAULT), |
  DOUBLE,CENTER,GRAY,IMM,HLP('UpdateUitslagMutatieQueue'),SYSTEM
                       STRING('Partij / Cel-ID:'),AT(7,7,47,10),USE(?STRING1)
                       COMBO(@s30),AT(59,7,155,10),USE(AAAAVVPar:PartijCelID),DECIMAL(12),VSCROLL,DROP(5,400),FORMAT('0L(2)|~Par' & |
  'tij.Cel~C(0)@s25@[45R(2)|~Intern~C(0)@n_10@45R(2)|~Extern~C(0)@s20@](90)|~Partijnumm' & |
  'er~45L(2)|~Cel~C(0)@s50@46R(2)|~Inslagdatum~C(0)@d17@52R(2)|~Inkoop KG-Prijs~C(0)@n1' & |
  '3`2@[49R(2)|M~KG~C(1)@n-12`2@60R(2)|M~Pallets~C(1)@n-14.@](101)|~Voorraad~50L(2)|~Ve' & |
  'rpakking~C(0)@s50@50L(2)|~Leverancier~C(0)@s50@'),FROM(Queue:FileDropCombo),IMM
                       PROMPT('Aantal KG:'),AT(7,32),USE(?AantalKG:Prompt)
                       PROMPT('Locatie:'),AT(7,18),USE(?PROMPT1)
                       COMBO(@s50),AT(59,19,155,10),USE(CL:Locatienaam),DROP(5),FORMAT('200L(2)|M~Locatienaam~L(0)@s50@'), |
  FROM(Queue:FileDropCombo:1),IMM
                       ENTRY(@n13`2),AT(59,31,60,10),USE(LOC:AantalKG),RIGHT(2)
                       PROMPT('Aantal Pallets:'),AT(7,46),USE(?AantalPallets:Prompt),RIGHT
                       ENTRY(@n14`0),AT(59,46,60,10),USE(LOC:AantalPallets),RIGHT(2)
                       LIST,AT(59,61,335,77),USE(?WegingList),HVSCROLL,FORMAT('60R(2)|~Bruto (KG)~C(0)@n14`2@4' & |
  '5C|~Palletsoort~@s10@0C(2)@n-14@60R(2)|~Netto (KG)~C(0)@n14`2@0R(2)@d17@0R(2)@t7@60R' & |
  '(2)|~Pallet ID~C(1)@n_10@'),FROM(LOC:WegingQueue)
                       BUTTON('Toevoegen'),AT(57,142,51,14),USE(?ToevoegenWeging1)
                       BUTTON('Wijzigen'),AT(109,142,41,14),USE(?WijzigenWeging1)
                       BUTTON('Verwijderen'),AT(152,142,53,14),USE(?VerwijderenWeging1)
                       BUTTON('Weeg Nu'),AT(349,142,45,14),USE(?WeegNu1)
                       BUTTON('&OK'),AT(289,161,49,14),USE(?Ok),LEFT,ICON('WAOK.ICO'),FLAT,MSG('Accept operation'), |
  TIP('Accept Operation')
                       BUTTON('&Cancel'),AT(344,161,49,14),USE(?Cancel),LEFT,ICON('WACANCEL.ICO'),FLAT,MSG('Cancel Operation'), |
  TIP('Cancel Operation')
                       BUTTON('Vul vanuit de weging'),AT(305,43,86),USE(?VulVanuitWeging)
                       BUTTON('Palletblad'),AT(299,142,45,14),USE(?PalletBladButton)
                     END

    omit('***',WE::CantCloseNowSetHereDone=1)  !Getting Nested omit compile error, then uncheck the "Check for duplicate CantCloseNowSetHere variable declaration" in the WinEvent local template
WE::CantCloseNowSetHereDone equate(1)
WE::CantCloseNowSetHere     long
    !***
ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED
TakeEvent              PROCEDURE(),BYTE,PROC,DERIVED
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
FDCB6                CLASS(FileDropComboClass)             ! File drop combo manager
Q                      &Queue:FileDropCombo           !Reference to browse queue type
SetQueueRecord         PROCEDURE(),DERIVED
ValidateRecord         PROCEDURE(),BYTE,DERIVED
                     END

FDCB8                CLASS(FileDropComboClass)             ! File drop combo manager
Q                      &Queue:FileDropCombo:1         !Reference to browse queue type
ValidateRecord         PROCEDURE(),BYTE,DERIVED
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
!---------------------------------------------------------------------------

ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('UpdateUitslagMutatieQueueWeging')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?STRING1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('LOC:PartijVoorraadKG',LOC:PartijVoorraadKG)        ! Added by: FileDropCombo(ABC)
  BIND('LOC:PartijVoorraadPallet',LOC:PartijVoorraadPallet) ! Added by: FileDropCombo(ABC)
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  IF SELF.Request = SelectRecord
     SELF.AddItem(?Ok,RequestCancelled)                    ! Add the close control to the window manger
  ELSE
     SELF.AddItem(?Ok,RequestCompleted)                    ! Add the close control to the window manger
  END
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  LOC:ArtikelID = PRM:ArtikelID
  LOC:QueueID = PRM:QueueID
  
  FREE(LOC:WegingQueue)
  
  IF ThisWindow.Request = ChangeRecord OR ThisWindow.Request = ViewRecord THEN
  	LOC:AantalKG = UMQ:KG
  	LOC:AantalPallets = UMQ:Pallet
  	LOC:PartijCelID = UMQ:PartijCelID
  	LOC:LeverancierFirmanaam = UMQ:LeverancierNaam
  	LOC:VerpakkingOmschrijving = UMQ:VerpakkingOmschrijving
  	LOC:PartijID = UMQ:PartijID
  	LOC:CelID = UMQ:CelID
  	
  	LOOP i# = 1 TO RECORDS(GLO:WegingQueue2)
  		GET(GLO:WegingQueue2, i#)
  		IF GWQ2:ID = LOC:QueueID THEN
  			WQ:BrutoGewichtKG = GWQ2:BrutoGewichtKG
  			WQ:NettoGewichtKG = GWQ2:NettoGewichtKG
  			WQ:PalletSoortID = GWQ2:PalletsoortID
  			WQ:PalletSoort = GWQ2:Palletsoort
  			WQ:Datum = GWQ2:Datum
              WQ:Tijd = GWQ2:Tijd
              WQ:PalletID = GWQ2:PalletID
  			ADD(LOC:WegingQueue)
  		END
  	END
  ELSE
  	LOC:AantalKG = 0
  	LOC:AantalPallets = 0
  	LOC:PartijCelID = 0
  	LOC:PartijID = 0
  	LOC:VerpakkingOmschrijving = ''
  	LOC:LeverancierFirmanaam = ''
  	LOC:CelID = 0
  .
  	
  GLO:BepaalTotaal = 0
  Relate:AAAAViewVoorraadPartij.Open                       ! File AAAAViewVoorraadPartij used by this procedure, so make sure it's RelationManager is open
  Relate:CelLocatie.SetOpenRelated()
  Relate:CelLocatie.Open                                   ! File CelLocatie used by this procedure, so make sure it's RelationManager is open
  Relate:Pallet.Open                                       ! File Pallet used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(QuickWindow)                                   ! Open window
  IF IGB:BekijkenPrijzen <> 1 THEN
  	! Prijzen niet tonen
  	?AAAAVVPar:PartijCelID{PROPLIST:Width, 6} = 0
  END
  WinAlertMouseZoom()
  Do DefineListboxStyle
  IF SELF.Request = ViewRecord                             ! Configure controls for View Only mode
    DISABLE(?AAAAVVPar:PartijCelID)
    DISABLE(?CL:Locatienaam)
    DISABLE(?LOC:AantalKG)
    DISABLE(?LOC:AantalPallets)
    DISABLE(?ToevoegenWeging1)
    DISABLE(?WijzigenWeging1)
    DISABLE(?VerwijderenWeging1)
    DISABLE(?WeegNu1)
    DISABLE(?VulVanuitWeging)
  END
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('UpdateUitslagMutatieQueueWeging',QuickWindow) ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  FDCB6.Init(AAAAVVPar:PartijCelID,?AAAAVVPar:PartijCelID,Queue:FileDropCombo.ViewPosition,FDCB6::View:FileDropCombo,Queue:FileDropCombo,Relate:AAAAViewVoorraadPartij,ThisWindow,GlobalErrors,0,1,0)
  FDCB6.Q &= Queue:FileDropCombo
  FDCB6.AddSortOrder(AAAAVVPar:ArtikelID_PartijID_CelID_K)
  FDCB6.AddRange(AAAAVVPar:ArtikelID,LOC:ArtikelID)
  FDCB6.AddField(AAAAVVPar:PartijCelID,FDCB6.Q.AAAAVVPar:PartijCelID) !List box control field - type derived from field
  FDCB6.AddField(AAAAVVPar:PartijID,FDCB6.Q.AAAAVVPar:PartijID) !List box control field - type derived from field
  FDCB6.AddField(AAAAVVPar:ExternPartijnr,FDCB6.Q.AAAAVVPar:ExternPartijnr) !List box control field - type derived from field
  FDCB6.AddField(AAAAVVPar:CelOms,FDCB6.Q.AAAAVVPar:CelOms) !List box control field - type derived from field
  FDCB6.AddField(AAAAVVPar:AanmaakDatum_DATE,FDCB6.Q.AAAAVVPar:AanmaakDatum_DATE) !List box control field - type derived from field
  FDCB6.AddField(AAAAVVPar:BerekendeInkoopKGPrijs,FDCB6.Q.AAAAVVPar:BerekendeInkoopKGPrijs) !List box control field - type derived from field
  FDCB6.AddField(LOC:PartijVoorraadKG,FDCB6.Q.LOC:PartijVoorraadKG) !List box control field - type derived from local data
  FDCB6.AddField(LOC:PartijVoorraadPallet,FDCB6.Q.LOC:PartijVoorraadPallet) !List box control field - type derived from local data
  FDCB6.AddField(AAAAVVPar:VerpakkingOmschrijving,FDCB6.Q.AAAAVVPar:VerpakkingOmschrijving) !List box control field - type derived from field
  FDCB6.AddField(AAAAVVPar:LeverancierFirmanaam,FDCB6.Q.AAAAVVPar:LeverancierFirmanaam) !List box control field - type derived from field
  FDCB6.AddField(AAAAVVPar:VoorraadKG,FDCB6.Q.AAAAVVPar:VoorraadKG) !Browse hot field - type derived from field
  FDCB6.AddField(AAAAVVPar:VoorraadPallets,FDCB6.Q.AAAAVVPar:VoorraadPallets) !Browse hot field - type derived from field
  FDCB6.AddField(AAAAVVPar:CelID,FDCB6.Q.AAAAVVPar:CelID) !Browse hot field - type derived from field
  FDCB6.AddUpdateField(AAAAVVPar:PartijCelID,LOC:PartijCelID)
  FDCB6.AddUpdateField(AAAAVVPar:CelID,LOC:CelID)
  FDCB6.AddUpdateField(AAAAVVPar:PartijID,LOC:PartijID)
  FDCB6.AddUpdateField(AAAAVVPar:LeverancierFirmanaam,LOC:LeverancierFirmanaam)
  FDCB6.AddUpdateField(AAAAVVPar:VerpakkingOmschrijving,LOC:VerpakkingOmschrijving)
  ThisWindow.AddItem(FDCB6.WindowComponent)
  FDCB6.DefaultFill = 0
  FDCB8.Init(CL:Locatienaam,?CL:Locatienaam,Queue:FileDropCombo:1.ViewPosition,FDCB8::View:FileDropCombo,Queue:FileDropCombo:1,Relate:CelLocatie,ThisWindow,GlobalErrors,0,1,0)
  FDCB8.Q &= Queue:FileDropCombo:1
  FDCB8.AddSortOrder(CL:FK_CelLocatie)
  FDCB8.AddRange(CL:CelID,AAAAVVPar:CelID)
  FDCB8.AddField(CL:Locatienaam,FDCB8.Q.CL:Locatienaam) !List box control field - type derived from field
  FDCB8.AddField(CL:CelLocatieID,FDCB8.Q.CL:CelLocatieID) !Primary key field - type derived from field
  FDCB8.AddUpdateField(CL:CelLocatieID,Loc:CelLokatieID)
  ThisWindow.AddItem(FDCB8.WindowComponent)
  FDCB8.DefaultFill = 0
  SELF.SetAlerts()
  EnterByTabManager.ExcludeControl(?Cancel)
  EnterByTabManager.ExcludeControl(?Ok)
  EnterByTabManager.Init(False)
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:AAAAViewVoorraadPartij.Close
    Relate:CelLocatie.Close
    Relate:Pallet.Close
  END
  IF SELF.Opened
    INIMgr.Update('UpdateUitslagMutatieQueueWeging',QuickWindow) ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
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
    OF ?ToevoegenWeging1
      FREE(GLO:WegingQueue)
      WGQ:BrutoGewichtKG = 0
      WGQ:NettoGewichtKG = 0
      WGQ:PalletsoortID = 0
      WGQ:Palletsoort = ''
      WGQ:Datum = 0
      WGQ:Tijd = 0
      WGQ:PalletID = 0
      
      
    OF ?WijzigenWeging1
      CLEAR(LOC:WegingQueue)
      GET(LOC:WegingQueue, Choice(?WegingList))
      IF NOT(ERROR()) THEN
      	WGQ:BrutoGewichtKG = WQ:BrutoGewichtKG
      	WGQ:Palletsoort = WQ:Palletsoort
      	WGQ:PalletsoortID = WQ:PalletsoortID
      	WGQ:NettoGewichtKG = WQ:NettoGewichtKG
      	WGQ:Datum = WQ:Datum
          WGQ:Tijd = WQ:Tijd
          WGQ:PalletID = WQ:PalletID
      ELSE
      	CYCLE
      .
    OF ?VerwijderenWeging1
      CLEAR(LOC:WegingQueue)
      GET(LOC:WegingQueue, Choice(?WegingList))
      IF NOT(ERROR()) THEN
      	DELETE(LOC:WegingQueue)
      ELSE
      	CYCLE
      .
    OF ?Ok
      IF ThisWindow.Request <> ViewRecord
          ! Controleren
          IF LOC:PartijCelID = '' THEN
              SELECT(?AAAAVVPar:PartijCelID)
              RETURN Level:Notify
          .
      
          IF LOC:AantalKG = 0 AND LOC:AantalPallets = 0 THEN
              SELECT(?LOC:AantalKG)
              RETURN Level:Notify
          .
      END
    OF ?PalletBladButton
      CLEAR(LOC:WegingQueue)
      GET(LOC:WegingQueue, Choice(?WegingList))
      IF NOT(ERROR()) THEN
          !GLO:UitslagPalletbladPlanningID (wordt gevuld in de init) (in de UpdateUitslagWeging)
          !GLO:UitslagPalletbladArtikelID (wordt gevuld in de dropdownlist) (in de UpdateUitslagWeging)
      
          GLO:UitslagPalletbladPartijID = LOC:PartijID
          !Deze worden gevuld voor de aanroep van deze Procedure (in de UpdateUitslagWeging)
          !GLO:UitslagPalletbladDueDate12 = Mut:UitslagPalletbladDueDate12_DATE
          !GLO:UitslagPalletbladProductionDate11 = Mut:UitslagPalletbladProductionDate11_DATE 
          !GLO:UitslagPalletbladSellByDate15 = Mut:UitslagPalletbladSellByDate15_DATE
          
          ReportPalletBladEnkel(WQ:PalletID, WQ:NettoGewichtKG, True, 1) ! Met Preview 
      ELSE
      	CYCLE
      .
          
    END
  ReturnValue = PARENT.TakeAccepted()
  IF SELF.Response = RequestCompleted
  	SORT(GLO:WegingQueue2, +GWQ2:ID)
  	
  	LOOP i# = RECORDS(GLO:WegingQueue2) TO 1 BY -1
  		GET(GLO:WegingQueue2, i#)
  		IF GWQ2:ID = LOC:QueueID THEN
  			DELETE(GLO:WegingQueue2)
  		.
  	END
  	
  	LOOP i# = 1 TO RECORDS(LOC:WegingQueue)
  		GET(LOC:WegingQueue, i#)
  		GWQ2:ID = LOC:QueueID
  		GWQ2:BrutoGewichtKG = WQ:BrutoGewichtKG
  		GWQ2:NettoGewichtKG = WQ:NettoGewichtKG
  		GWQ2:PalletsoortID = WQ:PalletSoortID
  		GWQ2:Palletsoort = WQ:PalletSoort
  		GWQ2:Datum = WQ:Datum
          GWQ2:Tijd = WQ:Tijd
          GWQ2:PalletID = WQ:PalletID
  		ADD(GLO:WegingQueue2)
  	END
  END
    CASE ACCEPTED()
    OF ?AAAAVVPar:PartijCelID
      IF LOC:AantalKG = 0
      	LOC:AantalKG = AAAAVVPar:VoorraadKG
      .
      IF 0{PROP:AcceptAll}=FALSE
          FDCB6.ResetQueue(false)
          Select(?CL:Locatienaam,1)
      END
    OF ?ToevoegenWeging1
      ThisWindow.Update()
      GlobalRequest = InsertRecord
      UpdateUitslagMutatieWegingQueue()
      ThisWindow.Reset
      IF GLOBALResponse = RequestCompleted THEN
          CLEAR(PLL:Record)
          Access:Pallet.Insert()
          
      	WQ:BrutoGewichtKG = WGQ:BrutoGewichtKG
      	WQ:Palletsoort = WGQ:Palletsoort
      	WQ:PalletsoortID = WGQ:PalletsoortID
      	WQ:NettoGewichtKG = WGQ:NettoGewichtKG
      	WQ:Datum = WGQ:Datum
          WQ:Tijd = WGQ:Tijd
          WQ:PalletID = PLL:PalletID
      	ADD(LOC:WegingQueue)
      .
    OF ?WijzigenWeging1
      ThisWindow.Update()
      GlobalRequest = ChangeRecord
      UpdateUitslagMutatieWegingQueue()
      ThisWindow.Reset
      IF GLOBALResponse = RequestCompleted THEN
      	WQ:BrutoGewichtKG = WGQ:BrutoGewichtKG
      	WQ:Palletsoort = WGQ:Palletsoort
      	WQ:PalletsoortID = WGQ:PalletsoortID
      	WQ:NettoGewichtKG = WGQ:NettoGewichtKG
      	WQ:Datum = WGQ:Datum
          WQ:Tijd = WGQ:Tijd
          WQ:PalletID = WGQ:PalletID
      	PUT(LOC:WegingQueue)
      .
    OF ?WeegNu1
      ThisWindow.Update()
      WeegWindow()
      ThisWindow.Reset
      IF GLOBALResponse = RequestCompleted THEN
          LOOP i# = 1 TO RECORDS(GLO:WegingQueue)
              !CLEAR(PLL:Record)
              !Access:Pallet.Insert()
              
      		WQ:BrutoGewichtKG = WGQ:BrutoGewichtKG
      		WQ:Palletsoort = WGQ:Palletsoort
      		WQ:PalletsoortID = WGQ:PalletsoortID
      		WQ:NettoGewichtKG = WGQ:NettoGewichtKG
      		WQ:Datum = WGQ:Datum
              WQ:Tijd = WGQ:Tijd
              WQ:PalletID = WGQ:PalletID
      		ADD(LOC:WegingQueue)
      	.
      .
    OF ?Ok
      ThisWindow.Update()
      ! Opslaan
      db.DebugOut('UitslagMutatieQueueWeging - OK' & ThisWindow.Request)
      IF ThisWindow.Request <> ViewRecord
          IF ThisWindow.Request = InsertRecord
              CLEAR(GLO:UitslagMutatieQueue)
              UMQ:PartijCelID=LOC:PartijCelID
              UMQ:LeverancierNaam=LOC:LeverancierFirmanaam
              UMQ:VerpakkingOmschrijving=LOC:VerpakkingOmschrijving
              UMQ:PartijID=LOC:PartijID
              UMQ:CelID=LOC:CelID
              UMQ:KG=LOC:AantalKG
              UMQ:Pallet=LOC:AantalPallets
              UMQ:CelLocatieID=Loc:CelLokatieID
              ADD(GLO:UitslagMutatieQueue)
              db.DebugOut('ADD:UitslagMutatieQueue.TakeCompleted()')
          ELSIF ThisWindow.Request = ChangeRecord
              UMQ:PartijCelID=LOC:PartijCelID
              UMQ:LeverancierNaam=LOC:LeverancierFirmanaam
              UMQ:VerpakkingOmschrijving=LOC:VerpakkingOmschrijving
              UMQ:PartijID=LOC:PartijID
              UMQ:CelID=LOC:CelID
              UMQ:CelLocatieID=Loc:CelLokatieID
              UMQ:KG=LOC:AantalKG
              UMQ:Pallet=LOC:AantalPallets
              PUT(GLO:UitslagMutatieQueue)
              db.DebugOut('PUT:UitslagMutatieQueue.TakeCompleted()')
          .
      END
    OF ?VulVanuitWeging
      ThisWindow.Update()
      LOC:AantalKG = 0
      
      LOOP i# = 1 TO RECORDS(LOC:WegingQueue)
      	GET(LOC:WegingQueue, i#)
      	LOC:AantalKG += WQ:NettoGewichtKG
      END
      
      LOC:AantalPallets = RECORDS(LOC:WegingQueue)
      
      DISPLAY(?LOC:AantalKG)
      DISPLAY(?LOC:AantalPallets)
      
      GLO:BepaalTotaal = 1
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


FDCB6.SetQueueRecord PROCEDURE

  CODE
  LOC:PartijVoorraadKG=AAAAVVPar:VoorraadKG
  LOC:PartijVoorraadPallet=AAAAVVPar:VoorraadPallets
  
  LOOP i# = 1 TO 100
  	IF LOC:OrigineelPartijCelID[i#] = AAAAVVPar:PartijCelID 
  		LOC:PartijVoorraadKG+=LOC:OrigineelKG[i#]
  		LOC:PartijVoorraadPallet+=LOC:OrigineelPallets[i#]
  		BREAK
  	END
  END
  PARENT.SetQueueRecord
  


FDCB6.ValidateRecord PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  LOC:PartijVoorraadKG=AAAAVVPar:VoorraadKG
  LOC:PartijVoorraadPallet=AAAAVVPar:VoorraadPallets
  
  LOOP i# = 1 TO 100
  	IF LOC:OrigineelPartijCelID[i#] = AAAAVVPar:PartijCelID 
  		LOC:PartijVoorraadKG+=LOC:OrigineelKG[i#]
  		LOC:PartijVoorraadPallet+=LOC:OrigineelPallets[i#]
  		BREAK
  	END
  END
  
  IF LOC:PartijVoorraadKG <= 0 THEN
  	RETURN Record:Filtered
  END
  ReturnValue = PARENT.ValidateRecord()
  RETURN ReturnValue


FDCB8.ValidateRecord PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
      Clear(VPCL:Record)
        VPCL:PartijID=SUB(LOC:PartijCelID,1,6)
        VPCL:CelID=SUB(LOC:PartijCelID,7,20)
        VPCL:CelLocatieID=CL:CelLocatieID
        if Access:ViewPartijCelLocaties.Fetch(VPCL:ViewPartijCelLocaties_PK)<>Level:Benign 
            Return Record:Filtered
        END
      
            
  ReturnValue = PARENT.ValidateRecord()
  RETURN ReturnValue


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window

