

   MEMBER('VoorrPln.clw')                                  ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABDROPS.INC'),ONCE
   INCLUDE('ABPOPUP.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('VOORRPLN038.INC'),ONCE        !Local module procedure declarations
                     END


!!! <summary>
!!! Generated from procedure template - Window
!!! Packlijst gegevens, uitbreiding van verkoop
!!! </summary>
UpdateVerkoopExport PROCEDURE 

udpt            UltimateDebugProcedureTracker
CurrentTab           STRING(80)                            ! 
ActionMessage        CSTRING(40)                           ! 
Loc:Layout           CSTRING(21)                           ! 
Loc:ProForma         BYTE(1)                               ! 
Loc:PackingList      BYTE(1)                               ! 
Loc:SeaWayBill       BYTE                                  ! 
Loc:Welke            LONG                                  ! 
Loc:TotaalQ          QUEUE,PRE(LTQ2)                       ! 
ArtikelID            CSTRING(31)                           ! 
ArtikelOms           STRING(60)                            ! 
KG                   DECIMAL(10,2)                         ! 
Pallet               LONG                                  ! 
Dozen                LONG                                  ! 
Aantal               LONG                                  ! 
GrossWeight          DECIMAL(8,3)                          ! 
GrossWeight_NFG      LONG                                  ! 
GrossWeight_NBG      LONG                                  ! 
GrossWeight_SFG      LONG                                  ! 
GrossWeight_SBG      LONG                                  ! 
VerkoopPrijs         DECIMAL(11,3)                         ! 
VerkoopPrijs_NFG     LONG                                  ! 
VerkoopPrijs_SFG     LONG                                  ! 
VerkoopPrijs_NBG     LONG                                  ! 
VerkoopPrijs_SBG     LONG                                  ! 
VerpakkingID         LONG                                  ! 
VerpakkingOmschrijving CSTRING(51)                         ! 
Bedrag               DECIMAL(11,2)                         ! 
PlantNumber          CSTRING(51)                           ! 
PlantNumber_NFG      LONG                                  ! 
PlantNumber_NBG      LONG                                  ! 
PlantNumber_SFG      LONG                                  ! 
PlantNumber_SBG      LONG                                  ! 
ProductieDatum       DATE                                  ! 
ProductieDatum_NFG   LONG                                  ! 
ProductieDatum_NBG   LONG                                  ! 
ProductieDatum_SFG   LONG                                  ! 
ProductieDatum_SBG   LONG                                  ! 
THTDatum             DATE                                  ! 
THTDatum_NFG         LONG                                  ! 
THTDatum_NBG         LONG                                  ! 
THTDatum_SFG         LONG                                  ! 
THTDatum_SBG         LONG                                  ! 
GNCode               CSTRING(100)                          ! 
GNCode_NFG           LONG                                  ! 
GNCode_NBG           LONG                                  ! 
GNCode_SFG           LONG                                  ! 
GNCode_SBG           LONG                                  ! 
                     END                                   ! 
Loc:PackLijstQ       QUEUE(PackLijstQ),PRE(LTQ)            ! 
                     END                                   ! 
Loc:TotaalDozen      LONG                                  ! 
Loc:TotaalKG         LONG                                  ! 
Loc:TotaalGrossWeight LONG                                 ! 
Loc:UnloadingAdress1 CSTRING(51)                           ! 
Loc:UnloadingAdress2 CSTRING(51)                           ! 
Loc:UnloadingAdress3 CSTRING(51)                           ! 
Loc:UnloadingAdress4 CSTRING(51)                           ! 
Loc:Invoice          CSTRING(51)                           ! VerkoopID of ExternVerkoopID
Loc:PostcodePlaats   STRING(50)                            ! 
FDB4::View:FileDrop  VIEW(Havens)
                       PROJECT(Hav:Haven)
                     END
BRW9::View:Browse    VIEW(Planning)
                       PROJECT(Pla:KG)
                       PROJECT(Pla:AlternatieveArtikelOms)
                       PROJECT(Pla:VerkoopKGPrijs)
                       PROJECT(Pla:GrossWeight)
                       PROJECT(Pla:PlantNumber)
                       PROJECT(Pla:PlanningID)
                       PROJECT(Pla:VerkoopID)
                       PROJECT(Pla:ArtikelID)
                       JOIN(AAArt:Artikel_PK,Pla:ArtikelID)
                         PROJECT(AAArt:ArtikelID)
                       END
                     END
Queue:Browse         QUEUE                            !Queue declaration for browse/combo box using ?List
Pla:KG                 LIKE(Pla:KG)                   !List box control field - type derived from field
Pla:AlternatieveArtikelOms LIKE(Pla:AlternatieveArtikelOms) !List box control field - type derived from field
Pla:VerkoopKGPrijs     LIKE(Pla:VerkoopKGPrijs)       !List box control field - type derived from field
Pla:GrossWeight        LIKE(Pla:GrossWeight)          !List box control field - type derived from field
Pla:PlantNumber        LIKE(Pla:PlantNumber)          !List box control field - type derived from field
Pla:PlanningID         LIKE(Pla:PlanningID)           !Primary key field - type derived from field
Pla:VerkoopID          LIKE(Pla:VerkoopID)            !Browse key field - type derived from field
AAArt:ArtikelID        LIKE(AAArt:ArtikelID)          !Related join file key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
FDCB11::View:FileDropCombo VIEW(ViewBetcd)
                       PROJECT(BTC:Omschrijving)
                       PROJECT(BTC:betcdID)
                     END
FDCB12::View:FileDropCombo VIEW(DeliveryTerms)
                       PROJECT(DLT:Omschrijving)
                       PROJECT(DLT:DeliveryTermsID)
                     END
Queue:FileDrop       QUEUE                            !
Hav:Haven              LIKE(Hav:Haven)                !List box control field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
Queue:FileDropCombo  QUEUE                            !
BTC:Omschrijving       LIKE(BTC:Omschrijving)         !List box control field - type derived from field
BTC:betcdID            LIKE(BTC:betcdID)              !Primary key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
Queue:FileDropCombo:1 QUEUE                           !
DLT:Omschrijving       LIKE(DLT:Omschrijving)         !List box control field - type derived from field
DLT:DeliveryTermsID    LIKE(DLT:DeliveryTermsID)      !Primary key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
LocEnableEnterByTab  BYTE(1)                               !Used by the ENTER Instead of Tab template
EnterByTabManager    EnterByTabClass
History::Ver2:Record LIKE(Ver2:RECORD),THREAD
NetLocalRefreshDate     Long     ! NetTalk (NetRefresh)
NetLocalRefreshTime     Long
NetLocalDependancies    String('|Verkoop|ARelatie|Havens|Planning|AAViewArtikel|ViewBetcd|DeliveryTerms|')
QuickWindow          WINDOW('Form Verkoop'),AT(,,517,398),FONT('Microsoft Sans Serif',8,,FONT:regular,CHARSET:DEFAULT), |
  RESIZE,CENTER,GRAY,IMM,MDI,HLP('UpdateVerkoopExport'),SYSTEM
                       SHEET,AT(4,4,501,375),USE(?CurrentTab)
                         TAB('Export gegevens'),USE(?Tab:3)
                           COMBO(@s60),AT(293,38,204,10),USE(DLT:Omschrijving),DROP(25),FORMAT('240L(2)|M~Omschrij' & |
  'ving~L(0)@s60@'),FROM(Queue:FileDropCombo:1),IMM
                           PROMPT('Containernr:'),AT(183,55),USE(?Ver2:Containernr:Prompt),TRN
                           COMBO(@s30),AT(293,23,204,10),USE(BTC:Omschrijving),DROP(25),FORMAT('120L(2)|M~Omschrij' & |
  'ving~L(0)@s30@'),FROM(Queue:FileDropCombo),IMM
                           ENTRY(@s50),AT(293,55,204,10),USE(Ver2:Containernr)
                           PROMPT('Sealnr:'),AT(183,68),USE(?Ver2:Sealnr:Prompt),TRN
                           ENTRY(@s50),AT(293,68,204,10),USE(Ver2:Sealnr)
                           PROMPT('Vessel:'),AT(183,81),USE(?Ver2:Vessel:Prompt),TRN
                           ENTRY(@s50),AT(293,81,204,10),USE(Ver2:Vessel)
                           SHEET,AT(7,98,479,106),USE(?Regels)
                             TAB('Gecumuleerd'),USE(?TAB1)
                               LIST,AT(11,120,461,74),USE(?List1),FORMAT('34R(2)|M~KG~C(0)@n-14@#3#121L(2)|M~Artikel O' & |
  'ms~C(0)@s60@#2#55R(2)|M*~Verkoop Prijs~C(2)@n-15.3@#12#44R(2)|M*~Gross Weight~C(2)@n' & |
  '-11.3@#7#50L(2)|M*~Plant Number~C(0)@s50@#20#40L(2)|M*~Productie~C(0)@d17@#25#40L(2)' & |
  '|M*~THT~C(0)@d17@#30#53L(2)|M*~GNCodes~C(0)@s99@#35#'),FROM(Loc:TotaalQ)
                             END
                             TAB('Regels'),USE(?TAB2)
                               LIST,AT(15,319,469,69),USE(?List),FORMAT('42R(2)|M~KG~@n-13@128L(2)|M~Alternatieve Arti' & |
  'kel Oms~C(0)@s200@56R(2)|M~Verkoop KGP rijs~D(12)@n-13`3@48R(2)|M~Gross Weight~D(12)' & |
  '@n-11.3@200R(2)|M~Plant Number~D(0)@s50@'),FROM(Queue:Browse),IMM
                               BUTTON('&Insert'),AT(359,392,42,12),USE(?Insert),DISABLE,HIDE
                               BUTTON('&Change'),AT(402,392,42,12),USE(?Change)
                               BUTTON('&Delete'),AT(443,392,42,12),USE(?Delete),DISABLE,HIDE
                             END
                           END
                           PROMPT('Tarra Container:'),AT(9,208),USE(?Ver2:TarraContainer:Prompt),TRN
                           ENTRY(@n-14),AT(120,208,64,10),USE(Ver2:TarraContainer),RIGHT(1)
                           PROMPT('Uitvoerhaven:'),AT(9,222),USE(?Ver2:Laadhaven:Prompt),TRN
                           LIST,AT(120,222,204,10),USE(Hav:Haven),DROP(5),FORMAT('200L(2)|M~Haven~L(0)@s50@'),FROM(Queue:FileDrop)
                           PROMPT('Bestemming:'),AT(9,237),USE(?Ver2:Loshaven:Prompt),TRN
                           ENTRY(@s50),AT(120,237,204,10),USE(Ver2:Loshaven)
                           PROMPT('Boekingsnr:'),AT(9,250),USE(?Ver2:Boekingsnr:Prompt),TRN
                           ENTRY(@s50),AT(120,250,204,10),USE(Ver2:Boekingsnr)
                           PROMPT('Aan:'),AT(9,263),USE(?Ver2:Aan:Prompt)
                           ENTRY(@s50),AT(120,264,204,10),USE(Ver2:Aan)
                           PROMPT('BESC/Waiver:'),AT(9,277),USE(?Ver2:BESCWaiver:Prompt)
                           LIST,AT(120,278,204,10),USE(Ver2:BESCWaiver),DROP(2),FROM('N.V.T.|Ja')
                           PROMPT('Expresse Release:'),AT(9,293),USE(?Ver2:ExpresseRelease:Prompt)
                           LIST,AT(120,293,204,10),USE(Ver2:ExpresseRelease),LEFT(1),DROP(5),FROM('JA|#1|Draft mai' & |
  'len|#2|Telex release|#3')
                           PROMPT('Paymentcondition:'),AT(183,25),USE(?PROMPT1)
                           PROMPT('Pro Forma Memo:'),AT(9,310),USE(?Ver2:ProFormaMemo:Prompt),TRN
                           TEXT,AT(120,308,231,28),USE(Ver2:ProFormaMemo,,?Ver2:ProFormaMemo:2)
                           PROMPT('Omschrijving Goederen:'),AT(9,345),USE(?Ver2:OmschrijvingGoederen:Prompt)
                           TEXT,AT(120,342,231,28),USE(Ver2:OmschrijvingGoederen,,?Ver2:OmschrijvingGoederen:2)
                           BUTTON('Lees Vak6 CMR'),AT(359,306),USE(?CMR)
                           BUTTON('Tel totalen'),AT(359,326,67,14),USE(?TelTotalen)
                           STRING(@s50),AT(14,25),USE(Loc:UnloadingAdress1),FONT(,,,FONT:bold)
                           STRING(@s50),AT(14,41),USE(Loc:UnloadingAdress2),FONT(,,,FONT:bold)
                           STRING(@s50),AT(14,54,160),USE(Loc:UnloadingAdress3),FONT(,,,FONT:bold)
                           STRING(@s50),AT(14,67),USE(Loc:UnloadingAdress4),FONT(,,,FONT:bold)
                           PROMPT('Invoice:'),AT(14,83),USE(?PROMPT2)
                           STRING(@s50),AT(49,83,118),USE(Loc:Invoice),FONT(,,,FONT:bold)
                           PROMPT('Delivery terms:'),AT(183,40),USE(?PROMPT1:2)
                         END
                       END
                       BUTTON('&OK'),AT(405,383,49,14),USE(?OK),LEFT,ICON('WAOK.ICO'),DEFAULT,FLAT,MSG('Accept dat' & |
  'a and close the window'),TIP('Accept data and close the window')
                       BUTTON('&Cancel'),AT(457,383,49,14),USE(?Cancel),LEFT,ICON('WACANCEL.ICO'),FLAT,MSG('Cancel operation'), |
  TIP('Cancel operation')
                       BUTTON('Print'),AT(305,383,43,14),USE(?Print),LEFT,ICON(ICON:Print),FLAT
                       PROMPT('Layout:'),AT(181,385),USE(?Layout:Prompt)
                       LIST,AT(212,382),USE(Loc:Layout),DROP(3),FROM('ABN|RABO|BLANCO')
                       CHECK('Packing List:'),AT(56,385),USE(Loc:PackingList)
                       CHECK('Pro Forma:'),AT(9,385,44),USE(Loc:ProForma)
                       CHECK('Sea Way Bill:'),AT(120,385),USE(Loc:SeaWayBill)
                       BUTTON('Excel'),AT(351,383,43,14),USE(?Excel),LEFT,ICON('Excel.ico'),FLAT
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
TakeCompleted          PROCEDURE(),BYTE,PROC,DERIVED
TakeEvent              PROCEDURE(),BYTE,PROC,DERIVED
TakeFieldEvent         PROCEDURE(),BYTE,PROC,DERIVED
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
Resizer              CLASS(WindowResizeClass)
Init                   PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)
                     END

FDB4                 CLASS(FileDropClass)                  ! File drop manager
Q                      &Queue:FileDrop                !Reference to display queue
                     END

BRW9                 CLASS(BrowseClass)                    ! Browse using ?List
Q                      &Queue:Browse                  !Reference to browse queue
Init                   PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)
SetAlerts              PROCEDURE(),DERIVED
                     END

BRW9::Sort0:Locator  StepLocatorClass                      ! Default Locator
FDCB11               CLASS(FileDropComboClass)             ! File drop combo manager
Q                      &Queue:FileDropCombo           !Reference to browse queue type
                     END

FDCB12               CLASS(FileDropComboClass)             ! File drop combo manager
Q                      &Queue:FileDropCombo:1         !Reference to browse queue type
                     END

CurCtrlFeq          LONG
FieldColorQueue     QUEUE
Feq                   LONG
OldColor              LONG
                    END
PackLijstClass      ClassPackLijst
LocalClass          CLASS
VulQ                    PROCEDURE()
ValidateScherm          Procedure()
                    END
SAV:Record      LIKE(Ver2:Record)

  CODE
? DEBUGHOOK(AAARelatie:Record)
? DEBUGHOOK(CMR:Record)
? DEBUGHOOK(DeliveryTerms:Record)
? DEBUGHOOK(Havens:Record)
? DEBUGHOOK(Planning:Record)
? DEBUGHOOK(Verkoop:Record)
? DEBUGHOOK(ViewBetcd:Record)
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
    GlobalErrors.Throw(Msg:InsertIllegal)
    RETURN
  OF ChangeRecord
    ActionMessage = 'Record Will Be Changed'
  OF DeleteRecord
    GlobalErrors.Throw(Msg:DeleteIllegal)
    RETURN
  END
  QuickWindow{PROP:Text} = ActionMessage                   ! Display status message in title bar
  PARENT.Ask


ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
        udpt.Init(UD,'UpdateVerkoopExport','VoorrPln038.clw','VoorrPln.DLL','06/28/2024 @ 01:22PM')    
             
  GlobalErrors.SetProcedureName('UpdateVerkoopExport')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?DLT:Omschrijving
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('Pla:PlanningID',Pla:PlanningID)                    ! Added by: BrowseBox(ABC)
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.HistoryKey = CtrlH
  SELF.AddHistoryFile(Ver2:Record,History::Ver2:Record)
  SELF.AddHistoryField(?Ver2:Containernr,33)
  SELF.AddHistoryField(?Ver2:Sealnr,34)
  SELF.AddHistoryField(?Ver2:Vessel,35)
  SELF.AddHistoryField(?Ver2:TarraContainer,37)
  SELF.AddHistoryField(?Ver2:Loshaven,39)
  SELF.AddHistoryField(?Ver2:Boekingsnr,40)
  SELF.AddHistoryField(?Ver2:Aan,43)
  SELF.AddHistoryField(?Ver2:BESCWaiver,41)
  SELF.AddHistoryField(?Ver2:ExpresseRelease,42)
  SELF.AddHistoryField(?Ver2:ProFormaMemo:2,36)
  SELF.AddHistoryField(?Ver2:OmschrijvingGoederen:2,44)
  SELF.AddUpdateFile(Access:Verkoop)
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  Relate:AAARelatie.Open                                   ! File AAARelatie used by this procedure, so make sure it's RelationManager is open
  Relate:CMR.Open                                          ! File CMR used by this procedure, so make sure it's RelationManager is open
  Relate:DeliveryTerms.Open                                ! File DeliveryTerms used by this procedure, so make sure it's RelationManager is open
  Relate:Havens.Open                                       ! File Havens used by this procedure, so make sure it's RelationManager is open
  Relate:Planning.SetOpenRelated()
  Relate:Planning.Open                                     ! File Planning used by this procedure, so make sure it's RelationManager is open
  Relate:ViewBetcd.Open                                    ! File ViewBetcd used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Primary &= Relate:Verkoop
  IF SELF.Request = ViewRecord AND NOT SELF.BatchProcessing ! Setup actions for ViewOnly Mode
    SELF.InsertAction = Insert:None
    SELF.DeleteAction = Delete:None
    SELF.ChangeAction = Change:None
    SELF.CancelAction = Cancel:Cancel
    SELF.OkControl = 0
  ELSE
    SELF.InsertAction = Insert:None                        ! Inserts not allowed
    SELF.DeleteAction = Delete:None                        ! Deletes not allowed
    SELF.ChangeAction = Change:Caller                      ! Changes allowed
    SELF.CancelAction = Cancel:Cancel+Cancel:Query         ! Confirm cancel
    SELF.OkControl = ?OK
    IF SELF.PrimeUpdate() THEN RETURN Level:Notify.
  END
  BRW9.Init(?List,Queue:Browse.ViewPosition,BRW9::View:Browse,Queue:Browse,Relate:Planning,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  LocalClass.VulQ()
  
  IF NULL(Ver2:PaymentCondition)
      ! initieel van de ralatie overnemen
      Ver2:PaymentCondition=AAARel:PaymentCondition
  END
  
  
  Clear(CMR:Record)
  CMR:VerkoopID=Ver2:VerkoopID
  Set(CMR:CMR_FK1,CMR:CMR_FK1)
  IF Access:CMR.Next()=Level:Benign AND CMR:VerkoopID=Ver2:VerkoopID
      ?CMR{Prop:Hide}=FALSE
  ELSE
      ?CMR{Prop:Hide}=TRUE
  END
  
  Loc:Layout='ABN'
  Loc:PostcodePlaats=CLIP(AREL:Postcode)&Clip(' '&AREL:Plaats)
  IF Ver2:ExternVerkoopID=''
      Loc:Invoice = Ver2:VerkoopID
  ELSE
      Loc:Invoice = Ver2:ExternVerkoopID
  END    
  !Loc:Invoice=CHOOSE(Ver2:ExternVerkoopID='',Ver2:VerkoopID,Ver2:ExternVerkoopID)
  !Message(Loc:Invoice&'|'&Ver2:ExternVerkoopID&'|'&Ver2:VerkoopID)
  Clear(RAD:Record)
  IF Ver2:KlantAlternatiefAdres=0
      Loc:UnloadingAdress1=AREL:FirmaNaam
      Loc:UnloadingAdress2=AREL:Adres1
      Loc:UnloadingAdress3=Loc:PostcodePlaats
      Loc:UnloadingAdress4=AREL:Country
  ELSE
      RAD:ID=Ver2:KlantAlternatiefAdres
      IF Access:RelatieAdres.Fetch(RAD:PK_RelatieAdres)=Level:Benign
          Loc:UnloadingAdress1=RAD:Adres1
          Loc:UnloadingAdress2=RAD:Adres2
          Loc:UnloadingAdress3=CLIP(RAD:Postcode)&CLIP(' '&RAD:Plaats)
          Loc:UnloadingAdress4=RAD:Land
      END
  END
  Do DefineListboxStyle
  Alert(AltKeyPressed)  ! WinEvent : These keys cause a program to crash on Windows 7 and Windows 10.
  Alert(F10Key)         !
  Alert(CtrlF10)        !
  Alert(ShiftF10)       !
  Alert(CtrlShiftF10)   !
  Alert(AltSpace)       !
  WinAlertMouseZoom()
  QuickWindow{Prop:Alrt,255} = CtrlShiftP
  IF SELF.Request = ViewRecord                             ! Configure controls for View Only mode
    DISABLE(?DLT:Omschrijving)
    DISABLE(?BTC:Omschrijving)
    ?Ver2:Containernr{PROP:ReadOnly} = True
    ?Ver2:Sealnr{PROP:ReadOnly} = True
    ?Ver2:Vessel{PROP:ReadOnly} = True
    DISABLE(?Insert)
    DISABLE(?Change)
    DISABLE(?Delete)
    ?Ver2:TarraContainer{PROP:ReadOnly} = True
    DISABLE(?Hav:Haven)
    ?Ver2:Loshaven{PROP:ReadOnly} = True
    ?Ver2:Boekingsnr{PROP:ReadOnly} = True
    ?Ver2:Aan{PROP:ReadOnly} = True
    DISABLE(?Ver2:BESCWaiver)
    DISABLE(?Ver2:ExpresseRelease)
    DISABLE(?CMR)
    DISABLE(?TelTotalen)
    DISABLE(?Print)
    DISABLE(?Loc:Layout)
    DISABLE(?Excel)
  END
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  BRW9.Q &= Queue:Browse
  BRW9.FileLoaded = 1                                      ! This is a 'file loaded' browse
  BRW9.AddSortOrder(,Pla:Planning_FK02)                    ! Add the sort order for Pla:Planning_FK02 for sort order 1
  BRW9.AddRange(Pla:VerkoopID,Ver2:VerkoopID)              ! Add single value range limit for sort order 1
  BRW9.AddLocator(BRW9::Sort0:Locator)                     ! Browse has a locator for sort order 1
  BRW9::Sort0:Locator.Init(,Pla:PlanningID,,BRW9)          ! Initialize the browse locator using  using key: Pla:Planning_FK02 , Pla:PlanningID
  BRW9.AddField(Pla:KG,BRW9.Q.Pla:KG)                      ! Field Pla:KG is a hot field or requires assignment from browse
  BRW9.AddField(Pla:AlternatieveArtikelOms,BRW9.Q.Pla:AlternatieveArtikelOms) ! Field Pla:AlternatieveArtikelOms is a hot field or requires assignment from browse
  BRW9.AddField(Pla:VerkoopKGPrijs,BRW9.Q.Pla:VerkoopKGPrijs) ! Field Pla:VerkoopKGPrijs is a hot field or requires assignment from browse
  BRW9.AddField(Pla:GrossWeight,BRW9.Q.Pla:GrossWeight)    ! Field Pla:GrossWeight is a hot field or requires assignment from browse
  BRW9.AddField(Pla:PlantNumber,BRW9.Q.Pla:PlantNumber)    ! Field Pla:PlantNumber is a hot field or requires assignment from browse
  BRW9.AddField(Pla:PlanningID,BRW9.Q.Pla:PlanningID)      ! Field Pla:PlanningID is a hot field or requires assignment from browse
  BRW9.AddField(Pla:VerkoopID,BRW9.Q.Pla:VerkoopID)        ! Field Pla:VerkoopID is a hot field or requires assignment from browse
  BRW9.AddField(AAArt:ArtikelID,BRW9.Q.AAArt:ArtikelID)    ! Field AAArt:ArtikelID is a hot field or requires assignment from browse
  INIMgr.Fetch('UpdateVerkoopExport',QuickWindow)          ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  FDB4.Init(?Hav:Haven,Queue:FileDrop.ViewPosition,FDB4::View:FileDrop,Queue:FileDrop,Relate:Havens,ThisWindow)
  FDB4.Q &= Queue:FileDrop
  FDB4.AddSortOrder(Hav:Haven_PK)
  FDB4.AddField(Hav:Haven,FDB4.Q.Hav:Haven) !List box control field - type derived from field
  FDB4.AddUpdateField(Hav:Haven,Ver2:Laadhaven)
  ThisWindow.AddItem(FDB4.WindowComponent)
  FDB4.DefaultFill = 0
  BRW9.AskProcedure = 1                                    ! Will call: UpdatePlanningVerkoop
  FDCB11.Init(BTC:Omschrijving,?BTC:Omschrijving,Queue:FileDropCombo.ViewPosition,FDCB11::View:FileDropCombo,Queue:FileDropCombo,Relate:ViewBetcd,ThisWindow,GlobalErrors,0,1,0)
  FDCB11.Q &= Queue:FileDropCombo
  FDCB11.AddSortOrder(BTC:ViewBetcd_PK)
  FDCB11.AddField(BTC:Omschrijving,FDCB11.Q.BTC:Omschrijving) !List box control field - type derived from field
  FDCB11.AddField(BTC:betcdID,FDCB11.Q.BTC:betcdID) !Primary key field - type derived from field
  FDCB11.AddUpdateField(BTC:betcdID,Ver2:PaymentCondition)
  ThisWindow.AddItem(FDCB11.WindowComponent)
  FDCB11.DefaultFill = 0
  FDCB12.Init(DLT:Omschrijving,?DLT:Omschrijving,Queue:FileDropCombo:1.ViewPosition,FDCB12::View:FileDropCombo,Queue:FileDropCombo:1,Relate:DeliveryTerms,ThisWindow,GlobalErrors,0,1,0)
  FDCB12.Q &= Queue:FileDropCombo:1
  FDCB12.AddSortOrder(DLT:PK_DeliveryTerms)
  FDCB12.AddField(DLT:Omschrijving,FDCB12.Q.DLT:Omschrijving) !List box control field - type derived from field
  FDCB12.AddField(DLT:DeliveryTermsID,FDCB12.Q.DLT:DeliveryTermsID) !Primary key field - type derived from field
  FDCB12.AddUpdateField(DLT:DeliveryTermsID,Ver2:DeliveryTermsID)
  ThisWindow.AddItem(FDCB12.WindowComponent)
  FDCB12.DefaultFill = 0
  BRW9.AddToolbarTarget(Toolbar)                           ! Browse accepts toolbar control
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
    Relate:AAARelatie.Close
    Relate:CMR.Close
    Relate:DeliveryTerms.Close
    Relate:Havens.Close
    Relate:Planning.Close
    Relate:ViewBetcd.Close
  END
  IF SELF.Opened
    INIMgr.Update('UpdateVerkoopExport',QuickWindow)       ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
            
   
  RETURN ReturnValue


ThisWindow.PrimeUpdate PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.PrimeUpdate()
    If returnValue = Level:Fatal  ! delete just occured
      ThisNetRefresh.Send('|Verkoop|Havens|Planning|Planning|ViewBetcd|DeliveryTerms|') ! NetTalk (NetRefresh)
    End
  RETURN ReturnValue


ThisWindow.Reset PROCEDURE(BYTE Force=0)

  CODE
  SELF.ForcedReset += Force
  IF QuickWindow{Prop:AcceptAll} THEN RETURN.
  AREL:RelatieID = Ver2:Klant                              ! Assign linking field value
  Access:ARelatie.Fetch(AREL:Relatie_PK)
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


ThisWindow.Run PROCEDURE(USHORT Number,BYTE Request)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Run(Number,Request)
  IF SELF.Request = ViewRecord
    ReturnValue = RequestCancelled                         ! Always return RequestCancelled if the form was opened in ViewRecord mode
  ELSE
    GlobalRequest = Request
    UpdatePlanningVerkoop
    ReturnValue = GlobalResponse
  END
  LocalClass.VulQ()
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
    OF ?Print
          ! eerst de huidige wijzigingen opslaan
          ! moet ik da vragen
      !IF SAV:Record<>Ver2:Record
      !    Message('De gegevens zijn gewijzigd')
      !END
      Access:Verkoop.Update()         ! alles opslaan 
      Loc:Welke=Loc:ProForma*1+Loc:PackingList*2+Loc:SeaWayBill*4
    OF ?Excel
          ! eerst de huidige wijzigingen opslaan
          ! moet ik da vragen
      !IF SAV:Record<>Ver2:Record
      !    Message('De gegevens zijn gewijzigd')
      !END
      Access:Verkoop.Update()         ! alles opslaan 
      Loc:Welke=Loc:ProForma*1+Loc:PackingList*2+Loc:SeaWayBill*4
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?CMR
      ThisWindow.Update()
      Clear(CMR:Record)
      CMR:VerkoopID=Ver2:VerkoopID
      Set(CMR:CMR_FK1,CMR:CMR_FK1)
      IF Access:CMR.Next()=Level:Benign AND CMR:VerkoopID=Ver2:VerkoopID
          Ver2:OmschrijvingGoederen=CMR:Artikel
          Display(?Ver2:OmschrijvingGoederen:2)
      ELSE
          Message('CMR kon niet gevonden worden voor verkoop: '&Ver2:VerkoopID,'CMR ophalen', ICON:Cross)
      END
      
    OF ?TelTotalen
      ThisWindow.Update()
      Ver2:OmschrijvingGoederen='Gross weight:<9>'&Loc:TotaalGrossWeight&'<13,10>'&|
          'Net weight:<9>'&Loc:TotaalKG&'<13,10>'
      IF Loc:TotaalDozen<>0
          Ver2:OmschrijvingGoederen=CLIP(Ver2:OmschrijvingGoederen)&'Cartons:<9><9>'&Loc:TotaalDozen  
      END
      DISPLAY(?Ver2:OmschrijvingGoederen:2)
    OF ?OK
      ThisWindow.Update()
      IF SELF.Request = ViewRecord AND NOT SELF.BatchProcessing THEN
         POST(EVENT:CloseWindow)
      END
    OF ?Print
      ThisWindow.Update()
      ReportPackLijst(Ver2:VerkoopID,Loc:Welke,Loc:Layout)
      ThisWindow.Reset
    OF ?Excel
      ThisWindow.Update()
      ReportPackLijst(Ver2:VerkoopID,Loc:Welke,Loc:Layout,1)
      ThisWindow.Reset
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
    ThisNetRefresh.Send('|Verkoop|Havens|Planning|Planning|ViewBetcd|DeliveryTerms|') ! NetTalk (NetRefresh)
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
  If event() = event:VisibleOnDesktop !or event() = event:moved
    ds_VisibleOnDesktop()
  end
     IF KEYCODE()=CtrlShiftP AND EVENT() = Event:PreAlertKey
       CYCLE
     END
     IF KEYCODE()=CtrlShiftP  
        UD.ShowProcedureInfo('UpdateVerkoopExport',UD.SetApplicationName('VoorrPln','DLL'),QuickWindow{PROP:Hlp},'08/08/2019 @ 04:06PM','06/28/2024 @ 01:22PM','10/11/2024 @ 01:55PM')  
    
       CYCLE
     END
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
  LocalClass.ValidateScherm()
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

LocalClass.VulQ     PROCEDURE()

CODE
   
    Free(Loc:PackLijstQ)
    PackLijstClass.VulPackLijstQ(Ver2:VerkoopID, Loc:PackLijstQ)
    FREE(Loc:TotaalQ)
!Clear(Loc:GNCodes)
    Loop i#=1 TO Records(Loc:PackLijstQ)
        GET(Loc:PackLijstQ,i#)
        Loc:TotaalQ :=: Loc:PackLijstQ
        LTQ2:VerkoopPrijs_NFG=COLOR:None
        LTQ2:VerkoopPrijs_SFG=CHOOSE(LTQ2:VerkoopPrijs=0,COLOR:Red,Color:None)
        LTQ2:VerkoopPrijs_NBG=CHOOSE(LTQ2:VerkoopPrijs=0,COLOR:Red,Color:None)
        LTQ2:VerkoopPrijs_SBG=Color:None
        LTQ2:GrossWeight_NFG=COLOR:None
        LTQ2:GrossWeight_NBG=CHOOSE(LTQ2:GrossWeight<LTQ2:KG,COLOR:Red,Color:None)
        LTQ2:GrossWeight_SFG=CHOOSE(LTQ2:GrossWeight<LTQ2:KG,COLOR:Red,Color:None)
        LTQ2:GrossWeight_SBG=Color:None
        LTQ2:GNCode_NFG=COLOR:None
        LTQ2:GNCode_NBG=CHOOSE(LTQ2:GNCode='',COLOR:Red,Color:None)
        LTQ2:GNCode_SFG=CHOOSE(LTQ2:GNCode='',COLOR:Red,Color:None)
        LTQ2:GNCode_SBG=Color:None
        LTQ2:PlantNumber_NFG=COLOR:None
        LTQ2:PlantNumber_NBG=CHOOSE(LTQ2:PlantNumber='',COLOR:Red,Color:None)
        LTQ2:PlantNumber_SFG=CHOOSE(LTQ2:PlantNumber='',COLOR:Red,Color:None)
        LTQ2:PlantNumber_SBG=Color:None
        LTQ2:ProductieDatum_NFG=COLOR:None
        LTQ2:ProductieDatum_NBG=CHOOSE(LTQ2:ProductieDatum=0,COLOR:Red,Color:None)
        LTQ2:ProductieDatum_SFG=CHOOSE(LTQ2:ProductieDatum=0,COLOR:Red,Color:None)
        LTQ2:ProductieDatum_SBG=Color:None
        LTQ2:THTDatum_NFG=COLOR:None
        LTQ2:THTDatum_NBG=CHOOSE(LTQ2:THTDatum=0,COLOR:Red,Color:None)
        LTQ2:THTDatum_SFG=CHOOSE(LTQ2:THTDatum=0,COLOR:Red,Color:None)
        LTQ2:THTDatum_SBG=Color:None
!    IF Loc:GNCodes=''
!        Loc:GNCodes=LTQ:GNCode
!    ELSIF NOT Instring(LTQ:GNCode,Loc:GNCodes,1,1)
!        Loc:GNCodes=CLIP(Loc:GNCodes)&', '&LTQ:GNCode
!    END
        Add(Loc:TotaalQ)
    Loc:TotaalDozen+=LTQ:Dozen
    Loc:TotaalKG+=LTQ:KG
    Loc:TotaalGrossWeight+=LTQ:GrossWeight
!    Loc:TotaalBedrag+=LTQ:KG*LTQ:VerkoopPrijs
    END
    RETURN
        
LocalClass.ValidateScherm   Procedure()

CODE
    IF Ver2:PaymentCondition=0
        ?BTC:Omschrijving{PROP:Background}=COLOR:Red
    ELSE
        ?BTC:Omschrijving{PROP:Background}=COLOR:None
    END
    IF Ver2:DeliveryTermsID=0
        ?DLT:Omschrijving{PROP:Background}=COLOR:Red
    ELSE
        ?DLT:Omschrijving{PROP:Background}=COLOR:None
    END
    IF Ver2:Containernr=''
        ?Ver2:Containernr{PROP:Background}=COLOR:Red
    ELSE
        ?Ver2:Containernr{PROP:Background}=COLOR:None
    END
    IF Ver2:Sealnr=''
        ?Ver2:Sealnr{PROP:Background}=COLOR:Red
    ELSE
        ?Ver2:Sealnr{PROP:Background}=COLOR:None
    END
    IF Ver2:Vessel=''
        ?Ver2:Vessel{PROP:Background}=COLOR:Red
    ELSE
        ?Ver2:Vessel{PROP:Background}=COLOR:None
    END

Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window


BRW9.Init PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)

  CODE
  PARENT.Init(ListBox,Posit,V,Q,RM,WM)
  IF WM.Request <> ViewRecord                              ! If called for anything other than ViewMode, make the insert, change & delete controls available
    SELF.InsertControl=?Insert
    SELF.ChangeControl=?Change
    SELF.DeleteControl=?Delete
  END


BRW9.SetAlerts PROCEDURE

  CODE
  SELF.EditViaPopup = False
  PARENT.SetAlerts

