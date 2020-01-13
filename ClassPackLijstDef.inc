
  OMIT('_EndOfInclude_',_ClassPackLijst_Def)
_ClassPackLijst_Def  EQUATE(1)

!--------------------------------------------------------------------
! APPLICATION:  VoorrDct.APP   
! PROCEDURE:    PackLijstClassSource
! INC file:     ClassPackLijstDef.inc
!--------------------------------------------------------------------

PackLijstQ          QUEUE,TYPE,PRE(LTQ)                        ! 
ArtikelID            CSTRING(31)                           ! 
ArtikelOms           STRING(60)                            ! 
ArtikelOmsAlt        CSTRING(1001)                            ! 
KG                   DECIMAL(10,2)                         ! 
Pallet               LONG                                  ! 
Dozen                LONG                                  ! 
Aantal               LONG                                  ! 
GrossWeight          DECIMAL(8,3)                          ! 
VerkoopPrijs         DECIMAL(11,3)                         ! 
VerpakkingID         LONG                                  ! 
VerpakkingOmschrijving CSTRING(51)                         ! 
Bedrag               DECIMAL(11,2)                         ! 
PlantNumber          CSTRING(51)                           ! 
ProductieDatum       DATE                                  ! 
THTDatum             DATE                                  ! 
GNCode               CSTRING(100)                          ! 
                    END

!--------------------------------------------------------------------
! ClassPackLijst
!--------------------------------------------------------------------
ClassPackLijst       CLASS,TYPE
VulPackLijstQ           PROCEDURE(LONG,*PackLijstQ)

                     END ! CLASS: ClassPackLijst


_EndOfInclude_
