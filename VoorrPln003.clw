

   MEMBER('VoorrPln.clw')                                  ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABDROPS.INC'),ONCE
   INCLUDE('ABPOPUP.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('VOORRPLN003.INC'),ONCE        !Local module procedure declarations
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
                         PROMPT('Afwijking:'),AT(613,150),USE(?Mut:UitslagQAActieAfwijkingen:Prompt)
                         ENTRY(@s20),AT(705,138,60,10),USE(Mut:UitslagQATemperatuurVervoermiddel)
                         TEXT,AT(614,162,165,27),USE(Mut:UitslagQAActieAfwijkingen),HVSCROLL
                         PROMPT('Corrigerende Maatregel:'),AT(613,226),USE(?Mut:CorrigerendeMaatregel:Prompt)
                         PROMPT('Afgehandeld:'),AT(613,270),USE(?Mut:Afgehandeld:Prompt)
                         TEXT,AT(614,200,165,25),USE(Mut:CorrectieveMaatregel,,?Mut:CorrectieveMaatregel:2)
                         TEXT,AT(614,238,165,30),USE(Mut:CorrigerendeMaatregel,,?Mut:CorrigerendeMaatregel:2)
                         TEXT,AT(614,280,165,25),USE(Mut:Afgehandeld,,?Mut:Afgehandeld:2)
                         PROMPT('CorrectieveMaatregel'),AT(613,190),USE(?Mut:CorrectieveMaatregel:Prompt)
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
  SELF.AddHistoryField(?Mut:UitslagQAIsGeurKleurProductEigen,48)
  SELF.AddHistoryField(?Mut:UitslagQAGeenGlasbreuk,49)
  SELF.AddHistoryField(?Mut:UitslagQAUitgevoerdDoor,27)
  SELF.AddHistoryField(?Mut:UitslagQATemperatuur1,23)
  SELF.AddHistoryField(?Mut:UitslagQATemperatuur2,24)
  SELF.AddHistoryField(?Mut:UitslagQATemperatuur3,25)
  SELF.AddHistoryField(?Mut:UitslagQATemperatuurVervoermiddel,51)
  SELF.AddHistoryField(?Mut:UitslagQAActieAfwijkingen,26)
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

!!! <summary>
!!! Generated from procedure template - Source
!!! </summary>
CheckISOCountries    PROCEDURE  (String pISOCountries)     ! Declare Procedure
st      StringTheory

  CODE
        ! in pIsoCountries kunnen meerdere codekomen
        Access:ISOCountries.Open()
        Access:ISOCountries.UseFile()
    st.SetValue(pISOCountries)
    st.Split(',') 
    loop x# = 1 to st.Records()
        Clear(ISO:Record)
        ISO:ISCode=St.GetLine(x#)
        If NOT Access:ISOCountries.Fetch(ISO:PK_ISOCountries)=Level:Benign
            Message('Let op de ISOCode '&St.GetLine(x#)&' kan niet gevonden worden','Error '&ERROR(),ICON:Cross)
        END
    End
        Access:ISOCountries.Close()
!!! <summary>
!!! Generated from procedure template - Window
!!! Window
!!! </summary>
UpdateUitslagMutatieQueue PROCEDURE (PRM:ArtikelID)

LOC:AantalKG         DECIMAL(10,2)                         ! 
LOC:AantalPallets    LONG                                  ! 
LOC:PartijCelID      STRING(25)                            ! 
LOC:CelID            LONG                                  ! 
LOC:PartijID         LONG                                  ! 
LOC:PartijVoorraadKG DECIMAL(10,2)                         ! 
LOC:PartijVoorraadPallet LONG                              ! 
LOC:LeverancierFirmanaam STRING(50)                        ! 
LOC:VerpakkingOmschrijving CSTRING(51)                     ! 
LOC:ArtikelID        CSTRING(31)                           ! 
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
FDCB7::View:FileDropCombo VIEW(AAAACelLocatie)
                       PROJECT(AAAACL:Locatienaam)
                       PROJECT(AAAACL:CelLocatieID)
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
AAAACL:Locatienaam     LIKE(AAAACL:Locatienaam)       !List box control field - type derived from field
AAAACL:CelLocatieID    LIKE(AAAACL:CelLocatieID)      !Browse hot field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
LocEnableEnterByTab  BYTE(1)                               !Used by the ENTER Instead of Tab template
EnterByTabManager    EnterByTabClass
QuickWindow          WINDOW('Extra uitslag-mutaties'),AT(,,219,88),FONT('MS Sans Serif',8,,FONT:regular,CHARSET:DEFAULT), |
  DOUBLE,CENTER,GRAY,IMM,HLP('UpdateUitslagMutatieQueue'),SYSTEM
                       STRING('Partij / Cel-ID:'),AT(7,6,47,10),USE(?STRING1)
                       COMBO(@s30),AT(59,7,155,10),USE(AAAAVVPar:PartijCelID),DECIMAL(12),VSCROLL,DROP(5,400),FORMAT('0L(2)|~Par' & |
  'tij.Cel~C(0)@s25@[45R(2)|~Intern~C(0)@n_10@45R(2)|~Extern~C(0)@s20@](90)|~Partijnumm' & |
  'er~45L(2)|~Cel~C(0)@s50@46R(2)|~Inslagdatum~C(0)@d17@52R(2)|~Inkoop-KG Prijs~C(0)@n1' & |
  '3`3@[49R(2)|M~KG~C(1)@n-12`2@60R(2)|M~Pallets~C(1)@n-14.@](101)|~Voorraad~50L(2)|~Ve' & |
  'rpakking~C(0)@s50@50L(2)|~Leverancier~C(0)@s50@'),FROM(Queue:FileDropCombo),IMM
                       COMBO(@s50),AT(59,23,155,10),USE(AAAACL:Locatienaam),DROP(5),FORMAT('200L(2)|M~Locatien' & |
  'aam~L(0)@s50@'),FROM(Queue:FileDropCombo:1),IMM
                       PROMPT('Aantal KG:'),AT(7,40),USE(?AantalKG:Prompt)
                       ENTRY(@n13`2),AT(59,41,60,10),USE(LOC:AantalKG),RIGHT(2)
                       PROMPT('Aantal Pallets:'),AT(7,54),USE(?AantalPallets:Prompt),RIGHT
                       ENTRY(@n14`0),AT(59,54,60,10),USE(LOC:AantalPallets),RIGHT(2)
                       BUTTON('&OK'),AT(111,73,49,14),USE(?Ok),LEFT,ICON('WAOK.ICO'),FLAT,MSG('Accept operation'), |
  TIP('Accept Operation')
                       BUTTON('&Cancel'),AT(165,73,49,14),USE(?Cancel),LEFT,ICON('WACANCEL.ICO'),FLAT,MSG('Cancel Operation'), |
  TIP('Cancel Operation')
                       BUTTON('Neem Voorraad'),AT(123,37,91,26),USE(?NeemVoorraadButton)
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

FDCB7                CLASS(FileDropComboClass)             ! File drop combo manager
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
  GlobalErrors.SetProcedureName('UpdateUitslagMutatieQueue')
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
  
  IF ThisWindow.Request = ChangeRecord THEN
  	LOC:AantalKG = UMQ:KG
  	LOC:AantalPallets = UMQ:Pallet
  	LOC:PartijCelID = UMQ:PartijCelID
  	LOC:LeverancierFirmanaam = UMQ:LeverancierNaam
  	LOC:VerpakkingOmschrijving = UMQ:VerpakkingOmschrijving
  	LOC:PartijID = UMQ:PartijID
  	LOC:CelID = UMQ:CelID
  ELSE
  	LOC:AantalKG = 0
  	LOC:AantalPallets = 0
  	LOC:PartijCelID = 0
  	LOC:PartijID = 0
  	LOC:VerpakkingOmschrijving = ''
  	LOC:LeverancierFirmanaam = ''
      LOC:CelID = 0
      CLEAR(AAAAVVPar:Record)
  .
  	
  Relate:AAAACelLocatie.Open                               ! File AAAACelLocatie used by this procedure, so make sure it's RelationManager is open
  Relate:AAAAViewVoorraadPartij.Open                       ! File AAAAViewVoorraadPartij used by this procedure, so make sure it's RelationManager is open
  Relate:ViewPartijCelLocaties.Open                        ! File ViewPartijCelLocaties used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(QuickWindow)                                   ! Open window
  IF IGB:BekijkenPrijzen <> 1 THEN
  	! Prijzen niet tonen
  	?AAAAVVPar:PartijCelID{PROPLIST:Width, 6} = 0
  END
  WinAlertMouseZoom()
  Do DefineListboxStyle
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('UpdateUitslagMutatieQueue',QuickWindow)    ! Restore window settings from non-volatile store
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
  FDCB7.Init(AAAACL:Locatienaam,?AAAACL:Locatienaam,Queue:FileDropCombo:1.ViewPosition,FDCB7::View:FileDropCombo,Queue:FileDropCombo:1,Relate:AAAACelLocatie,ThisWindow,GlobalErrors,0,1,0)
  FDCB7.Q &= Queue:FileDropCombo:1
  FDCB7.AddSortOrder(AAAACL:FK_CelLocatie)
  FDCB7.AddRange(AAAACL:CelID,AAAAVVPar:CelID)
  FDCB7.AddField(AAAACL:Locatienaam,FDCB7.Q.AAAACL:Locatienaam) !List box control field - type derived from field
  FDCB7.AddField(AAAACL:CelLocatieID,FDCB7.Q.AAAACL:CelLocatieID) !Browse hot field - type derived from field
  ThisWindow.AddItem(FDCB7.WindowComponent)
  FDCB7.DefaultFill = 0
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
    Relate:AAAACelLocatie.Close
    Relate:AAAAViewVoorraadPartij.Close
    Relate:ViewPartijCelLocaties.Close
  END
  IF SELF.Opened
    INIMgr.Update('UpdateUitslagMutatieQueue',QuickWindow) ! Save window data to non-volatile store
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
    OF ?Ok
      ! Controleren
      IF LOC:PartijCelID = '' THEN
      	SELECT(?AAAAVVPar:PartijCelID)
      	RETURN Level:Notify
      .
      
      IF LOC:AantalKG = 0 AND LOC:AantalPallets = 0 THEN
      	SELECT(?LOC:AantalKG)
      	RETURN Level:Notify
      .
    OF ?NeemVoorraadButton
      LOC:AantalKG = FDCB6.Q.LOC:PartijVoorraadKG
      ThisWindow.Reset(1)
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?AAAAVVPar:PartijCelID
      IF LOC:AantalKG = 0
      	LOC:AantalKG = AAAAVVPar:VoorraadKG
      .
      IF 0{PROP:AcceptAll}=FALSE
          FDCB7.ResetQueue(false)
          select(?AAAACL:Locatienaam,1)
      END
      
    OF ?Ok
      ThisWindow.Update()
      ! Opslaan
      db.DebugOut('UitslagMutatieQueue.TakeCompleted()')
      IF ThisWindow.Request = InsertRecord
      	CLEAR(GLO:UitslagMutatieQueue)
      	UMQ:PartijCelID=LOC:PartijCelID
      	UMQ:LeverancierNaam=LOC:LeverancierFirmanaam
      	UMQ:VerpakkingOmschrijving=LOC:VerpakkingOmschrijving
      	UMQ:PartijID=LOC:PartijID
      	UMQ:CelID=LOC:CelID
      	UMQ:KG=LOC:AantalKG
      	UMQ:Pallet=LOC:AantalPallets
      	ADD(GLO:UitslagMutatieQueue)
      	db.DebugOut('ADD:UitslagMutatieQueue.TakeCompleted()')
      ELSIF ThisWindow.Request = ChangeRecord
      	UMQ:PartijCelID=LOC:PartijCelID
      	UMQ:LeverancierNaam=LOC:LeverancierFirmanaam
      	UMQ:VerpakkingOmschrijving=LOC:VerpakkingOmschrijving
      	UMQ:PartijID=LOC:PartijID
      	UMQ:CelID=LOC:CelID
      	UMQ:KG=LOC:AantalKG
      	UMQ:Pallet=LOC:AantalPallets
      	PUT(GLO:UitslagMutatieQueue)
      	db.DebugOut('PUT:UitslagMutatieQueue.TakeCompleted()')
      .
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


FDCB7.ValidateRecord PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
      Clear(VPCL:Record)
        VPCL:PartijID=SUB(LOC:PartijCelID,1,6)
        VPCL:CelID=SUB(LOC:PartijCelID,7,20)
        VPCL:CelLocatieID=AAAACL:CelLocatieID
        if Access:ViewPartijCelLocaties.Fetch(VPCL:ViewPartijCelLocaties_PK)<>Level:Benign 
            Return Record:Filtered
        END
      
            
  ReturnValue = PARENT.ValidateRecord()
  RETURN ReturnValue


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window

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
FDCB13::View:FileDropCombo VIEW(ViewPartijCelLocaties)
                       PROJECT(VPCL:CelLocatienaam)
                       PROJECT(VPCL:PartijID)
                       PROJECT(VPCL:CelID)
                       PROJECT(VPCL:CelLocatieID)
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
VPCL:CelLocatienaam    LIKE(VPCL:CelLocatienaam)      !List box control field - type derived from field
VPCL:PartijID          LIKE(VPCL:PartijID)            !Primary key field - type derived from field
VPCL:CelID             LIKE(VPCL:CelID)               !Primary key field - type derived from field
VPCL:CelLocatieID      LIKE(VPCL:CelLocatieID)        !Primary key field - type derived from field
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
                       COMBO(@s50),AT(126,170,227,10),USE(VPCL:CelLocatienaam),DROP(5),FORMAT('200L(2)|M~Locat' & |
  'ienaam~L(0)@s50@'),FROM(Queue:FileDropCombo:5),IMM
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
                         PROMPT('Gemeten temperaturen:'),AT(506,85),USE(?Mut:UitslagQATemperatuur1:Prompt)
                         ENTRY(@s20),AT(507,96,50,10),USE(Mut:UitslagQATemperatuur1)
                         ENTRY(@s20),AT(563,96,50,10),USE(Mut:UitslagQATemperatuur2)
                         ENTRY(@s20),AT(622,96,50,10),USE(Mut:UitslagQATemperatuur3)
                         ENTRY(@s20),AT(613,108,60,10),USE(Mut:UitslagQATemperatuurVervoermiddel)
                         PROMPT('Afwijking:'),AT(506,120),USE(?Mut:UitslagQAActieAfwijkingen:Prompt)
                         TEXT,AT(508,133,165,68),USE(Mut:UitslagQAActieAfwijkingen),HVSCROLL
                         PROMPT('Corrigerende Maatregel:'),AT(507,298),USE(?Mut:CorrigerendeMaatregel:Prompt)
                         PROMPT('Afgehandeld:'),AT(507,366),USE(?Mut:Afgehandeld:Prompt)
                         TEXT,AT(508,220,165,74),USE(Mut:CorrectieveMaatregel,,?Mut:CorrectieveMaatregel:2),HVSCROLL
                         TEXT,AT(508,313,165,48),USE(Mut:CorrigerendeMaatregel,,?Mut:CorrigerendeMaatregel:2)
                         TEXT,AT(508,379,165,48),USE(Mut:Afgehandeld,,?Mut:Afgehandeld:2)
                         CHECK('Is geur/kleur producteigen?'),AT(506,46),USE(Mut:UitslagQAIsGeurKleurProductEigen)
                         CHECK('Geen glasbreuk?'),AT(506,57),USE(Mut:UitslagQAGeenGlasbreuk)
                         PROMPT('CorrectieveMaatregel'),AT(507,206),USE(?Mut:CorrectieveMaatregel:Prompt)
                         PROMPT('Temperatuur Vervoermiddel:'),AT(506,108),USE(?Mut:UitslagQATemperatuurVervoermiddel:Prompt)
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
ApplyRange             PROCEDURE(),BYTE,PROC,DERIVED
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
    DISABLE(?VPCL:CelLocatienaam)
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
  FDCB13.Init(VPCL:CelLocatienaam,?VPCL:CelLocatienaam,Queue:FileDropCombo:5.ViewPosition,FDCB13::View:FileDropCombo,Queue:FileDropCombo:5,Relate:ViewPartijCelLocaties,ThisWindow,GlobalErrors,0,1,0)
  FDCB13.Q &= Queue:FileDropCombo:5
  FDCB13.AddSortOrder(VPCL:ViewPartijCelLocaties_PK)
  FDCB13.AddRange(VPCL:CelID,VVPar:CelID)
  FDCB13.SetFilter('LOC:PartijCelID<<>''''')
  FDCB13.AddField(VPCL:CelLocatienaam,FDCB13.Q.VPCL:CelLocatienaam) !List box control field - type derived from field
  FDCB13.AddField(VPCL:PartijID,FDCB13.Q.VPCL:PartijID) !Primary key field - type derived from field
  FDCB13.AddField(VPCL:CelID,FDCB13.Q.VPCL:CelID) !Primary key field - type derived from field
  FDCB13.AddField(VPCL:CelLocatieID,FDCB13.Q.VPCL:CelLocatieID) !Primary key field - type derived from field
  FDCB13.AddUpdateField(VPCL:CelLocatieID,Loc:CelLocatie1)
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
          FDCB13.ResetQueue(false)
          Select(?VPCL:CelLocatienaam,1)
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


FDCB13.ApplyRange PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GET(SELF.Order.RangeList.List,1)
  SELF.Order.RangeList.List.Right = VVPar:PartijID ! VPCL:PartijID
  ReturnValue = PARENT.ApplyRange()
  RETURN ReturnValue


FDCB13.ValidateRecord PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
        IF LOC:PartijCelID=''
            Return Record:OutOfRange
  !        ELSE
  !             IF PartjCelLocatieCs.CheckPCLQ(SUB(LOC:PartijCelID,1,6),SUB(LOC:PartijCelID,7,20),CL:CelLocatieID)=FALSE
  !          Return Record:Filtered
        END
  !      Clear(VPCL:Record)
  !      VPCL:PartijID=SUB(LOC:PartijCelID,1,6)
  !      VPCL:CelID=SUB(LOC:PartijCelID,7,20)
  !      VPCL:CelLocatieID=CL:CelLocatieID
  !      if Access:ViewPartijCelLocaties.Fetch(VPCL:ViewPartijCelLocaties_PK)<>Level:Benign 
  !          Return Record:Filtered
  !      END
        !ND
      
            
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

!!! <summary>
!!! Generated from procedure template - Window
!!! Form Mutatie
!!! </summary>
UpdateOverboekMutatieEnkel PROCEDURE 

CurrentTab           STRING(80)                            ! 
Loc:KG               DECIMAL(10,2)                         ! 
Loc:Pallets          LONG                                  ! 
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
LOC:PartijVoorraadKG DECIMAL(9,2)                          ! 
LOC:PartijVoorraadPallet LONG                              ! 
LOC:PartijCelID      CSTRING(26)                           ! 
LOC:OrigineelPartijCelID CSTRING(26)                       ! 
LOC:OrigineelNaarPartijCelID CSTRING(26)                   ! 
LOC:OrigineelKG      DECIMAL(10,2)                         ! 
LOC:OrigineelPallets LONG                                  ! 
LOC:OrigineelArtikelID CSTRING(31)                         ! 
LOC:OverboekingCelID LONG                                  ! 
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
                       PROJECT(VVPar:CelID)
                       PROJECT(VVPar:VoorraadKG)
                       PROJECT(VVPar:VoorraadPallets)
                       JOIN(Par:Partij_PK,VVPar:PartijID)
                         PROJECT(Par:PartijID)
                         PROJECT(Par:ExternPartijnr)
                         PROJECT(Par:VerpakkingID)
                         PROJECT(Par:ArtikelID)
                         PROJECT(Par:Leverancier)
                         JOIN(Ver:Verpakking_PK,Par:VerpakkingID)
                           PROJECT(Ver:VerpakkingOmschrijving)
                           PROJECT(Ver:VerpakkingID)
                         END
                         JOIN(Rel:Relatie_PK,Par:Leverancier)
                           PROJECT(Rel:FirmaNaam)
                         END
                       END
                       JOIN(ACel:CEL_PK,VVPar:CelID)
                         PROJECT(ACel:CelOms)
                         PROJECT(ACel:CelID)
                       END
                     END
FDCB8::View:FileDropCombo VIEW(Cel)
                       PROJECT(CEL:CelOms)
                       PROJECT(CEL:CelID)
                     END
FDCB11::View:FileDropCombo VIEW(CelLocatie)
                       PROJECT(CL:Locatienaam)
                       PROJECT(CL:CelLocatieID)
                     END
Queue:FileDropCombo  QUEUE                            !
VVP:ArtikelID          LIKE(VVP:ArtikelID)            !List box control field - type derived from field
VVP:ArtikelOms         LIKE(VVP:ArtikelOms)           !List box control field - type derived from field
LOC:ArtikelVoorraadKG  LIKE(LOC:ArtikelVoorraadKG)    !List box control field - type derived from local data
LOC:ArtikelVoorraadKG_NormalFG LONG                   !Normal forground color
LOC:ArtikelVoorraadKG_NormalBG LONG                   !Normal background color
LOC:ArtikelVoorraadKG_SelectedFG LONG                 !Selected forground color
LOC:ArtikelVoorraadKG_SelectedBG LONG                 !Selected background color
LOC:ArtikelVoorraadPallet LIKE(LOC:ArtikelVoorraadPallet) !List box control field - type derived from local data
LOC:ArtikelVoorraadPallet_NormalFG LONG               !Normal forground color
LOC:ArtikelVoorraadPallet_NormalBG LONG               !Normal background color
LOC:ArtikelVoorraadPallet_SelectedFG LONG             !Selected forground color
LOC:ArtikelVoorraadPallet_SelectedBG LONG             !Selected background color
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
Par:PartijID           LIKE(Par:PartijID)             !List box control field - type derived from field
Par:ExternPartijnr     LIKE(Par:ExternPartijnr)       !List box control field - type derived from field
ACel:CelOms            LIKE(ACel:CelOms)              !List box control field - type derived from field
LOC:PartijVoorraadKG   LIKE(LOC:PartijVoorraadKG)     !List box control field - type derived from local data
Ver:VerpakkingOmschrijving LIKE(Ver:VerpakkingOmschrijving) !List box control field - type derived from field
Rel:FirmaNaam          LIKE(Rel:FirmaNaam)            !List box control field - type derived from field
Par:VerpakkingID       LIKE(Par:VerpakkingID)         !Browse hot field - type derived from field
Par:ArtikelID          LIKE(Par:ArtikelID)            !Browse hot field - type derived from field
VVPar:PartijID         LIKE(VVPar:PartijID)           !Browse hot field - type derived from field
VVPar:CelID            LIKE(VVPar:CelID)              !Browse hot field - type derived from field
VVPar:VoorraadKG       LIKE(VVPar:VoorraadKG)         !Browse hot field - type derived from field
VVPar:VoorraadPallets  LIKE(VVPar:VoorraadPallets)    !Browse hot field - type derived from field
Ver:VerpakkingID       LIKE(Ver:VerpakkingID)         !Related join file key field - type derived from field
ACel:CelID             LIKE(ACel:CelID)               !Related join file key field - type derived from field
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
CL:Locatienaam         LIKE(CL:Locatienaam)           !List box control field - type derived from field
CL:CelLocatieID        LIKE(CL:CelLocatieID)          !Primary key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
LocEnableEnterByTab  BYTE(1)                               !Used by the ENTER Instead of Tab template
EnterByTabManager    EnterByTabClass
History::Mut:Record  LIKE(Mut:RECORD),THREAD
QuickWindow          WINDOW('Form Mutatie'),AT(,,415,228),FONT('MS Sans Serif',8,,,CHARSET:DEFAULT),DOUBLE,CENTER, |
  GRAY,IMM,MDI,HLP('UpdateUitslagMutatie'),SYSTEM
                       SHEET,AT(4,4,403,202),USE(?CurrentTab)
                         TAB('&1) General'),USE(?Tab:1)
                           PROMPT('Invoerdatum:'),AT(13,37),USE(?Mut:DatumTijd_DATE:Prompt),TRN
                           ENTRY(@d6-),AT(88,38,64,10),USE(Mut:DatumTijd_DATE),SKIP
                           PROMPT('Invoertijd:'),AT(172,38),USE(?Mut:DatumTijd_TIME:Prompt),TRN
                           ENTRY(@t7),AT(209,38,56,10),USE(Mut:DatumTijd_TIME),SKIP
                           PROMPT('Artikel:'),AT(13,54),USE(?PROMPT1)
                           COMBO(@s60),AT(87,54,308,10),USE(VVP:ArtikelOms),DROP(25),FORMAT('51L(2)|~Artikel ID~C(' & |
  '0)@s30@115L(2)|~Artikel~C(2)@s60@[54R(2)|*~KG~C(0)@n-13`2@60R(2)|*~Pallets~C(0)@n-14.@]|'), |
  FROM(Queue:FileDropCombo),IMM
                           PROMPT('Partij:'),AT(13,81),USE(?PROMPT2)
                           COMBO(@s25),AT(87,81,308,10),USE(VVPar:PartijCelID),DROP(5,400),FORMAT('0L(2)|~Partij.C' & |
  'el~C(0)@s25@[42R(2)|~Intern~C(0)@n_10B@60R(2)|~Extern~C(1)@n_10B@](87)|~Partijnummer' & |
  '~41R(2)|~Cel~C(0)@s50@[49R(2)|M~KG~C(1)@n-12`2@](48)|~Voorraad~81L(2)|~Verpakking~C(' & |
  '2)@s50@94L(2)|~Leverancier~C(0)@s50@'),FROM(Queue:FileDropCombo:1),IMM
                           PROMPT('Naar cel:'),AT(9,138),USE(?PROMPT6)
                           COMBO(@s30),AT(87,137,307,10),USE(CEL:CelOms),DROP(5),FORMAT('110L(2)|M~Cel~C(0)@s50@'),FROM(Queue:FileDropCombo:2), |
  IMM
                           PROMPT('Cel:'),AT(86,122),USE(?PROMPT3)
                           PROMPT('Overboek KG:'),AT(9,167),USE(?Mut:UitslagKG:Prompt)
                           ENTRY(@n12_`2),AT(87,167,60,10),USE(Mut:UitslagKG),RIGHT(2)
                           PROMPT('Overboek Pallets:'),AT(9,183),USE(?Mut:UitslagPallet:Prompt)
                           ENTRY(@n_9),AT(87,183,60,10),USE(Mut:UitslagPallet),RIGHT(2)
                           PROMPT('Leverancier:'),AT(86,95),USE(?PROMPT4)
                           PROMPT('Verpakking:'),AT(86,108),USE(?PROMPT5)
                           STRING(@s50),AT(130,95,265),USE(Rel:FirmaNaam)
                           STRING(@s50),AT(129,108,266),USE(Ver:VerpakkingOmschrijving)
                           STRING(@s50),AT(129,122,266),USE(ACel:CelOms)
                           STRING(@s50),AT(131,68,263),USE(Art:ArtikelOms)
                           STRING('Locatie:'),AT(27,151),USE(?STRING1)
                           COMBO(@s50),AT(87,152,307,10),USE(CL:Locatienaam),DROP(5),FORMAT('200L(2)|M~Locatienaam' & |
  '~L(0)@s50@'),FROM(Queue:FileDropCombo:3),IMM
                         END
                       END
                       BUTTON('&OK'),AT(302,210,49,14),USE(?OK),LEFT,ICON('WAOK.ICO'),DEFAULT,FLAT,MSG('Accept dat' & |
  'a and close the window'),TIP('Accept data and close the window')
                       BUTTON('&Cancel'),AT(355,210,49,14),USE(?Cancel),LEFT,ICON('WACANCEL.ICO'),FLAT,MSG('Cancel operation'), |
  TIP('Cancel operation')
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

FDCB8                CLASS(FileDropComboClass)             ! File drop combo manager
Q                      &Queue:FileDropCombo:2         !Reference to browse queue type
                     END

FDCB11               CLASS(FileDropComboClass)             ! File drop combo manager
Q                      &Queue:FileDropCombo:3         !Reference to browse queue type
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
    ActionMessage = 'Overboeking toevoegen'
  OF ChangeRecord
    ActionMessage = 'Overboeking wijzigen'
  END
  QuickWindow{PROP:Text} = ActionMessage                   ! Display status message in title bar
  PARENT.Ask


ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('UpdateOverboekMutatieEnkel')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Mut:DatumTijd_DATE:Prompt
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('LOC:ArtikelVoorraadKG',LOC:ArtikelVoorraadKG)      ! Added by: FileDropCombo(ABC)
  BIND('LOC:ArtikelVoorraadPallet',LOC:ArtikelVoorraadPallet) ! Added by: FileDropCombo(ABC)
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.HistoryKey = CtrlH
  SELF.AddHistoryFile(Mut:Record,History::Mut:Record)
  SELF.AddHistoryField(?Mut:DatumTijd_DATE,4)
  SELF.AddHistoryField(?Mut:DatumTijd_TIME,5)
  SELF.AddHistoryField(?Mut:UitslagKG,10)
  SELF.AddHistoryField(?Mut:UitslagPallet,11)
  SELF.AddUpdateFile(Access:Mutatie)
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  Relate:AAAACelLocatie.Open                               ! File AAAACelLocatie used by this procedure, so make sure it's RelationManager is open
  Relate:AMutatie.Open                                     ! File AMutatie used by this procedure, so make sure it's RelationManager is open
  Relate:ARelatie.Open                                     ! File ARelatie used by this procedure, so make sure it's RelationManager is open
  Relate:AViewVoorraadPartij.Open                          ! File AViewVoorraadPartij used by this procedure, so make sure it's RelationManager is open
  Relate:Cel.SetOpenRelated()
  Relate:Cel.Open                                          ! File Cel used by this procedure, so make sure it's RelationManager is open
  Relate:Mutatie.Open                                      ! File Mutatie used by this procedure, so make sure it's RelationManager is open
  Relate:Verkoop.Open                                      ! File Verkoop used by this procedure, so make sure it's RelationManager is open
  Relate:ViewVoorraadPartij.Open                           ! File ViewVoorraadPartij used by this procedure, so make sure it's RelationManager is open
  Relate:ViewVoorraadPlanning.Open                         ! File ViewVoorraadPlanning used by this procedure, so make sure it's RelationManager is open
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
  IF Self.Request=ChangeRecord 
  		Clear(PAR:Record)
  		Par:PartijID = Mut:PartijID
  		Access:Partij.TryFetch(Par:Partij_PK)
  		
  		Loc:ArtikelID = Par:ArtikelID
  		Loc:RelatieID = Par:Leverancier
  		Loc:VerpakkingsID = Par:VerpakkingID
  		LOC:PartijCelID = CLIP(FORMAT(Mut:PartijID, @N05)) & '.' & CLIP(Mut:CelID)
  		
  		! Opslaan bestaande uitslag om rekening mee te houden
  		! bij het controleren van de voorraad
  		LOC:OrigineelPartijCelID=LOC:PartijCelID
  		LOC:OrigineelNaarPartijCelID=CLIP(FORMAT(Mut:PartijID, @N05)) & '.' & CLIP(Mut:NaarCELID)
  		LOC:OrigineelArtikelID = Mut:ArtikelID
  		LOC:OrigineelKG = Mut:UitslagKG
  		LOC:OrigineelPallets = Mut:UitslagPallet
  
  		CLEAR(VVP:Record)
  		VVP:ArtikelID=Loc:ArtikelID
  		Access:ViewVoorraadPlanning.TryFetch(VVP:ViewVoorraad_PK)
  		
  		CLEAR(VVPar:Record)
  		VVPar:PartijCelID = LOC:PartijCelID
  		Access:ViewVoorraadPartij.TryFetch(VVPar:PartijCelID_K)
  		IF NOT(ERROR())
  		  	LOC:KG = VVPar:VoorraadKG
  			LOC:Pallets = VVPar:VoorraadPallets
  		ELSE
  			Loc:KG = 0
  			Loc:Pallets = 0
  		.
  elsif Self.Request=InsertRecord
  		Loc:ArtikelID = PLA:ArtikelID
  		Loc:VerpakkingsID = PLA:VerpakkingID
  	!	Loc:RelatieID = Par:Leverancier
  		LOC:PartijCelID = CLIP(FORMAT(Pla:PartijID, @N05)) & '.' & CLIP(Pla:CelID)
  	
  		! Geen bestaande uitslag om rekening mee te houden
  		! bij het controleren van de voorraad
  		LOC:OrigineelPartijCelID=''
  		LOC:OrigineelArtikelID=''
  		LOC:OrigineelKG = 0
  		LOC:OrigineelPallets = 0
  	
  		VVPar:PartijCelID = LOC:PartijCelID
  		Access:ViewVoorraadPartij.TryFetch(VVPar:PartijCelID_K)
  		IF NOT(ERROR())
  			LOC:KG = VVPar:VoorraadKG
  			LOC:Pallets = VVPar:VoorraadPallets
  			
  			Mut:PartijID = Pla:PartijID
  			Mut:CelID = Pla:CelID
  		ELSE
  			LOC:PartijCelID = ''
  			Loc:KG = 0
  			Loc:Pallets = 0
  			
  			Mut:PartijID = 0
  			Mut:CelID = 0
  			Mut:CelLocatieID = 0
  		.
  		
  		Mut:PlanningID = Pla:PlanningID
  
  		!Ver2:VerkoopID = Pla:VerkoopID
  		!Access:Verkoop.Fetch(Ver2:PK_Verkoop)
  		!IF NOT(ERROR())
  		!	Mut:DatumTijd = Ver2:Planning
  		!.
  		Mut:DatumTijd_DATE = TODAY()
  		Mut:DatumTijd_TIME = CLOCK()
  		
  		Mut:SoortMutatie = 'OUIT'
  	
  		Mut:NaarCELID = Pla:OverboekingCelID
  		Mut:CelLocatieID = Pla:CelLocatieID
  		
  		CLEAR(AAAACL:Record)
  		AAAACL:CelLocatieID = Mut:CelLocatieID
  		Access:AAAACelLocatie.TryFetch(AAAACL:PK_CelLocatie)
  		IF Mut:NaarCELID <> AAAACL:CelID THEN Mut:CelLocatieID = 0.
  	.
  WinAlertMouseZoom()
  Do DefineListboxStyle
  IF SELF.Request = ViewRecord                             ! Configure controls for View Only mode
    ?Mut:DatumTijd_DATE{PROP:ReadOnly} = True
    ?Mut:DatumTijd_TIME{PROP:ReadOnly} = True
    DISABLE(?VVP:ArtikelOms)
    DISABLE(?VVPar:PartijCelID)
    DISABLE(?CEL:CelOms)
    ?Mut:UitslagKG{PROP:ReadOnly} = True
    ?Mut:UitslagPallet{PROP:ReadOnly} = True
    DISABLE(?CL:Locatienaam)
  END
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('UpdateOverboekMutatieEnkel',QuickWindow)   ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
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
  FDCB4.AddField(Par:PartijID,FDCB4.Q.Par:PartijID) !List box control field - type derived from field
  FDCB4.AddField(Par:ExternPartijnr,FDCB4.Q.Par:ExternPartijnr) !List box control field - type derived from field
  FDCB4.AddField(ACel:CelOms,FDCB4.Q.ACel:CelOms) !List box control field - type derived from field
  FDCB4.AddField(LOC:PartijVoorraadKG,FDCB4.Q.LOC:PartijVoorraadKG) !List box control field - type derived from local data
  FDCB4.AddField(Ver:VerpakkingOmschrijving,FDCB4.Q.Ver:VerpakkingOmschrijving) !List box control field - type derived from field
  FDCB4.AddField(Rel:FirmaNaam,FDCB4.Q.Rel:FirmaNaam) !List box control field - type derived from field
  FDCB4.AddField(Par:VerpakkingID,FDCB4.Q.Par:VerpakkingID) !Browse hot field - type derived from field
  FDCB4.AddField(Par:ArtikelID,FDCB4.Q.Par:ArtikelID) !Browse hot field - type derived from field
  FDCB4.AddField(VVPar:PartijID,FDCB4.Q.VVPar:PartijID) !Browse hot field - type derived from field
  FDCB4.AddField(VVPar:CelID,FDCB4.Q.VVPar:CelID) !Browse hot field - type derived from field
  FDCB4.AddField(VVPar:VoorraadKG,FDCB4.Q.VVPar:VoorraadKG) !Browse hot field - type derived from field
  FDCB4.AddField(VVPar:VoorraadPallets,FDCB4.Q.VVPar:VoorraadPallets) !Browse hot field - type derived from field
  FDCB4.AddField(Ver:VerpakkingID,FDCB4.Q.Ver:VerpakkingID) !Related join file key field - type derived from field
  FDCB4.AddField(ACel:CelID,FDCB4.Q.ACel:CelID) !Related join file key field - type derived from field
  FDCB4.AddUpdateField(VVPar:PartijCelID,LOC:PartijCelID)
  FDCB4.AddUpdateField(Par:Leverancier,Loc:RelatieID)
  FDCB4.AddUpdateField(VVPar:PartijID,Mut:PartijID)
  FDCB4.AddUpdateField(VVPar:CelID,Mut:CelID)
  FDCB4.AddUpdateField(VVPar:VoorraadKG,Loc:KG)
  FDCB4.AddUpdateField(VVPar:VoorraadPallets,Loc:Pallets)
  ThisWindow.AddItem(FDCB4.WindowComponent)
  FDCB4.DefaultFill = 0
  FDCB8.Init(CEL:CelOms,?CEL:CelOms,Queue:FileDropCombo:2.ViewPosition,FDCB8::View:FileDropCombo,Queue:FileDropCombo:2,Relate:Cel,ThisWindow,GlobalErrors,0,1,0)
  FDCB8.Q &= Queue:FileDropCombo:2
  FDCB8.AddSortOrder(CEL:CEL_PK)
  FDCB8.AddField(CEL:CelOms,FDCB8.Q.CEL:CelOms) !List box control field - type derived from field
  FDCB8.AddField(CEL:CelID,FDCB8.Q.CEL:CelID) !Primary key field - type derived from field
  FDCB8.AddUpdateField(CEL:CelID,Mut:NaarCELID)
  ThisWindow.AddItem(FDCB8.WindowComponent)
  FDCB8.DefaultFill = 0
  FDCB11.Init(CL:Locatienaam,?CL:Locatienaam,Queue:FileDropCombo:3.ViewPosition,FDCB11::View:FileDropCombo,Queue:FileDropCombo:3,Relate:CelLocatie,ThisWindow,GlobalErrors,0,1,0)
  FDCB11.Q &= Queue:FileDropCombo:3
  FDCB11.AddSortOrder(CL:FK_CelLocatie)
  FDCB11.AddRange(CL:CelID,Mut:NaarCELID)
  FDCB11.AddField(CL:Locatienaam,FDCB11.Q.CL:Locatienaam) !List box control field - type derived from field
  FDCB11.AddField(CL:CelLocatieID,FDCB11.Q.CL:CelLocatieID) !Primary key field - type derived from field
  FDCB11.AddUpdateField(CL:CelLocatieID,Mut:CelLocatieID)
  ThisWindow.AddItem(FDCB11.WindowComponent)
  FDCB11.DefaultFill = 0
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
    Relate:AAAACelLocatie.Close
    Relate:AMutatie.Close
    Relate:ARelatie.Close
    Relate:AViewVoorraadPartij.Close
    Relate:Cel.Close
    Relate:Mutatie.Close
    Relate:Verkoop.Close
    Relate:ViewVoorraadPartij.Close
    Relate:ViewVoorraadPlanning.Close
  END
  IF SELF.Opened
    INIMgr.Update('UpdateOverboekMutatieEnkel',QuickWindow) ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.PrimeUpdate PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.PrimeUpdate()
    If returnValue = Level:Fatal  ! delete just occured
      ThisNetRefresh.Send('|Mutatie|ViewVoorraadPlanning|ViewVoorraadPartij|Cel|CelLocatie|') ! NetTalk (NetRefresh)
    End
    If returnValue = Level:Fatal  ! delete just occured
  		NetRefreshVoorraadViews()
  		NetRefreshPlanningViews()
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
    OF ?VVP:ArtikelOms
      IF Mut:ArtikelID <> '' THEN
      	CLEAR(AVVPar:Record)
      	AVVPar:PartijCelID = LOC:PartijCelID
      	IF(Access:AViewVoorraadPartij.TryFetch(AVVPar:PartijCelID_K) = Level:Benign)
      		IF(AVVPar:ArtikelID <> Mut:ArtikelID)
      			LOC:PartijCelID = ''
      		.
      	ELSE		
      		LOC:PartijCelID = ''
      	.
      ELSE
      	LOC:PartijCelID = ''
      .
      
      ThisWindow.Reset(true)
    OF ?CEL:CelOms
      If 0{PROP:AcceptAll} = False Then
          If NOT CL:CelID = CEL:CelID Then
              Clear(CL:Locatienaam)
              Clear(Mut:CelLocatieID)
              Display(?CL:Locatienaam)
          End
      End
      
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
  	If LOC:PartijCelID = '' THEN
  		Select(?VVPar:PartijCelID)
  		RETURN Level:Notify
  	.
  
  	IF Mut:CelID = Mut:NaarCELID THEN
  		MESSAGE('Overboeking tussen dezelfde cel')
  		Select(?CEL:CelOms)
  		RETURN Level:Notify
  	.
  
  	If LOC:OrigineelPartijCelID = '' OR LOC:OrigineelPartijCelID<>LOC:PartijCelID THEN
  		If Loc:KG-Mut:UitslagKG < 0 !OR Loc:Pallets-Mut:UitslagPallet < 0
  			Message('De uitslag van de overboeking is te groot voor de huidige voorraad ('&clip(Loc:KG)& ' KG / ' & CLIP(LOC:Pallets) & ' pallets)', |
  				'Negatieve voorraad',ICON:Exclamation)
  			Select(?Mut:UitslagKG)
  			RETURN Level:Notify
  		End	
  	ELSE
  		If (Loc:KG+LOC:OrigineelKG)-Mut:UitslagKG < 0 !OR (Loc:Pallets+LOC:OrigineelPallets)-Mut:UitslagPallet < 0
  			Message('De uitslag van de overboeking is te groot voor de huidige voorraad ('&clip(Loc:KG+LOC:OrigineelKG)& ' KG / ' & CLIP(LOC:Pallets+LOC:OrigineelPallets) & ' pallets)', |
  				'Negatieve voorraad',ICON:Exclamation)
  			Select(?Mut:UitslagKG)
  			RETURN Level:Notify
  		End
  	.
  
  	CLEAR(AAAACL:Record)
  	AAAACL:CelLocatieID = Mut:CelLocatieID
  	Access:AAAACelLocatie.TryFetch(AAAACL:PK_CelLocatie)
  	IF Mut:NaarCelID <> AAAACL:CelID THEN Mut:CelLocatieID = 0.
  ! OIN-mutatie aanmaken / bijwerken
  db.DebugOut('OIN-mutatie1('&Mut:PlanningID&','&Mut:SoortMutatie&')')
  
  found# = false
  
  CLEAR(AMut:Record)
  AMut:PlanningID = Mut:PlanningID
  SET(AMut:Mutatie_FK02, AMut:Mutatie_FK02)
  LOOP UNTIL Access:AMutatie.Next()
  	IF AMut:PlanningID <> Mut:PlanningID THEN BREAK.
  	
  	IF AMut:SoortMutatie = 'OIN' THEN
  		found# = true
  		BREAK
  	.
  END
  
  db.DebugOut('OIN-mutatie2('&found#&','&AMut:PlanningID&','&AMut:MutatieID&')')
  
  IF NOT(found#)
  	Access:AMutatie.PrimeRecord(false)
  ELSE
  	IF AMut:PartijID<>Mut:PartijID OR AMut:CelID<>Mut:NaarCELID THEN
  		! Partij/cel verandert, controleren of het veranderen van de
  		! overboeking-inslag mogelijk is een niet een negatief saldo geeft
  		CLEAR(VVPar:Record)
  		VVPar:PartijCelID = CLIP(FORMAT(AMut:PartijID, @N05)) & '.' & CLIP(AMut:CelID)
  		Access:ViewVoorraadPartij.TryFetch(VVPar:PartijCelID_K)
  		IF NOT(ERROR())
  			IF VVPar:VoorraadKG - AMut:InslagKG < 0 THEN
  				Message('Het wijzigen van de bestaande inslag van de overboeking is te groot voor de huidige voorraad ('&clip(VVPar:VoorraadKG)& ' KG)', |
  					'Negatieve voorraad',ICON:Exclamation)
  				Select(?Mut:UitslagKG)
  				RETURN Level:Notify
  			END
  		ELSE
  				Message('Het wijzigen van de bestaande inslag van de overboeking is te groot voor de huidige voorraad (0 KG)', |
  					'Negatieve voorraad',ICON:Exclamation)
  				Select(?Mut:UitslagKG)
  				RETURN Level:Notify
  		END
  	ELSE
  		! Partij/cel blijft hetzelfde, controleren of het veranderen van de
  		! overboeking-inslag mogelijk is een niet een negatief saldo geeft
  		CLEAR(VVPar:Record)
  		VVPar:PartijCelID = CLIP(FORMAT(AMut:PartijID,@N05)) & '.' & CLIP(AMut:CelID)
  		Access:ViewVoorraadPartij.TryFetch(VVPar:PartijCelID_K)
  		IF NOT(ERROR())
  			db.DebugOut('OIN-mutatie3(VVPar found:'&VVPar:PartijCelID&','&VVPar:VoorraadKG&','&VVPar:VoorraadPallets&')')
  			IF VVPar:VoorraadKG - AMut:InslagKG + Mut:UitslagKG < 0 THEN
  				Message('Het wijzigen van de bestaande inslag van de overboeking is te groot voor de huidige voorraad ('&clip(VVPar:VoorraadKG)& ' KG)', |
  					'Negatieve voorraad',ICON:Exclamation)
  				Select(?Mut:UitslagKG)
  				RETURN Level:Notify
  			END
  		ELSE
  			db.DebugOut('OIN-mutatie3(VVPar not found')
  			IF AMut:InslagKG < Mut:UitslagKG THEN
  				Message('Het wijzigen van de bestaande inslag van de overboeking is te groot voor de huidige voorraad (0 KG)', |
  					'Negatieve voorraad',ICON:Exclamation)
  				Select(?Mut:UitslagKG)
  				RETURN Level:Notify
  			.
  		END
  	END
  END
  
  AMut:DatumTijd=Mut:DatumTijd
  AMut:PartijID=Mut:PartijID
  AMut:CelID=Mut:NaarCELID
  AMut:CelLocatieID=Mut:CelLocatieID
  AMut:InslagKG=Mut:UitslagKG
  AMut:InslagPallet=Mut:UitslagPallet
  AMut:UitslagKG=0
  AMut:UitslagPallet=0
  AMut:SoortMutatie='OIN'
  AMut:NaarCELID=Mut:CelID
  AMut:RedenAfboeking=''
  AMut:ArtikelID=Mut:ArtikelID
  AMut:PlanningID=Mut:PlanningID
  
  IF NOT(found#)
  	Access:AMutatie.Insert()
  ELSE
  	Access:AMutatie.Update()
  .
  
  VoorraadClass.BerekenPlanningMutatieGrootte(Mut:PlanningID)
  ReturnValue = PARENT.TakeCompleted()
    ThisNetRefresh.Send('|Mutatie|ViewVoorraadPlanning|ViewVoorraadPartij|Cel|CelLocatie|') ! NetTalk (NetRefresh)
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


FDCB7.SetQueueRecord PROCEDURE

  CODE
  	LOC:ArtikelVoorraadKG=VVP:InslagKG-VVP:UitslagKG
  	LOC:ArtikelVoorraadPallet=VVP:InslagPallets-VVP:UitslagPallets
  PARENT.SetQueueRecord
  
  IF (LOC:ArtikelVoorraadKG < 0)
    SELF.Q.LOC:ArtikelVoorraadKG_NormalFG = -1             ! Set conditional color values for LOC:ArtikelVoorraadKG
    SELF.Q.LOC:ArtikelVoorraadKG_NormalBG = 255
    SELF.Q.LOC:ArtikelVoorraadKG_SelectedFG = -1
    SELF.Q.LOC:ArtikelVoorraadKG_SelectedBG = 255
    SELF.Q.LOC:ArtikelVoorraadPallet_NormalFG = -1         ! Set conditional color values for LOC:ArtikelVoorraadPallet
    SELF.Q.LOC:ArtikelVoorraadPallet_NormalBG = 255
    SELF.Q.LOC:ArtikelVoorraadPallet_SelectedFG = -1
    SELF.Q.LOC:ArtikelVoorraadPallet_SelectedBG = 255
  ELSE
    SELF.Q.LOC:ArtikelVoorraadKG_NormalFG = -1             ! Set color values for LOC:ArtikelVoorraadKG
    SELF.Q.LOC:ArtikelVoorraadKG_NormalBG = -1
    SELF.Q.LOC:ArtikelVoorraadKG_SelectedFG = -1
    SELF.Q.LOC:ArtikelVoorraadKG_SelectedBG = -1
    SELF.Q.LOC:ArtikelVoorraadPallet_NormalFG = -1         ! Set color values for LOC:ArtikelVoorraadPallet
    SELF.Q.LOC:ArtikelVoorraadPallet_NormalBG = -1
    SELF.Q.LOC:ArtikelVoorraadPallet_SelectedFG = -1
    SELF.Q.LOC:ArtikelVoorraadPallet_SelectedBG = -1
  END


FDCB7.ValidateRecord PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  	LOC:ArtikelVoorraadKG=VVP:InslagKG-VVP:UitslagKG
  	LOC:ArtikelVoorraadPallet=VVP:InslagPallets-VVP:UitslagPallets
  
  	!IF LOC:ArtikelVoorraadKG <= 0 !AND LOC:ArtikelVoorraadPallet <= 0
  	!	RETURN Record:Filtered
  	!.
  ReturnValue = PARENT.ValidateRecord()
  RETURN ReturnValue


FDCB4.SetQueueRecord PROCEDURE

  CODE
  IF LOC:OrigineelPartijCelID <> VVPar:PartijCelID 
  	IF LOC:OrigineelNaarPartijCelID <> VVPar:PartijCelID
  		LOC:PartijVoorraadKG=VVPar:VoorraadKG
  		LOC:PartijVoorraadPallet=VVPar:VoorraadPallets
  	ELSE
  		LOC:PartijVoorraadKG=VVPar:VoorraadKG-LOC:OrigineelKG
  		LOC:PartijVoorraadPallet=VVPar:VoorraadPallets-LOC:OrigineelPallets
  	.
  ELSE
  	LOC:PartijVoorraadKG=VVPar:VoorraadKG+LOC:OrigineelKG
  	LOC:PartijVoorraadPallet=VVPar:VoorraadPallets+LOC:OrigineelPallets
  END
  PARENT.SetQueueRecord
  


FDCB4.ValidateRecord PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  IF LOC:OrigineelPartijCelID <> VVPar:PartijCelID 
  	IF LOC:OrigineelNaarPartijCelID <> VVPar:PartijCelID
  		LOC:PartijVoorraadKG=VVPar:VoorraadKG
  		LOC:PartijVoorraadPallet=VVPar:VoorraadPallets
  	ELSE
  		LOC:PartijVoorraadKG=VVPar:VoorraadKG-LOC:OrigineelKG
  		LOC:PartijVoorraadPallet=VVPar:VoorraadPallets-LOC:OrigineelPallets
  	.
  ELSE
  	LOC:PartijVoorraadKG=VVPar:VoorraadKG+LOC:OrigineelKG
  	LOC:PartijVoorraadPallet=VVPar:VoorraadPallets+LOC:OrigineelPallets
  END
  
  !IF LOC:PartijVoorraadKG<=0 AND LOC:PartijVoorraadPallet<=0 THEN
  IF LOC:PartijVoorraadKG<=0 THEN
  	RETURN Record:Filtered
  END
  ReturnValue = PARENT.ValidateRecord()
  RETURN ReturnValue

!!! <summary>
!!! Generated from procedure template - Window
!!! </summary>
UpdateOverboekingMutatieQueue PROCEDURE 

FDCB3::View:FileDropCombo VIEW(AAAACel)
                       PROJECT(AAAACEL:CelOms)
                       PROJECT(AAAACEL:CelID)
                     END
FDCB4::View:FileDropCombo VIEW(AAAACelLocatie)
                       PROJECT(AAAACL:Locatienaam)
                       PROJECT(AAAACL:CelLocatieID)
                     END
Queue:FileDropCombo  QUEUE                            !
AAAACEL:CelOms         LIKE(AAAACEL:CelOms)           !List box control field - type derived from field
AAAACEL:CelID          LIKE(AAAACEL:CelID)            !Primary key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
Queue:FileDropCombo:1 QUEUE                           !
AAAACL:Locatienaam     LIKE(AAAACL:Locatienaam)       !List box control field - type derived from field
AAAACL:CelLocatieID    LIKE(AAAACL:CelLocatieID)      !Primary key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
LocEnableEnterByTab  BYTE(1)                               !Used by the ENTER Instead of Tab template
EnterByTabManager    EnterByTabClass
Window               WINDOW('Extra Overboeking-mutatie'),AT(,,303,95),FONT('Microsoft Sans Serif',8),GRAY
                       BUTTON('&OK'),AT(201,76,41,14),USE(?OkButton),DEFAULT
                       BUTTON('&Annuleren'),AT(246,76,53,14),USE(?CancelButton)
                       PROMPT('KG:'),AT(5,42),USE(?OMQ:KG:Prompt)
                       ENTRY(@n-14`2),AT(37,43,60,10),USE(OMQ:KG),RIGHT
                       PROMPT('Pallets:'),AT(5,58),USE(?OMQ:Pallet:Prompt),RIGHT
                       ENTRY(@n_10),AT(37,59,60,10),USE(OMQ:Pallet),RIGHT(1)
                       COMBO(@s50),AT(37,9,261,10),USE(AAAACEL:CelOms),DROP(5),FORMAT('200L(2)|M~Cel Oms~L(0)@s50@'), |
  FROM(Queue:FileDropCombo),IMM
                       COMBO(@s50),AT(87,27,211,10),USE(AAAACL:Locatienaam),DROP(5),FORMAT('200L(2)|M~Locatien' & |
  'aam~L(0)@s50@'),FROM(Queue:FileDropCombo:1),IMM
                       PROMPT('Cel:'),AT(5,8),USE(?CelPrompt),FONT(,,,FONT:regular)
                       PROMPT('Locatie:'),AT(35,26),USE(?LocatiePrompt)
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
FDCB3                CLASS(FileDropComboClass)             ! File drop combo manager
Q                      &Queue:FileDropCombo           !Reference to browse queue type
                     END

FDCB4                CLASS(FileDropComboClass)             ! File drop combo manager
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
  GlobalErrors.SetProcedureName('UpdateOverboekingMutatieQueue')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?OkButton
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:AAAACel.Open                                      ! File AAAACel used by this procedure, so make sure it's RelationManager is open
  Relate:AAAACelLocatie.Open                               ! File AAAACelLocatie used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  IF ThisWindow.Request = InsertRecord THEN
      OMQ:KG = 0
      OMQ:Pallet = 0
      OMQ:CelID = 0
      OMQ:CelLocatieID = 0
  .
  
  CLEAR(AAAACEL:Record)
  AAAACEL:CelID = OMQ:CelID
  IF Access:AAAACel.TryFetch(AAAACEL:CEL_PK) <> Level:Benign THEN CLEAR(AAAACEL:Record).
  
  CLEAR(AAAACL:Record)
  AAAACL:CelLocatieID = OMQ:CelLocatieID
  IF Access:AAAACelLocatie.TryFetch(AAAACL:PK_CelLocatie) <> Level:Benign THEN CLEAR(AAAACL:Record).
  SELF.Open(Window)                                        ! Open window
  SELF.AddItem(?OKButton,RequestCompleted)
  SELF.AddItem(?CancelButton,RequestCancelled)
  
  SELF.OKControl=?OKButton
  WinAlertMouseZoom()
  Do DefineListboxStyle
  INIMgr.Fetch('UpdateOverboekingMutatieQueue',Window)     ! Restore window settings from non-volatile store
  FDCB3.Init(AAAACEL:CelOms,?AAAACEL:CelOms,Queue:FileDropCombo.ViewPosition,FDCB3::View:FileDropCombo,Queue:FileDropCombo,Relate:AAAACel,ThisWindow,GlobalErrors,0,1,0)
  FDCB3.Q &= Queue:FileDropCombo
  FDCB3.AddSortOrder(AAAACEL:CEL_PK)
  FDCB3.AddField(AAAACEL:CelOms,FDCB3.Q.AAAACEL:CelOms) !List box control field - type derived from field
  FDCB3.AddField(AAAACEL:CelID,FDCB3.Q.AAAACEL:CelID) !Primary key field - type derived from field
  FDCB3.AddUpdateField(AAAACEL:CelID,OMQ:CelID)
  FDCB3.AddUpdateField(AAAACEL:CelOms,UMQ:CelOms)
  ThisWindow.AddItem(FDCB3.WindowComponent)
  FDCB3.DefaultFill = 0
  FDCB4.Init(AAAACL:Locatienaam,?AAAACL:Locatienaam,Queue:FileDropCombo:1.ViewPosition,FDCB4::View:FileDropCombo,Queue:FileDropCombo:1,Relate:AAAACelLocatie,ThisWindow,GlobalErrors,0,1,0)
  FDCB4.Q &= Queue:FileDropCombo:1
  FDCB4.AddSortOrder(AAAACL:FK_CelLocatie)
  FDCB4.AddRange(AAAACL:CelID,OMQ:CelID)
  FDCB4.AddField(AAAACL:Locatienaam,FDCB4.Q.AAAACL:Locatienaam) !List box control field - type derived from field
  FDCB4.AddField(AAAACL:CelLocatieID,FDCB4.Q.AAAACL:CelLocatieID) !Primary key field - type derived from field
  FDCB4.AddUpdateField(AAAACL:CelLocatieID,OMQ:CelLocatieID)
  FDCB4.AddUpdateField(AAAACL:Locatienaam,OMQ:CelLocatieNaam)
  ThisWindow.AddItem(FDCB4.WindowComponent)
  FDCB4.DefaultFill = 0
  SELF.SetAlerts()
  EnterByTabManager.Init(False)
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:AAAACel.Close
    Relate:AAAACelLocatie.Close
  END
  IF SELF.Opened
    INIMgr.Update('UpdateOverboekingMutatieQueue',Window)  ! Save window data to non-volatile store
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
    OF ?OkButton
      ! Controleren
      IF OMQ:KG = 0 AND OMQ:Pallet = 0 THEN
      	SELECT(?OMQ:KG)
      	RETURN Level:Notify
      .
      
      ! Handmatig Cel-locatie vullen
      CLEAR(AAAACL:Record)
      AAAACL:CelLocatieID = OMQ:CelLocatieID
      IF Access:AAAACelLocatie.TryFetch(AAAACL:PK_CelLocatie) = Level:Benign THEN
          IF AAAACL:CelID <> OMQ:CelID THEN
              OMQ:CelLocatieID = 0
              OMQ:CelLocatieNaam = ''
          END
      ELSE
          OMQ:CelLocatieID = 0
          OMQ:CelLocatieNaam = ''
      END
          
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?OkButton
      ThisWindow.Update()
      ! Opslaan
      IF ThisWindow.Request = InsertRecord
      	ADD(GLO:OverboekingMutatieQueue)
      ELSIF ThisWindow.Request = ChangeRecord
      	PUT(GLO:OverboekingMutatieQueue)
      END
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

!!! <summary>
!!! Generated from procedure template - Window
!!! Form Mutatie
!!! </summary>
UpdateOverboekMutatie PROCEDURE 

CurrentTab           STRING(80)                            ! 
Loc:KG               DECIMAL(10,2)                         ! 
Loc:CelLocatieNaam   CSTRING(51)                           ! 
Loc:Pallets          LONG                                  ! 
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
LOC:PartijVoorraadKG DECIMAL(9,2)                          ! 
LOC:PartijVoorraadPallet LONG                              ! 
LOC:PartijCelID      CSTRING(26)                           ! 
LOC:OrigineelPartijCelID CSTRING(26)                       ! 
LOC:OrigineelPartijID LONG                                 ! 
LOC:OrigineelCelID   LONG                                  ! 
LOC:OrigineelNaarPartijCelID CSTRING(26),DIM(100)          ! 
LOC:OrigineelNaarPartijID LONG,DIM(100)                    ! 
LOC:OrigineelNaarCelID LONG,DIM(100)                       ! 
LOC:OrigineelKG      DECIMAL(10,2),DIM(100)                ! 
LOC:OrigineelPallets LONG,DIM(100)                         ! 
LOC:OrigineelArtikelID CSTRING(31)                         ! 
LOC:OverboekingCelID LONG                                  ! 
LOC:NaarTotaalKG     DECIMAL(10,2)                         ! 
LOC:NaarTotaalPallets DECIMAL(10,2)                        ! 
LOC:NaarVerschilKG   DECIMAL(10,2)                         ! 
LOC:NaarVerschilPallets LONG                               ! 
LOC:NaarCelID2       LONG                                  ! 
LOC:NaarCelLocatieID2 LONG                                 ! 
LOC:NaarKG2          DECIMAL(10,2)                         ! 
LOC:NaarPallets2     LONG                                  ! 
LOC:NaarCelID3       LONG                                  ! 
LOC:NaarCelLocatieID3 LONG                                 ! 
LOC:NaarKG3          DECIMAL(10,2)                         ! 
LOC:NaarPallets3     LONG                                  ! 
LOC:NaarCelID4       LONG                                  ! 
LOC:NaarCelLocatieID4 LONG                                 ! 
LOC:NaarKG4          DECIMAL(10,2)                         ! 
LOC:NaarPallets4     LONG                                  ! 
LOC:Validatie        BYTE                                  ! 
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
                       PROJECT(VVPar:VoorraadKG)
                       PROJECT(VVPar:PartijID)
                       PROJECT(VVPar:CelID)
                       PROJECT(VVPar:VoorraadPallets)
                       JOIN(Par:Partij_PK,VVPar:PartijID)
                         PROJECT(Par:PartijID)
                         PROJECT(Par:ExternPartijnr)
                         PROJECT(Par:VerpakkingID)
                         PROJECT(Par:ArtikelID)
                         PROJECT(Par:Leverancier)
                         JOIN(Ver:Verpakking_PK,Par:VerpakkingID)
                           PROJECT(Ver:VerpakkingOmschrijving)
                           PROJECT(Ver:VerpakkingID)
                         END
                         JOIN(Rel:Relatie_PK,Par:Leverancier)
                           PROJECT(Rel:FirmaNaam)
                         END
                       END
                       JOIN(ACel:CEL_PK,VVPar:CelID)
                         PROJECT(ACel:CelOms)
                         PROJECT(ACel:CelID)
                       END
                     END
FDCB8::View:FileDropCombo VIEW(Cel)
                       PROJECT(CEL:CelOms)
                       PROJECT(CEL:CelID)
                     END
FDCB11::View:FileDropCombo VIEW(CelLocatie)
                       PROJECT(CL:Locatienaam)
                       PROJECT(CL:CelLocatieID)
                     END
Queue:FileDropCombo  QUEUE                            !
VVP:ArtikelID          LIKE(VVP:ArtikelID)            !List box control field - type derived from field
VVP:ArtikelOms         LIKE(VVP:ArtikelOms)           !List box control field - type derived from field
LOC:ArtikelVoorraadKG  LIKE(LOC:ArtikelVoorraadKG)    !List box control field - type derived from local data
LOC:ArtikelVoorraadKG_NormalFG LONG                   !Normal forground color
LOC:ArtikelVoorraadKG_NormalBG LONG                   !Normal background color
LOC:ArtikelVoorraadKG_SelectedFG LONG                 !Selected forground color
LOC:ArtikelVoorraadKG_SelectedBG LONG                 !Selected background color
LOC:ArtikelVoorraadPallet LIKE(LOC:ArtikelVoorraadPallet) !List box control field - type derived from local data
LOC:ArtikelVoorraadPallet_NormalFG LONG               !Normal forground color
LOC:ArtikelVoorraadPallet_NormalBG LONG               !Normal background color
LOC:ArtikelVoorraadPallet_SelectedFG LONG             !Selected forground color
LOC:ArtikelVoorraadPallet_SelectedBG LONG             !Selected background color
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
Par:PartijID           LIKE(Par:PartijID)             !List box control field - type derived from field
Par:ExternPartijnr     LIKE(Par:ExternPartijnr)       !List box control field - type derived from field
ACel:CelOms            LIKE(ACel:CelOms)              !List box control field - type derived from field
VVPar:VoorraadKG       LIKE(VVPar:VoorraadKG)         !List box control field - type derived from field
LOC:PartijVoorraadKG   LIKE(LOC:PartijVoorraadKG)     !List box control field - type derived from local data
Ver:VerpakkingOmschrijving LIKE(Ver:VerpakkingOmschrijving) !List box control field - type derived from field
Rel:FirmaNaam          LIKE(Rel:FirmaNaam)            !List box control field - type derived from field
Par:VerpakkingID       LIKE(Par:VerpakkingID)         !Browse hot field - type derived from field
Par:ArtikelID          LIKE(Par:ArtikelID)            !Browse hot field - type derived from field
VVPar:PartijID         LIKE(VVPar:PartijID)           !Browse hot field - type derived from field
VVPar:CelID            LIKE(VVPar:CelID)              !Browse hot field - type derived from field
VVPar:VoorraadPallets  LIKE(VVPar:VoorraadPallets)    !Browse hot field - type derived from field
Ver:VerpakkingID       LIKE(Ver:VerpakkingID)         !Related join file key field - type derived from field
ACel:CelID             LIKE(ACel:CelID)               !Related join file key field - type derived from field
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
CL:Locatienaam         LIKE(CL:Locatienaam)           !List box control field - type derived from field
CL:CelLocatieID        LIKE(CL:CelLocatieID)          !Primary key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
LocEnableEnterByTab  BYTE(1)                               !Used by the ENTER Instead of Tab template
EnterByTabManager    EnterByTabClass
History::Mut:Record  LIKE(Mut:RECORD),THREAD
QuickWindow          WINDOW('Form Mutatie'),AT(,,545,212),FONT('MS Sans Serif',8,,,CHARSET:DEFAULT),DOUBLE,CENTER, |
  GRAY,IMM,MDI,HLP('UpdateUitslagMutatie'),SYSTEM
                       SHEET,AT(4,4,539,189),USE(?CurrentTab)
                         TAB('&1) General'),USE(?Tab:1)
                           PROMPT('Invoerdatum:'),AT(13,23),USE(?Mut:DatumTijd_DATE:Prompt),TRN
                           ENTRY(@d6-),AT(88,25,64,10),USE(Mut:DatumTijd_DATE),SKIP
                           PROMPT('Invoertijd:'),AT(172,25),USE(?Mut:DatumTijd_TIME:Prompt),TRN
                           ENTRY(@t7),AT(209,25,56,10),USE(Mut:DatumTijd_TIME),SKIP
                           PROMPT('Artikel:'),AT(13,41),USE(?PROMPT1)
                           COMBO(@s60),AT(87,41,308,10),USE(VVP:ArtikelOms),DROP(25),FORMAT('51L(2)|~Artikel ID~C(' & |
  '0)@s30@115L(2)|~Artikel~C(2)@s60@[54R(2)|*~KG~C(0)@n-13`2@60R(2)|*~Pallets~C(0)@n-14.@]|'), |
  FROM(Queue:FileDropCombo),IMM
                           PROMPT('Partij:'),AT(13,68),USE(?PROMPT2)
                           COMBO(@s25),AT(87,68,308,10),USE(VVPar:PartijCelID),DROP(5,400),FORMAT('0L(2)~Partij.Ce' & |
  'l~C(0)@s25@[42R(2)|~Intern~C(0)@n_10B@60R(2)|~Extern~C(1)@n_10B@](87)|~Partijnummer~' & |
  '41R(2)|~Cel~C(0)@s50@56R(2)|~Voorraad KG~D(14)@n-13`2@[49R(2)|M~KG~C(1)@n-12`2@](48)' & |
  '|~Voorraad~81L(2)|~Verpakking~C(2)@s50@94L(2)|~Leverancier~C(0)@s50@'),FROM(Queue:FileDropCombo:1), |
  IMM
                           PROMPT('Naar cel:'),AT(9,151),USE(?PROMPT6)
                           BUTTON('Neem Voorraad'),AT(405,79,68,23),USE(?NeemVoorraadButton:5),FONT('Microsoft Sans Serif', |
  ,,FONT:regular)
                           ENTRY(@n12_`2),AT(407,121,60,10),USE(LOC:NaarTotaalKG),RIGHT(2)
                           ENTRY(@n_9),AT(477,121,60,10),USE(LOC:NaarTotaalPallets),RIGHT(2)
                           COMBO(@s30),AT(87,151,307,10),USE(CEL:CelOms),DROP(5),FORMAT('110L(2)|M~Cel~@s50@'),FROM(Queue:FileDropCombo:2), |
  IMM
                           PROMPT('Cel:'),AT(86,108),USE(?PROMPT3)
                           PROMPT('KG'),AT(451,106),USE(?Mut:UitslagKG:Prompt)
                           PROMPT('Pallets'),AT(513,106),USE(?Mut:UitslagPallet:Prompt)
                           PROMPT('Leverancier:'),AT(86,81),USE(?PROMPT4)
                           PROMPT('Verpakking:'),AT(86,95),USE(?PROMPT5)
                           STRING(@s50),AT(130,81,265),USE(Rel:FirmaNaam)
                           STRING(@s50),AT(129,95,266),USE(Ver:VerpakkingOmschrijving)
                           STRING(@s50),AT(129,108,266),USE(ACel:CelOms)
                           STRING(@s50),AT(131,54,263),USE(Art:ArtikelOms)
                           STRING('Locatie:'),AT(9,164),USE(?STRING1)
                           LIST,AT(87,137,307,10),USE(Mut:OverboekSoort),DROP(5),FROM('Overboeking|Verplaatsing|Co' & |
  'rrectie|Afboeking')
                           ENTRY(@n12_`2),AT(407,137,60,10),USE(Mut:UitslagKG),RIGHT(2)
                           ENTRY(@n_9),AT(477,137,60,10),USE(Mut:UitslagPallet),RIGHT(2)
                           STRING('KGBalans'),AT(405,174,63,12),USE(?KGBalans),RIGHT(6)
                           STRING('PalletsBalans'),AT(475,174,63,12),USE(?PalletsBalans),RIGHT(6)
                           COMBO(@s50),AT(87,166,307,10),USE(CL:Locatienaam),DROP(25),FORMAT('200L(2)|M~Locatienaa' & |
  'm~L(0)@s50@'),FROM(Queue:FileDropCombo:3),IMM
                           STRING('Locatie'),AT(86,121),USE(?STRING2)
                           STRING(@s50),AT(129,122,266),USE(AAAACL:Locatienaam),FONT('Microsoft Sans Serif',,,FONT:regular)
                           PROMPT('Overboek Soort:'),AT(9,135),USE(?Mut:OverboekSoort:Prompt)
                         END
                       END
                       BUTTON('&OK'),AT(437,194,49,14),USE(?OK),LEFT,ICON('WAOK.ICO'),DEFAULT,FLAT,MSG('Accept dat' & |
  'a and close the window'),TIP('Accept data and close the window')
                       BUTTON('&Cancel'),AT(491,194,49,14),USE(?Cancel),LEFT,ICON('WACANCEL.ICO'),FLAT,MSG('Cancel operation'), |
  TIP('Cancel operation')
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

FDCB7                CLASS(FileDropComboClass)             ! File drop combo manager
Q                      &Queue:FileDropCombo           !Reference to browse queue type
SetQueueRecord         PROCEDURE(),DERIVED
ValidateRecord         PROCEDURE(),BYTE,DERIVED
                     END

FDCB4                CLASS(FileDropComboClass)             ! File drop combo manager
Q                      &Queue:FileDropCombo:1         !Reference to browse queue type
ValidateRecord         PROCEDURE(),BYTE,DERIVED
                     END

FDCB8                CLASS(FileDropComboClass)             ! File drop combo manager
Q                      &Queue:FileDropCombo:2         !Reference to browse queue type
                     END

FDCB11               CLASS(FileDropComboClass)             ! File drop combo manager
Q                      &Queue:FileDropCombo:3         !Reference to browse queue type
                     END

LocalClass          CLASS
HideControls           PROCEDURE()
                    END
Boeksoort           GROUP
Afboeking               String('Afboeking')
Verplaatsing            String('Verplaatsing')
Correctie               String('Correctie')
Overboeking             String('Overboeking')
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
	LOC:NaarVerschilKG = LOC:NaarTotaalKG - (Mut:UitslagKG+LOC:NaarKG2+LOC:NaarKG3+LOC:NaarKG4)
	LOC:NaarVerschilPallets = LOC:NaarTotaalPallets - (Mut:UitslagPallet+LOC:NaarPallets2+LOC:NaarPallets3+LOC:NaarPallets4)
	
	
	IF LOC:NaarVerschilKG = 0
		?KGBalans{Prop:Text} = 'Klopt'
	ELSE
		?KGBalans{Prop:Text} = format(LOC:NaarVerschilKG, @n-10`2)
	.
	
	IF LOC:NaarVerschilPallets = 0
		?PalletsBalans{Prop:Text} = 'Klopt'
	ELSE
		?PalletsBalans{Prop:Text} = format(LOC:NaarVerschilPallets, @n-14.)
    .
    
    ThisWindow.Reset(1)
	
	EXIT
ControleerMutaties  ROUTINE
DATA
ControleTekst STRING(100)
CODE
    db.DebugOut('ControleerMutaties')
    ! Controleren of de voorgestelde mutaties niet tot negatieve voorraadstanden leiden
    VoorraadClass.ResetPartijCelControle()

    ! Oorspronkelijke mutaties meenemen indien relevant
    LOOP i# = 1 TO 100
        VoorraadClass.AddPartijCelControleOverboeking(LOC:OrigineelPartijID, LOC:OrigineelCelID, LOC:OrigineelNaarCelID[i#], -LOC:OrigineelKG[i#], -LOC:OrigineelPallets[i#])
    END
    
    ! Nieuwe mutaties meenemen
    ! Uit de directe controls
    VoorraadClass.AddPartijCelControleOverboeking(Mut:PartijID, Mut:CelID, Mut:NaarCelID, Mut:UitslagKG, Mut:UitslagPallet)
    
    ControleTekst = VoorraadClass.PartijCelControleOK()
    
    IF NOT(CLIP(ControleTekst) = '') THEN
        Message(CLIP(ControleTekst), 'Let op!', ICON:Exclamation)
        LOC:Validatie = False
    ELSE
        LOC:Validatie = True
    END
    
WisMutaties ROUTINE
	! Vullen regels
    IF Mut:PlanningID <> 0
        GLO:GebruikerLogHandelingOpmerking='Overboeken Mutatie' 
	   Clear(AMut:Record)
	   AMut:PlanningID = Mut:PlanningID
	   SET(AMut:Mutatie_FK02, AMut:Mutatie_FK02)
	   LOOP UNTIL Access:AMutatie.Next()
		   IF NOT(AMut:PlanningID = Mut:PlanningID) THEN BREAK.
		   ! Huidige mutatie die geupdated wordt niet verwijderen
           IF (AMut:MutatieID=Mut:MutatieID) THEN CYCLE.
		   Access:AMutatie.DeleteRecord(false)
        END
        CLEAR(GLO:GebruikerLogHandelingOpmerking)
	END
	EXIT
MaakMutaties ROUTINE ! Extra mutaties aanmaken
    AMut:Record = Mut:Record
    GLO:GebruikerLogHandelingOpmerking='Overboeken Mutatie' 
    ! (1) Eerst de complementaire OIN-mutatie
    CLEAR(Mut:Record)
    Access:Mutatie.PrimeRecord(false)
    Mut:DatumTijd=AMut:DatumTijd
    Mut:PartijID=AMut:PartijID
    Mut:CelID=AMut:NaarCELID
    Mut:CelLocatieID=VoorraadClass.ControleerCelLocatie(AMut:NaarCELID, AMut:OverboekCelLocatieID)  !AMut:CelLocatieID
    Mut:InslagKG=AMut:UitslagKG
    Mut:InslagPallet=AMut:UitslagPallet
    Mut:UitslagKG=0
    Mut:UitslagPallet=0
    Mut:SoortMutatie='OIN'
    Mut:NaarCELID=AMut:CelID
    Mut:RedenAfboeking=''
    Mut:ArtikelID=AMut:ArtikelID
    Mut:PlanningID=AMut:PlanningID
    Access:Mutatie.Insert()
    
    ! (2) Dan de OIN / OUT-mutatie uit de losse controls
    

    Mut:Record = AMut:Record
    CLEAR(GLO:GebruikerLogHandelingOpmerking)

ThisWindow.Ask PROCEDURE

  CODE
  CASE SELF.Request                                        ! Configure the action message text
  OF ViewRecord
    ActionMessage = 'View Record'
  OF InsertRecord
    ActionMessage = 'Overboeking toevoegen'
  OF ChangeRecord
    ActionMessage = 'Overboeking wijzigen'
  END
  QuickWindow{PROP:Text} = ActionMessage                   ! Display status message in title bar
  PARENT.Ask


ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('UpdateOverboekMutatie')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Mut:DatumTijd_DATE:Prompt
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('LOC:ArtikelVoorraadKG',LOC:ArtikelVoorraadKG)      ! Added by: FileDropCombo(ABC)
  BIND('LOC:ArtikelVoorraadPallet',LOC:ArtikelVoorraadPallet) ! Added by: FileDropCombo(ABC)
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.HistoryKey = CtrlH
  SELF.AddHistoryFile(Mut:Record,History::Mut:Record)
  SELF.AddHistoryField(?Mut:DatumTijd_DATE,4)
  SELF.AddHistoryField(?Mut:DatumTijd_TIME,5)
  SELF.AddHistoryField(?Mut:OverboekSoort,52)
  SELF.AddHistoryField(?Mut:UitslagKG,10)
  SELF.AddHistoryField(?Mut:UitslagPallet,11)
  SELF.AddUpdateFile(Access:Mutatie)
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  Relate:AAAACelLocatie.Open                               ! File AAAACelLocatie used by this procedure, so make sure it's RelationManager is open
  Relate:AMutatie.Open                                     ! File AMutatie used by this procedure, so make sure it's RelationManager is open
  Relate:ARelatie.Open                                     ! File ARelatie used by this procedure, so make sure it's RelationManager is open
  Relate:AViewVoorraadPartij.Open                          ! File AViewVoorraadPartij used by this procedure, so make sure it's RelationManager is open
  Relate:Cel.SetOpenRelated()
  Relate:Cel.Open                                          ! File Cel used by this procedure, so make sure it's RelationManager is open
  Relate:Mutatie.Open                                      ! File Mutatie used by this procedure, so make sure it's RelationManager is open
  Relate:Verkoop.Open                                      ! File Verkoop used by this procedure, so make sure it's RelationManager is open
  Relate:ViewVoorraadPartij.Open                           ! File ViewVoorraadPartij used by this procedure, so make sure it's RelationManager is open
  Relate:ViewVoorraadPlanning.Open                         ! File ViewVoorraadPlanning used by this procedure, so make sure it's RelationManager is open
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
  IF Self.Request=ChangeRecord 
      Clear(PAR:Record)
      Par:PartijID = Mut:PartijID
      Access:Partij.TryFetch(Par:Partij_PK)
      
      Loc:ArtikelID = Par:ArtikelID
      Loc:RelatieID = Par:Leverancier
      Loc:VerpakkingsID = Par:VerpakkingID
      LOC:PartijCelID = CLIP(FORMAT(Mut:PartijID, @N05)) & '.' & CLIP(Mut:CelID)
      
      ! Opslaan bestaande uitslag om rekening mee te houden
      ! bij het controleren van de voorraad
      LOC:OrigineelArtikelID = Mut:ArtikelID
      LOC:OrigineelPartijCelID = LOC:PartijCelID
      LOC:OrigineelPartijID = Mut:PartijID
      LOC:OrigineelCelID = Mut:CelID
      LOC:OrigineelNaarPartijCelID[1] = CLIP(FORMAT(Mut:PartijID, @N05)) & '.' & CLIP(Mut:NaarCELID)
      LOC:OrigineelNaarPartijID[1] = Mut:PartijID
      LOC:OrigineelNaarCelID[1] = Mut:NaarCelID
      LOC:OrigineelKG[1] = Mut:UitslagKG
      LOC:OrigineelPallets[1] = Mut:UitslagPallet
  
      CLEAR(VVP:Record)
      VVP:ArtikelID=Loc:ArtikelID
      Access:ViewVoorraadPlanning.TryFetch(VVP:ViewVoorraad_PK)
      
      CLEAR(VVPar:Record)
      VVPar:PartijCelID = LOC:PartijCelID
      Access:ViewVoorraadPartij.TryFetch(VVPar:PartijCelID_K)
      IF NOT(ERROR())
          LOC:KG = VVPar:VoorraadKG
          LOC:Pallets = VVPar:VoorraadPallets
      ELSE
          Loc:KG = 0
          Loc:Pallets = 0
      .
      
      ! De overige mutaties ophalen in de locale-variabelen/queue stoppen
      IF (Mut:PlanningID <> 0)
         LOC:NaarTotaalKG = 0
         LOC:NaarTotaalPallets = 0
         LOOP i# = 1 TO 100
             LOC:NaarTotaalKG += LOC:OrigineelKG[i#]
             LOC:NaarTotaalPallets += LOC:OrigineelPallets[i#]
         END
     END
  ELSIF SELF.Request=InsertRecord
      Loc:ArtikelID = PLA:ArtikelID
      Loc:VerpakkingsID = PLA:VerpakkingID
  !	Loc:RelatieID = Par:Leverancier
      LOC:PartijCelID = CLIP(FORMAT(Pla:PartijID, @N05)) & '.' & CLIP(Pla:CelID)
  
      ! Geen bestaande uitslag om rekening mee te houden
      ! bij het controleren van de voorraad
      LOC:OrigineelPartijCelID=''
      LOC:OrigineelArtikelID=''
      LOC:OrigineelNaarPartijCelID[1]=''
      LOC:OrigineelKG[1] = 0
      LOC:OrigineelPallets[1] = 0
  
      VVPar:PartijCelID = LOC:PartijCelID
      Access:ViewVoorraadPartij.TryFetch(VVPar:PartijCelID_K)
      IF NOT(ERROR())
          LOC:KG = VVPar:VoorraadKG
          LOC:Pallets = VVPar:VoorraadPallets
          
          LOC:NaarTotaalKG = Mut:UitslagKG
          LOC:NaarTotaalPallets = Mut:UitslagPallet
          
          Mut:PartijID = Pla:PartijID
          Mut:CelID = Pla:CelID
          Mut:CelLocatieID = Pla:CelLocatieID
      ELSE
          LOC:PartijCelID = ''
          Loc:KG = 0
          Loc:Pallets = 0
  
          LOC:NaarTotaalKG = Mut:UitslagKG
          LOC:NaarTotaalPallets = Mut:UitslagPallet
          
          Mut:PartijID = 0
          Mut:CelID = 0
          Mut:CelLocatieID = 0
      .
      
      Mut:PlanningID = Pla:PlanningID
  
      Mut:DatumTijd_DATE = TODAY()
      Mut:DatumTijd_TIME = CLOCK()
      
      Mut:SoortMutatie = 'OUIT'
      
      Mut:NaarCELID = Pla:OverboekingCelID
      Mut:OverBoekCelLocatieID=Pla:OverboekCelLocatieID 
      Mut:OverboekSoort=Pla:OverboekSoort
      !Mut:CelLocatieID = Pla:CelLocatieID
      !Mut:CelLocatieID = Pla:OverboekCelLocatieID
      
      CLEAR(AAAACL:Record)
      AAAACL:CelLocatieID = Mut:CelLocatieID
      Access:AAAACelLocatie.TryFetch(AAAACL:PK_CelLocatie)
      IF Mut:NaarCELID <> AAAACL:CelID THEN Mut:CelLocatieID = 0.
  .
  
  LocalClass.HideControls()
  DO BerekenTotaal
  WinAlertMouseZoom()
  Do DefineListboxStyle
  IF SELF.Request = ViewRecord                             ! Configure controls for View Only mode
    ?Mut:DatumTijd_DATE{PROP:ReadOnly} = True
    ?Mut:DatumTijd_TIME{PROP:ReadOnly} = True
    DISABLE(?VVP:ArtikelOms)
    DISABLE(?VVPar:PartijCelID)
    DISABLE(?NeemVoorraadButton:5)
    ?LOC:NaarTotaalKG{PROP:ReadOnly} = True
    ?LOC:NaarTotaalPallets{PROP:ReadOnly} = True
    DISABLE(?CEL:CelOms)
    DISABLE(?Mut:OverboekSoort)
    ?Mut:UitslagKG{PROP:ReadOnly} = True
    ?Mut:UitslagPallet{PROP:ReadOnly} = True
    DISABLE(?CL:Locatienaam)
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
  FDCB4.AddField(Par:PartijID,FDCB4.Q.Par:PartijID) !List box control field - type derived from field
  FDCB4.AddField(Par:ExternPartijnr,FDCB4.Q.Par:ExternPartijnr) !List box control field - type derived from field
  FDCB4.AddField(ACel:CelOms,FDCB4.Q.ACel:CelOms) !List box control field - type derived from field
  FDCB4.AddField(VVPar:VoorraadKG,FDCB4.Q.VVPar:VoorraadKG) !List box control field - type derived from field
  FDCB4.AddField(LOC:PartijVoorraadKG,FDCB4.Q.LOC:PartijVoorraadKG) !List box control field - type derived from local data
  FDCB4.AddField(Ver:VerpakkingOmschrijving,FDCB4.Q.Ver:VerpakkingOmschrijving) !List box control field - type derived from field
  FDCB4.AddField(Rel:FirmaNaam,FDCB4.Q.Rel:FirmaNaam) !List box control field - type derived from field
  FDCB4.AddField(Par:VerpakkingID,FDCB4.Q.Par:VerpakkingID) !Browse hot field - type derived from field
  FDCB4.AddField(Par:ArtikelID,FDCB4.Q.Par:ArtikelID) !Browse hot field - type derived from field
  FDCB4.AddField(VVPar:PartijID,FDCB4.Q.VVPar:PartijID) !Browse hot field - type derived from field
  FDCB4.AddField(VVPar:CelID,FDCB4.Q.VVPar:CelID) !Browse hot field - type derived from field
  FDCB4.AddField(VVPar:VoorraadPallets,FDCB4.Q.VVPar:VoorraadPallets) !Browse hot field - type derived from field
  FDCB4.AddField(Ver:VerpakkingID,FDCB4.Q.Ver:VerpakkingID) !Related join file key field - type derived from field
  FDCB4.AddField(ACel:CelID,FDCB4.Q.ACel:CelID) !Related join file key field - type derived from field
  FDCB4.AddUpdateField(VVPar:PartijCelID,LOC:PartijCelID)
  FDCB4.AddUpdateField(Par:Leverancier,Loc:RelatieID)
  FDCB4.AddUpdateField(VVPar:PartijID,Mut:PartijID)
  FDCB4.AddUpdateField(VVPar:CelID,Mut:CelID)
  FDCB4.AddUpdateField(VVPar:VoorraadKG,Loc:KG)
  FDCB4.AddUpdateField(VVPar:VoorraadPallets,Loc:Pallets)
  ThisWindow.AddItem(FDCB4.WindowComponent)
  FDCB4.DefaultFill = 0
  FDCB8.Init(CEL:CelOms,?CEL:CelOms,Queue:FileDropCombo:2.ViewPosition,FDCB8::View:FileDropCombo,Queue:FileDropCombo:2,Relate:Cel,ThisWindow,GlobalErrors,0,1,0)
  FDCB8.Q &= Queue:FileDropCombo:2
  FDCB8.AddSortOrder(CEL:CEL_PK)
  FDCB8.AddField(CEL:CelOms,FDCB8.Q.CEL:CelOms) !List box control field - type derived from field
  FDCB8.AddField(CEL:CelID,FDCB8.Q.CEL:CelID) !Primary key field - type derived from field
  FDCB8.AddUpdateField(CEL:CelID,Mut:NaarCELID)
  ThisWindow.AddItem(FDCB8.WindowComponent)
  FDCB8.DefaultFill = 0
  FDCB11.Init(CL:Locatienaam,?CL:Locatienaam,Queue:FileDropCombo:3.ViewPosition,FDCB11::View:FileDropCombo,Queue:FileDropCombo:3,Relate:CelLocatie,ThisWindow,GlobalErrors,0,1,0)
  FDCB11.Q &= Queue:FileDropCombo:3
  FDCB11.AddSortOrder(CL:FK_CelLocatie)
  FDCB11.AddRange(CL:CelID,Mut:NaarCELID)
  FDCB11.AddField(CL:Locatienaam,FDCB11.Q.CL:Locatienaam) !List box control field - type derived from field
  FDCB11.AddField(CL:CelLocatieID,FDCB11.Q.CL:CelLocatieID) !Primary key field - type derived from field
  FDCB11.AddUpdateField(CL:CelLocatieID,Mut:OverboekCelLocatieID)
  ThisWindow.AddItem(FDCB11.WindowComponent)
  FDCB11.DefaultFill = 0
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
    Relate:AAAACelLocatie.Close
    Relate:AMutatie.Close
    Relate:ARelatie.Close
    Relate:AViewVoorraadPartij.Close
    Relate:Cel.Close
    Relate:Mutatie.Close
    Relate:Verkoop.Close
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
      ThisNetRefresh.Send('|Mutatie|ViewVoorraadPlanning|ViewVoorraadPartij|Cel|CelLocatie|') ! NetTalk (NetRefresh)
    End
    If returnValue = Level:Fatal  ! delete just occured
  		NetRefreshVoorraadViews()
  		NetRefreshPlanningViews()
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
    OF ?NeemVoorraadButton:5
      LOC:NaarTotaalKG=FDCB4.Q.LOC:PartijVoorraadKG
      
      	Mut:UitslagKG = LOC:NaarTotaalKG
      
      DO BerekenTotaal
    OF ?LOC:NaarTotaalKG
      	Mut:UitslagKG = LOC:NaarTotaalKG
      
      DO BerekenTotaal
    OF ?LOC:NaarTotaalPallets
      	Mut:UitslagPallet = LOC:NaarTotaalPallets
      
      DO BerekenTotaal
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?VVP:ArtikelOms
      IF Mut:ArtikelID <> '' THEN
      	CLEAR(AVVPar:Record)
      	AVVPar:PartijCelID = LOC:PartijCelID
      	IF(Access:AViewVoorraadPartij.TryFetch(AVVPar:PartijCelID_K) = Level:Benign)
      		IF(AVVPar:ArtikelID <> Mut:ArtikelID)
      			LOC:PartijCelID = ''
      		.
      	ELSE		
      		LOC:PartijCelID = ''
      	.
      ELSE
      	LOC:PartijCelID = ''
      .
      
      ThisWindow.Reset(true)
    OF ?CEL:CelOms
      If 0{PROP:AcceptAll} = False Then
          If NOT CL:CelID = CEL:CelID Then
              Clear(CL:Locatienaam)
              Clear(Mut:CelLocatieID)
              Display(?CL:Locatienaam)
          End
      End
      
    OF ?Mut:OverboekSoort
      LocalClass.HideControls()
    OF ?Mut:UitslagKG
      
      DO BerekenTotaal
    OF ?Mut:UitslagPallet
      
      DO BerekenTotaal
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
  ! Invoer controleren
  If LOC:PartijCelID = '' THEN
      Select(?VVPar:PartijCelID)
      RETURN Level:Notify
  .
  
  IF Mut:NaarCELID = 0 THEN
      Select(?Cel:CelOms)
      RETURN Level:Notify
  END
  
  If (Mut:UitslagKG = 0 AND Mut:UitslagPallet = 0) THEN
      Select(?Mut:UitslagKG)
      RETURN Level:Notify
  END
  
  DO ControleerMutaties
  IF NOT(LOC:Validatie) THEN RETURN Level:Notify.
  ReturnValue = PARENT.TakeCompleted()
    ThisNetRefresh.Send('|Mutatie|ViewVoorraadPlanning|ViewVoorraadPartij|Cel|CelLocatie|') ! NetTalk (NetRefresh)
  ! Mutaties aanmaken / bijwerken
  DO WisMutaties
  DO MaakMutaties
  
  VoorraadClass.BerekenPlanningMutatieGrootte(Mut:PlanningID)
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

LocalClass.HideControls    PROCEDURE()
CODE
    IF NOT INLIST(Mut:OverboekSoort,Boeksoort.Afboeking, Boeksoort.Verplaatsing, Boeksoort.Correctie, Boeksoort.Overboeking)
        Message('Onbekende OverBoeksoort '&Mut:OverboekSoort)
    END
    
    ?PROMPT6{Prop:Hide}=CHOOSE(Mut:OverboekSoort = Boeksoort.Afboeking OR Mut:OverboekSoort = Boeksoort.Correctie, TRUE, FALSE)
    ?Cel:CelOms{Prop:Hide}=CHOOSE(Mut:OverboekSoort = Boeksoort.Afboeking OR Mut:OverboekSoort = Boeksoort.Correctie, TRUE, FALSE)
    ?STRING1{Prop:Hide}=CHOOSE(Mut:OverboekSoort = Boeksoort.Afboeking OR Mut:OverboekSoort = Boeksoort.Correctie, TRUE, FALSE)
    ?CL:Locatienaam{Prop:Hide}=CHOOSE(Mut:OverboekSoort = Boeksoort.Afboeking OR Mut:OverboekSoort = Boeksoort.Correctie, TRUE, FALSE)
    
    ?Mut:UitslagKG{Prop:Disable}=CHOOSE(Mut:OverboekSoort=Boeksoort.Correctie, FALSE, TRUE)
    ?Mut:UitslagKG:Prompt{Prop:Disable}=CHOOSE(Mut:OverboekSoort=Boeksoort.Correctie, FALSE, TRUE)
    ?Mut:UitslagPallet{Prop:Disable}=CHOOSE(Mut:OverboekSoort=Boeksoort.Correctie, FALSE, TRUE)
    ?Mut:UitslagPallet:Prompt{Prop:Disable}=CHOOSE(Mut:OverboekSoort=Boeksoort.Correctie, FALSE, TRUE)
    
!    ?Pla:NieuwKG{Prop:Hide}=CHOOSE(Loc:OverboekSoort = Boeksoort.Correctie, FALSE, TRUE)
!    ?Loc:NieuwKG:Prompt{Prop:Hide}=CHOOSE(Loc:OverboekSoort = Boeksoort.Correctie, FALSE, TRUE)
!    ?Pla:NieuwPallets{Prop:Hide}=CHOOSE(Loc:OverboekSoort = Boeksoort.Correctie, FALSE, TRUE)
!    ?Loc:NieuwPallet:Prompt{Prop:Hide}=CHOOSE(Loc:OverboekSoort = Boeksoort.Correctie, FALSE, TRUE)
    
    Case Mut:OverboekSoort
    OF 'Overboeking'
    OF 'Verplaatsing'
    OF 'Afboeking'
    OF 'Correctie'
    ELSE
        Message('Onbekende OverBoeksoort '&Mut:OverboekSoort)
        
        END

Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window


FDCB7.SetQueueRecord PROCEDURE

  CODE
  !	LOC:ArtikelVoorraadKG=VVP:InslagKG-VVP:UitslagKG
  !	LOC:ArtikelVoorraadPallet=VVP:InslagPallets-VVP:UitslagPallets
  PARENT.SetQueueRecord
  
  IF (LOC:ArtikelVoorraadKG < 0)
    SELF.Q.LOC:ArtikelVoorraadKG_NormalFG = -1             ! Set conditional color values for LOC:ArtikelVoorraadKG
    SELF.Q.LOC:ArtikelVoorraadKG_NormalBG = 255
    SELF.Q.LOC:ArtikelVoorraadKG_SelectedFG = -1
    SELF.Q.LOC:ArtikelVoorraadKG_SelectedBG = 255
    SELF.Q.LOC:ArtikelVoorraadPallet_NormalFG = -1         ! Set conditional color values for LOC:ArtikelVoorraadPallet
    SELF.Q.LOC:ArtikelVoorraadPallet_NormalBG = 255
    SELF.Q.LOC:ArtikelVoorraadPallet_SelectedFG = -1
    SELF.Q.LOC:ArtikelVoorraadPallet_SelectedBG = 255
  ELSE
    SELF.Q.LOC:ArtikelVoorraadKG_NormalFG = -1             ! Set color values for LOC:ArtikelVoorraadKG
    SELF.Q.LOC:ArtikelVoorraadKG_NormalBG = -1
    SELF.Q.LOC:ArtikelVoorraadKG_SelectedFG = -1
    SELF.Q.LOC:ArtikelVoorraadKG_SelectedBG = -1
    SELF.Q.LOC:ArtikelVoorraadPallet_NormalFG = -1         ! Set color values for LOC:ArtikelVoorraadPallet
    SELF.Q.LOC:ArtikelVoorraadPallet_NormalBG = -1
    SELF.Q.LOC:ArtikelVoorraadPallet_SelectedFG = -1
    SELF.Q.LOC:ArtikelVoorraadPallet_SelectedBG = -1
  END


FDCB7.ValidateRecord PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  	LOC:ArtikelVoorraadKG=VVP:InslagKG-VVP:UitslagKG
  	LOC:ArtikelVoorraadPallet=VVP:InslagPallets-VVP:UitslagPallets
  
  	!IF LOC:ArtikelVoorraadKG <= 0 !AND LOC:ArtikelVoorraadPallet <= 0
  	!	RETURN Record:Filtered
  	!.
  ReturnValue = PARENT.ValidateRecord()
  RETURN ReturnValue


FDCB4.ValidateRecord PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ! Voorraad-standen weergeven, gecorrigeerd met de huidige mutaties v/d overboeking indien relevant
  LOC:PartijVoorraadKG=VVPar:VoorraadKG
  LOC:PartijVoorraadPallet=VVPar:VoorraadPallets
  
  LOOP i# = 1 TO 100
      IF CLIP(LOC:OrigineelNaarPartijCelID[i#]) = '' THEN BREAK.
  
      IF LOC:OrigineelPartijCelID = VVPar:PartijCelID THEN
          LOC:PartijVoorraadKG+=LOC:OrigineelKG[i#]
          LOC:PartijVoorraadPallet+=LOC:OrigineelPallets[i#]
      END
          
      IF LOC:OrigineelNaarPartijCelID[i#] = VVPar:PartijCelID THEN
          LOC:PartijVoorraadKG-=LOC:OrigineelKG[i#]
          LOC:PartijVoorraadPallet-=LOC:OrigineelPallets[i#]
      END            
  END
  
  IF NOT(LOC:PartijVoorraadKG > 0) THEN RETURN Record:Filtered.
  !IF NOT(LOC:PartijVoorraadKG > 0 OR LOC:PartijVoorraadPallet > 0) THEN RETURN Record:Filtered. 17-5 Pallets zijn niet zo boeiend
  ReturnValue = PARENT.ValidateRecord()
  RETURN ReturnValue

!!! <summary>
!!! Generated from procedure template - Window
!!! Form Mutatie
!!! </summary>
BulkOverboekMutatieWijzigen PROCEDURE 

CurrentTab           STRING(80)                            ! 
ActionMessage        CSTRING(40)                           ! 
LOC:ArtikelVoorraadKG DECIMAL(9,2)                         ! 
LOC:ArtikelVoorraadPallet LONG                             ! 
LOC:OverboekingKG_TMP DECIMAL(9,2)                         ! 
LOC:KG_TMP           DECIMAL(9,2)                          ! 
LOC:ArtikelID        CSTRING(26)                           ! 
LOC:VanCelID         LONG                                  ! 
LOC:NaarCelID        LONG                                  ! 
LOC:VerpakkingID     LONG                                  ! 
LOC:VerwijderControle BYTE                                 ! 
LOC:OverboekMutaties QUEUE,PRE(LOM)                        ! 
PartijID             LONG                                  ! 
Leverancier          STRING(50)                            ! 
Verpakking           STRING(50)                            ! 
Aanmaakdatum_DATE    DATE                                  ! 
Aanmaakdatum_TIME    TIME                                  ! 
KG                   DECIMAL(9,2)                          ! 
                     END                                   ! 
FDCB7::View:FileDropCombo VIEW(ViewArtikel)
                       PROJECT(Art:ArtikelID)
                       PROJECT(Art:ArtikelOms)
                     END
FDCB8::View:FileDropCombo VIEW(Cel)
                       PROJECT(CEL:CelOms)
                       PROJECT(CEL:CelID)
                     END
FDCB10::View:FileDropCombo VIEW(ACel)
                       PROJECT(ACel:CelOms)
                       PROJECT(ACel:CelID)
                     END
FDCB11::View:FileDropCombo VIEW(Verpakking)
                       PROJECT(Ver:VerpakkingOmschrijving)
                     END
FDCB12::View:FileDropCombo VIEW(CelLocatie)
                       PROJECT(CL:Locatienaam)
                       PROJECT(CL:CelLocatieID)
                     END
Queue:FileDropCombo  QUEUE                            !
Art:ArtikelID          LIKE(Art:ArtikelID)            !List box control field - type derived from field
Art:ArtikelOms         LIKE(Art:ArtikelOms)           !List box control field - type derived from field
LOC:ArtikelVoorraadKG  LIKE(LOC:ArtikelVoorraadKG)    !List box control field - type derived from local data
LOC:ArtikelVoorraadPallet LIKE(LOC:ArtikelVoorraadPallet) !List box control field - type derived from local data
VVP:ArtikelID          LIKE(VVP:ArtikelID)            !Browse hot field - type derived from field
VVP:InslagKG           LIKE(VVP:InslagKG)             !Browse hot field - type derived from field
VVP:InslagPallets      LIKE(VVP:InslagPallets)        !Browse hot field - type derived from field
VVP:UitslagKG          LIKE(VVP:UitslagKG)            !Browse hot field - type derived from field
VVP:UitslagPallets     LIKE(VVP:UitslagPallets)       !Browse hot field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
Queue:FileDropCombo:2 QUEUE                           !
CEL:CelOms             LIKE(CEL:CelOms)               !List box control field - type derived from field
CEL:CelID              LIKE(CEL:CelID)                !Primary key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
Queue:FileDropCombo:1 QUEUE                           !
ACel:CelOms            LIKE(ACel:CelOms)              !List box control field - type derived from field
ACel:CelID             LIKE(ACel:CelID)               !Primary key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
Queue:FileDropCombo:3 QUEUE                           !
Ver:VerpakkingOmschrijving LIKE(Ver:VerpakkingOmschrijving) !List box control field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
Queue:FileDropCombo:4 QUEUE                           !
CL:Locatienaam         LIKE(CL:Locatienaam)           !List box control field - type derived from field
CL:CelLocatieID        LIKE(CL:CelLocatieID)          !Primary key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
LocEnableEnterByTab  BYTE(1)                               !Used by the ENTER Instead of Tab template
EnterByTabManager    EnterByTabClass
History::BOV:Record  LIKE(BOV:RECORD),THREAD
QuickWindow          WINDOW('Form Mutatie'),AT(,,499,250),FONT('MS Sans Serif',8,,,CHARSET:DEFAULT),DOUBLE,CENTER, |
  GRAY,IMM,MDI,HLP('UpdateUitslagMutatie'),SYSTEM
                       BUTTON('&OK'),AT(273,225,49,18),USE(?OK),LEFT,ICON('WAOK.ICO'),DEFAULT,FLAT,MSG('Accept dat' & |
  'a and close the window'),TIP('Accept data and close the window')
                       PROMPT('Invoerdatum:'),AT(6,9),USE(?Mut:DatumTijd_DATE:Prompt),TRN
                       ENTRY(@d6-),AT(83,9,64,10),USE(BOV:MutatieDatumTijd_DATE),DISABLE,SKIP
                       PROMPT('Invoertijd:'),AT(169,9),USE(?Mut:DatumTijd_TIME:Prompt),TRN
                       ENTRY(@t7),AT(206,9,56,10),USE(BOV:MutatieDatumTijd_TIME),DISABLE,SKIP
                       PROMPT('Artikel:'),AT(6,26),USE(?PROMPT1)
                       COMBO(@s60),AT(83,25,308,10),USE(VVP:ArtikelOms),HVSCROLL,DISABLE,DROP(25),FORMAT('50L(2)|~Ar' & |
  'tikel ID~C(0)@s30@115L(2)|~Omschrijving~C(0)@s60@54R(2)|~KG~C(0)@n12`2@60R(2)|~Palle' & |
  'ts~C(0)@n-14.@'),FROM(Queue:FileDropCombo),IMM
                       PROMPT('Naar cel:'),AT(6,88),USE(?PROMPT6)
                       COMBO(@s30),AT(83,87,179,10),USE(CEL:CelOms),DISABLE,DROP(5),FORMAT('110L(2)|M~Cel~C(0)@s50@'), |
  FROM(Queue:FileDropCombo:2),IMM
                       PROMPT('Overboek KG:'),AT(6,119),USE(?Mut:UitslagKG:Prompt)
                       STRING(@s50),AT(177,41,214),USE(Art:ArtikelOms)
                       PROMPT('Van cel:'),AT(6,58),USE(?PROMPT2)
                       COMBO(@s50),AT(83,57,179,10),USE(ACel:CelOms),DISABLE,DROP(5),FORMAT('200L(2)|M~Cel~C(2)@s50@'), |
  FROM(Queue:FileDropCombo:1),IMM
                       COMBO(@s50),AT(83,72,269,10),USE(Ver:VerpakkingOmschrijving),DISABLE,DROP(5),FORMAT('200L(2)|M~' & |
  'Verpakking~C(0)@s50@'),FROM(Queue:FileDropCombo:3),IMM
                       PROMPT('Verpakking:'),AT(6,72),USE(?PROMPT3)
                       BUTTON('&Cancel'),AT(437,225,56,18),USE(?Cancel),LEFT,ICON('WACANCEL.ICO'),FLAT,MSG('Cancel operation'), |
  TIP('Cancel operation')
                       LIST,AT(83,132,409,89),USE(?LIST1),HVSCROLL,DISABLE,FORMAT('46R(2)|M~Partij-ID~C(1)@n_1' & |
  '0@100L(2)|M~Leverancier~C(0)@s40@70L(2)|M~Verpakking~C(0)@s30@[50R(2)|M@d17-@25R(2)|' & |
  'M@t7@]|~Aanmaakdatum~56R(2)|M~Overboeking~C(0)@n-13`2@'),FROM(LOC:OverboekMutaties)
                       ENTRY(@n-13`2),AT(83,116,65,10),USE(BOV:AantalKG),RIGHT,DISABLE
                       BUTTON('&Terugdraaien mutaties'),AT(329,225,105,18),USE(?Cancel:2),LEFT,ICON('WACANCEL.ICO'), |
  FLAT,MSG('Cancel operation'),TIP('Cancel operation')
                       COMBO(@s50),AT(111,101,179,10),USE(CL:Locatienaam),DISABLE,DROP(5),FORMAT('200L(2)|M~Lo' & |
  'catienaam~@s50@'),FROM(Queue:FileDropCombo:4),IMM
                       STRING('Locatie:'),AT(19,102),USE(?STRING1)
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

FDCB7                CLASS(FileDropComboClass)             ! File drop combo manager
Q                      &Queue:FileDropCombo           !Reference to browse queue type
SetQueueRecord         PROCEDURE(),DERIVED
ValidateRecord         PROCEDURE(),BYTE,DERIVED
                     END

FDCB8                CLASS(FileDropComboClass)             ! File drop combo manager
Q                      &Queue:FileDropCombo:2         !Reference to browse queue type
                     END

FDCB10               CLASS(FileDropComboClass)             ! File drop combo manager
Q                      &Queue:FileDropCombo:1         !Reference to browse queue type
                     END

FDCB11               CLASS(FileDropComboClass)             ! File drop combo manager
Q                      &Queue:FileDropCombo:3         !Reference to browse queue type
                     END

FDCB12               CLASS(FileDropComboClass)             ! File drop combo manager
Q                      &Queue:FileDropCombo:4         !Reference to browse queue type
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
ControleerVerwijderMutaties ROUTINE
	LOC:VerwijderControle = 1

	CLEAR(Mut:Record)
	Mut:BulkOverboekingID=BOV:BulkOverboekingID
	SET(Mut:Mutatie_FK04, Mut:Mutatie_FK04)
	LOOP
		Access:Mutatie.Next()
		IF ERROR() THEN BREAK.
		IF Mut:BulkOverboekingID<>BOV:BulkOverboekingID THEN BREAK.
		IF Mut:SoortMutatie<>'OIN' THEN CYCLE.
		
		CLEAR(VVPar:Record)
		VVPar:PartijCelID = CLIP(FORMAT(Mut:PartijID, @N05)) & '.' & CLIP(Mut:CelID)
		Access:ViewVoorraadPartij.TryFetch(VVPar:PartijCelID_K)
		IF NOT(ERROR())
			IF VVPar:VoorraadKG - Mut:InslagKG < 0 THEN
				Message('Het verwijderen van de bestaande mutaties is niet mogelijk omdat de voorraad voor partij ' & CLIP(Mut:PartijID) & ' negatief wordt.', |
					'Negatieve voorraad',ICON:Exclamation)
				LOC:VerwijderControle = 0
				BREAK
			END
		ELSE
			Message('Het verwijderen van de bestaande mutaties is niet mogelijk omdat de voorraad voor partij ' & CLIP(Mut:PartijID) & ' negatief wordt.', |
				'Negatieve voorraad',ICON:Exclamation)
			LOC:VerwijderControle = 0
			BREAK
		END
	.
	EXIT
VerwijderMutaties   ROUTINE
	! Verwijderen mutaties
	CLEAR(Mut:Record)
	Mut:BulkOverboekingID=BOV:BulkOverboekingID
	SET(Mut:Mutatie_FK04, Mut:Mutatie_FK04)
	LOOP
		Access:Mutatie.Next()
		IF ERROR() THEN BREAK.
		IF Mut:BulkOverboekingID<>BOV:BulkOverboekingID THEN BREAK.
		
		Access:Mutatie.DeleteRecord(false)
	.
	
	VoorraadClass.BerekenPlanningMutatieGrootte(BOV:PlanningID)
	
	EXIT

ThisWindow.Ask PROCEDURE

  CODE
  CASE SELF.Request                                        ! Configure the action message text
  OF ViewRecord
    ActionMessage = 'View Record'
  OF InsertRecord
    ActionMessage = 'Overboeking toevoegen'
  OF ChangeRecord
    ActionMessage = 'Overboeking wijzigen'
  END
  QuickWindow{PROP:Text} = ActionMessage                   ! Display status message in title bar
  PARENT.Ask


ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('BulkOverboekMutatieWijzigen')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?OK
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.HistoryKey = CtrlH
  SELF.AddHistoryFile(BOV:Record,History::BOV:Record)
  SELF.AddHistoryField(?BOV:MutatieDatumTijd_DATE,10)
  SELF.AddHistoryField(?BOV:MutatieDatumTijd_TIME,11)
  SELF.AddHistoryField(?BOV:AantalKG,7)
  SELF.AddUpdateFile(Access:BulkOverboeking)
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  Relate:ACel.Open                                         ! File ACel used by this procedure, so make sure it's RelationManager is open
  Relate:AMutatie.Open                                     ! File AMutatie used by this procedure, so make sure it's RelationManager is open
  Relate:ARelatie.Open                                     ! File ARelatie used by this procedure, so make sure it's RelationManager is open
  Relate:AViewVoorraadPartij.Open                          ! File AViewVoorraadPartij used by this procedure, so make sure it's RelationManager is open
  Relate:BulkOverboeking.Open                              ! File BulkOverboeking used by this procedure, so make sure it's RelationManager is open
  Relate:Cel.SetOpenRelated()
  Relate:Cel.Open                                          ! File Cel used by this procedure, so make sure it's RelationManager is open
  Relate:Mutatie.Open                                      ! File Mutatie used by this procedure, so make sure it's RelationManager is open
  Relate:Partij.Open                                       ! File Partij used by this procedure, so make sure it's RelationManager is open
  Relate:Relatie.SetOpenRelated()
  Relate:Relatie.Open                                      ! File Relatie used by this procedure, so make sure it's RelationManager is open
  Relate:Verpakking.Open                                   ! File Verpakking used by this procedure, so make sure it's RelationManager is open
  Relate:ViewArtikel.Open                                  ! File ViewArtikel used by this procedure, so make sure it's RelationManager is open
  Relate:ViewVoorraadPlanning.Open                         ! File ViewVoorraadPlanning used by this procedure, so make sure it's RelationManager is open
  Access:Verkoop.UseFile                                   ! File referenced in 'Other Files' so need to inform it's FileManager
  SELF.FilesOpened = True
  SELF.Primary &= Relate:BulkOverboeking
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
  FREE(LOC:OverboekMutaties)
  
  IF Self.Request=ChangeRecord 
  	! Vul de queue met de huidige mutaties
  	CLEAR(Mut:Record)
  	Mut:BulkOverboekingID=BOV:BulkOverboekingID
  	SET(Mut:Mutatie_FK04, Mut:Mutatie_FK04)
  	LOOP
  		Access:Mutatie.Next()
  		IF ERROR() THEN BREAK.
  		IF Mut:BulkOverboekingID<>BOV:BulkOverboekingID THEN BREAK.
  		IF Mut:SoortMutatie = 'OIN' THEN CYCLE.
  		
  		LOM:PartijID = Mut:PartijID
  		
  		CLEAR(Par:Record)
  		Par:PartijID = Mut:PartijID
  		Access:Partij.TryFetch(Par:Partij_PK)
  		
  		CLEAR(Ver:Record)
  		Ver:VerpakkingID=Par:VerpakkingID
  		Access:Verpakking.TryFetch(Ver:Verpakking_PK)
  		
  		CLEAR(Rel:Record)
  		Rel:RelatieID=Par:Leverancier
  		Access:Relatie.TryFetch(Rel:Relatie_PK)
  		
  		LOM:Leverancier = Rel:FirmaNaam
  		LOM:Verpakking = Ver:VerpakkingOmschrijving
  		LOM:Aanmaakdatum_DATE = Par:AanmaakDatum_DATE
  		LOM:Aanmaakdatum_TIME = Par:AanmaakDatum_TIME
  		LOM:KG = Mut:UitslagKG
  		ADD(LOC:OverboekMutaties,-LOM:PartijID)
  	.
  	
  	CLEAR(Ver:Record)
  	Ver:VerpakkingID=BOV:VerpakkingID
  	Access:Verpakking.TryFetch(Ver:Verpakking_PK)
  	
  	LOC:ArtikelID = BOV:ArtikelID
  	LOC:VanCelID = BOV:VanCelID
  	LOC:NaarCelID = BOV:NaarCelID
  	LOC:VerpakkingID = BOV:VerpakkingID
  ELSIF Self.Request=InsertRecord
  	BOV:ArtikelID = PLA:ArtikelID
  	BOV:VerpakkingID = PLA:VerpakkingID
  	BOV:VanCelID = Pla:CelID
  	BOV:NaarCelID = Pla:OverboekingCelID
  	BOV:AantalKG = Pla:KG
  	BOV:PlanningID = Pla:PlanningID
  	BOV:MutatieDatumTijd_DATE = TODAY()
  	BOV:MutatieDatumTijd_TIME = CLOCK()
  .
  WinAlertMouseZoom()
  Do DefineListboxStyle
  IF SELF.Request = ViewRecord                             ! Configure controls for View Only mode
    ?BOV:MutatieDatumTijd_DATE{PROP:ReadOnly} = True
    ?BOV:MutatieDatumTijd_TIME{PROP:ReadOnly} = True
    DISABLE(?VVP:ArtikelOms)
    DISABLE(?CEL:CelOms)
    DISABLE(?ACel:CelOms)
    DISABLE(?Ver:VerpakkingOmschrijving)
    ?BOV:AantalKG{PROP:ReadOnly} = True
    DISABLE(?Cancel:2)
    DISABLE(?CL:Locatienaam)
  END
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('BulkOverboekMutatieWijzigen',QuickWindow)  ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  FDCB7.Init(VVP:ArtikelOms,?VVP:ArtikelOms,Queue:FileDropCombo.ViewPosition,FDCB7::View:FileDropCombo,Queue:FileDropCombo,Relate:ViewArtikel,ThisWindow,GlobalErrors,0,0,0)
  FDCB7.Q &= Queue:FileDropCombo
  FDCB7.AddSortOrder(Art:Artikel_FK01)
  FDCB7.AddField(Art:ArtikelID,FDCB7.Q.Art:ArtikelID) !List box control field - type derived from field
  FDCB7.AddField(Art:ArtikelOms,FDCB7.Q.Art:ArtikelOms) !List box control field - type derived from field
  FDCB7.AddField(LOC:ArtikelVoorraadKG,FDCB7.Q.LOC:ArtikelVoorraadKG) !List box control field - type derived from local data
  FDCB7.AddField(LOC:ArtikelVoorraadPallet,FDCB7.Q.LOC:ArtikelVoorraadPallet) !List box control field - type derived from local data
  FDCB7.AddField(VVP:ArtikelID,FDCB7.Q.VVP:ArtikelID) !Browse hot field - type derived from field
  FDCB7.AddField(VVP:InslagKG,FDCB7.Q.VVP:InslagKG) !Browse hot field - type derived from field
  FDCB7.AddField(VVP:InslagPallets,FDCB7.Q.VVP:InslagPallets) !Browse hot field - type derived from field
  FDCB7.AddField(VVP:UitslagKG,FDCB7.Q.VVP:UitslagKG) !Browse hot field - type derived from field
  FDCB7.AddField(VVP:UitslagPallets,FDCB7.Q.VVP:UitslagPallets) !Browse hot field - type derived from field
  FDCB7.AddUpdateField(Art:ArtikelID,BOV:ArtikelID)
  ThisWindow.AddItem(FDCB7.WindowComponent)
  FDCB7.DefaultFill = 0
  FDCB8.Init(CEL:CelOms,?CEL:CelOms,Queue:FileDropCombo:2.ViewPosition,FDCB8::View:FileDropCombo,Queue:FileDropCombo:2,Relate:Cel,ThisWindow,GlobalErrors,0,1,0)
  FDCB8.Q &= Queue:FileDropCombo:2
  FDCB8.AddSortOrder(CEL:CEL_PK)
  FDCB8.AddField(CEL:CelOms,FDCB8.Q.CEL:CelOms) !List box control field - type derived from field
  FDCB8.AddField(CEL:CelID,FDCB8.Q.CEL:CelID) !Primary key field - type derived from field
  FDCB8.AddUpdateField(CEL:CelID,BOV:NaarCelID)
  ThisWindow.AddItem(FDCB8.WindowComponent)
  FDCB8.DefaultFill = 0
  FDCB10.Init(ACel:CelOms,?ACel:CelOms,Queue:FileDropCombo:1.ViewPosition,FDCB10::View:FileDropCombo,Queue:FileDropCombo:1,Relate:ACel,ThisWindow,GlobalErrors,0,1,0)
  FDCB10.Q &= Queue:FileDropCombo:1
  FDCB10.AddSortOrder(ACel:CEL_PK)
  FDCB10.AddField(ACel:CelOms,FDCB10.Q.ACel:CelOms) !List box control field - type derived from field
  FDCB10.AddField(ACel:CelID,FDCB10.Q.ACel:CelID) !Primary key field - type derived from field
  FDCB10.AddUpdateField(ACel:CelID,BOV:VanCelID)
  ThisWindow.AddItem(FDCB10.WindowComponent)
  FDCB10.DefaultFill = 0
  FDCB11.Init(Ver:VerpakkingOmschrijving,?Ver:VerpakkingOmschrijving,Queue:FileDropCombo:3.ViewPosition,FDCB11::View:FileDropCombo,Queue:FileDropCombo:3,Relate:Verpakking,ThisWindow,GlobalErrors,0,1,0)
  FDCB11.Q &= Queue:FileDropCombo:3
  FDCB11.AddSortOrder(Ver:Verpakking_PK)
  FDCB11.AddField(Ver:VerpakkingOmschrijving,FDCB11.Q.Ver:VerpakkingOmschrijving) !List box control field - type derived from field
  FDCB11.AddUpdateField(Ver:VerpakkingID,BOV:VerpakkingID)
  ThisWindow.AddItem(FDCB11.WindowComponent)
  FDCB11.DefaultFill = 0
  FDCB12.Init(CL:Locatienaam,?CL:Locatienaam,Queue:FileDropCombo:4.ViewPosition,FDCB12::View:FileDropCombo,Queue:FileDropCombo:4,Relate:CelLocatie,ThisWindow,GlobalErrors,0,1,0)
  FDCB12.Q &= Queue:FileDropCombo:4
  FDCB12.AddSortOrder(CL:FK_CelLocatie)
  FDCB12.AddRange(CL:CelID,BOV:NaarCelID)
  FDCB12.AddField(CL:Locatienaam,FDCB12.Q.CL:Locatienaam) !List box control field - type derived from field
  FDCB12.AddField(CL:CelLocatieID,FDCB12.Q.CL:CelLocatieID) !Primary key field - type derived from field
  FDCB12.AddUpdateField(CL:CelLocatieID,BOV:NaarCelLocatieID)
  ThisWindow.AddItem(FDCB12.WindowComponent)
  FDCB12.DefaultFill = 0
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
    Relate:ACel.Close
    Relate:AMutatie.Close
    Relate:ARelatie.Close
    Relate:AViewVoorraadPartij.Close
    Relate:BulkOverboeking.Close
    Relate:Cel.Close
    Relate:Mutatie.Close
    Relate:Partij.Close
    Relate:Relatie.Close
    Relate:Verpakking.Close
    Relate:ViewArtikel.Close
    Relate:ViewVoorraadPlanning.Close
  END
  IF SELF.Opened
    INIMgr.Update('BulkOverboekMutatieWijzigen',QuickWindow) ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.PrimeUpdate PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.PrimeUpdate()
    If returnValue = Level:Fatal  ! delete just occured
      ThisNetRefresh.Send('|BulkOverboeking|ViewArtikel|Cel|ACel|Verpakking|CelLocatie|') ! NetTalk (NetRefresh)
    End
  IF ReturnValue = Level:Fatal  ! delete just occured
  	NetRefreshVoorraadViews()
  	NetRefreshPlanningViews()
  END	
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
    OF ?CEL:CelOms
      If 0{PROP:AcceptAll} = False Then
          If NOT CL:CelID = CEL:CelID Then
              Clear(CL:Locatienaam)
              Clear(BOV:NaarCelLocatieID)
              Display(?CL:Locatienaam)
          End
      End
      
    OF ?Cancel:2
      ThisWindow.Update()
      DO ControleerVerwijderMutaties
      
      IF LOC:VerwijderControle
      	DO VerwijderMutaties
      
      	POST(EVENT:Accepted, ?Cancel)
      .
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
    ThisNetRefresh.Send('|BulkOverboeking|ViewArtikel|Cel|ACel|Verpakking|CelLocatie|') ! NetTalk (NetRefresh)
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


FDCB7.SetQueueRecord PROCEDURE

  CODE
  CLEAR(VVP:Record)
  VVP:ArtikelID=Art:ArtikelID
  VVP:ArtikelOms=Art:ArtikelOms
  Access:ViewVoorraadPlanning.TryFetch(VVP:ViewVoorraad_PK)
  
  LOC:ArtikelVoorraadKG=VVP:InslagKG-VVP:UitslagKG
  LOC:ArtikelVoorraadPallet=VVP:InslagPallets-VVP:UitslagPallets
  PARENT.SetQueueRecord
  


FDCB7.ValidateRecord PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  CLEAR(VVP:Record)
  VVP:ArtikelID=Art:ArtikelID
  VVP:ArtikelOms=Art:ArtikelOms
  Access:ViewVoorraadPlanning.TryFetch(VVP:ViewVoorraad_PK)
  
  LOC:ArtikelVoorraadKG=VVP:InslagKG-VVP:UitslagKG
  LOC:ArtikelVoorraadPallet=VVP:InslagPallets-VVP:UitslagPallets
  
  IF LOC:ArtikelVoorraadKG <= 0 !AND LOC:ArtikelVoorraadPallet <= 0
  !	RETURN Record:Filtered
  .
  ReturnValue = PARENT.ValidateRecord()
  RETURN ReturnValue

!!! <summary>
!!! Generated from procedure template - Window
!!! Form Mutatie
!!! </summary>
BulkOverboekMutatieMaken PROCEDURE 

CurrentTab           STRING(80)                            ! 
ActionMessage        CSTRING(40)                           ! 
LOC:ArtikelVoorraadKG DECIMAL(9,2)                         ! 
LOC:ArtikelVoorraadPallet LONG                             ! 
LOC:OverboekingKG_TMP DECIMAL(9,2)                         ! 
LOC:KG_TMP           DECIMAL(9,2)                          ! 
LOC:ArtikelID        CSTRING(26)                           ! 
LOC:VanCelID         LONG                                  ! 
LOC:NaarCelID        LONG                                  ! 
LOC:VerpakkingID     LONG                                  ! 
LOC:OverboekMutaties QUEUE,PRE(LOM)                        ! 
PartijID             LONG                                  ! 
Leverancier          STRING(50)                            ! 
Verpakking           STRING(50)                            ! 
Aanmaakdatum_DATE    DATE                                  ! 
Aanmaakdatum_TIME    TIME                                  ! 
KG                   DECIMAL(9,2)                          ! 
                     END                                   ! 
FDCB7::View:FileDropCombo VIEW(ViewArtikel)
                       PROJECT(Art:ArtikelID)
                       PROJECT(Art:ArtikelOms)
                     END
FDCB8::View:FileDropCombo VIEW(Cel)
                       PROJECT(CEL:CelOms)
                       PROJECT(CEL:CelID)
                     END
FDCB10::View:FileDropCombo VIEW(ACel)
                       PROJECT(ACel:CelOms)
                       PROJECT(ACel:CelID)
                     END
FDCB11::View:FileDropCombo VIEW(Verpakking)
                       PROJECT(Ver:VerpakkingOmschrijving)
                     END
FDCB13::View:FileDropCombo VIEW(CelLocatie)
                       PROJECT(CL:Locatienaam)
                       PROJECT(CL:CelLocatieID)
                     END
BRW4::View:Browse    VIEW(ViewVoorraadPartij)
                       PROJECT(VVPar:PartijID)
                       PROJECT(VVPar:LeverancierFirmanaam)
                       PROJECT(VVPar:VerpakkingOmschrijving)
                       PROJECT(VVPar:AanmaakDatum_DATE)
                       PROJECT(VVPar:AanmaakDatum_TIME)
                       PROJECT(VVPar:VoorraadKG)
                       PROJECT(VVPar:ArtikelID)
                       PROJECT(VVPar:CelID)
                     END
Queue:Browse         QUEUE                            !Queue declaration for browse/combo box using ?List
VVPar:PartijID         LIKE(VVPar:PartijID)           !List box control field - type derived from field
VVPar:LeverancierFirmanaam LIKE(VVPar:LeverancierFirmanaam) !List box control field - type derived from field
VVPar:VerpakkingOmschrijving LIKE(VVPar:VerpakkingOmschrijving) !List box control field - type derived from field
VVPar:AanmaakDatum_DATE LIKE(VVPar:AanmaakDatum_DATE) !List box control field - type derived from field
VVPar:AanmaakDatum_TIME LIKE(VVPar:AanmaakDatum_TIME) !List box control field - type derived from field
VVPar:VoorraadKG       LIKE(VVPar:VoorraadKG)         !List box control field - type derived from field
VVPar:ArtikelID        LIKE(VVPar:ArtikelID)          !Browse hot field - type derived from field
VVPar:CelID            LIKE(VVPar:CelID)              !Browse hot field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
Queue:FileDropCombo  QUEUE                            !
Art:ArtikelID          LIKE(Art:ArtikelID)            !List box control field - type derived from field
Art:ArtikelOms         LIKE(Art:ArtikelOms)           !List box control field - type derived from field
LOC:ArtikelVoorraadKG  LIKE(LOC:ArtikelVoorraadKG)    !List box control field - type derived from local data
LOC:ArtikelVoorraadPallet LIKE(LOC:ArtikelVoorraadPallet) !List box control field - type derived from local data
VVP:ArtikelID          LIKE(VVP:ArtikelID)            !Browse hot field - type derived from field
VVP:InslagKG           LIKE(VVP:InslagKG)             !Browse hot field - type derived from field
VVP:InslagPallets      LIKE(VVP:InslagPallets)        !Browse hot field - type derived from field
VVP:UitslagKG          LIKE(VVP:UitslagKG)            !Browse hot field - type derived from field
VVP:UitslagPallets     LIKE(VVP:UitslagPallets)       !Browse hot field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
Queue:FileDropCombo:2 QUEUE                           !
CEL:CelOms             LIKE(CEL:CelOms)               !List box control field - type derived from field
CEL:CelID              LIKE(CEL:CelID)                !Primary key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
Queue:FileDropCombo:1 QUEUE                           !
ACel:CelOms            LIKE(ACel:CelOms)              !List box control field - type derived from field
ACel:CelID             LIKE(ACel:CelID)               !Primary key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
Queue:FileDropCombo:3 QUEUE                           !
Ver:VerpakkingOmschrijving LIKE(Ver:VerpakkingOmschrijving) !List box control field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
Queue:FileDropCombo:4 QUEUE                           !
CL:Locatienaam         LIKE(CL:Locatienaam)           !List box control field - type derived from field
CL:CelLocatieID        LIKE(CL:CelLocatieID)          !Primary key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
LocEnableEnterByTab  BYTE(1)                               !Used by the ENTER Instead of Tab template
EnterByTabManager    EnterByTabClass
History::BOV:Record  LIKE(BOV:RECORD),THREAD
NetLocalRefreshDate     Long     ! NetTalk (NetRefresh)
NetLocalRefreshTime     Long
NetLocalDependancies    String('|BulkOverboeking|ViewArtikel|Cel|ACel|Verpakking|CelLocatie|ViewVoorraadPartij|')
QuickWindow          WINDOW('Form Mutatie'),AT(,,557,366),FONT('MS Sans Serif',8,,,CHARSET:DEFAULT),DOUBLE,CENTER, |
  GRAY,IMM,MDI,HLP('UpdateUitslagMutatie'),SYSTEM
                       BUTTON('&OK'),AT(452,348,49,14),USE(?OK),LEFT,ICON('WAOK.ICO'),DEFAULT,FLAT,MSG('Accept dat' & |
  'a and close the window'),TIP('Accept data and close the window')
                       PROMPT('Invoerdatum:'),AT(10,8),USE(?Mut:DatumTijd_DATE:Prompt),TRN
                       ENTRY(@d6-),AT(83,9,64,10),USE(BOV:MutatieDatumTijd_DATE),SKIP
                       PROMPT('Invoertijd:'),AT(169,9),USE(?Mut:DatumTijd_TIME:Prompt),TRN
                       ENTRY(@t7),AT(206,9,56,10),USE(BOV:MutatieDatumTijd_TIME),SKIP
                       PROMPT('Artikel:'),AT(10,25),USE(?PROMPT1)
                       COMBO(@s60),AT(83,27,308,10),USE(VVP:ArtikelOms),HVSCROLL,DROP(25),FORMAT('50L(2)|~Arti' & |
  'kel ID~C(0)@s30@150L(2)|~Omschrijving~C(0)@s60@54R(2)|~KG~C(0)@n12`2@60R(2)|~Pallets' & |
  '~C(0)@n-14.@'),FROM(Queue:FileDropCombo),IMM
                       PROMPT('Naar cel:'),AT(6,198),USE(?PROMPT6)
                       COMBO(@s30),AT(83,197,179,10),USE(CEL:CelOms),DROP(5),FORMAT('110L(2)|M~Cel~C(0)@s50@'),FROM(Queue:FileDropCombo:2), |
  IMM
                       PROMPT('Overboek KG:'),AT(6,226),USE(?Mut:UitslagKG:Prompt)
                       STRING(@s50),AT(177,41,214),USE(Art:ArtikelOms)
                       PROMPT('Van cel:'),AT(10,57),USE(?PROMPT2)
                       COMBO(@s50),AT(83,57,179,10),USE(ACel:CelOms),DROP(5),FORMAT('200L(2)|M~Cel~C(2)@s50@'),FROM(Queue:FileDropCombo:1), |
  IMM
                       COMBO(@s50),AT(83,182,269,10),USE(Ver:VerpakkingOmschrijving),DROP(5),FORMAT('200L(2)|M~' & |
  'Verpakking~C(0)@s50@'),FROM(Queue:FileDropCombo:3),IMM
                       BUTTON('Alle'),AT(358,180),USE(?BUTTON1)
                       PROMPT('Verpakking:'),AT(6,182),USE(?PROMPT3)
                       LIST,AT(83,76,471,100),USE(?List),HVSCROLL,FORMAT('45R(2)|M~Partij-ID~C(0)@n_10@100L(2)' & |
  '|M~Leverancier~C(0)@s50@70L(2)|M~Verpakking~C(0)@s50@[50R(2)|M@d17-@25R(2)|M@t7@]|~A' & |
  'anmaakdatum~[56R(2)|M~Voorraad~C(0)@n-13`2@]|~KG~'),FROM(Queue:Browse),IMM
                       BUTTON('&Cancel'),AT(505,348,49,14),USE(?Cancel),LEFT,ICON('WACANCEL.ICO'),FLAT,MSG('Cancel operation'), |
  TIP('Cancel operation')
                       BUTTON('Bepaal Mutaties'),AT(82,242,57),USE(?BepaalMutaties)
                       LIST,AT(144,242,409,102),USE(?LIST1),HVSCROLL,FORMAT('46R(2)|M~Partij-ID~C(1)@n_10@100L' & |
  '(2)|M~Leverancier~C(0)@s40@70L(2)|M~Verpakking~C(0)@s30@[50R(2)|M@d17-@25R(2)|M@t7@]' & |
  '|~Aanmaakdatum~56R(2)|M~KG~C(0)@n-13`2@'),FROM(LOC:OverboekMutaties)
                       ENTRY(@n-13`2),AT(83,226,65,10),USE(BOV:AantalKG),RIGHT
                       COMBO(@s50),AT(119,210,143,10),USE(CL:Locatienaam),DROP(5),FORMAT('200L(2)|M~Locatienaa' & |
  'm~L(0)@s50@'),FROM(Queue:FileDropCombo:4),IMM
                       STRING('Locatie:'),AT(19,210),USE(?STRING1)
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
Reset                  PROCEDURE(BYTE Force=0),DERIVED
Run                    PROCEDURE(),BYTE,PROC,DERIVED
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED
TakeCompleted          PROCEDURE(),BYTE,PROC,DERIVED
TakeEvent              PROCEDURE(),BYTE,PROC,DERIVED
TakeNewSelection       PROCEDURE(),BYTE,PROC,DERIVED
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED
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

FDCB8                CLASS(FileDropComboClass)             ! File drop combo manager
Q                      &Queue:FileDropCombo:2         !Reference to browse queue type
                     END

FDCB10               CLASS(FileDropComboClass)             ! File drop combo manager
Q                      &Queue:FileDropCombo:1         !Reference to browse queue type
                     END

FDCB11               CLASS(FileDropComboClass)             ! File drop combo manager
Q                      &Queue:FileDropCombo:3         !Reference to browse queue type
                     END

FDCB13               CLASS(FileDropComboClass)             ! File drop combo manager
Q                      &Queue:FileDropCombo:4         !Reference to browse queue type
                     END

BRW4                 CLASS(BrowseClass)                    ! Browse using ?List
Q                      &Queue:Browse                  !Reference to browse queue
                     END

BRW4::Sort0:Locator  StepLocatorClass                      ! Default Locator
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
    ActionMessage = 'Overboeking toevoegen'
  OF ChangeRecord
    ActionMessage = 'Overboeking wijzigen'
  END
  QuickWindow{PROP:Text} = ActionMessage                   ! Display status message in title bar
  PARENT.Ask


ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('BulkOverboekMutatieMaken')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?OK
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.HistoryKey = CtrlH
  SELF.AddHistoryFile(BOV:Record,History::BOV:Record)
  SELF.AddHistoryField(?BOV:MutatieDatumTijd_DATE,10)
  SELF.AddHistoryField(?BOV:MutatieDatumTijd_TIME,11)
  SELF.AddHistoryField(?BOV:AantalKG,7)
  SELF.AddUpdateFile(Access:BulkOverboeking)
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  Relate:ACel.Open                                         ! File ACel used by this procedure, so make sure it's RelationManager is open
  Relate:ACelLocatie.Open                                  ! File ACelLocatie used by this procedure, so make sure it's RelationManager is open
  Relate:AMutatie.Open                                     ! File AMutatie used by this procedure, so make sure it's RelationManager is open
  Relate:ARelatie.Open                                     ! File ARelatie used by this procedure, so make sure it's RelationManager is open
  Relate:AViewVoorraadPartij.Open                          ! File AViewVoorraadPartij used by this procedure, so make sure it's RelationManager is open
  Relate:BulkOverboeking.Open                              ! File BulkOverboeking used by this procedure, so make sure it's RelationManager is open
  Relate:Cel.SetOpenRelated()
  Relate:Cel.Open                                          ! File Cel used by this procedure, so make sure it's RelationManager is open
  Relate:Mutatie.Open                                      ! File Mutatie used by this procedure, so make sure it's RelationManager is open
  Relate:Partij.Open                                       ! File Partij used by this procedure, so make sure it's RelationManager is open
  Relate:Relatie.SetOpenRelated()
  Relate:Relatie.Open                                      ! File Relatie used by this procedure, so make sure it's RelationManager is open
  Relate:Verpakking.Open                                   ! File Verpakking used by this procedure, so make sure it's RelationManager is open
  Relate:ViewArtikel.Open                                  ! File ViewArtikel used by this procedure, so make sure it's RelationManager is open
  Relate:ViewVoorraadPartij.Open                           ! File ViewVoorraadPartij used by this procedure, so make sure it's RelationManager is open
  Relate:ViewVoorraadPlanning.Open                         ! File ViewVoorraadPlanning used by this procedure, so make sure it's RelationManager is open
  Access:Verkoop.UseFile                                   ! File referenced in 'Other Files' so need to inform it's FileManager
  SELF.FilesOpened = True
  SELF.Primary &= Relate:BulkOverboeking
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
  BRW4.Init(?List,Queue:Browse.ViewPosition,BRW4::View:Browse,Queue:Browse,Relate:ViewVoorraadPartij,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  FREE(LOC:OverboekMutaties)
  
  IF Self.Request=ChangeRecord 
  	! Vul de queue met de huidige mutaties
  	CLEAR(Mut:Record)
  	Mut:BulkOverboekingID=BOV:BulkOverboekingID
  	SET(Mut:Mutatie_FK04, Mut:Mutatie_FK04)
  	LOOP
  		Access:Mutatie.Next()
  		IF ERROR() THEN BREAK.
  		IF Mut:BulkOverboekingID<>BOV:BulkOverboekingID THEN BREAK.
  		IF Mut:SoortMutatie = 'OIN' THEN CYCLE.
  		
  		LOM:PartijID = Mut:PartijID
  		
  		CLEAR(Par:Record)
  		Par:PartijID = Mut:PartijID
  		Access:Partij.TryFetch(Par:Partij_PK)
  		
  		CLEAR(Ver:Record)
  		Ver:VerpakkingID=Par:VerpakkingID
  		Access:Verpakking.TryFetch(Ver:Verpakking_PK)
  		
  		CLEAR(Rel:Record)
  		Rel:RelatieID=Par:Leverancier
  		Access:Relatie.TryFetch(Rel:Relatie_PK)
  		
  		LOM:Leverancier = Rel:FirmaNaam
  		LOM:Verpakking = Ver:VerpakkingOmschrijving
  		LOM:Aanmaakdatum_DATE = Mut:DatumTijd_DATE
  		LOM:Aanmaakdatum_TIME = Mut:DatumTijd_TIME
  		LOM:KG = Mut:UitslagKG
  		ADD(LOC:OverboekMutaties,-LOM:PartijID)
  	.
  	
  	LOC:ArtikelID = BOV:ArtikelID
  	LOC:VanCelID = BOV:VanCelID
  	LOC:NaarCelID = BOV:NaarCelID
  	LOC:VerpakkingID = BOV:VerpakkingID
  ELSIF Self.Request=InsertRecord
  	BOV:ArtikelID = PLA:ArtikelID
  	BOV:VerpakkingID = PLA:VerpakkingID
  	BOV:VanCelID = Pla:CelID
  	BOV:NaarCelID = Pla:OverboekingCelID
  	BOV:NaarCelLocatieID = Pla:CelLocatieID
  	BOV:AantalKG = Pla:KG
  	BOV:PlanningID = Pla:PlanningID
  	BOV:MutatieDatumTijd_DATE = TODAY()
  	BOV:MutatieDatumTijd_TIME = CLOCK()
  .
  
  
  WinAlertMouseZoom()
  Do DefineListboxStyle
  IF SELF.Request = ViewRecord                             ! Configure controls for View Only mode
    ?BOV:MutatieDatumTijd_DATE{PROP:ReadOnly} = True
    ?BOV:MutatieDatumTijd_TIME{PROP:ReadOnly} = True
    DISABLE(?VVP:ArtikelOms)
    DISABLE(?CEL:CelOms)
    DISABLE(?ACel:CelOms)
    DISABLE(?Ver:VerpakkingOmschrijving)
    DISABLE(?BUTTON1)
    DISABLE(?BepaalMutaties)
    ?BOV:AantalKG{PROP:ReadOnly} = True
    DISABLE(?CL:Locatienaam)
  END
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  BRW4.Q &= Queue:Browse
  BRW4.AddSortOrder(,VVPar:ArtikelID_PartijID_CelID_K)     ! Add the sort order for VVPar:ArtikelID_PartijID_CelID_K for sort order 1
  BRW4.AddLocator(BRW4::Sort0:Locator)                     ! Browse has a locator for sort order 1
  BRW4::Sort0:Locator.Init(,VVPar:ArtikelID,1,BRW4)        ! Initialize the browse locator using  using key: VVPar:ArtikelID_PartijID_CelID_K , VVPar:ArtikelID
  BRW4.SetFilter('(VVPar:ArtikelID=BOV:ArtikelID AND VVPar:CelID=BOV:VanCelID)') ! Apply filter expression to browse
  BRW4.AddField(VVPar:PartijID,BRW4.Q.VVPar:PartijID)      ! Field VVPar:PartijID is a hot field or requires assignment from browse
  BRW4.AddField(VVPar:LeverancierFirmanaam,BRW4.Q.VVPar:LeverancierFirmanaam) ! Field VVPar:LeverancierFirmanaam is a hot field or requires assignment from browse
  BRW4.AddField(VVPar:VerpakkingOmschrijving,BRW4.Q.VVPar:VerpakkingOmschrijving) ! Field VVPar:VerpakkingOmschrijving is a hot field or requires assignment from browse
  BRW4.AddField(VVPar:AanmaakDatum_DATE,BRW4.Q.VVPar:AanmaakDatum_DATE) ! Field VVPar:AanmaakDatum_DATE is a hot field or requires assignment from browse
  BRW4.AddField(VVPar:AanmaakDatum_TIME,BRW4.Q.VVPar:AanmaakDatum_TIME) ! Field VVPar:AanmaakDatum_TIME is a hot field or requires assignment from browse
  BRW4.AddField(VVPar:VoorraadKG,BRW4.Q.VVPar:VoorraadKG)  ! Field VVPar:VoorraadKG is a hot field or requires assignment from browse
  BRW4.AddField(VVPar:ArtikelID,BRW4.Q.VVPar:ArtikelID)    ! Field VVPar:ArtikelID is a hot field or requires assignment from browse
  BRW4.AddField(VVPar:CelID,BRW4.Q.VVPar:CelID)            ! Field VVPar:CelID is a hot field or requires assignment from browse
  INIMgr.Fetch('BulkOverboekMutatieMaken',QuickWindow)     ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  FDCB7.Init(VVP:ArtikelOms,?VVP:ArtikelOms,Queue:FileDropCombo.ViewPosition,FDCB7::View:FileDropCombo,Queue:FileDropCombo,Relate:ViewArtikel,ThisWindow,GlobalErrors,0,0,0)
  FDCB7.Q &= Queue:FileDropCombo
  FDCB7.AddSortOrder(Art:Artikel_PK)
  FDCB7.AddField(Art:ArtikelID,FDCB7.Q.Art:ArtikelID) !List box control field - type derived from field
  FDCB7.AddField(Art:ArtikelOms,FDCB7.Q.Art:ArtikelOms) !List box control field - type derived from field
  FDCB7.AddField(LOC:ArtikelVoorraadKG,FDCB7.Q.LOC:ArtikelVoorraadKG) !List box control field - type derived from local data
  FDCB7.AddField(LOC:ArtikelVoorraadPallet,FDCB7.Q.LOC:ArtikelVoorraadPallet) !List box control field - type derived from local data
  FDCB7.AddField(VVP:ArtikelID,FDCB7.Q.VVP:ArtikelID) !Browse hot field - type derived from field
  FDCB7.AddField(VVP:InslagKG,FDCB7.Q.VVP:InslagKG) !Browse hot field - type derived from field
  FDCB7.AddField(VVP:InslagPallets,FDCB7.Q.VVP:InslagPallets) !Browse hot field - type derived from field
  FDCB7.AddField(VVP:UitslagKG,FDCB7.Q.VVP:UitslagKG) !Browse hot field - type derived from field
  FDCB7.AddField(VVP:UitslagPallets,FDCB7.Q.VVP:UitslagPallets) !Browse hot field - type derived from field
  FDCB7.AddUpdateField(Art:ArtikelID,BOV:ArtikelID)
  ThisWindow.AddItem(FDCB7.WindowComponent)
  FDCB7.DefaultFill = 0
  FDCB8.Init(CEL:CelOms,?CEL:CelOms,Queue:FileDropCombo:2.ViewPosition,FDCB8::View:FileDropCombo,Queue:FileDropCombo:2,Relate:Cel,ThisWindow,GlobalErrors,0,1,0)
  FDCB8.Q &= Queue:FileDropCombo:2
  FDCB8.AddSortOrder(CEL:CEL_PK)
  FDCB8.AddField(CEL:CelOms,FDCB8.Q.CEL:CelOms) !List box control field - type derived from field
  FDCB8.AddField(CEL:CelID,FDCB8.Q.CEL:CelID) !Primary key field - type derived from field
  FDCB8.AddUpdateField(CEL:CelID,BOV:NaarCelID)
  ThisWindow.AddItem(FDCB8.WindowComponent)
  FDCB8.DefaultFill = 0
  FDCB10.Init(ACel:CelOms,?ACel:CelOms,Queue:FileDropCombo:1.ViewPosition,FDCB10::View:FileDropCombo,Queue:FileDropCombo:1,Relate:ACel,ThisWindow,GlobalErrors,0,1,0)
  FDCB10.Q &= Queue:FileDropCombo:1
  FDCB10.AddSortOrder(ACel:CEL_PK)
  FDCB10.AddField(ACel:CelOms,FDCB10.Q.ACel:CelOms) !List box control field - type derived from field
  FDCB10.AddField(ACel:CelID,FDCB10.Q.ACel:CelID) !Primary key field - type derived from field
  FDCB10.AddUpdateField(ACel:CelID,BOV:VanCelID)
  ThisWindow.AddItem(FDCB10.WindowComponent)
  FDCB10.DefaultFill = 0
  FDCB11.Init(Ver:VerpakkingOmschrijving,?Ver:VerpakkingOmschrijving,Queue:FileDropCombo:3.ViewPosition,FDCB11::View:FileDropCombo,Queue:FileDropCombo:3,Relate:Verpakking,ThisWindow,GlobalErrors,0,1,0)
  FDCB11.Q &= Queue:FileDropCombo:3
  FDCB11.AddSortOrder(Ver:Verpakking_PK)
  FDCB11.AddField(Ver:VerpakkingOmschrijving,FDCB11.Q.Ver:VerpakkingOmschrijving) !List box control field - type derived from field
  FDCB11.AddUpdateField(Ver:VerpakkingID,BOV:VerpakkingID)
  ThisWindow.AddItem(FDCB11.WindowComponent)
  FDCB11.DefaultFill = 0
  FDCB13.Init(CL:Locatienaam,?CL:Locatienaam,Queue:FileDropCombo:4.ViewPosition,FDCB13::View:FileDropCombo,Queue:FileDropCombo:4,Relate:CelLocatie,ThisWindow,GlobalErrors,0,1,0)
  FDCB13.Q &= Queue:FileDropCombo:4
  FDCB13.AddSortOrder(CL:FK_CelLocatie)
  FDCB13.AddRange(CL:CelID,BOV:NaarCelID)
  FDCB13.AddField(CL:Locatienaam,FDCB13.Q.CL:Locatienaam) !List box control field - type derived from field
  FDCB13.AddField(CL:CelLocatieID,FDCB13.Q.CL:CelLocatieID) !Primary key field - type derived from field
  FDCB13.AddUpdateField(CL:CelLocatieID,BOV:NaarCelLocatieID)
  ThisWindow.AddItem(FDCB13.WindowComponent)
  FDCB13.DefaultFill = 0
  BRW4.AddToolbarTarget(Toolbar)                           ! Browse accepts toolbar control
  SELF.SetAlerts()
  NetLocalRefreshDate = today()         ! NetTalk (NetRefresh)
  NetLocalRefreshTime = clock()
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
    Relate:ACel.Close
    Relate:ACelLocatie.Close
    Relate:AMutatie.Close
    Relate:ARelatie.Close
    Relate:AViewVoorraadPartij.Close
    Relate:BulkOverboeking.Close
    Relate:Cel.Close
    Relate:Mutatie.Close
    Relate:Partij.Close
    Relate:Relatie.Close
    Relate:Verpakking.Close
    Relate:ViewArtikel.Close
    Relate:ViewVoorraadPartij.Close
    Relate:ViewVoorraadPlanning.Close
  END
  IF SELF.Opened
    INIMgr.Update('BulkOverboekMutatieMaken',QuickWindow)  ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.PrimeUpdate PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.PrimeUpdate()
    If returnValue = Level:Fatal  ! delete just occured
      ThisNetRefresh.Send('|BulkOverboeking|ViewArtikel|Cel|ACel|Verpakking|CelLocatie|ViewVoorraadPartij|') ! NetTalk (NetRefresh)
    End
  !IF ReturnValue = Level:Fatal  ! delete just occured
  !	NetRefreshVoorraadViews()
  !	NetRefreshPlanningViews()
  !END	
  RETURN ReturnValue


ThisWindow.Reset PROCEDURE(BYTE Force=0)

  CODE
  SELF.ForcedReset += Force
  IF QuickWindow{Prop:AcceptAll} THEN RETURN.
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
    OF ?VVP:ArtikelOms
      BRW4.ResetQueue(0)
    OF ?CEL:CelOms
      If 0{PROP:AcceptAll} = False Then
          If NOT CL:CelID = CEL:CelID Then
              Clear(CL:Locatienaam)
              Clear(BOV:NaarCelID)
              Display(?CL:Locatienaam)
          End
      End
      
    OF ?ACel:CelOms
      BRW4.ResetQueue(True)
    OF ?BUTTON1
      ThisWindow.Update()
      BOV:VerpakkingID = 0
      CLEAR(Ver:RECORD)
      DISPLAY(Ver:VerpakkingOmschrijving)
    OF ?BepaalMutaties
      ThisWindow.Update()
      IF BOV:ArtikelID = '' THEN
      	SELECT(?Art:ArtikelOms)
      	RETURN Level:Notify
      .
      
      IF BOV:VanCelID = 0 THEN
      	Select(?CEL:CelOms)
      	RETURN Level:Notify
      .
      
      IF BOV:NaarCelID = 0 THEN
      	Select(?ACEL:CelOms)
      	RETURN Level:Notify
      .
      
      IF BOV:VanCelID = BOV:NaarCELID THEN
      	MESSAGE('Overboeking tussen dezelfde cel')
      	Select(?CEL:CelOms)
      	RETURN Level:Notify
      .
      
      IF NOT(BOV:AantalKG > 0) THEN
      	MESSAGE('Er is geen overboeking opgegeven.')
      	Select(?BOV:AantalKG)
      	RETURN Level:Notify
      .
      
      LOC:OverboekingKG_TMP=BOV:AantalKG
      FREE(LOC:OverboekMutaties)
      
      CLEAR(AVVPar:Record)
      AVVPar:ArtikelID=BOV:ArtikelID
      AVVPar:CelID=BOV:VanCelID
      SET(AVVPar:ArtikelID_CelID_PartijID_K,AVVPar:ArtikelID_CelID_PartijID_K)
      LOOP
      	Access:AViewVoorraadPartij.Next()
      	IF ERROR() THEN BREAK.
      	IF AVVPar:ArtikelID<>BOV:ArtikelID OR AVVPar:CelID<>BOV:VanCelID THEN BREAK.
      	IF BOV:VerpakkingID<>0 AND AVVPar:VerpakkingID <> BOV:VerpakkingID THEN CYCLE.
      	
      	LOM:PartijID=AVVPar:PartijID
      	LOM:Leverancier=AVVPar:LeverancierFirmanaam
      	LOM:Verpakking=AVVPar:VerpakkingOmschrijving
      	LOM:Aanmaakdatum_DATE=AVVPar:AanmaakDatum_DATE
      	LOM:Aanmaakdatum_TIME=AVVPar:AanmaakDatum_TIME
      	IF LOC:OverboekingKG_TMP >= AVVPar:VoorraadKG
      		LOM:KG=AVVPar:VoorraadKG
      		LOC:OverboekingKG_TMP-=AVVPar:VoorraadKG
      	ELSE
      		LOM:KG=LOC:OverboekingKG_TMP
      		LOC:OverboekingKG_TMP=0
      	.
      	ADD(LOC:OverboekMutaties,-LOM:PartijID)
      	IF LOC:OverboekingKG_TMP = 0 THEN BREAK.
      .
      
      IF (LOC:OverboekingKG_TMP > 0) THEN
      	MESSAGE('Er ontbreekt ' & CLIP(LEFT(FORMAT(LOC:OverboekingKG_TMP,@n-13`2))) & ' KG voorraad')
      	SELECT(?BOV:AantalKG)
      .
      
      LOC:ArtikelID = BOV:ArtikelID
      LOC:VanCelID = BOV:VanCelID
      LOC:NaarCelID = BOV:NaarCelID
      LOC:VerpakkingID = BOV:VerpakkingID
      
      DISPLAY(?LIST1)
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
  IF CLIP(BOV:ArtikelID) = '' THEN
  	Select(?Art:ArtikelOms)
  	RETURN Level:Notify
  .
  
  IF BOV:VanCelID = BOV:NaarCELID THEN
  	MESSAGE('Overboeking tussen dezelfde cel.')
  	Select(?CEL:CelOms)
  	RETURN Level:Notify
  .
  
  IF NOT(BOV:AantalKG > 0) THEN
  	MESSAGE('Er is geen voorraad die overgeboekt moet worden.')
  	Select(?BOV:AantalKG)
  	RETURN Level:Notify
  .
  
  IF RECORDS(LOC:OverboekMutaties) = 0 THEN
  	MESSAGE('Er zijn nog geen mutaties bepaald.')
  	Select(?BepaalMutaties)
  	RETURN Level:Notify
  .
  
  IF CLIP(LOC:ArtikelID) <> CLIP(BOV:ArtikelID) OR LOC:VanCelID <> BOV:VanCelID OR LOC:NaarCelID <> BOV:NaarCelID OR LOC:VerpakkingID <> BOV:VerpakkingID THEN
  	MESSAGE('Het artikel, de verpakking en/of de cellen van de bulk-overboeking zijn gewijzigd, daarvoor zijn nog geen mutaties bepaald.')
  	Select(?BepaalMutaties)
  	RETURN Level:Notify
  .
  
  IF LOC:OverboekingKG_TMP <> 0 THEN
  	MESSAGE('Er is ' & CLIP(LEFT(FORMAT(LOC:OverboekingKG_TMP, @n-13`2))) & ' kg te weinig voorraad.')
  	SELECT(?BOV:AantalKG)
  	RETURN Level:Notify
  .
  
  CLEAR(ACL:Record)
  ACL:CelLocatieID=BOV:NaarCelLocatieID
  Access:ACelLocatie.TryFetch(ACL:PK_CelLocatie)
  IF ACL:CelID<>BOV:NaarCelID THEN BOV:NaarCelLocatieID = 0.
  
  ! Controleer of de mutaties nog mogelijk zijn
  changed# = 0
  
  LOOP i# = 1 TO RECORDS(LOC:OverboekMutaties)
  	GET(LOC:OverboekMutaties, i#)
  	
  	AVVPar:ArtikelID=BOV:ArtikelID
  	AVVPar:PartijID=LOM:PartijID
  	AVVPar:CelID=BOV:VanCelID
  	SET(AVVPar:ArtikelID_PartijID_CelID_K, AVVPar:ArtikelID_PartijID_CelID_K)
  	LOOP
  		Access:AViewVoorraadPartij.Next()
  		IF ERROR() THEN
  			LOC:KG_TMP = 0
  		ELSE
  			IF AVVPar:ArtikelID<>BOV:ArtikelID OR AVVPar:PartijID<>LOM:PartijID OR AVVPar:CelID<>BOV:VanCelID THEN
  				LOC:KG_TMP = 0
  			ELSE
  				LOC:KG_TMP = AVVPar:VoorraadKG
  			.
  		.
  		
  		IF LOC:KG_TMP<LOM:KG THEN changed# = 1.
  			
  		BREAK
  	.
  	
  	IF changed# THEN BREAK.
  .
  
  IF changed# THEN
  	MESSAGE('De voorraad is gewijzigd waardoor de bepaalde mutaties niet meer mogelijk zijn. Bepaal deze opnieuw.')
  	SELECT(?BepaalMutaties)
  	RETURN(Level:Notify)
  .
  ReturnValue = PARENT.TakeCompleted()
  	! Verwijderen mutaties
  	CLEAR(Mut:Record)
  	Mut:BulkOverboekingID=BOV:BulkOverboekingID
  	SET(Mut:Mutatie_FK04, Mut:Mutatie_FK04)
  	LOOP
  		Access:Mutatie.Next()
  		IF ERROR() THEN BREAK.
  		IF Mut:BulkOverboekingID<>BOV:BulkOverboekingID THEN BREAK.
  		
  		Access:Mutatie.DeleteRecord(false)
  	.
    ThisNetRefresh.Send('|BulkOverboeking|ViewArtikel|Cel|ACel|Verpakking|CelLocatie|ViewVoorraadPartij|') ! NetTalk (NetRefresh)
  ! Aanmaken mutaties
  LOOP i# = 1 TO RECORDS(LOC:OverboekMutaties)
  	GET(LOC:OverboekMutaties, i#)
  	
  	Access:Mutatie.PrimeRecord()
  	Mut:ArtikelID=BOV:ArtikelID
  	Mut:DatumTijd_DATE=BOV:MutatieDatumTijd_DATE
  	Mut:DatumTijd_TIME=BOV:MutatieDatumTijd_TIME
  	Mut:PartijID=LOM:PartijID
  	Mut:CelID=BOV:VanCelID
  	Mut:InslagKG=0
  	Mut:InslagPallet=0
  	Mut:UitslagKG=LOM:KG
  	Mut:UitslagPallet=0
  	Mut:SoortMutatie='OUIT'
  	Mut:NaarCELID=BOV:NaarCelID
  	Mut:CelLocatieID=0
  	Mut:RedenAfboeking=''
  	Mut:ArtikelID=BOV:ArtikelID
  	Mut:PlanningID=BOV:PlanningID
  	Mut:BulkOverboekingID=BOV:BulkOverboekingID
  	Access:Mutatie.Insert()
  	
  	Access:Mutatie.PrimeRecord()
  	Mut:ArtikelID=BOV:ArtikelID
  	Mut:DatumTijd_DATE=BOV:MutatieDatumTijd_DATE
  	Mut:DatumTijd_TIME=BOV:MutatieDatumTijd_TIME
  	Mut:PartijID=LOM:PartijID
  	Mut:CelID=BOV:NaarCelID
  	Mut:InslagKG=LOM:KG
  	Mut:InslagPallet=0
  	Mut:UitslagKG=0
  	Mut:UitslagPallet=0
  	Mut:SoortMutatie='OIN'
  	Mut:NaarCELID=BOV:VanCelID
  	Mut:CelLocatieID=BOV:NaarCelLocatieID
  	Mut:RedenAfboeking=''
  	Mut:ArtikelID=BOV:ArtikelID
  	Mut:PlanningID=BOV:PlanningID
  	Mut:BulkOverboekingID=BOV:BulkOverboekingID
  	Access:Mutatie.Insert()
  .
  
  VoorraadClass.BerekenPlanningMutatieGrootte(BOV:PlanningID)
  	!NetRefreshVoorraadViews()
  	!NetRefreshPlanningViews()
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
    OF ?VVP:ArtikelOms
      BRW4.ResetQueue(0)
    OF ?ACel:CelOms
      BRW4.ResetQueue(True)
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


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window


FDCB7.SetQueueRecord PROCEDURE

  CODE
  CLEAR(VVP:Record)
  VVP:ArtikelID=Art:ArtikelID
  VVP:ArtikelOms=Art:ArtikelOms
  Access:ViewVoorraadPlanning.TryFetch(VVP:ViewVoorraad_PK)
  
  LOC:ArtikelVoorraadKG=VVP:InslagKG-VVP:UitslagKG
  LOC:ArtikelVoorraadPallet=VVP:InslagPallets-VVP:UitslagPallets
  PARENT.SetQueueRecord
  


FDCB7.ValidateRecord PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  CLEAR(VVP:Record)
  VVP:ArtikelID=Art:ArtikelID
  VVP:ArtikelOms=Art:ArtikelOms
  Access:ViewVoorraadPlanning.TryFetch(VVP:ViewVoorraad_PK)
  
  LOC:ArtikelVoorraadKG=VVP:InslagKG-VVP:UitslagKG
  LOC:ArtikelVoorraadPallet=VVP:InslagPallets-VVP:UitslagPallets
  
  !IF LOC:ArtikelVoorraadKG <= 0 !AND LOC:ArtikelVoorraadPallet <= 0
  !	RETURN Record:Filtered
  !.
  ReturnValue = PARENT.ValidateRecord()
  RETURN ReturnValue

!!! <summary>
!!! Generated from procedure template - Window
!!! Form OverboekingRit
!!! </summary>
UpdateTransfers PROCEDURE (PRM:Datum)

CurrentTab           STRING(80)                            ! 
ActionMessage        CSTRING(40)                           ! 
LOC:Datum            DATE                                  ! 
LOC:DatumVanSQL      LONG                                  ! 
LOC:DatumTMSQL       LONG                                  ! 
LOC:Planning_TIME    TIME                                  ! 
LOC:Planning_DATE    DATE                                  ! 
LOC:PlanningSoort    STRING(3)                             ! 
LOC:Getransferd      BYTE                                  ! 
BRW4::View:Browse    VIEW(OverboekingRitRegel)
                       PROJECT(ORR:OverboekingRitRegelID)
                       PROJECT(ORR:OverboekingRitID)
                       PROJECT(ORR:PlanningID)
                       JOIN(Pla:PK_Planning,ORR:PlanningID)
                         PROJECT(Pla:ArtikelID)
                         PROJECT(Pla:KG)
                         PROJECT(Pla:Pallets)
                         PROJECT(Pla:MutatieGemaakt)
                         PROJECT(Pla:PartijID)
                         PROJECT(Pla:Transport)
                         PROJECT(Pla:Instructie)
                         PROJECT(Pla:OverboekingCelID)
                         PROJECT(Pla:Planning_DATE)
                         PROJECT(Pla:Planning_TIME)
                         PROJECT(Pla:PlanningID)
                         PROJECT(Pla:CelID)
                         PROJECT(Pla:InkoopID)
                         JOIN(CEL:CEL_PK,Pla:CelID)
                           PROJECT(CEL:CelOms)
                           PROJECT(CEL:CelID)
                         END
                         JOIN(ACel:CEL_PK,Pla:OverboekingCelID)
                           PROJECT(ACel:CelOms)
                           PROJECT(ACel:CelID)
                         END
                         JOIN(Par:Partij_PK,Pla:PartijID)
                           PROJECT(Par:ExternPartijnr)
                           PROJECT(Par:PartijID)
                         END
                         JOIN(AAArt:Artikel_PK,Pla:ArtikelID)
                           PROJECT(AAArt:ArtikelOms)
                           PROJECT(AAArt:ArtikelID)
                         END
                         JOIN(AInk:PK_Inkoop,Pla:InkoopID)
                           PROJECT(AInk:Planning_DATE)
                           PROJECT(AInk:Planning_TIME)
                           PROJECT(AInk:InkoopID)
                         END
                       END
                     END
Queue:Browse         QUEUE                            !Queue declaration for browse/combo box using ?List
Pla:ArtikelID          LIKE(Pla:ArtikelID)            !List box control field - type derived from field
AAArt:ArtikelOms       LIKE(AAArt:ArtikelOms)         !List box control field - type derived from field
LOC:Planning_DATE      LIKE(LOC:Planning_DATE)        !List box control field - type derived from local data
LOC:Planning_TIME      LIKE(LOC:Planning_TIME)        !List box control field - type derived from local data
LOC:PlanningSoort      LIKE(LOC:PlanningSoort)        !List box control field - type derived from local data
Pla:KG                 LIKE(Pla:KG)                   !List box control field - type derived from field
Pla:Pallets            LIKE(Pla:Pallets)              !List box control field - type derived from field
Pla:MutatieGemaakt     LIKE(Pla:MutatieGemaakt)       !List box control field - type derived from field
Pla:MutatieGemaakt_Icon LONG                          !Entry's icon ID
CEL:CelOms             LIKE(CEL:CelOms)               !List box control field - type derived from field
ACel:CelOms            LIKE(ACel:CelOms)              !List box control field - type derived from field
Pla:PartijID           LIKE(Pla:PartijID)             !List box control field - type derived from field
Par:ExternPartijnr     LIKE(Par:ExternPartijnr)       !List box control field - type derived from field
Pla:Transport          LIKE(Pla:Transport)            !List box control field - type derived from field
Pla:Instructie         LIKE(Pla:Instructie)           !List box control field - type derived from field
Pla:OverboekingCelID   LIKE(Pla:OverboekingCelID)     !Browse hot field - type derived from field
Pla:Planning_DATE      LIKE(Pla:Planning_DATE)        !Browse hot field - type derived from field
Pla:Planning_TIME      LIKE(Pla:Planning_TIME)        !Browse hot field - type derived from field
AInk:Planning_DATE     LIKE(AInk:Planning_DATE)       !Browse hot field - type derived from field
AInk:Planning_TIME     LIKE(AInk:Planning_TIME)       !Browse hot field - type derived from field
ORR:OverboekingRitRegelID LIKE(ORR:OverboekingRitRegelID) !Browse hot field - type derived from field
ORR:OverboekingRitID   LIKE(ORR:OverboekingRitID)     !Browse key field - type derived from field
Pla:PlanningID         LIKE(Pla:PlanningID)           !Related join file key field - type derived from field
CEL:CelID              LIKE(CEL:CelID)                !Related join file key field - type derived from field
ACel:CelID             LIKE(ACel:CelID)               !Related join file key field - type derived from field
Par:PartijID           LIKE(Par:PartijID)             !Related join file key field - type derived from field
AAArt:ArtikelID        LIKE(AAArt:ArtikelID)          !Related join file key field - type derived from field
AInk:InkoopID          LIKE(AInk:InkoopID)            !Related join file key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
BRW8::View:Browse    VIEW(APlanning)
                       PROJECT(APla:ArtikelID)
                       PROJECT(APla:Planning_DATE)
                       PROJECT(APla:Planning_TIME)
                       PROJECT(APla:KG)
                       PROJECT(APla:Pallets)
                       PROJECT(APla:MutatieGemaakt)
                       PROJECT(APla:PartijID)
                       PROJECT(APla:Transport)
                       PROJECT(APla:Instructie)
                       PROJECT(APla:PlanningID)
                       PROJECT(APla:Planning)
                       PROJECT(APla:OverboekingCelID)
                       PROJECT(APla:InkoopID)
                       PROJECT(APla:CelID)
                       JOIN(AArt:Artikel_PK,APla:ArtikelID)
                         PROJECT(AArt:ArtikelOms)
                         PROJECT(AArt:ArtikelID)
                       END
                       JOIN(APar:Partij_PK,APla:PartijID)
                         PROJECT(APar:ExternPartijnr)
                         PROJECT(APar:PartijID)
                       END
                       JOIN(AACel:CEL_PK,APla:CelID)
                         PROJECT(AACel:CelOms)
                       END
                       JOIN(AAACel:CEL_PK,APla:CelID)
                         PROJECT(AAACel:CelOms)
                       END
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?List:2
APla:ArtikelID         LIKE(APla:ArtikelID)           !List box control field - type derived from field
AArt:ArtikelOms        LIKE(AArt:ArtikelOms)          !List box control field - type derived from field
APla:Planning_DATE     LIKE(APla:Planning_DATE)       !List box control field - type derived from field
APla:Planning_TIME     LIKE(APla:Planning_TIME)       !List box control field - type derived from field
APla:KG                LIKE(APla:KG)                  !List box control field - type derived from field
APla:Pallets           LIKE(APla:Pallets)             !List box control field - type derived from field
LOC:Getransferd        LIKE(LOC:Getransferd)          !List box control field - type derived from local data
LOC:Getransferd_Icon   LONG                           !Entry's icon ID
APla:MutatieGemaakt    LIKE(APla:MutatieGemaakt)      !List box control field - type derived from field
APla:MutatieGemaakt_Icon LONG                         !Entry's icon ID
AACel:CelOms           LIKE(AACel:CelOms)             !List box control field - type derived from field
AAACel:CelOms          LIKE(AAACel:CelOms)            !List box control field - type derived from field
APla:PartijID          LIKE(APla:PartijID)            !List box control field - type derived from field
APar:ExternPartijnr    LIKE(APar:ExternPartijnr)      !List box control field - type derived from field
APla:Transport         LIKE(APla:Transport)           !List box control field - type derived from field
APla:Instructie        LIKE(APla:Instructie)          !List box control field - type derived from field
APla:PlanningID        LIKE(APla:PlanningID)          !Browse hot field - type derived from field
APla:Planning          LIKE(APla:Planning)            !Browse hot field - type derived from field
APla:OverboekingCelID  LIKE(APla:OverboekingCelID)    !Browse hot field - type derived from field
APla:InkoopID          LIKE(APla:InkoopID)            !Browse hot field - type derived from field
AArt:ArtikelID         LIKE(AArt:ArtikelID)           !Related join file key field - type derived from field
APar:PartijID          LIKE(APar:PartijID)            !Related join file key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
BRW10::View:Browse   VIEW(PlanningInkoop)
                       PROJECT(Pla2:ArtikelID)
                       PROJECT(Pla2:FirmaNaam)
                       PROJECT(Pla2:PlanningID)
                       PROJECT(Pla2:Planning)
                       PROJECT(Pla2:InkoopID)
                       JOIN(Ink:PK_Inkoop,Pla2:InkoopID)
                         PROJECT(Ink:Planning_DATE)
                         PROJECT(Ink:Planning_TIME)
                         PROJECT(Ink:InkoopID)
                       END
                       JOIN(AAPla:PK_Planning,Pla2:PlanningID)
                         PROJECT(AAPla:KG)
                         PROJECT(AAPla:Pallets)
                         PROJECT(AAPla:MutatieGemaakt)
                         PROJECT(AAPla:PlanningID)
                         PROJECT(AAPla:PartijID)
                         PROJECT(AAPla:CelID)
                         JOIN(AAPar:Partij_PK,AAPla:PartijID)
                           PROJECT(AAPar:PartijID)
                         END
                         JOIN(AAAACEL:CEL_PK,AAPla:CelID)
                           PROJECT(AAAACEL:CelOms)
                           PROJECT(AAAACEL:CelID)
                         END
                       END
                       JOIN(AArt:Artikel_PK,Pla2:ArtikelID)
                         PROJECT(AArt:ArtikelOms)
                         PROJECT(AArt:ArtikelID)
                       END
                     END
Queue:Browse:2       QUEUE                            !Queue declaration for browse/combo box using ?List:3
Pla2:ArtikelID         LIKE(Pla2:ArtikelID)           !List box control field - type derived from field
AArt:ArtikelOms        LIKE(AArt:ArtikelOms)          !List box control field - type derived from field
Ink:Planning_DATE      LIKE(Ink:Planning_DATE)        !List box control field - type derived from field
Ink:Planning_TIME      LIKE(Ink:Planning_TIME)        !List box control field - type derived from field
AAPla:KG               LIKE(AAPla:KG)                 !List box control field - type derived from field
AAPla:Pallets          LIKE(AAPla:Pallets)            !List box control field - type derived from field
LOC:Getransferd        LIKE(LOC:Getransferd)          !List box control field - type derived from local data
LOC:Getransferd_Icon   LONG                           !Entry's icon ID
AAPla:MutatieGemaakt   LIKE(AAPla:MutatieGemaakt)     !List box control field - type derived from field
AAPla:MutatieGemaakt_Icon LONG                        !Entry's icon ID
AAAACEL:CelOms         LIKE(AAAACEL:CelOms)           !List box control field - type derived from field
Pla2:FirmaNaam         LIKE(Pla2:FirmaNaam)           !List box control field - type derived from field
Pla2:PlanningID        LIKE(Pla2:PlanningID)          !Primary key field - type derived from field
Pla2:Planning          LIKE(Pla2:Planning)            !Browse key field - type derived from field
Ink:InkoopID           LIKE(Ink:InkoopID)             !Related join file key field - type derived from field
AAPla:PlanningID       LIKE(AAPla:PlanningID)         !Related join file key field - type derived from field
AAPar:PartijID         LIKE(AAPar:PartijID)           !Related join file key field - type derived from field
AAAACEL:CelID          LIKE(AAAACEL:CelID)            !Related join file key field - type derived from field
AArt:ArtikelID         LIKE(AArt:ArtikelID)           !Related join file key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
LocEnableEnterByTab  BYTE(1)                               !Used by the ENTER Instead of Tab template
EnterByTabManager    EnterByTabClass
History::OR:Record   LIKE(OR:RECORD),THREAD
NetLocalRefreshDate     Long     ! NetTalk (NetRefresh)
NetLocalRefreshTime     Long
NetLocalDependancies    String('|OverboekingRit|OverboekingRitRegel|Planning|Cel|ACel|Partij|AAViewArtikel|AInkoop|APlanning|AViewArtikel|APartij|AACel|AAACel|PlanningInkoop|Inkoop|AAPlanning|AAPartij|AAAACel|')
QuickWindow          WINDOW('Form OverboekingRit'),AT(,,633,412),FONT('MS Sans Serif',8,,FONT:regular,CHARSET:DEFAULT), |
  DOUBLE,CENTER,GRAY,IMM,MDI,HLP('UpdateOverboekingRit'),SYSTEM
                       PROMPT('Uitvoertijdstip:'),AT(8,8),USE(?Ove:DatumTijd_DATE:Prompt),TRN
                       ENTRY(@d17-),AT(64,9,53,10),USE(OR:DatumTijd_DATE)
                       ENTRY(@t7),AT(122,9,33,10),USE(OR:DatumTijd_TIME)
                       PROMPT('Opmerking:'),AT(8,23),USE(?OR:Opmerking:Prompt),TRN
                       ENTRY(@s100),AT(64,23,262,10),USE(OR:Opmerking)
                       LIST,AT(9,48,615,98),USE(?List),HVSCROLL,FORMAT('[55L(2)|M~ID~C(0)@s30@120L(2)|M~Omschr' & |
  'ijving~C(0)@s60@]|~Artikel~[47R(2)|M@d17-@31R(2)|M@t7@]|~Tijdstip~17C|M@s3@40R(2)|M~' & |
  'KG~C(0)@n-13`2@30R(2)|M~Pallets~C(0)@n-14.@64R(2)|MI~Mutaties Gemaakt~C(0)@p p@[70L(' & |
  '2)|M~Van~C(0)@s50@70L(2)|M~Naar~C(0)@s50@]|~Cel~[50R(2)|M~Intern~C(0)@n_10@50R(2)|M~' & |
  'Extern~C(0)@n_10@]|~Partijnr.~100L(2)|M~Transport~C(0)@s100@200L(2)|M~Instructie~C(0)@s100@'), |
  FROM(Queue:Browse),IMM
                       BUTTON('Deselecteren'),AT(9,150),USE(?DeselecterenButton)
                       PROMPT('Datum:'),AT(10,171),USE(?LOC:Datum:Prompt)
                       SPIN(@d17-),AT(43,171,56,11),USE(LOC:Datum)
                       LIST,AT(9,200,615,79),USE(?List:2),HVSCROLL,FORMAT('[55L(2)|M~ID~C(0)@s30@120L(2)|M~Oms' & |
  'chrijving~C(0)@s60@]|~Artikel~[50R(2)|M@d17-@31R(2)|M@t7@]|~Tijdstip~40R(2)|M~KG~C(0' & |
  ')@n-13`2@30R(2)|M~Pallets~C(0)@n-14.@45R(2)|MI~Getransferd~C(0)@p p@45R(2)|MI~Overge' & |
  'boekt~C(0)@p p@[70L(2)|M~Van~C(0)@s50@70L(2)|M~Naar~C(0)@s50@]|~Cel~[50R(2)|M~Intern' & |
  '~C(0)@n_10@50R(2)|M~Extern~C(1)@n_10@]|~Partijnr.~100L(2)|M~Transport~C(0)@s100@200L' & |
  '(2)|M~Instructie~C(0)@s100@'),FROM(Queue:Browse:1),IMM
                       BUTTON('Selecteren'),AT(9,283,57),USE(?SelecterenButton)
                       BUTTON('&OK'),AT(524,393,49,14),USE(?OK),LEFT,ICON('WAOK.ICO'),DEFAULT,FLAT,MSG('Accept dat' & |
  'a and close the window'),TIP('Accept data and close the window')
                       BUTTON('&Cancel'),AT(576,393,49,14),USE(?Cancel),LEFT,ICON('WACANCEL.ICO'),FLAT,MSG('Cancel operation'), |
  TIP('Cancel operation')
                       PROMPT('Transfer ID:'),AT(521,9),USE(?OR:OverboekingRitID:Prompt)
                       ENTRY(@n_10),AT(564,9,60,10),USE(OR:OverboekingRitID),RIGHT,DISABLE
                       STRING('Overboekingen'),AT(11,186),USE(?STRING1),FONT('Microsoft Sans Serif',,,FONT:bold)
                       STRING('Geselecteerde inkopen/overboekingen'),AT(9,35),USE(?STRING2),FONT('Microsoft Sans Serif', |
  ,,FONT:bold)
                       LIST,AT(11,317,613,70),USE(?List:3),HVSCROLL,FORMAT('[55L(2)|M~ID~C(0)@s30@120L(2)|M~Om' & |
  'schrijving~C(0)@s60@]|~Artikel~[50L(2)|M@d17-@31R(2)|M@t7@]|~Tijdstip~40R(2)|M~KG~C(' & |
  '0)@n-13`2@30R(2)|M~Pallets~C(0)@n-14.@45R(2)|MI~Getransferd~C(0)@p p@25R(2)|MI~Insla' & |
  'g~C(0)@p p@70L(2)|M~Cel~C(0)@s50@100L(2)|M~Leverancier~C(0)@s50@'),FROM(Queue:Browse:2), |
  IMM
                       BUTTON('Selecteren'),AT(10,392,57),USE(?SelecterenInkoop)
                       STRING('Inkopen'),AT(11,303),USE(?STRING3),FONT('Microsoft Sans Serif',,,FONT:bold)
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
Reset                  PROCEDURE(BYTE Force=0),DERIVED
Run                    PROCEDURE(),BYTE,PROC,DERIVED
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED
TakeCompleted          PROCEDURE(),BYTE,PROC,DERIVED
TakeEvent              PROCEDURE(),BYTE,PROC,DERIVED
TakeFieldEvent         PROCEDURE(),BYTE,PROC,DERIVED
TakeNewSelection       PROCEDURE(),BYTE,PROC,DERIVED
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
Resizer              CLASS(WindowResizeClass)
Init                   PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)
                     END

BRW4                 CLASS(BrowseClass)                    ! Browse using ?List
Q                      &Queue:Browse                  !Reference to browse queue
ResetQueue             PROCEDURE(BYTE ResetMode),DERIVED
SetQueueRecord         PROCEDURE(),DERIVED
ValidateRecord         PROCEDURE(),BYTE,DERIVED
                     END

BRW4::Sort0:Locator  StepLocatorClass                      ! Default Locator
BRW8                 CLASS(BrowseClass)                    ! Browse using ?List:2
Q                      &Queue:Browse:1                !Reference to browse queue
SetQueueRecord         PROCEDURE(),DERIVED
                     END

BRW8::Sort0:Locator  StepLocatorClass                      ! Default Locator
BRW10                CLASS(BrowseClass)                    ! Browse using ?List:3
Q                      &Queue:Browse:2                !Reference to browse queue
SetQueueRecord         PROCEDURE(),DERIVED
                     END

BRW10::Sort0:Locator StepLocatorClass                      ! Default Locator
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
ConvertDatum        ROUTINE
	Loc:DatumVanSQL = Loc:Datum - 36163
	Loc:DatumTMSQL = Loc:Datum - 36163 + 1

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
  GlobalErrors.SetProcedureName('UpdateTransfers')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Ove:DatumTijd_DATE:Prompt
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('Loc:DatumTMSQL',Loc:DatumTMSQL)                    ! Added by: BrowseBox(ABC)
  BIND('LOC:Planning_DATE',LOC:Planning_DATE)              ! Added by: BrowseBox(ABC)
  BIND('LOC:Planning_TIME',LOC:Planning_TIME)              ! Added by: BrowseBox(ABC)
  BIND('LOC:PlanningSoort',LOC:PlanningSoort)              ! Added by: BrowseBox(ABC)
  BIND('Pla:PlanningID',Pla:PlanningID)                    ! Added by: BrowseBox(ABC)
  BIND('AInk:InkoopID',AInk:InkoopID)                      ! Added by: BrowseBox(ABC)
  BIND('LOC:Getransferd',LOC:Getransferd)                  ! Added by: BrowseBox(ABC)
  BIND('APla:PlanningID',APla:PlanningID)                  ! Added by: BrowseBox(ABC)
  BIND('Ink:InkoopID',Ink:InkoopID)                        ! Added by: BrowseBox(ABC)
  BIND('AAPla:PlanningID',AAPla:PlanningID)                ! Added by: BrowseBox(ABC)
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.HistoryKey = CtrlH
  SELF.AddHistoryFile(OR:Record,History::OR:Record)
  SELF.AddHistoryField(?OR:DatumTijd_DATE,4)
  SELF.AddHistoryField(?OR:DatumTijd_TIME,5)
  SELF.AddHistoryField(?OR:Opmerking,6)
  SELF.AddHistoryField(?OR:OverboekingRitID,1)
  SELF.AddUpdateFile(Access:OverboekingRit)
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  Relate:AOverboekingRit.Open                              ! File AOverboekingRit used by this procedure, so make sure it's RelationManager is open
  Relate:AOverboekingRitRegel.Open                         ! File AOverboekingRitRegel used by this procedure, so make sure it's RelationManager is open
  Relate:APlanning.Open                                    ! File APlanning used by this procedure, so make sure it's RelationManager is open
  Relate:OverboekingRit.SetOpenRelated()
  Relate:OverboekingRit.Open                               ! File OverboekingRit used by this procedure, so make sure it's RelationManager is open
  Relate:PlanningInkoop.Open                               ! File PlanningInkoop used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Primary &= Relate:OverboekingRit
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
  BRW4.Init(?List,Queue:Browse.ViewPosition,BRW4::View:Browse,Queue:Browse,Relate:OverboekingRitRegel,SELF) ! Initialize the browse manager
  BRW8.Init(?List:2,Queue:Browse:1.ViewPosition,BRW8::View:Browse,Queue:Browse:1,Relate:APlanning,SELF) ! Initialize the browse manager
  BRW10.Init(?List:3,Queue:Browse:2.ViewPosition,BRW10::View:Browse,Queue:Browse:2,Relate:PlanningInkoop,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  WinAlertMouseZoom()
  IF SELF.Request = InsertRecord
  	OR:DatumTijd_DATE=PRM:Datum
  END
  
  LOC:Datum=PRM:Datum
  DO ConvertDatum
  
  IF GLO:HidePlanningInstructie THEN
      ?List{PROPLIST:Width, 11} = 0
      ?List:2{PROPLIST:Width, 11} = 0
  END    
  
  Do DefineListboxStyle
  IF SELF.Request = ViewRecord                             ! Configure controls for View Only mode
    ?OR:DatumTijd_DATE{PROP:ReadOnly} = True
    ?OR:DatumTijd_TIME{PROP:ReadOnly} = True
    ?OR:Opmerking{PROP:ReadOnly} = True
    DISABLE(?DeselecterenButton)
    DISABLE(?SelecterenButton)
    ?OR:OverboekingRitID{PROP:ReadOnly} = True
    DISABLE(?SelecterenInkoop)
  END
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  BRW4.Q &= Queue:Browse
  BRW4.AddSortOrder(,ORR:FK_OverboekingRitRegel)           ! Add the sort order for ORR:FK_OverboekingRitRegel for sort order 1
  BRW4.AddRange(ORR:OverboekingRitID,OR:OverboekingRitID)  ! Add single value range limit for sort order 1
  BRW4.AddLocator(BRW4::Sort0:Locator)                     ! Browse has a locator for sort order 1
  BRW4::Sort0:Locator.Init(,ORR:OverboekingRitRegelID,,BRW4) ! Initialize the browse locator using  using key: ORR:FK_OverboekingRitRegel , ORR:OverboekingRitRegelID
  ?List{PROP:IconList,1} = '~off.ico'
  ?List{PROP:IconList,2} = '~on.ico'
  BRW4.AddField(Pla:ArtikelID,BRW4.Q.Pla:ArtikelID)        ! Field Pla:ArtikelID is a hot field or requires assignment from browse
  BRW4.AddField(AAArt:ArtikelOms,BRW4.Q.AAArt:ArtikelOms)  ! Field AAArt:ArtikelOms is a hot field or requires assignment from browse
  BRW4.AddField(LOC:Planning_DATE,BRW4.Q.LOC:Planning_DATE) ! Field LOC:Planning_DATE is a hot field or requires assignment from browse
  BRW4.AddField(LOC:Planning_TIME,BRW4.Q.LOC:Planning_TIME) ! Field LOC:Planning_TIME is a hot field or requires assignment from browse
  BRW4.AddField(LOC:PlanningSoort,BRW4.Q.LOC:PlanningSoort) ! Field LOC:PlanningSoort is a hot field or requires assignment from browse
  BRW4.AddField(Pla:KG,BRW4.Q.Pla:KG)                      ! Field Pla:KG is a hot field or requires assignment from browse
  BRW4.AddField(Pla:Pallets,BRW4.Q.Pla:Pallets)            ! Field Pla:Pallets is a hot field or requires assignment from browse
  BRW4.AddField(Pla:MutatieGemaakt,BRW4.Q.Pla:MutatieGemaakt) ! Field Pla:MutatieGemaakt is a hot field or requires assignment from browse
  BRW4.AddField(CEL:CelOms,BRW4.Q.CEL:CelOms)              ! Field CEL:CelOms is a hot field or requires assignment from browse
  BRW4.AddField(ACel:CelOms,BRW4.Q.ACel:CelOms)            ! Field ACel:CelOms is a hot field or requires assignment from browse
  BRW4.AddField(Pla:PartijID,BRW4.Q.Pla:PartijID)          ! Field Pla:PartijID is a hot field or requires assignment from browse
  BRW4.AddField(Par:ExternPartijnr,BRW4.Q.Par:ExternPartijnr) ! Field Par:ExternPartijnr is a hot field or requires assignment from browse
  BRW4.AddField(Pla:Transport,BRW4.Q.Pla:Transport)        ! Field Pla:Transport is a hot field or requires assignment from browse
  BRW4.AddField(Pla:Instructie,BRW4.Q.Pla:Instructie)      ! Field Pla:Instructie is a hot field or requires assignment from browse
  BRW4.AddField(Pla:OverboekingCelID,BRW4.Q.Pla:OverboekingCelID) ! Field Pla:OverboekingCelID is a hot field or requires assignment from browse
  BRW4.AddField(Pla:Planning_DATE,BRW4.Q.Pla:Planning_DATE) ! Field Pla:Planning_DATE is a hot field or requires assignment from browse
  BRW4.AddField(Pla:Planning_TIME,BRW4.Q.Pla:Planning_TIME) ! Field Pla:Planning_TIME is a hot field or requires assignment from browse
  BRW4.AddField(AInk:Planning_DATE,BRW4.Q.AInk:Planning_DATE) ! Field AInk:Planning_DATE is a hot field or requires assignment from browse
  BRW4.AddField(AInk:Planning_TIME,BRW4.Q.AInk:Planning_TIME) ! Field AInk:Planning_TIME is a hot field or requires assignment from browse
  BRW4.AddField(ORR:OverboekingRitRegelID,BRW4.Q.ORR:OverboekingRitRegelID) ! Field ORR:OverboekingRitRegelID is a hot field or requires assignment from browse
  BRW4.AddField(ORR:OverboekingRitID,BRW4.Q.ORR:OverboekingRitID) ! Field ORR:OverboekingRitID is a hot field or requires assignment from browse
  BRW4.AddField(Pla:PlanningID,BRW4.Q.Pla:PlanningID)      ! Field Pla:PlanningID is a hot field or requires assignment from browse
  BRW4.AddField(CEL:CelID,BRW4.Q.CEL:CelID)                ! Field CEL:CelID is a hot field or requires assignment from browse
  BRW4.AddField(ACel:CelID,BRW4.Q.ACel:CelID)              ! Field ACel:CelID is a hot field or requires assignment from browse
  BRW4.AddField(Par:PartijID,BRW4.Q.Par:PartijID)          ! Field Par:PartijID is a hot field or requires assignment from browse
  BRW4.AddField(AAArt:ArtikelID,BRW4.Q.AAArt:ArtikelID)    ! Field AAArt:ArtikelID is a hot field or requires assignment from browse
  BRW4.AddField(AInk:InkoopID,BRW4.Q.AInk:InkoopID)        ! Field AInk:InkoopID is a hot field or requires assignment from browse
  BRW8.Q &= Queue:Browse:1
  BRW8.AddSortOrder(,APla:Datum_Tijd_K)                    ! Add the sort order for APla:Datum_Tijd_K for sort order 1
  BRW8.AddRange(APla:Planning,LOC:DatumVanSQL,LOC:DatumTMSQL) ! Add 'range of values' range limit for sort order 1
  BRW8.AddLocator(BRW8::Sort0:Locator)                     ! Browse has a locator for sort order 1
  BRW8::Sort0:Locator.Init(,APla:Planning,,BRW8)           ! Initialize the browse locator using  using key: APla:Datum_Tijd_K , APla:Planning
  BRW8.SetFilter('((APla:OverboekingCelID <<> 0) AND (APla:Planning <<> Loc:DatumTMSQL))') ! Apply filter expression to browse
  ?List:2{PROP:IconList,1} = '~off.ico'
  ?List:2{PROP:IconList,2} = '~on.ico'
  BRW8.AddField(APla:ArtikelID,BRW8.Q.APla:ArtikelID)      ! Field APla:ArtikelID is a hot field or requires assignment from browse
  BRW8.AddField(AArt:ArtikelOms,BRW8.Q.AArt:ArtikelOms)    ! Field AArt:ArtikelOms is a hot field or requires assignment from browse
  BRW8.AddField(APla:Planning_DATE,BRW8.Q.APla:Planning_DATE) ! Field APla:Planning_DATE is a hot field or requires assignment from browse
  BRW8.AddField(APla:Planning_TIME,BRW8.Q.APla:Planning_TIME) ! Field APla:Planning_TIME is a hot field or requires assignment from browse
  BRW8.AddField(APla:KG,BRW8.Q.APla:KG)                    ! Field APla:KG is a hot field or requires assignment from browse
  BRW8.AddField(APla:Pallets,BRW8.Q.APla:Pallets)          ! Field APla:Pallets is a hot field or requires assignment from browse
  BRW8.AddField(LOC:Getransferd,BRW8.Q.LOC:Getransferd)    ! Field LOC:Getransferd is a hot field or requires assignment from browse
  BRW8.AddField(APla:MutatieGemaakt,BRW8.Q.APla:MutatieGemaakt) ! Field APla:MutatieGemaakt is a hot field or requires assignment from browse
  BRW8.AddField(AACel:CelOms,BRW8.Q.AACel:CelOms)          ! Field AACel:CelOms is a hot field or requires assignment from browse
  BRW8.AddField(AAACel:CelOms,BRW8.Q.AAACel:CelOms)        ! Field AAACel:CelOms is a hot field or requires assignment from browse
  BRW8.AddField(APla:PartijID,BRW8.Q.APla:PartijID)        ! Field APla:PartijID is a hot field or requires assignment from browse
  BRW8.AddField(APar:ExternPartijnr,BRW8.Q.APar:ExternPartijnr) ! Field APar:ExternPartijnr is a hot field or requires assignment from browse
  BRW8.AddField(APla:Transport,BRW8.Q.APla:Transport)      ! Field APla:Transport is a hot field or requires assignment from browse
  BRW8.AddField(APla:Instructie,BRW8.Q.APla:Instructie)    ! Field APla:Instructie is a hot field or requires assignment from browse
  BRW8.AddField(APla:PlanningID,BRW8.Q.APla:PlanningID)    ! Field APla:PlanningID is a hot field or requires assignment from browse
  BRW8.AddField(APla:Planning,BRW8.Q.APla:Planning)        ! Field APla:Planning is a hot field or requires assignment from browse
  BRW8.AddField(APla:OverboekingCelID,BRW8.Q.APla:OverboekingCelID) ! Field APla:OverboekingCelID is a hot field or requires assignment from browse
  BRW8.AddField(APla:InkoopID,BRW8.Q.APla:InkoopID)        ! Field APla:InkoopID is a hot field or requires assignment from browse
  BRW8.AddField(AArt:ArtikelID,BRW8.Q.AArt:ArtikelID)      ! Field AArt:ArtikelID is a hot field or requires assignment from browse
  BRW8.AddField(APar:PartijID,BRW8.Q.APar:PartijID)        ! Field APar:PartijID is a hot field or requires assignment from browse
  BRW10.Q &= Queue:Browse:2
  BRW10.AddSortOrder(,Pla2:Planning_K)                     ! Add the sort order for Pla2:Planning_K for sort order 1
  BRW10.AddRange(Pla2:Planning,LOC:DatumVanSQL,LOC:DatumTMSQL) ! Add 'range of values' range limit for sort order 1
  BRW10.AddLocator(BRW10::Sort0:Locator)                   ! Browse has a locator for sort order 1
  BRW10::Sort0:Locator.Init(,Pla2:Planning,1,BRW10)        ! Initialize the browse locator using  using key: Pla2:Planning_K , Pla2:Planning
  BRW10.SetFilter('((Pla2:Planning <<> Loc:DatumTMSQL))')  ! Apply filter expression to browse
  ?List:3{PROP:IconList,1} = '~off.ico'
  ?List:3{PROP:IconList,2} = '~on.ico'
  BRW10.AddField(Pla2:ArtikelID,BRW10.Q.Pla2:ArtikelID)    ! Field Pla2:ArtikelID is a hot field or requires assignment from browse
  BRW10.AddField(AArt:ArtikelOms,BRW10.Q.AArt:ArtikelOms)  ! Field AArt:ArtikelOms is a hot field or requires assignment from browse
  BRW10.AddField(Ink:Planning_DATE,BRW10.Q.Ink:Planning_DATE) ! Field Ink:Planning_DATE is a hot field or requires assignment from browse
  BRW10.AddField(Ink:Planning_TIME,BRW10.Q.Ink:Planning_TIME) ! Field Ink:Planning_TIME is a hot field or requires assignment from browse
  BRW10.AddField(AAPla:KG,BRW10.Q.AAPla:KG)                ! Field AAPla:KG is a hot field or requires assignment from browse
  BRW10.AddField(AAPla:Pallets,BRW10.Q.AAPla:Pallets)      ! Field AAPla:Pallets is a hot field or requires assignment from browse
  BRW10.AddField(LOC:Getransferd,BRW10.Q.LOC:Getransferd)  ! Field LOC:Getransferd is a hot field or requires assignment from browse
  BRW10.AddField(AAPla:MutatieGemaakt,BRW10.Q.AAPla:MutatieGemaakt) ! Field AAPla:MutatieGemaakt is a hot field or requires assignment from browse
  BRW10.AddField(AAAACEL:CelOms,BRW10.Q.AAAACEL:CelOms)    ! Field AAAACEL:CelOms is a hot field or requires assignment from browse
  BRW10.AddField(Pla2:FirmaNaam,BRW10.Q.Pla2:FirmaNaam)    ! Field Pla2:FirmaNaam is a hot field or requires assignment from browse
  BRW10.AddField(Pla2:PlanningID,BRW10.Q.Pla2:PlanningID)  ! Field Pla2:PlanningID is a hot field or requires assignment from browse
  BRW10.AddField(Pla2:Planning,BRW10.Q.Pla2:Planning)      ! Field Pla2:Planning is a hot field or requires assignment from browse
  BRW10.AddField(Ink:InkoopID,BRW10.Q.Ink:InkoopID)        ! Field Ink:InkoopID is a hot field or requires assignment from browse
  BRW10.AddField(AAPla:PlanningID,BRW10.Q.AAPla:PlanningID) ! Field AAPla:PlanningID is a hot field or requires assignment from browse
  BRW10.AddField(AAPar:PartijID,BRW10.Q.AAPar:PartijID)    ! Field AAPar:PartijID is a hot field or requires assignment from browse
  BRW10.AddField(AAAACEL:CelID,BRW10.Q.AAAACEL:CelID)      ! Field AAAACEL:CelID is a hot field or requires assignment from browse
  BRW10.AddField(AArt:ArtikelID,BRW10.Q.AArt:ArtikelID)    ! Field AArt:ArtikelID is a hot field or requires assignment from browse
  INIMgr.Fetch('UpdateTransfers',QuickWindow)              ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  BRW4.AddToolbarTarget(Toolbar)                           ! Browse accepts toolbar control
  BRW8.AddToolbarTarget(Toolbar)                           ! Browse accepts toolbar control
  BRW10.AddToolbarTarget(Toolbar)                          ! Browse accepts toolbar control
  SELF.SetAlerts()
  NetLocalRefreshDate = today()         ! NetTalk (NetRefresh)
  NetLocalRefreshTime = clock()
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
    Relate:AOverboekingRit.Close
    Relate:AOverboekingRitRegel.Close
    Relate:APlanning.Close
    Relate:OverboekingRit.Close
    Relate:PlanningInkoop.Close
  END
  IF SELF.Opened
    INIMgr.Update('UpdateTransfers',QuickWindow)           ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.PrimeUpdate PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.PrimeUpdate()
    If returnValue = Level:Fatal  ! delete just occured
      ThisNetRefresh.Send('|OverboekingRit|OverboekingRitRegel|APlanning|PlanningInkoop|') ! NetTalk (NetRefresh)
    End
  RETURN ReturnValue


ThisWindow.Reset PROCEDURE(BYTE Force=0)

  CODE
  SELF.ForcedReset += Force
  IF QuickWindow{Prop:AcceptAll} THEN RETURN.
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
    OF ?DeselecterenButton
      ThisWindow.Update()
      DO ConvertDatum
      Get(BRW4.Q,Choice(?List))
      
      found# = 0
      
      CLEAR(AORR:Record)
      AORR:OverboekingRitRegelID=BRW4.Q.ORR:OverboekingRitRegelID
      IF (Access:AOverboekingRitRegel.TryFetch(AORR:PK_OverboekingRitRegel) = Level:Benign)
      	Access:AOverboekingRitRegel.DeleteRecord(0)
      
      	BRW4.ResetQueue(0)
      	BRW8.ResetQueue(0)
      	BRW10.ResetQueue(0)
      .
    OF ?SelecterenButton
      ThisWindow.Update()
      DO ConvertDatum
      Get(BRW8.Q,Choice(?List:2))
      
      found# = 0
      
      db.DebugOut('Selecteren:'&OR:OverboekingRitID)
      
      CLEAR(AORR:Record)
      AORR:OverboekingRitID=OR:OverboekingRitID
      SET(AORR:FK_OverboekingRitRegel, AORR:FK_OverboekingRitRegel)
      LOOP
      	Access:AOverboekingRitRegel.TryNext()
      	IF ERROR() THEN BREAK.
      	IF AORR:OverboekingRitID<>OR:OverboekingRitID THEN BREAK.
      	
      	IF AORR:PlanningID=BRW8.Q.APla:PlanningID THEN
      		found# = 1
      		db.DebugOut('FOUND:'&AORR:PlanningID)
      	.
      	db.DebugOut('NOTFOUND:'&AORR:PlanningID)
      .
      
      db.DebugOut('FOUND-STATE:'&found#)
      
      IF NOT(found#)
      	CLEAR(AORR:Record)
      	Access:AOverboekingRitRegel.PrimeRecord()
      	AORR:OverboekingRitID=OR:OverboekingRitID
      	AORR:PlanningID=BRW8.Q.APla:PlanningID
      	Access:AOverboekingRitRegel.TryInsert()
      
      	BRW4.ResetQueue(0)
      	BRW8.ResetQueue(0)
      	BRW10.ResetQueue(0)
      .
    OF ?OK
      ThisWindow.Update()
      IF SELF.Request = ViewRecord AND NOT SELF.BatchProcessing THEN
         POST(EVENT:CloseWindow)
      END
    OF ?SelecterenInkoop
      ThisWindow.Update()
      DO ConvertDatum
      
      Get(BRW10.Q,Choice(?List:3))
      
      found# = 0
      
      db.DebugOut('Selecteren:'&OR:OverboekingRitID)
      
      CLEAR(AORR:Record)
      AORR:OverboekingRitID=OR:OverboekingRitID
      SET(AORR:FK_OverboekingRitRegel, AORR:FK_OverboekingRitRegel)
      LOOP
      	Access:AOverboekingRitRegel.TryNext()
      	IF ERROR() THEN BREAK.
      	IF AORR:OverboekingRitID<>OR:OverboekingRitID THEN BREAK.
      	
      	IF AORR:PlanningID=BRW10.Q.Pla2:PlanningID THEN
      		found# = 1
      		db.DebugOut('FOUND:'&AORR:PlanningID)
      	.
      	db.DebugOut('NOT-FOUND:'&AORR:PlanningID)
      .
      
      db.DebugOut('FOUND-STATE:'&found#)
      
      IF NOT(found#)
      	CLEAR(AORR:Record)
      	Access:AOverboekingRitRegel.PrimeRecord()
      	AORR:OverboekingRitID=OR:OverboekingRitID
      	AORR:PlanningID=BRW10.Q.Pla2:PlanningID
      	Access:AOverboekingRitRegel.TryInsert()
      
      	BRW4.ResetQueue(0)
      	BRW8.ResetQueue(0)
      	BRW10.ResetQueue(0)
      .
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
  ! Datum/tijd van de gekoppelde planningen (alleen overboekingen waarvoor nog geen mutatie zijn gemaakt) gelijk zetten aan de uitvoerdatum van de transfer
  db.Debugout('TakeCompleted() - ' & ThisWindow.Response & ' - RitID: ' & OR:OverboekingRitID)
  IF ThisWindow.Response = RequestCompleted THEN
      CLEAR(ORR:Record)
      ORR:OverboekingRitID = OR:OverboekingRitID
      SET(ORR:FK_OverboekingRitRegel,ORR:FK_OverboekingRitRegel)
      LOOP UNTIL Access:OverboekingRitRegel.Next()
          IF ORR:OverboekingRitID <> OR:OverboekingRitID THEN BREAK.
          
          CLEAR(Pla:Record)
          Pla:PlanningID = ORR:PlanningID
          IF Access:Planning.Fetch(Pla:PK_Planning) = Level:Benign THEN
              IF Pla:MutatieGemaakt = 0 AND Pla:VerkoopID = 0 AND Pla:InkoopID = 0  THEN
                  Pla:Planning_DATE = OR:DatumTijd_DATE
                  Pla:Planning_TIME = OR:DatumTijd_TIME
                  Access:Planning.Update()
              END
          END
      END
  END
  
  NetRefreshPlanningViews()
    ThisNetRefresh.Send('|OverboekingRit|OverboekingRitRegel|APlanning|PlanningInkoop|') ! NetTalk (NetRefresh)
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
  OF ?LOC:Datum
    CASE EVENT()
    OF EVENT:Selecting
      DO ConvertDatum
      BRW8.ResetQueue(0)
      BRW10.ResetQueue(0)
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
    OF ?LOC:Datum
      DO ConvertDatum
      BRW8.ResetQueue(0)
      BRW10.ResetQueue(0)
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


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window


BRW4.ResetQueue PROCEDURE(BYTE ResetMode)

  CODE
  IF Pla:OverboekingCelID<>0 THEN
  	LOC:Planning_TIME=Pla:Planning_TIME
  	LOC:Planning_DATE=Pla:Planning_DATE
  	LOC:PlanningSoort='OVR'
  ELSE
  	LOC:Planning_TIME=AInk:Planning_TIME
  	LOC:Planning_DATE=AInk:Planning_DATE
  	LOC:PlanningSoort='INK'
  .
  PARENT.ResetQueue(ResetMode)


BRW4.SetQueueRecord PROCEDURE

  CODE
  PARENT.SetQueueRecord
  
  IF (Pla:MutatieGemaakt)
    SELF.Q.Pla:MutatieGemaakt_Icon = 2                     ! Set icon from icon list
  ELSE
    SELF.Q.Pla:MutatieGemaakt_Icon = 1                     ! Set icon from icon list
  END


BRW4.ValidateRecord PROCEDURE

ReturnValue          BYTE,AUTO

BRW4::RecordStatus   BYTE,AUTO
  CODE
  IF Pla:OverboekingCelID<>0 THEN
  	LOC:Planning_TIME=Pla:Planning_TIME
  	LOC:Planning_DATE=Pla:Planning_DATE
  	LOC:PlanningSoort='OVR'
  ELSE
  	LOC:Planning_TIME=AInk:Planning_TIME
  	LOC:Planning_DATE=AInk:Planning_DATE
  	LOC:PlanningSoort='INK'
  .
  ReturnValue = PARENT.ValidateRecord()
  BRW4::RecordStatus=ReturnValue
  RETURN ReturnValue


BRW8.SetQueueRecord PROCEDURE

  CODE
  LOC:Getransferd = 0
  
  CLEAR(ORR:Record)
  ORR:PlanningID=APla:PlanningID
  SET(ORR:FK2_OverboekingRitRegel, ORR:FK2_OverboekingRitRegel)
  LOOP
  	Access:OverboekingRitRegel.Next()
  	IF ERROR() THEN BREAK.
  	IF ORR:PlanningID<>APla:PlanningID THEN BREAK.
  	
  	CLEAR(AOR:RECORD)
  	AOR:OverboekingRitID=ORR:OverboekingRitID
  	IF (Access:AOverboekingRit.TryFetch(AOR:PK_OverboekingRit) <> Level:Benign) THEN CYCLE.
  	
  	LOC:Getransferd = 1
  .
  PARENT.SetQueueRecord
  
  IF (LOC:Getransferd)
    SELF.Q.LOC:Getransferd_Icon = 2                        ! Set icon from icon list
  ELSE
    SELF.Q.LOC:Getransferd_Icon = 1                        ! Set icon from icon list
  END
  IF (APla:MutatieGemaakt)
    SELF.Q.APla:MutatieGemaakt_Icon = 2                    ! Set icon from icon list
  ELSE
    SELF.Q.APla:MutatieGemaakt_Icon = 1                    ! Set icon from icon list
  END


BRW10.SetQueueRecord PROCEDURE

  CODE
  LOC:Getransferd = 0
  
  CLEAR(ORR:Record)
  ORR:PlanningID=Pla2:PlanningID
  SET(ORR:FK2_OverboekingRitRegel, ORR:FK2_OverboekingRitRegel)
  LOOP
  	Access:OverboekingRitRegel.Next()
  	IF ERROR() THEN BREAK.
  	IF ORR:PlanningID<>Pla2:PlanningID THEN BREAK.
  	
  	CLEAR(AOR:RECORD)
  	AOR:OverboekingRitID=ORR:OverboekingRitID
  	IF (Access:AOverboekingRit.TryFetch(AOR:PK_OverboekingRit) <> Level:Benign) THEN CYCLE.
  	
  	LOC:Getransferd = 1
  .
  PARENT.SetQueueRecord
  
  IF (LOC:Getransferd)
    SELF.Q.LOC:Getransferd_Icon = 2                        ! Set icon from icon list
  ELSE
    SELF.Q.LOC:Getransferd_Icon = 1                        ! Set icon from icon list
  END
  IF (AAPla:MutatieGemaakt)
    SELF.Q.AAPla:MutatieGemaakt_Icon = 2                   ! Set icon from icon list
  ELSE
    SELF.Q.AAPla:MutatieGemaakt_Icon = 1                   ! Set icon from icon list
  END

