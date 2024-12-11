

   MEMBER('VoorrPln.clw')                                  ! This is a MEMBER module


   INCLUDE('ABDROPS.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('VOORRPLN020.INC'),ONCE        !Local module procedure declarations
                     END


!!! <summary>
!!! Generated from procedure template - Window
!!! Window
!!! </summary>
UpdateUitslagMutatieQueueWeging PROCEDURE (PRM:ArtikelID, PRM:QueueID)

udpt            UltimateDebugProcedureTracker
LOC:AantalKG         DECIMAL(10,2)                         ! 
LOC:QueueID          LONG                                  ! 
LOC:AantalPallets    LONG                                  ! 
LOC:PartijCelID      STRING(25)                            ! 
LOC:CelID            LONG                                  ! 
LOC:PartijID         LONG                                  ! 
Loc:CelLokatieID     LONG                                  ! 
LOC:PartijVoorraadKG DECIMAL(10,2)                         ! 
LOC:PartijVoorraadPallet LONG                              ! 
LOC:LeverancierFirmanaam STRING(50)                        ! 
LOC:VerpakkingOmschrijving CSTRING(51)                     ! 
LOC:ArtikelID        CSTRING(31)                           ! 
LOC:WegingQueue      QUEUE,PRE(WQ)                         ! 
BrutoGewichtKG       DECIMAL(10,2)                         ! 
PalletSoort          CSTRING(11)                           ! 
PalletSoortID        LONG                                  ! 
NettoGewichtKG       DECIMAL(10,2)                         ! 
Datum                DATE                                  ! 
Tijd                 TIME                                  ! 
PalletID             LONG                                  ! 
ProductionDate       DATE                                  ! 
THTDate              DATE                                  ! 
HarvastDate          DATE                                  ! 
                     END                                   ! 
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
FDCB8::View:FileDropCombo VIEW(CelLocatie)
                       PROJECT(CL:Locatienaam)
                       PROJECT(CL:CelLocatieID)
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
CL:Locatienaam         LIKE(CL:Locatienaam)           !List box control field - type derived from field
CL:CelLocatieID        LIKE(CL:CelLocatieID)          !Primary key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
LocEnableEnterByTab  BYTE(1)                               !Used by the ENTER Instead of Tab template
EnterByTabManager    EnterByTabClass
QuickWindow          WINDOW('Extra uitslag-mutaties'),AT(,,397,195),FONT('MS Sans Serif',8,,FONT:regular,CHARSET:DEFAULT), |
  DOUBLE,CENTER,GRAY,IMM,HLP('UpdateUitslagMutatieQueue'),SYSTEM
                       STRING('Partij / Cel-ID:'),AT(7,7,47,10),USE(?STRING1)
                       COMBO(@s30),AT(59,7,155,10),USE(AAAAVVPar:PartijCelID),DECIMAL(12),VSCROLL,DROP(5,400),FORMAT('0L(2)|~Par' & |
  'tij.Cel~C(0)@s25@[45R(2)|~Intern~C(0)@n_10@45R(2)|~Extern~C(0)@s20@](90)|~Partijnumm' & |
  'er~45L(2)|~Cel~C(0)@s50@46R(2)|~Inslagdatum~C(0)@d17@52R(2)|~Inkoop KG-Prijs~C(0)@n1' & |
  '3`2@[49R(2)|M~KG~C(1)@n-12`2@60R(2)|M~Pallets~C(1)@n-14.@](101)|~Voorraad~50L(2)|~Ve' & |
  'rpakking~C(0)@s50@50L(2)|~Leverancier~C(0)@s50@'),FROM(Queue:FileDropCombo),IMM
                       PROMPT('Aantal KG:'),AT(7,32),USE(?AantalKG:Prompt)
                       PROMPT('Locatie:'),AT(7,18),USE(?PROMPT1)
                       COMBO(@s50),AT(59,19,155,10),USE(CL:Locatienaam),DROP(5),FORMAT('200L(2)|M~Locatienaam~L(0)@s50@'), |
  FROM(Queue:FileDropCombo:1),IMM
                       ENTRY(@n13`2),AT(59,31,60,10),USE(LOC:AantalKG),RIGHT(2)
                       PROMPT('Aantal Pallets:'),AT(7,46),USE(?AantalPallets:Prompt),RIGHT
                       ENTRY(@n14`0),AT(59,46,60,10),USE(LOC:AantalPallets),RIGHT(2)
                       LIST,AT(59,61,335,77),USE(?WegingList),HVSCROLL,FORMAT('60R(2)|~Bruto (KG)~C(0)@n14`2@4' & |
  '5C|~Palletsoort~@s10@0C(2)@n-14@60R(2)|~Netto (KG)~C(0)@n14`2@0R(2)@d17@0R(2)@t7@42R' & |
  '(2)|~Pallet ID~C(1)@n_10@40R(2)|~Production~C(0)@d6-@40R(2)|~THT~C(0)@d6-@40R(2)|~Ha' & |
  'rvast~C(0)@d6-@'),FROM(LOC:WegingQueue)
                       BUTTON('Toevoegen'),AT(57,142,51,14),USE(?ToevoegenWeging1)
                       BUTTON('Wijzigen'),AT(109,142,41,14),USE(?WijzigenWeging1)
                       BUTTON('Verwijderen'),AT(152,142,53,14),USE(?VerwijderenWeging1)
                       BUTTON('Weeg Nu'),AT(349,142,45,14),USE(?WeegNu1)
                       BUTTON('&OK'),AT(289,161,49,14),USE(?Ok),LEFT,ICON('WAOK.ICO'),FLAT,MSG('Accept operation'), |
  TIP('Accept Operation')
                       BUTTON('&Cancel'),AT(344,161,49,14),USE(?Cancel),LEFT,ICON('WACANCEL.ICO'),FLAT,MSG('Cancel Operation'), |
  TIP('Cancel Operation')
                       BUTTON('Vul vanuit de weging'),AT(305,43,86),USE(?VulVanuitWeging)
                       BUTTON('Palletblad'),AT(299,142,45,14),USE(?PalletBladButton)
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

FDCB8                CLASS(FileDropComboClass)             ! File drop combo manager
Q                      &Queue:FileDropCombo:1         !Reference to browse queue type
ValidateRecord         PROCEDURE(),BYTE,DERIVED
                     END

Resizer              CLASS(WindowResizeClass)
Init                   PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)
                     END


  CODE
? DEBUGHOOK(AAAAViewVoorraadPartij:Record)
? DEBUGHOOK(CelLocatie:Record)
? DEBUGHOOK(Pallet:Record)
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
        udpt.Init(UD,'UpdateUitslagMutatieQueueWeging','VoorrPln020.clw','VoorrPln.DLL','07/02/2024 @ 11:22AM')    
             
  GlobalErrors.SetProcedureName('UpdateUitslagMutatieQueueWeging')
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
  LOC:QueueID = PRM:QueueID
  
  FREE(LOC:WegingQueue)
  
  IF ThisWindow.Request = ChangeRecord OR ThisWindow.Request = ViewRecord THEN
  	LOC:AantalKG = UMQ:KG
  	LOC:AantalPallets = UMQ:Pallet
  	LOC:PartijCelID = UMQ:PartijCelID
  	LOC:LeverancierFirmanaam = UMQ:LeverancierNaam
  	LOC:VerpakkingOmschrijving = UMQ:VerpakkingOmschrijving
  	LOC:PartijID = UMQ:PartijID
  	LOC:CelID = UMQ:CelID
  	
  	LOOP i# = 1 TO RECORDS(GLO:WegingQueue2)
  		GET(GLO:WegingQueue2, i#)
  		IF GWQ2:ID = LOC:QueueID THEN
  			WQ:BrutoGewichtKG = GWQ2:BrutoGewichtKG
  			WQ:NettoGewichtKG = GWQ2:NettoGewichtKG
  			WQ:PalletSoortID = GWQ2:PalletsoortID
  			WQ:PalletSoort = GWQ2:Palletsoort
  			WQ:Datum = GWQ2:Datum
            WQ:Tijd = GWQ2:Tijd
            WQ:PalletID = GWQ2:PalletID
            WQ:ProductionDate = GWQ2:ProductionDate
            WQ:THTDate = GWQ2:THTDate
            WQ:HarvastDate = GWQ2:HarvastDate
  			ADD(LOC:WegingQueue)
  		END
  	END
  ELSE
  	LOC:AantalKG = 0
  	LOC:AantalPallets = 0
  	LOC:PartijCelID = 0
  	LOC:PartijID = 0
  	LOC:VerpakkingOmschrijving = ''
  	LOC:LeverancierFirmanaam = ''
  	LOC:CelID = 0
  .
  	
  GLO:BepaalTotaal = 0
  Relate:AAAAViewVoorraadPartij.Open                       ! File AAAAViewVoorraadPartij used by this procedure, so make sure it's RelationManager is open
  Relate:CelLocatie.SetOpenRelated()
  Relate:CelLocatie.Open                                   ! File CelLocatie used by this procedure, so make sure it's RelationManager is open
  Relate:Pallet.Open                                       ! File Pallet used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(QuickWindow)                                   ! Open window
  IF IGB:BekijkenPrijzen <> 1 THEN
  	! Prijzen niet tonen
  	?AAAAVVPar:PartijCelID{PROPLIST:Width, 6} = 0
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
    DISABLE(?AAAAVVPar:PartijCelID)
    DISABLE(?CL:Locatienaam)
    DISABLE(?LOC:AantalKG)
    DISABLE(?LOC:AantalPallets)
    DISABLE(?ToevoegenWeging1)
    DISABLE(?WijzigenWeging1)
    DISABLE(?VerwijderenWeging1)
    DISABLE(?WeegNu1)
    DISABLE(?VulVanuitWeging)
  END
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('UpdateUitslagMutatieQueueWeging',QuickWindow) ! Restore window settings from non-volatile store
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
  FDCB8.Init(CL:Locatienaam,?CL:Locatienaam,Queue:FileDropCombo:1.ViewPosition,FDCB8::View:FileDropCombo,Queue:FileDropCombo:1,Relate:CelLocatie,ThisWindow,GlobalErrors,0,1,0)
  FDCB8.Q &= Queue:FileDropCombo:1
  FDCB8.AddSortOrder(CL:FK_CelLocatie)
  FDCB8.AddRange(CL:CelID,AAAAVVPar:CelID)
  FDCB8.AddField(CL:Locatienaam,FDCB8.Q.CL:Locatienaam) !List box control field - type derived from field
  FDCB8.AddField(CL:CelLocatieID,FDCB8.Q.CL:CelLocatieID) !Primary key field - type derived from field
  FDCB8.AddUpdateField(CL:CelLocatieID,Loc:CelLokatieID)
  ThisWindow.AddItem(FDCB8.WindowComponent)
  FDCB8.DefaultFill = 0
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
    Relate:AAAAViewVoorraadPartij.Close
    Relate:CelLocatie.Close
    Relate:Pallet.Close
  END
  IF SELF.Opened
    INIMgr.Update('UpdateUitslagMutatieQueueWeging',QuickWindow) ! Save window data to non-volatile store
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
    OF ?ToevoegenWeging1
      FREE(GLO:WegingQueue)
      WGQ:BrutoGewichtKG = 0
      WGQ:NettoGewichtKG = 0
      WGQ:PalletsoortID = 0
      WGQ:Palletsoort = ''
      WGQ:Datum = 0
      WGQ:Tijd = 0
      WGQ:PalletID = 0
      CLEAR(WGQ:ProductionDate)
      CLEAR(WGQ:THTDate)
      CLEAR(WGQ:HarvastDate)
      
    OF ?WijzigenWeging1
      CLEAR(LOC:WegingQueue)
      GET(LOC:WegingQueue, Choice(?WegingList))
      IF NOT(ERROR()) THEN
      	WGQ:BrutoGewichtKG = WQ:BrutoGewichtKG
      	WGQ:Palletsoort = WQ:Palletsoort
      	WGQ:PalletsoortID = WQ:PalletsoortID
      	WGQ:NettoGewichtKG = WQ:NettoGewichtKG
      	WGQ:Datum = WQ:Datum
          WGQ:Tijd = WQ:Tijd
          WGQ:PalletID = WQ:PalletID
            WGQ:ProductionDate = WQ:ProductionDate
            WGQ:THTDate = WQ:THTDate
            WGQ:HarvastDate = WQ:HarvastDate
      ELSE
      	CYCLE
      .
    OF ?VerwijderenWeging1
      CLEAR(LOC:WegingQueue)
      GET(LOC:WegingQueue, Choice(?WegingList))
      IF NOT(ERROR()) THEN
      	DELETE(LOC:WegingQueue)
      ELSE
      	CYCLE
      .
    OF ?Ok
      IF ThisWindow.Request <> ViewRecord
          ! Controleren
          IF LOC:PartijCelID = '' THEN
              SELECT(?AAAAVVPar:PartijCelID)
              RETURN Level:Notify
          .
      
          IF LOC:AantalKG = 0 AND LOC:AantalPallets = 0 THEN
              SELECT(?LOC:AantalKG)
              RETURN Level:Notify
          .
      END
    OF ?PalletBladButton
      CLEAR(LOC:WegingQueue)
      GET(LOC:WegingQueue, Choice(?WegingList))
      IF NOT(ERROR()) THEN
          !GLO:UitslagPalletbladPlanningID (wordt gevuld in de init) (in de UpdateUitslagWeging)
          !GLO:UitslagPalletbladArtikelID (wordt gevuld in de dropdownlist) (in de UpdateUitslagWeging)
      
          GLO:UitslagPalletbladPartijID = LOC:PartijID
          !Deze worden gevuld voor de aanroep van deze Procedure (in de UpdateUitslagWeging)
          !GLO:UitslagPalletbladDueDate12 = Mut:UitslagPalletbladDueDate12_DATE
          !GLO:UitslagPalletbladProductionDate11 = Mut:UitslagPalletbladProductionDate11_DATE 
          !GLO:UitslagPalletbladSellByDate15 = Mut:UitslagPalletbladSellByDate15_DATE
                  IF WQ:ProductionDate
                      GLO:UitslagPalletbladProductionDate11 = WQ:ProductionDate
                  END
                  IF WQ:THTDate
                      GLO:UitslagPalletbladSellByDate15 = WQ:THTDate
                  END
                  IF WQ:HarvastDate
                      GLO:UitslagPalletbladHarvastDate7007 = WQ:HarvastDate
                  END
          
          ReportPalletBladEnkel(WQ:PalletID, WQ:NettoGewichtKG, True, 1) ! Met Preview 
      ELSE
      	CYCLE
      .
          
    END
  ReturnValue = PARENT.TakeAccepted()
  IF SELF.Response = RequestCompleted
  	SORT(GLO:WegingQueue2, +GWQ2:ID)
  	
  	LOOP i# = RECORDS(GLO:WegingQueue2) TO 1 BY -1
  		GET(GLO:WegingQueue2, i#)
  		IF GWQ2:ID = LOC:QueueID THEN
  			DELETE(GLO:WegingQueue2)
  		.
  	END
  	
  	LOOP i# = 1 TO RECORDS(LOC:WegingQueue)
  		GET(LOC:WegingQueue, i#)
  		GWQ2:ID = LOC:QueueID
  		GWQ2:BrutoGewichtKG = WQ:BrutoGewichtKG
  		GWQ2:NettoGewichtKG = WQ:NettoGewichtKG
  		GWQ2:PalletsoortID = WQ:PalletSoortID
  		GWQ2:Palletsoort = WQ:PalletSoort
  		GWQ2:Datum = WQ:Datum
          GWQ2:Tijd = WQ:Tijd
          GWQ2:PalletID = WQ:PalletID
            GWQ2:ProductionDate = WQ:ProductionDate
            GWQ2:THTDate = WQ:THTDate
            GWQ2:HarvastDate = WQ:HarvastDate
  		ADD(GLO:WegingQueue2)
  	END
  END
    CASE ACCEPTED()
    OF ?AAAAVVPar:PartijCelID
      IF LOC:AantalKG = 0
      	LOC:AantalKG = AAAAVVPar:VoorraadKG
      .
      IF 0{PROP:AcceptAll}=FALSE
          FDCB6.ResetQueue(false)
          Select(?CL:Locatienaam,1)
      END
    OF ?ToevoegenWeging1
      ThisWindow.Update()
      GlobalRequest = InsertRecord
      UpdateUitslagMutatieWegingQueue()
      ThisWindow.Reset
      IF GLOBALResponse = RequestCompleted THEN
          CLEAR(PLL:Record)
          Access:Pallet.Insert()
          
      	WQ:BrutoGewichtKG = WGQ:BrutoGewichtKG
      	WQ:Palletsoort = WGQ:Palletsoort
      	WQ:PalletsoortID = WGQ:PalletsoortID
      	WQ:NettoGewichtKG = WGQ:NettoGewichtKG
      	WQ:Datum = WGQ:Datum
          WQ:Tijd = WGQ:Tijd
          WQ:PalletID = PLL:PalletID
            WQ:ProductionDate = WGQ:ProductionDate
            WQ:THTDate = WGQ:THTDate
            WQ:HarvastDate = WGQ:HarvastDate
      	ADD(LOC:WegingQueue)
      .
    OF ?WijzigenWeging1
      ThisWindow.Update()
      GlobalRequest = ChangeRecord
      UpdateUitslagMutatieWegingQueue()
      ThisWindow.Reset
      IF GLOBALResponse = RequestCompleted THEN
      	WQ:BrutoGewichtKG = WGQ:BrutoGewichtKG
      	WQ:Palletsoort = WGQ:Palletsoort
      	WQ:PalletsoortID = WGQ:PalletsoortID
      	WQ:NettoGewichtKG = WGQ:NettoGewichtKG
      	WQ:Datum = WGQ:Datum
          WQ:Tijd = WGQ:Tijd
          WQ:PalletID = WGQ:PalletID
            WQ:ProductionDate = WGQ:ProductionDate
            WQ:THTDate = WGQ:THTDate
            WQ:HarvastDate = WGQ:HarvastDate
      	PUT(LOC:WegingQueue)
      .
    OF ?WeegNu1
      ThisWindow.Update()
      WeegWindow()
      ThisWindow.Reset
      IF GLOBALResponse = RequestCompleted THEN
          LOOP i# = 1 TO RECORDS(GLO:WegingQueue)
              !CLEAR(PLL:Record)
              !Access:Pallet.Insert()
              
      		WQ:BrutoGewichtKG = WGQ:BrutoGewichtKG
      		WQ:Palletsoort = WGQ:Palletsoort
      		WQ:PalletsoortID = WGQ:PalletsoortID
      		WQ:NettoGewichtKG = WGQ:NettoGewichtKG
      		WQ:Datum = WGQ:Datum
              WQ:Tijd = WGQ:Tijd
              WQ:PalletID = WGQ:PalletID
            WQ:ProductionDate = WGQ:ProductionDate
            WQ:THTDate = WGQ:THTDate
            WQ:HarvastDate = WGQ:HarvastDate
      		ADD(LOC:WegingQueue)
      	.
      .
    OF ?Ok
      ThisWindow.Update()
      ! Opslaan
      db.DebugOut('UitslagMutatieQueueWeging - OK' & ThisWindow.Request)
      IF ThisWindow.Request <> ViewRecord
          IF ThisWindow.Request = InsertRecord
              CLEAR(GLO:UitslagMutatieQueue)
              UMQ:PartijCelID=LOC:PartijCelID
              UMQ:LeverancierNaam=LOC:LeverancierFirmanaam
              UMQ:VerpakkingOmschrijving=LOC:VerpakkingOmschrijving
              UMQ:PartijID=LOC:PartijID
              UMQ:CelID=LOC:CelID
              UMQ:KG=LOC:AantalKG
              UMQ:Pallet=LOC:AantalPallets
              UMQ:CelLocatieID=Loc:CelLokatieID
              ADD(GLO:UitslagMutatieQueue)
              db.DebugOut('ADD:UitslagMutatieQueue.TakeCompleted()')
          ELSIF ThisWindow.Request = ChangeRecord
              UMQ:PartijCelID=LOC:PartijCelID
              UMQ:LeverancierNaam=LOC:LeverancierFirmanaam
              UMQ:VerpakkingOmschrijving=LOC:VerpakkingOmschrijving
              UMQ:PartijID=LOC:PartijID
              UMQ:CelID=LOC:CelID
              UMQ:CelLocatieID=Loc:CelLokatieID
              UMQ:KG=LOC:AantalKG
              UMQ:Pallet=LOC:AantalPallets
              PUT(GLO:UitslagMutatieQueue)
              db.DebugOut('PUT:UitslagMutatieQueue.TakeCompleted()')
          .
      END
    OF ?VulVanuitWeging
      ThisWindow.Update()
      LOC:AantalKG = 0
      
      LOOP i# = 1 TO RECORDS(LOC:WegingQueue)
      	GET(LOC:WegingQueue, i#)
      	LOC:AantalKG += WQ:NettoGewichtKG
      END
      
      LOC:AantalPallets = RECORDS(LOC:WegingQueue)
      
      DISPLAY(?LOC:AantalKG)
      DISPLAY(?LOC:AantalPallets)
      
      GLO:BepaalTotaal = 1
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
  If event() = event:VisibleOnDesktop !or event() = event:moved
    ds_VisibleOnDesktop()
  end
     IF KEYCODE()=CtrlShiftP AND EVENT() = Event:PreAlertKey
       CYCLE
     END
     IF KEYCODE()=CtrlShiftP  
        UD.ShowProcedureInfo('UpdateUitslagMutatieQueueWeging',UD.SetApplicationName('VoorrPln','DLL'),QuickWindow{PROP:Hlp},'10/06/2011 @ 04:10PM','07/02/2024 @ 11:22AM','10/11/2024 @ 01:54PM')  
    
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


FDCB8.ValidateRecord PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
      Clear(VPCL:Record)
        VPCL:PartijID=SUB(LOC:PartijCelID,1,6)
        VPCL:CelID=SUB(LOC:PartijCelID,7,20)
        VPCL:CelLocatieID=CL:CelLocatieID
        if Access:ViewPartijCelLocaties.Fetch(VPCL:ViewPartijCelLocaties_PK)<>Level:Benign 
            Return Record:Filtered
        END
      
            
  ReturnValue = PARENT.ValidateRecord()
  RETURN ReturnValue


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window

