

   MEMBER('VoorrVrd.clw')                                  ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABPOPUP.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('VOORRVRD004.INC'),ONCE        !Local module procedure declarations
                     END


!!! <summary>
!!! Generated from procedure template - Window
!!! Form ViewVoorraad
!!! </summary>
UpdateViewVoorraad PROCEDURE 

udpt            UltimateDebugProcedureTracker
CurrentTab           STRING(80)                            ! 
Loc:KG               DECIMAL(7,2)                          ! 
Loc:Pallets          LONG                                  ! 
ActionMessage        CSTRING(40)                           ! 
BRW9::View:Browse    VIEW(Planning)
                       PROJECT(Pla:KG)
                       PROJECT(Pla:Pallets)
                       PROJECT(Pla:MutatieGemaakt)
                       PROJECT(Pla:InkoopID)
                       PROJECT(Pla:ArtikelID)
                       PROJECT(Pla:Verwerkt)
                       PROJECT(Pla:PlanningID)
                       PROJECT(Pla:VerpakkingID)
                       PROJECT(Pla:CelID)
                       JOIN(Ink:PK_Inkoop,Pla:InkoopID)
                         PROJECT(Ink:InkoopID)
                         PROJECT(Ink:Planning_DATE)
                         PROJECT(Ink:Planning_TIME)
                         PROJECT(Ink:Leverancier)
                         JOIN(Rel:Relatie_PK,Ink:Leverancier)
                           PROJECT(Rel:FirmaNaam)
                           PROJECT(Rel:RelatieID)
                         END
                       END
                       JOIN(Ver:Verpakking_PK,Pla:VerpakkingID)
                         PROJECT(Ver:VerpakkingOmschrijving)
                         PROJECT(Ver:VerpakkingID)
                       END
                       JOIN(Art:Artikel_PK,Pla:ArtikelID)
                         PROJECT(Art:ArtikelID)
                       END
                       JOIN(CEL:CEL_PK,Pla:CelID)
                         PROJECT(CEL:CelOms)
                         PROJECT(CEL:CelID)
                       END
                     END
Queue:Browse:2       QUEUE                            !Queue declaration for browse/combo box using ?List:3
Ink:InkoopID           LIKE(Ink:InkoopID)             !List box control field - type derived from field
Ink:InkoopID_NormalFG  LONG                           !Normal forground color
Ink:InkoopID_NormalBG  LONG                           !Normal background color
Ink:InkoopID_SelectedFG LONG                          !Selected forground color
Ink:InkoopID_SelectedBG LONG                          !Selected background color
Rel:FirmaNaam          LIKE(Rel:FirmaNaam)            !List box control field - type derived from field
Rel:FirmaNaam_NormalFG LONG                           !Normal forground color
Rel:FirmaNaam_NormalBG LONG                           !Normal background color
Rel:FirmaNaam_SelectedFG LONG                         !Selected forground color
Rel:FirmaNaam_SelectedBG LONG                         !Selected background color
Ink:Planning_DATE      LIKE(Ink:Planning_DATE)        !List box control field - type derived from field
Ink:Planning_DATE_NormalFG LONG                       !Normal forground color
Ink:Planning_DATE_NormalBG LONG                       !Normal background color
Ink:Planning_DATE_SelectedFG LONG                     !Selected forground color
Ink:Planning_DATE_SelectedBG LONG                     !Selected background color
Ink:Planning_TIME      LIKE(Ink:Planning_TIME)        !List box control field - type derived from field
Ink:Planning_TIME_NormalFG LONG                       !Normal forground color
Ink:Planning_TIME_NormalBG LONG                       !Normal background color
Ink:Planning_TIME_SelectedFG LONG                     !Selected forground color
Ink:Planning_TIME_SelectedBG LONG                     !Selected background color
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
Pla:MutatieGemaakt     LIKE(Pla:MutatieGemaakt)       !Browse hot field - type derived from field
Pla:InkoopID           LIKE(Pla:InkoopID)             !Browse hot field - type derived from field
Pla:ArtikelID          LIKE(Pla:ArtikelID)            !Browse hot field - type derived from field
Pla:Verwerkt           LIKE(Pla:Verwerkt)             !Browse hot field - type derived from field
Pla:PlanningID         LIKE(Pla:PlanningID)           !Primary key field - type derived from field
Rel:RelatieID          LIKE(Rel:RelatieID)            !Related join file key field - type derived from field
Ver:VerpakkingID       LIKE(Ver:VerpakkingID)         !Related join file key field - type derived from field
Art:ArtikelID          LIKE(Art:ArtikelID)            !Related join file key field - type derived from field
CEL:CelID              LIKE(CEL:CelID)                !Related join file key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
BRW7::View:Browse    VIEW(APlanning)
                       PROJECT(APla:KG)
                       PROJECT(APla:Pallets)
                       PROJECT(APla:MutatieGemaakt)
                       PROJECT(APla:Verwerkt)
                       PROJECT(APla:VerkoopID)
                       PROJECT(APla:ArtikelID)
                       PROJECT(APla:PlanningID)
                       PROJECT(APla:VerpakkingID)
                       PROJECT(APla:PartijID)
                       PROJECT(APla:CelID)
                       JOIN(AVE:PK_Verkoop,APla:VerkoopID)
                         PROJECT(AVE:VerkoopID)
                         PROJECT(AVE:Planning_DATE)
                         PROJECT(AVE:Planning_TIME)
                         PROJECT(AVE:Klant)
                         JOIN(AARel:Relatie_PK,AVE:Klant)
                           PROJECT(AARel:FirmaNaam)
                           PROJECT(AARel:RelatieID)
                         END
                       END
                       JOIN(AArt:Artikel_PK,APla:ArtikelID)
                         PROJECT(AArt:ArtikelID)
                       END
                       JOIN(AVP:Verpakking_PK,APla:VerpakkingID)
                         PROJECT(AVP:VerpakkingOmschrijving)
                         PROJECT(AVP:VerpakkingID)
                       END
                       JOIN(APar:Partij_PK,APla:PartijID)
                         PROJECT(APar:PartijID)
                         PROJECT(APar:ExternPartijnr)
                         PROJECT(APar:Leverancier)
                         JOIN(AREL:Relatie_PK,APar:Leverancier)
                           PROJECT(AREL:FirmaNaam)
                           PROJECT(AREL:RelatieID)
                         END
                       END
                       JOIN(AACel:CEL_PK,APla:CelID)
                         PROJECT(AACel:CelOms)
                       END
                     END
Queue:Browse:3       QUEUE                            !Queue declaration for browse/combo box using ?List:4
AVE:VerkoopID          LIKE(AVE:VerkoopID)            !List box control field - type derived from field
AVE:VerkoopID_NormalFG LONG                           !Normal forground color
AVE:VerkoopID_NormalBG LONG                           !Normal background color
AVE:VerkoopID_SelectedFG LONG                         !Selected forground color
AVE:VerkoopID_SelectedBG LONG                         !Selected background color
AARel:FirmaNaam        LIKE(AARel:FirmaNaam)          !List box control field - type derived from field
AARel:FirmaNaam_NormalFG LONG                         !Normal forground color
AARel:FirmaNaam_NormalBG LONG                         !Normal background color
AARel:FirmaNaam_SelectedFG LONG                       !Selected forground color
AARel:FirmaNaam_SelectedBG LONG                       !Selected background color
AVE:Planning_DATE      LIKE(AVE:Planning_DATE)        !List box control field - type derived from field
AVE:Planning_DATE_NormalFG LONG                       !Normal forground color
AVE:Planning_DATE_NormalBG LONG                       !Normal background color
AVE:Planning_DATE_SelectedFG LONG                     !Selected forground color
AVE:Planning_DATE_SelectedBG LONG                     !Selected background color
AVE:Planning_TIME      LIKE(AVE:Planning_TIME)        !List box control field - type derived from field
AVE:Planning_TIME_NormalFG LONG                       !Normal forground color
AVE:Planning_TIME_NormalBG LONG                       !Normal background color
AVE:Planning_TIME_SelectedFG LONG                     !Selected forground color
AVE:Planning_TIME_SelectedBG LONG                     !Selected background color
APar:PartijID          LIKE(APar:PartijID)            !List box control field - type derived from field
APar:PartijID_NormalFG LONG                           !Normal forground color
APar:PartijID_NormalBG LONG                           !Normal background color
APar:PartijID_SelectedFG LONG                         !Selected forground color
APar:PartijID_SelectedBG LONG                         !Selected background color
APar:ExternPartijnr    LIKE(APar:ExternPartijnr)      !List box control field - type derived from field
APar:ExternPartijnr_NormalFG LONG                     !Normal forground color
APar:ExternPartijnr_NormalBG LONG                     !Normal background color
APar:ExternPartijnr_SelectedFG LONG                   !Selected forground color
APar:ExternPartijnr_SelectedBG LONG                   !Selected background color
AREL:FirmaNaam         LIKE(AREL:FirmaNaam)           !List box control field - type derived from field
AREL:FirmaNaam_NormalFG LONG                          !Normal forground color
AREL:FirmaNaam_NormalBG LONG                          !Normal background color
AREL:FirmaNaam_SelectedFG LONG                        !Selected forground color
AREL:FirmaNaam_SelectedBG LONG                        !Selected background color
APla:KG                LIKE(APla:KG)                  !List box control field - type derived from field
APla:KG_NormalFG       LONG                           !Normal forground color
APla:KG_NormalBG       LONG                           !Normal background color
APla:KG_SelectedFG     LONG                           !Selected forground color
APla:KG_SelectedBG     LONG                           !Selected background color
APla:Pallets           LIKE(APla:Pallets)             !List box control field - type derived from field
APla:Pallets_NormalFG  LONG                           !Normal forground color
APla:Pallets_NormalBG  LONG                           !Normal background color
APla:Pallets_SelectedFG LONG                          !Selected forground color
APla:Pallets_SelectedBG LONG                          !Selected background color
AACel:CelOms           LIKE(AACel:CelOms)             !List box control field - type derived from field
AACel:CelOms_NormalFG  LONG                           !Normal forground color
AACel:CelOms_NormalBG  LONG                           !Normal background color
AACel:CelOms_SelectedFG LONG                          !Selected forground color
AACel:CelOms_SelectedBG LONG                          !Selected background color
AVP:VerpakkingOmschrijving LIKE(AVP:VerpakkingOmschrijving) !List box control field - type derived from field
AVP:VerpakkingOmschrijving_NormalFG LONG              !Normal forground color
AVP:VerpakkingOmschrijving_NormalBG LONG              !Normal background color
AVP:VerpakkingOmschrijving_SelectedFG LONG            !Selected forground color
AVP:VerpakkingOmschrijving_SelectedBG LONG            !Selected background color
APla:MutatieGemaakt    LIKE(APla:MutatieGemaakt)      !Browse hot field - type derived from field
APla:Verwerkt          LIKE(APla:Verwerkt)            !Browse hot field - type derived from field
APla:VerkoopID         LIKE(APla:VerkoopID)           !Browse hot field - type derived from field
APla:ArtikelID         LIKE(APla:ArtikelID)           !Browse hot field - type derived from field
APla:PlanningID        LIKE(APla:PlanningID)          !Primary key field - type derived from field
AARel:RelatieID        LIKE(AARel:RelatieID)          !Related join file key field - type derived from field
AArt:ArtikelID         LIKE(AArt:ArtikelID)           !Related join file key field - type derived from field
AVP:VerpakkingID       LIKE(AVP:VerpakkingID)         !Related join file key field - type derived from field
AREL:RelatieID         LIKE(AREL:RelatieID)           !Related join file key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
LocEnableEnterByTab  BYTE(1)                               !Used by the ENTER Instead of Tab template
EnterByTabManager    EnterByTabClass
History::VVP:Record  LIKE(VVP:RECORD),THREAD
NetLocalRefreshDate     Long     ! NetTalk (NetRefresh)
NetLocalRefreshTime     Long
NetLocalDependancies    String('|ViewVoorraadPlanning|Planning|Inkoop|Relatie|Verpakking|ViewArtikel|Cel|APlanning|AVerkoop|AViewArtikel|AARelatie|AVerpakking|APartij|ARelatie|AACel|')
QuickWindow          WINDOW('Form ViewVoorraad'),AT(,,556,389),FONT('MS Sans Serif',8,,,CHARSET:DEFAULT),RESIZE, |
  CENTER,GRAY,IMM,MDI,HLP('UpdateViewVoorraad'),SYSTEM
                       PROMPT('Artikel ID:'),AT(8,10),USE(?Voo:ArtikelID:Prompt),TRN
                       ENTRY(@s30),AT(92,10,126,10),USE(VVP:ArtikelID),COLOR(COLOR:White),DISABLE
                       PROMPT('Artikelomschrijving:'),AT(8,24),USE(?Voo:Artikelomschrijving:Prompt),TRN
                       ENTRY(@s60),AT(92,24,204,10),USE(VVP:ArtikelOms),COLOR(COLOR:White),DISABLE
                       PROMPT('KG:'),AT(8,37),USE(?Voo:kg:Prompt),TRN
                       ENTRY(@n-12`2),AT(92,37,74,10),USE(Loc:KG),RIGHT,COLOR(COLOR:White),DISABLE
                       PROMPT('Pallets:'),AT(8,53),USE(?Voo:pallets:Prompt),TRN
                       ENTRY(@n-14.),AT(92,53,74,10),USE(Loc:Pallets),RIGHT,COLOR(COLOR:White),DISABLE
                       LIST,AT(9,90,541,116),USE(?List:3),HVSCROLL,FORMAT('50R(2)|*~Inkoop ID~C(0)@n_10@100L(2' & |
  ')|*~Leverancier~C(0)@s50@50R(2)|*~Datum~C(0)@d6-@40R(2)|*~Tijd~C(0)@t7@52R(2)|*~KG~C' & |
  '(0)@n-13.`2@60R(2)|*~Pallets~C(0)@n-14.@50L(2)|*~Cel~C(0)@s50@200L(2)|*~Verpakking~C(0)@s50@'), |
  FROM(Queue:Browse:2),IMM
                       LIST,AT(9,233,541,129),USE(?List:4),HVSCROLL,FORMAT('50R(2)|*~Verkoop ID~C(0)@n_10@100L' & |
  '(2)|*~Afnemer~C(0)@s50@50R(2)|*~Datum~C(0)@d6-@40R(2)|*~Tijd~C(0)@t7@48R(2)|*~Partij' & |
  'nr.~C(0)@n_12@51R(2)|*~Extern Partijnr.~C(1)@n_12@88L(2)|*~Leverancier~C(0)@s50@52R(' & |
  '2)|*~KG~C(0)@n-14`2@60R(2)|*~Pallets~C(0)@n-14.@50R(2)|*~Cel~C(0)@s50@200L(2)|*~Verp' & |
  'akking~C(0)@s50@'),FROM(Queue:Browse:3),IMM
                       PROMPT('Geplande Inkopen'),AT(11,75),USE(?PROMPT1),FONT('Microsoft Sans Serif',,,FONT:bold)
                       BUTTON('&OK'),AT(434,369,49,14),USE(?OK),LEFT,ICON('WAOK.ICO'),DEFAULT,FLAT,MSG('Accept dat' & |
  'a and close the window'),TIP('Accept data and close the window')
                       BUTTON('&Annuleren'),AT(487,369,64,14),USE(?Cancel),LEFT,ICON('WACANCEL.ICO'),FLAT,MSG('Cancel operation'), |
  TIP('Cancel operation')
                       BUTTON('Inslagrapport'),AT(8,369,74),USE(?BUTTON2),LEFT,ICON(ICON:Print),FLAT
                       PROMPT('Geplande Verkopen'),AT(8,218),USE(?PROMPT1:2),FONT('Microsoft Sans Serif',,,FONT:bold)
                     END

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
                     END

Toolbar              ToolbarClass
Resizer              CLASS(WindowResizeClass)
Init                   PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)
                     END

BRW9                 CLASS(BrowseClass)                    ! Browse using ?List:3
Q                      &Queue:Browse:2                !Reference to browse queue
SetQueueRecord         PROCEDURE(),DERIVED
                     END

BRW9::Sort0:Locator  StepLocatorClass                      ! Default Locator
BRW7                 CLASS(BrowseClass)                    ! Browse using ?List:4
Q                      &Queue:Browse:3                !Reference to browse queue
SetQueueRecord         PROCEDURE(),DERIVED
                     END

BRW7::Sort0:Locator  StepLocatorClass                      ! Default Locator
CurCtrlFeq          LONG
FieldColorQueue     QUEUE
Feq                   LONG
OldColor              LONG
                    END

  CODE
? DEBUGHOOK(APlanning:Record)
? DEBUGHOOK(Planning:Record)
? DEBUGHOOK(ViewVoorraadPlanning:Record)
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
    ActionMessage = 'Bekijken geplande in-/verkopen'
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
        udpt.Init(UD,'UpdateViewVoorraad','VoorrVrd004.clw','VoorrVrd.DLL','07/01/2024 @ 05:44PM')    
             
  GlobalErrors.SetProcedureName('UpdateViewVoorraad')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Voo:ArtikelID:Prompt
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  IF SELF.Request <> ViewRecord THEN RETURN ReturnValue.
  BIND('Ink:InkoopID',Ink:InkoopID)                        ! Added by: BrowseBox(ABC)
  BIND('Pla:PlanningID',Pla:PlanningID)                    ! Added by: BrowseBox(ABC)
  BIND('AVE:VerkoopID',AVE:VerkoopID)                      ! Added by: BrowseBox(ABC)
  BIND('APla:PlanningID',APla:PlanningID)                  ! Added by: BrowseBox(ABC)
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.HistoryKey = CtrlH
  SELF.AddHistoryFile(VVP:Record,History::VVP:Record)
  SELF.AddHistoryField(?VVP:ArtikelID,1)
  SELF.AddHistoryField(?VVP:ArtikelOms,2)
  SELF.AddUpdateFile(Access:ViewVoorraadPlanning)
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  Relate:APlanning.Open                                    ! File APlanning used by this procedure, so make sure it's RelationManager is open
  Relate:Planning.SetOpenRelated()
  Relate:Planning.Open                                     ! File Planning used by this procedure, so make sure it's RelationManager is open
  Relate:ViewVoorraadPlanning.Open                         ! File ViewVoorraadPlanning used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Primary &= Relate:ViewVoorraadPlanning
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
  BRW9.Init(?List:3,Queue:Browse:2.ViewPosition,BRW9::View:Browse,Queue:Browse:2,Relate:Planning,SELF) ! Initialize the browse manager
  BRW7.Init(?List:4,Queue:Browse:3.ViewPosition,BRW7::View:Browse,Queue:Browse:3,Relate:APlanning,SELF) ! Initialize the browse manager
  Loc:KG = VVP:InslagKG - VVP:UitslagKG
  Loc:Pallets = VVP:InslagPallets - VVP:UitslagPallets
  SELF.Open(QuickWindow)                                   ! Open window
  Do DefineListboxStyle
  QuickWindow{Prop:Alrt,255} = CtrlShiftP
  IF SELF.Request = ViewRecord                             ! Configure controls for View Only mode
    ?VVP:ArtikelID{PROP:ReadOnly} = True
    ?VVP:ArtikelOms{PROP:ReadOnly} = True
    ?Loc:KG{PROP:ReadOnly} = True
    ?Loc:Pallets{PROP:ReadOnly} = True
    DISABLE(?BUTTON2)
  END
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  BRW9.Q &= Queue:Browse:2
  BRW9.FileLoaded = 1                                      ! This is a 'file loaded' browse
  BRW9.AddSortOrder(,Pla:Verwerkt_Artikel_Planning_K)      ! Add the sort order for Pla:Verwerkt_Artikel_Planning_K for sort order 1
  BRW9.AddLocator(BRW9::Sort0:Locator)                     ! Browse has a locator for sort order 1
  BRW9::Sort0:Locator.Init(,Pla:Verwerkt,,BRW9)            ! Initialize the browse locator using  using key: Pla:Verwerkt_Artikel_Planning_K , Pla:Verwerkt
  BRW9.SetFilter('(Pla:ArtikelID=VVP:ArtikelID AND Pla:MutatieGemaakt=0 AND Pla:Verwerkt=0 AND Pla:InkoopID > 0)') ! Apply filter expression to browse
  BRW9.AddField(Ink:InkoopID,BRW9.Q.Ink:InkoopID)          ! Field Ink:InkoopID is a hot field or requires assignment from browse
  BRW9.AddField(Rel:FirmaNaam,BRW9.Q.Rel:FirmaNaam)        ! Field Rel:FirmaNaam is a hot field or requires assignment from browse
  BRW9.AddField(Ink:Planning_DATE,BRW9.Q.Ink:Planning_DATE) ! Field Ink:Planning_DATE is a hot field or requires assignment from browse
  BRW9.AddField(Ink:Planning_TIME,BRW9.Q.Ink:Planning_TIME) ! Field Ink:Planning_TIME is a hot field or requires assignment from browse
  BRW9.AddField(Pla:KG,BRW9.Q.Pla:KG)                      ! Field Pla:KG is a hot field or requires assignment from browse
  BRW9.AddField(Pla:Pallets,BRW9.Q.Pla:Pallets)            ! Field Pla:Pallets is a hot field or requires assignment from browse
  BRW9.AddField(CEL:CelOms,BRW9.Q.CEL:CelOms)              ! Field CEL:CelOms is a hot field or requires assignment from browse
  BRW9.AddField(Ver:VerpakkingOmschrijving,BRW9.Q.Ver:VerpakkingOmschrijving) ! Field Ver:VerpakkingOmschrijving is a hot field or requires assignment from browse
  BRW9.AddField(Pla:MutatieGemaakt,BRW9.Q.Pla:MutatieGemaakt) ! Field Pla:MutatieGemaakt is a hot field or requires assignment from browse
  BRW9.AddField(Pla:InkoopID,BRW9.Q.Pla:InkoopID)          ! Field Pla:InkoopID is a hot field or requires assignment from browse
  BRW9.AddField(Pla:ArtikelID,BRW9.Q.Pla:ArtikelID)        ! Field Pla:ArtikelID is a hot field or requires assignment from browse
  BRW9.AddField(Pla:Verwerkt,BRW9.Q.Pla:Verwerkt)          ! Field Pla:Verwerkt is a hot field or requires assignment from browse
  BRW9.AddField(Pla:PlanningID,BRW9.Q.Pla:PlanningID)      ! Field Pla:PlanningID is a hot field or requires assignment from browse
  BRW9.AddField(Rel:RelatieID,BRW9.Q.Rel:RelatieID)        ! Field Rel:RelatieID is a hot field or requires assignment from browse
  BRW9.AddField(Ver:VerpakkingID,BRW9.Q.Ver:VerpakkingID)  ! Field Ver:VerpakkingID is a hot field or requires assignment from browse
  BRW9.AddField(Art:ArtikelID,BRW9.Q.Art:ArtikelID)        ! Field Art:ArtikelID is a hot field or requires assignment from browse
  BRW9.AddField(CEL:CelID,BRW9.Q.CEL:CelID)                ! Field CEL:CelID is a hot field or requires assignment from browse
  BRW7.Q &= Queue:Browse:3
  BRW7.FileLoaded = 1                                      ! This is a 'file loaded' browse
  BRW7.AddSortOrder(,APla:Verwerkt_Artikel_Planning_K)     ! Add the sort order for APla:Verwerkt_Artikel_Planning_K for sort order 1
  BRW7.AddLocator(BRW7::Sort0:Locator)                     ! Browse has a locator for sort order 1
  BRW7::Sort0:Locator.Init(,APla:Verwerkt,,BRW7)           ! Initialize the browse locator using  using key: APla:Verwerkt_Artikel_Planning_K , APla:Verwerkt
  BRW7.SetFilter('(APla:ArtikelID=VVP:ArtikelID AND APla:MutatieGemaakt=0 AND APla:Verwerkt=0 AND APla:VerkoopID > 0)') ! Apply filter expression to browse
  BRW7.AddField(AVE:VerkoopID,BRW7.Q.AVE:VerkoopID)        ! Field AVE:VerkoopID is a hot field or requires assignment from browse
  BRW7.AddField(AARel:FirmaNaam,BRW7.Q.AARel:FirmaNaam)    ! Field AARel:FirmaNaam is a hot field or requires assignment from browse
  BRW7.AddField(AVE:Planning_DATE,BRW7.Q.AVE:Planning_DATE) ! Field AVE:Planning_DATE is a hot field or requires assignment from browse
  BRW7.AddField(AVE:Planning_TIME,BRW7.Q.AVE:Planning_TIME) ! Field AVE:Planning_TIME is a hot field or requires assignment from browse
  BRW7.AddField(APar:PartijID,BRW7.Q.APar:PartijID)        ! Field APar:PartijID is a hot field or requires assignment from browse
  BRW7.AddField(APar:ExternPartijnr,BRW7.Q.APar:ExternPartijnr) ! Field APar:ExternPartijnr is a hot field or requires assignment from browse
  BRW7.AddField(AREL:FirmaNaam,BRW7.Q.AREL:FirmaNaam)      ! Field AREL:FirmaNaam is a hot field or requires assignment from browse
  BRW7.AddField(APla:KG,BRW7.Q.APla:KG)                    ! Field APla:KG is a hot field or requires assignment from browse
  BRW7.AddField(APla:Pallets,BRW7.Q.APla:Pallets)          ! Field APla:Pallets is a hot field or requires assignment from browse
  BRW7.AddField(AACel:CelOms,BRW7.Q.AACel:CelOms)          ! Field AACel:CelOms is a hot field or requires assignment from browse
  BRW7.AddField(AVP:VerpakkingOmschrijving,BRW7.Q.AVP:VerpakkingOmschrijving) ! Field AVP:VerpakkingOmschrijving is a hot field or requires assignment from browse
  BRW7.AddField(APla:MutatieGemaakt,BRW7.Q.APla:MutatieGemaakt) ! Field APla:MutatieGemaakt is a hot field or requires assignment from browse
  BRW7.AddField(APla:Verwerkt,BRW7.Q.APla:Verwerkt)        ! Field APla:Verwerkt is a hot field or requires assignment from browse
  BRW7.AddField(APla:VerkoopID,BRW7.Q.APla:VerkoopID)      ! Field APla:VerkoopID is a hot field or requires assignment from browse
  BRW7.AddField(APla:ArtikelID,BRW7.Q.APla:ArtikelID)      ! Field APla:ArtikelID is a hot field or requires assignment from browse
  BRW7.AddField(APla:PlanningID,BRW7.Q.APla:PlanningID)    ! Field APla:PlanningID is a hot field or requires assignment from browse
  BRW7.AddField(AARel:RelatieID,BRW7.Q.AARel:RelatieID)    ! Field AARel:RelatieID is a hot field or requires assignment from browse
  BRW7.AddField(AArt:ArtikelID,BRW7.Q.AArt:ArtikelID)      ! Field AArt:ArtikelID is a hot field or requires assignment from browse
  BRW7.AddField(AVP:VerpakkingID,BRW7.Q.AVP:VerpakkingID)  ! Field AVP:VerpakkingID is a hot field or requires assignment from browse
  BRW7.AddField(AREL:RelatieID,BRW7.Q.AREL:RelatieID)      ! Field AREL:RelatieID is a hot field or requires assignment from browse
  INIMgr.Fetch('UpdateViewVoorraad',QuickWindow)           ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  BRW9.AddToolbarTarget(Toolbar)                           ! Browse accepts toolbar control
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
    Relate:APlanning.Close
    Relate:Planning.Close
    Relate:ViewVoorraadPlanning.Close
  END
  IF SELF.Opened
    INIMgr.Update('UpdateViewVoorraad',QuickWindow)        ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
            
   
  RETURN ReturnValue


ThisWindow.PrimeUpdate PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.PrimeUpdate()
    If returnValue = Level:Fatal  ! delete just occured
      ThisNetRefresh.Send('|ViewVoorraadPlanning|Planning|APlanning|') ! NetTalk (NetRefresh)
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
    OF ?OK
      ThisWindow.Update()
      IF SELF.Request = ViewRecord AND NOT SELF.BatchProcessing THEN
         POST(EVENT:CloseWindow)
      END
    OF ?BUTTON2
      ThisWindow.Update()
      ReportInslag()
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
    ThisNetRefresh.Send('|ViewVoorraadPlanning|Planning|APlanning|') ! NetTalk (NetRefresh)
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
     IF KEYCODE()=CtrlShiftP AND EVENT() = Event:PreAlertKey
       CYCLE
     END
     IF KEYCODE()=CtrlShiftP  
        UD.ShowProcedureInfo('UpdateViewVoorraad',UD.SetApplicationName('VoorrVrd','DLL'),QuickWindow{PROP:Hlp},'10/07/2011 @ 08:55AM','07/01/2024 @ 05:44PM','10/11/2024 @ 01:55PM')  
    
       CYCLE
     END
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window
  SELF.SetStrategy(?List:3, Resize:FixLeft+Resize:FixTop, Resize:LockHeight) ! Override strategy for ?List:3
  SELF.SetStrategy(?List:4, Resize:FixLeft+Resize:FixTop, Resize:LockHeight) ! Override strategy for ?List:4


BRW9.SetQueueRecord PROCEDURE

  CODE
  PARENT.SetQueueRecord
  
  SELF.Q.Ink:InkoopID_NormalFG = -1                        ! Set color values for Ink:InkoopID
  SELF.Q.Ink:InkoopID_NormalBG = -1
  SELF.Q.Ink:InkoopID_SelectedFG = -1
  SELF.Q.Ink:InkoopID_SelectedBG = -1
  SELF.Q.Rel:FirmaNaam_NormalFG = -1                       ! Set color values for Rel:FirmaNaam
  SELF.Q.Rel:FirmaNaam_NormalBG = -1
  SELF.Q.Rel:FirmaNaam_SelectedFG = -1
  SELF.Q.Rel:FirmaNaam_SelectedBG = -1
  SELF.Q.Ink:Planning_DATE_NormalFG = -1                   ! Set color values for Ink:Planning_DATE
  SELF.Q.Ink:Planning_DATE_NormalBG = -1
  SELF.Q.Ink:Planning_DATE_SelectedFG = -1
  SELF.Q.Ink:Planning_DATE_SelectedBG = -1
  SELF.Q.Ink:Planning_TIME_NormalFG = -1                   ! Set color values for Ink:Planning_TIME
  SELF.Q.Ink:Planning_TIME_NormalBG = -1
  SELF.Q.Ink:Planning_TIME_SelectedFG = -1
  SELF.Q.Ink:Planning_TIME_SelectedBG = -1
  SELF.Q.Pla:KG_NormalFG = -1                              ! Set color values for Pla:KG
  SELF.Q.Pla:KG_NormalBG = -1
  SELF.Q.Pla:KG_SelectedFG = -1
  SELF.Q.Pla:KG_SelectedBG = -1
  SELF.Q.Pla:Pallets_NormalFG = -1                         ! Set color values for Pla:Pallets
  SELF.Q.Pla:Pallets_NormalBG = -1
  SELF.Q.Pla:Pallets_SelectedFG = -1
  SELF.Q.Pla:Pallets_SelectedBG = -1
  SELF.Q.CEL:CelOms_NormalFG = -1                          ! Set color values for CEL:CelOms
  SELF.Q.CEL:CelOms_NormalBG = -1
  SELF.Q.CEL:CelOms_SelectedFG = -1
  SELF.Q.CEL:CelOms_SelectedBG = -1
  SELF.Q.Ver:VerpakkingOmschrijving_NormalFG = -1          ! Set color values for Ver:VerpakkingOmschrijving
  SELF.Q.Ver:VerpakkingOmschrijving_NormalBG = -1
  SELF.Q.Ver:VerpakkingOmschrijving_SelectedFG = -1
  SELF.Q.Ver:VerpakkingOmschrijving_SelectedBG = -1


BRW7.SetQueueRecord PROCEDURE

  CODE
  PARENT.SetQueueRecord
  
  SELF.Q.AVE:VerkoopID_NormalFG = -1                       ! Set color values for AVE:VerkoopID
  SELF.Q.AVE:VerkoopID_NormalBG = -1
  SELF.Q.AVE:VerkoopID_SelectedFG = -1
  SELF.Q.AVE:VerkoopID_SelectedBG = -1
  SELF.Q.AARel:FirmaNaam_NormalFG = -1                     ! Set color values for AARel:FirmaNaam
  SELF.Q.AARel:FirmaNaam_NormalBG = -1
  SELF.Q.AARel:FirmaNaam_SelectedFG = -1
  SELF.Q.AARel:FirmaNaam_SelectedBG = -1
  SELF.Q.AVE:Planning_DATE_NormalFG = -1                   ! Set color values for AVE:Planning_DATE
  SELF.Q.AVE:Planning_DATE_NormalBG = -1
  SELF.Q.AVE:Planning_DATE_SelectedFG = -1
  SELF.Q.AVE:Planning_DATE_SelectedBG = -1
  SELF.Q.AVE:Planning_TIME_NormalFG = -1                   ! Set color values for AVE:Planning_TIME
  SELF.Q.AVE:Planning_TIME_NormalBG = -1
  SELF.Q.AVE:Planning_TIME_SelectedFG = -1
  SELF.Q.AVE:Planning_TIME_SelectedBG = -1
  SELF.Q.APar:PartijID_NormalFG = -1                       ! Set color values for APar:PartijID
  SELF.Q.APar:PartijID_NormalBG = -1
  SELF.Q.APar:PartijID_SelectedFG = -1
  SELF.Q.APar:PartijID_SelectedBG = -1
  SELF.Q.APar:ExternPartijnr_NormalFG = -1                 ! Set color values for APar:ExternPartijnr
  SELF.Q.APar:ExternPartijnr_NormalBG = -1
  SELF.Q.APar:ExternPartijnr_SelectedFG = -1
  SELF.Q.APar:ExternPartijnr_SelectedBG = -1
  SELF.Q.AREL:FirmaNaam_NormalFG = -1                      ! Set color values for AREL:FirmaNaam
  SELF.Q.AREL:FirmaNaam_NormalBG = -1
  SELF.Q.AREL:FirmaNaam_SelectedFG = -1
  SELF.Q.AREL:FirmaNaam_SelectedBG = -1
  SELF.Q.APla:KG_NormalFG = -1                             ! Set color values for APla:KG
  SELF.Q.APla:KG_NormalBG = -1
  SELF.Q.APla:KG_SelectedFG = -1
  SELF.Q.APla:KG_SelectedBG = -1
  SELF.Q.APla:Pallets_NormalFG = -1                        ! Set color values for APla:Pallets
  SELF.Q.APla:Pallets_NormalBG = -1
  SELF.Q.APla:Pallets_SelectedFG = -1
  SELF.Q.APla:Pallets_SelectedBG = -1
  SELF.Q.AACel:CelOms_NormalFG = -1                        ! Set color values for AACel:CelOms
  SELF.Q.AACel:CelOms_NormalBG = -1
  SELF.Q.AACel:CelOms_SelectedFG = -1
  SELF.Q.AACel:CelOms_SelectedBG = -1
  SELF.Q.AVP:VerpakkingOmschrijving_NormalFG = -1          ! Set color values for AVP:VerpakkingOmschrijving
  SELF.Q.AVP:VerpakkingOmschrijving_NormalBG = -1
  SELF.Q.AVP:VerpakkingOmschrijving_SelectedFG = -1
  SELF.Q.AVP:VerpakkingOmschrijving_SelectedBG = -1

