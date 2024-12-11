  MEMBER('VoorrDct.clw')

  INCLUDE('ABFILE.INC'),ONCE

  MAP
VoorrDct_BC5:DctInit    PROCEDURE()
VoorrDct_BC5:DctKill    PROCEDURE()
VoorrDct_BC5:FilesInit  PROCEDURE()
  END

Hide:Access:AViewVoorraadPartij_INDEXED CLASS(FileManager),TYPE ! FileManager for AViewVoorraadPartij_INDEXED
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:AViewVoorraadPartij_INDEXED CLASS(RelationManager),TYPE ! RelationManager for AViewVoorraadPartij_INDEXED
Init                   PROCEDURE
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:AAAViewVoorraadPartij_INDEXED CLASS(FileManager),TYPE ! FileManager for AAAViewVoorraadPartij_INDEXED
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:AAAViewVoorraadPartij_INDEXED CLASS(RelationManager),TYPE ! RelationManager for AAAViewVoorraadPartij_INDEXED
Init                   PROCEDURE
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:AAAAViewVoorraadPartij_INDEXED CLASS(FileManager),TYPE ! FileManager for AAAAViewVoorraadPartij_INDEXED
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:AAAAViewVoorraadPartij_INDEXED CLASS(RelationManager),TYPE ! RelationManager for AAAAViewVoorraadPartij_INDEXED
Init                   PROCEDURE
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:AAViewVoorraadPartij_INDEXED CLASS(FileManager),TYPE ! FileManager for AAViewVoorraadPartij_INDEXED
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:AAViewVoorraadPartij_INDEXED CLASS(RelationManager),TYPE ! RelationManager for AAViewVoorraadPartij_INDEXED
Init                   PROCEDURE
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:AVoorraadVerloop CLASS(FileManager),TYPE       ! FileManager for AVoorraadVerloop
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:AVoorraadVerloop CLASS(RelationManager),TYPE   ! RelationManager for AVoorraadVerloop
Init                   PROCEDURE
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:AAPlanningVerkoop CLASS(FileManager),TYPE      ! FileManager for AAPlanningVerkoop
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:AAPlanningVerkoop CLASS(RelationManager),TYPE  ! RelationManager for AAPlanningVerkoop
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:APalletBladSjabloon CLASS(FileManager),TYPE    ! FileManager for APalletBladSjabloon
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:APalletBladSjabloon CLASS(RelationManager),TYPE ! RelationManager for APalletBladSjabloon
Init                   PROCEDURE
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:ARelatieArtikelOmschrijving CLASS(FileManager),TYPE ! FileManager for ARelatieArtikelOmschrijving
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:ARelatieArtikelOmschrijving CLASS(RelationManager),TYPE ! RelationManager for ARelatieArtikelOmschrijving
Init                   PROCEDURE
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:AAViewTransporteur CLASS(FileManager),TYPE     ! FileManager for AAViewTransporteur
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:AAViewTransporteur CLASS(RelationManager),TYPE ! RelationManager for AAViewTransporteur
Init                   PROCEDURE
Kill                   PROCEDURE(),DERIVED
                     END


_Hide:Access:AViewVoorraadPartij_INDEXED &Hide:Access:AViewVoorraadPartij_INDEXED,AUTO,THREAD
_Hide:Relate:AViewVoorraadPartij_INDEXED &Hide:Relate:AViewVoorraadPartij_INDEXED,AUTO,THREAD
_Hide:Access:AAAViewVoorraadPartij_INDEXED &Hide:Access:AAAViewVoorraadPartij_INDEXED,AUTO,THREAD
_Hide:Relate:AAAViewVoorraadPartij_INDEXED &Hide:Relate:AAAViewVoorraadPartij_INDEXED,AUTO,THREAD
_Hide:Access:AAAAViewVoorraadPartij_INDEXED &Hide:Access:AAAAViewVoorraadPartij_INDEXED,AUTO,THREAD
_Hide:Relate:AAAAViewVoorraadPartij_INDEXED &Hide:Relate:AAAAViewVoorraadPartij_INDEXED,AUTO,THREAD
_Hide:Access:AAViewVoorraadPartij_INDEXED &Hide:Access:AAViewVoorraadPartij_INDEXED,AUTO,THREAD
_Hide:Relate:AAViewVoorraadPartij_INDEXED &Hide:Relate:AAViewVoorraadPartij_INDEXED,AUTO,THREAD
_Hide:Access:AVoorraadVerloop &Hide:Access:AVoorraadVerloop,AUTO,THREAD
_Hide:Relate:AVoorraadVerloop &Hide:Relate:AVoorraadVerloop,AUTO,THREAD
_Hide:Access:AAPlanningVerkoop &Hide:Access:AAPlanningVerkoop,AUTO,THREAD
_Hide:Relate:AAPlanningVerkoop &Hide:Relate:AAPlanningVerkoop,AUTO,THREAD
_Hide:Access:APalletBladSjabloon &Hide:Access:APalletBladSjabloon,AUTO,THREAD
_Hide:Relate:APalletBladSjabloon &Hide:Relate:APalletBladSjabloon,AUTO,THREAD
_Hide:Access:ARelatieArtikelOmschrijving &Hide:Access:ARelatieArtikelOmschrijving,AUTO,THREAD
_Hide:Relate:ARelatieArtikelOmschrijving &Hide:Relate:ARelatieArtikelOmschrijving,AUTO,THREAD
_Hide:Access:AAViewTransporteur &Hide:Access:AAViewTransporteur,AUTO,THREAD
_Hide:Relate:AAViewTransporteur &Hide:Relate:AAViewTransporteur,AUTO,THREAD


VoorrDct_BC5:DctInit PROCEDURE()
  CODE
  _Hide:Access:AViewVoorraadPartij_INDEXED &= NEW(Hide:Access:AViewVoorraadPartij_INDEXED)
  _Hide:Relate:AViewVoorraadPartij_INDEXED &= NEW(Hide:Relate:AViewVoorraadPartij_INDEXED)
  _Hide:Access:AAAViewVoorraadPartij_INDEXED &= NEW(Hide:Access:AAAViewVoorraadPartij_INDEXED)
  _Hide:Relate:AAAViewVoorraadPartij_INDEXED &= NEW(Hide:Relate:AAAViewVoorraadPartij_INDEXED)
  _Hide:Access:AAAAViewVoorraadPartij_INDEXED &= NEW(Hide:Access:AAAAViewVoorraadPartij_INDEXED)
  _Hide:Relate:AAAAViewVoorraadPartij_INDEXED &= NEW(Hide:Relate:AAAAViewVoorraadPartij_INDEXED)
  _Hide:Access:AAViewVoorraadPartij_INDEXED &= NEW(Hide:Access:AAViewVoorraadPartij_INDEXED)
  _Hide:Relate:AAViewVoorraadPartij_INDEXED &= NEW(Hide:Relate:AAViewVoorraadPartij_INDEXED)
  _Hide:Access:AVoorraadVerloop &= NEW(Hide:Access:AVoorraadVerloop)
  _Hide:Relate:AVoorraadVerloop &= NEW(Hide:Relate:AVoorraadVerloop)
  _Hide:Access:AAPlanningVerkoop &= NEW(Hide:Access:AAPlanningVerkoop)
  _Hide:Relate:AAPlanningVerkoop &= NEW(Hide:Relate:AAPlanningVerkoop)
  _Hide:Access:APalletBladSjabloon &= NEW(Hide:Access:APalletBladSjabloon)
  _Hide:Relate:APalletBladSjabloon &= NEW(Hide:Relate:APalletBladSjabloon)
  _Hide:Access:ARelatieArtikelOmschrijving &= NEW(Hide:Access:ARelatieArtikelOmschrijving)
  _Hide:Relate:ARelatieArtikelOmschrijving &= NEW(Hide:Relate:ARelatieArtikelOmschrijving)
  _Hide:Access:AAViewTransporteur &= NEW(Hide:Access:AAViewTransporteur)
  _Hide:Relate:AAViewTransporteur &= NEW(Hide:Relate:AAViewTransporteur)
  Relate:AViewVoorraadPartij_INDEXED &= _Hide:Relate:AViewVoorraadPartij_INDEXED
  Relate:AAAViewVoorraadPartij_INDEXED &= _Hide:Relate:AAAViewVoorraadPartij_INDEXED
  Relate:AAAAViewVoorraadPartij_INDEXED &= _Hide:Relate:AAAAViewVoorraadPartij_INDEXED
  Relate:AAViewVoorraadPartij_INDEXED &= _Hide:Relate:AAViewVoorraadPartij_INDEXED
  Relate:AVoorraadVerloop &= _Hide:Relate:AVoorraadVerloop
  Relate:AAPlanningVerkoop &= _Hide:Relate:AAPlanningVerkoop
  Relate:APalletBladSjabloon &= _Hide:Relate:APalletBladSjabloon
  Relate:ARelatieArtikelOmschrijving &= _Hide:Relate:ARelatieArtikelOmschrijving
  Relate:AAViewTransporteur &= _Hide:Relate:AAViewTransporteur


VoorrDct_BC5:FilesInit PROCEDURE()
  CODE
  _Hide:Relate:AViewVoorraadPartij_INDEXED.Init
  _Hide:Relate:AAAViewVoorraadPartij_INDEXED.Init
  _Hide:Relate:AAAAViewVoorraadPartij_INDEXED.Init
  _Hide:Relate:AAViewVoorraadPartij_INDEXED.Init
  _Hide:Relate:AVoorraadVerloop.Init
  _Hide:Relate:AAPlanningVerkoop.Init
  _Hide:Relate:APalletBladSjabloon.Init
  _Hide:Relate:ARelatieArtikelOmschrijving.Init
  _Hide:Relate:AAViewTransporteur.Init


VoorrDct_BC5:DctKill PROCEDURE()
  CODE
  _Hide:Relate:AViewVoorraadPartij_INDEXED.Kill
  DISPOSE(_Hide:Relate:AViewVoorraadPartij_INDEXED)
  _Hide:Relate:AAAViewVoorraadPartij_INDEXED.Kill
  DISPOSE(_Hide:Relate:AAAViewVoorraadPartij_INDEXED)
  _Hide:Relate:AAAAViewVoorraadPartij_INDEXED.Kill
  DISPOSE(_Hide:Relate:AAAAViewVoorraadPartij_INDEXED)
  _Hide:Relate:AAViewVoorraadPartij_INDEXED.Kill
  DISPOSE(_Hide:Relate:AAViewVoorraadPartij_INDEXED)
  _Hide:Relate:AVoorraadVerloop.Kill
  DISPOSE(_Hide:Relate:AVoorraadVerloop)
  _Hide:Relate:AAPlanningVerkoop.Kill
  DISPOSE(_Hide:Relate:AAPlanningVerkoop)
  _Hide:Relate:APalletBladSjabloon.Kill
  DISPOSE(_Hide:Relate:APalletBladSjabloon)
  _Hide:Relate:ARelatieArtikelOmschrijving.Kill
  DISPOSE(_Hide:Relate:ARelatieArtikelOmschrijving)
  _Hide:Relate:AAViewTransporteur.Kill
  DISPOSE(_Hide:Relate:AAViewTransporteur)


Hide:Relate:AViewVoorraadPartij_INDEXED.Init PROCEDURE()
  CODE
  _Hide:Access:AViewVoorraadPartij_INDEXED.Init
  SELF.Init(Access:AViewVoorraadPartij_INDEXED,1)
  SELF.SetAlias(Relate:ViewVoorraadPartij_INDEXED)


Hide:Access:AViewVoorraadPartij_INDEXED.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= AVVParI:Record
  SELF.AliasedFile &= Access:ViewVoorraadPartij_INDEXED    !This is a File Alias, so assign aliased file manager
  SELF.FileNameValue = 'AViewVoorraadPartij_INDEXED'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= AViewVoorraadPartij_INDEXED
  PARENT.Init
  Access:AViewVoorraadPartij_INDEXED &= SELF
  SELF.LazyOpen = False
  SELF.DoNotAssertOnCloseMisuse = 1  ! ABCDefaults
   IF SELF.File{prop:sqldriver} THEN SELF.create = 0.         ! ABCDefaults


Hide:Access:AViewVoorraadPartij_INDEXED.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:AViewVoorraadPartij_INDEXED &= NULL               ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:AViewVoorraadPartij_INDEXED.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(AViewVoorraadPartij_INDEXED,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(AVVParI:ExternPartijnr_PartijID_CelID_K,'AVVParI:ExternPartijnr_PartijID_CelID_K',0)
    SELF.AddKey(AVVParI:PartijID_CelID_K,'AVVParI:PartijID_CelID_K',0)
    SELF.AddKey(AVVParI:ArtikelID_PartijID_CelID_K,'AVVParI:ArtikelID_PartijID_CelID_K',0)
    SELF.AddKey(AVVParI:ArtikelOms_PartijID_CelID_K,'AVVParI:ArtikelOms_PartijID_CelID_K',0)
    SELF.AddKey(AVVParI:ArtikelID_CelID_PartijID_K,'AVVParI:ArtikelID_CelID_PartijID_K',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  IF SELF.File{prop:sqldriver} THEN SELF.create = 0.          ! ABCDefaults
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:AViewVoorraadPartij_INDEXED.Kill PROCEDURE

  CODE
  _Hide:Access:AViewVoorraadPartij_INDEXED.Kill            ! Kill the file manager
  PARENT.Kill
  Relate:AViewVoorraadPartij_INDEXED &= NULL               ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:AViewVoorraadPartij_INDEXED)        ! destroy the file manager


Hide:Relate:AAAViewVoorraadPartij_INDEXED.Init PROCEDURE()
  CODE
  _Hide:Access:AAAViewVoorraadPartij_INDEXED.Init
  SELF.Init(Access:AAAViewVoorraadPartij_INDEXED,1)
  SELF.SetAlias(Relate:ViewVoorraadPartij_INDEXED)


Hide:Access:AAAViewVoorraadPartij_INDEXED.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= AAAVVPar_INDEX:Record
  SELF.AliasedFile &= Access:ViewVoorraadPartij_INDEXED    !This is a File Alias, so assign aliased file manager
  SELF.FileNameValue = 'AAAViewVoorraadPartij_INDEXED'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= AAAViewVoorraadPartij_INDEXED
  PARENT.Init
  Access:AAAViewVoorraadPartij_INDEXED &= SELF
  SELF.LazyOpen = False
  SELF.DoNotAssertOnCloseMisuse = 1  ! ABCDefaults
   IF SELF.File{prop:sqldriver} THEN SELF.create = 0.         ! ABCDefaults


Hide:Access:AAAViewVoorraadPartij_INDEXED.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:AAAViewVoorraadPartij_INDEXED &= NULL             ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:AAAViewVoorraadPartij_INDEXED.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(AAAViewVoorraadPartij_INDEXED,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(AAAVVPar_INDEX:ExternPartijnr_PartijID_CelID_K,'AAAVVPar_INDEX:ExternPartijnr_PartijID_CelID_K',0)
    SELF.AddKey(AAAVVPar_INDEX:PartijID_CelID_K,'AAAVVPar_INDEX:PartijID_CelID_K',0)
    SELF.AddKey(AAAVVPar_INDEX:ArtikelID_PartijID_CelID_K,'AAAVVPar_INDEX:ArtikelID_PartijID_CelID_K',0)
    SELF.AddKey(AAAVVPar_INDEX:ArtikelOms_PartijID_CelID_K,'AAAVVPar_INDEX:ArtikelOms_PartijID_CelID_K',0)
    SELF.AddKey(AAAVVPar_INDEX:ArtikelID_CelID_PartijID_K,'AAAVVPar_INDEX:ArtikelID_CelID_PartijID_K',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  IF SELF.File{prop:sqldriver} THEN SELF.create = 0.          ! ABCDefaults
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:AAAViewVoorraadPartij_INDEXED.Kill PROCEDURE

  CODE
  _Hide:Access:AAAViewVoorraadPartij_INDEXED.Kill          ! Kill the file manager
  PARENT.Kill
  Relate:AAAViewVoorraadPartij_INDEXED &= NULL             ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:AAAViewVoorraadPartij_INDEXED)      ! destroy the file manager


Hide:Relate:AAAAViewVoorraadPartij_INDEXED.Init PROCEDURE()
  CODE
  _Hide:Access:AAAAViewVoorraadPartij_INDEXED.Init
  SELF.Init(Access:AAAAViewVoorraadPartij_INDEXED,1)
  SELF.SetAlias(Relate:ViewVoorraadPartij_INDEXED)


Hide:Access:AAAAViewVoorraadPartij_INDEXED.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= AAAAVVParI:Record
  SELF.AliasedFile &= Access:ViewVoorraadPartij_INDEXED    !This is a File Alias, so assign aliased file manager
  SELF.FileNameValue = 'AAAAViewVoorraadPartij_INDEXED'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= AAAAViewVoorraadPartij_INDEXED
  PARENT.Init
  Access:AAAAViewVoorraadPartij_INDEXED &= SELF
  SELF.LazyOpen = False
  SELF.DoNotAssertOnCloseMisuse = 1  ! ABCDefaults
   IF SELF.File{prop:sqldriver} THEN SELF.create = 0.         ! ABCDefaults


Hide:Access:AAAAViewVoorraadPartij_INDEXED.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:AAAAViewVoorraadPartij_INDEXED &= NULL            ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:AAAAViewVoorraadPartij_INDEXED.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(AAAAViewVoorraadPartij_INDEXED,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(AAAAVVParI:ExternPartijnr_PartijID_CelID_K,'AAAAVVParI:ExternPartijnr_PartijID_CelID_K',0)
    SELF.AddKey(AAAAVVParI:PartijID_CelID_K,'AAAAVVParI:PartijID_CelID_K',0)
    SELF.AddKey(AAAAVVParI:ArtikelID_PartijID_CelID_K,'AAAAVVParI:ArtikelID_PartijID_CelID_K',0)
    SELF.AddKey(AAAAVVParI:ArtikelOms_PartijID_CelID_K,'AAAAVVParI:ArtikelOms_PartijID_CelID_K',0)
    SELF.AddKey(AAAAVVParI:ArtikelID_CelID_PartijID_K,'AAAAVVParI:ArtikelID_CelID_PartijID_K',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  IF SELF.File{prop:sqldriver} THEN SELF.create = 0.          ! ABCDefaults
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:AAAAViewVoorraadPartij_INDEXED.Kill PROCEDURE

  CODE
  _Hide:Access:AAAAViewVoorraadPartij_INDEXED.Kill         ! Kill the file manager
  PARENT.Kill
  Relate:AAAAViewVoorraadPartij_INDEXED &= NULL            ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:AAAAViewVoorraadPartij_INDEXED)     ! destroy the file manager


Hide:Relate:AAViewVoorraadPartij_INDEXED.Init PROCEDURE()
  CODE
  _Hide:Access:AAViewVoorraadPartij_INDEXED.Init
  SELF.Init(Access:AAViewVoorraadPartij_INDEXED,1)
  SELF.SetAlias(Relate:ViewVoorraadPartij_INDEXED)


Hide:Access:AAViewVoorraadPartij_INDEXED.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= AAVVParI:Record
  SELF.AliasedFile &= Access:ViewVoorraadPartij_INDEXED    !This is a File Alias, so assign aliased file manager
  SELF.FileNameValue = 'AAViewVoorraadPartij_INDEXED'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= AAViewVoorraadPartij_INDEXED
  PARENT.Init
  Access:AAViewVoorraadPartij_INDEXED &= SELF
  SELF.LazyOpen = False
  SELF.DoNotAssertOnCloseMisuse = 1  ! ABCDefaults
   IF SELF.File{prop:sqldriver} THEN SELF.create = 0.         ! ABCDefaults


Hide:Access:AAViewVoorraadPartij_INDEXED.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:AAViewVoorraadPartij_INDEXED &= NULL              ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:AAViewVoorraadPartij_INDEXED.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(AAViewVoorraadPartij_INDEXED,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(AAVVParI:ExternPartijnr_PartijID_CelID_K,'AAVVParI:ExternPartijnr_PartijID_CelID_K',0)
    SELF.AddKey(AAVVParI:PartijID_CelID_K,'AAVVParI:PartijID_CelID_K',0)
    SELF.AddKey(AAVVParI:ArtikelID_PartijID_CelID_K,'AAVVParI:ArtikelID_PartijID_CelID_K',0)
    SELF.AddKey(AAVVParI:ArtikelOms_PartijID_CelID_K,'AAVVParI:ArtikelOms_PartijID_CelID_K',0)
    SELF.AddKey(AAVVParI:ArtikelID_CelID_PartijID_K,'AAVVParI:ArtikelID_CelID_PartijID_K',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  IF SELF.File{prop:sqldriver} THEN SELF.create = 0.          ! ABCDefaults
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:AAViewVoorraadPartij_INDEXED.Kill PROCEDURE

  CODE
  _Hide:Access:AAViewVoorraadPartij_INDEXED.Kill           ! Kill the file manager
  PARENT.Kill
  Relate:AAViewVoorraadPartij_INDEXED &= NULL              ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:AAViewVoorraadPartij_INDEXED)       ! destroy the file manager


Hide:Relate:AVoorraadVerloop.Init PROCEDURE()
  CODE
  _Hide:Access:AVoorraadVerloop.Init
  SELF.Init(Access:AVoorraadVerloop,1)
  SELF.SetAlias(Relate:VoorraadVerloop)


Hide:Access:AVoorraadVerloop.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= AVVL:Record
  SELF.AliasedFile &= Access:VoorraadVerloop               !This is a File Alias, so assign aliased file manager
  SELF.FileNameValue = 'AVoorraadVerloop'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= AVoorraadVerloop
  PARENT.Init
  Access:AVoorraadVerloop &= SELF
  SELF.LazyOpen = False
  SELF.DoNotAssertOnCloseMisuse = 1  ! ABCDefaults
   IF SELF.File{prop:sqldriver} THEN SELF.create = 0.         ! ABCDefaults


Hide:Access:AVoorraadVerloop.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:AVoorraadVerloop &= NULL                          ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:AVoorraadVerloop.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(AVoorraadVerloop,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(AVVL:ArtikelID_DatumTijdD_MutatieID_K,'AVVL:ArtikelID_DatumTijdD_MutatieID_K',0)
    SELF.AddKey(AVVL:ArtikelID_DatumTijdD_MutatieIDD_K,'AVVL:ArtikelID_DatumTijdD_MutatieIDD_K',0)
    SELF.AddKey(AVVL:ArtikelID_DatumTijd_MutatieID_K,'AVVL:ArtikelID_DatumTijd_MutatieID_K',0)
    SELF.AddKey(AVVL:ArtikelID_PartijID_DatumTijd_MutatieID_K,'AVVL:ArtikelID_PartijID_DatumTijd_MutatieID_K',0)
    SELF.AddKey(AVVL:ArtikelID_PartijID_DatumTijdD_MutatieID_K,'AVVL:ArtikelID_PartijID_DatumTijdD_MutatieID_K',0)
    SELF.AddKey(AVVL:ArtikelID_PartijID_DatumTijdD_MutatieIDD_K,'AVVL:ArtikelID_PartijID_DatumTijdD_MutatieIDD_K',0)
    SELF.AddKey(AVVL:ArtikelID_CelID_DatumTijdD_MutatieIDD_K,'AVVL:ArtikelID_CelID_DatumTijdD_MutatieIDD_K',0)
    SELF.AddKey(AVVL:ArtikelID_CelID_DatumTijdD_MutatieID_K,'AVVL:ArtikelID_CelID_DatumTijdD_MutatieID_K',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  IF SELF.File{prop:sqldriver} THEN SELF.create = 0.          ! ABCDefaults
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:AVoorraadVerloop.Kill PROCEDURE

  CODE
  _Hide:Access:AVoorraadVerloop.Kill                       ! Kill the file manager
  PARENT.Kill
  Relate:AVoorraadVerloop &= NULL                          ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:AVoorraadVerloop)                   ! destroy the file manager


Hide:Relate:AAPlanningVerkoop.Init PROCEDURE()
  CODE
  _Hide:Access:AAPlanningVerkoop.Init
  SELF.Init(Access:AAPlanningVerkoop,1)
  SELF.SetAlias(Relate:PlanningVerkoop)


Hide:Access:AAPlanningVerkoop.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= AAPla3:Record
  SELF.AliasedFile &= Access:PlanningVerkoop               !This is a File Alias, so assign aliased file manager
  SELF.FileNameValue = 'AAPlanningVerkoop'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= AAPlanningVerkoop
  PARENT.Init
  Access:AAPlanningVerkoop &= SELF
  SELF.LazyOpen = False
  SELF.DoNotAssertOnCloseMisuse = 1  ! ABCDefaults
   IF SELF.File{prop:sqldriver} THEN SELF.create = 0.         ! ABCDefaults


Hide:Access:AAPlanningVerkoop.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:AAPlanningVerkoop &= NULL                         ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:AAPlanningVerkoop.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(AAPlanningVerkoop,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(AAPla3:PlanningID_K,'AAPla3:PlanningID_K',0)
    SELF.AddKey(AAPla3:Verwerkt_Planning_FirmaNaam_K,'AAPla3:Verwerkt_Planning_FirmaNaam_K',0)
    SELF.AddKey(AAPla3:Planning_FirmaNaam_K,'AAPla3:Planning_FirmaNaam_K',0)
    SELF.AddKey(AAPla3:Planning_K,'AAPla3:Planning_K',0)
    SELF.AddKey(AAPla3:Verwerkt_Planning_K,'AAPla3:Verwerkt_Planning_K',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  IF SELF.File{prop:sqldriver} THEN SELF.create = 0.          ! ABCDefaults
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:AAPlanningVerkoop.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:Activiteit)


Hide:Relate:AAPlanningVerkoop.Kill PROCEDURE

  CODE
  _Hide:Access:AAPlanningVerkoop.Kill                      ! Kill the file manager
  PARENT.Kill
  Relate:AAPlanningVerkoop &= NULL                         ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:AAPlanningVerkoop)                  ! destroy the file manager


Hide:Relate:APalletBladSjabloon.Init PROCEDURE()
  CODE
  _Hide:Access:APalletBladSjabloon.Init
  SELF.Init(Access:APalletBladSjabloon,1)
  SELF.SetAlias(Relate:PalletBladSjabloon)


Hide:Access:APalletBladSjabloon.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= APBS:Record
  SELF.AliasedFile &= Access:PalletBladSjabloon            !This is a File Alias, so assign aliased file manager
  SELF.FileNameValue = 'APalletBladSjabloon'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= APalletBladSjabloon
  PARENT.Init
  Access:APalletBladSjabloon &= SELF
  SELF.LazyOpen = False
  SELF.DoNotAssertOnCloseMisuse = 1  ! ABCDefaults
   IF SELF.File{prop:sqldriver} THEN SELF.create = 0.         ! ABCDefaults


Hide:Access:APalletBladSjabloon.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:APalletBladSjabloon &= NULL                       ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:APalletBladSjabloon.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(APalletBladSjabloon,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(APBS:PK_PalletBladSjabloon,'APBS:PK_PalletBladSjabloon',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  IF SELF.File{prop:sqldriver} THEN SELF.create = 0.          ! ABCDefaults
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:APalletBladSjabloon.Kill PROCEDURE

  CODE
  _Hide:Access:APalletBladSjabloon.Kill                    ! Kill the file manager
  PARENT.Kill
  Relate:APalletBladSjabloon &= NULL                       ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:APalletBladSjabloon)                ! destroy the file manager


Hide:Relate:ARelatieArtikelOmschrijving.Init PROCEDURE()
  CODE
  _Hide:Access:ARelatieArtikelOmschrijving.Init
  SELF.Init(Access:ARelatieArtikelOmschrijving,1)
  SELF.SetAlias(Relate:RelatieArtikelOmschrijving)


Hide:Access:ARelatieArtikelOmschrijving.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= ARAO:Record
  SELF.AliasedFile &= Access:RelatieArtikelOmschrijving    !This is a File Alias, so assign aliased file manager
  SELF.FileNameValue = 'ARelatieArtikelOmschrijving'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= ARelatieArtikelOmschrijving
  PARENT.Init
  Access:ARelatieArtikelOmschrijving &= SELF
  SELF.LazyOpen = False
  SELF.DoNotAssertOnCloseMisuse = 1  ! ABCDefaults
   IF SELF.File{prop:sqldriver} THEN SELF.create = 0.         ! ABCDefaults


Hide:Access:ARelatieArtikelOmschrijving.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:ARelatieArtikelOmschrijving &= NULL               ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:ARelatieArtikelOmschrijving.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(ARelatieArtikelOmschrijving,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(ARAO:PK_RelatieArtikelOmschrijving,'ARAO:PK_RelatieArtikelOmschrijving',0)
    SELF.AddKey(ARAO:FK1_RelatieArtikelOmschrijving,'ARAO:FK1_RelatieArtikelOmschrijving',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  IF SELF.File{prop:sqldriver} THEN SELF.create = 0.          ! ABCDefaults
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:ARelatieArtikelOmschrijving.Kill PROCEDURE

  CODE
  _Hide:Access:ARelatieArtikelOmschrijving.Kill            ! Kill the file manager
  PARENT.Kill
  Relate:ARelatieArtikelOmschrijving &= NULL               ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:ARelatieArtikelOmschrijving)        ! destroy the file manager


Hide:Relate:AAViewTransporteur.Init PROCEDURE()
  CODE
  _Hide:Access:AAViewTransporteur.Init
  SELF.Init(Access:AAViewTransporteur,1)
  SELF.SetAlias(Relate:ViewTransporteur)


Hide:Access:AAViewTransporteur.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= AAVTRA:Record
  SELF.AliasedFile &= Access:ViewTransporteur              !This is a File Alias, so assign aliased file manager
  SELF.FileNameValue = 'AAViewTransporteur'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= AAViewTransporteur
  PARENT.Init
  Access:AAViewTransporteur &= SELF
  SELF.LazyOpen = False
  SELF.DoNotAssertOnCloseMisuse = 1  ! ABCDefaults
   IF SELF.File{prop:sqldriver} THEN SELF.create = 0.         ! ABCDefaults


Hide:Access:AAViewTransporteur.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:AAViewTransporteur &= NULL                        ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:AAViewTransporteur.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(AAViewTransporteur,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(AAVTRA:ViewTransporteur_PK,'AAVTRA:ViewTransporteur_PK',0)
    SELF.AddKey(AAVTRA:ViewTransporteur_FK1,'Op RelatieID',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  IF SELF.File{prop:sqldriver} THEN SELF.create = 0.          ! ABCDefaults
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:AAViewTransporteur.Kill PROCEDURE

  CODE
  _Hide:Access:AAViewTransporteur.Kill                     ! Kill the file manager
  PARENT.Kill
  Relate:AAViewTransporteur &= NULL                        ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:AAViewTransporteur)                 ! destroy the file manager

