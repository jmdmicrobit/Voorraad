  MEMBER('VoorrDct.clw')

  INCLUDE('ABFILE.INC'),ONCE

  MAP
VoorrDct_BC3:DctInit    PROCEDURE()
VoorrDct_BC3:DctKill    PROCEDURE()
VoorrDct_BC3:FilesInit  PROCEDURE()
  END

Hide:Access:GNCode   CLASS(FileManager),TYPE               ! FileManager for GNCode
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:GNCode   CLASS(RelationManager),TYPE           ! RelationManager for GNCode
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:GNCodeArtikelen CLASS(FileManager),TYPE        ! FileManager for GNCodeArtikelen
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:GNCodeArtikelen CLASS(RelationManager),TYPE    ! RelationManager for GNCodeArtikelen
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:Havens   CLASS(FileManager),TYPE               ! FileManager for Havens
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:Havens   CLASS(RelationManager),TYPE           ! RelationManager for Havens
Init                   PROCEDURE
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:Rapporten CLASS(FileManager),TYPE              ! FileManager for Rapporten
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:Rapporten CLASS(RelationManager),TYPE          ! RelationManager for Rapporten
Init                   PROCEDURE
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:ARelatie CLASS(FileManager),TYPE               ! FileManager for ARelatie
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:ARelatie CLASS(RelationManager),TYPE           ! RelationManager for ARelatie
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:APlanning CLASS(FileManager),TYPE              ! FileManager for APlanning
DeleteRecord           PROCEDURE(BYTE Query=1),BYTE,PROC,DERIVED
Init                   PROCEDURE(),DERIVED
Insert                 PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),DERIVED
TryInsert              PROCEDURE(),BYTE,PROC,DERIVED
TryUpdate              PROCEDURE(),BYTE,PROC,DERIVED
Update                 PROCEDURE(),BYTE,PROC,DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:APlanning CLASS(RelationManager),TYPE          ! RelationManager for APlanning
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:AInkoop  CLASS(FileManager),TYPE               ! FileManager for AInkoop
DeleteRecord           PROCEDURE(BYTE Query=1),BYTE,PROC,DERIVED
Init                   PROCEDURE(),DERIVED
Insert                 PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),DERIVED
TryInsert              PROCEDURE(),BYTE,PROC,DERIVED
TryUpdate              PROCEDURE(),BYTE,PROC,DERIVED
Update                 PROCEDURE(),BYTE,PROC,DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:AInkoop  CLASS(RelationManager),TYPE           ! RelationManager for AInkoop
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:AVerkoop CLASS(FileManager),TYPE               ! FileManager for AVerkoop
DeleteRecord           PROCEDURE(BYTE Query=1),BYTE,PROC,DERIVED
Init                   PROCEDURE(),DERIVED
Insert                 PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),DERIVED
TryInsert              PROCEDURE(),BYTE,PROC,DERIVED
TryUpdate              PROCEDURE(),BYTE,PROC,DERIVED
Update                 PROCEDURE(),BYTE,PROC,DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:AVerkoop CLASS(RelationManager),TYPE           ! RelationManager for AVerkoop
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:AViewArtikel CLASS(FileManager),TYPE           ! FileManager for AViewArtikel
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:AViewArtikel CLASS(RelationManager),TYPE       ! RelationManager for AViewArtikel
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:AARelatie CLASS(FileManager),TYPE              ! FileManager for AARelatie
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:AARelatie CLASS(RelationManager),TYPE          ! RelationManager for AARelatie
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:ACel     CLASS(FileManager),TYPE               ! FileManager for ACel
DeleteRecord           PROCEDURE(BYTE Query=1),BYTE,PROC,DERIVED
Init                   PROCEDURE(),DERIVED
Insert                 PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),DERIVED
TryInsert              PROCEDURE(),BYTE,PROC,DERIVED
TryUpdate              PROCEDURE(),BYTE,PROC,DERIVED
Update                 PROCEDURE(),BYTE,PROC,DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:ACel     CLASS(RelationManager),TYPE           ! RelationManager for ACel
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:AACel    CLASS(FileManager),TYPE               ! FileManager for AACel
DeleteRecord           PROCEDURE(BYTE Query=1),BYTE,PROC,DERIVED
Init                   PROCEDURE(),DERIVED
Insert                 PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),DERIVED
TryInsert              PROCEDURE(),BYTE,PROC,DERIVED
TryUpdate              PROCEDURE(),BYTE,PROC,DERIVED
Update                 PROCEDURE(),BYTE,PROC,DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:AACel    CLASS(RelationManager),TYPE           ! RelationManager for AACel
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:AViewVoorraadCelTotaal CLASS(FileManager),TYPE ! FileManager for AViewVoorraadCelTotaal
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:AViewVoorraadCelTotaal CLASS(RelationManager),TYPE ! RelationManager for AViewVoorraadCelTotaal
Init                   PROCEDURE
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:AVerpakking CLASS(FileManager),TYPE            ! FileManager for AVerpakking
DeleteRecord           PROCEDURE(BYTE Query=1),BYTE,PROC,DERIVED
Init                   PROCEDURE(),DERIVED
Insert                 PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),DERIVED
TryInsert              PROCEDURE(),BYTE,PROC,DERIVED
TryUpdate              PROCEDURE(),BYTE,PROC,DERIVED
Update                 PROCEDURE(),BYTE,PROC,DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:AVerpakking CLASS(RelationManager),TYPE        ! RelationManager for AVerpakking
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:AAARelatie CLASS(FileManager),TYPE             ! FileManager for AAARelatie
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:AAARelatie CLASS(RelationManager),TYPE         ! RelationManager for AAARelatie
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:AAAARelatie CLASS(FileManager),TYPE            ! FileManager for AAAARelatie
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:AAAARelatie CLASS(RelationManager),TYPE        ! RelationManager for AAAARelatie
Init                   PROCEDURE
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:AViewTransporteur CLASS(FileManager),TYPE      ! FileManager for AViewTransporteur
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:AViewTransporteur CLASS(RelationManager),TYPE  ! RelationManager for AViewTransporteur
Init                   PROCEDURE
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:APalletMutatie CLASS(FileManager),TYPE         ! FileManager for APalletMutatie
DeleteRecord           PROCEDURE(BYTE Query=1),BYTE,PROC,DERIVED
Init                   PROCEDURE(),DERIVED
Insert                 PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),DERIVED
TryInsert              PROCEDURE(),BYTE,PROC,DERIVED
TryUpdate              PROCEDURE(),BYTE,PROC,DERIVED
Update                 PROCEDURE(),BYTE,PROC,DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:APalletMutatie CLASS(RelationManager),TYPE     ! RelationManager for APalletMutatie
Init                   PROCEDURE
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:AAACel   CLASS(FileManager),TYPE               ! FileManager for AAACel
DeleteRecord           PROCEDURE(BYTE Query=1),BYTE,PROC,DERIVED
Init                   PROCEDURE(),DERIVED
Insert                 PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),DERIVED
TryInsert              PROCEDURE(),BYTE,PROC,DERIVED
TryUpdate              PROCEDURE(),BYTE,PROC,DERIVED
Update                 PROCEDURE(),BYTE,PROC,DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:AAACel   CLASS(RelationManager),TYPE           ! RelationManager for AAACel
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:APalletVerloop CLASS(FileManager),TYPE         ! FileManager for APalletVerloop
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:APalletVerloop CLASS(RelationManager),TYPE     ! RelationManager for APalletVerloop
Init                   PROCEDURE
Kill                   PROCEDURE(),DERIVED
                     END


_Hide:Access:GNCode  &Hide:Access:GNCode,AUTO,THREAD
_Hide:Relate:GNCode  &Hide:Relate:GNCode,AUTO,THREAD
_Hide:Access:GNCodeArtikelen &Hide:Access:GNCodeArtikelen,AUTO,THREAD
_Hide:Relate:GNCodeArtikelen &Hide:Relate:GNCodeArtikelen,AUTO,THREAD
_Hide:Access:Havens  &Hide:Access:Havens,AUTO,THREAD
_Hide:Relate:Havens  &Hide:Relate:Havens,AUTO,THREAD
_Hide:Access:Rapporten &Hide:Access:Rapporten,AUTO,THREAD
_Hide:Relate:Rapporten &Hide:Relate:Rapporten,AUTO,THREAD
_Hide:Access:ARelatie &Hide:Access:ARelatie,AUTO,THREAD
_Hide:Relate:ARelatie &Hide:Relate:ARelatie,AUTO,THREAD
_Hide:Access:APlanning &Hide:Access:APlanning,AUTO,THREAD
_Hide:Relate:APlanning &Hide:Relate:APlanning,AUTO,THREAD
_Hide:Access:AInkoop &Hide:Access:AInkoop,AUTO,THREAD
_Hide:Relate:AInkoop &Hide:Relate:AInkoop,AUTO,THREAD
_Hide:Access:AVerkoop &Hide:Access:AVerkoop,AUTO,THREAD
_Hide:Relate:AVerkoop &Hide:Relate:AVerkoop,AUTO,THREAD
_Hide:Access:AViewArtikel &Hide:Access:AViewArtikel,AUTO,THREAD
_Hide:Relate:AViewArtikel &Hide:Relate:AViewArtikel,AUTO,THREAD
_Hide:Access:AARelatie &Hide:Access:AARelatie,AUTO,THREAD
_Hide:Relate:AARelatie &Hide:Relate:AARelatie,AUTO,THREAD
_Hide:Access:ACel    &Hide:Access:ACel,AUTO,THREAD
_Hide:Relate:ACel    &Hide:Relate:ACel,AUTO,THREAD
_Hide:Access:AACel   &Hide:Access:AACel,AUTO,THREAD
_Hide:Relate:AACel   &Hide:Relate:AACel,AUTO,THREAD
_Hide:Access:AViewVoorraadCelTotaal &Hide:Access:AViewVoorraadCelTotaal,AUTO,THREAD
_Hide:Relate:AViewVoorraadCelTotaal &Hide:Relate:AViewVoorraadCelTotaal,AUTO,THREAD
_Hide:Access:AVerpakking &Hide:Access:AVerpakking,AUTO,THREAD
_Hide:Relate:AVerpakking &Hide:Relate:AVerpakking,AUTO,THREAD
_Hide:Access:AAARelatie &Hide:Access:AAARelatie,AUTO,THREAD
_Hide:Relate:AAARelatie &Hide:Relate:AAARelatie,AUTO,THREAD
_Hide:Access:AAAARelatie &Hide:Access:AAAARelatie,AUTO,THREAD
_Hide:Relate:AAAARelatie &Hide:Relate:AAAARelatie,AUTO,THREAD
_Hide:Access:AViewTransporteur &Hide:Access:AViewTransporteur,AUTO,THREAD
_Hide:Relate:AViewTransporteur &Hide:Relate:AViewTransporteur,AUTO,THREAD
_Hide:Access:APalletMutatie &Hide:Access:APalletMutatie,AUTO,THREAD
_Hide:Relate:APalletMutatie &Hide:Relate:APalletMutatie,AUTO,THREAD
_Hide:Access:AAACel  &Hide:Access:AAACel,AUTO,THREAD
_Hide:Relate:AAACel  &Hide:Relate:AAACel,AUTO,THREAD
_Hide:Access:APalletVerloop &Hide:Access:APalletVerloop,AUTO,THREAD
_Hide:Relate:APalletVerloop &Hide:Relate:APalletVerloop,AUTO,THREAD


VoorrDct_BC3:DctInit PROCEDURE()
  CODE
  _Hide:Access:GNCode &= NEW(Hide:Access:GNCode)
  _Hide:Relate:GNCode &= NEW(Hide:Relate:GNCode)
  _Hide:Access:GNCodeArtikelen &= NEW(Hide:Access:GNCodeArtikelen)
  _Hide:Relate:GNCodeArtikelen &= NEW(Hide:Relate:GNCodeArtikelen)
  _Hide:Access:Havens &= NEW(Hide:Access:Havens)
  _Hide:Relate:Havens &= NEW(Hide:Relate:Havens)
  _Hide:Access:Rapporten &= NEW(Hide:Access:Rapporten)
  _Hide:Relate:Rapporten &= NEW(Hide:Relate:Rapporten)
  _Hide:Access:ARelatie &= NEW(Hide:Access:ARelatie)
  _Hide:Relate:ARelatie &= NEW(Hide:Relate:ARelatie)
  _Hide:Access:APlanning &= NEW(Hide:Access:APlanning)
  _Hide:Relate:APlanning &= NEW(Hide:Relate:APlanning)
  _Hide:Access:AInkoop &= NEW(Hide:Access:AInkoop)
  _Hide:Relate:AInkoop &= NEW(Hide:Relate:AInkoop)
  _Hide:Access:AVerkoop &= NEW(Hide:Access:AVerkoop)
  _Hide:Relate:AVerkoop &= NEW(Hide:Relate:AVerkoop)
  _Hide:Access:AViewArtikel &= NEW(Hide:Access:AViewArtikel)
  _Hide:Relate:AViewArtikel &= NEW(Hide:Relate:AViewArtikel)
  _Hide:Access:AARelatie &= NEW(Hide:Access:AARelatie)
  _Hide:Relate:AARelatie &= NEW(Hide:Relate:AARelatie)
  _Hide:Access:ACel &= NEW(Hide:Access:ACel)
  _Hide:Relate:ACel &= NEW(Hide:Relate:ACel)
  _Hide:Access:AACel &= NEW(Hide:Access:AACel)
  _Hide:Relate:AACel &= NEW(Hide:Relate:AACel)
  _Hide:Access:AViewVoorraadCelTotaal &= NEW(Hide:Access:AViewVoorraadCelTotaal)
  _Hide:Relate:AViewVoorraadCelTotaal &= NEW(Hide:Relate:AViewVoorraadCelTotaal)
  _Hide:Access:AVerpakking &= NEW(Hide:Access:AVerpakking)
  _Hide:Relate:AVerpakking &= NEW(Hide:Relate:AVerpakking)
  _Hide:Access:AAARelatie &= NEW(Hide:Access:AAARelatie)
  _Hide:Relate:AAARelatie &= NEW(Hide:Relate:AAARelatie)
  _Hide:Access:AAAARelatie &= NEW(Hide:Access:AAAARelatie)
  _Hide:Relate:AAAARelatie &= NEW(Hide:Relate:AAAARelatie)
  _Hide:Access:AViewTransporteur &= NEW(Hide:Access:AViewTransporteur)
  _Hide:Relate:AViewTransporteur &= NEW(Hide:Relate:AViewTransporteur)
  _Hide:Access:APalletMutatie &= NEW(Hide:Access:APalletMutatie)
  _Hide:Relate:APalletMutatie &= NEW(Hide:Relate:APalletMutatie)
  _Hide:Access:AAACel &= NEW(Hide:Access:AAACel)
  _Hide:Relate:AAACel &= NEW(Hide:Relate:AAACel)
  _Hide:Access:APalletVerloop &= NEW(Hide:Access:APalletVerloop)
  _Hide:Relate:APalletVerloop &= NEW(Hide:Relate:APalletVerloop)
  Relate:GNCode &= _Hide:Relate:GNCode
  Relate:GNCodeArtikelen &= _Hide:Relate:GNCodeArtikelen
  Relate:Havens &= _Hide:Relate:Havens
  Relate:Rapporten &= _Hide:Relate:Rapporten
  Relate:ARelatie &= _Hide:Relate:ARelatie
  Relate:APlanning &= _Hide:Relate:APlanning
  Relate:AInkoop &= _Hide:Relate:AInkoop
  Relate:AVerkoop &= _Hide:Relate:AVerkoop
  Relate:AViewArtikel &= _Hide:Relate:AViewArtikel
  Relate:AARelatie &= _Hide:Relate:AARelatie
  Relate:ACel &= _Hide:Relate:ACel
  Relate:AACel &= _Hide:Relate:AACel
  Relate:AViewVoorraadCelTotaal &= _Hide:Relate:AViewVoorraadCelTotaal
  Relate:AVerpakking &= _Hide:Relate:AVerpakking
  Relate:AAARelatie &= _Hide:Relate:AAARelatie
  Relate:AAAARelatie &= _Hide:Relate:AAAARelatie
  Relate:AViewTransporteur &= _Hide:Relate:AViewTransporteur
  Relate:APalletMutatie &= _Hide:Relate:APalletMutatie
  Relate:AAACel &= _Hide:Relate:AAACel
  Relate:APalletVerloop &= _Hide:Relate:APalletVerloop


VoorrDct_BC3:FilesInit PROCEDURE()
  CODE
  _Hide:Relate:GNCode.Init
  _Hide:Relate:GNCodeArtikelen.Init
  _Hide:Relate:Havens.Init
  _Hide:Relate:Rapporten.Init
  _Hide:Relate:ARelatie.Init
  _Hide:Relate:APlanning.Init
  _Hide:Relate:AInkoop.Init
  _Hide:Relate:AVerkoop.Init
  _Hide:Relate:AViewArtikel.Init
  _Hide:Relate:AARelatie.Init
  _Hide:Relate:ACel.Init
  _Hide:Relate:AACel.Init
  _Hide:Relate:AViewVoorraadCelTotaal.Init
  _Hide:Relate:AVerpakking.Init
  _Hide:Relate:AAARelatie.Init
  _Hide:Relate:AAAARelatie.Init
  _Hide:Relate:AViewTransporteur.Init
  _Hide:Relate:APalletMutatie.Init
  _Hide:Relate:AAACel.Init
  _Hide:Relate:APalletVerloop.Init


VoorrDct_BC3:DctKill PROCEDURE()
  CODE
  _Hide:Relate:GNCode.Kill
  DISPOSE(_Hide:Relate:GNCode)
  _Hide:Relate:GNCodeArtikelen.Kill
  DISPOSE(_Hide:Relate:GNCodeArtikelen)
  _Hide:Relate:Havens.Kill
  DISPOSE(_Hide:Relate:Havens)
  _Hide:Relate:Rapporten.Kill
  DISPOSE(_Hide:Relate:Rapporten)
  _Hide:Relate:ARelatie.Kill
  DISPOSE(_Hide:Relate:ARelatie)
  _Hide:Relate:APlanning.Kill
  DISPOSE(_Hide:Relate:APlanning)
  _Hide:Relate:AInkoop.Kill
  DISPOSE(_Hide:Relate:AInkoop)
  _Hide:Relate:AVerkoop.Kill
  DISPOSE(_Hide:Relate:AVerkoop)
  _Hide:Relate:AViewArtikel.Kill
  DISPOSE(_Hide:Relate:AViewArtikel)
  _Hide:Relate:AARelatie.Kill
  DISPOSE(_Hide:Relate:AARelatie)
  _Hide:Relate:ACel.Kill
  DISPOSE(_Hide:Relate:ACel)
  _Hide:Relate:AACel.Kill
  DISPOSE(_Hide:Relate:AACel)
  _Hide:Relate:AViewVoorraadCelTotaal.Kill
  DISPOSE(_Hide:Relate:AViewVoorraadCelTotaal)
  _Hide:Relate:AVerpakking.Kill
  DISPOSE(_Hide:Relate:AVerpakking)
  _Hide:Relate:AAARelatie.Kill
  DISPOSE(_Hide:Relate:AAARelatie)
  _Hide:Relate:AAAARelatie.Kill
  DISPOSE(_Hide:Relate:AAAARelatie)
  _Hide:Relate:AViewTransporteur.Kill
  DISPOSE(_Hide:Relate:AViewTransporteur)
  _Hide:Relate:APalletMutatie.Kill
  DISPOSE(_Hide:Relate:APalletMutatie)
  _Hide:Relate:AAACel.Kill
  DISPOSE(_Hide:Relate:AAACel)
  _Hide:Relate:APalletVerloop.Kill
  DISPOSE(_Hide:Relate:APalletVerloop)


Hide:Relate:GNCode.Init PROCEDURE()
  CODE
  _Hide:Access:GNCode.Init
  SELF.Init(Access:GNCode,1)


Hide:Access:GNCode.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= GNC:Record
  SELF.FileNameValue = 'GNCode'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= GNCode
  PARENT.Init
  Access:GNCode &= SELF
  SELF.LazyOpen = False


Hide:Access:GNCode.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:GNCode &= NULL                                    ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:GNCode.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(GNCode,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(GNC:GNCode_PK,'GNC:GNCode_PK',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:GNCode.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:GNCodeArtikelen)


Hide:Relate:GNCode.Kill PROCEDURE

  CODE
  _Hide:Access:GNCode.Kill                                 ! Kill the file manager
  PARENT.Kill
  Relate:GNCode &= NULL                                    ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:GNCode)                             ! destroy the file manager


Hide:Relate:GNCodeArtikelen.Init PROCEDURE()
  CODE
  _Hide:Access:GNCodeArtikelen.Init
  SELF.Init(Access:GNCodeArtikelen,1)


Hide:Access:GNCodeArtikelen.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= GNA:Record
  SELF.FileNameValue = 'GNCodeArtikelen'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= GNCodeArtikelen
  PARENT.Init
  Access:GNCodeArtikelen &= SELF
  SELF.LazyOpen = False


Hide:Access:GNCodeArtikelen.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:GNCodeArtikelen &= NULL                           ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:GNCodeArtikelen.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(GNCodeArtikelen,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(GNA:GNCodeArtikelen_PK,'GNA:GNCodeArtikelen_PK',0)
    SELF.AddKey(GNA:GNCodeArtikelen_FK1,'GNA:GNCodeArtikelen_FK1',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:GNCodeArtikelen.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:ViewArtikel)

  SELF.AddRelation(Relate:GNCode,RI:None,RI:None,GNC:GNCode_PK)
  SELF.AddRelationLink(GNA:GNCode,GNC:GNCode)


Hide:Relate:GNCodeArtikelen.Kill PROCEDURE

  CODE
  _Hide:Access:GNCodeArtikelen.Kill                        ! Kill the file manager
  PARENT.Kill
  Relate:GNCodeArtikelen &= NULL                           ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:GNCodeArtikelen)                    ! destroy the file manager


Hide:Relate:Havens.Init PROCEDURE()
  CODE
  _Hide:Access:Havens.Init
  SELF.Init(Access:Havens,1)


Hide:Access:Havens.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= Hav:Record
  SELF.FileNameValue = 'Havens'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= Havens
  PARENT.Init
  Access:Havens &= SELF
  SELF.LazyOpen = False


Hide:Access:Havens.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:Havens &= NULL                                    ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:Havens.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(Havens,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(Hav:Haven_PK,'Hav:Haven_PK',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:Havens.Kill PROCEDURE

  CODE
  _Hide:Access:Havens.Kill                                 ! Kill the file manager
  PARENT.Kill
  Relate:Havens &= NULL                                    ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:Havens)                             ! destroy the file manager


Hide:Relate:Rapporten.Init PROCEDURE()
  CODE
  _Hide:Access:Rapporten.Init
  SELF.Init(Access:Rapporten,1)


Hide:Access:Rapporten.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= Rap:Record
  SELF.FileNameValue = 'Rapporten'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= Rapporten
  PARENT.Init
  Access:Rapporten &= SELF
  SELF.LazyOpen = False


Hide:Access:Rapporten.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:Rapporten &= NULL                                 ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:Rapporten.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(Rapporten,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(Rap:Rapporten_PK,'Rap:Rapporten_PK',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:Rapporten.Kill PROCEDURE

  CODE
  _Hide:Access:Rapporten.Kill                              ! Kill the file manager
  PARENT.Kill
  Relate:Rapporten &= NULL                                 ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:Rapporten)                          ! destroy the file manager


Hide:Relate:ARelatie.Init PROCEDURE()
  CODE
  _Hide:Access:ARelatie.Init
  SELF.Init(Access:ARelatie,1)
  SELF.SetAlias(Relate:Relatie)


Hide:Access:ARelatie.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= AREL:Record
  SELF.AliasedFile &= Access:Relatie                       !This is a File Alias, so assign aliased file manager
  SELF.FileNameValue = 'ARelatie'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= ARelatie
  PARENT.Init
  Access:ARelatie &= SELF
  SELF.LazyOpen = False


Hide:Access:ARelatie.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:ARelatie &= NULL                                  ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:ARelatie.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(ARelatie,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(AREL:Relatie_FK02,'AREL:Relatie_FK02',0)
    SELF.AddKey(AREL:Relatie_FK01,'AREL:Relatie_FK01',0)
    SELF.AddKey(AREL:Relatie_PK,'AREL:Relatie_PK',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:ARelatie.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:Verkoop)

  SELF.AddRelation(Relate:PlanningInkoop)

  SELF.AddRelation(Relate:PlanningVerkoop)

  SELF.AddRelation(Relate:Partij)

  SELF.AddRelation(Relate:APartij)

  SELF.AddRelation(Relate:ViewPalletTegoeden,RI:None,RI:None,PTG:ViewPalletTegoeden_PK)
  SELF.AddRelationLink(AREL:RelatieID,PTG:RelatieID)


Hide:Relate:ARelatie.Kill PROCEDURE

  CODE
  _Hide:Access:ARelatie.Kill                               ! Kill the file manager
  PARENT.Kill
  Relate:ARelatie &= NULL                                  ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:ARelatie)                           ! destroy the file manager


Hide:Relate:APlanning.Init PROCEDURE()
  CODE
  _Hide:Access:APlanning.Init
  SELF.Init(Access:APlanning,1)
  SELF.SetAlias(Relate:Planning)


Hide:Access:APlanning.DeleteRecord PROCEDURE(BYTE Query=1)

ReturnValue          BYTE,AUTO

  CODE
  GebruikerLogClass.Log('Delete', 'Planning', GebruikerLogClass.BepaalRecordContent(APla:Record))
  ReturnValue = PARENT.DeleteRecord(Query)
  RETURN ReturnValue


Hide:Access:APlanning.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= APla:Record
  SELF.AliasedFile &= Access:Planning                      !This is a File Alias, so assign aliased file manager
  SELF.FileNameValue = 'APlanning'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= APlanning
  PARENT.Init
  Access:APlanning &= SELF
  SELF.LazyOpen = False


Hide:Access:APlanning.Insert PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GebruikerLogClass.Log('Insert', 'Planning', GebruikerLogClass.BepaalRecordContent(APla:Record))
  ReturnValue = PARENT.Insert()
  RETURN ReturnValue


Hide:Access:APlanning.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:APlanning &= NULL                                 ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:APlanning.TryInsert PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GebruikerLogClass.Log('Insert', 'Planning', GebruikerLogClass.BepaalRecordContent(APla:Record))
  ReturnValue = PARENT.TryInsert()
  RETURN ReturnValue


Hide:Access:APlanning.TryUpdate PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GebruikerLogClass.Log('Update', 'Planning', GebruikerLogClass.BepaalRecordContent(APla:Record))
  ReturnValue = PARENT.TryUpdate()
  RETURN ReturnValue


Hide:Access:APlanning.Update PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GebruikerLogClass.Log('Update', 'Planning', GebruikerLogClass.BepaalRecordContent(APla:Record))
  ReturnValue = PARENT.Update()
  RETURN ReturnValue


Hide:Access:APlanning.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(APlanning,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(APla:Datum_Tijd_K,'APla:Datum_Tijd_K',0)
    SELF.AddKey(APla:OverboekingCelID_Planning_K,'APla:OverboekingCelID_Planning_K',0)
    SELF.AddKey(APla:PK_Planning,'APla:PK_Planning',0)
    SELF.AddKey(APla:Planning_FK01,'Op InkoopID/Planning',0)
    SELF.AddKey(APla:Planning_FK02,'Op VerkoopID. PlanningID',0)
    SELF.AddKey(APla:Planning_FK03,'Op Planning',0)
    SELF.AddKey(APla:Verwerkt_Artikel_Planning_K,'APla:Verwerkt_Artikel_Planning_K',0)
    SELF.AddKey(APla:Verwerkt_OverboekingCelID_Planning_K,'APla:Verwerkt_OverboekingCelID_Planning_K',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:APlanning.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:AViewArtikel,RI:None,RI:None,AArt:Artikel_PK)
  SELF.AddRelationLink(APla:ArtikelID,AArt:ArtikelID)

  SELF.AddRelation(Relate:AVerkoop,RI:None,RI:None,AVE:PK_Verkoop)
  SELF.AddRelationLink(APla:VerkoopID,AVE:VerkoopID)

  SELF.AddRelation(Relate:AInkoop,RI:None,RI:None,AInk:PK_Inkoop)
  SELF.AddRelationLink(APla:InkoopID,AInk:InkoopID)

  SELF.AddRelation(Relate:AVerpakking,RI:None,RI:None,AVP:Verpakking_PK)
  SELF.AddRelationLink(APla:VerpakkingID,AVP:VerpakkingID)

  SELF.AddRelation(Relate:APartij,RI:None,RI:None,APar:Partij_PK)
  SELF.AddRelationLink(APla:PartijID,APar:PartijID)

  SELF.AddRelation(Relate:AACel,RI:None,RI:None,AACel:CEL_PK)
  SELF.AddRelationLink(APla:CelID,AACel:CelID)

  SELF.AddRelation(Relate:AAACel,RI:None,RI:None,AAACel:CEL_PK)
  SELF.AddRelationLink(APla:CelID,AAACel:CelID)

  SELF.AddRelation(Relate:PlanningInkoop)

  SELF.AddRelation(Relate:PlanningVerkoop)

  SELF.AddRelation(Relate:Activiteit,RI:None,RI:None,ACT:FK1_Activiteit)
  SELF.AddRelationLink(APla:PlanningID,ACT:PlanningID)


Hide:Relate:APlanning.Kill PROCEDURE

  CODE
  _Hide:Access:APlanning.Kill                              ! Kill the file manager
  PARENT.Kill
  Relate:APlanning &= NULL                                 ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:APlanning)                          ! destroy the file manager


Hide:Relate:AInkoop.Init PROCEDURE()
  CODE
  _Hide:Access:AInkoop.Init
  SELF.Init(Access:AInkoop,1)
  SELF.SetAlias(Relate:Inkoop)


Hide:Access:AInkoop.DeleteRecord PROCEDURE(BYTE Query=1)

ReturnValue          BYTE,AUTO

  CODE
  GebruikerLogClass.Log('Delete', 'Inkoop', GebruikerLogClass.BepaalRecordContent(AInk:Record))
  ReturnValue = PARENT.DeleteRecord(Query)
  RETURN ReturnValue


Hide:Access:AInkoop.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= AInk:Record
  SELF.AliasedFile &= Access:Inkoop                        !This is a File Alias, so assign aliased file manager
  SELF.FileNameValue = 'AInkoop'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= AInkoop
  PARENT.Init
  Access:AInkoop &= SELF
  SELF.LazyOpen = False


Hide:Access:AInkoop.Insert PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GebruikerLogClass.Log('Insert', 'Inkoop', GebruikerLogClass.BepaalRecordContent(AInk:Record))
  ReturnValue = PARENT.Insert()
  RETURN ReturnValue


Hide:Access:AInkoop.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:AInkoop &= NULL                                   ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:AInkoop.TryInsert PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GebruikerLogClass.Log('Insert', 'Inkoop', GebruikerLogClass.BepaalRecordContent(AInk:Record))
  ReturnValue = PARENT.TryInsert()
  RETURN ReturnValue


Hide:Access:AInkoop.TryUpdate PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GebruikerLogClass.Log('Update', 'Inkoop', GebruikerLogClass.BepaalRecordContent(AInk:Record))
  ReturnValue = PARENT.TryUpdate()
  RETURN ReturnValue


Hide:Access:AInkoop.Update PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GebruikerLogClass.Log('Update', 'Inkoop', GebruikerLogClass.BepaalRecordContent(AInk:Record))
  ReturnValue = PARENT.Update()
  RETURN ReturnValue


Hide:Access:AInkoop.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(AInkoop,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(AInk:PK_Inkoop,'AInk:PK_Inkoop',0)
    SELF.AddKey(AInk:Inkoop_FK01,'Op Planning',0)
    SELF.AddKey(AInk:Verwerkt_InkoopID_K,'AInk:Verwerkt_InkoopID_K',0)
    SELF.AddKey(AInk:Verwerkt_InkoopIDD_K,'AInk:Verwerkt_InkoopIDD_K',0)
    SELF.AddKey(AInk:Verwerkt_Planning_K,'AInk:Verwerkt_Planning_K',0)
    SELF.AddKey(AInk:Verwerkt_PlanningD_K,'AInk:Verwerkt_PlanningD_K',0)
    SELF.AddKey(AInk:Leverancier_Verwerkt_Planning_K,'AInk:Leverancier_Verwerkt_Planning_K',0)
    SELF.AddKey(AInk:Leverancier_Verwerkt_PlanningD_K,'AInk:Leverancier_Verwerkt_PlanningD_K',0)
    SELF.AddKey(AInk:LeverancierAlternatiefAdres_K,'AInk:LeverancierAlternatiefAdres_K',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:AInkoop.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:APlanning)

  SELF.AddRelation(Relate:AARelatie,RI:None,RI:None,AARel:Relatie_PK)
  SELF.AddRelationLink(AInk:Leverancier,AARel:RelatieID)

  SELF.AddRelation(Relate:Planning)


Hide:Relate:AInkoop.Kill PROCEDURE

  CODE
  _Hide:Access:AInkoop.Kill                                ! Kill the file manager
  PARENT.Kill
  Relate:AInkoop &= NULL                                   ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:AInkoop)                            ! destroy the file manager


Hide:Relate:AVerkoop.Init PROCEDURE()
  CODE
  _Hide:Access:AVerkoop.Init
  SELF.Init(Access:AVerkoop,1)
  SELF.SetAlias(Relate:Verkoop)


Hide:Access:AVerkoop.DeleteRecord PROCEDURE(BYTE Query=1)

ReturnValue          BYTE,AUTO

  CODE
  GebruikerLogClass.Log('Delete', 'Verkoop', GebruikerLogClass.BepaalRecordContent(AVe:Record))
  ReturnValue = PARENT.DeleteRecord(Query)
  RETURN ReturnValue


Hide:Access:AVerkoop.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= AVE:Record
  SELF.AliasedFile &= Access:Verkoop                       !This is a File Alias, so assign aliased file manager
  SELF.FileNameValue = 'AVerkoop'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= AVerkoop
  PARENT.Init
  Access:AVerkoop &= SELF
  SELF.LazyOpen = False


Hide:Access:AVerkoop.Insert PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GebruikerLogClass.Log('Insert', 'Verkoop', GebruikerLogClass.BepaalRecordContent(AVe:Record))
  ReturnValue = PARENT.Insert()
  RETURN ReturnValue


Hide:Access:AVerkoop.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:AVerkoop &= NULL                                  ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:AVerkoop.TryInsert PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GebruikerLogClass.Log('Insert', 'Verkoop', GebruikerLogClass.BepaalRecordContent(AVe:Record))
  ReturnValue = PARENT.TryInsert()
  RETURN ReturnValue


Hide:Access:AVerkoop.TryUpdate PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GebruikerLogClass.Log('Update', 'Verkoop', GebruikerLogClass.BepaalRecordContent(AVe:Record))
  ReturnValue = PARENT.TryUpdate()
  RETURN ReturnValue


Hide:Access:AVerkoop.Update PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GebruikerLogClass.Log('Update', 'Verkoop', GebruikerLogClass.BepaalRecordContent(AVe:Record))
  ReturnValue = PARENT.Update()
  RETURN ReturnValue


Hide:Access:AVerkoop.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(AVerkoop,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(AVE:Verkoop_FK2,'Op Exported/VerkoopID',0)
    SELF.AddKey(AVE:Verkoop_FK3,'Op Exported, Klant, Verkoop',0)
    SELF.AddKey(AVE:PK_Verkoop,'AVE:PK_Verkoop',0)
    SELF.AddKey(AVE:Verkoop_FK01,'AVE:Verkoop_FK01',0)
    SELF.AddKey(AVE:Klant_Verwerkt_Planning_K,'AVE:Klant_Verwerkt_Planning_K',0)
    SELF.AddKey(AVE:Klant_Verwerkt_PlanningD_K,'AVE:Klant_Verwerkt_PlanningD_K',0)
    SELF.AddKey(AVE:Verwerkt_VerkoopID_K,'AVE:Verwerkt_VerkoopID_K',0)
    SELF.AddKey(AVE:Verwerkt_VerkoopIDD_K,'AVE:Verwerkt_VerkoopIDD_K',0)
    SELF.AddKey(AVE:Verwerkt_Planning_K,'AVE:Verwerkt_Planning_K',0)
    SELF.AddKey(AVE:Verwerkt_PlanningD_K,'AVE:Verwerkt_PlanningD_K',0)
    SELF.AddKey(AVE:KlantAlternatiefAdres_K,'AVE:KlantAlternatiefAdres_K',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:AVerkoop.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:APlanning)

  SELF.AddRelation(Relate:AARelatie,RI:None,RI:None,AARel:Relatie_PK)
  SELF.AddRelationLink(AVE:Klant,AARel:RelatieID)


Hide:Relate:AVerkoop.Kill PROCEDURE

  CODE
  _Hide:Access:AVerkoop.Kill                               ! Kill the file manager
  PARENT.Kill
  Relate:AVerkoop &= NULL                                  ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:AVerkoop)                           ! destroy the file manager


Hide:Relate:AViewArtikel.Init PROCEDURE()
  CODE
  _Hide:Access:AViewArtikel.Init
  SELF.Init(Access:AViewArtikel,1)
  SELF.SetAlias(Relate:ViewArtikel)


Hide:Access:AViewArtikel.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= AArt:Record
  SELF.AliasedFile &= Access:ViewArtikel                   !This is a File Alias, so assign aliased file manager
  SELF.FileNameValue = 'AViewArtikel'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= AViewArtikel
  PARENT.Init
  Access:AViewArtikel &= SELF
  SELF.LazyOpen = False


Hide:Access:AViewArtikel.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:AViewArtikel &= NULL                              ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:AViewArtikel.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(AViewArtikel,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(AArt:Artikel_PK,'AArt:Artikel_PK',0)
    SELF.AddKey(AArt:Artikel_FK01,'AArt:Artikel_FK01',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:AViewArtikel.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:APlanning)

  SELF.AddRelation(Relate:PlanningInkoop)

  SELF.AddRelation(Relate:ViewVoorraadPartij)

  SELF.AddRelation(Relate:Planning)


Hide:Relate:AViewArtikel.Kill PROCEDURE

  CODE
  _Hide:Access:AViewArtikel.Kill                           ! Kill the file manager
  PARENT.Kill
  Relate:AViewArtikel &= NULL                              ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:AViewArtikel)                       ! destroy the file manager


Hide:Relate:AARelatie.Init PROCEDURE()
  CODE
  _Hide:Access:AARelatie.Init
  SELF.Init(Access:AARelatie,1)
  SELF.SetAlias(Relate:Relatie)


Hide:Access:AARelatie.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= AARel:Record
  SELF.AliasedFile &= Access:Relatie                       !This is a File Alias, so assign aliased file manager
  SELF.FileNameValue = 'AARelatie'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= AARelatie
  PARENT.Init
  Access:AARelatie &= SELF
  SELF.LazyOpen = False


Hide:Access:AARelatie.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:AARelatie &= NULL                                 ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:AARelatie.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(AARelatie,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(AARel:Relatie_FK02,'AARel:Relatie_FK02',0)
    SELF.AddKey(AARel:Relatie_FK01,'AARel:Relatie_FK01',0)
    SELF.AddKey(AARel:Relatie_PK,'AARel:Relatie_PK',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:AARelatie.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:AInkoop)

  SELF.AddRelation(Relate:AVerkoop)

  SELF.AddRelation(Relate:Planning)


Hide:Relate:AARelatie.Kill PROCEDURE

  CODE
  _Hide:Access:AARelatie.Kill                              ! Kill the file manager
  PARENT.Kill
  Relate:AARelatie &= NULL                                 ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:AARelatie)                          ! destroy the file manager


Hide:Relate:ACel.Init PROCEDURE()
  CODE
  _Hide:Access:ACel.Init
  SELF.Init(Access:ACel,1)
  SELF.SetAlias(Relate:Cel)


Hide:Access:ACel.DeleteRecord PROCEDURE(BYTE Query=1)

ReturnValue          BYTE,AUTO

  CODE
  GebruikerLogClass.Log('Delete', 'Cel', GebruikerLogClass.BepaalRecordContent(ACel:Record))
  ReturnValue = PARENT.DeleteRecord(Query)
  RETURN ReturnValue


Hide:Access:ACel.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= ACel:Record
  SELF.AliasedFile &= Access:Cel                           !This is a File Alias, so assign aliased file manager
  SELF.FileNameValue = 'ACel'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= ACel
  PARENT.Init
  Access:ACel &= SELF
  SELF.LazyOpen = False


Hide:Access:ACel.Insert PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GebruikerLogClass.Log('Insert', 'Cel', GebruikerLogClass.BepaalRecordContent(ACel:Record))
  ReturnValue = PARENT.Insert()
  RETURN ReturnValue


Hide:Access:ACel.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:ACel &= NULL                                      ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:ACel.TryInsert PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GebruikerLogClass.Log('Insert', 'Cel', GebruikerLogClass.BepaalRecordContent(ACel:Record))
  ReturnValue = PARENT.TryInsert()
  RETURN ReturnValue


Hide:Access:ACel.TryUpdate PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GebruikerLogClass.Log('TryUpdate', 'Cel', GebruikerLogClass.BepaalRecordContent(ACel:Record))
  ReturnValue = PARENT.TryUpdate()
  RETURN ReturnValue


Hide:Access:ACel.Update PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GebruikerLogClass.Log('Update', 'Cel', GebruikerLogClass.BepaalRecordContent(ACel:Record))
  ReturnValue = PARENT.Update()
  RETURN ReturnValue


Hide:Access:ACel.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(ACel,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(ACel:CEL_PK,'ACel:CEL_PK',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:ACel.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:Mutatie)

  SELF.AddRelation(Relate:Planning)

  SELF.AddRelation(Relate:ViewVoorraadCelTotaal)

  SELF.AddRelation(Relate:Partij)

  SELF.AddRelation(Relate:ViewVoorraadPartij)

  SELF.AddRelation(Relate:VoorraadVerloop)

  SELF.AddRelation(Relate:BulkOverboeking)

  SELF.AddRelation(Relate:CelLocatie,RI:None,RI:None,CL:FK_CelLocatie)
  SELF.AddRelationLink(ACel:CelID,CL:CelID)


Hide:Relate:ACel.Kill PROCEDURE

  CODE
  _Hide:Access:ACel.Kill                                   ! Kill the file manager
  PARENT.Kill
  Relate:ACel &= NULL                                      ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:ACel)                               ! destroy the file manager


Hide:Relate:AACel.Init PROCEDURE()
  CODE
  _Hide:Access:AACel.Init
  SELF.Init(Access:AACel,1)
  SELF.SetAlias(Relate:Cel)


Hide:Access:AACel.DeleteRecord PROCEDURE(BYTE Query=1)

ReturnValue          BYTE,AUTO

  CODE
  GebruikerLogClass.Log('Delete', 'Cel', GebruikerLogClass.BepaalRecordContent(AACEL:Record))
  ReturnValue = PARENT.DeleteRecord(Query)
  RETURN ReturnValue


Hide:Access:AACel.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= AACel:Record
  SELF.AliasedFile &= Access:Cel                           !This is a File Alias, so assign aliased file manager
  SELF.FileNameValue = 'AACel'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= AACel
  PARENT.Init
  Access:AACel &= SELF
  SELF.LazyOpen = False


Hide:Access:AACel.Insert PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GebruikerLogClass.Log('Insert', 'Cel', GebruikerLogClass.BepaalRecordContent(AACEL:Record))
  ReturnValue = PARENT.Insert()
  RETURN ReturnValue


Hide:Access:AACel.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:AACel &= NULL                                     ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:AACel.TryInsert PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GebruikerLogClass.Log('Insert', 'Cel', GebruikerLogClass.BepaalRecordContent(AACEL:Record))
  ReturnValue = PARENT.TryInsert()
  RETURN ReturnValue


Hide:Access:AACel.TryUpdate PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GebruikerLogClass.Log('Update', 'Cel', GebruikerLogClass.BepaalRecordContent(AACEL:Record))
  ReturnValue = PARENT.TryUpdate()
  RETURN ReturnValue


Hide:Access:AACel.Update PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GebruikerLogClass.Log('Update', 'Cel', GebruikerLogClass.BepaalRecordContent(AACEL:Record))
  ReturnValue = PARENT.Update()
  RETURN ReturnValue


Hide:Access:AACel.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(AACel,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(AACel:CEL_PK,'AACel:CEL_PK',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:AACel.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:Mutatie)

  SELF.AddRelation(Relate:APlanning)

  SELF.AddRelation(Relate:AAPlanning)

  SELF.AddRelation(Relate:CelLocatie,RI:None,RI:None,CL:FK_CelLocatie)
  SELF.AddRelationLink(AACel:CelID,CL:CelID)


Hide:Relate:AACel.Kill PROCEDURE

  CODE
  _Hide:Access:AACel.Kill                                  ! Kill the file manager
  PARENT.Kill
  Relate:AACel &= NULL                                     ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:AACel)                              ! destroy the file manager


Hide:Relate:AViewVoorraadCelTotaal.Init PROCEDURE()
  CODE
  _Hide:Access:AViewVoorraadCelTotaal.Init
  SELF.Init(Access:AViewVoorraadCelTotaal,1)
  SELF.SetAlias(Relate:ViewVoorraadCelTotaal)


Hide:Access:AViewVoorraadCelTotaal.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= AVVCT:Record
  SELF.AliasedFile &= Access:ViewVoorraadCelTotaal         !This is a File Alias, so assign aliased file manager
  SELF.FileNameValue = 'AViewVoorraadCelTotaal'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= AViewVoorraadCelTotaal
  PARENT.Init
  Access:AViewVoorraadCelTotaal &= SELF
  SELF.LazyOpen = False


Hide:Access:AViewVoorraadCelTotaal.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:AViewVoorraadCelTotaal &= NULL                    ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:AViewVoorraadCelTotaal.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(AViewVoorraadCelTotaal,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(AVVCT:ViewVoorraadCelTotaal_PK,'AVVCT:ViewVoorraadCelTotaal_PK',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:AViewVoorraadCelTotaal.Kill PROCEDURE

  CODE
  _Hide:Access:AViewVoorraadCelTotaal.Kill                 ! Kill the file manager
  PARENT.Kill
  Relate:AViewVoorraadCelTotaal &= NULL                    ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:AViewVoorraadCelTotaal)             ! destroy the file manager


Hide:Relate:AVerpakking.Init PROCEDURE()
  CODE
  _Hide:Access:AVerpakking.Init
  SELF.Init(Access:AVerpakking,1)
  SELF.SetAlias(Relate:Verpakking)


Hide:Access:AVerpakking.DeleteRecord PROCEDURE(BYTE Query=1)

ReturnValue          BYTE,AUTO

  CODE
  GebruikerLogClass.Log('Delete', 'Verpakking', GebruikerLogClass.BepaalRecordContent(AVP:Record))
  ReturnValue = PARENT.DeleteRecord(Query)
  RETURN ReturnValue


Hide:Access:AVerpakking.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= AVP:Record
  SELF.AliasedFile &= Access:Verpakking                    !This is a File Alias, so assign aliased file manager
  SELF.FileNameValue = 'AVerpakking'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= AVerpakking
  PARENT.Init
  Access:AVerpakking &= SELF
  SELF.LazyOpen = False


Hide:Access:AVerpakking.Insert PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GebruikerLogClass.Log('Delete', 'Verpakking', GebruikerLogClass.BepaalRecordContent(AVP:Record))
  ReturnValue = PARENT.Insert()
  RETURN ReturnValue


Hide:Access:AVerpakking.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:AVerpakking &= NULL                               ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:AVerpakking.TryInsert PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GebruikerLogClass.Log('Insert', 'Verpakking', GebruikerLogClass.BepaalRecordContent(AVP:Record))
  ReturnValue = PARENT.TryInsert()
  RETURN ReturnValue


Hide:Access:AVerpakking.TryUpdate PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GebruikerLogClass.Log('Update', 'Verpakking', GebruikerLogClass.BepaalRecordContent(AVP:Record))
  ReturnValue = PARENT.TryUpdate()
  RETURN ReturnValue


Hide:Access:AVerpakking.Update PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GebruikerLogClass.Log('Update', 'Verpakking', GebruikerLogClass.BepaalRecordContent(AVP:Record))
  ReturnValue = PARENT.Update()
  RETURN ReturnValue


Hide:Access:AVerpakking.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(AVerpakking,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(AVP:Verpakking_PK,'AVP:Verpakking_PK',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:AVerpakking.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:Partij)

  SELF.AddRelation(Relate:APlanning)


Hide:Relate:AVerpakking.Kill PROCEDURE

  CODE
  _Hide:Access:AVerpakking.Kill                            ! Kill the file manager
  PARENT.Kill
  Relate:AVerpakking &= NULL                               ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:AVerpakking)                        ! destroy the file manager


Hide:Relate:AAARelatie.Init PROCEDURE()
  CODE
  _Hide:Access:AAARelatie.Init
  SELF.Init(Access:AAARelatie,1)
  SELF.SetAlias(Relate:Relatie)


Hide:Access:AAARelatie.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= AAARel:Record
  SELF.AliasedFile &= Access:Relatie                       !This is a File Alias, so assign aliased file manager
  SELF.FileNameValue = 'AAARelatie'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= AAARelatie
  PARENT.Init
  Access:AAARelatie &= SELF
  SELF.LazyOpen = False


Hide:Access:AAARelatie.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:AAARelatie &= NULL                                ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:AAARelatie.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(AAARelatie,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(AAARel:Relatie_FK02,'AAARel:Relatie_FK02',0)
    SELF.AddKey(AAARel:Relatie_FK01,'AAARel:Relatie_FK01',0)
    SELF.AddKey(AAARel:Relatie_PK,'AAARel:Relatie_PK',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:AAARelatie.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:Verkoop)


Hide:Relate:AAARelatie.Kill PROCEDURE

  CODE
  _Hide:Access:AAARelatie.Kill                             ! Kill the file manager
  PARENT.Kill
  Relate:AAARelatie &= NULL                                ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:AAARelatie)                         ! destroy the file manager


Hide:Relate:AAAARelatie.Init PROCEDURE()
  CODE
  _Hide:Access:AAAARelatie.Init
  SELF.Init(Access:AAAARelatie,1)
  SELF.SetAlias(Relate:Relatie)


Hide:Access:AAAARelatie.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= AAAARelatie:Record
  SELF.AliasedFile &= Access:Relatie                       !This is a File Alias, so assign aliased file manager
  SELF.FileNameValue = 'AAAARelatie'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= AAAARelatie
  PARENT.Init
  Access:AAAARelatie &= SELF
  SELF.LazyOpen = False


Hide:Access:AAAARelatie.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:AAAARelatie &= NULL                               ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:AAAARelatie.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(AAAARelatie,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(AAAARelatie:Relatie_FK02,'AAAARelatie:Relatie_FK02',0)
    SELF.AddKey(AAAARelatie:Relatie_FK01,'AAAARelatie:Relatie_FK01',0)
    SELF.AddKey(AAAARelatie:Relatie_PK,'AAAARelatie:Relatie_PK',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:AAAARelatie.Kill PROCEDURE

  CODE
  _Hide:Access:AAAARelatie.Kill                            ! Kill the file manager
  PARENT.Kill
  Relate:AAAARelatie &= NULL                               ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:AAAARelatie)                        ! destroy the file manager


Hide:Relate:AViewTransporteur.Init PROCEDURE()
  CODE
  _Hide:Access:AViewTransporteur.Init
  SELF.Init(Access:AViewTransporteur,1)
  SELF.SetAlias(Relate:ViewTransporteur)


Hide:Access:AViewTransporteur.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= AVTRA:Record
  SELF.AliasedFile &= Access:ViewTransporteur              !This is a File Alias, so assign aliased file manager
  SELF.FileNameValue = 'AViewTransporteur'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= AViewTransporteur
  PARENT.Init
  Access:AViewTransporteur &= SELF
  SELF.LazyOpen = False


Hide:Access:AViewTransporteur.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:AViewTransporteur &= NULL                         ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:AViewTransporteur.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(AViewTransporteur,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(AVTRA:ViewTransporteur_PK,'AVTRA:ViewTransporteur_PK',0)
    SELF.AddKey(AVTRA:ViewTransporteur_FK1,'Op RelatieID',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:AViewTransporteur.Kill PROCEDURE

  CODE
  _Hide:Access:AViewTransporteur.Kill                      ! Kill the file manager
  PARENT.Kill
  Relate:AViewTransporteur &= NULL                         ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:AViewTransporteur)                  ! destroy the file manager


Hide:Relate:APalletMutatie.Init PROCEDURE()
  CODE
  _Hide:Access:APalletMutatie.Init
  SELF.Init(Access:APalletMutatie,1)
  SELF.SetAlias(Relate:PalletMutatie)


Hide:Access:APalletMutatie.DeleteRecord PROCEDURE(BYTE Query=1)

ReturnValue          BYTE,AUTO

  CODE
  GebruikerLogClass.Log('Delete', 'PalletMutatie', GebruikerLogClass.BepaalRecordContent(APM:Record))
  ReturnValue = PARENT.DeleteRecord(Query)
  RETURN ReturnValue


Hide:Access:APalletMutatie.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= APM:Record
  SELF.AliasedFile &= Access:PalletMutatie                 !This is a File Alias, so assign aliased file manager
  SELF.FileNameValue = 'APalletMutatie'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= APalletMutatie
  PARENT.Init
  Access:APalletMutatie &= SELF
  SELF.LazyOpen = False


Hide:Access:APalletMutatie.Insert PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GebruikerLogClass.Log('Insert', 'PalletMutatie', GebruikerLogClass.BepaalRecordContent(APM:Record))
  ReturnValue = PARENT.Insert()
  RETURN ReturnValue


Hide:Access:APalletMutatie.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:APalletMutatie &= NULL                            ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:APalletMutatie.TryInsert PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GebruikerLogClass.Log('Insert', 'PalletMutatie', GebruikerLogClass.BepaalRecordContent(APM:Record))
  ReturnValue = PARENT.TryInsert()
  RETURN ReturnValue


Hide:Access:APalletMutatie.TryUpdate PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GebruikerLogClass.Log('Update', 'PalletMutatie', GebruikerLogClass.BepaalRecordContent(APM:Record))
  ReturnValue = PARENT.TryUpdate()
  RETURN ReturnValue


Hide:Access:APalletMutatie.Update PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GebruikerLogClass.Log('Update', 'PalletMutatie', GebruikerLogClass.BepaalRecordContent(APM:Record))
  ReturnValue = PARENT.Update()
  RETURN ReturnValue


Hide:Access:APalletMutatie.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(APalletMutatie,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(APM:PalletMutatie_PK,'APM:PalletMutatie_PK',0)
    SELF.AddKey(APM:PalletMutatie_FK1,'PalletSoortID_PalletMutatieID_K',0)
    SELF.AddKey(APM:PalletMutatie_FK2,'RelatieID_PalletSoortID_PalletMutatie_K',0)
    SELF.AddKey(APM:PalletMutatie_FK3,'APM:PalletMutatie_FK3',0)
    SELF.AddKey(APM:PalletMutatie_FK4,'Op VerkoopID_PalletMutatie_K',0)
    SELF.AddKey(APM:PalletMutatie_FK5,'APM:PalletMutatie_FK5',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:APalletMutatie.Kill PROCEDURE

  CODE
  _Hide:Access:APalletMutatie.Kill                         ! Kill the file manager
  PARENT.Kill
  Relate:APalletMutatie &= NULL                            ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:APalletMutatie)                     ! destroy the file manager


Hide:Relate:AAACel.Init PROCEDURE()
  CODE
  _Hide:Access:AAACel.Init
  SELF.Init(Access:AAACel,1)
  SELF.SetAlias(Relate:Cel)


Hide:Access:AAACel.DeleteRecord PROCEDURE(BYTE Query=1)

ReturnValue          BYTE,AUTO

  CODE
  GebruikerLogClass.Log('Delete', 'Cel', GebruikerLogClass.BepaalRecordContent(AAACEL:Record))
  ReturnValue = PARENT.DeleteRecord(Query)
  RETURN ReturnValue


Hide:Access:AAACel.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= AAACel:Record
  SELF.AliasedFile &= Access:Cel                           !This is a File Alias, so assign aliased file manager
  SELF.FileNameValue = 'AAACel'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= AAACel
  PARENT.Init
  Access:AAACel &= SELF
  SELF.LazyOpen = False


Hide:Access:AAACel.Insert PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GebruikerLogClass.Log('Insert', 'Cel', GebruikerLogClass.BepaalRecordContent(AAACEL:Record))
  ReturnValue = PARENT.Insert()
  RETURN ReturnValue


Hide:Access:AAACel.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:AAACel &= NULL                                    ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:AAACel.TryInsert PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GebruikerLogClass.Log('Insert', 'Cel', GebruikerLogClass.BepaalRecordContent(AAACEL:Record))
  ReturnValue = PARENT.TryInsert()
  RETURN ReturnValue


Hide:Access:AAACel.TryUpdate PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GebruikerLogClass.Log('Update', 'Cel', GebruikerLogClass.BepaalRecordContent(AAACEL:Record))
  ReturnValue = PARENT.TryUpdate()
  RETURN ReturnValue


Hide:Access:AAACel.Update PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GebruikerLogClass.Log('Update', 'Cel', GebruikerLogClass.BepaalRecordContent(AAACEL:Record))
  ReturnValue = PARENT.Update()
  RETURN ReturnValue


Hide:Access:AAACel.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(AAACel,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(AAACel:CEL_PK,'AAACel:CEL_PK',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:AAACel.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:APlanning)

  SELF.AddRelation(Relate:AAPlanning)

  SELF.AddRelation(Relate:CelLocatie,RI:None,RI:None,CL:FK_CelLocatie)
  SELF.AddRelationLink(AAACel:CelID,CL:CelID)


Hide:Relate:AAACel.Kill PROCEDURE

  CODE
  _Hide:Access:AAACel.Kill                                 ! Kill the file manager
  PARENT.Kill
  Relate:AAACel &= NULL                                    ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:AAACel)                             ! destroy the file manager


Hide:Relate:APalletVerloop.Init PROCEDURE()
  CODE
  _Hide:Access:APalletVerloop.Init
  SELF.Init(Access:APalletVerloop,1)
  SELF.SetAlias(Relate:PalletVerloop)


Hide:Access:APalletVerloop.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= APal3:Record
  SELF.AliasedFile &= Access:PalletVerloop                 !This is a File Alias, so assign aliased file manager
  SELF.FileNameValue = 'APalletVerloop'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= APalletVerloop
  PARENT.Init
  Access:APalletVerloop &= SELF
  SELF.LazyOpen = False


Hide:Access:APalletVerloop.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:APalletVerloop &= NULL                            ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:APalletVerloop.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(APalletVerloop,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(APal3:PalletVerloop_FK1,'Op PalletSoort/Planning (DESC)/ID',0)
    SELF.AddKey(APal3:PalletVerloop_FK2,'Op RelatieID/PalletSoort/Planning (DESC)/ID',0)
    SELF.AddKey(APal3:PalletVerloop_PK,'APal3:PalletVerloop_PK',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:APalletVerloop.Kill PROCEDURE

  CODE
  _Hide:Access:APalletVerloop.Kill                         ! Kill the file manager
  PARENT.Kill
  Relate:APalletVerloop &= NULL                            ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:APalletVerloop)                     ! destroy the file manager

