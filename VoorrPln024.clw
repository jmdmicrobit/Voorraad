

   MEMBER('VoorrPln.clw')                                  ! This is a MEMBER module


   INCLUDE('ABDROPS.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('VOORRPLN024.INC'),ONCE        !Local module procedure declarations
                     END


!!! <summary>
!!! Generated from procedure template - Window
!!! Window
!!! </summary>
UpdateUitslagMutatieQueue PROCEDURE (PRM:ArtikelID)

LOC:AantalKG         DECIMAL(10,2)                         ! 
LOC:AantalPallets    LONG                                  ! 
LOC:PartijCelID      STRING(25)                            ! 
LOC:CelID            LONG                                  ! 
LOC:PartijID         LONG                                  ! 
LOC:PartijVoorraadKG DECIMAL(10,2)                         ! 
LOC:PartijVoorraadPallet LONG                              ! 
LOC:LeverancierFirmanaam STRING(50)                        ! 
LOC:VerpakkingOmschrijving CSTRING(51)                     ! 
LOC:ArtikelID        CSTRING(31)                           ! 
FDCB6::View:FileDropCombo VIEW(AAAAViewVoorraadPartij)
                       PROJECT(AAAAVVPar:PartijCelID)
                       PROJECT(AAAAVVPar:PartijID)
                       PROJECT(AAAAVVPar:ExternPartijnr)
                       PROJECT(AAAAVVPar:CelOms)
                       PROJECT(AAAAVVPar:AanmaakDatum_DATE)
                       PROJECT(AAAAVVPar:BerekendeInkoopKGPrijs)
                       PROJECT(AAAAVVPar:VerpakkingOmschrijving)
                       PROJECT(AAAAVVPar:LeverancierFirmanaam)
                       PROJECT(AAAAVVPar:VoorraadKG)
                       PROJECT(AAAAVVPar:VoorraadPallets)
                       PROJECT(AAAAVVPar:CelID)
                     END
FDCB7::View:FileDropCombo VIEW(AAAACelLocatie)
                       PROJECT(AAAACL:Locatienaam)
                       PROJECT(AAAACL:CelLocatieID)
                     END
Queue:FileDropCombo  QUEUE                            !
AAAAVVPar:PartijCelID  LIKE(AAAAVVPar:PartijCelID)    !List box control field - type derived from field
AAAAVVPar:PartijID     LIKE(AAAAVVPar:PartijID)       !List box control field - type derived from field
AAAAVVPar:ExternPartijnr LIKE(AAAAVVPar:ExternPartijnr) !List box control field - type derived from field
AAAAVVPar:CelOms       LIKE(AAAAVVPar:CelOms)         !List box control field - type derived from field
AAAAVVPar:AanmaakDatum_DATE LIKE(AAAAVVPar:AanmaakDatum_DATE) !List box control field - type derived from field
AAAAVVPar:BerekendeInkoopKGPrijs LIKE(AAAAVVPar:BerekendeInkoopKGPrijs) !List box control field - type derived from field
LOC:PartijVoorraadKG   LIKE(LOC:PartijVoorraadKG)     !List box control field - type derived from local data
LOC:PartijVoorraadPallet LIKE(LOC:PartijVoorraadPallet) !List box control field - type derived from local data
AAAAVVPar:VerpakkingOmschrijving LIKE(AAAAVVPar:VerpakkingOmschrijving) !List box control field - type derived from field
AAAAVVPar:LeverancierFirmanaam LIKE(AAAAVVPar:LeverancierFirmanaam) !List box control field - type derived from field
AAAAVVPar:VoorraadKG   LIKE(AAAAVVPar:VoorraadKG)     !Browse hot field - type derived from field
AAAAVVPar:VoorraadPallets LIKE(AAAAVVPar:VoorraadPallets) !Browse hot field - type derived from field
AAAAVVPar:CelID        LIKE(AAAAVVPar:CelID)          !Browse hot field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
Queue:FileDropCombo:1 QUEUE                           !
AAAACL:Locatienaam     LIKE(AAAACL:Locatienaam)       !List box control field - type derived from field
AAAACL:CelLocatieID    LIKE(AAAACL:CelLocatieID)      !Browse hot field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
LocEnableEnterByTab  BYTE(1)                               !Used by the ENTER Instead of Tab template
EnterByTabManager    EnterByTabClass
QuickWindow          WINDOW('Extra uitslag-mutaties'),AT(,,219,88),FONT('MS Sans Serif',8,,FONT:regular,CHARSET:DEFAULT), |
  DOUBLE,CENTER,GRAY,IMM,HLP('UpdateUitslagMutatieQueue'),SYSTEM
                       STRING('Partij / Cel-ID:'),AT(7,6,47,10),USE(?STRING1)
                       COMBO(@s30),AT(59,7,155,10),USE(AAAAVVPar:PartijCelID),DECIMAL(12),VSCROLL,DROP(5,400),FORMAT('0L(2)|~Par' & |
  'tij.Cel~C(0)@s25@[45R(2)|~Intern~C(0)@n_10@45R(2)|~Extern~C(0)@s20@](90)|~Partijnumm' & |
  'er~45L(2)|~Cel~C(0)@s50@46R(2)|~Inslagdatum~C(0)@d17@52R(2)|~Inkoop-KG Prijs~C(0)@n1' & |
  '3`3@[49R(2)|M~KG~C(1)@n-12`2@60R(2)|M~Pallets~C(1)@n-14.@](101)|~Voorraad~50L(2)|~Ve' & |
  'rpakking~C(0)@s50@50L(2)|~Leverancier~C(0)@s50@'),FROM(Queue:FileDropCombo),IMM
                       COMBO(@s50),AT(59,23,155,10),USE(AAAACL:Locatienaam),DROP(5),FORMAT('200L(2)|M~Locatien' & |
  'aam~L(0)@s50@'),FROM(Queue:FileDropCombo:1),IMM
                       PROMPT('Aantal KG:'),AT(7,40),USE(?AantalKG:Prompt)
                       ENTRY(@n13`2),AT(59,41,60,10),USE(LOC:AantalKG),RIGHT(2)
                       PROMPT('Aantal Pallets:'),AT(7,54),USE(?AantalPallets:Prompt),RIGHT
                       ENTRY(@n14`0),AT(59,54,60,10),USE(LOC:AantalPallets),RIGHT(2)
                       BUTTON('&OK'),AT(111,73,49,14),USE(?Ok),LEFT,ICON('WAOK.ICO'),FLAT,MSG('Accept operation'), |
  TIP('Accept Operation')
                       BUTTON('&Cancel'),AT(165,73,49,14),USE(?Cancel),LEFT,ICON('WACANCEL.ICO'),FLAT,MSG('Cancel Operation'), |
  TIP('Cancel Operation')
                       BUTTON('Neem Voorraad'),AT(123,37,91,26),USE(?NeemVoorraadButton)
                     END

    omit('***',WE::CantCloseNowSetHereDone=1)  !Getting Nested omit compile error, then uncheck the "Check for duplicate CantCloseNowSetHere variable declaration" in the WinEvent local template
WE::CantCloseNowSetHereDone equate(1)
WE::CantCloseNowSetHere     long
    !***
ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED
TakeEvent              PROCEDURE(),BYTE,PROC,DERIVED
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
FDCB6                CLASS(FileDropComboClass)             ! File drop combo manager
Q                      &Queue:FileDropCombo           !Reference to browse queue type
SetQueueRecord         PROCEDURE(),DERIVED
ValidateRecord         PROCEDURE(),BYTE,DERIVED
                     END

FDCB7                CLASS(FileDropComboClass)             ! File drop combo manager
Q                      &Queue:FileDropCombo:1         !Reference to browse queue type
ValidateRecord         PROCEDURE(),BYTE,DERIVED
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
  GlobalErrors.SetProcedureName('UpdateUitslagMutatieQueue')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?STRING1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('LOC:PartijVoorraadKG',LOC:PartijVoorraadKG)        ! Added by: FileDropCombo(ABC)
  BIND('LOC:PartijVoorraadPallet',LOC:PartijVoorraadPallet) ! Added by: FileDropCombo(ABC)
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  IF SELF.Request = SelectRecord
     SELF.AddItem(?Ok,RequestCancelled)                    ! Add the close control to the window manger
  ELSE
     SELF.AddItem(?Ok,RequestCompleted)                    ! Add the close control to the window manger
  END
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  LOC:ArtikelID = PRM:ArtikelID
  
  IF ThisWindow.Request = ChangeRecord THEN
  	LOC:AantalKG = UMQ:KG
  	LOC:AantalPallets = UMQ:Pallet
  	LOC:PartijCelID = UMQ:PartijCelID
  	LOC:LeverancierFirmanaam = UMQ:LeverancierNaam
  	LOC:VerpakkingOmschrijving = UMQ:VerpakkingOmschrijving
  	LOC:PartijID = UMQ:PartijID
  	LOC:CelID = UMQ:CelID
  ELSE
  	LOC:AantalKG = 0
  	LOC:AantalPallets = 0
  	LOC:PartijCelID = 0
  	LOC:PartijID = 0
  	LOC:VerpakkingOmschrijving = ''
  	LOC:LeverancierFirmanaam = ''
      LOC:CelID = 0
      CLEAR(AAAAVVPar:Record)
  .
  	
  Relate:AAAACelLocatie.Open                               ! File AAAACelLocatie used by this procedure, so make sure it's RelationManager is open
  Relate:AAAAViewVoorraadPartij.Open                       ! File AAAAViewVoorraadPartij used by this procedure, so make sure it's RelationManager is open
  Relate:ViewPartijCelLocaties.Open                        ! File ViewPartijCelLocaties used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(QuickWindow)                                   ! Open window
  IF IGB:BekijkenPrijzen <> 1 THEN
  	! Prijzen niet tonen
  	?AAAAVVPar:PartijCelID{PROPLIST:Width, 6} = 0
  END
  WinAlertMouseZoom()
  Do DefineListboxStyle
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('UpdateUitslagMutatieQueue',QuickWindow)    ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  FDCB6.Init(AAAAVVPar:PartijCelID,?AAAAVVPar:PartijCelID,Queue:FileDropCombo.ViewPosition,FDCB6::View:FileDropCombo,Queue:FileDropCombo,Relate:AAAAViewVoorraadPartij,ThisWindow,GlobalErrors,0,1,0)
  FDCB6.Q &= Queue:FileDropCombo
  FDCB6.AddSortOrder(AAAAVVPar:ArtikelID_PartijID_CelID_K)
  FDCB6.AddRange(AAAAVVPar:ArtikelID,LOC:ArtikelID)
  FDCB6.AddField(AAAAVVPar:PartijCelID,FDCB6.Q.AAAAVVPar:PartijCelID) !List box control field - type derived from field
  FDCB6.AddField(AAAAVVPar:PartijID,FDCB6.Q.AAAAVVPar:PartijID) !List box control field - type derived from field
  FDCB6.AddField(AAAAVVPar:ExternPartijnr,FDCB6.Q.AAAAVVPar:ExternPartijnr) !List box control field - type derived from field
  FDCB6.AddField(AAAAVVPar:CelOms,FDCB6.Q.AAAAVVPar:CelOms) !List box control field - type derived from field
  FDCB6.AddField(AAAAVVPar:AanmaakDatum_DATE,FDCB6.Q.AAAAVVPar:AanmaakDatum_DATE) !List box control field - type derived from field
  FDCB6.AddField(AAAAVVPar:BerekendeInkoopKGPrijs,FDCB6.Q.AAAAVVPar:BerekendeInkoopKGPrijs) !List box control field - type derived from field
  FDCB6.AddField(LOC:PartijVoorraadKG,FDCB6.Q.LOC:PartijVoorraadKG) !List box control field - type derived from local data
  FDCB6.AddField(LOC:PartijVoorraadPallet,FDCB6.Q.LOC:PartijVoorraadPallet) !List box control field - type derived from local data
  FDCB6.AddField(AAAAVVPar:VerpakkingOmschrijving,FDCB6.Q.AAAAVVPar:VerpakkingOmschrijving) !List box control field - type derived from field
  FDCB6.AddField(AAAAVVPar:LeverancierFirmanaam,FDCB6.Q.AAAAVVPar:LeverancierFirmanaam) !List box control field - type derived from field
  FDCB6.AddField(AAAAVVPar:VoorraadKG,FDCB6.Q.AAAAVVPar:VoorraadKG) !Browse hot field - type derived from field
  FDCB6.AddField(AAAAVVPar:VoorraadPallets,FDCB6.Q.AAAAVVPar:VoorraadPallets) !Browse hot field - type derived from field
  FDCB6.AddField(AAAAVVPar:CelID,FDCB6.Q.AAAAVVPar:CelID) !Browse hot field - type derived from field
  FDCB6.AddUpdateField(AAAAVVPar:PartijCelID,LOC:PartijCelID)
  FDCB6.AddUpdateField(AAAAVVPar:CelID,LOC:CelID)
  FDCB6.AddUpdateField(AAAAVVPar:PartijID,LOC:PartijID)
  FDCB6.AddUpdateField(AAAAVVPar:LeverancierFirmanaam,LOC:LeverancierFirmanaam)
  FDCB6.AddUpdateField(AAAAVVPar:VerpakkingOmschrijving,LOC:VerpakkingOmschrijving)
  ThisWindow.AddItem(FDCB6.WindowComponent)
  FDCB6.DefaultFill = 0
  FDCB7.Init(AAAACL:Locatienaam,?AAAACL:Locatienaam,Queue:FileDropCombo:1.ViewPosition,FDCB7::View:FileDropCombo,Queue:FileDropCombo:1,Relate:AAAACelLocatie,ThisWindow,GlobalErrors,0,1,0)
  FDCB7.Q &= Queue:FileDropCombo:1
  FDCB7.AddSortOrder(AAAACL:FK_CelLocatie)
  FDCB7.AddRange(AAAACL:CelID,AAAAVVPar:CelID)
  FDCB7.AddField(AAAACL:Locatienaam,FDCB7.Q.AAAACL:Locatienaam) !List box control field - type derived from field
  FDCB7.AddField(AAAACL:CelLocatieID,FDCB7.Q.AAAACL:CelLocatieID) !Browse hot field - type derived from field
  ThisWindow.AddItem(FDCB7.WindowComponent)
  FDCB7.DefaultFill = 0
  SELF.SetAlerts()
  EnterByTabManager.ExcludeControl(?Cancel)
  EnterByTabManager.ExcludeControl(?Ok)
  EnterByTabManager.Init(False)
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:AAAACelLocatie.Close
    Relate:AAAAViewVoorraadPartij.Close
    Relate:ViewPartijCelLocaties.Close
  END
  IF SELF.Opened
    INIMgr.Update('UpdateUitslagMutatieQueue',QuickWindow) ! Save window data to non-volatile store
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
    CASE ACCEPTED()
    OF ?Ok
      ! Controleren
      IF LOC:PartijCelID = '' THEN
      	SELECT(?AAAAVVPar:PartijCelID)
      	RETURN Level:Notify
      .
      
      IF LOC:AantalKG = 0 AND LOC:AantalPallets = 0 THEN
      	SELECT(?LOC:AantalKG)
      	RETURN Level:Notify
      .
    OF ?NeemVoorraadButton
      LOC:AantalKG = FDCB6.Q.LOC:PartijVoorraadKG
      ThisWindow.Reset(1)
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?AAAAVVPar:PartijCelID
      IF LOC:AantalKG = 0
      	LOC:AantalKG = AAAAVVPar:VoorraadKG
      .
      IF 0{PROP:AcceptAll}=FALSE
          FDCB7.ResetQueue(false)
          select(?AAAACL:Locatienaam,1)
      END
      
    OF ?Ok
      ThisWindow.Update()
      ! Opslaan
      db.DebugOut('UitslagMutatieQueue.TakeCompleted()')
      IF ThisWindow.Request = InsertRecord
      	CLEAR(GLO:UitslagMutatieQueue)
      	UMQ:PartijCelID=LOC:PartijCelID
      	UMQ:LeverancierNaam=LOC:LeverancierFirmanaam
      	UMQ:VerpakkingOmschrijving=LOC:VerpakkingOmschrijving
      	UMQ:PartijID=LOC:PartijID
      	UMQ:CelID=LOC:CelID
      	UMQ:KG=LOC:AantalKG
      	UMQ:Pallet=LOC:AantalPallets
      	ADD(GLO:UitslagMutatieQueue)
      	db.DebugOut('ADD:UitslagMutatieQueue.TakeCompleted()')
      ELSIF ThisWindow.Request = ChangeRecord
      	UMQ:PartijCelID=LOC:PartijCelID
      	UMQ:LeverancierNaam=LOC:LeverancierFirmanaam
      	UMQ:VerpakkingOmschrijving=LOC:VerpakkingOmschrijving
      	UMQ:PartijID=LOC:PartijID
      	UMQ:CelID=LOC:CelID
      	UMQ:KG=LOC:AantalKG
      	UMQ:Pallet=LOC:AantalPallets
      	PUT(GLO:UitslagMutatieQueue)
      	db.DebugOut('PUT:UitslagMutatieQueue.TakeCompleted()')
      .
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


FDCB6.SetQueueRecord PROCEDURE

  CODE
  LOC:PartijVoorraadKG=AAAAVVPar:VoorraadKG
  LOC:PartijVoorraadPallet=AAAAVVPar:VoorraadPallets
  
  LOOP i# = 1 TO 100
  	IF LOC:OrigineelPartijCelID[i#] = AAAAVVPar:PartijCelID 
  		LOC:PartijVoorraadKG+=LOC:OrigineelKG[i#]
  		LOC:PartijVoorraadPallet+=LOC:OrigineelPallets[i#]
  		BREAK
  	END
  END
  PARENT.SetQueueRecord
  


FDCB6.ValidateRecord PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  LOC:PartijVoorraadKG=AAAAVVPar:VoorraadKG
  LOC:PartijVoorraadPallet=AAAAVVPar:VoorraadPallets
  
  LOOP i# = 1 TO 100
  	IF LOC:OrigineelPartijCelID[i#] = AAAAVVPar:PartijCelID 
  		LOC:PartijVoorraadKG+=LOC:OrigineelKG[i#]
  		LOC:PartijVoorraadPallet+=LOC:OrigineelPallets[i#]
  		BREAK
  	END
  END
  
  IF LOC:PartijVoorraadKG <= 0 THEN
  	RETURN Record:Filtered
  END
  ReturnValue = PARENT.ValidateRecord()
  RETURN ReturnValue


FDCB7.ValidateRecord PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
      Clear(VPCL:Record)
        VPCL:PartijID=SUB(LOC:PartijCelID,1,6)
        VPCL:CelID=SUB(LOC:PartijCelID,7,20)
        VPCL:CelLocatieID=AAAACL:CelLocatieID
        if Access:ViewPartijCelLocaties.Fetch(VPCL:ViewPartijCelLocaties_PK)<>Level:Benign 
            Return Record:Filtered
        END
      
            
  ReturnValue = PARENT.ValidateRecord()
  RETURN ReturnValue


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window

