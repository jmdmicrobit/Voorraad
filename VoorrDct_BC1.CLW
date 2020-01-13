  MEMBER('VoorrDct.clw')

  INCLUDE('ABFILE.INC'),ONCE

  MAP
VoorrDct_BC1:DctInit    PROCEDURE()
VoorrDct_BC1:DctKill    PROCEDURE()
VoorrDct_BC1:FilesInit  PROCEDURE()
  END

Hide:Access:ViewVoorraadPartij CLASS(FileManager),TYPE     ! FileManager for ViewVoorraadPartij
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:ViewVoorraadPartij CLASS(RelationManager),TYPE ! RelationManager for ViewVoorraadPartij
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:CMR      CLASS(FileManager),TYPE               ! FileManager for CMR
DeleteRecord           PROCEDURE(BYTE Query=1),BYTE,PROC,DERIVED
Init                   PROCEDURE(),DERIVED
Insert                 PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),DERIVED
PreInsert              PROCEDURE(SIGNED OpCode,UNSIGNED AddLen,*CSTRING ErrCode,*CSTRING ErrMsg),BYTE,DERIVED
TryInsert              PROCEDURE(),BYTE,PROC,DERIVED
TryUpdate              PROCEDURE(),BYTE,PROC,DERIVED
Update                 PROCEDURE(),BYTE,PROC,DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:CMR      CLASS(RelationManager),TYPE           ! RelationManager for CMR
Init                   PROCEDURE
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:ViewPlanningPartij CLASS(FileManager),TYPE     ! FileManager for ViewPlanningPartij
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:ViewPlanningPartij CLASS(RelationManager),TYPE ! RelationManager for ViewPlanningPartij
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:OverboekingRit CLASS(FileManager),TYPE         ! FileManager for OverboekingRit
DeleteRecord           PROCEDURE(BYTE Query=1),BYTE,PROC,DERIVED
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
PreInsert              PROCEDURE(SIGNED OpCode,UNSIGNED AddLen,*CSTRING ErrCode,*CSTRING ErrMsg),BYTE,DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:OverboekingRit CLASS(RelationManager),TYPE     ! RelationManager for OverboekingRit
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:OverboekingRitRegel CLASS(FileManager),TYPE    ! FileManager for OverboekingRitRegel
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
PreInsert              PROCEDURE(SIGNED OpCode,UNSIGNED AddLen,*CSTRING ErrCode,*CSTRING ErrMsg),BYTE,DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:OverboekingRitRegel CLASS(RelationManager),TYPE ! RelationManager for OverboekingRitRegel
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:BulkOverboeking CLASS(FileManager),TYPE        ! FileManager for BulkOverboeking
DeleteRecord           PROCEDURE(BYTE Query=1),BYTE,PROC,DERIVED
Init                   PROCEDURE(),DERIVED
Insert                 PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),DERIVED
TryInsert              PROCEDURE(),BYTE,PROC,DERIVED
TryUpdate              PROCEDURE(),BYTE,PROC,DERIVED
Update                 PROCEDURE(),BYTE,PROC,DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
ValidateFieldServer    PROCEDURE(UNSIGNED Id,BYTE HandleErrors),BYTE,PROC,DERIVED
                     END


Hide:Relate:BulkOverboeking CLASS(RelationManager),TYPE    ! RelationManager for BulkOverboeking
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:PlanningOverboeking CLASS(FileManager),TYPE    ! FileManager for PlanningOverboeking
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:PlanningOverboeking CLASS(RelationManager),TYPE ! RelationManager for PlanningOverboeking
Init                   PROCEDURE
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:DubbeleInslagMutaties CLASS(FileManager),TYPE  ! FileManager for DubbeleInslagMutaties
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:DubbeleInslagMutaties CLASS(RelationManager),TYPE ! RelationManager for DubbeleInslagMutaties
Init                   PROCEDURE
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:ArtikelOmschrijvingExtra CLASS(FileManager),TYPE ! FileManager for ArtikelOmschrijvingExtra
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:ArtikelOmschrijvingExtra CLASS(RelationManager),TYPE ! RelationManager for ArtikelOmschrijvingExtra
Init                   PROCEDURE
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:ArtikelOmschrijvingExtraGroep CLASS(FileManager),TYPE ! FileManager for ArtikelOmschrijvingExtraGroep
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:ArtikelOmschrijvingExtraGroep CLASS(RelationManager),TYPE ! RelationManager for ArtikelOmschrijvingExtraGroep
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:PalletSoort CLASS(FileManager),TYPE            ! FileManager for PalletSoort
DeleteRecord           PROCEDURE(BYTE Query=1),BYTE,PROC,DERIVED
Init                   PROCEDURE(),DERIVED
Insert                 PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),DERIVED
PreInsert              PROCEDURE(SIGNED OpCode,UNSIGNED AddLen,*CSTRING ErrCode,*CSTRING ErrMsg),BYTE,DERIVED
TryInsert              PROCEDURE(),BYTE,PROC,DERIVED
TryUpdate              PROCEDURE(),BYTE,PROC,DERIVED
Update                 PROCEDURE(),BYTE,PROC,DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:PalletSoort CLASS(RelationManager),TYPE        ! RelationManager for PalletSoort
Init                   PROCEDURE
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:Weging   CLASS(FileManager),TYPE               ! FileManager for Weging
DeleteRecord           PROCEDURE(BYTE Query=1),BYTE,PROC,DERIVED
Init                   PROCEDURE(),DERIVED
Insert                 PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),DERIVED
PreInsert              PROCEDURE(SIGNED OpCode,UNSIGNED AddLen,*CSTRING ErrCode,*CSTRING ErrMsg),BYTE,DERIVED
TryInsert              PROCEDURE(),BYTE,PROC,DERIVED
TryUpdate              PROCEDURE(),BYTE,PROC,DERIVED
Update                 PROCEDURE(),BYTE,PROC,DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:Weging   CLASS(RelationManager),TYPE           ! RelationManager for Weging
Init                   PROCEDURE
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:CelLocatie CLASS(FileManager),TYPE             ! FileManager for CelLocatie
DeleteRecord           PROCEDURE(BYTE Query=1),BYTE,PROC,DERIVED
Init                   PROCEDURE(),DERIVED
Insert                 PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),DERIVED
PreInsert              PROCEDURE(SIGNED OpCode,UNSIGNED AddLen,*CSTRING ErrCode,*CSTRING ErrMsg),BYTE,DERIVED
TryInsert              PROCEDURE(),BYTE,PROC,DERIVED
TryUpdate              PROCEDURE(),BYTE,PROC,DERIVED
Update                 PROCEDURE(),BYTE,PROC,DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:CelLocatie CLASS(RelationManager),TYPE         ! RelationManager for CelLocatie
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:Versie   CLASS(FileManager),TYPE               ! FileManager for Versie
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:Versie   CLASS(RelationManager),TYPE           ! RelationManager for Versie
Init                   PROCEDURE
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:ViewPartijCelLocaties CLASS(FileManager),TYPE  ! FileManager for ViewPartijCelLocaties
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:ViewPartijCelLocaties CLASS(RelationManager),TYPE ! RelationManager for ViewPartijCelLocaties
Init                   PROCEDURE
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:ViewVoorraadPartij_INDEXED CLASS(FileManager),TYPE ! FileManager for ViewVoorraadPartij_INDEXED
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:ViewVoorraadPartij_INDEXED CLASS(RelationManager),TYPE ! RelationManager for ViewVoorraadPartij_INDEXED
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:ViewArtikel_Exact CLASS(FileManager),TYPE      ! FileManager for ViewArtikel_Exact
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:ViewArtikel_Exact CLASS(RelationManager),TYPE  ! RelationManager for ViewArtikel_Exact
Init                   PROCEDURE
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:Relatie_Exact CLASS(FileManager),TYPE          ! FileManager for Relatie_Exact
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:Relatie_Exact CLASS(RelationManager),TYPE      ! RelationManager for Relatie_Exact
Init                   PROCEDURE
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:ViewPalletTegoeden CLASS(FileManager),TYPE     ! FileManager for ViewPalletTegoeden
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:ViewPalletTegoeden CLASS(RelationManager),TYPE ! RelationManager for ViewPalletTegoeden
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:ViewPlanningPartijTotaal CLASS(FileManager),TYPE ! FileManager for ViewPlanningPartijTotaal
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:ViewPlanningPartijTotaal CLASS(RelationManager),TYPE ! RelationManager for ViewPlanningPartijTotaal
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
                     END


_Hide:Access:ViewVoorraadPartij &Hide:Access:ViewVoorraadPartij,AUTO,THREAD
_Hide:Relate:ViewVoorraadPartij &Hide:Relate:ViewVoorraadPartij,AUTO,THREAD
_Hide:Access:CMR     &Hide:Access:CMR,AUTO,THREAD
_Hide:Relate:CMR     &Hide:Relate:CMR,AUTO,THREAD
_Hide:Access:ViewPlanningPartij &Hide:Access:ViewPlanningPartij,AUTO,THREAD
_Hide:Relate:ViewPlanningPartij &Hide:Relate:ViewPlanningPartij,AUTO,THREAD
_Hide:Access:OverboekingRit &Hide:Access:OverboekingRit,AUTO,THREAD
_Hide:Relate:OverboekingRit &Hide:Relate:OverboekingRit,AUTO,THREAD
_Hide:Access:OverboekingRitRegel &Hide:Access:OverboekingRitRegel,AUTO,THREAD
_Hide:Relate:OverboekingRitRegel &Hide:Relate:OverboekingRitRegel,AUTO,THREAD
_Hide:Access:BulkOverboeking &Hide:Access:BulkOverboeking,AUTO,THREAD
_Hide:Relate:BulkOverboeking &Hide:Relate:BulkOverboeking,AUTO,THREAD
_Hide:Access:PlanningOverboeking &Hide:Access:PlanningOverboeking,AUTO,THREAD
_Hide:Relate:PlanningOverboeking &Hide:Relate:PlanningOverboeking,AUTO,THREAD
_Hide:Access:DubbeleInslagMutaties &Hide:Access:DubbeleInslagMutaties,AUTO,THREAD
_Hide:Relate:DubbeleInslagMutaties &Hide:Relate:DubbeleInslagMutaties,AUTO,THREAD
_Hide:Access:ArtikelOmschrijvingExtra &Hide:Access:ArtikelOmschrijvingExtra,AUTO,THREAD
_Hide:Relate:ArtikelOmschrijvingExtra &Hide:Relate:ArtikelOmschrijvingExtra,AUTO,THREAD
_Hide:Access:ArtikelOmschrijvingExtraGroep &Hide:Access:ArtikelOmschrijvingExtraGroep,AUTO,THREAD
_Hide:Relate:ArtikelOmschrijvingExtraGroep &Hide:Relate:ArtikelOmschrijvingExtraGroep,AUTO,THREAD
_Hide:Access:PalletSoort &Hide:Access:PalletSoort,AUTO,THREAD
_Hide:Relate:PalletSoort &Hide:Relate:PalletSoort,AUTO,THREAD
_Hide:Access:Weging  &Hide:Access:Weging,AUTO,THREAD
_Hide:Relate:Weging  &Hide:Relate:Weging,AUTO,THREAD
_Hide:Access:CelLocatie &Hide:Access:CelLocatie,AUTO,THREAD
_Hide:Relate:CelLocatie &Hide:Relate:CelLocatie,AUTO,THREAD
_Hide:Access:Versie  &Hide:Access:Versie,AUTO,THREAD
_Hide:Relate:Versie  &Hide:Relate:Versie,AUTO,THREAD
_Hide:Access:ViewPartijCelLocaties &Hide:Access:ViewPartijCelLocaties,AUTO,THREAD
_Hide:Relate:ViewPartijCelLocaties &Hide:Relate:ViewPartijCelLocaties,AUTO,THREAD
_Hide:Access:ViewVoorraadPartij_INDEXED &Hide:Access:ViewVoorraadPartij_INDEXED,AUTO,THREAD
_Hide:Relate:ViewVoorraadPartij_INDEXED &Hide:Relate:ViewVoorraadPartij_INDEXED,AUTO,THREAD
_Hide:Access:ViewArtikel_Exact &Hide:Access:ViewArtikel_Exact,AUTO,THREAD
_Hide:Relate:ViewArtikel_Exact &Hide:Relate:ViewArtikel_Exact,AUTO,THREAD
_Hide:Access:Relatie_Exact &Hide:Access:Relatie_Exact,AUTO,THREAD
_Hide:Relate:Relatie_Exact &Hide:Relate:Relatie_Exact,AUTO,THREAD
_Hide:Access:ViewPalletTegoeden &Hide:Access:ViewPalletTegoeden,AUTO,THREAD
_Hide:Relate:ViewPalletTegoeden &Hide:Relate:ViewPalletTegoeden,AUTO,THREAD
_Hide:Access:ViewPlanningPartijTotaal &Hide:Access:ViewPlanningPartijTotaal,AUTO,THREAD
_Hide:Relate:ViewPlanningPartijTotaal &Hide:Relate:ViewPlanningPartijTotaal,AUTO,THREAD


VoorrDct_BC1:DctInit PROCEDURE()
  CODE
  _Hide:Access:ViewVoorraadPartij &= NEW(Hide:Access:ViewVoorraadPartij)
  _Hide:Relate:ViewVoorraadPartij &= NEW(Hide:Relate:ViewVoorraadPartij)
  _Hide:Access:CMR &= NEW(Hide:Access:CMR)
  _Hide:Relate:CMR &= NEW(Hide:Relate:CMR)
  _Hide:Access:ViewPlanningPartij &= NEW(Hide:Access:ViewPlanningPartij)
  _Hide:Relate:ViewPlanningPartij &= NEW(Hide:Relate:ViewPlanningPartij)
  _Hide:Access:OverboekingRit &= NEW(Hide:Access:OverboekingRit)
  _Hide:Relate:OverboekingRit &= NEW(Hide:Relate:OverboekingRit)
  _Hide:Access:OverboekingRitRegel &= NEW(Hide:Access:OverboekingRitRegel)
  _Hide:Relate:OverboekingRitRegel &= NEW(Hide:Relate:OverboekingRitRegel)
  _Hide:Access:BulkOverboeking &= NEW(Hide:Access:BulkOverboeking)
  _Hide:Relate:BulkOverboeking &= NEW(Hide:Relate:BulkOverboeking)
  _Hide:Access:PlanningOverboeking &= NEW(Hide:Access:PlanningOverboeking)
  _Hide:Relate:PlanningOverboeking &= NEW(Hide:Relate:PlanningOverboeking)
  _Hide:Access:DubbeleInslagMutaties &= NEW(Hide:Access:DubbeleInslagMutaties)
  _Hide:Relate:DubbeleInslagMutaties &= NEW(Hide:Relate:DubbeleInslagMutaties)
  _Hide:Access:ArtikelOmschrijvingExtra &= NEW(Hide:Access:ArtikelOmschrijvingExtra)
  _Hide:Relate:ArtikelOmschrijvingExtra &= NEW(Hide:Relate:ArtikelOmschrijvingExtra)
  _Hide:Access:ArtikelOmschrijvingExtraGroep &= NEW(Hide:Access:ArtikelOmschrijvingExtraGroep)
  _Hide:Relate:ArtikelOmschrijvingExtraGroep &= NEW(Hide:Relate:ArtikelOmschrijvingExtraGroep)
  _Hide:Access:PalletSoort &= NEW(Hide:Access:PalletSoort)
  _Hide:Relate:PalletSoort &= NEW(Hide:Relate:PalletSoort)
  _Hide:Access:Weging &= NEW(Hide:Access:Weging)
  _Hide:Relate:Weging &= NEW(Hide:Relate:Weging)
  _Hide:Access:CelLocatie &= NEW(Hide:Access:CelLocatie)
  _Hide:Relate:CelLocatie &= NEW(Hide:Relate:CelLocatie)
  _Hide:Access:Versie &= NEW(Hide:Access:Versie)
  _Hide:Relate:Versie &= NEW(Hide:Relate:Versie)
  _Hide:Access:ViewPartijCelLocaties &= NEW(Hide:Access:ViewPartijCelLocaties)
  _Hide:Relate:ViewPartijCelLocaties &= NEW(Hide:Relate:ViewPartijCelLocaties)
  _Hide:Access:ViewVoorraadPartij_INDEXED &= NEW(Hide:Access:ViewVoorraadPartij_INDEXED)
  _Hide:Relate:ViewVoorraadPartij_INDEXED &= NEW(Hide:Relate:ViewVoorraadPartij_INDEXED)
  _Hide:Access:ViewArtikel_Exact &= NEW(Hide:Access:ViewArtikel_Exact)
  _Hide:Relate:ViewArtikel_Exact &= NEW(Hide:Relate:ViewArtikel_Exact)
  _Hide:Access:Relatie_Exact &= NEW(Hide:Access:Relatie_Exact)
  _Hide:Relate:Relatie_Exact &= NEW(Hide:Relate:Relatie_Exact)
  _Hide:Access:ViewPalletTegoeden &= NEW(Hide:Access:ViewPalletTegoeden)
  _Hide:Relate:ViewPalletTegoeden &= NEW(Hide:Relate:ViewPalletTegoeden)
  _Hide:Access:ViewPlanningPartijTotaal &= NEW(Hide:Access:ViewPlanningPartijTotaal)
  _Hide:Relate:ViewPlanningPartijTotaal &= NEW(Hide:Relate:ViewPlanningPartijTotaal)
  Relate:ViewVoorraadPartij &= _Hide:Relate:ViewVoorraadPartij
  Relate:CMR &= _Hide:Relate:CMR
  Relate:ViewPlanningPartij &= _Hide:Relate:ViewPlanningPartij
  Relate:OverboekingRit &= _Hide:Relate:OverboekingRit
  Relate:OverboekingRitRegel &= _Hide:Relate:OverboekingRitRegel
  Relate:BulkOverboeking &= _Hide:Relate:BulkOverboeking
  Relate:PlanningOverboeking &= _Hide:Relate:PlanningOverboeking
  Relate:DubbeleInslagMutaties &= _Hide:Relate:DubbeleInslagMutaties
  Relate:ArtikelOmschrijvingExtra &= _Hide:Relate:ArtikelOmschrijvingExtra
  Relate:ArtikelOmschrijvingExtraGroep &= _Hide:Relate:ArtikelOmschrijvingExtraGroep
  Relate:PalletSoort &= _Hide:Relate:PalletSoort
  Relate:Weging &= _Hide:Relate:Weging
  Relate:CelLocatie &= _Hide:Relate:CelLocatie
  Relate:Versie &= _Hide:Relate:Versie
  Relate:ViewPartijCelLocaties &= _Hide:Relate:ViewPartijCelLocaties
  Relate:ViewVoorraadPartij_INDEXED &= _Hide:Relate:ViewVoorraadPartij_INDEXED
  Relate:ViewArtikel_Exact &= _Hide:Relate:ViewArtikel_Exact
  Relate:Relatie_Exact &= _Hide:Relate:Relatie_Exact
  Relate:ViewPalletTegoeden &= _Hide:Relate:ViewPalletTegoeden
  Relate:ViewPlanningPartijTotaal &= _Hide:Relate:ViewPlanningPartijTotaal


VoorrDct_BC1:FilesInit PROCEDURE()
  CODE
  _Hide:Relate:ViewVoorraadPartij.Init
  _Hide:Relate:CMR.Init
  _Hide:Relate:ViewPlanningPartij.Init
  _Hide:Relate:OverboekingRit.Init
  _Hide:Relate:OverboekingRitRegel.Init
  _Hide:Relate:BulkOverboeking.Init
  _Hide:Relate:PlanningOverboeking.Init
  _Hide:Relate:DubbeleInslagMutaties.Init
  _Hide:Relate:ArtikelOmschrijvingExtra.Init
  _Hide:Relate:ArtikelOmschrijvingExtraGroep.Init
  _Hide:Relate:PalletSoort.Init
  _Hide:Relate:Weging.Init
  _Hide:Relate:CelLocatie.Init
  _Hide:Relate:Versie.Init
  _Hide:Relate:ViewPartijCelLocaties.Init
  _Hide:Relate:ViewVoorraadPartij_INDEXED.Init
  _Hide:Relate:ViewArtikel_Exact.Init
  _Hide:Relate:Relatie_Exact.Init
  _Hide:Relate:ViewPalletTegoeden.Init
  _Hide:Relate:ViewPlanningPartijTotaal.Init


VoorrDct_BC1:DctKill PROCEDURE()
  CODE
  _Hide:Relate:ViewVoorraadPartij.Kill
  DISPOSE(_Hide:Relate:ViewVoorraadPartij)
  _Hide:Relate:CMR.Kill
  DISPOSE(_Hide:Relate:CMR)
  _Hide:Relate:ViewPlanningPartij.Kill
  DISPOSE(_Hide:Relate:ViewPlanningPartij)
  _Hide:Relate:OverboekingRit.Kill
  DISPOSE(_Hide:Relate:OverboekingRit)
  _Hide:Relate:OverboekingRitRegel.Kill
  DISPOSE(_Hide:Relate:OverboekingRitRegel)
  _Hide:Relate:BulkOverboeking.Kill
  DISPOSE(_Hide:Relate:BulkOverboeking)
  _Hide:Relate:PlanningOverboeking.Kill
  DISPOSE(_Hide:Relate:PlanningOverboeking)
  _Hide:Relate:DubbeleInslagMutaties.Kill
  DISPOSE(_Hide:Relate:DubbeleInslagMutaties)
  _Hide:Relate:ArtikelOmschrijvingExtra.Kill
  DISPOSE(_Hide:Relate:ArtikelOmschrijvingExtra)
  _Hide:Relate:ArtikelOmschrijvingExtraGroep.Kill
  DISPOSE(_Hide:Relate:ArtikelOmschrijvingExtraGroep)
  _Hide:Relate:PalletSoort.Kill
  DISPOSE(_Hide:Relate:PalletSoort)
  _Hide:Relate:Weging.Kill
  DISPOSE(_Hide:Relate:Weging)
  _Hide:Relate:CelLocatie.Kill
  DISPOSE(_Hide:Relate:CelLocatie)
  _Hide:Relate:Versie.Kill
  DISPOSE(_Hide:Relate:Versie)
  _Hide:Relate:ViewPartijCelLocaties.Kill
  DISPOSE(_Hide:Relate:ViewPartijCelLocaties)
  _Hide:Relate:ViewVoorraadPartij_INDEXED.Kill
  DISPOSE(_Hide:Relate:ViewVoorraadPartij_INDEXED)
  _Hide:Relate:ViewArtikel_Exact.Kill
  DISPOSE(_Hide:Relate:ViewArtikel_Exact)
  _Hide:Relate:Relatie_Exact.Kill
  DISPOSE(_Hide:Relate:Relatie_Exact)
  _Hide:Relate:ViewPalletTegoeden.Kill
  DISPOSE(_Hide:Relate:ViewPalletTegoeden)
  _Hide:Relate:ViewPlanningPartijTotaal.Kill
  DISPOSE(_Hide:Relate:ViewPlanningPartijTotaal)


Hide:Relate:ViewVoorraadPartij.Init PROCEDURE()
  CODE
  _Hide:Access:ViewVoorraadPartij.Init
  SELF.Init(Access:ViewVoorraadPartij,1)


Hide:Access:ViewVoorraadPartij.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= VVPar:Record
  SELF.FileNameValue = 'ViewVoorraadPartij'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= ViewVoorraadPartij
  PARENT.Init
  Access:ViewVoorraadPartij &= SELF
  SELF.LazyOpen = False


Hide:Access:ViewVoorraadPartij.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:ViewVoorraadPartij &= NULL                        ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:ViewVoorraadPartij.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(ViewVoorraadPartij,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(VVPar:ExternPartijnr_PartijID_CelID_K,'VVPar:ExternPartijnr_PartijID_CelID_K',0)
    SELF.AddKey(VVPar:PartijID_CelID_K,'VVPar:PartijID_CelID_K',0)
    SELF.AddKey(VVPar:PartijCelID_K,'VVPar:PartijCelID_K',0)
    SELF.AddKey(VVPar:ArtikelID_PartijID_CelID_K,'VVPar:ArtikelID_PartijID_CelID_K',0)
    SELF.AddKey(VVPar:ArtikelOms_PartijID_CelID_K,'VVPar:ArtikelOms_PartijID_CelID_K',0)
    SELF.AddKey(VVPar:ArtikelID_CelID_PartijID_K,'VVPar:ArtikelID_CelID_PartijID_K',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:ViewVoorraadPartij.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:Partij)

  SELF.AddRelation(Relate:Cel,RI:None,RI:None,CEL:CEL_PK)
  SELF.AddRelationLink(VVPar:CelID,CEL:CelID)

  SELF.AddRelation(Relate:ACel,RI:None,RI:None,ACel:CEL_PK)
  SELF.AddRelationLink(VVPar:CelID,ACel:CelID)

  SELF.AddRelation(Relate:ViewArtikel,RI:None,RI:None,Art:Artikel_PK)
  SELF.AddRelationLink(VVPar:ArtikelID,Art:ArtikelID)

  SELF.AddRelation(Relate:AViewArtikel,RI:None,RI:None,AArt:Artikel_PK)
  SELF.AddRelationLink(VVPar:ArtikelID,AArt:ArtikelID)

  SELF.AddRelation(Relate:ViewPlanningPartij)

  SELF.AddRelation(Relate:ViewVoorraadPartijTotaal)

  SELF.AddRelation(Relate:ViewPlanningPartijTotaal)


Hide:Relate:ViewVoorraadPartij.Kill PROCEDURE

  CODE
  _Hide:Access:ViewVoorraadPartij.Kill                     ! Kill the file manager
  PARENT.Kill
  Relate:ViewVoorraadPartij &= NULL                        ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:ViewVoorraadPartij)                 ! destroy the file manager


Hide:Relate:CMR.Init PROCEDURE()
  CODE
  _Hide:Access:CMR.Init
  SELF.Init(Access:CMR,1)


Hide:Access:CMR.DeleteRecord PROCEDURE(BYTE Query=1)

ReturnValue          BYTE,AUTO

  CODE
  GebruikerLogClass.Log('Delete', 'CMR', GebruikerLogClass.BepaalRecordContent(CMR:Record))
  ReturnValue = PARENT.DeleteRecord(Query)
  RETURN ReturnValue


Hide:Access:CMR.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= CMR:Record
  SELF.FileNameValue = 'CMR'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= CMR
  PARENT.Init
  Access:CMR &= SELF
  SELF.LazyOpen = False


Hide:Access:CMR.Insert PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GebruikerLogClass.Log('Insert', 'CMR', GebruikerLogClass.BepaalRecordContent(CMR:Record))
  ReturnValue = PARENT.Insert()
  RETURN ReturnValue


Hide:Access:CMR.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:CMR &= NULL                                       ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:CMR.PreInsert PROCEDURE(SIGNED OpCode,UNSIGNED AddLen,*CSTRING ErrCode,*CSTRING ErrMsg)

ReturnValue          BYTE,AUTO

Buffer LIKE(CMR:RECORD)
  CODE
  PUSHERRORS()
  IF SELF.SavePreviousBuffer AND NOT(SELF.PreviousBuffer &= NULL)
     Buffer = SELF.PreviousBuffer
  END
  CMR{PROP:ServerAutoInc}
  CMR{PROP:ServerAutoInc,1}=1 !CMR:CMRID
  ReturnValue = PARENT.PreInsert(OpCode,AddLen,ErrCode,ErrMsg)
  POPERRORS()
  RETURN ReturnValue


Hide:Access:CMR.TryInsert PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GebruikerLogClass.Log('Insert', 'CMR', GebruikerLogClass.BepaalRecordContent(CMR:Record))
  ReturnValue = PARENT.TryInsert()
  RETURN ReturnValue


Hide:Access:CMR.TryUpdate PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GebruikerLogClass.Log('Update', 'CMR', GebruikerLogClass.BepaalRecordContent(CMR:Record))
  ReturnValue = PARENT.TryUpdate()
  RETURN ReturnValue


Hide:Access:CMR.Update PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GebruikerLogClass.Log('Update', 'CMR', GebruikerLogClass.BepaalRecordContent(CMR:Record))
  ReturnValue = PARENT.Update()
  RETURN ReturnValue


Hide:Access:CMR.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  ! EmulateAutoNumKey, this will force the FM to auto insert the record and
  ! recover the Identity column
  IF UseType = UseType:Initialize AND ~SELF.Initialized
     SELF.HasAutoInc = True
  END
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(CMR,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(CMR:CMR_PK,'CMR:CMR_PK',0)
    SELF.AddKey(CMR:CMR_FK1,'Op VerkoopID/CMRID',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:CMR.Kill PROCEDURE

  CODE
  _Hide:Access:CMR.Kill                                    ! Kill the file manager
  PARENT.Kill
  Relate:CMR &= NULL                                       ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:CMR)                                ! destroy the file manager


Hide:Relate:ViewPlanningPartij.Init PROCEDURE()
  CODE
  _Hide:Access:ViewPlanningPartij.Init
  SELF.Init(Access:ViewPlanningPartij,1)


Hide:Access:ViewPlanningPartij.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= VPPar:Record
  SELF.FileNameValue = 'ViewPlanningPartij'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= ViewPlanningPartij
  PARENT.Init
  Access:ViewPlanningPartij &= SELF
  SELF.LazyOpen = False


Hide:Access:ViewPlanningPartij.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:ViewPlanningPartij &= NULL                        ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:ViewPlanningPartij.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(ViewPlanningPartij,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(VPPar:PartijID_CelID_K,'VPPar:PartijID_CelID_K',0)
    SELF.AddKey(VPPar:PartijCelID_K,'VPPar:PartijCelID_K',0)
    SELF.AddKey(VPPar:ArtikelID_PartijID_CelID_K,'VPPar:ArtikelID_PartijID_CelID_K',0)
    SELF.AddKey(VPPar:ArtikelOms_PartijID_CelID_K,'VPPar:ArtikelOms_PartijID_CelID_K',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:ViewPlanningPartij.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:ViewVoorraadPartij,RI:None,RI:None,VVPar:PartijCelID_K)
  SELF.AddRelationLink(VPPar:PartijCelID,VVPar:PartijCelID)

  SELF.AddRelation(Relate:ViewVoorraadPartij_INDEXED,RI:None,RI:None,VVParI:PartijID_CelID_K)
  SELF.AddRelationLink(VPPar:PartijID,VVParI:PartijID)
  SELF.AddRelationLink(VPPar:CelID,VVParI:CelID)

  SELF.AddRelation(Relate:ViewPlanningPartijTotaal)


Hide:Relate:ViewPlanningPartij.Kill PROCEDURE

  CODE
  _Hide:Access:ViewPlanningPartij.Kill                     ! Kill the file manager
  PARENT.Kill
  Relate:ViewPlanningPartij &= NULL                        ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:ViewPlanningPartij)                 ! destroy the file manager


Hide:Relate:OverboekingRit.Init PROCEDURE()
  CODE
  _Hide:Access:OverboekingRit.Init
  SELF.Init(Access:OverboekingRit,1)


Hide:Access:OverboekingRit.DeleteRecord PROCEDURE(BYTE Query=1)

ReturnValue          BYTE,AUTO

  CODE
  GebruikerLogClass.Log('Delete', 'PalletSoort', GebruikerLogClass.BepaalRecordContent(PalSrt:Record))
  ReturnValue = PARENT.DeleteRecord(Query)
  RETURN ReturnValue


Hide:Access:OverboekingRit.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= OR:Record
  SELF.FileNameValue = 'OverboekingRit'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= OverboekingRit
  PARENT.Init
  Access:OverboekingRit &= SELF
  SELF.LazyOpen = False


Hide:Access:OverboekingRit.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:OverboekingRit &= NULL                            ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:OverboekingRit.PreInsert PROCEDURE(SIGNED OpCode,UNSIGNED AddLen,*CSTRING ErrCode,*CSTRING ErrMsg)

ReturnValue          BYTE,AUTO

Buffer LIKE(OR:RECORD)
  CODE
  PUSHERRORS()
  IF SELF.SavePreviousBuffer AND NOT(SELF.PreviousBuffer &= NULL)
     Buffer = SELF.PreviousBuffer
  END
  OverboekingRit{PROP:ServerAutoInc}
  OverboekingRit{PROP:ServerAutoInc,1}=1 !OR:OverboekingRitID
  ReturnValue = PARENT.PreInsert(OpCode,AddLen,ErrCode,ErrMsg)
  POPERRORS()
  RETURN ReturnValue


Hide:Access:OverboekingRit.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  ! EmulateAutoNumKey, this will force the FM to auto insert the record and
  ! recover the Identity column
  IF UseType = UseType:Initialize AND ~SELF.Initialized
     SELF.HasAutoInc = True
  END
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(OverboekingRit,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(OR:PK_OverboekingRit,'OR:PK_OverboekingRit',0)
    SELF.AddKey(OR:FK_OverboekingRit,'OR:FK_OverboekingRit',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:OverboekingRit.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:OverboekingRitRegel,RI:CASCADE,RI:CASCADE,ORR:FK_OverboekingRitRegel)
  SELF.AddRelationLink(OR:OverboekingRitID,ORR:OverboekingRitID)


Hide:Relate:OverboekingRit.Kill PROCEDURE

  CODE
  _Hide:Access:OverboekingRit.Kill                         ! Kill the file manager
  PARENT.Kill
  Relate:OverboekingRit &= NULL                            ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:OverboekingRit)                     ! destroy the file manager


Hide:Relate:OverboekingRitRegel.Init PROCEDURE()
  CODE
  _Hide:Access:OverboekingRitRegel.Init
  SELF.Init(Access:OverboekingRitRegel,1)


Hide:Access:OverboekingRitRegel.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= ORR:Record
  SELF.FileNameValue = 'OverboekingRitRegel'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= OverboekingRitRegel
  PARENT.Init
  Access:OverboekingRitRegel &= SELF
  SELF.LazyOpen = False


Hide:Access:OverboekingRitRegel.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:OverboekingRitRegel &= NULL                       ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:OverboekingRitRegel.PreInsert PROCEDURE(SIGNED OpCode,UNSIGNED AddLen,*CSTRING ErrCode,*CSTRING ErrMsg)

ReturnValue          BYTE,AUTO

Buffer LIKE(ORR:RECORD)
  CODE
  PUSHERRORS()
  IF SELF.SavePreviousBuffer AND NOT(SELF.PreviousBuffer &= NULL)
     Buffer = SELF.PreviousBuffer
  END
  OverboekingRitRegel{PROP:ServerAutoInc}
  OverboekingRitRegel{PROP:ServerAutoInc,1}=1 !ORR:OverboekingRitRegelID
  ReturnValue = PARENT.PreInsert(OpCode,AddLen,ErrCode,ErrMsg)
  POPERRORS()
  RETURN ReturnValue


Hide:Access:OverboekingRitRegel.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  ! EmulateAutoNumKey, this will force the FM to auto insert the record and
  ! recover the Identity column
  IF UseType = UseType:Initialize AND ~SELF.Initialized
     SELF.HasAutoInc = True
  END
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(OverboekingRitRegel,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(ORR:PK_OverboekingRitRegel,'ORR:PK_OverboekingRitRegel',0)
    SELF.AddKey(ORR:FK_OverboekingRitRegel,'ORR:FK_OverboekingRitRegel',0)
    SELF.AddKey(ORR:FK2_OverboekingRitRegel,'ORR:FK2_OverboekingRitRegel',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:OverboekingRitRegel.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:OverboekingRit)

  SELF.AddRelation(Relate:Planning,RI:None,RI:None,Pla:PK_Planning)
  SELF.AddRelationLink(ORR:PlanningID,Pla:PlanningID)


Hide:Relate:OverboekingRitRegel.Kill PROCEDURE

  CODE
  _Hide:Access:OverboekingRitRegel.Kill                    ! Kill the file manager
  PARENT.Kill
  Relate:OverboekingRitRegel &= NULL                       ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:OverboekingRitRegel)                ! destroy the file manager


Hide:Relate:BulkOverboeking.Init PROCEDURE()
  CODE
  _Hide:Access:BulkOverboeking.Init
  SELF.Init(Access:BulkOverboeking,1)


Hide:Access:BulkOverboeking.DeleteRecord PROCEDURE(BYTE Query=1)

ReturnValue          BYTE,AUTO

  CODE
  GebruikerLogClass.Log('Delete', 'BulkOverboeking', GebruikerLogClass.BepaalRecordContent(BOV:Record))
  ReturnValue = PARENT.DeleteRecord(Query)
  RETURN ReturnValue


Hide:Access:BulkOverboeking.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= BOV:Record
  SELF.FileNameValue = 'BulkOverboeking'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= BulkOverboeking
  PARENT.Init
  Access:BulkOverboeking &= SELF
  SELF.LazyOpen = False


Hide:Access:BulkOverboeking.Insert PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GebruikerLogClass.Log('Insert', 'BulkOverboeking', GebruikerLogClass.BepaalRecordContent(BOV:Record))
  ReturnValue = PARENT.Insert()
  RETURN ReturnValue


Hide:Access:BulkOverboeking.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:BulkOverboeking &= NULL                           ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:BulkOverboeking.TryInsert PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GebruikerLogClass.Log('Insert', 'BulkOverboeking', GebruikerLogClass.BepaalRecordContent(BOV:Record))
  ReturnValue = PARENT.TryInsert()
  RETURN ReturnValue


Hide:Access:BulkOverboeking.TryUpdate PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GebruikerLogClass.Log('Update', 'BulkOverboeking', GebruikerLogClass.BepaalRecordContent(BOV:Record))
  ReturnValue = PARENT.TryUpdate()
  RETURN ReturnValue


Hide:Access:BulkOverboeking.Update PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GebruikerLogClass.Log('Update', 'BulkOverboeking', GebruikerLogClass.BepaalRecordContent(BOV:Record))
  ReturnValue = PARENT.Update()
  RETURN ReturnValue


Hide:Access:BulkOverboeking.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(BulkOverboeking,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(BOV:PK_BulkOverboeking,'BOV:PK_BulkOverboeking',0)
    SELF.AddKey(BOV:FK1_BulkOverboeking,'BOV:FK1_BulkOverboeking',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Access:BulkOverboeking.ValidateFieldServer PROCEDURE(UNSIGNED Id,BYTE HandleErrors)

ReturnValue          BYTE,AUTO

Save:ViewArtikel3  USHORT,AUTO
Save:Cel5          USHORT,AUTO
Save:ACel6         USHORT,AUTO
  CODE
  ReturnValue = PARENT.ValidateFieldServer(Id,HandleErrors)
  CASE Id
  OF 3
    GlobalErrors.SetField('BOV:ArtikelID')
    Save:ViewArtikel3 = Access:ViewArtikel.SaveFile()
    Art:ArtikelID = BOV:ArtikelID
    ReturnValue = Access:ViewArtikel.TryFetch(Art:Artikel_PK)
    IF ReturnValue <> Level:Benign
      IF HandleErrors                                      ! Display message if handling errors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldNotInFile,'ViewArtikel')
      END
    END
    Access:ViewArtikel.RestoreFile(Save:ViewArtikel3)
  OF 5
    GlobalErrors.SetField('BOV:VanCelID')
    Save:Cel5 = Access:Cel.SaveFile()
    CEL:CelID = BOV:VanCelID
    ReturnValue = Access:Cel.TryFetch(CEL:CEL_PK)
    IF ReturnValue <> Level:Benign
      IF HandleErrors                                      ! Display message if handling errors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldNotInFile,'Cel')
      END
    END
    Access:Cel.RestoreFile(Save:Cel5)
  OF 6
    GlobalErrors.SetField('BOV:NaarCelID')
    Save:ACel6 = Access:ACel.SaveFile()
    ACel:CelID = BOV:NaarCelID
    ReturnValue = Access:ACel.TryFetch(ACel:CEL_PK)
    IF ReturnValue <> Level:Benign
      IF HandleErrors                                      ! Display message if handling errors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldNotInFile,'ACel')
      END
    END
    Access:ACel.RestoreFile(Save:ACel6)
  END
  RETURN ReturnValue


Hide:Relate:BulkOverboeking.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:Cel,RI:None,RI:None,CEL:CEL_PK)
  SELF.AddRelationLink(BOV:VanCelID,CEL:CelID)

  SELF.AddRelation(Relate:ACel,RI:None,RI:None,ACel:CEL_PK)
  SELF.AddRelationLink(BOV:NaarCelID,ACel:CelID)

  SELF.AddRelation(Relate:Planning)

  SELF.AddRelation(Relate:ViewArtikel,RI:None,RI:None,Art:Artikel_PK)
  SELF.AddRelationLink(BOV:ArtikelID,Art:ArtikelID)


Hide:Relate:BulkOverboeking.Kill PROCEDURE

  CODE
  _Hide:Access:BulkOverboeking.Kill                        ! Kill the file manager
  PARENT.Kill
  Relate:BulkOverboeking &= NULL                           ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:BulkOverboeking)                    ! destroy the file manager


Hide:Relate:PlanningOverboeking.Init PROCEDURE()
  CODE
  _Hide:Access:PlanningOverboeking.Init
  SELF.Init(Access:PlanningOverboeking,1)


Hide:Access:PlanningOverboeking.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= Pla4:Record
  SELF.FileNameValue = 'PlanningOverboeking'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= PlanningOverboeking
  PARENT.Init
  Access:PlanningOverboeking &= SELF
  SELF.LazyOpen = False


Hide:Access:PlanningOverboeking.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:PlanningOverboeking &= NULL                       ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:PlanningOverboeking.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(PlanningOverboeking,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(Pla4:PlanningID_K,'Pla4:PlanningID_K',0)
    SELF.AddKey(Pla4:Planning_K,'Pla4:Planning_K',0)
    SELF.AddKey(Pla4:Planning_FirmaNaam_k,'Pla4:Planning_FirmaNaam_k',0)
    SELF.AddKey(Pla4:Verwerkt_Planning_K,'Pla4:Verwerkt_Planning_K',0)
    SELF.AddKey(Pla4:Verwerkt_Planning_FirmaNaam_K,'Pla4:Verwerkt_Planning_FirmaNaam_K',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:PlanningOverboeking.Kill PROCEDURE

  CODE
  _Hide:Access:PlanningOverboeking.Kill                    ! Kill the file manager
  PARENT.Kill
  Relate:PlanningOverboeking &= NULL                       ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:PlanningOverboeking)                ! destroy the file manager


Hide:Relate:DubbeleInslagMutaties.Init PROCEDURE()
  CODE
  _Hide:Access:DubbeleInslagMutaties.Init
  SELF.Init(Access:DubbeleInslagMutaties,1)


Hide:Access:DubbeleInslagMutaties.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= Dub:Record
  SELF.FileNameValue = 'DubbeleInslagMutaties'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= DubbeleInslagMutaties
  PARENT.Init
  Access:DubbeleInslagMutaties &= SELF
  SELF.LazyOpen = False


Hide:Access:DubbeleInslagMutaties.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:DubbeleInslagMutaties &= NULL                     ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:DubbeleInslagMutaties.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(DubbeleInslagMutaties,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(Dub:Partij_CelID_K,'Dub:Partij_CelID_K',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:DubbeleInslagMutaties.Kill PROCEDURE

  CODE
  _Hide:Access:DubbeleInslagMutaties.Kill                  ! Kill the file manager
  PARENT.Kill
  Relate:DubbeleInslagMutaties &= NULL                     ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:DubbeleInslagMutaties)              ! destroy the file manager


Hide:Relate:ArtikelOmschrijvingExtra.Init PROCEDURE()
  CODE
  _Hide:Access:ArtikelOmschrijvingExtra.Init
  SELF.Init(Access:ArtikelOmschrijvingExtra,1)


Hide:Access:ArtikelOmschrijvingExtra.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= Art2:Record
  SELF.FileNameValue = 'ArtikelOmschrijvingExtra'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= ArtikelOmschrijvingExtra
  PARENT.Init
  Access:ArtikelOmschrijvingExtra &= SELF
  SELF.LazyOpen = False


Hide:Access:ArtikelOmschrijvingExtra.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:ArtikelOmschrijvingExtra &= NULL                  ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:ArtikelOmschrijvingExtra.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(ArtikelOmschrijvingExtra,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(Art2:PK_ArtikelOmschrijvingExtra,'Op ex_artcode / artcode',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:ArtikelOmschrijvingExtra.Kill PROCEDURE

  CODE
  _Hide:Access:ArtikelOmschrijvingExtra.Kill               ! Kill the file manager
  PARENT.Kill
  Relate:ArtikelOmschrijvingExtra &= NULL                  ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:ArtikelOmschrijvingExtra)           ! destroy the file manager


Hide:Relate:ArtikelOmschrijvingExtraGroep.Init PROCEDURE()
  CODE
  _Hide:Access:ArtikelOmschrijvingExtraGroep.Init
  SELF.Init(Access:ArtikelOmschrijvingExtraGroep,1)


Hide:Access:ArtikelOmschrijvingExtraGroep.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= Art3:Record
  SELF.FileNameValue = 'ArtikelOmschrijvingExtraGroep'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= ArtikelOmschrijvingExtraGroep
  PARENT.Init
  Access:ArtikelOmschrijvingExtraGroep &= SELF
  SELF.LazyOpen = False


Hide:Access:ArtikelOmschrijvingExtraGroep.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:ArtikelOmschrijvingExtraGroep &= NULL             ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:ArtikelOmschrijvingExtraGroep.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(ArtikelOmschrijvingExtraGroep,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(Art3:PK_ArtikelOmschrijvingExtraGroep,'Art3:PK_ArtikelOmschrijvingExtraGroep',0)
    SELF.AddKey(Art3:FK_ArtikelOmschrijvingExtraGroep,'Art3:FK_ArtikelOmschrijvingExtraGroep',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:ArtikelOmschrijvingExtraGroep.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:Relatie)


Hide:Relate:ArtikelOmschrijvingExtraGroep.Kill PROCEDURE

  CODE
  _Hide:Access:ArtikelOmschrijvingExtraGroep.Kill          ! Kill the file manager
  PARENT.Kill
  Relate:ArtikelOmschrijvingExtraGroep &= NULL             ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:ArtikelOmschrijvingExtraGroep)      ! destroy the file manager


Hide:Relate:PalletSoort.Init PROCEDURE()
  CODE
  _Hide:Access:PalletSoort.Init
  SELF.Init(Access:PalletSoort,1)


Hide:Access:PalletSoort.DeleteRecord PROCEDURE(BYTE Query=1)

ReturnValue          BYTE,AUTO

  CODE
  GebruikerLogClass.Log('Delete', 'PalletSoort', GebruikerLogClass.BepaalRecordContent(PalSrt:Record))
  ReturnValue = PARENT.DeleteRecord(Query)
  RETURN ReturnValue


Hide:Access:PalletSoort.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= PalSrt:Record
  SELF.FileNameValue = 'PalletSoort'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= PalletSoort
  PARENT.Init
  Access:PalletSoort &= SELF
  SELF.LazyOpen = False


Hide:Access:PalletSoort.Insert PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GebruikerLogClass.Log('Insert', 'PalletSoort', GebruikerLogClass.BepaalRecordContent(PalSrt:Record))
  ReturnValue = PARENT.Insert()
  RETURN ReturnValue


Hide:Access:PalletSoort.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:PalletSoort &= NULL                               ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:PalletSoort.PreInsert PROCEDURE(SIGNED OpCode,UNSIGNED AddLen,*CSTRING ErrCode,*CSTRING ErrMsg)

ReturnValue          BYTE,AUTO

Buffer LIKE(PalSrt:RECORD)
  CODE
  PUSHERRORS()
  IF SELF.SavePreviousBuffer AND NOT(SELF.PreviousBuffer &= NULL)
     Buffer = SELF.PreviousBuffer
  END
  PalletSoort{PROP:ServerAutoInc}
  PalletSoort{PROP:ServerAutoInc,1}=1 !PalSrt:PalletSoortID
  ReturnValue = PARENT.PreInsert(OpCode,AddLen,ErrCode,ErrMsg)
  POPERRORS()
  RETURN ReturnValue


Hide:Access:PalletSoort.TryInsert PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GebruikerLogClass.Log('Insert', 'PalletSoort', GebruikerLogClass.BepaalRecordContent(PalSrt:Record))
  ReturnValue = PARENT.TryInsert()
  RETURN ReturnValue


Hide:Access:PalletSoort.TryUpdate PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GebruikerLogClass.Log('Update', 'PalletSoort', GebruikerLogClass.BepaalRecordContent(PalSrt:Record))
  ReturnValue = PARENT.TryUpdate()
  RETURN ReturnValue


Hide:Access:PalletSoort.Update PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GebruikerLogClass.Log('Update', 'PalletSoort', GebruikerLogClass.BepaalRecordContent(PalSrt:Record))
  ReturnValue = PARENT.Update()
  RETURN ReturnValue


Hide:Access:PalletSoort.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  ! EmulateAutoNumKey, this will force the FM to auto insert the record and
  ! recover the Identity column
  IF UseType = UseType:Initialize AND ~SELF.Initialized
     SELF.HasAutoInc = True
  END
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(PalletSoort,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(PalSrt:PK_PalletSoort,'PalSrt:PK_PalletSoort',0)
    SELF.AddKey(PalSrt:FK_PalletSoort,'Op PalletOmschrijving/PalletSoortID',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:PalletSoort.Kill PROCEDURE

  CODE
  _Hide:Access:PalletSoort.Kill                            ! Kill the file manager
  PARENT.Kill
  Relate:PalletSoort &= NULL                               ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:PalletSoort)                        ! destroy the file manager


Hide:Relate:Weging.Init PROCEDURE()
  CODE
  _Hide:Access:Weging.Init
  SELF.Init(Access:Weging,1)


Hide:Access:Weging.DeleteRecord PROCEDURE(BYTE Query=1)

ReturnValue          BYTE,AUTO

  CODE
  GebruikerLogClass.Log('Delete', 'Weging', GebruikerLogClass.BepaalRecordContent(Weg:Record))
  ReturnValue = PARENT.DeleteRecord(Query)
  RETURN ReturnValue


Hide:Access:Weging.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= Weg:Record
  SELF.FileNameValue = 'Weging'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= Weging
  PARENT.Init
  Access:Weging &= SELF
  SELF.LazyOpen = False


Hide:Access:Weging.Insert PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GebruikerLogClass.Log('Insert', 'Weging', GebruikerLogClass.BepaalRecordContent(Weg:Record))
  ReturnValue = PARENT.Insert()
  RETURN ReturnValue


Hide:Access:Weging.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:Weging &= NULL                                    ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:Weging.PreInsert PROCEDURE(SIGNED OpCode,UNSIGNED AddLen,*CSTRING ErrCode,*CSTRING ErrMsg)

ReturnValue          BYTE,AUTO

Buffer LIKE(Weg:RECORD)
  CODE
  PUSHERRORS()
  IF SELF.SavePreviousBuffer AND NOT(SELF.PreviousBuffer &= NULL)
     Buffer = SELF.PreviousBuffer
  END
  Weging{PROP:ServerAutoInc}
  Weging{PROP:ServerAutoInc,1}=1 !Weg:WegingID
  ReturnValue = PARENT.PreInsert(OpCode,AddLen,ErrCode,ErrMsg)
  POPERRORS()
  RETURN ReturnValue


Hide:Access:Weging.TryInsert PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GebruikerLogClass.Log('Insert', 'Weging', GebruikerLogClass.BepaalRecordContent(Weg:Record))
  ReturnValue = PARENT.TryInsert()
  RETURN ReturnValue


Hide:Access:Weging.TryUpdate PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GebruikerLogClass.Log('Update', 'Weging', GebruikerLogClass.BepaalRecordContent(Weg:Record))
  ReturnValue = PARENT.TryUpdate()
  RETURN ReturnValue


Hide:Access:Weging.Update PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GebruikerLogClass.Log('Update', 'Weging', GebruikerLogClass.BepaalRecordContent(Weg:Record))
  ReturnValue = PARENT.Update()
  RETURN ReturnValue


Hide:Access:Weging.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  ! EmulateAutoNumKey, this will force the FM to auto insert the record and
  ! recover the Identity column
  IF UseType = UseType:Initialize AND ~SELF.Initialized
     SELF.HasAutoInc = True
  END
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(Weging,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(Weg:PK_Weging,'Weg:PK_Weging',0)
    SELF.AddKey(Weg:FK_Weging,'Weg:FK_Weging',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:Weging.Kill PROCEDURE

  CODE
  _Hide:Access:Weging.Kill                                 ! Kill the file manager
  PARENT.Kill
  Relate:Weging &= NULL                                    ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:Weging)                             ! destroy the file manager


Hide:Relate:CelLocatie.Init PROCEDURE()
  CODE
  _Hide:Access:CelLocatie.Init
  SELF.Init(Access:CelLocatie,1)


Hide:Access:CelLocatie.DeleteRecord PROCEDURE(BYTE Query=1)

ReturnValue          BYTE,AUTO

  CODE
  GebruikerLogClass.Log('Delete', 'CelLocatie', GebruikerLogClass.BepaalRecordContent(CL:Record))
  ReturnValue = PARENT.DeleteRecord(Query)
  RETURN ReturnValue


Hide:Access:CelLocatie.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= CL:Record
  SELF.FileNameValue = 'CelLocatie'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= CelLocatie
  PARENT.Init
  Access:CelLocatie &= SELF
  SELF.LazyOpen = False


Hide:Access:CelLocatie.Insert PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GebruikerLogClass.Log('Insert', 'CelLocatie', GebruikerLogClass.BepaalRecordContent(CL:Record))
  ReturnValue = PARENT.Insert()
  RETURN ReturnValue


Hide:Access:CelLocatie.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:CelLocatie &= NULL                                ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:CelLocatie.PreInsert PROCEDURE(SIGNED OpCode,UNSIGNED AddLen,*CSTRING ErrCode,*CSTRING ErrMsg)

ReturnValue          BYTE,AUTO

Buffer LIKE(CL:RECORD)
  CODE
  PUSHERRORS()
  IF SELF.SavePreviousBuffer AND NOT(SELF.PreviousBuffer &= NULL)
     Buffer = SELF.PreviousBuffer
  END
  CelLocatie{PROP:ServerAutoInc}
  CelLocatie{PROP:ServerAutoInc,1}=1 !CL:CelLocatieID
  ReturnValue = PARENT.PreInsert(OpCode,AddLen,ErrCode,ErrMsg)
  POPERRORS()
  RETURN ReturnValue


Hide:Access:CelLocatie.TryInsert PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GebruikerLogClass.Log('Insert', 'CelLocatie', GebruikerLogClass.BepaalRecordContent(CL:Record))
  ReturnValue = PARENT.TryInsert()
  RETURN ReturnValue


Hide:Access:CelLocatie.TryUpdate PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GebruikerLogClass.Log('Update', 'CelLocatie', GebruikerLogClass.BepaalRecordContent(CL:Record))
  ReturnValue = PARENT.TryUpdate()
  RETURN ReturnValue


Hide:Access:CelLocatie.Update PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GebruikerLogClass.Log('Update', 'CelLocatie', GebruikerLogClass.BepaalRecordContent(CL:Record))
  ReturnValue = PARENT.Update()
  RETURN ReturnValue


Hide:Access:CelLocatie.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  ! EmulateAutoNumKey, this will force the FM to auto insert the record and
  ! recover the Identity column
  IF UseType = UseType:Initialize AND ~SELF.Initialized
     SELF.HasAutoInc = True
  END
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(CelLocatie,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(CL:PK_CelLocatie,'CL:PK_CelLocatie',0)
    SELF.AddKey(CL:FK_CelLocatie,'CL:FK_CelLocatie',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:CelLocatie.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:Cel)

  SELF.AddRelation(Relate:ACel)

  SELF.AddRelation(Relate:AACel)

  SELF.AddRelation(Relate:AAACel)

  SELF.AddRelation(Relate:AAAACel)

  SELF.AddRelation(Relate:Mutatie)

  SELF.AddRelation(Relate:Planning)


Hide:Relate:CelLocatie.Kill PROCEDURE

  CODE
  _Hide:Access:CelLocatie.Kill                             ! Kill the file manager
  PARENT.Kill
  Relate:CelLocatie &= NULL                                ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:CelLocatie)                         ! destroy the file manager


Hide:Relate:Versie.Init PROCEDURE()
  CODE
  _Hide:Access:Versie.Init
  SELF.Init(Access:Versie,1)


Hide:Access:Versie.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= VRS:Record
  SELF.FileNameValue = 'Versie'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= Versie
  PARENT.Init
  Access:Versie &= SELF
  SELF.LazyOpen = False


Hide:Access:Versie.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:Versie &= NULL                                    ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:Versie.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(Versie,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(VRS:Versie_PK,'VRS:Versie_PK',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:Versie.Kill PROCEDURE

  CODE
  _Hide:Access:Versie.Kill                                 ! Kill the file manager
  PARENT.Kill
  Relate:Versie &= NULL                                    ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:Versie)                             ! destroy the file manager


Hide:Relate:ViewPartijCelLocaties.Init PROCEDURE()
  CODE
  _Hide:Access:ViewPartijCelLocaties.Init
  SELF.Init(Access:ViewPartijCelLocaties,1)


Hide:Access:ViewPartijCelLocaties.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= VPCL:Record
  SELF.FileNameValue = 'ViewPartijCelLocaties'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= ViewPartijCelLocaties
  PARENT.Init
  Access:ViewPartijCelLocaties &= SELF
  SELF.LazyOpen = False


Hide:Access:ViewPartijCelLocaties.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:ViewPartijCelLocaties &= NULL                     ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:ViewPartijCelLocaties.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(ViewPartijCelLocaties,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(VPCL:ViewPartijCelLocaties_PK,'VPCL:ViewPartijCelLocaties_PK',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:ViewPartijCelLocaties.Kill PROCEDURE

  CODE
  _Hide:Access:ViewPartijCelLocaties.Kill                  ! Kill the file manager
  PARENT.Kill
  Relate:ViewPartijCelLocaties &= NULL                     ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:ViewPartijCelLocaties)              ! destroy the file manager


Hide:Relate:ViewVoorraadPartij_INDEXED.Init PROCEDURE()
  CODE
  _Hide:Access:ViewVoorraadPartij_INDEXED.Init
  SELF.Init(Access:ViewVoorraadPartij_INDEXED,1)


Hide:Access:ViewVoorraadPartij_INDEXED.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= VVParI:Record
  SELF.FileNameValue = 'ViewVoorraadPartij_INDEXED'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= ViewVoorraadPartij_INDEXED
  PARENT.Init
  Access:ViewVoorraadPartij_INDEXED &= SELF
  SELF.LazyOpen = False


Hide:Access:ViewVoorraadPartij_INDEXED.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:ViewVoorraadPartij_INDEXED &= NULL                ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:ViewVoorraadPartij_INDEXED.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(ViewVoorraadPartij_INDEXED,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(VVParI:ExternPartijnr_PartijID_CelID_K,'VVParI:ExternPartijnr_PartijID_CelID_K',0)
    SELF.AddKey(VVParI:PartijID_CelID_K,'VVParI:PartijID_CelID_K',0)
    SELF.AddKey(VVParI:ArtikelID_PartijID_CelID_K,'VVParI:ArtikelID_PartijID_CelID_K',0)
    SELF.AddKey(VVParI:ArtikelOms_PartijID_CelID_K,'VVParI:ArtikelOms_PartijID_CelID_K',0)
    SELF.AddKey(VVParI:ArtikelID_CelID_PartijID_K,'VVParI:ArtikelID_CelID_PartijID_K',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:ViewVoorraadPartij_INDEXED.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:ViewPlanningPartij)

  SELF.AddRelation(Relate:ViewVoorraadPartijTotaal)

  SELF.AddRelation(Relate:ViewPlanningPartijTotaal)


Hide:Relate:ViewVoorraadPartij_INDEXED.Kill PROCEDURE

  CODE
  _Hide:Access:ViewVoorraadPartij_INDEXED.Kill             ! Kill the file manager
  PARENT.Kill
  Relate:ViewVoorraadPartij_INDEXED &= NULL                ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:ViewVoorraadPartij_INDEXED)         ! destroy the file manager


Hide:Relate:ViewArtikel_Exact.Init PROCEDURE()
  CODE
  _Hide:Access:ViewArtikel_Exact.Init
  SELF.Init(Access:ViewArtikel_Exact,1)


Hide:Access:ViewArtikel_Exact.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= ARTE:Record
  SELF.FileNameValue = 'ViewArtikel_Exact'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= ViewArtikel_Exact
  PARENT.Init
  Access:ViewArtikel_Exact &= SELF
  SELF.LazyOpen = False


Hide:Access:ViewArtikel_Exact.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:ViewArtikel_Exact &= NULL                         ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:ViewArtikel_Exact.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(ViewArtikel_Exact,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(ARTE:Artikel_PK,'ARTE:Artikel_PK',0)
    SELF.AddKey(ARTE:Artikel_FK01,'ARTE:Artikel_FK01',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:ViewArtikel_Exact.Kill PROCEDURE

  CODE
  _Hide:Access:ViewArtikel_Exact.Kill                      ! Kill the file manager
  PARENT.Kill
  Relate:ViewArtikel_Exact &= NULL                         ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:ViewArtikel_Exact)                  ! destroy the file manager


Hide:Relate:Relatie_Exact.Init PROCEDURE()
  CODE
  _Hide:Access:Relatie_Exact.Init
  SELF.Init(Access:Relatie_Exact,1)


Hide:Access:Relatie_Exact.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= RelE:Record
  SELF.FileNameValue = 'Relatie_Exact'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= Relatie_Exact
  PARENT.Init
  Access:Relatie_Exact &= SELF
  SELF.LazyOpen = False


Hide:Access:Relatie_Exact.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:Relatie_Exact &= NULL                             ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:Relatie_Exact.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(Relatie_Exact,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(RelE:Relatie_FK01,'RelE:Relatie_FK01',0)
    SELF.AddKey(RelE:Relatie_PK,'RelE:Relatie_PK',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:Relatie_Exact.Kill PROCEDURE

  CODE
  _Hide:Access:Relatie_Exact.Kill                          ! Kill the file manager
  PARENT.Kill
  Relate:Relatie_Exact &= NULL                             ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:Relatie_Exact)                      ! destroy the file manager


Hide:Relate:ViewPalletTegoeden.Init PROCEDURE()
  CODE
  _Hide:Access:ViewPalletTegoeden.Init
  SELF.Init(Access:ViewPalletTegoeden,1)


Hide:Access:ViewPalletTegoeden.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= PTG:Record
  SELF.FileNameValue = 'ViewPalletTegoeden'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= ViewPalletTegoeden
  PARENT.Init
  Access:ViewPalletTegoeden &= SELF
  SELF.LazyOpen = False


Hide:Access:ViewPalletTegoeden.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:ViewPalletTegoeden &= NULL                        ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:ViewPalletTegoeden.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(ViewPalletTegoeden,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(PTG:ViewPalletTegoeden_PK,'PTG:ViewPalletTegoeden_PK',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:ViewPalletTegoeden.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:Relatie)

  SELF.AddRelation(Relate:ARelatie)


Hide:Relate:ViewPalletTegoeden.Kill PROCEDURE

  CODE
  _Hide:Access:ViewPalletTegoeden.Kill                     ! Kill the file manager
  PARENT.Kill
  Relate:ViewPalletTegoeden &= NULL                        ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:ViewPalletTegoeden)                 ! destroy the file manager


Hide:Relate:ViewPlanningPartijTotaal.Init PROCEDURE()
  CODE
  _Hide:Access:ViewPlanningPartijTotaal.Init
  SELF.Init(Access:ViewPlanningPartijTotaal,1)


Hide:Access:ViewPlanningPartijTotaal.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= VPParT:Record
  SELF.FileNameValue = 'ViewPlanningPartijTotaal'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= ViewPlanningPartijTotaal
  PARENT.Init
  Access:ViewPlanningPartijTotaal &= SELF
  SELF.LazyOpen = False


Hide:Access:ViewPlanningPartijTotaal.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:ViewPlanningPartijTotaal &= NULL                  ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:ViewPlanningPartijTotaal.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(ViewPlanningPartijTotaal,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(VPParT:PK_ViewPlanningPartijTotaal,'VPParT:PK_ViewPlanningPartijTotaal',0)
    SELF.AddKey(VPParT:FK1_ViewPlanningPartijTotaal,'VPParT:FK1_ViewPlanningPartijTotaal',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:ViewPlanningPartijTotaal.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:ViewPlanningPartij,RI:None,RI:None,VPPar:PartijID_CelID_K)
  SELF.AddRelationLink(VPParT:PartijID,VPPar:PartijID)

  SELF.AddRelation(Relate:ViewVoorraadPartij_INDEXED,RI:None,RI:None,VVParI:PartijID_CelID_K)
  SELF.AddRelationLink(VPParT:PartijID,VVParI:PartijID)

  SELF.AddRelation(Relate:ViewVoorraadPartij,RI:None,RI:None,VVPar:PartijID_CelID_K)
  SELF.AddRelationLink(VPParT:PartijID,VVPar:PartijID)


Hide:Relate:ViewPlanningPartijTotaal.Kill PROCEDURE

  CODE
  _Hide:Access:ViewPlanningPartijTotaal.Kill               ! Kill the file manager
  PARENT.Kill
  Relate:ViewPlanningPartijTotaal &= NULL                  ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:ViewPlanningPartijTotaal)           ! destroy the file manager

