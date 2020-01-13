
  OMIT('_EndOfInclude_',_ExcelExportClass_Def)
_ExcelExportClass_Def  EQUATE(1)

!--------------------------------------------------------------------
! APPLICATION:  SpecDct.APP   
! PROCEDURE:    ExcelExportClass
! INC file:     ExcelExportClassDef.inc
!--------------------------------------------------------------------

!--------------------------------------------------------------------
! ExcelExportClass
!--------------------------------------------------------------------
ExcelExportClass     CLASS,TYPE
OleID                   LONG
Row                     LONG
Column                  LONG
BoldMode				BYTE

Init                    PROCEDURE(), LONG
CreateNew				PROCEDURE(STRING PRM:SheetName, <STRING PRM:Sjabloon>)
Open                    PROCEDURE(STRING PRM:Bestandsnaam)
OpenSjabloon            PROCEDURE(STRING PRM:Bestandsnaam)
Finish                  PROCEDURE()
AutoFit             	PROCEDURE(LONG PRM:VanColumn = 1, LONG PRM:TMColumn)
SetRowHeight			PROCEDURE(LONG PRM:VanRow = 1, LONG PRM:TMRow, LONG PRM:Height)

SetCurrentSheetName     PROCEDURE(STRING PRM:SheetName)
AddSheet                PROCEDURE(STRING PRM:SheetName)
SelectSheet             PROCEDURE(STRING PRM:SheetName)
DeleteSheet         	PROCEDURE(STRING PRM:SheetName)

DeleteColumns			PROCEDURE(LONG PRM:VanColumn, <LONG PRM:TMColumn>)

PrintString             PROCEDURE(STRING PRM:String)
PrintNumber             PROCEDURE(LONG PRM:Number)
PrintDate				PROCEDURE(DATE PRM:Date)
MakeBold				PROCEDURE()
NextRow                 PROCEDURE()

BepaalExcelColumn		PROCEDURE(<LONG PRM:Column>), STRING
BepaalExcelLocatie		PROCEDURE(<LONG PRM:Column>, <LONG PRM:Row>), STRING
                     END ! CLASS: ExcelExportClass


_EndOfInclude_
