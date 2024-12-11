

   MEMBER('Voorraad.clw')                                  ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABDROPS.INC'),ONCE
   INCLUDE('ABPOPUP.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('VOORRAAD025.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('VOORRAAD027.INC'),ONCE        !Req'd for module callout resolution
                     END



  


!!! <summary>
!!! Generated from procedure template - Window
!!! Browse the GebruikerLog file
!!! </summary>
BrowseGebruikerLog PROCEDURE 

udpt            UltimateDebugProcedureTracker
CurrentTab           STRING(80)                            ! 
LOC:GebruikerID      LONG                                  ! 
LOC:WindowsInlog     CSTRING(51)                           ! 
LOC:Datum            DATE                                  ! 
BRW1::View:Browse    VIEW(GebruikerLog)
                       PROJECT(Log:WindowsInlog)
                       PROJECT(Log:Uitgevoerd_DATE)
                       PROJECT(Log:Uitgevoerd_TIME)
                       PROJECT(Log:Handeling)
                       PROJECT(Log:HandelingOpmerking)
                       PROJECT(Log:Tabel)
                       PROJECT(Log:RecordInhoudPre)
                       PROJECT(Log:ID)
                       PROJECT(Log:Uitgevoerd)
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
Log:WindowsInlog       LIKE(Log:WindowsInlog)         !List box control field - type derived from field
Log:Uitgevoerd_DATE    LIKE(Log:Uitgevoerd_DATE)      !List box control field - type derived from field
Log:Uitgevoerd_TIME    LIKE(Log:Uitgevoerd_TIME)      !List box control field - type derived from field
Log:Handeling          LIKE(Log:Handeling)            !List box control field - type derived from field
Log:HandelingOpmerking LIKE(Log:HandelingOpmerking)   !List box control field - type derived from field
Log:Tabel              LIKE(Log:Tabel)                !List box control field - type derived from field
Log:RecordInhoudPre    LIKE(Log:RecordInhoudPre)      !List box control field - type derived from field
LOC:Datum              LIKE(LOC:Datum)                !Browse hot field - type derived from local data
Log:ID                 LIKE(Log:ID)                   !Primary key field - type derived from field
Log:Uitgevoerd         LIKE(Log:Uitgevoerd)           !Browse key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
FDCB3::View:FileDropCombo VIEW(Gebruiker)
                       PROJECT(Geb:WindowsInlog)
                       PROJECT(Geb:ID)
                     END
Queue:FileDropCombo  QUEUE                            !
Geb:WindowsInlog       LIKE(Geb:WindowsInlog)         !List box control field - type derived from field
Geb:ID                 LIKE(Geb:ID)                   !Primary key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
LocEnableEnterByTab  BYTE(1)                               !Used by the ENTER Instead of Tab template
EnterByTabManager    EnterByTabClass
NetLocalRefreshDate     Long     ! NetTalk (NetRefresh)
NetLocalRefreshTime     Long
NetLocalDependancies    String('|GebruikerLog|Gebruiker|')
QuickWindow          WINDOW('Log'),AT(,,401,303),FONT('MS Sans Serif',8,,FONT:regular,CHARSET:DEFAULT),RESIZE,CENTER, |
  GRAY,IMM,MAX,MDI,HLP('BrowseGebruikerLog'),SYSTEM
                       LIST,AT(12,23,379,128),USE(?Browse:1),HVSCROLL,FORMAT('50L(2)|M~Gebruiker~C(2)@s50@[50R' & |
  '(2)|M@d6-@80R(2)|M@T1@](75)|~Uitgevoerd~50L(2)|M~Handeling~C(2)@s20@100L(2)|M~Handel' & |
  'ing Opmerking~C(2)@s100@50L(2)|M~Tabel~C(2)@s30@1020L(2)|M~Record-Inhoud~@s255@'),FROM(Queue:Browse:1), |
  IMM,MSG('Browsing the GebruikerLog file')
                       SHEET,AT(5,4,393,172),USE(?CurrentTab)
                         TAB('&1) Op Uitvoerdatum'),USE(?Tab:2)
                           PROMPT('Uitvoerdatum:'),AT(15,156),USE(?LOC:Datum:Prompt:2),TRN
                           SPIN(@d17),AT(65,157,60,10),USE(LOC:Datum,,?LOC:Datum:2)
                         END
                         TAB('&2) Per Gebruiker / Op Uitvoerdatum'),USE(?Tab:3)
                           COMBO(@s50),AT(52,158,,13),USE(Geb:WindowsInlog),DROP(5),FORMAT('200L(2)|M~Windows Inlo' & |
  'g~L(0)@s50@'),FROM(Queue:FileDropCombo),IMM
                           PROMPT('Gebruiker:'),AT(11,160,40,10),USE(?GebruikerPrompt),TRN
                         END
                         TAB('3) Op Invoegvolgorde'),USE(?TAB1)
                         END
                       END
                       BUTTON('&Sluiten'),AT(323,281,71,18),USE(?Close),LEFT,ICON('WACLOSE.ICO'),FLAT,MSG('Close Window'), |
  TIP('Close Window')
                       BUTTON('&Bekijken'),AT(323,154,71,18),USE(?View),LEFT,ICON('WAView.ico'),DEFAULT,FLAT
                       BUTTON('&Insert'),AT(312,4,42,12),USE(?Insert),DISABLE,HIDE
                       GROUP('Data Filter Center'),AT(7,179,390,98),USE(?Group1:2),BOXED
                         LIST,AT(13,192,377,60),USE(?FilterList:2),VSCROLL,ALRT(ShiftMouseLeft),ALRT(MouseLeft2),ALRT(InsertKey), |
  ALRT(DeleteKey),FORMAT('60L(2)|M~Column~@s25@80L(2)|M~Operator~@s20@120L(2)|M~Value/E' & |
  'xpression~@s40@20L(2)|M~Connecting Operator~@s25@')
                         CHECK('Case sensitive search for string'),AT(13,256,125,14),USE(?checkCase:2)
                         BUTTON('Reset'),AT(147,256,45,14),USE(?btnReset:2)
                         BUTTON('Save Query'),AT(196,256,45,14),USE(?BtnSaveQuery:2)
                         BUTTON('Save As'),AT(247,256,45,14),USE(?BtnSaveAs:2)
                         BUTTON('Load Query'),AT(296,256,45,14),USE(?BtnLoadQuery:2)
                         BUTTON('Apply'),AT(347,256,45,14),USE(?btnApply:2)
                       END
                       BUTTON('Terugzetten '),AT(258,156),USE(?Terugzetten)
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
TakeFieldEvent         PROCEDURE(),BYTE,PROC,DERIVED
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
BRW1                 CLASS(BrowseClass)                    ! Browse using ?Browse:1
Q                      &Queue:Browse:1                !Reference to browse queue
Init                   PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)
ResetSort              PROCEDURE(BYTE Force),BYTE,PROC,DERIVED
SetAlerts              PROCEDURE(),DERIVED
                     END

BRW1::Sort0:Locator  StepLocatorClass                      ! Default Locator
BRW1::Sort1:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 2
BRW1::Sort2:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 3
BRW1::Sort0:StepClass StepStringClass                      ! Default Step Manager
BRW1::Sort1:StepClass StepStringClass                      ! Conditional Step Manager - CHOICE(?CurrentTab) = 2
BRW1::Sort2:StepClass StepLongClass                        ! Conditional Step Manager - CHOICE(?CurrentTab) = 3
FilterObj            class(cFilterList)
                     end
QueueField        any  
FilterObj_checkBox   byte
Resizer              CLASS(WindowResizeClass)
Init                   PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)
                     END

FDCB3                CLASS(FileDropComboClass)             ! File drop combo manager
Q                      &Queue:FileDropCombo           !Reference to browse queue type
                     END

LocalClass          CLASS
RestorePartij           PROCEDURE(Log:Record)
RestorePlanning         PROCEDURE(Log:Record)
RestoreVerkoop          PROCEDURE(Log:Record)
RestoreVerpakking          PROCEDURE(Log:Record)
                    END
st              StringTheory
str                 StringTheory
StVeld              StringTheory
Loc:SQLCommando     CString(4000)

  CODE
? DEBUGHOOK(Gebruiker:Record)
? DEBUGHOOK(GebruikerLog:Record)
? DEBUGHOOK(Partij:Record)
? DEBUGHOOK(Planning:Record)
? DEBUGHOOK(Verkoop:Record)
? DEBUGHOOK(Verpakking:Record)
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
        udpt.Init(UD,'BrowseGebruikerLog','Voorraad025.clw','Voorraad.EXE','06/01/2021 @ 06:42PM')    
             
  GlobalErrors.SetProcedureName('BrowseGebruikerLog')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Browse:1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('LOC:Datum',LOC:Datum)                              ! Added by: BrowseBox(ABC)
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  IF SELF.Request = SelectRecord
     SELF.AddItem(?Close,RequestCancelled)                 ! Add the close control to the window manger
  ELSE
     SELF.AddItem(?Close,RequestCompleted)                 ! Add the close control to the window manger
  END
  Relate:Gebruiker.Open                                    ! File Gebruiker used by this procedure, so make sure it's RelationManager is open
  Relate:GebruikerLog.Open                                 ! File GebruikerLog used by this procedure, so make sure it's RelationManager is open
  Relate:Partij.Open                                       ! File Partij used by this procedure, so make sure it's RelationManager is open
  Relate:Planning.SetOpenRelated()
  Relate:Planning.Open                                     ! File Planning used by this procedure, so make sure it's RelationManager is open
  Relate:Verpakking.Open                                   ! File Verpakking used by this procedure, so make sure it's RelationManager is open
  Access:Verkoop.UseFile                                   ! File referenced in 'Other Files' so need to inform it's FileManager
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:GebruikerLog,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  Do DefineListboxStyle
  Alert(AltKeyPressed)  ! WinEvent : These keys cause a program to crash on Windows 7 and Windows 10.
  Alert(F10Key)         !
  Alert(CtrlF10)        !
  Alert(ShiftF10)       !
  Alert(CtrlShiftF10)   !
  Alert(AltSpace)       !
  WinAlertMouseZoom()
  WinAlert(WE::WM_QueryEndSession,,Return1+PostUser)
  ?FilterList:2{prop:dropid, 255} = 'FilterObj'
  ?Browse:1{prop:dragid, 255} = 'FilterObj'
  FilterObj.Init(?FilterList:2, QuickWindow)
  FilterObj.AppName = 'Voorraad'
  FilterObj.ProcName = 'BrowseGebruikerLog'
  FilterObj.InitINI(INIMgr)
  FilterObj.IFilter.addCol('Gebruiker', 'Log:WindowsInlog', datatype:string, '', 0)
  FilterObj.IFilter.addCol('', 'Log:Uitgevoerd_TIME', datatype:time, '@T1', 0)
  FilterObj.IFilter.addCol('', 'Log:Uitgevoerd_TIME', datatype:time, '@T1', 0)
  FilterObj.IFilter.addCol('Handeling', 'Log:Handeling', datatype:string, '', 0)
  FilterObj.IFilter.addCol('Handeling Opmerking', 'Log:HandelingOpmerking', datatype:string, '', 0)
  FilterObj.IFilter.addCol('Tabel', 'Log:Tabel', datatype:string, '', 0)
  FilterObj.IFilter.addCol('Record-Inhoud', 'Log:RecordInhoudPre', datatype:string, '', 0)
  ?checkCase:2{prop:use} = FilterObj_checkBox
  FilterObj_checkBox = 1
  QuickWindow{Prop:Alrt,255} = CtrlShiftP
  BRW1.Q &= Queue:Browse:1
  BRW1.ActiveInvisible = 1
  BRW1.RetainRow = 0
  BRW1::Sort1:StepClass.Init(+ScrollSort:AllowAlpha+ScrollSort:Descending,ScrollBy:Runtime) ! Moveable thumb based upon Log:Uitgevoerd for sort order 1
  BRW1.AddSortOrder(BRW1::Sort1:StepClass,Log:FK2_GebruikerLog) ! Add the sort order for Log:FK2_GebruikerLog for sort order 1
  BRW1.AddRange(Log:WindowsInlog,LOC:WindowsInlog)         ! Add single value range limit for sort order 1
  BRW1.AddLocator(BRW1::Sort1:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort1:Locator.Init(,Log:Uitgevoerd,1,BRW1)         ! Initialize the browse locator using  using key: Log:FK2_GebruikerLog , Log:Uitgevoerd
  BRW1.AddResetField(LOC:WindowsInlog)                     ! Apply the reset field
  BRW1::Sort2:StepClass.Init(+ScrollSort:AllowAlpha)       ! Moveable thumb based upon Log:ID for sort order 2
  BRW1.AddSortOrder(BRW1::Sort2:StepClass,Log:PK_GebruikerLog) ! Add the sort order for Log:PK_GebruikerLog for sort order 2
  BRW1.AddLocator(BRW1::Sort2:Locator)                     ! Browse has a locator for sort order 2
  BRW1::Sort2:Locator.Init(,Log:ID,1,BRW1)                 ! Initialize the browse locator using  using key: Log:PK_GebruikerLog , Log:ID
  BRW1::Sort0:StepClass.Init(+ScrollSort:AllowAlpha+ScrollSort:Descending,ScrollBy:Runtime) ! Moveable thumb based upon Log:Uitgevoerd for sort order 3
  BRW1.AddSortOrder(BRW1::Sort0:StepClass,Log:FK1_GebruikerLog) ! Add the sort order for Log:FK1_GebruikerLog for sort order 3
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 3
  BRW1::Sort0:Locator.Init(,Log:Uitgevoerd,1,BRW1)         ! Initialize the browse locator using  using key: Log:FK1_GebruikerLog , Log:Uitgevoerd
  BRW1.SetFilter('(Log:Uitgevoerd_DATE = LOC:Datum)')      ! Apply filter expression to browse
  BRW1.AddResetField(LOC:Datum)                            ! Apply the reset field
  BRW1.AddField(Log:WindowsInlog,BRW1.Q.Log:WindowsInlog)  ! Field Log:WindowsInlog is a hot field or requires assignment from browse
  BRW1.AddField(Log:Uitgevoerd_DATE,BRW1.Q.Log:Uitgevoerd_DATE) ! Field Log:Uitgevoerd_DATE is a hot field or requires assignment from browse
  BRW1.AddField(Log:Uitgevoerd_TIME,BRW1.Q.Log:Uitgevoerd_TIME) ! Field Log:Uitgevoerd_TIME is a hot field or requires assignment from browse
  BRW1.AddField(Log:Handeling,BRW1.Q.Log:Handeling)        ! Field Log:Handeling is a hot field or requires assignment from browse
  BRW1.AddField(Log:HandelingOpmerking,BRW1.Q.Log:HandelingOpmerking) ! Field Log:HandelingOpmerking is a hot field or requires assignment from browse
  BRW1.AddField(Log:Tabel,BRW1.Q.Log:Tabel)                ! Field Log:Tabel is a hot field or requires assignment from browse
  BRW1.AddField(Log:RecordInhoudPre,BRW1.Q.Log:RecordInhoudPre) ! Field Log:RecordInhoudPre is a hot field or requires assignment from browse
  BRW1.AddField(LOC:Datum,BRW1.Q.LOC:Datum)                ! Field LOC:Datum is a hot field or requires assignment from browse
  BRW1.AddField(Log:ID,BRW1.Q.Log:ID)                      ! Field Log:ID is a hot field or requires assignment from browse
  BRW1.AddField(Log:Uitgevoerd,BRW1.Q.Log:Uitgevoerd)      ! Field Log:Uitgevoerd is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('BrowseGebruikerLog',QuickWindow)           ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  BRW1.AskProcedure = 1                                    ! Will call: UpdateGebruikerLog
  FDCB3.Init(Geb:WindowsInlog,?Geb:WindowsInlog,Queue:FileDropCombo.ViewPosition,FDCB3::View:FileDropCombo,Queue:FileDropCombo,Relate:Gebruiker,ThisWindow,GlobalErrors,0,1,0)
  FDCB3.Q &= Queue:FileDropCombo
  FDCB3.AddSortOrder(Geb:FK1_Gebruiker)
  FDCB3.AddField(Geb:WindowsInlog,FDCB3.Q.Geb:WindowsInlog) !List box control field - type derived from field
  FDCB3.AddField(Geb:ID,FDCB3.Q.Geb:ID) !Primary key field - type derived from field
  FDCB3.AddUpdateField(Geb:WindowsInlog,LOC:WindowsInlog)
  ThisWindow.AddItem(FDCB3.WindowComponent)
  FDCB3.DefaultFill = 0
  SELF.SetAlerts()
  NetLocalRefreshDate = today()         ! NetTalk (NetRefresh)
  NetLocalRefreshTime = clock()
  EnterByTabManager.Init(False)
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  If self.opened Then WinAlert().
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:Gebruiker.Close
    Relate:GebruikerLog.Close
    Relate:Partij.Close
    Relate:Planning.Close
    Relate:Verpakking.Close
  END
  IF SELF.Opened
    INIMgr.Update('BrowseGebruikerLog',QuickWindow)        ! Save window data to non-volatile store
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
    UpdateGebruikerLog
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
    OF ?checkCase:2
      FilterObj.SetCaseSensitive(?checkCase:2{prop:checked})
    OF ?btnReset:2
      ThisWindow.Update()
      FilterObj.Reset()
      post(EVENT:Accepted, ?btnApply:2)
    OF ?BtnSaveQuery:2
      ThisWindow.Update()
      FilterObj.Save()
    OF ?BtnSaveAs:2
      ThisWindow.Update()
      FilterObj.SaveAs()
    OF ?BtnLoadQuery:2
      ThisWindow.Update()
      FilterObj.Load()
      post(EVENT:Accepted, ?btnApply:2)
    OF ?btnApply:2
      ThisWindow.Update()
      BRW1.SetFilter(FilterObj.IFilter.GetFilter(), 'QBEList')
      BRW1.ApplyFilter()
      BRW1.ResetQueue(Reset:Queue)
      BRW1.ResetFromView()
    OF ?Terugzetten
      ThisWindow.Update()
              ! restore
             
      IF Access:GebruikerLog.Fetch(Log:PK_GebruikerLog)=Level:Benign        
          Case Log:Tabel
          OF 'Verpakking'
              LocalClass.RestoreVerpakking(Log:Record)
          OF 'Planning'
              LocalClass.RestorePlanning(Log:Record)
          OF 'Verkoop'
              LocalClass.RestoreVerkoop(Log:Record)
          OF 'Partij'
              LocalClass.RestorePartij(Log:Record)
          END
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
        UD.ShowProcedureInfo('BrowseGebruikerLog',UD.SetApplicationName('Voorraad','EXE'),QuickWindow{PROP:Hlp},'09/08/2011 @ 03:44PM','06/01/2021 @ 06:42PM','10/11/2024 @ 01:55PM')  
    
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
  OF ?Browse:1
    if event() = EVENT:Drag
      get(Queue:Browse:1, choice(?Browse:1))
      QueueField &= what(Queue:Browse:1, ?Browse:1{proplist:FieldNo, ?Browse:1{proplist:MouseDownField}})
      setdropid(clip(?Browse:1{PROPLIST:Header, ?Browse:1{proplist:MouseDownField}}) & ';' & clip(QueueField))
    end
  OF ?FilterList:2
    if event() = EVENT:Drop
      FilterObj.OnDrop()
    end
    
    if event() = EVENT:AlertKey
      FilterObj.OnAlertKey()
    end
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

LocalClass.RestorePartij    PROCEDURE(Log:Record pLogRecord)
Code 
  ! kan ik hier identity insert uitzetten
    Partij{Prop:SQL}= 'SET IDENTITY_INSERT dbo.Partij ON'
    IF ERROR() THEN STOP('Error '&ERROR()&'|'&FILEERROR()).
    Clear(Par:Record)

    St.SetValue(pLogRecord.RecordInhoudPre)
    st.split('<13,10>') 
    loop i# = 1 to st.Records()
        Str.SetValue(St.GetLine(i#))      ! PAR:PARTIJID=30292            ,  5-12-1883            ,  0:05            , 3
        Str.Split(',')
        stVeld.SetValue(Str.GetLine(1))    ! PAR:PARTIJID=30292               
        !stVeld.After('=')
    !SETCLIPBOARD(stVeld.Before('=')&'|'&stVeld.After('='))             !PAR:PARTIJID|30292              
        Case stVeld.Before('=')
        OF 'PAR:PARTIJID'
            Par:PartijID=stVeld.After('=')
        OF 'PAR:ARTIKELID'
            Par:ArtikelID=stVeld.After('=')
        OF 'PAR:AANMAAKDATUM_DATE'    
            Par:AanmaakDatum_DATE=stVeld.After('=')
        OF 'PAR:AANMAAKDATUM_TIME'    
            Par:AanmaakDatum_TIME=0
        OF 'PAR:KG'
            Par:KG=stVeld.After('=')
        OF  'PAR:PALLETS'   
            Par:Pallets=stVeld.After('=')
        OF 'PAR:VERPAKKINGID'
            Par:VerpakkingID=stVeld.After('=')
        OF 'PAR:LEVERANCIER'
            Par:Leverancier=stVeld.After('=')
        of 'PAR:VERWERKT'
            Par:Verwerkt=stVeld.After('=')
        of 'PAR:CELID'
            Par:CELID=stVeld.After('=')
        of 'PAR:PALLETSGEPRINT'
            Par:PalletsGeprint=stVeld.After('=')
        of 'PAR:REFERENTIE'
            Par:Referentie=stVeld.After('=')
        of 'PAR:INSLAGQATEMPERATUUR1'
            PAR:INSLAGQATEMPERATUUR1=stVeld.After('=')
        of 'PAR:EXTERNPARTIJNR'
            PAR:EXTERNPARTIJNR=stVeld.After('=')
        of 'PAR:BEREKENDEINKOOPKGPRIJS'
            PAR:BEREKENDEINKOOPKGPRIJS=stVeld.After('=')
        of 'PAR:INKOOPID'
            PAR:INKOOPID=stVeld.After('=')
        of 'PAR:INKOOPPLANNINGID'
            PAR:INKOOPPLANNINGID=stVeld.After('=')
        of 'PAR:INKOOPKGPRIJS'
            PAR:INKOOPKGPRIJS=stVeld.After('=')
        of 'PAR:INSLAGQATRANSPORTMIDDELSCHOON'
            PAR:INSLAGQATRANSPORTMIDDELSCHOON=stVeld.After('=')
        of 'PAR:INSLAGQAVERPAKKINGSCHOONGESLOTEN'
            PAR:INSLAGQAVERPAKKINGSCHOONGESLOTEN=stVeld.After('=')
        of 'PAR:INSLAGQAIDENTIFICATIEMERKENVERPAKKING'
            PAR:INSLAGQAIDENTIFICATIEMERKENVERPAKKING=stVeld.After('=')
        of 'PAR:INSLAGQAUITGEVOERDDOOR'
            PAR:INSLAGQAUITGEVOERDDOOR=stVeld.After('=')
        of 'PAR:INSLAGQATEMPERATUUR2'
            PAR:INSLAGQATEMPERATUUR2=stVeld.After('=')
        of 'PAR:INSLAGQATEMPERATUUR3'
            PAR:INSLAGQATEMPERATUUR3=stVeld.After('=')
        of 'PAR:INSLAGQAACTIEAFWIJKINGEN'
            PAR:INSLAGQAACTIEAFWIJKINGEN=stVeld.After('=')
        of 'PAR:VERPAKKINGKLASSEID'
            PAR:VERPAKKINGKLASSEID=stVeld.After('=')
        of 'PAR:CORRIGERENDEMAATREGEL'
            PAR:CORRIGERENDEMAATREGEL=stVeld.After('=')
        of 'PAR:AFGEHANDELD'
            PAR:AFGEHANDELD=stVeld.After('=')
        of 'PAR:INSLAGQAISGEURKLEURPRODUCTEIGEN'
            PAR:INSLAGQAISGEURKLEURPRODUCTEIGEN=stVeld.After('=')
        of 'PAR:INSLAGQAGEENGLASBREUK'
            PAR:INSLAGQAGEENGLASBREUK=stVeld.After('=')
        of 'PAR:INSLAGQATEMPERATUURVERVOERMIDDEL'
            PAR:INSLAGQATEMPERATUURVERVOERMIDDEL=stVeld.After('=')
        of 'PAR:CORRECTIEVEMAATREGEL'
            PAR:CORRECTIEVEMAATREGEL=stVeld.After('=')
        END    
    End
    Loc:SQLCommando='INSERT INTO dbo.Partij(PartijID, ArtikelID, Aanmaakdatum, KG, Pallets'&|
        ', VerpakkingID,Leverancier, Verwerkt, CELID, PalletsGeprint, Referentie,Planinstructie'&|
        ', InslagQATemperatuur1, ExternPartijnr, BerekendeInkoopKGPrijs, InkoopID, InkoopPlanningID'&|
        ', InkoopKGPrijs, InslagQATransportmiddelSchoon, InslagQAVerpakkingSchoonGesloten'&|
        ', InslagQAIdentificatieMerkenVerpakking, InslagQAUitgevoerdDoor, InslagQATemperatuur2 '&|
        ', InslagQATemperatuur3, InslagQAActieAfwijkingen, VerpakkingKlasseID, CorrigerendeMaatregel '&|
        ', Afgehandeld, InslagQAIsGeurKleurProductEigen, InslagQAGeenGlasbreuk, InslagQATemperatuurVervoermiddel, CorrectieveMaatregel) VALUES('& |
        Par:PartijID&',<39>'&Par:ArtikelID&'<39>,<39>'&Format(Par:AanmaakDatum_DATE,@D10-)&' 00:00<39>,'&Par:KG&','&Par:Pallets&|
        ', '&Par:VerpakkingID &|
        ', '&Par:Leverancier&|
        ', '&Par:Verwerkt&|
        ', '&Par:CELID&|
        ', '&Par:PalletsGeprint&|
        ', <39>'&Par:Referentie&'<39>'&|
        ', <39>'&Par:Planinstructie&'<39>'&|
        ', <39>'&Par:InslagQATemperatuur1&'<39>'&|
        ', <39>'&Par:ExternPartijnr&'<39>'&|
        ', '&Par:BerekendeInkoopKGPrijs&|
        ', '&Par:InkoopID&|
        ', '&Par:InkoopPlanningID&|
        ', '&Par:InkoopKGPrijs&|
        ', '&Par:InslagQATransportmiddelSchoon&|
        ', '&Par:InslagQAVerpakkingSchoonGesloten&|
        ', '&Par:InslagQAIdentificatieMerkenVerpakking&|
        ', <39>'&Par:InslagQAUitgevoerdDoor&'<39>'&|
        ', <39>'&Par:InslagQATemperatuur2&'<39>'&|
        ', <39>'&Par:InslagQATemperatuur3&'<39>'&|
        ', <39>'&Par:InslagQAActieAfwijkingen&'<39>'&|
        ', '&Par:VerpakkingKlasseID&|
        ', <39>'&Par:CorrigerendeMaatregel&'<39>'&|
        ', <39>'&Par:Afgehandeld&'<39>'&|
        ', '&Par:InslagQAIsGeurKleurProductEigen&|
        ', '&Par:InslagQAGeenGlasbreuk&|
        ', <39>'&Par:InslagQATemperatuurVervoermiddel&'<39>'&|
        ', <39>'&Par:CorrectieveMaatregel&'<39>'&|
        ')'
    !SetClipBoard(Loc:SQLCommando)
    Partij{Prop:SQL}=Loc:SQLCommando
   !Access:Partij.Insert()
!Add(Partij)
    IF ERROR() THEN STOP('Error '&ERROR()&'|'&FILEERROR()).

! kan ik hier identity insert uitzetten
    Partij{Prop:SQL}= 'SET IDENTITY_INSERT dbo.Partij OFF'
    IF ERROR() THEN STOP('Error '&ERROR()&'|'&FILEERROR()).

    RETURN

LocalClass.RestoreVerkoop    PROCEDURE(Log:Record pLogRecord)
Code 
    Verkoop{Prop:SQL}= 'SET IDENTITY_INSERT dbo.Verkoop ON'
    IF ERROR() THEN STOP('Error '&ERROR()&'|'&FILEERROR()).
    Clear(Ver2:Record)

    St.SetValue(pLogRecord.RecordInhoudPre)
    st.split('<13,10>') 
    loop i# = 1 to st.Records()
        Str.SetValue(St.GetLine(i#))      ! VerkoopID | READONLY=37226            , 30-11-1902            ,  0:06            , 3
        Str.Split(',')
        stVeld.SetValue(Str.GetLine(1))    ! VerkoopID | READONLY=37226
        !stVeld.After('=')
        Case stVeld.Before('=')
        OF 'VerkoopID | READONLY'
            Ver2:VerkoopID=stVeld.After('=')
        OF 'VER2:KLANT'
            VER2:KLANT=stVeld.After('=')
        OF 'VER2:VERWERKT'    
            VER2:VERWERKT=stVeld.After('=')
        OF 'VER2:PLANNING_DATE'    
            VER2:PLANNING_DATE=stVeld.After('=')
        OF 'VER2:PLANNING_TIME'    
            VER2:PLANNING_TIME=0
        OF 'VER2:INSTRUCTIE'
            VER2:INSTRUCTIE=stVeld.After('=')
        OF  'VER2:TRANSPORT'   
            VER2:TRANSPORT=stVeld.After('=')
        OF 'VER2:KLANTALTERNATIEFADRES'
            VER2:KLANTALTERNATIEFADRES=stVeld.After('=')
        OF 'VER2:EXTRAKOSTEN'
            VER2:EXTRAKOSTEN=stVeld.After('=')
        of 'VER2:EXTRAKOSTENTEKST'
            VER2:EXTRAKOSTENTEKST=stVeld.After('=')
        of 'VER2:EXTERNVERKOOPID'
            VER2:EXTERNVERKOOPID=stVeld.After('=')
        of 'VER2:NEGATIEVEORDER'
            VER2:NEGATIEVEORDER=stVeld.After('=')
        of 'VER2:REDENRETOUR'
            VER2:REDENRETOUR=stVeld.After('=')
        of 'VER2:CONFIRMATIONDATE_DATE'
            VER2:CONFIRMATIONDATE_DATE=stVeld.After('=')
        of 'VER2:CONFIRMATIONDATE_TIME'
            VER2:CONFIRMATIONDATE_TIME=0
        of 'VER2:GEBRUIKERID'
            VER2:GEBRUIKERID=stVeld.After('=')
        of 'VER2:BEVESTIGINGGEPRINT_DATE'
            VER2:BEVESTIGINGGEPRINT_DATE=stVeld.After('=')
        of 'VER2:BEVESTIGINGGEPRINT_TIME'
            VER2:BEVESTIGINGGEPRINT_TIME=stVeld.After('=')
        of 'VER2:DELIVERYTERMSID'
            VER2:DELIVERYTERMSID=stVeld.After('=')
        of 'VER2:RETOURDATUM_DATE'
            VER2:RETOURDATUM_DATE=stVeld.After('=')
        of 'VER2:RETOURDATUM_TIME'
            VER2:RETOURDATUM_TIME=stVeld.After('=')
        of 'VER2:EXPORTED'
            VER2:EXPORTED=stVeld.After('=')
        of 'VER2:VALUTA'
            VER2:VALUTA=stVeld.After('=')
        of 'VER2:KOERSVERSCHIL'
            VER2:KOERSVERSCHIL=stVeld.After('=')
        of 'VER2:CONTAINERNR'
            VER2:CONTAINERNR=stVeld.After('=')
        of 'VER2:SEALNR'
            VER2:SEALNR=stVeld.After('=')
        of 'VER2:VESSEL'
            VER2:VESSEL=stVeld.After('=')
        of 'VER2:PROFORMAMEMO'
            VER2:PROFORMAMEMO=stVeld.After('=')
        of 'VER2:TARRACONTAINER'
            VER2:TARRACONTAINER=stVeld.After('=')
        of 'VER2:LAADHAVEN'
            VER2:LAADHAVEN=stVeld.After('=')
        of 'VER2:LOSHAVEN'
            VER2:LOSHAVEN=stVeld.After('=')
        of 'VER2:BOEKINGSNR'
            VER2:BOEKINGSNR=stVeld.After('=')
        of 'VER2:BESCWAIVER'
            VER2:BESCWAIVER=stVeld.After('=')
        of 'VER2:EXPRESSERELEASE'
            VER2:EXPRESSERELEASE=stVeld.After('=')
        of 'VER2:AAN'
            VER2:AAN=stVeld.After('=')
        of 'VER2:OMSCHRIJVINGGOEDEREN'
            VER2:OMSCHRIJVINGGOEDEREN=stVeld.After('=')
        END    
    End
    Loc:SQLCommando='INSERT INTO [dbo].[Verkoop] ' & |
'           ([VerkoopID] ' & |
'           ,[Klant] ' & |
'           ,[Verwerkt] ' & |
'           ,[Planning] ' & |
'           ,[Instructie] ' & |
'           ,[Transport] ' & |
'           ,[KlantAlternatiefAdres] ' & |
'           ,[ExtraKosten] ' & |
'           ,[ExtraKostenTekst] ' & |
'           ,[ExternVerkoopID] ' & |
'           ,[NegatieveOrder] ' & |
'           ,[RedenRetour] ' & |
'           ,[ConfirmationDate] ' & |
'           ,[GebruikerID] ' & |
'           ,[BevestigingGeprint] ' & |
'           ,[DeliveryTermsID] ' & |
'           ,[RetourDatum] ' & |
'           ,[Exported] ' & |
'           ,[Valuta] ' & |
'           ,[Koersverschil] ' & |
'           ,[Containernr] ' & |
'           ,[Sealnr] ' & |
'           ,[Vessel] ' & |
'           ,[ProFormaMemo] ' & |
'           ,[TarraContainer] ' & |
'           ,[Laadhaven] ' & |
'           ,[Loshaven] ' & |
'           ,[Boekingsnr] ' & |
'           ,[BESCWaiver] ' & |
'           ,[ExpresseRelease] ' & |
'           ,[Aan] ' & |
'           ,[OmschrijvingGoederen]) ' & |
        '            VALUES('& |
        Ver2:VerkoopID&|
        ','&Ver2:Klant&|
        ','&Ver2:Verwerkt&|
        ',<39>'&Format(Ver2:Planning_DATE,@D10-)&' 00:00<39>'&|
        ',<39>'&Ver2:Instructie&'<39>'&|
        ',<39>'&Ver2:Transport&'<39>'&|
        ', '&Ver2:KlantAlternatiefAdres &|
        ', '&Ver2:ExtraKosten&|
        ', <39>'&Ver2:ExtraKostenTekst&'<39>'&|
        ', <39>'&Ver2:ExternVerkoopID&'<39>'&|
        ', <39>'&Ver2:NegatieveOrder&'<39>'&|
        ', <39>'&Ver2:RedenRetour&'<39>'&|
        ', <39>'&Format(Ver2:ConfirmationDate_DATE,@D10-)&' '&Format(Ver2:ConfirmationDate_TIME,@T01)&'<39>'&|
        ', '&Ver2:GebruikerID&|
        ', <39>'&CHOOSE(Ver2:BevestigingGeprint_DATE=0,'1900-01-01',Format(Ver2:BevestigingGeprint_DATE,@D010-))&' '&Format(Ver2:BevestigingGeprint_TIME,@T01)&'<39>'&|
        ', '&Ver2:DeliveryTermsID&|
        ', <39>'&CHOOSE(Ver2:RetourDatum_DATE=0,'1900-01-01',Format(Ver2:RetourDatum_DATE,@D010-))&' '&Format(Ver2:RetourDatum_TIME,@T01)&'<39>'&|
        ', '&Ver2:Exported&|
        ', <39>'&Ver2:Valuta&'<39>'&|
        ', '&Ver2:Koersverschil&|
        ', <39>'&Ver2:Containernr&'<39>'&|
        ', <39>'&Ver2:Sealnr&'<39>'&|
        ', <39>'&Ver2:Vessel&'<39>'&|
        ', <39>'&Ver2:ProFormaMemo&'<39>'&|
        ', <39>'&Ver2:TarraContainer&'<39>'&|
        ', <39>'&Ver2:Laadhaven&'<39>'&|
        ', <39>'&Ver2:Loshaven&'<39>'&|
        ', <39>'&Ver2:Boekingsnr&'<39>'&|
        ', <39>'&Ver2:BESCWaiver&'<39>'&|
        ', '&Ver2:ExpresseRelease&|
        ', <39>'&Ver2:Aan&'<39>'&|
        ', <39>'&Ver2:OmschrijvingGoederen&'<39>'&|
        ')'
    !SetClipBoard(Loc:SQLCommando)
    Verkoop{Prop:SQL}=Loc:SQLCommando
   !Access:Partij.Insert()
!Add(Partij)
    IF ERROR() THEN STOP('Error '&ERROR()&'|'&FILEERROR()).

    Verkoop{Prop:SQL}= 'SET IDENTITY_INSERT dbo.Verkoop OFF'
    IF ERROR() THEN STOP('Error '&ERROR()&'|'&FILEERROR()).

    RETURN

LocalClass.RestorePlanning    PROCEDURE(Log:Record pLogRecord)
Code 
    Planning{Prop:SQL}= 'SET IDENTITY_INSERT dbo.Planning ON'
    IF ERROR() THEN STOP('Error '&ERROR()&'|'&FILEERROR()).
    Clear(Par:Record)

    St.SetValue(pLogRecord.RecordInhoudPre)
    st.split('<13,10>') 
    loop i# = 1 to st.Records()
        Str.SetValue(St.GetLine(i#))      ! PAR:PARTIJID=30292            ,  5-12-1883            ,  0:05            , 3
        Str.Split(',')
        stVeld.SetValue(Str.GetLine(1))    ! PAR:PARTIJID=30292               
       ! stVeld.After('=')
    !SETCLIPBOARD(stVeld.Before('=')&'|'&stVeld.After('='))             !PAR:PARTIJID|30292              
        Case stVeld.Before('=')
        OF 'PlanningID | READONLY'
            Pla:PlanningID=stVeld.After('=')
        OF 'PLA:VERKOOPID'
            PLA:VERKOOPID=stVeld.After('=')
        OF 'PLA:INKOOPID'    
            PLA:INKOOPID=stVeld.After('=')
        OF 'PLA:ARTIKELID'    
            PLA:ARTIKELID=stVeld.After('=')
        OF 'PLA:KG'
            PLA:KG=stVeld.After('=')
        OF  'PLA:PALLETS'   
            PLA:PALLETS=stVeld.After('=')
        OF 'PLA:PLANNING_DATE'
            PLA:PLANNING_DATE=stVeld.After('=')
        OF 'PLA:PLANNING_TIME'
            PLA:PLANNING_TIME=stVeld.After('=')
        of 'PLA:VERPAKKINGID'
            PLA:VERPAKKINGID=stVeld.After('=')
        of 'PLA:CELID'
            PLA:CELID=stVeld.After('=')
        of 'PLA:PARTIJID'
            PLA:PARTIJID=stVeld.After('=')
        of 'PLA:MEMO'
            PLA:MEMO=stVeld.After('=')
        of 'PLA:MUTATIEGEMAAKT'
            PLA:MUTATIEGEMAAKT=stVeld.After('=')
        of 'PLA:GEPRINT'
            PLA:GEPRINT=stVeld.After('=')
        of 'PLA:VERWERKT'
            PLA:VERWERKT=stVeld.After('=')
        of 'PLA:LEVERANCIER'
            PLA:LEVERANCIER=stVeld.After('=')
        of 'PLA:OVERBOEKINGCELID'
            PLA:OVERBOEKINGCELID=stVeld.After('=')
        of 'PLA:INSTRUCTIE'
            PLA:INSTRUCTIE=stVeld.After('=')
        of 'PLA:TRANSPORT'
            PLA:TRANSPORT=stVeld.After('=')
        of 'PLA:GEWOGEN'
            PLA:GEWOGEN=stVeld.After('=')
        of 'PLA:CELLOCATIEID'
            PLA:CELLOCATIEID=stVeld.After('=')
        of 'PLA:MUTATIEKG'
            PLA:MUTATIEKG=stVeld.After('=')
        of 'PLA:MUTATIEPALLETS'
            PLA:MUTATIEPALLETS=stVeld.After('=')
        of 'PLA:OVERBOEKINGPLANNINGID'
            PLA:OVERBOEKINGPLANNINGID=stVeld.After('=')
        of 'PLA:INKOOPKGPRIJS'
            PLA:INKOOPKGPRIJS=stVeld.After('=')
        of 'PLA:VERKOOPKGPRIJS'
            PLA:VERKOOPKGPRIJS=stVeld.After('=')
        of 'PLA:UITSLAGPALLETBLADDUEDATE12'
            PLA:UITSLAGPALLETBLADDUEDATE12=stVeld.After('=')
        of 'PLA:UITSLAGPALLETBLADDUEDATE12_DATE'
            PLA:UITSLAGPALLETBLADDUEDATE12_DATE=stVeld.After('=')
        of 'PLA:UITSLAGPALLETBLADDUEDATE12_TIME'
            PLA:UITSLAGPALLETBLADDUEDATE12_TIME=stVeld.After('=')
        of 'PLA:UITSLAGPALLETBLADPRODUCTIONDATE11_DATE'
            PLA:UITSLAGPALLETBLADPRODUCTIONDATE11_DATE=stVeld.After('=')
        of 'PLA:UITSLAGPALLETBLADPRODUCTIONDATE11_TIME'
            PLA:UITSLAGPALLETBLADPRODUCTIONDATE11_TIME=stVeld.After('=')
        of 'PLA:UITSLAGPALLETBLADSELLBYDATE15_DATE'
            PLA:UITSLAGPALLETBLADSELLBYDATE15_DATE=stVeld.After('=')
        of 'PLA:UITSLAGPALLETBLADSELLBYDATE15_TIME'
            PLA:UITSLAGPALLETBLADSELLBYDATE15_TIME=stVeld.After('=')
        of 'PLA:ALTERNATIEVEARTIKELOMS'
            PLA:ALTERNATIEVEARTIKELOMS=stVeld.After('=')
        of 'PLA:VERPAKKINGKLASSEID'
            PLA:VERPAKKINGKLASSEID=stVeld.After('=')
        of 'PLA:AANTALVERPAKKINGEN'
            PLA:AANTALVERPAKKINGEN=stVeld.After('=')
        of 'PLA:UITSLAGPALLETBLADORIGINLIVEBIRD'
            PLA:UITSLAGPALLETBLADORIGINLIVEBIRD=stVeld.After('=')
        of 'PLA:UITSLAGPALLETBLADORIGINSLAUTHERHOUSE'
            PLA:UITSLAGPALLETBLADORIGINSLAUTHERHOUSE=stVeld.After('=')
        of 'PLA:UITSLAGPALLETBLADORIGINPROCESSING'
            PLA:UITSLAGPALLETBLADORIGINPROCESSING=stVeld.After('=')
        of 'PLA:UITSLAGPALLETBLADORIGINPACKING'
            PLA:UITSLAGPALLETBLADORIGINPACKING=stVeld.After('=')
        of 'PLA:VALUTA'
            PLA:VALUTA=stVeld.After('=')
        of 'PLA:KOERSVERSCHIL'
            PLA:KOERSVERSCHIL=stVeld.After('=')
        of 'PLA:EXTRAKOSTEN'
            PLA:EXTRAKOSTEN=stVeld.After('=')
        of 'PLA:LOTID'
            PLA:LOTID=stVeld.After('=')
        of 'PLA:PLANTNUMBER'
            PLA:PLANTNUMBER=stVeld.After('=')
        of 'PLA:DELIVERYDATE_DATE'
            PLA:DELIVERYDATE_DATE=stVeld.After('=')
        of 'PLA:DELIVERYDATE_TIME'
            PLA:DELIVERYDATE_TIME=stVeld.After('=')
        of 'PLA:PLANNINGIDRETOUR'
            PLA:PLANNINGIDRETOUR=stVeld.After('=')
        of 'PLA:PLANNINGIDPARENT'
            PLA:PLANNINGIDPARENT=stVeld.After('=')
        of 'PLA:AANVULLING'
            PLA:AANVULLING=stVeld.After('=')
        of 'PLA:DOZEN'
            PLA:DOZEN=stVeld.After('=')
        of 'PLA:GROSSWEIGHT'
            PLA:GROSSWEIGHT=stVeld.After('=')
        of 'PLA:OVERBOEKSOORT'
            PLA:OVERBOEKSOORT=stVeld.After('=')
        of 'PLA:OverboekCelLocatieID'
            PLA:OverboekCelLocatieID=stVeld.After('=')
        of 'PLA:NieuwKg'
            PLA:NieuwKg=stVeld.After('=')
        of 'PLA:NieuwPallets'
            PLA:NieuwPallets=stVeld.After('=')
        END    
    End
    Loc:SQLCommando= |
        'INSERT INTO [dbo].[Planning] ' & |
'           ([PlanningID] ' & |
'           ,[VerkoopID] ' & |
'           ,[InkoopID] ' & |
'           ,[ArtikelID] ' & |
'           ,[KG] ' & |
'           ,[Pallets] ' & |
'           ,[Planning] ' & |
'           ,[VerpakkingID] ' & |
'           ,[CelID] ' & |
'           ,[PartijID] ' & |
'           ,[Memo] ' & |
'           ,[MutatieGemaakt] ' & |
'           ,[Geprint] ' & |
'           ,[Verwerkt] ' & |
'           ,[Leverancier] ' & |
'           ,[OverboekingCelID] ' & |
'           ,[Instructie] ' & |
'           ,[Transport] ' & |
'           ,[Gewogen] ' & |
'           ,[CelLocatieID] ' & |
'           ,[MutatieKG] ' & |
'           ,[MutatiePallets] ' & |
'           ,[OverboekingPlanningID] ' & |
'           ,[InkoopKGPrijs] ' & |
'           ,[VerkoopKGPrijs] ' & |
'           ,[UitslagPalletbladDueDate12] ' & |
'           ,[UitslagPalletbladProductionDate11] ' & |
'           ,[UitslagPalletbladSellByDate15] ' & |
'           ,[AlternatieveArtikelOms] ' & |
'           ,[VerpakkingKlasseID] ' & |
'           ,[AantalVerpakkingen] ' & |
'           ,[UitslagPalletbladOriginLiveBird] ' & |
'           ,[UitslagPalletbladOriginSlautherHouse] ' & |
'           ,[UitslagPalletbladOriginProcessing] ' & |
'           ,[UitslagPalletbladOriginPacking] ' & |
'           ,[Valuta] ' & |
'           ,[Koersverschil] ' & |
'           ,[ExtraKosten] ' & |
'           ,[LotID] ' & |
'           ,[PlantNumber] ' & |
'           ,[DeliveryDate] ' & |
'           ,[PlanningIDRetour] ' & |
'           ,[PlanningIDParent] ' & |
'           ,[Aanvulling] ' & |
'           ,[Dozen] ' & |
'           ,[GrossWeight] ' & |
'           ,[OverboekSoort] ' & |
'           ,[OverboekCelLocatieID] ' & |
'           ,[NieuwKg] ' & |
'           ,[NieuwPallets]) ' & |
'     VALUES (' & |
        Pla:PlanningID&|
        ', '&Pla:VerkoopID &|
        ', '&Pla:InkoopID&|
        ', '&Pla:ArtikelID&|
        ', '&Pla:KG&|
        ', '&Pla:Pallets&|
        ', <39>'&CHOOSE(Pla:Planning_DATE=0,'1900-01-01',Format(Pla:Planning_DATE,@D010-))&' '&Format(Pla:Planning_TIME,@T01)&'<39>'&|
        ', '&Pla:VerpakkingID &|
        ', '&Pla:CelID&|
        ', '&Pla:PartijID&|
        ', <39>'&Pla:Memo&'<39>'&|
        ', '&Pla:MutatieGemaakt&|
        ', '&Pla:Geprint&|
        ', '&Pla:Verwerkt&|
        ', '&Pla:Leverancier&|
        ', '&Pla:OverboekingCelID&|
        ', <39>'&Pla:Instructie&'<39>'&|
        ', <39>'&Pla:Transport&'<39>'&|
        ', '&Pla:Gewogen&|
        ', '&Pla:CelLocatieID&|
        ', '&Pla:MutatieKG&|
        ', '&Pla:MutatiePallets&|
        ', '&Pla:OverboekingPlanningID&|
        ', '&Pla:InkoopKGPrijs&|
        ', '&Pla:VerkoopKGPrijs&|
        ', <39>'&CHOOSE(Pla:UitslagPalletbladDueDate12_DATE=0,'1900-01-01',Format(Pla:UitslagPalletbladDueDate12_DATE,@D010-))&' '&Format(Pla:UitslagPalletbladDueDate12_TIME,@T01)&'<39>'&|
        ', <39>'&CHOOSE(Pla:UitslagPalletbladProductionDate11_DATE=0,'1900-01-01',Format(Pla:UitslagPalletbladProductionDate11_DATE,@D010-))&' '&Format(Pla:UitslagPalletbladProductionDate11_TIME,@T01)&'<39>'&|
        ', <39>'&CHOOSE(Pla:UitslagPalletbladSellByDate15_DATE=0,'1900-01-01',Format(Pla:UitslagPalletbladSellByDate15_DATE,@D010-))&' '&Format(Pla:UitslagPalletbladSellByDate15_TIME,@T01)&'<39>'&|
        ', <39>'&Pla:AlternatieveArtikelOms&'<39>'&|
        ', '&Pla:VerpakkingKlasseID&|
        ', '&Pla:AantalVerpakkingen&|
        ', <39>'&Pla:UitslagPalletbladOriginLiveBird&'<39>'&|
        ', <39>'&Pla:UitslagPalletbladOriginSlautherHouse&'<39>'&|
        ', <39>'&Pla:UitslagPalletbladOriginProcessing&'<39>'&|
        ', <39>'&Pla:UitslagPalletbladOriginPacking&'<39>'&|
        ', <39>'&Pla:Valuta&'<39>'&|
        ', '&Pla:Koersverschil&|
        ', '&Pla:ExtraKosten&|
        ', '&Pla:LotID&|
        ', <39>'&Pla:PlantNumber&'<39>'&|
        ', <39>'&CHOOSE(Pla:DeliveryDate_DATE=0,'1900-01-01',Format(Pla:DeliveryDate_DATE,@D010-))&' '&Format(Pla:DeliveryDate_TIME,@T01)&'<39>'&|
        ', '&Pla:PlanningIDRetour&|
        ', '&Pla:PlanningIDParent&|
        ', <39>'&Pla:Aanvulling&'<39>'&|
        ', '&Pla:Dozen&|
        ', '&Pla:GrossWeight&|
        ', <39>'&Pla:OverboekSoort&'<39>'&|
        ', '&Pla:OverboekCelLocatieID&|
        ', '&Pla:NieuwKG&|
        ', '&Pla:NieuwPallets&|
        ')'
   ! SetClipBoard(Loc:SQLCommando)
    Planning{Prop:SQL}=Loc:SQLCommando
   !Access:Partij.Insert()
!Add(Partij)
    IF ERROR() THEN STOP('Error '&ERROR()&'|'&FILEERROR()).

    Planning{Prop:SQL}= 'SET IDENTITY_INSERT dbo.Planning OFF'
    IF ERROR() THEN STOP('Error '&ERROR()&'|'&FILEERROR()).
    Return

LocalClass.RestoreVerpakking        PROCEDURE(Log:Record pLogRecord)
Code 
    Verpakking{Prop:SQL}= 'SET IDENTITY_INSERT dbo.Verpakking ON'
    IF ERROR() THEN STOP('Error '&ERROR()&'|'&FILEERROR()).
    Clear(VER:Record)
    St.SetValue(pLogRecord.RecordInhoudPre)
    st.split('<13,10>') 
    loop i# = 1 to st.Records()
        Str.SetValue(St.GetLine(i#))      ! VER:VERPAKKINGID=208            , 24-07-1801            ,  0:00            , 2
        Str.Split(',')
        stVeld.SetValue(Str.GetLine(1))    ! VER:VERPAKKINGID=208               
      !  stVeld.After('=')
        Case stVeld.Before('=')
        OF 'VER:VERPAKKINGID'
            Ver:VerpakkingID=stVeld.After('=')
        OF 'VER:VERPAKKINGOMSCHRIJVING'
            Ver:VerpakkingOmschrijving=stVeld.After('=')
        OF 'VER:DESCRIPTION'    
            Ver:Description=stVeld.After('=')
        OF 'VER:INHOUDKG=10'    
            Ver:InhoudKG=stVeld.After('=')
        End
    END
        Loc:SQLCommando= |
            'INSERT INTO [dbo].[Verpakking] ' & |
            '           ([VerpakkingID] ' & |
            '           ,[VERPAKKINGOMSCHRIJVING] ' & |
            '           ,[DESCRIPTION] ' & |
            '           ,[INHOUDKG] ' & |
            '   )  VALUES (' & |
            Ver:VerpakkingID&|
            ', <39>'&Ver:VerpakkingOmschrijving&'<39>'&|
            ', <39>'&Ver:Description&'<39>'&|
            ', '&Ver:InhoudKG&|
            ')'
?     !   SETCLIPBOARD(Loc:SQLCommando)
        Verpakking{Prop:SQL}=Loc:SQLCommando
        IF ERROR() THEN STOP('Error '&ERROR()&'|'&FILEERROR()).
       
        Verpakking{Prop:SQL}= 'SET IDENTITY_INSERT dbo.Verpakking OFF'
        IF ERROR() THEN STOP('Error '&ERROR()&'|'&FILEERROR()).
        Return


BRW1.Init PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)

  CODE
  PARENT.Init(ListBox,Posit,V,Q,RM,WM)
  IF WM.Request <> ViewRecord                              ! If called for anything other than ViewMode, make the insert, change & delete controls available
    SELF.InsertControl=?Insert
  END
  SELF.ViewControl = ?View                                 ! Setup the control used to initiate view only mode


BRW1.ResetSort PROCEDURE(BYTE Force)

ReturnValue          BYTE,AUTO

  CODE
  IF CHOICE(?CurrentTab) = 2
    RETURN SELF.SetSort(1,Force)
  ELSIF CHOICE(?CurrentTab) = 3
    RETURN SELF.SetSort(2,Force)
  ELSE
    RETURN SELF.SetSort(3,Force)
  END
  ReturnValue = PARENT.ResetSort(Force)
  RETURN ReturnValue


BRW1.SetAlerts PROCEDURE

  CODE
  SELF.EditViaPopup = False
  PARENT.SetAlerts


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window
  SELF.SetStrategy(?Geb:WindowsInlog, Resize:FixLeft+Resize:FixBottom, Resize:LockSize) ! Override strategy for ?Geb:WindowsInlog
  SELF.SetStrategy(?GebruikerPrompt, Resize:FixLeft+Resize:FixBottom, Resize:LockSize) ! Override strategy for ?GebruikerPrompt
  SELF.SetStrategy(?Group1:2, Resize:FixLeft+Resize:FixBottom, Resize:LockSize) ! Override strategy for ?Group1:2
  SELF.SetStrategy(?Close, Resize:FixRight+Resize:FixBottom, Resize:LockSize) ! Override strategy for ?Close
  SELF.SetStrategy(?CurrentTab, Resize:FixLeft+Resize:FixTop, Resize:ConstantRight+Resize:ConstantBottom) ! Override strategy for ?CurrentTab
  SELF.SetStrategy(?LOC:Datum:Prompt:2, Resize:FixLeft+Resize:FixBottom, Resize:LockSize) ! Override strategy for ?LOC:Datum:Prompt:2
  SELF.SetStrategy(?LOC:Datum:2, Resize:FixLeft+Resize:FixBottom, Resize:LockSize) ! Override strategy for ?LOC:Datum:2

