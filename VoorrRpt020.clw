

   MEMBER('VoorrRpt.clw')                                  ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABPRPDF.INC'),ONCE
   INCLUDE('ABREPORT.INC'),ONCE
   INCLUDE('abrppsel.inc'),ONCE

                     MAP
                       INCLUDE('VOORRRPT020.INC'),ONCE        !Local module procedure declarations
                     END


!!! <summary>
!!! Generated from procedure template - Report
!!! </summary>
ReportPalletBladEnkel PROCEDURE (LONG PRM:WegingID,REAL PRM:NettoGewicht,BYTE PRM:Preview, BYTE PRM:AantalPrints)

udpt            UltimateDebugProcedureTracker
Progress:Thermometer BYTE                                  ! 
LOC:SSCCNVE00        STRING(30)                            ! 
LOC:DATE12           STRING(6)                             ! 
LOC:EBENR400         STRING(20)                            ! 
LOC:ISOCountries423  STRING(15)                            ! 
LOC:GTIN02           CSTRING(21)                           ! 
LOC:DATE11           STRING(6)                             ! 
LOC:ARTOMS           STRING(128)                           ! 
LOC:ARTNUM241        STRING(20)                            ! 
LOC:CHARGELOS10      STRING(10)                            ! 
LOC:DATE15           STRING(6)                             ! 
Loc:HarvarstDate     STRING(6)                             ! 
LOC:NETTOGEWICHT310  STRING(20)                            ! 
LOC:BARCODE1         STRING(100)                           ! 
LOC:BARCODE2         STRING(100)                           ! 
LOC:BARCODE3         STRING(100)                           ! 
LOC:TMPBARCODE       STRING(100)                           ! 
LOC:ENKEL            BYTE                                  ! 
SAV:Printer          STRING(255)                           ! 
LOC:Klantgegevens    STRING(512)                           ! 
LOC:AfzenderGegevens STRING(512)                           ! 
LOC:CountryCompanySSCCNVE STRING(9)                        ! 
SAV:Copies           BYTE                                  ! 
Loc:OriginLiveBird   CSTRING(51)                           ! 
Loc:OriginSlautherHouse CSTRING(51)                        ! 
Loc:OriginProcessing CSTRING(51)                           ! 
Loc:OriginPacking    CSTRING(51)                           ! 
Process:View         VIEW(Versie)
                       PROJECT(VRS:Versie)
                     END
LocEnableEnterByTab  BYTE(1)                               !Used by the ENTER Instead of Tab template
EnterByTabManager    EnterByTabClass
ProgressWindow       WINDOW('Voortgang Palletblad...'),AT(,,142,63),DOUBLE,CENTER,GRAY,TIMER(1)
                       PROGRESS,AT(15,15,111,12),USE(Progress:Thermometer),RANGE(0,100)
                       STRING(''),AT(0,3,141,10),USE(?Progress:UserString),CENTER
                       STRING(''),AT(0,30,141,10),USE(?Progress:PctText),CENTER
                       BUTTON('Cancel'),AT(45,42,50,15),USE(?Progress:Cancel)
                     END

Report               REPORT,AT(521,521,7219,10677),PRE(RPT),PAPER(PAPER:A4),FONT('Arial',10,,FONT:regular,CHARSET:ANSI), |
  THOUS
                       HEADER,AT(490,479,7250,115),USE(?Header)
                       END
Detail                 DETAIL,AT(0,500,7250,9760),USE(?Detail)
                         BOX,AT(42,0,7146,9656),USE(?BOX1),COLOR(COLOR:Black),LINEWIDTH(3)
                         IMAGE,AT(1469,73,3208,960),USE(?HeaderImage)
                         LINE,AT(62,1094,7115,0),USE(?LINE1),LINEWIDTH(3)
                         STRING(@s100),AT(135,1167,3344),USE(PBS:SSCC_NVE_00),FONT(,10,,FONT:bold),CENTER
                         STRING(@s30),AT(135,1479,3302,229),USE(LOC:SSCCNVE00),FONT(,16,,FONT:bold),CENTER
                         LINE,AT(62,1958,7115,0),USE(?LINE1:2),LINEWIDTH(3)
                         LINE,AT(73,2583,7115,0),USE(?LINE1:3),LINEWIDTH(3)
                         LINE,AT(62,3896,7115,0),USE(?LINE1:4),LINEWIDTH(3)
                         LINE,AT(62,5417,7115,0),USE(?LINE1:5),LINEWIDTH(3)
                         LINE,AT(3552,1083,0,4333),USE(?LINE2),LINEWIDTH(3)
                         STRING(@s100),AT(3635,1167,3490,229),USE(PBS:HarvastDate7007),FONT(,10,,FONT:bold),CENTER
                         STRING(@s6),AT(3635,1417,3469,396),USE(Loc:HarvarstDate),FONT(,24,,FONT:bold),CENTER
                         STRING(@s100),AT(3635,1990,3510,229),USE(PBS:ProductionDate_11),FONT(,10,,FONT:bold),CENTER
                         STRING(@s6),AT(3635,2187,3469,396),USE(LOC:DATE11),FONT(,24,,FONT:bold),CENTER
                         STRING(@s100),AT(135,1990,3323,229),USE(PBS:CustomerPurchaseOrderNumber_400),FONT(,10,,FONT:bold), |
  CENTER
                         STRING(@s20),AT(115,2187,3323,396),USE(LOC:EBENR400),FONT(,24,,FONT:bold),CENTER
                         STRING(@s100),AT(135,2635,3323,229),USE(PBS:ArtikelOms),FONT(,10,,FONT:bold),CENTER
                         STRING(@s100),AT(3635,2635,3490,229),USE(PBS:CustomerPartNumber_241),FONT(,10,,FONT:bold), |
  CENTER
                         STRING(@s20),AT(3635,3021,3470,396),USE(LOC:ARTNUM241),FONT(,24,,FONT:bold),CENTER
                         STRING(@s100),AT(1896,3917,1583,229),USE(PBS:SellByDate_15),FONT(,10,,FONT:bold),CENTER
                         STRING(@s6),AT(1896,4156,1583,396),USE(LOC:DATE15),FONT(,24,,FONT:bold),CENTER
                         LINE,AT(1812,3896,0,1521),USE(?LINE3),LINEWIDTH(3)
                         STRING(@s100),AT(135,3917,1656,229),USE(PBS:BatchNumber_10),FONT(,10,,FONT:bold),CENTER
                         STRING(@s10),AT(115,4156,1680,396),USE(LOC:CHARGELOS10),FONT(,24,,FONT:bold),CENTER
                         STRING(@s100),AT(3635,3917,1802,229),USE(PBS:NumberOfUnitsContained_37),FONT(,10,,FONT:bold), |
  CENTER
                         STRING('1'),AT(3760,4156,1177,396),USE(?STRING2),FONT(,24,,FONT:bold),CENTER
                         STRING(@s100),AT(5552,3917,1583,229),USE(PBS:ProductNetWeight_310),FONT(,10,,FONT:bold),CENTER
                         STRING(@s20),AT(5562,4156,1542,396),USE(LOC:NETTOGEWICHT310),FONT(,24,,FONT:bold),CENTER
                         LINE,AT(5479,3896,0,1521),USE(?LINE3:2),LINEWIDTH(3)
                         STRING('NVE'),AT(146,8292,615,1302),USE(?STRING2:2),FONT(,42,,FONT:bold),RIGHT,ANGLE(900)
                         STRING(@s100),AT(187,6594,6875),USE(LOC:BARCODE1),CENTER
                         STRING(@s100),AT(865,9396,4729,198),USE(LOC:BARCODE3),CENTER
                         STRING(@s100),AT(187,7948,6875,198),USE(LOC:BARCODE2),CENTER
                         STRING('Barcode'),AT(187,5573,6875,958),USE(?TBarcode)
                         STRING('Barcode'),AT(187,6927,6875,958),USE(?TBarcode:2)
                         STRING('Barcode'),AT(865,8292,4750,1062),USE(?TBarcode:3)
                         TEXT,AT(73,302,1333,729),USE(LOC:AfzenderGegevens),FONT(,8)
                         TEXT,AT(4740,302,2385,729),USE(LOC:Klantgegevens),FONT(,8)
                         TEXT,AT(115,2812,3406,792),USE(LOC:ARTOMS),FONT(,16,,FONT:bold),CENTER
                         STRING(@s100),AT(4740,73,2406,229),USE(PBS:Klant),FONT(,10,,FONT:bold),LEFT
                         STRING(@s100),AT(115,73,1969,229),USE(PBS:Leverancier),FONT(,10,,FONT:bold),LEFT
                         LINE,AT(73,4615,7094,-20),USE(?LINE1:6),LINEWIDTH(3)
                         TEXT,AT(73,4875,1719,552),USE(Loc:OriginLiveBird,,?Loc:OriginLiveBird:2),FONT(,16,,FONT:bold), |
  CENTER
                         TEXT,AT(1812,4875,1719,552),USE(Loc:OriginSlautherHouse),FONT(,16,,FONT:bold),CENTER
                         TEXT,AT(3594,4875,1844,552),USE(Loc:OriginProcessing),FONT(,16,,FONT:bold),CENTER
                         TEXT,AT(5490,4875,1687,552),USE(Loc:OriginPacking),FONT(,16,,FONT:bold),CENTER
                         STRING(@s50),AT(167,4667,1573),USE(PBS:OriginLiveBird),FONT(,,,FONT:bold),CENTER
                         STRING(@s50),AT(1906,4667,1573,198),USE(PBS:OriginSlautherHouse),FONT(,,,FONT:bold),CENTER
                         STRING(@s50),AT(3625,4667,1781,198),USE(PBS:OriginProcessing),FONT(,,,FONT:bold),CENTER
                         STRING(@s50),AT(5531,4667,1573,198),USE(PBS:OriginPacking),FONT(,,,FONT:bold),CENTER
                         LINE,AT(73,3604,7094,0),USE(?LINE1:7),LINEWIDTH(3)
                         STRING(@s50),AT(3635,3635,3469),USE(PBS:TransportEnOpslag),FONT(,,,FONT:bold),CENTER
                         STRING(@s50),AT(146,3656,3385),USE(PBS:NaOntdooien),FONT(,,,FONT:bold),CENTER
                         IMAGE('NL5664EG.png'),AT(5677,8208,1427,1385),USE(?IMAGEOvaal)
                       END
                       FOOTER,AT(521,11156,7250,156),USE(?Footer)
                       END
                     END
TBarcode                  BarcodeClass
TBarcode:2                BarcodeClass
TBarcode:3                BarcodeClass
ThisWindow           CLASS(ReportManager)
AskPreview             PROCEDURE(),DERIVED
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
OpenReport             PROCEDURE(),BYTE,PROC,DERIVED
TakeEvent              PROCEDURE(),BYTE,PROC,DERIVED
                     END

ThisReport           CLASS(ProcessClass)                   ! Process Manager
Close                  PROCEDURE(),DERIVED
TakeRecord             PROCEDURE(),BYTE,PROC,DERIVED
                     END

ProgressMgr          StepRealClass                         ! Progress Manager
Previewer            PrintPreviewClass                     ! Print Previewer
TargetSelector       ReportTargetSelectorClass             ! Report Target Selector
PDFReporter          CLASS(PDFReportGenerator)             ! PDF
SetUp                  PROCEDURE(),DERIVED
                     END

LocalClass          CLASS
VertaalISCodes          Procedure(String), STRING
                    END

  CODE
? DEBUGHOOK(AAPlanning:Record)
? DEBUGHOOK(AARelatie:Record)
? DEBUGHOOK(AAViewArtikel:Record)
? DEBUGHOOK(ARelatie:Record)
? DEBUGHOOK(AVerkoop:Record)
? DEBUGHOOK(AViewArtikel:Record)
? DEBUGHOOK(ArtikelOmschrijvingExtra:Record)
? DEBUGHOOK(ISOCountries:Record)
? DEBUGHOOK(PalletBladSjabloon:Record)
? DEBUGHOOK(PalletBladSjabloonCountry:Record)
? DEBUGHOOK(RelatieArtikelOmschrijving:Record)
? DEBUGHOOK(Versie:Record)
? DEBUGHOOK(Weging:Record)
  GlobalResponse = ThisWindow.Run()                        ! Opens the window and starts an Accept Loop

!---------------------------------------------------------------------------
DefineListboxStyle ROUTINE
!|
!| This routine create all the styles to be shared in this window
!| It`s called after the window open
!|
!---------------------------------------------------------------------------

ThisWindow.AskPreview PROCEDURE

  CODE
  IF PRM:Preview = 0 THEN
      SELF.SkipPreview = 1
  END
  PARENT.AskPreview


ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
        udpt.Init(UD,'ReportPalletBladEnkel','VoorrRpt020.clw','VoorrRpt.DLL','07/01/2024 @ 08:47PM')    
             
  GlobalErrors.SetProcedureName('ReportPalletBladEnkel')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:AAPlanning.Open                                   ! File AAPlanning used by this procedure, so make sure it's RelationManager is open
  Relate:AARelatie.Open                                    ! File AARelatie used by this procedure, so make sure it's RelationManager is open
  Relate:AAViewArtikel.Open                                ! File AAViewArtikel used by this procedure, so make sure it's RelationManager is open
  Relate:ARelatie.Open                                     ! File ARelatie used by this procedure, so make sure it's RelationManager is open
  Relate:AVerkoop.Open                                     ! File AVerkoop used by this procedure, so make sure it's RelationManager is open
  Relate:AViewArtikel.Open                                 ! File AViewArtikel used by this procedure, so make sure it's RelationManager is open
  Relate:ArtikelOmschrijvingExtra.Open                     ! File ArtikelOmschrijvingExtra used by this procedure, so make sure it's RelationManager is open
  Relate:ISOCountries.Open                                 ! File ISOCountries used by this procedure, so make sure it's RelationManager is open
  Relate:PalletBladSjabloon.Open                           ! File PalletBladSjabloon used by this procedure, so make sure it's RelationManager is open
  Relate:PalletBladSjabloonCountry.Open                    ! File PalletBladSjabloonCountry used by this procedure, so make sure it's RelationManager is open
  Relate:RelatieArtikelOmschrijving.Open                   ! File RelatieArtikelOmschrijving used by this procedure, so make sure it's RelationManager is open
  Relate:Versie.Open                                       ! File Versie used by this procedure, so make sure it's RelationManager is open
  Relate:Weging.Open                                       ! File Weging used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  LOC:CountryCompanySSCCNVE = GETINI('Palletblad','CountryCompanyPrefix','870123456',PQ:IniFile)
  SELF.Open(ProgressWindow)                                ! Open window
  Do DefineListboxStyle
  ProgressWindow{Prop:Alrt,255} = CtrlShiftP
  INIMgr.Fetch('ReportPalletBladEnkel',ProgressWindow)     ! Restore window settings from non-volatile store
  TargetSelector.AddItem(PDFReporter.IReportGenerator)
  SELF.AddItem(TargetSelector)
  ProgressMgr.Init(ScrollSort:AllowNumeric,)
  ThisReport.Init(Process:View, Relate:Versie, ?Progress:PctText, Progress:Thermometer, ProgressMgr, VRS:Versie)
  ThisReport.AddSortOrder(VRS:Versie_PK)
  SELF.AddItem(?Progress:Cancel,RequestCancelled)
  SELF.Init(ThisReport,Report,Previewer)
  ?Progress:UserString{PROP:Text} = ''
  Relate:Versie.SetQuickScan(1,Propagate:OneMany)
  ProgressWindow{PROP:Timer} = 10                          ! Assign timer interval
  SELF.SkipPreview = False
  Previewer.SetINIManager(INIMgr)
  Previewer.AllowUserZoom = True
  SELF.SetAlerts()
  EnterByTabManager.Init(False)
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:AAPlanning.Close
    Relate:AARelatie.Close
    Relate:AAViewArtikel.Close
    Relate:ARelatie.Close
    Relate:AVerkoop.Close
    Relate:AViewArtikel.Close
    Relate:ArtikelOmschrijvingExtra.Close
    Relate:ISOCountries.Close
    Relate:PalletBladSjabloon.Close
    Relate:PalletBladSjabloonCountry.Close
    Relate:RelatieArtikelOmschrijving.Close
    Relate:Versie.Close
    Relate:Weging.Close
  END
  IF SELF.Opened
    INIMgr.Update('ReportPalletBladEnkel',ProgressWindow)  ! Save window data to non-volatile store
  END
  ProgressMgr.Kill()
  GlobalErrors.SetProcedureName
            
   
  IF BAND(Keystate(),KeyStateUD:Shift) 
        UD.ShowProcedureInfo('ReportPalletBladEnkel',UD.SetApplicationName('VoorrRpt','DLL'),ProgressWindow{PROP:Hlp},'03/25/2013 @ 03:15PM','07/01/2024 @ 08:47PM','10/11/2024 @ 01:54PM')  
    
  END
  RETURN ReturnValue


ThisWindow.OpenReport PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  SYSTEM{PROP:PrintMode} = 3
  SAV:Printer=PRINTER{PROPPRINT:Device}
  IF CLIP(GETINI('Printer','Palletblad',,PQ:IniFile)) <> '' THEN
        PRINTER{PROPPRINT:Device}=CLIP(GETINI('Printer','Palletblad',,PQ:IniFile))
        IF NOT PRINTER{PROPPRINT:Device}=CLIP(GETINI('Printer','Palletblad',,PQ:IniFile))
          !  Message('Let op palletprinter is niet gekozen.|Palletprinter='&CLIP(GETINI('Printer','Palletblad',,PQ:IniFile))&'|Huidige printer='&PRINTER{PROPPRINT:Device},'Bel JMD',Icon:Cross)
              ! melding uitgeschakeld 2020-8-10
        END
  END
  SAV:Copies = PRINTER{PROPPRINT:Copies}
  PRINTER{PROPPRINT:Copies}=PRM:AantalPrints
  
  ReturnValue = PARENT.OpenReport()
  IF ReturnValue = LEVEL:Benign                            !Skip if report's PARENT.OpenReport failed...
     TBarcode.Init(Report,?TBarcode,?Detail)
     TBarcode.DrawText = 0 
  END         !ReturnValue = LEVEL:Benign
  IF ReturnValue = LEVEL:Benign                            !Skip if report's PARENT.OpenReport failed...
     TBarcode:2.Init(Report,?TBarcode:2,?Detail)
     TBarcode:2.DrawText = 0 
  END         !ReturnValue = LEVEL:Benign
  IF ReturnValue = LEVEL:Benign                            !Skip if report's PARENT.OpenReport failed...
     TBarcode:3.Init(Report,?TBarcode:3,?Detail)
     TBarcode:3.DrawText = 0 
  END         !ReturnValue = LEVEL:Benign
  IF ReturnValue = Level:Benign
    SELF.Report{PROPPRINT:Extend}=True
  END
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

LocalClass.VertaalISCodes   Procedure(String pIsoCodes)

st                              StringTheory
returnSt                        StringTheory
CODE
            ! in pIsoCountries kunnen meerdere codekomen
    Access:ISOCountries.Open()
    Access:ISOCountries.UseFile()
    returnSt.SetValue('')
    st.SetValue(pIsoCodes)
    st.Split(',') 
    loop x# = 1 to st.Records()
        Clear(ISO:Record)
        ISO:ISCode=St.GetLine(x#)
        If NOT Access:ISOCountries.Fetch(ISO:PK_ISOCountries)=Level:Benign
            Message('Let op de ISOCode '&St.GetLine(x#)&' kan niet gevonden worden','Error '&ERROR(),ICON:Cross) 
        ELSE 
            returnSt.Append(Format(ISO:ISNummer,@n03))
        END
    End
    Access:ISOCountries.Close()
    
    Return  returnSt.Str()

ThisReport.Close PROCEDURE

  CODE
  PARENT.Close
      if SAV:Printer<>''
          PRINTER{PROPPRINT:Device}=SAV:Printer
      END
  
      PRINTER{PROPPRINT:Copies}=SAV:Copies


ThisReport.TakeRecord PROCEDURE

ReturnValue          BYTE,AUTO

SkipDetails BYTE
  CODE
  TBarcode.Draw('LOC:BARCODE1',BARCODE:POSTNET)  
  TBarcode:2.Draw('LOC:BARCODE2',BARCODE:POSTNET)  
  TBarcode:3.Draw('LOC:BARCODE3',BARCODE:POSTNET)  
  IF NOT(LOC:ENKEL) THEN
      LOC:ENKEL = True
      
      ! Benodigde gegevens ophalen
      CLEAR(AAPla:Record)
      AAPla:PlanningID = GLO:UitslagPalletbladPlanningID
      IF Access:AAPlanning.TryFetch(AAPla:PK_Planning) <> Level:Benign THEN
          MESSAGE('Planning ('&GLO:UitslagPalletbladPlanningID&') niet gevonden.', 'Ontbrekende gegevens', ICON:Exclamation)
          RETURN Level:Benign
      END
                 
      CLEAR(AVE:Record)
      AVE:VerkoopID = AAPla:VerkoopID
      IF Access:AVerkoop.TryFetch(AVE:PK_Verkoop) <> Level:Benign THEN
          MESSAGE('Verkoop ('&AAPla:VerkoopID&') niet gevonden.', 'Ontbrekende gegevens', ICON:Exclamation)
          RETURN Level:Benign
      END
      
      AARel:RelatieID = AVE:Klant
      IF Access:AARelatie.TryFetch(AARel:Relatie_PK) <> Level:Benign THEN
          MESSAGE('Klant ('&AVE:Klant&') niet gevonden.', 'Ontbrekende gegevens', ICON:Exclamation)
          RETURN Level:Benign
      END
      
      CLEAR(AAArt:Record)
      AAArt:ArtikelID = GLO:UitslagPalletbladArtikelID
      IF Access:AAViewArtikel.TryFetch(AAArt:Artikel_PK) <> Level:Benign THEN
          MESSAGE('Artikel ('&CLIP(GLO:UitslagPalletbladArtikelID)&') niet gevonden.', 'Ontbrekende gegevens', ICON:Exclamation)
          RETURN Level:Benign
      END
      ! Extra ophalen GTIN 
      CLEAR(RAO:Record)
      RAO:RelatieID=AVE:Klant
      RAO:ArtikelID=GLO:UitslagPalletbladArtikelID
      IF Access:RelatieArtikelOmschrijving.Fetch(RAO:FK1_RelatieArtikelOmschrijving)=Level:Benign
          LOC:GTIN02=RAO:GTIN
      ELSE
          LOC:GTIN02=''
      END
      
      !Ophalen van de juiste vertaling
      gevonden# = false
      
      CLEAR(PBSC:Record)
      PBSC:Country = AARel:Country
      SET(PBSC:FK2_PalletBladSjabloonCountry, PBSC:FK2_PalletBladSjabloonCountry)
      IF Access:PalletBladSjabloonCountry.Next() = Level:Benign THEN
          IF PBSC:Country = AARel:Country THEN
              gevonden# = true
          END
      END
      
      IF NOT(gevonden#)
          CLEAR(PBS:Record)
          PBS:PalletBladSjabloonID = GETINI('Palletblad','StandaardVertaling',,PQ:IniFile)
          IF Access:PalletBladSjabloon.Fetch(PBS:PK_PalletBladSjabloon) <> Level:Benign THEN
              MESSAGE('Standaard palletblad vertaling (ID: ' & CLIP(PBS:PalletBladSjabloonID) & ') kan niet worden opgehaald.' , 'Ontbrekende vertaling', ICON:Exclamation)
              RETURN Level:Benign
          END
      ELSE
          PBS:PalletBladSjabloonID =  PBSC:PalletBladSjabloonID
          IF Access:PalletBladSjabloon.Fetch(PBS:PK_PalletBladSjabloon) <> Level:Benign THEN
              MESSAGE('Palletblad vertaling (ID: ' & CLIP(PBS:PalletBladSjabloonID) & ' voor land (' & CLIP(PBSC:Country) & ') kan niet worden opgehaald.', 'Ontbrekende vertaling', ICON:Exclamation)
              RETURN Level:Benign
          END
      END
      IF AARel:PalletBladLayout='Abbelen'        
          PBS:OriginLiveBird='Auf gezogen in'
          PBS:OriginSlautherHouse='Geschlachtet in:'
      END
      
      !IF NOT(EXISTS(CLIP(AARel:PalletBladRapportHeaderImage))) THEN
      !    MESSAGE('Voor relatie (' & AARel:RelatieID & ') is geen bestaande palletblad-rapport header opgegeven. Vul deze in bij de Stamgegevens->Relaties.', 'Ontbrekende gegevens', ICON:Exclamation)
      !END
      
      !IF CLIP(LEFT(GLO:UitslagPalletbladExternVerkoopID)) = '' OR GLO:UitslagPalletbladDueDate12 = 0 OR GLO:UitslagPalletbladProductionDate11 = 0 OR GLO:UitslagPalletbladSellByDate15 = 0 THEN
      !    MESSAGE('Externe verkoop-ID of een van de drie datums is niet ingevuld.', 'Ontbrekende gegevens', ICON:Exclamation)
      !END
  
      ! Vullen van het palletblad-rapport
      IF CLIP(AARel:PalletBladRapportHeaderImage) <> '' THEN
          SetTarget(Report)
          ?HeaderImage{PROP:Text} = CLIP(AARel:PalletBladRapportHeaderImage)
          SetTarget()
      ELSE
          SetTarget(Report)
          ?HeaderImage{PROP:Text} = GETINI('Palletblad','StandaardLogo','',PQ:IniFile)
          SetTarget()
      END
  !    SetTarget(Report)
  !    ?ImageOvaal{PROP:Text} = 'NL5664EG.png'
  !    SetTarget()
      
      ! 3 + 870 + 123456 + 0000000 + 3
      ! Undefinied packaging (3) + Country Netherlands (870 - 879) + Company ID (dummy) + SSSC (zeros) + checksum (mod 10) ... http://www.lagerwiki.de/index.php?title=Nummer_der_Versandeinheit
      !LOC:SSCCNVE00 = '387012345600000003'
      !LOC:SSCCNVE = '387012345600000003'
      LOC:SSCCNVE00 = '3' & FORMAT(LOC:CountryCompanySSCCNVE, @N09) & FORMAT(PRM:WegingID, @N07)
      ! Bepalen checksum (http://www.gs1sy.org/GS1System/id_keys/CheckDigit.htm)
      CHECKSUMS# = 0
      LOOP I# = 1 TO 17
          IF I# % 2 = 1 THEN
              CHECKSUMS# += 3 * (VAL(LOC:SSCCNVE00[I#]) - 48)
          ELSE    
              CHECKSUMS# += (VAL(LOC:SSCCNVE00[I#]) - 48)
          END
          db.DebugOut('Checksum-telling (' & I# & '): ' & CHECKSUMS# & ' <= ' & LOC:SSCCNVE00[I#] & ' - ' & (VAL(LOC:SSCCNVE00[I#])))
      END
      
      CHECKSUM# = 10 - (CHECKSUMS# - (INT(CHECKSUMS# / 10) * 10))
      IF CHECKSUM# = 10 THEN CHECKSUM# = 0.
      db.DebugOut('Checksum-berekening: ' & CHECKSUMS# & ' => ' & CHECKSUM#)
      LOC:SSCCNVE00 = CLIP(LOC:SSCCNVE00) & FORMAT(CHECKSUM#, @N01)
      
      ! Bepalen artikel-omschrijving
      LOC:ARTOMS = CLIP(GLO:UitslagPalletbladArtikelOms)
      
      LOC:AfzenderGegevens = 'Ven Poultry B.V.' & CHR(13) & CHR(10) & 'Stipdonk 46A' & CHR(13) & CHR(10) & '5715 PD Lierop' & CHR(13) & CHR(10) & 'Holland'
      LOC:KlantGegevens = CLIP(AARel:FirmaNaam) & CHR(13) & CHR(10) & CLIP(AARel:Adres1) & CHR(13) & CHR(10) & CLIP(AARel:Postcode) & ' ' & CLIP(AARel:Plaats) & CHR(13) & CHR(10) & CLIP(AARel:Country)
      
      artikelseparator# = INSTRING(' ', CLIP(LOC:ARTOMS), 1, 1)
      IF artikelseparator# <> 0 THEN
          LOC:ARTNUM241 = CLIP(LEFT(SUB(LOC:ARTOMS, 1, artikelseparator#)))
          LOC:ARTOMS = CLIP((SUB(LOC:ARTOMS, artikelseparator# + 1, LEN(LOC:ARTOMS) - (artikelseparator# - 1))))
      ELSE
          LOC:ARTNUM241 = ''
      END
      
      IF CLIP(LOC:ARTNUM241) = '' THEN
          LOC:ARTNUM241=AAArt:ArtikelID
          !MESSAGE('Artikelnummer kon niet worden bepaald op basis van de artikelomschrijving "' & CLIP(LOC:ARTOMS) & '" van het artikel "' & CLIP(AAArt:ArtikelOms) & '".', 'Artikelnummer', ICON:Exclamation)
      ELSE
          LOOP i# = 1 TO (LEN(CLIP(LOC:ARTNUM241)) - 1)
              !MESSAGE('Controleren (' & LOC:ARTNUM241 & ') - ' & i# & ' /  ' & (LEN(LOC:ARTNUM241) - 1) & ' = ' & VAL(LOC:ARTNUM241[i#]))
              IF (VAL(LOC:ARTNUM241[i#]) < 48) OR (VAL(LOC:ARTNUM241[i#]) > 57) THEN 
                  !MESSAGE('Artikelnummer "' & CLIP(LOC:ARTNUM241) & '" bepaald op basis van de artikelomschrijving "' & CLIP(LOC:ARTOMS) & '" van het artikel "' & CLIP(AAArt:ArtikelOms) & '" bevat ook niet-cijfers. Controleer of dit klopt.', 'Artikelnummer', ICON:Exclamation)
                  LOC:ARTOMS=CLIP(LOC:ARTNUM241) & ' ' & CLIP(LOC:ARTOMS)
                  LOC:ARTNUM241=AAArt:ArtikelID
                  BREAK
              END
          END
      END
      
      LOC:DATE12 = CLIP(LEFT(FORMAT(GLO:UitslagPalletbladDueDate12, @d11)))
      LOC:DATE11 = CLIP(LEFT(FORMAT(GLO:UitslagPalletbladProductionDate11, @d11)))
      LOC:DATE15 = CLIP(LEFT(FORMAT(GLO:UitslagPalletbladSellByDate15, @d11)))
      Loc:HarvarstDate = CLIP(LEFT(FORMAT(GLO:UitslagPalletbladHarvastDate7007, @d11)))
      ! 16-10-2018 Voor Klant Mantons de 400 code weglaten
      ! In plaats hiervan voegen we de 423 toe
      LOC:EBENR400 = CLIP(LEFT(GLO:UitslagPalletbladExternVerkoopID)) !'EBE-1234567'
      LOC:ISOCountries423=LocalClass.VertaalISCodes(GLO:UitslagPalletbladOriginLiveBird)
      LOC:CHARGELOS10 = CLIP(LEFT(FORMAT(GLO:UitslagPalletbladPartijID,@N_10)))
      LOC:NETTOGEWICHT310 = CLIP(LEFT(FORMAT(ROUND(PRM:NettoGewicht, 0.1), @n-_8`1)))
  
      IF GLO:UitslagPalletbladOriginLiveBird=''
          PBS:OriginLiveBird=''
      END
      IF GLO:UitslagPalletbladOriginPacking=''
          PBS:OriginPacking = ''
      END
      IF GLO:UitslagPalletbladOriginProcessing=''
          PBS:OriginProcessing=''
      END
      IF GLO:UitslagPalletbladOriginSlautherHouse=''
          PBS:OriginSlautherHouse=''
      END
      Loc:OriginLiveBird = GLO:UitslagPalletbladOriginLiveBird
      Loc:OriginPacking = GLO:UitslagPalletbladOriginPacking
      Loc:OriginProcessing = GLO:UitslagPalletbladOriginProcessing
      Loc:OriginSlautherHouse = GLO:UitslagPalletbladOriginSlautherHouse
  
      ! 16-10-2018 Voor Klant Mantons de 400 code weglaten
      !LOC:BARCODE1 = '(400)'&CLIP(LOC:EBENR400)&'(241)'&CLIP(LOC:ARTNUM241)&'(12)'&FORMAT(GLO:UitslagPalletbladDueDate12, @d11)
      ! 18-10-2018
  !    LOC:BARCODE1 = '(423)'&CLIP(LOC:ISOCountries423)&'(12)'&FORMAT(GLO:UitslagPalletbladDueDate12, @d11)
  !    LOC:BARCODE2 = '(241)'&CLIP(LOC:ARTNUM241)&'(3101)'&CLIP(FORMAT(ROUND(PRM:NettoGewicht,0.1), @N06v1))&'(10)'&CLIP(LOC:CHARGELOS10)&'(15)'&FORMAT(GLO:UitslagPalletbladSellByDate15, @d11)
      ! 2-11-2018
      ! LOC:BARCODE1 = '(12)'&FORMAT(GLO:UitslagPalletbladDueDate12, @d11)
      ! 13-11-2018
      !LOC:BARCODE1 = CHOOSE(LOC:GTIN02='','','(02)'&LOC:GTIN02)&'(12)'&FORMAT(GLO:UitslagPalletbladDueDate12, @d11)
      ! 19-11-2018
      !LOC:BARCODE1 = '(12)'&FORMAT(GLO:UitslagPalletbladDueDate12, @d11)
      IF AARel:PalletBladLayout='Abbelen'        
          LOC:BARCODE1 = '(400)'&CLIP(LOC:EBENR400)&'(241)'&CLIP(LEFT(LOC:ARTNUM241))
      ELSE
          !LOC:BARCODE1 = '(11)'&FORMAT(GLO:UitslagPalletbladProductionDate11, @d11)
          LOC:BARCODE1 = '(11)'&FORMAT(GLO:UitslagPalletbladProductionDate11, @d11)&'(7007)'&FORMAT(GLO:UitslagPalletbladHarvastDate7007, @d11)
      END
      LOC:BARCODE2 = CHOOSE(LOC:GTIN02='','(241)'&CLIP(LOC:ARTNUM241),'(02)'&LOC:GTIN02)&'(3101)'&CLIP(FORMAT(ROUND(PRM:NettoGewicht,0.1), @N06v1))&'(10)'&CLIP(LOC:CHARGELOS10)&'(15)'&FORMAT(GLO:UitslagPalletbladSellByDate15, @d11)
      LOC:BARCODE3 = '(00)'&CLIP(LOC:SSCCNVE00)
  
      !TBarcode.Draw('<201>400'&CLIP(LOC:EBENR400)&'<201>241'&CLIP(LOC:ARTNUM241)&'<201>12'&FORMAT(GLO:UitslagPalletbladDueDate12, @d11),BARCODE:CODE128)
  !    TBarcode.Draw('<201>423'&CLIP(LOC:ISOCountries423)&'<201>12'&FORMAT(GLO:UitslagPalletbladDueDate12, @d11),BARCODE:CODE128)
  !    TBarcode:2.Draw('<201>241'&CLIP(LOC:ARTNUM241)&'<201>3101'&CLIP(FORMAT(ROUND(PRM:NettoGewicht,0.1), @N06v1))&'10'&CLIP(LOC:CHARGELOS10)&'<201>15'&FORMAT(GLO:UitslagPalletbladSellByDate15, @d11),BARCODE:CODE128)
      !TBarcode.Draw('<201>12'&FORMAT(GLO:UitslagPalletbladDueDate12, @d11),BARCODE:CODE128)
      !TBarcode.Draw(CHOOSE(LOC:GTIN02='','','<201>(02)'&LOC:GTIN02)&'<201>12'&FORMAT(GLO:UitslagPalletbladDueDate12, @d11),BARCODE:CODE128)
      !TBarcode.Draw('<201>12'&FORMAT(GLO:UitslagPalletbladDueDate12, @d11),BARCODE:CODE128)
      IF AARel:PalletBladLayout='Abbelen'
          TBarcode.Draw('<201>400'&CLIP(LOC:EBENR400)&'<201>241'&CLIP(LEFT(LOC:ARTNUM241)),BARCODE:CODE128)
      ELSE
          !TBarcode.Draw('<201>11'&FORMAT(GLO:UitslagPalletbladProductionDate11, @d11),BARCODE:CODE128)
          TBarcode.Draw('<201>11'&FORMAT(GLO:UitslagPalletbladProductionDate11, @d11)&'7007'&FORMAT(GLO:UitslagPalletbladHarvastDate7007, @d11),BARCODE:CODE128)
      END
      TBarcode:2.Draw(CHOOSE(LOC:GTIN02='','<201>241'&CLIP(LOC:ARTNUM241),'<201>02'&LOC:GTIN02)&'<201>3101'&CLIP(FORMAT(ROUND(PRM:NettoGewicht,0.1), @N06v1))&'10'&CLIP(LOC:CHARGELOS10)&'<201>15'&FORMAT(GLO:UitslagPalletbladSellByDate15, @d11),BARCODE:CODE128)
      TBarcode:3.Draw('<201>00'&CLIP(LOC:SSCCNVE00),BARCODE:CODE128)
      
      PRINT(RPT:Detail)
  END
  ReturnValue = PARENT.TakeRecord()
  IF FALSE
  PRINT(RPT:Detail)
  END
  RETURN ReturnValue


PDFReporter.SetUp PROCEDURE

  CODE
  PARENT.SetUp
  SELF.SetFileName('')
  SELF.SetDocumentInfo('CW Report','VoorrRpt','ReportPalletBladEnkel','ReportPalletBladEnkel','','')
  SELF.SetPagesAsParentBookmark(False)
  SELF.SetScanCopyMode(False)
  SELF.CompressText   = True
  SELF.CompressImages = True

