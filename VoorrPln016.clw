

   MEMBER('VoorrPln.clw')                                  ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABPOPUP.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABUTIL.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('VOORRPLN016.INC'),ONCE        !Local module procedure declarations
                     END


!!! <summary>
!!! Generated from procedure template - Window
!!! Planning
!!! </summary>
BrowsePlanning PROCEDURE 

CurrentTab           STRING(80)                            ! 
Loc:DatumNu          DATE                                  ! 
LOC:DatumNuLast      DATE                                  ! 
Loc:DatumVanSQL      LONG                                  ! 
Loc:DatumTotSQL      LONG                                  ! 
LOC:ExcelMacroFile   STRING(500)                           ! 
LOC:ExcelPageBreak   LONG                                  ! 
LOC:Getransferd      BYTE                                  ! 
LOC:Tijdstip         TIME                                  ! 
Loc:ATijdstip        TIME                                  ! 
LOC:Locatienaam      STRING(50)                            ! 
LOC:Locatienaam2     STRING(50)                            ! 
LOC:Locatienaam3     STRING(50)                            ! 
Loc:RegelNu1         LONG                                  ! 
Loc:RegelNu2         LONG                                  ! 
LOC:SelectedFocus    LONG                                  ! 
LOC:SelectedFocusRow LONG,DIM(6)                           ! 
LOC:SkipRestoreFocus LONG                                  ! 
LOC:InkoopKG1        DECIMAL(10,2)                         ! 
LOC:InkoopKG2        DECIMAL(10,2)                         ! 
LOC:OverboekingKG1   DECIMAL(10,2)                         ! 
LOC:OverboekingKG2   DECIMAL(10,2)                         ! 
LOC:VerkoopKG1       DECIMAL(10,2)                         ! 
LOC:VerkoopKG2       DECIMAL(10,2)                         ! 
LOC:VerkoopKG3       DECIMAL(7,2)                          ! 
LOC:InkoopPallets1   LONG                                  ! 
LOC:InkoopPallets2   LONG                                  ! 
LOC:OverboekingPallets1 LONG                               ! 
LOC:OverboekingPallets2 LONG                               ! 
LOC:VerkoopPallets1  LONG                                  ! 
LOC:VerkoopPallets2  LONG                                  ! 
LOC:VerkoopPallets3  LONG                                  ! 
LOC:ActiviteitTabColor LONG                                ! 
LOC:VerkoopCelOms    CSTRING(51)                           ! 
Loc:KwaliteitKnopVerbergen BYTE                            ! 
BRW6::View:Browse    VIEW(PlanningInkoop)
                       PROJECT(Pla2:ArtikelID)
                       PROJECT(Pla2:ArtikelOms)
                       PROJECT(Pla2:FirmaNaam)
                       PROJECT(Pla2:Instructie)
                       PROJECT(Pla2:VerpakkingOmschrijving)
                       PROJECT(Pla2:Planning_TIME)
                       PROJECT(Pla2:MutatieGemaakt)
                       PROJECT(Pla2:Geprint)
                       PROJECT(Pla2:Verwerkt)
                       PROJECT(Pla2:Gewogen)
                       PROJECT(Pla2:CelOms)
                       PROJECT(Pla2:Locatienaam)
                       PROJECT(Pla2:Transport)
                       PROJECT(Pla2:PlanningID)
                       PROJECT(Pla2:InkoopID)
                       PROJECT(Pla2:KG)
                       PROJECT(Pla2:MutatieKG)
                       PROJECT(Pla2:MutatiePallets)
                       PROJECT(Pla2:Pallets)
                       PROJECT(Pla2:Planning)
                     END
Queue:Browse         QUEUE                            !Queue declaration for browse/combo box using ?InkoopList
Pla2:ArtikelID         LIKE(Pla2:ArtikelID)           !List box control field - type derived from field
Pla2:ArtikelID_NormalFG LONG                          !Normal forground color
Pla2:ArtikelID_NormalBG LONG                          !Normal background color
Pla2:ArtikelID_SelectedFG LONG                        !Selected forground color
Pla2:ArtikelID_SelectedBG LONG                        !Selected background color
Pla2:ArtikelOms        LIKE(Pla2:ArtikelOms)          !List box control field - type derived from field
Pla2:ArtikelOms_NormalFG LONG                         !Normal forground color
Pla2:ArtikelOms_NormalBG LONG                         !Normal background color
Pla2:ArtikelOms_SelectedFG LONG                       !Selected forground color
Pla2:ArtikelOms_SelectedBG LONG                       !Selected background color
Pla2:FirmaNaam         LIKE(Pla2:FirmaNaam)           !List box control field - type derived from field
Pla2:FirmaNaam_NormalFG LONG                          !Normal forground color
Pla2:FirmaNaam_NormalBG LONG                          !Normal background color
Pla2:FirmaNaam_SelectedFG LONG                        !Selected forground color
Pla2:FirmaNaam_SelectedBG LONG                        !Selected background color
LOC:InkoopKG1          LIKE(LOC:InkoopKG1)            !List box control field - type derived from local data
LOC:InkoopKG1_NormalFG LONG                           !Normal forground color
LOC:InkoopKG1_NormalBG LONG                           !Normal background color
LOC:InkoopKG1_SelectedFG LONG                         !Selected forground color
LOC:InkoopKG1_SelectedBG LONG                         !Selected background color
Pla2:Instructie        LIKE(Pla2:Instructie)          !List box control field - type derived from field
Pla2:Instructie_NormalFG LONG                         !Normal forground color
Pla2:Instructie_NormalBG LONG                         !Normal background color
Pla2:Instructie_SelectedFG LONG                       !Selected forground color
Pla2:Instructie_SelectedBG LONG                       !Selected background color
Pla2:VerpakkingOmschrijving LIKE(Pla2:VerpakkingOmschrijving) !List box control field - type derived from field
Pla2:VerpakkingOmschrijving_NormalFG LONG             !Normal forground color
Pla2:VerpakkingOmschrijving_NormalBG LONG             !Normal background color
Pla2:VerpakkingOmschrijving_SelectedFG LONG           !Selected forground color
Pla2:VerpakkingOmschrijving_SelectedBG LONG           !Selected background color
Pla2:Planning_TIME     LIKE(Pla2:Planning_TIME)       !List box control field - type derived from field
Pla2:Planning_TIME_NormalFG LONG                      !Normal forground color
Pla2:Planning_TIME_NormalBG LONG                      !Normal background color
Pla2:Planning_TIME_SelectedFG LONG                    !Selected forground color
Pla2:Planning_TIME_SelectedBG LONG                    !Selected background color
LOC:InkoopPallets1     LIKE(LOC:InkoopPallets1)       !List box control field - type derived from local data
LOC:InkoopPallets1_NormalFG LONG                      !Normal forground color
LOC:InkoopPallets1_NormalBG LONG                      !Normal background color
LOC:InkoopPallets1_SelectedFG LONG                    !Selected forground color
LOC:InkoopPallets1_SelectedBG LONG                    !Selected background color
Pla2:MutatieGemaakt    LIKE(Pla2:MutatieGemaakt)      !List box control field - type derived from field
Pla2:MutatieGemaakt_NormalFG LONG                     !Normal forground color
Pla2:MutatieGemaakt_NormalBG LONG                     !Normal background color
Pla2:MutatieGemaakt_SelectedFG LONG                   !Selected forground color
Pla2:MutatieGemaakt_SelectedBG LONG                   !Selected background color
Pla2:MutatieGemaakt_Icon LONG                         !Entry's icon ID
Pla2:Geprint           LIKE(Pla2:Geprint)             !List box control field - type derived from field
Pla2:Geprint_NormalFG  LONG                           !Normal forground color
Pla2:Geprint_NormalBG  LONG                           !Normal background color
Pla2:Geprint_SelectedFG LONG                          !Selected forground color
Pla2:Geprint_SelectedBG LONG                          !Selected background color
Pla2:Geprint_Icon      LONG                           !Entry's icon ID
LOC:Getransferd        LIKE(LOC:Getransferd)          !List box control field - type derived from local data
LOC:Getransferd_NormalFG LONG                         !Normal forground color
LOC:Getransferd_NormalBG LONG                         !Normal background color
LOC:Getransferd_SelectedFG LONG                       !Selected forground color
LOC:Getransferd_SelectedBG LONG                       !Selected background color
LOC:Getransferd_Icon   LONG                           !Entry's icon ID
Pla2:Verwerkt          LIKE(Pla2:Verwerkt)            !List box control field - type derived from field
Pla2:Verwerkt_NormalFG LONG                           !Normal forground color
Pla2:Verwerkt_NormalBG LONG                           !Normal background color
Pla2:Verwerkt_SelectedFG LONG                         !Selected forground color
Pla2:Verwerkt_SelectedBG LONG                         !Selected background color
Pla2:Verwerkt_Icon     LONG                           !Entry's icon ID
Pla2:Gewogen           LIKE(Pla2:Gewogen)             !List box control field - type derived from field
Pla2:Gewogen_NormalFG  LONG                           !Normal forground color
Pla2:Gewogen_NormalBG  LONG                           !Normal background color
Pla2:Gewogen_SelectedFG LONG                          !Selected forground color
Pla2:Gewogen_SelectedBG LONG                          !Selected background color
Pla2:Gewogen_Icon      LONG                           !Entry's icon ID
Pla2:CelOms            LIKE(Pla2:CelOms)              !List box control field - type derived from field
Pla2:CelOms_NormalFG   LONG                           !Normal forground color
Pla2:CelOms_NormalBG   LONG                           !Normal background color
Pla2:CelOms_SelectedFG LONG                           !Selected forground color
Pla2:CelOms_SelectedBG LONG                           !Selected background color
Pla2:Locatienaam       LIKE(Pla2:Locatienaam)         !List box control field - type derived from field
Pla2:Locatienaam_NormalFG LONG                        !Normal forground color
Pla2:Locatienaam_NormalBG LONG                        !Normal background color
Pla2:Locatienaam_SelectedFG LONG                      !Selected forground color
Pla2:Locatienaam_SelectedBG LONG                      !Selected background color
Pla2:Transport         LIKE(Pla2:Transport)           !List box control field - type derived from field
Pla2:Transport_NormalFG LONG                          !Normal forground color
Pla2:Transport_NormalBG LONG                          !Normal background color
Pla2:Transport_SelectedFG LONG                        !Selected forground color
Pla2:Transport_SelectedBG LONG                        !Selected background color
Pla2:PlanningID        LIKE(Pla2:PlanningID)          !List box control field - type derived from field
Pla2:PlanningID_NormalFG LONG                         !Normal forground color
Pla2:PlanningID_NormalBG LONG                         !Normal background color
Pla2:PlanningID_SelectedFG LONG                       !Selected forground color
Pla2:PlanningID_SelectedBG LONG                       !Selected background color
Pla2:InkoopID          LIKE(Pla2:InkoopID)            !Browse hot field - type derived from field
Pla2:KG                LIKE(Pla2:KG)                  !Browse hot field - type derived from field
Pla2:MutatieKG         LIKE(Pla2:MutatieKG)           !Browse hot field - type derived from field
Pla2:MutatiePallets    LIKE(Pla2:MutatiePallets)      !Browse hot field - type derived from field
Pla2:Pallets           LIKE(Pla2:Pallets)             !Browse hot field - type derived from field
Pla2:Planning          LIKE(Pla2:Planning)            !Browse key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
BRW1::View:Browse    VIEW(PlanningVerkoop)
                       PROJECT(Pla3:ArtikelID)
                       PROJECT(Pla3:ArtikelOms)
                       PROJECT(Pla3:FirmaNaam)
                       PROJECT(Pla3:PartijID)
                       PROJECT(Pla3:ExternPartijnr)
                       PROJECT(Pla3:Instructie)
                       PROJECT(Pla3:VerpakkingOmschrijving)
                       PROJECT(Pla3:Planning_TIME)
                       PROJECT(Pla3:MutatieGemaakt)
                       PROJECT(Pla3:Geprint)
                       PROJECT(Pla3:Verwerkt)
                       PROJECT(Pla3:Gewogen)
                       PROJECT(Pla3:CelOms)
                       PROJECT(Pla3:HerkomstOverboekingCelOms)
                       PROJECT(Pla3:LeverancierFirmaNaam)
                       PROJECT(Pla3:Transport)
                       PROJECT(Pla3:PlanningID)
                       PROJECT(Pla3:VerkoopID)
                       PROJECT(Pla3:CelID)
                       PROJECT(Pla3:KG)
                       PROJECT(Pla3:MutatieKG)
                       PROJECT(Pla3:Pallets)
                       PROJECT(Pla3:MutatiePallets)
                       PROJECT(Pla3:Planning)
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?VerkoopList
Pla3:ArtikelID         LIKE(Pla3:ArtikelID)           !List box control field - type derived from field
Pla3:ArtikelID_NormalFG LONG                          !Normal forground color
Pla3:ArtikelID_NormalBG LONG                          !Normal background color
Pla3:ArtikelID_SelectedFG LONG                        !Selected forground color
Pla3:ArtikelID_SelectedBG LONG                        !Selected background color
Pla3:ArtikelOms        LIKE(Pla3:ArtikelOms)          !List box control field - type derived from field
Pla3:ArtikelOms_NormalFG LONG                         !Normal forground color
Pla3:ArtikelOms_NormalBG LONG                         !Normal background color
Pla3:ArtikelOms_SelectedFG LONG                       !Selected forground color
Pla3:ArtikelOms_SelectedBG LONG                       !Selected background color
Pla3:FirmaNaam         LIKE(Pla3:FirmaNaam)           !List box control field - type derived from field
Pla3:FirmaNaam_NormalFG LONG                          !Normal forground color
Pla3:FirmaNaam_NormalBG LONG                          !Normal background color
Pla3:FirmaNaam_SelectedFG LONG                        !Selected forground color
Pla3:FirmaNaam_SelectedBG LONG                        !Selected background color
Pla3:PartijID          LIKE(Pla3:PartijID)            !List box control field - type derived from field
Pla3:PartijID_NormalFG LONG                           !Normal forground color
Pla3:PartijID_NormalBG LONG                           !Normal background color
Pla3:PartijID_SelectedFG LONG                         !Selected forground color
Pla3:PartijID_SelectedBG LONG                         !Selected background color
Pla3:ExternPartijnr    LIKE(Pla3:ExternPartijnr)      !List box control field - type derived from field
Pla3:ExternPartijnr_NormalFG LONG                     !Normal forground color
Pla3:ExternPartijnr_NormalBG LONG                     !Normal background color
Pla3:ExternPartijnr_SelectedFG LONG                   !Selected forground color
Pla3:ExternPartijnr_SelectedBG LONG                   !Selected background color
LOC:VerkoopKG1         LIKE(LOC:VerkoopKG1)           !List box control field - type derived from local data
LOC:VerkoopKG1_NormalFG LONG                          !Normal forground color
LOC:VerkoopKG1_NormalBG LONG                          !Normal background color
LOC:VerkoopKG1_SelectedFG LONG                        !Selected forground color
LOC:VerkoopKG1_SelectedBG LONG                        !Selected background color
Pla3:Instructie        LIKE(Pla3:Instructie)          !List box control field - type derived from field
Pla3:Instructie_NormalFG LONG                         !Normal forground color
Pla3:Instructie_NormalBG LONG                         !Normal background color
Pla3:Instructie_SelectedFG LONG                       !Selected forground color
Pla3:Instructie_SelectedBG LONG                       !Selected background color
Pla3:Instructie_Tip    STRING(80)                     !Field tooltip
Pla3:VerpakkingOmschrijving LIKE(Pla3:VerpakkingOmschrijving) !List box control field - type derived from field
Pla3:VerpakkingOmschrijving_NormalFG LONG             !Normal forground color
Pla3:VerpakkingOmschrijving_NormalBG LONG             !Normal background color
Pla3:VerpakkingOmschrijving_SelectedFG LONG           !Selected forground color
Pla3:VerpakkingOmschrijving_SelectedBG LONG           !Selected background color
Pla3:Planning_TIME     LIKE(Pla3:Planning_TIME)       !List box control field - type derived from field
Pla3:Planning_TIME_NormalFG LONG                      !Normal forground color
Pla3:Planning_TIME_NormalBG LONG                      !Normal background color
Pla3:Planning_TIME_SelectedFG LONG                    !Selected forground color
Pla3:Planning_TIME_SelectedBG LONG                    !Selected background color
LOC:VerkoopPallets1    LIKE(LOC:VerkoopPallets1)      !List box control field - type derived from local data
LOC:VerkoopPallets1_NormalFG LONG                     !Normal forground color
LOC:VerkoopPallets1_NormalBG LONG                     !Normal background color
LOC:VerkoopPallets1_SelectedFG LONG                   !Selected forground color
LOC:VerkoopPallets1_SelectedBG LONG                   !Selected background color
Pla3:MutatieGemaakt    LIKE(Pla3:MutatieGemaakt)      !List box control field - type derived from field
Pla3:MutatieGemaakt_NormalFG LONG                     !Normal forground color
Pla3:MutatieGemaakt_NormalBG LONG                     !Normal background color
Pla3:MutatieGemaakt_SelectedFG LONG                   !Selected forground color
Pla3:MutatieGemaakt_SelectedBG LONG                   !Selected background color
Pla3:MutatieGemaakt_Icon LONG                         !Entry's icon ID
Pla3:Geprint           LIKE(Pla3:Geprint)             !List box control field - type derived from field
Pla3:Geprint_NormalFG  LONG                           !Normal forground color
Pla3:Geprint_NormalBG  LONG                           !Normal background color
Pla3:Geprint_SelectedFG LONG                          !Selected forground color
Pla3:Geprint_SelectedBG LONG                          !Selected background color
Pla3:Geprint_Icon      LONG                           !Entry's icon ID
Pla3:Verwerkt          LIKE(Pla3:Verwerkt)            !List box control field - type derived from field
Pla3:Verwerkt_NormalFG LONG                           !Normal forground color
Pla3:Verwerkt_NormalBG LONG                           !Normal background color
Pla3:Verwerkt_SelectedFG LONG                         !Selected forground color
Pla3:Verwerkt_SelectedBG LONG                         !Selected background color
Pla3:Verwerkt_Icon     LONG                           !Entry's icon ID
Pla3:Gewogen           LIKE(Pla3:Gewogen)             !List box control field - type derived from field
Pla3:Gewogen_NormalFG  LONG                           !Normal forground color
Pla3:Gewogen_NormalBG  LONG                           !Normal background color
Pla3:Gewogen_SelectedFG LONG                          !Selected forground color
Pla3:Gewogen_SelectedBG LONG                          !Selected background color
Pla3:Gewogen_Icon      LONG                           !Entry's icon ID
Pla3:CelOms            LIKE(Pla3:CelOms)              !List box control field - type derived from field
Pla3:CelOms_NormalFG   LONG                           !Normal forground color
Pla3:CelOms_NormalBG   LONG                           !Normal background color
Pla3:CelOms_SelectedFG LONG                           !Selected forground color
Pla3:CelOms_SelectedBG LONG                           !Selected background color
LOC:Locatienaam        LIKE(LOC:Locatienaam)          !List box control field - type derived from local data
LOC:Locatienaam_NormalFG LONG                         !Normal forground color
LOC:Locatienaam_NormalBG LONG                         !Normal background color
LOC:Locatienaam_SelectedFG LONG                       !Selected forground color
LOC:Locatienaam_SelectedBG LONG                       !Selected background color
Pla3:HerkomstOverboekingCelOms LIKE(Pla3:HerkomstOverboekingCelOms) !List box control field - type derived from field
Pla3:HerkomstOverboekingCelOms_NormalFG LONG          !Normal forground color
Pla3:HerkomstOverboekingCelOms_NormalBG LONG          !Normal background color
Pla3:HerkomstOverboekingCelOms_SelectedFG LONG        !Selected forground color
Pla3:HerkomstOverboekingCelOms_SelectedBG LONG        !Selected background color
Pla3:LeverancierFirmaNaam LIKE(Pla3:LeverancierFirmaNaam) !List box control field - type derived from field
Pla3:LeverancierFirmaNaam_NormalFG LONG               !Normal forground color
Pla3:LeverancierFirmaNaam_NormalBG LONG               !Normal background color
Pla3:LeverancierFirmaNaam_SelectedFG LONG             !Selected forground color
Pla3:LeverancierFirmaNaam_SelectedBG LONG             !Selected background color
Pla3:Transport         LIKE(Pla3:Transport)           !List box control field - type derived from field
Pla3:Transport_NormalFG LONG                          !Normal forground color
Pla3:Transport_NormalBG LONG                          !Normal background color
Pla3:Transport_SelectedFG LONG                        !Selected forground color
Pla3:Transport_SelectedBG LONG                        !Selected background color
Pla3:Transport_Tip     STRING(80)                     !Field tooltip
Pla3:PlanningID        LIKE(Pla3:PlanningID)          !List box control field - type derived from field
Pla3:PlanningID_NormalFG LONG                         !Normal forground color
Pla3:PlanningID_NormalBG LONG                         !Normal background color
Pla3:PlanningID_SelectedFG LONG                       !Selected forground color
Pla3:PlanningID_SelectedBG LONG                       !Selected background color
Pla3:PlanningID_Tip    STRING(80)                     !Field tooltip
Pla3:VerkoopID         LIKE(Pla3:VerkoopID)           !Browse hot field - type derived from field
Pla3:CelID             LIKE(Pla3:CelID)               !Browse hot field - type derived from field
LOC:Getransferd        LIKE(LOC:Getransferd)          !Browse hot field - type derived from local data
Pla3:KG                LIKE(Pla3:KG)                  !Browse hot field - type derived from field
Pla3:MutatieKG         LIKE(Pla3:MutatieKG)           !Browse hot field - type derived from field
Pla3:Pallets           LIKE(Pla3:Pallets)             !Browse hot field - type derived from field
Pla3:MutatiePallets    LIKE(Pla3:MutatiePallets)      !Browse hot field - type derived from field
Pla3:Planning          LIKE(Pla3:Planning)            !Browse key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
BRW8::View:Browse    VIEW(PlanningOverboeking)
                       PROJECT(Pla4:ArtikelID)
                       PROJECT(Pla4:ArtikelOms)
                       PROJECT(Pla4:FirmaNaam)
                       PROJECT(Pla4:PartijID)
                       PROJECT(Pla4:ExternPartijnr)
                       PROJECT(Pla4:Instructie)
                       PROJECT(Pla4:VerpakkingOmschrijving)
                       PROJECT(Pla4:Planning_TIME)
                       PROJECT(Pla4:MutatieGemaakt)
                       PROJECT(Pla4:Verwerkt)
                       PROJECT(Pla4:CelOms)
                       PROJECT(Pla4:Locatienaam)
                       PROJECT(Pla4:NaarCelOms)
                       PROJECT(Pla4:Transport)
                       PROJECT(Pla4:PlanningID)
                       PROJECT(Pla4:KG)
                       PROJECT(Pla4:MutatieKG)
                       PROJECT(Pla4:Pallets)
                       PROJECT(Pla4:MutatiePallets)
                       PROJECT(Pla4:Planning)
                     END
Queue:Browse:2       QUEUE                            !Queue declaration for browse/combo box using ?OverboekList
Pla4:ArtikelID         LIKE(Pla4:ArtikelID)           !List box control field - type derived from field
Pla4:ArtikelID_NormalFG LONG                          !Normal forground color
Pla4:ArtikelID_NormalBG LONG                          !Normal background color
Pla4:ArtikelID_SelectedFG LONG                        !Selected forground color
Pla4:ArtikelID_SelectedBG LONG                        !Selected background color
Pla4:ArtikelOms        LIKE(Pla4:ArtikelOms)          !List box control field - type derived from field
Pla4:ArtikelOms_NormalFG LONG                         !Normal forground color
Pla4:ArtikelOms_NormalBG LONG                         !Normal background color
Pla4:ArtikelOms_SelectedFG LONG                       !Selected forground color
Pla4:ArtikelOms_SelectedBG LONG                       !Selected background color
Pla4:FirmaNaam         LIKE(Pla4:FirmaNaam)           !List box control field - type derived from field
Pla4:FirmaNaam_NormalFG LONG                          !Normal forground color
Pla4:FirmaNaam_NormalBG LONG                          !Normal background color
Pla4:FirmaNaam_SelectedFG LONG                        !Selected forground color
Pla4:FirmaNaam_SelectedBG LONG                        !Selected background color
Pla4:PartijID          LIKE(Pla4:PartijID)            !List box control field - type derived from field
Pla4:PartijID_NormalFG LONG                           !Normal forground color
Pla4:PartijID_NormalBG LONG                           !Normal background color
Pla4:PartijID_SelectedFG LONG                         !Selected forground color
Pla4:PartijID_SelectedBG LONG                         !Selected background color
Pla4:ExternPartijnr    LIKE(Pla4:ExternPartijnr)      !List box control field - type derived from field
Pla4:ExternPartijnr_NormalFG LONG                     !Normal forground color
Pla4:ExternPartijnr_NormalBG LONG                     !Normal background color
Pla4:ExternPartijnr_SelectedFG LONG                   !Selected forground color
Pla4:ExternPartijnr_SelectedBG LONG                   !Selected background color
LOC:OverboekingKG1     LIKE(LOC:OverboekingKG1)       !List box control field - type derived from local data
LOC:OverboekingKG1_NormalFG LONG                      !Normal forground color
LOC:OverboekingKG1_NormalBG LONG                      !Normal background color
LOC:OverboekingKG1_SelectedFG LONG                    !Selected forground color
LOC:OverboekingKG1_SelectedBG LONG                    !Selected background color
APla4:OverboekSoort    LIKE(APla4:OverboekSoort)      !List box control field - type derived from field
APla4:OverboekSoort_NormalFG LONG                     !Normal forground color
APla4:OverboekSoort_NormalBG LONG                     !Normal background color
APla4:OverboekSoort_SelectedFG LONG                   !Selected forground color
APla4:OverboekSoort_SelectedBG LONG                   !Selected background color
Pla4:Instructie        LIKE(Pla4:Instructie)          !List box control field - type derived from field
Pla4:Instructie_NormalFG LONG                         !Normal forground color
Pla4:Instructie_NormalBG LONG                         !Normal background color
Pla4:Instructie_SelectedFG LONG                       !Selected forground color
Pla4:Instructie_SelectedBG LONG                       !Selected background color
Pla4:VerpakkingOmschrijving LIKE(Pla4:VerpakkingOmschrijving) !List box control field - type derived from field
Pla4:VerpakkingOmschrijving_NormalFG LONG             !Normal forground color
Pla4:VerpakkingOmschrijving_NormalBG LONG             !Normal background color
Pla4:VerpakkingOmschrijving_SelectedFG LONG           !Selected forground color
Pla4:VerpakkingOmschrijving_SelectedBG LONG           !Selected background color
Pla4:Planning_TIME     LIKE(Pla4:Planning_TIME)       !List box control field - type derived from field
Pla4:Planning_TIME_NormalFG LONG                      !Normal forground color
Pla4:Planning_TIME_NormalBG LONG                      !Normal background color
Pla4:Planning_TIME_SelectedFG LONG                    !Selected forground color
Pla4:Planning_TIME_SelectedBG LONG                    !Selected background color
LOC:OverboekingPallets1 LIKE(LOC:OverboekingPallets1) !List box control field - type derived from local data
LOC:OverboekingPallets1_NormalFG LONG                 !Normal forground color
LOC:OverboekingPallets1_NormalBG LONG                 !Normal background color
LOC:OverboekingPallets1_SelectedFG LONG               !Selected forground color
LOC:OverboekingPallets1_SelectedBG LONG               !Selected background color
Pla4:MutatieGemaakt    LIKE(Pla4:MutatieGemaakt)      !List box control field - type derived from field
Pla4:MutatieGemaakt_NormalFG LONG                     !Normal forground color
Pla4:MutatieGemaakt_NormalBG LONG                     !Normal background color
Pla4:MutatieGemaakt_SelectedFG LONG                   !Selected forground color
Pla4:MutatieGemaakt_SelectedBG LONG                   !Selected background color
Pla4:MutatieGemaakt_Icon LONG                         !Entry's icon ID
LOC:Getransferd        LIKE(LOC:Getransferd)          !List box control field - type derived from local data
LOC:Getransferd_NormalFG LONG                         !Normal forground color
LOC:Getransferd_NormalBG LONG                         !Normal background color
LOC:Getransferd_SelectedFG LONG                       !Selected forground color
LOC:Getransferd_SelectedBG LONG                       !Selected background color
LOC:Getransferd_Icon   LONG                           !Entry's icon ID
Pla4:Verwerkt          LIKE(Pla4:Verwerkt)            !List box control field - type derived from field
Pla4:Verwerkt_NormalFG LONG                           !Normal forground color
Pla4:Verwerkt_NormalBG LONG                           !Normal background color
Pla4:Verwerkt_SelectedFG LONG                         !Selected forground color
Pla4:Verwerkt_SelectedBG LONG                         !Selected background color
Pla4:Verwerkt_Icon     LONG                           !Entry's icon ID
Pla4:CelOms            LIKE(Pla4:CelOms)              !List box control field - type derived from field
Pla4:CelOms_NormalFG   LONG                           !Normal forground color
Pla4:CelOms_NormalBG   LONG                           !Normal background color
Pla4:CelOms_SelectedFG LONG                           !Selected forground color
Pla4:CelOms_SelectedBG LONG                           !Selected background color
Pla4:Locatienaam       LIKE(Pla4:Locatienaam)         !List box control field - type derived from field
Pla4:Locatienaam_NormalFG LONG                        !Normal forground color
Pla4:Locatienaam_NormalBG LONG                        !Normal background color
Pla4:Locatienaam_SelectedFG LONG                      !Selected forground color
Pla4:Locatienaam_SelectedBG LONG                      !Selected background color
Pla4:NaarCelOms        LIKE(Pla4:NaarCelOms)          !List box control field - type derived from field
Pla4:NaarCelOms_NormalFG LONG                         !Normal forground color
Pla4:NaarCelOms_NormalBG LONG                         !Normal background color
Pla4:NaarCelOms_SelectedFG LONG                       !Selected forground color
Pla4:NaarCelOms_SelectedBG LONG                       !Selected background color
APla4:NaarLocatienaam  LIKE(APla4:NaarLocatienaam)    !List box control field - type derived from field
APla4:NaarLocatienaam_NormalFG LONG                   !Normal forground color
APla4:NaarLocatienaam_NormalBG LONG                   !Normal background color
APla4:NaarLocatienaam_SelectedFG LONG                 !Selected forground color
APla4:NaarLocatienaam_SelectedBG LONG                 !Selected background color
Pla4:Transport         LIKE(Pla4:Transport)           !List box control field - type derived from field
Pla4:Transport_NormalFG LONG                          !Normal forground color
Pla4:Transport_NormalBG LONG                          !Normal background color
Pla4:Transport_SelectedFG LONG                        !Selected forground color
Pla4:Transport_SelectedBG LONG                        !Selected background color
Pla4:PlanningID        LIKE(Pla4:PlanningID)          !Browse hot field - type derived from field
Pla4:KG                LIKE(Pla4:KG)                  !Browse hot field - type derived from field
Pla4:MutatieKG         LIKE(Pla4:MutatieKG)           !Browse hot field - type derived from field
Pla4:Pallets           LIKE(Pla4:Pallets)             !Browse hot field - type derived from field
Pla4:MutatiePallets    LIKE(Pla4:MutatiePallets)      !Browse hot field - type derived from field
Pla4:Planning          LIKE(Pla4:Planning)            !Browse key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
BRW3::View:Browse    VIEW(APlanningInkoop)
                       PROJECT(APla2:ArtikelID)
                       PROJECT(APla2:ArtikelOms)
                       PROJECT(APla2:FirmaNaam)
                       PROJECT(APla2:Instructie)
                       PROJECT(APla2:VerpakkingOmschrijving)
                       PROJECT(APla2:Planning_TIME)
                       PROJECT(APla2:MutatieGemaakt)
                       PROJECT(APla2:Geprint)
                       PROJECT(APla2:Verwerkt)
                       PROJECT(APla2:Gewogen)
                       PROJECT(APla2:CelOms)
                       PROJECT(APla2:Locatienaam)
                       PROJECT(APla2:Transport)
                       PROJECT(APla2:PlanningID)
                       PROJECT(APla2:InkoopID)
                       PROJECT(APla2:KG)
                       PROJECT(APla2:MutatieKG)
                       PROJECT(APla2:MutatiePallets)
                       PROJECT(APla2:Pallets)
                       PROJECT(APla2:PartijID)
                       PROJECT(APla2:Planning)
                     END
Queue:Browse:3       QUEUE                            !Queue declaration for browse/combo box using ?InkoopList2
APla2:ArtikelID        LIKE(APla2:ArtikelID)          !List box control field - type derived from field
APla2:ArtikelID_NormalFG LONG                         !Normal forground color
APla2:ArtikelID_NormalBG LONG                         !Normal background color
APla2:ArtikelID_SelectedFG LONG                       !Selected forground color
APla2:ArtikelID_SelectedBG LONG                       !Selected background color
APla2:ArtikelOms       LIKE(APla2:ArtikelOms)         !List box control field - type derived from field
APla2:ArtikelOms_NormalFG LONG                        !Normal forground color
APla2:ArtikelOms_NormalBG LONG                        !Normal background color
APla2:ArtikelOms_SelectedFG LONG                      !Selected forground color
APla2:ArtikelOms_SelectedBG LONG                      !Selected background color
APla2:FirmaNaam        LIKE(APla2:FirmaNaam)          !List box control field - type derived from field
APla2:FirmaNaam_NormalFG LONG                         !Normal forground color
APla2:FirmaNaam_NormalBG LONG                         !Normal background color
APla2:FirmaNaam_SelectedFG LONG                       !Selected forground color
APla2:FirmaNaam_SelectedBG LONG                       !Selected background color
LOC:InkoopKG2          LIKE(LOC:InkoopKG2)            !List box control field - type derived from local data
LOC:InkoopKG2_NormalFG LONG                           !Normal forground color
LOC:InkoopKG2_NormalBG LONG                           !Normal background color
LOC:InkoopKG2_SelectedFG LONG                         !Selected forground color
LOC:InkoopKG2_SelectedBG LONG                         !Selected background color
APla2:Instructie       LIKE(APla2:Instructie)         !List box control field - type derived from field
APla2:Instructie_NormalFG LONG                        !Normal forground color
APla2:Instructie_NormalBG LONG                        !Normal background color
APla2:Instructie_SelectedFG LONG                      !Selected forground color
APla2:Instructie_SelectedBG LONG                      !Selected background color
APla2:VerpakkingOmschrijving LIKE(APla2:VerpakkingOmschrijving) !List box control field - type derived from field
APla2:VerpakkingOmschrijving_NormalFG LONG            !Normal forground color
APla2:VerpakkingOmschrijving_NormalBG LONG            !Normal background color
APla2:VerpakkingOmschrijving_SelectedFG LONG          !Selected forground color
APla2:VerpakkingOmschrijving_SelectedBG LONG          !Selected background color
APla2:Planning_TIME    LIKE(APla2:Planning_TIME)      !List box control field - type derived from field
APla2:Planning_TIME_NormalFG LONG                     !Normal forground color
APla2:Planning_TIME_NormalBG LONG                     !Normal background color
APla2:Planning_TIME_SelectedFG LONG                   !Selected forground color
APla2:Planning_TIME_SelectedBG LONG                   !Selected background color
LOC:InkoopPallets2     LIKE(LOC:InkoopPallets2)       !List box control field - type derived from local data
LOC:InkoopPallets2_NormalFG LONG                      !Normal forground color
LOC:InkoopPallets2_NormalBG LONG                      !Normal background color
LOC:InkoopPallets2_SelectedFG LONG                    !Selected forground color
LOC:InkoopPallets2_SelectedBG LONG                    !Selected background color
APla2:MutatieGemaakt   LIKE(APla2:MutatieGemaakt)     !List box control field - type derived from field
APla2:MutatieGemaakt_NormalFG LONG                    !Normal forground color
APla2:MutatieGemaakt_NormalBG LONG                    !Normal background color
APla2:MutatieGemaakt_SelectedFG LONG                  !Selected forground color
APla2:MutatieGemaakt_SelectedBG LONG                  !Selected background color
APla2:MutatieGemaakt_Icon LONG                        !Entry's icon ID
APla2:Geprint          LIKE(APla2:Geprint)            !List box control field - type derived from field
APla2:Geprint_NormalFG LONG                           !Normal forground color
APla2:Geprint_NormalBG LONG                           !Normal background color
APla2:Geprint_SelectedFG LONG                         !Selected forground color
APla2:Geprint_SelectedBG LONG                         !Selected background color
APla2:Geprint_Icon     LONG                           !Entry's icon ID
LOC:Getransferd        LIKE(LOC:Getransferd)          !List box control field - type derived from local data
LOC:Getransferd_NormalFG LONG                         !Normal forground color
LOC:Getransferd_NormalBG LONG                         !Normal background color
LOC:Getransferd_SelectedFG LONG                       !Selected forground color
LOC:Getransferd_SelectedBG LONG                       !Selected background color
LOC:Getransferd_Icon   LONG                           !Entry's icon ID
APla2:Verwerkt         LIKE(APla2:Verwerkt)           !List box control field - type derived from field
APla2:Verwerkt_NormalFG LONG                          !Normal forground color
APla2:Verwerkt_NormalBG LONG                          !Normal background color
APla2:Verwerkt_SelectedFG LONG                        !Selected forground color
APla2:Verwerkt_SelectedBG LONG                        !Selected background color
APla2:Verwerkt_Icon    LONG                           !Entry's icon ID
APla2:Gewogen          LIKE(APla2:Gewogen)            !List box control field - type derived from field
APla2:Gewogen_NormalFG LONG                           !Normal forground color
APla2:Gewogen_NormalBG LONG                           !Normal background color
APla2:Gewogen_SelectedFG LONG                         !Selected forground color
APla2:Gewogen_SelectedBG LONG                         !Selected background color
APla2:Gewogen_Icon     LONG                           !Entry's icon ID
APla2:CelOms           LIKE(APla2:CelOms)             !List box control field - type derived from field
APla2:CelOms_NormalFG  LONG                           !Normal forground color
APla2:CelOms_NormalBG  LONG                           !Normal background color
APla2:CelOms_SelectedFG LONG                          !Selected forground color
APla2:CelOms_SelectedBG LONG                          !Selected background color
APla2:Locatienaam      LIKE(APla2:Locatienaam)        !List box control field - type derived from field
APla2:Locatienaam_NormalFG LONG                       !Normal forground color
APla2:Locatienaam_NormalBG LONG                       !Normal background color
APla2:Locatienaam_SelectedFG LONG                     !Selected forground color
APla2:Locatienaam_SelectedBG LONG                     !Selected background color
APla2:Transport        LIKE(APla2:Transport)          !List box control field - type derived from field
APla2:Transport_NormalFG LONG                         !Normal forground color
APla2:Transport_NormalBG LONG                         !Normal background color
APla2:Transport_SelectedFG LONG                       !Selected forground color
APla2:Transport_SelectedBG LONG                       !Selected background color
APla2:PlanningID       LIKE(APla2:PlanningID)         !List box control field - type derived from field
APla2:PlanningID_NormalFG LONG                        !Normal forground color
APla2:PlanningID_NormalBG LONG                        !Normal background color
APla2:PlanningID_SelectedFG LONG                      !Selected forground color
APla2:PlanningID_SelectedBG LONG                      !Selected background color
APla2:InkoopID         LIKE(APla2:InkoopID)           !Browse hot field - type derived from field
APla2:KG               LIKE(APla2:KG)                 !Browse hot field - type derived from field
APla2:MutatieKG        LIKE(APla2:MutatieKG)          !Browse hot field - type derived from field
APla2:MutatiePallets   LIKE(APla2:MutatiePallets)     !Browse hot field - type derived from field
APla2:Pallets          LIKE(APla2:Pallets)            !Browse hot field - type derived from field
APla2:PartijID         LIKE(APla2:PartijID)           !Browse hot field - type derived from field
APla2:Planning         LIKE(APla2:Planning)           !Browse key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
BRW9::View:Browse    VIEW(APlanningOverboeking)
                       PROJECT(APla4:ArtikelID)
                       PROJECT(APla4:ArtikelOms)
                       PROJECT(APla4:FirmaNaam)
                       PROJECT(APla4:PartijID)
                       PROJECT(APla4:ExternPartijnr)
                       PROJECT(APla4:Instructie)
                       PROJECT(APla4:VerpakkingOmschrijving)
                       PROJECT(APla4:Planning_TIME)
                       PROJECT(APla4:OverboekSoort)
                       PROJECT(APla4:MutatieGemaakt)
                       PROJECT(APla4:Verwerkt)
                       PROJECT(APla4:CelOms)
                       PROJECT(APla4:Locatienaam)
                       PROJECT(APla4:NaarCelOms)
                       PROJECT(APla4:NaarLocatienaam)
                       PROJECT(APla4:Transport)
                       PROJECT(APla4:PlanningID)
                       PROJECT(APla4:KG)
                       PROJECT(APla4:MutatieKG)
                       PROJECT(APla4:Pallets)
                       PROJECT(APla4:MutatiePallets)
                       PROJECT(APla4:Planning)
                     END
Queue:Browse:4       QUEUE                            !Queue declaration for browse/combo box using ?OverboekList2
APla4:ArtikelID        LIKE(APla4:ArtikelID)          !List box control field - type derived from field
APla4:ArtikelID_NormalFG LONG                         !Normal forground color
APla4:ArtikelID_NormalBG LONG                         !Normal background color
APla4:ArtikelID_SelectedFG LONG                       !Selected forground color
APla4:ArtikelID_SelectedBG LONG                       !Selected background color
APla4:ArtikelOms       LIKE(APla4:ArtikelOms)         !List box control field - type derived from field
APla4:ArtikelOms_NormalFG LONG                        !Normal forground color
APla4:ArtikelOms_NormalBG LONG                        !Normal background color
APla4:ArtikelOms_SelectedFG LONG                      !Selected forground color
APla4:ArtikelOms_SelectedBG LONG                      !Selected background color
APla4:FirmaNaam        LIKE(APla4:FirmaNaam)          !List box control field - type derived from field
APla4:FirmaNaam_NormalFG LONG                         !Normal forground color
APla4:FirmaNaam_NormalBG LONG                         !Normal background color
APla4:FirmaNaam_SelectedFG LONG                       !Selected forground color
APla4:FirmaNaam_SelectedBG LONG                       !Selected background color
APla4:PartijID         LIKE(APla4:PartijID)           !List box control field - type derived from field
APla4:PartijID_NormalFG LONG                          !Normal forground color
APla4:PartijID_NormalBG LONG                          !Normal background color
APla4:PartijID_SelectedFG LONG                        !Selected forground color
APla4:PartijID_SelectedBG LONG                        !Selected background color
APla4:ExternPartijnr   LIKE(APla4:ExternPartijnr)     !List box control field - type derived from field
APla4:ExternPartijnr_NormalFG LONG                    !Normal forground color
APla4:ExternPartijnr_NormalBG LONG                    !Normal background color
APla4:ExternPartijnr_SelectedFG LONG                  !Selected forground color
APla4:ExternPartijnr_SelectedBG LONG                  !Selected background color
LOC:OverboekingKG2     LIKE(LOC:OverboekingKG2)       !List box control field - type derived from local data
LOC:OverboekingKG2_NormalFG LONG                      !Normal forground color
LOC:OverboekingKG2_NormalBG LONG                      !Normal background color
LOC:OverboekingKG2_SelectedFG LONG                    !Selected forground color
LOC:OverboekingKG2_SelectedBG LONG                    !Selected background color
APla4:Instructie       LIKE(APla4:Instructie)         !List box control field - type derived from field
APla4:Instructie_NormalFG LONG                        !Normal forground color
APla4:Instructie_NormalBG LONG                        !Normal background color
APla4:Instructie_SelectedFG LONG                      !Selected forground color
APla4:Instructie_SelectedBG LONG                      !Selected background color
APla4:VerpakkingOmschrijving LIKE(APla4:VerpakkingOmschrijving) !List box control field - type derived from field
APla4:VerpakkingOmschrijving_NormalFG LONG            !Normal forground color
APla4:VerpakkingOmschrijving_NormalBG LONG            !Normal background color
APla4:VerpakkingOmschrijving_SelectedFG LONG          !Selected forground color
APla4:VerpakkingOmschrijving_SelectedBG LONG          !Selected background color
APla4:Planning_TIME    LIKE(APla4:Planning_TIME)      !List box control field - type derived from field
APla4:Planning_TIME_NormalFG LONG                     !Normal forground color
APla4:Planning_TIME_NormalBG LONG                     !Normal background color
APla4:Planning_TIME_SelectedFG LONG                   !Selected forground color
APla4:Planning_TIME_SelectedBG LONG                   !Selected background color
LOC:OverboekingPallets2 LIKE(LOC:OverboekingPallets2) !List box control field - type derived from local data
LOC:OverboekingPallets2_NormalFG LONG                 !Normal forground color
LOC:OverboekingPallets2_NormalBG LONG                 !Normal background color
LOC:OverboekingPallets2_SelectedFG LONG               !Selected forground color
LOC:OverboekingPallets2_SelectedBG LONG               !Selected background color
APla4:OverboekSoort    LIKE(APla4:OverboekSoort)      !List box control field - type derived from field
APla4:OverboekSoort_NormalFG LONG                     !Normal forground color
APla4:OverboekSoort_NormalBG LONG                     !Normal background color
APla4:OverboekSoort_SelectedFG LONG                   !Selected forground color
APla4:OverboekSoort_SelectedBG LONG                   !Selected background color
APla4:MutatieGemaakt   LIKE(APla4:MutatieGemaakt)     !List box control field - type derived from field
APla4:MutatieGemaakt_NormalFG LONG                    !Normal forground color
APla4:MutatieGemaakt_NormalBG LONG                    !Normal background color
APla4:MutatieGemaakt_SelectedFG LONG                  !Selected forground color
APla4:MutatieGemaakt_SelectedBG LONG                  !Selected background color
APla4:MutatieGemaakt_Icon LONG                        !Entry's icon ID
LOC:Getransferd        LIKE(LOC:Getransferd)          !List box control field - type derived from local data
LOC:Getransferd_NormalFG LONG                         !Normal forground color
LOC:Getransferd_NormalBG LONG                         !Normal background color
LOC:Getransferd_SelectedFG LONG                       !Selected forground color
LOC:Getransferd_SelectedBG LONG                       !Selected background color
LOC:Getransferd_Icon   LONG                           !Entry's icon ID
APla4:Verwerkt         LIKE(APla4:Verwerkt)           !List box control field - type derived from field
APla4:Verwerkt_NormalFG LONG                          !Normal forground color
APla4:Verwerkt_NormalBG LONG                          !Normal background color
APla4:Verwerkt_SelectedFG LONG                        !Selected forground color
APla4:Verwerkt_SelectedBG LONG                        !Selected background color
APla4:Verwerkt_Icon    LONG                           !Entry's icon ID
APla4:CelOms           LIKE(APla4:CelOms)             !List box control field - type derived from field
APla4:CelOms_NormalFG  LONG                           !Normal forground color
APla4:CelOms_NormalBG  LONG                           !Normal background color
APla4:CelOms_SelectedFG LONG                          !Selected forground color
APla4:CelOms_SelectedBG LONG                          !Selected background color
APla4:Locatienaam      LIKE(APla4:Locatienaam)        !List box control field - type derived from field
APla4:Locatienaam_NormalFG LONG                       !Normal forground color
APla4:Locatienaam_NormalBG LONG                       !Normal background color
APla4:Locatienaam_SelectedFG LONG                     !Selected forground color
APla4:Locatienaam_SelectedBG LONG                     !Selected background color
APla4:NaarCelOms       LIKE(APla4:NaarCelOms)         !List box control field - type derived from field
APla4:NaarCelOms_NormalFG LONG                        !Normal forground color
APla4:NaarCelOms_NormalBG LONG                        !Normal background color
APla4:NaarCelOms_SelectedFG LONG                      !Selected forground color
APla4:NaarCelOms_SelectedBG LONG                      !Selected background color
APla4:NaarLocatienaam  LIKE(APla4:NaarLocatienaam)    !List box control field - type derived from field
APla4:NaarLocatienaam_NormalFG LONG                   !Normal forground color
APla4:NaarLocatienaam_NormalBG LONG                   !Normal background color
APla4:NaarLocatienaam_SelectedFG LONG                 !Selected forground color
APla4:NaarLocatienaam_SelectedBG LONG                 !Selected background color
APla4:Transport        LIKE(APla4:Transport)          !List box control field - type derived from field
APla4:Transport_NormalFG LONG                         !Normal forground color
APla4:Transport_NormalBG LONG                         !Normal background color
APla4:Transport_SelectedFG LONG                       !Selected forground color
APla4:Transport_SelectedBG LONG                       !Selected background color
APla4:PlanningID       LIKE(APla4:PlanningID)         !Browse hot field - type derived from field
APla4:KG               LIKE(APla4:KG)                 !Browse hot field - type derived from field
APla4:MutatieKG        LIKE(APla4:MutatieKG)          !Browse hot field - type derived from field
APla4:Pallets          LIKE(APla4:Pallets)            !Browse hot field - type derived from field
APla4:MutatiePallets   LIKE(APla4:MutatiePallets)     !Browse hot field - type derived from field
APla4:Planning         LIKE(APla4:Planning)           !Browse key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
BRW12::View:Browse   VIEW(APlanningVerkoop)
                       PROJECT(APla3:ArtikelID)
                       PROJECT(APla3:ArtikelOms)
                       PROJECT(APla3:FirmaNaam)
                       PROJECT(APla3:PartijID)
                       PROJECT(APla3:ExternPartijnr)
                       PROJECT(APla3:Instructie)
                       PROJECT(APla3:VerpakkingOmschrijving)
                       PROJECT(APla3:Planning_TIME)
                       PROJECT(APla3:MutatieGemaakt)
                       PROJECT(APla3:Geprint)
                       PROJECT(APla3:Verwerkt)
                       PROJECT(APla3:Gewogen)
                       PROJECT(APla3:CelOms)
                       PROJECT(APla3:HerkomstOverboekingCelOms)
                       PROJECT(APla3:LeverancierFirmaNaam)
                       PROJECT(APla3:Transport)
                       PROJECT(APla3:PlanningID)
                       PROJECT(APla3:VerkoopID)
                       PROJECT(APla3:CelID)
                       PROJECT(APla3:MutatieKG)
                       PROJECT(APla3:KG)
                       PROJECT(APla3:Pallets)
                       PROJECT(APla3:MutatiePallets)
                       PROJECT(APla3:Planning)
                     END
Queue:Browse:5       QUEUE                            !Queue declaration for browse/combo box using ?VerkoopList:2
APla3:ArtikelID        LIKE(APla3:ArtikelID)          !List box control field - type derived from field
APla3:ArtikelID_NormalFG LONG                         !Normal forground color
APla3:ArtikelID_NormalBG LONG                         !Normal background color
APla3:ArtikelID_SelectedFG LONG                       !Selected forground color
APla3:ArtikelID_SelectedBG LONG                       !Selected background color
APla3:ArtikelOms       LIKE(APla3:ArtikelOms)         !List box control field - type derived from field
APla3:ArtikelOms_NormalFG LONG                        !Normal forground color
APla3:ArtikelOms_NormalBG LONG                        !Normal background color
APla3:ArtikelOms_SelectedFG LONG                      !Selected forground color
APla3:ArtikelOms_SelectedBG LONG                      !Selected background color
APla3:FirmaNaam        LIKE(APla3:FirmaNaam)          !List box control field - type derived from field
APla3:FirmaNaam_NormalFG LONG                         !Normal forground color
APla3:FirmaNaam_NormalBG LONG                         !Normal background color
APla3:FirmaNaam_SelectedFG LONG                       !Selected forground color
APla3:FirmaNaam_SelectedBG LONG                       !Selected background color
APla3:PartijID         LIKE(APla3:PartijID)           !List box control field - type derived from field
APla3:PartijID_NormalFG LONG                          !Normal forground color
APla3:PartijID_NormalBG LONG                          !Normal background color
APla3:PartijID_SelectedFG LONG                        !Selected forground color
APla3:PartijID_SelectedBG LONG                        !Selected background color
APla3:ExternPartijnr   LIKE(APla3:ExternPartijnr)     !List box control field - type derived from field
APla3:ExternPartijnr_NormalFG LONG                    !Normal forground color
APla3:ExternPartijnr_NormalBG LONG                    !Normal background color
APla3:ExternPartijnr_SelectedFG LONG                  !Selected forground color
APla3:ExternPartijnr_SelectedBG LONG                  !Selected background color
LOC:VerkoopKG2         LIKE(LOC:VerkoopKG2)           !List box control field - type derived from local data
LOC:VerkoopKG2_NormalFG LONG                          !Normal forground color
LOC:VerkoopKG2_NormalBG LONG                          !Normal background color
LOC:VerkoopKG2_SelectedFG LONG                        !Selected forground color
LOC:VerkoopKG2_SelectedBG LONG                        !Selected background color
APla3:Instructie       LIKE(APla3:Instructie)         !List box control field - type derived from field
APla3:Instructie_NormalFG LONG                        !Normal forground color
APla3:Instructie_NormalBG LONG                        !Normal background color
APla3:Instructie_SelectedFG LONG                      !Selected forground color
APla3:Instructie_SelectedBG LONG                      !Selected background color
APla3:Instructie_Tip   STRING(80)                     !Field tooltip
APla3:VerpakkingOmschrijving LIKE(APla3:VerpakkingOmschrijving) !List box control field - type derived from field
APla3:VerpakkingOmschrijving_NormalFG LONG            !Normal forground color
APla3:VerpakkingOmschrijving_NormalBG LONG            !Normal background color
APla3:VerpakkingOmschrijving_SelectedFG LONG          !Selected forground color
APla3:VerpakkingOmschrijving_SelectedBG LONG          !Selected background color
APla3:Planning_TIME    LIKE(APla3:Planning_TIME)      !List box control field - type derived from field
APla3:Planning_TIME_NormalFG LONG                     !Normal forground color
APla3:Planning_TIME_NormalBG LONG                     !Normal background color
APla3:Planning_TIME_SelectedFG LONG                   !Selected forground color
APla3:Planning_TIME_SelectedBG LONG                   !Selected background color
LOC:VerkoopPallets2    LIKE(LOC:VerkoopPallets2)      !List box control field - type derived from local data
LOC:VerkoopPallets2_NormalFG LONG                     !Normal forground color
LOC:VerkoopPallets2_NormalBG LONG                     !Normal background color
LOC:VerkoopPallets2_SelectedFG LONG                   !Selected forground color
LOC:VerkoopPallets2_SelectedBG LONG                   !Selected background color
APla3:MutatieGemaakt   LIKE(APla3:MutatieGemaakt)     !List box control field - type derived from field
APla3:MutatieGemaakt_NormalFG LONG                    !Normal forground color
APla3:MutatieGemaakt_NormalBG LONG                    !Normal background color
APla3:MutatieGemaakt_SelectedFG LONG                  !Selected forground color
APla3:MutatieGemaakt_SelectedBG LONG                  !Selected background color
APla3:MutatieGemaakt_Icon LONG                        !Entry's icon ID
APla3:Geprint          LIKE(APla3:Geprint)            !List box control field - type derived from field
APla3:Geprint_NormalFG LONG                           !Normal forground color
APla3:Geprint_NormalBG LONG                           !Normal background color
APla3:Geprint_SelectedFG LONG                         !Selected forground color
APla3:Geprint_SelectedBG LONG                         !Selected background color
APla3:Geprint_Icon     LONG                           !Entry's icon ID
APla3:Verwerkt         LIKE(APla3:Verwerkt)           !List box control field - type derived from field
APla3:Verwerkt_NormalFG LONG                          !Normal forground color
APla3:Verwerkt_NormalBG LONG                          !Normal background color
APla3:Verwerkt_SelectedFG LONG                        !Selected forground color
APla3:Verwerkt_SelectedBG LONG                        !Selected background color
APla3:Verwerkt_Icon    LONG                           !Entry's icon ID
APla3:Gewogen          LIKE(APla3:Gewogen)            !List box control field - type derived from field
APla3:Gewogen_NormalFG LONG                           !Normal forground color
APla3:Gewogen_NormalBG LONG                           !Normal background color
APla3:Gewogen_SelectedFG LONG                         !Selected forground color
APla3:Gewogen_SelectedBG LONG                         !Selected background color
APla3:Gewogen_Icon     LONG                           !Entry's icon ID
APla3:CelOms           LIKE(APla3:CelOms)             !List box control field - type derived from field
APla3:CelOms_NormalFG  LONG                           !Normal forground color
APla3:CelOms_NormalBG  LONG                           !Normal background color
APla3:CelOms_SelectedFG LONG                          !Selected forground color
APla3:CelOms_SelectedBG LONG                          !Selected background color
LOC:Locatienaam        LIKE(LOC:Locatienaam)          !List box control field - type derived from local data
LOC:Locatienaam_NormalFG LONG                         !Normal forground color
LOC:Locatienaam_NormalBG LONG                         !Normal background color
LOC:Locatienaam_SelectedFG LONG                       !Selected forground color
LOC:Locatienaam_SelectedBG LONG                       !Selected background color
APla3:HerkomstOverboekingCelOms LIKE(APla3:HerkomstOverboekingCelOms) !List box control field - type derived from field
APla3:HerkomstOverboekingCelOms_NormalFG LONG         !Normal forground color
APla3:HerkomstOverboekingCelOms_NormalBG LONG         !Normal background color
APla3:HerkomstOverboekingCelOms_SelectedFG LONG       !Selected forground color
APla3:HerkomstOverboekingCelOms_SelectedBG LONG       !Selected background color
APla3:LeverancierFirmaNaam LIKE(APla3:LeverancierFirmaNaam) !List box control field - type derived from field
APla3:LeverancierFirmaNaam_NormalFG LONG              !Normal forground color
APla3:LeverancierFirmaNaam_NormalBG LONG              !Normal background color
APla3:LeverancierFirmaNaam_SelectedFG LONG            !Selected forground color
APla3:LeverancierFirmaNaam_SelectedBG LONG            !Selected background color
APla3:Transport        LIKE(APla3:Transport)          !List box control field - type derived from field
APla3:Transport_NormalFG LONG                         !Normal forground color
APla3:Transport_NormalBG LONG                         !Normal background color
APla3:Transport_SelectedFG LONG                       !Selected forground color
APla3:Transport_SelectedBG LONG                       !Selected background color
APla3:Transport_Tip    STRING(80)                     !Field tooltip
APla3:PlanningID       LIKE(APla3:PlanningID)         !List box control field - type derived from field
APla3:PlanningID_NormalFG LONG                        !Normal forground color
APla3:PlanningID_NormalBG LONG                        !Normal background color
APla3:PlanningID_SelectedFG LONG                      !Selected forground color
APla3:PlanningID_SelectedBG LONG                      !Selected background color
APla3:PlanningID_Tip   STRING(80)                     !Field tooltip
APla3:VerkoopID        LIKE(APla3:VerkoopID)          !Browse hot field - type derived from field
APla3:CelID            LIKE(APla3:CelID)              !Browse hot field - type derived from field
APla3:MutatieKG        LIKE(APla3:MutatieKG)          !Browse hot field - type derived from field
LOC:Getransferd        LIKE(LOC:Getransferd)          !Browse hot field - type derived from local data
APla3:KG               LIKE(APla3:KG)                 !Browse hot field - type derived from field
APla3:Pallets          LIKE(APla3:Pallets)            !Browse hot field - type derived from field
APla3:MutatiePallets   LIKE(APla3:MutatiePallets)     !Browse hot field - type derived from field
APla3:Planning         LIKE(APla3:Planning)           !Browse key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
BRW11::View:Browse   VIEW(Activiteit)
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
Queue:Browse:6       QUEUE                            !Queue declaration for browse/combo box using ?List
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
NetLocalDependancies    String('|PlanningInkoop|PlanningVerkoop|PlanningOverboeking|APlanningInkoop|APlanningOverboeking|APlanningVerkoop|Activiteit|AAPlanningVerkoop|')
QuickWindow          WINDOW('Planning'),AT(,,851,396),FONT('MS Sans Serif',8,,,CHARSET:DEFAULT),RESIZE,MAXIMIZE, |
  CENTER,GRAY,MAX,MDI,HLP('BrowsePlanning'),SYSTEM,IMM
                       BUTTON,AT(413,0,33,31),USE(?Calendar),ICON(ICON:Zoom)
                       SHEET,AT(-1,16,850,361),USE(?SHEET2)
                         TAB('Alles'),USE(?Inkoop:2)
                           LIST,AT(4,51,838,75),USE(?InkoopList),HVSCROLL,FORMAT('[30L(2)|M*~ID~C(0)@s30@70L(2)|M*' & |
  '~Omschrijving~C(0)@s60@]|M~Artikel~110L(2)|M*~Leverancier~C(0)@s50@40R(2)|M*~KG~C(0)' & |
  '@n-14`2@170L(2)|M*~Instructie~C(0)@s100@50L(2)|M*~Verpakking~C(0)@s50@22L(2)|M*~Tijd' & |
  '~C(0)@t7@30R(2)|M*~Pallets~C(1)@n_10@20C(2)|M*I~Inslag~C(0)@p p@20C(2)|M*I~Print~C(0' & |
  ')@p p@30C(2)|M*I~Transfer~C(0)@p p@30C(2)|M*I~Verwerkt~C(0)@p p@30C(2)|M*I~Gewogen~C' & |
  '(0)@p p@[30L(2)|M*~Cel~C(0)@s50@30L(2)|M*~Locatie~C(0)@s50@]|M~Cel~86L(2)|M*~Transpo' & |
  'rt~C(0)@s100@50R(2)|M*~Planning-ID~C(2)@n_10@'),FROM(Queue:Browse),IMM
                           BUTTON('Inslag'),AT(7,130,53),USE(?InkoopInslag),COLOR(00EBCE87h)
                           BUTTON('Palletstickers'),AT(309,130,57),USE(?InkoopPrint),COLOR(0000D7FFh)
                           BUTTON('Verwerkt'),AT(137,130),USE(?InkoopVerwerk),COLOR(00EBCE87h)
                           LIST,AT(4,281,838,75),USE(?VerkoopList),HVSCROLL,FORMAT('[30L(2)|M*~ID~C(0)@s30@70L(2)|' & |
  'M*~Omschrijving~C(0)@s60@]|M~Artikel~110L(2)|M*~Afnemer~C(0)@s50@[30R(2)|M*~Intern~C' & |
  '(0)@n_10B@30R(2)|M*~Extern~C(1)@s20@](82)|M~Partij-nummer~40R(2)|M*~KG~C(0)@n-14`2@1' & |
  '70L(2)|M*P~Instructie~C(2)@s100@50L(2)|M*~Verpakking~C(0)@s50@22L(2)|M*~Tijd~C(0)@t7' & |
  '@30R(2)|M*~Pallets~C(1)@n_10@22R(2)|M*I~Uitslag~C(0)@p p@20C(2)|M*I~Print~C(0)@p p@3' & |
  '0C(2)|M*I~Verwerkt~C(0)@p p@30C(2)|M*I~Gewogen~C(0)@p p@[20L(2)|M*@s50@40L(2)|M*@s50' & |
  '@]|M~Cel~50L(2)|M*~Herkomst Cel~C(0)@s50@50L(2)|M*~Leverancier~C(0)@s50@50L(2)|M*P~T' & |
  'ransport~C(0)@s100@60R(2)|M*P~Planning ID~C(0)@n_10@'),FROM(Queue:Browse:1),IMM,TIP('?')
                           BUTTON('Handmatig verwerken'),AT(757,33),USE(?InkoopHVerwerkt),COLOR(00EBCE87h)
                           BUTTON('Verwerkt'),AT(137,360),USE(?VerkoopVerwerkt),COLOR(00EBCE87h)
                           BUTTON('Print CMR'),AT(371,360),USE(?VerkoopPrintCMR),COLOR(0000D7FFh)
                           BUTTON('Uitslag'),AT(7,360,53),USE(?VerkoopUitslag),COLOR(00EBCE87h)
                           BUTTON('Overboeken'),AT(7,242,53),USE(?OverboekDoen),COLOR(00EBCE87h)
                           BUTTON('Handmatig verwerken'),AT(757,264),USE(?VerkoopHVerwerkt),COLOR(00EBCE87h)
                           BUTTON('Verwerkt'),AT(137,242),USE(?OverboekVerwerkt),COLOR(00EBCE87h)
                           BUTTON('Transfers'),AT(793,242,50),USE(?Ritten),COLOR(00CBC0FFh)
                           BUTTON('Bulk Overboeken'),AT(63,242),USE(?BulkOverboeken),COLOR(00EBCE87h)
                           BUTTON('Palletstickers'),AT(309,242),USE(?PrintOverboekingStickers),COLOR(0000D7FFh)
                           BUTTON('Transfers'),AT(793,131,50),USE(?TransferInkoopButton),COLOR(00CBC0FFh)
                           LIST,AT(4,165,838,75),USE(?OverboekList),HVSCROLL,FORMAT('[30L(2)|M*~ID~C(0)@s30@70L(2)' & |
  '|M*~Omschrijving~C(0)@s60@]|M~Artikel~110L(2)|M*~Leverancier~C(0)@s50@[30R(2)|M*~Int' & |
  'ern~C(0)@n_10B@30R(2)|M*~Extern~C(1)@s20@]|M~Partij-nummer~40R(2)|M*~KG~C(0)@n-14`2@' & |
  '51R(2)|M*~Overboek Soort~L(0)@s50@170L(2)|M*~Instructie~C(0)@s100@50L(2)|M*~Verpakki' & |
  'ng~C(0)@s50@22R(2)|M*~Tijd~C(0)@t7@30R(2)|M*~Pallets~C(1)@n_10@43R(2)|M*I~Overgeboek' & |
  't~C(0)@p p@35C(2)|M*I~Transfer~C(0)@p p@35C(2)|M*I~Verwerkt~C(0)@p p@[20L(2)|M*~Van~' & |
  'C(0)@s50@50L(2)|M*~Locatie~C(0)@s50@20L(2)|M*~Naar~C(0)@s50@200L(2)|M*~Locatienaam~C' & |
  '(0)@s50@](144)|M~Cel~50L(2)|M*~Transport~C(0)@s100@'),FROM(Queue:Browse:2),IMM,MSG('Browsing Records')
                           PROMPT('Verkopen'),AT(5,267),USE(?VerkopenString),FONT('Microsoft Sans Serif',,,FONT:bold)
                           STRING('Overboekingen'),AT(7,151),USE(?OverboekingString),FONT('Microsoft Sans Serif',,,FONT:bold)
                           STRING('Inkopen'),AT(5,36),USE(?InkoopString),FONT('Microsoft Sans Serif',,,FONT:bold)
                           BUTTON('Uitslag via weging'),AT(63,360,71),USE(?UitslagWeging),COLOR(00EBCE87h)
                           BUTTON('Inslag via weging'),AT(63,130,71),USE(?InslagWeging),COLOR(00EBCE87h)
                           BUTTON('Weeglijst'),AT(637,130),USE(?WeeglijstInkoop),COLOR(00DDA0DDh)
                           BUTTON('Weeglijst (Excel)'),AT(684,130),USE(?WeeglijstExcelInkoop),COLOR(00DDA0DDh)
                           BUTTON('Weeglijst (Excel)'),AT(684,360,69,14),USE(?WeeglijstExcelVerkoop),COLOR(00DDA0DDh)
                           BUTTON('Weeglijst'),AT(637,360,44,14),USE(?WeeglijstVerkoop),COLOR(00DDA0DDh)
                           BUTTON('Inslag-rapport'),AT(247,130),USE(?PrintInslagRapport),COLOR(0000D7FFh)
                           BUTTON('Uitslag-rapport'),AT(247,360,59),USE(?PrintUitslagRapport),COLOR(0000D7FFh)
                           BUTTON('Terugdraaien'),AT(184,360),USE(?VerkoopTerugdraaienButton),COLOR(00EBCE87h)
                           BUTTON('Terugdraaien'),AT(184,130,58),USE(?InkoopTerugdraaienButton),COLOR(00EBCE87h)
                           BUTTON('Rapport'),AT(594,242,38,14),USE(?OverboekRapport),COLOR(0000D7FFh)
                           BUTTON('Sjabloon'),AT(549,360),USE(?VerkoopSjabloon),COLOR(0000D7FFh)
                           BUTTON('Sjabloon'),AT(549,242,43,14),USE(?OverboekSjabloon),COLOR(0000D7FFh)
                           BUTTON('Rapport'),AT(594,360,38),USE(?VerkoopRapport),COLOR(0000D7FFh)
                           BUTTON('Palletbladen'),AT(421,360,48,14),USE(?VerkoopPrintPalletblad),COLOR(0000D7FFh)
                           BUTTON('Palletstickers'),AT(309,360,57,14),USE(?PrintVerkoopStickers),COLOR(0000D7FFh)
                           BUTTON('Palletbladen (Export)'),AT(473,360,72,14),USE(?VerkoopPalletbladExport),COLOR(0000D7FFh)
                         END
                         TAB('Inkoop'),USE(?TAB1)
                           LIST,AT(5,52,839,300),USE(?InkoopList2),HVSCROLL,FORMAT('[30L(2)|M*~ID~C(0)@s30@70L(2)|' & |
  'M*~Omschrijving~C(0)@s60@]|M~Artikel~110L(2)|M*~Leverancier~C(0)@s50@40R(2)|M*~KG~C(' & |
  '0)@n-14`2@170L(2)|M*~Instructie~C(0)@s100@50L(2)|M*~Verpakking~C(0)@s50@22R(2)|M*~Ti' & |
  'jd~C(0)@t7@30R(2)|M*~Pallets~C(1)@n_10@20C(2)|M*I~Inslag~C(0)@p p@20C(2)|M*I~Print~C' & |
  '(0)@p p@30C(2)|M*I~Transfer~C(0)@p p@30C(2)|M*I~Verwerkt~C(0)@p p@30C(2)|M*I~Gewogen' & |
  '~C(0)@p p@[30L(2)|M*~Cel~C(0)@s50@30L(2)|M*~Locatie~C(0)@s50@]|M~Cel~86L(2)|M*~Trans' & |
  'port~C(0)@s100@50R(2)|M*~Planning-ID~C(2)@n_10@'),FROM(Queue:Browse:3),IMM
                           BUTTON('Verwerkt'),AT(131,356,43,14),USE(?InkoopVerwerk2),COLOR(00EBCE87h)
                           BUTTON('Palletstickers'),AT(365,357,57,14),USE(?InkoopPrint2),COLOR(0000D7FFh)
                           BUTTON('Inslag'),AT(5,356,53,14),USE(?InkoopInslag2),COLOR(00EBCE87h)
                           BUTTON('Transfers'),AT(796,357,50,14),USE(?TransferButton2),COLOR(00CBC0FFh)
                           BUTTON('Handmatig verwerken'),AT(680,34,85,14),USE(?InkoopHVerwerkt2),COLOR(00EBCE87h)
                           BUTTON('Inslag via weging'),AT(61,356,65),USE(?InslagWeging2),COLOR(00EBCE87h)
                           BUTTON('Weeglijst'),AT(629,356,44,14),USE(?Weeglijst2),COLOR(00DDA0DDh)
                           BUTTON('Weeglijst (Excel)'),AT(677,356,69,14),USE(?WeeglijstExcel2),COLOR(00DDA0DDh)
                           BUTTON('Inslag-rapport'),AT(302,357),USE(?InslagRapportButton2),COLOR(0000D7FFh)
                           BUTTON('Terugdraaien'),AT(178,357),USE(?InkoopTerugdraaien2),COLOR(00EBCE87h)
                           BUTTON('Kwaliteit'),AT(240,357,58,14),USE(?InkoopKwaliteit),COLOR(00EBCE87h)
                         END
                         TAB('Overboeken'),USE(?TAB2)
                           LIST,AT(5,36,840,320),USE(?OverboekList2),HVSCROLL,FORMAT('[30L(2)|M*~ID~C(0)@s30@70L(2' & |
  ')|M*~Omschrijving~C(0)@s60@]|M~Artikel~110L(2)|M*~Leverancier~C(0)@s50@[30R(2)|M*~In' & |
  'tern~C(0)@n_10B@30R(2)|M*~Extern~C(1)@s20@]|M~Partij-nummer~40L(2)|M*~KG~C(0)@n-14`2' & |
  '@170L(2)|M*~Instructie~C(0)@s100@50L(2)|M*~Verpakking~C(0)@s50@22R(2)|M*~Tijd~C(0)@t' & |
  '7@30R(2)|M*~Pallets~C(1)@n_10@56L(2)|M*~Overboek Soort~@s50@30R(2)|M*I~Overboek~C(0)' & |
  '@p p@30C(2)|M*I~Transfer~C(0)@p p@30C(2)|M*I~Verwerkt~C(0)@p p@[20L(2)|M*~Van~C(0)@s' & |
  '50@50L(2)|M*~Locatie~C(0)@s50@20L(2)|M*~Naar~C(0)@s50@200L(2)|M*~Locatienaam~C(0)@s5' & |
  '0@](141)|M~Cel~50L(2)|M*~Transport~C(0)@s100@'),FROM(Queue:Browse:4),IMM,MSG('Browsing Records')
                           BUTTON('Palletstickers'),AT(307,359,57,14),USE(?OverboekPrintStickers3),COLOR(0000D7FFh)
                           BUTTON('Bulk Overboeken'),AT(58,359,71,14),USE(?BulkOverboeken3),COLOR(00EBCE87h)
                           BUTTON('Verwerkt'),AT(133,359,43,14),USE(?OverboekVerwerkt3),COLOR(00EBCE87h)
                           BUTTON('Overboeken'),AT(2,359,53,14),USE(?OverboekDoen3),COLOR(00EBCE87h)
                           BUTTON('Sjabloon'),AT(543,359,48,14),USE(?OverboekSjabloon3),COLOR(0000D7FFh)
                           BUTTON('Transfers'),AT(793,359,50,14),USE(?OverboekTransfers3),COLOR(00CBC0FFh)
                           BUTTON('Rapport'),AT(595,359,48,14),USE(?OverboekRapport3),COLOR(0000D7FFh)
                         END
                         TAB('Verkoop'),USE(?TAB3)
                           LIST,AT(4,54,841,300),USE(?VerkoopList:2),HVSCROLL,FORMAT('[30L(2)|M*~ID~C(0)@s30@70L(2' & |
  ')|M*~Omschrijving~C(0)@s60@]|M~Artikel~110L(2)|M*~Afnemer~C(0)@s50@[30R(2)|M*~Intern' & |
  '~C(0)@n_10B@30R(2)|M*~Extern~C(1)@s20@](80)|M~Partij-nummer~40R(2)|M*~KG~C(0)@n-14`2' & |
  '@170L(2)|M*P~Instructie~C(2)@s100@50L(2)|M*~Verpakking~C(0)@s50@22R(2)|M*~Tijd~C(0)@' & |
  't7@30R(2)|M*~Pallets~C(1)@n_10@22R(2)|M*I~Uitslag~C(0)@p p@20C(2)|M*I~Print~C(0)@p p' & |
  '@30C(2)|M*I~Verwerkt~C(0)@p p@30C(2)|M*I~Gewogen~C(0)@p p@[20L(2)|M*@s50@40L(2)|M*@s' & |
  '50@]|M~Cel~50L(2)|M*~Herkomst Cel~C(0)@s50@50L(2)|M*~Leverancier~C(0)@s50@50L(2)|M*P' & |
  '~Transport~C(0)@s100@60L(2)|M*P~Planning ID~L(0)@n-14@'),FROM(Queue:Browse:5),IMM
                           BUTTON('Sjabloon'),AT(545,358,39,14),USE(?VerkoopSjabloon4),COLOR(0000D7FFh)
                           BUTTON('Uitslag'),AT(3,358,41,14),USE(?VerkoopUitslag4),COLOR(00EBCE87h)
                           BUTTON('Print CMR'),AT(377,358,40,14),USE(?VerkoopPrintCMR4),COLOR(0000D7FFh)
                           BUTTON('Verwerkt'),AT(121,358,34,14),USE(?VerkoopVerwerkt4),COLOR(00EBCE87h)
                           BUTTON('Handmatig verwerken'),AT(767,35,76,14),USE(?VerkoopHVerwerkt4),COLOR(00EBCE87h)
                           BUTTON('Uitslag via weging'),AT(45,358),USE(?VerkoopUitslagWeging4),COLOR(00EBCE87h)
                           BUTTON('Weeglijst'),AT(631,358,44,14),USE(?Weeglijst4),COLOR(00DDA0DDh)
                           BUTTON('Weeglijst (Excel)'),AT(678,358,69,14),USE(?WeeglijstExcel4),COLOR(00DDA0DDh)
                           BUTTON('Uitslag-rapport'),AT(265,358,55),USE(?UitslagRapport4),COLOR(0000D7FFh)
                           BUTTON('Terugdraaien'),AT(159,358,47),USE(?VerkoopTerugdraaienButton4),COLOR(00EBCE87h)
                           BUTTON('Rapport'),AT(586,358),USE(?VerkoopRapport4),COLOR(0000D7FFh)
                           BUTTON('Palletbladen'),AT(419,358,48,14),USE(?VerkoopPrintPalletblad:2),COLOR(0000D7FFh)
                           BUTTON('Palletstickers'),AT(321,358,53,14),USE(?PrintVerkoopStickers:2),COLOR(0000D7FFh)
                           BUTTON('Palletbladen (Export)'),AT(470,358,72,14),USE(?VerkoopPalletbladExport2),COLOR(0000D7FFh)
                           BUTTON('Kwaliteit'),AT(209,359,47,14),USE(?VerkoopKwaliteit),COLOR(00EBCE87h)
                         END
                         TAB('Activiteiten'),USE(?ActiviteitTab)
                           LIST,AT(6,39,759,312),USE(?List),HVSCROLL,FORMAT('[63L(2)|M*~Datum~C(0)@d6-@40L(2)|M*~T' & |
  'ijd~C(0)@t7B@37L(2)|M*I~Uitgevoerd~C(0)@p p@200L(2)|M*~Omschrijving~@s255@]|~Activit' & |
  'eit~[30L(2)|M*~ID~C(0)@s30@66L(2)|M*~Omschrijving~C(0)@s60@]|M~Artikel~110L(2)|M*~Af' & |
  'nemer~C(0)@s50@[30R(2)|M*~Intern~C(0)@n_10B@30R(2)|M*~Extern~C(1)@s20@]|M~Partij-num' & |
  'mer~40R(2)|M*~KG~C(0)@n-14`2@[22R(2)|M*~Tijd~C(0)@t7@40R(2)|M*~Datum~C(0)@d6-@](67)|' & |
  '~Ingepland~170L(2)|M*P~Instructie~C(2)@s100@50L(2)|M*~Verpakking~C(0)@s50@30R(2)|M*~' & |
  'Pallets~C(1)@n_10@22R(2)|M*I~Uitslag~C(0)@p p@20C(2)|M*I~Print~C(0)@p p@30C(2)|M*I~V' & |
  'erwerkt~C(0)@p p@30C(2)|M*I~Gewogen~C(0)@p p@[20L(2)|M*@s50@40L(2)|M*@s50@]|M~Cel~50' & |
  'L(2)|M*~Leverancier~C(0)@s50@50L(2)|M*P~Transport~C(0)@s100@60L(2)|M*P~Planning ID~L(0)@n-14@'), |
  FROM(Queue:Browse:6),IMM
                           BUTTON('&Toevoegen'),AT(5,354,70,20),USE(?Insert),LEFT,ICON('wainsert.ico'),FLAT
                           BUTTON('&Wijzigen'),AT(78,354,59,20),USE(?Change),LEFT,ICON('wachange.ico'),FLAT
                           BUTTON('&Verwijderen'),AT(141,354,70,20),USE(?Delete),LEFT,ICON('wadelete.ico'),FLAT
                         END
                       END
                       BUTTON('&Sluiten'),AT(796,380,51,14),USE(?Close),LEFT,ICON('WACLOSE.ICO'),FLAT,MSG('Close Window'), |
  TIP('Close Window')
                       PROMPT('Planningsdatum:'),AT(207,0),USE(?Loc:DatumNu:Prompt)
                       SPIN(@d6-),AT(273,1,60,10),USE(Loc:DatumNu),FONT('Microsoft Sans Serif',,,FONT:regular,CHARSET:ANSI)
                       BUTTON,AT(338,0,35,31),USE(?Gister),ICON('ÿ<02H>ƒ<07FH>')
                       BUTTON,AT(375,0,35,31),USE(?Morgen),ICON('ÿ<02H>„<07FH>')
                       BUTTON('Excel'),AT(4,378,49),USE(?VerkoopExcel),LEFT,ICON('Excel.ico'),FLAT
                       BUTTON('&Ververs Scherm'),AT(704,380,81,14),USE(?RefreshButton),LEFT,ICON('REFRESH.ICO'),FLAT, |
  MSG('Close Window'),TIP('Close Window')
                       PANEL,AT(132,2,41,11),USE(?ActiviteitPanel),BEVEL(1),FILL(COLOR:Red),HIDE
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
TakeNewSelection       PROCEDURE(),BYTE,PROC,DERIVED
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED
GetMutatie             PROCEDURE(LONG PRM:PlanningID, String PRM:Soort) ! New method added to this class instance
InslagReport           PROCEDURE(LONG PRM:PlanningID)      ! New method added to this class instance
UitslagReport          PROCEDURE(LONG PRM:PlanningID)      ! New method added to this class instance
HandleButton           PROCEDURE(STRING PRM:Functie, STRING PRM:InkOvrVer, BOOL PRM:LosseTab) ! New method added to this class instance
RegelVerwerkt          PROCEDURE(), BYTE                   ! New method added to this class instance
GetGetransferd         PROCEDURE(LONG PRM:PlanningID), BYTE ! New method added to this class instance
                     END

Toolbar              ToolbarClass
BRW6                 CLASS(BrowseClass)                    ! Browse using ?InkoopList
Q                      &Queue:Browse                  !Reference to browse queue
Fetch                  PROCEDURE(BYTE Direction),DERIVED
ResetQueue             PROCEDURE(BYTE ResetMode),DERIVED
SetQueueRecord         PROCEDURE(),DERIVED
                     END

BRW1                 CLASS(BrowseClass)                    ! Browse using ?VerkoopList
Q                      &Queue:Browse:1                !Reference to browse queue
Fetch                  PROCEDURE(BYTE Direction),DERIVED
ResetQueue             PROCEDURE(BYTE ResetMode),DERIVED
SetQueueRecord         PROCEDURE(),DERIVED
                     END

BRW8                 CLASS(BrowseClass)                    ! Browse using ?OverboekList
Q                      &Queue:Browse:2                !Reference to browse queue
Fetch                  PROCEDURE(BYTE Direction),DERIVED
ResetQueue             PROCEDURE(BYTE ResetMode),DERIVED
SetQueueRecord         PROCEDURE(),DERIVED
                     END

BRW3                 CLASS(BrowseClass)                    ! Browse using ?InkoopList2
Q                      &Queue:Browse:3                !Reference to browse queue
Fetch                  PROCEDURE(BYTE Direction),DERIVED
ResetQueue             PROCEDURE(BYTE ResetMode),DERIVED
SetQueueRecord         PROCEDURE(),DERIVED
                     END

BRW9                 CLASS(BrowseClass)                    ! Browse using ?OverboekList2
Q                      &Queue:Browse:4                !Reference to browse queue
Fetch                  PROCEDURE(BYTE Direction),DERIVED
ResetQueue             PROCEDURE(BYTE ResetMode),DERIVED
SetQueueRecord         PROCEDURE(),DERIVED
                     END

BRW12                CLASS(BrowseClass)                    ! Browse using ?VerkoopList:2
Q                      &Queue:Browse:5                !Reference to browse queue
Fetch                  PROCEDURE(BYTE Direction),DERIVED
ResetQueue             PROCEDURE(BYTE ResetMode),DERIVED
SetQueueRecord         PROCEDURE(),DERIVED
                     END

BRW11                CLASS(BrowseClass)                    ! Browse using ?List
Q                      &Queue:Browse:6                !Reference to browse queue
Fetch                  PROCEDURE(BYTE Direction),DERIVED
Init                   PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)
PrimeRecord            PROCEDURE(BYTE SuppressClear = 0),BYTE,PROC,DERIVED
ResetQueue             PROCEDURE(BYTE ResetMode),DERIVED
SetQueueRecord         PROCEDURE(),DERIVED
                     END

Resizer              CLASS(WindowResizeClass)
Init                   PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)
                     END

Calendar5            CalendarClass
GetransferdQueue    QUEUE, PRE(TQ)
PlanningID              LONG
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
TrekLijntjes            Routine
	  Loc:Ole{'Application.Range(A'&Loc:Rij&':P'&Loc:Rij&').Select'}
	  Loc:Ole{'Application.Selection.Borders(9).Weight'}=2 ! xlEdgeBottom
      Loc:Ole{'Application.Selection.Borders(10).Weight'}=2 ! xlEdgeRight
      Loc:Ole{'Application.Selection.Borders(7).Weight'}=2 ! xlEdgeLeft
      Loc:Ole{'Application.Selection.Borders(8).Weight'}=2 ! xlEdgeTop
      Loc:Ole{'Application.Selection.Borders(11).Weight'}=2 ! xlInsideVertical
!      ?Ole{'Application.Selection.Borders(12).Weight'}=2 ! xlInsideHorizontal
Vet                     Routine
	  Loc:Ole{'Application.Range(A'&Loc:Rij&':P'&Loc:Rij&').Font.Bold'}=True
UpdateInkoopVerkoopVerwerkStatus    ROUTINE         ! de parent inkoop of verkoop of verwerkt zetten als alle regels verwerkt zijn
DATA
verkoopid       LONG
inkoopid        LONG                    
verkoopverwerkt Byte                
inkoopverwerkt  Byte                

CODE
    
	GLO:GebruikerLogHandelingOpmerking = 'BrowsePlanning - UpdateInkoopVerkoopVerwerkStatus'
	
	IF Pla:VerkoopID > 0 THEN
		verkoopid = Pla:VerkoopID
		verkoopverwerkt = true
		! kijken of er één planningregel nog niet verwerkt is 
		CLEAR(Pla:PlanningID,-1)
		SET(Pla:Planning_FK02,Pla:Planning_FK02)
		LOOP UNTIL Access:Planning.Next()
			IF Pla:VerkoopID <> verkoopid THEN BREAK.
			IF NOT(Pla:Verwerkt)
				verkoopverwerkt = false
				BREAK
			END
		END
		Ver2:VerkoopID = verkoopid
		IF Access:Verkoop.Fetch(Ver2:PK_Verkoop)
			Message('Verkoop kan niet ingelezen worden','Fout:UpdateInkoopVerkoopVerwerkStatus',Icon:Hand)
			EXIT
		END
		IF Ver2:Verwerkt <> verkoopverwerkt
            Ver2:Verwerkt = verkoopverwerkt         ! wegschrijven of de hele verkoop verwerkt is
            Access:Verkoop.Update()
            IF ERROR() THEN
                IF ERRORCODE() = 90 THEN
                    MESSAGE('Verkoop-record kon niet worden bijgewerkt | SQL Error('&FILEERRORCODE()&'):'&FILEERROR()&')')
                ELSE
                    MESSAGE('Verkoop-record kon niet worden bijgewerkt | Error('&ERRORCODE()&'):'&ERROR()&')')
                .
            .
        END    
	ELSIF Pla:InkoopID > 0 THEN
		inkoopid = Pla:InkoopID
		inkoopverwerkt = true
		CLEAR(Pla:PlanningID,-1)
		SET(Pla:Planning_FK01,Pla:Planning_FK01)
		LOOP UNTIL Access:Planning.Next()
			IF Pla:InkoopID <> inkoopid THEN BREAK.
			IF NOT(Pla:Verwerkt)
				inkoopverwerkt = false
				BREAK
			END
		END
		Ink:InkoopID = inkoopid
		IF Access:Inkoop.Fetch(Ink:PK_Inkoop)
			Message('Inkoop kan niet ingelezen worden','Fout:UpdateInkoopVerkoopVerwerkStatus',Icon:Hand)
			EXIT
        END
        IF Ink:Verwerkt <> inkoopverwerkt
            Ink:Verwerkt = inkoopverwerkt
            Access:Inkoop.Update()
            IF ERROR() THEN
                  IF ERRORCODE() = 90 THEN
                      MESSAGE('Inkoop-record kon niet worden bijgewerkt | SQL Error('&FILEERRORCODE()&'):'&FILEERROR()&')')
                  ELSE
                      MESSAGE('Inkoop-record kon niet worden bijgewerkt | Error('&ERRORCODE()&'):'&ERROR()&')')
                .
            .
        END    
	.
	GLO:GebruikerLogHandelingOpmerking = ''
ExportExcel         ROUTINE
    ! Alle gebruikte queueus vervessen (ook als deze momenteel onzichtbaar zijn)
    BRW6.ActiveInvisible = true
    BRW6.ResetQueue(Reset:Queue)
    BRW8.ActiveInvisible = true
    BRW8.ResetQueue(Reset:Queue)
    BRW1.ActiveInvisible = true
    BRW1.ResetQueue(Reset:Queue)
    
    GlobalClass.InitExcelOle
	GlobalClass.MaakExcel('')
	
	LOC:ExcelPageBreak = GETINI('Excel', 'PageBreak', '60','.\Voorraad.ini')
	
	Execute (Loc:DAtumNU%7 )+ 1
    	Loc:Ole{'Application.Range(A1).Value'}='Zondag '&Format(Loc:DAtumNU,@d6-) 
    	Loc:Ole{'Application.Range(A1).Value'}='Maandag '&Format(Loc:DAtumNU,@d6-) 
    	Loc:Ole{'Application.Range(A1).Value'}='Dinsdag '&Format(Loc:DAtumNU,@d6-) 
    	Loc:Ole{'Application.Range(A1).Value'}='Woensdag '&Format(Loc:DAtumNU,@d6-) 
    	Loc:Ole{'Application.Range(A1).Value'}='Donderdag '&Format(Loc:DAtumNU,@d6-) 
    	Loc:Ole{'Application.Range(A1).Value'}='Vrijdag '&Format(Loc:DAtumNU,@d6-) 
    	Loc:Ole{'Application.Range(A1).Value'}='Zaterdag '&Format(Loc:DAtumNU,@d6-) 
	End	

	LOC:Rij = 2
	Loc:Ole{'Application.Range(A'&Loc:Rij&').Value'}='Inkopen'
	Do Vet

	Loc:Rij+=1
   	Loc:Ole{'Application.Range(A'&Loc:Rij&').Value'}='Klant'
   	Loc:Ole{'Application.Range(B'&Loc:Rij&').Value'}='Laadtijd'
   	Loc:Ole{'Application.Range(C'&Loc:Rij&').Value'}='KG'
   	Loc:Ole{'Application.Range(D'&Loc:Rij&').Value'}='Pallets'
   	Loc:Ole{'Application.Range(E'&Loc:Rij&').Value'}='Ingeslagen'
   	Loc:Ole{'Application.Range(F'&Loc:Rij&').Value'}='Gepr.'
   	Loc:Ole{'Application.Range(G'&Loc:Rij&').Value'}='Transfer'
   	Loc:Ole{'Application.Range(H'&Loc:Rij&').Value'}='Verw.' 
   	Loc:Ole{'Application.Range(I'&Loc:Rij&').Value'}='Gewogen' 
   	Loc:Ole{'Application.Range(J'&Loc:Rij&').Value'}='Cel' 
   	Loc:Ole{'Application.Range(K'&Loc:Rij&').Value'}='Locatie' 
   	Loc:Ole{'Application.Range(L'&Loc:Rij&').Value'}='Product' 
    Loc:Ole{'Application.Range(M'&Loc:Rij&').Value'}='Instructie'
    Loc:Ole{'Application.Range(N'&Loc:Rij&').Value'}='Verpakking'
   	Loc:Ole{'Application.Range(O'&Loc:Rij&').Value'}='Transport'
	!Loc:Ole{'Application.Range(K'&Loc:Rij&').Value'}='Memo'
   	Loc:Ole{'Application.Columns(A:A).ColumnWidth'}=30
   	Loc:Ole{'Application.Columns(B:B).ColumnWidth'}=8
   	Loc:Ole{'Application.Columns(C:C).ColumnWidth'}=6
   	Loc:Ole{'Application.Columns(D:D).ColumnWidth'}=7
   	Loc:Ole{'Application.Columns(E:E).ColumnWidth'}=12
   	Loc:Ole{'Application.Columns(F:F).ColumnWidth'}=6
   	Loc:Ole{'Application.Columns(G:G).ColumnWidth'}=10
   	Loc:Ole{'Application.Columns(H:K).ColumnWidth'}=6
   	Loc:Ole{'Application.Columns(L:L).ColumnWidth'}=30
   	Loc:Ole{'Application.Columns(M:M).ColumnWidth'}=30
    Loc:Ole{'Application.Columns(N:N).ColumnWidth'}=30
    Loc:Ole{'Application.Columns(O:O).ColumnWidth'}=15
    Loc:Ole{'Application.Columns(P:P).ColumnWidth'}=30    
   	!Loc:Ole{'Application.Columns(L:L).ColumnWidth'}=15
	Do TrekLijntjes
	Do Vet
	! okay nu door de queu lopen 
		Loop i# = 1 To RECORDS(BRW6.Q)
			Loc:Rij+=1
			Get(BRW6.Q,i#)
		   	Loc:Ole{'Application.Range(A'&Loc:Rij&').Value'}=BRW6.Q.Pla2:FirmaNaam
		   	Loc:Ole{'Application.Range(B'&Loc:Rij&').Value'}=Format(BRW6.Q.Pla2:Planning_TIME,@t01)
		   	Loc:Ole{'Application.Range(C'&Loc:Rij&').Value'}=BRW6.Q.LOC:InkoopKG1
			Loc:Ole{'Application.Range(D'&Loc:Rij&').Value'}=BRW6.Q.LOC:InkoopPallets1
			IF BRW6.Q.Pla2:MutatieGemaakt = 1
				Loc:Ole{'Application.Range(E'&Loc:Rij&').Value'}='X'.
					
			IF BRW6.Q.Pla2:Geprint = 1
				Loc:Ole{'Application.Range(F'&Loc:Rij&').Value'}='X'.

			IF BRW6.Q.LOC:Getransferd = 1
				Loc:Ole{'Application.Range(G'&Loc:Rij&').Value'}='X'.
			
			IF BRW6.Q.Pla2:Verwerkt = 1
				Loc:Ole{'Application.Range(H'&Loc:Rij&').Value'}='X'.

			IF BRW6.Q.Pla2:Gewogen = 1
				Loc:Ole{'Application.Range(I'&Loc:Rij&').Value'}='X'.
				
		   	Loc:Ole{'Application.Range(J'&Loc:Rij&').Value'}=BRW6.Q.Pla2:CelOms
		   	Loc:Ole{'Application.Range(K'&Loc:Rij&').Value'}=BRW6.Q.Pla2:Locatienaam
		   	Loc:Ole{'Application.Range(L'&Loc:Rij&').Value'}=BRW6.Q.Pla2:Artikeloms
            Loc:Ole{'Application.Range(M'&Loc:Rij&').Value'}=BRW6.Q.Pla2:Instructie
            Loc:Ole{'Application.Range(N'&Loc:Rij&').Value'}=BRW6.Q.Pla2:VerpakkingOmschrijving
		   	Loc:Ole{'Application.Range(O'&Loc:Rij&').Value'}=BRW6.Q.Pla2:Transport
			Do TrekLijntjes			
		END
	
	! dan de overboeking
	!IF Loc:Rij < 20 Then Loc:Rij = 19.

	IF (Loc:Rij + RECORDS(BRW8.Q) + 3) >= LOC:ExcelPageBreak AND LOC:Rij < (LOC:ExcelPageBreak - 2) THEN 
		LOC:Rij = LOC:ExcelPageBreak - 2
	.
	
	Loc:Rij += 2
	
	Loc:Ole{'Application.Range(A'&Loc:Rij&').Value'}='Overboekingen'
	Do Vet
				
		Loc:Rij+=1
		   Loc:Ole{'Application.Range(A'&Loc:Rij&').Value'}='Partijnr. (Int./Ext.)'
		   Loc:Ole{'Application.Range(B'&Loc:Rij&').Value'}='Laadtijd'
		   Loc:Ole{'Application.Range(C'&Loc:Rij&').Value'}='KG' 
		   Loc:Ole{'Application.Range(D'&Loc:Rij&').Value'}='Pallets' 
		   Loc:Ole{'Application.Range(E'&Loc:Rij&').Value'}='Van Cel' 
		   Loc:Ole{'Application.Range(F'&Loc:Rij&').Value'}='Naar Cel' 
		   Loc:Ole{'Application.Range(G'&Loc:Rij&').Value'}='Transfer'
		   Loc:Ole{'Application.Range(H'&Loc:Rij&').Value'}='Verw.' 
		   Loc:Ole{'Application.Range(L'&Loc:Rij&').Value'}='Product' 
		   Loc:Ole{'Application.Range(M'&Loc:Rij&').Value'}='Instructie'
           Loc:Ole{'Application.Range(N'&Loc:Rij&').Value'}='Verpakking'
           Loc:Ole{'Application.Range(O'&Loc:Rij&').Value'}='Transport'
		Do TrekLijntjes
		Do Vet
		Loop i# = 1 To RECORDS(BRW8.Q)
			Loc:Rij+=1
			Get(BRW8.Q,i#)
			IF CLIP(BRW8.Q.Pla4:ExternPartijnr) = '' THEN
				Loc:Ole{'Application.Range(A'&Loc:Rij&').Value'}=CLIP(BRW8.Q.Pla4:PartijID)
			ELSE
				Loc:Ole{'Application.Range(A'&Loc:Rij&').Value'}=CLIP(BRW8.Q.Pla4:PartijID) & '/' & CLIP(BRW8.Q.Pla4:ExternPartijnr)
			.
		   	Loc:Ole{'Application.Range(B'&Loc:Rij&').Value'}=Format(BRW8.Q.Pla4:Planning_TIME,@t01)
			Loc:Ole{'Application.Range(C'&Loc:Rij&').Value'}=BRW8.Q.LOC:OverboekingKG1
			Loc:Ole{'Application.Range(D'&Loc:Rij&').Value'}=BRW8.Q.LOC:OverboekingPallets1
			Loc:Ole{'Application.Range(E'&Loc:Rij&').Value'}=BRW8.Q.Pla4:CelOms
			Loc:Ole{'Application.Range(F'&Loc:Rij&').Value'}=CLIP(BRW8.Q.Pla4:NaarCelOms) & '.' & CLIP(BRW8.Q.Pla4:Locatienaam)
			
			IF BRW8.Q.LOC:Getransferd = 1
				Loc:Ole{'Application.Range(G'&Loc:Rij&').Value'}='X'.
			
			IF BRW8.Q.Pla4:Verwerkt = 1
				Loc:Ole{'Application.Range(H'&Loc:Rij&').Value'}='X'.
			
			Loc:Ole{'Application.Range(L'&Loc:Rij&').Value'}=BRW8.Q.Pla4:Artikeloms
            Loc:Ole{'Application.Range(M'&Loc:Rij&').Value'}=BRW8.Q.Pla4:Instructie
            Loc:Ole{'Application.Range(N'&Loc:Rij&').Value'}=BRW8.Q.Pla4:VerpakkingOmschrijving
			Loc:Ole{'Application.Range(O'&Loc:Rij&').Value'}=BRW8.Q.Pla4:Transport
			Do TrekLijntjes			
		END

	! en tenslotte de uitslagen
		!IF Loc:Rij < 30 Then Loc:Rij = 29.
	IF (Loc:Rij + RECORDS(BRW1.Q) + 3) >= LOC:ExcelPageBreak AND LOC:Rij < (LOC:ExcelPageBreak - 2) THEN 
		LOC:Rij = LOC:ExcelPageBreak - 2
	.
	Loc:Rij+=2
	
	Loc:Ole{'Application.Range(A'&Loc:Rij&').Value'}='Verkopen'
	Do Vet
				
	Loc:Rij+=1
   	Loc:Ole{'Application.Range(A'&Loc:Rij&').Value'}='Afnemer'
   	Loc:Ole{'Application.Range(B'&Loc:Rij&').Value'}='Laadtijd'
   	Loc:Ole{'Application.Range(C'&Loc:Rij&').Value'}='KG' 
   	Loc:Ole{'Application.Range(D'&Loc:Rij&').Value'}='Pallets' 
    Loc:Ole{'Application.Range(E'&Loc:Rij&').Value'}='Partijnr. (Int./Ext.)'
   	Loc:Ole{'Application.Range(F'&Loc:Rij&').Value'}='Gepr.' 
	Loc:Ole{'Application.Range(G'&Loc:Rij&').Value'}=''
	Loc:Ole{'Application.Range(H'&Loc:Rij&').Value'}='Verw.'
   	Loc:Ole{'Application.Range(I'&Loc:Rij&').Value'}='Gewogen' 
   	Loc:Ole{'Application.Range(J'&Loc:Rij&').Value'}='Cel' 
   	Loc:Ole{'Application.Range(K'&Loc:Rij&').Value'}='Locatie' 
   	Loc:Ole{'Application.Range(L'&Loc:Rij&').Value'}='Product' 
   	Loc:Ole{'Application.Range(M'&Loc:Rij&').Value'}='Instructie'
    Loc:Ole{'Application.Range(N'&Loc:Rij&').Value'}='Verpakking'
    Loc:Ole{'Application.Range(O'&Loc:Rij&').Value'}='Transport'
    Loc:Ole{'Application.Range(P'&Loc:Rij&').Value'}='Leverancier'    
	!Loc:Ole{'Application.Range(K'&Loc:Rij&').Value'}='Memo'
	Do TrekLijntjes
	Do Vet
		Loop i# = 1 To RECORDS(BRW1.Q)
			Loc:Rij+=1
			Get(BRW1.Q,i#)
		   	Loc:Ole{'Application.Range(A'&Loc:Rij&').Value'}=BRW1.Q.Pla3:FirmaNaam
		   	Loc:Ole{'Application.Range(B'&Loc:Rij&').Value'}=FORMAT(BRW1.Q.Pla3:Planning_TIME,@t01)
		   	Loc:Ole{'Application.Range(C'&Loc:Rij&').Value'}=BRW1.Q.LOC:VerkoopKG1
		   	Loc:Ole{'Application.Range(D'&Loc:Rij&').Value'}=BRW1.Q.LOC:VerkoopPallets1
			IF BRW1.Q.Pla3:ExternPartijnr = 0 THEN
				IF BRW1.Q.Pla3:PartijID > 0 THEN
					Loc:Ole{'Application.Range(E'&Loc:Rij&').Value'}=CLIP(BRW1.Q.Pla3:PartijID)
				.
			ELSE
				Loc:Ole{'Application.Range(E'&Loc:Rij&').Value'}=CLIP(BRW1.Q.Pla3:PartijID) & '/' & CLIP(BRW1.Q.Pla3:ExternPartijnr)
			.
			
			IF BRW1.Q.Pla3:Geprint = 1
				Loc:Ole{'Application.Range(F'&Loc:Rij&').Value'}='X'.

			IF BRW1.Q.Pla3:Verwerkt = 1
				Loc:Ole{'Application.Range(H'&Loc:Rij&').Value'}='X'.
			
			IF BRW1.Q.Pla3:Gewogen = 1
				Loc:Ole{'Application.Range(I'&Loc:Rij&').Value'}='X'.
			
			Loc:Ole{'Application.Range(J'&Loc:Rij&').Value'}=BRW1.Q.PLA3:CelOms
			Loc:Ole{'Application.Range(K'&Loc:Rij&').Value'}=BRW1.Q.Loc:Locatienaam
            Loc:Ole{'Application.Range(L'&Loc:Rij&').Value'}=BRW1.Q.pla3:ArtikelOms
            
            Loc:Ole{'Application.Range(M'&Loc:Rij&').Value'}=BRW1.Q.Pla3:Instructie
            Loc:Ole{'Application.Range(N'&Loc:Rij&').Value'}=BRW1.Q.Pla3:VerpakkingOmschrijving            
            Loc:Ole{'Application.Range(O'&Loc:Rij&').Value'}=BRW1.Q.Pla3:Transport
		   	Loc:Ole{'Application.Range(P'&Loc:Rij&').Value'}=BRW1.Q.Pla3:LeverancierFirmaNaam
		   	!Loc:Ole{'Application.Range(L'&Loc:Rij&').Value'}=BRW1.Q.Pla:Memo
			Do TrekLijntjes
		END
   !	Loc:Ole{'Application.Columns(A:S).AutoFit'}
	Loc:Ole{'Cells.Select'}
	Loc:Ole{'Application.Selection.Font.Name'} = 'Ariel'
	Loc:Ole{'Application.Selection.Font.Size'} = 11
	
	Loc:Ole{'Application.Rows(1:'&Loc:Rij&').AutoFit'}
	Loc:Ole{'Application.ActiveSheet.PageSetup.Zoom'} = 50 != Loc:Ole{'Application.ActiveSheet.PageSetup.BlackAndWhite'}!
	Loc:Ole{'Application.ActiveSheet.PageSetup.Orientation'} = 2 != Landscape
	Loc:Ole{'Application.ActiveSheet.PageSetup.TopMargin'} = 30 != Points (1/72 inch
	Loc:Ole{'Application.ActiveSheet.PageSetup.BottomMargin'} = 30 != Points (1/72 inch
	Loc:Ole{'Application.ActiveSheet.PageSetup.LeftMargin'} = 30 != Points (1/72 inch
	Loc:Ole{'Application.ActiveSheet.PageSetup.RightMargin'} = 30 != Points (1/72 inch
	
	Loc:Ole{'Application.Visible'}=true ! nu pas excel laten zien
	Loc:Ole{'Application.ActiveWindow.SelectedSheets.PrintPreview'}
	!LOC:ExcelMacroFile = CLIP(GETINI('Excel', 'MacroXLS',,'.\Voorraad.ini'))
	
	!Loc:Ole{'Application.Workbooks.Open('&CLIP(LOC:ExcelMacroFile)&')'}
	
	!pos# = INSTRING('\', CLIP(LOC:ExcelMacroFile), -1, LEN(CLIP(LOC:ExcelMacroFile)))
	!Loc:Ole{'Application.Run('&CLIP(SUB(CLIP(LOC:ExcelMacroFile), pos# + 1, LEN(CLIP(LOC:ExcelMacroFile)) - pos#)) & '!Macro1)'}

	
ConvertDatum        ROUTINE
	IF NOT(LOC:DatumNuLast = LOC:DatumNu) THEN
		IF YEAR(LOC:DatumNu) < 2005
			Loc:DatumVanSQL = DATE(1,1,2005) - 36163
			Loc:DatumTotSQL = DATE(1,1,2005) - 36163 + 1
		ELSE
			Loc:DatumVanSQL = LOC:DatumNu - 36163
			Loc:DatumTotSQL = LOC:DatumNu - 36163 + 1
		.
		
		LOC:DatumNuLast = LOC:DatumNu

		db.DebugOut('ConvertDatum - RefreshBrowses')
		
		DO RefreshBrowses
	END
RefreshBrowses      ROUTINE
    db.DebugOut('RefreshBrowses')
	BRW1.ResetQueue(0)
	BRW3.ResetQueue(0)
    BRW6.ResetQueue(0)
    
	BRW8.ResetQueue(0)
	BRW9.ResetQueue(0)
    BRW12.ResetQueue(0)
    
    BRW11.ResetQueue(Reset:Done)
    
    !DO KleurActiviteitTab
RefreshWindow       ROUTINE
	NetRefreshPlanningViews()
    NetRefreshVoorraadViews()
        
    ThisWindow.Reset(1)
    
    DO KleurActiviteitTab
    
	EXIT
KleurActiviteitTab  ROUTINE
    ! Gekleurde tabs werken niet in Vista
    CLEAR(ACT:Record)
    ACT:Datum = LOC:DatumNu
    SET(ACT:FK2_Activiteit, ACT:FK2_Activiteit)
    LOOP UNTIL Access:Activiteit.Next()
        IF ACT:Datum <> LOC:DatumNu THEN BREAK.
        IF ACT:Uitgevoerd = 1 THEN CYCLE.
        
        UNHIDE(?ActiviteitPanel)
        EXIT
    END
    
    HIDE(?ActiviteitPanel)
    
!    IF CHOICE(?SHEET2) = 5 THEN
!        ?ActiviteitTab{PROP:Background} = LOC:ActiviteitTabColor
!    ELSE
!        CLEAR(ACT:Record)
!        ACT:Datum = LOC:DatumNu
!        SET(ACT:FK2_Activiteit, ACT:FK2_Activiteit)
!        IF Access:Activiteit.Next() = Level:Benign THEN
!            IF ACT:Datum = LOC:DatumNu THEN 
!                ?ActiviteitTab{PROP:Background} = COLOR:Red
!                EXIT
!            END
!        END
!        
!        ?ActiviteitTab{PROP:Background} = LOC:ActiviteitTabColor
!    END
!    
!    DISPLAY(?ActiviteitTab)
    

ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('BrowsePlanning')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  GLO:Planning_ThreadID = THREAD() 
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Calendar
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('LOC:DatumVanSQL',LOC:DatumVanSQL)                  ! Added by: BrowseBox(ABC)
  BIND('Loc:DatumTotSQL',Loc:DatumTotSQL)                  ! Added by: BrowseBox(ABC)
  BIND('LOC:InkoopKG1',LOC:InkoopKG1)                      ! Added by: BrowseBox(ABC)
  BIND('LOC:InkoopPallets1',LOC:InkoopPallets1)            ! Added by: BrowseBox(ABC)
  BIND('LOC:Getransferd',LOC:Getransferd)                  ! Added by: BrowseBox(ABC)
  BIND('LOC:VerkoopKG1',LOC:VerkoopKG1)                    ! Added by: BrowseBox(ABC)
  BIND('LOC:VerkoopPallets1',LOC:VerkoopPallets1)          ! Added by: BrowseBox(ABC)
  BIND('LOC:Locatienaam',LOC:Locatienaam)                  ! Added by: BrowseBox(ABC)
  BIND('LOC:OverboekingKG1',LOC:OverboekingKG1)            ! Added by: BrowseBox(ABC)
  BIND('LOC:OverboekingPallets1',LOC:OverboekingPallets1)  ! Added by: BrowseBox(ABC)
  BIND('LOC:InkoopKG2',LOC:InkoopKG2)                      ! Added by: BrowseBox(ABC)
  BIND('LOC:InkoopPallets2',LOC:InkoopPallets2)            ! Added by: BrowseBox(ABC)
  BIND('LOC:OverboekingKG2',LOC:OverboekingKG2)            ! Added by: BrowseBox(ABC)
  BIND('LOC:OverboekingPallets2',LOC:OverboekingPallets2)  ! Added by: BrowseBox(ABC)
  BIND('LOC:VerkoopKG2',LOC:VerkoopKG2)                    ! Added by: BrowseBox(ABC)
  BIND('LOC:VerkoopPallets2',LOC:VerkoopPallets2)          ! Added by: BrowseBox(ABC)
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
  Relate:AMutatie.Open                                     ! File AMutatie used by this procedure, so make sure it's RelationManager is open
  Relate:APlanning.Open                                    ! File APlanning used by this procedure, so make sure it's RelationManager is open
  Relate:APlanningInkoop.Open                              ! File APlanningInkoop used by this procedure, so make sure it's RelationManager is open
  Relate:APlanningOverboeking.Open                         ! File APlanningOverboeking used by this procedure, so make sure it's RelationManager is open
  Relate:APlanningVerkoop.Open                             ! File APlanningVerkoop used by this procedure, so make sure it's RelationManager is open
  Relate:Activiteit.Open                                   ! File Activiteit used by this procedure, so make sure it's RelationManager is open
  Relate:BulkOverboeking.Open                              ! File BulkOverboeking used by this procedure, so make sure it's RelationManager is open
  Relate:CelLocatie.SetOpenRelated()
  Relate:CelLocatie.Open                                   ! File CelLocatie used by this procedure, so make sure it's RelationManager is open
  Relate:Inkoop.SetOpenRelated()
  Relate:Inkoop.Open                                       ! File Inkoop used by this procedure, so make sure it's RelationManager is open
  Relate:Mutatie.Open                                      ! File Mutatie used by this procedure, so make sure it's RelationManager is open
  Relate:OverboekingRit.SetOpenRelated()
  Relate:OverboekingRit.Open                               ! File OverboekingRit used by this procedure, so make sure it's RelationManager is open
  Relate:Partij.Open                                       ! File Partij used by this procedure, so make sure it's RelationManager is open
  Relate:PlanningInkoop.Open                               ! File PlanningInkoop used by this procedure, so make sure it's RelationManager is open
  Relate:PlanningOverboeking.Open                          ! File PlanningOverboeking used by this procedure, so make sure it's RelationManager is open
  Relate:PlanningVerkoop.Open                              ! File PlanningVerkoop used by this procedure, so make sure it's RelationManager is open
  Relate:Sjabloon.Open                                     ! File Sjabloon used by this procedure, so make sure it's RelationManager is open
  Relate:ViewPartijCelLocaties.Open                        ! File ViewPartijCelLocaties used by this procedure, so make sure it's RelationManager is open
  Relate:ViewVoorraadCelTotaal.Open                        ! File ViewVoorraadCelTotaal used by this procedure, so make sure it's RelationManager is open
  Relate:ViewVoorraadPartij.Open                           ! File ViewVoorraadPartij used by this procedure, so make sure it's RelationManager is open
  Access:Planning.UseFile                                  ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:Verkoop.UseFile                                   ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:OverboekingRitRegel.UseFile                       ! File referenced in 'Other Files' so need to inform it's FileManager
  SELF.FilesOpened = True
  BUFFER(PlanningInkoop, 500)
  BUFFER(PlanningVerkoop, 500)
  BUFFER(PlanningOverboeking, 500)
  BUFFER(APlanningInkoop, 500)
  BUFFER(APlanningVerkoop, 500)
  BUFFER(APlanningOverboeking, 500)
  BRW6.Init(?InkoopList,Queue:Browse.ViewPosition,BRW6::View:Browse,Queue:Browse,Relate:PlanningInkoop,SELF) ! Initialize the browse manager
  BRW1.Init(?VerkoopList,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:PlanningVerkoop,SELF) ! Initialize the browse manager
  BRW1.SetUseMRP(False)
  BRW8.Init(?OverboekList,Queue:Browse:2.ViewPosition,BRW8::View:Browse,Queue:Browse:2,Relate:PlanningOverboeking,SELF) ! Initialize the browse manager
  BRW3.Init(?InkoopList2,Queue:Browse:3.ViewPosition,BRW3::View:Browse,Queue:Browse:3,Relate:APlanningInkoop,SELF) ! Initialize the browse manager
  BRW9.Init(?OverboekList2,Queue:Browse:4.ViewPosition,BRW9::View:Browse,Queue:Browse:4,Relate:APlanningOverboeking,SELF) ! Initialize the browse manager
  BRW12.Init(?VerkoopList:2,Queue:Browse:5.ViewPosition,BRW12::View:Browse,Queue:Browse:5,Relate:APlanningVerkoop,SELF) ! Initialize the browse manager
  BRW11.Init(?List,Queue:Browse:6.ViewPosition,BRW11::View:Browse,Queue:Browse:6,Relate:Activiteit,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  LOC:ActiviteitTabColor = ?ActiviteitTab{PROP:Background}
  
  !0{Prop:Text}=CLIP(0{Prop:Text}) & ' (' & CLIP(LEFT(FORMAT(GLO:Planning_ThreadID,@N_10))) & ')'
  
  IF NOT(IGB:MakenVerkoopMutatie OR IGB:Verwerken) THEN
  	DISABLE(?VerkoopHVerwerkt)
  	DISABLE(?VerkoopHVerwerkt4)
  	DISABLE(?VerkoopTerugdraaienButton)
  	DISABLE(?VerkoopTerugdraaienButton4)
  	DISABLE(?VerkoopVerwerkt)
  	DISABLE(?VerkoopVerwerkt4)
  END
  
  IF NOT(IGB:Verwerken) THEN
      DISABLE(?InkoopTerugdraaienButton)
      DISABLE(?InkoopTerugdraaien2)
      DISABLE(?InkoopVerwerk)
      DISABLE(?InkoopVerwerk2)
      DISABLE(?InkoopHVerwerkt)
      DISABLE(?InkoopHVerwerkt2)
      DISABLE(?TransferInkoopButton)
      DISABLE(?TransferButton2)
      
      DISABLE(?BulkOverboeken)
      DISABLE(?BulkOverboeken3)
      DISABLE(?OverboekVerwerkt)
      DISABLE(?OverboekVerwerkt3)
      DISABLE(?Ritten)
      DISABLE(?OverboekTransfers3)
  END
  
  IF GLO:HidePlanningInstructie THEN
      ?InkoopList{PROPLIST:Width, 5} = 0
      ?InkoopList2{PROPLIST:Width, 5} = 0
      ?VerkoopList{PROPLIST:Width, 7} = 0
      ?VerkoopList:2{PROPLIST:Width, 7} = 0
      ?OverboekList{PROPLIST:Width, 7} = 0
      ?OverboekList2{PROPLIST:Width, 7} = 0    
  END
  
  Loc:KwaliteitKnopVerbergen=GETINI('SYSTEEM','KwaliteitKnopVerbergen',True,'.\Voorraad.ini')
  ?InkoopKwaliteit{Prop:Hide}=Loc:KwaliteitKnopVerbergen
  ?VerkoopKwaliteit{Prop:Hide}=Loc:KwaliteitKnopVerbergen
  WinAlertMouseZoom()
  Do DefineListboxStyle
  BRW6.Q &= Queue:Browse
  BRW6.FileLoaded = 1                                      ! This is a 'file loaded' browse
  BRW6.AddSortOrder(,Pla2:Planning_FirmaNaam_K)            ! Add the sort order for Pla2:Planning_FirmaNaam_K for sort order 1
  BRW6.SetFilter('(Pla2:Planning >= LOC:DatumVanSQL AND Pla2:Planning << Loc:DatumTotSQL)') ! Apply filter expression to browse
  ?InkoopList{PROP:IconList,1} = '~off.ico'
  ?InkoopList{PROP:IconList,2} = '~on.ico'
  BRW6.AddField(Pla2:ArtikelID,BRW6.Q.Pla2:ArtikelID)      ! Field Pla2:ArtikelID is a hot field or requires assignment from browse
  BRW6.AddField(Pla2:ArtikelOms,BRW6.Q.Pla2:ArtikelOms)    ! Field Pla2:ArtikelOms is a hot field or requires assignment from browse
  BRW6.AddField(Pla2:FirmaNaam,BRW6.Q.Pla2:FirmaNaam)      ! Field Pla2:FirmaNaam is a hot field or requires assignment from browse
  BRW6.AddField(LOC:InkoopKG1,BRW6.Q.LOC:InkoopKG1)        ! Field LOC:InkoopKG1 is a hot field or requires assignment from browse
  BRW6.AddField(Pla2:Instructie,BRW6.Q.Pla2:Instructie)    ! Field Pla2:Instructie is a hot field or requires assignment from browse
  BRW6.AddField(Pla2:VerpakkingOmschrijving,BRW6.Q.Pla2:VerpakkingOmschrijving) ! Field Pla2:VerpakkingOmschrijving is a hot field or requires assignment from browse
  BRW6.AddField(Pla2:Planning_TIME,BRW6.Q.Pla2:Planning_TIME) ! Field Pla2:Planning_TIME is a hot field or requires assignment from browse
  BRW6.AddField(LOC:InkoopPallets1,BRW6.Q.LOC:InkoopPallets1) ! Field LOC:InkoopPallets1 is a hot field or requires assignment from browse
  BRW6.AddField(Pla2:MutatieGemaakt,BRW6.Q.Pla2:MutatieGemaakt) ! Field Pla2:MutatieGemaakt is a hot field or requires assignment from browse
  BRW6.AddField(Pla2:Geprint,BRW6.Q.Pla2:Geprint)          ! Field Pla2:Geprint is a hot field or requires assignment from browse
  BRW6.AddField(LOC:Getransferd,BRW6.Q.LOC:Getransferd)    ! Field LOC:Getransferd is a hot field or requires assignment from browse
  BRW6.AddField(Pla2:Verwerkt,BRW6.Q.Pla2:Verwerkt)        ! Field Pla2:Verwerkt is a hot field or requires assignment from browse
  BRW6.AddField(Pla2:Gewogen,BRW6.Q.Pla2:Gewogen)          ! Field Pla2:Gewogen is a hot field or requires assignment from browse
  BRW6.AddField(Pla2:CelOms,BRW6.Q.Pla2:CelOms)            ! Field Pla2:CelOms is a hot field or requires assignment from browse
  BRW6.AddField(Pla2:Locatienaam,BRW6.Q.Pla2:Locatienaam)  ! Field Pla2:Locatienaam is a hot field or requires assignment from browse
  BRW6.AddField(Pla2:Transport,BRW6.Q.Pla2:Transport)      ! Field Pla2:Transport is a hot field or requires assignment from browse
  BRW6.AddField(Pla2:PlanningID,BRW6.Q.Pla2:PlanningID)    ! Field Pla2:PlanningID is a hot field or requires assignment from browse
  BRW6.AddField(Pla2:InkoopID,BRW6.Q.Pla2:InkoopID)        ! Field Pla2:InkoopID is a hot field or requires assignment from browse
  BRW6.AddField(Pla2:KG,BRW6.Q.Pla2:KG)                    ! Field Pla2:KG is a hot field or requires assignment from browse
  BRW6.AddField(Pla2:MutatieKG,BRW6.Q.Pla2:MutatieKG)      ! Field Pla2:MutatieKG is a hot field or requires assignment from browse
  BRW6.AddField(Pla2:MutatiePallets,BRW6.Q.Pla2:MutatiePallets) ! Field Pla2:MutatiePallets is a hot field or requires assignment from browse
  BRW6.AddField(Pla2:Pallets,BRW6.Q.Pla2:Pallets)          ! Field Pla2:Pallets is a hot field or requires assignment from browse
  BRW6.AddField(Pla2:Planning,BRW6.Q.Pla2:Planning)        ! Field Pla2:Planning is a hot field or requires assignment from browse
  BRW1.Q &= Queue:Browse:1
  BRW1.FileLoaded = 1                                      ! This is a 'file loaded' browse
  BRW1.AddSortOrder(,Pla3:Planning_FirmaNaam_K)            ! Add the sort order for Pla3:Planning_FirmaNaam_K for sort order 1
  BRW1.SetFilter('(Pla3:Planning >= LOC:DatumVanSQL AND Pla3:Planning << Loc:DatumTotSQL)') ! Apply filter expression to browse
  ?VerkoopList{PROP:IconList,1} = '~off.ico'
  ?VerkoopList{PROP:IconList,2} = '~on.ico'
  BRW1.AddField(Pla3:ArtikelID,BRW1.Q.Pla3:ArtikelID)      ! Field Pla3:ArtikelID is a hot field or requires assignment from browse
  BRW1.AddField(Pla3:ArtikelOms,BRW1.Q.Pla3:ArtikelOms)    ! Field Pla3:ArtikelOms is a hot field or requires assignment from browse
  BRW1.AddField(Pla3:FirmaNaam,BRW1.Q.Pla3:FirmaNaam)      ! Field Pla3:FirmaNaam is a hot field or requires assignment from browse
  BRW1.AddField(Pla3:PartijID,BRW1.Q.Pla3:PartijID)        ! Field Pla3:PartijID is a hot field or requires assignment from browse
  BRW1.AddField(Pla3:ExternPartijnr,BRW1.Q.Pla3:ExternPartijnr) ! Field Pla3:ExternPartijnr is a hot field or requires assignment from browse
  BRW1.AddField(LOC:VerkoopKG1,BRW1.Q.LOC:VerkoopKG1)      ! Field LOC:VerkoopKG1 is a hot field or requires assignment from browse
  BRW1.AddField(Pla3:Instructie,BRW1.Q.Pla3:Instructie)    ! Field Pla3:Instructie is a hot field or requires assignment from browse
  BRW1.AddField(Pla3:VerpakkingOmschrijving,BRW1.Q.Pla3:VerpakkingOmschrijving) ! Field Pla3:VerpakkingOmschrijving is a hot field or requires assignment from browse
  BRW1.AddField(Pla3:Planning_TIME,BRW1.Q.Pla3:Planning_TIME) ! Field Pla3:Planning_TIME is a hot field or requires assignment from browse
  BRW1.AddField(LOC:VerkoopPallets1,BRW1.Q.LOC:VerkoopPallets1) ! Field LOC:VerkoopPallets1 is a hot field or requires assignment from browse
  BRW1.AddField(Pla3:MutatieGemaakt,BRW1.Q.Pla3:MutatieGemaakt) ! Field Pla3:MutatieGemaakt is a hot field or requires assignment from browse
  BRW1.AddField(Pla3:Geprint,BRW1.Q.Pla3:Geprint)          ! Field Pla3:Geprint is a hot field or requires assignment from browse
  BRW1.AddField(Pla3:Verwerkt,BRW1.Q.Pla3:Verwerkt)        ! Field Pla3:Verwerkt is a hot field or requires assignment from browse
  BRW1.AddField(Pla3:Gewogen,BRW1.Q.Pla3:Gewogen)          ! Field Pla3:Gewogen is a hot field or requires assignment from browse
  BRW1.AddField(Pla3:CelOms,BRW1.Q.Pla3:CelOms)            ! Field Pla3:CelOms is a hot field or requires assignment from browse
  BRW1.AddField(LOC:Locatienaam,BRW1.Q.LOC:Locatienaam)    ! Field LOC:Locatienaam is a hot field or requires assignment from browse
  BRW1.AddField(Pla3:HerkomstOverboekingCelOms,BRW1.Q.Pla3:HerkomstOverboekingCelOms) ! Field Pla3:HerkomstOverboekingCelOms is a hot field or requires assignment from browse
  BRW1.AddField(Pla3:LeverancierFirmaNaam,BRW1.Q.Pla3:LeverancierFirmaNaam) ! Field Pla3:LeverancierFirmaNaam is a hot field or requires assignment from browse
  BRW1.AddField(Pla3:Transport,BRW1.Q.Pla3:Transport)      ! Field Pla3:Transport is a hot field or requires assignment from browse
  BRW1.AddField(Pla3:PlanningID,BRW1.Q.Pla3:PlanningID)    ! Field Pla3:PlanningID is a hot field or requires assignment from browse
  BRW1.AddField(Pla3:VerkoopID,BRW1.Q.Pla3:VerkoopID)      ! Field Pla3:VerkoopID is a hot field or requires assignment from browse
  BRW1.AddField(Pla3:CelID,BRW1.Q.Pla3:CelID)              ! Field Pla3:CelID is a hot field or requires assignment from browse
  BRW1.AddField(LOC:Getransferd,BRW1.Q.LOC:Getransferd)    ! Field LOC:Getransferd is a hot field or requires assignment from browse
  BRW1.AddField(Pla3:KG,BRW1.Q.Pla3:KG)                    ! Field Pla3:KG is a hot field or requires assignment from browse
  BRW1.AddField(Pla3:MutatieKG,BRW1.Q.Pla3:MutatieKG)      ! Field Pla3:MutatieKG is a hot field or requires assignment from browse
  BRW1.AddField(Pla3:Pallets,BRW1.Q.Pla3:Pallets)          ! Field Pla3:Pallets is a hot field or requires assignment from browse
  BRW1.AddField(Pla3:MutatiePallets,BRW1.Q.Pla3:MutatiePallets) ! Field Pla3:MutatiePallets is a hot field or requires assignment from browse
  BRW1.AddField(Pla3:Planning,BRW1.Q.Pla3:Planning)        ! Field Pla3:Planning is a hot field or requires assignment from browse
  BRW8.Q &= Queue:Browse:2
  BRW8.FileLoaded = 1                                      ! This is a 'file loaded' browse
  BRW8.AddSortOrder(,Pla4:Planning_FirmaNaam_k)            ! Add the sort order for Pla4:Planning_FirmaNaam_k for sort order 1
  BRW8.SetFilter('(Pla4:Planning >= LOC:DatumVanSQL AND Pla4:Planning << Loc:DatumTotSQL)') ! Apply filter expression to browse
  ?OverboekList{PROP:IconList,1} = '~off.ico'
  ?OverboekList{PROP:IconList,2} = '~on.ico'
  BRW8.AddField(Pla4:ArtikelID,BRW8.Q.Pla4:ArtikelID)      ! Field Pla4:ArtikelID is a hot field or requires assignment from browse
  BRW8.AddField(Pla4:ArtikelOms,BRW8.Q.Pla4:ArtikelOms)    ! Field Pla4:ArtikelOms is a hot field or requires assignment from browse
  BRW8.AddField(Pla4:FirmaNaam,BRW8.Q.Pla4:FirmaNaam)      ! Field Pla4:FirmaNaam is a hot field or requires assignment from browse
  BRW8.AddField(Pla4:PartijID,BRW8.Q.Pla4:PartijID)        ! Field Pla4:PartijID is a hot field or requires assignment from browse
  BRW8.AddField(Pla4:ExternPartijnr,BRW8.Q.Pla4:ExternPartijnr) ! Field Pla4:ExternPartijnr is a hot field or requires assignment from browse
  BRW8.AddField(LOC:OverboekingKG1,BRW8.Q.LOC:OverboekingKG1) ! Field LOC:OverboekingKG1 is a hot field or requires assignment from browse
  BRW8.AddField(APla4:OverboekSoort,BRW8.Q.APla4:OverboekSoort) ! Field APla4:OverboekSoort is a hot field or requires assignment from browse
  BRW8.AddField(Pla4:Instructie,BRW8.Q.Pla4:Instructie)    ! Field Pla4:Instructie is a hot field or requires assignment from browse
  BRW8.AddField(Pla4:VerpakkingOmschrijving,BRW8.Q.Pla4:VerpakkingOmschrijving) ! Field Pla4:VerpakkingOmschrijving is a hot field or requires assignment from browse
  BRW8.AddField(Pla4:Planning_TIME,BRW8.Q.Pla4:Planning_TIME) ! Field Pla4:Planning_TIME is a hot field or requires assignment from browse
  BRW8.AddField(LOC:OverboekingPallets1,BRW8.Q.LOC:OverboekingPallets1) ! Field LOC:OverboekingPallets1 is a hot field or requires assignment from browse
  BRW8.AddField(Pla4:MutatieGemaakt,BRW8.Q.Pla4:MutatieGemaakt) ! Field Pla4:MutatieGemaakt is a hot field or requires assignment from browse
  BRW8.AddField(LOC:Getransferd,BRW8.Q.LOC:Getransferd)    ! Field LOC:Getransferd is a hot field or requires assignment from browse
  BRW8.AddField(Pla4:Verwerkt,BRW8.Q.Pla4:Verwerkt)        ! Field Pla4:Verwerkt is a hot field or requires assignment from browse
  BRW8.AddField(Pla4:CelOms,BRW8.Q.Pla4:CelOms)            ! Field Pla4:CelOms is a hot field or requires assignment from browse
  BRW8.AddField(Pla4:Locatienaam,BRW8.Q.Pla4:Locatienaam)  ! Field Pla4:Locatienaam is a hot field or requires assignment from browse
  BRW8.AddField(Pla4:NaarCelOms,BRW8.Q.Pla4:NaarCelOms)    ! Field Pla4:NaarCelOms is a hot field or requires assignment from browse
  BRW8.AddField(APla4:NaarLocatienaam,BRW8.Q.APla4:NaarLocatienaam) ! Field APla4:NaarLocatienaam is a hot field or requires assignment from browse
  BRW8.AddField(Pla4:Transport,BRW8.Q.Pla4:Transport)      ! Field Pla4:Transport is a hot field or requires assignment from browse
  BRW8.AddField(Pla4:PlanningID,BRW8.Q.Pla4:PlanningID)    ! Field Pla4:PlanningID is a hot field or requires assignment from browse
  BRW8.AddField(Pla4:KG,BRW8.Q.Pla4:KG)                    ! Field Pla4:KG is a hot field or requires assignment from browse
  BRW8.AddField(Pla4:MutatieKG,BRW8.Q.Pla4:MutatieKG)      ! Field Pla4:MutatieKG is a hot field or requires assignment from browse
  BRW8.AddField(Pla4:Pallets,BRW8.Q.Pla4:Pallets)          ! Field Pla4:Pallets is a hot field or requires assignment from browse
  BRW8.AddField(Pla4:MutatiePallets,BRW8.Q.Pla4:MutatiePallets) ! Field Pla4:MutatiePallets is a hot field or requires assignment from browse
  BRW8.AddField(Pla4:Planning,BRW8.Q.Pla4:Planning)        ! Field Pla4:Planning is a hot field or requires assignment from browse
  BRW3.Q &= Queue:Browse:3
  BRW3.FileLoaded = 1                                      ! This is a 'file loaded' browse
  BRW3.AddSortOrder(,APla2:Planning_FirmaNaam_K)           ! Add the sort order for APla2:Planning_FirmaNaam_K for sort order 1
  BRW3.SetFilter('(APla2:Planning >= LOC:DatumVanSQL AND APla2:Planning << Loc:DatumTotSQL)') ! Apply filter expression to browse
  ?InkoopList2{PROP:IconList,1} = '~off.ico'
  ?InkoopList2{PROP:IconList,2} = '~on.ico'
  BRW3.AddField(APla2:ArtikelID,BRW3.Q.APla2:ArtikelID)    ! Field APla2:ArtikelID is a hot field or requires assignment from browse
  BRW3.AddField(APla2:ArtikelOms,BRW3.Q.APla2:ArtikelOms)  ! Field APla2:ArtikelOms is a hot field or requires assignment from browse
  BRW3.AddField(APla2:FirmaNaam,BRW3.Q.APla2:FirmaNaam)    ! Field APla2:FirmaNaam is a hot field or requires assignment from browse
  BRW3.AddField(LOC:InkoopKG2,BRW3.Q.LOC:InkoopKG2)        ! Field LOC:InkoopKG2 is a hot field or requires assignment from browse
  BRW3.AddField(APla2:Instructie,BRW3.Q.APla2:Instructie)  ! Field APla2:Instructie is a hot field or requires assignment from browse
  BRW3.AddField(APla2:VerpakkingOmschrijving,BRW3.Q.APla2:VerpakkingOmschrijving) ! Field APla2:VerpakkingOmschrijving is a hot field or requires assignment from browse
  BRW3.AddField(APla2:Planning_TIME,BRW3.Q.APla2:Planning_TIME) ! Field APla2:Planning_TIME is a hot field or requires assignment from browse
  BRW3.AddField(LOC:InkoopPallets2,BRW3.Q.LOC:InkoopPallets2) ! Field LOC:InkoopPallets2 is a hot field or requires assignment from browse
  BRW3.AddField(APla2:MutatieGemaakt,BRW3.Q.APla2:MutatieGemaakt) ! Field APla2:MutatieGemaakt is a hot field or requires assignment from browse
  BRW3.AddField(APla2:Geprint,BRW3.Q.APla2:Geprint)        ! Field APla2:Geprint is a hot field or requires assignment from browse
  BRW3.AddField(LOC:Getransferd,BRW3.Q.LOC:Getransferd)    ! Field LOC:Getransferd is a hot field or requires assignment from browse
  BRW3.AddField(APla2:Verwerkt,BRW3.Q.APla2:Verwerkt)      ! Field APla2:Verwerkt is a hot field or requires assignment from browse
  BRW3.AddField(APla2:Gewogen,BRW3.Q.APla2:Gewogen)        ! Field APla2:Gewogen is a hot field or requires assignment from browse
  BRW3.AddField(APla2:CelOms,BRW3.Q.APla2:CelOms)          ! Field APla2:CelOms is a hot field or requires assignment from browse
  BRW3.AddField(APla2:Locatienaam,BRW3.Q.APla2:Locatienaam) ! Field APla2:Locatienaam is a hot field or requires assignment from browse
  BRW3.AddField(APla2:Transport,BRW3.Q.APla2:Transport)    ! Field APla2:Transport is a hot field or requires assignment from browse
  BRW3.AddField(APla2:PlanningID,BRW3.Q.APla2:PlanningID)  ! Field APla2:PlanningID is a hot field or requires assignment from browse
  BRW3.AddField(APla2:InkoopID,BRW3.Q.APla2:InkoopID)      ! Field APla2:InkoopID is a hot field or requires assignment from browse
  BRW3.AddField(APla2:KG,BRW3.Q.APla2:KG)                  ! Field APla2:KG is a hot field or requires assignment from browse
  BRW3.AddField(APla2:MutatieKG,BRW3.Q.APla2:MutatieKG)    ! Field APla2:MutatieKG is a hot field or requires assignment from browse
  BRW3.AddField(APla2:MutatiePallets,BRW3.Q.APla2:MutatiePallets) ! Field APla2:MutatiePallets is a hot field or requires assignment from browse
  BRW3.AddField(APla2:Pallets,BRW3.Q.APla2:Pallets)        ! Field APla2:Pallets is a hot field or requires assignment from browse
  BRW3.AddField(APla2:PartijID,BRW3.Q.APla2:PartijID)      ! Field APla2:PartijID is a hot field or requires assignment from browse
  BRW3.AddField(APla2:Planning,BRW3.Q.APla2:Planning)      ! Field APla2:Planning is a hot field or requires assignment from browse
  BRW9.Q &= Queue:Browse:4
  BRW9.FileLoaded = 1                                      ! This is a 'file loaded' browse
  BRW9.AddSortOrder(,APla4:Planning_FirmaNaam_k)           ! Add the sort order for APla4:Planning_FirmaNaam_k for sort order 1
  BRW9.SetFilter('(APla4:Planning >= LOC:DatumVanSQL AND APla4:Planning << Loc:DatumTotSQL)') ! Apply filter expression to browse
  ?OverboekList2{PROP:IconList,1} = '~off.ico'
  ?OverboekList2{PROP:IconList,2} = '~on.ico'
  BRW9.AddField(APla4:ArtikelID,BRW9.Q.APla4:ArtikelID)    ! Field APla4:ArtikelID is a hot field or requires assignment from browse
  BRW9.AddField(APla4:ArtikelOms,BRW9.Q.APla4:ArtikelOms)  ! Field APla4:ArtikelOms is a hot field or requires assignment from browse
  BRW9.AddField(APla4:FirmaNaam,BRW9.Q.APla4:FirmaNaam)    ! Field APla4:FirmaNaam is a hot field or requires assignment from browse
  BRW9.AddField(APla4:PartijID,BRW9.Q.APla4:PartijID)      ! Field APla4:PartijID is a hot field or requires assignment from browse
  BRW9.AddField(APla4:ExternPartijnr,BRW9.Q.APla4:ExternPartijnr) ! Field APla4:ExternPartijnr is a hot field or requires assignment from browse
  BRW9.AddField(LOC:OverboekingKG2,BRW9.Q.LOC:OverboekingKG2) ! Field LOC:OverboekingKG2 is a hot field or requires assignment from browse
  BRW9.AddField(APla4:Instructie,BRW9.Q.APla4:Instructie)  ! Field APla4:Instructie is a hot field or requires assignment from browse
  BRW9.AddField(APla4:VerpakkingOmschrijving,BRW9.Q.APla4:VerpakkingOmschrijving) ! Field APla4:VerpakkingOmschrijving is a hot field or requires assignment from browse
  BRW9.AddField(APla4:Planning_TIME,BRW9.Q.APla4:Planning_TIME) ! Field APla4:Planning_TIME is a hot field or requires assignment from browse
  BRW9.AddField(LOC:OverboekingPallets2,BRW9.Q.LOC:OverboekingPallets2) ! Field LOC:OverboekingPallets2 is a hot field or requires assignment from browse
  BRW9.AddField(APla4:OverboekSoort,BRW9.Q.APla4:OverboekSoort) ! Field APla4:OverboekSoort is a hot field or requires assignment from browse
  BRW9.AddField(APla4:MutatieGemaakt,BRW9.Q.APla4:MutatieGemaakt) ! Field APla4:MutatieGemaakt is a hot field or requires assignment from browse
  BRW9.AddField(LOC:Getransferd,BRW9.Q.LOC:Getransferd)    ! Field LOC:Getransferd is a hot field or requires assignment from browse
  BRW9.AddField(APla4:Verwerkt,BRW9.Q.APla4:Verwerkt)      ! Field APla4:Verwerkt is a hot field or requires assignment from browse
  BRW9.AddField(APla4:CelOms,BRW9.Q.APla4:CelOms)          ! Field APla4:CelOms is a hot field or requires assignment from browse
  BRW9.AddField(APla4:Locatienaam,BRW9.Q.APla4:Locatienaam) ! Field APla4:Locatienaam is a hot field or requires assignment from browse
  BRW9.AddField(APla4:NaarCelOms,BRW9.Q.APla4:NaarCelOms)  ! Field APla4:NaarCelOms is a hot field or requires assignment from browse
  BRW9.AddField(APla4:NaarLocatienaam,BRW9.Q.APla4:NaarLocatienaam) ! Field APla4:NaarLocatienaam is a hot field or requires assignment from browse
  BRW9.AddField(APla4:Transport,BRW9.Q.APla4:Transport)    ! Field APla4:Transport is a hot field or requires assignment from browse
  BRW9.AddField(APla4:PlanningID,BRW9.Q.APla4:PlanningID)  ! Field APla4:PlanningID is a hot field or requires assignment from browse
  BRW9.AddField(APla4:KG,BRW9.Q.APla4:KG)                  ! Field APla4:KG is a hot field or requires assignment from browse
  BRW9.AddField(APla4:MutatieKG,BRW9.Q.APla4:MutatieKG)    ! Field APla4:MutatieKG is a hot field or requires assignment from browse
  BRW9.AddField(APla4:Pallets,BRW9.Q.APla4:Pallets)        ! Field APla4:Pallets is a hot field or requires assignment from browse
  BRW9.AddField(APla4:MutatiePallets,BRW9.Q.APla4:MutatiePallets) ! Field APla4:MutatiePallets is a hot field or requires assignment from browse
  BRW9.AddField(APla4:Planning,BRW9.Q.APla4:Planning)      ! Field APla4:Planning is a hot field or requires assignment from browse
  BRW12.Q &= Queue:Browse:5
  BRW12.AddSortOrder(,APla3:Planning_FirmaNaam_K)          ! Add the sort order for APla3:Planning_FirmaNaam_K for sort order 1
  BRW12.SetFilter('(APla3:Planning >= LOC:DatumVanSQL AND APla3:Planning << Loc:DatumTotSQL)') ! Apply filter expression to browse
  ?VerkoopList:2{PROP:IconList,1} = '~off.ico'
  ?VerkoopList:2{PROP:IconList,2} = '~on.ico'
  BRW12.AddField(APla3:ArtikelID,BRW12.Q.APla3:ArtikelID)  ! Field APla3:ArtikelID is a hot field or requires assignment from browse
  BRW12.AddField(APla3:ArtikelOms,BRW12.Q.APla3:ArtikelOms) ! Field APla3:ArtikelOms is a hot field or requires assignment from browse
  BRW12.AddField(APla3:FirmaNaam,BRW12.Q.APla3:FirmaNaam)  ! Field APla3:FirmaNaam is a hot field or requires assignment from browse
  BRW12.AddField(APla3:PartijID,BRW12.Q.APla3:PartijID)    ! Field APla3:PartijID is a hot field or requires assignment from browse
  BRW12.AddField(APla3:ExternPartijnr,BRW12.Q.APla3:ExternPartijnr) ! Field APla3:ExternPartijnr is a hot field or requires assignment from browse
  BRW12.AddField(LOC:VerkoopKG2,BRW12.Q.LOC:VerkoopKG2)    ! Field LOC:VerkoopKG2 is a hot field or requires assignment from browse
  BRW12.AddField(APla3:Instructie,BRW12.Q.APla3:Instructie) ! Field APla3:Instructie is a hot field or requires assignment from browse
  BRW12.AddField(APla3:VerpakkingOmschrijving,BRW12.Q.APla3:VerpakkingOmschrijving) ! Field APla3:VerpakkingOmschrijving is a hot field or requires assignment from browse
  BRW12.AddField(APla3:Planning_TIME,BRW12.Q.APla3:Planning_TIME) ! Field APla3:Planning_TIME is a hot field or requires assignment from browse
  BRW12.AddField(LOC:VerkoopPallets2,BRW12.Q.LOC:VerkoopPallets2) ! Field LOC:VerkoopPallets2 is a hot field or requires assignment from browse
  BRW12.AddField(APla3:MutatieGemaakt,BRW12.Q.APla3:MutatieGemaakt) ! Field APla3:MutatieGemaakt is a hot field or requires assignment from browse
  BRW12.AddField(APla3:Geprint,BRW12.Q.APla3:Geprint)      ! Field APla3:Geprint is a hot field or requires assignment from browse
  BRW12.AddField(APla3:Verwerkt,BRW12.Q.APla3:Verwerkt)    ! Field APla3:Verwerkt is a hot field or requires assignment from browse
  BRW12.AddField(APla3:Gewogen,BRW12.Q.APla3:Gewogen)      ! Field APla3:Gewogen is a hot field or requires assignment from browse
  BRW12.AddField(APla3:CelOms,BRW12.Q.APla3:CelOms)        ! Field APla3:CelOms is a hot field or requires assignment from browse
  BRW12.AddField(LOC:Locatienaam,BRW12.Q.LOC:Locatienaam)  ! Field LOC:Locatienaam is a hot field or requires assignment from browse
  BRW12.AddField(APla3:HerkomstOverboekingCelOms,BRW12.Q.APla3:HerkomstOverboekingCelOms) ! Field APla3:HerkomstOverboekingCelOms is a hot field or requires assignment from browse
  BRW12.AddField(APla3:LeverancierFirmaNaam,BRW12.Q.APla3:LeverancierFirmaNaam) ! Field APla3:LeverancierFirmaNaam is a hot field or requires assignment from browse
  BRW12.AddField(APla3:Transport,BRW12.Q.APla3:Transport)  ! Field APla3:Transport is a hot field or requires assignment from browse
  BRW12.AddField(APla3:PlanningID,BRW12.Q.APla3:PlanningID) ! Field APla3:PlanningID is a hot field or requires assignment from browse
  BRW12.AddField(APla3:VerkoopID,BRW12.Q.APla3:VerkoopID)  ! Field APla3:VerkoopID is a hot field or requires assignment from browse
  BRW12.AddField(APla3:CelID,BRW12.Q.APla3:CelID)          ! Field APla3:CelID is a hot field or requires assignment from browse
  BRW12.AddField(APla3:MutatieKG,BRW12.Q.APla3:MutatieKG)  ! Field APla3:MutatieKG is a hot field or requires assignment from browse
  BRW12.AddField(LOC:Getransferd,BRW12.Q.LOC:Getransferd)  ! Field LOC:Getransferd is a hot field or requires assignment from browse
  BRW12.AddField(APla3:KG,BRW12.Q.APla3:KG)                ! Field APla3:KG is a hot field or requires assignment from browse
  BRW12.AddField(APla3:Pallets,BRW12.Q.APla3:Pallets)      ! Field APla3:Pallets is a hot field or requires assignment from browse
  BRW12.AddField(APla3:MutatiePallets,BRW12.Q.APla3:MutatiePallets) ! Field APla3:MutatiePallets is a hot field or requires assignment from browse
  BRW12.AddField(APla3:Planning,BRW12.Q.APla3:Planning)    ! Field APla3:Planning is a hot field or requires assignment from browse
  BRW11.Q &= Queue:Browse:6
  BRW11.AddSortOrder(,ACT:FK2_Activiteit)                  ! Add the sort order for ACT:FK2_Activiteit for sort order 1
  BRW11.SetFilter('(ACT:DatumTijd >= LOC:DatumVanSQL AND ACT:DatumTijd << Loc:DatumTotSQL)') ! Apply filter expression to browse
  ?List{PROP:IconList,1} = '~off.ico'
  ?List{PROP:IconList,2} = '~on.ico'
  BRW11.AddField(ACT:Datum,BRW11.Q.ACT:Datum)              ! Field ACT:Datum is a hot field or requires assignment from browse
  BRW11.AddField(ACT:Tijd,BRW11.Q.ACT:Tijd)                ! Field ACT:Tijd is a hot field or requires assignment from browse
  BRW11.AddField(ACT:Uitgevoerd,BRW11.Q.ACT:Uitgevoerd)    ! Field ACT:Uitgevoerd is a hot field or requires assignment from browse
  BRW11.AddField(ACT:Omschrijving,BRW11.Q.ACT:Omschrijving) ! Field ACT:Omschrijving is a hot field or requires assignment from browse
  BRW11.AddField(AAPla3:ArtikelID,BRW11.Q.AAPla3:ArtikelID) ! Field AAPla3:ArtikelID is a hot field or requires assignment from browse
  BRW11.AddField(AAPla3:ArtikelOms,BRW11.Q.AAPla3:ArtikelOms) ! Field AAPla3:ArtikelOms is a hot field or requires assignment from browse
  BRW11.AddField(AAPla3:FirmaNaam,BRW11.Q.AAPla3:FirmaNaam) ! Field AAPla3:FirmaNaam is a hot field or requires assignment from browse
  BRW11.AddField(AAPla3:PartijID,BRW11.Q.AAPla3:PartijID)  ! Field AAPla3:PartijID is a hot field or requires assignment from browse
  BRW11.AddField(AAPla3:ExternPartijnr,BRW11.Q.AAPla3:ExternPartijnr) ! Field AAPla3:ExternPartijnr is a hot field or requires assignment from browse
  BRW11.AddField(LOC:VerkoopKG3,BRW11.Q.LOC:VerkoopKG3)    ! Field LOC:VerkoopKG3 is a hot field or requires assignment from browse
  BRW11.AddField(AAPla3:Planning_TIME,BRW11.Q.AAPla3:Planning_TIME) ! Field AAPla3:Planning_TIME is a hot field or requires assignment from browse
  BRW11.AddField(AAPla3:Planning_DATE,BRW11.Q.AAPla3:Planning_DATE) ! Field AAPla3:Planning_DATE is a hot field or requires assignment from browse
  BRW11.AddField(AAPla3:Instructie,BRW11.Q.AAPla3:Instructie) ! Field AAPla3:Instructie is a hot field or requires assignment from browse
  BRW11.AddField(AAPla3:VerpakkingOmschrijving,BRW11.Q.AAPla3:VerpakkingOmschrijving) ! Field AAPla3:VerpakkingOmschrijving is a hot field or requires assignment from browse
  BRW11.AddField(LOC:VerkoopPallets3,BRW11.Q.LOC:VerkoopPallets3) ! Field LOC:VerkoopPallets3 is a hot field or requires assignment from browse
  BRW11.AddField(AAPla3:MutatieGemaakt,BRW11.Q.AAPla3:MutatieGemaakt) ! Field AAPla3:MutatieGemaakt is a hot field or requires assignment from browse
  BRW11.AddField(AAPla3:Geprint,BRW11.Q.AAPla3:Geprint)    ! Field AAPla3:Geprint is a hot field or requires assignment from browse
  BRW11.AddField(AAPla3:Verwerkt,BRW11.Q.AAPla3:Verwerkt)  ! Field AAPla3:Verwerkt is a hot field or requires assignment from browse
  BRW11.AddField(AAPla3:Gewogen,BRW11.Q.AAPla3:Gewogen)    ! Field AAPla3:Gewogen is a hot field or requires assignment from browse
  BRW11.AddField(AAPla3:CelOms,BRW11.Q.AAPla3:CelOms)      ! Field AAPla3:CelOms is a hot field or requires assignment from browse
  BRW11.AddField(LOC:Locatienaam3,BRW11.Q.LOC:Locatienaam3) ! Field LOC:Locatienaam3 is a hot field or requires assignment from browse
  BRW11.AddField(AAPla3:LeverancierFirmaNaam,BRW11.Q.AAPla3:LeverancierFirmaNaam) ! Field AAPla3:LeverancierFirmaNaam is a hot field or requires assignment from browse
  BRW11.AddField(AAPla3:Transport,BRW11.Q.AAPla3:Transport) ! Field AAPla3:Transport is a hot field or requires assignment from browse
  BRW11.AddField(AAPla3:PlanningID,BRW11.Q.AAPla3:PlanningID) ! Field AAPla3:PlanningID is a hot field or requires assignment from browse
  BRW11.AddField(AAPla3:MutatieKG,BRW11.Q.AAPla3:MutatieKG) ! Field AAPla3:MutatieKG is a hot field or requires assignment from browse
  BRW11.AddField(AAPla3:MutatiePallets,BRW11.Q.AAPla3:MutatiePallets) ! Field AAPla3:MutatiePallets is a hot field or requires assignment from browse
  BRW11.AddField(AAPla3:KG,BRW11.Q.AAPla3:KG)              ! Field AAPla3:KG is a hot field or requires assignment from browse
  BRW11.AddField(AAPla3:Pallets,BRW11.Q.AAPla3:Pallets)    ! Field AAPla3:Pallets is a hot field or requires assignment from browse
  BRW11.AddField(ACT:ActiviteitID,BRW11.Q.ACT:ActiviteitID) ! Field ACT:ActiviteitID is a hot field or requires assignment from browse
  BRW11.AddField(ACT:DatumTijd,BRW11.Q.ACT:DatumTijd)      ! Field ACT:DatumTijd is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Resize,Resize:SetMinSize)       ! Controls will change size as the window gets bigger
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  BRW11.AskProcedure = 7                                   ! Will call: UpdateActiviteit((LOC:DatumNu))
  BRW12.AddToolbarTarget(Toolbar)                          ! Browse accepts toolbar control
  BRW11.AddToolbarTarget(Toolbar)                          ! Browse accepts toolbar control
  SELF.SetAlerts()
  NetLocalRefreshDate = today()         ! NetTalk (NetRefresh)
  NetLocalRefreshTime = clock()
  Loc:DatumNu = TODAY()
  LOC:DatumNuLast = 0
  
  DO ConvertDatum
  SELF.Reset(1)
  		
  EnterByTabManager.Init(False)
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  FLUSH(PlanningInkoop)
  FLUSH(PlanningVerkoop)
  FLUSH(PlanningOverboeking)
  FLUSH(APlanningInkoop)
  FLUSH(APlanningVerkoop)
  FLUSH(APlanningOverboeking)
  
  GLO:Planning_ThreadID = 0
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:AMutatie.Close
    Relate:APlanning.Close
    Relate:APlanningInkoop.Close
    Relate:APlanningOverboeking.Close
    Relate:APlanningVerkoop.Close
    Relate:Activiteit.Close
    Relate:BulkOverboeking.Close
    Relate:CelLocatie.Close
    Relate:Inkoop.Close
    Relate:Mutatie.Close
    Relate:OverboekingRit.Close
    Relate:Partij.Close
    Relate:PlanningInkoop.Close
    Relate:PlanningOverboeking.Close
    Relate:PlanningVerkoop.Close
    Relate:Sjabloon.Close
    Relate:ViewPartijCelLocaties.Close
    Relate:ViewVoorraadCelTotaal.Close
    Relate:ViewVoorraadPartij.Close
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.Reset PROCEDURE(BYTE Force=0)

  CODE
  		FREE(GetransferdQueue)
  		FREE(CelLocatieQueue)
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
    EXECUTE Number
      UpdateActiviteit((LOC:DatumNu))
      UpdateActiviteit((LOC:DatumNu))
      UpdateActiviteit((LOC:DatumNu))
      UpdateActiviteit((LOC:DatumNu))
      UpdateActiviteit((LOC:DatumNu))
      UpdateActiviteit((LOC:DatumNu))
      UpdateActiviteit((LOC:DatumNu))
    END
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
    OF ?InkoopInslag
      !Get(BRW6.Q,Choice(?VerkoopList))
      !IF NOT ERROR()
      !	ThisWIndow.GetMutatie(Brw6.Q.Pla2:PlanningID,'Inslag')
      !END	
      
      db.DebugOut('INSLAG DOEN1 ' & APla:PartijID)
      
      ! Planningrecord inlezen
      Get(BRW6.Q,Choice(?InkoopList))
      APla:PlanningID = BRW6.Q.Pla2:PlanningID
      IF Access:APlanning.Fetch(APla:PK_Planning)
        Message('Planning regel kan niet ingelezen worden','Fout',Icon:Hand)
        CYCLE
      END
      
      IF APla:Verwerkt = TRUE
        Message('Planning regel is verwerkt','Waarschuwing',Icon:Hand)
        CYCLE
      END
      
      GLO:GebruikerLogHandelingOpmerking = 'InkoopInslaan'
      
      CLEAR(Par:Record)
      Par:PartijID = APla:PartijID
      IF Access:Partij.TryFetch(Par:Partij_PK) = Level:Benign
      	db.DebugOut('INSLAG DOEN2a ' & APla:PartijID)
      	GlobalRequest = ChangeRecord
      	
      	IF(APla:Gewogen)
      		WindowInslagWeging()
      	ELSE
      		WindowInslag()
      	END
      
          IF GlobalResponse = RequestCompleted
              Clear(APla:REcord)
              APla:PlanningID = BRW6.Q.Pla2:PlanningID
              IF Access:APlanning.Fetch(APla:PK_Planning)
                  Message('Planning regel kan niet ingelezen worden','Fout',Icon:Hand)
              END
      		APla:MutatieGemaakt = TRUE
      		Access:APlanning.Update()
      	END
      ELSE
      	db.DebugOut('INSLAG DOEN2b ' & APla:PartijID)
      	GlobalRequest = InsertRecord
      	WindowInslag()
      
      	IF GlobalResponse = RequestCompleted
              Clear(APla:REcord)
              APla:PlanningID = BRW6.Q.Pla2:PlanningID
              IF Access:APlanning.Fetch(APla:PK_Planning)
                  Message('Planning regel kan niet ingelezen worden','Fout',Icon:Hand)
              END
      		APla:MutatieGemaakt = TRUE
      		APla:PartijID = Par:PartijID
      		Access:APlanning.Update()
      	END
      END
      
      GLO:GebruikerLogHandelingOpmerking = ''
      DO RefreshWindow      
    OF ?InkoopPrint
              ! Planningrecord inlezen
      		Get(BRW6.Q,Choice(?InkoopList))
      		Pla:PlanningID = BRW6.Q.Pla2:PlanningID
      		IF Access:Planning.Fetch(Pla:PK_Planning)
      			Message('Planning regel kan niet ingelezen worden','Fout',Icon:Hand)
      			CYCLE
      		Else
      			if Pla:PartijID = 0
      				Message('Deze partij is nog niet ingeslagen','Fout',Icon:Hand)
      				Cycle
      			End
      			Clear(PAR:Record)
      			Par:PartijID = Pla:PartijID
      			IF Access:Partij.Fetch(Par:Partij_PK)
      				Message('Partij '&Pla:PartijID&' kan niet gevonden worden ','Fout',Icon:Hand)
      				cycle
      			End	
      		END
      
      		aantalpallets# = ReportPalletStickers()
      		IF GlobalResponse = RequestCompleted			
      			Clear(Par:Record)
      			Par:PartijID = Pla:PartijID
      			IF NOT(Access:Partij.Fetch(Par:Partij_PK))
      				Par:PalletsGeprint=Par:PalletsGeprint+aantalpallets#
      				Access:Partij.Update()
      			ELSE
      				Message('Partij '&Pla:PartijID&' kan niet gevonden worden ','Fout',Icon:Hand)
      			.
      			Pla:Geprint = TRUE
      			Access:Planning.Update()
      			!BRW6.ResetQueue(false)
      			!BRW3.ResetQueue(false)
      		END
    OF ?InkoopVerwerk
      db.DebugOut('INSLAG DOEN1 ' & APla:PartijID)
      
      ! Planningrecord inlezen
      Get(BRW6.Q,Choice(?InkoopList))
      APla:PlanningID = BRW6.Q.Pla2:PlanningID
      IF Access:APlanning.Fetch(APla:PK_Planning)
        Message('Planning regel kan niet ingelezen worden','Fout',Icon:Hand)
        CYCLE
      END
      
      IF APla:Verwerkt = TRUE
        Message('Planning regel is verwerkt','Fout',Icon:Hand)
        CYCLE
      END
      
      CLEAR(Par:Record)
      Par:PartijID = APla:PartijID
      IF Access:Partij.TryFetch(Par:Partij_PK) = Level:Benign
      	db.DebugOut('INSLAG DOEN2a ' & APla:PartijID)
      	GlobalRequest = ChangeRecord
      	IF APla:Gewogen THEN
              GLO:GebruikerLogHandelingOpmerking = 'InkoopVerwerktWeging'
      		WindowInslagWeging()
          ELSE
              GLO:GebruikerLogHandelingOpmerking = 'InkoopVerwerkt'
      		WindowInslag()
      	END
      
      	IF GlobalResponse = RequestCompleted
              ! Planningrecord inlezen
      			
      		!GlobalRequest = ChangeRecord
      		!UpdateInslag
      		!IF GlobalResponse = RequestCompleted
      			
      		APla:MutatieGemaakt = TRUE
      		APla:Verwerkt = TRUE
      		Access:APlanning.Update()
      		
      		!ReportInslag
      
      		CLEAR(Pla:Record)
      		Pla:PlanningID=BRW6.Q.Pla2:PlanningID
      		IF (Access:Planning.TryFetch(Pla:PK_Planning) = Level:Benign)
      			DO UpdateInkoopVerkoopVerwerkStatus
      		.
      		
      		!BRW6.ResetQueue(false)
      	END
      ELSE
      	MESSAGE('Planning regel is nog niet ingeslagen|Er bestaat nog geen partij')
      END
      
      GLO:GebruikerLogHandelingOpmerking = ''
      DO RefreshWindow
    OF ?VerkoopVerwerkt
      		Get(BRW1.Q,Choice(?VerkoopList))
      		IF NOT ERROR()
      			ThisWindow.GetMutatie(Brw1.Q.Pla3:PlanningID,'VerwerkUitslag')
      		END	
    OF ?VerkoopPrintCMR
          Loc:RegelNu1 = Choice(?VerkoopList)
          Get(BRW1.Q, Choice(?VerkoopList))
          db.DebugOut('CMR-planningID:' & BRW1.Q.Pla3:PlanningID)
      	APla:PlanningID=BRW1.Q.Pla3:PlanningID
      	IF Access:APlanning.TryFetch(APla:PK_Planning) <> Level:Benign
      		Message('Planningregel kan niet ingelezen worden','Fout',Icon:Hand)
      		CYCLE
      	END
    OF ?VerkoopUitslag
      		Get(BRW1.Q,Choice(?VerkoopList))
      		IF NOT ERROR()
      			ThisWindow.GetMutatie(Brw1.Q.Pla3:PlanningID,'Uitslag')
      		END	
    OF ?OverboekDoen
      	Get(BRW8.Q,Choice(?OverboekList))
      	Pla:PlanningID = BRW8.Q.Pla4:PlanningID
      	IF Access:Planning.Fetch(Pla:PK_Planning)
      		Message('Planning regel kan niet ingelezen worden','Fout',Icon:Hand)
      		CYCLE
      	END
      
      	IF Pla:Verwerkt = TRUE
      		Message('Planning-uitslag regel is reeds verwerkt ','Fout',Icon:Hand)
      		CYCLE
      	END
      
      	GLO:GebruikerLogHandelingOpmerking = 'OverboekDoen'
      
      	db.DebugOut('OverboekDoen - Zoeken mutatie ' & Pla:PlanningID)
      	mutatieID# = 0
      	CLEAR(Mut:Record)
      	Mut:PlanningID = Pla:PlanningID
      	SET(Mut:Mutatie_FK02, Mut:Mutatie_FK02)
      	LOOP UNTIL Access:Mutatie.Next()
      		IF Mut:PlanningID <> Pla:PlanningID THEN BREAK.
      		
      		IF Mut:SoortMutatie = 'OUIT' THEN
      			db.DebugOut('OverboekDoen - Zoeken mutatie - Gevonden ' & Mut:MutatieID)
      			mutatieID# = Mut:MutatieID
      			BREAK
      		.
      	.
      
      	CLEAR(Mut:Record)
      	Mut:MutatieID=mutatieID#
      	IF (mutatieID# = 0 OR Access:Mutatie.TryFetch(Mut:Mutatie_PK) <> Level:Benign)
      		Clear(Mut:Record)
      		Mut:ArtikelID = Pla:ArtikelID
      		Mut:UitslagKG = Pla:KG
      		Mut:UitslagPallet = Pla:Pallets
      		Mut:CelID = Pla:CelID
      		Mut:PlanningID = Pla:PlanningID
      
      		GlobalRequest = InsertRecord
      		db.DebugOut('OverboekDoen - Insert - UpdateOverboekMutatie')
      		UpdateOverboekMutatie
      	ELSE
      		GlobalRequest = ChangeRecord
      		db.DebugOut('OverboekDoen - Change - UpdateOverboekMutatie')		
      		UpdateOverboekMutatie
      	END
      	
      	IF GlobalResponse = RequestCompleted
      		Pla:MutatieGemaakt = TRUE
      		Access:Planning.Update()
      		
      		VoorraadClass.VerwerkGekoppeldeVerkoop(Pla:PlanningID, Pla:OverboekingPlanningID, Mut:NaarCelID)
      		!BRW8.ResetQueue(true)
      	END		
      
      	GLO:GebruikerLogHandelingOpmerking = ''
      DO RefreshWindow
    OF ?VerkoopHVerwerkt
      		Get(BRW1.Q,Choice(?VerkoopList))
      		IF NOT ERROR()
      			ThisWIndow.GetMutatie(Brw1.Q.Pla3:PlanningID,'VerwerkHandUitslag')
      		END	
    OF ?TransferInkoopButton
      BrowseTransfers(LOC:DatumNU)
      
      !BRW6.ResetQueue(false)
      
      	  DO RefreshWindow
    OF ?UitslagWeging
      		Get(BRW1.Q,Choice(?VerkoopList))
      		IF NOT ERROR()
      			ThisWindow.GetMutatie(Brw1.Q.Pla3:PlanningID,'UitslagWeging')
      		END	
      
         
    OF ?InslagWeging
      db.DebugOut('INSLAG DOEN1 ' & APla:PartijID)
      
      ! Planningrecord inlezen
      Get(BRW6.Q,Choice(?InkoopList))
      APla:PlanningID = BRW6.Q.Pla2:PlanningID
      IF Access:APlanning.Fetch(APla:PK_Planning)
        Message('Planning regel kan niet ingelezen worden','Fout',Icon:Hand)
        CYCLE
      END
      
      IF APla:Verwerkt = TRUE
        Message('Planning regel is verwerkt','Fout',Icon:Hand)
        CYCLE
      END
      
      GLO:GebruikerLogHandelingOpmerking = 'InkoopWeging'
      
      CLEAR(Par:Record)
      Par:PartijID = APla:PartijID
      IF Access:Partij.TryFetch(Par:Partij_PK) = Level:Benign
      	db.DebugOut('INSLAG DOEN2a ' & APla:PartijID)
      	GlobalRequest = ChangeRecord
      	WindowInslagWeging()
      
          IF GlobalResponse = RequestCompleted
              GLO:GebruikerLogHandelingOpmerking = 'RequestCompleted - WindowInslagWeging()'
                  ! 2017-10-4 Hier de planning opnieuw inlezen omdat deze door de Weging aangepast is en weggeschreven is
                  ! Maar als we nu alleen één veld willen aanpassen hij de hele oude buffer laat zien????
                  Clear(APla:Record)
                  APla:PlanningID=BRW6.Q.Pla2:PlanningID
                  IF Access:APlanning.Fetch(APla:PK_Planning) <> Level:Benign
                      Message('APlanning-inslag regel kan niet opnieuw ingelezen worden','Fout',Icon:Hand)
                  END
      		APla:MutatieGemaakt = TRUE
      		APla:Gewogen = true		
      		Access:APlanning.Update()
      	END
      ELSE
      	db.DebugOut('INSLAG DOEN2b ' & APla:PartijID)
      	GlobalRequest = InsertRecord
      	WindowInslagWeging()
      
          IF GlobalResponse = RequestCompleted
              GLO:GebruikerLogHandelingOpmerking = 'RequestCompleted - WindowInslagWeging()'
                  ! 2017-10-4 Hier de planning opnieuw inlezen omdat deze door de Weging aangepast is en weggeschreven is
                  ! Maar als we nu alleen één veld willen aanpassen hij de hele oude buffer laat zien????
                  Clear(APla:Record)
                  APla:PlanningID=BRW6.Q.Pla2:PlanningID
                  IF Access:APlanning.Fetch(APla:PK_Planning) <> Level:Benign
                      Message('APlanning-inslag regel kan niet opnieuw ingelezen worden','Fout',Icon:Hand)
                  END
      		APla:MutatieGemaakt = TRUE
      		APla:PartijID = Par:PartijID
      		APla:Gewogen = true
      		Access:APlanning.Update()
      	END
      END
      
      GLO:GebruikerLogHandelingOpmerking = ''
      DO RefreshWindow
    OF ?WeeglijstInkoop
      GET(BRW6.Q, CHOICE(?InkoopList))
      ReportWeeglijst('Inkoop', BRW6.Q.Pla2:InkoopID)
    OF ?WeeglijstExcelInkoop
      GET(BRW6.Q, CHOICE(?InkoopList))
      ReportWeeglijstExcel('Inkoop', BRW6.Q.Pla2:InkoopID)
    OF ?WeeglijstExcelVerkoop
      GET(BRW1.Q, CHOICE(?VerkoopList))
      ReportWeeglijstExcel('Verkoop', BRW1.Q.PLA3:VerkoopID)
    OF ?WeeglijstVerkoop
      GET(BRW1.Q, CHOICE(?VerkoopList))
      ReportWeeglijst('Verkoop', BRW1.Q.PLA3:VerkoopID)
    OF ?PrintUitslagRapport
      Get(BRW1.Q,Choice(?VerkoopList))
      ThisWindow.UitslagReport(BRW1.Q.Pla3:PlanningID)
    OF ?VerkoopPrintPalletblad
      Get(BRW1.Q, Choice(?VerkoopList))
      IF NOT(ERROR()) THEN
          ThisWindow.GetMutatie(Brw1.Q.Pla3:PlanningID,'UitslagWeging_PalletBlad')
      END    
    OF ?PrintVerkoopStickers
      ! Planningrecord inlezen
      Get(BRW1.Q, Choice(?VerkoopList))
      db.DebugOut('Print palletstickers:' & BRW1.Q.Pla3:PartijID)
      CLEAR(Par:Record)
      Par:PartijID = BRW1.Q.Pla3:PartijID
      IF NOT(Access:Partij.TryFetch(Par:Partij_PK) = Level:Benign)
      	Message('Partij kan niet gevonden worden','Fout',Icon:Hand)
      	CYCLE
      END
      
      aantalpallets# = ReportPalletStickers()
      IF GlobalResponse = RequestCompleted
      	IF NOT(Access:Partij.Fetch(Par:Partij_PK))
      		Par:PalletsGeprint=Par:PalletsGeprint+aantalpallets#
      		Access:Partij.Update()
      	.
      END
      
      DO RefreshWindow
    OF ?VerkoopPalletbladExport
      Get(BRW1.Q, Choice(?VerkoopList))
      IF NOT(ERROR()) THEN
          ThisWindow.GetMutatie(Brw1.Q.Pla3:PlanningID,'UitslagWeging_PalletBlad_Export')
      END
    OF ?InkoopPrint2
                        		! Planningrecord inlezen
      		Get(BRW3.Q,Choice(?InkoopList2))
      		Pla:PlanningID = BRW3.Q.APla2:PlanningID
      		IF Access:Planning.Fetch(Pla:PK_Planning)
      			Message('Planning regel kan niet ingelezen worden','Fout',Icon:Hand)
      			CYCLE
      		Else
      			if Pla:PartijID = 0
      				Message('Deze partij is nog niet ingeslagen','Fout',Icon:Hand)
      				Cycle
      			End
      			Clear(PAR:Record)
      			Par:PartijID = Pla:PartijID
      			IF Access:Partij.Fetch(Par:Partij_PK)
      				Message('Partij '&Pla:PartijID&' kan niet gevonden worden ','Fout',Icon:Hand)
      				cycle
      			End	
      		END
      
      		aantalpallets# = ReportPalletStickers()
      		IF GlobalResponse = RequestCompleted
      			Clear(Par:Record)
      			Par:PartijID = Pla:PartijID
      			IF NOT(Access:Partij.Fetch(Par:Partij_PK))
      				Par:PalletsGeprint=Par:PalletsGeprint+aantalpallets#
      				Access:Partij.Update()
      			ELSE
      				Message('Partij '&Pla:PartijID&' kan niet gevonden worden ','Fout',Icon:Hand)
      			.
      			Pla:Geprint = TRUE
      			Access:Planning.Update()
      			!BRW3.ResetQueue(false)
      			!BRW6.ResetQueue(false)
      		END
    OF ?TransferButton2
      BrowseTransfers(LOC:DatumNU)
      
      !BRW3.ResetQueue(false)
      
      	  DO RefreshWindow      
    OF ?Weeglijst2
      GET(BRW3.Q, CHOICE(?InkoopList2))
      ReportWeeglijst('Inkoop', BRW3.Q.APla2:InkoopID)
    OF ?WeeglijstExcel2
      GET(BRW3.Q, CHOICE(?InkoopList2))
      ReportWeeglijstExcel('Inkoop', BRW3.Q.APla2:InkoopID)
    OF ?InslagRapportButton2
      Get(BRW3.Q,Choice(?InkoopList2))
      ThisWindow.InslagReport(BRW3.Q.APla2:PlanningID)
    OF ?InkoopTerugdraaien2
      GLO:GebruikerLogHandelingOpmerking = 'InkoopTerugdraaien'
      ThisWindow.HandleButton('Terugdraaien', 'INK', 1)
      GLO:GebruikerLogHandelingOpmerking = ''
    OF ?OverboekDoen3
      	Get(BRW9.Q,Choice(?OverboekList2))
      	Pla:PlanningID = BRW9.Q.APla4:PlanningID
      	IF Access:Planning.Fetch(Pla:PK_Planning)
      		Message('Planning regel kan niet ingelezen worden','Fout',Icon:Hand)
      		CYCLE
      	END
      
      	IF Pla:Verwerkt = TRUE
      		Message('Planning-uitslag regel is reeds verwerkt ','Fout',Icon:Hand)
      		CYCLE
      	END
      
      	GLO:GebruikerLogHandelingOpmerking = 'OverboekDoen'
      
      	mutatieID# = 0
      	CLEAR(Mut:Record)
      	Mut:PlanningID = Pla:PlanningID
      	SET(Mut:Mutatie_FK02, Mut:Mutatie_FK02)
      	LOOP
      		Access:Mutatie.Next()
      		IF ERROR() THEN BREAK.
      		IF Mut:PlanningID <> Pla:PlanningID THEN BREAK.
      		
      		IF Mut:SoortMutatie = 'OUIT' THEN
      			mutatieID# = Mut:MutatieID
      			BREAK
      		.
      	.
      
      	CLEAR(Mut:Record)
      	Mut:MutatieID=mutatieID#
      	IF (mutatieID# = 0 or Access:Mutatie.TryFetch(Mut:Mutatie_PK) <> Level:Benign)
      		Clear(Mut:Record)
      		Mut:ArtikelID = Pla:ArtikelID
      		Mut:UitslagKG= Pla:KG
      		Mut:UitslagPallet = Pla:Pallets
      		Mut:CelID = Pla:CelID
      		Mut:PlanningID = Pla:PlanningID
      
      		GlobalRequest = InsertRecord
      		UpdateOverboekMutatie
      	ELSE
      		GlobalRequest = ChangeRecord
      		UpdateOverboekMutatie
      	END
      	
      	IF GlobalResponse = RequestCompleted
      		Pla:MutatieGemaakt = TRUE
      		Access:Planning.Update()
      		
      		VoorraadClass.VerwerkGekoppeldeVerkoop(Pla:PlanningID, Pla:OverboekingPlanningID, Mut:NaarCelID)
      			
      		!BRW9.ResetQueue(true)
      	END
      
      	GLO:GebruikerLogHandelingOpmerking = ''
      
      DO RefreshWindow      
    OF ?OverboekSjabloon3
      	Get(BRW9.Q,Choice(?OverboekList2))
      	IF ERROR() THEN
      		MESSAGE('Geen overboeking geselecteerd')
      		RETURN ReturnValue
      	.
      
      	APla:PlanningID = BRW9.Q.APla4:PlanningID
      	IF Access:APlanning.TryFetch(APla:PK_Planning) <> Level:Benign THEN
      		MESSAGE('Geen overboeking geselecteerd')
      		RETURN ReturnValue
      	.
      
      	ReportOverboeking(APla:PlanningID)
    OF ?OverboekTransfers3
      BrowseTransfers(LOC:DatumNU)
      
      !BRW9.ResetQueue(false)
      
      DO RefreshWindow     
    OF ?VerkoopSjabloon4
       Get(BRW12.Q,Choice(?VerkoopList:2))
      IF ERROR() THEN
      	MESSAGE('Geen verkoop geselecteerd')
      	RETURN ReturnValue
      .
      
       Ver2:VerkoopID = BRW12.Q.APla3:VerkoopID
      IF Access:Verkoop.TryFetch(Ver2:PK_Verkoop) <> Level:Benign THEN
      	MESSAGE('Geen verkoop geselecteerd')
      	RETURN ReturnValue
      .
      
      WindowCallSjabloon('VerkoopMutaties', Ver2:VerkoopID)
    OF ?VerkoopUitslag4
          ! Planningrecord inlezen
      	Get(BRW12.Q,Choice(?VerkoopList:2))
      	IF NOT ERROR()
      		ThisWindow.GetMutatie(Brw12.Q.APla3:PlanningID,'Uitslag')
          END	
      
      !Loc:RegelNu2 = Choice(?VerkoopList:2)
      !Get(BRW12.Q,Choice(?VerkoopList:2))
      !Pla:PlanningID = BRW12.Q.APla3:PlanningID
      !IF Access:Planning.Fetch(Pla:PK_Planning)
      !    Message('Planning-uitslag regel kan niet ingelezen worden','Fout',Icon:Hand)
      !    CYCLE
      !END
      !
      
      !
      !IF	Pla:Verwerkt = TRUE			
      !    Message('Planning-uitslag regel is reeds verwerkt ','Fout',Icon:Hand)
      !    CYCLE
      !END
      !
      !mutatieID# = 0
      !CLEAR(Mut:Record)
      !Mut:PlanningID = Pla:PlanningID
      !SET(Mut:Mutatie_FK02, Mut:Mutatie_FK02)
      !LOOP
      !    Access:Mutatie.Next()
      !    IF ERROR() THEN BREAK.
      !    IF Mut:PlanningID <> Pla:PlanningID THEN BREAK.
      !		
      !    IF Mut:SoortMutatie = 'UIT' THEN
      !        mutatieID# = Mut:MutatieID
      !        BREAK
      !    .
      !.
      !
      !CLEAR(Mut:Record)
      !Mut:MutatieID=mutatieID#
      !IF (mutatieID# = 0 or Access:Mutatie.TryFetch(Mut:Mutatie_PK) <> Level:Benign)
      !    Clear(Mut:Record)
      !    Mut:ArtikelID = Pla:ArtikelID
      !    Mut:UitslagKG= Pla:KG
      !    Mut:UitslagPallet = Pla:Pallets
      !    Mut:CelID = Pla:CelID
      !    Mut:PlanningID = Pla:PlanningID
      !    Clear(Ver2:Record)
      !    Ver2:VerkoopID = Pla:VerkoopID
      !    Access:Verkoop.Fetch(Ver2:PK_Verkoop)
      !		! Hier moet ik de klant eigenlijk ophalen 
      !
      !    db.DebugOut('UpdateUitslagMutatie-InsertRecord')
      !		
      !    GlobalRequest = InsertRecord
      !    UpdateUitslagMutatie
      !ELSE
      !    Clear(Ver2:Record)
      !    Ver2:VerkoopID = Pla:VerkoopID
      !    Access:Verkoop.Fetch(Ver2:PK_Verkoop)
      !		! Hier moet ik de klant eigenlijk ophalen 
      !		
      !    db.DebugOut('UpdateUitslagMutatie-ChangeRecord')
      !
      !    GlobalRequest = ChangeRecord
      !    UpdateUitslagMutatie
      !END
      !	
      !IF GlobalResponse = RequestCompleted
      !    Pla:PlanningID = BRW12.Q.APla3:PlanningID
      !    IF Access:Planning.Fetch(Pla:PK_Planning)
      !        Message('Planning-uitslag regel kan niet terug ingelezen worden','Fout',Icon:Hand)
      !    ELSE
      !        
      !        Pla:MutatieGemaakt = TRUE
      !        Access:Planning.Update()
      !    END
      !        
      !END
    OF ?VerkoopPrintCMR4
          Loc:RegelNu2 = Choice(?VerkoopList:2)
       	     Get(BRW12.Q, Choice(?VerkoopList:2))
         ! db.DebugOut('CMR-planningID:' & BRW10.Q.APla3:PlanningID)
       	APla:PlanningID=BRW12.Q.APla3:PlanningID
      	IF Access:APlanning.TryFetch(APla:PK_Planning) <> Level:Benign
      		Message('Planningregel kan niet ingelezen worden','Fout',Icon:Hand)
      		CYCLE
      	END
      
      	ReportCMR(APla:PlanningID)
    OF ?VerkoopVerwerkt4
      		Get(BRW12.Q,Choice(?VerkoopList:2))
      		IF NOT ERROR()
      			ThisWindow.GetMutatie(Brw12.Q.APla3:PlanningID,'VerwerkUitslag')
              END
    OF ?VerkoopHVerwerkt4
      	Get(BRW12.Q,Choice(?VerkoopList:2))
      	IF NOT ERROR()
      		ThisWIndow.GetMutatie(Brw12.Q.APla3:PlanningID,'VerwerkHandUitslag')
      	END	
      !  ! Planningrecord inlezen
      !  Loc:RegelNu2 = Choice(?VerkoopList:2)
      !	Get(BRW12.Q,Choice(?VerkoopList:2))
      !	Pla:PlanningID = BRW12.Q.APLA3:PlanningID
      !		IF Access:Planning.Fetch(Pla:PK_Planning)
      !			Message('Planning-uitslag regel kan niet ingelezen worden','Fout',Icon:Hand)
      !			CYCLE
      !		END
      !	IF	Pla:Verwerkt = TRUE			
      !		Message('Planning-uitslag regel is reeds verwerkt ','Fout',Icon:Hand)
      !			CYCLE
      !	END
      !
      !	!CLEAR(Cel:Record)
      !	!Cel:CelID = Pla:CelID
      !	!IF Access:Cel.TryFetch(CEL:CEL_PK) <> Level:Benign
      !	!	Message('Bij deze planning-uitslag regel is geen geldige cel geselecteerd.','Fout',Icon:Hand)
      !	!	CYCLE
      !	!END
      !
      !	CLEAR(Art:Record)
      !	Art:ArtikelID=Pla:ArtikelID
      !	IF Access:ViewArtikel.TryFetch(Art:Artikel_PK) <> Level:Benign
      !		MESSAGE('Bij deze planning-uitslag regel is geen geldig artikel geselecteerd.','Fout',Icon:Hand)
      !		CYCLE
      !	.
      !
      !	! Voorraad controleren
      !!	VVCT:CeliD = Pla:CelID
      !!	VVCT:ArtikelOms = Art:ArtikelOms
      !!	VVCT:ArtikelID = Art:ArtikelID
      !!	IF Access:ViewVoorraadCelTotaal.TryFetch(VVCT:ViewVoorraadCelTotaal_PK) = Level:Benign
      !		!IF VVCT:pallets < Pla:Pallets OR VVCT:kg < Pla:KG
      !!		IF VVCT:kg < Pla:KG
      !!			MESSAGE('Voor deze planning-uitslag regel is niet voldoende voorraad (' & VVCT:kg & ' kg) gevonden.','Fout',Icon:Hand)
      !!			CYCLE
      !!		.
      !!	ELSE
      !!		MESSAGE('Voor deze planning-uitslag regel is niet voldoende voorraad (0 kg / 0 pallets) gevonden.','Fout',Icon:Hand)
      !!		CYCLE
      !!	.
      !
      !		Clear(Mut:Record)
      !		Mut:ArtikelID = Pla:ArtikelID
      !		Mut:UitslagKG= Pla:KG
      !		Mut:UitslagPallet= Pla:Pallets
      !		!= Pla:VerpakkingID
      !		Mut:CelID = Pla:CelID
      !		Clear(Ver2:Record)
      !		Ver2:VerkoopID = Pla:VerkoopID
      !		Access:Verkoop.Fetch(Ver2:PK_Verkoop)
      !		! hier moet ik de klant eigenlijk ophalen 
      !
      !		!GlobalRequest = InsertRecord
      !		!UpdateUitslagMutatie
      !		Mut:DatumTijd_DATE=TODAY()
      !		Mut:DatumTijd_TIME=CLOCK()
      !		!Mut:PartijID=Pla:PartijID
      !		Mut:SoortMutatie='EUIT'
      !		Mut:PlanningID=Pla:PlanningID
      !
      !		IF NOT(Access:Mutatie.Insert() = Level:Benign)
      !			IF ERRORCODE() = 90 THEN
      !				MESSAGE('Mutatie-record kon niet worden aangemaakt | SQL Error('&FILEERRORCODE()&'):'&FILEERROR()&')')
      !			ELSE
      !				MESSAGE('Mutatie-record kon niet worden aangemaakt | Error('&ERRORCODE()&'):'&ERROR()&')')
      !			.
      !		ELSE
      !			Pla:Verwerkt = TRUE
      !			Pla:MutatieGemaakt = TRUE
      !			Access:Planning.Update()
      !			
      !			DO UpdateInkoopVerkoopVerwerkStatus
      !		END
    OF ?VerkoopUitslagWeging4
      		Get(BRW12.Q,Choice(?VerkoopList:2))
      		IF NOT ERROR()
      			ThisWindow.GetMutatie(Brw12.Q.APla3:PlanningID,'UitslagWeging')
              END	
      
      !    ! Planningrecord inlezen
      !    Loc:RegelNu2 = Choice(?VerkoopList:2)
      ! 	Get(BRW12.Q,Choice(?VerkoopList:2))
      !  	Pla:PlanningID = BRW12.Q.APla3:PlanningID
      !	IF Access:Planning.Fetch(Pla:PK_Planning)
      !		Message('Planning-uitslag regel kan niet ingelezen worden','Fout',Icon:Hand)
      !		CYCLE
      !	END
      !
      !	IF	Pla:Verwerkt = TRUE			
      !		Message('Planning-uitslag regel is reeds verwerkt ','Fout',Icon:Hand)
      !		CYCLE
      !	END
      !
      !	mutatieID# = 0
      !	CLEAR(Mut:Record)
      !	Mut:PlanningID = Pla:PlanningID
      !	SET(Mut:Mutatie_FK02, Mut:Mutatie_FK02)
      !	LOOP
      !		Access:Mutatie.Next()
      !		IF ERROR() THEN BREAK.
      !		IF Mut:PlanningID <> Pla:PlanningID THEN BREAK.
      !		
      !		IF Mut:SoortMutatie = 'UIT' THEN
      !			mutatieID# = Mut:MutatieID
      !			BREAK
      !		.
      !	.
      !
      !	CLEAR(Mut:Record)
      !	Mut:MutatieID=mutatieID#
      !	IF (mutatieID# = 0 or Access:Mutatie.TryFetch(Mut:Mutatie_PK) <> Level:Benign)
      !		Clear(Mut:Record)
      !		Mut:ArtikelID = Pla:ArtikelID
      !		Mut:UitslagKG= Pla:KG
      !		Mut:UitslagPallet = Pla:Pallets
      !		Mut:CelID = Pla:CelID
      !		Mut:PlanningID = Pla:PlanningID
      !		Clear(Ver2:Record)
      !		Ver2:VerkoopID = Pla:VerkoopID
      !		Access:Verkoop.Fetch(Ver2:PK_Verkoop)
      !		! Hier moet ik de klant eigenlijk ophalen 
      !
      !		db.DebugOut('UpdateUitslagMutatie-InsertRecord')
      !		
      !		GlobalRequest = InsertRecord
      !		UpdateUitslagMutatieWeging
      !	ELSE
      !		Clear(Ver2:Record)
      !		Ver2:VerkoopID = Pla:VerkoopID
      !		Access:Verkoop.Fetch(Ver2:PK_Verkoop)
      !		! Hier moet ik de klant eigenlijk ophalen 
      !		
      !		db.DebugOut('UpdateUitslagMutatie-ChangeRecord')
      !
      !		GlobalRequest = ChangeRecord
      !		UpdateUitslagMutatieWeging
      !	END
      !	
      !	IF GlobalResponse = RequestCompleted
      !		Pla:MutatieGemaakt = TRUE
      !		Pla:Gewogen = TRUE
      !		Access:Planning.Update()
      !			
      !		Post(EVENT:Accepted,?Morgen)
      !		Post(EVENT:Accepted,?Gister)
      !	END
    OF ?WeeglijstExcel4
      GET(BRW12.Q, CHOICE(?VerkoopList:2))
      ReportWeeglijstExcel('Verkoop', BRW12.Q.APla3:VerkoopID)
    OF ?UitslagRapport4
      Get(BRW12.Q,Choice(?VerkoopList:2))
      ThisWindow.UitslagReport(BRW12.Q.APla3:PlanningID)
    OF ?VerkoopPrintPalletblad:2
      Get(BRW12.Q, Choice(?VerkoopList:2))
      IF NOT(ERROR()) THEN
          ThisWindow.GetMutatie(Brw12.Q.APla3:PlanningID,'UitslagWeging_PalletBlad')
      END
    OF ?PrintVerkoopStickers:2
      ! Planningrecord inlezen
      Get(BRW1.Q, Choice(?VerkoopList:2))
      CLEAR(Par:Record)
      Par:PartijID = BRW12.Q.APla3:PartijID
      IF NOT(Access:Partij.TryFetch(Par:Partij_PK) = Level:Benign)
      	Message('Partij kan niet gevonden worden','Fout',Icon:Hand)
      	CYCLE
      END
      
      aantalpallets# = ReportPalletStickers()
      IF GlobalResponse = RequestCompleted
      	IF NOT(Access:Partij.Fetch(Par:Partij_PK))
      		Par:PalletsGeprint=Par:PalletsGeprint+aantalpallets#
      		Access:Partij.Update()
      	.
      END
      
      DO RefreshWindow
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?Calendar
      ThisWindow.Update()
      Calendar5.SelectOnClose = True
      Calendar5.Ask('Select a Date')
      IF Calendar5.Response = RequestCompleted THEN
      	LOC:DatumNu = Calendar5.SelectedDate
      	DISPLAY(?LOC:DatumNu)
      	DO ConvertDatum
      .
      IF Calendar5.Response = RequestCompleted THEN
      END
    OF ?InkoopHVerwerkt
      ThisWindow.Update()
          ! Planningrecord inlezen
      	Get(BRW6.Q,Choice(?InkoopList))
      	Pla:PlanningID = BRW6.Q.Pla2:PlanningID
      	IF Access:Planning.Fetch(Pla:PK_Planning)
      		Message('Planning-inslag regel kan niet ingelezen worden','Fout',Icon:Hand)
      		CYCLE
      	END
      
      	IF Pla:Verwerkt = TRUE
      		Message('Planning-inslag regel is reeds verwerkt ','Fout',Icon:Hand)
      		CYCLE
      	END
      
      	!CLEAR(Cel:Record)
      	!Cel:CelID = Pla:CelID
      	!IF Access:Cel.TryFetch(CEL:CEL_PK) <> Level:Benign
      	!	Message('Bij deze planning-inslag regel is geen geldige cel geselecteerd.','Fout',Icon:Hand)
      	!	CYCLE
      	!END
      
      	CLEAR(Art:Record)
      	Art:ArtikelID=Pla:ArtikelID
      	IF Access:ViewArtikel.TryFetch(Art:Artikel_PK) <> Level:Benign
      		MESSAGE('Bij deze planning-inslag regel is geen geldig artikel geselecteerd.','Fout',Icon:Hand)
      		CYCLE
      	.
      
      	GLO:GebruikerLogHandelingOpmerking = 'InkoopHVerwerkt'
      
      	Clear(Mut:Record)
      	Access:Mutatie.PrimeRecord(true)
      	Mut:ArtikelID = Pla:ArtikelID
      	Mut:CelID = Pla:CelID
      	Mut:InslagKG= Pla:KG
      	Mut:InslagPallet= Pla:Pallets
      	Clear(Ver2:Record)
      	Ver2:VerkoopID = Pla:VerkoopID
      	Access:Verkoop.Fetch(Ver2:PK_Verkoop)
      	! hier moet ik de klant eigenlijk ophalen 
      
      	!GlobalRequest = InsertRecord
      	!UpdateUitslagMutatie
      	Mut:DatumTijd_DATE=TODAY()
      	Mut:DatumTijd_TIME=CLOCK()
      	Mut:SoortMutatie='EIN'
      	Mut:PlanningID=Pla:PlanningID
      	IF NOT(Access:Mutatie.Insert() = Level:Benign)
      		IF ERRORCODE() = 90 THEN
      			MESSAGE('Mutatie-record kon niet worden aangemaakt | SQL Error('&FILEERRORCODE()&'):'&FILEERROR()&')')
      		ELSE
      			MESSAGE('Mutatie-record kon niet worden aangemaakt | Error('&ERRORCODE()&'):'&ERROR()&')')
      		.
      	ELSE
      		Pla:Verwerkt = TRUE
      		Pla:MutatieGemaakt = TRUE
      		Access:Planning.Update()
      		
      		DO UpdateInkoopVerkoopVerwerkStatus
      		
      		!BRW6.ResetQueue(false)
      		!DISPLAY
      	END
      
      	GLO:GebruikerLogHandelingOpmerking = ''
      DO RefreshWindow      
    OF ?VerkoopPrintCMR
      ThisWindow.Update()
      ReportCMR(APla:PlanningID)
      ThisWindow.Reset
      IF GlobalResponse=RequestCompleted
      	! Bijwerken
      	verkoopID# = APla:VerkoopID
      	
      	CLEAR(APla:PlanningID,-1)
      	SET(APla:Planning_FK02, APla:Planning_FK02)
      	LOOP UNTIL Access:APlanning.Next()
      		IF verkoopID# <> APla:VerkoopID THEN BREAK.
      		
      		APla:Geprint = TRUE
      		Access:APlanning.Update();
      	END
      
      	DO RefreshWindow	
      END
    OF ?VerkoopHVerwerkt
      ThisWindow.Update()
      DO RefreshWindow      
    OF ?OverboekVerwerkt
      ThisWindow.Update()
      Get(BRW8.Q,Choice(?OverboekList))
      Pla:PlanningID = BRW8.Q.Pla4:PlanningID
      IF Access:Planning.Fetch(Pla:PK_Planning)
      	Message('Planning regel kan niet ingelezen worden','Fout',Icon:Hand)
      	CYCLE
      END
      
      IF Pla:Verwerkt = TRUE
      	Message('Planning-uitslag regel is reeds verwerkt ','Fout',Icon:Hand)
      	CYCLE
      END
      
      GLO:GebruikerLogHandelingOpmerking = 'OverboekVerwerkt'
      
      bulk# = 0
      CLEAR(BOV:Record)
      BOV:PlanningID = Pla:PlanningID
      SET(BOV:FK1_BulkOverboeking, BOV:FK1_BulkOverboeking)
      Access:BulkOverboeking.Next()
      IF NOT(ERROR())
      	IF BOV:PlanningID = Pla:PlanningID THEN
      		bulk# = 1
      	.
      .
      
      IF NOT(bulk#)
      	! Gewone overboeking
      	mutatieID# = 0
      	CLEAR(Mut:Record)
      	Mut:PlanningID = Pla:PlanningID
      	SET(Mut:Mutatie_FK02, Mut:Mutatie_FK02)
      	LOOP
      		Access:Mutatie.Next()
      		IF ERROR() THEN BREAK.
      		IF Mut:PlanningID <> Pla:PlanningID THEN BREAK.
      		
      		IF Mut:SoortMutatie = 'OUIT' THEN
      			mutatieID# = Mut:MutatieID
      			BREAK
      		.
      	.
      
      	CLEAR(Mut:Record)
      	Mut:MutatieID=mutatieID#
      	IF (mutatieID# = 0 or Access:Mutatie.TryFetch(Mut:Mutatie_PK) <> Level:Benign)
      		Clear(Mut:Record)
      		Mut:ArtikelID = Pla:ArtikelID
      		Mut:UitslagKG= Pla:KG
      		Mut:UitslagPallet = Pla:Pallets
      		Mut:CelID = Pla:CelID
      		Mut:PlanningID = Pla:PlanningID
      
      		GlobalRequest = InsertRecord
      		UpdateOverboekMutatie
      	ELSE
      		GlobalRequest = ChangeRecord
      		UpdateOverboekMutatie
      	END
      	
          IF GlobalResponse = RequestCompleted
              ! 2019-7-19 Regel wordt leeggemaakt
              IF Access:Planning.Fetch(Pla:PK_Planning)<>Level:Benign
                  Message('Planning kan niet teuggelezen')
              END
              
      		Pla:Verwerkt = TRUE
      		Pla:MutatieGemaakt = TRUE
      		Access:Planning.Update()
      		
      		VoorraadClass.VerwerkGekoppeldeVerkoop(Pla:PlanningID, Pla:OverboekingPlanningID, Mut:NaarCelID)
      		
      		BRW8.ResetQueue(true)
      	END
      ELSE
      	! Bulk-overboeking
      	GlobalRequest = ChangeRecord
      	BulkOverboekMutatieWijzigen
      	
      	IF GlobalResponse = RequestCompleted
      		Pla:Verwerkt = TRUE
      		Pla:MutatieGemaakt = TRUE
      		Access:Planning.Update()
      		
      		VoorraadClass.VerwerkGekoppeldeVerkoop(Pla:PlanningID, Pla:OverboekingPlanningID, BOV:NaarCelID)
      		
      		!BRW8.ResetQueue(true)
      	ELSE
      		! Controleer of er nog mutaties gekoppeld zijn aan deze bulk-overboeking
      		verwijder# = 0
      		CLEAR(BOV:Record)
      		BOV:PlanningID = Pla:PlanningID
      		SET(BOV:FK1_BulkOverboeking, BOV:FK1_BulkOverboeking)
      		Access:BulkOverboeking.Next()
      		IF NOT(ERROR())
      			IF BOV:PlanningID = Pla:PlanningID THEN
      				verwijder# = 1
      				
      				CLEAR(Mut:Record)
      				Mut:BulkOverboekingID = BOV:BulkOverboekingID
      				SET(Mut:Mutatie_FK04, Mut:Mutatie_FK04)
      				LOOP
      					Access:Mutatie.Next()
      					IF ERROR() THEN BREAK.
      					IF Mut:BulkOverboekingID <> BOV:BulkOverboekingID THEN BREAK.
      					
      					verwijder# = 0
      					BREAK
      				.
      			.
      		.
      		
      		IF verwijder#
      			Access:BulkOverboeking.DeleteRecord(false)
      			
      			Pla:Verwerkt = FALSE
      			Pla:MutatieGemaakt = FALSE
      			Access:Planning.Update()
      				
      			!BRW8.ResetQueue(true)
      		.
      	END
      .
      
      GLO:GebruikerLogHandelingOpmerking = ''
      DO RefreshWindow      
    OF ?Ritten
      ThisWindow.Update()
      BrowseTransfers(LOC:DatumNu)
      
      !BRW8.ResetQueue(false)
      DO RefreshWindow      
    OF ?BulkOverboeken
      ThisWindow.Update()
      Get(BRW8.Q,Choice(?OverboekList))
      Pla:PlanningID = BRW8.Q.Pla4:PlanningID
      IF Access:Planning.Fetch(Pla:PK_Planning)
      	Message('Planning regel kan niet ingelezen worden.','Fout',Icon:Hand)
      	CYCLE
      END
      
      IF Pla:Verwerkt = TRUE
      	Message('Planning-uitslag regel is reeds verwerkt.','Fout',Icon:Hand)
      	CYCLE
      END
      
      GLO:GebruikerLogHandelingOpmerking = 'BulkOverboeken'
      
      exists# = 0
      CLEAR(BOV:Record)
      db.DebugOut('BulkOverboeken:' & Pla:PlanningID)
      BOV:PlanningID = Pla:PlanningID
      SET(BOV:FK1_BulkOverboeking, BOV:FK1_BulkOverboeking)
      Access:BulkOverboeking.Next()
      IF NOT(ERROR())
      	db.DebugOut('BulkOverboeken:' & BOV:PlanningID)
      	IF BOV:PlanningID = Pla:PlanningID THEN
      		exists# = 1
      	.
      .
      
      IF (exists#)
      	GlobalRequest = ChangeRecord
      	BulkOverboekMutatieWijzigen
      	
      	IF GlobalResponse = RequestCancelled THEN
      		! Controleer of er nog mutaties gekoppeld zijn aan deze bulk-overboeking
      		verwijder# = 0
      		CLEAR(BOV:Record)
      		BOV:PlanningID = Pla:PlanningID
      		SET(BOV:FK1_BulkOverboeking, BOV:FK1_BulkOverboeking)
      		Access:BulkOverboeking.Next()
      		IF NOT(ERROR())
      			IF BOV:PlanningID = Pla:PlanningID THEN
      				verwijder# = 1
      				
      				CLEAR(Mut:Record)
      				Mut:BulkOverboekingID = BOV:BulkOverboekingID
      				SET(Mut:Mutatie_FK04, Mut:Mutatie_FK04)
      				LOOP
      					Access:Mutatie.Next()
      					IF ERROR() THEN BREAK.
      					IF Mut:BulkOverboekingID <> BOV:BulkOverboekingID THEN BREAK.
      					
      					verwijder# = 0
      					BREAK
      				.
      			.
      		.
      		
      		IF verwijder#
      			Access:BulkOverboeking.DeleteRecord(false)
      			
      			Pla:Verwerkt = FALSE
      			Pla:MutatieGemaakt = FALSE
      			Access:Planning.Update()
      				
      			!BRW8.ResetQueue(true)
      		.
      	ELSIF GlobalRequest = RequestCompleted
      		VoorraadClass.VerwerkGekoppeldeVerkoop(Pla:PlanningID, Pla:OverboekingPlanningID, BOV:NaarCelID)
      	END
      ELSE
      	IF Pla:MutatieGemaakt = TRUE
      		Message('Van de planning-uitslag is al een gewone overboeking gemaakt.','Fout',Icon:Hand)
      		CYCLE
      	.
      	
      	GlobalRequest = InsertRecord
      	BulkOverboekMutatieMaken
      	
      	IF GlobalResponse = RequestCompleted
      		Pla:MutatieGemaakt = TRUE
      		Access:Planning.Update()
      
      		VoorraadClass.VerwerkGekoppeldeVerkoop(Pla:PlanningID, Pla:OverboekingPlanningID, BOV:NaarCelID)
      	END	
      END
      
      GLO:GebruikerLogHandelingOpmerking = ''
      DO RefreshWindow      
    OF ?PrintOverboekingStickers
      ThisWindow.Update()
      ! Planningrecord inlezen
      Get(BRW8.Q, Choice(?OverboekList))
      CLEAR(Par:Record)
      Par:PartijID = BRW8.Q.Pla4:PartijID
      IF NOT(Access:Partij.TryFetch(Par:Partij_PK) = Level:Benign)
      	Message('Partij kan niet gevonden worden','Fout',Icon:Hand)
      	CYCLE
      END
      
      !message(Par:PartijID)
      
      aantalpallets# = ReportPalletStickers()
      IF GlobalResponse = RequestCompleted
      	IF NOT(Access:Partij.Fetch(Par:Partij_PK))
      		Par:PalletsGeprint=Par:PalletsGeprint+aantalpallets#
      		Access:Partij.Update()
      	.
      	!BRW8.ResetQueue(false)
      END
      DO RefreshWindow
    OF ?PrintInslagRapport
      ThisWindow.Update()
      Get(BRW6.Q,Choice(?InkoopList))
      ThisWindow.InslagReport(BRW6.Q.Pla2:PlanningID)
    OF ?VerkoopTerugdraaienButton
      ThisWindow.Update()
      ThisWindow.HandleButton('Terugdraaien', 'VER', 0)
    OF ?InkoopTerugdraaienButton
      ThisWindow.Update()
      GLO:GebruikerLogHandelingOpmerking = 'InkoopTerugdraaien'
      ThisWindow.HandleButton('Terugdraaien', 'INK', 0)
      GLO:GebruikerLogHandelingOpmerking = ''
    OF ?OverboekRapport
      ThisWindow.Update()
      Get(BRW8.Q,Choice(?OverboekList))
      IF ERROR() THEN
      	MESSAGE('Geen overboeking geselecteerd')
      	RETURN ReturnValue
      .
      
      APla:PlanningID = BRW8.Q.Pla4:PlanningID
      IF Access:APlanning.TryFetch(APla:PK_Planning) <> Level:Benign THEN
      	MESSAGE('Geen overboeking geselecteerd')
      	RETURN ReturnValue
      .
      
      ReportOverboeking(APla:PlanningID)
    OF ?VerkoopSjabloon
      ThisWindow.Update()
      Get(BRW1.Q,Choice(?VerkoopList))
      IF ERROR() THEN
      	MESSAGE('Geen verkoop geselecteerd')
      	RETURN ReturnValue
      .
      
      CLEAR(Ver2:Record)
      Ver2:VerkoopID = BRW1.Q.Pla3:VerkoopID
      IF Access:Verkoop.TryFetch(Ver2:PK_Verkoop) <> Level:Benign THEN
      	MESSAGE('Geen verkoop geselecteerd')
      	RETURN ReturnValue
      .
      
      WindowCallSjabloon('VerkoopMutaties', Ver2:VerkoopID)
    OF ?OverboekSjabloon
      ThisWindow.Update()
      	!IF AARel:RelatieID = 0 THEN
      	!	MESSAGE('Geen overboeking geselecteerd')
      	!	RETURN ReturnValue
      	!.
      
      	Get(BRW8.Q,Choice(?OverboekList))
      	IF ERROR() THEN
      		MESSAGE('Geen overboeking geselecteerd')
      		RETURN ReturnValue
      	.
      
      	APla:PlanningID = BRW8.Q.Pla4:PlanningID
      	IF Access:APlanning.TryFetch(APla:PK_Planning) <> Level:Benign THEN
      		MESSAGE('Geen overboeking geselecteerd')
      		RETURN ReturnValue
      	.
      
      	WindowCallSjabloon('Overboeking',APla:PlanningID)
    OF ?VerkoopRapport
      ThisWindow.Update()
      Get(BRW1.Q,Choice(?VerkoopList))
      IF ERROR() THEN
      	MESSAGE('Geen verkoop geselecteerd')
      	RETURN ReturnValue
      .
      
      CLEAR(Ver2:Record)
      Ver2:VerkoopID = BRW1.Q.Pla3:VerkoopID
      IF Access:Verkoop.TryFetch(Ver2:PK_Verkoop) <> Level:Benign THEN
      	MESSAGE('Geen verkoop geselecteerd')
      	RETURN ReturnValue
      .
      
      ReportVerkoopMutaties(Ver2:VerkoopID)
    OF ?InkoopVerwerk2
      ThisWindow.Update()
      db.DebugOut('INSLAG DOEN1 ' & APla:PartijID)
      
      ! Planningrecord inlezen
      Get(BRW3.Q,Choice(?InkoopList2))
      APla:PlanningID = BRW3.Q.APla2:PlanningID
      IF Access:APlanning.Fetch(APla:PK_Planning)
        Message('Planning regel kan niet ingelezen worden','Fout',Icon:Hand)
        CYCLE
      END
      
      IF APla:Verwerkt = TRUE
        Message('Planning regel is verwerkt','Fout',Icon:Hand)
        CYCLE
      END
      
      GLO:GebruikerLogHandelingOpmerking = 'InkoopVerwerkt'
      
      CLEAR(Par:Record)
      Par:PartijID = APla:PartijID
      IF Access:Partij.TryFetch(Par:Partij_PK) = Level:Benign
      	db.DebugOut('INSLAG DOEN2a ' & APla:PartijID)
      	GlobalRequest = ChangeRecord
      	IF APla:Gewogen THEN
              GLO:GebruikerLogHandelingOpmerking = 'InkoopVerwerktWeging'
      		WindowInslagWeging()
          ELSE
              GLO:GebruikerLogHandelingOpmerking = 'InkoopVerwerkt'
      		WindowInslag()
      	END
      
      	IF GlobalResponse = RequestCompleted
              ! Planningrecord inlezen
      			
      		!GlobalRequest = ChangeRecord
      		!UpdateInslag
      		!IF GlobalResponse = RequestCompleted
      			
      		APla:MutatieGemaakt = TRUE
      		APla:Verwerkt = TRUE
      		Access:APlanning.Update()
      		
      		!ReportInslag
      
      		CLEAR(Pla:Record)
      		Pla:PlanningID=BRW3.Q.APla2:PlanningID
      		Access:Planning.TryFetch(Pla:PK_Planning)
      		IF (Access:Planning.TryFetch(Pla:PK_Planning) = Level:Benign)
      			DO UpdateInkoopVerkoopVerwerkStatus
      		.
      		
      		!BRW3.ResetQueue(false)
      	END
      ELSE
      	MESSAGE('Planning regel is nog niet ingeslagen.|Er bestaat nog geen partij.')
      END
      
      GLO:GebruikerLogHandelingOpmerking = ''
      DO RefreshWindow      
    OF ?InkoopInslag2
      ThisWindow.Update()
      db.DebugOut('INSLAG DOEN1 ' & APla:PartijID)
      
      ! Planningrecord inlezen
      Get(BRW3.Q,Choice(?InkoopList2))
      APla:PlanningID = BRW3.Q.APla2:PlanningID
      IF Access:APlanning.Fetch(APla:PK_Planning)
        Message('Planning regel kan niet ingelezen worden','Fout',Icon:Hand)
        CYCLE
      END
      
      IF APla:Verwerkt = TRUE
        Message('Planning regel is verwerkt','Fout',Icon:Hand)
        CYCLE
      END
      
      GLO:GebruikerLogHandelingOpmerking = 'InkoopInslaan'
      
      CLEAR(Par:Record)
      Par:PartijID = APla:PartijID
      IF Access:Partij.TryFetch(Par:Partij_PK) = Level:Benign
      	db.DebugOut('INSLAG DOEN2a ' & APla:PartijID)
      	GlobalRequest = ChangeRecord
      	WindowInslag()
      
          IF GlobalResponse = RequestCompleted
              Clear(APla:REcord)
              APla:PlanningID = BRW3.Q.APla2:PlanningID
              IF Access:APlanning.Fetch(APla:PK_Planning)
                  Message('Planning regel kan niet ingelezen worden','Fout',Icon:Hand)
              END
              
      		APla:MutatieGemaakt = TRUE
      		Access:APlanning.Update()
      	END
      ELSE
      	db.DebugOut('INSLAG DOEN2b ' & APla:PartijID)
      	GlobalRequest = InsertRecord
      	WindowInslag()
      
          IF GlobalResponse = RequestCompleted
              Clear(APla:REcord)
              APla:PlanningID = BRW3.Q.APla2:PlanningID
              IF Access:APlanning.Fetch(APla:PK_Planning)
                  Message('Planning regel kan niet ingelezen worden','Fout',Icon:Hand)
              END
              
      		APla:MutatieGemaakt = TRUE
      		APla:PartijID = Par:PartijID
      		Access:APlanning.Update()
      	END
      END
      
      GLO:GebruikerLogHandelingOpmerking = ''
      DO RefreshWindow      
    OF ?InkoopHVerwerkt2
      ThisWindow.Update()
          ! Planningrecord inlezen
      	Get(BRW3.Q,Choice(?InkoopList2))
      	Pla:PlanningID = BRW3.Q.APla2:PlanningID
      	IF Access:Planning.Fetch(Pla:PK_Planning)
      		Message('Planning-inslag regel kan niet ingelezen worden','Fout',Icon:Hand)
      		CYCLE
      	END
      
      	IF Pla:Verwerkt = TRUE
      		Message('Planning-inslag regel is reeds verwerkt ','Fout',Icon:Hand)
      		CYCLE
      	END
      
      	!CLEAR(Cel:Record)
      	!Cel:CelID = Pla:CelID
      	!IF Access:Cel.TryFetch(CEL:CEL_PK) <> Level:Benign
      	!	Message('Bij deze planning-inslag regel is geen geldige cel geselecteerd.','Fout',Icon:Hand)
      	!	CYCLE
      	!END
      
      	CLEAR(Art:Record)
      	Art:ArtikelID=Pla:ArtikelID
      	IF Access:ViewArtikel.TryFetch(Art:Artikel_PK) <> Level:Benign
      		MESSAGE('Bij deze planning-inslag regel is geen geldig artikel geselecteerd.','Fout',Icon:Hand)
      		CYCLE
      	.
      
      	GLO:GebruikerLogHandelingOpmerking = 'InkoopHVerwerkt'
      
      	Clear(Mut:Record)
      	Access:Mutatie.PrimeRecord(true)
      	Mut:ArtikelID = Pla:ArtikelID
      	Mut:CelID = Pla:CelID
      	Mut:InslagKG= Pla:KG
      	Mut:InslagPallet= Pla:Pallets
      	Clear(Ver2:Record)
      	Ver2:VerkoopID = Pla:VerkoopID
      	Access:Verkoop.Fetch(Ver2:PK_Verkoop)
      	! hier moet ik de klant eigenlijk ophalen 
      
      	!GlobalRequest = InsertRecord
      	!UpdateUitslagMutatie
      	Mut:DatumTijd_DATE=TODAY()
      	Mut:DatumTijd_TIME=CLOCK()
      	Mut:SoortMutatie='EIN'
      	Mut:PlanningID=Pla:PlanningID
      	IF NOT(Access:Mutatie.Insert() = Level:Benign)
      		IF ERRORCODE() = 90 THEN
      			MESSAGE('Mutatie-record kon niet worden aangemaakt | SQL Error('&FILEERRORCODE()&'):'&FILEERROR()&')')
      		ELSE
      			MESSAGE('Mutatie-record kon niet worden aangemaakt | Error('&ERRORCODE()&'):'&ERROR()&')')
      		.
      	ELSE
      		Pla:Verwerkt = TRUE
      		Pla:MutatieGemaakt = TRUE
      		Access:Planning.Update()
      		
      		DO UpdateInkoopVerkoopVerwerkStatus
      		
      		!BRW3.ResetQueue(false)
      		!DISPLAY
      	END
      
      	GLO:GebruikerLogHandelingOpmerking = ''
      DO RefreshWindow
    OF ?InslagWeging2
      ThisWindow.Update()
      db.DebugOut('INSLAG DOEN1 ' & APla:PartijID)
      
      ! Planningrecord inlezen
      Get(BRW3.Q,Choice(?InkoopList2))
      APla:PlanningID = BRW3.Q.APla2:PlanningID
      IF Access:APlanning.Fetch(APla:PK_Planning)
        Message('Planning regel kan niet ingelezen worden','Fout',Icon:Hand)
        CYCLE
      END
      
      IF APla:Verwerkt = TRUE
        Message('Planning regel is verwerkt','Fout',Icon:Hand)
        CYCLE
      END
      
      GLO:GebruikerLogHandelingOpmerking = 'InkoopWeging'
      
      CLEAR(Par:Record)
      Par:PartijID = APla:PartijID
      IF Access:Partij.TryFetch(Par:Partij_PK) = Level:Benign
      	db.DebugOut('INSLAG DOEN2a ' & APla:PartijID)
      	GlobalRequest = ChangeRecord
      	WindowInslagWeging()
      
          IF GlobalResponse = RequestCompleted
              GLO:GebruikerLogHandelingOpmerking = 'RequestCompleted - WindowInslagWeging()'
              ! 2017-10-4 Hier de planning opnieuw inlezen omdat deze door de Weging aangepast is en weggeschreven is
              ! Maar als we nu alleen één veld willen aanpassen hij de hele oude buffer laat zien????
              Clear(APla:Record)
              APla:PlanningID=BRW3.Q.APla2:PlanningID
              IF Access:APlanning.Fetch(APla:PK_Planning) <> Level:Benign
                  Message('APlanning-inslag regel kan niet opnieuw ingelezen worden','Fout',Icon:Hand)
              END
      		APla:MutatieGemaakt = TRUE
      		APla:Gewogen = true		
      		Access:APlanning.Update()
      	END
      ELSE
      	db.DebugOut('INSLAG DOEN2b ' & APla:PartijID)
      	GlobalRequest = InsertRecord
      	WindowInslagWeging()
      
      	IF GlobalResponse = RequestCompleted
              GLO:GebruikerLogHandelingOpmerking = 'RequestCompleted - WindowInslagWeging()'
              ! 2017-10-4 Hier de planning opnieuw inlezen omdat deze door de Weging aangepast is en weggeschreven is
              ! Maar als we nu alleen één veld willen aanpassen hij de hele oude buffer laat zien????
              Clear(APla:Record)
              APla:PlanningID=BRW3.Q.APla2:PlanningID
              IF Access:APlanning.Fetch(APla:PK_Planning) <> Level:Benign
                  Message('APlanning-inslag regel kan niet opnieuw ingelezen worden','Fout',Icon:Hand)
              END
      		APla:MutatieGemaakt = TRUE
      		APla:PartijID = Par:PartijID
      		APla:Gewogen = true
      		Access:APlanning.Update()
      	END
      END
      
      GLO:GebruikerLogHandelingOpmerking = ''
      DO RefreshWindow      
    OF ?InkoopKwaliteit
      ThisWindow.Update()
      Get(BRW3.Q,Choice(?InkoopList2))
      IF ERROR() THEN CYCLE.
      ! de goede Partij vinden
      Clear(Mut:Record)
      Par:PartijID=BRW3.Q.APla2:PartijID
      IF Access:Partij.Fetch(Par:Partij_PK)=Level:Benign
          GlobalRequest=ChangeRecord
          UpdatePartijKwaliteit()
      END
      
    OF ?OverboekPrintStickers3
      ThisWindow.Update()
      ! Planningrecord inlezen
      Get(BRW9.Q, Choice(?OverboekList2))
      CLEAR(Par:Record)
      Par:PartijID = BRW9.Q.APla4:PartijID
      IF NOT(Access:Partij.TryFetch(Par:Partij_PK) = Level:Benign)
      	Message('Partij kan niet gevonden worden','Fout',Icon:Hand)
      	CYCLE
      END
      
      !message(Par:PartijID)
      
      aantalpallets# = ReportPalletStickers()
      IF GlobalResponse = RequestCompleted
      	IF NOT(Access:Partij.Fetch(Par:Partij_PK))
      		Par:PalletsGeprint=Par:PalletsGeprint+aantalpallets#
      		Access:Partij.Update()
      	.
      	!BRW9.ResetQueue(false)
      END
      DO RefreshWindow
    OF ?BulkOverboeken3
      ThisWindow.Update()
      Get(BRW9.Q,Choice(?OverboekList2))
      Pla:PlanningID = BRW9.Q.APla4:PlanningID
      IF Access:Planning.Fetch(Pla:PK_Planning)
      	Message('Planning regel kan niet ingelezen worden.','Fout',Icon:Hand)
      	CYCLE
      END
      
      IF Pla:Verwerkt = TRUE
      	Message('Planning-uitslag regel is reeds verwerkt.','Fout',Icon:Hand)
      	CYCLE
      END
      
      GLO:GebruikerLogHandelingOpmerking = 'BulkOverboeken'
      
      exists# = 0
      CLEAR(BOV:Record)
      db.DebugOut('BulkOverboeken:' & Pla:PlanningID)
      BOV:PlanningID = Pla:PlanningID
      SET(BOV:FK1_BulkOverboeking, BOV:FK1_BulkOverboeking)
      Access:BulkOverboeking.Next()
      IF NOT(ERROR())
      	db.DebugOut('BulkOverboeken:' & BOV:PlanningID)
      	IF BOV:PlanningID = Pla:PlanningID THEN
      		exists# = 1
      	.
      .
      
      IF (exists#)
      	GlobalRequest = ChangeRecord
      	BulkOverboekMutatieWijzigen
      	
      	IF GlobalResponse = RequestCancelled THEN
      		! Controleer of er nog mutaties gekoppeld zijn aan deze bulk-overboeking
      		verwijder# = 0
      		CLEAR(BOV:Record)
      		BOV:PlanningID = Pla:PlanningID
      		SET(BOV:FK1_BulkOverboeking, BOV:FK1_BulkOverboeking)
      		Access:BulkOverboeking.Next()
      		IF NOT(ERROR())
      			IF BOV:PlanningID = Pla:PlanningID THEN
      				verwijder# = 1
      				
      				CLEAR(Mut:Record)
      				Mut:BulkOverboekingID = BOV:BulkOverboekingID
      				SET(Mut:Mutatie_FK04, Mut:Mutatie_FK04)
      				LOOP
      					Access:Mutatie.Next()
      					IF ERROR() THEN BREAK.
      					IF Mut:BulkOverboekingID <> BOV:BulkOverboekingID THEN BREAK.
      					
      					verwijder# = 0
      					BREAK
      				.
      			.
      		.
      		
      		IF verwijder#
      			Access:BulkOverboeking.DeleteRecord(false)
      			
      			Pla:Verwerkt = FALSE
      			Pla:MutatieGemaakt = FALSE
      			Access:Planning.Update()
      				
      			!BRW9.ResetQueue(true)
      		.
      	.
      ELSE
      	IF Pla:MutatieGemaakt = TRUE
      		Message('Van de planning-uitslag is al een gewone overboeking gemaakt.','Fout',Icon:Hand)
      		CYCLE
      	.
      	
      	GlobalRequest = InsertRecord
      	BulkOverboekMutatieMaken
      	
      	IF GlobalResponse = RequestCompleted
      		Pla:MutatieGemaakt = TRUE
      		Access:Planning.Update()
      		
      		VoorraadClass.VerwerkGekoppeldeVerkoop(Pla:PlanningID, Pla:OverboekingPlanningID, BOV:NaarCelID)
      			
      		!BRW9.ResetQueue(true)
      	END	
      END
      
      GLO:GebruikerLogHandelingOpmerking = ''
      DO RefreshWindow      
    OF ?OverboekVerwerkt3
      ThisWindow.Update()
      Get(BRW9.Q,Choice(?OverboekList2))
      Pla:PlanningID = BRW9.Q.APla4:PlanningID
      IF Access:Planning.Fetch(Pla:PK_Planning)
      	Message('Planning regel kan niet ingelezen worden','Fout',Icon:Hand)
      	CYCLE
      END
      
      IF Pla:Verwerkt = TRUE
      	Message('Planning-uitslag regel is reeds verwerkt ','Fout',Icon:Hand)
      	CYCLE
      END
      
      GLO:GebruikerLogHandelingOpmerking = 'OverboekVerwerkt'
      
      bulk# = 0
      CLEAR(BOV:Record)
      BOV:PlanningID = Pla:PlanningID
      SET(BOV:FK1_BulkOverboeking, BOV:FK1_BulkOverboeking)
      Access:BulkOverboeking.Next()
      IF NOT(ERROR())
      	IF BOV:PlanningID = Pla:PlanningID THEN
      		bulk# = 1
      	.
      .
      
      IF NOT(bulk#)
      	! Gewone overboeking
      	mutatieID# = 0
      	CLEAR(Mut:Record)
      	Mut:PlanningID = Pla:PlanningID
      	SET(Mut:Mutatie_FK02, Mut:Mutatie_FK02)
      	LOOP
      		Access:Mutatie.Next()
      		IF ERROR() THEN BREAK.
      		IF Mut:PlanningID <> Pla:PlanningID THEN BREAK.
      		
      		IF Mut:SoortMutatie = 'OUIT' THEN
      			mutatieID# = Mut:MutatieID
      			BREAK
      		.
      	.
      
      	CLEAR(Mut:Record)
      	Mut:MutatieID=mutatieID#
      	IF (mutatieID# = 0 or Access:Mutatie.TryFetch(Mut:Mutatie_PK) <> Level:Benign)
      		Clear(Mut:Record)
      		Mut:ArtikelID = Pla:ArtikelID
      		Mut:UitslagKG= Pla:KG
      		Mut:UitslagPallet = Pla:Pallets
      		Mut:CelID = Pla:CelID
      		Mut:PlanningID = Pla:PlanningID
      
      		GlobalRequest = InsertRecord
      		UpdateOverboekMutatie
      	ELSE
      		GlobalRequest = ChangeRecord
      		UpdateOverboekMutatie
      	END
      	
      	IF GlobalResponse = RequestCompleted
      		Pla:Verwerkt = TRUE
      		Pla:MutatieGemaakt = TRUE
      		Access:Planning.Update()
      
      		VoorraadClass.VerwerkGekoppeldeVerkoop(Pla:PlanningID, Pla:OverboekingPlanningID, Mut:NaarCelID)
      		
      		!BRW9.ResetQueue(true)
      	END
      ELSE
      	! Bulk-overboeking
      	GlobalRequest = ChangeRecord
      	BulkOverboekMutatieWijzigen
      	
      	IF GlobalResponse = RequestCompleted
      		Pla:Verwerkt = TRUE
      		Pla:MutatieGemaakt = TRUE
      		Access:Planning.Update()
      		
      		VoorraadClass.VerwerkGekoppeldeVerkoop(Pla:PlanningID, Pla:OverboekingPlanningID, BOV:NaarCelID)
      			
      		!BRW9.ResetQueue(true)
      	ELSE
      		! Controleer of er nog mutaties gekoppeld zijn aan deze bulk-overboeking
      		verwijder# = 0
      		CLEAR(BOV:Record)
      		BOV:PlanningID = Pla:PlanningID
      		SET(BOV:FK1_BulkOverboeking, BOV:FK1_BulkOverboeking)
      		Access:BulkOverboeking.Next()
      		IF NOT(ERROR())
      			IF BOV:PlanningID = Pla:PlanningID THEN
      				verwijder# = 1
      				
      				CLEAR(Mut:Record)
      				Mut:BulkOverboekingID = BOV:BulkOverboekingID
      				SET(Mut:Mutatie_FK04, Mut:Mutatie_FK04)
      				LOOP
      					Access:Mutatie.Next()
      					IF ERROR() THEN BREAK.
      					IF Mut:BulkOverboekingID <> BOV:BulkOverboekingID THEN BREAK.
      					
      					verwijder# = 0
      					BREAK
      				.
      			.
      		.
      		
      		IF verwijder#
      			Access:BulkOverboeking.DeleteRecord(false)
      			
      			Pla:Verwerkt = FALSE
      			Pla:MutatieGemaakt = FALSE
      			Access:Planning.Update()
      				
      			!BRW9.ResetQueue(true)
      		.
      	END
      .
      	  DO RefreshWindow
    OF ?OverboekRapport3
      ThisWindow.Update()
      	!IF AARel:RelatieID = 0 THEN
      	!	MESSAGE('Geen overboeking geselecteerd')
      	!	RETURN ReturnValue
      	!.
      
      	Get(BRW9.Q,Choice(?OverboekList2))
      	IF ERROR() THEN
      		MESSAGE('Geen overboeking geselecteerd')
      		RETURN ReturnValue
      	.
      
      	APla:PlanningID = BRW9.Q.APla4:PlanningID
      	IF Access:APlanning.TryFetch(APla:PK_Planning) <> Level:Benign THEN
      		MESSAGE('Geen overboeking geselecteerd')
      		RETURN ReturnValue
      	.
      
      	WindowCallSjabloon('Overboeking',APla:PlanningID)
    OF ?VerkoopUitslag4
      ThisWindow.Update()
      DO RefreshWindow
    OF ?VerkoopPrintCMR4
      ThisWindow.Update()
      IF GlobalResponse=RequestCompleted
      	! Bijwerken
      	verkoopID# = APla:VerkoopID
      	
      	CLEAR(APla:PlanningID,-1)
      	SET(APla:Planning_FK02, APla:Planning_FK02)
      	LOOP
      		Access:APlanning.Next()
      		IF ERROR() THEN BREAK.
      		IF verkoopID# <> APla:VerkoopID THEN BREAK.
      		
      		APla:Geprint = TRUE
      		Access:APlanning.Update();
      	END
      	
      	DO RefreshWindow
      END
    OF ?VerkoopHVerwerkt4
      ThisWindow.Update()
      DO RefreshWindow      
    OF ?Weeglijst4
      ThisWindow.Update()
      GET(BRW12.Q, CHOICE(?VerkoopList:2))
      ReportWeeglijst('Verkoop', BRW12.Q.APla3:VerkoopID)
    OF ?VerkoopTerugdraaienButton4
      ThisWindow.Update()
      ThisWindow.HandleButton('Terugdraaien', 'VER', 1)
    OF ?VerkoopRapport4
      ThisWindow.Update()
       Get(BRW12.Q,Choice(?VerkoopList:2))
      IF ERROR() THEN
      	MESSAGE('Geen verkoop geselecteerd')
      	RETURN ReturnValue
      .
      
       Ver2:VerkoopID = BRW12.Q.APla3:VerkoopID
      IF Access:Verkoop.TryFetch(Ver2:PK_Verkoop) <> Level:Benign THEN
      	MESSAGE('Geen verkoop geselecteerd')
      	RETURN ReturnValue
      .
      
      ReportVerkoopMutaties(Ver2:VerkoopID)
    OF ?VerkoopPalletbladExport2
      ThisWindow.Update()
      Get(BRW12.Q, Choice(?VerkoopList:2))
      IF NOT(ERROR()) THEN
          ThisWindow.GetMutatie(Brw12.Q.APla3:PlanningID,'UitslagWeging_PalletBlad_Export')
      END
    OF ?VerkoopKwaliteit
      ThisWindow.Update()
      Get(BRW12.Q,Choice(?VerkoopList:2))
      IF ERROR() THEN CYCLE.
      ! de gode mutatie vinden
      Clear(Mut:Record)
      Mut:PlanningID=BRW12.Q.APla3:PlanningID
      Set(Mut:Mutatie_FK02,Mut:Mutatie_FK02)
      Loop Until Access:Mutatie.Next()
          IF NOT Mut:PlanningID=BRW12.Q.APla3:PlanningID THEN BREAK.
          IF Mut:SoortMutatie='UIT'
              GlobalRequest=ChangeRecord
              UpdateMutatieKwaliteit()
          END
      END
      
    OF ?Gister
      ThisWindow.Update()
      Loc:DatumNu -= 1
      DISPLAY(?Loc:DatumNu)
      
      DO ConvertDatum
    OF ?Morgen
      ThisWindow.Update()
      Loc:DatumNu+=1
      DISPLAY(?Loc:DatumNu)
      
      DO ConvertDatum
    OF ?VerkoopExcel
      ThisWindow.Update()
      DO ExportExcel
    OF ?RefreshButton
      ThisWindow.Update()
      DO RefreshBrowses
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
  OF ?Loc:DatumNu
    DO ConvertDatum
  END
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
    OF ?SHEET2
      IF CHOICE(?SHEET2) = 5 THEN
          HIDE(?VerkoopExcel)
      ELSE
          UNHIDE(?VerkoopExcel)
      END
      
      DO KleurActiviteitTab
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

ThisWindow.GetMutatie PROCEDURE(LONG PRM:PlanningID, String PRM:Soort)

Loc:MutatieID		LONG

  CODE
      db.Debugout('Start Get Mutatie')
      Clear(Pla:Record)
      Pla:PlanningID=PRM:PlanningID
      IF Access:Planning.Fetch(Pla:PK_Planning) <> Level:Benign
          Message('Planning-uitslag regel kan niet ingelezen worden','Fout',Icon:Hand)
          Return
      ELSIF PRM:Soort='VerwerkUitslag' or PRM:Soort='VerwerkHandUitslag'   
          IF Pla:VerkoopKGPrijs=0
              Message('Planning-uitslag regel heeft verkoopprijs van 0 en kan niet verwerkt worden','Fout',Icon:Hand)
              Return
          END    
      END
      ! zoek bijbehorende mutatie hierbij anders blijft Loc:MutatieID op nul
      Loc:mutatieID = 0
      CLEAR(Mut:Record)
      Mut:PlanningID = Pla:PlanningID
      SET(Mut:Mutatie_FK02, Mut:Mutatie_FK02)
      LOOP Until Access:Mutatie.Next()
          IF Mut:PlanningID <> Pla:PlanningID THEN BREAK. 		
          Case PRM:Soort
          of 'Uitslag' orof 'UitslagWeging' orof 'UitslagWeging_PalletBlad' orof 'VerwerkUitslag' orof 'VerwerkHandUitslag' orof 'UitslagWeging_PalletBlad_Export'
              IF Mut:SoortMutatie = 'UIT' THEN
                  Loc:mutatieID = Mut:MutatieID
                  BREAK
              .
          of 'Inkoop'
          of 'Overboek'
          ELSE
              Message('Onbekende soort:'&PRM:Soort,'Fout',Icon:Hand)
          END
      END
            
      CLEAR(Mut:Record)
      Mut:MutatieID=Loc:mutatieID
      IF (Loc:mutatieID = 0 or Access:Mutatie.TryFetch(Mut:Mutatie_PK) <> Level:Benign)
          ! Dus mutatie bestaat nog niet
          IF PRM:Soort='UitslagWeging_PalletBlad' or PRM:Soort = 'UitslagWeging_PalletBlad_Export' THEN
              MESSAGE('Er is nog geen uitslag uitgevoerd. Palletbladen kunnen dus nog niet geprint/geexporteerd worden')
              RETURN
          ELSIF PRM:Soort= 'VerwerkUitslag'
              Message('Planning regel is nog niet uitgeslagen','Fout',Icon:Hand)
              RETURN
          END	
          GLO:GebruikerLogHandelingOpmerking = PRM:Soort
  
          Clear(Mut:Record)
          Mut:ArtikelID = Pla:ArtikelID
          Mut:UitslagKG= Pla:KG
          Mut:UitslagPallet = Pla:Pallets
          Mut:CelID = Pla:CelID
          Mut:PlanningID = Pla:PlanningID
          Clear(Ver2:Record)
          Ver2:VerkoopID = Pla:VerkoopID
          Access:Verkoop.Fetch(Ver2:PK_Verkoop)       ! Hier moet ik de klant eigenlijk ophalen 
                    
          IF PRM:Soort= 'VerwerkHandUitslag'
              Mut:DatumTijd_DATE=TODAY()
              Mut:DatumTijd_TIME=CLOCK()
              Mut:SoortMutatie='EUIT'
              Mut:PlanningID=Pla:PlanningID
              IF NOT(Access:Mutatie.Insert() = Level:Benign)
                  IF ERRORCODE() = 90 THEN
                      MESSAGE('Mutatie-record kon niet worden aangemaakt | SQL Error('&FILEERRORCODE()&'):'&FILEERROR()&')')
                  ELSE
                      MESSAGE('Mutatie-record kon niet worden aangemaakt | Error('&ERRORCODE()&'):'&ERROR()&')')
                  END
              ELSE
                  Pla:Verwerkt = TRUE
                  Pla:MutatieGemaakt = TRUE
                  Access:Planning.Update()
                  VoorraadClass.BerekenPlanningMutatieGrootte(Pla:PlanningID)
                  DO UpdateInkoopVerkoopVerwerkStatus
              END			
          ELSE
              GlobalRequest = InsertRecord
              IF PRM:Soort = 'Uitslag' THEN
                  db.Debugout('Start UpdateUitslagMutatie')
                  UpdateUitslagMutatie
                  db.Debugout('Start UpdateUitslagMutatie')
              ELSIF PRM:Soort = 'UitslagWeging' THEN
                  UpdateUitslagMutatieWeging
              END
          END	
          GLO:GebruikerLogHandelingOpmerking = ''
      ELSE        ! dus mutatie wel bestaat en ingelezen is 
          GLO:GebruikerLogHandelingOpmerking = PRM:Soort
          IF PRM:Soort= 'VerwerkHandUitslag'
              Message('Er is al een mutatie regel gemaakt  ','Fout',Icon:Hand)
              RETURN
          END
          Clear(Ver2:Record)
          Ver2:VerkoopID = Pla:VerkoopID
          Access:Verkoop.Fetch(Ver2:PK_Verkoop)
                    ! Hier moet ik de klant eigenlijk ophalen 
                    
          IF PRM:Soort = 'UitslagWeging_PalletBlad' or PRM:Soort = 'UitslagWeging_PalletBlad_Export' THEN
              IF Pla:Gewogen = TRUE
                  !GlobalRequest = ViewRecord         ! 2018-1-30 alleen lezen in de form zetten
                  GlobalRequest = ChangeRecord
              ELSE
                  MESSAGE('Planningsregel is niet via weging uitgeslagen en bevat dus geen palletbladen.')
                  RETURN
              END
          ELSE
              IF Pla:Verwerkt = TRUE
                  Message('Planning-uitslag regel is reeds verwerkt ','Let Op',Icon:Hand)
                  RETURN
                          !GlobalRequest = ViewRecord
              ELSE
                  GlobalRequest = ChangeRecord
              END
          END
          IF PRM:Soort = 'UitslagWeging_PalletBlad_Export' THEN
              db.debugOut('BrowsePlanning - WindowPalletbladExport - ' & Pla:PlanningID & ', ' & Pla:VerkoopID)
              WindowPalletbladExport
              RETURN
          ELSE                
              IF Pla:Gewogen = TRUE THEN
                  UpdateUitslagMutatieWeging
              ELSE
                  db.Debugout('Start UpdateUitslagMutatie')
                  UpdateUitslagMutatie
                  db.Debugout('Start UpdateUitslagMutatie')
              END
          END
          GLO:GebruikerLogHandelingOpmerking = ''
      END
      IF GlobalResponse = RequestCompleted
          db.Debugout('RequestCompleted')
          GLO:GebruikerLogHandelingOpmerking = PRM:Soort & ' - ' & 'RequestCompleted'
          IF PRM:Soort<> 'VerwerkHandUitslag'
              ! 2017-10-4 Hier de planning opnieuw inlezen omdat deze door de Weging aangepast is en weggeschreven is
              ! Maar als we nu alleen één veld willen aanpassen hij de hele oude buffer laat zien????
              Clear(Pla:Record)
              Pla:PlanningID=PRM:PlanningID
              IF Access:Planning.Fetch(Pla:PK_Planning) <> Level:Benign
                  Message('Planning-uitslag regel kan niet opnieuw ingelezen worden','Fout',Icon:Hand)
              END
              ! alleen updaten als nodig 2018-6-21
              IF Pla:MutatieGemaakt = FALSE OR (PRM:Soort= 'VerwerkUitslag' AND Pla:Verwerkt = FALSE) OR Pla:PartijID <> Mut:PartijID
                  Pla:PartijID = Mut:PartijID
                  Pla:MutatieGemaakt = TRUE
                  IF PRM:Soort= 'VerwerkUitslag'
                      Pla:Verwerkt = TRUE
                  END	
                  Access:Planning.Update()
              END
              IF PRM:Soort= 'VerwerkUitslag'			
                      !ReportUitslag
                  CLEAR(Par:Record)
                  Par:PartijID = Mut:PartijID
                  Access:Partij.TryFetch(Par:Partij_PK)
                  DO UpdateInkoopVerkoopVerwerkStatus
              END	
          END	
          GLO:GebruikerLogHandelingOpmerking = ''
          DO RefreshWindow
          db.Debugout('RequestCompleted')
      END
      RETURN


ThisWindow.InslagReport PROCEDURE(LONG PRM:PlanningID)

  CODE
  	! Planningrecord inlezen
  	APla:PlanningID = PRM:PlanningID
  	IF Access:APlanning.Fetch(APla:PK_Planning)
  		Message('Planning-regel kan niet ingelezen worden.','Fout',Icon:Hand)
  	ELSE
  		IF APla:Verwerkt = TRUE
  			! ReportInslag print op basis van de3 huidige partij
  			CLEAR(Par:Record)
  			Par:PartijID = APla:PartijID
  
  			IF Access:Partij.TryFetch(Par:Partij_PK) = Level:Benign
  				db.DebugOut('ReportInslag(' & Par:PartijID & ')')
  				ReportInslag()
  			ELSE
  				Message('Partij ' & APla:PartijID & ' kan niet ingelezen worden.','Fout',Icon:Hand)
  			END
  		ELSE
  			Message('Planning-regel is nog niet verwerkt.','Fout',Icon:Hand)
  		END
  	END


ThisWindow.UitslagReport PROCEDURE(LONG PRM:PlanningID)

  CODE
  	CLEAR(Pla:Record)
  	Pla:PlanningID = PRM:PlanningID
  	IF Access:Planning.TryFetch(Pla:PK_Planning) = Level:Benign
  		IF Pla:Verwerkt = TRUE THEN
  			ReportUitslag()
  		ELSE
  			Message('Planning-regel is nog niet verwerkt.','Fout',Icon:Hand)
  		END
  	ELSE
  		Message('Planning-regel kan niet ingelezen worden.','Fout',Icon:Hand)
  	END


ThisWindow.HandleButton PROCEDURE(STRING PRM:Functie, STRING PRM:InkOvrVer, BOOL PRM:LosseTab)

stmessage           StringTheory

  CODE
  IF NOT(PRM:LosseTab) THEN
  	! Tabblad Planning
  	IF PRM:InkOvrVer = 'INK' THEN
  		Get(BRW6.Q,Choice(?InkoopList))
  		IF ERROR() THEN RETURN.
  			
  		CLEAR(Pla:Record)
  		Pla:PlanningID = BRW6.Q.Pla2:PlanningID
  		IF (Access:Planning.Fetch(Pla:PK_Planning) <> Level:Benign) THEN RETURN.
  	ELSIF PRM:InkOvrVer = 'OVR' THEN
  		Get(BRW8.Q,Choice(?OverboekList))
  		IF ERROR() THEN RETURN.
  		
  		CLEAR(Pla:Record)
  		Pla:PlanningID = BRW8.Q.Pla4:PlanningID
  		IF (Access:Planning.Fetch(Pla:PK_Planning) <> Level:Benign) THEN RETURN.
  	ELSIF PRM:InkOvrVer = 'VER' THEN
  		Get(BRW1.Q,Choice(?VerkoopList))
  		IF ERROR() THEN RETURN.
  
  		CLEAR(Pla:Record)
  		Pla:PlanningID = BRW1.Q.Pla3:PlanningID
  		IF (Access:Planning.Fetch(Pla:PK_Planning) <> Level:Benign) THEN RETURN.
  	END
  ELSE
  	! Tabblad Inkoop, Overboeking en Verkoop
  	IF PRM:InkOvrVer = 'INK' THEN
  		Get(BRW3.Q,Choice(?InkoopList2))
  		IF ERROR() THEN RETURN.
  			
  		CLEAR(Pla:Record)
  		Pla:PlanningID = BRW3.Q.APla2:PlanningID
  		IF (Access:Planning.Fetch(Pla:PK_Planning) <> Level:Benign) THEN RETURN.
  	ELSIF PRM:InkOvrVer = 'OVR' THEN
  		Get(BRW9.Q,Choice(?OverboekList2))
  		IF ERROR() THEN RETURN.
  		
  		CLEAR(Pla:Record)
  		Pla:PlanningID = BRW9.Q.APla4:PlanningID
  		IF (Access:Planning.Fetch(Pla:PK_Planning) <> Level:Benign) THEN RETURN.
  	ELSIF PRM:InkOvrVer = 'VER' THEN
  		Get(BRW12.Q, Choice(?VerkoopList:2))
  		IF ERROR() THEN RETURN.
  
  		CLEAR(Pla:Record)
  		Pla:PlanningID = BRW12.Q.APla3:PlanningID
  		IF (Access:Planning.Fetch(Pla:PK_Planning) <> Level:Benign) THEN RETURN.
  	END
  END
  
  IF CLIP(PRM:Functie) = 'Terugdraaien'
  	!IF NOT(SELF.RegelVerwerkt())
        stmessage.SetValue('Mutaties terugdraaien? De bijbehorende mutaties en mogelijke wegingen worden verwijderd.')
        ! Inkoop terugdraaien 
        IF PRM:InkOvrVer = 'INK'
            stmessage.SetValue('Wilt u de Mutaties terugdraaien van artikelID ')
            stmessage.Append(CLIP(Pla:ArtikelID))
            stmessage.Append('Planning :',,'|')
            stmessage.Append(CLIP(Pla:KG)&' kg ',,' ')
            stmessage.Append(CLIP(Pla:Pallets)&' pallets ',,' ')
            stmessage.Append('Mutatie :',,'|')
            stmessage.Append(CLIP(Pla:MutatieKG)&' kg ',,' ')
            stmessage.Append(CLIP(Pla:MutatiePallets)&' pallets ',,' ')
            stmessage.Append('De bijbehorende mutaties en mogelijke wegingen worden verwijderd!',,'|')
        END    
  		IF MESSAGE(stmessage.Str(), 'Planning-regel ('&Pla:PlanningID&') terugdraaien', ICON:Exclamation, BUTTON:Yes+BUTTON:No, BUTTON:No) =  BUTTON:Yes THEN
  			IF VoorraadClass.VerwijderPlanningMutaties(Pla:PlanningID)
  				DO RefreshWindow
  			END
  		END
  	!END
  ELSE
  	MESSAGE('HandleButton - Onbekende functie: ' & CLIP(PRM:Functie))
  END


ThisWindow.RegelVerwerkt PROCEDURE()

  CODE
  	IF Pla:Verwerkt
  		MESSAGE('Planning-regel is al verwerkt.')
  	END
  	
  	RETURN Pla:Verwerkt


ThisWindow.GetGetransferd PROCEDURE(LONG PRM:PlanningID)

!SQLFile                                 &File
!SQLGroup 								&GROUP
!SQLField                                ANY

  CODE
  ! Uitgeschakeld 2019-6-19 ivm performence (overboekingen worden niet meer gebruikt sinds 2018
  !  IF RECORDS(GetransferdQueue) = 0 THEN
  !  	SQLFile &= NEW(File)
  !  	SQLFile{Prop:Driver}='MSSQL'
  !  	SQLFile{Prop:DriverString}='/BUSYHANDLING=2'
  !  	SQLFile{Prop:Owner}=GLO:Owner
  !  	SQLFile{Prop:Sql}='SELECT dbo.OverboekingRitRegel.PlanningID FROM OverboekingRitRegel '&|
  !  		'INNER JOIN dbo.OverboekingRit ON dbo.OverboekingRit.OverboekingRitID = dbo.OverboekingRitRegel.OverboekingRitID '&|
  !  		'ORDER BY dbo.OverboekingRitRegel.PlanningID'
  !  			
  !  	FIXFORMAT(SQLFile)	
  !  	IF ERROR() THEN STOP(ERROR()&' bij de fixformat').
  !  	SQLGroup &= SQLFile{Prop:Record}
  !  	
  !  	LOOP
  !  		Next(SQLFile)
  !  		IF ERROR() Then Break.
  !  		
  !  		SQLField &= WHAT(SQLGroup,1)
  !  		TQ:PlanningID = SQLField
  !  		ADD(GetransferdQueue, +TQ:PlanningID)
  !  	 	IF ERROR() THEN STOP(ERROR()&' bij toevoegen aan GetransferdQueue').
  !  	END	
  !  	
  !  	CLOSE(SQLFile)
  !  	 IF ERROR() THEN STOP(ERROR()&' bij de close').
  !  	DISPOSE(SQLFile)
  !  	IF ERROR() THEN STOP(ERROR()&' bij de dispose').
  !  END
  !  
  !  TQ:PlanningID = PRM:PlanningID
  !  GET(GetransferdQueue, +TQ:PlanningID)
  !  IF NOT(ERROR()) THEN
  !        RETURN 1
  !    ELSE
  !    RETURN 0
  !   END
    Clear(ORR:Record)
    Set(OverboekingRitRegel)
    OverboekingRitRegel{Prop:Where}='PlanningID='&PRM:PlanningID
    IF Access:OverboekingRitRegel.Next()=Level:Benign
        RETURN 1
    ELSE
        RETURN 0
    END
  



BRW6.Fetch PROCEDURE(BYTE Direction)

GreenBarIndex   LONG,AUTO
  CODE
  PARENT.Fetch(Direction)
  !----------------------------------------------------------------------
    LOOP GreenBarIndex=1 TO RECORDS(SELF.Q)
      GET(SELF.Q,GreenBarIndex)
      SELF.Q.Pla2:ArtikelID_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for Pla2:ArtikelID
      SELF.Q.Pla2:ArtikelID_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.Pla2:ArtikelID_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla2:ArtikelID_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla2:ArtikelOms_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for Pla2:ArtikelOms
      SELF.Q.Pla2:ArtikelOms_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.Pla2:ArtikelOms_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla2:ArtikelOms_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla2:FirmaNaam_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for Pla2:FirmaNaam
      SELF.Q.Pla2:FirmaNaam_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.Pla2:FirmaNaam_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla2:FirmaNaam_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.LOC:InkoopKG1_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for LOC:InkoopKG1
      SELF.Q.LOC:InkoopKG1_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.LOC:InkoopKG1_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.LOC:InkoopKG1_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla2:Instructie_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for Pla2:Instructie
      SELF.Q.Pla2:Instructie_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.Pla2:Instructie_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla2:Instructie_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla2:VerpakkingOmschrijving_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for Pla2:VerpakkingOmschrijving
      SELF.Q.Pla2:VerpakkingOmschrijving_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.Pla2:VerpakkingOmschrijving_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla2:VerpakkingOmschrijving_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla2:Planning_TIME_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for Pla2:Planning_TIME
      SELF.Q.Pla2:Planning_TIME_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.Pla2:Planning_TIME_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla2:Planning_TIME_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.LOC:InkoopPallets1_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for LOC:InkoopPallets1
      SELF.Q.LOC:InkoopPallets1_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.LOC:InkoopPallets1_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.LOC:InkoopPallets1_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla2:MutatieGemaakt_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for Pla2:MutatieGemaakt
      SELF.Q.Pla2:MutatieGemaakt_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.Pla2:MutatieGemaakt_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla2:MutatieGemaakt_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla2:Geprint_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for Pla2:Geprint
      SELF.Q.Pla2:Geprint_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.Pla2:Geprint_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla2:Geprint_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.LOC:Getransferd_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for LOC:Getransferd
      SELF.Q.LOC:Getransferd_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.LOC:Getransferd_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.LOC:Getransferd_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla2:Verwerkt_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for Pla2:Verwerkt
      SELF.Q.Pla2:Verwerkt_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.Pla2:Verwerkt_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla2:Verwerkt_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla2:Gewogen_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for Pla2:Gewogen
      SELF.Q.Pla2:Gewogen_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.Pla2:Gewogen_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla2:Gewogen_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla2:CelOms_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for Pla2:CelOms
      SELF.Q.Pla2:CelOms_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.Pla2:CelOms_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla2:CelOms_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla2:Locatienaam_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for Pla2:Locatienaam
      SELF.Q.Pla2:Locatienaam_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.Pla2:Locatienaam_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla2:Locatienaam_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla2:Transport_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for Pla2:Transport
      SELF.Q.Pla2:Transport_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.Pla2:Transport_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla2:Transport_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla2:PlanningID_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for Pla2:PlanningID
      SELF.Q.Pla2:PlanningID_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.Pla2:PlanningID_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla2:PlanningID_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      PUT(SELF.Q)
    END
  !----------------------------------------------------------------------


BRW6.ResetQueue PROCEDURE(BYTE ResetMode)

  CODE
  	db.DebugOut('START DUUR PlanningInkoop.ResetQueue')
  	pre_timing# = CLOCK()
  PARENT.ResetQueue(ResetMode)
  	post_timing# = CLOCK()
  	db.DebugOut('METING DUUR PlanningInkoop.ResetQueue : ' & (post_timing# - pre_timing#))


BRW6.SetQueueRecord PROCEDURE

  CODE
  LOC:Getransferd = ThisWindow.GetGetransferd(Pla2:PlanningID)
  
  IF Pla2:MutatieGemaakt THEN
  	LOC:InkoopKG1 = Pla2:MutatieKG
  	LOC:InkoopPallets1 = Pla2:MutatiePallets
  ELSE
  	LOC:InkoopKG1 = Pla2:KG
  	LOC:InkoopPallets1 = Pla2:Pallets
  END
  PARENT.SetQueueRecord
  
  IF (Pla2:MutatieGemaakt)
    SELF.Q.Pla2:MutatieGemaakt_Icon = 2                    ! Set icon from icon list
  ELSE
    SELF.Q.Pla2:MutatieGemaakt_Icon = 1                    ! Set icon from icon list
  END
  IF (Pla2:Geprint)
    SELF.Q.Pla2:Geprint_Icon = 2                           ! Set icon from icon list
  ELSE
    SELF.Q.Pla2:Geprint_Icon = 1                           ! Set icon from icon list
  END
  IF (LOC:Getransferd)
    SELF.Q.LOC:Getransferd_Icon = 2                        ! Set icon from icon list
  ELSE
    SELF.Q.LOC:Getransferd_Icon = 1                        ! Set icon from icon list
  END
  IF (Pla2:Verwerkt)
    SELF.Q.Pla2:Verwerkt_Icon = 2                          ! Set icon from icon list
  ELSE
    SELF.Q.Pla2:Verwerkt_Icon = 1                          ! Set icon from icon list
  END
  IF (Pla2:Gewogen)
    SELF.Q.Pla2:Gewogen_Icon = 2                           ! Set icon from icon list
  ELSE
    SELF.Q.Pla2:Gewogen_Icon = 1                           ! Set icon from icon list
  END
  !----------------------------------------------------------------------
      SELF.Q.Pla2:ArtikelID_NormalFG   = CHOOSE(CHOICE(?InkoopList) % 2,-1,-1) ! Set color values for Pla2:ArtikelID
      SELF.Q.Pla2:ArtikelID_NormalBG   = CHOOSE(CHOICE(?InkoopList) % 2,-1,8454143)
      SELF.Q.Pla2:ArtikelID_SelectedFG = CHOOSE(CHOICE(?InkoopList) % 2,-1,-1)
      SELF.Q.Pla2:ArtikelID_SelectedBG = CHOOSE(CHOICE(?InkoopList) % 2,-1,-1)
      SELF.Q.Pla2:ArtikelOms_NormalFG   = CHOOSE(CHOICE(?InkoopList) % 2,-1,-1) ! Set color values for Pla2:ArtikelOms
      SELF.Q.Pla2:ArtikelOms_NormalBG   = CHOOSE(CHOICE(?InkoopList) % 2,-1,8454143)
      SELF.Q.Pla2:ArtikelOms_SelectedFG = CHOOSE(CHOICE(?InkoopList) % 2,-1,-1)
      SELF.Q.Pla2:ArtikelOms_SelectedBG = CHOOSE(CHOICE(?InkoopList) % 2,-1,-1)
      SELF.Q.Pla2:FirmaNaam_NormalFG   = CHOOSE(CHOICE(?InkoopList) % 2,-1,-1) ! Set color values for Pla2:FirmaNaam
      SELF.Q.Pla2:FirmaNaam_NormalBG   = CHOOSE(CHOICE(?InkoopList) % 2,-1,8454143)
      SELF.Q.Pla2:FirmaNaam_SelectedFG = CHOOSE(CHOICE(?InkoopList) % 2,-1,-1)
      SELF.Q.Pla2:FirmaNaam_SelectedBG = CHOOSE(CHOICE(?InkoopList) % 2,-1,-1)
      SELF.Q.LOC:InkoopKG1_NormalFG   = CHOOSE(CHOICE(?InkoopList) % 2,-1,-1) ! Set color values for LOC:InkoopKG1
      SELF.Q.LOC:InkoopKG1_NormalBG   = CHOOSE(CHOICE(?InkoopList) % 2,-1,8454143)
      SELF.Q.LOC:InkoopKG1_SelectedFG = CHOOSE(CHOICE(?InkoopList) % 2,-1,-1)
      SELF.Q.LOC:InkoopKG1_SelectedBG = CHOOSE(CHOICE(?InkoopList) % 2,-1,-1)
      SELF.Q.Pla2:Instructie_NormalFG   = CHOOSE(CHOICE(?InkoopList) % 2,-1,-1) ! Set color values for Pla2:Instructie
      SELF.Q.Pla2:Instructie_NormalBG   = CHOOSE(CHOICE(?InkoopList) % 2,-1,8454143)
      SELF.Q.Pla2:Instructie_SelectedFG = CHOOSE(CHOICE(?InkoopList) % 2,-1,-1)
      SELF.Q.Pla2:Instructie_SelectedBG = CHOOSE(CHOICE(?InkoopList) % 2,-1,-1)
      SELF.Q.Pla2:VerpakkingOmschrijving_NormalFG   = CHOOSE(CHOICE(?InkoopList) % 2,-1,-1) ! Set color values for Pla2:VerpakkingOmschrijving
      SELF.Q.Pla2:VerpakkingOmschrijving_NormalBG   = CHOOSE(CHOICE(?InkoopList) % 2,-1,8454143)
      SELF.Q.Pla2:VerpakkingOmschrijving_SelectedFG = CHOOSE(CHOICE(?InkoopList) % 2,-1,-1)
      SELF.Q.Pla2:VerpakkingOmschrijving_SelectedBG = CHOOSE(CHOICE(?InkoopList) % 2,-1,-1)
      SELF.Q.Pla2:Planning_TIME_NormalFG   = CHOOSE(CHOICE(?InkoopList) % 2,-1,-1) ! Set color values for Pla2:Planning_TIME
      SELF.Q.Pla2:Planning_TIME_NormalBG   = CHOOSE(CHOICE(?InkoopList) % 2,-1,8454143)
      SELF.Q.Pla2:Planning_TIME_SelectedFG = CHOOSE(CHOICE(?InkoopList) % 2,-1,-1)
      SELF.Q.Pla2:Planning_TIME_SelectedBG = CHOOSE(CHOICE(?InkoopList) % 2,-1,-1)
      SELF.Q.LOC:InkoopPallets1_NormalFG   = CHOOSE(CHOICE(?InkoopList) % 2,-1,-1) ! Set color values for LOC:InkoopPallets1
      SELF.Q.LOC:InkoopPallets1_NormalBG   = CHOOSE(CHOICE(?InkoopList) % 2,-1,8454143)
      SELF.Q.LOC:InkoopPallets1_SelectedFG = CHOOSE(CHOICE(?InkoopList) % 2,-1,-1)
      SELF.Q.LOC:InkoopPallets1_SelectedBG = CHOOSE(CHOICE(?InkoopList) % 2,-1,-1)
      SELF.Q.Pla2:MutatieGemaakt_NormalFG   = CHOOSE(CHOICE(?InkoopList) % 2,-1,-1) ! Set color values for Pla2:MutatieGemaakt
      SELF.Q.Pla2:MutatieGemaakt_NormalBG   = CHOOSE(CHOICE(?InkoopList) % 2,-1,8454143)
      SELF.Q.Pla2:MutatieGemaakt_SelectedFG = CHOOSE(CHOICE(?InkoopList) % 2,-1,-1)
      SELF.Q.Pla2:MutatieGemaakt_SelectedBG = CHOOSE(CHOICE(?InkoopList) % 2,-1,-1)
      SELF.Q.Pla2:Geprint_NormalFG   = CHOOSE(CHOICE(?InkoopList) % 2,-1,-1) ! Set color values for Pla2:Geprint
      SELF.Q.Pla2:Geprint_NormalBG   = CHOOSE(CHOICE(?InkoopList) % 2,-1,8454143)
      SELF.Q.Pla2:Geprint_SelectedFG = CHOOSE(CHOICE(?InkoopList) % 2,-1,-1)
      SELF.Q.Pla2:Geprint_SelectedBG = CHOOSE(CHOICE(?InkoopList) % 2,-1,-1)
      SELF.Q.LOC:Getransferd_NormalFG   = CHOOSE(CHOICE(?InkoopList) % 2,-1,-1) ! Set color values for LOC:Getransferd
      SELF.Q.LOC:Getransferd_NormalBG   = CHOOSE(CHOICE(?InkoopList) % 2,-1,8454143)
      SELF.Q.LOC:Getransferd_SelectedFG = CHOOSE(CHOICE(?InkoopList) % 2,-1,-1)
      SELF.Q.LOC:Getransferd_SelectedBG = CHOOSE(CHOICE(?InkoopList) % 2,-1,-1)
      SELF.Q.Pla2:Verwerkt_NormalFG   = CHOOSE(CHOICE(?InkoopList) % 2,-1,-1) ! Set color values for Pla2:Verwerkt
      SELF.Q.Pla2:Verwerkt_NormalBG   = CHOOSE(CHOICE(?InkoopList) % 2,-1,8454143)
      SELF.Q.Pla2:Verwerkt_SelectedFG = CHOOSE(CHOICE(?InkoopList) % 2,-1,-1)
      SELF.Q.Pla2:Verwerkt_SelectedBG = CHOOSE(CHOICE(?InkoopList) % 2,-1,-1)
      SELF.Q.Pla2:Gewogen_NormalFG   = CHOOSE(CHOICE(?InkoopList) % 2,-1,-1) ! Set color values for Pla2:Gewogen
      SELF.Q.Pla2:Gewogen_NormalBG   = CHOOSE(CHOICE(?InkoopList) % 2,-1,8454143)
      SELF.Q.Pla2:Gewogen_SelectedFG = CHOOSE(CHOICE(?InkoopList) % 2,-1,-1)
      SELF.Q.Pla2:Gewogen_SelectedBG = CHOOSE(CHOICE(?InkoopList) % 2,-1,-1)
      SELF.Q.Pla2:CelOms_NormalFG   = CHOOSE(CHOICE(?InkoopList) % 2,-1,-1) ! Set color values for Pla2:CelOms
      SELF.Q.Pla2:CelOms_NormalBG   = CHOOSE(CHOICE(?InkoopList) % 2,-1,8454143)
      SELF.Q.Pla2:CelOms_SelectedFG = CHOOSE(CHOICE(?InkoopList) % 2,-1,-1)
      SELF.Q.Pla2:CelOms_SelectedBG = CHOOSE(CHOICE(?InkoopList) % 2,-1,-1)
      SELF.Q.Pla2:Locatienaam_NormalFG   = CHOOSE(CHOICE(?InkoopList) % 2,-1,-1) ! Set color values for Pla2:Locatienaam
      SELF.Q.Pla2:Locatienaam_NormalBG   = CHOOSE(CHOICE(?InkoopList) % 2,-1,8454143)
      SELF.Q.Pla2:Locatienaam_SelectedFG = CHOOSE(CHOICE(?InkoopList) % 2,-1,-1)
      SELF.Q.Pla2:Locatienaam_SelectedBG = CHOOSE(CHOICE(?InkoopList) % 2,-1,-1)
      SELF.Q.Pla2:Transport_NormalFG   = CHOOSE(CHOICE(?InkoopList) % 2,-1,-1) ! Set color values for Pla2:Transport
      SELF.Q.Pla2:Transport_NormalBG   = CHOOSE(CHOICE(?InkoopList) % 2,-1,8454143)
      SELF.Q.Pla2:Transport_SelectedFG = CHOOSE(CHOICE(?InkoopList) % 2,-1,-1)
      SELF.Q.Pla2:Transport_SelectedBG = CHOOSE(CHOICE(?InkoopList) % 2,-1,-1)
      SELF.Q.Pla2:PlanningID_NormalFG   = CHOOSE(CHOICE(?InkoopList) % 2,-1,-1) ! Set color values for Pla2:PlanningID
      SELF.Q.Pla2:PlanningID_NormalBG   = CHOOSE(CHOICE(?InkoopList) % 2,-1,8454143)
      SELF.Q.Pla2:PlanningID_SelectedFG = CHOOSE(CHOICE(?InkoopList) % 2,-1,-1)
      SELF.Q.Pla2:PlanningID_SelectedBG = CHOOSE(CHOICE(?InkoopList) % 2,-1,-1)
  !----------------------------------------------------------------------


BRW1.Fetch PROCEDURE(BYTE Direction)

GreenBarIndex   LONG,AUTO
  CODE
  PARENT.Fetch(Direction)
  !----------------------------------------------------------------------
    LOOP GreenBarIndex=1 TO RECORDS(SELF.Q)
      GET(SELF.Q,GreenBarIndex)
      SELF.Q.Pla3:ArtikelID_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for Pla3:ArtikelID
      SELF.Q.Pla3:ArtikelID_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.Pla3:ArtikelID_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla3:ArtikelID_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla3:ArtikelOms_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for Pla3:ArtikelOms
      SELF.Q.Pla3:ArtikelOms_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.Pla3:ArtikelOms_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla3:ArtikelOms_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla3:FirmaNaam_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for Pla3:FirmaNaam
      SELF.Q.Pla3:FirmaNaam_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.Pla3:FirmaNaam_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla3:FirmaNaam_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla3:PartijID_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for Pla3:PartijID
      SELF.Q.Pla3:PartijID_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.Pla3:PartijID_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla3:PartijID_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla3:ExternPartijnr_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for Pla3:ExternPartijnr
      SELF.Q.Pla3:ExternPartijnr_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.Pla3:ExternPartijnr_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla3:ExternPartijnr_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.LOC:VerkoopKG1_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for LOC:VerkoopKG1
      SELF.Q.LOC:VerkoopKG1_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.LOC:VerkoopKG1_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.LOC:VerkoopKG1_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla3:Instructie_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for Pla3:Instructie
      SELF.Q.Pla3:Instructie_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.Pla3:Instructie_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla3:Instructie_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla3:VerpakkingOmschrijving_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for Pla3:VerpakkingOmschrijving
      SELF.Q.Pla3:VerpakkingOmschrijving_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.Pla3:VerpakkingOmschrijving_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla3:VerpakkingOmschrijving_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla3:Planning_TIME_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for Pla3:Planning_TIME
      SELF.Q.Pla3:Planning_TIME_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.Pla3:Planning_TIME_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla3:Planning_TIME_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.LOC:VerkoopPallets1_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for LOC:VerkoopPallets1
      SELF.Q.LOC:VerkoopPallets1_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.LOC:VerkoopPallets1_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.LOC:VerkoopPallets1_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla3:MutatieGemaakt_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for Pla3:MutatieGemaakt
      SELF.Q.Pla3:MutatieGemaakt_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.Pla3:MutatieGemaakt_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla3:MutatieGemaakt_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla3:Geprint_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for Pla3:Geprint
      SELF.Q.Pla3:Geprint_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.Pla3:Geprint_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla3:Geprint_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla3:Verwerkt_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for Pla3:Verwerkt
      SELF.Q.Pla3:Verwerkt_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.Pla3:Verwerkt_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla3:Verwerkt_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla3:Gewogen_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for Pla3:Gewogen
      SELF.Q.Pla3:Gewogen_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.Pla3:Gewogen_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla3:Gewogen_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla3:CelOms_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for Pla3:CelOms
      SELF.Q.Pla3:CelOms_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.Pla3:CelOms_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla3:CelOms_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.LOC:Locatienaam_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for LOC:Locatienaam
      SELF.Q.LOC:Locatienaam_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.LOC:Locatienaam_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.LOC:Locatienaam_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla3:HerkomstOverboekingCelOms_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for Pla3:HerkomstOverboekingCelOms
      SELF.Q.Pla3:HerkomstOverboekingCelOms_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.Pla3:HerkomstOverboekingCelOms_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla3:HerkomstOverboekingCelOms_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla3:LeverancierFirmaNaam_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for Pla3:LeverancierFirmaNaam
      SELF.Q.Pla3:LeverancierFirmaNaam_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.Pla3:LeverancierFirmaNaam_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla3:LeverancierFirmaNaam_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla3:Transport_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for Pla3:Transport
      SELF.Q.Pla3:Transport_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.Pla3:Transport_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla3:Transport_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla3:PlanningID_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for Pla3:PlanningID
      SELF.Q.Pla3:PlanningID_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.Pla3:PlanningID_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla3:PlanningID_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      PUT(SELF.Q)
    END
  !----------------------------------------------------------------------


BRW1.ResetQueue PROCEDURE(BYTE ResetMode)

  CODE
  db.DebugOut('START DUUR PlanningVerkoop.ResetQueue')
  pre_timing# = CLOCK()
  PARENT.ResetQueue(ResetMode)
  post_timing# = CLOCK()
  db.DebugOut('METING DUUR PlanningVerkoop.ResetQueue : ' & (post_timing# - pre_timing#))


BRW1.SetQueueRecord PROCEDURE

  CODE
  LOC:Locatienaam = CachingClass.GetCelLocatieNaam(Pla3:PartijID,Pla3:CelID)
  
  IF Pla3:MutatieGemaakt THEN
  	LOC:VerkoopKG1 = Pla3:MutatieKG
  	LOC:VerkoopPallets1 = Pla3:MutatiePallets
  ELSE
  	LOC:VerkoopKG1 = Pla3:KG
  	LOC:VerkoopPallets1 = Pla3:Pallets
  END
  PARENT.SetQueueRecord
  
  CLEAR (SELF.Q.Pla3:Instructie_Tip)
  IF (Pla3:MutatieGemaakt)
    SELF.Q.Pla3:MutatieGemaakt_Icon = 2                    ! Set icon from icon list
  ELSE
    SELF.Q.Pla3:MutatieGemaakt_Icon = 1                    ! Set icon from icon list
  END
  IF (Pla3:Geprint)
    SELF.Q.Pla3:Geprint_Icon = 2                           ! Set icon from icon list
  ELSE
    SELF.Q.Pla3:Geprint_Icon = 1                           ! Set icon from icon list
  END
  IF (Pla3:Verwerkt)
    SELF.Q.Pla3:Verwerkt_Icon = 2                          ! Set icon from icon list
  ELSE
    SELF.Q.Pla3:Verwerkt_Icon = 1                          ! Set icon from icon list
  END
  IF (Pla3:Gewogen)
    SELF.Q.Pla3:Gewogen_Icon = 2                           ! Set icon from icon list
  ELSE
    SELF.Q.Pla3:Gewogen_Icon = 1                           ! Set icon from icon list
  END
  CLEAR (SELF.Q.Pla3:Transport_Tip)
  CLEAR (SELF.Q.Pla3:PlanningID_Tip)
  !----------------------------------------------------------------------
      SELF.Q.Pla3:ArtikelID_NormalFG   = CHOOSE(CHOICE(?VerkoopList) % 2,-1,-1) ! Set color values for Pla3:ArtikelID
      SELF.Q.Pla3:ArtikelID_NormalBG   = CHOOSE(CHOICE(?VerkoopList) % 2,-1,8454143)
      SELF.Q.Pla3:ArtikelID_SelectedFG = CHOOSE(CHOICE(?VerkoopList) % 2,-1,-1)
      SELF.Q.Pla3:ArtikelID_SelectedBG = CHOOSE(CHOICE(?VerkoopList) % 2,-1,-1)
      SELF.Q.Pla3:ArtikelOms_NormalFG   = CHOOSE(CHOICE(?VerkoopList) % 2,-1,-1) ! Set color values for Pla3:ArtikelOms
      SELF.Q.Pla3:ArtikelOms_NormalBG   = CHOOSE(CHOICE(?VerkoopList) % 2,-1,8454143)
      SELF.Q.Pla3:ArtikelOms_SelectedFG = CHOOSE(CHOICE(?VerkoopList) % 2,-1,-1)
      SELF.Q.Pla3:ArtikelOms_SelectedBG = CHOOSE(CHOICE(?VerkoopList) % 2,-1,-1)
      SELF.Q.Pla3:FirmaNaam_NormalFG   = CHOOSE(CHOICE(?VerkoopList) % 2,-1,-1) ! Set color values for Pla3:FirmaNaam
      SELF.Q.Pla3:FirmaNaam_NormalBG   = CHOOSE(CHOICE(?VerkoopList) % 2,-1,8454143)
      SELF.Q.Pla3:FirmaNaam_SelectedFG = CHOOSE(CHOICE(?VerkoopList) % 2,-1,-1)
      SELF.Q.Pla3:FirmaNaam_SelectedBG = CHOOSE(CHOICE(?VerkoopList) % 2,-1,-1)
      SELF.Q.Pla3:PartijID_NormalFG   = CHOOSE(CHOICE(?VerkoopList) % 2,-1,-1) ! Set color values for Pla3:PartijID
      SELF.Q.Pla3:PartijID_NormalBG   = CHOOSE(CHOICE(?VerkoopList) % 2,-1,8454143)
      SELF.Q.Pla3:PartijID_SelectedFG = CHOOSE(CHOICE(?VerkoopList) % 2,-1,-1)
      SELF.Q.Pla3:PartijID_SelectedBG = CHOOSE(CHOICE(?VerkoopList) % 2,-1,-1)
      SELF.Q.Pla3:ExternPartijnr_NormalFG   = CHOOSE(CHOICE(?VerkoopList) % 2,-1,-1) ! Set color values for Pla3:ExternPartijnr
      SELF.Q.Pla3:ExternPartijnr_NormalBG   = CHOOSE(CHOICE(?VerkoopList) % 2,-1,8454143)
      SELF.Q.Pla3:ExternPartijnr_SelectedFG = CHOOSE(CHOICE(?VerkoopList) % 2,-1,-1)
      SELF.Q.Pla3:ExternPartijnr_SelectedBG = CHOOSE(CHOICE(?VerkoopList) % 2,-1,-1)
      SELF.Q.LOC:VerkoopKG1_NormalFG   = CHOOSE(CHOICE(?VerkoopList) % 2,-1,-1) ! Set color values for LOC:VerkoopKG1
      SELF.Q.LOC:VerkoopKG1_NormalBG   = CHOOSE(CHOICE(?VerkoopList) % 2,-1,8454143)
      SELF.Q.LOC:VerkoopKG1_SelectedFG = CHOOSE(CHOICE(?VerkoopList) % 2,-1,-1)
      SELF.Q.LOC:VerkoopKG1_SelectedBG = CHOOSE(CHOICE(?VerkoopList) % 2,-1,-1)
      SELF.Q.Pla3:Instructie_NormalFG   = CHOOSE(CHOICE(?VerkoopList) % 2,-1,-1) ! Set color values for Pla3:Instructie
      SELF.Q.Pla3:Instructie_NormalBG   = CHOOSE(CHOICE(?VerkoopList) % 2,-1,8454143)
      SELF.Q.Pla3:Instructie_SelectedFG = CHOOSE(CHOICE(?VerkoopList) % 2,-1,-1)
      SELF.Q.Pla3:Instructie_SelectedBG = CHOOSE(CHOICE(?VerkoopList) % 2,-1,-1)
      SELF.Q.Pla3:VerpakkingOmschrijving_NormalFG   = CHOOSE(CHOICE(?VerkoopList) % 2,-1,-1) ! Set color values for Pla3:VerpakkingOmschrijving
      SELF.Q.Pla3:VerpakkingOmschrijving_NormalBG   = CHOOSE(CHOICE(?VerkoopList) % 2,-1,8454143)
      SELF.Q.Pla3:VerpakkingOmschrijving_SelectedFG = CHOOSE(CHOICE(?VerkoopList) % 2,-1,-1)
      SELF.Q.Pla3:VerpakkingOmschrijving_SelectedBG = CHOOSE(CHOICE(?VerkoopList) % 2,-1,-1)
      SELF.Q.Pla3:Planning_TIME_NormalFG   = CHOOSE(CHOICE(?VerkoopList) % 2,-1,-1) ! Set color values for Pla3:Planning_TIME
      SELF.Q.Pla3:Planning_TIME_NormalBG   = CHOOSE(CHOICE(?VerkoopList) % 2,-1,8454143)
      SELF.Q.Pla3:Planning_TIME_SelectedFG = CHOOSE(CHOICE(?VerkoopList) % 2,-1,-1)
      SELF.Q.Pla3:Planning_TIME_SelectedBG = CHOOSE(CHOICE(?VerkoopList) % 2,-1,-1)
      SELF.Q.LOC:VerkoopPallets1_NormalFG   = CHOOSE(CHOICE(?VerkoopList) % 2,-1,-1) ! Set color values for LOC:VerkoopPallets1
      SELF.Q.LOC:VerkoopPallets1_NormalBG   = CHOOSE(CHOICE(?VerkoopList) % 2,-1,8454143)
      SELF.Q.LOC:VerkoopPallets1_SelectedFG = CHOOSE(CHOICE(?VerkoopList) % 2,-1,-1)
      SELF.Q.LOC:VerkoopPallets1_SelectedBG = CHOOSE(CHOICE(?VerkoopList) % 2,-1,-1)
      SELF.Q.Pla3:MutatieGemaakt_NormalFG   = CHOOSE(CHOICE(?VerkoopList) % 2,-1,-1) ! Set color values for Pla3:MutatieGemaakt
      SELF.Q.Pla3:MutatieGemaakt_NormalBG   = CHOOSE(CHOICE(?VerkoopList) % 2,-1,8454143)
      SELF.Q.Pla3:MutatieGemaakt_SelectedFG = CHOOSE(CHOICE(?VerkoopList) % 2,-1,-1)
      SELF.Q.Pla3:MutatieGemaakt_SelectedBG = CHOOSE(CHOICE(?VerkoopList) % 2,-1,-1)
      SELF.Q.Pla3:Geprint_NormalFG   = CHOOSE(CHOICE(?VerkoopList) % 2,-1,-1) ! Set color values for Pla3:Geprint
      SELF.Q.Pla3:Geprint_NormalBG   = CHOOSE(CHOICE(?VerkoopList) % 2,-1,8454143)
      SELF.Q.Pla3:Geprint_SelectedFG = CHOOSE(CHOICE(?VerkoopList) % 2,-1,-1)
      SELF.Q.Pla3:Geprint_SelectedBG = CHOOSE(CHOICE(?VerkoopList) % 2,-1,-1)
      SELF.Q.Pla3:Verwerkt_NormalFG   = CHOOSE(CHOICE(?VerkoopList) % 2,-1,-1) ! Set color values for Pla3:Verwerkt
      SELF.Q.Pla3:Verwerkt_NormalBG   = CHOOSE(CHOICE(?VerkoopList) % 2,-1,8454143)
      SELF.Q.Pla3:Verwerkt_SelectedFG = CHOOSE(CHOICE(?VerkoopList) % 2,-1,-1)
      SELF.Q.Pla3:Verwerkt_SelectedBG = CHOOSE(CHOICE(?VerkoopList) % 2,-1,-1)
      SELF.Q.Pla3:Gewogen_NormalFG   = CHOOSE(CHOICE(?VerkoopList) % 2,-1,-1) ! Set color values for Pla3:Gewogen
      SELF.Q.Pla3:Gewogen_NormalBG   = CHOOSE(CHOICE(?VerkoopList) % 2,-1,8454143)
      SELF.Q.Pla3:Gewogen_SelectedFG = CHOOSE(CHOICE(?VerkoopList) % 2,-1,-1)
      SELF.Q.Pla3:Gewogen_SelectedBG = CHOOSE(CHOICE(?VerkoopList) % 2,-1,-1)
      SELF.Q.Pla3:CelOms_NormalFG   = CHOOSE(CHOICE(?VerkoopList) % 2,-1,-1) ! Set color values for Pla3:CelOms
      SELF.Q.Pla3:CelOms_NormalBG   = CHOOSE(CHOICE(?VerkoopList) % 2,-1,8454143)
      SELF.Q.Pla3:CelOms_SelectedFG = CHOOSE(CHOICE(?VerkoopList) % 2,-1,-1)
      SELF.Q.Pla3:CelOms_SelectedBG = CHOOSE(CHOICE(?VerkoopList) % 2,-1,-1)
      SELF.Q.LOC:Locatienaam_NormalFG   = CHOOSE(CHOICE(?VerkoopList) % 2,-1,-1) ! Set color values for LOC:Locatienaam
      SELF.Q.LOC:Locatienaam_NormalBG   = CHOOSE(CHOICE(?VerkoopList) % 2,-1,8454143)
      SELF.Q.LOC:Locatienaam_SelectedFG = CHOOSE(CHOICE(?VerkoopList) % 2,-1,-1)
      SELF.Q.LOC:Locatienaam_SelectedBG = CHOOSE(CHOICE(?VerkoopList) % 2,-1,-1)
      SELF.Q.Pla3:HerkomstOverboekingCelOms_NormalFG   = CHOOSE(CHOICE(?VerkoopList) % 2,-1,-1) ! Set color values for Pla3:HerkomstOverboekingCelOms
      SELF.Q.Pla3:HerkomstOverboekingCelOms_NormalBG   = CHOOSE(CHOICE(?VerkoopList) % 2,-1,8454143)
      SELF.Q.Pla3:HerkomstOverboekingCelOms_SelectedFG = CHOOSE(CHOICE(?VerkoopList) % 2,-1,-1)
      SELF.Q.Pla3:HerkomstOverboekingCelOms_SelectedBG = CHOOSE(CHOICE(?VerkoopList) % 2,-1,-1)
      SELF.Q.Pla3:LeverancierFirmaNaam_NormalFG   = CHOOSE(CHOICE(?VerkoopList) % 2,-1,-1) ! Set color values for Pla3:LeverancierFirmaNaam
      SELF.Q.Pla3:LeverancierFirmaNaam_NormalBG   = CHOOSE(CHOICE(?VerkoopList) % 2,-1,8454143)
      SELF.Q.Pla3:LeverancierFirmaNaam_SelectedFG = CHOOSE(CHOICE(?VerkoopList) % 2,-1,-1)
      SELF.Q.Pla3:LeverancierFirmaNaam_SelectedBG = CHOOSE(CHOICE(?VerkoopList) % 2,-1,-1)
      SELF.Q.Pla3:Transport_NormalFG   = CHOOSE(CHOICE(?VerkoopList) % 2,-1,-1) ! Set color values for Pla3:Transport
      SELF.Q.Pla3:Transport_NormalBG   = CHOOSE(CHOICE(?VerkoopList) % 2,-1,8454143)
      SELF.Q.Pla3:Transport_SelectedFG = CHOOSE(CHOICE(?VerkoopList) % 2,-1,-1)
      SELF.Q.Pla3:Transport_SelectedBG = CHOOSE(CHOICE(?VerkoopList) % 2,-1,-1)
      SELF.Q.Pla3:PlanningID_NormalFG   = CHOOSE(CHOICE(?VerkoopList) % 2,-1,-1) ! Set color values for Pla3:PlanningID
      SELF.Q.Pla3:PlanningID_NormalBG   = CHOOSE(CHOICE(?VerkoopList) % 2,-1,8454143)
      SELF.Q.Pla3:PlanningID_SelectedFG = CHOOSE(CHOICE(?VerkoopList) % 2,-1,-1)
      SELF.Q.Pla3:PlanningID_SelectedBG = CHOOSE(CHOICE(?VerkoopList) % 2,-1,-1)
  !----------------------------------------------------------------------
  If SELF.Q.LOC:VerkoopKG1<0
  	Self.Q.LOC:VerkoopKG1_NormalFG   = Color:Red
  	Self.Q.LOC:VerkoopKG1_NormalBG   = Color:Red
  	Self.Q.LOC:VerkoopKG1_SelectedFG = Color:Red
  	Self.Q.LOC:VerkoopKG1_SelectedBG = Color:Red
  	Self.Q.LOC:VerkoopPallets1_NormalFG   = Color:Red
  	Self.Q.LOC:VerkoopPallets1_SelectedFG = Color:Red
  END


BRW8.Fetch PROCEDURE(BYTE Direction)

GreenBarIndex   LONG,AUTO
  CODE
  PARENT.Fetch(Direction)
  !----------------------------------------------------------------------
    LOOP GreenBarIndex=1 TO RECORDS(SELF.Q)
      GET(SELF.Q,GreenBarIndex)
      SELF.Q.Pla4:ArtikelID_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for Pla4:ArtikelID
      SELF.Q.Pla4:ArtikelID_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.Pla4:ArtikelID_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla4:ArtikelID_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla4:ArtikelOms_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for Pla4:ArtikelOms
      SELF.Q.Pla4:ArtikelOms_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.Pla4:ArtikelOms_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla4:ArtikelOms_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla4:FirmaNaam_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for Pla4:FirmaNaam
      SELF.Q.Pla4:FirmaNaam_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.Pla4:FirmaNaam_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla4:FirmaNaam_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla4:PartijID_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for Pla4:PartijID
      SELF.Q.Pla4:PartijID_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.Pla4:PartijID_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla4:PartijID_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla4:ExternPartijnr_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for Pla4:ExternPartijnr
      SELF.Q.Pla4:ExternPartijnr_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.Pla4:ExternPartijnr_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla4:ExternPartijnr_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.LOC:OverboekingKG1_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for LOC:OverboekingKG1
      SELF.Q.LOC:OverboekingKG1_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.LOC:OverboekingKG1_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.LOC:OverboekingKG1_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.APla4:OverboekSoort_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for APla4:OverboekSoort
      SELF.Q.APla4:OverboekSoort_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.APla4:OverboekSoort_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.APla4:OverboekSoort_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla4:Instructie_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for Pla4:Instructie
      SELF.Q.Pla4:Instructie_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.Pla4:Instructie_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla4:Instructie_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla4:VerpakkingOmschrijving_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for Pla4:VerpakkingOmschrijving
      SELF.Q.Pla4:VerpakkingOmschrijving_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.Pla4:VerpakkingOmschrijving_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla4:VerpakkingOmschrijving_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla4:Planning_TIME_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for Pla4:Planning_TIME
      SELF.Q.Pla4:Planning_TIME_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.Pla4:Planning_TIME_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla4:Planning_TIME_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.LOC:OverboekingPallets1_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for LOC:OverboekingPallets1
      SELF.Q.LOC:OverboekingPallets1_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.LOC:OverboekingPallets1_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.LOC:OverboekingPallets1_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla4:MutatieGemaakt_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for Pla4:MutatieGemaakt
      SELF.Q.Pla4:MutatieGemaakt_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.Pla4:MutatieGemaakt_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla4:MutatieGemaakt_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.LOC:Getransferd_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for LOC:Getransferd
      SELF.Q.LOC:Getransferd_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.LOC:Getransferd_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.LOC:Getransferd_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla4:Verwerkt_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for Pla4:Verwerkt
      SELF.Q.Pla4:Verwerkt_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.Pla4:Verwerkt_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla4:Verwerkt_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla4:CelOms_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for Pla4:CelOms
      SELF.Q.Pla4:CelOms_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.Pla4:CelOms_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla4:CelOms_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla4:Locatienaam_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for Pla4:Locatienaam
      SELF.Q.Pla4:Locatienaam_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.Pla4:Locatienaam_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla4:Locatienaam_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla4:NaarCelOms_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for Pla4:NaarCelOms
      SELF.Q.Pla4:NaarCelOms_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.Pla4:NaarCelOms_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla4:NaarCelOms_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.APla4:NaarLocatienaam_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for APla4:NaarLocatienaam
      SELF.Q.APla4:NaarLocatienaam_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.APla4:NaarLocatienaam_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.APla4:NaarLocatienaam_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla4:Transport_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for Pla4:Transport
      SELF.Q.Pla4:Transport_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.Pla4:Transport_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla4:Transport_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      PUT(SELF.Q)
    END
  !----------------------------------------------------------------------


BRW8.ResetQueue PROCEDURE(BYTE ResetMode)

  CODE
  db.DebugOut('START DUUR PlanningOverboeking.ResetQueue')
  pre_timing# = CLOCK()
  PARENT.ResetQueue(ResetMode)
  post_timing# = CLOCK()
  db.DebugOut('METING DUUR PlanningOverboeking.ResetQueue : ' & (post_timing# - pre_timing#))


BRW8.SetQueueRecord PROCEDURE

  CODE
  LOC:Getransferd = ThisWindow.GetGetransferd(Pla4:PlanningID)
  
  IF Pla4:MutatieGemaakt THEN
  	LOC:OverboekingKG1 = Pla4:MutatieKG
  	LOC:OverboekingPallets1 = Pla4:MutatiePallets
  ELSE
  	LOC:OverboekingKG1 = Pla4:KG
  	LOC:OverboekingPallets1 = Pla4:Pallets
  END
  PARENT.SetQueueRecord
  
  IF (Pla4:MutatieGemaakt)
    SELF.Q.Pla4:MutatieGemaakt_Icon = 2                    ! Set icon from icon list
  ELSE
    SELF.Q.Pla4:MutatieGemaakt_Icon = 1                    ! Set icon from icon list
  END
  IF (LOC:Getransferd)
    SELF.Q.LOC:Getransferd_Icon = 2                        ! Set icon from icon list
  ELSE
    SELF.Q.LOC:Getransferd_Icon = 1                        ! Set icon from icon list
  END
  IF (Pla4:Verwerkt)
    SELF.Q.Pla4:Verwerkt_Icon = 2                          ! Set icon from icon list
  ELSE
    SELF.Q.Pla4:Verwerkt_Icon = 1                          ! Set icon from icon list
  END
  !----------------------------------------------------------------------
      SELF.Q.Pla4:ArtikelID_NormalFG   = CHOOSE(CHOICE(?OverboekList) % 2,-1,-1) ! Set color values for Pla4:ArtikelID
      SELF.Q.Pla4:ArtikelID_NormalBG   = CHOOSE(CHOICE(?OverboekList) % 2,-1,8454143)
      SELF.Q.Pla4:ArtikelID_SelectedFG = CHOOSE(CHOICE(?OverboekList) % 2,-1,-1)
      SELF.Q.Pla4:ArtikelID_SelectedBG = CHOOSE(CHOICE(?OverboekList) % 2,-1,-1)
      SELF.Q.Pla4:ArtikelOms_NormalFG   = CHOOSE(CHOICE(?OverboekList) % 2,-1,-1) ! Set color values for Pla4:ArtikelOms
      SELF.Q.Pla4:ArtikelOms_NormalBG   = CHOOSE(CHOICE(?OverboekList) % 2,-1,8454143)
      SELF.Q.Pla4:ArtikelOms_SelectedFG = CHOOSE(CHOICE(?OverboekList) % 2,-1,-1)
      SELF.Q.Pla4:ArtikelOms_SelectedBG = CHOOSE(CHOICE(?OverboekList) % 2,-1,-1)
      SELF.Q.Pla4:FirmaNaam_NormalFG   = CHOOSE(CHOICE(?OverboekList) % 2,-1,-1) ! Set color values for Pla4:FirmaNaam
      SELF.Q.Pla4:FirmaNaam_NormalBG   = CHOOSE(CHOICE(?OverboekList) % 2,-1,8454143)
      SELF.Q.Pla4:FirmaNaam_SelectedFG = CHOOSE(CHOICE(?OverboekList) % 2,-1,-1)
      SELF.Q.Pla4:FirmaNaam_SelectedBG = CHOOSE(CHOICE(?OverboekList) % 2,-1,-1)
      SELF.Q.Pla4:PartijID_NormalFG   = CHOOSE(CHOICE(?OverboekList) % 2,-1,-1) ! Set color values for Pla4:PartijID
      SELF.Q.Pla4:PartijID_NormalBG   = CHOOSE(CHOICE(?OverboekList) % 2,-1,8454143)
      SELF.Q.Pla4:PartijID_SelectedFG = CHOOSE(CHOICE(?OverboekList) % 2,-1,-1)
      SELF.Q.Pla4:PartijID_SelectedBG = CHOOSE(CHOICE(?OverboekList) % 2,-1,-1)
      SELF.Q.Pla4:ExternPartijnr_NormalFG   = CHOOSE(CHOICE(?OverboekList) % 2,-1,-1) ! Set color values for Pla4:ExternPartijnr
      SELF.Q.Pla4:ExternPartijnr_NormalBG   = CHOOSE(CHOICE(?OverboekList) % 2,-1,8454143)
      SELF.Q.Pla4:ExternPartijnr_SelectedFG = CHOOSE(CHOICE(?OverboekList) % 2,-1,-1)
      SELF.Q.Pla4:ExternPartijnr_SelectedBG = CHOOSE(CHOICE(?OverboekList) % 2,-1,-1)
      SELF.Q.LOC:OverboekingKG1_NormalFG   = CHOOSE(CHOICE(?OverboekList) % 2,-1,-1) ! Set color values for LOC:OverboekingKG1
      SELF.Q.LOC:OverboekingKG1_NormalBG   = CHOOSE(CHOICE(?OverboekList) % 2,-1,8454143)
      SELF.Q.LOC:OverboekingKG1_SelectedFG = CHOOSE(CHOICE(?OverboekList) % 2,-1,-1)
      SELF.Q.LOC:OverboekingKG1_SelectedBG = CHOOSE(CHOICE(?OverboekList) % 2,-1,-1)
      SELF.Q.APla4:OverboekSoort_NormalFG   = CHOOSE(CHOICE(?OverboekList) % 2,-1,-1) ! Set color values for APla4:OverboekSoort
      SELF.Q.APla4:OverboekSoort_NormalBG   = CHOOSE(CHOICE(?OverboekList) % 2,-1,8454143)
      SELF.Q.APla4:OverboekSoort_SelectedFG = CHOOSE(CHOICE(?OverboekList) % 2,-1,-1)
      SELF.Q.APla4:OverboekSoort_SelectedBG = CHOOSE(CHOICE(?OverboekList) % 2,-1,-1)
      SELF.Q.Pla4:Instructie_NormalFG   = CHOOSE(CHOICE(?OverboekList) % 2,-1,-1) ! Set color values for Pla4:Instructie
      SELF.Q.Pla4:Instructie_NormalBG   = CHOOSE(CHOICE(?OverboekList) % 2,-1,8454143)
      SELF.Q.Pla4:Instructie_SelectedFG = CHOOSE(CHOICE(?OverboekList) % 2,-1,-1)
      SELF.Q.Pla4:Instructie_SelectedBG = CHOOSE(CHOICE(?OverboekList) % 2,-1,-1)
      SELF.Q.Pla4:VerpakkingOmschrijving_NormalFG   = CHOOSE(CHOICE(?OverboekList) % 2,-1,-1) ! Set color values for Pla4:VerpakkingOmschrijving
      SELF.Q.Pla4:VerpakkingOmschrijving_NormalBG   = CHOOSE(CHOICE(?OverboekList) % 2,-1,8454143)
      SELF.Q.Pla4:VerpakkingOmschrijving_SelectedFG = CHOOSE(CHOICE(?OverboekList) % 2,-1,-1)
      SELF.Q.Pla4:VerpakkingOmschrijving_SelectedBG = CHOOSE(CHOICE(?OverboekList) % 2,-1,-1)
      SELF.Q.Pla4:Planning_TIME_NormalFG   = CHOOSE(CHOICE(?OverboekList) % 2,-1,-1) ! Set color values for Pla4:Planning_TIME
      SELF.Q.Pla4:Planning_TIME_NormalBG   = CHOOSE(CHOICE(?OverboekList) % 2,-1,8454143)
      SELF.Q.Pla4:Planning_TIME_SelectedFG = CHOOSE(CHOICE(?OverboekList) % 2,-1,-1)
      SELF.Q.Pla4:Planning_TIME_SelectedBG = CHOOSE(CHOICE(?OverboekList) % 2,-1,-1)
      SELF.Q.LOC:OverboekingPallets1_NormalFG   = CHOOSE(CHOICE(?OverboekList) % 2,-1,-1) ! Set color values for LOC:OverboekingPallets1
      SELF.Q.LOC:OverboekingPallets1_NormalBG   = CHOOSE(CHOICE(?OverboekList) % 2,-1,8454143)
      SELF.Q.LOC:OverboekingPallets1_SelectedFG = CHOOSE(CHOICE(?OverboekList) % 2,-1,-1)
      SELF.Q.LOC:OverboekingPallets1_SelectedBG = CHOOSE(CHOICE(?OverboekList) % 2,-1,-1)
      SELF.Q.Pla4:MutatieGemaakt_NormalFG   = CHOOSE(CHOICE(?OverboekList) % 2,-1,-1) ! Set color values for Pla4:MutatieGemaakt
      SELF.Q.Pla4:MutatieGemaakt_NormalBG   = CHOOSE(CHOICE(?OverboekList) % 2,-1,8454143)
      SELF.Q.Pla4:MutatieGemaakt_SelectedFG = CHOOSE(CHOICE(?OverboekList) % 2,-1,-1)
      SELF.Q.Pla4:MutatieGemaakt_SelectedBG = CHOOSE(CHOICE(?OverboekList) % 2,-1,-1)
      SELF.Q.LOC:Getransferd_NormalFG   = CHOOSE(CHOICE(?OverboekList) % 2,-1,-1) ! Set color values for LOC:Getransferd
      SELF.Q.LOC:Getransferd_NormalBG   = CHOOSE(CHOICE(?OverboekList) % 2,-1,8454143)
      SELF.Q.LOC:Getransferd_SelectedFG = CHOOSE(CHOICE(?OverboekList) % 2,-1,-1)
      SELF.Q.LOC:Getransferd_SelectedBG = CHOOSE(CHOICE(?OverboekList) % 2,-1,-1)
      SELF.Q.Pla4:Verwerkt_NormalFG   = CHOOSE(CHOICE(?OverboekList) % 2,-1,-1) ! Set color values for Pla4:Verwerkt
      SELF.Q.Pla4:Verwerkt_NormalBG   = CHOOSE(CHOICE(?OverboekList) % 2,-1,8454143)
      SELF.Q.Pla4:Verwerkt_SelectedFG = CHOOSE(CHOICE(?OverboekList) % 2,-1,-1)
      SELF.Q.Pla4:Verwerkt_SelectedBG = CHOOSE(CHOICE(?OverboekList) % 2,-1,-1)
      SELF.Q.Pla4:CelOms_NormalFG   = CHOOSE(CHOICE(?OverboekList) % 2,-1,-1) ! Set color values for Pla4:CelOms
      SELF.Q.Pla4:CelOms_NormalBG   = CHOOSE(CHOICE(?OverboekList) % 2,-1,8454143)
      SELF.Q.Pla4:CelOms_SelectedFG = CHOOSE(CHOICE(?OverboekList) % 2,-1,-1)
      SELF.Q.Pla4:CelOms_SelectedBG = CHOOSE(CHOICE(?OverboekList) % 2,-1,-1)
      SELF.Q.Pla4:Locatienaam_NormalFG   = CHOOSE(CHOICE(?OverboekList) % 2,-1,-1) ! Set color values for Pla4:Locatienaam
      SELF.Q.Pla4:Locatienaam_NormalBG   = CHOOSE(CHOICE(?OverboekList) % 2,-1,8454143)
      SELF.Q.Pla4:Locatienaam_SelectedFG = CHOOSE(CHOICE(?OverboekList) % 2,-1,-1)
      SELF.Q.Pla4:Locatienaam_SelectedBG = CHOOSE(CHOICE(?OverboekList) % 2,-1,-1)
      SELF.Q.Pla4:NaarCelOms_NormalFG   = CHOOSE(CHOICE(?OverboekList) % 2,-1,-1) ! Set color values for Pla4:NaarCelOms
      SELF.Q.Pla4:NaarCelOms_NormalBG   = CHOOSE(CHOICE(?OverboekList) % 2,-1,8454143)
      SELF.Q.Pla4:NaarCelOms_SelectedFG = CHOOSE(CHOICE(?OverboekList) % 2,-1,-1)
      SELF.Q.Pla4:NaarCelOms_SelectedBG = CHOOSE(CHOICE(?OverboekList) % 2,-1,-1)
      SELF.Q.APla4:NaarLocatienaam_NormalFG   = CHOOSE(CHOICE(?OverboekList) % 2,-1,-1) ! Set color values for APla4:NaarLocatienaam
      SELF.Q.APla4:NaarLocatienaam_NormalBG   = CHOOSE(CHOICE(?OverboekList) % 2,-1,8454143)
      SELF.Q.APla4:NaarLocatienaam_SelectedFG = CHOOSE(CHOICE(?OverboekList) % 2,-1,-1)
      SELF.Q.APla4:NaarLocatienaam_SelectedBG = CHOOSE(CHOICE(?OverboekList) % 2,-1,-1)
      SELF.Q.Pla4:Transport_NormalFG   = CHOOSE(CHOICE(?OverboekList) % 2,-1,-1) ! Set color values for Pla4:Transport
      SELF.Q.Pla4:Transport_NormalBG   = CHOOSE(CHOICE(?OverboekList) % 2,-1,8454143)
      SELF.Q.Pla4:Transport_SelectedFG = CHOOSE(CHOICE(?OverboekList) % 2,-1,-1)
      SELF.Q.Pla4:Transport_SelectedBG = CHOOSE(CHOICE(?OverboekList) % 2,-1,-1)
  !----------------------------------------------------------------------


BRW3.Fetch PROCEDURE(BYTE Direction)

GreenBarIndex   LONG,AUTO
  CODE
  PARENT.Fetch(Direction)
  !----------------------------------------------------------------------
    LOOP GreenBarIndex=1 TO RECORDS(SELF.Q)
      GET(SELF.Q,GreenBarIndex)
      SELF.Q.APla2:ArtikelID_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for APla2:ArtikelID
      SELF.Q.APla2:ArtikelID_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.APla2:ArtikelID_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.APla2:ArtikelID_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.APla2:ArtikelOms_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for APla2:ArtikelOms
      SELF.Q.APla2:ArtikelOms_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.APla2:ArtikelOms_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.APla2:ArtikelOms_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.APla2:FirmaNaam_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for APla2:FirmaNaam
      SELF.Q.APla2:FirmaNaam_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.APla2:FirmaNaam_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.APla2:FirmaNaam_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.LOC:InkoopKG2_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for LOC:InkoopKG2
      SELF.Q.LOC:InkoopKG2_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.LOC:InkoopKG2_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.LOC:InkoopKG2_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.APla2:Instructie_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for APla2:Instructie
      SELF.Q.APla2:Instructie_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.APla2:Instructie_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.APla2:Instructie_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.APla2:VerpakkingOmschrijving_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for APla2:VerpakkingOmschrijving
      SELF.Q.APla2:VerpakkingOmschrijving_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.APla2:VerpakkingOmschrijving_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.APla2:VerpakkingOmschrijving_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.APla2:Planning_TIME_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for APla2:Planning_TIME
      SELF.Q.APla2:Planning_TIME_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.APla2:Planning_TIME_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.APla2:Planning_TIME_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.LOC:InkoopPallets2_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for LOC:InkoopPallets2
      SELF.Q.LOC:InkoopPallets2_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.LOC:InkoopPallets2_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.LOC:InkoopPallets2_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.APla2:MutatieGemaakt_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for APla2:MutatieGemaakt
      SELF.Q.APla2:MutatieGemaakt_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.APla2:MutatieGemaakt_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.APla2:MutatieGemaakt_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.APla2:Geprint_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for APla2:Geprint
      SELF.Q.APla2:Geprint_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.APla2:Geprint_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.APla2:Geprint_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.LOC:Getransferd_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for LOC:Getransferd
      SELF.Q.LOC:Getransferd_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.LOC:Getransferd_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.LOC:Getransferd_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.APla2:Verwerkt_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for APla2:Verwerkt
      SELF.Q.APla2:Verwerkt_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.APla2:Verwerkt_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.APla2:Verwerkt_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.APla2:Gewogen_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for APla2:Gewogen
      SELF.Q.APla2:Gewogen_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.APla2:Gewogen_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.APla2:Gewogen_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.APla2:CelOms_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for APla2:CelOms
      SELF.Q.APla2:CelOms_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.APla2:CelOms_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.APla2:CelOms_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.APla2:Locatienaam_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for APla2:Locatienaam
      SELF.Q.APla2:Locatienaam_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.APla2:Locatienaam_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.APla2:Locatienaam_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.APla2:Transport_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for APla2:Transport
      SELF.Q.APla2:Transport_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.APla2:Transport_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.APla2:Transport_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.APla2:PlanningID_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for APla2:PlanningID
      SELF.Q.APla2:PlanningID_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.APla2:PlanningID_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.APla2:PlanningID_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      PUT(SELF.Q)
    END
  !----------------------------------------------------------------------


BRW3.ResetQueue PROCEDURE(BYTE ResetMode)

  CODE
  	db.DebugOut('START DUUR APlanningInkoop.ResetQueue')
  	pre_timing# = CLOCK()
  PARENT.ResetQueue(ResetMode)
  	post_timing# = CLOCK()
  	db.DebugOut('METING DUUR APlanningInkoop.ResetQueue : ' & (post_timing# - pre_timing#))


BRW3.SetQueueRecord PROCEDURE

  CODE
  LOC:Getransferd = ThisWindow.GetGetransferd(APla2:PlanningID)
  
  IF APla2:MutatieGemaakt THEN
  	LOC:InkoopKG2 = APla2:MutatieKG
  	LOC:InkoopPallets2 = APla2:MutatiePallets
  ELSE
  	LOC:InkoopKG2 = APla2:KG
  	LOC:InkoopPallets2 = APla2:Pallets
  END
  PARENT.SetQueueRecord
  
  IF (APla2:MutatieGemaakt)
    SELF.Q.APla2:MutatieGemaakt_Icon = 2                   ! Set icon from icon list
  ELSE
    SELF.Q.APla2:MutatieGemaakt_Icon = 1                   ! Set icon from icon list
  END
  IF (APla2:Geprint)
    SELF.Q.APla2:Geprint_Icon = 2                          ! Set icon from icon list
  ELSE
    SELF.Q.APla2:Geprint_Icon = 1                          ! Set icon from icon list
  END
  IF (LOC:Getransferd)
    SELF.Q.LOC:Getransferd_Icon = 2                        ! Set icon from icon list
  ELSE
    SELF.Q.LOC:Getransferd_Icon = 1                        ! Set icon from icon list
  END
  IF (APla2:Verwerkt)
    SELF.Q.APla2:Verwerkt_Icon = 2                         ! Set icon from icon list
  ELSE
    SELF.Q.APla2:Verwerkt_Icon = 1                         ! Set icon from icon list
  END
  IF (APla2:Gewogen)
    SELF.Q.APla2:Gewogen_Icon = 2                          ! Set icon from icon list
  ELSE
    SELF.Q.APla2:Gewogen_Icon = 1                          ! Set icon from icon list
  END
  !----------------------------------------------------------------------
      SELF.Q.APla2:ArtikelID_NormalFG   = CHOOSE(CHOICE(?InkoopList2) % 2,-1,-1) ! Set color values for APla2:ArtikelID
      SELF.Q.APla2:ArtikelID_NormalBG   = CHOOSE(CHOICE(?InkoopList2) % 2,-1,8454143)
      SELF.Q.APla2:ArtikelID_SelectedFG = CHOOSE(CHOICE(?InkoopList2) % 2,-1,-1)
      SELF.Q.APla2:ArtikelID_SelectedBG = CHOOSE(CHOICE(?InkoopList2) % 2,-1,-1)
      SELF.Q.APla2:ArtikelOms_NormalFG   = CHOOSE(CHOICE(?InkoopList2) % 2,-1,-1) ! Set color values for APla2:ArtikelOms
      SELF.Q.APla2:ArtikelOms_NormalBG   = CHOOSE(CHOICE(?InkoopList2) % 2,-1,8454143)
      SELF.Q.APla2:ArtikelOms_SelectedFG = CHOOSE(CHOICE(?InkoopList2) % 2,-1,-1)
      SELF.Q.APla2:ArtikelOms_SelectedBG = CHOOSE(CHOICE(?InkoopList2) % 2,-1,-1)
      SELF.Q.APla2:FirmaNaam_NormalFG   = CHOOSE(CHOICE(?InkoopList2) % 2,-1,-1) ! Set color values for APla2:FirmaNaam
      SELF.Q.APla2:FirmaNaam_NormalBG   = CHOOSE(CHOICE(?InkoopList2) % 2,-1,8454143)
      SELF.Q.APla2:FirmaNaam_SelectedFG = CHOOSE(CHOICE(?InkoopList2) % 2,-1,-1)
      SELF.Q.APla2:FirmaNaam_SelectedBG = CHOOSE(CHOICE(?InkoopList2) % 2,-1,-1)
      SELF.Q.LOC:InkoopKG2_NormalFG   = CHOOSE(CHOICE(?InkoopList2) % 2,-1,-1) ! Set color values for LOC:InkoopKG2
      SELF.Q.LOC:InkoopKG2_NormalBG   = CHOOSE(CHOICE(?InkoopList2) % 2,-1,8454143)
      SELF.Q.LOC:InkoopKG2_SelectedFG = CHOOSE(CHOICE(?InkoopList2) % 2,-1,-1)
      SELF.Q.LOC:InkoopKG2_SelectedBG = CHOOSE(CHOICE(?InkoopList2) % 2,-1,-1)
      SELF.Q.APla2:Instructie_NormalFG   = CHOOSE(CHOICE(?InkoopList2) % 2,-1,-1) ! Set color values for APla2:Instructie
      SELF.Q.APla2:Instructie_NormalBG   = CHOOSE(CHOICE(?InkoopList2) % 2,-1,8454143)
      SELF.Q.APla2:Instructie_SelectedFG = CHOOSE(CHOICE(?InkoopList2) % 2,-1,-1)
      SELF.Q.APla2:Instructie_SelectedBG = CHOOSE(CHOICE(?InkoopList2) % 2,-1,-1)
      SELF.Q.APla2:VerpakkingOmschrijving_NormalFG   = CHOOSE(CHOICE(?InkoopList2) % 2,-1,-1) ! Set color values for APla2:VerpakkingOmschrijving
      SELF.Q.APla2:VerpakkingOmschrijving_NormalBG   = CHOOSE(CHOICE(?InkoopList2) % 2,-1,8454143)
      SELF.Q.APla2:VerpakkingOmschrijving_SelectedFG = CHOOSE(CHOICE(?InkoopList2) % 2,-1,-1)
      SELF.Q.APla2:VerpakkingOmschrijving_SelectedBG = CHOOSE(CHOICE(?InkoopList2) % 2,-1,-1)
      SELF.Q.APla2:Planning_TIME_NormalFG   = CHOOSE(CHOICE(?InkoopList2) % 2,-1,-1) ! Set color values for APla2:Planning_TIME
      SELF.Q.APla2:Planning_TIME_NormalBG   = CHOOSE(CHOICE(?InkoopList2) % 2,-1,8454143)
      SELF.Q.APla2:Planning_TIME_SelectedFG = CHOOSE(CHOICE(?InkoopList2) % 2,-1,-1)
      SELF.Q.APla2:Planning_TIME_SelectedBG = CHOOSE(CHOICE(?InkoopList2) % 2,-1,-1)
      SELF.Q.LOC:InkoopPallets2_NormalFG   = CHOOSE(CHOICE(?InkoopList2) % 2,-1,-1) ! Set color values for LOC:InkoopPallets2
      SELF.Q.LOC:InkoopPallets2_NormalBG   = CHOOSE(CHOICE(?InkoopList2) % 2,-1,8454143)
      SELF.Q.LOC:InkoopPallets2_SelectedFG = CHOOSE(CHOICE(?InkoopList2) % 2,-1,-1)
      SELF.Q.LOC:InkoopPallets2_SelectedBG = CHOOSE(CHOICE(?InkoopList2) % 2,-1,-1)
      SELF.Q.APla2:MutatieGemaakt_NormalFG   = CHOOSE(CHOICE(?InkoopList2) % 2,-1,-1) ! Set color values for APla2:MutatieGemaakt
      SELF.Q.APla2:MutatieGemaakt_NormalBG   = CHOOSE(CHOICE(?InkoopList2) % 2,-1,8454143)
      SELF.Q.APla2:MutatieGemaakt_SelectedFG = CHOOSE(CHOICE(?InkoopList2) % 2,-1,-1)
      SELF.Q.APla2:MutatieGemaakt_SelectedBG = CHOOSE(CHOICE(?InkoopList2) % 2,-1,-1)
      SELF.Q.APla2:Geprint_NormalFG   = CHOOSE(CHOICE(?InkoopList2) % 2,-1,-1) ! Set color values for APla2:Geprint
      SELF.Q.APla2:Geprint_NormalBG   = CHOOSE(CHOICE(?InkoopList2) % 2,-1,8454143)
      SELF.Q.APla2:Geprint_SelectedFG = CHOOSE(CHOICE(?InkoopList2) % 2,-1,-1)
      SELF.Q.APla2:Geprint_SelectedBG = CHOOSE(CHOICE(?InkoopList2) % 2,-1,-1)
      SELF.Q.LOC:Getransferd_NormalFG   = CHOOSE(CHOICE(?InkoopList2) % 2,-1,-1) ! Set color values for LOC:Getransferd
      SELF.Q.LOC:Getransferd_NormalBG   = CHOOSE(CHOICE(?InkoopList2) % 2,-1,8454143)
      SELF.Q.LOC:Getransferd_SelectedFG = CHOOSE(CHOICE(?InkoopList2) % 2,-1,-1)
      SELF.Q.LOC:Getransferd_SelectedBG = CHOOSE(CHOICE(?InkoopList2) % 2,-1,-1)
      SELF.Q.APla2:Verwerkt_NormalFG   = CHOOSE(CHOICE(?InkoopList2) % 2,-1,-1) ! Set color values for APla2:Verwerkt
      SELF.Q.APla2:Verwerkt_NormalBG   = CHOOSE(CHOICE(?InkoopList2) % 2,-1,8454143)
      SELF.Q.APla2:Verwerkt_SelectedFG = CHOOSE(CHOICE(?InkoopList2) % 2,-1,-1)
      SELF.Q.APla2:Verwerkt_SelectedBG = CHOOSE(CHOICE(?InkoopList2) % 2,-1,-1)
      SELF.Q.APla2:Gewogen_NormalFG   = CHOOSE(CHOICE(?InkoopList2) % 2,-1,-1) ! Set color values for APla2:Gewogen
      SELF.Q.APla2:Gewogen_NormalBG   = CHOOSE(CHOICE(?InkoopList2) % 2,-1,8454143)
      SELF.Q.APla2:Gewogen_SelectedFG = CHOOSE(CHOICE(?InkoopList2) % 2,-1,-1)
      SELF.Q.APla2:Gewogen_SelectedBG = CHOOSE(CHOICE(?InkoopList2) % 2,-1,-1)
      SELF.Q.APla2:CelOms_NormalFG   = CHOOSE(CHOICE(?InkoopList2) % 2,-1,-1) ! Set color values for APla2:CelOms
      SELF.Q.APla2:CelOms_NormalBG   = CHOOSE(CHOICE(?InkoopList2) % 2,-1,8454143)
      SELF.Q.APla2:CelOms_SelectedFG = CHOOSE(CHOICE(?InkoopList2) % 2,-1,-1)
      SELF.Q.APla2:CelOms_SelectedBG = CHOOSE(CHOICE(?InkoopList2) % 2,-1,-1)
      SELF.Q.APla2:Locatienaam_NormalFG   = CHOOSE(CHOICE(?InkoopList2) % 2,-1,-1) ! Set color values for APla2:Locatienaam
      SELF.Q.APla2:Locatienaam_NormalBG   = CHOOSE(CHOICE(?InkoopList2) % 2,-1,8454143)
      SELF.Q.APla2:Locatienaam_SelectedFG = CHOOSE(CHOICE(?InkoopList2) % 2,-1,-1)
      SELF.Q.APla2:Locatienaam_SelectedBG = CHOOSE(CHOICE(?InkoopList2) % 2,-1,-1)
      SELF.Q.APla2:Transport_NormalFG   = CHOOSE(CHOICE(?InkoopList2) % 2,-1,-1) ! Set color values for APla2:Transport
      SELF.Q.APla2:Transport_NormalBG   = CHOOSE(CHOICE(?InkoopList2) % 2,-1,8454143)
      SELF.Q.APla2:Transport_SelectedFG = CHOOSE(CHOICE(?InkoopList2) % 2,-1,-1)
      SELF.Q.APla2:Transport_SelectedBG = CHOOSE(CHOICE(?InkoopList2) % 2,-1,-1)
      SELF.Q.APla2:PlanningID_NormalFG   = CHOOSE(CHOICE(?InkoopList2) % 2,-1,-1) ! Set color values for APla2:PlanningID
      SELF.Q.APla2:PlanningID_NormalBG   = CHOOSE(CHOICE(?InkoopList2) % 2,-1,8454143)
      SELF.Q.APla2:PlanningID_SelectedFG = CHOOSE(CHOICE(?InkoopList2) % 2,-1,-1)
      SELF.Q.APla2:PlanningID_SelectedBG = CHOOSE(CHOICE(?InkoopList2) % 2,-1,-1)
  !----------------------------------------------------------------------


BRW9.Fetch PROCEDURE(BYTE Direction)

GreenBarIndex   LONG,AUTO
  CODE
  PARENT.Fetch(Direction)
  !----------------------------------------------------------------------
    LOOP GreenBarIndex=1 TO RECORDS(SELF.Q)
      GET(SELF.Q,GreenBarIndex)
      SELF.Q.APla4:ArtikelID_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for APla4:ArtikelID
      SELF.Q.APla4:ArtikelID_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.APla4:ArtikelID_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.APla4:ArtikelID_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.APla4:ArtikelOms_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for APla4:ArtikelOms
      SELF.Q.APla4:ArtikelOms_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.APla4:ArtikelOms_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.APla4:ArtikelOms_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.APla4:FirmaNaam_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for APla4:FirmaNaam
      SELF.Q.APla4:FirmaNaam_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.APla4:FirmaNaam_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.APla4:FirmaNaam_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.APla4:PartijID_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for APla4:PartijID
      SELF.Q.APla4:PartijID_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.APla4:PartijID_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.APla4:PartijID_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.APla4:ExternPartijnr_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for APla4:ExternPartijnr
      SELF.Q.APla4:ExternPartijnr_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.APla4:ExternPartijnr_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.APla4:ExternPartijnr_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.LOC:OverboekingKG2_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for LOC:OverboekingKG2
      SELF.Q.LOC:OverboekingKG2_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.LOC:OverboekingKG2_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.LOC:OverboekingKG2_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.APla4:Instructie_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for APla4:Instructie
      SELF.Q.APla4:Instructie_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.APla4:Instructie_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.APla4:Instructie_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.APla4:VerpakkingOmschrijving_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for APla4:VerpakkingOmschrijving
      SELF.Q.APla4:VerpakkingOmschrijving_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.APla4:VerpakkingOmschrijving_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.APla4:VerpakkingOmschrijving_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.APla4:Planning_TIME_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for APla4:Planning_TIME
      SELF.Q.APla4:Planning_TIME_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.APla4:Planning_TIME_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.APla4:Planning_TIME_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.LOC:OverboekingPallets2_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for LOC:OverboekingPallets2
      SELF.Q.LOC:OverboekingPallets2_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.LOC:OverboekingPallets2_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.LOC:OverboekingPallets2_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.APla4:OverboekSoort_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for APla4:OverboekSoort
      SELF.Q.APla4:OverboekSoort_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.APla4:OverboekSoort_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.APla4:OverboekSoort_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.APla4:MutatieGemaakt_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for APla4:MutatieGemaakt
      SELF.Q.APla4:MutatieGemaakt_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.APla4:MutatieGemaakt_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.APla4:MutatieGemaakt_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.LOC:Getransferd_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for LOC:Getransferd
      SELF.Q.LOC:Getransferd_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.LOC:Getransferd_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.LOC:Getransferd_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.APla4:Verwerkt_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for APla4:Verwerkt
      SELF.Q.APla4:Verwerkt_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.APla4:Verwerkt_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.APla4:Verwerkt_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.APla4:CelOms_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for APla4:CelOms
      SELF.Q.APla4:CelOms_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.APla4:CelOms_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.APla4:CelOms_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.APla4:Locatienaam_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for APla4:Locatienaam
      SELF.Q.APla4:Locatienaam_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.APla4:Locatienaam_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.APla4:Locatienaam_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.APla4:NaarCelOms_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for APla4:NaarCelOms
      SELF.Q.APla4:NaarCelOms_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.APla4:NaarCelOms_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.APla4:NaarCelOms_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.APla4:NaarLocatienaam_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for APla4:NaarLocatienaam
      SELF.Q.APla4:NaarLocatienaam_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.APla4:NaarLocatienaam_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.APla4:NaarLocatienaam_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.APla4:Transport_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for APla4:Transport
      SELF.Q.APla4:Transport_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.APla4:Transport_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.APla4:Transport_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      PUT(SELF.Q)
    END
  !----------------------------------------------------------------------


BRW9.ResetQueue PROCEDURE(BYTE ResetMode)

  CODE
  db.DebugOut('START DUUR APlanningOverboeking.ResetQueue')
  pre_timing# = CLOCK()
  PARENT.ResetQueue(ResetMode)
  post_timing# = CLOCK()
  db.DebugOut('METING DUUR APlanningOverboeking.ResetQueue : ' & (post_timing# - pre_timing#))


BRW9.SetQueueRecord PROCEDURE

  CODE
  LOC:Getransferd = ThisWindow.GetGetransferd(APla4:PlanningID)
  
  IF APla4:MutatieGemaakt THEN
  	LOC:OverboekingPallets2 = APla4:MutatiePallets
  	LOC:OverboekingKG2 = APla4:MutatieKG
  ELSE
  	LOC:OverboekingPallets2 = APla4:Pallets
  	LOC:OverboekingKG2 = APla4:KG
  END
  PARENT.SetQueueRecord
  
  IF (APla4:MutatieGemaakt)
    SELF.Q.APla4:MutatieGemaakt_Icon = 2                   ! Set icon from icon list
  ELSE
    SELF.Q.APla4:MutatieGemaakt_Icon = 1                   ! Set icon from icon list
  END
  IF (LOC:Getransferd)
    SELF.Q.LOC:Getransferd_Icon = 2                        ! Set icon from icon list
  ELSE
    SELF.Q.LOC:Getransferd_Icon = 1                        ! Set icon from icon list
  END
  IF (APla4:Verwerkt)
    SELF.Q.APla4:Verwerkt_Icon = 2                         ! Set icon from icon list
  ELSE
    SELF.Q.APla4:Verwerkt_Icon = 1                         ! Set icon from icon list
  END
  !----------------------------------------------------------------------
      SELF.Q.APla4:ArtikelID_NormalFG   = CHOOSE(CHOICE(?OverboekList2) % 2,-1,-1) ! Set color values for APla4:ArtikelID
      SELF.Q.APla4:ArtikelID_NormalBG   = CHOOSE(CHOICE(?OverboekList2) % 2,-1,8454143)
      SELF.Q.APla4:ArtikelID_SelectedFG = CHOOSE(CHOICE(?OverboekList2) % 2,-1,-1)
      SELF.Q.APla4:ArtikelID_SelectedBG = CHOOSE(CHOICE(?OverboekList2) % 2,-1,-1)
      SELF.Q.APla4:ArtikelOms_NormalFG   = CHOOSE(CHOICE(?OverboekList2) % 2,-1,-1) ! Set color values for APla4:ArtikelOms
      SELF.Q.APla4:ArtikelOms_NormalBG   = CHOOSE(CHOICE(?OverboekList2) % 2,-1,8454143)
      SELF.Q.APla4:ArtikelOms_SelectedFG = CHOOSE(CHOICE(?OverboekList2) % 2,-1,-1)
      SELF.Q.APla4:ArtikelOms_SelectedBG = CHOOSE(CHOICE(?OverboekList2) % 2,-1,-1)
      SELF.Q.APla4:FirmaNaam_NormalFG   = CHOOSE(CHOICE(?OverboekList2) % 2,-1,-1) ! Set color values for APla4:FirmaNaam
      SELF.Q.APla4:FirmaNaam_NormalBG   = CHOOSE(CHOICE(?OverboekList2) % 2,-1,8454143)
      SELF.Q.APla4:FirmaNaam_SelectedFG = CHOOSE(CHOICE(?OverboekList2) % 2,-1,-1)
      SELF.Q.APla4:FirmaNaam_SelectedBG = CHOOSE(CHOICE(?OverboekList2) % 2,-1,-1)
      SELF.Q.APla4:PartijID_NormalFG   = CHOOSE(CHOICE(?OverboekList2) % 2,-1,-1) ! Set color values for APla4:PartijID
      SELF.Q.APla4:PartijID_NormalBG   = CHOOSE(CHOICE(?OverboekList2) % 2,-1,8454143)
      SELF.Q.APla4:PartijID_SelectedFG = CHOOSE(CHOICE(?OverboekList2) % 2,-1,-1)
      SELF.Q.APla4:PartijID_SelectedBG = CHOOSE(CHOICE(?OverboekList2) % 2,-1,-1)
      SELF.Q.APla4:ExternPartijnr_NormalFG   = CHOOSE(CHOICE(?OverboekList2) % 2,-1,-1) ! Set color values for APla4:ExternPartijnr
      SELF.Q.APla4:ExternPartijnr_NormalBG   = CHOOSE(CHOICE(?OverboekList2) % 2,-1,8454143)
      SELF.Q.APla4:ExternPartijnr_SelectedFG = CHOOSE(CHOICE(?OverboekList2) % 2,-1,-1)
      SELF.Q.APla4:ExternPartijnr_SelectedBG = CHOOSE(CHOICE(?OverboekList2) % 2,-1,-1)
      SELF.Q.LOC:OverboekingKG2_NormalFG   = CHOOSE(CHOICE(?OverboekList2) % 2,-1,-1) ! Set color values for LOC:OverboekingKG2
      SELF.Q.LOC:OverboekingKG2_NormalBG   = CHOOSE(CHOICE(?OverboekList2) % 2,-1,8454143)
      SELF.Q.LOC:OverboekingKG2_SelectedFG = CHOOSE(CHOICE(?OverboekList2) % 2,-1,-1)
      SELF.Q.LOC:OverboekingKG2_SelectedBG = CHOOSE(CHOICE(?OverboekList2) % 2,-1,-1)
      SELF.Q.APla4:Instructie_NormalFG   = CHOOSE(CHOICE(?OverboekList2) % 2,-1,-1) ! Set color values for APla4:Instructie
      SELF.Q.APla4:Instructie_NormalBG   = CHOOSE(CHOICE(?OverboekList2) % 2,-1,8454143)
      SELF.Q.APla4:Instructie_SelectedFG = CHOOSE(CHOICE(?OverboekList2) % 2,-1,-1)
      SELF.Q.APla4:Instructie_SelectedBG = CHOOSE(CHOICE(?OverboekList2) % 2,-1,-1)
      SELF.Q.APla4:VerpakkingOmschrijving_NormalFG   = CHOOSE(CHOICE(?OverboekList2) % 2,-1,-1) ! Set color values for APla4:VerpakkingOmschrijving
      SELF.Q.APla4:VerpakkingOmschrijving_NormalBG   = CHOOSE(CHOICE(?OverboekList2) % 2,-1,8454143)
      SELF.Q.APla4:VerpakkingOmschrijving_SelectedFG = CHOOSE(CHOICE(?OverboekList2) % 2,-1,-1)
      SELF.Q.APla4:VerpakkingOmschrijving_SelectedBG = CHOOSE(CHOICE(?OverboekList2) % 2,-1,-1)
      SELF.Q.APla4:Planning_TIME_NormalFG   = CHOOSE(CHOICE(?OverboekList2) % 2,-1,-1) ! Set color values for APla4:Planning_TIME
      SELF.Q.APla4:Planning_TIME_NormalBG   = CHOOSE(CHOICE(?OverboekList2) % 2,-1,8454143)
      SELF.Q.APla4:Planning_TIME_SelectedFG = CHOOSE(CHOICE(?OverboekList2) % 2,-1,-1)
      SELF.Q.APla4:Planning_TIME_SelectedBG = CHOOSE(CHOICE(?OverboekList2) % 2,-1,-1)
      SELF.Q.LOC:OverboekingPallets2_NormalFG   = CHOOSE(CHOICE(?OverboekList2) % 2,-1,-1) ! Set color values for LOC:OverboekingPallets2
      SELF.Q.LOC:OverboekingPallets2_NormalBG   = CHOOSE(CHOICE(?OverboekList2) % 2,-1,8454143)
      SELF.Q.LOC:OverboekingPallets2_SelectedFG = CHOOSE(CHOICE(?OverboekList2) % 2,-1,-1)
      SELF.Q.LOC:OverboekingPallets2_SelectedBG = CHOOSE(CHOICE(?OverboekList2) % 2,-1,-1)
      SELF.Q.APla4:OverboekSoort_NormalFG   = CHOOSE(CHOICE(?OverboekList2) % 2,-1,-1) ! Set color values for APla4:OverboekSoort
      SELF.Q.APla4:OverboekSoort_NormalBG   = CHOOSE(CHOICE(?OverboekList2) % 2,-1,8454143)
      SELF.Q.APla4:OverboekSoort_SelectedFG = CHOOSE(CHOICE(?OverboekList2) % 2,-1,-1)
      SELF.Q.APla4:OverboekSoort_SelectedBG = CHOOSE(CHOICE(?OverboekList2) % 2,-1,-1)
      SELF.Q.APla4:MutatieGemaakt_NormalFG   = CHOOSE(CHOICE(?OverboekList2) % 2,-1,-1) ! Set color values for APla4:MutatieGemaakt
      SELF.Q.APla4:MutatieGemaakt_NormalBG   = CHOOSE(CHOICE(?OverboekList2) % 2,-1,8454143)
      SELF.Q.APla4:MutatieGemaakt_SelectedFG = CHOOSE(CHOICE(?OverboekList2) % 2,-1,-1)
      SELF.Q.APla4:MutatieGemaakt_SelectedBG = CHOOSE(CHOICE(?OverboekList2) % 2,-1,-1)
      SELF.Q.LOC:Getransferd_NormalFG   = CHOOSE(CHOICE(?OverboekList2) % 2,-1,-1) ! Set color values for LOC:Getransferd
      SELF.Q.LOC:Getransferd_NormalBG   = CHOOSE(CHOICE(?OverboekList2) % 2,-1,8454143)
      SELF.Q.LOC:Getransferd_SelectedFG = CHOOSE(CHOICE(?OverboekList2) % 2,-1,-1)
      SELF.Q.LOC:Getransferd_SelectedBG = CHOOSE(CHOICE(?OverboekList2) % 2,-1,-1)
      SELF.Q.APla4:Verwerkt_NormalFG   = CHOOSE(CHOICE(?OverboekList2) % 2,-1,-1) ! Set color values for APla4:Verwerkt
      SELF.Q.APla4:Verwerkt_NormalBG   = CHOOSE(CHOICE(?OverboekList2) % 2,-1,8454143)
      SELF.Q.APla4:Verwerkt_SelectedFG = CHOOSE(CHOICE(?OverboekList2) % 2,-1,-1)
      SELF.Q.APla4:Verwerkt_SelectedBG = CHOOSE(CHOICE(?OverboekList2) % 2,-1,-1)
      SELF.Q.APla4:CelOms_NormalFG   = CHOOSE(CHOICE(?OverboekList2) % 2,-1,-1) ! Set color values for APla4:CelOms
      SELF.Q.APla4:CelOms_NormalBG   = CHOOSE(CHOICE(?OverboekList2) % 2,-1,8454143)
      SELF.Q.APla4:CelOms_SelectedFG = CHOOSE(CHOICE(?OverboekList2) % 2,-1,-1)
      SELF.Q.APla4:CelOms_SelectedBG = CHOOSE(CHOICE(?OverboekList2) % 2,-1,-1)
      SELF.Q.APla4:Locatienaam_NormalFG   = CHOOSE(CHOICE(?OverboekList2) % 2,-1,-1) ! Set color values for APla4:Locatienaam
      SELF.Q.APla4:Locatienaam_NormalBG   = CHOOSE(CHOICE(?OverboekList2) % 2,-1,8454143)
      SELF.Q.APla4:Locatienaam_SelectedFG = CHOOSE(CHOICE(?OverboekList2) % 2,-1,-1)
      SELF.Q.APla4:Locatienaam_SelectedBG = CHOOSE(CHOICE(?OverboekList2) % 2,-1,-1)
      SELF.Q.APla4:NaarCelOms_NormalFG   = CHOOSE(CHOICE(?OverboekList2) % 2,-1,-1) ! Set color values for APla4:NaarCelOms
      SELF.Q.APla4:NaarCelOms_NormalBG   = CHOOSE(CHOICE(?OverboekList2) % 2,-1,8454143)
      SELF.Q.APla4:NaarCelOms_SelectedFG = CHOOSE(CHOICE(?OverboekList2) % 2,-1,-1)
      SELF.Q.APla4:NaarCelOms_SelectedBG = CHOOSE(CHOICE(?OverboekList2) % 2,-1,-1)
      SELF.Q.APla4:NaarLocatienaam_NormalFG   = CHOOSE(CHOICE(?OverboekList2) % 2,-1,-1) ! Set color values for APla4:NaarLocatienaam
      SELF.Q.APla4:NaarLocatienaam_NormalBG   = CHOOSE(CHOICE(?OverboekList2) % 2,-1,8454143)
      SELF.Q.APla4:NaarLocatienaam_SelectedFG = CHOOSE(CHOICE(?OverboekList2) % 2,-1,-1)
      SELF.Q.APla4:NaarLocatienaam_SelectedBG = CHOOSE(CHOICE(?OverboekList2) % 2,-1,-1)
      SELF.Q.APla4:Transport_NormalFG   = CHOOSE(CHOICE(?OverboekList2) % 2,-1,-1) ! Set color values for APla4:Transport
      SELF.Q.APla4:Transport_NormalBG   = CHOOSE(CHOICE(?OverboekList2) % 2,-1,8454143)
      SELF.Q.APla4:Transport_SelectedFG = CHOOSE(CHOICE(?OverboekList2) % 2,-1,-1)
      SELF.Q.APla4:Transport_SelectedBG = CHOOSE(CHOICE(?OverboekList2) % 2,-1,-1)
  !----------------------------------------------------------------------


BRW12.Fetch PROCEDURE(BYTE Direction)

GreenBarIndex   LONG,AUTO
  CODE
  PARENT.Fetch(Direction)
  !----------------------------------------------------------------------
    LOOP GreenBarIndex=1 TO RECORDS(SELF.Q)
      GET(SELF.Q,GreenBarIndex)
      SELF.Q.APla3:ArtikelID_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for APla3:ArtikelID
      SELF.Q.APla3:ArtikelID_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.APla3:ArtikelID_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.APla3:ArtikelID_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.APla3:ArtikelOms_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for APla3:ArtikelOms
      SELF.Q.APla3:ArtikelOms_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.APla3:ArtikelOms_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.APla3:ArtikelOms_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.APla3:FirmaNaam_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for APla3:FirmaNaam
      SELF.Q.APla3:FirmaNaam_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.APla3:FirmaNaam_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.APla3:FirmaNaam_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.APla3:PartijID_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for APla3:PartijID
      SELF.Q.APla3:PartijID_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.APla3:PartijID_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.APla3:PartijID_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.APla3:ExternPartijnr_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for APla3:ExternPartijnr
      SELF.Q.APla3:ExternPartijnr_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.APla3:ExternPartijnr_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.APla3:ExternPartijnr_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.LOC:VerkoopKG2_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for LOC:VerkoopKG2
      SELF.Q.LOC:VerkoopKG2_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.LOC:VerkoopKG2_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.LOC:VerkoopKG2_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.APla3:Instructie_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for APla3:Instructie
      SELF.Q.APla3:Instructie_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.APla3:Instructie_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.APla3:Instructie_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.APla3:VerpakkingOmschrijving_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for APla3:VerpakkingOmschrijving
      SELF.Q.APla3:VerpakkingOmschrijving_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.APla3:VerpakkingOmschrijving_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.APla3:VerpakkingOmschrijving_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.APla3:Planning_TIME_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for APla3:Planning_TIME
      SELF.Q.APla3:Planning_TIME_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.APla3:Planning_TIME_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.APla3:Planning_TIME_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.LOC:VerkoopPallets2_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for LOC:VerkoopPallets2
      SELF.Q.LOC:VerkoopPallets2_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.LOC:VerkoopPallets2_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.LOC:VerkoopPallets2_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.APla3:MutatieGemaakt_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for APla3:MutatieGemaakt
      SELF.Q.APla3:MutatieGemaakt_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.APla3:MutatieGemaakt_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.APla3:MutatieGemaakt_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.APla3:Geprint_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for APla3:Geprint
      SELF.Q.APla3:Geprint_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.APla3:Geprint_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.APla3:Geprint_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.APla3:Verwerkt_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for APla3:Verwerkt
      SELF.Q.APla3:Verwerkt_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.APla3:Verwerkt_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.APla3:Verwerkt_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.APla3:Gewogen_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for APla3:Gewogen
      SELF.Q.APla3:Gewogen_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.APla3:Gewogen_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.APla3:Gewogen_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.APla3:CelOms_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for APla3:CelOms
      SELF.Q.APla3:CelOms_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.APla3:CelOms_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.APla3:CelOms_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.LOC:Locatienaam_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for LOC:Locatienaam
      SELF.Q.LOC:Locatienaam_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.LOC:Locatienaam_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.LOC:Locatienaam_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.APla3:HerkomstOverboekingCelOms_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for APla3:HerkomstOverboekingCelOms
      SELF.Q.APla3:HerkomstOverboekingCelOms_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.APla3:HerkomstOverboekingCelOms_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.APla3:HerkomstOverboekingCelOms_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.APla3:LeverancierFirmaNaam_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for APla3:LeverancierFirmaNaam
      SELF.Q.APla3:LeverancierFirmaNaam_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.APla3:LeverancierFirmaNaam_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.APla3:LeverancierFirmaNaam_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.APla3:Transport_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for APla3:Transport
      SELF.Q.APla3:Transport_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.APla3:Transport_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.APla3:Transport_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.APla3:PlanningID_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for APla3:PlanningID
      SELF.Q.APla3:PlanningID_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.APla3:PlanningID_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.APla3:PlanningID_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      PUT(SELF.Q)
    END
  !----------------------------------------------------------------------


BRW12.ResetQueue PROCEDURE(BYTE ResetMode)

  CODE
  db.DebugOut('START DUUR APlanningVerkoop.ResetQueue')
  pre_timing# = CLOCK()
  PARENT.ResetQueue(ResetMode)
  post_timing# = CLOCK()
  db.DebugOut('METING DUUR APlanningVerkoop.ResetQueue : ' & (post_timing# - pre_timing#))


BRW12.SetQueueRecord PROCEDURE

  CODE
  LOC:Locatienaam = CachingClass.GetCelLocatieNaam(APla3:PartijID,APla3:CelID)
  
  IF APla3:MutatieGemaakt THEN
  	LOC:VerkoopKG2 = APla3:MutatieKG
  	LOC:VerkoopPallets2 = APla3:MutatiePallets
  ELSE
  	LOC:VerkoopKG2 = APla3:KG
  	LOC:VerkoopPallets2 = APla3:Pallets
  END
  PARENT.SetQueueRecord
  If SELF.Q.LOC:VerkoopKG2<0
  	Self.Q.LOC:VerkoopKG2_NormalFG   = Color:Red
  	Self.Q.LOC:VerkoopKG2_NormalBG   = Color:Red
  	Self.Q.LOC:VerkoopKG2_SelectedFG = Color:Red
  	Self.Q.LOC:VerkoopKG2_SelectedBG = Color:Red
  	Self.Q.LOC:VerkoopPallets2_NormalFG   = Color:Red
  	Self.Q.LOC:VerkoopPallets2_SelectedFG = Color:Red
  END
  
  CLEAR (SELF.Q.APla3:Instructie_Tip)
  IF (APla3:MutatieGemaakt)
    SELF.Q.APla3:MutatieGemaakt_Icon = 2                   ! Set icon from icon list
  ELSE
    SELF.Q.APla3:MutatieGemaakt_Icon = 1                   ! Set icon from icon list
  END
  IF (APla3:Geprint)
    SELF.Q.APla3:Geprint_Icon = 2                          ! Set icon from icon list
  ELSE
    SELF.Q.APla3:Geprint_Icon = 1                          ! Set icon from icon list
  END
  IF (APla3:Verwerkt)
    SELF.Q.APla3:Verwerkt_Icon = 2                         ! Set icon from icon list
  ELSE
    SELF.Q.APla3:Verwerkt_Icon = 1                         ! Set icon from icon list
  END
  IF (APla3:Gewogen)
    SELF.Q.APla3:Gewogen_Icon = 2                          ! Set icon from icon list
  ELSE
    SELF.Q.APla3:Gewogen_Icon = 1                          ! Set icon from icon list
  END
  CLEAR (SELF.Q.APla3:Transport_Tip)
  CLEAR (SELF.Q.APla3:PlanningID_Tip)
  !----------------------------------------------------------------------
      SELF.Q.APla3:ArtikelID_NormalFG   = CHOOSE(CHOICE(?VerkoopList:2) % 2,-1,-1) ! Set color values for APla3:ArtikelID
      SELF.Q.APla3:ArtikelID_NormalBG   = CHOOSE(CHOICE(?VerkoopList:2) % 2,-1,8454143)
      SELF.Q.APla3:ArtikelID_SelectedFG = CHOOSE(CHOICE(?VerkoopList:2) % 2,-1,-1)
      SELF.Q.APla3:ArtikelID_SelectedBG = CHOOSE(CHOICE(?VerkoopList:2) % 2,-1,-1)
      SELF.Q.APla3:ArtikelOms_NormalFG   = CHOOSE(CHOICE(?VerkoopList:2) % 2,-1,-1) ! Set color values for APla3:ArtikelOms
      SELF.Q.APla3:ArtikelOms_NormalBG   = CHOOSE(CHOICE(?VerkoopList:2) % 2,-1,8454143)
      SELF.Q.APla3:ArtikelOms_SelectedFG = CHOOSE(CHOICE(?VerkoopList:2) % 2,-1,-1)
      SELF.Q.APla3:ArtikelOms_SelectedBG = CHOOSE(CHOICE(?VerkoopList:2) % 2,-1,-1)
      SELF.Q.APla3:FirmaNaam_NormalFG   = CHOOSE(CHOICE(?VerkoopList:2) % 2,-1,-1) ! Set color values for APla3:FirmaNaam
      SELF.Q.APla3:FirmaNaam_NormalBG   = CHOOSE(CHOICE(?VerkoopList:2) % 2,-1,8454143)
      SELF.Q.APla3:FirmaNaam_SelectedFG = CHOOSE(CHOICE(?VerkoopList:2) % 2,-1,-1)
      SELF.Q.APla3:FirmaNaam_SelectedBG = CHOOSE(CHOICE(?VerkoopList:2) % 2,-1,-1)
      SELF.Q.APla3:PartijID_NormalFG   = CHOOSE(CHOICE(?VerkoopList:2) % 2,-1,-1) ! Set color values for APla3:PartijID
      SELF.Q.APla3:PartijID_NormalBG   = CHOOSE(CHOICE(?VerkoopList:2) % 2,-1,8454143)
      SELF.Q.APla3:PartijID_SelectedFG = CHOOSE(CHOICE(?VerkoopList:2) % 2,-1,-1)
      SELF.Q.APla3:PartijID_SelectedBG = CHOOSE(CHOICE(?VerkoopList:2) % 2,-1,-1)
      SELF.Q.APla3:ExternPartijnr_NormalFG   = CHOOSE(CHOICE(?VerkoopList:2) % 2,-1,-1) ! Set color values for APla3:ExternPartijnr
      SELF.Q.APla3:ExternPartijnr_NormalBG   = CHOOSE(CHOICE(?VerkoopList:2) % 2,-1,8454143)
      SELF.Q.APla3:ExternPartijnr_SelectedFG = CHOOSE(CHOICE(?VerkoopList:2) % 2,-1,-1)
      SELF.Q.APla3:ExternPartijnr_SelectedBG = CHOOSE(CHOICE(?VerkoopList:2) % 2,-1,-1)
      SELF.Q.LOC:VerkoopKG2_NormalFG   = CHOOSE(CHOICE(?VerkoopList:2) % 2,-1,-1) ! Set color values for LOC:VerkoopKG2
      SELF.Q.LOC:VerkoopKG2_NormalBG   = CHOOSE(CHOICE(?VerkoopList:2) % 2,-1,8454143)
      SELF.Q.LOC:VerkoopKG2_SelectedFG = CHOOSE(CHOICE(?VerkoopList:2) % 2,-1,-1)
      SELF.Q.LOC:VerkoopKG2_SelectedBG = CHOOSE(CHOICE(?VerkoopList:2) % 2,-1,-1)
      SELF.Q.APla3:Instructie_NormalFG   = CHOOSE(CHOICE(?VerkoopList:2) % 2,-1,-1) ! Set color values for APla3:Instructie
      SELF.Q.APla3:Instructie_NormalBG   = CHOOSE(CHOICE(?VerkoopList:2) % 2,-1,8454143)
      SELF.Q.APla3:Instructie_SelectedFG = CHOOSE(CHOICE(?VerkoopList:2) % 2,-1,-1)
      SELF.Q.APla3:Instructie_SelectedBG = CHOOSE(CHOICE(?VerkoopList:2) % 2,-1,-1)
      SELF.Q.APla3:VerpakkingOmschrijving_NormalFG   = CHOOSE(CHOICE(?VerkoopList:2) % 2,-1,-1) ! Set color values for APla3:VerpakkingOmschrijving
      SELF.Q.APla3:VerpakkingOmschrijving_NormalBG   = CHOOSE(CHOICE(?VerkoopList:2) % 2,-1,8454143)
      SELF.Q.APla3:VerpakkingOmschrijving_SelectedFG = CHOOSE(CHOICE(?VerkoopList:2) % 2,-1,-1)
      SELF.Q.APla3:VerpakkingOmschrijving_SelectedBG = CHOOSE(CHOICE(?VerkoopList:2) % 2,-1,-1)
      SELF.Q.APla3:Planning_TIME_NormalFG   = CHOOSE(CHOICE(?VerkoopList:2) % 2,-1,-1) ! Set color values for APla3:Planning_TIME
      SELF.Q.APla3:Planning_TIME_NormalBG   = CHOOSE(CHOICE(?VerkoopList:2) % 2,-1,8454143)
      SELF.Q.APla3:Planning_TIME_SelectedFG = CHOOSE(CHOICE(?VerkoopList:2) % 2,-1,-1)
      SELF.Q.APla3:Planning_TIME_SelectedBG = CHOOSE(CHOICE(?VerkoopList:2) % 2,-1,-1)
      SELF.Q.LOC:VerkoopPallets2_NormalFG   = CHOOSE(CHOICE(?VerkoopList:2) % 2,-1,-1) ! Set color values for LOC:VerkoopPallets2
      SELF.Q.LOC:VerkoopPallets2_NormalBG   = CHOOSE(CHOICE(?VerkoopList:2) % 2,-1,8454143)
      SELF.Q.LOC:VerkoopPallets2_SelectedFG = CHOOSE(CHOICE(?VerkoopList:2) % 2,-1,-1)
      SELF.Q.LOC:VerkoopPallets2_SelectedBG = CHOOSE(CHOICE(?VerkoopList:2) % 2,-1,-1)
      SELF.Q.APla3:MutatieGemaakt_NormalFG   = CHOOSE(CHOICE(?VerkoopList:2) % 2,-1,-1) ! Set color values for APla3:MutatieGemaakt
      SELF.Q.APla3:MutatieGemaakt_NormalBG   = CHOOSE(CHOICE(?VerkoopList:2) % 2,-1,8454143)
      SELF.Q.APla3:MutatieGemaakt_SelectedFG = CHOOSE(CHOICE(?VerkoopList:2) % 2,-1,-1)
      SELF.Q.APla3:MutatieGemaakt_SelectedBG = CHOOSE(CHOICE(?VerkoopList:2) % 2,-1,-1)
      SELF.Q.APla3:Geprint_NormalFG   = CHOOSE(CHOICE(?VerkoopList:2) % 2,-1,-1) ! Set color values for APla3:Geprint
      SELF.Q.APla3:Geprint_NormalBG   = CHOOSE(CHOICE(?VerkoopList:2) % 2,-1,8454143)
      SELF.Q.APla3:Geprint_SelectedFG = CHOOSE(CHOICE(?VerkoopList:2) % 2,-1,-1)
      SELF.Q.APla3:Geprint_SelectedBG = CHOOSE(CHOICE(?VerkoopList:2) % 2,-1,-1)
      SELF.Q.APla3:Verwerkt_NormalFG   = CHOOSE(CHOICE(?VerkoopList:2) % 2,-1,-1) ! Set color values for APla3:Verwerkt
      SELF.Q.APla3:Verwerkt_NormalBG   = CHOOSE(CHOICE(?VerkoopList:2) % 2,-1,8454143)
      SELF.Q.APla3:Verwerkt_SelectedFG = CHOOSE(CHOICE(?VerkoopList:2) % 2,-1,-1)
      SELF.Q.APla3:Verwerkt_SelectedBG = CHOOSE(CHOICE(?VerkoopList:2) % 2,-1,-1)
      SELF.Q.APla3:Gewogen_NormalFG   = CHOOSE(CHOICE(?VerkoopList:2) % 2,-1,-1) ! Set color values for APla3:Gewogen
      SELF.Q.APla3:Gewogen_NormalBG   = CHOOSE(CHOICE(?VerkoopList:2) % 2,-1,8454143)
      SELF.Q.APla3:Gewogen_SelectedFG = CHOOSE(CHOICE(?VerkoopList:2) % 2,-1,-1)
      SELF.Q.APla3:Gewogen_SelectedBG = CHOOSE(CHOICE(?VerkoopList:2) % 2,-1,-1)
      SELF.Q.APla3:CelOms_NormalFG   = CHOOSE(CHOICE(?VerkoopList:2) % 2,-1,-1) ! Set color values for APla3:CelOms
      SELF.Q.APla3:CelOms_NormalBG   = CHOOSE(CHOICE(?VerkoopList:2) % 2,-1,8454143)
      SELF.Q.APla3:CelOms_SelectedFG = CHOOSE(CHOICE(?VerkoopList:2) % 2,-1,-1)
      SELF.Q.APla3:CelOms_SelectedBG = CHOOSE(CHOICE(?VerkoopList:2) % 2,-1,-1)
      SELF.Q.LOC:Locatienaam_NormalFG   = CHOOSE(CHOICE(?VerkoopList:2) % 2,-1,-1) ! Set color values for LOC:Locatienaam
      SELF.Q.LOC:Locatienaam_NormalBG   = CHOOSE(CHOICE(?VerkoopList:2) % 2,-1,8454143)
      SELF.Q.LOC:Locatienaam_SelectedFG = CHOOSE(CHOICE(?VerkoopList:2) % 2,-1,-1)
      SELF.Q.LOC:Locatienaam_SelectedBG = CHOOSE(CHOICE(?VerkoopList:2) % 2,-1,-1)
      SELF.Q.APla3:HerkomstOverboekingCelOms_NormalFG   = CHOOSE(CHOICE(?VerkoopList:2) % 2,-1,-1) ! Set color values for APla3:HerkomstOverboekingCelOms
      SELF.Q.APla3:HerkomstOverboekingCelOms_NormalBG   = CHOOSE(CHOICE(?VerkoopList:2) % 2,-1,8454143)
      SELF.Q.APla3:HerkomstOverboekingCelOms_SelectedFG = CHOOSE(CHOICE(?VerkoopList:2) % 2,-1,-1)
      SELF.Q.APla3:HerkomstOverboekingCelOms_SelectedBG = CHOOSE(CHOICE(?VerkoopList:2) % 2,-1,-1)
      SELF.Q.APla3:LeverancierFirmaNaam_NormalFG   = CHOOSE(CHOICE(?VerkoopList:2) % 2,-1,-1) ! Set color values for APla3:LeverancierFirmaNaam
      SELF.Q.APla3:LeverancierFirmaNaam_NormalBG   = CHOOSE(CHOICE(?VerkoopList:2) % 2,-1,8454143)
      SELF.Q.APla3:LeverancierFirmaNaam_SelectedFG = CHOOSE(CHOICE(?VerkoopList:2) % 2,-1,-1)
      SELF.Q.APla3:LeverancierFirmaNaam_SelectedBG = CHOOSE(CHOICE(?VerkoopList:2) % 2,-1,-1)
      SELF.Q.APla3:Transport_NormalFG   = CHOOSE(CHOICE(?VerkoopList:2) % 2,-1,-1) ! Set color values for APla3:Transport
      SELF.Q.APla3:Transport_NormalBG   = CHOOSE(CHOICE(?VerkoopList:2) % 2,-1,8454143)
      SELF.Q.APla3:Transport_SelectedFG = CHOOSE(CHOICE(?VerkoopList:2) % 2,-1,-1)
      SELF.Q.APla3:Transport_SelectedBG = CHOOSE(CHOICE(?VerkoopList:2) % 2,-1,-1)
      SELF.Q.APla3:PlanningID_NormalFG   = CHOOSE(CHOICE(?VerkoopList:2) % 2,-1,-1) ! Set color values for APla3:PlanningID
      SELF.Q.APla3:PlanningID_NormalBG   = CHOOSE(CHOICE(?VerkoopList:2) % 2,-1,8454143)
      SELF.Q.APla3:PlanningID_SelectedFG = CHOOSE(CHOICE(?VerkoopList:2) % 2,-1,-1)
      SELF.Q.APla3:PlanningID_SelectedBG = CHOOSE(CHOICE(?VerkoopList:2) % 2,-1,-1)
  !----------------------------------------------------------------------


BRW11.Fetch PROCEDURE(BYTE Direction)

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


BRW11.Init PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)

  CODE
  PARENT.Init(ListBox,Posit,V,Q,RM,WM)
  IF WM.Request <> ViewRecord                              ! If called for anything other than ViewMode, make the insert, change & delete controls available
    SELF.InsertControl=?Insert
    SELF.ChangeControl=?Change
    SELF.DeleteControl=?Delete
  END


BRW11.PrimeRecord PROCEDURE(BYTE SuppressClear = 0)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.PrimeRecord(SuppressClear)
  ACT:Datum = TODAY()
  RETURN ReturnValue


BRW11.ResetQueue PROCEDURE(BYTE ResetMode)

  CODE
  DO KleurActiviteitTab
  PARENT.ResetQueue(ResetMode)


BRW11.SetQueueRecord PROCEDURE

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
  
  IF (ACT:Uitgevoerd = 1)
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
  IF (AAPla3:Geprint=1)
    SELF.Q.AAPla3:Geprint_Icon = 2                         ! Set icon from icon list
  ELSE
    SELF.Q.AAPla3:Geprint_Icon = 1                         ! Set icon from icon list
  END
  IF (AAPla3:Verwerkt=1)
    SELF.Q.AAPla3:Verwerkt_Icon = 2                        ! Set icon from icon list
  ELSE
    SELF.Q.AAPla3:Verwerkt_Icon = 1                        ! Set icon from icon list
  END
  IF (AAPla3:Gewogen=1)
    SELF.Q.AAPla3:Gewogen_Icon = 2                         ! Set icon from icon list
  ELSE
    SELF.Q.AAPla3:Gewogen_Icon = 1                         ! Set icon from icon list
  END
  CLEAR (SELF.Q.AAPla3:Transport_Tip)
  CLEAR (SELF.Q.AAPla3:PlanningID_Tip)
  !----------------------------------------------------------------------
      SELF.Q.ACT:Datum_NormalFG   = CHOOSE(CHOICE(?List) % 2,-1,-1) ! Set color values for ACT:Datum
      SELF.Q.ACT:Datum_NormalBG   = CHOOSE(CHOICE(?List) % 2,-1,8454143)
      SELF.Q.ACT:Datum_SelectedFG = CHOOSE(CHOICE(?List) % 2,-1,-1)
      SELF.Q.ACT:Datum_SelectedBG = CHOOSE(CHOICE(?List) % 2,-1,-1)
      SELF.Q.ACT:Tijd_NormalFG   = CHOOSE(CHOICE(?List) % 2,-1,-1) ! Set color values for ACT:Tijd
      SELF.Q.ACT:Tijd_NormalBG   = CHOOSE(CHOICE(?List) % 2,-1,8454143)
      SELF.Q.ACT:Tijd_SelectedFG = CHOOSE(CHOICE(?List) % 2,-1,-1)
      SELF.Q.ACT:Tijd_SelectedBG = CHOOSE(CHOICE(?List) % 2,-1,-1)
      SELF.Q.ACT:Uitgevoerd_NormalFG   = CHOOSE(CHOICE(?List) % 2,-1,-1) ! Set color values for ACT:Uitgevoerd
      SELF.Q.ACT:Uitgevoerd_NormalBG   = CHOOSE(CHOICE(?List) % 2,-1,8454143)
      SELF.Q.ACT:Uitgevoerd_SelectedFG = CHOOSE(CHOICE(?List) % 2,-1,-1)
      SELF.Q.ACT:Uitgevoerd_SelectedBG = CHOOSE(CHOICE(?List) % 2,-1,-1)
      SELF.Q.ACT:Omschrijving_NormalFG   = CHOOSE(CHOICE(?List) % 2,-1,-1) ! Set color values for ACT:Omschrijving
      SELF.Q.ACT:Omschrijving_NormalBG   = CHOOSE(CHOICE(?List) % 2,-1,8454143)
      SELF.Q.ACT:Omschrijving_SelectedFG = CHOOSE(CHOICE(?List) % 2,-1,-1)
      SELF.Q.ACT:Omschrijving_SelectedBG = CHOOSE(CHOICE(?List) % 2,-1,-1)
      SELF.Q.AAPla3:ArtikelID_NormalFG   = CHOOSE(CHOICE(?List) % 2,-1,-1) ! Set color values for AAPla3:ArtikelID
      SELF.Q.AAPla3:ArtikelID_NormalBG   = CHOOSE(CHOICE(?List) % 2,-1,8454143)
      SELF.Q.AAPla3:ArtikelID_SelectedFG = CHOOSE(CHOICE(?List) % 2,-1,-1)
      SELF.Q.AAPla3:ArtikelID_SelectedBG = CHOOSE(CHOICE(?List) % 2,-1,-1)
      SELF.Q.AAPla3:ArtikelOms_NormalFG   = CHOOSE(CHOICE(?List) % 2,-1,-1) ! Set color values for AAPla3:ArtikelOms
      SELF.Q.AAPla3:ArtikelOms_NormalBG   = CHOOSE(CHOICE(?List) % 2,-1,8454143)
      SELF.Q.AAPla3:ArtikelOms_SelectedFG = CHOOSE(CHOICE(?List) % 2,-1,-1)
      SELF.Q.AAPla3:ArtikelOms_SelectedBG = CHOOSE(CHOICE(?List) % 2,-1,-1)
      SELF.Q.AAPla3:FirmaNaam_NormalFG   = CHOOSE(CHOICE(?List) % 2,-1,-1) ! Set color values for AAPla3:FirmaNaam
      SELF.Q.AAPla3:FirmaNaam_NormalBG   = CHOOSE(CHOICE(?List) % 2,-1,8454143)
      SELF.Q.AAPla3:FirmaNaam_SelectedFG = CHOOSE(CHOICE(?List) % 2,-1,-1)
      SELF.Q.AAPla3:FirmaNaam_SelectedBG = CHOOSE(CHOICE(?List) % 2,-1,-1)
      SELF.Q.AAPla3:PartijID_NormalFG   = CHOOSE(CHOICE(?List) % 2,-1,-1) ! Set color values for AAPla3:PartijID
      SELF.Q.AAPla3:PartijID_NormalBG   = CHOOSE(CHOICE(?List) % 2,-1,8454143)
      SELF.Q.AAPla3:PartijID_SelectedFG = CHOOSE(CHOICE(?List) % 2,-1,-1)
      SELF.Q.AAPla3:PartijID_SelectedBG = CHOOSE(CHOICE(?List) % 2,-1,-1)
      SELF.Q.AAPla3:ExternPartijnr_NormalFG   = CHOOSE(CHOICE(?List) % 2,-1,-1) ! Set color values for AAPla3:ExternPartijnr
      SELF.Q.AAPla3:ExternPartijnr_NormalBG   = CHOOSE(CHOICE(?List) % 2,-1,8454143)
      SELF.Q.AAPla3:ExternPartijnr_SelectedFG = CHOOSE(CHOICE(?List) % 2,-1,-1)
      SELF.Q.AAPla3:ExternPartijnr_SelectedBG = CHOOSE(CHOICE(?List) % 2,-1,-1)
      SELF.Q.LOC:VerkoopKG3_NormalFG   = CHOOSE(CHOICE(?List) % 2,-1,-1) ! Set color values for LOC:VerkoopKG3
      SELF.Q.LOC:VerkoopKG3_NormalBG   = CHOOSE(CHOICE(?List) % 2,-1,8454143)
      SELF.Q.LOC:VerkoopKG3_SelectedFG = CHOOSE(CHOICE(?List) % 2,-1,-1)
      SELF.Q.LOC:VerkoopKG3_SelectedBG = CHOOSE(CHOICE(?List) % 2,-1,-1)
      SELF.Q.AAPla3:Planning_TIME_NormalFG   = CHOOSE(CHOICE(?List) % 2,-1,-1) ! Set color values for AAPla3:Planning_TIME
      SELF.Q.AAPla3:Planning_TIME_NormalBG   = CHOOSE(CHOICE(?List) % 2,-1,8454143)
      SELF.Q.AAPla3:Planning_TIME_SelectedFG = CHOOSE(CHOICE(?List) % 2,-1,-1)
      SELF.Q.AAPla3:Planning_TIME_SelectedBG = CHOOSE(CHOICE(?List) % 2,-1,-1)
      SELF.Q.AAPla3:Planning_DATE_NormalFG   = CHOOSE(CHOICE(?List) % 2,-1,-1) ! Set color values for AAPla3:Planning_DATE
      SELF.Q.AAPla3:Planning_DATE_NormalBG   = CHOOSE(CHOICE(?List) % 2,-1,8454143)
      SELF.Q.AAPla3:Planning_DATE_SelectedFG = CHOOSE(CHOICE(?List) % 2,-1,-1)
      SELF.Q.AAPla3:Planning_DATE_SelectedBG = CHOOSE(CHOICE(?List) % 2,-1,-1)
      SELF.Q.AAPla3:Instructie_NormalFG   = CHOOSE(CHOICE(?List) % 2,-1,-1) ! Set color values for AAPla3:Instructie
      SELF.Q.AAPla3:Instructie_NormalBG   = CHOOSE(CHOICE(?List) % 2,-1,8454143)
      SELF.Q.AAPla3:Instructie_SelectedFG = CHOOSE(CHOICE(?List) % 2,-1,-1)
      SELF.Q.AAPla3:Instructie_SelectedBG = CHOOSE(CHOICE(?List) % 2,-1,-1)
      SELF.Q.AAPla3:VerpakkingOmschrijving_NormalFG   = CHOOSE(CHOICE(?List) % 2,-1,-1) ! Set color values for AAPla3:VerpakkingOmschrijving
      SELF.Q.AAPla3:VerpakkingOmschrijving_NormalBG   = CHOOSE(CHOICE(?List) % 2,-1,8454143)
      SELF.Q.AAPla3:VerpakkingOmschrijving_SelectedFG = CHOOSE(CHOICE(?List) % 2,-1,-1)
      SELF.Q.AAPla3:VerpakkingOmschrijving_SelectedBG = CHOOSE(CHOICE(?List) % 2,-1,-1)
      SELF.Q.LOC:VerkoopPallets3_NormalFG   = CHOOSE(CHOICE(?List) % 2,-1,-1) ! Set color values for LOC:VerkoopPallets3
      SELF.Q.LOC:VerkoopPallets3_NormalBG   = CHOOSE(CHOICE(?List) % 2,-1,8454143)
      SELF.Q.LOC:VerkoopPallets3_SelectedFG = CHOOSE(CHOICE(?List) % 2,-1,-1)
      SELF.Q.LOC:VerkoopPallets3_SelectedBG = CHOOSE(CHOICE(?List) % 2,-1,-1)
      SELF.Q.AAPla3:MutatieGemaakt_NormalFG   = CHOOSE(CHOICE(?List) % 2,-1,-1) ! Set color values for AAPla3:MutatieGemaakt
      SELF.Q.AAPla3:MutatieGemaakt_NormalBG   = CHOOSE(CHOICE(?List) % 2,-1,8454143)
      SELF.Q.AAPla3:MutatieGemaakt_SelectedFG = CHOOSE(CHOICE(?List) % 2,-1,-1)
      SELF.Q.AAPla3:MutatieGemaakt_SelectedBG = CHOOSE(CHOICE(?List) % 2,-1,-1)
      SELF.Q.AAPla3:Geprint_NormalFG   = CHOOSE(CHOICE(?List) % 2,-1,-1) ! Set color values for AAPla3:Geprint
      SELF.Q.AAPla3:Geprint_NormalBG   = CHOOSE(CHOICE(?List) % 2,-1,8454143)
      SELF.Q.AAPla3:Geprint_SelectedFG = CHOOSE(CHOICE(?List) % 2,-1,-1)
      SELF.Q.AAPla3:Geprint_SelectedBG = CHOOSE(CHOICE(?List) % 2,-1,-1)
      SELF.Q.AAPla3:Verwerkt_NormalFG   = CHOOSE(CHOICE(?List) % 2,-1,-1) ! Set color values for AAPla3:Verwerkt
      SELF.Q.AAPla3:Verwerkt_NormalBG   = CHOOSE(CHOICE(?List) % 2,-1,8454143)
      SELF.Q.AAPla3:Verwerkt_SelectedFG = CHOOSE(CHOICE(?List) % 2,-1,-1)
      SELF.Q.AAPla3:Verwerkt_SelectedBG = CHOOSE(CHOICE(?List) % 2,-1,-1)
      SELF.Q.AAPla3:Gewogen_NormalFG   = CHOOSE(CHOICE(?List) % 2,-1,-1) ! Set color values for AAPla3:Gewogen
      SELF.Q.AAPla3:Gewogen_NormalBG   = CHOOSE(CHOICE(?List) % 2,-1,8454143)
      SELF.Q.AAPla3:Gewogen_SelectedFG = CHOOSE(CHOICE(?List) % 2,-1,-1)
      SELF.Q.AAPla3:Gewogen_SelectedBG = CHOOSE(CHOICE(?List) % 2,-1,-1)
      SELF.Q.AAPla3:CelOms_NormalFG   = CHOOSE(CHOICE(?List) % 2,-1,-1) ! Set color values for AAPla3:CelOms
      SELF.Q.AAPla3:CelOms_NormalBG   = CHOOSE(CHOICE(?List) % 2,-1,8454143)
      SELF.Q.AAPla3:CelOms_SelectedFG = CHOOSE(CHOICE(?List) % 2,-1,-1)
      SELF.Q.AAPla3:CelOms_SelectedBG = CHOOSE(CHOICE(?List) % 2,-1,-1)
      SELF.Q.LOC:Locatienaam3_NormalFG   = CHOOSE(CHOICE(?List) % 2,-1,-1) ! Set color values for LOC:Locatienaam3
      SELF.Q.LOC:Locatienaam3_NormalBG   = CHOOSE(CHOICE(?List) % 2,-1,8454143)
      SELF.Q.LOC:Locatienaam3_SelectedFG = CHOOSE(CHOICE(?List) % 2,-1,-1)
      SELF.Q.LOC:Locatienaam3_SelectedBG = CHOOSE(CHOICE(?List) % 2,-1,-1)
      SELF.Q.AAPla3:LeverancierFirmaNaam_NormalFG   = CHOOSE(CHOICE(?List) % 2,-1,-1) ! Set color values for AAPla3:LeverancierFirmaNaam
      SELF.Q.AAPla3:LeverancierFirmaNaam_NormalBG   = CHOOSE(CHOICE(?List) % 2,-1,8454143)
      SELF.Q.AAPla3:LeverancierFirmaNaam_SelectedFG = CHOOSE(CHOICE(?List) % 2,-1,-1)
      SELF.Q.AAPla3:LeverancierFirmaNaam_SelectedBG = CHOOSE(CHOICE(?List) % 2,-1,-1)
      SELF.Q.AAPla3:Transport_NormalFG   = CHOOSE(CHOICE(?List) % 2,-1,-1) ! Set color values for AAPla3:Transport
      SELF.Q.AAPla3:Transport_NormalBG   = CHOOSE(CHOICE(?List) % 2,-1,8454143)
      SELF.Q.AAPla3:Transport_SelectedFG = CHOOSE(CHOICE(?List) % 2,-1,-1)
      SELF.Q.AAPla3:Transport_SelectedBG = CHOOSE(CHOICE(?List) % 2,-1,-1)
      SELF.Q.AAPla3:PlanningID_NormalFG   = CHOOSE(CHOICE(?List) % 2,-1,-1) ! Set color values for AAPla3:PlanningID
      SELF.Q.AAPla3:PlanningID_NormalBG   = CHOOSE(CHOICE(?List) % 2,-1,8454143)
      SELF.Q.AAPla3:PlanningID_SelectedFG = CHOOSE(CHOICE(?List) % 2,-1,-1)
      SELF.Q.AAPla3:PlanningID_SelectedBG = CHOOSE(CHOICE(?List) % 2,-1,-1)
  !----------------------------------------------------------------------


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window
  SELF.SetStrategy(?InkoopPrint, Resize:FixLeft, Resize:LockSize) ! Override strategy for ?InkoopPrint
  SELF.SetStrategy(?Calendar, Resize:FixLeft+Resize:FixTop, Resize:LockSize) ! Override strategy for ?Calendar
  SELF.SetStrategy(?InkoopVerwerk, Resize:FixLeft, Resize:LockSize) ! Override strategy for ?InkoopVerwerk
  SELF.SetStrategy(?InkoopInslag, Resize:FixLeft, Resize:LockSize) ! Override strategy for ?InkoopInslag
  SELF.SetStrategy(?InkoopHVerwerkt, Resize:FixRight, Resize:LockSize) ! Override strategy for ?InkoopHVerwerkt
  SELF.SetStrategy(?VerkoopUitslag, Resize:FixLeft, Resize:LockSize) ! Override strategy for ?VerkoopUitslag
  SELF.SetStrategy(?VerkoopHVerwerkt, Resize:FixRight, Resize:LockSize) ! Override strategy for ?VerkoopHVerwerkt
  SELF.SetStrategy(?VerkoopPrintCMR, Resize:FixLeft, Resize:LockSize) ! Override strategy for ?VerkoopPrintCMR
  SELF.SetStrategy(?VerkoopExcel, Resize:FixLeft, Resize:LockSize) ! Override strategy for ?VerkoopExcel
  SELF.SetStrategy(?Loc:DatumNu:Prompt, Resize:FixLeft+Resize:FixTop, Resize:LockSize) ! Override strategy for ?Loc:DatumNu:Prompt
  SELF.SetStrategy(?Loc:DatumNu, Resize:FixLeft+Resize:FixTop, Resize:LockSize) ! Override strategy for ?Loc:DatumNu
  SELF.SetStrategy(?OverboekDoen, Resize:FixLeft, Resize:LockSize) ! Override strategy for ?OverboekDoen
  SELF.SetStrategy(?OverboekVerwerkt, Resize:FixLeft, Resize:LockSize) ! Override strategy for ?OverboekVerwerkt
  SELF.SetStrategy(?Ritten, Resize:FixRight, Resize:LockSize) ! Override strategy for ?Ritten
  SELF.SetStrategy(?BulkOverboeken, Resize:FixLeft, Resize:LockSize) ! Override strategy for ?BulkOverboeken
  SELF.SetStrategy(?PrintOverboekingStickers, Resize:FixLeft, Resize:LockSize) ! Override strategy for ?PrintOverboekingStickers
  SELF.SetStrategy(?TransferButton2, Resize:FixRight, Resize:LockSize) ! Override strategy for ?TransferButton2
  SELF.SetStrategy(?InkoopString, Resize:FixLeft, Resize:LockSize) ! Override strategy for ?InkoopString
  SELF.SetStrategy(?OverboekingString, Resize:FixLeft, Resize:LockSize) ! Override strategy for ?OverboekingString
  SELF.SetStrategy(?VerkopenString, Resize:FixLeft, Resize:LockSize) ! Override strategy for ?VerkopenString
  SELF.SetStrategy(?VerkoopSjabloon, Resize:FixLeft, Resize:LockSize) ! Override strategy for ?VerkoopSjabloon
  SELF.SetStrategy(?UitslagWeging, Resize:FixLeft, Resize:LockSize) ! Override strategy for ?UitslagWeging
  SELF.SetStrategy(?InslagWeging, Resize:FixLeft, Resize:LockSize) ! Override strategy for ?InslagWeging
  SELF.SetStrategy(?Gister, Resize:FixLeft+Resize:FixTop, Resize:LockSize) ! Override strategy for ?Gister
  SELF.SetStrategy(?Morgen, Resize:FixLeft+Resize:FixTop, Resize:LockSize) ! Override strategy for ?Morgen
  SELF.SetStrategy(?PrintInslagRapport, Resize:FixLeft, Resize:LockSize) ! Override strategy for ?PrintInslagRapport
  SELF.SetStrategy(?PrintUitslagRapport, Resize:FixLeft, Resize:LockSize) ! Override strategy for ?PrintUitslagRapport
  SELF.SetStrategy(?InkoopTerugdraaienButton, Resize:FixLeft, Resize:LockSize) ! Override strategy for ?InkoopTerugdraaienButton
  SELF.SetStrategy(?VerkoopTerugdraaienButton, Resize:FixLeft, Resize:LockSize) ! Override strategy for ?VerkoopTerugdraaienButton
  SELF.SetStrategy(?VerkoopVerwerkt, Resize:FixLeft, Resize:LockSize) ! Override strategy for ?VerkoopVerwerkt
  SELF.SetStrategy(?VerkoopRapport, Resize:FixLeft, Resize:LockSize) ! Override strategy for ?VerkoopRapport
  SELF.SetStrategy(?Ritten, Resize:FixRight, Resize:LockSize) ! Override strategy for ?Ritten
  SELF.SetStrategy(?WeeglijstInkoop, Resize:FixLeft, Resize:LockSize) ! Override strategy for ?WeeglijstInkoop
  SELF.SetStrategy(?WeeglijstExcelInkoop, Resize:FixLeft, Resize:LockSize) ! Override strategy for ?WeeglijstExcelInkoop
  SELF.SetStrategy(?WeeglijstVerkoop, Resize:FixLeft, Resize:LockSize) ! Override strategy for ?WeeglijstVerkoop
  SELF.SetStrategy(?WeeglijstExcelVerkoop, Resize:FixLeft, Resize:LockSize) ! Override strategy for ?WeeglijstExcelVerkoop
  SELF.SetStrategy(?OverboekSjabloon, Resize:FixLeft, Resize:LockSize) ! Override strategy for ?OverboekSjabloon
  SELF.SetStrategy(?OverboekRapport, Resize:FixLeft, Resize:LockSize) ! Override strategy for ?OverboekRapport
  SELF.SetStrategy(?TransferInkoopButton, Resize:FixRight, Resize:LockSize) ! Override strategy for ?TransferInkoopButton
  SELF.SetStrategy(?InkoopInslag2, Resize:FixLeft+Resize:FixBottom, Resize:LockSize) ! Override strategy for ?InkoopInslag2
  SELF.SetStrategy(?InkoopVerwerk2, Resize:FixLeft+Resize:FixBottom, Resize:LockSize) ! Override strategy for ?InkoopVerwerk2
  SELF.SetStrategy(?InkoopPrint2, Resize:FixLeft+Resize:FixBottom, Resize:LockSize) ! Override strategy for ?InkoopPrint2
  SELF.SetStrategy(?TransferButton2, Resize:FixRight+Resize:FixBottom, Resize:LockSize) ! Override strategy for ?TransferButton2
  SELF.SetStrategy(?InkoopHVerwerkt2, Resize:FixRight+Resize:FixTop, Resize:LockSize) ! Override strategy for ?InkoopHVerwerkt2
  SELF.SetStrategy(?InslagWeging2, Resize:FixLeft+Resize:FixBottom, Resize:LockSize) ! Override strategy for ?InslagWeging2
  SELF.SetStrategy(?Weeglijst2, Resize:FixLeft+Resize:FixBottom, Resize:LockSize) ! Override strategy for ?Weeglijst2
  SELF.SetStrategy(?WeeglijstExcel2, Resize:FixLeft+Resize:FixBottom, Resize:LockSize) ! Override strategy for ?WeeglijstExcel2
  SELF.SetStrategy(?InslagRapportButton2, Resize:FixLeft+Resize:FixBottom, Resize:LockSize) ! Override strategy for ?InslagRapportButton2
  SELF.SetStrategy(?InkoopTerugdraaien2, Resize:FixLeft+Resize:FixBottom, Resize:LockSize) ! Override strategy for ?InkoopTerugdraaien2
  SELF.SetStrategy(?OverboekPrintStickers3, Resize:FixLeft+Resize:FixBottom, Resize:LockSize) ! Override strategy for ?OverboekPrintStickers3
  SELF.SetStrategy(?BulkOverboeken3, Resize:FixLeft+Resize:FixBottom, Resize:LockSize) ! Override strategy for ?BulkOverboeken3
  SELF.SetStrategy(?OverboekVerwerkt3, Resize:FixLeft+Resize:FixBottom, Resize:LockSize) ! Override strategy for ?OverboekVerwerkt3
  SELF.SetStrategy(?OverboekDoen3, Resize:FixLeft+Resize:FixBottom, Resize:LockSize) ! Override strategy for ?OverboekDoen3
  SELF.SetStrategy(?OverboekSjabloon3, Resize:FixLeft+Resize:FixBottom, Resize:LockSize) ! Override strategy for ?OverboekSjabloon3
  SELF.SetStrategy(?OverboekTransfers3, Resize:FixRight+Resize:FixBottom, Resize:LockSize) ! Override strategy for ?OverboekTransfers3
  SELF.SetStrategy(?OverboekRapport3, Resize:FixLeft+Resize:FixBottom, Resize:LockSize) ! Override strategy for ?OverboekRapport3
  SELF.SetStrategy(?VerkoopSjabloon4, Resize:FixLeft+Resize:FixBottom, Resize:LockSize) ! Override strategy for ?VerkoopSjabloon4
  SELF.SetStrategy(?VerkoopUitslag4, Resize:FixLeft+Resize:FixBottom, Resize:LockSize) ! Override strategy for ?VerkoopUitslag4
  SELF.SetStrategy(?VerkoopPrintCMR4, Resize:FixLeft+Resize:FixBottom, Resize:LockSize) ! Override strategy for ?VerkoopPrintCMR4
  SELF.SetStrategy(?VerkoopVerwerkt4, Resize:FixLeft+Resize:FixBottom, Resize:LockSize) ! Override strategy for ?VerkoopVerwerkt4
  SELF.SetStrategy(?VerkoopHVerwerkt4, Resize:FixRight+Resize:FixTop, Resize:LockSize) ! Override strategy for ?VerkoopHVerwerkt4
  SELF.SetStrategy(?VerkoopUitslagWeging4, Resize:FixLeft+Resize:FixBottom, Resize:LockSize) ! Override strategy for ?VerkoopUitslagWeging4
  SELF.SetStrategy(?Weeglijst4, Resize:FixLeft+Resize:FixBottom, Resize:LockSize) ! Override strategy for ?Weeglijst4
  SELF.SetStrategy(?WeeglijstExcel4, Resize:FixLeft+Resize:FixBottom, Resize:LockSize) ! Override strategy for ?WeeglijstExcel4
  SELF.SetStrategy(?UitslagRapport4, Resize:FixLeft+Resize:FixBottom, Resize:LockSize) ! Override strategy for ?UitslagRapport4
  SELF.SetStrategy(?VerkoopTerugdraaienButton4, Resize:FixLeft+Resize:FixBottom, Resize:LockSize) ! Override strategy for ?VerkoopTerugdraaienButton4
  SELF.SetStrategy(?VerkoopRapport4, Resize:FixLeft+Resize:FixBottom, Resize:LockSize) ! Override strategy for ?VerkoopRapport4
  SELF.SetStrategy(?VerkoopPrintPalletblad:2, Resize:FixLeft+Resize:FixBottom, Resize:LockSize) ! Override strategy for ?VerkoopPrintPalletblad:2
  SELF.SetStrategy(?VerkoopPrintPalletblad, Resize:FixLeft, Resize:LockSize) ! Override strategy for ?VerkoopPrintPalletblad
  SELF.SetStrategy(?RefreshButton, Resize:FixRight+Resize:FixBottom, Resize:LockSize) ! Override strategy for ?RefreshButton
  SELF.SetStrategy(?Close, Resize:FixRight+Resize:FixBottom, Resize:LockSize) ! Override strategy for ?Close
  SELF.SetStrategy(?List, Resize:FixLeft+Resize:FixTop, Resize:ConstantRight+Resize:ConstantBottom) ! Override strategy for ?List
  SELF.SetStrategy(?Insert, Resize:FixLeft+Resize:FixBottom, Resize:LockSize) ! Override strategy for ?Insert
  SELF.SetStrategy(?Change, Resize:FixLeft+Resize:FixBottom, Resize:LockSize) ! Override strategy for ?Change
  SELF.SetStrategy(?Delete, Resize:FixLeft+Resize:FixBottom, Resize:LockSize) ! Override strategy for ?Delete
  SELF.SetStrategy(?ActiviteitPanel, Resize:FixLeft+Resize:FixTop, Resize:LockSize) ! Override strategy for ?ActiviteitPanel
  SELF.SetStrategy(?SHEET2, Resize:FixLeft+Resize:FixTop, Resize:ConstantRight+Resize:ConstantBottom) ! Override strategy for ?SHEET2
  SELF.SetStrategy(?VerkoopExcel, Resize:FixLeft+Resize:FixBottom, Resize:LockSize) ! Override strategy for ?VerkoopExcel
  SELF.SetStrategy(?PrintVerkoopStickers:2, Resize:FixLeft+Resize:FixBottom, Resize:LockSize) ! Override strategy for ?PrintVerkoopStickers:2
  SELF.SetStrategy(?PrintVerkoopStickers, Resize:FixLeft, Resize:LockSize) ! Override strategy for ?PrintVerkoopStickers
  SELF.SetStrategy(?VerkoopList:2, Resize:FixLeft+Resize:FixTop, Resize:ConstantRight+Resize:ConstantBottom) ! Override strategy for ?VerkoopList:2
  SELF.SetStrategy(?InkoopList2, Resize:FixLeft+Resize:FixTop, Resize:ConstantRight+Resize:ConstantBottom) ! Override strategy for ?InkoopList2
  SELF.SetStrategy(?OverboekList2, Resize:FixLeft+Resize:FixTop, Resize:ConstantRight+Resize:ConstantBottom) ! Override strategy for ?OverboekList2
  SELF.SetStrategy(?VerkoopPalletbladExport2, Resize:FixLeft+Resize:FixBottom, Resize:LockSize) ! Override strategy for ?VerkoopPalletbladExport2
  SELF.SetStrategy(?VerkoopPalletbladExport, Resize:FixLeft, Resize:LockSize) ! Override strategy for ?VerkoopPalletbladExport
  SELF.SetStrategy(?VerkoopKwaliteit, Resize:FixLeft+Resize:FixBottom, Resize:LockSize) ! Override strategy for ?VerkoopKwaliteit
  SELF.SetStrategy(?InkoopKwaliteit, Resize:FixLeft+Resize:FixBottom, Resize:LockSize) ! Override strategy for ?InkoopKwaliteit

