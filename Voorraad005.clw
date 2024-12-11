

   MEMBER('Voorraad.clw')                                  ! This is a MEMBER module


   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABUTIL.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('VOORRAAD005.INC'),ONCE        !Local module procedure declarations
                     END


!!! <summary>
!!! Generated from procedure template - Window
!!! </summary>
WindowSysteemgegevens PROCEDURE 

udpt            UltimateDebugProcedureTracker
Loc:PalletEtiketPrinter CSTRING(199)                       ! 
Loc:ExcelMacroDirectory STRING(500)                        ! 
LOC:CMRPrinter       CSTRING(199)                          ! 
LOC:DefaultPalletbladLogo CSTRING(256)                     ! 
LOC:CMRVriesPrinter  CSTRING(199)                          ! 
LOC:MagazijnPrinter  STRING(255)                           ! 
LOC:WeeglijstPrinter STRING(255)                           ! 
LOC:ExcelPageBreak   LONG                                  ! 
LOC:LabelLength      LONG                                  ! 
LOC:LabelPositieZPL  STRING(50)                            ! 
LOC:PortKoord        STRING(50)                            ! 
LOC:PortWeeg         STRING(50)                            ! 
LOC:DymoPrinter      CSTRING(200)                          ! 
Loc:CRMVriesKopie    BYTE                                  ! 
Loc:CRMKopie         BYTE                                  ! 
Loc:CRMVriesLade     BYTE                                  ! 
LOC:NieuweWeegschaal BYTE                                  ! 
LOC:StandaardPalletverloopPeriode LONG                     ! 
LOC:StandaardVoorraadverloopPeriode LONG                   ! 
LOC:PartijRoodkleurenNaDagen LONG                          ! 
LOC:PalletbladPrinter CSTRING(1024)                        ! 
LOC:CountryCompanySSCCNVE LONG                             ! 
Loc:AantalPogingen   LONG                                  ! 
Loc:AantalZeros      LONG                                  ! 
Loc:LengteOutputString LONG                                ! 
Loc:ExportBestand    CSTRING(255)                          ! 
Loc:ExportBestandInvoice CSTRING(255)                      ! 
Loc:ExportBestandPurchaseOrder CSTRING(255)                ! 
Loc:GewichtDoos      DECIMAL(7,3)                          ! 
Loc:GewichtPallet    DECIMAL(7,3)                          ! 
Loc:LocalPath        CSTRING(256)                          ! 
Loc:NetPath          CSTRING(256)                          ! 
Loc:Titel            CSTRING(101)                          ! 
Loc:BackgroundColor  LONG                                  ! 
Loc:KwalitetKnopVerbergen BYTE                             ! 
Loc:StandaardEenheid STRING(20)                            ! 
Loc:TimerInkoop      LONG                                  ! 
Loc:TimerVerkoop     LONG                                  ! 
Loc:TimerPlanning    LONG                                  ! 
Loc:TimerVoorraad    LONG                                  ! 
Loc:TimerPartij      LONG                                  ! 
Loc:TimerWeegWindow  LONG                                  ! 
LocEnableEnterByTab  BYTE(1)                               !Used by the ENTER Instead of Tab template
EnterByTabManager    EnterByTabClass
Window               WINDOW('Systeemgegevens'),AT(,,508,393),FONT('Microsoft Sans Serif',10,,,CHARSET:DEFAULT), |
  GRAY
                       BUTTON('OK'),AT(418,373),USE(?Close)
                       BUTTON('Annuleren'),AT(454,373),USE(?Cancel)
                       SHEET,AT(2,0,502,356),USE(?SHEET1)
                         TAB('1) Algemeen'),USE(?TAB1)
                           PROMPT('Export Bestand Invoice:'),AT(9,86),USE(?Loc:ExportBestandInvoice:Prompt),TRN
                           ENTRY(@s254),AT(89,87,280,10),USE(Loc:ExportBestandInvoice)
                           BUTTON('...'),AT(381,86,12,12),USE(?LookupFile:3)
                           PROMPT('Exp. Best. Purchase Order:'),AT(9,104),USE(?Loc:ExportBestandPurchaseOrder:Prompt),TRN
                           ENTRY(@s254),AT(88,102,280,10),USE(Loc:ExportBestandPurchaseOrder)
                           BUTTON('...'),AT(381,100,12,12),USE(?LookupFile:4)
                           CHECK('Toon geen instructies'),AT(11,20),USE(GLO:HidePlanningInstructie),VALUE('1','0'),TRN
                           PROMPT('Standaard palletverloop periode:'),AT(11,35),USE(?PROMPT3),TRN
                           PROMPT('Standaard voorraadverloop periode:'),AT(11,49),USE(?PROMPT4),TRN
                           SPIN(@n_10),AT(129,49,60,10),USE(LOC:StandaardVoorraadverloopPeriode),RIGHT(1)
                           SPIN(@n_10),AT(129,35,60,10),USE(LOC:StandaardPalletverloopPeriode),RIGHT(1)
                           PROMPT('dagen'),AT(195,35,29,10),USE(?PROMPT5),TRN
                           PROMPT('dagen'),AT(195,47,29,10),USE(?PROMPT5:2),TRN
                           PROMPT('Partij (in partijvoorraad) rood na:'),AT(11,63),USE(?LOC:PartijRoodkleurenNaDagen:Prompt), |
  RIGHT,TRN
                           PROMPT('dagen'),AT(195,61),USE(?PROMPT6),TRN
                           SPIN(@n_10),AT(129,63,60,10),USE(LOC:PartijRoodkleurenNaDagen,,?LOC:PartijRoodkleurenNaDagen:2), |
  RIGHT(1)
                           PROMPT('Gewicht Doos:'),AT(8,118),USE(?Loc:GewichtDoos:Prompt),TRN
                           ENTRY(@n-10`3),AT(70,118,60,10),USE(Loc:GewichtDoos),RIGHT(2)
                           PROMPT('Gewicht Pallet:'),AT(164,118),USE(?Loc:GewichtPallet:Prompt),TRN
                           ENTRY(@n-10`3),AT(217,119,60,10),USE(Loc:GewichtPallet),RIGHT(2)
                           STRING('kg'),AT(142,118),USE(?STRING12),TRN
                           STRING('kg'),AT(287,120,8,10),USE(?STRING12:2),TRN
                           CHECK('Kwaliteit Knop verbergen:'),AT(70,139),USE(Loc:KwalitetKnopVerbergen),TRN
                           PROMPT('StandaardEenheid:'),AT(14,163),USE(?Loc:DozenofKg:Prompt),TRN
                           LIST,AT(88,162,103),USE(Loc:StandaardEenheid),DROP(2),FROM('KG|#KG|Dozen|#Dozen')
                         END
                         TAB('&2) Printer/Weegschaal'),USE(?TAB2)
                           PROMPT('Pallet Etiket Printer:'),AT(4,18),USE(?Loc:PalletEtiketPrinter:Prompt),TRN
                           ENTRY(@s198),AT(88,18,222,10),USE(Loc:PalletEtiketPrinter)
                           PROMPT('CMR-Printer (Receptie):'),AT(4,32),USE(?PROMPT1),TRN
                           ENTRY(@s255),AT(88,32,180),USE(LOC:CMRPrinter)
                           PROMPT('Kopie:'),AT(272,34),USE(?Loc:CRMKopie:Prompt),TRN
                           SPIN(@n1),AT(297,32,14,10),USE(Loc:CRMKopie)
                           PROMPT('CMR-Printer (Vrieshuis):'),AT(4,48),USE(?LOC:CMRVriesPrinter:Prompt),TRN
                           ENTRY(@s198),AT(88,48,180,10),USE(LOC:CMRVriesPrinter)
                           PROMPT('Kopie:'),AT(273,48),USE(?Loc:CRMVriesKopie:Prompt),TRN
                           SPIN(@n1),AT(297,48,14,10),USE(Loc:CRMVriesKopie)
                           PROMPT('Magazijn-Printer:'),AT(4,62),USE(?PROMPT2),TRN
                           ENTRY(@s255),AT(88,62,222,10),USE(LOC:MagazijnPrinter)
                           PROMPT('Lade:'),AT(315,62),USE(?Loc:CRMVriesLade:Prompt),HIDE,TRN
                           LIST,AT(337,60,72,10),USE(Loc:CRMVriesLade),DROP(5),FROM('Upper|#1|Lower|#2|Middle|#3|Manual|#4'), |
  HIDE
                           STRING('Weeglijst-Printer:'),AT(4,76),USE(?STRING8),TRN
                           ENTRY(@s255),AT(88,76,222,10),USE(LOC:WeeglijstPrinter)
                           STRING('Palletbladen-Printer:'),AT(4,88),USE(?STRING10),TRN
                           ENTRY(@s255),AT(88,90,222,10),USE(LOC:PalletbladPrinter)
                           PROMPT('Standaard palletblad-logo:'),AT(312,88),USE(?LOC:DefaultPalletbladLogo:Prompt),TRN
                           ENTRY(@s255),AT(392,90,98,10),USE(LOC:DefaultPalletbladLogo)
                           BUTTON('...'),AT(492,88,12,12),USE(?LookupFile)
                           PROMPT('SSCC / NVE prefix (palletbladen):'),AT(4,104),USE(?LOC:CountryCompanySSCCNVE:Prompt),TRN
                           ENTRY(@n09),AT(128,104,40,10),USE(LOC:CountryCompanySSCCNVE),LEFT(1)
                           STRING('Country code (NL: 870 - 879)  + Company code (bv. 123456)'),AT(174,104,182,11),USE(?STRING11),TRN
                           PROMPT('Beeldverhouding 1:3.333'),AT(383,118),USE(?LOC:DefaultPalletbladLogo:Prompt:2),FONT(, |
  ,,FONT:regular+FONT:italic),TRN
                           PROMPT('Dymo Printer:'),AT(4,120),USE(?LOC:DymoPrinter:Prompt),TRN
                           ENTRY(@s199),AT(88,120,222,10),USE(LOC:DymoPrinter)
                           PROMPT('Excel macro file:'),AT(4,136),USE(?Loc:ExcelMacroDirectory:Prompt),TRN
                           ENTRY(@s255),AT(88,136,222,10),USE(Loc:ExcelMacroDirectory)
                           STRING('De benodigde macro die print op 1 x 1 pagina moet ''PrintOpPagina'' heten.'),AT(87, |
  150),USE(?STRING1),TRN
                           PROMPT('Excel page break (rij):'),AT(4,162),USE(?LOC:ExcelPageBreak:Prompt),TRN
                           SPIN(@n_10),AT(88,162,60,10),USE(LOC:ExcelPageBreak),RIGHT(1)
                           PROMPT('Label Lengte (mm):'),AT(4,176),USE(?LOC:LabelLength:Prompt),RIGHT,TRN
                           ENTRY(@n_10),AT(88,176,60,10),USE(LOC:LabelLength),RIGHT(1)
                           STRING('Positionering ZPL-code:'),AT(4,204,76,12),USE(?STRING2),TRN
                           ENTRY(@s50),AT(88,204,206),USE(LOC:LabelPositieZPL)
                           STRING('bijv. ^FO100,120^AFR,560,200^FD'),AT(299,204),USE(?STRING3),TRN
                           STRING('^FO dots rechts, dots omloog (let op bij R=omhoog, Links)'),AT(299,214),USE(?STRING4),TRN
                           STRING('^AFR,Font heigt,font width (Select font F, R= clockwise 90%)'),AT(299,226,182,10), |
  USE(?STRING4:2),TRN
                           STRING('^FD Einde regel'),AT(299,240),USE(?STRING5),TRN
                           PROMPT('COM-port koord:'),AT(4,234),USE(?LOC:PortKoord:Prompt),TRN
                           ENTRY(@s50),AT(88,232,206,12),USE(LOC:PortKoord)
                           PROMPT('COM-port weegschaal'),AT(4,248),USE(?LOC:PortWeeg:Prompt),TRN
                           ENTRY(@s50),AT(88,246,206,12),USE(LOC:PortWeeg)
                           STRING('bv. ''Com1:9600,n,8,1'''),AT(307,248),USE(?STRING6),TRN
                           STRING('ComX:baudrate (300/1200/2400/4800/9600/19200/38400/57600/115200),parity (n/e/o)' & |
  ', databits (7/8), stopbits(1/2)'),AT(4,260),USE(?STRING7),TRN
                           CHECK('Nieuwe Weegschaal (COM-port zetten op (Com1: 2400,e,7,1)'),AT(89,272),USE(LOC:NieuweWeegschaal), |
  VALUE('1','0'),TRN
                           PROMPT('Aantal weegpogingen:'),AT(4,283),USE(?Loc:AantalPogingen:Prompt),TRN
                           SPIN(@n4),AT(89,283,40,10),USE(Loc:AantalPogingen),RIGHT(1)
                           PROMPT('Aantal Zeros:'),AT(5,298),USE(?Loc:AantalZeros:Prompt),TRN
                           SPIN(@n_4),AT(89,298,40,10),USE(Loc:AantalZeros),RIGHT(1)
                           PROMPT('Lengte Output String:'),AT(5,312),USE(?Loc:LengteOutputString:Prompt),TRN
                           SPIN(@n_4),AT(89,314,40,10),USE(Loc:LengteOutputString,,?Loc:LengteOutputString:2),RIGHT(1)
                           PROMPT('Export Bestand Orders:'),AT(5,341),USE(?Loc:ExportDirectory:Prompt),TRN
                           PROMPT('Timer Weeg Window:'),AT(5,328),USE(?Loc:TimerWeegWindow:Prompt),TRN
                           SPIN(@n_4),AT(89,327,40,10),USE(Loc:TimerWeegWindow),RIGHT(1)
                           ENTRY(@s254),AT(89,341,280,10),USE(Loc:ExportBestand)
                           BUTTON('...'),AT(372,340,12,12),USE(?LookupFile:2)
                           STRING('(0 = Lengte niet gebruiken, 10 = Aanbevolen waarde voor de Armad Gebruik maken ' & |
  'van Pointer en Length)'),AT(148,314),USE(?STRING9),TRN
                           STRING('1/100 seconde, stond op 10'),AT(148,328),USE(?STRING13),TRN
                         END
                         TAB('&3) Timer'),USE(?TAB3)
                           PROMPT('Timer Inkoop:'),AT(28,42),USE(?Loc:TimerInkoop:Prompt),TRN
                           ENTRY(@n-14),AT(104,42,60,10),USE(Loc:TimerInkoop),RIGHT(1)
                           PROMPT('Timer Verkoop:'),AT(28,68),USE(?Loc:TimerVerkoop:Prompt),TRN
                           ENTRY(@n-14),AT(104,68,60,10),USE(Loc:TimerVerkoop),RIGHT(1)
                           PROMPT('Timer Planning:'),AT(28,90),USE(?Loc:TimerPlanning:Prompt),TRN
                           ENTRY(@n-14),AT(104,90,60,10),USE(Loc:TimerPlanning),RIGHT(1)
                           PROMPT('Timer Voorraad:'),AT(28,110),USE(?Loc:TimerVoorraad:Prompt),TRN
                           ENTRY(@n-14),AT(104,110,60,10),USE(Loc:TimerVoorraad),RIGHT(1)
                           PROMPT('Timer Partij:'),AT(28,140),USE(?Loc:TimerPartij:Prompt),TRN
                           ENTRY(@n-14),AT(104,140,60,10),USE(Loc:TimerPartij),RIGHT(1)
                         END
                         TAB('&4) AutoNet'),USE(?TAB4)
                           PROMPT('Local Path:'),AT(10,30),USE(?Loc:LocalPath:Prompt),TRN
                           ENTRY(@s255),AT(96,30,174,10),USE(Loc:LocalPath)
                           PROMPT('Net Path:'),AT(10,42),USE(?Loc:NetPath:Prompt),TRN
                           ENTRY(@s255),AT(96,42,174,10),USE(Loc:NetPath)
                           PROMPT('Programma Titel:'),AT(12,54),USE(?Loc:Titel:Prompt),TRN
                           ENTRY(@s100),AT(96,54,174,10),USE(Loc:Titel)
                           BUTTON('Achtergrondkleur'),AT(280,50),USE(?AchtergrondKleur)
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
TakeEvent              PROCEDURE(),BYTE,PROC,DERIVED
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
FileLookup5          SelectFileClass
FileLookup6          SelectFileClass
FileLookup7          SelectFileClass
FileLookup8          SelectFileClass

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
        udpt.Init(UD,'WindowSysteemgegevens','Voorraad005.clw','Voorraad.EXE','07/14/2023 @ 04:03PM')    
             
  GlobalErrors.SetProcedureName('WindowSysteemgegevens')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Close
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  IF SELF.Request = SelectRecord
     SELF.AddItem(?Close,RequestCancelled)                 ! Add the close control to the window manger
  ELSE
     SELF.AddItem(?Close,RequestCompleted)                 ! Add the close control to the window manger
  END
  Loc:PalletEtiketPrinter=GETINI('Printer','PalletEtiket',,PQ:IniFile)
  LOC:CMRPrinter=GETINI('Printer','CMR',,PQ:IniFile)
  Loc:CRMKopie=GETINI('Printer','CMR Kopie',1,PQ:IniFile)
  LOC:CMRVriesPrinter=GETINI('Printer','CMR-Vrieshuis',,PQ:IniFile)
  Loc:CRMVriesLade=GETINI('Printer','CMR-Vrieshuis Lade',,PQ:IniFile)
  Loc:CRMVriesKopie=GETINI('Printer','CMR-Vrieshuis Kopie',1,PQ:IniFile)
  LOC:DymoPrinter=GETINI('Printer','DymoPrinter',,PQ:IniFile)
  Loc:ExcelMacroDirectory=GETINI('Excel', 'MacroXLS',,PQ:IniFile)
  LOC:MagazijnPrinter=GETINI('Printer','Magazijn',,PQ:IniFile)
  LOC:WeeglijstPrinter=GETINI('Printer','Weeglijst',,PQ:IniFile)
  LOC:PalletbladPrinter=GETINI('Printer','Palletblad',,PQ:IniFile)
  
  LOC:ExcelPageBreak=GETINI('Excel', 'PageBreak',60, PQ:IniFile)
  LOC:LabelLength=GETINI('Printer','LabelLength',104, PQ:IniFile)
  LOC:LabelPositieZPL=GETINI('Printer','LabelPositieZPL','^FO100,120^AFR,560,200^FD',PQ:IniFile)
  LOC:PortKoord=GETINI('Weeg','PortKoord',,PQ:IniFile)
  LOC:PortWeeg=GETINI('Weeg','PortWeeg',,PQ:IniFile)
  LOC:NieuweWeegschaal=GETINI('Weeg','NieuweWeegschaal',0,PQ:IniFile)
  Loc:AantalPogingen = GETINI('Weeg','AantalPogingen',5,PQ:IniFile)
  Loc:AantalZeros = GETINI('Weeg','AantalZeros',0,PQ:IniFile)
  Loc:LengteOutputString = GETINI('Weeg','LengteOutputString',0,PQ:IniFile)
  
  LOC:PartijRoodkleurenNaDagen = GETINI('Voorraad','PartijRoodkleurenNaDagen',180,PQ:IniFile)
  LOC:StandaardPalletverloopPeriode=GETINI('Voorraad','StandaardPalletverloopPeriode',60,PQ:IniFile)
  LOC:StandaardVoorraadverloopPeriode=GETINI('Voorraad','StandaardVoorraadverloopPeriode',60,PQ:IniFile)
  
  LOC:DefaultPalletbladLogo = GETINI('Palletblad','StandaardLogo','',PQ:IniFile)
  LOC:CountryCompanySSCCNVE = GETINI('Palletblad','CountryCompanyPrefix','870123456',PQ:IniFile)
  
  GLO:HidePlanningInstructie = GETINI('Voorraad','HidePlanningInstructie',0,PQ:IniFile)
  
  Loc:ExportBestand= GETINI('Exact','ExportBestand','',PQ:IniFile)
  Loc:ExportBestandInvoice = GETINI('Exact','ExportBestandInvoice','',PQ:IniFile)
  Loc:ExportBestandPurchaseOrder= GETINI('Exact','ExportBestandPurchaseOrder','',PQ:IniFile)
  
  Loc:GewichtDoos= GETINI('ProForma','Loc:GewichtDoos',0.3,PQ:IniFile)
  Loc:GewichtPallet= GETINI('ProForma','Loc:GewichtPallet',20,PQ:IniFile)
  
  Loc:LocalPath= GETINI('AutoNet','LocalPath',,PQ:IniFile)
  Loc:NetPath= GETINI('AutoNet','NetPath',,PQ:IniFile)
  
  !Loc:Titel=GETINI('SYSTEEM','Titel','JMD Voorraad',PQ:IniFile)
  !Loc:BackgroundColor=GETINI('SYSTEEM','Achtergond',Color:None,PQ:IniFile)
  Loc:Titel=PQ:Titel
  Loc:BackgroundColor=PQ:Achtergrond
  ?AchtergrondKleur{PROP:Background}=Loc:BackgroundColor
  
  Loc:KwalitetKnopVerbergen=GETINI('SYSTEEM','KwaliteitKnopVerbergen',True,PQ:IniFile)
  Loc:StandaardEenheid=GETINI('SYSTEEM','StandaardEenheid','KG',PQ:IniFile)
  
  
  Loc:TimerInkoop = GETINI('TIMER','Inkoop',100,PQ:IniFile)
  Loc:TimerVerkoop = GETINI('TIMER','Verkoop',100,PQ:IniFile)
  Loc:TimerPlanning = GETINI('TIMER','Planning',100,PQ:IniFile)
  Loc:TimerVoorraad = GETINI('TIMER','Voorraad',100,PQ:IniFile)
  Loc:TimerPartij = GETINI('TIMER','Partij',100,PQ:IniFile)
  
  Loc:TimerWeegWindow = GETINI('TIMER','WeegWindow',10,PQ:IniFile)
  SELF.Open(Window)                                        ! Open window
  Do DefineListboxStyle
  Alert(AltKeyPressed)  ! WinEvent : These keys cause a program to crash on Windows 7 and Windows 10.
  Alert(F10Key)         !
  Alert(CtrlF10)        !
  Alert(ShiftF10)       !
  Alert(CtrlShiftF10)   !
  Alert(AltSpace)       !
  WinAlertMouseZoom()
  WinAlert(WE::WM_QueryEndSession,,Return1+PostUser)
  Window{Prop:Alrt,255} = CtrlShiftP
  INIMgr.Fetch('WindowSysteemgegevens',Window)             ! Restore window settings from non-volatile store
  FileLookup5.Init
  FileLookup5.ClearOnCancel = True
  FileLookup5.Flags=BOR(FileLookup5.Flags,FILE:LongName)   ! Allow long filenames
  FileLookup5.SetMask('All Files','*.*')                   ! Set the file mask
  FileLookup6.Init
  FileLookup6.ClearOnCancel = True
  FileLookup6.Flags=BOR(FileLookup6.Flags,FILE:LongName)   ! Allow long filenames
  FileLookup6.Flags=BOR(FileLookup6.Flags,FILE:Save)       ! Allow save Dialog
  FileLookup6.SetMask('XML','*.XML')                       ! Set the file mask
  FileLookup6.WindowTitle='Kies de Map voor de Exact export'
  FileLookup7.Init
  FileLookup7.ClearOnCancel = True
  FileLookup7.Flags=BOR(FileLookup7.Flags,FILE:LongName)   ! Allow long filenames
  FileLookup7.Flags=BOR(FileLookup7.Flags,FILE:Save)       ! Allow save Dialog
  FileLookup7.SetMask('All Files','*.*')                   ! Set the file mask
  FileLookup8.Init
  FileLookup8.ClearOnCancel = True
  FileLookup8.Flags=BOR(FileLookup8.Flags,FILE:LongName)   ! Allow long filenames
  FileLookup8.Flags=BOR(FileLookup8.Flags,FILE:Save)       ! Allow save Dialog
  FileLookup8.SetMask('All Files','*.*')                   ! Set the file mask
  SELF.SetAlerts()
  EnterByTabManager.ExcludeControl(?Cancel)
  EnterByTabManager.Init(False)
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  If self.opened Then WinAlert().
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.Opened
    INIMgr.Update('WindowSysteemgegevens',Window)          ! Save window data to non-volatile store
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
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?Close
      ThisWindow.Update()
      PUTINI('Printer','PalletEtiket',Loc:PalletEtiketPrinter,PQ:IniFile)
      PUTINI('Printer','CMR',Loc:CMRPrinter,PQ:IniFile)
      PUTINI('Printer','CMR Kopie',Loc:CRMKopie,PQ:IniFile)
      PUTINI('Printer','CMR-Vrieshuis',LOC:CMRVriesPrinter,PQ:IniFile)
      PUTINI('Printer','CMR-Vrieshuis Lade',Loc:CRMVriesLade,PQ:IniFile)
      PUTINI('Printer','CMR-Vrieshuis Kopie',Loc:CRMVriesKopie,PQ:IniFile)
      
      PUTINI('Printer','DymoPrinter',LOC:DymoPrinter,PQ:IniFile)
      PUTINI('Printer','Magazijn',Loc:MagazijnPrinter,PQ:IniFile)
      PUTINI('Printer','Weeglijst',Loc:WeeglijstPrinter,PQ:IniFile)
      PUTINI('Printer','Palletblad',LOC:PalletbladPrinter,PQ:IniFile)
      PUTINI('Printer','LabelLength', LOC:LabelLength, PQ:IniFile)
      PUTINI('Printer','LabelPositieZPL',LOC:LabelPositieZPL,PQ:IniFile)
      PUTINI('Excel', 'MacroXLS', Loc:ExcelMacroDirectory,PQ:IniFile)
      PUTINI('Excel', 'PageBreak', Loc:ExcelPageBreak,PQ:IniFile)
      PUTINI('Weeg','PortKoord', LOC:PortKoord,PQ:IniFile)
      PUTINI('Weeg','PortWeeg',LOC:PortWeeg,PQ:IniFile)
      PUTINI('Weeg','NieuweWeegschaal',LOC:NieuweWeegschaal,PQ:IniFile)
      PUTINI('Weeg','AantalPogingen',Loc:AantalPogingen,PQ:IniFile)
      PUTINI('Weeg','AantalZeros',Loc:AantalZeros,PQ:IniFile)
      PUTINI('Weeg','LengteOutputString',Loc:LengteOutputString,PQ:IniFile)
      
      PUTINI('Voorraad','PartijRoodkleurenNaDagen',LOC:PartijRoodkleurenNaDagen,PQ:IniFile)
      PUTINI('Voorraad','StandaardPalletverloopPeriode',LOC:StandaardPalletverloopPeriode,PQ:IniFile)
      PUTINI('Voorraad','StandaardVoorraadverloopPeriode',LOC:StandaardVoorraadverloopPeriode,PQ:IniFile)
      
      PUTINI('Palletblad','StandaardLogo',LOC:DefaultPalletbladLogo,PQ:IniFile)
      PUTINI('Palletblad','CountryCompanyPrefix',LOC:CountryCompanySSCCNVE,PQ:IniFile)
      
      PUTINI('Voorraad','HidePlanningInstructie',GLO:HidePlanningInstructie,PQ:IniFile)
      PUTINI('Exact','ExportBestand',Loc:ExportBestand,PQ:IniFile)
      PUTINI('Exact','ExportBestandInvoice',Loc:ExportBestandInvoice ,PQ:IniFile)
      PUTINI('Exact','ExportBestandPurchaseOrder',Loc:ExportBestandPurchaseOrder,PQ:IniFile)
      
      PUTINI('ProForma','Loc:GewichtDoos',Loc:GewichtDoos,PQ:IniFile)
      PUTINI('ProForma','Loc:GewichtPallet',Loc:GewichtPallet,PQ:IniFile)
      
      PUTINI('AutoNet','LocalPath',Loc:LocalPath,PQ:IniFile)
      PUTINI('AutoNet','NetPath',Loc:NetPath,PQ:IniFile)
      IF PQ:PartnerID=1
          PUTINI('SYSTEEM','Titel',Loc:Titel,PQ:IniFile)
          PUTINI('SYSTEEM','Achtergond',Loc:BackgroundColor,PQ:IniFile)
      ELSE
          PUTINI('SYSTEEM','TitelEI',Loc:Titel,PQ:IniFile)
          PUTINI('SYSTEEM','AchtergondEI',Loc:BackgroundColor,PQ:IniFile)
      END
      
      PUTINI('SYSTEEM','KwaliteitKnopVerbergen',Loc:KwalitetKnopVerbergen,PQ:IniFile)
      PUTINI('SYSTEEM','StandaardEenheid',Loc:StandaardEenheid,PQ:IniFile)
      
      PUTINI('TIMER','Inkoop',Loc:TimerInkoop,PQ:IniFile)
      PUTINI('TIMER','Verkoop',Loc:TimerVerkoop ,PQ:IniFile)
      PUTINI('TIMER','Planning',Loc:TimerPlanning ,PQ:IniFile)
      PUTINI('TIMER','Voorraad',Loc:TimerVoorraad ,PQ:IniFile)
      PUTINI('TIMER','Partij',Loc:TimerPartij ,PQ:IniFile)
      
      PUTINI('TIMER','WeegWindow',Loc:TimerWeegWindow ,PQ:IniFile)
      
    OF ?LookupFile:3
      ThisWindow.Update()
      Loc:ExportBestandInvoice = FileLookup7.Ask(1)
      DISPLAY
    OF ?LookupFile:4
      ThisWindow.Update()
      Loc:ExportBestandPurchaseOrder = FileLookup8.Ask(1)
      DISPLAY
    OF ?LookupFile
      ThisWindow.Update()
      LOC:DefaultPalletbladLogo = FileLookup5.Ask(0)
      DISPLAY
    OF ?LookupFile:2
      ThisWindow.Update()
      Loc:ExportBestand = FileLookup6.Ask(1)
      DISPLAY
    OF ?AchtergrondKleur
      ThisWindow.Update()
      IF COLORDIALOG('Kies achtergrond kleur',Loc:BackgroundColor)
          ?AchtergrondKleur{PROP:Background}=Loc:BackgroundColor
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
        UD.ShowProcedureInfo('WindowSysteemgegevens',UD.SetApplicationName('Voorraad','EXE'),Window{PROP:Hlp},'10/01/2009 @ 11:26AM','07/14/2023 @ 04:03PM','10/11/2024 @ 01:55PM')  
    
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

