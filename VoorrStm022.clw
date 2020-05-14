

   MEMBER('VoorrStm.clw')                                  ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABPOPUP.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('VOORRSTM022.INC'),ONCE        !Local module procedure declarations
                     END


!!! <summary>
!!! Generated from procedure template - Window
!!! Form PalletBladSjabloon
!!! </summary>
UpdatePalletBladSjabloon PROCEDURE 

CurrentTab           STRING(80)                            ! 
ActionMessage        CSTRING(40)                           ! 
BRW4::View:Browse    VIEW(PalletBladSjabloonCountry)
                       PROJECT(PBSC:Country)
                       PROJECT(PBSC:PalletBladSjabloonCountryID)
                       PROJECT(PBSC:PalletBladSjabloonID)
                     END
Queue:Browse         QUEUE                            !Queue declaration for browse/combo box using ?List
PBSC:Country           LIKE(PBSC:Country)             !List box control field - type derived from field
PBSC:PalletBladSjabloonCountryID LIKE(PBSC:PalletBladSjabloonCountryID) !Primary key field - type derived from field
PBSC:PalletBladSjabloonID LIKE(PBSC:PalletBladSjabloonID) !Browse key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
LocEnableEnterByTab  BYTE(1)                               !Used by the ENTER Instead of Tab template
EnterByTabManager    EnterByTabClass
History::PBS:Record  LIKE(PBS:RECORD),THREAD
NetLocalRefreshDate     Long     ! NetTalk (NetRefresh)
NetLocalRefreshTime     Long
NetLocalDependancies    String('|PalletBladSjabloon|PalletBladSjabloonCountry|')
QuickWindow          WINDOW('Form PalletBladSjabloon'),AT(,,449,413),FONT('Microsoft Sans Serif',8,,FONT:regular, |
  CHARSET:DEFAULT),DOUBLE,CENTER,GRAY,IMM,MDI,HLP('UpdatePalletBladSjabloon'),SYSTEM
                       PROMPT('ID:'),AT(359,2),USE(?PBS:PalletBladSjabloonID:Prompt),TRN
                       ENTRY(@n_10),AT(375,3,53,10),USE(PBS:PalletBladSjabloonID),RIGHT(1),DISABLE
                       PROMPT('Taal:'),AT(8,4),USE(?PROMPT1),TRN
                       ENTRY(@s50),AT(33,5,198,10),USE(PBS:PalletBladSjabloonNaam)
                       BUTTON('&Annuleren'),AT(385,391,60,14),USE(?Cancel),LEFT,ICON('WACANCEL.ICO'),FLAT,MSG('Cancel operation'), |
  TIP('Cancel operation')
                       BUTTON('&OK'),AT(333,391,49,14),USE(?OK),LEFT,ICON('WAOK.ICO'),DEFAULT,FLAT,MSG('Accept dat' & |
  'a and close the window'),TIP('Accept data and close the window')
                       GROUP('Palletblad'),AT(2,123,443,257),USE(?GROUP1),BOXED
                         PROMPT('Leverancier:'),AT(9,139),USE(?PBS:Leverancier:Prompt),TRN
                         ENTRY(@s100),AT(9,154,125,10),USE(PBS:Leverancier)
                         PROMPT('Klant:'),AT(307,139,29),USE(?PBS:Klant:Prompt),TRN
                         ENTRY(@s100),AT(308,154,125,10),USE(PBS:Klant)
                         PROMPT('SSCC NVE (00):'),AT(9,173),USE(?PBS:SSCC_NVE_00:Prompt),TRN
                         ENTRY(@s100),AT(9,188,210,10),USE(PBS:SSCC_NVE_00)
                         PROMPT('Due Date (12):'),AT(225,173),USE(?PBS:DueDate_12:Prompt),TRN
                         ENTRY(@s100),AT(227,188,100,10),USE(PBS:DueDate_12)
                         PROMPT('Harvast Date 7007:'),AT(333,173),USE(?PBS:HarvastDate7007:Prompt)
                         ENTRY(@s100),AT(333,187,100,10),USE(PBS:HarvastDate7007)
                         PROMPT('Customer Purchase Order Number (400):'),AT(9,203),USE(?PBS:CustomerPurchaseOrderNumber_400:Prompt), |
  TRN
                         ENTRY(@s100),AT(9,218,210,10),USE(PBS:CustomerPurchaseOrderNumber_400)
                         PROMPT('Production Date (11):'),AT(225,202),USE(?PBS:ProductionDate_11:Prompt),TRN
                         ENTRY(@s100),AT(227,217,207,10),USE(PBS:ProductionDate_11)
                         PROMPT('Customer Part Description:'),AT(9,231),USE(?PBS:ArtikelOms:Prompt),TRN
                         ENTRY(@s100),AT(9,246,210,10),USE(PBS:ArtikelOms)
                         PROMPT('Customer Part Number (24):'),AT(225,230),USE(?PBS:CustomerPartNumber_24:Prompt),TRN
                         ENTRY(@s100),AT(227,246,207,10),USE(PBS:CustomerPartNumber_241)
                         PROMPT('Na Ontdooien:'),AT(9,261),USE(?PBS:NaOntdooien:Prompt)
                         ENTRY(@s50),AT(11,275,209,10),USE(PBS:NaOntdooien)
                         PROMPT('Transport En Opslag:'),AT(225,261),USE(?PBS:TransportEnOpslag:Prompt)
                         ENTRY(@s50),AT(227,275,207,10),USE(PBS:TransportEnOpslag)
                         PROMPT('Batch Number (10):'),AT(9,292),USE(?PBS:BatchNumber_10:Prompt),TRN
                         ENTRY(@s100),AT(9,306,100,10),USE(PBS:BatchNumber_10)
                         PROMPT('Sell By Date (15):'),AT(119,290),USE(?PBS:SellByDate_15:Prompt),TRN
                         ENTRY(@s100),AT(120,306,100,10),USE(PBS:SellByDate_15)
                         PROMPT('Number Of Units Contained (37):'),AT(225,290),USE(?PBS:NumberOfUnitsContained_37:Prompt), |
  TRN
                         ENTRY(@s100),AT(227,306,100,10),USE(PBS:NumberOfUnitsContained_37)
                         PROMPT('Product Net Weight (310):'),AT(333,290),USE(?PBS:ProductNetWeight_310:Prompt),TRN
                         ENTRY(@s100),AT(333,306,100,10),USE(PBS:ProductNetWeight_310)
                         PROMPT('Origin Live Bird:'),AT(9,325),USE(?PBS:OriginLiveBird:Prompt)
                         ENTRY(@s50),AT(10,339,100,10),USE(PBS:OriginLiveBird)
                         PROMPT('Origin Slauther House:'),AT(119,325),USE(?PBS:OriginSlautherHouse:Prompt)
                         ENTRY(@s50),AT(119,339,100,10),USE(PBS:OriginSlautherHouse)
                         PROMPT('Origin Processing:'),AT(225,325),USE(?PBS:OriginProcessing:Prompt)
                         ENTRY(@s50),AT(226,339,100,10),USE(PBS:OriginProcessing)
                         PROMPT('Origin Packing:'),AT(333,325),USE(?PBS:OriginPacking:Prompt)
                         ENTRY(@s50),AT(334,339,100,10),USE(PBS:OriginPacking)
                       END
                       GROUP('Landen'),AT(30,18,203,100),USE(?GROUP2),BOXED
                         LIST,AT(35,31,189,60),USE(?List),FORMAT('240L(2)|M@s60@'),FROM(Queue:Browse),IMM
                         BUTTON('&Toevoegen'),AT(34,96,69,18),USE(?Insert),LEFT,ICON('WAINSERT.ICO'),FLAT
                         BUTTON('&Wijzigen'),AT(105,96,55,18),USE(?Change),LEFT,ICON('WACHANGE.ICO'),FLAT
                         BUTTON('&Verwijderen'),AT(161,96,64,18),USE(?Delete),LEFT,ICON('WADELETE.ICO'),FLAT
                       END
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
Resizer              CLASS(WindowResizeClass)
Init                   PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)
                     END

BRW4                 CLASS(BrowseClass)                    ! Browse using ?List
Q                      &Queue:Browse                  !Reference to browse queue
Init                   PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)
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
    ActionMessage = 'Record Will Be Added'
  OF ChangeRecord
    ActionMessage = 'Record Will Be Changed'
  END
  QuickWindow{PROP:Text} = ActionMessage                   ! Display status message in title bar
  PARENT.Ask


ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('UpdatePalletBladSjabloon')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?PBS:PalletBladSjabloonID:Prompt
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
  SELF.HistoryKey = CtrlH
  SELF.AddHistoryFile(PBS:Record,History::PBS:Record)
  SELF.AddHistoryField(?PBS:PalletBladSjabloonID,1)
  SELF.AddHistoryField(?PBS:PalletBladSjabloonNaam,2)
  SELF.AddHistoryField(?PBS:Leverancier,3)
  SELF.AddHistoryField(?PBS:Klant,4)
  SELF.AddHistoryField(?PBS:SSCC_NVE_00,5)
  SELF.AddHistoryField(?PBS:DueDate_12,6)
  SELF.AddHistoryField(?PBS:HarvastDate7007,21)
  SELF.AddHistoryField(?PBS:CustomerPurchaseOrderNumber_400,7)
  SELF.AddHistoryField(?PBS:ProductionDate_11,8)
  SELF.AddHistoryField(?PBS:ArtikelOms,9)
  SELF.AddHistoryField(?PBS:CustomerPartNumber_241,10)
  SELF.AddHistoryField(?PBS:NaOntdooien,19)
  SELF.AddHistoryField(?PBS:TransportEnOpslag,20)
  SELF.AddHistoryField(?PBS:BatchNumber_10,11)
  SELF.AddHistoryField(?PBS:SellByDate_15,12)
  SELF.AddHistoryField(?PBS:NumberOfUnitsContained_37,13)
  SELF.AddHistoryField(?PBS:ProductNetWeight_310,14)
  SELF.AddHistoryField(?PBS:OriginLiveBird,15)
  SELF.AddHistoryField(?PBS:OriginSlautherHouse,16)
  SELF.AddHistoryField(?PBS:OriginProcessing,17)
  SELF.AddHistoryField(?PBS:OriginPacking,18)
  SELF.AddUpdateFile(Access:PalletBladSjabloon)
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  Relate:PalletBladSjabloon.Open                           ! File PalletBladSjabloon used by this procedure, so make sure it's RelationManager is open
  Relate:PalletBladSjabloonCountry.Open                    ! File PalletBladSjabloonCountry used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Primary &= Relate:PalletBladSjabloon
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
  BRW4.Init(?List,Queue:Browse.ViewPosition,BRW4::View:Browse,Queue:Browse,Relate:PalletBladSjabloonCountry,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  WinAlertMouseZoom()
  Do DefineListboxStyle
  IF SELF.Request = ViewRecord                             ! Configure controls for View Only mode
    ?PBS:PalletBladSjabloonID{PROP:ReadOnly} = True
    ?PBS:PalletBladSjabloonNaam{PROP:ReadOnly} = True
    ?PBS:Leverancier{PROP:ReadOnly} = True
    ?PBS:Klant{PROP:ReadOnly} = True
    ?PBS:SSCC_NVE_00{PROP:ReadOnly} = True
    ?PBS:DueDate_12{PROP:ReadOnly} = True
    ?PBS:HarvastDate7007{PROP:ReadOnly} = True
    ?PBS:CustomerPurchaseOrderNumber_400{PROP:ReadOnly} = True
    ?PBS:ProductionDate_11{PROP:ReadOnly} = True
    ?PBS:ArtikelOms{PROP:ReadOnly} = True
    ?PBS:CustomerPartNumber_241{PROP:ReadOnly} = True
    ?PBS:NaOntdooien{PROP:ReadOnly} = True
    ?PBS:TransportEnOpslag{PROP:ReadOnly} = True
    ?PBS:BatchNumber_10{PROP:ReadOnly} = True
    ?PBS:SellByDate_15{PROP:ReadOnly} = True
    ?PBS:NumberOfUnitsContained_37{PROP:ReadOnly} = True
    ?PBS:ProductNetWeight_310{PROP:ReadOnly} = True
    ?PBS:OriginLiveBird{PROP:ReadOnly} = True
    ?PBS:OriginSlautherHouse{PROP:ReadOnly} = True
    ?PBS:OriginProcessing{PROP:ReadOnly} = True
    ?PBS:OriginPacking{PROP:ReadOnly} = True
    DISABLE(?Insert)
    DISABLE(?Change)
    DISABLE(?Delete)
  END
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  BRW4.Q &= Queue:Browse
  BRW4.ActiveInvisible = 1
  BRW4.RetainRow = 0
  BRW4.AddSortOrder(,PBSC:FK1_PalletBladSjabloonCountry)   ! Add the sort order for PBSC:FK1_PalletBladSjabloonCountry for sort order 1
  BRW4.AddRange(PBSC:PalletBladSjabloonID,PBS:PalletBladSjabloonID) ! Add single value range limit for sort order 1
  BRW4.AddLocator(BRW4::Sort0:Locator)                     ! Browse has a locator for sort order 1
  BRW4::Sort0:Locator.Init(,PBSC:Country,,BRW4)            ! Initialize the browse locator using  using key: PBSC:FK1_PalletBladSjabloonCountry , PBSC:Country
  BRW4.AddField(PBSC:Country,BRW4.Q.PBSC:Country)          ! Field PBSC:Country is a hot field or requires assignment from browse
  BRW4.AddField(PBSC:PalletBladSjabloonCountryID,BRW4.Q.PBSC:PalletBladSjabloonCountryID) ! Field PBSC:PalletBladSjabloonCountryID is a hot field or requires assignment from browse
  BRW4.AddField(PBSC:PalletBladSjabloonID,BRW4.Q.PBSC:PalletBladSjabloonID) ! Field PBSC:PalletBladSjabloonID is a hot field or requires assignment from browse
  INIMgr.Fetch('UpdatePalletBladSjabloon',QuickWindow)     ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  BRW4.AskProcedure = 1                                    ! Will call: UpdatePalletBladSjabloonCountry
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
    Relate:PalletBladSjabloon.Close
    Relate:PalletBladSjabloonCountry.Close
  END
  IF SELF.Opened
    INIMgr.Update('UpdatePalletBladSjabloon',QuickWindow)  ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.PrimeUpdate PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.PrimeUpdate()
    If returnValue = Level:Fatal  ! delete just occured
      ThisNetRefresh.Send('|PalletBladSjabloon|PalletBladSjabloonCountry|PalletBladSjabloonCountry|') ! NetTalk (NetRefresh)
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


ThisWindow.Run PROCEDURE(USHORT Number,BYTE Request)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Run(Number,Request)
  IF SELF.Request = ViewRecord
    ReturnValue = RequestCancelled                         ! Always return RequestCancelled if the form was opened in ViewRecord mode
  ELSE
    GlobalRequest = Request
    UpdatePalletBladSjabloonCountry
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
  ReturnValue = PARENT.TakeCompleted()
    ThisNetRefresh.Send('|PalletBladSjabloon|PalletBladSjabloonCountry|PalletBladSjabloonCountry|') ! NetTalk (NetRefresh)
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


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window


BRW4.Init PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)

  CODE
  PARENT.Init(ListBox,Posit,V,Q,RM,WM)
  IF WM.Request <> ViewRecord                              ! If called for anything other than ViewMode, make the insert, change & delete controls available
    SELF.InsertControl=?Insert
    SELF.ChangeControl=?Change
    SELF.DeleteControl=?Delete
  END

