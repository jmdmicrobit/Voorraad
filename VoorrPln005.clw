

   MEMBER('VoorrPln.clw')                                  ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABDROPS.INC'),ONCE
   INCLUDE('ABPOPUP.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABUTIL.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('VOORRPLN005.INC'),ONCE        !Local module procedure declarations
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

!!! <summary>
!!! Generated from procedure template - Window
!!! Form Planning
!!! </summary>
UpdateOverboeking PROCEDURE (PRM:ArtikelID, PRM:PartijCelID,PRM:CelLocatieID, PRM:OverboekingPlanningID, PRM:KG)

CurrentTab           STRING(80)                            ! 
ActionMessage        CSTRING(40)                           ! 
LOC:VerpakkingID     LONG                                  ! 
LOC:CelID            LONG                                  ! 
LOC:VoorraadKG       LONG                                  ! 
LOC:VoorraadPallets  LONG                                  ! 
LOC:PartijCelID      CSTRING(26)                           ! 
LOC:ArtikelID        CSTRING(31)                           ! 
LOC:Planning         STRING(8)                             ! 
LOC:VerpakkingID2    LONG                                  ! 
LOC:CelID2           LONG                                  ! 
LOC:Memo             CSTRING(101)                          ! 
LOC:Instructie       CSTRING(101)                          ! 
LOC:Transport        CSTRING(101)                          ! 
LOC:PressedOK        BYTE                                  ! 
LOC:BeschikbareVoorraad DECIMAL(9,2)                       ! 
LOC:OrigineelPartijCelID CSTRING(26)                       ! 
LOC:OrigineelVerkoopKG DECIMAL(9,2)                        ! 
LOC:VerkoopKG        DECIMAL(9,2)                          ! 
Loc:NieuwKG          DECIMAL(10,2)                         ! 
Loc:NieuwPallet      LONG                                  ! 
Loc:OverboekSoort    CSTRING(51)                           ! 
FDCB7::View:FileDropCombo VIEW(ViewArtikel)
                       PROJECT(Art:ArtikelOms)
                     END
FDCB8::View:FileDropCombo VIEW(Verpakking)
                       PROJECT(Ver:VerpakkingOmschrijving)
                     END
FDCB9::View:FileDropCombo VIEW(Cel)
                       PROJECT(CEL:CelOms)
                       PROJECT(CEL:CelID)
                     END
FDCB4::View:FileDropCombo VIEW(ViewVoorraadPartij)
                       PROJECT(VVPar:PartijCelID)
                       PROJECT(VVPar:VoorraadKG)
                       PROJECT(VVPar:PartijID)
                       PROJECT(VVPar:CelID)
                       JOIN(ACel:CEL_PK,VVPar:CelID)
                         PROJECT(ACel:CelOms)
                         PROJECT(ACel:CelID)
                       END
                       JOIN(Par:Partij_PK,VVPar:PartijID)
                         PROJECT(Par:PartijID)
                         PROJECT(Par:ExternPartijnr)
                         PROJECT(Par:AanmaakDatum_DATE)
                         PROJECT(Par:Leverancier)
                         PROJECT(Par:VerpakkingID)
                         JOIN(AREL:Relatie_PK,Par:Leverancier)
                           PROJECT(AREL:FirmaNaam)
                           PROJECT(AREL:RelatieID)
                         END
                         JOIN(AVP:Verpakking_PK,Par:VerpakkingID)
                           PROJECT(AVP:VerpakkingOmschrijving)
                           PROJECT(AVP:VerpakkingID)
                         END
                       END
                       JOIN(VPPar:PartijCelID_K,VVPar:PartijCelID)
                         PROJECT(VPPar:PartijCelID)
                       END
                       JOIN(VPParT:PK_ViewPlanningPartijTotaal,VVPar:PartijID)
                         PROJECT(VPParT:VerkoopKG)
                         PROJECT(VPParT:PartijID)
                       END
                       JOIN(VVParT:PK_ViewVoorraadPartijTotaal,VVPar:PartijID)
                         PROJECT(VVParT:VoorraadKG)
                         PROJECT(VVParT:PartijID)
                       END
                     END
FDCB13::View:FileDropCombo VIEW(AAACel)
                       PROJECT(AAACel:CelOms)
                       PROJECT(AAACel:CelID)
                     END
FDCB14::View:FileDropCombo VIEW(ACelLocatie)
                       PROJECT(ACL:Locatienaam)
                       PROJECT(ACL:CelLocatieID)
                       PROJECT(ACL:CelID)
                     END
Queue:FileDropCombo  QUEUE                            !
Art:ArtikelOms         LIKE(Art:ArtikelOms)           !List box control field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
Queue:FileDropCombo:1 QUEUE                           !
Ver:VerpakkingOmschrijving LIKE(Ver:VerpakkingOmschrijving) !List box control field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
Queue:FileDropCombo:2 QUEUE                           !
CEL:CelOms             LIKE(CEL:CelOms)               !List box control field - type derived from field
CEL:CelID              LIKE(CEL:CelID)                !Primary key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
Queue:FileDropCombo:3 QUEUE                           !
VVPar:PartijCelID      LIKE(VVPar:PartijCelID)        !List box control field - type derived from field
Par:PartijID           LIKE(Par:PartijID)             !List box control field - type derived from field
Par:ExternPartijnr     LIKE(Par:ExternPartijnr)       !List box control field - type derived from field
VVParT:VoorraadKG      LIKE(VVParT:VoorraadKG)        !List box control field - type derived from field
VPParT:VerkoopKG       LIKE(VPParT:VerkoopKG)         !List box control field - type derived from field
Par:AanmaakDatum_DATE  LIKE(Par:AanmaakDatum_DATE)    !List box control field - type derived from field
ACel:CelOms            LIKE(ACel:CelOms)              !List box control field - type derived from field
VVPar:VoorraadKG       LIKE(VVPar:VoorraadKG)         !List box control field - type derived from field
LOC:VerkoopKG          LIKE(LOC:VerkoopKG)            !List box control field - type derived from local data
LOC:BeschikbareVoorraad LIKE(LOC:BeschikbareVoorraad) !List box control field - type derived from local data
AREL:FirmaNaam         LIKE(AREL:FirmaNaam)           !List box control field - type derived from field
AVP:VerpakkingOmschrijving LIKE(AVP:VerpakkingOmschrijving) !List box control field - type derived from field
VVPar:PartijID         LIKE(VVPar:PartijID)           !Browse hot field - type derived from field
ACel:CelID             LIKE(ACel:CelID)               !Related join file key field - type derived from field
AREL:RelatieID         LIKE(AREL:RelatieID)           !Related join file key field - type derived from field
AVP:VerpakkingID       LIKE(AVP:VerpakkingID)         !Related join file key field - type derived from field
VPPar:PartijCelID      LIKE(VPPar:PartijCelID)        !Related join file key field - type derived from field
VPParT:PartijID        LIKE(VPParT:PartijID)          !Related join file key field - type derived from field
VVParT:PartijID        LIKE(VVParT:PartijID)          !Related join file key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
Queue:FileDropCombo:4 QUEUE                           !
AAACel:CelOms          LIKE(AAACel:CelOms)            !List box control field - type derived from field
AAACel:CelID           LIKE(AAACel:CelID)             !Browse hot field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
Queue:FileDropCombo:5 QUEUE                           !
ACL:Locatienaam        LIKE(ACL:Locatienaam)          !List box control field - type derived from field
ACL:CelLocatieID       LIKE(ACL:CelLocatieID)         !Browse hot field - type derived from field
ACL:CelID              LIKE(ACL:CelID)                !Browse hot field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
LocEnableEnterByTab  BYTE(1)                               !Used by the ENTER Instead of Tab template
EnterByTabManager    EnterByTabClass
History::Pla:Record  LIKE(Pla:RECORD),THREAD
QuickWindow          WINDOW('Form Planning'),AT(,,359,330),FONT('MS Sans Serif',8,,,CHARSET:DEFAULT),DOUBLE,CENTER, |
  GRAY,IMM,MDI,HLP('UpdatePlanning'),SYSTEM
                       SHEET,AT(4,4,355,307),USE(?CurrentTab)
                         TAB('&1) General'),USE(?Tab:1)
                           PROMPT('Artikel:'),AT(9,26),USE(?Pla:ArtikelID:Prompt),TRN
                           COMBO(@s60),AT(69,27,282,10),USE(Art:ArtikelOms),DROP(25),FORMAT('240L(2)~Omschrijving~L(3)@s60@'), |
  FROM(Queue:FileDropCombo),REQ
                           PROMPT('Partij:'),AT(9,42),USE(?PROMPT1),TRN
                           COMBO(@s25),AT(69,42,177,10),USE(VVPar:PartijCelID),DROP(25,700),FORMAT('0L(2)|~Partij.' & |
  'Cel~C(0)@s25@[39R(2)|M~Intern~C(0)@n-14.@45L(2)|M~Extern~C(1)@s20@52R(2)|M~Voorraad ' & |
  '(KG)~C(0)@n-12`2@54R(2)|M~Verkocht (KG)~C(0)@n-12`2@47L(2)|~Inslagdatum~C(0)@d17@](2' & |
  '51)|~Partij~[40L(2)|M~Cel~C(0)@s50@50R(2)|M~Voorraad (KG)~C(0)@n-12`2@55R(2)|M~Verko' & |
  'cht (KG)~C(0)@n-13`2@78R(2)|M~Beschikbaar (KG)~C(0)@n-13`2@](211)|~Cel~74L(2)|M~Leve' & |
  'rancier~C(0)@s50@80L(2)|M~Verpakking~C(0)@s50@'),FROM(Queue:FileDropCombo:3),IMM
                           BUTTON('Leeg'),AT(251,40,34),USE(?LeegPartij)
                           BUTTON('Neem voorraad'),AT(287,40),USE(?NeemVoorraad)
                           PROMPT('Verpakking:'),AT(9,58),USE(?Pla:VerpakkingID:Prompt),TRN
                           COMBO(@s50),AT(69,58,282,10),USE(Ver:VerpakkingOmschrijving),DROP(25),FORMAT('200L(2)~Om' & |
  'schrijving~L(3)@s50@'),FROM(Queue:FileDropCombo:1),IMM
                           PROMPT('Van Cel:'),AT(9,73),USE(?Pla:CelID:Prompt),TRN
                           COMBO(@s50),AT(69,74,282,10),USE(CEL:CelOms),DROP(25),FORMAT('200L(2)~Omschrijving~L(3)@s50@'), |
  FROM(Queue:FileDropCombo:2),IMM
                           PROMPT('Locatie:'),AT(21,86),USE(?PROMPT3),TRN
                           STRING(@S10),AT(68,88),USE(CL:Locatienaam,,?CL:Locatienaam:2),FONT('Microsoft Sans Serif', |
  ,,FONT:bold),TRN
                           PROMPT('Overboek Soort:'),AT(9,99),USE(?Loc:OverboekSoort:Prompt)
                           LIST,AT(69,99,282,10),USE(Loc:OverboekSoort),DROP(5),FROM('Overboeking|Verplaatsing|Cor' & |
  'rectie|Afboeking')
                           PROMPT('Naar Cel:'),AT(9,113),USE(?PROMPT2),TRN
                           COMBO(@s50),AT(69,114,282,10),USE(AAACel:CelOms),DROP(5),FORMAT('200L(2)|M~Omschrijving~@s50@'), |
  FROM(Queue:FileDropCombo:4),IMM
                           STRING('Locatie:'),AT(19,128),USE(?STRING1),TRN
                           COMBO(@s50),AT(69,129,282,10),USE(ACL:Locatienaam),VSCROLL,DROP(25),FORMAT('200L(2)|M~L' & |
  'ocatienaam~L(0)@s50@'),FROM(Queue:FileDropCombo:5),IMM
                           PROMPT('KG:'),AT(9,144),USE(?Pla:KG:Prompt),TRN
                           ENTRY(@n12_`2),AT(69,144,64,10),USE(Pla:KG),RIGHT(2),REQ
                           PROMPT('Pallets:'),AT(9,160),USE(?Pla:Pallets:Prompt),TRN
                           ENTRY(@n14),AT(69,160,64,10),USE(Pla:Pallets),RIGHT(2)
                           PROMPT('Nieuw KG:'),AT(173,145,53,10),USE(?Loc:NieuwKG:Prompt)
                           ENTRY(@n12_`2),AT(254,146,54,9),USE(Pla:NieuwKG)
                           PROMPT('Nieuw Pallets:'),AT(173,162),USE(?Loc:NieuwPallet:Prompt)
                           ENTRY(@n-14),AT(254,161,60,10),USE(Pla:NieuwPallets),RIGHT(2)
                           PROMPT('Datum:'),AT(11,175),USE(?Pla:Planning_DATE:Prompt),TRN
                           ENTRY(@d6-),AT(69,175,64,10),USE(Pla:Planning_DATE),RIGHT(2)
                           BUTTON('...'),AT(137,173,12,12),USE(?Calendar)
                           PROMPT('Tijdstip:'),AT(173,176),USE(?Pla:Planning_TIME:Prompt),TRN
                           ENTRY(@t7),AT(254,176,41,10),USE(Pla:Planning_TIME),RIGHT(2)
                           PROMPT('Instructie:'),AT(11,189),USE(?Pla:Instructie:Prompt),CENTER,TRN
                           TEXT,AT(69,189,282,58),USE(Pla:Instructie,,?Pla:Instructie:2)
                           PROMPT('Transport:'),AT(11,251),USE(?Pla:Transport:Prompt),TRN
                           TEXT,AT(69,252,283,50),USE(Pla:Transport,,?Pla:Transport:2)
                         END
                       END
                       BUTTON('&OK'),AT(235,314,49,14),USE(?OK),LEFT,ICON('WAOK.ICO'),DEFAULT,FLAT,MSG('Accept dat' & |
  'a and close the window'),TIP('Accept data and close the window')
                       BUTTON('&Annuleren'),AT(287,314,69,14),USE(?Cancel),LEFT,ICON('WACANCEL.ICO'),FLAT,MSG('Cancel operation'), |
  TIP('Cancel operation')
                     END

    omit('***',WE::CantCloseNowSetHereDone=1)  !Getting Nested omit compile error, then uncheck the "Check for duplicate CantCloseNowSetHere variable declaration" in the WinEvent local template
WE::CantCloseNowSetHereDone equate(1)
WE::CantCloseNowSetHere     long
    !***
ThisWindow           CLASS(WindowManager)
Ask                    PROCEDURE(),DERIVED
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
PrimeUpdate            PROCEDURE(),BYTE,PROC,DERIVED
Run                    PROCEDURE(),BYTE,PROC,DERIVED
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED
TakeCompleted          PROCEDURE(),BYTE,PROC,DERIVED
TakeEvent              PROCEDURE(),BYTE,PROC,DERIVED
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
FDCB7                CLASS(FileDropComboClass)             ! File drop combo manager
Q                      &Queue:FileDropCombo           !Reference to browse queue type
                     END

FDCB8                CLASS(FileDropComboClass)             ! File drop combo manager
Q                      &Queue:FileDropCombo:1         !Reference to browse queue type
                     END

FDCB9                CLASS(FileDropComboClass)             ! File drop combo manager
Q                      &Queue:FileDropCombo:2         !Reference to browse queue type
                     END

FDCB4                CLASS(FileDropComboClass)             ! File drop combo manager
Q                      &Queue:FileDropCombo:3         !Reference to browse queue type
SetQueueRecord         PROCEDURE(),DERIVED
                     END

FDCB13               CLASS(FileDropComboClass)             ! File drop combo manager
Q                      &Queue:FileDropCombo:4         !Reference to browse queue type
                     END

FDCB14               CLASS(FileDropComboClass)             ! File drop combo manager
Q                      &Queue:FileDropCombo:5         !Reference to browse queue type
                     END

Resizer              CLASS(WindowResizeClass)
Init                   PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)
                     END

Calendar11           CalendarClass
LocalClass          CLASS
HideControls           PROCEDURE()
                    END
Boeksoort           GROUP
Afboeking               String('Afboeking')
Verplaatsing            String('Verplaatsing')
Correctie               String('Correctie')
Overboeking             String('Overboeking')
                    END
CurCtrlFeq          LONG
FieldColorQueue     QUEUE
Feq                   LONG
OldColor              LONG
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

ThisWindow.Ask PROCEDURE

  CODE
  CASE SELF.Request                                        ! Configure the action message text
  OF ViewRecord
    ActionMessage = 'View Record'
  OF InsertRecord
    ActionMessage = 'Overboeking wordt toegevoegd'
  OF ChangeRecord
    ActionMessage = 'Record Will Be Changed'
  END
  QuickWindow{PROP:Text} = ActionMessage                   ! Display status message in title bar
  PARENT.Ask


ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('UpdateOverboeking')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Pla:ArtikelID:Prompt
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.HistoryKey = CtrlH
  SELF.AddHistoryFile(Pla:Record,History::Pla:Record)
  SELF.AddHistoryField(?Pla:KG,5)
  SELF.AddHistoryField(?Pla:Pallets,6)
  SELF.AddHistoryField(?Pla:NieuwKG,64)
  SELF.AddHistoryField(?Pla:NieuwPallets,65)
  SELF.AddHistoryField(?Pla:Planning_DATE,9)
  SELF.AddHistoryField(?Pla:Planning_TIME,10)
  SELF.AddHistoryField(?Pla:Instructie:2,20)
  SELF.AddHistoryField(?Pla:Transport:2,21)
  SELF.AddUpdateFile(Access:Planning)
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  Relate:AAACel.Open                                       ! File AAACel used by this procedure, so make sure it's RelationManager is open
  Relate:ACelLocatie.Open                                  ! File ACelLocatie used by this procedure, so make sure it's RelationManager is open
  Relate:APlanning.Open                                    ! File APlanning used by this procedure, so make sure it's RelationManager is open
  Relate:Cel.SetOpenRelated()
  Relate:Cel.Open                                          ! File Cel used by this procedure, so make sure it's RelationManager is open
  Relate:Mutatie.Open                                      ! File Mutatie used by this procedure, so make sure it's RelationManager is open
  Relate:Planning.SetOpenRelated()
  Relate:Planning.Open                                     ! File Planning used by this procedure, so make sure it's RelationManager is open
  Relate:Verpakking.Open                                   ! File Verpakking used by this procedure, so make sure it's RelationManager is open
  Relate:ViewArtikel.Open                                  ! File ViewArtikel used by this procedure, so make sure it's RelationManager is open
  Relate:ViewPlanningPartij.Open                           ! File ViewPlanningPartij used by this procedure, so make sure it's RelationManager is open
  Relate:ViewVoorraadPartij.Open                           ! File ViewVoorraadPartij used by this procedure, so make sure it's RelationManager is open
  Access:CelLocatie.UseFile                                ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:Relatie.UseFile                                   ! File referenced in 'Other Files' so need to inform it's FileManager
  SELF.FilesOpened = True
  SELF.Primary &= Relate:Planning
  IF SELF.Request = ViewRecord AND NOT SELF.BatchProcessing ! Setup actions for ViewOnly Mode
    SELF.InsertAction = Insert:None
    SELF.DeleteAction = Delete:None
    SELF.ChangeAction = Change:None
    SELF.CancelAction = Cancel:Cancel
    SELF.OkControl = 0
  ELSE
    SELF.ChangeAction = Change:Caller                      ! Changes allowed
    SELF.CancelAction = Cancel:Cancel                      ! No confirm cancel
    SELF.OkControl = ?OK
    IF SELF.PrimeUpdate() THEN RETURN Level:Notify.
  END
  SELF.Open(QuickWindow)                                   ! Open window
  	IF Self.Request = InsertRecord THEN
  		!Access:Planning.PrimeRecord(false)	
  		Pla:VerkoopID = 0
  		Pla:InkoopID = 0
  		Pla:ArtikelID = PRM:ArtikelID
  		LOC:PartijCelID = PRM:PartijCelID
  		Pla:CelLocatieID = PRM:CelLocatieID
  		Pla:KG = PRM:KG
  		Pla:Pallets = 0
  		Pla:Geprint = false
  		Pla:Verwerkt = false
  		Pla:MutatieGemaakt = false
  		Pla:Leverancier = 0
  		Pla:OverboekingCelID = 0
  		Pla:Instructie = ''
  		Pla:Transport = ''
  		Pla:PartijID = 0
  		Pla:Memo = ''
  		Pla:OverboekingPlanningID = PRM:OverboekingPlanningID
  		
  		CLEAR(VVPar:Record)
  		VVPar:PartijCelID = LOC:PartijCelID
  		IF (Access:ViewVoorraadPartij.TryFetch(VVPar:PartijCelID_K) = Level:Benign)
  			Pla:CelID = VVPar:CelID
  			Pla:VerpakkingID = VVPar:VerpakkingID
  		.
  		!Message(PRM:CelLocatieID,'PRM:CelLocatieID')
  		CL:CelLocatieID=PRM:CelLocatieID
  		Access:CelLocatie.Fetch(CL:PK_CelLocatie)
  		
  		Pla:Planning_DATE = TODAY()
  		Pla:Planning_TIME = CLOCK()
  	.
  
  	IF Self.Request=ChangeRecord 
  		IF Pla:Verwerkt = true OR Pla:MutatieGemaakt = true THEN
  			! Aanpassen, niet hier (zit geen voorraadcontrole op), maar in het voorraadverloop
  			MESSAGE('Geplande overboeking is reeds omgezet in voorraad-mutaties, wijzig deze in het voorraad-verloop')
  			RETURN RequestCancelled
  		.
  
  		IF Pla:PartijID <> 0 AND Pla:CelID <> 0
  			LOC:PartijCelID = CLIP(FORMAT(Pla:PartijID, @N05)) & '.' & CLIP(Pla:CelID)
  		ELSE
  			LOC:PartijCelID = ''
  		.
  	END
  
  	LOC:OrigineelPartijCelID = LOC:PartijCelID
  	LOC:OrigineelVerkoopKG = Pla:KG
  
  	CLEAR(VVPar:Record)
  	VVPar:PartijCelID = LOC:PartijCelID
  	IF (Access:ViewVoorraadPartij.TryFetch(VVPar:PartijCelID_K) <> Level:Benign)
  		LOC:PartijCelID = ''
  		Pla:PartijID=0
  		CLEAR(VVPar:Record)
  	ELSE
  		IF VVPar:ArtikelID <> Pla:ArtikelID THEN
  			LOC:PartijCelID = ''
  			Pla:PartijID=0
  			CLEAR(VVPar:Record)
  		.
  	.
  
  	IF NOT(LOC:PartijCelID='')
  		DISABLE(?Ver:VerpakkingOmschrijving)
  		DISABLE(?Cel:CelOms)
  	ELSE
  		DISABLE(?NeemVoorraad)
  		DISABLE(?LeegPartij)
  	.
  	
  	CLEAR(CEL:Record)
  	Cel:CelID=Pla:CelID
  	IF (Access:Cel.TryFetch(Cel:Cel_PK) <> Level:Benign) THEN CLEAR(CEL:Record).
  
      Clear(CL:Record)
      CL:CelLocatieID=Pla:CelLocatieID
      IF Access:CelLocatie.Fetch(CL:PK_CelLocatie)=Level:Benign
      END
      
      Clear(ACL:Record)
      ACL:CelLocatieID=Pla:OverboekCelLocatieID
      IF Access:ACelLocatie.Fetch(ACL:PK_CelLocatie)=Level:Benign
      END
  
      LOC:PressedOK = false
  
      IF GLO:HidePlanningInstructie = 1 THEN
          HIDE(?Pla:Instructie:2)
          HIDE(?Pla:Instructie:Prompt)
          ?Pla:Transport:Prompt{PROP:Ypos} = ?Pla:Instructie:2{PROP:Ypos}      !175
          ?Pla:Transport:2{PROP:Ypos} = ?Pla:Instructie:Prompt{PROP:Ypos} ! 189           ! 175    
          ?Pla:Transport:2{PROP:Height} = 110
      END
      IF Pla:OverboekSoort='' THEN Pla:OverboekSoort='Overboeking'.
      Loc:OverboekSoort=Pla:OverboekSoort
      LocalClass.HideControls()
  WinAlertMouseZoom()
  Do DefineListboxStyle
  IF SELF.Request = ViewRecord                             ! Configure controls for View Only mode
    DISABLE(?Art:ArtikelOms)
    DISABLE(?VVPar:PartijCelID)
    HIDE(?LeegPartij)
    HIDE(?NeemVoorraad)
    DISABLE(?Ver:VerpakkingOmschrijving)
    DISABLE(?CEL:CelOms)
    DISABLE(?Loc:OverboekSoort)
    DISABLE(?AAACel:CelOms)
    DISABLE(?ACL:Locatienaam)
    DISABLE(?Pla:KG)
    DISABLE(?Pla:Pallets)
    ?Pla:NieuwKG{PROP:ReadOnly} = True
    ?Pla:NieuwPallets{PROP:ReadOnly} = True
    DISABLE(?Pla:Planning_DATE)
    DISABLE(?Calendar)
    DISABLE(?Pla:Planning_TIME)
    DISABLE(?Pla:Instructie:2)
    DISABLE(?Pla:Transport:2)
  END
  Resizer.Init(AppStrategy:NoResize,Resize:SetMinSize)     ! Don't change the windows controls when window resized
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  FDCB7.Init(Art:ArtikelOms,?Art:ArtikelOms,Queue:FileDropCombo.ViewPosition,FDCB7::View:FileDropCombo,Queue:FileDropCombo,Relate:ViewArtikel,ThisWindow,GlobalErrors,0,0,0)
  FDCB7.RemoveDuplicatesFlag = TRUE
  FDCB7.Q &= Queue:FileDropCombo
  FDCB7.AddSortOrder(Art:Artikel_FK01)
  FDCB7.AddField(Art:ArtikelOms,FDCB7.Q.Art:ArtikelOms) !List box control field - type derived from field
  FDCB7.AddUpdateField(Art:ArtikelID,Pla:ArtikelID)
  ThisWindow.AddItem(FDCB7.WindowComponent)
  FDCB7.DefaultFill = 0
  FDCB8.Init(Ver:VerpakkingOmschrijving,?Ver:VerpakkingOmschrijving,Queue:FileDropCombo:1.ViewPosition,FDCB8::View:FileDropCombo,Queue:FileDropCombo:1,Relate:Verpakking,ThisWindow,GlobalErrors,0,1,0)
  FDCB8.Q &= Queue:FileDropCombo:1
  FDCB8.AddSortOrder(Ver:Verpakking_PK)
  FDCB8.AddField(Ver:VerpakkingOmschrijving,FDCB8.Q.Ver:VerpakkingOmschrijving) !List box control field - type derived from field
  FDCB8.AddUpdateField(Ver:VerpakkingID,Pla:VerpakkingID)
  ThisWindow.AddItem(FDCB8.WindowComponent)
  FDCB8.DefaultFill = 0
  FDCB9.Init(CEL:CelOms,?CEL:CelOms,Queue:FileDropCombo:2.ViewPosition,FDCB9::View:FileDropCombo,Queue:FileDropCombo:2,Relate:Cel,ThisWindow,GlobalErrors,0,1,0)
  FDCB9.Q &= Queue:FileDropCombo:2
  FDCB9.AddSortOrder(CEL:CEL_PK)
  FDCB9.AddField(CEL:CelOms,FDCB9.Q.CEL:CelOms) !List box control field - type derived from field
  FDCB9.AddField(CEL:CelID,FDCB9.Q.CEL:CelID) !Primary key field - type derived from field
  FDCB9.AddUpdateField(CEL:CelID,Pla:CelID)
  ThisWindow.AddItem(FDCB9.WindowComponent)
  FDCB9.DefaultFill = 0
  FDCB4.Init(VVPar:PartijCelID,?VVPar:PartijCelID,Queue:FileDropCombo:3.ViewPosition,FDCB4::View:FileDropCombo,Queue:FileDropCombo:3,Relate:ViewVoorraadPartij,ThisWindow,GlobalErrors,0,0,0)
  FDCB4.Q &= Queue:FileDropCombo:3
  FDCB4.AddSortOrder(VVPar:ArtikelID_PartijID_CelID_K)
  FDCB4.AddRange(VVPar:ArtikelID,Pla:ArtikelID)
  FDCB4.SetFilter('VVPar:VoorraadKG>0')
  FDCB4.AddField(VVPar:PartijCelID,FDCB4.Q.VVPar:PartijCelID) !List box control field - type derived from field
  FDCB4.AddField(Par:PartijID,FDCB4.Q.Par:PartijID) !List box control field - type derived from field
  FDCB4.AddField(Par:ExternPartijnr,FDCB4.Q.Par:ExternPartijnr) !List box control field - type derived from field
  FDCB4.AddField(VVParT:VoorraadKG,FDCB4.Q.VVParT:VoorraadKG) !List box control field - type derived from field
  FDCB4.AddField(VPParT:VerkoopKG,FDCB4.Q.VPParT:VerkoopKG) !List box control field - type derived from field
  FDCB4.AddField(Par:AanmaakDatum_DATE,FDCB4.Q.Par:AanmaakDatum_DATE) !List box control field - type derived from field
  FDCB4.AddField(ACel:CelOms,FDCB4.Q.ACel:CelOms) !List box control field - type derived from field
  FDCB4.AddField(VVPar:VoorraadKG,FDCB4.Q.VVPar:VoorraadKG) !List box control field - type derived from field
  FDCB4.AddField(LOC:VerkoopKG,FDCB4.Q.LOC:VerkoopKG) !List box control field - type derived from local data
  FDCB4.AddField(LOC:BeschikbareVoorraad,FDCB4.Q.LOC:BeschikbareVoorraad) !List box control field - type derived from local data
  FDCB4.AddField(AREL:FirmaNaam,FDCB4.Q.AREL:FirmaNaam) !List box control field - type derived from field
  FDCB4.AddField(AVP:VerpakkingOmschrijving,FDCB4.Q.AVP:VerpakkingOmschrijving) !List box control field - type derived from field
  FDCB4.AddField(VVPar:PartijID,FDCB4.Q.VVPar:PartijID) !Browse hot field - type derived from field
  FDCB4.AddField(ACel:CelID,FDCB4.Q.ACel:CelID) !Related join file key field - type derived from field
  FDCB4.AddField(AREL:RelatieID,FDCB4.Q.AREL:RelatieID) !Related join file key field - type derived from field
  FDCB4.AddField(AVP:VerpakkingID,FDCB4.Q.AVP:VerpakkingID) !Related join file key field - type derived from field
  FDCB4.AddField(VPPar:PartijCelID,FDCB4.Q.VPPar:PartijCelID) !Related join file key field - type derived from field
  FDCB4.AddField(VPParT:PartijID,FDCB4.Q.VPParT:PartijID) !Related join file key field - type derived from field
  FDCB4.AddField(VVParT:PartijID,FDCB4.Q.VVParT:PartijID) !Related join file key field - type derived from field
  FDCB4.AddUpdateField(VVPar:PartijCelID,LOC:PartijCelID)
  FDCB4.AddUpdateField(Par:VerpakkingID,LOC:VerpakkingID)
  FDCB4.AddUpdateField(VVPar:CelID,LOC:CelID)
  FDCB4.AddUpdateField(VVPar:PartijID,Pla:PartijID)
  ThisWindow.AddItem(FDCB4.WindowComponent)
  FDCB4.DefaultFill = 0
  FDCB13.Init(AAACel:CelOms,?AAACel:CelOms,Queue:FileDropCombo:4.ViewPosition,FDCB13::View:FileDropCombo,Queue:FileDropCombo:4,Relate:AAACel,ThisWindow,GlobalErrors,0,1,0)
  FDCB13.Q &= Queue:FileDropCombo:4
  FDCB13.AddSortOrder(AAACel:CEL_PK)
  FDCB13.AddField(AAACel:CelOms,FDCB13.Q.AAACel:CelOms) !List box control field - type derived from field
  FDCB13.AddField(AAACel:CelID,FDCB13.Q.AAACel:CelID) !Browse hot field - type derived from field
  FDCB13.AddUpdateField(AAACel:CelID,Pla:OverboekingCelID)
  ThisWindow.AddItem(FDCB13.WindowComponent)
  FDCB13.DefaultFill = 0
  FDCB14.Init(ACL:Locatienaam,?ACL:Locatienaam,Queue:FileDropCombo:5.ViewPosition,FDCB14::View:FileDropCombo,Queue:FileDropCombo:5,Relate:ACelLocatie,ThisWindow,GlobalErrors,0,1,0)
  FDCB14.Q &= Queue:FileDropCombo:5
  FDCB14.AddSortOrder(ACL:FK_CelLocatie)
  FDCB14.AddRange(ACL:CelID,Pla:OverboekingCelID)
  FDCB14.AddField(ACL:Locatienaam,FDCB14.Q.ACL:Locatienaam) !List box control field - type derived from field
  FDCB14.AddField(ACL:CelLocatieID,FDCB14.Q.ACL:CelLocatieID) !Browse hot field - type derived from field
  FDCB14.AddField(ACL:CelID,FDCB14.Q.ACL:CelID) !Browse hot field - type derived from field
  FDCB14.AddUpdateField(ACL:CelLocatieID,Pla:OverboekCelLocatieID)
  ThisWindow.AddItem(FDCB14.WindowComponent)
  FDCB14.DefaultFill = 0
  SELF.SetAlerts()
  EnterByTabManager.ExcludeControl(?Cancel)
  EnterByTabManager.ExcludeControl(?OK)
  EnterByTabManager.Init(False)
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:AAACel.Close
    Relate:ACelLocatie.Close
    Relate:APlanning.Close
    Relate:Cel.Close
    Relate:Mutatie.Close
    Relate:Planning.Close
    Relate:Verpakking.Close
    Relate:ViewArtikel.Close
    Relate:ViewPlanningPartij.Close
    Relate:ViewVoorraadPartij.Close
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.PrimeUpdate PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.PrimeUpdate()
    If returnValue = Level:Fatal  ! delete just occured
      ThisNetRefresh.Send('|Planning|ViewArtikel|Verpakking|Cel|ViewVoorraadPartij|AAACel|ACelLocatie|') ! NetTalk (NetRefresh)
    End
  		If returnValue = Level:Fatal  ! delete just occured
  			NetRefreshPlanningViews()
  		End
  RETURN ReturnValue


ThisWindow.Run PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  	IF Globalrequest=DeleteRecord
  		IF Pla:Verwerkt
  			RETURN RequestCancelled
  			
  			IF MESSAGE('Deze overboeking is al verwerkt, zeker dat deze overboeking en bijbehorende mutaties verwijderd moeten worden?','Verwerkte overboeking',ICON:Exclamation,BUTTON:Yes+BUTTON:No,BUTTON:No,1) <> BUTTON:Yes
  				RETURN ReturnValue
  			END
  
  			CLEAR(Mut:RECORD)
  			Mut:PlanningID = Pla:PlanningID
  			SET(Mut:Mutatie_FK02, Mut:Mutatie_FK02)
  			
  			LOOP UNTIL Access:Mutatie.Next()
  				IF Mut:PlanningID <> Pla:PlanningID THEN BREAK.
  				
  				IF Mut:SoortMutatie = 'OUIT' THEN
  					Access:Mutatie.DeleteRecord(0)
  				ELSIF Mut:SoortMutatie = 'OIN' THEN
  					Access:Mutatie.DeleteRecord(0)
  				END
  			.
  		END
  	END
  ReturnValue = PARENT.Run()
  IF SELF.Request = ViewRecord                             ! In View Only mode always signal RequestCancelled
    ReturnValue = RequestCancelled
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
    CASE ACCEPTED()
    OF ?LeegPartij
      IF MESSAGE('Zeker weten dat er geen partij meer geselecteerd moet zijn?', 'Geen partij', ICON:Exclamation, BUTTON:Yes+BUTTON:No, BUTTON:No) = BUTTON:Yes THEN
      	LOC:PartijCelID = ''
      	VVPar:PartijCelID = ''
      	Pla:PartijID = 0
      
      	DISPLAY(?VVPar:PartijCelID)
      
      	ENABLE(?Ver:VerpakkingOmschrijving)
      	ENABLE(?Cel:CelOms)
      	DISABLE(?NeemVoorraad)
      	DISABLE(?LeegPartij)
      END
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?VVPar:PartijCelID
      IF NOT(LOC:PartijCelID='')
      	Pla:VerpakkingID = LOC:VerpakkingID
      	Pla:CelID = LOC:CelID
      
      	db.DebugOut('PartijAccepted:'&Pla:VErpakkingID&','&Pla:CelID)
      
      	!FDCB8.ResetQueue(false)
      	!FDCB9.ResetQueue(false)
      
      	db.DebugOut('PartijAccepted-EVENT:'&EVENT())
      
      	!IF NOT(EVENT() = EVENT:Completed)
      		CLEAR(Ver:record)
      		Ver:VerpakkingID=Pla:VerpakkingID
      		Access:Verpakking.TryFetch(Ver:Verpakking_PK)
      
      		CLEAR(Cel:Record)
      		Cel:CelID=Pla:CelID
      		Access:Cel.TryFetch(Cel:CEL_PK)
      	
      		DISABLE(?Ver:VerpakkingOmschrijving)
      		DISABLE(?CEL:CelOms)
      		ENABLE(?NeemVoorraad)
      		ENABLE(?LeegPartij)
      
      		DISPLAY(?Ver:VerpakkingOmschrijving)
      		DISPLAY(?Cel:CelOms)
      
      	    IF Pla:KG = 0 !OR Pla:KG > VVPar:VoorraadKG
      			Pla:KG = FDCB4.Q.LOC:BeschikbareVoorraad
      		.
      
      		IF Pla:Pallets = 0 !OR Pla:Pallets > VVPar:VoorraadPallets
      			Pla:Pallets = VVPar:VoorraadPallets
      		.
      	!.
      END
    OF ?NeemVoorraad
      ThisWindow.Update()
      IF NOT(LOC:PartijCelID = '')
      	Pla:KG = VVPar:VoorraadKG
      	Pla:Pallets = VVPar:VoorraadPallets
      	DISPLAY(?Pla:KG)
      	DISPLAY(?Pla:Pallets)
      .
    OF ?Loc:OverboekSoort
          LocalClass.HideControls()
    OF ?AAACel:CelOms
      If 0{PROP:AcceptAll} = False Then
          If NOT ACL:CelID = AAACel:CelID Then
              Clear(ACL:Locatienaam)
              Clear(Pla:CelLocatieID)
              Display(?ACL:Locatienaam)
          End
      End
    OF ?Calendar
      ThisWindow.Update()
      Calendar11.SelectOnClose = True
      Calendar11.Ask('Select a Date',Pla:Planning_DATE)
      IF Calendar11.Response = RequestCompleted THEN
      Pla:Planning_DATE=Calendar11.SelectedDate
      DISPLAY(?Pla:Planning_DATE)
      END
      ThisWindow.Reset(True)
    OF ?OK
      ThisWindow.Update()
      IF SELF.Request = ViewRecord AND NOT SELF.BatchProcessing THEN
         POST(EVENT:CloseWindow)
      END
    END
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue


ThisWindow.TakeCompleted PROCEDURE

ReturnValue          BYTE,AUTO

Looped BYTE
  CODE
  IF Pla:CelID = 0 AND (Loc:OverboekSoort = Boeksoort.Overboeking OR Loc:OverboekSoort = Boeksoort.Verplaatsing)
  	Select(?CEL:CelOms)
  	RETURN ReturnValue
  .
  
  IF Pla:OverboekingCelID = 0 AND (Loc:OverboekSoort = Boeksoort.Overboeking OR Loc:OverboekSoort = Boeksoort.Verplaatsing)
  	Select(?AAACel:CelOms)
  	RETURN ReturnValue
  .
  
  IF Pla:CelLocatieID = 0 AND (Loc:OverboekSoort = Boeksoort.Overboeking OR Loc:OverboekSoort = Boeksoort.Verplaatsing)
      Select(?ACL:Locatienaam)
      RETURN ReturnValue
  .
  
  IF ACL:CelID <> Pla:OverboekingCelID THEN
      Message('Cel van de gekozen locatie komt niet overeen met de geselecteerde cel.|Selecteer opnieuw de locatie.')
      Select(?ACL:Locatienaam)
      RETURN ReturnValue
  .
  
  !IF Lco:OverboekSoort = 
   
  LOOP
    IF Looped
      RETURN Level:Notify
    ELSE
      Looped = 1
    END
  	IF Pla:Verwerkt OR Pla:MutatieGemaakt
  		IF NOT(MESSAGE('Deze overboeking is al verwerkt, Weet u zeker dat deze overboeking en bijbehorende mutaties gewijzigd moet worden?','Verwerkte overboeking',ICON:Exclamation,BUTTON:Yes+BUTTON:No,BUTTON:No,1) = BUTTON:Yes)
  			RETURN Level:Benign
  		END
  	END
  ReturnValue = PARENT.TakeCompleted()
  	IF Pla:Verwerkt OR Pla:MutatieGemaakt
  		CLEAR(Mut:RECORD)
  		Mut:PlanningID = Pla:PlanningID
  		SET(Mut:Mutatie_FK02, Mut:Mutatie_FK02)
  		LOOP UNTIL Access:Mutatie.Next()
  			IF Mut:PlanningID <> Pla:PlanningID THEN BREAK.
  
  			IF Mut:SoortMutatie = 'OUIT' THEN
  				Mut:DatumTijd_DATE = Pla:Planning_DATE
  				Mut:DatumTijd_TIME = Pla:Planning_TIME + 1
  				Mut:UitslagKG = Pla:KG
  				Mut:UitslagPallet = Pla:Pallets
  				Mut:NaarCELID = Pla:OverboekingCelID
  				Access:Mutatie.Update()
  			ELSIF Mut:SoortMutatie = 'OIN' THEN
  				Mut:DatumTijd_DATE = Pla:Planning_DATE
  				Mut:DatumTijd_TIME = Pla:Planning_TIME
  				Mut:InslagKG = Pla:KG
  				Mut:InslagPallet = Pla:Pallets
  				Mut:NaarCELID = Pla:CelID
  				Access:Mutatie.Update()
  			END
  		.
  	END
    ThisNetRefresh.Send('|Planning|ViewArtikel|Verpakking|Cel|ViewVoorraadPartij|AAACel|ACelLocatie|') ! NetTalk (NetRefresh)
  	NetRefreshPlanningViews()
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
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

LocalClass.HideControls    PROCEDURE()
CODE
    IF NOT INLIST(Loc:OverboekSoort,Boeksoort.Afboeking, Boeksoort.Verplaatsing, Boeksoort.Correctie, Boeksoort.Overboeking)
        Message('Onbekende OverBoeksoort '&Loc:OverboekSoort)
    END
    
   
    ?Pla:Transport:Prompt{Prop:Hide}=CHOOSE(Loc:OverboekSoort= Boeksoort.Overboeking, FALSE, TRUE)
    ?Pla:Transport:2{Prop:Hide}=CHOOSE(Loc:OverboekSoort= Boeksoort.Overboeking, FALSE, TRUE)
    
    ?PROMPT2{Prop:Hide}=CHOOSE(Loc:OverboekSoort = Boeksoort.Afboeking OR Loc:OverboekSoort = Boeksoort.Correctie, TRUE, FALSE)
    ?AAACel:CelOms{Prop:Hide}=CHOOSE(Loc:OverboekSoort = Boeksoort.Afboeking OR Loc:OverboekSoort = Boeksoort.Correctie, TRUE, FALSE)
    ?STRING1{Prop:Hide}=CHOOSE(Loc:OverboekSoort = Boeksoort.Afboeking OR Loc:OverboekSoort = Boeksoort.Correctie, TRUE, FALSE)
    ?ACL:Locatienaam{Prop:Hide}=CHOOSE(Loc:OverboekSoort = Boeksoort.Afboeking OR Loc:OverboekSoort = Boeksoort.Correctie, TRUE, FALSE)
    
    ?Pla:KG:Prompt{Prop:Disable}=CHOOSE(Loc:OverboekSoort = Boeksoort.Afboeking OR Loc:OverboekSoort=Boeksoort.Correctie, TRUE, FALSE)
    ?Pla:KG{Prop:Disable}=CHOOSE(Loc:OverboekSoort = Boeksoort.Afboeking OR Loc:OverboekSoort=Boeksoort.Correctie, TRUE, FALSE)
    ?Pla:Pallets:Prompt{Prop:Disable}=CHOOSE(Loc:OverboekSoort = Boeksoort.Afboeking OR Loc:OverboekSoort=Boeksoort.Correctie, TRUE, FALSE)
    ?Pla:Pallets{Prop:Disable}=CHOOSE(Loc:OverboekSoort = Boeksoort.Afboeking OR Loc:OverboekSoort=Boeksoort.Correctie, TRUE, FALSE)
    
    ?Pla:NieuwKG{Prop:Hide}=CHOOSE(Loc:OverboekSoort = Boeksoort.Correctie, FALSE, TRUE)
    ?Loc:NieuwKG:Prompt{Prop:Hide}=CHOOSE(Loc:OverboekSoort = Boeksoort.Correctie, FALSE, TRUE)
    ?Pla:NieuwPallets{Prop:Hide}=CHOOSE(Loc:OverboekSoort = Boeksoort.Correctie, FALSE, TRUE)
    ?Loc:NieuwPallet:Prompt{Prop:Hide}=CHOOSE(Loc:OverboekSoort = Boeksoort.Correctie, FALSE, TRUE)
    
    Case Loc:OverboekSoort
    OF 'Overboeking'
    OF 'Verplaatsing'
    OF 'Afboeking'
    OF 'Correctie'
    ELSE
        Message('Onbekende OverBoeksoort '&Loc:OverboekSoort)
        
        END

FDCB4.SetQueueRecord PROCEDURE

  CODE
  CLEAR(VPPar:Record)
  VPPar:PartijCelID=VVPar:PartijCelID
  Access:ViewPlanningPartij.TryFetch(VPPar:PartijCelID_K)
  
  LOC:VerkoopKG = VPPar:VerkoopKG
  !Het betreft een overboeking, die wordt niet bij de VerkoopKG-telling meegenomen
  !IF VVPar:PartijCelID = LOC:OrigineelPartijCelID THEN
  !	LOC:VerkoopKG -= LOC:OrigineelVerkoopKG
  !.
  
  LOC:BeschikbareVoorraad = VVPar:VoorraadKG - LOC:VerkoopKG
  
  
  
  PARENT.SetQueueRecord
  


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window

!!! <summary>
!!! Generated from procedure template - Window
!!! Browse the Planning file
!!! </summary>
BrowseOverboeking PROCEDURE 

CurrentTab           STRING(80)                            ! 
LOC:MaxCelID         LONG                                  ! 
LOC:MinCelID         LONG                                  ! 
LOC:NietVerwerkt     BYTE                                  ! 
BRW1::View:Browse    VIEW(Planning)
                       PROJECT(Pla:OverboekingPlanningID)
                       PROJECT(Pla:Planning_DATE)
                       PROJECT(Pla:Planning_TIME)
                       PROJECT(Pla:OverboekSoort)
                       PROJECT(Pla:KG)
                       PROJECT(Pla:Pallets)
                       PROJECT(Pla:Instructie)
                       PROJECT(Pla:Transport)
                       PROJECT(Pla:OverboekCelLocatieID)
                       PROJECT(Pla:PlanningID)
                       PROJECT(Pla:OverboekingCelID)
                       PROJECT(Pla:Planning)
                       PROJECT(Pla:Verwerkt)
                       PROJECT(Pla:ArtikelID)
                       PROJECT(Pla:CelID)
                       PROJECT(Pla:PartijID)
                       PROJECT(Pla:CelLocatieID)
                       JOIN(Art:Artikel_PK,Pla:ArtikelID)
                         PROJECT(Art:ArtikelID)
                         PROJECT(Art:ArtikelOms)
                       END
                       JOIN(CEL:CEL_PK,Pla:CelID)
                         PROJECT(CEL:CelOms)
                         PROJECT(CEL:CelID)
                       END
                       JOIN(ACel:CEL_PK,Pla:OverboekingCelID)
                         PROJECT(ACel:CelOms)
                         PROJECT(ACel:CelID)
                       END
                       JOIN(Par:Partij_PK,Pla:PartijID)
                         PROJECT(Par:PartijID)
                         PROJECT(Par:ExternPartijnr)
                       END
                       JOIN(CL:PK_CelLocatie,Pla:CelLocatieID)
                         PROJECT(CL:Locatienaam)
                         PROJECT(CL:CelLocatieID)
                       END
                       JOIN(ACL:PK_CelLocatie,Pla:OverboekCelLocatieID)
                         PROJECT(ACL:Locatienaam)
                         PROJECT(ACL:CelLocatieID)
                       END
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
Art:ArtikelID          LIKE(Art:ArtikelID)            !List box control field - type derived from field
Art:ArtikelID_NormalFG LONG                           !Normal forground color
Art:ArtikelID_NormalBG LONG                           !Normal background color
Art:ArtikelID_SelectedFG LONG                         !Selected forground color
Art:ArtikelID_SelectedBG LONG                         !Selected background color
Art:ArtikelOms         LIKE(Art:ArtikelOms)           !List box control field - type derived from field
Art:ArtikelOms_NormalFG LONG                          !Normal forground color
Art:ArtikelOms_NormalBG LONG                          !Normal background color
Art:ArtikelOms_SelectedFG LONG                        !Selected forground color
Art:ArtikelOms_SelectedBG LONG                        !Selected background color
Pla:OverboekingPlanningID LIKE(Pla:OverboekingPlanningID) !List box control field - type derived from field
Pla:OverboekingPlanningID_NormalFG LONG               !Normal forground color
Pla:OverboekingPlanningID_NormalBG LONG               !Normal background color
Pla:OverboekingPlanningID_SelectedFG LONG             !Selected forground color
Pla:OverboekingPlanningID_SelectedBG LONG             !Selected background color
Pla:OverboekingPlanningID_Icon LONG                   !Entry's icon ID
Pla:Planning_DATE      LIKE(Pla:Planning_DATE)        !List box control field - type derived from field
Pla:Planning_DATE_NormalFG LONG                       !Normal forground color
Pla:Planning_DATE_NormalBG LONG                       !Normal background color
Pla:Planning_DATE_SelectedFG LONG                     !Selected forground color
Pla:Planning_DATE_SelectedBG LONG                     !Selected background color
Pla:Planning_TIME      LIKE(Pla:Planning_TIME)        !List box control field - type derived from field
Pla:Planning_TIME_NormalFG LONG                       !Normal forground color
Pla:Planning_TIME_NormalBG LONG                       !Normal background color
Pla:Planning_TIME_SelectedFG LONG                     !Selected forground color
Pla:Planning_TIME_SelectedBG LONG                     !Selected background color
Pla:OverboekSoort      LIKE(Pla:OverboekSoort)        !List box control field - type derived from field
Pla:OverboekSoort_NormalFG LONG                       !Normal forground color
Pla:OverboekSoort_NormalBG LONG                       !Normal background color
Pla:OverboekSoort_SelectedFG LONG                     !Selected forground color
Pla:OverboekSoort_SelectedBG LONG                     !Selected background color
Pla:KG                 LIKE(Pla:KG)                   !List box control field - type derived from field
Pla:KG_NormalFG        LONG                           !Normal forground color
Pla:KG_NormalBG        LONG                           !Normal background color
Pla:KG_SelectedFG      LONG                           !Selected forground color
Pla:KG_SelectedBG      LONG                           !Selected background color
Pla:Pallets            LIKE(Pla:Pallets)              !List box control field - type derived from field
Pla:Pallets_NormalFG   LONG                           !Normal forground color
Pla:Pallets_NormalBG   LONG                           !Normal background color
Pla:Pallets_SelectedFG LONG                           !Selected forground color
Pla:Pallets_SelectedBG LONG                           !Selected background color
Par:PartijID           LIKE(Par:PartijID)             !List box control field - type derived from field
Par:PartijID_NormalFG  LONG                           !Normal forground color
Par:PartijID_NormalBG  LONG                           !Normal background color
Par:PartijID_SelectedFG LONG                          !Selected forground color
Par:PartijID_SelectedBG LONG                          !Selected background color
Par:ExternPartijnr     LIKE(Par:ExternPartijnr)       !List box control field - type derived from field
Par:ExternPartijnr_NormalFG LONG                      !Normal forground color
Par:ExternPartijnr_NormalBG LONG                      !Normal background color
Par:ExternPartijnr_SelectedFG LONG                    !Selected forground color
Par:ExternPartijnr_SelectedBG LONG                    !Selected background color
CEL:CelOms             LIKE(CEL:CelOms)               !List box control field - type derived from field
CEL:CelOms_NormalFG    LONG                           !Normal forground color
CEL:CelOms_NormalBG    LONG                           !Normal background color
CEL:CelOms_SelectedFG  LONG                           !Selected forground color
CEL:CelOms_SelectedBG  LONG                           !Selected background color
CL:Locatienaam         LIKE(CL:Locatienaam)           !List box control field - type derived from field
CL:Locatienaam_NormalFG LONG                          !Normal forground color
CL:Locatienaam_NormalBG LONG                          !Normal background color
CL:Locatienaam_SelectedFG LONG                        !Selected forground color
CL:Locatienaam_SelectedBG LONG                        !Selected background color
ACel:CelOms            LIKE(ACel:CelOms)              !List box control field - type derived from field
ACel:CelOms_NormalFG   LONG                           !Normal forground color
ACel:CelOms_NormalBG   LONG                           !Normal background color
ACel:CelOms_SelectedFG LONG                           !Selected forground color
ACel:CelOms_SelectedBG LONG                           !Selected background color
ACL:Locatienaam        LIKE(ACL:Locatienaam)          !List box control field - type derived from field
ACL:Locatienaam_NormalFG LONG                         !Normal forground color
ACL:Locatienaam_NormalBG LONG                         !Normal background color
ACL:Locatienaam_SelectedFG LONG                       !Selected forground color
ACL:Locatienaam_SelectedBG LONG                       !Selected background color
Pla:Instructie         LIKE(Pla:Instructie)           !List box control field - type derived from field
Pla:Instructie_NormalFG LONG                          !Normal forground color
Pla:Instructie_NormalBG LONG                          !Normal background color
Pla:Instructie_SelectedFG LONG                        !Selected forground color
Pla:Instructie_SelectedBG LONG                        !Selected background color
Pla:Transport          LIKE(Pla:Transport)            !List box control field - type derived from field
Pla:Transport_NormalFG LONG                           !Normal forground color
Pla:Transport_NormalBG LONG                           !Normal background color
Pla:Transport_SelectedFG LONG                         !Selected forground color
Pla:Transport_SelectedBG LONG                         !Selected background color
Pla:OverboekCelLocatieID LIKE(Pla:OverboekCelLocatieID) !Browse hot field - type derived from field
Pla:PlanningID         LIKE(Pla:PlanningID)           !Primary key field - type derived from field
Pla:OverboekingCelID   LIKE(Pla:OverboekingCelID)     !Browse key field - type derived from field
Pla:Planning           LIKE(Pla:Planning)             !Browse key field - type derived from field
Pla:Verwerkt           LIKE(Pla:Verwerkt)             !Browse key field - type derived from field
CEL:CelID              LIKE(CEL:CelID)                !Related join file key field - type derived from field
ACel:CelID             LIKE(ACel:CelID)               !Related join file key field - type derived from field
CL:CelLocatieID        LIKE(CL:CelLocatieID)          !Related join file key field - type derived from field
ACL:CelLocatieID       LIKE(ACL:CelLocatieID)         !Related join file key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
LocEnableEnterByTab  BYTE(1)                               !Used by the ENTER Instead of Tab template
EnterByTabManager    EnterByTabClass
NetLocalRefreshDate     Long     ! NetTalk (NetRefresh)
NetLocalRefreshTime     Long
NetLocalDependancies    String('|Planning|ViewArtikel|Cel|ACel|Partij|CelLocatie|ACelLocatie|')
QuickWindow          WINDOW('Overboekingen'),AT(,,358,208),FONT('MS Sans Serif',8,,FONT:regular,CHARSET:DEFAULT), |
  RESIZE,MAXIMIZE,CENTER,GRAY,IMM,MAX,MDI,HLP('BrowseOverboeking'),SYSTEM
                       LIST,AT(8,29,342,135),USE(?Browse:1),HVSCROLL,FORMAT('65L(2)|M*~Artikel ID~C(0)@s30@197' & |
  'L(2)|M*~Artikel~C(0)@s60@40C(2)|M*I~Gekoppeld~C(0)@p p@[49R(2)|M*~Datum~C(0)@d6-@26R' & |
  '(2)|M*~Tijd~C(0)@t7@]|~Planning~81C(2)|M*~Overboek Soort~L(0)@s50@44R(2)|M*~KG~C(0)@' & |
  'n-15`2@41R(2)|M*~Pallets~C(0)@n-14.@[38R(2)|M*~Intern~C(0)@n_8B@60R(2)|M*~Extern~C(1' & |
  ')@s20@](77)|~Partij~[40L(2)|M*~Van~C(0)@s50@55L(2)|M*~Locatie~C(0)@s50@40L(2)|M*~Naa' & |
  'r~C(0)@s50@42L(2)|M*~Locatie~@s50@]|~Overboeking~100L(2)|M*~Instructie~C(0)@s100@100' & |
  'L(2)|M*~Transport~C(0)@s100@'),FROM(Queue:Browse:1),IMM,MSG('Browsing the Planning file')
                       SHEET,AT(4,4,350,182),USE(?CurrentTab)
                         TAB('&Niet-verwerkte Overboekingen'),USE(?Tab:2)
                         END
                         TAB('&Verwerkte Overboekingen'),USE(?Tab:9)
                         END
                       END
                       BUTTON('&Close'),AT(302,190,49,14),USE(?Close),LEFT,ICON('WACLOSE.ICO'),FLAT,MSG('Close Window'), |
  TIP('Close Window')
                       BUTTON('Sjabloon'),AT(4,188,51,17),USE(?SjabloonButton)
                       BUTTON('&Change'),AT(265,169,42,12),USE(?Change)
                       BUTTON('&Insert'),AT(223,169,42,12),USE(?Insert)
                       BUTTON('&Delete'),AT(307,169,42,12),USE(?Delete)
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
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
BRW1                 CLASS(BrowseClass)                    ! Browse using ?Browse:1
Q                      &Queue:Browse:1                !Reference to browse queue
Ask                    PROCEDURE(BYTE Request),BYTE,PROC,DERIVED
Fetch                  PROCEDURE(BYTE Direction),DERIVED
Init                   PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)
ResetSort              PROCEDURE(BYTE Force),BYTE,PROC,DERIVED
SetQueueRecord         PROCEDURE(),DERIVED
                     END

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

ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('BrowseOverboeking')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  GLO:Overboeking_ThreadID = THREAD()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Browse:1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('Pla:PlanningID',Pla:PlanningID)                    ! Added by: BrowseBox(ABC)
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  IF SELF.Request = SelectRecord
     SELF.AddItem(?Close,RequestCancelled)                 ! Add the close control to the window manger
  ELSE
     SELF.AddItem(?Close,RequestCompleted)                 ! Add the close control to the window manger
  END
  	LOC:NietVerwerkt = 0
  	LOC:MinCelID = 1
  	CLEAR(LOC:MaxCelID,1)
  Relate:Planning.SetOpenRelated()
  Relate:Planning.Open                                     ! File Planning used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:Planning,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  0{Prop:Text}=CLIP(0{Prop:Text}) !& ' (' & CLIP(LEFT(FORMAT(GLO:Overboeking_ThreadID,@N_10))) & ')'
  IF GLO:HidePlanningInstructie = 1 THEN 
      ?Browse:1{PROPLIST:Width, 16} = 0
  END
  WinAlertMouseZoom()
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1.FileLoaded = 1                                      ! This is a 'file loaded' browse
  BRW1.AddSortOrder(,Pla:OverboekingCelID_Planning_K)      ! Add the sort order for Pla:OverboekingCelID_Planning_K for sort order 1
  BRW1.SetFilter('(Pla:Verwerkt=1 AND Pla:OverboekingCelID>0)') ! Apply filter expression to browse
  BRW1.AddSortOrder(,Pla:Verwerkt_OverboekingCelID_Planning_K) ! Add the sort order for Pla:Verwerkt_OverboekingCelID_Planning_K for sort order 2
  BRW1.SetFilter('(Pla:Verwerkt=0 AND Pla:OverboekingCelID>0)') ! Apply filter expression to browse
  ?Browse:1{PROP:IconList,1} = '~off.ico'
  ?Browse:1{PROP:IconList,2} = '~on.ico'
  BRW1.AddField(Art:ArtikelID,BRW1.Q.Art:ArtikelID)        ! Field Art:ArtikelID is a hot field or requires assignment from browse
  BRW1.AddField(Art:ArtikelOms,BRW1.Q.Art:ArtikelOms)      ! Field Art:ArtikelOms is a hot field or requires assignment from browse
  BRW1.AddField(Pla:OverboekingPlanningID,BRW1.Q.Pla:OverboekingPlanningID) ! Field Pla:OverboekingPlanningID is a hot field or requires assignment from browse
  BRW1.AddField(Pla:Planning_DATE,BRW1.Q.Pla:Planning_DATE) ! Field Pla:Planning_DATE is a hot field or requires assignment from browse
  BRW1.AddField(Pla:Planning_TIME,BRW1.Q.Pla:Planning_TIME) ! Field Pla:Planning_TIME is a hot field or requires assignment from browse
  BRW1.AddField(Pla:OverboekSoort,BRW1.Q.Pla:OverboekSoort) ! Field Pla:OverboekSoort is a hot field or requires assignment from browse
  BRW1.AddField(Pla:KG,BRW1.Q.Pla:KG)                      ! Field Pla:KG is a hot field or requires assignment from browse
  BRW1.AddField(Pla:Pallets,BRW1.Q.Pla:Pallets)            ! Field Pla:Pallets is a hot field or requires assignment from browse
  BRW1.AddField(Par:PartijID,BRW1.Q.Par:PartijID)          ! Field Par:PartijID is a hot field or requires assignment from browse
  BRW1.AddField(Par:ExternPartijnr,BRW1.Q.Par:ExternPartijnr) ! Field Par:ExternPartijnr is a hot field or requires assignment from browse
  BRW1.AddField(CEL:CelOms,BRW1.Q.CEL:CelOms)              ! Field CEL:CelOms is a hot field or requires assignment from browse
  BRW1.AddField(CL:Locatienaam,BRW1.Q.CL:Locatienaam)      ! Field CL:Locatienaam is a hot field or requires assignment from browse
  BRW1.AddField(ACel:CelOms,BRW1.Q.ACel:CelOms)            ! Field ACel:CelOms is a hot field or requires assignment from browse
  BRW1.AddField(ACL:Locatienaam,BRW1.Q.ACL:Locatienaam)    ! Field ACL:Locatienaam is a hot field or requires assignment from browse
  BRW1.AddField(Pla:Instructie,BRW1.Q.Pla:Instructie)      ! Field Pla:Instructie is a hot field or requires assignment from browse
  BRW1.AddField(Pla:Transport,BRW1.Q.Pla:Transport)        ! Field Pla:Transport is a hot field or requires assignment from browse
  BRW1.AddField(Pla:OverboekCelLocatieID,BRW1.Q.Pla:OverboekCelLocatieID) ! Field Pla:OverboekCelLocatieID is a hot field or requires assignment from browse
  BRW1.AddField(Pla:PlanningID,BRW1.Q.Pla:PlanningID)      ! Field Pla:PlanningID is a hot field or requires assignment from browse
  BRW1.AddField(Pla:OverboekingCelID,BRW1.Q.Pla:OverboekingCelID) ! Field Pla:OverboekingCelID is a hot field or requires assignment from browse
  BRW1.AddField(Pla:Planning,BRW1.Q.Pla:Planning)          ! Field Pla:Planning is a hot field or requires assignment from browse
  BRW1.AddField(Pla:Verwerkt,BRW1.Q.Pla:Verwerkt)          ! Field Pla:Verwerkt is a hot field or requires assignment from browse
  BRW1.AddField(CEL:CelID,BRW1.Q.CEL:CelID)                ! Field CEL:CelID is a hot field or requires assignment from browse
  BRW1.AddField(ACel:CelID,BRW1.Q.ACel:CelID)              ! Field ACel:CelID is a hot field or requires assignment from browse
  BRW1.AddField(CL:CelLocatieID,BRW1.Q.CL:CelLocatieID)    ! Field CL:CelLocatieID is a hot field or requires assignment from browse
  BRW1.AddField(ACL:CelLocatieID,BRW1.Q.ACL:CelLocatieID)  ! Field ACL:CelLocatieID is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('BrowseOverboeking',QuickWindow)            ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  BRW1.AskProcedure = 1                                    ! Will call: UpdateOverboeking
  SELF.SetAlerts()
  NetLocalRefreshDate = today()         ! NetTalk (NetRefresh)
  NetLocalRefreshTime = clock()
  EnterByTabManager.Init(False)
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  GLO:Overboeking_ThreadID = 0
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:Planning.Close
  END
  IF SELF.Opened
    INIMgr.Update('BrowseOverboeking',QuickWindow)         ! Save window data to non-volatile store
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
    UpdateOverboeking
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
    CASE ACCEPTED()
    OF ?SjabloonButton
      Get(BRW1.Q,Choice(?Browse:1))
      Pla:PlanningID = BRW1.Q.Pla:PlanningID
      IF Access:Planning.TryFetch(Pla:PK_Planning) <> Level:Benign THEN
      	RETURN ReturnValue
      .
      
      ReportOverboeking(Pla:PlanningID)
    END
  ReturnValue = PARENT.TakeAccepted()
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
    OF EVENT:Notify
        ! Focus overnemen
        !NOTIFICATION(LOC:NotifyCode)
        !IF LOC:NotifyCode = 1 THEN
            ThisWindow{Prop:Active} = 1
        !END
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
  IF Request = ChangeRecord AND Pla:Verwerkt THEN
     !Request = ViewRecord
  ELSIF Request = DeleteRecord AND Pla:Verwerkt THEN
      MESSAGE('Geplande overboeking is al verwerkt. Kan dus niet meer verwijderd worden. Draai de mutatie eventueel eerst terug.', 'Al uitgevoerd', ICON:Exclamation)
      RETURN Level:Benign
  END
  ReturnValue = PARENT.Ask(Request)
  RETURN ReturnValue


BRW1.Fetch PROCEDURE(BYTE Direction)

GreenBarIndex   LONG,AUTO
  CODE
  PARENT.Fetch(Direction)
  !----------------------------------------------------------------------
    LOOP GreenBarIndex=1 TO RECORDS(SELF.Q)
      GET(SELF.Q,GreenBarIndex)
      SELF.Q.Art:ArtikelID_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for Art:ArtikelID
      SELF.Q.Art:ArtikelID_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.Art:ArtikelID_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Art:ArtikelID_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Art:ArtikelOms_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for Art:ArtikelOms
      SELF.Q.Art:ArtikelOms_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.Art:ArtikelOms_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Art:ArtikelOms_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla:OverboekingPlanningID_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for Pla:OverboekingPlanningID
      SELF.Q.Pla:OverboekingPlanningID_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.Pla:OverboekingPlanningID_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla:OverboekingPlanningID_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla:Planning_DATE_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for Pla:Planning_DATE
      SELF.Q.Pla:Planning_DATE_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.Pla:Planning_DATE_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla:Planning_DATE_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla:Planning_TIME_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for Pla:Planning_TIME
      SELF.Q.Pla:Planning_TIME_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.Pla:Planning_TIME_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla:Planning_TIME_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla:OverboekSoort_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for Pla:OverboekSoort
      SELF.Q.Pla:OverboekSoort_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.Pla:OverboekSoort_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla:OverboekSoort_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla:KG_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for Pla:KG
      SELF.Q.Pla:KG_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.Pla:KG_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla:KG_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla:Pallets_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for Pla:Pallets
      SELF.Q.Pla:Pallets_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.Pla:Pallets_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla:Pallets_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Par:PartijID_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for Par:PartijID
      SELF.Q.Par:PartijID_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.Par:PartijID_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Par:PartijID_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Par:ExternPartijnr_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for Par:ExternPartijnr
      SELF.Q.Par:ExternPartijnr_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.Par:ExternPartijnr_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Par:ExternPartijnr_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.CEL:CelOms_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for CEL:CelOms
      SELF.Q.CEL:CelOms_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.CEL:CelOms_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.CEL:CelOms_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.CL:Locatienaam_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for CL:Locatienaam
      SELF.Q.CL:Locatienaam_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.CL:Locatienaam_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.CL:Locatienaam_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.ACel:CelOms_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for ACel:CelOms
      SELF.Q.ACel:CelOms_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.ACel:CelOms_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.ACel:CelOms_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.ACL:Locatienaam_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for ACL:Locatienaam
      SELF.Q.ACL:Locatienaam_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.ACL:Locatienaam_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.ACL:Locatienaam_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla:Instructie_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for Pla:Instructie
      SELF.Q.Pla:Instructie_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.Pla:Instructie_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla:Instructie_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla:Transport_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for Pla:Transport
      SELF.Q.Pla:Transport_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.Pla:Transport_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla:Transport_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      PUT(SELF.Q)
    END
  !----------------------------------------------------------------------


BRW1.Init PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)

  CODE
  PARENT.Init(ListBox,Posit,V,Q,RM,WM)
  IF WM.Request <> ViewRecord                              ! If called for anything other than ViewMode, make the insert, change & delete controls available
    SELF.InsertControl=?Insert
    SELF.ChangeControl=?Change
    SELF.DeleteControl=?Delete
  END


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


BRW1.SetQueueRecord PROCEDURE

  CODE
  PARENT.SetQueueRecord
  
  IF (Pla:OverboekingPlanningID > 0)
    SELF.Q.Pla:OverboekingPlanningID_Icon = 2              ! Set icon from icon list
  ELSE
    SELF.Q.Pla:OverboekingPlanningID_Icon = 1              ! Set icon from icon list
  END
  !----------------------------------------------------------------------
      SELF.Q.Art:ArtikelID_NormalFG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1) ! Set color values for Art:ArtikelID
      SELF.Q.Art:ArtikelID_NormalBG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,8454143)
      SELF.Q.Art:ArtikelID_SelectedFG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.Art:ArtikelID_SelectedBG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.Art:ArtikelOms_NormalFG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1) ! Set color values for Art:ArtikelOms
      SELF.Q.Art:ArtikelOms_NormalBG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,8454143)
      SELF.Q.Art:ArtikelOms_SelectedFG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.Art:ArtikelOms_SelectedBG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.Pla:OverboekingPlanningID_NormalFG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1) ! Set color values for Pla:OverboekingPlanningID
      SELF.Q.Pla:OverboekingPlanningID_NormalBG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,8454143)
      SELF.Q.Pla:OverboekingPlanningID_SelectedFG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.Pla:OverboekingPlanningID_SelectedBG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.Pla:Planning_DATE_NormalFG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1) ! Set color values for Pla:Planning_DATE
      SELF.Q.Pla:Planning_DATE_NormalBG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,8454143)
      SELF.Q.Pla:Planning_DATE_SelectedFG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.Pla:Planning_DATE_SelectedBG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.Pla:Planning_TIME_NormalFG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1) ! Set color values for Pla:Planning_TIME
      SELF.Q.Pla:Planning_TIME_NormalBG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,8454143)
      SELF.Q.Pla:Planning_TIME_SelectedFG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.Pla:Planning_TIME_SelectedBG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.Pla:OverboekSoort_NormalFG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1) ! Set color values for Pla:OverboekSoort
      SELF.Q.Pla:OverboekSoort_NormalBG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,8454143)
      SELF.Q.Pla:OverboekSoort_SelectedFG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.Pla:OverboekSoort_SelectedBG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.Pla:KG_NormalFG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1) ! Set color values for Pla:KG
      SELF.Q.Pla:KG_NormalBG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,8454143)
      SELF.Q.Pla:KG_SelectedFG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.Pla:KG_SelectedBG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.Pla:Pallets_NormalFG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1) ! Set color values for Pla:Pallets
      SELF.Q.Pla:Pallets_NormalBG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,8454143)
      SELF.Q.Pla:Pallets_SelectedFG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.Pla:Pallets_SelectedBG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.Par:PartijID_NormalFG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1) ! Set color values for Par:PartijID
      SELF.Q.Par:PartijID_NormalBG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,8454143)
      SELF.Q.Par:PartijID_SelectedFG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.Par:PartijID_SelectedBG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.Par:ExternPartijnr_NormalFG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1) ! Set color values for Par:ExternPartijnr
      SELF.Q.Par:ExternPartijnr_NormalBG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,8454143)
      SELF.Q.Par:ExternPartijnr_SelectedFG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.Par:ExternPartijnr_SelectedBG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.CEL:CelOms_NormalFG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1) ! Set color values for CEL:CelOms
      SELF.Q.CEL:CelOms_NormalBG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,8454143)
      SELF.Q.CEL:CelOms_SelectedFG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.CEL:CelOms_SelectedBG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.CL:Locatienaam_NormalFG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1) ! Set color values for CL:Locatienaam
      SELF.Q.CL:Locatienaam_NormalBG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,8454143)
      SELF.Q.CL:Locatienaam_SelectedFG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.CL:Locatienaam_SelectedBG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.ACel:CelOms_NormalFG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1) ! Set color values for ACel:CelOms
      SELF.Q.ACel:CelOms_NormalBG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,8454143)
      SELF.Q.ACel:CelOms_SelectedFG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.ACel:CelOms_SelectedBG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.ACL:Locatienaam_NormalFG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1) ! Set color values for ACL:Locatienaam
      SELF.Q.ACL:Locatienaam_NormalBG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,8454143)
      SELF.Q.ACL:Locatienaam_SelectedFG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.ACL:Locatienaam_SelectedBG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.Pla:Instructie_NormalFG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1) ! Set color values for Pla:Instructie
      SELF.Q.Pla:Instructie_NormalBG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,8454143)
      SELF.Q.Pla:Instructie_SelectedFG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.Pla:Instructie_SelectedBG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.Pla:Transport_NormalFG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1) ! Set color values for Pla:Transport
      SELF.Q.Pla:Transport_NormalBG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,8454143)
      SELF.Q.Pla:Transport_SelectedFG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.Pla:Transport_SelectedBG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
  !----------------------------------------------------------------------


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window

!!! <summary>
!!! Generated from procedure template - Window
!!! Browse the Inkoop file
!!! </summary>
BrowseInkoop PROCEDURE 

Loc:Leverancier      LONG                                  ! 
LOC:Verwerkt         BYTE                                  ! 
LOC:NietVerwerkt     BYTE                                  ! 
CurrentTab           STRING(80)                            ! 
Loc:DatumLeeg        DATE                                  ! 
Loc:Artikelen        STRING(250)                           ! 
Loc:Leverancier2     LONG                                  ! 
LOC:Firmanaam        STRING(250)                           ! 
LOC:Firmanaam2       STRING(250)                           ! 
LOC:CurrentLeverancier LONG                                ! 
BRW1::View:Browse    VIEW(Inkoop)
                       PROJECT(Ink:InkoopID)
                       PROJECT(Ink:Planning_DATE)
                       PROJECT(Ink:Planning_TIME)
                       PROJECT(Ink:Verwerkt)
                       PROJECT(Ink:Leverancier)
                       PROJECT(Ink:Planning)
                       JOIN(Rel:Relatie_PK,Ink:Leverancier)
                         PROJECT(Rel:FirmaNaam)
                         PROJECT(Rel:RelatieID)
                       END
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
Ink:InkoopID           LIKE(Ink:InkoopID)             !List box control field - type derived from field
Ink:InkoopID_NormalFG  LONG                           !Normal forground color
Ink:InkoopID_NormalBG  LONG                           !Normal background color
Ink:InkoopID_SelectedFG LONG                          !Selected forground color
Ink:InkoopID_SelectedBG LONG                          !Selected background color
Rel:FirmaNaam          LIKE(Rel:FirmaNaam)            !List box control field - type derived from field
Rel:FirmaNaam_NormalFG LONG                           !Normal forground color
Rel:FirmaNaam_NormalBG LONG                           !Normal background color
Rel:FirmaNaam_SelectedFG LONG                         !Selected forground color
Rel:FirmaNaam_SelectedBG LONG                         !Selected background color
Ink:Planning_DATE      LIKE(Ink:Planning_DATE)        !List box control field - type derived from field
Ink:Planning_DATE_NormalFG LONG                       !Normal forground color
Ink:Planning_DATE_NormalBG LONG                       !Normal background color
Ink:Planning_DATE_SelectedFG LONG                     !Selected forground color
Ink:Planning_DATE_SelectedBG LONG                     !Selected background color
Ink:Planning_TIME      LIKE(Ink:Planning_TIME)        !List box control field - type derived from field
Ink:Planning_TIME_NormalFG LONG                       !Normal forground color
Ink:Planning_TIME_NormalBG LONG                       !Normal background color
Ink:Planning_TIME_SelectedFG LONG                     !Selected forground color
Ink:Planning_TIME_SelectedBG LONG                     !Selected background color
Ink:Verwerkt           LIKE(Ink:Verwerkt)             !List box control field - type derived from field
Ink:Verwerkt_NormalFG  LONG                           !Normal forground color
Ink:Verwerkt_NormalBG  LONG                           !Normal background color
Ink:Verwerkt_SelectedFG LONG                          !Selected forground color
Ink:Verwerkt_SelectedBG LONG                          !Selected background color
Ink:Verwerkt_Icon      LONG                           !Entry's icon ID
Loc:Artikelen          LIKE(Loc:Artikelen)            !List box control field - type derived from local data
Loc:Artikelen_NormalFG LONG                           !Normal forground color
Loc:Artikelen_NormalBG LONG                           !Normal background color
Loc:Artikelen_SelectedFG LONG                         !Selected forground color
Loc:Artikelen_SelectedBG LONG                         !Selected background color
Ink:Leverancier        LIKE(Ink:Leverancier)          !Browse hot field - type derived from field
Ink:Planning           LIKE(Ink:Planning)             !Browse key field - type derived from field
Rel:RelatieID          LIKE(Rel:RelatieID)            !Related join file key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
FDCB5::View:FileDropCombo VIEW(ARelatie)
                       PROJECT(AREL:FirmaNaam)
                       PROJECT(AREL:Type)
                     END
FDCB2::View:FileDropCombo VIEW(AARelatie)
                       PROJECT(AARel:FirmaNaam)
                       PROJECT(AARel:Type)
                     END
Queue:FileDropCombo  QUEUE                            !
LOC:Firmanaam          LIKE(LOC:Firmanaam)            !List box control field - type derived from local data
AREL:FirmaNaam         LIKE(AREL:FirmaNaam)           !Browse hot field - type derived from field
AREL:Type              LIKE(AREL:Type)                !Browse hot field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
Queue:FileDropCombo:1 QUEUE                           !
LOC:Firmanaam2         LIKE(LOC:Firmanaam2)           !List box control field - type derived from local data
AARel:FirmaNaam        LIKE(AARel:FirmaNaam)          !Browse hot field - type derived from field
AARel:Type             LIKE(AARel:Type)               !Browse hot field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
LocEnableEnterByTab  BYTE(1)                               !Used by the ENTER Instead of Tab template
EnterByTabManager    EnterByTabClass
NetLocalRefreshDate     Long     ! NetTalk (NetRefresh)
NetLocalRefreshTime     Long
NetLocalDependancies    String('|Inkoop|Relatie|ARelatie|AARelatie|')
QuickWindow          WINDOW('Inkoop'),AT(,,562,214),FONT('MS Sans Serif',8,,,CHARSET:DEFAULT),RESIZE,MAXIMIZE,CENTER, |
  GRAY,IMM,MAX,MDI,HLP('BrowseInkoop'),SYSTEM
                       LIST,AT(9,52,540,135),USE(?Browse:1),HVSCROLL,FORMAT('52R(4)|*~Inkoop-ID~C(0)@n_10@200L' & |
  '(2)|*~Leverancier~C(0)@s50@[47R(2)|M*~Datum~C(0)@d6-B@29R(2)|M*~Tijd~C(0)@t7B@]|~Pla' & |
  'nning~36R(2)|M*I~Verwerkt~C(0)@p p@186L(2)|M*~Artikelen~C(0)@s250@'),FROM(Queue:Browse:1), |
  IMM,MSG('Browsing the Inkoop file')
                       BUTTON('Rapport'),AT(192,34),USE(?SjabloonButton)
                       BUTTON('Kopieer'),AT(282,34),USE(?KopieerButton)
                       BUTTON('&Toevoegen'),AT(9,34,65,14),USE(?Insert:3),LEFT,ICON('WAINSERT.ICO'),FLAT,MSG('Insert a Record'), |
  TIP('Insert a Record')
                       BUTTON('&Wijzigen'),AT(75,34,49,14),USE(?Change:3),LEFT,ICON('WACHANGE.ICO'),DEFAULT,FLAT, |
  MSG('Change the Record'),TIP('Change the Record')
                       BUTTON('&Verwijderen'),AT(127,34,61,14),USE(?Delete:3),LEFT,ICON('WADELETE.ICO'),FLAT,MSG('Delete the Record'), |
  TIP('Delete the Record')
                       SHEET,AT(4,4,556,188),USE(?CurrentTab)
                         TAB('&1) Onverwerkte inkopen'),USE(?Tab:2)
                         END
                         TAB('&2) Onverwerkte inkopen (zonder datum)'),USE(?TAB4)
                         END
                         TAB('&3) Onverwerkte inkopen gesorteerd op planning'),USE(?Tab:3)
                         END
                         TAB('&4) Onverwerkte inkopen per leverancier'),USE(?TAB1)
                           COMBO(@s50),AT(327,36,155,10),USE(AREL:FirmaNaam),DROP(25),FORMAT('200L(2)M~Firmanaam~C(0)@s250@'), |
  FROM(Queue:FileDropCombo),IMM
                           BUTTON('...'),AT(487,36,29,11),USE(?LookupLeverancier)
                         END
                         TAB('&5) Verwerkte inkopen'),USE(?TAB2)
                         END
                         TAB('&6) Verwerkte inkopen per leverancier'),USE(?TAB3)
                           COMBO(@s100),AT(328,35,168,11),USE(AARel:FirmaNaam),DROP(25),FORMAT('200L(2)|M~Firmanaa' & |
  'm~C(0)@s250@'),FROM(Queue:FileDropCombo:1),IMM
                           BUTTON('...'),AT(501,34,,12),USE(?LookupAleverancier)
                         END
                       END
                       BUTTON('&Sluiten'),AT(509,196,49,14),USE(?Close),LEFT,ICON('WACLOSE.ICO'),FLAT,MSG('Close Window'), |
  TIP('Close Window')
                       BUTTON('Weeglijst'),AT(4,196,71),USE(?WeeglijstButton)
                       BUTTON('Weeglijst (Excel)'),AT(79,196,80),USE(?WeeglijstExcelButton)
                       BUTTON('Sjabloon'),AT(237,34,43,14),USE(?SjabloonButton:2)
                       BUTTON('Ververs Scherm'),AT(419,197,79,14),USE(?RefreshButton),LEFT,ICON('REFRESH.ICO'),FLAT
                       BUTTON('Retour Rapport'),AT(325,34,60,14),USE(?SjabloonButton:3)
                       BUTTON('Inkoopbevestiging'),AT(389,34,60,14),USE(?Inkoopbevestiging)
                       BUTTON('Export naar Exact'),AT(163,196),USE(?ExportnaarExact)
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
TakeNewSelection       PROCEDURE(),BYTE,PROC,DERIVED
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
BRW1                 CLASS(BrowseClass)                    ! Browse using ?Browse:1
Q                      &Queue:Browse:1                !Reference to browse queue
Ask                    PROCEDURE(BYTE Request),BYTE,PROC,DERIVED
Fetch                  PROCEDURE(BYTE Direction),DERIVED
Init                   PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)
NotifyUpdateError      PROCEDURE(),BYTE,DERIVED
ResetQueue             PROCEDURE(BYTE ResetMode),DERIVED
ResetSort              PROCEDURE(BYTE Force),BYTE,PROC,DERIVED
SetQueueRecord         PROCEDURE(),DERIVED
ValidateRecord         PROCEDURE(),BYTE,DERIVED
                     END

BRW1::Sort5:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 2
Resizer              CLASS(WindowResizeClass)
Init                   PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)
                     END

FDCB5                CLASS(FileDropComboClass)             ! File drop combo manager
Q                      &Queue:FileDropCombo           !Reference to browse queue type
SetQueueRecord         PROCEDURE(),DERIVED
                     END

FDCB2                CLASS(FileDropComboClass)             ! File drop combo manager
Q                      &Queue:FileDropCombo:1         !Reference to browse queue type
SetQueueRecord         PROCEDURE(),DERIVED
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
VulCurrentLeverancier       ROUTINE
    IF CHOICE(?CurrentTab) = 4 THEN
        LOC:CurrentLeverancier = Loc:Leverancier
    ELSIF CHOICE(?CurrentTab) = 6 THEN
        LOC:CurrentLeverancier = Loc:Leverancier2
    ELSE
        LOC:CurrentLeverancier = 0
    END

ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('BrowseInkoop')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  GLO:Inkoop_ThreadID = THREAD()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Browse:1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('LOC:NietVerwerkt',LOC:NietVerwerkt)                ! Added by: BrowseBox(ABC)
  BIND('Loc:Leverancier',Loc:Leverancier)                  ! Added by: BrowseBox(ABC)
  BIND('LOC:Verwerkt',LOC:Verwerkt)                        ! Added by: BrowseBox(ABC)
  BIND('Loc:Leverancier2',Loc:Leverancier2)                ! Added by: BrowseBox(ABC)
  BIND('Ink:InkoopID',Ink:InkoopID)                        ! Added by: BrowseBox(ABC)
  BIND('Loc:Artikelen',Loc:Artikelen)                      ! Added by: BrowseBox(ABC)
  BIND('LOC:Firmanaam2',LOC:Firmanaam2)                    ! Added by: FileDropCombo(ABC)
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  IF SELF.Request = SelectRecord
     SELF.AddItem(?Close,RequestCancelled)                 ! Add the close control to the window manger
  ELSE
     SELF.AddItem(?Close,RequestCompleted)                 ! Add the close control to the window manger
  END
  	LOC:Verwerkt = 1
  	LOC:NietVerwerkt = 0
  Relate:AARelatie.Open                                    ! File AARelatie used by this procedure, so make sure it's RelationManager is open
  Relate:AInkoop.Open                                      ! File AInkoop used by this procedure, so make sure it's RelationManager is open
  Relate:APlanning.Open                                    ! File APlanning used by this procedure, so make sure it's RelationManager is open
  Relate:ARelatie.Open                                     ! File ARelatie used by this procedure, so make sure it's RelationManager is open
  Relate:Inkoop.SetOpenRelated()
  Relate:Inkoop.Open                                       ! File Inkoop used by this procedure, so make sure it's RelationManager is open
  Relate:ViewArtikel.Open                                  ! File ViewArtikel used by this procedure, so make sure it's RelationManager is open
  Access:Planning.UseFile                                  ! File referenced in 'Other Files' so need to inform it's FileManager
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:Inkoop,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  0{Prop:Text}=CLIP(0{Prop:Text}) !& ' (' & CLIP(LEFT(FORMAT(GLO:Inkoop_ThreadID,@N_10))) & ')'
  WinAlertMouseZoom()
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1.FileLoaded = 1                                      ! This is a 'file loaded' browse
  BRW1.AddSortOrder(,Ink:Verwerkt_PlanningD_K)             ! Add the sort order for Ink:Verwerkt_PlanningD_K for sort order 1
  BRW1.AddLocator(BRW1::Sort5:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort5:Locator.Init(,Ink:Verwerkt,1,BRW1)           ! Initialize the browse locator using  using key: Ink:Verwerkt_PlanningD_K , Ink:Verwerkt
  BRW1.SetFilter('(Ink:Verwerkt = LOC:NietVerwerkt)')      ! Apply filter expression to browse
  BRW1.AddSortOrder(,Ink:Verwerkt_PlanningD_K)             ! Add the sort order for Ink:Verwerkt_PlanningD_K for sort order 2
  BRW1.SetFilter('(Ink:Verwerkt = LOC:NietVerwerkt AND Ink:Planning_DATE > DATE(1,1,1900))') ! Apply filter expression to browse
  BRW1.AddSortOrder(,Ink:Verwerkt_InkoopIDD_K)             ! Add the sort order for Ink:Verwerkt_InkoopIDD_K for sort order 3
  BRW1.SetFilter('(Ink:Verwerkt = LOC:NietVerwerkt AND Ink:Leverancier = Loc:Leverancier)') ! Apply filter expression to browse
  BRW1.AddResetField(Loc:Leverancier)                      ! Apply the reset field
  BRW1.AddSortOrder(,Ink:Verwerkt_PlanningD_K)             ! Add the sort order for Ink:Verwerkt_PlanningD_K for sort order 4
  BRW1.SetFilter('(Ink:Verwerkt = LOC:Verwerkt)')          ! Apply filter expression to browse
  BRW1.AddSortOrder(,Ink:Verwerkt_PlanningD_K)             ! Add the sort order for Ink:Verwerkt_PlanningD_K for sort order 5
  BRW1.SetFilter('(Ink:Verwerkt = LOC:Verwerkt AND Ink:Leverancier = Loc:Leverancier2)') ! Apply filter expression to browse
  BRW1.AddResetField(Loc:Leverancier2)                     ! Apply the reset field
  BRW1.AddSortOrder(,Ink:Verwerkt_InkoopIDD_K)             ! Add the sort order for Ink:Verwerkt_InkoopIDD_K for sort order 6
  BRW1.SetFilter('(Ink:Verwerkt = LOC:NietVerwerkt)')      ! Apply filter expression to browse
  ?Browse:1{PROP:IconList,1} = '~off.ico'
  ?Browse:1{PROP:IconList,2} = '~on.ico'
  BRW1.AddField(Ink:InkoopID,BRW1.Q.Ink:InkoopID)          ! Field Ink:InkoopID is a hot field or requires assignment from browse
  BRW1.AddField(Rel:FirmaNaam,BRW1.Q.Rel:FirmaNaam)        ! Field Rel:FirmaNaam is a hot field or requires assignment from browse
  BRW1.AddField(Ink:Planning_DATE,BRW1.Q.Ink:Planning_DATE) ! Field Ink:Planning_DATE is a hot field or requires assignment from browse
  BRW1.AddField(Ink:Planning_TIME,BRW1.Q.Ink:Planning_TIME) ! Field Ink:Planning_TIME is a hot field or requires assignment from browse
  BRW1.AddField(Ink:Verwerkt,BRW1.Q.Ink:Verwerkt)          ! Field Ink:Verwerkt is a hot field or requires assignment from browse
  BRW1.AddField(Loc:Artikelen,BRW1.Q.Loc:Artikelen)        ! Field Loc:Artikelen is a hot field or requires assignment from browse
  BRW1.AddField(Ink:Leverancier,BRW1.Q.Ink:Leverancier)    ! Field Ink:Leverancier is a hot field or requires assignment from browse
  BRW1.AddField(Ink:Planning,BRW1.Q.Ink:Planning)          ! Field Ink:Planning is a hot field or requires assignment from browse
  BRW1.AddField(Rel:RelatieID,BRW1.Q.Rel:RelatieID)        ! Field Rel:RelatieID is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('BrowseInkoop',QuickWindow)                 ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  BRW1.AskProcedure = 1                                    ! Will call: UpdateInkoop((LOC:CurrentLeverancier))
  FDCB5.Init(AREL:FirmaNaam,?AREL:FirmaNaam,Queue:FileDropCombo.ViewPosition,FDCB5::View:FileDropCombo,Queue:FileDropCombo,Relate:ARelatie,ThisWindow,GlobalErrors,0,0,0)
  FDCB5.RemoveDuplicatesFlag = TRUE
  FDCB5.Q &= Queue:FileDropCombo
  FDCB5.AddSortOrder(AREL:Relatie_FK01)
  FDCB5.SetFilter('AREL:Type=''S''')
  FDCB5.AddField(LOC:Firmanaam,FDCB5.Q.LOC:Firmanaam) !List box control field - type derived from local data
  FDCB5.AddField(AREL:FirmaNaam,FDCB5.Q.AREL:FirmaNaam) !Browse hot field - type derived from field
  FDCB5.AddField(AREL:Type,FDCB5.Q.AREL:Type) !Browse hot field - type derived from field
  FDCB5.AddUpdateField(AREL:RelatieID,Loc:Leverancier)
  ThisWindow.AddItem(FDCB5.WindowComponent)
  FDCB5.DefaultFill = 0
  FDCB2.Init(AARel:FirmaNaam,?AARel:FirmaNaam,Queue:FileDropCombo:1.ViewPosition,FDCB2::View:FileDropCombo,Queue:FileDropCombo:1,Relate:AARelatie,ThisWindow,GlobalErrors,0,0,0)
  FDCB2.RemoveDuplicatesFlag = TRUE
  FDCB2.Q &= Queue:FileDropCombo:1
  FDCB2.AddSortOrder(AARel:Relatie_FK01)
  FDCB2.SetFilter('AARel:Type=''S''')
  FDCB2.AddField(LOC:Firmanaam2,FDCB2.Q.LOC:Firmanaam2) !List box control field - type derived from local data
  FDCB2.AddField(AARel:FirmaNaam,FDCB2.Q.AARel:FirmaNaam) !Browse hot field - type derived from field
  FDCB2.AddField(AARel:Type,FDCB2.Q.AARel:Type) !Browse hot field - type derived from field
  FDCB2.AddUpdateField(AARel:RelatieID,Loc:Leverancier2)
  ThisWindow.AddItem(FDCB2.WindowComponent)
  FDCB2.DefaultFill = 0
  SELF.SetAlerts()
  NetLocalRefreshDate = today()         ! NetTalk (NetRefresh)
  NetLocalRefreshTime = clock()
  EnterByTabManager.Init(False)
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  GLO:Inkoop_ThreadID = 0
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:AARelatie.Close
    Relate:AInkoop.Close
    Relate:APlanning.Close
    Relate:ARelatie.Close
    Relate:Inkoop.Close
    Relate:ViewArtikel.Close
  END
  IF SELF.Opened
    INIMgr.Update('BrowseInkoop',QuickWindow)              ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.Reset PROCEDURE(BYTE Force=0)

  CODE
  FREE(InkoopArtikelQueue)
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
    UpdateInkoop((LOC:CurrentLeverancier))
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
    CASE ACCEPTED()
    OF ?SjabloonButton
      Get(BRW1.Q,Choice(?Browse:1))
      CLEAR(Ink:Record)
      Ink:InkoopID = BRW1.Q.Ink:InkoopID
      IF (Access:Inkoop.TryFetch(Ink:PK_Inkoop) <> Level:Benign)
      	RETURN ReturnValue
      .
      
      ReportInkoop(Ink:InkoopID, FALSE)
    OF ?LookupAleverancier
      	AREL:FirmaNaam=AARel:FirmaNaam
    OF ?WeeglijstButton
      Get(BRW1.Q,Choice(?Browse:1))
      ReportWeeglijst('Inkoop', BRW1.Q.Ink:InkoopID)
    OF ?SjabloonButton:3
      Get(BRW1.Q,Choice(?Browse:1))
      CLEAR(Ink:Record)
      Ink:InkoopID = BRW1.Q.Ink:InkoopID
      IF (Access:Inkoop.TryFetch(Ink:PK_Inkoop) <> Level:Benign)
      	RETURN ReturnValue
      .
      
      ReportInkoop(Ink:InkoopID, TRUE)
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?KopieerButton
      ThisWindow.Update()
      ! Kopieren
      GLO:GebruikerLogHandelingOpmerking = 'Kopieren Inkoop'
      
      Get(BRW1.Q,Choice(?Browse:1))
      
      CLEAR(AInk:Record)
      AInk:InkoopID = BRW1.Q.Ink:InkoopID
      IF (Access:AInkoop.TryFetch(AInk:PK_Inkoop) = Level:Benign)
      	Access:Inkoop.PrimeRecord(false)
      	Ink:Leverancier=AInk:Leverancier
      	!Ink:Planning_DATE=today()
          !Uitgeschakeld 18-4-2017
      	!Ink:Planning_DATE=AInk:Planning_DATE
      	!Ink:Planning_TIME=AInk:Planning_TIME
      	Ink:Instructie=CLIP(AInk:Instructie)
      	Ink:Transport=CLIP(AInk:Transport)
      	Ink:LeverancierAlternatiefAdres=AInk:LeverancierAlternatiefAdres
      	Ink:TransportKosten=AInk:TransportKosten
      	Ink:ExtraKosten=AInk:ExtraKosten
      	Ink:ExtraKostenTekst=CLIP(AInk:ExtraKostenTekst)
          IF Access:Inkoop.TryInsert() = Level:Benign
              GLO:TimingMeting[1] = CLOCK() - timingmeting#
              
      		CLEAR(APla:Record)
      		APla:InkoopID =	AInk:InkoopID
      		SET(APla:Planning_FK01, APla:Planning_FK01)
      		LOOP
      			Access:APlanning.TryNext()
      			IF ERROR() THEN BREAK.
      			IF APla:InkoopID <> AInk:InkoopID THEN BREAK.
      			
      			Access:Planning.PrimeRecord(false)
      			Pla:InkoopID = Ink:InkoopID
      			Pla:ArtikelID = CLIP(APla:ArtikelID)
      			Pla:KG = APla:KG
      			Pla:Pallets = APla:Pallets
      			Pla:VerpakkingID = APla:VerpakkingID
      			Pla:CelID = APla:CelID
      			Pla:Memo = CLIP(APla:Memo)
      			Pla:Instructie = CLIP(APla:Instructie)
      			Pla:Transport = CLIP(APla:Transport)
      			Pla:InkoopKGPrijs = APla:InkoopKGPrijs
      			Pla:VerkoopKGPrijs = APla:VerkoopKGPrijs
      			Access:Planning.TryInsert()
              .
              
              GLO:TimingMeting[2] = CLOCK() - timingmeting# - GLO:TimingMeting[1]
      		
      		Access:Inkoop.TryFetch(Ink:PK_Inkoop)
      		inkoopid# = Ink:InkoopID
      		
      		GlobalRequest = ChangeRecord
      		UpdateInkoop()
      
      		IF GlobalResponse = RequestCancelled THEN
      !			CLEAR(Pla:Record)
      !			Pla:InkoopID = inkoopid#
      !			SET(Pla:Planning_FK01, Pla:Planning_FK01)
      !			LOOP
      !				Access:Planning.Next()
      !				IF ERROR() THEN BREAK.
      !				IF Pla:InkoopID <> inkoopid# THEN BREAK.
      !				
      !				db.DebugOut('Verwijderen planning:' & Pla:PlanningID)
      !				Access:Planning.DeleteRecord(false)
      !			.
      			
      			CLEAR(Ink:Record)
      			Ink:InkoopID = inkoopid#
      			Access:Inkoop.TryFetch(Ink:PK_Inkoop)
      			Relate:Inkoop.Delete(false) ! Ook planning-records meenemen
      		ELSE
      			NetRefreshPlanningViews()
      			GLO:TimingMeting[3] = CLOCK() - timingmeting# - GLO:TimingMeting[2]
      			ThisWindow.Reset(1)
      			GLO:TimingMeting[4] = CLOCK() - timingmeting# - GLO:TimingMeting[3]
      			! ERVOOR ZORGEN DAT DE ORIGINELE REGEL WEER GESELECTEERD WORDT
      			LOOP I#=1 TO RECORDS(BRW1.Q)
      				GET(BRW1.Q,I#)
      				IF BRW1.Q.Ink:InkoopID = inkoopid#
      					SELECT(?Browse:1,I#)
      					BREAK
      				END
      			END
              .
      	ELSE
      		MESSAGE('Inkoop kon niet gekopieerd worden.' & ERRORCODE())
      	.
      .
      
      GLO:GebruikerLogHandelingOpmerking = ''
    OF ?CurrentTab
      ! Omdat het nu met filters werkt ipv range wordt de leverancier niet meer standaard ingevuld.
      DO VulCurrentLeverancier
    OF ?LookupLeverancier
      ThisWindow.Update()
      GlobalRequest = SelectRecord
      SelectArelatie('S')
      ThisWindow.Reset
      	if globalresponse=RequestCompleted
      		Loc:Leverancier = AREL:RelatieID
              FDCB5.ResetQueue(True)
              
              DO VulCurrentLeverancier
      	END
      		
    OF ?LookupAleverancier
      ThisWindow.Update()
      GlobalRequest = SelectRecord
      SelectArelatie('S')
      ThisWindow.Reset
      	if globalresponse=RequestCompleted
      		Loc:Leverancier2 = AREL:RelatieID
              FDCB2.ResetQueue(True)
              
              DO VulCurrentLeverancier
      	END
    OF ?WeeglijstExcelButton
      ThisWindow.Update()
      Get(BRW1.Q,Choice(?Browse:1))
      ReportWeeglijstExcel('Inkoop', BRW1.Q.Ink:InkoopID)
    OF ?SjabloonButton:2
      ThisWindow.Update()
      WindowCallSjabloon('Inkoop',Ink:InkoopID)
      ThisWindow.Reset
    OF ?RefreshButton
      ThisWindow.Update()
      ThisWindow.Reset(1)
    OF ?Inkoopbevestiging
      ThisWindow.Update()
      ReportInkoopBevestiging(Ink:InkoopID)
      ThisWindow.Reset
    OF ?ExportnaarExact
      ThisWindow.Update()
      ExportInvoiceXML(,Ink:Record, 'PurchaseOrder')
      ThisWindow.Reset
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


ThisWindow.TakeNewSelection PROCEDURE

ReturnValue          BYTE,AUTO

Looped BYTE
  CODE
  LOOP                                                     ! This method receives all NewSelection events
    IF Looped
      RETURN Level:Notify
    ELSE
      Looped = 1
    END
  ReturnValue = PARENT.TakeNewSelection()
    CASE FIELD()
    OF ?CurrentTab
      ! Omdat het nu met filters werkt ipv range wordt de leverancier niet meer standaard ingevuld.
      DO VulCurrentLeverancier
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
    OF EVENT:Notify
        ! Focus overnemen
        !NOTIFICATION(LOC:NotifyCode)
        !IF LOC:NotifyCode = 1 THEN
            ThisWindow{Prop:Active} = 1
        !END
      
          !NOTIFICATION(NotifyCode#)
      	!IF NotifyCode# = 1
      	!	0{Prop:Active}=TRUE
      	!.	
      	!ELSIF NotifyCode# = 2
      		!ThisWindow.Reset(True)
      	!	BRW1.ResetQueue(True)
      	!.
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
  IF Request = ChangeRecord AND Ink:Verwerkt AND IGB:Administrator=0 THEN
    ! Request = ViewRecord         ! weer geactiveerd op 2018-1-29 omdat de verwerkte inkoop+verkoop aangepast kunnen worden
      ! Uitgezet op 16 maart omdat de prijzen wel nog aangepast mogen worden
  ELSIF Request = DeleteRecord AND Ink:Verwerkt THEN
      MESSAGE('Geplande inkoop is al verwerkt. Kan dus niet meer verwijderd worden.', 'Al uitgevoerd', ICON:Exclamation)
      RETURN Level:Benign
  END
  ReturnValue = PARENT.Ask(Request)
  IF ReturnValue = RequestCompleted THEN
    !  ThisWindow.Reset(1)                   ! deze kan ik uitschakelen omdat de refresh ook al door de form wordt uitgevoerd via netrefresh
  END
  RETURN ReturnValue


BRW1.Fetch PROCEDURE(BYTE Direction)

GreenBarIndex   LONG,AUTO
  CODE
  PARENT.Fetch(Direction)
  !----------------------------------------------------------------------
    LOOP GreenBarIndex=1 TO RECORDS(SELF.Q)
      GET(SELF.Q,GreenBarIndex)
      SELF.Q.Ink:InkoopID_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for Ink:InkoopID
      SELF.Q.Ink:InkoopID_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.Ink:InkoopID_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Ink:InkoopID_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Rel:FirmaNaam_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for Rel:FirmaNaam
      SELF.Q.Rel:FirmaNaam_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.Rel:FirmaNaam_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Rel:FirmaNaam_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Ink:Planning_DATE_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for Ink:Planning_DATE
      SELF.Q.Ink:Planning_DATE_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.Ink:Planning_DATE_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Ink:Planning_DATE_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Ink:Planning_TIME_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for Ink:Planning_TIME
      SELF.Q.Ink:Planning_TIME_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.Ink:Planning_TIME_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Ink:Planning_TIME_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Ink:Verwerkt_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for Ink:Verwerkt
      SELF.Q.Ink:Verwerkt_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.Ink:Verwerkt_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Ink:Verwerkt_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Loc:Artikelen_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for Loc:Artikelen
      SELF.Q.Loc:Artikelen_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.Loc:Artikelen_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Loc:Artikelen_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      PUT(SELF.Q)
    END
  !----------------------------------------------------------------------


BRW1.Init PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)

  CODE
  PARENT.Init(ListBox,Posit,V,Q,RM,WM)
  IF WM.Request <> ViewRecord                              ! If called for anything other than ViewMode, make the insert, change & delete controls available
    SELF.InsertControl=?Insert:3
    SELF.ChangeControl=?Change:3
    SELF.DeleteControl=?Delete:3
  END


BRW1.NotifyUpdateError PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  !	Return ReturnValue ! anders krijg ik een update foutmelding
  
  ReturnValue = PARENT.NotifyUpdateError()
  RETURN ReturnValue


BRW1.ResetQueue PROCEDURE(BYTE ResetMode)

  CODE
  DO VulCurrentLeverancier	
  
  
  PARENT.ResetQueue(ResetMode)


BRW1.ResetSort PROCEDURE(BYTE Force)

ReturnValue          BYTE,AUTO

  CODE
  IF CHOICE(?CurrentTab) = 2
    RETURN SELF.SetSort(1,Force)
  ELSIF CHOICE(?CurrentTab) = 3
    RETURN SELF.SetSort(2,Force)
  ELSIF CHOICE(?CurrentTab) = 4
    RETURN SELF.SetSort(3,Force)
  ELSIF CHOICE(?CurrentTab) = 5
    RETURN SELF.SetSort(4,Force)
  ELSIF CHOICE(?CurrentTab) = 6
    RETURN SELF.SetSort(5,Force)
  ELSE
    RETURN SELF.SetSort(6,Force)
  END
  ReturnValue = PARENT.ResetSort(Force)
  RETURN ReturnValue


BRW1.SetQueueRecord PROCEDURE

  CODE
  LOC:Artikelen = CachingClass.GetInkoopArtikelen(Ink:InkoopID)
  PARENT.SetQueueRecord
  
  IF (Ink:Verwerkt)
    SELF.Q.Ink:Verwerkt_Icon = 2                           ! Set icon from icon list
  ELSE
    SELF.Q.Ink:Verwerkt_Icon = 1                           ! Set icon from icon list
  END
  !----------------------------------------------------------------------
      SELF.Q.Ink:InkoopID_NormalFG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1) ! Set color values for Ink:InkoopID
      SELF.Q.Ink:InkoopID_NormalBG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,8454143)
      SELF.Q.Ink:InkoopID_SelectedFG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.Ink:InkoopID_SelectedBG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.Rel:FirmaNaam_NormalFG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1) ! Set color values for Rel:FirmaNaam
      SELF.Q.Rel:FirmaNaam_NormalBG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,8454143)
      SELF.Q.Rel:FirmaNaam_SelectedFG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.Rel:FirmaNaam_SelectedBG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.Ink:Planning_DATE_NormalFG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1) ! Set color values for Ink:Planning_DATE
      SELF.Q.Ink:Planning_DATE_NormalBG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,8454143)
      SELF.Q.Ink:Planning_DATE_SelectedFG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.Ink:Planning_DATE_SelectedBG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.Ink:Planning_TIME_NormalFG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1) ! Set color values for Ink:Planning_TIME
      SELF.Q.Ink:Planning_TIME_NormalBG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,8454143)
      SELF.Q.Ink:Planning_TIME_SelectedFG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.Ink:Planning_TIME_SelectedBG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.Ink:Verwerkt_NormalFG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1) ! Set color values for Ink:Verwerkt
      SELF.Q.Ink:Verwerkt_NormalBG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,8454143)
      SELF.Q.Ink:Verwerkt_SelectedFG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.Ink:Verwerkt_SelectedBG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.Loc:Artikelen_NormalFG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1) ! Set color values for Loc:Artikelen
      SELF.Q.Loc:Artikelen_NormalBG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,8454143)
      SELF.Q.Loc:Artikelen_SelectedFG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.Loc:Artikelen_SelectedBG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
  !----------------------------------------------------------------------


BRW1.ValidateRecord PROCEDURE

ReturnValue          BYTE,AUTO

BRW1::RecordStatus   BYTE,AUTO
  CODE
  ReturnValue = PARENT.ValidateRecord()
  IF Ink:Leverancier = 0 THEN RETURN Record:Filtered. ! Records die een andere gebruiker aan het toevoegen is, niet tonen.
  
  IF CHOICE(?CurrentTab) = 2
      IF Ink:Planning_DATE > DATE(1,1,1900) THEN
          RETURN Record:Filtered
      END
  END
  BRW1::RecordStatus=ReturnValue
  RETURN ReturnValue


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window
  SELF.SetStrategy(?Insert:3, Resize:FixLeft+Resize:FixTop, Resize:LockSize) ! Override strategy for ?Insert:3
  SELF.SetStrategy(?Change:3, Resize:FixLeft+Resize:FixTop, Resize:LockSize) ! Override strategy for ?Change:3
  SELF.SetStrategy(?Delete:3, Resize:FixLeft+Resize:FixTop, Resize:LockSize) ! Override strategy for ?Delete:3
  SELF.SetStrategy(?AREL:FirmaNaam, Resize:FixLeft+Resize:FixTop, Resize:LockSize) ! Override strategy for ?AREL:FirmaNaam
  SELF.SetStrategy(?AARel:FirmaNaam, Resize:FixLeft+Resize:FixTop, Resize:LockSize) ! Override strategy for ?AARel:FirmaNaam
  SELF.SetStrategy(?WeeglijstButton, Resize:FixLeft+Resize:FixBottom, Resize:LockSize) ! Override strategy for ?WeeglijstButton
  SELF.SetStrategy(?SjabloonButton, Resize:FixLeft+Resize:FixTop, Resize:LockSize) ! Override strategy for ?SjabloonButton
  SELF.SetStrategy(?KopieerButton, Resize:FixLeft+Resize:FixTop, Resize:LockSize) ! Override strategy for ?KopieerButton
  SELF.SetStrategy(?SjabloonButton:2, Resize:FixLeft+Resize:FixTop, Resize:LockSize) ! Override strategy for ?SjabloonButton:2
  SELF.SetStrategy(?RefreshButton, Resize:FixRight+Resize:FixBottom, Resize:LockSize) ! Override strategy for ?RefreshButton


FDCB5.SetQueueRecord PROCEDURE

  CODE
  	i#=INSTRING('<39>',AREL:FirmaNaam,1,1)
  	IF i#
  		Loc:Firmanaam = Sub(AREL:FirmaNaam,1,i#-1)&SUB(AREL:FirmaNaam,i#+1,51)
  	ELSE
  		Loc:Firmanaam = AREL:FirmaNaam
  	END
  PARENT.SetQueueRecord
  


FDCB2.SetQueueRecord PROCEDURE

  CODE
  	i#=INSTRING('<39>',AAREL:FirmaNaam,1,1)
  	IF i#
  		Loc:Firmanaam2 = Sub(AAREL:FirmaNaam,1,i#-1)&SUB(AAREL:FirmaNaam,i#+1,51)
  	ELSE
  		Loc:Firmanaam2 = AAREL:FirmaNaam
  	END
  PARENT.SetQueueRecord
  

!!! <summary>
!!! Generated from procedure template - Window
!!! Form Inkoop
!!! </summary>
UpdateInkoop PROCEDURE (LONG PRM:LeverancierID)

CurrentTab           STRING(80)                            ! 
Loc:RedenRetour      CSTRING(51)                           ! 
Loc:RetourDatum      DATE                                  ! 
ActionMessage        CSTRING(40)                           ! 
Loc:FirmaNaam        CSTRING(51)                           ! 
Sav:Leverancier      LONG                                  ! 
FDCB4::View:FileDropCombo VIEW(Relatie)
                       PROJECT(Rel:RelatieID)
                       PROJECT(Rel:FirmaNaam)
                       PROJECT(Rel:Type)
                     END
FDCB10::View:FileDropCombo VIEW(RelatieAdres)
                       PROJECT(RAD:Adres1)
                       PROJECT(RAD:Plaats)
                       PROJECT(RAD:Postcode)
                       PROJECT(RAD:Adres2)
                       PROJECT(RAD:ID)
                     END
BRW7::View:Browse    VIEW(Planning)
                       PROJECT(Pla:ArtikelID)
                       PROJECT(Pla:KG)
                       PROJECT(Pla:Pallets)
                       PROJECT(Pla:InkoopKGPrijs)
                       PROJECT(Pla:MutatieGemaakt)
                       PROJECT(Pla:Verwerkt)
                       PROJECT(Pla:Instructie)
                       PROJECT(Pla:Transport)
                       PROJECT(Pla:Memo)
                       PROJECT(Pla:PlanningID)
                       PROJECT(Pla:InkoopID)
                       PROJECT(Pla:VerpakkingID)
                       PROJECT(Pla:CelID)
                       PROJECT(Pla:CelLocatieID)
                       JOIN(Art:Artikel_PK,Pla:ArtikelID)
                         PROJECT(Art:ArtikelOms)
                         PROJECT(Art:ArtikelID)
                       END
                       JOIN(Ver:Verpakking_PK,Pla:VerpakkingID)
                         PROJECT(Ver:VerpakkingOmschrijving)
                         PROJECT(Ver:VerpakkingID)
                       END
                       JOIN(CEL:CEL_PK,Pla:CelID)
                         PROJECT(CEL:CelOms)
                         PROJECT(CEL:CelID)
                       END
                       JOIN(CL:PK_CelLocatie,Pla:CelLocatieID)
                         PROJECT(CL:Locatienaam)
                         PROJECT(CL:CelLocatieID)
                       END
                     END
Queue:Browse         QUEUE                            !Queue declaration for browse/combo box using ?List
Pla:ArtikelID          LIKE(Pla:ArtikelID)            !List box control field - type derived from field
Pla:ArtikelID_NormalFG LONG                           !Normal forground color
Pla:ArtikelID_NormalBG LONG                           !Normal background color
Pla:ArtikelID_SelectedFG LONG                         !Selected forground color
Pla:ArtikelID_SelectedBG LONG                         !Selected background color
Art:ArtikelOms         LIKE(Art:ArtikelOms)           !List box control field - type derived from field
Art:ArtikelOms_NormalFG LONG                          !Normal forground color
Art:ArtikelOms_NormalBG LONG                          !Normal background color
Art:ArtikelOms_SelectedFG LONG                        !Selected forground color
Art:ArtikelOms_SelectedBG LONG                        !Selected background color
Pla:KG                 LIKE(Pla:KG)                   !List box control field - type derived from field
Pla:KG_NormalFG        LONG                           !Normal forground color
Pla:KG_NormalBG        LONG                           !Normal background color
Pla:KG_SelectedFG      LONG                           !Selected forground color
Pla:KG_SelectedBG      LONG                           !Selected background color
Pla:Pallets            LIKE(Pla:Pallets)              !List box control field - type derived from field
Pla:Pallets_NormalFG   LONG                           !Normal forground color
Pla:Pallets_NormalBG   LONG                           !Normal background color
Pla:Pallets_SelectedFG LONG                           !Selected forground color
Pla:Pallets_SelectedBG LONG                           !Selected background color
Pla:InkoopKGPrijs      LIKE(Pla:InkoopKGPrijs)        !List box control field - type derived from field
Pla:InkoopKGPrijs_NormalFG LONG                       !Normal forground color
Pla:InkoopKGPrijs_NormalBG LONG                       !Normal background color
Pla:InkoopKGPrijs_SelectedFG LONG                     !Selected forground color
Pla:InkoopKGPrijs_SelectedBG LONG                     !Selected background color
Pla:MutatieGemaakt     LIKE(Pla:MutatieGemaakt)       !List box control field - type derived from field
Pla:MutatieGemaakt_NormalFG LONG                      !Normal forground color
Pla:MutatieGemaakt_NormalBG LONG                      !Normal background color
Pla:MutatieGemaakt_SelectedFG LONG                    !Selected forground color
Pla:MutatieGemaakt_SelectedBG LONG                    !Selected background color
Pla:MutatieGemaakt_Icon LONG                          !Entry's icon ID
Pla:Verwerkt           LIKE(Pla:Verwerkt)             !List box control field - type derived from field
Pla:Verwerkt_NormalFG  LONG                           !Normal forground color
Pla:Verwerkt_NormalBG  LONG                           !Normal background color
Pla:Verwerkt_SelectedFG LONG                          !Selected forground color
Pla:Verwerkt_SelectedBG LONG                          !Selected background color
Pla:Verwerkt_Icon      LONG                           !Entry's icon ID
Ver:VerpakkingOmschrijving LIKE(Ver:VerpakkingOmschrijving) !List box control field - type derived from field
Ver:VerpakkingOmschrijving_NormalFG LONG              !Normal forground color
Ver:VerpakkingOmschrijving_NormalBG LONG              !Normal background color
Ver:VerpakkingOmschrijving_SelectedFG LONG            !Selected forground color
Ver:VerpakkingOmschrijving_SelectedBG LONG            !Selected background color
CEL:CelOms             LIKE(CEL:CelOms)               !List box control field - type derived from field
CEL:CelOms_NormalFG    LONG                           !Normal forground color
CEL:CelOms_NormalBG    LONG                           !Normal background color
CEL:CelOms_SelectedFG  LONG                           !Selected forground color
CEL:CelOms_SelectedBG  LONG                           !Selected background color
CL:Locatienaam         LIKE(CL:Locatienaam)           !List box control field - type derived from field
CL:Locatienaam_NormalFG LONG                          !Normal forground color
CL:Locatienaam_NormalBG LONG                          !Normal background color
CL:Locatienaam_SelectedFG LONG                        !Selected forground color
CL:Locatienaam_SelectedBG LONG                        !Selected background color
Pla:Instructie         LIKE(Pla:Instructie)           !List box control field - type derived from field
Pla:Instructie_NormalFG LONG                          !Normal forground color
Pla:Instructie_NormalBG LONG                          !Normal background color
Pla:Instructie_SelectedFG LONG                        !Selected forground color
Pla:Instructie_SelectedBG LONG                        !Selected background color
Pla:Transport          LIKE(Pla:Transport)            !List box control field - type derived from field
Pla:Transport_NormalFG LONG                           !Normal forground color
Pla:Transport_NormalBG LONG                           !Normal background color
Pla:Transport_SelectedFG LONG                         !Selected forground color
Pla:Transport_SelectedBG LONG                         !Selected background color
Pla:Memo               LIKE(Pla:Memo)                 !List box control field - type derived from field
Pla:Memo_NormalFG      LONG                           !Normal forground color
Pla:Memo_NormalBG      LONG                           !Normal background color
Pla:Memo_SelectedFG    LONG                           !Selected forground color
Pla:Memo_SelectedBG    LONG                           !Selected background color
Pla:PlanningID         LIKE(Pla:PlanningID)           !Primary key field - type derived from field
Pla:InkoopID           LIKE(Pla:InkoopID)             !Browse key field - type derived from field
Art:ArtikelID          LIKE(Art:ArtikelID)            !Related join file key field - type derived from field
Ver:VerpakkingID       LIKE(Ver:VerpakkingID)         !Related join file key field - type derived from field
CEL:CelID              LIKE(CEL:CelID)                !Related join file key field - type derived from field
CL:CelLocatieID        LIKE(CL:CelLocatieID)          !Related join file key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
FDB12::View:FileDrop VIEW(Gebruiker)
                       PROJECT(Geb:VolledigeNaam)
                       PROJECT(Geb:ID)
                     END
FDB14::View:FileDrop VIEW(DeliveryTerms)
                       PROJECT(DLT:Omschrijving)
                       PROJECT(DLT:DeliveryTermsID)
                     END
Queue:FileDropCombo  QUEUE                            !
Loc:FirmaNaam          LIKE(Loc:FirmaNaam)            !List box control field - type derived from local data
Rel:RelatieID          LIKE(Rel:RelatieID)            !Browse hot field - type derived from field
Rel:FirmaNaam          LIKE(Rel:FirmaNaam)            !Browse hot field - type derived from field
Rel:Type               LIKE(Rel:Type)                 !Browse hot field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
Queue:FileDropCombo:1 QUEUE                           !
RAD:Adres1             LIKE(RAD:Adres1)               !List box control field - type derived from field
RAD:Plaats             LIKE(RAD:Plaats)               !List box control field - type derived from field
RAD:Postcode           LIKE(RAD:Postcode)             !List box control field - type derived from field
RAD:Adres2             LIKE(RAD:Adres2)               !List box control field - type derived from field
RAD:ID                 LIKE(RAD:ID)                   !Primary key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
Queue:FileDrop       QUEUE                            !
Geb:VolledigeNaam      LIKE(Geb:VolledigeNaam)        !List box control field - type derived from field
Geb:ID                 LIKE(Geb:ID)                   !Primary key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
Queue:FileDrop:1     QUEUE                            !
DLT:Omschrijving       LIKE(DLT:Omschrijving)         !List box control field - type derived from field
DLT:DeliveryTermsID    LIKE(DLT:DeliveryTermsID)      !Primary key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
LocEnableEnterByTab  BYTE(1)                               !Used by the ENTER Instead of Tab template
EnterByTabManager    EnterByTabClass
History::Ink:Record  LIKE(Ink:RECORD),THREAD
NetLocalRefreshDate     Long     ! NetTalk (NetRefresh)
NetLocalRefreshTime     Long
NetLocalDependancies    String('|Inkoop|Relatie|RelatieAdres|Planning|ViewArtikel|Verpakking|Cel|CelLocatie|Gebruiker|DeliveryTerms|')
QuickWindow          WINDOW('Form Inkoop'),AT(,,593,351),FONT('MS Sans Serif',8,,,CHARSET:DEFAULT),RESIZE,CENTER, |
  GRAY,IMM,MAX,MDI,HLP('UpdateInkoop'),SYSTEM
                       PROMPT('Inkoop:'),AT(3,6),USE(?InkoopPrompt)
                       STRING(@n_10),AT(79,6),USE(Ink:InkoopID)
                       PROMPT('Leverancier:'),AT(3,19),USE(?Ink:Leverancier:Prompt),TRN
                       COMBO(@s50),AT(77,19,285,10),USE(Rel:FirmaNaam),DROP(25),FORMAT('200L(2)|M~Firmanaam~C(0)@s50@'), |
  FROM(Queue:FileDropCombo),IMM,REQ
                       BUTTON('...'),AT(367,17,22),USE(?LookUp)
                       BUTTON('Order Retour boeken'),AT(422,19,127),USE(?btnRetour)
                       PROMPT('Afwijkend laadadres:'),AT(2,31),USE(?PROMPT1)
                       COMBO(@s100),AT(77,32,285,10),USE(RAD:Adres1),DROP(5),FORMAT('100L(2)|M~Naam~C(0)@s100@' & |
  '100L(2)|M~Plaats~C(0)@s100@40L(2)|M~Postcode~C(0)@s10@100L(2)|M~Adres 2~C(0)@s100@'),FROM(Queue:FileDropCombo:1), |
  IMM
                       PROMPT('Planningsdatum:'),AT(2,46),USE(?Ink:Planning_DATE:Prompt:2)
                       SPIN(@d6-),AT(77,47,60,10),USE(Ink:Planning_DATE,,?Ink:Planning_DATE:2)
                       BUTTON('...'),AT(141,46,12,12),USE(?Calendar)
                       PROMPT('Planningstijd:'),AT(159,47),USE(?Ink:Planning_TIME:Prompt),TRN
                       ENTRY(@t7),AT(235,47,60,10),USE(Ink:Planning_TIME)
                       CHECK('Verwerkt'),AT(422,46),USE(Ink:Verwerkt),DISABLE
                       PROMPT('Instructie:'),AT(2,60),USE(?Ink:Instructie:Prompt),HIDE,TRN
                       ENTRY(@s100),AT(77,60,282,10),USE(Ink:Instructie),HIDE
                       PROMPT('Transport:'),AT(2,74),USE(?Ink:Transport:Prompt),HIDE,TRN
                       ENTRY(@s100),AT(77,74,282,10),USE(Ink:Transport),HIDE
                       PROMPT('Transportkosten:'),AT(2,87),USE(?Ink:TransportKosten:Prompt)
                       ENTRY(@n-13`3),AT(77,86,60,10),USE(Ink:TransportKosten),RIGHT(2)
                       PROMPT('Extrakosten:'),AT(3,100),USE(?Ink:ExtraKosten:Prompt)
                       ENTRY(@n13`3),AT(77,100,60,10),USE(Ink:ExtraKosten),RIGHT(2)
                       PROMPT('Extra Kosten:'),AT(3,113),USE(?Ink:ExtraKosten:Prompt:2)
                       TEXT,AT(77,114,282,38),USE(Ink:ExtraKostenTekst),VSCROLL,BOXED
                       PROMPT('Confirmation Date:'),AT(3,157),USE(?Ink:ConfirmationDate_DATE:Prompt)
                       ENTRY(@d17),AT(77,157,60,10),USE(Ink:ConfirmationDate_DATE)
                       PROMPT('Inkoper:'),AT(146,157),USE(?PROMPT2)
                       LIST,AT(181,157,178,10),USE(Geb:VolledigeNaam),DROP(15),FORMAT('200L(2)|M~Volledige Naa' & |
  'm~L(0)@s50@'),FROM(Queue:FileDrop)
                       PROMPT('Delivery Terms:'),AT(364,158),USE(?PROMPT3)
                       LIST,AT(419,156,141,10),USE(DLT:Omschrijving),DROP(5),FORMAT('240L(2)|M~Omschrijving~L(0)@s60@'), |
  FROM(Queue:FileDrop:1)
                       PROMPT('Loading Date:'),AT(3,177),USE(?Ink:LoadingDate:Prompt)
                       ENTRY(@s50),AT(77,176,165,10),USE(Ink:LoadingDate)
                       LIST,AT(5,196,587,129),USE(?List),HVSCROLL,FORMAT('[40L(2)|*~ID~C(0)@s30@120L(2)|*~Omsc' & |
  'hrijving~C(0)@s60@]|~Artikel~59R(2)|*~KG~C(2)@n-15`2@25R(2)|*~Pallets~C(0)@n-14.@56R' & |
  '(2)|*~Inkoop KG-Prijs~C(0)@n-13`3@[35R(2)|*I~Mutatie~C(0)@p p@35R(2)|*I~Verwerkt~C(0' & |
  ')@p p@]|~Inslaan~50L(2)|*~Verpakking~C(0)@s50@[50L(2)|*~Cel~C(0)@s50@50L(2)|*~Locati' & |
  'e~C(0)@s50@]|~Cel~100L(2)|*~Instructie~C(0)@s100@100L(2)|*~Transport~C(0)@s100@100L(' & |
  '2)|*~Memo~C(0)@s100@'),FROM(Queue:Browse),IMM
                       BUTTON('&Toevoegen'),AT(326,330,51,19),USE(?Insert),DEFAULT
                       BUTTON('&Wijzigen'),AT(378,330,42,19),USE(?Change)
                       BUTTON('&Verwijderen'),AT(422,330,42,19),USE(?Delete)
                       BUTTON('&OK'),AT(478,334,49,14),USE(?OK),LEFT,ICON('WAOK.ICO'),FLAT,MSG('Accept data an' & |
  'd close the window'),TIP('Accept data and close the window')
                       BUTTON('&Annuleren'),AT(531,334,61,14),USE(?Cancel),LEFT,ICON('WACANCEL.ICO'),FLAT,MSG('Cancel operation'), |
  TIP('Cancel operation')
                     END

    omit('***',WE::CantCloseNowSetHereDone=1)  !Getting Nested omit compile error, then uncheck the "Check for duplicate CantCloseNowSetHere variable declaration" in the WinEvent local template
WE::CantCloseNowSetHereDone equate(1)
WE::CantCloseNowSetHere     long
    !***
ThisWindow           CLASS(WindowManager)
Ask                    PROCEDURE(),DERIVED
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
PrimeUpdate            PROCEDURE(),BYTE,PROC,DERIVED
Reset                  PROCEDURE(BYTE Force=0),DERIVED
Run                    PROCEDURE(),BYTE,PROC,DERIVED
Run                    PROCEDURE(USHORT Number,BYTE Request),BYTE,PROC,DERIVED
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED
TakeCompleted          PROCEDURE(),BYTE,PROC,DERIVED
TakeEvent              PROCEDURE(),BYTE,PROC,DERIVED
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
FDCB4                CLASS(FileDropComboClass)             ! File drop combo manager
Q                      &Queue:FileDropCombo           !Reference to browse queue type
SetQueueRecord         PROCEDURE(),DERIVED
                     END

FDCB10               CLASS(FileDropComboClass)             ! File drop combo manager
Q                      &Queue:FileDropCombo:1         !Reference to browse queue type
                     END

BRW7                 CLASS(BrowseClass)                    ! Browse using ?List
Q                      &Queue:Browse                  !Reference to browse queue
Ask                    PROCEDURE(BYTE Request),BYTE,PROC,DERIVED
Fetch                  PROCEDURE(BYTE Direction),DERIVED
Init                   PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)
SetQueueRecord         PROCEDURE(),DERIVED
                     END

BRW7::Sort0:Locator  StepLocatorClass                      ! Default Locator
Resizer              CLASS(WindowResizeClass)
Init                   PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)
                     END

Calendar8            CalendarClass
FDB12                CLASS(FileDropClass)                  ! File drop manager
Q                      &Queue:FileDrop                !Reference to display queue
                     END

FDB14                CLASS(FileDropClass)                  ! File drop manager
Q                      &Queue:FileDrop:1              !Reference to display queue
                     END

CurCtrlFeq          LONG
FieldColorQueue     QUEUE
Feq                   LONG
OldColor              LONG
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
UpdateVerwerkStatus ROUTINE
	Verwerkt# = true
	NoRecord# = true
	
	CLEAR(Pla:Record)
	Pla:InkoopID = Ink:InkoopID
	CLEAR(Pla:PlanningID,-1)
	SET(Pla:Planning_FK01,Pla:Planning_FK01)
	LOOP
		Access:Planning.TryNext()
		IF ERROR() THEN BREAK.
		
		IF Pla:InkoopID <> Ink:InkoopID THEN BREAK.
		
		NoRecord# = false
		
		IF NOT(Pla:Verwerkt)
			Verwerkt# = false
			BREAK
		.
	.
	
	IF NOT(NoRecord#)
		Ink:Verwerkt = Verwerkt#
		Access:Inkoop.TryUpdate()
		IF ERROR() THEN
			  IF ERRORCODE() = 90 THEN
				  MESSAGE('Inkoop-record kon niet worden bijgewerkt | SQL Error('&FILEERRORCODE()&'):'&FILEERROR()&')')
			  ELSE
				  MESSAGE('Inkoop-record kon niet worden bijgewerkt | Error('&ERRORCODE()&'):'&ERROR()&')')
			.
		.
	.
EXIT

ThisWindow.Ask PROCEDURE

  CODE
  CASE SELF.Request                                        ! Configure the action message text
  OF ViewRecord
    ActionMessage = 'View Record'
  OF InsertRecord
    ActionMessage = 'Record Will Be Added'
  OF ChangeRecord
    ActionMessage = 'Record Will Be Changed'
  END
  QuickWindow{PROP:Text} = ActionMessage                   ! Display status message in title bar
  PARENT.Ask


ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('UpdateInkoop')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?InkoopPrompt
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('Pla:PlanningID',Pla:PlanningID)                    ! Added by: BrowseBox(ABC)
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.HistoryKey = CtrlH
  SELF.AddHistoryFile(Ink:Record,History::Ink:Record)
  SELF.AddHistoryField(?Ink:InkoopID,1)
  SELF.AddHistoryField(?Ink:Planning_DATE:2,6)
  SELF.AddHistoryField(?Ink:Planning_TIME,7)
  SELF.AddHistoryField(?Ink:Verwerkt,3)
  SELF.AddHistoryField(?Ink:Instructie,8)
  SELF.AddHistoryField(?Ink:Transport,9)
  SELF.AddHistoryField(?Ink:TransportKosten,13)
  SELF.AddHistoryField(?Ink:ExtraKosten,11)
  SELF.AddHistoryField(?Ink:ExtraKostenTekst,12)
  SELF.AddHistoryField(?Ink:ConfirmationDate_DATE,21)
  SELF.AddHistoryField(?Ink:LoadingDate,29)
  SELF.AddUpdateFile(Access:Inkoop)
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  Relate:ACelLocatie.Open                                  ! File ACelLocatie used by this procedure, so make sure it's RelationManager is open
  Relate:DeliveryTerms.Open                                ! File DeliveryTerms used by this procedure, so make sure it's RelationManager is open
  Relate:Gebruiker.Open                                    ! File Gebruiker used by this procedure, so make sure it's RelationManager is open
  Relate:Inkoop.SetOpenRelated()
  Relate:Inkoop.Open                                       ! File Inkoop used by this procedure, so make sure it's RelationManager is open
  Relate:Mutatie.Open                                      ! File Mutatie used by this procedure, so make sure it's RelationManager is open
  Relate:Partij.Open                                       ! File Partij used by this procedure, so make sure it's RelationManager is open
  Relate:RelatieAdres.Open                                 ! File RelatieAdres used by this procedure, so make sure it's RelationManager is open
  Access:Verkoop.UseFile                                   ! File referenced in 'Other Files' so need to inform it's FileManager
  SELF.FilesOpened = True
  SELF.Primary &= Relate:Inkoop
  IF SELF.Request = ViewRecord AND NOT SELF.BatchProcessing ! Setup actions for ViewOnly Mode
    SELF.InsertAction = Insert:None
    SELF.DeleteAction = Delete:None
    SELF.ChangeAction = Change:None
    SELF.CancelAction = Cancel:Cancel
    SELF.OkControl = 0
  ELSE
    SELF.ChangeAction = Change:Caller                      ! Changes allowed
    SELF.CancelAction = Cancel:Cancel+Cancel:Query         ! Confirm cancel
    SELF.OkControl = ?OK
    IF SELF.PrimeUpdate() THEN RETURN Level:Notify.
  END
  IF ThisWindow.Request = InsertRecord THEN
  	IF INK:Planning_DATE=0 THEN
  		INK:Planning_DATE = TODAY()
      END
      
      Ink:Leverancier = PRM:LeverancierID
      
      CLEAR(Rel:Record)
      Rel:RelatieID = PRM:LeverancierID
      
      INK:ConfirmationDate_DATE = today()
      INK:GebruikerID=IGB:GebruikerID
      Access:Relatie.TryFetch(Rel:Relatie_PK)
      
      CLEAR(RAD:Record)    
  ELSIF Self.Request = ChangeRecord THEN
      CLEAR(RAD:Record)
      RAD:ID = Ink:LeverancierAlternatiefAdres
      IF Access:RelatieAdres.Fetch(RAD:PK_RelatieAdres) <> Level:Benign THEN
          CLEAR(RAD:Record)
      END
      Sav:Leverancier = Ink:Leverancier
  END
  BRW7.Init(?List,Queue:Browse.ViewPosition,BRW7::View:Browse,Queue:Browse,Relate:Planning,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  IF (IGB:BekijkenPrijzen <> 1) THEN
  	HIDE(?Ink:ExtraKosten)
  	HIDE(?Ink:ExtraKostenTekst)
  	HIDE(?Ink:ExtraKosten:Prompt)
      HIDE(?Ink:ExtraKosten:Prompt:2)
      HIDE(?Ink:TransportKosten)
      HIDE(?Ink:TransportKosten:Prompt)
  	?List{PROPLIST:Width, 5} = 0
  END
  
  IF GLO:HidePlanningInstructie = 1 THEN
      ?List{PROPLIST:Width, 11} = 0 
  END    
  	
  IF Ink:Verwerkt=1
      DISABLE(?InkoopPrompt,?Ink:ExtraKostenTekst)
      DISABLE(?Insert)
      DISABLE(?Delete)
      UNHIDE(?BtnRetour)
      ENABLE(?BtnRetour)
      ?BtnRetour{Prop:Text}='Retour reden:'&Ink:RedenRetour&' '&Format(Ink:RetourDatum_DATE,@d5-)
  
  ELSE
      HIDE(?BtnRetour)
  END
  WinAlertMouseZoom()
  Do DefineListboxStyle
  IF SELF.Request = ViewRecord                             ! Configure controls for View Only mode
    DISABLE(?Rel:FirmaNaam)
    DISABLE(?LookUp)
    DISABLE(?btnRetour)
    DISABLE(?RAD:Adres1)
    DISABLE(?Ink:Planning_DATE:2)
    DISABLE(?Calendar)
    DISABLE(?Ink:Planning_TIME)
    DISABLE(?Ink:Verwerkt)
    DISABLE(?Ink:Instructie)
    DISABLE(?Ink:Transport)
    DISABLE(?Ink:TransportKosten)
    DISABLE(?Ink:ExtraKosten)
    DISABLE(?Ink:ExtraKostenTekst)
    ?Ink:ConfirmationDate_DATE{PROP:ReadOnly} = True
    DISABLE(?Geb:VolledigeNaam)
    DISABLE(?DLT:Omschrijving)
    ?Ink:LoadingDate{PROP:ReadOnly} = True
    DISABLE(?Insert)
    DISABLE(?Change)
    DISABLE(?Delete)
  END
  BRW7.Q &= Queue:Browse
  BRW7.AddSortOrder(,Pla:Planning_FK01)                    ! Add the sort order for Pla:Planning_FK01 for sort order 1
  BRW7.AddRange(Pla:InkoopID,Relate:Planning,Relate:Inkoop) ! Add file relationship range limit for sort order 1
  BRW7.AddLocator(BRW7::Sort0:Locator)                     ! Browse has a locator for sort order 1
  BRW7::Sort0:Locator.Init(,Pla:PlanningID,1,BRW7)         ! Initialize the browse locator using  using key: Pla:Planning_FK01 , Pla:PlanningID
  ?List{PROP:IconList,1} = '~off.ico'
  ?List{PROP:IconList,2} = '~on.ico'
  BRW7.AddField(Pla:ArtikelID,BRW7.Q.Pla:ArtikelID)        ! Field Pla:ArtikelID is a hot field or requires assignment from browse
  BRW7.AddField(Art:ArtikelOms,BRW7.Q.Art:ArtikelOms)      ! Field Art:ArtikelOms is a hot field or requires assignment from browse
  BRW7.AddField(Pla:KG,BRW7.Q.Pla:KG)                      ! Field Pla:KG is a hot field or requires assignment from browse
  BRW7.AddField(Pla:Pallets,BRW7.Q.Pla:Pallets)            ! Field Pla:Pallets is a hot field or requires assignment from browse
  BRW7.AddField(Pla:InkoopKGPrijs,BRW7.Q.Pla:InkoopKGPrijs) ! Field Pla:InkoopKGPrijs is a hot field or requires assignment from browse
  BRW7.AddField(Pla:MutatieGemaakt,BRW7.Q.Pla:MutatieGemaakt) ! Field Pla:MutatieGemaakt is a hot field or requires assignment from browse
  BRW7.AddField(Pla:Verwerkt,BRW7.Q.Pla:Verwerkt)          ! Field Pla:Verwerkt is a hot field or requires assignment from browse
  BRW7.AddField(Ver:VerpakkingOmschrijving,BRW7.Q.Ver:VerpakkingOmschrijving) ! Field Ver:VerpakkingOmschrijving is a hot field or requires assignment from browse
  BRW7.AddField(CEL:CelOms,BRW7.Q.CEL:CelOms)              ! Field CEL:CelOms is a hot field or requires assignment from browse
  BRW7.AddField(CL:Locatienaam,BRW7.Q.CL:Locatienaam)      ! Field CL:Locatienaam is a hot field or requires assignment from browse
  BRW7.AddField(Pla:Instructie,BRW7.Q.Pla:Instructie)      ! Field Pla:Instructie is a hot field or requires assignment from browse
  BRW7.AddField(Pla:Transport,BRW7.Q.Pla:Transport)        ! Field Pla:Transport is a hot field or requires assignment from browse
  BRW7.AddField(Pla:Memo,BRW7.Q.Pla:Memo)                  ! Field Pla:Memo is a hot field or requires assignment from browse
  BRW7.AddField(Pla:PlanningID,BRW7.Q.Pla:PlanningID)      ! Field Pla:PlanningID is a hot field or requires assignment from browse
  BRW7.AddField(Pla:InkoopID,BRW7.Q.Pla:InkoopID)          ! Field Pla:InkoopID is a hot field or requires assignment from browse
  BRW7.AddField(Art:ArtikelID,BRW7.Q.Art:ArtikelID)        ! Field Art:ArtikelID is a hot field or requires assignment from browse
  BRW7.AddField(Ver:VerpakkingID,BRW7.Q.Ver:VerpakkingID)  ! Field Ver:VerpakkingID is a hot field or requires assignment from browse
  BRW7.AddField(CEL:CelID,BRW7.Q.CEL:CelID)                ! Field CEL:CelID is a hot field or requires assignment from browse
  BRW7.AddField(CL:CelLocatieID,BRW7.Q.CL:CelLocatieID)    ! Field CL:CelLocatieID is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('UpdateInkoop',QuickWindow)                 ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  FDCB4.Init(Rel:FirmaNaam,?Rel:FirmaNaam,Queue:FileDropCombo.ViewPosition,FDCB4::View:FileDropCombo,Queue:FileDropCombo,Relate:Relatie,ThisWindow,GlobalErrors,0,0,0)
  FDCB4.RemoveDuplicatesFlag = TRUE
  FDCB4.Q &= Queue:FileDropCombo
  FDCB4.AddSortOrder(Rel:Relatie_FK01)
  FDCB4.SetFilter('Rel:Type=''S''')
  FDCB4.AddField(Loc:FirmaNaam,FDCB4.Q.Loc:FirmaNaam) !List box control field - type derived from local data
  FDCB4.AddField(Rel:RelatieID,FDCB4.Q.Rel:RelatieID) !Browse hot field - type derived from field
  FDCB4.AddField(Rel:FirmaNaam,FDCB4.Q.Rel:FirmaNaam) !Browse hot field - type derived from field
  FDCB4.AddField(Rel:Type,FDCB4.Q.Rel:Type) !Browse hot field - type derived from field
  FDCB4.AddUpdateField(Rel:RelatieID,Ink:Leverancier)
  ThisWindow.AddItem(FDCB4.WindowComponent)
  FDCB4.DefaultFill = 0
  FDCB10.Init(RAD:Adres1,?RAD:Adres1,Queue:FileDropCombo:1.ViewPosition,FDCB10::View:FileDropCombo,Queue:FileDropCombo:1,Relate:RelatieAdres,ThisWindow,GlobalErrors,0,0,0)
  FDCB10.Q &= Queue:FileDropCombo:1
  FDCB10.AddSortOrder(RAD:RelatieID_ID_K)
  FDCB10.AddRange(RAD:RelatieID,Ink:Leverancier)
  FDCB10.AddField(RAD:Adres1,FDCB10.Q.RAD:Adres1) !List box control field - type derived from field
  FDCB10.AddField(RAD:Plaats,FDCB10.Q.RAD:Plaats) !List box control field - type derived from field
  FDCB10.AddField(RAD:Postcode,FDCB10.Q.RAD:Postcode) !List box control field - type derived from field
  FDCB10.AddField(RAD:Adres2,FDCB10.Q.RAD:Adres2) !List box control field - type derived from field
  FDCB10.AddField(RAD:ID,FDCB10.Q.RAD:ID) !Primary key field - type derived from field
  FDCB10.AddUpdateField(RAD:ID,Ink:LeverancierAlternatiefAdres)
  ThisWindow.AddItem(FDCB10.WindowComponent)
  FDCB10.DefaultFill = 0
  BRW7.AskProcedure = 1                                    ! Will call: UpdatePlanningInkoop
  FDB12.Init(?Geb:VolledigeNaam,Queue:FileDrop.ViewPosition,FDB12::View:FileDrop,Queue:FileDrop,Relate:Gebruiker,ThisWindow)
  FDB12.Q &= Queue:FileDrop
  FDB12.AddSortOrder(Geb:FK1_Gebruiker)
  FDB12.SetFilter('Geb:VolledigeNaam<<>''''')
  FDB12.AddField(Geb:VolledigeNaam,FDB12.Q.Geb:VolledigeNaam) !List box control field - type derived from field
  FDB12.AddField(Geb:ID,FDB12.Q.Geb:ID) !Primary key field - type derived from field
  FDB12.AddUpdateField(Geb:ID,Ink:GebruikerID)
  ThisWindow.AddItem(FDB12.WindowComponent)
  FDB12.DefaultFill = 0
  FDB14.Init(?DLT:Omschrijving,Queue:FileDrop:1.ViewPosition,FDB14::View:FileDrop,Queue:FileDrop:1,Relate:DeliveryTerms,ThisWindow)
  FDB14.Q &= Queue:FileDrop:1
  FDB14.AddSortOrder(DLT:PK_DeliveryTerms)
  FDB14.AddField(DLT:Omschrijving,FDB14.Q.DLT:Omschrijving) !List box control field - type derived from field
  FDB14.AddField(DLT:DeliveryTermsID,FDB14.Q.DLT:DeliveryTermsID) !Primary key field - type derived from field
  FDB14.AddUpdateField(DLT:DeliveryTermsID,Ink:DeliveryTermsID)
  ThisWindow.AddItem(FDB14.WindowComponent)
  FDB14.DefaultFill = 0
  BRW7.AddToolbarTarget(Toolbar)                           ! Browse accepts toolbar control
  SELF.SetAlerts()
  NetLocalRefreshDate = today()         ! NetTalk (NetRefresh)
  NetLocalRefreshTime = clock()
  EnterByTabManager.ExcludeControl(?Cancel)
  EnterByTabManager.ExcludeControl(?OK)
  EnterByTabManager.Init(False)
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:ACelLocatie.Close
    Relate:DeliveryTerms.Close
    Relate:Gebruiker.Close
    Relate:Inkoop.Close
    Relate:Mutatie.Close
    Relate:Partij.Close
    Relate:RelatieAdres.Close
  END
  IF SELF.Opened
    INIMgr.Update('UpdateInkoop',QuickWindow)              ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.PrimeUpdate PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.PrimeUpdate()
    If returnValue = Level:Fatal  ! delete just occured
      ThisNetRefresh.Send('|Inkoop|Relatie|RelatieAdres|Planning|Planning|Gebruiker|DeliveryTerms|') ! NetTalk (NetRefresh)
    End
  	If returnValue = Level:Fatal  ! delete just occured
    	NetRefreshPlanningViews()
    End
  RETURN ReturnValue


ThisWindow.Reset PROCEDURE(BYTE Force=0)

  CODE
  SELF.ForcedReset += Force
  IF QuickWindow{Prop:AcceptAll} THEN RETURN.
    NetLocalRefreshDate = today()         ! NetTalk (NetRefresh)
    NetLocalRefreshTime = clock()
  PARENT.Reset(Force)


ThisWindow.Run PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  if GlobalRequest=DeleteRecord               ! Delete code overrulen extra controles op planning / partijen
      IF Message('Weet u zeker dat deze inkoop verwijderd moet worden','Bevestiging verwijderen van '&Ink:InkoopID,ICON:Question, BUTTON:YES+BUTTON:NO, BUTTON:NO)=BUTTON:Yes
          ! handmatig verwijderen
          ! De planning gaat via de relations
          ! kijken of er mutaties zijn
          Clear(Pla:Record)
          Pla:InkoopID=Ink:InkoopID
          Set(Pla:Planning_FK01,Pla:Planning_FK01)
          Loop Until Access:Planning.Next()
              IF NOT Pla:InkoopID=Ink:InkoopID THEN BREAK.
              Clear(Mut:Record)
              Mut:PlanningID=Pla:PlanningID
              Set(Mut:Mutatie_FK02,Mut:Mutatie_FK02)
              Loop Until Access:Mutatie.Next()
                  IF NOT Mut:PlanningID=Pla:PlanningID THEN BREAK.
                  Access:Mutatie.DeleteRecord(FALSE)
              END
              Access:Planning.DeleteRecord(FALSE)
          END
          Clear(Par:Record)
          Par:InkoopID=Ink:InkoopID
          Set(Par:Partij_FK03,Par:Partij_FK03)
          Loop Until Access:Partij.Next()
              IF NOT Par:InkoopID=Ink:InkoopID THEN BREAK.
              Access:Partij.DeleteRecord(FALSE)
          END
          Access:Inkoop.DeleteRecord(FALSE)
      END
      Return ReturnValue
  END
  !      
  ReturnValue = PARENT.Run()
  IF SELF.Request = ViewRecord                             ! In View Only mode always signal RequestCancelled
    ReturnValue = RequestCancelled
  END
  RETURN ReturnValue


ThisWindow.Run PROCEDURE(USHORT Number,BYTE Request)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Run(Number,Request)
  ! Als de Status op View dan moet de UpdatePlanningInkoop ook in View mode geopend worden
    IF SELF.Request = ViewRecord      
        GlobalRequest = ViewRecord
        UpdatePlanningInkoop
        ReturnValue = GlobalResponse
    END
  IF SELF.Request = ViewRecord
    ReturnValue = RequestCancelled                         ! Always return RequestCancelled if the form was opened in ViewRecord mode
  ELSE
    GlobalRequest = Request
    UpdatePlanningInkoop
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
    CASE ACCEPTED()
    OF ?LookUp
      	AREL:FirmaNaam=Rel:FirmaNaam
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?LookUp
      ThisWindow.Update()
      GlobalRequest = SelectRecord
      SelectArelatie('S')
      ThisWindow.Reset
      	if globalresponse=RequestCompleted
      		Ink:Leverancier = AREL:RelatieID
      		FDCB4.ResetQueue(True)
      	END
      		
    OF ?btnRetour
      ThisWindow.Update()
          Loc:RedenRetour=Ink:RedenRetour
          Loc:RetourDatum=Ink:RetourDatum_DATE
          IF WindowRedenRetour('Inkoop',Ink:InkoopID, Loc:RedenRetour, Loc:RetourDatum) = RequestCompleted
              Ink:RedenRetour=Loc:RedenRetour
              Ink:RetourDatum_DATE=Loc:RetourDatum
             ! Message('success '&Ink:RedenRetour&','&Ink:RetourDatum_DATE)
              ?BtnRetour{Prop:Text}='Retour reden:'&Ink:RedenRetour&' '&Format(Ink:RetourDatum_DATE,@d5-)
             ! DISABLE(?BtnRetour)
            BRW7.ResetQueue(FALSE)
        END      
      !IF NOT WindowInkoopRedenRetour()=RequestCompleted
      !    RETURN ReturnValue
      !END
      !
      !?BtnRetour{Prop:Text}='Retour reden:'&Ink:RedenRetour
      !Clear(Pla:Record)
      !Pla:InkoopID=Ink:InkoopID
      !Set(Pla:Planning_FK01,Pla:Planning_FK01)
      !LOOP UNTIL Access:Planning.Next()
      !    IF NOT Pla:InkoopID=Ink:InkoopID THEN BREAK.
      !    ! De regels die tegengeboekt moeten worden zijn verwerkt=true
      !    ! De nieuwe regels zetten we eerst op false, anders komen we in een loop
      !    IF Pla:Verwerkt=FALSE THEN CYCLE.
      !    ! Opslaan
      !    ! dan vullen
      !    APla:Record=Pla:Record
      !    APla:Verwerkt=FALSE
      !    APla:MutatieGemaakt=FALSE
      !    APla:KG=-PLA:KG
      !    APla:Pallets = -Pla:Pallets
      !    APla:MutatieKG=-Pla:MutatieKG
      !    APla:MutatiePallets=-Pla:MutatiePallets
      !    APla:Memo=CLIP(Pla:Memo)&'RETOUR'
      !    Access:APlanning.PrimeRecord(TRUE)
      !    
      !    Clear(Mut:Record)
      !    Mut:PlanningID=Pla:PlanningID
      !    Set(Mut:Mutatie_FK02,Mut:Mutatie_FK02)
      !    Loop Until Access:Mutatie.Next()
      !        IF NOT (Mut:PlanningID=Pla:PlanningID) THEN BREAK.
      !        AMut:Record=Mut:Record
      !        AMut:InslagKG=-Mut:InslagKG
      !        AMut:InslagPallet=-Mut:InslagPallet
      !        AMut:UitslagKG=0
      !        AMut:UitslagPallet=0
      !        AMut:RedenAfboeking='RETOUR'
      !        AMut:PlanningID=APla:PlanningID
      !        Access:AMutatie.PrimeRecord(True)
      !    END
      !END
      !! en nu op verwerkt zetten.....
      !Clear(Pla:Record)
      !Pla:InkoopID=Ink:InkoopID
      !Set(Pla:Planning_FK01,Pla:Planning_FK01)
      !LOOP UNTIL Access:Planning.Next()
      !    IF NOT Pla:InkoopID=Ink:InkoopID THEN BREAK.
      !    IF Pla:Verwerkt=TRUE THEN CYCLE.
      !    Pla:Verwerkt=TRUE
      !    Pla:MutatieGemaakt=TRUE
      !    Access:Planning.Update()
      !END
      !BRW7.ResetQueue(FALSE)
    OF ?Calendar
      ThisWindow.Update()
      Calendar8.SelectOnClose = True
      Calendar8.Ask('Select a Date',Ink:Planning_DATE)
      IF Calendar8.Response = RequestCompleted THEN
      Ink:Planning_DATE=Calendar8.SelectedDate
      DISPLAY(?Ink:Planning_DATE:2)
      END
      ThisWindow.Reset(True)
    OF ?OK
      ThisWindow.Update()
      IF SELF.Request = ViewRecord AND NOT SELF.BatchProcessing THEN
         POST(EVENT:CloseWindow)
      END
    END
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue


ThisWindow.TakeCompleted PROCEDURE

ReturnValue          BYTE,AUTO

Looped BYTE
  CODE
  LOOP
    IF Looped
      RETURN Level:Notify
    ELSE
      Looped = 1
    END
  IF Ink:Planning_DATE = 0 THEN
      Ink:Planning_TIME = 0
  END
  ReturnValue = PARENT.TakeCompleted()
  DO UpdateVerwerkStatus
  db.Debugout('VoorraadClass.BerekenPartijenInkoopPrijs()')
  VoorraadClass.BerekenPartijenInkoopPrijs()
  NetRefreshPlanningViews()
  !NOTIFY(2, GLO:Planning_ThreadID)
  
  !GLO:TimingMeting[4] = CLOCK() - timingmeting# - GLO:TimingMeting[3]
  !	
  !CLEAR(Sne:Record)
  !Sne:Gebruiker = IGB:WindowsInlog
  !Sne:Datum_DATE = TODAY()
  !Sne:Datum_TIME = CLOCK()
  !Sne:Meetpunt = 'UpdateInkoop - TakeCompleted'
  !Sne:Meting = (CLOCK() - timingmeting#)
  !Sne:Waarde1 = Ink:InkoopID
  !Sne:Waarde3 = GLO:TimingMeting[1]
  !Sne:Waarde4 = GLO:TimingMeting[2]
  !Sne:Waarde5 = GLO:TimingMeting[3]
  !Sne:Waarde6 = GLO:TimingMeting[4]
  !
  !
  !Access:SnelheidLogging.Insert()   
  !
      ! Als leverancier wordt gewijzigd dan de Partijen ook wijzing
  IF Self.Request=ChangeRecord AND Sav:Leverancier<>Ink:Leverancier
      Clear(Par:Record)
      Par:InkoopID=Ink:InkoopID
      Set(Par:Partij_FK03,Par:Partij_FK03)
      LOOP UNTIL Access:Partij.Next()
          IF NOT Par:InkoopID=Ink:InkoopID then BREAK.
          IF Par:Leverancier<>Ink:Leverancier
              Par:Leverancier=Ink:Leverancier
              Access:Partij.Update()
          END
      END
  END
    ThisNetRefresh.Send('|Inkoop|Relatie|RelatieAdres|Planning|Planning|Gebruiker|DeliveryTerms|') ! NetTalk (NetRefresh)
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


FDCB4.SetQueueRecord PROCEDURE

  CODE
  	i#=INSTRING('<39>',REL:FirmaNaam,1,1)
  	if i#
  		Loc:Firmanaam = Sub(REL:FirmaNaam,1,i#-1)&SUB(REL:FirmaNaam,i#+1,51)
  	ELSE
  		Loc:Firmanaam = REL:FirmaNaam
  	End	
  PARENT.SetQueueRecord
  


BRW7.Ask PROCEDURE(BYTE Request)

ReturnValue          BYTE,AUTO

  CODE
  IF Request = ChangeRecord AND Pla:MutatieGemaakt THEN
      ! Prijzen moet wel nog gewijzigd kunnen
      !Request = ViewRecord
  ELSIF Request = DeleteRecord AND Pla:MutatieGemaakt THEN
      MESSAGE('Geplande inkoopregel is al uitgevoerd. Kan dus niet meer verwijderd worden. Draait eerst de mutaties terug.', 'Al uitgevoerd', ICON:Exclamation)
      RETURN Level:Benign
  END
  ReturnValue = PARENT.Ask(Request)
  RETURN ReturnValue


BRW7.Fetch PROCEDURE(BYTE Direction)

GreenBarIndex   LONG,AUTO
  CODE
  PARENT.Fetch(Direction)
  !----------------------------------------------------------------------
    LOOP GreenBarIndex=1 TO RECORDS(SELF.Q)
      GET(SELF.Q,GreenBarIndex)
      SELF.Q.Pla:ArtikelID_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for Pla:ArtikelID
      SELF.Q.Pla:ArtikelID_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.Pla:ArtikelID_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla:ArtikelID_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Art:ArtikelOms_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for Art:ArtikelOms
      SELF.Q.Art:ArtikelOms_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.Art:ArtikelOms_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Art:ArtikelOms_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla:KG_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for Pla:KG
      SELF.Q.Pla:KG_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.Pla:KG_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla:KG_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla:Pallets_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for Pla:Pallets
      SELF.Q.Pla:Pallets_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.Pla:Pallets_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla:Pallets_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla:InkoopKGPrijs_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for Pla:InkoopKGPrijs
      SELF.Q.Pla:InkoopKGPrijs_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.Pla:InkoopKGPrijs_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla:InkoopKGPrijs_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla:MutatieGemaakt_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for Pla:MutatieGemaakt
      SELF.Q.Pla:MutatieGemaakt_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.Pla:MutatieGemaakt_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla:MutatieGemaakt_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla:Verwerkt_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for Pla:Verwerkt
      SELF.Q.Pla:Verwerkt_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.Pla:Verwerkt_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla:Verwerkt_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Ver:VerpakkingOmschrijving_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for Ver:VerpakkingOmschrijving
      SELF.Q.Ver:VerpakkingOmschrijving_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.Ver:VerpakkingOmschrijving_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Ver:VerpakkingOmschrijving_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.CEL:CelOms_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for CEL:CelOms
      SELF.Q.CEL:CelOms_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.CEL:CelOms_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.CEL:CelOms_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.CL:Locatienaam_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for CL:Locatienaam
      SELF.Q.CL:Locatienaam_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.CL:Locatienaam_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.CL:Locatienaam_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla:Instructie_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for Pla:Instructie
      SELF.Q.Pla:Instructie_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.Pla:Instructie_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla:Instructie_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla:Transport_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for Pla:Transport
      SELF.Q.Pla:Transport_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.Pla:Transport_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla:Transport_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla:Memo_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for Pla:Memo
      SELF.Q.Pla:Memo_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.Pla:Memo_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla:Memo_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      PUT(SELF.Q)
    END
  !----------------------------------------------------------------------


BRW7.Init PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)

  CODE
  PARENT.Init(ListBox,Posit,V,Q,RM,WM)
  IF WM.Request <> ViewRecord                              ! If called for anything other than ViewMode, make the insert, change & delete controls available
    SELF.InsertControl=?Insert
    SELF.ChangeControl=?Change
    SELF.DeleteControl=?Delete
  END


BRW7.SetQueueRecord PROCEDURE

  CODE
  PARENT.SetQueueRecord
  
  IF (Pla:MutatieGemaakt)
    SELF.Q.Pla:MutatieGemaakt_Icon = 2                     ! Set icon from icon list
  ELSE
    SELF.Q.Pla:MutatieGemaakt_Icon = 1                     ! Set icon from icon list
  END
  IF (Pla:Verwerkt)
    SELF.Q.Pla:Verwerkt_Icon = 2                           ! Set icon from icon list
  ELSE
    SELF.Q.Pla:Verwerkt_Icon = 1                           ! Set icon from icon list
  END
  !----------------------------------------------------------------------
      SELF.Q.Pla:ArtikelID_NormalFG   = CHOOSE(CHOICE(?List) % 2,-1,-1) ! Set color values for Pla:ArtikelID
      SELF.Q.Pla:ArtikelID_NormalBG   = CHOOSE(CHOICE(?List) % 2,-1,8454143)
      SELF.Q.Pla:ArtikelID_SelectedFG = CHOOSE(CHOICE(?List) % 2,-1,-1)
      SELF.Q.Pla:ArtikelID_SelectedBG = CHOOSE(CHOICE(?List) % 2,-1,-1)
      SELF.Q.Art:ArtikelOms_NormalFG   = CHOOSE(CHOICE(?List) % 2,-1,-1) ! Set color values for Art:ArtikelOms
      SELF.Q.Art:ArtikelOms_NormalBG   = CHOOSE(CHOICE(?List) % 2,-1,8454143)
      SELF.Q.Art:ArtikelOms_SelectedFG = CHOOSE(CHOICE(?List) % 2,-1,-1)
      SELF.Q.Art:ArtikelOms_SelectedBG = CHOOSE(CHOICE(?List) % 2,-1,-1)
      SELF.Q.Pla:KG_NormalFG   = CHOOSE(CHOICE(?List) % 2,-1,-1) ! Set color values for Pla:KG
      SELF.Q.Pla:KG_NormalBG   = CHOOSE(CHOICE(?List) % 2,-1,8454143)
      SELF.Q.Pla:KG_SelectedFG = CHOOSE(CHOICE(?List) % 2,-1,-1)
      SELF.Q.Pla:KG_SelectedBG = CHOOSE(CHOICE(?List) % 2,-1,-1)
      SELF.Q.Pla:Pallets_NormalFG   = CHOOSE(CHOICE(?List) % 2,-1,-1) ! Set color values for Pla:Pallets
      SELF.Q.Pla:Pallets_NormalBG   = CHOOSE(CHOICE(?List) % 2,-1,8454143)
      SELF.Q.Pla:Pallets_SelectedFG = CHOOSE(CHOICE(?List) % 2,-1,-1)
      SELF.Q.Pla:Pallets_SelectedBG = CHOOSE(CHOICE(?List) % 2,-1,-1)
      SELF.Q.Pla:InkoopKGPrijs_NormalFG   = CHOOSE(CHOICE(?List) % 2,-1,-1) ! Set color values for Pla:InkoopKGPrijs
      SELF.Q.Pla:InkoopKGPrijs_NormalBG   = CHOOSE(CHOICE(?List) % 2,-1,8454143)
      SELF.Q.Pla:InkoopKGPrijs_SelectedFG = CHOOSE(CHOICE(?List) % 2,-1,-1)
      SELF.Q.Pla:InkoopKGPrijs_SelectedBG = CHOOSE(CHOICE(?List) % 2,-1,-1)
      SELF.Q.Pla:MutatieGemaakt_NormalFG   = CHOOSE(CHOICE(?List) % 2,-1,-1) ! Set color values for Pla:MutatieGemaakt
      SELF.Q.Pla:MutatieGemaakt_NormalBG   = CHOOSE(CHOICE(?List) % 2,-1,8454143)
      SELF.Q.Pla:MutatieGemaakt_SelectedFG = CHOOSE(CHOICE(?List) % 2,-1,-1)
      SELF.Q.Pla:MutatieGemaakt_SelectedBG = CHOOSE(CHOICE(?List) % 2,-1,-1)
      SELF.Q.Pla:Verwerkt_NormalFG   = CHOOSE(CHOICE(?List) % 2,-1,-1) ! Set color values for Pla:Verwerkt
      SELF.Q.Pla:Verwerkt_NormalBG   = CHOOSE(CHOICE(?List) % 2,-1,8454143)
      SELF.Q.Pla:Verwerkt_SelectedFG = CHOOSE(CHOICE(?List) % 2,-1,-1)
      SELF.Q.Pla:Verwerkt_SelectedBG = CHOOSE(CHOICE(?List) % 2,-1,-1)
      SELF.Q.Ver:VerpakkingOmschrijving_NormalFG   = CHOOSE(CHOICE(?List) % 2,-1,-1) ! Set color values for Ver:VerpakkingOmschrijving
      SELF.Q.Ver:VerpakkingOmschrijving_NormalBG   = CHOOSE(CHOICE(?List) % 2,-1,8454143)
      SELF.Q.Ver:VerpakkingOmschrijving_SelectedFG = CHOOSE(CHOICE(?List) % 2,-1,-1)
      SELF.Q.Ver:VerpakkingOmschrijving_SelectedBG = CHOOSE(CHOICE(?List) % 2,-1,-1)
      SELF.Q.CEL:CelOms_NormalFG   = CHOOSE(CHOICE(?List) % 2,-1,-1) ! Set color values for CEL:CelOms
      SELF.Q.CEL:CelOms_NormalBG   = CHOOSE(CHOICE(?List) % 2,-1,8454143)
      SELF.Q.CEL:CelOms_SelectedFG = CHOOSE(CHOICE(?List) % 2,-1,-1)
      SELF.Q.CEL:CelOms_SelectedBG = CHOOSE(CHOICE(?List) % 2,-1,-1)
      SELF.Q.CL:Locatienaam_NormalFG   = CHOOSE(CHOICE(?List) % 2,-1,-1) ! Set color values for CL:Locatienaam
      SELF.Q.CL:Locatienaam_NormalBG   = CHOOSE(CHOICE(?List) % 2,-1,8454143)
      SELF.Q.CL:Locatienaam_SelectedFG = CHOOSE(CHOICE(?List) % 2,-1,-1)
      SELF.Q.CL:Locatienaam_SelectedBG = CHOOSE(CHOICE(?List) % 2,-1,-1)
      SELF.Q.Pla:Instructie_NormalFG   = CHOOSE(CHOICE(?List) % 2,-1,-1) ! Set color values for Pla:Instructie
      SELF.Q.Pla:Instructie_NormalBG   = CHOOSE(CHOICE(?List) % 2,-1,8454143)
      SELF.Q.Pla:Instructie_SelectedFG = CHOOSE(CHOICE(?List) % 2,-1,-1)
      SELF.Q.Pla:Instructie_SelectedBG = CHOOSE(CHOICE(?List) % 2,-1,-1)
      SELF.Q.Pla:Transport_NormalFG   = CHOOSE(CHOICE(?List) % 2,-1,-1) ! Set color values for Pla:Transport
      SELF.Q.Pla:Transport_NormalBG   = CHOOSE(CHOICE(?List) % 2,-1,8454143)
      SELF.Q.Pla:Transport_SelectedFG = CHOOSE(CHOICE(?List) % 2,-1,-1)
      SELF.Q.Pla:Transport_SelectedBG = CHOOSE(CHOICE(?List) % 2,-1,-1)
      SELF.Q.Pla:Memo_NormalFG   = CHOOSE(CHOICE(?List) % 2,-1,-1) ! Set color values for Pla:Memo
      SELF.Q.Pla:Memo_NormalBG   = CHOOSE(CHOICE(?List) % 2,-1,8454143)
      SELF.Q.Pla:Memo_SelectedFG = CHOOSE(CHOICE(?List) % 2,-1,-1)
      SELF.Q.Pla:Memo_SelectedBG = CHOOSE(CHOICE(?List) % 2,-1,-1)
  !----------------------------------------------------------------------


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window
  SELF.SetStrategy(?Ink:Leverancier:Prompt, Resize:FixLeft+Resize:FixTop, Resize:LockSize) ! Override strategy for ?Ink:Leverancier:Prompt
  SELF.SetStrategy(?OK, Resize:FixRight+Resize:FixBottom, Resize:LockSize) ! Override strategy for ?OK
  SELF.SetStrategy(?Cancel, Resize:FixRight+Resize:FixBottom, Resize:LockSize) ! Override strategy for ?Cancel
  SELF.SetStrategy(?List, Resize:FixLeft+Resize:FixTop, Resize:ConstantRight+Resize:ConstantBottom) ! Override strategy for ?List
  SELF.SetStrategy(?Insert, Resize:FixRight+Resize:FixBottom, Resize:LockSize) ! Override strategy for ?Insert
  SELF.SetStrategy(?Change, Resize:FixRight+Resize:FixBottom, Resize:LockSize) ! Override strategy for ?Change
  SELF.SetStrategy(?Delete, Resize:FixRight+Resize:FixBottom, Resize:LockSize) ! Override strategy for ?Delete
  SELF.SetStrategy(?Rel:FirmaNaam, Resize:FixLeft+Resize:FixTop, Resize:LockSize) ! Override strategy for ?Rel:FirmaNaam
  SELF.SetStrategy(?PROMPT1, Resize:FixLeft+Resize:FixTop, Resize:LockSize) ! Override strategy for ?PROMPT1
  SELF.SetStrategy(?Ink:Planning_DATE:Prompt:2, Resize:FixLeft+Resize:FixTop, Resize:LockSize) ! Override strategy for ?Ink:Planning_DATE:Prompt:2
  SELF.SetStrategy(?Ink:Planning_DATE:2, Resize:FixLeft+Resize:FixTop, Resize:LockSize) ! Override strategy for ?Ink:Planning_DATE:2
  SELF.SetStrategy(?Calendar, Resize:FixLeft+Resize:FixTop, Resize:LockSize) ! Override strategy for ?Calendar
  SELF.SetStrategy(?Ink:Planning_TIME:Prompt, Resize:FixLeft+Resize:FixTop, Resize:LockSize) ! Override strategy for ?Ink:Planning_TIME:Prompt
  SELF.SetStrategy(?Ink:Planning_TIME, Resize:FixLeft+Resize:FixTop, Resize:LockSize) ! Override strategy for ?Ink:Planning_TIME
  SELF.SetStrategy(?Ink:Instructie:Prompt, Resize:FixLeft+Resize:FixTop, Resize:LockSize) ! Override strategy for ?Ink:Instructie:Prompt
  SELF.SetStrategy(?Ink:Instructie, Resize:FixLeft+Resize:FixTop, Resize:LockSize) ! Override strategy for ?Ink:Instructie
  SELF.SetStrategy(?Ink:Transport:Prompt, Resize:FixLeft+Resize:FixTop, Resize:LockSize) ! Override strategy for ?Ink:Transport:Prompt
  SELF.SetStrategy(?Ink:Transport, Resize:FixLeft+Resize:FixTop, Resize:LockSize) ! Override strategy for ?Ink:Transport
  SELF.SetStrategy(?Ink:Verwerkt, Resize:FixLeft+Resize:FixTop, Resize:LockSize) ! Override strategy for ?Ink:Verwerkt
  SELF.SetStrategy(?Ink:ExtraKosten:Prompt, Resize:FixLeft+Resize:FixTop, Resize:LockSize) ! Override strategy for ?Ink:ExtraKosten:Prompt
  SELF.SetStrategy(?Ink:ExtraKosten, Resize:FixLeft+Resize:FixTop, Resize:LockSize) ! Override strategy for ?Ink:ExtraKosten
  SELF.SetStrategy(?Ink:ExtraKosten:Prompt:2, Resize:FixLeft+Resize:FixTop, Resize:LockSize) ! Override strategy for ?Ink:ExtraKosten:Prompt:2
  SELF.SetStrategy(?RAD:Adres1, Resize:FixLeft+Resize:FixTop, Resize:LockSize) ! Override strategy for ?RAD:Adres1
  SELF.SetStrategy(?Ink:ExtraKostenTekst, Resize:FixLeft+Resize:FixTop, Resize:LockSize) ! Override strategy for ?Ink:ExtraKostenTekst
  SELF.SetStrategy(?Ink:TransportKosten:Prompt, Resize:FixLeft+Resize:FixTop, Resize:LockSize) ! Override strategy for ?Ink:TransportKosten:Prompt
  SELF.SetStrategy(?Ink:TransportKosten, Resize:FixLeft+Resize:FixTop, Resize:LockSize) ! Override strategy for ?Ink:TransportKosten

!!! <summary>
!!! Generated from procedure template - Window
!!! Form Planning
!!! </summary>
UpdatePlanningInkoop PROCEDURE 

CurrentTab           STRING(80)                            ! 
ActionMessage        CSTRING(40)                           ! 
LOC:ArtikelID        CSTRING(31)                           ! 
LOC:Planning         STRING(8)                             ! 
LOC:CelLocatieID     LONG                                  ! 
LOC:VerpakkingID     LONG                                  ! 
LOC:CelID            LONG                                  ! 
LOC:Memo             CSTRING(101)                          ! 
LOC:Instructie       CSTRING(101)                          ! 
LOC:Transport        CSTRING(101)                          ! 
LOC:InkoopKGPrijs    DECIMAL(9,3)                          ! 
LOC:SavedPlanningBuffer USHORT                             ! 
LOC:SavedPlanningFile USHORT                               ! 
FDCB7::View:FileDropCombo VIEW(ViewArtikel)
                       PROJECT(Art:ArtikelOms)
                     END
FDCB8::View:FileDropCombo VIEW(Verpakking)
                       PROJECT(Ver:VerpakkingOmschrijving)
                     END
FDCB9::View:FileDropCombo VIEW(Cel)
                       PROJECT(CEL:CelOms)
                       PROJECT(CEL:CelID)
                     END
FDCB11::View:FileDropCombo VIEW(CelLocatie)
                       PROJECT(CL:Locatienaam)
                       PROJECT(CL:CelLocatieID)
                     END
Queue:FileDropCombo  QUEUE                            !
Art:ArtikelOms         LIKE(Art:ArtikelOms)           !List box control field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
Queue:FileDropCombo:1 QUEUE                           !
Ver:VerpakkingOmschrijving LIKE(Ver:VerpakkingOmschrijving) !List box control field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
Queue:FileDropCombo:2 QUEUE                           !
CEL:CelOms             LIKE(CEL:CelOms)               !List box control field - type derived from field
CEL:CelID              LIKE(CEL:CelID)                !Primary key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
Queue:FileDropCombo:3 QUEUE                           !
CL:Locatienaam         LIKE(CL:Locatienaam)           !List box control field - type derived from field
CL:CelLocatieID        LIKE(CL:CelLocatieID)          !Primary key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
LocEnableEnterByTab  BYTE(1)                               !Used by the ENTER Instead of Tab template
EnterByTabManager    EnterByTabClass
History::Pla:Record  LIKE(Pla:RECORD),THREAD
QuickWindow          WINDOW('Form Planning'),AT(,,364,294),FONT('MS Sans Serif',8,,,CHARSET:DEFAULT),DOUBLE,CENTER, |
  GRAY,IMM,MDI,HLP('UpdatePlanning'),SYSTEM
                       SHEET,AT(4,4,356,265),USE(?CurrentTab)
                         TAB('&1) General'),USE(?Tab:1)
                           PROMPT('Artikel:'),AT(9,26),USE(?Pla:ArtikelID:Prompt),TRN
                           COMBO(@s60),AT(69,25,282,10),USE(Art:ArtikelOms),DROP(25),FORMAT('240L(2)~Artikel~C(0)@s60@'), |
  FROM(Queue:FileDropCombo),REQ
                           PROMPT('Aanvulling:'),AT(9,41),USE(?Pla:Aanvulling:Prompt)
                           ENTRY(@s100),AT(69,40,282,10),USE(Pla:Aanvulling)
                           PROMPT('KG:'),AT(9,57),USE(?Pla:KG:Prompt),TRN
                           ENTRY(@N12_.2),AT(69,54,64,10),USE(Pla:KG),RIGHT(2),REQ
                           PROMPT('Pallets:'),AT(9,70),USE(?Pla:Pallets:Prompt),TRN
                           ENTRY(@n14.),AT(69,70,64,10),USE(Pla:Pallets),RIGHT(2)
                           PROMPT('Datum:'),AT(9,83),USE(?Pla:Planning_DATE:Prompt),HIDE,TRN
                           ENTRY(@d6-),AT(69,83,64,10),USE(Pla:Planning_DATE),RIGHT(2),HIDE
                           PROMPT('Tijdstip:'),AT(173,84),USE(?Pla:Planning_TIME:Prompt),HIDE,TRN
                           ENTRY(@t7),AT(205,84,64,10),USE(Pla:Planning_TIME),RIGHT(2),HIDE
                           PROMPT('Verpakking:'),AT(9,97),USE(?Pla:VerpakkingID:Prompt),TRN
                           COMBO(@s50),AT(69,98,282,10),USE(Ver:VerpakkingOmschrijving),DROP(25),FORMAT('200L(2)~Ve' & |
  'rpakking Omschrijving~L(0)@s50@'),FROM(Queue:FileDropCombo:1),IMM
                           PROMPT('Cel:'),AT(9,113),USE(?Pla:CelID:Prompt),TRN
                           COMBO(@s50),AT(69,113,282,10),USE(CEL:CelOms),DROP(25),FORMAT('200L(2)~Omschrijving~L(0)@s50@'), |
  FROM(Queue:FileDropCombo:2),IMM
                           STRING('Cel-locatie:'),AT(9,126),USE(?STRING1)
                           COMBO(@s50),AT(69,126,282,10),USE(CL:Locatienaam),VSCROLL,DROP(5),FORMAT('200L(2)|M~Loc' & |
  'atienaam~L(0)@s50@'),FROM(Queue:FileDropCombo:3),IMM
                           PROMPT('Instructie:'),AT(9,138),USE(?Pla:Instructie:Prompt),CENTER
                           TEXT,AT(69,140,282,48),USE(Pla:Instructie,,?Pla:Instructie:2)
                           PROMPT('Transport:'),AT(9,192),USE(?Pla:Transport:Prompt)
                           TEXT,AT(70,192,281,55),USE(?Pla:Transport)
                           PROMPT('Prijs per KG:'),AT(9,252),USE(?Pla:InkoopKGPrijs:Prompt)
                           ENTRY(@n-13`3),AT(69,251,60,10),USE(Pla:InkoopKGPrijs),RIGHT(2)
                         END
                       END
                       BUTTON('&OK'),AT(239,273,49,14),USE(?OK),LEFT,ICON('WAOK.ICO'),DEFAULT,FLAT,MSG('Accept dat' & |
  'a and close the window'),TIP('Accept data and close the window')
                       BUTTON('&Annuleren'),AT(293,273,65,14),USE(?Cancel),LEFT,ICON('WACANCEL.ICO'),FLAT,MSG('Cancel operation'), |
  TIP('Cancel operation')
                     END

    omit('***',WE::CantCloseNowSetHereDone=1)  !Getting Nested omit compile error, then uncheck the "Check for duplicate CantCloseNowSetHere variable declaration" in the WinEvent local template
WE::CantCloseNowSetHereDone equate(1)
WE::CantCloseNowSetHere     long
    !***
ThisWindow           CLASS(WindowManager)
Ask                    PROCEDURE(),DERIVED
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
PrimeUpdate            PROCEDURE(),BYTE,PROC,DERIVED
Run                    PROCEDURE(),BYTE,PROC,DERIVED
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED
TakeCompleted          PROCEDURE(),BYTE,PROC,DERIVED
TakeEvent              PROCEDURE(),BYTE,PROC,DERIVED
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
FDCB7                CLASS(FileDropComboClass)             ! File drop combo manager
Q                      &Queue:FileDropCombo           !Reference to browse queue type
                     END

FDCB8                CLASS(FileDropComboClass)             ! File drop combo manager
Q                      &Queue:FileDropCombo:1         !Reference to browse queue type
                     END

FDCB9                CLASS(FileDropComboClass)             ! File drop combo manager
Q                      &Queue:FileDropCombo:2         !Reference to browse queue type
                     END

FDCB11               CLASS(FileDropComboClass)             ! File drop combo manager
Q                      &Queue:FileDropCombo:3         !Reference to browse queue type
                     END

Resizer              CLASS(WindowResizeClass)
Init                   PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)
                     END

CurCtrlFeq          LONG
FieldColorQueue     QUEUE
Feq                   LONG
OldColor              LONG
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

ThisWindow.Ask PROCEDURE

  CODE
  CASE SELF.Request                                        ! Configure the action message text
  OF ViewRecord
    ActionMessage = 'View Record'
  OF InsertRecord
    ActionMessage = 'Record Will Be Added'
  OF ChangeRecord
    ActionMessage = 'Record Will Be Changed'
  END
  QuickWindow{PROP:Text} = ActionMessage                   ! Display status message in title bar
  PARENT.Ask


ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('UpdatePlanningInkoop')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Pla:ArtikelID:Prompt
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.HistoryKey = CtrlH
  SELF.AddHistoryFile(Pla:Record,History::Pla:Record)
  SELF.AddHistoryField(?Pla:Aanvulling,59)
  SELF.AddHistoryField(?Pla:KG,5)
  SELF.AddHistoryField(?Pla:Pallets,6)
  SELF.AddHistoryField(?Pla:Planning_DATE,9)
  SELF.AddHistoryField(?Pla:Planning_TIME,10)
  SELF.AddHistoryField(?Pla:Instructie:2,20)
  SELF.AddHistoryField(?Pla:InkoopKGPrijs,27)
  SELF.AddUpdateFile(Access:Planning)
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  Relate:ACelLocatie.Open                                  ! File ACelLocatie used by this procedure, so make sure it's RelationManager is open
  Relate:Cel.SetOpenRelated()
  Relate:Cel.Open                                          ! File Cel used by this procedure, so make sure it's RelationManager is open
  Relate:Inkoop.SetOpenRelated()
  Relate:Inkoop.Open                                       ! File Inkoop used by this procedure, so make sure it's RelationManager is open
  Relate:Mutatie.Open                                      ! File Mutatie used by this procedure, so make sure it's RelationManager is open
  Relate:Verpakking.Open                                   ! File Verpakking used by this procedure, so make sure it's RelationManager is open
  Relate:ViewArtikel.Open                                  ! File ViewArtikel used by this procedure, so make sure it's RelationManager is open
  Access:Verkoop.UseFile                                   ! File referenced in 'Other Files' so need to inform it's FileManager
  SELF.FilesOpened = True
  SELF.Primary &= Relate:Planning
  IF SELF.Request = ViewRecord AND NOT SELF.BatchProcessing ! Setup actions for ViewOnly Mode
    SELF.InsertAction = Insert:None
    SELF.DeleteAction = Delete:None
    SELF.ChangeAction = Change:None
    SELF.CancelAction = Cancel:Cancel
    SELF.OkControl = 0
  ELSE
    SELF.InsertAction = Insert:Query
    SELF.ChangeAction = Change:Caller                      ! Changes allowed
    SELF.CancelAction = Cancel:Cancel+Cancel:Query         ! Confirm cancel
    SELF.OkControl = ?OK
    IF SELF.PrimeUpdate() THEN RETURN Level:Notify.
  END
  SELF.Open(QuickWindow)                                   ! Open window
  IF (IGB:BekijkenPrijzen <> 1) THEN
  	HIDE(?Pla:InkoopKGPrijs)
  	HIDE(?Pla:InkoopKGPrijs:Prompt)
  END
  
  IF (GLO:HidePlanningInstructie = 1) THEN
      HIDE(?Pla:Instructie:2)
      HIDE(?Pla:Instructie:Prompt)
      
      ?Pla:Transport:Prompt{Prop:YPos} = 126
      ?Pla:Transport{Prop:YPos} = 126
      ?Pla:Transport{Prop:Height} = 100
  END
  
  IF Ink:Verwerkt
      DISABLE(?Pla:ArtikelID:Prompt,?Pla:Transport)
  END
  WinAlertMouseZoom()
  Do DefineListboxStyle
  IF SELF.Request = ViewRecord                             ! Configure controls for View Only mode
    DISABLE(?Art:ArtikelOms)
    ?Pla:Aanvulling{PROP:ReadOnly} = True
    DISABLE(?Pla:KG)
    DISABLE(?Pla:Pallets)
    DISABLE(?Pla:Planning_DATE)
    DISABLE(?Pla:Planning_TIME)
    DISABLE(?Ver:VerpakkingOmschrijving)
    DISABLE(?CEL:CelOms)
    DISABLE(?CL:Locatienaam)
    DISABLE(?Pla:Instructie:2)
    DISABLE(?Pla:Transport)
    DISABLE(?Pla:InkoopKGPrijs)
  END
  Resizer.Init(AppStrategy:NoResize,Resize:SetMinSize)     ! Don't change the windows controls when window resized
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('UpdatePlanningInkoop',QuickWindow)         ! Restore window settings from non-volatile store
  FDCB7.Init(Art:ArtikelOms,?Art:ArtikelOms,Queue:FileDropCombo.ViewPosition,FDCB7::View:FileDropCombo,Queue:FileDropCombo,Relate:ViewArtikel,ThisWindow,GlobalErrors,0,0,0)
  FDCB7.RemoveDuplicatesFlag = TRUE
  FDCB7.Q &= Queue:FileDropCombo
  FDCB7.AddSortOrder(Art:Artikel_FK01)
  FDCB7.AddField(Art:ArtikelOms,FDCB7.Q.Art:ArtikelOms) !List box control field - type derived from field
  FDCB7.AddUpdateField(Art:ArtikelID,Pla:ArtikelID)
  ThisWindow.AddItem(FDCB7.WindowComponent)
  FDCB7.DefaultFill = 0
  FDCB8.Init(Ver:VerpakkingOmschrijving,?Ver:VerpakkingOmschrijving,Queue:FileDropCombo:1.ViewPosition,FDCB8::View:FileDropCombo,Queue:FileDropCombo:1,Relate:Verpakking,ThisWindow,GlobalErrors,0,0,0)
  FDCB8.Q &= Queue:FileDropCombo:1
  FDCB8.AddSortOrder(Ver:Verpakking_PK)
  FDCB8.AddField(Ver:VerpakkingOmschrijving,FDCB8.Q.Ver:VerpakkingOmschrijving) !List box control field - type derived from field
  FDCB8.AddUpdateField(Ver:VerpakkingID,Pla:VerpakkingID)
  ThisWindow.AddItem(FDCB8.WindowComponent)
  FDCB8.DefaultFill = 0
  FDCB9.Init(CEL:CelOms,?CEL:CelOms,Queue:FileDropCombo:2.ViewPosition,FDCB9::View:FileDropCombo,Queue:FileDropCombo:2,Relate:Cel,ThisWindow,GlobalErrors,0,0,0)
  FDCB9.Q &= Queue:FileDropCombo:2
  FDCB9.AddSortOrder(CEL:CEL_PK)
  FDCB9.AddField(CEL:CelOms,FDCB9.Q.CEL:CelOms) !List box control field - type derived from field
  FDCB9.AddField(CEL:CelID,FDCB9.Q.CEL:CelID) !Primary key field - type derived from field
  FDCB9.AddUpdateField(CEL:CelID,Pla:CelID)
  ThisWindow.AddItem(FDCB9.WindowComponent)
  FDCB9.DefaultFill = 0
  FDCB11.Init(CL:Locatienaam,?CL:Locatienaam,Queue:FileDropCombo:3.ViewPosition,FDCB11::View:FileDropCombo,Queue:FileDropCombo:3,Relate:CelLocatie,ThisWindow,GlobalErrors,0,1,0)
  FDCB11.Q &= Queue:FileDropCombo:3
  FDCB11.AddSortOrder(CL:FK_CelLocatie)
  FDCB11.AddRange(CL:CelID,Pla:CelID)
  FDCB11.AddField(CL:Locatienaam,FDCB11.Q.CL:Locatienaam) !List box control field - type derived from field
  FDCB11.AddField(CL:CelLocatieID,FDCB11.Q.CL:CelLocatieID) !Primary key field - type derived from field
  FDCB11.AddUpdateField(CL:CelLocatieID,Pla:CelLocatieID)
  ThisWindow.AddItem(FDCB11.WindowComponent)
  FDCB11.DefaultFill = 0
  SELF.SetAlerts()
  EnterByTabManager.ExcludeControl(?Cancel)
  EnterByTabManager.ExcludeControl(?OK)
  EnterByTabManager.Init(False)
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:ACelLocatie.Close
    Relate:Cel.Close
    Relate:Inkoop.Close
    Relate:Mutatie.Close
    Relate:Verpakking.Close
    Relate:ViewArtikel.Close
  END
  IF SELF.Opened
    INIMgr.Update('UpdatePlanningInkoop',QuickWindow)      ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.PrimeUpdate PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.PrimeUpdate()
    If returnValue = Level:Fatal  ! delete just occured
      ThisNetRefresh.Send('|Planning|ViewArtikel|Verpakking|Cel|CelLocatie|') ! NetTalk (NetRefresh)
    End
    	If returnValue = Level:Fatal  ! delete just occured
  		NetRefreshPlanningViews()
  	.
  RETURN ReturnValue


ThisWindow.Run PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Run()
  IF SELF.Request = ViewRecord                             ! In View Only mode always signal RequestCancelled
    ReturnValue = RequestCancelled
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
    OF ?OK
      ThisWindow.Update()
      IF SELF.Request = ViewRecord AND NOT SELF.BatchProcessing THEN
         POST(EVENT:CloseWindow)
      END
    END
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue


ThisWindow.TakeCompleted PROCEDURE

ReturnValue          BYTE,AUTO

Looped BYTE
  CODE
  LOOP
    IF Looped
      RETURN Level:Notify
    ELSE
      Looped = 1
    END
  	CLEAR(ACL:Record)
  	ACL:CelLocatieID=Pla:CelLocatieID
  	Access:ACelLocatie.TryFetch(ACL:PK_CelLocatie)
  	IF ACL:CelID <> Pla:CelID THEN Pla:CelLocatieID = 0.
  
  	LOC:ArtikelID = Pla:ArtikelID
  	LOC:Planning = Pla:Planning
  	LOC:VerpakkingID = Pla:VerpakkingID
  	LOC:CelID = Pla:CelID
  	LOC:CelLocatieID = Pla:CelLocatieID
  	LOC:Memo = Pla:Memo
  	LOC:Instructie = Pla:Instructie
      LOC:Transport = Pla:Transport
      LOC:InkoopKGPrijs = Pla:InkoopKGPrijs
  ReturnValue = PARENT.TakeCompleted()
      ! Gegevens van de vorige invoer worden niet meer overgekopieerd (verzoek Erik 19-3-2012)
      Pla:ArtikelID = LOC:ArtikelID
      Pla:Planning = LOC:Planning
  	Pla:VerpakkingID = LOC:VerpakkingID
  	Pla:CelID = LOC:CelID
  	Pla:CelLocatieID = LOC:CelLocatieID
  	Pla:Memo = LOC:Memo
  	Pla:Instructie = LOC:Instructie
      Pla:Transport = LOC:Transport
      Pla:InkoopKGPrijs = LOC:InkoopKGPrijs
  
  	LOC:SavedPlanningBuffer = Access:Planning.SaveBuffer()
  	LOC:SavedPlanningFile = Access:Planning.SaveFile()
  	VoorraadClass.BerekenPartijenInkoopPrijs()!Pla:InkoopID)
  	Access:Planning.RestoreBuffer(LOC:SavedPlanningBuffer)
  	Access:Planning.RestoreFile(LOC:SavedPlanningFile)
  		
  	ThisWindow.Reset(True)
    ThisNetRefresh.Send('|Planning|ViewArtikel|Verpakking|Cel|CelLocatie|') ! NetTalk (NetRefresh)
  	NetRefreshPlanningViews()
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
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


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window

!!! <summary>
!!! Generated from procedure template - Window
!!! Browse the Activiteit file
!!! </summary>
BrowseActiviteit PROCEDURE 

CurrentTab           STRING(80)                            ! 
LOC:Locatienaam3     STRING(50)                            ! 
LOC:VerkoopKG3       DECIMAL(7,2)                          ! 
LOC:VerkoopPallets3  LONG                                  ! 
LOC:NietUitgevoerd   BYTE                                  ! 
LOC:Uitgevoerd       BYTE                                  ! 
BRW1::View:Browse    VIEW(Activiteit)
                       PROJECT(ACT:Datum)
                       PROJECT(ACT:Tijd)
                       PROJECT(ACT:Uitgevoerd)
                       PROJECT(ACT:Omschrijving)
                       PROJECT(ACT:ActiviteitID)
                       PROJECT(ACT:DatumTijd)
                       PROJECT(ACT:PlanningID)
                       JOIN(AAPla3:PlanningID_K,ACT:PlanningID)
                         PROJECT(AAPla3:ArtikelID)
                         PROJECT(AAPla3:ArtikelOms)
                         PROJECT(AAPla3:FirmaNaam)
                         PROJECT(AAPla3:PartijID)
                         PROJECT(AAPla3:ExternPartijnr)
                         PROJECT(AAPla3:Planning_TIME)
                         PROJECT(AAPla3:Planning_DATE)
                         PROJECT(AAPla3:Instructie)
                         PROJECT(AAPla3:VerpakkingOmschrijving)
                         PROJECT(AAPla3:MutatieGemaakt)
                         PROJECT(AAPla3:Geprint)
                         PROJECT(AAPla3:Verwerkt)
                         PROJECT(AAPla3:Gewogen)
                         PROJECT(AAPla3:CelOms)
                         PROJECT(AAPla3:LeverancierFirmaNaam)
                         PROJECT(AAPla3:Transport)
                         PROJECT(AAPla3:PlanningID)
                         PROJECT(AAPla3:MutatieKG)
                         PROJECT(AAPla3:MutatiePallets)
                         PROJECT(AAPla3:KG)
                         PROJECT(AAPla3:Pallets)
                       END
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
ACT:Datum              LIKE(ACT:Datum)                !List box control field - type derived from field
ACT:Datum_NormalFG     LONG                           !Normal forground color
ACT:Datum_NormalBG     LONG                           !Normal background color
ACT:Datum_SelectedFG   LONG                           !Selected forground color
ACT:Datum_SelectedBG   LONG                           !Selected background color
ACT:Tijd               LIKE(ACT:Tijd)                 !List box control field - type derived from field
ACT:Tijd_NormalFG      LONG                           !Normal forground color
ACT:Tijd_NormalBG      LONG                           !Normal background color
ACT:Tijd_SelectedFG    LONG                           !Selected forground color
ACT:Tijd_SelectedBG    LONG                           !Selected background color
ACT:Uitgevoerd         LIKE(ACT:Uitgevoerd)           !List box control field - type derived from field
ACT:Uitgevoerd_NormalFG LONG                          !Normal forground color
ACT:Uitgevoerd_NormalBG LONG                          !Normal background color
ACT:Uitgevoerd_SelectedFG LONG                        !Selected forground color
ACT:Uitgevoerd_SelectedBG LONG                        !Selected background color
ACT:Uitgevoerd_Icon    LONG                           !Entry's icon ID
ACT:Omschrijving       LIKE(ACT:Omschrijving)         !List box control field - type derived from field
ACT:Omschrijving_NormalFG LONG                        !Normal forground color
ACT:Omschrijving_NormalBG LONG                        !Normal background color
ACT:Omschrijving_SelectedFG LONG                      !Selected forground color
ACT:Omschrijving_SelectedBG LONG                      !Selected background color
AAPla3:ArtikelID       LIKE(AAPla3:ArtikelID)         !List box control field - type derived from field
AAPla3:ArtikelID_NormalFG LONG                        !Normal forground color
AAPla3:ArtikelID_NormalBG LONG                        !Normal background color
AAPla3:ArtikelID_SelectedFG LONG                      !Selected forground color
AAPla3:ArtikelID_SelectedBG LONG                      !Selected background color
AAPla3:ArtikelOms      LIKE(AAPla3:ArtikelOms)        !List box control field - type derived from field
AAPla3:ArtikelOms_NormalFG LONG                       !Normal forground color
AAPla3:ArtikelOms_NormalBG LONG                       !Normal background color
AAPla3:ArtikelOms_SelectedFG LONG                     !Selected forground color
AAPla3:ArtikelOms_SelectedBG LONG                     !Selected background color
AAPla3:FirmaNaam       LIKE(AAPla3:FirmaNaam)         !List box control field - type derived from field
AAPla3:FirmaNaam_NormalFG LONG                        !Normal forground color
AAPla3:FirmaNaam_NormalBG LONG                        !Normal background color
AAPla3:FirmaNaam_SelectedFG LONG                      !Selected forground color
AAPla3:FirmaNaam_SelectedBG LONG                      !Selected background color
AAPla3:PartijID        LIKE(AAPla3:PartijID)          !List box control field - type derived from field
AAPla3:PartijID_NormalFG LONG                         !Normal forground color
AAPla3:PartijID_NormalBG LONG                         !Normal background color
AAPla3:PartijID_SelectedFG LONG                       !Selected forground color
AAPla3:PartijID_SelectedBG LONG                       !Selected background color
AAPla3:ExternPartijnr  LIKE(AAPla3:ExternPartijnr)    !List box control field - type derived from field
AAPla3:ExternPartijnr_NormalFG LONG                   !Normal forground color
AAPla3:ExternPartijnr_NormalBG LONG                   !Normal background color
AAPla3:ExternPartijnr_SelectedFG LONG                 !Selected forground color
AAPla3:ExternPartijnr_SelectedBG LONG                 !Selected background color
LOC:VerkoopKG3         LIKE(LOC:VerkoopKG3)           !List box control field - type derived from local data
LOC:VerkoopKG3_NormalFG LONG                          !Normal forground color
LOC:VerkoopKG3_NormalBG LONG                          !Normal background color
LOC:VerkoopKG3_SelectedFG LONG                        !Selected forground color
LOC:VerkoopKG3_SelectedBG LONG                        !Selected background color
AAPla3:Planning_TIME   LIKE(AAPla3:Planning_TIME)     !List box control field - type derived from field
AAPla3:Planning_TIME_NormalFG LONG                    !Normal forground color
AAPla3:Planning_TIME_NormalBG LONG                    !Normal background color
AAPla3:Planning_TIME_SelectedFG LONG                  !Selected forground color
AAPla3:Planning_TIME_SelectedBG LONG                  !Selected background color
AAPla3:Planning_DATE   LIKE(AAPla3:Planning_DATE)     !List box control field - type derived from field
AAPla3:Planning_DATE_NormalFG LONG                    !Normal forground color
AAPla3:Planning_DATE_NormalBG LONG                    !Normal background color
AAPla3:Planning_DATE_SelectedFG LONG                  !Selected forground color
AAPla3:Planning_DATE_SelectedBG LONG                  !Selected background color
AAPla3:Instructie      LIKE(AAPla3:Instructie)        !List box control field - type derived from field
AAPla3:Instructie_NormalFG LONG                       !Normal forground color
AAPla3:Instructie_NormalBG LONG                       !Normal background color
AAPla3:Instructie_SelectedFG LONG                     !Selected forground color
AAPla3:Instructie_SelectedBG LONG                     !Selected background color
AAPla3:Instructie_Tip  STRING(80)                     !Field tooltip
AAPla3:VerpakkingOmschrijving LIKE(AAPla3:VerpakkingOmschrijving) !List box control field - type derived from field
AAPla3:VerpakkingOmschrijving_NormalFG LONG           !Normal forground color
AAPla3:VerpakkingOmschrijving_NormalBG LONG           !Normal background color
AAPla3:VerpakkingOmschrijving_SelectedFG LONG         !Selected forground color
AAPla3:VerpakkingOmschrijving_SelectedBG LONG         !Selected background color
LOC:VerkoopPallets3    LIKE(LOC:VerkoopPallets3)      !List box control field - type derived from local data
LOC:VerkoopPallets3_NormalFG LONG                     !Normal forground color
LOC:VerkoopPallets3_NormalBG LONG                     !Normal background color
LOC:VerkoopPallets3_SelectedFG LONG                   !Selected forground color
LOC:VerkoopPallets3_SelectedBG LONG                   !Selected background color
AAPla3:MutatieGemaakt  LIKE(AAPla3:MutatieGemaakt)    !List box control field - type derived from field
AAPla3:MutatieGemaakt_NormalFG LONG                   !Normal forground color
AAPla3:MutatieGemaakt_NormalBG LONG                   !Normal background color
AAPla3:MutatieGemaakt_SelectedFG LONG                 !Selected forground color
AAPla3:MutatieGemaakt_SelectedBG LONG                 !Selected background color
AAPla3:MutatieGemaakt_Icon LONG                       !Entry's icon ID
AAPla3:Geprint         LIKE(AAPla3:Geprint)           !List box control field - type derived from field
AAPla3:Geprint_NormalFG LONG                          !Normal forground color
AAPla3:Geprint_NormalBG LONG                          !Normal background color
AAPla3:Geprint_SelectedFG LONG                        !Selected forground color
AAPla3:Geprint_SelectedBG LONG                        !Selected background color
AAPla3:Geprint_Icon    LONG                           !Entry's icon ID
AAPla3:Verwerkt        LIKE(AAPla3:Verwerkt)          !List box control field - type derived from field
AAPla3:Verwerkt_NormalFG LONG                         !Normal forground color
AAPla3:Verwerkt_NormalBG LONG                         !Normal background color
AAPla3:Verwerkt_SelectedFG LONG                       !Selected forground color
AAPla3:Verwerkt_SelectedBG LONG                       !Selected background color
AAPla3:Verwerkt_Icon   LONG                           !Entry's icon ID
AAPla3:Gewogen         LIKE(AAPla3:Gewogen)           !List box control field - type derived from field
AAPla3:Gewogen_NormalFG LONG                          !Normal forground color
AAPla3:Gewogen_NormalBG LONG                          !Normal background color
AAPla3:Gewogen_SelectedFG LONG                        !Selected forground color
AAPla3:Gewogen_SelectedBG LONG                        !Selected background color
AAPla3:Gewogen_Icon    LONG                           !Entry's icon ID
AAPla3:CelOms          LIKE(AAPla3:CelOms)            !List box control field - type derived from field
AAPla3:CelOms_NormalFG LONG                           !Normal forground color
AAPla3:CelOms_NormalBG LONG                           !Normal background color
AAPla3:CelOms_SelectedFG LONG                         !Selected forground color
AAPla3:CelOms_SelectedBG LONG                         !Selected background color
LOC:Locatienaam3       LIKE(LOC:Locatienaam3)         !List box control field - type derived from local data
LOC:Locatienaam3_NormalFG LONG                        !Normal forground color
LOC:Locatienaam3_NormalBG LONG                        !Normal background color
LOC:Locatienaam3_SelectedFG LONG                      !Selected forground color
LOC:Locatienaam3_SelectedBG LONG                      !Selected background color
AAPla3:LeverancierFirmaNaam LIKE(AAPla3:LeverancierFirmaNaam) !List box control field - type derived from field
AAPla3:LeverancierFirmaNaam_NormalFG LONG             !Normal forground color
AAPla3:LeverancierFirmaNaam_NormalBG LONG             !Normal background color
AAPla3:LeverancierFirmaNaam_SelectedFG LONG           !Selected forground color
AAPla3:LeverancierFirmaNaam_SelectedBG LONG           !Selected background color
AAPla3:Transport       LIKE(AAPla3:Transport)         !List box control field - type derived from field
AAPla3:Transport_NormalFG LONG                        !Normal forground color
AAPla3:Transport_NormalBG LONG                        !Normal background color
AAPla3:Transport_SelectedFG LONG                      !Selected forground color
AAPla3:Transport_SelectedBG LONG                      !Selected background color
AAPla3:Transport_Tip   STRING(80)                     !Field tooltip
AAPla3:PlanningID      LIKE(AAPla3:PlanningID)        !List box control field - type derived from field
AAPla3:PlanningID_NormalFG LONG                       !Normal forground color
AAPla3:PlanningID_NormalBG LONG                       !Normal background color
AAPla3:PlanningID_SelectedFG LONG                     !Selected forground color
AAPla3:PlanningID_SelectedBG LONG                     !Selected background color
AAPla3:PlanningID_Tip  STRING(80)                     !Field tooltip
AAPla3:MutatieKG       LIKE(AAPla3:MutatieKG)         !Browse hot field - type derived from field
AAPla3:MutatiePallets  LIKE(AAPla3:MutatiePallets)    !Browse hot field - type derived from field
AAPla3:KG              LIKE(AAPla3:KG)                !Browse hot field - type derived from field
AAPla3:Pallets         LIKE(AAPla3:Pallets)           !Browse hot field - type derived from field
ACT:ActiviteitID       LIKE(ACT:ActiviteitID)         !Primary key field - type derived from field
ACT:DatumTijd          LIKE(ACT:DatumTijd)            !Browse key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
LocEnableEnterByTab  BYTE(1)                               !Used by the ENTER Instead of Tab template
EnterByTabManager    EnterByTabClass
NetLocalRefreshDate     Long     ! NetTalk (NetRefresh)
NetLocalRefreshTime     Long
NetLocalDependancies    String('|Activiteit|AAPlanningVerkoop|')
QuickWindow          WINDOW('Activiteiten.'),AT(,,358,198),FONT('Microsoft Sans Serif',8,,FONT:regular,CHARSET:DEFAULT), |
  RESIZE,CENTER,GRAY,IMM,MAX,MDI,HLP('BrowseActiviteit'),SYSTEM
                       LIST,AT(8,22,342,134),USE(?Browse:1),HVSCROLL,FORMAT('[63L(2)|M*~Datum~C(0)@d6-@40L(2)|' & |
  'M*~Tijd~C(0)@t7B@37L(2)|M*I~Uitgevoerd~C(0)@p p@200L(2)|M*~Omschrijving~@s255@]|~Act' & |
  'iviteit~[30L(2)|M*~ID~C(0)@s30@66L(2)|M*~Omschrijving~C(0)@s60@]|M~Artikel~110L(2)|M' & |
  '*~Afnemer~C(0)@s50@[30R(2)|M*~Intern~C(0)@n_10B@30R(2)|M*~Extern~C(1)@s20@]|M~Partij' & |
  '-nummer~40R(2)|M*~KG~C(0)@n-14`2@[22R(2)|M*~Tijd~C(0)@t7@40R(2)|M*~Datum~C(0)@d17@](' & |
  '70)|~Ingepland~170L(2)|M*P~Instructie~C(2)@s100@50L(2)|M*~Verpakking~C(0)@s50@30R(2)' & |
  '|M*~Pallets~C(1)@n_10@22R(2)|M*I~Uitslag~C(0)@p p@20C(2)|M*I~Print~C(0)@p p@30C(2)|M' & |
  '*I~Verwerkt~C(0)@p p@30C(2)|M*I~Gewogen~C(0)@p p@[20L(2)|M*@s50@40L(2)|M*@s50@]|M~Ce' & |
  'l~50L(2)|M*~Leverancier~C(0)@s50@50L(2)|M*P~Transport~C(0)@s100@60L(2)|M*P~Planning ' & |
  'ID~L(0)@n-14@'),FROM(Queue:Browse:1),IMM
                       BUTTON('&Bekijken'),AT(7,158,58,14),USE(?View:2),LEFT,ICON('WAVIEW.ICO'),FLAT,HIDE,MSG('View Record'), |
  TIP('View Record')
                       BUTTON('&Toevoegen'),AT(157,158,64,14),USE(?Insert:3),LEFT,ICON('WAINSERT.ICO'),FLAT,MSG('Insert a Record'), |
  TIP('Insert a Record')
                       BUTTON('&Wijzigen'),AT(225,158,57,14),USE(?Change:3),LEFT,ICON('WACHANGE.ICO'),DEFAULT,FLAT, |
  MSG('Change the Record'),TIP('Change the Record')
                       BUTTON('&Verwijderen'),AT(286,158,65,14),USE(?Delete:3),LEFT,ICON('WADELETE.ICO'),FLAT,MSG('Delete the Record'), |
  TIP('Delete the Record')
                       SHEET,AT(4,4,350,172),USE(?CurrentTab)
                         TAB('Nog niet uitgevoerd'),USE(?Tab:1)
                         END
                         TAB('Uitgevoerd'),USE(?Tab:4)
                         END
                         TAB('Alle'),USE(?Tab:5)
                         END
                       END
                       BUTTON('&Afsluiten'),AT(295,180,57,14),USE(?Close),LEFT,ICON('WACLOSE.ICO'),FLAT,MSG('Close Window'), |
  TIP('Close Window')
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
TakeEvent              PROCEDURE(),BYTE,PROC,DERIVED
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
BRW1                 CLASS(BrowseClass)                    ! Browse using ?Browse:1
Q                      &Queue:Browse:1                !Reference to browse queue
Fetch                  PROCEDURE(BYTE Direction),DERIVED
Init                   PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)
ResetSort              PROCEDURE(BYTE Force),BYTE,PROC,DERIVED
SetQueueRecord         PROCEDURE(),DERIVED
                     END

BRW1::Sort0:Locator  StepLocatorClass                      ! Default Locator
BRW1::Sort1:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 2
BRW1::Sort2:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 3
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

ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('BrowseActiviteit')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  GLO:Activiteit_ThreadID = THREAD() 
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Browse:1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('LOC:VerkoopKG3',LOC:VerkoopKG3)                    ! Added by: BrowseBox(ABC)
  BIND('LOC:VerkoopPallets3',LOC:VerkoopPallets3)          ! Added by: BrowseBox(ABC)
  BIND('LOC:Locatienaam3',LOC:Locatienaam3)                ! Added by: BrowseBox(ABC)
  BIND('ACT:ActiviteitID',ACT:ActiviteitID)                ! Added by: BrowseBox(ABC)
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  IF SELF.Request = SelectRecord
     SELF.AddItem(?Close,RequestCancelled)                 ! Add the close control to the window manger
  ELSE
     SELF.AddItem(?Close,RequestCompleted)                 ! Add the close control to the window manger
  END
  Relate:Activiteit.Open                                   ! File Activiteit used by this procedure, so make sure it's RelationManager is open
  Relate:ViewPartijCelLocaties.Open                        ! File ViewPartijCelLocaties used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  LOC:NietUitgevoerd=0
  LOC:Uitgevoerd=1
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:Activiteit,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  WinAlertMouseZoom()
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1.AddSortOrder(,ACT:FK3_Activiteit)                   ! Add the sort order for ACT:FK3_Activiteit for sort order 1
  BRW1.AddRange(ACT:Uitgevoerd,LOC:Uitgevoerd)             ! Add single value range limit for sort order 1
  BRW1.AddLocator(BRW1::Sort1:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort1:Locator.Init(,ACT:DatumTijd,1,BRW1)          ! Initialize the browse locator using  using key: ACT:FK3_Activiteit , ACT:DatumTijd
  BRW1.AddSortOrder(,ACT:FK4_Activiteit)                   ! Add the sort order for ACT:FK4_Activiteit for sort order 2
  BRW1.AddLocator(BRW1::Sort2:Locator)                     ! Browse has a locator for sort order 2
  BRW1::Sort2:Locator.Init(,ACT:DatumTijd,1,BRW1)          ! Initialize the browse locator using  using key: ACT:FK4_Activiteit , ACT:DatumTijd
  BRW1.AddSortOrder(,ACT:FK3_Activiteit)                   ! Add the sort order for ACT:FK3_Activiteit for sort order 3
  BRW1.AddRange(ACT:Uitgevoerd,LOC:NietUitgevoerd)         ! Add single value range limit for sort order 3
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 3
  BRW1::Sort0:Locator.Init(,ACT:DatumTijd,1,BRW1)          ! Initialize the browse locator using  using key: ACT:FK3_Activiteit , ACT:DatumTijd
  ?Browse:1{PROP:IconList,1} = '~off.ico'
  ?Browse:1{PROP:IconList,2} = '~on.ico'
  BRW1.AddField(ACT:Datum,BRW1.Q.ACT:Datum)                ! Field ACT:Datum is a hot field or requires assignment from browse
  BRW1.AddField(ACT:Tijd,BRW1.Q.ACT:Tijd)                  ! Field ACT:Tijd is a hot field or requires assignment from browse
  BRW1.AddField(ACT:Uitgevoerd,BRW1.Q.ACT:Uitgevoerd)      ! Field ACT:Uitgevoerd is a hot field or requires assignment from browse
  BRW1.AddField(ACT:Omschrijving,BRW1.Q.ACT:Omschrijving)  ! Field ACT:Omschrijving is a hot field or requires assignment from browse
  BRW1.AddField(AAPla3:ArtikelID,BRW1.Q.AAPla3:ArtikelID)  ! Field AAPla3:ArtikelID is a hot field or requires assignment from browse
  BRW1.AddField(AAPla3:ArtikelOms,BRW1.Q.AAPla3:ArtikelOms) ! Field AAPla3:ArtikelOms is a hot field or requires assignment from browse
  BRW1.AddField(AAPla3:FirmaNaam,BRW1.Q.AAPla3:FirmaNaam)  ! Field AAPla3:FirmaNaam is a hot field or requires assignment from browse
  BRW1.AddField(AAPla3:PartijID,BRW1.Q.AAPla3:PartijID)    ! Field AAPla3:PartijID is a hot field or requires assignment from browse
  BRW1.AddField(AAPla3:ExternPartijnr,BRW1.Q.AAPla3:ExternPartijnr) ! Field AAPla3:ExternPartijnr is a hot field or requires assignment from browse
  BRW1.AddField(LOC:VerkoopKG3,BRW1.Q.LOC:VerkoopKG3)      ! Field LOC:VerkoopKG3 is a hot field or requires assignment from browse
  BRW1.AddField(AAPla3:Planning_TIME,BRW1.Q.AAPla3:Planning_TIME) ! Field AAPla3:Planning_TIME is a hot field or requires assignment from browse
  BRW1.AddField(AAPla3:Planning_DATE,BRW1.Q.AAPla3:Planning_DATE) ! Field AAPla3:Planning_DATE is a hot field or requires assignment from browse
  BRW1.AddField(AAPla3:Instructie,BRW1.Q.AAPla3:Instructie) ! Field AAPla3:Instructie is a hot field or requires assignment from browse
  BRW1.AddField(AAPla3:VerpakkingOmschrijving,BRW1.Q.AAPla3:VerpakkingOmschrijving) ! Field AAPla3:VerpakkingOmschrijving is a hot field or requires assignment from browse
  BRW1.AddField(LOC:VerkoopPallets3,BRW1.Q.LOC:VerkoopPallets3) ! Field LOC:VerkoopPallets3 is a hot field or requires assignment from browse
  BRW1.AddField(AAPla3:MutatieGemaakt,BRW1.Q.AAPla3:MutatieGemaakt) ! Field AAPla3:MutatieGemaakt is a hot field or requires assignment from browse
  BRW1.AddField(AAPla3:Geprint,BRW1.Q.AAPla3:Geprint)      ! Field AAPla3:Geprint is a hot field or requires assignment from browse
  BRW1.AddField(AAPla3:Verwerkt,BRW1.Q.AAPla3:Verwerkt)    ! Field AAPla3:Verwerkt is a hot field or requires assignment from browse
  BRW1.AddField(AAPla3:Gewogen,BRW1.Q.AAPla3:Gewogen)      ! Field AAPla3:Gewogen is a hot field or requires assignment from browse
  BRW1.AddField(AAPla3:CelOms,BRW1.Q.AAPla3:CelOms)        ! Field AAPla3:CelOms is a hot field or requires assignment from browse
  BRW1.AddField(LOC:Locatienaam3,BRW1.Q.LOC:Locatienaam3)  ! Field LOC:Locatienaam3 is a hot field or requires assignment from browse
  BRW1.AddField(AAPla3:LeverancierFirmaNaam,BRW1.Q.AAPla3:LeverancierFirmaNaam) ! Field AAPla3:LeverancierFirmaNaam is a hot field or requires assignment from browse
  BRW1.AddField(AAPla3:Transport,BRW1.Q.AAPla3:Transport)  ! Field AAPla3:Transport is a hot field or requires assignment from browse
  BRW1.AddField(AAPla3:PlanningID,BRW1.Q.AAPla3:PlanningID) ! Field AAPla3:PlanningID is a hot field or requires assignment from browse
  BRW1.AddField(AAPla3:MutatieKG,BRW1.Q.AAPla3:MutatieKG)  ! Field AAPla3:MutatieKG is a hot field or requires assignment from browse
  BRW1.AddField(AAPla3:MutatiePallets,BRW1.Q.AAPla3:MutatiePallets) ! Field AAPla3:MutatiePallets is a hot field or requires assignment from browse
  BRW1.AddField(AAPla3:KG,BRW1.Q.AAPla3:KG)                ! Field AAPla3:KG is a hot field or requires assignment from browse
  BRW1.AddField(AAPla3:Pallets,BRW1.Q.AAPla3:Pallets)      ! Field AAPla3:Pallets is a hot field or requires assignment from browse
  BRW1.AddField(ACT:ActiviteitID,BRW1.Q.ACT:ActiviteitID)  ! Field ACT:ActiviteitID is a hot field or requires assignment from browse
  BRW1.AddField(ACT:DatumTijd,BRW1.Q.ACT:DatumTijd)        ! Field ACT:DatumTijd is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('BrowseActiviteit',QuickWindow)             ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  BRW1.AskProcedure = 1                                    ! Will call: UpdateActiviteit((0))
  SELF.SetAlerts()
  NetLocalRefreshDate = today()         ! NetTalk (NetRefresh)
  NetLocalRefreshTime = clock()
  EnterByTabManager.Init(False)
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  GLO:Activiteit_ThreadID = 0
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:Activiteit.Close
    Relate:ViewPartijCelLocaties.Close
  END
  IF SELF.Opened
    INIMgr.Update('BrowseActiviteit',QuickWindow)          ! Save window data to non-volatile store
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
    UpdateActiviteit((0))
    ReturnValue = GlobalResponse
  END
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
    OF EVENT:Notify
        ! Focus overnemen
        !NOTIFICATION(LOC:NotifyCode)
        !IF LOC:NotifyCode = 1 THEN
        ThisWindow{Prop:Active} = 1
        !END
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


BRW1.Fetch PROCEDURE(BYTE Direction)

GreenBarIndex   LONG,AUTO
  CODE
  PARENT.Fetch(Direction)
  !----------------------------------------------------------------------
    LOOP GreenBarIndex=1 TO RECORDS(SELF.Q)
      GET(SELF.Q,GreenBarIndex)
      SELF.Q.ACT:Datum_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for ACT:Datum
      SELF.Q.ACT:Datum_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.ACT:Datum_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.ACT:Datum_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.ACT:Tijd_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for ACT:Tijd
      SELF.Q.ACT:Tijd_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.ACT:Tijd_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.ACT:Tijd_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.ACT:Uitgevoerd_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for ACT:Uitgevoerd
      SELF.Q.ACT:Uitgevoerd_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.ACT:Uitgevoerd_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.ACT:Uitgevoerd_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.ACT:Omschrijving_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for ACT:Omschrijving
      SELF.Q.ACT:Omschrijving_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.ACT:Omschrijving_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.ACT:Omschrijving_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.AAPla3:ArtikelID_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for AAPla3:ArtikelID
      SELF.Q.AAPla3:ArtikelID_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.AAPla3:ArtikelID_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.AAPla3:ArtikelID_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.AAPla3:ArtikelOms_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for AAPla3:ArtikelOms
      SELF.Q.AAPla3:ArtikelOms_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.AAPla3:ArtikelOms_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.AAPla3:ArtikelOms_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.AAPla3:FirmaNaam_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for AAPla3:FirmaNaam
      SELF.Q.AAPla3:FirmaNaam_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.AAPla3:FirmaNaam_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.AAPla3:FirmaNaam_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.AAPla3:PartijID_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for AAPla3:PartijID
      SELF.Q.AAPla3:PartijID_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.AAPla3:PartijID_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.AAPla3:PartijID_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.AAPla3:ExternPartijnr_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for AAPla3:ExternPartijnr
      SELF.Q.AAPla3:ExternPartijnr_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.AAPla3:ExternPartijnr_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.AAPla3:ExternPartijnr_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.LOC:VerkoopKG3_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for LOC:VerkoopKG3
      SELF.Q.LOC:VerkoopKG3_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.LOC:VerkoopKG3_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.LOC:VerkoopKG3_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.AAPla3:Planning_TIME_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for AAPla3:Planning_TIME
      SELF.Q.AAPla3:Planning_TIME_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.AAPla3:Planning_TIME_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.AAPla3:Planning_TIME_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.AAPla3:Planning_DATE_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for AAPla3:Planning_DATE
      SELF.Q.AAPla3:Planning_DATE_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.AAPla3:Planning_DATE_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.AAPla3:Planning_DATE_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.AAPla3:Instructie_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for AAPla3:Instructie
      SELF.Q.AAPla3:Instructie_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.AAPla3:Instructie_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.AAPla3:Instructie_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.AAPla3:VerpakkingOmschrijving_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for AAPla3:VerpakkingOmschrijving
      SELF.Q.AAPla3:VerpakkingOmschrijving_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.AAPla3:VerpakkingOmschrijving_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.AAPla3:VerpakkingOmschrijving_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.LOC:VerkoopPallets3_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for LOC:VerkoopPallets3
      SELF.Q.LOC:VerkoopPallets3_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.LOC:VerkoopPallets3_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.LOC:VerkoopPallets3_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.AAPla3:MutatieGemaakt_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for AAPla3:MutatieGemaakt
      SELF.Q.AAPla3:MutatieGemaakt_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.AAPla3:MutatieGemaakt_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.AAPla3:MutatieGemaakt_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.AAPla3:Geprint_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for AAPla3:Geprint
      SELF.Q.AAPla3:Geprint_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.AAPla3:Geprint_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.AAPla3:Geprint_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.AAPla3:Verwerkt_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for AAPla3:Verwerkt
      SELF.Q.AAPla3:Verwerkt_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.AAPla3:Verwerkt_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.AAPla3:Verwerkt_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.AAPla3:Gewogen_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for AAPla3:Gewogen
      SELF.Q.AAPla3:Gewogen_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.AAPla3:Gewogen_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.AAPla3:Gewogen_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.AAPla3:CelOms_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for AAPla3:CelOms
      SELF.Q.AAPla3:CelOms_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.AAPla3:CelOms_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.AAPla3:CelOms_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.LOC:Locatienaam3_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for LOC:Locatienaam3
      SELF.Q.LOC:Locatienaam3_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.LOC:Locatienaam3_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.LOC:Locatienaam3_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.AAPla3:LeverancierFirmaNaam_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for AAPla3:LeverancierFirmaNaam
      SELF.Q.AAPla3:LeverancierFirmaNaam_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.AAPla3:LeverancierFirmaNaam_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.AAPla3:LeverancierFirmaNaam_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.AAPla3:Transport_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for AAPla3:Transport
      SELF.Q.AAPla3:Transport_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.AAPla3:Transport_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.AAPla3:Transport_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.AAPla3:PlanningID_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for AAPla3:PlanningID
      SELF.Q.AAPla3:PlanningID_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.AAPla3:PlanningID_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.AAPla3:PlanningID_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      PUT(SELF.Q)
    END
  !----------------------------------------------------------------------


BRW1.Init PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)

  CODE
  PARENT.Init(ListBox,Posit,V,Q,RM,WM)
  IF WM.Request <> ViewRecord                              ! If called for anything other than ViewMode, make the insert, change & delete controls available
    SELF.InsertControl=?Insert:3
    SELF.ChangeControl=?Change:3
    SELF.DeleteControl=?Delete:3
  END
  SELF.ViewControl = ?View:2                               ! Setup the control used to initiate view only mode


BRW1.ResetSort PROCEDURE(BYTE Force)

ReturnValue          BYTE,AUTO

  CODE
  IF CHOICE(?CurrentTab) = 2
    RETURN SELF.SetSort(1,Force)
  ELSIF CHOICE(?CurrentTab) = 3
    RETURN SELF.SetSort(2,Force)
  ELSE
    RETURN SELF.SetSort(3,Force)
  END
  ReturnValue = PARENT.ResetSort(Force)
  RETURN ReturnValue


BRW1.SetQueueRecord PROCEDURE

  CODE
  LOC:Locatienaam3 = CachingClass.GetCelLocatieNaam(AAPla3:PartijID,AAPla3:CelID)
  
  IF AAPla3:MutatieGemaakt THEN
  	LOC:VerkoopKG3 = AAPla3:MutatieKG
  	LOC:VerkoopPallets3 = AAPla3:MutatiePallets
  ELSE
  	LOC:VerkoopKG3 = AAPla3:KG
  	LOC:VerkoopPallets3 = AAPla3:Pallets
  END
  PARENT.SetQueueRecord
  If SELF.Q.LOC:VerkoopKG3<0
  	Self.Q.LOC:VerkoopKG3_NormalFG   = Color:Red
  	Self.Q.LOC:VerkoopKG3_NormalBG   = Color:Red
  	Self.Q.LOC:VerkoopKG3_SelectedFG = Color:Red
  	Self.Q.LOC:VerkoopKG3_SelectedBG = Color:Red
  	Self.Q.LOC:VerkoopPallets3_NormalFG   = Color:Red
  	Self.Q.LOC:VerkoopPallets3_SelectedFG = Color:Red
  END
  
  IF (ACT:Uitgevoerd)
    SELF.Q.ACT:Uitgevoerd_Icon = 2                         ! Set icon from icon list
  ELSE
    SELF.Q.ACT:Uitgevoerd_Icon = 1                         ! Set icon from icon list
  END
  CLEAR (SELF.Q.AAPla3:Instructie_Tip)
  IF (AAPla3:MutatieGemaakt=1)
    SELF.Q.AAPla3:MutatieGemaakt_Icon = 2                  ! Set icon from icon list
  ELSE
    SELF.Q.AAPla3:MutatieGemaakt_Icon = 1                  ! Set icon from icon list
  END
  IF (AAPla3:Geprint)
    SELF.Q.AAPla3:Geprint_Icon = 2                         ! Set icon from icon list
  ELSE
    SELF.Q.AAPla3:Geprint_Icon = 1                         ! Set icon from icon list
  END
  IF (AAPla3:Verwerkt)
    SELF.Q.AAPla3:Verwerkt_Icon = 2                        ! Set icon from icon list
  ELSE
    SELF.Q.AAPla3:Verwerkt_Icon = 1                        ! Set icon from icon list
  END
  IF (AAPla3:Gewogen)
    SELF.Q.AAPla3:Gewogen_Icon = 2                         ! Set icon from icon list
  ELSE
    SELF.Q.AAPla3:Gewogen_Icon = 1                         ! Set icon from icon list
  END
  CLEAR (SELF.Q.AAPla3:Transport_Tip)
  CLEAR (SELF.Q.AAPla3:PlanningID_Tip)
  !----------------------------------------------------------------------
      SELF.Q.ACT:Datum_NormalFG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1) ! Set color values for ACT:Datum
      SELF.Q.ACT:Datum_NormalBG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,8454143)
      SELF.Q.ACT:Datum_SelectedFG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.ACT:Datum_SelectedBG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.ACT:Tijd_NormalFG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1) ! Set color values for ACT:Tijd
      SELF.Q.ACT:Tijd_NormalBG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,8454143)
      SELF.Q.ACT:Tijd_SelectedFG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.ACT:Tijd_SelectedBG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.ACT:Uitgevoerd_NormalFG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1) ! Set color values for ACT:Uitgevoerd
      SELF.Q.ACT:Uitgevoerd_NormalBG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,8454143)
      SELF.Q.ACT:Uitgevoerd_SelectedFG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.ACT:Uitgevoerd_SelectedBG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.ACT:Omschrijving_NormalFG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1) ! Set color values for ACT:Omschrijving
      SELF.Q.ACT:Omschrijving_NormalBG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,8454143)
      SELF.Q.ACT:Omschrijving_SelectedFG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.ACT:Omschrijving_SelectedBG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.AAPla3:ArtikelID_NormalFG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1) ! Set color values for AAPla3:ArtikelID
      SELF.Q.AAPla3:ArtikelID_NormalBG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,8454143)
      SELF.Q.AAPla3:ArtikelID_SelectedFG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.AAPla3:ArtikelID_SelectedBG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.AAPla3:ArtikelOms_NormalFG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1) ! Set color values for AAPla3:ArtikelOms
      SELF.Q.AAPla3:ArtikelOms_NormalBG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,8454143)
      SELF.Q.AAPla3:ArtikelOms_SelectedFG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.AAPla3:ArtikelOms_SelectedBG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.AAPla3:FirmaNaam_NormalFG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1) ! Set color values for AAPla3:FirmaNaam
      SELF.Q.AAPla3:FirmaNaam_NormalBG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,8454143)
      SELF.Q.AAPla3:FirmaNaam_SelectedFG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.AAPla3:FirmaNaam_SelectedBG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.AAPla3:PartijID_NormalFG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1) ! Set color values for AAPla3:PartijID
      SELF.Q.AAPla3:PartijID_NormalBG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,8454143)
      SELF.Q.AAPla3:PartijID_SelectedFG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.AAPla3:PartijID_SelectedBG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.AAPla3:ExternPartijnr_NormalFG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1) ! Set color values for AAPla3:ExternPartijnr
      SELF.Q.AAPla3:ExternPartijnr_NormalBG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,8454143)
      SELF.Q.AAPla3:ExternPartijnr_SelectedFG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.AAPla3:ExternPartijnr_SelectedBG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.LOC:VerkoopKG3_NormalFG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1) ! Set color values for LOC:VerkoopKG3
      SELF.Q.LOC:VerkoopKG3_NormalBG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,8454143)
      SELF.Q.LOC:VerkoopKG3_SelectedFG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.LOC:VerkoopKG3_SelectedBG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.AAPla3:Planning_TIME_NormalFG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1) ! Set color values for AAPla3:Planning_TIME
      SELF.Q.AAPla3:Planning_TIME_NormalBG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,8454143)
      SELF.Q.AAPla3:Planning_TIME_SelectedFG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.AAPla3:Planning_TIME_SelectedBG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.AAPla3:Planning_DATE_NormalFG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1) ! Set color values for AAPla3:Planning_DATE
      SELF.Q.AAPla3:Planning_DATE_NormalBG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,8454143)
      SELF.Q.AAPla3:Planning_DATE_SelectedFG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.AAPla3:Planning_DATE_SelectedBG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.AAPla3:Instructie_NormalFG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1) ! Set color values for AAPla3:Instructie
      SELF.Q.AAPla3:Instructie_NormalBG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,8454143)
      SELF.Q.AAPla3:Instructie_SelectedFG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.AAPla3:Instructie_SelectedBG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.AAPla3:VerpakkingOmschrijving_NormalFG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1) ! Set color values for AAPla3:VerpakkingOmschrijving
      SELF.Q.AAPla3:VerpakkingOmschrijving_NormalBG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,8454143)
      SELF.Q.AAPla3:VerpakkingOmschrijving_SelectedFG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.AAPla3:VerpakkingOmschrijving_SelectedBG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.LOC:VerkoopPallets3_NormalFG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1) ! Set color values for LOC:VerkoopPallets3
      SELF.Q.LOC:VerkoopPallets3_NormalBG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,8454143)
      SELF.Q.LOC:VerkoopPallets3_SelectedFG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.LOC:VerkoopPallets3_SelectedBG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.AAPla3:MutatieGemaakt_NormalFG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1) ! Set color values for AAPla3:MutatieGemaakt
      SELF.Q.AAPla3:MutatieGemaakt_NormalBG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,8454143)
      SELF.Q.AAPla3:MutatieGemaakt_SelectedFG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.AAPla3:MutatieGemaakt_SelectedBG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.AAPla3:Geprint_NormalFG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1) ! Set color values for AAPla3:Geprint
      SELF.Q.AAPla3:Geprint_NormalBG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,8454143)
      SELF.Q.AAPla3:Geprint_SelectedFG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.AAPla3:Geprint_SelectedBG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.AAPla3:Verwerkt_NormalFG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1) ! Set color values for AAPla3:Verwerkt
      SELF.Q.AAPla3:Verwerkt_NormalBG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,8454143)
      SELF.Q.AAPla3:Verwerkt_SelectedFG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.AAPla3:Verwerkt_SelectedBG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.AAPla3:Gewogen_NormalFG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1) ! Set color values for AAPla3:Gewogen
      SELF.Q.AAPla3:Gewogen_NormalBG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,8454143)
      SELF.Q.AAPla3:Gewogen_SelectedFG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.AAPla3:Gewogen_SelectedBG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.AAPla3:CelOms_NormalFG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1) ! Set color values for AAPla3:CelOms
      SELF.Q.AAPla3:CelOms_NormalBG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,8454143)
      SELF.Q.AAPla3:CelOms_SelectedFG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.AAPla3:CelOms_SelectedBG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.LOC:Locatienaam3_NormalFG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1) ! Set color values for LOC:Locatienaam3
      SELF.Q.LOC:Locatienaam3_NormalBG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,8454143)
      SELF.Q.LOC:Locatienaam3_SelectedFG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.LOC:Locatienaam3_SelectedBG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.AAPla3:LeverancierFirmaNaam_NormalFG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1) ! Set color values for AAPla3:LeverancierFirmaNaam
      SELF.Q.AAPla3:LeverancierFirmaNaam_NormalBG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,8454143)
      SELF.Q.AAPla3:LeverancierFirmaNaam_SelectedFG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.AAPla3:LeverancierFirmaNaam_SelectedBG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.AAPla3:Transport_NormalFG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1) ! Set color values for AAPla3:Transport
      SELF.Q.AAPla3:Transport_NormalBG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,8454143)
      SELF.Q.AAPla3:Transport_SelectedFG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.AAPla3:Transport_SelectedBG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.AAPla3:PlanningID_NormalFG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1) ! Set color values for AAPla3:PlanningID
      SELF.Q.AAPla3:PlanningID_NormalBG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,8454143)
      SELF.Q.AAPla3:PlanningID_SelectedFG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.AAPla3:PlanningID_SelectedBG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
  !----------------------------------------------------------------------


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window

!!! <summary>
!!! Generated from procedure template - Window
!!! Packlijst gegevens, uitbreiding van verkoop
!!! </summary>
UpdateVerkoopExport PROCEDURE 

CurrentTab           STRING(80)                            ! 
ActionMessage        CSTRING(40)                           ! 
Loc:TotaalQ          QUEUE,PRE(LTQ2)                       ! 
ArtikelID            CSTRING(31)                           ! 
ArtikelOms           STRING(60)                            ! 
KG                   DECIMAL(10,2)                         ! 
Pallet               LONG                                  ! 
Dozen                LONG                                  ! 
Aantal               LONG                                  ! 
GrossWeight          DECIMAL(8,3)                          ! 
GrossWeight_NFG      LONG                                  ! 
GrossWeight_NBG      LONG                                  ! 
GrossWeight_SFG      LONG                                  ! 
GrossWeight_SBG      LONG                                  ! 
VerkoopPrijs         DECIMAL(11,3)                         ! 
VerkoopPrijs_NFG     LONG                                  ! 
VerkoopPrijs_SFG     LONG                                  ! 
VerkoopPrijs_NBG     LONG                                  ! 
VerkoopPrijs_SBG     LONG                                  ! 
VerpakkingID         LONG                                  ! 
VerpakkingOmschrijving CSTRING(51)                         ! 
Bedrag               DECIMAL(11,2)                         ! 
PlantNumber          CSTRING(51)                           ! 
PlantNumber_NFG      LONG                                  ! 
PlantNumber_NBG      LONG                                  ! 
PlantNumber_SFG      LONG                                  ! 
PlantNumber_SBG      LONG                                  ! 
ProductieDatum       DATE                                  ! 
ProductieDatum_NFG   LONG                                  ! 
ProductieDatum_NBG   LONG                                  ! 
ProductieDatum_SFG   LONG                                  ! 
ProductieDatum_SBG   LONG                                  ! 
THTDatum             DATE                                  ! 
THTDatum_NFG         LONG                                  ! 
THTDatum_NBG         LONG                                  ! 
THTDatum_SFG         LONG                                  ! 
THTDatum_SBG         LONG                                  ! 
GNCode               CSTRING(100)                          ! 
GNCode_NFG           LONG                                  ! 
GNCode_NBG           LONG                                  ! 
GNCode_SFG           LONG                                  ! 
GNCode_SBG           LONG                                  ! 
                     END                                   ! 
Loc:PackLijstQ       QUEUE(PackLijstQ),PRE(LTQ)            ! 
                     END                                   ! 
Loc:TotaalDozen      LONG                                  ! 
Loc:TotaalKG         LONG                                  ! 
Loc:TotaalGrossWeight LONG                                 ! 
FDB4::View:FileDrop  VIEW(Havens)
                       PROJECT(Hav:Haven)
                     END
BRW9::View:Browse    VIEW(Planning)
                       PROJECT(Pla:KG)
                       PROJECT(Pla:AlternatieveArtikelOms)
                       PROJECT(Pla:VerkoopKGPrijs)
                       PROJECT(Pla:GrossWeight)
                       PROJECT(Pla:PlantNumber)
                       PROJECT(Pla:PlanningID)
                       PROJECT(Pla:VerkoopID)
                       PROJECT(Pla:ArtikelID)
                       JOIN(AAArt:Artikel_PK,Pla:ArtikelID)
                         PROJECT(AAArt:ArtikelID)
                       END
                     END
Queue:Browse         QUEUE                            !Queue declaration for browse/combo box using ?List
Pla:KG                 LIKE(Pla:KG)                   !List box control field - type derived from field
Pla:AlternatieveArtikelOms LIKE(Pla:AlternatieveArtikelOms) !List box control field - type derived from field
Pla:VerkoopKGPrijs     LIKE(Pla:VerkoopKGPrijs)       !List box control field - type derived from field
Pla:GrossWeight        LIKE(Pla:GrossWeight)          !List box control field - type derived from field
Pla:PlantNumber        LIKE(Pla:PlantNumber)          !List box control field - type derived from field
Pla:PlanningID         LIKE(Pla:PlanningID)           !Primary key field - type derived from field
Pla:VerkoopID          LIKE(Pla:VerkoopID)            !Browse key field - type derived from field
AAArt:ArtikelID        LIKE(AAArt:ArtikelID)          !Related join file key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
FDCB11::View:FileDropCombo VIEW(ViewBetcd)
                       PROJECT(BTC:Omschrijving)
                       PROJECT(BTC:betcdID)
                     END
Queue:FileDrop       QUEUE                            !
Hav:Haven              LIKE(Hav:Haven)                !List box control field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
Queue:FileDropCombo  QUEUE                            !
BTC:Omschrijving       LIKE(BTC:Omschrijving)         !List box control field - type derived from field
BTC:betcdID            LIKE(BTC:betcdID)              !Primary key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
LocEnableEnterByTab  BYTE(1)                               !Used by the ENTER Instead of Tab template
EnterByTabManager    EnterByTabClass
History::Ver2:Record LIKE(Ver2:RECORD),THREAD
NetLocalRefreshDate     Long     ! NetTalk (NetRefresh)
NetLocalRefreshTime     Long
NetLocalDependancies    String('|Verkoop|Havens|Planning|AAViewArtikel|ViewBetcd|')
QuickWindow          WINDOW('Form Verkoop'),AT(,,517,441),FONT('Microsoft Sans Serif',8,,FONT:regular,CHARSET:DEFAULT), |
  RESIZE,CENTER,GRAY,IMM,MDI,HLP('UpdateVerkoopExport'),SYSTEM
                       SHEET,AT(4,4,501,412),USE(?CurrentTab)
                         TAB('Export gegevens'),USE(?Tab:3)
                           PROMPT('Containernr:'),AT(8,25),USE(?Ver2:Containernr:Prompt),TRN
                           ENTRY(@s50),AT(112,25,204,10),USE(Ver2:Containernr)
                           PROMPT('Sealnr:'),AT(8,38),USE(?Ver2:Sealnr:Prompt),TRN
                           ENTRY(@s50),AT(112,38,204,10),USE(Ver2:Sealnr)
                           PROMPT('Vessel:'),AT(8,52),USE(?Ver2:Vessel:Prompt),TRN
                           ENTRY(@s50),AT(112,52,204,10),USE(Ver2:Vessel)
                           PROMPT('Tarra Container:'),AT(8,66),USE(?Ver2:TarraContainer:Prompt),TRN
                           ENTRY(@n-14),AT(112,66,64,10),USE(Ver2:TarraContainer),RIGHT(1)
                           PROMPT('Uitvoerhaven:'),AT(8,80),USE(?Ver2:Laadhaven:Prompt),TRN
                           LIST,AT(112,80,204,10),USE(Hav:Haven),DROP(5),FORMAT('200L(2)|M~Haven~L(0)@s50@'),FROM(Queue:FileDrop)
                           PROMPT('Bestemming:'),AT(8,94),USE(?Ver2:Loshaven:Prompt),TRN
                           ENTRY(@s50),AT(112,94,204,10),USE(Ver2:Loshaven)
                           PROMPT('Boekingsnr:'),AT(8,108),USE(?Ver2:Boekingsnr:Prompt),TRN
                           ENTRY(@s50),AT(112,108,204,10),USE(Ver2:Boekingsnr)
                           PROMPT('Aan:'),AT(8,121),USE(?Ver2:Aan:Prompt)
                           ENTRY(@s50),AT(112,121,204,10),USE(Ver2:Aan)
                           PROMPT('BESC/Waiver:'),AT(8,134),USE(?Ver2:BESCWaiver:Prompt)
                           LIST,AT(112,135,204,10),USE(Ver2:BESCWaiver),DROP(2),FROM('N.V.T.|Ja')
                           PROMPT('Expresse Release:'),AT(8,150),USE(?Ver2:ExpresseRelease:Prompt)
                           LIST,AT(112,150,204,10),USE(Ver2:ExpresseRelease),LEFT(1),DROP(5),FROM('JA|#1|Draft mai' & |
  'len|#2|Telex release|#3')
                           COMBO(@s30),AT(112,164,204,10),USE(BTC:Omschrijving),DROP(25),FORMAT('120L(2)|M~Omschri' & |
  'jving~L(0)@s30@'),FROM(Queue:FileDropCombo),IMM
                           PROMPT('Paymentcondition:'),AT(8,163),USE(?PROMPT1)
                           PROMPT('Pro Forma Memo:'),AT(8,178),USE(?Ver2:ProFormaMemo:Prompt),TRN
                           TEXT,AT(112,178,231,62),USE(Ver2:ProFormaMemo,,?Ver2:ProFormaMemo:2)
                           PROMPT('Omschrijving Goederen:'),AT(8,249),USE(?Ver2:OmschrijvingGoederen:Prompt)
                           TEXT,AT(112,246,231),USE(Ver2:OmschrijvingGoederen,,?Ver2:OmschrijvingGoederen:2)
                           SHEET,AT(14,303,479,106),USE(?Regels)
                             TAB('Gecumuleerd'),USE(?TAB1)
                               LIST,AT(18,325,461,74),USE(?List1),FORMAT('34R(2)|M~KG~C(0)@n-14@#3#121L(2)|M~Artikel O' & |
  'ms~C(0)@s60@#2#55R(2)|M*~Verkoop Prijs~C(2)@n-15.3@#12#44R(2)|M*~Gross Weight~C(2)@n' & |
  '-11.3@#7#50L(2)|M*~Plant Number~C(0)@s50@#20#40L(2)|M*~Productie~C(0)@d17@#25#40L(2)' & |
  '|M*~THT~C(0)@d17@#30#53L(2)|M*~GNCodes~C(0)@s99@#35#'),FROM(Loc:TotaalQ)
                             END
                             TAB('Regels'),USE(?TAB2)
                               LIST,AT(15,319,469,69),USE(?List),FORMAT('42R(2)|M~KG~@n-13@128L(2)|M~Alternatieve Arti' & |
  'kel Oms~C(0)@s200@56R(2)|M~Verkoop KGP rijs~D(12)@n-13`3@48R(2)|M~Gross Weight~D(12)' & |
  '@n-11.3@200R(2)|M~Plant Number~D(0)@s50@'),FROM(Queue:Browse),IMM
                               BUTTON('&Insert'),AT(359,392,42,12),USE(?Insert),DISABLE,HIDE
                               BUTTON('&Change'),AT(402,392,42,12),USE(?Change)
                               BUTTON('&Delete'),AT(443,392,42,12),USE(?Delete),DISABLE,HIDE
                             END
                           END
                           BUTTON('Lees Vak6 CMR'),AT(347,247),USE(?CMR)
                           BUTTON('Tel totalen'),AT(347,265,67,14),USE(?TelTotalen)
                         END
                       END
                       BUTTON('&OK'),AT(401,420,49,14),USE(?OK),LEFT,ICON('WAOK.ICO'),DEFAULT,FLAT,MSG('Accept dat' & |
  'a and close the window'),TIP('Accept data and close the window')
                       BUTTON('&Cancel'),AT(453,420,49,14),USE(?Cancel),LEFT,ICON('WACANCEL.ICO'),FLAT,MSG('Cancel operation'), |
  TIP('Cancel operation')
                     END

    omit('***',WE::CantCloseNowSetHereDone=1)  !Getting Nested omit compile error, then uncheck the "Check for duplicate CantCloseNowSetHere variable declaration" in the WinEvent local template
WE::CantCloseNowSetHereDone equate(1)
WE::CantCloseNowSetHere     long
    !***
ThisWindow           CLASS(WindowManager)
Ask                    PROCEDURE(),DERIVED
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
PrimeUpdate            PROCEDURE(),BYTE,PROC,DERIVED
Reset                  PROCEDURE(BYTE Force=0),DERIVED
Run                    PROCEDURE(),BYTE,PROC,DERIVED
Run                    PROCEDURE(USHORT Number,BYTE Request),BYTE,PROC,DERIVED
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED
TakeCompleted          PROCEDURE(),BYTE,PROC,DERIVED
TakeEvent              PROCEDURE(),BYTE,PROC,DERIVED
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
Resizer              CLASS(WindowResizeClass)
Init                   PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)
                     END

FDB4                 CLASS(FileDropClass)                  ! File drop manager
Q                      &Queue:FileDrop                !Reference to display queue
                     END

BRW9                 CLASS(BrowseClass)                    ! Browse using ?List
Q                      &Queue:Browse                  !Reference to browse queue
Init                   PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)
SetAlerts              PROCEDURE(),DERIVED
                     END

BRW9::Sort0:Locator  StepLocatorClass                      ! Default Locator
FDCB11               CLASS(FileDropComboClass)             ! File drop combo manager
Q                      &Queue:FileDropCombo           !Reference to browse queue type
                     END

CurCtrlFeq          LONG
FieldColorQueue     QUEUE
Feq                   LONG
OldColor              LONG
                    END
PackLijstClass      ClassPackLijst
LocalClass          CLASS
VulQ                    PROCEDURE()
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

ThisWindow.Ask PROCEDURE

  CODE
  CASE SELF.Request                                        ! Configure the action message text
  OF ViewRecord
    ActionMessage = 'View Record'
  OF InsertRecord
    GlobalErrors.Throw(Msg:InsertIllegal)
    RETURN
  OF ChangeRecord
    ActionMessage = 'Record Will Be Changed'
  OF DeleteRecord
    GlobalErrors.Throw(Msg:DeleteIllegal)
    RETURN
  END
  QuickWindow{PROP:Text} = ActionMessage                   ! Display status message in title bar
  PARENT.Ask


ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('UpdateVerkoopExport')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Ver2:Containernr:Prompt
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('Pla:PlanningID',Pla:PlanningID)                    ! Added by: BrowseBox(ABC)
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.HistoryKey = CtrlH
  SELF.AddHistoryFile(Ver2:Record,History::Ver2:Record)
  SELF.AddHistoryField(?Ver2:Containernr,33)
  SELF.AddHistoryField(?Ver2:Sealnr,34)
  SELF.AddHistoryField(?Ver2:Vessel,35)
  SELF.AddHistoryField(?Ver2:TarraContainer,37)
  SELF.AddHistoryField(?Ver2:Loshaven,39)
  SELF.AddHistoryField(?Ver2:Boekingsnr,40)
  SELF.AddHistoryField(?Ver2:Aan,43)
  SELF.AddHistoryField(?Ver2:BESCWaiver,41)
  SELF.AddHistoryField(?Ver2:ExpresseRelease,42)
  SELF.AddHistoryField(?Ver2:ProFormaMemo:2,36)
  SELF.AddHistoryField(?Ver2:OmschrijvingGoederen:2,44)
  SELF.AddUpdateFile(Access:Verkoop)
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  Relate:AAARelatie.Open                                   ! File AAARelatie used by this procedure, so make sure it's RelationManager is open
  Relate:CMR.Open                                          ! File CMR used by this procedure, so make sure it's RelationManager is open
  Relate:Havens.Open                                       ! File Havens used by this procedure, so make sure it's RelationManager is open
  Relate:Planning.SetOpenRelated()
  Relate:Planning.Open                                     ! File Planning used by this procedure, so make sure it's RelationManager is open
  Relate:ViewBetcd.Open                                    ! File ViewBetcd used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Primary &= Relate:Verkoop
  IF SELF.Request = ViewRecord AND NOT SELF.BatchProcessing ! Setup actions for ViewOnly Mode
    SELF.InsertAction = Insert:None
    SELF.DeleteAction = Delete:None
    SELF.ChangeAction = Change:None
    SELF.CancelAction = Cancel:Cancel
    SELF.OkControl = 0
  ELSE
    SELF.InsertAction = Insert:None                        ! Inserts not allowed
    SELF.DeleteAction = Delete:None                        ! Deletes not allowed
    SELF.ChangeAction = Change:Caller                      ! Changes allowed
    SELF.CancelAction = Cancel:Cancel+Cancel:Query         ! Confirm cancel
    SELF.OkControl = ?OK
    IF SELF.PrimeUpdate() THEN RETURN Level:Notify.
  END
  BRW9.Init(?List,Queue:Browse.ViewPosition,BRW9::View:Browse,Queue:Browse,Relate:Planning,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  LocalClass.VulQ()
  
  IF NULL(Ver2:PaymentCondition)
      ! initieel van de ralatie overnemen
      Ver2:PaymentCondition=AAARel:PaymentCondition
  END
  
  
  Clear(CMR:Record)
  CMR:VerkoopID=Ver2:VerkoopID
  Set(CMR:CMR_FK1,CMR:CMR_FK1)
  IF Access:CMR.Next()=Level:Benign AND CMR:VerkoopID=Ver2:VerkoopID
      ?CMR{Prop:Hide}=FALSE
  ELSE
      ?CMR{Prop:Hide}=TRUE
  END
  
  WinAlertMouseZoom()
  Do DefineListboxStyle
  IF SELF.Request = ViewRecord                             ! Configure controls for View Only mode
    ?Ver2:Containernr{PROP:ReadOnly} = True
    ?Ver2:Sealnr{PROP:ReadOnly} = True
    ?Ver2:Vessel{PROP:ReadOnly} = True
    ?Ver2:TarraContainer{PROP:ReadOnly} = True
    DISABLE(?Hav:Haven)
    ?Ver2:Loshaven{PROP:ReadOnly} = True
    ?Ver2:Boekingsnr{PROP:ReadOnly} = True
    ?Ver2:Aan{PROP:ReadOnly} = True
    DISABLE(?Ver2:BESCWaiver)
    DISABLE(?Ver2:ExpresseRelease)
    DISABLE(?BTC:Omschrijving)
    DISABLE(?Insert)
    DISABLE(?Change)
    DISABLE(?Delete)
    DISABLE(?CMR)
    DISABLE(?TelTotalen)
  END
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  BRW9.Q &= Queue:Browse
  BRW9.FileLoaded = 1                                      ! This is a 'file loaded' browse
  BRW9.AddSortOrder(,Pla:Planning_FK02)                    ! Add the sort order for Pla:Planning_FK02 for sort order 1
  BRW9.AddRange(Pla:VerkoopID,Ver2:VerkoopID)              ! Add single value range limit for sort order 1
  BRW9.AddLocator(BRW9::Sort0:Locator)                     ! Browse has a locator for sort order 1
  BRW9::Sort0:Locator.Init(,Pla:PlanningID,,BRW9)          ! Initialize the browse locator using  using key: Pla:Planning_FK02 , Pla:PlanningID
  BRW9.AddField(Pla:KG,BRW9.Q.Pla:KG)                      ! Field Pla:KG is a hot field or requires assignment from browse
  BRW9.AddField(Pla:AlternatieveArtikelOms,BRW9.Q.Pla:AlternatieveArtikelOms) ! Field Pla:AlternatieveArtikelOms is a hot field or requires assignment from browse
  BRW9.AddField(Pla:VerkoopKGPrijs,BRW9.Q.Pla:VerkoopKGPrijs) ! Field Pla:VerkoopKGPrijs is a hot field or requires assignment from browse
  BRW9.AddField(Pla:GrossWeight,BRW9.Q.Pla:GrossWeight)    ! Field Pla:GrossWeight is a hot field or requires assignment from browse
  BRW9.AddField(Pla:PlantNumber,BRW9.Q.Pla:PlantNumber)    ! Field Pla:PlantNumber is a hot field or requires assignment from browse
  BRW9.AddField(Pla:PlanningID,BRW9.Q.Pla:PlanningID)      ! Field Pla:PlanningID is a hot field or requires assignment from browse
  BRW9.AddField(Pla:VerkoopID,BRW9.Q.Pla:VerkoopID)        ! Field Pla:VerkoopID is a hot field or requires assignment from browse
  BRW9.AddField(AAArt:ArtikelID,BRW9.Q.AAArt:ArtikelID)    ! Field AAArt:ArtikelID is a hot field or requires assignment from browse
  INIMgr.Fetch('UpdateVerkoopExport',QuickWindow)          ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  FDB4.Init(?Hav:Haven,Queue:FileDrop.ViewPosition,FDB4::View:FileDrop,Queue:FileDrop,Relate:Havens,ThisWindow)
  FDB4.Q &= Queue:FileDrop
  FDB4.AddSortOrder(Hav:Haven_PK)
  FDB4.AddField(Hav:Haven,FDB4.Q.Hav:Haven) !List box control field - type derived from field
  FDB4.AddUpdateField(Hav:Haven,Ver2:Laadhaven)
  ThisWindow.AddItem(FDB4.WindowComponent)
  FDB4.DefaultFill = 0
  BRW9.AskProcedure = 1                                    ! Will call: UpdatePlanningVerkoop
  FDCB11.Init(BTC:Omschrijving,?BTC:Omschrijving,Queue:FileDropCombo.ViewPosition,FDCB11::View:FileDropCombo,Queue:FileDropCombo,Relate:ViewBetcd,ThisWindow,GlobalErrors,0,1,0)
  FDCB11.Q &= Queue:FileDropCombo
  FDCB11.AddSortOrder(BTC:ViewBetcd_PK)
  FDCB11.AddField(BTC:Omschrijving,FDCB11.Q.BTC:Omschrijving) !List box control field - type derived from field
  FDCB11.AddField(BTC:betcdID,FDCB11.Q.BTC:betcdID) !Primary key field - type derived from field
  FDCB11.AddUpdateField(BTC:betcdID,Ver2:PaymentCondition)
  ThisWindow.AddItem(FDCB11.WindowComponent)
  FDCB11.DefaultFill = 0
  BRW9.AddToolbarTarget(Toolbar)                           ! Browse accepts toolbar control
  SELF.SetAlerts()
  NetLocalRefreshDate = today()         ! NetTalk (NetRefresh)
  NetLocalRefreshTime = clock()
  EnterByTabManager.ExcludeControl(?Cancel)
  EnterByTabManager.ExcludeControl(?OK)
  EnterByTabManager.Init(False)
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:AAARelatie.Close
    Relate:CMR.Close
    Relate:Havens.Close
    Relate:Planning.Close
    Relate:ViewBetcd.Close
  END
  IF SELF.Opened
    INIMgr.Update('UpdateVerkoopExport',QuickWindow)       ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.PrimeUpdate PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.PrimeUpdate()
    If returnValue = Level:Fatal  ! delete just occured
      ThisNetRefresh.Send('|Verkoop|Havens|Planning|Planning|ViewBetcd|') ! NetTalk (NetRefresh)
    End
  RETURN ReturnValue


ThisWindow.Reset PROCEDURE(BYTE Force=0)

  CODE
  SELF.ForcedReset += Force
  IF QuickWindow{Prop:AcceptAll} THEN RETURN.
    NetLocalRefreshDate = today()         ! NetTalk (NetRefresh)
    NetLocalRefreshTime = clock()
  PARENT.Reset(Force)


ThisWindow.Run PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Run()
  IF SELF.Request = ViewRecord                             ! In View Only mode always signal RequestCancelled
    ReturnValue = RequestCancelled
  END
  RETURN ReturnValue


ThisWindow.Run PROCEDURE(USHORT Number,BYTE Request)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Run(Number,Request)
  IF SELF.Request = ViewRecord
    ReturnValue = RequestCancelled                         ! Always return RequestCancelled if the form was opened in ViewRecord mode
  ELSE
    GlobalRequest = Request
    UpdatePlanningVerkoop
    ReturnValue = GlobalResponse
  END
  LocalClass.VulQ()
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
    OF ?CMR
      ThisWindow.Update()
      Clear(CMR:Record)
      CMR:VerkoopID=Ver2:VerkoopID
      Set(CMR:CMR_FK1,CMR:CMR_FK1)
      IF Access:CMR.Next()=Level:Benign AND CMR:VerkoopID=Ver2:VerkoopID
          Ver2:OmschrijvingGoederen=CMR:Artikel
          Display(?Ver2:OmschrijvingGoederen:2)
      ELSE
          Message('CMR kon niet gevonden worden voor verkoop: '&Ver2:VerkoopID,'CMR ophalen', ICON:Cross)
      END
      
    OF ?TelTotalen
      ThisWindow.Update()
      Ver2:OmschrijvingGoederen='Gross weight:<9>'&Loc:TotaalGrossWeight&'<13,10>'&|
          'Net weight:<9>'&Loc:TotaalKG&'<13,10>'
      IF Loc:TotaalDozen<>0
          Ver2:OmschrijvingGoederen=CLIP(Ver2:OmschrijvingGoederen)&'Cartons:<9><9>'&Loc:TotaalDozen  
      END
      DISPLAY(?Ver2:OmschrijvingGoederen:2)
    OF ?OK
      ThisWindow.Update()
      IF SELF.Request = ViewRecord AND NOT SELF.BatchProcessing THEN
         POST(EVENT:CloseWindow)
      END
    END
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue


ThisWindow.TakeCompleted PROCEDURE

ReturnValue          BYTE,AUTO

Looped BYTE
  CODE
  LOOP
    IF Looped
      RETURN Level:Notify
    ELSE
      Looped = 1
    END
  ReturnValue = PARENT.TakeCompleted()
    ThisNetRefresh.Send('|Verkoop|Havens|Planning|Planning|ViewBetcd|') ! NetTalk (NetRefresh)
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

LocalClass.VulQ     PROCEDURE()

CODE
   
    Free(Loc:PackLijstQ)
    PackLijstClass.VulPackLijstQ(Ver2:VerkoopID, Loc:PackLijstQ)
    FREE(Loc:TotaalQ)
!Clear(Loc:GNCodes)
    Loop i#=1 TO Records(Loc:PackLijstQ)
        GET(Loc:PackLijstQ,i#)
        Loc:TotaalQ :=: Loc:PackLijstQ
        LTQ2:VerkoopPrijs_NFG=COLOR:None
        LTQ2:VerkoopPrijs_SFG=CHOOSE(LTQ2:VerkoopPrijs=0,COLOR:Red,Color:None)
        LTQ2:VerkoopPrijs_NBG=CHOOSE(LTQ2:VerkoopPrijs=0,COLOR:Red,Color:None)
        LTQ2:VerkoopPrijs_SBG=Color:None
        LTQ2:GrossWeight_NFG=COLOR:None
        LTQ2:GrossWeight_NBG=CHOOSE(LTQ2:GrossWeight<LTQ2:KG,COLOR:Red,Color:None)
        LTQ2:GrossWeight_SFG=CHOOSE(LTQ2:GrossWeight<LTQ2:KG,COLOR:Red,Color:None)
        LTQ2:GrossWeight_SBG=Color:None
        LTQ2:GNCode_NFG=COLOR:None
        LTQ2:GNCode_NBG=CHOOSE(LTQ2:GNCode='',COLOR:Red,Color:None)
        LTQ2:GNCode_SFG=CHOOSE(LTQ2:GNCode='',COLOR:Red,Color:None)
        LTQ2:GNCode_SBG=Color:None
        LTQ2:PlantNumber_NFG=COLOR:None
        LTQ2:PlantNumber_NBG=CHOOSE(LTQ2:PlantNumber='',COLOR:Red,Color:None)
        LTQ2:PlantNumber_SFG=CHOOSE(LTQ2:PlantNumber='',COLOR:Red,Color:None)
        LTQ2:PlantNumber_SBG=Color:None
        LTQ2:ProductieDatum_NFG=COLOR:None
        LTQ2:ProductieDatum_NBG=CHOOSE(LTQ2:ProductieDatum=0,COLOR:Red,Color:None)
        LTQ2:ProductieDatum_SFG=CHOOSE(LTQ2:ProductieDatum=0,COLOR:Red,Color:None)
        LTQ2:ProductieDatum_SBG=Color:None
        LTQ2:THTDatum_NFG=COLOR:None
        LTQ2:THTDatum_NBG=CHOOSE(LTQ2:THTDatum=0,COLOR:Red,Color:None)
        LTQ2:THTDatum_SFG=CHOOSE(LTQ2:THTDatum=0,COLOR:Red,Color:None)
        LTQ2:THTDatum_SBG=Color:None
!    IF Loc:GNCodes=''
!        Loc:GNCodes=LTQ:GNCode
!    ELSIF NOT Instring(LTQ:GNCode,Loc:GNCodes,1,1)
!        Loc:GNCodes=CLIP(Loc:GNCodes)&', '&LTQ:GNCode
!    END
        Add(Loc:TotaalQ)
    Loc:TotaalDozen+=LTQ:Dozen
    Loc:TotaalKG+=LTQ:KG
    Loc:TotaalGrossWeight+=LTQ:GrossWeight
!    Loc:TotaalBedrag+=LTQ:KG*LTQ:VerkoopPrijs
    END
    RETURN
        

Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window


BRW9.Init PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)

  CODE
  PARENT.Init(ListBox,Posit,V,Q,RM,WM)
  IF WM.Request <> ViewRecord                              ! If called for anything other than ViewMode, make the insert, change & delete controls available
    SELF.InsertControl=?Insert
    SELF.ChangeControl=?Change
    SELF.DeleteControl=?Delete
  END


BRW9.SetAlerts PROCEDURE

  CODE
  SELF.EditViaPopup = False
  PARENT.SetAlerts

