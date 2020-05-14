

   MEMBER('VoorrRpt.clw')                                  ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABPRPDF.INC'),ONCE
   INCLUDE('ABREPORT.INC'),ONCE
   INCLUDE('abrppsel.inc'),ONCE

                     MAP
                       INCLUDE('VOORRRPT006.INC'),ONCE        !Local module procedure declarations
                     END


!!! <summary>
!!! Generated from procedure template - Report
!!! </summary>
ReportPlanning PROCEDURE (Datum)

udpt            UltimateDebugProcedureTracker
Progress:Thermometer BYTE                                  ! 
LOC:Datum            LONG                                  ! 
LOC:Printed          BYTE                                  ! 
LOC:DetailDatum      STRING(100)                           ! 
LOC:MagazijnPrinter  STRING(255)                           ! 
SAV:Printer          CSTRING(199)                          ! 
Loc:SavePath         STRING(255)                           ! 
Loc:TMPDirectory     STRING(255)                           ! 
Loc:Commando         CSTRING(10000)                        ! 
Loc:TmpAtt           STRING(255)                           ! 
Loc:Landscape        BYTE                                  ! 
Loc:LandscapeOverride BYTE                                 ! 
Loc:MailButtonID     LONG                                  ! 
Process:View         VIEW(Cel)
                       PROJECT(CEL:CelID)
                     END
LocEnableEnterByTab  BYTE(1)                               !Used by the ENTER Instead of Tab template
EnterByTabManager    EnterByTabClass
ProgressWindow       WINDOW('Progress...'),AT(,,142,59),DOUBLE,CENTER,GRAY,TIMER(1)
                       PROGRESS,AT(15,15,111,12),USE(Progress:Thermometer),RANGE(0,100)
                       STRING(''),AT(0,3,141,10),USE(?Progress:UserString),CENTER
                       STRING(''),AT(0,30,141,10),USE(?Progress:PctText),CENTER
                       BUTTON('Cancel'),AT(45,42,50,15),USE(?Progress:Cancel)
                     END

Report               REPORT,AT(448,521,10896,7135),PRE(RPT),PAPER(PAPER:A4),LANDSCAPE,FONT('Arial',8,,FONT:regular, |
  CHARSET:DEFAULT),THOUS
                       HEADER,AT(31,0,11625,531),USE(?Header)
                       END
DetailOverboekingPlanning DETAIL,AT(0,0,10896,125),USE(?Detail)
                         STRING(@t7),AT(1646,-1062),USE(Pla:Planning_TIME)
                         STRING(@t7),AT(1667,-31),USE(Pla:Planning_TIME,,?Pla:Planning_TIME:2)
                         STRING(@n-13`2),AT(2021,-31),USE(Pla:KG),RIGHT
                         STRING(@n-14.),AT(2896,-31,729),USE(Pla:Pallets),RIGHT
                         CHECK('Verwerkt:'),AT(5083,-1145),USE(Pla:Verwerkt,,?Pla:Verwerkt:2)
                         CHECK,AT(5250,-31),USE(Pla:Verwerkt,,?Pla:Verwerkt:3)
                         STRING(@s60),AT(5646,-31,1552),USE(Art:ArtikelOms,,?Art:ArtikelOms:3)
                         STRING(@s100),AT(7552,-1093),USE(Pla:Instructie),DECIMAL
                         STRING(@s100),AT(7281,-31,1979),USE(Pla:Instructie,,?Pla:Instructie:2),LEFT
                         STRING(@s100),AT(9292,-31,1500),USE(Pla:Transport),LEFT
                         STRING(@s50),AT(3896,-31,625),USE(ACel:CelOms)
                         STRING(@s50),AT(4562,-31,625),USE(AACel:CelOms)
                       END
DetailVerkoopPlanning  DETAIL,AT(0,0,10896,125),USE(?DETAIL5)
                         STRING(@s50),AT(62,-31,1521),USE(Rel:FirmaNaam,,?Rel:FirmaNaam:2),LEFT
                         STRING(@n-14.),AT(2896,-31,729),USE(Pla3:Pallets),RIGHT
                         STRING(@n-13`2),AT(2021,-31,812,167),USE(Pla3:KG),RIGHT
                         STRING(@s100),AT(7281,-31,1979),USE(Pla3:Instructie)
                         STRING(@s100),AT(9292,-31,1500),USE(Pla3:Transport)
                         STRING(@s60),AT(5646,-31,1552),USE(Art:ArtikelOms,,?Art:ArtikelOms:2)
                         CHECK,AT(5250,-31),USE(Pla3:Verwerkt)
                         CHECK,AT(4781,-31),USE(Pla3:Geprint)
                       END
DetailInkoopPlanning   DETAIL,AT(0,0,10896,125),USE(?DETAIL4)
                         STRING(@t7),AT(1594,-21),USE(Pla2:Planning_TIME),RIGHT
                         STRING(@s50),AT(62,-21,1521),USE(Rel:FirmaNaam),LEFT
                         STRING(@n-13`2),AT(2021,-21,812),USE(Pla2:KG),RIGHT
                         STRING(@n-14.),AT(2896,-21,729,156),USE(Pla2:Pallets),RIGHT
                         STRING(@s100),AT(7281,-21,1979),USE(Pla2:Instructie)
                         STRING(@s100),AT(9292,-21,1500),USE(Pla2:Transport)
                         STRING(@s60),AT(5646,-21,1552),USE(Art:ArtikelOms)
                         CHECK,AT(5250,-42),USE(Pla2:Verwerkt,,?Pla2:Verwerkt:2)
                         CHECK,AT(4781,-42),USE(Pla2:Geprint,,?Pla2:Geprint:2)
                         CHECK,AT(4187,-42),USE(Pla2:MutatieGemaakt,,?Pla2:Ingeslagen:2)
                       END
DetailInkoopPlanningKop DETAIL,AT(0,0,10896,240),USE(?DETAIL3)
                         STRING('Klant'),AT(62,10),USE(?STRING1)
                         STRING('Laadtijd'),AT(1583,31),USE(?STRING2)
                         STRING('KG'),AT(2635,10),USE(?STRING3)
                         STRING('Pallets'),AT(3104,10,521,198),USE(?STRING4),RIGHT
                         STRING('Ingeslagen'),AT(3937,10),USE(?STRING5)
                         STRING('Gepr.'),AT(4687,10),USE(?STRING6)
                         STRING('Verw.'),AT(5198,10),USE(?STRING7)
                         STRING('Product'),AT(5646,10,615,208),USE(?STRING8)
                         STRING('Instructie'),AT(7281,10),USE(?STRING9)
                         STRING('Transport'),AT(9292,10),USE(?STRING10)
                         LINE,AT(52,177,10687,0),USE(?LINE1)
                       END
DetailVerkoopPlanningKop DETAIL,AT(0,0,10896,240),USE(?DETAIL3:2)
                         STRING('Klant'),AT(62,10),USE(?STRING1:2)
                         STRING('Laadtijd'),AT(1583,31),USE(?STRING2:2)
                         STRING('KG'),AT(2635,10),USE(?STRING3:2)
                         STRING('Pallets'),AT(3104,10,521,198),USE(?STRING4:2),RIGHT
                         STRING('Gepr.'),AT(4687,10),USE(?STRING6:2)
                         STRING('Verw.'),AT(5198,10),USE(?STRING7:2)
                         STRING('Product'),AT(5646,10,615,208),USE(?STRING8:2)
                         STRING('Instructie'),AT(7281,10),USE(?STRING9:2)
                         STRING('Transport'),AT(9292,10),USE(?STRING10:2)
                         LINE,AT(52,187,10687,0),USE(?LINE1:2)
                       END
DetailKop              DETAIL,AT(0,0,10896,260),USE(?DETAIL2)
                         STRING(@s100),AT(62,42,7365),USE(LOC:DetailDatum,,?LOC:DetailDatum:3),FONT(,,,FONT:bold)
                       END
DetailDatum            DETAIL,AT(0,0,10896,208),USE(?DETAIL1)
                         STRING(@s100),AT(62,10,7500),USE(LOC:DetailDatum)
                       END
DetailOverboekingPlanningKop DETAIL,AT(0,0,10896,240),USE(?DETAIL3:3)
                         STRING('Klant'),AT(62,0),USE(?STRING1:3)
                         STRING('Laadtijd'),AT(1583,21),USE(?STRING2:3)
                         STRING('KG'),AT(2635,0),USE(?STRING3:3)
                         STRING('Pallets'),AT(3104,0,521,198),USE(?STRING4:3),RIGHT
                         STRING('Naar Cel'),AT(4615,0),USE(?STRING6:3)
                         STRING('Verw.'),AT(5198,0),USE(?STRING7:3)
                         STRING('Product'),AT(5646,0,615,208),USE(?STRING8:3)
                         STRING('Instructie'),AT(7281,0),USE(?STRING9:3)
                         STRING('Transport'),AT(9292,0),USE(?STRING10:3)
                         LINE,AT(52,187,10687,0),USE(?LINE1:3)
                         STRING('Van Cel'),AT(3969,10),USE(?STRING11)
                       END
                       FOOTER,AT(31,7719,11625,500),USE(?Footer)
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
Close                  PROCEDURE(),DERIVED
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
        udpt.Init(UD,'ReportPlanning','VoorrRpt006.clw','VoorrRpt.DLL','05/14/2020 @ 05:27PM')    
             
  GlobalErrors.SetProcedureName('ReportPlanning')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:AACel.Open                                        ! File AACel used by this procedure, so make sure it's RelationManager is open
  Relate:ACel.Open                                         ! File ACel used by this procedure, so make sure it's RelationManager is open
  Relate:Cel.SetOpenRelated()
  Relate:Cel.Open                                          ! File Cel used by this procedure, so make sure it's RelationManager is open
  Relate:Planning.SetOpenRelated()
  Relate:Planning.Open                                     ! File Planning used by this procedure, so make sure it's RelationManager is open
  Relate:PlanningInkoop.Open                               ! File PlanningInkoop used by this procedure, so make sure it's RelationManager is open
  Relate:PlanningVerkoop.Open                              ! File PlanningVerkoop used by this procedure, so make sure it's RelationManager is open
  Relate:ViewArtikel.Open                                  ! File ViewArtikel used by this procedure, so make sure it's RelationManager is open
  Access:Relatie.UseFile                                   ! File referenced in 'Other Files' so need to inform it's FileManager
  SELF.FilesOpened = True
  	LOC:Datum = Datum
  	LOC:Printed = false
  
  	Loc:MagazijnPrinter=GETINI('Printer','Magazijn',,'.\Voorraad.ini')
  SELF.Open(ProgressWindow)                                ! Open window
  WinAlertMouseZoom()
  Do DefineListboxStyle
  ProgressWindow{Prop:Alrt,255} = CtrlShiftP
  INIMgr.Fetch('ReportPlanning',ProgressWindow)            ! Restore window settings from non-volatile store
  TargetSelector.AddItem(PDFReporter.IReportGenerator)
  SELF.AddItem(TargetSelector)
  ProgressMgr.Init(ScrollSort:AllowNumeric,)
  ThisReport.Init(Process:View, Relate:Cel, ?Progress:PctText, Progress:Thermometer, ProgressMgr, CEL:CelID)
  ThisReport.AddSortOrder(CEL:CEL_PK)
  SELF.AddItem(?Progress:Cancel,RequestCancelled)
  SELF.Init(ThisReport,Report,Previewer)
  ?Progress:UserString{PROP:Text} = ''
  Relate:Cel.SetQuickScan(1,Propagate:OneMany)
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
    Relate:AACel.Close
    Relate:ACel.Close
    Relate:Cel.Close
    Relate:Planning.Close
    Relate:PlanningInkoop.Close
    Relate:PlanningVerkoop.Close
    Relate:ViewArtikel.Close
  END
  IF SELF.Opened
    INIMgr.Update('ReportPlanning',ProgressWindow)         ! Save window data to non-volatile store
  END
  ProgressMgr.Kill()
  GlobalErrors.SetProcedureName
            
   
  IF BAND(Keystate(),KeyStateUD:Shift) 
        UD.ShowProcedureInfo('ReportPlanning',UD.SetApplicationName('VoorrRpt','DLL'),ProgressWindow{PROP:Hlp},'06/10/2011 @ 11:53AM','05/14/2020 @ 05:27PM','05/15/2020 @ 11:19AM')  
    
  END
  RETURN ReturnValue


ThisWindow.OpenReport PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  SYSTEM{PROP:PrintMode} = 3
  	SAV:Printer=PRINTER{PROPPRINT:Device}
  	IF Loc:MagazijnPrinter<>''
  		PRINTER{PROPPRINT:Device}=Loc:MagazijnPrinter
      End
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


ThisReport.Close PROCEDURE

  CODE
  PARENT.Close
      IF SAV:Printer<>''
  		PRINTER{PROPPRINT:Device}=SAV:Printer
  	END


ThisReport.TakeRecord PROCEDURE

ReturnValue          BYTE,AUTO

SkipDetails BYTE
  CODE
  ReturnValue = PARENT.TakeRecord()
  IF False THEN
  PRINT(RPT:DetailOverboekingPlanning)
  PRINT(RPT:DetailVerkoopPlanning)
  PRINT(RPT:DetailInkoopPlanning)
  PRINT(RPT:DetailInkoopPlanningKop)
  PRINT(RPT:DetailVerkoopPlanningKop)
  PRINT(RPT:DetailKop)
  PRINT(RPT:DetailDatum)
  PRINT(RPT:DetailOverboekingPlanningKop)
  ELSE
  IF GLO:HidePlanningInstructie = 1 THEN
      ?Pla:Instructie{PROP:Visible} = FALSE
      ?Pla:Instructie:2{PROP:Visible} = FALSE
      ?Pla2:Instructie{PROP:Visible} = FALSE
      ?Pla3:Instructie{PROP:Visible} = FALSE
      ?STRING9{PROP:Visible} = FALSE
      ?STRING9:2{PROP:Visible} = FALSE
      ?STRING9:3{PROP:Visible} = FALSE
  END
  		IF NOT(LOC:Printed)
  			Execute (Loc:DAtum%7 )+ 1
  				LOC:DetailDatum='Zondag '&Format(Loc:DAtum,@d6-) 
  				LOC:DetailDatum='Maandag '&Format(Loc:DAtum,@d6-) 
  				LOC:DetailDatum='Dinsdag '&Format(Loc:DAtum,@d6-) 
  				LOC:DetailDatum='Woensdag '&Format(Loc:DAtum,@d6-) 
  				LOC:DetailDatum='Donderdag '&Format(Loc:DAtum,@d6-) 
  				LOC:DetailDatum='Vrijdag '&Format(Loc:DAtum,@d6-) 
  				LOC:DetailDatum='Zaterdag '&Format(Loc:DAtum,@d6-) 
  			End	
  			PRINT(RPT:DetailDatum)
  
  			! Geplande inkopen
  			LOC:DetailDatum='Geplande inkopen'
  			PRINT(RPT:DetailKop)
  
  			PRINT(RPT:DetailInkoopPlanningKop)
  
  			CLEAR(Pla2:Record)
  			Pla2:Planning_DATE = Loc:Datum
  			SET(Pla2:Planning_FirmaNaam_K,Pla2:Planning_FirmaNaam_K)
  			LOOP UNTIL Access:PlanningInkoop.Next()
  				IF Pla2:Planning_DATE > LOC:Datum THEN BREAK.
  				
  				Rel:RelatieID=Pla2:Leverancier
  				Access:Relatie.TryFetch(Rel:Relatie_PK)
  
  				Art:ArtikelID=Pla2:ArtikelID
  				Access:ViewArtikel.TryFetch(Art:Artikel_PK)
  				
  				PRINT(RPT:DetailInkoopPlanning)
  			.
  			
  			! Overboekingen
  			LOC:DetailDatum='Overboekingen'
  			PRINT(RPT:DetailKop)
  
  			PRINT(RPT:DetailOverboekingPlanningKop)
  
  			CLEAR(Pla:Record)
  			Pla:Planning_DATE = Loc:Datum
  			SET(Pla:Datum_Tijd_K,Pla:Datum_Tijd_K)
  			LOOP UNTIL Access:Planning.Next()
  				IF Pla:Planning_DATE > LOC:Datum THEN BREAK.
  				
  				Art:ArtikelID=Pla:ArtikelID
  				Access:ViewArtikel.TryFetch(Art:Artikel_PK)
  				
  				ACel:CelID=Pla:CelID
  				Access:ACel.TryFetch(ACel:CEL_PK)
  				
  				AACel:CelID=Pla:OverboekingCelID
  				Access:AACel.TryFetch(AACel:CEL_PK)
  				
  				PRINT(RPT:DetailOverboekingPlanning)
  			.
  
  			! Geplande verkopen
  			LOC:DetailDatum='Geplande verkopen'
  			PRINT(RPT:DetailKop)
  
  			PRINT(RPT:DetailVerkoopPlanningKop)
  
  			CLEAR(Pla3:Record)
  			Pla3:Planning_DATE = Loc:Datum
  			SET(Pla3:Planning_FirmaNaam_K,Pla3:Planning_FirmaNaam_K)
  			LOOP UNTIL Access:PlanningVerkoop.Next()
  				IF Pla3:Planning_DATE > LOC:Datum THEN BREAK.
  				
  				Rel:RelatieID=Pla3:Klant
  				Access:Relatie.TryFetch(Rel:Relatie_PK)
  
  				Art:ArtikelID=Pla3:ArtikelID
  				Access:ViewArtikel.TryFetch(Art:Artikel_PK)
  				
  				PRINT(RPT:DetailVerkoopPlanning)
  			.
  			
  			LOC:Printed = true
  		.
  	.
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
               Loc:TmpAtt='"'&Clip(Loc:TMPDirectory)&Shortpath('Planning' &'.pdf')&'"'
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
  
       Loc:Commando=Clip(Loc:Commando)& ' Subject="'& 'Planning' &'"'
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
  SELF.SetDocumentInfo('CW Report','VoorrRpt','ReportPlanning','ReportPlanning','','')
  SELF.SetPagesAsParentBookmark(False)
  SELF.SetScanCopyMode(False)
  SELF.CompressText   = True
  SELF.CompressImages = True

