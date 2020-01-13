

   MEMBER('VoorrPln.clw')                                  ! This is a MEMBER module


   INCLUDE('ABDROPS.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('VOORRPLN028.INC'),ONCE        !Local module procedure declarations
                     END


!!! <summary>
!!! Generated from procedure template - Window
!!! Form Partij
!!! </summary>
UpdateInslag PROCEDURE 

CurrentTab           STRING(80)                            !
ActionMessage        CSTRING(40)                           !
FDB7::View:FileDrop  VIEW(Cel)
                       PROJECT(CEL:CelOms)
                       PROJECT(CEL:CelID)
                     END
FDB8::View:FileDrop  VIEW(Verpakking)
                       PROJECT(Ver:VerpakkingOmschrijving)
                     END
FDB9::View:FileDrop  VIEW(Relatie)
                       PROJECT(Rel:FirmaNaam)
                     END
Queue:FileDrop       QUEUE                            !Queue declaration for browse/combo box using ?CEL:CelOms
CEL:CelOms             LIKE(CEL:CelOms)               !List box control field - type derived from field
CEL:CelID              LIKE(CEL:CelID)                !Primary key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
Queue:FileDrop:1     QUEUE                            !Queue declaration for browse/combo box using ?Ver:VerpakkingOmschrijving
Ver:VerpakkingOmschrijving LIKE(Ver:VerpakkingOmschrijving) !List box control field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
Queue:FileDrop:2     QUEUE                            !Queue declaration for browse/combo box using ?Rel:FirmaNaam
Rel:FirmaNaam          LIKE(Rel:FirmaNaam)            !List box control field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
LocEnableEnterByTab  BYTE(1)                               !Used by the ENTER Instead of Tab template
EnterByTabManager    EnterByTabClass
History::Par:Record  LIKE(Par:RECORD),THREAD
QuickWindow          WINDOW('Form Partij'),AT(,,300,219),FONT('MS Sans Serif',8,,,CHARSET:DEFAULT),RESIZE,CENTER, |
  GRAY,IMM,MDI,HLP('UpdateInslag'),SYSTEM
                       SHEET,AT(4,4,294,191),USE(?CurrentTab)
                         TAB('&1) General'),USE(?Tab:1)
                           PROMPT('Partij ID:'),AT(8,20),USE(?Par:PartijID:Prompt),TRN
                           ENTRY(@n-14),AT(88,20,64,10),USE(Par:PartijID),DISABLE
                           PROMPT('Artikel ID:'),AT(8,34),USE(?Par:ArtikelID:Prompt),TRN
                           ENTRY(@s30),AT(88,34,124,10),USE(Par:ArtikelID),HIDE
                           PROMPT('Aanmaak Datum DATE:'),AT(8,48),USE(?Par:AanmaakDatum_DATE:Prompt),TRN
                           ENTRY(@d6-),AT(88,48,104,10),USE(Par:AanmaakDatum_DATE),SKIP
                           PROMPT('Aanmaak Datum TIME:'),AT(8,62),USE(?Par:AanmaakDatum_TIME:Prompt),TRN
                           ENTRY(@t7),AT(88,62,104,10),USE(Par:AanmaakDatum_TIME),SKIP
                           PROMPT('KG:'),AT(8,76),USE(?Par:KG:Prompt),TRN
                           ENTRY(@n-10`2),AT(88,76,104,10),USE(Par:KG),DECIMAL(12)
                           PROMPT('Pallets:'),AT(8,90),USE(?Par:Pallets:Prompt),TRN
                           ENTRY(@n-14),AT(88,90,64,10),USE(Par:Pallets)
                           PROMPT('Verpakking ID:'),AT(8,104),USE(?Par:VerpakkingID:Prompt),RIGHT,TRN
                           PROMPT('Leverancier:'),AT(8,119),USE(?Par:Leverancier:Prompt),RIGHT,TRN
                           CHECK('Verwerkt:'),AT(88,132,70,8),USE(Par:Verwerkt)
                           PROMPT('Cel:'),AT(8,144),USE(?Par:CELID:Prompt),RIGHT,TRN
                           ENTRY(@n-14),AT(88,160,64,10),USE(Par:PalletsGeprint),RIGHT(1)
                           PROMPT('Referentie:'),AT(8,174),USE(?Par:Referentie:Prompt),TRN
                           ENTRY(@s50),AT(88,174,204,10),USE(Par:Referentie)
                           PROMPT('Pallets Geprint:'),AT(8,160),USE(?Par:PalletsGeprint:Prompt),RIGHT,TRN
                           STRING(@s60),AT(87,34,207),USE(Art:ArtikelOms),FONT('Microsoft Sans Serif',,,FONT:bold,CHARSET:ANSI)
                           LIST,AT(89,144,64,10),USE(CEL:CelOms),DROP(5),FORMAT('200L(2)~Cel Oms~L(0)@s50@'),FROM(Queue:FileDrop)
                           LIST,AT(88,105,64,10),USE(Ver:VerpakkingOmschrijving),DROP(5),FORMAT('200L(2)~Verpakkin' & |
  'g Omschrijving~L(0)@s50@'),FROM(Queue:FileDrop:1)
                           LIST,AT(88,119,199,10),USE(Rel:FirmaNaam),DROP(5),FORMAT('200L(2)~Firma Naam~L(0)@s50@'),FROM(Queue:FileDrop:2)
                         END
                       END
                       BUTTON('&OK'),AT(194,199,49,14),USE(?OK),LEFT,ICON('WAOK.ICO'),DEFAULT,FLAT,MSG('Accept dat' & |
  'a and close the window'),TIP('Accept data and close the window')
                       BUTTON('&Cancel'),AT(247,199,49,14),USE(?Cancel),LEFT,ICON('WACANCEL.ICO'),FLAT,MSG('Cancel operation'), |
  TIP('Cancel operation')
                     END

ThisWindow           CLASS(WindowManager)
Ask                    PROCEDURE(),DERIVED
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
PrimeUpdate            PROCEDURE(),BYTE,PROC,DERIVED
Reset                  PROCEDURE(BYTE Force=0),DERIVED
Run                    PROCEDURE(),BYTE,PROC,DERIVED
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED
TakeCompleted          PROCEDURE(),BYTE,PROC,DERIVED
TakeEvent              PROCEDURE(),BYTE,PROC,DERIVED
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
FDB7                 CLASS(FileDropClass)                  ! File drop manager
Q                      &Queue:FileDrop                !Reference to display queue
                     END

FDB8                 CLASS(FileDropClass)                  ! File drop manager
Q                      &Queue:FileDrop:1              !Reference to display queue
                     END

FDB9                 CLASS(FileDropClass)                  ! File drop manager
Q                      &Queue:FileDrop:2              !Reference to display queue
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
  GlobalErrors.SetProcedureName('UpdateInslag')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Par:PartijID:Prompt
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
  SELF.AddUpdateFile(Access:Partij)
  SELF.HistoryKey = CtrlH
  SELF.AddHistoryFile(Par:Record,History::Par:Record)
  SELF.AddHistoryField(?Par:PartijID,1)
  SELF.AddHistoryField(?Par:ArtikelID,2)
  SELF.AddHistoryField(?Par:AanmaakDatum_DATE,5)
  SELF.AddHistoryField(?Par:AanmaakDatum_TIME,6)
  SELF.AddHistoryField(?Par:KG,7)
  SELF.AddHistoryField(?Par:Pallets,8)
  SELF.AddHistoryField(?Par:Verwerkt,11)
  SELF.AddHistoryField(?Par:PalletsGeprint,13)
  SELF.AddHistoryField(?Par:Referentie,14)
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  Relate:Cel.SetOpenRelated()
  Relate:Cel.Open                                          ! File Cel used by this procedure, so make sure it's RelationManager is open
  Relate:Mutatie.Open                                      ! File Mutatie used by this procedure, so make sure it's RelationManager is open
  Relate:Partij.Open                                       ! File Partij used by this procedure, so make sure it's RelationManager is open
  Relate:Planning.SetOpenRelated()
  Relate:Planning.Open                                     ! File Planning used by this procedure, so make sure it's RelationManager is open
  Relate:Verpakking.Open                                   ! File Verpakking used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Primary &= Relate:Partij
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
  	Par:Verwerkt = True
  SELF.Open(QuickWindow)                                   ! Open window
  Do DefineListboxStyle
  IF SELF.Request = ViewRecord                             ! Configure controls for View Only mode
    ?Par:PartijID{PROP:ReadOnly} = True
    ?Par:ArtikelID{PROP:ReadOnly} = True
    ?Par:AanmaakDatum_DATE{PROP:ReadOnly} = True
    ?Par:AanmaakDatum_TIME{PROP:ReadOnly} = True
    ?Par:KG{PROP:ReadOnly} = True
    ?Par:Pallets{PROP:ReadOnly} = True
    ?Par:PalletsGeprint{PROP:ReadOnly} = True
    ?Par:Referentie{PROP:ReadOnly} = True
    DISABLE(?CEL:CelOms)
    DISABLE(?Ver:VerpakkingOmschrijving)
    DISABLE(?Rel:FirmaNaam)
  END
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('UpdateInslag',QuickWindow)                 ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  FDB7.Init(?CEL:CelOms,Queue:FileDrop.ViewPosition,FDB7::View:FileDrop,Queue:FileDrop,Relate:Cel,ThisWindow)
  FDB7.Q &= Queue:FileDrop
  FDB7.AddSortOrder(CEL:CEL_PK)
  FDB7.AddField(CEL:CelOms,FDB7.Q.CEL:CelOms) !List box control field - type derived from field
  FDB7.AddField(CEL:CelID,FDB7.Q.CEL:CelID) !Primary key field - type derived from field
  FDB7.AddUpdateField(CEL:CelID,Par:CELID)
  ThisWindow.AddItem(FDB7.WindowComponent)
  FDB7.DefaultFill = 0
  FDB8.Init(?Ver:VerpakkingOmschrijving,Queue:FileDrop:1.ViewPosition,FDB8::View:FileDrop,Queue:FileDrop:1,Relate:Verpakking,ThisWindow)
  FDB8.Q &= Queue:FileDrop:1
  FDB8.AddSortOrder(Ver:Verpakking_PK)
  FDB8.AddField(Ver:VerpakkingOmschrijving,FDB8.Q.Ver:VerpakkingOmschrijving) !List box control field - type derived from field
  FDB8.AddUpdateField(Ver:VerpakkingID,Par:VerpakkingID)
  ThisWindow.AddItem(FDB8.WindowComponent)
  FDB8.DefaultFill = 0
  FDB9.Init(?Rel:FirmaNaam,Queue:FileDrop:2.ViewPosition,FDB9::View:FileDrop,Queue:FileDrop:2,Relate:Relatie,ThisWindow)
  FDB9.Q &= Queue:FileDrop:2
  FDB9.AddSortOrder(Rel:Relatie_FK01)
  FDB9.AddField(Rel:FirmaNaam,FDB9.Q.Rel:FirmaNaam) !List box control field - type derived from field
  FDB9.AddUpdateField(Rel:RelatieID,Par:Leverancier)
  ThisWindow.AddItem(FDB9.WindowComponent)
  FDB9.DefaultFill = 0
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
    Relate:Cel.Close
    Relate:Mutatie.Close
    Relate:Partij.Close
    Relate:Planning.Close
    Relate:Verpakking.Close
  END
  IF SELF.Opened
    INIMgr.Update('UpdateInslag',QuickWindow)              ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.PrimeUpdate PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.PrimeUpdate()
    If returnValue = Level:Fatal  ! delete just occured
      ThisNetRefresh.Send('|Partij|Cel|Verpakking|Relatie|') ! NetTalk (NetRefresh)
    End
  RETURN ReturnValue


ThisWindow.Reset PROCEDURE(BYTE Force=0)

  CODE
  SELF.ForcedReset += Force
  IF QuickWindow{Prop:AcceptAll} THEN RETURN.
  Art:ArtikelID = Par:ArtikelID                            ! Assign linking field value
  Access:ViewArtikel.Fetch(Art:Artikel_PK)
  PARENT.Reset(Force)


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
      ThisWindow.Update
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
  	If Self.Response=RequestCompleted
  	! dan moet ik nu de bevestiging doorvoeren in de mutaties
  		Clear(MUT:Record)
  		Mut:PartijID = Par:PartijID
  		Set(Mut:Mutatie_FK01,Mut:Mutatie_FK01)
  		If Not Access:Mutatie.Next() 
  			if Mut:PartijID = Par:PartijID
  				Mut:PlanningID = Pla:PlanningID
  				Mut:InslagKG = Par:KG
  				Mut:InslagPallet = Par:Pallets
  				Access:Mutatie.Update()
  				
  				VoorraadClass.BerekenPlanningMutatieGrootte(Pla:PlanningID)
  			End
  		End
  		
  ReportInslag()
  	End
    ThisNetRefresh.Send('|Partij|Cel|Verpakking|Relatie|') ! NetTalk (NetRefresh)
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
  ReturnValue = PARENT.TakeWindowEvent()
    CASE EVENT()
    OF EVENT:OpenWindow
        ds_VisibleOnDesktop()
    END
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window

