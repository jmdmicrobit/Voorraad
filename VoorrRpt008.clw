

   MEMBER('VoorrRpt.clw')                                  ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABPRPDF.INC'),ONCE
   INCLUDE('ABREPORT.INC'),ONCE
   INCLUDE('abrppsel.inc'),ONCE

                     MAP
                       INCLUDE('VOORRRPT008.INC'),ONCE        !Local module procedure declarations
                     END


!!! <summary>
!!! Generated from procedure template - Report
!!! </summary>
ReportInslag PROCEDURE 

Progress:Thermometer BYTE                                  ! 
LOC:InslagQATransportmiddelSchoon STRING(5)                ! 
LOC:InslagQAVerpakkingSchoonGesloten STRING(5)             ! 
LOC:InslagQAIdentificatieMerkenVerpakking STRING(5)        ! 
Loc:InslagQAisgeurkleuproducteigen STRING(5)               ! 
Loc:InslagQAGeenGlasbreuk STRING(5)                        ! 
Loc:SavePath         STRING(255)                           ! 
Loc:TMPDirectory     STRING(255)                           ! 
Loc:Commando         CSTRING(10000)                        ! 
Loc:TmpAtt           STRING(255)                           ! 
Loc:Landscape        BYTE                                  ! 
Loc:LandscapeOverride BYTE                                 ! 
Loc:MailButtonID     LONG                                  ! 
Process:View         VIEW(Partij)
                       PROJECT(Par:AanmaakDatum_DATE)
                       PROJECT(Par:AanmaakDatum_TIME)
                       PROJECT(Par:Afgehandeld)
                       PROJECT(Par:CorrectieveMaatregel)
                       PROJECT(Par:CorrigerendeMaatregel)
                       PROJECT(Par:ExternPartijnr)
                       PROJECT(Par:InslagQAActieAfwijkingen)
                       PROJECT(Par:InslagQATemperatuur1)
                       PROJECT(Par:InslagQATemperatuur2)
                       PROJECT(Par:InslagQATemperatuur3)
                       PROJECT(Par:InslagQATemperatuurVervoermiddel)
                       PROJECT(Par:InslagQAUitgevoerdDoor)
                       PROJECT(Par:KG)
                       PROJECT(Par:Pallets)
                       PROJECT(Par:PartijID)
                       PROJECT(Par:Referentie)
                       PROJECT(Par:VerpakkingID)
                       PROJECT(Par:Leverancier)
                       PROJECT(Par:CELID)
                       PROJECT(Par:ArtikelID)
                       JOIN(Ver:Verpakking_PK,Par:VerpakkingID)
                         PROJECT(Ver:VerpakkingOmschrijving)
                       END
                       JOIN(Rel:Relatie_PK,Par:Leverancier)
                         PROJECT(Rel:FirmaNaam)
                       END
                       JOIN(CEL:CEL_PK,Par:CELID)
                       END
                       JOIN(Art:Artikel_PK,Par:ArtikelID)
                         PROJECT(Art:ArtikelID)
                         PROJECT(Art:ArtikelOms)
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

Report               REPORT,AT(1000,2000,6250,7688),PRE(RPT),PAPER(PAPER:A4),FONT('Arial',10,,,CHARSET:ANSI),THOUS
                       HEADER,AT(1000,1000,6250,1000),USE(?Header)
                         STRING('Inslagrapport'),AT(240,354),USE(?STRING1),FONT(,20,,,CHARSET:DEFAULT)
                         STRING('Rapportagedatum:'),AT(2427,354),USE(?ReportDatePrompt),TRN
                         STRING('<<-- Date Stamp -->'),AT(3656,354),USE(?ReportDateStamp),TRN
                         STRING('<<-- Time Stamp -->'),AT(4927,354),USE(?ReportTimeStamp),TRN
                       END
Detail                 DETAIL,AT(0,0,6250,2635),USE(?Detail)
                         STRING(@n_10),AT(1625,354),USE(Par:PartijID)
                         STRING('Partij:'),AT(240,354),USE(?STRING2)
                         STRING('Inslagdatum:'),AT(240,615),USE(?STRING3)
                         STRING(@d17),AT(1625,615),USE(Par:AanmaakDatum_DATE)
                         STRING('Hoeveelheid:'),AT(3771,2073),USE(?STRING4)
                         STRING(@n-14`2~ KG~),AT(3406,2333),USE(Par:KG),RIGHT
                         STRING('Pallets: '),AT(5583,2073),USE(?STRING5)
                         STRING(@n-14`),AT(4948,2333),USE(Par:Pallets),RIGHT
                         STRING('Verpakking:'),AT(240,896),USE(?STRING6)
                         STRING(@s50),AT(1625,896,3771),USE(Ver:VerpakkingOmschrijving)
                         STRING('Leverancier:'),AT(240,1187),USE(?STRING7)
                         STRING(@s50),AT(1625,1187,3750),USE(Rel:FirmaNaam),LEFT
                         STRING('Artikel:'),AT(240,94),USE(?STRING9)
                         STRING(@s30),AT(1625,94,1000),USE(Art:ArtikelID)
                         STRING(@s60),AT(2760,94,3323),USE(Art:ArtikelOms)
                         STRING('Referentie:'),AT(240,1490),USE(?STRING11)
                         STRING(@s50),AT(1625,1458,3750),USE(Par:Referentie)
                         STRING('Extern partijnummer:'),AT(240,1771),USE(?STRING13)
                         STRING(@s20),AT(1625,1771),USE(Par:ExternPartijnr),LEFT(1)
                         STRING(@t7),AT(2427,615),USE(Par:AanmaakDatum_TIME)
                       END
detailAfgehandeld      DETAIL,AT(0,0,6250,562),USE(?DETAIL5)
                         TEXT,AT(240,292,5958,208),USE(Par:Afgehandeld),RESIZE
                         STRING('Afgehandeld:'),AT(240,31,1437,198),USE(?STRING15:6),FONT(,,,FONT:regular)
                       END
detailcorrigerendemaatregel DETAIL,AT(0,0,6250,552),USE(?DETAIL4)
                         TEXT,AT(240,292,5958,208),USE(Par:CorrigerendeMaatregel),RESIZE
                         STRING('Corrigerende maatregel:'),AT(240,31,1437,198),USE(?STRING15:5),FONT(,,,FONT:regular)
                       END
detailCorrectievemaatregel DETAIL,AT(0,0,6250,604),USE(?DETAIL3)
                         TEXT,AT(240,292,5958,208),USE(Par:CorrectieveMaatregel),RESIZE
                         STRING('Correctieve maatregel:'),AT(240,31,1437,198),USE(?STRING15:4),FONT(,,,FONT:regular)
                       END
KwaliteitDetail        DETAIL,AT(0,0,6250,2750),USE(?DETAIL2)
                         STRING(@s40),AT(1281,2000,4885),USE(Par:InslagQAUitgevoerdDoor)
                         STRING(@s20),AT(240,719),USE(Par:InslagQATemperatuur2)
                         STRING(@s20),AT(240,979),USE(Par:InslagQATemperatuur3)
                         TEXT,AT(240,2448,5958,208),USE(Par:InslagQAActieAfwijkingen),RESIZE
                         STRING('Kwaliteit'),AT(240,31),USE(?STRING5:2),FONT(,,,FONT:bold+FONT:underline)
                         STRING('Gemeten temperaturen:'),AT(240,250),USE(?STRING15),FONT(,,,FONT:regular)
                         STRING('Normale temperatuur moet -18°C zijn. Producten hoger als -15°C kunnen niet geac' & |
  'cepteerd worden.'),AT(240,1792,6062,198),USE(?STRING15:2),FONT(,10,,FONT:regular+FONT:italic, |
  CHARSET:DEFAULT)
                         STRING('Afwijking:'),AT(240,2219,1437,198),USE(?STRING15:3),FONT(,,,FONT:regular)
                         STRING(@s20),AT(240,479),USE(Par:InslagQATemperatuur1)
                         STRING('Uitgevoerd door:'),AT(240,2000),USE(?STRING10)
                         STRING(@s5),AT(5396,479),USE(LOC:InslagQATransportmiddelSchoon)
                         STRING(@s5),AT(5396,719),USE(LOC:InslagQAVerpakkingSchoonGesloten)
                         STRING(@s5),AT(5396,979),USE(LOC:InslagQAIdentificatieMerkenVerpakking)
                         STRING('Is transportmiddel schoon?'),AT(2375,479),USE(?STRING12)
                         STRING('Verpakking schoon en gesloten?'),AT(2375,719),USE(?STRING14)
                         STRING('Identificatie merken aanwezig op verpakkingen?'),AT(2375,979),USE(?STRING16)
                         STRING('Is kleur/geur producteigen?'),AT(2375,1240,2865,198),USE(?STRING16:2)
                         STRING('Geen glasbreuk?'),AT(2375,1500,2865,198),USE(?STRING16:3)
                         STRING(@s5),AT(5396,1240,510,198),USE(Loc:InslagQAisgeurkleuproducteigen)
                         STRING(@s5),AT(5396,1500,510,198),USE(Loc:InslagQAGeenGlasbreuk)
                         STRING(@s20),AT(240,1521,1531),USE(Par:InslagQATemperatuurVervoermiddel)
                         STRING('Temperatuur vervoermiddel'),AT(240,1229),USE(?STRING17)
                       END
MutatieDetail          DETAIL,AT(0,0,6250,354),USE(?DETAIL1)
                         STRING('Cel:'),AT(240,52),USE(?STRING8)
                         STRING(@s50),AT(698,52,2604),USE(ACel:CelOms),LEFT
                         STRING(@n-14`2~ KG~),AT(3406,52),USE(Mut:InslagKG,,?Mut:InslagKG:2),RIGHT
                         STRING(@n-14`),AT(4948,52),USE(Mut:InslagPallet,,?Mut:InslagPallet:3),RIGHT
                       END
                       FOOTER,AT(1000,9688,6250,1000),USE(?Footer)
                       END
                       FORM,AT(1000,1000,6250,9688),USE(?Form)
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
  GlobalErrors.SetProcedureName('ReportInslag')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:ACel.Open                                         ! File ACel used by this procedure, so make sure it's RelationManager is open
  Relate:Mutatie.Open                                      ! File Mutatie used by this procedure, so make sure it's RelationManager is open
  Relate:Partij.Open                                       ! File Partij used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(ProgressWindow)                                ! Open window
  WinAlertMouseZoom()
  Do DefineListboxStyle
  INIMgr.Fetch('ReportInslag',ProgressWindow)              ! Restore window settings from non-volatile store
  TargetSelector.AddItem(PDFReporter.IReportGenerator)
  SELF.AddItem(TargetSelector)
  ProgressMgr.Init(ScrollSort:AllowNumeric,)
  ThisReport.Init(Process:View, Relate:Partij, ?Progress:PctText, Progress:Thermometer, ProgressMgr, Par:PartijID)
  ThisReport.AddSortOrder(Par:Partij_PK)
  ThisReport.AddRange(Par:PartijID)
  SELF.AddItem(?Progress:Cancel,RequestCancelled)
  SELF.Init(ThisReport,Report,Previewer)
  ?Progress:UserString{PROP:Text} = ''
  Relate:Partij.SetQuickScan(1,Propagate:OneMany)
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
    Relate:ACel.Close
    Relate:Mutatie.Close
    Relate:Partij.Close
  END
  IF SELF.Opened
    INIMgr.Update('ReportInslag',ProgressWindow)           ! Save window data to non-volatile store
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
    SELF.Report $ ?ReportDateStamp{PROP:Text} = FORMAT(TODAY(),@D17)
  END
  IF ReturnValue = Level:Benign
    SELF.Report $ ?ReportTimeStamp{PROP:Text} = FORMAT(CLOCK(),@T7)
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
  ReturnValue = PARENT.TakeRecord()
  IF false THEN
  PRINT(RPT:Detail)
  PRINT(RPT:detailAfgehandeld)
  PRINT(RPT:detailcorrigerendemaatregel)
  PRINT(RPT:detailCorrectievemaatregel)
  PRINT(RPT:KwaliteitDetail)
  PRINT(RPT:MutatieDetail)
  END
  
  PRINT(RPT:Detail)
      
  Clear(Mut:Record)
  Mut:PartijID = Par:PartijID
  SET(Mut:Mutatie_FK01, Mut:Mutatie_FK01)
  LOOP
      db.DebugOut('ReportInslag:' & Mut:PartijID & '-' & Mut:SoortMutatie)
      IF NOT(Access:Mutatie.TryNext() = Level:Benign) THEN BREAK.
      IF NOT(Mut:PartijID = Par:PartijID) THEN BREAK.
      
      IF Mut:SoortMutatie = 'IN' THEN
          CLEAR(ACel:Record)
          ACel:CelID = Mut:CelID
          Access:ACel.TryFetch(ACel.CEL_PK)
  
          PRINT(RPT:MutatieDetail)
      .
  .
  
  IF Par:InslagQATransportmiddelSchoon THEN
      LOC:InslagQATransportmiddelSchoon = 'JA'
  ELSE
      LOC:InslagQATransportmiddelSchoon = 'NEE'
  END
  
  IF Par:InslagQAVerpakkingSchoonGesloten THEN
      LOC:InslagQAVerpakkingSchoonGesloten = 'JA'
  ELSE
      LOC:InslagQAVerpakkingSchoonGesloten = 'NEE'
  END
  
  IF Par:InslagQAIdentificatieMerkenVerpakking THEN
      LOC:InslagQAIdentificatieMerkenVerpakking = 'JA'
  ELSE
      LOC:InslagQAIdentificatieMerkenVerpakking = 'NEE'
  END
  
  IF Par:InslagQAIsGeurKleurProductEigen THEN
      Loc:InslagQAisgeurkleuproducteigen = 'JA'
  ELSE
      Loc:InslagQAisgeurkleuproducteigen = 'NEE'
  END
  
  IF Par:InslagQAGeenGlasbreuk THEN
      Loc:InslagQAGeenGlasbreuk = 'JA'
  ELSE
      Loc:InslagQAGeenGlasbreuk = 'NEE'
  END
      
  PRINT(RPT:KwaliteitDetail)
  PRINT(RPT:detailAfgehandeld)
  PRINT(RPT:detailcorrigerendemaatregel)
  PRINT(RPT:detailCorrectievemaatregel)
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
               Loc:TmpAtt='"'&Clip(Loc:TMPDirectory)&Shortpath('Inslag' &'.pdf')&'"'
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
  
       Loc:Commando=Clip(Loc:Commando)& ' Subject="'& 'Inslag' &'"'
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
  SELF.SetDocumentInfo('CW Report','VoorrRpt','ReportInslag','ReportInslag','','')
  SELF.SetPagesAsParentBookmark(False)
  SELF.SetScanCopyMode(False)
  SELF.CompressText   = True
  SELF.CompressImages = True

