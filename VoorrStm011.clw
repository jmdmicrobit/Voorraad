

   MEMBER('VoorrStm.clw')                                  ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABPOPUP.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('VOORRSTM011.INC'),ONCE        !Local module procedure declarations
                     END


!!! <summary>
!!! Generated from procedure template - Window
!!! Form Relatie
!!! </summary>
ViewRelatie PROCEDURE 

CurrentTab           STRING(80)                            ! 
ActionMessage        CSTRING(40)                           ! 
BRW8::View:Browse    VIEW(RelatieAdres)
                       PROJECT(RAD:Adres1)
                       PROJECT(RAD:Adres2)
                       PROJECT(RAD:Postcode)
                       PROJECT(RAD:Plaats)
                       PROJECT(RAD:Land)
                       PROJECT(RAD:Telefoon)
                       PROJECT(RAD:Mobiel)
                       PROJECT(RAD:Fax)
                       PROJECT(RAD:ID)
                       PROJECT(RAD:RelatieID)
                     END
Queue:Browse         QUEUE                            !Queue declaration for browse/combo box using ?List
RAD:Adres1             LIKE(RAD:Adres1)               !List box control field - type derived from field
RAD:Adres2             LIKE(RAD:Adres2)               !List box control field - type derived from field
RAD:Postcode           LIKE(RAD:Postcode)             !List box control field - type derived from field
RAD:Plaats             LIKE(RAD:Plaats)               !List box control field - type derived from field
RAD:Land               LIKE(RAD:Land)                 !List box control field - type derived from field
RAD:Telefoon           LIKE(RAD:Telefoon)             !List box control field - type derived from field
RAD:Mobiel             LIKE(RAD:Mobiel)               !List box control field - type derived from field
RAD:Fax                LIKE(RAD:Fax)                  !List box control field - type derived from field
RAD:ID                 LIKE(RAD:ID)                   !Primary key field - type derived from field
RAD:RelatieID          LIKE(RAD:RelatieID)            !Browse key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
BRW10::View:Browse   VIEW(RelatieArtikelOmschrijving)
                       PROJECT(RAO:ArtikelOmschrijving)
                       PROJECT(RAO:RelatieArtikelID)
                       PROJECT(RAO:GTIN)
                       PROJECT(RAO:RelatieArtikelOmschrijvingID)
                       PROJECT(RAO:RelatieID)
                       PROJECT(RAO:ArtikelID)
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?List:2
RAO:ArtikelOmschrijving LIKE(RAO:ArtikelOmschrijving) !List box control field - type derived from field
RAO:RelatieArtikelID   LIKE(RAO:RelatieArtikelID)     !List box control field - type derived from field
RAO:GTIN               LIKE(RAO:GTIN)                 !List box control field - type derived from field
RAO:RelatieArtikelOmschrijvingID LIKE(RAO:RelatieArtikelOmschrijvingID) !Primary key field - type derived from field
RAO:RelatieID          LIKE(RAO:RelatieID)            !Browse key field - type derived from field
RAO:ArtikelID          LIKE(RAO:ArtikelID)            !Browse key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
LocEnableEnterByTab  BYTE(1)                               !Used by the ENTER Instead of Tab template
EnterByTabManager    EnterByTabClass
History::Rel:Record  LIKE(Rel:RECORD),THREAD
QuickWindow          WINDOW('Overzicht Klantadressen / Artikelnamen'),AT(,,501,343),FONT('MS Sans Serif',8,,FONT:regular, |
  CHARSET:DEFAULT),RESIZE,CENTER,GRAY,IMM,MDI,HLP('ViewRelatie'),SYSTEM
                       SHEET,AT(4,4,493,153),USE(?CurrentTab)
                         TAB('Klantgegevens'),USE(?Tab:1)
                           PROMPT('Firma Naam:'),AT(11,25),USE(?Rel:FirmaNaam:Prompt),CENTER,TRN
                           ENTRY(@s50),AT(64,25,204,10),USE(Rel:FirmaNaam),DECIMAL,DISABLE
                           PROMPT('Adres 1:'),AT(11,39),USE(?Rel:Adres1:Prompt),TRN
                           ENTRY(@s100),AT(64,39,289,10),USE(Rel:Adres1),DISABLE
                           PROMPT('Adres 2:'),AT(11,54),USE(?Rel:Adres2:Prompt),TRN
                           ENTRY(@s100),AT(64,54,289,10),USE(Rel:Adres2),DISABLE
                           PROMPT('Postcode:'),AT(11,68),USE(?Rel:Postcode:Prompt),TRN
                           ENTRY(@s20),AT(64,68,130,10),USE(Rel:Postcode),DISABLE
                           PROMPT('Plaats:'),AT(11,81),USE(?Rel:Plaats:Prompt),TRN
                           ENTRY(@s100),AT(64,81,289,10),USE(Rel:Plaats),DISABLE
                           PROMPT('Telefoon:'),AT(11,95),USE(?Rel:Telefoon:Prompt),CENTER,TRN
                           ENTRY(@s25),AT(64,95,130,10),USE(Rel:Telefoon),LEFT,DISABLE
                           PROMPT('Mobiel:'),AT(11,110),USE(?Rel:Mobiel:Prompt),TRN
                           ENTRY(@s30),AT(64,110,130,10),USE(Rel:Mobiel),DISABLE
                           PROMPT('Fax:'),AT(11,123),USE(?Rel:Fax:Prompt),CENTER,TRN
                           ENTRY(@s25),AT(64,123,130,10),USE(Rel:Fax),LEFT,DISABLE
                           PROMPT('Type:'),AT(11,137),USE(?Rel:Type:Prompt),CENTER,TRN
                           ENTRY(@s1),AT(64,138,24,10),USE(Rel:Type),LEFT,DISABLE
                           PROMPT('Extra artikel-omschrijving:'),AT(298,137),USE(?Rel:ex_artcode:Prompt)
                           ENTRY(@s2),AT(382,138,17,10),USE(Rel:ItemCode),DISABLE
                           STRING(@S20),AT(405,137),USE(Art3:Omschrijving)
                         END
                       END
                       SHEET,AT(3,162,495,157),USE(?SHEET1)
                         TAB('Adressen'),USE(?AdresTab)
                           LIST,AT(9,182,482,109),USE(?List),HVSCROLL,FORMAT('100L(2)|M~Naam~C(0)@s100@100L(2)|M~A' & |
  'dres~C(0)@s100@47L(2)|M~Postcode~C(0)@s10@100L(2)|M~Plaats~C(0)@s100@100L(2)|M~Land~' & |
  'C(0)@s100@80L(2)|M~Telefoon~C(0)@s20@80L(2)|M~Mobiel~C(0)@s20@80L(2)|M~Fax~C(0)@s20@'), |
  FROM(Queue:Browse),IMM
                           BUTTON('&Toevoegen'),AT(336,297,49,14),USE(?Insert)
                           BUTTON('&Wijzigen'),AT(389,297,49,14),USE(?Change)
                           BUTTON('&Verwijderen'),AT(443,297,49,14),USE(?Delete)
                         END
                         TAB('Afwijkende Artikel-omschrijvingen (CMR/Palletblad)'),USE(?ArtikelTab)
                           LIST,AT(7,182,484,114),USE(?List:2),FORMAT('300L(2)|M~Omschrijving~@s100@98L(2)|M~Exter' & |
  'n Artikelnummer~@s30@80L(2)|M~GTIN~L(0)@s20@'),FROM(Queue:Browse:1),IMM
                           BUTTON('&Toevoegen'),AT(325,300,51,14),USE(?Insert:2)
                           BUTTON('&Wijzigen'),AT(381,300,49,14),USE(?Change:2)
                           BUTTON('&Verwijderen'),AT(435,300,57,14),USE(?Delete:2)
                         END
                       END
                       BUTTON('&OK'),AT(448,322,49,14),USE(?OK),LEFT,ICON('WAOK.ICO'),DEFAULT,FLAT,MSG('Accept dat' & |
  'a and close the window'),TIP('Accept data and close the window')
                     END

ThisWindow           CLASS(WindowManager)
Ask                    PROCEDURE(),DERIVED
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
Reset                  PROCEDURE(BYTE Force=0),DERIVED
Run                    PROCEDURE(),BYTE,PROC,DERIVED
Run                    PROCEDURE(USHORT Number,BYTE Request),BYTE,PROC,DERIVED
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED
TakeCompleted          PROCEDURE(),BYTE,PROC,DERIVED
TakeEvent              PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
ToolbarForm          ToolbarUpdateClass                    ! Form Toolbar Manager
BRW8                 CLASS(BrowseClass)                    ! Browse using ?List
Q                      &Queue:Browse                  !Reference to browse queue
Init                   PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)
                     END

BRW8::Sort0:Locator  StepLocatorClass                      ! Default Locator
BRW10                CLASS(BrowseClass)                    ! Browse using ?List:2
Q                      &Queue:Browse:1                !Reference to browse queue
Init                   PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)
                     END

BRW10::Sort0:Locator StepLocatorClass                      ! Default Locator
Resizer              CLASS(WindowResizeClass)
Init                   PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)
                     END

CurCtrlFeq          LONG
FieldColorQueue     QUEUE
Feq                   LONG
OldColor              LONG
                    END

  CODE
? DEBUGHOOK(Relatie:Record)
? DEBUGHOOK(RelatieAdres:Record)
? DEBUGHOOK(RelatieArtikelOmschrijving:Record)
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
    ActionMessage = 'Record Will Be Added'
  OF ChangeRecord
    ActionMessage = 'Record Will Be Changed'
  END
  QuickWindow{PROP:Text} = ActionMessage                   ! Display status message in title bar
  PARENT.Ask


ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('ViewRelatie')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Rel:FirmaNaam:Prompt
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
  SELF.HistoryKey = CtrlH
  SELF.AddHistoryFile(Rel:Record,History::Rel:Record)
  SELF.AddHistoryField(?Rel:FirmaNaam,2)
  SELF.AddHistoryField(?Rel:Adres1,3)
  SELF.AddHistoryField(?Rel:Adres2,4)
  SELF.AddHistoryField(?Rel:Postcode,5)
  SELF.AddHistoryField(?Rel:Plaats,6)
  SELF.AddHistoryField(?Rel:Telefoon,7)
  SELF.AddHistoryField(?Rel:Mobiel,8)
  SELF.AddHistoryField(?Rel:Fax,9)
  SELF.AddHistoryField(?Rel:Type,10)
  SELF.AddHistoryField(?Rel:ItemCode,12)
  SELF.AddUpdateFile(Access:Relatie)
  Relate:Relatie.SetOpenRelated()
  Relate:Relatie.Open                                      ! File Relatie used by this procedure, so make sure it's RelationManager is open
  Relate:RelatieAdres.Open                                 ! File RelatieAdres used by this procedure, so make sure it's RelationManager is open
  Relate:RelatieArtikelOmschrijving.Open                   ! File RelatieArtikelOmschrijving used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Primary &= Relate:Relatie
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
  BRW8.Init(?List,Queue:Browse.ViewPosition,BRW8::View:Browse,Queue:Browse,Relate:RelatieAdres,SELF) ! Initialize the browse manager
  BRW10.Init(?List:2,Queue:Browse:1.ViewPosition,BRW10::View:Browse,Queue:Browse:1,Relate:RelatieArtikelOmschrijving,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  Do DefineListboxStyle
  IF SELF.Request = ViewRecord                             ! Configure controls for View Only mode
    ?Rel:FirmaNaam{PROP:ReadOnly} = True
    ?Rel:Adres1{PROP:ReadOnly} = True
    ?Rel:Adres2{PROP:ReadOnly} = True
    ?Rel:Postcode{PROP:ReadOnly} = True
    ?Rel:Plaats{PROP:ReadOnly} = True
    ?Rel:Telefoon{PROP:ReadOnly} = True
    ?Rel:Mobiel{PROP:ReadOnly} = True
    ?Rel:Fax{PROP:ReadOnly} = True
    ?Rel:Type{PROP:ReadOnly} = True
    ?Rel:ItemCode{PROP:ReadOnly} = True
    DISABLE(?Insert)
    DISABLE(?Change)
    DISABLE(?Delete)
    DISABLE(?Insert:2)
    DISABLE(?Change:2)
    DISABLE(?Delete:2)
  END
  BRW8.Q &= Queue:Browse
  BRW8.ActiveInvisible = 1
  BRW8.RetainRow = 0
  BRW8.AddSortOrder(,RAD:RelatieID_ID_K)                   ! Add the sort order for RAD:RelatieID_ID_K for sort order 1
  BRW8.AddRange(RAD:RelatieID,Rel:RelatieID)               ! Add single value range limit for sort order 1
  BRW8.AddLocator(BRW8::Sort0:Locator)                     ! Browse has a locator for sort order 1
  BRW8::Sort0:Locator.Init(,RAD:ID,1,BRW8)                 ! Initialize the browse locator using  using key: RAD:RelatieID_ID_K , RAD:ID
  BRW8.AddField(RAD:Adres1,BRW8.Q.RAD:Adres1)              ! Field RAD:Adres1 is a hot field or requires assignment from browse
  BRW8.AddField(RAD:Adres2,BRW8.Q.RAD:Adres2)              ! Field RAD:Adres2 is a hot field or requires assignment from browse
  BRW8.AddField(RAD:Postcode,BRW8.Q.RAD:Postcode)          ! Field RAD:Postcode is a hot field or requires assignment from browse
  BRW8.AddField(RAD:Plaats,BRW8.Q.RAD:Plaats)              ! Field RAD:Plaats is a hot field or requires assignment from browse
  BRW8.AddField(RAD:Land,BRW8.Q.RAD:Land)                  ! Field RAD:Land is a hot field or requires assignment from browse
  BRW8.AddField(RAD:Telefoon,BRW8.Q.RAD:Telefoon)          ! Field RAD:Telefoon is a hot field or requires assignment from browse
  BRW8.AddField(RAD:Mobiel,BRW8.Q.RAD:Mobiel)              ! Field RAD:Mobiel is a hot field or requires assignment from browse
  BRW8.AddField(RAD:Fax,BRW8.Q.RAD:Fax)                    ! Field RAD:Fax is a hot field or requires assignment from browse
  BRW8.AddField(RAD:ID,BRW8.Q.RAD:ID)                      ! Field RAD:ID is a hot field or requires assignment from browse
  BRW8.AddField(RAD:RelatieID,BRW8.Q.RAD:RelatieID)        ! Field RAD:RelatieID is a hot field or requires assignment from browse
  BRW10.Q &= Queue:Browse:1
  BRW10.ActiveInvisible = 1
  BRW10.RetainRow = 0
  BRW10.AddSortOrder(,RAO:FK1_RelatieArtikelOmschrijving)  ! Add the sort order for RAO:FK1_RelatieArtikelOmschrijving for sort order 1
  BRW10.AddRange(RAO:RelatieID,Rel:RelatieID)              ! Add single value range limit for sort order 1
  BRW10.AddLocator(BRW10::Sort0:Locator)                   ! Browse has a locator for sort order 1
  BRW10::Sort0:Locator.Init(,RAO:ArtikelID,1,BRW10)        ! Initialize the browse locator using  using key: RAO:FK1_RelatieArtikelOmschrijving , RAO:ArtikelID
  BRW10.AddField(RAO:ArtikelOmschrijving,BRW10.Q.RAO:ArtikelOmschrijving) ! Field RAO:ArtikelOmschrijving is a hot field or requires assignment from browse
  BRW10.AddField(RAO:RelatieArtikelID,BRW10.Q.RAO:RelatieArtikelID) ! Field RAO:RelatieArtikelID is a hot field or requires assignment from browse
  BRW10.AddField(RAO:GTIN,BRW10.Q.RAO:GTIN)                ! Field RAO:GTIN is a hot field or requires assignment from browse
  BRW10.AddField(RAO:RelatieArtikelOmschrijvingID,BRW10.Q.RAO:RelatieArtikelOmschrijvingID) ! Field RAO:RelatieArtikelOmschrijvingID is a hot field or requires assignment from browse
  BRW10.AddField(RAO:RelatieID,BRW10.Q.RAO:RelatieID)      ! Field RAO:RelatieID is a hot field or requires assignment from browse
  BRW10.AddField(RAO:ArtikelID,BRW10.Q.RAO:ArtikelID)      ! Field RAO:ArtikelID is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('ViewRelatie',QuickWindow)                  ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  BRW8.AskProcedure = 1                                    ! Will call: UpdateRelatieAdres
  BRW10.AskProcedure = 2                                   ! Will call: UpdateRelatieArtikelOmschrijving
  SELF.AddItem(ToolbarForm)
  BRW8.AddToolbarTarget(Toolbar)                           ! Browse accepts toolbar control
  BRW10.AddToolbarTarget(Toolbar)                          ! Browse accepts toolbar control
  SELF.SetAlerts()
  EnterByTabManager.ExcludeControl(?OK)
  EnterByTabManager.Init(False)
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:Relatie.Close
    Relate:RelatieAdres.Close
    Relate:RelatieArtikelOmschrijving.Close
  END
  IF SELF.Opened
    INIMgr.Update('ViewRelatie',QuickWindow)               ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.Reset PROCEDURE(BYTE Force=0)

  CODE
  SELF.ForcedReset += Force
  IF QuickWindow{Prop:AcceptAll} THEN RETURN.
  Art3:ID = Rel:ItemCode                                   ! Assign linking field value
  Access:ArtikelOmschrijvingExtraGroep.Fetch(Art3:PK_ArtikelOmschrijvingExtraGroep)
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
    EXECUTE Number
      UpdateRelatieAdres
      UpdateRelatieArtikelOmschrijving
    END
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
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
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
  RETURN Level:Fatal
  ReturnValue = PARENT.TakeCompleted()
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
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue


BRW8.Init PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)

  CODE
  PARENT.Init(ListBox,Posit,V,Q,RM,WM)
  IF WM.Request <> ViewRecord                              ! If called for anything other than ViewMode, make the insert, change & delete controls available
    SELF.InsertControl=?Insert
    SELF.ChangeControl=?Change
    SELF.DeleteControl=?Delete
  END


BRW10.Init PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)

  CODE
  PARENT.Init(ListBox,Posit,V,Q,RM,WM)
  IF WM.Request <> ViewRecord                              ! If called for anything other than ViewMode, make the insert, change & delete controls available
    SELF.InsertControl=?Insert:2
    SELF.ChangeControl=?Change:2
    SELF.DeleteControl=?Delete:2
  END


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window

