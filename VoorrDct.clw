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
FM3:Version           equate('5.42')       !Deprecated - but exists for backward compatibility
FM3:TemplateVersion   equate('5.42')
WINEVENT:Version              equate ('3.97')   !Deprecated
WinEvent:TemplateVersion      equate('3.97')
event:WinEventTaskbarLoadIcon equate(0500h+5510)

   INCLUDE('ABASCII.INC'),ONCE
   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABDOCK.INC'),ONCE
   INCLUDE('ABDROPS.INC'),ONCE
   INCLUDE('ABEIP.INC'),ONCE
   INCLUDE('ABERROR.INC'),ONCE
   INCLUDE('ABFILE.INC'),ONCE
   INCLUDE('ABPOPUP.INC'),ONCE
   INCLUDE('ABPRHTML.INC'),ONCE
   INCLUDE('ABPRPDF.INC'),ONCE
   INCLUDE('ABQUERY.INC'),ONCE
   INCLUDE('ABREPORT.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABTBLSYN.INC'),ONCE
   INCLUDE('ABUTIL.INC'),ONCE
   INCLUDE('ABUSERCONTROL.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE
   INCLUDE('ABWMFPAR.INC'),ONCE
   INCLUDE('ALSUZCLA.INC'),ONCE
   INCLUDE('BCTYPES.INC'),ONCE
   INCLUDE('CSIDLFOLDER.INC'),ONCE
   INCLUDE('CWSYNCWT.INC'),ONCE
   INCLUDE('CLAAWSS3.INC'),ONCE
   INCLUDE('CLAMAIL.INC'),ONCE
   INCLUDE('CLARUNEXT.INC'),ONCE
   INCLUDE('EFOCUS.INC'),ONCE
   INCLUDE('ERRORS.CLW'),ONCE
   INCLUDE('JSON.INC'),ONCE
   INCLUDE('KEYCODES.CLW'),ONCE
   INCLUDE('NETALL.INC'),ONCE
   INCLUDE('NETCRIT.INC'),ONCE
   INCLUDE('NETEMAIL.INC'),ONCE
   INCLUDE('NETIMAP.INC'),ONCE
   INCLUDE('NETSIMP.INC'),ONCE
   INCLUDE('NETSMPPBASE.INC'),ONCE
   INCLUDE('NETTALK.INC'),ONCE
   INCLUDE('NETWSDL.INC'),ONCE
   INCLUDE('NETWEB.INC'),ONCE
   INCLUDE('NETWEBSMS.INC'),ONCE
   INCLUDE('NETWWW.INC'),ONCE
   INCLUDE('QUICKWINTRANSLATOR.INC'),ONCE
   INCLUDE('SPECIALFOLDER.INC'),ONCE
   INCLUDE('SYSTEMSTRING.INC'),ONCE
   INCLUDE('ABBREAK.INC'),ONCE
   INCLUDE('ABCPTHD.INC'),ONCE
   INCLUDE('ABFUZZY.INC'),ONCE
   INCLUDE('ABGRID.INC'),ONCE
   INCLUDE('ABPRNAME.INC'),ONCE
   INCLUDE('ABPRTARG.INC'),ONCE
   INCLUDE('ABPRTARY.INC'),ONCE
   INCLUDE('ABPRTEXT.INC'),ONCE
   INCLUDE('ABPRXML.INC'),ONCE
   INCLUDE('ABQEIP.INC'),ONCE
   INCLUDE('ABRPATMG.INC'),ONCE
   INCLUDE('ABRPPSEL.INC'),ONCE
   INCLUDE('ABRULE.INC'),ONCE
   INCLUDE('ABSQL.INC'),ONCE
   INCLUDE('ABVCRFRM.INC'),ONCE
   INCLUDE('ALSZCLA.INC'),ONCE
   INCLUDE('BARCODE.INC'),ONCE
   INCLUDE('CFILTBASE.INC'),ONCE
   INCLUDE('CFILTERLIST.INC'),ONCE
   INCLUDE('CSTRANSLATOR.INC'),ONCE
   INCLUDE('CTFIELDQ.INC'),ONCE
   INCLUDE('CWSYNCHC.INC'),ONCE
   INCLUDE('MDISYNC.INC'),ONCE
   INCLUDE('NETFTP.INC'),ONCE
   INCLUDE('NETHTTP.INC'),ONCE
   INCLUDE('NETMEM.INC'),ONCE
   INCLUDE('QPROCESS.INC'),ONCE
   INCLUDE('RTFCTL.INC'),ONCE
   INCLUDE('TRIGGER.INC'),ONCE
   INCLUDE('WINEXT.INC'),ONCE
  include('cwsynchc.inc'),once  ! added by NetTalk
 Include('Debuger.INC'),once
  include('StringTheory.Inc'),ONCE
   Include('EventEqu.Clw'),Once

   MAP
     MODULE('VOORRDCT_BC.CLW')
DctInit     PROCEDURE                                      ! Initializes the dictionary definition module
DctKill     PROCEDURE                                      ! Kills the dictionary definition module
     END
!--- Application Global and Exported Procedure Definitions --------------------------------------------
     MODULE('VOORRDCT001.CLW')
MainDCT                PROCEDURE   !
     END
     MODULE('VOORRDCT003.CLW')
ExportInvoiceXML       PROCEDURE(<VER:Record>, <INK:Record>, String layout)   !
PackLijstClassSource   PROCEDURE   !
     END
     INCLUDE('CWUtil.INC')
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
     
     NetRefreshPlanningViews()
     NetRefreshVoorraadViews()
     
     
       include('FM3map.clw')
    ! Declare functions defined in this DLL
VoorrDct:Init          PROCEDURE(<ErrorClass curGlobalErrors>, <INIClass curINIMgr>)
VoorrDct:Kill          PROCEDURE
   END

  include('StringTheory.Inc'),ONCE
GLO:OWNER            CSTRING(199)
GLO:Versie           CSTRING(10)
GLO:BepaalTotaal     LONG,THREAD
GLO:TotaalWegingKG   DECIMAL(10,2),THREAD
GLO:TotaalWegingPallets LONG,THREAD
GLO:WegingQueue2     QUEUE,PRE(GWQ2),THREAD
ID                     LONG
BrutoGewichtKG         DECIMAL(10,2)
Palletsoort            STRING(10)
PalletsoortID          LONG
NettoGewichtKG         DECIMAL(10,2)
Datum                  DATE
Tijd                   TIME
PalletID               LONG
                     END
GLO:WegingQueue      QUEUE,PRE(WGQ),THREAD
BrutoGewichtKG         DECIMAL(10,2)
Palletsoort            STRING(10)
PalletsoortID          LONG
NettoGewichtKG         DECIMAL(10,2)
Datum                  DATE
Tijd                   TIME
PalletID               LONG
                     END
GLO:UitslagMutatieQueue QUEUE,PRE(UMQ),THREAD
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
GLO:OverboekingMutatieQueue QUEUE,PRE(OMQ),THREAD
CelID                  LONG
CelLocatieID           LONG
CelLocatieNaam         CSTRING(51)
CelOms                 CSTRING(51)
KG                     DECIMAL(10,2)
Pallet                 LONG
                     END
GLO:HeaderString     STRING(256),THREAD
GLO:MyWordDoc        CSTRING(20),THREAD
GLO:MyItem           CSTRING(20),THREAD
GLO:Planning_ThreadID LONG
GLO:Overboeking_ThreadID LONG
GLO:Inkoop_ThreadID  LONG
GLO:Verkoop_ThreadID LONG
GLO:Voorraad_ThreadID LONG
GLO:PartijVoorraad_ThreadID LONG
GLO:PalletAdministratie_ThreadID LONG
GLO:Activiteit_ThreadID LONG
GLO:GebruikerLogHandelingOpmerking CSTRING(101),THREAD
GLO:TimingMeting     LONG,DIM(20),THREAD
GLO:UitslagPalletbladPlanningID LONG,THREAD
GLO:UitslagPalletbladArtikelID CSTRING(21),THREAD
GLO:UitslagPalletbladArtikelOms CSTRING(201)
GLO:UitslagPalletbladPartijID LONG,THREAD
GLO:UitslagPalletbladExternVerkoopID STRING(50),THREAD
GLO:UitslagPalletbladDueDate12 DATE,THREAD
GLO:UitslagPalletbladProductionDate11 DATE,THREAD
GLO:UitslagPalletbladSellByDate15 DATE,THREAD
GLO:UitslagPalletbladOriginLiveBird CSTRING(51)
GLO:UitslagPalletbladOriginSlautherHouse CSTRING(51)
GLO:UitslagPalletbladOriginProcessing CSTRING(51)
GLO:UitslagPalletbladOriginPacking CSTRING(51)
GLO:UitslagPalletbladHarvastDate7007 DATE
GLO:IngelogdeGebruiker GROUP,PRE(IGB)
GebruikerID            LONG
WindowsInlog           CSTRING(51)
Werkstation            CSTRING(31)
Administrator          BYTE
BekijkenPrijzen        BYTE
MakenVerkoopMutatie    BYTE
Verwerken              BYTE
                     END
GLO:PartijCelControleQ QUEUE,PRE(PCC),THREAD
PartijID               LONG
CelID                  LONG
KG                     DECIMAL(9,2)
Pallets                LONG
                     END
GLO:HidePlanningInstructie BYTE
LOC:OrigineelPartijCelID STRING(25),DIM(100)
LOC:OrigineelKG      DECIMAL(10,2),DIM(100)
LOC:OrigineelPallets LONG,DIM(100)
LOC:OrigineelArtikelID CSTRING(31)
LOC:AantalOrigineel  LONG
LOC:Ole              LONG
LOC:Bestandsnaam     STRING(200)
LOC:Rij              LONG
LOC:HWND             ULONG
LOC:WindowName       CSTRING(201)
SilentRunning        BYTE(0)                               ! Set true when application is running in 'silent mode'

ThisNetRefresh       class(NetRefresh)              ! Generated by NetTalk Extension (NetRefresh)
                            end
   INCLUDE( 'ALSZCLA.INC' ),ONCE

   INCLUDE( 'ALSUZCLA.INC' ),ONCE

 INCLUDE( 'LSZIP.LIC' ),ONCE
GLO:ViewArtikel_Name      string(255) 
GLO:Partij_Name      string(255) 
GLO:Relatie_Name      string(255) 
GLO:Verpakking_Name      string(255) 
GLO:ViewVoorraadPlanning_Name      string(255) 
GLO:Cel_Name      string(255) 
GLO:Mutatie_Name      string(255) 
GLO:Inkoop_Name      string(255) 
GLO:Planning_Name      string(255) 
GLO:Verkoop_Name      string(255) 
GLO:Sjabloon_Name      string(255) 
GLO:ViewVoorraadCelTotaal_Name      string(255) 
GLO:PlanningInkoop_Name      string(255) 
GLO:PlanningVerkoop_Name      string(255) 
GLO:VoorraadVerloop_Name      string(255) 
GLO:RelatieAdres_Name      string(255) 
GLO:PalletMutatie_Name      string(255) 
GLO:PalletVerloop_Name      string(255) 
GLO:Transporteur_Name      string(255) 
GLO:ViewTransporteur_Name      string(255) 
GLO:ViewVoorraadPartij_Name      string(255) 
GLO:CMR_Name      string(255) 
GLO:ViewPlanningPartij_Name      string(255) 
GLO:OverboekingRit_Name      string(255) 
GLO:OverboekingRitRegel_Name      string(255) 
GLO:BulkOverboeking_Name      string(255) 
GLO:PlanningOverboeking_Name      string(255) 
GLO:DubbeleInslagMutaties_Name      string(255) 
GLO:ArtikelOmschrijvingExtra_Name      string(255) 
GLO:ArtikelOmschrijvingExtraGroep_Name      string(255) 
GLO:PalletSoort_Name      string(255) 
GLO:Weging_Name      string(255) 
GLO:CelLocatie_Name      string(255) 
GLO:Versie_Name      string(255) 
GLO:ViewPartijCelLocaties_Name      string(255) 
GLO:ViewVoorraadPartij_INDEXED_Name      string(255) 
GLO:ViewArtikel_Exact_Name      string(255) 
GLO:Relatie_Exact_Name      string(255) 
GLO:ViewPalletTegoeden_Name      string(255) 
GLO:ViewPlanningPartijTotaal_Name      string(255) 
GLO:ViewVoorraadPartijTotaal_Name      string(255) 
GLO:Gebruiker_Name      string(255) 
GLO:GebruikerLog_Name      string(255) 
GLO:SnelheidLogging_Name      string(255) 
GLO:CelArtikelVoorraad_Name      string(255) 
GLO:PartijCelVoorraad_Name      string(255) 
GLO:Activiteit_Name      string(255) 
GLO:PalletBladSjabloon_Name      string(255) 
GLO:PalletBladSjabloonCountry_Name      string(255) 
GLO:RelatieArtikelOmschrijving_Name      string(255) 
GLO:Pallet_Name      string(255) 
GLO:KostenStamgeg_Name      string(255) 
GLO:ExtraKosten_Name      string(255) 
GLO:ViewBetcd_Name      string(255) 
GLO:DeliveryTerms_Name      string(255) 
GLO:ISOCountries_Name      string(255) 
GLO:SSOPCategorie_Name      string(255) 
GLO:SSOPObject_Name      string(255) 
GLO:SSOPRegistratie_Name      string(255) 
GLO:SSOPTijd_Name      string(255) 
GLO:GNCode_Name      string(255) 
GLO:GNCodeArtikelen_Name      string(255) 
GLO:Havens_Name      string(255) 
GLO:Rapporten_Name      string(255) 
GLO:ARelatie_Name      string(255) 
GLO:APlanning_Name      string(255) 
GLO:AInkoop_Name      string(255) 
GLO:AVerkoop_Name      string(255) 
GLO:AViewArtikel_Name      string(255) 
GLO:AARelatie_Name      string(255) 
GLO:ACel_Name      string(255) 
GLO:AACel_Name      string(255) 
GLO:AViewVoorraadCelTotaal_Name      string(255) 
GLO:AVerpakking_Name      string(255) 
GLO:AAARelatie_Name      string(255) 
GLO:AAAARelatie_Name      string(255) 
GLO:AViewTransporteur_Name      string(255) 
GLO:APalletMutatie_Name      string(255) 
GLO:AAACel_Name      string(255) 
GLO:APalletVerloop_Name      string(255) 
GLO:AViewVoorraadPartij_Name      string(255) 
GLO:AMutatie_Name      string(255) 
GLO:AAViewVoorraadPartij_Name      string(255) 
GLO:AAAViewVoorraadPartij_Name      string(255) 
GLO:APartij_Name      string(255) 
GLO:AAViewArtikel_Name      string(255) 
GLO:AAVerpakking_Name      string(255) 
GLO:AAAAViewVoorraadPartij_Name      string(255) 
GLO:AOverboekingRitRegel_Name      string(255) 
GLO:AAPlanning_Name      string(255) 
GLO:AAPartij_Name      string(255) 
GLO:AAAACel_Name      string(255) 
GLO:AOverboekingRit_Name      string(255) 
GLO:APlanningInkoop_Name      string(255) 
GLO:APlanningOverboeking_Name      string(255) 
GLO:APlanningVerkoop_Name      string(255) 
GLO:APalletSoort_Name      string(255) 
GLO:ACelLocatie_Name      string(255) 
GLO:AACelLocatie_Name      string(255) 
GLO:AAACelLocatie_Name      string(255) 
GLO:AAAACelLocatie_Name      string(255) 
GLO:AViewVoorraadPartij_INDEXED_Name      string(255) 
GLO:AAAViewVoorraadPartij_INDEXED_Name      string(255) 
GLO:AAAAViewVoorraadPartij_INDEXED_Name      string(255) 
GLO:AAViewVoorraadPartij_INDEXED_Name      string(255) 
GLO:AVoorraadVerloop_Name      string(255) 
GLO:AAPlanningVerkoop_Name      string(255) 
GLO:APalletBladSjabloon_Name      string(255) 
GLO:ARelatieArtikelOmschrijving_Name      string(255) 
GLO:AAViewTransporteur_Name      string(255) 
!region File Declaration
ViewArtikel          FILE,DRIVER('MSSQL','/BUSYHANDLING=2'),OWNER(GLO:Owner),NAME('dbo.Artikel_SyncExact'),PRE(Art),BINDABLE,THREAD !                     
Artikel_PK               KEY(Art:ArtikelID)                !                     
Artikel_FK01             KEY(Art:ArtikelOms),DUP,NOCASE    !                     
Record                   RECORD,PRE()
ArtikelID                   CSTRING(31)                    !                     
ArtikelOms                  CSTRING(61)                    !                     
ArtikelGroep                LONG                           !                     
Prijs                       SREAL                          !                     
                         END
                     END                       

Partij               FILE,DRIVER('MSSQL','/BUSYHANDLING=2'),OWNER(Glo:OWNER),NAME('dbo.Partij'),PRE(Par),BINDABLE,THREAD !                     
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

Relatie              FILE,DRIVER('MSSQL','/BUSYHANDLING=2'),OWNER(GLO:Owner),NAME('dbo.Relatie_SyncExact'),PRE(Rel),BINDABLE,THREAD !                     
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

Verpakking           FILE,DRIVER('MSSQL','/BUSYHANDLING=2'),OWNER(Glo:OWNER),NAME('dbo.Verpakking'),PRE(Ver),BINDABLE,THREAD !                     
Verpakking_PK            KEY(Ver:VerpakkingID)             !                     
Record                   RECORD,PRE()
VerpakkingID                LONG                           !                     
VerpakkingOmschrijving      CSTRING(51)                    !                     
Description                 CSTRING(51)                    !                     
InhoudKG                    DECIMAL(7,3)                   !                     
                         END
                     END                       

ViewVoorraadPlanning FILE,DRIVER('MSSQL','/BUSYHANDLING=2'),OWNER(GLO:owner),NAME('dbo.ViewVoorraadPlanning'),PRE(VVP),BINDABLE,THREAD !                     
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

Cel                  FILE,DRIVER('MSSQL','/BUSYHANDLING=2'),OWNER(GLO:Owner),NAME('dbo.Cel'),PRE(CEL),BINDABLE,THREAD !                     
CEL_PK                   KEY(CEL:CelID),NOCASE,PRIMARY     !                     
Record                   RECORD,PRE()
CelID                       LONG                           !                     
CelOms                      CSTRING(51)                    !                     
Breedte                     LONG                           !                     
Lengte                      LONG                           !                     
                         END
                     END                       

Mutatie              FILE,DRIVER('MSSQL','/BUSYHANDLING=2'),OWNER(GLO:OWNER),NAME('dbo.Mutatie'),PRE(Mut),BINDABLE,THREAD !                     
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

Inkoop               FILE,DRIVER('MSSQL','/BUSYHANDLING=2'),OWNER(GLO:Owner),NAME('dbo.Inkoop'),PRE(Ink),BINDABLE,THREAD !                     
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

Planning             FILE,DRIVER('MSSQL','/BUSYHANDLING=2'),OWNER(GLO:Owner),NAME('dbo.Planning'),PRE(Pla),BINDABLE,THREAD !                     
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

Verkoop              FILE,DRIVER('MSSQL','/BUSYHANDLING=2'),OWNER(GLO:Owner),NAME('dbo.Verkoop'),PRE(Ver2),BINDABLE,THREAD !                     
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

Sjabloon             FILE,DRIVER('MSSQL','/BUSYHANDLING=2'),OWNER(GLO:Owner),NAME('dbo.Sjabloon'),PRE(Sja),BINDABLE,THREAD ! Word sjablonen      
Sjabloon_PK              KEY(Sja:SjabloonID),NOCASE,PRIMARY !                     
Record                   RECORD,PRE()
SjabloonID                  CSTRING(20)                    !                     
Bestandsnaam                CSTRING(99)                    !                     
SoortSjabloon               STRING(1)                      !                     
SoortData                   CSTRING(51)                    !                     
                         END
                     END                       

ViewVoorraadCelTotaal FILE,DRIVER('MSSQL','/BUSYHANDLING=2'),OWNER(GLO:OWNER),NAME('dbo.ViewVoorraadCelTotaal'),PRE(VVCT),BINDABLE,THREAD !                     
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

PlanningInkoop       FILE,DRIVER('MSSQL','/BUSYHANDLING=2'),OWNER(GLO:Owner),NAME('dbo.PlanningInkoop'),PRE(Pla2),BINDABLE,THREAD !                     
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

PlanningVerkoop      FILE,DRIVER('MSSQL','/BUSYHANDLING=2'),OWNER(GLO:Owner),NAME('dbo.PlanningVerkoop'),PRE(Pla3),BINDABLE,THREAD !                     
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

VoorraadVerloop      FILE,DRIVER('MSSQL','/BUSYHANDLING=2'),OWNER(GLO:owner),NAME('dbo.VoorraadVerloop'),PRE(VVL),BINDABLE,THREAD !                     
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

RelatieAdres         FILE,DRIVER('MSSQL','/BUSYHANDLING=2'),OWNER(Glo:OWNER),NAME('dbo.RelatieAdres'),PRE(RAD),BINDABLE,THREAD !                     
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

PalletMutatie        FILE,DRIVER('MSSQL','/BUSYHANDLING=2'),OWNER(Glo:OWNER),NAME('dbo.PalletMutatie'),PRE(Pal),BINDABLE,THREAD !                     
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

PalletVerloop        FILE,DRIVER('MSSQL','/BUSYHANDLING=2'),OWNER(Glo:Owner),NAME('dbo.PalletVerloop'),PRE(Pal3),BINDABLE,THREAD !                     
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

Transporteur         FILE,DRIVER('MSSQL','/BUSYHANDLING=2'),OWNER(Glo:OWNER),NAME('dbo.Transporteur'),PRE(Tra),BINDABLE,THREAD !                     
Transporteur_FK          KEY(Tra:RelatieID,Tra:TransporteurID),DUP,NOCASE ! Op RelatieID/TransporteurID
PK_Transporteur          KEY(Tra:TransporteurID),PRIMARY   !                     
Record                   RECORD,PRE()
TransporteurID              LONG                           !                     
RelatieID                   LONG                           !                     
                         END
                     END                       

ViewTransporteur     FILE,DRIVER('MSSQL','/BUSYHANDLING=2'),OWNER(Glo:OWNER),NAME('dbo.ViewTransporteur'),PRE(VTRA),BINDABLE,THREAD !                     
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

ViewVoorraadPartij   FILE,DRIVER('MSSQL','/BUSYHANDLING=2'),OWNER(Glo:Owner),NAME('dbo.ViewVoorraadPartij'),PRE(VVPar),BINDABLE,THREAD !                     
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

CMR                  FILE,DRIVER('MSSQL','/BUSYHANDLING=2'),OWNER(GLO:Owner),NAME('dbo.CMR'),PRE(CMR),BINDABLE,THREAD !                     
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
                         END
                     END                       

ViewPlanningPartij   FILE,DRIVER('MSSQL','/BUSYHANDLING=2'),OWNER(Glo:Owner),NAME('dbo.ViewPlanningPartij'),PRE(VPPar),BINDABLE,THREAD !                     
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

OverboekingRit       FILE,DRIVER('MSSQL','/BUSYHANDLING=2'),OWNER(Glo:Owner),NAME('dbo.OverboekingRit'),PRE(OR),BINDABLE,THREAD !                     
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

OverboekingRitRegel  FILE,DRIVER('MSSQL','/BUSYHANDLING=2'),OWNER(Glo:Owner),NAME('dbo.OverboekingRitRegel'),PRE(ORR),BINDABLE,THREAD !                     
PK_OverboekingRitRegel   KEY(ORR:OverboekingRitRegelID),PRIMARY !                     
FK_OverboekingRitRegel   KEY(ORR:OverboekingRitID,ORR:OverboekingRitRegelID),DUP !                     
FK2_OverboekingRitRegel  KEY(ORR:PlanningID,ORR:OverboekingRitRegelID),DUP,NOCASE !                     
Record                   RECORD,PRE()
OverboekingRitRegelID       LONG                           !                     
OverboekingRitID            LONG                           !                     
PlanningID                  LONG                           !                     
                         END
                     END                       

BulkOverboeking      FILE,DRIVER('MSSQL','/BUSYHANDLING=2'),OWNER(GLO:OWNER),NAME('dbo.BulkOverboeking'),PRE(BOV),BINDABLE,THREAD ! BulkOverboeking     
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

PlanningOverboeking  FILE,DRIVER('MSSQL','/BUSYHANDLING=2'),OWNER(Glo:OWNER),NAME('dbo.PlanningOverboeking'),PRE(Pla4),BINDABLE,THREAD !                     
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

DubbeleInslagMutaties FILE,DRIVER('MSSQL','/BUSYHANDLING=2'),OWNER(Glo:OWNER),NAME('dbo.DubbeleInslagMutaties'),PRE(Dub),BINDABLE,THREAD !                     
Partij_CelID_K           KEY(Dub:PartijID,Dub:CelID),DUP,NOCASE !                     
Record                   RECORD,PRE()
PartijID                    LONG                           !                     
CelID                       LONG                           !                     
AantalInslagen              LONG                           !                     
                         END
                     END                       

ArtikelOmschrijvingExtra FILE,DRIVER('MSSQL','/BUSYHANDLING=2'),OWNER(GLO:Owner),NAME('dbo.ArtikelOmschrijvingExtra'),PRE(Art2),BINDABLE,THREAD !                     
PK_ArtikelOmschrijvingExtra KEY(Art2:ex_artcode,Art2:artcode),DUP,NOCASE ! Op ex_artcode / artcode
Record                   RECORD,PRE()
ID                          LONG                           !                     
ex_artcode                  STRING(2),NAME('"ex_artcode"') !                     
artcode                     STRING(30)                     !                     
tekst                       STRING(160)                    !                     
                         END
                     END                       

ArtikelOmschrijvingExtraGroep FILE,DRIVER('MSSQL','/BUSYHANDLING=2'),OWNER(GLO:Owner),NAME('dbo.ArtikelOmschrijvingExtraGroep'),PRE(Art3),BINDABLE,THREAD !                     
PK_ArtikelOmschrijvingExtraGroep KEY(Art3:ID),DUP,NOCASE   !                     
FK_ArtikelOmschrijvingExtraGroep KEY(Art3:ex_artcode,Art3:ID),DUP,NOCASE !                     
Record                   RECORD,PRE()
ID                          LONG                           !                     
ex_artcode                  STRING(2),NAME('"ex_artcode"') !                     
Omschrijving                CSTRING(21)                    !                     
                         END
                     END                       

PalletSoort          FILE,DRIVER('MSSQL','/BUSYHANDLING=2'),OWNER(GLO:Owner),NAME('dbo.PalletSoort'),PRE(PalSrt),BINDABLE,THREAD !                     
PK_PalletSoort           KEY(PalSrt:PalletSoortID),PRIMARY !                     
FK_PalletSoort           KEY(PalSrt:PalletOmschrijving,PalSrt:PalletSoortID),NOCASE ! Op PalletOmschrijving/PalletSoortID
Record                   RECORD,PRE()
PalletSoortID               LONG                           !                     
PalletOmschrijving          CSTRING(11)                    !                     
Tarra                       DECIMAL(18,2)                  !                     
                         END
                     END                       

Weging               FILE,DRIVER('MSSQL','/BUSYHANDLING=2'),OWNER(GLO:Owner),NAME('dbo.Weging'),PRE(Weg),BINDABLE,THREAD !                     
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
                         END
                     END                       

CelLocatie           FILE,DRIVER('MSSQL','/BUSYHANDLING=2'),OWNER(GLO:Owner),NAME('dbo.CelLocatie'),PRE(CL),BINDABLE,THREAD !                     
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

Versie               FILE,DRIVER('MSSQL','/BUSYHANDLING=2'),OWNER(GLO:OWNER),NAME('dbo.Versie'),PRE(VRS),BINDABLE,THREAD !                     
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

ViewPartijCelLocaties FILE,DRIVER('MSSQL','/BUSYHANDLING=2'),OWNER(Glo:Owner),NAME('dbo.ViewPartijCelLocaties'),PRE(VPCL),BINDABLE,THREAD !                     
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

ViewVoorraadPartij_INDEXED FILE,DRIVER('MSSQL','/BUSYHANDLING=2'),OWNER(Glo:Owner),NAME('dbo.ViewVoorraadPartij_INDEXED'),PRE(VVParI),BINDABLE,THREAD !                     
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

ViewArtikel_Exact    FILE,DRIVER('MSSQL','/BUSYHANDLING=2'),OWNER(GLO:Owner),NAME('dbo.ViewArtikel'),PRE(ARTE),BINDABLE,THREAD !                     
Artikel_PK               KEY(ARTE:ArtikelID)               !                     
Artikel_FK01             KEY(ARTE:ArtikelOms),DUP,NOCASE   !                     
Record                   RECORD,PRE()
ArtikelID                   CSTRING(31)                    !                     
ArtikelOms                  CSTRING(61)                    !                     
ArtikelGroep                LONG                           !                     
Prijs                       SREAL                          !                     
                         END
                     END                       

Relatie_Exact        FILE,DRIVER('MSSQL','/BUSYHANDLING=2'),OWNER(GLO:Owner),NAME('dbo.ViewRelatie'),PRE(RelE),BINDABLE,THREAD !                     
Relatie_FK01             KEY(RelE:FirmaNaam),DUP,NOCASE    !                     
Relatie_PK               KEY(RelE:RelatieID)               !                     
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
Code                        STRING(20)                     !                     
CreditLine                  REAL                           !                     
Acc_Man                     LONG                           !                     
VatCode                     STRING(3)                      !                     
cmp_fctry                   STRING(3)                      !                     
                         END
                     END                       

ViewPalletTegoeden   FILE,DRIVER('MSSQL','/BUSYHANDLING=2'),OWNER(GLO:Owner),NAME('dbo.ViewPalletTegoeden'),PRE(PTG),BINDABLE,THREAD !                     
ViewPalletTegoeden_PK    KEY(PTG:PalletSoortID,PTG:RelatieID,PTG:Transporteur),NOCASE,PRIMARY !                     
Record                   RECORD,PRE()
RelatieID                   LONG                           !                     
Transporteur                BYTE                           !                     
PalletSoortID               LONG                           !                     
Inkomend                    LONG                           !                     
Uitgaand                    LONG                           !                     
                         END
                     END                       

ViewPlanningPartijTotaal FILE,DRIVER('MSSQL'),OWNER(GLO:Owner),NAME('dbo.ViewPlanningPartijTotaal'),PRE(VPParT),BINDABLE,THREAD !                     
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

ViewVoorraadPartijTotaal FILE,DRIVER('MSSQL','/BUSYHANDLING=2'),OWNER(GLO:Owner),NAME('dbo.ViewVoorraadPartijTotaal'),PRE(VVParT),BINDABLE,THREAD !                     
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

Gebruiker            FILE,DRIVER('MSSQL','/BUSYHANDLING=2'),OWNER(GLO:Owner),NAME('dbo.Gebruiker'),PRE(Geb),BINDABLE,THREAD !                     
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
                         END
                     END                       

GebruikerLog         FILE,DRIVER('MSSQL','/BUSYHANDLING=2'),OWNER(GLO:Owner),NAME('dbo.GebruikerLog'),PRE(Log),BINDABLE,THREAD !                     
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

SnelheidLogging      FILE,DRIVER('MSSQL','/BUSYHANDLING=2'),OWNER(GLO:Owner),NAME('dbo.SnelheidLogging'),PRE(Sne),BINDABLE,THREAD !                     
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

CelArtikelVoorraad   FILE,DRIVER('MSSQL','/BUSYHANDLING=2'),OWNER(GLO:Owner),NAME('dbo.CelArtikelVoorraad'),PRE(CAV),BINDABLE,THREAD !                     
PK_CelArtikelVoorraad    KEY(CAV:CelArtikelVoorraadID),PRIMARY !                     
FK1_CelArtikelVoorraad   KEY(CAV:CelID,CAV:ArtikelID)      ! Op CelID / ArtikelID
FK2_CelArtikelVoorraad   KEY(CAV:ArtikelID,CAV:CelID)      ! Op ArtikelID / CelID
FK3_CelArtikelVoorraad   KEY(CAV:CelID,CAV:ArtikelOms),DUP,NOCASE ! Op CelID / ArtikelOms
Record                   RECORD,PRE()
CelArtikelVoorraadID        DECIMAL(19)                    !                     
CelID                       LONG                           !                     
ArtikelID                   CSTRING(41)                    !                     
InslagKG                    LONG                           !                     
UitslagKG                   LONG                           !                     
VoorraadKG                  LONG                           !                     
InslagPallets               LONG                           !                     
UitslagPallets              LONG                           !                     
VoorraadPallets             LONG                           !                     
ArtikelOms                  CSTRING(61)                    !                     
                         END
                     END                       

PartijCelVoorraad    FILE,DRIVER('MSSQL'),OWNER(GLO:Owner),NAME('dbo.PartijCelVoorraad'),PRE(PCV),BINDABLE,THREAD !                     
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

Activiteit           FILE,DRIVER('MSSQL','/BUSYHANDLING=2'),OWNER(GLO:Owner),NAME('dbo.Activiteit'),PRE(ACT),BINDABLE,THREAD !                     
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

PalletBladSjabloon   FILE,DRIVER('MSSQL','/BUSYHANDLING=2'),OWNER(Glo:OWNER),NAME('dbo.PalletBladSjabloon'),PRE(PBS),BINDABLE,THREAD !                     
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

PalletBladSjabloonCountry FILE,DRIVER('MSSQL','/BUSYHANDLING=2'),OWNER(Glo:OWNER),NAME('dbo.PalletBladSjabloonCountry'),PRE(PBSC),BINDABLE,THREAD !                     
PK_PalletBladSjabloonCountry KEY(PBSC:PalletBladSjabloonCountryID),PRIMARY !                     
FK1_PalletBladSjabloonCountry KEY(PBSC:PalletBladSjabloonID,PBSC:Country),DUP !                     
FK2_PalletBladSjabloonCountry KEY(PBSC:Country,PBSC:PalletBladSjabloonID),DUP,NOCASE !                     
Record                   RECORD,PRE()
PalletBladSjabloonCountryID LONG                           !                     
PalletBladSjabloonID        LONG                           !                     
Country                     CSTRING(61)                    !                     
                         END
                     END                       

RelatieArtikelOmschrijving FILE,DRIVER('MSSQL','/BUSYHANDLING=2'),OWNER(GLO:Owner),NAME('dbo.RelatieArtikelOmschrijving'),PRE(RAO),BINDABLE,THREAD !                     
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

Pallet               FILE,DRIVER('MSSQL','/BUSYHANDLING=2'),OWNER(GLO:Owner),NAME('dbo.Pallet'),PRE(PLL),BINDABLE,THREAD !                     
PK_Pallet                KEY(PLL:PalletID),PRIMARY         !                     
Record                   RECORD,PRE()
PalletID                    LONG                           !                     
Dummy                       STRING(1)                      !                     
                         END
                     END                       

KostenStamgeg        FILE,DRIVER('MSSQL','/BUSYHANDLING=2'),OWNER(GLO:Owner),NAME('dbo.KostenStamgeg'),PRE(Kos),BINDABLE,THREAD !                     
PK_KostenStamgeg         KEY(Kos:KostenID),PRIMARY         !                     
Record                   RECORD,PRE()
KostenID                    LONG                           !                     
Omschrijving                CSTRING(61)                    !                     
Soort                       STRING(1)                      !                     
Prijs                       DECIMAL(11,3)                  !                     
                         END
                     END                       

ExtraKosten          FILE,DRIVER('MSSQL','/BUSYHANDLING=2'),OWNER(GLO:Owner),NAME('dbo.ExtraKosten'),PRE(Ext),BINDABLE,THREAD !                     
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

ViewBetcd            FILE,DRIVER('MSSQL','/BUSYHANDLING=2'),OWNER(GLO:Owner),NAME('dbo.ViewBetcd'),PRE(BTC),BINDABLE,THREAD ! Betalingscondities  
ViewBetcd_PK             KEY(BTC:betcdID),NOCASE,PRIMARY   ! Op betcdID          
Record                   RECORD,PRE()
betcdID                     STRING(20)                     !                     
Omschrijving                CSTRING(31)                    !                     
Description                 CSTRING(31)                    !                     
                         END
                     END                       

DeliveryTerms        FILE,DRIVER('MSSQL','/BUSYHANDLING=2'),OWNER(Glo:OWNER),NAME('dbo.DeliveryTerms'),PRE(DLT),BINDABLE,THREAD !                     
PK_DeliveryTerms         KEY(DLT:DeliveryTermsID),PRIMARY  !                     
Record                   RECORD,PRE()
DeliveryTermsID             LONG                           !                     
Omschrijving                CSTRING(61)                    !                     
                         END
                     END                       

ISOCountries         FILE,DRIVER('MSSQL','/BUSYHANDLING=2'),OWNER(GLO:Owner),NAME('dbo.ISOCountries'),PRE(ISO),BINDABLE,THREAD !                     
PK_ISOCountries          KEY(ISO:ISCode),PRIMARY           !                     
Record                   RECORD,PRE()
ISCode                      CSTRING(3)                     !                     
ISNummer                    LONG                           !                     
Country                     CSTRING(61)                    !                     
                         END
                     END                       

SSOPCategorie        FILE,DRIVER('MSSQL'),OWNER(GLO:Owner),NAME('dbo.SSOPCategorie'),PRE(SCat),BINDABLE,THREAD !                     
SSOPCategorie_PK         KEY(SCat:CategorieID),PRIMARY     !                     
Record                   RECORD,PRE()
CategorieID                 LONG                           !                     
Omschrijving                CSTRING(101)                   !                     
                         END
                     END                       

SSOPObject           FILE,DRIVER('MSSQL'),OWNER(GLO:Owner),NAME('dbo.SSOPObject'),PRE(SObj),BINDABLE,THREAD !                     
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

SSOPRegistratie      FILE,DRIVER('MSSQL'),OWNER(GLO:Owner),NAME('dbo.SSOPRegistratie'),PRE(SReg),BINDABLE,THREAD !                     
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

SSOPTijd             FILE,DRIVER('MSSQL'),OWNER(GLO:Owner),NAME('dbo.SSOPTijd'),PRE(STijd),BINDABLE,THREAD !                     
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

GNCode               FILE,DRIVER('MSSQL','/BUSYHANDLING=2'),OWNER(GLO:Owner),NAME('dbo.GNCode'),PRE(GNC),BINDABLE,THREAD !                     
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

GNCodeArtikelen      FILE,DRIVER('MSSQL','/BUSYHANDLING=2'),OWNER(GLO:Owner),NAME('dbo.GNCodeArtikelen'),PRE(GNA),BINDABLE,THREAD !                     
GNCodeArtikelen_PK       KEY(GNA:GNCode,GNA:ArtikelID),PRIMARY !                     
GNCodeArtikelen_FK1      KEY(GNA:ArtikelID)                !                     
Record                   RECORD,PRE()
GNCode                      CSTRING(21)                    !                     
ArtikelID                   CSTRING(31)                    !                     
                         END
                     END                       

Havens               FILE,DRIVER('MSSQL','/BUSYHANDLING=2'),OWNER(GLO:Owner),NAME('dbo.Havens'),PRE(Hav),BINDABLE,THREAD !                     
Haven_PK                 KEY(Hav:Haven),PRIMARY            !                     
Record                   RECORD,PRE()
Haven                       CSTRING(51)                    !                     
                         END
                     END                       

Rapporten            FILE,DRIVER('MSSQL','/BUSYHANDLING=2'),OWNER(GLO:Owner),NAME('dbo.Rapporten'),PRE(Rap),BINDABLE,THREAD !                     
Rapporten_PK             KEY(Rap:RapportID),PRIMARY        !                     
Record                   RECORD,PRE()
RapportID                   LONG                           !                     
Onderwerp                   CSTRING(51)                    !                     
Titel                       CSTRING(51)                    !                     
Emails                      CSTRING(1001)                  !                     
Maandag                     BYTE                           !                     
Dinsdag                     BYTE                           !                     
Woensdag                    BYTE                           !                     
Donderdag                   BYTE                           !                     
Vrijdag                     BYTE                           !                     
Zaterdag                    BYTE                           !                     
Zondag                      BYTE                           !                     
LstExecution                STRING(8)                      !                     
LstExecution_GROUP          GROUP,OVER(LstExecution)       !                     
LstExecution_DATE             DATE                         !                     
LstExecution_TIME             TIME                         !                     
                            END                            !                     
LstResponse                 CSTRING(65535)                 !                     
RapportSource               CSTRING(51)                    !                     
                         END
                     END                       

ARelatie             FILE,DRIVER('MSSQL','/BUSYHANDLING=2'),OWNER(GLO:Owner),NAME('dbo.Relatie_SyncExact'),PRE(AREL),BINDABLE,THREAD !                     
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

APlanning            FILE,DRIVER('MSSQL','/BUSYHANDLING=2'),OWNER(GLO:Owner),NAME('dbo.Planning'),PRE(APla),BINDABLE,THREAD !                     
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

AInkoop              FILE,DRIVER('MSSQL','/BUSYHANDLING=2'),OWNER(GLO:Owner),NAME('dbo.Inkoop'),PRE(AInk),BINDABLE,THREAD !                     
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
                         END
                     END                       

AVerkoop             FILE,DRIVER('MSSQL','/BUSYHANDLING=2'),OWNER(GLO:Owner),NAME('dbo.Verkoop'),PRE(AVE),BINDABLE,THREAD !                     
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

AViewArtikel         FILE,DRIVER('MSSQL','/BUSYHANDLING=2'),OWNER(GLO:Owner),NAME('dbo.Artikel_SyncExact'),PRE(AArt),BINDABLE,THREAD !                     
Artikel_PK               KEY(AArt:ArtikelID)               !                     
Artikel_FK01             KEY(AArt:ArtikelOms),DUP,NOCASE   !                     
Record                   RECORD,PRE()
ArtikelID                   CSTRING(31)                    !                     
ArtikelOms                  CSTRING(61)                    !                     
ArtikelGroep                LONG                           !                     
Prijs                       SREAL                          !                     
                         END
                     END                       

AARelatie            FILE,DRIVER('MSSQL','/BUSYHANDLING=2'),OWNER(GLO:Owner),NAME('dbo.Relatie_SyncExact'),PRE(AARel),BINDABLE,THREAD !                     
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

ACel                 FILE,DRIVER('MSSQL','/BUSYHANDLING=2'),OWNER(GLO:Owner),NAME('dbo.Cel'),PRE(ACel),BINDABLE,THREAD !                     
CEL_PK                   KEY(ACel:CelID),NOCASE,PRIMARY    !                     
Record                   RECORD,PRE()
CelID                       LONG                           !                     
CelOms                      CSTRING(51)                    !                     
Breedte                     LONG                           !                     
Lengte                      LONG                           !                     
                         END
                     END                       

AACel                FILE,DRIVER('MSSQL','/BUSYHANDLING=2'),OWNER(GLO:Owner),NAME('dbo.Cel'),PRE(AACel),BINDABLE,THREAD !                     
CEL_PK                   KEY(AACel:CelID),NOCASE,PRIMARY   !                     
Record                   RECORD,PRE()
CelID                       LONG                           !                     
CelOms                      CSTRING(51)                    !                     
Breedte                     LONG                           !                     
Lengte                      LONG                           !                     
                         END
                     END                       

AViewVoorraadCelTotaal FILE,DRIVER('MSSQL','/BUSYHANDLING=2'),OWNER(GLO:OWNER),NAME('dbo.ViewVoorraadCelTotaal'),PRE(AVVCT),BINDABLE,THREAD !                     
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

AVerpakking          FILE,DRIVER('MSSQL','/BUSYHANDLING=2'),OWNER(Glo:OWNER),NAME('dbo.Verpakking'),PRE(AVP),BINDABLE,THREAD !                     
Verpakking_PK            KEY(AVP:VerpakkingID)             !                     
Record                   RECORD,PRE()
VerpakkingID                LONG                           !                     
VerpakkingOmschrijving      CSTRING(51)                    !                     
Description                 CSTRING(51)                    !                     
InhoudKG                    DECIMAL(7,3)                   !                     
                         END
                     END                       

AAARelatie           FILE,DRIVER('MSSQL','/BUSYHANDLING=2'),OWNER(GLO:Owner),NAME('dbo.Relatie_SyncExact'),PRE(AAARel),BINDABLE,THREAD !                     
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

AAAARelatie          FILE,DRIVER('MSSQL','/BUSYHANDLING=2'),OWNER(GLO:Owner),NAME('dbo.Relatie_SyncExact'),PRE(AAAARelatie),BINDABLE,THREAD !                     
Relatie_FK02             KEY(AAAARelatie:Country),DUP,NOCASE,OPT !                     
Relatie_FK01             KEY(AAAARelatie:FirmaNaam),DUP    !                     
Relatie_PK               KEY(AAAARelatie:RelatieID)        !                     
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

AViewTransporteur    FILE,DRIVER('MSSQL','/BUSYHANDLING=2'),OWNER(Glo:OWNER),NAME('dbo.ViewTransporteur'),PRE(AVTRA),BINDABLE,THREAD !                     
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

APalletMutatie       FILE,DRIVER('MSSQL','/BUSYHANDLING=2'),OWNER(Glo:OWNER),NAME('dbo.PalletMutatie'),PRE(APM),BINDABLE,THREAD !                     
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

AAACel               FILE,DRIVER('MSSQL','/BUSYHANDLING=2'),OWNER(GLO:Owner),NAME('dbo.Cel'),PRE(AAACel),BINDABLE,THREAD !                     
CEL_PK                   KEY(AAACel:CelID),NOCASE,PRIMARY  !                     
Record                   RECORD,PRE()
CelID                       LONG                           !                     
CelOms                      CSTRING(51)                    !                     
Breedte                     LONG                           !                     
Lengte                      LONG                           !                     
                         END
                     END                       

APalletVerloop       FILE,DRIVER('MSSQL','/BUSYHANDLING=2'),OWNER(Glo:Owner),NAME('dbo.PalletVerloop'),PRE(APal3),BINDABLE,THREAD !                     
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

AViewVoorraadPartij  FILE,DRIVER('MSSQL','/BUSYHANDLING=2'),OWNER(Glo:Owner),NAME('dbo.ViewVoorraadPartij'),PRE(AVVPar),BINDABLE,THREAD !                     
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
                         END
                     END                       

AMutatie             FILE,DRIVER('MSSQL','/BUSYHANDLING=2'),OWNER(GLO:OWNER),NAME('dbo.Mutatie'),PRE(AMut),BINDABLE,THREAD !                     
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

AAViewVoorraadPartij FILE,DRIVER('MSSQL','/BUSYHANDLING=2'),OWNER(Glo:Owner),NAME('dbo.ViewVoorraadPartij'),PRE(AAVVPar),BINDABLE,THREAD !                     
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
                         END
                     END                       

AAAViewVoorraadPartij FILE,DRIVER('MSSQL','/BUSYHANDLING=2'),OWNER(Glo:Owner),NAME('dbo.ViewVoorraadPartij'),PRE(AAAVVPar),BINDABLE,THREAD !                     
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
                         END
                     END                       

APartij              FILE,DRIVER('MSSQL','/BUSYHANDLING=2'),OWNER(Glo:OWNER),NAME('dbo.Partij'),PRE(APar),BINDABLE,THREAD !                     
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

AAViewArtikel        FILE,DRIVER('MSSQL','/BUSYHANDLING=2'),OWNER(GLO:Owner),NAME('dbo.Artikel_SyncExact'),PRE(AAArt),BINDABLE,THREAD !                     
Artikel_PK               KEY(AAArt:ArtikelID)              !                     
Artikel_FK01             KEY(AAArt:ArtikelOms),DUP,NOCASE  !                     
Record                   RECORD,PRE()
ArtikelID                   CSTRING(31)                    !                     
ArtikelOms                  CSTRING(61)                    !                     
ArtikelGroep                LONG                           !                     
Prijs                       SREAL                          !                     
                         END
                     END                       

AAVerpakking         FILE,DRIVER('MSSQL','/BUSYHANDLING=2'),OWNER(Glo:OWNER),NAME('dbo.Verpakking'),PRE(AAVer),BINDABLE,THREAD !                     
Verpakking_PK            KEY(AAVer:VerpakkingID)           !                     
Record                   RECORD,PRE()
VerpakkingID                LONG                           !                     
VerpakkingOmschrijving      CSTRING(51)                    !                     
Description                 CSTRING(51)                    !                     
InhoudKG                    DECIMAL(7,3)                   !                     
                         END
                     END                       

AAAAViewVoorraadPartij FILE,DRIVER('MSSQL','/BUSYHANDLING=2'),OWNER(Glo:Owner),NAME('dbo.ViewVoorraadPartij'),PRE(AAAAVVPar),BINDABLE,THREAD !                     
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
                         END
                     END                       

AOverboekingRitRegel FILE,DRIVER('MSSQL','/BUSYHANDLING=2'),OWNER(Glo:Owner),NAME('dbo.OverboekingRitRegel'),PRE(AORR),BINDABLE,THREAD !                     
PK_OverboekingRitRegel   KEY(AORR:OverboekingRitRegelID),PRIMARY !                     
FK_OverboekingRitRegel   KEY(AORR:OverboekingRitID,AORR:OverboekingRitRegelID),DUP !                     
FK2_OverboekingRitRegel  KEY(AORR:PlanningID,AORR:OverboekingRitRegelID),DUP,NOCASE !                     
Record                   RECORD,PRE()
OverboekingRitRegelID       LONG                           !                     
OverboekingRitID            LONG                           !                     
PlanningID                  LONG                           !                     
                         END
                     END                       

AAPlanning           FILE,DRIVER('MSSQL','/BUSYHANDLING=2'),OWNER(GLO:Owner),NAME('dbo.Planning'),PRE(AAPla),BINDABLE,THREAD !                     
Datum_Tijd_K             KEY(AAPla:Planning,AAPla:PlanningID),DUP !                     
OverboekingCelID_Planning_K KEY(AAPla:OverboekingCelID,AAPla:Planning,AAPla:PlanningID),DUP !                     
PK_Planning              KEY(AAPla:PlanningID),PRIMARY     !                     
Planning_FK01            KEY(AAPla:InkoopID,AAPla:PlanningID),DUP,NOCASE ! Op InkoopID/Planning
Planning_FK02            KEY(AAPla:VerkoopID,AAPla:PlanningID),DUP ! Op VerkoopID. PlanningID
Planning_FK03            KEY(AAPla:Planning),DUP           ! Op Planning         
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

AAPartij             FILE,DRIVER('MSSQL','/BUSYHANDLING=2'),OWNER(Glo:OWNER),NAME('dbo.Partij'),PRE(AAPar),BINDABLE,THREAD !                     
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

AAAACel              FILE,DRIVER('MSSQL','/BUSYHANDLING=2'),OWNER(GLO:Owner),NAME('dbo.Cel'),PRE(AAAACEL),BINDABLE,THREAD !                     
CEL_PK                   KEY(AAAACEL:CelID),NOCASE,PRIMARY !                     
Record                   RECORD,PRE()
CelID                       LONG                           !                     
CelOms                      CSTRING(51)                    !                     
Breedte                     LONG                           !                     
Lengte                      LONG                           !                     
                         END
                     END                       

AOverboekingRit      FILE,DRIVER('MSSQL','/BUSYHANDLING=2'),OWNER(Glo:Owner),NAME('dbo.OverboekingRit'),PRE(AOR),BINDABLE,THREAD !                     
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

APlanningInkoop      FILE,DRIVER('MSSQL','/BUSYHANDLING=2'),OWNER(GLO:Owner),NAME('dbo.PlanningInkoop'),PRE(APla2),BINDABLE,THREAD !                     
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

APlanningOverboeking FILE,DRIVER('MSSQL','/BUSYHANDLING=2'),OWNER(Glo:OWNER),NAME('dbo.PlanningOverboeking'),PRE(APla4),BINDABLE,THREAD !                     
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

APlanningVerkoop     FILE,DRIVER('MSSQL','/BUSYHANDLING=2'),OWNER(GLO:Owner),NAME('dbo.PlanningVerkoop'),PRE(APla3),BINDABLE,THREAD !                     
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

APalletSoort         FILE,DRIVER('MSSQL','/BUSYHANDLING=2'),OWNER(GLO:Owner),NAME('dbo.PalletSoort'),PRE(APalSrt),BINDABLE,THREAD !                     
PK_PalletSoort           KEY(APalSrt:PalletSoortID),PRIMARY !                     
FK_PalletSoort           KEY(APalSrt:PalletOmschrijving,APalSrt:PalletSoortID),NOCASE ! Op PalletOmschrijving/PalletSoortID
Record                   RECORD,PRE()
PalletSoortID               LONG                           !                     
PalletOmschrijving          CSTRING(11)                    !                     
Tarra                       DECIMAL(18,2)                  !                     
                         END
                     END                       

ACelLocatie          FILE,DRIVER('MSSQL','/BUSYHANDLING=2'),OWNER(GLO:Owner),NAME('dbo.CelLocatie'),PRE(ACL),BINDABLE,THREAD !                     
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

AACelLocatie         FILE,DRIVER('MSSQL','/BUSYHANDLING=2'),OWNER(GLO:Owner),NAME('dbo.CelLocatie'),PRE(AACL),BINDABLE,THREAD !                     
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

AAACelLocatie        FILE,DRIVER('MSSQL','/BUSYHANDLING=2'),OWNER(GLO:Owner),NAME('dbo.CelLocatie'),PRE(AAACL),BINDABLE,THREAD !                     
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

AAAACelLocatie       FILE,DRIVER('MSSQL','/BUSYHANDLING=2'),OWNER(GLO:Owner),NAME('dbo.CelLocatie'),PRE(AAAACL),BINDABLE,THREAD !                     
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

AViewVoorraadPartij_INDEXED FILE,DRIVER('MSSQL','/BUSYHANDLING=2'),OWNER(Glo:Owner),NAME('dbo.ViewVoorraadPartij_INDEXED'),PRE(AVVParI),BINDABLE,THREAD !                     
ExternPartijnr_PartijID_CelID_K KEY(AVVParI:ExternPartijnr,AVVParI:PartijID,AVVParI:CelID),DUP,NOCASE !                     
PartijID_CelID_K         KEY(AVVParI:PartijID,AVVParI:CelID),DUP,NOCASE !                     
ArtikelID_PartijID_CelID_K KEY(AVVParI:ArtikelID,-AVVParI:PartijID,AVVParI:CelID),DUP,NOCASE !                     
ArtikelOms_PartijID_CelID_K KEY(AVVParI:ArtikelOms,AVVParI:PartijID,AVVParI:CelID),DUP,NOCASE !                     
ArtikelID_CelID_PartijID_K KEY(AVVParI:ArtikelID,AVVParI:CelID,AVVParI:PartijID),DUP,NOCASE !                     
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

AAAViewVoorraadPartij_INDEXED FILE,DRIVER('MSSQL','/BUSYHANDLING=2'),OWNER(Glo:Owner),NAME('dbo.ViewVoorraadPartij_INDEXED'),PRE(AAAVVPar_INDEX),BINDABLE,THREAD !                     
ExternPartijnr_PartijID_CelID_K KEY(AAAVVPar_INDEX:ExternPartijnr,AAAVVPar_INDEX:PartijID,AAAVVPar_INDEX:CelID),DUP,NOCASE !                     
PartijID_CelID_K         KEY(AAAVVPar_INDEX:PartijID,AAAVVPar_INDEX:CelID),DUP,NOCASE !                     
ArtikelID_PartijID_CelID_K KEY(AAAVVPar_INDEX:ArtikelID,-AAAVVPar_INDEX:PartijID,AAAVVPar_INDEX:CelID),DUP,NOCASE !                     
ArtikelOms_PartijID_CelID_K KEY(AAAVVPar_INDEX:ArtikelOms,AAAVVPar_INDEX:PartijID,AAAVVPar_INDEX:CelID),DUP,NOCASE !                     
ArtikelID_CelID_PartijID_K KEY(AAAVVPar_INDEX:ArtikelID,AAAVVPar_INDEX:CelID,AAAVVPar_INDEX:PartijID),DUP,NOCASE !                     
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

AAAAViewVoorraadPartij_INDEXED FILE,DRIVER('MSSQL','/BUSYHANDLING=2'),OWNER(Glo:Owner),NAME('dbo.ViewVoorraadPartij_INDEXED'),PRE(AAAAVVParI),BINDABLE,THREAD !                     
ExternPartijnr_PartijID_CelID_K KEY(AAAAVVParI:ExternPartijnr,AAAAVVParI:PartijID,AAAAVVParI:CelID),DUP,NOCASE !                     
PartijID_CelID_K         KEY(AAAAVVParI:PartijID,AAAAVVParI:CelID),DUP,NOCASE !                     
ArtikelID_PartijID_CelID_K KEY(AAAAVVParI:ArtikelID,-AAAAVVParI:PartijID,AAAAVVParI:CelID),DUP,NOCASE !                     
ArtikelOms_PartijID_CelID_K KEY(AAAAVVParI:ArtikelOms,AAAAVVParI:PartijID,AAAAVVParI:CelID),DUP,NOCASE !                     
ArtikelID_CelID_PartijID_K KEY(AAAAVVParI:ArtikelID,AAAAVVParI:CelID,AAAAVVParI:PartijID),DUP,NOCASE !                     
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

AAViewVoorraadPartij_INDEXED FILE,DRIVER('MSSQL','/BUSYHANDLING=2'),OWNER(Glo:Owner),NAME('dbo.ViewVoorraadPartij_INDEXED'),PRE(AAVVParI),BINDABLE,THREAD !                     
ExternPartijnr_PartijID_CelID_K KEY(AAVVParI:ExternPartijnr,AAVVParI:PartijID,AAVVParI:CelID),DUP,NOCASE !                     
PartijID_CelID_K         KEY(AAVVParI:PartijID,AAVVParI:CelID),DUP,NOCASE !                     
ArtikelID_PartijID_CelID_K KEY(AAVVParI:ArtikelID,-AAVVParI:PartijID,AAVVParI:CelID),DUP,NOCASE !                     
ArtikelOms_PartijID_CelID_K KEY(AAVVParI:ArtikelOms,AAVVParI:PartijID,AAVVParI:CelID),DUP,NOCASE !                     
ArtikelID_CelID_PartijID_K KEY(AAVVParI:ArtikelID,AAVVParI:CelID,AAVVParI:PartijID),DUP,NOCASE !                     
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

AVoorraadVerloop     FILE,DRIVER('MSSQL','/BUSYHANDLING=2'),OWNER(GLO:owner),NAME('dbo.VoorraadVerloop'),PRE(AVVL),BINDABLE,THREAD !                     
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

AAPlanningVerkoop    FILE,DRIVER('MSSQL','/BUSYHANDLING=2'),OWNER(GLO:Owner),NAME('dbo.PlanningVerkoop'),PRE(AAPla3),BINDABLE,THREAD !                     
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

APalletBladSjabloon  FILE,DRIVER('MSSQL','/BUSYHANDLING=2'),OWNER(Glo:OWNER),NAME('dbo.PalletBladSjabloon'),PRE(APBS),BINDABLE,THREAD !                     
PK_PalletBladSjabloon    KEY(APBS:PalletBladSjabloonID),PRIMARY !                     
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

ARelatieArtikelOmschrijving FILE,DRIVER('MSSQL','/BUSYHANDLING=2'),OWNER(GLO:Owner),NAME('dbo.RelatieArtikelOmschrijving'),PRE(ARAO),BINDABLE,THREAD !                     
PK_RelatieArtikelOmschrijving KEY(ARAO:RelatieArtikelOmschrijvingID),NOCASE,PRIMARY !                     
FK1_RelatieArtikelOmschrijving KEY(ARAO:RelatieID,ARAO:ArtikelID),NOCASE !                     
Record                   RECORD,PRE()
RelatieArtikelOmschrijvingID LONG                          !                     
RelatieID                   LONG                           !                     
ArtikelID                   CSTRING(31)                    !                     
ArtikelOmschrijving         CSTRING(101)                   !                     
RelatieArtikelID            CSTRING(31)                    ! Artikelnummer zoals deze bij de klant wordt gebruikt.
GTIN                        CSTRING(21)                    !                     
                         END
                     END                       

AAViewTransporteur   FILE,DRIVER('MSSQL','/BUSYHANDLING=2'),OWNER(Glo:OWNER),NAME('dbo.ViewTransporteur'),PRE(AAVTRA),BINDABLE,THREAD !                     
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

ds_VersionModifier  long
ds_FMInited byte



WE::MustClose       long
WE::CantCloseNow    long
db Debuger
  compile ('****', _VER_C60)
  include('cwsynchc.inc'),once
  ****
  include('fm3equ.clw')
ds_FMQueue  Queue,pre(_dsf),type
Prefix        String(10)
FileName      String(255)
FromVersion   Long
ToVersion     Long
Reserved      String(255)
            end

ds_FM_Upgrading  &byte,thread                ! File Manager 2/3 upgrading flag
INCLUDE('GebruikerLogClassDef.inc')
Access:ViewArtikel   &FileManager,THREAD                   ! FileManager for ViewArtikel
Relate:ViewArtikel   &RelationManager,THREAD               ! RelationManager for ViewArtikel
Access:Partij        &FileManager,THREAD                   ! FileManager for Partij
Relate:Partij        &RelationManager,THREAD               ! RelationManager for Partij
Access:Relatie       &FileManager,THREAD                   ! FileManager for Relatie
Relate:Relatie       &RelationManager,THREAD               ! RelationManager for Relatie
Access:Verpakking    &FileManager,THREAD                   ! FileManager for Verpakking
Relate:Verpakking    &RelationManager,THREAD               ! RelationManager for Verpakking
Access:ViewVoorraadPlanning &FileManager,THREAD            ! FileManager for ViewVoorraadPlanning
Relate:ViewVoorraadPlanning &RelationManager,THREAD        ! RelationManager for ViewVoorraadPlanning
Access:Cel           &FileManager,THREAD                   ! FileManager for Cel
Relate:Cel           &RelationManager,THREAD               ! RelationManager for Cel
Access:Mutatie       &FileManager,THREAD                   ! FileManager for Mutatie
Relate:Mutatie       &RelationManager,THREAD               ! RelationManager for Mutatie
Access:Inkoop        &FileManager,THREAD                   ! FileManager for Inkoop
Relate:Inkoop        &RelationManager,THREAD               ! RelationManager for Inkoop
Access:Planning      &FileManager,THREAD                   ! FileManager for Planning
Relate:Planning      &RelationManager,THREAD               ! RelationManager for Planning
Access:Verkoop       &FileManager,THREAD                   ! FileManager for Verkoop
Relate:Verkoop       &RelationManager,THREAD               ! RelationManager for Verkoop
Access:Sjabloon      &FileManager,THREAD                   ! FileManager for Sjabloon
Relate:Sjabloon      &RelationManager,THREAD               ! RelationManager for Sjabloon
Access:ViewVoorraadCelTotaal &FileManager,THREAD           ! FileManager for ViewVoorraadCelTotaal
Relate:ViewVoorraadCelTotaal &RelationManager,THREAD       ! RelationManager for ViewVoorraadCelTotaal
Access:PlanningInkoop &FileManager,THREAD                  ! FileManager for PlanningInkoop
Relate:PlanningInkoop &RelationManager,THREAD              ! RelationManager for PlanningInkoop
Access:PlanningVerkoop &FileManager,THREAD                 ! FileManager for PlanningVerkoop
Relate:PlanningVerkoop &RelationManager,THREAD             ! RelationManager for PlanningVerkoop
Access:VoorraadVerloop &FileManager,THREAD                 ! FileManager for VoorraadVerloop
Relate:VoorraadVerloop &RelationManager,THREAD             ! RelationManager for VoorraadVerloop
Access:RelatieAdres  &FileManager,THREAD                   ! FileManager for RelatieAdres
Relate:RelatieAdres  &RelationManager,THREAD               ! RelationManager for RelatieAdres
Access:PalletMutatie &FileManager,THREAD                   ! FileManager for PalletMutatie
Relate:PalletMutatie &RelationManager,THREAD               ! RelationManager for PalletMutatie
Access:PalletVerloop &FileManager,THREAD                   ! FileManager for PalletVerloop
Relate:PalletVerloop &RelationManager,THREAD               ! RelationManager for PalletVerloop
Access:Transporteur  &FileManager,THREAD                   ! FileManager for Transporteur
Relate:Transporteur  &RelationManager,THREAD               ! RelationManager for Transporteur
Access:ViewTransporteur &FileManager,THREAD                ! FileManager for ViewTransporteur
Relate:ViewTransporteur &RelationManager,THREAD            ! RelationManager for ViewTransporteur
Access:ViewVoorraadPartij &FileManager,THREAD              ! FileManager for ViewVoorraadPartij
Relate:ViewVoorraadPartij &RelationManager,THREAD          ! RelationManager for ViewVoorraadPartij
Access:CMR           &FileManager,THREAD                   ! FileManager for CMR
Relate:CMR           &RelationManager,THREAD               ! RelationManager for CMR
Access:ViewPlanningPartij &FileManager,THREAD              ! FileManager for ViewPlanningPartij
Relate:ViewPlanningPartij &RelationManager,THREAD          ! RelationManager for ViewPlanningPartij
Access:OverboekingRit &FileManager,THREAD                  ! FileManager for OverboekingRit
Relate:OverboekingRit &RelationManager,THREAD              ! RelationManager for OverboekingRit
Access:OverboekingRitRegel &FileManager,THREAD             ! FileManager for OverboekingRitRegel
Relate:OverboekingRitRegel &RelationManager,THREAD         ! RelationManager for OverboekingRitRegel
Access:BulkOverboeking &FileManager,THREAD                 ! FileManager for BulkOverboeking
Relate:BulkOverboeking &RelationManager,THREAD             ! RelationManager for BulkOverboeking
Access:PlanningOverboeking &FileManager,THREAD             ! FileManager for PlanningOverboeking
Relate:PlanningOverboeking &RelationManager,THREAD         ! RelationManager for PlanningOverboeking
Access:DubbeleInslagMutaties &FileManager,THREAD           ! FileManager for DubbeleInslagMutaties
Relate:DubbeleInslagMutaties &RelationManager,THREAD       ! RelationManager for DubbeleInslagMutaties
Access:ArtikelOmschrijvingExtra &FileManager,THREAD        ! FileManager for ArtikelOmschrijvingExtra
Relate:ArtikelOmschrijvingExtra &RelationManager,THREAD    ! RelationManager for ArtikelOmschrijvingExtra
Access:ArtikelOmschrijvingExtraGroep &FileManager,THREAD   ! FileManager for ArtikelOmschrijvingExtraGroep
Relate:ArtikelOmschrijvingExtraGroep &RelationManager,THREAD ! RelationManager for ArtikelOmschrijvingExtraGroep
Access:PalletSoort   &FileManager,THREAD                   ! FileManager for PalletSoort
Relate:PalletSoort   &RelationManager,THREAD               ! RelationManager for PalletSoort
Access:Weging        &FileManager,THREAD                   ! FileManager for Weging
Relate:Weging        &RelationManager,THREAD               ! RelationManager for Weging
Access:CelLocatie    &FileManager,THREAD                   ! FileManager for CelLocatie
Relate:CelLocatie    &RelationManager,THREAD               ! RelationManager for CelLocatie
Access:Versie        &FileManager,THREAD                   ! FileManager for Versie
Relate:Versie        &RelationManager,THREAD               ! RelationManager for Versie
Access:ViewPartijCelLocaties &FileManager,THREAD           ! FileManager for ViewPartijCelLocaties
Relate:ViewPartijCelLocaties &RelationManager,THREAD       ! RelationManager for ViewPartijCelLocaties
Access:ViewVoorraadPartij_INDEXED &FileManager,THREAD      ! FileManager for ViewVoorraadPartij_INDEXED
Relate:ViewVoorraadPartij_INDEXED &RelationManager,THREAD  ! RelationManager for ViewVoorraadPartij_INDEXED
Access:ViewArtikel_Exact &FileManager,THREAD               ! FileManager for ViewArtikel_Exact
Relate:ViewArtikel_Exact &RelationManager,THREAD           ! RelationManager for ViewArtikel_Exact
Access:Relatie_Exact &FileManager,THREAD                   ! FileManager for Relatie_Exact
Relate:Relatie_Exact &RelationManager,THREAD               ! RelationManager for Relatie_Exact
Access:ViewPalletTegoeden &FileManager,THREAD              ! FileManager for ViewPalletTegoeden
Relate:ViewPalletTegoeden &RelationManager,THREAD          ! RelationManager for ViewPalletTegoeden
Access:ViewPlanningPartijTotaal &FileManager,THREAD        ! FileManager for ViewPlanningPartijTotaal
Relate:ViewPlanningPartijTotaal &RelationManager,THREAD    ! RelationManager for ViewPlanningPartijTotaal
Access:ViewVoorraadPartijTotaal &FileManager,THREAD        ! FileManager for ViewVoorraadPartijTotaal
Relate:ViewVoorraadPartijTotaal &RelationManager,THREAD    ! RelationManager for ViewVoorraadPartijTotaal
Access:Gebruiker     &FileManager,THREAD                   ! FileManager for Gebruiker
Relate:Gebruiker     &RelationManager,THREAD               ! RelationManager for Gebruiker
Access:GebruikerLog  &FileManager,THREAD                   ! FileManager for GebruikerLog
Relate:GebruikerLog  &RelationManager,THREAD               ! RelationManager for GebruikerLog
Access:SnelheidLogging &FileManager,THREAD                 ! FileManager for SnelheidLogging
Relate:SnelheidLogging &RelationManager,THREAD             ! RelationManager for SnelheidLogging
Access:CelArtikelVoorraad &FileManager,THREAD              ! FileManager for CelArtikelVoorraad
Relate:CelArtikelVoorraad &RelationManager,THREAD          ! RelationManager for CelArtikelVoorraad
Access:PartijCelVoorraad &FileManager,THREAD               ! FileManager for PartijCelVoorraad
Relate:PartijCelVoorraad &RelationManager,THREAD           ! RelationManager for PartijCelVoorraad
Access:Activiteit    &FileManager,THREAD                   ! FileManager for Activiteit
Relate:Activiteit    &RelationManager,THREAD               ! RelationManager for Activiteit
Access:PalletBladSjabloon &FileManager,THREAD              ! FileManager for PalletBladSjabloon
Relate:PalletBladSjabloon &RelationManager,THREAD          ! RelationManager for PalletBladSjabloon
Access:PalletBladSjabloonCountry &FileManager,THREAD       ! FileManager for PalletBladSjabloonCountry
Relate:PalletBladSjabloonCountry &RelationManager,THREAD   ! RelationManager for PalletBladSjabloonCountry
Access:RelatieArtikelOmschrijving &FileManager,THREAD      ! FileManager for RelatieArtikelOmschrijving
Relate:RelatieArtikelOmschrijving &RelationManager,THREAD  ! RelationManager for RelatieArtikelOmschrijving
Access:Pallet        &FileManager,THREAD                   ! FileManager for Pallet
Relate:Pallet        &RelationManager,THREAD               ! RelationManager for Pallet
Access:KostenStamgeg &FileManager,THREAD                   ! FileManager for KostenStamgeg
Relate:KostenStamgeg &RelationManager,THREAD               ! RelationManager for KostenStamgeg
Access:ExtraKosten   &FileManager,THREAD                   ! FileManager for ExtraKosten
Relate:ExtraKosten   &RelationManager,THREAD               ! RelationManager for ExtraKosten
Access:ViewBetcd     &FileManager,THREAD                   ! FileManager for ViewBetcd
Relate:ViewBetcd     &RelationManager,THREAD               ! RelationManager for ViewBetcd
Access:DeliveryTerms &FileManager,THREAD                   ! FileManager for DeliveryTerms
Relate:DeliveryTerms &RelationManager,THREAD               ! RelationManager for DeliveryTerms
Access:ISOCountries  &FileManager,THREAD                   ! FileManager for ISOCountries
Relate:ISOCountries  &RelationManager,THREAD               ! RelationManager for ISOCountries
Access:SSOPCategorie &FileManager,THREAD                   ! FileManager for SSOPCategorie
Relate:SSOPCategorie &RelationManager,THREAD               ! RelationManager for SSOPCategorie
Access:SSOPObject    &FileManager,THREAD                   ! FileManager for SSOPObject
Relate:SSOPObject    &RelationManager,THREAD               ! RelationManager for SSOPObject
Access:SSOPRegistratie &FileManager,THREAD                 ! FileManager for SSOPRegistratie
Relate:SSOPRegistratie &RelationManager,THREAD             ! RelationManager for SSOPRegistratie
Access:SSOPTijd      &FileManager,THREAD                   ! FileManager for SSOPTijd
Relate:SSOPTijd      &RelationManager,THREAD               ! RelationManager for SSOPTijd
Access:GNCode        &FileManager,THREAD                   ! FileManager for GNCode
Relate:GNCode        &RelationManager,THREAD               ! RelationManager for GNCode
Access:GNCodeArtikelen &FileManager,THREAD                 ! FileManager for GNCodeArtikelen
Relate:GNCodeArtikelen &RelationManager,THREAD             ! RelationManager for GNCodeArtikelen
Access:Havens        &FileManager,THREAD                   ! FileManager for Havens
Relate:Havens        &RelationManager,THREAD               ! RelationManager for Havens
Access:Rapporten     &FileManager,THREAD                   ! FileManager for Rapporten
Relate:Rapporten     &RelationManager,THREAD               ! RelationManager for Rapporten
Access:ARelatie      &FileManager,THREAD                   ! FileManager for ARelatie
Relate:ARelatie      &RelationManager,THREAD               ! RelationManager for ARelatie
Access:APlanning     &FileManager,THREAD                   ! FileManager for APlanning
Relate:APlanning     &RelationManager,THREAD               ! RelationManager for APlanning
Access:AInkoop       &FileManager,THREAD                   ! FileManager for AInkoop
Relate:AInkoop       &RelationManager,THREAD               ! RelationManager for AInkoop
Access:AVerkoop      &FileManager,THREAD                   ! FileManager for AVerkoop
Relate:AVerkoop      &RelationManager,THREAD               ! RelationManager for AVerkoop
Access:AViewArtikel  &FileManager,THREAD                   ! FileManager for AViewArtikel
Relate:AViewArtikel  &RelationManager,THREAD               ! RelationManager for AViewArtikel
Access:AARelatie     &FileManager,THREAD                   ! FileManager for AARelatie
Relate:AARelatie     &RelationManager,THREAD               ! RelationManager for AARelatie
Access:ACel          &FileManager,THREAD                   ! FileManager for ACel
Relate:ACel          &RelationManager,THREAD               ! RelationManager for ACel
Access:AACel         &FileManager,THREAD                   ! FileManager for AACel
Relate:AACel         &RelationManager,THREAD               ! RelationManager for AACel
Access:AViewVoorraadCelTotaal &FileManager,THREAD          ! FileManager for AViewVoorraadCelTotaal
Relate:AViewVoorraadCelTotaal &RelationManager,THREAD      ! RelationManager for AViewVoorraadCelTotaal
Access:AVerpakking   &FileManager,THREAD                   ! FileManager for AVerpakking
Relate:AVerpakking   &RelationManager,THREAD               ! RelationManager for AVerpakking
Access:AAARelatie    &FileManager,THREAD                   ! FileManager for AAARelatie
Relate:AAARelatie    &RelationManager,THREAD               ! RelationManager for AAARelatie
Access:AAAARelatie   &FileManager,THREAD                   ! FileManager for AAAARelatie
Relate:AAAARelatie   &RelationManager,THREAD               ! RelationManager for AAAARelatie
Access:AViewTransporteur &FileManager,THREAD               ! FileManager for AViewTransporteur
Relate:AViewTransporteur &RelationManager,THREAD           ! RelationManager for AViewTransporteur
Access:APalletMutatie &FileManager,THREAD                  ! FileManager for APalletMutatie
Relate:APalletMutatie &RelationManager,THREAD              ! RelationManager for APalletMutatie
Access:AAACel        &FileManager,THREAD                   ! FileManager for AAACel
Relate:AAACel        &RelationManager,THREAD               ! RelationManager for AAACel
Access:APalletVerloop &FileManager,THREAD                  ! FileManager for APalletVerloop
Relate:APalletVerloop &RelationManager,THREAD              ! RelationManager for APalletVerloop
Access:AViewVoorraadPartij &FileManager,THREAD             ! FileManager for AViewVoorraadPartij
Relate:AViewVoorraadPartij &RelationManager,THREAD         ! RelationManager for AViewVoorraadPartij
Access:AMutatie      &FileManager,THREAD                   ! FileManager for AMutatie
Relate:AMutatie      &RelationManager,THREAD               ! RelationManager for AMutatie
Access:AAViewVoorraadPartij &FileManager,THREAD            ! FileManager for AAViewVoorraadPartij
Relate:AAViewVoorraadPartij &RelationManager,THREAD        ! RelationManager for AAViewVoorraadPartij
Access:AAAViewVoorraadPartij &FileManager,THREAD           ! FileManager for AAAViewVoorraadPartij
Relate:AAAViewVoorraadPartij &RelationManager,THREAD       ! RelationManager for AAAViewVoorraadPartij
Access:APartij       &FileManager,THREAD                   ! FileManager for APartij
Relate:APartij       &RelationManager,THREAD               ! RelationManager for APartij
Access:AAViewArtikel &FileManager,THREAD                   ! FileManager for AAViewArtikel
Relate:AAViewArtikel &RelationManager,THREAD               ! RelationManager for AAViewArtikel
Access:AAVerpakking  &FileManager,THREAD                   ! FileManager for AAVerpakking
Relate:AAVerpakking  &RelationManager,THREAD               ! RelationManager for AAVerpakking
Access:AAAAViewVoorraadPartij &FileManager,THREAD          ! FileManager for AAAAViewVoorraadPartij
Relate:AAAAViewVoorraadPartij &RelationManager,THREAD      ! RelationManager for AAAAViewVoorraadPartij
Access:AOverboekingRitRegel &FileManager,THREAD            ! FileManager for AOverboekingRitRegel
Relate:AOverboekingRitRegel &RelationManager,THREAD        ! RelationManager for AOverboekingRitRegel
Access:AAPlanning    &FileManager,THREAD                   ! FileManager for AAPlanning
Relate:AAPlanning    &RelationManager,THREAD               ! RelationManager for AAPlanning
Access:AAPartij      &FileManager,THREAD                   ! FileManager for AAPartij
Relate:AAPartij      &RelationManager,THREAD               ! RelationManager for AAPartij
Access:AAAACel       &FileManager,THREAD                   ! FileManager for AAAACel
Relate:AAAACel       &RelationManager,THREAD               ! RelationManager for AAAACel
Access:AOverboekingRit &FileManager,THREAD                 ! FileManager for AOverboekingRit
Relate:AOverboekingRit &RelationManager,THREAD             ! RelationManager for AOverboekingRit
Access:APlanningInkoop &FileManager,THREAD                 ! FileManager for APlanningInkoop
Relate:APlanningInkoop &RelationManager,THREAD             ! RelationManager for APlanningInkoop
Access:APlanningOverboeking &FileManager,THREAD            ! FileManager for APlanningOverboeking
Relate:APlanningOverboeking &RelationManager,THREAD        ! RelationManager for APlanningOverboeking
Access:APlanningVerkoop &FileManager,THREAD                ! FileManager for APlanningVerkoop
Relate:APlanningVerkoop &RelationManager,THREAD            ! RelationManager for APlanningVerkoop
Access:APalletSoort  &FileManager,THREAD                   ! FileManager for APalletSoort
Relate:APalletSoort  &RelationManager,THREAD               ! RelationManager for APalletSoort
Access:ACelLocatie   &FileManager,THREAD                   ! FileManager for ACelLocatie
Relate:ACelLocatie   &RelationManager,THREAD               ! RelationManager for ACelLocatie
Access:AACelLocatie  &FileManager,THREAD                   ! FileManager for AACelLocatie
Relate:AACelLocatie  &RelationManager,THREAD               ! RelationManager for AACelLocatie
Access:AAACelLocatie &FileManager,THREAD                   ! FileManager for AAACelLocatie
Relate:AAACelLocatie &RelationManager,THREAD               ! RelationManager for AAACelLocatie
Access:AAAACelLocatie &FileManager,THREAD                  ! FileManager for AAAACelLocatie
Relate:AAAACelLocatie &RelationManager,THREAD              ! RelationManager for AAAACelLocatie
Access:AViewVoorraadPartij_INDEXED &FileManager,THREAD     ! FileManager for AViewVoorraadPartij_INDEXED
Relate:AViewVoorraadPartij_INDEXED &RelationManager,THREAD ! RelationManager for AViewVoorraadPartij_INDEXED
Access:AAAViewVoorraadPartij_INDEXED &FileManager,THREAD   ! FileManager for AAAViewVoorraadPartij_INDEXED
Relate:AAAViewVoorraadPartij_INDEXED &RelationManager,THREAD ! RelationManager for AAAViewVoorraadPartij_INDEXED
Access:AAAAViewVoorraadPartij_INDEXED &FileManager,THREAD  ! FileManager for AAAAViewVoorraadPartij_INDEXED
Relate:AAAAViewVoorraadPartij_INDEXED &RelationManager,THREAD ! RelationManager for AAAAViewVoorraadPartij_INDEXED
Access:AAViewVoorraadPartij_INDEXED &FileManager,THREAD    ! FileManager for AAViewVoorraadPartij_INDEXED
Relate:AAViewVoorraadPartij_INDEXED &RelationManager,THREAD ! RelationManager for AAViewVoorraadPartij_INDEXED
Access:AVoorraadVerloop &FileManager,THREAD                ! FileManager for AVoorraadVerloop
Relate:AVoorraadVerloop &RelationManager,THREAD            ! RelationManager for AVoorraadVerloop
Access:AAPlanningVerkoop &FileManager,THREAD               ! FileManager for AAPlanningVerkoop
Relate:AAPlanningVerkoop &RelationManager,THREAD           ! RelationManager for AAPlanningVerkoop
Access:APalletBladSjabloon &FileManager,THREAD             ! FileManager for APalletBladSjabloon
Relate:APalletBladSjabloon &RelationManager,THREAD         ! RelationManager for APalletBladSjabloon
Access:ARelatieArtikelOmschrijving &FileManager,THREAD     ! FileManager for ARelatieArtikelOmschrijving
Relate:ARelatieArtikelOmschrijving &RelationManager,THREAD ! RelationManager for ARelatieArtikelOmschrijving
Access:AAViewTransporteur &FileManager,THREAD              ! FileManager for AAViewTransporteur
Relate:AAViewTransporteur &RelationManager,THREAD          ! RelationManager for AAViewTransporteur

GlobalRequest        BYTE(0),THREAD                        ! Set when a browse calls a form, to let it know action to perform
GlobalResponse       BYTE(0),THREAD                        ! Set to the response from the form
VCRRequest           LONG(0),THREAD                        ! Set to the request from the VCR buttons
FuzzyMatcher         FuzzyClass                            ! Global fuzzy matcher
LocalErrorStatus     ErrorStatusClass,THREAD
LocalErrors          ErrorClass
LocalINIMgr          INIClass
GlobalErrors         &ErrorClass
INIMgr               &INIClass
DLLInitializer       CLASS,TYPE                            ! An object of this type is used to initialize the dll, it is created in the generated bc module
Construct              PROCEDURE
Destruct               PROCEDURE
                     END

Dictionary           CLASS,THREAD
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
  DctInit()
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
     db.init('VoorrDct',0,50)  ! intiialize the debuger class 
   ! Generated using Clarion Template version v10.0  Family = abc
    ds_FM_Upgrading &= ds_PassHandleForUpgrading()
    if ds_FMInited = 0
      ds_FMInited = 1
        ds_SetOption('inifilename','.\fm3.ini')
      !    ! hier de controle op AUTO NET
      !    ! AutoNet
      !    ! eerst kijken of in JMDSILO de AutoNet bestaat
      !Loc:LocalPath='C:\MAATWERK\C10\LIMPENS\JMDSILO\AUTONET'
      !Loc:NetPath='H:\MAATWERK\C10\LIMPENS\JMDSILO\AUTONET'    
      !
      !IF GETINI('AutoNet','LocalPath',,'.\JMDSilo.INI')=''
      !    IF NOT EXISTS(loc:LocalPath)
      !        IF ds_CreateDirectory(Loc:LocalPath)=FALSE
      !            MESSAGE('LocalPath '&loc:LocalPath&' bestaat niet ')
      !        END
      !    END
      !    PUTINI('AutoNet','LocalPath',loc:LocalPath,'.\JMDSilo.INI')
      !END
      !IF GETINI('AutoNet','NetPath',,'.\JMDSilo.INI')=''
      !    IF NOT EXISTS(loc:NetPath)
      !        IF ds_CreateDirectory(Loc:NetPath)=FALSE
      !            MESSAGE('NetPath '&loc:NetPath&' bestaat niet ')
      !        END
      !        
      !    END
      !    PUTINI('AutoNet','NetPath',loc:NetPath,'.\JMDSilo.INI')
      !END
      !Message('Hier in de jmdsilo|'&GETINI('AutoNet','LocalPath',,'.\JMDSilo.INI')&'|'&GETINI('AutoNet','NetPath',,'.\JMDSilo.INI'))
      
      !db.Debugout('Command :'&Command(''))
      !db.Debugout('Restart :'&Command('/Restart'))
      IF Command('/Restart')
          return 
      END
          
      if ds_UpgradeLocalMachineEx('AutoNet','.\Voorraad.ini') >0  ! Generated by FM, AutoNET option
        halt
      end
      ds_SetOption('BadFile',0)
  
  
      ds_IgnoreDriver('AllFiles',1)
      ds_SetOption('SPCreate',1)
      ds_SetOption('GUIDsCaseInsensitive',1)
    End  !This end
  Glo:Owner=GETINI('SQL','OWNER','172.16.0.7\MS$DPM2007$,Voorraad,jmd,superjmd','.\vooraad.ini')&';APP=JMDVoorraad v'&Glo:Versie&';WSID='&GETUSERNAME()
  
NetRefreshPlanningViews PROCEDURE
	CODE
		ThisNetRefresh.Send('|Planning|APlanning|AAPlanning|ViewPlanningPartij|ViewVoorraadPlanning|PlanningInkoop|PlanningVerkoop|PlanningOverboeking|APlanningInkoop|APlanningVerkoop|APlanningOverboeking|Inkoop|AInkoop|Verkoop|AVerkoop|OverboekingRit|') ! NetTalk (NetRefresh)
	!END
NetRefreshVoorraadViews PROCEDURE
	CODE
		ThisNetRefresh.Send('|Partij|APartij|Mutatie|AMutatie|ViewVoorraadCelTotaal|AViewVoorraadCelTotaal|ViewVoorraadPartij|AViewVoorraadPartij|AAViewVoorraadPartij|AAAViewVoorraadPartij|AAAAViewVoorraadPartij|ViewVoorraadPlanning|VoorraadVerloop|') ! NetTalk (NetRefresh)
	!END
INCLUDE('GebruikerLogClassSrc.inc')
!These procedures are used to initialize the DLL. It must be called by the main executable when it starts up
VoorrDct:Init PROCEDURE(<ErrorClass curGlobalErrors>, <INIClass curINIMgr>)
VoorrDct:Init_Called    BYTE,STATIC

  CODE
  IF VoorrDct:Init_Called
     RETURN
  ELSE
     VoorrDct:Init_Called = True
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
  Access:VoorraadVerloop.SetErrors(GlobalErrors)
  Access:RelatieAdres.SetErrors(GlobalErrors)
  Access:PalletMutatie.SetErrors(GlobalErrors)
  Access:PalletVerloop.SetErrors(GlobalErrors)
  Access:Transporteur.SetErrors(GlobalErrors)
  Access:ViewTransporteur.SetErrors(GlobalErrors)
  Access:ViewVoorraadPartij.SetErrors(GlobalErrors)
  Access:CMR.SetErrors(GlobalErrors)
  Access:ViewPlanningPartij.SetErrors(GlobalErrors)
  Access:OverboekingRit.SetErrors(GlobalErrors)
  Access:OverboekingRitRegel.SetErrors(GlobalErrors)
  Access:BulkOverboeking.SetErrors(GlobalErrors)
  Access:PlanningOverboeking.SetErrors(GlobalErrors)
  Access:DubbeleInslagMutaties.SetErrors(GlobalErrors)
  Access:ArtikelOmschrijvingExtra.SetErrors(GlobalErrors)
  Access:ArtikelOmschrijvingExtraGroep.SetErrors(GlobalErrors)
  Access:PalletSoort.SetErrors(GlobalErrors)
  Access:Weging.SetErrors(GlobalErrors)
  Access:CelLocatie.SetErrors(GlobalErrors)
  Access:Versie.SetErrors(GlobalErrors)
  Access:ViewPartijCelLocaties.SetErrors(GlobalErrors)
  Access:ViewVoorraadPartij_INDEXED.SetErrors(GlobalErrors)
  Access:ViewArtikel_Exact.SetErrors(GlobalErrors)
  Access:Relatie_Exact.SetErrors(GlobalErrors)
  Access:ViewPalletTegoeden.SetErrors(GlobalErrors)
  Access:ViewPlanningPartijTotaal.SetErrors(GlobalErrors)
  Access:ViewVoorraadPartijTotaal.SetErrors(GlobalErrors)
  Access:Gebruiker.SetErrors(GlobalErrors)
  Access:GebruikerLog.SetErrors(GlobalErrors)
  Access:SnelheidLogging.SetErrors(GlobalErrors)
  Access:CelArtikelVoorraad.SetErrors(GlobalErrors)
  Access:PartijCelVoorraad.SetErrors(GlobalErrors)
  Access:Activiteit.SetErrors(GlobalErrors)
  Access:PalletBladSjabloon.SetErrors(GlobalErrors)
  Access:PalletBladSjabloonCountry.SetErrors(GlobalErrors)
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
  Access:Rapporten.SetErrors(GlobalErrors)
  Access:ARelatie.SetErrors(GlobalErrors)
  Access:APlanning.SetErrors(GlobalErrors)
  Access:AInkoop.SetErrors(GlobalErrors)
  Access:AVerkoop.SetErrors(GlobalErrors)
  Access:AViewArtikel.SetErrors(GlobalErrors)
  Access:AARelatie.SetErrors(GlobalErrors)
  Access:ACel.SetErrors(GlobalErrors)
  Access:AACel.SetErrors(GlobalErrors)
  Access:AViewVoorraadCelTotaal.SetErrors(GlobalErrors)
  Access:AVerpakking.SetErrors(GlobalErrors)
  Access:AAARelatie.SetErrors(GlobalErrors)
  Access:AAAARelatie.SetErrors(GlobalErrors)
  Access:AViewTransporteur.SetErrors(GlobalErrors)
  Access:APalletMutatie.SetErrors(GlobalErrors)
  Access:AAACel.SetErrors(GlobalErrors)
  Access:APalletVerloop.SetErrors(GlobalErrors)
  Access:AViewVoorraadPartij.SetErrors(GlobalErrors)
  Access:AMutatie.SetErrors(GlobalErrors)
  Access:AAViewVoorraadPartij.SetErrors(GlobalErrors)
  Access:AAAViewVoorraadPartij.SetErrors(GlobalErrors)
  Access:APartij.SetErrors(GlobalErrors)
  Access:AAViewArtikel.SetErrors(GlobalErrors)
  Access:AAVerpakking.SetErrors(GlobalErrors)
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
  Access:AViewVoorraadPartij_INDEXED.SetErrors(GlobalErrors)
  Access:AAAViewVoorraadPartij_INDEXED.SetErrors(GlobalErrors)
  Access:AAAAViewVoorraadPartij_INDEXED.SetErrors(GlobalErrors)
  Access:AAViewVoorraadPartij_INDEXED.SetErrors(GlobalErrors)
  Access:AVoorraadVerloop.SetErrors(GlobalErrors)
  Access:AAPlanningVerkoop.SetErrors(GlobalErrors)
  Access:APalletBladSjabloon.SetErrors(GlobalErrors)
  Access:ARelatieArtikelOmschrijving.SetErrors(GlobalErrors)
  Access:AAViewTransporteur.SetErrors(GlobalErrors)

!This procedure is used to shutdown the DLL. It must be called by the main executable before it closes down

VoorrDct:Kill PROCEDURE
VoorrDct:Kill_Called    BYTE,STATIC

  CODE
  IF VoorrDct:Kill_Called
     RETURN
  ELSE
     VoorrDct:Kill_Called = True
  END
  

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



Dictionary.Construct PROCEDURE

  CODE
  IF THREAD()<>1
     DctInit()
  END


Dictionary.Destruct PROCEDURE

  CODE
  DctKill()

