!--------------------------------------------------------------------
! APPLICATION:  SpecDct.APP   
! PROCEDURE:    ExcelExportClass
! INC file:     ExcelExportClassSrc.inc
!--------------------------------------------------------------------

ExcelExportClass.Init       PROCEDURE()
CODE
	SELF.OleID  = Create(0,Create:Ole)
    SELF.OleID{Prop:Create}='Excel.Application'
    SELF.OleID{Prop:ReportException}=True !  dwz fouten worden niet genegeerd

    SELF.OleID{Prop:DoVerb}=1 !  dit doet iedereen dus ik ook
    SELF.OleID{'Application.WindowState'}=1 !  maximaliseer scherm
	SELF.OleID{'Application.Visible'}=False ! nu pas excel laten zien
	
	SELF.Row = 1
	SELF.Column = 1
	
	RETURN SELF.OleID
ExcelExportClass.Finish       PROCEDURE()
CODE
	SELF.OleID{'Application.Visible'} = true ! Nu pas Excel laten zien
ExcelExportClass.CreateNew PROCEDURE(STRING PRM:SheetName, <STRING PRM:Sjabloon>)
CODE
	IF OMITTED(3)THEN
		SELF.OleID{'Application.Workbooks.Add'}            ! leeg worksheet openen
        SELF.SetCurrentSheetName(PRM:SheetName)
        !SELF.OleID{'ActiveWorkbook.Worksheets(' & PRM:SheetName & ').EnableCalculation = False'}
		!Loc:Ole{'ActiveWorkbook.SaveAs("'&Loc:Bestandsnaam&'")'}
	ELSE
	   MESSAGE('Sjabloon nog niet ondersteund')
       !MyWordDoc = ExcelExportClass.OleID{'Application.Workbooks.Add("'&PRM:Sjabloon&'")'}   !  Sjabloon opnemen
       !ExcelExportClass.OleID{'ActiveWorkbook.SaveAs("'&Loc:Bestandsnaam&'")'}
	.
ExcelExportClass.AutoFit PROCEDURE(LONG PRM:VanColumn, LONG PRM:TMColumn)
CODE
	db.DebugOut('ExcelExportClass.AutoFit(' & PRM:VanColumn & ', ' & PRM:TMColumn & ') = Application.Columns('&SELF.BepaalExcelColumn(PRM:VanColumn)&':'&SELF.BepaalExcelColumn(PRM:TMColumn)&').AutoFit')
	SELF.OleID{'Application.Columns('&SELF.BepaalExcelColumn(PRM:VanColumn)&':'&SELF.BepaalExcelColumn(PRM:TMColumn)&').AutoFit'}
ExcelExportClass.SetRowHeight PROCEDURE(LONG PRM:VanRow = 1, LONG PRM:TMRow, LONG PRM:Height)
CODE
	SELF.OleID{'ActiveSheet.Rows('&PRM:VanRow & ':' & PRM:TMRow & ').RowHeight'} = PRM:Height
ExcelExportClass.SetCurrentSheetName PROCEDURE(STRING PRM:SheetName)
CODE
    SELF.OleID{'Application.ActiveWorkBook.ActiveSheet.Name'}=PRM:SheetName
ExcelExportClass.SelectSheet        PROCEDURE(STRING PRM:SheetName)
CODE
	SELF.OleID{'Application.ActiveWorkBook.Sheets(' & CLIP(PRM:SheetName) & ').Select'}
ExcelExportClass.AddSheet   PROCEDURE(STRING PRM:SheetName)
CODE
	SELF.OleID{'Application.ActiveWorkBook.Sheets.Add'}
	SELF.OleID{'Application.ActiveWorkBook.ActiveSheet.Name'}=PRM:SheetName
ExcelExportClass.DeleteSheet PROCEDURE(STRING PRM:SheetName)
CODE
	SELF.OleID{'Application.DisplayAlerts'} = false
	SELF.OleID{'Application.ActiveWorkBook.Sheets(' & CLIP(PRM:SheetName) & ').Delete'}
	SELF.OleID{'Application.DisplayAlerts'} = true
ExcelExportClass.DeleteColumns PROCEDURE(LONG PRM:VanColumn, <LONG PRM:TMColumn>)
CODE
	IF OMITTED(3) THEN
		! Slecht 1 kolom
		SELF.OleID{'Application.Columns("' & CLIP(SELF.BepaalExcelColumn(PRM:VanColumn)) & ':' & CLIP(SELF.BepaalExcelColumn(PRM:VanColumn)) & '").Delete Shift:=xlToLeft'}
	ELSE
		SELF.OleID{'Application.Columns("' & CLIP(SELF.BepaalExcelColumn(PRM:VanColumn)) & ':' & CLIP(SELF.BepaalExcelColumn(PRM:TMColumn)) & '").Delete Shift:=xlToLeft'}
	END
    !SELF.OleID{'Selection.Delete Shift:=xlToLeft'}
ExcelExportClass.Open  PROCEDURE(STRING PRM:Bestandnaam)
CODE
	SELF.OleID{'Application.Workbooks.Open ("'&PRM:Bestandnaam&'")'}
ExcelExportClass.OpenSjabloon  PROCEDURE(STRING PRM:Bestandnaam)
CODE
	SELF.OleID{'Application.Workbooks.Add ("'&PRM:Bestandnaam&'")'}
ExcelExportClass.PrintString      PROCEDURE(STRING PRM:String)
CODE
	SELF.MakeBold()
	!SELF.OleID{'Application.Range('&SELF.BepaalExcelLocatie()&').Value'} = CLIP(PRM:String)
	SELF.OleID{'Application.Cells('&SELF.Row&', '&SELF.Column&').Value'} = CLIP(PRM:String)
	SELF.Column += 1
ExcelExportClass.PrintNumber      PROCEDURE(LONG PRM:Number)
CODE
	SELF.MakeBold()
	!SELF.OleID{'Application.Range('&SELF.BepaalExcelLocatie()&').Value'} = CLIP(PRM:Number)
	SELF.OleID{'Application.Cells('&SELF.Row&', '&SELF.Column&').Value'} = CLIP(PRM:Number)	
	SELF.Column += 1
ExcelExportClass.PrintDate      PROCEDURE(DATE PRM:Date)
CODE
	SELF.MakeBold()
	!SELF.OleID{'Application.Range('&SELF.BepaalExcelLocatie()&').Value'} = FORMAT(PRM:Date, '@d6-')
	SELF.OleID{'Application.Cells('&SELF.Row&', '&SELF.Column&').Value'} = FORMAT(PRM:Date, '@d6-')
	SELF.Column += 1
ExcelExportClass.NextRow      PROCEDURE()
CODE
	SELF.Row += 1
	SELF.Column = 1
ExcelExportClass.MakeBold   PROCEDURE()
CODE
	IF SELF.BoldMode
		!SELF.OleID{'Application.Range(' & SELF.BepaalExcelLocatie() & ').Font.Bold'} = TRUE
		SELF.OleID{'Application.Cells('&SELF.Row&', '&SELF.Column&').Font.Bold'} = TRUE
	END
ExcelExportClass.BepaalExcelColumn   PROCEDURE(<LONG PRM:Column>)
Column                                  LONG

KolomMod                                LONG
KolomMod2                               LONG
KolomDiv                                LONG
KolomDivString							CSTRING(3)
CODE
	IF OMITTED(2) THEN
		Column = SELF.Column
	ELSE
		Column = PRM:Column
	END

	KolomMod = (Column - 1) % 26
	KolomDiv = INT((Column - 1) / 26)
	
	IF KolomDiv > 0 THEN
		IF KolomDiv <= 26
			! 2 letters (bv. AA)
			KolomDivString = CHR(VAL('A') + (KolomDiv - 1))
		ELSE
			! 3 letters (bv. AAA)
			KolomMod2 = (KolomDiv - 1) % 26
			KolomDiv = INT((KolomDiv - 1) / 26)
			
			KolomDivString = CHR(VAL('A') + (KolomDiv - 1)) & CHR(VAL('A') + KolomMod2)
		END
	ELSE
		KolomDivString = ''
	END
	
	RETURN KolomDivString & CHR(VAL('A') + KolomMod)
ExcelExportClass.BepaalExcelLocatie PROCEDURE(<LONG PRM:Column>, <LONG PRM:Row>)
Column                                  LONG
Row										LONG
CODE
	IF OMITTED(2) THEN
		Column = SELF.Column
	ELSE
		Column = PRM:Column
	END
	
	IF OMITTED(3) THEN
		Row = SELF.Row
	ELSE
		Row = PRM:Row
	END
	
	RETURN CLIP(SELF.BepaalExcelColumn(Column)) & Row
