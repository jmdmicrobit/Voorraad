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
StringTheory:TemplateVersion equate('3.46')
WinEvent:TemplateVersion      equate('5.35')

   INCLUDE('ABERROR.INC'),ONCE
   INCLUDE('ABFILE.INC'),ONCE
   INCLUDE('ABUTIL.INC'),ONCE
   INCLUDE('EFOCUS.INC'),ONCE
   INCLUDE('ERRORS.CLW'),ONCE
   INCLUDE('KEYCODES.CLW'),ONCE
   INCLUDE('ABFUZZY.INC'),ONCE
  include('cwsynchc.inc'),once  ! added by NetTalk
 Include('Debuger.INC'),once
  include('StringTheory.Inc'),ONCE
  INCLUDE('UltimateDebug.INC'),ONCE
  INCLUDE('UltimateDebugProcedureTracker.INC'),ONCE
    Include('WinEvent.Inc'),Once
   INCLUDE('ABEIP.INC')
   INCLUDE('KCRQEIP.INC')

   MAP
    MODULE('VOORRRPT.DLL')
ReportCMR              PROCEDURE(LONG),DLL                 ! 
ReportDymoStickers     PROCEDURE(LONG, LONG),DLL           ! 
ReportVerkoop          PROCEDURE(LONG, BYTE),DLL           ! 
ReportInkoop           PROCEDURE(LONG, Byte),DLL           ! 
ReportInslag           PROCEDURE,DLL                       ! 
ReportPalletStickers   FUNCTION(),Long,DLL                 ! 
ReportWeeglijst        PROCEDURE(STRING, LONG),DLL         ! 
ReportWeeglijstExcel   PROCEDURE(STRING, LONG),DLL         ! 
WindowCallSjabloon     PROCEDURE(String,String),DLL        ! 
ReportUitslag          PROCEDURE,DLL                       ! 
ReportOverboeking      PROCEDURE(LONG),DLL                 ! 
ReportVerkoopMutaties  PROCEDURE(LONG),DLL                 ! 
ReportPalletBladEnkel  PROCEDURE(LONG,REAL, BYTE, BYTE),DLL ! 
ReportPalletBlad       PROCEDURE(LONG),DLL                 ! 
WindowPalletbladExport PROCEDURE,DLL                       ! 
ReportVerkoopBevestiging PROCEDURE(LONG),DLL               ! 
ReportInkoopBevestiging PROCEDURE(LONG),DLL                ! 
ExportVerkoop          PROCEDURE(LONG, LONG),DLL           ! 
ReportPackLijst        PROCEDURE(LONG pVerkoopID,LONG pWelk,String pLayout,<Byte pExcel>),DLL ! 
    END
    MODULE('VOORRSTM.DLL')
SelectArelatie         PROCEDURE(String),DLL               ! 
BrowseSjablonen        PROCEDURE,DLL                       ! 
UpdateRelatieArtikelOmschrijving PROCEDURE,DLL             ! 
UpdateRelatieAdres     PROCEDURE,DLL                       ! 
    END
    MODULE('VOORRDCT.DLL')
ExportInvoiceXML       PROCEDURE(<VER:Record>, <Ink:Record>, String),DLL ! 
LogSetSort             PROCEDURE(String pTabel, String pBericht),DLL ! 
    END
!--- Application Global and Exported Procedure Definitions --------------------------------------------
     MODULE('VOORRPLN001.CLW')
WindowCelLocaties      PROCEDURE   !
     END
     MODULE('VOORRPLN002.CLW')
MainPlanning           PROCEDURE   !
     END
     MODULE('VOORRPLN003.CLW')
UpdateOverboekPlanningVanuitVV PROCEDURE   !Form Mutatie
     END
     MODULE('VOORRPLN004.CLW')
UpdateEUitslagMutatie  PROCEDURE   !Form Mutatie
     END
     MODULE('VOORRPLN005.CLW')
UpdateEInslagMutatie   PROCEDURE   !Form Mutatie
     END
     MODULE('VOORRPLN006.CLW')
BrowseVerkoop          PROCEDURE   !Browse the Verkoop file
     END
     MODULE('VOORRPLN007.CLW')
WindowBoekRetourRegel  PROCEDURE(LONG pPlanningID,*DECIMAL pRetourKg,*LONG pRetourPallets,*LONG pCelID,*LONG pCelLokatieID, *CString pBehandeldDoor, *CString pTemperatuur1, *CString pTemperatuur2, *CString pTemperatuur3, *CString pTemperatuurVervoermiddel)   !
     END
     MODULE('VOORRPLN008.CLW')
WindowRedenRetour      FUNCTION(string, Long, *CString, *Date),Byte   !
     END
     MODULE('VOORRPLN009.CLW')
UpdateVerkoop          PROCEDURE(LONG = 0)   !Form Verkoop
     END
     MODULE('VOORRPLN010.CLW')
UpdateExtraKosten      PROCEDURE   !Form ExtraKosten
     END
     MODULE('VOORRPLN011.CLW')
UpdatePlanningVerkoop  PROCEDURE   !Form Planning
     END
     MODULE('VOORRPLN012.CLW')
UpdateAOverboeking     PROCEDURE(BYTE, <STRING>,<STRING>,<LONG>,<LONG>, <REAL>)   !Form Planning
     END
     MODULE('VOORRPLN013.CLW')
UpdateActiviteit       PROCEDURE(LONG)   !Form Activiteit
     END
     MODULE('VOORRPLN014.CLW')
BrowseSSOPRegistratie  PROCEDURE   !
     END
     MODULE('VOORRPLN015.CLW')
BrowsePlanning         PROCEDURE   !Planning
     END
     MODULE('VOORRPLN016.CLW')
WindowInslagWeging     PROCEDURE   !
     END
     MODULE('VOORRPLN017.CLW')
WeegWindow             PROCEDURE   !
     END
     MODULE('VOORRPLN018.CLW')
UpdateUitslagMutatieWegingQueue PROCEDURE   !Window
     END
     MODULE('VOORRPLN019.CLW')
WindowInslag           PROCEDURE   !
     END
     MODULE('VOORRPLN020.CLW')
UpdateUitslagMutatieQueueWeging PROCEDURE(STRING, LONG)   !Window
     END
     MODULE('VOORRPLN021.CLW')
UpdateUitslagMutatieWeging PROCEDURE   !Uitslage via Weging
     END
     MODULE('VOORRPLN022.CLW')
CheckISOCountries      FUNCTION(String), BYTE   !
     END
     MODULE('VOORRPLN023.CLW')
UpdateUitslagMutatieQueue PROCEDURE(STRING)   !Window
     END
     MODULE('VOORRPLN024.CLW')
UpdateUitslagMutatie   PROCEDURE   !Handmatige uitslag
     END
     MODULE('VOORRPLN025.CLW')
UpdateOverboekMutatieEnkel PROCEDURE   !Form Mutatie
     END
     MODULE('VOORRPLN026.CLW')
UpdateOverboekingMutatieQueue PROCEDURE   !
     END
     MODULE('VOORRPLN027.CLW')
UpdateOverboekMutatie  PROCEDURE   !Form Mutatie
     END
     MODULE('VOORRPLN028.CLW')
BulkOverboekMutatieWijzigen PROCEDURE   !Form Mutatie
     END
     MODULE('VOORRPLN029.CLW')
BulkOverboekMutatieMaken PROCEDURE   !Form Mutatie
     END
     MODULE('VOORRPLN030.CLW')
UpdateTransfers        PROCEDURE(<DATE>)   !Form OverboekingRit
     END
     MODULE('VOORRPLN031.CLW')
BrowseTransfers        PROCEDURE(<DATE>)   !Browse the OverboekingRit file
     END
     MODULE('VOORRPLN032.CLW')
UpdateOverboeking      PROCEDURE(<STRING>,<STRING>,<LONG>,<LONG>, <REAL>)   !Form Planning
     END
     MODULE('VOORRPLN033.CLW')
BrowseOverboeking      PROCEDURE   !Browse the Planning file
     END
     MODULE('VOORRPLN034.CLW')
BrowseInkoop           PROCEDURE   !Browse the Inkoop file
     END
     MODULE('VOORRPLN035.CLW')
UpdateInkoop           PROCEDURE(LONG = 0)   !Form Inkoop
     END
     MODULE('VOORRPLN036.CLW')
UpdatePlanningInkoop   PROCEDURE   !Form Planning
     END
     MODULE('VOORRPLN037.CLW')
BrowseActiviteit       PROCEDURE   !Browse the Activiteit file
     END
     MODULE('VOORRPLN038.CLW')
UpdateVerkoopExport    PROCEDURE   !Packlijst gegevens, uitbreiding van verkoop
     END
     MODULE('VOORRPLN039.CLW')
UpdateMutatieKwaliteit PROCEDURE   !Form Mutatie
     END
     MODULE('VOORRPLN040.CLW')
UpdatePartijKwaliteit  PROCEDURE   !Form Partij
     END
     	MODULE('win32')
             OMIT('***',_WIDTH32_)
           FindWindow(LONG,*CSTRING), UNSIGNED, PASCAL, RAW
             ***
             COMPILE('***',_WIDTH32_)
           FindWindow(LONG,*CSTRING), UNSIGNED, PASCAL, RAW, NAME('FindWindowA')
             ***
     
           SetForegroundWindow(UNSIGNED), SIGNED, PROC, PASCAL
     
     	END
     
     	NetRefreshPlanningViews()
     	NetRefreshVoorraadViews()

DebugABCGlobalInformation_VoorrPln PROCEDURE()                                           ! DEBUG Prototype
DebugABCGlobalVariables_VoorrPln PROCEDURE()                                             ! DEBUG Prototype

    ! Declare functions defined in this DLL
VoorrPln:Init          PROCEDURE(<ErrorClass curGlobalErrors>, <INIClass curINIMgr>)
VoorrPln:Kill          PROCEDURE
    ! Declare init functions defined in a different dll
     MODULE('VOORRRPT.DLL')
VOORRRPT:Init          PROCEDURE(<ErrorClass curGlobalErrors>, <INIClass curINIMgr>),DLL
VOORRRPT:Kill          PROCEDURE,DLL
     END
     MODULE('VOORRSTM.DLL')
VOORRSTM:Init          PROCEDURE(<ErrorClass curGlobalErrors>, <INIClass curINIMgr>),DLL
VOORRSTM:Kill          PROCEDURE,DLL
     END
     MODULE('VOORRDCT.DLL')
VoorrDct:Init          PROCEDURE(<ErrorClass curGlobalErrors>, <INIClass curINIMgr>),DLL
VoorrDct:Kill          PROCEDURE,DLL
     END
   END

  include('StringTheory.Inc'),ONCE
GLO:OWNER            STRING(200),EXTERNAL,DLL(_ABCDllMode_)
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
ProductionDate         DATE
THTDate                DATE
HarvastDate            DATE
                     END
GLO:WegingQueue      QUEUE,PRE(WGQ),THREAD,EXTERNAL,DLL(_ABCDllMode_)
BrutoGewichtKG         DECIMAL(10,2)
Palletsoort            STRING(10)
PalletsoortID          LONG
NettoGewichtKG         DECIMAL(10,2)
Datum                  DATE
Tijd                   TIME
PalletID               LONG
ProductionDate         DATE
THTDate                DATE
HarvastDate            DATE
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
GLO:PartnerQ         QUEUE,PRE(PQ),EXTERNAL,DLL(_ABCDllMode_)
PartnerID              LONG
PartnerName            CSTRING(100)
ConnectionString       CSTRING(255)
ArtikelEval            CSTRING(255)
RelatieEval            CSTRING(255)
Titel                  CSTRING(100)
Achtergrond            LONG
IniFile                CSTRING(256)
StandaardEenheid       CSTRING(21)
                     END
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
Blokkade                    STRING(8)                      !                     
Blokkade_GROUP              GROUP,OVER(Blokkade)           !                     
Blokkade_DATE                 DATE                         !                     
Blokkade_TIME                 TIME                         !                     
                            END                            !                     
deBlokkade                  STRING(8)                      !                     
deBlokkade_GROUP            GROUP,OVER(deBlokkade)         !                     
deBlokkade_DATE               DATE                         !                     
deBlokkade_TIME               TIME                         !                     
                            END                            !                     
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
NietActief                  BYTE                           !                     
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
Cel_FK1                  KEY(CEL:Volgnr,CEL:CelID),NOCASE  ! Op Volgnr, CelID    
Record                   RECORD,PRE()
CelID                       LONG                           !                     
CelOms                      CSTRING(51)                    !                     
Breedte                     LONG                           !                     
Lengte                      LONG                           !                     
Volgnr                      LONG                           !                     
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
Valuta                      CSTRING(51)                    !                     
Koersverschil               DECIMAL(11,3)                  !                     
                         END
                     END                       

Planning             FILE,DRIVER('MSSQL'),PRE(Pla),BINDABLE,THREAD,EXTERNAL(''),DLL(dll_mode) !                     
Datum_Tijd_K             KEY(Pla:Planning,Pla:PlanningID),DUP !                     
OverboekingCelID_Planning_K KEY(Pla:OverboekingCelID,Pla:Planning,Pla:PlanningID),DUP !                     
PK_Planning              KEY(Pla:PlanningID),PRIMARY       !                     
Planning_FK01            KEY(Pla:InkoopID,Pla:PlanningID),DUP,NOCASE ! Op InkoopID/Planning
Planning_FK02            KEY(Pla:VerkoopID,Pla:PlanningID),DUP ! Op VerkoopID. PlanningID
Planning_FK03            KEY(Pla:Planning),DUP             ! Op Planning         
Planning_FK04            KEY(Pla:OverboekingPlanningID),DUP,NOCASE !                     
Planning_FK05            KEY(Pla:InkoopID),DUP,NOCASE      !                     
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
Verkoop_FK3              KEY(Ver2:Exported,Ver2:Klant,-Ver2:Planning),DUP ! Op Exported, Klant, Verkoop
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

PlanningInkoop       FILE,DRIVER('MSSQL'),PRE(Pla2),BINDABLE,THREAD,EXTERNAL(''),DLL(dll_mode) !                     
Planning_K               KEY(Pla2:Planning,Pla2:PlanningID),DUP,NOCASE !                     
PlanningID_K             KEY(Pla2:PlanningID),NOCASE,PRIMARY !                     
Planning_FirmaNaam_K     KEY(Pla2:Planning,Pla2:FirmaNaam,Pla2:PlanningID),DUP,NOCASE !                     
Verwerkt_Planning_FirmaNaam_K KEY(Pla2:Verwerkt,Pla2:Planning,Pla2:FirmaNaam,Pla2:PlanningID),DUP,NOCASE !                     
Verwerkt_Planning_K      KEY(Pla2:Verwerkt,Pla2:Planning,Pla2:PlanningID),DUP,NOCASE !                     
Record                   RECORD,PRE()
PlanningID                  LONG                           !                     
Leverancier                 LONG                           !                     
ArtikelID                   CSTRING(31)                    !                     
KG                          DECIMAL(10,2)                  !                     
MutatieKG                   DECIMAL(10,2)                  !                     
MutatiePallets              LONG                           !                     
Pallets                     LONG                           !                     
Instructie                  CSTRING(101)                   !                     
Transport                   CSTRING(101)                   !                     
Planning                    STRING(8)                      !                     
Planning_GROUP              GROUP,OVER(Planning)           !                     
Planning_DATE                 DATE                         !                     
Planning_TIME                 TIME                         !                     
                            END                            !                     
Geprint                     BYTE                           !                     
MutatieGemaakt              BYTE                           !                     
Memo                        CSTRING(101)                   !                     
InkoopID                    LONG                           !                     
FirmaNaam                   STRING(50)                     !                     
CelID                       LONG                           !                     
CelOms                      CSTRING(51)                    !                     
PartijID                    LONG                           !                     
Verwerkt                    BYTE                           !                     
ExternPartijnr              CSTRING(21)                    !                     
ArtikelOms                  CSTRING(61)                    !                     
VerpakkingID                LONG                           !                     
VerpakkingOmschrijving      CSTRING(51)                    !                     
Gewogen                     BYTE                           !                     
CelLocatieID                LONG                           !                     
Locatienaam                 STRING(50)                     !                     
                         END
                     END                       

PlanningVerkoop      FILE,DRIVER('MSSQL'),PRE(Pla3),BINDABLE,THREAD,EXTERNAL(''),DLL(dll_mode) !                     
PlanningID_K             KEY(Pla3:PlanningID),NOCASE,PRIMARY !                     
Verwerkt_Planning_FirmaNaam_K KEY(Pla3:Verwerkt,Pla3:Planning,Pla3:FirmaNaam,Pla3:PlanningID),DUP,NOCASE !                     
Planning_FirmaNaam_K     KEY(Pla3:Planning,Pla3:FirmaNaam,Pla3:PlanningID),DUP,NOCASE !                     
Planning_K               KEY(Pla3:Planning,Pla3:PlanningID),DUP,NOCASE !                     
Verwerkt_Planning_K      KEY(Pla3:Verwerkt,Pla3:Planning,Pla3:PlanningID),DUP,NOCASE !                     
Record                   RECORD,PRE()
PlanningID                  LONG                           !                     
ArtikelID                   CSTRING(31)                    !                     
KG                          DECIMAL(10,2)                  !                     
MutatieKG                   DECIMAL(10,2)                  !                     
MutatiePallets              LONG                           !                     
Pallets                     LONG                           !                     
Geprint                     BYTE                           !                     
MutatieGemaakt              BYTE                           !                     
Verwerkt                    BYTE                           !                     
Transport                   CSTRING(101)                   !                     
Instructie                  CSTRING(101)                   !                     
Klant                       LONG                           !                     
VerkoopID                   LONG                           !                     
Planning                    STRING(8)                      !                     
Planning_GROUP              GROUP,OVER(Planning)           !                     
Planning_DATE                 DATE                         !                     
Planning_TIME                 TIME                         !                     
                            END                            !                     
FirmaNaam                   CSTRING(51)                    !                     
CelID                       LONG                           !                     
CelOms                      CSTRING(51)                    !                     
PartijID                    LONG                           !                     
ExternPartijnr              CSTRING(21)                    !                     
ArtikelOms                  CSTRING(61)                    !                     
VerpakkingID                LONG                           !                     
VerpakkingOmschrijving      CSTRING(51)                    !                     
LeverancierID               LONG                           !                     
LeverancierFirmaNaam        CSTRING(51)                    !                     
Gewogen                     BYTE                           !                     
HerkomstOverboekingCelID    LONG                           !                     
HerkomstOverboekingCelOms   CSTRING(51)                    !                     
                         END
                     END                       

RelatieAdres         FILE,DRIVER('MSSQL'),PRE(RAD),BINDABLE,THREAD,EXTERNAL(''),DLL(dll_mode) !                     
PK_RelatieAdres          KEY(RAD:ID),PRIMARY               !                     
RelatieID_ID_K           KEY(RAD:RelatieID,RAD:ID),DUP,NOCASE !                     
Record                   RECORD,PRE()
ID                          LONG                           !                     
RelatieID                   LONG                           !                     
Adres1                      CSTRING(101)                   !                     
Adres2                      CSTRING(101)                   !                     
Postcode                    CSTRING(11)                    !                     
Plaats                      CSTRING(101)                   !                     
Land                        CSTRING(101)                   !                     
Telefoon                    CSTRING(21)                    !                     
Mobiel                      CSTRING(21)                    !                     
Fax                         CSTRING(21)                    !                     
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
Blokkade                    STRING(8)                      !                     
Blokkade_GROUP              GROUP,OVER(Blokkade)           !                     
Blokkade_DATE                 DATE                         !                     
Blokkade_TIME                 TIME                         !                     
                            END                            !                     
deBlokkade                  STRING(8)                      !                     
deBlokkade_GROUP            GROUP,OVER(deBlokkade)         !                     
deBlokkade_DATE               DATE                         !                     
deBlokkade_TIME               TIME                         !                     
                            END                            !                     
                         END
                     END                       

CMR                  FILE,DRIVER('MSSQL'),PRE(CMR),BINDABLE,THREAD,EXTERNAL(''),DLL(dll_mode) !                     
CMR_PK                   KEY(CMR:CMRID),PRIMARY            !                     
CMR_FK1                  KEY(CMR:VerkoopID,CMR:CMRID),DUP,NOCASE ! Op VerkoopID/CMRID  
Record                   RECORD,PRE()
CMRID                       LONG                           !                     
VerkoopID                   LONG                           !                     
Expediteur                  CSTRING(1001)                  !                     
Geadresseerde               CSTRING(1001)                  !                     
Transporteur                CSTRING(1001)                  !                     
AfleverAdres                CSTRING(1001)                  !                     
TransporteurExtra           CSTRING(1001)                  !                     
AfkomstAdres                CSTRING(1001)                  !                     
OpmerkingenVervoerder       CSTRING(1001)                  !                     
ExtraDocumenten             CSTRING(1001)                  !                     
Artikel                     CSTRING(1001)                  !                     
Instructie                  CSTRING(1001)                  !                     
SpecialeOvereenkomst        CSTRING(1001)                  !                     
Frankeringsvoorschrift      CSTRING(1001)                  !                     
IsTruckClean                LONG                           !                     
IsPackingGoodsOK            LONG                           !                     
ISDriverDressedCorrectly    LONG                           !                     
EC_LabelsOnTheGoods         LONG                           !                     
OpgemaaktTe                 CSTRING(1001)                  !                     
HandtekeningStempelAfzender CSTRING(1001)                  !                     
Kenteken                    CSTRING(1001)                  !                     
ProductLabelsOnGoods        BYTE                           !                     
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

OverboekingRit       FILE,DRIVER('MSSQL'),PRE(OR),BINDABLE,THREAD,EXTERNAL(''),DLL(dll_mode) !                     
PK_OverboekingRit        KEY(OR:OverboekingRitID),PRIMARY  !                     
FK_OverboekingRit        KEY(OR:DatumTijd,OR:OverboekingRitID),DUP !                     
Record                   RECORD,PRE()
OverboekingRitID            LONG                           !                     
DatumTijd                   STRING(8)                      !                     
DatumTijd_GROUP             GROUP,OVER(DatumTijd)          !                     
DatumTijd_DATE                DATE                         !                     
DatumTijd_TIME                TIME                         !                     
                            END                            !                     
Opmerking                   CSTRING(101)                   !                     
                         END
                     END                       

OverboekingRitRegel  FILE,DRIVER('MSSQL'),PRE(ORR),BINDABLE,THREAD,EXTERNAL(''),DLL(dll_mode) !                     
PK_OverboekingRitRegel   KEY(ORR:OverboekingRitRegelID),PRIMARY !                     
FK_OverboekingRitRegel   KEY(ORR:OverboekingRitID,ORR:OverboekingRitRegelID),DUP !                     
FK2_OverboekingRitRegel  KEY(ORR:PlanningID,ORR:OverboekingRitRegelID),DUP,NOCASE !                     
Record                   RECORD,PRE()
OverboekingRitRegelID       LONG                           !                     
OverboekingRitID            LONG                           !                     
PlanningID                  LONG                           !                     
                         END
                     END                       

BulkOverboeking      FILE,DRIVER('MSSQL'),PRE(BOV),BINDABLE,THREAD,EXTERNAL(''),DLL(dll_mode) ! BulkOverboeking     
PK_BulkOverboeking       KEY(BOV:BulkOverboekingID),PRIMARY !                     
FK1_BulkOverboeking      KEY(BOV:PlanningID,BOV:BulkOverboekingID),DUP !                     
Record                   RECORD,PRE()
BulkOverboekingID           LONG                           !                     
PlanningID                  LONG                           !                     
ArtikelID                   CSTRING(31)                    !                     
VerpakkingID                LONG                           !                     
VanCelID                    LONG                           !                     
NaarCelID                   LONG                           !                     
AantalKG                    DECIMAL(9,2)                   !                     
MutatieDatumTijd            STRING(8)                      !                     
MutatieDatumTijd_GROUP      GROUP,OVER(MutatieDatumTijd)   !                     
MutatieDatumTijd_DATE         DATE                         !                     
MutatieDatumTijd_TIME         TIME                         !                     
                            END                            !                     
NaarCelLocatieID            LONG                           !                     
                         END
                     END                       

PlanningOverboeking  FILE,DRIVER('MSSQL'),PRE(Pla4),BINDABLE,THREAD,EXTERNAL(''),DLL(dll_mode) !                     
PlanningID_K             KEY(Pla4:PlanningID),NOCASE,PRIMARY !                     
Planning_K               KEY(Pla4:Planning,Pla4:PlanningID),DUP,NOCASE !                     
Planning_FirmaNaam_k     KEY(Pla4:Planning,Pla4:FirmaNaam,Pla4:PlanningID),DUP,NOCASE !                     
Verwerkt_Planning_K      KEY(Pla4:Verwerkt,Pla4:Planning,Pla4:PlanningID),DUP,NOCASE !                     
Verwerkt_Planning_FirmaNaam_K KEY(Pla4:Verwerkt,Pla4:Planning,Pla4:FirmaNaam,Pla4:PlanningID),DUP,NOCASE !                     
Record                   RECORD,PRE()
PlanningID                  LONG                           !                     
ArtikelID                   CSTRING(31)                    !                     
KG                          DECIMAL(10,2)                  !                     
MutatieKG                   DECIMAL(10,2)                  !                     
MutatiePallets              LONG                           !                     
Pallets                     LONG                           !                     
Transport                   CSTRING(101)                   !                     
Planning                    STRING(8)                      !                     
Planning_GROUP              GROUP,OVER(Planning)           !                     
Planning_DATE                 DATE                         !                     
Planning_TIME                 TIME                         !                     
                            END                            !                     
Geprint                     BYTE                           !                     
MutatieGemaakt              BYTE                           !                     
Verwerkt                    BYTE                           !                     
Memo                        CSTRING(101)                   !                     
Instructie                  CSTRING(101)                   !                     
FirmaNaam                   STRING(50)                     !                     
Celid                       LONG                           !                     
CelOms                      CSTRING(51)                    !                     
PartijID                    LONG                           !                     
ExternPartijnr              CSTRING(21)                    !                     
ArtikelOms                  CSTRING(61)                    !                     
VerpakkingID                LONG                           !                     
VerpakkingOmschrijving      CSTRING(51)                    !                     
NaarCelID                   LONG                           !                     
NaarCelOms                  CSTRING(51)                    !                     
CelLocatieID                LONG                           !                     
Locatienaam                 STRING(50)                     !                     
NaarLocatienaam             STRING(50)                     !                     
OverboekSoort               CSTRING(51)                    !                     
                         END
                     END                       

DubbeleInslagMutaties FILE,DRIVER('MSSQL'),PRE(Dub),BINDABLE,THREAD,EXTERNAL(''),DLL(dll_mode) !                     
Partij_CelID_K           KEY(Dub:PartijID,Dub:CelID),DUP,NOCASE !                     
Record                   RECORD,PRE()
PartijID                    LONG                           !                     
CelID                       LONG                           !                     
AantalInslagen              LONG                           !                     
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

PalletSoort          FILE,DRIVER('MSSQL'),PRE(PalSrt),BINDABLE,THREAD,EXTERNAL(''),DLL(dll_mode) !                     
PK_PalletSoort           KEY(PalSrt:PalletSoortID),PRIMARY !                     
FK_PalletSoort           KEY(PalSrt:PalletOmschrijving,PalSrt:PalletSoortID),NOCASE ! Op PalletOmschrijving/PalletSoortID
Record                   RECORD,PRE()
PalletSoortID               LONG                           !                     
PalletOmschrijving          CSTRING(11)                    !                     
Tarra                       DECIMAL(18,2)                  !                     
                         END
                     END                       

Weging               FILE,DRIVER('MSSQL'),PRE(Weg),BINDABLE,THREAD,EXTERNAL(''),DLL(dll_mode) !                     
PK_Weging                KEY(Weg:WegingID),PRIMARY         !                     
FK_Weging                KEY(Weg:MutatieID,Weg:WegingID),DUP !                     
Record                   RECORD,PRE()
WegingID                    LONG,NAME('WegingID | READONLY') !                     
MutatieID                   LONG                           !                     
BrutoGewicht                DECIMAL(18,2)                  !                     
NettoGewicht                DECIMAL(18,2)                  !                     
PalletSoortID               LONG                           !                     
Tarra                       DECIMAL(18,2)                  !                     
WeegDatumTijd               STRING(8)                      !                     
WeegDatumTijd_GROUP         GROUP,OVER(WeegDatumTijd)      !                     
WeegDatum                     DATE                         !                     
WeegTijdstip                  TIME                         !                     
                            END                            !                     
PalletID                    LONG                           ! Niet veranderde identifier om een weging / pallet te identificieren
ProductionDate              STRING(8)                      !                     
ProductionDate_GROUP        GROUP,OVER(ProductionDate)     !                     
ProductionDate_DATE           DATE                         !                     
ProductionDate_TIME           TIME                         !                     
                            END                            !                     
THTDate                     STRING(8)                      !                     
THTDate_GROUP               GROUP,OVER(THTDate)            !                     
THTDate_DATE                  DATE                         !                     
THTDate_TIME                  TIME                         !                     
                            END                            !                     
HarvastDate                 STRING(8)                      !                     
HarvastDate_GROUP           GROUP,OVER(HarvastDate)        !                     
HarvastDate_DATE              DATE                         !                     
HarvastDate_TIME              TIME                         !                     
                            END                            !                     
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

Gebruiker            FILE,DRIVER('MSSQL'),PRE(Geb),BINDABLE,THREAD,EXTERNAL(''),DLL(dll_mode) !                     
PK_Gebruiker             KEY(Geb:ID),NOCASE,PRIMARY        !                     
FK1_Gebruiker            KEY(Geb:WindowsInlog),NOCASE      !                     
FK2_Gebruiker            KEY(Geb:res_id),DUP,NOCASE        !                     
Record                   RECORD,PRE()
ID                          LONG                           !                     
WindowsInlog                CSTRING(51)                    !                     
Administrator               BYTE                           !                     
BekijkenPrijzen             BYTE                           !                     
MakenVerkoopMutatie         BYTE                           !                     
Verwerken                   BYTE                           !                     
VolledigeNaam               CSTRING(51)                    !                     
Handtekening                CSTRING(101)                   !                     
res_id                      LONG                           !                     
Email                       CSTRING(101)                   !                     
Telefoon                    CSTRING(21)                    !                     
GeenToegang                 BYTE                           !                     
NietActief                  BYTE                           !                     
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

Activiteit           FILE,DRIVER('MSSQL'),PRE(ACT),BINDABLE,THREAD,EXTERNAL(''),DLL(dll_mode) !                     
PK_Activiteit            KEY(ACT:ActiviteitID),PRIMARY     !                     
FK1_Activiteit           KEY(ACT:PlanningID,ACT:DatumTijd,ACT:ActiviteitID),DUP,NOCASE !                     
FK2_Activiteit           KEY(ACT:DatumTijd,ACT:ActiviteitID),DUP,NOCASE !                     
FK3_Activiteit           KEY(ACT:Uitgevoerd,-ACT:DatumTijd,-ACT:ActiviteitID),DUP,NOCASE !                     
FK4_Activiteit           KEY(-ACT:DatumTijd,-ACT:ActiviteitID),DUP,NOCASE !                     
Record                   RECORD,PRE()
ActiviteitID                LONG,NAME('ActiviteitID | READONLY') !                     
PlanningID                  LONG                           !                     
DatumTijd                   STRING(8)                      !                     
DatumTijd_GROUP             GROUP,OVER(DatumTijd)          !                     
Datum                         DATE                         !                     
Tijd                          TIME                         !                     
                            END                            !                     
Omschrijving                STRING(1001)                   !                     
Uitgevoerd                  BYTE                           !                     
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

Pallet               FILE,DRIVER('MSSQL'),PRE(PLL),BINDABLE,THREAD,EXTERNAL(''),DLL(dll_mode) !                     
PK_Pallet                KEY(PLL:PalletID),PRIMARY         !                     
Record                   RECORD,PRE()
PalletID                    LONG                           !                     
Dummy                       STRING(1)                      !                     
                         END
                     END                       

KostenStamgeg        FILE,DRIVER('MSSQL'),PRE(Kos),BINDABLE,THREAD,EXTERNAL(''),DLL(dll_mode) !                     
PK_KostenStamgeg         KEY(Kos:KostenID),PRIMARY         !                     
Record                   RECORD,PRE()
KostenID                    LONG                           !                     
Omschrijving                CSTRING(61)                    !                     
Soort                       STRING(1)                      !                     
Prijs                       DECIMAL(11,3)                  !                     
                         END
                     END                       

ExtraKosten          FILE,DRIVER('MSSQL'),PRE(Ext),BINDABLE,THREAD,EXTERNAL(''),DLL(dll_mode) !                     
PK_ExtraKosten           KEY(Ext:ExtraKostenID),PRIMARY    ! Op ExtraKostenID    
FK1_ExtraKosten          KEY(Ext:VerkoopID,Ext:KostenID),DUP ! Op VerkoopID        
FK2_ExtraKosten          KEY(Ext:InkoopID,Ext:KostenID),DUP ! Op InkoopID         
FK3_ExtraKosten          KEY(Ext:PlanningID,Ext:KostenID),DUP ! Op PlanningID       
Record                   RECORD,PRE()
ExtraKostenID               LONG                           !                     
KostenID                    LONG                           !                     
VerkoopID                   LONG                           !                     
InkoopID                    LONG                           !                     
PlanningID                  LONG                           !                     
Aantal                      DECIMAL(10,2)                  !                     
Prijs                       DECIMAL(11,3)                  !                     
ExtraKosten                 DECIMAL(11,3)                  !                     
                         END
                     END                       

ViewBetcd            FILE,DRIVER('MSSQL'),PRE(BTC),BINDABLE,THREAD,EXTERNAL(''),DLL(dll_mode) ! Betalingscondities  
ViewBetcd_PK             KEY(BTC:betcdID),NOCASE,PRIMARY   ! Op betcdID          
Record                   RECORD,PRE()
betcdID                     STRING(20)                     !                     
Omschrijving                CSTRING(31)                    !                     
Description                 CSTRING(31)                    !                     
                         END
                     END                       

DeliveryTerms        FILE,DRIVER('MSSQL'),PRE(DLT),BINDABLE,THREAD,EXTERNAL(''),DLL(dll_mode) !                     
PK_DeliveryTerms         KEY(DLT:DeliveryTermsID),PRIMARY  !                     
Record                   RECORD,PRE()
DeliveryTermsID             LONG                           !                     
Omschrijving                CSTRING(61)                    !                     
                         END
                     END                       

ISOCountries         FILE,DRIVER('MSSQL'),PRE(ISO),BINDABLE,THREAD,EXTERNAL(''),DLL(dll_mode) !                     
PK_ISOCountries          KEY(ISO:ISCode),PRIMARY           !                     
Record                   RECORD,PRE()
ISCode                      CSTRING(3)                     !                     
ISNummer                    LONG                           !                     
Country                     CSTRING(61)                    !                     
                         END
                     END                       

SSOPCategorie        FILE,DRIVER('MSSQL'),PRE(SCat),BINDABLE,THREAD,EXTERNAL(''),DLL(dll_mode) !                     
SSOPCategorie_PK         KEY(SCat:CategorieID),PRIMARY     !                     
Record                   RECORD,PRE()
CategorieID                 LONG                           !                     
Omschrijving                CSTRING(101)                   !                     
                         END
                     END                       

SSOPObject           FILE,DRIVER('MSSQL'),PRE(SObj),BINDABLE,THREAD,EXTERNAL(''),DLL(dll_mode) !                     
SSOPObject_PK            KEY(SObj:ObjID),PRIMARY           !                     
SSOPObject_FK1           KEY(SObj:CatergorieID,SObj:ObjID),DUP !                     
Record                   RECORD,PRE()
ObjID                       LONG                           !                     
CatergorieID                LONG                           !                     
Omschrijving                CSTRING(101)                   !                     
Maandag                     BYTE                           !                     
Dinsdag                     BYTE                           !                     
Woensdag                    BYTE                           !                     
Donderdag                   BYTE                           !                     
Vrijdag                     BYTE                           !                     
                         END
                     END                       

SSOPRegistratie      FILE,DRIVER('MSSQL'),PRE(SReg),BINDABLE,THREAD,EXTERNAL(''),DLL(dll_mode) !                     
SSOPRegistratie_PK       KEY(SReg:RegistratieID),PRIMARY   !                     
SSOPRegistratie_FK1      KEY(SReg:Datum,SReg:ObjID),DUP    !                     
SSOPRegistratie_FK2      KEY(SReg:TijdID,SReg:ObjID),NOCASE !                     
Record                   RECORD,PRE()
RegistratieID               LONG                           !                     
ObjID                       LONG                           !                     
Datum                       STRING(8)                      !                     
Datum_GROUP                 GROUP,OVER(Datum)              !                     
Datum_DATE                    DATE                         !                     
Datum_TIME                    TIME                         !                     
                            END                            !                     
Resultaat                   STRING(1)                      !                     
Opmerking                   CSTRING(2001)                  !                     
CorrigerendeActie           CSTRING(2001)                  !                     
TijdID                      LONG                           !                     
                         END
                     END                       

SSOPTijd             FILE,DRIVER('MSSQL'),PRE(STijd),BINDABLE,THREAD,EXTERNAL(''),DLL(dll_mode) !                     
SSOPTijd_PK              KEY(STijd:TijdID),PRIMARY         !                     
SSOPTijd_FK1             KEY(STijd:DatumTijd),DUP          !                     
Record                   RECORD,PRE()
TijdID                      LONG                           !                     
DatumTijd                   STRING(8)                      !                     
DatumTijd_GROUP             GROUP,OVER(DatumTijd)          !                     
DatumTijd_DATE                DATE                         !                     
DatumTijd_TIME                TIME                         !                     
                            END                            !                     
Door                        CSTRING(101)                   !                     
                         END
                     END                       

GNCode               FILE,DRIVER('MSSQL'),PRE(GNC),BINDABLE,THREAD,EXTERNAL(''),DLL(dll_mode) !                     
GNCode_PK                KEY(GNC:GNCode),PRIMARY           !                     
Record                   RECORD,PRE()
GNCode                      CSTRING(21)                    !                     
GNCode_Can                  CSTRING(21),NAME('"GNCode_Can"') !                     
Benaming_NL                 CSTRING(101),NAME('"Benaming_NL"') !                     
Benaming_EN                 CSTRING(101),NAME('"Benaming_EN"') !                     
Benaming_DU                 CSTRING(101),NAME('"Benaming_DU"') !                     
Benaming_FR                 CSTRING(101),NAME('"Benaming_FR"') !                     
                         END
                     END                       

GNCodeArtikelen      FILE,DRIVER('MSSQL'),PRE(GNA),BINDABLE,THREAD,EXTERNAL(''),DLL(dll_mode) !                     
GNCodeArtikelen_PK       KEY(GNA:GNCode,GNA:ArtikelID),PRIMARY !                     
GNCodeArtikelen_FK1      KEY(GNA:ArtikelID)                !                     
Record                   RECORD,PRE()
GNCode                      CSTRING(21)                    !                     
ArtikelID                   CSTRING(31)                    !                     
                         END
                     END                       

Havens               FILE,DRIVER('MSSQL'),PRE(Hav),BINDABLE,THREAD,EXTERNAL(''),DLL(dll_mode) !                     
Haven_PK                 KEY(Hav:Haven),PRIMARY            !                     
Record                   RECORD,PRE()
Haven                       CSTRING(51)                    !                     
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
NietActief                  BYTE                           !                     
                         END
                     END                       

APlanning            FILE,DRIVER('MSSQL'),PRE(APla),BINDABLE,THREAD,EXTERNAL(''),DLL(dll_mode) !                     
Datum_Tijd_K             KEY(APla:Planning,APla:PlanningID),DUP !                     
OverboekingCelID_Planning_K KEY(APla:OverboekingCelID,APla:Planning,APla:PlanningID),DUP !                     
PK_Planning              KEY(APla:PlanningID),PRIMARY      !                     
Planning_FK01            KEY(APla:InkoopID,APla:PlanningID),DUP,NOCASE ! Op InkoopID/Planning
Planning_FK02            KEY(APla:VerkoopID,APla:PlanningID),DUP ! Op VerkoopID. PlanningID
Planning_FK03            KEY(APla:Planning),DUP            ! Op Planning         
Planning_FK04            KEY(APla:OverboekingPlanningID),DUP,NOCASE !                     
Planning_FK05            KEY(APla:InkoopID),DUP,NOCASE     !                     
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

AInkoop              FILE,DRIVER('MSSQL'),PRE(AInk),BINDABLE,THREAD,EXTERNAL(''),DLL(dll_mode) !                     
PK_Inkoop                KEY(AInk:InkoopID),PRIMARY        !                     
Inkoop_FK01              KEY(AInk:Planning),DUP,NOCASE     ! Op Planning         
Verwerkt_InkoopID_K      KEY(AInk:Verwerkt,AInk:InkoopID),DUP,NOCASE !                     
Verwerkt_InkoopIDD_K     KEY(AInk:Verwerkt,-AInk:InkoopID),DUP,NOCASE !                     
Verwerkt_Planning_K      KEY(AInk:Verwerkt,AInk:Planning,AInk:InkoopID),DUP,NOCASE !                     
Verwerkt_PlanningD_K     KEY(AInk:Verwerkt,-AInk:Planning,-AInk:InkoopID),DUP,NOCASE !                     
Leverancier_Verwerkt_Planning_K KEY(AInk:Leverancier,AInk:Verwerkt,AInk:Planning,AInk:InkoopID),DUP,NOCASE !                     
Leverancier_Verwerkt_PlanningD_K KEY(AInk:Leverancier,AInk:Verwerkt,-AInk:Planning,-AInk:InkoopID),DUP,NOCASE !                     
LeverancierAlternatiefAdres_K KEY(AInk:LeverancierAlternatiefAdres),DUP,NOCASE !                     
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
Valuta                      CSTRING(51)                    !                     
Koersverschil               DECIMAL(11,3)                  !                     
                         END
                     END                       

AVerkoop             FILE,DRIVER('MSSQL'),PRE(AVE),BINDABLE,THREAD,EXTERNAL(''),DLL(dll_mode) !                     
Verkoop_FK2              KEY(AVE:Exported,AVE:VerkoopID),DUP ! Op Exported/VerkoopID
Verkoop_FK3              KEY(AVE:Exported,AVE:Klant,-AVE:Planning),DUP ! Op Exported, Klant, Verkoop
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
NietActief                  BYTE                           !                     
                         END
                     END                       

ACel                 FILE,DRIVER('MSSQL'),PRE(ACel),BINDABLE,THREAD,EXTERNAL(''),DLL(dll_mode) !                     
CEL_PK                   KEY(ACel:CelID),NOCASE,PRIMARY    !                     
Cel_FK1                  KEY(ACel:Volgnr,ACel:CelID),NOCASE ! Op Volgnr, CelID    
Record                   RECORD,PRE()
CelID                       LONG                           !                     
CelOms                      CSTRING(51)                    !                     
Breedte                     LONG                           !                     
Lengte                      LONG                           !                     
Volgnr                      LONG                           !                     
                         END
                     END                       

AACel                FILE,DRIVER('MSSQL'),PRE(AACel),BINDABLE,THREAD,EXTERNAL(''),DLL(dll_mode) !                     
CEL_PK                   KEY(AACel:CelID),NOCASE,PRIMARY   !                     
Cel_FK1                  KEY(AACel:Volgnr,AACel:CelID),NOCASE ! Op Volgnr, CelID    
Record                   RECORD,PRE()
CelID                       LONG                           !                     
CelOms                      CSTRING(51)                    !                     
Breedte                     LONG                           !                     
Lengte                      LONG                           !                     
Volgnr                      LONG                           !                     
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
NietActief                  BYTE                           !                     
                         END
                     END                       

AAACel               FILE,DRIVER('MSSQL'),PRE(AAACel),BINDABLE,THREAD,EXTERNAL(''),DLL(dll_mode) !                     
CEL_PK                   KEY(AAACel:CelID),NOCASE,PRIMARY  !                     
Cel_FK1                  KEY(AAACel:Volgnr,AAACel:CelID),NOCASE ! Op Volgnr, CelID    
Record                   RECORD,PRE()
CelID                       LONG                           !                     
CelOms                      CSTRING(51)                    !                     
Breedte                     LONG                           !                     
Lengte                      LONG                           !                     
Volgnr                      LONG                           !                     
                         END
                     END                       

AViewVoorraadPartij  FILE,DRIVER('MSSQL'),PRE(AVVPar),BINDABLE,THREAD,EXTERNAL(''),DLL(dll_mode) !                     
ExternPartijnr_PartijID_CelID_K KEY(AVVPar:ExternPartijnr,AVVPar:PartijID,AVVPar:CelID),DUP,NOCASE !                     
PartijID_CelID_K         KEY(AVVPar:PartijID,AVVPar:CelID),DUP,NOCASE !                     
PartijCelID_K            KEY(AVVPar:PartijCelID),DUP,NOCASE !                     
ArtikelID_PartijID_CelID_K KEY(AVVPar:ArtikelID,-AVVPar:PartijID,AVVPar:CelID),DUP,NOCASE !                     
ArtikelOms_PartijID_CelID_K KEY(AVVPar:ArtikelOms,AVVPar:PartijID,AVVPar:CelID),DUP,NOCASE !                     
ArtikelID_CelID_PartijID_K KEY(AVVPar:ArtikelID,AVVPar:CelID,AVVPar:PartijID),DUP,NOCASE !                     
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
Blokkade                    STRING(8)                      !                     
Blokkade_GROUP              GROUP,OVER(Blokkade)           !                     
Blokkade_DATE                 DATE                         !                     
Blokkade_TIME                 TIME                         !                     
                            END                            !                     
deBlokkade                  STRING(8)                      !                     
deBlokkade_GROUP            GROUP,OVER(deBlokkade)         !                     
deBlokkade_DATE               DATE                         !                     
deBlokkade_TIME               TIME                         !                     
                            END                            !                     
                         END
                     END                       

AMutatie             FILE,DRIVER('MSSQL'),PRE(AMut),BINDABLE,THREAD,EXTERNAL(''),DLL(dll_mode) !                     
Mutatie_PK               KEY(AMut:MutatieID),NOCASE,PRIMARY !                     
Mutatie_FK01             KEY(AMut:PartijID,AMut:DatumTijd),DUP,NOCASE !                     
Mutatie_FK02             KEY(AMut:PlanningID,AMut:MutatieID),DUP,NOCASE !                     
Mutatie_FK03             KEY(AMut:ArtikelID,AMut:DatumTijd),DUP,NOCASE ! Op ArtikelID/DatumTijd
Mutatie_FK04             KEY(AMut:BulkOverboekingID,AMut:MutatieID),DUP,NOCASE !                     
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

AAViewVoorraadPartij FILE,DRIVER('MSSQL'),PRE(AAVVPar),BINDABLE,THREAD,EXTERNAL(''),DLL(dll_mode) !                     
ExternPartijnr_PartijID_CelID_K KEY(AAVVPar:ExternPartijnr,AAVVPar:PartijID,AAVVPar:CelID),DUP,NOCASE !                     
PartijID_CelID_K         KEY(AAVVPar:PartijID,AAVVPar:CelID),DUP,NOCASE !                     
PartijCelID_K            KEY(AAVVPar:PartijCelID),DUP,NOCASE !                     
ArtikelID_PartijID_CelID_K KEY(AAVVPar:ArtikelID,-AAVVPar:PartijID,AAVVPar:CelID),DUP,NOCASE !                     
ArtikelOms_PartijID_CelID_K KEY(AAVVPar:ArtikelOms,AAVVPar:PartijID,AAVVPar:CelID),DUP,NOCASE !                     
ArtikelID_CelID_PartijID_K KEY(AAVVPar:ArtikelID,AAVVPar:CelID,AAVVPar:PartijID),DUP,NOCASE !                     
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
Blokkade                    STRING(8)                      !                     
Blokkade_GROUP              GROUP,OVER(Blokkade)           !                     
Blokkade_DATE                 DATE                         !                     
Blokkade_TIME                 TIME                         !                     
                            END                            !                     
deBlokkade                  STRING(8)                      !                     
deBlokkade_GROUP            GROUP,OVER(deBlokkade)         !                     
deBlokkade_DATE               DATE                         !                     
deBlokkade_TIME               TIME                         !                     
                            END                            !                     
                         END
                     END                       

AAAViewVoorraadPartij FILE,DRIVER('MSSQL'),PRE(AAAVVPar),BINDABLE,THREAD,EXTERNAL(''),DLL(dll_mode) !                     
ExternPartijnr_PartijID_CelID_K KEY(AAAVVPar:ExternPartijnr,AAAVVPar:PartijID,AAAVVPar:CelID),DUP,NOCASE !                     
PartijID_CelID_K         KEY(AAAVVPar:PartijID,AAAVVPar:CelID),DUP,NOCASE !                     
PartijCelID_K            KEY(AAAVVPar:PartijCelID),DUP,NOCASE !                     
ArtikelID_PartijID_CelID_K KEY(AAAVVPar:ArtikelID,-AAAVVPar:PartijID,AAAVVPar:CelID),DUP,NOCASE !                     
ArtikelOms_PartijID_CelID_K KEY(AAAVVPar:ArtikelOms,AAAVVPar:PartijID,AAAVVPar:CelID),DUP,NOCASE !                     
ArtikelID_CelID_PartijID_K KEY(AAAVVPar:ArtikelID,AAAVVPar:CelID,AAAVVPar:PartijID),DUP,NOCASE !                     
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
Blokkade                    STRING(8)                      !                     
Blokkade_GROUP              GROUP,OVER(Blokkade)           !                     
Blokkade_DATE                 DATE                         !                     
Blokkade_TIME                 TIME                         !                     
                            END                            !                     
deBlokkade                  STRING(8)                      !                     
deBlokkade_GROUP            GROUP,OVER(deBlokkade)         !                     
deBlokkade_DATE               DATE                         !                     
deBlokkade_TIME               TIME                         !                     
                            END                            !                     
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
Blokkade                    STRING(8)                      !                     
Blokkade_GROUP              GROUP,OVER(Blokkade)           !                     
Blokkade_DATE                 DATE                         !                     
Blokkade_TIME                 TIME                         !                     
                            END                            !                     
deBlokkade                  STRING(8)                      !                     
deBlokkade_GROUP            GROUP,OVER(deBlokkade)         !                     
deBlokkade_DATE               DATE                         !                     
deBlokkade_TIME               TIME                         !                     
                            END                            !                     
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

AAAAViewVoorraadPartij FILE,DRIVER('MSSQL'),PRE(AAAAVVPar),BINDABLE,THREAD,EXTERNAL(''),DLL(dll_mode) !                     
ExternPartijnr_PartijID_CelID_K KEY(AAAAVVPar:ExternPartijnr,AAAAVVPar:PartijID,AAAAVVPar:CelID),DUP,NOCASE !                     
PartijID_CelID_K         KEY(AAAAVVPar:PartijID,AAAAVVPar:CelID),DUP,NOCASE !                     
PartijCelID_K            KEY(AAAAVVPar:PartijCelID),DUP,NOCASE !                     
ArtikelID_PartijID_CelID_K KEY(AAAAVVPar:ArtikelID,-AAAAVVPar:PartijID,AAAAVVPar:CelID),DUP,NOCASE !                     
ArtikelOms_PartijID_CelID_K KEY(AAAAVVPar:ArtikelOms,AAAAVVPar:PartijID,AAAAVVPar:CelID),DUP,NOCASE !                     
ArtikelID_CelID_PartijID_K KEY(AAAAVVPar:ArtikelID,AAAAVVPar:CelID,AAAAVVPar:PartijID),DUP,NOCASE !                     
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
Blokkade                    STRING(8)                      !                     
Blokkade_GROUP              GROUP,OVER(Blokkade)           !                     
Blokkade_DATE                 DATE                         !                     
Blokkade_TIME                 TIME                         !                     
                            END                            !                     
deBlokkade                  STRING(8)                      !                     
deBlokkade_GROUP            GROUP,OVER(deBlokkade)         !                     
deBlokkade_DATE               DATE                         !                     
deBlokkade_TIME               TIME                         !                     
                            END                            !                     
                         END
                     END                       

AOverboekingRitRegel FILE,DRIVER('MSSQL'),PRE(AORR),BINDABLE,THREAD,EXTERNAL(''),DLL(dll_mode) !                     
PK_OverboekingRitRegel   KEY(AORR:OverboekingRitRegelID),PRIMARY !                     
FK_OverboekingRitRegel   KEY(AORR:OverboekingRitID,AORR:OverboekingRitRegelID),DUP !                     
FK2_OverboekingRitRegel  KEY(AORR:PlanningID,AORR:OverboekingRitRegelID),DUP,NOCASE !                     
Record                   RECORD,PRE()
OverboekingRitRegelID       LONG                           !                     
OverboekingRitID            LONG                           !                     
PlanningID                  LONG                           !                     
                         END
                     END                       

AAPlanning           FILE,DRIVER('MSSQL'),PRE(AAPla),BINDABLE,THREAD,EXTERNAL(''),DLL(dll_mode) !                     
Datum_Tijd_K             KEY(AAPla:Planning,AAPla:PlanningID),DUP !                     
OverboekingCelID_Planning_K KEY(AAPla:OverboekingCelID,AAPla:Planning,AAPla:PlanningID),DUP !                     
PK_Planning              KEY(AAPla:PlanningID),PRIMARY     !                     
Planning_FK01            KEY(AAPla:InkoopID,AAPla:PlanningID),DUP,NOCASE ! Op InkoopID/Planning
Planning_FK02            KEY(AAPla:VerkoopID,AAPla:PlanningID),DUP ! Op VerkoopID. PlanningID
Planning_FK03            KEY(AAPla:Planning),DUP           ! Op Planning         
Planning_FK04            KEY(AAPla:OverboekingPlanningID),DUP,NOCASE !                     
Planning_FK05            KEY(AAPla:InkoopID),DUP,NOCASE    !                     
Verwerkt_Artikel_Planning_K KEY(AAPla:Verwerkt,AAPla:ArtikelID,AAPla:PlanningID),DUP !                     
Verwerkt_OverboekingCelID_Planning_K KEY(AAPla:Verwerkt,AAPla:OverboekingCelID,AAPla:Planning,AAPla:PlanningID),DUP !                     
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
Blokkade                    STRING(8)                      !                     
Blokkade_GROUP              GROUP,OVER(Blokkade)           !                     
Blokkade_DATE                 DATE                         !                     
Blokkade_TIME                 TIME                         !                     
                            END                            !                     
deBlokkade                  STRING(8)                      !                     
deBlokkade_GROUP            GROUP,OVER(deBlokkade)         !                     
deBlokkade_DATE               DATE                         !                     
deBlokkade_TIME               TIME                         !                     
                            END                            !                     
                         END
                     END                       

AAAACel              FILE,DRIVER('MSSQL'),PRE(AAAACEL),BINDABLE,THREAD,EXTERNAL(''),DLL(dll_mode) !                     
CEL_PK                   KEY(AAAACEL:CelID),NOCASE,PRIMARY !                     
Cel_FK1                  KEY(AAAACEL:Volgnr,AAAACEL:CelID),NOCASE ! Op Volgnr, CelID    
Record                   RECORD,PRE()
CelID                       LONG                           !                     
CelOms                      CSTRING(51)                    !                     
Breedte                     LONG                           !                     
Lengte                      LONG                           !                     
Volgnr                      LONG                           !                     
                         END
                     END                       

AOverboekingRit      FILE,DRIVER('MSSQL'),PRE(AOR),BINDABLE,THREAD,EXTERNAL(''),DLL(dll_mode) !                     
PK_OverboekingRit        KEY(AOR:OverboekingRitID),PRIMARY !                     
FK_OverboekingRit        KEY(AOR:DatumTijd,AOR:OverboekingRitID),DUP !                     
Record                   RECORD,PRE()
OverboekingRitID            LONG                           !                     
DatumTijd                   STRING(8)                      !                     
DatumTijd_GROUP             GROUP,OVER(DatumTijd)          !                     
DatumTijd_DATE                DATE                         !                     
DatumTijd_TIME                TIME                         !                     
                            END                            !                     
Opmerking                   CSTRING(101)                   !                     
                         END
                     END                       

APlanningInkoop      FILE,DRIVER('MSSQL'),PRE(APla2),BINDABLE,THREAD,EXTERNAL(''),DLL(dll_mode) !                     
Planning_K               KEY(APla2:Planning,APla2:PlanningID),DUP,NOCASE !                     
PlanningID_K             KEY(APla2:PlanningID),NOCASE,PRIMARY !                     
Planning_FirmaNaam_K     KEY(APla2:Planning,APla2:FirmaNaam,APla2:PlanningID),DUP,NOCASE !                     
Verwerkt_Planning_FirmaNaam_K KEY(APla2:Verwerkt,APla2:Planning,APla2:FirmaNaam,APla2:PlanningID),DUP,NOCASE !                     
Verwerkt_Planning_K      KEY(APla2:Verwerkt,APla2:Planning,APla2:PlanningID),DUP,NOCASE !                     
Record                   RECORD,PRE()
PlanningID                  LONG                           !                     
Leverancier                 LONG                           !                     
ArtikelID                   CSTRING(31)                    !                     
KG                          DECIMAL(10,2)                  !                     
MutatieKG                   DECIMAL(10,2)                  !                     
MutatiePallets              LONG                           !                     
Pallets                     LONG                           !                     
Instructie                  CSTRING(101)                   !                     
Transport                   CSTRING(101)                   !                     
Planning                    STRING(8)                      !                     
Planning_GROUP              GROUP,OVER(Planning)           !                     
Planning_DATE                 DATE                         !                     
Planning_TIME                 TIME                         !                     
                            END                            !                     
Geprint                     BYTE                           !                     
MutatieGemaakt              BYTE                           !                     
Memo                        CSTRING(101)                   !                     
InkoopID                    LONG                           !                     
FirmaNaam                   STRING(50)                     !                     
CelID                       LONG                           !                     
CelOms                      CSTRING(51)                    !                     
PartijID                    LONG                           !                     
Verwerkt                    BYTE                           !                     
ExternPartijnr              CSTRING(21)                    !                     
ArtikelOms                  CSTRING(61)                    !                     
VerpakkingID                LONG                           !                     
VerpakkingOmschrijving      CSTRING(51)                    !                     
Gewogen                     BYTE                           !                     
CelLocatieID                LONG                           !                     
Locatienaam                 STRING(50)                     !                     
                         END
                     END                       

APlanningOverboeking FILE,DRIVER('MSSQL'),PRE(APla4),BINDABLE,THREAD,EXTERNAL(''),DLL(dll_mode) !                     
PlanningID_K             KEY(APla4:PlanningID),NOCASE,PRIMARY !                     
Planning_K               KEY(APla4:Planning,APla4:PlanningID),DUP,NOCASE !                     
Planning_FirmaNaam_k     KEY(APla4:Planning,APla4:FirmaNaam,APla4:PlanningID),DUP,NOCASE !                     
Verwerkt_Planning_K      KEY(APla4:Verwerkt,APla4:Planning,APla4:PlanningID),DUP,NOCASE !                     
Verwerkt_Planning_FirmaNaam_K KEY(APla4:Verwerkt,APla4:Planning,APla4:FirmaNaam,APla4:PlanningID),DUP,NOCASE !                     
Record                   RECORD,PRE()
PlanningID                  LONG                           !                     
ArtikelID                   CSTRING(31)                    !                     
KG                          DECIMAL(10,2)                  !                     
MutatieKG                   DECIMAL(10,2)                  !                     
MutatiePallets              LONG                           !                     
Pallets                     LONG                           !                     
Transport                   CSTRING(101)                   !                     
Planning                    STRING(8)                      !                     
Planning_GROUP              GROUP,OVER(Planning)           !                     
Planning_DATE                 DATE                         !                     
Planning_TIME                 TIME                         !                     
                            END                            !                     
Geprint                     BYTE                           !                     
MutatieGemaakt              BYTE                           !                     
Verwerkt                    BYTE                           !                     
Memo                        CSTRING(101)                   !                     
Instructie                  CSTRING(101)                   !                     
FirmaNaam                   STRING(50)                     !                     
Celid                       LONG                           !                     
CelOms                      CSTRING(51)                    !                     
PartijID                    LONG                           !                     
ExternPartijnr              CSTRING(21)                    !                     
ArtikelOms                  CSTRING(61)                    !                     
VerpakkingID                LONG                           !                     
VerpakkingOmschrijving      CSTRING(51)                    !                     
NaarCelID                   LONG                           !                     
NaarCelOms                  CSTRING(51)                    !                     
CelLocatieID                LONG                           !                     
Locatienaam                 STRING(50)                     !                     
NaarLocatienaam             STRING(50)                     !                     
OverboekSoort               CSTRING(51)                    !                     
                         END
                     END                       

APlanningVerkoop     FILE,DRIVER('MSSQL'),PRE(APla3),BINDABLE,THREAD,EXTERNAL(''),DLL(dll_mode) !                     
PlanningID_K             KEY(APla3:PlanningID),NOCASE,PRIMARY !                     
Verwerkt_Planning_FirmaNaam_K KEY(APla3:Verwerkt,APla3:Planning,APla3:FirmaNaam,APla3:PlanningID),DUP,NOCASE !                     
Planning_FirmaNaam_K     KEY(APla3:Planning,APla3:FirmaNaam,APla3:PlanningID),DUP,NOCASE !                     
Planning_K               KEY(APla3:Planning,APla3:PlanningID),DUP,NOCASE !                     
Verwerkt_Planning_K      KEY(APla3:Verwerkt,APla3:Planning,APla3:PlanningID),DUP,NOCASE !                     
Record                   RECORD,PRE()
PlanningID                  LONG                           !                     
ArtikelID                   CSTRING(31)                    !                     
KG                          DECIMAL(10,2)                  !                     
MutatieKG                   DECIMAL(10,2)                  !                     
MutatiePallets              LONG                           !                     
Pallets                     LONG                           !                     
Geprint                     BYTE                           !                     
MutatieGemaakt              BYTE                           !                     
Verwerkt                    BYTE                           !                     
Transport                   CSTRING(101)                   !                     
Instructie                  CSTRING(101)                   !                     
Klant                       LONG                           !                     
VerkoopID                   LONG                           !                     
Planning                    STRING(8)                      !                     
Planning_GROUP              GROUP,OVER(Planning)           !                     
Planning_DATE                 DATE                         !                     
Planning_TIME                 TIME                         !                     
                            END                            !                     
FirmaNaam                   CSTRING(51)                    !                     
CelID                       LONG                           !                     
CelOms                      CSTRING(51)                    !                     
PartijID                    LONG                           !                     
ExternPartijnr              CSTRING(21)                    !                     
ArtikelOms                  CSTRING(61)                    !                     
VerpakkingID                LONG                           !                     
VerpakkingOmschrijving      CSTRING(51)                    !                     
LeverancierID               LONG                           !                     
LeverancierFirmaNaam        CSTRING(51)                    !                     
Gewogen                     BYTE                           !                     
HerkomstOverboekingCelID    LONG                           !                     
HerkomstOverboekingCelOms   CSTRING(51)                    !                     
                         END
                     END                       

APalletSoort         FILE,DRIVER('MSSQL'),PRE(APalSrt),BINDABLE,THREAD,EXTERNAL(''),DLL(dll_mode) !                     
PK_PalletSoort           KEY(APalSrt:PalletSoortID),PRIMARY !                     
FK_PalletSoort           KEY(APalSrt:PalletOmschrijving,APalSrt:PalletSoortID),NOCASE ! Op PalletOmschrijving/PalletSoortID
Record                   RECORD,PRE()
PalletSoortID               LONG                           !                     
PalletOmschrijving          CSTRING(11)                    !                     
Tarra                       DECIMAL(18,2)                  !                     
                         END
                     END                       

ACelLocatie          FILE,DRIVER('MSSQL'),PRE(ACL),BINDABLE,THREAD,EXTERNAL(''),DLL(dll_mode) !                     
PK_CelLocatie            KEY(ACL:CelLocatieID),NOCASE,PRIMARY !                     
FK_CelLocatie            KEY(ACL:CelID,ACL:CelLocatieID),DUP,NOCASE !                     
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

AACelLocatie         FILE,DRIVER('MSSQL'),PRE(AACL),BINDABLE,THREAD,EXTERNAL(''),DLL(dll_mode) !                     
PK_CelLocatie            KEY(AACL:CelLocatieID),NOCASE,PRIMARY !                     
FK_CelLocatie            KEY(AACL:CelID,AACL:CelLocatieID),DUP,NOCASE !                     
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

AAACelLocatie        FILE,DRIVER('MSSQL'),PRE(AAACL),BINDABLE,THREAD,EXTERNAL(''),DLL(dll_mode) !                     
PK_CelLocatie            KEY(AAACL:CelLocatieID),NOCASE,PRIMARY !                     
FK_CelLocatie            KEY(AAACL:CelID,AAACL:CelLocatieID),DUP,NOCASE !                     
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

AAAACelLocatie       FILE,DRIVER('MSSQL'),PRE(AAAACL),BINDABLE,THREAD,EXTERNAL(''),DLL(dll_mode) !                     
PK_CelLocatie            KEY(AAAACL:CelLocatieID),NOCASE,PRIMARY !                     
FK_CelLocatie            KEY(AAAACL:CelID,AAAACL:CelLocatieID),DUP,NOCASE !                     
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

AAPlanningVerkoop    FILE,DRIVER('MSSQL'),PRE(AAPla3),BINDABLE,THREAD,EXTERNAL(''),DLL(dll_mode) !                     
PlanningID_K             KEY(AAPla3:PlanningID),NOCASE,PRIMARY !                     
Verwerkt_Planning_FirmaNaam_K KEY(AAPla3:Verwerkt,AAPla3:Planning,AAPla3:FirmaNaam,AAPla3:PlanningID),DUP,NOCASE !                     
Planning_FirmaNaam_K     KEY(AAPla3:Planning,AAPla3:FirmaNaam,AAPla3:PlanningID),DUP,NOCASE !                     
Planning_K               KEY(AAPla3:Planning,AAPla3:PlanningID),DUP,NOCASE !                     
Verwerkt_Planning_K      KEY(AAPla3:Verwerkt,AAPla3:Planning,AAPla3:PlanningID),DUP,NOCASE !                     
Record                   RECORD,PRE()
PlanningID                  LONG                           !                     
ArtikelID                   CSTRING(31)                    !                     
KG                          DECIMAL(10,2)                  !                     
MutatieKG                   DECIMAL(10,2)                  !                     
MutatiePallets              LONG                           !                     
Pallets                     LONG                           !                     
Geprint                     BYTE                           !                     
MutatieGemaakt              BYTE                           !                     
Verwerkt                    BYTE                           !                     
Transport                   CSTRING(101)                   !                     
Instructie                  CSTRING(101)                   !                     
Klant                       LONG                           !                     
VerkoopID                   LONG                           !                     
Planning                    STRING(8)                      !                     
Planning_GROUP              GROUP,OVER(Planning)           !                     
Planning_DATE                 DATE                         !                     
Planning_TIME                 TIME                         !                     
                            END                            !                     
FirmaNaam                   CSTRING(51)                    !                     
CelID                       LONG                           !                     
CelOms                      CSTRING(51)                    !                     
PartijID                    LONG                           !                     
ExternPartijnr              CSTRING(21)                    !                     
ArtikelOms                  CSTRING(61)                    !                     
VerpakkingID                LONG                           !                     
VerpakkingOmschrijving      CSTRING(51)                    !                     
LeverancierID               LONG                           !                     
LeverancierFirmaNaam        CSTRING(51)                    !                     
Gewogen                     BYTE                           !                     
HerkomstOverboekingCelID    LONG                           !                     
HerkomstOverboekingCelOms   CSTRING(51)                    !                     
                         END
                     END                       

!endregion

PartijCelLocatiesQ  Queue,PRE(PCLQ)
PartijID                LONG
CelID                   LONG
CelLocatieID            LONG
CelLocatienaam          CString(51)   
KG                      LONG
Pallet                  LONG
                    END



PartjCelLocatieCs   CLASS
CheckPCLQ               Procedure(LONG _partijid,LONG _celid,LONG _cellocatieid), BYTE
                    END
include('ClassPackLijstDef.inc')
!include('ClassPackLijstSrc.inc')
db Debuger
WE::MustClose       long,external,dll
WE::CantCloseNow    long,external,dll
UD         CLASS(UltimateDebug),EXTERNAL,DLL(dll_mode)
                     END   
 
include('GlobalClassDef.inc')   
include('VoorraadClassDef.inc')
!include('CachingClassDef.inc')
include('CachingClass_Src.inc')
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
Access:PlanningInkoop &FileManager,THREAD,EXTERNAL,DLL     ! FileManager for PlanningInkoop
Relate:PlanningInkoop &RelationManager,THREAD,EXTERNAL,DLL ! RelationManager for PlanningInkoop
Access:PlanningVerkoop &FileManager,THREAD,EXTERNAL,DLL    ! FileManager for PlanningVerkoop
Relate:PlanningVerkoop &RelationManager,THREAD,EXTERNAL,DLL ! RelationManager for PlanningVerkoop
Access:RelatieAdres  &FileManager,THREAD,EXTERNAL,DLL      ! FileManager for RelatieAdres
Relate:RelatieAdres  &RelationManager,THREAD,EXTERNAL,DLL  ! RelationManager for RelatieAdres
Access:PalletMutatie &FileManager,THREAD,EXTERNAL,DLL      ! FileManager for PalletMutatie
Relate:PalletMutatie &RelationManager,THREAD,EXTERNAL,DLL  ! RelationManager for PalletMutatie
Access:ViewVoorraadPartij &FileManager,THREAD,EXTERNAL,DLL ! FileManager for ViewVoorraadPartij
Relate:ViewVoorraadPartij &RelationManager,THREAD,EXTERNAL,DLL ! RelationManager for ViewVoorraadPartij
Access:CMR           &FileManager,THREAD,EXTERNAL,DLL      ! FileManager for CMR
Relate:CMR           &RelationManager,THREAD,EXTERNAL,DLL  ! RelationManager for CMR
Access:ViewPlanningPartij &FileManager,THREAD,EXTERNAL,DLL ! FileManager for ViewPlanningPartij
Relate:ViewPlanningPartij &RelationManager,THREAD,EXTERNAL,DLL ! RelationManager for ViewPlanningPartij
Access:OverboekingRit &FileManager,THREAD,EXTERNAL,DLL     ! FileManager for OverboekingRit
Relate:OverboekingRit &RelationManager,THREAD,EXTERNAL,DLL ! RelationManager for OverboekingRit
Access:OverboekingRitRegel &FileManager,THREAD,EXTERNAL,DLL ! FileManager for OverboekingRitRegel
Relate:OverboekingRitRegel &RelationManager,THREAD,EXTERNAL,DLL ! RelationManager for OverboekingRitRegel
Access:BulkOverboeking &FileManager,THREAD,EXTERNAL,DLL    ! FileManager for BulkOverboeking
Relate:BulkOverboeking &RelationManager,THREAD,EXTERNAL,DLL ! RelationManager for BulkOverboeking
Access:PlanningOverboeking &FileManager,THREAD,EXTERNAL,DLL ! FileManager for PlanningOverboeking
Relate:PlanningOverboeking &RelationManager,THREAD,EXTERNAL,DLL ! RelationManager for PlanningOverboeking
Access:DubbeleInslagMutaties &FileManager,THREAD,EXTERNAL,DLL ! FileManager for DubbeleInslagMutaties
Relate:DubbeleInslagMutaties &RelationManager,THREAD,EXTERNAL,DLL ! RelationManager for DubbeleInslagMutaties
Access:ArtikelOmschrijvingExtra &FileManager,THREAD,EXTERNAL,DLL ! FileManager for ArtikelOmschrijvingExtra
Relate:ArtikelOmschrijvingExtra &RelationManager,THREAD,EXTERNAL,DLL ! RelationManager for ArtikelOmschrijvingExtra
Access:PalletSoort   &FileManager,THREAD,EXTERNAL,DLL      ! FileManager for PalletSoort
Relate:PalletSoort   &RelationManager,THREAD,EXTERNAL,DLL  ! RelationManager for PalletSoort
Access:Weging        &FileManager,THREAD,EXTERNAL,DLL      ! FileManager for Weging
Relate:Weging        &RelationManager,THREAD,EXTERNAL,DLL  ! RelationManager for Weging
Access:CelLocatie    &FileManager,THREAD,EXTERNAL,DLL      ! FileManager for CelLocatie
Relate:CelLocatie    &RelationManager,THREAD,EXTERNAL,DLL  ! RelationManager for CelLocatie
Access:ViewPartijCelLocaties &FileManager,THREAD,EXTERNAL,DLL ! FileManager for ViewPartijCelLocaties
Relate:ViewPartijCelLocaties &RelationManager,THREAD,EXTERNAL,DLL ! RelationManager for ViewPartijCelLocaties
Access:ViewPlanningPartijTotaal &FileManager,THREAD,EXTERNAL,DLL ! FileManager for ViewPlanningPartijTotaal
Relate:ViewPlanningPartijTotaal &RelationManager,THREAD,EXTERNAL,DLL ! RelationManager for ViewPlanningPartijTotaal
Access:ViewVoorraadPartijTotaal &FileManager,THREAD,EXTERNAL,DLL ! FileManager for ViewVoorraadPartijTotaal
Relate:ViewVoorraadPartijTotaal &RelationManager,THREAD,EXTERNAL,DLL ! RelationManager for ViewVoorraadPartijTotaal
Access:Gebruiker     &FileManager,THREAD,EXTERNAL,DLL      ! FileManager for Gebruiker
Relate:Gebruiker     &RelationManager,THREAD,EXTERNAL,DLL  ! RelationManager for Gebruiker
Access:PartijCelVoorraad &FileManager,THREAD,EXTERNAL,DLL  ! FileManager for PartijCelVoorraad
Relate:PartijCelVoorraad &RelationManager,THREAD,EXTERNAL,DLL ! RelationManager for PartijCelVoorraad
Access:Activiteit    &FileManager,THREAD,EXTERNAL,DLL      ! FileManager for Activiteit
Relate:Activiteit    &RelationManager,THREAD,EXTERNAL,DLL  ! RelationManager for Activiteit
Access:RelatieArtikelOmschrijving &FileManager,THREAD,EXTERNAL,DLL ! FileManager for RelatieArtikelOmschrijving
Relate:RelatieArtikelOmschrijving &RelationManager,THREAD,EXTERNAL,DLL ! RelationManager for RelatieArtikelOmschrijving
Access:Pallet        &FileManager,THREAD,EXTERNAL,DLL      ! FileManager for Pallet
Relate:Pallet        &RelationManager,THREAD,EXTERNAL,DLL  ! RelationManager for Pallet
Access:KostenStamgeg &FileManager,THREAD,EXTERNAL,DLL      ! FileManager for KostenStamgeg
Relate:KostenStamgeg &RelationManager,THREAD,EXTERNAL,DLL  ! RelationManager for KostenStamgeg
Access:ExtraKosten   &FileManager,THREAD,EXTERNAL,DLL      ! FileManager for ExtraKosten
Relate:ExtraKosten   &RelationManager,THREAD,EXTERNAL,DLL  ! RelationManager for ExtraKosten
Access:ViewBetcd     &FileManager,THREAD,EXTERNAL,DLL      ! FileManager for ViewBetcd
Relate:ViewBetcd     &RelationManager,THREAD,EXTERNAL,DLL  ! RelationManager for ViewBetcd
Access:DeliveryTerms &FileManager,THREAD,EXTERNAL,DLL      ! FileManager for DeliveryTerms
Relate:DeliveryTerms &RelationManager,THREAD,EXTERNAL,DLL  ! RelationManager for DeliveryTerms
Access:ISOCountries  &FileManager,THREAD,EXTERNAL,DLL      ! FileManager for ISOCountries
Relate:ISOCountries  &RelationManager,THREAD,EXTERNAL,DLL  ! RelationManager for ISOCountries
Access:SSOPCategorie &FileManager,THREAD,EXTERNAL,DLL      ! FileManager for SSOPCategorie
Relate:SSOPCategorie &RelationManager,THREAD,EXTERNAL,DLL  ! RelationManager for SSOPCategorie
Access:SSOPObject    &FileManager,THREAD,EXTERNAL,DLL      ! FileManager for SSOPObject
Relate:SSOPObject    &RelationManager,THREAD,EXTERNAL,DLL  ! RelationManager for SSOPObject
Access:SSOPRegistratie &FileManager,THREAD,EXTERNAL,DLL    ! FileManager for SSOPRegistratie
Relate:SSOPRegistratie &RelationManager,THREAD,EXTERNAL,DLL ! RelationManager for SSOPRegistratie
Access:SSOPTijd      &FileManager,THREAD,EXTERNAL,DLL      ! FileManager for SSOPTijd
Relate:SSOPTijd      &RelationManager,THREAD,EXTERNAL,DLL  ! RelationManager for SSOPTijd
Access:GNCode        &FileManager,THREAD,EXTERNAL,DLL      ! FileManager for GNCode
Relate:GNCode        &RelationManager,THREAD,EXTERNAL,DLL  ! RelationManager for GNCode
Access:GNCodeArtikelen &FileManager,THREAD,EXTERNAL,DLL    ! FileManager for GNCodeArtikelen
Relate:GNCodeArtikelen &RelationManager,THREAD,EXTERNAL,DLL ! RelationManager for GNCodeArtikelen
Access:Havens        &FileManager,THREAD,EXTERNAL,DLL      ! FileManager for Havens
Relate:Havens        &RelationManager,THREAD,EXTERNAL,DLL  ! RelationManager for Havens
Access:ARelatie      &FileManager,THREAD,EXTERNAL,DLL      ! FileManager for ARelatie
Relate:ARelatie      &RelationManager,THREAD,EXTERNAL,DLL  ! RelationManager for ARelatie
Access:APlanning     &FileManager,THREAD,EXTERNAL,DLL      ! FileManager for APlanning
Relate:APlanning     &RelationManager,THREAD,EXTERNAL,DLL  ! RelationManager for APlanning
Access:AInkoop       &FileManager,THREAD,EXTERNAL,DLL      ! FileManager for AInkoop
Relate:AInkoop       &RelationManager,THREAD,EXTERNAL,DLL  ! RelationManager for AInkoop
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
Access:AVerpakking   &FileManager,THREAD,EXTERNAL,DLL      ! FileManager for AVerpakking
Relate:AVerpakking   &RelationManager,THREAD,EXTERNAL,DLL  ! RelationManager for AVerpakking
Access:AAARelatie    &FileManager,THREAD,EXTERNAL,DLL      ! FileManager for AAARelatie
Relate:AAARelatie    &RelationManager,THREAD,EXTERNAL,DLL  ! RelationManager for AAARelatie
Access:AAACel        &FileManager,THREAD,EXTERNAL,DLL      ! FileManager for AAACel
Relate:AAACel        &RelationManager,THREAD,EXTERNAL,DLL  ! RelationManager for AAACel
Access:AViewVoorraadPartij &FileManager,THREAD,EXTERNAL,DLL ! FileManager for AViewVoorraadPartij
Relate:AViewVoorraadPartij &RelationManager,THREAD,EXTERNAL,DLL ! RelationManager for AViewVoorraadPartij
Access:AMutatie      &FileManager,THREAD,EXTERNAL,DLL      ! FileManager for AMutatie
Relate:AMutatie      &RelationManager,THREAD,EXTERNAL,DLL  ! RelationManager for AMutatie
Access:AAViewVoorraadPartij &FileManager,THREAD,EXTERNAL,DLL ! FileManager for AAViewVoorraadPartij
Relate:AAViewVoorraadPartij &RelationManager,THREAD,EXTERNAL,DLL ! RelationManager for AAViewVoorraadPartij
Access:AAAViewVoorraadPartij &FileManager,THREAD,EXTERNAL,DLL ! FileManager for AAAViewVoorraadPartij
Relate:AAAViewVoorraadPartij &RelationManager,THREAD,EXTERNAL,DLL ! RelationManager for AAAViewVoorraadPartij
Access:APartij       &FileManager,THREAD,EXTERNAL,DLL      ! FileManager for APartij
Relate:APartij       &RelationManager,THREAD,EXTERNAL,DLL  ! RelationManager for APartij
Access:AAViewArtikel &FileManager,THREAD,EXTERNAL,DLL      ! FileManager for AAViewArtikel
Relate:AAViewArtikel &RelationManager,THREAD,EXTERNAL,DLL  ! RelationManager for AAViewArtikel
Access:AAAAViewVoorraadPartij &FileManager,THREAD,EXTERNAL,DLL ! FileManager for AAAAViewVoorraadPartij
Relate:AAAAViewVoorraadPartij &RelationManager,THREAD,EXTERNAL,DLL ! RelationManager for AAAAViewVoorraadPartij
Access:AOverboekingRitRegel &FileManager,THREAD,EXTERNAL,DLL ! FileManager for AOverboekingRitRegel
Relate:AOverboekingRitRegel &RelationManager,THREAD,EXTERNAL,DLL ! RelationManager for AOverboekingRitRegel
Access:AAPlanning    &FileManager,THREAD,EXTERNAL,DLL      ! FileManager for AAPlanning
Relate:AAPlanning    &RelationManager,THREAD,EXTERNAL,DLL  ! RelationManager for AAPlanning
Access:AAPartij      &FileManager,THREAD,EXTERNAL,DLL      ! FileManager for AAPartij
Relate:AAPartij      &RelationManager,THREAD,EXTERNAL,DLL  ! RelationManager for AAPartij
Access:AAAACel       &FileManager,THREAD,EXTERNAL,DLL      ! FileManager for AAAACel
Relate:AAAACel       &RelationManager,THREAD,EXTERNAL,DLL  ! RelationManager for AAAACel
Access:AOverboekingRit &FileManager,THREAD,EXTERNAL,DLL    ! FileManager for AOverboekingRit
Relate:AOverboekingRit &RelationManager,THREAD,EXTERNAL,DLL ! RelationManager for AOverboekingRit
Access:APlanningInkoop &FileManager,THREAD,EXTERNAL,DLL    ! FileManager for APlanningInkoop
Relate:APlanningInkoop &RelationManager,THREAD,EXTERNAL,DLL ! RelationManager for APlanningInkoop
Access:APlanningOverboeking &FileManager,THREAD,EXTERNAL,DLL ! FileManager for APlanningOverboeking
Relate:APlanningOverboeking &RelationManager,THREAD,EXTERNAL,DLL ! RelationManager for APlanningOverboeking
Access:APlanningVerkoop &FileManager,THREAD,EXTERNAL,DLL   ! FileManager for APlanningVerkoop
Relate:APlanningVerkoop &RelationManager,THREAD,EXTERNAL,DLL ! RelationManager for APlanningVerkoop
Access:APalletSoort  &FileManager,THREAD,EXTERNAL,DLL      ! FileManager for APalletSoort
Relate:APalletSoort  &RelationManager,THREAD,EXTERNAL,DLL  ! RelationManager for APalletSoort
Access:ACelLocatie   &FileManager,THREAD,EXTERNAL,DLL      ! FileManager for ACelLocatie
Relate:ACelLocatie   &RelationManager,THREAD,EXTERNAL,DLL  ! RelationManager for ACelLocatie
Access:AACelLocatie  &FileManager,THREAD,EXTERNAL,DLL      ! FileManager for AACelLocatie
Relate:AACelLocatie  &RelationManager,THREAD,EXTERNAL,DLL  ! RelationManager for AACelLocatie
Access:AAACelLocatie &FileManager,THREAD,EXTERNAL,DLL      ! FileManager for AAACelLocatie
Relate:AAACelLocatie &RelationManager,THREAD,EXTERNAL,DLL  ! RelationManager for AAACelLocatie
Access:AAAACelLocatie &FileManager,THREAD,EXTERNAL,DLL     ! FileManager for AAAACelLocatie
Relate:AAAACelLocatie &RelationManager,THREAD,EXTERNAL,DLL ! RelationManager for AAAACelLocatie
Access:AAPlanningVerkoop &FileManager,THREAD,EXTERNAL,DLL  ! FileManager for AAPlanningVerkoop
Relate:AAPlanningVerkoop &RelationManager,THREAD,EXTERNAL,DLL ! RelationManager for AAPlanningVerkoop

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
     db.init('VoorrPln',0,50)  ! intiialize the debuger class 
  
        ! waar staat deze code
NetRefreshPlanningViews PROCEDURE
	CODE
		ThisNetRefresh.Send('|Planning|APlanning|AAPlanning|ViewPlanningPartij|ViewVoorraadPlanning|PlanningInkoop|PlanningVerkoop|PlanningOverboeking|APlanningInkoop|APlanningVerkoop|APlanningOverboeking|Inkoop|AInkoop|Verkoop|AVerkoop|OverboekingRit|OverboekingRitRegel|') ! NetTalk (NetRefresh)
	!END
NetRefreshVoorraadViews PROCEDURE
	CODE
		ThisNetRefresh.Send('|Partij|APartij|Mutatie|AMutatie|ViewVoorraadCelTotaal|AViewVoorraadCelTotaal|ViewVoorraadPartij|AViewVoorraadPartij|AAViewVoorraadPartij|AAAViewVoorraadPartij|AAAAViewVoorraadPartij|ViewVoorraadPlanning|VoorraadVerloop|') ! NetTalk (NetRefresh)
	!END
include('GlobalClassSrc.inc')
include('VoorraadClassSrc.inc')
!include('CachingClass_Src.clw')

PartjCelLocatieCs.CheckPCLQ Procedure(LONG _partijid,LONG _celid,LONG _cellocatieid)

_found                          BYTE
CODE
    _found = false
!    Clear(VPCL:Record)
!      VPCL:PartijID=_partijid
!      VPCL:CelID=_celid
!      VPCL:CelLocatieID=_cellocatieid
!      if Access:ViewPartijCelLocaties.Fetch(VPCL:ViewPartijCelLocaties_PK)=Level:Benign 
!          _found = true
!      END
    IF RECORDS(PartijCelLocatiesQ)=0
        Access:ViewPartijCelLocaties.Open()
        Access:ViewPartijCelLocaties.UseFile()
        Clear(VPCL:RECORD)
        Set(VPCL:ViewPartijCelLocaties_PK,VPCL:ViewPartijCelLocaties_PK)
        Loop Until Access:ViewPartijCelLocaties.Next()
            PCLQ:PartijID=VPCL:PartijID
            PCLQ:CelID=VPCL:CelID
            PCLQ:CelLocatieID=VPCL:CelLocatieID
            PCLQ:CelLocatienaam=VPCL:CelLocatienaam
            PCLQ:KG=VPCL:KG
            PCLQ:Pallet=VPCL:Pallet
            Add(PartijCelLocatiesQ,+PCLQ:PartijID, +PCLQ:CelLocatieID)
        END
        Access:ViewPartijCelLocaties.Close()
    END
    PCLQ:PartijID=_partijid
    PCLQ:CelLocatieID=_cellocatieid
    GET(PartijCelLocatiesQ,+PCLQ:PartijID,+PCLQ:CelLocatieID)
    IF NOT ERROR()
        _found=TRUE 
    END 
        
    Return _found
include('ClassPackLijstSrc.inc')
!These procedures are used to initialize the DLL. It must be called by the main executable when it starts up
VoorrPln:Init PROCEDURE(<ErrorClass curGlobalErrors>, <INIClass curINIMgr>)
VoorrPln:Init_Called    BYTE,STATIC

  CODE
  IF VoorrPln:Init_Called
     RETURN
  ELSE
     VoorrPln:Init_Called = True
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
  Access:PlanningInkoop.SetErrors(GlobalErrors)
  Access:PlanningVerkoop.SetErrors(GlobalErrors)
  Access:RelatieAdres.SetErrors(GlobalErrors)
  Access:PalletMutatie.SetErrors(GlobalErrors)
  Access:ViewVoorraadPartij.SetErrors(GlobalErrors)
  Access:CMR.SetErrors(GlobalErrors)
  Access:ViewPlanningPartij.SetErrors(GlobalErrors)
  Access:OverboekingRit.SetErrors(GlobalErrors)
  Access:OverboekingRitRegel.SetErrors(GlobalErrors)
  Access:BulkOverboeking.SetErrors(GlobalErrors)
  Access:PlanningOverboeking.SetErrors(GlobalErrors)
  Access:DubbeleInslagMutaties.SetErrors(GlobalErrors)
  Access:ArtikelOmschrijvingExtra.SetErrors(GlobalErrors)
  Access:PalletSoort.SetErrors(GlobalErrors)
  Access:Weging.SetErrors(GlobalErrors)
  Access:CelLocatie.SetErrors(GlobalErrors)
  Access:ViewPartijCelLocaties.SetErrors(GlobalErrors)
  Access:ViewPlanningPartijTotaal.SetErrors(GlobalErrors)
  Access:ViewVoorraadPartijTotaal.SetErrors(GlobalErrors)
  Access:Gebruiker.SetErrors(GlobalErrors)
  Access:PartijCelVoorraad.SetErrors(GlobalErrors)
  Access:Activiteit.SetErrors(GlobalErrors)
  Access:RelatieArtikelOmschrijving.SetErrors(GlobalErrors)
  Access:Pallet.SetErrors(GlobalErrors)
  Access:KostenStamgeg.SetErrors(GlobalErrors)
  Access:ExtraKosten.SetErrors(GlobalErrors)
  Access:ViewBetcd.SetErrors(GlobalErrors)
  Access:DeliveryTerms.SetErrors(GlobalErrors)
  Access:ISOCountries.SetErrors(GlobalErrors)
  Access:SSOPCategorie.SetErrors(GlobalErrors)
  Access:SSOPObject.SetErrors(GlobalErrors)
  Access:SSOPRegistratie.SetErrors(GlobalErrors)
  Access:SSOPTijd.SetErrors(GlobalErrors)
  Access:GNCode.SetErrors(GlobalErrors)
  Access:GNCodeArtikelen.SetErrors(GlobalErrors)
  Access:Havens.SetErrors(GlobalErrors)
  Access:ARelatie.SetErrors(GlobalErrors)
  Access:APlanning.SetErrors(GlobalErrors)
  Access:AInkoop.SetErrors(GlobalErrors)
  Access:AVerkoop.SetErrors(GlobalErrors)
  Access:AViewArtikel.SetErrors(GlobalErrors)
  Access:AARelatie.SetErrors(GlobalErrors)
  Access:ACel.SetErrors(GlobalErrors)
  Access:AACel.SetErrors(GlobalErrors)
  Access:AVerpakking.SetErrors(GlobalErrors)
  Access:AAARelatie.SetErrors(GlobalErrors)
  Access:AAACel.SetErrors(GlobalErrors)
  Access:AViewVoorraadPartij.SetErrors(GlobalErrors)
  Access:AMutatie.SetErrors(GlobalErrors)
  Access:AAViewVoorraadPartij.SetErrors(GlobalErrors)
  Access:AAAViewVoorraadPartij.SetErrors(GlobalErrors)
  Access:APartij.SetErrors(GlobalErrors)
  Access:AAViewArtikel.SetErrors(GlobalErrors)
  Access:AAAAViewVoorraadPartij.SetErrors(GlobalErrors)
  Access:AOverboekingRitRegel.SetErrors(GlobalErrors)
  Access:AAPlanning.SetErrors(GlobalErrors)
  Access:AAPartij.SetErrors(GlobalErrors)
  Access:AAAACel.SetErrors(GlobalErrors)
  Access:AOverboekingRit.SetErrors(GlobalErrors)
  Access:APlanningInkoop.SetErrors(GlobalErrors)
  Access:APlanningOverboeking.SetErrors(GlobalErrors)
  Access:APlanningVerkoop.SetErrors(GlobalErrors)
  Access:APalletSoort.SetErrors(GlobalErrors)
  Access:ACelLocatie.SetErrors(GlobalErrors)
  Access:AACelLocatie.SetErrors(GlobalErrors)
  Access:AAACelLocatie.SetErrors(GlobalErrors)
  Access:AAAACelLocatie.SetErrors(GlobalErrors)
  Access:AAPlanningVerkoop.SetErrors(GlobalErrors)
  VOORRRPT:Init(curGlobalErrors, curINIMgr)                ! Initialise dll - (ABC) -
  VOORRSTM:Init(curGlobalErrors, curINIMgr)                ! Initialise dll - (ABC) -
  VoorrDct:Init(curGlobalErrors, curINIMgr)                ! Initialise dll - (ABC) -

!This procedure is used to shutdown the DLL. It must be called by the main executable before it closes down

VoorrPln:Kill PROCEDURE
VoorrPln:Kill_Called    BYTE,STATIC

  CODE
  IF VoorrPln:Kill_Called
     RETURN
  ELSE
     VoorrPln:Kill_Called = True
  END
  VOORRRPT:Kill()                                          ! Kill dll - (ABC) -
  VOORRSTM:Kill()                                          ! Kill dll - (ABC) -
  VoorrDct:Kill()                                          ! Kill dll - (ABC) -
 
!BOE: DEBUG Global
DebugABCGlobalInformation_VoorrPln PROCEDURE()

udpt            UltimateDebugProcedureTracker
                     
  CODE
  
  udpt.Init(UD,'DebugABCGlobalInformation_VoorrPln')
  
 
  RETURN

DebugABCGlobalVariables_VoorrPln PROCEDURE()

udpt            UltimateDebugProcedureTracker

  CODE
  
  udpt.Init(UD,'DebugABCGlobalVariables_VoorrPln')
  
  RETURN
!EOE: DEBUG Global

  

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


