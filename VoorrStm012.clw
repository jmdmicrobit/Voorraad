

   MEMBER('VoorrStm.clw')                                  ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABPOPUP.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('VOORRSTM012.INC'),ONCE        !Local module procedure declarations
                     END


!!! <summary>
!!! Generated from procedure template - Window
!!! Browse the Relatie file
!!! </summary>
BrowseRelatieAdres PROCEDURE 

CurrentTab           STRING(80)                            ! 
BRW1::View:Browse    VIEW(Relatie)
                       PROJECT(Rel:FirmaNaam)
                       PROJECT(Rel:Adres1)
                       PROJECT(Rel:Adres2)
                       PROJECT(Rel:Postcode)
                       PROJECT(Rel:Plaats)
                       PROJECT(Rel:Telefoon)
                       PROJECT(Rel:Mobiel)
                       PROJECT(Rel:Fax)
                       PROJECT(Rel:Type)
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
Rel:FirmaNaam          LIKE(Rel:FirmaNaam)            !List box control field - type derived from field
Rel:Adres1             LIKE(Rel:Adres1)               !List box control field - type derived from field
Rel:Adres2             LIKE(Rel:Adres2)               !List box control field - type derived from field
Rel:Postcode           LIKE(Rel:Postcode)             !List box control field - type derived from field
Rel:Plaats             LIKE(Rel:Plaats)               !List box control field - type derived from field
Rel:Telefoon           LIKE(Rel:Telefoon)             !List box control field - type derived from field
Rel:Mobiel             LIKE(Rel:Mobiel)               !List box control field - type derived from field
Rel:Fax                LIKE(Rel:Fax)                  !List box control field - type derived from field
Rel:Type               LIKE(Rel:Type)                 !Browse hot field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
LocEnableEnterByTab  BYTE(1)                               !Used by the ENTER Instead of Tab template
EnterByTabManager    EnterByTabClass
NetLocalRefreshDate     Long     ! NetTalk (NetRefresh)
NetLocalRefreshTime     Long
NetLocalDependancies    String('|Relatie|')
QuickWindow          WINDOW('Overzicht klanten'),AT(,,358,204),FONT('MS Sans Serif',8,,FONT:regular,CHARSET:DEFAULT), |
  RESIZE,CENTER,GRAY,IMM,MAX,MDI,HLP('BrowseRelatieAdres'),SYSTEM
                       LIST,AT(14,25,333,129),USE(?Browse:1),HVSCROLL,FORMAT('103L(2)|M~Firma Naam~@s50@80L(2)' & |
  '|M~Adres 1~@s100@80L(2)|M~Adres 2~@s100@80L(2)|M~Postcode~@s20@80L(2)|M~Plaats~@s100' & |
  '@80L(2)|M~Telefoon~@s25@80L(2)|M~Mobiel~@s30@80L(2)|M~Fax~@s25@'),FROM(Queue:Browse:1), |
  IMM,MSG('Browsing the Relatie file')
                       SHEET,AT(4,4,350,178),USE(?CurrentTab)
                         TAB('&1) Op Klant'),USE(?Tab:2)
                         END
                         TAB('&2) Op Leverancier'),USE(?TAB1)
                         END
                       END
                       BUTTON('&Wijzigen Adressen'),AT(273,159,75,15),USE(?Change)
                       BUTTON('&Close'),AT(303,185,49,14),USE(?Close),LEFT,ICON('WACLOSE.ICO'),FLAT,MSG('Close Window'), |
  TIP('Close Window')
                     END

    omit('***',WE::CantCloseNowSetHereDone=1)  !Getting Nested omit compile error, then uncheck the "Check for duplicate CantCloseNowSetHere variable declaration" in the WinEvent local template
WE::CantCloseNowSetHereDone equate(1)
WE::CantCloseNowSetHere     long
    !***
ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
Reset                  PROCEDURE(BYTE Force=0),DERIVED
Run                    PROCEDURE(USHORT Number,BYTE Request),BYTE,PROC,DERIVED
TakeEvent              PROCEDURE(),BYTE,PROC,DERIVED
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
BRW1                 CLASS(BrowseClass)                    ! Browse using ?Browse:1
Q                      &Queue:Browse:1                !Reference to browse queue
Init                   PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)
ResetSort              PROCEDURE(BYTE Force),BYTE,PROC,DERIVED
                     END

BRW1::Sort0:Locator  IncrementalLocatorClass               ! Default Locator
BRW1::Sort1:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab)=2
Resizer              CLASS(WindowResizeClass)
Init                   PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)
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

ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('BrowseRelatieAdres')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Browse:1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
  IF SELF.Request = SelectRecord
     SELF.AddItem(?Close,RequestCancelled)                 ! Add the close control to the window manger
  ELSE
     SELF.AddItem(?Close,RequestCompleted)                 ! Add the close control to the window manger
  END
  Relate:Relatie.SetOpenRelated()
  Relate:Relatie.Open                                      ! File Relatie used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:Relatie,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  WinAlertMouseZoom()
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1.ActiveInvisible = 1
  BRW1.RetainRow = 0
  BRW1.AddSortOrder(,Rel:Relatie_FK01)                     ! Add the sort order for Rel:Relatie_FK01 for sort order 1
  BRW1.AddLocator(BRW1::Sort1:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort1:Locator.Init(,Rel:FirmaNaam,,BRW1)           ! Initialize the browse locator using  using key: Rel:Relatie_FK01 , Rel:FirmaNaam
  BRW1.SetFilter('(Rel:Type=''S'')')                       ! Apply filter expression to browse
  BRW1.AddSortOrder(,Rel:Relatie_FK01)                     ! Add the sort order for Rel:Relatie_FK01 for sort order 2
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 2
  BRW1::Sort0:Locator.Init(,Rel:FirmaNaam,,BRW1)           ! Initialize the browse locator using  using key: Rel:Relatie_FK01 , Rel:FirmaNaam
  BRW1.SetFilter('(Rel:Type=''C'')')                       ! Apply filter expression to browse
  BRW1.AddField(Rel:FirmaNaam,BRW1.Q.Rel:FirmaNaam)        ! Field Rel:FirmaNaam is a hot field or requires assignment from browse
  BRW1.AddField(Rel:Adres1,BRW1.Q.Rel:Adres1)              ! Field Rel:Adres1 is a hot field or requires assignment from browse
  BRW1.AddField(Rel:Adres2,BRW1.Q.Rel:Adres2)              ! Field Rel:Adres2 is a hot field or requires assignment from browse
  BRW1.AddField(Rel:Postcode,BRW1.Q.Rel:Postcode)          ! Field Rel:Postcode is a hot field or requires assignment from browse
  BRW1.AddField(Rel:Plaats,BRW1.Q.Rel:Plaats)              ! Field Rel:Plaats is a hot field or requires assignment from browse
  BRW1.AddField(Rel:Telefoon,BRW1.Q.Rel:Telefoon)          ! Field Rel:Telefoon is a hot field or requires assignment from browse
  BRW1.AddField(Rel:Mobiel,BRW1.Q.Rel:Mobiel)              ! Field Rel:Mobiel is a hot field or requires assignment from browse
  BRW1.AddField(Rel:Fax,BRW1.Q.Rel:Fax)                    ! Field Rel:Fax is a hot field or requires assignment from browse
  BRW1.AddField(Rel:Type,BRW1.Q.Rel:Type)                  ! Field Rel:Type is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('BrowseRelatieAdres',QuickWindow)           ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  BRW1.AskProcedure = 1                                    ! Will call: ViewRelatie
  BRW1.AddToolbarTarget(Toolbar)                           ! Browse accepts toolbar control
  SELF.SetAlerts()
  NetLocalRefreshDate = today()         ! NetTalk (NetRefresh)
  NetLocalRefreshTime = clock()
  EnterByTabManager.Init(False)
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:Relatie.Close
  END
  IF SELF.Opened
    INIMgr.Update('BrowseRelatieAdres',QuickWindow)        ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.Reset PROCEDURE(BYTE Force=0)

  CODE
  SELF.ForcedReset += Force
  IF QuickWindow{Prop:AcceptAll} THEN RETURN.
    NetLocalRefreshDate = today()         ! NetTalk (NetRefresh)
    NetLocalRefreshTime = clock()
  PARENT.Reset(Force)


ThisWindow.Run PROCEDURE(USHORT Number,BYTE Request)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Run(Number,Request)
  IF SELF.Request = ViewRecord
    ReturnValue = RequestCancelled                         ! Always return RequestCancelled if the form was opened in ViewRecord mode
  ELSE
    GlobalRequest = Request
    ViewRelatie
    ReturnValue = GlobalResponse
  END
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


BRW1.Init PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)

  CODE
  PARENT.Init(ListBox,Posit,V,Q,RM,WM)
  IF WM.Request <> ViewRecord                              ! If called for anything other than ViewMode, make the insert, change & delete controls available
    SELF.ChangeControl=?Change
  END


BRW1.ResetSort PROCEDURE(BYTE Force)

ReturnValue          BYTE,AUTO

  CODE
  IF CHOICE(?CurrentTab)=2
    RETURN SELF.SetSort(1,Force)
  ELSE
    RETURN SELF.SetSort(2,Force)
  END
  ReturnValue = PARENT.ResetSort(Force)
  RETURN ReturnValue


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window
  SELF.SetStrategy(?Change, Resize:FixRight+Resize:FixBottom, Resize:LockSize) ! Override strategy for ?Change
  SELF.SetStrategy(?Close, Resize:FixRight+Resize:FixBottom, Resize:LockSize) ! Override strategy for ?Close

