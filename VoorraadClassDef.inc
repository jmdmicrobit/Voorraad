
  OMIT('_EndOfInclude_',_VoorraadClass_Def)
_VoorraadClass_Def  EQUATE(1)

!--------------------------------------------------------------------
! APPLICATION:  VoorrDct.APP   
! PROCEDURE:    VoorraadClassSource
! INC file:     VoorraadClassDef.inc
!--------------------------------------------------------------------

!--------------------------------------------------------------------
! VoorraadClass
!--------------------------------------------------------------------
VoorraadClass        CLASS
BerekenPlanningMutatieGrootte       PROCEDURE(LONG PRM:PlanningID)
VerwerkGekoppeldeVerkoop    PROCEDURE(LONG PRM:PlanningID, LONG PRM:OverboekingPlanningID, LONG PRM:CelID)
BepaalHuidigeVoorraad       PROCEDURE(LONG PRM:PartijID, LONG PRM:CelID), REAL
VerwijderPlanningMutaties   PROCEDURE(LONG PRM:PlanningID, BYTE PRM:TestOnly = 0), BYTE
VerwijderVerkoopMutaties    PROCEDURE(LONG PRM:VerkoopID, BYTE PRM:TestOnly = 0), BYTE
VerwijderInkoopMutaties     PROCEDURE(LONG PRM:InkoopID, BYTE PRM:TestOnly = 0), BYTE

BerekenPartijInkoopPrijs    PROCEDURE(<LONG PRM:PartijID>)
BerekenPartijenInkoopPrijs  PROCEDURE(<LONG PRM:InkoopID>, <LONG PRM:UitgezonderdPartij>)

ControleerCelLocatie        PROCEDURE(LONG PRM:CelID, LONG PRM:CelLocatieID), LONG

ResetPartijCelControle      PROCEDURE()
AddPartijCelControle        PROCEDURE(LONG PRM:PartijID, LONG PRM:CelID, REAL PRM:KG, REAL PRM:Pallets)
AddPartijCelControleOverboeking PROCEDURE(LONG PRM:PartijID, LONG PRM:VanCelID, LONG PRM:NaarCelID, REAL PRM:KG, REAL PRM:Pallets)
PartijCelControleOK         PROCEDURE(), STRING
                     END ! CLASS: VoorraadClass


_EndOfInclude_
