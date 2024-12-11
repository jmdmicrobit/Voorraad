
  OMIT('_EndOfInclude_',_CachingClassT_Def)
_CachingClassT_Def  EQUATE(1)

!--------------------------------------------------------------------
! APPLICATION:  VoorrDct.APP   
! PROCEDURE:    CachingClassSource
! INC file:     CachingClassDef.inc
!--------------------------------------------------------------------

!VerkoopArtikelQueue  QUEUE,PRE(VAQ),THREAD
!VerkoopID               LONG
!Artikelen				CSTRING(512)
!					END
!InkoopArtikelQueue  QUEUE,PRE(IAQ),THREAD
!InkoopID                LONG
!Artikelen				CSTRING(512)
!					END
!CelLocatieQueue		QUEUE,PRE(CLQ),THREAD
!PartijID                LONG
!CelID                   LONG
!LocatieNaam				CSTRING(50)
!					END
!--------------------------------------------------------------------
! CachingClassT
!--------------------------------------------------------------------
CachingClassT        CLASS
!GetInkoopArtikelen	PROCEDURE(LONG PRM:InkoopID, Long pCurrentTab,LONG pLeverancierID), STRING
!GetVerkoopArtikelen PROCEDURE(LONG PRM:VerkoopID, Long pCurrentTab, Long pKlantID), STRING
!GetCelLocatieNaam   PROCEDURE(LONG PRM:PartijID, LONG PRM:CelID), STRING
!
!CurrentInkoopTab        LONG
!CurrentLeverancierID    LONG
!CurrentVerkoopTab        LONG
!CurrentKlantID    LONG
                     END ! CLASS: CachingClassT


_EndOfInclude_
