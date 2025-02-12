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
GPFRep:Version equate ('2.36')           !Deprecated - but exists for backward compatibility
GPFReporter:TemplateVersion equate ('2.36')
HyperActive:TemplateVersion equate('2.28')
WinEvent:TemplateVersion      equate('5.35')

   INCLUDE('ABERROR.INC'),ONCE
   INCLUDE('ABFILE.INC'),ONCE
   INCLUDE('ABUTIL.INC'),ONCE
   INCLUDE('EFOCUS.INC'),ONCE
   INCLUDE('ERRORS.CLW'),ONCE
   INCLUDE('KEYCODES.CLW'),ONCE
   INCLUDE('ABFUZZY.INC'),ONCE
   INCLUDE('BARCODE.INC'),ONCE
   INCLUDE('CFILTBASE.INC'),ONCE
   INCLUDE('CFILTERLIST.INC'),ONCE
  include('cwsynchc.inc'),once  ! added by NetTalk
  include('StringTheory.Inc'),ONCE
   INCLUDE('ultimateversion.inc'),ONCE  
  INCLUDE('UltimateDebug.INC'),ONCE
  INCLUDE('UltimateDebugProcedureTracker.INC'),ONCE
  include('csGPF.Inc'),ONCE
   include('Hyper.Inc'),ONCE
    Include('WinEvent.Inc'),Once

   MAP
    MODULE('VOORRSTM.DLL')
BrowseArtikel          PROCEDURE,DLL                       ! 
BrowseCel              PROCEDURE,DLL                       ! 
BrowsePalletSoort      PROCEDURE,DLL                       ! 
BrowseRelatieAdres     PROCEDURE,DLL                       ! 
BrowseTransporteurs    PROCEDURE,DLL                       ! 
BrowseVerpakking       PROCEDURE,DLL                       ! 
BrowseRelatie          PROCEDURE,DLL                       ! 
BrowsePalletBladSjabloon PROCEDURE,DLL                     ! 
BrowseKostenStam       PROCEDURE,DLL                       ! 
BrowseDeliveryTerms    PROCEDURE,DLL                       ! 
BrowseISOCountries     PROCEDURE,DLL                       ! 
BrowseSSOPCategorie    PROCEDURE,DLL                       ! 
BrowseGNCode           PROCEDURE,DLL                       ! 
BrowseHavens           PROCEDURE,DLL                       ! 
BrowseRapporten        PROCEDURE,DLL                       ! 
    END
    MODULE('VOORRRPT.DLL')
BrowseSjablonen        PROCEDURE,DLL                       ! 
ReportMutaties         PROCEDURE,DLL                       ! 
ReportActieAfwijkingen PROCEDURE,DLL                       ! 
ReportSSOPRegistraties PROCEDURE,DLL                       ! 
    END
    MODULE('VOORRPLN.DLL')
BrowseInkoop           PROCEDURE,DLL                       ! 
BrowseOverboeking      PROCEDURE,DLL                       ! 
BrowsePlanning         PROCEDURE,DLL                       ! 
BrowseVerkoop          PROCEDURE,DLL                       ! 
BrowseActiviteit       PROCEDURE,DLL                       ! 
BrowseSSOPRegistratie  PROCEDURE,DLL                       ! 
WindowCelLocaties      PROCEDURE,DLL                       ! 
    END
    MODULE('VOORRVRD.DLL')
BrowsePallets          PROCEDURE,DLL                       ! 
BrowsePartijVoorraad   PROCEDURE,DLL                       ! 
BrowsePalletTegoeden   PROCEDURE,DLL                       ! 
BrowsePartijVoorraadVIEW PROCEDURE,DLL                     ! 
BrowseVoorraadVIEW     PROCEDURE,DLL                       ! 
    END
!--- Application Global and Exported Procedure Definitions --------------------------------------------
     MODULE('VOORRAAD002.CLW')
MainFrame              PROCEDURE   !
     END
	INCLUDE('CWUTIL.INC'),ONCE

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
     ! GetComputerName()
     MODULE('Windows API')
     	GetComputerName(*CSTRING,*LONG),BOOL,RAW,PASCAL,NAME('GetComputerNameA'),PROC
     END

DebugABCGlobalInformation_Voorraad PROCEDURE()                                           ! DEBUG Prototype
DebugABCGlobalVariables_Voorraad PROCEDURE()                                             ! DEBUG Prototype

       MyOKToEndSessionHandler(long pLogoff),long,pascal
       MyEndSessionHandler(long pLogoff),pascal
    ! Declare init functions defined in a different dll
     MODULE('VOORRSTM.DLL')
VoorrStm:Init          PROCEDURE(<ErrorClass curGlobalErrors>, <INIClass curINIMgr>),DLL
VoorrStm:Kill          PROCEDURE,DLL
     END
     MODULE('VOORRRPT.DLL')
VoorrRpt:Init          PROCEDURE(<ErrorClass curGlobalErrors>, <INIClass curINIMgr>),DLL
VoorrRpt:Kill          PROCEDURE,DLL
     END
     MODULE('VOORRPLN.DLL')
VoorrPln:Init          PROCEDURE(<ErrorClass curGlobalErrors>, <INIClass curINIMgr>),DLL
VoorrPln:Kill          PROCEDURE,DLL
     END
     MODULE('VOORRVRD.DLL')
VoorrVrd:Init          PROCEDURE(<ErrorClass curGlobalErrors>, <INIClass curINIMgr>),DLL
VoorrVrd:Kill          PROCEDURE,DLL
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

GebruikerLog         FILE,DRIVER('MSSQL'),PRE(Log),BINDABLE,THREAD,EXTERNAL(''),DLL(dll_mode) !                     
FK1_GebruikerLog         KEY(-Log:Uitgevoerd,-Log:ID),DUP,NOCASE !                     
FK2_GebruikerLog         KEY(Log:WindowsInlog,-Log:Uitgevoerd,-Log:ID),DUP,NOCASE !                     
PK_GebruikerLog          KEY(Log:ID),NOCASE,PRIMARY        !                     
Record                   RECORD,PRE()
ID                          LONG                           !                     
WindowsInlog                CSTRING(51)                    !                     
Werkstation                 CSTRING(31)                    !                     
Uitgevoerd                  STRING(8)                      !                     
Uitgevoerd_GROUP            GROUP,OVER(Uitgevoerd)         !                     
Uitgevoerd_DATE               DATE                         !                     
Uitgevoerd_TIME               TIME                         !                     
                            END                            !                     
Handeling                   CSTRING(21)                    !                     
HandelingOpmerking          CSTRING(101)                   !                     
Tabel                       CSTRING(31)                    !                     
RecordInhoudPre             CSTRING(5001)                  !                     
RecordInhoudPost            CSTRING(5001)                  !                     
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

Pallet               FILE,DRIVER('MSSQL'),PRE(PLL),BINDABLE,THREAD,EXTERNAL(''),DLL(dll_mode) !                     
PK_Pallet                KEY(PLL:PalletID),PRIMARY         !                     
Record                   RECORD,PRE()
PalletID                    LONG                           !                     
Dummy                       STRING(1)                      !                     
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

!endregion

! ----- ThisGPF --------------------------------------------------------------------------
ThisGPF              Class(GPFReporterClass)
    ! derived method declarations
Construct              PROCEDURE ()
Destruct               PROCEDURE ()
_GetSymbol             PROCEDURE (ulong pAddress,byte pStackTrace=1),string ,VIRTUAL
_LookupExceptionCode   PROCEDURE (ulong p_ExceptionCode),string ,VIRTUAL
_VectoredExceptionHandler_ PROCEDURE (ulong p_e),long ,VIRTUAL
_StackDetails          PROCEDURE (ulong p_e,byte p_details,ulong p_hProcess),string ,VIRTUAL
_LocateDebugSymbols    PROCEDURE (long phModule),byte ,VIRTUAL
_ReadBlockFromFile     PROCEDURE (ulong pOffset,long pReadBytes,*string pFileBlock,*string pFileName) ,VIRTUAL
_GetModuleName         PROCEDURE (long phModule),string ,VIRTUAL
_GetModuleHandle       PROCEDURE (ulong pAddress),long ,VIRTUAL
LookupAddress          PROCEDURE () ,VIRTUAL
Initialize             PROCEDURE () ,VIRTUAL
FilterExceptions       PROCEDURE (ulong pException) ,VIRTUAL
_EncodeEmail           PROCEDURE (string pEmailText),string ,VIRTUAL
_FindFirstBreak        PROCEDURE (string pText,long pMaxLen),long ,VIRTUAL
ExtraReportText        PROCEDURE () ,VIRTUAL
_GetDLLVersion         PROCEDURE (string pDLLName),string ,VIRTUAL
_SetFileNames          PROCEDURE () ,VIRTUAL
DeleteDumpFile         PROCEDURE () ,VIRTUAL
_InitReportText        PROCEDURE () ,VIRTUAL
_ExecuteCommands       PROCEDURE () ,VIRTUAL
_StackDump             PROCEDURE (long pStart,long pEnd,long pStackLevel),string ,VIRTUAL
_FindLinePosition      PROCEDURE (string pText,long pLineNumber),long ,VIRTUAL
_DebugLog              PROCEDURE (string pDebugData,byte pFirstLine=0) ,VIRTUAL
_FormatLineInfo        PROCEDURE (long pLineNumber,string pProcName,string pSourceName,string pModuleName,byte pStackTrace,byte pNoProcFound,byte pExactAddress,byte pNoLineNumber),string ,VIRTUAL
_GetAssert             PROCEDURE (long pSP,long pBP),long ,VIRTUAL
_GetOtherMessage       PROCEDURE (long pSP,long pBP),long ,VIRTUAL
_RestartProgram        PROCEDURE () ,VIRTUAL
                     End  ! ThisGPF
! ----- end ThisGPF -----------------------------------------------------------------------
gv         ultimateversion
UD         CLASS(UltimateDebug),EXTERNAL,DLL(dll_mode)
                     END   
 
WE::MustClose       long,external,dll
WE::CantCloseNow    long,external,dll
include('VoorraadClassDef.inc')
include('GlobalClassDef.inc')
! GetComputerName()
MAX_COMPUTERNAME_LENGTH EQUATE(31)
ComputerLen LONG(MAX_COMPUTERNAME_LENGTH)
ComputerName CSTRING(MAX_COMPUTERNAME_LENGTH+1)
Access:ViewArtikel   &FileManager,THREAD,EXTERNAL,DLL(dll_mode) ! FileManager for ViewArtikel
Relate:ViewArtikel   &RelationManager,THREAD,EXTERNAL,DLL(dll_mode) ! RelationManager for ViewArtikel
Access:Partij        &FileManager,THREAD,EXTERNAL,DLL(dll_mode) ! FileManager for Partij
Relate:Partij        &RelationManager,THREAD,EXTERNAL,DLL(dll_mode) ! RelationManager for Partij
Access:Relatie       &FileManager,THREAD,EXTERNAL,DLL(dll_mode) ! FileManager for Relatie
Relate:Relatie       &RelationManager,THREAD,EXTERNAL,DLL(dll_mode) ! RelationManager for Relatie
Access:Verpakking    &FileManager,THREAD,EXTERNAL,DLL(dll_mode) ! FileManager for Verpakking
Relate:Verpakking    &RelationManager,THREAD,EXTERNAL,DLL(dll_mode) ! RelationManager for Verpakking
Access:Cel           &FileManager,THREAD,EXTERNAL,DLL(dll_mode) ! FileManager for Cel
Relate:Cel           &RelationManager,THREAD,EXTERNAL,DLL(dll_mode) ! RelationManager for Cel
Access:Mutatie       &FileManager,THREAD,EXTERNAL,DLL(dll_mode) ! FileManager for Mutatie
Relate:Mutatie       &RelationManager,THREAD,EXTERNAL,DLL(dll_mode) ! RelationManager for Mutatie
Access:Inkoop        &FileManager,THREAD,EXTERNAL,DLL(dll_mode) ! FileManager for Inkoop
Relate:Inkoop        &RelationManager,THREAD,EXTERNAL,DLL(dll_mode) ! RelationManager for Inkoop
Access:Planning      &FileManager,THREAD,EXTERNAL,DLL(dll_mode) ! FileManager for Planning
Relate:Planning      &RelationManager,THREAD,EXTERNAL,DLL(dll_mode) ! RelationManager for Planning
Access:Verkoop       &FileManager,THREAD,EXTERNAL,DLL(dll_mode) ! FileManager for Verkoop
Relate:Verkoop       &RelationManager,THREAD,EXTERNAL,DLL(dll_mode) ! RelationManager for Verkoop
Access:Sjabloon      &FileManager,THREAD,EXTERNAL,DLL(dll_mode) ! FileManager for Sjabloon
Relate:Sjabloon      &RelationManager,THREAD,EXTERNAL,DLL(dll_mode) ! RelationManager for Sjabloon
Access:PlanningInkoop &FileManager,THREAD,EXTERNAL,DLL(dll_mode) ! FileManager for PlanningInkoop
Relate:PlanningInkoop &RelationManager,THREAD,EXTERNAL,DLL(dll_mode) ! RelationManager for PlanningInkoop
Access:PlanningVerkoop &FileManager,THREAD,EXTERNAL,DLL(dll_mode) ! FileManager for PlanningVerkoop
Relate:PlanningVerkoop &RelationManager,THREAD,EXTERNAL,DLL(dll_mode) ! RelationManager for PlanningVerkoop
Access:VoorraadVerloop &FileManager,THREAD,EXTERNAL,DLL(dll_mode) ! FileManager for VoorraadVerloop
Relate:VoorraadVerloop &RelationManager,THREAD,EXTERNAL,DLL(dll_mode) ! RelationManager for VoorraadVerloop
Access:RelatieAdres  &FileManager,THREAD,EXTERNAL,DLL(dll_mode) ! FileManager for RelatieAdres
Relate:RelatieAdres  &RelationManager,THREAD,EXTERNAL,DLL(dll_mode) ! RelationManager for RelatieAdres
Access:PalletMutatie &FileManager,THREAD,EXTERNAL,DLL(dll_mode) ! FileManager for PalletMutatie
Relate:PalletMutatie &RelationManager,THREAD,EXTERNAL,DLL(dll_mode) ! RelationManager for PalletMutatie
Access:PalletVerloop &FileManager,THREAD,EXTERNAL,DLL(dll_mode) ! FileManager for PalletVerloop
Relate:PalletVerloop &RelationManager,THREAD,EXTERNAL,DLL(dll_mode) ! RelationManager for PalletVerloop
Access:Transporteur  &FileManager,THREAD,EXTERNAL,DLL(dll_mode) ! FileManager for Transporteur
Relate:Transporteur  &RelationManager,THREAD,EXTERNAL,DLL(dll_mode) ! RelationManager for Transporteur
Access:ViewVoorraadPartij &FileManager,THREAD,EXTERNAL,DLL(dll_mode) ! FileManager for ViewVoorraadPartij
Relate:ViewVoorraadPartij &RelationManager,THREAD,EXTERNAL,DLL(dll_mode) ! RelationManager for ViewVoorraadPartij
Access:CMR           &FileManager,THREAD,EXTERNAL,DLL(dll_mode) ! FileManager for CMR
Relate:CMR           &RelationManager,THREAD,EXTERNAL,DLL(dll_mode) ! RelationManager for CMR
Access:OverboekingRit &FileManager,THREAD,EXTERNAL,DLL(dll_mode) ! FileManager for OverboekingRit
Relate:OverboekingRit &RelationManager,THREAD,EXTERNAL,DLL(dll_mode) ! RelationManager for OverboekingRit
Access:OverboekingRitRegel &FileManager,THREAD,EXTERNAL,DLL(dll_mode) ! FileManager for OverboekingRitRegel
Relate:OverboekingRitRegel &RelationManager,THREAD,EXTERNAL,DLL(dll_mode) ! RelationManager for OverboekingRitRegel
Access:BulkOverboeking &FileManager,THREAD,EXTERNAL,DLL(dll_mode) ! FileManager for BulkOverboeking
Relate:BulkOverboeking &RelationManager,THREAD,EXTERNAL,DLL(dll_mode) ! RelationManager for BulkOverboeking
Access:PlanningOverboeking &FileManager,THREAD,EXTERNAL,DLL(dll_mode) ! FileManager for PlanningOverboeking
Relate:PlanningOverboeking &RelationManager,THREAD,EXTERNAL,DLL(dll_mode) ! RelationManager for PlanningOverboeking
Access:DubbeleInslagMutaties &FileManager,THREAD,EXTERNAL,DLL(dll_mode) ! FileManager for DubbeleInslagMutaties
Relate:DubbeleInslagMutaties &RelationManager,THREAD,EXTERNAL,DLL(dll_mode) ! RelationManager for DubbeleInslagMutaties
Access:ArtikelOmschrijvingExtra &FileManager,THREAD,EXTERNAL,DLL(dll_mode) ! FileManager for ArtikelOmschrijvingExtra
Relate:ArtikelOmschrijvingExtra &RelationManager,THREAD,EXTERNAL,DLL(dll_mode) ! RelationManager for ArtikelOmschrijvingExtra
Access:ArtikelOmschrijvingExtraGroep &FileManager,THREAD,EXTERNAL,DLL(dll_mode) ! FileManager for ArtikelOmschrijvingExtraGroep
Relate:ArtikelOmschrijvingExtraGroep &RelationManager,THREAD,EXTERNAL,DLL(dll_mode) ! RelationManager for ArtikelOmschrijvingExtraGroep
Access:PalletSoort   &FileManager,THREAD,EXTERNAL,DLL(dll_mode) ! FileManager for PalletSoort
Relate:PalletSoort   &RelationManager,THREAD,EXTERNAL,DLL(dll_mode) ! RelationManager for PalletSoort
Access:Weging        &FileManager,THREAD,EXTERNAL,DLL(dll_mode) ! FileManager for Weging
Relate:Weging        &RelationManager,THREAD,EXTERNAL,DLL(dll_mode) ! RelationManager for Weging
Access:CelLocatie    &FileManager,THREAD,EXTERNAL,DLL(dll_mode) ! FileManager for CelLocatie
Relate:CelLocatie    &RelationManager,THREAD,EXTERNAL,DLL(dll_mode) ! RelationManager for CelLocatie
Access:Versie        &FileManager,THREAD,EXTERNAL,DLL(dll_mode) ! FileManager for Versie
Relate:Versie        &RelationManager,THREAD,EXTERNAL,DLL(dll_mode) ! RelationManager for Versie
Access:Gebruiker     &FileManager,THREAD,EXTERNAL,DLL(dll_mode) ! FileManager for Gebruiker
Relate:Gebruiker     &RelationManager,THREAD,EXTERNAL,DLL(dll_mode) ! RelationManager for Gebruiker
Access:GebruikerLog  &FileManager,THREAD,EXTERNAL,DLL(dll_mode) ! FileManager for GebruikerLog
Relate:GebruikerLog  &RelationManager,THREAD,EXTERNAL,DLL(dll_mode) ! RelationManager for GebruikerLog
Access:PartijCelVoorraad &FileManager,THREAD,EXTERNAL,DLL(dll_mode) ! FileManager for PartijCelVoorraad
Relate:PartijCelVoorraad &RelationManager,THREAD,EXTERNAL,DLL(dll_mode) ! RelationManager for PartijCelVoorraad
Access:RelatieArtikelOmschrijving &FileManager,THREAD,EXTERNAL,DLL(dll_mode) ! FileManager for RelatieArtikelOmschrijving
Relate:RelatieArtikelOmschrijving &RelationManager,THREAD,EXTERNAL,DLL(dll_mode) ! RelationManager for RelatieArtikelOmschrijving
Access:Pallet        &FileManager,THREAD,EXTERNAL,DLL(dll_mode) ! FileManager for Pallet
Relate:Pallet        &RelationManager,THREAD,EXTERNAL,DLL(dll_mode) ! RelationManager for Pallet
Access:ViewBetcd     &FileManager,THREAD,EXTERNAL,DLL(dll_mode) ! FileManager for ViewBetcd
Relate:ViewBetcd     &RelationManager,THREAD,EXTERNAL,DLL(dll_mode) ! RelationManager for ViewBetcd
Access:ARelatie      &FileManager,THREAD,EXTERNAL,DLL(dll_mode) ! FileManager for ARelatie
Relate:ARelatie      &RelationManager,THREAD,EXTERNAL,DLL(dll_mode) ! RelationManager for ARelatie
Access:APlanning     &FileManager,THREAD,EXTERNAL,DLL(dll_mode) ! FileManager for APlanning
Relate:APlanning     &RelationManager,THREAD,EXTERNAL,DLL(dll_mode) ! RelationManager for APlanning
Access:AViewArtikel  &FileManager,THREAD,EXTERNAL,DLL(dll_mode) ! FileManager for AViewArtikel
Relate:AViewArtikel  &RelationManager,THREAD,EXTERNAL,DLL(dll_mode) ! RelationManager for AViewArtikel
Access:ACel          &FileManager,THREAD,EXTERNAL,DLL(dll_mode) ! FileManager for ACel
Relate:ACel          &RelationManager,THREAD,EXTERNAL,DLL(dll_mode) ! RelationManager for ACel

FuzzyMatcher         FuzzyClass                            ! Global fuzzy matcher
GlobalErrorStatus    ErrorStatusClass,THREAD
GlobalErrors         ErrorClass                            ! Global error manager
INIMgr               INIClass                              ! Global non-volatile storage manager
GlobalRequest        BYTE,EXTERNAL,DLL(dll_mode),THREAD    ! Exported from a dll, set when a browse calls a form, to let it know action to perform
GlobalResponse       BYTE,EXTERNAL,DLL(dll_mode),THREAD    ! Exported from a dll, set to the response from the form
VCRRequest           LONG,EXTERNAL,DLL(dll_mode),THREAD    ! Exported from a dll, set to the request from the VCR buttons

  CODE
  GlobalErrors.Init(GlobalErrorStatus)
  FuzzyMatcher.Init                                        ! Initilaize the browse 'fuzzy matcher'
  FuzzyMatcher.SetOption(MatchOption:NoCase, 1)            ! Configure case matching
  FuzzyMatcher.SetOption(MatchOption:WordOnly, 0)          ! Configure 'word only' matching
  INIMgr.Init('JMDVoorr.ini', NVD_INI)                     ! Configure INIManager to use INI file
  UD.DebugOff       =  0
  UD.DebugPrefix    =  '!'
  UD.SaveToFile     =  0
  UD.ASCIIFileName  =  'DebugLog.txt'
  UD.SaveToJson     =  0
  UD.JSONFileName   =  'JSONDebugLog.txt'
  UD.DebugNoCR      =  1
  UD.LineWrap       =  0 
  UD.UsePlainFormat =  0
  
                             ! Begin Generated by NetTalk Extension Template
    if ~command ('/netnolog') and (command ('/nettalklog') or command ('/nettalklogerrors') or command ('/neterrors') or command ('/netall'))
      NetDebugTrace ('[Nettalk Template] NetTalk Template version 8.71')
      NetDebugTrace ('[Nettalk Template] NetTalk Template using Clarion ' & 10000)
      NetDebugTrace ('[Nettalk Template] NetTalk Object version ' & NETTALK:VERSION )
      NetDebugTrace ('[Nettalk Template] ABC Template Chain')
    end
                             ! End Generated by Extension Template
    ds_SetOKToEndSessionHandler(address(MyOKToEndSessionHandler))
    ds_SetEndSessionHandler(address(MyEndSessionHandler))
  VoorrStm:Init(GlobalErrors, INIMgr)                      ! Initialise dll (ABC)
  VoorrRpt:Init(GlobalErrors, INIMgr)                      ! Initialise dll (ABC)
  VoorrPln:Init(GlobalErrors, INIMgr)                      ! Initialise dll (ABC)
  VoorrVrd:Init(GlobalErrors, INIMgr)                      ! Initialise dll (ABC)
  MainFrame
  INIMgr.Update
  VoorrStm:Kill()                                          ! Kill dll (ABC)
  VoorrRpt:Kill()                                          ! Kill dll (ABC)
  VoorrPln:Kill()                                          ! Kill dll (ABC)
  VoorrVrd:Kill()                                          ! Kill dll (ABC)
    ThisGPF.RestartProgram = 0
                             ! Begin Generated by NetTalk Extension Template
    NetCloseCallBackWindow() ! Tell NetTalk DLL to shutdown it's WinSock Call Back Window
  
    if ~command ('/netnolog') and (command ('/nettalklog') or command ('/nettalklogerrors') or command ('/neterrors') or command ('/netall'))
      NetDebugTrace ('[Nettalk Template] NetTalk Template version 8.71')
      NetDebugTrace ('[Nettalk Template] NetTalk Template using Clarion ' & 10000)
      NetDebugTrace ('[Nettalk Template] Closing Down NetTalk (Object) version ' & NETTALK:VERSION)
    end
                             ! End Generated by Extension Template
  INIMgr.Kill                                              ! Destroy INI manager
  FuzzyMatcher.Kill                                        ! Destroy fuzzy matcher
    
!----------------------------------------------------
ThisGPF.Construct     PROCEDURE ()
  CODE
!----------------------------------------------------
ThisGPF.Destruct     PROCEDURE ()
  CODE
!----------------------------------------------------
ThisGPF._GetSymbol     PROCEDURE (ulong pAddress,byte pStackTrace=1)
ReturnValue   any
  CODE
  ReturnValue = PARENT._GetSymbol (pAddress,pStackTrace)
    Return ReturnValue
!----------------------------------------------------
ThisGPF._LookupExceptionCode     PROCEDURE (ulong p_ExceptionCode)
ReturnValue   any
  CODE
  ReturnValue = PARENT._LookupExceptionCode (p_ExceptionCode)
    Return ReturnValue
!----------------------------------------------------
ThisGPF._VectoredExceptionHandler_     PROCEDURE (ulong p_e)
ReturnValue   long
  CODE
  ReturnValue = PARENT._VectoredExceptionHandler_ (p_e)
    Return ReturnValue
!----------------------------------------------------
ThisGPF._StackDetails     PROCEDURE (ulong p_e,byte p_details,ulong p_hProcess)
ReturnValue   any
  CODE
  ReturnValue = PARENT._StackDetails (p_e,p_details,p_hProcess)
    Return ReturnValue
!----------------------------------------------------
ThisGPF._LocateDebugSymbols     PROCEDURE (long phModule)
ReturnValue   byte
  CODE
  ReturnValue = PARENT._LocateDebugSymbols (phModule)
    Return ReturnValue
!----------------------------------------------------
ThisGPF._ReadBlockFromFile     PROCEDURE (ulong pOffset,long pReadBytes,*string pFileBlock,*string pFileName)
  CODE
  PARENT._ReadBlockFromFile (pOffset,pReadBytes,pFileBlock,pFileName)
!----------------------------------------------------
ThisGPF._GetModuleName     PROCEDURE (long phModule)
ReturnValue   any
  CODE
  ReturnValue = PARENT._GetModuleName (phModule)
    Return ReturnValue
!----------------------------------------------------
ThisGPF._GetModuleHandle     PROCEDURE (ulong pAddress)
ReturnValue   long
  CODE
  ReturnValue = PARENT._GetModuleHandle (pAddress)
    Return ReturnValue
!----------------------------------------------------
ThisGPF.LookupAddress     PROCEDURE ()
  CODE
  PARENT.LookupAddress ()
!----------------------------------------------------
ThisGPF.Initialize     PROCEDURE ()
  CODE
  ThisGPF.EmailAddress = 'JMD Microbit <har@microbit.nl>'
  ThisGPF.WindowTitle = ''
  ThisGPF.DumpFileName = 'GPFReport.log'
  ThisGPF.AllowEmail = 1
  ThisGPF.DumpFileAppend = 1
  ThisGPF.RestartProgram = 1
  ThisGPF.ShowDetails = 0
  ThisGPF.DebugEmail = 0
  ThisGPF.DebugLogEnabled = 0
  ThisGPF.WaitWinEnabled = 0
  ThisGPF.Workstation = ds_GetWorkstationName()     ! requires winevent ver 3.61 or later
  ThisGPF.UserName = ds_GetUserName()               ! requires winevent ver 3.61 or later
  PARENT.Initialize ()
!----------------------------------------------------
ThisGPF.FilterExceptions     PROCEDURE (ulong pException)
  CODE
  PARENT.FilterExceptions (pException)
!----------------------------------------------------
ThisGPF._EncodeEmail     PROCEDURE (string pEmailText)
ReturnValue   any
  CODE
  ReturnValue = PARENT._EncodeEmail (pEmailText)
    Return ReturnValue
!----------------------------------------------------
ThisGPF._FindFirstBreak     PROCEDURE (string pText,long pMaxLen)
ReturnValue   long
  CODE
  ReturnValue = PARENT._FindFirstBreak (pText,pMaxLen)
    Return ReturnValue
!----------------------------------------------------
ThisGPF.ExtraReportText     PROCEDURE ()
  CODE
  ! ThisGPF.ReportText = 'Add your own report text here.'<13,10>This is on the next line.'
  PARENT.ExtraReportText ()
!----------------------------------------------------
ThisGPF._GetDLLVersion     PROCEDURE (string pDLLName)
ReturnValue   any
  CODE
  ReturnValue = PARENT._GetDLLVersion (pDLLName)
    Return ReturnValue
!----------------------------------------------------
ThisGPF._SetFileNames     PROCEDURE ()
  CODE
  PARENT._SetFileNames ()
!----------------------------------------------------
ThisGPF.DeleteDumpFile     PROCEDURE ()
  CODE
  PARENT.DeleteDumpFile ()
!----------------------------------------------------
ThisGPF._InitReportText     PROCEDURE ()
  CODE
  PARENT._InitReportText ()
!----------------------------------------------------
ThisGPF._ExecuteCommands     PROCEDURE ()
  CODE
  PARENT._ExecuteCommands ()
!----------------------------------------------------
ThisGPF._StackDump     PROCEDURE (long pStart,long pEnd,long pStackLevel)
ReturnValue   any
  CODE
  ReturnValue = PARENT._StackDump (pStart,pEnd,pStackLevel)
    Return ReturnValue
!----------------------------------------------------
ThisGPF._FindLinePosition     PROCEDURE (string pText,long pLineNumber)
ReturnValue   long
  CODE
  ReturnValue = PARENT._FindLinePosition (pText,pLineNumber)
    Return ReturnValue
!----------------------------------------------------
ThisGPF._DebugLog     PROCEDURE (string pDebugData,byte pFirstLine=0)
  CODE
  PARENT._DebugLog (pDebugData,pFirstLine)
!----------------------------------------------------
ThisGPF._FormatLineInfo     PROCEDURE (long pLineNumber,string pProcName,string pSourceName,string pModuleName,byte pStackTrace,byte pNoProcFound,byte pExactAddress,byte pNoLineNumber)
ReturnValue   any
  CODE
  ReturnValue = PARENT._FormatLineInfo (pLineNumber,pProcName,pSourceName,pModuleName,pStackTrace,pNoProcFound,pExactAddress,pNoLineNumber)
    Return ReturnValue
!----------------------------------------------------
ThisGPF._GetAssert     PROCEDURE (long pSP,long pBP)
ReturnValue   long
  CODE
  ReturnValue = PARENT._GetAssert (pSP,pBP)
    Return ReturnValue
!----------------------------------------------------
ThisGPF._GetOtherMessage     PROCEDURE (long pSP,long pBP)
ReturnValue   long
  CODE
  ReturnValue = PARENT._GetOtherMessage (pSP,pBP)
    Return ReturnValue
!----------------------------------------------------
ThisGPF._RestartProgram     PROCEDURE ()
  CODE
  PARENT._RestartProgram ()
NetRefreshPlanningViews PROCEDURE
	CODE
		ThisNetRefresh.Send('|Planning|APlanning|AAPlanning|ViewPlanningPartij|ViewVoorraadPlanning|PlanningInkoop|PlanningVerkoop|PlanningOverboeking|APlanningInkoop|APlanningVerkoop|APlanningOverboeking|Inkoop|AInkoop|Verkoop|AVerkoop|') ! NetTalk (NetRefresh)
	!END
NetRefreshVoorraadViews PROCEDURE
	CODE
		ThisNetRefresh.Send('|Partij|APartij|Mutatie|AMutatie|ViewVoorraadCelTotaal|AViewVoorraadCelTotaal|ViewVoorraadPartij|AViewVoorraadPartij|AAViewVoorraadPartij|AAAViewVoorraadPartij|AAAAViewVoorraadPartij|ViewVoorraadPlanning|VoorraadVerloop|') ! NetTalk (NetRefresh)
	!END
include('VoorraadClassSrc.inc')
include('GlobalClassSrc.inc')
! ------ winevent -------------------------------------------------------------------
MyOKToEndSessionHandler procedure(long pLogoff)
OKToEndSession    long(TRUE)
! Setting the return value OKToEndSession = FALSE
! will tell windows not to shutdown / logoff now.
! If parameter pLogoff = TRUE if the user is logging off.

  code
  return(OKToEndSession)

! ------ winevent -------------------------------------------------------------------
MyEndSessionHandler procedure(long pLogoff)
! If parameter pLogoff = TRUE if the user is logging off.

  code
 
!BOE: DEBUG Global
DebugABCGlobalInformation_Voorraad PROCEDURE()

udpt            UltimateDebugProcedureTracker
                     
  CODE
  
  udpt.Init(UD,'DebugABCGlobalInformation_Voorraad')
  
 
  RETURN

DebugABCGlobalVariables_Voorraad PROCEDURE()

udpt            UltimateDebugProcedureTracker

  CODE
  
  udpt.Init(UD,'DebugABCGlobalVariables_Voorraad')
  
  RETURN
!EOE: DEBUG Global


