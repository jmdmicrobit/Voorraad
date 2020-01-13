

   MEMBER('VoorrPln.clw')                                  ! This is a MEMBER module


   INCLUDE('ABDROPS.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('VOORRPLN030.INC'),ONCE        !Local module procedure declarations
                     END


!!! <summary>
!!! Generated from procedure template - Window
!!! Form Mutatie
!!! </summary>
BulkOverboekMutatieWijzigen PROCEDURE 

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
LOC:VerwijderControle BYTE                                 ! 
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
FDCB12::View:FileDropCombo VIEW(CelLocatie)
                       PROJECT(CL:Locatienaam)
                       PROJECT(CL:CelLocatieID)
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
QuickWindow          WINDOW('Form Mutatie'),AT(,,499,250),FONT('MS Sans Serif',8,,,CHARSET:DEFAULT),DOUBLE,CENTER, |
  GRAY,IMM,MDI,HLP('UpdateUitslagMutatie'),SYSTEM
                       BUTTON('&OK'),AT(273,225,49,18),USE(?OK),LEFT,ICON('WAOK.ICO'),DEFAULT,FLAT,MSG('Accept dat' & |
  'a and close the window'),TIP('Accept data and close the window')
                       PROMPT('Invoerdatum:'),AT(6,9),USE(?Mut:DatumTijd_DATE:Prompt),TRN
                       ENTRY(@d6-),AT(83,9,64,10),USE(BOV:MutatieDatumTijd_DATE),DISABLE,SKIP
                       PROMPT('Invoertijd:'),AT(169,9),USE(?Mut:DatumTijd_TIME:Prompt),TRN
                       ENTRY(@t7),AT(206,9,56,10),USE(BOV:MutatieDatumTijd_TIME),DISABLE,SKIP
                       PROMPT('Artikel:'),AT(6,26),USE(?PROMPT1)
                       COMBO(@s60),AT(83,25,308,10),USE(VVP:ArtikelOms),HVSCROLL,DISABLE,DROP(25),FORMAT('50L(2)|~Ar' & |
  'tikel ID~C(0)@s30@115L(2)|~Omschrijving~C(0)@s60@54R(2)|~KG~C(0)@n12`2@60R(2)|~Palle' & |
  'ts~C(0)@n-14.@'),FROM(Queue:FileDropCombo),IMM
                       PROMPT('Naar cel:'),AT(6,88),USE(?PROMPT6)
                       COMBO(@s30),AT(83,87,179,10),USE(CEL:CelOms),DISABLE,DROP(5),FORMAT('110L(2)|M~Cel~C(0)@s50@'), |
  FROM(Queue:FileDropCombo:2),IMM
                       PROMPT('Overboek KG:'),AT(6,119),USE(?Mut:UitslagKG:Prompt)
                       STRING(@s50),AT(177,41,214),USE(Art:ArtikelOms)
                       PROMPT('Van cel:'),AT(6,58),USE(?PROMPT2)
                       COMBO(@s50),AT(83,57,179,10),USE(ACel:CelOms),DISABLE,DROP(5),FORMAT('200L(2)|M~Cel~C(2)@s50@'), |
  FROM(Queue:FileDropCombo:1),IMM
                       COMBO(@s50),AT(83,72,269,10),USE(Ver:VerpakkingOmschrijving),DISABLE,DROP(5),FORMAT('200L(2)|M~' & |
  'Verpakking~C(0)@s50@'),FROM(Queue:FileDropCombo:3),IMM
                       PROMPT('Verpakking:'),AT(6,72),USE(?PROMPT3)
                       BUTTON('&Cancel'),AT(437,225,56,18),USE(?Cancel),LEFT,ICON('WACANCEL.ICO'),FLAT,MSG('Cancel operation'), |
  TIP('Cancel operation')
                       LIST,AT(83,132,409,89),USE(?LIST1),HVSCROLL,DISABLE,FORMAT('46R(2)|M~Partij-ID~C(1)@n_1' & |
  '0@100L(2)|M~Leverancier~C(0)@s40@70L(2)|M~Verpakking~C(0)@s30@[50R(2)|M@d17-@25R(2)|' & |
  'M@t7@]|~Aanmaakdatum~56R(2)|M~Overboeking~C(0)@n-13`2@'),FROM(LOC:OverboekMutaties)
                       ENTRY(@n-13`2),AT(83,116,65,10),USE(BOV:AantalKG),RIGHT,DISABLE
                       BUTTON('&Terugdraaien mutaties'),AT(329,225,105,18),USE(?Cancel:2),LEFT,ICON('WACANCEL.ICO'), |
  FLAT,MSG('Cancel operation'),TIP('Cancel operation')
                       COMBO(@s50),AT(111,101,179,10),USE(CL:Locatienaam),DISABLE,DROP(5),FORMAT('200L(2)|M~Lo' & |
  'catienaam~@s50@'),FROM(Queue:FileDropCombo:4),IMM
                       STRING('Locatie:'),AT(19,102),USE(?STRING1)
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
Run                    PROCEDURE(),BYTE,PROC,DERIVED
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED
TakeCompleted          PROCEDURE(),BYTE,PROC,DERIVED
TakeEvent              PROCEDURE(),BYTE,PROC,DERIVED
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

FDCB12               CLASS(FileDropComboClass)             ! File drop combo manager
Q                      &Queue:FileDropCombo:4         !Reference to browse queue type
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
ControleerVerwijderMutaties ROUTINE
	LOC:VerwijderControle = 1

	CLEAR(Mut:Record)
	Mut:BulkOverboekingID=BOV:BulkOverboekingID
	SET(Mut:Mutatie_FK04, Mut:Mutatie_FK04)
	LOOP
		Access:Mutatie.Next()
		IF ERROR() THEN BREAK.
		IF Mut:BulkOverboekingID<>BOV:BulkOverboekingID THEN BREAK.
		IF Mut:SoortMutatie<>'OIN' THEN CYCLE.
		
		CLEAR(VVPar:Record)
		VVPar:PartijCelID = CLIP(FORMAT(Mut:PartijID, @N05)) & '.' & CLIP(Mut:CelID)
		Access:ViewVoorraadPartij.TryFetch(VVPar:PartijCelID_K)
		IF NOT(ERROR())
			IF VVPar:VoorraadKG - Mut:InslagKG < 0 THEN
				Message('Het verwijderen van de bestaande mutaties is niet mogelijk omdat de voorraad voor partij ' & CLIP(Mut:PartijID) & ' negatief wordt.', |
					'Negatieve voorraad',ICON:Exclamation)
				LOC:VerwijderControle = 0
				BREAK
			END
		ELSE
			Message('Het verwijderen van de bestaande mutaties is niet mogelijk omdat de voorraad voor partij ' & CLIP(Mut:PartijID) & ' negatief wordt.', |
				'Negatieve voorraad',ICON:Exclamation)
			LOC:VerwijderControle = 0
			BREAK
		END
	.
	EXIT
VerwijderMutaties   ROUTINE
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
	
	VoorraadClass.BerekenPlanningMutatieGrootte(BOV:PlanningID)
	
	EXIT

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
  GlobalErrors.SetProcedureName('BulkOverboekMutatieWijzigen')
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
  		LOM:Aanmaakdatum_DATE = Par:AanmaakDatum_DATE
  		LOM:Aanmaakdatum_TIME = Par:AanmaakDatum_TIME
  		LOM:KG = Mut:UitslagKG
  		ADD(LOC:OverboekMutaties,-LOM:PartijID)
  	.
  	
  	CLEAR(Ver:Record)
  	Ver:VerpakkingID=BOV:VerpakkingID
  	Access:Verpakking.TryFetch(Ver:Verpakking_PK)
  	
  	LOC:ArtikelID = BOV:ArtikelID
  	LOC:VanCelID = BOV:VanCelID
  	LOC:NaarCelID = BOV:NaarCelID
  	LOC:VerpakkingID = BOV:VerpakkingID
  ELSIF Self.Request=InsertRecord
  	BOV:ArtikelID = PLA:ArtikelID
  	BOV:VerpakkingID = PLA:VerpakkingID
  	BOV:VanCelID = Pla:CelID
  	BOV:NaarCelID = Pla:OverboekingCelID
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
    ?BOV:AantalKG{PROP:ReadOnly} = True
    DISABLE(?Cancel:2)
    DISABLE(?CL:Locatienaam)
  END
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('BulkOverboekMutatieWijzigen',QuickWindow)  ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  FDCB7.Init(VVP:ArtikelOms,?VVP:ArtikelOms,Queue:FileDropCombo.ViewPosition,FDCB7::View:FileDropCombo,Queue:FileDropCombo,Relate:ViewArtikel,ThisWindow,GlobalErrors,0,0,0)
  FDCB7.Q &= Queue:FileDropCombo
  FDCB7.AddSortOrder(Art:Artikel_FK01)
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
  FDCB12.Init(CL:Locatienaam,?CL:Locatienaam,Queue:FileDropCombo:4.ViewPosition,FDCB12::View:FileDropCombo,Queue:FileDropCombo:4,Relate:CelLocatie,ThisWindow,GlobalErrors,0,1,0)
  FDCB12.Q &= Queue:FileDropCombo:4
  FDCB12.AddSortOrder(CL:FK_CelLocatie)
  FDCB12.AddRange(CL:CelID,BOV:NaarCelID)
  FDCB12.AddField(CL:Locatienaam,FDCB12.Q.CL:Locatienaam) !List box control field - type derived from field
  FDCB12.AddField(CL:CelLocatieID,FDCB12.Q.CL:CelLocatieID) !Primary key field - type derived from field
  FDCB12.AddUpdateField(CL:CelLocatieID,BOV:NaarCelLocatieID)
  ThisWindow.AddItem(FDCB12.WindowComponent)
  FDCB12.DefaultFill = 0
  SELF.SetAlerts()
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
    Relate:ViewVoorraadPlanning.Close
  END
  IF SELF.Opened
    INIMgr.Update('BulkOverboekMutatieWijzigen',QuickWindow) ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.PrimeUpdate PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.PrimeUpdate()
    If returnValue = Level:Fatal  ! delete just occured
      ThisNetRefresh.Send('|BulkOverboeking|ViewArtikel|Cel|ACel|Verpakking|CelLocatie|') ! NetTalk (NetRefresh)
    End
  IF ReturnValue = Level:Fatal  ! delete just occured
  	NetRefreshVoorraadViews()
  	NetRefreshPlanningViews()
  END	
  RETURN ReturnValue


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
    OF ?CEL:CelOms
      If 0{PROP:AcceptAll} = False Then
          If NOT CL:CelID = CEL:CelID Then
              Clear(CL:Locatienaam)
              Clear(BOV:NaarCelLocatieID)
              Display(?CL:Locatienaam)
          End
      End
      
    OF ?Cancel:2
      ThisWindow.Update()
      DO ControleerVerwijderMutaties
      
      IF LOC:VerwijderControle
      	DO VerwijderMutaties
      
      	POST(EVENT:Accepted, ?Cancel)
      .
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
    ThisNetRefresh.Send('|BulkOverboeking|ViewArtikel|Cel|ACel|Verpakking|CelLocatie|') ! NetTalk (NetRefresh)
  	NetRefreshVoorraadViews()
  	NetRefreshPlanningViews()
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue


ThisWindow.TakeEvent PROCEDURE

ReturnValue          BYTE,AUTO

Looped BYTE
  CODE
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
  
  IF LOC:ArtikelVoorraadKG <= 0 !AND LOC:ArtikelVoorraadPallet <= 0
  !	RETURN Record:Filtered
  .
  ReturnValue = PARENT.ValidateRecord()
  RETURN ReturnValue

