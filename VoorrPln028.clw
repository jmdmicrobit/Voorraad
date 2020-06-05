

   MEMBER('VoorrPln.clw')                                  ! This is a MEMBER module


   INCLUDE('ABDROPS.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('VOORRPLN028.INC'),ONCE        !Local module procedure declarations
                     END


!!! <summary>
!!! Generated from procedure template - Window
!!! Form Mutatie
!!! </summary>
UpdateOverboekMutatie PROCEDURE 

CurrentTab           STRING(80)                            ! 
Loc:KG               DECIMAL(10,2)                         ! 
Loc:CelLocatieNaam   CSTRING(51)                           ! 
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
LOC:OrigineelPartijID LONG                                 ! 
LOC:OrigineelCelID   LONG                                  ! 
LOC:OrigineelNaarPartijCelID CSTRING(26),DIM(100)          ! 
LOC:OrigineelNaarPartijID LONG,DIM(100)                    ! 
LOC:OrigineelNaarCelID LONG,DIM(100)                       ! 
LOC:OrigineelKG      DECIMAL(10,2),DIM(100)                ! 
LOC:OrigineelPallets LONG,DIM(100)                         ! 
LOC:OrigineelArtikelID CSTRING(31)                         ! 
LOC:OverboekingCelID LONG                                  ! 
LOC:NaarTotaalKG     DECIMAL(10,2)                         ! 
LOC:NaarTotaalPallets DECIMAL(10,2)                        ! 
LOC:NaarVerschilKG   DECIMAL(10,2)                         ! 
LOC:NaarVerschilPallets LONG                               ! 
LOC:NaarCelID2       LONG                                  ! 
LOC:NaarCelLocatieID2 LONG                                 ! 
LOC:NaarKG2          DECIMAL(10,2)                         ! 
LOC:NaarPallets2     LONG                                  ! 
LOC:NaarCelID3       LONG                                  ! 
LOC:NaarCelLocatieID3 LONG                                 ! 
LOC:NaarKG3          DECIMAL(10,2)                         ! 
LOC:NaarPallets3     LONG                                  ! 
LOC:NaarCelID4       LONG                                  ! 
LOC:NaarCelLocatieID4 LONG                                 ! 
LOC:NaarKG4          DECIMAL(10,2)                         ! 
LOC:NaarPallets4     LONG                                  ! 
LOC:Validatie        BYTE                                  ! 
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
                       PROJECT(VVPar:VoorraadKG)
                       PROJECT(VVPar:PartijID)
                       PROJECT(VVPar:CelID)
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
VVPar:VoorraadKG       LIKE(VVPar:VoorraadKG)         !List box control field - type derived from field
LOC:PartijVoorraadKG   LIKE(LOC:PartijVoorraadKG)     !List box control field - type derived from local data
Ver:VerpakkingOmschrijving LIKE(Ver:VerpakkingOmschrijving) !List box control field - type derived from field
Rel:FirmaNaam          LIKE(Rel:FirmaNaam)            !List box control field - type derived from field
Par:VerpakkingID       LIKE(Par:VerpakkingID)         !Browse hot field - type derived from field
Par:ArtikelID          LIKE(Par:ArtikelID)            !Browse hot field - type derived from field
VVPar:PartijID         LIKE(VVPar:PartijID)           !Browse hot field - type derived from field
VVPar:CelID            LIKE(VVPar:CelID)              !Browse hot field - type derived from field
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
QuickWindow          WINDOW('Form Mutatie'),AT(,,545,212),FONT('MS Sans Serif',8,,,CHARSET:DEFAULT),DOUBLE,CENTER, |
  GRAY,IMM,MDI,HLP('UpdateUitslagMutatie'),SYSTEM
                       SHEET,AT(4,4,539,189),USE(?CurrentTab)
                         TAB('&1) General'),USE(?Tab:1)
                           PROMPT('Invoerdatum:'),AT(13,23),USE(?Mut:DatumTijd_DATE:Prompt),TRN
                           ENTRY(@d6-),AT(88,25,64,10),USE(Mut:DatumTijd_DATE),SKIP
                           PROMPT('Invoertijd:'),AT(172,25),USE(?Mut:DatumTijd_TIME:Prompt),TRN
                           ENTRY(@t7),AT(209,25,56,10),USE(Mut:DatumTijd_TIME),SKIP
                           PROMPT('Artikel:'),AT(13,41),USE(?PROMPT1)
                           COMBO(@s60),AT(87,41,308,10),USE(VVP:ArtikelOms),DROP(25),FORMAT('51L(2)|~Artikel ID~C(' & |
  '0)@s30@115L(2)|~Artikel~C(2)@s60@[54R(2)|*~KG~C(0)@n-13`2@60R(2)|*~Pallets~C(0)@n-14.@]|'), |
  FROM(Queue:FileDropCombo),IMM
                           PROMPT('Partij:'),AT(13,68),USE(?PROMPT2)
                           COMBO(@s25),AT(87,68,308,10),USE(VVPar:PartijCelID),DROP(5,400),FORMAT('0L(2)~Partij.Ce' & |
  'l~C(0)@s25@[42R(2)|~Intern~C(0)@n_10B@60R(2)|~Extern~C(1)@n_10B@](87)|~Partijnummer~' & |
  '41R(2)|~Cel~C(0)@s50@56R(2)|~Voorraad KG~D(14)@n-13`2@[49R(2)|M~KG~C(1)@n-12`2@](48)' & |
  '|~Voorraad~81L(2)|~Verpakking~C(2)@s50@94L(2)|~Leverancier~C(0)@s50@'),FROM(Queue:FileDropCombo:1), |
  IMM
                           PROMPT('Naar cel:'),AT(9,151),USE(?PROMPT6)
                           BUTTON('Neem Voorraad'),AT(405,79,68,23),USE(?NeemVoorraadButton:5),FONT('Microsoft Sans Serif', |
  ,,FONT:regular)
                           ENTRY(@n12_`2),AT(407,121,60,10),USE(LOC:NaarTotaalKG),RIGHT(2)
                           ENTRY(@n_9),AT(477,121,60,10),USE(LOC:NaarTotaalPallets),RIGHT(2)
                           COMBO(@s30),AT(87,151,307,10),USE(CEL:CelOms),DROP(5),FORMAT('110L(2)|M~Cel~@s50@'),FROM(Queue:FileDropCombo:2), |
  IMM
                           PROMPT('Cel:'),AT(86,108),USE(?PROMPT3)
                           PROMPT('KG'),AT(451,106),USE(?Mut:UitslagKG:Prompt)
                           PROMPT('Pallets'),AT(513,106),USE(?Mut:UitslagPallet:Prompt)
                           PROMPT('Leverancier:'),AT(86,81),USE(?PROMPT4)
                           PROMPT('Verpakking:'),AT(86,95),USE(?PROMPT5)
                           STRING(@s50),AT(130,81,265),USE(Rel:FirmaNaam)
                           STRING(@s50),AT(129,95,266),USE(Ver:VerpakkingOmschrijving)
                           STRING(@s50),AT(129,108,266),USE(ACel:CelOms)
                           STRING(@s50),AT(131,54,263),USE(Art:ArtikelOms)
                           STRING('Locatie:'),AT(9,164),USE(?STRING1)
                           LIST,AT(87,137,307,10),USE(Mut:OverboekSoort),DROP(5),FROM('Overboeking|Verplaatsing|Co' & |
  'rrectie|Afboeking')
                           ENTRY(@n12_`2),AT(407,137,60,10),USE(Mut:UitslagKG),RIGHT(2)
                           ENTRY(@n_9),AT(477,137,60,10),USE(Mut:UitslagPallet),RIGHT(2)
                           STRING('KGBalans'),AT(405,174,63,12),USE(?KGBalans),RIGHT(6)
                           STRING('PalletsBalans'),AT(475,174,63,12),USE(?PalletsBalans),RIGHT(6)
                           COMBO(@s50),AT(87,166,307,10),USE(CL:Locatienaam),DROP(25),FORMAT('200L(2)|M~Locatienaa' & |
  'm~L(0)@s50@'),FROM(Queue:FileDropCombo:3),IMM
                           STRING('Locatie'),AT(86,121),USE(?STRING2)
                           STRING(@s50),AT(129,122,266),USE(AAAACL:Locatienaam),FONT('Microsoft Sans Serif',,,FONT:regular)
                           PROMPT('Overboek Soort:'),AT(9,135),USE(?Mut:OverboekSoort:Prompt)
                         END
                       END
                       BUTTON('&OK'),AT(437,194,49,14),USE(?OK),LEFT,ICON('WAOK.ICO'),DEFAULT,FLAT,MSG('Accept dat' & |
  'a and close the window'),TIP('Accept data and close the window')
                       BUTTON('&Cancel'),AT(491,194,49,14),USE(?Cancel),LEFT,ICON('WACANCEL.ICO'),FLAT,MSG('Cancel operation'), |
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
ValidateRecord         PROCEDURE(),BYTE,DERIVED
                     END

FDCB8                CLASS(FileDropComboClass)             ! File drop combo manager
Q                      &Queue:FileDropCombo:2         !Reference to browse queue type
                     END

FDCB11               CLASS(FileDropComboClass)             ! File drop combo manager
Q                      &Queue:FileDropCombo:3         !Reference to browse queue type
                     END

LocalClass          CLASS
HideControls           PROCEDURE()
                    END
Boeksoort           GROUP
Afboeking               String('Afboeking')
Verplaatsing            String('Verplaatsing')
Correctie               String('Correctie')
Overboeking             String('Overboeking')
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
BerekenTotaal ROUTINE
	LOC:NaarVerschilKG = LOC:NaarTotaalKG - (Mut:UitslagKG+LOC:NaarKG2+LOC:NaarKG3+LOC:NaarKG4)
	LOC:NaarVerschilPallets = LOC:NaarTotaalPallets - (Mut:UitslagPallet+LOC:NaarPallets2+LOC:NaarPallets3+LOC:NaarPallets4)
	
	
	IF LOC:NaarVerschilKG = 0
		?KGBalans{Prop:Text} = 'Klopt'
	ELSE
		?KGBalans{Prop:Text} = format(LOC:NaarVerschilKG, @n-10`2)
	.
	
	IF LOC:NaarVerschilPallets = 0
		?PalletsBalans{Prop:Text} = 'Klopt'
	ELSE
		?PalletsBalans{Prop:Text} = format(LOC:NaarVerschilPallets, @n-14.)
    .
    
    ThisWindow.Reset(1)
	
	EXIT
ControleerMutaties  ROUTINE
DATA
ControleTekst STRING(100)
CODE
    db.DebugOut('ControleerMutaties')
    ! Controleren of de voorgestelde mutaties niet tot negatieve voorraadstanden leiden
    VoorraadClass.ResetPartijCelControle()

    ! Oorspronkelijke mutaties meenemen indien relevant
    LOOP i# = 1 TO 100
        VoorraadClass.AddPartijCelControleOverboeking(LOC:OrigineelPartijID, LOC:OrigineelCelID, LOC:OrigineelNaarCelID[i#], -LOC:OrigineelKG[i#], -LOC:OrigineelPallets[i#])
    END
    
    ! Nieuwe mutaties meenemen
    ! Uit de directe controls
    VoorraadClass.AddPartijCelControleOverboeking(Mut:PartijID, Mut:CelID, Mut:NaarCelID, Mut:UitslagKG, Mut:UitslagPallet)
    
    ControleTekst = VoorraadClass.PartijCelControleOK()
    
    IF NOT(CLIP(ControleTekst) = '') THEN
        Message(CLIP(ControleTekst), 'Let op!', ICON:Exclamation)
        LOC:Validatie = False
    ELSE
        LOC:Validatie = True
    END
    
WisMutaties ROUTINE
	! Vullen regels
    IF Mut:PlanningID <> 0
        GLO:GebruikerLogHandelingOpmerking='Overboeken Mutatie' 
	   Clear(AMut:Record)
	   AMut:PlanningID = Mut:PlanningID
	   SET(AMut:Mutatie_FK02, AMut:Mutatie_FK02)
	   LOOP UNTIL Access:AMutatie.Next()
		   IF NOT(AMut:PlanningID = Mut:PlanningID) THEN BREAK.
		   ! Huidige mutatie die geupdated wordt niet verwijderen
           IF (AMut:MutatieID=Mut:MutatieID) THEN CYCLE.
		   Access:AMutatie.DeleteRecord(false)
        END
        CLEAR(GLO:GebruikerLogHandelingOpmerking)
	END
	EXIT
MaakMutaties ROUTINE ! Extra mutaties aanmaken
    AMut:Record = Mut:Record
    GLO:GebruikerLogHandelingOpmerking='Overboeken Mutatie' 
    ! (1) Eerst de complementaire OIN-mutatie
    CLEAR(Mut:Record)
    Access:Mutatie.PrimeRecord(false)
    Mut:DatumTijd=AMut:DatumTijd
    Mut:PartijID=AMut:PartijID
    Mut:CelID=AMut:NaarCELID
    Mut:CelLocatieID=VoorraadClass.ControleerCelLocatie(AMut:NaarCELID, AMut:OverboekCelLocatieID)  !AMut:CelLocatieID
    Mut:InslagKG=AMut:UitslagKG
    Mut:InslagPallet=AMut:UitslagPallet
    Mut:UitslagKG=0
    Mut:UitslagPallet=0
    Mut:SoortMutatie='OIN'
    Mut:NaarCELID=AMut:CelID
    Mut:RedenAfboeking=''
    Mut:ArtikelID=AMut:ArtikelID
    Mut:PlanningID=AMut:PlanningID
    Access:Mutatie.Insert()
    
    ! (2) Dan de OIN / OUT-mutatie uit de losse controls
    

    Mut:Record = AMut:Record
    CLEAR(GLO:GebruikerLogHandelingOpmerking)

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
  GlobalErrors.SetProcedureName('UpdateOverboekMutatie')
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
  SELF.AddHistoryField(?Mut:OverboekSoort,52)
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
      LOC:OrigineelArtikelID = Mut:ArtikelID
      LOC:OrigineelPartijCelID = LOC:PartijCelID
      LOC:OrigineelPartijID = Mut:PartijID
      LOC:OrigineelCelID = Mut:CelID
      LOC:OrigineelNaarPartijCelID[1] = CLIP(FORMAT(Mut:PartijID, @N05)) & '.' & CLIP(Mut:NaarCELID)
      LOC:OrigineelNaarPartijID[1] = Mut:PartijID
      LOC:OrigineelNaarCelID[1] = Mut:NaarCelID
      LOC:OrigineelKG[1] = Mut:UitslagKG
      LOC:OrigineelPallets[1] = Mut:UitslagPallet
  
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
      
      ! De overige mutaties ophalen in de locale-variabelen/queue stoppen
      IF (Mut:PlanningID <> 0)
         LOC:NaarTotaalKG = 0
         LOC:NaarTotaalPallets = 0
         LOOP i# = 1 TO 100
             LOC:NaarTotaalKG += LOC:OrigineelKG[i#]
             LOC:NaarTotaalPallets += LOC:OrigineelPallets[i#]
         END
     END
  ELSIF SELF.Request=InsertRecord
      Loc:ArtikelID = PLA:ArtikelID
      Loc:VerpakkingsID = PLA:VerpakkingID
  !	Loc:RelatieID = Par:Leverancier
      LOC:PartijCelID = CLIP(FORMAT(Pla:PartijID, @N05)) & '.' & CLIP(Pla:CelID)
  
      ! Geen bestaande uitslag om rekening mee te houden
      ! bij het controleren van de voorraad
      LOC:OrigineelPartijCelID=''
      LOC:OrigineelArtikelID=''
      LOC:OrigineelNaarPartijCelID[1]=''
      LOC:OrigineelKG[1] = 0
      LOC:OrigineelPallets[1] = 0
  
      VVPar:PartijCelID = LOC:PartijCelID
      Access:ViewVoorraadPartij.TryFetch(VVPar:PartijCelID_K)
      IF NOT(ERROR())
          LOC:KG = VVPar:VoorraadKG
          LOC:Pallets = VVPar:VoorraadPallets
          
          LOC:NaarTotaalKG = Mut:UitslagKG
          LOC:NaarTotaalPallets = Mut:UitslagPallet
          
          Mut:PartijID = Pla:PartijID
          Mut:CelID = Pla:CelID
          Mut:CelLocatieID = Pla:CelLocatieID
      ELSE
          LOC:PartijCelID = ''
          Loc:KG = 0
          Loc:Pallets = 0
  
          LOC:NaarTotaalKG = Mut:UitslagKG
          LOC:NaarTotaalPallets = Mut:UitslagPallet
          
          Mut:PartijID = 0
          Mut:CelID = 0
          Mut:CelLocatieID = 0
      .
      
      Mut:PlanningID = Pla:PlanningID
  
      Mut:DatumTijd_DATE = TODAY()
      Mut:DatumTijd_TIME = CLOCK()
      
      Mut:SoortMutatie = 'OUIT'
      
      Mut:NaarCELID = Pla:OverboekingCelID
      Mut:OverBoekCelLocatieID=Pla:OverboekCelLocatieID 
      Mut:OverboekSoort=Pla:OverboekSoort
      !Mut:CelLocatieID = Pla:CelLocatieID
      !Mut:CelLocatieID = Pla:OverboekCelLocatieID
      
      CLEAR(AAAACL:Record)
      AAAACL:CelLocatieID = Mut:CelLocatieID
      Access:AAAACelLocatie.TryFetch(AAAACL:PK_CelLocatie)
      IF Mut:NaarCELID <> AAAACL:CelID THEN Mut:CelLocatieID = 0.
  .
  
  LocalClass.HideControls()
  DO BerekenTotaal
  WinAlertMouseZoom()
  Do DefineListboxStyle
  IF SELF.Request = ViewRecord                             ! Configure controls for View Only mode
    ?Mut:DatumTijd_DATE{PROP:ReadOnly} = True
    ?Mut:DatumTijd_TIME{PROP:ReadOnly} = True
    DISABLE(?VVP:ArtikelOms)
    DISABLE(?VVPar:PartijCelID)
    DISABLE(?NeemVoorraadButton:5)
    ?LOC:NaarTotaalKG{PROP:ReadOnly} = True
    ?LOC:NaarTotaalPallets{PROP:ReadOnly} = True
    DISABLE(?CEL:CelOms)
    DISABLE(?Mut:OverboekSoort)
    ?Mut:UitslagKG{PROP:ReadOnly} = True
    ?Mut:UitslagPallet{PROP:ReadOnly} = True
    DISABLE(?CL:Locatienaam)
  END
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
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
  FDCB4.AddField(VVPar:VoorraadKG,FDCB4.Q.VVPar:VoorraadKG) !List box control field - type derived from field
  FDCB4.AddField(LOC:PartijVoorraadKG,FDCB4.Q.LOC:PartijVoorraadKG) !List box control field - type derived from local data
  FDCB4.AddField(Ver:VerpakkingOmschrijving,FDCB4.Q.Ver:VerpakkingOmschrijving) !List box control field - type derived from field
  FDCB4.AddField(Rel:FirmaNaam,FDCB4.Q.Rel:FirmaNaam) !List box control field - type derived from field
  FDCB4.AddField(Par:VerpakkingID,FDCB4.Q.Par:VerpakkingID) !Browse hot field - type derived from field
  FDCB4.AddField(Par:ArtikelID,FDCB4.Q.Par:ArtikelID) !Browse hot field - type derived from field
  FDCB4.AddField(VVPar:PartijID,FDCB4.Q.VVPar:PartijID) !Browse hot field - type derived from field
  FDCB4.AddField(VVPar:CelID,FDCB4.Q.VVPar:CelID) !Browse hot field - type derived from field
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
  FDCB11.AddUpdateField(CL:CelLocatieID,Mut:OverboekCelLocatieID)
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
    CASE ACCEPTED()
    OF ?NeemVoorraadButton:5
      LOC:NaarTotaalKG=FDCB4.Q.LOC:PartijVoorraadKG
      
      	Mut:UitslagKG = LOC:NaarTotaalKG
      
      DO BerekenTotaal
    OF ?LOC:NaarTotaalKG
      	Mut:UitslagKG = LOC:NaarTotaalKG
      
      DO BerekenTotaal
    OF ?LOC:NaarTotaalPallets
      	Mut:UitslagPallet = LOC:NaarTotaalPallets
      
      DO BerekenTotaal
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
      
    OF ?Mut:OverboekSoort
      LocalClass.HideControls()
    OF ?Mut:UitslagKG
      
      DO BerekenTotaal
    OF ?Mut:UitslagPallet
      
      DO BerekenTotaal
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
  ! Invoer controleren
  If LOC:PartijCelID = '' THEN
      Select(?VVPar:PartijCelID)
      RETURN Level:Notify
  .
  
  IF Mut:NaarCELID = 0 THEN
      Select(?Cel:CelOms)
      RETURN Level:Notify
  END
  
  If (Mut:UitslagKG = 0 AND Mut:UitslagPallet = 0) THEN
      Select(?Mut:UitslagKG)
      RETURN Level:Notify
  END
  
  DO ControleerMutaties
  IF NOT(LOC:Validatie) THEN RETURN Level:Notify.
  ReturnValue = PARENT.TakeCompleted()
    ThisNetRefresh.Send('|Mutatie|ViewVoorraadPlanning|ViewVoorraadPartij|Cel|CelLocatie|') ! NetTalk (NetRefresh)
  ! Mutaties aanmaken / bijwerken
  DO WisMutaties
  DO MaakMutaties
  
  VoorraadClass.BerekenPlanningMutatieGrootte(Mut:PlanningID)
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

LocalClass.HideControls    PROCEDURE()
CODE
    IF NOT INLIST(Mut:OverboekSoort,Boeksoort.Afboeking, Boeksoort.Verplaatsing, Boeksoort.Correctie, Boeksoort.Overboeking)
        Message('Onbekende OverBoeksoort '&Mut:OverboekSoort)
    END
    
    ?PROMPT6{Prop:Hide}=CHOOSE(Mut:OverboekSoort = Boeksoort.Afboeking OR Mut:OverboekSoort = Boeksoort.Correctie, TRUE, FALSE)
    ?Cel:CelOms{Prop:Hide}=CHOOSE(Mut:OverboekSoort = Boeksoort.Afboeking OR Mut:OverboekSoort = Boeksoort.Correctie, TRUE, FALSE)
    ?STRING1{Prop:Hide}=CHOOSE(Mut:OverboekSoort = Boeksoort.Afboeking OR Mut:OverboekSoort = Boeksoort.Correctie, TRUE, FALSE)
    ?CL:Locatienaam{Prop:Hide}=CHOOSE(Mut:OverboekSoort = Boeksoort.Afboeking OR Mut:OverboekSoort = Boeksoort.Correctie, TRUE, FALSE)
    
    ?Mut:UitslagKG{Prop:Disable}=CHOOSE(Mut:OverboekSoort=Boeksoort.Correctie, FALSE, TRUE)
    ?Mut:UitslagKG:Prompt{Prop:Disable}=CHOOSE(Mut:OverboekSoort=Boeksoort.Correctie, FALSE, TRUE)
    ?Mut:UitslagPallet{Prop:Disable}=CHOOSE(Mut:OverboekSoort=Boeksoort.Correctie, FALSE, TRUE)
    ?Mut:UitslagPallet:Prompt{Prop:Disable}=CHOOSE(Mut:OverboekSoort=Boeksoort.Correctie, FALSE, TRUE)
    
!    ?Pla:NieuwKG{Prop:Hide}=CHOOSE(Loc:OverboekSoort = Boeksoort.Correctie, FALSE, TRUE)
!    ?Loc:NieuwKG:Prompt{Prop:Hide}=CHOOSE(Loc:OverboekSoort = Boeksoort.Correctie, FALSE, TRUE)
!    ?Pla:NieuwPallets{Prop:Hide}=CHOOSE(Loc:OverboekSoort = Boeksoort.Correctie, FALSE, TRUE)
!    ?Loc:NieuwPallet:Prompt{Prop:Hide}=CHOOSE(Loc:OverboekSoort = Boeksoort.Correctie, FALSE, TRUE)
    
    Case Mut:OverboekSoort
    OF 'Overboeking'
    OF 'Verplaatsing'
    OF 'Afboeking'
    OF 'Correctie'
    ELSE
        Message('Onbekende OverBoeksoort '&Mut:OverboekSoort)
        
        END

Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window


FDCB7.SetQueueRecord PROCEDURE

  CODE
  !	LOC:ArtikelVoorraadKG=VVP:InslagKG-VVP:UitslagKG
  !	LOC:ArtikelVoorraadPallet=VVP:InslagPallets-VVP:UitslagPallets
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


FDCB4.ValidateRecord PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ! Voorraad-standen weergeven, gecorrigeerd met de huidige mutaties v/d overboeking indien relevant
  LOC:PartijVoorraadKG=VVPar:VoorraadKG
  LOC:PartijVoorraadPallet=VVPar:VoorraadPallets
  
  LOOP i# = 1 TO 100
      IF CLIP(LOC:OrigineelNaarPartijCelID[i#]) = '' THEN BREAK.
  
      IF LOC:OrigineelPartijCelID = VVPar:PartijCelID THEN
          LOC:PartijVoorraadKG+=LOC:OrigineelKG[i#]
          LOC:PartijVoorraadPallet+=LOC:OrigineelPallets[i#]
      END
          
      IF LOC:OrigineelNaarPartijCelID[i#] = VVPar:PartijCelID THEN
          LOC:PartijVoorraadKG-=LOC:OrigineelKG[i#]
          LOC:PartijVoorraadPallet-=LOC:OrigineelPallets[i#]
      END            
  END
  
  IF NOT(LOC:PartijVoorraadKG > 0) THEN RETURN Record:Filtered.
  !IF NOT(LOC:PartijVoorraadKG > 0 OR LOC:PartijVoorraadPallet > 0) THEN RETURN Record:Filtered. 17-5 Pallets zijn niet zo boeiend
  ReturnValue = PARENT.ValidateRecord()
  RETURN ReturnValue

