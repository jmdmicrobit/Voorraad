

   MEMBER('VoorrRpt.clw')                                  ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABPRPDF.INC'),ONCE
   INCLUDE('ABREPORT.INC'),ONCE
   INCLUDE('abrppsel.inc'),ONCE

                     MAP
                       INCLUDE('VOORRRPT021.INC'),ONCE        !Local module procedure declarations
                     END


!!! <summary>
!!! Generated from procedure template - Report
!!! </summary>
ReportPalletBladMeerdere_WERKTNIET PROCEDURE (PRM:PlanningID)

udpt            UltimateDebugProcedureTracker
Progress:Thermometer BYTE                                  ! 
LOC:SSCCNVE00        STRING(30)                            ! 
LOC:DATE12           STRING(6)                             ! 
LOC:EBENR400         STRING(20)                            ! 
LOC:DATE11           STRING(6)                             ! 
LOC:ARTOMS           STRING(20)                            ! 
LOC:ARTNUM241        STRING(20)                            ! 
LOC:CHARGELOS10      STRING(10)                            ! 
LOC:DATE15           STRING(6)                             ! 
LOC:NETTOGEWICHT310  STRING(20)                            ! 
LOC:BARCODE1         STRING(100)                           ! 
LOC:BARCODE2         STRING(100)                           ! 
LOC:BARCODE3         STRING(100)                           ! 
LOC:TMPBARCODE       STRING(100)                           ! 
LOC:ENKEL            BYTE                                  ! 
LOC:PlanningID       LONG                                  ! 
Process:View         VIEW(Mutatie)
                       PROJECT(Mut:MutatieID)
                       PROJECT(Mut:PlanningID)
                     END
LocEnableEnterByTab  BYTE(1)                               !Used by the ENTER Instead of Tab template
EnterByTabManager    EnterByTabClass
ProgressWindow       WINDOW('Progress...'),AT(,,177,128),DOUBLE,CENTER,GRAY,TIMER(1)
                       PROGRESS,AT(32,15,111,12),USE(Progress:Thermometer),RANGE(0,100)
                       STRING(''),AT(18,3,141,10),USE(?Progress:UserString),CENTER
                       STRING(''),AT(18,30,141,10),USE(?Progress:PctText),CENTER
                       BUTTON('Cancel'),AT(94,107,50,15),USE(?Progress:Cancel)
                       PROMPT('Extern Verkoop-ID:'),AT(4,48),USE(?GLO:UitslagPalletbladExternVerkoopID:Prompt)
                       ENTRY(@s50),AT(81,48,85,10),USE(GLO:UitslagPalletbladExternVerkoopID),LEFT
                       PROMPT('Fälligkeitsdatum (12):'),AT(4,63),USE(?GLO:UitslagPalletbladDueDate12:Prompt),FONT(, |
  10)
                       ENTRY(@d6-),AT(81,62,40,10),USE(GLO:UitslagPalletbladDueDate12)
                       PROMPT('Herstellungsdatum (11):'),AT(4,77),USE(?GLO:UitslagPalletbladProductionDate11:Prompt)
                       ENTRY(@d6-),AT(81,76,40,10),USE(GLO:UitslagPalletbladProductionDate11)
                       PROMPT('MHD (15):'),AT(4,92),USE(?GLO:UitslagPalletbladSellByDate15:Prompt)
                       ENTRY(@d6-),AT(81,90,40,10),USE(GLO:UitslagPalletbladSellByDate15)
                       BUTTON('Pause'),AT(32,107,50,15),USE(?Pause)
                     END

Report               REPORT,AT(521,521,7219,10677),PRE(RPT),PAPER(PAPER:A4),FONT('Arial',10,,FONT:regular,CHARSET:ANSI), |
  THOUS
                       HEADER,AT(490,479,7250,115),USE(?Header)
                       END
Detail                 DETAIL,AT(0,500,7250,9760),USE(?Detail),PAGEAFTER(1)
                         BOX,AT(42,31,7146,9656),USE(?BOX1),COLOR(COLOR:Black),LINEWIDTH(3)
                         IMAGE,AT(73,73,7083,960),USE(?HeaderImage)
                         LINE,AT(62,1094,7115,0),USE(?LINE1),LINEWIDTH(3)
                         STRING('SSCC (NVE) (00)'),AT(135,1167),USE(?STRING1),FONT(,10,,FONT:bold)
                         STRING(@s30),AT(135,1521,3302,229),USE(LOC:SSCCNVE00),FONT(,16,,FONT:bold),CENTER
                         LINE,AT(62,2156,7115,0),USE(?LINE1:2),LINEWIDTH(3)
                         LINE,AT(62,3229,7115,0),USE(?LINE1:3),LINEWIDTH(3)
                         LINE,AT(62,4292,7115,0),USE(?LINE1:4),LINEWIDTH(3)
                         LINE,AT(62,5417,7115,0),USE(?LINE1:5),LINEWIDTH(3)
                         LINE,AT(3552,1083,0,4333),USE(?LINE2),LINEWIDTH(3)
                         STRING('Fälligkeitsdatum [JJMMTT] (12)'),AT(3635,1167,3427,229),USE(?STRING1:2),FONT(,10,, |
  FONT:bold)
                         STRING(@s6),AT(4771,1521,1177,396),USE(LOC:DATE12),FONT(,24,,FONT:bold),CENTER
                         STRING('Herstellungsdatum [JJMMTT] (11)'),AT(3635,2229,3427,229),USE(?STRING1:3),FONT(,10, |
  ,FONT:bold)
                         STRING(@s6),AT(4771,2594,1177,396),USE(LOC:DATE11),FONT(,24,,FONT:bold),CENTER
                         STRING('Bestellnummer (400)'),AT(135,2229,3323,229),USE(?STRING1:4),FONT(,10,,FONT:bold)
                         STRING(@s20),AT(115,2594,3323,396),USE(LOC:EBENR400),FONT(,24,,FONT:bold),CENTER
                         STRING('Artikelbezeichnung'),AT(135,3323,3323,229),USE(?STRING1:5),FONT(,10,,FONT:bold)
                         STRING(@s20),AT(115,3708,3323,396),USE(LOC:ARTOMS),FONT(,24,,FONT:bold),CENTER
                         STRING('Artikel Nr. (241)'),AT(3635,3323,3323,229),USE(?STRING1:6),FONT(,10,,FONT:bold)
                         STRING(@s20),AT(3635,3708,3470,396),USE(LOC:ARTNUM241),FONT(,24,,FONT:bold),CENTER
                         STRING('MHD [JJMMTT] (15)'),AT(1937,4375,1583,229),USE(?STRING1:7),FONT(,10,,FONT:bold)
                         STRING(@s6),AT(2104,4750,1177,396),USE(LOC:DATE15),FONT(,24,,FONT:bold),CENTER
                         LINE,AT(1823,4292,0,1125),USE(?LINE3),LINEWIDTH(3)
                         STRING('Charge/Los (10)'),AT(135,4375,1458,229),USE(?STRING1:8),FONT(,10,,FONT:bold)
                         STRING(@s10),AT(115,4750,1680,396),USE(LOC:CHARGELOS10),FONT(,24,,FONT:bold),CENTER
                         STRING('Anzahl Packstücke (37)'),AT(3635,4375,1802,229),USE(?STRING1:9),FONT(,10,,FONT:bold)
                         STRING('1'),AT(3760,4750,1177,396),USE(?STRING2),FONT(,24,,FONT:bold),CENTER
                         STRING('Nettogewicht PAL (310)'),AT(5552,4375,1583,229),USE(?STRING1:10),FONT(,10,,FONT:bold)
                         STRING(@s20),AT(5562,4750,1542,396),USE(LOC:NETTOGEWICHT310),FONT(,24,,FONT:bold),CENTER
                         LINE,AT(5490,4292,0,1125),USE(?LINE3:2),LINEWIDTH(3)
                         STRING('NVE'),AT(146,8292,615,1302),USE(?STRING2:2),FONT(,42,,FONT:bold),RIGHT,ANGLE(900)
                         STRING(@s100),AT(187,6594,6875),USE(LOC:BARCODE1),CENTER
                         STRING(@s100),AT(865,9396,4729,198),USE(LOC:BARCODE3),CENTER
                         STRING(@s100),AT(187,7948,6875,198),USE(LOC:BARCODE2),CENTER
                         STRING('Barcode'),AT(187,5573,6875,958),USE(?TBarcode)
                         STRING('Barcode'),AT(187,6927,6875,958),USE(?TBarcode:2)
                         STRING('Barcode'),AT(865,8292,4750,1062),USE(?TBarcode:3)
                       END
                       FOOTER,AT(521,11156,7250,156),USE(?Footer)
                       END
                     END
    omit('***',WE::CantCloseNowSetHereDone=1)  !Getting Nested omit compile error, then uncheck the "Check for duplicate CantCloseNowSetHere variable declaration" in the WinEvent local template
WE::CantCloseNowSetHereDone equate(1)
WE::CantCloseNowSetHere     long
    !***
TBarcode                  BarcodeClass
TBarcode:2                BarcodeClass
TBarcode:3                BarcodeClass
ThisWindow           CLASS(ReportManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Init                   PROCEDURE(ProcessClass PC,<REPORT R>,<PrintPreviewClass PV>)
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
OpenReport             PROCEDURE(),BYTE,PROC,DERIVED
Paused                 BYTE
Timer                  LONG
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED
TakeEvent              PROCEDURE(),BYTE,PROC,DERIVED
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED
                     END

ThisReport           CLASS(ProcessClass)                   ! Process Manager
TakeRecord             PROCEDURE(),BYTE,PROC,DERIVED
                     END

ProgressMgr          StepLongClass                         ! Progress Manager
Previewer            PrintPreviewClass                     ! Print Previewer
TargetSelector       ReportTargetSelectorClass             ! Report Target Selector
PDFReporter          CLASS(PDFReportGenerator)             ! PDF
SetUp                  PROCEDURE(),DERIVED
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
TBarcode:Draw            ROUTINE
   TBarcode.Draw('LOC:BARCODE1',BARCODE:POSTNET)  
TBarcode:2:Draw            ROUTINE
   TBarcode:2.Draw('LOC:BARCODE2',BARCODE:POSTNET)  
TBarcode:3:Draw            ROUTINE
   TBarcode:3.Draw('LOC:BARCODE3',BARCODE:POSTNET)  

ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
        udpt.Init(UD,'ReportPalletBladMeerdere_WERKTNIET','VoorrRpt021.clw','VoorrRpt.DLL','06/02/2020 @ 02:25PM')    
             
  GlobalErrors.SetProcedureName('ReportPalletBladMeerdere_WERKTNIET')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  LOC:PlanningID = PRM:PlanningID
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:AAPlanning.Open                                   ! File AAPlanning used by this procedure, so make sure it's RelationManager is open
  Relate:AARelatie.Open                                    ! File AARelatie used by this procedure, so make sure it's RelationManager is open
  Relate:AAViewArtikel.Open                                ! File AAViewArtikel used by this procedure, so make sure it's RelationManager is open
  Relate:AMutatie.Open                                     ! File AMutatie used by this procedure, so make sure it's RelationManager is open
  Relate:AVerkoop.Open                                     ! File AVerkoop used by this procedure, so make sure it's RelationManager is open
  Relate:ArtikelOmschrijvingExtra.Open                     ! File ArtikelOmschrijvingExtra used by this procedure, so make sure it's RelationManager is open
  Relate:Mutatie.Open                                      ! File Mutatie used by this procedure, so make sure it's RelationManager is open
  Relate:Weging.Open                                       ! File Weging used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  CLEAR(AAPla:Record)
  AAPla:PlanningID = LOC:PlanningID
  IF Access:AAPlanning.TryFetch(AAPla:PK_Planning) = Level:Benign THEN
      CLEAR(AVE:Record)
      AVE:VerkoopID = AAPla:VerkoopID
      IF Access:AVerkoop.TryFetch(AVE:PK_Verkoop) = Level:Benign THEN
          GLO:UitslagPalletbladExternVerkoopID = AVE:ExternVerkoopID
      END        
  END
      
  CLEAR(AMut:Record)
  AMut:PlanningID = LOC:PlanningID
  SET(AMut:Mutatie_FK02,AMut:Mutatie_FK02)
  LOOP UNTIL Access:AMutatie.Next()
      IF AMut:PlanningID = LOC:PlanningID THEN
          GLO:UitslagPalletbladDueDate12 = AMut:UitslagPalletbladDueDate12_DATE
          GLO:UitslagPalletbladProductionDate11 = AMut:UitslagPalletbladProductionDate11_DATE
          GLO:UitslagPalletbladSellByDate15 = AMut:UitslagPalletbladSellByDate15_DATE
      END
      BREAK
  END
  
  
  
  SELF.Open(ProgressWindow)                                ! Open window
  WinAlertMouseZoom()
  Do DefineListboxStyle
  ProgressWindow{Prop:Alrt,255} = CtrlShiftP
  INIMgr.Fetch('ReportPalletBladMeerdere_WERKTNIET',ProgressWindow) ! Restore window settings from non-volatile store
  TargetSelector.AddItem(PDFReporter.IReportGenerator)
  SELF.AddItem(TargetSelector)
  ProgressMgr.Init(ScrollSort:AllowNumeric,)
  ThisReport.Init(Process:View, Relate:Mutatie, ?Progress:PctText, Progress:Thermometer, ProgressMgr, Mut:MutatieID)
  ThisReport.AddSortOrder(Mut:Mutatie_FK02)
  ThisReport.AddRange(Mut:PlanningID,LOC:PlanningID)
  SELF.AddItem(?Progress:Cancel,RequestCancelled)
  SELF.Init(ThisReport,Report,Previewer)
  ?Progress:UserString{PROP:Text} = ''
  Relate:Mutatie.SetQuickScan(1,Propagate:OneMany)
  ProgressWindow{PROP:Timer} = 10                          ! Assign timer interval
  SELF.SkipPreview = False
  Previewer.SetINIManager(INIMgr)
  Previewer.AllowUserZoom = True
  ASSERT(~SELF.DeferWindow) ! A hidden Go button is not smart ...
  SELF.KeepVisible = 1
  SELF.DeferOpenReport = 1
  SELF.Timer = TARGET{PROP:Timer}
  TARGET{PROP:Timer} = 0
  ?Pause{PROP:Text} = 'Go'
  SELF.Paused = 1
  ?Progress:Cancel{PROP:Key} = EscKey
  SELF.SetAlerts()
  EnterByTabManager.Init(False)
  RETURN ReturnValue


ThisWindow.Init PROCEDURE(ProcessClass PC,<REPORT R>,<PrintPreviewClass PV>)

  CODE
  PARENT.Init(PC,R,PV)
  WinAlertMouseZoom()


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:AAPlanning.Close
    Relate:AARelatie.Close
    Relate:AAViewArtikel.Close
    Relate:AMutatie.Close
    Relate:AVerkoop.Close
    Relate:ArtikelOmschrijvingExtra.Close
    Relate:Mutatie.Close
    Relate:Weging.Close
  END
  IF SELF.Opened
    INIMgr.Update('ReportPalletBladMeerdere_WERKTNIET',ProgressWindow) ! Save window data to non-volatile store
  END
  ProgressMgr.Kill()
  GlobalErrors.SetProcedureName
            
   
  IF BAND(Keystate(),KeyStateUD:Shift) 
        UD.ShowProcedureInfo('ReportPalletBladMeerdere_WERKTNIET',UD.SetApplicationName('VoorrRpt','DLL'),ProgressWindow{PROP:Hlp},'03/29/2013 @ 01:03PM','06/02/2020 @ 02:25PM','06/03/2020 @ 11:38AM')  
    
  END
  RETURN ReturnValue


ThisWindow.OpenReport PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  SYSTEM{PROP:PrintMode} = 3
  ReturnValue = PARENT.OpenReport()
  IF ReturnValue = LEVEL:Benign                            !Skip if report's PARENT.OpenReport failed...
     TBarcode.Init(Report,?TBarcode,?Detail)
     TBarcode.DrawText = 0 
     TBarcode.ClearAreaLeft = 0
     TBarcode.ClearAreaRight = 0
     TBarcode.ClearAreaTop = 0
     TBarcode.ClearAreaBottom = 0
  END         !ReturnValue = LEVEL:Benign
  IF ReturnValue = LEVEL:Benign                            !Skip if report's PARENT.OpenReport failed...
     TBarcode:2.Init(Report,?TBarcode:2,?Detail)
     TBarcode:2.DrawText = 0 
     TBarcode:2.ClearAreaLeft = 0
     TBarcode:2.ClearAreaRight = 0
     TBarcode:2.ClearAreaTop = 0
     TBarcode:2.ClearAreaBottom = 0
  END         !ReturnValue = LEVEL:Benign
  IF ReturnValue = LEVEL:Benign                            !Skip if report's PARENT.OpenReport failed...
     TBarcode:3.Init(Report,?TBarcode:3,?Detail)
     TBarcode:3.DrawText = 0 
     TBarcode:3.ClearAreaLeft = 0
     TBarcode:3.ClearAreaRight = 0
     TBarcode:3.ClearAreaTop = 0
     TBarcode:3.ClearAreaBottom = 0
  END         !ReturnValue = LEVEL:Benign
  IF ReturnValue = Level:Benign
    SELF.Report{PROPPRINT:Extend}=True
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
    CASE ACCEPTED()
    OF ?Pause
      IF SELF.Paused
        TARGET{PROP:Timer} = SELF.Timer
        ?Pause{PROP:Text} = 'Pause'
      ELSE
        SELF.Timer = TARGET{PROP:Timer}
        TARGET{PROP:Timer} = 0
        ?Pause{PROP:Text} = 'Restart'
      END
      SELF.Paused = 1 - SELF.Paused
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
    OF EVENT:Timer
      IF SELF.Paused THEN RETURN Level:Benign .
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


ThisReport.TakeRecord PROCEDURE

ReturnValue          BYTE,AUTO

SkipDetails BYTE
  CODE
  IF FALSE
  END
  ReturnValue = PARENT.TakeRecord()
  IF FALSE
  PRINT(RPT:Detail)
  END
  ! Benodigde gegevens ophalen
  CLEAR(AAPla:Record)
  AAPla:PlanningID = Mut:PlanningID
  IF Access:AAPlanning.TryFetch(AAPla:PK_Planning) <> Level:Benign THEN
      MESSAGE('Planning ('&Mut:PlanningID&') niet gevonden.', 'Ontbrekende gegevens', ICON:Exclamation)
      RETURN Level:Benign
  END
             
  CLEAR(AVE:Record)
  AVE:VerkoopID = AAPla:VerkoopID
  IF Access:AVerkoop.TryFetch(AVE:PK_Verkoop) <> Level:Benign THEN
      MESSAGE('Verkoop ('&AAPla:VerkoopID&') niet gevonden.')
      RETURN Level:Benign
  END
  
  AARel:RelatieID = AVE:Klant
  IF Access:AARelatie.TryFetch(AARel:Relatie_PK) <> Level:Benign THEN
      MESSAGE('Klant ('&AVE:Klant&') niet gevonden.', 'Ontbrekende gegevens', ICON:Exclamation)
      RETURN Level:Benign
  END
  
  CLEAR(AAArt:Record)
  AAArt:ArtikelID = Mut:ArtikelID
  IF Access:AAViewArtikel.TryFetch(AAArt:Artikel_PK) <> Level:Benign THEN
      MESSAGE('Artikel ('&Mut:ArtikelID&') niet gevonden.', 'Ontbrekende gegevens', ICON:Exclamation)
      RETURN Level:Benign
  END
  
  IF NOT(EXISTS(CLIP(AARel:PalletBladRapportHeaderImage))) THEN
      MESSAGE('Voor relatie (' & AARel:RelatieID & ') is geen bestaande palletblad-rapport header opgegeven. Vul deze in bij de Stamgegevens->Relaties.', 'Ontbrekende gegevens', ICON:Exclamation)
  END
  
  IF CLIP(LEFT(GLO:UitslagPalletbladExternVerkoopID)) = '' OR GLO:UitslagPalletbladDueDate12 = 0 OR GLO:UitslagPalletbladProductionDate11 = 0 OR GLO:UitslagPalletbladSellByDate15 = 0 THEN
      MESSAGE('Externe verkoop-ID of een van de drie datums is niet ingevuld.', 'Ontbrekende gegevens', ICON:Exclamation)
  END
  
  ! Vullen van het palletblad-rapport    
  SetTarget(Report)
  ?HeaderImage{PROP:Text} = CLIP(AARel:PalletBladRapportHeaderImage)
  SetTarget()
              
  LOC:SSCCNVE00 = '341325000000000017'
  
  ! Bepalen artikel-omschrijving
  LOC:ARTNUM241 = AAArt:ArtikelID
  LOC:ARTOMS = CLIP(AAArt:ArtikelOms)
  IF (CLIP(AAREL:ItemCode)<> '')
      CLEAR(Art2:Record)
      Art2:ex_artcode=AREL:ItemCode
      Art2:artcode=Art:ArtikelID
      IF (Access:ArtikelOmschrijvingExtra.TryFetch(Art2:PK_ArtikelOmschrijvingExtra) = Level:Benign)
          LOC:ARTOMS = CLIP(Art2:tekst)
      END
  END
  
  LOC:DATE12 = FORMAT(GLO:UitslagPalletbladDueDate12, @d11)
  LOC:DATE11 = FORMAT(GLO:UitslagPalletbladProductionDate11, @d11)
  LOC:DATE15 = FORMAT(GLO:UitslagPalletbladSellByDate15, @d11)
  LOC:EBENR400 = CLIP(LEFT(GLO:UitslagPalletbladExternVerkoopID)) !'EBE-1234567'
  LOC:CHARGELOS10 = LEFT(FORMAT(Mut:PartijID,@N_10))
  
  CLEAR(Weg:Record)
  Weg:MutatieID = Mut:MutatieID
  SET(Weg:FK_Weging, Weg:FK_Weging)
  LOOP UNTIL Access:Weging.Next()
      IF Weg:MutatieID <> Mut:MutatieID THEN BREAK.
      
      LOC:NETTOGEWICHT310 = CLIP(FORMAT(ROUND(Weg:NettoGewicht, 0.1), @n-_8`1))
  
      LOC:BARCODE1 = '(400)'&CLIP(LOC:EBENR400)&'(241)'&CLIP(LOC:ARTNUM241)&'(12)'&FORMAT(GLO:UitslagPalletbladDueDate12, @d11)
      LOC:BARCODE2 = '(241)'&CLIP(LOC:ARTNUM241)&'(3101)'&CLIP(FORMAT(ROUND(Weg:NettoGewicht,0.1), @N06v1))&'(10)'&CLIP(LOC:CHARGELOS10)&'(15)'&FORMAT(GLO:UitslagPalletbladSellByDate15, @d11)
      LOC:BARCODE3 = '(00)'&CLIP(LOC:SSCCNVE00)
      
      IF LOC:ENKEL THEN
          TBarcode.Reset()
          TBarcode:2.Reset()
          TBarcode:3.Reset()
      ELSE
          LOC:ENKEL = True
      END
  
      TBarcode.Draw('<201>400'&CLIP(LOC:EBENR400)&'<201>241'&CLIP(LOC:ARTNUM241)&'<201>12'&FORMAT(GLO:UitslagPalletbladDueDate12, @d11),BARCODE:CODE128)
      TBarcode:2.Draw('<201>241'&CLIP(LOC:ARTNUM241)&'<201>3101'&CLIP(FORMAT(ROUND(Weg:NettoGewicht,0.1), @N06v1))&'10'&CLIP(LOC:CHARGELOS10)&'<201>15'&FORMAT(GLO:UitslagPalletbladSellByDate15, @d11),BARCODE:CODE128)
      TBarcode:3.Draw('<201>00'&CLIP(LOC:SSCCNVE00),BARCODE:CODE128)
      
      PRINT(RPT:Detail)
  END
  RETURN ReturnValue


PDFReporter.SetUp PROCEDURE

  CODE
  PARENT.SetUp
  SELF.SetFileName('')
  SELF.SetDocumentInfo('CW Report','VoorrRpt','ReportPalletBladMeerdere_WERKTNIET','ReportPalletBladMeerdere_WERKTNIET','','')
  SELF.SetPagesAsParentBookmark(False)
  SELF.SetScanCopyMode(False)
  SELF.CompressText   = True
  SELF.CompressImages = True

