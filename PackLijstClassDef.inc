
  OMIT('_EndOfInclude_',_PackLijstClass_Def)
_PackLijstClass_Def  EQUATE(1)

!--------------------------------------------------------------------
! APPLICATION:  VoorrDct.APP   
! PROCEDURE:    PackLijstClassSource
! INC file:     PackLijstClassDef.inc
!--------------------------------------------------------------------

PackLijstQ          QUEUE,TYPE,PRE(LTQ)                        ! 
ArtikelID            CSTRING(31)                           ! 
ArtikelOms           STRING(60)                            ! 
KG                   DECIMAL(10,2)                         ! 
Pallet               LONG                                  ! 
Dozen                LONG                                  ! 
Aantal               LONG                                  ! 
DozenPallets         CSTRING(21)                           ! 
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
! PackLijstClass
!--------------------------------------------------------------------
PackLijstClass       CLASS,TYPE
VulPackLijstQ           PROCEDURE(LONG,*PackLijstQ)

                     END ! CLASS: PackLijstClass


_EndOfInclude_
