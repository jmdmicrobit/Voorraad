

   MEMBER('VoorrRpt.clw')                                  ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABPRPDF.INC'),ONCE
   INCLUDE('ABREPORT.INC'),ONCE
   INCLUDE('abrppsel.inc'),ONCE

                     MAP
                       INCLUDE('VOORRRPT004.INC'),ONCE        !Local module procedure declarations
                     END


!!! <summary>
!!! Generated from procedure template - Report
!!! </summary>
ReportWeeglijst PROCEDURE (PRM:TypeID, PRM:ID)

Progress:Thermometer BYTE                                  ! 
LOC:AantalRecords    LONG                                  ! 
LOC:CountRecords     LONG                                  ! 
LOC:WeeglijstPrinter STRING(255)                           ! 
LOC:ID               LONG                                  ! 
LOC:TypeID           STRING(10)                            ! 
LOC:Adres1           STRING(100)                           ! 
LOC:Postcode         STRING(20)                            ! 
LOC:Plaats           STRING(100)                           ! 
LOC:GewichtTekst     STRING(40)                            ! 
LOC:PartijID         LONG                                  ! 
LOC:ExternPartijID   STRING(20)                            ! 
LOC:TotaalBrutoGewicht DECIMAL(9,2)                        ! 
LOC:TotaalNettoGewicht DECIMAL(9,2)                        ! 
LOC:TotaalTarraGewicht DECIMAL(9,2)                        ! 
SAV:Printer          CSTRING(200)                          ! 
LOC:WeeglijstKop     STRING(20)                            ! 
LOC:NR               LONG                                  ! 
LOC:WegTarra         STRING(20)                            ! 
Loc:DatumNu          DATE                                  ! 
Loc:TijdNu           TIME                                  ! 
LOC:ArtikelTotaal    QUEUE,PRE(LAT)                        ! 
ArtikelID            CSTRING(31)                           ! 
ArtikelOms           CSTRING(61)                           ! 
BrutoGewicht         DECIMAL(7,2)                          ! 
TarraGewicht         DECIMAL(9,2)                          ! 
NettoGewicht         DECIMAL(9,2)                          ! 
                     END                                   ! 
Loc:SavePath         STRING(255)                           ! 
Loc:TMPDirectory     STRING(255)                           ! 
Loc:Commando         CSTRING(10000)                        ! 
Loc:TmpAtt           STRING(255)                           ! 
Loc:Landscape        BYTE                                  ! 
Loc:LandscapeOverride BYTE                                 ! 
Loc:MailButtonID     LONG                                  ! 
Process:View         VIEW(Planning)
                       PROJECT(Pla:InkoopID)
                       PROJECT(Pla:PlanningID)
                       PROJECT(Pla:VerkoopID)
                       JOIN(Ver2:PK_Verkoop,Pla:VerkoopID)
                       END
                       JOIN(Ink:PK_Inkoop,Pla:InkoopID)
                       END
                     END
ReportPageNumber     LONG,AUTO
LocEnableEnterByTab  BYTE(1)                               !Used by the ENTER Instead of Tab template
EnterByTabManager    EnterByTabClass
ProgressWindow       WINDOW('Progress...'),AT(,,142,59),DOUBLE,CENTER,GRAY,TIMER(1)
                       PROGRESS,AT(15,15,111,12),USE(Progress:Thermometer),RANGE(0,100)
                       STRING(''),AT(0,3,141,10),USE(?Progress:UserString),CENTER
                       STRING(''),AT(0,30,141,10),USE(?Progress:PctText),CENTER
                       BUTTON('Cancel'),AT(45,42,50,15),USE(?Progress:Cancel)
                     END

Report               REPORT,AT(510,3010,7271,7750),PRE(RPT),PAPER(PAPER:A4),FONT('Arial',10,,FONT:regular,CHARSET:ANSI), |
  THOUS
                       HEADER,AT(510,500,7271,2552),USE(?Header)
                         STRING(@s50),AT(3708,1146),USE(Rel:FirmaNaam),LEFT
                         STRING(@s100),AT(3708,1375),USE(LOC:Adres1)
                         STRING(@s20),AT(3708,1646,854),USE(LOC:Postcode)
                         STRING(@s100),AT(4667,1646),USE(LOC:Plaats)
                         STRING('Ven Poultry'),AT(219,510),USE(?STRING1)
                         STRING('Stipdonk 46'),AT(219,729,833,198),USE(?STRING2)
                         STRING('5715 PD Lierop'),AT(219,948,1260,198),USE(?STRING3)
                         STRING('Tel 0492-537066'),AT(219,1177),USE(?STRING4)
                         STRING('Fax 0492-529655'),AT(219,1396),USE(?STRING5)
                         STRING('Netto (KG)'),AT(6500,2240),USE(?STRING7)
                         STRING('Tarra (KG)'),AT(5698,2240),USE(?STRING8)
                         STRING('Bruto (KG)'),AT(4375,2240),USE(?STRING9)
                         STRING('Artikel'),AT(448,2240),USE(?STRING6)
                         LINE,AT(42,2479,7125,0),USE(?LINE1)
                         STRING('Intern Partijnr.'),AT(2500,2240),USE(?STRING14)
                         STRING('Extern Partijnr.'),AT(3396,2240),USE(?STRING15)
                         STRING(@s20),AT(5458,510),USE(LOC:WeeglijstKop),RIGHT
                       END
WeegDetail             DETAIL,AT(0,0,7271,190),USE(?Detail)
                         STRING(@n10`2B),AT(4219,0),USE(Weg:BrutoGewicht),RIGHT
                         STRING(@n10`2B),AT(6375,0),USE(Weg:NettoGewicht),RIGHT
                         STRING(@s20),AT(5125,0,1292),USE(LOC:WegTarra),RIGHT
                         STRING(@s60),AT(1062,0,1792),USE(Art:ArtikelOms)
                         STRING(@s20),AT(3479,0,771),USE(LOC:ExternPartijID),LEFT
                         STRING(@n_10B),AT(2927,0,437),USE(LOC:PartijID),RIGHT
                         STRING(@s40),AT(4344,0),USE(LOC:GewichtTekst,,?LOC:GewichtTekst:2)
                         STRING(@s30),AT(375,0,635),USE(Art:ArtikelID)
                         STRING(@n_3B),AT(-52,0),USE(LOC:NR,,?LOC:NR:2),RIGHT(1)
                       END
ArtikelWeegFooter      DETAIL,AT(0,0,7271,365),USE(?DETAIL3)
                         LINE,AT(31,42,7135,0),USE(?LINE2)
                         STRING(@n10`2B),AT(4219,115,844,198),USE(LOC:TotaalBrutoGewicht),RIGHT
                         STRING(@n10`2B),AT(5573,115,844,198),USE(LOC:TotaalTarraGewicht),RIGHT
                         STRING(@n10`2B),AT(6375,115,844,198),USE(LOC:TotaalNettoGewicht),RIGHT
                       END
ArtikelWeegHeader      DETAIL,AT(0,0,7271,615),USE(?DETAIL2)
                         STRING('Totaal per artikel:'),AT(42,333,1448,229),USE(?STRING12)
                       END
ArtikelWeegDetail      DETAIL,AT(0,0,7271,312),USE(?DETAIL1)
                         STRING(@s30),AT(42,52,771),USE(LAT:ArtikelID)
                         STRING(@s60),AT(875,52,3448),USE(LAT:ArtikelOms)
                         STRING(@n10`2B),AT(4219,52),USE(LAT:BrutoGewicht),RIGHT
                         STRING(@n10`2B),AT(5573,52),USE(LAT:TarraGewicht),RIGHT
                         STRING(@n10`2B),AT(6375,52),USE(LAT:NettoGewicht),RIGHT
                       END
                       FOOTER,AT(510,10750,7271,510),USE(?Footer)
                         STRING(@N3),AT(6802,208),USE(ReportPageNumber)
                         STRING('Pagina'),AT(6260,187),USE(?STRING11)
                         STRING(@d17),AT(125,187),USE(Loc:DatumNu)
                         STRING(@t7),AT(1000,187),USE(Loc:TijdNu)
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
TakeNoRecords          PROCEDURE(),DERIVED
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
  GlobalErrors.SetProcedureName('ReportWeeglijst')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('LOC:TypeID',LOC:TypeID)                            ! Added by: Report
  BIND('LOC:ID',LOC:ID)                                    ! Added by: Report
  BIND('PLA:PlanningID',PLA:PlanningID)                    ! Added by: SVReportToPDF(SVReportToPDFSupport)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  LOC:TypeID = PRM:TypeID
  LOC:ID = PRM:ID
  
  IF LOC:TypeID = 'Verkoop' THEN
  	LOC:WeeglijstKop = 'Weeglijst-UIT'
  ELSIF LOC:TypeID = 'Inkoop' THEN
  	LOC:WeeglijstKop = 'Weeglijst-IN'
  ELSE
  	LOC:WeeglijstKop = 'Weeglijst'
  END
  
  LOC:GewichtTekst = ''
  
  LOC:AantalRecords = 0
  LOC:CountRecords = 0
  
  FREE(LOC:ArtikelTotaal)
  Relate:ARelatie.Open                                     ! File ARelatie used by this procedure, so make sure it's RelationManager is open
  Relate:Mutatie.Open                                      ! File Mutatie used by this procedure, so make sure it's RelationManager is open
  Relate:PalletSoort.Open                                  ! File PalletSoort used by this procedure, so make sure it's RelationManager is open
  Relate:Partij.Open                                       ! File Partij used by this procedure, so make sure it's RelationManager is open
  Relate:Planning.SetOpenRelated()
  Relate:Planning.Open                                     ! File Planning used by this procedure, so make sure it's RelationManager is open
  Relate:RelatieAdres.Open                                 ! File RelatieAdres used by this procedure, so make sure it's RelationManager is open
  Relate:ViewArtikel.Open                                  ! File ViewArtikel used by this procedure, so make sure it's RelationManager is open
  Relate:Weging.Open                                       ! File Weging used by this procedure, so make sure it's RelationManager is open
  Access:Relatie.UseFile                                   ! File referenced in 'Other Files' so need to inform it's FileManager
  SELF.FilesOpened = True
  LOC:WeeglijstPrinter=GETINI('Printer','Weeglijst',,'.\Voorraad.ini')
  
  ! Bepaal het aantal planning-records dat aan de filter voldoet
  ! (LOC:TypeID='Inkoop' AND PLA:InkoopID=LOC:ID) OR (LOC:TypeID='Verkoop' AND PLA:VerkoopID=LOC:ID) OR (LOC:TypeID='Planning' AND PLA:PlanningID=LOC:ID)
  CASE LOC:TypeID
  OF 'Inkoop'
  	CLEAR(Pla:Record)
  	PLA:InkoopID = LOC:ID
  	SET(Pla:Planning_FK01, Pla:Planning_FK01)
  	LOOP
  		Access:Planning.TryNext()
  		IF ERROR() OR PLA:InkoopID <> LOC:ID THEN BREAK.
  		LOC:AantalRecords += 1
  	END
  OF 'Verkoop'
  	CLEAR(Pla:Record)
  	PLA:VerkoopID = LOC:ID
  	SET(Pla:Planning_FK02, Pla:Planning_FK02)
  	LOOP
  		Access:Planning.TryNext()
  		IF ERROR() OR PLA:VerkoopID <> LOC:ID THEN BREAK.
  		LOC:AantalRecords += 1
  	END
  OF 'Planning'
  	LOC:AantalRecords = 1
  END
  SELF.Open(ProgressWindow)                                ! Open window
  WinAlertMouseZoom()
  Do DefineListboxStyle
  INIMgr.Fetch('ReportWeeglijst',ProgressWindow)           ! Restore window settings from non-volatile store
  TargetSelector.AddItem(PDFReporter.IReportGenerator)
  SELF.AddItem(TargetSelector)
  ProgressMgr.Init(ScrollSort:AllowNumeric,)
  ThisReport.Init(Process:View, Relate:Planning, ?Progress:PctText, Progress:Thermometer, ProgressMgr, Pla:PlanningID)
  ThisReport.AddSortOrder(Pla:PK_Planning)
  ThisReport.SetFilter('(LOC:TypeID=''Inkoop'' AND PLA:InkoopID=LOC:ID) OR (LOC:TypeID=''Verkoop'' AND PLA:VerkoopID=LOC:ID) OR (LOC:TypeID=''Planning'' AND PLA:PlanningID=LOC:ID)')
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
    Relate:ARelatie.Close
    Relate:Mutatie.Close
    Relate:PalletSoort.Close
    Relate:Partij.Close
    Relate:Planning.Close
    Relate:RelatieAdres.Close
    Relate:ViewArtikel.Close
    Relate:Weging.Close
  END
  IF SELF.Opened
    INIMgr.Update('ReportWeeglijst',ProgressWindow)        ! Save window data to non-volatile store
  END
  ProgressMgr.Kill()
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.OpenReport PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  SYSTEM{PROP:PrintMode} = 3
  	SAV:Printer=PRINTER{PROPPRINT:Device}
  	IF LOC:WeeglijstPrinter<>''
  		PRINTER{PROPPRINT:Device}=Loc:WeeglijstPrinter
  	End
  ReturnValue = PARENT.OpenReport()
  IF ReturnValue = Level:Benign
    Report$?ReportPageNumber{PROP:PageNo} = True
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


ThisWindow.TakeNoRecords PROCEDURE

  CODE
  MESSAGE('Geen planningsregel gevonden.')
  
  Return  
  PARENT.TakeNoRecords


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
  	IF FALSE
  PRINT(RPT:WeegDetail)
  PRINT(RPT:ArtikelWeegFooter)
  PRINT(RPT:ArtikelWeegHeader)
  PRINT(RPT:ArtikelWeegDetail)
  	ELSE
  		Access:Planning.TryFetch(Pla:PK_Planning)
  		IF LOC:TypeID = 'Verkoop' THEN
  			LOC:DatumNU = Ver2:Planning_DATE
  			Loc:TijdNu = Ver2:Planning_TIME
  		ELSIF LOC:TypeID = 'Inkoop' THEN
  			LOC:DatumNU = Ink:Planning_DATE
  			Loc:TijdNu = Ink:Planning_TIME
  		ELSE
  			LOC:DatumNU = Pla:Planning_DATE
  			Loc:TijdNu = Pla:Planning_TIME
  		END
  
  		! Ophalen klant
  		IF Ver2:VerkoopID <> 0 THEN
  			CLEAR(Rel:Record)
  			Rel:RelatieID = Ver2:Klant
  			Access:Relatie.TryFetch(Rel:Relatie_PK)
  
  			LOC:Adres1 = Rel:Adres1
  			LOC:Postcode = Rel:Postcode
  			LOC:Plaats = Rel:Plaats
  			
  			IF Ver2:KlantAlternatiefAdres <> 0 THEN
  				CLEAR(RAD:Record)
  				RAD:ID = Ver2:KlantAlternatiefAdres
  				Access:RelatieAdres.TryFetch(RAD:PK_RelatieAdres)
  				
  				LOC:Adres1 = RAD:Adres1
  				LOC:Postcode = RAD:Postcode
  				LOC:Plaats = RAD:Plaats
  			.
  		.
  
  		IF Ink:InkoopID <> 0 THEN
  			CLEAR(Rel:Record)
  			Rel:RelatieID = Ink:Leverancier
  			Access:Relatie.TryFetch(Rel:Relatie_PK)
  			
  			LOC:Adres1  = Rel:Adres1
  			LOC:Postcode = Rel:Postcode
  			LOC:Plaats = Rel:Plaats
  		.
  		
  		! Mutaties afdrukken van de planningsregel
  		found_mutatie# = FALSE
  
  		LOC:NR = 1
  
  		CLEAR(Mut:Record)
  		Mut:PlanningID = Pla:PlanningID
  		SET(Mut:Mutatie_FK02, Mut:Mutatie_FK02)
  		LOOP
  			Access:Mutatie.TryNext()
  			IF ERROR() OR Mut:PlanningID <> Pla:PlanningID THEN BREAK.
  			
  			CLEAR(Art:Record)
  			Art:ArtikelID = Mut:ArtikelID
  			Access:ViewArtikel.TryFetch(Art:Artikel_PK)
  			
  			CLEAR(Par:Record)
  			Par:PartijID = Mut:PartijID
  			Access:Partij.TryFetch(Par:Partij_PK)
  			
  			CLEAR(AREL:Record)
  			AREL:RelatieID = Par:Leverancier
  			Access:ARelatie.TryFetch(AREL:Relatie_PK)
  			
  			! Wegingen afdrukken per mutatie
  			found_weging# = FALSE
  			CLEAR(Weg:Record)
  			Weg:MutatieID=Mut:MutatieID
  			SET(Weg:FK_Weging, Weg:FK_Weging)
  			LOOP
  				Access:Weging.TryNext()
  				IF ERROR() OR Weg:MutatieID<>Mut:MutatieID THEN BREAK.
  				
  				found_weging# = TRUE
  				
  				LOC:PartijID = Mut:PartijID
  				LOC:ExternPartijID = Par:ExternPartijnr
  				
  				CLEAR(PalSrt:Record)
  				PalSrt:PalletSoortID = Weg:PalletSoortID
  				Access:PalletSoort.TryFetch(PalSrt:PK_PalletSoort)
  				
  				IF CLIP(PalSrt:PalletOmschrijving) <> '' THEN
  					LOC:WegTarra = CLIP(PalSrt:PalletOmschrijving) & ' / ' & CLIP(LEFT(FORMAT(Weg:Tarra, @N10`2)))
  				ELSE
  					LOC:WegTarra = CLIP(LEFT(FORMAT(Weg:Tarra, @N10`2)))
  				END
  				
  				LAT:ArtikelID = Art:ArtikelID
  				GET(LOC:ArtikelTotaal, +LAT:ArtikelID)
  				IF NOT(ERROR())
  					LAT:BrutoGewicht += Weg:BrutoGewicht
  					LAT:TarraGewicht += Weg:Tarra
  					LAT:NettoGewicht += Weg:NettoGewicht
  					PUT(LOC:ArtikelTotaal, +LAT:ArtikelID)
  				ELSE
  					LAT:ArtikelID = Art:ArtikelID
  					LAT:ArtikelOms = Art:ArtikelOms
  					LAT:BrutoGewicht = Weg:BrutoGewicht
  					LAT:TarraGewicht = Weg:Tarra
  					LAT:NettoGewicht = Weg:NettoGewicht
  					ADD(LOC:ArtikelTotaal, +LAT:ArtikelID)
  				.
  				
  				PRINT(RPT:WeegDetail)
  				
  				LOC:NR += 1
  			END
  			
  			IF NOT(found_weging#)
  				CLEAR(Weg:Record)
  				LOC:WegTarra = ''
  				LOC:GewichtTekst = 'Geen weging bij deze mutatie'
  				
  				LOC:PartijID = Mut:PartijID
  				LOC:ExternPartijID = Par:ExternPartijnr
  				
  				PRINT(RPT:WeegDetail)
  				LOC:GewichtTekst = ''
  			.
  			
  			found_mutatie# = TRUE
  		END
  
  		! Geen mutaties gevonden 
  		IF NOT(found_mutatie#)
  			CLEAR(Art:Record)
  			Art:ArtikelID = Pla:ArtikelID
  			Access:ViewArtikel.TryFetch(Art:Artikel_PK)
  			
  			CLEAR(Par:Record)
  			Par:PartijID = Pla:PartijID
  			Access:Partij.TryFetch(Par:Partij_PK)
  			
  			LOC:PartijID = Pla:PartijID
  			LOC:ExternPartijID = Par:ExternPartijnr
  			
  			CLEAR(Weg:Record)
  			LOC:WegTarra = ''
  			LOC:GewichtTekst = 'Geen mutatie bij deze planningsregel'
  			PRINT(RPT:WeegDetail)
  			LOC:GewichtTekst = ''
  		END
  
  		LOC:CountRecords += 1
  
  		IF LOC:AantalRecords = LOC:CountRecords
  			LOC:TotaalBrutoGewicht = 0
  			LOC:TotaalNettoGewicht = 0
  			LOC:TotaalTarraGewicht = 0
  			IF RECORDS(LOC:ArtikelTotaal) > 0 THEN
  				PRINT(RPT:ArtikelWeegHeader)
  				LOOP i# = 1 TO RECORDS(LOC:ArtikelTotaal)
  					GET(LOC:ArtikelTotaal, i#)
  					
  					LOC:TotaalBrutoGewicht += LAT:BrutoGewicht
  					LOC:TotaalNettoGewicht += LAT:NettoGewicht
  					LOC:TotaalTarraGewicht += LAT:TarraGewicht
  					
  					PRINT(RPT:ArtikelWeegDetail)
  				.
  				PRINT(RPT:ArtikelWeegFooter)
  			END
  		END
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
               Loc:TmpAtt='"'&Clip(Loc:TMPDirectory)&Shortpath('Weeglijst' &'.pdf')&'"'
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
  
       Loc:Commando=Clip(Loc:Commando)& ' Subject="'& 'Weeglijst' &'"'
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
  SELF.SetDocumentInfo('CW Report','VoorrRpt','ReportWeeglijst','ReportWeeglijst','','')
  SELF.SetPagesAsParentBookmark(False)
  SELF.SetScanCopyMode(False)
  SELF.CompressText   = True
  SELF.CompressImages = True

