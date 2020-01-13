
  OMIT('_EndOfInclude_',_GebruikerLogClass_Def)
_GebruikerLogClass_Def  EQUATE(1)

!--------------------------------------------------------------------
! APPLICATION:  VoorrDct.APP   
! PROCEDURE:    GebruikerLogClassSource
! INC file:     GebruikerLogClassDef.inc
!--------------------------------------------------------------------

!--------------------------------------------------------------------
! GebruikerLogClass
!--------------------------------------------------------------------
GebruikerLogClass    CLASS
Log PROCEDURE(STRING PRM:Handeling, STRING PRM:Tabel, STRING PRM:RecordInhoudPre, <STRING PRM:RecordInhoudPost>)
BepaalRecordContent PROCEDURE(*GROUP RecordContent), STRING
CleanString PROCEDURE(STRING PRM:String), STRING
                     END ! CLASS: GebruikerLogClass


_EndOfInclude_
