

   MEMBER('VoorrPln.clw')                                  ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABPOPUP.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('VOORRPLN034.INC'),ONCE        !Local module procedure declarations
                     END


!!! <summary>
!!! Generated from procedure template - Window
!!! Browse the Planning file
!!! </summary>
BrowseOverboeking PROCEDURE 

CurrentTab           STRING(80)                            ! 
LOC:MaxCelID         LONG                                  ! 
LOC:MinCelID         LONG                                  ! 
LOC:NietVerwerkt     BYTE                                  ! 
BRW1::View:Browse    VIEW(Planning)
                       PROJECT(Pla:OverboekingPlanningID)
                       PROJECT(Pla:Planning_DATE)
                       PROJECT(Pla:Planning_TIME)
                       PROJECT(Pla:OverboekSoort)
                       PROJECT(Pla:KG)
                       PROJECT(Pla:Pallets)
                       PROJECT(Pla:Instructie)
                       PROJECT(Pla:Transport)
                       PROJECT(Pla:OverboekCelLocatieID)
                       PROJECT(Pla:PlanningID)
                       PROJECT(Pla:OverboekingCelID)
                       PROJECT(Pla:Planning)
                       PROJECT(Pla:Verwerkt)
                       PROJECT(Pla:ArtikelID)
                       PROJECT(Pla:CelID)
                       PROJECT(Pla:PartijID)
                       PROJECT(Pla:CelLocatieID)
                       JOIN(Art:Artikel_PK,Pla:ArtikelID)
                         PROJECT(Art:ArtikelID)
                         PROJECT(Art:ArtikelOms)
                       END
                       JOIN(CEL:CEL_PK,Pla:CelID)
                         PROJECT(CEL:CelOms)
                         PROJECT(CEL:CelID)
                       END
                       JOIN(ACel:CEL_PK,Pla:OverboekingCelID)
                         PROJECT(ACel:CelOms)
                         PROJECT(ACel:CelID)
                       END
                       JOIN(Par:Partij_PK,Pla:PartijID)
                         PROJECT(Par:PartijID)
                         PROJECT(Par:ExternPartijnr)
                       END
                       JOIN(CL:PK_CelLocatie,Pla:CelLocatieID)
                         PROJECT(CL:Locatienaam)
                         PROJECT(CL:CelLocatieID)
                       END
                       JOIN(ACL:PK_CelLocatie,Pla:OverboekCelLocatieID)
                         PROJECT(ACL:Locatienaam)
                         PROJECT(ACL:CelLocatieID)
                       END
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
Art:ArtikelID          LIKE(Art:ArtikelID)            !List box control field - type derived from field
Art:ArtikelID_NormalFG LONG                           !Normal forground color
Art:ArtikelID_NormalBG LONG                           !Normal background color
Art:ArtikelID_SelectedFG LONG                         !Selected forground color
Art:ArtikelID_SelectedBG LONG                         !Selected background color
Art:ArtikelOms         LIKE(Art:ArtikelOms)           !List box control field - type derived from field
Art:ArtikelOms_NormalFG LONG                          !Normal forground color
Art:ArtikelOms_NormalBG LONG                          !Normal background color
Art:ArtikelOms_SelectedFG LONG                        !Selected forground color
Art:ArtikelOms_SelectedBG LONG                        !Selected background color
Pla:OverboekingPlanningID LIKE(Pla:OverboekingPlanningID) !List box control field - type derived from field
Pla:OverboekingPlanningID_NormalFG LONG               !Normal forground color
Pla:OverboekingPlanningID_NormalBG LONG               !Normal background color
Pla:OverboekingPlanningID_SelectedFG LONG             !Selected forground color
Pla:OverboekingPlanningID_SelectedBG LONG             !Selected background color
Pla:OverboekingPlanningID_Icon LONG                   !Entry's icon ID
Pla:Planning_DATE      LIKE(Pla:Planning_DATE)        !List box control field - type derived from field
Pla:Planning_DATE_NormalFG LONG                       !Normal forground color
Pla:Planning_DATE_NormalBG LONG                       !Normal background color
Pla:Planning_DATE_SelectedFG LONG                     !Selected forground color
Pla:Planning_DATE_SelectedBG LONG                     !Selected background color
Pla:Planning_TIME      LIKE(Pla:Planning_TIME)        !List box control field - type derived from field
Pla:Planning_TIME_NormalFG LONG                       !Normal forground color
Pla:Planning_TIME_NormalBG LONG                       !Normal background color
Pla:Planning_TIME_SelectedFG LONG                     !Selected forground color
Pla:Planning_TIME_SelectedBG LONG                     !Selected background color
Pla:OverboekSoort      LIKE(Pla:OverboekSoort)        !List box control field - type derived from field
Pla:OverboekSoort_NormalFG LONG                       !Normal forground color
Pla:OverboekSoort_NormalBG LONG                       !Normal background color
Pla:OverboekSoort_SelectedFG LONG                     !Selected forground color
Pla:OverboekSoort_SelectedBG LONG                     !Selected background color
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
Par:PartijID           LIKE(Par:PartijID)             !List box control field - type derived from field
Par:PartijID_NormalFG  LONG                           !Normal forground color
Par:PartijID_NormalBG  LONG                           !Normal background color
Par:PartijID_SelectedFG LONG                          !Selected forground color
Par:PartijID_SelectedBG LONG                          !Selected background color
Par:ExternPartijnr     LIKE(Par:ExternPartijnr)       !List box control field - type derived from field
Par:ExternPartijnr_NormalFG LONG                      !Normal forground color
Par:ExternPartijnr_NormalBG LONG                      !Normal background color
Par:ExternPartijnr_SelectedFG LONG                    !Selected forground color
Par:ExternPartijnr_SelectedBG LONG                    !Selected background color
CEL:CelOms             LIKE(CEL:CelOms)               !List box control field - type derived from field
CEL:CelOms_NormalFG    LONG                           !Normal forground color
CEL:CelOms_NormalBG    LONG                           !Normal background color
CEL:CelOms_SelectedFG  LONG                           !Selected forground color
CEL:CelOms_SelectedBG  LONG                           !Selected background color
CL:Locatienaam         LIKE(CL:Locatienaam)           !List box control field - type derived from field
CL:Locatienaam_NormalFG LONG                          !Normal forground color
CL:Locatienaam_NormalBG LONG                          !Normal background color
CL:Locatienaam_SelectedFG LONG                        !Selected forground color
CL:Locatienaam_SelectedBG LONG                        !Selected background color
ACel:CelOms            LIKE(ACel:CelOms)              !List box control field - type derived from field
ACel:CelOms_NormalFG   LONG                           !Normal forground color
ACel:CelOms_NormalBG   LONG                           !Normal background color
ACel:CelOms_SelectedFG LONG                           !Selected forground color
ACel:CelOms_SelectedBG LONG                           !Selected background color
ACL:Locatienaam        LIKE(ACL:Locatienaam)          !List box control field - type derived from field
ACL:Locatienaam_NormalFG LONG                         !Normal forground color
ACL:Locatienaam_NormalBG LONG                         !Normal background color
ACL:Locatienaam_SelectedFG LONG                       !Selected forground color
ACL:Locatienaam_SelectedBG LONG                       !Selected background color
Pla:Instructie         LIKE(Pla:Instructie)           !List box control field - type derived from field
Pla:Instructie_NormalFG LONG                          !Normal forground color
Pla:Instructie_NormalBG LONG                          !Normal background color
Pla:Instructie_SelectedFG LONG                        !Selected forground color
Pla:Instructie_SelectedBG LONG                        !Selected background color
Pla:Transport          LIKE(Pla:Transport)            !List box control field - type derived from field
Pla:Transport_NormalFG LONG                           !Normal forground color
Pla:Transport_NormalBG LONG                           !Normal background color
Pla:Transport_SelectedFG LONG                         !Selected forground color
Pla:Transport_SelectedBG LONG                         !Selected background color
Pla:OverboekCelLocatieID LIKE(Pla:OverboekCelLocatieID) !Browse hot field - type derived from field
Pla:PlanningID         LIKE(Pla:PlanningID)           !Primary key field - type derived from field
Pla:OverboekingCelID   LIKE(Pla:OverboekingCelID)     !Browse key field - type derived from field
Pla:Planning           LIKE(Pla:Planning)             !Browse key field - type derived from field
Pla:Verwerkt           LIKE(Pla:Verwerkt)             !Browse key field - type derived from field
CEL:CelID              LIKE(CEL:CelID)                !Related join file key field - type derived from field
ACel:CelID             LIKE(ACel:CelID)               !Related join file key field - type derived from field
CL:CelLocatieID        LIKE(CL:CelLocatieID)          !Related join file key field - type derived from field
ACL:CelLocatieID       LIKE(ACL:CelLocatieID)         !Related join file key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
LocEnableEnterByTab  BYTE(1)                               !Used by the ENTER Instead of Tab template
EnterByTabManager    EnterByTabClass
NetLocalRefreshDate     Long     ! NetTalk (NetRefresh)
NetLocalRefreshTime     Long
NetLocalDependancies    String('|Planning|ViewArtikel|Cel|ACel|Partij|CelLocatie|ACelLocatie|')
QuickWindow          WINDOW('Overboekingen'),AT(,,358,208),FONT('MS Sans Serif',8,,FONT:regular,CHARSET:DEFAULT), |
  RESIZE,MAXIMIZE,CENTER,GRAY,IMM,MAX,MDI,HLP('BrowseOverboeking'),SYSTEM
                       LIST,AT(8,29,342,135),USE(?Browse:1),HVSCROLL,FORMAT('65L(2)|M*~Artikel ID~C(0)@s30@197' & |
  'L(2)|M*~Artikel~C(0)@s60@40C(2)|M*I~Gekoppeld~C(0)@p p@[49R(2)|M*~Datum~C(0)@d6-@26R' & |
  '(2)|M*~Tijd~C(0)@t7@]|~Planning~81C(2)|M*~Overboek Soort~L(0)@s50@44R(2)|M*~KG~C(0)@' & |
  'n-15`2@41R(2)|M*~Pallets~C(0)@n-14.@[38R(2)|M*~Intern~C(0)@n_8B@60R(2)|M*~Extern~C(1' & |
  ')@s20@](77)|~Partij~[40L(2)|M*~Van~C(0)@s50@55L(2)|M*~Locatie~C(0)@s50@40L(2)|M*~Naa' & |
  'r~C(0)@s50@42L(2)|M*~Locatie~@s50@]|~Overboeking~100L(2)|M*~Instructie~C(0)@s100@100' & |
  'L(2)|M*~Transport~C(0)@s100@'),FROM(Queue:Browse:1),IMM,MSG('Browsing the Planning file')
                       SHEET,AT(4,4,350,182),USE(?CurrentTab)
                         TAB('&Niet-verwerkte Overboekingen'),USE(?Tab:2)
                         END
                         TAB('&Verwerkte Overboekingen'),USE(?Tab:9)
                         END
                       END
                       BUTTON('&Close'),AT(302,190,49,14),USE(?Close),LEFT,ICON('WACLOSE.ICO'),FLAT,MSG('Close Window'), |
  TIP('Close Window')
                       BUTTON('Sjabloon'),AT(4,188,51,17),USE(?SjabloonButton)
                       BUTTON('&Change'),AT(265,169,42,12),USE(?Change)
                       BUTTON('&Insert'),AT(223,169,42,12),USE(?Insert)
                       BUTTON('&Delete'),AT(307,169,42,12),USE(?Delete)
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
Ask                    PROCEDURE(BYTE Request),BYTE,PROC,DERIVED
Fetch                  PROCEDURE(BYTE Direction),DERIVED
Init                   PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)
ResetSort              PROCEDURE(BYTE Force),BYTE,PROC,DERIVED
SetQueueRecord         PROCEDURE(),DERIVED
                     END

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
  GlobalErrors.SetProcedureName('BrowseOverboeking')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  GLO:Overboeking_ThreadID = THREAD()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Browse:1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('Pla:PlanningID',Pla:PlanningID)                    ! Added by: BrowseBox(ABC)
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  IF SELF.Request = SelectRecord
     SELF.AddItem(?Close,RequestCancelled)                 ! Add the close control to the window manger
  ELSE
     SELF.AddItem(?Close,RequestCompleted)                 ! Add the close control to the window manger
  END
  	LOC:NietVerwerkt = 0
  	LOC:MinCelID = 1
  	CLEAR(LOC:MaxCelID,1)
  Relate:Planning.SetOpenRelated()
  Relate:Planning.Open                                     ! File Planning used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:Planning,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  0{Prop:Text}=CLIP(0{Prop:Text}) !& ' (' & CLIP(LEFT(FORMAT(GLO:Overboeking_ThreadID,@N_10))) & ')'
  IF GLO:HidePlanningInstructie = 1 THEN 
      ?Browse:1{PROPLIST:Width, 16} = 0
  END
  WinAlertMouseZoom()
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1.FileLoaded = 1                                      ! This is a 'file loaded' browse
  BRW1.AddSortOrder(,Pla:OverboekingCelID_Planning_K)      ! Add the sort order for Pla:OverboekingCelID_Planning_K for sort order 1
  BRW1.SetFilter('(Pla:Verwerkt=1 AND Pla:OverboekingCelID>0)') ! Apply filter expression to browse
  BRW1.AddSortOrder(,Pla:Verwerkt_OverboekingCelID_Planning_K) ! Add the sort order for Pla:Verwerkt_OverboekingCelID_Planning_K for sort order 2
  BRW1.SetFilter('(Pla:Verwerkt=0 AND Pla:OverboekingCelID>0)') ! Apply filter expression to browse
  ?Browse:1{PROP:IconList,1} = '~off.ico'
  ?Browse:1{PROP:IconList,2} = '~on.ico'
  BRW1.AddField(Art:ArtikelID,BRW1.Q.Art:ArtikelID)        ! Field Art:ArtikelID is a hot field or requires assignment from browse
  BRW1.AddField(Art:ArtikelOms,BRW1.Q.Art:ArtikelOms)      ! Field Art:ArtikelOms is a hot field or requires assignment from browse
  BRW1.AddField(Pla:OverboekingPlanningID,BRW1.Q.Pla:OverboekingPlanningID) ! Field Pla:OverboekingPlanningID is a hot field or requires assignment from browse
  BRW1.AddField(Pla:Planning_DATE,BRW1.Q.Pla:Planning_DATE) ! Field Pla:Planning_DATE is a hot field or requires assignment from browse
  BRW1.AddField(Pla:Planning_TIME,BRW1.Q.Pla:Planning_TIME) ! Field Pla:Planning_TIME is a hot field or requires assignment from browse
  BRW1.AddField(Pla:OverboekSoort,BRW1.Q.Pla:OverboekSoort) ! Field Pla:OverboekSoort is a hot field or requires assignment from browse
  BRW1.AddField(Pla:KG,BRW1.Q.Pla:KG)                      ! Field Pla:KG is a hot field or requires assignment from browse
  BRW1.AddField(Pla:Pallets,BRW1.Q.Pla:Pallets)            ! Field Pla:Pallets is a hot field or requires assignment from browse
  BRW1.AddField(Par:PartijID,BRW1.Q.Par:PartijID)          ! Field Par:PartijID is a hot field or requires assignment from browse
  BRW1.AddField(Par:ExternPartijnr,BRW1.Q.Par:ExternPartijnr) ! Field Par:ExternPartijnr is a hot field or requires assignment from browse
  BRW1.AddField(CEL:CelOms,BRW1.Q.CEL:CelOms)              ! Field CEL:CelOms is a hot field or requires assignment from browse
  BRW1.AddField(CL:Locatienaam,BRW1.Q.CL:Locatienaam)      ! Field CL:Locatienaam is a hot field or requires assignment from browse
  BRW1.AddField(ACel:CelOms,BRW1.Q.ACel:CelOms)            ! Field ACel:CelOms is a hot field or requires assignment from browse
  BRW1.AddField(ACL:Locatienaam,BRW1.Q.ACL:Locatienaam)    ! Field ACL:Locatienaam is a hot field or requires assignment from browse
  BRW1.AddField(Pla:Instructie,BRW1.Q.Pla:Instructie)      ! Field Pla:Instructie is a hot field or requires assignment from browse
  BRW1.AddField(Pla:Transport,BRW1.Q.Pla:Transport)        ! Field Pla:Transport is a hot field or requires assignment from browse
  BRW1.AddField(Pla:OverboekCelLocatieID,BRW1.Q.Pla:OverboekCelLocatieID) ! Field Pla:OverboekCelLocatieID is a hot field or requires assignment from browse
  BRW1.AddField(Pla:PlanningID,BRW1.Q.Pla:PlanningID)      ! Field Pla:PlanningID is a hot field or requires assignment from browse
  BRW1.AddField(Pla:OverboekingCelID,BRW1.Q.Pla:OverboekingCelID) ! Field Pla:OverboekingCelID is a hot field or requires assignment from browse
  BRW1.AddField(Pla:Planning,BRW1.Q.Pla:Planning)          ! Field Pla:Planning is a hot field or requires assignment from browse
  BRW1.AddField(Pla:Verwerkt,BRW1.Q.Pla:Verwerkt)          ! Field Pla:Verwerkt is a hot field or requires assignment from browse
  BRW1.AddField(CEL:CelID,BRW1.Q.CEL:CelID)                ! Field CEL:CelID is a hot field or requires assignment from browse
  BRW1.AddField(ACel:CelID,BRW1.Q.ACel:CelID)              ! Field ACel:CelID is a hot field or requires assignment from browse
  BRW1.AddField(CL:CelLocatieID,BRW1.Q.CL:CelLocatieID)    ! Field CL:CelLocatieID is a hot field or requires assignment from browse
  BRW1.AddField(ACL:CelLocatieID,BRW1.Q.ACL:CelLocatieID)  ! Field ACL:CelLocatieID is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('BrowseOverboeking',QuickWindow)            ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  BRW1.AskProcedure = 1                                    ! Will call: UpdateOverboeking
  SELF.SetAlerts()
  NetLocalRefreshDate = today()         ! NetTalk (NetRefresh)
  NetLocalRefreshTime = clock()
  EnterByTabManager.Init(False)
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  GLO:Overboeking_ThreadID = 0
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:Planning.Close
  END
  IF SELF.Opened
    INIMgr.Update('BrowseOverboeking',QuickWindow)         ! Save window data to non-volatile store
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
    UpdateOverboeking
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
    OF ?SjabloonButton
      Get(BRW1.Q,Choice(?Browse:1))
      Pla:PlanningID = BRW1.Q.Pla:PlanningID
      IF Access:Planning.TryFetch(Pla:PK_Planning) <> Level:Benign THEN
      	RETURN ReturnValue
      .
      
      ReportOverboeking(Pla:PlanningID)
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
    OF EVENT:Notify
        ! Focus overnemen
        !NOTIFICATION(LOC:NotifyCode)
        !IF LOC:NotifyCode = 1 THEN
            ThisWindow{Prop:Active} = 1
        !END
    OF EVENT:OpenWindow
        post(event:visibleondesktop)
    END
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue


BRW1.Ask PROCEDURE(BYTE Request)

ReturnValue          BYTE,AUTO

  CODE
  IF Request = ChangeRecord AND Pla:Verwerkt THEN
     !Request = ViewRecord
  ELSIF Request = DeleteRecord AND Pla:Verwerkt THEN
      MESSAGE('Geplande overboeking is al verwerkt. Kan dus niet meer verwijderd worden. Draai de mutatie eventueel eerst terug.', 'Al uitgevoerd', ICON:Exclamation)
      RETURN Level:Benign
  END
  ReturnValue = PARENT.Ask(Request)
  RETURN ReturnValue


BRW1.Fetch PROCEDURE(BYTE Direction)

GreenBarIndex   LONG,AUTO
  CODE
  PARENT.Fetch(Direction)
  !----------------------------------------------------------------------
    LOOP GreenBarIndex=1 TO RECORDS(SELF.Q)
      GET(SELF.Q,GreenBarIndex)
      SELF.Q.Art:ArtikelID_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for Art:ArtikelID
      SELF.Q.Art:ArtikelID_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.Art:ArtikelID_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Art:ArtikelID_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Art:ArtikelOms_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for Art:ArtikelOms
      SELF.Q.Art:ArtikelOms_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.Art:ArtikelOms_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Art:ArtikelOms_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla:OverboekingPlanningID_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for Pla:OverboekingPlanningID
      SELF.Q.Pla:OverboekingPlanningID_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.Pla:OverboekingPlanningID_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla:OverboekingPlanningID_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla:Planning_DATE_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for Pla:Planning_DATE
      SELF.Q.Pla:Planning_DATE_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.Pla:Planning_DATE_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla:Planning_DATE_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla:Planning_TIME_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for Pla:Planning_TIME
      SELF.Q.Pla:Planning_TIME_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.Pla:Planning_TIME_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla:Planning_TIME_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla:OverboekSoort_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for Pla:OverboekSoort
      SELF.Q.Pla:OverboekSoort_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.Pla:OverboekSoort_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla:OverboekSoort_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla:KG_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for Pla:KG
      SELF.Q.Pla:KG_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.Pla:KG_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla:KG_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla:Pallets_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for Pla:Pallets
      SELF.Q.Pla:Pallets_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.Pla:Pallets_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla:Pallets_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Par:PartijID_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for Par:PartijID
      SELF.Q.Par:PartijID_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.Par:PartijID_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Par:PartijID_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Par:ExternPartijnr_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for Par:ExternPartijnr
      SELF.Q.Par:ExternPartijnr_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.Par:ExternPartijnr_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Par:ExternPartijnr_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.CEL:CelOms_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for CEL:CelOms
      SELF.Q.CEL:CelOms_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.CEL:CelOms_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.CEL:CelOms_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.CL:Locatienaam_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for CL:Locatienaam
      SELF.Q.CL:Locatienaam_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.CL:Locatienaam_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.CL:Locatienaam_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.ACel:CelOms_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for ACel:CelOms
      SELF.Q.ACel:CelOms_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.ACel:CelOms_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.ACel:CelOms_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.ACL:Locatienaam_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for ACL:Locatienaam
      SELF.Q.ACL:Locatienaam_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.ACL:Locatienaam_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.ACL:Locatienaam_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla:Instructie_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for Pla:Instructie
      SELF.Q.Pla:Instructie_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.Pla:Instructie_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla:Instructie_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla:Transport_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for Pla:Transport
      SELF.Q.Pla:Transport_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.Pla:Transport_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla:Transport_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      PUT(SELF.Q)
    END
  !----------------------------------------------------------------------


BRW1.Init PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)

  CODE
  PARENT.Init(ListBox,Posit,V,Q,RM,WM)
  IF WM.Request <> ViewRecord                              ! If called for anything other than ViewMode, make the insert, change & delete controls available
    SELF.InsertControl=?Insert
    SELF.ChangeControl=?Change
    SELF.DeleteControl=?Delete
  END


BRW1.ResetSort PROCEDURE(BYTE Force)

ReturnValue          BYTE,AUTO

  CODE
  IF CHOICE(?CurrentTab) = 2
    RETURN SELF.SetSort(1,Force)
  ELSE
    RETURN SELF.SetSort(2,Force)
  END
  ReturnValue = PARENT.ResetSort(Force)
  RETURN ReturnValue


BRW1.SetQueueRecord PROCEDURE

  CODE
  PARENT.SetQueueRecord
  
  IF (Pla:OverboekingPlanningID > 0)
    SELF.Q.Pla:OverboekingPlanningID_Icon = 2              ! Set icon from icon list
  ELSE
    SELF.Q.Pla:OverboekingPlanningID_Icon = 1              ! Set icon from icon list
  END
  !----------------------------------------------------------------------
      SELF.Q.Art:ArtikelID_NormalFG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1) ! Set color values for Art:ArtikelID
      SELF.Q.Art:ArtikelID_NormalBG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,8454143)
      SELF.Q.Art:ArtikelID_SelectedFG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.Art:ArtikelID_SelectedBG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.Art:ArtikelOms_NormalFG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1) ! Set color values for Art:ArtikelOms
      SELF.Q.Art:ArtikelOms_NormalBG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,8454143)
      SELF.Q.Art:ArtikelOms_SelectedFG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.Art:ArtikelOms_SelectedBG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.Pla:OverboekingPlanningID_NormalFG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1) ! Set color values for Pla:OverboekingPlanningID
      SELF.Q.Pla:OverboekingPlanningID_NormalBG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,8454143)
      SELF.Q.Pla:OverboekingPlanningID_SelectedFG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.Pla:OverboekingPlanningID_SelectedBG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.Pla:Planning_DATE_NormalFG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1) ! Set color values for Pla:Planning_DATE
      SELF.Q.Pla:Planning_DATE_NormalBG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,8454143)
      SELF.Q.Pla:Planning_DATE_SelectedFG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.Pla:Planning_DATE_SelectedBG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.Pla:Planning_TIME_NormalFG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1) ! Set color values for Pla:Planning_TIME
      SELF.Q.Pla:Planning_TIME_NormalBG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,8454143)
      SELF.Q.Pla:Planning_TIME_SelectedFG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.Pla:Planning_TIME_SelectedBG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.Pla:OverboekSoort_NormalFG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1) ! Set color values for Pla:OverboekSoort
      SELF.Q.Pla:OverboekSoort_NormalBG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,8454143)
      SELF.Q.Pla:OverboekSoort_SelectedFG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.Pla:OverboekSoort_SelectedBG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.Pla:KG_NormalFG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1) ! Set color values for Pla:KG
      SELF.Q.Pla:KG_NormalBG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,8454143)
      SELF.Q.Pla:KG_SelectedFG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.Pla:KG_SelectedBG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.Pla:Pallets_NormalFG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1) ! Set color values for Pla:Pallets
      SELF.Q.Pla:Pallets_NormalBG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,8454143)
      SELF.Q.Pla:Pallets_SelectedFG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.Pla:Pallets_SelectedBG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.Par:PartijID_NormalFG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1) ! Set color values for Par:PartijID
      SELF.Q.Par:PartijID_NormalBG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,8454143)
      SELF.Q.Par:PartijID_SelectedFG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.Par:PartijID_SelectedBG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.Par:ExternPartijnr_NormalFG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1) ! Set color values for Par:ExternPartijnr
      SELF.Q.Par:ExternPartijnr_NormalBG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,8454143)
      SELF.Q.Par:ExternPartijnr_SelectedFG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.Par:ExternPartijnr_SelectedBG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.CEL:CelOms_NormalFG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1) ! Set color values for CEL:CelOms
      SELF.Q.CEL:CelOms_NormalBG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,8454143)
      SELF.Q.CEL:CelOms_SelectedFG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.CEL:CelOms_SelectedBG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.CL:Locatienaam_NormalFG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1) ! Set color values for CL:Locatienaam
      SELF.Q.CL:Locatienaam_NormalBG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,8454143)
      SELF.Q.CL:Locatienaam_SelectedFG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.CL:Locatienaam_SelectedBG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.ACel:CelOms_NormalFG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1) ! Set color values for ACel:CelOms
      SELF.Q.ACel:CelOms_NormalBG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,8454143)
      SELF.Q.ACel:CelOms_SelectedFG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.ACel:CelOms_SelectedBG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.ACL:Locatienaam_NormalFG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1) ! Set color values for ACL:Locatienaam
      SELF.Q.ACL:Locatienaam_NormalBG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,8454143)
      SELF.Q.ACL:Locatienaam_SelectedFG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.ACL:Locatienaam_SelectedBG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.Pla:Instructie_NormalFG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1) ! Set color values for Pla:Instructie
      SELF.Q.Pla:Instructie_NormalBG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,8454143)
      SELF.Q.Pla:Instructie_SelectedFG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.Pla:Instructie_SelectedBG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.Pla:Transport_NormalFG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1) ! Set color values for Pla:Transport
      SELF.Q.Pla:Transport_NormalBG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,8454143)
      SELF.Q.Pla:Transport_SelectedFG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.Pla:Transport_SelectedBG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
  !----------------------------------------------------------------------


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window

