

   MEMBER('VoorrPln.clw')                                  ! This is a MEMBER module


   INCLUDE('ABDROPS.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('VOORRPLN026.INC'),ONCE        !Local module procedure declarations
                     END


!!! <summary>
!!! Generated from procedure template - Window
!!! Form Mutatie
!!! </summary>
UpdateOverboekMutatieEnkel PROCEDURE 

CurrentTab           STRING(80)                            ! 
Loc:KG               DECIMAL(10,2)                         ! 
Loc:Pallets          LONG                                  ! 
Loc:Artikel          CSTRING(100)                          ! 
ActionMessage        CSTRING(40)                           ! 
Loc:ArtikelID        CSTRING(31)                           ! 
Loc:RelatieID        LONG                                  ! 
Loc:ArtikelOms       CSTRING(101)                          ! 
Loc:Leverancieroms   CSTRING(101)                          ! 
Loc:VerpakkingsID    LONG                                  ! 
Loc:VerpakkingOms    CSTRING(51)                           ! 
LOC:PartijID         LONG                                  ! 
LOC:ArtikelVoorraadKG DECIMAL(12,2)                        ! 
LOC:ArtikelVoorraadPallet LONG                             ! 
LOC:PartijVoorraadKG DECIMAL(9,2)                          ! 
LOC:PartijVoorraadPallet LONG                              ! 
LOC:PartijCelID      CSTRING(26)                           ! 
LOC:OrigineelPartijCelID CSTRING(26)                       ! 
LOC:OrigineelNaarPartijCelID CSTRING(26)                   ! 
LOC:OrigineelKG      DECIMAL(10,2)                         ! 
LOC:OrigineelPallets LONG                                  ! 
LOC:OrigineelArtikelID CSTRING(31)                         ! 
LOC:OverboekingCelID LONG                                  ! 
FDCB7::View:FileDropCombo VIEW(ViewVoorraadPlanning)
                       PROJECT(VVP:ArtikelID)
                       PROJECT(VVP:ArtikelOms)
                       PROJECT(VVP:InslagKG)
                       PROJECT(VVP:InslagPallets)
                       PROJECT(VVP:UitslagKG)
                       PROJECT(VVP:UitslagPallets)
                       JOIN(Art:Artikel_PK,VVP:ArtikelID)
                         PROJECT(Art:ArtikelID)
                       END
                     END
FDCB4::View:FileDropCombo VIEW(ViewVoorraadPartij)
                       PROJECT(VVPar:PartijCelID)
                       PROJECT(VVPar:PartijID)
                       PROJECT(VVPar:CelID)
                       PROJECT(VVPar:VoorraadKG)
                       PROJECT(VVPar:VoorraadPallets)
                       JOIN(Par:Partij_PK,VVPar:PartijID)
                         PROJECT(Par:PartijID)
                         PROJECT(Par:ExternPartijnr)
                         PROJECT(Par:VerpakkingID)
                         PROJECT(Par:ArtikelID)
                         PROJECT(Par:Leverancier)
                         JOIN(Ver:Verpakking_PK,Par:VerpakkingID)
                           PROJECT(Ver:VerpakkingOmschrijving)
                           PROJECT(Ver:VerpakkingID)
                         END
                         JOIN(Rel:Relatie_PK,Par:Leverancier)
                           PROJECT(Rel:FirmaNaam)
                         END
                       END
                       JOIN(ACel:CEL_PK,VVPar:CelID)
                         PROJECT(ACel:CelOms)
                         PROJECT(ACel:CelID)
                       END
                     END
FDCB8::View:FileDropCombo VIEW(Cel)
                       PROJECT(CEL:CelOms)
                       PROJECT(CEL:CelID)
                     END
FDCB11::View:FileDropCombo VIEW(CelLocatie)
                       PROJECT(CL:Locatienaam)
                       PROJECT(CL:CelLocatieID)
                     END
Queue:FileDropCombo  QUEUE                            !
VVP:ArtikelID          LIKE(VVP:ArtikelID)            !List box control field - type derived from field
VVP:ArtikelOms         LIKE(VVP:ArtikelOms)           !List box control field - type derived from field
LOC:ArtikelVoorraadKG  LIKE(LOC:ArtikelVoorraadKG)    !List box control field - type derived from local data
LOC:ArtikelVoorraadKG_NormalFG LONG                   !Normal forground color
LOC:ArtikelVoorraadKG_NormalBG LONG                   !Normal background color
LOC:ArtikelVoorraadKG_SelectedFG LONG                 !Selected forground color
LOC:ArtikelVoorraadKG_SelectedBG LONG                 !Selected background color
LOC:ArtikelVoorraadPallet LIKE(LOC:ArtikelVoorraadPallet) !List box control field - type derived from local data
LOC:ArtikelVoorraadPallet_NormalFG LONG               !Normal forground color
LOC:ArtikelVoorraadPallet_NormalBG LONG               !Normal background color
LOC:ArtikelVoorraadPallet_SelectedFG LONG             !Selected forground color
LOC:ArtikelVoorraadPallet_SelectedBG LONG             !Selected background color
VVP:InslagKG           LIKE(VVP:InslagKG)             !Browse hot field - type derived from field
VVP:InslagPallets      LIKE(VVP:InslagPallets)        !Browse hot field - type derived from field
VVP:UitslagKG          LIKE(VVP:UitslagKG)            !Browse hot field - type derived from field
VVP:UitslagPallets     LIKE(VVP:UitslagPallets)       !Browse hot field - type derived from field
Art:ArtikelID          LIKE(Art:ArtikelID)            !Related join file key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
Queue:FileDropCombo:1 QUEUE                           !
VVPar:PartijCelID      LIKE(VVPar:PartijCelID)        !List box control field - type derived from field
Par:PartijID           LIKE(Par:PartijID)             !List box control field - type derived from field
Par:ExternPartijnr     LIKE(Par:ExternPartijnr)       !List box control field - type derived from field
ACel:CelOms            LIKE(ACel:CelOms)              !List box control field - type derived from field
LOC:PartijVoorraadKG   LIKE(LOC:PartijVoorraadKG)     !List box control field - type derived from local data
Ver:VerpakkingOmschrijving LIKE(Ver:VerpakkingOmschrijving) !List box control field - type derived from field
Rel:FirmaNaam          LIKE(Rel:FirmaNaam)            !List box control field - type derived from field
Par:VerpakkingID       LIKE(Par:VerpakkingID)         !Browse hot field - type derived from field
Par:ArtikelID          LIKE(Par:ArtikelID)            !Browse hot field - type derived from field
VVPar:PartijID         LIKE(VVPar:PartijID)           !Browse hot field - type derived from field
VVPar:CelID            LIKE(VVPar:CelID)              !Browse hot field - type derived from field
VVPar:VoorraadKG       LIKE(VVPar:VoorraadKG)         !Browse hot field - type derived from field
VVPar:VoorraadPallets  LIKE(VVPar:VoorraadPallets)    !Browse hot field - type derived from field
Ver:VerpakkingID       LIKE(Ver:VerpakkingID)         !Related join file key field - type derived from field
ACel:CelID             LIKE(ACel:CelID)               !Related join file key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
Queue:FileDropCombo:2 QUEUE                           !
CEL:CelOms             LIKE(CEL:CelOms)               !List box control field - type derived from field
CEL:CelID              LIKE(CEL:CelID)                !Primary key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
Queue:FileDropCombo:3 QUEUE                           !
CL:Locatienaam         LIKE(CL:Locatienaam)           !List box control field - type derived from field
CL:CelLocatieID        LIKE(CL:CelLocatieID)          !Primary key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
LocEnableEnterByTab  BYTE(1)                               !Used by the ENTER Instead of Tab template
EnterByTabManager    EnterByTabClass
History::Mut:Record  LIKE(Mut:RECORD),THREAD
QuickWindow          WINDOW('Form Mutatie'),AT(,,415,228),FONT('MS Sans Serif',8,,,CHARSET:DEFAULT),DOUBLE,CENTER, |
  GRAY,IMM,MDI,HLP('UpdateUitslagMutatie'),SYSTEM
                       SHEET,AT(4,4,403,202),USE(?CurrentTab)
                         TAB('&1) General'),USE(?Tab:1)
                           PROMPT('Invoerdatum:'),AT(13,37),USE(?Mut:DatumTijd_DATE:Prompt),TRN
                           ENTRY(@d6-),AT(88,38,64,10),USE(Mut:DatumTijd_DATE),SKIP
                           PROMPT('Invoertijd:'),AT(172,38),USE(?Mut:DatumTijd_TIME:Prompt),TRN
                           ENTRY(@t7),AT(209,38,56,10),USE(Mut:DatumTijd_TIME),SKIP
                           PROMPT('Artikel:'),AT(13,54),USE(?PROMPT1)
                           COMBO(@s60),AT(87,54,308,10),USE(VVP:ArtikelOms),DROP(25),FORMAT('51L(2)|~Artikel ID~C(' & |
  '0)@s30@115L(2)|~Artikel~C(2)@s60@[54R(2)|*~KG~C(0)@n-13`2@60R(2)|*~Pallets~C(0)@n-14.@]|'), |
  FROM(Queue:FileDropCombo),IMM
                           PROMPT('Partij:'),AT(13,81),USE(?PROMPT2)
                           COMBO(@s25),AT(87,81,308,10),USE(VVPar:PartijCelID),DROP(5,400),FORMAT('0L(2)|~Partij.C' & |
  'el~C(0)@s25@[42R(2)|~Intern~C(0)@n_10B@60R(2)|~Extern~C(1)@n_10B@](87)|~Partijnummer' & |
  '~41R(2)|~Cel~C(0)@s50@[49R(2)|M~KG~C(1)@n-12`2@](48)|~Voorraad~81L(2)|~Verpakking~C(' & |
  '2)@s50@94L(2)|~Leverancier~C(0)@s50@'),FROM(Queue:FileDropCombo:1),IMM
                           PROMPT('Naar cel:'),AT(9,138),USE(?PROMPT6)
                           COMBO(@s30),AT(87,137,307,10),USE(CEL:CelOms),DROP(5),FORMAT('110L(2)|M~Cel~C(0)@s50@'),FROM(Queue:FileDropCombo:2), |
  IMM
                           PROMPT('Cel:'),AT(86,122),USE(?PROMPT3)
                           PROMPT('Overboek KG:'),AT(9,167),USE(?Mut:UitslagKG:Prompt)
                           ENTRY(@n12_`2),AT(87,167,60,10),USE(Mut:UitslagKG),RIGHT(2)
                           PROMPT('Overboek Pallets:'),AT(9,183),USE(?Mut:UitslagPallet:Prompt)
                           ENTRY(@n_9),AT(87,183,60,10),USE(Mut:UitslagPallet),RIGHT(2)
                           PROMPT('Leverancier:'),AT(86,95),USE(?PROMPT4)
                           PROMPT('Verpakking:'),AT(86,108),USE(?PROMPT5)
                           STRING(@s50),AT(130,95,265),USE(Rel:FirmaNaam)
                           STRING(@s50),AT(129,108,266),USE(Ver:VerpakkingOmschrijving)
                           STRING(@s50),AT(129,122,266),USE(ACel:CelOms)
                           STRING(@s50),AT(131,68,263),USE(Art:ArtikelOms)
                           STRING('Locatie:'),AT(27,151),USE(?STRING1)
                           COMBO(@s50),AT(87,152,307,10),USE(CL:Locatienaam),DROP(5),FORMAT('200L(2)|M~Locatienaam' & |
  '~L(0)@s50@'),FROM(Queue:FileDropCombo:3),IMM
                         END
                       END
                       BUTTON('&OK'),AT(302,210,49,14),USE(?OK),LEFT,ICON('WAOK.ICO'),DEFAULT,FLAT,MSG('Accept dat' & |
  'a and close the window'),TIP('Accept data and close the window')
                       BUTTON('&Cancel'),AT(355,210,49,14),USE(?Cancel),LEFT,ICON('WACANCEL.ICO'),FLAT,MSG('Cancel operation'), |
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

FDCB4                CLASS(FileDropComboClass)             ! File drop combo manager
Q                      &Queue:FileDropCombo:1         !Reference to browse queue type
SetQueueRecord         PROCEDURE(),DERIVED
ValidateRecord         PROCEDURE(),BYTE,DERIVED
                     END

FDCB8                CLASS(FileDropComboClass)             ! File drop combo manager
Q                      &Queue:FileDropCombo:2         !Reference to browse queue type
                     END

FDCB11               CLASS(FileDropComboClass)             ! File drop combo manager
Q                      &Queue:FileDropCombo:3         !Reference to browse queue type
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
  GlobalErrors.SetProcedureName('UpdateOverboekMutatieEnkel')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Mut:DatumTijd_DATE:Prompt
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('LOC:ArtikelVoorraadKG',LOC:ArtikelVoorraadKG)      ! Added by: FileDropCombo(ABC)
  BIND('LOC:ArtikelVoorraadPallet',LOC:ArtikelVoorraadPallet) ! Added by: FileDropCombo(ABC)
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.HistoryKey = CtrlH
  SELF.AddHistoryFile(Mut:Record,History::Mut:Record)
  SELF.AddHistoryField(?Mut:DatumTijd_DATE,4)
  SELF.AddHistoryField(?Mut:DatumTijd_TIME,5)
  SELF.AddHistoryField(?Mut:UitslagKG,10)
  SELF.AddHistoryField(?Mut:UitslagPallet,11)
  SELF.AddUpdateFile(Access:Mutatie)
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  Relate:AAAACelLocatie.Open                               ! File AAAACelLocatie used by this procedure, so make sure it's RelationManager is open
  Relate:AMutatie.Open                                     ! File AMutatie used by this procedure, so make sure it's RelationManager is open
  Relate:ARelatie.Open                                     ! File ARelatie used by this procedure, so make sure it's RelationManager is open
  Relate:AViewVoorraadPartij.Open                          ! File AViewVoorraadPartij used by this procedure, so make sure it's RelationManager is open
  Relate:Cel.SetOpenRelated()
  Relate:Cel.Open                                          ! File Cel used by this procedure, so make sure it's RelationManager is open
  Relate:Mutatie.Open                                      ! File Mutatie used by this procedure, so make sure it's RelationManager is open
  Relate:Verkoop.Open                                      ! File Verkoop used by this procedure, so make sure it's RelationManager is open
  Relate:ViewVoorraadPartij.Open                           ! File ViewVoorraadPartij used by this procedure, so make sure it's RelationManager is open
  Relate:ViewVoorraadPlanning.Open                         ! File ViewVoorraadPlanning used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Primary &= Relate:Mutatie
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
  IF Self.Request=ChangeRecord 
  		Clear(PAR:Record)
  		Par:PartijID = Mut:PartijID
  		Access:Partij.TryFetch(Par:Partij_PK)
  		
  		Loc:ArtikelID = Par:ArtikelID
  		Loc:RelatieID = Par:Leverancier
  		Loc:VerpakkingsID = Par:VerpakkingID
  		LOC:PartijCelID = CLIP(FORMAT(Mut:PartijID, @N05)) & '.' & CLIP(Mut:CelID)
  		
  		! Opslaan bestaande uitslag om rekening mee te houden
  		! bij het controleren van de voorraad
  		LOC:OrigineelPartijCelID=LOC:PartijCelID
  		LOC:OrigineelNaarPartijCelID=CLIP(FORMAT(Mut:PartijID, @N05)) & '.' & CLIP(Mut:NaarCELID)
  		LOC:OrigineelArtikelID = Mut:ArtikelID
  		LOC:OrigineelKG = Mut:UitslagKG
  		LOC:OrigineelPallets = Mut:UitslagPallet
  
  		CLEAR(VVP:Record)
  		VVP:ArtikelID=Loc:ArtikelID
  		Access:ViewVoorraadPlanning.TryFetch(VVP:ViewVoorraad_PK)
  		
  		CLEAR(VVPar:Record)
  		VVPar:PartijCelID = LOC:PartijCelID
  		Access:ViewVoorraadPartij.TryFetch(VVPar:PartijCelID_K)
  		IF NOT(ERROR())
  		  	LOC:KG = VVPar:VoorraadKG
  			LOC:Pallets = VVPar:VoorraadPallets
  		ELSE
  			Loc:KG = 0
  			Loc:Pallets = 0
  		.
  elsif Self.Request=InsertRecord
  		Loc:ArtikelID = PLA:ArtikelID
  		Loc:VerpakkingsID = PLA:VerpakkingID
  	!	Loc:RelatieID = Par:Leverancier
  		LOC:PartijCelID = CLIP(FORMAT(Pla:PartijID, @N05)) & '.' & CLIP(Pla:CelID)
  	
  		! Geen bestaande uitslag om rekening mee te houden
  		! bij het controleren van de voorraad
  		LOC:OrigineelPartijCelID=''
  		LOC:OrigineelArtikelID=''
  		LOC:OrigineelKG = 0
  		LOC:OrigineelPallets = 0
  	
  		VVPar:PartijCelID = LOC:PartijCelID
  		Access:ViewVoorraadPartij.TryFetch(VVPar:PartijCelID_K)
  		IF NOT(ERROR())
  			LOC:KG = VVPar:VoorraadKG
  			LOC:Pallets = VVPar:VoorraadPallets
  			
  			Mut:PartijID = Pla:PartijID
  			Mut:CelID = Pla:CelID
  		ELSE
  			LOC:PartijCelID = ''
  			Loc:KG = 0
  			Loc:Pallets = 0
  			
  			Mut:PartijID = 0
  			Mut:CelID = 0
  			Mut:CelLocatieID = 0
  		.
  		
  		Mut:PlanningID = Pla:PlanningID
  
  		!Ver2:VerkoopID = Pla:VerkoopID
  		!Access:Verkoop.Fetch(Ver2:PK_Verkoop)
  		!IF NOT(ERROR())
  		!	Mut:DatumTijd = Ver2:Planning
  		!.
  		Mut:DatumTijd_DATE = TODAY()
  		Mut:DatumTijd_TIME = CLOCK()
  		
  		Mut:SoortMutatie = 'OUIT'
  	
  		Mut:NaarCELID = Pla:OverboekingCelID
  		Mut:CelLocatieID = Pla:CelLocatieID
  		
  		CLEAR(AAAACL:Record)
  		AAAACL:CelLocatieID = Mut:CelLocatieID
  		Access:AAAACelLocatie.TryFetch(AAAACL:PK_CelLocatie)
  		IF Mut:NaarCELID <> AAAACL:CelID THEN Mut:CelLocatieID = 0.
  	.
  WinAlertMouseZoom()
  Do DefineListboxStyle
  IF SELF.Request = ViewRecord                             ! Configure controls for View Only mode
    ?Mut:DatumTijd_DATE{PROP:ReadOnly} = True
    ?Mut:DatumTijd_TIME{PROP:ReadOnly} = True
    DISABLE(?VVP:ArtikelOms)
    DISABLE(?VVPar:PartijCelID)
    DISABLE(?CEL:CelOms)
    ?Mut:UitslagKG{PROP:ReadOnly} = True
    ?Mut:UitslagPallet{PROP:ReadOnly} = True
    DISABLE(?CL:Locatienaam)
  END
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('UpdateOverboekMutatieEnkel',QuickWindow)   ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  FDCB7.Init(VVP:ArtikelOms,?VVP:ArtikelOms,Queue:FileDropCombo.ViewPosition,FDCB7::View:FileDropCombo,Queue:FileDropCombo,Relate:ViewVoorraadPlanning,ThisWindow,GlobalErrors,0,0,0)
  FDCB7.Q &= Queue:FileDropCombo
  FDCB7.AddSortOrder(VVP:ViewVoorraad_FK2)
  FDCB7.AddField(VVP:ArtikelID,FDCB7.Q.VVP:ArtikelID) !List box control field - type derived from field
  FDCB7.AddField(VVP:ArtikelOms,FDCB7.Q.VVP:ArtikelOms) !List box control field - type derived from field
  FDCB7.AddField(LOC:ArtikelVoorraadKG,FDCB7.Q.LOC:ArtikelVoorraadKG) !List box control field - type derived from local data
  FDCB7.AddField(LOC:ArtikelVoorraadPallet,FDCB7.Q.LOC:ArtikelVoorraadPallet) !List box control field - type derived from local data
  FDCB7.AddField(VVP:InslagKG,FDCB7.Q.VVP:InslagKG) !Browse hot field - type derived from field
  FDCB7.AddField(VVP:InslagPallets,FDCB7.Q.VVP:InslagPallets) !Browse hot field - type derived from field
  FDCB7.AddField(VVP:UitslagKG,FDCB7.Q.VVP:UitslagKG) !Browse hot field - type derived from field
  FDCB7.AddField(VVP:UitslagPallets,FDCB7.Q.VVP:UitslagPallets) !Browse hot field - type derived from field
  FDCB7.AddField(Art:ArtikelID,FDCB7.Q.Art:ArtikelID) !Related join file key field - type derived from field
  FDCB7.AddUpdateField(VVP:ArtikelID,Mut:ArtikelID)
  ThisWindow.AddItem(FDCB7.WindowComponent)
  FDCB7.DefaultFill = 0
  FDCB4.Init(VVPar:PartijCelID,?VVPar:PartijCelID,Queue:FileDropCombo:1.ViewPosition,FDCB4::View:FileDropCombo,Queue:FileDropCombo:1,Relate:ViewVoorraadPartij,ThisWindow,GlobalErrors,0,0,0)
  FDCB4.Q &= Queue:FileDropCombo:1
  FDCB4.AddSortOrder(VVPar:ArtikelID_PartijID_CelID_K)
  FDCB4.AddRange(VVPar:ArtikelID,Mut:ArtikelID)
  FDCB4.AddField(VVPar:PartijCelID,FDCB4.Q.VVPar:PartijCelID) !List box control field - type derived from field
  FDCB4.AddField(Par:PartijID,FDCB4.Q.Par:PartijID) !List box control field - type derived from field
  FDCB4.AddField(Par:ExternPartijnr,FDCB4.Q.Par:ExternPartijnr) !List box control field - type derived from field
  FDCB4.AddField(ACel:CelOms,FDCB4.Q.ACel:CelOms) !List box control field - type derived from field
  FDCB4.AddField(LOC:PartijVoorraadKG,FDCB4.Q.LOC:PartijVoorraadKG) !List box control field - type derived from local data
  FDCB4.AddField(Ver:VerpakkingOmschrijving,FDCB4.Q.Ver:VerpakkingOmschrijving) !List box control field - type derived from field
  FDCB4.AddField(Rel:FirmaNaam,FDCB4.Q.Rel:FirmaNaam) !List box control field - type derived from field
  FDCB4.AddField(Par:VerpakkingID,FDCB4.Q.Par:VerpakkingID) !Browse hot field - type derived from field
  FDCB4.AddField(Par:ArtikelID,FDCB4.Q.Par:ArtikelID) !Browse hot field - type derived from field
  FDCB4.AddField(VVPar:PartijID,FDCB4.Q.VVPar:PartijID) !Browse hot field - type derived from field
  FDCB4.AddField(VVPar:CelID,FDCB4.Q.VVPar:CelID) !Browse hot field - type derived from field
  FDCB4.AddField(VVPar:VoorraadKG,FDCB4.Q.VVPar:VoorraadKG) !Browse hot field - type derived from field
  FDCB4.AddField(VVPar:VoorraadPallets,FDCB4.Q.VVPar:VoorraadPallets) !Browse hot field - type derived from field
  FDCB4.AddField(Ver:VerpakkingID,FDCB4.Q.Ver:VerpakkingID) !Related join file key field - type derived from field
  FDCB4.AddField(ACel:CelID,FDCB4.Q.ACel:CelID) !Related join file key field - type derived from field
  FDCB4.AddUpdateField(VVPar:PartijCelID,LOC:PartijCelID)
  FDCB4.AddUpdateField(Par:Leverancier,Loc:RelatieID)
  FDCB4.AddUpdateField(VVPar:PartijID,Mut:PartijID)
  FDCB4.AddUpdateField(VVPar:CelID,Mut:CelID)
  FDCB4.AddUpdateField(VVPar:VoorraadKG,Loc:KG)
  FDCB4.AddUpdateField(VVPar:VoorraadPallets,Loc:Pallets)
  ThisWindow.AddItem(FDCB4.WindowComponent)
  FDCB4.DefaultFill = 0
  FDCB8.Init(CEL:CelOms,?CEL:CelOms,Queue:FileDropCombo:2.ViewPosition,FDCB8::View:FileDropCombo,Queue:FileDropCombo:2,Relate:Cel,ThisWindow,GlobalErrors,0,1,0)
  FDCB8.Q &= Queue:FileDropCombo:2
  FDCB8.AddSortOrder(CEL:CEL_PK)
  FDCB8.AddField(CEL:CelOms,FDCB8.Q.CEL:CelOms) !List box control field - type derived from field
  FDCB8.AddField(CEL:CelID,FDCB8.Q.CEL:CelID) !Primary key field - type derived from field
  FDCB8.AddUpdateField(CEL:CelID,Mut:NaarCELID)
  ThisWindow.AddItem(FDCB8.WindowComponent)
  FDCB8.DefaultFill = 0
  FDCB11.Init(CL:Locatienaam,?CL:Locatienaam,Queue:FileDropCombo:3.ViewPosition,FDCB11::View:FileDropCombo,Queue:FileDropCombo:3,Relate:CelLocatie,ThisWindow,GlobalErrors,0,1,0)
  FDCB11.Q &= Queue:FileDropCombo:3
  FDCB11.AddSortOrder(CL:FK_CelLocatie)
  FDCB11.AddRange(CL:CelID,Mut:NaarCELID)
  FDCB11.AddField(CL:Locatienaam,FDCB11.Q.CL:Locatienaam) !List box control field - type derived from field
  FDCB11.AddField(CL:CelLocatieID,FDCB11.Q.CL:CelLocatieID) !Primary key field - type derived from field
  FDCB11.AddUpdateField(CL:CelLocatieID,Mut:CelLocatieID)
  ThisWindow.AddItem(FDCB11.WindowComponent)
  FDCB11.DefaultFill = 0
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
    Relate:AAAACelLocatie.Close
    Relate:AMutatie.Close
    Relate:ARelatie.Close
    Relate:AViewVoorraadPartij.Close
    Relate:Cel.Close
    Relate:Mutatie.Close
    Relate:Verkoop.Close
    Relate:ViewVoorraadPartij.Close
    Relate:ViewVoorraadPlanning.Close
  END
  IF SELF.Opened
    INIMgr.Update('UpdateOverboekMutatieEnkel',QuickWindow) ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.PrimeUpdate PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.PrimeUpdate()
    If returnValue = Level:Fatal  ! delete just occured
      ThisNetRefresh.Send('|Mutatie|ViewVoorraadPlanning|ViewVoorraadPartij|Cel|CelLocatie|') ! NetTalk (NetRefresh)
    End
    If returnValue = Level:Fatal  ! delete just occured
  		NetRefreshVoorraadViews()
  		NetRefreshPlanningViews()
    End	
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
    OF ?VVP:ArtikelOms
      IF Mut:ArtikelID <> '' THEN
      	CLEAR(AVVPar:Record)
      	AVVPar:PartijCelID = LOC:PartijCelID
      	IF(Access:AViewVoorraadPartij.TryFetch(AVVPar:PartijCelID_K) = Level:Benign)
      		IF(AVVPar:ArtikelID <> Mut:ArtikelID)
      			LOC:PartijCelID = ''
      		.
      	ELSE		
      		LOC:PartijCelID = ''
      	.
      ELSE
      	LOC:PartijCelID = ''
      .
      
      ThisWindow.Reset(true)
    OF ?CEL:CelOms
      If 0{PROP:AcceptAll} = False Then
          If NOT CL:CelID = CEL:CelID Then
              Clear(CL:Locatienaam)
              Clear(Mut:CelLocatieID)
              Display(?CL:Locatienaam)
          End
      End
      
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
  	If LOC:PartijCelID = '' THEN
  		Select(?VVPar:PartijCelID)
  		RETURN Level:Notify
  	.
  
  	IF Mut:CelID = Mut:NaarCELID THEN
  		MESSAGE('Overboeking tussen dezelfde cel')
  		Select(?CEL:CelOms)
  		RETURN Level:Notify
  	.
  
  	If LOC:OrigineelPartijCelID = '' OR LOC:OrigineelPartijCelID<>LOC:PartijCelID THEN
  		If Loc:KG-Mut:UitslagKG < 0 !OR Loc:Pallets-Mut:UitslagPallet < 0
  			Message('De uitslag van de overboeking is te groot voor de huidige voorraad ('&clip(Loc:KG)& ' KG / ' & CLIP(LOC:Pallets) & ' pallets)', |
  				'Negatieve voorraad',ICON:Exclamation)
  			Select(?Mut:UitslagKG)
  			RETURN Level:Notify
  		End	
  	ELSE
  		If (Loc:KG+LOC:OrigineelKG)-Mut:UitslagKG < 0 !OR (Loc:Pallets+LOC:OrigineelPallets)-Mut:UitslagPallet < 0
  			Message('De uitslag van de overboeking is te groot voor de huidige voorraad ('&clip(Loc:KG+LOC:OrigineelKG)& ' KG / ' & CLIP(LOC:Pallets+LOC:OrigineelPallets) & ' pallets)', |
  				'Negatieve voorraad',ICON:Exclamation)
  			Select(?Mut:UitslagKG)
  			RETURN Level:Notify
  		End
  	.
  
  	CLEAR(AAAACL:Record)
  	AAAACL:CelLocatieID = Mut:CelLocatieID
  	Access:AAAACelLocatie.TryFetch(AAAACL:PK_CelLocatie)
  	IF Mut:NaarCelID <> AAAACL:CelID THEN Mut:CelLocatieID = 0.
  ! OIN-mutatie aanmaken / bijwerken
  db.DebugOut('OIN-mutatie1('&Mut:PlanningID&','&Mut:SoortMutatie&')')
  
  found# = false
  
  CLEAR(AMut:Record)
  AMut:PlanningID = Mut:PlanningID
  SET(AMut:Mutatie_FK02, AMut:Mutatie_FK02)
  LOOP UNTIL Access:AMutatie.Next()
  	IF AMut:PlanningID <> Mut:PlanningID THEN BREAK.
  	
  	IF AMut:SoortMutatie = 'OIN' THEN
  		found# = true
  		BREAK
  	.
  END
  
  db.DebugOut('OIN-mutatie2('&found#&','&AMut:PlanningID&','&AMut:MutatieID&')')
  
  IF NOT(found#)
  	Access:AMutatie.PrimeRecord(false)
  ELSE
  	IF AMut:PartijID<>Mut:PartijID OR AMut:CelID<>Mut:NaarCELID THEN
  		! Partij/cel verandert, controleren of het veranderen van de
  		! overboeking-inslag mogelijk is een niet een negatief saldo geeft
  		CLEAR(VVPar:Record)
  		VVPar:PartijCelID = CLIP(FORMAT(AMut:PartijID, @N05)) & '.' & CLIP(AMut:CelID)
  		Access:ViewVoorraadPartij.TryFetch(VVPar:PartijCelID_K)
  		IF NOT(ERROR())
  			IF VVPar:VoorraadKG - AMut:InslagKG < 0 THEN
  				Message('Het wijzigen van de bestaande inslag van de overboeking is te groot voor de huidige voorraad ('&clip(VVPar:VoorraadKG)& ' KG)', |
  					'Negatieve voorraad',ICON:Exclamation)
  				Select(?Mut:UitslagKG)
  				RETURN Level:Notify
  			END
  		ELSE
  				Message('Het wijzigen van de bestaande inslag van de overboeking is te groot voor de huidige voorraad (0 KG)', |
  					'Negatieve voorraad',ICON:Exclamation)
  				Select(?Mut:UitslagKG)
  				RETURN Level:Notify
  		END
  	ELSE
  		! Partij/cel blijft hetzelfde, controleren of het veranderen van de
  		! overboeking-inslag mogelijk is een niet een negatief saldo geeft
  		CLEAR(VVPar:Record)
  		VVPar:PartijCelID = CLIP(FORMAT(AMut:PartijID,@N05)) & '.' & CLIP(AMut:CelID)
  		Access:ViewVoorraadPartij.TryFetch(VVPar:PartijCelID_K)
  		IF NOT(ERROR())
  			db.DebugOut('OIN-mutatie3(VVPar found:'&VVPar:PartijCelID&','&VVPar:VoorraadKG&','&VVPar:VoorraadPallets&')')
  			IF VVPar:VoorraadKG - AMut:InslagKG + Mut:UitslagKG < 0 THEN
  				Message('Het wijzigen van de bestaande inslag van de overboeking is te groot voor de huidige voorraad ('&clip(VVPar:VoorraadKG)& ' KG)', |
  					'Negatieve voorraad',ICON:Exclamation)
  				Select(?Mut:UitslagKG)
  				RETURN Level:Notify
  			END
  		ELSE
  			db.DebugOut('OIN-mutatie3(VVPar not found')
  			IF AMut:InslagKG < Mut:UitslagKG THEN
  				Message('Het wijzigen van de bestaande inslag van de overboeking is te groot voor de huidige voorraad (0 KG)', |
  					'Negatieve voorraad',ICON:Exclamation)
  				Select(?Mut:UitslagKG)
  				RETURN Level:Notify
  			.
  		END
  	END
  END
  
  AMut:DatumTijd=Mut:DatumTijd
  AMut:PartijID=Mut:PartijID
  AMut:CelID=Mut:NaarCELID
  AMut:CelLocatieID=Mut:CelLocatieID
  AMut:InslagKG=Mut:UitslagKG
  AMut:InslagPallet=Mut:UitslagPallet
  AMut:UitslagKG=0
  AMut:UitslagPallet=0
  AMut:SoortMutatie='OIN'
  AMut:NaarCELID=Mut:CelID
  AMut:RedenAfboeking=''
  AMut:ArtikelID=Mut:ArtikelID
  AMut:PlanningID=Mut:PlanningID
  
  IF NOT(found#)
  	Access:AMutatie.Insert()
  ELSE
  	Access:AMutatie.Update()
  .
  
  VoorraadClass.BerekenPlanningMutatieGrootte(Mut:PlanningID)
  ReturnValue = PARENT.TakeCompleted()
    ThisNetRefresh.Send('|Mutatie|ViewVoorraadPlanning|ViewVoorraadPartij|Cel|CelLocatie|') ! NetTalk (NetRefresh)
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
  	LOC:ArtikelVoorraadKG=VVP:InslagKG-VVP:UitslagKG
  	LOC:ArtikelVoorraadPallet=VVP:InslagPallets-VVP:UitslagPallets
  PARENT.SetQueueRecord
  
  IF (LOC:ArtikelVoorraadKG < 0)
    SELF.Q.LOC:ArtikelVoorraadKG_NormalFG = -1             ! Set conditional color values for LOC:ArtikelVoorraadKG
    SELF.Q.LOC:ArtikelVoorraadKG_NormalBG = 255
    SELF.Q.LOC:ArtikelVoorraadKG_SelectedFG = -1
    SELF.Q.LOC:ArtikelVoorraadKG_SelectedBG = 255
    SELF.Q.LOC:ArtikelVoorraadPallet_NormalFG = -1         ! Set conditional color values for LOC:ArtikelVoorraadPallet
    SELF.Q.LOC:ArtikelVoorraadPallet_NormalBG = 255
    SELF.Q.LOC:ArtikelVoorraadPallet_SelectedFG = -1
    SELF.Q.LOC:ArtikelVoorraadPallet_SelectedBG = 255
  ELSE
    SELF.Q.LOC:ArtikelVoorraadKG_NormalFG = -1             ! Set color values for LOC:ArtikelVoorraadKG
    SELF.Q.LOC:ArtikelVoorraadKG_NormalBG = -1
    SELF.Q.LOC:ArtikelVoorraadKG_SelectedFG = -1
    SELF.Q.LOC:ArtikelVoorraadKG_SelectedBG = -1
    SELF.Q.LOC:ArtikelVoorraadPallet_NormalFG = -1         ! Set color values for LOC:ArtikelVoorraadPallet
    SELF.Q.LOC:ArtikelVoorraadPallet_NormalBG = -1
    SELF.Q.LOC:ArtikelVoorraadPallet_SelectedFG = -1
    SELF.Q.LOC:ArtikelVoorraadPallet_SelectedBG = -1
  END


FDCB7.ValidateRecord PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  	LOC:ArtikelVoorraadKG=VVP:InslagKG-VVP:UitslagKG
  	LOC:ArtikelVoorraadPallet=VVP:InslagPallets-VVP:UitslagPallets
  
  	!IF LOC:ArtikelVoorraadKG <= 0 !AND LOC:ArtikelVoorraadPallet <= 0
  	!	RETURN Record:Filtered
  	!.
  ReturnValue = PARENT.ValidateRecord()
  RETURN ReturnValue


FDCB4.SetQueueRecord PROCEDURE

  CODE
  IF LOC:OrigineelPartijCelID <> VVPar:PartijCelID 
  	IF LOC:OrigineelNaarPartijCelID <> VVPar:PartijCelID
  		LOC:PartijVoorraadKG=VVPar:VoorraadKG
  		LOC:PartijVoorraadPallet=VVPar:VoorraadPallets
  	ELSE
  		LOC:PartijVoorraadKG=VVPar:VoorraadKG-LOC:OrigineelKG
  		LOC:PartijVoorraadPallet=VVPar:VoorraadPallets-LOC:OrigineelPallets
  	.
  ELSE
  	LOC:PartijVoorraadKG=VVPar:VoorraadKG+LOC:OrigineelKG
  	LOC:PartijVoorraadPallet=VVPar:VoorraadPallets+LOC:OrigineelPallets
  END
  PARENT.SetQueueRecord
  


FDCB4.ValidateRecord PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  IF LOC:OrigineelPartijCelID <> VVPar:PartijCelID 
  	IF LOC:OrigineelNaarPartijCelID <> VVPar:PartijCelID
  		LOC:PartijVoorraadKG=VVPar:VoorraadKG
  		LOC:PartijVoorraadPallet=VVPar:VoorraadPallets
  	ELSE
  		LOC:PartijVoorraadKG=VVPar:VoorraadKG-LOC:OrigineelKG
  		LOC:PartijVoorraadPallet=VVPar:VoorraadPallets-LOC:OrigineelPallets
  	.
  ELSE
  	LOC:PartijVoorraadKG=VVPar:VoorraadKG+LOC:OrigineelKG
  	LOC:PartijVoorraadPallet=VVPar:VoorraadPallets+LOC:OrigineelPallets
  END
  
  !IF LOC:PartijVoorraadKG<=0 AND LOC:PartijVoorraadPallet<=0 THEN
  IF LOC:PartijVoorraadKG<=0 THEN
  	RETURN Record:Filtered
  END
  ReturnValue = PARENT.ValidateRecord()
  RETURN ReturnValue

