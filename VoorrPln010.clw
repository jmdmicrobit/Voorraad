

   MEMBER('VoorrPln.clw')                                  ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABDROPS.INC'),ONCE
   INCLUDE('ABPOPUP.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABUTIL.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('VOORRPLN010.INC'),ONCE        !Local module procedure declarations
                     END


!!! <summary>
!!! Generated from procedure template - Window
!!! Form Verkoop
!!! </summary>
UpdateVerkoop PROCEDURE (PRM:KlantID)

CurrentTab           STRING(80)                            ! 
Loc:RedenRetour      CSTRING(51)                           ! 
Loc:RetourDatum      DATE                                  ! 
ActionMessage        CSTRING(40)                           ! 
Loc:Firmanaam        CSTRING(51)                           ! 
LOC:Gekoppeld        BYTE                                  ! 
Loc:KostKGPrijs      DECIMAL(10,3)                         ! 
Loc:ExtraKosten      DECIMAL(11,3)                         ! 
Loc:TotaalKG         DECIMAL(9,2)                          ! 
Loc:TeFactureren     DECIMAL(7,2)                          ! 
FDCB4::View:FileDropCombo VIEW(ARelatie)
                       PROJECT(AREL:Type)
                       PROJECT(AREL:LotID)
                       PROJECT(AREL:Note)
                       PROJECT(AREL:OpenstaandSaldo)
                       PROJECT(AREL:CreditLine)
                       PROJECT(AREL:DagenOud)
                       PROJECT(AREL:Acc_Man)
                     END
FDCB10::View:FileDropCombo VIEW(RelatieAdres)
                       PROJECT(RAD:Adres1)
                       PROJECT(RAD:Plaats)
                       PROJECT(RAD:Postcode)
                       PROJECT(RAD:Adres2)
                       PROJECT(RAD:ID)
                     END
BRW7::View:Browse    VIEW(Planning)
                       PROJECT(Pla:ArtikelID)
                       PROJECT(Pla:KG)
                       PROJECT(Pla:Pallets)
                       PROJECT(Pla:VerkoopKGPrijs)
                       PROJECT(Pla:MutatieGemaakt)
                       PROJECT(Pla:Verwerkt)
                       PROJECT(Pla:MutatieKG)
                       PROJECT(Pla:MutatiePallets)
                       PROJECT(Pla:OverboekingPlanningID)
                       PROJECT(Pla:PartijID)
                       PROJECT(Pla:Instructie)
                       PROJECT(Pla:Transport)
                       PROJECT(Pla:Memo)
                       PROJECT(Pla:ExtraKosten)
                       PROJECT(Pla:PlanningID)
                       PROJECT(Pla:VerkoopID)
                       PROJECT(Pla:VerpakkingID)
                       PROJECT(Pla:CelID)
                       JOIN(Art:Artikel_PK,Pla:ArtikelID)
                         PROJECT(Art:ArtikelOms)
                         PROJECT(Art:ArtikelID)
                       END
                       JOIN(Ver:Verpakking_PK,Pla:VerpakkingID)
                         PROJECT(Ver:VerpakkingOmschrijving)
                         PROJECT(Ver:VerpakkingID)
                       END
                       JOIN(CEL:CEL_PK,Pla:CelID)
                         PROJECT(CEL:CelOms)
                         PROJECT(CEL:CelID)
                       END
                     END
Queue:Browse         QUEUE                            !Queue declaration for browse/combo box using ?List
Pla:ArtikelID          LIKE(Pla:ArtikelID)            !List box control field - type derived from field
Pla:ArtikelID_NormalFG LONG                           !Normal forground color
Pla:ArtikelID_NormalBG LONG                           !Normal background color
Pla:ArtikelID_SelectedFG LONG                         !Selected forground color
Pla:ArtikelID_SelectedBG LONG                         !Selected background color
Art:ArtikelOms         LIKE(Art:ArtikelOms)           !List box control field - type derived from field
Art:ArtikelOms_NormalFG LONG                          !Normal forground color
Art:ArtikelOms_NormalBG LONG                          !Normal background color
Art:ArtikelOms_SelectedFG LONG                        !Selected forground color
Art:ArtikelOms_SelectedBG LONG                        !Selected background color
Pla:KG                 LIKE(Pla:KG)                   !List box control field - type derived from field
Pla:KG_NormalFG        LONG                           !Normal forground color
Pla:KG_NormalBG        LONG                           !Normal background color
Pla:KG_SelectedFG      LONG                           !Selected forground color
Pla:KG_SelectedBG      LONG                           !Selected background color
Pla:Pallets            LIKE(Pla:Pallets)              !List box control field - type derived from field
Pla:Pallets_NormalFG   LONG                           !Normal forground color
Pla:Pallets_NormalBG   LONG                           !Normal background color
Pla:Pallets_SelectedFG LONG                           !Selected forground color
Pla:Pallets_SelectedBG LONG                           !Selected background color
Pla:VerkoopKGPrijs     LIKE(Pla:VerkoopKGPrijs)       !List box control field - type derived from field
Pla:VerkoopKGPrijs_NormalFG LONG                      !Normal forground color
Pla:VerkoopKGPrijs_NormalBG LONG                      !Normal background color
Pla:VerkoopKGPrijs_SelectedFG LONG                    !Selected forground color
Pla:VerkoopKGPrijs_SelectedBG LONG                    !Selected background color
Loc:KostKGPrijs        LIKE(Loc:KostKGPrijs)          !List box control field - type derived from local data
Loc:KostKGPrijs_NormalFG LONG                         !Normal forground color
Loc:KostKGPrijs_NormalBG LONG                         !Normal background color
Loc:KostKGPrijs_SelectedFG LONG                       !Selected forground color
Loc:KostKGPrijs_SelectedBG LONG                       !Selected background color
Pla:MutatieGemaakt     LIKE(Pla:MutatieGemaakt)       !List box control field - type derived from field
Pla:MutatieGemaakt_NormalFG LONG                      !Normal forground color
Pla:MutatieGemaakt_NormalBG LONG                      !Normal background color
Pla:MutatieGemaakt_SelectedFG LONG                    !Selected forground color
Pla:MutatieGemaakt_SelectedBG LONG                    !Selected background color
Pla:MutatieGemaakt_Icon LONG                          !Entry's icon ID
Pla:Verwerkt           LIKE(Pla:Verwerkt)             !List box control field - type derived from field
Pla:Verwerkt_NormalFG  LONG                           !Normal forground color
Pla:Verwerkt_NormalBG  LONG                           !Normal background color
Pla:Verwerkt_SelectedFG LONG                          !Selected forground color
Pla:Verwerkt_SelectedBG LONG                          !Selected background color
Pla:Verwerkt_Icon      LONG                           !Entry's icon ID
Pla:MutatieKG          LIKE(Pla:MutatieKG)            !List box control field - type derived from field
Pla:MutatieKG_NormalFG LONG                           !Normal forground color
Pla:MutatieKG_NormalBG LONG                           !Normal background color
Pla:MutatieKG_SelectedFG LONG                         !Selected forground color
Pla:MutatieKG_SelectedBG LONG                         !Selected background color
Pla:MutatiePallets     LIKE(Pla:MutatiePallets)       !List box control field - type derived from field
Pla:MutatiePallets_NormalFG LONG                      !Normal forground color
Pla:MutatiePallets_NormalBG LONG                      !Normal background color
Pla:MutatiePallets_SelectedFG LONG                    !Selected forground color
Pla:MutatiePallets_SelectedBG LONG                    !Selected background color
Pla:OverboekingPlanningID LIKE(Pla:OverboekingPlanningID) !List box control field - type derived from field
Pla:OverboekingPlanningID_NormalFG LONG               !Normal forground color
Pla:OverboekingPlanningID_NormalBG LONG               !Normal background color
Pla:OverboekingPlanningID_SelectedFG LONG             !Selected forground color
Pla:OverboekingPlanningID_SelectedBG LONG             !Selected background color
Pla:OverboekingPlanningID_Icon LONG                   !Entry's icon ID
Pla:PartijID           LIKE(Pla:PartijID)             !List box control field - type derived from field
Pla:PartijID_NormalFG  LONG                           !Normal forground color
Pla:PartijID_NormalBG  LONG                           !Normal background color
Pla:PartijID_SelectedFG LONG                          !Selected forground color
Pla:PartijID_SelectedBG LONG                          !Selected background color
CEL:CelOms             LIKE(CEL:CelOms)               !List box control field - type derived from field
CEL:CelOms_NormalFG    LONG                           !Normal forground color
CEL:CelOms_NormalBG    LONG                           !Normal background color
CEL:CelOms_SelectedFG  LONG                           !Selected forground color
CEL:CelOms_SelectedBG  LONG                           !Selected background color
Ver:VerpakkingOmschrijving LIKE(Ver:VerpakkingOmschrijving) !List box control field - type derived from field
Ver:VerpakkingOmschrijving_NormalFG LONG              !Normal forground color
Ver:VerpakkingOmschrijving_NormalBG LONG              !Normal background color
Ver:VerpakkingOmschrijving_SelectedFG LONG            !Selected forground color
Ver:VerpakkingOmschrijving_SelectedBG LONG            !Selected background color
Pla:Instructie         LIKE(Pla:Instructie)           !List box control field - type derived from field
Pla:Instructie_NormalFG LONG                          !Normal forground color
Pla:Instructie_NormalBG LONG                          !Normal background color
Pla:Instructie_SelectedFG LONG                        !Selected forground color
Pla:Instructie_SelectedBG LONG                        !Selected background color
Pla:Transport          LIKE(Pla:Transport)            !List box control field - type derived from field
Pla:Transport_NormalFG LONG                           !Normal forground color
Pla:Transport_NormalBG LONG                           !Normal background color
Pla:Transport_SelectedFG LONG                         !Selected forground color
Pla:Transport_SelectedBG LONG                         !Selected background color
Pla:Memo               LIKE(Pla:Memo)                 !List box control field - type derived from field
Pla:Memo_NormalFG      LONG                           !Normal forground color
Pla:Memo_NormalBG      LONG                           !Normal background color
Pla:Memo_SelectedFG    LONG                           !Selected forground color
Pla:Memo_SelectedBG    LONG                           !Selected background color
Pla:ExtraKosten        LIKE(Pla:ExtraKosten)          !Browse hot field - type derived from field
Pla:PlanningID         LIKE(Pla:PlanningID)           !Primary key field - type derived from field
Pla:VerkoopID          LIKE(Pla:VerkoopID)            !Browse key field - type derived from field
Art:ArtikelID          LIKE(Art:ArtikelID)            !Related join file key field - type derived from field
Ver:VerpakkingID       LIKE(Ver:VerpakkingID)         !Related join file key field - type derived from field
CEL:CelID              LIKE(CEL:CelID)                !Related join file key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
BRW12::View:Browse   VIEW(KostenStamgeg)
                       PROJECT(Kos:Omschrijving)
                       PROJECT(Kos:Soort)
                       PROJECT(Kos:Prijs)
                       PROJECT(Kos:KostenID)
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?ListExtraKosten
Kos:Omschrijving       LIKE(Kos:Omschrijving)         !List box control field - type derived from field
Ext:Aantal             LIKE(Ext:Aantal)               !List box control field - type derived from field
Ext:Prijs              LIKE(Ext:Prijs)                !List box control field - type derived from field
Ext:ExtraKosten        LIKE(Ext:ExtraKosten)          !List box control field - type derived from field
Kos:Soort              LIKE(Kos:Soort)                !Browse hot field - type derived from field
Kos:Prijs              LIKE(Kos:Prijs)                !Browse hot field - type derived from field
Kos:KostenID           LIKE(Kos:KostenID)             !Browse hot field - type derived from field
Ver2:RedenRetour       LIKE(Ver2:RedenRetour)         !Browse hot field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
FDB14::View:FileDrop VIEW(DeliveryTerms)
                       PROJECT(DLT:Omschrijving)
                       PROJECT(DLT:DeliveryTermsID)
                     END
FDB15::View:FileDrop VIEW(Gebruiker)
                       PROJECT(Geb:VolledigeNaam)
                       PROJECT(Geb:ID)
                     END
Queue:FileDropCombo  QUEUE                            !
Loc:Firmanaam          LIKE(Loc:Firmanaam)            !List box control field - type derived from local data
AREL:Type              LIKE(AREL:Type)                !Browse hot field - type derived from field
AREL:LotID             LIKE(AREL:LotID)               !Browse hot field - type derived from field
AREL:Note              LIKE(AREL:Note)                !Browse hot field - type derived from field
AREL:OpenstaandSaldo   LIKE(AREL:OpenstaandSaldo)     !Browse hot field - type derived from field
AREL:CreditLine        LIKE(AREL:CreditLine)          !Browse hot field - type derived from field
AREL:DagenOud          LIKE(AREL:DagenOud)            !Browse hot field - type derived from field
AREL:Acc_Man           LIKE(AREL:Acc_Man)             !Browse hot field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
Queue:FileDropCombo:1 QUEUE                           !
RAD:Adres1             LIKE(RAD:Adres1)               !List box control field - type derived from field
RAD:Plaats             LIKE(RAD:Plaats)               !List box control field - type derived from field
RAD:Postcode           LIKE(RAD:Postcode)             !List box control field - type derived from field
RAD:Adres2             LIKE(RAD:Adres2)               !List box control field - type derived from field
RAD:ID                 LIKE(RAD:ID)                   !Primary key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
Queue:FileDrop       QUEUE                            !
DLT:Omschrijving       LIKE(DLT:Omschrijving)         !List box control field - type derived from field
DLT:DeliveryTermsID    LIKE(DLT:DeliveryTermsID)      !Primary key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
Queue:FileDrop:1     QUEUE                            !
Geb:VolledigeNaam      LIKE(Geb:VolledigeNaam)        !List box control field - type derived from field
Geb:ID                 LIKE(Geb:ID)                   !Primary key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
LocEnableEnterByTab  BYTE(1)                               !Used by the ENTER Instead of Tab template
EnterByTabManager    EnterByTabClass
History::Ver2:Record LIKE(Ver2:RECORD),THREAD
NetLocalRefreshDate     Long     ! NetTalk (NetRefresh)
NetLocalRefreshTime     Long
NetLocalDependancies    String('|Verkoop|AAARelatie|ARelatie|RelatieAdres|Planning|ViewArtikel|Verpakking|Cel|KostenStamgeg|DeliveryTerms|Gebruiker|')
QuickWindow          WINDOW('Verkoop'),AT(,,733,428),FONT('MS Sans Serif',8,,,CHARSET:DEFAULT),RESIZE,CENTER,GRAY, |
  IMM,MAX,MDI,HLP('UpdateInkoop'),SYSTEM
                       PROMPT('Klant:'),AT(5,30),USE(?Ink:Leverancier:Prompt),TRN
                       COMBO(@s50),AT(72,31,285,10),USE(Loc:Firmanaam),DROP(25),FORMAT('200L(2)|M@s50@'),FROM(Queue:FileDropCombo), |
  REQ
                       BUTTON('...'),AT(361,30,23),USE(?LookupButton),ICON('ÿ<01H>')
                       BUTTON('Notitie'),AT(396,30,63),USE(?Note),RIGHT,HIDE
                       CHECK('Verwerkt'),AT(469,32),USE(Ver2:Verwerkt),DISABLE
                       BUTTON('Order retour boeken'),AT(520,30,178,14),USE(?BtnRetour),HIDE
                       PROMPT('Afwijkend losadres:'),AT(5,45),USE(?PROMPT1)
                       COMBO(@s100),AT(72,45,285,10),USE(RAD:Adres1),DROP(5),FORMAT('100L(2)|M~Naam~C(0)@s100@' & |
  '100L(2)|M~Plaats~C(0)@s100@40L(2)|M~Postcode~C(0)@s10@100L(2)|M~Adres 2~C(0)@s100@'),FROM(Queue:FileDropCombo:1), |
  IMM
                       BUTTON('Bevestiging Negatieve order/regel'),AT(552,46,147),USE(?BTNNegatieveOrder)
                       PROMPT('Planning Datum:'),AT(5,60),USE(?Ver2:Planning_DATE:Prompt)
                       SPIN(@d6-),AT(72,61,60,10),USE(Ver2:Planning_DATE,,?Ver2:Planning_DATE:2)
                       BUTTON('...'),AT(137,60,12,12),USE(?Calendar)
                       PROMPT('Planning Tijd:'),AT(160,61),USE(?Ink:Planning_TIME:Prompt),TRN
                       ENTRY(@t7),AT(228,61,60,10),USE(Ver2:Planning_TIME)
                       PROMPT('Valuta:'),AT(324,61),USE(?Ver2:Valuta:Prompt)
                       LIST,AT(365,61,76,10),USE(Ver2:Valuta),DROP(3),FROM('Euro|#Euro|Dollar|#Dollar|Pond|#Pond')
                       PROMPT('Koersverschil:'),AT(449,45),USE(?Ver2:Koersverschil:Prompt)
                       ENTRY(@n-15`3),AT(499,61,60,10),USE(Ver2:Koersverschil),RIGHT(2)
                       PROMPT('Confirmation Date :'),AT(5,74),USE(?Ver2:ConfirmationDate_DATE:Prompt)
                       ENTRY(@d6-),AT(73,76,60,10),USE(Ver2:ConfirmationDate_DATE)
                       STRING('Verkoper:'),AT(160,76),USE(?STRING2)
                       LIST,AT(229,74,149,13),USE(Geb:VolledigeNaam),DROP(25),FORMAT('200L(2)|M~Volledige Naam' & |
  '~L(0)@s50@'),FROM(Queue:FileDrop:1)
                       PROMPT('Delivery Terms:'),AT(449,77),USE(?PROMPT3)
                       LIST,AT(499,77,147,10),USE(DLT:Omschrijving),DROP(25),FORMAT('240L(2)|M~Omschrijving~L(0)@s60@'), |
  FROM(Queue:FileDrop)
                       PROMPT('Externe Verkoop-ID:'),AT(5,90),USE(?Ver2:ExternVerkoopID:Prompt)
                       ENTRY(@s50),AT(72,91,206,10),USE(Ver2:ExternVerkoopID)
                       PROMPT('Instructie:'),AT(5,102),USE(?Ink:Instructie:Prompt),HIDE,TRN
                       ENTRY(@s100),AT(72,103,285,10),USE(Ver2:Instructie),HIDE
                       PROMPT('Transport:'),AT(449,102,37),USE(?Ink:Transport:Prompt),HIDE,TRN
                       ENTRY(@s100),AT(499,103,168,10),USE(Ver2:Transport),HIDE
                       LIST,AT(6,116,309,56),USE(?ListExtraKosten),ALRT(MouseLeft2),FORMAT('169L(2)|M~Extra Ko' & |
  'sten~@s60@45L(2)|M~Aantal~R(2)@n12_`2@41L(2)|M~Prijs~R(2)@n-15.3@64L(2)|M~Extra Kost' & |
  'en~R(2)@n-15.3@'),FROM(Queue:Browse:1),IMM
                       PROMPT('Extra Kosten:'),AT(449,101),USE(?Ver2:ExtraKosten:Prompt),HIDE
                       TEXT,AT(499,100,224,45),USE(Ver2:ExtraKostenTekst),VSCROLL,BOXED,HIDE
                       LIST,AT(6,175,717,207),USE(?List),HVSCROLL,FORMAT('[40L(2)|*~ID~C(0)@s30@120L(2)|*~Omsc' & |
  'hrijving~C(0)@s60@]|~Artikel~57R(2)|*~KG~C(0)@n-15`2@29R(2)|*~Pallets~C(0)@n4.@56R(2' & |
  ')|*~Verkoop KG-Prijs~C(0)@n-13`3@54R(2)|*~Kost KG-prijs~@n-14`3@[30L(2)|*I~Mutatie~C' & |
  '(0)@p p@33L(2)|*I~Verwerkt~C(0)@p p@36R(2)|M*~KG~R(1)@n9`2@30R(2)|M*~Pallets~R(1)@n4' & |
  '@](125)|~Uitslaan~40L(2)|*I~Gekoppeld~C(1)@p p@30R(2)|*~Partij~C(0)@n_10@30L(2)|*~Ce' & |
  'l~C(0)@s50@60L(2)|*~Verpakking~C(0)@s50@100L(2)|*~Instructie~C(0)@s100@100L(2)|*~Tra' & |
  'nsport~C(0)@s100@100L(2)|*~Memo~C(0)@s100@'),FROM(Queue:Browse),IMM
                       BUTTON('&Toevoegen'),AT(417,408,70,17),USE(?Insert)
                       BUTTON('&Wijzigen'),AT(489,408,42,17),USE(?Change)
                       BUTTON('&Verwijderen'),AT(537,408,53,17),USE(?Delete)
                       STRING('Benodigd voor het printen van de palletbladen en export naar Exact.'),AT(284,91),USE(?STRING1), |
  FONT('Microsoft Sans Serif',,,FONT:regular+FONT:italic)
                       PROMPT('Verkoop:'),AT(5,17,61,10),USE(?PROMPT2)
                       STRING(@n_10),AT(71,18),USE(Ver2:VerkoopID),FONT('Microsoft Sans Serif',,,FONT:bold)
                       STRING(@n-11.2),AT(329,18,44),USE(AREL:OpenstaandSaldo),FONT('Microsoft Sans Serif',,,FONT:bold), |
  RIGHT
                       STRING(@n-11.2),AT(253,18),USE(AREL:CreditLine),FONT('Microsoft Sans Serif',,,FONT:bold)
                       STRING('Kredietlimiet:'),AT(208,18),USE(?STRING3)
                       STRING('Saldo:'),AT(305,18,22,10),USE(?STRING3:2)
                       BUTTON,AT(373,0),USE(?Waarschuwing),FLAT
                       BUTTON('&View'),AT(365,408,42,17),USE(?View)
                       STRING('Te factureren:'),AT(377,18,49,10),USE(?STRING3:3)
                       STRING(@n-10`2),AT(428,18,44),USE(Loc:TeFactureren),FONT('Microsoft Sans Serif',,,FONT:bold), |
  RIGHT
                       BUTTON('+'),AT(361,45,23),USE(?VoegToeAdres)
                       BUTTON('&OK'),AT(615,410,49,14),USE(?OK),LEFT,ICON('WAOK.ICO'),DEFAULT,FLAT,MSG('Accept dat' & |
  'a and close the window'),TIP('Accept data and close the window')
                       BUTTON('&Annuleren'),AT(667,410,61,14),USE(?Cancel),LEFT,ICON('WACANCEL.ICO'),FLAT,MSG('Cancel operation'), |
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
Reset                  PROCEDURE(BYTE Force=0),DERIVED
Run                    PROCEDURE(),BYTE,PROC,DERIVED
Run                    PROCEDURE(USHORT Number,BYTE Request),BYTE,PROC,DERIVED
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED
TakeCloseEvent         PROCEDURE(),BYTE,PROC,DERIVED
TakeCompleted          PROCEDURE(),BYTE,PROC,DERIVED
TakeEvent              PROCEDURE(),BYTE,PROC,DERIVED
TakeFieldEvent         PROCEDURE(),BYTE,PROC,DERIVED
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
FDCB4                CLASS(FileDropComboClass)             ! File drop combo manager
Q                      &Queue:FileDropCombo           !Reference to browse queue type
SetQueueRecord         PROCEDURE(),DERIVED
                     END

FDCB10               CLASS(FileDropComboClass)             ! File drop combo manager
Q                      &Queue:FileDropCombo:1         !Reference to browse queue type
                     END

BRW7                 CLASS(BrowseClass)                    ! Browse using ?List
Q                      &Queue:Browse                  !Reference to browse queue
Ask                    PROCEDURE(BYTE Request),BYTE,PROC,DERIVED
Fetch                  PROCEDURE(BYTE Direction),DERIVED
Init                   PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)
ResetFromView          PROCEDURE(),DERIVED
SetQueueRecord         PROCEDURE(),DERIVED
                     END

BRW7::Sort0:Locator  StepLocatorClass                      ! Default Locator
BRW12                CLASS(BrowseClass)                    ! Browse using ?ListExtraKosten
Q                      &Queue:Browse:1                !Reference to browse queue
ResetFromView          PROCEDURE(),DERIVED
SetQueueRecord         PROCEDURE(),DERIVED
                     END

BRW12::Sort0:Locator StepLocatorClass                      ! Default Locator
Resizer              CLASS(WindowResizeClass)
Init                   PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)
                     END

Calendar8            CalendarClass
FDB14                CLASS(FileDropClass)                  ! File drop manager
Q                      &Queue:FileDrop                !Reference to display queue
                     END

FDB15                CLASS(FileDropClass)                  ! File drop manager
Q                      &Queue:FileDrop:1              !Reference to display queue
                     END

LocalClass          CLASS
NegatieveOrder          Procedure, BYTE
                    END
SAVAREL:Record  LIKE(AREL:Record)
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
UpdateVerwerkStatus    ROUTINE
	Verwerkt# = true
	NoRecord# = true
	
	Pla:VerkoopID = Ver2:VerkoopID
	CLEAR(Pla:PlanningID,-1)
	SET(Pla:Planning_FK02,Pla:Planning_FK02)
	LOOP
		Access:Planning.TryNext()
		IF ERROR() THEN BREAK.
		
		IF Pla:VerkoopID <> Ver2:VerkoopID THEN BREAK.
		
		NoRecord# = false
		
		IF NOT(Pla:Verwerkt)
			Verwerkt# = false
			BREAK
		.
    .
       
	IF NOT(NoRecord#)
		Ver2:Verwerkt = Verwerkt# 
		
		Access:Verkoop.TryUpdate()
		IF ERROR() THEN
			  IF ERRORCODE() = 90 THEN
				  MESSAGE('Verkoop-record kon niet worden bijgewerkt | SQL Error('&FILEERRORCODE()&'):'&FILEERROR()&')')
			  ELSE
				  MESSAGE('Verkoop-record kon niet worden bijgewerkt | Error('&ERRORCODE()&'):'&ERROR()&')')
			.
		.
	.
BepaaldNogTefactureren      ROUTINE
    CLEAR(Loc:TeFactureren)
    IF Ver2:Klant
        ClEAR(AVE:Record)
        AVE:Klant=Ver2:Klant
        SET(AVE:Klant_Verwerkt_Planning_K,AVE:Klant_Verwerkt_Planning_K)
        AVerkoop{PROP:Where}='Exported is NULL'
        LOOP UNTIL Access:AVerkoop.Next()
            IF NOT (AVE:Exported=0 AND AVE:Klant=Ver2:Klant) THEN BREAK.
            Loc:TeFactureren+=AVE:ExtraKosten
            Clear(APla:Record)
            APla:VerkoopID=AVE:VerkoopID
            Set(APla:Planning_FK02,APla:Planning_FK02)
            Loop UNtil Access:APlanning.Next()
                IF NOT APla:VerkoopID=AVE:VerkoopID THEN BREAK.
                Loc:TeFactureren+=APLA:VerkoopKGPrijs*APla:KG
            END
        END
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


ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('UpdateVerkoop')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Ink:Leverancier:Prompt
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('Loc:KostKGPrijs',Loc:KostKGPrijs)                  ! Added by: BrowseBox(ABC)
  BIND('Pla:PlanningID',Pla:PlanningID)                    ! Added by: BrowseBox(ABC)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
  SELF.AddUpdateFile(Access:Verkoop)
  SELF.HistoryKey = CtrlH
  SELF.AddHistoryFile(Ver2:Record,History::Ver2:Record)
  SELF.AddHistoryField(?Ver2:Verwerkt,3)
  SELF.AddHistoryField(?Ver2:Planning_DATE:2,6)
  SELF.AddHistoryField(?Ver2:Planning_TIME,7)
  SELF.AddHistoryField(?Ver2:Valuta,31)
  SELF.AddHistoryField(?Ver2:Koersverschil,32)
  SELF.AddHistoryField(?Ver2:ConfirmationDate_DATE,18)
  SELF.AddHistoryField(?Ver2:ExternVerkoopID,13)
  SELF.AddHistoryField(?Ver2:Instructie,8)
  SELF.AddHistoryField(?Ver2:Transport,9)
  SELF.AddHistoryField(?Ver2:ExtraKostenTekst,12)
  SELF.AddHistoryField(?Ver2:VerkoopID,1)
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  Relate:AMutatie.Open                                     ! File AMutatie used by this procedure, so make sure it's RelationManager is open
  Relate:APlanning.Open                                    ! File APlanning used by this procedure, so make sure it's RelationManager is open
  Relate:ARelatie.Open                                     ! File ARelatie used by this procedure, so make sure it's RelationManager is open
  Relate:AVerkoop.Open                                     ! File AVerkoop used by this procedure, so make sure it's RelationManager is open
  Relate:DeliveryTerms.Open                                ! File DeliveryTerms used by this procedure, so make sure it's RelationManager is open
  Relate:ExtraKosten.Open                                  ! File ExtraKosten used by this procedure, so make sure it's RelationManager is open
  Relate:Gebruiker.Open                                    ! File Gebruiker used by this procedure, so make sure it's RelationManager is open
  Relate:Inkoop.SetOpenRelated()
  Relate:Inkoop.Open                                       ! File Inkoop used by this procedure, so make sure it's RelationManager is open
  Relate:KostenStamgeg.Open                                ! File KostenStamgeg used by this procedure, so make sure it's RelationManager is open
  Relate:Mutatie.Open                                      ! File Mutatie used by this procedure, so make sure it's RelationManager is open
  Relate:Partij.Open                                       ! File Partij used by this procedure, so make sure it's RelationManager is open
  Relate:RelatieAdres.Open                                 ! File RelatieAdres used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Primary &= Relate:Verkoop
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
  If Self.Request = InsertRecord then
      Ver2:Planning_DATE = today()
      Ver2:ConfirmationDate_DATE = today()
      Ver2:GebruikerID=IGB:GebruikerID
      Ver2:Klant = PRM:KlantID
      
      Ver2:Exported=FALSE
      
      CLEAR(ARel:Record)
      ARel:RelatieID = PRM:KlantID
      Access:ARelatie.TryFetch(ARel:Relatie_PK)
      ! standaard vertegenwoordiger overnemen
      Clear(GEB:Record)
      Geb:res_id=Arel:Acc_Man
      if Access:Gebruiker.Fetch(Geb:FK2_Gebruiker)=Level:Benign
          Ver2:GebruikerID=Geb:ID
      END
      
      
      CLEAR(RAD:Record)
  ELSIF Self.Request = ChangeRecord THEN
      CLEAR(RAD:Record)
      RAD:ID = Ver2:KlantAlternatiefAdres
      IF Access:RelatieAdres.Fetch(RAD:PK_RelatieAdres) <> Level:Benign THEN
          CLEAR(RAD:Record)
      END
      CLEAR(ARel:Record)
      ARel:RelatieID = Ver2:Klant
      Access:ARelatie.TryFetch(ARel:Relatie_PK)
      
  END
  BRW7.Init(?List,Queue:Browse.ViewPosition,BRW7::View:Browse,Queue:Browse,Relate:Planning,SELF) ! Initialize the browse manager
  BRW12.Init(?ListExtraKosten,Queue:Browse:1.ViewPosition,BRW12::View:Browse,Queue:Browse:1,Relate:KostenStamgeg,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  IF (IGB:BekijkenPrijzen <> 1) THEN
  	!HIDE(?Ver2:ExtraKosten)
      HIDE(?Ver2:ExtraKosten:Prompt)
      HIDE(?Ver2:ExtraKostenTekst)
      ?List{PROPLIST:Width, 5} = 0
      HIDE(?ListExtraKosten)       ! Extra Kosten
  END
  
  IF GLO:HidePlanningInstructie = 1 THEN
      ?List{PROPLIST:Width, 13} = 0 
  END    
  IF Ver2:BevestigingGeprint_DATE
      DISABLE(?Ver2:ConfirmationDate_DATE)  
      IF Ver2:GebruikerID
          DISABLE(?Geb:VolledigeNaam)
      END
  END
  
  
  LocalClass.NegatieveOrder()
  IF Ver2:Verwerkt=1
      UNHIDE(?BtnRetour)
      IF Ver2:RedenRetour = ''
          ?BtnRetour{Prop:Text}='Retour boeken:'
      ELSE
      !    DISABLE(?BtnRetour)
          ?BtnRetour{Prop:Text}='Retour reden:'&Ver2:RedenRetour&' '&Format(Ver2:RetourDatum_DATE,@d5-)
      END
      
  ELSE
      HIDE(?BtnRetour)
  END
  Do BepaaldNogTefactureren
  
  
  !Clear(GEB:Record)
  !Geb:ID=IGB:GebruikerID
  !if Access:Gebruiker.Fetch(Geb:PK_Gebruiker)=Level:Benign
  !END
  
  WinAlertMouseZoom()
  Do DefineListboxStyle
  IF SELF.Request = ViewRecord                             ! Configure controls for View Only mode
    DISABLE(?Loc:Firmanaam)
    DISABLE(?LookupButton)
    DISABLE(?Note)
    DISABLE(?RAD:Adres1)
    DISABLE(?Ver2:Planning_DATE:2)
    DISABLE(?Calendar)
    DISABLE(?Ver2:Planning_TIME)
    DISABLE(?Ver2:Valuta)
    ?Ver2:Koersverschil{PROP:ReadOnly} = True
    ?Ver2:ConfirmationDate_DATE{PROP:ReadOnly} = True
    DISABLE(?Geb:VolledigeNaam)
    DISABLE(?DLT:Omschrijving)
    DISABLE(?Ver2:ExternVerkoopID)
    DISABLE(?Ver2:Instructie)
    DISABLE(?Ver2:Transport)
    DISABLE(?Ver2:ExtraKostenTekst)
    HIDE(?Insert)
    HIDE(?Change)
    HIDE(?Delete)
    DISABLE(?Waarschuwing)
    DISABLE(?VoegToeAdres)
  END
  BRW7.Q &= Queue:Browse
  BRW7.FileLoaded = 1                                      ! This is a 'file loaded' browse
  BRW7.AddSortOrder(,Pla:Planning_FK02)                    ! Add the sort order for Pla:Planning_FK02 for sort order 1
  BRW7.AddRange(Pla:VerkoopID,Ver2:VerkoopID)              ! Add single value range limit for sort order 1
  BRW7.AddLocator(BRW7::Sort0:Locator)                     ! Browse has a locator for sort order 1
  BRW7::Sort0:Locator.Init(,Pla:PlanningID,,BRW7)          ! Initialize the browse locator using  using key: Pla:Planning_FK02 , Pla:PlanningID
  ?List{PROP:IconList,1} = '~off.ico'
  ?List{PROP:IconList,2} = '~on.ico'
  BRW7.AddField(Pla:ArtikelID,BRW7.Q.Pla:ArtikelID)        ! Field Pla:ArtikelID is a hot field or requires assignment from browse
  BRW7.AddField(Art:ArtikelOms,BRW7.Q.Art:ArtikelOms)      ! Field Art:ArtikelOms is a hot field or requires assignment from browse
  BRW7.AddField(Pla:KG,BRW7.Q.Pla:KG)                      ! Field Pla:KG is a hot field or requires assignment from browse
  BRW7.AddField(Pla:Pallets,BRW7.Q.Pla:Pallets)            ! Field Pla:Pallets is a hot field or requires assignment from browse
  BRW7.AddField(Pla:VerkoopKGPrijs,BRW7.Q.Pla:VerkoopKGPrijs) ! Field Pla:VerkoopKGPrijs is a hot field or requires assignment from browse
  BRW7.AddField(Loc:KostKGPrijs,BRW7.Q.Loc:KostKGPrijs)    ! Field Loc:KostKGPrijs is a hot field or requires assignment from browse
  BRW7.AddField(Pla:MutatieGemaakt,BRW7.Q.Pla:MutatieGemaakt) ! Field Pla:MutatieGemaakt is a hot field or requires assignment from browse
  BRW7.AddField(Pla:Verwerkt,BRW7.Q.Pla:Verwerkt)          ! Field Pla:Verwerkt is a hot field or requires assignment from browse
  BRW7.AddField(Pla:MutatieKG,BRW7.Q.Pla:MutatieKG)        ! Field Pla:MutatieKG is a hot field or requires assignment from browse
  BRW7.AddField(Pla:MutatiePallets,BRW7.Q.Pla:MutatiePallets) ! Field Pla:MutatiePallets is a hot field or requires assignment from browse
  BRW7.AddField(Pla:OverboekingPlanningID,BRW7.Q.Pla:OverboekingPlanningID) ! Field Pla:OverboekingPlanningID is a hot field or requires assignment from browse
  BRW7.AddField(Pla:PartijID,BRW7.Q.Pla:PartijID)          ! Field Pla:PartijID is a hot field or requires assignment from browse
  BRW7.AddField(CEL:CelOms,BRW7.Q.CEL:CelOms)              ! Field CEL:CelOms is a hot field or requires assignment from browse
  BRW7.AddField(Ver:VerpakkingOmschrijving,BRW7.Q.Ver:VerpakkingOmschrijving) ! Field Ver:VerpakkingOmschrijving is a hot field or requires assignment from browse
  BRW7.AddField(Pla:Instructie,BRW7.Q.Pla:Instructie)      ! Field Pla:Instructie is a hot field or requires assignment from browse
  BRW7.AddField(Pla:Transport,BRW7.Q.Pla:Transport)        ! Field Pla:Transport is a hot field or requires assignment from browse
  BRW7.AddField(Pla:Memo,BRW7.Q.Pla:Memo)                  ! Field Pla:Memo is a hot field or requires assignment from browse
  BRW7.AddField(Pla:ExtraKosten,BRW7.Q.Pla:ExtraKosten)    ! Field Pla:ExtraKosten is a hot field or requires assignment from browse
  BRW7.AddField(Pla:PlanningID,BRW7.Q.Pla:PlanningID)      ! Field Pla:PlanningID is a hot field or requires assignment from browse
  BRW7.AddField(Pla:VerkoopID,BRW7.Q.Pla:VerkoopID)        ! Field Pla:VerkoopID is a hot field or requires assignment from browse
  BRW7.AddField(Art:ArtikelID,BRW7.Q.Art:ArtikelID)        ! Field Art:ArtikelID is a hot field or requires assignment from browse
  BRW7.AddField(Ver:VerpakkingID,BRW7.Q.Ver:VerpakkingID)  ! Field Ver:VerpakkingID is a hot field or requires assignment from browse
  BRW7.AddField(CEL:CelID,BRW7.Q.CEL:CelID)                ! Field CEL:CelID is a hot field or requires assignment from browse
  BRW12.Q &= Queue:Browse:1
  BRW12.AddSortOrder(,Kos:PK_KostenStamgeg)                ! Add the sort order for Kos:PK_KostenStamgeg for sort order 1
  BRW12.AddLocator(BRW12::Sort0:Locator)                   ! Browse has a locator for sort order 1
  BRW12::Sort0:Locator.Init(,Kos:KostenID,,BRW12)          ! Initialize the browse locator using  using key: Kos:PK_KostenStamgeg , Kos:KostenID
  BRW12.SetFilter('(Kos:Soort=''O'' OR (Kos:Soort=''R'' AND Ver2:RedenRetour<<>''''))') ! Apply filter expression to browse
  BRW12.AddField(Kos:Omschrijving,BRW12.Q.Kos:Omschrijving) ! Field Kos:Omschrijving is a hot field or requires assignment from browse
  BRW12.AddField(Ext:Aantal,BRW12.Q.Ext:Aantal)            ! Field Ext:Aantal is a hot field or requires assignment from browse
  BRW12.AddField(Ext:Prijs,BRW12.Q.Ext:Prijs)              ! Field Ext:Prijs is a hot field or requires assignment from browse
  BRW12.AddField(Ext:ExtraKosten,BRW12.Q.Ext:ExtraKosten)  ! Field Ext:ExtraKosten is a hot field or requires assignment from browse
  BRW12.AddField(Kos:Soort,BRW12.Q.Kos:Soort)              ! Field Kos:Soort is a hot field or requires assignment from browse
  BRW12.AddField(Kos:Prijs,BRW12.Q.Kos:Prijs)              ! Field Kos:Prijs is a hot field or requires assignment from browse
  BRW12.AddField(Kos:KostenID,BRW12.Q.Kos:KostenID)        ! Field Kos:KostenID is a hot field or requires assignment from browse
  BRW12.AddField(Ver2:RedenRetour,BRW12.Q.Ver2:RedenRetour) ! Field Ver2:RedenRetour is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface)                        ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  FDCB4.Init(Loc:Firmanaam,?Loc:Firmanaam,Queue:FileDropCombo.ViewPosition,FDCB4::View:FileDropCombo,Queue:FileDropCombo,Relate:ARelatie,ThisWindow,GlobalErrors,0,0,0)
  FDCB4.RemoveDuplicatesFlag = TRUE
  FDCB4.Q &= Queue:FileDropCombo
  FDCB4.AddSortOrder(AREL:Relatie_FK01)
  FDCB4.SetFilter('arel:type=''C''')
  FDCB4.AddField(Loc:Firmanaam,FDCB4.Q.Loc:Firmanaam) !List box control field - type derived from local data
  FDCB4.AddField(AREL:Type,FDCB4.Q.AREL:Type) !Browse hot field - type derived from field
  FDCB4.AddField(AREL:LotID,FDCB4.Q.AREL:LotID) !Browse hot field - type derived from field
  FDCB4.AddField(AREL:Note,FDCB4.Q.AREL:Note) !Browse hot field - type derived from field
  FDCB4.AddField(AREL:OpenstaandSaldo,FDCB4.Q.AREL:OpenstaandSaldo) !Browse hot field - type derived from field
  FDCB4.AddField(AREL:CreditLine,FDCB4.Q.AREL:CreditLine) !Browse hot field - type derived from field
  FDCB4.AddField(AREL:DagenOud,FDCB4.Q.AREL:DagenOud) !Browse hot field - type derived from field
  FDCB4.AddField(AREL:Acc_Man,FDCB4.Q.AREL:Acc_Man) !Browse hot field - type derived from field
  FDCB4.AddUpdateField(AREL:RelatieID,Ver2:Klant)
  ThisWindow.AddItem(FDCB4.WindowComponent)
  FDCB4.DefaultFill = 0
  FDCB10.Init(RAD:Adres1,?RAD:Adres1,Queue:FileDropCombo:1.ViewPosition,FDCB10::View:FileDropCombo,Queue:FileDropCombo:1,Relate:RelatieAdres,ThisWindow,GlobalErrors,0,0,0)
  FDCB10.Q &= Queue:FileDropCombo:1
  FDCB10.AddSortOrder(RAD:RelatieID_ID_K)
  FDCB10.AddRange(RAD:RelatieID,Ver2:Klant)
  FDCB10.AddField(RAD:Adres1,FDCB10.Q.RAD:Adres1) !List box control field - type derived from field
  FDCB10.AddField(RAD:Plaats,FDCB10.Q.RAD:Plaats) !List box control field - type derived from field
  FDCB10.AddField(RAD:Postcode,FDCB10.Q.RAD:Postcode) !List box control field - type derived from field
  FDCB10.AddField(RAD:Adres2,FDCB10.Q.RAD:Adres2) !List box control field - type derived from field
  FDCB10.AddField(RAD:ID,FDCB10.Q.RAD:ID) !Primary key field - type derived from field
  FDCB10.AddUpdateField(RAD:ID,Ver2:KlantAlternatiefAdres)
  ThisWindow.AddItem(FDCB10.WindowComponent)
  FDCB10.DefaultFill = 0
  BRW7.AskProcedure = 1                                    ! Will call: UpdatePlanningVerkoop
  FDB14.Init(?DLT:Omschrijving,Queue:FileDrop.ViewPosition,FDB14::View:FileDrop,Queue:FileDrop,Relate:DeliveryTerms,ThisWindow)
  FDB14.Q &= Queue:FileDrop
  FDB14.AddSortOrder(DLT:PK_DeliveryTerms)
  FDB14.AddField(DLT:Omschrijving,FDB14.Q.DLT:Omschrijving) !List box control field - type derived from field
  FDB14.AddField(DLT:DeliveryTermsID,FDB14.Q.DLT:DeliveryTermsID) !Primary key field - type derived from field
  FDB14.AddUpdateField(DLT:DeliveryTermsID,Ver2:DeliveryTermsID)
  ThisWindow.AddItem(FDB14.WindowComponent)
  FDB14.DefaultFill = 0
  FDB15.Init(?Geb:VolledigeNaam,Queue:FileDrop:1.ViewPosition,FDB15::View:FileDrop,Queue:FileDrop:1,Relate:Gebruiker,ThisWindow)
  FDB15.Q &= Queue:FileDrop:1
  FDB15.AddSortOrder(Geb:FK1_Gebruiker)
  FDB15.SetFilter('Geb:VolledigeNaam<<>''''')
  FDB15.AddField(Geb:VolledigeNaam,FDB15.Q.Geb:VolledigeNaam) !List box control field - type derived from field
  FDB15.AddField(Geb:ID,FDB15.Q.Geb:ID) !Primary key field - type derived from field
  FDB15.AddUpdateField(Geb:ID,Ver2:GebruikerID)
  ThisWindow.AddItem(FDB15.WindowComponent)
  FDB15.DefaultFill = 0
  BRW7.AddToolbarTarget(Toolbar)                           ! Browse accepts toolbar control
  BRW12.AddToolbarTarget(Toolbar)                          ! Browse accepts toolbar control
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
    Relate:AMutatie.Close
    Relate:APlanning.Close
    Relate:ARelatie.Close
    Relate:AVerkoop.Close
    Relate:DeliveryTerms.Close
    Relate:ExtraKosten.Close
    Relate:Gebruiker.Close
    Relate:Inkoop.Close
    Relate:KostenStamgeg.Close
    Relate:Mutatie.Close
    Relate:Partij.Close
    Relate:RelatieAdres.Close
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.PrimeUpdate PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.PrimeUpdate()
  !   If returnValue = Level:Fatal  ! delete just occured
  !     db.Debugout('ThisNetRefresh.Send(|Verkoop|ARelatie|RelatieAdres|Planning|Planning|') ! NetTalk (NetRefresh)
  !   End
      
        
    If returnValue = Level:Fatal  ! delete just occured
      ThisNetRefresh.Send('|') ! NetTalk (NetRefresh)
    End
   	If returnValue = Level:Fatal  ! delete just occured
   		NetRefreshPlanningViews()
   	End
  RETURN ReturnValue


ThisWindow.Reset PROCEDURE(BYTE Force=0)

  CODE
  SELF.ForcedReset += Force
  IF QuickWindow{Prop:AcceptAll} THEN RETURN.
  AAARel:RelatieID = Ver2:Klant                            ! Assign linking field value
  Access:AAARelatie.Fetch(AAARel:Relatie_PK)
    NetLocalRefreshDate = today()         ! NetTalk (NetRefresh)
    NetLocalRefreshTime = clock()
  PARENT.Reset(Force)


ThisWindow.Run PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  IF GlobalRequest=DeleteRecord
  	IF Ver2:Verwerkt THEN
  		!MESSAGE('Verkoop is verwerkt en kan niet worden verwijderd.')
  		!RETURN ReturnValue
  	.
  	
  	Verwerkt# = false
  	NoRecord# = true
  	Pla:VerkoopID = Ver2:VerkoopID
  	CLEAR(Pla:PlanningID,-1)
  	SET(Pla:Planning_FK02,Pla:Planning_FK02)
  	LOOP
  		Access:Planning.TryNext()
  		IF ERROR() THEN BREAK.
  		
  		IF Pla:VerkoopID <> Ver2:VerkoopID THEN BREAK.
  		
  		NoRecord# = false
  		
  		IF Pla:Verwerkt THEN
  			Verwerkt# = true
  			BREAK
  		.
  	.
  	
  	IF Verwerkt# THEN
  		!MESSAGE('Verkoopregels zijn verwerkt en de verkoop kan daardoor niet verwijderd worden.')
  		!RETURN ReturnValue
  	END
  END
  
  ReturnValue = PARENT.Run()
  IF SELF.Request = ViewRecord                             ! In View Only mode always signal RequestCancelled
    ReturnValue = RequestCancelled
  END
  RETURN ReturnValue


ThisWindow.Run PROCEDURE(USHORT Number,BYTE Request)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Run(Number,Request)
  SAVAREL:Record = AREL:Record
  DB.Debugout('Voor de update')
  ! Als de Status op View dan moet de UpdatePlanningInkoop ook in View mode geopend worden
    IF SELF.Request = ViewRecord      
        GlobalRequest = ViewRecord
        UpdatePlanningVerkoop
        ReturnValue = GlobalResponse
    END
  IF SELF.Request = ViewRecord
    ReturnValue = RequestCancelled                         ! Always return RequestCancelled if the form was opened in ViewRecord mode
  ELSE
    GlobalRequest = Request
    UpdatePlanningVerkoop
    ReturnValue = GlobalResponse
  END
  DB.Debugout('Erna de update')
  AREL:Record=SAVAREL:Record
  		Ver2:Klant = AREL:RelatieID
  		FDCB4.ResetQueue(True)
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
    OF ?VoegToeAdres
      Clear(RAD:Record)
      RAD:RelatieID=Ver2:Klant
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?Loc:Firmanaam
      IF Arel:Note=''
          ?Note{PROP:Icon}=ICON:None
          Hide(?Note)
      ELSE
          ?Note{PROP:Icon}=ICON:Tick
          UnHide(?Note)
      END
      ! vertegenwoordiger uit de relatie halen
      IF AREL:Acc_Man<>0 AND 0{PROP:AcceptAll}=FALSE
          Clear(Geb:Record)
          GEB:Res_id=AREL:Acc_Man
          IF Access:Gebruiker.Fetch(Geb:FK2_Gebruiker)=Level:Benign
              Ver2:GebruikerID=Geb:ID
              FDB15.ResetQueue(false)
          END
      END
      Do BepaaldNogTefactureren
    OF ?LookupButton
      ThisWindow.Update()
      GlobalRequest = SelectRecord
      SelectArelatie('C')
      ThisWindow.Reset
      	if globalresponse=RequestCompleted
      		Ver2:Klant = AREL:RelatieID
              IF Arel:Note=''
                  ?Note{PROP:Icon}=ICON:None
                  Hide(?Note)
              ELSE
                  ?Note{PROP:Icon}=ICON:Tick
                  UnHide(?Note)
              END
      		FDCB4.ResetQueue(True)
      	END
      		
    OF ?Note
      ThisWindow.Update()
          Message(AREL:Note,'Notitie')
    OF ?BtnRetour
      ThisWindow.Update()
          Loc:RedenRetour=Ver2:RedenRetour
          Loc:RetourDatum=Ver2:RetourDatum_DATE
          IF WindowRedenRetour('Verkoop',Ver2:VerkoopID,Loc:RedenRetour,Loc:RetourDatum ) = RequestCompleted
              Ver2:RedenRetour=Loc:RedenRetour
              Ver2:RetourDatum_DATE=Loc:RetourDatum
              
              ?BtnRetour{Prop:Text}='Retour reden:'&Ver2:RedenRetour&' '&Format(Ver2:RetourDatum_DATE,@d5-)
             ! DISABLE(?BtnRetour)
            BRW7.ResetQueue(FALSE)
        END      
    OF ?BTNNegatieveOrder
      ThisWindow.Update()
          Ver2:NegatieveOrder=Format(TODAY(),@d5-)&' '&Format(Clock(),@T4)&' '&IGB:WindowsInlog
    OF ?Calendar
      ThisWindow.Update()
      Calendar8.SelectOnClose = True
      Calendar8.Ask('Select a Date',Ver2:Planning_DATE)
      IF Calendar8.Response = RequestCompleted THEN
      Ver2:Planning_DATE=Calendar8.SelectedDate
      DISPLAY(?Ver2:Planning_DATE:2)
      END
      ThisWindow.Reset(True)
    OF ?VoegToeAdres
      ThisWindow.Update()
      GlobalRequest = InsertRecord
      UpdateRelatieAdres()
      ThisWindow.Reset
        IF 0{PROP:AcceptAll}=FALSE 
            FDCB10.ResetQueue(True)
            Select(?RAD:Adres1)
        END
        
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


ThisWindow.TakeCloseEvent PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
      ! op het aller laatste moment controleren of dit een negatieve order is
      ! Voor de parent gezet anders raken we header kwijt
      IF LocalClass.NegatieveOrder() = TRUE AND Ver2:NegatieveOrder=''
          ! je mag het scherm niet sluiten
          Message('Er zijn negatieve orderregels!. Bevestig dit anders kan dit scherm niet gesloten worden','Negatieve order',ICON:Question)
          Return Level:Notify
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
  IF Ver2:Planning_DATE = 0 THEN
      Ver2:Planning_TIME = 0
  END
  ReturnValue = PARENT.TakeCompleted()
  DO UpdateVerwerkStatus
    ThisNetRefresh.Send('|') ! NetTalk (NetRefresh)
  NetRefreshPlanningViews()
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
  CASE FIELD()
  OF ?ListExtraKosten
    CASE EVENT()
    OF EVENT:PreAlertKey
      IF KeyCODE()=MouseLeft2
          CYCLE
      END
    END
  END
  ReturnValue = PARENT.TakeFieldEvent()
  IF 0{PROP:AcceptAll}=FALSE THEN LocalClass.NegatieveOrder().
  CASE FIELD()
  OF ?ListExtraKosten
    CASE EVENT()
    OF EVENT:AlertKey
      IF KeyCODE()=MouseLeft2
          Rij#=?ListExtraKosten{PROPLIST:MouseDownRow}
          GET(BRW12.Q,Rij#)
          IF NOT ERROR()
              Clear(Ext:Record)
              Ext:VerkoopID=Ver2:VerkoopID
              Ext:KostenID=BRW12.Q.Kos:KostenID
              IF Access:ExtraKosten.Fetch(Ext:FK1_ExtraKosten)
                  Access:ExtraKosten.PrimeRecord()
                  Ext:VerkoopID=Ver2:VerkoopID
                  Ext:KostenID=BRW12.Q.Kos:KostenID
                  Ext:Prijs=BRW12.Q.Ext:Prijs
                  Access:ExtraKosten.Insert()
                  Clear(Ext:Record)
                  Ext:VerkoopID=Ver2:VerkoopID
                  Ext:KostenID=BRW12.Q.Kos:KostenID
                  Access:ExtraKosten.Fetch(Ext:FK1_ExtraKosten)
              END
              GlobalRequest=ChangeRecord
              UpdateExtraKosten
              BRW12.ResetFromView()
              BRW12.ResetQueue(True)
              BRW7.ResetFromView()
              BRW7.ResetQueue(True)
          END
          CYCLE
      END
    END
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

LocalClass.NegatieveOrder   Procedure
negatieveorder          Byte
CODE
    negatieveorder = FALSE
    Loop i#=1 to records(BRW7.q)
        GET(BRW7.Q,i#)
        IF BRW7.q.Loc:KostKGPrijs > BRW7.q.Pla:VerkoopKGPrijs
            negatieveorder = TRUE
        END
    END
    IF negatieveorder
        ?BTNNegatieveOrder{Prop:Hide}=false
    ELSE    
        ?BTNNegatieveOrder{Prop:Hide}=true
    END
    if Ver2:NegatieveOrder=''
        ?BTNNegatieveOrder{Prop:Icon}=ICON:Cross
    ELSE    
        ?BTNNegatieveOrder{Prop:Icon}=ICON:Tick
    END    
    
    IF AREL:OpenstaandSaldo > AREL:CreditLine
        ?Waarschuwing{Prop:Icon}=ICON:Cross
    ELSE    
        ?Waarschuwing{Prop:Icon}=icon:None
    END 
    IF AREL:DagenOud>30
        ?AREL:OpenstaandSaldo{PROP:Color} = COLOR:Red
        ?AREL:OpenstaandSaldo{PROP:ToolTip} = 'De oudste post is  '&AREL:DagenOud&' dagen oud'
    ELSE        
        ?AREL:OpenstaandSaldo{PROP:Color} = COLOR:None
        ?AREL:OpenstaandSaldo{PROP:ToolTip} = ''
    END
    IF Arel:Note=''
        ?Note{PROP:Icon}=ICON:None
        Hide(?Note)
    ELSE
        ?Note{PROP:Icon}=ICON:Tick
        UnHide(?Note)
    END
    
    
    DISPLAY(?Waarschuwing)
    Return negatieveorder
                    

FDCB4.SetQueueRecord PROCEDURE

  CODE
  	i#=INSTRING('<39>',AREL:FirmaNaam,1,1)
  	IF i#
  		Loc:Firmanaam = Sub(AREL:FirmaNaam,1,i#-1)&SUB(AREL:FirmaNaam,i#+1,51)
  	ELSE
  		Loc:Firmanaam = AREL:FirmaNaam
  	END	
  PARENT.SetQueueRecord
  


BRW7.Ask PROCEDURE(BYTE Request)

ReturnValue          BYTE,AUTO

  CODE
  IF Request = ChangeRecord AND Pla:MutatieGemaakt THEN
      !Request = ViewRecord
  ELSIF Request = DeleteRecord AND Pla:MutatieGemaakt THEN
      MESSAGE('Geplande verkoopregel is al uitgevoerd. Kan dus niet meer verwijderd worden. Draait eerst de mutaties terug.', 'Al uitgevoerd', ICON:Exclamation)
      RETURN Level:Benign
  END
  ReturnValue = PARENT.Ask(Request)
  RETURN ReturnValue


BRW7.Fetch PROCEDURE(BYTE Direction)

GreenBarIndex   LONG,AUTO
  CODE
  PARENT.Fetch(Direction)
  !----------------------------------------------------------------------
    LOOP GreenBarIndex=1 TO RECORDS(SELF.Q)
      GET(SELF.Q,GreenBarIndex)
      SELF.Q.Pla:ArtikelID_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for Pla:ArtikelID
      SELF.Q.Pla:ArtikelID_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.Pla:ArtikelID_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla:ArtikelID_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Art:ArtikelOms_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for Art:ArtikelOms
      SELF.Q.Art:ArtikelOms_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.Art:ArtikelOms_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Art:ArtikelOms_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla:KG_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for Pla:KG
      SELF.Q.Pla:KG_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.Pla:KG_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla:KG_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla:Pallets_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for Pla:Pallets
      SELF.Q.Pla:Pallets_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.Pla:Pallets_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla:Pallets_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla:VerkoopKGPrijs_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for Pla:VerkoopKGPrijs
      SELF.Q.Pla:VerkoopKGPrijs_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.Pla:VerkoopKGPrijs_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla:VerkoopKGPrijs_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Loc:KostKGPrijs_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for Loc:KostKGPrijs
      SELF.Q.Loc:KostKGPrijs_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.Loc:KostKGPrijs_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Loc:KostKGPrijs_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla:MutatieGemaakt_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for Pla:MutatieGemaakt
      SELF.Q.Pla:MutatieGemaakt_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.Pla:MutatieGemaakt_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla:MutatieGemaakt_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla:Verwerkt_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for Pla:Verwerkt
      SELF.Q.Pla:Verwerkt_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.Pla:Verwerkt_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla:Verwerkt_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla:MutatieKG_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for Pla:MutatieKG
      SELF.Q.Pla:MutatieKG_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.Pla:MutatieKG_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla:MutatieKG_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla:MutatiePallets_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for Pla:MutatiePallets
      SELF.Q.Pla:MutatiePallets_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.Pla:MutatiePallets_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla:MutatiePallets_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla:OverboekingPlanningID_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for Pla:OverboekingPlanningID
      SELF.Q.Pla:OverboekingPlanningID_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.Pla:OverboekingPlanningID_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla:OverboekingPlanningID_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla:PartijID_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for Pla:PartijID
      SELF.Q.Pla:PartijID_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.Pla:PartijID_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla:PartijID_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.CEL:CelOms_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for CEL:CelOms
      SELF.Q.CEL:CelOms_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.CEL:CelOms_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.CEL:CelOms_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Ver:VerpakkingOmschrijving_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for Ver:VerpakkingOmschrijving
      SELF.Q.Ver:VerpakkingOmschrijving_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.Ver:VerpakkingOmschrijving_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Ver:VerpakkingOmschrijving_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla:Instructie_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for Pla:Instructie
      SELF.Q.Pla:Instructie_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.Pla:Instructie_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla:Instructie_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla:Transport_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for Pla:Transport
      SELF.Q.Pla:Transport_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.Pla:Transport_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla:Transport_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla:Memo_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for Pla:Memo
      SELF.Q.Pla:Memo_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.Pla:Memo_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla:Memo_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      PUT(SELF.Q)
    END
  !----------------------------------------------------------------------
  LOOP GreenBarIndex=1 TO RECORDS(SELF.Q)
      GET(SELF.Q,GreenBarIndex)
      IF (SELF.Q.Loc:KostKGPrijs > SELF.Q.Pla:VerkoopKGPrijs)
          SELF.Q.Loc:KostKGPrijs_NormalBG   = Color:Red
          SELF.Q.Loc:KostKGPrijs_SelectedBG   = Color:Red
          PUT(SELF.Q)
      END    
  END
                


BRW7.Init PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)

  CODE
  PARENT.Init(ListBox,Posit,V,Q,RM,WM)
  IF WM.Request <> ViewRecord                              ! If called for anything other than ViewMode, make the insert, change & delete controls available
    SELF.InsertControl=?Insert
    SELF.ChangeControl=?Change
    SELF.DeleteControl=?Delete
  END
  SELF.ViewControl = ?View                                 ! Setup the control used to initiate view only mode


BRW7.ResetFromView PROCEDURE

Loc:TotaalKG:Sum     REAL                                  ! Sum variable for browse totals
  CODE
  SETCURSOR(Cursor:Wait)
  Relate:Planning.SetQuickScan(1)
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
    Loc:TotaalKG:Sum += Pla:KG
  END
  SELF.View{PROP:IPRequestCount} = 0
  Loc:TotaalKG = Loc:TotaalKG:Sum
  PARENT.ResetFromView
  Relate:Planning.SetQuickScan(0)
  SETCURSOR()


BRW7.SetQueueRecord PROCEDURE

  CODE
  PARENT.SetQueueRecord
  
  IF (Pla:MutatieGemaakt)
    SELF.Q.Pla:MutatieGemaakt_Icon = 2                     ! Set icon from icon list
  ELSE
    SELF.Q.Pla:MutatieGemaakt_Icon = 1                     ! Set icon from icon list
  END
  IF (Pla:Verwerkt)
    SELF.Q.Pla:Verwerkt_Icon = 2                           ! Set icon from icon list
  ELSE
    SELF.Q.Pla:Verwerkt_Icon = 1                           ! Set icon from icon list
  END
  IF (Pla:OverboekingPlanningID > 0)
    SELF.Q.Pla:OverboekingPlanningID_Icon = 2              ! Set icon from icon list
  ELSE
    SELF.Q.Pla:OverboekingPlanningID_Icon = 1              ! Set icon from icon list
  END
  !----------------------------------------------------------------------
      SELF.Q.Pla:ArtikelID_NormalFG   = CHOOSE(CHOICE(?List) % 2,-1,-1) ! Set color values for Pla:ArtikelID
      SELF.Q.Pla:ArtikelID_NormalBG   = CHOOSE(CHOICE(?List) % 2,-1,8454143)
      SELF.Q.Pla:ArtikelID_SelectedFG = CHOOSE(CHOICE(?List) % 2,-1,-1)
      SELF.Q.Pla:ArtikelID_SelectedBG = CHOOSE(CHOICE(?List) % 2,-1,-1)
      SELF.Q.Art:ArtikelOms_NormalFG   = CHOOSE(CHOICE(?List) % 2,-1,-1) ! Set color values for Art:ArtikelOms
      SELF.Q.Art:ArtikelOms_NormalBG   = CHOOSE(CHOICE(?List) % 2,-1,8454143)
      SELF.Q.Art:ArtikelOms_SelectedFG = CHOOSE(CHOICE(?List) % 2,-1,-1)
      SELF.Q.Art:ArtikelOms_SelectedBG = CHOOSE(CHOICE(?List) % 2,-1,-1)
      SELF.Q.Pla:KG_NormalFG   = CHOOSE(CHOICE(?List) % 2,-1,-1) ! Set color values for Pla:KG
      SELF.Q.Pla:KG_NormalBG   = CHOOSE(CHOICE(?List) % 2,-1,8454143)
      SELF.Q.Pla:KG_SelectedFG = CHOOSE(CHOICE(?List) % 2,-1,-1)
      SELF.Q.Pla:KG_SelectedBG = CHOOSE(CHOICE(?List) % 2,-1,-1)
      SELF.Q.Pla:Pallets_NormalFG   = CHOOSE(CHOICE(?List) % 2,-1,-1) ! Set color values for Pla:Pallets
      SELF.Q.Pla:Pallets_NormalBG   = CHOOSE(CHOICE(?List) % 2,-1,8454143)
      SELF.Q.Pla:Pallets_SelectedFG = CHOOSE(CHOICE(?List) % 2,-1,-1)
      SELF.Q.Pla:Pallets_SelectedBG = CHOOSE(CHOICE(?List) % 2,-1,-1)
      SELF.Q.Pla:VerkoopKGPrijs_NormalFG   = CHOOSE(CHOICE(?List) % 2,-1,-1) ! Set color values for Pla:VerkoopKGPrijs
      SELF.Q.Pla:VerkoopKGPrijs_NormalBG   = CHOOSE(CHOICE(?List) % 2,-1,8454143)
      SELF.Q.Pla:VerkoopKGPrijs_SelectedFG = CHOOSE(CHOICE(?List) % 2,-1,-1)
      SELF.Q.Pla:VerkoopKGPrijs_SelectedBG = CHOOSE(CHOICE(?List) % 2,-1,-1)
      SELF.Q.Loc:KostKGPrijs_NormalFG   = CHOOSE(CHOICE(?List) % 2,-1,-1) ! Set color values for Loc:KostKGPrijs
      SELF.Q.Loc:KostKGPrijs_NormalBG   = CHOOSE(CHOICE(?List) % 2,-1,8454143)
      SELF.Q.Loc:KostKGPrijs_SelectedFG = CHOOSE(CHOICE(?List) % 2,-1,-1)
      SELF.Q.Loc:KostKGPrijs_SelectedBG = CHOOSE(CHOICE(?List) % 2,-1,-1)
      SELF.Q.Pla:MutatieGemaakt_NormalFG   = CHOOSE(CHOICE(?List) % 2,-1,-1) ! Set color values for Pla:MutatieGemaakt
      SELF.Q.Pla:MutatieGemaakt_NormalBG   = CHOOSE(CHOICE(?List) % 2,-1,8454143)
      SELF.Q.Pla:MutatieGemaakt_SelectedFG = CHOOSE(CHOICE(?List) % 2,-1,-1)
      SELF.Q.Pla:MutatieGemaakt_SelectedBG = CHOOSE(CHOICE(?List) % 2,-1,-1)
      SELF.Q.Pla:Verwerkt_NormalFG   = CHOOSE(CHOICE(?List) % 2,-1,-1) ! Set color values for Pla:Verwerkt
      SELF.Q.Pla:Verwerkt_NormalBG   = CHOOSE(CHOICE(?List) % 2,-1,8454143)
      SELF.Q.Pla:Verwerkt_SelectedFG = CHOOSE(CHOICE(?List) % 2,-1,-1)
      SELF.Q.Pla:Verwerkt_SelectedBG = CHOOSE(CHOICE(?List) % 2,-1,-1)
      SELF.Q.Pla:MutatieKG_NormalFG   = CHOOSE(CHOICE(?List) % 2,-1,-1) ! Set color values for Pla:MutatieKG
      SELF.Q.Pla:MutatieKG_NormalBG   = CHOOSE(CHOICE(?List) % 2,-1,8454143)
      SELF.Q.Pla:MutatieKG_SelectedFG = CHOOSE(CHOICE(?List) % 2,-1,-1)
      SELF.Q.Pla:MutatieKG_SelectedBG = CHOOSE(CHOICE(?List) % 2,-1,-1)
      SELF.Q.Pla:MutatiePallets_NormalFG   = CHOOSE(CHOICE(?List) % 2,-1,-1) ! Set color values for Pla:MutatiePallets
      SELF.Q.Pla:MutatiePallets_NormalBG   = CHOOSE(CHOICE(?List) % 2,-1,8454143)
      SELF.Q.Pla:MutatiePallets_SelectedFG = CHOOSE(CHOICE(?List) % 2,-1,-1)
      SELF.Q.Pla:MutatiePallets_SelectedBG = CHOOSE(CHOICE(?List) % 2,-1,-1)
      SELF.Q.Pla:OverboekingPlanningID_NormalFG   = CHOOSE(CHOICE(?List) % 2,-1,-1) ! Set color values for Pla:OverboekingPlanningID
      SELF.Q.Pla:OverboekingPlanningID_NormalBG   = CHOOSE(CHOICE(?List) % 2,-1,8454143)
      SELF.Q.Pla:OverboekingPlanningID_SelectedFG = CHOOSE(CHOICE(?List) % 2,-1,-1)
      SELF.Q.Pla:OverboekingPlanningID_SelectedBG = CHOOSE(CHOICE(?List) % 2,-1,-1)
      SELF.Q.Pla:PartijID_NormalFG   = CHOOSE(CHOICE(?List) % 2,-1,-1) ! Set color values for Pla:PartijID
      SELF.Q.Pla:PartijID_NormalBG   = CHOOSE(CHOICE(?List) % 2,-1,8454143)
      SELF.Q.Pla:PartijID_SelectedFG = CHOOSE(CHOICE(?List) % 2,-1,-1)
      SELF.Q.Pla:PartijID_SelectedBG = CHOOSE(CHOICE(?List) % 2,-1,-1)
      SELF.Q.CEL:CelOms_NormalFG   = CHOOSE(CHOICE(?List) % 2,-1,-1) ! Set color values for CEL:CelOms
      SELF.Q.CEL:CelOms_NormalBG   = CHOOSE(CHOICE(?List) % 2,-1,8454143)
      SELF.Q.CEL:CelOms_SelectedFG = CHOOSE(CHOICE(?List) % 2,-1,-1)
      SELF.Q.CEL:CelOms_SelectedBG = CHOOSE(CHOICE(?List) % 2,-1,-1)
      SELF.Q.Ver:VerpakkingOmschrijving_NormalFG   = CHOOSE(CHOICE(?List) % 2,-1,-1) ! Set color values for Ver:VerpakkingOmschrijving
      SELF.Q.Ver:VerpakkingOmschrijving_NormalBG   = CHOOSE(CHOICE(?List) % 2,-1,8454143)
      SELF.Q.Ver:VerpakkingOmschrijving_SelectedFG = CHOOSE(CHOICE(?List) % 2,-1,-1)
      SELF.Q.Ver:VerpakkingOmschrijving_SelectedBG = CHOOSE(CHOICE(?List) % 2,-1,-1)
      SELF.Q.Pla:Instructie_NormalFG   = CHOOSE(CHOICE(?List) % 2,-1,-1) ! Set color values for Pla:Instructie
      SELF.Q.Pla:Instructie_NormalBG   = CHOOSE(CHOICE(?List) % 2,-1,8454143)
      SELF.Q.Pla:Instructie_SelectedFG = CHOOSE(CHOICE(?List) % 2,-1,-1)
      SELF.Q.Pla:Instructie_SelectedBG = CHOOSE(CHOICE(?List) % 2,-1,-1)
      SELF.Q.Pla:Transport_NormalFG   = CHOOSE(CHOICE(?List) % 2,-1,-1) ! Set color values for Pla:Transport
      SELF.Q.Pla:Transport_NormalBG   = CHOOSE(CHOICE(?List) % 2,-1,8454143)
      SELF.Q.Pla:Transport_SelectedFG = CHOOSE(CHOICE(?List) % 2,-1,-1)
      SELF.Q.Pla:Transport_SelectedBG = CHOOSE(CHOICE(?List) % 2,-1,-1)
      SELF.Q.Pla:Memo_NormalFG   = CHOOSE(CHOICE(?List) % 2,-1,-1) ! Set color values for Pla:Memo
      SELF.Q.Pla:Memo_NormalBG   = CHOOSE(CHOICE(?List) % 2,-1,8454143)
      SELF.Q.Pla:Memo_SelectedFG = CHOOSE(CHOICE(?List) % 2,-1,-1)
      SELF.Q.Pla:Memo_SelectedBG = CHOOSE(CHOICE(?List) % 2,-1,-1)
  !----------------------------------------------------------------------
      ! Kostprijs hier berekenen
  Clear(Par:Record)
  Par:PartijID=SELF.Q.Pla:PartijID
  Access:Partij.Fetch(Par:Partij_PK)
  !Loc:KostKGPrijs = Par:BerekendeInkoopKGPrijs 
  !IF (SELF.Q.Pla:KG <>0)
  !    Loc:KostKGPrijs += (SELF.q.Pla:ExtraKosten / SELF.Q.Pla:KG)
  !END
  !IF (Loc:TotaalKG<>0)
  !    Loc:KostKGPrijs += (Loc:ExtraKosten / Loc:TotaalKG)
  !END
  SELF.Q.Loc:KostKGPrijs = Par:BerekendeInkoopKGPrijs 
  IF (SELF.Q.Pla:KG <>0)
      SELF.Q.Loc:KostKGPrijs += (SELF.q.Pla:ExtraKosten / SELF.Q.Pla:KG)
  END
  IF (Loc:TotaalKG<>0)
      SELF.Q.Loc:KostKGPrijs += (Loc:ExtraKosten / Loc:TotaalKG)
  END
      
  ! extra kosten meenemen
  
  !  IF SELF.Q.Pla:VerkoopKGPrijs < SELF.Q.Loc:KostKGPrijs
  !      ! VERKOOPPRIJS ROOD MAKEN
  !      DB.Debugout(SELF.Q.Pla:VerkoopKGPrijs&' < '&SELF.Q.Loc:KostKGPrijs)
  !      SELF.Q.Pla:VerkoopKGPrijs_NormalBG=Color:Red
  !        SELF.Q.Pla:VerkoopKGPrijs_SelectedBG=Color:Red
  !  END
  ! extra kosten kleuren
  IF SELF.Q.Pla:VerkoopKGPrijs < SELF.Q.Loc:KostKGPrijs
      ! VERKOOPPRIJS ROOD MAKEN
      DB.Debugout(SELF.Q.Pla:VerkoopKGPrijs&' < '&SELF.Q.Loc:KostKGPrijs)
      SELF.Q.Pla:VerkoopKGPrijs_NormalBG=Color:Red
      SELF.Q.Pla:VerkoopKGPrijs_SelectedBG=Color:Red
      
  END


BRW12.ResetFromView PROCEDURE

Loc:ExtraKosten:Sum  REAL                                  ! Sum variable for browse totals
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
    Loc:ExtraKosten:Sum += Ext:ExtraKosten
  END
  SELF.View{PROP:IPRequestCount} = 0
  Loc:ExtraKosten = Loc:ExtraKosten:Sum
  PARENT.ResetFromView
  Relate:KostenStamgeg.SetQuickScan(0)
  SETCURSOR()


BRW12.SetQueueRecord PROCEDURE

  CODE
      ! als bij de kostengege de prijs is ingevoerd deze hier overnemen
  Clear(Ext:Record)
  Ext:VerkoopID=Ver2:VerkoopID
  Ext:KostenID=Kos:KostenID
  IF Access:ExtraKosten.Fetch(Ext:FK1_ExtraKosten)
      Ext:Prijs=Kos:Prijs
  ELSE
      ! dan laat hij het sowiesow goed zien
  END
  PARENT.SetQueueRecord
  


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window
  SELF.SetStrategy(?Ink:Leverancier:Prompt, Resize:FixLeft+Resize:FixTop, Resize:LockSize) ! Override strategy for ?Ink:Leverancier:Prompt
  SELF.SetStrategy(?RAD:Adres1, Resize:FixLeft+Resize:FixTop, Resize:LockSize) ! Override strategy for ?RAD:Adres1
  SELF.SetStrategy(?Ver2:Planning_DATE:Prompt, Resize:FixLeft+Resize:FixTop, Resize:LockSize) ! Override strategy for ?Ver2:Planning_DATE:Prompt
  SELF.SetStrategy(?Ver2:Planning_DATE:2, Resize:FixLeft+Resize:FixTop, Resize:LockSize) ! Override strategy for ?Ver2:Planning_DATE:2
  SELF.SetStrategy(?Calendar, Resize:FixLeft+Resize:FixTop, Resize:LockSize) ! Override strategy for ?Calendar
  SELF.SetStrategy(?Ink:Planning_TIME:Prompt, Resize:FixLeft+Resize:FixTop, Resize:LockSize) ! Override strategy for ?Ink:Planning_TIME:Prompt
  SELF.SetStrategy(?Ver2:Planning_TIME, Resize:FixLeft+Resize:FixTop, Resize:LockSize) ! Override strategy for ?Ver2:Planning_TIME
  SELF.SetStrategy(?Ink:Instructie:Prompt, Resize:FixLeft+Resize:FixTop, Resize:LockSize) ! Override strategy for ?Ink:Instructie:Prompt
  SELF.SetStrategy(?Ver2:Instructie, Resize:FixLeft+Resize:FixTop, Resize:LockSize) ! Override strategy for ?Ver2:Instructie
  SELF.SetStrategy(?Ink:Transport:Prompt, Resize:FixLeft+Resize:FixTop, Resize:LockSize) ! Override strategy for ?Ink:Transport:Prompt
  SELF.SetStrategy(?Ver2:Transport, Resize:FixLeft+Resize:FixTop, Resize:LockSize) ! Override strategy for ?Ver2:Transport
  SELF.SetStrategy(?Ver2:Verwerkt, Resize:FixRight+Resize:FixTop, Resize:LockSize) ! Override strategy for ?Ver2:Verwerkt
  SELF.SetStrategy(?List, Resize:FixLeft+Resize:FixTop, Resize:ConstantRight) ! Override strategy for ?List
  SELF.SetStrategy(?Insert, Resize:FixRight+Resize:FixBottom, Resize:LockSize) ! Override strategy for ?Insert
  SELF.SetStrategy(?Change, Resize:FixRight+Resize:FixBottom, Resize:LockSize) ! Override strategy for ?Change
  SELF.SetStrategy(?Delete, Resize:FixRight+Resize:FixBottom, Resize:LockSize) ! Override strategy for ?Delete
  SELF.SetStrategy(?PROMPT1, Resize:FixLeft+Resize:FixTop, Resize:LockSize) ! Override strategy for ?PROMPT1
  SELF.SetStrategy(?Ver2:ExternVerkoopID:Prompt, Resize:FixLeft+Resize:FixTop, Resize:LockSize) ! Override strategy for ?Ver2:ExternVerkoopID:Prompt
  SELF.SetStrategy(?Ver2:ExternVerkoopID, Resize:FixLeft+Resize:FixTop, Resize:LockSize) ! Override strategy for ?Ver2:ExternVerkoopID
  SELF.SetStrategy(?Ver2:ExtraKosten:Prompt, Resize:FixLeft+Resize:FixTop, Resize:LockSize) ! Override strategy for ?Ver2:ExtraKosten:Prompt
  SELF.SetStrategy(?Ver2:ExtraKostenTekst, Resize:FixLeft+Resize:FixTop, Resize:LockSize) ! Override strategy for ?Ver2:ExtraKostenTekst
  SELF.SetStrategy(?OK, Resize:FixRight+Resize:FixBottom, Resize:LockSize) ! Override strategy for ?OK
  SELF.SetStrategy(?Cancel, Resize:FixRight+Resize:FixBottom, Resize:LockSize) ! Override strategy for ?Cancel
  SELF.SetStrategy(?ListExtraKosten, Resize:FixLeft+Resize:FixTop, Resize:LockHeight) ! Override strategy for ?ListExtraKosten
  SELF.SetStrategy(?BTNNegatieveOrder, Resize:FixLeft+Resize:FixTop, Resize:LockSize) ! Override strategy for ?BTNNegatieveOrder

