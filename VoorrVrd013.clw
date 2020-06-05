

   MEMBER('VoorrVrd.clw')                                  ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABDROPS.INC'),ONCE
   INCLUDE('ABPOPUP.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('VOORRVRD013.INC'),ONCE        !Local module procedure declarations
                     END


!!! <summary>
!!! Generated from procedure template - Window
!!! Browse the ViewVoorraad file
!!! </summary>
BrowseVoorraadVIEW PROCEDURE 

LOC:TempFormat       STRING(2000)                          ! 
Loc:TotaalCelLocatie DECIMAL(11,2)                         ! 
LOC:CelLocatieNamen  CSTRING(51)                           ! 
CurrentTab           STRING(80)                            ! 
LOC:Cel1KG           DECIMAL(9,2)                          ! 
LOC:Cel2KG           DECIMAL(9,2)                          ! 
LOC:Cel3KG           DECIMAL(9,2)                          ! 
LOC:Cel4KG           DECIMAL(9,2)                          ! 
LOC:Cel5KG           DECIMAL(9,2)                          ! 
LOC:Cel6KG           DECIMAL(9,2)                          ! 
LOC:Cel7KG           DECIMAL(9,2)                          ! 
LOC:Cel8KG           DECIMAL(9,2)                          ! 
LOC:Cel9KG           DECIMAL(9,2)                          ! 
LOC:Cel10KG          DECIMAL(9,2)                          ! 
LOC:Cel11KG          DECIMAL(9,2)                          ! 
LOC:Cel12KG          DECIMAL(9,2)                          ! 
LOC:Cel13KG          DECIMAL(9,2)                          ! 
LOC:Cel14KG          DECIMAL(9,2)                          ! 
LOC:Cel15KG          DECIMAL(9,2)                          ! 
Loc:CelID2           LONG                                  ! 
Loc:CelID            LONG                                  ! 
LOC:CelPointer       LONG                                  ! 
LOC:CelValue         DECIMAL(9,2)                          ! 
Loc:CelOms           CSTRING(51)                           ! 
Loc:TotaalKG         LONG                                  ! 
Loc:TotaalPallets    LONG                                  ! 
LOC:VVCTVoorraadKG   DECIMAL(9,2)                          ! 
LOC:VVCTVoorraadPallets LONG                               ! 
LOC:ArtikelID        CSTRING(31)                           ! 
LOC:PartijCelID      CSTRING(26)                           ! 
Loc:CelLocatieID     LONG                                  ! 
LOC:PartijVoorraadSortering STRING(20)                     ! 
LOC:ZoekVak          STRING(20)                            ! 
LOC:DatumNU          LONG                                  ! 
LOC:TotaalVoorraad   DECIMAL(12,2)                         ! 
Loc:LegeVoorraadVerbergen BYTE                             ! 
LOC:PeilDatum        DATE                                  ! 
Loc:CelID3           LONG                                  ! 
BRW1::View:Browse    VIEW(ViewVoorraadPlanning)
                       PROJECT(VVP:ArtikelID)
                       PROJECT(VVP:ArtikelOms)
                       PROJECT(VVP:InkoopKG)
                       PROJECT(VVP:VerkoopKG)
                       PROJECT(VVP:InslagKG)
                       PROJECT(VVP:InslagPallets)
                       PROJECT(VVP:UitslagKG)
                       PROJECT(VVP:UitslagPallets)
                       JOIN(Art:Artikel_PK,VVP:ArtikelID)
                         PROJECT(Art:ArtikelID)
                       END
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
VVP:ArtikelID          LIKE(VVP:ArtikelID)            !List box control field - type derived from field
VVP:ArtikelID_NormalFG LONG                           !Normal forground color
VVP:ArtikelID_NormalBG LONG                           !Normal background color
VVP:ArtikelID_SelectedFG LONG                         !Selected forground color
VVP:ArtikelID_SelectedBG LONG                         !Selected background color
VVP:ArtikelOms         LIKE(VVP:ArtikelOms)           !List box control field - type derived from field
VVP:ArtikelOms_NormalFG LONG                          !Normal forground color
VVP:ArtikelOms_NormalBG LONG                          !Normal background color
VVP:ArtikelOms_SelectedFG LONG                        !Selected forground color
VVP:ArtikelOms_SelectedBG LONG                        !Selected background color
Loc:TotaalKG           LIKE(Loc:TotaalKG)             !List box control field - type derived from local data
Loc:TotaalKG_NormalFG  LONG                           !Normal forground color
Loc:TotaalKG_NormalBG  LONG                           !Normal background color
Loc:TotaalKG_SelectedFG LONG                          !Selected forground color
Loc:TotaalKG_SelectedBG LONG                          !Selected background color
VVP:InkoopKG           LIKE(VVP:InkoopKG)             !List box control field - type derived from field
VVP:InkoopKG_NormalFG  LONG                           !Normal forground color
VVP:InkoopKG_NormalBG  LONG                           !Normal background color
VVP:InkoopKG_SelectedFG LONG                          !Selected forground color
VVP:InkoopKG_SelectedBG LONG                          !Selected background color
VVP:VerkoopKG          LIKE(VVP:VerkoopKG)            !List box control field - type derived from field
VVP:VerkoopKG_NormalFG LONG                           !Normal forground color
VVP:VerkoopKG_NormalBG LONG                           !Normal background color
VVP:VerkoopKG_SelectedFG LONG                         !Selected forground color
VVP:VerkoopKG_SelectedBG LONG                         !Selected background color
LOC:Cel1KG             LIKE(LOC:Cel1KG)               !List box control field - type derived from local data
LOC:Cel1KG_NormalFG    LONG                           !Normal forground color
LOC:Cel1KG_NormalBG    LONG                           !Normal background color
LOC:Cel1KG_SelectedFG  LONG                           !Selected forground color
LOC:Cel1KG_SelectedBG  LONG                           !Selected background color
LOC:Cel2KG             LIKE(LOC:Cel2KG)               !List box control field - type derived from local data
LOC:Cel2KG_NormalFG    LONG                           !Normal forground color
LOC:Cel2KG_NormalBG    LONG                           !Normal background color
LOC:Cel2KG_SelectedFG  LONG                           !Selected forground color
LOC:Cel2KG_SelectedBG  LONG                           !Selected background color
LOC:Cel3KG             LIKE(LOC:Cel3KG)               !List box control field - type derived from local data
LOC:Cel3KG_NormalFG    LONG                           !Normal forground color
LOC:Cel3KG_NormalBG    LONG                           !Normal background color
LOC:Cel3KG_SelectedFG  LONG                           !Selected forground color
LOC:Cel3KG_SelectedBG  LONG                           !Selected background color
LOC:Cel4KG             LIKE(LOC:Cel4KG)               !List box control field - type derived from local data
LOC:Cel4KG_NormalFG    LONG                           !Normal forground color
LOC:Cel4KG_NormalBG    LONG                           !Normal background color
LOC:Cel4KG_SelectedFG  LONG                           !Selected forground color
LOC:Cel4KG_SelectedBG  LONG                           !Selected background color
LOC:Cel5KG             LIKE(LOC:Cel5KG)               !List box control field - type derived from local data
LOC:Cel5KG_NormalFG    LONG                           !Normal forground color
LOC:Cel5KG_NormalBG    LONG                           !Normal background color
LOC:Cel5KG_SelectedFG  LONG                           !Selected forground color
LOC:Cel5KG_SelectedBG  LONG                           !Selected background color
LOC:Cel6KG             LIKE(LOC:Cel6KG)               !List box control field - type derived from local data
LOC:Cel6KG_NormalFG    LONG                           !Normal forground color
LOC:Cel6KG_NormalBG    LONG                           !Normal background color
LOC:Cel6KG_SelectedFG  LONG                           !Selected forground color
LOC:Cel6KG_SelectedBG  LONG                           !Selected background color
LOC:Cel7KG             LIKE(LOC:Cel7KG)               !List box control field - type derived from local data
LOC:Cel7KG_NormalFG    LONG                           !Normal forground color
LOC:Cel7KG_NormalBG    LONG                           !Normal background color
LOC:Cel7KG_SelectedFG  LONG                           !Selected forground color
LOC:Cel7KG_SelectedBG  LONG                           !Selected background color
LOC:Cel8KG             LIKE(LOC:Cel8KG)               !List box control field - type derived from local data
LOC:Cel8KG_NormalFG    LONG                           !Normal forground color
LOC:Cel8KG_NormalBG    LONG                           !Normal background color
LOC:Cel8KG_SelectedFG  LONG                           !Selected forground color
LOC:Cel8KG_SelectedBG  LONG                           !Selected background color
LOC:Cel9KG             LIKE(LOC:Cel9KG)               !List box control field - type derived from local data
LOC:Cel9KG_NormalFG    LONG                           !Normal forground color
LOC:Cel9KG_NormalBG    LONG                           !Normal background color
LOC:Cel9KG_SelectedFG  LONG                           !Selected forground color
LOC:Cel9KG_SelectedBG  LONG                           !Selected background color
LOC:Cel10KG            LIKE(LOC:Cel10KG)              !List box control field - type derived from local data
LOC:Cel10KG_NormalFG   LONG                           !Normal forground color
LOC:Cel10KG_NormalBG   LONG                           !Normal background color
LOC:Cel10KG_SelectedFG LONG                           !Selected forground color
LOC:Cel10KG_SelectedBG LONG                           !Selected background color
LOC:Cel11KG            LIKE(LOC:Cel11KG)              !List box control field - type derived from local data
LOC:Cel11KG_NormalFG   LONG                           !Normal forground color
LOC:Cel11KG_NormalBG   LONG                           !Normal background color
LOC:Cel11KG_SelectedFG LONG                           !Selected forground color
LOC:Cel11KG_SelectedBG LONG                           !Selected background color
LOC:Cel12KG            LIKE(LOC:Cel12KG)              !List box control field - type derived from local data
LOC:Cel12KG_NormalFG   LONG                           !Normal forground color
LOC:Cel12KG_NormalBG   LONG                           !Normal background color
LOC:Cel12KG_SelectedFG LONG                           !Selected forground color
LOC:Cel12KG_SelectedBG LONG                           !Selected background color
LOC:Cel13KG            LIKE(LOC:Cel13KG)              !List box control field - type derived from local data
LOC:Cel13KG_NormalFG   LONG                           !Normal forground color
LOC:Cel13KG_NormalBG   LONG                           !Normal background color
LOC:Cel13KG_SelectedFG LONG                           !Selected forground color
LOC:Cel13KG_SelectedBG LONG                           !Selected background color
LOC:Cel14KG            LIKE(LOC:Cel14KG)              !List box control field - type derived from local data
LOC:Cel14KG_NormalFG   LONG                           !Normal forground color
LOC:Cel14KG_NormalBG   LONG                           !Normal background color
LOC:Cel14KG_SelectedFG LONG                           !Selected forground color
LOC:Cel14KG_SelectedBG LONG                           !Selected background color
LOC:Cel15KG            LIKE(LOC:Cel15KG)              !List box control field - type derived from local data
LOC:Cel15KG_NormalFG   LONG                           !Normal forground color
LOC:Cel15KG_NormalBG   LONG                           !Normal background color
LOC:Cel15KG_SelectedFG LONG                           !Selected forground color
LOC:Cel15KG_SelectedBG LONG                           !Selected background color
VVP:InslagKG           LIKE(VVP:InslagKG)             !Browse hot field - type derived from field
VVP:InslagPallets      LIKE(VVP:InslagPallets)        !Browse hot field - type derived from field
VVP:UitslagKG          LIKE(VVP:UitslagKG)            !Browse hot field - type derived from field
VVP:UitslagPallets     LIKE(VVP:UitslagPallets)       !Browse hot field - type derived from field
Art:ArtikelID          LIKE(Art:ArtikelID)            !Related join file key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
BRW9::View:Browse    VIEW(ViewVoorraadCelTotaal)
                       PROJECT(VVCT:ArtikelID)
                       PROJECT(VVCT:ArtikelOms)
                       PROJECT(VVCT:kg)
                       PROJECT(VVCT:VerkoopKG)
                       PROJECT(VVCT:pallets)
                       PROJECT(VVCT:VerkoopPallet)
                       PROJECT(VVCT:CeliD)
                       JOIN(Art:Artikel_PK,VVCT:ArtikelID)
                         PROJECT(Art:ArtikelID)
                       END
                     END
Queue:Browse:2       QUEUE                            !Queue declaration for browse/combo box using ?List:2
VVCT:ArtikelID         LIKE(VVCT:ArtikelID)           !List box control field - type derived from field
VVCT:ArtikelID_NormalFG LONG                          !Normal forground color
VVCT:ArtikelID_NormalBG LONG                          !Normal background color
VVCT:ArtikelID_SelectedFG LONG                        !Selected forground color
VVCT:ArtikelID_SelectedBG LONG                        !Selected background color
VVCT:ArtikelOms        LIKE(VVCT:ArtikelOms)          !List box control field - type derived from field
VVCT:ArtikelOms_NormalFG LONG                         !Normal forground color
VVCT:ArtikelOms_NormalBG LONG                         !Normal background color
VVCT:ArtikelOms_SelectedFG LONG                       !Selected forground color
VVCT:ArtikelOms_SelectedBG LONG                       !Selected background color
VVCT:kg                LIKE(VVCT:kg)                  !List box control field - type derived from field
VVCT:kg_NormalFG       LONG                           !Normal forground color
VVCT:kg_NormalBG       LONG                           !Normal background color
VVCT:kg_SelectedFG     LONG                           !Selected forground color
VVCT:kg_SelectedBG     LONG                           !Selected background color
VVCT:VerkoopKG         LIKE(VVCT:VerkoopKG)           !List box control field - type derived from field
VVCT:VerkoopKG_NormalFG LONG                          !Normal forground color
VVCT:VerkoopKG_NormalBG LONG                          !Normal background color
VVCT:VerkoopKG_SelectedFG LONG                        !Selected forground color
VVCT:VerkoopKG_SelectedBG LONG                        !Selected background color
LOC:VVCTVoorraadKG     LIKE(LOC:VVCTVoorraadKG)       !List box control field - type derived from local data
LOC:VVCTVoorraadKG_NormalFG LONG                      !Normal forground color
LOC:VVCTVoorraadKG_NormalBG LONG                      !Normal background color
LOC:VVCTVoorraadKG_SelectedFG LONG                    !Selected forground color
LOC:VVCTVoorraadKG_SelectedBG LONG                    !Selected background color
VVCT:pallets           LIKE(VVCT:pallets)             !List box control field - type derived from field
VVCT:pallets_NormalFG  LONG                           !Normal forground color
VVCT:pallets_NormalBG  LONG                           !Normal background color
VVCT:pallets_SelectedFG LONG                          !Selected forground color
VVCT:pallets_SelectedBG LONG                          !Selected background color
VVCT:VerkoopPallet     LIKE(VVCT:VerkoopPallet)       !List box control field - type derived from field
VVCT:VerkoopPallet_NormalFG LONG                      !Normal forground color
VVCT:VerkoopPallet_NormalBG LONG                      !Normal background color
VVCT:VerkoopPallet_SelectedFG LONG                    !Selected forground color
VVCT:VerkoopPallet_SelectedBG LONG                    !Selected background color
LOC:VVCTVoorraadPallets LIKE(LOC:VVCTVoorraadPallets) !List box control field - type derived from local data
LOC:VVCTVoorraadPallets_NormalFG LONG                 !Normal forground color
LOC:VVCTVoorraadPallets_NormalBG LONG                 !Normal background color
LOC:VVCTVoorraadPallets_SelectedFG LONG               !Selected forground color
LOC:VVCTVoorraadPallets_SelectedBG LONG               !Selected background color
VVCT:CeliD             LIKE(VVCT:CeliD)               !Browse key field - type derived from field
Art:ArtikelID          LIKE(Art:ArtikelID)            !Related join file key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
BRW2::View:Browse    VIEW(ViewVoorraadPartij)
                       PROJECT(VVPar:ArtikelID)
                       PROJECT(VVPar:PartijID)
                       PROJECT(VVPar:ExternPartijnr)
                       PROJECT(VVPar:CelOms)
                       PROJECT(VVPar:VoorraadKG)
                       PROJECT(VVPar:VerpakkingOmschrijving)
                       PROJECT(VVPar:LeverancierFirmanaam)
                       PROJECT(VVPar:AanmaakDatum_DATE)
                       PROJECT(VVPar:AanmaakDatum_GROUP)
                       PROJECT(VVPar:CelID)
                       PROJECT(VVPar:PartijCelID)
                       PROJECT(VVPar:ArtikelOms)
                       JOIN(AArt:Artikel_PK,VVPar:ArtikelID)
                         PROJECT(AArt:ArtikelOms)
                         PROJECT(AArt:ArtikelID)
                       END
                       JOIN(VVParT:PK_ViewVoorraadPartijTotaal,VVPar:PartijID)
                         PROJECT(VVParT:VoorraadKG)
                         PROJECT(VVParT:PartijID)
                       END
                     END
Queue:Browse         QUEUE                            !Queue declaration for browse/combo box using ?List
VVPar:ArtikelID        LIKE(VVPar:ArtikelID)          !List box control field - type derived from field
VVPar:ArtikelID_NormalFG LONG                         !Normal forground color
VVPar:ArtikelID_NormalBG LONG                         !Normal background color
VVPar:ArtikelID_SelectedFG LONG                       !Selected forground color
VVPar:ArtikelID_SelectedBG LONG                       !Selected background color
AArt:ArtikelOms        LIKE(AArt:ArtikelOms)          !List box control field - type derived from field
AArt:ArtikelOms_NormalFG LONG                         !Normal forground color
AArt:ArtikelOms_NormalBG LONG                         !Normal background color
AArt:ArtikelOms_SelectedFG LONG                       !Selected forground color
AArt:ArtikelOms_SelectedBG LONG                       !Selected background color
VVPar:PartijID         LIKE(VVPar:PartijID)           !List box control field - type derived from field
VVPar:PartijID_NormalFG LONG                          !Normal forground color
VVPar:PartijID_NormalBG LONG                          !Normal background color
VVPar:PartijID_SelectedFG LONG                        !Selected forground color
VVPar:PartijID_SelectedBG LONG                        !Selected background color
VVPar:ExternPartijnr   LIKE(VVPar:ExternPartijnr)     !List box control field - type derived from field
VVPar:ExternPartijnr_NormalFG LONG                    !Normal forground color
VVPar:ExternPartijnr_NormalBG LONG                    !Normal background color
VVPar:ExternPartijnr_SelectedFG LONG                  !Selected forground color
VVPar:ExternPartijnr_SelectedBG LONG                  !Selected background color
VVParT:VoorraadKG      LIKE(VVParT:VoorraadKG)        !List box control field - type derived from field
VVParT:VoorraadKG_NormalFG LONG                       !Normal forground color
VVParT:VoorraadKG_NormalBG LONG                       !Normal background color
VVParT:VoorraadKG_SelectedFG LONG                     !Selected forground color
VVParT:VoorraadKG_SelectedBG LONG                     !Selected background color
VVPar:CelOms           LIKE(VVPar:CelOms)             !List box control field - type derived from field
VVPar:CelOms_NormalFG  LONG                           !Normal forground color
VVPar:CelOms_NormalBG  LONG                           !Normal background color
VVPar:CelOms_SelectedFG LONG                          !Selected forground color
VVPar:CelOms_SelectedBG LONG                          !Selected background color
LOC:CelLocatieNamen    LIKE(LOC:CelLocatieNamen)      !List box control field - type derived from local data
LOC:CelLocatieNamen_NormalFG LONG                     !Normal forground color
LOC:CelLocatieNamen_NormalBG LONG                     !Normal background color
LOC:CelLocatieNamen_SelectedFG LONG                   !Selected forground color
LOC:CelLocatieNamen_SelectedBG LONG                   !Selected background color
VVPar:VoorraadKG       LIKE(VVPar:VoorraadKG)         !List box control field - type derived from field
VVPar:VoorraadKG_NormalFG LONG                        !Normal forground color
VVPar:VoorraadKG_NormalBG LONG                        !Normal background color
VVPar:VoorraadKG_SelectedFG LONG                      !Selected forground color
VVPar:VoorraadKG_SelectedBG LONG                      !Selected background color
VVPar:VerpakkingOmschrijving LIKE(VVPar:VerpakkingOmschrijving) !List box control field - type derived from field
VVPar:VerpakkingOmschrijving_NormalFG LONG            !Normal forground color
VVPar:VerpakkingOmschrijving_NormalBG LONG            !Normal background color
VVPar:VerpakkingOmschrijving_SelectedFG LONG          !Selected forground color
VVPar:VerpakkingOmschrijving_SelectedBG LONG          !Selected background color
VVPar:LeverancierFirmanaam LIKE(VVPar:LeverancierFirmanaam) !List box control field - type derived from field
VVPar:LeverancierFirmanaam_NormalFG LONG              !Normal forground color
VVPar:LeverancierFirmanaam_NormalBG LONG              !Normal background color
VVPar:LeverancierFirmanaam_SelectedFG LONG            !Selected forground color
VVPar:LeverancierFirmanaam_SelectedBG LONG            !Selected background color
VVPar:AanmaakDatum_DATE LIKE(VVPar:AanmaakDatum_DATE) !List box control field - type derived from field
VVPar:AanmaakDatum_DATE_NormalFG LONG                 !Normal forground color
VVPar:AanmaakDatum_DATE_NormalBG LONG                 !Normal background color
VVPar:AanmaakDatum_DATE_SelectedFG LONG               !Selected forground color
VVPar:AanmaakDatum_DATE_SelectedBG LONG               !Selected background color
VVPar:AanmaakDatum_GROUP STRING(SIZE(VVPar:AanmaakDatum_GROUP)) !Browse hot field - STRING defined to hold GROUP's contents
VVPar:CelID            LIKE(VVPar:CelID)              !Browse hot field - type derived from field
VVPar:PartijCelID      LIKE(VVPar:PartijCelID)        !Browse hot field - type derived from field
VVPar:ArtikelOms       LIKE(VVPar:ArtikelOms)         !Browse key field - type derived from field
AArt:ArtikelID         LIKE(AArt:ArtikelID)           !Related join file key field - type derived from field
VVParT:PartijID        LIKE(VVParT:PartijID)          !Related join file key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
BRW3::View:Browse    VIEW(ViewPartijCelLocaties)
                       PROJECT(VPCL:CelID)
                       PROJECT(VPCL:PartijID)
                       PROJECT(VPCL:CelLocatienaam)
                       PROJECT(VPCL:KG)
                       PROJECT(VPCL:Pallet)
                       PROJECT(VPCL:CelLocatieID)
                     END
Queue:Browse:3       QUEUE                            !Queue declaration for browse/combo box using ?List:3
VPCL:CelID             LIKE(VPCL:CelID)               !List box control field - type derived from field
VPCL:CelID_NormalFG    LONG                           !Normal forground color
VPCL:CelID_NormalBG    LONG                           !Normal background color
VPCL:CelID_SelectedFG  LONG                           !Selected forground color
VPCL:CelID_SelectedBG  LONG                           !Selected background color
VPCL:PartijID          LIKE(VPCL:PartijID)            !List box control field - type derived from field
VPCL:PartijID_NormalFG LONG                           !Normal forground color
VPCL:PartijID_NormalBG LONG                           !Normal background color
VPCL:PartijID_SelectedFG LONG                         !Selected forground color
VPCL:PartijID_SelectedBG LONG                         !Selected background color
VPCL:CelLocatienaam    LIKE(VPCL:CelLocatienaam)      !List box control field - type derived from field
VPCL:CelLocatienaam_NormalFG LONG                     !Normal forground color
VPCL:CelLocatienaam_NormalBG LONG                     !Normal background color
VPCL:CelLocatienaam_SelectedFG LONG                   !Selected forground color
VPCL:CelLocatienaam_SelectedBG LONG                   !Selected background color
VVPar:ArtikelID        LIKE(VVPar:ArtikelID)          !List box control field - type derived from field
VVPar:ArtikelID_NormalFG LONG                         !Normal forground color
VVPar:ArtikelID_NormalBG LONG                         !Normal background color
VVPar:ArtikelID_SelectedFG LONG                       !Selected forground color
VVPar:ArtikelID_SelectedBG LONG                       !Selected background color
VVPar:ArtikelOms       LIKE(VVPar:ArtikelOms)         !List box control field - type derived from field
VVPar:ArtikelOms_NormalFG LONG                        !Normal forground color
VVPar:ArtikelOms_NormalBG LONG                        !Normal background color
VVPar:ArtikelOms_SelectedFG LONG                      !Selected forground color
VVPar:ArtikelOms_SelectedBG LONG                      !Selected background color
VPCL:KG                LIKE(VPCL:KG)                  !List box control field - type derived from field
VPCL:KG_NormalFG       LONG                           !Normal forground color
VPCL:KG_NormalBG       LONG                           !Normal background color
VPCL:KG_SelectedFG     LONG                           !Selected forground color
VPCL:KG_SelectedBG     LONG                           !Selected background color
VPCL:Pallet            LIKE(VPCL:Pallet)              !List box control field - type derived from field
VPCL:Pallet_NormalFG   LONG                           !Normal forground color
VPCL:Pallet_NormalBG   LONG                           !Normal background color
VPCL:Pallet_SelectedFG LONG                           !Selected forground color
VPCL:Pallet_SelectedBG LONG                           !Selected background color
VPCL:CelLocatieID      LIKE(VPCL:CelLocatieID)        !Primary key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
FDCB10::View:FileDropCombo VIEW(ACel)
                       PROJECT(ACel:CelOms)
                       PROJECT(ACel:CelID)
                     END
FDCB5::View:FileDropCombo VIEW(AACel)
                       PROJECT(AACel:CelOms)
                       PROJECT(AACel:CelID)
                     END
Queue:FileDropCombo  QUEUE                            !
ACel:CelOms            LIKE(ACel:CelOms)              !List box control field - type derived from field
ACel:CelID             LIKE(ACel:CelID)               !Primary key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
Queue:FileDropCombo:1 QUEUE                           !
AACel:CelOms           LIKE(AACel:CelOms)             !List box control field - type derived from field
AACel:CelID            LIKE(AACel:CelID)              !Browse hot field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
LocEnableEnterByTab  BYTE(1)                               !Used by the ENTER Instead of Tab template
EnterByTabManager    EnterByTabClass
NetLocalRefreshDate     Long     ! NetTalk (NetRefresh)
NetLocalRefreshTime     Long
NetLocalDependancies    String('|ViewVoorraadPlanning|ViewArtikel|ViewVoorraadCelTotaal|ViewVoorraadPartij|AViewArtikel|ViewVoorraadPartijTotaal|ViewPartijCelLocaties|ACel|AACel|')
QuickWindow          WINDOW('Voorraad'),AT(,,644,279),FONT('MS Sans Serif',8,,,CHARSET:DEFAULT),RESIZE,CENTER,GRAY, |
  IMM,MAX,MDI,HLP('BrowseVoorraad'),SYSTEM
                       SHEET,AT(4,4,638,250),USE(?CurrentTab)
                         TAB('&1) Totale Voorraad'),USE(?Tab:2)
                           LIST,AT(9,41,628,194),USE(?Browse:1),HVSCROLL,ALRT(MouseLeft2),FORMAT('46L(2)|*~Artikel' & |
  ' ID~C(0)@s30@116L(2)|*~Artikel~C(2)@s60@[56R(2)|M*~kg~C(1)@n-15`2@]|~Totaal~[60R(2)|' & |
  '*~kg~C(0)@N-16`2@]|~Geplande inkoop~[60R(2)|*~kg~C(0)@N-16`2@]|~Geplande verkoop~44R' & |
  '(2)|*~*1~C(0)@n-13`2B@44R(2)|*~*2~C(0)@n-13`2B@44R(2)|*~*3~C(0)@n-13`2B@44R(2)|*~*4~' & |
  'C(0)@n-13`2B@44R(2)|*~*5~C(0)@n-13`2B@44R(2)|*~*6~C(0)@n-13`2B@44R(2)|*~*7~C(0)@n-13' & |
  '`2B@44R(2)|*~*8~C(0)@n-13`2B@44R(2)|*~*9~C(0)@n-13`2B@44R(2)|*~*A~C(0)@n-13`2B@44R(2' & |
  ')|*~*B~C(0)@n-13`2B@44R(2)|*~*C~C(0)@n-13`2B@44R(2)|*~*D~C(0)@n-13`2B@44R(2)|*~*E~C(' & |
  '0)@n-13`2B@44R(2)|*~*F~C(0)@n-13`2B@'),FROM(Queue:Browse:1),IMM,MSG('Browsing the Vi' & |
  'ewVoorraad file')
                           BUTTON('Voorraad-verloop'),AT(9,22),USE(?VoorraadVerloop)
                           BUTTON('&Insert'),AT(10,237,42,12),USE(?Insert),DISABLE,HIDE
                           BUTTON('&Change'),AT(51,237,42,12),USE(?Change),DISABLE,HIDE
                           BUTTON('&Delete'),AT(94,237,42,12),USE(?Delete),DISABLE,HIDE
                           BUTTON('&Bekijk in-/verkopen'),AT(547,238,91,12),USE(?View:2),KEY(EnterKey)
                           BUTTON('Overboeken'),AT(84,22,61),USE(?Overboeken1)
                           BUTTON('Excel'),AT(475,237,70),USE(?ExcelButton)
                           BUTTON('Vandaag'),AT(577,23,59,14),USE(?VandaagButton)
                           SPIN(@d6-),AT(517,24,60,12),USE(LOC:PeilDatum),RIGHT(2)
                           PROMPT('Peildatum:'),AT(477,25),USE(?LOC:PeilDatum:Prompt:2)
                         END
                         TAB('&2) Partij-voorraden'),USE(?TAB1)
                           BUTTON('Partij-voorraad verloop'),AT(11,25),USE(?PartijVoorraadVerloop)
                           BUTTON('Overboeken'),AT(104,25,52),USE(?Overboeken2)
                           LIST,AT(11,46,621,199),USE(?List),HVSCROLL,FORMAT('[50L(2)|M*~ID~C(0)@s30@240L(2)|M*~Om' & |
  'schrijving~C(0)@s60@](150)|~Artikel~[43R(2)|M*~Intern~C(0)@n_10@40R(2)|M*~Extern~C(1' & |
  ')@s20@56R(2)|M*~Voorraad (KG)~C(0)@n-15`2@]|~Partij~[30L(2)|M*~Cel~C(0)@s50@50L(2)|M' & |
  '*~Locatie~C(0)@s50@56R(2)|M*~Voorraad (KG)~C(0)@n-15`2@]|~Cel~60L(2)|M*~Verpakking~C' & |
  '(0)@s50@126L(2)|M*~Leverancier~C(0)@s50@40L(2)|M*~Aanmaakdatum~C(0)@d17@'),FROM(Queue:Browse), |
  IMM
                           PROMPT('in sortering:'),AT(503,28),USE(?LOC:PartijVoorraadSortering:Prompt)
                           LIST,AT(542,25,90,13),USE(LOC:PartijVoorraadSortering),DROP(10),FROM('Op artikel|#Op ar' & |
  'tikel|Op intern partijnr.|#Op intern partijnr.|Op extern partijnr.|#Op extern partij' & |
  'nr.|Aanmaakdatum'),IMM
                           ENTRY(@s20),AT(410,25,88),USE(LOC:ZoekVak)
                           PROMPT('Zoeken:'),AT(378,28),USE(?PROMPT1)
                           BUTTON('Extra stickers'),AT(161,25),USE(?ExtraStickers)
                           BUTTON('Corrigeer cel/locatie'),AT(225,25),USE(?WijzigLocatie)
                           BUTTON('Excel'),AT(307,25,39),USE(?ExcelPartij)
                         END
                         TAB('&3) Voorraad per Cel'),USE(?TAB2)
                           LIST,AT(9,42,628,204),USE(?List:2),FORMAT('67L(2)|*~Artikel ID~C(0)@s30@194L(2)|*~Artik' & |
  'el~C(0)@s60@[55R(2)|*~Inslag~C(0)@n-15`2@55R(2)|*~Uitslag~C(0)@n-15`2@55R(2)|*~Voorr' & |
  'aad~C(0)@n-13`2@]|~KG~[60R(2)|*~Inslag~C(0)@n-14.@60R(2)|M*~Uitslag~C(0)@n-14.@60R(2' & |
  ')|M*~Voorraad~C(1)@n-14.@]|~Pallets~'),FROM(Queue:Browse:2),IMM
                           COMBO(@s20),AT(105,25,115,10),USE(ACel:CelOms),DROP(15),FORMAT('200L(2)|M~Cel~C(0)@s50@'), |
  FROM(Queue:FileDropCombo),IMM
                           PROMPT('Cel:'),AT(89,25),USE(?PROMPT2)
                           BUTTON('Voorrraad-verloop'),AT(10,22),USE(?VoorraadVerloop:2)
                           STRING(@n-17`2),AT(565,24,73),USE(LOC:TotaalVoorraad,,?LOC:TotaalVoorraad:2),FONT('Microsoft ' & |
  'Sans Serif',,,FONT:bold),RIGHT
                           CHECK('Lege voorraad verbergen'),AT(237,25),USE(Loc:LegeVoorraadVerbergen)
                         END
                         TAB('4) Voorraad per Cel/Locatie'),USE(?TAB3)
                           LIST,AT(11,46,621,199),USE(?List:3),ALRT(MouseLeft),FORMAT('0L(2)|M*~Cel ID~L(1)@n-14@3' & |
  '3L(2)|M*~Partij ID~@n_7@62L(2)|M*~Cel Locatienaam~L(0)@s50@79L(2)|M*~Artikel ID~L(0)' & |
  '@s30@204L(2)|M*~Artikel Oms~L(0)@s60@60R(2)|M*~KG~R(1)@n-13`2@60L(2)|M*~Pallet~L(1)@n-14@'), |
  FROM(Queue:Browse:3),IMM
                           PROMPT('Cel:'),AT(13,27),USE(?PROMPT3)
                           COMBO(@s50),AT(40,26,167,13),USE(AACel:CelOms),DROP(25),FORMAT('200L(2)|M~Cel Oms~L(0)@s50@'), |
  FROM(Queue:FileDropCombo:1),IMM
                           STRING(@n-15.2),AT(565,28),USE(Loc:TotaalCelLocatie)
                           BUTTON('Export naar Excel'),AT(231,25),USE(?Export)
                         END
                       END
                       BUTTON('&Sluiten'),AT(590,260,49,14),USE(?Close),LEFT,ICON('WACLOSE.ICO'),FLAT,MSG('Close Window'), |
  TIP('Close Window')
                       BUTTON('&Verversen Scherm'),AT(497,260,82,14),USE(?Ververs),LEFT,ICON('REFRESH.ICO'),FLAT, |
  MSG('Close Window'),TIP('Close Window')
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
VulCelVoorraad         PROCEDURE(LONG PRM:CelIndex, REAL PRM:KG) ! New method added to this class instance
GetCelVoorraad         PROCEDURE(STRING PRM:ArtikelID, LONG PRM:CelID), REAL ! New method added to this class instance
VulAViewVoorraadCelTotaal PROCEDURE(LONG PRM:CelID, LONG PRM:Datum) ! New method added to this class instance
GetPartijVoorraad      PROCEDURE(STRING PRM:ArtikelID,Byte PRM:Inkoop), REAL ! New method added to this class instance
                     END

Toolbar              ToolbarClass
BRW1                 CLASS(BrowseClass)                    ! Browse using ?Browse:1
Q                      &Queue:Browse:1                !Reference to browse queue
Fetch                  PROCEDURE(BYTE Direction),DERIVED
Init                   PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)
ResetQueue             PROCEDURE(BYTE ResetMode),DERIVED
SetAlerts              PROCEDURE(),DERIVED
SetQueueRecord         PROCEDURE(),DERIVED
                     END

BRW1::Sort0:Locator  IncrementalLocatorClass               ! Default Locator
BRW9                 CLASS(BrowseClass)                    ! Browse using ?List:2
Q                      &Queue:Browse:2                !Reference to browse queue
Fetch                  PROCEDURE(BYTE Direction),DERIVED
ResetFromView          PROCEDURE(),DERIVED
SetQueueRecord         PROCEDURE(),DERIVED
ValidateRecord         PROCEDURE(),BYTE,DERIVED
                     END

BRW9::Sort0:Locator  StepLocatorClass                      ! Default Locator
BRW2                 CLASS(BrowseClass)                    ! Browse using ?List
Q                      &Queue:Browse                  !Reference to browse queue
Fetch                  PROCEDURE(BYTE Direction),DERIVED
ResetSort              PROCEDURE(BYTE Force),BYTE,PROC,DERIVED
SetQueueRecord         PROCEDURE(),DERIVED
                     END

BRW2::Sort0:Locator  IncrementalLocatorClass               ! Default Locator
BRW2::Sort1:Locator  IncrementalLocatorClass               ! Conditional Locator - CLIP(LOC:PartijVoorraadSortering) = CLIP('Op extern partijnr.')
BRW2::Sort2:Locator  IncrementalLocatorClass               ! Conditional Locator - CLIP(LOC:PartijVoorraadSortering) = CLIP('Op intern partijnr.')
BRW2::Sort3:Locator  StepLocatorClass                      ! Conditional Locator - CLIP(LOC:PartijVoorraadSortering) = CLIP('Aanmaakdatum')
BRW3                 CLASS(BrowseClass)                    ! Browse using ?List:3
Q                      &Queue:Browse:3                !Reference to browse queue
Fetch                  PROCEDURE(BYTE Direction),DERIVED
ResetFromView          PROCEDURE(),DERIVED
SetQueueRecord         PROCEDURE(),DERIVED
ValidateRecord         PROCEDURE(),BYTE,DERIVED
                     END

BRW3::Sort0:Locator  StepLocatorClass                      ! Default Locator
Resizer              CLASS(WindowResizeClass)
Init                   PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)
                     END

FDCB10               CLASS(FileDropComboClass)             ! File drop combo manager
Q                      &Queue:FileDropCombo           !Reference to browse queue type
                     END

FDCB5                CLASS(FileDropComboClass)             ! File drop combo manager
Q                      &Queue:FileDropCombo:1         !Reference to browse queue type
                     END

CelVoorraadQ        Queue, PRE(CVQ)
ArtikelID               CSTRING(50)
CelID                   LONG
KG                      REAL
					END
Dummy               FILE,DRIVER('MSSQL','/TURBOSQL=True'),Pre(DUM),OWNER(GLO:Owner),NAME('DUMMY'),BINDABLE,THREAD
Record                    RECORD,PRE()
Response                        CString(256)
Teller                          CString(256)
                          END
                        END

Loc:SQL     CSTRING(4000)

  CODE
  GlobalResponse = ThisWindow.Run()                        ! Opens the window and starts an Accept Loop

!---------------------------------------------------------------------------
DefineListboxStyle ROUTINE
!|
!| This routine create all the styles to be shared in this window
!| It`s called after the window open
!|
!---------------------------------------------------------------------------
ExportExcel         ROUTINE
    SETCURSOR(CURSOR:Wait)
    GlobalClass.InitExcelOle
	GlobalClass.MaakExcel('')
	LOC:DatumNU = TODAY()
	Execute  (Loc:DAtumNU%7 )+ 1
    	Loc:Ole{'Application.Range(A1).Value'}='Zondag '&Format(Loc:DAtumNU,@d6-) 
    	Loc:Ole{'Application.Range(A1).Value'}='Maandag '&Format(Loc:DAtumNU,@d6-) 
    	Loc:Ole{'Application.Range(A1).Value'}='Dinsdag '&Format(Loc:DAtumNU,@d6-) 
    	Loc:Ole{'Application.Range(A1).Value'}='Woensdag '&Format(Loc:DAtumNU,@d6-) 
    	Loc:Ole{'Application.Range(A1).Value'}='Donderdag '&Format(Loc:DAtumNU,@d6-) 
    	Loc:Ole{'Application.Range(A1).Value'}='Vrijdag '&Format(Loc:DAtumNU,@d6-) 
    	Loc:Ole{'Application.Range(A1).Value'}='Zaterdag '&Format(Loc:DAtumNU,@d6-) 
	End	
	LOC:Rij = 2
	Loc:Ole{'Application.Range(A'&Loc:Rij&').Value'}='Voorraad'
	Do Vet
	Loc:Rij+=1
   	Loc:Ole{'Application.Range(A'&Loc:Rij&').Value'}='Artikel-ID'
   	Loc:Ole{'Application.Range(B'&Loc:Rij&').Value'}='Artikel'
   	Loc:Ole{'Application.Range(C'&Loc:Rij&').Value'}='Groep'
   	Loc:Ole{'Application.Range(D'&Loc:Rij&').Value'}='Totaal (KG)'
	Loc:Ole{'Application.Range(E'&Loc:Rij&').Value'}='Geplande'
	Loc:Ole{'Application.Range(F'&Loc:Rij&').Value'}='Geplande'
	CLEAR(AACel:Record)
	SET(AACel:CEL_PK,AACel:CEL_PK)
	leeg# = 0
	laatstecel# = 0
	LOOP i# = 1 TO 15
		IF NOT(Access:AACel.TryNext() = Level:Benign)
			IF (leeg# = 0)
				AACel:CelOms = 'Geen Cel'
				laatstecel# = id#
				leeg# = 1
			ELSE
				CLEAR(AACel:Record)
			.
		.
		CASE i#
		OF 1
			Loc:Ole{'Application.Range(G'&Loc:Rij&').Value'}=AACel:CelOms
		OF 2
			Loc:Ole{'Application.Range(H'&Loc:Rij&').Value'}=AACel:CelOms
		OF 3
			Loc:Ole{'Application.Range(I'&Loc:Rij&').Value'}=AACel:CelOms
		OF 4
			Loc:Ole{'Application.Range(J'&Loc:Rij&').Value'}=AACel:CelOms
		OF 5
			Loc:Ole{'Application.Range(K'&Loc:Rij&').Value'}=AACel:CelOms
		OF 6
			Loc:Ole{'Application.Range(L'&Loc:Rij&').Value'}=AACel:CelOms
		OF 7
			Loc:Ole{'Application.Range(M'&Loc:Rij&').Value'}=AACel:CelOms
		OF 8
			Loc:Ole{'Application.Range(N'&Loc:Rij&').Value'}=AACel:CelOms
		OF 9
			Loc:Ole{'Application.Range(O'&Loc:Rij&').Value'}=AACel:CelOms
		OF 10
			Loc:Ole{'Application.Range(P'&Loc:Rij&').Value'}=AACel:CelOms
		OF 11
			Loc:Ole{'Application.Range(Q'&Loc:Rij&').Value'}=AACel:CelOms
		OF 12
			Loc:Ole{'Application.Range(R'&Loc:Rij&').Value'}=AACel:CelOms
		OF 13
			Loc:Ole{'Application.Range(S'&Loc:Rij&').Value'}=AACel:CelOms
		OF 14
			Loc:Ole{'Application.Range(T'&Loc:Rij&').Value'}=AACel:CelOms
		OF 15
			Loc:Ole{'Application.Range(U'&Loc:Rij&').Value'}=AACel:CelOms
		END
	END
    IF IGB:BekijkenPrijzen=1
	    Loc:Ole{'Application.Range(V'&Loc:Rij&').Value'}='Prijs'
	    Loc:Ole{'Application.Range(V'&Loc:Rij+1&').Value'}='per KG'
	    Loc:Ole{'Application.Range(W'&Loc:Rij&').Value'}='Voorraad'
	    Loc:Ole{'Application.Range(W'&Loc:Rij+1&').Value'}='waarde'
	    Loc:Ole{'Application.Range(X'&Loc:Rij&').Value'}='Gem prijs'
	    Loc:Ole{'Application.Range(X'&Loc:Rij+1&').Value'}='per KG'
	    Loc:Ole{'Application.Range(Y'&Loc:Rij&').Value'}='Inkoop'
	    Loc:Ole{'Application.Range(Y'&Loc:Rij+1&').Value'}='waarde'
	    Loc:Ole{'Application.Range(Z'&Loc:Rij&').Value'}='Partij'
        Loc:Ole{'Application.Range(Z'&Loc:Rij+1&').Value'}='waarde'
        Loc:Ole{'Application.Columns(V:V).ColumnWidth'}=6
        Loc:Ole{'Application.Columns(W:W).ColumnWidth'}=9
        Loc:Ole{'Application.Columns(X:X).ColumnWidth'}=6
        Loc:Ole{'Application.Columns(Y:Z).ColumnWidth'}=9
    END
   	Loc:Ole{'Application.Columns(A:A).ColumnWidth'}=15
   	Loc:Ole{'Application.Columns(B:B).ColumnWidth'}=23
	Loc:Ole{'Application.Columns(C:C).ColumnWidth'}=7
	Loc:Ole{'Application.Columns(D:F).ColumnWidth'}=10
    Loc:Ole{'Application.Columns(G:U).ColumnWidth'}=9
	Do TrekLijntjes
	Do Vet
	
	Loc:Rij += 1
	
	Loc:Ole{'Application.Range(E'&Loc:Rij&').Value'}='inkoop (KG)'
	Loc:Ole{'Application.Range(F'&Loc:Rij&').Value'}='verkoop (KG)'
	Do TrekLijntjes
	Do Vet
	! okay nu door de queu lopen 
		Loop i# = 1 To RECORDS(BRW1.Q)
			Loc:Rij+=1
			Get(BRW1.Q,i#)
		   	Loc:Ole{'Application.Range(A'&Loc:Rij&').Value'}=BRW1.Q.VVP:ArtikelID
			Loc:Ole{'Application.Range(B'&Loc:Rij&').Value'}=BRW1.Q.VVP:ArtikelOms
			CLEAR(Art:Record) 
			Art:ArtikelID=BRW1.Q.VVP:ArtikelID
			Access:ViewArtikel.Fetch(Art:Artikel_PK)
		   	Loc:Ole{'Application.Range(C'&Loc:Rij&').Value'}=Art:ArtikelGroep
		   	Loc:Ole{'Application.Range(D'&Loc:Rij&').Value'}=FORMAT(BRW1.Q.Loc:TotaalKG, @n-13`2B)
			Loc:Ole{'Application.Range(E'&Loc:Rij&').Value'}=FORMAT(BRW1.Q.VVP:InkoopKG, @n-13`2B)
			Loc:Ole{'Application.Range(F'&Loc:Rij&').Value'}=FORMAT(BRW1.Q.VVP:VerkoopKG, @n-13`2B)
			Loc:Ole{'Application.Range(G'&Loc:Rij&').Value'}=FORMAT(BRW1.Q.LOC:Cel1KG, @n-13`2B)
			Loc:Ole{'Application.Range(H'&Loc:Rij&').Value'}=FORMAT(BRW1.Q.LOC:Cel2KG, @n-13`2B)
			Loc:Ole{'Application.Range(I'&Loc:Rij&').Value'}=FORMAT(BRW1.Q.LOC:Cel3KG, @n-13`2B)
		   	Loc:Ole{'Application.Range(J'&Loc:Rij&').Value'}=FORMAT(BRW1.Q.LOC:Cel4KG, @n-13`2B)
			Loc:Ole{'Application.Range(K'&Loc:Rij&').Value'}=FORMAT(BRW1.Q.LOC:Cel5KG, @n-13`2B)
		   	Loc:Ole{'Application.Range(L'&Loc:Rij&').Value'}=FORMAT(BRW1.Q.LOC:Cel6KG, @n-13`2B)
		   	Loc:Ole{'Application.Range(M'&Loc:Rij&').Value'}=FORMAT(BRW1.Q.LOC:Cel7KG, @n-13`2B)
		   	Loc:Ole{'Application.Range(N'&Loc:Rij&').Value'}=FORMAT(BRW1.Q.LOC:Cel8KG, @n-13`2B)
		   	Loc:Ole{'Application.Range(O'&Loc:Rij&').Value'}=FORMAT(BRW1.Q.LOC:Cel9KG, @n-13`2B)
		   	Loc:Ole{'Application.Range(P'&Loc:Rij&').Value'}=FORMAT(BRW1.Q.LOC:Cel10KG, @n-13`2B)
		   	Loc:Ole{'Application.Range(Q'&Loc:Rij&').Value'}=FORMAT(BRW1.Q.LOC:Cel11KG, @n-13`2B)
		   	Loc:Ole{'Application.Range(R'&Loc:Rij&').Value'}=FORMAT(BRW1.Q.LOC:Cel12KG, @n-13`2B)
		   	Loc:Ole{'Application.Range(S'&Loc:Rij&').Value'}=FORMAT(BRW1.Q.LOC:Cel13KG, @n-13`2B)
		   	Loc:Ole{'Application.Range(T'&Loc:Rij&').Value'}=FORMAT(BRW1.Q.LOC:Cel14KG, @n-13`2B)
		   	Loc:Ole{'Application.Range(U'&Loc:Rij&').Value'}=FORMAT(BRW1.Q.LOC:Cel15KG, @n-13`2B)
            IF IGB:BekijkenPrijzen=1 
                Loc:Ole{'Application.Range(V'&Loc:Rij&').Value'}=FORMAT(Art:Prijs, @n-13`2)
                Loc:Ole{'Application.Range(W'&Loc:Rij&').Value'}='=V'&Loc:Rij&'*D'&Loc:Rij
                IF BRW1.Q.Loc:TotaalKG
                    Loc:Ole{'Application.Range(X'&Loc:Rij&').Value'}='=AFRONDEN(Y'&Loc:Rij&'/D'&Loc:Rij&';2)'
                    Loc:Ole{'Application.Range(Y'&Loc:Rij&').Value'}=FORMAT(ThisWindow.GetPartijVoorraad(BRW1.Q.VVP:ArtikelID,true), @n-13`2B)
                    Loc:Ole{'Application.Range(Z'&Loc:Rij&').Value'}=FORMAT(ThisWindow.GetPartijVoorraad(BRW1.Q.VVP:ArtikelID, false), @n-13`2B)
                END
            END
			Do TrekLijntjes			
		END
	
	Loc:Ole{'Cells.Select'}
	Loc:Ole{'Application.Selection.Font.Name'} = 'Ariel'
	Loc:Ole{'Application.Selection.Font.Size'} = 10
	
	Loc:Ole{'Application.Rows(1:'&Loc:Rij&').AutoFit'}
    IF IGB:BekijkenPrijzen=1
        Loc:Ole{'Application.ActiveSheet.PageSetup.Zoom'} = 55 != Loc:Ole{'Application.ActiveSheet.PageSetup.BlackAndWhite'}!
    ELSE    
        Loc:Ole{'Application.ActiveSheet.PageSetup.Zoom'} = 60 != Loc:Ole{'Application.ActiveSheet.PageSetup.BlackAndWhite'}!
    END
    
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
	SETCURSOR()

TrekLijntjes            Routine
    IF IGB:BekijkenPrijzen=1
        Loc:Ole{'Application.Range(A'&Loc:Rij&':Z'&Loc:Rij&').Select'}
    ELSE
        Loc:Ole{'Application.Range(A'&Loc:Rij&':U'&Loc:Rij&').Select'}
    END
    
	  Loc:Ole{'Application.Selection.Borders(9).Weight'}=2 ! xlEdgeBottom
      Loc:Ole{'Application.Selection.Borders(10).Weight'}=2 ! xlEdgeRight
      Loc:Ole{'Application.Selection.Borders(7).Weight'}=2 ! xlEdgeLeft
      Loc:Ole{'Application.Selection.Borders(8).Weight'}=2 ! xlEdgeTop
      Loc:Ole{'Application.Selection.Borders(11).Weight'}=2 ! xlInsideVertical
!      ?Ole{'Application.Selection.Borders(12).Weight'}=2 ! xlInsideHorizontal

! [Priority 4000]
Vet                     Routine
    IF IGB:BekijkenPrijzen=1
        Loc:Ole{'Application.Range(A'&Loc:Rij&':Z'&Loc:Rij&').Font.Bold'}=True
    ELSE
        Loc:Ole{'Application.Range(A'&Loc:Rij&':U'&Loc:Rij&').Font.Bold'}=True
    END
    
ExportExcelPartij         ROUTINE
	SETCURSOR(CURSOR:Wait)
    GlobalClass.InitExcelOle
	GlobalClass.MaakExcel('')
	
	Loc:Rij=1
   	Loc:Ole{'Application.Range(A'&Loc:Rij&').Value'}='Artikel-ID'
   	Loc:Ole{'Application.Range(B'&Loc:Rij&').Value'}='Artikel'
   	Loc:Ole{'Application.Range(C'&Loc:Rij&').Value'}='Intern partij'
   	Loc:Ole{'Application.Range(D'&Loc:Rij&').Value'}='Extern partij'
	Loc:Ole{'Application.Range(E'&Loc:Rij&').Value'}='Voorraad'
	Loc:Ole{'Application.Range(F'&Loc:Rij&').Value'}='Cel'
	Loc:Ole{'Application.Range(G'&Loc:Rij&').Value'}='Locatie'
	Loc:Ole{'Application.Range(H'&Loc:Rij&').Value'}='Voorraad'
	Loc:Ole{'Application.Range(I'&Loc:Rij&').Value'}='Verpakking'
    Loc:Ole{'Application.Range(J'&Loc:Rij&').Value'}='Leverancier'
    Loc:Ole{'Application.Range(K'&Loc:Rij&').Value'}='Datum inkoop'
    Loc:Ole{'Application.Range(L'&Loc:Rij&').Value'}='Inkoop prijs'
    
   	Loc:Ole{'Application.Columns(A:A).ColumnWidth'}=15
   	Loc:Ole{'Application.Columns(B:B).ColumnWidth'}=23
	Loc:Ole{'Application.Columns(C:C).ColumnWidth'}=7
	Loc:Ole{'Application.Columns(D:I).ColumnWidth'}=10
    Loc:Ole{'Application.Columns(J:J).ColumnWidth'}=25
	Loc:Ole{'Application.Columns(K:L).ColumnWidth'}=10
	
!	!Loc:Ole{'Application.Range(K'&Loc:Rij&').Value'}='Memo'
!   	Loc:Ole{'Application.Columns(A:A).ColumnWidth'}=15
!   	Loc:Ole{'Application.Columns(B:B).ColumnWidth'}=23
!	Loc:Ole{'Application.Columns(C:C).ColumnWidth'}=7
!	Loc:Ole{'Application.Columns(D:F).ColumnWidth'}=10
!    Loc:Ole{'Application.Columns(G:U).ColumnWidth'}=9
	
	! okay nu door de queu lopen 
		Loop i# = 1 To RECORDS(BRW2.Q)
			Loc:Rij+=1
			Get(BRW2.Q,i#)
		   	Loc:Ole{'Application.Range(A'&Loc:Rij&').Value'}=BRW2.Q.VVPar:ArtikelID
			CLEAR(Art:Record) 
			Art:ArtikelID=BRW2.Q.VVPar:ArtikelID
			Access:ViewArtikel.Fetch(Art:Artikel_PK)
			Loc:Ole{'Application.Range(B'&Loc:Rij&').Value'}=Art:ArtikelOms
			Loc:Ole{'Application.Range(C'&Loc:Rij&').Value'}=BRW2.Q.VVPar:PartijID
			Loc:Ole{'Application.Range(D'&Loc:Rij&').Value'}=BRW2.Q.VVPar:ExternPartijnr
			Loc:Ole{'Application.Range(E'&Loc:Rij&').Value'}=FORMAT(BRW2.Q.VVPar:VoorraadKG, @n-13`2B)
			Loc:Ole{'Application.Range(F'&Loc:Rij&').Value'}=BRW2.Q.VVPar:CelOms
		   	Loc:Ole{'Application.Range(G'&Loc:Rij&').Value'}=BRW2.Q.LOC:CelLocatieNamen
		   	Loc:Ole{'Application.Range(H'&Loc:Rij&').Value'}=FORMAT(BRW2.Q.VVParT:VoorraadKG, @n-13`2B)
		   	Loc:Ole{'Application.Range(I'&Loc:Rij&').Value'}=BRW2.Q.VVPar:VerpakkingOmschrijving
		   	Loc:Ole{'Application.Range(J'&Loc:Rij&').Value'}=BRW2.Q.VVPar:LeverancierFirmanaam
            Loc:Ole{'Application.Range(K'&Loc:Rij&').Value'}=BRW2.Q.VVPar:AanmaakDatum_DATE - 36161
            Loc:Ole{'Application.Range(K'&Loc:Rij&').NumberFormat'}='dd/mm/jjjj'

            CLEAR(AAPar:RECORD)
            AAPar:PartijID=BRW2.Q.VVPar:PartijID
            Access:AAPartij.Fetch(AAPar:Partij_PK)
		   	Loc:Ole{'Application.Range(L'&Loc:Rij&').Value'}=FORMAT(AAPar:InkoopKGPrijs, @n-13`3B)
		END
	
!	Loc:Ole{'Cells.Select'}
!	Loc:Ole{'Application.Selection.Font.Name'} = 'Ariel'
!	Loc:Ole{'Application.Selection.Font.Size'} = 10
	
	Loc:Ole{'Application.Rows(1:'&Loc:Rij&').AutoFit'}
	
	Loc:Ole{'Application.Visible'}=true ! nu pas excel laten zien
	SETCURSOR()
VulCelKG ROUTINE
	CASE LOC:CelPointer
	OF 0
		LOC:Cel1KG = LOC:CelValue
	OF 1
		LOC:Cel2KG = LOC:CelValue
	OF 2
		LOC:Cel3KG = LOC:CelValue
	OF 3
		LOC:Cel4KG = LOC:CelValue
	OF 4
		LOC:Cel5KG = LOC:CelValue
	OF 5
		LOC:Cel6KG = LOC:CelValue
	OF 6
		LOC:Cel7KG = LOC:CelValue
	OF 7
		LOC:Cel8KG = LOC:CelValue
	OF 8
		LOC:Cel9KG = LOC:CelValue
	OF 9
		LOC:Cel10KG = LOC:CelValue
	OF 10
		LOC:Cel11KG = LOC:CelValue
	OF 11
		LOC:Cel12KG = LOC:CelValue
	OF 12
		LOC:Cel13KG = LOC:CelValue
	OF 13
		LOC:Cel14KG = LOC:CelValue
	OF 14
		LOC:Cel15KG = LOC:CelValue
	END
	EXIT

ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('BrowseVoorraadVIEW')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  GLO:Voorraad_ThreadID = THREAD()
  LOC:PartijVoorraadSortering = 'Op artikel'
  Loc:LegeVoorraadVerbergen=TRUE
  Loc:CelID2 = 1 
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Browse:1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('Loc:CelID3',Loc:CelID3)                            ! Added by: BrowseBox(ABC)
  BIND('Loc:TotaalKG',Loc:TotaalKG)                        ! Added by: BrowseBox(ABC)
  BIND('LOC:Cel1KG',LOC:Cel1KG)                            ! Added by: BrowseBox(ABC)
  BIND('LOC:Cel2KG',LOC:Cel2KG)                            ! Added by: BrowseBox(ABC)
  BIND('LOC:Cel3KG',LOC:Cel3KG)                            ! Added by: BrowseBox(ABC)
  BIND('LOC:Cel4KG',LOC:Cel4KG)                            ! Added by: BrowseBox(ABC)
  BIND('LOC:Cel5KG',LOC:Cel5KG)                            ! Added by: BrowseBox(ABC)
  BIND('LOC:Cel6KG',LOC:Cel6KG)                            ! Added by: BrowseBox(ABC)
  BIND('LOC:Cel7KG',LOC:Cel7KG)                            ! Added by: BrowseBox(ABC)
  BIND('LOC:Cel8KG',LOC:Cel8KG)                            ! Added by: BrowseBox(ABC)
  BIND('LOC:Cel9KG',LOC:Cel9KG)                            ! Added by: BrowseBox(ABC)
  BIND('LOC:Cel10KG',LOC:Cel10KG)                          ! Added by: BrowseBox(ABC)
  BIND('LOC:Cel11KG',LOC:Cel11KG)                          ! Added by: BrowseBox(ABC)
  BIND('LOC:Cel12KG',LOC:Cel12KG)                          ! Added by: BrowseBox(ABC)
  BIND('LOC:Cel13KG',LOC:Cel13KG)                          ! Added by: BrowseBox(ABC)
  BIND('LOC:Cel14KG',LOC:Cel14KG)                          ! Added by: BrowseBox(ABC)
  BIND('LOC:Cel15KG',LOC:Cel15KG)                          ! Added by: BrowseBox(ABC)
  BIND('LOC:VVCTVoorraadKG',LOC:VVCTVoorraadKG)            ! Added by: BrowseBox(ABC)
  BIND('LOC:VVCTVoorraadPallets',LOC:VVCTVoorraadPallets)  ! Added by: BrowseBox(ABC)
  BIND('LOC:CelLocatieNamen',LOC:CelLocatieNamen)          ! Added by: BrowseBox(ABC)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
  IF SELF.Request = SelectRecord
     SELF.AddItem(?Close,RequestCancelled)                 ! Add the close control to the window manger
  ELSE
     SELF.AddItem(?Close,RequestCompleted)                 ! Add the close control to the window manger
  END
  Relate:AACel.Open                                        ! File AACel used by this procedure, so make sure it's RelationManager is open
  Relate:AAPartij.Open                                     ! File AAPartij used by this procedure, so make sure it's RelationManager is open
  Relate:AAViewArtikel.Open                                ! File AAViewArtikel used by this procedure, so make sure it's RelationManager is open
  Relate:ACel.Open                                         ! File ACel used by this procedure, so make sure it's RelationManager is open
  Relate:AViewVoorraadCelTotaal.Open                       ! File AViewVoorraadCelTotaal used by this procedure, so make sure it's RelationManager is open
  Relate:Sjabloon.Open                                     ! File Sjabloon used by this procedure, so make sure it's RelationManager is open
  Relate:ViewPartijCelLocaties.Open                        ! File ViewPartijCelLocaties used by this procedure, so make sure it's RelationManager is open
  Relate:ViewVoorraadCelTotaal.Open                        ! File ViewVoorraadCelTotaal used by this procedure, so make sure it's RelationManager is open
  Relate:ViewVoorraadPartij.Open                           ! File ViewVoorraadPartij used by this procedure, so make sure it's RelationManager is open
  Relate:ViewVoorraadPartijTotaal.Open                     ! File ViewVoorraadPartijTotaal used by this procedure, so make sure it's RelationManager is open
  Relate:ViewVoorraadPlanning.Open                         ! File ViewVoorraadPlanning used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  LOC:PeilDatum = TODAY()
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:ViewVoorraadPlanning,SELF) ! Initialize the browse manager
  BRW9.Init(?List:2,Queue:Browse:2.ViewPosition,BRW9::View:Browse,Queue:Browse:2,Relate:ViewVoorraadCelTotaal,SELF) ! Initialize the browse manager
  BRW2.Init(?List,Queue:Browse.ViewPosition,BRW2::View:Browse,Queue:Browse,Relate:ViewVoorraadPartij,SELF) ! Initialize the browse manager
  BRW3.Init(?List:3,Queue:Browse:3.ViewPosition,BRW3::View:Browse,Queue:Browse:3,Relate:ViewPartijCelLocaties,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  0{Prop:Text}=CLIP(0{Prop:Text}) !& ' (' & CLIP(LEFT(FORMAT(THREAD(),@N_10))) & ')'
  WinAlertMouseZoom()
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1.FileLoaded = 1                                      ! This is a 'file loaded' browse
  BRW1.AddSortOrder(,VVP:ViewVoorraad_PK)                  ! Add the sort order for VVP:ViewVoorraad_PK for sort order 1
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort0:Locator.Init(,VVP:ArtikelOms,1,BRW1)         ! Initialize the browse locator using  using key: VVP:ViewVoorraad_PK , VVP:ArtikelOms
  BRW1.AddField(VVP:ArtikelID,BRW1.Q.VVP:ArtikelID)        ! Field VVP:ArtikelID is a hot field or requires assignment from browse
  BRW1.AddField(VVP:ArtikelOms,BRW1.Q.VVP:ArtikelOms)      ! Field VVP:ArtikelOms is a hot field or requires assignment from browse
  BRW1.AddField(Loc:TotaalKG,BRW1.Q.Loc:TotaalKG)          ! Field Loc:TotaalKG is a hot field or requires assignment from browse
  BRW1.AddField(VVP:InkoopKG,BRW1.Q.VVP:InkoopKG)          ! Field VVP:InkoopKG is a hot field or requires assignment from browse
  BRW1.AddField(VVP:VerkoopKG,BRW1.Q.VVP:VerkoopKG)        ! Field VVP:VerkoopKG is a hot field or requires assignment from browse
  BRW1.AddField(LOC:Cel1KG,BRW1.Q.LOC:Cel1KG)              ! Field LOC:Cel1KG is a hot field or requires assignment from browse
  BRW1.AddField(LOC:Cel2KG,BRW1.Q.LOC:Cel2KG)              ! Field LOC:Cel2KG is a hot field or requires assignment from browse
  BRW1.AddField(LOC:Cel3KG,BRW1.Q.LOC:Cel3KG)              ! Field LOC:Cel3KG is a hot field or requires assignment from browse
  BRW1.AddField(LOC:Cel4KG,BRW1.Q.LOC:Cel4KG)              ! Field LOC:Cel4KG is a hot field or requires assignment from browse
  BRW1.AddField(LOC:Cel5KG,BRW1.Q.LOC:Cel5KG)              ! Field LOC:Cel5KG is a hot field or requires assignment from browse
  BRW1.AddField(LOC:Cel6KG,BRW1.Q.LOC:Cel6KG)              ! Field LOC:Cel6KG is a hot field or requires assignment from browse
  BRW1.AddField(LOC:Cel7KG,BRW1.Q.LOC:Cel7KG)              ! Field LOC:Cel7KG is a hot field or requires assignment from browse
  BRW1.AddField(LOC:Cel8KG,BRW1.Q.LOC:Cel8KG)              ! Field LOC:Cel8KG is a hot field or requires assignment from browse
  BRW1.AddField(LOC:Cel9KG,BRW1.Q.LOC:Cel9KG)              ! Field LOC:Cel9KG is a hot field or requires assignment from browse
  BRW1.AddField(LOC:Cel10KG,BRW1.Q.LOC:Cel10KG)            ! Field LOC:Cel10KG is a hot field or requires assignment from browse
  BRW1.AddField(LOC:Cel11KG,BRW1.Q.LOC:Cel11KG)            ! Field LOC:Cel11KG is a hot field or requires assignment from browse
  BRW1.AddField(LOC:Cel12KG,BRW1.Q.LOC:Cel12KG)            ! Field LOC:Cel12KG is a hot field or requires assignment from browse
  BRW1.AddField(LOC:Cel13KG,BRW1.Q.LOC:Cel13KG)            ! Field LOC:Cel13KG is a hot field or requires assignment from browse
  BRW1.AddField(LOC:Cel14KG,BRW1.Q.LOC:Cel14KG)            ! Field LOC:Cel14KG is a hot field or requires assignment from browse
  BRW1.AddField(LOC:Cel15KG,BRW1.Q.LOC:Cel15KG)            ! Field LOC:Cel15KG is a hot field or requires assignment from browse
  BRW1.AddField(VVP:InslagKG,BRW1.Q.VVP:InslagKG)          ! Field VVP:InslagKG is a hot field or requires assignment from browse
  BRW1.AddField(VVP:InslagPallets,BRW1.Q.VVP:InslagPallets) ! Field VVP:InslagPallets is a hot field or requires assignment from browse
  BRW1.AddField(VVP:UitslagKG,BRW1.Q.VVP:UitslagKG)        ! Field VVP:UitslagKG is a hot field or requires assignment from browse
  BRW1.AddField(VVP:UitslagPallets,BRW1.Q.VVP:UitslagPallets) ! Field VVP:UitslagPallets is a hot field or requires assignment from browse
  BRW1.AddField(Art:ArtikelID,BRW1.Q.Art:ArtikelID)        ! Field Art:ArtikelID is a hot field or requires assignment from browse
  BRW9.Q &= Queue:Browse:2
  BRW9.FileLoaded = 1                                      ! This is a 'file loaded' browse
  BRW9.AddSortOrder(,VVCT:ViewVoorraadCelTotaal_PK)        ! Add the sort order for VVCT:ViewVoorraadCelTotaal_PK for sort order 1
  BRW9.AddRange(VVCT:CeliD,Loc:CelID2)                     ! Add single value range limit for sort order 1
  BRW9.AddLocator(BRW9::Sort0:Locator)                     ! Browse has a locator for sort order 1
  BRW9::Sort0:Locator.Init(,VVCT:ArtikelOms,1,BRW9)        ! Initialize the browse locator using  using key: VVCT:ViewVoorraadCelTotaal_PK , VVCT:ArtikelOms
  BRW9.AddResetField(Loc:LegeVoorraadVerbergen)            ! Apply the reset field
  BRW9.AddField(VVCT:ArtikelID,BRW9.Q.VVCT:ArtikelID)      ! Field VVCT:ArtikelID is a hot field or requires assignment from browse
  BRW9.AddField(VVCT:ArtikelOms,BRW9.Q.VVCT:ArtikelOms)    ! Field VVCT:ArtikelOms is a hot field or requires assignment from browse
  BRW9.AddField(VVCT:kg,BRW9.Q.VVCT:kg)                    ! Field VVCT:kg is a hot field or requires assignment from browse
  BRW9.AddField(VVCT:VerkoopKG,BRW9.Q.VVCT:VerkoopKG)      ! Field VVCT:VerkoopKG is a hot field or requires assignment from browse
  BRW9.AddField(LOC:VVCTVoorraadKG,BRW9.Q.LOC:VVCTVoorraadKG) ! Field LOC:VVCTVoorraadKG is a hot field or requires assignment from browse
  BRW9.AddField(VVCT:pallets,BRW9.Q.VVCT:pallets)          ! Field VVCT:pallets is a hot field or requires assignment from browse
  BRW9.AddField(VVCT:VerkoopPallet,BRW9.Q.VVCT:VerkoopPallet) ! Field VVCT:VerkoopPallet is a hot field or requires assignment from browse
  BRW9.AddField(LOC:VVCTVoorraadPallets,BRW9.Q.LOC:VVCTVoorraadPallets) ! Field LOC:VVCTVoorraadPallets is a hot field or requires assignment from browse
  BRW9.AddField(VVCT:CeliD,BRW9.Q.VVCT:CeliD)              ! Field VVCT:CeliD is a hot field or requires assignment from browse
  BRW9.AddField(Art:ArtikelID,BRW9.Q.Art:ArtikelID)        ! Field Art:ArtikelID is a hot field or requires assignment from browse
  BRW2.Q &= Queue:Browse
  BRW2.FileLoaded = 1                                      ! This is a 'file loaded' browse
  BRW2.AddSortOrder(,VVPar:ExternPartijnr_PartijID_CelID_K) ! Add the sort order for VVPar:ExternPartijnr_PartijID_CelID_K for sort order 1
  BRW2.AddLocator(BRW2::Sort1:Locator)                     ! Browse has a locator for sort order 1
  BRW2::Sort1:Locator.Init(?LOC:ZoekVak,VVPar:ExternPartijnr,1,BRW2) ! Initialize the browse locator using ?LOC:ZoekVak using key: VVPar:ExternPartijnr_PartijID_CelID_K , VVPar:ExternPartijnr
  BRW2.AddResetField(LOC:PartijVoorraadSortering)          ! Apply the reset field
  BRW2.AddSortOrder(,VVPar:PartijID_CelID_K)               ! Add the sort order for VVPar:PartijID_CelID_K for sort order 2
  BRW2.AddLocator(BRW2::Sort2:Locator)                     ! Browse has a locator for sort order 2
  BRW2::Sort2:Locator.Init(?LOC:ZoekVak,VVPar:PartijID,1,BRW2) ! Initialize the browse locator using ?LOC:ZoekVak using key: VVPar:PartijID_CelID_K , VVPar:PartijID
  BRW2.AddResetField(LOC:PartijVoorraadSortering)          ! Apply the reset field
  BRW2.AddSortOrder(,VVPar:PartijID_CelID_K)               ! Add the sort order for VVPar:PartijID_CelID_K for sort order 3
  BRW2.AddLocator(BRW2::Sort3:Locator)                     ! Browse has a locator for sort order 3
  BRW2::Sort3:Locator.Init(,VVPar:PartijID,1,BRW2)         ! Initialize the browse locator using  using key: VVPar:PartijID_CelID_K , VVPar:PartijID
  BRW2.AddSortOrder(,VVPar:ArtikelOms_PartijID_CelID_K)    ! Add the sort order for VVPar:ArtikelOms_PartijID_CelID_K for sort order 4
  BRW2.AddLocator(BRW2::Sort0:Locator)                     ! Browse has a locator for sort order 4
  BRW2::Sort0:Locator.Init(?LOC:ZoekVak,VVPar:ArtikelOms,1,BRW2) ! Initialize the browse locator using ?LOC:ZoekVak using key: VVPar:ArtikelOms_PartijID_CelID_K , VVPar:ArtikelOms
  BRW2.AppendOrder('+VVPar:PartijCelID, +VVPar:CelLocatieID') ! Append an additional sort order
  BRW2.SetFilter('(VVPar:VoorraadKG<<>0)')                 ! Apply filter expression to browse
  BRW2.AddResetField(LOC:PartijVoorraadSortering)          ! Apply the reset field
  BRW2.AddField(VVPar:ArtikelID,BRW2.Q.VVPar:ArtikelID)    ! Field VVPar:ArtikelID is a hot field or requires assignment from browse
  BRW2.AddField(AArt:ArtikelOms,BRW2.Q.AArt:ArtikelOms)    ! Field AArt:ArtikelOms is a hot field or requires assignment from browse
  BRW2.AddField(VVPar:PartijID,BRW2.Q.VVPar:PartijID)      ! Field VVPar:PartijID is a hot field or requires assignment from browse
  BRW2.AddField(VVPar:ExternPartijnr,BRW2.Q.VVPar:ExternPartijnr) ! Field VVPar:ExternPartijnr is a hot field or requires assignment from browse
  BRW2.AddField(VVParT:VoorraadKG,BRW2.Q.VVParT:VoorraadKG) ! Field VVParT:VoorraadKG is a hot field or requires assignment from browse
  BRW2.AddField(VVPar:CelOms,BRW2.Q.VVPar:CelOms)          ! Field VVPar:CelOms is a hot field or requires assignment from browse
  BRW2.AddField(LOC:CelLocatieNamen,BRW2.Q.LOC:CelLocatieNamen) ! Field LOC:CelLocatieNamen is a hot field or requires assignment from browse
  BRW2.AddField(VVPar:VoorraadKG,BRW2.Q.VVPar:VoorraadKG)  ! Field VVPar:VoorraadKG is a hot field or requires assignment from browse
  BRW2.AddField(VVPar:VerpakkingOmschrijving,BRW2.Q.VVPar:VerpakkingOmschrijving) ! Field VVPar:VerpakkingOmschrijving is a hot field or requires assignment from browse
  BRW2.AddField(VVPar:LeverancierFirmanaam,BRW2.Q.VVPar:LeverancierFirmanaam) ! Field VVPar:LeverancierFirmanaam is a hot field or requires assignment from browse
  BRW2.AddField(VVPar:AanmaakDatum_DATE,BRW2.Q.VVPar:AanmaakDatum_DATE) ! Field VVPar:AanmaakDatum_DATE is a hot field or requires assignment from browse
  BRW2.AddField(VVPar:AanmaakDatum_GROUP,BRW2.Q.VVPar:AanmaakDatum_GROUP) ! Field VVPar:AanmaakDatum_GROUP is a hot field or requires assignment from browse
  BRW2.AddField(VVPar:CelID,BRW2.Q.VVPar:CelID)            ! Field VVPar:CelID is a hot field or requires assignment from browse
  BRW2.AddField(VVPar:PartijCelID,BRW2.Q.VVPar:PartijCelID) ! Field VVPar:PartijCelID is a hot field or requires assignment from browse
  BRW2.AddField(VVPar:ArtikelOms,BRW2.Q.VVPar:ArtikelOms)  ! Field VVPar:ArtikelOms is a hot field or requires assignment from browse
  BRW2.AddField(AArt:ArtikelID,BRW2.Q.AArt:ArtikelID)      ! Field AArt:ArtikelID is a hot field or requires assignment from browse
  BRW2.AddField(VVParT:PartijID,BRW2.Q.VVParT:PartijID)    ! Field VVParT:PartijID is a hot field or requires assignment from browse
  BRW3.Q &= Queue:Browse:3
  BRW3.FileLoaded = 1                                      ! This is a 'file loaded' browse
  BRW3.AddSortOrder(,VPCL:ViewPartijCelLocaties_PK)        ! Add the sort order for VPCL:ViewPartijCelLocaties_PK for sort order 1
  BRW3.AddLocator(BRW3::Sort0:Locator)                     ! Browse has a locator for sort order 1
  BRW3::Sort0:Locator.Init(,VPCL:PartijID,1,BRW3)          ! Initialize the browse locator using  using key: VPCL:ViewPartijCelLocaties_PK , VPCL:PartijID
  BRW3.SetFilter('(VPCL:CelID=Loc:CelID3)')                ! Apply filter expression to browse
  BRW3.AddField(VPCL:CelID,BRW3.Q.VPCL:CelID)              ! Field VPCL:CelID is a hot field or requires assignment from browse
  BRW3.AddField(VPCL:PartijID,BRW3.Q.VPCL:PartijID)        ! Field VPCL:PartijID is a hot field or requires assignment from browse
  BRW3.AddField(VPCL:CelLocatienaam,BRW3.Q.VPCL:CelLocatienaam) ! Field VPCL:CelLocatienaam is a hot field or requires assignment from browse
  BRW3.AddField(VVPar:ArtikelID,BRW3.Q.VVPar:ArtikelID)    ! Field VVPar:ArtikelID is a hot field or requires assignment from browse
  BRW3.AddField(VVPar:ArtikelOms,BRW3.Q.VVPar:ArtikelOms)  ! Field VVPar:ArtikelOms is a hot field or requires assignment from browse
  BRW3.AddField(VPCL:KG,BRW3.Q.VPCL:KG)                    ! Field VPCL:KG is a hot field or requires assignment from browse
  BRW3.AddField(VPCL:Pallet,BRW3.Q.VPCL:Pallet)            ! Field VPCL:Pallet is a hot field or requires assignment from browse
  BRW3.AddField(VPCL:CelLocatieID,BRW3.Q.VPCL:CelLocatieID) ! Field VPCL:CelLocatieID is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('BrowseVoorraadVIEW',QuickWindow)           ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  BRW1.AskProcedure = 1                                    ! Will call: UpdateViewVoorraad
  FDCB10.Init(ACel:CelOms,?ACel:CelOms,Queue:FileDropCombo.ViewPosition,FDCB10::View:FileDropCombo,Queue:FileDropCombo,Relate:ACel,ThisWindow,GlobalErrors,0,1,0)
  FDCB10.Q &= Queue:FileDropCombo
  FDCB10.AddSortOrder(ACel:CEL_PK)
  FDCB10.AddField(ACel:CelOms,FDCB10.Q.ACel:CelOms) !List box control field - type derived from field
  FDCB10.AddField(ACel:CelID,FDCB10.Q.ACel:CelID) !Primary key field - type derived from field
  FDCB10.AddUpdateField(ACel:CelID,Loc:CelID2)
  ThisWindow.AddItem(FDCB10.WindowComponent)
  FDCB10.DefaultFill = 0
  FDCB5.Init(AACel:CelOms,?AACel:CelOms,Queue:FileDropCombo:1.ViewPosition,FDCB5::View:FileDropCombo,Queue:FileDropCombo:1,Relate:AACel,ThisWindow,GlobalErrors,0,1,0)
  FDCB5.Q &= Queue:FileDropCombo:1
  FDCB5.AddSortOrder(AACel:CEL_PK)
  FDCB5.AddField(AACel:CelOms,FDCB5.Q.AACel:CelOms) !List box control field - type derived from field
  FDCB5.AddField(AACel:CelID,FDCB5.Q.AACel:CelID) !Browse hot field - type derived from field
  FDCB5.AddUpdateField(AACel:CelID,Loc:CelID3)
  ThisWindow.AddItem(FDCB5.WindowComponent)
  FDCB5.DefaultFill = 0
  BRW9.AddToolbarTarget(Toolbar)                           ! Browse accepts toolbar control
  BRW2.AddToolbarTarget(Toolbar)                           ! Browse accepts toolbar control
  BRW3.AddToolbarTarget(Toolbar)                           ! Browse accepts toolbar control
  SELF.SetAlerts()
  NetLocalRefreshDate = today()         ! NetTalk (NetRefresh)
  NetLocalRefreshTime = clock()
  EnterByTabManager.Init(False)
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  GLO:Voorraad_ThreadID = 0
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:AACel.Close
    Relate:AAPartij.Close
    Relate:AAViewArtikel.Close
    Relate:ACel.Close
    Relate:AViewVoorraadCelTotaal.Close
    Relate:Sjabloon.Close
    Relate:ViewPartijCelLocaties.Close
    Relate:ViewVoorraadCelTotaal.Close
    Relate:ViewVoorraadPartij.Close
    Relate:ViewVoorraadPartijTotaal.Close
    Relate:ViewVoorraadPlanning.Close
  END
  IF SELF.Opened
    INIMgr.Update('BrowseVoorraadVIEW',QuickWindow)        ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.Reset PROCEDURE(BYTE Force=0)

  CODE
  FREE(CelVoorraadQ)
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
  			Message('AUB een schermprint maken en naar JMD mailen','Request = ViewRecord',ICON:Hand)
  		END
  		
  IF SELF.Request = ViewRecord
    ReturnValue = RequestCancelled                         ! Always return RequestCancelled if the form was opened in ViewRecord mode
  ELSE
    GlobalRequest = Request
    UpdateViewVoorraad
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
    OF ?Overboeken1
      Get(BRW1.Q,Choice(?Browse:1))
      LOC:ArtikelID = CLIP(BRW1.Q.VVP:ArtikelID)
    OF ?Overboeken2
      Get(BRW2.Q,Choice(?List))
      LOC:ArtikelID = CLIP(BRW2.Q.VVPar:ArtikelID)
      LOC:PartijCelID = CLIP(BRW2.Q.VVPar:PartijCelID)
      !Loc:CelLocatieID= BRW2.Q.VVPar:CelLocatieID
      Loc:CelLocatieID = 0
    OF ?WijzigLocatie
      Get(BRW2.Q,Choice(?List))
      WijzigLocatie(BRW2.Q.VVPar:PartijID, BRW2.Q.VVPar:CelID)
    OF ?VoorraadVerloop:2
      	IF CLIP(BRW9.Q.VVCT:ArtikelID) <> '' THEN
      		BrowseVoorraadVerloopPerArtikelCel(CLIP(BRW9.Q.VVCT:ArtikelID), Loc:CelID2)
      		ThisWindow.Reset(True)
      	ELSE
      		message('Geen voorraad-regel geselecteerd')
      	.
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?VoorraadVerloop
      ThisWindow.Update()
      	IF CLIP(BRW1.Q.VVP:ArtikelID) <> '' THEN
      		BrowseVoorraadVerloop(BRW1.Q.VVP:ArtikelID)
      		ThisWindow.Reset(True)
      	ELSE
      		Message('Geen voorraad-regel geselecteerd')
      	.
    OF ?Overboeken1
      ThisWindow.Update()
      GlobalRequest = InsertRecord
      UpdateOverboeking(LOC:ArtikelID)
      ThisWindow.Reset
    OF ?ExcelButton
      ThisWindow.Update()
      DO ExportExcel
    OF ?VandaagButton
      ThisWindow.Update()
      LOC:PeilDatum = TODAY()
      DISPLAY(?LOC:PeilDatum)
      ThisWindow.Reset(1)
    OF ?LOC:PeilDatum
      ThisWindow.Reset(1)
    OF ?PartijVoorraadVerloop
      ThisWindow.Update()
      	IF CLIP(BRW2.Q.VVPar:ArtikelID) <> '' THEN
      		BrowseVoorraadVerloopPerPartij(CLIP(BRW2.Q.VVPar:ArtikelID), CLIP(BRW2.Q.VVPar:PartijID))
      		ThisWindow.Reset(1)
      	ELSE
      		message('Geen voorraad-regel geselecteerd')
      	.
    OF ?Overboeken2
      ThisWindow.Update()
      GlobalRequest = InsertRecord
      UpdateOverboeking(LOC:ArtikelID, LOC:PartijCelID,Loc:CelLocatieID)
      ThisWindow.Reset
    OF ?ExtraStickers
      ThisWindow.Update()
      ! Planningrecord inlezen
      Get(BRW2.Q, Choice(?List))
      CLEAR(Par:Record)
      Par:PartijID = BRW2.Q.VVPar:PartijID
      IF NOT(Access:Partij.TryFetch(Par:Partij_PK) = Level:Benign)
      	Message('Partij kan niet gevonden worden','Fout',Icon:Hand)
      	CYCLE
      END
      
      aantalpallets# = ReportPalletStickers()
    OF ?WijzigLocatie
      ThisWindow.Update()
      BRW2.ResetQueue(0)
    OF ?ExcelPartij
      ThisWindow.Update()
      DO ExportExcelPartij
    OF ?AACel:CelOms
      BRW3.ResetQueue(true)
      Sort(BRW3.Q,+BRW3.Q.VPCL:CelLocatienaam)
      BRW3.ResetFromView()
    OF ?Export
      ThisWindow.Update()
      ReportVrdCelLocatie(Loc:CelID3, BRW3.Q)
      ThisWindow.Reset
    OF ?Ververs
      ThisWindow.Update()
      !ThisWindow.Reset(1)
      EXECUTE(Choice(?CurrentTab))
          BRW1.ResetQueue(0)
          BRW2.ResetQueue(0)
          BRW9.ResetQueue(0)
          BRW3.ResetQueue(0)
      END
      0{Prop:Text}=Loc:CelID3
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
  CASE FIELD()
  OF ?Browse:1
    CASE EVENT()
    OF EVENT:AlertKey
      if keycode()=MouseLeft2
         IF CLIP(BRW1.Q.VVP:ArtikelID) <> '' THEN
      	   POST(EVENT:Accepted,?View:2)
      	END
      	Cycle
      END
    OF EVENT:PreAlertKey
      if keycode()=MouseLeft2
      	CYCLE
      END
    END
  OF ?List:3
    CASE EVENT()
    OF EVENT:PreAlertKey
      IF KEYCODE()=MouseLeft
          CYCLE
      END
    END
  END
  ReturnValue = PARENT.TakeFieldEvent()
  CASE FIELD()
  OF ?List:3
    CASE EVENT()
    OF EVENT:AlertKey
      IF KEYCODE()=MouseLeft
          Rij#=?List:3{PROPLIST:MouseDownRow}
          IF Rij#=0
              Kolom#=?List:3{PROPLIST:MouseDownField}
              EXECUTE Kolom#-1
                  Sort(BRW3.Q, +BRW3.Q.VPCL:PartijID)
                  Sort(BRW3.Q, +BRW3.Q.VPCL:CelLocatienaam)
                  Sort(BRW3.Q, +BRW3.Q.VVPar:ArtikelID)
                  Sort(BRW3.Q, +BRW3.Q.VVPar:ArtikelOms)
                  Sort(BRW3.Q, +BRW3.Q.VPCL:KG)
                  Sort(BRW3.Q, +BRW3.Q.VPCL:Pallet)
              END
          END
          CYCLE
      END
    END
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
    OF ?LOC:PeilDatum
      ThisWindow.Reset(1)
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
      
      	!NOTIFICATION(NotifyCode#)
      	!IF NotifyCode# = 1
      	!	0{Prop:Active}=TRUE
      	!ELSIF NotifyCode# = 2
      	!	ThisWindow.Reset(True)
      	!.
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

ThisWindow.VulCelVoorraad PROCEDURE(LONG PRM:CelIndex, REAL PRM:KG)

  CODE
  CASE PRM:CelIndex
  OF 0
  	LOC:Cel1KG = PRM:KG
  OF 1
  	LOC:Cel2KG = PRM:KG
  OF 2
  	LOC:Cel3KG = PRM:KG
  OF 3
  	LOC:Cel4KG = PRM:KG
  OF 4
  	LOC:Cel5KG = PRM:KG
  OF 5
  	LOC:Cel6KG = PRM:KG
  OF 6
  	LOC:Cel7KG = PRM:KG
  OF 7
  	LOC:Cel8KG = PRM:KG
  OF 8
  	LOC:Cel9KG = PRM:KG
  OF 9
  	LOC:Cel10KG = PRM:KG
  OF 10
  	LOC:Cel11KG = PRM:KG
  OF 11
  	LOC:Cel12KG = PRM:KG
  OF 12
  	LOC:Cel13KG = PRM:KG
  OF 13
  	LOC:Cel14KG = PRM:KG
  OF 14
  	LOC:Cel15KG = PRM:KG
  END


ThisWindow.GetCelVoorraad PROCEDURE(STRING PRM:ArtikelID, LONG PRM:CelID)

  CODE
  IF RECORDS(CelVoorraadQ) = 0 THEN
  	db.DebugOut('GetCelVoorraad - Begin')
  	CelCounter# = -1
  	CLEAR(AACel:Record)
  	SET(AACel:CEL_PK, AACel:CEL_PK)
  	LOOP UNTIL Access:AACel.Next()
  		IF (CelCounter# = -1 OR CelID# <> AACel:CelID) THEN CelCounter# += 1.
  		db.DebugOut('VulViewVoorraad1 ' & CelCounter#)
  		SELF.VulAViewVoorraadCelTotaal(AACel:CelID, LOC:PeilDatum)
  		!CLEAR(AVVCT:Record)
  		!AVVCT:CelID = AACel:CelID
  		!SET(AVVCT:ViewVoorraadCelTotaal_PK, AVVCT:ViewVoorraadCelTotaal_PK)
  		LOOP UNTIL Access:AViewVoorraadCelTotaal.Next()
  			db.DebugOut('VulViewVoorraad2 ' & CelCounter# & ' - ' & AVVCT:ArtikelID & ' - ' & (AVVCT:KG - AVVCT:VerkoopKG)& ' : ' & AVVCT:KG & ' - ' & AVVCT:VerkoopKG)
  			!IF AVVCT:CelID <> AACel:CelID THEN BREAK.
  			
  			CVQ:ArtikelID = AVVCT:ArtikelID
  			CVQ:CelID = CelCounter#
  			CVQ:KG = (AVVCT:KG - AVVCT:VerkoopKG)
  			ADD(CelVoorraadQ, +CVQ:ArtikelID, +CVQ:CelID)
  		END
  
  		db.DebugOut('VulViewVoorraad3')
  	END
  	
  	CelCounter# += 1
  	
  	! Geen Cel
  	SELF.VulAViewVoorraadCelTotaal(0, LOC:PeilDatum)
  	
  	!CLEAR(AVVCT:Record)
  	!AVVCT:CelID = 0
  	!SET(AVVCT:ViewVoorraadCelTotaal_PK, AVVCT:ViewVoorraadCelTotaal_PK)
  	LOOP UNTIL Access:AViewVoorraadCelTotaal.Next()
  	!LOOP UNTIL Access:AViewVoorraadCelTotaal.Next()
  		!IF AVVCT:CelID <> 0 THEN BREAK.
  		
  		CVQ:ArtikelID = AVVCT:ArtikelID
  		CVQ:CelID = CelCounter#
  		CVQ:KG = (AVVCT:KG - AVVCT:VerkoopKG)
  		ADD(CelVoorraadQ, +CVQ:ArtikelID, +CVQ:CelID)
  	END
  	
  	
  	!FLUSH(AViewVoorraadCelTotaal)
  	db.DebugOut('GetCelVoorraad - End')
  END
  
  CVQ:ArtikelID = PRM:ArtikelID
  CVQ:CelID = PRM:CelID
  GET(CelVoorraadQ, +CVQ:ArtikelID, +CVQ:CelID)
  IF NOT(ERROR()) THEN
  	RETURN CVQ:KG
  ELSE
  	RETURN 0
  END


ThisWindow.VulAViewVoorraadCelTotaal PROCEDURE(LONG PRM:CelID, LONG PRM:Datum)

  CODE
  CLEAR(AVVCT:Record)
  AViewVoorraadCelTotaal{PROP:SQL} = 'SELECT TOP (100) PERCENT dbo.Mutatie.ArtikelID, dbo.Mutatie.CelID, SUM(dbo.Mutatie.InslagKG) AS kg, SUM(dbo.Mutatie.InslagPallet) AS pallets, SUM(dbo.Mutatie.UitslagKG) ' & |
  	'AS VerkoopKG, SUM(dbo.Mutatie.UitslagPallet) AS VerkoopPallet, dbo.ViewArtikel.ArtikelOms FROM dbo.Mutatie INNER JOIN ' & |
  	'dbo.ViewArtikel ON dbo.Mutatie.ArtikelID = dbo.ViewArtikel.ArtikelID LEFT OUTER JOIN ' & |
  	'dbo.Partij ON dbo.Mutatie.PartijID = dbo.Partij.PartijID ' & |
  	'WHERE dbo.Mutatie.CelID = ' & FORMAT(PRM:CelID, @N_7) & ' AND (dbo.Mutatie.DatumTijd is NULL OR dbo.Mutatie.DatumTijd <= ' & CHR(39) & CLIP(FORMAT(LOC:PeilDatum,@d2-)) & ' 23:59' & CHR(39) & ') ' & |
  	'GROUP BY dbo.Mutatie.CelID, dbo.Mutatie.ArtikelID, dbo.ViewArtikel.ArtikelOms ' & |
  	'Having Sum(dbo.Mutatie.InslagKG) > SUM(dbo.Mutatie.UitslagKG) ' & |
  	'ORDER BY dbo.Mutatie.CelID'


ThisWindow.GetPartijVoorraad PROCEDURE(STRING PRM:ArtikelID,Byte PRM:Inkoop)

Partijwaarde                REAL

  CODE
      Partijwaarde = 0
      OPEN(Dummy)
      IF PRM:Inkoop=FALSE
          Loc:SQL='SELECT TOP (100) PERCENT  '&|
              '(SUM(dbo.Mutatie.InslagKG)  - SUM(dbo.Mutatie.UitslagKG) )* AVG(dbo.Partij.[BerekendeInkoopKGPrijs])  '&|        
              ' FROM dbo.Mutatie INNER JOIN ' & |
              'dbo.ViewArtikel ON dbo.Mutatie.ArtikelID = dbo.ViewArtikel.ArtikelID LEFT OUTER JOIN ' & |
              'dbo.Partij ON dbo.Mutatie.PartijID = dbo.Partij.PartijID ' & |
              'WHERE dbo.Mutatie.DatumTijd <= ' & CHR(39) & CLIP(FORMAT(LOC:PeilDatum,@d2-)) & ' 23:59' & CHR(39) & ' ' & |
              ' AND dbo.Mutatie.ArtikelID = <39>'&PRM:ArtikelID&'<39> '&|
              'GROUP BY dbo.Mutatie.PartijID, dbo.Partij.ExternPartijnr, dbo.Mutatie.ArtikelID, dbo.ViewArtikel.ArtikelOms ' & |
              'HAVING SUM(Mutatie.InslagKG) > SUM(Mutatie.UitslagKG) ' & |      
              'ORDER BY dbo.Mutatie.PartijID'
      ELSE
          Loc:SQL='SELECT TOP (100) PERCENT  '&|
              '(SUM(dbo.Mutatie.InslagKG)  - SUM(dbo.Mutatie.UitslagKG) )* AVG(dbo.Partij.[InkoopKGPrijs])  '&|        
              ' FROM dbo.Mutatie INNER JOIN ' & |
              'dbo.ViewArtikel ON dbo.Mutatie.ArtikelID = dbo.ViewArtikel.ArtikelID LEFT OUTER JOIN ' & |
              'dbo.Partij ON dbo.Mutatie.PartijID = dbo.Partij.PartijID ' & |
              'WHERE dbo.Mutatie.DatumTijd <= ' & CHR(39) & CLIP(FORMAT(LOC:PeilDatum,@d2-)) & ' 23:59' & CHR(39) & ' ' & |
              ' AND dbo.Mutatie.ArtikelID = <39>'&PRM:ArtikelID&'<39> '&|
              'GROUP BY dbo.Mutatie.PartijID, dbo.Partij.ExternPartijnr, dbo.Mutatie.ArtikelID, dbo.ViewArtikel.ArtikelOms ' & |
              'HAVING SUM(Mutatie.InslagKG) > SUM(Mutatie.UitslagKG) ' & |      
              'ORDER BY dbo.Mutatie.PartijID'
      END
      Dummy{Prop:SQL}=Loc:SQL
      Loop 
          Next(Dummy)
              !if error()  then stop(Error()&' '&FIleError()).
          IF ERROR() THEN BREAK.
          Partijwaarde = Partijwaarde + DUM:Response
          db.Debugout('Partijwaarde voor '&PRM:ArtikelID& ' '&Partijwaarde&' '&DUM:Response)
      END    
      CLOSE(Dummy)
      db.Debugout('Partijwaarde voor '&PRM:ArtikelID& ' '&Partijwaarde)
      RETURN Partijwaarde



BRW1.Fetch PROCEDURE(BYTE Direction)

GreenBarIndex   LONG,AUTO
  CODE
  PARENT.Fetch(Direction)
  !----------------------------------------------------------------------
    LOOP GreenBarIndex=1 TO RECORDS(SELF.Q)
      GET(SELF.Q,GreenBarIndex)
      SELF.Q.VVP:ArtikelID_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for VVP:ArtikelID
      SELF.Q.VVP:ArtikelID_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.VVP:ArtikelID_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.VVP:ArtikelID_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.VVP:ArtikelOms_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for VVP:ArtikelOms
      SELF.Q.VVP:ArtikelOms_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.VVP:ArtikelOms_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.VVP:ArtikelOms_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Loc:TotaalKG_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for Loc:TotaalKG
      SELF.Q.Loc:TotaalKG_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.Loc:TotaalKG_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Loc:TotaalKG_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.VVP:InkoopKG_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for VVP:InkoopKG
      SELF.Q.VVP:InkoopKG_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.VVP:InkoopKG_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.VVP:InkoopKG_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.VVP:VerkoopKG_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for VVP:VerkoopKG
      SELF.Q.VVP:VerkoopKG_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.VVP:VerkoopKG_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.VVP:VerkoopKG_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.LOC:Cel1KG_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for LOC:Cel1KG
      SELF.Q.LOC:Cel1KG_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.LOC:Cel1KG_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.LOC:Cel1KG_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.LOC:Cel2KG_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for LOC:Cel2KG
      SELF.Q.LOC:Cel2KG_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.LOC:Cel2KG_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.LOC:Cel2KG_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.LOC:Cel3KG_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for LOC:Cel3KG
      SELF.Q.LOC:Cel3KG_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.LOC:Cel3KG_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.LOC:Cel3KG_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.LOC:Cel4KG_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for LOC:Cel4KG
      SELF.Q.LOC:Cel4KG_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.LOC:Cel4KG_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.LOC:Cel4KG_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.LOC:Cel5KG_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for LOC:Cel5KG
      SELF.Q.LOC:Cel5KG_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.LOC:Cel5KG_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.LOC:Cel5KG_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.LOC:Cel6KG_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for LOC:Cel6KG
      SELF.Q.LOC:Cel6KG_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.LOC:Cel6KG_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.LOC:Cel6KG_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.LOC:Cel7KG_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for LOC:Cel7KG
      SELF.Q.LOC:Cel7KG_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.LOC:Cel7KG_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.LOC:Cel7KG_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.LOC:Cel8KG_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for LOC:Cel8KG
      SELF.Q.LOC:Cel8KG_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.LOC:Cel8KG_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.LOC:Cel8KG_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.LOC:Cel9KG_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for LOC:Cel9KG
      SELF.Q.LOC:Cel9KG_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.LOC:Cel9KG_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.LOC:Cel9KG_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.LOC:Cel10KG_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for LOC:Cel10KG
      SELF.Q.LOC:Cel10KG_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.LOC:Cel10KG_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.LOC:Cel10KG_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.LOC:Cel11KG_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for LOC:Cel11KG
      SELF.Q.LOC:Cel11KG_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.LOC:Cel11KG_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.LOC:Cel11KG_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.LOC:Cel12KG_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for LOC:Cel12KG
      SELF.Q.LOC:Cel12KG_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.LOC:Cel12KG_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.LOC:Cel12KG_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.LOC:Cel13KG_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for LOC:Cel13KG
      SELF.Q.LOC:Cel13KG_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.LOC:Cel13KG_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.LOC:Cel13KG_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.LOC:Cel14KG_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for LOC:Cel14KG
      SELF.Q.LOC:Cel14KG_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.LOC:Cel14KG_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.LOC:Cel14KG_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.LOC:Cel15KG_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for LOC:Cel15KG
      SELF.Q.LOC:Cel15KG_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.LOC:Cel15KG_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.LOC:Cel15KG_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      PUT(SELF.Q)
    END
  !----------------------------------------------------------------------


BRW1.Init PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)

  CODE
  PARENT.Init(ListBox,Posit,V,Q,RM,WM)
  IF WM.Request <> ViewRecord                              ! If called for anything other than ViewMode, make the insert, change & delete controls available
    SELF.InsertControl=?Insert
    SELF.ChangeControl=?Change
    SELF.DeleteControl=?Delete
  END
  SELF.ViewControl = ?View:2                               ! Setup the control used to initiate view only mode


BRW1.ResetQueue PROCEDURE(BYTE ResetMode)

  CODE
      CLEAR(AACel:Record)
  	SET(AACel:CEL_PK,AACel:CEL_PK)
  	LOOP
  		Access:AACel.TryNext()
  		IF ERROR() THEN BREAK.
  		
  		CASE counter#
  			OF 0
  				index# = INSTRING('*1',?Browse:1{Prop:Format},1,1)
  			OF 1
  				index# = INSTRING('*2',?Browse:1{Prop:Format},1,1)
  			OF 2
  				index# = INSTRING('*3',?Browse:1{Prop:Format},1,1)
  			OF 3
  				index# = INSTRING('*4',?Browse:1{Prop:Format},1,1)
  			OF 4
  				index# = INSTRING('*5',?Browse:1{Prop:Format},1,1)
  			OF 5
  				index# = INSTRING('*6',?Browse:1{Prop:Format},1,1)
  			OF 6
  				index# = INSTRING('*7',?Browse:1{Prop:Format},1,1)
  			OF 7
  				index# = INSTRING('*8',?Browse:1{Prop:Format},1,1)
  			OF 8
  				index# = INSTRING('*9',?Browse:1{Prop:Format},1,1)
  			OF 9
  			 	index# = INSTRING('*A',?Browse:1{Prop:Format},1,1)
  			OF 10
  			 	index# = INSTRING('*B',?Browse:1{Prop:Format},1,1)
  			OF 11
  			 	index# = INSTRING('*C',?Browse:1{Prop:Format},1,1)
  			OF 12
  			 	index# = INSTRING('*D',?Browse:1{Prop:Format},1,1)
  			OF 13
  			 	index# = INSTRING('*E',?Browse:1{Prop:Format},1,1)
  			OF 14
  			 	index# = INSTRING('*F',?Browse:1{Prop:Format},1,1)
  		.
  		
  		IF index# > 0
  			LOC:TempFormat = SUB(?Browse:1{Prop:Format}, 1, index# - 1) & CLIP(AACel:CelOms) & SUB(?Browse:1{Prop:Format}, index# + 2, 1000)
  			?Browse:1{Prop:Format} = CLIP(LOC:TempFormat)
  		.
  		
  		counter# += 1
  	.
  
  	! Geen cel geselecteerd kolom
  	CASE counter#
  		OF 0
  			index# = INSTRING('*1',?Browse:1{Prop:Format},1,1)
  		OF 1
  			index# = INSTRING('*2',?Browse:1{Prop:Format},1,1)
  		OF 2
  			index# = INSTRING('*3',?Browse:1{Prop:Format},1,1)
  		OF 3
  			index# = INSTRING('*4',?Browse:1{Prop:Format},1,1)
  		OF 4
  			index# = INSTRING('*5',?Browse:1{Prop:Format},1,1)
  		OF 5
  			index# = INSTRING('*6',?Browse:1{Prop:Format},1,1)
  		OF 6
  			index# = INSTRING('*7',?Browse:1{Prop:Format},1,1)
  		OF 7
  			index# = INSTRING('*8',?Browse:1{Prop:Format},1,1)
  		OF 8
  			index# = INSTRING('*9',?Browse:1{Prop:Format},1,1)
  		OF 9
  			index# = INSTRING('*A',?Browse:1{Prop:Format},1,1)
  		OF 10
  			index# = INSTRING('*B',?Browse:1{Prop:Format},1,1)
  		OF 11
  			index# = INSTRING('*C',?Browse:1{Prop:Format},1,1)
  		OF 12
  			index# = INSTRING('*D',?Browse:1{Prop:Format},1,1)
  		OF 13
  			index# = INSTRING('*E',?Browse:1{Prop:Format},1,1)
  		OF 14
  			index# = INSTRING('*F',?Browse:1{Prop:Format},1,1)
  	.
  	
  	IF index# > 0 THEN
  		LOC:TempFormat = SUB(?Browse:1{Prop:Format}, 1, index# - 1) & 'Geen Cel' & SUB(?Browse:1{Prop:Format}, index# + 2, 1000)
  		?Browse:1{Prop:Format} = CLIP(LOC:TempFormat)
  	.
  	counter# += 1
  
  	! Rest op leeg zetten
  	LOOP UNTIL (counter# >= 15)	! hg 22-11-2010 Hier stond =10 maar bij meer dan 10 cellen hangt het systeem
  		CASE counter#
  			OF 0
  				index# = INSTRING('*1',?Browse:1{Prop:Format},1,1)
  			OF 1
  				index# = INSTRING('*2',?Browse:1{Prop:Format},1,1)
  			OF 2
  				index# = INSTRING('*3',?Browse:1{Prop:Format},1,1)
  			OF 3
  				index# = INSTRING('*4',?Browse:1{Prop:Format},1,1)
  			OF 4
  				index# = INSTRING('*5',?Browse:1{Prop:Format},1,1)
  			OF 5
  				index# = INSTRING('*6',?Browse:1{Prop:Format},1,1)
  			OF 6
  				index# = INSTRING('*7',?Browse:1{Prop:Format},1,1)
  			OF 7
  				index# = INSTRING('*8',?Browse:1{Prop:Format},1,1)
  			OF 8
  				index# = INSTRING('*9',?Browse:1{Prop:Format},1,1)
  			OF 9
  				index# = INSTRING('*A',?Browse:1{Prop:Format},1,1)
  			OF 10
  			 	index# = INSTRING('*B',?Browse:1{Prop:Format},1,1)
  			OF 11
  			 	index# = INSTRING('*C',?Browse:1{Prop:Format},1,1)
  			OF 12
  			 	index# = INSTRING('*D',?Browse:1{Prop:Format},1,1)
  			OF 13
  			 	index# = INSTRING('*E',?Browse:1{Prop:Format},1,1)
  			OF 14
  			 	index# = INSTRING('*F',?Browse:1{Prop:Format},1,1)
  		.
  		
  		IF index# > 0 THEN
  			LOC:TempFormat = SUB(?Browse:1{Prop:Format}, 1, index# - 1) & '' & SUB(?Browse:1{Prop:Format}, index# + 2, 1000)
  			?Browse:1{Prop:Format} = CLIP(LOC:TempFormat)
  		.
  		
  		counter# += 1
  	.
  PARENT.ResetQueue(ResetMode)


BRW1.SetAlerts PROCEDURE

  CODE
  SELF.EditViaPopup = False
  PARENT.SetAlerts


BRW1.SetQueueRecord PROCEDURE

  CODE
  LOOP CelPointer# = 0 TO 14
  	ThisWindow.VulCelVoorraad(CelPointer#, ThisWindow.GetCelVoorraad(VVP:ArtikelID, CelPointer#))
  END
  
  Loc:TotaalKG = LOC:Cel1KG + LOC:Cel2KG + LOC:Cel3KG + LOC:Cel4KG + LOC:Cel5KG + LOC:Cel6KG + LOC:Cel7KG + LOC:Cel8KG + LOC:Cel9KG + LOC:Cel10KG + LOC:Cel11KG + LOC:Cel12KG + LOC:Cel13KG + LOC:Cel14KG + LOC:Cel15KG
  !Loc:TotaalKG = VVP:InslagKG - VVP:UitslagKG
  !Loc:TotaalPallets = VVP:InslagPallets - VVP:UitslagPallets
  	
  
  PARENT.SetQueueRecord
  
  !----------------------------------------------------------------------
      SELF.Q.VVP:ArtikelID_NormalFG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1) ! Set color values for VVP:ArtikelID
      SELF.Q.VVP:ArtikelID_NormalBG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,8454143)
      SELF.Q.VVP:ArtikelID_SelectedFG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.VVP:ArtikelID_SelectedBG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.VVP:ArtikelOms_NormalFG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1) ! Set color values for VVP:ArtikelOms
      SELF.Q.VVP:ArtikelOms_NormalBG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,8454143)
      SELF.Q.VVP:ArtikelOms_SelectedFG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.VVP:ArtikelOms_SelectedBG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.Loc:TotaalKG_NormalFG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1) ! Set color values for Loc:TotaalKG
      SELF.Q.Loc:TotaalKG_NormalBG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,8454143)
      SELF.Q.Loc:TotaalKG_SelectedFG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.Loc:TotaalKG_SelectedBG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.VVP:InkoopKG_NormalFG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1) ! Set color values for VVP:InkoopKG
      SELF.Q.VVP:InkoopKG_NormalBG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,8454143)
      SELF.Q.VVP:InkoopKG_SelectedFG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.VVP:InkoopKG_SelectedBG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.VVP:VerkoopKG_NormalFG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1) ! Set color values for VVP:VerkoopKG
      SELF.Q.VVP:VerkoopKG_NormalBG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,8454143)
      SELF.Q.VVP:VerkoopKG_SelectedFG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.VVP:VerkoopKG_SelectedBG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.LOC:Cel1KG_NormalFG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1) ! Set color values for LOC:Cel1KG
      SELF.Q.LOC:Cel1KG_NormalBG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,8454143)
      SELF.Q.LOC:Cel1KG_SelectedFG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.LOC:Cel1KG_SelectedBG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.LOC:Cel2KG_NormalFG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1) ! Set color values for LOC:Cel2KG
      SELF.Q.LOC:Cel2KG_NormalBG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,8454143)
      SELF.Q.LOC:Cel2KG_SelectedFG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.LOC:Cel2KG_SelectedBG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.LOC:Cel3KG_NormalFG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1) ! Set color values for LOC:Cel3KG
      SELF.Q.LOC:Cel3KG_NormalBG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,8454143)
      SELF.Q.LOC:Cel3KG_SelectedFG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.LOC:Cel3KG_SelectedBG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.LOC:Cel4KG_NormalFG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1) ! Set color values for LOC:Cel4KG
      SELF.Q.LOC:Cel4KG_NormalBG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,8454143)
      SELF.Q.LOC:Cel4KG_SelectedFG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.LOC:Cel4KG_SelectedBG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.LOC:Cel5KG_NormalFG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1) ! Set color values for LOC:Cel5KG
      SELF.Q.LOC:Cel5KG_NormalBG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,8454143)
      SELF.Q.LOC:Cel5KG_SelectedFG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.LOC:Cel5KG_SelectedBG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.LOC:Cel6KG_NormalFG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1) ! Set color values for LOC:Cel6KG
      SELF.Q.LOC:Cel6KG_NormalBG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,8454143)
      SELF.Q.LOC:Cel6KG_SelectedFG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.LOC:Cel6KG_SelectedBG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.LOC:Cel7KG_NormalFG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1) ! Set color values for LOC:Cel7KG
      SELF.Q.LOC:Cel7KG_NormalBG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,8454143)
      SELF.Q.LOC:Cel7KG_SelectedFG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.LOC:Cel7KG_SelectedBG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.LOC:Cel8KG_NormalFG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1) ! Set color values for LOC:Cel8KG
      SELF.Q.LOC:Cel8KG_NormalBG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,8454143)
      SELF.Q.LOC:Cel8KG_SelectedFG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.LOC:Cel8KG_SelectedBG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.LOC:Cel9KG_NormalFG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1) ! Set color values for LOC:Cel9KG
      SELF.Q.LOC:Cel9KG_NormalBG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,8454143)
      SELF.Q.LOC:Cel9KG_SelectedFG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.LOC:Cel9KG_SelectedBG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.LOC:Cel10KG_NormalFG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1) ! Set color values for LOC:Cel10KG
      SELF.Q.LOC:Cel10KG_NormalBG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,8454143)
      SELF.Q.LOC:Cel10KG_SelectedFG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.LOC:Cel10KG_SelectedBG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.LOC:Cel11KG_NormalFG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1) ! Set color values for LOC:Cel11KG
      SELF.Q.LOC:Cel11KG_NormalBG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,8454143)
      SELF.Q.LOC:Cel11KG_SelectedFG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.LOC:Cel11KG_SelectedBG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.LOC:Cel12KG_NormalFG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1) ! Set color values for LOC:Cel12KG
      SELF.Q.LOC:Cel12KG_NormalBG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,8454143)
      SELF.Q.LOC:Cel12KG_SelectedFG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.LOC:Cel12KG_SelectedBG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.LOC:Cel13KG_NormalFG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1) ! Set color values for LOC:Cel13KG
      SELF.Q.LOC:Cel13KG_NormalBG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,8454143)
      SELF.Q.LOC:Cel13KG_SelectedFG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.LOC:Cel13KG_SelectedBG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.LOC:Cel14KG_NormalFG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1) ! Set color values for LOC:Cel14KG
      SELF.Q.LOC:Cel14KG_NormalBG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,8454143)
      SELF.Q.LOC:Cel14KG_SelectedFG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.LOC:Cel14KG_SelectedBG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.LOC:Cel15KG_NormalFG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1) ! Set color values for LOC:Cel15KG
      SELF.Q.LOC:Cel15KG_NormalBG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,8454143)
      SELF.Q.LOC:Cel15KG_SelectedFG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.LOC:Cel15KG_SelectedBG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
  !----------------------------------------------------------------------


BRW9.Fetch PROCEDURE(BYTE Direction)

GreenBarIndex   LONG,AUTO
  CODE
  PARENT.Fetch(Direction)
  !----------------------------------------------------------------------
    LOOP GreenBarIndex=1 TO RECORDS(SELF.Q)
      GET(SELF.Q,GreenBarIndex)
      SELF.Q.VVCT:ArtikelID_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for VVCT:ArtikelID
      SELF.Q.VVCT:ArtikelID_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.VVCT:ArtikelID_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.VVCT:ArtikelID_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.VVCT:ArtikelOms_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for VVCT:ArtikelOms
      SELF.Q.VVCT:ArtikelOms_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.VVCT:ArtikelOms_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.VVCT:ArtikelOms_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.VVCT:kg_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for VVCT:kg
      SELF.Q.VVCT:kg_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.VVCT:kg_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.VVCT:kg_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.VVCT:VerkoopKG_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for VVCT:VerkoopKG
      SELF.Q.VVCT:VerkoopKG_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.VVCT:VerkoopKG_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.VVCT:VerkoopKG_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.LOC:VVCTVoorraadKG_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for LOC:VVCTVoorraadKG
      SELF.Q.LOC:VVCTVoorraadKG_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.LOC:VVCTVoorraadKG_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.LOC:VVCTVoorraadKG_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.VVCT:pallets_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for VVCT:pallets
      SELF.Q.VVCT:pallets_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.VVCT:pallets_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.VVCT:pallets_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.VVCT:VerkoopPallet_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for VVCT:VerkoopPallet
      SELF.Q.VVCT:VerkoopPallet_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.VVCT:VerkoopPallet_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.VVCT:VerkoopPallet_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.LOC:VVCTVoorraadPallets_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for LOC:VVCTVoorraadPallets
      SELF.Q.LOC:VVCTVoorraadPallets_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.LOC:VVCTVoorraadPallets_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.LOC:VVCTVoorraadPallets_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      PUT(SELF.Q)
    END
  !----------------------------------------------------------------------


BRW9.ResetFromView PROCEDURE

LOC:TotaalVoorraad:Sum REAL                                ! Sum variable for browse totals
  CODE
  SETCURSOR(Cursor:Wait)
  Relate:ViewVoorraadCelTotaal.SetQuickScan(1)
  SELF.Reset
  IF SELF.UseMRP
     IF SELF.View{PROP:IPRequestCount} = 0
          SELF.View{PROP:IPRequestCount} = 60
     END
  END
  LOOP
    IF SELF.UseMRP
       IF SELF.View{PROP:IPRequestCount} = 0
            SELF.View{PROP:IPRequestCount} = 60
       END
    END
    CASE SELF.Next()
    OF Level:Notify
      BREAK
    OF Level:Fatal
      SETCURSOR()
      RETURN
    END
    SELF.SetQueueRecord
    LOC:TotaalVoorraad:Sum += LOC:VVCTVoorraadKG
  END
  SELF.View{PROP:IPRequestCount} = 0
  LOC:TotaalVoorraad = LOC:TotaalVoorraad:Sum
  PARENT.ResetFromView
  Relate:ViewVoorraadCelTotaal.SetQuickScan(0)
  SETCURSOR()


BRW9.SetQueueRecord PROCEDURE

  CODE
  LOC:VVCTVoorraadKG=VVCT:kg-VVCT:VerkoopKG
  LOC:VVCTVoorraadPallets=VVCT:pallets-VVCT:VerkoopPallet
  PARENT.SetQueueRecord
  
  !----------------------------------------------------------------------
      SELF.Q.VVCT:ArtikelID_NormalFG   = CHOOSE(CHOICE(?List:2) % 2,-1,-1) ! Set color values for VVCT:ArtikelID
      SELF.Q.VVCT:ArtikelID_NormalBG   = CHOOSE(CHOICE(?List:2) % 2,-1,8454143)
      SELF.Q.VVCT:ArtikelID_SelectedFG = CHOOSE(CHOICE(?List:2) % 2,-1,-1)
      SELF.Q.VVCT:ArtikelID_SelectedBG = CHOOSE(CHOICE(?List:2) % 2,-1,-1)
      SELF.Q.VVCT:ArtikelOms_NormalFG   = CHOOSE(CHOICE(?List:2) % 2,-1,-1) ! Set color values for VVCT:ArtikelOms
      SELF.Q.VVCT:ArtikelOms_NormalBG   = CHOOSE(CHOICE(?List:2) % 2,-1,8454143)
      SELF.Q.VVCT:ArtikelOms_SelectedFG = CHOOSE(CHOICE(?List:2) % 2,-1,-1)
      SELF.Q.VVCT:ArtikelOms_SelectedBG = CHOOSE(CHOICE(?List:2) % 2,-1,-1)
      SELF.Q.VVCT:kg_NormalFG   = CHOOSE(CHOICE(?List:2) % 2,-1,-1) ! Set color values for VVCT:kg
      SELF.Q.VVCT:kg_NormalBG   = CHOOSE(CHOICE(?List:2) % 2,-1,8454143)
      SELF.Q.VVCT:kg_SelectedFG = CHOOSE(CHOICE(?List:2) % 2,-1,-1)
      SELF.Q.VVCT:kg_SelectedBG = CHOOSE(CHOICE(?List:2) % 2,-1,-1)
      SELF.Q.VVCT:VerkoopKG_NormalFG   = CHOOSE(CHOICE(?List:2) % 2,-1,-1) ! Set color values for VVCT:VerkoopKG
      SELF.Q.VVCT:VerkoopKG_NormalBG   = CHOOSE(CHOICE(?List:2) % 2,-1,8454143)
      SELF.Q.VVCT:VerkoopKG_SelectedFG = CHOOSE(CHOICE(?List:2) % 2,-1,-1)
      SELF.Q.VVCT:VerkoopKG_SelectedBG = CHOOSE(CHOICE(?List:2) % 2,-1,-1)
      SELF.Q.LOC:VVCTVoorraadKG_NormalFG   = CHOOSE(CHOICE(?List:2) % 2,-1,-1) ! Set color values for LOC:VVCTVoorraadKG
      SELF.Q.LOC:VVCTVoorraadKG_NormalBG   = CHOOSE(CHOICE(?List:2) % 2,-1,8454143)
      SELF.Q.LOC:VVCTVoorraadKG_SelectedFG = CHOOSE(CHOICE(?List:2) % 2,-1,-1)
      SELF.Q.LOC:VVCTVoorraadKG_SelectedBG = CHOOSE(CHOICE(?List:2) % 2,-1,-1)
      SELF.Q.VVCT:pallets_NormalFG   = CHOOSE(CHOICE(?List:2) % 2,-1,-1) ! Set color values for VVCT:pallets
      SELF.Q.VVCT:pallets_NormalBG   = CHOOSE(CHOICE(?List:2) % 2,-1,8454143)
      SELF.Q.VVCT:pallets_SelectedFG = CHOOSE(CHOICE(?List:2) % 2,-1,-1)
      SELF.Q.VVCT:pallets_SelectedBG = CHOOSE(CHOICE(?List:2) % 2,-1,-1)
      SELF.Q.VVCT:VerkoopPallet_NormalFG   = CHOOSE(CHOICE(?List:2) % 2,-1,-1) ! Set color values for VVCT:VerkoopPallet
      SELF.Q.VVCT:VerkoopPallet_NormalBG   = CHOOSE(CHOICE(?List:2) % 2,-1,8454143)
      SELF.Q.VVCT:VerkoopPallet_SelectedFG = CHOOSE(CHOICE(?List:2) % 2,-1,-1)
      SELF.Q.VVCT:VerkoopPallet_SelectedBG = CHOOSE(CHOICE(?List:2) % 2,-1,-1)
      SELF.Q.LOC:VVCTVoorraadPallets_NormalFG   = CHOOSE(CHOICE(?List:2) % 2,-1,-1) ! Set color values for LOC:VVCTVoorraadPallets
      SELF.Q.LOC:VVCTVoorraadPallets_NormalBG   = CHOOSE(CHOICE(?List:2) % 2,-1,8454143)
      SELF.Q.LOC:VVCTVoorraadPallets_SelectedFG = CHOOSE(CHOICE(?List:2) % 2,-1,-1)
      SELF.Q.LOC:VVCTVoorraadPallets_SelectedBG = CHOOSE(CHOICE(?List:2) % 2,-1,-1)
  !----------------------------------------------------------------------


BRW9.ValidateRecord PROCEDURE

ReturnValue          BYTE,AUTO

BRW9::RecordStatus   BYTE,AUTO
  CODE
  IF Loc:LegeVoorraadVerbergen=TRUE AND VVCT:kg-VVCT:VerkoopKG=0
  	Return Record:Filtered
  END
  ReturnValue = PARENT.ValidateRecord()
  BRW9::RecordStatus=ReturnValue
  RETURN ReturnValue


BRW2.Fetch PROCEDURE(BYTE Direction)

GreenBarIndex   LONG,AUTO
  CODE
  PARENT.Fetch(Direction)
  !----------------------------------------------------------------------
    LOOP GreenBarIndex=1 TO RECORDS(SELF.Q)
      GET(SELF.Q,GreenBarIndex)
      SELF.Q.VVPar:ArtikelID_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for VVPar:ArtikelID
      SELF.Q.VVPar:ArtikelID_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.VVPar:ArtikelID_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.VVPar:ArtikelID_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.AArt:ArtikelOms_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for AArt:ArtikelOms
      SELF.Q.AArt:ArtikelOms_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.AArt:ArtikelOms_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.AArt:ArtikelOms_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.VVPar:PartijID_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for VVPar:PartijID
      SELF.Q.VVPar:PartijID_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.VVPar:PartijID_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.VVPar:PartijID_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.VVPar:ExternPartijnr_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for VVPar:ExternPartijnr
      SELF.Q.VVPar:ExternPartijnr_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.VVPar:ExternPartijnr_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.VVPar:ExternPartijnr_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.VVParT:VoorraadKG_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for VVParT:VoorraadKG
      SELF.Q.VVParT:VoorraadKG_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.VVParT:VoorraadKG_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.VVParT:VoorraadKG_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.VVPar:CelOms_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for VVPar:CelOms
      SELF.Q.VVPar:CelOms_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.VVPar:CelOms_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.VVPar:CelOms_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.LOC:CelLocatieNamen_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for LOC:CelLocatieNamen
      SELF.Q.LOC:CelLocatieNamen_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.LOC:CelLocatieNamen_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.LOC:CelLocatieNamen_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.VVPar:VoorraadKG_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for VVPar:VoorraadKG
      SELF.Q.VVPar:VoorraadKG_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.VVPar:VoorraadKG_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.VVPar:VoorraadKG_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.VVPar:VerpakkingOmschrijving_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for VVPar:VerpakkingOmschrijving
      SELF.Q.VVPar:VerpakkingOmschrijving_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.VVPar:VerpakkingOmschrijving_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.VVPar:VerpakkingOmschrijving_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.VVPar:LeverancierFirmanaam_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for VVPar:LeverancierFirmanaam
      SELF.Q.VVPar:LeverancierFirmanaam_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.VVPar:LeverancierFirmanaam_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.VVPar:LeverancierFirmanaam_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.VVPar:AanmaakDatum_DATE_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for VVPar:AanmaakDatum_DATE
      SELF.Q.VVPar:AanmaakDatum_DATE_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.VVPar:AanmaakDatum_DATE_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.VVPar:AanmaakDatum_DATE_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      PUT(SELF.Q)
    END
  !----------------------------------------------------------------------


BRW2.ResetSort PROCEDURE(BYTE Force)

ReturnValue          BYTE,AUTO

  CODE
  IF CLIP(LOC:PartijVoorraadSortering) = CLIP('Op extern partijnr.')
    RETURN SELF.SetSort(1,Force)
  ELSIF CLIP(LOC:PartijVoorraadSortering) = CLIP('Op intern partijnr.')
    RETURN SELF.SetSort(2,Force)
  ELSIF CLIP(LOC:PartijVoorraadSortering) = CLIP('Aanmaakdatum')
    RETURN SELF.SetSort(3,Force)
  ELSE
    RETURN SELF.SetSort(4,Force)
  END
  ReturnValue = PARENT.ResetSort(Force)
  RETURN ReturnValue


BRW2.SetQueueRecord PROCEDURE

  CODE
  LOC:CelLocatieNamen = CachingClass.GetCelLocatieNaam(VVPar:PartijID, VVPar:CelID)
  PARENT.SetQueueRecord
  
  !----------------------------------------------------------------------
      SELF.Q.VVPar:ArtikelID_NormalFG   = CHOOSE(CHOICE(?List) % 2,-1,-1) ! Set color values for VVPar:ArtikelID
      SELF.Q.VVPar:ArtikelID_NormalBG   = CHOOSE(CHOICE(?List) % 2,-1,8454143)
      SELF.Q.VVPar:ArtikelID_SelectedFG = CHOOSE(CHOICE(?List) % 2,-1,-1)
      SELF.Q.VVPar:ArtikelID_SelectedBG = CHOOSE(CHOICE(?List) % 2,-1,-1)
      SELF.Q.AArt:ArtikelOms_NormalFG   = CHOOSE(CHOICE(?List) % 2,-1,-1) ! Set color values for AArt:ArtikelOms
      SELF.Q.AArt:ArtikelOms_NormalBG   = CHOOSE(CHOICE(?List) % 2,-1,8454143)
      SELF.Q.AArt:ArtikelOms_SelectedFG = CHOOSE(CHOICE(?List) % 2,-1,-1)
      SELF.Q.AArt:ArtikelOms_SelectedBG = CHOOSE(CHOICE(?List) % 2,-1,-1)
      SELF.Q.VVPar:PartijID_NormalFG   = CHOOSE(CHOICE(?List) % 2,-1,-1) ! Set color values for VVPar:PartijID
      SELF.Q.VVPar:PartijID_NormalBG   = CHOOSE(CHOICE(?List) % 2,-1,8454143)
      SELF.Q.VVPar:PartijID_SelectedFG = CHOOSE(CHOICE(?List) % 2,-1,-1)
      SELF.Q.VVPar:PartijID_SelectedBG = CHOOSE(CHOICE(?List) % 2,-1,-1)
      SELF.Q.VVPar:ExternPartijnr_NormalFG   = CHOOSE(CHOICE(?List) % 2,-1,-1) ! Set color values for VVPar:ExternPartijnr
      SELF.Q.VVPar:ExternPartijnr_NormalBG   = CHOOSE(CHOICE(?List) % 2,-1,8454143)
      SELF.Q.VVPar:ExternPartijnr_SelectedFG = CHOOSE(CHOICE(?List) % 2,-1,-1)
      SELF.Q.VVPar:ExternPartijnr_SelectedBG = CHOOSE(CHOICE(?List) % 2,-1,-1)
      SELF.Q.VVParT:VoorraadKG_NormalFG   = CHOOSE(CHOICE(?List) % 2,-1,-1) ! Set color values for VVParT:VoorraadKG
      SELF.Q.VVParT:VoorraadKG_NormalBG   = CHOOSE(CHOICE(?List) % 2,-1,8454143)
      SELF.Q.VVParT:VoorraadKG_SelectedFG = CHOOSE(CHOICE(?List) % 2,-1,-1)
      SELF.Q.VVParT:VoorraadKG_SelectedBG = CHOOSE(CHOICE(?List) % 2,-1,-1)
      SELF.Q.VVPar:CelOms_NormalFG   = CHOOSE(CHOICE(?List) % 2,-1,-1) ! Set color values for VVPar:CelOms
      SELF.Q.VVPar:CelOms_NormalBG   = CHOOSE(CHOICE(?List) % 2,-1,8454143)
      SELF.Q.VVPar:CelOms_SelectedFG = CHOOSE(CHOICE(?List) % 2,-1,-1)
      SELF.Q.VVPar:CelOms_SelectedBG = CHOOSE(CHOICE(?List) % 2,-1,-1)
      SELF.Q.LOC:CelLocatieNamen_NormalFG   = CHOOSE(CHOICE(?List) % 2,-1,-1) ! Set color values for LOC:CelLocatieNamen
      SELF.Q.LOC:CelLocatieNamen_NormalBG   = CHOOSE(CHOICE(?List) % 2,-1,8454143)
      SELF.Q.LOC:CelLocatieNamen_SelectedFG = CHOOSE(CHOICE(?List) % 2,-1,-1)
      SELF.Q.LOC:CelLocatieNamen_SelectedBG = CHOOSE(CHOICE(?List) % 2,-1,-1)
      SELF.Q.VVPar:VoorraadKG_NormalFG   = CHOOSE(CHOICE(?List) % 2,-1,-1) ! Set color values for VVPar:VoorraadKG
      SELF.Q.VVPar:VoorraadKG_NormalBG   = CHOOSE(CHOICE(?List) % 2,-1,8454143)
      SELF.Q.VVPar:VoorraadKG_SelectedFG = CHOOSE(CHOICE(?List) % 2,-1,-1)
      SELF.Q.VVPar:VoorraadKG_SelectedBG = CHOOSE(CHOICE(?List) % 2,-1,-1)
      SELF.Q.VVPar:VerpakkingOmschrijving_NormalFG   = CHOOSE(CHOICE(?List) % 2,-1,-1) ! Set color values for VVPar:VerpakkingOmschrijving
      SELF.Q.VVPar:VerpakkingOmschrijving_NormalBG   = CHOOSE(CHOICE(?List) % 2,-1,8454143)
      SELF.Q.VVPar:VerpakkingOmschrijving_SelectedFG = CHOOSE(CHOICE(?List) % 2,-1,-1)
      SELF.Q.VVPar:VerpakkingOmschrijving_SelectedBG = CHOOSE(CHOICE(?List) % 2,-1,-1)
      SELF.Q.VVPar:LeverancierFirmanaam_NormalFG   = CHOOSE(CHOICE(?List) % 2,-1,-1) ! Set color values for VVPar:LeverancierFirmanaam
      SELF.Q.VVPar:LeverancierFirmanaam_NormalBG   = CHOOSE(CHOICE(?List) % 2,-1,8454143)
      SELF.Q.VVPar:LeverancierFirmanaam_SelectedFG = CHOOSE(CHOICE(?List) % 2,-1,-1)
      SELF.Q.VVPar:LeverancierFirmanaam_SelectedBG = CHOOSE(CHOICE(?List) % 2,-1,-1)
      SELF.Q.VVPar:AanmaakDatum_DATE_NormalFG   = CHOOSE(CHOICE(?List) % 2,-1,-1) ! Set color values for VVPar:AanmaakDatum_DATE
      SELF.Q.VVPar:AanmaakDatum_DATE_NormalBG   = CHOOSE(CHOICE(?List) % 2,-1,8454143)
      SELF.Q.VVPar:AanmaakDatum_DATE_SelectedFG = CHOOSE(CHOICE(?List) % 2,-1,-1)
      SELF.Q.VVPar:AanmaakDatum_DATE_SelectedBG = CHOOSE(CHOICE(?List) % 2,-1,-1)
  !----------------------------------------------------------------------


BRW3.Fetch PROCEDURE(BYTE Direction)

GreenBarIndex   LONG,AUTO
  CODE
  PARENT.Fetch(Direction)
  !----------------------------------------------------------------------
    LOOP GreenBarIndex=1 TO RECORDS(SELF.Q)
      GET(SELF.Q,GreenBarIndex)
      SELF.Q.VPCL:CelID_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for VPCL:CelID
      SELF.Q.VPCL:CelID_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.VPCL:CelID_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.VPCL:CelID_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.VPCL:PartijID_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for VPCL:PartijID
      SELF.Q.VPCL:PartijID_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.VPCL:PartijID_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.VPCL:PartijID_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.VPCL:CelLocatienaam_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for VPCL:CelLocatienaam
      SELF.Q.VPCL:CelLocatienaam_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.VPCL:CelLocatienaam_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.VPCL:CelLocatienaam_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.VVPar:ArtikelID_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for VVPar:ArtikelID
      SELF.Q.VVPar:ArtikelID_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.VVPar:ArtikelID_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.VVPar:ArtikelID_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.VVPar:ArtikelOms_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for VVPar:ArtikelOms
      SELF.Q.VVPar:ArtikelOms_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.VVPar:ArtikelOms_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.VVPar:ArtikelOms_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.VPCL:KG_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for VPCL:KG
      SELF.Q.VPCL:KG_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.VPCL:KG_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.VPCL:KG_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.VPCL:Pallet_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for VPCL:Pallet
      SELF.Q.VPCL:Pallet_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.VPCL:Pallet_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.VPCL:Pallet_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      PUT(SELF.Q)
    END
  !----------------------------------------------------------------------


BRW3.ResetFromView PROCEDURE

Loc:TotaalCelLocatie:Sum REAL                              ! Sum variable for browse totals
  CODE
  SETCURSOR(Cursor:Wait)
  Relate:ViewPartijCelLocaties.SetQuickScan(1)
  SELF.Reset
  IF SELF.UseMRP
     IF SELF.View{PROP:IPRequestCount} = 0
          SELF.View{PROP:IPRequestCount} = 60
     END
  END
  LOOP
    IF SELF.UseMRP
       IF SELF.View{PROP:IPRequestCount} = 0
            SELF.View{PROP:IPRequestCount} = 60
       END
    END
    CASE SELF.Next()
    OF Level:Notify
      BREAK
    OF Level:Fatal
      SETCURSOR()
      RETURN
    END
    SELF.SetQueueRecord
    Loc:TotaalCelLocatie:Sum += VPCL:KG
  END
  SELF.View{PROP:IPRequestCount} = 0
  Loc:TotaalCelLocatie = Loc:TotaalCelLocatie:Sum
  PARENT.ResetFromView
  Relate:ViewPartijCelLocaties.SetQuickScan(0)
  SETCURSOR()


BRW3.SetQueueRecord PROCEDURE

  CODE
  !IF VPCL:PartijID=25570
  !    Message('Partij 25570 KG:'&VPCL:KG&' partij voorraad uitslag '&VVParT:UitslagKG&' en inslag '&VVParT:InslagKG)
  !END
  
  IF VPCL:KG> VVPar:InslagKG-VVPar:UitslagKG        ! nooit meer dan de voorraad cel partij
      VPCL:KG=VVPar:InslagKG-VVPar:UitslagKG
  END    
  PARENT.SetQueueRecord
  
  !----------------------------------------------------------------------
      SELF.Q.VPCL:CelID_NormalFG   = CHOOSE(CHOICE(?List:3) % 2,-1,-1) ! Set color values for VPCL:CelID
      SELF.Q.VPCL:CelID_NormalBG   = CHOOSE(CHOICE(?List:3) % 2,-1,8454143)
      SELF.Q.VPCL:CelID_SelectedFG = CHOOSE(CHOICE(?List:3) % 2,-1,-1)
      SELF.Q.VPCL:CelID_SelectedBG = CHOOSE(CHOICE(?List:3) % 2,-1,-1)
      SELF.Q.VPCL:PartijID_NormalFG   = CHOOSE(CHOICE(?List:3) % 2,-1,-1) ! Set color values for VPCL:PartijID
      SELF.Q.VPCL:PartijID_NormalBG   = CHOOSE(CHOICE(?List:3) % 2,-1,8454143)
      SELF.Q.VPCL:PartijID_SelectedFG = CHOOSE(CHOICE(?List:3) % 2,-1,-1)
      SELF.Q.VPCL:PartijID_SelectedBG = CHOOSE(CHOICE(?List:3) % 2,-1,-1)
      SELF.Q.VPCL:CelLocatienaam_NormalFG   = CHOOSE(CHOICE(?List:3) % 2,-1,-1) ! Set color values for VPCL:CelLocatienaam
      SELF.Q.VPCL:CelLocatienaam_NormalBG   = CHOOSE(CHOICE(?List:3) % 2,-1,8454143)
      SELF.Q.VPCL:CelLocatienaam_SelectedFG = CHOOSE(CHOICE(?List:3) % 2,-1,-1)
      SELF.Q.VPCL:CelLocatienaam_SelectedBG = CHOOSE(CHOICE(?List:3) % 2,-1,-1)
      SELF.Q.VVPar:ArtikelID_NormalFG   = CHOOSE(CHOICE(?List:3) % 2,-1,-1) ! Set color values for VVPar:ArtikelID
      SELF.Q.VVPar:ArtikelID_NormalBG   = CHOOSE(CHOICE(?List:3) % 2,-1,8454143)
      SELF.Q.VVPar:ArtikelID_SelectedFG = CHOOSE(CHOICE(?List:3) % 2,-1,-1)
      SELF.Q.VVPar:ArtikelID_SelectedBG = CHOOSE(CHOICE(?List:3) % 2,-1,-1)
      SELF.Q.VVPar:ArtikelOms_NormalFG   = CHOOSE(CHOICE(?List:3) % 2,-1,-1) ! Set color values for VVPar:ArtikelOms
      SELF.Q.VVPar:ArtikelOms_NormalBG   = CHOOSE(CHOICE(?List:3) % 2,-1,8454143)
      SELF.Q.VVPar:ArtikelOms_SelectedFG = CHOOSE(CHOICE(?List:3) % 2,-1,-1)
      SELF.Q.VVPar:ArtikelOms_SelectedBG = CHOOSE(CHOICE(?List:3) % 2,-1,-1)
      SELF.Q.VPCL:KG_NormalFG   = CHOOSE(CHOICE(?List:3) % 2,-1,-1) ! Set color values for VPCL:KG
      SELF.Q.VPCL:KG_NormalBG   = CHOOSE(CHOICE(?List:3) % 2,-1,8454143)
      SELF.Q.VPCL:KG_SelectedFG = CHOOSE(CHOICE(?List:3) % 2,-1,-1)
      SELF.Q.VPCL:KG_SelectedBG = CHOOSE(CHOICE(?List:3) % 2,-1,-1)
      SELF.Q.VPCL:Pallet_NormalFG   = CHOOSE(CHOICE(?List:3) % 2,-1,-1) ! Set color values for VPCL:Pallet
      SELF.Q.VPCL:Pallet_NormalBG   = CHOOSE(CHOICE(?List:3) % 2,-1,8454143)
      SELF.Q.VPCL:Pallet_SelectedFG = CHOOSE(CHOICE(?List:3) % 2,-1,-1)
      SELF.Q.VPCL:Pallet_SelectedBG = CHOOSE(CHOICE(?List:3) % 2,-1,-1)
  !----------------------------------------------------------------------


BRW3.ValidateRecord PROCEDURE

ReturnValue          BYTE,AUTO

BRW3::RecordStatus   BYTE,AUTO
  CODE
  ReturnValue = PARENT.ValidateRecord()
  IF VPCL:CelID<>Loc:CelID3 THEN Return Record:Filtered.
  ! alleen van partijen met nog voorraad
  !Clear(VVParT:Record)
  !VVParT:PartijID=VPCL:PartijID
  !IF Access:ViewVoorraadPartijTotaal.Fetch(VVParT:PK_ViewVoorraadPartijTotaal)<>Level:Benign
  !    Return Record:Filtered
  !END
  !IF VVParT:UitslagKG>=VVParT:InslagKG
  !   Return Record:Filtered
  !END
  
  Clear(VVPar:Record)
  VVPar:PartijID=VPCL:PartijID
  VVPar:CelID=VPCL:CelID
  IF Access:ViewVoorraadPartij.Fetch(VVPar:PartijID_CelID_K)<>Level:Benign
      Return Record:Filtered
  END
  IF VVPar:UitslagKG>=VVPar:InslagKG
     Return Record:Filtered
  END
  BRW3::RecordStatus=ReturnValue
  RETURN ReturnValue


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window
  SELF.SetStrategy(?VoorraadVerloop, Resize:FixLeft+Resize:FixTop, Resize:LockSize) ! Override strategy for ?VoorraadVerloop
  SELF.SetStrategy(?ACel:CelOms, Resize:FixLeft+Resize:FixTop, Resize:LockSize) ! Override strategy for ?ACel:CelOms
  SELF.SetStrategy(?PROMPT2, Resize:FixLeft+Resize:FixTop, Resize:LockSize) ! Override strategy for ?PROMPT2
  SELF.SetStrategy(?ExcelButton, Resize:FixRight+Resize:FixBottom, Resize:LockSize) ! Override strategy for ?ExcelButton
  SELF.SetStrategy(?LOC:PeilDatum, Resize:FixRight+Resize:FixTop, Resize:LockSize) ! Override strategy for ?LOC:PeilDatum
  SELF.SetStrategy(?LOC:PeilDatum:Prompt:2, Resize:FixRight+Resize:FixTop, Resize:LockSize) ! Override strategy for ?LOC:PeilDatum:Prompt:2
  SELF.SetStrategy(?VandaagButton, Resize:FixRight+Resize:FixTop, Resize:LockSize) ! Override strategy for ?VandaagButton
  SELF.SetStrategy(?ExcelPartij, Resize:FixLeft+Resize:FixTop, Resize:LockSize) ! Override strategy for ?ExcelPartij
  SELF.SetStrategy(?AACel:CelOms, Resize:FixLeft+Resize:FixTop, Resize:LockSize) ! Override strategy for ?AACel:CelOms

