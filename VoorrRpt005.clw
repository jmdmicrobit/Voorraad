

   MEMBER('VoorrRpt.clw')                                  ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABPRPDF.INC'),ONCE
   INCLUDE('ABREPORT.INC'),ONCE
   INCLUDE('abrppsel.inc'),ONCE

                     MAP
                       INCLUDE('VOORRRPT005.INC'),ONCE        !Local module procedure declarations
                     END


!!! <summary>
!!! Generated from procedure template - Report
!!! </summary>
ReportUitslag PROCEDURE 

udpt            UltimateDebugProcedureTracker
Progress:Thermometer BYTE                                  ! 
LOC:UitslagQATransportmiddelSchoon STRING(5)               ! 
LOC:UitslagQAVerpakkingSchoonGesloten STRING(5)            ! 
LOC:UitslagQAIdentificatieMerkenVerpakking STRING(5)       ! 
Loc:UitslagQAIsgeurkleurproducteigen STRING(5)             ! 
Loc:UitslagQAGeenglasbreuk STRING(5)                       ! 
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

Report               REPORT,AT(1000,1437,6250,9458),PRE(RPT),PAPER(PAPER:A4),FONT('Arial',10,,,CHARSET:ANSI),THOUS
                       HEADER,AT(1000,469,6250,1000),USE(?Header)
                         STRING('Uitslagrapport'),AT(240,354),USE(?STRING1),FONT(,20,,,CHARSET:DEFAULT)
                         STRING('Rapportagedatum:'),AT(2469,354),USE(?ReportDatePrompt),TRN
                         STRING('<<-- Date Stamp -->'),AT(3646,354),USE(?ReportDateStamp),TRN
                         STRING('<<-- Time Stamp -->'),AT(4927,354),USE(?ReportTimeStamp),TRN
                       END
Detail                 DETAIL,AT(0,0,6250,552),USE(?Detail)
                         STRING('Artikel:'),AT(240,271),USE(?STRING9)
                         STRING(@s30),AT(5302,271,1000),USE(Art:ArtikelID)
                         STRING(@s60),AT(1625,271,3750),USE(Art:ArtikelOms)
                         STRING('Klant:'),AT(260,73),USE(?STRING14)
                         STRING(@s50),AT(1625,73,4302),USE(AREL:FirmaNaam),LEFT
                       END
detailAfgehandeld      DETAIL,AT(0,0,6250,500),USE(?DETAIL5)
                         TEXT,AT(240,260,5958,208),USE(Mut:Afgehandeld),RESIZE
                         STRING('Afgehandeld'),AT(260,31,1437,198),USE(?STRING15:6)
                       END
detailCorrigerendeMaatregel DETAIL,AT(0,0,6250,542),USE(?DETAIL4)
                         TEXT,AT(240,292,5958,208),USE(Mut:CorrigerendeMaatregel),RESIZE
                         STRING('Corrigerende maatregel:'),AT(260,31,1437,198),USE(?STRING15:5)
                       END
detailcorrectievemaatregel DETAIL,AT(0,0,6250,531),USE(?DETAIL3)
                         TEXT,AT(240,292,5958,208),USE(Mut:CorrectieveMaatregel),RESIZE
                         STRING('Correctieve maatregel:'),AT(240,31,1437,198),USE(?STRING15:4)
                       END
KwaliteitDetail        DETAIL,AT(0,0,6250,2792),USE(?DETAIL2)
                         STRING(@s20),AT(240,469),USE(Mut:UitslagQATemperatuur1)
                         STRING(@s20),AT(240,719),USE(Mut:UitslagQATemperatuur2)
                         STRING(@s20),AT(240,979),USE(Mut:UitslagQATemperatuur3)
                         TEXT,AT(240,2542,5958,208),USE(Mut:UitslagQAActieAfwijkingen),RESIZE
                         STRING('Kwaliteit'),AT(240,31),USE(?STRING5),FONT(,,,FONT:bold+FONT:underline)
                         STRING('Gemeten temperaturen:'),AT(240,250),USE(?STRING15)
                         STRING('Normale temperatuur moet -18°C zijn. Producten hoger als -15°C kunnen niet geac' & |
  'cepteerd worden.'),AT(240,1792,6062,198),USE(?STRING15:2),FONT(,,,FONT:regular+FONT:italic)
                         STRING('Afwijking:'),AT(240,2312,1437,198),USE(?STRING15:3)
                         STRING(@s40),AT(1281,2052,3594),USE(Mut:UitslagQAUitgevoerdDoor)
                         STRING('Uitgevoerd door:'),AT(240,2052),USE(?STRING16)
                         STRING('Is transportmiddel schoon? '),AT(2427,469),USE(?STRING17)
                         STRING('Verpakking schoon en gesloten?'),AT(2427,719),USE(?STRING18)
                         STRING('Identificatie merken aanwezig op verpakkingen?'),AT(2427,979),USE(?STRING19)
                         STRING(@s5),AT(5500,469),USE(LOC:UitslagQATransportmiddelSchoon)
                         STRING(@s5),AT(5500,719),USE(LOC:UitslagQAVerpakkingSchoonGesloten)
                         STRING(@s5),AT(5500,979),USE(LOC:UitslagQAIdentificatieMerkenVerpakking)
                         STRING('Is geur/kleur producteigen?'),AT(2427,1250,2865,198),USE(?STRING19:2)
                         STRING('Geen glasbreuk?'),AT(2427,1531,2865,198),USE(?STRING19:3)
                         STRING(@s5),AT(5500,1250,510,198),USE(Loc:UitslagQAIsgeurkleurproducteigen)
                         STRING(@s5),AT(5500,1510,510,198),USE(Loc:UitslagQAGeenglasbreuk)
                         STRING(@s20),AT(240,1531),USE(Mut:UitslagQATemperatuurVervoermiddel)
                         STRING('Temperatuur Vervoermiddel:'),AT(240,1240,1771,198),USE(?STRING15:7)
                       END
MutatieDetail          DETAIL,AT(0,0,6250,1594),USE(?DETAIL1)
                         STRING(@n_10),AT(1625,135),USE(Par:PartijID),RIGHT
                         STRING('Uitslag:'),AT(240,1354),USE(?STRING8)
                         STRING(@s50),AT(1625,1354,1229),USE(ACel:CelOms),LEFT
                         STRING('Partij:'),AT(240,135),USE(?STRING2)
                         STRING(@n-14`2~ KG~),AT(3115,1354),USE(Mut:UitslagKG),RIGHT
                         STRING('Inslagdatum:'),AT(3115,125),USE(?STRING3)
                         STRING(@n-14`),AT(4302,1354,1104),USE(Mut:UitslagPallet),RIGHT
                         STRING(@d17),AT(4500,125),USE(Par:AanmaakDatum_DATE)
                         STRING(@d17),AT(1625,1135),USE(Mut:DatumTijd_DATE)
                         STRING(@t7),AT(2427,1135),USE(Mut:DatumTijd_TIME)
                         STRING('Uitslagdatum:'),AT(240,1135),USE(?STRING10)
                         STRING('Verpakking:'),AT(240,333),USE(?STRING6)
                         STRING(@s50),AT(1625,333,3771),USE(Ver:VerpakkingOmschrijving)
                         STRING('Leverancier:'),AT(240,531),USE(?STRING7)
                         STRING(@s50),AT(1625,531,3750),USE(AREL:FirmaNaam,,?ARel:FirmaNaam:2),LEFT
                         STRING('Referentie:'),AT(240,719),USE(?STRING11)
                         STRING(@s50),AT(1625,719,3750),USE(Par:Referentie)
                         STRING(@n-5.1),AT(1625,917),USE(Par:InslagQATemperatuur1),RIGHT(12)
                         STRING('Inslag temperatuur:'),AT(240,917),USE(?STRING12)
                         STRING('Extern partijnummer:'),AT(3115,979),USE(?STRING13)
                         STRING(@s20),AT(4437,979),USE(Par:ExternPartijnr),RIGHT(1)
                         STRING(@t7),AT(5302,125),USE(Par:AanmaakDatum_TIME)
                         LINE,AT(94,52,6062,0),USE(?LINE1)
                         STRING('Pallets'),AT(5552,1354),USE(?STRING4)
                       END
                       FOOTER,AT(1000,10875,6250,333),USE(?Footer)
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
        udpt.Init(UD,'ReportUitslag','VoorrRpt005.clw','VoorrRpt.DLL','05/14/2020 @ 05:27PM')    
             
  GlobalErrors.SetProcedureName('ReportUitslag')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:ACel.Open                                         ! File ACel used by this procedure, so make sure it's RelationManager is open
  Relate:ARelatie.Open                                     ! File ARelatie used by this procedure, so make sure it's RelationManager is open
  Relate:Cel.SetOpenRelated()
  Relate:Cel.Open                                          ! File Cel used by this procedure, so make sure it's RelationManager is open
  Relate:Mutatie.Open                                      ! File Mutatie used by this procedure, so make sure it's RelationManager is open
  Relate:Partij.Open                                       ! File Partij used by this procedure, so make sure it's RelationManager is open
  Relate:Planning.SetOpenRelated()
  Relate:Planning.Open                                     ! File Planning used by this procedure, so make sure it's RelationManager is open
  Relate:Verpakking.Open                                   ! File Verpakking used by this procedure, so make sure it's RelationManager is open
  Relate:ViewArtikel.Open                                  ! File ViewArtikel used by this procedure, so make sure it's RelationManager is open
  Access:Verkoop.UseFile                                   ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:Relatie.UseFile                                   ! File referenced in 'Other Files' so need to inform it's FileManager
  SELF.FilesOpened = True
  SELF.Open(ProgressWindow)                                ! Open window
  WinAlertMouseZoom()
  Do DefineListboxStyle
  ProgressWindow{Prop:Alrt,255} = CtrlShiftP
  INIMgr.Fetch('ReportUitslag',ProgressWindow)             ! Restore window settings from non-volatile store
  TargetSelector.AddItem(PDFReporter.IReportGenerator)
  SELF.AddItem(TargetSelector)
  ProgressMgr.Init(ScrollSort:AllowNumeric,)
  ThisReport.Init(Process:View, Relate:Planning, ?Progress:PctText, Progress:Thermometer, ProgressMgr, Pla:PlanningID)
  ThisReport.AddSortOrder(Pla:PK_Planning)
  ThisReport.AddRange(Pla:PlanningID)
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
    Relate:ACel.Close
    Relate:ARelatie.Close
    Relate:Cel.Close
    Relate:Mutatie.Close
    Relate:Partij.Close
    Relate:Planning.Close
    Relate:Verpakking.Close
    Relate:ViewArtikel.Close
  END
  IF SELF.Opened
    INIMgr.Update('ReportUitslag',ProgressWindow)          ! Save window data to non-volatile store
  END
  ProgressMgr.Kill()
  GlobalErrors.SetProcedureName
            
   
  IF BAND(Keystate(),KeyStateUD:Shift) 
        UD.ShowProcedureInfo('ReportUitslag',UD.SetApplicationName('VoorrRpt','DLL'),ProgressWindow{PROP:Hlp},'06/10/2011 @ 11:53AM','05/14/2020 @ 05:27PM','05/15/2020 @ 11:19AM')  
    
  END
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
  PRINT(RPT:detailCorrigerendeMaatregel)
  PRINT(RPT:detailcorrectievemaatregel)
  PRINT(RPT:KwaliteitDetail)
  PRINT(RPT:MutatieDetail)
  END
  
  first# = 1
  
  Clear(Mut:Record)
  Mut:PlanningID = Pla:PlanningID
  SET(Mut:Mutatie_FK02, Mut:Mutatie_FK02)
  LOOP UNTIL Access:Mutatie.Next()
      IF NOT(Mut:PlanningID = Pla:PlanningID) THEN BREAK.
      
      IF first# = 1 THEN
          CLEAR(Ver2:Record)
          Ver2:VerkoopID = Pla:VerkoopID
          Access:Verkoop.TryFetch(Ver2:PK_Verkoop)
  
          CLEAR(AREL:Record)
          AREL:RelatieID = Ver2:Klant
          Access:ARelatie.TryFetch(AREL:Relatie_PK)
          
          CLEAR(Art:Record)
          Art:ArtikelID = Mut:ArtikelID
          Access:ViewArtikel.TryFetch(Art:Artikel_PK)
          
          PRINT(RPT:Detail)
          
          first# = 0
      .
      
      CLEAR(Par:Record)
      Par:PartijID=Mut:PartijID
      Access:Partij.TryFetch(Par:Partij_PK)
      
      Ver:VerpakkingID=Par:VerpakkingID
      Access:Verpakking.TryFetch(Ver:Verpakking_PK)
      
      ARel:RelatieID = Par:Leverancier
      Access:ARelatie.TryFetch(AREL:Relatie_PK)
      
      CLEAR(ACel:Record)
      ACel:CelID = Mut:CelID
      Access:ACel.TryFetch(ACel.CEL_PK)
      
      PRINT(RPT:MutatieDetail)
  .
  
  ! Kwaliteit-gegevens van de eerste mutatie printen (andere mutaties hebben dezelfde kwaliteit-gegevens)
  Clear(Mut:Record)
  Mut:PlanningID = Pla:PlanningID
  SET(Mut:Mutatie_FK02, Mut:Mutatie_FK02)
  LOOP UNTIL Access:Mutatie.Next()
      IF NOT(Mut:PlanningID = Pla:PlanningID) THEN BREAK.
  
      IF Mut:UitslagQATransportmiddelSchoon THEN
          LOC:UitslagQATransportmiddelSchoon = 'JA'
      ELSE
          LOC:UitslagQATransportmiddelSchoon = 'NEE'
      END
      
      IF Mut:UitslagQAVerpakkingSchoonGesloten THEN
          LOC:UitslagQAVerpakkingSchoonGesloten = 'JA'
      ELSE
          LOC:UitslagQAVerpakkingSchoonGesloten = 'NEE'
      END
      
      IF Mut:UitslagQAIdentificatieMerkenVerpakking THEN
          LOC:UitslagQAIdentificatieMerkenVerpakking = 'JA'
      ELSE
          LOC:UitslagQAIdentificatieMerkenVerpakking = 'NEE'
      END
      
      IF Mut:UitslagQAIsGeurKleurProductEigen THEN
          Loc:UitslagQAIsgeurkleurproducteigen = 'JA'
      ELSE
          Loc:UitslagQAIsgeurkleurproducteigen = 'NEE'
      END
      IF Mut:UitslagQAGeenGlasbreuk THEN
          Loc:UitslagQAGeenglasbreuk = 'JA'
      ELSE
          Loc:UitslagQAGeenglasbreuk = 'NEE'
      END
      
      PRINT(RPT:KwaliteitDetail)
      PRINT(RPT:detailcorrectievemaatregel)
      PRINT(RPT:detailCorrigerendeMaatregel)
      PRINT(RPT:detailAfgehandeld)
      BREAK
  END
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
               Loc:TmpAtt='"'&Clip(Loc:TMPDirectory)&Shortpath('Uitslag' &'.pdf')&'"'
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
  
       Loc:Commando=Clip(Loc:Commando)& ' Subject="'& 'Uitslag' &'"'
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
  SELF.SetDocumentInfo('CW Report','VoorrRpt','ReportUitslag','ReportUitslag','','')
  SELF.SetPagesAsParentBookmark(False)
  SELF.SetScanCopyMode(False)
  SELF.CompressText   = True
  SELF.CompressImages = True

