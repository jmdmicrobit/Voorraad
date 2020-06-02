

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
LocEnableEnterByTab  BYTE(1)                               !Used by the ENTER Instead of Tab template
EnterByTabManager    EnterByTabClass
Window               WINDOW('Systeemgegevens'),AT(,,508,393),FONT('Microsoft Sans Serif',10,,,CHARSET:DEFAULT), |
  GRAY
                       PROMPT('Pallet Etiket Printer:'),AT(4,1),USE(?Loc:PalletEtiketPrinter:Prompt)
                       ENTRY(@s198),AT(88,1,222,10),USE(Loc:PalletEtiketPrinter)
                       STRING('De benodigde macro die print op 1 x 1 pagina moet ''PrintOpPagina'' heten.'),AT(87, |
  131),USE(?STRING1)
                       PROMPT('CMR-Printer (Receptie):'),AT(4,14),USE(?PROMPT1)
                       ENTRY(@s255),AT(88,14,180),USE(LOC:CMRPrinter)
                       PROMPT('Kopie:'),AT(272,15),USE(?Loc:CRMKopie:Prompt)
                       SPIN(@n1),AT(297,14,14,10),USE(Loc:CRMKopie)
                       PROMPT('Magazijn-Printer:'),AT(4,44),USE(?PROMPT2)
                       ENTRY(@s255),AT(88,44,222,10),USE(LOC:MagazijnPrinter)
                       PROMPT('CMR-Printer (Vrieshuis):'),AT(4,30),USE(?LOC:CMRVriesPrinter:Prompt)
                       PROMPT('Kopie:'),AT(273,30),USE(?Loc:CRMVriesKopie:Prompt)
                       ENTRY(@s198),AT(88,29,180,10),USE(LOC:CMRVriesPrinter)
                       PROMPT('Excel page break (rij):'),AT(4,144),USE(?LOC:ExcelPageBreak:Prompt)
                       SPIN(@n_10),AT(88,144,60,10),USE(LOC:ExcelPageBreak),RIGHT(1)
                       SPIN(@n1),AT(297,30,14,10),USE(Loc:CRMVriesKopie)
                       PROMPT('Label Lengte (mm):'),AT(4,158),USE(?LOC:LabelLength:Prompt),RIGHT
                       ENTRY(@n_10),AT(88,158,60,10),USE(LOC:LabelLength),RIGHT(1)
                       STRING('Positionering ZPL-code:'),AT(4,186,76,12),USE(?STRING2)
                       ENTRY(@s50),AT(88,186,206),USE(LOC:LabelPositieZPL)
                       STRING('bijv. ^FO100,120^AFR,560,200^FD'),AT(299,185),USE(?STRING3)
                       STRING('^FO dots rechts, dots omloog (let op bij R=omhoog, Links)'),AT(299,195),USE(?STRING4)
                       STRING('^AFR,Font heigt,font width (Select font F, R= clockwise 90%)'),AT(299,207,182,10), |
  USE(?STRING4:2)
                       STRING('^FD Einde regel'),AT(299,221),USE(?STRING5)
                       PROMPT('COM-port koord:'),AT(4,216),USE(?LOC:PortKoord:Prompt)
                       ENTRY(@s50),AT(88,214,206,12),USE(LOC:PortKoord)
                       PROMPT('COM-port weegschaal'),AT(4,230),USE(?LOC:PortWeeg:Prompt)
                       ENTRY(@s50),AT(88,228,206,12),USE(LOC:PortWeeg)
                       STRING('bv. ''Com1:9600,n,8,1'''),AT(307,230),USE(?STRING6)
                       STRING('ComX:baudrate (300/1200/2400/4800/9600/19200/38400/57600/115200),parity (n/e/o)' & |
  ', databits (7/8), stopbits(1/2)'),AT(4,242),USE(?STRING7)
                       ENTRY(@s255),AT(88,57,222,10),USE(LOC:WeeglijstPrinter)
                       STRING('Weeglijst-Printer:'),AT(4,58),USE(?STRING8)
                       PROMPT('Dymo Printer:'),AT(4,102),USE(?LOC:DymoPrinter:Prompt)
                       ENTRY(@s199),AT(88,101,222,10),USE(LOC:DymoPrinter)
                       PROMPT('Excel macro file:'),AT(4,117),USE(?Loc:ExcelMacroDirectory:Prompt)
                       ENTRY(@s255),AT(88,117,222,10),USE(Loc:ExcelMacroDirectory)
                       PROMPT('Lade:'),AT(315,44),USE(?Loc:CRMVriesLade:Prompt),HIDE
                       LIST,AT(337,42,72,10),USE(Loc:CRMVriesLade),DROP(5),FROM('Upper|#1|Lower|#2|Middle|#3|Manual|#4'), |
  HIDE
                       CHECK('Nieuwe Weegschaal (COM-port zetten op (Com1: 2400,e,7,1)'),AT(89,253),USE(LOC:NieuweWeegschaal), |
  VALUE('1','0')
                       PROMPT('Standaard palletverloop periode:'),AT(172,144),USE(?PROMPT3)
                       PROMPT('Standaard voorraadverloop periode:'),AT(172,158),USE(?PROMPT4)
                       SPIN(@n_10),AT(290,158,60,10),USE(LOC:StandaardVoorraadverloopPeriode),RIGHT(1)
                       SPIN(@n_10),AT(290,144,60,10),USE(LOC:StandaardPalletverloopPeriode),RIGHT(1)
                       PROMPT('dagen'),AT(356,144,29,10),USE(?PROMPT5)
                       PROMPT('dagen'),AT(356,156,29,10),USE(?PROMPT5:2)
                       PROMPT('Partij (in partijvoorraad) rood na:'),AT(172,172),USE(?LOC:PartijRoodkleurenNaDagen:Prompt), |
  RIGHT
                       PROMPT('dagen'),AT(356,170),USE(?PROMPT6)
                       SPIN(@n_10),AT(290,172,60,10),USE(LOC:PartijRoodkleurenNaDagen,,?LOC:PartijRoodkleurenNaDagen:2), |
  RIGHT(1)
                       STRING('Palletbladen-Printer:'),AT(4,70),USE(?STRING10)
                       ENTRY(@s255),AT(88,71,222,10),USE(LOC:PalletbladPrinter)
                       PROMPT('Standaard palletblad-logo:'),AT(312,70),USE(?LOC:DefaultPalletbladLogo:Prompt)
                       ENTRY(@s255),AT(392,71,98,10),USE(LOC:DefaultPalletbladLogo)
                       BUTTON('...'),AT(492,70,12,12),USE(?LookupFile)
                       PROMPT('Beeldverhouding 1:3.333'),AT(383,100),USE(?LOC:DefaultPalletbladLogo:Prompt:2),FONT(, |
  ,,FONT:regular+FONT:italic)
                       CHECK('Toon geen instructies'),AT(383,117),USE(GLO:HidePlanningInstructie),VALUE('1','0')
                       PROMPT('SSCC / NVE prefix (palletbladen):'),AT(4,86),USE(?LOC:CountryCompanySSCCNVE:Prompt)
                       ENTRY(@n09),AT(128,86,40,10),USE(LOC:CountryCompanySSCCNVE),LEFT(1)
                       STRING('Country code (NL: 870 - 879)  + Company code (bv. 123456)'),AT(174,86,182,11),USE(?STRING11)
                       PROMPT('Aantal weegpogingen:'),AT(4,264),USE(?Loc:AantalPogingen:Prompt)
                       SPIN(@n-14),AT(89,264,60,10),USE(Loc:AantalPogingen),RIGHT(1)
                       PROMPT('Export Bestand Orders:'),AT(4,276),USE(?Loc:ExportDirectory:Prompt)
                       ENTRY(@s254),AT(89,276,280,10),USE(Loc:ExportBestand)
                       BUTTON('...'),AT(374,276,12,12),USE(?LookupFile:2)
                       BUTTON('OK'),AT(418,373),USE(?Close)
                       BUTTON('Annuleren'),AT(454,373),USE(?Cancel)
                       PROMPT('Export Bestand Invoice:'),AT(4,289),USE(?Loc:ExportBestandInvoice:Prompt)
                       ENTRY(@s254),AT(89,289,280,10),USE(Loc:ExportBestandInvoice)
                       BUTTON('...'),AT(374,288,12,12),USE(?LookupFile:3)
                       PROMPT('Exp. Best. Purchase Order:'),AT(4,302),USE(?Loc:ExportBestandPurchaseOrder:Prompt)
                       ENTRY(@s254),AT(89,302,280,10),USE(Loc:ExportBestandPurchaseOrder)
                       BUTTON('...'),AT(376,301,12,12),USE(?LookupFile:4)
                       PROMPT('Gewicht Doos:'),AT(4,314),USE(?Loc:GewichtDoos:Prompt)
                       ENTRY(@n-10`3),AT(89,313,60,10),USE(Loc:GewichtDoos),RIGHT(2)
                       PROMPT('Gewicht Pallet:'),AT(180,316),USE(?Loc:GewichtPallet:Prompt)
                       ENTRY(@n-10`3),AT(266,316,60,10),USE(Loc:GewichtPallet),RIGHT(2)
                       STRING('kg'),AT(152,314),USE(?STRING12)
                       STRING('kg'),AT(328,316,8,10),USE(?STRING12:2)
                       PROMPT('Local Path:'),AT(4,326),USE(?Loc:LocalPath:Prompt)
                       ENTRY(@s255),AT(89,326,174,10),USE(Loc:LocalPath)
                       PROMPT('Net Path:'),AT(4,338),USE(?Loc:NetPath:Prompt)
                       ENTRY(@s255),AT(89,338,174,10),USE(Loc:NetPath)
                       PROMPT('Programma Titel:'),AT(5,350),USE(?Loc:Titel:Prompt)
                       ENTRY(@s100),AT(89,350,174,10),USE(Loc:Titel)
                       BUTTON('Achtergrondkleur'),AT(273,346),USE(?AchtergrondKleur)
                       CHECK('Kwaliteit Knop verbergen:'),AT(89,363),USE(Loc:KwalitetKnopVerbergen)
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
        udpt.Init(UD,'WindowSysteemgegevens','Voorraad005.clw','Voorraad.EXE','01/31/2020 @ 01:27PM')    
             
  GlobalErrors.SetProcedureName('WindowSysteemgegevens')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Loc:PalletEtiketPrinter:Prompt
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  IF SELF.Request = SelectRecord
     SELF.AddItem(?Close,RequestCancelled)                 ! Add the close control to the window manger
  ELSE
     SELF.AddItem(?Close,RequestCompleted)                 ! Add the close control to the window manger
  END
  Loc:PalletEtiketPrinter=GETINI('Printer','PalletEtiket',,'.\Voorraad.ini')
  LOC:CMRPrinter=GETINI('Printer','CMR',,'.\Voorraad.ini')
  Loc:CRMKopie=GETINI('Printer','CMR Kopie',1,'.\Voorraad.ini')
  LOC:CMRVriesPrinter=GETINI('Printer','CMR-Vrieshuis',,'.\Voorraad.ini')
  Loc:CRMVriesLade=GETINI('Printer','CMR-Vrieshuis Lade',,'.\Voorraad.ini')
  Loc:CRMVriesKopie=GETINI('Printer','CMR-Vrieshuis Kopie',1,'.\Voorraad.ini')
  LOC:DymoPrinter=GETINI('Printer','DymoPrinter',,'.\Voorraad.ini')
  Loc:ExcelMacroDirectory=GETINI('Excel', 'MacroXLS',,'.\Voorraad.ini')
  LOC:MagazijnPrinter=GETINI('Printer','Magazijn',,'.\Voorraad.ini')
  LOC:WeeglijstPrinter=GETINI('Printer','Weeglijst',,'.\Voorraad.ini')
  LOC:PalletbladPrinter=GETINI('Printer','Palletblad',,'.\Voorraad.ini')
  
  LOC:ExcelPageBreak=GETINI('Excel', 'PageBreak',60, '.\Voorraad.ini')
  LOC:LabelLength=GETINI('Printer','LabelLength',104, '.\Voorraad.ini')
  LOC:LabelPositieZPL=GETINI('Printer','LabelPositieZPL','^FO100,120^AFR,560,200^FD','.\Voorraad.ini')
  LOC:PortKoord=GETINI('Weeg','PortKoord',,'.\Voorraad.ini')
  LOC:PortWeeg=GETINI('Weeg','PortWeeg',,'.\Voorraad.ini')
  LOC:NieuweWeegschaal=GETINI('Weeg','NieuweWeegschaal',0,'.\Voorraad.ini')
  Loc:AantalPogingen = GETINI('Weeg','AantalPogingen',5,'.\Voorraad.ini')
  
  LOC:PartijRoodkleurenNaDagen = GETINI('Voorraad','PartijRoodkleurenNaDagen',180,'.\Voorraad.ini')
  LOC:StandaardPalletverloopPeriode=GETINI('Voorraad','StandaardPalletverloopPeriode',60,'.\Voorraad.ini')
  LOC:StandaardVoorraadverloopPeriode=GETINI('Voorraad','StandaardVoorraadverloopPeriode',60,'.\Voorraad.ini')
  
  LOC:DefaultPalletbladLogo = GETINI('Palletblad','StandaardLogo','','.\Voorraad.ini')
  LOC:CountryCompanySSCCNVE = GETINI('Palletblad','CountryCompanyPrefix','870123456','.\Voorraad.ini')
  
  GLO:HidePlanningInstructie = GETINI('Voorraad','HidePlanningInstructie',0,'.\Voorraad.ini')
  
  Loc:ExportBestand= GETINI('Exact','ExportBestand','','.\Voorraad.ini')
  Loc:ExportBestandInvoice = GETINI('Exact','ExportBestandInvoice','','.\Voorraad.ini')
  Loc:ExportBestandPurchaseOrder= GETINI('Exact','ExportBestandPurchaseOrder','','.\Voorraad.ini')
  
  Loc:GewichtDoos= GETINI('ProForma','Loc:GewichtDoos',0.3,'.\Voorraad.ini')
  Loc:GewichtPallet= GETINI('ProForma','Loc:GewichtPallet',20,'.\Voorraad.ini')
  
  Loc:LocalPath= GETINI('AutoNet','LocalPath',,'.\Voorraad.ini')
  Loc:NetPath= GETINI('AutoNet','NetPath',,'.\Voorraad.ini')
  
  Loc:Titel=GETINI('SYSTEEM','Titel','JMD Voorraad','.\Voorraad.ini')
  Loc:BackgroundColor=GETINI('SYSTEEM','Achtergond',Color:None,'.\Voorraad.ini')
  ?AchtergrondKleur{PROP:Background}=Loc:BackgroundColor
  
  Loc:KwalitetKnopVerbergen=GETINI('SYSTEEM','KwaliteitKnopVerbergen',True,'.\Voorraad.ini')
  SELF.Open(Window)                                        ! Open window
  WinAlertMouseZoom()
  Do DefineListboxStyle
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
    OF ?LookupFile
      ThisWindow.Update()
      LOC:DefaultPalletbladLogo = FileLookup5.Ask(0)
      DISPLAY
    OF ?LookupFile:2
      ThisWindow.Update()
      Loc:ExportBestand = FileLookup6.Ask(1)
      DISPLAY
    OF ?Close
      ThisWindow.Update()
      PUTINI('Printer','PalletEtiket',Loc:PalletEtiketPrinter,'.\Voorraad.ini')
      PUTINI('Printer','CMR',Loc:CMRPrinter,'.\Voorraad.ini')
      PUTINI('Printer','CMR Kopie',Loc:CRMKopie,'.\Voorraad.ini')
      PUTINI('Printer','CMR-Vrieshuis',LOC:CMRVriesPrinter,'.\Voorraad.ini')
      PUTINI('Printer','CMR-Vrieshuis Lade',Loc:CRMVriesLade,'.\Voorraad.ini')
      PUTINI('Printer','CMR-Vrieshuis Kopie',Loc:CRMVriesKopie,'.\Voorraad.ini')
      
      PUTINI('Printer','DymoPrinter',LOC:DymoPrinter,'.\Voorraad.ini')
      PUTINI('Printer','Magazijn',Loc:MagazijnPrinter,'.\Voorraad.ini')
      PUTINI('Printer','Weeglijst',Loc:WeeglijstPrinter,'.\Voorraad.ini')
      PUTINI('Printer','Palletblad',LOC:PalletbladPrinter,'.\Voorraad.ini')
      PUTINI('Printer','LabelLength', LOC:LabelLength, '.\Voorraad.ini')
      PUTINI('Printer','LabelPositieZPL',LOC:LabelPositieZPL,'.\Voorraad.ini')
      PUTINI('Excel', 'MacroXLS', Loc:ExcelMacroDirectory,'.\Voorraad.ini')
      PUTINI('Excel', 'PageBreak', Loc:ExcelPageBreak,'.\Voorraad.ini')
      PUTINI('Weeg','PortKoord', LOC:PortKoord,'.\Voorraad.ini')
      PUTINI('Weeg','PortWeeg',LOC:PortWeeg,'.\Voorraad.ini')
      PUTINI('Weeg','NieuweWeegschaal',LOC:NieuweWeegschaal,'.\Voorraad.ini')
      PUTINI('Weeg','AantalPogingen',Loc:AantalPogingen,'.\Voorraad.ini')
      
      PUTINI('Voorraad','PartijRoodkleurenNaDagen',LOC:PartijRoodkleurenNaDagen,'.\Voorraad.ini')
      PUTINI('Voorraad','StandaardPalletverloopPeriode',LOC:StandaardPalletverloopPeriode,'.\Voorraad.ini')
      PUTINI('Voorraad','StandaardVoorraadverloopPeriode',LOC:StandaardVoorraadverloopPeriode,'.\Voorraad.ini')
      
      PUTINI('Palletblad','StandaardLogo',LOC:DefaultPalletbladLogo,'.\Voorraad.ini')
      PUTINI('Palletblad','CountryCompanyPrefix',LOC:CountryCompanySSCCNVE,'.\Voorraad.ini')
      
      PUTINI('Voorraad','HidePlanningInstructie',GLO:HidePlanningInstructie,'.\Voorraad.ini')
      PUTINI('Exact','ExportBestand',Loc:ExportBestand,'.\Voorraad.ini')
      PUTINI('Exact','ExportBestandInvoice',Loc:ExportBestandInvoice ,'.\Voorraad.ini')
      PUTINI('Exact','ExportBestandPurchaseOrder',Loc:ExportBestandPurchaseOrder,'.\Voorraad.ini')
      
      PUTINI('ProForma','Loc:GewichtDoos',Loc:GewichtDoos,'.\Voorraad.ini')
      PUTINI('ProForma','Loc:GewichtPallet',Loc:GewichtPallet,'.\Voorraad.ini')
      
      PUTINI('AutoNet','LocalPath',Loc:LocalPath,'.\Voorraad.ini')
      PUTINI('AutoNet','NetPath',Loc:NetPath,'.\Voorraad.ini')
      
      PUTINI('SYSTEEM','Titel',Loc:Titel,'.\Voorraad.ini')
      PUTINI('SYSTEEM','Achtergond',Loc:BackgroundColor,'.\Voorraad.ini')
      PUTINI('SYSTEEM','KwaliteitKnopVerbergen',Loc:KwalitetKnopVerbergen,'.\Voorraad.ini')
    OF ?LookupFile:3
      ThisWindow.Update()
      Loc:ExportBestandInvoice = FileLookup7.Ask(1)
      DISPLAY
    OF ?LookupFile:4
      ThisWindow.Update()
      Loc:ExportBestandPurchaseOrder = FileLookup8.Ask(1)
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
  if event() = event:VisibleOnDesktop
    ds_VisibleOnDesktop()
  end
     IF KEYCODE()=CtrlShiftP AND EVENT() = Event:PreAlertKey
       CYCLE
     END
     IF KEYCODE()=CtrlShiftP  
        UD.ShowProcedureInfo('WindowSysteemgegevens',UD.SetApplicationName('Voorraad','EXE'),Window{PROP:Hlp},'10/01/2009 @ 11:26AM','01/31/2020 @ 01:27PM','05/26/2020 @ 12:10PM')  
    
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

