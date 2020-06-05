

   MEMBER('VoorrPln.clw')                                  ! This is a MEMBER module


   INCLUDE('ABDROPS.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('VOORRPLN025.INC'),ONCE        !Local module procedure declarations
                     END


!!! <summary>
!!! Generated from procedure template - Window
!!! Handmatige uitslag
!!! </summary>
UpdateUitslagMutatie PROCEDURE 

CurrentTab           STRING(80)                            ! 
LOC:PartijCelID2     CSTRING(26)                           ! 
LOC:PartijCelID3     CSTRING(26)                           ! 
LOC:PartijCelID4     CSTRING(26)                           ! 
Loc:Artikel          CSTRING(100)                          ! 
ActionMessage        CSTRING(40)                           ! 
Loc:ArtikelID        CSTRING(31)                           ! 
Loc:RelatieID        LONG                                  ! 
Loc:ArtikelOms       CSTRING(101)                          ! 
Loc:Leverancieroms   CSTRING(101)                          ! 
Loc:VerpakkingsID    LONG                                  ! 
Loc:VerpakkingOms    CSTRING(51)                           ! 
LOC:PartijID         LONG                                  ! 
LOC:ArtikelVoorraadKG DECIMAL(12,2)                        ! 
LOC:ArtikelVoorraadPallet LONG                             ! 
LOC:PartijVoorraadKG1 DECIMAL(9,2)                         ! 
LOC:PartijVoorraadKG2 DECIMAL(9,2)                         ! 
LOC:PartijVoorraadKG3 DECIMAL(9,2)                         ! 
LOC:PartijVoorraadKG4 DECIMAL(9,2)                         ! 
LOC:PartijVoorraadPallet1 LONG                             ! 
LOC:PartijVoorraadPallet2 LONG                             ! 
LOC:PartijVoorraadPallet3 LONG                             ! 
LOC:PartijVoorraadPallet4 LONG                             ! 
LOC:PartijCelID      CSTRING(26)                           ! 
LOC:UitslagKG1       DECIMAL(7,2)                          ! 
LOC:UitslagKG2       DECIMAL(7,2)                          ! 
LOC:UitslagKG3       DECIMAL(7,2)                          ! 
LOC:UitslagKG4       DECIMAL(7,2)                          ! 
LOC:UitslagPallet1   LONG                                  ! 
LOC:UitslagPallet2   LONG                                  ! 
LOC:UitslagPallet3   LONG                                  ! 
LOC:UitslagPallet4   LONG                                  ! 
LOC:TotaalUitslagKG  DECIMAL(9,2)                          ! 
LOC:TotaalUitslagPallet LONG                               ! 
LOC:BalansUitslagKG  DECIMAL(9,2)                          ! 
LOC:BalansUitslagPallet LONG                               ! 
LOC:CorrectieKG      DECIMAL(9,2)                          ! 
LOC:CorrectiePallets LONG                                  ! 
LOC:CMRArtikelOms    CSTRING(201)                          ! 
LOC:OudArtikelID     LONG                                  ! 
Loc:CelLocatie1      LONG                                  ! 
Loc:CelLocatie2      LONG                                  ! 
Loc:CelLocatie3      LONG                                  ! 
Loc:CelLocatie4      LONG                                  ! 
FDCB7::View:FileDropCombo VIEW(ViewVoorraadPlanning)
                       PROJECT(VVP:ArtikelID)
                       PROJECT(VVP:ArtikelOms)
                       PROJECT(VVP:InslagKG)
                       PROJECT(VVP:InslagPallets)
                       PROJECT(VVP:UitslagKG)
                       PROJECT(VVP:UitslagPallets)
                       JOIN(Art:Artikel_PK,VVP:ArtikelID)
                         PROJECT(Art:ArtikelID)
                       END
                     END
FDCB4::View:FileDropCombo VIEW(ViewVoorraadPartij)
                       PROJECT(VVPar:PartijCelID)
                       PROJECT(VVPar:PartijID)
                       PROJECT(VVPar:ExternPartijnr)
                       PROJECT(VVPar:CelOms)
                       PROJECT(VVPar:AanmaakDatum_DATE)
                       PROJECT(VVPar:BerekendeInkoopKGPrijs)
                       PROJECT(VVPar:VerpakkingOmschrijving)
                       PROJECT(VVPar:LeverancierFirmanaam)
                       PROJECT(VVPar:CelID)
                       PROJECT(VVPar:VoorraadKG)
                       PROJECT(VVPar:VoorraadPallets)
                     END
FDCB10::View:FileDropCombo VIEW(AViewVoorraadPartij)
                       PROJECT(AVVPar:PartijCelID)
                       PROJECT(AVVPar:PartijID)
                       PROJECT(AVVPar:ExternPartijnr)
                       PROJECT(AVVPar:CelOms)
                       PROJECT(AVVPar:AanmaakDatum_DATE)
                       PROJECT(AVVPar:BerekendeInkoopKGPrijs)
                       PROJECT(AVVPar:VerpakkingOmschrijving)
                       PROJECT(AVVPar:LeverancierFirmanaam)
                       PROJECT(AVVPar:VoorraadKG)
                       PROJECT(AVVPar:VoorraadPallets)
                       PROJECT(AVVPar:CelID)
                     END
FDCB11::View:FileDropCombo VIEW(AAViewVoorraadPartij)
                       PROJECT(AAVVPar:PartijCelID)
                       PROJECT(AAVVPar:PartijID)
                       PROJECT(AAVVPar:ExternPartijnr)
                       PROJECT(AAVVPar:CelOms)
                       PROJECT(AAVVPar:AanmaakDatum_DATE)
                       PROJECT(AAVVPar:BerekendeInkoopKGPrijs)
                       PROJECT(AAVVPar:VerpakkingOmschrijving)
                       PROJECT(AAVVPar:LeverancierFirmanaam)
                       PROJECT(AAVVPar:VoorraadKG)
                       PROJECT(AAVVPar:VoorraadPallets)
                       PROJECT(AAVVPar:CelID)
                     END
FDCB12::View:FileDropCombo VIEW(AAAViewVoorraadPartij)
                       PROJECT(AAAVVPar:PartijCelID)
                       PROJECT(AAAVVPar:PartijID)
                       PROJECT(AAAVVPar:ExternPartijnr)
                       PROJECT(AAAVVPar:CelOms)
                       PROJECT(AAAVVPar:AanmaakDatum_DATE)
                       PROJECT(AAAVVPar:BerekendeInkoopKGPrijs)
                       PROJECT(AAAVVPar:VerpakkingOmschrijving)
                       PROJECT(AAAVVPar:LeverancierFirmanaam)
                       PROJECT(AAAVVPar:VoorraadKG)
                       PROJECT(AAAVVPar:VoorraadPallets)
                       PROJECT(AAAVVPar:CelID)
                     END
FDCB13::View:FileDropCombo VIEW(CelLocatie)
                       PROJECT(CL:Locatienaam)
                       PROJECT(CL:CelLocatieID)
                     END
FDCB14::View:FileDropCombo VIEW(ACelLocatie)
                       PROJECT(ACL:Locatienaam)
                       PROJECT(ACL:CelLocatieID)
                     END
FDCB15::View:FileDropCombo VIEW(AACelLocatie)
                       PROJECT(AACL:Locatienaam)
                       PROJECT(AACL:CelLocatieID)
                     END
FDCB16::View:FileDropCombo VIEW(AAACelLocatie)
                       PROJECT(AAACL:Locatienaam)
                       PROJECT(AAACL:CelLocatieID)
                     END
Queue:FileDropCombo  QUEUE                            !
VVP:ArtikelID          LIKE(VVP:ArtikelID)            !List box control field - type derived from field
VVP:ArtikelOms         LIKE(VVP:ArtikelOms)           !List box control field - type derived from field
LOC:ArtikelVoorraadKG  LIKE(LOC:ArtikelVoorraadKG)    !List box control field - type derived from local data
LOC:ArtikelVoorraadPallet LIKE(LOC:ArtikelVoorraadPallet) !List box control field - type derived from local data
VVP:InslagKG           LIKE(VVP:InslagKG)             !Browse hot field - type derived from field
VVP:InslagPallets      LIKE(VVP:InslagPallets)        !Browse hot field - type derived from field
VVP:UitslagKG          LIKE(VVP:UitslagKG)            !Browse hot field - type derived from field
VVP:UitslagPallets     LIKE(VVP:UitslagPallets)       !Browse hot field - type derived from field
Art:ArtikelID          LIKE(Art:ArtikelID)            !Related join file key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
Queue:FileDropCombo:1 QUEUE                           !
VVPar:PartijCelID      LIKE(VVPar:PartijCelID)        !List box control field - type derived from field
VVPar:PartijID         LIKE(VVPar:PartijID)           !List box control field - type derived from field
VVPar:ExternPartijnr   LIKE(VVPar:ExternPartijnr)     !List box control field - type derived from field
VVPar:CelOms           LIKE(VVPar:CelOms)             !List box control field - type derived from field
VVPar:AanmaakDatum_DATE LIKE(VVPar:AanmaakDatum_DATE) !List box control field - type derived from field
VVPar:BerekendeInkoopKGPrijs LIKE(VVPar:BerekendeInkoopKGPrijs) !List box control field - type derived from field
LOC:PartijVoorraadKG1  LIKE(LOC:PartijVoorraadKG1)    !List box control field - type derived from local data
LOC:PartijVoorraadPallet1 LIKE(LOC:PartijVoorraadPallet1) !List box control field - type derived from local data
VVPar:VerpakkingOmschrijving LIKE(VVPar:VerpakkingOmschrijving) !List box control field - type derived from field
VVPar:LeverancierFirmanaam LIKE(VVPar:LeverancierFirmanaam) !List box control field - type derived from field
VVPar:CelID            LIKE(VVPar:CelID)              !Browse hot field - type derived from field
VVPar:VoorraadKG       LIKE(VVPar:VoorraadKG)         !Browse hot field - type derived from field
VVPar:VoorraadPallets  LIKE(VVPar:VoorraadPallets)    !Browse hot field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
Queue:FileDropCombo:2 QUEUE                           !
AVVPar:PartijCelID     LIKE(AVVPar:PartijCelID)       !List box control field - type derived from field
AVVPar:PartijID        LIKE(AVVPar:PartijID)          !List box control field - type derived from field
AVVPar:ExternPartijnr  LIKE(AVVPar:ExternPartijnr)    !List box control field - type derived from field
AVVPar:CelOms          LIKE(AVVPar:CelOms)            !List box control field - type derived from field
AVVPar:AanmaakDatum_DATE LIKE(AVVPar:AanmaakDatum_DATE) !List box control field - type derived from field
AVVPar:BerekendeInkoopKGPrijs LIKE(AVVPar:BerekendeInkoopKGPrijs) !List box control field - type derived from field
LOC:PartijVoorraadKG2  LIKE(LOC:PartijVoorraadKG2)    !List box control field - type derived from local data
LOC:PartijVoorraadPallet2 LIKE(LOC:PartijVoorraadPallet2) !List box control field - type derived from local data
AVVPar:VerpakkingOmschrijving LIKE(AVVPar:VerpakkingOmschrijving) !List box control field - type derived from field
AVVPar:LeverancierFirmanaam LIKE(AVVPar:LeverancierFirmanaam) !List box control field - type derived from field
AVVPar:VoorraadKG      LIKE(AVVPar:VoorraadKG)        !Browse hot field - type derived from field
AVVPar:VoorraadPallets LIKE(AVVPar:VoorraadPallets)   !Browse hot field - type derived from field
AVVPar:CelID           LIKE(AVVPar:CelID)             !Browse hot field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
Queue:FileDropCombo:3 QUEUE                           !
AAVVPar:PartijCelID    LIKE(AAVVPar:PartijCelID)      !List box control field - type derived from field
AAVVPar:PartijID       LIKE(AAVVPar:PartijID)         !List box control field - type derived from field
AAVVPar:ExternPartijnr LIKE(AAVVPar:ExternPartijnr)   !List box control field - type derived from field
AAVVPar:CelOms         LIKE(AAVVPar:CelOms)           !List box control field - type derived from field
AAVVPar:AanmaakDatum_DATE LIKE(AAVVPar:AanmaakDatum_DATE) !List box control field - type derived from field
AAVVPar:BerekendeInkoopKGPrijs LIKE(AAVVPar:BerekendeInkoopKGPrijs) !List box control field - type derived from field
LOC:PartijVoorraadKG3  LIKE(LOC:PartijVoorraadKG3)    !List box control field - type derived from local data
LOC:PartijVoorraadPallet3 LIKE(LOC:PartijVoorraadPallet3) !List box control field - type derived from local data
AAVVPar:VerpakkingOmschrijving LIKE(AAVVPar:VerpakkingOmschrijving) !List box control field - type derived from field
AAVVPar:LeverancierFirmanaam LIKE(AAVVPar:LeverancierFirmanaam) !List box control field - type derived from field
AAVVPar:VoorraadKG     LIKE(AAVVPar:VoorraadKG)       !Browse hot field - type derived from field
AAVVPar:VoorraadPallets LIKE(AAVVPar:VoorraadPallets) !Browse hot field - type derived from field
AAVVPar:CelID          LIKE(AAVVPar:CelID)            !Browse hot field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
Queue:FileDropCombo:4 QUEUE                           !
AAAVVPar:PartijCelID   LIKE(AAAVVPar:PartijCelID)     !List box control field - type derived from field
AAAVVPar:PartijID      LIKE(AAAVVPar:PartijID)        !List box control field - type derived from field
AAAVVPar:ExternPartijnr LIKE(AAAVVPar:ExternPartijnr) !List box control field - type derived from field
AAAVVPar:CelOms        LIKE(AAAVVPar:CelOms)          !List box control field - type derived from field
AAAVVPar:AanmaakDatum_DATE LIKE(AAAVVPar:AanmaakDatum_DATE) !List box control field - type derived from field
AAAVVPar:BerekendeInkoopKGPrijs LIKE(AAAVVPar:BerekendeInkoopKGPrijs) !List box control field - type derived from field
LOC:PartijVoorraadKG4  LIKE(LOC:PartijVoorraadKG4)    !List box control field - type derived from local data
LOC:PartijVoorraadPallet4 LIKE(LOC:PartijVoorraadPallet4) !List box control field - type derived from local data
AAAVVPar:VerpakkingOmschrijving LIKE(AAAVVPar:VerpakkingOmschrijving) !List box control field - type derived from field
AAAVVPar:LeverancierFirmanaam LIKE(AAAVVPar:LeverancierFirmanaam) !List box control field - type derived from field
AAAVVPar:VoorraadKG    LIKE(AAAVVPar:VoorraadKG)      !Browse hot field - type derived from field
AAAVVPar:VoorraadPallets LIKE(AAAVVPar:VoorraadPallets) !Browse hot field - type derived from field
AAAVVPar:CelID         LIKE(AAAVVPar:CelID)           !Browse hot field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
Queue:FileDropCombo:5 QUEUE                           !
CL:Locatienaam         LIKE(CL:Locatienaam)           !List box control field - type derived from field
CL:CelLocatieID        LIKE(CL:CelLocatieID)          !Primary key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
Queue:FileDropCombo:6 QUEUE                           !
ACL:Locatienaam        LIKE(ACL:Locatienaam)          !List box control field - type derived from field
ACL:CelLocatieID       LIKE(ACL:CelLocatieID)         !Primary key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
Queue:FileDropCombo:7 QUEUE                           !
AACL:Locatienaam       LIKE(AACL:Locatienaam)         !List box control field - type derived from field
AACL:CelLocatieID      LIKE(AACL:CelLocatieID)        !Primary key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
Queue:FileDropCombo:8 QUEUE                           !
AAACL:Locatienaam      LIKE(AAACL:Locatienaam)        !List box control field - type derived from field
AAACL:CelLocatieID     LIKE(AAACL:CelLocatieID)       !Primary key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
LocEnableEnterByTab  BYTE(1)                               !Used by the ENTER Instead of Tab template
EnterByTabManager    EnterByTabClass
History::Mut:Record  LIKE(Mut:RECORD),THREAD
QuickWindow          WINDOW('Form Mutatie'),AT(,,684,434),FONT('MS Sans Serif',8,,,CHARSET:DEFAULT),DOUBLE,CENTER, |
  GRAY,IMM,MDI,HLP('UpdateUitslagMutatie'),SYSTEM
                       PROMPT('Invoerdatum:'),AT(7,19),USE(?Mut:DatumTijd_DATE:Prompt),TRN
                       ENTRY(@d6-),AT(82,20,64,10),USE(Mut:DatumTijd_DATE),SKIP
                       PROMPT('Invoertijd:'),AT(166,20),USE(?Mut:DatumTijd_TIME:Prompt),TRN
                       ENTRY(@t7),AT(203,20,56,10),USE(Mut:DatumTijd_TIME),SKIP
                       PROMPT('Artikel:'),AT(7,36),USE(?PROMPT1)
                       COMBO(@s60),AT(81,36,177,10),USE(VVP:ArtikelOms),DROP(25,300),FORMAT('64L(2)|~Artikel I' & |
  'D~C(0)@s30@111L(2)|~Artikel~C(2)@s60@[54R(2)|~KG~C(0)@n12`2@60R(2)|~Pallets~C(0)@n-14.@]|'), |
  FROM(Queue:FileDropCombo),IMM
                       GROUP('Artikelomschrijving (CMR / Palletblad)'),AT(7,50,483,44),USE(?GROUP2),FONT('Microsoft ' & |
  'Sans Serif',8,,,CHARSET:DEFAULT),BOXED
                         STRING('Klant-specifieke artikelnaam:'),AT(11,62,91,10),USE(?STRING1:2)
                         STRING(@s100),AT(117,62,281),USE(LOC:CMRArtikelOms),FONT('Microsoft Sans Serif',,,FONT:regular), |
  LEFT
                         PROMPT('Artikelomschrijving:'),AT(10,78,103,12),USE(?Pla:AlternatieveArtikelOms:Prompt)
                         ENTRY(@s200),AT(157,79,241,10),USE(Mut:AlternatieveArtikelOms)
                         BUTTON,AT(117,77,33,14),USE(?OvernemenButton),FONT('Microsoft Sans Serif',,COLOR:BTNFACE,FONT:regular), |
  ICON('overnemen.png'),TIP('Overnemen klant-specifieke artikelnaam')
                         BUTTON('Wijzigen'),AT(405,60,57,14),USE(?ChangeCMRArtikel),FONT('Microsoft Sans Serif',,,FONT:regular), |
  LEFT,ICON('WAChange.ico')
                       END
                       STRING('KG'),AT(409,97),USE(?STRING1)
                       STRING('Pallets'),AT(470,97),USE(?STRING2)
                       PROMPT('Partijen:'),AT(3,124),USE(?PROMPT2)
                       COMBO(@s25),AT(77,126,276,10),USE(VVPar:PartijCelID),VSCROLL,DROP(5,400),FORMAT('0L(2)|~Par' & |
  'tij.Cel~C(0)@s25@[45R(2)|~Intern~C(0)@n_10@45R(2)|~Extern~C(0)@s20@](90)|~Partijnumm' & |
  'er~45L(2)|~Cel~C(0)@s50@46R(2)|~Inslagdatum~C(0)@d17@52R(2)|~Inkoop KG-Prijs~C(0)@n1' & |
  '3`3@[49R(2)|M~KG~C(1)@n-12`2@60R(2)|M~Pallets~C(1)@n-14.@](101)|~Voorraad~50L(2)|~Ve' & |
  'rpakking~C(0)@s50@50L(2)|~Leverancier~C(0)@s50@'),FROM(Queue:FileDropCombo:1),IMM
                       PROMPT('Cel:'),AT(81,160),USE(?PROMPT3)
                       ENTRY(@n12_`2),AT(365,126,54,10),USE(Mut:UitslagKG),RIGHT
                       ENTRY(@n11.),AT(432,126,60,10),USE(Mut:UitslagPallet),RIGHT
                       COMBO(@s50),AT(126,170,227,10),USE(CL:Locatienaam),DROP(5),FORMAT('200L(2)|M~Locatienaam~@s50@'), |
  FROM(Queue:FileDropCombo:5),IMM
                       PROMPT('Leverancier:'),AT(80,138),USE(?PROMPT4)
                       PROMPT('Verpakking:'),AT(80,149),USE(?PROMPT5)
                       STRING(@s50),AT(125,138,233),USE(VVPar:LeverancierFirmanaam)
                       STRING(@s50),AT(125,149,234),USE(VVPar:VerpakkingOmschrijving)
                       STRING(@s50),AT(125,160,234),USE(VVPar:CelOms)
                       STRING(@s50),AT(265,36,213),USE(Art:ArtikelOms)
                       STRING(@S50),AT(80,4,226),USE(AREL:FirmaNaam)
                       PROMPT('Klant:'),AT(7,4),USE(?PROMPT6)
                       COMBO(@s25),AT(77,183,275,10),USE(AVVPar:PartijCelID),VSCROLL,DROP(5,400),FORMAT('0L(2)|~Par' & |
  'tij.Cel~C(0)@s25@[45R(2)|~Intern~C(0)@n_10@45R(2)|~Extern~C(0)@s20@](90)|~Partijnumm' & |
  'er~45L(2)|~Cel~C(0)@s50@46R(2)|~Inslagdatum~C(0)@d17@52R(2)|~Inkoop KG-Prijs~C(0)@n1' & |
  '3`3@[49R(2)|M~KG~C(1)@n-12`2@60R(2)|M~Pallets~C(1)@n-14.@](101)|~Voorraad~50L(2)|~Ve' & |
  'rpakking~C(0)@s50@50L(2)|~Leverancier~C(0)@s50@'),FROM(Queue:FileDropCombo:2),IMM
                       ENTRY(@n12_`2),AT(365,183,53,10),USE(LOC:UitslagKG2),RIGHT
                       ENTRY(@n11.),AT(432,183,60,10),USE(LOC:UitslagPallet2),RIGHT
                       COMBO(@s50),AT(126,225,227,10),USE(ACL:Locatienaam),DROP(5),FORMAT('200L(2)|M~Locatiena' & |
  'am~L(0)@s50@'),FROM(Queue:FileDropCombo:6),IMM
                       COMBO(@s25),AT(77,239,275,10),USE(AAVVPar:PartijCelID),VSCROLL,DROP(5,400),FORMAT('0L(2)|~Par' & |
  'tij.Cel~C(0)@s25@[45R(2)|~Intern~C(0)@n_10@45R(2)|~Extern~C(0)@s20@](90)|~Partijnumm' & |
  'er~45L(2)|~Cel~C(0)@s50@46R(2)|~Inslagdatum~C(0)@d17@52R(2)|~Inkoop-KG Prijs~C(0)@n1' & |
  '3`3@[49R(2)|M~KG~C(1)@n-12`2@60R(2)|M~Pallets~C(1)@n-14.@](101)|~Voorraad~50L(2)|~Ve' & |
  'rpakking~C(0)@s50@50L(2)|~Leverancier~C(0)@s50@'),FROM(Queue:FileDropCombo:3),IMM
                       ENTRY(@n12_`2),AT(365,239,53,10),USE(LOC:UitslagKG3),RIGHT
                       ENTRY(@n11.),AT(429,239,60,10),USE(LOC:UitslagPallet3),RIGHT
                       COMBO(@s50),AT(126,284,227,10),USE(AACL:Locatienaam),DROP(5),FORMAT('200L(2)|M~Locatien' & |
  'aam~L(0)@s50@'),FROM(Queue:FileDropCombo:7),IMM
                       ENTRY(@n12_`2),AT(365,298,53,10),USE(LOC:UitslagKG4),RIGHT
                       ENTRY(@n11.),AT(432,298,60,10),USE(LOC:UitslagPallet4),RIGHT
                       COMBO(@s25),AT(79,298,275,10),USE(AAAVVPar:PartijCelID),VSCROLL,DROP(5,400),FORMAT('0L(2)|~Par' & |
  'tij.Cel~C(0)@s25@[45R(2)|~Intern~C(0)@n_10@45R(2)|~Extern~C(0)@s20@](90)|~Partijnumm' & |
  'er~45L(2)|~Cel~C(0)@s50@46R(2)|~Inslagdatum~C(0)@d17@52R(2)|~Inkoop KG-Prijs~C(0)@n1' & |
  '3`3@[49R(2)|M~KG~C(1)@n-12`2@60R(2)|M~Pallets~C(1)@n-14.@](101)|~Voorraad~50L(2)|~Ve' & |
  'rpakking~C(0)@s50@50L(2)|~Leverancier~C(0)@s50@'),FROM(Queue:FileDropCombo:4),IMM
                       COMBO(@s50),AT(126,340,227,10),USE(AAACL:Locatienaam),DROP(5),FORMAT('200L(2)|M~Locatie' & |
  'naam~L(0)@s50@'),FROM(Queue:FileDropCombo:8),IMM
                       PROMPT('Leverancier:'),AT(80,194),USE(?PROMPT7)
                       PROMPT('Verpakking:'),AT(80,206),USE(?PROMPT8)
                       PROMPT('Cel:'),AT(80,216),USE(?PROMPT9)
                       STRING(@S50),AT(125,194,201),USE(AVVPar:LeverancierFirmanaam)
                       STRING(@S50),AT(125,206,201),USE(AVVPar:VerpakkingOmschrijving)
                       STRING(@S50),AT(125,216,201),USE(AVVPar:CelOms)
                       PROMPT('Leverancier:'),AT(79,250),USE(?PROMPT10)
                       PROMPT('Verpakking:'),AT(80,260),USE(?PROMPT11)
                       PROMPT('Cel:'),AT(80,270),USE(?PROMPT12)
                       STRING(@S50),AT(124,250,202),USE(AAVVPar:LeverancierFirmanaam)
                       STRING(@S50),AT(124,260,203),USE(AAVVPar:VerpakkingOmschrijving)
                       STRING(@S50),AT(124,270,201,10),USE(AAVVPar:CelOms)
                       PROMPT('Leverancier:'),AT(79,310),USE(?PROMPT13)
                       PROMPT('Verpakking:'),AT(79,319,40,10),USE(?PROMPT14)
                       PROMPT('Cel:'),AT(79,330,40,10),USE(?PROMPT15)
                       STRING(@s50),AT(125,310,200),USE(AAAVVPar:LeverancierFirmanaam)
                       STRING(@S50),AT(125,319,201),USE(AAAVVPar:VerpakkingOmschrijving)
                       STRING(@S50),AT(125,330,201),USE(AAAVVPar:CelOms)
                       PROMPT('KGVerschil'),AT(384,402),USE(?KGBalans),FONT('Microsoft Sans Serif',,,FONT:regular), |
  RIGHT
                       PROMPT('PalletVerschil'),AT(448,402),USE(?PalletsBalans)
                       BUTTON('&OK'),AT(389,419,49,14),USE(?OK),LEFT,ICON('WAOK.ICO'),DEFAULT,FLAT,MSG('Accept dat' & |
  'a and close the window'),TIP('Accept data and close the window')
                       BUTTON('&Annuleer'),AT(441,419,52,14),USE(?Cancel),LEFT,ICON('WACANCEL.ICO'),FLAT,MSG('Cancel operation'), |
  TIP('Cancel operation')
                       ENTRY(@n11.),AT(431,108,60,10),USE(LOC:TotaalUitslagPallet),RIGHT
                       ENTRY(@n12_`2),AT(364,108,54,10),USE(LOC:TotaalUitslagKG),RIGHT
                       LIST,AT(79,354,413,40),USE(?UitslagMutatieList),VSCROLL,FORMAT('66L(2)|~Partij / Cel-ID' & |
  '~C(0)@s25@88L(2)|~Leverancier~C(0)@s50@89L(2)|~Verpakking~C(0)@s50@0L(2)|@n-14@0L(2)' & |
  '@n-14@0L(2)@s50@53R(2)|~KG~C(0)@n-13`2@56R(2)|~Pallets~C(1)@n-13.@0R(2)|~Cel Locatie' & |
  ' ID~C(1)@n-14@200L(2)|~Locatie Naam~@s50@'),FROM(GLO:UitslagMutatieQueue)
                       BUTTON('Toevoegen'),AT(77,399),USE(?InsertButton)
                       BUTTON('&Verwijderen'),AT(184,399),USE(?DeleteButton)
                       BUTTON('&Wijzigen'),AT(132,399,48,14),USE(?ChangeButton)
                       GROUP('Kwaliteit'),AT(501,4,176,428),USE(?GROUP1),BOXED
                         CHECK('Is transportmiddel schoon?'),AT(506,13),USE(Mut:UitslagQATransportmiddelSchoon),VALUE('1', |
  '0')
                         CHECK('Is verpakking schoon en gesloten?'),AT(506,25),USE(Mut:UitslagQAVerpakkingSchoonGesloten), |
  VALUE('1','0')
                         CHECK('Identificatie merken aanwezig op verpakkingen?'),AT(506,36,167),USE(Mut:UitslagQAIdentificatieMerkenVerpakking), |
  VALUE('1','0')
                         PROMPT('Uitgevoerd Door:'),AT(507,69),USE(?Mut:UitslagQAUitgevoerdDoor:Prompt)
                         ENTRY(@s40),AT(563,69,109,10),USE(Mut:UitslagQAUitgevoerdDoor)
                         PROMPT('Gemeten temperaturen:'),AT(506,79),USE(?Mut:UitslagQATemperatuur1:Prompt)
                         ENTRY(@s20),AT(507,90,50,10),USE(Mut:UitslagQATemperatuur1)
                         ENTRY(@s20),AT(563,90,50,10),USE(Mut:UitslagQATemperatuur2)
                         ENTRY(@s20),AT(622,90,50,10),USE(Mut:UitslagQATemperatuur3)
                         ENTRY(@s20),AT(613,102,60,10),USE(Mut:UitslagQATemperatuurVervoermiddel)
                         PROMPT('Afwijking:'),AT(506,111),USE(?Mut:UitslagQAActieAfwijkingen:Prompt)
                         TEXT,AT(508,122,165,38),USE(Mut:UitslagQAActieAfwijkingen),VSCROLL
                         PROMPT('Corrigerende Maatregel / voorkomen:'),AT(506,326),USE(?Mut:CorrigerendeMaatregel:Prompt)
                         PROMPT('Afgehandeld:'),AT(506,380),USE(?Mut:Afgehandeld:Prompt)
                         PROMPT('Oorzaak:'),AT(506,161),USE(?Mut:Oorzaak:Prompt)
                         TEXT,AT(508,172,165,38),USE(Mut:Oorzaak),VSCROLL
                         PROMPT('Transport Bedrijf:'),AT(506,215),USE(?Mut:Oorzaak:Prompt:2)
                         TEXT,AT(508,228,165,38),USE(Mut:TransportBedrijf),VSCROLL
                         TEXT,AT(508,284,165,38),USE(Mut:CorrectieveMaatregel,,?Mut:CorrectieveMaatregel:2),HVSCROLL
                         TEXT,AT(508,337,165,38),USE(Mut:CorrigerendeMaatregel,,?Mut:CorrigerendeMaatregel:2),VSCROLL
                         TEXT,AT(508,389,165,38),USE(Mut:Afgehandeld,,?Mut:Afgehandeld:2),VSCROLL
                         CHECK('Is geur/kleur producteigen?'),AT(506,46),USE(Mut:UitslagQAIsGeurKleurProductEigen)
                         CHECK('Geen glasbreuk?'),AT(506,57),USE(Mut:UitslagQAGeenGlasbreuk)
                         PROMPT('CorrectieveMaatregel / Direct actie'),AT(506,271),USE(?Mut:CorrectieveMaatregel:Prompt)
                         PROMPT('Temperatuur Vervoermiddel:'),AT(506,102),USE(?Mut:UitslagQATemperatuurVervoermiddel:Prompt)
                       END
                       BUTTON('Neem Voorraad'),AT(363,138,131,23),USE(?NeemVoorraaadButton)
                       BUTTON('Neem Voorraad'),AT(364,196,129,25),USE(?NeemVoorraaadButton:2)
                       BUTTON('Neem Voorraad'),AT(364,251,127,27),USE(?NeemVoorraaadButton:3)
                       BUTTON('Neem Voorraad'),AT(365,311,129,26),USE(?NeemVoorraaadButton:4)
                       PROMPT('Locatie:'),AT(80,171),USE(?PROMPT16)
                       PROMPT('Locatie:'),AT(78,226),USE(?PROMPT16:2)
                       PROMPT('Locatie:'),AT(80,285),USE(?PROMPT16:3)
                       PROMPT('Locatie:'),AT(78,340),USE(?PROMPT16:4)
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
ControleerDuplicaat    PROCEDURE(STRING PRM:PartijCelID),LONG ! New method added to this class instance
BepaalCorrectieVoorraad PROCEDURE(STRING PRM:PartijCelID)  ! New method added to this class instance
                     END

Toolbar              ToolbarClass
Resizer              CLASS(WindowResizeClass)
Init                   PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)
                     END

FDCB7                CLASS(FileDropComboClass)             ! File drop combo manager
Q                      &Queue:FileDropCombo           !Reference to browse queue type
SetQueueRecord         PROCEDURE(),DERIVED
ValidateRecord         PROCEDURE(),BYTE,DERIVED
                     END

FDCB4                CLASS(FileDropComboClass)             ! File drop combo manager
Q                      &Queue:FileDropCombo:1         !Reference to browse queue type
SetQueueRecord         PROCEDURE(),DERIVED
ValidateRecord         PROCEDURE(),BYTE,DERIVED
                     END

FDCB10               CLASS(FileDropComboClass)             ! File drop combo manager
Q                      &Queue:FileDropCombo:2         !Reference to browse queue type
SetQueueRecord         PROCEDURE(),DERIVED
ValidateRecord         PROCEDURE(),BYTE,DERIVED
                     END

FDCB11               CLASS(FileDropComboClass)             ! File drop combo manager
Q                      &Queue:FileDropCombo:3         !Reference to browse queue type
SetQueueRecord         PROCEDURE(),DERIVED
ValidateRecord         PROCEDURE(),BYTE,DERIVED
                     END

FDCB12               CLASS(FileDropComboClass)             ! File drop combo manager
Q                      &Queue:FileDropCombo:4         !Reference to browse queue type
SetQueueRecord         PROCEDURE(),DERIVED
ValidateRecord         PROCEDURE(),BYTE,DERIVED
                     END

FDCB13               CLASS(FileDropComboClass)             ! File drop combo manager
Q                      &Queue:FileDropCombo:5         !Reference to browse queue type
ValidateRecord         PROCEDURE(),BYTE,DERIVED
                     END

FDCB14               CLASS(FileDropComboClass)             ! File drop combo manager
Q                      &Queue:FileDropCombo:6         !Reference to browse queue type
ValidateRecord         PROCEDURE(),BYTE,DERIVED
                     END

FDCB15               CLASS(FileDropComboClass)             ! File drop combo manager
Q                      &Queue:FileDropCombo:7         !Reference to browse queue type
ValidateRecord         PROCEDURE(),BYTE,DERIVED
                     END

FDCB16               CLASS(FileDropComboClass)             ! File drop combo manager
Q                      &Queue:FileDropCombo:8         !Reference to browse queue type
ValidateRecord         PROCEDURE(),BYTE,DERIVED
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
BerekenTotaal ROUTINE
	LOC:BalansUitslagKG = LOC:TotaalUitslagKG - (Mut:UitslagKG+LOC:UitslagKG2+LOC:UitslagKG3+LOC:UitslagKG4)
	LOC:BalansUitslagPallet = LOC:TotaalUitslagPallet - (Mut:UitslagPallet+LOC:UitslagPallet2+LOC:UitslagPallet3+LOC:UitslagPallet4)
	
	LOOP i# = 1 TO RECORDS(GLO:UitslagMutatieQueue)
		GET(GLO:UitslagMutatieQueue, i#)
		LOC:BalansUitslagKG -= UMQ:KG
		LOC:BalansUitslagPallet -= UMQ:Pallet
	.
	
	IF LOC:BalansUitslagKG = 0
		?KGBalans{Prop:Text} = 'Klopt'
	ELSE
		?KGBalans{Prop:Text} = FORMAT(LOC:BalansUitslagKG, @n-10`2)
	.
	
	IF LOC:BalansUitslagPallet = 0
		?PalletsBalans{Prop:Text} = 'Klopt'
	ELSE
		?PalletsBalans{Prop:Text} = FORMAT(LOC:BalansUitslagPallet, @n-14.)
    .
    
    !ThisWindow.Reset(1)
	
	EXIT
WisMutaties ROUTINE
	! Vullen regels
	IF Mut:PlanningID <> 0
	   Clear(AMut:Record)
	   AMut:PlanningID = Mut:PlanningID
	   SET(AMut:Mutatie_FK02, AMut:Mutatie_FK02)
	   LOOP
		   IF NOT(Access:AMutatie.Next() = Level:Benign) THEN BREAK.
		   IF NOT(AMut:PlanningID = Mut:PlanningID) THEN BREAK.
		   ! Huidige mutatie die geupdated wordt niet verwijderen
		   IF (AMut:MutatieID=Mut:MutatieID) THEN CYCLE.
		   
		   db.DebugOut('Wis mutatie ' & AMut:MutatieID)
		   Access:AMutatie.DeleteRecord(false)
		END
	END
	EXIT
WisRareMutaties     ROUTINE
	! Rare mutaties met leeg artikelID en Mutatie-soort worden verwijderd
 	Clear(AMut:Record)
	SET(AMut:Mutatie_FK03, AMut:Mutatie_FK03)
	LOOP
	   	IF NOT(Access:AMutatie.Next() = Level:Benign) THEN BREAK.
		IF NOT(AMut:ArtikelID = '') THEN BREAK.
		IF NOT(AMut:SoortMutatie = '') THEN CYCLE.
	   
	   	db.DebugOut('Wis mutatie ' & AMut:MutatieID)
	   	Access:AMutatie.DeleteRecord(false)
	END
	EXIT
OphalenTemperaturen ROUTINE
    ! Temperatuur
    IF CLIP(Mut:UitslagQATemperatuur1) = '' AND CLIP(Mut:UitslagQATemperatuur2) = '' AND CLIP(Mut:UitslagQATemperatuur3) = '' THEN
        APla:PlanningID = Mut:PlanningID
        IF Access:APlanning.TryFetch(APla:PK_Planning) = Level:Benign
            ! Verkoop ophalen gelukt
            verkoopid# = APla:VerkoopID
            
            CLEAR(APla:Record)
            APla:VerkoopID = verkoopid#
            SET(APla:Planning_FK02, APla:Planning_FK02)
            LOOP UNTIL Access:APlanning.Next()
                IF APla:VerkoopID <> verkoopid# THEN BREAK.
                
                CLEAR(AMut:Record)
                AMut:PlanningID = APla:PlanningID
                SET(AMut:Mutatie_FK02, AMut:Mutatie_FK02)
                LOOP UNTIL Access:AMutatie.Next()
                    IF AMut:PlanningID <> APla:PlanningID THEN BREAK.
                    
                    IF CLIP(AMut:UitslagQATemperatuur1) <> '' OR CLIP(AMut:UitslagQATemperatuur2) <> '' OR CLIP(AMut:UitslagQATemperatuur3) <> '' THEN
                        Mut:UitslagQATemperatuur1 = AMut:UitslagQATemperatuur1
                        Mut:UitslagQATemperatuur2 = AMut:UitslagQATemperatuur2
                        Mut:UitslagQATemperatuur3 = AMut:UitslagQATemperatuur3
                        EXIT
                    END
                END
            END
        END
    END     
    EXIT
    
BepaalCMRArtikelOms ROUTINE
    LOC:CMRArtikelOms = GlobalClass.CMRArtikelOms(Ver2:Klant, Mut:ArtikelID)
    DISPLAY(?LOC:CMRArtikelOms)
    EXIT

ThisWindow.Ask PROCEDURE

  CODE
  CASE SELF.Request                                        ! Configure the action message text
  OF ViewRecord
    ActionMessage = 'View Record'
  OF InsertRecord
    ActionMessage = 'Uitslag toevoegen'
  OF ChangeRecord
    ActionMessage = 'Uitslag wijzigen'
  END
  QuickWindow{PROP:Text} = ActionMessage                   ! Display status message in title bar
  PARENT.Ask


ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('UpdateUitslagMutatie')
      db.DebugOut('start init')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Mut:DatumTijd_DATE:Prompt
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('LOC:PartijCelID',LOC:PartijCelID)                  ! Added by: FileDropCombo(ABC)
  BIND('LOC:PartijCelID2',LOC:PartijCelID2)                ! Added by: FileDropCombo(ABC)
  BIND('LOC:PartijCelID3',LOC:PartijCelID3)                ! Added by: FileDropCombo(ABC)
  BIND('LOC:PartijCelID4',LOC:PartijCelID4)                ! Added by: FileDropCombo(ABC)
  BIND('LOC:ArtikelVoorraadKG',LOC:ArtikelVoorraadKG)      ! Added by: FileDropCombo(ABC)
  BIND('LOC:ArtikelVoorraadPallet',LOC:ArtikelVoorraadPallet) ! Added by: FileDropCombo(ABC)
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.HistoryKey = CtrlH
  SELF.AddHistoryFile(Mut:Record,History::Mut:Record)
  SELF.AddHistoryField(?Mut:DatumTijd_DATE,4)
  SELF.AddHistoryField(?Mut:DatumTijd_TIME,5)
  SELF.AddHistoryField(?Mut:AlternatieveArtikelOms,40)
  SELF.AddHistoryField(?Mut:UitslagKG,10)
  SELF.AddHistoryField(?Mut:UitslagPallet,11)
  SELF.AddHistoryField(?Mut:UitslagQATransportmiddelSchoon,20)
  SELF.AddHistoryField(?Mut:UitslagQAVerpakkingSchoonGesloten,21)
  SELF.AddHistoryField(?Mut:UitslagQAIdentificatieMerkenVerpakking,22)
  SELF.AddHistoryField(?Mut:UitslagQAUitgevoerdDoor,27)
  SELF.AddHistoryField(?Mut:UitslagQATemperatuur1,23)
  SELF.AddHistoryField(?Mut:UitslagQATemperatuur2,24)
  SELF.AddHistoryField(?Mut:UitslagQATemperatuur3,25)
  SELF.AddHistoryField(?Mut:UitslagQATemperatuurVervoermiddel,51)
  SELF.AddHistoryField(?Mut:UitslagQAActieAfwijkingen,26)
  SELF.AddHistoryField(?Mut:Oorzaak,60)
  SELF.AddHistoryField(?Mut:TransportBedrijf,61)
  SELF.AddHistoryField(?Mut:CorrectieveMaatregel:2,50)
  SELF.AddHistoryField(?Mut:CorrigerendeMaatregel:2,46)
  SELF.AddHistoryField(?Mut:Afgehandeld:2,47)
  SELF.AddHistoryField(?Mut:UitslagQAIsGeurKleurProductEigen,48)
  SELF.AddHistoryField(?Mut:UitslagQAGeenGlasbreuk,49)
  SELF.AddUpdateFile(Access:Mutatie)
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  Relate:AAAAViewVoorraadPartij.Open                       ! File AAAAViewVoorraadPartij used by this procedure, so make sure it's RelationManager is open
  Relate:AAACelLocatie.Open                                ! File AAACelLocatie used by this procedure, so make sure it's RelationManager is open
  Relate:AAAViewVoorraadPartij.Open                        ! File AAAViewVoorraadPartij used by this procedure, so make sure it's RelationManager is open
  Relate:AACelLocatie.Open                                 ! File AACelLocatie used by this procedure, so make sure it's RelationManager is open
  Relate:AAViewVoorraadPartij.Open                         ! File AAViewVoorraadPartij used by this procedure, so make sure it's RelationManager is open
  Relate:ACelLocatie.Open                                  ! File ACelLocatie used by this procedure, so make sure it's RelationManager is open
  Relate:AMutatie.Open                                     ! File AMutatie used by this procedure, so make sure it's RelationManager is open
  Relate:APlanning.Open                                    ! File APlanning used by this procedure, so make sure it's RelationManager is open
  Relate:ARelatie.Open                                     ! File ARelatie used by this procedure, so make sure it's RelationManager is open
  Relate:AVerkoop.Open                                     ! File AVerkoop used by this procedure, so make sure it's RelationManager is open
  Relate:AViewVoorraadPartij.Open                          ! File AViewVoorraadPartij used by this procedure, so make sure it's RelationManager is open
  Relate:CelLocatie.SetOpenRelated()
  Relate:CelLocatie.Open                                   ! File CelLocatie used by this procedure, so make sure it's RelationManager is open
  Relate:Mutatie.Open                                      ! File Mutatie used by this procedure, so make sure it's RelationManager is open
  Relate:Planning.SetOpenRelated()
  Relate:Planning.Open                                     ! File Planning used by this procedure, so make sure it's RelationManager is open
  Relate:RelatieArtikelOmschrijving.Open                   ! File RelatieArtikelOmschrijving used by this procedure, so make sure it's RelationManager is open
  Relate:ViewPartijCelLocaties.Open                        ! File ViewPartijCelLocaties used by this procedure, so make sure it's RelationManager is open
  Relate:ViewVoorraadPartij.Open                           ! File ViewVoorraadPartij used by this procedure, so make sure it's RelationManager is open
  Relate:ViewVoorraadPlanning.Open                         ! File ViewVoorraadPlanning used by this procedure, so make sure it's RelationManager is open
  Access:Verkoop.UseFile                                   ! File referenced in 'Other Files' so need to inform it's FileManager
  SELF.FilesOpened = True
  SELF.Primary &= Relate:Mutatie
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
  SELF.Open(QuickWindow)                                   ! Open window
  	IF IGB:BekijkenPrijzen <> 1 THEN
  		! Prijzen niet tonen
  		?VVPar:PartijCelID{PROPLIST:Width, 6} = 0
  		?AVVPar:PartijCelID{PROPLIST:Width, 6} = 0
  		?AAVVPar:PartijCelID{PROPLIST:Width, 6} = 0
  		?AAAVVPar:PartijCelID{PROPLIST:Width, 6} = 0
  	END
  
      db.DebugOut('VulMutatie1:'& Mut:MutatieID& ','& Mut:PlanningID)
      ThisWindow.AutoRefresh=FALSE
      DO OphalenTemperaturen
      FREE(PartijCelLocatiesQ)
  	IF Self.Request=ChangeRecord OR SELF.Request = ViewRecord
  		Clear(PAR:Record)
  		Par:PartijID = Mut:PartijID
  		Access:Partij.TryFetch(Par:Partij_PK)
  		
  		Loc:ArtikelID = Par:ArtikelID
  		Loc:RelatieID = Par:Leverancier
  		Loc:VerpakkingsID = Par:VerpakkingID
  		LOC:PartijCelID = CLIP(FORMAT(Mut:PartijID, @N05)) & '.' & CLIP(Mut:CelID)
  		Loc:CelLocatie1=Mut:CelLocatieID
  		! Opslaan bestaande uitslag om rekening mee te houden
  		! bij het controleren van de voorraad
  		LOC:OrigineelArtikelID=Mut:ArtikelID
  		LOC:OrigineelPartijCelID[1]=LOC:PartijCelID
  		LOC:OrigineelKG[1]=Mut:UitslagKG
  		LOC:OrigineelPallets[1]=Mut:UitslagPallet
  		
  		LOOP i# = 2 TO 100
  			LOC:OrigineelPartijCelID[i#]=''
  			LOC:OrigineelKG[i#] = 0
  			LOC:OrigineelPallets[i#] = 0
  		END
  
  		CLEAR(VVP:Record)
  		VVP:ArtikelID=Loc:ArtikelID
  		Access:ViewVoorraadPlanning.TryFetch(VVP:ViewVoorraad_PK)
  		
  		CLEAR(VVPar:Record)
  		VVPar:PartijCelID = LOC:PartijCelID
  		Access:ViewVoorraadPartij.TryFetch(VVPar:PartijCelID_K)
  
  		CLEAR(AVVPar:Record)
  		CLEAR(AAVVPar:Record)
  		CLEAR(AAAVVPar:Record)
  		
  		! Vullen van rest uit de overige mutaties
  		db.DebugOut('VulMutatie1:'&Mut:PlanningID)
  		
  		FREE(GLO:UitslagMutatieQueue)
  
  		IF (Mut:PlanningID <> 0)
  		   LOC:AantalOrigineel = 2
  		   CLEAR(AMut:Record)
  		   AMut:PlanningID = Mut:PlanningID
  		   SET(AMut:Mutatie_FK02, AMut:Mutatie_FK02)
  		   LOOP
  			   Access:AMutatie.Next()
  			   IF ERROR() THEN BREAK.
  			   IF AMut:PlanningID <> Mut:PlanningID THEN BREAK.
  			   IF AMut:MutatieID = Mut:MutatieID THEN CYCLE.
  			   
  			   LOC:OrigineelPartijCelID[i#]=CLIP(FORMAT(AMut:PartijID, @N05)) & '.' & CLIP(AMut:CelID)
  			   LOC:OrigineelKG[LOC:AantalOrigineel] = AMut:UitslagKG
  			   LOC:OrigineelPallets[LOC:AantalOrigineel] = AMut:UitslagPallet
  			   db.DebugOut('VulMutatie2:'&LOC:OrigineelPartijCelID[LOC:AantalOrigineel]&','&LOC:OrigineelKG[LOC:AantalOrigineel]&','&LOC:OrigineelPallets[LOC:AantalOrigineel])
  			   
  			   CASE LOC:AantalOrigineel
  			   OF 2
  				   LOC:PartijCelID2 = LOC:OrigineelPartijCelID[LOC:AantalOrigineel]
  				   LOC:UitslagKG2 = AMut:UitslagKG
                      LOC:UitslagPallet2 = AMut:UitslagPallet
                      Loc:CelLocatie2=AMut:CelLocatieID
  			   OF 3
  				   LOC:PartijCelID3 = LOC:OrigineelPartijCelID[LOC:AantalOrigineel]
  				   LOC:UitslagKG3 = AMut:UitslagKG
  				   LOC:UitslagPallet3 = AMut:UitslagPallet
                      Loc:CelLocatie3=AMut:CelLocatieID
  			   OF 4
  				   LOC:PartijCelID4 = LOC:OrigineelPartijCelID[LOC:AantalOrigineel]
  				   LOC:UitslagKG4 = AMut:UitslagKG
                      LOC:UitslagPallet4 = AMut:UitslagPallet
                      Loc:CelLocatie4=AMut:CelLocatieID
  				ELSE
  					CLEAR(AAAAVVPar:Record)
  					AAAAVVPar:PartijCelID = LOC:OrigineelPartijCelID[LOC:AantalOrigineel]
  					Access:AAAAViewVoorraadPartij.TryFetch(AAAAVVPar:PartijCelID_K)
  					
  					CLEAR(GLO:UitslagMutatieQueue)
  					UMQ:PartijCelID = LOC:OrigineelPartijCelID[LOC:AantalOrigineel]
  					UMQ:LeverancierNaam = AAAAVVPar:LeverancierFirmanaam
  					UMQ:VerpakkingOmschrijving = AAAAVVPar:VerpakkingOmschrijving
  					UMQ:PartijID = AMut:PartijID
  					UMQ:CelID = AMut:CelID
  					UMQ:KG = AMut:UitslagKG
                      UMQ:Pallet = AMut:UitslagPallet
                      UMQ:CelLocatieID=AMut:CelLocatieID
  					ADD(GLO:UitslagMutatieQueue)
  			   .
  			   
  			   LOC:AantalOrigineel += 1
  		   END
  		   
  		   LOC:TotaalUitslagKG = 0
  		   LOC:TotaalUitslagPallet = 0
  		   LOOP i# = 1 TO LOC:AantalOrigineel           ! was 100
  			   LOC:TotaalUitslagKG += LOC:OrigineelKG[i#]
  			   LOC:TotaalUitslagPallet += LOC:OrigineelPallets[i#]
  		   END
  		END
  	ELSIF SELF.Request=InsertRecord
  		FREE(GLO:UitslagMutatieQueue)
  		
  		Loc:ArtikelID = PLA:ArtikelID
  		Loc:VerpakkingsID = PLA:VerpakkingID
  	!	Loc:RelatieID = Par:Leverancier
  		LOC:PartijCelID = CLIP(FORMAT(Pla:PartijID,@N05)) & '.' & CLIP(Pla:CelID)
  	
  		! Geen bestaande uitslag om rekening mee te houden
  		! bij het controleren van de voorraad
  	    LOC:AantalOrigineel = 0
  		LOC:OrigineelArtikelID=''
  		LOOP i# = 1 TO 100
  			LOC:OrigineelPartijCelID[i#]=''
  			LOC:OrigineelKG[i#] = 0
  			LOC:OrigineelPallets[i#] = 0
  		END
  		VVPar:PartijCelID = LOC:PartijCelID
  		Access:ViewVoorraadPartij.TryFetch(VVPar:PartijCelID_K)
  		
  		CLEAR(AVVPar:Record)
  		CLEAR(AAVVPar:Record)
  		CLEAR(AAAVVPar:Record)
  		
  		Mut:PartijID = Pla:PartijID
  		Mut:CelID = Pla:CelID
          Mut:PlanningID = Pla:PlanningID
          IF Pla:CelLocatieID<>0
              Loc:CelLocatie1=Pla:CelLocatieID
          ELSIF VVPar:CelLocatieID<>0
              Loc:CelLocatie1=VVPar:CelLocatieID
          ELSE
              Clear(VPCL:Record)
              VPCL:PartijID=Pla:PartijID
              VPCL:CelID=Pla:CelID
              Set(VPCL:ViewPartijCelLocaties_PK,VPCL:ViewPartijCelLocaties_PK)
              IF Access:ViewPartijCelLocaties.Next()=Level:Benign AND VPCL:PartijID=Pla:PartijID |
                  AND VPCL:CelID=Pla:CelID
                  Loc:CelLocatie1 = VPCL:CelLocatieID
                  IF VPCL:KG<Mut:UitslagKG AND VPCL:Pallet<Mut:UitslagPallet
                      Mut:UitslagKG=VPCL:KG
                      Mut:UitslagPallet=VPCL:Pallet
                  ELSIF VPCL:KG<Mut:UitslagKG 
                      Mut:UitslagKG=VPCL:KG
                  ELSIF VPCL:Pallet<Mut:UitslagPallet
                      Mut:UitslagPallet=VPCL:Pallet
                  END    
              END
          END
          Mut:CelLocatieID= Loc:CelLocatie1
          Mut:AlternatieveArtikelOms = Pla:AlternatieveArtikelOms
          
          Mut:UitslagQAIdentificatieMerkenVerpakking = 1
          Mut:UitslagQATransportmiddelSchoon = 1
          Mut:UitslagQAVerpakkingSchoonGesloten = 1
          Mut:UitslagQAIsGeurKleurProductEigen=1
          Mut:UitslagQAGeenGlasbreuk=1
  
  		CLEAR(Ver2:Record)
  		Ver2:VerkoopID = Pla:VerkoopID
  		Access:Verkoop.TryFetch(Ver2:PK_Verkoop)
  		
  		!Mut:DatumTijd_DATE = TODAY()
  		!Mut:DatumTijd_TIME = CLOCK()
  		
  		Mut:DatumTijd_DATE = Ver2:Planning_DATE
  		Mut:DatumTijd_TIME = Ver2:Planning_TIME
  		
  		IF Mut:DatumTijd_TIME = 0 AND Mut:DatumTijd_DATE = TODAY() THEN
  			Mut:DatumTijd_TIME = CLOCK()
  		END
  		
  		Mut:SoortMutatie = 'UIT'
  		
  		LOC:TotaalUitslagKG = Mut:UitslagKG
  		LOC:TotaalUitslagPallet = Mut:UitslagPallet
  	.
  
  	DO BerekenTotaal
  
  	CLEAR(AREL:Record)
  	AREL:RelatieID = Ver2:Klant
      Access:ARelatie.TryFetch(AREL:Relatie_PK)
  
      LOC:OudArtikelID = Mut:ArtikelID
      DO BepaalCMRArtikelOms
  WinAlertMouseZoom()
  Do DefineListboxStyle
  IF SELF.Request = ViewRecord                             ! Configure controls for View Only mode
    ?Mut:DatumTijd_DATE{PROP:ReadOnly} = True
    ?Mut:DatumTijd_TIME{PROP:ReadOnly} = True
    DISABLE(?VVP:ArtikelOms)
    ?Mut:AlternatieveArtikelOms{PROP:ReadOnly} = True
    DISABLE(?OvernemenButton)
    DISABLE(?ChangeCMRArtikel)
    DISABLE(?VVPar:PartijCelID)
    ?Mut:UitslagKG{PROP:ReadOnly} = True
    ?Mut:UitslagPallet{PROP:ReadOnly} = True
    DISABLE(?CL:Locatienaam)
    DISABLE(?AVVPar:PartijCelID)
    ?LOC:UitslagKG2{PROP:ReadOnly} = True
    ?LOC:UitslagPallet2{PROP:ReadOnly} = True
    DISABLE(?ACL:Locatienaam)
    DISABLE(?AAVVPar:PartijCelID)
    ?LOC:UitslagKG3{PROP:ReadOnly} = True
    ?LOC:UitslagPallet3{PROP:ReadOnly} = True
    DISABLE(?AACL:Locatienaam)
    ?LOC:UitslagKG4{PROP:ReadOnly} = True
    ?LOC:UitslagPallet4{PROP:ReadOnly} = True
    DISABLE(?AAAVVPar:PartijCelID)
    DISABLE(?AAACL:Locatienaam)
    ?LOC:TotaalUitslagPallet{PROP:ReadOnly} = True
    ?LOC:TotaalUitslagKG{PROP:ReadOnly} = True
    DISABLE(?InsertButton)
    DISABLE(?DeleteButton)
    DISABLE(?ChangeButton)
    ?Mut:UitslagQAUitgevoerdDoor{PROP:ReadOnly} = True
    ?Mut:UitslagQATemperatuur1{PROP:ReadOnly} = True
    ?Mut:UitslagQATemperatuur2{PROP:ReadOnly} = True
    ?Mut:UitslagQATemperatuur3{PROP:ReadOnly} = True
    ?Mut:UitslagQATemperatuurVervoermiddel{PROP:ReadOnly} = True
    DISABLE(?NeemVoorraaadButton)
    DISABLE(?NeemVoorraaadButton:2)
    DISABLE(?NeemVoorraaadButton:3)
    DISABLE(?NeemVoorraaadButton:4)
  END
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  FDCB7.Init(VVP:ArtikelOms,?VVP:ArtikelOms,Queue:FileDropCombo.ViewPosition,FDCB7::View:FileDropCombo,Queue:FileDropCombo,Relate:ViewVoorraadPlanning,ThisWindow,GlobalErrors,0,0,0)
  FDCB7.Q &= Queue:FileDropCombo
  FDCB7.AddSortOrder(VVP:ViewVoorraad_FK2)
  FDCB7.AddField(VVP:ArtikelID,FDCB7.Q.VVP:ArtikelID) !List box control field - type derived from field
  FDCB7.AddField(VVP:ArtikelOms,FDCB7.Q.VVP:ArtikelOms) !List box control field - type derived from field
  FDCB7.AddField(LOC:ArtikelVoorraadKG,FDCB7.Q.LOC:ArtikelVoorraadKG) !List box control field - type derived from local data
  FDCB7.AddField(LOC:ArtikelVoorraadPallet,FDCB7.Q.LOC:ArtikelVoorraadPallet) !List box control field - type derived from local data
  FDCB7.AddField(VVP:InslagKG,FDCB7.Q.VVP:InslagKG) !Browse hot field - type derived from field
  FDCB7.AddField(VVP:InslagPallets,FDCB7.Q.VVP:InslagPallets) !Browse hot field - type derived from field
  FDCB7.AddField(VVP:UitslagKG,FDCB7.Q.VVP:UitslagKG) !Browse hot field - type derived from field
  FDCB7.AddField(VVP:UitslagPallets,FDCB7.Q.VVP:UitslagPallets) !Browse hot field - type derived from field
  FDCB7.AddField(Art:ArtikelID,FDCB7.Q.Art:ArtikelID) !Related join file key field - type derived from field
  FDCB7.AddUpdateField(VVP:ArtikelID,Mut:ArtikelID)
  ThisWindow.AddItem(FDCB7.WindowComponent)
  FDCB7.DefaultFill = 0
  FDCB4.Init(VVPar:PartijCelID,?VVPar:PartijCelID,Queue:FileDropCombo:1.ViewPosition,FDCB4::View:FileDropCombo,Queue:FileDropCombo:1,Relate:ViewVoorraadPartij,ThisWindow,GlobalErrors,0,0,0)
  FDCB4.Q &= Queue:FileDropCombo:1
  FDCB4.AddSortOrder(VVPar:ArtikelID_PartijID_CelID_K)
  FDCB4.AddRange(VVPar:ArtikelID,Mut:ArtikelID)
  FDCB4.AddField(VVPar:PartijCelID,FDCB4.Q.VVPar:PartijCelID) !List box control field - type derived from field
  FDCB4.AddField(VVPar:PartijID,FDCB4.Q.VVPar:PartijID) !List box control field - type derived from field
  FDCB4.AddField(VVPar:ExternPartijnr,FDCB4.Q.VVPar:ExternPartijnr) !List box control field - type derived from field
  FDCB4.AddField(VVPar:CelOms,FDCB4.Q.VVPar:CelOms) !List box control field - type derived from field
  FDCB4.AddField(VVPar:AanmaakDatum_DATE,FDCB4.Q.VVPar:AanmaakDatum_DATE) !List box control field - type derived from field
  FDCB4.AddField(VVPar:BerekendeInkoopKGPrijs,FDCB4.Q.VVPar:BerekendeInkoopKGPrijs) !List box control field - type derived from field
  FDCB4.AddField(LOC:PartijVoorraadKG1,FDCB4.Q.LOC:PartijVoorraadKG1) !List box control field - type derived from local data
  FDCB4.AddField(LOC:PartijVoorraadPallet1,FDCB4.Q.LOC:PartijVoorraadPallet1) !List box control field - type derived from local data
  FDCB4.AddField(VVPar:VerpakkingOmschrijving,FDCB4.Q.VVPar:VerpakkingOmschrijving) !List box control field - type derived from field
  FDCB4.AddField(VVPar:LeverancierFirmanaam,FDCB4.Q.VVPar:LeverancierFirmanaam) !List box control field - type derived from field
  FDCB4.AddField(VVPar:CelID,FDCB4.Q.VVPar:CelID) !Browse hot field - type derived from field
  FDCB4.AddField(VVPar:VoorraadKG,FDCB4.Q.VVPar:VoorraadKG) !Browse hot field - type derived from field
  FDCB4.AddField(VVPar:VoorraadPallets,FDCB4.Q.VVPar:VoorraadPallets) !Browse hot field - type derived from field
  FDCB4.AddUpdateField(VVPar:PartijCelID,LOC:PartijCelID)
  FDCB4.AddUpdateField(VVPar:PartijID,Mut:PartijID)
  FDCB4.AddUpdateField(VVPar:CelID,Mut:CelID)
  ThisWindow.AddItem(FDCB4.WindowComponent)
  FDCB4.DefaultFill = 0
  FDCB10.Init(AVVPar:PartijCelID,?AVVPar:PartijCelID,Queue:FileDropCombo:2.ViewPosition,FDCB10::View:FileDropCombo,Queue:FileDropCombo:2,Relate:AViewVoorraadPartij,ThisWindow,GlobalErrors,0,1,0)
  FDCB10.Q &= Queue:FileDropCombo:2
  FDCB10.AddSortOrder(AVVPar:ArtikelID_PartijID_CelID_K)
  FDCB10.AddRange(AVVPar:ArtikelID,Mut:ArtikelID)
  FDCB10.AddField(AVVPar:PartijCelID,FDCB10.Q.AVVPar:PartijCelID) !List box control field - type derived from field
  FDCB10.AddField(AVVPar:PartijID,FDCB10.Q.AVVPar:PartijID) !List box control field - type derived from field
  FDCB10.AddField(AVVPar:ExternPartijnr,FDCB10.Q.AVVPar:ExternPartijnr) !List box control field - type derived from field
  FDCB10.AddField(AVVPar:CelOms,FDCB10.Q.AVVPar:CelOms) !List box control field - type derived from field
  FDCB10.AddField(AVVPar:AanmaakDatum_DATE,FDCB10.Q.AVVPar:AanmaakDatum_DATE) !List box control field - type derived from field
  FDCB10.AddField(AVVPar:BerekendeInkoopKGPrijs,FDCB10.Q.AVVPar:BerekendeInkoopKGPrijs) !List box control field - type derived from field
  FDCB10.AddField(LOC:PartijVoorraadKG2,FDCB10.Q.LOC:PartijVoorraadKG2) !List box control field - type derived from local data
  FDCB10.AddField(LOC:PartijVoorraadPallet2,FDCB10.Q.LOC:PartijVoorraadPallet2) !List box control field - type derived from local data
  FDCB10.AddField(AVVPar:VerpakkingOmschrijving,FDCB10.Q.AVVPar:VerpakkingOmschrijving) !List box control field - type derived from field
  FDCB10.AddField(AVVPar:LeverancierFirmanaam,FDCB10.Q.AVVPar:LeverancierFirmanaam) !List box control field - type derived from field
  FDCB10.AddField(AVVPar:VoorraadKG,FDCB10.Q.AVVPar:VoorraadKG) !Browse hot field - type derived from field
  FDCB10.AddField(AVVPar:VoorraadPallets,FDCB10.Q.AVVPar:VoorraadPallets) !Browse hot field - type derived from field
  FDCB10.AddField(AVVPar:CelID,FDCB10.Q.AVVPar:CelID) !Browse hot field - type derived from field
  FDCB10.AddUpdateField(AVVPar:PartijCelID,LOC:PartijCelID2)
  ThisWindow.AddItem(FDCB10.WindowComponent)
  FDCB10.DefaultFill = 0
  FDCB11.Init(AAVVPar:PartijCelID,?AAVVPar:PartijCelID,Queue:FileDropCombo:3.ViewPosition,FDCB11::View:FileDropCombo,Queue:FileDropCombo:3,Relate:AAViewVoorraadPartij,ThisWindow,GlobalErrors,0,1,0)
  FDCB11.Q &= Queue:FileDropCombo:3
  FDCB11.AddSortOrder(AAVVPar:ArtikelID_PartijID_CelID_K)
  FDCB11.AddRange(AAVVPar:ArtikelID,Mut:ArtikelID)
  FDCB11.AddField(AAVVPar:PartijCelID,FDCB11.Q.AAVVPar:PartijCelID) !List box control field - type derived from field
  FDCB11.AddField(AAVVPar:PartijID,FDCB11.Q.AAVVPar:PartijID) !List box control field - type derived from field
  FDCB11.AddField(AAVVPar:ExternPartijnr,FDCB11.Q.AAVVPar:ExternPartijnr) !List box control field - type derived from field
  FDCB11.AddField(AAVVPar:CelOms,FDCB11.Q.AAVVPar:CelOms) !List box control field - type derived from field
  FDCB11.AddField(AAVVPar:AanmaakDatum_DATE,FDCB11.Q.AAVVPar:AanmaakDatum_DATE) !List box control field - type derived from field
  FDCB11.AddField(AAVVPar:BerekendeInkoopKGPrijs,FDCB11.Q.AAVVPar:BerekendeInkoopKGPrijs) !List box control field - type derived from field
  FDCB11.AddField(LOC:PartijVoorraadKG3,FDCB11.Q.LOC:PartijVoorraadKG3) !List box control field - type derived from local data
  FDCB11.AddField(LOC:PartijVoorraadPallet3,FDCB11.Q.LOC:PartijVoorraadPallet3) !List box control field - type derived from local data
  FDCB11.AddField(AAVVPar:VerpakkingOmschrijving,FDCB11.Q.AAVVPar:VerpakkingOmschrijving) !List box control field - type derived from field
  FDCB11.AddField(AAVVPar:LeverancierFirmanaam,FDCB11.Q.AAVVPar:LeverancierFirmanaam) !List box control field - type derived from field
  FDCB11.AddField(AAVVPar:VoorraadKG,FDCB11.Q.AAVVPar:VoorraadKG) !Browse hot field - type derived from field
  FDCB11.AddField(AAVVPar:VoorraadPallets,FDCB11.Q.AAVVPar:VoorraadPallets) !Browse hot field - type derived from field
  FDCB11.AddField(AAVVPar:CelID,FDCB11.Q.AAVVPar:CelID) !Browse hot field - type derived from field
  FDCB11.AddUpdateField(AAVVPar:PartijCelID,LOC:PartijCelID3)
  ThisWindow.AddItem(FDCB11.WindowComponent)
  FDCB11.DefaultFill = 0
  FDCB12.Init(AAAVVPar:PartijCelID,?AAAVVPar:PartijCelID,Queue:FileDropCombo:4.ViewPosition,FDCB12::View:FileDropCombo,Queue:FileDropCombo:4,Relate:AAAViewVoorraadPartij,ThisWindow,GlobalErrors,0,1,0)
  FDCB12.Q &= Queue:FileDropCombo:4
  FDCB12.AddSortOrder(AAAVVPar:ArtikelID_PartijID_CelID_K)
  FDCB12.AddRange(AAAVVPar:ArtikelID,Mut:ArtikelID)
  FDCB12.AddField(AAAVVPar:PartijCelID,FDCB12.Q.AAAVVPar:PartijCelID) !List box control field - type derived from field
  FDCB12.AddField(AAAVVPar:PartijID,FDCB12.Q.AAAVVPar:PartijID) !List box control field - type derived from field
  FDCB12.AddField(AAAVVPar:ExternPartijnr,FDCB12.Q.AAAVVPar:ExternPartijnr) !List box control field - type derived from field
  FDCB12.AddField(AAAVVPar:CelOms,FDCB12.Q.AAAVVPar:CelOms) !List box control field - type derived from field
  FDCB12.AddField(AAAVVPar:AanmaakDatum_DATE,FDCB12.Q.AAAVVPar:AanmaakDatum_DATE) !List box control field - type derived from field
  FDCB12.AddField(AAAVVPar:BerekendeInkoopKGPrijs,FDCB12.Q.AAAVVPar:BerekendeInkoopKGPrijs) !List box control field - type derived from field
  FDCB12.AddField(LOC:PartijVoorraadKG4,FDCB12.Q.LOC:PartijVoorraadKG4) !List box control field - type derived from local data
  FDCB12.AddField(LOC:PartijVoorraadPallet4,FDCB12.Q.LOC:PartijVoorraadPallet4) !List box control field - type derived from local data
  FDCB12.AddField(AAAVVPar:VerpakkingOmschrijving,FDCB12.Q.AAAVVPar:VerpakkingOmschrijving) !List box control field - type derived from field
  FDCB12.AddField(AAAVVPar:LeverancierFirmanaam,FDCB12.Q.AAAVVPar:LeverancierFirmanaam) !List box control field - type derived from field
  FDCB12.AddField(AAAVVPar:VoorraadKG,FDCB12.Q.AAAVVPar:VoorraadKG) !Browse hot field - type derived from field
  FDCB12.AddField(AAAVVPar:VoorraadPallets,FDCB12.Q.AAAVVPar:VoorraadPallets) !Browse hot field - type derived from field
  FDCB12.AddField(AAAVVPar:CelID,FDCB12.Q.AAAVVPar:CelID) !Browse hot field - type derived from field
  FDCB12.AddUpdateField(AAAVVPar:PartijCelID,LOC:PartijCelID4)
  ThisWindow.AddItem(FDCB12.WindowComponent)
  FDCB12.DefaultFill = 0
  FDCB13.Init(CL:Locatienaam,?CL:Locatienaam,Queue:FileDropCombo:5.ViewPosition,FDCB13::View:FileDropCombo,Queue:FileDropCombo:5,Relate:CelLocatie,ThisWindow,GlobalErrors,0,1,0)
  FDCB13.Q &= Queue:FileDropCombo:5
  FDCB13.AddSortOrder(CL:FK_CelLocatie)
  FDCB13.AddRange(CL:CelID,VVPar:CelID)
  FDCB13.SetFilter('LOC:PartijCelID<<>''''')
  FDCB13.AddField(CL:Locatienaam,FDCB13.Q.CL:Locatienaam) !List box control field - type derived from field
  FDCB13.AddField(CL:CelLocatieID,FDCB13.Q.CL:CelLocatieID) !Primary key field - type derived from field
  FDCB13.AddUpdateField(CL:CelLocatieID,Loc:CelLocatie1)
  ThisWindow.AddItem(FDCB13.WindowComponent)
  FDCB13.DefaultFill = 0
  FDCB14.Init(ACL:Locatienaam,?ACL:Locatienaam,Queue:FileDropCombo:6.ViewPosition,FDCB14::View:FileDropCombo,Queue:FileDropCombo:6,Relate:ACelLocatie,ThisWindow,GlobalErrors,0,1,0)
  FDCB14.Q &= Queue:FileDropCombo:6
  FDCB14.AddSortOrder(ACL:FK_CelLocatie)
  FDCB14.AddRange(ACL:CelID,AVVPar:CelID)
  FDCB14.SetFilter('LOC:PartijCelID2<<>''''')
  FDCB14.AddField(ACL:Locatienaam,FDCB14.Q.ACL:Locatienaam) !List box control field - type derived from field
  FDCB14.AddField(ACL:CelLocatieID,FDCB14.Q.ACL:CelLocatieID) !Primary key field - type derived from field
  FDCB14.AddUpdateField(ACL:CelLocatieID,Loc:CelLocatie2)
  ThisWindow.AddItem(FDCB14.WindowComponent)
  FDCB14.DefaultFill = 0
  FDCB15.Init(AACL:Locatienaam,?AACL:Locatienaam,Queue:FileDropCombo:7.ViewPosition,FDCB15::View:FileDropCombo,Queue:FileDropCombo:7,Relate:AACelLocatie,ThisWindow,GlobalErrors,0,1,0)
  FDCB15.Q &= Queue:FileDropCombo:7
  FDCB15.AddSortOrder(AACL:FK_CelLocatie)
  FDCB15.AddRange(AACL:CelID,AAVVPar:CelID)
  FDCB15.SetFilter('LOC:PartijCelID3<<>''''')
  FDCB15.AddField(AACL:Locatienaam,FDCB15.Q.AACL:Locatienaam) !List box control field - type derived from field
  FDCB15.AddField(AACL:CelLocatieID,FDCB15.Q.AACL:CelLocatieID) !Primary key field - type derived from field
  FDCB15.AddUpdateField(AACL:CelLocatieID,Loc:CelLocatie3)
  ThisWindow.AddItem(FDCB15.WindowComponent)
  FDCB15.DefaultFill = 0
  FDCB16.Init(AAACL:Locatienaam,?AAACL:Locatienaam,Queue:FileDropCombo:8.ViewPosition,FDCB16::View:FileDropCombo,Queue:FileDropCombo:8,Relate:AAACelLocatie,ThisWindow,GlobalErrors,0,1,0)
  FDCB16.Q &= Queue:FileDropCombo:8
  FDCB16.AddSortOrder(AAACL:FK_CelLocatie)
  FDCB16.AddRange(AAACL:CelID,AAAVVPar:CelID)
  FDCB16.SetFilter('LOC:PartijCelID4<<>''''')
  FDCB16.AddField(AAACL:Locatienaam,FDCB16.Q.AAACL:Locatienaam) !List box control field - type derived from field
  FDCB16.AddField(AAACL:CelLocatieID,FDCB16.Q.AAACL:CelLocatieID) !Primary key field - type derived from field
  FDCB16.AddUpdateField(AAACL:CelLocatieID,Loc:CelLocatie4)
  ThisWindow.AddItem(FDCB16.WindowComponent)
  FDCB16.DefaultFill = 0
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
    Relate:AAAAViewVoorraadPartij.Close
    Relate:AAACelLocatie.Close
    Relate:AAAViewVoorraadPartij.Close
    Relate:AACelLocatie.Close
    Relate:AAViewVoorraadPartij.Close
    Relate:ACelLocatie.Close
    Relate:AMutatie.Close
    Relate:APlanning.Close
    Relate:ARelatie.Close
    Relate:AVerkoop.Close
    Relate:AViewVoorraadPartij.Close
    Relate:CelLocatie.Close
    Relate:Mutatie.Close
    Relate:Planning.Close
    Relate:RelatieArtikelOmschrijving.Close
    Relate:ViewPartijCelLocaties.Close
    Relate:ViewVoorraadPartij.Close
    Relate:ViewVoorraadPlanning.Close
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.PrimeUpdate PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.PrimeUpdate()
  	If returnValue = Level:Fatal  ! delete just occured
  		NetRefreshVoorraadViews()
  		NetRefreshPlanningViews()
  	END
    If returnValue = Level:Fatal  ! delete just occured
      ThisNetRefresh.Send('|') ! NetTalk (NetRefresh)
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
    OF ?VVP:ArtikelOms
      ! Bijwerken palletblad/CMR-specifieke artikelomschrijving
      DO BepaalCMRArtikelOms
      
      IF LOC:OudArtikelID <> Mut:ArtikelID THEN
          Mut:AlternatieveArtikelOms = LOC:CMRArtikelOms
          
          LOC:OudArtikelID = Mut:ArtikelID
      END
      
        IF Mut:ArtikelID <> '' THEN
            IF LOC:PartijCelID <> '' THEN
      	CLEAR(AAAVVPar:Record)
      	AAAVVPar:PartijCelID = LOC:PartijCelID
      	IF(Access:AAAViewVoorraadPartij.TryFetch(AAAVVPar:PartijCelID_K) = Level:Benign)
      		IF(AAAVVPar:ArtikelID <> Mut:ArtikelID)
      			LOC:PartijCelID = ''
      		.
      	ELSE		
      		LOC:PartijCelID = ''
        .
            END
            
      	
            IF LOC:PartijCelID2 <> '' THEN
      	CLEAR(AAAVVPar:Record)
      	AAAVVPar:PartijCelID = LOC:PartijCelID2
      	IF(Access:AAAViewVoorraadPartij.TryFetch(AAAVVPar:PartijCelID_K) = Level:Benign)
      		IF(AAAVVPar:ArtikelID <> Mut:ArtikelID)
      			LOC:PartijCelID2 = ''
      		.
      	ELSE		
      		LOC:PartijCelID2 = ''
        .
            END
            
            IF LOC:PartijCelID3 <> '' THEN
      	CLEAR(AAAVVPar:Record)
      	AAAVVPar:PartijCelID = LOC:PartijCelID3
      	IF(Access:AAAViewVoorraadPartij.TryFetch(AAAVVPar:PartijCelID_K) = Level:Benign)
      		IF(AAAVVPar:ArtikelID <> Mut:ArtikelID)
      			LOC:PartijCelID3 = ''
      		.
      	ELSE		
      		LOC:PartijCelID3 = ''
        .
            END
            
      
            IF LOC:PartijCelID4 <> '' THEN
      	CLEAR(AAAVVPar:Record)
      	AAAVVPar:PartijCelID = LOC:PartijCelID4
      	IF(Access:AAAViewVoorraadPartij.TryFetch(AAAVVPar:PartijCelID_K) = Level:Benign)
      		IF(AAAVVPar:ArtikelID <> Mut:ArtikelID)
      			LOC:PartijCelID4 = ''
      		.
      	ELSE		
      		LOC:PartijCelID4 = ''
        .
            END
            
      	
      	LOOP i# = 1 TO RECORDS(GLO:UitslagMutatieQueue)
      		GET(GLO:UitslagMutatieQueue, i#)
      		IF UMQ:PartijCelID<>''
      		AAAVVPar:PartijCelID = UMQ:PartijCelID
      		IF(Access:AAAViewVoorraadPartij.TryFetch(AAAVVPar:PartijCelID_K) = Level:Benign)
      			IF(AAAVVPar:ArtikelID <> Mut:ArtikelID)
      				FREE(GLO:UitslagMutatieQueue)
      			.
      		ELSE		
      			FREE(GLO:UitslagMutatieQueue)
            .
            ELSE
                FREE(GLO:UitslagMutatieQueue)
            END
            
      	.
      ELSE
      	LOC:PartijCelID = ''
      	LOC:PartijCelID2 = ''
      	LOC:PartijCelID3 = ''
      	LOC:PartijCelID4 = ''
      	
      	FREE(GLO:UitslagMutatieQueue)
      .
      
      ThisWindow.Reset(true)
    OF ?ChangeCMRArtikel
      CLEAR(RAO:Record)
      RAO:RelatieID = Ver2:Klant
      RAO:ArtikelID = Mut:ArtikelID
      IF Access:RelatieArtikelOmschrijving.Fetch(RAO:FK1_RelatieArtikelOmschrijving) = Level:Benign THEN
          GlobalRequest = ChangeRecord
          UpdateRelatieArtikelOmschrijving()
      ELSE
          IF Ver2:Klant > 0 AND Pla:ArtikelID > 0 THEN
              CLEAR(RAO:Record)
              RAO:RelatieID = Ver2:Klant
              RAO:ArtikelID = Mut:ArtikelID
              GlobalRequest = InsertRecord
              UpdateRelatieArtikelOmschrijving()
          END
      END
      
      LOC:CMRArtikelOms = GlobalClass.CMRArtikelOms(Ver2:Klant, Mut:ArtikelID)
    OF ?VVPar:PartijCelID
      IF Mut:UitslagKG > LOC:PartijVoorraadKG1 THEN
      	Mut:UitslagKG = LOC:PartijVoorraadKG1
      	DISPLAY(?Mut:UitslagKG)
      	DO BerekenTotaal
      .
      IF 0{PROP:AcceptAll}=FALSE
      !    db.Debugout('Locatie browse opnieuw opbouwen :'&LOC:PartijCelID)
          FDCB13.ResetQueue(true)
      !    db.Debugout('Locatie browse opnieuw opbouwen klaar')
          Select(?CL:Locatienaam,1)
      END
    OF ?Mut:UitslagKG
      IF LOC:UitslagKG2 = 0
      	IF (LOC:TotaalUitslagKG - Mut:UitslagKG - LOC:UitslagKG3 - LOC:UitslagKG4) >= 0
      		LOC:UitslagKG2 = LOC:TotaalUitslagKG - Mut:UitslagKG - LOC:UitslagKG3 - LOC:UitslagKG4
      		DISPLAY(?LOC:UitslagKG2)
      	.
      .
      
      DO BerekenTotaal
    OF ?Mut:UitslagPallet
      IF LOC:UitslagPallet2 = 0
      	IF (LOC:TotaalUitslagPallet - Mut:UitslagPallet - LOC:UitslagPallet3 - LOC:UitslagPallet4) >= 0
      		LOC:UitslagPallet2 = LOC:TotaalUitslagPallet - Mut:UitslagPallet - LOC:UitslagPallet3 - LOC:UitslagPallet4
      		DISPLAY(?LOC:UitslagPallet2)
      	.
      .
      
      DO BerekenTotaal
    OF ?AVVPar:PartijCelID
      IF LOC:UitslagKG2 = 0
      	IF (LOC:TotaalUitslagKG - Mut:UitslagKG - LOC:UitslagKG3 - LOC:UitslagKG4) >= 0
      		LOC:UitslagKG2 = LOC:TotaalUitslagKG - Mut:UitslagKG - LOC:UitslagKG3 - LOC:UitslagKG4
      	.
      	DO BerekenTotaal
      .
      
      IF LOC:UitslagKG2 > LOC:PartijVoorraadKG2 AND LOC:PartijVoorraadKG2 >= 0 THEN
      	LOC:UitslagKG2 = LOC:PartijVoorraadKG2
      	DISPLAY(?LOC:UitslagKG2)
      	DO BerekenTotaal
      .
      IF 0{PROP:AcceptAll}=FALSE
          FDCB14.ResetQueue(false)
          Select(?ACL:Locatienaam,1)
      END
    OF ?LOC:UitslagKG2
      IF LOC:UitslagKG3 = 0
      	IF (LOC:TotaalUitslagKG - Mut:UitslagKG - LOC:UitslagKG2 - LOC:UitslagKG4) >= 0
      		LOC:UitslagKG3 = LOC:TotaalUitslagKG - Mut:UitslagKG - LOC:UitslagKG2 - LOC:UitslagKG4
      		DISPLAY(?LOC:UitslagKG3)
      	.
      .
      
      DO BerekenTotaal
    OF ?LOC:UitslagPallet2
      IF LOC:UitslagPallet3 = 0
      	IF (LOC:TotaalUitslagPallet - Mut:UitslagPallet - LOC:UitslagPallet2 - LOC:UitslagPallet4) >= 0
      		LOC:UitslagPallet3 = LOC:TotaalUitslagPallet - Mut:UitslagPallet - LOC:UitslagPallet2 - LOC:UitslagPallet4
      		DISPLAY(?LOC:UitslagPallet3)
      	.
      .
      
      DO BerekenTotaal
    OF ?AAVVPar:PartijCelID
      IF LOC:UitslagKG3 = 0
      	IF (LOC:TotaalUitslagKG - Mut:UitslagKG - LOC:UitslagKG2 - LOC:UitslagKG4) >= 0
      		LOC:UitslagKG3 = LOC:TotaalUitslagKG - Mut:UitslagKG - LOC:UitslagKG2 - LOC:UitslagKG4
      	.
      	
      	DO BerekenTotaal
      .
      
      IF LOC:UitslagKG3 > LOC:PartijVoorraadKG3 AND LOC:PartijVoorraadKG3 >= 0 THEN
      	LOC:UitslagKG3 = LOC:PartijVoorraadKG3
      	DISPLAY(?LOC:UitslagKG3)
      	DO BerekenTotaal
      .
      IF 0{PROP:AcceptAll}=FALSE
          FDCB15.ResetQueue(false)
          Select(?AACL:Locatienaam,1)
      END
    OF ?LOC:UitslagKG3
      IF LOC:UitslagKG4 = 0
      	IF (LOC:TotaalUitslagKG - Mut:UitslagKG - LOC:UitslagKG2 - LOC:UitslagKG3) >= 0
      		LOC:UitslagKG4 = LOC:TotaalUitslagKG - Mut:UitslagKG - LOC:UitslagKG2 - LOC:UitslagKG3
      		DISPLAY(?LOC:UitslagKG4)		
      	.
      .
      
      DO BerekenTotaal
    OF ?LOC:UitslagPallet3
      IF LOC:UitslagPallet4 = 0
      	IF (LOC:TotaalUitslagPallet - Mut:UitslagPallet - LOC:UitslagPallet2 - LOC:UitslagPallet3) >= 0
      		LOC:UitslagPallet4 = LOC:TotaalUitslagPallet - Mut:UitslagPallet - LOC:UitslagPallet2 - LOC:UitslagPallet3
      		DISPLAY(?LOC:UitslagPallet4)
      	.
      .
      
      DO BerekenTotaal
    OF ?LOC:UitslagKG4
      DO BerekenTotaal
    OF ?LOC:UitslagPallet4
      DO BerekenTotaal
    OF ?AAAVVPar:PartijCelID
      IF LOC:UitslagKG4 = 0
      	IF (LOC:TotaalUitslagKG - Mut:UitslagKG - LOC:UitslagKG2 - LOC:UitslagKG3) >= 0
      		LOC:UitslagKG4 = LOC:TotaalUitslagKG - Mut:UitslagKG - LOC:UitslagKG2 - LOC:UitslagKG3
      	.
      	
      	DO BerekenTotaal
      .
      
      IF LOC:UitslagKG4 > LOC:PartijVoorraadKG4 AND LOC:PartijVoorraadKG4 >= 0 THEN
      	LOC:UitslagKG4 = LOC:PartijVoorraadKG4
      	DISPLAY(?LOC:UitslagKG4)
      	DO BerekenTotaal
      .
      IF 0{PROP:AcceptAll}=FALSE
          FDCB16.ResetQueue(false)
          Select(?AAACL:Locatienaam,1)
      END
    OF ?OK
      db.DebugOut('OK:Accepted '& Mut:MutatieID& ','& Mut:PlanningID)
    OF ?Cancel
          db.Debugout('cancel geklikt')
    OF ?LOC:TotaalUitslagPallet
      IF LOC:UitslagPallet2 = 0 AND LOC:UitslagPallet3 = 0 AND LOC:UitslagPallet4 = 0
      	Mut:UitslagPallet = LOC:TotaalUitslagPallet
      	DISPLAY(?Mut:UitslagPallet)
      .
      
      DO BerekenTotaal
    OF ?LOC:TotaalUitslagKG
      IF LOC:UitslagKG2 = 0 AND LOC:UitslagKG3 = 0 AND LOC:UitslagKG4 = 0
      	Mut:UitslagKG = LOC:TotaalUitslagKG
      	DISPLAY(?Mut:UitslagKG)
      .
      
      DO BerekenTotaal
    OF ?InsertButton
      GlobalRequest = InsertRecord
      UpdateUitslagMutatieQueue(Mut:ArtikelID)
      
      DO BerekenTotaal
      ThisWindow.Reset(True)
      
      
    OF ?DeleteButton
      CLEAR(GLO:UitslagMutatieQueue)
      GET(GLO:UitslagMutatieQueue, Choice(?UitslagMutatieList))
      IF NOT(ERROR()) AND UMQ:PartijCelID <> '' THEN
      	DELETE(GLO:UitslagMutatieQueue)
      	
      	DO BerekenTotaal
      	ThisWindow.Reset(True)
      END
    OF ?ChangeButton
      CLEAR(GLO:UitslagMutatieQueue)
      GET(GLO:UitslagMutatieQueue, Choice(?UitslagMutatieList))
      IF NOT(ERROR()) AND UMQ:PartijCelID <> '' THEN
      	db.DebugOut('ChangeUMQ:' & CLIP(UMQ:PartijCelID))
      	GlobalRequest = ChangeRecord
      	UpdateUitslagMutatieQueue(Mut:ArtikelID)
      	
      	DO BerekenTotaal
      	ThisWindow.Reset(True)
      END
    OF ?NeemVoorraaadButton
      Mut:UitslagKG = FDCB4.Q.LOC:PartijVoorraadKG1
      
      IF LOC:UitslagKG2 = 0
      	IF (LOC:TotaalUitslagKG - Mut:UitslagKG - LOC:UitslagKG3 - LOC:UitslagKG4) >= 0
      		LOC:UitslagKG2 = LOC:TotaalUitslagKG - Mut:UitslagKG - LOC:UitslagKG3 - LOC:UitslagKG4
      		!DISPLAY(?LOC:UitslagKG2)
      	.
      .
      
      DO BerekenTotaal
    OF ?NeemVoorraaadButton:2
      LOC:UitslagKG2 = FDCB10.Q.LOC:PartijVoorraadKG2
      
      IF LOC:UitslagKG3 = 0
      	IF (LOC:TotaalUitslagKG - Mut:UitslagKG - LOC:UitslagKG2 - LOC:UitslagKG4) >= 0
      		LOC:UitslagKG3 = LOC:TotaalUitslagKG - Mut:UitslagKG - LOC:UitslagKG2 - LOC:UitslagKG4
      		!DISPLAY(?LOC:UitslagKG3)
      	.
      .
      
      DO BerekenTotaal
    OF ?NeemVoorraaadButton:3
      LOC:UitslagKG3 = FDCB11.Q.LOC:PartijVoorraadKG3
      
      IF LOC:UitslagKG4 = 0
      	IF (LOC:TotaalUitslagKG - Mut:UitslagKG - LOC:UitslagKG2 - LOC:UitslagKG3) >= 0
      		LOC:UitslagKG4 = LOC:TotaalUitslagKG - Mut:UitslagKG - LOC:UitslagKG2 - LOC:UitslagKG3
      		!DISPLAY(?LOC:UitslagKG4)		
      	.
      .
      
      DO BerekenTotaal
    OF ?NeemVoorraaadButton:4
      LOC:UitslagKG4 = FDCB12.Q.LOC:PartijVoorraadKG4
      !DISPLAY(?LOC:UitslagKG4)
      
      DO BerekenTotaal
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?OvernemenButton
      ThisWindow.Update()
      Mut:AlternatieveArtikelOms = LOC:CMRArtikelOms
      DISPLAY(?Mut:AlternatieveArtikelOms)
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
  db.Debugout('pre take completed')
  
  DO BerekenTotaal
  
  IF (LOC:PartijCelID = '') THEN
  	SELECT(?VVPar:PartijCelID)
  	RETURN Level:Notify
  .
  
  IF (LOC:UitslagKG2<>0 OR LOC:UitslagPallet2<>0) AND LOC:PartijCelID2 = '' THEN
  	SELECT(?AVVPar:PartijCelID)
  	RETURN Level:Notify
  .
  
  IF (LOC:UitslagKG3<>0 OR LOC:UitslagPallet3<>0) AND LOC:PartijCelID3 = '' THEN
  	SELECT(?AAVVPar:PartijCelID)
  	RETURN Level:Notify
  .
  
  IF (LOC:UitslagKG4<>0 OR LOC:UitslagPallet4<>0) AND LOC:PartijCelID4 = '' THEN
  	SELECT(?AAAVVPar:PartijCelID)
  	RETURN Level:Notify
  .
  
  ! Controleren op duplicaten
  IF LOC:PartijCelID <> ''
  	IF (ThisWindow.ControleerDuplicaat(LOC:PartijCelID) > 1)
  		MESSAGE('Partij en cel ' & CLIP(LOC:PartijCelID) & ' is meer dan 1 keer ingevoerd')
  		SELECT(?VVPar:PartijCelID)
  		RETURN Level:Notify
  	.
  .
  
  IF LOC:PartijCelID2 <> ''
  	IF (ThisWindow.ControleerDuplicaat(LOC:PartijCelID2) > 1)
  		MESSAGE('Partij en cel ' & CLIP(LOC:PartijCelID2) & ' is meer dan 1 keer ingevoerd')
  		Select(?AVVPar:PartijCelID)
  		RETURN Level:Notify
  	.
  .
  
  IF LOC:PartijCelID3 <> ''
  	IF (ThisWindow.ControleerDuplicaat(LOC:PartijCelID3) > 1)
  		MESSAGE('Partij en cel ' & CLIP(LOC:PartijCelID3) & ' is meer dan 1 keer ingevoerd')
  		Select(?AAVVPar:PartijCelID)
  		RETURN Level:Notify
  	.
  .
  
  If LOC:PartijCelID4 <> '' THEN
  	IF (ThisWindow.ControleerDuplicaat(LOC:PartijCelID4) > 1)
  		MESSAGE('Partij en cel ' & CLIP(LOC:PartijCelID4) & ' is meer dan 1 keer ingevoerd')
  		Select(?AAAVVPar:PartijCelID)
  		RETURN Level:Notify
  	.
  .
  
  LOOP i# = 1 TO RECORDS(GLO:UitslagMutatieQueue)
  	GET(GLO:UitslagMutatieQueue, i#)
  	IF (ThisWindow.ControleerDuplicaat(UMQ:PartijCelID) > 1)
  		MESSAGE('Partij en cel ' & CLIP(UMQ:PartijCelID) & ' is meer dan 1 keer ingevoerd')
  		RETURN Level:Notify
  	.
  .
  
  ! Controleren uitslagen op negatieve voorraad
  ThisWindow.BepaalCorrectieVoorraad(LOC:PartijCelID)
  VoorraadKG#=0
  CLEAR(AAAAVVPar:Record)
  AAAAVVPar:PartijCelID = LOC:PartijCelID
  SET(AAAAVVPar:PartijCelID_K,AAAAVVPar:PartijCelID_K)
  Loop Until Access:AAAAViewVoorraadPartij.Next()
      IF NOT (AAAAVVPar:PartijCelID = LOC:PartijCelID) THEN BREAK.
      VoorraadKG#+=AAAAVVPar:VoorraadKG
  END
  IF (VoorraadKG#+LOC:CorrectieKG-Mut:UitslagKG < 0) !OR (VVPar:VoorraadPallets+LOC:CorrectiePallets-Mut:UitslagPallet < 0)
  	Message('De uitslag ' & CLIP(LOC:PartijCelID) & ' is te groot voor de huidige voorraad ('&clip(VoorraadKG#+LOC:CorrectieKG)& ' KG / ' & CLIP(AAAAVVPar:VoorraadPallets+LOC:CorrectiePallets) & ' pallets)', |
  		'Negatieve voorraad KG',ICON:Exclamation)
  	Select(?Mut:UitslagKG)
  	RETURN Level:Notify
  .
  
  IF LOC:PartijCelID2 <> ''
  	ThisWindow.BepaalCorrectieVoorraad(LOC:PartijCelID2)
      VoorraadKG#=0
      CLEAR(AAAAVVPar:Record)
      AAAAVVPar:PartijCelID = LOC:PartijCelID2
      SET(AAAAVVPar:PartijCelID_K,AAAAVVPar:PartijCelID_K)
      Loop Until Access:AAAAViewVoorraadPartij.Next()
          IF NOT (AAAAVVPar:PartijCelID = LOC:PartijCelID2) THEN BREAK.
          VoorraadKG#+=AAAAVVPar:VoorraadKG
      END
  	IF (VoorraadKG#+LOC:CorrectieKG-LOC:UitslagKG2 < 0) !OR (AVVPar:VoorraadPallets+LOC:CorrectiePallets-LOC:UitslagPallet2 < 0)
  		Message('De uitslag ' & CLIP(LOC:PartijCelID2) & ' is te groot voor de huidige voorraad ('&clip(VoorraadKG#+LOC:CorrectieKG)& ' KG / ' & CLIP(AAAAVVPar:VoorraadPallets+LOC:CorrectiePallets) & ' pallets)', |
  			'Negatieve voorraad KG',ICON:Exclamation)
  		Select(?LOC:UitslagKG2)
  		RETURN Level:Notify
  	.
  .
  
  IF LOC:PartijCelID3 <> ''
  	ThisWindow.BepaalCorrectieVoorraad(LOC:PartijCelID3)
      VoorraadKG#=0
      CLEAR(AAAAVVPar:Record)
      AAAAVVPar:PartijCelID = LOC:PartijCelID3
      SET(AAAAVVPar:PartijCelID_K,AAAAVVPar:PartijCelID_K)
      Loop Until Access:AAAAViewVoorraadPartij.Next()
          IF NOT (AAAAVVPar:PartijCelID = LOC:PartijCelID3) THEN BREAK.
          VoorraadKG#+=AAAAVVPar:VoorraadKG
      END
  	IF (VoorraadKG#+LOC:CorrectieKG-LOC:UitslagKG3 < 0) !OR (AAVVPar:VoorraadPallets+LOC:CorrectiePallets-LOC:UitslagPallet3 < 0)
  		Message('De uitslag ' & CLIP(LOC:PartijCelID3) & ' is te groot voor de huidige voorraad ('&clip(VoorraadKG#+LOC:CorrectieKG)& ' KG / ' & CLIP(AAAAVVPar:VoorraadPallets+LOC:CorrectiePallets) & ' pallets)', |
  			'Negatieve voorraad KG',ICON:Exclamation)
  		Select(?LOC:UitslagKG3)
  		RETURN Level:Notify
  	.
  .
  
  IF LOC:PartijCelID4 <> ''
  	ThisWindow.BepaalCorrectieVoorraad(LOC:PartijCelID4)
      VoorraadKG#=0
      CLEAR(AAAAVVPar:Record)
      AAAAVVPar:PartijCelID = LOC:PartijCelID4
      SET(AAAAVVPar:PartijCelID_K,AAAAVVPar:PartijCelID_K)
      Loop Until Access:AAAAViewVoorraadPartij.Next()
          IF NOT (AAAAVVPar:PartijCelID = LOC:PartijCelID4) THEN BREAK.
          VoorraadKG#+=AAAAVVPar:VoorraadKG
      END
  	IF (VoorraadKG#+LOC:CorrectieKG-LOC:UitslagKG4 < 0) !OR (AAAVVPar:VoorraadPallets+LOC:CorrectiePallets-LOC:UitslagPallet4 < 0)
  		Message('De uitslag ' & CLIP(LOC:PartijCelID4) & ' is te groot voor de huidige voorraad ('&clip(VoorraadKG#+LOC:CorrectieKG)& ' KG / ' & CLIP(AAAAVVPar:VoorraadPallets+LOC:CorrectiePallets) & ' pallets)', |
  			'Negatieve voorraad KG',ICON:Exclamation)
  		Select(?LOC:UitslagKG4)
  		RETURN Level:Notify
  	.
  .
  
  LOOP i# = 1 TO RECORDS(GLO:UitslagMutatieQueue)
  	GET(GLO:UitslagMutatieQueue, i#)
      VoorraadKG#=0
      CLEAR(AAAAVVPar:Record)
      AAAAVVPar:PartijCelID = UMQ:PartijCelID
      SET(AAAAVVPar:PartijCelID_K,AAAAVVPar:PartijCelID_K)
      Loop Until Access:AAAAViewVoorraadPartij.Next()
          IF NOT (AAAAVVPar:PartijCelID = UMQ:PartijCelID) THEN BREAK.
          VoorraadKG#+=AAAAVVPar:VoorraadKG
      END
  	ThisWindow.BepaalCorrectieVoorraad(UMQ:PartijCelID)
  	IF (VoorraadKG#+LOC:CorrectieKG-UMQ:KG < 0) !OR (AAAVVPar:VoorraadPallets+LOC:CorrectiePallets-LOC:UitslagPallet4 < 0)
  		Message('De uitslag van ' & CLIP(UMQ:PartijCelID) & ' is te groot voor de huidige voorraad ('&clip(AAAAVVPar:VoorraadKG+LOC:CorrectieKG)& ' KG / ' & CLIP(AAAAVVPar:VoorraadPallets+LOC:CorrectiePallets) & ' pallets) in cel ' & AAAAVVPar:CelOms, |
  			'Negatieve voorraad KG',ICON:Exclamation)
  		RETURN Level:Notify
  	.
  .
  
  Access:Planning.TryFetch(Pla:PK_Planning)
  
  IF ThisWindow.Request = InsertRecord THEN
  	! Nog controleren of niet een andere gebruiker ondertussen de uitslag al heeft gedaan
  	Access:Planning.TryFetch(Pla:PK_Planning)
  	IF Pla:MutatieGemaakt THEN
  		MESSAGE('Uitslag is reeds gedaan')
  		RETURN Level:Notify
  	.
  .
  
  IF Pla:Gewogen THEN
  	MESSAGE('Uitslag is reeds gewogen, kan niet regulier worden uitgeslagen')
  	RETURN Level:Notify
  .
  db.Debugout('pre take completed')
  ReturnValue = PARENT.TakeCompleted()
  !   Access:Verkoop.Update()         ! 2018-6-21 Deze update doet volgens mij helemaal niets
  db.Debugout('take completed')
  CLEAR(Pla:Record)
  Pla:PlanningID = Mut:PlanningID
  IF (Access:Planning.TryFetch(Pla:PK_Planning) = Level:Benign)
      ! Uitgeschakeld dit wordt bepaald in VoorraadClass.BerekenPlanningMutatieGrootte(Pla:PlanningID)
      !Pla:MutatieGemaakt = 1
      !Access:Planning.Update()
  ELSE
      MESSAGE('Bijbehorende planning-regel kan niet worden bijgewerkt.', 'Let Op', ICON:Exclamation)
  END
  
  ! weet ik nu het partij nummer
  IF (ThisWindow.Request = ChangeRecord)
  	DO WisMutaties
  END
  
  db.DebugOut('Opslaan '& LOC:PartijCelID2 & ',' & LOC:UitslagPallet2 & ',' & LOC:UitslagKG2)
  
  AMut:Record = Mut:Record
  
  ! Extra mutaties aanmaken
  IF LOC:PartijCelID2<>'' AND (LOC:UitslagPallet2<>0 OR LOC:UitslagKG2<>0)
  	CLEAR(AAAAVVPar:Record)
  	AAAAVVPar:PartijCelID = LOC:PartijCelID2
  	Access:AAAAViewVoorraadPartij.TryFetch(AAAAVVPar:PartijCelID_K)
  
  	CLEAR(Mut:Record)
      Access:Mutatie.PrimeRecord(false)
  	Mut:PartijID = AAAAVVPar:PartijID
  	Mut:UitslagKG = LOC:UitslagKG2
  	Mut:UitslagPallet = LOC:UitslagPallet2 
      Mut:CelID = AAAAVVPar:CelID
      Mut:CelLocatieID=Loc:CelLocatie2
  	Mut:SoortMutatie = 'UIT'
  	Mut:PlanningID = AMut:PlanningID
      Mut:ArtikelID = AMut:ArtikelID
      Mut:AlternatieveArtikelOms = AMut:AlternatieveArtikelOms    
  	Mut:DatumTijd_DATE = AMut:DatumTijd_DATE
      Mut:DatumTijd_TIME = AMut:DatumTijd_TIME
      
      ! Kwaliteit-checks worden ook gekopieerd
      Mut:UitslagQATransportmiddelSchoon = AMut:UitslagQATransportmiddelSchoon
      Mut:UitslagQAVerpakkingSchoonGesloten = AMut:UitslagQAVerpakkingSchoonGesloten
      Mut:UitslagQAIdentificatieMerkenVerpakking = AMut:UitslagQAIdentificatieMerkenVerpakking
      Mut:UitslagQATemperatuur1 = AMut:UitslagQATemperatuur1
      Mut:UitslagQATemperatuur2 = AMut:UitslagQATemperatuur2
      Mut:UitslagQATemperatuur3 = AMut:UitslagQATemperatuur3
      Mut:UitslagQAActieAfwijkingen = AMut:UitslagQAActieAfwijkingen
      Mut:UitslagQAUitgevoerdDoor = AMut:UitslagQAUitgevoerdDoor
      
  	Access:Mutatie.Insert()
      db.DebugOut('Insert-mutatie ' & Mut:MutatieID)			
  END
  
  db.DebugOut('Opslaan '& LOC:PartijCelID3 & ',' & LOC:UitslagPallet3 & ',' & LOC:UitslagKG3)
  
  IF LOC:PartijCelID3<>'' AND (LOC:UitslagPallet3<>0 OR LOC:UitslagKG3<>0)
  	CLEAR(AAAAVVPar:Record)
  	AAAAVVPar:PartijCelID = LOC:PartijCelID3
  	Access:AAAAViewVoorraadPartij.TryFetch(AAAAVVPar:PartijCelID_K)
  	
  	CLEAR(Mut:Record)
  	Access:Mutatie.PrimeRecord(false)
  	Mut:PartijID = AAAAVVPar:PartijID
  	Mut:UitslagKG = LOC:UitslagKG3
  	Mut:UitslagPallet = LOC:UitslagPallet3
  	Mut:CelID = AAAAVVPar:CelID
      Mut:CelLocatieID=Loc:CelLocatie3
  	Mut:SoortMutatie = 'UIT'
  	Mut:PlanningID = AMut:PlanningID
      Mut:ArtikelID = AMut:ArtikelID
      Mut:AlternatieveArtikelOms = AMut:AlternatieveArtikelOms        
  	Mut:DatumTijd_DATE = AMut:DatumTijd_DATE
      Mut:DatumTijd_TIME = AMut:DatumTijd_TIME
      
      ! Kwaliteit-checks worden ook gekopieerd
      Mut:UitslagQATransportmiddelSchoon = AMut:UitslagQATransportmiddelSchoon
      Mut:UitslagQAVerpakkingSchoonGesloten = AMut:UitslagQAVerpakkingSchoonGesloten
      Mut:UitslagQAIdentificatieMerkenVerpakking = AMut:UitslagQAIdentificatieMerkenVerpakking
      Mut:UitslagQATemperatuur1 = AMut:UitslagQATemperatuur1
      Mut:UitslagQATemperatuur2 = AMut:UitslagQATemperatuur2
      Mut:UitslagQATemperatuur3 = AMut:UitslagQATemperatuur3
      Mut:UitslagQAActieAfwijkingen = AMut:UitslagQAActieAfwijkingen
      Mut:UitslagQAUitgevoerdDoor = AMut:UitslagQAUitgevoerdDoor
      
  	Access:Mutatie.Insert()
      db.DebugOut('Insert-mutatie ' & Mut:MutatieID)			
  END
  
  db.DebugOut('Opslaan '& LOC:PartijCelID4 & ',' & LOC:UitslagPallet4 & ',' & LOC:UitslagKG4)
  
  IF LOC:PartijCelID4<>'' AND (LOC:UitslagPallet4<>0 OR LOC:UitslagKG4<>0)
  	CLEAR(AAAAVVPar:Record)
  	AAAAVVPar:PartijCelID = LOC:PartijCelID4
  	Access:AAAAViewVoorraadPartij.TryFetch(AAAAVVPar:PartijCelID_K)
  	
  	CLEAR(Mut:Record)
  	Access:Mutatie.PrimeRecord(false)
  	Mut:PartijID = AAAAVVPar:PartijID
  	Mut:UitslagKG = LOC:UitslagKG4
  	Mut:UitslagPallet = LOC:UitslagPallet4
  	Mut:CelID = AAAAVVPar:CelID
      Mut:CelLocatieID=Loc:CelLocatie4
  	Mut:SoortMutatie = 'UIT'
  	Mut:PlanningID = AMut:PlanningID
      Mut:ArtikelID = AMut:ArtikelID
      Mut:AlternatieveArtikelOms = AMut:AlternatieveArtikelOms    
  	Mut:DatumTijd_DATE = AMut:DatumTijd_DATE
      Mut:DatumTijd_TIME = AMut:DatumTijd_TIME
      
      ! Kwaliteit-checks worden ook gekopieerd
      Mut:UitslagQATransportmiddelSchoon = AMut:UitslagQATransportmiddelSchoon
      Mut:UitslagQAVerpakkingSchoonGesloten = AMut:UitslagQAVerpakkingSchoonGesloten
      Mut:UitslagQAIdentificatieMerkenVerpakking = AMut:UitslagQAIdentificatieMerkenVerpakking
      Mut:UitslagQATemperatuur1 = AMut:UitslagQATemperatuur1
      Mut:UitslagQATemperatuur2 = AMut:UitslagQATemperatuur2
      Mut:UitslagQATemperatuur3 = AMut:UitslagQATemperatuur3
      Mut:UitslagQAActieAfwijkingen = AMut:UitslagQAActieAfwijkingen
      Mut:UitslagQAUitgevoerdDoor = AMut:UitslagQAUitgevoerdDoor
      
  	Access:Mutatie.Insert()
      db.DebugOut('Insert-mutatie ' & Mut:MutatieID)			
  END
  
  LOOP i# = 1 TO RECORDS(GLO:UitslagMutatieQueue)
  	CLEAR(GLO:UitslagMutatieQueue)
  	GET(GLO:UitslagMutatieQueue, i#)
  	
  	db.DebugOut('Opslaan '& CLIP(UMQ:PArtijCelID) & ',' & UMQ:Pallet & ',' & UMQ:KG)
  	
  	IF UMQ:PartijCelID<>'' AND (UMQ:Pallet<>0 OR UMQ:KG<>0)
  		Mut:PartijID = UMQ:PartijID
  		Mut:UitslagKG = UMQ:KG
  		Mut:UitslagPallet = UMQ:Pallet
          Mut:CelID = UMQ:CelID
          Mut:CelLocatieID = UMQ:CelLocatieID
  		Mut:SoortMutatie = 'UIT'
  		Mut:PlanningID = AMut:PlanningID
          Mut:ArtikelID = AMut:ArtikelID
          Mut:AlternatieveArtikelOms = AMut:AlternatieveArtikelOms
  		Mut:DatumTijd_DATE = AMut:DatumTijd_DATE
          Mut:DatumTijd_TIME = AMut:DatumTijd_TIME
          
          ! Kwaliteit-checks worden ook gekopieerd
          Mut:UitslagQATransportmiddelSchoon = AMut:UitslagQATransportmiddelSchoon
          Mut:UitslagQAVerpakkingSchoonGesloten = AMut:UitslagQAVerpakkingSchoonGesloten
          Mut:UitslagQAIdentificatieMerkenVerpakking = AMut:UitslagQAIdentificatieMerkenVerpakking
          Mut:UitslagQATemperatuur1 = AMut:UitslagQATemperatuur1
          Mut:UitslagQATemperatuur2 = AMut:UitslagQATemperatuur2
          Mut:UitslagQATemperatuur3 = AMut:UitslagQATemperatuur3
          Mut:UitslagQAActieAfwijkingen = AMut:UitslagQAActieAfwijkingen
          Mut:UitslagQAUitgevoerdDoor = AMut:UitslagQAUitgevoerdDoor
          
  		Access:Mutatie.Insert()
  		db.DebugOut('Insert-mutatie ' & Mut:MutatieID)			
  	.
  .
  
  Mut:Record = AMut:Record
  
  !DO WisRareMutaties
  
  VoorraadClass.BerekenPlanningMutatieGrootte(Pla:PlanningID)
    ThisNetRefresh.Send('|') ! NetTalk (NetRefresh)
      db.Debugout('NetRefreshVoorraadViews()')
      NetRefreshVoorraadViews()
  	NetRefreshPlanningViews()
      db.Debugout('NetRefreshVoorraadViews()')
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
  ?Mut:UitslagQATransportmiddelSchoon{PROP:Background}=CHOOSE(Mut:UitslagQATransportmiddelSchoon,COLOR:NONE,COLOR:RED)
  ?Mut:UitslagQAVerpakkingSchoonGesloten{PROP:Background}=CHOOSE(Mut:UitslagQAVerpakkingSchoonGesloten,COLOR:NONE,COLOR:RED)
  ?Mut:UitslagQAIdentificatieMerkenVerpakking{PROP:Background}=CHOOSE(Mut:UitslagQAIdentificatieMerkenVerpakking,COLOR:NONE,COLOR:RED)
  ?Mut:UitslagQAIsGeurKleurProductEigen{PROP:Background}=CHOOSE(Mut:UitslagQAIsGeurKleurProductEigen,COLOR:NONE,COLOR:RED)
  ?Mut:UitslagQAGeenGlasbreuk{PROP:Background}=CHOOSE(Mut:UitslagQAGeenGlasbreuk,COLOR:NONE,COLOR:RED)
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

ThisWindow.ControleerDuplicaat PROCEDURE(STRING PRM:PartijCelID)

  CODE
  	count# = 0
  	IF (PRM:PartijCelID = LOC:PartijCelID)
  		count# += 1
  	.
  
  	IF (PRM:PartijCelID = LOC:PartijCelID2)
  		count# += 1
  	.
  
  	IF (PRM:PartijCelID = LOC:PartijCelID3)
  		count# += 1
  	.
  	
  	IF (PRM:PartijCelID = LOC:PartijCelID4)
  		count# += 1
  	.
  	
  	LOOP i# = 1 TO RECORDS(GLO:UitslagMutatieQueue)
  		GET(GLO:UitslagMutatieQueue, i#)
  		IF (PRM:PartijCelID = UMQ:PartijCelID)
  			count# += 1
  		.
  	.
  
  	RETURN count#


ThisWindow.BepaalCorrectieVoorraad PROCEDURE(STRING PRM:PartijCelID)

  CODE
  LOC:CorrectieKG = 0
  LOC:CorrectiePallets = 0
  LOOP i# = 1 TO LOC:AantalOrigineel
  	IF LOC:OrigineelPartijCelID[i#] <> '' AND LOC:OrigineelPartijCelID[i#]=PRM:PartijCelID THEN	
  		LOC:CorrectieKG += LOC:OrigineelKG[i#]
  		LOC:CorrectiePallets += LOC:OrigineelPallets[i#]
  	.
  .



Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window


FDCB7.SetQueueRecord PROCEDURE

  CODE
  IF VVP:ArtikelID <> LOC:OrigineelArtikelID THEN
  	LOC:ArtikelVoorraadKG=VVP:InslagKG-VVP:UitslagKG
  	LOC:ArtikelVoorraadPallet=VVP:InslagPallets-VVP:UitslagPallets
  ELSE
  	LOC:ArtikelVoorraadKG=VVP:InslagKG-VVP:UitslagKG
  	LOC:ArtikelVoorraadPallet=VVP:InslagPallets-VVP:UitslagPallets
  	LOOP i# = 1 TO LOC:AantalOrigineel
  		LOC:ArtikelVoorraadKG += LOC:OrigineelKG[i#]
  		LOC:ArtikelVoorraadPallet += LOC:OrigineelPallets[i#]
  	.
  .
  PARENT.SetQueueRecord
  


FDCB7.ValidateRecord PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  IF VVP:ArtikelID <> LOC:OrigineelArtikelID THEN
  	LOC:ArtikelVoorraadKG=VVP:InslagKG-VVP:UitslagKG
  	LOC:ArtikelVoorraadPallet=VVP:InslagPallets-VVP:UitslagPallets
  ELSE
  	LOC:ArtikelVoorraadKG=VVP:InslagKG-VVP:UitslagKG
  	LOC:ArtikelVoorraadPallet=VVP:InslagPallets-VVP:UitslagPallets
  	LOOP i# = 1 TO LOC:AantalOrigineel
  		LOC:ArtikelVoorraadKG += LOC:OrigineelKG[i#]
  		LOC:ArtikelVoorraadPallet += LOC:OrigineelPallets[i#]
  	.
  .
  
  !IF LOC:ArtikelVoorraadKG<=0 AND LOC:ArtikelVoorraadPallet<=0 THEN
  !	RETURN Record:Filtered
  !END
  ReturnValue = PARENT.ValidateRecord()
  RETURN ReturnValue


FDCB4.SetQueueRecord PROCEDURE

  CODE
  LOC:PartijVoorraadKG1=VVPar:VoorraadKG
  LOC:PartijVoorraadPallet1=VVPar:VoorraadPallets
  
  LOOP i# = 1 TO LOC:AantalOrigineel
  	IF LOC:OrigineelPartijCelID[i#] = VVPar:PartijCelID 
  		LOC:PartijVoorraadKG1+=LOC:OrigineelKG[i#]
  		LOC:PartijVoorraadPallet1+=LOC:OrigineelPallets[i#]
  		BREAK
  	END
  END
  PARENT.SetQueueRecord
  


FDCB4.ValidateRecord PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  LOC:PartijVoorraadKG1=VVPar:VoorraadKG
  LOC:PartijVoorraadPallet1=VVPar:VoorraadPallets
  
  LOOP i# = 1 TO LOC:AantalOrigineel
  	IF LOC:OrigineelPartijCelID[i#] = VVPar:PartijCelID 
  		LOC:PartijVoorraadKG1+=LOC:OrigineelKG[i#]
  		LOC:PartijVoorraadPallet1+=LOC:OrigineelPallets[i#]
  		BREAK
  	END
  END
  
  IF LOC:PartijVoorraadKG1 <= 0 THEN
  	RETURN Record:Filtered
  END
  
  ReturnValue = PARENT.ValidateRecord()
  RETURN ReturnValue


FDCB10.SetQueueRecord PROCEDURE

  CODE
  LOC:PartijVoorraadKG2=AVVPar:VoorraadKG
  LOC:PartijVoorraadPallet2=AVVPar:VoorraadPallets
  
  LOOP i# = 1 TO LOC:AantalOrigineel
  	IF LOC:OrigineelPartijCelID[i#] = AVVPar:PartijCelID 
  		LOC:PartijVoorraadKG2+=LOC:OrigineelKG[i#]
  		LOC:PartijVoorraadPallet2+=LOC:OrigineelPallets[i#]
  		BREAK
  	END
  END
  PARENT.SetQueueRecord
  


FDCB10.ValidateRecord PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  LOC:PartijVoorraadKG2=AVVPar:VoorraadKG
  LOC:PartijVoorraadPallet2=AVVPar:VoorraadPallets
  
  LOOP i# = 1 TO LOC:AantalOrigineel
  	IF LOC:OrigineelPartijCelID[i#] = AVVPar:PartijCelID 
  		LOC:PartijVoorraadKG2+=LOC:OrigineelKG[i#]
  		LOC:PartijVoorraadPallet2+=LOC:OrigineelPallets[i#]
  		BREAK
  	END
  END
  
  IF LOC:PartijVoorraadKG2 <= 0 THEN
  	RETURN Record:Filtered
  END
  ReturnValue = PARENT.ValidateRecord()
  RETURN ReturnValue


FDCB11.SetQueueRecord PROCEDURE

  CODE
  LOC:PartijVoorraadKG3=AAVVPar:VoorraadKG
  LOC:PartijVoorraadPallet3=AAVVPar:VoorraadPallets
  
  LOOP i# = 1 TO LOC:AantalOrigineel
  	IF LOC:OrigineelPartijCelID[i#] = AAVVPar:PartijCelID 
  		LOC:PartijVoorraadKG3+=LOC:OrigineelKG[i#]
  		LOC:PartijVoorraadPallet3+=LOC:OrigineelPallets[i#]
  		BREAK
  	END
  END
  PARENT.SetQueueRecord
  


FDCB11.ValidateRecord PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  LOC:PartijVoorraadKG3=AAVVPar:VoorraadKG
  LOC:PartijVoorraadPallet3=AAVVPar:VoorraadPallets
  
  LOOP i# = 1 TO LOC:AantalOrigineel
  	IF LOC:OrigineelPartijCelID[i#] = AAVVPar:PartijCelID 
  		LOC:PartijVoorraadKG3+=LOC:OrigineelKG[i#]
  		LOC:PartijVoorraadPallet3+=LOC:OrigineelPallets[i#]
  		BREAK
  	END
  END
  
  IF LOC:PartijVoorraadKG3 <= 0 THEN
  	RETURN Record:Filtered
  END
  ReturnValue = PARENT.ValidateRecord()
  RETURN ReturnValue


FDCB12.SetQueueRecord PROCEDURE

  CODE
  LOC:PartijVoorraadKG4=AAAVVPar:VoorraadKG
  LOC:PartijVoorraadPallet4=AAAVVPar:VoorraadPallets
  
  LOOP i# = 1 TO LOC:AantalOrigineel
  	IF LOC:OrigineelPartijCelID[i#] = AAAVVPar:PartijCelID 
  		LOC:PartijVoorraadKG4+=LOC:OrigineelKG[i#]
  		LOC:PartijVoorraadPallet4+=LOC:OrigineelPallets[i#]
  		BREAK
  	END
  END
  PARENT.SetQueueRecord
  


FDCB12.ValidateRecord PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  LOC:PartijVoorraadKG4=AAAVVPar:VoorraadKG
  LOC:PartijVoorraadPallet4=AAAVVPar:VoorraadPallets
  
  LOOP i# = 1 TO LOC:AantalOrigineel
  	IF LOC:OrigineelPartijCelID[i#] = AAAVVPar:PartijCelID 
  		LOC:PartijVoorraadKG4+=LOC:OrigineelKG[i#]
  		LOC:PartijVoorraadPallet4+=LOC:OrigineelPallets[i#]
  		BREAK
  	END
  END
  
  IF LOC:PartijVoorraadKG4 <= 0 THEN
  	RETURN Record:Filtered
  END
  ReturnValue = PARENT.ValidateRecord()
  RETURN ReturnValue


FDCB13.ValidateRecord PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  !b.Debugout(LOC:PartijCelID&'|'&CL:CelLocatieID)
  
  IF LOC:PartijCelID=''
      Return Record:OutOfRange
  ELSE
      IF PartjCelLocatieCs.CheckPCLQ(SUB(LOC:PartijCelID,1,6),SUB(LOC:PartijCelID,7,20),CL:CelLocatieID)=FALSE
          Return Record:Filtered
      END            
  !    Clear(VPCL:Record)
  !      VPCL:PartijID=SUB(LOC:PartijCelID2,1,6)
  !      VPCL:CelID=SUB(LOC:PartijCelID2,7,20)
  !      VPCL:CelLocatieID=ACL:CelLocatieID
  !      if Access:ViewPartijCelLocaties.Fetch(VPCL:ViewPartijCelLocaties_PK)<>Level:Benign 
  !          Return Record:Filtered
  !      END
  END
      
            
  !        IF LOC:PartijCelID='' OR VVPar:PartijID=0 OR VVPar:CelID=0
  !            Return Record:OutOfRange
  !  !        ELSE
  !  !             IF PartjCelLocatieCs.CheckPCLQ(SUB(LOC:PartijCelID,1,6),SUB(LOC:PartijCelID,7,20),CL:CelLocatieID)=FALSE
  !  !          Return Record:Filtered
  !        END
  !  !      Clear(VPCL:Record)
  !  !      VPCL:PartijID=SUB(LOC:PartijCelID,1,6)
  !  !      VPCL:CelID=SUB(LOC:PartijCelID,7,20)
  !  !      VPCL:CelLocatieID=CL:CelLocatieID
  !  !      if Access:ViewPartijCelLocaties.Fetch(VPCL:ViewPartijCelLocaties_PK)<>Level:Benign 
  !  !          Return Record:Filtered
  !  !      END
  !        !ND
  !      
            
  ReturnValue = PARENT.ValidateRecord()
  RETURN ReturnValue


FDCB14.ValidateRecord PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  IF LOC:PartijCelID2=''
      Return Record:OutOfRange
  ELSE
      IF PartjCelLocatieCs.CheckPCLQ(SUB(LOC:PartijCelID2,1,6),SUB(LOC:PartijCelID2,7,20),ACL:CelLocatieID)=FALSE
          Return Record:Filtered
      END            
  !    Clear(VPCL:Record)
  !      VPCL:PartijID=SUB(LOC:PartijCelID2,1,6)
  !      VPCL:CelID=SUB(LOC:PartijCelID2,7,20)
  !      VPCL:CelLocatieID=ACL:CelLocatieID
  !      if Access:ViewPartijCelLocaties.Fetch(VPCL:ViewPartijCelLocaties_PK)<>Level:Benign 
  !          Return Record:Filtered
  !      END
  END
      
            
  ReturnValue = PARENT.ValidateRecord()
  RETURN ReturnValue


FDCB15.ValidateRecord PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  IF LOC:PartijCelID3=''
      Return Record:OutOfRange
  ELSE
      IF PartjCelLocatieCs.CheckPCLQ(SUB(LOC:PartijCelID3,1,6),SUB(LOC:PartijCelID3,7,20),AACL:CelLocatieID)=FALSE
          Return Record:Filtered
      END            
  !    Clear(VPCL:Record)
  !      VPCL:PartijID=SUB(LOC:PartijCelID3,1,6)
  !      VPCL:CelID=SUB(LOC:PartijCelID3,7,20)
  !      VPCL:CelLocatieID=AACL:CelLocatieID
  !      if Access:ViewPartijCelLocaties.Fetch(VPCL:ViewPartijCelLocaties_PK)<>Level:Benign 
  !          Return Record:Filtered
  !      END
  END
      
            
  ReturnValue = PARENT.ValidateRecord()
  RETURN ReturnValue


FDCB16.ValidateRecord PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  IF LOC:PartijCelID4=''
      Return Record:OutOfRange
  ELSE
       IF PartjCelLocatieCs.CheckPCLQ(SUB(LOC:PartijCelID4,1,6),SUB(LOC:PartijCelID4,7,20),AAACL:CelLocatieID)=FALSE
            Return Record:Filtered
        END
  !    Clear(VPCL:Record)
  !    VPCL:PartijID=SUB(LOC:PartijCelID4,1,6)
  !    VPCL:CelID=SUB(LOC:PartijCelID4,7,20)
  !    VPCL:CelLocatieID=AAACL:CelLocatieID
  !    if Access:ViewPartijCelLocaties.Fetch(VPCL:ViewPartijCelLocaties_PK)<>Level:Benign 
  !        Return Record:Filtered
  !    END
  END
      
            
  ReturnValue = PARENT.ValidateRecord()
  RETURN ReturnValue

