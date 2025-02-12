

   MEMBER('VoorrStm.clw')                                  ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABPOPUP.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('VOORRSTM002.INC'),ONCE        !Local module procedure declarations
                     END


!!! <summary>
!!! Generated from procedure template - Window
!!! Browse the ARelatie file
!!! </summary>
SelectARelatie PROCEDURE (Prm:Type)

CurrentTab           STRING(80)                            ! 
Loc:Type             STRING(1)                             ! 
BRW1::View:Browse    VIEW(ARelatie)
                       PROJECT(AREL:FirmaNaam)
                       PROJECT(AREL:Adres1)
                       PROJECT(AREL:Adres2)
                       PROJECT(AREL:Plaats)
                       PROJECT(AREL:Postcode)
                       PROJECT(AREL:RelatieID)
                       PROJECT(AREL:Telefoon)
                       PROJECT(AREL:Mobiel)
                       PROJECT(AREL:Fax)
                       PROJECT(AREL:Type)
                       PROJECT(AREL:Note)
                       PROJECT(AREL:LotID)
                       PROJECT(AREL:NietActief)
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
AREL:FirmaNaam         LIKE(AREL:FirmaNaam)           !List box control field - type derived from field
AREL:FirmaNaam_NormalFG LONG                          !Normal forground color
AREL:FirmaNaam_NormalBG LONG                          !Normal background color
AREL:FirmaNaam_SelectedFG LONG                        !Selected forground color
AREL:FirmaNaam_SelectedBG LONG                        !Selected background color
AREL:Adres1            LIKE(AREL:Adres1)              !List box control field - type derived from field
AREL:Adres2            LIKE(AREL:Adres2)              !List box control field - type derived from field
AREL:Plaats            LIKE(AREL:Plaats)              !List box control field - type derived from field
AREL:Postcode          LIKE(AREL:Postcode)            !List box control field - type derived from field
AREL:RelatieID         LIKE(AREL:RelatieID)           !List box control field - type derived from field
AREL:Telefoon          LIKE(AREL:Telefoon)            !List box control field - type derived from field
AREL:Mobiel            LIKE(AREL:Mobiel)              !List box control field - type derived from field
AREL:Fax               LIKE(AREL:Fax)                 !List box control field - type derived from field
AREL:Type              LIKE(AREL:Type)                !Browse hot field - type derived from field
AREL:Note              LIKE(AREL:Note)                !Browse hot field - type derived from field
AREL:LotID             LIKE(AREL:LotID)               !Browse hot field - type derived from field
AREL:NietActief        LIKE(AREL:NietActief)          !Browse hot field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
LocEnableEnterByTab  BYTE(1)                               !Used by the ENTER Instead of Tab template
EnterByTabManager    EnterByTabClass
QuickWindow          WINDOW('Selecteren Relatie'),AT(,,366,434),FONT('MS Sans Serif',8,,FONT:regular,CHARSET:DEFAULT), |
  RESIZE,CENTER,GRAY,IMM,HLP('SelectArelatie'),SYSTEM
                       GROUP('Fu&zzy Search Options'),AT(10,25,199,24),USE(?FuzzyGroup),BOXED
                         ENTRY(@S255),AT(14,34,100,10),USE(?FuzzyQuery)
                         BUTTON('&Search'),AT(118,33,42,12),USE(?FuzzyGo)
                         BUTTON('&Clear'),AT(162,33,42,12),USE(?FuzzyClear)
                       END
                       LIST,AT(11,53,333,326),USE(?Browse:1),VSCROLL,FORMAT('100L(2)|M*~Firma Naam~@s50@80L(2)' & |
  '|M~Adres 1~@s100@80L(2)|M~Adres 2~@s100@80L(2)|M~Plaats~@s100@80L(2)|M~Postcode~@s20' & |
  '@64R(2)|M~Relatie ID~C(0)@n-14@80L(2)|M~Telefoon~@s25@80L(2)|M~Mobiel~@s30@80L(2)|M~Fax~@s25@'), |
  FROM(Queue:Browse:1),IMM,MSG('Browsing the ARelatie file')
                       BUTTON('&Select'),AT(295,383,49,14),USE(?Select:2),LEFT,ICON('WASELECT.ICO'),FLAT,MSG('Select the Record'), |
  TIP('Select the Record')
                       SHEET,AT(4,4,350,400),USE(?CurrentTab)
                         TAB('&1) Relatie_FK01'),USE(?Tab:2)
                         END
                       END
                       BUTTON('&Close'),AT(315,407,49,14),USE(?Close),LEFT,ICON('WACLOSE.ICO'),FLAT,MSG('Close Window'), |
  TIP('Close Window')
                     END
FuzzyOrder6          BYTE,AUTO
FuzzyQuery6          STRING(255)

ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED
TakeEvent              PROCEDURE(),BYTE,PROC,DERIVED
TakeSelected           PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
BRW1                 CLASS(BrowseClass)                    ! Browse using ?Browse:1
Q                      &Queue:Browse:1                !Reference to browse queue
Init                   PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)
ResetSort              PROCEDURE(BYTE Force),BYTE,PROC,DERIVED
SetQueueRecord         PROCEDURE(),DERIVED
ValidateRecord         PROCEDURE(),BYTE,DERIVED
                     END

BRW1::Sort0:Locator  IncrementalLocatorClass               ! Default Locator
Resizer              CLASS(WindowResizeClass)
Init                   PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)
                     END


  CODE
? DEBUGHOOK(ARelatie:Record)
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
  GlobalErrors.SetProcedureName('SelectARelatie')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  Loc:Type = PRM:Type
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?FuzzyQuery
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('Loc:Type',Loc:Type)                                ! Added by: BrowseBox(ABC)
  BIND('FuzzyMatch',FuzzyMatch)                            ! Added by: BrowseFuzzyMatching(ABC)
  BIND('FuzzyQuery6',FuzzyQuery6)                          ! Added by: BrowseFuzzyMatching(ABC)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
  IF SELF.Request = SelectRecord
     SELF.AddItem(?Close,RequestCancelled)                 ! Add the close control to the window manger
  ELSE
     SELF.AddItem(?Close,RequestCompleted)                 ! Add the close control to the window manger
  END
  Relate:ARelatie.Open                                     ! File ARelatie used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:ARelatie,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1.ActiveInvisible = 1
  BRW1.RetainRow = 0
  BRW1.AddSortOrder(,AREL:Relatie_FK01)                    ! Add the sort order for AREL:Relatie_FK01 for sort order 1
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort0:Locator.Init(,AREL:FirmaNaam,,BRW1)          ! Initialize the browse locator using  using key: AREL:Relatie_FK01 , AREL:FirmaNaam
  BRW1.SetFilter('(AREL:Type=Loc:Type AND NOT AREL:NietActief)') ! Apply filter expression to browse
  BRW1.AddField(AREL:FirmaNaam,BRW1.Q.AREL:FirmaNaam)      ! Field AREL:FirmaNaam is a hot field or requires assignment from browse
  BRW1.AddField(AREL:Adres1,BRW1.Q.AREL:Adres1)            ! Field AREL:Adres1 is a hot field or requires assignment from browse
  BRW1.AddField(AREL:Adres2,BRW1.Q.AREL:Adres2)            ! Field AREL:Adres2 is a hot field or requires assignment from browse
  BRW1.AddField(AREL:Plaats,BRW1.Q.AREL:Plaats)            ! Field AREL:Plaats is a hot field or requires assignment from browse
  BRW1.AddField(AREL:Postcode,BRW1.Q.AREL:Postcode)        ! Field AREL:Postcode is a hot field or requires assignment from browse
  BRW1.AddField(AREL:RelatieID,BRW1.Q.AREL:RelatieID)      ! Field AREL:RelatieID is a hot field or requires assignment from browse
  BRW1.AddField(AREL:Telefoon,BRW1.Q.AREL:Telefoon)        ! Field AREL:Telefoon is a hot field or requires assignment from browse
  BRW1.AddField(AREL:Mobiel,BRW1.Q.AREL:Mobiel)            ! Field AREL:Mobiel is a hot field or requires assignment from browse
  BRW1.AddField(AREL:Fax,BRW1.Q.AREL:Fax)                  ! Field AREL:Fax is a hot field or requires assignment from browse
  BRW1.AddField(AREL:Type,BRW1.Q.AREL:Type)                ! Field AREL:Type is a hot field or requires assignment from browse
  BRW1.AddField(AREL:Note,BRW1.Q.AREL:Note)                ! Field AREL:Note is a hot field or requires assignment from browse
  BRW1.AddField(AREL:LotID,BRW1.Q.AREL:LotID)              ! Field AREL:LotID is a hot field or requires assignment from browse
  BRW1.AddField(AREL:NietActief,BRW1.Q.AREL:NietActief)    ! Field AREL:NietActief is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  ?FuzzyQuery{PROP:Use} = FuzzyQuery6
  FuzzyOrder6 = BRW1.AddSortOrder()
  BRW1.AppendOrder('200-FuzzyMatch(FuzzyQuery6,AREL:FirmaNaam&'' ''&AREL:Adres1&'' ''&AREL:Adres2&'' ''&AREL:Plaats&'' ''&AREL:Postcode&'' ''&AREL:RelatieID&'' ''&AREL:Telefoon&'' ''&AREL:Mobiel&'' ''&AREL:Fax&'' ''&AREL:Type&'' ''&AREL:Note&'' ''&AREL:LotID&'' ''&AREL:NietActief)')
  BRW1.SetFilter('FuzzyMatch(FuzzyQuery6,AREL:FirmaNaam&'' ''&AREL:Adres1&'' ''&AREL:Adres2&'' ''&AREL:Plaats&'' ''&AREL:Postcode&'' ''&AREL:RelatieID&'' ''&AREL:Telefoon&'' ''&AREL:Mobiel&'' ''&AREL:Fax&'' ''&AREL:Type&'' ''&AREL:Note&'' ''&AREL:LotID&'' ''&AREL:NietActief)>=1', 'FuzzyFilter')
  INIMgr.Fetch('SelectARelatie',QuickWindow)               ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  BRW1.AddToolbarTarget(Toolbar)                           ! Browse accepts toolbar control
  SELF.SetAlerts()
  EnterByTabManager.Init(False)
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:ARelatie.Close
  END
  IF SELF.Opened
    INIMgr.Update('SelectARelatie',QuickWindow)            ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
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
    OF ?FuzzyGo
      ThisWindow.Update()
      	Select(?Browse:1)
      BRW1.ResetSort(1)
    OF ?FuzzyClear
      ThisWindow.Update()
      BRW1.ResetSort(1)
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


ThisWindow.TakeSelected PROCEDURE

ReturnValue          BYTE,AUTO

Looped BYTE
  CODE
  LOOP                                                     ! This method receives all Selected events
    IF Looped
      RETURN Level:Notify
    ELSE
      Looped = 1
    END
  ReturnValue = PARENT.TakeSelected()
    CASE FIELD()
    OF ?FuzzyQuery
      POST(EVENT:Accepted, ?FuzzyClear)
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


BRW1.ResetSort PROCEDURE(BYTE Force)

ReturnValue          BYTE,AUTO

FuzzyMatched         BYTE(False),STATIC
  CODE
  IF EVENT() = EVENT:Accepted
    CASE ACCEPTED()
    OF ?FuzzyGo
      IF FuzzyQuery6
        FuzzyMatched = True
        RETURN SELF.SetSort(FuzzyOrder6, Force)
      END
    OF ?FuzzyClear
      FuzzyMatched = False
      CLEAR(FuzzyQuery6)
    END
  END
  IF FuzzyMatched = True THEN RETURN PARENT.ResetSort(Force).
  RETURN SELF.SetSort(1,Force)
  ReturnValue = PARENT.ResetSort(Force)
  RETURN ReturnValue


BRW1.SetQueueRecord PROCEDURE

  CODE
  PARENT.SetQueueRecord
  
  IF (AREL:NietActief)
    SELF.Q.AREL:FirmaNaam_NormalFG = -1                    ! Set conditional color values for AREL:FirmaNaam
    SELF.Q.AREL:FirmaNaam_NormalBG = 255
    SELF.Q.AREL:FirmaNaam_SelectedFG = 255
    SELF.Q.AREL:FirmaNaam_SelectedBG = -1
  ELSE
    SELF.Q.AREL:FirmaNaam_NormalFG = -1                    ! Set color values for AREL:FirmaNaam
    SELF.Q.AREL:FirmaNaam_NormalBG = -1
    SELF.Q.AREL:FirmaNaam_SelectedFG = -1
    SELF.Q.AREL:FirmaNaam_SelectedBG = -1
  END


BRW1.ValidateRecord PROCEDURE

ReturnValue          BYTE,AUTO

BRW1::RecordStatus   BYTE,AUTO
  CODE
  	if (AREL:Type <> Loc:Type) AND (Loc:Type <> '')Then Return Record:Filtered.
  ReturnValue = PARENT.ValidateRecord()
  BRW1::RecordStatus=ReturnValue
  RETURN ReturnValue


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window
  SELF.SetStrategy(?FuzzyGroup, Resize:FixNearestX + Resize:FixNearestY, Resize:LockSize)

