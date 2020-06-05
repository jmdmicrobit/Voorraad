

   MEMBER('VoorrPln.clw')                                  ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABDROPS.INC'),ONCE
   INCLUDE('ABPOPUP.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABUTIL.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('VOORRPLN036.INC'),ONCE        !Local module procedure declarations
                     END


!!! <summary>
!!! Generated from procedure template - Window
!!! Form Inkoop
!!! </summary>
UpdateInkoop PROCEDURE (LONG PRM:LeverancierID)

CurrentTab           STRING(80)                            ! 
Loc:RedenRetour      CSTRING(51)                           ! 
Loc:RetourDatum      DATE                                  ! 
ActionMessage        CSTRING(40)                           ! 
Loc:FirmaNaam        CSTRING(51)                           ! 
Sav:Leverancier      LONG                                  ! 
FDCB4::View:FileDropCombo VIEW(Relatie)
                       PROJECT(Rel:RelatieID)
                       PROJECT(Rel:FirmaNaam)
                       PROJECT(Rel:Type)
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
                       PROJECT(Pla:InkoopKGPrijs)
                       PROJECT(Pla:MutatieGemaakt)
                       PROJECT(Pla:Verwerkt)
                       PROJECT(Pla:Instructie)
                       PROJECT(Pla:Transport)
                       PROJECT(Pla:Memo)
                       PROJECT(Pla:PlanningID)
                       PROJECT(Pla:InkoopID)
                       PROJECT(Pla:VerpakkingID)
                       PROJECT(Pla:CelID)
                       PROJECT(Pla:CelLocatieID)
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
                       JOIN(CL:PK_CelLocatie,Pla:CelLocatieID)
                         PROJECT(CL:Locatienaam)
                         PROJECT(CL:CelLocatieID)
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
Pla:InkoopKGPrijs      LIKE(Pla:InkoopKGPrijs)        !List box control field - type derived from field
Pla:InkoopKGPrijs_NormalFG LONG                       !Normal forground color
Pla:InkoopKGPrijs_NormalBG LONG                       !Normal background color
Pla:InkoopKGPrijs_SelectedFG LONG                     !Selected forground color
Pla:InkoopKGPrijs_SelectedBG LONG                     !Selected background color
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
Ver:VerpakkingOmschrijving LIKE(Ver:VerpakkingOmschrijving) !List box control field - type derived from field
Ver:VerpakkingOmschrijving_NormalFG LONG              !Normal forground color
Ver:VerpakkingOmschrijving_NormalBG LONG              !Normal background color
Ver:VerpakkingOmschrijving_SelectedFG LONG            !Selected forground color
Ver:VerpakkingOmschrijving_SelectedBG LONG            !Selected background color
CEL:CelOms             LIKE(CEL:CelOms)               !List box control field - type derived from field
CEL:CelOms_NormalFG    LONG                           !Normal forground color
CEL:CelOms_NormalBG    LONG                           !Normal background color
CEL:CelOms_SelectedFG  LONG                           !Selected forground color
CEL:CelOms_SelectedBG  LONG                           !Selected background color
CL:Locatienaam         LIKE(CL:Locatienaam)           !List box control field - type derived from field
CL:Locatienaam_NormalFG LONG                          !Normal forground color
CL:Locatienaam_NormalBG LONG                          !Normal background color
CL:Locatienaam_SelectedFG LONG                        !Selected forground color
CL:Locatienaam_SelectedBG LONG                        !Selected background color
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
Pla:PlanningID         LIKE(Pla:PlanningID)           !Primary key field - type derived from field
Pla:InkoopID           LIKE(Pla:InkoopID)             !Browse key field - type derived from field
Art:ArtikelID          LIKE(Art:ArtikelID)            !Related join file key field - type derived from field
Ver:VerpakkingID       LIKE(Ver:VerpakkingID)         !Related join file key field - type derived from field
CEL:CelID              LIKE(CEL:CelID)                !Related join file key field - type derived from field
CL:CelLocatieID        LIKE(CL:CelLocatieID)          !Related join file key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
FDB12::View:FileDrop VIEW(Gebruiker)
                       PROJECT(Geb:VolledigeNaam)
                       PROJECT(Geb:ID)
                     END
FDB14::View:FileDrop VIEW(DeliveryTerms)
                       PROJECT(DLT:Omschrijving)
                       PROJECT(DLT:DeliveryTermsID)
                     END
Queue:FileDropCombo  QUEUE                            !
Loc:FirmaNaam          LIKE(Loc:FirmaNaam)            !List box control field - type derived from local data
Rel:RelatieID          LIKE(Rel:RelatieID)            !Browse hot field - type derived from field
Rel:FirmaNaam          LIKE(Rel:FirmaNaam)            !Browse hot field - type derived from field
Rel:Type               LIKE(Rel:Type)                 !Browse hot field - type derived from field
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
Geb:VolledigeNaam      LIKE(Geb:VolledigeNaam)        !List box control field - type derived from field
Geb:ID                 LIKE(Geb:ID)                   !Primary key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
Queue:FileDrop:1     QUEUE                            !
DLT:Omschrijving       LIKE(DLT:Omschrijving)         !List box control field - type derived from field
DLT:DeliveryTermsID    LIKE(DLT:DeliveryTermsID)      !Primary key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
LocEnableEnterByTab  BYTE(1)                               !Used by the ENTER Instead of Tab template
EnterByTabManager    EnterByTabClass
History::Ink:Record  LIKE(Ink:RECORD),THREAD
NetLocalRefreshDate     Long     ! NetTalk (NetRefresh)
NetLocalRefreshTime     Long
NetLocalDependancies    String('|Inkoop|Relatie|RelatieAdres|Planning|ViewArtikel|Verpakking|Cel|CelLocatie|Gebruiker|DeliveryTerms|')
QuickWindow          WINDOW('Form Inkoop'),AT(,,593,351),FONT('MS Sans Serif',8,,,CHARSET:DEFAULT),RESIZE,CENTER, |
  GRAY,IMM,MAX,MDI,HLP('UpdateInkoop'),SYSTEM
                       PROMPT('Inkoop:'),AT(3,6),USE(?InkoopPrompt)
                       STRING(@n_10),AT(79,6),USE(Ink:InkoopID)
                       PROMPT('Leverancier:'),AT(3,19),USE(?Ink:Leverancier:Prompt),TRN
                       COMBO(@s50),AT(77,19,285,10),USE(Rel:FirmaNaam),DROP(25),FORMAT('200L(2)|M~Firmanaam~C(0)@s50@'), |
  FROM(Queue:FileDropCombo),IMM,REQ
                       BUTTON('...'),AT(367,17,22),USE(?LookUp)
                       BUTTON('Order Retour boeken'),AT(422,19,127),USE(?btnRetour)
                       PROMPT('Afwijkend laadadres:'),AT(2,31),USE(?PROMPT1)
                       COMBO(@s100),AT(77,32,285,10),USE(RAD:Adres1),DROP(5),FORMAT('100L(2)|M~Naam~C(0)@s100@' & |
  '100L(2)|M~Plaats~C(0)@s100@40L(2)|M~Postcode~C(0)@s10@100L(2)|M~Adres 2~C(0)@s100@'),FROM(Queue:FileDropCombo:1), |
  IMM
                       PROMPT('Planningsdatum:'),AT(2,46),USE(?Ink:Planning_DATE:Prompt:2)
                       SPIN(@d6-),AT(77,47,60,10),USE(Ink:Planning_DATE,,?Ink:Planning_DATE:2)
                       BUTTON('...'),AT(141,46,12,12),USE(?Calendar)
                       PROMPT('Planningstijd:'),AT(159,47),USE(?Ink:Planning_TIME:Prompt),TRN
                       ENTRY(@t7),AT(235,47,60,10),USE(Ink:Planning_TIME)
                       CHECK('Verwerkt'),AT(422,46),USE(Ink:Verwerkt),DISABLE
                       PROMPT('Instructie:'),AT(2,60),USE(?Ink:Instructie:Prompt),HIDE,TRN
                       ENTRY(@s100),AT(77,60,282,10),USE(Ink:Instructie),HIDE
                       PROMPT('Transport:'),AT(2,74),USE(?Ink:Transport:Prompt),HIDE,TRN
                       ENTRY(@s100),AT(77,74,282,10),USE(Ink:Transport),HIDE
                       PROMPT('Transportkosten:'),AT(2,87),USE(?Ink:TransportKosten:Prompt)
                       ENTRY(@n-13`3),AT(77,86,60,10),USE(Ink:TransportKosten),RIGHT(2)
                       PROMPT('Extrakosten:'),AT(3,100),USE(?Ink:ExtraKosten:Prompt)
                       ENTRY(@n13`3),AT(77,100,60,10),USE(Ink:ExtraKosten),RIGHT(2)
                       PROMPT('Extra Kosten:'),AT(3,113),USE(?Ink:ExtraKosten:Prompt:2)
                       TEXT,AT(77,114,282,38),USE(Ink:ExtraKostenTekst),VSCROLL,BOXED
                       PROMPT('Confirmation Date:'),AT(3,157),USE(?Ink:ConfirmationDate_DATE:Prompt)
                       ENTRY(@d17),AT(77,157,60,10),USE(Ink:ConfirmationDate_DATE)
                       PROMPT('Inkoper:'),AT(146,157),USE(?PROMPT2)
                       LIST,AT(181,157,178,10),USE(Geb:VolledigeNaam),DROP(15),FORMAT('200L(2)|M~Volledige Naa' & |
  'm~L(0)@s50@'),FROM(Queue:FileDrop)
                       PROMPT('Delivery Terms:'),AT(364,158),USE(?PROMPT3)
                       LIST,AT(419,156,141,10),USE(DLT:Omschrijving),DROP(5),FORMAT('240L(2)|M~Omschrijving~L(0)@s60@'), |
  FROM(Queue:FileDrop:1)
                       PROMPT('Loading Date:'),AT(3,177),USE(?Ink:LoadingDate:Prompt)
                       ENTRY(@s50),AT(77,176,165,10),USE(Ink:LoadingDate)
                       LIST,AT(5,196,587,129),USE(?List),HVSCROLL,FORMAT('[40L(2)|*~ID~C(0)@s30@120L(2)|*~Omsc' & |
  'hrijving~C(0)@s60@]|~Artikel~59R(2)|*~KG~C(2)@n-15`2@25R(2)|*~Pallets~C(0)@n-14.@56R' & |
  '(2)|*~Inkoop KG-Prijs~C(0)@n-13`3@[35R(2)|*I~Mutatie~C(0)@p p@35R(2)|*I~Verwerkt~C(0' & |
  ')@p p@]|~Inslaan~50L(2)|*~Verpakking~C(0)@s50@[50L(2)|*~Cel~C(0)@s50@50L(2)|*~Locati' & |
  'e~C(0)@s50@]|~Cel~100L(2)|*~Instructie~C(0)@s100@100L(2)|*~Transport~C(0)@s100@100L(' & |
  '2)|*~Memo~C(0)@s100@'),FROM(Queue:Browse),IMM
                       BUTTON('&Toevoegen'),AT(326,330,51,19),USE(?Insert),DEFAULT
                       BUTTON('&Wijzigen'),AT(378,330,42,19),USE(?Change)
                       BUTTON('&Verwijderen'),AT(422,330,42,19),USE(?Delete)
                       BUTTON('&OK'),AT(478,334,49,14),USE(?OK),LEFT,ICON('WAOK.ICO'),FLAT,MSG('Accept data an' & |
  'd close the window'),TIP('Accept data and close the window')
                       BUTTON('&Annuleren'),AT(531,334,61,14),USE(?Cancel),LEFT,ICON('WACANCEL.ICO'),FLAT,MSG('Cancel operation'), |
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
TakeCompleted          PROCEDURE(),BYTE,PROC,DERIVED
TakeEvent              PROCEDURE(),BYTE,PROC,DERIVED
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
SetQueueRecord         PROCEDURE(),DERIVED
                     END

BRW7::Sort0:Locator  StepLocatorClass                      ! Default Locator
Resizer              CLASS(WindowResizeClass)
Init                   PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)
                     END

Calendar8            CalendarClass
FDB12                CLASS(FileDropClass)                  ! File drop manager
Q                      &Queue:FileDrop                !Reference to display queue
                     END

FDB14                CLASS(FileDropClass)                  ! File drop manager
Q                      &Queue:FileDrop:1              !Reference to display queue
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
UpdateVerwerkStatus ROUTINE
	Verwerkt# = true
	NoRecord# = true
	
	CLEAR(Pla:Record)
	Pla:InkoopID = Ink:InkoopID
	CLEAR(Pla:PlanningID,-1)
	SET(Pla:Planning_FK01,Pla:Planning_FK01)
	LOOP
		Access:Planning.TryNext()
		IF ERROR() THEN BREAK.
		
		IF Pla:InkoopID <> Ink:InkoopID THEN BREAK.
		
		NoRecord# = false
		
		IF NOT(Pla:Verwerkt)
			Verwerkt# = false
			BREAK
		.
	.
	
	IF NOT(NoRecord#)
		Ink:Verwerkt = Verwerkt#
		Access:Inkoop.TryUpdate()
		IF ERROR() THEN
			  IF ERRORCODE() = 90 THEN
				  MESSAGE('Inkoop-record kon niet worden bijgewerkt | SQL Error('&FILEERRORCODE()&'):'&FILEERROR()&')')
			  ELSE
				  MESSAGE('Inkoop-record kon niet worden bijgewerkt | Error('&ERRORCODE()&'):'&ERROR()&')')
			.
		.
	.
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
  GlobalErrors.SetProcedureName('UpdateInkoop')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?InkoopPrompt
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('Pla:PlanningID',Pla:PlanningID)                    ! Added by: BrowseBox(ABC)
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.HistoryKey = CtrlH
  SELF.AddHistoryFile(Ink:Record,History::Ink:Record)
  SELF.AddHistoryField(?Ink:InkoopID,1)
  SELF.AddHistoryField(?Ink:Planning_DATE:2,6)
  SELF.AddHistoryField(?Ink:Planning_TIME,7)
  SELF.AddHistoryField(?Ink:Verwerkt,3)
  SELF.AddHistoryField(?Ink:Instructie,8)
  SELF.AddHistoryField(?Ink:Transport,9)
  SELF.AddHistoryField(?Ink:TransportKosten,13)
  SELF.AddHistoryField(?Ink:ExtraKosten,11)
  SELF.AddHistoryField(?Ink:ExtraKostenTekst,12)
  SELF.AddHistoryField(?Ink:ConfirmationDate_DATE,21)
  SELF.AddHistoryField(?Ink:LoadingDate,29)
  SELF.AddUpdateFile(Access:Inkoop)
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  Relate:ACelLocatie.Open                                  ! File ACelLocatie used by this procedure, so make sure it's RelationManager is open
  Relate:DeliveryTerms.Open                                ! File DeliveryTerms used by this procedure, so make sure it's RelationManager is open
  Relate:Gebruiker.Open                                    ! File Gebruiker used by this procedure, so make sure it's RelationManager is open
  Relate:Inkoop.SetOpenRelated()
  Relate:Inkoop.Open                                       ! File Inkoop used by this procedure, so make sure it's RelationManager is open
  Relate:Mutatie.Open                                      ! File Mutatie used by this procedure, so make sure it's RelationManager is open
  Relate:Partij.Open                                       ! File Partij used by this procedure, so make sure it's RelationManager is open
  Relate:RelatieAdres.Open                                 ! File RelatieAdres used by this procedure, so make sure it's RelationManager is open
  Access:Verkoop.UseFile                                   ! File referenced in 'Other Files' so need to inform it's FileManager
  SELF.FilesOpened = True
  SELF.Primary &= Relate:Inkoop
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
  IF ThisWindow.Request = InsertRecord THEN
  	IF INK:Planning_DATE=0 THEN
  		INK:Planning_DATE = TODAY()
      END
      
      Ink:Leverancier = PRM:LeverancierID
      
      CLEAR(Rel:Record)
      Rel:RelatieID = PRM:LeverancierID
      
      INK:ConfirmationDate_DATE = today()
      INK:GebruikerID=IGB:GebruikerID
      Access:Relatie.TryFetch(Rel:Relatie_PK)
      
      CLEAR(RAD:Record)    
  ELSIF Self.Request = ChangeRecord THEN
      CLEAR(RAD:Record)
      RAD:ID = Ink:LeverancierAlternatiefAdres
      IF Access:RelatieAdres.Fetch(RAD:PK_RelatieAdres) <> Level:Benign THEN
          CLEAR(RAD:Record)
      END
      Sav:Leverancier = Ink:Leverancier
  END
  BRW7.Init(?List,Queue:Browse.ViewPosition,BRW7::View:Browse,Queue:Browse,Relate:Planning,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  IF (IGB:BekijkenPrijzen <> 1) THEN
  	HIDE(?Ink:ExtraKosten)
  	HIDE(?Ink:ExtraKostenTekst)
  	HIDE(?Ink:ExtraKosten:Prompt)
      HIDE(?Ink:ExtraKosten:Prompt:2)
      HIDE(?Ink:TransportKosten)
      HIDE(?Ink:TransportKosten:Prompt)
  	?List{PROPLIST:Width, 5} = 0
  END
  
  IF GLO:HidePlanningInstructie = 1 THEN
      ?List{PROPLIST:Width, 11} = 0 
  END    
  	
  IF Ink:Verwerkt=1
      DISABLE(?InkoopPrompt,?Ink:ExtraKostenTekst)
      DISABLE(?Insert)
      DISABLE(?Delete)
      UNHIDE(?BtnRetour)
      ENABLE(?BtnRetour)
      ?BtnRetour{Prop:Text}='Retour reden:'&Ink:RedenRetour&' '&Format(Ink:RetourDatum_DATE,@d5-)
  
  ELSE
      HIDE(?BtnRetour)
  END
  WinAlertMouseZoom()
  Do DefineListboxStyle
  IF SELF.Request = ViewRecord                             ! Configure controls for View Only mode
    DISABLE(?Rel:FirmaNaam)
    DISABLE(?LookUp)
    DISABLE(?btnRetour)
    DISABLE(?RAD:Adres1)
    DISABLE(?Ink:Planning_DATE:2)
    DISABLE(?Calendar)
    DISABLE(?Ink:Planning_TIME)
    DISABLE(?Ink:Verwerkt)
    DISABLE(?Ink:Instructie)
    DISABLE(?Ink:Transport)
    DISABLE(?Ink:TransportKosten)
    DISABLE(?Ink:ExtraKosten)
    DISABLE(?Ink:ExtraKostenTekst)
    ?Ink:ConfirmationDate_DATE{PROP:ReadOnly} = True
    DISABLE(?Geb:VolledigeNaam)
    DISABLE(?DLT:Omschrijving)
    ?Ink:LoadingDate{PROP:ReadOnly} = True
    DISABLE(?Insert)
    DISABLE(?Change)
    DISABLE(?Delete)
  END
  BRW7.Q &= Queue:Browse
  BRW7.AddSortOrder(,Pla:Planning_FK01)                    ! Add the sort order for Pla:Planning_FK01 for sort order 1
  BRW7.AddRange(Pla:InkoopID,Relate:Planning,Relate:Inkoop) ! Add file relationship range limit for sort order 1
  BRW7.AddLocator(BRW7::Sort0:Locator)                     ! Browse has a locator for sort order 1
  BRW7::Sort0:Locator.Init(,Pla:PlanningID,1,BRW7)         ! Initialize the browse locator using  using key: Pla:Planning_FK01 , Pla:PlanningID
  ?List{PROP:IconList,1} = '~off.ico'
  ?List{PROP:IconList,2} = '~on.ico'
  BRW7.AddField(Pla:ArtikelID,BRW7.Q.Pla:ArtikelID)        ! Field Pla:ArtikelID is a hot field or requires assignment from browse
  BRW7.AddField(Art:ArtikelOms,BRW7.Q.Art:ArtikelOms)      ! Field Art:ArtikelOms is a hot field or requires assignment from browse
  BRW7.AddField(Pla:KG,BRW7.Q.Pla:KG)                      ! Field Pla:KG is a hot field or requires assignment from browse
  BRW7.AddField(Pla:Pallets,BRW7.Q.Pla:Pallets)            ! Field Pla:Pallets is a hot field or requires assignment from browse
  BRW7.AddField(Pla:InkoopKGPrijs,BRW7.Q.Pla:InkoopKGPrijs) ! Field Pla:InkoopKGPrijs is a hot field or requires assignment from browse
  BRW7.AddField(Pla:MutatieGemaakt,BRW7.Q.Pla:MutatieGemaakt) ! Field Pla:MutatieGemaakt is a hot field or requires assignment from browse
  BRW7.AddField(Pla:Verwerkt,BRW7.Q.Pla:Verwerkt)          ! Field Pla:Verwerkt is a hot field or requires assignment from browse
  BRW7.AddField(Ver:VerpakkingOmschrijving,BRW7.Q.Ver:VerpakkingOmschrijving) ! Field Ver:VerpakkingOmschrijving is a hot field or requires assignment from browse
  BRW7.AddField(CEL:CelOms,BRW7.Q.CEL:CelOms)              ! Field CEL:CelOms is a hot field or requires assignment from browse
  BRW7.AddField(CL:Locatienaam,BRW7.Q.CL:Locatienaam)      ! Field CL:Locatienaam is a hot field or requires assignment from browse
  BRW7.AddField(Pla:Instructie,BRW7.Q.Pla:Instructie)      ! Field Pla:Instructie is a hot field or requires assignment from browse
  BRW7.AddField(Pla:Transport,BRW7.Q.Pla:Transport)        ! Field Pla:Transport is a hot field or requires assignment from browse
  BRW7.AddField(Pla:Memo,BRW7.Q.Pla:Memo)                  ! Field Pla:Memo is a hot field or requires assignment from browse
  BRW7.AddField(Pla:PlanningID,BRW7.Q.Pla:PlanningID)      ! Field Pla:PlanningID is a hot field or requires assignment from browse
  BRW7.AddField(Pla:InkoopID,BRW7.Q.Pla:InkoopID)          ! Field Pla:InkoopID is a hot field or requires assignment from browse
  BRW7.AddField(Art:ArtikelID,BRW7.Q.Art:ArtikelID)        ! Field Art:ArtikelID is a hot field or requires assignment from browse
  BRW7.AddField(Ver:VerpakkingID,BRW7.Q.Ver:VerpakkingID)  ! Field Ver:VerpakkingID is a hot field or requires assignment from browse
  BRW7.AddField(CEL:CelID,BRW7.Q.CEL:CelID)                ! Field CEL:CelID is a hot field or requires assignment from browse
  BRW7.AddField(CL:CelLocatieID,BRW7.Q.CL:CelLocatieID)    ! Field CL:CelLocatieID is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('UpdateInkoop',QuickWindow)                 ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  FDCB4.Init(Rel:FirmaNaam,?Rel:FirmaNaam,Queue:FileDropCombo.ViewPosition,FDCB4::View:FileDropCombo,Queue:FileDropCombo,Relate:Relatie,ThisWindow,GlobalErrors,0,0,0)
  FDCB4.RemoveDuplicatesFlag = TRUE
  FDCB4.Q &= Queue:FileDropCombo
  FDCB4.AddSortOrder(Rel:Relatie_FK01)
  FDCB4.SetFilter('Rel:Type=''S''')
  FDCB4.AddField(Loc:FirmaNaam,FDCB4.Q.Loc:FirmaNaam) !List box control field - type derived from local data
  FDCB4.AddField(Rel:RelatieID,FDCB4.Q.Rel:RelatieID) !Browse hot field - type derived from field
  FDCB4.AddField(Rel:FirmaNaam,FDCB4.Q.Rel:FirmaNaam) !Browse hot field - type derived from field
  FDCB4.AddField(Rel:Type,FDCB4.Q.Rel:Type) !Browse hot field - type derived from field
  FDCB4.AddUpdateField(Rel:RelatieID,Ink:Leverancier)
  ThisWindow.AddItem(FDCB4.WindowComponent)
  FDCB4.DefaultFill = 0
  FDCB10.Init(RAD:Adres1,?RAD:Adres1,Queue:FileDropCombo:1.ViewPosition,FDCB10::View:FileDropCombo,Queue:FileDropCombo:1,Relate:RelatieAdres,ThisWindow,GlobalErrors,0,0,0)
  FDCB10.Q &= Queue:FileDropCombo:1
  FDCB10.AddSortOrder(RAD:RelatieID_ID_K)
  FDCB10.AddRange(RAD:RelatieID,Ink:Leverancier)
  FDCB10.AddField(RAD:Adres1,FDCB10.Q.RAD:Adres1) !List box control field - type derived from field
  FDCB10.AddField(RAD:Plaats,FDCB10.Q.RAD:Plaats) !List box control field - type derived from field
  FDCB10.AddField(RAD:Postcode,FDCB10.Q.RAD:Postcode) !List box control field - type derived from field
  FDCB10.AddField(RAD:Adres2,FDCB10.Q.RAD:Adres2) !List box control field - type derived from field
  FDCB10.AddField(RAD:ID,FDCB10.Q.RAD:ID) !Primary key field - type derived from field
  FDCB10.AddUpdateField(RAD:ID,Ink:LeverancierAlternatiefAdres)
  ThisWindow.AddItem(FDCB10.WindowComponent)
  FDCB10.DefaultFill = 0
  BRW7.AskProcedure = 1                                    ! Will call: UpdatePlanningInkoop
  FDB12.Init(?Geb:VolledigeNaam,Queue:FileDrop.ViewPosition,FDB12::View:FileDrop,Queue:FileDrop,Relate:Gebruiker,ThisWindow)
  FDB12.Q &= Queue:FileDrop
  FDB12.AddSortOrder(Geb:FK1_Gebruiker)
  FDB12.SetFilter('Geb:VolledigeNaam<<>''''')
  FDB12.AddField(Geb:VolledigeNaam,FDB12.Q.Geb:VolledigeNaam) !List box control field - type derived from field
  FDB12.AddField(Geb:ID,FDB12.Q.Geb:ID) !Primary key field - type derived from field
  FDB12.AddUpdateField(Geb:ID,Ink:GebruikerID)
  ThisWindow.AddItem(FDB12.WindowComponent)
  FDB12.DefaultFill = 0
  FDB14.Init(?DLT:Omschrijving,Queue:FileDrop:1.ViewPosition,FDB14::View:FileDrop,Queue:FileDrop:1,Relate:DeliveryTerms,ThisWindow)
  FDB14.Q &= Queue:FileDrop:1
  FDB14.AddSortOrder(DLT:PK_DeliveryTerms)
  FDB14.AddField(DLT:Omschrijving,FDB14.Q.DLT:Omschrijving) !List box control field - type derived from field
  FDB14.AddField(DLT:DeliveryTermsID,FDB14.Q.DLT:DeliveryTermsID) !Primary key field - type derived from field
  FDB14.AddUpdateField(DLT:DeliveryTermsID,Ink:DeliveryTermsID)
  ThisWindow.AddItem(FDB14.WindowComponent)
  FDB14.DefaultFill = 0
  BRW7.AddToolbarTarget(Toolbar)                           ! Browse accepts toolbar control
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
    Relate:ACelLocatie.Close
    Relate:DeliveryTerms.Close
    Relate:Gebruiker.Close
    Relate:Inkoop.Close
    Relate:Mutatie.Close
    Relate:Partij.Close
    Relate:RelatieAdres.Close
  END
  IF SELF.Opened
    INIMgr.Update('UpdateInkoop',QuickWindow)              ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.PrimeUpdate PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.PrimeUpdate()
    If returnValue = Level:Fatal  ! delete just occured
      ThisNetRefresh.Send('|Inkoop|Relatie|RelatieAdres|Planning|Planning|Gebruiker|DeliveryTerms|') ! NetTalk (NetRefresh)
    End
  	If returnValue = Level:Fatal  ! delete just occured
    	NetRefreshPlanningViews()
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
  if GlobalRequest=DeleteRecord               ! Delete code overrulen extra controles op planning / partijen
      IF Message('Weet u zeker dat deze inkoop verwijderd moet worden','Bevestiging verwijderen van '&Ink:InkoopID,ICON:Question, BUTTON:YES+BUTTON:NO, BUTTON:NO)=BUTTON:Yes
          ! handmatig verwijderen
          ! De planning gaat via de relations
          ! kijken of er mutaties zijn
          Clear(Pla:Record)
          Pla:InkoopID=Ink:InkoopID
          Set(Pla:Planning_FK01,Pla:Planning_FK01)
          Loop Until Access:Planning.Next()
              IF NOT Pla:InkoopID=Ink:InkoopID THEN BREAK.
              Clear(Mut:Record)
              Mut:PlanningID=Pla:PlanningID
              Set(Mut:Mutatie_FK02,Mut:Mutatie_FK02)
              Loop Until Access:Mutatie.Next()
                  IF NOT Mut:PlanningID=Pla:PlanningID THEN BREAK.
                  Access:Mutatie.DeleteRecord(FALSE)
              END
              Access:Planning.DeleteRecord(FALSE)
          END
          Clear(Par:Record)
          Par:InkoopID=Ink:InkoopID
          Set(Par:Partij_FK03,Par:Partij_FK03)
          Loop Until Access:Partij.Next()
              IF NOT Par:InkoopID=Ink:InkoopID THEN BREAK.
              Access:Partij.DeleteRecord(FALSE)
          END
          Access:Inkoop.DeleteRecord(FALSE)
      END
      Return ReturnValue
  END
  !      
  ReturnValue = PARENT.Run()
  IF SELF.Request = ViewRecord                             ! In View Only mode always signal RequestCancelled
    ReturnValue = RequestCancelled
  END
  RETURN ReturnValue


ThisWindow.Run PROCEDURE(USHORT Number,BYTE Request)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Run(Number,Request)
  ! Als de Status op View dan moet de UpdatePlanningInkoop ook in View mode geopend worden
    IF SELF.Request = ViewRecord      
        GlobalRequest = ViewRecord
        UpdatePlanningInkoop
        ReturnValue = GlobalResponse
    END
  IF SELF.Request = ViewRecord
    ReturnValue = RequestCancelled                         ! Always return RequestCancelled if the form was opened in ViewRecord mode
  ELSE
    GlobalRequest = Request
    UpdatePlanningInkoop
    ReturnValue = GlobalResponse
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
    OF ?LookUp
      	AREL:FirmaNaam=Rel:FirmaNaam
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?LookUp
      ThisWindow.Update()
      GlobalRequest = SelectRecord
      SelectArelatie('S')
      ThisWindow.Reset
      	if globalresponse=RequestCompleted
      		Ink:Leverancier = AREL:RelatieID
      		FDCB4.ResetQueue(True)
      	END
      		
    OF ?btnRetour
      ThisWindow.Update()
          Loc:RedenRetour=Ink:RedenRetour
          Loc:RetourDatum=Ink:RetourDatum_DATE
          IF WindowRedenRetour('Inkoop',Ink:InkoopID, Loc:RedenRetour, Loc:RetourDatum) = RequestCompleted
              Ink:RedenRetour=Loc:RedenRetour
              Ink:RetourDatum_DATE=Loc:RetourDatum
             ! Message('success '&Ink:RedenRetour&','&Ink:RetourDatum_DATE)
              ?BtnRetour{Prop:Text}='Retour reden:'&Ink:RedenRetour&' '&Format(Ink:RetourDatum_DATE,@d5-)
             ! DISABLE(?BtnRetour)
            BRW7.ResetQueue(FALSE)
        END      
      !IF NOT WindowInkoopRedenRetour()=RequestCompleted
      !    RETURN ReturnValue
      !END
      !
      !?BtnRetour{Prop:Text}='Retour reden:'&Ink:RedenRetour
      !Clear(Pla:Record)
      !Pla:InkoopID=Ink:InkoopID
      !Set(Pla:Planning_FK01,Pla:Planning_FK01)
      !LOOP UNTIL Access:Planning.Next()
      !    IF NOT Pla:InkoopID=Ink:InkoopID THEN BREAK.
      !    ! De regels die tegengeboekt moeten worden zijn verwerkt=true
      !    ! De nieuwe regels zetten we eerst op false, anders komen we in een loop
      !    IF Pla:Verwerkt=FALSE THEN CYCLE.
      !    ! Opslaan
      !    ! dan vullen
      !    APla:Record=Pla:Record
      !    APla:Verwerkt=FALSE
      !    APla:MutatieGemaakt=FALSE
      !    APla:KG=-PLA:KG
      !    APla:Pallets = -Pla:Pallets
      !    APla:MutatieKG=-Pla:MutatieKG
      !    APla:MutatiePallets=-Pla:MutatiePallets
      !    APla:Memo=CLIP(Pla:Memo)&'RETOUR'
      !    Access:APlanning.PrimeRecord(TRUE)
      !    
      !    Clear(Mut:Record)
      !    Mut:PlanningID=Pla:PlanningID
      !    Set(Mut:Mutatie_FK02,Mut:Mutatie_FK02)
      !    Loop Until Access:Mutatie.Next()
      !        IF NOT (Mut:PlanningID=Pla:PlanningID) THEN BREAK.
      !        AMut:Record=Mut:Record
      !        AMut:InslagKG=-Mut:InslagKG
      !        AMut:InslagPallet=-Mut:InslagPallet
      !        AMut:UitslagKG=0
      !        AMut:UitslagPallet=0
      !        AMut:RedenAfboeking='RETOUR'
      !        AMut:PlanningID=APla:PlanningID
      !        Access:AMutatie.PrimeRecord(True)
      !    END
      !END
      !! en nu op verwerkt zetten.....
      !Clear(Pla:Record)
      !Pla:InkoopID=Ink:InkoopID
      !Set(Pla:Planning_FK01,Pla:Planning_FK01)
      !LOOP UNTIL Access:Planning.Next()
      !    IF NOT Pla:InkoopID=Ink:InkoopID THEN BREAK.
      !    IF Pla:Verwerkt=TRUE THEN CYCLE.
      !    Pla:Verwerkt=TRUE
      !    Pla:MutatieGemaakt=TRUE
      !    Access:Planning.Update()
      !END
      !BRW7.ResetQueue(FALSE)
    OF ?Calendar
      ThisWindow.Update()
      Calendar8.SelectOnClose = True
      Calendar8.Ask('Select a Date',Ink:Planning_DATE)
      IF Calendar8.Response = RequestCompleted THEN
      Ink:Planning_DATE=Calendar8.SelectedDate
      DISPLAY(?Ink:Planning_DATE:2)
      END
      ThisWindow.Reset(True)
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
  IF Ink:Planning_DATE = 0 THEN
      Ink:Planning_TIME = 0
  END
  ReturnValue = PARENT.TakeCompleted()
  DO UpdateVerwerkStatus
  db.Debugout('VoorraadClass.BerekenPartijenInkoopPrijs()')
  VoorraadClass.BerekenPartijenInkoopPrijs()
  NetRefreshPlanningViews()
  !NOTIFY(2, GLO:Planning_ThreadID)
  
  !GLO:TimingMeting[4] = CLOCK() - timingmeting# - GLO:TimingMeting[3]
  !	
  !CLEAR(Sne:Record)
  !Sne:Gebruiker = IGB:WindowsInlog
  !Sne:Datum_DATE = TODAY()
  !Sne:Datum_TIME = CLOCK()
  !Sne:Meetpunt = 'UpdateInkoop - TakeCompleted'
  !Sne:Meting = (CLOCK() - timingmeting#)
  !Sne:Waarde1 = Ink:InkoopID
  !Sne:Waarde3 = GLO:TimingMeting[1]
  !Sne:Waarde4 = GLO:TimingMeting[2]
  !Sne:Waarde5 = GLO:TimingMeting[3]
  !Sne:Waarde6 = GLO:TimingMeting[4]
  !
  !
  !Access:SnelheidLogging.Insert()   
  !
      ! Als leverancier wordt gewijzigd dan de Partijen ook wijzing
  IF Self.Request=ChangeRecord AND Sav:Leverancier<>Ink:Leverancier
      Clear(Par:Record)
      Par:InkoopID=Ink:InkoopID
      Set(Par:Partij_FK03,Par:Partij_FK03)
      LOOP UNTIL Access:Partij.Next()
          IF NOT Par:InkoopID=Ink:InkoopID then BREAK.
          IF Par:Leverancier<>Ink:Leverancier
              Par:Leverancier=Ink:Leverancier
              Access:Partij.Update()
          END
      END
  END
    ThisNetRefresh.Send('|Inkoop|Relatie|RelatieAdres|Planning|Planning|Gebruiker|DeliveryTerms|') ! NetTalk (NetRefresh)
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


FDCB4.SetQueueRecord PROCEDURE

  CODE
  	i#=INSTRING('<39>',REL:FirmaNaam,1,1)
  	if i#
  		Loc:Firmanaam = Sub(REL:FirmaNaam,1,i#-1)&SUB(REL:FirmaNaam,i#+1,51)
  	ELSE
  		Loc:Firmanaam = REL:FirmaNaam
  	End	
  PARENT.SetQueueRecord
  


BRW7.Ask PROCEDURE(BYTE Request)

ReturnValue          BYTE,AUTO

  CODE
  IF Request = ChangeRecord AND Pla:MutatieGemaakt THEN
      ! Prijzen moet wel nog gewijzigd kunnen
      !Request = ViewRecord
  ELSIF Request = DeleteRecord AND Pla:MutatieGemaakt THEN
      MESSAGE('Geplande inkoopregel is al uitgevoerd. Kan dus niet meer verwijderd worden. Draait eerst de mutaties terug.', 'Al uitgevoerd', ICON:Exclamation)
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
      SELF.Q.Pla:InkoopKGPrijs_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for Pla:InkoopKGPrijs
      SELF.Q.Pla:InkoopKGPrijs_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.Pla:InkoopKGPrijs_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla:InkoopKGPrijs_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla:MutatieGemaakt_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for Pla:MutatieGemaakt
      SELF.Q.Pla:MutatieGemaakt_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.Pla:MutatieGemaakt_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla:MutatieGemaakt_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla:Verwerkt_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for Pla:Verwerkt
      SELF.Q.Pla:Verwerkt_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.Pla:Verwerkt_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla:Verwerkt_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Ver:VerpakkingOmschrijving_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for Ver:VerpakkingOmschrijving
      SELF.Q.Ver:VerpakkingOmschrijving_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.Ver:VerpakkingOmschrijving_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Ver:VerpakkingOmschrijving_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.CEL:CelOms_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for CEL:CelOms
      SELF.Q.CEL:CelOms_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.CEL:CelOms_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.CEL:CelOms_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.CL:Locatienaam_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for CL:Locatienaam
      SELF.Q.CL:Locatienaam_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.CL:Locatienaam_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.CL:Locatienaam_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
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


BRW7.Init PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)

  CODE
  PARENT.Init(ListBox,Posit,V,Q,RM,WM)
  IF WM.Request <> ViewRecord                              ! If called for anything other than ViewMode, make the insert, change & delete controls available
    SELF.InsertControl=?Insert
    SELF.ChangeControl=?Change
    SELF.DeleteControl=?Delete
  END


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
      SELF.Q.Pla:InkoopKGPrijs_NormalFG   = CHOOSE(CHOICE(?List) % 2,-1,-1) ! Set color values for Pla:InkoopKGPrijs
      SELF.Q.Pla:InkoopKGPrijs_NormalBG   = CHOOSE(CHOICE(?List) % 2,-1,8454143)
      SELF.Q.Pla:InkoopKGPrijs_SelectedFG = CHOOSE(CHOICE(?List) % 2,-1,-1)
      SELF.Q.Pla:InkoopKGPrijs_SelectedBG = CHOOSE(CHOICE(?List) % 2,-1,-1)
      SELF.Q.Pla:MutatieGemaakt_NormalFG   = CHOOSE(CHOICE(?List) % 2,-1,-1) ! Set color values for Pla:MutatieGemaakt
      SELF.Q.Pla:MutatieGemaakt_NormalBG   = CHOOSE(CHOICE(?List) % 2,-1,8454143)
      SELF.Q.Pla:MutatieGemaakt_SelectedFG = CHOOSE(CHOICE(?List) % 2,-1,-1)
      SELF.Q.Pla:MutatieGemaakt_SelectedBG = CHOOSE(CHOICE(?List) % 2,-1,-1)
      SELF.Q.Pla:Verwerkt_NormalFG   = CHOOSE(CHOICE(?List) % 2,-1,-1) ! Set color values for Pla:Verwerkt
      SELF.Q.Pla:Verwerkt_NormalBG   = CHOOSE(CHOICE(?List) % 2,-1,8454143)
      SELF.Q.Pla:Verwerkt_SelectedFG = CHOOSE(CHOICE(?List) % 2,-1,-1)
      SELF.Q.Pla:Verwerkt_SelectedBG = CHOOSE(CHOICE(?List) % 2,-1,-1)
      SELF.Q.Ver:VerpakkingOmschrijving_NormalFG   = CHOOSE(CHOICE(?List) % 2,-1,-1) ! Set color values for Ver:VerpakkingOmschrijving
      SELF.Q.Ver:VerpakkingOmschrijving_NormalBG   = CHOOSE(CHOICE(?List) % 2,-1,8454143)
      SELF.Q.Ver:VerpakkingOmschrijving_SelectedFG = CHOOSE(CHOICE(?List) % 2,-1,-1)
      SELF.Q.Ver:VerpakkingOmschrijving_SelectedBG = CHOOSE(CHOICE(?List) % 2,-1,-1)
      SELF.Q.CEL:CelOms_NormalFG   = CHOOSE(CHOICE(?List) % 2,-1,-1) ! Set color values for CEL:CelOms
      SELF.Q.CEL:CelOms_NormalBG   = CHOOSE(CHOICE(?List) % 2,-1,8454143)
      SELF.Q.CEL:CelOms_SelectedFG = CHOOSE(CHOICE(?List) % 2,-1,-1)
      SELF.Q.CEL:CelOms_SelectedBG = CHOOSE(CHOICE(?List) % 2,-1,-1)
      SELF.Q.CL:Locatienaam_NormalFG   = CHOOSE(CHOICE(?List) % 2,-1,-1) ! Set color values for CL:Locatienaam
      SELF.Q.CL:Locatienaam_NormalBG   = CHOOSE(CHOICE(?List) % 2,-1,8454143)
      SELF.Q.CL:Locatienaam_SelectedFG = CHOOSE(CHOICE(?List) % 2,-1,-1)
      SELF.Q.CL:Locatienaam_SelectedBG = CHOOSE(CHOICE(?List) % 2,-1,-1)
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


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window
  SELF.SetStrategy(?Ink:Leverancier:Prompt, Resize:FixLeft+Resize:FixTop, Resize:LockSize) ! Override strategy for ?Ink:Leverancier:Prompt
  SELF.SetStrategy(?OK, Resize:FixRight+Resize:FixBottom, Resize:LockSize) ! Override strategy for ?OK
  SELF.SetStrategy(?Cancel, Resize:FixRight+Resize:FixBottom, Resize:LockSize) ! Override strategy for ?Cancel
  SELF.SetStrategy(?List, Resize:FixLeft+Resize:FixTop, Resize:ConstantRight+Resize:ConstantBottom) ! Override strategy for ?List
  SELF.SetStrategy(?Insert, Resize:FixRight+Resize:FixBottom, Resize:LockSize) ! Override strategy for ?Insert
  SELF.SetStrategy(?Change, Resize:FixRight+Resize:FixBottom, Resize:LockSize) ! Override strategy for ?Change
  SELF.SetStrategy(?Delete, Resize:FixRight+Resize:FixBottom, Resize:LockSize) ! Override strategy for ?Delete
  SELF.SetStrategy(?Rel:FirmaNaam, Resize:FixLeft+Resize:FixTop, Resize:LockSize) ! Override strategy for ?Rel:FirmaNaam
  SELF.SetStrategy(?PROMPT1, Resize:FixLeft+Resize:FixTop, Resize:LockSize) ! Override strategy for ?PROMPT1
  SELF.SetStrategy(?Ink:Planning_DATE:Prompt:2, Resize:FixLeft+Resize:FixTop, Resize:LockSize) ! Override strategy for ?Ink:Planning_DATE:Prompt:2
  SELF.SetStrategy(?Ink:Planning_DATE:2, Resize:FixLeft+Resize:FixTop, Resize:LockSize) ! Override strategy for ?Ink:Planning_DATE:2
  SELF.SetStrategy(?Calendar, Resize:FixLeft+Resize:FixTop, Resize:LockSize) ! Override strategy for ?Calendar
  SELF.SetStrategy(?Ink:Planning_TIME:Prompt, Resize:FixLeft+Resize:FixTop, Resize:LockSize) ! Override strategy for ?Ink:Planning_TIME:Prompt
  SELF.SetStrategy(?Ink:Planning_TIME, Resize:FixLeft+Resize:FixTop, Resize:LockSize) ! Override strategy for ?Ink:Planning_TIME
  SELF.SetStrategy(?Ink:Instructie:Prompt, Resize:FixLeft+Resize:FixTop, Resize:LockSize) ! Override strategy for ?Ink:Instructie:Prompt
  SELF.SetStrategy(?Ink:Instructie, Resize:FixLeft+Resize:FixTop, Resize:LockSize) ! Override strategy for ?Ink:Instructie
  SELF.SetStrategy(?Ink:Transport:Prompt, Resize:FixLeft+Resize:FixTop, Resize:LockSize) ! Override strategy for ?Ink:Transport:Prompt
  SELF.SetStrategy(?Ink:Transport, Resize:FixLeft+Resize:FixTop, Resize:LockSize) ! Override strategy for ?Ink:Transport
  SELF.SetStrategy(?Ink:Verwerkt, Resize:FixLeft+Resize:FixTop, Resize:LockSize) ! Override strategy for ?Ink:Verwerkt
  SELF.SetStrategy(?Ink:ExtraKosten:Prompt, Resize:FixLeft+Resize:FixTop, Resize:LockSize) ! Override strategy for ?Ink:ExtraKosten:Prompt
  SELF.SetStrategy(?Ink:ExtraKosten, Resize:FixLeft+Resize:FixTop, Resize:LockSize) ! Override strategy for ?Ink:ExtraKosten
  SELF.SetStrategy(?Ink:ExtraKosten:Prompt:2, Resize:FixLeft+Resize:FixTop, Resize:LockSize) ! Override strategy for ?Ink:ExtraKosten:Prompt:2
  SELF.SetStrategy(?RAD:Adres1, Resize:FixLeft+Resize:FixTop, Resize:LockSize) ! Override strategy for ?RAD:Adres1
  SELF.SetStrategy(?Ink:ExtraKostenTekst, Resize:FixLeft+Resize:FixTop, Resize:LockSize) ! Override strategy for ?Ink:ExtraKostenTekst
  SELF.SetStrategy(?Ink:TransportKosten:Prompt, Resize:FixLeft+Resize:FixTop, Resize:LockSize) ! Override strategy for ?Ink:TransportKosten:Prompt
  SELF.SetStrategy(?Ink:TransportKosten, Resize:FixLeft+Resize:FixTop, Resize:LockSize) ! Override strategy for ?Ink:TransportKosten

