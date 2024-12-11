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
   INCLUDE('PRNPROP.CLW')

   INCLUDE('ABERROR.INC'),ONCE
   INCLUDE('ABFILE.INC'),ONCE
   INCLUDE('ABUTIL.INC'),ONCE
   INCLUDE('EFOCUS.INC'),ONCE
   INCLUDE('ERRORS.CLW'),ONCE
   INCLUDE('KEYCODES.CLW'),ONCE
   INCLUDE('ABFUZZY.INC'),ONCE
   INCLUDE('BARCODE.INC'),ONCE
 Include('Debuger.INC'),once
  include('cwsynchc.inc'),once  ! added by NetTalk
  include('StringTheory.Inc'),ONCE
  INCLUDE('UltimateDebug.INC'),ONCE
  INCLUDE('UltimateDebugProcedureTracker.INC'),ONCE

   MAP
!--- Application Global and Exported Procedure Definitions --------------------------------------------
     MODULE('VOORRRPT001.CLW')
WindowCallSjabloon     PROCEDURE(String,String)   !
     END
     MODULE('VOORRRPT002.CLW')
MainRpt                PROCEDURE   !
     END
     MODULE('VOORRRPT003.CLW')
ReportWeeglijstExcel   PROCEDURE(STRING, LONG)   !Weeglijst in Excel
     END
     MODULE('VOORRRPT004.CLW')
ReportWeeglijst        PROCEDURE(STRING, LONG)   !
     END
     MODULE('VOORRRPT005.CLW')
ReportUitslag          PROCEDURE   !
     END
     MODULE('VOORRRPT006.CLW')
ReportPlanning         PROCEDURE(STRING)   !
     END
     MODULE('VOORRRPT007.CLW')
ReportPalletStickers   FUNCTION(),Long   !
     END
     MODULE('VOORRRPT008.CLW')
ReportInslag           PROCEDURE   !
     END
     MODULE('VOORRRPT009.CLW')
ReportDymoStickers     PROCEDURE(LONG, LONG)   !
     END
     MODULE('VOORRRPT010.CLW')
ReportCMR              PROCEDURE(LONG)   !
     END
     MODULE('VOORRRPT011.CLW')
ProcessExcel           PROCEDURE   !
     END
     MODULE('VOORRRPT012.CLW')
UpdateSjabloon         PROCEDURE   !Form Sjabloon
     END
     MODULE('VOORRRPT013.CLW')
BrowseSjablonen        PROCEDURE   !Browse the Sjabloon file
     END
     MODULE('VOORRRPT014.CLW')
ReportPalletTegoedenExcel PROCEDURE(BYTE)   !Process the ViewPalletTegoeden File
     END
     MODULE('VOORRRPT015.CLW')
WindowCallSjabloonOUD  PROCEDURE(String,String)   !
     END
     MODULE('VOORRRPT016.CLW')
ReportVerkoop          PROCEDURE(LONG, BYTE)   !Rapport
     END
     MODULE('VOORRRPT017.CLW')
ReportInkoop           PROCEDURE(LONG, BYTE)   !
     END
     MODULE('VOORRRPT018.CLW')
ReportOverboeking      PROCEDURE(LONG)   !
     END
     MODULE('VOORRRPT019.CLW')
ReportVerkoopMutaties  PROCEDURE(LONG)   !
     END
     MODULE('VOORRRPT020.CLW')
ReportPalletBladEnkel  PROCEDURE(LONG, REAL, BYTE, BYTE)   !
     END
     MODULE('VOORRRPT021.CLW')
ReportPalletBladMeerdere_WERKTNIET PROCEDURE(LONG)   !
     END
     MODULE('VOORRRPT022.CLW')
ReportPalletBlad       PROCEDURE(LONG)   !
     END
     MODULE('VOORRRPT023.CLW')
WindowPalletbladExport PROCEDURE   !Process the Mutatie File
     END
     MODULE('VOORRRPT024.CLW')
ReportVerkoopBevestiging PROCEDURE(LONG)   !
     END
     MODULE('VOORRRPT025.CLW')
ReportMutaties         PROCEDURE   !
     END
     MODULE('VOORRRPT026.CLW')
ReportActieAfwijkingen PROCEDURE   !
     END
     MODULE('VOORRRPT027.CLW')
ReportInkoopBevestiging PROCEDURE(LONG)   !
     END
     MODULE('VOORRRPT028.CLW')
ReportSSOPRegistraties PROCEDURE   !
     END
     MODULE('VOORRRPT029.CLW')
ReportVrdCelLocatie    PROCEDURE(LONG, QUEUE)   !Export naar Excel van Cel Voorraad Locatie
     END
     MODULE('VOORRRPT030.CLW')
ExportVerkoop          PROCEDURE(LONG, LONG)   !
     END
     MODULE('VOORRRPT031.CLW')
ReportPackLijst        PROCEDURE(LONG pVerkoopID,LONG pWelke,String pLayout,<Byte pExcel>)   !Proform Packinglist en Seaway bill
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
     
     !	IMPURLHandler(unsigned, STRING)
     
     !    MODULE('ImpShell2')
     !         ShellExecuteM(UNSIGNED,LONG,*CSTRING,LONG,*CSTRING,SIGNED),UNSIGNED,PASCAL,RAW,NAME('SHELLEXECUTEA')
     !    END
      
     
        INCLUDE('CWUTIL.INC'),ONCE
     !  INCLUDE('CLIB.CLW')
     !
     !  include('Ocx.CLW')
     
     !EventFunc procedure(*SHORT Reference,SIGNED OleControl,LONG CurrentEvent),LONG
     !PropChange PROCEDURE(SIGNED OleControl,STRING CurrentProp)
     !PropEdit   PROCEDURE(SIGNED OleControl,STRING CurrentProp),LONG

DebugABCGlobalInformation_VoorrRpt PROCEDURE()                                           ! DEBUG Prototype
DebugABCGlobalVariables_VoorrRpt PROCEDURE()                                             ! DEBUG Prototype

    ! Declare functions defined in this DLL
VoorrRpt:Init          PROCEDURE(<ErrorClass curGlobalErrors>, <INIClass curINIMgr>)
VoorrRpt:Kill          PROCEDURE
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

Transporteur         FILE,DRIVER('MSSQL'),PRE(Tra),BINDABLE,THREAD,EXTERNAL(''),DLL(dll_mode) !                     
Transporteur_FK          KEY(Tra:RelatieID,Tra:TransporteurID),DUP,NOCASE ! Op RelatieID/TransporteurID
PK_Transporteur          KEY(Tra:TransporteurID),PRIMARY   !                     
Record                   RECORD,PRE()
TransporteurID              LONG                           !                     
RelatieID                   LONG                           !                     
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

ArtikelOmschrijvingExtra FILE,DRIVER('MSSQL'),PRE(Art2),BINDABLE,THREAD,EXTERNAL(''),DLL(dll_mode) !                     
PK_ArtikelOmschrijvingExtra KEY(Art2:ex_artcode,Art2:artcode),DUP,NOCASE ! Op ex_artcode / artcode
Record                   RECORD,PRE()
ID                          LONG                           !                     
ex_artcode                  STRING(2),NAME('"ex_artcode"') !                     
artcode                     STRING(30)                     !                     
tekst                       STRING(160)                    !                     
                         END
                     END                       

ArtikelOmschrijvingExtraGroep FILE,DRIVER('MSSQL'),PRE(Art3),BINDABLE,THREAD,EXTERNAL(''),DLL(dll_mode) !                     
PK_ArtikelOmschrijvingExtraGroep KEY(Art3:ID),DUP,NOCASE   !                     
FK_ArtikelOmschrijvingExtraGroep KEY(Art3:ex_artcode,Art3:ID),DUP,NOCASE !                     
Record                   RECORD,PRE()
ID                          LONG                           !                     
ex_artcode                  STRING(2),NAME('"ex_artcode"') !                     
Omschrijving                CSTRING(21)                    !                     
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

Versie               FILE,DRIVER('MSSQL'),PRE(VRS),BINDABLE,THREAD,EXTERNAL(''),DLL(dll_mode) !                     
Versie_PK                KEY(VRS:Versie),PRIMARY           !                     
Record                   RECORD,PRE()
Versie                      DECIMAL(7,2)                   !                     
DatumTijd                   STRING(8)                      !                     
DatumTijd_GROUP             GROUP,OVER(DatumTijd)          !                     
DatumTijd_DATE                DATE                         !                     
DatumTijd_TIME                TIME                         !                     
                            END                            !                     
Wijzigingen                 CSTRING(1000)                  ! Aanpassingen in deze versie
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

PalletBladSjabloon   FILE,DRIVER('MSSQL'),PRE(PBS),BINDABLE,THREAD,EXTERNAL(''),DLL(dll_mode) !                     
PK_PalletBladSjabloon    KEY(PBS:PalletBladSjabloonID),PRIMARY !                     
Record                   RECORD,PRE()
PalletBladSjabloonID        LONG                           !                     
PalletBladSjabloonNaam      CSTRING(51)                    !                     
Leverancier                 CSTRING(101)                   !                     
Klant                       CSTRING(101)                   !                     
SSCC_NVE_00                 CSTRING(101)                   !                     
DueDate_12                  CSTRING(101)                   !                     
CustomerPurchaseOrderNumber_400 CSTRING(101)               !                     
ProductionDate_11           CSTRING(101)                   !                     
ArtikelOms                  CSTRING(101)                   !                     
CustomerPartNumber_241      CSTRING(101)                   !                     
BatchNumber_10              CSTRING(101)                   !                     
SellByDate_15               CSTRING(101)                   !                     
NumberOfUnitsContained_37   CSTRING(101)                   !                     
ProductNetWeight_310        CSTRING(101)                   !                     
OriginLiveBird              CSTRING(51)                    !                     
OriginSlautherHouse         CSTRING(51)                    !                     
OriginProcessing            CSTRING(51)                    !                     
OriginPacking               CSTRING(51)                    !                     
NaOntdooien                 CSTRING(51)                    !                     
TransportEnOpslag           CSTRING(51)                    !                     
HarvastDate7007             CSTRING(101)                   !                     
                         END
                     END                       

PalletBladSjabloonCountry FILE,DRIVER('MSSQL'),PRE(PBSC),BINDABLE,THREAD,EXTERNAL(''),DLL(dll_mode) !                     
PK_PalletBladSjabloonCountry KEY(PBSC:PalletBladSjabloonCountryID),PRIMARY !                     
FK1_PalletBladSjabloonCountry KEY(PBSC:PalletBladSjabloonID,PBSC:Country),DUP !                     
FK2_PalletBladSjabloonCountry KEY(PBSC:Country,PBSC:PalletBladSjabloonID),DUP,NOCASE !                     
Record                   RECORD,PRE()
PalletBladSjabloonCountryID LONG                           !                     
PalletBladSjabloonID        LONG                           !                     
Country                     CSTRING(61)                    !                     
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

!endregion

db Debuger
UD         CLASS(UltimateDebug),EXTERNAL,DLL(dll_mode)
                     END   
 
include('GlobalClassDef.inc')
include('ExcelExportClassDef.inc')
include('ClassPackLijstDef.inc')
Access:ViewArtikel   &FileManager,THREAD,EXTERNAL,DLL      ! FileManager for ViewArtikel
Relate:ViewArtikel   &RelationManager,THREAD,EXTERNAL,DLL  ! RelationManager for ViewArtikel
Access:Partij        &FileManager,THREAD,EXTERNAL,DLL      ! FileManager for Partij
Relate:Partij        &RelationManager,THREAD,EXTERNAL,DLL  ! RelationManager for Partij
Access:Relatie       &FileManager,THREAD,EXTERNAL,DLL      ! FileManager for Relatie
Relate:Relatie       &RelationManager,THREAD,EXTERNAL,DLL  ! RelationManager for Relatie
Access:Verpakking    &FileManager,THREAD,EXTERNAL,DLL      ! FileManager for Verpakking
Relate:Verpakking    &RelationManager,THREAD,EXTERNAL,DLL  ! RelationManager for Verpakking
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
Access:PalletVerloop &FileManager,THREAD,EXTERNAL,DLL      ! FileManager for PalletVerloop
Relate:PalletVerloop &RelationManager,THREAD,EXTERNAL,DLL  ! RelationManager for PalletVerloop
Access:Transporteur  &FileManager,THREAD,EXTERNAL,DLL      ! FileManager for Transporteur
Relate:Transporteur  &RelationManager,THREAD,EXTERNAL,DLL  ! RelationManager for Transporteur
Access:ViewTransporteur &FileManager,THREAD,EXTERNAL,DLL   ! FileManager for ViewTransporteur
Relate:ViewTransporteur &RelationManager,THREAD,EXTERNAL,DLL ! RelationManager for ViewTransporteur
Access:ViewVoorraadPartij &FileManager,THREAD,EXTERNAL,DLL ! FileManager for ViewVoorraadPartij
Relate:ViewVoorraadPartij &RelationManager,THREAD,EXTERNAL,DLL ! RelationManager for ViewVoorraadPartij
Access:CMR           &FileManager,THREAD,EXTERNAL,DLL      ! FileManager for CMR
Relate:CMR           &RelationManager,THREAD,EXTERNAL,DLL  ! RelationManager for CMR
Access:ArtikelOmschrijvingExtra &FileManager,THREAD,EXTERNAL,DLL ! FileManager for ArtikelOmschrijvingExtra
Relate:ArtikelOmschrijvingExtra &RelationManager,THREAD,EXTERNAL,DLL ! RelationManager for ArtikelOmschrijvingExtra
Access:ArtikelOmschrijvingExtraGroep &FileManager,THREAD,EXTERNAL,DLL ! FileManager for ArtikelOmschrijvingExtraGroep
Relate:ArtikelOmschrijvingExtraGroep &RelationManager,THREAD,EXTERNAL,DLL ! RelationManager for ArtikelOmschrijvingExtraGroep
Access:PalletSoort   &FileManager,THREAD,EXTERNAL,DLL      ! FileManager for PalletSoort
Relate:PalletSoort   &RelationManager,THREAD,EXTERNAL,DLL  ! RelationManager for PalletSoort
Access:Weging        &FileManager,THREAD,EXTERNAL,DLL      ! FileManager for Weging
Relate:Weging        &RelationManager,THREAD,EXTERNAL,DLL  ! RelationManager for Weging
Access:CelLocatie    &FileManager,THREAD,EXTERNAL,DLL      ! FileManager for CelLocatie
Relate:CelLocatie    &RelationManager,THREAD,EXTERNAL,DLL  ! RelationManager for CelLocatie
Access:Versie        &FileManager,THREAD,EXTERNAL,DLL      ! FileManager for Versie
Relate:Versie        &RelationManager,THREAD,EXTERNAL,DLL  ! RelationManager for Versie
Access:ViewPartijCelLocaties &FileManager,THREAD,EXTERNAL,DLL ! FileManager for ViewPartijCelLocaties
Relate:ViewPartijCelLocaties &RelationManager,THREAD,EXTERNAL,DLL ! RelationManager for ViewPartijCelLocaties
Access:ViewPalletTegoeden &FileManager,THREAD,EXTERNAL,DLL ! FileManager for ViewPalletTegoeden
Relate:ViewPalletTegoeden &RelationManager,THREAD,EXTERNAL,DLL ! RelationManager for ViewPalletTegoeden
Access:Gebruiker     &FileManager,THREAD,EXTERNAL,DLL      ! FileManager for Gebruiker
Relate:Gebruiker     &RelationManager,THREAD,EXTERNAL,DLL  ! RelationManager for Gebruiker
Access:PalletBladSjabloon &FileManager,THREAD,EXTERNAL,DLL ! FileManager for PalletBladSjabloon
Relate:PalletBladSjabloon &RelationManager,THREAD,EXTERNAL,DLL ! RelationManager for PalletBladSjabloon
Access:PalletBladSjabloonCountry &FileManager,THREAD,EXTERNAL,DLL ! FileManager for PalletBladSjabloonCountry
Relate:PalletBladSjabloonCountry &RelationManager,THREAD,EXTERNAL,DLL ! RelationManager for PalletBladSjabloonCountry
Access:RelatieArtikelOmschrijving &FileManager,THREAD,EXTERNAL,DLL ! FileManager for RelatieArtikelOmschrijving
Relate:RelatieArtikelOmschrijving &RelationManager,THREAD,EXTERNAL,DLL ! RelationManager for RelatieArtikelOmschrijving
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
Access:AAACel        &FileManager,THREAD,EXTERNAL,DLL      ! FileManager for AAACel
Relate:AAACel        &RelationManager,THREAD,EXTERNAL,DLL  ! RelationManager for AAACel
Access:AMutatie      &FileManager,THREAD,EXTERNAL,DLL      ! FileManager for AMutatie
Relate:AMutatie      &RelationManager,THREAD,EXTERNAL,DLL  ! RelationManager for AMutatie
Access:AAViewArtikel &FileManager,THREAD,EXTERNAL,DLL      ! FileManager for AAViewArtikel
Relate:AAViewArtikel &RelationManager,THREAD,EXTERNAL,DLL  ! RelationManager for AAViewArtikel
Access:AAPlanning    &FileManager,THREAD,EXTERNAL,DLL      ! FileManager for AAPlanning
Relate:AAPlanning    &RelationManager,THREAD,EXTERNAL,DLL  ! RelationManager for AAPlanning

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
     db.init('VoorrRpt',0,50)  ! intiialize the debuger class 
  
include('GlobalClassSrc.inc')
include('ExcelExportClassSrc.inc')
include('ClassPackLijstSrc.inc')
!These procedures are used to initialize the DLL. It must be called by the main executable when it starts up
VoorrRpt:Init PROCEDURE(<ErrorClass curGlobalErrors>, <INIClass curINIMgr>)
VoorrRpt:Init_Called    BYTE,STATIC

  CODE
  IF VoorrRpt:Init_Called
     RETURN
  ELSE
     VoorrRpt:Init_Called = True
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
  Access:PalletVerloop.SetErrors(GlobalErrors)
  Access:Transporteur.SetErrors(GlobalErrors)
  Access:ViewTransporteur.SetErrors(GlobalErrors)
  Access:ViewVoorraadPartij.SetErrors(GlobalErrors)
  Access:CMR.SetErrors(GlobalErrors)
  Access:ArtikelOmschrijvingExtra.SetErrors(GlobalErrors)
  Access:ArtikelOmschrijvingExtraGroep.SetErrors(GlobalErrors)
  Access:PalletSoort.SetErrors(GlobalErrors)
  Access:Weging.SetErrors(GlobalErrors)
  Access:CelLocatie.SetErrors(GlobalErrors)
  Access:Versie.SetErrors(GlobalErrors)
  Access:ViewPartijCelLocaties.SetErrors(GlobalErrors)
  Access:ViewPalletTegoeden.SetErrors(GlobalErrors)
  Access:Gebruiker.SetErrors(GlobalErrors)
  Access:PalletBladSjabloon.SetErrors(GlobalErrors)
  Access:PalletBladSjabloonCountry.SetErrors(GlobalErrors)
  Access:RelatieArtikelOmschrijving.SetErrors(GlobalErrors)
  Access:KostenStamgeg.SetErrors(GlobalErrors)
  Access:ExtraKosten.SetErrors(GlobalErrors)
  Access:ViewBetcd.SetErrors(GlobalErrors)
  Access:DeliveryTerms.SetErrors(GlobalErrors)
  Access:ISOCountries.SetErrors(GlobalErrors)
  Access:SSOPObject.SetErrors(GlobalErrors)
  Access:SSOPRegistratie.SetErrors(GlobalErrors)
  Access:SSOPTijd.SetErrors(GlobalErrors)
  Access:GNCode.SetErrors(GlobalErrors)
  Access:GNCodeArtikelen.SetErrors(GlobalErrors)
  Access:ARelatie.SetErrors(GlobalErrors)
  Access:APlanning.SetErrors(GlobalErrors)
  Access:AVerkoop.SetErrors(GlobalErrors)
  Access:AViewArtikel.SetErrors(GlobalErrors)
  Access:AARelatie.SetErrors(GlobalErrors)
  Access:ACel.SetErrors(GlobalErrors)
  Access:AACel.SetErrors(GlobalErrors)
  Access:AAACel.SetErrors(GlobalErrors)
  Access:AMutatie.SetErrors(GlobalErrors)
  Access:AAViewArtikel.SetErrors(GlobalErrors)
  Access:AAPlanning.SetErrors(GlobalErrors)

!This procedure is used to shutdown the DLL. It must be called by the main executable before it closes down

VoorrRpt:Kill PROCEDURE
VoorrRpt:Kill_Called    BYTE,STATIC

  CODE
  IF VoorrRpt:Kill_Called
     RETURN
  ELSE
     VoorrRpt:Kill_Called = True
  END
 
!BOE: DEBUG Global
DebugABCGlobalInformation_VoorrRpt PROCEDURE()

udpt            UltimateDebugProcedureTracker
                     
  CODE
  
  udpt.Init(UD,'DebugABCGlobalInformation_VoorrRpt')
  
 
  RETURN

DebugABCGlobalVariables_VoorrRpt PROCEDURE()

udpt            UltimateDebugProcedureTracker

  CODE
  
  udpt.Init(UD,'DebugABCGlobalVariables_VoorrRpt')
  
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


