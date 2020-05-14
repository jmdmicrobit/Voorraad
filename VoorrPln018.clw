

   MEMBER('VoorrPln.clw')                                  ! This is a MEMBER module


   INCLUDE('ABDROPS.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('VOORRPLN018.INC'),ONCE        !Local module procedure declarations
                     END


!!! <summary>
!!! Generated from procedure template - Window
!!! </summary>
WeegWindow PROCEDURE 

LOC:Debug            BYTE                                  ! 
LOC:PortID_Koord     LONG                                  ! 
LOC:PortID_Weeg      LONG                                  ! 
LOC:PortString_Weeg  STRING(50)                            ! 
LOC:PortString_Koord STRING(50)                            ! 
LOC:Gewicht          DECIMAL(9,2)                          ! 
LOC:PalletSoortID    LONG                                  ! 
LOC:PalletTarra      DECIMAL(10,2)                         ! 
LOC:Result           LONG                                  ! 
LOC:TempChar         STRING(1)                             ! 
Loc:AantalPogingen   LONG                                  ! 
LOC:ByteCounter1     LONG                                  ! 
LOC:ByteCounter2     LONG                                  ! 
Loc:Stabiel          BYTE                                  ! 
Loc:SendString       STRING(20)                            ! 
Loc:ReceiveString2   STRING(255)                           ! 
Loc:AanHetKoordGetrokken BYTE                              ! 
LOC:DymoEtiketPrinten LONG                                 ! 
LOC:PalletBladPrinten BYTE                                 ! 
LOC:GebruikKoord     BYTE                                  ! 
LOC:NieuweWeegschaal BYTE                                  ! 
LOC:AantalPallets    LONG                                  ! 
LOC:TotaalNettoKG    DECIMAL(9,2)                          ! 
LOC:Loggen           BYTE                                  ! 
Loc:GewichtQ         QUEUE,PRE(LGQ)                        ! 
Tijd                 TIME                                  ! 
Gewicht              DECIMAL(9,2)                          ! 
Receivestring1       STRING(255)                           ! 
ReceiveString2       STRING(255)                           ! 
                     END                                   ! 
FDCB3::View:FileDropCombo VIEW(PalletSoort)
                       PROJECT(PalSrt:PalletOmschrijving)
                       PROJECT(PalSrt:Tarra)
                       PROJECT(PalSrt:PalletSoortID)
                     END
Queue:FileDropCombo  QUEUE                            !
PalSrt:PalletOmschrijving LIKE(PalSrt:PalletOmschrijving) !List box control field - type derived from field
PalSrt:Tarra           LIKE(PalSrt:Tarra)             !Browse hot field - type derived from field
PalSrt:PalletSoortID   LIKE(PalSrt:PalletSoortID)     !Primary key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
LocEnableEnterByTab  BYTE(1)                               !Used by the ENTER Instead of Tab template
EnterByTabManager    EnterByTabClass
QuickWindow          WINDOW('Weegschaal'),AT(,,554,441),FONT('MS Sans Serif',8,,FONT:regular,CHARSET:DEFAULT),DOUBLE, |
  CENTER,GRAY,IMM,HLP('WeegWindow'),SYSTEM,TIMER(10)
                       SHEET,AT(-3,2,555,437),USE(?SHEET1)
                         TAB('Weging'),USE(?TAB1)
                           STRING('Palletsoort:'),AT(1,84),USE(?STRING2),FONT('Microsoft Sans Serif',12,,,CHARSET:ANSI), |
  TRN
                           COMBO(@s10),AT(3,100,385,49),USE(PalSrt:PalletOmschrijving),FONT('Microsoft Sans Serif',38, |
  ,,CHARSET:ANSI),VSCROLL,DROP(5),FORMAT('40L(2)|M~Omschrijving~@s10@'),FROM(Queue:FileDropCombo), |
  IMM
                           BUTTON('WEEG'),AT(392,99,149,94),USE(?WeegButton),FONT('Microsoft Sans Serif',38,,,CHARSET:ANSI), |
  KEY(EnterKey),DEFAULT
                           STRING('Huidige weegstand (KG):'),AT(1,155),USE(?STRING1),FONT('Microsoft Sans Serif',12,, |
  ,CHARSET:ANSI),TRN
                           ENTRY(@n-14`2),AT(3,172,384),USE(LOC:Gewicht),FONT('Microsoft Sans Serif',48,,,CHARSET:ANSI), |
  RIGHT
                           LIST,AT(3,230,539,74),USE(?WegingQueue),VSCROLL,FORMAT('100R(2)|~Bruto (KG)~C(0)@n14`2@' & |
  '45C(2)|~Palletsoort~C(0)@s10@0C(2)@n-14@110R(2)|~Netto (KG)~C(0)@n14`2@0R(2)@d17@0R(' & |
  '2)@t7@60R(2)|~Pallet ID~C(1)@n_10@'),FROM(GLO:WegingQueue)
                           BUTTON('OK'),AT(286,366,121,68),USE(?Ok),FONT('Microsoft Sans Serif',38,,,CHARSET:ANSI),ICON('WAOK.ICO'), |
  MSG('Accept operation'),TIP('Accept Operation')
                           BUTTON('SLUIT'),AT(417,366,121,68),USE(?Cancel),FONT('Microsoft Sans Serif',38,,,CHARSET:ANSI), |
  ICON('WACANCEL.ICO'),MSG('Cancel Operation'),TIP('Cancel Operation')
                           CHECK('Gebruik koord'),AT(392,83),USE(LOC:GebruikKoord),FONT('Microsoft Sans Serif',12,,,CHARSET:ANSI), |
  TRN,VALUE('1','0')
                           STRING(@N_3),AT(277,320,66),USE(LOC:AantalPallets),FONT('Microsoft Sans Serif',40),RIGHT,TRN
                           PROMPT('Aantal pallets:'),AT(277,304),USE(?PROMPT1),FONT('Microsoft Sans Serif',12,,,CHARSET:ANSI), |
  TRN
                           PROMPT('Totaal netto (KG):'),AT(455,304),USE(?PROMPT2),FONT('Microsoft Sans Serif',12,,,CHARSET:ANSI), |
  TRN
                           STRING(@N-13`2),AT(357,320,185,40),USE(LOC:TotaalNettoKG),FONT('Microsoft Sans Serif',40), |
  RIGHT,TRN
                           GROUP('Partij'),AT(4,20,539,57),USE(?GROUP1),BOXED,TRN
                             PROMPT('Partij-ID:'),AT(7,30),USE(?PROMPT3),TRN
                             STRING(@N_10),AT(36,30),USE(Par:PartijID),TRN
                             PROMPT('Externe Partij-ID:'),AT(7,44),USE(?PROMPT4),TRN
                             STRING(@S20),AT(62,44),USE(Par:ExternPartijnr),TRN
                             STRING(@s60),AT(117,30,185),USE(Art:ArtikelOms),TRN
                             PROMPT('Artikel:'),AT(90,30),USE(?PROMPT6),TRN
                             PROMPT('Referentie:'),AT(147,44),USE(?PROMPT5),TRN
                             STRING(@S50),AT(191,44,111),USE(Par:Referentie),TRN
                             PROMPT('Totaal (KG):'),AT(147,58),USE(?PROMPT9),TRN
                             STRING(@n12`2),AT(191,58),USE(Par:KG),TRN
                             PROMPT('Totaal (Pallets):'),AT(310,58),USE(?PROMPT10),TRN
                             STRING(@N13`2),AT(365,58),USE(Par:Pallets),TRN
                             STRING(@S50),AT(364,44,171),USE(Ver:VerpakkingOmschrijving),TRN
                             PROMPT('Verpakking:'),AT(310,44),USE(?PROMPT7),TRN
                             PROMPT('Leverancier:'),AT(310,30),USE(?PROMPT8),TRN
                             STRING(@S50),AT(364,30,171),USE(Rel:FirmaNaam),TRN
                           END
                           BUTTON('VERWIJDER'),AT(391,195,149,30),USE(?VerwijderButton),FONT('Microsoft Sans Serif',24, |
  ,FONT:bold)
                           GROUP('Dymo-etiket printen?'),AT(3,308,271,62),USE(?GROUP2),FONT('Microsoft Sans Serif',12, |
  ,,CHARSET:ANSI),BOXED,TRN
                             BUTTON('1X'),AT(99,320,81,48),USE(?DymoPrintButton),FONT('Microsoft Sans Serif',38,,,CHARSET:ANSI)
                             BUTTON('NIET'),AT(185,320,81,48),USE(?DymoGeenPrintButton),FONT('Microsoft Sans Serif',38, |
  ,,CHARSET:ANSI)
                           END
                           GROUP('Palletblad printen?'),AT(2,371,271,64),USE(?GROUP3),FONT('Microsoft Sans Serif',12, |
  ,,CHARSET:ANSI),BOXED,TRN
                             BUTTON('2X'),AT(11,385,81,48),USE(?Palletblad2PrintButton),FONT('Microsoft Sans Serif',38, |
  ,,CHARSET:ANSI)
                             BUTTON('1X'),AT(99,385,81,48),USE(?PalletbladPrintButton),FONT('Microsoft Sans Serif',38,, |
  ,CHARSET:ANSI)
                             BUTTON('NIET'),AT(185,385,81,48),USE(?PalletbladGeenPrintButton),FONT('Microsoft Sans Serif', |
  38,,,CHARSET:ANSI)
                           END
                         END
                         TAB('Systeemgegevens'),USE(?TAB2)
                           STRING(@S1),AT(39,31),USE(LOC:TempChar)
                           STRING(@n_6),AT(39,39),USE(LOC:ByteCounter2)
                           LIST,AT(3,54,503,218),USE(?LIST1),VSCROLL,FORMAT('40L(2)|M~Tijd~C(0)@t4@60R(2)|M~Gewich' & |
  't~C(1)@n-13`2@100L(2)|M~Receivestring (ASCII)~C(0)@s255@1020L(2)|M~Receivestring (De' & |
  'c)~C(0)@s255@'),FROM(Loc:GewichtQ)
                           CHECK('Loggen'),AT(465,277),USE(LOC:Loggen),VALUE('1','0')
                         END
                       END
                     END

    omit('***',WE::CantCloseNowSetHereDone=1)  !Getting Nested omit compile error, then uncheck the "Check for duplicate CantCloseNowSetHere variable declaration" in the WinEvent local template
WE::CantCloseNowSetHereDone equate(1)
WE::CantCloseNowSetHere     long
    !***
ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED
TakeCloseEvent         PROCEDURE(),BYTE,PROC,DERIVED
TakeEvent              PROCEDURE(),BYTE,PROC,DERIVED
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
Resizer              CLASS(WindowResizeClass)
Init                   PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)
                     END

FDCB3                CLASS(FileDropComboClass)             ! File drop combo manager
Q                      &Queue:FileDropCombo           !Reference to browse queue type
                     END

WeegClass           CLASS
Stabiel                 PROCEDURE(LONG), BYTE
SavGewicht          	LONG,DIM(10)
					End

  CODE
  GlobalResponse = ThisWindow.Run()                        ! Opens the window and starts an Accept Loop

!---------------------------------------------------------------------------
DefineListboxStyle ROUTINE
!|
!| This routine create all the styles to be shared in this window
!| It`s called after the window open
!|
!---------------------------------------------------------------------------
WeegButton          ROUTINE
	IF Loc:Stabiel = 1 OR NOT(LOC:PortID_Weeg >= 0) THEN
		IF (LOC:Gewicht) > 0
			CLEAR(APalSrt:Record)
			APalSrt:PalletSoortID = LOC:PalletSoortID
            Access:APalletSoort.TryFetch(APalSrt:PK_PalletSoort)
            
            CLEAR(PLL:Record)
            Access:Pallet.Insert()

			CLEAR(GLO:WegingQueue)
			WGQ:BrutoGewichtKG = LOC:Gewicht + LOC:PalletTarra
			WGQ:Palletsoort = APalSrt:PalletOmschrijving
			WGQ:PalletsoortID = LOC:PalletSoortID
			WGQ:NettoGewichtKG = LOC:Gewicht
			WGQ:Datum = TODAY()
            WGQ:Tijd = CLOCK()
            WGQ:PalletID = PLL:PalletID
			ADD(GLO:WegingQueue)
			
			DO BerekenTotaals
						
			IF LOC:DymoEtiketPrinten
				ReportDymoStickers(2, RECORDS(GLO:WegingQueue))
            END
            
            IF LOC:PalletBladPrinten > 0
                ! GLO:PalletBlad-variabelen worden gevuld bij het drukken op de Weeg Nu-knop voorafgaand aan deze window.
                ReportPalletBladEnkel(WGQ:PalletID, LOC:Gewicht, FALSE, LOC:PalletBladPrinten)
            END    
		END
	END
	
	EXIT
BerekenTotaals      ROUTINE
	LOC:TotaalNettoKG = GLO:TotaalWegingKG
	LOOP i# = 1 TO RECORDS(GLO:WegingQueue)
		GET(GLO:WegingQueue, i#)
		LOC:TotaalNettoKG += WGQ:NettoGewichtKG
	END
	
	LOC:AantalPallets = GLO:TotaalWegingPallets + RECORDS(GLO:WegingQueue)
	
	DISPLAY(?LOC:TotaalNettoKG)
	DISPLAY(?LOC:AantalPallets)
	
	EXIT
UpdatePalletBladPrintButton ROUTINE
    CASE LOC:PalletBladPrinten
    OF 0
        ?PalletbladGeenPrintButton{PROP:Background} = COLOR:Green
        ?PalletbladPrintButton{PROP:Background} = COLOR:BTNFACE
        ?Palletblad2PrintButton{PROP:Background} = COLOR:BTNFACE
    OF 1
        ?PalletbladGeenPrintButton{PROP:Background} = COLOR:BTNFACE
        ?PalletbladPrintButton{PROP:Background} = COLOR:Green
        ?Palletblad2PrintButton{PROP:Background} = COLOR:BTNFACE
    OF 2
        ?PalletbladGeenPrintButton{PROP:Background} = COLOR:BTNFACE
        ?PalletbladPrintButton{PROP:Background} = COLOR:BTNFACE
        ?Palletblad2PrintButton{PROP:Background} = COLOR:Green
    END
UpdateDymoPrintButton ROUTINE
    CASE LOC:DymoEtiketPrinten
    OF 0
        ?DymoGeenPrintButton{PROP:Background} = COLOR:Green
        ?DymoPrintButton{PROP:Background} = COLOR:BTNFACE
    OF 1
        ?DymoGeenPrintButton{PROP:Background} = COLOR:BTNFACE
        ?DymoPrintButton{PROP:Background} = COLOR:Green
    END

ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('WeegWindow')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?STRING2
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
  IF SELF.Request = SelectRecord
     SELF.AddItem(?Ok,RequestCancelled)                    ! Add the close control to the window manger
  ELSE
     SELF.AddItem(?Ok,RequestCompleted)                    ! Add the close control to the window manger
  END
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  Relate:APalletSoort.Open                                 ! File APalletSoort used by this procedure, so make sure it's RelationManager is open
  Relate:Pallet.Open                                       ! File Pallet used by this procedure, so make sure it's RelationManager is open
  Relate:PalletSoort.Open                                  ! File PalletSoort used by this procedure, so make sure it's RelationManager is open
  Relate:Partij.Open                                       ! File Partij used by this procedure, so make sure it's RelationManager is open
  Relate:Relatie.SetOpenRelated()
  Relate:Relatie.Open                                      ! File Relatie used by this procedure, so make sure it's RelationManager is open
  Relate:Verpakking.Open                                   ! File Verpakking used by this procedure, so make sure it's RelationManager is open
  Relate:ViewArtikel.Open                                  ! File ViewArtikel used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(QuickWindow)                                   ! Open window
  LOC:GebruikKoord=GETINI('Weeg','GebruikKoord',0,'.\Voorraad.ini')
  LOC:PortString_Koord=GETINI('Weeg','PortKoord',,'.\Voorraad.ini')
  LOC:PortString_Weeg=GETINI('Weeg','PortWeeg',,'.\Voorraad.ini')
  LOC:NieuweWeegschaal=GETINI('Weeg','NieuweWeegschaal',0,'.\Voorraad.ini')
  LOC:Loggen=GETINI('Weeg','Loggen',0,'.\Voorraad.ini')
  Loc:AantalPogingen = GETINI('Weeg','AantalPogingen',5,'.\Voorraad.ini')
  
  IF CLIP(LOC:PortString_Koord) <> ''
      LOC:PortID_Koord = NewPort(LOC:PortString_Koord)
      IF LOC:PortID_Koord < 0                           ! there was an Error
          MESSAGE('COM-port van het koord kon niet geopend worden: ' & LOC:PortID_Koord,LOC:PortString_Koord)
          LOC:Debug = 1
      END
  ELSE
      HIDE(?LOC:GebruikKoord)
  END
  
  IF CLIP(LOC:PortString_Weeg) <> ''
      LOC:PortID_Weeg = NewPort(LOC:PortString_Weeg)
      IF LOC:PortID_Weeg < 0                           ! there was an Error
          MESSAGE('COM-port van de weegschaal kon niet geopend worden: ' & LOC:PortID_Weeg,LOC:PortString_Weeg)
      ELSE
          IF (LOC:Debug = 1) THEN LOC:Debug = 0.
      END
  END
  
  LOC:DymoEtiketPrinten = GETINI('Weeg','DymoEtiketPrinten', 1, '.\Voorraad.ini')
  DO UpdateDymoPrintButton
  LOC:PalletBladPrinten = GETINI('Weeg','PalletBladPrinten', 1, '.\Voorraad.ini')
  DO UpdatePalletBladPrintButton
  
  LOC:PalletSoortID = 1
  PalSrt:PalletSoortID = 1
  Access:PalletSoort.TryFetch(PalSrt:PK_PalletSoort)
  LOC:PalletTarra = PalSrt:Tarra
  
  FREE(GLO:WegingQueue)
  DO BerekenTotaals
  WinAlertMouseZoom()
  Do DefineListboxStyle
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('WeegWindow',QuickWindow)                   ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  FDCB3.Init(PalSrt:PalletOmschrijving,?PalSrt:PalletOmschrijving,Queue:FileDropCombo.ViewPosition,FDCB3::View:FileDropCombo,Queue:FileDropCombo,Relate:PalletSoort,ThisWindow,GlobalErrors,0,1,0)
  FDCB3.Q &= Queue:FileDropCombo
  FDCB3.AddSortOrder(PalSrt:FK_PalletSoort)
  FDCB3.AddField(PalSrt:PalletOmschrijving,FDCB3.Q.PalSrt:PalletOmschrijving) !List box control field - type derived from field
  FDCB3.AddField(PalSrt:Tarra,FDCB3.Q.PalSrt:Tarra) !Browse hot field - type derived from field
  FDCB3.AddField(PalSrt:PalletSoortID,FDCB3.Q.PalSrt:PalletSoortID) !Primary key field - type derived from field
  FDCB3.AddUpdateField(PalSrt:PalletSoortID,LOC:PalletSoortID)
  FDCB3.AddUpdateField(PalSrt:Tarra,LOC:PalletTarra)
  ThisWindow.AddItem(FDCB3.WindowComponent)
  FDCB3.DefaultFill = 0
  SELF.SetAlerts()
  EnterByTabManager.ExcludeControl(?Cancel)
  EnterByTabManager.ExcludeControl(?Ok)
  EnterByTabManager.Init(False)
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF NOT(LOC:Debug)
  	KillAllPorts()
  END
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:APalletSoort.Close
    Relate:Pallet.Close
    Relate:PalletSoort.Close
    Relate:Partij.Close
    Relate:Relatie.Close
    Relate:Verpakking.Close
    Relate:ViewArtikel.Close
  END
  IF SELF.Opened
    INIMgr.Update('WeegWindow',QuickWindow)                ! Save window data to non-volatile store
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
    OF ?LOC:GebruikKoord
      PUTINI('Weeg','GebruikKoord',LOC:GebruikKoord,'.\Voorraad.ini')
    OF ?VerwijderButton
      ! Verwijder geselecteerde weging-regel
      GET(GLO:WegingQueue, CHOICE(?WegingQueue))
      IF NOT(ERROR()) THEN
      	DELETE(GLO:WegingQueue)
      	DO BerekenTotaals
      END
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?PalSrt:PalletOmschrijving
      	! na selectie de weegbutton selecteren
      	Select(?WeegButton)
    OF ?WeegButton
      ThisWindow.Update()
      DO WeegButton
    OF ?DymoPrintButton
      ThisWindow.Update()
      LOC:DymoEtiketPrinten = 1
      PUTINI('Weeg','DymoEtiketPrinten', LOC:DymoEtiketPrinten, '.\Voorraad.ini')
      DO UpdateDymoPrintButton
    OF ?DymoGeenPrintButton
      ThisWindow.Update()
      LOC:DymoEtiketPrinten = 0
      PUTINI('Weeg','DymoEtiketPrinten', LOC:DymoEtiketPrinten, '.\Voorraad.ini')
      DO UpdateDymoPrintButton
    OF ?Palletblad2PrintButton
      ThisWindow.Update()
      LOC:PalletBladPrinten = 2
      PUTINI('Weeg','PalletBladPrinten', LOC:PalletBladPrinten, '.\Voorraad.ini')
      DO UpdatePalletBladPrintButton
    OF ?PalletbladPrintButton
      ThisWindow.Update()
      LOC:PalletBladPrinten = 1
      PUTINI('Weeg','PalletBladPrinten', LOC:PalletBladPrinten, '.\Voorraad.ini')
      DO UpdatePalletBladPrintButton
    OF ?PalletbladGeenPrintButton
      ThisWindow.Update()
      LOC:PalletBladPrinten = 0
      PUTINI('Weeg','PalletBladPrinten', LOC:PalletBladPrinten, '.\Voorraad.ini')
      DO UpdatePalletBladPrintButton
    OF ?LOC:Loggen
      PUTINI('Weeg','Loggen',LOC:Loggen,'.\Voorraad.ini')
    END
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue


ThisWindow.TakeCloseEvent PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  IF MESSAGE('Weet u zeker dat u dit venster wilt sluiten? ', 'Venster sluiten', ICON:Exclamation, BUTTON:YES+BUTTON:NO, BUTTON:NO) <> BUTTON:YES THEN RETURN Level:Notify.
  ReturnValue = PARENT.TakeCloseEvent()
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
    OF EVENT:Timer
      ! Babbelen met het koord/weegschaal
      0{Prop:Timer}=0
      ! LOC:Gewicht nog vullen met de uitgelezen waarde
      
      IF NOT(LOC:Debug)
      	IF LOC:PortID_Weeg >= 0
      		! at this point there may or may not be characters waiting in the recieve buffer.
      		! if there are I can get the characters out of the buffer one at a time
      		LOOP
      			! Get 1 character if it's waiting
      			LOC:Result = ReadPort(LOC:PortID_Weeg, LOC:TempChar, 1)	
      			! there were charaters waiting
      			IF LOC:Result > 0
      				LGQ:ReceiveString2 = CLIP(CLIP(LGQ:Receivestring2) & ',' & VAL(LOC:TempChar))
      				IF VAL(LOC:TempChar)=10 or VAL(LOC:TempChar)=0 then cycle. !en lees de volgende in
      				
      				IF LOC:ByteCounter2 >= 20 or VAL(LOC:TempChar)= 13 then      ! 20 posities of een enter
      					IF NOT(LOC:NieuweWeegschaal) THEN ! Oude weegschaal
      						! als de laatste een 1 is dan skippen
      						IF SUB(CLIP(LGQ:Receivestring1),-1,1)='0'
      						   LGQ:Gewicht= Sub(LGQ:Receivestring1,1,LEN(CLIP(LGQ:Receivestring1))-13)
      						   LOC:Gewicht= (LGQ:Gewicht - LOC:PalletTarra)
      						   Loc:Stabiel = WeegClass.Stabiel(LOC:Gewicht)
      						ELSE
      						   LGQ:Gewicht=0
      						!   LOC:Gewicht=0
      						!   Loc:Stabiel=FALSE
      						END
      					ELSE ! Nieuwe weegschaal
      						! als de laatste een 1 is dan skippen
      						IF SUB(LGQ:Receivestring1,3,1) = '+' ! Derde karakter is een +
      							LGQ:Gewicht= CLIP(Sub(LGQ:Receivestring1,4, LEN(LGQ:Receivestring1) - 3))
      							LOC:Gewicht= (LGQ:Gewicht - LOC:PalletTarra)
      							Loc:Stabiel = WeegClass.Stabiel(LOC:Gewicht)
      						ELSE
      						   LGQ:Gewicht=0
      						!   LOC:Gewicht=0
      						!   Loc:Stabiel=FALSE
      						END
      					END
      					
      					IF (LOC:Loggen = 1)
      						 LGQ:Tijd=CLOCK()
      						 Add(Loc:GewichtQ)						! Uitgeschakeld want dit heb ik alleen voor de test nodig
      					END
      					
      					Clear(LGQ:Tijd)
      					Clear(LGQ:Gewicht)
      					Clear(LGQ:Receivestring1)
      					Clear(LGQ:Receivestring2)
      					LOC:ByteCounter2 = 0
      				.  
      				LGQ:Receivestring1 = CLIP(LGQ:Receivestring1) & LOC:TempChar             ! see note 2
      				LOC:ByteCounter2 = LOC:ByteCounter2 + 1
      			ELSE
      				! there are no more characters waiting so break out of the loop.
      				BREAK                       
      			.
      		.
      	END
      
      	IF(LOC:GebruikKoord)
      		IF Loc:Stabiel=FALSE
      			?WeegButton{PROP:Color}=COLOR:Red
      			Loc:AanHetKoordGetrokken=FALSE
      			
      			! Buffer leeglezen
      			IF LOC:PortID_Koord >= 0
      				LOOP 
      					LOC:Result = ReadPort(LOC:PortID_Koord, LOC:TempChar, 1)
      					IF LOC:Result <= 0 THEN BREAK.
      				.
      			.
      		ELSE
      			IF Loc:AanHetKoordGetrokken=FALSE
      				?WeegButton{PROP:Color}=COLOR:Yellow 
      				Loc:SendString='$016BB'
      				Loc:SendString = CLIP(Loc:SendString) & CHR(13)
      				if WritePort(LOC:PortID_Koord,Loc:SendString, 0). 
      
      				IF LOC:PortID_Koord >= 0
      					! Voor test zaken nu opvragen of er aan de schakelaar wordt getrokken
      					LOOP
      						! Get 1 character if it's waiting
      						LOC:Result = ReadPort(LOC:PortID_Koord, LOC:TempChar, 1)
      						
      						IF LOC:Result > 0			! there were charaters waiting
      							IF LOC:ByteCounter1 >= 50 or VAL(LOC:TempChar)= 13 then      ! 20 posities of een enter
      								IF INSTRING('!000E0056',Loc:ReceiveString2,1,1) THEN 
      									Loc:AanHetKoordGetrokken=TRUE
      									DO WeegButton
      									
      									! Buffer leeglezen
      									LOOP 
      										LOC:Result = ReadPort(LOC:PortID_Koord, LOC:TempChar, 1)
      										IF LOC:Result <= 0 THEN BREAK.
      									.
      									
      									BREAK
      								.
      								Clear(Loc:ReceiveString2)
      								LOC:ByteCounter1 = 0
      								Cycle
      							END	
      							 Loc:ReceiveString2 = CLIP(Loc:ReceiveString2) & LOC:TempChar             
      							   LOC:ByteCounter1 += 1
      						ELSE
      							! There are no more characters waiting so break out of the loop.
      							BREAK                       
      						.
      					.
      				END
      			ELSE
      				! Buffer leeglezen
      				IF LOC:PortID_Koord >= 0
      					LOOP 
      						LOC:Result = ReadPort(LOC:PortID_Koord, LOC:TempChar, 1)
      						IF LOC:Result <= 0 THEN BREAK.
      					.
      				.
      				
      				?WeegButton{PROP:Color}=COLOR:Lime
      			END	
      		END
      	ELSE
      		IF Loc:Stabiel=FALSE
      			?WeegButton{PROP:Color}=COLOR:Red
      		ELSE
      			?WeegButton{PROP:Color}=COLOR:Yellow 
      		END
      	END
      ELSE
      	LOC:Gewicht = 50
      END
      !IF (LOC:Loggen = 1)
      !	 Add(Loc:GewichtQ)						! Uitgeschakeld want dit heb ik alleen voor de test nodig
      !END
      
      Display(?Loc:Gewicht)
      DISPLAY
      
      
      
      0{Prop:Timer}=10
    END
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue

WeegClass.Stabiel   PROCEDURE(LONG PRM:Gewicht)

CODE
	IF PRM:Gewicht<=0 THEN RETURN FALSE.
	WeegClass.SavGewicht[10]=WeegClass.SavGewicht[9]
	WeegClass.SavGewicht[9]=WeegClass.SavGewicht[8]
	WeegClass.SavGewicht[8]=WeegClass.SavGewicht[7]
	WeegClass.SavGewicht[7]=WeegClass.SavGewicht[6]
	WeegClass.SavGewicht[6]=WeegClass.SavGewicht[5]
	WeegClass.SavGewicht[5]=WeegClass.SavGewicht[4]
	WeegClass.SavGewicht[4]=WeegClass.SavGewicht[3]
	WeegClass.SavGewicht[3]=WeegClass.SavGewicht[2]
	WeegClass.SavGewicht[2]=WeegClass.SavGewicht[1]
	WeegClass.SavGewicht[1]=PRM:GEWICHT
	DISPLAY
	Loop i#=1 to Loc:AantalPogingen				! omdat als ik er 10 vraag het te lang duurt (was hierna 5)
		IF NOT WeegClass.SavGewicht[i#]=PRM:GEWICHT
			RETURN FALSE
		END
	End
	RETURN TRUE

Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window

