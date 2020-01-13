

   MEMBER('VoorrRpt.clw')                                  ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABPRPDF.INC'),ONCE
   INCLUDE('ABREPORT.INC'),ONCE
   INCLUDE('abrppsel.inc'),ONCE

                     MAP
                       INCLUDE('VOORRRPT018.INC'),ONCE        !Local module procedure declarations
                     END


!!! <summary>
!!! Generated from procedure template - Report
!!! </summary>
ReportOverboeking PROCEDURE (PRM:PlanningID)

Progress:Thermometer BYTE                                  ! 
LOC:PlanningID       LONG                                  ! 
LOC:Product          STRING(512)                           ! 
LOC:Cel              STRING(512)                           ! 
LOC:Partij           STRING(512)                           ! 
LOC:Planning         STRING(255)                           ! 
LOC:Transport        STRING(255)                           ! 
LOC:Instructie       STRING(255)                           ! 
Loc:SavePath         STRING(255)                           ! 
Loc:TMPDirectory     STRING(255)                           ! 
Loc:Commando         CSTRING(10000)                        ! 
Loc:TmpAtt           STRING(255)                           ! 
Loc:Landscape        BYTE                                  ! 
Loc:LandscapeOverride BYTE                                 ! 
Loc:MailButtonID     LONG                                  ! 
Process:View         VIEW(Planning)
                       PROJECT(Pla:PlanningID)
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
                         STRING('Details: {29}// overboeking'),AT(135,229),USE(?STRING1),FONT(,28,,FONT:regular+FONT:underline)
                         LINE,AT(21,927,7219,0),USE(?LINE1:12)
                       END
Detail                 DETAIL,AT(0,0,7292,6104),USE(?Detail)
                         LINE,AT(21,750,7220,0),USE(?LINE1)
                         LINE,AT(21,1500,7220,0),USE(?LINE1:2)
                         LINE,AT(21,2250,7220,0),USE(?LINE1:3)
                         LINE,AT(21,3000,7220,0),USE(?LINE1:4)
                         LINE,AT(21,3760,7220,0),USE(?LINE1:6)
                         LINE,AT(21,5260,7220,0),USE(?LINE1:7)
                         LINE,AT(21,6000,7220,0),USE(?LINE1:8)
                         STRING('Product:'),AT(146,115),USE(?STRING2),FONT('Times New Roman',14)
                         STRING('Partij:'),AT(146,906),USE(?STRING3),FONT('Times New Roman',14,,,CHARSET:ANSI)
                         STRING('Cel:'),AT(146,1635),USE(?STRING4),FONT('Times New Roman',14,,FONT:regular)
                         STRING('Planning:'),AT(146,2385,1750,250),USE(?STRING4:2),FONT('Times New Roman',14,,FONT:regular)
                         STRING('Transport:'),AT(146,3135,1750,250),USE(?STRING4:4),FONT('Times New Roman',14,,FONT:regular)
                         STRING('Instructie:'),AT(146,3896,1750,250),USE(?STRING4:5),FONT('Times New Roman',14,,FONT:regular)
                         STRING('Overige instructie:'),AT(146,5365,1750,250),USE(?STRING4:6),FONT('Times New Roman', |
  14,,FONT:regular)
                         TEXT,AT(2594,31,4531,687),USE(LOC:Product),FONT('Times New Roman',14),RESIZE
                         TEXT,AT(2615,2292,4510,687),USE(LOC:Planning),FONT('Times New Roman',14),RESIZE
                         TEXT,AT(2604,3052,4521,687),USE(LOC:Transport),FONT('Times New Roman',14),RESIZE
                         TEXT,AT(2604,3823,4521,1406),USE(LOC:Instructie),FONT('Times New Roman',14),RESIZE
                         LINE,AT(21,0,0),USE(?VertLine1),HIDE
                         LINE,AT(2521,0,0),USE(?VertLine2),HIDE
                         LINE,AT(7240,0,0),USE(?VertLine3),HIDE
                         TEXT,AT(2604,802,4531,687),USE(LOC:Partij),FONT('Times New Roman',14),RESIZE
                         TEXT,AT(2604,1542,4531,687),USE(LOC:Cel),FONT('Times New Roman',14),RESIZE
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
  GlobalErrors.SetProcedureName('ReportOverboeking')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  LOC:PlanningID = PRM:PlanningID
  Relate:AAACel.Open                                       ! File AAACel used by this procedure, so make sure it's RelationManager is open
  Relate:AACel.Open                                        ! File AACel used by this procedure, so make sure it's RelationManager is open
  Relate:Partij.Open                                       ! File Partij used by this procedure, so make sure it's RelationManager is open
  Relate:Planning.SetOpenRelated()
  Relate:Planning.Open                                     ! File Planning used by this procedure, so make sure it's RelationManager is open
  Relate:Verpakking.Open                                   ! File Verpakking used by this procedure, so make sure it's RelationManager is open
  Relate:ViewArtikel.Open                                  ! File ViewArtikel used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(ProgressWindow)                                ! Open window
  WinAlertMouseZoom()
  Do DefineListboxStyle
  INIMgr.Fetch('ReportOverboeking',ProgressWindow)         ! Restore window settings from non-volatile store
  TargetSelector.AddItem(PDFReporter.IReportGenerator)
  SELF.AddItem(TargetSelector)
  ProgressMgr.Init(ScrollSort:AllowNumeric,)
  ThisReport.Init(Process:View, Relate:Planning, ?Progress:PctText, Progress:Thermometer, ProgressMgr, Pla:PlanningID)
  ThisReport.AddSortOrder(Pla:PK_Planning)
  ThisReport.AddRange(Pla:PlanningID,LOC:PlanningID)
  SELF.AddItem(?Progress:Cancel,RequestCancelled)
  SELF.Init(ThisReport,Report,Previewer)
  ?Progress:UserString{PROP:Text} = ''
  Relate:Planning.SetQuickScan(1,Propagate:OneMany)
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
    Relate:AAACel.Close
    Relate:AACel.Close
    Relate:Partij.Close
    Relate:Planning.Close
    Relate:Verpakking.Close
    Relate:ViewArtikel.Close
  END
  IF SELF.Opened
    INIMgr.Update('ReportOverboeking',ProgressWindow)      ! Save window data to non-volatile store
  END
  ProgressMgr.Kill()
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.OpenReport PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  SYSTEM{PROP:PrintMode} = 3
  ReturnValue = PARENT.OpenReport()
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
  Access:Planning.TryFetch(Pla:PK_Planning)
  
  IF Pla:Planning_DATE > 0 THEN
  	EXECUTE 1+(Pla:Planning_DATE%7)
  		Loc:Planning = 'Zondag ' &Format(Pla:Planning_DATE,@d6-)
  		Loc:Planning = 'Maandag ' &Format(Pla:Planning_DATE,@d6-)
  		Loc:Planning = 'Dinsdag ' &Format(Pla:Planning_DATE,@d6-)
  		Loc:Planning = 'Woensdag ' &Format(Pla:Planning_DATE,@d6-)
  		Loc:Planning = 'Donderdag ' &Format(Pla:Planning_DATE,@d6-)
  		Loc:Planning = 'Vrijdag ' &Format(Pla:Planning_DATE,@d6-)
  		Loc:Planning = 'Zaterdag ' &Format(Pla:Planning_DATE,@d6-)
  	END	
  ELSE
  	Loc:Planning = ''
  .
  
  Clear(Loc:Product)
  Clear(Loc:Instructie)
  Clear(Loc:Transport)
  		
  Clear(Art:Record)
  Art:ArtikelID=Pla:ArtikelID
  Access:ViewArtikel.Fetch(Art:Artikel_PK)
  Clear(Ver:Record)
  Ver:VerpakkingID = Pla:VerpakkingID
  Access:Verpakking.Fetch(Ver:Verpakking_PK)
  if Loc:Product =''
  	Loc:Product = LEFT(Format(Pla:KG,@n-13`2)&' '&Art:ArtikelOms&' '&Ver:VerpakkingOmschrijving)
  ELSE
  	Loc:Product = Clip(Loc:Product)&CHR(13)&CHR(10)&LEFT(Format(Pla:KG,@n-13`2)&' '&Art:ArtikelOms&' '&Ver:VerpakkingOmschrijving)
  END
  
  IF Pla:PartijID > 0 THEN
  	CLEAR(Par:Record)
  	Par:PartijID = Pla:PartijID
  	Access:Partij.TryFetch(Par:Partij_PK)
  	IF Par:ExternPartijnr = 0 
  		Loc:Product = Clip(Loc:Product)&' (Partij:'&Pla:PartijID&')'
  	ELSE
  		Loc:Product = Clip(Loc:Product)&' (Partij:'&Pla:PartijID&'/Extern partij:'&Par:ExternPartijnr&')'
  	.
  .
  
  IF GLO:HidePlanningInstructie = 0 THEN
      IF Loc:Instructie=''
          Loc:Instructie = CLIP(Pla:Instructie)
      ELSE
          Loc:Instructie = CLIP(Loc:Instructie)&CHR(13)&CHR(10)&CLIP(Pla:Instructie)
      END
  END
  
  IF CLIP(Loc:Transport)=''
  	Loc:Transport = CLIP(Pla:Transport)
  ELSE
  	! Geen twee transport instructies
  	!Loc:Transport = Loc:Transport &CHR(13)&CHR(10)& Pla:Transport
  END
  
  CLEAR(AACEL:Record)
  AACel:CelID=Pla:CelID
  Access:AACel.TryFetch(AACel:CEL_PK)
  
  CLEAR(AAACel:Record)
  AAACel:CelID=Pla:OverboekingCelID
  Access:AAACel.TryFetch(AAACel:CEL_PK)
  
  CLEAR(Par:Record)
  Par:PartijID=Pla:PartijID
  Access:Partij.TryFetch(Par:Partij_PK)
  
  ! cel;partij;product;planning;memo;instrctie
  LOC:Cel = CLIP(AACel:CelOms) & ' => ' & CLIP(AAACel:CelOms)
  IF Par:ExternPartijnr > 0 THEN
  	LOC:Partij = FORMAT(Par:PartijID,@n_10B) & ' /  Extern: ' & FORMAT(Par:ExternPartijnr,@n_10B)
  ELSE
  	LOC:Partij = FORMAT(Par:PartijID,@n_10B)
  .
  ReturnValue = PARENT.TakeRecord()
  ! Verticale lijnen grote goedzetten
  !SETTARGET(Report)
  !?VertLine1{PROP:Height} = ?LastLine{PROP:Ypos}
  !?VertLine2{PROP:Height} = ?LastLine{PROP:Ypos}
  !?VertLine3{PROP:Height} = ?LastLine{PROP:Ypos}
  !SETTARGET()
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
               Loc:TmpAtt='"'&Clip(Loc:TMPDirectory)&Shortpath('Overboeking' &'.pdf')&'"'
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
  
       Loc:Commando=Clip(Loc:Commando)& ' Subject="'& 'Overboeking' &'"'
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
  SELF.SetDocumentInfo('CW Report','VoorrRpt','ReportOverboeking','ReportOverboeking','','')
  SELF.SetPagesAsParentBookmark(False)
  SELF.SetScanCopyMode(False)
  SELF.CompressText   = True
  SELF.CompressImages = True

