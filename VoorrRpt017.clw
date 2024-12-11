

   MEMBER('VoorrRpt.clw')                                  ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABPRPDF.INC'),ONCE
   INCLUDE('ABREPORT.INC'),ONCE
   INCLUDE('abrppsel.inc'),ONCE

                     MAP
                       INCLUDE('VOORRRPT017.INC'),ONCE        !Local module procedure declarations
                     END


!!! <summary>
!!! Generated from procedure template - Report
!!! </summary>
ReportInkoop PROCEDURE (LONG PRM:InkoopID,BYTE pRetour)

udpt            UltimateDebugProcedureTracker
Progress:Thermometer BYTE                                  ! 
LOC:InkoopID         LONG                                  ! 
LOC:Naam             STRING(5120)                          ! 
LOC:Product          STRING(5120)                          ! 
LOC:Planning         STRING(5120)                          ! 
LOC:Transport        STRING(5120)                          ! 
LOC:Instructie       STRING(5120)                          ! 
LOC:Prijs            CSTRING(1024)                         ! 
Loc:KG               DECIMAL(10,2)                         ! 
Loc:SavePath         STRING(255)                           ! 
Loc:TMPDirectory     STRING(255)                           ! 
Loc:Commando         CSTRING(10000)                        ! 
Loc:TmpAtt           STRING(255)                           ! 
Loc:Landscape        BYTE                                  ! 
Loc:LandscapeOverride BYTE                                 ! 
Loc:MailButtonID     LONG                                  ! 
Process:View         VIEW(Inkoop)
                       PROJECT(Ink:InkoopID)
                       PROJECT(Ink:Leverancier)
                       JOIN(Rel:Relatie_PK,Ink:Leverancier)
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
                         STRING('Details: {31}// inkoop'),AT(562,219),USE(?STRING1),FONT(,28,,FONT:regular+FONT:underline)
                         LINE,AT(21,927,7219,0),USE(?LINE1:12)
                         STRING(@n_10),AT(6302,31),USE(Ink:InkoopID),RIGHT
                       END
Detail                 DETAIL,AT(0,0,7302,6875),USE(?Detail)
                         LINE,AT(21,750,7220,0),USE(?LINE1),LINEWIDTH(6)
                         LINE,AT(21,1500,7220,0),USE(?LINE1:2),LINEWIDTH(6)
                         LINE,AT(21,2250,7220,0),USE(?LINE1:3),LINEWIDTH(6)
                         LINE,AT(21,3000,7220,0),USE(?LINE1:4),LINEWIDTH(6)
                         LINE,AT(21,3750,7220,0),USE(?LINE1:5),LINEWIDTH(6)
                         LINE,AT(21,4500,7220,0),USE(?LINE1:6),LINEWIDTH(6)
                         LINE,AT(21,6000,7220,0),USE(?LINE1:7),LINEWIDTH(6)
                         LINE,AT(21,6750,7220,0),USE(?LINE1:8),LINEWIDTH(6)
                         STRING('Naam:'),AT(146,115),USE(?STRING2),FONT('Times New Roman',14)
                         STRING('Product:'),AT(146,906),USE(?STRING3),FONT('Times New Roman',14,,,CHARSET:ANSI)
                         STRING('Uit te boeken product: '),AT(146,1635),USE(?STRING4),FONT('Times New Roman',14,,FONT:regular)
                         STRING('Planning:'),AT(146,2385,1750,250),USE(?STRING4:2),FONT('Times New Roman',14,,FONT:regular)
                         STRING('Prijs:'),AT(146,3198,1750,250),USE(?STRING4:3),FONT('Times New Roman',14,,FONT:regular)
                         STRING('Transport:'),AT(146,3875,1750,250),USE(?STRING4:4),FONT('Times New Roman',14,,FONT:regular)
                         STRING('Instructie:'),AT(146,4635,1750,250),USE(?STRING4:5),FONT('Times New Roman',14,,FONT:regular)
                         STRING('Overige instructie:'),AT(146,6104,1750,250),USE(?STRING4:6),FONT('Times New Roman', |
  14,,FONT:regular)
                         TEXT,AT(2594,31,4531,687),USE(LOC:Naam,,?LOC:Naam:2),FONT('Times New Roman',14),RESIZE
                         TEXT,AT(2594,792,4531,687),USE(LOC:Product),FONT('Times New Roman',14),RESIZE
                         TEXT,AT(2615,2292,4510,687),USE(LOC:Planning),FONT('Times New Roman',14),RESIZE
                         TEXT,AT(2604,3792,4521,687),USE(LOC:Transport),FONT('Times New Roman',14),RESIZE
                         TEXT,AT(2604,4562,4521,1406),USE(LOC:Instructie),FONT('Times New Roman',14),RESIZE
                         LINE,AT(21,0,0),USE(?VertLine1),HIDE,LINEWIDTH(6)
                         LINE,AT(2521,0,0),USE(?VertLine2),HIDE,LINEWIDTH(6)
                         LINE,AT(7240,0,0),USE(?VertLine3),HIDE,LINEWIDTH(6)
                         TEXT,AT(2615,3052,4510,687),USE(LOC:Prijs),FONT('Times New Roman',14),RESIZE
                       END
                       FOOTER,AT(479,10927,7312,260),USE(?Footer)
                       END
                     END
ThisWindow           CLASS(ReportManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
OpenReport             PROCEDURE(),BYTE,PROC,DERIVED
TakeEvent              PROCEDURE(),BYTE,PROC,DERIVED
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
? DEBUGHOOK(Inkoop:Record)
? DEBUGHOOK(Partij:Record)
? DEBUGHOOK(Planning:Record)
? DEBUGHOOK(Verpakking:Record)
? DEBUGHOOK(ViewArtikel:Record)
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
        udpt.Init(UD,'ReportInkoop','VoorrRpt017.clw','VoorrRpt.DLL','06/28/2024 @ 02:30PM')    
             
  GlobalErrors.SetProcedureName('ReportInkoop')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  LOC:InkoopID = PRM:InkoopID
  Relate:Inkoop.SetOpenRelated()
  Relate:Inkoop.Open                                       ! File Inkoop used by this procedure, so make sure it's RelationManager is open
  Relate:Partij.Open                                       ! File Partij used by this procedure, so make sure it's RelationManager is open
  Relate:Verpakking.Open                                   ! File Verpakking used by this procedure, so make sure it's RelationManager is open
  Relate:ViewArtikel.Open                                  ! File ViewArtikel used by this procedure, so make sure it's RelationManager is open
  Access:Planning.UseFile                                  ! File referenced in 'Other Files' so need to inform it's FileManager
  SELF.FilesOpened = True
  SELF.Open(ProgressWindow)                                ! Open window
  Do DefineListboxStyle
  ProgressWindow{Prop:Alrt,255} = CtrlShiftP
  INIMgr.Fetch('ReportInkoop',ProgressWindow)              ! Restore window settings from non-volatile store
  TargetSelector.AddItem(PDFReporter.IReportGenerator)
  SELF.AddItem(TargetSelector)
  ProgressMgr.Init(ScrollSort:AllowNumeric,)
  ThisReport.Init(Process:View, Relate:Inkoop, ?Progress:PctText, Progress:Thermometer, ProgressMgr, Ink:InkoopID)
  ThisReport.AddSortOrder(Ink:PK_Inkoop)
  ThisReport.AddRange(Ink:InkoopID,LOC:InkoopID)
  SELF.AddItem(?Progress:Cancel,RequestCancelled)
  SELF.Init(ThisReport,Report,Previewer)
  ?Progress:UserString{PROP:Text} = ''
  Relate:Inkoop.SetQuickScan(1,Propagate:OneMany)
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
    Relate:Inkoop.Close
    Relate:Partij.Close
    Relate:Verpakking.Close
    Relate:ViewArtikel.Close
  END
  IF SELF.Opened
    INIMgr.Update('ReportInkoop',ProgressWindow)           ! Save window data to non-volatile store
  END
  ProgressMgr.Kill()
  GlobalErrors.SetProcedureName
            
   
  IF BAND(Keystate(),KeyStateUD:Shift) 
        UD.ShowProcedureInfo('ReportInkoop',UD.SetApplicationName('VoorrRpt','DLL'),ProgressWindow{PROP:Hlp},'09/14/2011 @ 12:23PM','06/28/2024 @ 02:30PM','10/11/2024 @ 01:54PM')  
    
  END
  RETURN ReturnValue


ThisWindow.OpenReport PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  SYSTEM{PROP:PrintMode} = 3
  ReturnValue = PARENT.OpenReport()
  IF NOT ReturnValue And pRetour=1
     Report$?String1{Prop:Text}='Details : // Inkoop Retour'
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
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue


ThisReport.TakeRecord PROCEDURE

ReturnValue          BYTE,AUTO

SkipDetails BYTE
  CODE
  IF IGB:BekijkenPrijzen <> 1 THEN
      HIDE(?LOC:Prijs)
  END
  
  Access:Inkoop.TryFetch(Ink:PK_Inkoop)
  
  LOC:Naam = Rel:FirmaNaam
  
  if pRetour=FALSE
      IF Ink:Planning_DATE > 0 THEN
          EXECUTE 1+(Ink:Planning_DATE%7)
              Loc:Planning = 'Zondag ' &Format(Ink:Planning_DATE,@d6-) & ' ' &Format(Ink:Planning_TIME,@t1B)
              Loc:Planning = 'Maandag ' &Format(Ink:Planning_DATE,@d6-) & ' ' &Format(Ink:Planning_TIME,@t1B)
              Loc:Planning = 'Dinsdag ' &Format(Ink:Planning_DATE,@d6-) & ' ' &Format(Ink:Planning_TIME,@t1B)
              Loc:Planning = 'Woensdag ' &Format(Ink:Planning_DATE,@d6-) & ' ' &Format(Ink:Planning_TIME,@t1B)
              Loc:Planning = 'Donderdag ' &Format(Ink:Planning_DATE,@d6-) & ' ' &Format(Ink:Planning_TIME,@t1B)
              Loc:Planning = 'Vrijdag ' &Format(Ink:Planning_DATE,@d6-) & ' ' &Format(Ink:Planning_TIME,@t1B)
              Loc:Planning = 'Zaterdag ' &Format(Ink:Planning_DATE,@d6-) & ' ' &Format(Ink:Planning_TIME,@t1B)
          END	
      ELSE
          Loc:Planning = ''
      .
  ELSE
      IF Ink:RetourDatum_DATE > 0 THEN
          EXECUTE 1+(Ink:RetourDatum_DATE%7)
              Loc:Planning = 'Zondag ' &Format(Ink:RetourDatum_DATE,@d6-) & ' ' &Format(Ink:RetourDatum_TIME,@t1B)
              Loc:Planning = 'Maandag ' &Format(Ink:RetourDatum_DATE,@d6-) & ' ' &Format(Ink:RetourDatum_TIME,@t1B)
              Loc:Planning = 'Dinsdag ' &Format(Ink:RetourDatum_DATE,@d6-) & ' ' &Format(Ink:RetourDatum_TIME,@t1B)
              Loc:Planning = 'Woensdag ' &Format(Ink:RetourDatum_DATE,@d6-) & ' ' &Format(Ink:RetourDatum_TIME,@t1B)
              Loc:Planning = 'Donderdag ' &Format(Ink:RetourDatum_DATE,@d6-) & ' ' &Format(Ink:RetourDatum_TIME,@t1B)
              Loc:Planning = 'Vrijdag ' &Format(Ink:RetourDatum_DATE,@d6-) & ' ' &Format(Ink:RetourDatum_TIME,@t1B)
              Loc:Planning = 'Zaterdag ' &Format(Ink:RetourDatum_DATE,@d6-) & ' ' &Format(Ink:RetourDatum_TIME,@t1B)
          END	
      ELSE
          Loc:Planning = ''
      .
  END
  
  Clear(Loc:Product)
  !Clear(Loc:Memo)
  Clear(Loc:Instructie)
  Clear(Loc:Transport)
  Clear(LOC:Prijs)
  		
  Clear(Pla:Record)
  Pla:InkoopID = Ink:InkoopID
  Set(Pla:Planning_FK01,Pla:Planning_FK01)
  Loop until Access:Planning.Next()
      If NOT(Pla:InkoopID = Ink:InkoopID) Then Break.
      if pRetour=TRUE AND NOT NULL(Pla:PlanningIDRetour) THEN CYCLE.
  
      Clear(Art:Record)
      Art:ArtikelID=Pla:ArtikelID
      Access:ViewArtikel.Fetch(Art:Artikel_PK)
      Clear(Ver:Record)
      Ver:VerpakkingID = Pla:VerpakkingID
      Access:Verpakking.Fetch(Ver:Verpakking_PK)
      IF Pla:MutatieGemaakt =  1
          Loc:KG=Pla:MutatieKG
      ELSE
          Loc:KG=Pla:KG
      END
      
      if Loc:Product =''
          Loc:Product = CLIP(LEFT(Format(Loc:KG,@n-13`2)))&' KG '&CLIP(Art:ArtikelOms)&' ('&CLIP(Ver:VerpakkingOmschrijving)&')'
      ELSE
          Loc:Product = Clip(Loc:Product)&CHR(13)&CHR(10)&CLIP(LEFT(Format(Loc:KG,@n-13`2)))&' KG '&CLIP(Art:ArtikelOms)&' ('&CLIP(Ver:VerpakkingOmschrijving)&')'
      END
  
      IF LOC:Prijs = ''
          LOC:Prijs = CLIP(LEFT(Format(Loc:KG,@n-13`2)))&' KG ' & CLIP(Art:ArtikelOms) & ' à '&CLIP(LEFT(FORMAT(Pla:InkoopKGPrijs, @n13`3)))
      ELSE
          LOC:Prijs = CLIP(LOC:Prijs)&CHR(13)&CHR(10)&CLIP(LEFT(Format(Loc:KG,@n-13`2)))&' KG ' & CLIP(Art:ArtikelOms) & ' à '&CLIP(LEFT(FORMAT(Pla:InkoopKGPrijs, @n13`3)))
      END
  	
      IF Pla:PartijID > 0 THEN
          CLEAR(Par:Record)
          Par:PartijID = Pla:PartijID
          IF (Access:Partij.TryFetch(Par:Partij_PK) <> Level:Benign) THEN
              CLEAR(Par:Record)
          END
  		
          IF Par:ExternPartijnr = 0 
              Loc:Product = Clip(Loc:Product)&' (Partij:'&Pla:PartijID&')'
          ELSE
              Loc:Product = Clip(Loc:Product)&' (Partij:'&Pla:PartijID&'/Extern partij:'&Par:ExternPartijnr&')'
          .
      .
  	
  	!If Loc:Memo=''
  	!	Loc:Memo = Pla:Memo
  	!ELSE
  	!	Loc:Memo = Loc:Memo&'<13><10>'&Pla:Memo
  	!END
  	
      IF GLO:HidePlanningInstructie = 0 THEN
          IF pRetour
              IF Loc:Instructie=''
                  Loc:Instructie = CLIP(Ink:RedenRetour)
              ELSE
                  Loc:Instructie = CLIP(Loc:Instructie)&CHR(13)&CHR(10)&CLIP(Ink:RedenRetour)
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
  END	
  
  IF LOC:Prijs = '' THEN
      LOC:Prijs = CLIP(LOC:Prijs)&CHR(13)&CHR(10)
  END 
  
  IF Ink:TransportKosten > 0 THEN
      IF LOC:Prijs = '' THEN
          LOC:Prijs = 'Transport-kosten: ' & CLIP(LEFT(FORMAT(Ink:TransportKosten, @N13`3)))
      ELSE
          LOC:Prijs = CLIP(LOC:Prijs)&CHR(13)&CHR(10)& 'Transport-kosten: ' & CLIP(LEFT(FORMAT(Ink:TransportKosten, @N13`3)))
      END
  END
  
  IF Ink:ExtraKosten > 0 THEN
      IF LOC:Prijs = '' THEN
          LOC:Prijs = 'Extra kosten: ' & CLIP(LEFT(FORMAT(Ink:ExtraKosten, @N13`3)))&CHR(13)&CHR(10)&CLIP(Ink:ExtraKostenTekst)
      ELSE
          LOC:Prijs = CLIP(LOC:Prijs)&CHR(13)&CHR(10)& 'Extra-kosten: ' & CLIP(LEFT(FORMAT(Ink:ExtraKosten, @N13`3)))&CHR(13)&CHR(10)&CLIP(Ink:ExtraKostenTekst)
      END
  ELSE
      IF LOC:Prijs = '' THEN
          LOC:Prijs = CLIP(Ink:ExtraKostenTekst)
      ELSE
          LOC:Prijs = CLIP(LOC:Prijs)&CHR(13)&CHR(10)&CLIP(Ink:ExtraKostenTekst)
      END
  END
  
  ReturnValue = PARENT.TakeRecord()
  ! Verticale lijnen grote goedzetten
  SETTARGET(Report)
  IF IGB:BekijkenPrijzen <> 1 THEN
  	?LOC:Prijs{PROP:Hide} = 1
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
               Loc:TmpAtt='"'&Clip(Loc:TMPDirectory)&Shortpath('Inkoop' &'.pdf')&'"'
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
  
       Loc:Commando=Clip(Loc:Commando)& ' Subject="'& 'Inkoop' &'"'
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
  SELF.SetDocumentInfo('CW Report','VoorrRpt','ReportInkoop','ReportInkoop','','')
  SELF.SetPagesAsParentBookmark(False)
  SELF.SetScanCopyMode(False)
  SELF.CompressText   = True
  SELF.CompressImages = True

