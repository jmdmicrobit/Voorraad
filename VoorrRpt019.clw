

   MEMBER('VoorrRpt.clw')                                  ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABPRPDF.INC'),ONCE
   INCLUDE('ABREPORT.INC'),ONCE
   INCLUDE('abrppsel.inc'),ONCE

                     MAP
                       INCLUDE('VOORRRPT019.INC'),ONCE        !Local module procedure declarations
                     END


!!! <summary>
!!! Generated from procedure template - Report
!!! </summary>
ReportVerkoopMutaties PROCEDURE (PRM:VerkoopID)

udpt            UltimateDebugProcedureTracker
Progress:Thermometer BYTE                                  ! 
LOC:VerkoopID        LONG                                  ! 
LOC:Naam             STRING(250)                           ! 
LOC:Product          STRING(512)                           ! 
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
Process:View         VIEW(Verkoop)
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
                         STRING('Details: {31}// verkoop '),AT(146,219),USE(?STRING1),FONT(,28,,FONT:regular+FONT:underline)
                         LINE,AT(21,927,7219,0),USE(?LINE1:12)
                         STRING(@n_10),AT(6302,31),USE(Ver2:VerkoopID),RIGHT
                       END
KopDetail              DETAIL,AT(0,0,7292,1990),USE(?Detail)
                         STRING('Product(en):'),AT(187,1479),USE(?STRING3),FONT('Arial',26,,FONT:regular+FONT:underline, |
  CHARSET:ANSI)
                         TEXT,AT(156,31,7094,344),USE(LOC:Planning),FONT('Arial',14),RESIZE
                         TEXT,AT(156,437,7094,687),USE(LOC:Naam),FONT('Arial',14),RESIZE
                       END
ProductDetail          DETAIL,AT(0,0,7302,458),USE(?DETAIL1)
                         TEXT,AT(167,31,7094,333),USE(LOC:Product,,?LOC:Product:2),FONT('Arial',14),RESIZE
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
? DEBUGHOOK(Partij:Record)
? DEBUGHOOK(Planning:Record)
? DEBUGHOOK(Verkoop:Record)
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
        udpt.Init(UD,'ReportVerkoopMutaties','VoorrRpt019.clw','VoorrRpt.DLL','06/28/2024 @ 02:30PM')    
             
  GlobalErrors.SetProcedureName('ReportVerkoopMutaties')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  db.DebugOut('ReportVerkoopMutaties1')
  LOC:VerkoopID = PRM:VerkoopID
  Relate:Partij.Open                                       ! File Partij used by this procedure, so make sure it's RelationManager is open
  Relate:Planning.SetOpenRelated()
  Relate:Planning.Open                                     ! File Planning used by this procedure, so make sure it's RelationManager is open
  Relate:Verpakking.Open                                   ! File Verpakking used by this procedure, so make sure it's RelationManager is open
  Relate:ViewArtikel.Open                                  ! File ViewArtikel used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(ProgressWindow)                                ! Open window
  Do DefineListboxStyle
  ProgressWindow{Prop:Alrt,255} = CtrlShiftP
  INIMgr.Fetch('ReportVerkoopMutaties',ProgressWindow)     ! Restore window settings from non-volatile store
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


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:Partij.Close
    Relate:Planning.Close
    Relate:Verpakking.Close
    Relate:ViewArtikel.Close
  END
  IF SELF.Opened
    INIMgr.Update('ReportVerkoopMutaties',ProgressWindow)  ! Save window data to non-volatile store
  END
  ProgressMgr.Kill()
  GlobalErrors.SetProcedureName
            
   
  IF BAND(Keystate(),KeyStateUD:Shift) 
        UD.ShowProcedureInfo('ReportVerkoopMutaties',UD.SetApplicationName('VoorrRpt','DLL'),ProgressWindow{PROP:Hlp},'09/14/2011 @ 02:03PM','06/28/2024 @ 02:30PM','10/11/2024 @ 01:54PM')  
    
  END
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
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue


ThisReport.TakeRecord PROCEDURE

ReturnValue          BYTE,AUTO

SkipDetails BYTE
  CODE
  db.DebugOut('VerkoopMutaties2:' & Ver2:VerkoopID) 
  Access:Verkoop.TryFetch(Ver2:PK_Verkoop)
  
  LOC:Naam = CLIP(ARel:FirmaNaam)
  
  CLEAR(RAD:Record)
  RAD:ID=Ver2:KlantAlternatiefAdres
  IF Ver2:KlantAlternatiefAdres > 0 AND (Access:RelatieAdres.TryFetch(RAD:PK_RelatieAdres) = Level:Benign)
  	LOC:Naam = CLIP(LOC:Naam) & CHR(13)&CHR(10)& CLIP(RAD:Adres1)
  	IF CLIP(RAD:Adres2) <> '' THEN
  		LOC:Naam = CLIP(LOC:Naam) & CHR(13)&CHR(10)& CLIP(RAD:Adres2)
  	END
  	LOC:Naam = CLIP(LOC:Naam) & CHR(13)&CHR(10)& CLIP(RAD:Postcode)&' '&CLIP(RAD:Plaats)
  	IF CLIP(RAD:Land) <> '' THEN
  		LOC:Naam = CLIP(LOC:Naam) & CHR(13)&CHR(10)& CLIP(RAD:Land)
  	END
  	LOC:Naam = CLIP(LOC:Naam) & CHR(13)&CHR(10)& CLIP(RAD:Fax)
  ELSE
  	LOC:Naam = CLIP(LOC:Naam) & CHR(13)&CHR(10)& CLIP(Rel:Adres1)
  	IF CLIP(Rel:Adres2) <> '' THEN
  		LOC:Naam = CLIP(LOC:Naam) & CHR(13)&CHR(10)& CLIP(Rel:Adres2)
  	END
  	LOC:Naam = CLIP(LOC:Naam) & CHR(13)&CHR(10)& CLIP(Rel:Postcode)&' '&CLIP(Rel:Plaats)
  	IF CLIP(Rel:Country) <> '' THEN
  		LOC:Naam = CLIP(LOC:Naam) & CHR(13)&CHR(10)& CLIP(Rel:Country)
  	END
  	LOC:Naam = CLIP(LOC:Naam) & CHR(13)&CHR(10)& CLIP(Rel:Fax)
  .
  
  IF Ver2:Planning_DATE > 0 THEN
  	EXECUTE 1+(Ver2:Planning_DATE%7)
  		Loc:Planning = 'Zondag ' &Format(Ver2:Planning_DATE,@d6-)
  		Loc:Planning = 'Maandag ' &Format(Ver2:Planning_DATE,@d6-)
  		Loc:Planning = 'Dinsdag ' &Format(Ver2:Planning_DATE,@d6-)
  		Loc:Planning = 'Woensdag ' &Format(Ver2:Planning_DATE,@d6-)
  		Loc:Planning = 'Donderdag ' &Format(Ver2:Planning_DATE,@d6-)
  		Loc:Planning = 'Vrijdag ' &Format(Ver2:Planning_DATE,@d6-)
  		Loc:Planning = 'Zaterdag ' &Format(Ver2:Planning_DATE,@d6-)
  	END	
  ELSE
  	Loc:Planning = ''
  .
  
  PRINT(RPT:KopDetail)  
  
  Clear(Loc:Product)
  !Clear(Loc:Memo)
  Clear(Loc:Instructie)
  Clear(Loc:Transport)
  		
  Clear(Pla:Record)
  Pla:VerkoopID = Ver2:VerkoopID
  Set(Pla:Planning_FK02,Pla:Planning_FK02)
  Loop until Access:Planning.Next()
      If not Pla:VerkoopID = Ver2:VerkoopID Then Break.
      CLEAR(LOC:Product)
        
      Clear(Art:Record)
      Art:ArtikelID=Pla:ArtikelID
      Access:ViewArtikel.Fetch(Art:Artikel_PK)
      Clear(Ver:Record)
      Ver:VerpakkingID = Pla:VerpakkingID
      Access:Verpakking.Fetch(Ver:Verpakking_PK)
      
      IF Ver:VerpakkingOmschrijving <> '' THEN
          Loc:Product = Clip(Loc:Product)&LEFT(Format(Pla:KG,@n-13`2)&' kg X '&CLIP(Art:ArtikelOms)&', '&CLIP(Ver:VerpakkingOmschrijving))
      ELSE
          Loc:Product = Clip(Loc:Product)&LEFT(Format(Pla:KG,@n-13`2)&' kg X '&CLIP(Art:ArtikelOms))
      .
      
      IF Pla:PartijID > 0 THEN
          db.DebugOut('VerkoopMutaties3:' & Pla:PartijID) 		
          CLEAR(Par:Record)
          Par:PartijID = Pla:PartijID
          IF (Access:Partij.TryFetch(Par:Partij_PK) <> Level:Benign) THEN
              CLEAR(Par:Record)
          END
          
          IF Par:ExternPartijnr = 0 
              Loc:Product = Clip(Loc:Product)& CHR(13)&CHR(10)&' Partij:'&Pla:PartijID
          ELSE
              Loc:Product = Clip(Loc:Product)& CHR(13)&CHR(10)&' Partij:'&Pla:PartijID&' / Extern partij:'&Par:ExternPartijnr
          .
          
          db.DebugOut('VerkoopMutaties4:' & Pla:PartijID) 		
      .
      
      IF CLIP(Pla:Transport) <> ''
          Loc:Product = Clip(Loc:Product) & CHR(13)&CHR(10)&CLIP(Pla:Transport)
      .
          
      IF CLIP(LOC:Product) <> '' THEN
          PRINT(RPT:ProductDetail)
      END
  END
  
  db.DebugOut('VerkoopMutaties5:' & Ver2:VerkoopID) 
  ReturnValue = PARENT.TakeRecord()
  IF FALSE
  PRINT(RPT:KopDetail)
  PRINT(RPT:ProductDetail)
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
               Loc:TmpAtt='"'&Clip(Loc:TMPDirectory)&Shortpath('Mutaties' &'.pdf')&'"'
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
  
       Loc:Commando=Clip(Loc:Commando)& ' Subject="'& 'Mutaties' &'"'
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
  SELF.SetDocumentInfo('CW Report','VoorrRpt','ReportVerkoopMutaties','ReportVerkoopMutaties','','')
  SELF.SetPagesAsParentBookmark(False)
  SELF.SetScanCopyMode(False)
  SELF.CompressText   = True
  SELF.CompressImages = True

