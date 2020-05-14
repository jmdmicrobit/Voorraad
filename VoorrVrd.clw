   PROGRAM


NetTalk:TemplateVersion equate('8.71')
ActivateNetTalk   EQUATE(1)
  include('NetCrit.inc'),once
  include('NetMap.inc'),once
  include('NetAll.inc'),once
  include('NetTalk.inc'),once
  include('NetSimp.inc'),once
  include('NetFtp.inc'),once
  include('NetHttp.inc'),once
  include('NetWww.inc'),once
  include('NetWeb.inc'),once
  include('NetWSDL.inc'),once
  include('NetEmail.inc'),once
  include('NetFile.inc'),once
  include('NetWebSms.inc'),once
StringTheory:TemplateVersion equate('3.13')
WINEVENT:Version              equate ('3.97')   !Deprecated
WinEvent:TemplateVersion      equate('3.97')
event:WinEventTaskbarLoadIcon equate(0500h+5510)

   INCLUDE('ABERROR.INC'),ONCE
   INCLUDE('ABFILE.INC'),ONCE
   INCLUDE('ABUTIL.INC'),ONCE
   INCLUDE('EFOCUS.INC'),ONCE
   INCLUDE('ERRORS.CLW'),ONCE
   INCLUDE('KEYCODES.CLW'),ONCE
   INCLUDE('ABFUZZY.INC'),ONCE
 Include('Debuger.INC'),once
  include('cwsynchc.inc'),once  ! added by NetTalk
  include('StringTheory.Inc'),ONCE
   Include('EventEqu.Clw'),Once
   INCLUDE('ABEIP.INC')
   INCLUDE('KCRQEIP.INC')

   MAP
    MODULE('VOORRSTM.DLL')
SelectARelatie         PROCEDURE(String),DLL               ! 
    END
    MODULE('VOORRRPT.DLL')
ProcessExcel           PROCEDURE,DLL                       ! 
ReportPalletStickers   FUNCTION(),Long,DLL                 ! 
ReportInslag           PROCEDURE,DLL                       ! 
ReportPalletTegoedenExcel PROCEDURE(BYTE),DLL              ! 
ReportVrdCelLocatie    PROCEDURE(LONG, QUEUE),DLL          ! 
    END
    MODULE('VOORRPLN.DLL')
UpdateEInslagMutatie   PROCEDURE,DLL                       ! 
UpdateEUitslagMutatie  PROCEDURE,DLL                       ! 
UpdateOverboekMutatie  PROCEDURE,DLL                       ! 
UpdateOverboekPlanningVanuitVV PROCEDURE,DLL               ! 
UpdateUitslagMutatie   PROCEDURE,DLL                       ! 
WindowInslag           PROCEDURE,DLL                       ! 
UpdateOverboeking      PROCEDURE(<STRING>,<STRING>,<LONG>,<LONG>,<REAL>),DLL ! 
    END
!--- Application Global and Exported Procedure Definitions --------------------------------------------
     MODULE('VOORRVRD001.CLW')
VoorrVrd               PROCEDURE   !
     END
     MODULE('VOORRVRD002.CLW')
BrowseVoorraadVerloopPerPartij PROCEDURE(STRING, LONG)   !Browse the VoorraadVerloop file
     END
     MODULE('VOORRVRD003.CLW')
BrowseVoorraadVerloop  PROCEDURE(STRING)   !Browse the VoorraadVerloop file
     END
     MODULE('VOORRVRD004.CLW')
UpdateViewVoorraad     PROCEDURE   !Form ViewVoorraad
     END
     MODULE('VOORRVRD005.CLW')
BrowsePallets          PROCEDURE   !Browse the PalletVerloop file
     END
     MODULE('VOORRVRD006.CLW')
UpdateVoorraadVerloop  PROCEDURE   !Form Mutatie
     END
     MODULE('VOORRVRD007.CLW')
BrowsePartijVoorraad_WORDTNIETGEBRUIKT PROCEDURE   !Browse the ViewVoorraad file
     END
     MODULE('VOORRVRD008.CLW')
UpdatePalletMutatie    PROCEDURE(LONG, LONG, LONG, LONG, LONG)   !Form PalletMutatie
     END
     MODULE('VOORRVRD009.CLW')
WijzigLocatie          PROCEDURE(LONG, LONG)   !Cel / Lokatie wijzigen
     END
     MODULE('VOORRVRD010.CLW')
BrowseVoorraadVerloopPerArtikelCel PROCEDURE(STRING, LONG)   !Browse the VoorraadVerloop file
     END
     MODULE('VOORRVRD011.CLW')
BrowsePalletTegoeden   PROCEDURE   !Browse the ViewPalletTegoeden file
     END
     MODULE('VOORRVRD012.CLW')
BrowsePartijVoorraadVIEW PROCEDURE   !Browse the ViewVoorraad file
     END
     MODULE('VOORRVRD013.CLW')
BrowseVoorraadVIEW     PROCEDURE   !Browse the ViewVoorraad file
     END
     MODULE('VOORRVRD014.CLW')
WijzigLocatie_Orgineel PROCEDURE(LONG, LONG)   !Cel / Lokatie wijzigen
     END
     include('eventmap.clw')
       MODULE('win32')
     
             OMIT('***',_WIDTH32_)
           FindWindow(LONG,*CSTRING), UNSIGNED, PASCAL, RAW
             ***
             COMPILE('***',_WIDTH32_)
           FindWindow(LONG,*CSTRING), UNSIGNED, PASCAL, RAW, NAME('FindWindowA')
             ***
     
           SetForegroundWindow(UNSIGNED), SIGNED, PROC, PASCAL
     
       END
     
     !	IMPURLHandler(unsigned, STRING)
     
     	NetRefreshPlanningViews()
     	NetRefreshVoorraadViews()
     
     !    MODULE('ImpShell2')
     !         ShellExecuteM(UNSIGNED,LONG,*CSTRING,LONG,*CSTRING,SIGNED),UNSIGNED,PASCAL,RAW,NAME('SHELLEXECUTEA')
     !    END
      
     
     
     !  INCLUDE('CWUTIL.INC'),ONCE
     !  INCLUDE('CLIB.CLW')
     !
     !  include('Ocx.CLW')
     
     !EventFunc procedure(*SHORT Reference,SIGNED OleControl,LONG CurrentEvent),LONG
     !PropChange PROCEDURE(SIGNED OleControl,STRING CurrentProp)
     !PropEdit   PROCEDURE(SIGNED OleControl,STRING CurrentProp),LONG
    ! Declare functions defined in this DLL
VoorrVrd:Init          PROCEDURE(<ErrorClass curGlobalErrors>, <INIClass curINIMgr>)
VoorrVrd:Kill          PROCEDURE
    ! Declare init functions defined in a different dll
     MODULE('VOORRSTM.DLL')
VOORRSTM:Init          PROCEDURE(<ErrorClass curGlobalErrors>, <INIClass curINIMgr>),DLL
VOORRSTM:Kill          PROCEDURE,DLL
     END
     MODULE('VOORRRPT.DLL')
VOORRRPT:Init          PROCEDURE(<ErrorClass curGlobalErrors>, <INIClass curINIMgr>),DLL
VOORRRPT:Kill          PROCEDURE,DLL
     END
     MODULE('VOORRPLN.DLL')
VOORRPLN:Init          PROCEDURE(<ErrorClass curGlobalErrors>, <INIClass curINIMgr>),DLL
VOORRPLN:Kill          PROCEDURE,DLL
     END
   END

  include('StringTheory.Inc'),ONCE
GLO:OWNER            CSTRING(199),EXTERNAL,DLL(_ABCDllMode_)
GLO:Versie           CSTRING(10),EXTERNAL,DLL(_ABCDllMode_)
GLO:BepaalTotaal     LONG,THREAD,EXTERNAL,DLL(_ABCDllMode_)
GLO:TotaalWegingKG   DECIMAL(10,2),THREAD,EXTERNAL,DLL(_ABCDllMode_)
GLO:TotaalWegingPallets LONG,THREAD,EXTERNAL,DLL(_ABCDllMode_)
GLO:WegingQueue2     QUEUE,PRE(GWQ2),THREAD,EXTERNAL,DLL(_ABCDllMode_)
ID                     LONG
BrutoGewichtKG         DECIMAL(10,2)
Palletsoort            STRING(10)
PalletsoortID          LONG
NettoGewichtKG         DECIMAL(10,2)
Datum                  DATE
Tijd                   TIME
PalletID               LONG
                     END
GLO:WegingQueue      QUEUE,PRE(WGQ),THREAD,EXTERNAL,DLL(_ABCDllMode_)
BrutoGewichtKG         DECIMAL(10,2)
Palletsoort            STRING(10)
PalletsoortID          LONG
NettoGewichtKG         DECIMAL(10,2)
Datum                  DATE
Tijd                   TIME
PalletID               LONG
                     END
GLO:UitslagMutatieQueue QUEUE,PRE(UMQ),THREAD,EXTERNAL,DLL(_ABCDllMode_)
PartijCelID            STRING(25)
LeverancierNaam        STRING(50)
VerpakkingOmschrijving CSTRING(51)
PartijID               LONG
CelID                  LONG
CelOms                 CSTRING(51)
KG                     DECIMAL(10,2)
Pallet                 LONG
CelLocatieID           LONG
LocatieNaam            CSTRING(51)
                     END
GLO:OverboekingMutatieQueue QUEUE,PRE(OMQ),THREAD,EXTERNAL,DLL(_ABCDllMode_)
CelID                  LONG
CelLocatieID           LONG
CelLocatieNaam         CSTRING(51)
CelOms                 CSTRING(51)
KG                     DECIMAL(10,2)
Pallet                 LONG
                     END
GLO:HeaderString     STRING(256),THREAD,EXTERNAL,DLL(_ABCDllMode_)
GLO:MyWordDoc        CSTRING(20),THREAD,EXTERNAL,DLL(_ABCDllMode_)
GLO:MyItem           CSTRING(20),THREAD,EXTERNAL,DLL(_ABCDllMode_)
GLO:Planning_ThreadID LONG,EXTERNAL,DLL(_ABCDllMode_)
GLO:Overboeking_ThreadID LONG,EXTERNAL,DLL(_ABCDllMode_)
GLO:Inkoop_ThreadID  LONG,EXTERNAL,DLL(_ABCDllMode_)
GLO:Verkoop_ThreadID LONG,EXTERNAL,DLL(_ABCDllMode_)
GLO:Voorraad_ThreadID LONG,EXTERNAL,DLL(_ABCDllMode_)
GLO:PartijVoorraad_ThreadID LONG,EXTERNAL,DLL(_ABCDllMode_)
GLO:PalletAdministratie_ThreadID LONG,EXTERNAL,DLL(_ABCDllMode_)
GLO:Activiteit_ThreadID LONG,EXTERNAL,DLL(_ABCDllMode_)
GLO:GebruikerLogHandelingOpmerking CSTRING(101),THREAD,EXTERNAL,DLL(_ABCDllMode_)
GLO:TimingMeting     LONG,DIM(20),THREAD,EXTERNAL,DLL(_ABCDllMode_)
GLO:UitslagPalletbladPlanningID LONG,THREAD,EXTERNAL,DLL(_ABCDllMode_)
GLO:UitslagPalletbladArtikelID CSTRING(21),THREAD,EXTERNAL,DLL(_ABCDllMode_)
GLO:UitslagPalletbladArtikelOms CSTRING(201),EXTERNAL,DLL(_ABCDllMode_)
GLO:UitslagPalletbladPartijID LONG,THREAD,EXTERNAL,DLL(_ABCDllMode_)
GLO:UitslagPalletbladExternVerkoopID STRING(50),THREAD,EXTERNAL,DLL(_ABCDllMode_)
GLO:UitslagPalletbladDueDate12 DATE,THREAD,EXTERNAL,DLL(_ABCDllMode_)
GLO:UitslagPalletbladProductionDate11 DATE,THREAD,EXTERNAL,DLL(_ABCDllMode_)
GLO:UitslagPalletbladSellByDate15 DATE,THREAD,EXTERNAL,DLL(_ABCDllMode_)
GLO:UitslagPalletbladOriginLiveBird CSTRING(51),EXTERNAL,DLL(_ABCDllMode_)
GLO:UitslagPalletbladOriginSlautherHouse CSTRING(51),EXTERNAL,DLL(_ABCDllMode_)
GLO:UitslagPalletbladOriginProcessing CSTRING(51),EXTERNAL,DLL(_ABCDllMode_)
GLO:UitslagPalletbladOriginPacking CSTRING(51),EXTERNAL,DLL(_ABCDllMode_)
GLO:UitslagPalletbladHarvastDate7007 DATE,EXTERNAL,DLL(_ABCDllMode_)
GLO:IngelogdeGebruiker GROUP,PRE(IGB),EXTERNAL,DLL(_ABCDllMode_)
GebruikerID            LONG
WindowsInlog           CSTRING(51)
Werkstation            CSTRING(31)
Administrator          BYTE
BekijkenPrijzen        BYTE
MakenVerkoopMutatie    BYTE
Verwerken              BYTE
                     END
GLO:PartijCelControleQ QUEUE,PRE(PCC),THREAD,EXTERNAL,DLL(_ABCDllMode_)
PartijID               LONG
CelID                  LONG
KG                     DECIMAL(9,2)
Pallets                LONG
                     END
GLO:HidePlanningInstructie BYTE,EXTERNAL,DLL(_ABCDllMode_)
LOC:OrigineelPartijCelID STRING(25),DIM(100),EXTERNAL,DLL(_ABCDllMode_)
LOC:OrigineelKG      DECIMAL(10,2),DIM(100),EXTERNAL,DLL(_ABCDllMode_)
LOC:OrigineelPallets LONG,DIM(100),EXTERNAL,DLL(_ABCDllMode_)
LOC:OrigineelArtikelID CSTRING(31),EXTERNAL,DLL(_ABCDllMode_)
LOC:AantalOrigineel  LONG,EXTERNAL,DLL(_ABCDllMode_)
LOC:Ole              LONG,EXTERNAL,DLL(_ABCDllMode_)
LOC:Bestandsnaam     STRING(200),EXTERNAL,DLL(_ABCDllMode_)
LOC:Rij              LONG,EXTERNAL,DLL(_ABCDllMode_)
LOC:HWND             ULONG,EXTERNAL,DLL(_ABCDllMode_)
LOC:WindowName       CSTRING(201),EXTERNAL,DLL(_ABCDllMode_)
SilentRunning        BYTE(0)                               ! Set true when application is running in 'silent mode'

ThisNetRefresh       class(NetRefresh),External,DLL(dll_mode)  ! Generated by NetTalk Extension (NetRefresh)
                            end
!region File Declaration
ViewArtikel          FILE,DRIVER('MSSQL'),PRE(Art),BINDABLE,THREAD,EXTERNAL(''),DLL(dll_mode) !                     
Artikel_PK               KEY(Art:ArtikelID)                !                     
Artikel_FK01             KEY(Art:ArtikelOms),DUP,NOCASE    !                     
Record                   RECORD,PRE()
ArtikelID                   CSTRING(31)                    !                     
ArtikelOms                  CSTRING(61)                    !                     
ArtikelGroep                LONG                           !                     
Prijs                       SREAL                          !                     
                         END
                     END                       

Partij               FILE,DRIVER('MSSQL'),PRE(Par),BINDABLE,THREAD,EXTERNAL(''),DLL(dll_mode) !                     
Partij_FK02              KEY(Par:Planning,Par:PartijID),DUP,NOCASE !                     
Partij_FK03              KEY(Par:InkoopID,Par:PartijID),DUP,NOCASE !                     
Partij_FK01              KEY(Par:ArtikelID,Par:PartijID),DUP,NOCASE !                     
Partij_PK                KEY(Par:PartijID),PRIMARY         !                     
Record                   RECORD,PRE()
PartijID                    LONG                           !                     
ArtikelID                   CSTRING(31)                    !                     
AanmaakDatum                STRING(8)                      !                     
AanmaakDatum_GROUP          GROUP,OVER(AanmaakDatum)       !                     
AanmaakDatum_DATE             DATE                         !                     
AanmaakDatum_TIME             TIME                         !                     
                            END                            !                     
KG                          DECIMAL(10,2)                  !                     
Pallets                     LONG                           !                     
VerpakkingID                LONG                           !                     
Leverancier                 LONG                           !                     
Verwerkt                    BYTE                           !                     
CELID                       LONG                           !                     
PalletsGeprint              LONG                           !                     
Referentie                  CSTRING(51)                    !                     
Planning                    STRING(8)                      !                     
Planning_GROUP              GROUP,OVER(Planning)           !                     
Planning_DATE                 DATE                         !                     
Planning_TIME                 TIME                         !                     
                            END                            !                     
Planinstructie              CSTRING(101)                   !                     
InslagQATemperatuur1        CSTRING(21)                    !                     
ExternPartijnr              CSTRING(21)                    !                     
BerekendeInkoopKGPrijs      DECIMAL(10,3)                  !                     
InkoopID                    LONG                           !                     
InkoopPlanningID            LONG                           !                     
InkoopKGPrijs               DECIMAL(10,3)                  ! Zonder transport/extrakosten
InslagQATransportmiddelSchoon BYTE                         !                     
InslagQAVerpakkingSchoonGesloten BYTE                      !                     
InslagQAIdentificatieMerkenVerpakking BYTE                 !                     
InslagQAUitgevoerdDoor      CSTRING(41)                    !                     
InslagQATemperatuur2        CSTRING(21)                    !                     
InslagQATemperatuur3        CSTRING(21)                    !                     
InslagQAActieAfwijkingen    CSTRING(2001)                  !                     
VerpakkingKlasseID          LONG                           !                     
CorrigerendeMaatregel       CSTRING(2001)                  !                     
Afgehandeld                 CSTRING(2001)                  !                     
InslagQAIsGeurKleurProductEigen BYTE                       !                     
InslagQAGeenGlasbreuk       BYTE                           !                     
InslagQATemperatuurVervoermiddel CSTRING(21)               !                     
CorrectieveMaatregel        CSTRING(2001)                  !                     
Oorzaak                     CSTRING(2001)                  !                     
TransportBedrijf            CSTRING(2001)                  !                     
                         END
                     END                       

Relatie              FILE,DRIVER('MSSQL'),PRE(Rel),BINDABLE,THREAD,EXTERNAL(''),DLL(dll_mode) !                     
Relatie_FK02             KEY(Rel:Country),DUP,NOCASE,OPT   !                     
Relatie_FK01             KEY(Rel:FirmaNaam),DUP            !                     
Relatie_PK               KEY(Rel:RelatieID)                !                     
Record                   RECORD,PRE()
RelatieID                   LONG                           !                     
FirmaNaam                   STRING(50)                     !                     
Adres1                      CSTRING(101)                   !                     
Adres2                      CSTRING(101)                   !                     
Postcode                    CSTRING(21)                    !                     
Plaats                      CSTRING(101)                   !                     
Telefoon                    STRING(25)                     !                     
Mobiel                      CSTRING(31)                    !                     
Fax                         STRING(25)                     !                     
Type                        STRING(1)                      !                     
Country                     CSTRING(61)                    !                     
ItemCode                    STRING(2)                      !                     
PaymentCondition            STRING(2)                      !                     
PalletBladRapportHeaderImage CSTRING(513)                  !                     
Note                        CSTRING(4001)                  !                     
LotID                       LONG                           !                     
OpenstaandSaldo             REAL                           !                     
CreditLine                  REAL                           !                     
DagenOud                    LONG                           !                     
Code                        STRING(20)                     !                     
Acc_Man                     LONG                           !                     
VatCode                     STRING(3)                      !                     
cmp_fctry                   STRING(3)                      !                     
CMROpmerking                CSTRING(1001)                  !                     
PalletBladLayout            CSTRING(51)                    !                     
                         END
                     END                       

Verpakking           FILE,DRIVER('MSSQL'),PRE(Ver),BINDABLE,THREAD,EXTERNAL(''),DLL(dll_mode) !                     
Verpakking_PK            KEY(Ver:VerpakkingID)             !                     
Record                   RECORD,PRE()
VerpakkingID                LONG                           !                     
VerpakkingOmschrijving      CSTRING(51)                    !                     
Description                 CSTRING(51)                    !                     
InhoudKG                    DECIMAL(7,3)                   !                     
                         END
                     END                       

ViewVoorraadPlanning FILE,DRIVER('MSSQL'),PRE(VVP),BINDABLE,THREAD,EXTERNAL(''),DLL(dll_mode) !                     
ViewVoorraad_PK          KEY(VVP:ArtikelOms,VVP:ArtikelID),NOCASE,PRIMARY !                     
ViewVoorraad_FK2         KEY(VVP:ArtikelID),DUP,NOCASE     !                     
Record                   RECORD,PRE()
ArtikelID                   CSTRING(31)                    !                     
ArtikelOms                  CSTRING(61)                    !                     
InslagKG                    REAL                           !                     
InslagPallets               LONG                           !                     
UitslagKG                   REAL                           !                     
UitslagPallets              LONG                           !                     
InkoopKG                    REAL                           !                     
InkoopPallets               LONG                           !                     
VerkoopKG                   REAL                           !                     
VerkoopPallets              LONG                           !                     
                         END
                     END                       

Cel                  FILE,DRIVER('MSSQL'),PRE(CEL),BINDABLE,THREAD,EXTERNAL(''),DLL(dll_mode) !                     
CEL_PK                   KEY(CEL:CelID),NOCASE,PRIMARY     !                     
Record                   RECORD,PRE()
CelID                       LONG                           !                     
CelOms                      CSTRING(51)                    !                     
Breedte                     LONG                           !                     
Lengte                      LONG                           !                     
                         END
                     END                       

Mutatie              FILE,DRIVER('MSSQL'),PRE(Mut),BINDABLE,THREAD,EXTERNAL(''),DLL(dll_mode) !                     
Mutatie_PK               KEY(Mut:MutatieID),NOCASE,PRIMARY !                     
Mutatie_FK01             KEY(Mut:PartijID,Mut:DatumTijd),DUP,NOCASE !                     
Mutatie_FK02             KEY(Mut:PlanningID,Mut:MutatieID),DUP,NOCASE !                     
Mutatie_FK03             KEY(Mut:ArtikelID,Mut:DatumTijd),DUP,NOCASE ! Op ArtikelID/DatumTijd
Mutatie_FK04             KEY(Mut:BulkOverboekingID,Mut:MutatieID),DUP,NOCASE !                     
Record                   RECORD,PRE()
MutatieID                   LONG,NAME('MutatieID | READONLY') !                     
DatumTijd                   STRING(8)                      !                     
DatumTijd_GROUP             GROUP,OVER(DatumTijd)          !                     
DatumTijd_DATE                DATE                         !                     
DatumTijd_TIME                TIME                         !                     
                            END                            !                     
PartijID                    LONG                           !                     
CelID                       LONG                           !                     
InslagKG                    DECIMAL(10,2)                  !                     
InslagPallet                LONG                           !                     
UitslagKG                   DECIMAL(10,2)                  !                     
UitslagPallet               LONG                           !                     
UitslagID                   LONG                           !                     
SoortMutatie                STRING(4)                      !                     
NaarCELID                   LONG                           !                     
RedenAfboeking              CSTRING(41)                    !                     
ArtikelID                   CSTRING(31)                    !                     
PlanningID                  LONG                           !                     
BulkOverboekingID           LONG                           !                     
CelLocatieID                LONG                           !                     
UitslagQATransportmiddelSchoon BYTE                        !                     
UitslagQAVerpakkingSchoonGesloten BYTE                     !                     
UitslagQAIdentificatieMerkenVerpakking BYTE                !                     
UitslagQATemperatuur1       CSTRING(21)                    !                     
UitslagQATemperatuur2       CSTRING(21)                    !                     
UitslagQATemperatuur3       CSTRING(21)                    !                     
UitslagQAActieAfwijkingen   CSTRING(2001)                  !                     
UitslagQAUitgevoerdDoor     CSTRING(41)                    !                     
UitslagPalletbladDueDate12  STRING(8)                      !                     
UitslagPalletbladDueDate12_GROUP GROUP,OVER(UitslagPalletbladDueDate12) !                     
UitslagPalletbladDueDate12_DATE DATE                       !                     
UitslagPalletbladDueDate12_TIME TIME                       !                     
                            END                            !                     
UitslagPalletbladProductionDate11 STRING(8)                !                     
UitslagPalletbladProductionDate11_GROUP GROUP,OVER(UitslagPalletbladProductionDate11) !                     
UitslagPalletbladProductionDate11_DATE DATE                !                     
UitslagPalletbladProductionDate11_TIME TIME                !                     
                            END                            !                     
UitslagPalletbladSellByDate15 STRING(8)                    !                     
UitslagPalletbladSellByDate15_GROUP GROUP,OVER(UitslagPalletbladSellByDate15) !                     
UitslagPalletbladSellByDate15_DATE DATE                    !                     
UitslagPalletbladSellByDate15_TIME TIME                    !                     
                            END                            !                     
AlternatieveArtikelOms      CSTRING(201)                   !                     
AantalVerpakkingen          LONG                           !                     
UitslagPalletbladOriginLiveBird CSTRING(51)                !                     
UitslagPalletbladOriginSlautherHouse CSTRING(51)           !                     
UitslagPalletbladOriginProcessing CSTRING(51)              !                     
UitslagPalletbladOriginPacking CSTRING(51)                 !                     
CorrigerendeMaatregel       CSTRING(2001)                  !                     
Afgehandeld                 CSTRING(2001)                  !                     
UitslagQAIsGeurKleurProductEigen BYTE                      !                     
UitslagQAGeenGlasbreuk      BYTE                           !                     
CorrectieveMaatregel        CSTRING(2001)                  !                     
UitslagQATemperatuurVervoermiddel CSTRING(21)              !                     
OverboekSoort               CSTRING(51)                    !                     
OverboekCelLocatieID        LONG                           !                     
NieuwKG                     DECIMAL(10,2)                  !                     
NieuwPallets                LONG                           !                     
UitslagPalletbladHarvastDate7007 STRING(8)                 !                     
UitslagPalletbladHarvastDate7007_GROUP GROUP,OVER(UitslagPalletbladHarvastDate7007) !                     
UitslagPalletbladHarvastDate7007_DATE DATE                 !                     
UitslagPalletbladHarvastDate7007_TIME TIME                 !                     
                            END                            !                     
Oorzaak                     CSTRING(2001)                  !                     
TransportBedrijf            CSTRING(2001)                  !                     
                         END
                     END                       

Inkoop               FILE,DRIVER('MSSQL'),PRE(Ink),BINDABLE,THREAD,EXTERNAL(''),DLL(dll_mode) !                     
PK_Inkoop                KEY(Ink:InkoopID),PRIMARY         !                     
Inkoop_FK01              KEY(Ink:Planning),DUP,NOCASE      ! Op Planning         
Verwerkt_InkoopID_K      KEY(Ink:Verwerkt,Ink:InkoopID),DUP,NOCASE !                     
Verwerkt_InkoopIDD_K     KEY(Ink:Verwerkt,-Ink:InkoopID),DUP,NOCASE !                     
Verwerkt_Planning_K      KEY(Ink:Verwerkt,Ink:Planning,Ink:InkoopID),DUP,NOCASE !                     
Verwerkt_PlanningD_K     KEY(Ink:Verwerkt,-Ink:Planning,-Ink:InkoopID),DUP,NOCASE !                     
Leverancier_Verwerkt_Planning_K KEY(Ink:Leverancier,Ink:Verwerkt,Ink:Planning,Ink:InkoopID),DUP,NOCASE !                     
Leverancier_Verwerkt_PlanningD_K KEY(Ink:Leverancier,Ink:Verwerkt,-Ink:Planning,-Ink:InkoopID),DUP,NOCASE !                     
LeverancierAlternatiefAdres_K KEY(Ink:LeverancierAlternatiefAdres),DUP,NOCASE !                     
Record                   RECORD,PRE()
InkoopID                    LONG,NAME('InkoopID | READONLY') !                     
Leverancier                 LONG                           !                     
Verwerkt                    BYTE                           !                     
Planning                    STRING(8)                      !                     
Planning_GROUP              GROUP,OVER(Planning)           !                     
Planning_DATE                 DATE                         !                     
Planning_TIME                 TIME                         !                     
                            END                            !                     
Instructie                  CSTRING(101)                   !                     
Transport                   CSTRING(101)                   !                     
LeverancierAlternatiefAdres LONG                           !                     
ExtraKosten                 DECIMAL(10,3)                  !                     
ExtraKostenTekst            CSTRING(1025)                  !                     
TransportKosten             DECIMAL(10,3)                  !                     
RedenRetour                 CSTRING(51)                    !                     
RetourDatum                 STRING(8)                      !                     
RetourDatum_GROUP           GROUP,OVER(RetourDatum)        !                     
RetourDatum_DATE              DATE                         !                     
RetourDatum_TIME              TIME                         !                     
                            END                            !                     
ConfirmationDate            STRING(8)                      !                     
ConfirmationDate_GROUP      GROUP,OVER(ConfirmationDate)   !                     
ConfirmationDate_DATE         DATE                         !                     
ConfirmationDate_TIME         TIME                         !                     
                            END                            !                     
GebruikerID                 LONG                           !                     
BevestigingGeprint          STRING(8)                      !                     
BevestigingGeprint_GROUP    GROUP,OVER(BevestigingGeprint) !                     
BevestigingGeprint_DATE       DATE                         !                     
BevestigingGeprint_TIME       TIME                         !                     
                            END                            !                     
DeliveryTermsID             LONG                           !                     
LoadingDate                 CSTRING(51)                    !                     
                         END
                     END                       

Planning             FILE,DRIVER('MSSQL'),PRE(Pla),BINDABLE,THREAD,EXTERNAL(''),DLL(dll_mode) !                     
Datum_Tijd_K             KEY(Pla:Planning,Pla:PlanningID),DUP !                     
OverboekingCelID_Planning_K KEY(Pla:OverboekingCelID,Pla:Planning,Pla:PlanningID),DUP !                     
PK_Planning              KEY(Pla:PlanningID),PRIMARY       !                     
Planning_FK01            KEY(Pla:InkoopID,Pla:PlanningID),DUP,NOCASE ! Op InkoopID/Planning
Planning_FK02            KEY(Pla:VerkoopID,Pla:PlanningID),DUP ! Op VerkoopID. PlanningID
Planning_FK03            KEY(Pla:Planning),DUP             ! Op Planning         
Verwerkt_Artikel_Planning_K KEY(Pla:Verwerkt,Pla:ArtikelID,Pla:PlanningID),DUP !                     
Verwerkt_OverboekingCelID_Planning_K KEY(Pla:Verwerkt,Pla:OverboekingCelID,Pla:Planning,Pla:PlanningID),DUP !                     
Record                   RECORD,PRE()
PlanningID                  LONG,NAME('PlanningID | READONLY') !                     
VerkoopID                   LONG                           !                     
InkoopID                    LONG                           !                     
ArtikelID                   CSTRING(31)                    !                     
KG                          DECIMAL(10,2)                  !                     
Pallets                     LONG                           !                     
Planning                    STRING(8)                      !                     
Planning_GROUP              GROUP,OVER(Planning)           !                     
Planning_DATE                 DATE                         !                     
Planning_TIME                 TIME                         !                     
                            END                            !                     
VerpakkingID                LONG                           !                     
CelID                       LONG                           !                     
PartijID                    LONG                           !                     
Memo                        CSTRING(101)                   !                     
MutatieGemaakt              BYTE                           !                     
Geprint                     BYTE                           !                     
Verwerkt                    BYTE                           !                     
Leverancier                 LONG                           !                     
OverboekingCelID            LONG                           !                     
Instructie                  CSTRING(101)                   !                     
Transport                   CSTRING(101)                   !                     
Gewogen                     BYTE                           !                     
CelLocatieID                LONG                           !                     
MutatieKG                   DECIMAL(10,2)                  !                     
MutatiePallets              LONG                           !                     
OverboekingPlanningID       LONG                           ! Overboeking gelinkt aan een bepaalde verkoopregel (en vice versa)
InkoopKGPrijs               DECIMAL(10,3)                  !                     
VerkoopKGPrijs              DECIMAL(10,3)                  !                     
UitslagPalletbladDueDate12  STRING(8)                      !                     
UitslagPalletbladDueDate12_GROUP GROUP,OVER(UitslagPalletbladDueDate12) !                     
UitslagPalletbladDueDate12_DATE DATE                       !                     
UitslagPalletbladDueDate12_TIME TIME                       !                     
                            END                            !                     
UitslagPalletbladProductionDate11 STRING(8)                !                     
UitslagPalletbladProductionDate11_GROUP GROUP,OVER(UitslagPalletbladProductionDate11) !                     
UitslagPalletbladProductionDate11_DATE DATE                !                     
UitslagPalletbladProductionDate11_TIME TIME                !                     
                            END                            !                     
UitslagPalletbladSellByDate15 STRING(8)                    !                     
UitslagPalletbladSellByDate15_GROUP GROUP,OVER(UitslagPalletbladSellByDate15) !                     
UitslagPalletbladSellByDate15_DATE DATE                    !                     
UitslagPalletbladSellByDate15_TIME TIME                    !                     
                            END                            !                     
AlternatieveArtikelOms      CSTRING(201)                   !                     
VerpakkingKlasseID          LONG                           !                     
AantalVerpakkingen          LONG                           !                     
UitslagPalletbladOriginLiveBird CSTRING(51)                !                     
UitslagPalletbladOriginSlautherHouse CSTRING(51)           !                     
UitslagPalletbladOriginProcessing CSTRING(20)              !                     
UitslagPalletbladOriginPacking CSTRING(20)                 !                     
Valuta                      CSTRING(51)                    !                     
Koersverschil               DECIMAL(11,3)                  !                     
ExtraKosten                 DECIMAL(10,3)                  !                     
LotID                       LONG                           !                     
PlantNumber                 CSTRING(51)                    !                     
DeliveryDate                STRING(8)                      !                     
DeliveryDate_GROUP          GROUP,OVER(DeliveryDate)       !                     
DeliveryDate_DATE             DATE                         !                     
DeliveryDate_TIME             TIME                         !                     
                            END                            !                     
PlanningIDRetour            LONG                           !                     
PlanningIDParent            LONG                           !                     
Aanvulling                  CSTRING(101)                   !                     
Dozen                       LONG                           !                     
GrossWeight                 DECIMAL(8,3)                   !                     
OverboekSoort               CSTRING(51)                    !                     
OverboekCelLocatieID        LONG                           !                     
NieuwKG                     DECIMAL(10,2)                  !                     
NieuwPallets                LONG                           !                     
UitslagPalletbladHarvastDate7007 STRING(8)                 !                     
UitslagPalletbladHarvastDate7007_GROUP GROUP,OVER(UitslagPalletbladHarvastDate7007) !                     
UitslagPalletbladHarvastDate7007_DATE DATE                 !                     
UitslagPalletbladHarvastDate7007_TIME TIME                 !                     
                            END                            !                     
                         END
                     END                       

Verkoop              FILE,DRIVER('MSSQL'),PRE(Ver2),BINDABLE,THREAD,EXTERNAL(''),DLL(dll_mode) !                     
Verkoop_FK2              KEY(Ver2:Exported,Ver2:VerkoopID),DUP ! Op Exported/VerkoopID
Verkoop_FK3              KEY(Ver2:Exported,Ver2:Klant,-Ver2:VerkoopID),DUP ! Op Exported, Klant, Verkoop
PK_Verkoop               KEY(Ver2:VerkoopID),PRIMARY       !                     
Verkoop_FK01             KEY(Ver2:Planning),DUP            !                     
Klant_Verwerkt_Planning_K KEY(Ver2:Klant,Ver2:Verwerkt,Ver2:Planning,Ver2:VerkoopID),DUP,NOCASE !                     
Klant_Verwerkt_PlanningD_K KEY(Ver2:Klant,Ver2:Verwerkt,-Ver2:Planning,-Ver2:VerkoopID),DUP,NOCASE !                     
Verwerkt_VerkoopID_K     KEY(Ver2:Verwerkt,Ver2:VerkoopID),DUP,NOCASE !                     
Verwerkt_VerkoopIDD_K    KEY(Ver2:Verwerkt,-Ver2:VerkoopID),DUP,NOCASE !                     
Verwerkt_Planning_K      KEY(Ver2:Verwerkt,Ver2:Planning,Ver2:VerkoopID),DUP,NOCASE !                     
Verwerkt_PlanningD_K     KEY(Ver2:Verwerkt,-Ver2:Planning,-Ver2:VerkoopID),DUP,NOCASE !                     
KlantAlternatiefAdres_K  KEY(Ver2:KlantAlternatiefAdres),DUP,NOCASE !                     
Record                   RECORD,PRE()
VerkoopID                   LONG,NAME('VerkoopID | READONLY') !                     
Klant                       LONG                           !                     
Verwerkt                    BYTE                           !                     
Planning                    STRING(8)                      !                     
Planning_GROUP              GROUP,OVER(Planning)           !                     
Planning_DATE                 DATE                         !                     
Planning_TIME                 TIME                         !                     
                            END                            !                     
Instructie                  CSTRING(101)                   !                     
Transport                   CSTRING(101)                   !                     
KlantAlternatiefAdres       LONG                           !                     
ExtraKosten                 DECIMAL(10,3)                  !                     
ExtraKostenTekst            CSTRING(1025)                  !                     
ExternVerkoopID             CSTRING(51)                    !                     
NegatieveOrder              CSTRING(51)                    !                     
RedenRetour                 CSTRING(51)                    !                     
ConfirmationDate            STRING(8)                      !                     
ConfirmationDate_GROUP      GROUP,OVER(ConfirmationDate)   !                     
ConfirmationDate_DATE         DATE                         !                     
ConfirmationDate_TIME         TIME                         !                     
                            END                            !                     
GebruikerID                 LONG                           !                     
BevestigingGeprint          STRING(8)                      !                     
BevestigingGeprint_GROUP    GROUP,OVER(BevestigingGeprint) !                     
BevestigingGeprint_DATE       DATE                         !                     
BevestigingGeprint_TIME       TIME                         !                     
                            END                            !                     
DeliveryTermsID             LONG                           !                     
RetourDatum                 STRING(8)                      !                     
RetourDatum_GROUP           GROUP,OVER(RetourDatum)        !                     
RetourDatum_DATE              DATE                         !                     
RetourDatum_TIME              TIME                         !                     
                            END                            !                     
Exported                    BYTE                           !                     
Valuta                      CSTRING(51)                    !                     
Koersverschil               DECIMAL(11,3)                  !                     
Containernr                 CSTRING(51)                    !                     
Sealnr                      CSTRING(51)                    !                     
Vessel                      CSTRING(51)                    !                     
ProFormaMemo                CSTRING(4001)                  !                     
TarraContainer              LONG                           !                     
Laadhaven                   CSTRING(51)                    !                     
Loshaven                    CSTRING(51)                    !                     
Boekingsnr                  CSTRING(51)                    !                     
BESCWaiver                  CSTRING(21)                    !                     
ExpresseRelease             LONG                           !                     
Aan                         CSTRING(51)                    !                     
OmschrijvingGoederen        CSTRING(4001)                  !                     
PaymentCondition            STRING(2)                      !                     
                         END
                     END                       

Sjabloon             FILE,DRIVER('MSSQL'),PRE(Sja),BINDABLE,THREAD,EXTERNAL(''),DLL(dll_mode) ! Word sjablonen      
Sjabloon_PK              KEY(Sja:SjabloonID),NOCASE,PRIMARY !                     
Record                   RECORD,PRE()
SjabloonID                  CSTRING(20)                    !                     
Bestandsnaam                CSTRING(99)                    !                     
SoortSjabloon               STRING(1)                      !                     
SoortData                   CSTRING(51)                    !                     
                         END
                     END                       

ViewVoorraadCelTotaal FILE,DRIVER('MSSQL'),PRE(VVCT),BINDABLE,THREAD,EXTERNAL(''),DLL(dll_mode) !                     
ViewVoorraadCelTotaal_PK KEY(VVCT:CeliD,VVCT:ArtikelOms,VVCT:ArtikelID),DUP,NOCASE !                     
Record                   RECORD,PRE()
ArtikelID                   CSTRING(31)                    !                     
CeliD                       LONG                           !                     
kg                          REAL                           !                     
pallets                     LONG                           !                     
VerkoopKG                   REAL                           !                     
VerkoopPallet               LONG                           !                     
ArtikelOms                  CSTRING(61)                    !                     
                         END
                     END                       

VoorraadVerloop      FILE,DRIVER('MSSQL'),PRE(VVL),BINDABLE,THREAD,EXTERNAL(''),DLL(dll_mode) !                     
ArtikelID_DatumTijdD_MutatieID_K KEY(VVL:ArtikelID,-VVL:DatumTijd,VVL:MutatieID),DUP,NOCASE !                     
ArtikelID_DatumTijdD_MutatieIDD_K KEY(VVL:ArtikelID,-VVL:DatumTijd,-VVL:MutatieID),DUP,NOCASE !                     
ArtikelID_DatumTijd_MutatieID_K KEY(VVL:ArtikelID,VVL:DatumTijd,VVL:MutatieID),DUP,NOCASE !                     
ArtikelID_PartijID_DatumTijd_MutatieID_K KEY(VVL:ArtikelID,VVL:PartijID,VVL:DatumTijd,VVL:MutatieID),DUP,NOCASE !                     
ArtikelID_PartijID_DatumTijdD_MutatieID_K KEY(VVL:ArtikelID,VVL:PartijID,-VVL:DatumTijd,VVL:MutatieID),DUP,NOCASE !                     
ArtikelID_PartijID_DatumTijdD_MutatieIDD_K KEY(VVL:ArtikelID,VVL:PartijID,-VVL:DatumTijd,-VVL:MutatieID),DUP,NOCASE !                     
ArtikelID_CelID_DatumTijdD_MutatieIDD_K KEY(VVL:ArtikelID,VVL:CelID,-VVL:DatumTijd,-VVL:MutatieID),DUP,NOCASE !                     
ArtikelID_CelID_DatumTijdD_MutatieID_K KEY(VVL:ArtikelID,VVL:CelID,-VVL:DatumTijd,VVL:MutatieID),DUP,NOCASE !                     
Record                   RECORD,PRE()
MutatieID                   LONG                           !                     
DatumTijd                   STRING(8)                      !                     
DatumTijd_GROUP             GROUP,OVER(DatumTijd)          !                     
DatumTijd_DATE                DATE                         !                     
DatumTijd_TIME                TIME                         !                     
                            END                            !                     
PartijID                    LONG                           !                     
ArtikelID                   CSTRING(31)                    !                     
SoortMutatie                STRING(4)                      !                     
InslagKG                    REAL                           !                     
InslagPallet                LONG                           !                     
UitslagKG                   REAL                           !                     
UitslagPallet               LONG                           !                     
CelID                       LONG                           !                     
NaarCELID                   LONG                           !                     
PartijRelatie               STRING(50)                     !                     
Verwerkt                    BYTE                           !                     
ExternPartijnr              CSTRING(21)                    !                     
Referentie                  CSTRING(51)                    !                     
PlanningID                  LONG                           !                     
PartijLeverancier           LONG                           !                     
InkoopID                    LONG                           !                     
VerkoopID                   LONG                           !                     
VerkoopRelatieID            LONG                           !                     
VerkoopRelatie              STRING(50)                     !                     
InkoopRelatieID             LONG                           !                     
InkoopRelatie               STRING(50)                     !                     
VerpakkingID                LONG                           !                     
VerpakkingOmschrijving      CSTRING(51)                    !                     
CelLocatieID                LONG                           !                     
Locatienaam                 CSTRING(51)                    !                     
BerekendeInkoopKGPrijs      DECIMAL(10,3)                  !                     
VerkoopKGPrijs              DECIMAL(10,3)                  !                     
CelOms                      CSTRING(51)                    !                     
                         END
                     END                       

PalletMutatie        FILE,DRIVER('MSSQL'),PRE(Pal),BINDABLE,THREAD,EXTERNAL(''),DLL(dll_mode) !                     
PalletMutatie_PK         KEY(Pal:PalletMutatieID)          !                     
PalletMutatie_FK1        KEY(Pal:PalletSoortID,Pal:PalletMutatieID),DUP ! PalletSoortID_PalletMutatieID_K
PalletMutatie_FK2        KEY(Pal:RelatieID,Pal:PalletSoortID,Pal:PalletMutatieID),DUP ! RelatieID_PalletSoortID_PalletMutatie_K
PalletMutatie_FK3        KEY(Pal:PlanningID,Pal:PalletMutatieID),DUP,NAME('PlanningID_PalletMutatie_K') !                     
PalletMutatie_FK4        KEY(Pal:VerkoopID,Pal:PalletMutatieID),DUP,NOCASE ! Op VerkoopID_PalletMutatie_K
PalletMutatie_FK5        KEY(Pal:VerkoopID,Pal:PalletSoortID,Pal:Transporteur),NAME('Op VerkoopID/PalletSoortID/Transporteur'),NOCASE !                     
Record                   RECORD,PRE()
PalletMutatieID             LONG                           !                     
PalletSoortID               LONG                           ! 1=H1|2=1-way|3=Euro|4=CKW
PlanningID                  LONG                           !                     
RelatieID                   LONG                           !                     
Inkomend                    LONG                           !                     
Uitgaand                    LONG                           !                     
Transporteur                BYTE                           !                     
DatumTijd                   STRING(8)                      !                     
DatumTijd_GROUP             GROUP,OVER(DatumTijd)          !                     
DatumTijd_DATE                DATE                         !                     
DatumTijd_TIME                TIME                         !                     
                            END                            !                     
Opmerking                   CSTRING(51)                    !                     
VerkoopID                   LONG                           !                     
TransporteurPalletMutatieID LONG                           !                     
                         END
                     END                       

PalletVerloop        FILE,DRIVER('MSSQL'),PRE(Pal3),BINDABLE,THREAD,EXTERNAL(''),DLL(dll_mode) !                     
PalletVerloop_FK1        KEY(Pal3:PalletSoortID,-Pal3:Planning,Pal3:PalletMutatieID),NOCASE,OPT ! Op PalletSoort/Planning (DESC)/ID
PalletVerloop_FK2        KEY(Pal3:RelatieID,Pal3:PalletSoortID,-Pal3:Planning,Pal3:PalletMutatieID),NOCASE,OPT ! Op RelatieID/PalletSoort/Planning (DESC)/ID
PalletVerloop_PK         KEY(Pal3:PalletMutatieID),DUP,NOCASE !                     
Record                   RECORD,PRE()
PalletMutatieID             LONG                           !                     
RelatieID                   LONG                           !                     
FirmaNaam                   CSTRING(51)                    !                     
PalletSoortID               LONG                           !                     
VerkoopID                   LONG                           !                     
Inkomend                    LONG                           !                     
Uitgaand                    LONG                           !                     
Transporteur                BYTE                           !                     
InMinUit                    LONG                           !                     
Saldo                       LONG                           !                     
SaldoTotaal                 LONG                           !                     
Planning                    STRING(8)                      !                     
Planning_GROUP              GROUP,OVER(Planning)           !                     
Planning_DATE                 DATE                         !                     
Planning_TIME                 TIME                         !                     
                            END                            !                     
Opmerking                   CSTRING(51)                    !                     
                         END
                     END                       

ViewTransporteur     FILE,DRIVER('MSSQL'),PRE(VTRA),BINDABLE,THREAD,EXTERNAL(''),DLL(dll_mode) !                     
ViewTransporteur_PK      KEY(VTRA:TransporteurID),DUP,NOCASE !                     
ViewTransporteur_FK1     KEY(VTRA:RelatieID),DUP,NOCASE    ! Op RelatieID        
Record                   RECORD,PRE()
TransporteurID              LONG                           !                     
RelatieID                   LONG                           !                     
FirmaNaam                   STRING(50)                     !                     
Adres1                      CSTRING(101)                   !                     
Adres2                      CSTRING(101)                   !                     
Postcode                    CSTRING(21)                    !                     
Plaats                      CSTRING(101)                   !                     
Telefoon                    STRING(25)                     !                     
Mobiel                      CSTRING(31)                    !                     
Fax                         STRING(25)                     !                     
                         END
                     END                       

ViewVoorraadPartij   FILE,DRIVER('MSSQL'),PRE(VVPar),BINDABLE,THREAD,EXTERNAL(''),DLL(dll_mode) !                     
ExternPartijnr_PartijID_CelID_K KEY(VVPar:ExternPartijnr,VVPar:PartijID,VVPar:CelID),DUP,NOCASE !                     
PartijID_CelID_K         KEY(VVPar:PartijID,VVPar:CelID),DUP,NOCASE !                     
PartijCelID_K            KEY(VVPar:PartijCelID),DUP,NOCASE !                     
ArtikelID_PartijID_CelID_K KEY(VVPar:ArtikelID,-VVPar:PartijID,VVPar:CelID),DUP,NOCASE !                     
ArtikelOms_PartijID_CelID_K KEY(VVPar:ArtikelOms,VVPar:PartijID,VVPar:CelID),DUP,NOCASE !                     
ArtikelID_CelID_PartijID_K KEY(VVPar:ArtikelID,VVPar:CelID,VVPar:PartijID),DUP,NOCASE !                     
Record                   RECORD,PRE()
PartijID                    LONG                           !                     
ArtikelID                   CSTRING(31)                    !                     
ArtikelOms                  CSTRING(61)                    !                     
CelID                       LONG                           !                     
ExternPartijnr              CSTRING(21)                    !                     
AanmaakDatum                STRING(8)                      !                     
AanmaakDatum_GROUP          GROUP,OVER(AanmaakDatum)       !                     
AanmaakDatum_DATE             DATE                         !                     
AanmaakDatum_TIME             TIME                         !                     
                            END                            !                     
CelOms                      CSTRING(51)                    !                     
VerpakkingID                LONG                           !                     
VerpakkingOmschrijving      CSTRING(51)                    !                     
LeverancierFirmanaam        STRING(50)                     !                     
InslagKG                    REAL                           !                     
InslagPallets               LONG                           !                     
UitslagKG                   REAL                           !                     
UitslagPallets              LONG                           !                     
VoorraadKG                  REAL                           !                     
VoorraadPallets             LONG                           !                     
PartijCelID                 CSTRING(26)                    !                     
CelLocatieID                LONG                           !                     
Locatienaam                 CSTRING(51)                    !                     
BerekendeInkoopKGPrijs      DECIMAL(10,3)                  !                     
                         END
                     END                       

ViewPlanningPartij   FILE,DRIVER('MSSQL'),PRE(VPPar),BINDABLE,THREAD,EXTERNAL(''),DLL(dll_mode) !                     
PartijID_CelID_K         KEY(VPPar:PartijID,VPPar:CelID),DUP,NOCASE !                     
PartijCelID_K            KEY(VPPar:PartijCelID),DUP,NOCASE !                     
ArtikelID_PartijID_CelID_K KEY(VPPar:ArtikelID,-VPPar:PartijID,VPPar:CelID),DUP,NOCASE !                     
ArtikelOms_PartijID_CelID_K KEY(VPPar:ArtikelOms,VPPar:PartijID,VPPar:CelID),DUP,NOCASE !                     
Record                   RECORD,PRE()
PartijID                    LONG                           !                     
ArtikelID                   CSTRING(31)                    !                     
ArtikelOms                  CSTRING(61)                    !                     
CelID                       LONG                           !                     
ExternPartijnr              CSTRING(21)                    !                     
AanmaakDatum                STRING(8)                      !                     
AanmaakDatum_GROUP          GROUP,OVER(AanmaakDatum)       !                     
AanmaakDatum_DATE             DATE                         !                     
AanmaakDatum_TIME             TIME                         !                     
                            END                            !                     
CelOms                      CSTRING(51)                    !                     
VerpakkingOmschrijving      CSTRING(51)                    !                     
LeverancierFirmanaam        STRING(50)                     !                     
VerkoopKG                   DECIMAL(12,2)                  !                     
VerkoopPallets              LONG                           !                     
PartijCelID                 CSTRING(26)                    !                     
                         END
                     END                       

ArtikelOmschrijvingExtra FILE,DRIVER('MSSQL'),PRE(Art2),BINDABLE,THREAD,EXTERNAL(''),DLL(dll_mode) !                     
PK_ArtikelOmschrijvingExtra KEY(Art2:ex_artcode,Art2:artcode),DUP,NOCASE ! Op ex_artcode / artcode
Record                   RECORD,PRE()
ID                          LONG                           !                     
ex_artcode                  STRING(2),NAME('"ex_artcode"') !                     
artcode                     STRING(30)                     !                     
tekst                       STRING(160)                    !                     
                         END
                     END                       

CelLocatie           FILE,DRIVER('MSSQL'),PRE(CL),BINDABLE,THREAD,EXTERNAL(''),DLL(dll_mode) !                     
PK_CelLocatie            KEY(CL:CelLocatieID),NOCASE,PRIMARY !                     
FK_CelLocatie            KEY(CL:CelID,CL:CelLocatieID),DUP,NOCASE !                     
Record                   RECORD,PRE()
CelLocatieID                LONG                           !                     
CelID                       LONG                           !                     
Locatienaam                 CSTRING(51)                    !                     
XPos                        LONG                           !                     
YPos                        LONG                           !                     
Breedte                     LONG                           !                     
Lengte                      LONG                           !                     
Hoogte                      LONG                           !                     
Direction                   CSTRING(51)                    !                     
                         END
                     END                       

ViewPartijCelLocaties FILE,DRIVER('MSSQL'),PRE(VPCL),BINDABLE,THREAD,EXTERNAL(''),DLL(dll_mode) !                     
ViewPartijCelLocaties_PK KEY(VPCL:PartijID,VPCL:CelID,VPCL:CelLocatieID),NOCASE,PRIMARY !                     
Record                   RECORD,PRE()
PartijID                    LONG                           !                     
CelID                       LONG                           !                     
CelLocatieID                LONG                           !                     
CelLocatienaam              CSTRING(51)                    !                     
KG                          LONG                           !                     
Pallet                      LONG                           !                     
                         END
                     END                       

ViewVoorraadPartij_INDEXED FILE,DRIVER('MSSQL'),PRE(VVParI),BINDABLE,THREAD,EXTERNAL(''),DLL(dll_mode) !                     
ExternPartijnr_PartijID_CelID_K KEY(VVParI:ExternPartijnr,VVParI:PartijID,VVParI:CelID),DUP,NOCASE !                     
PartijID_CelID_K         KEY(VVParI:PartijID,VVParI:CelID),DUP,NOCASE !                     
ArtikelID_PartijID_CelID_K KEY(VVParI:ArtikelID,-VVParI:PartijID,VVParI:CelID),DUP,NOCASE !                     
ArtikelOms_PartijID_CelID_K KEY(VVParI:ArtikelOms,VVParI:PartijID,VVParI:CelID),DUP,NOCASE !                     
ArtikelID_CelID_PartijID_K KEY(VVParI:ArtikelID,VVParI:CelID,VVParI:PartijID),DUP,NOCASE !                     
Record                   RECORD,PRE()
PartijID                    LONG                           !                     
ArtikelID                   CSTRING(31)                    !                     
ArtikelOms                  CSTRING(61)                    !                     
CelID                       LONG                           !                     
ExternPartijnr              CSTRING(21)                    !                     
AanmaakDatum                STRING(8)                      !                     
AanmaakDatum_GROUP          GROUP,OVER(AanmaakDatum)       !                     
AanmaakDatum_DATE             DATE                         !                     
AanmaakDatum_TIME             TIME                         !                     
                            END                            !                     
CelOms                      CSTRING(51)                    !                     
VerpakkingID                LONG                           !                     
VerpakkingOmschrijving      CSTRING(51)                    !                     
LeverancierFirmanaam        STRING(50)                     !                     
InslagKG                    REAL                           !                     
InslagPallets               LONG                           !                     
UitslagKG                   REAL                           !                     
UitslagPallets              LONG                           !                     
BerekendeInkoopKGPrijs      DECIMAL(10,3)                  !                     
CountBig                    LONG                           !                     
                         END
                     END                       

ViewPalletTegoeden   FILE,DRIVER('MSSQL'),PRE(PTG),BINDABLE,THREAD,EXTERNAL(''),DLL(dll_mode) !                     
ViewPalletTegoeden_PK    KEY(PTG:PalletSoortID,PTG:RelatieID,PTG:Transporteur),NOCASE,PRIMARY !                     
Record                   RECORD,PRE()
RelatieID                   LONG                           !                     
Transporteur                BYTE                           !                     
PalletSoortID               LONG                           !                     
Inkomend                    LONG                           !                     
Uitgaand                    LONG                           !                     
                         END
                     END                       

ViewPlanningPartijTotaal FILE,DRIVER('MSSQL'),PRE(VPParT),BINDABLE,THREAD,EXTERNAL(''),DLL(dll_mode) !                     
PK_ViewPlanningPartijTotaal KEY(VPParT:PartijID),NOCASE,PRIMARY !                     
FK1_ViewPlanningPartijTotaal KEY(VPParT:ArtikelID,VPParT:PartijID),DUP,NOCASE !                     
Record                   RECORD,PRE()
PartijID                    LONG                           !                     
ArtikelID                   CSTRING(31)                    !                     
ArtikelOms                  CSTRING(61)                    !                     
ExternPartijnr              CSTRING(21)                    !                     
AanmaakDatum                STRING(8)                      !                     
AanmaakDatum_GROUP          GROUP,OVER(AanmaakDatum)       !                     
AanmaakDatum_DATE             DATE                         !                     
AanmaakDatum_TIME             TIME                         !                     
                            END                            !                     
VerpakkingOmschrijving      CSTRING(51)                    !                     
LeverancierFirmanaam        CSTRING(51)                    !                     
VerkoopKG                   REAL                           !                     
VerkoopPallets              LONG                           !                     
                         END
                     END                       

ViewVoorraadPartijTotaal FILE,DRIVER('MSSQL'),PRE(VVParT),BINDABLE,THREAD,EXTERNAL(''),DLL(dll_mode) !                     
PK_ViewVoorraadPartijTotaal KEY(VVParT:PartijID),NOCASE,PRIMARY !                     
FK1_ViewVoorraadPartijTotaal KEY(VVParT:ArtikelID,VVParT:PartijID),DUP,NOCASE !                     
Record                   RECORD,PRE()
PartijID                    LONG                           !                     
ArtikelID                   CSTRING(31)                    !                     
ArtikelOms                  CSTRING(61)                    !                     
ExternPartijnr              CSTRING(21)                    !                     
AanmaakDatum                STRING(8)                      !                     
AanmaakDatum_GROUP          GROUP,OVER(AanmaakDatum)       !                     
AanmaakDatum_DATE             DATE                         !                     
AanmaakDatum_TIME             TIME                         !                     
                            END                            !                     
VerpakkingID                LONG                           !                     
VerpakkingOmschrijving      CSTRING(51)                    !                     
LeverancierFirmanaam        CSTRING(51)                    !                     
InslagKG                    LONG                           !                     
InslagPallets               LONG                           !                     
UitslagKG                   LONG                           !                     
UitslagPallets              LONG                           !                     
VoorraadKG                  LONG                           !                     
VoorraadPallets             LONG                           !                     
                         END
                     END                       

SnelheidLogging      FILE,DRIVER('MSSQL'),PRE(Sne),BINDABLE,THREAD,EXTERNAL(''),DLL(dll_mode) !                     
PK_SnelheidLogging       KEY(Sne:SnelheidLoggingID),PRIMARY !                     
Record                   RECORD,PRE()
SnelheidLoggingID           LONG                           !                     
Datum                       STRING(8)                      !                     
Datum_GROUP                 GROUP,OVER(Datum)              !                     
Datum_DATE                    DATE                         !                     
Datum_TIME                    TIME                         !                     
                            END                            !                     
Gebruiker                   CSTRING(51)                    !                     
Meetpunt                    CSTRING(51)                    !                     
AantalGebruikersOnline      LONG                           !                     
Meting                      LONG                           !                     
Waarde1                     LONG                           !                     
Waarde2                     LONG                           !                     
Waarde3                     LONG                           !                     
Waarde4                     LONG                           !                     
Waarde5                     LONG                           !                     
Waarde6                     LONG                           !                     
Waarde7                     LONG                           !                     
SWaarde1                    CSTRING(1001)                  !                     
SWaarde2                    CSTRING(1001)                  !                     
SWaarde3                    CSTRING(1001)                  !                     
SWaarde4                    CSTRING(1001)                  !                     
SWaarde5                    CSTRING(1001)                  !                     
SWaarde6                    CSTRING(1001)                  !                     
SWaarde7                    CSTRING(1001)                  !                     
                         END
                     END                       

PartijCelVoorraad    FILE,DRIVER('MSSQL'),PRE(PCV),BINDABLE,THREAD,EXTERNAL(''),DLL(dll_mode) !                     
PK_PartijCelVoorraad     KEY(PCV:PartijCelVoorraadID),PRIMARY !                     
FK1_PartijCelVoorraad    KEY(PCV:PartijID,PCV:CelID),NOCASE ! Op PartijID / CelID 
FK2_PartijCelVoorraad    KEY(PCV:CelID,PCV:PartijID),NOCASE ! Op CelID / PartijID 
FK3_PartijCelVoorraad    KEY(PCV:ExternPartijnr,PCV:PartijID,PCV:CelID),DUP,NOCASE ! Op ExternPartijnr/PartijID/CelID
FK4_PartijCelVoorraad    KEY(PCV:ArtikelOms,PCV:PartijID,PCV:CelID),DUP,NOCASE ! Op ArtikelOms/PartijID/CelID
Record                   RECORD,PRE()
PartijCelVoorraadID         DECIMAL(19)                    !                     
PartijID                    LONG                           !                     
CelID                       LONG                           !                     
PartijCelVoorraadKG         LONG                           !                     
PartijCelVerkochtKG         LONG                           !                     
PartijVoorraadKG            LONG                           !                     
PartijVerkochtKG            LONG                           !                     
ExternPartijnr              CSTRING(21)                    !                     
ArtikelOms                  CSTRING(61)                    !                     
                         END
                     END                       

RelatieArtikelOmschrijving FILE,DRIVER('MSSQL'),PRE(RAO),BINDABLE,THREAD,EXTERNAL(''),DLL(dll_mode) !                     
PK_RelatieArtikelOmschrijving KEY(RAO:RelatieArtikelOmschrijvingID),NOCASE,PRIMARY !                     
FK1_RelatieArtikelOmschrijving KEY(RAO:RelatieID,RAO:ArtikelID),NOCASE !                     
Record                   RECORD,PRE()
RelatieArtikelOmschrijvingID LONG                          !                     
RelatieID                   LONG                           !                     
ArtikelID                   CSTRING(31)                    !                     
ArtikelOmschrijving         CSTRING(101)                   !                     
RelatieArtikelID            CSTRING(31)                    ! Artikelnummer zoals deze bij de klant wordt gebruikt.
GTIN                        CSTRING(21)                    !                     
                         END
                     END                       

ARelatie             FILE,DRIVER('MSSQL'),PRE(AREL),BINDABLE,THREAD,EXTERNAL(''),DLL(dll_mode) !                     
Relatie_FK02             KEY(AREL:Country),DUP,NOCASE,OPT  !                     
Relatie_FK01             KEY(AREL:FirmaNaam),DUP           !                     
Relatie_PK               KEY(AREL:RelatieID)               !                     
Record                   RECORD,PRE()
RelatieID                   LONG                           !                     
FirmaNaam                   STRING(50)                     !                     
Adres1                      CSTRING(101)                   !                     
Adres2                      CSTRING(101)                   !                     
Postcode                    CSTRING(21)                    !                     
Plaats                      CSTRING(101)                   !                     
Telefoon                    STRING(25)                     !                     
Mobiel                      CSTRING(31)                    !                     
Fax                         STRING(25)                     !                     
Type                        STRING(1)                      !                     
Country                     CSTRING(61)                    !                     
ItemCode                    STRING(2)                      !                     
PaymentCondition            STRING(2)                      !                     
PalletBladRapportHeaderImage CSTRING(513)                  !                     
Note                        CSTRING(4001)                  !                     
LotID                       LONG                           !                     
OpenstaandSaldo             REAL                           !                     
CreditLine                  REAL                           !                     
DagenOud                    LONG                           !                     
Code                        STRING(20)                     !                     
Acc_Man                     LONG                           !                     
VatCode                     STRING(3)                      !                     
cmp_fctry                   STRING(3)                      !                     
CMROpmerking                CSTRING(1001)                  !                     
PalletBladLayout            CSTRING(51)                    !                     
                         END
                     END                       

APlanning            FILE,DRIVER('MSSQL'),PRE(APla),BINDABLE,THREAD,EXTERNAL(''),DLL(dll_mode) !                     
Datum_Tijd_K             KEY(APla:Planning,APla:PlanningID),DUP !                     
OverboekingCelID_Planning_K KEY(APla:OverboekingCelID,APla:Planning,APla:PlanningID),DUP !                     
PK_Planning              KEY(APla:PlanningID),PRIMARY      !                     
Planning_FK01            KEY(APla:InkoopID,APla:PlanningID),DUP,NOCASE ! Op InkoopID/Planning
Planning_FK02            KEY(APla:VerkoopID,APla:PlanningID),DUP ! Op VerkoopID. PlanningID
Planning_FK03            KEY(APla:Planning),DUP            ! Op Planning         
Verwerkt_Artikel_Planning_K KEY(APla:Verwerkt,APla:ArtikelID,APla:PlanningID),DUP !                     
Verwerkt_OverboekingCelID_Planning_K KEY(APla:Verwerkt,APla:OverboekingCelID,APla:Planning,APla:PlanningID),DUP !                     
Record                   RECORD,PRE()
PlanningID                  LONG,NAME('PlanningID | READONLY') !                     
VerkoopID                   LONG                           !                     
InkoopID                    LONG                           !                     
ArtikelID                   CSTRING(31)                    !                     
KG                          DECIMAL(10,2)                  !                     
Pallets                     LONG                           !                     
Planning                    STRING(8)                      !                     
Planning_GROUP              GROUP,OVER(Planning)           !                     
Planning_DATE                 DATE                         !                     
Planning_TIME                 TIME                         !                     
                            END                            !                     
VerpakkingID                LONG                           !                     
CelID                       LONG                           !                     
PartijID                    LONG                           !                     
Memo                        CSTRING(101)                   !                     
MutatieGemaakt              BYTE                           !                     
Geprint                     BYTE                           !                     
Verwerkt                    BYTE                           !                     
Leverancier                 LONG                           !                     
OverboekingCelID            LONG                           !                     
Instructie                  CSTRING(101)                   !                     
Transport                   CSTRING(101)                   !                     
Gewogen                     BYTE                           !                     
CelLocatieID                LONG                           !                     
MutatieKG                   DECIMAL(10,2)                  !                     
MutatiePallets              LONG                           !                     
OverboekingPlanningID       LONG                           ! Overboeking gelinkt aan een bepaalde verkoopregel (en vice versa)
InkoopKGPrijs               DECIMAL(10,3)                  !                     
VerkoopKGPrijs              DECIMAL(10,3)                  !                     
UitslagPalletbladDueDate12  STRING(8)                      !                     
UitslagPalletbladDueDate12_GROUP GROUP,OVER(UitslagPalletbladDueDate12) !                     
UitslagPalletbladDueDate12_DATE DATE                       !                     
UitslagPalletbladDueDate12_TIME TIME                       !                     
                            END                            !                     
UitslagPalletbladProductionDate11 STRING(8)                !                     
UitslagPalletbladProductionDate11_GROUP GROUP,OVER(UitslagPalletbladProductionDate11) !                     
UitslagPalletbladProductionDate11_DATE DATE                !                     
UitslagPalletbladProductionDate11_TIME TIME                !                     
                            END                            !                     
UitslagPalletbladSellByDate15 STRING(8)                    !                     
UitslagPalletbladSellByDate15_GROUP GROUP,OVER(UitslagPalletbladSellByDate15) !                     
UitslagPalletbladSellByDate15_DATE DATE                    !                     
UitslagPalletbladSellByDate15_TIME TIME                    !                     
                            END                            !                     
AlternatieveArtikelOms      CSTRING(201)                   !                     
VerpakkingKlasseID          LONG                           !                     
AantalVerpakkingen          LONG                           !                     
UitslagPalletbladOriginLiveBird CSTRING(51)                !                     
UitslagPalletbladOriginSlautherHouse CSTRING(51)           !                     
UitslagPalletbladOriginProcessing CSTRING(20)              !                     
UitslagPalletbladOriginPacking CSTRING(20)                 !                     
Valuta                      CSTRING(51)                    !                     
Koersverschil               DECIMAL(11,3)                  !                     
ExtraKosten                 DECIMAL(10,3)                  !                     
LotID                       LONG                           !                     
PlantNumber                 CSTRING(51)                    !                     
DeliveryDate                STRING(8)                      !                     
DeliveryDate_GROUP          GROUP,OVER(DeliveryDate)       !                     
DeliveryDate_DATE             DATE                         !                     
DeliveryDate_TIME             TIME                         !                     
                            END                            !                     
PlanningIDRetour            LONG                           !                     
PlanningIDParent            LONG                           !                     
Aanvulling                  CSTRING(101)                   !                     
Dozen                       LONG                           !                     
GrossWeight                 DECIMAL(8,3)                   !                     
OverboekSoort               CSTRING(51)                    !                     
OverboekCelLocatieID        LONG                           !                     
NieuwKG                     DECIMAL(10,2)                  !                     
NieuwPallets                LONG                           !                     
UitslagPalletbladHarvastDate7007 STRING(8)                 !                     
UitslagPalletbladHarvastDate7007_GROUP GROUP,OVER(UitslagPalletbladHarvastDate7007) !                     
UitslagPalletbladHarvastDate7007_DATE DATE                 !                     
UitslagPalletbladHarvastDate7007_TIME TIME                 !                     
                            END                            !                     
                         END
                     END                       

AVerkoop             FILE,DRIVER('MSSQL'),PRE(AVE),BINDABLE,THREAD,EXTERNAL(''),DLL(dll_mode) !                     
Verkoop_FK2              KEY(AVE:Exported,AVE:VerkoopID),DUP ! Op Exported/VerkoopID
Verkoop_FK3              KEY(AVE:Exported,AVE:Klant,-AVE:VerkoopID),DUP ! Op Exported, Klant, Verkoop
PK_Verkoop               KEY(AVE:VerkoopID),PRIMARY        !                     
Verkoop_FK01             KEY(AVE:Planning),DUP             !                     
Klant_Verwerkt_Planning_K KEY(AVE:Klant,AVE:Verwerkt,AVE:Planning,AVE:VerkoopID),DUP,NOCASE !                     
Klant_Verwerkt_PlanningD_K KEY(AVE:Klant,AVE:Verwerkt,-AVE:Planning,-AVE:VerkoopID),DUP,NOCASE !                     
Verwerkt_VerkoopID_K     KEY(AVE:Verwerkt,AVE:VerkoopID),DUP,NOCASE !                     
Verwerkt_VerkoopIDD_K    KEY(AVE:Verwerkt,-AVE:VerkoopID),DUP,NOCASE !                     
Verwerkt_Planning_K      KEY(AVE:Verwerkt,AVE:Planning,AVE:VerkoopID),DUP,NOCASE !                     
Verwerkt_PlanningD_K     KEY(AVE:Verwerkt,-AVE:Planning,-AVE:VerkoopID),DUP,NOCASE !                     
KlantAlternatiefAdres_K  KEY(AVE:KlantAlternatiefAdres),DUP,NOCASE !                     
Record                   RECORD,PRE()
VerkoopID                   LONG,NAME('VerkoopID | READONLY') !                     
Klant                       LONG                           !                     
Verwerkt                    BYTE                           !                     
Planning                    STRING(8)                      !                     
Planning_GROUP              GROUP,OVER(Planning)           !                     
Planning_DATE                 DATE                         !                     
Planning_TIME                 TIME                         !                     
                            END                            !                     
Instructie                  CSTRING(101)                   !                     
Transport                   CSTRING(101)                   !                     
KlantAlternatiefAdres       LONG                           !                     
ExtraKosten                 DECIMAL(10,3)                  !                     
ExtraKostenTekst            CSTRING(1025)                  !                     
ExternVerkoopID             CSTRING(51)                    !                     
NegatieveOrder              CSTRING(51)                    !                     
RedenRetour                 CSTRING(51)                    !                     
ConfirmationDate            STRING(8)                      !                     
ConfirmationDate_GROUP      GROUP,OVER(ConfirmationDate)   !                     
ConfirmationDate_DATE         DATE                         !                     
ConfirmationDate_TIME         TIME                         !                     
                            END                            !                     
GebruikerID                 LONG                           !                     
BevestigingGeprint          STRING(8)                      !                     
BevestigingGeprint_GROUP    GROUP,OVER(BevestigingGeprint) !                     
BevestigingGeprint_DATE       DATE                         !                     
BevestigingGeprint_TIME       TIME                         !                     
                            END                            !                     
DeliveryTermsID             LONG                           !                     
RetourDatum                 STRING(8)                      !                     
RetourDatum_GROUP           GROUP,OVER(RetourDatum)        !                     
RetourDatum_DATE              DATE                         !                     
RetourDatum_TIME              TIME                         !                     
                            END                            !                     
Exported                    BYTE                           !                     
Valuta                      CSTRING(51)                    !                     
Koersverschil               DECIMAL(11,3)                  !                     
Containernr                 CSTRING(51)                    !                     
Sealnr                      CSTRING(51)                    !                     
Vessel                      CSTRING(51)                    !                     
ProFormaMemo                CSTRING(4001)                  !                     
TarraContainer              LONG                           !                     
Laadhaven                   CSTRING(51)                    !                     
Loshaven                    CSTRING(51)                    !                     
Boekingsnr                  CSTRING(51)                    !                     
BESCWaiver                  CSTRING(21)                    !                     
ExpresseRelease             LONG                           !                     
Aan                         CSTRING(51)                    !                     
OmschrijvingGoederen        CSTRING(4001)                  !                     
PaymentCondition            STRING(2)                      !                     
                         END
                     END                       

AViewArtikel         FILE,DRIVER('MSSQL'),PRE(AArt),BINDABLE,THREAD,EXTERNAL(''),DLL(dll_mode) !                     
Artikel_PK               KEY(AArt:ArtikelID)               !                     
Artikel_FK01             KEY(AArt:ArtikelOms),DUP,NOCASE   !                     
Record                   RECORD,PRE()
ArtikelID                   CSTRING(31)                    !                     
ArtikelOms                  CSTRING(61)                    !                     
ArtikelGroep                LONG                           !                     
Prijs                       SREAL                          !                     
                         END
                     END                       

AARelatie            FILE,DRIVER('MSSQL'),PRE(AARel),BINDABLE,THREAD,EXTERNAL(''),DLL(dll_mode) !                     
Relatie_FK02             KEY(AARel:Country),DUP,NOCASE,OPT !                     
Relatie_FK01             KEY(AARel:FirmaNaam),DUP          !                     
Relatie_PK               KEY(AARel:RelatieID)              !                     
Record                   RECORD,PRE()
RelatieID                   LONG                           !                     
FirmaNaam                   STRING(50)                     !                     
Adres1                      CSTRING(101)                   !                     
Adres2                      CSTRING(101)                   !                     
Postcode                    CSTRING(21)                    !                     
Plaats                      CSTRING(101)                   !                     
Telefoon                    STRING(25)                     !                     
Mobiel                      CSTRING(31)                    !                     
Fax                         STRING(25)                     !                     
Type                        STRING(1)                      !                     
Country                     CSTRING(61)                    !                     
ItemCode                    STRING(2)                      !                     
PaymentCondition            STRING(2)                      !                     
PalletBladRapportHeaderImage CSTRING(513)                  !                     
Note                        CSTRING(4001)                  !                     
LotID                       LONG                           !                     
OpenstaandSaldo             REAL                           !                     
CreditLine                  REAL                           !                     
DagenOud                    LONG                           !                     
Code                        STRING(20)                     !                     
Acc_Man                     LONG                           !                     
VatCode                     STRING(3)                      !                     
cmp_fctry                   STRING(3)                      !                     
CMROpmerking                CSTRING(1001)                  !                     
PalletBladLayout            CSTRING(51)                    !                     
                         END
                     END                       

ACel                 FILE,DRIVER('MSSQL'),PRE(ACel),BINDABLE,THREAD,EXTERNAL(''),DLL(dll_mode) !                     
CEL_PK                   KEY(ACel:CelID),NOCASE,PRIMARY    !                     
Record                   RECORD,PRE()
CelID                       LONG                           !                     
CelOms                      CSTRING(51)                    !                     
Breedte                     LONG                           !                     
Lengte                      LONG                           !                     
                         END
                     END                       

AACel                FILE,DRIVER('MSSQL'),PRE(AACel),BINDABLE,THREAD,EXTERNAL(''),DLL(dll_mode) !                     
CEL_PK                   KEY(AACel:CelID),NOCASE,PRIMARY   !                     
Record                   RECORD,PRE()
CelID                       LONG                           !                     
CelOms                      CSTRING(51)                    !                     
Breedte                     LONG                           !                     
Lengte                      LONG                           !                     
                         END
                     END                       

AViewVoorraadCelTotaal FILE,DRIVER('MSSQL'),PRE(AVVCT),BINDABLE,THREAD,EXTERNAL(''),DLL(dll_mode) !                     
ViewVoorraadCelTotaal_PK KEY(AVVCT:CeliD,AVVCT:ArtikelOms,AVVCT:ArtikelID),DUP,NOCASE !                     
Record                   RECORD,PRE()
ArtikelID                   CSTRING(31)                    !                     
CeliD                       LONG                           !                     
kg                          REAL                           !                     
pallets                     LONG                           !                     
VerkoopKG                   REAL                           !                     
VerkoopPallet               LONG                           !                     
ArtikelOms                  CSTRING(61)                    !                     
                         END
                     END                       

AVerpakking          FILE,DRIVER('MSSQL'),PRE(AVP),BINDABLE,THREAD,EXTERNAL(''),DLL(dll_mode) !                     
Verpakking_PK            KEY(AVP:VerpakkingID)             !                     
Record                   RECORD,PRE()
VerpakkingID                LONG                           !                     
VerpakkingOmschrijving      CSTRING(51)                    !                     
Description                 CSTRING(51)                    !                     
InhoudKG                    DECIMAL(7,3)                   !                     
                         END
                     END                       

AAARelatie           FILE,DRIVER('MSSQL'),PRE(AAARel),BINDABLE,THREAD,EXTERNAL(''),DLL(dll_mode) !                     
Relatie_FK02             KEY(AAARel:Country),DUP,NOCASE,OPT !                     
Relatie_FK01             KEY(AAARel:FirmaNaam),DUP         !                     
Relatie_PK               KEY(AAARel:RelatieID)             !                     
Record                   RECORD,PRE()
RelatieID                   LONG                           !                     
FirmaNaam                   STRING(50)                     !                     
Adres1                      CSTRING(101)                   !                     
Adres2                      CSTRING(101)                   !                     
Postcode                    CSTRING(21)                    !                     
Plaats                      CSTRING(101)                   !                     
Telefoon                    STRING(25)                     !                     
Mobiel                      CSTRING(31)                    !                     
Fax                         STRING(25)                     !                     
Type                        STRING(1)                      !                     
Country                     CSTRING(61)                    !                     
ItemCode                    STRING(2)                      !                     
PaymentCondition            STRING(2)                      !                     
PalletBladRapportHeaderImage CSTRING(513)                  !                     
Note                        CSTRING(4001)                  !                     
LotID                       LONG                           !                     
OpenstaandSaldo             REAL                           !                     
CreditLine                  REAL                           !                     
DagenOud                    LONG                           !                     
Code                        STRING(20)                     !                     
Acc_Man                     LONG                           !                     
VatCode                     STRING(3)                      !                     
cmp_fctry                   STRING(3)                      !                     
CMROpmerking                CSTRING(1001)                  !                     
PalletBladLayout            CSTRING(51)                    !                     
                         END
                     END                       

AViewTransporteur    FILE,DRIVER('MSSQL'),PRE(AVTRA),BINDABLE,THREAD,EXTERNAL(''),DLL(dll_mode) !                     
ViewTransporteur_PK      KEY(AVTRA:TransporteurID),DUP,NOCASE !                     
ViewTransporteur_FK1     KEY(AVTRA:RelatieID),DUP,NOCASE   ! Op RelatieID        
Record                   RECORD,PRE()
TransporteurID              LONG                           !                     
RelatieID                   LONG                           !                     
FirmaNaam                   STRING(50)                     !                     
Adres1                      CSTRING(101)                   !                     
Adres2                      CSTRING(101)                   !                     
Postcode                    CSTRING(21)                    !                     
Plaats                      CSTRING(101)                   !                     
Telefoon                    STRING(25)                     !                     
Mobiel                      CSTRING(31)                    !                     
Fax                         STRING(25)                     !                     
                         END
                     END                       

APalletMutatie       FILE,DRIVER('MSSQL'),PRE(APM),BINDABLE,THREAD,EXTERNAL(''),DLL(dll_mode) !                     
PalletMutatie_PK         KEY(APM:PalletMutatieID)          !                     
PalletMutatie_FK1        KEY(APM:PalletSoortID,APM:PalletMutatieID),DUP ! PalletSoortID_PalletMutatieID_K
PalletMutatie_FK2        KEY(APM:RelatieID,APM:PalletSoortID,APM:PalletMutatieID),DUP ! RelatieID_PalletSoortID_PalletMutatie_K
PalletMutatie_FK3        KEY(APM:PlanningID,APM:PalletMutatieID),DUP,NAME('PlanningID_PalletMutatie_K') !                     
PalletMutatie_FK4        KEY(APM:VerkoopID,APM:PalletMutatieID),DUP,NOCASE ! Op VerkoopID_PalletMutatie_K
PalletMutatie_FK5        KEY(APM:VerkoopID,APM:PalletSoortID,APM:Transporteur),NAME('Op VerkoopID/PalletSoortID/Transporteur'),NOCASE !                     
Record                   RECORD,PRE()
PalletMutatieID             LONG                           !                     
PalletSoortID               LONG                           ! 1=H1|2=1-way|3=Euro|4=CKW
PlanningID                  LONG                           !                     
RelatieID                   LONG                           !                     
Inkomend                    LONG                           !                     
Uitgaand                    LONG                           !                     
Transporteur                BYTE                           !                     
DatumTijd                   STRING(8)                      !                     
DatumTijd_GROUP             GROUP,OVER(DatumTijd)          !                     
DatumTijd_DATE                DATE                         !                     
DatumTijd_TIME                TIME                         !                     
                            END                            !                     
Opmerking                   CSTRING(51)                    !                     
VerkoopID                   LONG                           !                     
TransporteurPalletMutatieID LONG                           !                     
                         END
                     END                       

APalletVerloop       FILE,DRIVER('MSSQL'),PRE(APal3),BINDABLE,THREAD,EXTERNAL(''),DLL(dll_mode) !                     
PalletVerloop_FK1        KEY(APal3:PalletSoortID,-APal3:Planning,APal3:PalletMutatieID),NOCASE,OPT ! Op PalletSoort/Planning (DESC)/ID
PalletVerloop_FK2        KEY(APal3:RelatieID,APal3:PalletSoortID,-APal3:Planning,APal3:PalletMutatieID),NOCASE,OPT ! Op RelatieID/PalletSoort/Planning (DESC)/ID
PalletVerloop_PK         KEY(APal3:PalletMutatieID),DUP,NOCASE !                     
Record                   RECORD,PRE()
PalletMutatieID             LONG                           !                     
RelatieID                   LONG                           !                     
FirmaNaam                   CSTRING(51)                    !                     
PalletSoortID               LONG                           !                     
VerkoopID                   LONG                           !                     
Inkomend                    LONG                           !                     
Uitgaand                    LONG                           !                     
Transporteur                BYTE                           !                     
InMinUit                    LONG                           !                     
Saldo                       LONG                           !                     
SaldoTotaal                 LONG                           !                     
Planning                    STRING(8)                      !                     
Planning_GROUP              GROUP,OVER(Planning)           !                     
Planning_DATE                 DATE                         !                     
Planning_TIME                 TIME                         !                     
                            END                            !                     
Opmerking                   CSTRING(51)                    !                     
                         END
                     END                       

APartij              FILE,DRIVER('MSSQL'),PRE(APar),BINDABLE,THREAD,EXTERNAL(''),DLL(dll_mode) !                     
Partij_FK02              KEY(APar:Planning,APar:PartijID),DUP,NOCASE !                     
Partij_FK03              KEY(APar:InkoopID,APar:PartijID),DUP,NOCASE !                     
Partij_FK01              KEY(APar:ArtikelID,APar:PartijID),DUP,NOCASE !                     
Partij_PK                KEY(APar:PartijID),PRIMARY        !                     
Record                   RECORD,PRE()
PartijID                    LONG                           !                     
ArtikelID                   CSTRING(31)                    !                     
AanmaakDatum                STRING(8)                      !                     
AanmaakDatum_GROUP          GROUP,OVER(AanmaakDatum)       !                     
AanmaakDatum_DATE             DATE                         !                     
AanmaakDatum_TIME             TIME                         !                     
                            END                            !                     
KG                          DECIMAL(10,2)                  !                     
Pallets                     LONG                           !                     
VerpakkingID                LONG                           !                     
Leverancier                 LONG                           !                     
Verwerkt                    BYTE                           !                     
CELID                       LONG                           !                     
PalletsGeprint              LONG                           !                     
Referentie                  CSTRING(51)                    !                     
Planning                    STRING(8)                      !                     
Planning_GROUP              GROUP,OVER(Planning)           !                     
Planning_DATE                 DATE                         !                     
Planning_TIME                 TIME                         !                     
                            END                            !                     
Planinstructie              CSTRING(101)                   !                     
InslagQATemperatuur1        CSTRING(21)                    !                     
ExternPartijnr              CSTRING(21)                    !                     
BerekendeInkoopKGPrijs      DECIMAL(10,3)                  !                     
InkoopID                    LONG                           !                     
InkoopPlanningID            LONG                           !                     
InkoopKGPrijs               DECIMAL(10,3)                  ! Zonder transport/extrakosten
InslagQATransportmiddelSchoon BYTE                         !                     
InslagQAVerpakkingSchoonGesloten BYTE                      !                     
InslagQAIdentificatieMerkenVerpakking BYTE                 !                     
InslagQAUitgevoerdDoor      CSTRING(41)                    !                     
InslagQATemperatuur2        CSTRING(21)                    !                     
InslagQATemperatuur3        CSTRING(21)                    !                     
InslagQAActieAfwijkingen    CSTRING(2001)                  !                     
VerpakkingKlasseID          LONG                           !                     
CorrigerendeMaatregel       CSTRING(2001)                  !                     
Afgehandeld                 CSTRING(2001)                  !                     
InslagQAIsGeurKleurProductEigen BYTE                       !                     
InslagQAGeenGlasbreuk       BYTE                           !                     
InslagQATemperatuurVervoermiddel CSTRING(21)               !                     
CorrectieveMaatregel        CSTRING(2001)                  !                     
Oorzaak                     CSTRING(2001)                  !                     
TransportBedrijf            CSTRING(2001)                  !                     
                         END
                     END                       

AAViewArtikel        FILE,DRIVER('MSSQL'),PRE(AAArt),BINDABLE,THREAD,EXTERNAL(''),DLL(dll_mode) !                     
Artikel_PK               KEY(AAArt:ArtikelID)              !                     
Artikel_FK01             KEY(AAArt:ArtikelOms),DUP,NOCASE  !                     
Record                   RECORD,PRE()
ArtikelID                   CSTRING(31)                    !                     
ArtikelOms                  CSTRING(61)                    !                     
ArtikelGroep                LONG                           !                     
Prijs                       SREAL                          !                     
                         END
                     END                       

AAPartij             FILE,DRIVER('MSSQL'),PRE(AAPar),BINDABLE,THREAD,EXTERNAL(''),DLL(dll_mode) !                     
Partij_FK02              KEY(AAPar:Planning,AAPar:PartijID),DUP,NOCASE !                     
Partij_FK03              KEY(AAPar:InkoopID,AAPar:PartijID),DUP,NOCASE !                     
Partij_FK01              KEY(AAPar:ArtikelID,AAPar:PartijID),DUP,NOCASE !                     
Partij_PK                KEY(AAPar:PartijID),PRIMARY       !                     
Record                   RECORD,PRE()
PartijID                    LONG                           !                     
ArtikelID                   CSTRING(31)                    !                     
AanmaakDatum                STRING(8)                      !                     
AanmaakDatum_GROUP          GROUP,OVER(AanmaakDatum)       !                     
AanmaakDatum_DATE             DATE                         !                     
AanmaakDatum_TIME             TIME                         !                     
                            END                            !                     
KG                          DECIMAL(10,2)                  !                     
Pallets                     LONG                           !                     
VerpakkingID                LONG                           !                     
Leverancier                 LONG                           !                     
Verwerkt                    BYTE                           !                     
CELID                       LONG                           !                     
PalletsGeprint              LONG                           !                     
Referentie                  CSTRING(51)                    !                     
Planning                    STRING(8)                      !                     
Planning_GROUP              GROUP,OVER(Planning)           !                     
Planning_DATE                 DATE                         !                     
Planning_TIME                 TIME                         !                     
                            END                            !                     
Planinstructie              CSTRING(101)                   !                     
InslagQATemperatuur1        CSTRING(21)                    !                     
ExternPartijnr              CSTRING(21)                    !                     
BerekendeInkoopKGPrijs      DECIMAL(10,3)                  !                     
InkoopID                    LONG                           !                     
InkoopPlanningID            LONG                           !                     
InkoopKGPrijs               DECIMAL(10,3)                  ! Zonder transport/extrakosten
InslagQATransportmiddelSchoon BYTE                         !                     
InslagQAVerpakkingSchoonGesloten BYTE                      !                     
InslagQAIdentificatieMerkenVerpakking BYTE                 !                     
InslagQAUitgevoerdDoor      CSTRING(41)                    !                     
InslagQATemperatuur2        CSTRING(21)                    !                     
InslagQATemperatuur3        CSTRING(21)                    !                     
InslagQAActieAfwijkingen    CSTRING(2001)                  !                     
VerpakkingKlasseID          LONG                           !                     
CorrigerendeMaatregel       CSTRING(2001)                  !                     
Afgehandeld                 CSTRING(2001)                  !                     
InslagQAIsGeurKleurProductEigen BYTE                       !                     
InslagQAGeenGlasbreuk       BYTE                           !                     
InslagQATemperatuurVervoermiddel CSTRING(21)               !                     
CorrectieveMaatregel        CSTRING(2001)                  !                     
Oorzaak                     CSTRING(2001)                  !                     
TransportBedrijf            CSTRING(2001)                  !                     
                         END
                     END                       

AVoorraadVerloop     FILE,DRIVER('MSSQL'),PRE(AVVL),BINDABLE,THREAD,EXTERNAL(''),DLL(dll_mode) !                     
ArtikelID_DatumTijdD_MutatieID_K KEY(AVVL:ArtikelID,-AVVL:DatumTijd,AVVL:MutatieID),DUP,NOCASE !                     
ArtikelID_DatumTijdD_MutatieIDD_K KEY(AVVL:ArtikelID,-AVVL:DatumTijd,-AVVL:MutatieID),DUP,NOCASE !                     
ArtikelID_DatumTijd_MutatieID_K KEY(AVVL:ArtikelID,AVVL:DatumTijd,AVVL:MutatieID),DUP,NOCASE !                     
ArtikelID_PartijID_DatumTijd_MutatieID_K KEY(AVVL:ArtikelID,AVVL:PartijID,AVVL:DatumTijd,AVVL:MutatieID),DUP,NOCASE !                     
ArtikelID_PartijID_DatumTijdD_MutatieID_K KEY(AVVL:ArtikelID,AVVL:PartijID,-AVVL:DatumTijd,AVVL:MutatieID),DUP,NOCASE !                     
ArtikelID_PartijID_DatumTijdD_MutatieIDD_K KEY(AVVL:ArtikelID,AVVL:PartijID,-AVVL:DatumTijd,-AVVL:MutatieID),DUP,NOCASE !                     
ArtikelID_CelID_DatumTijdD_MutatieIDD_K KEY(AVVL:ArtikelID,AVVL:CelID,-AVVL:DatumTijd,-AVVL:MutatieID),DUP,NOCASE !                     
ArtikelID_CelID_DatumTijdD_MutatieID_K KEY(AVVL:ArtikelID,AVVL:CelID,-AVVL:DatumTijd,AVVL:MutatieID),DUP,NOCASE !                     
Record                   RECORD,PRE()
MutatieID                   LONG                           !                     
DatumTijd                   STRING(8)                      !                     
DatumTijd_GROUP             GROUP,OVER(DatumTijd)          !                     
DatumTijd_DATE                DATE                         !                     
DatumTijd_TIME                TIME                         !                     
                            END                            !                     
PartijID                    LONG                           !                     
ArtikelID                   CSTRING(31)                    !                     
SoortMutatie                STRING(4)                      !                     
InslagKG                    REAL                           !                     
InslagPallet                LONG                           !                     
UitslagKG                   REAL                           !                     
UitslagPallet               LONG                           !                     
CelID                       LONG                           !                     
NaarCELID                   LONG                           !                     
PartijRelatie               STRING(50)                     !                     
Verwerkt                    BYTE                           !                     
ExternPartijnr              CSTRING(21)                    !                     
Referentie                  CSTRING(51)                    !                     
PlanningID                  LONG                           !                     
PartijLeverancier           LONG                           !                     
InkoopID                    LONG                           !                     
VerkoopID                   LONG                           !                     
VerkoopRelatieID            LONG                           !                     
VerkoopRelatie              STRING(50)                     !                     
InkoopRelatieID             LONG                           !                     
InkoopRelatie               STRING(50)                     !                     
VerpakkingID                LONG                           !                     
VerpakkingOmschrijving      CSTRING(51)                    !                     
CelLocatieID                LONG                           !                     
Locatienaam                 CSTRING(51)                    !                     
BerekendeInkoopKGPrijs      DECIMAL(10,3)                  !                     
VerkoopKGPrijs              DECIMAL(10,3)                  !                     
CelOms                      CSTRING(51)                    !                     
                         END
                     END                       

AAViewTransporteur   FILE,DRIVER('MSSQL'),PRE(AAVTRA),BINDABLE,THREAD,EXTERNAL(''),DLL(dll_mode) !                     
ViewTransporteur_PK      KEY(AAVTRA:TransporteurID),DUP,NOCASE !                     
ViewTransporteur_FK1     KEY(AAVTRA:RelatieID),DUP,NOCASE  ! Op RelatieID        
Record                   RECORD,PRE()
TransporteurID              LONG                           !                     
RelatieID                   LONG                           !                     
FirmaNaam                   STRING(50)                     !                     
Adres1                      CSTRING(101)                   !                     
Adres2                      CSTRING(101)                   !                     
Postcode                    CSTRING(21)                    !                     
Plaats                      CSTRING(101)                   !                     
Telefoon                    STRING(25)                     !                     
Mobiel                      CSTRING(31)                    !                     
Fax                         STRING(25)                     !                     
                         END
                     END                       

!endregion

db Debuger
WE::MustClose       long,external,dll
WE::CantCloseNow    long,external,dll
include('GlobalClassDef.inc')
include('CachingClassDef.inc')
include('SnelheidLogClassDef.inc')
Access:ViewArtikel   &FileManager,THREAD,EXTERNAL,DLL      ! FileManager for ViewArtikel
Relate:ViewArtikel   &RelationManager,THREAD,EXTERNAL,DLL  ! RelationManager for ViewArtikel
Access:Partij        &FileManager,THREAD,EXTERNAL,DLL      ! FileManager for Partij
Relate:Partij        &RelationManager,THREAD,EXTERNAL,DLL  ! RelationManager for Partij
Access:Relatie       &FileManager,THREAD,EXTERNAL,DLL      ! FileManager for Relatie
Relate:Relatie       &RelationManager,THREAD,EXTERNAL,DLL  ! RelationManager for Relatie
Access:Verpakking    &FileManager,THREAD,EXTERNAL,DLL      ! FileManager for Verpakking
Relate:Verpakking    &RelationManager,THREAD,EXTERNAL,DLL  ! RelationManager for Verpakking
Access:ViewVoorraadPlanning &FileManager,THREAD,EXTERNAL,DLL ! FileManager for ViewVoorraadPlanning
Relate:ViewVoorraadPlanning &RelationManager,THREAD,EXTERNAL,DLL ! RelationManager for ViewVoorraadPlanning
Access:Cel           &FileManager,THREAD,EXTERNAL,DLL      ! FileManager for Cel
Relate:Cel           &RelationManager,THREAD,EXTERNAL,DLL  ! RelationManager for Cel
Access:Mutatie       &FileManager,THREAD,EXTERNAL,DLL      ! FileManager for Mutatie
Relate:Mutatie       &RelationManager,THREAD,EXTERNAL,DLL  ! RelationManager for Mutatie
Access:Inkoop        &FileManager,THREAD,EXTERNAL,DLL      ! FileManager for Inkoop
Relate:Inkoop        &RelationManager,THREAD,EXTERNAL,DLL  ! RelationManager for Inkoop
Access:Planning      &FileManager,THREAD,EXTERNAL,DLL      ! FileManager for Planning
Relate:Planning      &RelationManager,THREAD,EXTERNAL,DLL  ! RelationManager for Planning
Access:Verkoop       &FileManager,THREAD,EXTERNAL,DLL      ! FileManager for Verkoop
Relate:Verkoop       &RelationManager,THREAD,EXTERNAL,DLL  ! RelationManager for Verkoop
Access:Sjabloon      &FileManager,THREAD,EXTERNAL,DLL      ! FileManager for Sjabloon
Relate:Sjabloon      &RelationManager,THREAD,EXTERNAL,DLL  ! RelationManager for Sjabloon
Access:ViewVoorraadCelTotaal &FileManager,THREAD,EXTERNAL,DLL ! FileManager for ViewVoorraadCelTotaal
Relate:ViewVoorraadCelTotaal &RelationManager,THREAD,EXTERNAL,DLL ! RelationManager for ViewVoorraadCelTotaal
Access:VoorraadVerloop &FileManager,THREAD,EXTERNAL,DLL    ! FileManager for VoorraadVerloop
Relate:VoorraadVerloop &RelationManager,THREAD,EXTERNAL,DLL ! RelationManager for VoorraadVerloop
Access:PalletMutatie &FileManager,THREAD,EXTERNAL,DLL      ! FileManager for PalletMutatie
Relate:PalletMutatie &RelationManager,THREAD,EXTERNAL,DLL  ! RelationManager for PalletMutatie
Access:PalletVerloop &FileManager,THREAD,EXTERNAL,DLL      ! FileManager for PalletVerloop
Relate:PalletVerloop &RelationManager,THREAD,EXTERNAL,DLL  ! RelationManager for PalletVerloop
Access:ViewTransporteur &FileManager,THREAD,EXTERNAL,DLL   ! FileManager for ViewTransporteur
Relate:ViewTransporteur &RelationManager,THREAD,EXTERNAL,DLL ! RelationManager for ViewTransporteur
Access:ViewVoorraadPartij &FileManager,THREAD,EXTERNAL,DLL ! FileManager for ViewVoorraadPartij
Relate:ViewVoorraadPartij &RelationManager,THREAD,EXTERNAL,DLL ! RelationManager for ViewVoorraadPartij
Access:ViewPlanningPartij &FileManager,THREAD,EXTERNAL,DLL ! FileManager for ViewPlanningPartij
Relate:ViewPlanningPartij &RelationManager,THREAD,EXTERNAL,DLL ! RelationManager for ViewPlanningPartij
Access:ArtikelOmschrijvingExtra &FileManager,THREAD,EXTERNAL,DLL ! FileManager for ArtikelOmschrijvingExtra
Relate:ArtikelOmschrijvingExtra &RelationManager,THREAD,EXTERNAL,DLL ! RelationManager for ArtikelOmschrijvingExtra
Access:CelLocatie    &FileManager,THREAD,EXTERNAL,DLL      ! FileManager for CelLocatie
Relate:CelLocatie    &RelationManager,THREAD,EXTERNAL,DLL  ! RelationManager for CelLocatie
Access:ViewPartijCelLocaties &FileManager,THREAD,EXTERNAL,DLL ! FileManager for ViewPartijCelLocaties
Relate:ViewPartijCelLocaties &RelationManager,THREAD,EXTERNAL,DLL ! RelationManager for ViewPartijCelLocaties
Access:ViewVoorraadPartij_INDEXED &FileManager,THREAD,EXTERNAL,DLL ! FileManager for ViewVoorraadPartij_INDEXED
Relate:ViewVoorraadPartij_INDEXED &RelationManager,THREAD,EXTERNAL,DLL ! RelationManager for ViewVoorraadPartij_INDEXED
Access:ViewPalletTegoeden &FileManager,THREAD,EXTERNAL,DLL ! FileManager for ViewPalletTegoeden
Relate:ViewPalletTegoeden &RelationManager,THREAD,EXTERNAL,DLL ! RelationManager for ViewPalletTegoeden
Access:ViewPlanningPartijTotaal &FileManager,THREAD,EXTERNAL,DLL ! FileManager for ViewPlanningPartijTotaal
Relate:ViewPlanningPartijTotaal &RelationManager,THREAD,EXTERNAL,DLL ! RelationManager for ViewPlanningPartijTotaal
Access:ViewVoorraadPartijTotaal &FileManager,THREAD,EXTERNAL,DLL ! FileManager for ViewVoorraadPartijTotaal
Relate:ViewVoorraadPartijTotaal &RelationManager,THREAD,EXTERNAL,DLL ! RelationManager for ViewVoorraadPartijTotaal
Access:SnelheidLogging &FileManager,THREAD,EXTERNAL,DLL    ! FileManager for SnelheidLogging
Relate:SnelheidLogging &RelationManager,THREAD,EXTERNAL,DLL ! RelationManager for SnelheidLogging
Access:PartijCelVoorraad &FileManager,THREAD,EXTERNAL,DLL  ! FileManager for PartijCelVoorraad
Relate:PartijCelVoorraad &RelationManager,THREAD,EXTERNAL,DLL ! RelationManager for PartijCelVoorraad
Access:RelatieArtikelOmschrijving &FileManager,THREAD,EXTERNAL,DLL ! FileManager for RelatieArtikelOmschrijving
Relate:RelatieArtikelOmschrijving &RelationManager,THREAD,EXTERNAL,DLL ! RelationManager for RelatieArtikelOmschrijving
Access:ARelatie      &FileManager,THREAD,EXTERNAL,DLL      ! FileManager for ARelatie
Relate:ARelatie      &RelationManager,THREAD,EXTERNAL,DLL  ! RelationManager for ARelatie
Access:APlanning     &FileManager,THREAD,EXTERNAL,DLL      ! FileManager for APlanning
Relate:APlanning     &RelationManager,THREAD,EXTERNAL,DLL  ! RelationManager for APlanning
Access:AVerkoop      &FileManager,THREAD,EXTERNAL,DLL      ! FileManager for AVerkoop
Relate:AVerkoop      &RelationManager,THREAD,EXTERNAL,DLL  ! RelationManager for AVerkoop
Access:AViewArtikel  &FileManager,THREAD,EXTERNAL,DLL      ! FileManager for AViewArtikel
Relate:AViewArtikel  &RelationManager,THREAD,EXTERNAL,DLL  ! RelationManager for AViewArtikel
Access:AARelatie     &FileManager,THREAD,EXTERNAL,DLL      ! FileManager for AARelatie
Relate:AARelatie     &RelationManager,THREAD,EXTERNAL,DLL  ! RelationManager for AARelatie
Access:ACel          &FileManager,THREAD,EXTERNAL,DLL      ! FileManager for ACel
Relate:ACel          &RelationManager,THREAD,EXTERNAL,DLL  ! RelationManager for ACel
Access:AACel         &FileManager,THREAD,EXTERNAL,DLL      ! FileManager for AACel
Relate:AACel         &RelationManager,THREAD,EXTERNAL,DLL  ! RelationManager for AACel
Access:AViewVoorraadCelTotaal &FileManager,THREAD,EXTERNAL,DLL ! FileManager for AViewVoorraadCelTotaal
Relate:AViewVoorraadCelTotaal &RelationManager,THREAD,EXTERNAL,DLL ! RelationManager for AViewVoorraadCelTotaal
Access:AVerpakking   &FileManager,THREAD,EXTERNAL,DLL      ! FileManager for AVerpakking
Relate:AVerpakking   &RelationManager,THREAD,EXTERNAL,DLL  ! RelationManager for AVerpakking
Access:AAARelatie    &FileManager,THREAD,EXTERNAL,DLL      ! FileManager for AAARelatie
Relate:AAARelatie    &RelationManager,THREAD,EXTERNAL,DLL  ! RelationManager for AAARelatie
Access:AViewTransporteur &FileManager,THREAD,EXTERNAL,DLL  ! FileManager for AViewTransporteur
Relate:AViewTransporteur &RelationManager,THREAD,EXTERNAL,DLL ! RelationManager for AViewTransporteur
Access:APalletMutatie &FileManager,THREAD,EXTERNAL,DLL     ! FileManager for APalletMutatie
Relate:APalletMutatie &RelationManager,THREAD,EXTERNAL,DLL ! RelationManager for APalletMutatie
Access:APalletVerloop &FileManager,THREAD,EXTERNAL,DLL     ! FileManager for APalletVerloop
Relate:APalletVerloop &RelationManager,THREAD,EXTERNAL,DLL ! RelationManager for APalletVerloop
Access:APartij       &FileManager,THREAD,EXTERNAL,DLL      ! FileManager for APartij
Relate:APartij       &RelationManager,THREAD,EXTERNAL,DLL  ! RelationManager for APartij
Access:AAViewArtikel &FileManager,THREAD,EXTERNAL,DLL      ! FileManager for AAViewArtikel
Relate:AAViewArtikel &RelationManager,THREAD,EXTERNAL,DLL  ! RelationManager for AAViewArtikel
Access:AAPartij      &FileManager,THREAD,EXTERNAL,DLL      ! FileManager for AAPartij
Relate:AAPartij      &RelationManager,THREAD,EXTERNAL,DLL  ! RelationManager for AAPartij
Access:AVoorraadVerloop &FileManager,THREAD,EXTERNAL,DLL   ! FileManager for AVoorraadVerloop
Relate:AVoorraadVerloop &RelationManager,THREAD,EXTERNAL,DLL ! RelationManager for AVoorraadVerloop
Access:AAViewTransporteur &FileManager,THREAD,EXTERNAL,DLL ! FileManager for AAViewTransporteur
Relate:AAViewTransporteur &RelationManager,THREAD,EXTERNAL,DLL ! RelationManager for AAViewTransporteur

GlobalRequest        BYTE,EXTERNAL,DLL,THREAD              ! Exported from a dll, set when a browse calls a form, to let it know action to perform
GlobalResponse       BYTE,EXTERNAL,DLL,THREAD              ! Exported from a dll, set to the response from the form
VCRRequest           LONG,EXTERNAL,DLL,THREAD              ! Exported from a dll, set to the request from the VCR buttons
FuzzyMatcher         FuzzyClass                            ! Global fuzzy matcher
LocalErrorStatus     ErrorStatusClass,THREAD
LocalErrors          ErrorClass
LocalINIMgr          INIClass
GlobalErrors         &ErrorClass
INIMgr               &INIClass
DLLInitializer       CLASS                                 ! An object of this type is used to initialize the dll, it is created in the generated bc module
Construct              PROCEDURE
Destruct               PROCEDURE
                     END

  CODE
DLLInitializer.Construct PROCEDURE


  CODE
  LocalErrors.Init(LocalErrorStatus)
  LocalINIMgr.Init('JMDVoorr.ini', NVD_INI)                ! Initialize the local INI manager to use windows INI file
  INIMgr &= LocalINIMgr
  IF GlobalErrors &= NULL
    GlobalErrors &= LocalErrors                            ! Assign local managers to global managers
  END
  FuzzyMatcher.Init                                        ! Initilaize the browse 'fuzzy matcher'
  FuzzyMatcher.SetOption(MatchOption:NoCase, 1)            ! Configure case matching
  FuzzyMatcher.SetOption(MatchOption:WordOnly, 0)          ! Configure 'word only' matching
                             ! Begin Generated by NetTalk Extension Template
    if ~command ('/netnolog') and (command ('/nettalklog') or command ('/nettalklogerrors') or command ('/neterrors') or command ('/netall'))
      NetDebugTrace ('[Nettalk Template] NetTalk Template version 8.71')
      NetDebugTrace ('[Nettalk Template] NetTalk Template using Clarion ' & 10000)
      NetDebugTrace ('[Nettalk Template] NetTalk Object version ' & NETTALK:VERSION )
      NetDebugTrace ('[Nettalk Template] ABC Template Chain')
    end
                             ! End Generated by Extension Template
     db.init('VoorrVrd',0,50)  ! intiialize the debuger class 
  
NetRefreshPlanningViews PROCEDURE
	CODE
		ThisNetRefresh.Send('|Planning|APlanning|AAPlanning|ViewPlanningPartij|ViewVoorraadPlanning|PlanningInkoop|PlanningVerkoop|PlanningOverboeking|APlanningInkoop|APlanningVerkoop|APlanningOverboeking|Inkoop|AInkoop|Verkoop|AVerkoop|') ! NetTalk (NetRefresh)
	!END
NetRefreshVoorraadViews PROCEDURE
	CODE
		ThisNetRefresh.Send('|Partij|APartij|Mutatie|AMutatie|ViewVoorraadCelTotaal|AViewVoorraadCelTotaal|ViewVoorraadPartij|AViewVoorraadPartij|AAViewVoorraadPartij|AAAViewVoorraadPartij|AAAAViewVoorraadPartij|ViewVoorraadPlanning|VoorraadVerloop|') ! NetTalk (NetRefresh)
	!END
include('GlobalClassSrc.inc')
include('CachingClassSrc.inc')
include('SnelheidLogClassSrc.inc')
!These procedures are used to initialize the DLL. It must be called by the main executable when it starts up
VoorrVrd:Init PROCEDURE(<ErrorClass curGlobalErrors>, <INIClass curINIMgr>)
VoorrVrd:Init_Called    BYTE,STATIC

  CODE
  IF VoorrVrd:Init_Called
     RETURN
  ELSE
     VoorrVrd:Init_Called = True
  END
  IF ~curGlobalErrors &= NULL
    GlobalErrors &= curGlobalErrors
  END
  IF ~curINIMgr &= NULL
    INIMgr &= curINIMgr
  END
  Access:ViewArtikel.SetErrors(GlobalErrors)
  Access:Partij.SetErrors(GlobalErrors)
  Access:Relatie.SetErrors(GlobalErrors)
  Access:Verpakking.SetErrors(GlobalErrors)
  Access:ViewVoorraadPlanning.SetErrors(GlobalErrors)
  Access:Cel.SetErrors(GlobalErrors)
  Access:Mutatie.SetErrors(GlobalErrors)
  Access:Inkoop.SetErrors(GlobalErrors)
  Access:Planning.SetErrors(GlobalErrors)
  Access:Verkoop.SetErrors(GlobalErrors)
  Access:Sjabloon.SetErrors(GlobalErrors)
  Access:ViewVoorraadCelTotaal.SetErrors(GlobalErrors)
  Access:VoorraadVerloop.SetErrors(GlobalErrors)
  Access:PalletMutatie.SetErrors(GlobalErrors)
  Access:PalletVerloop.SetErrors(GlobalErrors)
  Access:ViewTransporteur.SetErrors(GlobalErrors)
  Access:ViewVoorraadPartij.SetErrors(GlobalErrors)
  Access:ViewPlanningPartij.SetErrors(GlobalErrors)
  Access:ArtikelOmschrijvingExtra.SetErrors(GlobalErrors)
  Access:CelLocatie.SetErrors(GlobalErrors)
  Access:ViewPartijCelLocaties.SetErrors(GlobalErrors)
  Access:ViewVoorraadPartij_INDEXED.SetErrors(GlobalErrors)
  Access:ViewPalletTegoeden.SetErrors(GlobalErrors)
  Access:ViewPlanningPartijTotaal.SetErrors(GlobalErrors)
  Access:ViewVoorraadPartijTotaal.SetErrors(GlobalErrors)
  Access:SnelheidLogging.SetErrors(GlobalErrors)
  Access:PartijCelVoorraad.SetErrors(GlobalErrors)
  Access:RelatieArtikelOmschrijving.SetErrors(GlobalErrors)
  Access:ARelatie.SetErrors(GlobalErrors)
  Access:APlanning.SetErrors(GlobalErrors)
  Access:AVerkoop.SetErrors(GlobalErrors)
  Access:AViewArtikel.SetErrors(GlobalErrors)
  Access:AARelatie.SetErrors(GlobalErrors)
  Access:ACel.SetErrors(GlobalErrors)
  Access:AACel.SetErrors(GlobalErrors)
  Access:AViewVoorraadCelTotaal.SetErrors(GlobalErrors)
  Access:AVerpakking.SetErrors(GlobalErrors)
  Access:AAARelatie.SetErrors(GlobalErrors)
  Access:AViewTransporteur.SetErrors(GlobalErrors)
  Access:APalletMutatie.SetErrors(GlobalErrors)
  Access:APalletVerloop.SetErrors(GlobalErrors)
  Access:APartij.SetErrors(GlobalErrors)
  Access:AAViewArtikel.SetErrors(GlobalErrors)
  Access:AAPartij.SetErrors(GlobalErrors)
  Access:AVoorraadVerloop.SetErrors(GlobalErrors)
  Access:AAViewTransporteur.SetErrors(GlobalErrors)
  VOORRSTM:Init(curGlobalErrors, curINIMgr)                ! Initialise dll - (ABC) -
  VOORRRPT:Init(curGlobalErrors, curINIMgr)                ! Initialise dll - (ABC) -
  VOORRPLN:Init(curGlobalErrors, curINIMgr)                ! Initialise dll - (ABC) -

!This procedure is used to shutdown the DLL. It must be called by the main executable before it closes down

VoorrVrd:Kill PROCEDURE
VoorrVrd:Kill_Called    BYTE,STATIC

  CODE
  IF VoorrVrd:Kill_Called
     RETURN
  ELSE
     VoorrVrd:Kill_Called = True
  END
  VOORRSTM:Kill()                                          ! Kill dll - (ABC) -
  VOORRRPT:Kill()                                          ! Kill dll - (ABC) -
  VOORRPLN:Kill()                                          ! Kill dll - (ABC) -
  

DLLInitializer.Destruct PROCEDURE

  CODE
                             ! Begin Generated by NetTalk Extension Template
    NetCloseCallBackWindow() ! Tell NetTalk DLL to shutdown it's WinSock Call Back Window
  
    if ~command ('/netnolog') and (command ('/nettalklog') or command ('/nettalklogerrors') or command ('/neterrors') or command ('/netall'))
      NetDebugTrace ('[Nettalk Template] NetTalk Template version 8.71')
      NetDebugTrace ('[Nettalk Template] NetTalk Template using Clarion ' & 10000)
      NetDebugTrace ('[Nettalk Template] Closing Down NetTalk (Object) version ' & NETTALK:VERSION)
    end
                             ! End Generated by Extension Template
     db.kill
  FuzzyMatcher.Kill                                        ! Destroy fuzzy matcher
  LocalINIMgr.Kill                                         ! Kill local managers and assign NULL to global refernces
  INIMgr &= NULL                                           ! It is an error to reference these object after this point
  GlobalErrors &= NULL


