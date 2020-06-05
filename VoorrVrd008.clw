

   MEMBER('VoorrVrd.clw')                                  ! This is a MEMBER module


   INCLUDE('ABDROPS.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('VOORRVRD008.INC'),ONCE        !Local module procedure declarations
                     END


!!! <summary>
!!! Generated from procedure template - Window
!!! Form PalletMutatie
!!! </summary>
UpdatePalletMutatie PROCEDURE (LONG PalletSoortID, LONG RelatieSoort, LONG KlantID, LONG LeverancierID, LONG TransporteurID)

CurrentTab           STRING(80)                            ! 
ActionMessage        CSTRING(40)                           ! 
LOC:TransporteurID   LONG                                  ! 
LOC:RelatieID        LONG                                  ! 
LOC:Type             STRING(1)                             ! 
Loc:OverboekenTransporteur BYTE                            ! 
Loc:TransporteurRelatieID LONG                             ! 
Loc:TransporteurInkomend LONG                              ! 
Loc:TransporteurUitgaand LONG                              ! 
FDCB7::View:FileDropCombo VIEW(AViewTransporteur)
                       PROJECT(AVTRA:FirmaNaam)
                       PROJECT(AVTRA:Plaats)
                     END
FDCB4::View:FileDropCombo VIEW(ARelatie)
                       PROJECT(AREL:FirmaNaam)
                       PROJECT(AREL:Plaats)
                       PROJECT(AREL:Type)
                     END
FDCB9::View:FileDropCombo VIEW(AAViewTransporteur)
                       PROJECT(AAVTRA:FirmaNaam)
                       PROJECT(AAVTRA:TransporteurID)
                       PROJECT(AAVTRA:RelatieID)
                       PROJECT(AAVTRA:Adres1)
                       PROJECT(AAVTRA:Adres2)
                       PROJECT(AAVTRA:Postcode)
                       PROJECT(AAVTRA:Plaats)
                       PROJECT(AAVTRA:Telefoon)
                       PROJECT(AAVTRA:Mobiel)
                       PROJECT(AAVTRA:Fax)
                     END
Queue:FileDropCombo  QUEUE                            !
AVTRA:FirmaNaam        LIKE(AVTRA:FirmaNaam)          !List box control field - type derived from field
AVTRA:Plaats           LIKE(AVTRA:Plaats)             !List box control field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
Queue:FileDropCombo:1 QUEUE                           !
AREL:FirmaNaam         LIKE(AREL:FirmaNaam)           !List box control field - type derived from field
AREL:Plaats            LIKE(AREL:Plaats)              !List box control field - type derived from field
AREL:Type              LIKE(AREL:Type)                !Browse hot field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
Queue:FileDropCombo:3 QUEUE                           !
AAVTRA:FirmaNaam       LIKE(AAVTRA:FirmaNaam)         !List box control field - type derived from field
AAVTRA:TransporteurID  LIKE(AAVTRA:TransporteurID)    !Browse hot field - type derived from field
AAVTRA:RelatieID       LIKE(AAVTRA:RelatieID)         !Browse hot field - type derived from field
AAVTRA:Adres1          LIKE(AAVTRA:Adres1)            !Browse hot field - type derived from field
AAVTRA:Adres2          LIKE(AAVTRA:Adres2)            !Browse hot field - type derived from field
AAVTRA:Postcode        LIKE(AAVTRA:Postcode)          !Browse hot field - type derived from field
AAVTRA:Plaats          LIKE(AAVTRA:Plaats)            !Browse hot field - type derived from field
AAVTRA:Telefoon        LIKE(AAVTRA:Telefoon)          !Browse hot field - type derived from field
AAVTRA:Mobiel          LIKE(AAVTRA:Mobiel)            !Browse hot field - type derived from field
AAVTRA:Fax             LIKE(AAVTRA:Fax)               !Browse hot field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
LocEnableEnterByTab  BYTE(1)                               !Used by the ENTER Instead of Tab template
EnterByTabManager    EnterByTabClass
History::Pal:Record  LIKE(Pal:RECORD),THREAD
QuickWindow          WINDOW('Form PalletMutatie'),AT(,,267,169),FONT('MS Sans Serif',8,,FONT:regular,CHARSET:DEFAULT), |
  DOUBLE,CENTER,GRAY,IMM,MDI,HLP('UpdatePalletMutatie'),SYSTEM
                       PROMPT('Transporteur:'),AT(7,6),USE(?PROMPT1)
                       COMBO(@s50),AT(94,7,135,10),USE(AVTRA:FirmaNaam),LEFT,DROP(25,200),FORMAT('200L(2)|M~Fi' & |
  'rmanaam~C(0)@s50@400L(2)|M~Plaats~C(0)@s100@'),FROM(Queue:FileDropCombo),IMM
                       STRING('Klant:'),AT(7,22),USE(?STRING1)
                       STRING('Leverancier:'),AT(7,22),USE(?STRING2)
                       COMBO(@s50),AT(94,22,135,10),USE(AREL:FirmaNaam),DROP(25,200),FORMAT('200L(2)|M~Firmana' & |
  'am~C(0)@s50@400L(2)|M~Plaats~C(0)@s100@'),FROM(Queue:FileDropCombo:1),IMM
                       BUTTON('...'),AT(234,20,27),USE(?BUTTON1)
                       PROMPT('Datum:'),AT(7,38),USE(?PROMPT2)
                       ENTRY(@d06-),AT(94,38,64,10),USE(Pal:DatumTijd_DATE),REQ
                       ENTRY(@T01),AT(170,38,39,10),USE(Pal:DatumTijd_TIME),REQ
                       PROMPT('Inkomend:'),AT(7,66),USE(?Pal:Inkomend:Prompt),TRN
                       ENTRY(@n-14.),AT(94,68,64,10),USE(Pal:Inkomend),RIGHT
                       PROMPT('Uitgaand:'),AT(7,82),USE(?Pal:Uitgaand:Prompt),TRN
                       ENTRY(@n-14.),AT(94,82,64,10),USE(Pal:Uitgaand),RIGHT
                       PROMPT('Opmerking:'),AT(7,53),USE(?Pal:Opmerking:Prompt)
                       CHECK('Overboeken Transporteur:'),AT(7,102,96),USE(Loc:OverboekenTransporteur),LEFT
                       GROUP,AT(5,94,260,53),USE(?GROUPTransporteur),TRN
                         PROMPT('Inkomend:'),AT(7,116),USE(?Loc:TransporteurInkomend:Prompt)
                         ENTRY(@n-14),AT(94,117,60,10),USE(Loc:TransporteurInkomend),RIGHT(1)
                         PROMPT('Uitgaand:'),AT(7,131),USE(?Loc:TransporteurUitgaand:Prompt)
                         ENTRY(@n-14),AT(94,131,60,10),USE(Loc:TransporteurUitgaand),RIGHT(1)
                         COMBO(@s50),AT(105,102,155,10),USE(AAVTRA:FirmaNaam),DROP(25,200),FORMAT('200L(2)|M~Fir' & |
  'ma Naam~@s50@'),FROM(Queue:FileDropCombo:3),IMM
                       END
                       ENTRY(@s50),AT(94,53,166,10),USE(Pal:Opmerking)
                       BUTTON('&OK'),AT(156,151,49,14),USE(?OK),LEFT,ICON('WAOK.ICO'),DEFAULT,FLAT,MSG('Accept dat' & |
  'a and close the window'),TIP('Accept data and close the window')
                       BUTTON('&Cancel'),AT(211,151,49,14),USE(?Cancel),LEFT,ICON('WACANCEL.ICO'),FLAT,MSG('Cancel operation'), |
  TIP('Cancel operation')
                       STRING(@n_6),AT(7,155),USE(Pal:VerkoopID)
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

FDCB7                CLASS(FileDropComboClass)             ! File drop combo manager
Q                      &Queue:FileDropCombo           !Reference to browse queue type
                     END

FDCB4                CLASS(FileDropComboClass)             ! File drop combo manager
Q                      &Queue:FileDropCombo:1         !Reference to browse queue type
                     END

FDCB9                CLASS(FileDropComboClass)             ! File drop combo manager
Q                      &Queue:FileDropCombo:3         !Reference to browse queue type
                     END

CurCtrlFeq          LONG
FieldColorQueue     QUEUE
Feq                   LONG
OldColor              LONG
                    END
LocalClass          CLASS
BepaalNewMutatieID      PROCEDURE(), LONG
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
  GlobalErrors.SetProcedureName('UpdatePalletMutatie')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?PROMPT1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('LOC:Type',LOC:Type)                                ! Added by: FileDropCombo(ABC)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
  SELF.HistoryKey = CtrlH
  SELF.AddHistoryFile(Pal:Record,History::Pal:Record)
  SELF.AddHistoryField(?Pal:DatumTijd_DATE,10)
  SELF.AddHistoryField(?Pal:DatumTijd_TIME,11)
  SELF.AddHistoryField(?Pal:Inkomend,5)
  SELF.AddHistoryField(?Pal:Uitgaand,6)
  SELF.AddHistoryField(?Pal:Opmerking,12)
  SELF.AddHistoryField(?Pal:VerkoopID,13)
  SELF.AddUpdateFile(Access:PalletMutatie)
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  Relate:AAARelatie.Open                                   ! File AAARelatie used by this procedure, so make sure it's RelationManager is open
  Relate:AAViewTransporteur.Open                           ! File AAViewTransporteur used by this procedure, so make sure it's RelationManager is open
  Relate:APalletMutatie.Open                               ! File APalletMutatie used by this procedure, so make sure it's RelationManager is open
  Relate:ARelatie.Open                                     ! File ARelatie used by this procedure, so make sure it's RelationManager is open
  Relate:AViewTransporteur.Open                            ! File AViewTransporteur used by this procedure, so make sure it's RelationManager is open
  Relate:PalletMutatie.SetOpenRelated()
  Relate:PalletMutatie.Open                                ! File PalletMutatie used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Primary &= Relate:PalletMutatie
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
  SELF.Open(QuickWindow)                                   ! Open window
  IF ThisWindow.Request = InsertRecord THEN
      Pal:DatumTijd_DATE=TODAY()
      Pal:DatumTijd_TIME=CLOCK()
      
      Pal:PalletSoortID = PalletSoortID
  
      LOC:TransporteurID = 0
      AVTRA:FirmaNaam = ''
      LOC:RelatieID = 0
      AREL:FirmaNaam = ''
      
      IF RelatieSoort = 1 OR RelatieSoort = 2 OR RelatieSoort = 4 THEN
          Pal:Transporteur = 0
          HIDE(?PROMPT1)
          HIDE(?AVTRA:FirmaNaam)
          
          IF RelatieSoort = 2 THEN
              LOC:RelatieID = LeverancierID
              LOC:Type='S'
              HIDE(?STRING1)
          ELSE
              LOC:RelatieID = KlantID
              LOC:Type='C'
              HIDE(?STRING2)
          .
      ELSE
          Pal:Transporteur = 1
          LOC:TransporteurID = TransporteurID
          HIDE(?STRING1)
          HIDE(?STRING2)
          HIDE(?AREL:FirmaNaam)
          HIDE(?BUTTON1)
      .
  ELSE
      db.DebugOut('ChangeRecord:' & Pal:PlanningID & ',' & FORMAT(Pal:DatumTijd_DATE, @d6-))
      If Pal:PlanningID > 0  THEN
          HIDE(?PROMPT1)
          HIDE(?AVTRA:FirmaNaam)
          
          HIDE(?STRING1)
          HIDE(?STRING2)
          HIDE(?AREL:FirmaNaam)
          HIDE(?BUTTON1)
          
          HIDE(?PROMPT2)
          HIDE(?Pal:DatumTijd_DATE)
          HIDE(?Pal:DatumTijd_TIME)
      ELSE
          IF Pal:Transporteur
              LOC:TransporteurID = Pal:RelatieID
              HIDE(?STRING1)
              HIDE(?STRING2)
              HIDE(?AREL:FirmaNaam)
              HIDE(?BUTTON1)
              HIDE(?Loc:OverboekenTransporteur)
          ELSE
              LOC:RelatieID = Pal:RelatieID
              CLEAR(AAARel:Record)
              AAARel:RelatieID = Pal:RelatieID
              Access:AAARelatie.TryFetch(AAARel:Relatie_PK)
              
              IF AAARel:Type = 'S' THEN
                  LOC:Type='S'
                  HIDE(?STRING1)
              ELSE
                  LOC:Type='C'
                  HIDE(?STRING2)
              .
              
              HIDE(?PROMPT1)
              HIDE(?AVTRA:FirmaNaam)
          .
      .
      ! herstel de oude palletmutaties voor 2018-6-20 daar wordt de PalletMutatieID niet weggeschreven
      ! dus de bijbehorende pallet mutatie zoeken via 
      IF NOT Pal:Transporteur
          IF Pal:TransporteurPalletMutatieID=0 AND Pal:VerkoopID <>0 THEN
              Clear(APM:Record)
              APM:VerkoopID=Pal:VerkoopID
              APM:PalletSoortID=PAL:PalletSoortID
              APM:Transporteur=1
              IF Access:APalletMutatie.Fetch(APM:PalletMutatie_FK5)=Level:Benign
                  Loc:TransporteurRelatieID=APM:RelatieID
                  DISPLAY(?AVTRA:FirmaNaam)
                  Loc:TransporteurInkomend=APM:Inkomend
                  Loc:TransporteurUitgaand=APM:Uitgaand
                  Loc:OverboekenTransporteur=TRUE
                  Pal:TransporteurPalletMutatieID = APM:PalletMutatieID
              ELSE
                  Loc:OverboekenTransporteur=FALSE
                  Clear(AVTRA:FirmaNaam)
              END
          ELSIF NOT Pal:TransporteurPalletMutatieID=0 
              Loc:OverboekenTransporteur=TRUE
              Clear(APM:Record)
              APM:PalletMutatieID=Pal:TransporteurPalletMutatieID
              IF Access:APalletMutatie.Fetch(APM:PalletMutatie_PK)=Level:Benign
                  Loc:TransporteurRelatieID=APM:RelatieID
                  DISPLAY(?AVTRA:FirmaNaam)
                  Loc:TransporteurInkomend=APM:Inkomend
                  Loc:TransporteurUitgaand=APM:Uitgaand
              END
          END
      END
  .
  WinAlertMouseZoom()
  Do DefineListboxStyle
  IF SELF.Request = ViewRecord                             ! Configure controls for View Only mode
    DISABLE(?AVTRA:FirmaNaam)
    DISABLE(?AREL:FirmaNaam)
    DISABLE(?BUTTON1)
    ?Pal:DatumTijd_DATE{PROP:ReadOnly} = True
    ?Pal:DatumTijd_TIME{PROP:ReadOnly} = True
    ?Pal:Inkomend{PROP:ReadOnly} = True
    ?Pal:Uitgaand{PROP:ReadOnly} = True
    ?Loc:TransporteurInkomend{PROP:ReadOnly} = True
    ?Loc:TransporteurUitgaand{PROP:ReadOnly} = True
    DISABLE(?AAVTRA:FirmaNaam)
    ?Pal:Opmerking{PROP:ReadOnly} = True
  END
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('UpdatePalletMutatie',QuickWindow)          ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  Clear(AAVTRA:RECORD)
  If Loc:OverboekenTransporteur AND Loc:TransporteurRelatieID Then    
      AAVTRA:RelatieID=Loc:TransporteurRelatieID
      If Access:AAViewTransporteur.Fetch(AAVTRA:ViewTransporteur_FK1) = Level:Benign Then
          DISPLAY(?AAVTRA:FirmaNaam)
      End
  End
        
  IF ?Loc:OverboekenTransporteur{Prop:Checked}
    ENABLE(?GROUPTransporteur)
  END
  IF NOT ?Loc:OverboekenTransporteur{PROP:Checked}
    DISABLE(?GROUPTransporteur)
  END
  FDCB7.Init(AVTRA:FirmaNaam,?AVTRA:FirmaNaam,Queue:FileDropCombo.ViewPosition,FDCB7::View:FileDropCombo,Queue:FileDropCombo,Relate:AViewTransporteur,ThisWindow,GlobalErrors,0,1,0)
  FDCB7.Q &= Queue:FileDropCombo
  FDCB7.AddSortOrder(AVTRA:ViewTransporteur_FK1)
  FDCB7.AddField(AVTRA:FirmaNaam,FDCB7.Q.AVTRA:FirmaNaam) !List box control field - type derived from field
  FDCB7.AddField(AVTRA:Plaats,FDCB7.Q.AVTRA:Plaats) !List box control field - type derived from field
  FDCB7.AddUpdateField(AVTRA:RelatieID,LOC:TransporteurID)
  ThisWindow.AddItem(FDCB7.WindowComponent)
  FDCB7.DefaultFill = 0
  FDCB4.Init(AREL:FirmaNaam,?AREL:FirmaNaam,Queue:FileDropCombo:1.ViewPosition,FDCB4::View:FileDropCombo,Queue:FileDropCombo:1,Relate:ARelatie,ThisWindow,GlobalErrors,0,1,0)
  FDCB4.Q &= Queue:FileDropCombo:1
  FDCB4.AddSortOrder(AREL:Relatie_FK01)
  FDCB4.SetFilter('ARel:Type=LOC:Type')
  FDCB4.AddField(AREL:FirmaNaam,FDCB4.Q.AREL:FirmaNaam) !List box control field - type derived from field
  FDCB4.AddField(AREL:Plaats,FDCB4.Q.AREL:Plaats) !List box control field - type derived from field
  FDCB4.AddField(AREL:Type,FDCB4.Q.AREL:Type) !Browse hot field - type derived from field
  FDCB4.AddUpdateField(AREL:RelatieID,LOC:RelatieID)
  ThisWindow.AddItem(FDCB4.WindowComponent)
  FDCB4.DefaultFill = 0
  FDCB9.Init(AAVTRA:FirmaNaam,?AAVTRA:FirmaNaam,Queue:FileDropCombo:3.ViewPosition,FDCB9::View:FileDropCombo,Queue:FileDropCombo:3,Relate:AAViewTransporteur,ThisWindow,GlobalErrors,0,1,0)
  FDCB9.Q &= Queue:FileDropCombo:3
  FDCB9.AddSortOrder(AAVTRA:ViewTransporteur_FK1)
  FDCB9.AddField(AAVTRA:FirmaNaam,FDCB9.Q.AAVTRA:FirmaNaam) !List box control field - type derived from field
  FDCB9.AddField(AAVTRA:TransporteurID,FDCB9.Q.AAVTRA:TransporteurID) !Browse hot field - type derived from field
  FDCB9.AddField(AAVTRA:RelatieID,FDCB9.Q.AAVTRA:RelatieID) !Browse hot field - type derived from field
  FDCB9.AddField(AAVTRA:Adres1,FDCB9.Q.AAVTRA:Adres1) !Browse hot field - type derived from field
  FDCB9.AddField(AAVTRA:Adres2,FDCB9.Q.AAVTRA:Adres2) !Browse hot field - type derived from field
  FDCB9.AddField(AAVTRA:Postcode,FDCB9.Q.AAVTRA:Postcode) !Browse hot field - type derived from field
  FDCB9.AddField(AAVTRA:Plaats,FDCB9.Q.AAVTRA:Plaats) !Browse hot field - type derived from field
  FDCB9.AddField(AAVTRA:Telefoon,FDCB9.Q.AAVTRA:Telefoon) !Browse hot field - type derived from field
  FDCB9.AddField(AAVTRA:Mobiel,FDCB9.Q.AAVTRA:Mobiel) !Browse hot field - type derived from field
  FDCB9.AddField(AAVTRA:Fax,FDCB9.Q.AAVTRA:Fax) !Browse hot field - type derived from field
  FDCB9.AddUpdateField(AAVTRA:RelatieID,Loc:TransporteurRelatieID)
  ThisWindow.AddItem(FDCB9.WindowComponent)
  FDCB9.DefaultFill = 0
  If ?Loc:OverboekenTransporteur{PROP:Hide} = True Then
      Hide(?GROUPTransporteur)
  End    
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
    Relate:AAARelatie.Close
    Relate:AAViewTransporteur.Close
    Relate:APalletMutatie.Close
    Relate:ARelatie.Close
    Relate:AViewTransporteur.Close
    Relate:PalletMutatie.Close
  END
  IF SELF.Opened
    INIMgr.Update('UpdatePalletMutatie',QuickWindow)       ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.PrimeUpdate PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.PrimeUpdate()
    If returnValue = Level:Fatal  ! delete just occured
      ThisNetRefresh.Send('|PalletMutatie|AViewTransporteur|ARelatie|AAViewTransporteur|') ! NetTalk (NetRefresh)
    End
  RETURN ReturnValue


ThisWindow.Run PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  IF Globalrequest=DeleteRecord
      if Pal:PlanningID > 0 THEN
  		! Het betreft een mutatie gekoppeld aan een CMR
          MESSAGE('Deze mutatie is gekoppeld aan een CMR en kan niet verwijderd worden.')
          RETURN ReturnValue
      .
      IF Pal:TransporteurPalletMutatieID<>0
          Clear(APM:Record)
          APM:PalletMutatieID=Pal:TransporteurPalletMutatieID
          IF Access:APalletMutatie.Fetch(APM:PalletMutatie_PK)=Level:Benign
              Access:APalletMutatie.DeleteRecord(FALSE)
          END
      END
  .
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
    OF ?BUTTON1
      ThisWindow.Update()
      GlobalRequest = SelectRecord
      SelectARelatie(LOC:Type)
      ThisWindow.Reset
      	if globalresponse=RequestCompleted
      		Loc:RelatieID = AREL:RelatieID
      		FDCB4.ResetQueue(True)
      	END
    OF ?Loc:OverboekenTransporteur
      IF ?Loc:OverboekenTransporteur{PROP:Checked}
        ENABLE(?GROUPTransporteur)
      END
      IF NOT ?Loc:OverboekenTransporteur{PROP:Checked}
        DISABLE(?GROUPTransporteur)
      END
      ThisWindow.Reset()
    OF ?OK
      ThisWindow.Update()
      If Loc:OverboekenTransporteur = TRUE AND Loc:TransporteurRelatieID = 0 Then
          Select(?AAVTRA:FirmaNaam)
          0{Prop:AcceptAll} = False
          Cycle
      End
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
  IF Pal:PlanningID = 0 THEN
      IF Pal:Transporteur THEN
          IF LOC:TransporteurID = 0 THEN
              CYCLE
          .
  		
          Pal:RelatieID = LOC:TransporteurID
      ELSE
          IF LOC:RelatieID = 0 THEN
              CYCLE
          .
  			
          Pal:RelatieID = LOC:RelatieID
      .
  ELSE
      IF ThisWindow.Request = ChangeRecord THEN
              
  			! Het betreft een CMR-gekoppelde mutatie, zoek een eventuele ander om bij te werken
              ! ondrstaande code sinds 2010-6-15 overbodig warrschijnlijk		
  !			CLEAR(APM:Record)
  !			APM:PlanningID = Pal:PlanningID
  !			SET(APM:PalletMutatie_FK3,APM:PalletMutatie_FK3)
  !			LOOP UNTIL Access:APalletMutatie.Next()
  !				IF APM:PlanningID <> Pal:PlanningID THEN BREAK.
  !				IF APM:PalletMutatieID = Pal:PalletMutatieID THEN CYCLE.
  !				
  !				!Enkele uitgaande pallets zijn gekoppeld
  !				!APM:Inkomend = Pal:Inkomend
  !				APM:Uitgaand = Pal:Uitgaand
  !				Access:APalletMutatie.Update()
  !			.
      .
  .
          
  ! nieuw
  IF Loc:OverboekenTransporteur=TRUE 
      IF Pal:TransporteurPalletMutatieID=0 AND (Loc:TransporteurInkomend<>0 or Loc:TransporteurUitgaand<>0)
          IF NOT Pal:VerkoopID=0
              Clear(APM:Record)
              APM:VerkoopID=Pal:VerkoopID
              APM:PalletSoortID=PAL:PalletSoortID
              APM:Transporteur=1
              IF Access:APalletMutatie.Fetch(APM:PalletMutatie_FK5)=Level:Benign 
                  APM:Inkomend=Loc:TransporteurInkomend
                  APM:Uitgaand=Loc:TransporteurUitgaand
                  Access:APalletMutatie.Update()
              ELSE
                  CLEAR(APM:Record)
                  APM:Record=PAL:Record
                  APM:RelatieID = Loc:TransporteurRelatieID
                  APM:Transporteur =1
                  APM:Inkomend=Loc:TransporteurInkomend
                  APM:Uitgaand=Loc:TransporteurUitgaand
                  Access:APalletMutatie.Insert()
                  ! AANGEPAST 6-7-2018 HG anders geeft hij het originele ID
                  IF Access:APalletMutatie.Fetch(Pal:PalletMutatie_FK5)=Level:Benign
                      PAL:TransporteurPalletMutatieID = APM:PalletMutatieID
                  END
              END    
          ELSE
              CLEAR(APM:Record)
              APM:RelatieID = Loc:TransporteurRelatieID
              APM:PalletSoortID=Pal:PalletSoortID
              APM:PlanningID=Pal:PlanningID
              APM:DatumTijd_DATE=Pal:DatumTijd_DATE
              APM:DatumTijd_TIME=Pal:DatumTijd_TIME
              APM:Opmerking=Pal:Opmerking
              APM:VerkoopID=Pal:VerkoopID
              APM:TransporteurPalletMutatieID=0
              APM:Transporteur =1
              APM:Inkomend=Loc:TransporteurInkomend
              APM:Uitgaand=Loc:TransporteurUitgaand
              Access:APalletMutatie.Insert()
              
              Clear(APM:Record)
              APM:PalletMutatieID=LocalClass.BepaalNewMutatieID()
              ! AANGEPAST 6-7-2018 HG anders geeft hij het originele ID
              IF Access:APalletMutatie.Fetch(APM:PalletMutatie_PK)=Level:Benign
                  PAL:TransporteurPalletMutatieID = APM:PalletMutatieID
              END
          END
      ELSIF Pal:TransporteurPalletMutatieID<>0 
          CLEAR(APM:Record)
          APM:PalletMutatieID = Pal:TransporteurPalletMutatieID
          IF Access:APalletMutatie.Fetch(APM:PalletMutatie_PK)=Level:Benign
              APM:RelatieID = Loc:TransporteurRelatieID
              APM:Transporteur =1
              APM:Inkomend=Loc:TransporteurInkomend
              APM:Uitgaand=Loc:TransporteurUitgaand
              Access:APalletMutatie.Update()
          END
      END
  ELSE 
      IF Pal:TransporteurPalletMutatieID<>0 
          CLEAR(APM:Record)
          APM:PalletMutatieID = Pal:TransporteurPalletMutatieID
          IF Access:APalletMutatie.Fetch(APM:PalletMutatie_PK)=Level:Benign
              Access:APalletMutatie.DeleteRecord(False)
              Pal:TransporteurPalletMutatieID=0
          END
      END
  END
  ReturnValue = PARENT.TakeCompleted()
    ThisNetRefresh.Send('|PalletMutatie|AViewTransporteur|ARelatie|AAViewTransporteur|') ! NetTalk (NetRefresh)
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

LocalClass.BepaalNewMutatieID        PROCEDURE()
                                        
mutatieid               LONG                                        
CODE
    Clear(APM:Record)
    Clear(APM:PalletMutatieID,1)
    Set(APM:PalletMutatie_PK,APM:PalletMutatie_PK)
    if Access:APalletMutatie.Previous()=Level:Benign
        mutatieid = APM:PalletMutatieID
    END
    return mutatieid 

Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window

