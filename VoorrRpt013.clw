

   MEMBER('VoorrRpt.clw')                                  ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABPOPUP.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('VOORRRPT013.INC'),ONCE        !Local module procedure declarations
                     END


!!! <summary>
!!! Generated from procedure template - Window
!!! Browse the Sjabloon file
!!! </summary>
BrowseSjablonen PROCEDURE 

udpt            UltimateDebugProcedureTracker
CurrentTab           STRING(80)                            ! 
Loc:TempFile         CSTRING(199)                          ! 
BRW1::View:Browse    VIEW(Sjabloon)
                       PROJECT(Sja:SjabloonID)
                       PROJECT(Sja:Bestandsnaam)
                       PROJECT(Sja:SoortSjabloon)
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
Sja:SjabloonID         LIKE(Sja:SjabloonID)           !List box control field - type derived from field
Sja:Bestandsnaam       LIKE(Sja:Bestandsnaam)         !List box control field - type derived from field
Sja:SoortSjabloon      LIKE(Sja:SoortSjabloon)        !List box control field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
LocEnableEnterByTab  BYTE(1)                               !Used by the ENTER Instead of Tab template
EnterByTabManager    EnterByTabClass
NetLocalRefreshDate     Long     ! NetTalk (NetRefresh)
NetLocalRefreshTime     Long
NetLocalDependancies    String('|Sjabloon|')
QuickWindow          WINDOW('Browse the Sjabloon file'),AT(,,228,198),FONT('MS Sans Serif',8,,,CHARSET:DEFAULT), |
  RESIZE,CENTER,GRAY,IMM,MDI,HLP('BrowseSjablonen'),SYSTEM
                       LIST,AT(8,30,212,124),USE(?Browse:1),HVSCROLL,FORMAT('80L(2)|M~Sjabloon ID~L(2)@s19@80L' & |
  '(2)|M~Bestandsnaam~L(2)@s98@60L(2)|M~Soort Sjabloon~L(2)@s1@'),FROM(Queue:Browse:1),IMM, |
  MSG('Browsing the Sjabloon file')
                       BUTTON('&View'),AT(12,158,49,14),USE(?View:2),LEFT,ICON('WAVIEW.ICO'),FLAT,MSG('View Record'), |
  TIP('View Record')
                       BUTTON('&Insert'),AT(65,158,49,14),USE(?Insert:3),LEFT,ICON('WAINSERT.ICO'),FLAT,MSG('Insert a Record'), |
  TIP('Insert a Record')
                       BUTTON('&Change'),AT(118,158,49,14),USE(?Change:3),LEFT,ICON('WACHANGE.ICO'),DEFAULT,FLAT, |
  MSG('Change the Record'),TIP('Change the Record')
                       BUTTON('&Delete'),AT(171,158,49,14),USE(?Delete:3),LEFT,ICON('WADELETE.ICO'),FLAT,MSG('Delete the Record'), |
  TIP('Delete the Record')
                       SHEET,AT(4,4,220,172),USE(?CurrentTab)
                         TAB('&1) Sjabloon_PK'),USE(?Tab:2)
                         END
                       END
                       BUTTON('&Close'),AT(122,180,49,14),USE(?Close),LEFT,ICON('WACLOSE.ICO'),FLAT,MSG('Close Window'), |
  TIP('Close Window')
                       BUTTON('&Help'),AT(175,180,49,14),USE(?Help),LEFT,ICON('WAHELP.ICO'),FLAT,MSG('See Help Window'), |
  STD(STD:Help),TIP('See Help Window')
                       BUTTON('Word'),AT(5,182),USE(?BUTTON1)
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
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED
TakeEvent              PROCEDURE(),BYTE,PROC,DERIVED
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
BRW1                 CLASS(BrowseClass)                    ! Browse using ?Browse:1
Q                      &Queue:Browse:1                !Reference to browse queue
Init                   PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)
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
        udpt.Init(UD,'BrowseSjablonen','VoorrRpt013.clw','VoorrRpt.DLL','04/11/2014 @ 11:38AM')    
             
  GlobalErrors.SetProcedureName('BrowseSjablonen')
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
  Relate:Sjabloon.Open                                     ! File Sjabloon used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:Sjabloon,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  WinAlertMouseZoom()
  Do DefineListboxStyle
  QuickWindow{Prop:Alrt,255} = CtrlShiftP
  BRW1.Q &= Queue:Browse:1
  BRW1.ActiveInvisible = 1
  BRW1.RetainRow = 0
  BRW1.AddSortOrder(,Sja:Sjabloon_PK)                      ! Add the sort order for Sja:Sjabloon_PK for sort order 1
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort0:Locator.Init(,Sja:SjabloonID,1,BRW1)         ! Initialize the browse locator using  using key: Sja:Sjabloon_PK , Sja:SjabloonID
  BRW1.AddField(Sja:SjabloonID,BRW1.Q.Sja:SjabloonID)      ! Field Sja:SjabloonID is a hot field or requires assignment from browse
  BRW1.AddField(Sja:Bestandsnaam,BRW1.Q.Sja:Bestandsnaam)  ! Field Sja:Bestandsnaam is a hot field or requires assignment from browse
  BRW1.AddField(Sja:SoortSjabloon,BRW1.Q.Sja:SoortSjabloon) ! Field Sja:SoortSjabloon is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('BrowseSjablonen',QuickWindow)              ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  BRW1.AskProcedure = 1                                    ! Will call: UpdateSjabloon
  BRW1.AddToolbarTarget(Toolbar)                           ! Browse accepts toolbar control
  BRW1.ToolbarItem.HelpButton = ?Help
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
    Relate:Sjabloon.Close
  END
  IF SELF.Opened
    INIMgr.Update('BrowseSjablonen',QuickWindow)           ! Save window data to non-volatile store
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
    UpdateSjabloon
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
    CASE ACCEPTED()
    OF ?BUTTON1
            	 Loc:tempFile=GETTEMPFILENAME('')
           if Loc:tempFile=''
              Loc:tempFile='jmd.doc'
           Else
              Loc:tempFile=SUB(Loc:tempFile,1,LEN(Clip(Loc:tempFile))-3)&'doc'
           End
      
         GlobalClass.InitWordOle
         Access:Sjabloon.Fetch(SJA:Sjabloon_pk)
      	GlobalClass.OpenWord(SJA:Bestandsnaam)
      
      
      	Loc:Ole{'ActiveDocument.MailMerge.CreateDataSource("'&Loc:tempFile&'",,,'&GlobalClass.DataSource(Clip(Sja:SoortData))&'" )'}  ! 1= wdOpenFormatDocument
          Loc:Ole{'Application.Documents.Open("'&Loc:tempFile&'")'}   !
      
         !
      
        !  ?Ole{'ActiveDocument.SaveAs("'&Loc:tempFile&'")'}
        !  ?Ole{'ActiveDocument.Close'}           ! als test dan kan ik zien wat hij heeft gefdaan
      	Loc:Ole{GLO:MyWordDoc & '.MailMerge.Destination'}=0    ! wdSendToNewDocument=0
      	Loc:Ole{'Application.Visible'}=TRUE
         !      ?Ole{MyWordDoc & '.MailMerge.Execute'}
         ! ?Ole{MyWordDoc&'.Close(0)'}      ! 0=wdDoNotSaveChanges
          ! en dan eigenlijst het tempbestandje verwijderen
         ! IF Exists(Loc:tempFile) Then Remove(Loc:tempFile).
         ! ?Ole{'ActiveDocument.SaveAs("'&Loc:Bestandsnaam&'",,,"SUPERBINK")'}   ! en nu opslaan onder het ID
          
         
                    
    END
  ReturnValue = PARENT.TakeAccepted()
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
     IF KEYCODE()=CtrlShiftP AND EVENT() = Event:PreAlertKey
       CYCLE
     END
     IF KEYCODE()=CtrlShiftP  
        UD.ShowProcedureInfo('BrowseSjablonen',UD.SetApplicationName('VoorrRpt','DLL'),QuickWindow{PROP:Hlp},'06/10/2011 @ 11:53AM','04/11/2014 @ 11:38AM','05/15/2020 @ 11:19AM')  
    
       CYCLE
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


BRW1.Init PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)

  CODE
  PARENT.Init(ListBox,Posit,V,Q,RM,WM)
  IF WM.Request <> ViewRecord                              ! If called for anything other than ViewMode, make the insert, change & delete controls available
    SELF.InsertControl=?Insert:3
    SELF.ChangeControl=?Change:3
    SELF.DeleteControl=?Delete:3
  END
  SELF.ViewControl = ?View:2                               ! Setup the control used to initiate view only mode


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window

