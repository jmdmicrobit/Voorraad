

   MEMBER('VoorrStm.clw')                                  ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABPOPUP.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('VOORRSTM020.INC'),ONCE        !Local module procedure declarations
                     END


!!! <summary>
!!! Generated from procedure template - Window
!!! Browse the AAARelatie file
!!! </summary>
SelectAAARelatie PROCEDURE (Prm:Type)

LOC:Type             STRING(1)                             ! 
CurrentTab           STRING(80)                            ! 
BRW1::View:Browse    VIEW(AAARelatie)
                       PROJECT(AAARel:RelatieID)
                       PROJECT(AAARel:FirmaNaam)
                       PROJECT(AAARel:Adres1)
                       PROJECT(AAARel:Adres2)
                       PROJECT(AAARel:Postcode)
                       PROJECT(AAARel:Plaats)
                       PROJECT(AAARel:Telefoon)
                       PROJECT(AAARel:Mobiel)
                       PROJECT(AAARel:Fax)
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
AAARel:RelatieID       LIKE(AAARel:RelatieID)         !List box control field - type derived from field
AAARel:FirmaNaam       LIKE(AAARel:FirmaNaam)         !List box control field - type derived from field
AAARel:Adres1          LIKE(AAARel:Adres1)            !List box control field - type derived from field
AAARel:Adres2          LIKE(AAARel:Adres2)            !List box control field - type derived from field
AAARel:Postcode        LIKE(AAARel:Postcode)          !List box control field - type derived from field
AAARel:Plaats          LIKE(AAARel:Plaats)            !List box control field - type derived from field
AAARel:Telefoon        LIKE(AAARel:Telefoon)          !List box control field - type derived from field
AAARel:Mobiel          LIKE(AAARel:Mobiel)            !List box control field - type derived from field
AAARel:Fax             LIKE(AAARel:Fax)               !List box control field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
LocEnableEnterByTab  BYTE(1)                               !Used by the ENTER Instead of Tab template
EnterByTabManager    EnterByTabClass
NetLocalRefreshDate     Long     ! NetTalk (NetRefresh)
NetLocalRefreshTime     Long
NetLocalDependancies    String('|AAARelatie|')
QuickWindow          WINDOW('Browse the AAARelatie file'),AT(,,358,198),FONT('MS Sans Serif',8,,FONT:regular,CHARSET:DEFAULT), |
  RESIZE,CENTER,GRAY,IMM,MDI,HLP('SelectAAARelatie'),SYSTEM
                       LIST,AT(8,30,342,124),USE(?Browse:1),HVSCROLL,FORMAT('64R(2)|M~Relatie ID~C(0)@n-14@80L' & |
  '(2)|M~Firma Naam~L(2)@s50@80L(2)|M~Adres 1~L(2)@s100@80L(2)|M~Adres 2~L(2)@s100@80L(' & |
  '2)|M~Postcode~L(2)@s20@80L(2)|M~Plaats~L(2)@s100@80L(2)|M~Telefoon~L(2)@s25@80L(2)|M' & |
  '~Mobiel~L(2)@s30@80L(2)|M~Fax~L(2)@s25@'),FROM(Queue:Browse:1),IMM,MSG('Browsing the' & |
  ' AAARelatie file')
                       BUTTON('&Select'),AT(301,158,49,14),USE(?Select:2),LEFT,ICON('WASELECT.ICO'),FLAT,MSG('Select the Record'), |
  TIP('Select the Record')
                       SHEET,AT(4,4,350,172),USE(?CurrentTab)
                         TAB('&1) Relatie_FK01'),USE(?Tab:2)
                         END
                       END
                       BUTTON('&Close'),AT(252,180,49,14),USE(?Close),LEFT,ICON('WACLOSE.ICO'),FLAT,MSG('Close Window'), |
  TIP('Close Window')
                       BUTTON('&Help'),AT(305,180,49,14),USE(?Help),LEFT,ICON('WAHELP.ICO'),FLAT,MSG('See Help Window'), |
  STD(STD:Help),TIP('See Help Window')
                     END

    omit('***',WE::CantCloseNowSetHereDone=1)  !Getting Nested omit compile error, then uncheck the "Check for duplicate CantCloseNowSetHere variable declaration" in the WinEvent local template
WE::CantCloseNowSetHereDone equate(1)
WE::CantCloseNowSetHere     long
    !***
ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
Reset                  PROCEDURE(BYTE Force=0),DERIVED
TakeEvent              PROCEDURE(),BYTE,PROC,DERIVED
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
BRW1                 CLASS(BrowseClass)                    ! Browse using ?Browse:1
Q                      &Queue:Browse:1                !Reference to browse queue
Init                   PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)
ValidateRecord         PROCEDURE(),BYTE,DERIVED
                     END

BRW1::Sort0:Locator  StepLocatorClass                      ! Default Locator
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
  GlobalErrors.SetProcedureName('SelectAAARelatie')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  Loc:Type = PRM:Type
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
  Relate:AAARelatie.Open                                   ! File AAARelatie used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:AAARelatie,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  WinAlertMouseZoom()
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1.ActiveInvisible = 1
  BRW1.RetainRow = 0
  BRW1.AddSortOrder(,AAARel:Relatie_FK01)                  ! Add the sort order for AAARel:Relatie_FK01 for sort order 1
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort0:Locator.Init(,AAARel:FirmaNaam,,BRW1)        ! Initialize the browse locator using  using key: AAARel:Relatie_FK01 , AAARel:FirmaNaam
  BRW1.AddField(AAARel:RelatieID,BRW1.Q.AAARel:RelatieID)  ! Field AAARel:RelatieID is a hot field or requires assignment from browse
  BRW1.AddField(AAARel:FirmaNaam,BRW1.Q.AAARel:FirmaNaam)  ! Field AAARel:FirmaNaam is a hot field or requires assignment from browse
  BRW1.AddField(AAARel:Adres1,BRW1.Q.AAARel:Adres1)        ! Field AAARel:Adres1 is a hot field or requires assignment from browse
  BRW1.AddField(AAARel:Adres2,BRW1.Q.AAARel:Adres2)        ! Field AAARel:Adres2 is a hot field or requires assignment from browse
  BRW1.AddField(AAARel:Postcode,BRW1.Q.AAARel:Postcode)    ! Field AAARel:Postcode is a hot field or requires assignment from browse
  BRW1.AddField(AAARel:Plaats,BRW1.Q.AAARel:Plaats)        ! Field AAARel:Plaats is a hot field or requires assignment from browse
  BRW1.AddField(AAARel:Telefoon,BRW1.Q.AAARel:Telefoon)    ! Field AAARel:Telefoon is a hot field or requires assignment from browse
  BRW1.AddField(AAARel:Mobiel,BRW1.Q.AAARel:Mobiel)        ! Field AAARel:Mobiel is a hot field or requires assignment from browse
  BRW1.AddField(AAARel:Fax,BRW1.Q.AAARel:Fax)              ! Field AAARel:Fax is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('SelectAAARelatie',QuickWindow)             ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
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
    Relate:AAARelatie.Close
  END
  IF SELF.Opened
    INIMgr.Update('SelectAAARelatie',QuickWindow)          ! Save window data to non-volatile store
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
  SELF.SelectControl = ?Select:2
  SELF.HideSelect = 1                                      ! Hide the select button when disabled
  PARENT.Init(ListBox,Posit,V,Q,RM,WM)


BRW1.ValidateRecord PROCEDURE

ReturnValue          BYTE,AUTO

BRW1::RecordStatus   BYTE,AUTO
  CODE
  	if (AAARel:Type <> Loc:Type) AND (Loc:Type <> '')Then Return Record:Filtered.
  ReturnValue = PARENT.ValidateRecord()
  BRW1::RecordStatus=ReturnValue
  RETURN ReturnValue


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window

