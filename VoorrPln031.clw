

   MEMBER('VoorrPln.clw')                                  ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABDROPS.INC'),ONCE
   INCLUDE('ABPOPUP.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('VOORRPLN031.INC'),ONCE        !Local module procedure declarations
                     END


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

