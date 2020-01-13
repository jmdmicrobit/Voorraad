
  OMIT('_EndOfInclude_',_CachingClass_Def)
_CachingClass_Def  EQUATE(1)

!--------------------------------------------------------------------
! APPLICATION:  VoorrDct.APP   
! PROCEDURE:    CachingClassSource
! INC file:     CachingClassDef.inc
!--------------------------------------------------------------------

VerkoopArtikelQueue  QUEUE,PRE(VAQ),THREAD
VerkoopID               LONG
Artikelen				CSTRING(512)
					END
InkoopArtikelQueue  QUEUE,PRE(IAQ),THREAD
InkoopID                LONG
Artikelen				CSTRING(512)
					END
CelLocatieQueue		QUEUE,PRE(CLQ),THREAD
PartijID                LONG
CelID                   LONG
LocatieNaam				CSTRING(50)
					END
!--------------------------------------------------------------------
! CachingClass
!--------------------------------------------------------------------
CachingClass         CLASS
GetInkoopArtikelen	PROCEDURE(LONG PRM:InkoopID), STRING
GetVerkoopArtikelen PROCEDURE(LONG PRM:VerkoopID), STRING
GetCelLocatieNaam   PROCEDURE(LONG PRM:PartijID, LONG PRM:CelID), STRING
                     END ! CLASS: CachingClass


_EndOfInclude_
