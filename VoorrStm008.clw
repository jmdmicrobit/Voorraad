

   MEMBER('VoorrStm.clw')                                  ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABPOPUP.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('VOORRSTM008.INC'),ONCE        !Local module procedure declarations
                     END


!!! <summary>
!!! Generated from procedure template - Window
!!! Form Artikel
!!! </summary>
UpdateArtikel PROCEDURE 

CurrentTab           STRING(80)                            ! 
ActionMessage        CSTRING(40)                           ! 
BRW8::View:Browse    VIEW(ArtikelOmschrijvingExtra)
                       PROJECT(Art2:ex_artcode)
                       PROJECT(Art2:artcode)
                       PROJECT(Art2:tekst)
                     END
Queue:Browse         QUEUE                            !Queue declaration for browse/combo box using ?List
Art2:ex_artcode        LIKE(Art2:ex_artcode)          !List box control field - type derived from field
Art2:artcode           LIKE(Art2:artcode)             !List box control field - type derived from field
Art2:tekst             LIKE(Art2:tekst)               !List box control field - type derived from field
Art:ArtikelID          LIKE(Art:ArtikelID)            !Browse hot field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
BRW9::View:Browse    VIEW(GNCodeArtikelen)
                       PROJECT(GNA:GNCode)
                       PROJECT(GNA:ArtikelID)
                       JOIN(GNC:GNCode_PK,GNA:GNCode)
                         PROJECT(GNC:Benaming_NL)
                         PROJECT(GNC:GNCode)
                       END
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?List:2
GNA:GNCode             LIKE(GNA:GNCode)               !List box control field - type derived from field
GNC:Benaming_NL        LIKE(GNC:Benaming_NL)          !List box control field - type derived from field
GNA:ArtikelID          LIKE(GNA:ArtikelID)            !Primary key field - type derived from field
GNC:GNCode             LIKE(GNC:GNCode)               !Related join file key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
LocEnableEnterByTab  BYTE(1)                               !Used by the ENTER Instead of Tab template
EnterByTabManager    EnterByTabClass
History::Art:Record  LIKE(Art:RECORD),THREAD
QuickWindow          WINDOW('Form Artikel'),AT(,,423,292),FONT('MS Sans Serif',8,,,CHARSET:DEFAULT),RESIZE,CENTER, |
  GRAY,IMM,MDI,HLP('UpdateArtikel'),SYSTEM
                       SHEET,AT(4,4,413,63),USE(?CurrentTab)
                         TAB('&1) General'),USE(?Tab:1)
                           PROMPT('Artikel ID:'),AT(8,23),USE(?Art:ArtikelID:Prompt),TRN
                           ENTRY(@s30),AT(92,23,125,10),USE(Art:ArtikelID)
                           PROMPT('Artikelomschrijving:'),AT(8,38),USE(?Art:Artikelomschrijving:Prompt),TRN
                           ENTRY(@s50),AT(92,38,204,10),USE(Art:ArtikelOms)
                         END
                       END
                       BUTTON('&OK'),AT(315,71,49,14),USE(?OK),LEFT,ICON('WAOK.ICO'),DEFAULT,FLAT,MSG('Accept dat' & |
  'a and close the window'),TIP('Accept data and close the window')
                       BUTTON('&Cancel'),AT(367,71,49,14),USE(?Cancel),LEFT,ICON('WACANCEL.ICO'),FLAT,MSG('Cancel operation'), |
  TIP('Cancel operation')
                       LIST,AT(7,89,409,121),USE(?List),FORMAT('23L(2)|M~ex artcode~@s2@120L(2)|M~artcode~L(0)' & |
  '@s30@640L(2)|M~tekst~L(0)@s160@'),FROM(Queue:Browse),IMM
                       LIST,AT(9,222,405,57),USE(?List:2),FORMAT('80L(2)|M~GNCode~@s20@400L(2)|M~Benaming NL~@s100@'), |
  FROM(Queue:Browse:1),IMM
                     END

ThisWindow           CLASS(WindowManager)
Ask                    PROCEDURE(),DERIVED
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
Run                    PROCEDURE(),BYTE,PROC,DERIVED
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED
TakeEvent              PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
Resizer              CLASS(WindowResizeClass)
Init                   PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)
                     END

BRW8                 CLASS(BrowseClass)                    ! Browse using ?List
Q                      &Queue:Browse                  !Reference to browse queue
                     END

BRW8::Sort0:Locator  StepLocatorClass                      ! Default Locator
BRW9                 CLASS(BrowseClass)                    ! Browse using ?List:2
Q                      &Queue:Browse:1                !Reference to browse queue
                     END

BRW9::Sort0:Locator  StepLocatorClass                      ! Default Locator
CurCtrlFeq          LONG
FieldColorQueue     QUEUE
Feq                   LONG
OldColor              LONG
                    END

  CODE
? DEBUGHOOK(ArtikelOmschrijvingExtra:Record)
? DEBUGHOOK(GNCodeArtikelen:Record)
? DEBUGHOOK(ViewArtikel:Record)
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
  GlobalErrors.SetProcedureName('UpdateArtikel')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Art:ArtikelID:Prompt
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('Art2:ex_artcode',Art2:ex_artcode)                  ! Added by: BrowseBox(ABC)
  BIND('GNC:Benaming_NL',GNC:Benaming_NL)                  ! Added by: BrowseBox(ABC)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
  SELF.HistoryKey = CtrlH
  SELF.AddHistoryFile(Art:Record,History::Art:Record)
  SELF.AddHistoryField(?Art:ArtikelID,1)
  SELF.AddHistoryField(?Art:ArtikelOms,2)
  SELF.AddUpdateFile(Access:ViewArtikel)
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  Relate:ArtikelOmschrijvingExtra.Open                     ! File ArtikelOmschrijvingExtra used by this procedure, so make sure it's RelationManager is open
  Relate:GNCodeArtikelen.Open                              ! File GNCodeArtikelen used by this procedure, so make sure it's RelationManager is open
  Relate:ViewArtikel.Open                                  ! File ViewArtikel used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Primary &= Relate:ViewArtikel
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
  BRW8.Init(?List,Queue:Browse.ViewPosition,BRW8::View:Browse,Queue:Browse,Relate:ArtikelOmschrijvingExtra,SELF) ! Initialize the browse manager
  BRW9.Init(?List:2,Queue:Browse:1.ViewPosition,BRW9::View:Browse,Queue:Browse:1,Relate:GNCodeArtikelen,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  Do DefineListboxStyle
  IF SELF.Request = ViewRecord                             ! Configure controls for View Only mode
    ?Art:ArtikelID{PROP:ReadOnly} = True
    ?Art:ArtikelOms{PROP:ReadOnly} = True
  END
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  BRW8.Q &= Queue:Browse
  BRW8.FileLoaded = 1                                      ! This is a 'file loaded' browse
  BRW8.ActiveInvisible = 1
  BRW8.RetainRow = 0
  BRW8.AddSortOrder(,Art2:PK_ArtikelOmschrijvingExtra)     ! Add the sort order for Art2:PK_ArtikelOmschrijvingExtra for sort order 1
  BRW8.AddLocator(BRW8::Sort0:Locator)                     ! Browse has a locator for sort order 1
  BRW8::Sort0:Locator.Init(,Art2:ex_artcode,1,BRW8)        ! Initialize the browse locator using  using key: Art2:PK_ArtikelOmschrijvingExtra , Art2:ex_artcode
  BRW8.SetFilter('(Art2:artcode = Art:ArtikelID)')         ! Apply filter expression to browse
  BRW8.AddField(Art2:ex_artcode,BRW8.Q.Art2:ex_artcode)    ! Field Art2:ex_artcode is a hot field or requires assignment from browse
  BRW8.AddField(Art2:artcode,BRW8.Q.Art2:artcode)          ! Field Art2:artcode is a hot field or requires assignment from browse
  BRW8.AddField(Art2:tekst,BRW8.Q.Art2:tekst)              ! Field Art2:tekst is a hot field or requires assignment from browse
  BRW8.AddField(Art:ArtikelID,BRW8.Q.Art:ArtikelID)        ! Field Art:ArtikelID is a hot field or requires assignment from browse
  BRW9.Q &= Queue:Browse:1
  BRW9.ActiveInvisible = 1
  BRW9.RetainRow = 0
  BRW9.AddSortOrder(,GNA:GNCodeArtikelen_FK1)              ! Add the sort order for GNA:GNCodeArtikelen_FK1 for sort order 1
  BRW9.AddRange(GNA:ArtikelID,Art:ArtikelID)               ! Add single value range limit for sort order 1
  BRW9.AddLocator(BRW9::Sort0:Locator)                     ! Browse has a locator for sort order 1
  BRW9::Sort0:Locator.Init(,GNA:ArtikelID,,BRW9)           ! Initialize the browse locator using  using key: GNA:GNCodeArtikelen_FK1 , GNA:ArtikelID
  BRW9.AddField(GNA:GNCode,BRW9.Q.GNA:GNCode)              ! Field GNA:GNCode is a hot field or requires assignment from browse
  BRW9.AddField(GNC:Benaming_NL,BRW9.Q.GNC:Benaming_NL)    ! Field GNC:Benaming_NL is a hot field or requires assignment from browse
  BRW9.AddField(GNA:ArtikelID,BRW9.Q.GNA:ArtikelID)        ! Field GNA:ArtikelID is a hot field or requires assignment from browse
  BRW9.AddField(GNC:GNCode,BRW9.Q.GNC:GNCode)              ! Field GNC:GNCode is a hot field or requires assignment from browse
  INIMgr.Fetch('UpdateArtikel',QuickWindow)                ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  BRW8.AddToolbarTarget(Toolbar)                           ! Browse accepts toolbar control
  BRW9.AddToolbarTarget(Toolbar)                           ! Browse accepts toolbar control
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
    Relate:ArtikelOmschrijvingExtra.Close
    Relate:GNCodeArtikelen.Close
    Relate:ViewArtikel.Close
  END
  IF SELF.Opened
    INIMgr.Update('UpdateArtikel',QuickWindow)             ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
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
    END
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


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window

