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

   MAP
!--- Application Global and Exported Procedure Definitions --------------------------------------------
     MODULE('VOORRSTM001.CLW')
MainStm                PROCEDURE   !
     END
     MODULE('VOORRSTM002.CLW')
SelectARelatie         PROCEDURE(String)   !Browse the ARelatie file
     END
     MODULE('VOORRSTM003.CLW')
UpdateVerpakking       PROCEDURE   !Form Verpakking
     END
     MODULE('VOORRSTM004.CLW')
BrowseVerpakking       PROCEDURE   !Browse the Verpakking file
     END
     MODULE('VOORRSTM005.CLW')
SelectARelatieAll      PROCEDURE   !Browse the ARelatie file
     END
     MODULE('VOORRSTM006.CLW')
UpdateTransporteur     PROCEDURE   !Form Transporteur
     END
     MODULE('VOORRSTM007.CLW')
BrowseTransporteurs    PROCEDURE   !Browse the Transporteur file
     END
     MODULE('VOORRSTM008.CLW')
UpdateArtikel          PROCEDURE   !Form Artikel
     END
     MODULE('VOORRSTM009.CLW')
BrowseArtikel          PROCEDURE   !Browse the Artikel file
     END
     MODULE('VOORRSTM010.CLW')
UpdateRelatieAdres     PROCEDURE   !Form RelatieAdres
     END
     MODULE('VOORRSTM011.CLW')
ViewRelatie            PROCEDURE   !Form Relatie
     END
     MODULE('VOORRSTM012.CLW')
BrowseRelatieAdres     PROCEDURE   !Browse the Relatie file
     END
     MODULE('VOORRSTM013.CLW')
UpdatePalletSoort      PROCEDURE   !Form PalletSoort
     END
     MODULE('VOORRSTM014.CLW')
BrowsePalletSoort      PROCEDURE   !Browse the PalletSoort file
     END
     MODULE('VOORRSTM015.CLW')
UpdateCelLocatie       PROCEDURE   !Form CelLocatie
     END
     MODULE('VOORRSTM016.CLW')
UpdateCel              PROCEDURE   !Form Cel
     END
     MODULE('VOORRSTM017.CLW')
BrowseCel              PROCEDURE   !Browse the Cel file
     END
     MODULE('VOORRSTM018.CLW')
UpdateRelatie          PROCEDURE   !Form Relatie
     END
     MODULE('VOORRSTM019.CLW')
BrowseRelatie          PROCEDURE   !Browse the Relatie file
     END
     MODULE('VOORRSTM020.CLW')
SelectAAARelatie       PROCEDURE(String)   !Browse the AAARelatie file
BrowsePalletBladSjabloon PROCEDURE   !Browse the PalletBladSjabloon file
UpdatePalletBladSjabloon PROCEDURE   !Form PalletBladSjabloon
UpdatePalletBladSjabloonCountry PROCEDURE   !Form PalletBladSjabloonCountry
UpdateRelatieArtikelOmschrijving PROCEDURE   !Form RelatieArtikelOmschrijving
BrowseKostenStam       PROCEDURE   !Browse the KostenStamgeg file
UpdateKostenStamgeg    PROCEDURE   !Form KostenStamgeg
BrowseDeliveryTerms    PROCEDURE   !Browse the DeliveryTerms file
UpdateDeliveryTerms    PROCEDURE   !Form DeliveryTerms
BrowseISOCountries     PROCEDURE   !Browse the ISOCountries file
     END
     MODULE('VOORRSTM021.CLW')
UpdateISOCountries     PROCEDURE   !Form ISOCountries
BrowseSSOPCategorie    PROCEDURE   !Browse the SSOPCategorie file
UpdateSSOPCategorie    PROCEDURE   !Form SSOPCategorie
UpdateSSOPObject       PROCEDURE   !Form SSOPObject
BrowseGNCode           PROCEDURE   !Browse the GNCode file
UpdateGNCode           PROCEDURE   !Form GNCode
UpdateGNCodeArtikel    PROCEDURE   !Form GNCodeArtikelen
BrowseHavens           PROCEDURE   !Browse the Havens file
UpdateHavens           PROCEDURE   !Form Havens
BrowseRapporten        PROCEDURE   !Browse the Rapporten file
     END
     MODULE('VOORRSTM022.CLW')
UpdateRapporten        PROCEDURE   !Form Rapporten
WindowVerpakkingSamenvoegen PROCEDURE   !
     END
     include('eventmap.clw')
    ! Declare functions defined in this DLL
VoorrStm:Init          PROCEDURE(<ErrorClass curGlobalErrors>, <INIClass curINIMgr>)
VoorrStm:Kill          PROCEDURE
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

Cel                  FILE,DRIVER('MSSQL'),PRE(CEL),BINDABLE,THREAD,EXTERNAL(''),DLL(dll_mode) !                     
CEL_PK                   KEY(CEL:CelID),NOCASE,PRIMARY     !                     
Record                   RECORD,PRE()
CelID                       LONG                           !                     
CelOms                      CSTRING(51)                    !                     
Breedte                     LONG                           !                     
Lengte                      LONG                           !                     
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

Transporteur         FILE,DRIVER('MSSQL'),PRE(Tra),BINDABLE,THREAD,EXTERNAL(''),DLL(dll_mode) !                     
Transporteur_FK          KEY(Tra:RelatieID,Tra:TransporteurID),DUP,NOCASE ! Op RelatieID/TransporteurID
PK_Transporteur          KEY(Tra:TransporteurID),PRIMARY   !                     
Record                   RECORD,PRE()
TransporteurID              LONG                           !                     
RelatieID                   LONG                           !                     
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

Rapporten            FILE,DRIVER('MSSQL'),PRE(Rap),BINDABLE,THREAD,EXTERNAL(''),DLL(dll_mode) !                     
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
Record                   RECORD,PRE()
CelID                       LONG                           !                     
CelOms                      CSTRING(51)                    !                     
Breedte                     LONG                           !                     
Lengte                      LONG                           !                     
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

!endregion

db Debuger
WE::MustClose       long,external,dll
WE::CantCloseNow    long,external,dll
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
Access:Inkoop        &FileManager,THREAD,EXTERNAL,DLL      ! FileManager for Inkoop
Relate:Inkoop        &RelationManager,THREAD,EXTERNAL,DLL  ! RelationManager for Inkoop
Access:Planning      &FileManager,THREAD,EXTERNAL,DLL      ! FileManager for Planning
Relate:Planning      &RelationManager,THREAD,EXTERNAL,DLL  ! RelationManager for Planning
Access:Verkoop       &FileManager,THREAD,EXTERNAL,DLL      ! FileManager for Verkoop
Relate:Verkoop       &RelationManager,THREAD,EXTERNAL,DLL  ! RelationManager for Verkoop
Access:RelatieAdres  &FileManager,THREAD,EXTERNAL,DLL      ! FileManager for RelatieAdres
Relate:RelatieAdres  &RelationManager,THREAD,EXTERNAL,DLL  ! RelationManager for RelatieAdres
Access:PalletMutatie &FileManager,THREAD,EXTERNAL,DLL      ! FileManager for PalletMutatie
Relate:PalletMutatie &RelationManager,THREAD,EXTERNAL,DLL  ! RelationManager for PalletMutatie
Access:Transporteur  &FileManager,THREAD,EXTERNAL,DLL      ! FileManager for Transporteur
Relate:Transporteur  &RelationManager,THREAD,EXTERNAL,DLL  ! RelationManager for Transporteur
Access:BulkOverboeking &FileManager,THREAD,EXTERNAL,DLL    ! FileManager for BulkOverboeking
Relate:BulkOverboeking &RelationManager,THREAD,EXTERNAL,DLL ! RelationManager for BulkOverboeking
Access:ArtikelOmschrijvingExtra &FileManager,THREAD,EXTERNAL,DLL ! FileManager for ArtikelOmschrijvingExtra
Relate:ArtikelOmschrijvingExtra &RelationManager,THREAD,EXTERNAL,DLL ! RelationManager for ArtikelOmschrijvingExtra
Access:ArtikelOmschrijvingExtraGroep &FileManager,THREAD,EXTERNAL,DLL ! FileManager for ArtikelOmschrijvingExtraGroep
Relate:ArtikelOmschrijvingExtraGroep &RelationManager,THREAD,EXTERNAL,DLL ! RelationManager for ArtikelOmschrijvingExtraGroep
Access:PalletSoort   &FileManager,THREAD,EXTERNAL,DLL      ! FileManager for PalletSoort
Relate:PalletSoort   &RelationManager,THREAD,EXTERNAL,DLL  ! RelationManager for PalletSoort
Access:CelLocatie    &FileManager,THREAD,EXTERNAL,DLL      ! FileManager for CelLocatie
Relate:CelLocatie    &RelationManager,THREAD,EXTERNAL,DLL  ! RelationManager for CelLocatie
Access:ViewPartijCelLocaties &FileManager,THREAD,EXTERNAL,DLL ! FileManager for ViewPartijCelLocaties
Relate:ViewPartijCelLocaties &RelationManager,THREAD,EXTERNAL,DLL ! RelationManager for ViewPartijCelLocaties
Access:PalletBladSjabloon &FileManager,THREAD,EXTERNAL,DLL ! FileManager for PalletBladSjabloon
Relate:PalletBladSjabloon &RelationManager,THREAD,EXTERNAL,DLL ! RelationManager for PalletBladSjabloon
Access:PalletBladSjabloonCountry &FileManager,THREAD,EXTERNAL,DLL ! FileManager for PalletBladSjabloonCountry
Relate:PalletBladSjabloonCountry &RelationManager,THREAD,EXTERNAL,DLL ! RelationManager for PalletBladSjabloonCountry
Access:RelatieArtikelOmschrijving &FileManager,THREAD,EXTERNAL,DLL ! FileManager for RelatieArtikelOmschrijving
Relate:RelatieArtikelOmschrijving &RelationManager,THREAD,EXTERNAL,DLL ! RelationManager for RelatieArtikelOmschrijving
Access:KostenStamgeg &FileManager,THREAD,EXTERNAL,DLL      ! FileManager for KostenStamgeg
Relate:KostenStamgeg &RelationManager,THREAD,EXTERNAL,DLL  ! RelationManager for KostenStamgeg
Access:DeliveryTerms &FileManager,THREAD,EXTERNAL,DLL      ! FileManager for DeliveryTerms
Relate:DeliveryTerms &RelationManager,THREAD,EXTERNAL,DLL  ! RelationManager for DeliveryTerms
Access:ISOCountries  &FileManager,THREAD,EXTERNAL,DLL      ! FileManager for ISOCountries
Relate:ISOCountries  &RelationManager,THREAD,EXTERNAL,DLL  ! RelationManager for ISOCountries
Access:SSOPCategorie &FileManager,THREAD,EXTERNAL,DLL      ! FileManager for SSOPCategorie
Relate:SSOPCategorie &RelationManager,THREAD,EXTERNAL,DLL  ! RelationManager for SSOPCategorie
Access:SSOPObject    &FileManager,THREAD,EXTERNAL,DLL      ! FileManager for SSOPObject
Relate:SSOPObject    &RelationManager,THREAD,EXTERNAL,DLL  ! RelationManager for SSOPObject
Access:GNCode        &FileManager,THREAD,EXTERNAL,DLL      ! FileManager for GNCode
Relate:GNCode        &RelationManager,THREAD,EXTERNAL,DLL  ! RelationManager for GNCode
Access:GNCodeArtikelen &FileManager,THREAD,EXTERNAL,DLL    ! FileManager for GNCodeArtikelen
Relate:GNCodeArtikelen &RelationManager,THREAD,EXTERNAL,DLL ! RelationManager for GNCodeArtikelen
Access:Havens        &FileManager,THREAD,EXTERNAL,DLL      ! FileManager for Havens
Relate:Havens        &RelationManager,THREAD,EXTERNAL,DLL  ! RelationManager for Havens
Access:Rapporten     &FileManager,THREAD,EXTERNAL,DLL      ! FileManager for Rapporten
Relate:Rapporten     &RelationManager,THREAD,EXTERNAL,DLL  ! RelationManager for Rapporten
Access:ARelatie      &FileManager,THREAD,EXTERNAL,DLL      ! FileManager for ARelatie
Relate:ARelatie      &RelationManager,THREAD,EXTERNAL,DLL  ! RelationManager for ARelatie
Access:AViewArtikel  &FileManager,THREAD,EXTERNAL,DLL      ! FileManager for AViewArtikel
Relate:AViewArtikel  &RelationManager,THREAD,EXTERNAL,DLL  ! RelationManager for AViewArtikel
Access:ACel          &FileManager,THREAD,EXTERNAL,DLL      ! FileManager for ACel
Relate:ACel          &RelationManager,THREAD,EXTERNAL,DLL  ! RelationManager for ACel
Access:AVerpakking   &FileManager,THREAD,EXTERNAL,DLL      ! FileManager for AVerpakking
Relate:AVerpakking   &RelationManager,THREAD,EXTERNAL,DLL  ! RelationManager for AVerpakking
Access:AAARelatie    &FileManager,THREAD,EXTERNAL,DLL      ! FileManager for AAARelatie
Relate:AAARelatie    &RelationManager,THREAD,EXTERNAL,DLL  ! RelationManager for AAARelatie

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
     db.init('VoorrStm',0,50)  ! intiialize the debuger class 
  
!These procedures are used to initialize the DLL. It must be called by the main executable when it starts up
VoorrStm:Init PROCEDURE(<ErrorClass curGlobalErrors>, <INIClass curINIMgr>)
VoorrStm:Init_Called    BYTE,STATIC

  CODE
  IF VoorrStm:Init_Called
     RETURN
  ELSE
     VoorrStm:Init_Called = True
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
  Access:Inkoop.SetErrors(GlobalErrors)
  Access:Planning.SetErrors(GlobalErrors)
  Access:Verkoop.SetErrors(GlobalErrors)
  Access:RelatieAdres.SetErrors(GlobalErrors)
  Access:PalletMutatie.SetErrors(GlobalErrors)
  Access:Transporteur.SetErrors(GlobalErrors)
  Access:BulkOverboeking.SetErrors(GlobalErrors)
  Access:ArtikelOmschrijvingExtra.SetErrors(GlobalErrors)
  Access:ArtikelOmschrijvingExtraGroep.SetErrors(GlobalErrors)
  Access:PalletSoort.SetErrors(GlobalErrors)
  Access:CelLocatie.SetErrors(GlobalErrors)
  Access:ViewPartijCelLocaties.SetErrors(GlobalErrors)
  Access:PalletBladSjabloon.SetErrors(GlobalErrors)
  Access:PalletBladSjabloonCountry.SetErrors(GlobalErrors)
  Access:RelatieArtikelOmschrijving.SetErrors(GlobalErrors)
  Access:KostenStamgeg.SetErrors(GlobalErrors)
  Access:DeliveryTerms.SetErrors(GlobalErrors)
  Access:ISOCountries.SetErrors(GlobalErrors)
  Access:SSOPCategorie.SetErrors(GlobalErrors)
  Access:SSOPObject.SetErrors(GlobalErrors)
  Access:GNCode.SetErrors(GlobalErrors)
  Access:GNCodeArtikelen.SetErrors(GlobalErrors)
  Access:Havens.SetErrors(GlobalErrors)
  Access:Rapporten.SetErrors(GlobalErrors)
  Access:ARelatie.SetErrors(GlobalErrors)
  Access:AViewArtikel.SetErrors(GlobalErrors)
  Access:ACel.SetErrors(GlobalErrors)
  Access:AVerpakking.SetErrors(GlobalErrors)
  Access:AAARelatie.SetErrors(GlobalErrors)

!This procedure is used to shutdown the DLL. It must be called by the main executable before it closes down

VoorrStm:Kill PROCEDURE
VoorrStm:Kill_Called    BYTE,STATIC

  CODE
  IF VoorrStm:Kill_Called
     RETURN
  ELSE
     VoorrStm:Kill_Called = True
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


