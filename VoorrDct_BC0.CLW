  MEMBER('VoorrDct.clw')

  INCLUDE('ABFILE.INC'),ONCE

  MAP
VoorrDct_BC0:DctInit    PROCEDURE()
VoorrDct_BC0:DctKill    PROCEDURE()
VoorrDct_BC0:FilesInit  PROCEDURE()
  END

Hide:Access:ViewArtikel CLASS(FileManager),TYPE            ! FileManager for ViewArtikel
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:ViewArtikel CLASS(RelationManager),TYPE        ! RelationManager for ViewArtikel
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:Partij   CLASS(FileManager),TYPE               ! FileManager for Partij
DeleteRecord           PROCEDURE(BYTE Query=1),BYTE,PROC,DERIVED
Init                   PROCEDURE(),DERIVED
Insert                 PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),DERIVED
PreInsert              PROCEDURE(SIGNED OpCode,UNSIGNED AddLen,*CSTRING ErrCode,*CSTRING ErrMsg),BYTE,DERIVED
PrimeFields            PROCEDURE(),PROC,DERIVED
TryInsert              PROCEDURE(),BYTE,PROC,DERIVED
TryUpdate              PROCEDURE(),BYTE,PROC,DERIVED
Update                 PROCEDURE(),BYTE,PROC,DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:Partij   CLASS(RelationManager),TYPE           ! RelationManager for Partij
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:Relatie  CLASS(FileManager),TYPE               ! FileManager for Relatie
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:Relatie  CLASS(RelationManager),TYPE           ! RelationManager for Relatie
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:Verpakking CLASS(FileManager),TYPE             ! FileManager for Verpakking
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


Hide:Relate:Verpakking CLASS(RelationManager),TYPE         ! RelationManager for Verpakking
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:ViewVoorraadPlanning CLASS(FileManager),TYPE   ! FileManager for ViewVoorraadPlanning
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:ViewVoorraadPlanning CLASS(RelationManager),TYPE ! RelationManager for ViewVoorraadPlanning
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:Cel      CLASS(FileManager),TYPE               ! FileManager for Cel
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


Hide:Relate:Cel      CLASS(RelationManager),TYPE           ! RelationManager for Cel
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:Mutatie  CLASS(FileManager),TYPE               ! FileManager for Mutatie
DeleteRecord           PROCEDURE(BYTE Query=1),BYTE,PROC,DERIVED
Init                   PROCEDURE(),DERIVED
Insert                 PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),DERIVED
PreInsert              PROCEDURE(SIGNED OpCode,UNSIGNED AddLen,*CSTRING ErrCode,*CSTRING ErrMsg),BYTE,DERIVED
PrimeFields            PROCEDURE(),PROC,DERIVED
TryInsert              PROCEDURE(),BYTE,PROC,DERIVED
TryUpdate              PROCEDURE(),BYTE,PROC,DERIVED
Update                 PROCEDURE(),BYTE,PROC,DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:Mutatie  CLASS(RelationManager),TYPE           ! RelationManager for Mutatie
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:Inkoop   CLASS(FileManager),TYPE               ! FileManager for Inkoop
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


Hide:Relate:Inkoop   CLASS(RelationManager),TYPE           ! RelationManager for Inkoop
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:Planning CLASS(FileManager),TYPE               ! FileManager for Planning
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


Hide:Relate:Planning CLASS(RelationManager),TYPE           ! RelationManager for Planning
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:Verkoop  CLASS(FileManager),TYPE               ! FileManager for Verkoop
DeleteRecord           PROCEDURE(BYTE Query=1),BYTE,PROC,DERIVED
Init                   PROCEDURE(),DERIVED
Insert                 PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),DERIVED
PreInsert              PROCEDURE(SIGNED OpCode,UNSIGNED AddLen,*CSTRING ErrCode,*CSTRING ErrMsg),BYTE,DERIVED
PrimeFields            PROCEDURE(),PROC,DERIVED
TryInsert              PROCEDURE(),BYTE,PROC,DERIVED
TryUpdate              PROCEDURE(),BYTE,PROC,DERIVED
Update                 PROCEDURE(),BYTE,PROC,DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:Verkoop  CLASS(RelationManager),TYPE           ! RelationManager for Verkoop
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:Sjabloon CLASS(FileManager),TYPE               ! FileManager for Sjabloon
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
PreInsert              PROCEDURE(SIGNED OpCode,UNSIGNED AddLen,*CSTRING ErrCode,*CSTRING ErrMsg),BYTE,DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
ValidateFieldServer    PROCEDURE(UNSIGNED Id,BYTE HandleErrors),BYTE,PROC,DERIVED
                     END


Hide:Relate:Sjabloon CLASS(RelationManager),TYPE           ! RelationManager for Sjabloon
Init                   PROCEDURE
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:ViewVoorraadCelTotaal CLASS(FileManager),TYPE  ! FileManager for ViewVoorraadCelTotaal
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:ViewVoorraadCelTotaal CLASS(RelationManager),TYPE ! RelationManager for ViewVoorraadCelTotaal
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:PlanningInkoop CLASS(FileManager),TYPE         ! FileManager for PlanningInkoop
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:PlanningInkoop CLASS(RelationManager),TYPE     ! RelationManager for PlanningInkoop
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:PlanningVerkoop CLASS(FileManager),TYPE        ! FileManager for PlanningVerkoop
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:PlanningVerkoop CLASS(RelationManager),TYPE    ! RelationManager for PlanningVerkoop
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:VoorraadVerloop CLASS(FileManager),TYPE        ! FileManager for VoorraadVerloop
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:VoorraadVerloop CLASS(RelationManager),TYPE    ! RelationManager for VoorraadVerloop
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:RelatieAdres CLASS(FileManager),TYPE           ! FileManager for RelatieAdres
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


Hide:Relate:RelatieAdres CLASS(RelationManager),TYPE       ! RelationManager for RelatieAdres
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:PalletMutatie CLASS(FileManager),TYPE          ! FileManager for PalletMutatie
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


Hide:Relate:PalletMutatie CLASS(RelationManager),TYPE      ! RelationManager for PalletMutatie
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:PalletVerloop CLASS(FileManager),TYPE          ! FileManager for PalletVerloop
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:PalletVerloop CLASS(RelationManager),TYPE      ! RelationManager for PalletVerloop
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:Transporteur CLASS(FileManager),TYPE           ! FileManager for Transporteur
DeleteRecord           PROCEDURE(BYTE Query=1),BYTE,PROC,DERIVED
Init                   PROCEDURE(),DERIVED
Insert                 PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),DERIVED
TryInsert              PROCEDURE(),BYTE,PROC,DERIVED
TryUpdate              PROCEDURE(),BYTE,PROC,DERIVED
Update                 PROCEDURE(),BYTE,PROC,DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:Transporteur CLASS(RelationManager),TYPE       ! RelationManager for Transporteur
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:ViewTransporteur CLASS(FileManager),TYPE       ! FileManager for ViewTransporteur
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:ViewTransporteur CLASS(RelationManager),TYPE   ! RelationManager for ViewTransporteur
Init                   PROCEDURE
Kill                   PROCEDURE(),DERIVED
                     END


_Hide:Access:ViewArtikel &Hide:Access:ViewArtikel,AUTO,THREAD
_Hide:Relate:ViewArtikel &Hide:Relate:ViewArtikel,AUTO,THREAD
_Hide:Access:Partij  &Hide:Access:Partij,AUTO,THREAD
_Hide:Relate:Partij  &Hide:Relate:Partij,AUTO,THREAD
_Hide:Access:Relatie &Hide:Access:Relatie,AUTO,THREAD
_Hide:Relate:Relatie &Hide:Relate:Relatie,AUTO,THREAD
_Hide:Access:Verpakking &Hide:Access:Verpakking,AUTO,THREAD
_Hide:Relate:Verpakking &Hide:Relate:Verpakking,AUTO,THREAD
_Hide:Access:ViewVoorraadPlanning &Hide:Access:ViewVoorraadPlanning,AUTO,THREAD
_Hide:Relate:ViewVoorraadPlanning &Hide:Relate:ViewVoorraadPlanning,AUTO,THREAD
_Hide:Access:Cel     &Hide:Access:Cel,AUTO,THREAD
_Hide:Relate:Cel     &Hide:Relate:Cel,AUTO,THREAD
_Hide:Access:Mutatie &Hide:Access:Mutatie,AUTO,THREAD
_Hide:Relate:Mutatie &Hide:Relate:Mutatie,AUTO,THREAD
_Hide:Access:Inkoop  &Hide:Access:Inkoop,AUTO,THREAD
_Hide:Relate:Inkoop  &Hide:Relate:Inkoop,AUTO,THREAD
_Hide:Access:Planning &Hide:Access:Planning,AUTO,THREAD
_Hide:Relate:Planning &Hide:Relate:Planning,AUTO,THREAD
_Hide:Access:Verkoop &Hide:Access:Verkoop,AUTO,THREAD
_Hide:Relate:Verkoop &Hide:Relate:Verkoop,AUTO,THREAD
_Hide:Access:Sjabloon &Hide:Access:Sjabloon,AUTO,THREAD
_Hide:Relate:Sjabloon &Hide:Relate:Sjabloon,AUTO,THREAD
_Hide:Access:ViewVoorraadCelTotaal &Hide:Access:ViewVoorraadCelTotaal,AUTO,THREAD
_Hide:Relate:ViewVoorraadCelTotaal &Hide:Relate:ViewVoorraadCelTotaal,AUTO,THREAD
_Hide:Access:PlanningInkoop &Hide:Access:PlanningInkoop,AUTO,THREAD
_Hide:Relate:PlanningInkoop &Hide:Relate:PlanningInkoop,AUTO,THREAD
_Hide:Access:PlanningVerkoop &Hide:Access:PlanningVerkoop,AUTO,THREAD
_Hide:Relate:PlanningVerkoop &Hide:Relate:PlanningVerkoop,AUTO,THREAD
_Hide:Access:VoorraadVerloop &Hide:Access:VoorraadVerloop,AUTO,THREAD
_Hide:Relate:VoorraadVerloop &Hide:Relate:VoorraadVerloop,AUTO,THREAD
_Hide:Access:RelatieAdres &Hide:Access:RelatieAdres,AUTO,THREAD
_Hide:Relate:RelatieAdres &Hide:Relate:RelatieAdres,AUTO,THREAD
_Hide:Access:PalletMutatie &Hide:Access:PalletMutatie,AUTO,THREAD
_Hide:Relate:PalletMutatie &Hide:Relate:PalletMutatie,AUTO,THREAD
_Hide:Access:PalletVerloop &Hide:Access:PalletVerloop,AUTO,THREAD
_Hide:Relate:PalletVerloop &Hide:Relate:PalletVerloop,AUTO,THREAD
_Hide:Access:Transporteur &Hide:Access:Transporteur,AUTO,THREAD
_Hide:Relate:Transporteur &Hide:Relate:Transporteur,AUTO,THREAD
_Hide:Access:ViewTransporteur &Hide:Access:ViewTransporteur,AUTO,THREAD
_Hide:Relate:ViewTransporteur &Hide:Relate:ViewTransporteur,AUTO,THREAD


VoorrDct_BC0:DctInit PROCEDURE()
  CODE
  _Hide:Access:ViewArtikel &= NEW(Hide:Access:ViewArtikel)
  _Hide:Relate:ViewArtikel &= NEW(Hide:Relate:ViewArtikel)
  _Hide:Access:Partij &= NEW(Hide:Access:Partij)
  _Hide:Relate:Partij &= NEW(Hide:Relate:Partij)
  _Hide:Access:Relatie &= NEW(Hide:Access:Relatie)
  _Hide:Relate:Relatie &= NEW(Hide:Relate:Relatie)
  _Hide:Access:Verpakking &= NEW(Hide:Access:Verpakking)
  _Hide:Relate:Verpakking &= NEW(Hide:Relate:Verpakking)
  _Hide:Access:ViewVoorraadPlanning &= NEW(Hide:Access:ViewVoorraadPlanning)
  _Hide:Relate:ViewVoorraadPlanning &= NEW(Hide:Relate:ViewVoorraadPlanning)
  _Hide:Access:Cel &= NEW(Hide:Access:Cel)
  _Hide:Relate:Cel &= NEW(Hide:Relate:Cel)
  _Hide:Access:Mutatie &= NEW(Hide:Access:Mutatie)
  _Hide:Relate:Mutatie &= NEW(Hide:Relate:Mutatie)
  _Hide:Access:Inkoop &= NEW(Hide:Access:Inkoop)
  _Hide:Relate:Inkoop &= NEW(Hide:Relate:Inkoop)
  _Hide:Access:Planning &= NEW(Hide:Access:Planning)
  _Hide:Relate:Planning &= NEW(Hide:Relate:Planning)
  _Hide:Access:Verkoop &= NEW(Hide:Access:Verkoop)
  _Hide:Relate:Verkoop &= NEW(Hide:Relate:Verkoop)
  _Hide:Access:Sjabloon &= NEW(Hide:Access:Sjabloon)
  _Hide:Relate:Sjabloon &= NEW(Hide:Relate:Sjabloon)
  _Hide:Access:ViewVoorraadCelTotaal &= NEW(Hide:Access:ViewVoorraadCelTotaal)
  _Hide:Relate:ViewVoorraadCelTotaal &= NEW(Hide:Relate:ViewVoorraadCelTotaal)
  _Hide:Access:PlanningInkoop &= NEW(Hide:Access:PlanningInkoop)
  _Hide:Relate:PlanningInkoop &= NEW(Hide:Relate:PlanningInkoop)
  _Hide:Access:PlanningVerkoop &= NEW(Hide:Access:PlanningVerkoop)
  _Hide:Relate:PlanningVerkoop &= NEW(Hide:Relate:PlanningVerkoop)
  _Hide:Access:VoorraadVerloop &= NEW(Hide:Access:VoorraadVerloop)
  _Hide:Relate:VoorraadVerloop &= NEW(Hide:Relate:VoorraadVerloop)
  _Hide:Access:RelatieAdres &= NEW(Hide:Access:RelatieAdres)
  _Hide:Relate:RelatieAdres &= NEW(Hide:Relate:RelatieAdres)
  _Hide:Access:PalletMutatie &= NEW(Hide:Access:PalletMutatie)
  _Hide:Relate:PalletMutatie &= NEW(Hide:Relate:PalletMutatie)
  _Hide:Access:PalletVerloop &= NEW(Hide:Access:PalletVerloop)
  _Hide:Relate:PalletVerloop &= NEW(Hide:Relate:PalletVerloop)
  _Hide:Access:Transporteur &= NEW(Hide:Access:Transporteur)
  _Hide:Relate:Transporteur &= NEW(Hide:Relate:Transporteur)
  _Hide:Access:ViewTransporteur &= NEW(Hide:Access:ViewTransporteur)
  _Hide:Relate:ViewTransporteur &= NEW(Hide:Relate:ViewTransporteur)
  Relate:ViewArtikel &= _Hide:Relate:ViewArtikel
  Relate:Partij &= _Hide:Relate:Partij
  Relate:Relatie &= _Hide:Relate:Relatie
  Relate:Verpakking &= _Hide:Relate:Verpakking
  Relate:ViewVoorraadPlanning &= _Hide:Relate:ViewVoorraadPlanning
  Relate:Cel &= _Hide:Relate:Cel
  Relate:Mutatie &= _Hide:Relate:Mutatie
  Relate:Inkoop &= _Hide:Relate:Inkoop
  Relate:Planning &= _Hide:Relate:Planning
  Relate:Verkoop &= _Hide:Relate:Verkoop
  Relate:Sjabloon &= _Hide:Relate:Sjabloon
  Relate:ViewVoorraadCelTotaal &= _Hide:Relate:ViewVoorraadCelTotaal
  Relate:PlanningInkoop &= _Hide:Relate:PlanningInkoop
  Relate:PlanningVerkoop &= _Hide:Relate:PlanningVerkoop
  Relate:VoorraadVerloop &= _Hide:Relate:VoorraadVerloop
  Relate:RelatieAdres &= _Hide:Relate:RelatieAdres
  Relate:PalletMutatie &= _Hide:Relate:PalletMutatie
  Relate:PalletVerloop &= _Hide:Relate:PalletVerloop
  Relate:Transporteur &= _Hide:Relate:Transporteur
  Relate:ViewTransporteur &= _Hide:Relate:ViewTransporteur


VoorrDct_BC0:FilesInit PROCEDURE()
  CODE
  _Hide:Relate:ViewArtikel.Init
  _Hide:Relate:Partij.Init
  _Hide:Relate:Relatie.Init
  _Hide:Relate:Verpakking.Init
  _Hide:Relate:ViewVoorraadPlanning.Init
  _Hide:Relate:Cel.Init
  _Hide:Relate:Mutatie.Init
  _Hide:Relate:Inkoop.Init
  _Hide:Relate:Planning.Init
  _Hide:Relate:Verkoop.Init
  _Hide:Relate:Sjabloon.Init
  _Hide:Relate:ViewVoorraadCelTotaal.Init
  _Hide:Relate:PlanningInkoop.Init
  _Hide:Relate:PlanningVerkoop.Init
  _Hide:Relate:VoorraadVerloop.Init
  _Hide:Relate:RelatieAdres.Init
  _Hide:Relate:PalletMutatie.Init
  _Hide:Relate:PalletVerloop.Init
  _Hide:Relate:Transporteur.Init
  _Hide:Relate:ViewTransporteur.Init


VoorrDct_BC0:DctKill PROCEDURE()
  CODE
  _Hide:Relate:ViewArtikel.Kill
  DISPOSE(_Hide:Relate:ViewArtikel)
  _Hide:Relate:Partij.Kill
  DISPOSE(_Hide:Relate:Partij)
  _Hide:Relate:Relatie.Kill
  DISPOSE(_Hide:Relate:Relatie)
  _Hide:Relate:Verpakking.Kill
  DISPOSE(_Hide:Relate:Verpakking)
  _Hide:Relate:ViewVoorraadPlanning.Kill
  DISPOSE(_Hide:Relate:ViewVoorraadPlanning)
  _Hide:Relate:Cel.Kill
  DISPOSE(_Hide:Relate:Cel)
  _Hide:Relate:Mutatie.Kill
  DISPOSE(_Hide:Relate:Mutatie)
  _Hide:Relate:Inkoop.Kill
  DISPOSE(_Hide:Relate:Inkoop)
  _Hide:Relate:Planning.Kill
  DISPOSE(_Hide:Relate:Planning)
  _Hide:Relate:Verkoop.Kill
  DISPOSE(_Hide:Relate:Verkoop)
  _Hide:Relate:Sjabloon.Kill
  DISPOSE(_Hide:Relate:Sjabloon)
  _Hide:Relate:ViewVoorraadCelTotaal.Kill
  DISPOSE(_Hide:Relate:ViewVoorraadCelTotaal)
  _Hide:Relate:PlanningInkoop.Kill
  DISPOSE(_Hide:Relate:PlanningInkoop)
  _Hide:Relate:PlanningVerkoop.Kill
  DISPOSE(_Hide:Relate:PlanningVerkoop)
  _Hide:Relate:VoorraadVerloop.Kill
  DISPOSE(_Hide:Relate:VoorraadVerloop)
  _Hide:Relate:RelatieAdres.Kill
  DISPOSE(_Hide:Relate:RelatieAdres)
  _Hide:Relate:PalletMutatie.Kill
  DISPOSE(_Hide:Relate:PalletMutatie)
  _Hide:Relate:PalletVerloop.Kill
  DISPOSE(_Hide:Relate:PalletVerloop)
  _Hide:Relate:Transporteur.Kill
  DISPOSE(_Hide:Relate:Transporteur)
  _Hide:Relate:ViewTransporteur.Kill
  DISPOSE(_Hide:Relate:ViewTransporteur)


Hide:Relate:ViewArtikel.Init PROCEDURE()
  CODE
  _Hide:Access:ViewArtikel.Init
  SELF.Init(Access:ViewArtikel,1)


Hide:Access:ViewArtikel.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= Art:Record
  SELF.FileNameValue = 'ViewArtikel'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= ViewArtikel
  PARENT.Init
  Access:ViewArtikel &= SELF
  SELF.LazyOpen = False


Hide:Access:ViewArtikel.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:ViewArtikel &= NULL                               ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:ViewArtikel.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(ViewArtikel,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(Art:Artikel_PK,'Art:Artikel_PK',0)
    SELF.AddKey(Art:Artikel_FK01,'Art:Artikel_FK01',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:ViewArtikel.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  DO AddRelations_2
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:Partij)

  SELF.AddRelation(Relate:ViewVoorraadPlanning)

  SELF.AddRelation(Relate:Planning)

  SELF.AddRelation(Relate:ViewVoorraadCelTotaal)

  SELF.AddRelation(Relate:PlanningInkoop)

  SELF.AddRelation(Relate:ViewVoorraadPartij)

  SELF.AddRelation(Relate:Mutatie)

  SELF.AddRelation(Relate:BulkOverboeking)

  SELF.AddRelation(Relate:CelArtikelVoorraad,RI:None,RI:None,CAV:FK2_CelArtikelVoorraad)
  SELF.AddRelationLink(Art:ArtikelID,CAV:ArtikelID)

  SELF.AddRelation(Relate:RelatieArtikelOmschrijving)

AddRelations_2 ROUTINE
  SELF.AddRelation(Relate:GNCodeArtikelen,RI:None,RI:None,GNA:GNCodeArtikelen_FK1)
  SELF.AddRelationLink(Art:ArtikelID,GNA:ArtikelID)


Hide:Relate:ViewArtikel.Kill PROCEDURE

  CODE
  _Hide:Access:ViewArtikel.Kill                            ! Kill the file manager
  PARENT.Kill
  Relate:ViewArtikel &= NULL                               ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:ViewArtikel)                        ! destroy the file manager


Hide:Relate:Partij.Init PROCEDURE()
  CODE
  _Hide:Access:Partij.Init
  SELF.Init(Access:Partij,1)


Hide:Access:Partij.DeleteRecord PROCEDURE(BYTE Query=1)

ReturnValue          BYTE,AUTO

  CODE
  GebruikerLogClass.Log('Delete', 'Partij', GebruikerLogClass.BepaalRecordContent(Par:Record))
  ReturnValue = PARENT.DeleteRecord(Query)
  RETURN ReturnValue


Hide:Access:Partij.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= Par:Record
  SELF.FileNameValue = 'Partij'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= Partij
  PARENT.Init
  Access:Partij &= SELF
  SELF.LazyOpen = False


Hide:Access:Partij.Insert PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GebruikerLogClass.Log('Insert', 'Partij', GebruikerLogClass.BepaalRecordContent(Par:Record))
  ReturnValue = PARENT.Insert()
  RETURN ReturnValue


Hide:Access:Partij.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:Partij &= NULL                                    ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:Partij.PreInsert PROCEDURE(SIGNED OpCode,UNSIGNED AddLen,*CSTRING ErrCode,*CSTRING ErrMsg)

ReturnValue          BYTE,AUTO

Buffer LIKE(Par:RECORD)
  CODE
  PUSHERRORS()
  IF SELF.SavePreviousBuffer AND NOT(SELF.PreviousBuffer &= NULL)
     Buffer = SELF.PreviousBuffer
  END
  Partij{PROP:ServerAutoInc}
  Partij{PROP:ServerAutoInc,1}=1 !Par:PartijID
  ReturnValue = PARENT.PreInsert(OpCode,AddLen,ErrCode,ErrMsg)
  POPERRORS()
  RETURN ReturnValue


Hide:Access:Partij.PrimeFields PROCEDURE

  CODE
  Par:InslagQATemperatuur1 = '-18'                         ! Assign initial field value
  PARENT.PrimeFields


Hide:Access:Partij.TryInsert PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GebruikerLogClass.Log('Insert', 'Partij', GebruikerLogClass.BepaalRecordContent(Par:Record))
  ReturnValue = PARENT.TryInsert()
  RETURN ReturnValue


Hide:Access:Partij.TryUpdate PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GebruikerLogClass.Log('Update', 'Partij', GebruikerLogClass.BepaalRecordContent(Par:Record))
  ReturnValue = PARENT.TryUpdate()
  RETURN ReturnValue


Hide:Access:Partij.Update PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GebruikerLogClass.Log('Update', 'Partij', GebruikerLogClass.BepaalRecordContent(Par:Record))
  ReturnValue = PARENT.Update()
  RETURN ReturnValue


Hide:Access:Partij.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

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
    SELF.Init(Partij,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(Par:Partij_FK02,'Par:Partij_FK02',0)
    SELF.AddKey(Par:Partij_FK03,'Par:Partij_FK03',0)
    SELF.AddKey(Par:Partij_FK01,'Par:Partij_FK01',0)
    SELF.AddKey(Par:Partij_PK,'Par:Partij_PK',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:Partij.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  DO AddRelations_2
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:ViewArtikel,RI:None,RI:None,Art:Artikel_PK)
  SELF.AddRelationLink(Par:ArtikelID,Art:ArtikelID)

  SELF.AddRelation(Relate:Relatie,RI:None,RI:None,Rel:Relatie_PK)
  SELF.AddRelationLink(Par:Leverancier,Rel:RelatieID)

  SELF.AddRelation(Relate:Verpakking,RI:None,RI:None,Ver:Verpakking_PK)
  SELF.AddRelationLink(Par:VerpakkingID,Ver:VerpakkingID)

  SELF.AddRelation(Relate:Cel,RI:None,RI:None,CEL:CEL_PK)
  SELF.AddRelationLink(Par:CELID,CEL:CelID)

  SELF.AddRelation(Relate:Mutatie)

  SELF.AddRelation(Relate:Planning)

  SELF.AddRelation(Relate:ACel,RI:None,RI:None,ACel:CEL_PK)
  SELF.AddRelationLink(Par:CELID,ACel:CelID)

  SELF.AddRelation(Relate:ARelatie,RI:None,RI:None,AREL:Relatie_PK)
  SELF.AddRelationLink(Par:Leverancier,AREL:RelatieID)

  SELF.AddRelation(Relate:AVerpakking,RI:None,RI:None,AVP:Verpakking_PK)
  SELF.AddRelationLink(Par:VerpakkingID,AVP:VerpakkingID)

  SELF.AddRelation(Relate:ViewVoorraadPartij,RI:None,RI:None,VVPar:PartijID_CelID_K)
  SELF.AddRelationLink(Par:PartijID,VVPar:PartijID)

AddRelations_2 ROUTINE
  SELF.AddRelation(Relate:PartijCelVoorraad,RI:None,RI:None,PCV:FK1_PartijCelVoorraad)
  SELF.AddRelationLink(Par:PartijID,PCV:PartijID)


Hide:Relate:Partij.Kill PROCEDURE

  CODE
  _Hide:Access:Partij.Kill                                 ! Kill the file manager
  PARENT.Kill
  Relate:Partij &= NULL                                    ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:Partij)                             ! destroy the file manager


Hide:Relate:Relatie.Init PROCEDURE()
  CODE
  _Hide:Access:Relatie.Init
  SELF.Init(Access:Relatie,1)


Hide:Access:Relatie.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= Rel:Record
  SELF.FileNameValue = 'Relatie'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= Relatie
  PARENT.Init
  Access:Relatie &= SELF
  SELF.LazyOpen = False


Hide:Access:Relatie.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:Relatie &= NULL                                   ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:Relatie.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(Relatie,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(Rel:Relatie_FK02,'Rel:Relatie_FK02',0)
    SELF.AddKey(Rel:Relatie_FK01,'Rel:Relatie_FK01',0)
    SELF.AddKey(Rel:Relatie_PK,'Rel:Relatie_PK',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:Relatie.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:Partij)

  SELF.AddRelation(Relate:Inkoop)

  SELF.AddRelation(Relate:PlanningInkoop)

  SELF.AddRelation(Relate:PlanningVerkoop)

  SELF.AddRelation(Relate:PalletMutatie,RI:CASCADE,RI:None,Pal:PalletMutatie_FK2)
  SELF.AddRelationLink(Rel:RelatieID,Pal:RelatieID)

  SELF.AddRelation(Relate:Transporteur)

  SELF.AddRelation(Relate:ArtikelOmschrijvingExtraGroep,RI:None,RI:None,Art3:PK_ArtikelOmschrijvingExtraGroep)
  SELF.AddRelationLink(Rel:ItemCode,Art3:ID)

  SELF.AddRelation(Relate:ViewPalletTegoeden,RI:None,RI:None,PTG:ViewPalletTegoeden_PK)
  SELF.AddRelationLink(Rel:RelatieID,PTG:RelatieID)

  SELF.AddRelation(Relate:RelatieArtikelOmschrijving,RI:None,RI:None,RAO:FK1_RelatieArtikelOmschrijving)
  SELF.AddRelationLink(Rel:RelatieID,RAO:RelatieID)


Hide:Relate:Relatie.Kill PROCEDURE

  CODE
  _Hide:Access:Relatie.Kill                                ! Kill the file manager
  PARENT.Kill
  Relate:Relatie &= NULL                                   ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:Relatie)                            ! destroy the file manager


Hide:Relate:Verpakking.Init PROCEDURE()
  CODE
  _Hide:Access:Verpakking.Init
  SELF.Init(Access:Verpakking,1)


Hide:Access:Verpakking.DeleteRecord PROCEDURE(BYTE Query=1)

ReturnValue          BYTE,AUTO

  CODE
  GebruikerLogClass.Log('Delete', 'Verpakking', GebruikerLogClass.BepaalRecordContent(Ver:Record))
  ReturnValue = PARENT.DeleteRecord(Query)
  RETURN ReturnValue


Hide:Access:Verpakking.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= Ver:Record
  SELF.FileNameValue = 'Verpakking'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= Verpakking
  PARENT.Init
  Access:Verpakking &= SELF
  SELF.LazyOpen = False


Hide:Access:Verpakking.Insert PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GebruikerLogClass.Log('Insert', 'Verpakking', GebruikerLogClass.BepaalRecordContent(Ver:Record))
  ReturnValue = PARENT.Insert()
  RETURN ReturnValue


Hide:Access:Verpakking.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:Verpakking &= NULL                                ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:Verpakking.PreInsert PROCEDURE(SIGNED OpCode,UNSIGNED AddLen,*CSTRING ErrCode,*CSTRING ErrMsg)

ReturnValue          BYTE,AUTO

Buffer LIKE(Ver:RECORD)
  CODE
  PUSHERRORS()
  IF SELF.SavePreviousBuffer AND NOT(SELF.PreviousBuffer &= NULL)
     Buffer = SELF.PreviousBuffer
  END
  Verpakking{PROP:ServerAutoInc}
  Verpakking{PROP:ServerAutoInc,1}=1 !Ver:VerpakkingID
  ReturnValue = PARENT.PreInsert(OpCode,AddLen,ErrCode,ErrMsg)
  POPERRORS()
  RETURN ReturnValue


Hide:Access:Verpakking.TryInsert PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GebruikerLogClass.Log('Insert', 'Verpakking', GebruikerLogClass.BepaalRecordContent(Ver:Record))
  ReturnValue = PARENT.TryInsert()
  RETURN ReturnValue


Hide:Access:Verpakking.TryUpdate PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GebruikerLogClass.Log('Update', 'Verpakking', GebruikerLogClass.BepaalRecordContent(Ver:Record))
  ReturnValue = PARENT.TryUpdate()
  RETURN ReturnValue


Hide:Access:Verpakking.Update PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GebruikerLogClass.Log('Update', 'Verpakking', GebruikerLogClass.BepaalRecordContent(Ver:Record))
  ReturnValue = PARENT.Update()
  RETURN ReturnValue


Hide:Access:Verpakking.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

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
    SELF.Init(Verpakking,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(Ver:Verpakking_PK,'Ver:Verpakking_PK',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:Verpakking.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:Partij)

  SELF.AddRelation(Relate:Planning)


Hide:Relate:Verpakking.Kill PROCEDURE

  CODE
  _Hide:Access:Verpakking.Kill                             ! Kill the file manager
  PARENT.Kill
  Relate:Verpakking &= NULL                                ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:Verpakking)                         ! destroy the file manager


Hide:Relate:ViewVoorraadPlanning.Init PROCEDURE()
  CODE
  _Hide:Access:ViewVoorraadPlanning.Init
  SELF.Init(Access:ViewVoorraadPlanning,1)


Hide:Access:ViewVoorraadPlanning.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= VVP:Record
  SELF.FileNameValue = 'ViewVoorraadPlanning'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= ViewVoorraadPlanning
  PARENT.Init
  Access:ViewVoorraadPlanning &= SELF
  SELF.LazyOpen = False


Hide:Access:ViewVoorraadPlanning.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:ViewVoorraadPlanning &= NULL                      ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:ViewVoorraadPlanning.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(ViewVoorraadPlanning,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(VVP:ViewVoorraad_PK,'VVP:ViewVoorraad_PK',0)
    SELF.AddKey(VVP:ViewVoorraad_FK2,'VVP:ViewVoorraad_FK2',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:ViewVoorraadPlanning.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:ViewArtikel,RI:None,RI:None,Art:Artikel_PK)
  SELF.AddRelationLink(VVP:ArtikelID,Art:ArtikelID)


Hide:Relate:ViewVoorraadPlanning.Kill PROCEDURE

  CODE
  _Hide:Access:ViewVoorraadPlanning.Kill                   ! Kill the file manager
  PARENT.Kill
  Relate:ViewVoorraadPlanning &= NULL                      ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:ViewVoorraadPlanning)               ! destroy the file manager


Hide:Relate:Cel.Init PROCEDURE()
  CODE
  _Hide:Access:Cel.Init
  SELF.Init(Access:Cel,1)


Hide:Access:Cel.DeleteRecord PROCEDURE(BYTE Query=1)

ReturnValue          BYTE,AUTO

  CODE
  GebruikerLogClass.Log('Delete', 'Cel', GebruikerLogClass.BepaalRecordContent(CEL:Record))
  ReturnValue = PARENT.DeleteRecord(Query)
  RETURN ReturnValue


Hide:Access:Cel.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= CEL:Record
  SELF.FileNameValue = 'Cel'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= Cel
  PARENT.Init
  Access:Cel &= SELF
  SELF.LazyOpen = False


Hide:Access:Cel.Insert PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GebruikerLogClass.Log('Insert', 'Cel', GebruikerLogClass.BepaalRecordContent(CEL:Record))
  ReturnValue = PARENT.Insert()
  RETURN ReturnValue


Hide:Access:Cel.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:Cel &= NULL                                       ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:Cel.PreInsert PROCEDURE(SIGNED OpCode,UNSIGNED AddLen,*CSTRING ErrCode,*CSTRING ErrMsg)

ReturnValue          BYTE,AUTO

Buffer LIKE(CEL:RECORD)
  CODE
  PUSHERRORS()
  IF SELF.SavePreviousBuffer AND NOT(SELF.PreviousBuffer &= NULL)
     Buffer = SELF.PreviousBuffer
  END
  Cel{PROP:ServerAutoInc}
  Cel{PROP:ServerAutoInc,1}=1 !CEL:CelID
  ReturnValue = PARENT.PreInsert(OpCode,AddLen,ErrCode,ErrMsg)
  POPERRORS()
  RETURN ReturnValue


Hide:Access:Cel.TryInsert PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GebruikerLogClass.Log('Insert', 'Cel', GebruikerLogClass.BepaalRecordContent(CEL:Record))
  ReturnValue = PARENT.TryInsert()
  RETURN ReturnValue


Hide:Access:Cel.TryUpdate PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GebruikerLogClass.Log('Update', 'Cel', GebruikerLogClass.BepaalRecordContent(CEL:Record))
  ReturnValue = PARENT.TryUpdate()
  RETURN ReturnValue


Hide:Access:Cel.Update PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GebruikerLogClass.Log('Update', 'Cel', GebruikerLogClass.BepaalRecordContent(CEL:Record))
  ReturnValue = PARENT.Update()
  RETURN ReturnValue


Hide:Access:Cel.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

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
    SELF.Init(Cel,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(CEL:CEL_PK,'CEL:CEL_PK',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:Cel.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:Partij)

  SELF.AddRelation(Relate:Planning)

  SELF.AddRelation(Relate:Mutatie)

  SELF.AddRelation(Relate:ViewVoorraadPartij)

  SELF.AddRelation(Relate:VoorraadVerloop)

  SELF.AddRelation(Relate:ViewVoorraadCelTotaal)

  SELF.AddRelation(Relate:BulkOverboeking)

  SELF.AddRelation(Relate:CelLocatie,RI:CASCADE,RI:RESTRICT,CL:FK_CelLocatie)
  SELF.AddRelationLink(CEL:CelID,CL:CelID)

  SELF.AddRelation(Relate:CelArtikelVoorraad,RI:None,RI:None,CAV:FK1_CelArtikelVoorraad)
  SELF.AddRelationLink(CEL:CelID,CAV:CelID)

  SELF.AddRelation(Relate:PartijCelVoorraad,RI:None,RI:None,PCV:FK2_PartijCelVoorraad)
  SELF.AddRelationLink(CEL:CelID,PCV:CelID)


Hide:Relate:Cel.Kill PROCEDURE

  CODE
  _Hide:Access:Cel.Kill                                    ! Kill the file manager
  PARENT.Kill
  Relate:Cel &= NULL                                       ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:Cel)                                ! destroy the file manager


Hide:Relate:Mutatie.Init PROCEDURE()
  CODE
  _Hide:Access:Mutatie.Init
  SELF.Init(Access:Mutatie,1)


Hide:Access:Mutatie.DeleteRecord PROCEDURE(BYTE Query=1)

ReturnValue          BYTE,AUTO

  CODE
  GebruikerLogClass.Log('Delete', 'Mutatie', GebruikerLogClass.BepaalRecordContent(Mut:Record))
  ReturnValue = PARENT.DeleteRecord(Query)
  RETURN ReturnValue


Hide:Access:Mutatie.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= Mut:Record
  SELF.FileNameValue = 'Mutatie'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= Mutatie
  PARENT.Init
  Access:Mutatie &= SELF
  SELF.LazyOpen = False


Hide:Access:Mutatie.Insert PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GebruikerLogClass.Log('Insert', 'Mutatie', GebruikerLogClass.BepaalRecordContent(Mut:Record))
  ReturnValue = PARENT.Insert()
  RETURN ReturnValue


Hide:Access:Mutatie.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:Mutatie &= NULL                                   ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:Mutatie.PreInsert PROCEDURE(SIGNED OpCode,UNSIGNED AddLen,*CSTRING ErrCode,*CSTRING ErrMsg)

ReturnValue          BYTE,AUTO

Buffer LIKE(Mut:RECORD)
  CODE
  PUSHERRORS()
  IF SELF.SavePreviousBuffer AND NOT(SELF.PreviousBuffer &= NULL)
     Buffer = SELF.PreviousBuffer
  END
  Mutatie{PROP:ServerAutoInc}
  Mutatie{PROP:ServerAutoInc,1}=1 !Mut:MutatieID
  ReturnValue = PARENT.PreInsert(OpCode,AddLen,ErrCode,ErrMsg)
  POPERRORS()
  RETURN ReturnValue


Hide:Access:Mutatie.PrimeFields PROCEDURE

  CODE
  Mut:DatumTijd_DATE = TODAY()                             ! Assign initial field value
  Mut:DatumTijd_TIME = CLOCK()                             ! Assign initial field value
  PARENT.PrimeFields


Hide:Access:Mutatie.TryInsert PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GebruikerLogClass.Log('Insert', 'Mutatie', GebruikerLogClass.BepaalRecordContent(Mut:Record))
  ReturnValue = PARENT.TryInsert()
  RETURN ReturnValue


Hide:Access:Mutatie.TryUpdate PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GebruikerLogClass.Log('Update', 'Mutatie', GebruikerLogClass.BepaalRecordContent(Mut:Record))
  ReturnValue = PARENT.TryUpdate()
  RETURN ReturnValue


Hide:Access:Mutatie.Update PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GebruikerLogClass.Log('Update', 'Mutatie', GebruikerLogClass.BepaalRecordContent(Mut:Record))
  ReturnValue = PARENT.Update()
  RETURN ReturnValue


Hide:Access:Mutatie.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

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
    SELF.Init(Mutatie,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(Mut:Mutatie_PK,'Mut:Mutatie_PK',0)
    SELF.AddKey(Mut:Mutatie_FK01,'Mut:Mutatie_FK01',0)
    SELF.AddKey(Mut:Mutatie_FK02,'Mut:Mutatie_FK02',0)
    SELF.AddKey(Mut:Mutatie_FK03,'Op ArtikelID/DatumTijd',0)
    SELF.AddKey(Mut:Mutatie_FK04,'Mut:Mutatie_FK04',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:Mutatie.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:Partij,RI:None,RI:None,Par:Partij_PK)
  SELF.AddRelationLink(Mut:PartijID,Par:PartijID)

  SELF.AddRelation(Relate:ACel,RI:None,RI:None,ACel:CEL_PK)
  SELF.AddRelationLink(Mut:CelID,ACel:CelID)

  SELF.AddRelation(Relate:Cel,RI:None,RI:None,CEL:CEL_PK)
  SELF.AddRelationLink(Mut:CelID,CEL:CelID)

  SELF.AddRelation(Relate:AACel,RI:None,RI:None,AACel:CEL_PK)
  SELF.AddRelationLink(Mut:NaarCELID,AACel:CelID)

  SELF.AddRelation(Relate:Planning)

  SELF.AddRelation(Relate:ViewArtikel,RI:None,RI:None,Art:Artikel_PK)
  SELF.AddRelationLink(Mut:ArtikelID,Art:ArtikelID)

  SELF.AddRelation(Relate:CelLocatie,RI:None,RI:None,CL:PK_CelLocatie)
  SELF.AddRelationLink(Mut:CelLocatieID,CL:CelLocatieID)


Hide:Relate:Mutatie.Kill PROCEDURE

  CODE
  _Hide:Access:Mutatie.Kill                                ! Kill the file manager
  PARENT.Kill
  Relate:Mutatie &= NULL                                   ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:Mutatie)                            ! destroy the file manager


Hide:Relate:Inkoop.Init PROCEDURE()
  CODE
  _Hide:Access:Inkoop.Init
  SELF.Init(Access:Inkoop,1)


Hide:Access:Inkoop.DeleteRecord PROCEDURE(BYTE Query=1)

ReturnValue          BYTE,AUTO

  CODE
  GebruikerLogClass.Log('Delete', 'Inkoop', GebruikerLogClass.BepaalRecordContent(Ink:Record))
  ReturnValue = PARENT.DeleteRecord(Query)
  RETURN ReturnValue


Hide:Access:Inkoop.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= Ink:Record
  SELF.FileNameValue = 'Inkoop'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= Inkoop
  PARENT.Init
  Access:Inkoop &= SELF
  SELF.LazyOpen = False


Hide:Access:Inkoop.Insert PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GebruikerLogClass.Log('Insert', 'Inkoop', GebruikerLogClass.BepaalRecordContent(Ink:Record))
  ReturnValue = PARENT.Insert()
  RETURN ReturnValue


Hide:Access:Inkoop.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:Inkoop &= NULL                                    ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:Inkoop.PreInsert PROCEDURE(SIGNED OpCode,UNSIGNED AddLen,*CSTRING ErrCode,*CSTRING ErrMsg)

ReturnValue          BYTE,AUTO

Buffer LIKE(Ink:RECORD)
  CODE
  PUSHERRORS()
  IF SELF.SavePreviousBuffer AND NOT(SELF.PreviousBuffer &= NULL)
     Buffer = SELF.PreviousBuffer
  END
  Inkoop{PROP:ServerAutoInc}
  Inkoop{PROP:ServerAutoInc,1}=1 !Ink:InkoopID
  ReturnValue = PARENT.PreInsert(OpCode,AddLen,ErrCode,ErrMsg)
  POPERRORS()
  RETURN ReturnValue


Hide:Access:Inkoop.TryInsert PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GebruikerLogClass.Log('Insert', 'Inkoop', GebruikerLogClass.BepaalRecordContent(Ink:Record))
  ReturnValue = PARENT.TryInsert()
  RETURN ReturnValue


Hide:Access:Inkoop.TryUpdate PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GebruikerLogClass.Log('Update', 'Inkoop', GebruikerLogClass.BepaalRecordContent(Ink:Record))
  ReturnValue = PARENT.TryUpdate()
  RETURN ReturnValue


Hide:Access:Inkoop.Update PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GebruikerLogClass.Log('Update', 'Inkoop', GebruikerLogClass.BepaalRecordContent(Ink:Record))
  ReturnValue = PARENT.Update()
  RETURN ReturnValue


Hide:Access:Inkoop.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

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
    SELF.Init(Inkoop,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(Ink:PK_Inkoop,'Ink:PK_Inkoop',0)
    SELF.AddKey(Ink:Inkoop_FK01,'Op Planning',0)
    SELF.AddKey(Ink:Verwerkt_InkoopID_K,'Ink:Verwerkt_InkoopID_K',0)
    SELF.AddKey(Ink:Verwerkt_InkoopIDD_K,'Ink:Verwerkt_InkoopIDD_K',0)
    SELF.AddKey(Ink:Verwerkt_Planning_K,'Ink:Verwerkt_Planning_K',0)
    SELF.AddKey(Ink:Verwerkt_PlanningD_K,'Ink:Verwerkt_PlanningD_K',0)
    SELF.AddKey(Ink:Leverancier_Verwerkt_Planning_K,'Ink:Leverancier_Verwerkt_Planning_K',0)
    SELF.AddKey(Ink:Leverancier_Verwerkt_PlanningD_K,'Ink:Leverancier_Verwerkt_PlanningD_K',0)
    SELF.AddKey(Ink:LeverancierAlternatiefAdres_K,'Ink:LeverancierAlternatiefAdres_K',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:Inkoop.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:Planning,RI:CASCADE,RI:CASCADE,Pla:Planning_FK01)
  SELF.AddRelationLink(Ink:InkoopID,Pla:InkoopID)

  SELF.AddRelation(Relate:Relatie,RI:None,RI:None,Rel:Relatie_PK)
  SELF.AddRelationLink(Ink:Leverancier,Rel:RelatieID)

  SELF.AddRelation(Relate:PlanningInkoop)

  SELF.AddRelation(Relate:RelatieAdres)


Hide:Relate:Inkoop.Kill PROCEDURE

  CODE
  _Hide:Access:Inkoop.Kill                                 ! Kill the file manager
  PARENT.Kill
  Relate:Inkoop &= NULL                                    ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:Inkoop)                             ! destroy the file manager


Hide:Relate:Planning.Init PROCEDURE()
  CODE
  _Hide:Access:Planning.Init
  SELF.Init(Access:Planning,1)


Hide:Access:Planning.DeleteRecord PROCEDURE(BYTE Query=1)

ReturnValue          BYTE,AUTO

  CODE
  GebruikerLogClass.Log('Delete', 'Planning', GebruikerLogClass.BepaalRecordContent(Pla:Record))
  ReturnValue = PARENT.DeleteRecord(Query)
  RETURN ReturnValue


Hide:Access:Planning.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= Pla:Record
  SELF.FileNameValue = 'Planning'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= Planning
  PARENT.Init
  Access:Planning &= SELF
  SELF.LazyOpen = False


Hide:Access:Planning.Insert PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GebruikerLogClass.Log('Insert', 'Planning', GebruikerLogClass.BepaalRecordContent(Pla:Record))
  ReturnValue = PARENT.Insert()
  RETURN ReturnValue


Hide:Access:Planning.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:Planning &= NULL                                  ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:Planning.PreInsert PROCEDURE(SIGNED OpCode,UNSIGNED AddLen,*CSTRING ErrCode,*CSTRING ErrMsg)

ReturnValue          BYTE,AUTO

Buffer LIKE(Pla:RECORD)
  CODE
  PUSHERRORS()
  IF SELF.SavePreviousBuffer AND NOT(SELF.PreviousBuffer &= NULL)
     Buffer = SELF.PreviousBuffer
  END
  Planning{PROP:ServerAutoInc}
  Planning{PROP:ServerAutoInc,1}=1 !Pla:PlanningID
  ReturnValue = PARENT.PreInsert(OpCode,AddLen,ErrCode,ErrMsg)
  POPERRORS()
  RETURN ReturnValue


Hide:Access:Planning.TryInsert PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GebruikerLogClass.Log('Insert', 'Planning', GebruikerLogClass.BepaalRecordContent(Pla:Record))
  ReturnValue = PARENT.TryInsert()
  RETURN ReturnValue


Hide:Access:Planning.TryUpdate PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GebruikerLogClass.Log('Update', 'Planning', GebruikerLogClass.BepaalRecordContent(Pla:Record))
  ReturnValue = PARENT.TryUpdate()
  RETURN ReturnValue


Hide:Access:Planning.Update PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GebruikerLogClass.Log('Update', 'Planning', GebruikerLogClass.BepaalRecordContent(Pla:Record))
  ReturnValue = PARENT.Update()
  RETURN ReturnValue


Hide:Access:Planning.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

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
    SELF.Init(Planning,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(Pla:Datum_Tijd_K,'Pla:Datum_Tijd_K',0)
    SELF.AddKey(Pla:OverboekingCelID_Planning_K,'Pla:OverboekingCelID_Planning_K',0)
    SELF.AddKey(Pla:PK_Planning,'Pla:PK_Planning',0)
    SELF.AddKey(Pla:Planning_FK01,'Op InkoopID/Planning',0)
    SELF.AddKey(Pla:Planning_FK02,'Op VerkoopID. PlanningID',0)
    SELF.AddKey(Pla:Planning_FK03,'Op Planning',0)
    SELF.AddKey(Pla:Verwerkt_Artikel_Planning_K,'Pla:Verwerkt_Artikel_Planning_K',0)
    SELF.AddKey(Pla:Verwerkt_OverboekingCelID_Planning_K,'Pla:Verwerkt_OverboekingCelID_Planning_K',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:Planning.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  DO AddRelations_2
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:Inkoop)

  SELF.AddRelation(Relate:ViewArtikel,RI:None,RI:None,Art:Artikel_PK)
  SELF.AddRelationLink(Pla:ArtikelID,Art:ArtikelID)

  SELF.AddRelation(Relate:Verpakking,RI:None,RI:None,Ver:Verpakking_PK)
  SELF.AddRelationLink(Pla:VerpakkingID,Ver:VerpakkingID)

  SELF.AddRelation(Relate:Cel,RI:None,RI:None,CEL:CEL_PK)
  SELF.AddRelationLink(Pla:CelID,CEL:CelID)

  SELF.AddRelation(Relate:Verkoop)

  SELF.AddRelation(Relate:ACel,RI:None,RI:None,ACel:CEL_PK)
  SELF.AddRelationLink(Pla:OverboekingCelID,ACel:CelID)

  SELF.AddRelation(Relate:AARelatie,RI:None,RI:None,AARel:Relatie_PK)
  SELF.AddRelationLink(Pla:Leverancier,AARel:RelatieID)

  SELF.AddRelation(Relate:PlanningVerkoop)

  SELF.AddRelation(Relate:PlanningInkoop)

  SELF.AddRelation(Relate:Partij,RI:None,RI:None,Par:Partij_PK)
  SELF.AddRelationLink(Pla:PartijID,Par:PartijID)

AddRelations_2 ROUTINE
  SELF.AddRelation(Relate:Mutatie,RI:None,RI:None,Mut:Mutatie_FK02)
  SELF.AddRelationLink(Pla:PlanningID,Mut:PlanningID)

  SELF.AddRelation(Relate:PalletMutatie,RI:CASCADE,RI:None,Pal:PalletMutatie_FK3)
  SELF.AddRelationLink(Pla:PlanningID,Pal:PlanningID)

  SELF.AddRelation(Relate:OverboekingRitRegel)

  SELF.AddRelation(Relate:BulkOverboeking,RI:None,RI:None,BOV:FK1_BulkOverboeking)
  SELF.AddRelationLink(Pla:PlanningID,BOV:PlanningID)

  SELF.AddRelation(Relate:AInkoop,RI:None,RI:None,AInk:PK_Inkoop)
  SELF.AddRelationLink(Pla:InkoopID,AInk:InkoopID)

  SELF.AddRelation(Relate:AAViewArtikel,RI:None,RI:None,AAArt:Artikel_PK)
  SELF.AddRelationLink(Pla:ArtikelID,AAArt:ArtikelID)

  SELF.AddRelation(Relate:AViewArtikel,RI:None,RI:None,AArt:Artikel_PK)
  SELF.AddRelationLink(Pla:ArtikelID,AArt:ArtikelID)

  SELF.AddRelation(Relate:CelLocatie,RI:None,RI:None,CL:PK_CelLocatie)
  SELF.AddRelationLink(Pla:CelLocatieID,CL:CelLocatieID)

  SELF.AddRelation(Relate:Activiteit,RI:None,RI:None,ACT:FK1_Activiteit)
  SELF.AddRelationLink(Pla:PlanningID,ACT:PlanningID)

  SELF.AddRelation(Relate:ACelLocatie,RI:None,RI:None,ACL:PK_CelLocatie)
  SELF.AddRelationLink(Pla:OverboekCelLocatieID,ACL:CelLocatieID)


Hide:Relate:Planning.Kill PROCEDURE

  CODE
  _Hide:Access:Planning.Kill                               ! Kill the file manager
  PARENT.Kill
  Relate:Planning &= NULL                                  ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:Planning)                           ! destroy the file manager


Hide:Relate:Verkoop.Init PROCEDURE()
  CODE
  _Hide:Access:Verkoop.Init
  SELF.Init(Access:Verkoop,1)


Hide:Access:Verkoop.DeleteRecord PROCEDURE(BYTE Query=1)

ReturnValue          BYTE,AUTO

  CODE
  GebruikerLogClass.Log('Delete', 'Verkoop', GebruikerLogClass.BepaalRecordContent(Ver2:Record))
  ReturnValue = PARENT.DeleteRecord(Query)
  RETURN ReturnValue


Hide:Access:Verkoop.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= Ver2:Record
  SELF.FileNameValue = 'Verkoop'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= Verkoop
  PARENT.Init
  Access:Verkoop &= SELF
  SELF.LazyOpen = False


Hide:Access:Verkoop.Insert PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GebruikerLogClass.Log('Insert', 'Verkoop', GebruikerLogClass.BepaalRecordContent(Ver2:Record))
  ReturnValue = PARENT.Insert()
  RETURN ReturnValue


Hide:Access:Verkoop.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:Verkoop &= NULL                                   ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:Verkoop.PreInsert PROCEDURE(SIGNED OpCode,UNSIGNED AddLen,*CSTRING ErrCode,*CSTRING ErrMsg)

ReturnValue          BYTE,AUTO

Buffer LIKE(Ver2:RECORD)
  CODE
  PUSHERRORS()
  IF SELF.SavePreviousBuffer AND NOT(SELF.PreviousBuffer &= NULL)
     Buffer = SELF.PreviousBuffer
  END
  Verkoop{PROP:ServerAutoInc}
  Verkoop{PROP:ServerAutoInc,1}=1 !Ver2:VerkoopID
  ReturnValue = PARENT.PreInsert(OpCode,AddLen,ErrCode,ErrMsg)
  POPERRORS()
  RETURN ReturnValue


Hide:Access:Verkoop.PrimeFields PROCEDURE

  CODE
  Ver2:Valuta = 'Euro'                                     ! Assign initial field value
  Ver2:Koersverschil = 1                                   ! Assign initial field value
  PARENT.PrimeFields


Hide:Access:Verkoop.TryInsert PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GebruikerLogClass.Log('Insert', 'Verkoop', GebruikerLogClass.BepaalRecordContent(Ver2:Record))
  ReturnValue = PARENT.TryInsert()
  RETURN ReturnValue


Hide:Access:Verkoop.TryUpdate PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GebruikerLogClass.Log('Update', 'Verkoop', GebruikerLogClass.BepaalRecordContent(Ver2:Record))
  ReturnValue = PARENT.TryUpdate()
  RETURN ReturnValue


Hide:Access:Verkoop.Update PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GebruikerLogClass.Log('Update', 'Verkoop', GebruikerLogClass.BepaalRecordContent(Ver2:Record))
  ReturnValue = PARENT.Update()
  RETURN ReturnValue


Hide:Access:Verkoop.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

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
    SELF.Init(Verkoop,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(Ver2:Verkoop_FK2,'Op Exported/VerkoopID',0)
    SELF.AddKey(Ver2:Verkoop_FK3,'Op Exported, Klant, Verkoop',0)
    SELF.AddKey(Ver2:PK_Verkoop,'Ver2:PK_Verkoop',0)
    SELF.AddKey(Ver2:Verkoop_FK01,'Ver2:Verkoop_FK01',0)
    SELF.AddKey(Ver2:Klant_Verwerkt_Planning_K,'Ver2:Klant_Verwerkt_Planning_K',0)
    SELF.AddKey(Ver2:Klant_Verwerkt_PlanningD_K,'Ver2:Klant_Verwerkt_PlanningD_K',0)
    SELF.AddKey(Ver2:Verwerkt_VerkoopID_K,'Ver2:Verwerkt_VerkoopID_K',0)
    SELF.AddKey(Ver2:Verwerkt_VerkoopIDD_K,'Ver2:Verwerkt_VerkoopIDD_K',0)
    SELF.AddKey(Ver2:Verwerkt_Planning_K,'Ver2:Verwerkt_Planning_K',0)
    SELF.AddKey(Ver2:Verwerkt_PlanningD_K,'Ver2:Verwerkt_PlanningD_K',0)
    SELF.AddKey(Ver2:KlantAlternatiefAdres_K,'Ver2:KlantAlternatiefAdres_K',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:Verkoop.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:Planning,RI:CASCADE,RI:CASCADE,Pla:Planning_FK02)
  SELF.AddRelationLink(Ver2:VerkoopID,Pla:VerkoopID)

  SELF.AddRelation(Relate:ARelatie,RI:None,RI:None,AREL:Relatie_PK)
  SELF.AddRelationLink(Ver2:Klant,AREL:RelatieID)

  SELF.AddRelation(Relate:PlanningVerkoop)

  SELF.AddRelation(Relate:RelatieAdres)

  SELF.AddRelation(Relate:AAARelatie,RI:None,RI:None,AAARel:Relatie_PK)
  SELF.AddRelationLink(Ver2:Klant,AAARel:RelatieID)

  SELF.AddRelation(Relate:PalletMutatie)


Hide:Relate:Verkoop.Kill PROCEDURE

  CODE
  _Hide:Access:Verkoop.Kill                                ! Kill the file manager
  PARENT.Kill
  Relate:Verkoop &= NULL                                   ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:Verkoop)                            ! destroy the file manager


Hide:Relate:Sjabloon.Init PROCEDURE()
  CODE
  _Hide:Access:Sjabloon.Init
  SELF.Init(Access:Sjabloon,1)


Hide:Access:Sjabloon.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= Sja:Record
  SELF.FileNameValue = 'Sjabloon'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= Sjabloon
  PARENT.Init
  Access:Sjabloon &= SELF
  SELF.LazyOpen = False


Hide:Access:Sjabloon.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:Sjabloon &= NULL                                  ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:Sjabloon.PreInsert PROCEDURE(SIGNED OpCode,UNSIGNED AddLen,*CSTRING ErrCode,*CSTRING ErrMsg)

ReturnValue          BYTE,AUTO

Buffer LIKE(Sja:RECORD)
  CODE
  PUSHERRORS()
  IF SELF.SavePreviousBuffer AND NOT(SELF.PreviousBuffer &= NULL)
     Buffer = SELF.PreviousBuffer
  END
  Sjabloon{PROP:ServerAutoInc}
  Sjabloon{PROP:ServerAutoInc,1}=1 !Sja:SjabloonID
  ReturnValue = PARENT.PreInsert(OpCode,AddLen,ErrCode,ErrMsg)
  POPERRORS()
  RETURN ReturnValue


Hide:Access:Sjabloon.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

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
    SELF.Init(Sjabloon,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(Sja:Sjabloon_PK,'Sja:Sjabloon_PK',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Access:Sjabloon.ValidateFieldServer PROCEDURE(UNSIGNED Id,BYTE HandleErrors)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.ValidateFieldServer(Id,HandleErrors)
  CASE Id
  OF 3
    GlobalErrors.SetField('Sja:SoortSjabloon')
    IF INSTRING(']' & CLIP(Sja:SoortSjabloon) & '[', ']W[]E[', 1, 1) = 0
      ReturnValue = Level:Notify
    END
    IF ReturnValue <> Level:Benign
      IF HandleErrors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldNotInList,'''Word'',''Excel''')
      END
    END
  END
  RETURN ReturnValue


Hide:Relate:Sjabloon.Kill PROCEDURE

  CODE
  _Hide:Access:Sjabloon.Kill                               ! Kill the file manager
  PARENT.Kill
  Relate:Sjabloon &= NULL                                  ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:Sjabloon)                           ! destroy the file manager


Hide:Relate:ViewVoorraadCelTotaal.Init PROCEDURE()
  CODE
  _Hide:Access:ViewVoorraadCelTotaal.Init
  SELF.Init(Access:ViewVoorraadCelTotaal,1)


Hide:Access:ViewVoorraadCelTotaal.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= VVCT:Record
  SELF.FileNameValue = 'ViewVoorraadCelTotaal'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= ViewVoorraadCelTotaal
  PARENT.Init
  Access:ViewVoorraadCelTotaal &= SELF
  SELF.LazyOpen = False


Hide:Access:ViewVoorraadCelTotaal.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:ViewVoorraadCelTotaal &= NULL                     ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:ViewVoorraadCelTotaal.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(ViewVoorraadCelTotaal,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(VVCT:ViewVoorraadCelTotaal_PK,'VVCT:ViewVoorraadCelTotaal_PK',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:ViewVoorraadCelTotaal.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:ViewArtikel,RI:None,RI:None,Art:Artikel_PK)
  SELF.AddRelationLink(VVCT:ArtikelID,Art:ArtikelID)

  SELF.AddRelation(Relate:ACel,RI:None,RI:None,ACel:CEL_PK)
  SELF.AddRelationLink(VVCT:CeliD,ACel:CelID)

  SELF.AddRelation(Relate:Cel,RI:None,RI:None,CEL:CEL_PK)
  SELF.AddRelationLink(VVCT:CeliD,CEL:CelID)


Hide:Relate:ViewVoorraadCelTotaal.Kill PROCEDURE

  CODE
  _Hide:Access:ViewVoorraadCelTotaal.Kill                  ! Kill the file manager
  PARENT.Kill
  Relate:ViewVoorraadCelTotaal &= NULL                     ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:ViewVoorraadCelTotaal)              ! destroy the file manager


Hide:Relate:PlanningInkoop.Init PROCEDURE()
  CODE
  _Hide:Access:PlanningInkoop.Init
  SELF.Init(Access:PlanningInkoop,1)


Hide:Access:PlanningInkoop.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= Pla2:Record
  SELF.FileNameValue = 'PlanningInkoop'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= PlanningInkoop
  PARENT.Init
  Access:PlanningInkoop &= SELF
  SELF.LazyOpen = False


Hide:Access:PlanningInkoop.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:PlanningInkoop &= NULL                            ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:PlanningInkoop.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(PlanningInkoop,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(Pla2:Planning_K,'Pla2:Planning_K',0)
    SELF.AddKey(Pla2:PlanningID_K,'Pla2:PlanningID_K',0)
    SELF.AddKey(Pla2:Planning_FirmaNaam_K,'Pla2:Planning_FirmaNaam_K',0)
    SELF.AddKey(Pla2:Verwerkt_Planning_FirmaNaam_K,'Pla2:Verwerkt_Planning_FirmaNaam_K',0)
    SELF.AddKey(Pla2:Verwerkt_Planning_K,'Pla2:Verwerkt_Planning_K',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:PlanningInkoop.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:Relatie,RI:None,RI:None,Rel:Relatie_PK)
  SELF.AddRelationLink(Pla2:Leverancier,Rel:RelatieID)

  SELF.AddRelation(Relate:ViewArtikel,RI:None,RI:None,Art:Artikel_PK)
  SELF.AddRelationLink(Pla2:ArtikelID,Art:ArtikelID)

  SELF.AddRelation(Relate:ARelatie,RI:None,RI:None,AREL:Relatie_PK)
  SELF.AddRelationLink(Pla2:Leverancier,AREL:RelatieID)

  SELF.AddRelation(Relate:AViewArtikel,RI:None,RI:None,AArt:Artikel_PK)
  SELF.AddRelationLink(Pla2:ArtikelID,AArt:ArtikelID)

  SELF.AddRelation(Relate:Inkoop,RI:None,RI:None,Ink:PK_Inkoop)
  SELF.AddRelationLink(Pla2:InkoopID,Ink:InkoopID)

  SELF.AddRelation(Relate:Planning,RI:None,RI:None,Pla:PK_Planning)
  SELF.AddRelationLink(Pla2:PlanningID,Pla:PlanningID)

  SELF.AddRelation(Relate:AAPlanning,RI:None,RI:None,AAPla:PK_Planning)
  SELF.AddRelationLink(Pla2:PlanningID,AAPla:PlanningID)

  SELF.AddRelation(Relate:APlanning,RI:None,RI:None,APla:PK_Planning)
  SELF.AddRelationLink(Pla2:PlanningID,APla:PlanningID)


Hide:Relate:PlanningInkoop.Kill PROCEDURE

  CODE
  _Hide:Access:PlanningInkoop.Kill                         ! Kill the file manager
  PARENT.Kill
  Relate:PlanningInkoop &= NULL                            ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:PlanningInkoop)                     ! destroy the file manager


Hide:Relate:PlanningVerkoop.Init PROCEDURE()
  CODE
  _Hide:Access:PlanningVerkoop.Init
  SELF.Init(Access:PlanningVerkoop,1)


Hide:Access:PlanningVerkoop.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= Pla3:Record
  SELF.FileNameValue = 'PlanningVerkoop'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= PlanningVerkoop
  PARENT.Init
  Access:PlanningVerkoop &= SELF
  SELF.LazyOpen = False


Hide:Access:PlanningVerkoop.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:PlanningVerkoop &= NULL                           ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:PlanningVerkoop.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(PlanningVerkoop,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(Pla3:PlanningID_K,'Pla3:PlanningID_K',0)
    SELF.AddKey(Pla3:Verwerkt_Planning_FirmaNaam_K,'Pla3:Verwerkt_Planning_FirmaNaam_K',0)
    SELF.AddKey(Pla3:Planning_FirmaNaam_K,'Pla3:Planning_FirmaNaam_K',0)
    SELF.AddKey(Pla3:Planning_K,'Pla3:Planning_K',0)
    SELF.AddKey(Pla3:Verwerkt_Planning_K,'Pla3:Verwerkt_Planning_K',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:PlanningVerkoop.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:Relatie,RI:None,RI:None,Rel:Relatie_PK)
  SELF.AddRelationLink(Pla3:Klant,Rel:RelatieID)

  SELF.AddRelation(Relate:ARelatie,RI:None,RI:None,AREL:Relatie_PK)
  SELF.AddRelationLink(Pla3:Klant,AREL:RelatieID)

  SELF.AddRelation(Relate:Verkoop,RI:None,RI:None,Ver2:PK_Verkoop)
  SELF.AddRelationLink(Pla3:VerkoopID,Ver2:VerkoopID)

  SELF.AddRelation(Relate:Planning,RI:None,RI:None,Pla:PK_Planning)
  SELF.AddRelationLink(Pla3:PlanningID,Pla:PlanningID)

  SELF.AddRelation(Relate:APlanning,RI:None,RI:None,APla:PK_Planning)
  SELF.AddRelationLink(Pla3:PlanningID,APla:PlanningID)

  SELF.AddRelation(Relate:AAPlanning,RI:None,RI:None,AAPla:PK_Planning)
  SELF.AddRelationLink(Pla3:PlanningID,AAPla:PlanningID)


Hide:Relate:PlanningVerkoop.Kill PROCEDURE

  CODE
  _Hide:Access:PlanningVerkoop.Kill                        ! Kill the file manager
  PARENT.Kill
  Relate:PlanningVerkoop &= NULL                           ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:PlanningVerkoop)                    ! destroy the file manager


Hide:Relate:VoorraadVerloop.Init PROCEDURE()
  CODE
  _Hide:Access:VoorraadVerloop.Init
  SELF.Init(Access:VoorraadVerloop,1)


Hide:Access:VoorraadVerloop.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= VVL:Record
  SELF.FileNameValue = 'VoorraadVerloop'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= VoorraadVerloop
  PARENT.Init
  Access:VoorraadVerloop &= SELF
  SELF.LazyOpen = False


Hide:Access:VoorraadVerloop.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:VoorraadVerloop &= NULL                           ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:VoorraadVerloop.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(VoorraadVerloop,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(VVL:ArtikelID_DatumTijdD_MutatieID_K,'VVL:ArtikelID_DatumTijdD_MutatieID_K',0)
    SELF.AddKey(VVL:ArtikelID_DatumTijdD_MutatieIDD_K,'VVL:ArtikelID_DatumTijdD_MutatieIDD_K',0)
    SELF.AddKey(VVL:ArtikelID_DatumTijd_MutatieID_K,'VVL:ArtikelID_DatumTijd_MutatieID_K',0)
    SELF.AddKey(VVL:ArtikelID_PartijID_DatumTijd_MutatieID_K,'VVL:ArtikelID_PartijID_DatumTijd_MutatieID_K',0)
    SELF.AddKey(VVL:ArtikelID_PartijID_DatumTijdD_MutatieID_K,'VVL:ArtikelID_PartijID_DatumTijdD_MutatieID_K',0)
    SELF.AddKey(VVL:ArtikelID_PartijID_DatumTijdD_MutatieIDD_K,'VVL:ArtikelID_PartijID_DatumTijdD_MutatieIDD_K',0)
    SELF.AddKey(VVL:ArtikelID_CelID_DatumTijdD_MutatieIDD_K,'VVL:ArtikelID_CelID_DatumTijdD_MutatieIDD_K',0)
    SELF.AddKey(VVL:ArtikelID_CelID_DatumTijdD_MutatieID_K,'VVL:ArtikelID_CelID_DatumTijdD_MutatieID_K',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:VoorraadVerloop.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:Cel,RI:None,RI:None,CEL:CEL_PK)
  SELF.AddRelationLink(VVL:CelID,CEL:CelID)

  SELF.AddRelation(Relate:ACel,RI:None,RI:None,ACel:CEL_PK)
  SELF.AddRelationLink(VVL:NaarCELID,ACel:CelID)


Hide:Relate:VoorraadVerloop.Kill PROCEDURE

  CODE
  _Hide:Access:VoorraadVerloop.Kill                        ! Kill the file manager
  PARENT.Kill
  Relate:VoorraadVerloop &= NULL                           ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:VoorraadVerloop)                    ! destroy the file manager


Hide:Relate:RelatieAdres.Init PROCEDURE()
  CODE
  _Hide:Access:RelatieAdres.Init
  SELF.Init(Access:RelatieAdres,1)


Hide:Access:RelatieAdres.DeleteRecord PROCEDURE(BYTE Query=1)

ReturnValue          BYTE,AUTO

  CODE
  GebruikerLogClass.Log('Delete', 'RelatieAdres', GebruikerLogClass.BepaalRecordContent(RAD:Record))
  ReturnValue = PARENT.DeleteRecord(Query)
  RETURN ReturnValue


Hide:Access:RelatieAdres.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= RAD:Record
  SELF.FileNameValue = 'RelatieAdres'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= RelatieAdres
  PARENT.Init
  Access:RelatieAdres &= SELF
  SELF.LazyOpen = False


Hide:Access:RelatieAdres.Insert PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GebruikerLogClass.Log('Insert', 'RelatieAdres', GebruikerLogClass.BepaalRecordContent(RAD:Record))
  ReturnValue = PARENT.Insert()
  RETURN ReturnValue


Hide:Access:RelatieAdres.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:RelatieAdres &= NULL                              ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:RelatieAdres.PreInsert PROCEDURE(SIGNED OpCode,UNSIGNED AddLen,*CSTRING ErrCode,*CSTRING ErrMsg)

ReturnValue          BYTE,AUTO

Buffer LIKE(RAD:RECORD)
  CODE
  PUSHERRORS()
  IF SELF.SavePreviousBuffer AND NOT(SELF.PreviousBuffer &= NULL)
     Buffer = SELF.PreviousBuffer
  END
  RelatieAdres{PROP:ServerAutoInc}
  RelatieAdres{PROP:ServerAutoInc,1}=1 !RAD:ID
  ReturnValue = PARENT.PreInsert(OpCode,AddLen,ErrCode,ErrMsg)
  POPERRORS()
  RETURN ReturnValue


Hide:Access:RelatieAdres.TryInsert PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GebruikerLogClass.Log('Insert', 'RelatieAdres', GebruikerLogClass.BepaalRecordContent(RAD:Record))
  ReturnValue = PARENT.TryInsert()
  RETURN ReturnValue


Hide:Access:RelatieAdres.TryUpdate PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GebruikerLogClass.Log('Update', 'RelatieAdres', GebruikerLogClass.BepaalRecordContent(RAD:Record))
  ReturnValue = PARENT.TryUpdate()
  RETURN ReturnValue


Hide:Access:RelatieAdres.Update PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GebruikerLogClass.Log('Update', 'RelatieAdres', GebruikerLogClass.BepaalRecordContent(RAD:Record))
  ReturnValue = PARENT.Update()
  RETURN ReturnValue


Hide:Access:RelatieAdres.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

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
    SELF.Init(RelatieAdres,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(RAD:PK_RelatieAdres,'RAD:PK_RelatieAdres',0)
    SELF.AddKey(RAD:RelatieID_ID_K,'RAD:RelatieID_ID_K',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:RelatieAdres.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:Verkoop,RI:None,RI:None,Ver2:KlantAlternatiefAdres_K)
  SELF.AddRelationLink(RAD:ID,Ver2:KlantAlternatiefAdres)

  SELF.AddRelation(Relate:Inkoop,RI:None,RI:None,Ink:LeverancierAlternatiefAdres_K)
  SELF.AddRelationLink(RAD:ID,Ink:LeverancierAlternatiefAdres)


Hide:Relate:RelatieAdres.Kill PROCEDURE

  CODE
  _Hide:Access:RelatieAdres.Kill                           ! Kill the file manager
  PARENT.Kill
  Relate:RelatieAdres &= NULL                              ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:RelatieAdres)                       ! destroy the file manager


Hide:Relate:PalletMutatie.Init PROCEDURE()
  CODE
  _Hide:Access:PalletMutatie.Init
  SELF.Init(Access:PalletMutatie,1)


Hide:Access:PalletMutatie.DeleteRecord PROCEDURE(BYTE Query=1)

ReturnValue          BYTE,AUTO

  CODE
  GebruikerLogClass.Log('Delete', 'PalletMutatie', GebruikerLogClass.BepaalRecordContent(Pal:Record))
  ReturnValue = PARENT.DeleteRecord(Query)
  RETURN ReturnValue


Hide:Access:PalletMutatie.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= Pal:Record
  SELF.FileNameValue = 'PalletMutatie'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= PalletMutatie
  PARENT.Init
  Access:PalletMutatie &= SELF
  SELF.LazyOpen = False


Hide:Access:PalletMutatie.Insert PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GebruikerLogClass.Log('Insert', 'PalletMutatie', GebruikerLogClass.BepaalRecordContent(Pal:Record))
  ReturnValue = PARENT.Insert()
  RETURN ReturnValue


Hide:Access:PalletMutatie.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:PalletMutatie &= NULL                             ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:PalletMutatie.PreInsert PROCEDURE(SIGNED OpCode,UNSIGNED AddLen,*CSTRING ErrCode,*CSTRING ErrMsg)

ReturnValue          BYTE,AUTO

Buffer LIKE(Pal:RECORD)
  CODE
  PUSHERRORS()
  IF SELF.SavePreviousBuffer AND NOT(SELF.PreviousBuffer &= NULL)
     Buffer = SELF.PreviousBuffer
  END
  PalletMutatie{PROP:ServerAutoInc}
  PalletMutatie{PROP:ServerAutoInc,1}=1 !Pal:PalletMutatieID
  ReturnValue = PARENT.PreInsert(OpCode,AddLen,ErrCode,ErrMsg)
  POPERRORS()
  RETURN ReturnValue


Hide:Access:PalletMutatie.TryInsert PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GebruikerLogClass.Log('Insert', 'PalletMutatie', GebruikerLogClass.BepaalRecordContent(Pal:Record))
  ReturnValue = PARENT.TryInsert()
  RETURN ReturnValue


Hide:Access:PalletMutatie.TryUpdate PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GebruikerLogClass.Log('Update', 'PalletMutatie', GebruikerLogClass.BepaalRecordContent(Pal:Record))
  ReturnValue = PARENT.TryUpdate()
  RETURN ReturnValue


Hide:Access:PalletMutatie.Update PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GebruikerLogClass.Log('Update', 'PalletMutatie', GebruikerLogClass.BepaalRecordContent(Pal:Record))
  ReturnValue = PARENT.Update()
  RETURN ReturnValue


Hide:Access:PalletMutatie.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

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
    SELF.Init(PalletMutatie,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(Pal:PalletMutatie_PK,'Pal:PalletMutatie_PK',0)
    SELF.AddKey(Pal:PalletMutatie_FK1,'PalletSoortID_PalletMutatieID_K',0)
    SELF.AddKey(Pal:PalletMutatie_FK2,'RelatieID_PalletSoortID_PalletMutatie_K',0)
    SELF.AddKey(Pal:PalletMutatie_FK3,'Pal:PalletMutatie_FK3',0)
    SELF.AddKey(Pal:PalletMutatie_FK4,'Op VerkoopID_PalletMutatie_K',0)
    SELF.AddKey(Pal:PalletMutatie_FK5,'Pal:PalletMutatie_FK5',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:PalletMutatie.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:Relatie)

  SELF.AddRelation(Relate:Planning)

  SELF.AddRelation(Relate:PalletVerloop,RI:None,RI:None,Pal3:PalletVerloop_PK)
  SELF.AddRelationLink(Pal:PalletMutatieID,Pal3:PalletMutatieID)

  SELF.AddRelation(Relate:Verkoop,RI:None,RI:None,Ver2:PK_Verkoop)
  SELF.AddRelationLink(Pal:VerkoopID,Ver2:VerkoopID)


Hide:Relate:PalletMutatie.Kill PROCEDURE

  CODE
  _Hide:Access:PalletMutatie.Kill                          ! Kill the file manager
  PARENT.Kill
  Relate:PalletMutatie &= NULL                             ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:PalletMutatie)                      ! destroy the file manager


Hide:Relate:PalletVerloop.Init PROCEDURE()
  CODE
  _Hide:Access:PalletVerloop.Init
  SELF.Init(Access:PalletVerloop,1)


Hide:Access:PalletVerloop.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= Pal3:Record
  SELF.FileNameValue = 'PalletVerloop'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= PalletVerloop
  PARENT.Init
  Access:PalletVerloop &= SELF
  SELF.LazyOpen = False


Hide:Access:PalletVerloop.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:PalletVerloop &= NULL                             ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:PalletVerloop.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(PalletVerloop,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(Pal3:PalletVerloop_FK1,'Op PalletSoort/Planning (DESC)/ID',0)
    SELF.AddKey(Pal3:PalletVerloop_FK2,'Op RelatieID/PalletSoort/Planning (DESC)/ID',0)
    SELF.AddKey(Pal3:PalletVerloop_PK,'Pal3:PalletVerloop_PK',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:PalletVerloop.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:PalletMutatie)


Hide:Relate:PalletVerloop.Kill PROCEDURE

  CODE
  _Hide:Access:PalletVerloop.Kill                          ! Kill the file manager
  PARENT.Kill
  Relate:PalletVerloop &= NULL                             ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:PalletVerloop)                      ! destroy the file manager


Hide:Relate:Transporteur.Init PROCEDURE()
  CODE
  _Hide:Access:Transporteur.Init
  SELF.Init(Access:Transporteur,1)


Hide:Access:Transporteur.DeleteRecord PROCEDURE(BYTE Query=1)

ReturnValue          BYTE,AUTO

  CODE
  GebruikerLogClass.Log('Delete', 'Transporteur', GebruikerLogClass.BepaalRecordContent(Tra:Record))
  ReturnValue = PARENT.DeleteRecord(Query)
  RETURN ReturnValue


Hide:Access:Transporteur.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= Tra:Record
  SELF.FileNameValue = 'Transporteur'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= Transporteur
  PARENT.Init
  Access:Transporteur &= SELF
  SELF.LazyOpen = False


Hide:Access:Transporteur.Insert PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GebruikerLogClass.Log('Insert', 'Transporteur', GebruikerLogClass.BepaalRecordContent(Tra:Record))
  ReturnValue = PARENT.Insert()
  RETURN ReturnValue


Hide:Access:Transporteur.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:Transporteur &= NULL                              ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:Transporteur.TryInsert PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GebruikerLogClass.Log('Insert', 'Transporteur', GebruikerLogClass.BepaalRecordContent(Tra:Record))
  ReturnValue = PARENT.TryInsert()
  RETURN ReturnValue


Hide:Access:Transporteur.TryUpdate PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GebruikerLogClass.Log('Update', 'Transporteur', GebruikerLogClass.BepaalRecordContent(Tra:Record))
  ReturnValue = PARENT.TryUpdate()
  RETURN ReturnValue


Hide:Access:Transporteur.Update PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GebruikerLogClass.Log('Update', 'Transporteur', GebruikerLogClass.BepaalRecordContent(Tra:Record))
  ReturnValue = PARENT.Update()
  RETURN ReturnValue


Hide:Access:Transporteur.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(Transporteur,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(Tra:Transporteur_FK,'Op RelatieID/TransporteurID',0)
    SELF.AddKey(Tra:PK_Transporteur,'Tra:PK_Transporteur',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:Transporteur.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:Relatie,RI:None,RI:None,Rel:Relatie_PK)
  SELF.AddRelationLink(Tra:RelatieID,Rel:RelatieID)


Hide:Relate:Transporteur.Kill PROCEDURE

  CODE
  _Hide:Access:Transporteur.Kill                           ! Kill the file manager
  PARENT.Kill
  Relate:Transporteur &= NULL                              ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:Transporteur)                       ! destroy the file manager


Hide:Relate:ViewTransporteur.Init PROCEDURE()
  CODE
  _Hide:Access:ViewTransporteur.Init
  SELF.Init(Access:ViewTransporteur,1)


Hide:Access:ViewTransporteur.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= VTRA:Record
  SELF.FileNameValue = 'ViewTransporteur'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= ViewTransporteur
  PARENT.Init
  Access:ViewTransporteur &= SELF
  SELF.LazyOpen = False


Hide:Access:ViewTransporteur.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:ViewTransporteur &= NULL                          ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:ViewTransporteur.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(ViewTransporteur,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(VTRA:ViewTransporteur_PK,'VTRA:ViewTransporteur_PK',0)
    SELF.AddKey(VTRA:ViewTransporteur_FK1,'Op RelatieID',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:ViewTransporteur.Kill PROCEDURE

  CODE
  _Hide:Access:ViewTransporteur.Kill                       ! Kill the file manager
  PARENT.Kill
  Relate:ViewTransporteur &= NULL                          ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:ViewTransporteur)                   ! destroy the file manager

