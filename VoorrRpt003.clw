

   MEMBER('VoorrRpt.clw')                                  ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABREPORT.INC'),ONCE

                     MAP
                       INCLUDE('VOORRRPT003.INC'),ONCE        !Local module procedure declarations
                     END


!!! <summary>
!!! Generated from procedure template - Process
!!! Weeglijst in Excel
!!! </summary>
ReportWeeglijstExcel PROCEDURE (PRM:TypeID, PRM:ID)

Progress:Thermometer BYTE                                  ! 
LOC:TypeID           STRING(10)                            ! 
LOC:ID               LONG                                  ! 
LOC:Rij              LONG                                  ! 
LOC:GewichtTekst     STRING(100)                           ! 
LOC:AantalRecords    LONG                                  ! 
LOC:CountRecords     LONG                                  ! 
LOC:Adres1           CSTRING(101)                          ! 
LOC:Postcode         CSTRING(21)                           ! 
LOC:Plaats           CSTRING(101)                          ! 
LOC:PartijID         LONG                                  ! 
LOC:ExternPartijID   CSTRING(21)                           ! 
LOC:TotaalBrutoGewicht DECIMAL(9,2)                        ! 
LOC:TotaalNettoGewicht DECIMAL(9,2)                        ! 
LOC:TotaalTarraGewicht DECIMAL(9,2)                        ! 
LOC:First            BYTE                                  ! 
LOC:NR               LONG                                  ! 
LOC:DatumNu          LONG                                  ! 
LOC:ArtikelTotaal    QUEUE,PRE(LAT)                        ! 
ArtikelID            CSTRING(31)                           ! 
ArtikelOms           CSTRING(61)                           ! 
NettoGewicht         DECIMAL(9,2)                          ! 
BrutoGewicht         DECIMAL(9,2)                          ! 
TarraGewicht         DECIMAL(9,2)                          ! 
                     END                                   ! 
Process:View         VIEW(Planning)
                       PROJECT(Pla:InkoopID)
                       PROJECT(Pla:PlanningID)
                       PROJECT(Pla:VerkoopID)
                       JOIN(Ink:PK_Inkoop,Pla:InkoopID)
                       END
                       JOIN(Ver2:PK_Verkoop,Pla:VerkoopID)
                       END
                     END
LocEnableEnterByTab  BYTE(1)                               !Used by the ENTER Instead of Tab template
EnterByTabManager    EnterByTabClass
ProgressWindow       WINDOW('Process Planning'),AT(,,142,59),FONT('MS Sans Serif',8,,FONT:regular,CHARSET:DEFAULT), |
  DOUBLE,CENTER,GRAY,TIMER(1)
                       PROGRESS,AT(15,15,111,12),USE(Progress:Thermometer),RANGE(0,100)
                       STRING(''),AT(0,3,141,10),USE(?Progress:UserString),CENTER
                       STRING(''),AT(0,30,141,10),USE(?Progress:PctText),CENTER
                       BUTTON('Cancel'),AT(46,42,49,15),USE(?Progress:Cancel),LEFT,ICON('WACANCEL.ICO'),FLAT,HIDE, |
  MSG('Cancel Process'),TIP('Cancel Process')
                     END

    omit('***',WE::CantCloseNowSetHereDone=1)  !Getting Nested omit compile error, then uncheck the "Check for duplicate CantCloseNowSetHere variable declaration" in the WinEvent local template
WE::CantCloseNowSetHereDone equate(1)
WE::CantCloseNowSetHere     long
    !***
ThisWindow           CLASS(ReportManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Init                   PROCEDURE(ProcessClass PC,<REPORT R>,<PrintPreviewClass PV>)
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
TakeEvent              PROCEDURE(),BYTE,PROC,DERIVED
TakeRecord             PROCEDURE(),BYTE,PROC,DERIVED
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED
                     END

ThisProcess          ProcessClass                          ! Process Manager
ProgressMgr          StepLongClass                         ! Progress Manager

  CODE
  GlobalResponse = ThisWindow.Run()                        ! Opens the window and starts an Accept Loop

!---------------------------------------------------------------------------
DefineListboxStyle ROUTINE
!|
!| This routine create all the styles to be shared in this window
!| It`s called after the window open
!|
!---------------------------------------------------------------------------
WeegHeader          ROUTINE
	IF LOC:TypeID = 'Verkoop' THEN
		Loc:Ole{'Application.Range(A1).Value'}='WEEGLIJST-UIT'
		LOC:DatumNU = Ver2:Planning_DATE
	ELSIF LOC:TypeID = 'Inkoop' THEN
		Loc:Ole{'Application.Range(A1).Value'}='WEEGLIJST-IN'
		LOC:DatumNU = Ink:Planning_DATE
	ELSE
		Loc:Ole{'Application.Range(A1).Value'}='WEEGLIJST'
		LOC:DatumNU = Pla:Planning_DATE
	END
		
	Do Vet
	LOC:Rij += 1	
	
	Execute  (Loc:DAtumNU%7 )+ 1
    	Loc:Ole{'Application.Range(A1).Value'}='Zondag '&Format(Loc:DAtumNU,@d6-) 
    	Loc:Ole{'Application.Range(A1).Value'}='Maandag '&Format(Loc:DAtumNU,@d6-) 
    	Loc:Ole{'Application.Range(A1).Value'}='Dinsdag '&Format(Loc:DAtumNU,@d6-) 
    	Loc:Ole{'Application.Range(A1).Value'}='Woensdag '&Format(Loc:DAtumNU,@d6-) 
    	Loc:Ole{'Application.Range(A1).Value'}='Donderdag '&Format(Loc:DAtumNU,@d6-) 
    	Loc:Ole{'Application.Range(A1).Value'}='Vrijdag '&Format(Loc:DAtumNU,@d6-) 
    	Loc:Ole{'Application.Range(A1).Value'}='Zaterdag '&Format(Loc:DAtumNU,@d6-) 
	End
	Do Vet
	
	Loc:Ole{'Application.Range(B3).Value'}='Ven Poultry'
	Loc:Ole{'Application.Range(B4).Value'}='Stipdonk 46'
	Loc:Ole{'Application.Range(B5).Value'}='5715 PD Lierop'
	Loc:Ole{'Application.Range(B6).Value'}='Tel: 0492-537066'
	Loc:Ole{'Application.Range(B7).Value'}='Fax: 0492-537066'
	
	! Ophalen klant
	IF LOC:TypeID = 'Verkoop' THEN
		CLEAR(Rel:Record)
		Rel:RelatieID = Ver2:Klant
		Access:Relatie.TryFetch(Rel:Relatie_PK)
		
    	Loc:Ole{'Application.Range(F2).Value'}=Rel:FirmaNaam
		Loc:Ole{'Application.Range(F3).Value'}=Rel:Adres1
		Loc:Ole{'Application.Range(F4).Value'}=Rel:Postcode&' '&Rel:Plaats
		
		IF Ver2:KlantAlternatiefAdres <> 0 THEN
			CLEAR(RAD:Record)
			RAD:ID = Ver2:KlantAlternatiefAdres
			Access:RelatieAdres.TryFetch(RAD:PK_RelatieAdres)
			Loc:Ole{'Application.Range(F3).Value'}=RAD:Adres1
			Loc:Ole{'Application.Range(F4).Value'}=RAD:Postcode&' '&RAD:Plaats		
		.
	ELSIF LOC:TypeID = 'Inkoop' THEN
		CLEAR(Rel:Record)
		Rel:RelatieID = Ink:Leverancier
		Access:Relatie.TryFetch(Rel:Relatie_PK)
		
		Loc:Ole{'Application.Range(F2).Value'}=Rel:FirmaNaam
		Loc:Ole{'Application.Range(F3).Value'}=Rel:Adres1
		Loc:Ole{'Application.Range(F4).Value'}=Rel:Postcode&' '&Rel:Plaats

	ELSE
		!CLEAR(Rel:Record)
		!Rel:RelatieID = Pla:Ver2:Klant
		!Access:Relatie.TryFetch(Rel:Relatie_PK)
	END

	LOC:Rij += 8
	
   	Loc:Ole{'Application.Range(B'&Loc:Rij&').Value'}='Artikel'
   	Loc:Ole{'Application.Range(D'&Loc:Rij&').Value'}='Int. Partijnr.'
	Loc:Ole{'Application.Range(E'&Loc:Rij&').Value'}='Ext. Partijnr.'
	Loc:Ole{'Application.Range(F'&Loc:Rij&').Value'}='Bruto (KG)'
	Loc:Ole{'Application.Range(G'&Loc:Rij&').Value'}='Pallet'
	Loc:Ole{'Application.Range(H'&Loc:Rij&').Value'}='Tarra (KG)'
	Loc:Ole{'Application.Range(I'&Loc:Rij&').Value'}='Netto (KG)'

	Do TrekLijntjes
	Do Vet
	
	LOC:Rij += 1
	
	Loc:Ole{'Application.Columns(A:A).ColumnWidth'}=10
	Loc:Ole{'Application.Columns(B:B).ColumnWidth'}=20
	Loc:Ole{'Application.Columns(C:C).ColumnWidth'}=30
	Loc:Ole{'Application.Columns(D:E).ColumnWidth'}=10
	Loc:Ole{'Application.Columns(F:I).ColumnWidth'}=10
	EXIT	
WeegDetail        ROUTINE
   	Loc:Ole{'Application.Range(A'&Loc:Rij&').Value'}=LOC:NR
   	Loc:Ole{'Application.Range(B'&Loc:Rij&').Value'}=Art:ArtikelID
   	Loc:Ole{'Application.Range(C'&Loc:Rij&').Value'}=Art:ArtikelOms
   	Loc:Ole{'Application.Range(D'&Loc:Rij&').Value'}=LOC:PartijID
	Loc:Ole{'Application.Range(E'&Loc:Rij&').Value'}=LOC:ExternPartijID
	IF LOC:GewichtTekst = '' THEN
		Loc:Ole{'Application.Range(F'&Loc:Rij&').Value'}=Weg:BrutoGewicht
		Loc:Ole{'Application.Range(G'&Loc:Rij&').Value'}=PalSrt:PalletOmschrijving
		Loc:Ole{'Application.Range(H'&Loc:Rij&').Value'}=Weg:Tarra
		Loc:Ole{'Application.Range(I'&Loc:Rij&').Value'}=Weg:NettoGewicht
	ELSE
		Loc:Ole{'Application.Range(F'&Loc:Rij&').Value'}=LOC:GewichtTekst
	END
	
	LOC:Rij += 1
ArtikelWeegHeader   ROUTINE
	LOC:Rij += 1
	
   	Loc:Ole{'Application.Range(A'&Loc:Rij&').Value'}='Totaal per artikel'

	Do Vet
	
	LOC:Rij += 1
	
	EXIT
ArtikelWeegDetail    ROUTINE
   	Loc:Ole{'Application.Range(B'&Loc:Rij&').Value'}=LAT:ArtikelID
   	Loc:Ole{'Application.Range(C'&Loc:Rij&').Value'}=LAT:ArtikelOms
	Loc:Ole{'Application.Range(D'&Loc:Rij&').Value'}=''
   	Loc:Ole{'Application.Range(E'&Loc:Rij&').Value'}=''
	Loc:Ole{'Application.Range(F'&Loc:Rij&').Value'}=LAT:BrutoGewicht
	Loc:Ole{'Application.Range(H'&Loc:Rij&').Value'}=LAT:TarraGewicht
	Loc:Ole{'Application.Range(I'&Loc:Rij&').Value'}=LAT:NettoGewicht
	
	LOC:Rij += 1
	
	EXIT
ArtikelWeegFooter   ROUTINE
   	Loc:Ole{'Application.Range(B'&Loc:Rij&').Value'}=''
   	Loc:Ole{'Application.Range(C'&Loc:Rij&').Value'}=''
   	Loc:Ole{'Application.Range(D'&Loc:Rij&').Value'}=''
	Loc:Ole{'Application.Range(E'&Loc:Rij&').Value'}='Totaal:'
	Loc:Ole{'Application.Range(F'&Loc:Rij&').Value'}=LOC:TotaalBrutoGewicht
	Loc:Ole{'Application.Range(H'&Loc:Rij&').Value'}=LOC:TotaalTarraGewicht
	Loc:Ole{'Application.Range(I'&Loc:Rij&').Value'}=LOC:TotaalNettoGewicht
	
	DO Vet
	
	LOC:Rij += 1
	EXIT
InitExcel           ROUTINE
	db.DebugOut('ReportWeeglijst - InitExcel (Pre)')
	GlobalClass.InitExcelOle()
	db.DebugOut('ReportWeeglijst - InitExcel (Post: InitExcelOle2)')	
	GlobalClass.MaakExcel('')
	db.DebugOut('ReportWeeglijst - InitExcel (Post: MaakExcel) - ' & LOC:Ole)	

	LOC:Rij = 1
	
KillExcel           ROUTINE
	Loc:Ole{'Cells.Select'}
	Loc:Ole{'Application.Selection.Font.Name'} = 'Ariel'
	Loc:Ole{'Application.Selection.Font.Size'} = 11
	
	Loc:Ole{'Application.Rows(1:'&Loc:Rij&').AutoFit'}
	Loc:Ole{'Application.ActiveSheet.PageSetup.Zoom'} = 60 != Loc:Ole{'Application.ActiveSheet.PageSetup.BlackAndWhite'}!
	Loc:Ole{'Application.ActiveSheet.PageSetup.Orientation'} = 2 != Landscape
	Loc:Ole{'Application.ActiveSheet.PageSetup.TopMargin'} = 30 != Points (1/72 inch
	Loc:Ole{'Application.ActiveSheet.PageSetup.BottomMargin'} = 30 != Points (1/72 inch
	Loc:Ole{'Application.ActiveSheet.PageSetup.LeftMargin'} = 30 != Points (1/72 inch
	Loc:Ole{'Application.ActiveSheet.PageSetup.RightMargin'} = 30 != Points (1/72 inch
	
	Loc:Ole{'Application.Visible'}=true ! nu pas excel laten zien
	Loc:Ole{'Application.ActiveWindow.SelectedSheets.PrintPreview'}
	!LOC:ExcelMacroFile = CLIP(GETINI('Excel', 'MacroXLS',,'.\Voorraad.ini'))
	
	!Loc:Ole{'Application.Workbooks.Open('&CLIP(LOC:ExcelMacroFile)&')'}
	
	!pos# = INSTRING('\', CLIP(LOC:ExcelMacroFile), -1, LEN(CLIP(LOC:ExcelMacroFile)))
	!Loc:Ole{'Application.Run('&CLIP(SUB(CLIP(LOC:ExcelMacroFile), pos# + 1, LEN(CLIP(LOC:ExcelMacroFile)) - pos#)) & '!Macro1)'}
	
TrekLijntjes            Routine
	  Loc:Ole{'Application.Range(A'&Loc:Rij&':I'&Loc:Rij&').Select'}
	  Loc:Ole{'Application.Selection.Borders(9).Weight'}=2 ! xlEdgeBottom
      Loc:Ole{'Application.Selection.Borders(10).Weight'}=2 ! xlEdgeRight
      Loc:Ole{'Application.Selection.Borders(7).Weight'}=2 ! xlEdgeLeft
      Loc:Ole{'Application.Selection.Borders(8).Weight'}=2 ! xlEdgeTop
      Loc:Ole{'Application.Selection.Borders(11).Weight'}=2 ! xlInsideVertical
!      ?Ole{'Application.Selection.Borders(12).Weight'}=2 ! xlInsideHorizontal

! [Priority 4000]
Vet                     Routine
	  Loc:Ole{'Application.Range(A'&Loc:Rij&':I'&Loc:Rij&').Font.Bold'}=True

ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('ReportWeeglijstExcel')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('LOC:TypeID',LOC:TypeID)                            ! Added by: Process
  BIND('LOC:ID',LOC:ID)                                    ! Added by: Process
  BIND('PLA:PlanningID',PLA:PlanningID)                    ! Added by: WinEvent(WinEvent)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  LOC:TypeID = PRM:TypeID
  LOC:ID = PRM:ID
  
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
  ! Bepaal het aantal planning-records dat aan de filter voldoet
  ! (LOC:TypeID='Inkoop' AND PLA:InkoopID=LOC:ID) OR (LOC:TypeID='Verkoop' AND PLA:VerkoopID=LOC:ID) OR (LOC:TypeID='Planning' AND PLA:PlanningID=LOC:ID)
  CASE LOC:TypeID
  OF 'Inkoop'
  	CLEAR(Pla:Record)
  	PLA:InkoopID = LOC:ID
  	SET(Pla:Planning_FK01, Pla:Planning_FK01)
  	LOOP UNTIL Access:Planning.Next()
  		IF ERROR() OR PLA:InkoopID <> LOC:ID THEN BREAK.
  		LOC:AantalRecords += 1
  	END
  OF 'Verkoop'
  	CLEAR(Pla:Record)
  	PLA:VerkoopID = LOC:ID
  	SET(Pla:Planning_FK02, Pla:Planning_FK02)
  	LOOP UNTIL Access:Planning.Next()
  		IF ERROR() OR PLA:VerkoopID <> LOC:ID THEN BREAK.
  		LOC:AantalRecords += 1
  	END
  OF 'Planning'
  	LOC:AantalRecords = 1
  END
  
  db.DebugOut('AantalRecords: ' & LOC:AantalRecords)
  SELF.Open(ProgressWindow)                                ! Open window
  LOC:First = TRUE
  LOC:Rij = 1
  WinAlertMouseZoom()
  Do DefineListboxStyle
  INIMgr.Fetch('ReportWeeglijstExcel',ProgressWindow)      ! Restore window settings from non-volatile store
  ProgressWindow{Prop:Timer} = 10                          ! Assign timer interval
  ProgressMgr.Init(ScrollSort:AllowNumeric,)
  ThisProcess.Init(Process:View, Relate:Planning, ?Progress:PctText, Progress:Thermometer, ProgressMgr, Pla:PlanningID)
  ThisProcess.AddSortOrder(Pla:PK_Planning)
  ThisProcess.SetFilter('(LOC:TypeID=''Inkoop'' AND PLA:InkoopID=LOC:ID) OR (LOC:TypeID=''Verkoop'' AND PLA:VerkoopID=LOC:ID) OR (LOC:TypeID=''Planning'' AND PLA:PlanningID=LOC:ID)')
  ProgressWindow{Prop:Text} = 'Processing Records'
  ?Progress:PctText{Prop:Text} = '0% Completed'
  SELF.Init(ThisProcess)
  ?Progress:UserString{Prop:Text}='Exporteren Weeglijst'
  SELF.AddItem(?Progress:Cancel, RequestCancelled)
  SEND(Planning,'QUICKSCAN=on')
  SEND(Inkoop,'QUICKSCAN=on')
  SEND(Verkoop,'QUICKSCAN=on')
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
        ThisNetRefresh.Send('|Planning|') ! NetTalk (NetRefresh)
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
    INIMgr.Update('ReportWeeglijstExcel',ProgressWindow)   ! Save window data to non-volatile store
  END
  ProgressMgr.Kill()
  GlobalErrors.SetProcedureName
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


ThisWindow.TakeRecord PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  db.DebugOut('ReportWeeglijstExcel - TakeRecord (Pre) ' & Pla:PlanningID & ', ' & Ver2:VerkoopID & ', ' & Ink:InkoopID)
  Access:Planning.TryFetch(Pla:PK_Planning)
  
  ! Ophalen Inkoop
  
  ! Ophalen Verkoop
  
  ! Ophalen klant
  IF Ver2:VerkoopID <> 0 THEN
  	db.DebugOut('ReportWeeglijstExcel - (Ophalen Klant) ' & Ver2:Klant)	
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
  	db.DebugOut('ReportWeeglijstExcel - (Ophalen Leverancier) ' & Ink:Leverancier)	
  	CLEAR(Rel:Record)
  	Rel:RelatieID = Ink:Leverancier
  	Access:Relatie.TryFetch(Rel:Relatie_PK)
  	
  	LOC:Adres1 = Rel:Adres1
  	LOC:Postcode = Rel:Postcode
  	LOC:Plaats = Rel:Plaats
  .
  
  IF LOC:First THEN
  	DO InitExcel
  	DO WeegHeader
  	
  	LOC:First = FALSE
  END
  
  ! Mutaties afdrukken van de planningsregel
  found_mutatie# = FALSE
  
  db.DebugOut('Planning-Excel:' & Pla:PlanningID)
  
  LOC:NR = 1
  
  CLEAR(Mut:Record)
  Mut:PlanningID = Pla:PlanningID
  SET(Mut:Mutatie_FK02, Mut:Mutatie_FK02)
  LOOP UNTIL Access:Mutatie.TryNext()
  	IF Mut:PlanningID <> Pla:PlanningID THEN BREAK.
  	
  	CLEAR(Art:Record)
  	Art:ArtikelID = Mut:ArtikelID
  	Access:ViewArtikel.TryFetch(Art:Artikel_PK)
  	
  	CLEAR(Par:Record)
  	Par:PartijID = Mut:PartijID
  	Access:Partij.TryFetch(Par:Partij_PK)
  	
  	CLEAR(AREL:Record)
  	AREL:RelatieID = Par:Leverancier
  	Access:ARelatie.TryFetch(AREL:Relatie_PK)
  	
  	db.DebugOut('Planning-Excel:' & Pla:PlanningID & '-' & Mut:MutatieID)
  	
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
  		
  		CLEAR(PalSrt:Record)
  		PalSrt:PalletSoortID = Weg:PalletSoortID
  		Access:PalletSoort.TryFetch(PalSrt:PK_PalletSoort)
  		
  		db.DebugOut('Planning-Excel:' & Pla:PlanningID & '-' & Mut:MutatieID & '-' & Weg:WegingID)
  		
  		DO WeegDetail
  		LOC:NR += 1
  	END
  	
  	IF NOT(found_weging#)
  		CLEAR(Weg:Record)
  		LOC:GewichtTekst = 'Geen weging bij deze mutatie'
  		
  		LOC:PartijID = Mut:PartijID
  		LOC:ExternPartijID = Par:ExternPartijnr
  		
  		DO WeegDetail
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
  	LOC:GewichtTekst = 'Geen mutatie bij deze planningsregel'
  	
  	DO WeegDetail
  	
  	LOC:GewichtTekst = ''
  END
  
  LOC:CountRecords += 1
  
  IF LOC:AantalRecords = LOC:CountRecords
  	LOC:TotaalBrutoGewicht = 0
  	LOC:TotaalNettoGewicht = 0
  	LOC:TotaalTarraGewicht = 0
  	IF RECORDS(LOC:ArtikelTotaal) > 0 THEN
  		DO ArtikelWeegHeader
  		
  		LOOP i# = 1 TO RECORDS(LOC:ArtikelTotaal)
  			GET(LOC:ArtikelTotaal, i#)
  			
  			LOC:TotaalBrutoGewicht += LAT:BrutoGewicht
  			LOC:TotaalNettoGewicht += LAT:NettoGewicht
  			LOC:TotaalTarraGewicht += LAT:TarraGewicht
  			
  			DO ArtikelWeegDetail
  		.
  		
  		DO ArtikelWeegFooter
  	END
  	
  	DO KillExcel
  END
  
  db.DebugOut('ReportWeeglijstExcel - TakeRecord (Post) ' & Pla:PlanningID)
  ReturnValue = PARENT.TakeRecord()
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
    OF EVENT:OpenWindow
        WE::CantCloseNow += 1
        WE::CantCloseNowSetHere = 1
    END
  ReturnValue = PARENT.TakeWindowEvent()
    CASE EVENT()
    OF EVENT:CloseWindow
      if WE::CantCloseNow > 0 and ReturnValue = Level:Benign and WE::CantCloseNowSetHere
        WE::CantCloseNow -= 1
        WE::CantCloseNowSetHere = 0
      end
    OF EVENT:OpenWindow
        post(event:visibleondesktop)
    END
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue

