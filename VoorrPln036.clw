

   MEMBER('VoorrPln.clw')                                  ! This is a MEMBER module


   INCLUDE('ABDROPS.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('VOORRPLN036.INC'),ONCE        !Local module procedure declarations
                     END


!!! <summary>
!!! Generated from procedure template - Window
!!! Form Planning
!!! </summary>
UpdatePlanningInkoop PROCEDURE 

udpt            UltimateDebugProcedureTracker
CurrentTab           STRING(80)                            ! 
ActionMessage        CSTRING(40)                           ! 
LOC:ArtikelID        CSTRING(31)                           ! 
LOC:Planning         STRING(8)                             ! 
LOC:CelLocatieID     LONG                                  ! 
LOC:VerpakkingID     LONG                                  ! 
LOC:CelID            LONG                                  ! 
LOC:Memo             CSTRING(101)                          ! 
LOC:Instructie       CSTRING(101)                          ! 
LOC:Transport        CSTRING(101)                          ! 
LOC:InkoopKGPrijs    DECIMAL(9,3)                          ! 
LOC:SavedPlanningBuffer USHORT                             ! 
LOC:SavedPlanningFile USHORT                               ! 
FDCB7::View:FileDropCombo VIEW(ViewArtikel)
                       PROJECT(Art:ArtikelOms)
                     END
FDCB8::View:FileDropCombo VIEW(Verpakking)
                       PROJECT(Ver:VerpakkingOmschrijving)
                     END
FDCB9::View:FileDropCombo VIEW(Cel)
                       PROJECT(CEL:CelOms)
                       PROJECT(CEL:CelID)
                     END
FDCB11::View:FileDropCombo VIEW(CelLocatie)
                       PROJECT(CL:Locatienaam)
                       PROJECT(CL:CelLocatieID)
                     END
Queue:FileDropCombo  QUEUE                            !
Art:ArtikelOms         LIKE(Art:ArtikelOms)           !List box control field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
Queue:FileDropCombo:1 QUEUE                           !
Ver:VerpakkingOmschrijving LIKE(Ver:VerpakkingOmschrijving) !List box control field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
Queue:FileDropCombo:2 QUEUE                           !
CEL:CelOms             LIKE(CEL:CelOms)               !List box control field - type derived from field
CEL:CelID              LIKE(CEL:CelID)                !Primary key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
Queue:FileDropCombo:3 QUEUE                           !
CL:Locatienaam         LIKE(CL:Locatienaam)           !List box control field - type derived from field
CL:CelLocatieID        LIKE(CL:CelLocatieID)          !Primary key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
LocEnableEnterByTab  BYTE(1)                               !Used by the ENTER Instead of Tab template
EnterByTabManager    EnterByTabClass
History::Pla:Record  LIKE(Pla:RECORD),THREAD
QuickWindow          WINDOW('Form Planning'),AT(,,364,324),FONT('MS Sans Serif',8,,,CHARSET:DEFAULT),DOUBLE,CENTER, |
  GRAY,IMM,MDI,HLP('UpdatePlanning'),SYSTEM
                       SHEET,AT(4,4,356,299),USE(?CurrentTab)
                         TAB('&1) General'),USE(?Tab:1)
                           PROMPT('Artikel:'),AT(9,26),USE(?Pla:ArtikelID:Prompt),TRN
                           COMBO(@s60),AT(69,25,282,10),USE(Art:ArtikelOms),DROP(25),FORMAT('240L(2)~Artikel~C(0)@s60@'), |
  FROM(Queue:FileDropCombo),REQ
                           PROMPT('Aanvulling:'),AT(9,41),USE(?Pla:Aanvulling:Prompt)
                           ENTRY(@s100),AT(69,40,282,10),USE(Pla:Aanvulling)
                           ENTRY(@N12_.2),AT(69,54,64,10),USE(Pla:KG),RIGHT(2),REQ
                           PROMPT('Pallets:'),AT(9,70),USE(?Pla:Pallets:Prompt),TRN
                           ENTRY(@n14.),AT(69,70,64,10),USE(Pla:Pallets),RIGHT(2)
                           PROMPT('Datum:'),AT(9,83),USE(?Pla:Planning_DATE:Prompt),HIDE,TRN
                           ENTRY(@d6-),AT(69,83,64,10),USE(Pla:Planning_DATE),RIGHT(2),HIDE
                           PROMPT('Tijdstip:'),AT(173,84),USE(?Pla:Planning_TIME:Prompt),HIDE,TRN
                           ENTRY(@t7),AT(205,84,64,10),USE(Pla:Planning_TIME),RIGHT(2),HIDE
                           PROMPT('Verpakking:'),AT(9,97),USE(?Pla:VerpakkingID:Prompt),TRN
                           COMBO(@s50),AT(69,98,282,10),USE(Ver:VerpakkingOmschrijving),DROP(25),FORMAT('200L(2)~Ve' & |
  'rpakking Omschrijving~L(0)@s50@'),FROM(Queue:FileDropCombo:1),IMM
                           PROMPT('Cel:'),AT(9,113),USE(?Pla:CelID:Prompt),TRN
                           COMBO(@s50),AT(69,113,282,10),USE(CEL:CelOms),DROP(25),FORMAT('200L(2)~Omschrijving~L(0)@s50@'), |
  FROM(Queue:FileDropCombo:2),IMM
                           STRING('Cel-locatie:'),AT(9,126),USE(?STRING1)
                           COMBO(@s50),AT(69,126,282,10),USE(CL:Locatienaam),VSCROLL,DROP(5),FORMAT('200L(2)|M~Loc' & |
  'atienaam~L(0)@s50@'),FROM(Queue:FileDropCombo:3),IMM
                           PROMPT('Instructie:'),AT(9,138),USE(?Pla:Instructie:Prompt),CENTER
                           TEXT,AT(69,140,282,48),USE(Pla:Instructie,,?Pla:Instructie:2)
                           PROMPT('Transport:'),AT(9,192),USE(?Pla:Transport:Prompt)
                           TEXT,AT(70,192,281,55),USE(?Pla:Transport)
                           PROMPT('Prijs per KG:'),AT(9,252),USE(?Pla:InkoopKGPrijs:Prompt)
                           ENTRY(@n-13`3),AT(69,251,60,10),USE(Pla:InkoopKGPrijs),RIGHT(2)
                           STRING(@S10),AT(10,54),USE(PQ:StandaardEenheid)
                         END
                       END
                       BUTTON('&OK'),AT(239,306,49,14),USE(?OK),LEFT,ICON('WAOK.ICO'),DEFAULT,FLAT,MSG('Accept dat' & |
  'a and close the window'),TIP('Accept data and close the window')
                       BUTTON('&Annuleren'),AT(293,306,65,14),USE(?Cancel),LEFT,ICON('WACANCEL.ICO'),FLAT,MSG('Cancel operation'), |
  TIP('Cancel operation')
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
Run                    PROCEDURE(),BYTE,PROC,DERIVED
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED
TakeCompleted          PROCEDURE(),BYTE,PROC,DERIVED
TakeEvent              PROCEDURE(),BYTE,PROC,DERIVED
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
FDCB7                CLASS(FileDropComboClass)             ! File drop combo manager
Q                      &Queue:FileDropCombo           !Reference to browse queue type
                     END

FDCB8                CLASS(FileDropComboClass)             ! File drop combo manager
Q                      &Queue:FileDropCombo:1         !Reference to browse queue type
                     END

FDCB9                CLASS(FileDropComboClass)             ! File drop combo manager
Q                      &Queue:FileDropCombo:2         !Reference to browse queue type
                     END

FDCB11               CLASS(FileDropComboClass)             ! File drop combo manager
Q                      &Queue:FileDropCombo:3         !Reference to browse queue type
                     END

Resizer              CLASS(WindowResizeClass)
Init                   PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)
                     END

CurCtrlFeq          LONG
FieldColorQueue     QUEUE
Feq                   LONG
OldColor              LONG
                    END

  CODE
? DEBUGHOOK(ACelLocatie:Record)
? DEBUGHOOK(Cel:Record)
? DEBUGHOOK(CelLocatie:Record)
? DEBUGHOOK(Inkoop:Record)
? DEBUGHOOK(Mutatie:Record)
? DEBUGHOOK(Planning:Record)
? DEBUGHOOK(Verkoop:Record)
? DEBUGHOOK(Verpakking:Record)
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
        udpt.Init(UD,'UpdatePlanningInkoop','VoorrPln036.clw','VoorrPln.DLL','06/28/2024 @ 01:22PM')    
             
  GlobalErrors.SetProcedureName('UpdatePlanningInkoop')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Pla:ArtikelID:Prompt
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.HistoryKey = CtrlH
  SELF.AddHistoryFile(Pla:Record,History::Pla:Record)
  SELF.AddHistoryField(?Pla:Aanvulling,59)
  SELF.AddHistoryField(?Pla:KG,5)
  SELF.AddHistoryField(?Pla:Pallets,6)
  SELF.AddHistoryField(?Pla:Planning_DATE,9)
  SELF.AddHistoryField(?Pla:Planning_TIME,10)
  SELF.AddHistoryField(?Pla:Instructie:2,20)
  SELF.AddHistoryField(?Pla:InkoopKGPrijs,27)
  SELF.AddUpdateFile(Access:Planning)
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  Relate:ACelLocatie.Open                                  ! File ACelLocatie used by this procedure, so make sure it's RelationManager is open
  Relate:Cel.SetOpenRelated()
  Relate:Cel.Open                                          ! File Cel used by this procedure, so make sure it's RelationManager is open
  Relate:Inkoop.SetOpenRelated()
  Relate:Inkoop.Open                                       ! File Inkoop used by this procedure, so make sure it's RelationManager is open
  Relate:Mutatie.Open                                      ! File Mutatie used by this procedure, so make sure it's RelationManager is open
  Relate:Verpakking.Open                                   ! File Verpakking used by this procedure, so make sure it's RelationManager is open
  Relate:ViewArtikel.Open                                  ! File ViewArtikel used by this procedure, so make sure it's RelationManager is open
  Access:Verkoop.UseFile                                   ! File referenced in 'Other Files' so need to inform it's FileManager
  SELF.FilesOpened = True
  SELF.Primary &= Relate:Planning
  IF SELF.Request = ViewRecord AND NOT SELF.BatchProcessing ! Setup actions for ViewOnly Mode
    SELF.InsertAction = Insert:None
    SELF.DeleteAction = Delete:None
    SELF.ChangeAction = Change:None
    SELF.CancelAction = Cancel:Cancel
    SELF.OkControl = 0
  ELSE
    SELF.InsertAction = Insert:Query
    SELF.ChangeAction = Change:Caller                      ! Changes allowed
    SELF.CancelAction = Cancel:Cancel+Cancel:Query         ! Confirm cancel
    SELF.OkControl = ?OK
    IF SELF.PrimeUpdate() THEN RETURN Level:Notify.
  END
  SELF.Open(QuickWindow)                                   ! Open window
  IF (IGB:BekijkenPrijzen <> 1) THEN
  	HIDE(?Pla:InkoopKGPrijs)
  	HIDE(?Pla:InkoopKGPrijs:Prompt)
  END
  
  IF (GLO:HidePlanningInstructie = 1) THEN
      HIDE(?Pla:Instructie:2)
      HIDE(?Pla:Instructie:Prompt)
      
      ?Pla:Transport:Prompt{Prop:YPos} = 126
      ?Pla:Transport{Prop:YPos} = 126
      ?Pla:Transport{Prop:Height} = 100
  END
  
  IF Ink:Verwerkt
      DISABLE(?Pla:ArtikelID:Prompt,?Pla:Transport)
  END
  Do DefineListboxStyle
  Alert(AltKeyPressed)  ! WinEvent : These keys cause a program to crash on Windows 7 and Windows 10.
  Alert(F10Key)         !
  Alert(CtrlF10)        !
  Alert(ShiftF10)       !
  Alert(CtrlShiftF10)   !
  Alert(AltSpace)       !
  WinAlertMouseZoom()
  QuickWindow{Prop:Alrt,255} = CtrlShiftP
  IF SELF.Request = ViewRecord                             ! Configure controls for View Only mode
    DISABLE(?Art:ArtikelOms)
    ?Pla:Aanvulling{PROP:ReadOnly} = True
    DISABLE(?Pla:KG)
    DISABLE(?Pla:Pallets)
    DISABLE(?Pla:Planning_DATE)
    DISABLE(?Pla:Planning_TIME)
    DISABLE(?Ver:VerpakkingOmschrijving)
    DISABLE(?CEL:CelOms)
    DISABLE(?CL:Locatienaam)
    DISABLE(?Pla:Instructie:2)
    DISABLE(?Pla:Transport)
    DISABLE(?Pla:InkoopKGPrijs)
  END
  Resizer.Init(AppStrategy:NoResize,Resize:SetMinSize)     ! Don't change the windows controls when window resized
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('UpdatePlanningInkoop',QuickWindow)         ! Restore window settings from non-volatile store
  FDCB7.Init(Art:ArtikelOms,?Art:ArtikelOms,Queue:FileDropCombo.ViewPosition,FDCB7::View:FileDropCombo,Queue:FileDropCombo,Relate:ViewArtikel,ThisWindow,GlobalErrors,0,0,0)
  FDCB7.RemoveDuplicatesFlag = TRUE
  FDCB7.Q &= Queue:FileDropCombo
  FDCB7.AddSortOrder(Art:Artikel_FK01)
  FDCB7.AddField(Art:ArtikelOms,FDCB7.Q.Art:ArtikelOms) !List box control field - type derived from field
  FDCB7.AddUpdateField(Art:ArtikelID,Pla:ArtikelID)
  ThisWindow.AddItem(FDCB7.WindowComponent)
  FDCB7.DefaultFill = 0
  FDCB8.Init(Ver:VerpakkingOmschrijving,?Ver:VerpakkingOmschrijving,Queue:FileDropCombo:1.ViewPosition,FDCB8::View:FileDropCombo,Queue:FileDropCombo:1,Relate:Verpakking,ThisWindow,GlobalErrors,0,0,0)
  FDCB8.Q &= Queue:FileDropCombo:1
  FDCB8.AddSortOrder(Ver:Verpakking_PK)
  FDCB8.AddField(Ver:VerpakkingOmschrijving,FDCB8.Q.Ver:VerpakkingOmschrijving) !List box control field - type derived from field
  FDCB8.AddUpdateField(Ver:VerpakkingID,Pla:VerpakkingID)
  ThisWindow.AddItem(FDCB8.WindowComponent)
  FDCB8.DefaultFill = 0
  FDCB9.Init(CEL:CelOms,?CEL:CelOms,Queue:FileDropCombo:2.ViewPosition,FDCB9::View:FileDropCombo,Queue:FileDropCombo:2,Relate:Cel,ThisWindow,GlobalErrors,0,0,0)
  FDCB9.Q &= Queue:FileDropCombo:2
  FDCB9.AddSortOrder(CEL:CEL_PK)
  FDCB9.AddField(CEL:CelOms,FDCB9.Q.CEL:CelOms) !List box control field - type derived from field
  FDCB9.AddField(CEL:CelID,FDCB9.Q.CEL:CelID) !Primary key field - type derived from field
  FDCB9.AddUpdateField(CEL:CelID,Pla:CelID)
  ThisWindow.AddItem(FDCB9.WindowComponent)
  FDCB9.DefaultFill = 0
  FDCB11.Init(CL:Locatienaam,?CL:Locatienaam,Queue:FileDropCombo:3.ViewPosition,FDCB11::View:FileDropCombo,Queue:FileDropCombo:3,Relate:CelLocatie,ThisWindow,GlobalErrors,0,1,0)
  FDCB11.Q &= Queue:FileDropCombo:3
  FDCB11.AddSortOrder(CL:FK_CelLocatie)
  FDCB11.AddRange(CL:CelID,Pla:CelID)
  FDCB11.AddField(CL:Locatienaam,FDCB11.Q.CL:Locatienaam) !List box control field - type derived from field
  FDCB11.AddField(CL:CelLocatieID,FDCB11.Q.CL:CelLocatieID) !Primary key field - type derived from field
  FDCB11.AddUpdateField(CL:CelLocatieID,Pla:CelLocatieID)
  ThisWindow.AddItem(FDCB11.WindowComponent)
  FDCB11.DefaultFill = 0
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
    Relate:ACelLocatie.Close
    Relate:Cel.Close
    Relate:Inkoop.Close
    Relate:Mutatie.Close
    Relate:Verpakking.Close
    Relate:ViewArtikel.Close
  END
  IF SELF.Opened
    INIMgr.Update('UpdatePlanningInkoop',QuickWindow)      ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
            
   
  RETURN ReturnValue


ThisWindow.PrimeUpdate PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.PrimeUpdate()
    If returnValue = Level:Fatal  ! delete just occured
      ThisNetRefresh.Send('|Planning|ViewArtikel|Verpakking|Cel|CelLocatie|') ! NetTalk (NetRefresh)
    End
    	If returnValue = Level:Fatal  ! delete just occured
  		NetRefreshPlanningViews()
  	.
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
  	CLEAR(ACL:Record)
  	ACL:CelLocatieID=Pla:CelLocatieID
  	Access:ACelLocatie.TryFetch(ACL:PK_CelLocatie)
  	IF ACL:CelID <> Pla:CelID THEN Pla:CelLocatieID = 0.
  
  	LOC:ArtikelID = Pla:ArtikelID
  	LOC:Planning = Pla:Planning
  	LOC:VerpakkingID = Pla:VerpakkingID
  	LOC:CelID = Pla:CelID
  	LOC:CelLocatieID = Pla:CelLocatieID
  	LOC:Memo = Pla:Memo
  	LOC:Instructie = Pla:Instructie
      LOC:Transport = Pla:Transport
      LOC:InkoopKGPrijs = Pla:InkoopKGPrijs
  ReturnValue = PARENT.TakeCompleted()
      ! Gegevens van de vorige invoer worden niet meer overgekopieerd (verzoek Erik 19-3-2012)
      Pla:ArtikelID = LOC:ArtikelID
      Pla:Planning = LOC:Planning
  	Pla:VerpakkingID = LOC:VerpakkingID
  	Pla:CelID = LOC:CelID
  	Pla:CelLocatieID = LOC:CelLocatieID
  	Pla:Memo = LOC:Memo
  	Pla:Instructie = LOC:Instructie
      Pla:Transport = LOC:Transport
      Pla:InkoopKGPrijs = LOC:InkoopKGPrijs
  
  	LOC:SavedPlanningBuffer = Access:Planning.SaveBuffer()
  	LOC:SavedPlanningFile = Access:Planning.SaveFile()
  	VoorraadClass.BerekenPartijenInkoopPrijs()!Pla:InkoopID)
  	Access:Planning.RestoreBuffer(LOC:SavedPlanningBuffer)
  	Access:Planning.RestoreFile(LOC:SavedPlanningFile)
  		
  	ThisWindow.Reset(True)
    ThisNetRefresh.Send('|Planning|ViewArtikel|Verpakking|Cel|CelLocatie|') ! NetTalk (NetRefresh)
  	NetRefreshPlanningViews()
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
  If event() = event:VisibleOnDesktop !or event() = event:moved
    ds_VisibleOnDesktop()
  end
     IF KEYCODE()=CtrlShiftP AND EVENT() = Event:PreAlertKey
       CYCLE
     END
     IF KEYCODE()=CtrlShiftP  
        UD.ShowProcedureInfo('UpdatePlanningInkoop',UD.SetApplicationName('VoorrPln','DLL'),QuickWindow{PROP:Hlp},'10/06/2011 @ 04:10PM','06/28/2024 @ 01:22PM','10/11/2024 @ 01:55PM')  
    
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


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window

