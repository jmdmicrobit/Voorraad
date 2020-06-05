

   MEMBER('VoorrRpt.clw')                                  ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABPRPDF.INC'),ONCE
   INCLUDE('ABREPORT.INC'),ONCE
   INCLUDE('abrppsel.inc'),ONCE

                     MAP
                       INCLUDE('VOORRRPT016.INC'),ONCE        !Local module procedure declarations
                     END


!!! <summary>
!!! Generated from procedure template - Report
!!! Rapport
!!! </summary>
ReportVerkoop PROCEDURE (LONG PRM:VerkoopID,BYTE pRetour)

udpt            UltimateDebugProcedureTracker
Progress:Thermometer BYTE                                  ! 
LOC:VerkoopID        LONG                                  ! 
LOC:Naam             STRING(5120)                          ! 
LOC:Product          STRING(5120)                          ! 
LOC:Planning         STRING(5120)                          ! 
LOC:Transport        STRING(5120)                          ! 
LOC:Instructie       STRING(5120)                          ! 
LOC:Notitie          STRING(5120)                          ! 
LOC:Prijs            CSTRING(5120)                         ! 
LOC:InkoopPrijs      CSTRING(5120)                         ! 
LOC:ExtraKosten      CSTRING(5120)                         ! 
LOC:VerkoopPrijs     DECIMAL(9,2)                          ! 
Loc:SavePath         STRING(255)                           ! 
Loc:TMPDirectory     STRING(255)                           ! 
Loc:Commando         CSTRING(10000)                        ! 
Loc:TmpAtt           STRING(255)                           ! 
Loc:Landscape        BYTE                                  ! 
Loc:LandscapeOverride BYTE                                 ! 
Loc:MailButtonID     LONG                                  ! 
Process:View         VIEW(Verkoop)
                       PROJECT(Ver2:Koersverschil)
                       PROJECT(Ver2:Valuta)
                       PROJECT(Ver2:VerkoopID)
                       PROJECT(Ver2:Klant)
                       JOIN(AREL:Relatie_PK,Ver2:Klant)
                       END
                     END
LocEnableEnterByTab  BYTE(1)                               !Used by the ENTER Instead of Tab template
EnterByTabManager    EnterByTabClass
ProgressWindow       WINDOW('Progress...'),AT(,,142,59),DOUBLE,CENTER,GRAY,TIMER(1)
                       PROGRESS,AT(15,15,111,12),USE(Progress:Thermometer),RANGE(0,100)
                       STRING(''),AT(0,3,141,10),USE(?Progress:UserString),CENTER
                       STRING(''),AT(0,30,141,10),USE(?Progress:PctText),CENTER
                       BUTTON('Cancel'),AT(45,42,50,15),USE(?Progress:Cancel)
                     END

Report               REPORT,AT(479,1467,7312,9698),PRE(RPT),PAPER(PAPER:A4),FONT('Arial',10,,FONT:regular,CHARSET:ANSI), |
  THOUS
                       HEADER,AT(479,521,7312,948),USE(?Header)
                         STRING('Details: {30}// verkoop'),AT(562,219),USE(?STRING1),FONT(,28,,FONT:regular+FONT:underline)
                         LINE,AT(21,927,7219,0),USE(?LINE1:12)
                         STRING(@n_10),AT(6281,31),USE(Ver2:VerkoopID),RIGHT(1)
                       END
Detail                 DETAIL,AT(0,0,7292,8323),USE(?Detail)
                         LINE,AT(21,750,7220,0),USE(?LINE1),LINEWIDTH(6)
                         LINE,AT(52,1490,7220,0),USE(?LINE1:3),LINEWIDTH(6)
                         LINE,AT(52,2240,7220,0),USE(?LINE1:4),LINEWIDTH(6)
                         LINE,AT(52,2990,7220,0),USE(?LINE1:5),LINEWIDTH(6)
                         LINE,AT(52,3740,7220,0),USE(?LINE1:6),LINEWIDTH(6)
                         LINE,AT(52,5240,7220,0),USE(?LINE1:7),LINEWIDTH(6)
                         LINE,AT(52,5990,7220,0),USE(?LINE1:8),LINEWIDTH(6)
                         LINE,AT(52,6740,7220,0),USE(?LINE1:9),LINEWIDTH(6)
                         STRING('Naam:'),AT(146,115),USE(?STRING2),FONT('Times New Roman',14)
                         STRING('Product:'),AT(146,906),USE(?STRING3),FONT('Times New Roman',14,,,CHARSET:ANSI)
                         STRING('Planning:'),AT(146,1656,1750,250),USE(?Planning),FONT('Times New Roman',14,,FONT:regular)
                         STRING('Prijs:'),AT(146,2469,1750,250),USE(?STRING4:3),FONT('Times New Roman',14,,FONT:regular)
                         STRING('Transport:'),AT(146,3146,1750,250),USE(?STRING4:4),FONT('Times New Roman',14,,FONT:regular)
                         STRING('Instructie:'),AT(146,3906,1750,250),USE(?STRING4:5),FONT('Times New Roman',14,,FONT:regular)
                         STRING('Overige instructie:'),AT(146,5375,1750,250),USE(?STRING4:6),FONT('Times New Roman', |
  14,,FONT:regular)
                         STRING('Inkoopprijs:'),AT(146,6094,1750,250),USE(?STRING4:7),FONT('Times New Roman',14,,FONT:regular)
                         STRING('Kosten/commissie/container/'),AT(146,6823,2302,250),USE(?STRING4:8),FONT('Times New Roman', |
  14,,FONT:regular)
                         STRING('shockvries/veterinair/overig'),AT(146,7135,2302,250),USE(?STRING4:9),FONT('Times New Roman', |
  14,,FONT:regular)
                         TEXT,AT(2594,31,4531,687),USE(LOC:Naam,,?LOC:Naam:2),FONT('Times New Roman',14),RESIZE
                         TEXT,AT(2594,792,4531,687),USE(LOC:Product),FONT('Times New Roman',14),RESIZE
                         TEXT,AT(2615,1562,4510,687),USE(LOC:Planning),FONT('Times New Roman',14),RESIZE
                         TEXT,AT(2604,3062,4521,687),USE(LOC:Transport),FONT('Times New Roman',14),RESIZE
                         TEXT,AT(2625,3823,4521,1406),USE(LOC:Instructie),FONT('Times New Roman',14),RESIZE
                         LINE,AT(52,7510,7220,0),USE(?LastLine),LINEWIDTH(6)
                         LINE,AT(21,0,0),USE(?VertLine1),HIDE,LINEWIDTH(6)
                         LINE,AT(2521,0,0),USE(?VertLine2),HIDE,LINEWIDTH(6)
                         LINE,AT(7240,0,0),USE(?VertLine3),HIDE,LINEWIDTH(6)
                         TEXT,AT(2615,2312,4510,687),USE(LOC:Prijs),FONT('Times New Roman',14),RESIZE
                         TEXT,AT(2615,6052,4510,687),USE(LOC:InkoopPrijs),FONT('Times New Roman',14),RESIZE
                         TEXT,AT(2625,6823,4510,687),USE(LOC:ExtraKosten),FONT('Times New Roman',14),RESIZE
                         STRING('Notitie:'),AT(146,7615,1750,250),USE(?Notitie),FONT('Times New Roman',14,,FONT:regular)
                         LINE,AT(135,8229,7156,-61),USE(?LastLine:2),LINEWIDTH(6)
                         TEXT,AT(2635,7583,4510,552),USE(LOC:Notitie),FONT('Times New Roman',14),RESIZE
                       END
                       FOOTER,AT(479,10927,7312,260),USE(?Footer)
                       END
                     END
    omit('***',WE::CantCloseNowSetHereDone=1)  !Getting Nested omit compile error, then uncheck the "Check for duplicate CantCloseNowSetHere variable declaration" in the WinEvent local template
WE::CantCloseNowSetHereDone equate(1)
WE::CantCloseNowSetHere     long
    !***
ThisWindow           CLASS(ReportManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Init                   PROCEDURE(ProcessClass PC,<REPORT R>,<PrintPreviewClass PV>)
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
OpenReport             PROCEDURE(),BYTE,PROC,DERIVED
TakeEvent              PROCEDURE(),BYTE,PROC,DERIVED
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED
                     END

ThisReport           CLASS(ProcessClass)                   ! Process Manager
TakeRecord             PROCEDURE(),BYTE,PROC,DERIVED
                     END

ProgressMgr          StepLongClass                         ! Progress Manager
Previewer            CLASS(PrintPreviewClass)              ! Print Previewer
Open                   PROCEDURE(),DERIVED
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED
                     END

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

ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
        udpt.Init(UD,'ReportVerkoop','VoorrRpt016.clw','VoorrRpt.DLL','06/02/2020 @ 02:25PM')    
             
  GlobalErrors.SetProcedureName('ReportVerkoop')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  db.DebugOut('ReportVerkoop1')
  LOC:VerkoopID = PRM:VerkoopID
  Relate:ExtraKosten.Open                                  ! File ExtraKosten used by this procedure, so make sure it's RelationManager is open
  Relate:KostenStamgeg.Open                                ! File KostenStamgeg used by this procedure, so make sure it's RelationManager is open
  Relate:Partij.Open                                       ! File Partij used by this procedure, so make sure it's RelationManager is open
  Relate:Planning.SetOpenRelated()
  Relate:Planning.Open                                     ! File Planning used by this procedure, so make sure it's RelationManager is open
  Relate:Verpakking.Open                                   ! File Verpakking used by this procedure, so make sure it's RelationManager is open
  Relate:ViewArtikel.Open                                  ! File ViewArtikel used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(ProgressWindow)                                ! Open window
  WinAlertMouseZoom()
  Do DefineListboxStyle
  ProgressWindow{Prop:Alrt,255} = CtrlShiftP
  INIMgr.Fetch('ReportVerkoop',ProgressWindow)             ! Restore window settings from non-volatile store
  TargetSelector.AddItem(PDFReporter.IReportGenerator)
  SELF.AddItem(TargetSelector)
  ProgressMgr.Init(ScrollSort:AllowNumeric,)
  ThisReport.Init(Process:View, Relate:Verkoop, ?Progress:PctText, Progress:Thermometer, ProgressMgr, Ver2:VerkoopID)
  ThisReport.AddSortOrder(Ver2:PK_Verkoop)
  ThisReport.AddRange(Ver2:VerkoopID,LOC:VerkoopID)
  SELF.AddItem(?Progress:Cancel,RequestCancelled)
  SELF.Init(ThisReport,Report,Previewer)
  ?Progress:UserString{PROP:Text} = ''
  Relate:Verkoop.SetQuickScan(1,Propagate:OneMany)
  ProgressWindow{PROP:Timer} = 10                          ! Assign timer interval
  SELF.SkipPreview = False
  Previewer.SetINIManager(INIMgr)
  Previewer.AllowUserZoom = True
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
    Relate:ExtraKosten.Close
    Relate:KostenStamgeg.Close
    Relate:Partij.Close
    Relate:Planning.Close
    Relate:Verpakking.Close
    Relate:ViewArtikel.Close
  END
  IF SELF.Opened
    INIMgr.Update('ReportVerkoop',ProgressWindow)          ! Save window data to non-volatile store
  END
  ProgressMgr.Kill()
  GlobalErrors.SetProcedureName
            
   
  IF BAND(Keystate(),KeyStateUD:Shift) 
        UD.ShowProcedureInfo('ReportVerkoop',UD.SetApplicationName('VoorrRpt','DLL'),ProgressWindow{PROP:Hlp},'09/09/2011 @ 05:02PM','06/02/2020 @ 02:25PM','06/03/2020 @ 11:38AM')  
    
  END
  RETURN ReturnValue


ThisWindow.OpenReport PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  SYSTEM{PROP:PrintMode} = 3
  ReturnValue = PARENT.OpenReport()
  IF NOT ReturnValue And pRetour=1
      Report$?String1{Prop:Text}='Details : // Verkoop Retour'
      Report$?Planning{Prop:Text}='Verkoopdatum:'
  END
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


ThisReport.TakeRecord PROCEDURE

ReturnValue          BYTE,AUTO

SkipDetails BYTE
  CODE
  db.DebugOut('ReportVerkoop2:' & Ver2:VerkoopID)
  Access:Verkoop.TryFetch(Ver2:PK_Verkoop)
  
  LOC:Naam = ARel:FirmaNaam
  LOC:Notitie=AREL:Note
  IF Ver2:Planning_DATE > 0 THEN
      EXECUTE 1+(Ver2:Planning_DATE%7)
          Loc:Planning = 'Zondag ' &Format(Ver2:Planning_DATE,@d6-) & ' ' &Format(Ver2:Planning_TIME,@t1B)
          Loc:Planning = 'Maandag ' &Format(Ver2:Planning_DATE,@d6-) & ' ' &Format(Ver2:Planning_TIME,@t1B)
          Loc:Planning = 'Dinsdag ' &Format(Ver2:Planning_DATE,@d6-) & ' ' &Format(Ver2:Planning_TIME,@t1B)
          Loc:Planning = 'Woensdag ' &Format(Ver2:Planning_DATE,@d6-) & ' ' &Format(Ver2:Planning_TIME,@t1B)
          Loc:Planning = 'Donderdag ' &Format(Ver2:Planning_DATE,@d6-) & ' ' &Format(Ver2:Planning_TIME,@t1B)
          Loc:Planning = 'Vrijdag ' &Format(Ver2:Planning_DATE,@d6-) & ' ' &Format(Ver2:Planning_TIME,@t1B)
          Loc:Planning = 'Zaterdag ' &Format(Ver2:Planning_DATE,@d6-) & ' ' &Format(Ver2:Planning_TIME,@t1B)
      END	
  ELSE
      Loc:Planning = ''
  .
  if pRetour=TRUE
      IF Ver2:RetourDatum_DATE > 0 THEN
          Loc:Planning=CLIP(Loc:Planning)&' Retourdatum:'
          EXECUTE 1+(Ver2:Planning_DATE%7)
              Loc:Planning = CLIP(Loc:Planning)&'Zondag ' &Format(Ver2:RetourDatum_DATE,@d6-) & ' ' &Format(Ver2:RetourDatum_TIME,@t1B)
              Loc:Planning = CLIP(Loc:Planning)&'Maandag ' &Format(Ver2:RetourDatum_DATE,@d6-) & ' ' &Format(Ver2:RetourDatum_TIME,@t1B)
              Loc:Planning = CLIP(Loc:Planning)&'Dinsdag ' &Format(Ver2:RetourDatum_DATE,@d6-) & ' ' &Format(Ver2:RetourDatum_TIME,@t1B)
              Loc:Planning = CLIP(Loc:Planning)&'Woensdag ' &Format(Ver2:RetourDatum_DATE,@d6-) & ' ' &Format(Ver2:RetourDatum_TIME,@t1B)
              Loc:Planning = CLIP(Loc:Planning)&'Donderdag ' &Format(Ver2:RetourDatum_DATE,@d6-) & ' ' &Format(Ver2:RetourDatum_TIME,@t1B)
              Loc:Planning = CLIP(Loc:Planning)&'Vrijdag ' &Format(Ver2:RetourDatum_DATE,@d6-) & ' ' &Format(Ver2:RetourDatum_TIME,@t1B)
              Loc:Planning = CLIP(Loc:Planning)&'Zaterdag ' &Format(Ver2:RetourDatum_DATE,@d6-) & ' ' &Format(Ver2:RetourDatum_TIME,@t1B)
          END	
      END    
  END    
  
  Clear(Loc:Product)
  !Clear(Loc:Memo)
  Clear(Loc:Instructie)
  Clear(Loc:Transport)
  Clear(LOC:Prijs)
  
  !IF Ver2:ExtraKosten > 0 THEN
  !	LOC:ExtraKosten = CLIP(LEFT(FORMAT(Ver2:ExtraKosten, @N12`2)))&CHR(13)&CHR(10)&CLIP(Ver2:ExtraKostenTekst)
  !ELSE
  LOC:ExtraKosten = CLIP(Ver2:ExtraKostenTekst)
  !END
  Clear(Ext:Record)
  Ext:VerkoopID=Ver2:VerkoopID
  Set(Ext:FK1_ExtraKosten,Ext:FK1_ExtraKosten)
  Loop until Access:ExtraKosten.Next()
      if not Ext:VerkoopID=Ver2:VerkoopID Then Break.
      if Ext:ExtraKosten=0 then cycle.
      Clear(Kos:Record)
      Kos:KostenID=Ext:KostenID
      Access:KostenStamgeg.Fetch(Kos:PK_KostenStamgeg)
      IF pRetour=TRUE AND Kos:Soort<>'R' THEN CYCLE.
      IF LOC:ExtraKosten=''
          LOC:ExtraKosten=Clip(Kos:Omschrijving)&' '&Format(Ext:ExtraKosten,@n12`2)
      ELSE
          LOC:ExtraKosten=CLIP(LOC:ExtraKosten)&' '&Clip(Kos:Omschrijving)&' '&Format(Ext:ExtraKosten,@n12`2)
      END
  END
  
  Clear(Pla:Record)
  Pla:VerkoopID = Ver2:VerkoopID
  Set(Pla:Planning_FK02,Pla:Planning_FK02)
  Loop until Access:Planning.Next()
      If not Pla:VerkoopID = Ver2:VerkoopID Then Break.
      if pRetour=TRUE AND NOT (NULL(Pla:PlanningIDRetour) OR Pla:PlanningIDRetour=0) THEN CYCLE.
      Clear(Art:Record)
      Art:ArtikelID=Pla:ArtikelID
      Access:ViewArtikel.Fetch(Art:Artikel_PK)
      Clear(Ver:Record)
      Ver:VerpakkingID = Pla:VerpakkingID
      Access:Verpakking.Fetch(Ver:Verpakking_PK)
      if Loc:Product =''
          Loc:Product = CLIP(LEFT(Format(CHOOSE(Pla:MutatieGemaakt = 0,Pla:KG,Pla:MutatieKG),@n-13`2)))&' KG '&CHOOSE(Pla:AlternatieveArtikelOms = '',CLIP(Art:ArtikelOms),Pla:AlternatieveArtikelOms)&' ('&CLIP(Ver:VerpakkingOmschrijving) &')'
      ELSE
          Loc:Product = Clip(Loc:Product)&CHR(13)&CHR(10)&CLIP(LEFT(Format(CHOOSE(Pla:MutatieGemaakt = 0,Pla:KG,Pla:MutatieKG),@n-13`2)))&' KG '&CHOOSE(Pla:AlternatieveArtikelOms = '',CLIP(Art:ArtikelOms),Pla:AlternatieveArtikelOms)&' ('&CLIP(Ver:VerpakkingOmschrijving)&')'
      END
  	
      IF LOC:Prijs = ''
          LOC:Prijs = CLIP(LEFT(Format(CHOOSE(Pla:MutatieGemaakt = 0,Pla:KG,Pla:MutatieKG),@n-13`2)))&' KG ' & CHOOSE(Pla:AlternatieveArtikelOms = '',CLIP(Art:ArtikelOms),Pla:AlternatieveArtikelOms) & ' à '&CLIP(LEFT(FORMAT(Pla:VerkoopKGPrijs, @n13`3)))
      ELSE
          LOC:Prijs = CLIP(LOC:Prijs)&CHR(13)&CHR(10)&CLIP(LEFT(Format(CHOOSE(Pla:MutatieGemaakt = 0,Pla:KG,Pla:MutatieKG),@n-13`2)))&' KG ' & CHOOSE(Pla:AlternatieveArtikelOms = '',CLIP(Art:ArtikelOms),Pla:AlternatieveArtikelOms) & ' à '&CLIP(LEFT(FORMAT(Pla:VerkoopKGPrijs, @n13`3)))
      END	
  	
      IF Pla:PartijID > 0 THEN
          db.DebugOut('ReportVerkoop3:' & Pla:PartijID)
          CLEAR(Par:Record)
          Par:PartijID = Pla:PartijID
          IF Access:Partij.TryFetch(Par:Partij_PK) <> Level:Benign THEN
              CLEAR(Par:Record)
          END
          IF Par:ExternPartijnr = 0 
              Loc:Product = Clip(Loc:Product)&' (Partij:'&Pla:PartijID&')'
          ELSE
              Loc:Product = Clip(Loc:Product)&' (Partij:'&Pla:PartijID&'/Extern partij:'&Par:ExternPartijnr&')'
          .
          db.DebugOut('ReportVerkoop4:' & Pla:PartijID)
  		
          IF LOC:InkoopPrijs = ''
              LOC:InkoopPrijs = CLIP(LEFT(Format(CHOOSE(Pla:MutatieGemaakt = 0,Pla:KG,Pla:MutatieKG),@n-13`2)))&' KG ' & CLIP(Art:ArtikelOms) & ' à ('&CLIP(LEFT(FORMAT(Par:InkoopKGPrijs, @n13`3))) & ' + ' &CLIP(LEFT(FORMAT(Par:BerekendeInkoopKGPrijs - Par:InkoopKGPrijs, @n13`3))) & ')'& ' EURO'
          ELSE
              LOC:InkoopPrijs = CLIP(LOC:InkoopPrijs)&CHR(13)&CHR(10)&CLIP(LEFT(Format(CHOOSE(Pla:MutatieGemaakt = 0,Pla:KG,Pla:MutatieKG),@n-13`2)))&' KG ' & CLIP(Art:ArtikelOms) & ' à ('&CLIP(LEFT(FORMAT(Par:InkoopKGPrijs, @n13`3))) & ' + ' & CLIP(LEFT(FORMAT(Par:BerekendeInkoopKGPrijs - Par:InkoopKGPrijs, @n13`3))) & ')'& ' EURO'
          END	
      .
  	
  	!If Loc:Memo=''
  	!	Loc:Memo = Pla:Memo
  	!ELSE
  	!	Loc:Memo = Loc:Memo&'<13><10>'&Pla:Memo
  	!END
      IF GLO:HidePlanningInstructie = 0 THEN
          IF pRetour
              IF Loc:Instructie=''
                  Loc:Instructie = CLIP(Ver2:RedenRetour)
              ELSE
                  Loc:Instructie = CLIP(Loc:Instructie)&CHR(13)&CHR(10)&CLIP(Ver2:RedenRetour)
              END
          ELSE    
              IF Loc:Instructie=''
                  Loc:Instructie = CLIP(Pla:Instructie)
              ELSE
                  Loc:Instructie = CLIP(Loc:Instructie)&CHR(13)&CHR(10)&CLIP(Pla:Instructie)
              END
          END
      END
  	
      IF CLIP(Loc:Transport)=''
          Loc:Transport = CLIP(Pla:Transport)
      ELSE
  		! Geen twee transport instructies
  		!Loc:Transport = Loc:Transport &CHR(13)&CHR(10)& Pla:Transport
      END
      Clear(Ext:Record)
      Ext:PlanningID=Pla:PlanningID
      Set(Ext:FK3_ExtraKosten,Ext:FK3_ExtraKosten)
      Loop until Access:ExtraKosten.Next()
          if not Ext:PlanningID=Pla:PlanningID Then Break.
          if Ext:ExtraKosten=0 then cycle.
          Clear(Kos:Record)
          Kos:KostenID=Ext:KostenID
          Access:KostenStamgeg.Fetch(Kos:PK_KostenStamgeg)
          IF LOC:ExtraKosten=''
              LOC:ExtraKosten=Clip(Kos:Omschrijving)&' '&Format(Ext:ExtraKosten,@n12`2)
          ELSE
              LOC:ExtraKosten=CLIP(LOC:ExtraKosten)&' '&Clip(Kos:Omschrijving)&' '&Format(Ext:ExtraKosten,@n12`2)
          END
      END
  
  END	
  
  !IF Loc:Prijs =''
  Loc:Prijs=CLIP(Loc:Prijs)&' '&Ver2:Valuta&CHOOSE(Ver2:Koersverschil=0,'',' koersverschil '&Ver2:Koersverschil)
  !END
  
  db.DebugOut('ReportVerkoop5:' & Ver2:VerkoopID)
  ReturnValue = PARENT.TakeRecord()
  ! Verticale lijnen grote goedzetten
  SETTARGET(Report)
  IF IGB:BekijkenPrijzen <> 1 THEN
  	?LOC:Prijs{PROP:Hide} = 1
  	?LOC:InkoopPrijs{PROP:Hide} = 1
  	?LOC:ExtraKosten{PROP:Hide} = 1
  END		
  !?VertLine1{PROP:Height} = ?LastLine{PROP:Ypos}
  !?VertLine2{PROP:Height} = ?LastLine{PROP:Ypos}
  !?VertLine3{PROP:Height} = ?LastLine{PROP:Ypos}
  SETTARGET()
  PRINT(RPT:Detail)
  RETURN ReturnValue


Previewer.Open PROCEDURE

  CODE
  PARENT.Open
    !Find equate for the toolbar
    Findtoolbar#= 0
    loop
      Findtoolbar#= target{prop:nextfield,Findtoolbar#}
      if Findtoolbar# = 0 then break.
      if Findtoolbar#{prop:type} = create:toolbar then break.
    end
    ! MailButton
    Loc:MailButtonID=CREATE(0,CREATE:Button,Findtoolbar#)
    Loc:MailButtonID{prop:msg}       = 'Printvoorbeeld emailen'
    Loc:MailButtonID{Prop:Icon}      = '~Send.ico'
    Loc:MailButtonID{Prop:Flat}     = true
    Loc:MailButtonID{Prop:Text}     = ''
  
    Setposition(Loc:MailButtonID,4,2,32,32)   ! Mail-button weer voorraan zetten
    UNHIDE(Loc:MailButtonID)
    DISPLAY(Loc:MailButtonID)
  
    if Findtoolbar# > 0 then
      Controls# = 0
      loop
        Controls#= target{prop:nextfield,Controls#}
        if Controls# = 0 then break.
        ! De controls van de toolbar verplaatsen (behalve de mailbutton). Controls met een hoge equate zijn ondersteunde controls van de listbox? (i.i.g. niet verplaatsen)
        if Controls#{prop:parent} = Findtoolbar# AND Controls# <> Loc:MailButtonID AND Controls# < 30000 THEN
          HIDE(Controls#)
          SetPosition(Controls#, Controls#{PROP:XPos} + 34,Controls#{PROP:YPos}, Controls#{PROP:Width} , Controls#{PROP:Height})
          UNHIDE(Controls#)
          DISPLAY(Controls#)
        end
      end
     end


Previewer.TakeAccepted PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.TakeAccepted()
    IF FIELD()=Loc:MailButtonID
       Loc:SavePath=Clip(Path())
       if not(Records(Self.ImageQueue)) then
          Message('Er is niet om gestuurd te worden')
          Return Level:Fatal
       end
       Loc:Commando=GetIni('Mail','wmf2pdf','wmf2pdf.exe',path()&'\mail.ini')
       Loc:TMPDirectory=''
       ! kijken wat de tijdelijke directory is van de wmf bestanden
       Loop i#=1 to Records(Self.ImageQueue)
         Get(Self.ImageQueue,i#)
         if not error()
            if Loc:TMPDirectory=''
               Loop j#=Len(Clip(Self.ImageQueue.FileName)) to 1 by -1
                  if Sub(Clip(Self.ImageQueue.FileName),j#,1)='\'
                     Loc:TMPDirectory=Sub(Clip(Self.ImageQueue.FileName),1,j#)
                     Break
                   end
               end
               Loc:TmpAtt='"'&Clip(Loc:TMPDirectory)&Shortpath('Verkoop' &'.pdf')&'"'
                IF Records(Self.ImageQueue) <= 200
                  Loc:Commando=Clip(Loc:Commando)& ' Output='& Clip(Loc:TmpAtt) &' Input="'&Clip(Self.ImageQueue.FileName)
                ELSE
                   Ini"=Today()&'.'&Clock()
                   Loc:Commando=Clip(Loc:Commando)& ' Output='& Clip(Loc:TmpAtt) &' Ini='&path()&'\'&Ini"&'"'
                   PUTINI('Export','Totaal',Records(Self.ImageQueue),path()&'\'&Ini")
                   PUTINI('Export',i#,Clip(Self.ImageQueue.FileName),path()&'\'&Ini")
                END
            else
                IF Records(Self.ImageQueue) <= 200
                   Loc:Commando=Clip(Loc:Commando)& ';'& Clip(Self.ImageQueue.FileName)
                ELSE
                   PUTINI('Export',i#,Clip(Self.ImageQueue.FileName),path()&'\'&Ini")
                END
            end
         end
       end
       IF Loc:LandscapeOverride THEN
          IF Loc:Landscape THEN
              Loc:Commando=Clip(Loc:Commando)& '" Landscape'
          ELSE
              Loc:Commando=Clip(Loc:Commando)& '"'
          END
       ELSE
          IF Report{PROP:Landscape} THEN
              Loc:Commando=Clip(Loc:Commando)& '" Landscape'
          ELSE
              Loc:Commando=Clip(Loc:Commando)& '"'
          END
       END
  
       Loc:Commando=Clip(Loc:Commando)& ' Subject="'& 'Verkoop' &'"'
       !Loc:Commando=Clip(Loc:Commando)& ' To="'& &'"'
       Run(Loc:Commando,1)
  
       if path()<>Loc:SavePath
          setpath(Loc:SavePath)
          if error() then stop(Error()&'  bij het terugzetten van het path').
       end
  
       POST(Event:CloseDown)
    END
  RETURN ReturnValue


PDFReporter.SetUp PROCEDURE

  CODE
  PARENT.SetUp
  SELF.SetFileName('')
  SELF.SetDocumentInfo('CW Report','VoorrRpt','ReportVerkoop','ReportVerkoop','','')
  SELF.SetPagesAsParentBookmark(False)
  SELF.SetScanCopyMode(False)
  SELF.CompressText   = True
  SELF.CompressImages = True

