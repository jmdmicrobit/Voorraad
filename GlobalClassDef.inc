
  OMIT('_EndOfInclude_',_GlobalClass_Def)
_GlobalClass_Def  EQUATE(1)

!--------------------------------------------------------------------
! APPLICATION:  VoorrDct.APP   
! PROCEDURE:    GlobalClassSource
! INC file:     GlobalClassDef.inc
!--------------------------------------------------------------------

!--------------------------------------------------------------------
! GlobalClass
!--------------------------------------------------------------------
GlobalClass          CLASS
InitWordOle			Procedure()
OpenWord            Procedure(String)				
MaakWord     		Procedure(String)
InitExcelOle		Procedure()
OpenExcel           Procedure()
MaakExcel       	Procedure(String)
InitMailOle     	Procedure()
DataSource          Procedure(String),String
RefreshTiming       Procedure()
CMRArtikelOms       Procedure(Long, String), String
ReplaceKG           Procedure(String), String
                     END ! CLASS: GlobalClass


_EndOfInclude_
