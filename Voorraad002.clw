

   MEMBER('Voorraad.clw')                                  ! This is a MEMBER module


   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE
   INCLUDE('MENUStyle.INC'),ONCE
   INCLUDE('NetTalk.inc'),ONCE

                     MAP
                       INCLUDE('VOORRAAD002.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('VOORRAAD004.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('VOORRAAD005.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('VOORRAAD006.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('VOORRAAD008.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('VOORRAAD009.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('VOORRAAD010.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('VOORRAAD011.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('VOORRAAD012.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('VOORRAAD014.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('VOORRAAD017.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('VOORRAAD018.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('VOORRAAD019.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('VOORRAAD021.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('VOORRAAD023.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('VOORRAAD024.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('VOORRAAD025.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('VOORRAAD028.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('VOORRAAD029.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('VOORRAAD030.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('VOORRAAD032.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('VOORRAAD033.INC'),ONCE        !Req'd for module callout resolution
                     END


!!! <summary>
!!! Generated from procedure template - Frame
!!! </summary>
MainFrame PROCEDURE 

udpt            UltimateDebugProcedureTracker
Loc:NetOptions       STRING(256)                           ! 
SplashProcedureThread LONG
MenuStyleMgr MenuStyleManager
LocEnableEnterByTab  BYTE(1)                               !Used by the ENTER Instead of Tab template
EnterByTabManager    EnterByTabClass
AppFrame             APPLICATION('Voorraad'),AT(,,504,353),FONT('Microsoft Sans Serif',10,,,CHARSET:DEFAULT),RESIZE, |
  ICON('JMDico.ico'),MAX,STATUS(50,50,50,-1),SYSTEM,IMM
                       MENUBAR,USE(?MENUBAR1),FONT(,,COLOR:MENUTEXT)
                         MENU('&Bestand'),USE(?FileMenu)
                           ITEM('P&rint Setup...'),USE(?PrintSetup),MSG('Setup Printer'),STD(STD:PrintSetup)
                           MENU('Onderhoud'),USE(?OnderhoudMenu)
                             ITEM('Checken Inkoop/VerkoopStatus'),USE(?ITEM3),HIDE
                             ITEM('Partijen/Verkoop/Planning terughalen uit GebruikerLog'),USE(?GebruikerLogTerugzetten)
                             ITEM('Planning-regels zonder inkoop/verkoop verwijderen'),USE(?ITEM4)
                             ITEM('Externe partijnr 0 => leeg'),USE(?ITEM10),HIDE
                             ITEM,USE(?SEPARATOR4),HIDE,SEPARATOR
                             ITEM('Partij-koppeling Mutatie controleren'),USE(?ITEM5),HIDE
                             ITEM('Partij-koppeling Planning controleren'),USE(?ITEM6),HIDE
                             ITEM,USE(?SEPARATOR5),HIDE,SEPARATOR
                             ITEM('Overzicht rare mutaties'),USE(?ITEM8)
                             ITEM('Overzicht dubbele inslagen'),USE(?ITEM9)
                             ITEM('Overzicht partij zonder inslag'),USE(?ITEM7)
                             ITEM('Vullen Planning:MutatieKG'),USE(?ITEM12)
                             ITEM('Vullen Partij:InkoopKGPrijs'),USE(?ITEM13)
                             ITEM('CelLocatieVullenMutaties'),USE(?CelLocatieVullenMutaties)
                             ITEM,USE(?SEPARATOR6),SEPARATOR
                             ITEM('SQLBackup'),USE(?ITEM14)
                           END
                           ITEM,USE(?SEPARATOR1),SEPARATOR
                           ITEM('E&xit'),USE(?Exit),MSG('Exit this application'),STD(STD:Close)
                         END
                         MENU('&Edit'),USE(?EditMenu)
                           ITEM('Cu&t'),USE(?Cut),MSG('Remove item to Windows Clipboard'),STD(STD:Cut)
                           ITEM('&Copy'),USE(?Copy),MSG('Copy item to Windows Clipboard'),STD(STD:Copy)
                           ITEM('&Paste'),USE(?Paste),MSG('Paste contents of Windows Clipboard'),STD(STD:Paste)
                         END
                         MENU('Stamgegevens'),USE(?Stamgegevens)
                           ITEM('Verpakkingen'),USE(?StamgegevensVerpakkingen)
                           ITEM('Artikelen'),USE(?StamgegevensArtikelen)
                           ITEM('Cel'),USE(?Cel)
                           ITEM('&Palletsoorten voor weegmodule'),USE(?ITEM11)
                           ITEM('Delivery Terms'),USE(?StamgegevensDeliveryTerms)
                           ITEM('ISO Countries'),USE(?ISOCountries)
                           ITEM('GNCode'),USE(?GNCode)
                           ITEM('Uitvoerhavens'),USE(?Uitvoerhavens)
                           ITEM,USE(?SEPARATOR7),SEPARATOR
                           ITEM('Relaties'),USE(?StamgegevensRelaties)
                           ITEM('Relatie-adressen/-artikelomschrijvingen'),USE(?StamgegevensAdressen)
                           ITEM('Transporteurs'),USE(?StamgegevensTransporteurs)
                           ITEM('Kosten'),USE(?StamgegevensKosten)
                           ITEM,USE(?SEPARATOR2),SEPARATOR
                           ITEM('Rapporten'),USE(?Rapporten)
                           ITEM('Systeemgegevens'),USE(?Systeemgegevens)
                           ITEM('Gebruikers'),USE(?Gebruikers)
                           ITEM('Log'),USE(?Logging)
                           ITEM('Sjablonen'),USE(?StamgegevensSjablonen)
                           ITEM('Palletblad-Sjablonen'),USE(?ITEM15)
                           ITEM('SSOP Categorie'),USE(?SSOPCategorie)
                           ITEM('Systeembeheer'),USE(?ITEM1)
                         END
                         ITEM('Inkoop'),USE(?Inkoop:2)
                         ITEM('Verkoop'),USE(?Verkoop:2)
                         ITEM('Overboeking'),USE(?Overboeking)
                         ITEM('Planning'),USE(?Planning)
                         ITEM('Activiteiten'),USE(?Activiteiten)
                         ITEM('Voorraad'),USE(?Voorraad)
                         ITEM('Partij-voorraad'),USE(?PartijVoorraad:2)
                         MENU('Pallets'),USE(?PalletMenu)
                           ITEM('&Pallet-verloop'),USE(?Pallets)
                           ITEM('&Pallet-tegoeden'),USE(?PalletTegoeden)
                           ITEM('Gewogen Pallets'),USE(?GewogenPallets)
                         END
                         ITEM('SSOP Registratie'),USE(?SSOPRegistratie)
                         ITEM('Cel Locaties'),USE(?CelLocaties)
                         MENU('Overzichten'),USE(?Overzichten)
                           ITEM('Export Mutaties'),USE(?ExportMutaties)
                           ITEM('Export Actie Afwijkingen'),USE(?ActieAfwijkingen)
                           ITEM('Export SSOP Registratie'),USE(?SSOPRegistratie:2)
                         END
                         MENU('&Window'),USE(?MENU1),MSG('Create and Arrange windows'),STD(STD:WindowList)
                           ITEM('T&ile'),USE(?Tile),MSG('Make all open windows visible'),STD(STD:TileWindow)
                           ITEM('&Cascade'),USE(?Cascade),MSG('Stack all open windows'),STD(STD:CascadeWindow)
                           ITEM('&Arrange Icons'),USE(?Arrange),MSG('Align all window icons'),STD(STD:ArrangeIcons)
                         END
                         MENU('&Help'),USE(?MENU2),MSG('Windows Help')
                           ITEM('&Contents'),USE(?Helpindex),MSG('View the contents of the help file'),STD(STD:HelpIndex)
                           ITEM('&Search for Help On...'),USE(?HelpSearch),MSG('Search for help on a subject'),STD(STD:HelpSearch)
                           ITEM('&How to Use Help'),USE(?HelpOnHelp),MSG('How to use Windows Help'),STD(STD:HelpOnHelp)
                           ITEM,USE(?SEPARATOR3),SEPARATOR
                           ITEM('Hulp op afstand'),USE(?HulpOpAfstand)
                           ITEM('Versie informatie'),USE(?BrowseVersie)
                           ITEM,USE(?SEPARATOR8),SEPARATOR
                           ITEM('NetRefreshPlanning'),USE(?NetRefreshPlanning)
                           ITEM('NetRefreshVoorraad'),USE(?NetRefreshVoorraad)
                         END
                       END
                     END

    omit('***',WE::CantCloseNowSetHereDone=1)  !Getting Nested omit compile error, then uncheck the "Check for duplicate CantCloseNowSetHere variable declaration" in the WinEvent local template
WE::CantCloseNowSetHereDone equate(1)
WE::CantCloseNowSetHere     long
    !***
ThisWindow           CLASS(WindowManager)
Ask                    PROCEDURE(),DERIVED
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED
TakeEvent              PROCEDURE(),BYTE,PROC,DERIVED
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
!Local Data Classes
ThisNetAutoCloseServer CLASS(NetAutoCloseServer)           ! Generated by NetTalk Extension (Class Definition)

                     END


  CODE
? DEBUGHOOK(ARelatie:Record)
? DEBUGHOOK(AViewArtikel:Record)
? DEBUGHOOK(ArtikelOmschrijvingExtra:Record)
? DEBUGHOOK(Gebruiker:Record)
? DEBUGHOOK(PartijCelVoorraad:Record)
? DEBUGHOOK(RelatieArtikelOmschrijving:Record)
? DEBUGHOOK(Sjabloon:Record)
? DEBUGHOOK(Versie:Record)
? DEBUGHOOK(ViewVoorraadPartij:Record)
  GlobalResponse = ThisWindow.Run()                        ! Opens the window and starts an Accept Loop

!---------------------------------------------------------------------------
DefineListboxStyle ROUTINE
!|
!| This routine create all the styles to be shared in this window
!| It`s called after the window open
!|
!---------------------------------------------------------------------------
Menu::MENUBAR1 ROUTINE                                     ! Code for menu items on ?MENUBAR1
  CASE ACCEPTED()
  OF ?Inkoop:2
    IF GLO:Inkoop_ThreadID = 0
    START(BrowseInkoop, 25000)
    	ELSE
    		NOTIFY(1, GLO:Inkoop_ThreadID)
    	.
  OF ?Verkoop:2
    	IF GLO:Verkoop_ThreadID = 0 THEN
    START(BrowseVerkoop, 25000)
    	ELSE
    		NOTIFY(1, GLO:Verkoop_ThreadID)
    	.
  OF ?Overboeking
    IF GLO:Overboeking_ThreadID = 0
    START(BrowseOverboeking, 25000)
    	ELSE
    		NOTIFY(1, GLO:Overboeking_ThreadID)
    	.
  OF ?Planning
    IF GLO:Planning_ThreadID = 0
    START(BrowsePlanning, 25000)
    	ELSE
    		NOTIFY(1, GLO:Planning_ThreadID)
    	.
  OF ?Activiteiten
    IF GLO:Activiteit_ThreadID = 0
    START(BrowseActiviteit, 25000)
    ELSE
        NOTIFY(1, GLO:Activiteit_ThreadID)
    END
  OF ?Voorraad
    	IF GLO:Voorraad_ThreadID = 0 THEN
    START(BrowseVoorraadVIEW, 25000)
    	ELSE
    		NOTIFY(1, GLO:Voorraad_ThreadID)
    	.
  OF ?PartijVoorraad:2
    	IF GLO:PartijVoorraad_ThreadID = 0 THEN
    START(BrowsePartijVoorraadVIEW, 25000)
    	ELSE
    		NOTIFY(1, GLO:PartijVoorraad_ThreadID)
    	.
  OF ?SSOPRegistratie
    START(BrowseSSOPRegistratie, 25000)
  OF ?CelLocaties
    START(WindowCelLocaties, 25000)
  END
Menu::FileMenu ROUTINE                                     ! Code for menu items on ?FileMenu
Menu::OnderhoudMenu ROUTINE                                ! Code for menu items on ?OnderhoudMenu
  CASE ACCEPTED()
  OF ?ITEM3
    START(ConvertInkoopVerkoopStatus, 25000)
  OF ?GebruikerLogTerugzetten
    START(ProcessGebruikerLogTerugzetten, 25000)
  OF ?ITEM4
    START(ClearPlanning, 25000)
  OF ?ITEM10
    START(ConvertLegeExtPartijnr, 25000)
  OF ?ITEM5
    START(FixEMutaties, 25000)
  OF ?ITEM6
    START(FixEPlanning, 25000)
  OF ?ITEM8
    START(BrowseRareMutaties, 25000)
  OF ?ITEM9
    START(BrowseDubbeleInslagMutaties, 25000)
  OF ?ITEM7
    START(BrowsePartijZonderInslag, 25000)
  OF ?ITEM12
    START(VulPlanning_MutatieKG, 25000)
  OF ?ITEM13
    START(VulPartij_InkoopKGPrijs, 25000)
  OF ?CelLocatieVullenMutaties
    START(ProcessCelLocatieVullen, 25000)
  OF ?ITEM14
    START(WindowSQLBackup, 25000)
  END
Menu::EditMenu ROUTINE                                     ! Code for menu items on ?EditMenu
Menu::Stamgegevens ROUTINE                                 ! Code for menu items on ?Stamgegevens
  CASE ACCEPTED()
  OF ?StamgegevensVerpakkingen
    START(BrowseVerpakking, 25000)
  OF ?StamgegevensArtikelen
    START(BrowseArtikel, 25000)
  OF ?Cel
    START(BrowseCel, 25000)
  OF ?ITEM11
    START(BrowsePalletSoort, 25000)
  OF ?StamgegevensDeliveryTerms
    START(BrowseDeliveryTerms, 25000)
  OF ?ISOCountries
    START(BrowseISOCountries, 25000)
  OF ?GNCode
    START(BrowseGNCode, 25000)
  OF ?Uitvoerhavens
    START(BrowseHavens, 25000)
  OF ?StamgegevensRelaties
    START(BrowseRelatie, 25000)
  OF ?StamgegevensAdressen
    START(BrowseRelatieAdres, 25000)
  OF ?StamgegevensTransporteurs
    START(BrowseTransporteurs, 25000)
  OF ?StamgegevensKosten
    START(BrowseKostenStam, 25000)
  OF ?Rapporten
    START(BrowseRapporten, 25000)
  OF ?Systeemgegevens
    START(WindowSysteemgegevens, 25000)
  OF ?Gebruikers
    START(BrowseGebruiker, 25000)
  OF ?Logging
    START(BrowseGebruikerLog, 25000)
  OF ?StamgegevensSjablonen
    START(BrowseSjablonen, 25000)
  OF ?ITEM15
    START(BrowsePalletBladSjabloon, 25000)
  OF ?SSOPCategorie
    START(BrowseSSOPCategorie, 25000)
  OF ?ITEM1
    START(Systeembeheer, 25000)
  END
Menu::PalletMenu ROUTINE                                   ! Code for menu items on ?PalletMenu
  CASE ACCEPTED()
  OF ?Pallets
    IF GLO:PalletAdministratie_ThreadID = 0
    START(BrowsePallets, 25000)
    	ELSE
    		NOTIFY(1, GLO:PalletAdministratie_ThreadID)
    	.
  OF ?PalletTegoeden
    START(BrowsePalletTegoeden, 25000)
  OF ?GewogenPallets
    START(BrowsePallet, 25000)
  END
Menu::Overzichten ROUTINE                                  ! Code for menu items on ?Overzichten
  CASE ACCEPTED()
  OF ?ExportMutaties
    START(ReportMutaties, 25000)
  OF ?ActieAfwijkingen
    START(ReportActieAfwijkingen, 25000)
  OF ?SSOPRegistratie:2
    START(ReportSSOPRegistraties, 25000)
  END
Menu::MENU1 ROUTINE                                        ! Code for menu items on ?MENU1
Menu::MENU2 ROUTINE                                        ! Code for menu items on ?MENU2
  CASE ACCEPTED()
  OF ?HulpOpAfstand
    RUN('JMDHelpdesk.exe ')
    ThisWindow.Reset(1)
  OF ?BrowseVersie
    START(BrowseVersie, 25000)
  OF ?NetRefreshPlanning
    NetRefreshPlanningViews()
  OF ?NetRefreshVoorraad
    NetRefreshVoorraadViews()
  END

ThisWindow.Ask PROCEDURE

  CODE
  0{Prop:Text}=PQ:Titel
  !0{Prop:Text}=GETINI('SYSTEEM','Titel','JMD Voorraad','.\Voorraad.ini')&' '&CLIP(GLO:Versie)&' '&GV.GetVersion()
  Comma#=Instring(',',GLO:Owner,1,1)
  
  0{PROP:StatusText,3}=SUB(GlO:Owner,1,Comma#-1)
  0{PROP:Status,3}=160
  
  TweedeComma#=Instring(',',GLO:Owner,1,Comma#+1)
  0{PROP:StatusText,2}=SUB(Glo:OWner,Comma#+1,TweedeComma#-Comma#-1)
  0{PROP:Background}=PQ:Achtergrond
  !0{PROP:Background}=GETINI('SYSTEEM','Achtergond',Color:None,'.\Voorraad.ini')
  PARENT.Ask


ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
        udpt.Init(UD,'MainFrame','Voorraad002.clw','Voorraad.EXE','06/26/2023 @ 03:21PM')    
             
  GlobalErrors.SetProcedureName('MainFrame')
  IF WindowKiesPartner()=FALSE           ! Geen Partner Gekozen
      Return Level:Cancel
  END
  SourceCheckVersie()
  	GLO:Planning_ThreadID = 0
  	GLO:Inkoop_ThreadID = 0
  	GLO:Verkoop_ThreadID = 0
  	GLO:Overboeking_ThreadID = 0
  	GLO:PartijVoorraad_ThreadID = 0
  	GLO:PalletAdministratie_ThreadID = 0
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = 1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:ARelatie.Open                                     ! File ARelatie used by this procedure, so make sure it's RelationManager is open
  Relate:AViewArtikel.Open                                 ! File AViewArtikel used by this procedure, so make sure it's RelationManager is open
  Relate:ArtikelOmschrijvingExtra.Open                     ! File ArtikelOmschrijvingExtra used by this procedure, so make sure it's RelationManager is open
  Relate:Gebruiker.Open                                    ! File Gebruiker used by this procedure, so make sure it's RelationManager is open
  Relate:PartijCelVoorraad.Open                            ! File PartijCelVoorraad used by this procedure, so make sure it's RelationManager is open
  Relate:RelatieArtikelOmschrijving.Open                   ! File RelatieArtikelOmschrijving used by this procedure, so make sure it's RelationManager is open
  Relate:Sjabloon.Open                                     ! File Sjabloon used by this procedure, so make sure it's RelationManager is open
  Relate:Versie.Open                                       ! File Versie used by this procedure, so make sure it's RelationManager is open
  Relate:ViewVoorraadPartij.Open                           ! File ViewVoorraadPartij used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(AppFrame)                                      ! Open window
  ! Gebruiker inlog
  CLEAR(Geb:Record)
  Geb:WindowsInlog = CLIP(GETUSERNAME())
  IF Access:Gebruiker.TryFetch(Geb:FK1_Gebruiker) = Level:Benign
      IF GEB:GeenToegang
          Message('U heeft geen toegang tot deze administratie','Toegangscontrole',ICON:Cross)
          Return Level:Cancel
      END
      
  	! Gebruiker bestaat al
      IGB:GebruikerID=Geb:ID
      IGB:WindowsInlog = Geb:WindowsInlog
  	GetComputerName(ComputerName, ComputerLen)
  	IGB:Werkstation = ComputerName
  	IGB:Administrator = Geb:Administrator
  	IGB:BekijkenPrijzen = Geb:BekijkenPrijzen
      IGB:MakenVerkoopMutatie = Geb:MakenVerkoopMutatie
      IGB:Verwerken = Geb:Verwerken
  ELSE
  	! Gebruiker bestaat nog niet
  	CLEAR(Geb:Record)
  	Geb:WindowsInlog = CLIP(GETUSERNAME())
  	Access:Gebruiker.TryInsert()
  	
      IGB:GebruikerID=Geb:ID
  	IGB:WindowsInlog = Geb:WindowsInlog
  	GetComputerName(ComputerName, ComputerLen)
  	IGB:Werkstation = ComputerName
  	IGB:Administrator = 0
  	IGB:BekijkenPrijzen = 0
      IGB:MakenVerkoopMutatie = 0
      IGB:Verwerken = 0 
  END
  
  IF NOT(IGB:Administrator) THEN
  	HIDE(?Gebruikers)
  	HIDE(?OnderhoudMenu)
  END
  
  GLO:HidePlanningInstructie = GETINI('Voorraad','HidePlanningInstructie',0,PQ:IniFile)
  
  	Alias(DecimalKey, 00BCH)
                                               ! Generated by NetTalk Extension (Start)
  Loc:NetOptions=50
  NetOptions(NET:SETMAXINSTANCES,Loc:NetOptions)
  
  !NetOptions(NET:GETMAXINSTANCES,Loc:NetOptions)
  !Message('Hoe veel Instances?'&Loc:NetOptions)
  ThisNetAutoCloseServer.DefaultWarningMessage = 'For maintainence reasons this program needs to be closed down. Please immediately save what you are doing and exit the program.'
  ThisNetAutoCloseServer.DefaultCloseDownMessage = 'This application is being closed down by an administrator.'
  ThisNetAutoCloseServer.WarningTimer = 4500
  ThisNetAutoCloseServer.CloseDownTimer = 1000
  ThisNetAutoCloseServer.init('NetCloseApp' & 'Voorraad', NET:StartService+NET:DontAnnounceNow)
  if ThisNetAutoCloseServer.error <> 0
    ! Put code in here to handle if the object does not initialise properly
  end
  ThisNetAutoCloseServer.Announce(NET:OnlyOncePerThread)     ! Generated by NetTalk Extension
  Do DefineListboxStyle
  Alert(AltKeyPressed)  ! WinEvent : These keys cause a program to crash on Windows 7 and Windows 10.
  Alert(F10Key)         !
  Alert(CtrlF10)        !
  Alert(ShiftF10)       !
  Alert(CtrlShiftF10)   !
  Alert(AltSpace)       !
  WinAlertMouseZoom()
  WinAlert(WE::WM_QueryEndSession,,Return1+PostUser)
  AppFrame{Prop:Alrt,255} = CtrlShiftP
  ThisNetRefresh.SuppressErrorMsg = 1         ! No Object Generated Error Messages ! NetTalk (NetRefresh)
  ThisNetRefresh.WaitThisLong = 5 * 100
  ThisNetRefresh.Init('NetRefresh' & 'Voorraad', NET:STARTSERVICE+Net:DontAnnounceNow)   ! NetTalk (NetRefresh)
  ThisNetRefresh.Announce(NET:OnlyOncePerThread)   ! NetTalk (NetRefresh)
  !ProcedureTemplate = Frame
  INIMgr.Fetch('MainFrame',AppFrame)                       ! Restore window settings from non-volatile store
  ProcessExactViews()
  ds_SetApplicationWindow(AppFrame)
  SELF.SetAlerts()
      AppFrame{PROP:TabBarLocation} = MDITabLocation:Top
      AppFrame{PROP:TabBarStyle} = TabStyle:Default
      AppFrame{PROP:TabBarVisible}  = True
      MenuStyleMgr.Init(?MENUBAR1)
      MenuStyleMgr.SuspendRefresh()
      MenuStyleMgr.SetThemeColors('WindowsClassicLight')
      MenuStyleMgr.SetImageBar(False)
      MenuStyleMgr.ApplyTheme()
      MenuStyleMgr.Refresh(TRUE)
  EnterByTabManager.Init(False)
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ThisNetAutoCloseServer.Kill(Net:StopService+NET:DontAnnounceNow) ! Generated by NetTalk Extension
  ThisNetAutoCloseServer.Announce(NET:OnlyOncePerThread)     ! Generated by NetTalk Extension
  If self.opened Then WinAlert().
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:ARelatie.Close
    Relate:AViewArtikel.Close
    Relate:ArtikelOmschrijvingExtra.Close
    Relate:Gebruiker.Close
    Relate:PartijCelVoorraad.Close
    Relate:RelatieArtikelOmschrijving.Close
    Relate:Sjabloon.Close
    Relate:Versie.Close
    Relate:ViewVoorraadPartij.Close
  END
  IF SELF.Opened
    INIMgr.Update('MainFrame',AppFrame)                    ! Save window data to non-volatile store
  END
  ThisNetRefresh.Kill(Net:StopService+NET:DontAnnounceNow)            ! NetTalk (NetRefresh)
  ThisNetRefresh.Announce(NET:OnlyOncePerThread)   ! NetTalk (NetRefresh)
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
    ELSE
      DO Menu::MENUBAR1                                    ! Process menu items on ?MENUBAR1 menu
      DO Menu::FileMenu                                    ! Process menu items on ?FileMenu menu
      DO Menu::OnderhoudMenu                               ! Process menu items on ?OnderhoudMenu menu
      DO Menu::EditMenu                                    ! Process menu items on ?EditMenu menu
      DO Menu::Stamgegevens                                ! Process menu items on ?Stamgegevens menu
      DO Menu::PalletMenu                                  ! Process menu items on ?PalletMenu menu
      DO Menu::Overzichten                                 ! Process menu items on ?Overzichten menu
      DO Menu::MENU1                                       ! Process menu items on ?MENU1 menu
      DO Menu::MENU2                                       ! Process menu items on ?MENU2 menu
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
  ThisNetRefresh.TakeEvent()       ! NetTalk (NetRefresh)
  LOOP                                                     ! This method receives all events
    IF Looped
      RETURN Level:Notify
    ELSE
      Looped = 1
    END
    ThisNetAutoCloseServer.TakeEvent()                 ! Generated by NetTalk Extension
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
        UD.ShowProcedureInfo('MainFrame',UD.SetApplicationName('Voorraad','EXE'),AppFrame{PROP:Hlp},'07/02/2009 @ 05:16PM','06/26/2023 @ 03:21PM','10/11/2024 @ 01:55PM')  
    
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
      SplashProcedureThread = START(ShowNewVersion)        ! Run the splash window procedure
        post(event:visibleondesktop)
    ELSE
      IF SplashProcedureThread
        IF EVENT() = Event:Accepted
          POST(Event:CloseWindow,,SplashProcedureThread)   ! Close the splash window
          SplashPRocedureThread = 0
        END
     END
    END
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue

