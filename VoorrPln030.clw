

   MEMBER('VoorrPln.clw')                                  ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABPOPUP.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('VOORRPLN030.INC'),ONCE        !Local module procedure declarations
                     END


!!! <summary>
!!! Generated from procedure template - Window
!!! Form OverboekingRit
!!! </summary>
UpdateTransfers PROCEDURE (PRM:Datum)

udpt            UltimateDebugProcedureTracker
CurrentTab           STRING(80)                            ! 
ActionMessage        CSTRING(40)                           ! 
LOC:Datum            DATE                                  ! 
LOC:DatumVanSQL      LONG                                  ! 
LOC:DatumTMSQL       LONG                                  ! 
LOC:Planning_TIME    TIME                                  ! 
LOC:Planning_DATE    DATE                                  ! 
LOC:PlanningSoort    STRING(3)                             ! 
LOC:Getransferd      BYTE                                  ! 
BRW4::View:Browse    VIEW(OverboekingRitRegel)
                       PROJECT(ORR:OverboekingRitRegelID)
                       PROJECT(ORR:OverboekingRitID)
                       PROJECT(ORR:PlanningID)
                       JOIN(Pla:PK_Planning,ORR:PlanningID)
                         PROJECT(Pla:ArtikelID)
                         PROJECT(Pla:KG)
                         PROJECT(Pla:Pallets)
                         PROJECT(Pla:MutatieGemaakt)
                         PROJECT(Pla:PartijID)
                         PROJECT(Pla:Transport)
                         PROJECT(Pla:Instructie)
                         PROJECT(Pla:OverboekingCelID)
                         PROJECT(Pla:Planning_DATE)
                         PROJECT(Pla:Planning_TIME)
                         PROJECT(Pla:PlanningID)
                         PROJECT(Pla:CelID)
                         PROJECT(Pla:InkoopID)
                         JOIN(CEL:CEL_PK,Pla:CelID)
                           PROJECT(CEL:CelOms)
                           PROJECT(CEL:CelID)
                         END
                         JOIN(ACel:CEL_PK,Pla:OverboekingCelID)
                           PROJECT(ACel:CelOms)
                           PROJECT(ACel:CelID)
                         END
                         JOIN(Par:Partij_PK,Pla:PartijID)
                           PROJECT(Par:ExternPartijnr)
                           PROJECT(Par:PartijID)
                         END
                         JOIN(AAArt:Artikel_PK,Pla:ArtikelID)
                           PROJECT(AAArt:ArtikelOms)
                           PROJECT(AAArt:ArtikelID)
                         END
                         JOIN(AInk:PK_Inkoop,Pla:InkoopID)
                           PROJECT(AInk:Planning_DATE)
                           PROJECT(AInk:Planning_TIME)
                           PROJECT(AInk:InkoopID)
                         END
                       END
                     END
Queue:Browse         QUEUE                            !Queue declaration for browse/combo box using ?List
Pla:ArtikelID          LIKE(Pla:ArtikelID)            !List box control field - type derived from field
AAArt:ArtikelOms       LIKE(AAArt:ArtikelOms)         !List box control field - type derived from field
LOC:Planning_DATE      LIKE(LOC:Planning_DATE)        !List box control field - type derived from local data
LOC:Planning_TIME      LIKE(LOC:Planning_TIME)        !List box control field - type derived from local data
LOC:PlanningSoort      LIKE(LOC:PlanningSoort)        !List box control field - type derived from local data
Pla:KG                 LIKE(Pla:KG)                   !List box control field - type derived from field
Pla:Pallets            LIKE(Pla:Pallets)              !List box control field - type derived from field
Pla:MutatieGemaakt     LIKE(Pla:MutatieGemaakt)       !List box control field - type derived from field
Pla:MutatieGemaakt_Icon LONG                          !Entry's icon ID
CEL:CelOms             LIKE(CEL:CelOms)               !List box control field - type derived from field
ACel:CelOms            LIKE(ACel:CelOms)              !List box control field - type derived from field
Pla:PartijID           LIKE(Pla:PartijID)             !List box control field - type derived from field
Par:ExternPartijnr     LIKE(Par:ExternPartijnr)       !List box control field - type derived from field
Pla:Transport          LIKE(Pla:Transport)            !List box control field - type derived from field
Pla:Instructie         LIKE(Pla:Instructie)           !List box control field - type derived from field
Pla:OverboekingCelID   LIKE(Pla:OverboekingCelID)     !Browse hot field - type derived from field
Pla:Planning_DATE      LIKE(Pla:Planning_DATE)        !Browse hot field - type derived from field
Pla:Planning_TIME      LIKE(Pla:Planning_TIME)        !Browse hot field - type derived from field
AInk:Planning_DATE     LIKE(AInk:Planning_DATE)       !Browse hot field - type derived from field
AInk:Planning_TIME     LIKE(AInk:Planning_TIME)       !Browse hot field - type derived from field
ORR:OverboekingRitRegelID LIKE(ORR:OverboekingRitRegelID) !Browse hot field - type derived from field
ORR:OverboekingRitID   LIKE(ORR:OverboekingRitID)     !Browse key field - type derived from field
Pla:PlanningID         LIKE(Pla:PlanningID)           !Related join file key field - type derived from field
CEL:CelID              LIKE(CEL:CelID)                !Related join file key field - type derived from field
ACel:CelID             LIKE(ACel:CelID)               !Related join file key field - type derived from field
Par:PartijID           LIKE(Par:PartijID)             !Related join file key field - type derived from field
AAArt:ArtikelID        LIKE(AAArt:ArtikelID)          !Related join file key field - type derived from field
AInk:InkoopID          LIKE(AInk:InkoopID)            !Related join file key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
BRW8::View:Browse    VIEW(APlanning)
                       PROJECT(APla:ArtikelID)
                       PROJECT(APla:Planning_DATE)
                       PROJECT(APla:Planning_TIME)
                       PROJECT(APla:KG)
                       PROJECT(APla:Pallets)
                       PROJECT(APla:MutatieGemaakt)
                       PROJECT(APla:PartijID)
                       PROJECT(APla:Transport)
                       PROJECT(APla:Instructie)
                       PROJECT(APla:PlanningID)
                       PROJECT(APla:Planning)
                       PROJECT(APla:OverboekingCelID)
                       PROJECT(APla:InkoopID)
                       PROJECT(APla:CelID)
                       JOIN(AArt:Artikel_PK,APla:ArtikelID)
                         PROJECT(AArt:ArtikelOms)
                         PROJECT(AArt:ArtikelID)
                       END
                       JOIN(APar:Partij_PK,APla:PartijID)
                         PROJECT(APar:ExternPartijnr)
                         PROJECT(APar:PartijID)
                       END
                       JOIN(AACel:CEL_PK,APla:CelID)
                         PROJECT(AACel:CelOms)
                       END
                       JOIN(AAACel:CEL_PK,APla:CelID)
                         PROJECT(AAACel:CelOms)
                       END
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?List:2
APla:ArtikelID         LIKE(APla:ArtikelID)           !List box control field - type derived from field
AArt:ArtikelOms        LIKE(AArt:ArtikelOms)          !List box control field - type derived from field
APla:Planning_DATE     LIKE(APla:Planning_DATE)       !List box control field - type derived from field
APla:Planning_TIME     LIKE(APla:Planning_TIME)       !List box control field - type derived from field
APla:KG                LIKE(APla:KG)                  !List box control field - type derived from field
APla:Pallets           LIKE(APla:Pallets)             !List box control field - type derived from field
LOC:Getransferd        LIKE(LOC:Getransferd)          !List box control field - type derived from local data
LOC:Getransferd_Icon   LONG                           !Entry's icon ID
APla:MutatieGemaakt    LIKE(APla:MutatieGemaakt)      !List box control field - type derived from field
APla:MutatieGemaakt_Icon LONG                         !Entry's icon ID
AACel:CelOms           LIKE(AACel:CelOms)             !List box control field - type derived from field
AAACel:CelOms          LIKE(AAACel:CelOms)            !List box control field - type derived from field
APla:PartijID          LIKE(APla:PartijID)            !List box control field - type derived from field
APar:ExternPartijnr    LIKE(APar:ExternPartijnr)      !List box control field - type derived from field
APla:Transport         LIKE(APla:Transport)           !List box control field - type derived from field
APla:Instructie        LIKE(APla:Instructie)          !List box control field - type derived from field
APla:PlanningID        LIKE(APla:PlanningID)          !Browse hot field - type derived from field
APla:Planning          LIKE(APla:Planning)            !Browse hot field - type derived from field
APla:OverboekingCelID  LIKE(APla:OverboekingCelID)    !Browse hot field - type derived from field
APla:InkoopID          LIKE(APla:InkoopID)            !Browse hot field - type derived from field
AArt:ArtikelID         LIKE(AArt:ArtikelID)           !Related join file key field - type derived from field
APar:PartijID          LIKE(APar:PartijID)            !Related join file key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
BRW10::View:Browse   VIEW(PlanningInkoop)
                       PROJECT(Pla2:ArtikelID)
                       PROJECT(Pla2:FirmaNaam)
                       PROJECT(Pla2:PlanningID)
                       PROJECT(Pla2:Planning)
                       PROJECT(Pla2:InkoopID)
                       JOIN(Ink:PK_Inkoop,Pla2:InkoopID)
                         PROJECT(Ink:Planning_DATE)
                         PROJECT(Ink:Planning_TIME)
                         PROJECT(Ink:InkoopID)
                       END
                       JOIN(AAPla:PK_Planning,Pla2:PlanningID)
                         PROJECT(AAPla:KG)
                         PROJECT(AAPla:Pallets)
                         PROJECT(AAPla:MutatieGemaakt)
                         PROJECT(AAPla:PlanningID)
                         PROJECT(AAPla:PartijID)
                         PROJECT(AAPla:CelID)
                         JOIN(AAPar:Partij_PK,AAPla:PartijID)
                           PROJECT(AAPar:PartijID)
                         END
                         JOIN(AAAACEL:CEL_PK,AAPla:CelID)
                           PROJECT(AAAACEL:CelOms)
                           PROJECT(AAAACEL:CelID)
                         END
                       END
                       JOIN(AArt:Artikel_PK,Pla2:ArtikelID)
                         PROJECT(AArt:ArtikelOms)
                         PROJECT(AArt:ArtikelID)
                       END
                     END
Queue:Browse:2       QUEUE                            !Queue declaration for browse/combo box using ?List:3
Pla2:ArtikelID         LIKE(Pla2:ArtikelID)           !List box control field - type derived from field
AArt:ArtikelOms        LIKE(AArt:ArtikelOms)          !List box control field - type derived from field
Ink:Planning_DATE      LIKE(Ink:Planning_DATE)        !List box control field - type derived from field
Ink:Planning_TIME      LIKE(Ink:Planning_TIME)        !List box control field - type derived from field
AAPla:KG               LIKE(AAPla:KG)                 !List box control field - type derived from field
AAPla:Pallets          LIKE(AAPla:Pallets)            !List box control field - type derived from field
LOC:Getransferd        LIKE(LOC:Getransferd)          !List box control field - type derived from local data
LOC:Getransferd_Icon   LONG                           !Entry's icon ID
AAPla:MutatieGemaakt   LIKE(AAPla:MutatieGemaakt)     !List box control field - type derived from field
AAPla:MutatieGemaakt_Icon LONG                        !Entry's icon ID
AAAACEL:CelOms         LIKE(AAAACEL:CelOms)           !List box control field - type derived from field
Pla2:FirmaNaam         LIKE(Pla2:FirmaNaam)           !List box control field - type derived from field
Pla2:PlanningID        LIKE(Pla2:PlanningID)          !Primary key field - type derived from field
Pla2:Planning          LIKE(Pla2:Planning)            !Browse key field - type derived from field
Ink:InkoopID           LIKE(Ink:InkoopID)             !Related join file key field - type derived from field
AAPla:PlanningID       LIKE(AAPla:PlanningID)         !Related join file key field - type derived from field
AAPar:PartijID         LIKE(AAPar:PartijID)           !Related join file key field - type derived from field
AAAACEL:CelID          LIKE(AAAACEL:CelID)            !Related join file key field - type derived from field
AArt:ArtikelID         LIKE(AArt:ArtikelID)           !Related join file key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
LocEnableEnterByTab  BYTE(1)                               !Used by the ENTER Instead of Tab template
EnterByTabManager    EnterByTabClass
History::OR:Record   LIKE(OR:RECORD),THREAD
NetLocalRefreshDate     Long     ! NetTalk (NetRefresh)
NetLocalRefreshTime     Long
NetLocalDependancies    String('|OverboekingRit|OverboekingRitRegel|Planning|Cel|ACel|Partij|AAViewArtikel|AInkoop|APlanning|AViewArtikel|APartij|AACel|AAACel|PlanningInkoop|Inkoop|AAPlanning|AAPartij|AAAACel|')
QuickWindow          WINDOW('Form OverboekingRit'),AT(,,633,412),FONT('MS Sans Serif',8,,FONT:regular,CHARSET:DEFAULT), |
  DOUBLE,CENTER,GRAY,IMM,MDI,HLP('UpdateOverboekingRit'),SYSTEM
                       PROMPT('Uitvoertijdstip:'),AT(8,8),USE(?Ove:DatumTijd_DATE:Prompt),TRN
                       ENTRY(@d17-),AT(64,9,53,10),USE(OR:DatumTijd_DATE)
                       ENTRY(@t7),AT(122,9,33,10),USE(OR:DatumTijd_TIME)
                       PROMPT('Opmerking:'),AT(8,23),USE(?OR:Opmerking:Prompt),TRN
                       ENTRY(@s100),AT(64,23,262,10),USE(OR:Opmerking)
                       LIST,AT(9,48,615,98),USE(?List),HVSCROLL,FORMAT('[55L(2)|M~ID~C(0)@s30@120L(2)|M~Omschr' & |
  'ijving~C(0)@s60@]|~Artikel~[47R(2)|M@d17-@31R(2)|M@t7@]|~Tijdstip~17C|M@s3@40R(2)|M~' & |
  'KG~C(0)@n-13`2@30R(2)|M~Pallets~C(0)@n-14.@64R(2)|MI~Mutaties Gemaakt~C(0)@p p@[70L(' & |
  '2)|M~Van~C(0)@s50@70L(2)|M~Naar~C(0)@s50@]|~Cel~[50R(2)|M~Intern~C(0)@n_10@50R(2)|M~' & |
  'Extern~C(0)@n_10@]|~Partijnr.~100L(2)|M~Transport~C(0)@s100@200L(2)|M~Instructie~C(0)@s100@'), |
  FROM(Queue:Browse),IMM
                       BUTTON('Deselecteren'),AT(9,150),USE(?DeselecterenButton)
                       PROMPT('Datum:'),AT(10,171),USE(?LOC:Datum:Prompt)
                       SPIN(@d17-),AT(43,171,56,11),USE(LOC:Datum)
                       LIST,AT(9,200,615,79),USE(?List:2),HVSCROLL,FORMAT('[55L(2)|M~ID~C(0)@s30@120L(2)|M~Oms' & |
  'chrijving~C(0)@s60@]|~Artikel~[50R(2)|M@d17-@31R(2)|M@t7@]|~Tijdstip~40R(2)|M~KG~C(0' & |
  ')@n-13`2@30R(2)|M~Pallets~C(0)@n-14.@45R(2)|MI~Getransferd~C(0)@p p@45R(2)|MI~Overge' & |
  'boekt~C(0)@p p@[70L(2)|M~Van~C(0)@s50@70L(2)|M~Naar~C(0)@s50@]|~Cel~[50R(2)|M~Intern' & |
  '~C(0)@n_10@50R(2)|M~Extern~C(1)@n_10@]|~Partijnr.~100L(2)|M~Transport~C(0)@s100@200L' & |
  '(2)|M~Instructie~C(0)@s100@'),FROM(Queue:Browse:1),IMM
                       BUTTON('Selecteren'),AT(9,283,57),USE(?SelecterenButton)
                       BUTTON('&OK'),AT(524,393,49,14),USE(?OK),LEFT,ICON('WAOK.ICO'),DEFAULT,FLAT,MSG('Accept dat' & |
  'a and close the window'),TIP('Accept data and close the window')
                       BUTTON('&Cancel'),AT(576,393,49,14),USE(?Cancel),LEFT,ICON('WACANCEL.ICO'),FLAT,MSG('Cancel operation'), |
  TIP('Cancel operation')
                       PROMPT('Transfer ID:'),AT(521,9),USE(?OR:OverboekingRitID:Prompt)
                       ENTRY(@n_10),AT(564,9,60,10),USE(OR:OverboekingRitID),RIGHT,DISABLE
                       STRING('Overboekingen'),AT(11,186),USE(?STRING1),FONT('Microsoft Sans Serif',,,FONT:bold)
                       STRING('Geselecteerde inkopen/overboekingen'),AT(9,35),USE(?STRING2),FONT('Microsoft Sans Serif', |
  ,,FONT:bold)
                       LIST,AT(11,317,613,70),USE(?List:3),HVSCROLL,FORMAT('[55L(2)|M~ID~C(0)@s30@120L(2)|M~Om' & |
  'schrijving~C(0)@s60@]|~Artikel~[50L(2)|M@d17-@31R(2)|M@t7@]|~Tijdstip~40R(2)|M~KG~C(' & |
  '0)@n-13`2@30R(2)|M~Pallets~C(0)@n-14.@45R(2)|MI~Getransferd~C(0)@p p@25R(2)|MI~Insla' & |
  'g~C(0)@p p@70L(2)|M~Cel~C(0)@s50@100L(2)|M~Leverancier~C(0)@s50@'),FROM(Queue:Browse:2), |
  IMM
                       BUTTON('Selecteren'),AT(10,392,57),USE(?SelecterenInkoop)
                       STRING('Inkopen'),AT(11,303),USE(?STRING3),FONT('Microsoft Sans Serif',,,FONT:bold)
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
TakeFieldEvent         PROCEDURE(),BYTE,PROC,DERIVED
TakeNewSelection       PROCEDURE(),BYTE,PROC,DERIVED
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
Resizer              CLASS(WindowResizeClass)
Init                   PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)
                     END

BRW4                 CLASS(BrowseClass)                    ! Browse using ?List
Q                      &Queue:Browse                  !Reference to browse queue
ResetQueue             PROCEDURE(BYTE ResetMode),DERIVED
SetQueueRecord         PROCEDURE(),DERIVED
ValidateRecord         PROCEDURE(),BYTE,DERIVED
                     END

BRW4::Sort0:Locator  StepLocatorClass                      ! Default Locator
BRW8                 CLASS(BrowseClass)                    ! Browse using ?List:2
Q                      &Queue:Browse:1                !Reference to browse queue
SetQueueRecord         PROCEDURE(),DERIVED
                     END

BRW8::Sort0:Locator  StepLocatorClass                      ! Default Locator
BRW10                CLASS(BrowseClass)                    ! Browse using ?List:3
Q                      &Queue:Browse:2                !Reference to browse queue
SetQueueRecord         PROCEDURE(),DERIVED
                     END

BRW10::Sort0:Locator StepLocatorClass                      ! Default Locator
CurCtrlFeq          LONG
FieldColorQueue     QUEUE
Feq                   LONG
OldColor              LONG
                    END

  CODE
? DEBUGHOOK(AOverboekingRit:Record)
? DEBUGHOOK(AOverboekingRitRegel:Record)
? DEBUGHOOK(APlanning:Record)
? DEBUGHOOK(OverboekingRit:Record)
? DEBUGHOOK(OverboekingRitRegel:Record)
? DEBUGHOOK(PlanningInkoop:Record)
  GlobalResponse = ThisWindow.Run()                        ! Opens the window and starts an Accept Loop

!---------------------------------------------------------------------------
DefineListboxStyle ROUTINE
!|
!| This routine create all the styles to be shared in this window
!| It`s called after the window open
!|
!---------------------------------------------------------------------------
ConvertDatum        ROUTINE
	Loc:DatumVanSQL = Loc:Datum - 36163
	Loc:DatumTMSQL = Loc:Datum - 36163 + 1

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
        udpt.Init(UD,'UpdateTransfers','VoorrPln030.clw','VoorrPln.DLL','06/28/2024 @ 01:22PM')    
             
  GlobalErrors.SetProcedureName('UpdateTransfers')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Ove:DatumTijd_DATE:Prompt
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('Loc:DatumTMSQL',Loc:DatumTMSQL)                    ! Added by: BrowseBox(ABC)
  BIND('LOC:Planning_DATE',LOC:Planning_DATE)              ! Added by: BrowseBox(ABC)
  BIND('LOC:Planning_TIME',LOC:Planning_TIME)              ! Added by: BrowseBox(ABC)
  BIND('LOC:PlanningSoort',LOC:PlanningSoort)              ! Added by: BrowseBox(ABC)
  BIND('Pla:PlanningID',Pla:PlanningID)                    ! Added by: BrowseBox(ABC)
  BIND('AInk:InkoopID',AInk:InkoopID)                      ! Added by: BrowseBox(ABC)
  BIND('LOC:Getransferd',LOC:Getransferd)                  ! Added by: BrowseBox(ABC)
  BIND('APla:PlanningID',APla:PlanningID)                  ! Added by: BrowseBox(ABC)
  BIND('Ink:InkoopID',Ink:InkoopID)                        ! Added by: BrowseBox(ABC)
  BIND('AAPla:PlanningID',AAPla:PlanningID)                ! Added by: BrowseBox(ABC)
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.HistoryKey = CtrlH
  SELF.AddHistoryFile(OR:Record,History::OR:Record)
  SELF.AddHistoryField(?OR:DatumTijd_DATE,4)
  SELF.AddHistoryField(?OR:DatumTijd_TIME,5)
  SELF.AddHistoryField(?OR:Opmerking,6)
  SELF.AddHistoryField(?OR:OverboekingRitID,1)
  SELF.AddUpdateFile(Access:OverboekingRit)
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  Relate:AOverboekingRit.Open                              ! File AOverboekingRit used by this procedure, so make sure it's RelationManager is open
  Relate:AOverboekingRitRegel.Open                         ! File AOverboekingRitRegel used by this procedure, so make sure it's RelationManager is open
  Relate:APlanning.Open                                    ! File APlanning used by this procedure, so make sure it's RelationManager is open
  Relate:OverboekingRit.SetOpenRelated()
  Relate:OverboekingRit.Open                               ! File OverboekingRit used by this procedure, so make sure it's RelationManager is open
  Relate:PlanningInkoop.Open                               ! File PlanningInkoop used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Primary &= Relate:OverboekingRit
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
  BRW4.Init(?List,Queue:Browse.ViewPosition,BRW4::View:Browse,Queue:Browse,Relate:OverboekingRitRegel,SELF) ! Initialize the browse manager
  BRW8.Init(?List:2,Queue:Browse:1.ViewPosition,BRW8::View:Browse,Queue:Browse:1,Relate:APlanning,SELF) ! Initialize the browse manager
  BRW10.Init(?List:3,Queue:Browse:2.ViewPosition,BRW10::View:Browse,Queue:Browse:2,Relate:PlanningInkoop,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  IF SELF.Request = InsertRecord
  	OR:DatumTijd_DATE=PRM:Datum
  END
  
  LOC:Datum=PRM:Datum
  DO ConvertDatum
  
  IF GLO:HidePlanningInstructie THEN
      ?List{PROPLIST:Width, 11} = 0
      ?List:2{PROPLIST:Width, 11} = 0
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
    ?OR:DatumTijd_DATE{PROP:ReadOnly} = True
    ?OR:DatumTijd_TIME{PROP:ReadOnly} = True
    ?OR:Opmerking{PROP:ReadOnly} = True
    DISABLE(?DeselecterenButton)
    DISABLE(?SelecterenButton)
    ?OR:OverboekingRitID{PROP:ReadOnly} = True
    DISABLE(?SelecterenInkoop)
  END
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  BRW4.Q &= Queue:Browse
  BRW4.AddSortOrder(,ORR:FK_OverboekingRitRegel)           ! Add the sort order for ORR:FK_OverboekingRitRegel for sort order 1
  BRW4.AddRange(ORR:OverboekingRitID,OR:OverboekingRitID)  ! Add single value range limit for sort order 1
  BRW4.AddLocator(BRW4::Sort0:Locator)                     ! Browse has a locator for sort order 1
  BRW4::Sort0:Locator.Init(,ORR:OverboekingRitRegelID,,BRW4) ! Initialize the browse locator using  using key: ORR:FK_OverboekingRitRegel , ORR:OverboekingRitRegelID
  ?List{PROP:IconList,1} = '~off.ico'
  ?List{PROP:IconList,2} = '~on.ico'
  BRW4.AddField(Pla:ArtikelID,BRW4.Q.Pla:ArtikelID)        ! Field Pla:ArtikelID is a hot field or requires assignment from browse
  BRW4.AddField(AAArt:ArtikelOms,BRW4.Q.AAArt:ArtikelOms)  ! Field AAArt:ArtikelOms is a hot field or requires assignment from browse
  BRW4.AddField(LOC:Planning_DATE,BRW4.Q.LOC:Planning_DATE) ! Field LOC:Planning_DATE is a hot field or requires assignment from browse
  BRW4.AddField(LOC:Planning_TIME,BRW4.Q.LOC:Planning_TIME) ! Field LOC:Planning_TIME is a hot field or requires assignment from browse
  BRW4.AddField(LOC:PlanningSoort,BRW4.Q.LOC:PlanningSoort) ! Field LOC:PlanningSoort is a hot field or requires assignment from browse
  BRW4.AddField(Pla:KG,BRW4.Q.Pla:KG)                      ! Field Pla:KG is a hot field or requires assignment from browse
  BRW4.AddField(Pla:Pallets,BRW4.Q.Pla:Pallets)            ! Field Pla:Pallets is a hot field or requires assignment from browse
  BRW4.AddField(Pla:MutatieGemaakt,BRW4.Q.Pla:MutatieGemaakt) ! Field Pla:MutatieGemaakt is a hot field or requires assignment from browse
  BRW4.AddField(CEL:CelOms,BRW4.Q.CEL:CelOms)              ! Field CEL:CelOms is a hot field or requires assignment from browse
  BRW4.AddField(ACel:CelOms,BRW4.Q.ACel:CelOms)            ! Field ACel:CelOms is a hot field or requires assignment from browse
  BRW4.AddField(Pla:PartijID,BRW4.Q.Pla:PartijID)          ! Field Pla:PartijID is a hot field or requires assignment from browse
  BRW4.AddField(Par:ExternPartijnr,BRW4.Q.Par:ExternPartijnr) ! Field Par:ExternPartijnr is a hot field or requires assignment from browse
  BRW4.AddField(Pla:Transport,BRW4.Q.Pla:Transport)        ! Field Pla:Transport is a hot field or requires assignment from browse
  BRW4.AddField(Pla:Instructie,BRW4.Q.Pla:Instructie)      ! Field Pla:Instructie is a hot field or requires assignment from browse
  BRW4.AddField(Pla:OverboekingCelID,BRW4.Q.Pla:OverboekingCelID) ! Field Pla:OverboekingCelID is a hot field or requires assignment from browse
  BRW4.AddField(Pla:Planning_DATE,BRW4.Q.Pla:Planning_DATE) ! Field Pla:Planning_DATE is a hot field or requires assignment from browse
  BRW4.AddField(Pla:Planning_TIME,BRW4.Q.Pla:Planning_TIME) ! Field Pla:Planning_TIME is a hot field or requires assignment from browse
  BRW4.AddField(AInk:Planning_DATE,BRW4.Q.AInk:Planning_DATE) ! Field AInk:Planning_DATE is a hot field or requires assignment from browse
  BRW4.AddField(AInk:Planning_TIME,BRW4.Q.AInk:Planning_TIME) ! Field AInk:Planning_TIME is a hot field or requires assignment from browse
  BRW4.AddField(ORR:OverboekingRitRegelID,BRW4.Q.ORR:OverboekingRitRegelID) ! Field ORR:OverboekingRitRegelID is a hot field or requires assignment from browse
  BRW4.AddField(ORR:OverboekingRitID,BRW4.Q.ORR:OverboekingRitID) ! Field ORR:OverboekingRitID is a hot field or requires assignment from browse
  BRW4.AddField(Pla:PlanningID,BRW4.Q.Pla:PlanningID)      ! Field Pla:PlanningID is a hot field or requires assignment from browse
  BRW4.AddField(CEL:CelID,BRW4.Q.CEL:CelID)                ! Field CEL:CelID is a hot field or requires assignment from browse
  BRW4.AddField(ACel:CelID,BRW4.Q.ACel:CelID)              ! Field ACel:CelID is a hot field or requires assignment from browse
  BRW4.AddField(Par:PartijID,BRW4.Q.Par:PartijID)          ! Field Par:PartijID is a hot field or requires assignment from browse
  BRW4.AddField(AAArt:ArtikelID,BRW4.Q.AAArt:ArtikelID)    ! Field AAArt:ArtikelID is a hot field or requires assignment from browse
  BRW4.AddField(AInk:InkoopID,BRW4.Q.AInk:InkoopID)        ! Field AInk:InkoopID is a hot field or requires assignment from browse
  BRW8.Q &= Queue:Browse:1
  BRW8.AddSortOrder(,APla:Datum_Tijd_K)                    ! Add the sort order for APla:Datum_Tijd_K for sort order 1
  BRW8.AddRange(APla:Planning,LOC:DatumVanSQL,LOC:DatumTMSQL) ! Add 'range of values' range limit for sort order 1
  BRW8.AddLocator(BRW8::Sort0:Locator)                     ! Browse has a locator for sort order 1
  BRW8::Sort0:Locator.Init(,APla:Planning,,BRW8)           ! Initialize the browse locator using  using key: APla:Datum_Tijd_K , APla:Planning
  BRW8.SetFilter('((APla:OverboekingCelID <<> 0) AND (APla:Planning <<> Loc:DatumTMSQL))') ! Apply filter expression to browse
  ?List:2{PROP:IconList,1} = '~off.ico'
  ?List:2{PROP:IconList,2} = '~on.ico'
  BRW8.AddField(APla:ArtikelID,BRW8.Q.APla:ArtikelID)      ! Field APla:ArtikelID is a hot field or requires assignment from browse
  BRW8.AddField(AArt:ArtikelOms,BRW8.Q.AArt:ArtikelOms)    ! Field AArt:ArtikelOms is a hot field or requires assignment from browse
  BRW8.AddField(APla:Planning_DATE,BRW8.Q.APla:Planning_DATE) ! Field APla:Planning_DATE is a hot field or requires assignment from browse
  BRW8.AddField(APla:Planning_TIME,BRW8.Q.APla:Planning_TIME) ! Field APla:Planning_TIME is a hot field or requires assignment from browse
  BRW8.AddField(APla:KG,BRW8.Q.APla:KG)                    ! Field APla:KG is a hot field or requires assignment from browse
  BRW8.AddField(APla:Pallets,BRW8.Q.APla:Pallets)          ! Field APla:Pallets is a hot field or requires assignment from browse
  BRW8.AddField(LOC:Getransferd,BRW8.Q.LOC:Getransferd)    ! Field LOC:Getransferd is a hot field or requires assignment from browse
  BRW8.AddField(APla:MutatieGemaakt,BRW8.Q.APla:MutatieGemaakt) ! Field APla:MutatieGemaakt is a hot field or requires assignment from browse
  BRW8.AddField(AACel:CelOms,BRW8.Q.AACel:CelOms)          ! Field AACel:CelOms is a hot field or requires assignment from browse
  BRW8.AddField(AAACel:CelOms,BRW8.Q.AAACel:CelOms)        ! Field AAACel:CelOms is a hot field or requires assignment from browse
  BRW8.AddField(APla:PartijID,BRW8.Q.APla:PartijID)        ! Field APla:PartijID is a hot field or requires assignment from browse
  BRW8.AddField(APar:ExternPartijnr,BRW8.Q.APar:ExternPartijnr) ! Field APar:ExternPartijnr is a hot field or requires assignment from browse
  BRW8.AddField(APla:Transport,BRW8.Q.APla:Transport)      ! Field APla:Transport is a hot field or requires assignment from browse
  BRW8.AddField(APla:Instructie,BRW8.Q.APla:Instructie)    ! Field APla:Instructie is a hot field or requires assignment from browse
  BRW8.AddField(APla:PlanningID,BRW8.Q.APla:PlanningID)    ! Field APla:PlanningID is a hot field or requires assignment from browse
  BRW8.AddField(APla:Planning,BRW8.Q.APla:Planning)        ! Field APla:Planning is a hot field or requires assignment from browse
  BRW8.AddField(APla:OverboekingCelID,BRW8.Q.APla:OverboekingCelID) ! Field APla:OverboekingCelID is a hot field or requires assignment from browse
  BRW8.AddField(APla:InkoopID,BRW8.Q.APla:InkoopID)        ! Field APla:InkoopID is a hot field or requires assignment from browse
  BRW8.AddField(AArt:ArtikelID,BRW8.Q.AArt:ArtikelID)      ! Field AArt:ArtikelID is a hot field or requires assignment from browse
  BRW8.AddField(APar:PartijID,BRW8.Q.APar:PartijID)        ! Field APar:PartijID is a hot field or requires assignment from browse
  BRW10.Q &= Queue:Browse:2
  BRW10.AddSortOrder(,Pla2:Planning_K)                     ! Add the sort order for Pla2:Planning_K for sort order 1
  BRW10.AddRange(Pla2:Planning,LOC:DatumVanSQL,LOC:DatumTMSQL) ! Add 'range of values' range limit for sort order 1
  BRW10.AddLocator(BRW10::Sort0:Locator)                   ! Browse has a locator for sort order 1
  BRW10::Sort0:Locator.Init(,Pla2:Planning,1,BRW10)        ! Initialize the browse locator using  using key: Pla2:Planning_K , Pla2:Planning
  BRW10.SetFilter('((Pla2:Planning <<> Loc:DatumTMSQL))')  ! Apply filter expression to browse
  ?List:3{PROP:IconList,1} = '~off.ico'
  ?List:3{PROP:IconList,2} = '~on.ico'
  BRW10.AddField(Pla2:ArtikelID,BRW10.Q.Pla2:ArtikelID)    ! Field Pla2:ArtikelID is a hot field or requires assignment from browse
  BRW10.AddField(AArt:ArtikelOms,BRW10.Q.AArt:ArtikelOms)  ! Field AArt:ArtikelOms is a hot field or requires assignment from browse
  BRW10.AddField(Ink:Planning_DATE,BRW10.Q.Ink:Planning_DATE) ! Field Ink:Planning_DATE is a hot field or requires assignment from browse
  BRW10.AddField(Ink:Planning_TIME,BRW10.Q.Ink:Planning_TIME) ! Field Ink:Planning_TIME is a hot field or requires assignment from browse
  BRW10.AddField(AAPla:KG,BRW10.Q.AAPla:KG)                ! Field AAPla:KG is a hot field or requires assignment from browse
  BRW10.AddField(AAPla:Pallets,BRW10.Q.AAPla:Pallets)      ! Field AAPla:Pallets is a hot field or requires assignment from browse
  BRW10.AddField(LOC:Getransferd,BRW10.Q.LOC:Getransferd)  ! Field LOC:Getransferd is a hot field or requires assignment from browse
  BRW10.AddField(AAPla:MutatieGemaakt,BRW10.Q.AAPla:MutatieGemaakt) ! Field AAPla:MutatieGemaakt is a hot field or requires assignment from browse
  BRW10.AddField(AAAACEL:CelOms,BRW10.Q.AAAACEL:CelOms)    ! Field AAAACEL:CelOms is a hot field or requires assignment from browse
  BRW10.AddField(Pla2:FirmaNaam,BRW10.Q.Pla2:FirmaNaam)    ! Field Pla2:FirmaNaam is a hot field or requires assignment from browse
  BRW10.AddField(Pla2:PlanningID,BRW10.Q.Pla2:PlanningID)  ! Field Pla2:PlanningID is a hot field or requires assignment from browse
  BRW10.AddField(Pla2:Planning,BRW10.Q.Pla2:Planning)      ! Field Pla2:Planning is a hot field or requires assignment from browse
  BRW10.AddField(Ink:InkoopID,BRW10.Q.Ink:InkoopID)        ! Field Ink:InkoopID is a hot field or requires assignment from browse
  BRW10.AddField(AAPla:PlanningID,BRW10.Q.AAPla:PlanningID) ! Field AAPla:PlanningID is a hot field or requires assignment from browse
  BRW10.AddField(AAPar:PartijID,BRW10.Q.AAPar:PartijID)    ! Field AAPar:PartijID is a hot field or requires assignment from browse
  BRW10.AddField(AAAACEL:CelID,BRW10.Q.AAAACEL:CelID)      ! Field AAAACEL:CelID is a hot field or requires assignment from browse
  BRW10.AddField(AArt:ArtikelID,BRW10.Q.AArt:ArtikelID)    ! Field AArt:ArtikelID is a hot field or requires assignment from browse
  INIMgr.Fetch('UpdateTransfers',QuickWindow)              ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  BRW4.AddToolbarTarget(Toolbar)                           ! Browse accepts toolbar control
  BRW8.AddToolbarTarget(Toolbar)                           ! Browse accepts toolbar control
  BRW10.AddToolbarTarget(Toolbar)                          ! Browse accepts toolbar control
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
    Relate:AOverboekingRit.Close
    Relate:AOverboekingRitRegel.Close
    Relate:APlanning.Close
    Relate:OverboekingRit.Close
    Relate:PlanningInkoop.Close
  END
  IF SELF.Opened
    INIMgr.Update('UpdateTransfers',QuickWindow)           ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
            
   
  RETURN ReturnValue


ThisWindow.PrimeUpdate PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.PrimeUpdate()
    If returnValue = Level:Fatal  ! delete just occured
      ThisNetRefresh.Send('|OverboekingRit|OverboekingRitRegel|APlanning|PlanningInkoop|') ! NetTalk (NetRefresh)
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
    OF ?DeselecterenButton
      ThisWindow.Update()
      DO ConvertDatum
      Get(BRW4.Q,Choice(?List))
      
      found# = 0
      
      CLEAR(AORR:Record)
      AORR:OverboekingRitRegelID=BRW4.Q.ORR:OverboekingRitRegelID
      IF (Access:AOverboekingRitRegel.TryFetch(AORR:PK_OverboekingRitRegel) = Level:Benign)
      	Access:AOverboekingRitRegel.DeleteRecord(0)
      
      	BRW4.ResetQueue(0)
      	BRW8.ResetQueue(0)
      	BRW10.ResetQueue(0)
      .
    OF ?SelecterenButton
      ThisWindow.Update()
      DO ConvertDatum
      Get(BRW8.Q,Choice(?List:2))
      
      found# = 0
      
      db.DebugOut('Selecteren:'&OR:OverboekingRitID)
      
      CLEAR(AORR:Record)
      AORR:OverboekingRitID=OR:OverboekingRitID
      SET(AORR:FK_OverboekingRitRegel, AORR:FK_OverboekingRitRegel)
      LOOP
      	Access:AOverboekingRitRegel.TryNext()
      	IF ERROR() THEN BREAK.
      	IF AORR:OverboekingRitID<>OR:OverboekingRitID THEN BREAK.
      	
      	IF AORR:PlanningID=BRW8.Q.APla:PlanningID THEN
      		found# = 1
      		db.DebugOut('FOUND:'&AORR:PlanningID)
      	.
      	db.DebugOut('NOTFOUND:'&AORR:PlanningID)
      .
      
      db.DebugOut('FOUND-STATE:'&found#)
      
      IF NOT(found#)
      	CLEAR(AORR:Record)
      	Access:AOverboekingRitRegel.PrimeRecord()
      	AORR:OverboekingRitID=OR:OverboekingRitID
      	AORR:PlanningID=BRW8.Q.APla:PlanningID
      	Access:AOverboekingRitRegel.TryInsert()
      
      	BRW4.ResetQueue(0)
      	BRW8.ResetQueue(0)
      	BRW10.ResetQueue(0)
      .
    OF ?OK
      ThisWindow.Update()
      IF SELF.Request = ViewRecord AND NOT SELF.BatchProcessing THEN
         POST(EVENT:CloseWindow)
      END
    OF ?SelecterenInkoop
      ThisWindow.Update()
      DO ConvertDatum
      
      Get(BRW10.Q,Choice(?List:3))
      
      found# = 0
      
      db.DebugOut('Selecteren:'&OR:OverboekingRitID)
      
      CLEAR(AORR:Record)
      AORR:OverboekingRitID=OR:OverboekingRitID
      SET(AORR:FK_OverboekingRitRegel, AORR:FK_OverboekingRitRegel)
      LOOP
      	Access:AOverboekingRitRegel.TryNext()
      	IF ERROR() THEN BREAK.
      	IF AORR:OverboekingRitID<>OR:OverboekingRitID THEN BREAK.
      	
      	IF AORR:PlanningID=BRW10.Q.Pla2:PlanningID THEN
      		found# = 1
      		db.DebugOut('FOUND:'&AORR:PlanningID)
      	.
      	db.DebugOut('NOT-FOUND:'&AORR:PlanningID)
      .
      
      db.DebugOut('FOUND-STATE:'&found#)
      
      IF NOT(found#)
      	CLEAR(AORR:Record)
      	Access:AOverboekingRitRegel.PrimeRecord()
      	AORR:OverboekingRitID=OR:OverboekingRitID
      	AORR:PlanningID=BRW10.Q.Pla2:PlanningID
      	Access:AOverboekingRitRegel.TryInsert()
      
      	BRW4.ResetQueue(0)
      	BRW8.ResetQueue(0)
      	BRW10.ResetQueue(0)
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
  ! Datum/tijd van de gekoppelde planningen (alleen overboekingen waarvoor nog geen mutatie zijn gemaakt) gelijk zetten aan de uitvoerdatum van de transfer
  db.Debugout('TakeCompleted() - ' & ThisWindow.Response & ' - RitID: ' & OR:OverboekingRitID)
  IF ThisWindow.Response = RequestCompleted THEN
      CLEAR(ORR:Record)
      ORR:OverboekingRitID = OR:OverboekingRitID
      SET(ORR:FK_OverboekingRitRegel,ORR:FK_OverboekingRitRegel)
      LOOP UNTIL Access:OverboekingRitRegel.Next()
          IF ORR:OverboekingRitID <> OR:OverboekingRitID THEN BREAK.
          
          CLEAR(Pla:Record)
          Pla:PlanningID = ORR:PlanningID
          IF Access:Planning.Fetch(Pla:PK_Planning) = Level:Benign THEN
              IF Pla:MutatieGemaakt = 0 AND Pla:VerkoopID = 0 AND Pla:InkoopID = 0  THEN
                  Pla:Planning_DATE = OR:DatumTijd_DATE
                  Pla:Planning_TIME = OR:DatumTijd_TIME
                  Access:Planning.Update()
              END
          END
      END
  END
  
  NetRefreshPlanningViews()
    ThisNetRefresh.Send('|OverboekingRit|OverboekingRitRegel|APlanning|PlanningInkoop|') ! NetTalk (NetRefresh)
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
        UD.ShowProcedureInfo('UpdateTransfers',UD.SetApplicationName('VoorrPln','DLL'),QuickWindow{PROP:Hlp},'10/06/2011 @ 04:09PM','06/28/2024 @ 01:22PM','10/11/2024 @ 01:54PM')  
    
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
  CASE FIELD()
  OF ?LOC:Datum
    CASE EVENT()
    OF EVENT:Selecting
      DO ConvertDatum
      BRW8.ResetQueue(0)
      BRW10.ResetQueue(0)
    END
  END
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
    OF ?LOC:Datum
      DO ConvertDatum
      BRW8.ResetQueue(0)
      BRW10.ResetQueue(0)
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


BRW4.ResetQueue PROCEDURE(BYTE ResetMode)

  CODE
  IF Pla:OverboekingCelID<>0 THEN
  	LOC:Planning_TIME=Pla:Planning_TIME
  	LOC:Planning_DATE=Pla:Planning_DATE
  	LOC:PlanningSoort='OVR'
  ELSE
  	LOC:Planning_TIME=AInk:Planning_TIME
  	LOC:Planning_DATE=AInk:Planning_DATE
  	LOC:PlanningSoort='INK'
  .
  PARENT.ResetQueue(ResetMode)


BRW4.SetQueueRecord PROCEDURE

  CODE
  PARENT.SetQueueRecord
  
  IF (Pla:MutatieGemaakt)
    SELF.Q.Pla:MutatieGemaakt_Icon = 2                     ! Set icon from icon list
  ELSE
    SELF.Q.Pla:MutatieGemaakt_Icon = 1                     ! Set icon from icon list
  END


BRW4.ValidateRecord PROCEDURE

ReturnValue          BYTE,AUTO

BRW4::RecordStatus   BYTE,AUTO
  CODE
  IF Pla:OverboekingCelID<>0 THEN
  	LOC:Planning_TIME=Pla:Planning_TIME
  	LOC:Planning_DATE=Pla:Planning_DATE
  	LOC:PlanningSoort='OVR'
  ELSE
  	LOC:Planning_TIME=AInk:Planning_TIME
  	LOC:Planning_DATE=AInk:Planning_DATE
  	LOC:PlanningSoort='INK'
  .
  ReturnValue = PARENT.ValidateRecord()
  BRW4::RecordStatus=ReturnValue
  RETURN ReturnValue


BRW8.SetQueueRecord PROCEDURE

  CODE
  LOC:Getransferd = 0
  
  CLEAR(ORR:Record)
  ORR:PlanningID=APla:PlanningID
  SET(ORR:FK2_OverboekingRitRegel, ORR:FK2_OverboekingRitRegel)
  LOOP
  	Access:OverboekingRitRegel.Next()
  	IF ERROR() THEN BREAK.
  	IF ORR:PlanningID<>APla:PlanningID THEN BREAK.
  	
  	CLEAR(AOR:RECORD)
  	AOR:OverboekingRitID=ORR:OverboekingRitID
  	IF (Access:AOverboekingRit.TryFetch(AOR:PK_OverboekingRit) <> Level:Benign) THEN CYCLE.
  	
  	LOC:Getransferd = 1
  .
  PARENT.SetQueueRecord
  
  IF (LOC:Getransferd)
    SELF.Q.LOC:Getransferd_Icon = 2                        ! Set icon from icon list
  ELSE
    SELF.Q.LOC:Getransferd_Icon = 1                        ! Set icon from icon list
  END
  IF (APla:MutatieGemaakt)
    SELF.Q.APla:MutatieGemaakt_Icon = 2                    ! Set icon from icon list
  ELSE
    SELF.Q.APla:MutatieGemaakt_Icon = 1                    ! Set icon from icon list
  END


BRW10.SetQueueRecord PROCEDURE

  CODE
  LOC:Getransferd = 0
  
  CLEAR(ORR:Record)
  ORR:PlanningID=Pla2:PlanningID
  SET(ORR:FK2_OverboekingRitRegel, ORR:FK2_OverboekingRitRegel)
  LOOP
  	Access:OverboekingRitRegel.Next()
  	IF ERROR() THEN BREAK.
  	IF ORR:PlanningID<>Pla2:PlanningID THEN BREAK.
  	
  	CLEAR(AOR:RECORD)
  	AOR:OverboekingRitID=ORR:OverboekingRitID
  	IF (Access:AOverboekingRit.TryFetch(AOR:PK_OverboekingRit) <> Level:Benign) THEN CYCLE.
  	
  	LOC:Getransferd = 1
  .
  PARENT.SetQueueRecord
  
  IF (LOC:Getransferd)
    SELF.Q.LOC:Getransferd_Icon = 2                        ! Set icon from icon list
  ELSE
    SELF.Q.LOC:Getransferd_Icon = 1                        ! Set icon from icon list
  END
  IF (AAPla:MutatieGemaakt)
    SELF.Q.AAPla:MutatieGemaakt_Icon = 2                   ! Set icon from icon list
  ELSE
    SELF.Q.AAPla:MutatieGemaakt_Icon = 1                   ! Set icon from icon list
  END

