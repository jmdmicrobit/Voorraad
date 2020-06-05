

   MEMBER('VoorrPln.clw')                                  ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABPOPUP.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('VOORRPLN032.INC'),ONCE        !Local module procedure declarations
                     END


!!! <summary>
!!! Generated from procedure template - Window
!!! Browse the OverboekingRit file
!!! </summary>
BrowseTransfers PROCEDURE (PRM:Datum)

CurrentTab           STRING(80)                            ! 
LOC:Datum            DATE                                  ! 
LOC:DatumNu          DATE                                  ! 
LOC:ExcelInkoop      BYTE                                  ! 
LOC:DatumVanSQL      LONG                                  ! 
LOC:DatumTMSQL       LONG                                  ! 
LOC:RitID            LONG                                  ! 
BRW1::View:Browse    VIEW(OverboekingRit)
                       PROJECT(OR:OverboekingRitID)
                       PROJECT(OR:DatumTijd_DATE)
                       PROJECT(OR:DatumTijd_TIME)
                       PROJECT(OR:Opmerking)
                       PROJECT(OR:DatumTijd)
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
OR:OverboekingRitID    LIKE(OR:OverboekingRitID)      !List box control field - type derived from field
OR:DatumTijd_DATE      LIKE(OR:DatumTijd_DATE)        !List box control field - type derived from field
OR:DatumTijd_TIME      LIKE(OR:DatumTijd_TIME)        !List box control field - type derived from field
OR:Opmerking           LIKE(OR:Opmerking)             !List box control field - type derived from field
OR:DatumTijd           LIKE(OR:DatumTijd)             !Browse hot field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
LocEnableEnterByTab  BYTE(1)                               !Used by the ENTER Instead of Tab template
EnterByTabManager    EnterByTabClass
NetLocalRefreshDate     Long     ! NetTalk (NetRefresh)
NetLocalRefreshTime     Long
NetLocalDependancies    String('|OverboekingRit|')
QuickWindow          WINDOW('Transfers'),AT(,,399,254),FONT('MS Sans Serif',8,,FONT:regular,CHARSET:DEFAULT),RESIZE, |
  CENTER,GRAY,IMM,MAX,MDI,HLP('BrowseRitten'),SYSTEM
                       LIST,AT(8,44,383,167),USE(?Browse:1),HVSCROLL,FORMAT('45R(2)|M~Transfer-ID~C(0)@n_10@[5' & |
  '3R(2)|M@d17-@80R(2)|M@t7@](77)|~Uitvoerdatum~80L(2)|M~Opmerking~C(2)@s100@'),FROM(Queue:Browse:1), |
  IMM,MSG('Browsing the OverboekingRit file')
                       BUTTON('&Select'),AT(131,215,49,14),USE(?Select:2),LEFT,ICON('WASELECT.ICO'),FLAT,MSG('Select the Record'), |
  TIP('Select the Record')
                       BUTTON('&View'),AT(184,215,49,14),USE(?View:3),LEFT,ICON('WAVIEW.ICO'),FLAT,MSG('View Record'), |
  TIP('View Record')
                       BUTTON('&Insert'),AT(237,215,49,14),USE(?Insert:4),LEFT,ICON('WAINSERT.ICO'),FLAT,MSG('Insert a Record'), |
  TIP('Insert a Record')
                       BUTTON('&Change'),AT(290,215,49,14),USE(?Change:4),LEFT,ICON('WACHANGE.ICO'),DEFAULT,FLAT, |
  MSG('Change the Record'),TIP('Change the Record')
                       BUTTON('&Delete'),AT(343,215,49,14),USE(?Delete:4),LEFT,ICON('WADELETE.ICO'),FLAT,MSG('Delete the Record'), |
  TIP('Delete the Record')
                       SHEET,AT(4,4,393,231),USE(?CurrentTab)
                         TAB('&1) Op Datum'),USE(?Tab:2)
                           PROMPT('Datum:'),AT(7,27),USE(?LOC:Datum:Prompt)
                           SPIN(@d17-),AT(35,24,83,15),USE(LOC:Datum)
                         END
                         TAB('&2) Alle'),USE(?Tab:3)
                         END
                       END
                       BUTTON('&Close'),AT(348,238,49,14),USE(?Close),LEFT,ICON('WACLOSE.ICO'),FLAT,MSG('Close Window'), |
  TIP('Close Window')
                       BUTTON('Excel'),AT(5,236),USE(?Excel)
                     END

    omit('***',WE::CantCloseNowSetHereDone=1)  !Getting Nested omit compile error, then uncheck the "Check for duplicate CantCloseNowSetHere variable declaration" in the WinEvent local template
WE::CantCloseNowSetHereDone equate(1)
WE::CantCloseNowSetHere     long
    !***
ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
Reset                  PROCEDURE(BYTE Force=0),DERIVED
Run                    PROCEDURE(USHORT Number,BYTE Request),BYTE,PROC,DERIVED
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED
TakeEvent              PROCEDURE(),BYTE,PROC,DERIVED
TakeFieldEvent         PROCEDURE(),BYTE,PROC,DERIVED
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
BRW1                 CLASS(BrowseClass)                    ! Browse using ?Browse:1
Q                      &Queue:Browse:1                !Reference to browse queue
Ask                    PROCEDURE(BYTE Request),BYTE,PROC,DERIVED
Init                   PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)
ResetSort              PROCEDURE(BYTE Force),BYTE,PROC,DERIVED
                     END

BRW1::Sort0:Locator  StepLocatorClass                      ! Default Locator
BRW1::Sort1:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 2
Resizer              CLASS(WindowResizeClass)
Init                   PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)
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
ExportExcel         ROUTINE
    GlobalClass.InitExcelOle()
	GlobalClass.MaakExcel('')
	
	LOC:DatumNu = TODAY()
	
	CLEAR(ORR:RECORD)
	ORR:OverboekingRitID=OR:OverboekingRitID
	SET(ORR:FK_OverboekingRitRegel,ORR:FK_OverboekingRitRegel)
	
	LOC:ExcelInkoop = 0 ! 1=alles inkoop, 2=ook 1> overboeking gevonden
	
	LOOP
		Access:OverboekingRitRegel.TryNext()
		IF ERROR() THEN BREAK.
		IF ORR:OverboekingRitID<>OR:OverboekingRitID THEN BREAK.
		
		CLEAR(Pla:Record)
		Pla:PlanningID=ORR:PlanningID
		Access:Planning.TryFetch(Pla:PK_Planning)
		
		IF Pla:OverboekingCelID=0 AND LOC:ExcelInkoop <> 2
			! Inkoop
			LOC:ExcelInkoop = 1
		ELSE
			LOC:ExcelInkoop = 2
		.
	.
	
	Execute  (Loc:DAtumNU%7 )+ 1
    	Loc:Ole{'Application.Range(A1).Value'}='Zondag '&Format(Loc:DAtumNU,@d6-) 
    	Loc:Ole{'Application.Range(A1).Value'}='Maandag '&Format(Loc:DAtumNU,@d6-) 
    	Loc:Ole{'Application.Range(A1).Value'}='Dinsdag '&Format(Loc:DAtumNU,@d6-) 
    	Loc:Ole{'Application.Range(A1).Value'}='Woensdag '&Format(Loc:DAtumNU,@d6-) 
    	Loc:Ole{'Application.Range(A1).Value'}='Donderdag '&Format(Loc:DAtumNU,@d6-) 
    	Loc:Ole{'Application.Range(A1).Value'}='Vrijdag '&Format(Loc:DAtumNU,@d6-) 
    	Loc:Ole{'Application.Range(A1).Value'}='Zaterdag '&Format(Loc:DAtumNU,@d6-) 
	End
	
	Loc:Rij = 3
	Execute  (OR:DatumTijd_DATE%7 )+ 1
    	Loc:Ole{'Application.Range(A'&Loc:Rij&').Value'}='Uitvoerdatum: Zondag ' & Format(OR:DatumTijd_DATE,@d6-) & ' ' & Format(OR:DatumTijd_TIME,@t1B)
    	Loc:Ole{'Application.Range(A'&Loc:Rij&').Value'}='Uitvoerdatum: Maandag ' & Format(OR:DatumTijd_DATE,@d6-) & ' ' & Format(OR:DatumTijd_TIME,@t1B)
    	Loc:Ole{'Application.Range(A'&Loc:Rij&').Value'}='Uitvoerdatum: Dinsdag ' & Format(OR:DatumTijd_DATE,@d6-) & ' ' & Format(OR:DatumTijd_TIME,@t1B)
    	Loc:Ole{'Application.Range(A'&Loc:Rij&').Value'}='Uitvoerdatum: Woensdag ' & Format(OR:DatumTijd_DATE,@d6-) & ' ' & Format(OR:DatumTijd_TIME,@t1B)
    	Loc:Ole{'Application.Range(A'&Loc:Rij&').Value'}='Uitvoerdatum: Donderdag ' & Format(OR:DatumTijd_DATE,@d6-) & ' ' & Format(OR:DatumTijd_TIME,@t1B)
    	Loc:Ole{'Application.Range(A'&Loc:Rij&').Value'}='Uitvoerdatum: Vrijdag ' & Format(OR:DatumTijd_DATE,@d6-) & ' ' & Format(OR:DatumTijd_TIME,@t1B)
    	Loc:Ole{'Application.Range(A'&Loc:Rij&').Value'}='Uitvoerdatum: Zaterdag ' & Format(OR:DatumTijd_DATE,@d6-) & ' ' & Format(OR:DatumTijd_TIME,@t1B)
	End

	Loc:Rij += 3
	Loc:Ole{'Application.Range(A'&Loc:Rij&').Value'}='REFERENTIE-NR.:'
	
	Loc:Rij += 3
	Loc:Ole{'Application.Range(A'&Loc:Rij&').Value'}='Opmerking: ' & CLIP(OR:Opmerking)
	
	Loc:Rij += 2
	Loc:Ole{'Application.Range(A'&Loc:Rij&').Value'}=''
	Loc:Ole{'Application.Range(B'&Loc:Rij&').Value'}='Partijnr. (Int/Ext)'
	Loc:Ole{'Application.Range(C'&Loc:Rij&').Value'}='ArtikelID'
	Loc:Ole{'Application.Range(D'&Loc:Rij&').Value'}='Artikelnaam' 
	Loc:Ole{'Application.Range(E'&Loc:Rij&').Value'}='Leverancier' 
	Loc:Ole{'Application.Range(F'&Loc:Rij&').Value'}='Verpakking' 
	Loc:Ole{'Application.Range(G'&Loc:Rij&').Value'}='KG' 
	!Loc:Ole{'Application.Range(H'&Loc:Rij&').Value'}='Pallets' 
	Loc:Ole{'Application.Range(H'&Loc:Rij&').Value'}='Instructie'
	!Loc:Ole{'Application.Range(J'&Loc:Rij&').Value'}='Transport'
	IF (LOC:ExcelInkoop <> 1)
	!	Loc:Ole{'Application.Range(K'&Loc:Rij&').Value'}='Van Cel' 
	!	Loc:Ole{'Application.Range(L'&Loc:Rij&').Value'}='Naar Cel' 
		!Loc:Ole{'Application.Range(M'&Loc:Rij&').Value'}='Verwerkt'
	.
	
   	Loc:Ole{'Application.Columns(A:A).ColumnWidth'}=15
   	Loc:Ole{'Application.Columns(B:B).ColumnWidth'}=25
   	Loc:Ole{'Application.Columns(C:C).ColumnWidth'}=18
   	Loc:Ole{'Application.Columns(D:D).ColumnWidth'}=30
   	Loc:Ole{'Application.Columns(E:E).ColumnWidth'}=30
   	Loc:Ole{'Application.Columns(F:F).ColumnWidth'}=20
   	Loc:Ole{'Application.Columns(G:G).ColumnWidth'}=10
	!Loc:Ole{'Application.Columns(H:H).ColumnWidth'}=10
    IF GLO:HidePlanningInstructie = 0 THEN
        Loc:Ole{'Application.Columns(H:H).ColumnWidth'}=50
    END
   	!Loc:Ole{'Application.Columns(J:J).ColumnWidth'}=20
	IF (LOC:ExcelInkoop <> 1)	
   	!	Loc:Ole{'Application.Columns(K:K).ColumnWidth'}=12
   	!	Loc:Ole{'Application.Columns(L:L).ColumnWidth'}=12
		!Loc:Ole{'Application.Columns(M:M).ColumnWidth'}=12
	.
	
	Do TrekLijntjes
	Do Vet
	
	CLEAR(ORR:RECORD)
	ORR:OverboekingRitID=OR:OverboekingRitID
	SET(ORR:FK_OverboekingRitRegel,ORR:FK_OverboekingRitRegel)

	LOOP
		Access:OverboekingRitRegel.TryNext()
		IF ERROR() THEN BREAK.
		IF ORR:OverboekingRitID<>OR:OverboekingRitID THEN BREAK.
		
		CLEAR(Pla:Record)
		Pla:PlanningID=ORR:PlanningID
		Access:Planning.TryFetch(Pla:PK_Planning)
		
		CLEAR(Pla2:Record)
		Pla2:PlanningID=Pla:PlanningID
		Access:PlanningInkoop.TryFetch(Pla2:PlanningID_K)
		
		CLEAR(Par:Record)
		Par:PartijID=Pla:PartijID
		Access:Partij.TryFetch(Par:Partij_PK)
		
		CLEAR(Ver:Record)
		Ver:VerpakkingID=Pla:VerpakkingID
		Access:Verpakking.TryFetch(Ver:Verpakking_PK)
		
		CLEAR(Rel:Record)
		Rel:RelatieID=Par:Leverancier
		Access:Relatie.TryFetch(Rel:Relatie_PK)
		
		CLEAR(Cel:Record)
		Cel:CelID=Pla:CelID
		Access:Cel.TryFetch(Cel:Cel_PK)
		
		CLEAR(ACel:Record)
		ACel:CelID=Pla:OverboekingCelID
		Access:ACel.TryFetch(ACel:Cel_PK)
		
		CLEAR(Art:Record)
		Art:ArtikelID=Pla:ArtikelID
		Access:ViewArtikel.TryFetch(Art:Artikel_PK)
		
		Loc:Rij+=1

		db.DebugOut('ORR: (' & Pla:PlanningID & ',' & Pla2:PlanningID & ',' & CLIP(Pla2:FirmaNaam) & ',' & CLIP(Rel:FirmaNaam) & ')')
		
		IF Pla:OverboekingCelID <> 0 THEN
			Loc:Ole{'Application.Range(A'&Loc:Rij&').Value'}='Overboek'
			Loc:Ole{'Application.Range(E'&Loc:Rij&').Value'}=Rel:FirmaNaam
		ELSE
			Loc:Ole{'Application.Range(A'&Loc:Rij&').Value'}='Inslag'
			Loc:Ole{'Application.Range(E'&Loc:Rij&').Value'}=Pla2:FirmaNaam
		END
		
		IF CLIP(LEFT(FORMAT(Par:ExternPartijnr, @N_10B))) = '' THEN
			Loc:Ole{'Application.Range(B'&Loc:Rij&').Value'}=CLIP(LEFT(FORMAT(Par:PartijID, @N_10B)))
		ELSE
			Loc:Ole{'Application.Range(B'&Loc:Rij&').Value'}=CLIP(LEFT(FORMAT(Par:PartijID, @N_10B))) & ' \ ' & CLIP(LEFT(FORMAT(Par:ExternPartijnr, @S30)))
		.
		Loc:Ole{'Application.Range(C'&Loc:Rij&').Value'}=CLIP(LEFT(Pla:ArtikelID))
		Loc:Ole{'Application.Range(D'&Loc:Rij&').Value'}=Art:Artikeloms
		Loc:Ole{'Application.Range(F'&Loc:Rij&').Value'}=VER:VerpakkingOmschrijving
		Loc:Ole{'Application.Range(G'&Loc:Rij&').Value'}=Pla:KG
		! Verwijderd n.a.v. mail van 5-10-2011
		!Loc:Ole{'Application.Range(H'&Loc:Rij&').Value'}=Pla:Pallets
        IF GLO:HidePlanningInstructie = 0 THEN
            Loc:Ole{'Application.Range(H'&Loc:Rij&').Value'}=Pla:Instructie
        END            
		!Loc:Ole{'Application.Range(J'&Loc:Rij&').Value'}=Pla:Transport
		
		IF (LOC:ExcelInkoop <> 1)
		! Verwijderd n.a.v. mail van 5-10-2011
			!Loc:Ole{'Application.Range(K'&Loc:Rij&').Value'}=CEL:CelOms
			!Loc:Ole{'Application.Range(L'&Loc:Rij&').Value'}=ACel:CelOms
			
			!IF Pla:Verwerkt = 1
			!	Loc:Ole{'Application.Range(M'&Loc:Rij&').Value'}='X'.
		.
		
		Do TrekLijntjes
	END

	
	Loc:Rij += 2
	Loc:Ole{'Application.Range(A'&Loc:Rij&').Value'}='Laden:'
	Loc:Rij += 1
	Loc:Ole{'Application.Range(A'&Loc:Rij&').Value'}='Lossen Ven Poultry BV:'	


	Loc:Ole{'Cells.Select'}
	Loc:Ole{'Application.Selection.Font.Name'} = 'Ariel'
	Loc:Ole{'Application.Selection.Font.Size'} = 14
	
	Loc:Ole{'Application.Rows(1:'&Loc:Rij&').AutoFit'}
	Loc:Ole{'Application.ActiveSheet.PageSetup.Zoom'} = 50 != Loc:Ole{'Application.ActiveSheet.PageSetup.BlackAndWhite'}!
	Loc:Ole{'Application.ActiveSheet.PageSetup.Orientation'} = 2 != Landscape
	Loc:Ole{'Application.ActiveSheet.PageSetup.TopMargin'} = 30 != Points (1/72 inch
	Loc:Ole{'Application.ActiveSheet.PageSetup.BottomMargin'} = 30 != Points (1/72 inch
	Loc:Ole{'Application.ActiveSheet.PageSetup.LeftMargin'} = 30 != Points (1/72 inch
	Loc:Ole{'Application.ActiveSheet.PageSetup.RightMargin'} = 30 != Points (1/72 inch
	
	Loc:Ole{'Application.Visible'}=true ! nu pas excel laten zien
	
	!Loc:Ole{'Application.ActiveWindow.SelectedSheets.PrintPreview'}
	!LOC:ExcelMacroFile = CLIP(GETINI('Excel', 'MacroXLS',,'.\Voorraad.ini'))
	
	!Loc:Ole{'Application.Workbooks.Open('&CLIP(LOC:ExcelMacroFile)&')'}
	
	!pos# = INSTRING('\', CLIP(LOC:ExcelMacroFile), -1, LEN(CLIP(LOC:ExcelMacroFile)))
	!Loc:Ole{'Application.Run('&CLIP(SUB(CLIP(LOC:ExcelMacroFile), pos# + 1, LEN(CLIP(LOC:ExcelMacroFile)) - pos#)) & '!Macro1)'}
	
TrekLijntjes        Routine
	
	IF (LOC:ExcelInkoop <> 1)
		Loc:Ole{'Application.Range(A'&Loc:Rij&':H'&Loc:Rij&').Select'}
	ELSE
		Loc:Ole{'Application.Range(A'&Loc:Rij&':H'&Loc:Rij&').Select'}
	.
	  Loc:Ole{'Application.Selection.Borders(9).Weight'}=2 ! xlEdgeBottom
      Loc:Ole{'Application.Selection.Borders(10).Weight'}=2 ! xlEdgeRight
      Loc:Ole{'Application.Selection.Borders(7).Weight'}=2 ! xlEdgeLeft
      Loc:Ole{'Application.Selection.Borders(8).Weight'}=2 ! xlEdgeTop
      Loc:Ole{'Application.Selection.Borders(11).Weight'}=2 ! xlInsideVertical
!      ?Ole{'Application.Selection.Borders(12).Weight'}=2 ! xlInsideHorizontal

Vet                     Routine
	  Loc:Ole{'Application.Range(A'&Loc:Rij&':L'&Loc:Rij&').Font.Bold'}=True
	
ConvertDatum        ROUTINE
	IF YEAR(LOC:Datum) < 2005
		Loc:DatumVanSQL = DATE(1,1,2005) - 36163
		Loc:DatumTMSQL = DATE(1,1,2005) - 36163 + 1
	ELSE
		Loc:DatumVanSQL = Loc:DAtum - 36163
		Loc:DatumTMSQL = Loc:DAtum - 36163 + 1
	.

ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('BrowseTransfers')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Browse:1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('LOC:DatumVanSQL',LOC:DatumVanSQL)                  ! Added by: BrowseBox(ABC)
  BIND('LOC:DatumTMSQL',LOC:DatumTMSQL)                    ! Added by: BrowseBox(ABC)
  BIND('LOC:Datum',LOC:Datum)                              ! Added by: BrowseBox(ABC)
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  IF SELF.Request = SelectRecord
     SELF.AddItem(?Close,RequestCancelled)                 ! Add the close control to the window manger
  ELSE
     SELF.AddItem(?Close,RequestCompleted)                 ! Add the close control to the window manger
  END
  IF PRM:Datum = 0 THEN
  	LOC:Datum = TODAY()
  ELSE
  	LOC:Datum = PRM:Datum
  .
  
  DO ConvertDatum
  Relate:ACel.Open                                         ! File ACel used by this procedure, so make sure it's RelationManager is open
  Relate:Cel.SetOpenRelated()
  Relate:Cel.Open                                          ! File Cel used by this procedure, so make sure it's RelationManager is open
  Relate:OverboekingRit.SetOpenRelated()
  Relate:OverboekingRit.Open                               ! File OverboekingRit used by this procedure, so make sure it's RelationManager is open
  Relate:Partij.Open                                       ! File Partij used by this procedure, so make sure it's RelationManager is open
  Relate:Planning.SetOpenRelated()
  Relate:Planning.Open                                     ! File Planning used by this procedure, so make sure it's RelationManager is open
  Relate:PlanningInkoop.Open                               ! File PlanningInkoop used by this procedure, so make sure it's RelationManager is open
  Relate:Sjabloon.Open                                     ! File Sjabloon used by this procedure, so make sure it's RelationManager is open
  Relate:ViewArtikel.Open                                  ! File ViewArtikel used by this procedure, so make sure it's RelationManager is open
  Access:Relatie.UseFile                                   ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:OverboekingRitRegel.UseFile                       ! File referenced in 'Other Files' so need to inform it's FileManager
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:OverboekingRit,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  WinAlertMouseZoom()
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1.FileLoaded = 1                                      ! This is a 'file loaded' browse
  BRW1.AddSortOrder(,OR:PK_OverboekingRit)                 ! Add the sort order for OR:PK_OverboekingRit for sort order 1
  BRW1.AddLocator(BRW1::Sort1:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort1:Locator.Init(,OR:OverboekingRitID,,BRW1)     ! Initialize the browse locator using  using key: OR:PK_OverboekingRit , OR:OverboekingRitID
  BRW1.AddSortOrder(,OR:FK_OverboekingRit)                 ! Add the sort order for OR:FK_OverboekingRit for sort order 2
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 2
  BRW1::Sort0:Locator.Init(,OR:DatumTijd,,BRW1)            ! Initialize the browse locator using  using key: OR:FK_OverboekingRit , OR:DatumTijd
  BRW1.SetFilter('(OR:DatumTijd >= LOC:DatumVanSQL AND OR:DatumTijd << LOC:DatumTMSQL)') ! Apply filter expression to browse
  BRW1.AddField(OR:OverboekingRitID,BRW1.Q.OR:OverboekingRitID) ! Field OR:OverboekingRitID is a hot field or requires assignment from browse
  BRW1.AddField(OR:DatumTijd_DATE,BRW1.Q.OR:DatumTijd_DATE) ! Field OR:DatumTijd_DATE is a hot field or requires assignment from browse
  BRW1.AddField(OR:DatumTijd_TIME,BRW1.Q.OR:DatumTijd_TIME) ! Field OR:DatumTijd_TIME is a hot field or requires assignment from browse
  BRW1.AddField(OR:Opmerking,BRW1.Q.OR:Opmerking)          ! Field OR:Opmerking is a hot field or requires assignment from browse
  BRW1.AddField(OR:DatumTijd,BRW1.Q.OR:DatumTijd)          ! Field OR:DatumTijd is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('BrowseTransfers',QuickWindow)              ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  BRW1.AskProcedure = 1                                    ! Will call: UpdateTransfers(LOC:Datum)
  SELF.SetAlerts()
  NetLocalRefreshDate = today()         ! NetTalk (NetRefresh)
  NetLocalRefreshTime = clock()
  EnterByTabManager.Init(False)
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:ACel.Close
    Relate:Cel.Close
    Relate:OverboekingRit.Close
    Relate:Partij.Close
    Relate:Planning.Close
    Relate:PlanningInkoop.Close
    Relate:Sjabloon.Close
    Relate:ViewArtikel.Close
  END
  IF SELF.Opened
    INIMgr.Update('BrowseTransfers',QuickWindow)           ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.Reset PROCEDURE(BYTE Force=0)

  CODE
  SELF.ForcedReset += Force
  IF QuickWindow{Prop:AcceptAll} THEN RETURN.
    NetLocalRefreshDate = today()         ! NetTalk (NetRefresh)
    NetLocalRefreshTime = clock()
  PARENT.Reset(Force)


ThisWindow.Run PROCEDURE(USHORT Number,BYTE Request)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Run(Number,Request)
  IF SELF.Request = ViewRecord
    ReturnValue = RequestCancelled                         ! Always return RequestCancelled if the form was opened in ViewRecord mode
  ELSE
    GlobalRequest = Request
    UpdateTransfers(LOC:Datum)
    ReturnValue = GlobalResponse
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
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?Excel
      ThisWindow.Update()
      Get(BRW1.Q,Choice(?Browse:1))
      CLEAR(OR:Record)
      OR:OverboekingRitID=BRW1.Q.OR:OverboekingRitID
      IF (Access:OverboekingRit.TryFetch(OR:PK_OverboekingRit) = Level:Benign)
      	DO ExportExcel
      ELSE
      	MESSAGE('Geen overboeking-rit geselecteerd')
      .
      
      BRW1.ResetQueue(Reset:Done)
    END
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue


ThisWindow.TakeEvent PROCEDURE

ReturnValue          BYTE,AUTO

Looped BYTE
  CODE
    If ThisNetRefresh.NeedReset(NetLocalRefreshDate,NetLocalRefreshTime,NetLocalDependancies) ! NetTalk (NetRefresh)
      Self.Reset(1)                      ! NetTalk (NetRefresh)
    End
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


ThisWindow.TakeFieldEvent PROCEDURE

ReturnValue          BYTE,AUTO

Looped BYTE
  CODE
  LOOP                                                     ! This method receives all field specific events
    IF Looped
      RETURN Level:Notify
    ELSE
      Looped = 1
    END
  ReturnValue = PARENT.TakeFieldEvent()
  CASE FIELD()
  OF ?LOC:Datum
    DO ConvertDatum
    BRW1.ResetQueue(Reset:Queue)
    BRW1.ResetFromView()
  END
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


BRW1.Ask PROCEDURE(BYTE Request)

ReturnValue          BYTE,AUTO

  CODE
  !GET(BRW1.Q, CHOICE(?Browse:1))
  !IF NOT(ERROR()) THEN
  !    MESSAGE(BRW1.Q.OR:OverboekingRitID)
  !END
  ReturnValue = PARENT.Ask(Request)
  !BRW1.ResetQueue(Reset:Done)
  BRW1.ResetQueue(Queue:Browse:1)
  
  !LOOP I# = 1 TO RECORDS(BRW1.Q)
  !    GET(BRW1.Q, I#)
  !    IF BRW1.Q.OR:OverboekingRitID = LOC:RitID THEN
  !        ?Browse:1{PROP:Selected
  !    END
  !END
  RETURN ReturnValue


BRW1.Init PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)

  CODE
  SELF.SelectControl = ?Select:2
  SELF.HideSelect = 1                                      ! Hide the select button when disabled
  PARENT.Init(ListBox,Posit,V,Q,RM,WM)
  IF WM.Request <> ViewRecord                              ! If called for anything other than ViewMode, make the insert, change & delete controls available
    SELF.InsertControl=?Insert:4
    SELF.ChangeControl=?Change:4
    SELF.DeleteControl=?Delete:4
  END
  SELF.ViewControl = ?View:3                               ! Setup the control used to initiate view only mode


BRW1.ResetSort PROCEDURE(BYTE Force)

ReturnValue          BYTE,AUTO

  CODE
  IF CHOICE(?CurrentTab) = 2
    RETURN SELF.SetSort(1,Force)
  ELSE
    RETURN SELF.SetSort(2,Force)
  END
  ReturnValue = PARENT.ResetSort(Force)
  RETURN ReturnValue


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window
  SELF.SetStrategy(?LOC:Datum:Prompt, Resize:FixLeft+Resize:FixTop, Resize:LockSize) ! Override strategy for ?LOC:Datum:Prompt
  SELF.SetStrategy(?LOC:Datum, Resize:FixLeft+Resize:FixTop, Resize:LockSize) ! Override strategy for ?LOC:Datum

