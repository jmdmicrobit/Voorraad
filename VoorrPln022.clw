

   MEMBER('VoorrPln.clw')                                  ! This is a MEMBER module


   INCLUDE('ABDROPS.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('VOORRPLN022.INC'),ONCE        !Local module procedure declarations
                     END


!!! <summary>
!!! Generated from procedure template - Window
!!! Uitslage via Weging
!!! </summary>
UpdateUitslagMutatieWeging PROCEDURE 

CurrentTab           STRING(80)                            ! 
LOC:PartijCelID2     CSTRING(26)                           ! 
LOC:PartijID2        LONG                                  ! 
LOC:PartijCelID3     CSTRING(26)                           ! 
LOC:PartijID3        LONG                                  ! 
LOC:PartijCelID4     CSTRING(26)                           ! 
LOC:PartijID4        LONG                                  ! 
Loc:CelLocatieID1    LONG                                  ! 
Loc:CelLocatieID2    LONG                                  ! 
Loc:CelLocatieID3    LONG                                  ! 
Loc:CelLocatieID4    LONG                                  ! 
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
LOC:WegingQueue4     QUEUE,PRE(WGQ4)                       ! 
BrutoGewichtKG       DECIMAL(10,2)                         ! 
Palletsoort          CSTRING(11)                           ! 
PalletsoortID        LONG                                  ! 
NettoGewichtKG       DECIMAL(9,2)                          ! 
Datum                DATE                                  ! 
Tijd                 TIME                                  ! 
PalletID             LONG                                  ! 
                     END                                   ! 
LOC:WegingQueue3     QUEUE,PRE(WGQ3)                       ! 
BrutoGewichtKG       DECIMAL(10,2)                         ! 
Palletsoort          CSTRING(11)                           ! 
PalletsoortID        LONG                                  ! 
NettoGewichtKG       DECIMAL(10,2)                         ! 
Datum                DATE                                  ! 
Tijd                 TIME                                  ! 
PalletID             LONG                                  ! 
                     END                                   ! 
LOC:WegingQueue2     QUEUE,PRE(WGQ2)                       ! 
BrutoGewichtKG       DECIMAL(10,2)                         ! 
Palletsoort          CSTRING(11)                           ! 
PalletsoortID        LONG                                  ! 
NettoGewichtKG       DECIMAL(10,2)                         ! 
Datum                DATE                                  ! 
Tijd                 TIME                                  ! 
PalletID             LONG                                  ! 
                     END                                   ! 
LOC:WegingQueue1     QUEUE,PRE(WGQ1)                       ! 
BrutoGewichtKG       DECIMAL(10,2)                         ! 
Palletsoort          CSTRING(11)                           ! 
PalletsoortID        LONG                                  ! 
NettoGewichtKG       DECIMAL(10,2)                         ! 
Datum                DATE                                  ! 
Tijd                 TIME                                  ! 
PalletID             LONG                                  ! 
                     END                                   ! 
LOC:CMRArtikelOms    CSTRING(201)                          ! 
LOC:OudArtikelID     LONG                                  ! 
LOC:HuidigArtikelOms CSTRING(201)                          ! 
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
QuickWindow          WINDOW('Uitslag Weging'),AT(,,784,424),FONT('MS Sans Serif',8,,,CHARSET:DEFAULT),DOUBLE,CENTER, |
  GRAY,IMM,MDI,HLP('UpdateUitslagMutatie'),SYSTEM
                       PROMPT('Invoerdatum:'),AT(7,14),USE(?Mut:DatumTijd_DATE:Prompt),TRN
                       ENTRY(@d6-),AT(82,15,64,10),USE(Mut:DatumTijd_DATE),SKIP
                       PROMPT('Invoertijd:'),AT(166,15),USE(?Mut:DatumTijd_TIME:Prompt),TRN
                       ENTRY(@t7),AT(203,15,56,10),USE(Mut:DatumTijd_TIME),SKIP
                       GROUP('Artikelomschrijving (CMR / Palletblad)'),AT(299,1,483,40),USE(?GROUP2:2),FONT(,8,,, |
  CHARSET:DEFAULT),BOXED
                         STRING('Klant-specifieke artikelnaam:'),AT(307,11,91,10),USE(?STRING1:2)
                         STRING(@s100),AT(413,11,281),USE(LOC:CMRArtikelOms),FONT('Microsoft Sans Serif',,,FONT:regular), |
  LEFT
                         PROMPT('Artikelomschrijving:'),AT(306,23,103,12),USE(?Pla:AlternatieveArtikelOms:Prompt)
                         ENTRY(@s200),AT(453,24,241,10),USE(Mut:AlternatieveArtikelOms)
                         BUTTON,AT(414,23,33,14),USE(?OvernemenButton),FONT('Microsoft Sans Serif',,COLOR:BTNFACE,FONT:regular), |
  ICON('overnemen.png'),TIP('Overnemen klant-specifieke artikelnaam')
                         BUTTON('Wijzigen'),AT(701,9,57,14),USE(?ChangeCMRArtikel),FONT('Microsoft Sans Serif',,,FONT:regular), |
  LEFT,ICON('WAChange.ico')
                       END
                       PROMPT('Artikel:'),AT(6,52),USE(?PROMPT1)
                       COMBO(@s60),AT(81,52,276,10),USE(VVP:ArtikelOms),DROP(25),FORMAT('64L(2)|~Artikel ID~C(' & |
  '0)@s30@111L(2)|~Artikel~C(2)@s60@[54R(2)|~KG~C(0)@n12`2@60R(2)|~Pallets~C(0)@n-14.@]|'), |
  FROM(Queue:FileDropCombo),IMM
                       STRING('KG'),AT(410,42),USE(?STRING1)
                       STRING('Pallets'),AT(473,42),USE(?STRING2)
                       PROMPT('Partijen:'),AT(6,93),USE(?PROMPT2)
                       COMBO(@s25),AT(81,93,246,10),USE(VVPar:PartijCelID),VSCROLL,DROP(5,400),FORMAT('0L(2)|~Par' & |
  'tij.Cel~C(0)@s25@[45R(2)|~Intern~C(0)@n_10@45R(2)|~Extern~C(0)@s20@](90)|~Partijnumm' & |
  'er~45L(2)|~Cel~C(0)@s50@46R(2)|~Inslagdatum~C(0)@d17@52R(2)|~Inkoop KG-Prijs~C(0)@n1' & |
  '3`3@[49R(2)|M~KG~C(1)@n-12`2@60R(2)|M~Pallets~C(1)@n-14.@](101)|~Voorraad~50L(2)|~Ve' & |
  'rpakking~C(0)@s50@50L(2)|~Leverancier~C(0)@s50@'),FROM(Queue:FileDropCombo:1),IMM
                       PROMPT('Cel:'),AT(82,125),USE(?PROMPT3)
                       ENTRY(@n12_`2),AT(367,93,54,10),USE(Mut:UitslagKG),RIGHT
                       ENTRY(@n12.),AT(434,93,60,10),USE(Mut:UitslagPallet),RIGHT
                       COMBO(@s50),AT(126,136,202,10),USE(CL:Locatienaam),DROP(5),FORMAT('200L(2)|M~Locatienaa' & |
  'm~L(0)@s50@'),FROM(Queue:FileDropCombo:5),IMM
                       PROMPT('Leverancier:'),AT(82,106),USE(?PROMPT4)
                       PROMPT('Verpakking:'),AT(82,115),USE(?PROMPT5)
                       STRING(@s50),AT(127,106,233),USE(VVPar:LeverancierFirmanaam)
                       STRING(@s50),AT(127,115,234),USE(VVPar:VerpakkingOmschrijving)
                       STRING(@s50),AT(127,125,234),USE(VVPar:CelOms)
                       STRING(@s50),AT(125,65,231),USE(Art:ArtikelOms)
                       STRING(@S50),AT(80,2,226),USE(AREL:FirmaNaam)
                       PROMPT('Klant:'),AT(7,2),USE(?PROMPT6)
                       COMBO(@s25),AT(82,154,246,10),USE(AVVPar:PartijCelID),VSCROLL,DROP(5,400),FORMAT('0L(2)|~Par' & |
  'tij.Cel~C(0)@s25@[45R(2)|~Intern~C(0)@n_10@45R(2)|~Extern~C(0)@s20@](90)|~Partijnumm' & |
  'er~45L(2)|~Cel~C(0)@s50@46R(2)|~Inslagdatum~C(0)@d17@52R(2)|~Inkoop KG-Prijs~C(0)@n1' & |
  '3`3@[49R(2)|M~KG~C(1)@n-12`2@60R(2)|M~Pallets~C(1)@n-14.@](101)|~Voorraad~50L(2)|~Ve' & |
  'rpakking~C(0)@s50@50L(2)|~Leverancier~C(0)@s50@'),FROM(Queue:FileDropCombo:2),IMM
                       ENTRY(@n12_`2),AT(369,154,53,10),USE(LOC:UitslagKG2),RIGHT
                       ENTRY(@n12.),AT(435,154,60,10),USE(LOC:UitslagPallet2),RIGHT
                       COMBO(@s50),AT(130,198,199,10),USE(ACL:Locatienaam),DROP(5),FORMAT('200L(2)|M~Locatiena' & |
  'am~L(0)@s50@'),FROM(Queue:FileDropCombo:6),IMM
                       COMBO(@s25),AT(82,217,246,10),USE(AAVVPar:PartijCelID),VSCROLL,DROP(5,400),FORMAT('0L(2)|~Par' & |
  'tij.Cel~C(0)@s25@[45R(2)|~Intern~C(0)@n_10@45R(2)|~Extern~C(0)@s20@](90)|~Partijnumm' & |
  'er~45L(2)|~Cel~C(0)@s50@46R(2)|~Inslagdatum~C(0)@d17@52R(2)|~Inkoop KG-Prijs~C(0)@n1' & |
  '3`3@[49R(2)|M~KG~C(1)@n-12`2@60R(2)|M~Pallets~C(1)@n-14.@](101)|~Voorraad~50L(2)|~Ve' & |
  'rpakking~C(0)@s50@50L(2)|~Leverancier~C(0)@s50@'),FROM(Queue:FileDropCombo:3),IMM
                       ENTRY(@n12_`2),AT(369,217,53,10),USE(LOC:UitslagKG3),RIGHT
                       ENTRY(@n12.),AT(434,217,60,10),USE(LOC:UitslagPallet3),RIGHT
                       COMBO(@s50),AT(127,264,201,10),USE(AACL:Locatienaam),DROP(5),FORMAT('200L(2)|M~Locatien' & |
  'aam~L(0)@s50@'),FROM(Queue:FileDropCombo:7),IMM
                       COMBO(@s25),AT(82,282,246,10),USE(AAAVVPar:PartijCelID),VSCROLL,DROP(5,400),FORMAT('0L(2)|~Par' & |
  'tij.Cel~C(0)@s25@[45R(2)|~Intern~C(0)@n_10@45R(2)|~Extern~C(0)@s20@](90)|~Partijnumm' & |
  'er~45L(2)|~Cel~C(0)@s50@46R(2)|~Inslagdatum~C(0)@d17@52R(2)|~Inkoop KG-Prijs~C(0)@n1' & |
  '3`3@[49R(2)|M~KG~C(1)@n-12`2@60R(2)|M~Pallets~C(1)@n-14.@](101)|~Voorraad~50L(2)|~Ve' & |
  'rpakking~C(0)@s50@50L(2)|~Leverancier~C(0)@s50@'),FROM(Queue:FileDropCombo:4),IMM
                       ENTRY(@n12_`2),AT(370,282,53,10),USE(LOC:UitslagKG4),RIGHT
                       ENTRY(@n12.),AT(435,282,60,10),USE(LOC:UitslagPallet4),RIGHT
                       COMBO(@s50),AT(127,330,201,10),USE(AAACL:Locatienaam),DROP(5),FORMAT('200L(2)|M~Locatie' & |
  'naam~L(0)@s50@'),FROM(Queue:FileDropCombo:8),IMM
                       PROMPT('Leverancier:'),AT(83,168),USE(?PROMPT7)
                       PROMPT('Verpakking:'),AT(83,177),USE(?PROMPT8)
                       PROMPT('Cel:'),AT(83,186),USE(?PROMPT9)
                       STRING(@S50),AT(129,168,201),USE(AVVPar:LeverancierFirmanaam)
                       STRING(@S50),AT(129,177,201),USE(AVVPar:VerpakkingOmschrijving)
                       STRING(@S50),AT(129,186,201),USE(AVVPar:CelOms)
                       PROMPT('Leverancier:'),AT(83,231),USE(?PROMPT10)
                       PROMPT('Verpakking:'),AT(83,241),USE(?PROMPT11)
                       PROMPT('Cel:'),AT(83,250),USE(?PROMPT12)
                       STRING(@S50),AT(127,231,202),USE(AAVVPar:LeverancierFirmanaam)
                       STRING(@S50),AT(127,241,203),USE(AAVVPar:VerpakkingOmschrijving)
                       STRING(@S50),AT(127,250,201,10),USE(AAVVPar:CelOms)
                       PROMPT('Leverancier:'),AT(82,297),USE(?PROMPT13)
                       PROMPT('Verpakking:'),AT(82,307,40,10),USE(?PROMPT14)
                       PROMPT('Cel:'),AT(82,318,40,10),USE(?PROMPT15)
                       STRING(@s50),AT(129,297,200),USE(AAAVVPar:LeverancierFirmanaam)
                       STRING(@S50),AT(129,307,201),USE(AAAVVPar:VerpakkingOmschrijving)
                       STRING(@S50),AT(129,318,201),USE(AAAVVPar:CelOms)
                       PROMPT('KGVerschil'),AT(389,80),USE(?KGBalans),FONT('Microsoft Sans Serif',,,FONT:regular), |
  RIGHT
                       PROMPT('PalletVerschil'),AT(453,80),USE(?PalletsBalans)
                       BUTTON('&OK'),AT(5,74,49,14),USE(?OK),LEFT,ICON('WAOK.ICO'),DEFAULT,FLAT,MSG('Accept dat' & |
  'a and close the window'),TIP('Accept data and close the window')
                       BUTTON('&Annuleer'),AT(57,74,64,14),USE(?Cancel),LEFT,ICON('WACANCEL.ICO'),FLAT,MSG('Cancel operation'), |
  TIP('Cancel operation')
                       ENTRY(@n12.),AT(434,53,60,10),USE(LOC:TotaalUitslagPallet),RIGHT
                       ENTRY(@n12_`2),AT(367,53,54,10),USE(LOC:TotaalUitslagKG),RIGHT
                       LIST,AT(82,353,447,40),USE(?UitslagMutatieList),VSCROLL,FORMAT('86L(2)|~Partij / Cel-ID' & |
  '~C(0)@s25@100L(2)|~Leverancier~C(0)@s50@100L(2)|~Verpakking~C(0)@s50@0L(2)|@n-14@0L(' & |
  '2)|@n-14@53R(2)|~KG~C(0)@n-13`2@56R(2)|~Pallets~C(1)@n-13.@0R(2)|~Cel Locatie ID~C(1' & |
  ')@n-14@200L(2)|~Locatie Naam~@s50@'),FROM(GLO:UitslagMutatieQueue)
                       BUTTON('Toevoegen'),AT(82,398),USE(?InsertButton)
                       BUTTON('&Verwijderen'),AT(187,398),USE(?DeleteButton)
                       BUTTON('&Wijzigen'),AT(135,398,48,14),USE(?ChangeButton)
                       LIST,AT(337,106,266,27),USE(?WegingList1),VSCROLL,FORMAT('60R(2)|~Bruto (KG)~C(0)@n14`2' & |
  '@45C|~Palletsoort~@s10@0C(2)@n-14@60R(2)|~Netto (KG)~C(0)@n14`2@0R(2)@d17@0R(2)@t7@6' & |
  '0R(2)|~Pallet-ID~C(1)@n_10@'),FROM(LOC:WegingQueue1)
                       BUTTON('Weeg Nu'),AT(558,137),USE(?WeegNu1)
                       BUTTON('Toevoegen'),AT(337,137),USE(?ToevoegenWeging1)
                       BUTTON('Verwijderen'),AT(430,137),USE(?VerwijderenWeging1)
                       BUTTON('Wijzigen'),AT(387,137,41),USE(?WijzigenWeging1)
                       LIST,AT(337,168,265,28),USE(?WegingList2),VSCROLL,FORMAT('60R(2)|~Bruto (KG)~C(0)@n14`2' & |
  '@45C|~Palletsoort~@s10@0L(2)@n-14@60R(2)|~Netto (KG)~C(0)@n14`2@0R@d17@0R@t7@60R(2)|' & |
  '~Pallet-ID~C(1)@n_10@'),FROM(LOC:WegingQueue2)
                       BUTTON('Wijzigen'),AT(387,199,41,14),USE(?WijzigenWeging2)
                       BUTTON('Verwijderen'),AT(430,199,53,14),USE(?VerwijderenWeging2)
                       BUTTON('Toevoegen'),AT(337,199,51,14),USE(?ToevoegenWeging2)
                       BUTTON('Weeg Nu'),AT(558,199,45,14),USE(?WeegNu2)
                       LIST,AT(337,232,266,29),USE(?WegingList3),VSCROLL,FORMAT('60R(2)|~Bruto (KG)~C(0)@n14`2' & |
  '@45C|~Palletsoort~@s10@0L(2)@n-14@60R(2)|~Netto (KG)~C(0)@n14`2@0R(2)@d17@0R(2)@t7@6' & |
  '0R(2)|~Pallet-ID~C(1)@n_10@'),FROM(LOC:WegingQueue3)
                       BUTTON('Weeg Nu'),AT(558,263,45,14),USE(?WeegNu3)
                       BUTTON('Toevoegen'),AT(337,263,51,14),USE(?ToevoegenWeging3)
                       BUTTON('Verwijderen'),AT(430,263,53,14),USE(?VerwijderenWeging3)
                       BUTTON('Wijzigen'),AT(387,263,41,14),USE(?WijzigenWeging3)
                       LIST,AT(337,297,265,28),USE(?WegingList4),VSCROLL,FORMAT('60R(2)|~Bruto (KG)~C(0)@n14`2' & |
  '@45C|~Palletsoort~@s10@0L(2)@n-14@60R(2)|~Netto (KG)~C(0)@n14`2@0R(2)@d17@0R(2)@t7@6' & |
  '0R(2)|~Pallet-ID~C(1)@n_10@'),FROM(LOC:WegingQueue4)
                       BUTTON('Wijzigen'),AT(387,328,41,14),USE(?WijzigenWeging4)
                       BUTTON('Verwijderen'),AT(430,328,53,14),USE(?VerwijderenWeging4)
                       BUTTON('Toevoegen'),AT(337,328,51,14),USE(?ToevoegenWeging4)
                       BUTTON('Weeg Nu'),AT(558,328,45,14),USE(?WeegNu4)
                       BUTTON('Etiket'),AT(486,137,34),USE(?EtiketButton)
                       BUTTON('Etiket'),AT(486,199,34),USE(?EtiketButton2)
                       BUTTON('Etiket'),AT(486,263,34),USE(?EtiketButton3)
                       BUTTON('Etiket'),AT(486,328,34),USE(?EtiketButton4)
                       BUTTON('Vul vanuit weging'),AT(498,90,65),USE(?VulWeging1)
                       BUTTON('Vul vanuit weging'),AT(498,152,65,14),USE(?VulWeging2)
                       BUTTON('Vul vanuit weging'),AT(498,214,65,14),USE(?VulWeging3)
                       BUTTON('Vul vanuit weging'),AT(499,280,65,14),USE(?VulWeging4)
                       GROUP('Kwaliteit'),AT(609,42,176,265),USE(?GROUP1),BOXED
                         CHECK('Is transportmiddel schoon?'),AT(613,52),USE(Mut:UitslagQATransportmiddelSchoon),VALUE('1', |
  '0')
                         CHECK('Is verpakking schoon en gesloten?'),AT(613,63),USE(Mut:UitslagQAVerpakkingSchoonGesloten), |
  VALUE('1','0')
                         CHECK('Identificatie merken aanwezig op verpakkingen?'),AT(613,73,167),USE(Mut:UitslagQAIdentificatieMerkenVerpakking), |
  VALUE('1','0')
                         CHECK('Is geur/kleur producteigen?'),AT(613,84),USE(Mut:UitslagQAIsGeurKleurProductEigen)
                         CHECK('Geen glasbreuk?'),AT(613,95),USE(Mut:UitslagQAGeenGlasbreuk)
                         PROMPT('Uitgevoerd door:'),AT(613,106),USE(?Mut:UitslagQAUitgevoerdDoor:Prompt)
                         ENTRY(@s40),AT(670,106,108,10),USE(Mut:UitslagQAUitgevoerdDoor)
                         PROMPT('Gemeten temperaturen:'),AT(613,116),USE(?Mut:UitslagQATemperatuur1:Prompt)
                         ENTRY(@s20),AT(614,126,50,10),USE(Mut:UitslagQATemperatuur1)
                         ENTRY(@s20),AT(670,126,50,10),USE(Mut:UitslagQATemperatuur2)
                         ENTRY(@s20),AT(729,126,50,10),USE(Mut:UitslagQATemperatuur3)
                         PROMPT('Afwijking:'),AT(613,148),USE(?Mut:UitslagQAActieAfwijkingen:Prompt)
                         ENTRY(@s20),AT(705,138,60,10),USE(Mut:UitslagQATemperatuurVervoermiddel)
                         TEXT,AT(614,156,165,20),USE(Mut:UitslagQAActieAfwijkingen),VSCROLL
                         PROMPT('Corrigerende Maatregel / voorkomen:'),AT(613,255),USE(?Mut:CorrigerendeMaatregel:Prompt)
                         PROMPT('Afgehandeld:'),AT(613,279),USE(?Mut:Afgehandeld:Prompt)
                         PROMPT('Oorzaak'),AT(613,176),USE(?Mut:oorzaak:Prompt)
                         TEXT,AT(614,186,165,15),USE(Mut:Oorzaak),VSCROLL
                         PROMPT('Transport Bedrijf'),AT(615,203),USE(?Mut:Transportbedrijf:Prompt)
                         TEXT,AT(614,215,165,15),USE(Mut:TransportBedrijf),VSCROLL
                         TEXT,AT(614,239,165,15),USE(Mut:CorrectieveMaatregel,,?Mut:CorrectieveMaatregel:2),VSCROLL
                         TEXT,AT(614,264,165,15),USE(Mut:CorrigerendeMaatregel,,?Mut:CorrigerendeMaatregel:2),VSCROLL
                         TEXT,AT(614,289,165,15),USE(Mut:Afgehandeld,,?Mut:Afgehandeld:2),VSCROLL
                         PROMPT('CorrectieveMaatregel / Direct actie'),AT(613,229),USE(?Mut:CorrectieveMaatregel:Prompt)
                         PROMPT('Temperatuur Vervoermiddel:'),AT(613,139),USE(?Mut:UitslagQATemperatuurVervoermiddel:Prompt)
                       END
                       GROUP('Palletblad-rapport'),AT(609,306,172,116),USE(?GROUP2),BOXED
                         PROMPT('Afleverdatum (12):'),AT(615,316),USE(?Mut:UitslagPalletbladDueDate12_DATE:Prompt)
                         ENTRY(@D6-B),AT(696,318,46,10),USE(Mut:UitslagPalletbladDueDate12_DATE)
                         PROMPT('Productiedatum (11):'),AT(615,328),USE(?Mut:UitslagPalletbladProductionDate11_DATE:Prompt)
                         ENTRY(@d6-B),AT(696,329,46,10),USE(Mut:UitslagPalletbladProductionDate11_DATE)
                         PROMPT('THT (15):'),AT(615,341),USE(?Mut:UitslagPalletbladSellByDate15_DATE:Prompt)
                         ENTRY(@d6-B),AT(696,341,46,10),USE(Mut:UitslagPalletbladSellByDate15_DATE)
                         ENTRY(@s50),AT(696,375,82,10),USE(GLO:UitslagPalletbladExternVerkoopID),FONT('Microsoft ' & |
  'Sans Serif',,,FONT:regular)
                         PROMPT('Harvast Date 7007:'),AT(616,352),USE(?Mut:UitslagPalletbladHarvastDate7007_DATE:Prompt)
                         ENTRY(@d6-B),AT(696,353,47,10),USE(Mut:UitslagPalletbladHarvastDate7007_DATE)
                         PROMPT('Extern Verkoop-ID:'),AT(615,375),USE(?LOC:ExternVerkoopID:Prompt)
                         STRING(@n_10),AT(695,364,49,10),USE(Ver2:VerkoopID),LEFT
                         STRING('Verkoop-ID:'),AT(615,364,44,10),USE(?STRING3:2)
                         PROMPT('Origin Live Bird:'),AT(615,387),USE(?Mut:UitslagPalletbladOriginLiveBird:Prompt)
                         ENTRY(@s50),AT(696,387,82,10),USE(Mut:UitslagPalletbladOriginLiveBird)
                         PROMPT('Origin Slauther House:'),AT(615,399),USE(?Mut:UitslagPalletbladOriginSlautherHouse:Prompt)
                         ENTRY(@s50),AT(696,399,82,10),USE(Mut:UitslagPalletbladOriginSlautherHouse)
                         PROMPT('Origin Processing:'),AT(615,411),USE(?Mut:UitslagPalletbladOriginProcessing:Prompt)
                         ENTRY(@s50),AT(696,411,82,10),USE(Mut:UitslagPalletbladOriginProcessing)
                         PROMPT('Origin Packing:'),AT(615,430),USE(?Mut:UitslagPalletbladOriginPacking:Prompt)
                         ENTRY(@s50),AT(696,430,82,10),USE(Mut:UitslagPalletbladOriginPacking)
                       END
                       BUTTON('Palletblad'),AT(521,137,37,14),USE(?PalletbladButton)
                       BUTTON('Palletblad'),AT(521,199,37,14),USE(?PalletbladButton2)
                       BUTTON('Palletblad'),AT(521,263,37,14),USE(?PalletbladButton3)
                       BUTTON('Palletblad'),AT(521,328,37,14),USE(?PalletbladButton4)
                       BUTTON('&Bekijken'),AT(245,398,48,14),USE(?ViewUMQButton),HIDE
                       BUTTON('Alle palletbladen printen'),AT(502,397),USE(?PrintPalletbladButton),HIDE
                       PROMPT('Locatie:'),AT(82,135),USE(?PROMPTLocatie)
                       PROMPT('Locatie:'),AT(83,198),USE(?PROMPTLocatie:2)
                       PROMPT('Locatie:'),AT(83,263),USE(?PROMPTLocatie:3)
                       PROMPT('Locatie:'),AT(82,330),USE(?PROMPTLocatie:4)
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
VulUitslagPalletBlad   PROCEDURE(LONG PRM:Regel)           ! New method added to this class instance
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
VulTotaal ROUTINE
	LOC:TotaalUitslagKG =  (Mut:UitslagKG+LOC:UitslagKG2+LOC:UitslagKG3+LOC:UitslagKG4)
	LOC:TotaalUitslagPallet = (Mut:UitslagPallet+LOC:UitslagPallet2+LOC:UitslagPallet3+LOC:UitslagPallet4)
		
	LOOP i# = 1 TO RECORDS(GLO:UitslagMutatieQueue)
		GET(GLO:UitslagMutatieQueue, i#)
		LOC:TotaalUitslagKG += UMQ:KG
		LOC:TotaalUitslagPallet += UMQ:Pallet
	.
	
	EXIT
BerekenTotaal       ROUTINE
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
		?KGBalans{Prop:Text} = format(LOC:BalansUitslagKG, @n-10`2)
	.
	
	IF LOC:BalansUitslagPallet = 0
		?PalletsBalans{Prop:Text} = 'Klopt'
	ELSE
		?PalletsBalans{Prop:Text} = format(LOC:BalansUitslagPallet, @n-14.)
	.
	
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

	LOOP i# = 1 TO RECORDS(GLO:WegingQueue2)
		GET(GLO:WegingQueue2, i#)
		GLO:TotaalWegingKG += GWQ2:NettoGewichtKG
		GLO:TotaalWegingPallets += 1
	END
	
	EXIT
WisMutaties         ROUTINE
	GLO:GebruikerLogHandelingOpmerking = 'UpdateUitslagMutatieWeging - WisMutaties'		
	
	! Vullen regels
	IF Mut:PlanningID <> 0
		Clear(AMut:Record)
		AMut:PlanningID = Mut:PlanningID
		SET(AMut:Mutatie_FK02, AMut:Mutatie_FK02)
		LOOP
			IF NOT(Access:AMutatie.Next() = Level:Benign) THEN BREAK.
			IF NOT(AMut:PlanningID = Mut:PlanningID) THEN BREAK.
			
			! Verwijderen weging gekoppeld aan de mutatie
			CLEAR(Weg:Record)
			Weg:MutatieID=AMut:MutatieID
			SET(Weg:FK_Weging,Weg:FK_Weging)
			LOOP
				IF NOT(Access:Weging.Next() = Level:Benign) THEN BREAK.
				IF NOT(Weg:MutatieID = AMut:MutatieID) THEN BREAK.
				
				Access:Weging.DeleteRecord(false)
			.
			
			! Huidige mutatie die geupdated wordt niet verwijderen
			IF (AMut:MutatieID=Mut:MutatieID) THEN CYCLE.

			db.DebugOut('Wis mutatie ' & AMut:MutatieID)
			Access:AMutatie.DeleteRecord(false)
		END
	END
	
	GLO:GebruikerLogHandelingOpmerking = ''		
EXIT
WisRareMutaties     ROUTINE
	GLO:GebruikerLogHandelingOpmerking = 'UpdateUitslagMutatieWeging - WisRareMutaties'	
	! Rare mutaties met leeg artikelID en Mutatie-soort worden verwijderd (blijkbaar werkt dit niet altijd goed met net geinserten records)
    Clear(AMut:Record)
	SET(AMut:Mutatie_FK03, AMut:Mutatie_FK03)
	LOOP
	   	IF NOT(Access:AMutatie.Next() = Level:Benign) THEN BREAK.
		IF NOT(AMut:ArtikelID = '') THEN BREAK.
		IF NOT(AMut:SoortMutatie = '') THEN CYCLE.
	   
	   	db.DebugOut('Wis mutatie ' & AMut:MutatieID)
	   	Access:AMutatie.DeleteRecord(false)
	END
	GLO:GebruikerLogHandelingOpmerking = ''		
	EXIT
!LaadWeging          ROUTINE
!	! Wegingen toevoegen
!	CLEAR(Weg:Record)
!	Weg:MutatieID = AMut:MutatieID
!	SET(Weg:FK_Weging,Weg:FK_Weging)
!	LOOP
!		Access:Weging.Next()
!		IF ERROR() THEN BREAK.
!		IF Weg:MutatieID <> AMut:MutatieID THEN BREAK.
!		
!		CLEAR(PalSrt:Record)
!		PalSrt:PalletSoortID = Weg:PalletSoortID
!		Access:PalletSoort.TryFetch(PalSrt:PK_PalletSoort)
!		
!		WGQ2:BrutoGewichtKG=Weg:BrutoGewicht
!		WGQ2:NettoGewichtKG=Weg:NettoGewicht
!		WGQ2:PalletsoortID=Weg:PalletSoortID
!		WGQ2:Palletsoort=PalSrt:PalletOmschrijving
!		ADD(LOC:WegingQueue2)
!	.
!	
!	EXIT
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
VulPalletBladDatums ROUTINE
    GLO:UitslagPalletbladDueDate12 = Mut:UitslagPalletbladDueDate12_DATE
    GLO:UitslagPalletbladProductionDate11 = Mut:UitslagPalletbladProductionDate11_DATE 
    GLO:UitslagPalletbladSellByDate15 = Mut:UitslagPalletbladSellByDate15_DATE
    GLO:UitslagPalletbladHarvastDate7007 = Mut:UitslagPalletbladHarvastDate7007_DATE
    
    GLO:UitslagPalletbladOriginLiveBird=Mut:UitslagPalletbladOriginLiveBird
    GLO:UitslagPalletbladOriginSlautherHouse=Mut:UitslagPalletbladOriginSlautherHouse
    GLO:UitslagPalletbladOriginProcessing=Mut:UitslagPalletbladOriginProcessing
    GLO:UitslagPalletbladOriginPacking=Mut:UitslagPalletbladOriginPacking
    
    EXIT
    
BepaalCMRArtikelOms ROUTINE
    LOC:CMRArtikelOms = GlobalClass.CMRArtikelOms(Ver2:Klant, Mut:ArtikelID)
    DISPLAY(?LOC:CMRArtikelOms)

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
  GlobalErrors.SetProcedureName('UpdateUitslagMutatieWeging')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Mut:DatumTijd_DATE:Prompt
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('LOC:ArtikelVoorraadKG',LOC:ArtikelVoorraadKG)      ! Added by: FileDropCombo(ABC)
  BIND('LOC:ArtikelVoorraadPallet',LOC:ArtikelVoorraadPallet) ! Added by: FileDropCombo(ABC)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
  SELF.AddUpdateFile(Access:Mutatie)
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
  SELF.AddHistoryField(?Mut:UitslagQAIsGeurKleurProductEigen,48)
  SELF.AddHistoryField(?Mut:UitslagQAGeenGlasbreuk,49)
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
  SELF.AddHistoryField(?Mut:UitslagPalletbladDueDate12_DATE,30)
  SELF.AddHistoryField(?Mut:UitslagPalletbladProductionDate11_DATE,34)
  SELF.AddHistoryField(?Mut:UitslagPalletbladSellByDate15_DATE,38)
  SELF.AddHistoryField(?Mut:UitslagPalletbladHarvastDate7007_DATE,58)
  SELF.AddHistoryField(?Mut:UitslagPalletbladOriginLiveBird,42)
  SELF.AddHistoryField(?Mut:UitslagPalletbladOriginSlautherHouse,43)
  SELF.AddHistoryField(?Mut:UitslagPalletbladOriginProcessing,44)
  SELF.AddHistoryField(?Mut:UitslagPalletbladOriginPacking,45)
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
  Relate:AViewVoorraadPartij.Open                          ! File AViewVoorraadPartij used by this procedure, so make sure it's RelationManager is open
  Relate:CelLocatie.SetOpenRelated()
  Relate:CelLocatie.Open                                   ! File CelLocatie used by this procedure, so make sure it's RelationManager is open
  Relate:Mutatie.Open                                      ! File Mutatie used by this procedure, so make sure it's RelationManager is open
  Relate:Pallet.Open                                       ! File Pallet used by this procedure, so make sure it's RelationManager is open
  Relate:PalletSoort.Open                                  ! File PalletSoort used by this procedure, so make sure it's RelationManager is open
  Relate:Planning.SetOpenRelated()
  Relate:Planning.Open                                     ! File Planning used by this procedure, so make sure it's RelationManager is open
  Relate:RelatieArtikelOmschrijving.Open                   ! File RelatieArtikelOmschrijving used by this procedure, so make sure it's RelationManager is open
  Relate:ViewVoorraadPartij.Open                           ! File ViewVoorraadPartij used by this procedure, so make sure it's RelationManager is open
  Relate:ViewVoorraadPlanning.Open                         ! File ViewVoorraadPlanning used by this procedure, so make sure it's RelationManager is open
  Relate:Weging.Open                                       ! File Weging used by this procedure, so make sure it's RelationManager is open
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
      FREE(PartijCelLocatiesQ)
  	FREE(GLO:WegingQueue2)
      !db.DebugOut('VulMutatie1:'& Mut:MutatieID& ','& Mut:PlanningID)
  
      DO OphalenTemperaturen
  
      IF Self.Request=ChangeRecord OR SELF.Request = ViewRecord
          GLO:UitslagPalletbladPlanningID = Mut:PlanningID
          
  		Clear(PAR:Record)
  		Par:PartijID = Mut:PartijID
  		Access:Partij.TryFetch(Par:Partij_PK)
  		
          Loc:ArtikelID = Par:ArtikelID
          GLO:UitslagPalletbladArtikelID = Loc:ArtikelID
  		Loc:RelatieID = Par:Leverancier
  		Loc:VerpakkingsID = Par:VerpakkingID
  		LOC:PartijCelID = CLIP(FORMAT(Mut:PartijID,@N05)) & '.' & CLIP(Mut:CelID)
  		Loc:CelLocatieID1=Mut:CelLocatieID
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
  		!db.DebugOut('VulMutatie2:'&Mut:PlanningID)
  
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
              WGQ1:PalletID = Weg:PalletID
              db.DebugOut('WegingQueue1 - ' & Weg:WegingID & ', ' & Weg:BrutoGewicht & ', ' & Weg:PalletID)
  			ADD(LOC:WegingQueue1)
  		.
  		
  		FREE(GLO:UitslagMutatieQueue)
  
  		IF (Mut:PlanningID <> 0)
  			i# = 2
  		   CLEAR(AMut:Record)
  		   AMut:PlanningID = Mut:PlanningID
  		   SET(AMut:Mutatie_FK02, AMut:Mutatie_FK02)
  		   LOOP
  			   Access:AMutatie.Next()
  			   IF ERROR() THEN BREAK.
  			   IF AMut:PlanningID <> Mut:PlanningID THEN BREAK.
  			   IF AMut:MutatieID = Mut:MutatieID THEN CYCLE.
  			   
  			   LOC:OrigineelPartijCelID[i#]=CLIP(FORMAT(AMut:PartijID, @N05)) & '.' & CLIP(AMut:CelID)
  			   LOC:OrigineelKG[i#] = AMut:UitslagKG
  			   LOC:OrigineelPallets[i#] = AMut:UitslagPallet
  			   db.DebugOut('VulMutatie2:'&LOC:OrigineelPartijCelID[i#]&','&LOC:OrigineelKG[i#]&','&LOC:OrigineelPallets[i#])
  			   
  			   CASE i#
  			   OF 2
  				   LOC:PartijCelID2 = LOC:OrigineelPartijCelID[i#]
  				   LOC:UitslagKG2 = AMut:UitslagKG
  				   LOC:UitslagPallet2 = AMut:UitslagPallet
  				   Loc:CelLocatieID2=AMut:CelLocatieID
  					! Wegingen toevoegen
  					CLEAR(Weg:Record)
  					Weg:MutatieID = AMut:MutatieID
  					SET(Weg:FK_Weging,Weg:FK_Weging)
  					LOOP
  						Access:Weging.Next()
  						IF ERROR() THEN BREAK.
  						IF Weg:MutatieID <> AMut:MutatieID THEN BREAK.
  						
  						CLEAR(PalSrt:Record)
  						PalSrt:PalletSoortID = Weg:PalletSoortID
  						Access:PalletSoort.TryFetch(PalSrt:PK_PalletSoort)
  						
  						WGQ2:BrutoGewichtKG=Weg:BrutoGewicht
  						WGQ2:NettoGewichtKG=Weg:NettoGewicht
  						WGQ2:PalletsoortID=Weg:PalletSoortID
                          WGQ2:Palletsoort=PalSrt:PalletOmschrijving
                          WGQ2:PalletID = Weg:PalletID
                          db.DebugOut('WegingQueue2 - ' & Weg:WegingID & ', ' & Weg:BrutoGewicht & ', ' & Weg:PalletID)
  						ADD(LOC:WegingQueue2)
  					.
  			   OF 3
  				    LOC:PartijCelID3 = LOC:OrigineelPartijCelID[i#]
  				    LOC:UitslagKG3 = AMut:UitslagKG
  					LOC:UitslagPallet3 = AMut:UitslagPallet
  				    Loc:CelLocatieID3=AMut:CelLocatieID
  					! Wegingen toevoegen
  					CLEAR(Weg:Record)
  					Weg:MutatieID = AMut:MutatieID
  					SET(Weg:FK_Weging,Weg:FK_Weging)
  					LOOP
  						Access:Weging.Next()
  						IF ERROR() THEN BREAK.
  						IF Weg:MutatieID <> AMut:MutatieID THEN BREAK.
  						
  						CLEAR(PalSrt:Record)
  						PalSrt:PalletSoortID = Weg:PalletSoortID
  						Access:PalletSoort.TryFetch(PalSrt:PK_PalletSoort)
  						
  						WGQ3:BrutoGewichtKG=Weg:BrutoGewicht
  						WGQ3:NettoGewichtKG=Weg:NettoGewicht
  						WGQ3:PalletsoortID=Weg:PalletSoortID
                          WGQ3:Palletsoort=PalSrt:PalletOmschrijving
                          WGQ3:PalletID = Weg:PalletID
  						ADD(LOC:WegingQueue3)
  					.
  			  OF 4
  				    LOC:PartijCelID4 = LOC:OrigineelPartijCelID[i#]
  				    LOC:UitslagKG4 = AMut:UitslagKG
  					LOC:UitslagPallet4 = AMut:UitslagPallet
  				    Loc:CelLocatieID4=AMut:CelLocatieID
  					! Wegingen toevoegen
  					CLEAR(Weg:Record)
  					Weg:MutatieID = AMut:MutatieID
  					SET(Weg:FK_Weging,Weg:FK_Weging)
  					LOOP
  						Access:Weging.Next()
  						IF ERROR() THEN BREAK.
  						IF Weg:MutatieID <> AMut:MutatieID THEN BREAK.
  						
  						CLEAR(PalSrt:Record)
  						PalSrt:PalletSoortID = Weg:PalletSoortID
  						Access:PalletSoort.TryFetch(PalSrt:PK_PalletSoort)
  						
  						WGQ4:BrutoGewichtKG=Weg:BrutoGewicht
  						WGQ4:NettoGewichtKG=Weg:NettoGewicht
  						WGQ4:PalletsoortID=Weg:PalletSoortID
                          WGQ4:Palletsoort=PalSrt:PalletOmschrijving
                          WGQ4:PalletID = Weg:PalletID
  						ADD(LOC:WegingQueue4)
  					.
  				ELSE
  					CLEAR(AAAAVVPar:Record)
  					AAAAVVPar:PartijCelID = LOC:OrigineelPartijCelID[i#]
  					Access:AAAAViewVoorraadPartij.TryFetch(AAAAVVPar:PartijCelID_K)
  					
  					CLEAR(GLO:UitslagMutatieQueue)
  					UMQ:PartijCelID = LOC:OrigineelPartijCelID[i#]
  					UMQ:LeverancierNaam = AAAAVVPar:LeverancierFirmanaam
  					UMQ:VerpakkingOmschrijving = AAAAVVPar:VerpakkingOmschrijving
  					UMQ:PartijID = AMut:PartijID
                      UMQ:CelID = AMut:CelID
                      UMQ:CelLocatieID=AMut:CelLocatieID
  					UMQ:KG = AMut:UitslagKG
  					UMQ:Pallet = AMut:UitslagPallet
  					ADD(GLO:UitslagMutatieQueue)
  					
  					! Wegingen toevoegen
  					CLEAR(Weg:Record)
  					Weg:MutatieID = AMut:MutatieID
  					SET(Weg:FK_Weging,Weg:FK_Weging)
  					LOOP
  						Access:Weging.Next()
  						IF ERROR() THEN BREAK.
  						IF Weg:MutatieID <> AMut:MutatieID THEN BREAK.
  						
  						CLEAR(PalSrt:Record)
  						PalSrt:PalletSoortID = Weg:PalletSoortID
  						Access:PalletSoort.TryFetch(PalSrt:PK_PalletSoort)
  						
  						GWQ2:ID=RECORDS(GLO:UitslagMutatieQueue)
  						GWQ2:BrutoGewichtKG=Weg:BrutoGewicht
  						GWQ2:NettoGewichtKG=Weg:NettoGewicht
  						GWQ2:PalletsoortID=Weg:PalletSoortID
                          GWQ2:Palletsoort=PalSrt:PalletOmschrijving
                          GWQ2:PalletID = Weg:PalletID
  						ADD(GLO:WegingQueue2)
  					.
  			   .
  			   
  			   i# += 1
  		   END
  		   
  		   LOC:TotaalUitslagKG = 0
  		   LOC:TotaalUitslagPallet = 0
  		   LOOP i# = 1 TO 100
  			   LOC:TotaalUitslagKG += LOC:OrigineelKG[i#]
  			   LOC:TotaalUitslagPallet += LOC:OrigineelPallets[i#]
  		   END
  		END
  	ELSIF SELF.Request=InsertRecord
          FREE(GLO:UitslagMutatieQueue)
          GLO:UitslagPalletbladPlanningID = Pla:PlanningID
  		
          Loc:ArtikelID = PLA:ArtikelID
          GLO:UitslagPalletbladArtikelID = Loc:ArtikelID
  		Loc:VerpakkingsID = PLA:VerpakkingID
  	!	Loc:RelatieID = Par:Leverancier
  		LOC:PartijCelID = CLIP(FORMAT(Pla:PartijID, @N05)) & '.' & CLIP(Pla:CelID)
  	
  		! Geen bestaande uitslag om rekening mee te houden
  		! bij het controleren van de voorraad
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
          Mut:AlternatieveArtikelOms = Pla:AlternatieveArtikelOms
          IF Pla:CelLocatieID<>0
              Loc:CelLocatieID1=Pla:CelLocatieID
          ELSIF VVPar:CelLocatieID<>0
              Loc:CelLocatieID1=VVPar:CelLocatieID
          ELSE
              Clear(VPCL:Record)
              VPCL:PartijID=Pla:PartijID
              VPCL:CelID=Pla:CelID
              Set(VPCL:ViewPartijCelLocaties_PK,VPCL:ViewPartijCelLocaties_PK)
              IF Access:ViewPartijCelLocaties.Next()=Level:Benign AND VPCL:PartijID=Pla:PartijID |
                  AND VPCL:CelID=Pla:CelID
                  Loc:CelLocatieID1 = VPCL:CelLocatieID
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
          Mut:CelLocatieID= Loc:CelLocatieID1
          
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
          
          Mut:UitslagPalletbladDueDate12_DATE = Pla:UitslagPalletbladDueDate12_DATE
          Mut:UitslagPalletbladProductionDate11_DATE = Pla:UitslagPalletbladProductionDate11_DATE
          Mut:UitslagPalletbladSellByDate15_DATE = Pla:UitslagPalletbladSellByDate15_DATE
          Mut:UitslagPalletbladHarvastDate7007_DATE = Pla:UitslagPalletbladHarvastDate7007_DATE
          
          Mut:UitslagPalletbladOriginLiveBird = Pla:UitslagPalletbladOriginLiveBird
          Mut:UitslagPalletbladOriginSlautherHouse = Pla:UitslagPalletbladOriginSlautherHouse
          Mut:UitslagPalletbladOriginProcessing = Pla:UitslagPalletbladOriginProcessing
          Mut:UitslagPalletbladOriginPacking = Pla:UitslagPalletbladOriginPacking
          !END
  	.
  
      DO BerekenTotaal
      
      GLO:UitslagPalletbladExternVerkoopID = Ver2:ExternVerkoopID
  
  	CLEAR(AREL:Record)
  	AREL:RelatieID = Ver2:Klant
      Access:ARelatie.TryFetch(AREL:Relatie_PK)
      
      LOC:OudArtikelID = Mut:ArtikelID
      DO BepaalCMRArtikelOms
  
  WinAlertMouseZoom()
  Do DefineListboxStyle
      Request#=SELF.Request
      IF Pla:Verwerkt
          ! hier de readonly bepalen
          ! hiervoor tijdelijk de request op View Record zetten
          SELF.Request = ViewRecord
      END
  IF SELF.Request = ViewRecord                             ! Configure controls for View Only mode
    DISABLE(?Mut:DatumTijd_DATE)
    DISABLE(?Mut:DatumTijd_TIME)
    ?Mut:AlternatieveArtikelOms{PROP:ReadOnly} = True
    DISABLE(?OvernemenButton)
    DISABLE(?ChangeCMRArtikel)
    DISABLE(?VVP:ArtikelOms)
    DISABLE(?VVPar:PartijCelID)
    DISABLE(?Mut:UitslagKG)
    DISABLE(?Mut:UitslagPallet)
    DISABLE(?CL:Locatienaam)
    DISABLE(?AVVPar:PartijCelID)
    DISABLE(?LOC:UitslagKG2)
    DISABLE(?LOC:UitslagPallet2)
    DISABLE(?ACL:Locatienaam)
    DISABLE(?AAVVPar:PartijCelID)
    DISABLE(?LOC:UitslagKG3)
    DISABLE(?LOC:UitslagPallet3)
    DISABLE(?AACL:Locatienaam)
    DISABLE(?AAAVVPar:PartijCelID)
    DISABLE(?LOC:UitslagKG4)
    DISABLE(?LOC:UitslagPallet4)
    DISABLE(?AAACL:Locatienaam)
    DISABLE(?LOC:TotaalUitslagPallet)
    DISABLE(?LOC:TotaalUitslagKG)
    DISABLE(?InsertButton)
    DISABLE(?DeleteButton)
    DISABLE(?ChangeButton)
    DISABLE(?WeegNu1)
    DISABLE(?ToevoegenWeging1)
    DISABLE(?VerwijderenWeging1)
    DISABLE(?WijzigenWeging1)
    DISABLE(?WijzigenWeging2)
    DISABLE(?VerwijderenWeging2)
    DISABLE(?ToevoegenWeging2)
    DISABLE(?WeegNu2)
    DISABLE(?WeegNu3)
    DISABLE(?ToevoegenWeging3)
    DISABLE(?VerwijderenWeging3)
    DISABLE(?WijzigenWeging3)
    DISABLE(?WijzigenWeging4)
    DISABLE(?VerwijderenWeging4)
    DISABLE(?ToevoegenWeging4)
    DISABLE(?WeegNu4)
    DISABLE(?EtiketButton)
    DISABLE(?EtiketButton2)
    DISABLE(?EtiketButton3)
    DISABLE(?EtiketButton4)
    DISABLE(?VulWeging1)
    DISABLE(?VulWeging2)
    DISABLE(?VulWeging3)
    DISABLE(?VulWeging4)
    DISABLE(?Mut:UitslagQATransportmiddelSchoon)
    DISABLE(?Mut:UitslagQAVerpakkingSchoonGesloten)
    DISABLE(?Mut:UitslagQAIdentificatieMerkenVerpakking)
    DISABLE(?Mut:UitslagQAUitgevoerdDoor)
    DISABLE(?Mut:UitslagQATemperatuur1)
    DISABLE(?Mut:UitslagQATemperatuur2)
    DISABLE(?Mut:UitslagQATemperatuur3)
    ?Mut:UitslagQATemperatuurVervoermiddel{PROP:ReadOnly} = True
    DISABLE(?Mut:UitslagQAActieAfwijkingen)
    ?Mut:UitslagPalletbladHarvastDate7007_DATE{PROP:ReadOnly} = True
    DISABLE(?Ver2:VerkoopID)
    ?ViewUMQButton{Prop:Hide} = FALSE
    ?PrintPalletbladButton{Prop:Hide} = False
  END
      ! en nu terugzetten
      SELF.Request=Request#
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
  FDCB10.AddUpdateField(AVVPar:PartijID,LOC:PartijID2)
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
  FDCB11.AddUpdateField(AAVVPar:PartijID,LOC:PartijID3)
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
  FDCB12.AddUpdateField(AAAVVPar:PartijID,LOC:PartijID4)
  ThisWindow.AddItem(FDCB12.WindowComponent)
  FDCB12.DefaultFill = 0
  FDCB13.Init(CL:Locatienaam,?CL:Locatienaam,Queue:FileDropCombo:5.ViewPosition,FDCB13::View:FileDropCombo,Queue:FileDropCombo:5,Relate:CelLocatie,ThisWindow,GlobalErrors,0,1,0)
  FDCB13.Q &= Queue:FileDropCombo:5
  FDCB13.AddSortOrder(CL:FK_CelLocatie)
  FDCB13.AddRange(CL:CelID,VVPar:CelID)
  FDCB13.AddField(CL:Locatienaam,FDCB13.Q.CL:Locatienaam) !List box control field - type derived from field
  FDCB13.AddField(CL:CelLocatieID,FDCB13.Q.CL:CelLocatieID) !Primary key field - type derived from field
  FDCB13.AddUpdateField(CL:CelLocatieID,Loc:CelLocatieID1)
  ThisWindow.AddItem(FDCB13.WindowComponent)
  FDCB13.DefaultFill = 0
  FDCB14.Init(ACL:Locatienaam,?ACL:Locatienaam,Queue:FileDropCombo:6.ViewPosition,FDCB14::View:FileDropCombo,Queue:FileDropCombo:6,Relate:ACelLocatie,ThisWindow,GlobalErrors,0,1,0)
  FDCB14.Q &= Queue:FileDropCombo:6
  FDCB14.AddSortOrder(ACL:FK_CelLocatie)
  FDCB14.AddRange(ACL:CelID,AVVPar:CelID)
  FDCB14.AddField(ACL:Locatienaam,FDCB14.Q.ACL:Locatienaam) !List box control field - type derived from field
  FDCB14.AddField(ACL:CelLocatieID,FDCB14.Q.ACL:CelLocatieID) !Primary key field - type derived from field
  FDCB14.AddUpdateField(ACL:CelLocatieID,Loc:CelLocatieID2)
  ThisWindow.AddItem(FDCB14.WindowComponent)
  FDCB14.DefaultFill = 0
  FDCB15.Init(AACL:Locatienaam,?AACL:Locatienaam,Queue:FileDropCombo:7.ViewPosition,FDCB15::View:FileDropCombo,Queue:FileDropCombo:7,Relate:AACelLocatie,ThisWindow,GlobalErrors,0,1,0)
  FDCB15.Q &= Queue:FileDropCombo:7
  FDCB15.AddSortOrder(AACL:FK_CelLocatie)
  FDCB15.AddRange(AACL:CelID,AAVVPar:CelID)
  FDCB15.AddField(AACL:Locatienaam,FDCB15.Q.AACL:Locatienaam) !List box control field - type derived from field
  FDCB15.AddField(AACL:CelLocatieID,FDCB15.Q.AACL:CelLocatieID) !Primary key field - type derived from field
  FDCB15.AddUpdateField(AACL:CelLocatieID,Loc:CelLocatieID3)
  ThisWindow.AddItem(FDCB15.WindowComponent)
  FDCB15.DefaultFill = 0
  FDCB16.Init(AAACL:Locatienaam,?AAACL:Locatienaam,Queue:FileDropCombo:8.ViewPosition,FDCB16::View:FileDropCombo,Queue:FileDropCombo:8,Relate:AAACelLocatie,ThisWindow,GlobalErrors,0,1,0)
  FDCB16.Q &= Queue:FileDropCombo:8
  FDCB16.AddSortOrder(AAACL:FK_CelLocatie)
  FDCB16.AddRange(AAACL:CelID,AAAVVPar:CelID)
  FDCB16.AddField(AAACL:Locatienaam,FDCB16.Q.AAACL:Locatienaam) !List box control field - type derived from field
  FDCB16.AddField(AAACL:CelLocatieID,FDCB16.Q.AAACL:CelLocatieID) !Primary key field - type derived from field
  FDCB16.AddUpdateField(AAACL:CelLocatieID,Loc:CelLocatieID4)
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
    Relate:AViewVoorraadPartij.Close
    Relate:CelLocatie.Close
    Relate:Mutatie.Close
    Relate:Pallet.Close
    Relate:PalletSoort.Close
    Relate:Planning.Close
    Relate:RelatieArtikelOmschrijving.Close
    Relate:ViewVoorraadPartij.Close
    Relate:ViewVoorraadPlanning.Close
    Relate:Weging.Close
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
      ThisNetRefresh.Send('|Mutatie|ViewVoorraadPlanning|ViewVoorraadPartij|AViewVoorraadPartij|AAViewVoorraadPartij|AAAViewVoorraadPartij|CelLocatie|ACelLocatie|AACelLocatie|AAACelLocatie|') ! NetTalk (NetRefresh)
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
      
      ! Partij/cel bijwerken
      IF Mut:ArtikelID <> '' THEN
      	CLEAR(AAAVVPar:Record)
      	AAAVVPar:PartijCelID = LOC:PartijCelID
      	IF(Access:AAAViewVoorraadPartij.TryFetch(AAAVVPar:PartijCelID_K) = Level:Benign)
      		IF(AAAVVPar:ArtikelID <> Mut:ArtikelID)
      			LOC:PartijCelID = ''
      		.
      	ELSE		
      		LOC:PartijCelID = ''
      	.
      	
      	CLEAR(AAAVVPar:Record)
      	AAAVVPar:PartijCelID = LOC:PartijCelID2
      	IF(Access:AAAViewVoorraadPartij.TryFetch(AAAVVPar:PartijCelID_K) = Level:Benign)
      		IF(AAAVVPar:ArtikelID <> Mut:ArtikelID)
      			LOC:PartijCelID2 = ''
      		.
      	ELSE		
      		LOC:PartijCelID2 = ''
      	.
      
      	CLEAR(AAAVVPar:Record)
      	AAAVVPar:PartijCelID = LOC:PartijCelID3
      	IF(Access:AAAViewVoorraadPartij.TryFetch(AAAVVPar:PartijCelID_K) = Level:Benign)
      		IF(AAAVVPar:ArtikelID <> Mut:ArtikelID)
      			LOC:PartijCelID3 = ''
      		.
      	ELSE		
      		LOC:PartijCelID3 = ''
      	.
      
      	CLEAR(AAAVVPar:Record)
      	AAAVVPar:PartijCelID = LOC:PartijCelID4
      	IF(Access:AAAViewVoorraadPartij.TryFetch(AAAVVPar:PartijCelID_K) = Level:Benign)
      		IF(AAAVVPar:ArtikelID <> Mut:ArtikelID)
      			LOC:PartijCelID4 = ''
      		.
      	ELSE		
      		LOC:PartijCelID4 = ''
      	.
      	
      	LOOP i# = 1 TO RECORDS(GLO:UitslagMutatieQueue)
      		GET(GLO:UitslagMutatieQueue, i#)
      		
      		AAAVVPar:PartijCelID = UMQ:PartijCelID
      		IF(Access:AAAViewVoorraadPartij.TryFetch(AAAVVPar:PartijCelID_K) = Level:Benign)
      			IF(AAAVVPar:ArtikelID <> Mut:ArtikelID)
      				FREE(GLO:UitslagMutatieQueue)
      			.
      		ELSE		
      			FREE(GLO:UitslagMutatieQueue)
      		.
      	.
      ELSE
      	LOC:PartijCelID = ''
      	LOC:PartijCelID2 = ''
      	LOC:PartijCelID3 = ''
      	LOC:PartijCelID4 = ''
      	
      	FREE(GLO:UitslagMutatieQueue)
      .
      
      ThisWindow.Reset(true)
    OF ?VVPar:PartijCelID
      IF Mut:UitslagKG > LOC:PartijVoorraadKG1 THEN
      	Mut:UitslagKG = LOC:PartijVoorraadKG1
      	DISPLAY(?Mut:UitslagKG)
      	DO BerekenTotaal
      .
      IF 0{PROP:AcceptAll}=FALSE
          FDCB13.ResetQueue(false)
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
    OF ?LOC:UitslagKG4
      DO BerekenTotaal
    OF ?LOC:UitslagPallet4
      DO BerekenTotaal
    OF ?OK
      db.DebugOut('OK:Accepted '& Mut:MutatieID& ','& Mut:PlanningID)
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
      DO VulPalletBladDatums
      
      GlobalRequest = InsertRecord
      UpdateUitslagMutatieQueueWeging(Mut:ArtikelID, RECORDS(GLO:UitslagMutatieQueue) + 1)
      
      IF GLO:BepaalTotaal
      	DO VulTotaal
      END
      
      DO BerekenTotaal
      	
      ThisWindow.Reset(True)
      
      
    OF ?DeleteButton
      SORT(GLO:WegingQueue2, +GWQ2:ID)
      LOOP i# = RECORDS(GLO:WegingQueue2) TO 1 BY -1
      	GET(GLO:WegingQueue2, i#)
      	IF GWQ2:ID = Choice(?UitslagMutatieList) THEN
      		DELETE(GLO:WegingQueue2)
      	ELSIF GWQ2:ID > Choice(?UitslagMutatieList) THEN
      		GWQ2:ID = GWQ2:ID - 1
      		UPDATE(GLO:WegingQueue2)
      	.
      END
      
      CLEAR(GLO:UitslagMutatieQueue)
      GET(GLO:UitslagMutatieQueue, Choice(?UitslagMutatieList))
      IF NOT(ERROR()) AND UMQ:PartijCelID <> '' THEN
      	DELETE(GLO:UitslagMutatieQueue)
      	
      	IF (LOC:BalansUitslagKG = 0 AND LOC:BalansUitslagPallet = 0) THEN
      		DO VulTotaal
      	END
      	
      	DO BerekenTotaal
      	
      	ThisWindow.Reset(True)
      END
    OF ?ChangeButton
      DO VulPalletBladDatums
      
      CLEAR(GLO:UitslagMutatieQueue)
      GET(GLO:UitslagMutatieQueue, Choice(?UitslagMutatieList))
      IF NOT(ERROR()) AND UMQ:PartijCelID <> '' THEN
      	db.DebugOut('ChangeUMQ:' & CLIP(UMQ:PartijCelID))
      	GlobalRequest = ChangeRecord
      	UpdateUitslagMutatieQueueWeging(Mut:ArtikelID, Choice(?UitslagMutatieList))
      	
      	IF GLO:BepaalTotaal
      		DO VulTotaal
      	END
      
      	DO BerekenTotaal
      	
      	ThisWindow.Reset(True)
      END
    OF ?WeegNu1
      SELF.VulUitslagPalletBlad(1)
    OF ?ToevoegenWeging1
      FREE(GLO:WegingQueue)
      WGQ:BrutoGewichtKG=0
      WGQ:NettoGewichtKG=0
      WGQ:PalletsoortID=0
      WGQ:Palletsoort=''
      WGQ:Datum=0
      WGQ:Tijd=0
    OF ?VerwijderenWeging1
      CLEAR(LOC:WegingQueue1)
      GET(LOC:WegingQueue1, Choice(?WegingList1))
      IF NOT(ERROR()) THEN
      	DELETE(LOC:WegingQueue1)
      ELSE
      	CYCLE
      .
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
          db.DebugOut('UpdateWegingQueue1 - ' & WGQ1:PalletID)
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
    OF ?VerwijderenWeging2
      CLEAR(LOC:WegingQueue2)
      GET(LOC:WegingQueue2, Choice(?WegingList2))
      IF NOT(ERROR()) THEN
      	DELETE(LOC:WegingQueue2)
      ELSE
      	CYCLE
      .
    OF ?ToevoegenWeging2
      FREE(GLO:WegingQueue)
      WGQ:BrutoGewichtKG=0
      WGQ:NettoGewichtKG=0
      WGQ:PalletsoortID=0
      WGQ:Palletsoort=''
      WGQ:Datum=0
      WGQ:Tijd=0
    OF ?WeegNu2
      SELF.VulUitslagPalletBlad(2)
    OF ?WeegNu3
      SELF.VulUitslagPalletBlad(3)
    OF ?ToevoegenWeging3
      FREE(GLO:WegingQueue)
      WGQ:BrutoGewichtKG=0
      WGQ:NettoGewichtKG=0
      WGQ:PalletsoortID=0
      WGQ:Palletsoort=''
      WGQ:Datum = 0
      WGQ:Tijd = 0
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
    OF ?ToevoegenWeging4
      FREE(GLO:WegingQueue)
      WGQ:BrutoGewichtKG=0
      WGQ:NettoGewichtKG=0
      WGQ:PalletsoortID=0
      WGQ:Palletsoort=''
      WGQ:Datum = 0
      WGQ:Tijd = 0
    OF ?WeegNu4
      SELF.VulUitslagPalletBlad(4)
    OF ?VulWeging1
      Mut:UitslagKG = 0
      
      LOOP i# = 1 TO RECORDS(LOC:WegingQueue1)
      	GET(LOC:WegingQueue1, i#)
      	Mut:UitslagKG += WGQ1:NettoGewichtKG
      END
      
      Mut:UitslagPallet = RECORDS(LOC:WegingQueue1)
      
      LOC:TotaalUitslagKG = (Mut:UitslagKG+LOC:UitslagKG2+LOC:UitslagKG3+LOC:UitslagKG4)
      LOC:TotaalUitslagPallet = (Mut:UitslagPallet+LOC:UitslagPallet2+LOC:UitslagPallet3+LOC:UitslagPallet4)
      	
      LOOP i# = 1 TO RECORDS(GLO:UitslagMutatieQueue)
      	GET(GLO:UitslagMutatieQueue, i#)
      	LOC:TotaalUitslagKG += UMQ:KG
      	LOC:TotaalUitslagPallet += UMQ:Pallet
      .
      
      DISPLAY(?Mut:UitslagKG)
      DISPLAY(?Mut:UitslagPallet)
      
      DISPLAY(?LOC:TotaalUitslagKG)
      DISPLAY(?LOC:TotaalUitslagPallet)
      
      DO BerekenTotaal
    OF ?VulWeging2
      LOC:UitslagKG2 = 0
      
      LOOP i# = 1 TO RECORDS(LOC:WegingQueue2)
      	GET(LOC:WegingQueue2, i#)
      	LOC:UitslagKG2 += WGQ2:NettoGewichtKG
      END
      
      LOC:UitslagPallet2 = RECORDS(LOC:WegingQueue2)
      
      LOC:TotaalUitslagKG =  (Mut:UitslagKG+LOC:UitslagKG2+LOC:UitslagKG3+LOC:UitslagKG4)
      LOC:TotaalUitslagPallet = (Mut:UitslagPallet+LOC:UitslagPallet2+LOC:UitslagPallet3+LOC:UitslagPallet4)
      	
      LOOP i# = 1 TO RECORDS(GLO:UitslagMutatieQueue)
      	GET(GLO:UitslagMutatieQueue, i#)
      	LOC:TotaalUitslagKG += UMQ:KG
      	LOC:TotaalUitslagPallet += UMQ:Pallet
      .
      
      DISPLAY(?LOC:UitslagKG2)
      DISPLAY(?LOC:UitslagPallet2)
      
      DISPLAY(?LOC:TotaalUitslagKG)
      DISPLAY(?LOC:TotaalUitslagPallet)
      
      DO BerekenTotaal
    OF ?VulWeging3
      LOC:UitslagKG3 = 0
      
      LOOP i# = 1 TO RECORDS(LOC:WegingQueue3)
      	GET(LOC:WegingQueue3, i#)
      	LOC:UitslagKG3 += WGQ3:NettoGewichtKG
      END
      
      LOC:UitslagPallet3 = RECORDS(LOC:WegingQueue3)
      
      LOC:TotaalUitslagKG =  (Mut:UitslagKG+LOC:UitslagKG2+LOC:UitslagKG3+LOC:UitslagKG4)
      LOC:TotaalUitslagPallet = (Mut:UitslagPallet+LOC:UitslagPallet2+LOC:UitslagPallet3+LOC:UitslagPallet4)
      	
      LOOP i# = 1 TO RECORDS(GLO:UitslagMutatieQueue)
      	GET(GLO:UitslagMutatieQueue, i#)
      	LOC:TotaalUitslagKG += UMQ:KG
      	LOC:TotaalUitslagPallet += UMQ:Pallet
      .
      
      DISPLAY(?LOC:UitslagKG3)
      DISPLAY(?LOC:UitslagPallet3)
      
      DISPLAY(?LOC:TotaalUitslagKG)
      DISPLAY(?LOC:TotaalUitslagPallet)
      
      DO BerekenTotaal
    OF ?VulWeging4
      LOC:UitslagKG4 = 0
      
      LOOP i# = 1 TO RECORDS(LOC:WegingQueue4)
      	GET(LOC:WegingQueue4, i#)
      	LOC:UitslagKG4 += WGQ4:NettoGewichtKG
      END
      
      LOC:UitslagPallet4 = RECORDS(LOC:WegingQueue4)
      
      LOC:TotaalUitslagKG =  (Mut:UitslagKG+LOC:UitslagKG2+LOC:UitslagKG3+LOC:UitslagKG4)
      LOC:TotaalUitslagPallet = (Mut:UitslagPallet+LOC:UitslagPallet2+LOC:UitslagPallet3+LOC:UitslagPallet4)
      	
      LOOP i# = 1 TO RECORDS(GLO:UitslagMutatieQueue)
      	GET(GLO:UitslagMutatieQueue, i#)
      	LOC:TotaalUitslagKG += UMQ:KG
      	LOC:TotaalUitslagPallet += UMQ:Pallet
      .
      
      DISPLAY(?LOC:UitslagKG4)
      DISPLAY(?LOC:UitslagPallet4)
      
      DISPLAY(?LOC:TotaalUitslagKG)
      DISPLAY(?LOC:TotaalUitslagPallet)
      
      DO BerekenTotaal
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?OvernemenButton
      ThisWindow.Update()
      Mut:AlternatieveArtikelOms = LOC:CMRArtikelOms
      DISPLAY(?Mut:AlternatieveArtikelOms)
    OF ?ChangeCMRArtikel
      ThisWindow.Update()
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
    OF ?OK
      ThisWindow.Update()
      IF SELF.Request = ViewRecord AND NOT SELF.BatchProcessing THEN
         POST(EVENT:CloseWindow)
      END
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
              WGQ1:PalletID = WGQ:PalletID
      		ADD(LOC:WegingQueue1)
      	.
      .
    OF ?ToevoegenWeging1
      ThisWindow.Update()
      GlobalRequest = InsertRecord
      UpdateUitslagMutatieWegingQueue()
      ThisWindow.Reset
      IF GLOBALResponse = RequestCompleted THEN
          CLEAR(PLL:Record)
          Access:Pallet.Insert()
          
      	WGQ1:BrutoGewichtKG = WGQ:BrutoGewichtKG
      	WGQ1:Palletsoort = WGQ:Palletsoort
      	WGQ1:PalletsoortID = WGQ:PalletsoortID
      	WGQ1:NettoGewichtKG = WGQ:NettoGewichtKG
      	WGQ1:Datum = WGQ:Datum
      	WGQ1:Tijd = WGQ:Tijd
          WGQ1:PalletID = PLL:PalletID
          
          db.DebugOut('WGQ1:PalletID (1) - ' & PLL:PalletID)
          
      	ADD(LOC:WegingQueue1)
      .
      
      db.DebugOut('WGQ1:PalletID (2) - ' & WGQ1:PalletID)
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
    OF ?ToevoegenWeging2
      ThisWindow.Update()
      GlobalRequest = InsertRecord
      UpdateUitslagMutatieWegingQueue()
      ThisWindow.Reset
      IF GLOBALResponse = RequestCompleted THEN
          CLEAR(PLL:Record)
          Access:Pallet.Insert()
          
      	WGQ2:BrutoGewichtKG = WGQ:BrutoGewichtKG
      	WGQ2:Palletsoort = WGQ:Palletsoort
      	WGQ2:PalletsoortID = WGQ:PalletsoortID
      	WGQ2:NettoGewichtKG = WGQ:NettoGewichtKG
      	WGQ2:Datum = WGQ:Datum
      	WGQ2:Tijd = WGQ:Tijd
          WGQ2:PalletID = PLL:PalletID
      	ADD(LOC:WegingQueue2)
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
              WGQ2:PalletID = WGQ:PalletID
      		ADD(LOC:WegingQueue2)
      	.
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
              WGQ3:PalletID = WGQ:PalletID
      		ADD(LOC:WegingQueue3)
      	.
      .
    OF ?ToevoegenWeging3
      ThisWindow.Update()
      GlobalRequest = InsertRecord
      UpdateUitslagMutatieWegingQueue()
      ThisWindow.Reset
      IF GLOBALResponse = RequestCompleted THEN
          CLEAR(PLL:Record)
          Access:Pallet.Insert()
          
      	WGQ3:BrutoGewichtKG = WGQ:BrutoGewichtKG
      	WGQ3:Palletsoort = WGQ:Palletsoort
      	WGQ3:PalletsoortID = WGQ:PalletsoortID
      	WGQ3:NettoGewichtKG = WGQ:NettoGewichtKG
      	WGQ3:Datum = WGQ:Datum
      	WGQ3:Tijd = WGQ:Tijd
          WGQ3:PalletID = PLL:PalletID
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
    OF ?ToevoegenWeging4
      ThisWindow.Update()
      GlobalRequest = InsertRecord
      UpdateUitslagMutatieWegingQueue()
      ThisWindow.Reset
      IF GLOBALResponse = RequestCompleted THEN
          CLEAR(PLL:Record)
          Access:Pallet.Insert()
          
      	WGQ4:BrutoGewichtKG = WGQ:BrutoGewichtKG
      	WGQ4:Palletsoort = WGQ:Palletsoort
      	WGQ4:PalletsoortID = WGQ:PalletsoortID
      	WGQ4:NettoGewichtKG = WGQ:NettoGewichtKG
      	WGQ4:Datum = WGQ:Datum
      	WGQ4:Tijd = WGQ:Tijd
          WGQ4:PalletID = PLL:PalletID
      	ADD(LOC:WegingQueue4)
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
              WGQ4:PalletID = WGQ:PalletID
      		ADD(LOC:WegingQueue4)
      	.
      .
    OF ?EtiketButton
      ThisWindow.Update()
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
    OF ?EtiketButton2
      ThisWindow.Update()
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
    OF ?EtiketButton3
      ThisWindow.Update()
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
    OF ?EtiketButton4
      ThisWindow.Update()
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
    OF ?Mut:UitslagPalletbladOriginLiveBird
      CheckISOCountries(Mut:UitslagPalletbladOriginLiveBird)
    OF ?Mut:UitslagPalletbladOriginSlautherHouse
      CheckISOCountries(Mut:UitslagPalletbladOriginSlautherHouse)
    OF ?Mut:UitslagPalletbladOriginProcessing
      CheckISOCountries(Mut:UitslagPalletbladOriginProcessing)
    OF ?Mut:UitslagPalletbladOriginPacking
      CheckISOCountries(Mut:UitslagPalletbladOriginPacking)
    OF ?PalletbladButton
      ThisWindow.Update()
      CLEAR(LOC:WegingQueue1)
      GET(LOC:WegingQueue1, Choice(?WegingList1))
      IF NOT(ERROR()) THEN
            SELF.VulUitslagPalletBlad(1)
      	  ReportPalletBladEnkel(WGQ1:PalletID, WGQ1:NettoGewichtKG, True, 1) ! Met Preview 
      END
    OF ?PalletbladButton2
      ThisWindow.Update()
      CLEAR(LOC:WegingQueue2)
      GET(LOC:WegingQueue2, Choice(?WegingList2))
      IF NOT(ERROR()) THEN
          SELF.VulUitslagPalletBlad(2)
      	ReportPalletBladEnkel(WGQ2:PalletID, WGQ2:NettoGewichtKG, True, 1) ! Met Preview 
      END
    OF ?PalletbladButton3
      ThisWindow.Update()
      CLEAR(LOC:WegingQueue3)
      GET(LOC:WegingQueue3, Choice(?WegingList3))
      IF NOT(ERROR()) THEN
          SELF.VulUitslagPalletBlad(3)
      	ReportPalletBladEnkel(WGQ3:PalletID, WGQ3:NettoGewichtKG, True, 1) ! Met Preview 
      END
    OF ?PalletbladButton4
      ThisWindow.Update()
      CLEAR(LOC:WegingQueue4)
      GET(LOC:WegingQueue4, Choice(?WegingList4))
      IF NOT(ERROR()) THEN
            SELF.VulUitslagPalletBlad(4)
      	  ReportPalletBladEnkel(WGQ4:PalletID, WGQ4:NettoGewichtKG, True, 1) ! Met Preview 
      END
    OF ?ViewUMQButton
      ThisWindow.Update()
      DO VulPalletBladDatums
      
      CLEAR(GLO:UitslagMutatieQueue)
      GET(GLO:UitslagMutatieQueue, Choice(?UitslagMutatieList))
      IF NOT(ERROR()) AND UMQ:PartijCelID <> '' THEN
      	GlobalRequest = ViewRecord
      	UpdateUitslagMutatieQueueWeging(Mut:ArtikelID, Choice(?UitslagMutatieList))
      END
    OF ?PrintPalletbladButton
      ThisWindow.Update()
      db.DebugOut('ReportPalletBlad(' & Pla:PlanningID & ')')
      
      ReportPalletBlad(Pla:PlanningID)
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
  
  ! Als KG / pallets niet leeg is dan, moet er een partijcel gekozen zijn
  
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
  		Select(?VVPar:PartijCelID)
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
  
  CLEAR(AAAAVVPar:Record)
  AAAAVVPar:PartijCelID = LOC:PartijCelID
  Access:AAAAViewVoorraadPartij.TryFetch(AAAAVVPar:PartijCelID_K)
  
  IF (AAAAVVPar:VoorraadKG+LOC:CorrectieKG-Mut:UitslagKG < 0) !OR (VVPar:VoorraadPallets+LOC:CorrectiePallets-Mut:UitslagPallet < 0)
  	Message('De uitslag ' & CLIP(LOC:PartijCelID) & ' is te groot voor de huidige voorraad ('&clip(AAAAVVPar:VoorraadKG+LOC:CorrectieKG)& ' KG / ' & CLIP(AAAAVVPar:VoorraadPallets+LOC:CorrectiePallets) & ' pallets)', |
  		'Negatieve voorraad KG',ICON:Exclamation)
  	Select(?Mut:UitslagKG)
  	RETURN Level:Notify
  .
  
  
  IF LOC:PartijCelID2 <> ''
  	ThisWindow.BepaalCorrectieVoorraad(LOC:PartijCelID2)
  	
  	CLEAR(AAAAVVPar:Record)
  	AAAAVVPar:PartijCelID = LOC:PartijCelID2
  	Access:AAAAViewVoorraadPartij.TryFetch(AAAAVVPar:PartijCelID_K)
  	
  	IF (AAAAVVPar:VoorraadKG+LOC:CorrectieKG-LOC:UitslagKG2 < 0) !OR (AVVPar:VoorraadPallets+LOC:CorrectiePallets-LOC:UitslagPallet2 < 0)
  		Message('De uitslag ' & CLIP(LOC:PartijCelID2) & ' is te groot voor de huidige voorraad ('&clip(AAAAVVPar:VoorraadKG+LOC:CorrectieKG)& ' KG / ' & CLIP(AAAAVVPar:VoorraadPallets+LOC:CorrectiePallets) & ' pallets)', |
  			'Negatieve voorraad KG',ICON:Exclamation)
  		Select(?LOC:UitslagKG2)
  		RETURN Level:Notify
  	.
  .
  
  IF LOC:PartijCelID3 <> ''
  	ThisWindow.BepaalCorrectieVoorraad(LOC:PartijCelID3)
  	
  	CLEAR(AAAAVVPar:Record)
  	AAAAVVPar:PartijCelID = LOC:PartijCelID3
  	Access:AAAAViewVoorraadPartij.TryFetch(AAAAVVPar:PartijCelID_K)
  	
  	IF (AAAAVVPar:VoorraadKG+LOC:CorrectieKG-LOC:UitslagKG3 < 0) !OR (AAVVPar:VoorraadPallets+LOC:CorrectiePallets-LOC:UitslagPallet3 < 0)
  		Message('De uitslag ' & CLIP(LOC:PartijCelID3) & ' is te groot voor de huidige voorraad ('&clip(AAAAVVPar:VoorraadKG+LOC:CorrectieKG)& ' KG / ' & CLIP(AAAAVVPar:VoorraadPallets+LOC:CorrectiePallets) & ' pallets)', |
  			'Negatieve voorraad KG',ICON:Exclamation)
  		Select(?LOC:UitslagKG3)
  		RETURN Level:Notify
  	.
  .
  
  IF LOC:PartijCelID4 <> ''
  	ThisWindow.BepaalCorrectieVoorraad(LOC:PartijCelID4)
  	
  	CLEAR(AAAAVVPar:Record)
  	AAAAVVPar:PartijCelID = LOC:PartijCelID4
  	Access:AAAAViewVoorraadPartij.TryFetch(AAAAVVPar:PartijCelID_K)
  
  	IF (AAAAVVPar:VoorraadKG+LOC:CorrectieKG-LOC:UitslagKG4 < 0) !OR (AAAVVPar:VoorraadPallets+LOC:CorrectiePallets-LOC:UitslagPallet4 < 0)
  		Message('De uitslag ' & CLIP(LOC:PartijCelID4) & ' is te groot voor de huidige voorraad ('&clip(AAAAVVPar:VoorraadKG+LOC:CorrectieKG)& ' KG / ' & CLIP(AAAAVVPar:VoorraadPallets+LOC:CorrectiePallets) & ' pallets)', |
  			'Negatieve voorraad KG',ICON:Exclamation)
  		Select(?LOC:UitslagKG4)
  		RETURN Level:Notify
  	.
  .
  
  LOOP i# = 1 TO RECORDS(GLO:UitslagMutatieQueue)
  	GET(GLO:UitslagMutatieQueue, i#)
  	CLEAR(AAAAVVPar:Record)
  	AAAAVVPar:PartijCelID = UMQ:PartijCelID
  	Access:AAAAViewVoorraadPartij.TryFetch(AAAAVVPar:PartijCelID_K)
  	
  	ThisWindow.BepaalCorrectieVoorraad(UMQ:PartijCelID)
  	IF (AAAAVVPar:VoorraadKG+LOC:CorrectieKG-UMQ:KG < 0) !OR (AAAVVPar:VoorraadPallets+LOC:CorrectiePallets-LOC:UitslagPallet4 < 0)
  		Message('De uitslag van ' & CLIP(UMQ:PartijCelID) & ' is te groot voor de huidige voorraad ('&clip(AAAAVVPar:VoorraadKG+LOC:CorrectieKG)& ' KG / ' & CLIP(AAAAVVPar:VoorraadPallets+LOC:CorrectiePallets) & ' pallets) in cel ' & AAAAVVPar:CelOms, |
  			'Negatieve voorraad KG',ICON:Exclamation)
  		RETURN Level:Notify
  	.
  .
  
  IF ThisWindow.Request = InsertRecord THEN
  	! Nog controleren of niet een andere gebruiker ondertussen de uitslag al heeft gedaan
  	Access:Planning.TryFetch(Pla:PK_Planning)
  	IF Pla:MutatieGemaakt THEN
  		MESSAGE('Uitslag is reeds gedaan')
  		RETURN Level:Notify
  	.
  .
  ReturnValue = PARENT.TakeCompleted()
  Ver2:ExternVerkoopID = CLIP(LEFT(GLO:UitslagPalletbladExternVerkoopID))
  IF (Access:Verkoop.Update() <> Level:Benign) THEN
      MESSAGE('Extern verkoop-ID kon niet worden opgeslagen', 'Let Op', ICON:Exclamation)
  END
  
  CLEAR(Pla:Record)
  Pla:PlanningID = Mut:PlanningID
  IF (Access:Planning.TryFetch(Pla:PK_Planning) = Level:Benign)
      Pla:MutatieGemaakt = 1
      Pla:Gewogen = 1
      Access:Planning.Update()
  ELSE
      MESSAGE('Bijbehorende planning-regel kan niet worden bijgewerkt.', 'Let Op', ICON:Exclamation)
  END
  
  ! weet ik nu het partij nummer
  IF (ThisWindow.Request = ChangeRecord)
  	DO WisMutaties
  END
  
  db.DebugOut('Opslaan '& LOC:PartijCelID2 & ',' & LOC:UitslagPallet2 & ',' & LOC:UitslagKG2)
  
  ! Opslaan wegingen
  LOOP i# = 1 TO RECORDS(LOC:WegingQueue1)
  	GET(LOC:WegingQueue1, i#)
  	
  	CLEAR(Weg:Record)
  	Access:Weging.PrimeRecord(false)
  	Weg:MutatieID = Mut:MutatieID
  	Weg:BrutoGewicht = WGQ1:BrutoGewichtKG
  	Weg:NettoGewicht = WGQ1:NettoGewichtKG
  	Weg:PalletSoortID = WGQ1:PalletsoortID
      Weg:Tarra = WGQ1:BrutoGewichtKG - WGQ1:NettoGewichtKG
      Weg:PalletID = WGQ1:PalletID
      Access:Weging.Insert()
  END
  
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
      Mut:CelLocatieID=Loc:CelLocatieID2
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
  	
  	! Opslaan wegingen
  	LOOP i# = 1 TO RECORDS(LOC:WegingQueue2)
  		GET(LOC:WegingQueue2, i#)
  		
  		CLEAR(Weg:Record)
  		Access:Weging.PrimeRecord(false)
  		Weg:MutatieID = Mut:MutatieID
  		Weg:BrutoGewicht = WGQ2:BrutoGewichtKG
  		Weg:NettoGewicht = WGQ2:NettoGewichtKG
  		Weg:PalletSoortID = WGQ2:PalletsoortID
          Weg:Tarra = WGQ2:BrutoGewichtKG - WGQ2:NettoGewichtKG
          Weg:PalletID = WGQ2:PalletID
  		Access:Weging.Insert()
  	END
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
      Mut:CelLocatieID=Loc:CelLocatieID3
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
  	
  	! Opslaan wegingen
  	LOOP i# = 1 TO RECORDS(LOC:WegingQueue3)
  		GET(LOC:WegingQueue3, i#)
  		
  		CLEAR(Weg:Record)
  		Access:Weging.PrimeRecord(false)
  		Weg:MutatieID = Mut:MutatieID
  		Weg:BrutoGewicht = WGQ3:BrutoGewichtKG
  		Weg:NettoGewicht = WGQ3:NettoGewichtKG
  		Weg:PalletSoortID = WGQ3:PalletsoortID
          Weg:Tarra = WGQ3:BrutoGewichtKG - WGQ3:NettoGewichtKG
          Weg:PalletID = WGQ3:PalletID
          Access:Weging.Insert()
  	END
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
      Mut:CelLocatieID=Loc:CelLocatieID4
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
  	
  	! Opslaan wegingen
  	LOOP i# = 1 TO RECORDS(LOC:WegingQueue4)
  		GET(LOC:WegingQueue4, i#)
  		
  		CLEAR(Weg:Record)
  		Access:Weging.PrimeRecord(false)
  		Weg:MutatieID = Mut:MutatieID
  		Weg:BrutoGewicht = WGQ4:BrutoGewichtKG
  		Weg:NettoGewicht = WGQ4:NettoGewichtKG
  		Weg:PalletSoortID = WGQ4:PalletsoortID
          Weg:Tarra = WGQ4:BrutoGewichtKG - WGQ4:NettoGewichtKG
          Weg:PalletID = WGQ4:PalletID
  		Access:Weging.Insert()
  	END
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
          Mut:CelLocatieID=UMQ:CelLocatieID
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
  		
  		! Opslaan wegingen
  		LOOP j# = 1 TO RECORDS(GLO:WegingQueue2)
  			GET(GLO:WegingQueue2, j#)
  			
  			IF (GWQ2:ID = i#) THEN
  				CLEAR(Weg:Record)
  				Access:Weging.PrimeRecord(false)
  				Weg:MutatieID = Mut:MutatieID
  				Weg:BrutoGewicht = GWQ2:BrutoGewichtKG
  				Weg:NettoGewicht = GWQ2:NettoGewichtKG
  				Weg:PalletSoortID = GWQ2:PalletsoortID
                  Weg:Tarra = GWQ2:BrutoGewichtKG - GWQ2:NettoGewichtKG
                  Weg:PalletID = GWQ2:PalletID
  				Access:Weging.Insert()
  			END
  		END
  	.
  .
  
  Mut:Record = AMut:Record
  
  !DO WisRareMutaties
  
  VoorraadClass.BerekenPlanningMutatieGrootte(Pla:PlanningID)
    ThisNetRefresh.Send('|Mutatie|ViewVoorraadPlanning|ViewVoorraadPartij|AViewVoorraadPartij|AAViewVoorraadPartij|AAAViewVoorraadPartij|CelLocatie|ACelLocatie|AACelLocatie|AAACelLocatie|') ! NetTalk (NetRefresh)
  	NetRefreshVoorraadViews()
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
    OF EVENT:CloseWindow
      db.debugOut('GlobalRequest = ' & ThisWindow.Request & ', GlobalResponse = ' & ThisWindow.Response & ' - Pla:PlanningID = ' & Pla:PlanningID )
      
      IF ThisWindow.Request = InsertRecord AND ThisWindow.Response = RequestCancelled THEN
          Pla:UitslagPalletbladDueDate12_DATE = Mut:UitslagPalletbladDueDate12_DATE
          Pla:UitslagPalletbladProductionDate11_DATE = Mut:UitslagPalletbladProductionDate11_DATE
          Pla:UitslagPalletbladSellByDate15_DATE = Mut:UitslagPalletbladSellByDate15_DATE
          
          Pla:UitslagPalletbladOriginLiveBird = Mut:UitslagPalletbladOriginLiveBird
          Pla:UitslagPalletbladOriginSlautherHouse = Mut:UitslagPalletbladOriginSlautherHouse
          Pla:UitslagPalletbladOriginProcessing = Mut:UitslagPalletbladOriginProcessing
          Pla:UitslagPalletbladOriginPacking = Mut:UitslagPalletbladOriginPacking
          IF (Access:Planning.Update() <> Level:Benign) THEN
              db.Debugout('Update Planning fout')
          .
      END    
      
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
  LOOP i# = 1 TO 100
  	IF LOC:OrigineelPartijCelID[i#] <> '' AND LOC:OrigineelPartijCelID[i#]=PRM:PartijCelID THEN	
  		LOC:CorrectieKG += LOC:OrigineelKG[i#]
  		LOC:CorrectiePallets += LOC:OrigineelPallets[i#]
  	.
  .


ThisWindow.VulUitslagPalletBlad PROCEDURE(LONG PRM:Regel)

  CODE
  !GLO:UitslagPalletbladPlanningID (wordt gevuld in de init)
  !GLO:UitslagPalletbladArtikelID (wordt gevuld in de dropdownlist)
  
  CASE PRM:Regel
  OF 1
      GLO:UitslagPalletbladPartijID = Mut:PartijID
  OF 2
      GLO:UitslagPalletbladPartijID = LOC:PartijID2
  OF 3
      GLO:UitslagPalletbladPartijID = LOC:PartijID3
  OF 4
      GLO:UitslagPalletbladPartijID = LOC:PartijID4
  END
  
  DO VulPalletBladDatums
  
  IF CLIP(Mut:AlternatieveArtikelOms) = '' THEN
      GLO:UitslagPalletbladArtikelOms = CLIP(LOC:CMRArtikelOms)
  ELSE
      GLO:UitslagPalletbladArtikelOms = CLIP(Mut:AlternatieveArtikelOms)
  END



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
  	LOOP i# = 1 TO 100
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
  	LOOP i# = 1 TO 100
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
  
  LOOP i# = 1 TO 100
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
  
  LOOP i# = 1 TO 100
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
  
  LOOP i# = 1 TO 100
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
  
  LOOP i# = 1 TO 100
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
  
  LOOP i# = 1 TO 100
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
  
  LOOP i# = 1 TO 100
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
  
  LOOP i# = 1 TO 100
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
  
  LOOP i# = 1 TO 100
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
      IF PartjCelLocatieCs.CheckPCLQ(SUB(LOC:PartijCelID,1,6),SUB(LOC:PartijCelID,7,20),CL:CelLocatieID)=FALSE
            Return Record:Filtered
        END
  
  !    Clear(VPCL:Record)
  !      VPCL:PartijID=SUB(LOC:PartijCelID,1,6)
  !      VPCL:CelID=SUB(LOC:PartijCelID,7,20)
  !      VPCL:CelLocatieID=CL:CelLocatieID
  !      if Access:ViewPartijCelLocaties.Fetch(VPCL:ViewPartijCelLocaties_PK)<>Level:Benign 
  !          Return Record:Filtered
  !      END
  !    
  !          
  ReturnValue = PARENT.ValidateRecord()
  RETURN ReturnValue


FDCB14.ValidateRecord PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
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
      
            
  ReturnValue = PARENT.ValidateRecord()
  RETURN ReturnValue


FDCB15.ValidateRecord PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
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
  !    
  !          
  ReturnValue = PARENT.ValidateRecord()
  RETURN ReturnValue


FDCB16.ValidateRecord PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
      IF PartjCelLocatieCs.CheckPCLQ(SUB(LOC:PartijCelID4,1,6),SUB(LOC:PartijCelID4,7,20),AAACL:CelLocatieID)=FALSE
            Return Record:Filtered
        END
  !    Clear(VPCL:Record)
  !      VPCL:PartijID=SUB(LOC:PartijCelID4,1,6)
  !      VPCL:CelID=SUB(LOC:PartijCelID4,7,20)
  !      VPCL:CelLocatieID=AAACL:CelLocatieID
  !      if Access:ViewPartijCelLocaties.Fetch(VPCL:ViewPartijCelLocaties_PK)<>Level:Benign 
  !          Return Record:Filtered
  !      END
  !    
  !          
  ReturnValue = PARENT.ValidateRecord()
  RETURN ReturnValue

