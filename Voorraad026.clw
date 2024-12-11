

   MEMBER('Voorraad.clw')                                  ! This is a MEMBER module


   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABUTIL.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('VOORRAAD026.INC'),ONCE        !Local module procedure declarations
                     END


!!! <summary>
!!! Generated from procedure template - Window
!!! Form Gebruiker
!!! </summary>
UpdateGebruiker PROCEDURE 

udpt            UltimateDebugProcedureTracker
CurrentTab           STRING(80)                            ! 
ActionMessage        CSTRING(40)                           ! 
LocEnableEnterByTab  BYTE(1)                               !Used by the ENTER Instead of Tab template
EnterByTabManager    EnterByTabClass
History::Geb:Record  LIKE(Geb:RECORD),THREAD
QuickWindow          WINDOW('Form Gebruiker'),AT(,,358,205),FONT('MS Sans Serif',8,,FONT:regular,CHARSET:DEFAULT), |
  DOUBLE,CENTER,GRAY,IMM,MDI,HLP('UpdateGebruiker'),SYSTEM
                       ENTRY(@s100),AT(61,5,293,10),USE(Geb:WindowsInlog),READONLY
                       PROMPT('Windows Inlog:'),AT(1,5),USE(?Geb:WindowsInlog:Prompt),TRN
                       GROUP('Rechten'),AT(61,18,252,49),USE(?GROUP1),BOXED
                         CHECK('Prijzen Bekijken'),AT(71,28,80,8),USE(Geb:BekijkenPrijzen),VALUE('1','0')
                         CHECK('Uitslagen doen'),AT(71,39,100,8),USE(Geb:MakenVerkoopMutatie),VALUE('1','0')
                         CHECK('Administrator'),AT(71,50),USE(Geb:Administrator,,?Geb:Administrator:2),VALUE('1','0')
                         CHECK('Verwerken'),AT(155,28),USE(Geb:Verwerken),VALUE('1','0')
                         CHECK('Geen toegang tot deze administratie:'),AT(155,39),USE(Geb:GeenToegang),VALUE('1','0')
                       END
                       PROMPT('Volledige Naam:'),AT(1,71),USE(?Geb:VolledigeNaam:Prompt)
                       ENTRY(@s50),AT(61,70,291,10),USE(Geb:VolledigeNaam)
                       PROMPT('Handtekening:'),AT(1,84),USE(?Geb:Handtekening:Prompt)
                       ENTRY(@s100),AT(61,83,271,10),USE(Geb:Handtekening)
                       BUTTON('...'),AT(338,82,12,12),USE(?LookupFile)
                       PROMPT('res id:'),AT(1,101),USE(?Geb:res_id:Prompt)
                       ENTRY(@n-14),AT(61,100,60,10),USE(Geb:res_id),RIGHT(1)
                       BUTTON('&OK'),AT(241,182,49,14),USE(?OK),LEFT,ICON('WAOK.ICO'),DEFAULT,FLAT,MSG('Accept dat' & |
  'a and close the window'),TIP('Accept data and close the window')
                       BUTTON('&Annuleren'),AT(295,182,59,14),USE(?Cancel),LEFT,ICON('WACANCEL.ICO'),FLAT,MSG('Cancel operation'), |
  TIP('Cancel operation')
                       PROMPT('Email:'),AT(2,119),USE(?Geb:Email:Prompt)
                       ENTRY(@s100),AT(61,118,209,10),USE(Geb:Email)
                       PROMPT('Telefoon:'),AT(2,137),USE(?Geb:Telefoon:Prompt)
                       ENTRY(@s20),AT(61,136,60,10),USE(Geb:Telefoon)
                       CHECK('Niet Actief:'),AT(60,153),USE(Geb:NietActief)
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
Resizer              CLASS(WindowResizeClass)
Init                   PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)
                     END

FileLookup4          SelectFileClass
LocalClass          CLASS
CheckVerwijdering       Procedure(Geb:Record GebruikerRecord), Byte
                    END
CurCtrlFeq          LONG
FieldColorQueue     QUEUE
Feq                   LONG
OldColor              LONG
                    END

  CODE
? DEBUGHOOK(Gebruiker:Record)
? DEBUGHOOK(Inkoop:Record)
? DEBUGHOOK(Verkoop:Record)
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
    GlobalErrors.Throw(Msg:InsertIllegal)
    RETURN
  OF ChangeRecord
    ActionMessage = 'Record Will Be Changed'
  END
  QuickWindow{PROP:Text} = ActionMessage                   ! Display status message in title bar
  PARENT.Ask


ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
        udpt.Init(UD,'UpdateGebruiker','Voorraad026.clw','Voorraad.EXE','07/01/2024 @ 05:23PM')    
             
  GlobalErrors.SetProcedureName('UpdateGebruiker')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Geb:WindowsInlog
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.HistoryKey = CtrlH
  SELF.AddHistoryFile(Geb:Record,History::Geb:Record)
  SELF.AddHistoryField(?Geb:WindowsInlog,2)
  SELF.AddHistoryField(?Geb:BekijkenPrijzen,4)
  SELF.AddHistoryField(?Geb:MakenVerkoopMutatie,5)
  SELF.AddHistoryField(?Geb:Administrator:2,3)
  SELF.AddHistoryField(?Geb:Verwerken,6)
  SELF.AddHistoryField(?Geb:GeenToegang,12)
  SELF.AddHistoryField(?Geb:VolledigeNaam,7)
  SELF.AddHistoryField(?Geb:Handtekening,8)
  SELF.AddHistoryField(?Geb:res_id,9)
  SELF.AddHistoryField(?Geb:Email,10)
  SELF.AddHistoryField(?Geb:Telefoon,11)
  SELF.AddHistoryField(?Geb:NietActief,13)
  SELF.AddUpdateFile(Access:Gebruiker)
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  Relate:Gebruiker.Open                                    ! File Gebruiker used by this procedure, so make sure it's RelationManager is open
  Relate:Inkoop.SetOpenRelated()
  Relate:Inkoop.Open                                       ! File Inkoop used by this procedure, so make sure it's RelationManager is open
  Access:Verkoop.UseFile                                   ! File referenced in 'Other Files' so need to inform it's FileManager
  SELF.FilesOpened = True
  SELF.Primary &= Relate:Gebruiker
  IF SELF.Request = ViewRecord AND NOT SELF.BatchProcessing ! Setup actions for ViewOnly Mode
    SELF.InsertAction = Insert:None
    SELF.DeleteAction = Delete:None
    SELF.ChangeAction = Change:None
    SELF.CancelAction = Cancel:Cancel
    SELF.OkControl = 0
  ELSE
    SELF.InsertAction = Insert:None                        ! Inserts not allowed
    SELF.ChangeAction = Change:Caller                      ! Changes allowed
    SELF.CancelAction = Cancel:Cancel+Cancel:Query         ! Confirm cancel
    SELF.OkControl = ?OK
    IF SELF.PrimeUpdate() THEN RETURN Level:Notify.
  END
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
  QuickWindow{Prop:Alrt,255} = CtrlShiftP
  IF SELF.Request = ViewRecord                             ! Configure controls for View Only mode
    ?Geb:WindowsInlog{PROP:ReadOnly} = True
    ?Geb:VolledigeNaam{PROP:ReadOnly} = True
    ?Geb:Handtekening{PROP:ReadOnly} = True
    DISABLE(?LookupFile)
    ?Geb:res_id{PROP:ReadOnly} = True
    ?Geb:Email{PROP:ReadOnly} = True
    ?Geb:Telefoon{PROP:ReadOnly} = True
  END
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('UpdateGebruiker',QuickWindow)              ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  FileLookup4.Init
  FileLookup4.ClearOnCancel = True
  FileLookup4.Flags=BOR(FileLookup4.Flags,FILE:LongName)   ! Allow long filenames
  FileLookup4.SetMask('All Files','*.*')                   ! Set the file mask
  SELF.SetAlerts()
  EnterByTabManager.ExcludeControl(?Cancel)
  EnterByTabManager.ExcludeControl(?OK)
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
    Relate:Inkoop.Close
  END
  IF SELF.Opened
    INIMgr.Update('UpdateGebruiker',QuickWindow)           ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
            
   
  RETURN ReturnValue


ThisWindow.PrimeUpdate PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.PrimeUpdate()
    If returnValue = Level:Fatal  ! delete just occured
      ThisNetRefresh.Send('|Gebruiker|') ! NetTalk (NetRefresh)
    End
  RETURN ReturnValue


ThisWindow.Run PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
     
  ! [Priority 4500]
    if GlobalRequest=DELETERECORD
          CASE Message('Weet u zeker dat de gebruiker verwijderd moet worden','Akkoord verwijderen?',,BUTTON:YES+BUTTON:NO,bUTTON:NO)
           OF BUTTON:No
                Return ReturnValue
          END
          0{Prop:Cursor}=Cursor:Wait
          IF NOT LocalClass.CheckVerwijdering(Geb:Record)=Level:Benign
             0{Prop:Cursor}=Cursor:Arrow
             Return ReturnValue
         END
        
    end
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
    OF ?LookupFile
      ThisWindow.Update()
      Geb:Handtekening = FileLookup4.Ask(1)
      DISPLAY
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
    ThisNetRefresh.Send('|Gebruiker|') ! NetTalk (NetRefresh)
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
        UD.ShowProcedureInfo('UpdateGebruiker',UD.SetApplicationName('Voorraad','EXE'),QuickWindow{PROP:Hlp},'09/08/2011 @ 03:46PM','07/01/2024 @ 05:23PM','10/11/2024 @ 01:55PM')  
    
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

LocalClass.CheckVerwijdering        PROCEDURE(Geb:Record GebruikerRecord)  !, Byte
RETURNVALUE             BYTE 
CODE
    RETURNVALUE = Level:Benign
    ! okay wordt die nummer ergens gebruiker
    UD.Debug(GebruikerRecord.ID)
    if Access:Inkoop.IsOpened()=FALSE
        Access:Inkoop.Open()
        Access:Inkoop.UseFile()
    END
    
    Clear(Ink:Record)
    Set(Ink:PK_Inkoop)
    Inkoop{Prop:Where}='GebruikerID = '&GebruikerRecord.ID
    IF Access:Inkoop.Next()=Level:Benign
        Message('Gebruiker '&GebruikerRecord.ID&' komt voor in inkoop '&Ink:InkoopID,'Gebruiker controle',Icon:Cross)
        RETURNVALUE = Level:Notify
    END
    Set(Ink:PK_Inkoop)

    if Access:Verkoop.IsOpened()=FALSE
        Access:Verkoop.Open()
        Access:Verkoop.UseFile()
    END

    Clear(VeR:Record)
    Set(Ver2:PK_Verkoop)
    Verkoop{Prop:Where}='GebruikerID = '&GebruikerRecord.ID
    IF Access:Verkoop.Next()=Level:Benign
        Message('Gebruiker '&GebruikerRecord.ID&' komt voor in verkoop '&Ver2:VerkoopID,'Gebruiker controle',Icon:Cross)
        RETURNVALUE = Level:Notify
    END
    Set(Ver2:PK_Verkoop)
    
    IF ReturnValue=Level:Benign
        Access:Gebruiker.DeleteRecord(FALSE)  
        RETURNVALUE = Level:Notify
    END
    RETURN ReturnValue
    

Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window

