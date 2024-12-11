  MEMBER('VoorrDct.clw')

  INCLUDE('ABFILE.INC'),ONCE

  MAP
VoorrDct_BC4:DctInit    PROCEDURE()
VoorrDct_BC4:DctKill    PROCEDURE()
VoorrDct_BC4:FilesInit  PROCEDURE()
  END

Hide:Access:AMutatie CLASS(FileManager),TYPE               ! FileManager for AMutatie
DeleteRecord           PROCEDURE(BYTE Query=1),BYTE,PROC,DERIVED
Init                   PROCEDURE(),DERIVED
Insert                 PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),DERIVED
TryInsert              PROCEDURE(),BYTE,PROC,DERIVED
TryUpdate              PROCEDURE(),BYTE,PROC,DERIVED
Update                 PROCEDURE(),BYTE,PROC,DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:AMutatie CLASS(RelationManager),TYPE           ! RelationManager for AMutatie
Init                   PROCEDURE
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:AAViewVoorraadPartij CLASS(FileManager),TYPE   ! FileManager for AAViewVoorraadPartij
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:AAViewVoorraadPartij CLASS(RelationManager),TYPE ! RelationManager for AAViewVoorraadPartij
Init                   PROCEDURE
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:AAAViewVoorraadPartij CLASS(FileManager),TYPE  ! FileManager for AAAViewVoorraadPartij
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:AAAViewVoorraadPartij CLASS(RelationManager),TYPE ! RelationManager for AAAViewVoorraadPartij
Init                   PROCEDURE
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:APartij  CLASS(FileManager),TYPE               ! FileManager for APartij
DeleteRecord           PROCEDURE(BYTE Query=1),BYTE,PROC,DERIVED
Init                   PROCEDURE(),DERIVED
Insert                 PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),DERIVED
TryInsert              PROCEDURE(),BYTE,PROC,DERIVED
TryUpdate              PROCEDURE(),BYTE,PROC,DERIVED
Update                 PROCEDURE(),BYTE,PROC,DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:APartij  CLASS(RelationManager),TYPE           ! RelationManager for APartij
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:AAViewArtikel CLASS(FileManager),TYPE          ! FileManager for AAViewArtikel
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:AAViewArtikel CLASS(RelationManager),TYPE      ! RelationManager for AAViewArtikel
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:AAVerpakking CLASS(FileManager),TYPE           ! FileManager for AAVerpakking
DeleteRecord           PROCEDURE(BYTE Query=1),BYTE,PROC,DERIVED
Init                   PROCEDURE(),DERIVED
Insert                 PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),DERIVED
TryInsert              PROCEDURE(),BYTE,PROC,DERIVED
TryUpdate              PROCEDURE(),BYTE,PROC,DERIVED
Update                 PROCEDURE(),BYTE,PROC,DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:AAVerpakking CLASS(RelationManager),TYPE       ! RelationManager for AAVerpakking
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:AAAAViewVoorraadPartij CLASS(FileManager),TYPE ! FileManager for AAAAViewVoorraadPartij
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:AAAAViewVoorraadPartij CLASS(RelationManager),TYPE ! RelationManager for AAAAViewVoorraadPartij
Init                   PROCEDURE
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:AOverboekingRitRegel CLASS(FileManager),TYPE   ! FileManager for AOverboekingRitRegel
DeleteRecord           PROCEDURE(BYTE Query=1),BYTE,PROC,DERIVED
Init                   PROCEDURE(),DERIVED
Insert                 PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),DERIVED
TryInsert              PROCEDURE(),BYTE,PROC,DERIVED
TryUpdate              PROCEDURE(),BYTE,PROC,DERIVED
Update                 PROCEDURE(),BYTE,PROC,DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:AOverboekingRitRegel CLASS(RelationManager),TYPE ! RelationManager for AOverboekingRitRegel
Init                   PROCEDURE
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:AAPlanning CLASS(FileManager),TYPE             ! FileManager for AAPlanning
DeleteRecord           PROCEDURE(BYTE Query=1),BYTE,PROC,DERIVED
Init                   PROCEDURE(),DERIVED
Insert                 PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),DERIVED
TryInsert              PROCEDURE(),BYTE,PROC,DERIVED
TryUpdate              PROCEDURE(),BYTE,PROC,DERIVED
Update                 PROCEDURE(),BYTE,PROC,DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:AAPlanning CLASS(RelationManager),TYPE         ! RelationManager for AAPlanning
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:AAPartij CLASS(FileManager),TYPE               ! FileManager for AAPartij
DeleteRecord           PROCEDURE(BYTE Query=1),BYTE,PROC,DERIVED
Init                   PROCEDURE(),DERIVED
Insert                 PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),DERIVED
TryInsert              PROCEDURE(),BYTE,PROC,DERIVED
TryUpdate              PROCEDURE(),BYTE,PROC,DERIVED
Update                 PROCEDURE(),BYTE,PROC,DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:AAPartij CLASS(RelationManager),TYPE           ! RelationManager for AAPartij
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:AAAACel  CLASS(FileManager),TYPE               ! FileManager for AAAACel
DeleteRecord           PROCEDURE(BYTE Query=1),BYTE,PROC,DERIVED
Init                   PROCEDURE(),DERIVED
Insert                 PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),DERIVED
TryInsert              PROCEDURE(),BYTE,PROC,DERIVED
TryUpdate              PROCEDURE(),BYTE,PROC,DERIVED
Update                 PROCEDURE(),BYTE,PROC,DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:AAAACel  CLASS(RelationManager),TYPE           ! RelationManager for AAAACel
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:AOverboekingRit CLASS(FileManager),TYPE        ! FileManager for AOverboekingRit
DeleteRecord           PROCEDURE(BYTE Query=1),BYTE,PROC,DERIVED
Init                   PROCEDURE(),DERIVED
Insert                 PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),DERIVED
TryInsert              PROCEDURE(),BYTE,PROC,DERIVED
TryUpdate              PROCEDURE(),BYTE,PROC,DERIVED
Update                 PROCEDURE(),BYTE,PROC,DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:AOverboekingRit CLASS(RelationManager),TYPE    ! RelationManager for AOverboekingRit
Init                   PROCEDURE
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:APlanningInkoop CLASS(FileManager),TYPE        ! FileManager for APlanningInkoop
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:APlanningInkoop CLASS(RelationManager),TYPE    ! RelationManager for APlanningInkoop
Init                   PROCEDURE
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:APlanningOverboeking CLASS(FileManager),TYPE   ! FileManager for APlanningOverboeking
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:APlanningOverboeking CLASS(RelationManager),TYPE ! RelationManager for APlanningOverboeking
Init                   PROCEDURE
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:APlanningVerkoop CLASS(FileManager),TYPE       ! FileManager for APlanningVerkoop
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:APlanningVerkoop CLASS(RelationManager),TYPE   ! RelationManager for APlanningVerkoop
Init                   PROCEDURE
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:APalletSoort CLASS(FileManager),TYPE           ! FileManager for APalletSoort
DeleteRecord           PROCEDURE(BYTE Query=1),BYTE,PROC,DERIVED
Init                   PROCEDURE(),DERIVED
Insert                 PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),DERIVED
TryInsert              PROCEDURE(),BYTE,PROC,DERIVED
TryUpdate              PROCEDURE(),BYTE,PROC,DERIVED
Update                 PROCEDURE(),BYTE,PROC,DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:APalletSoort CLASS(RelationManager),TYPE       ! RelationManager for APalletSoort
Init                   PROCEDURE
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:ACelLocatie CLASS(FileManager),TYPE            ! FileManager for ACelLocatie
DeleteRecord           PROCEDURE(BYTE Query=1),BYTE,PROC,DERIVED
Init                   PROCEDURE(),DERIVED
Insert                 PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),DERIVED
TryInsert              PROCEDURE(),BYTE,PROC,DERIVED
TryUpdate              PROCEDURE(),BYTE,PROC,DERIVED
Update                 PROCEDURE(),BYTE,PROC,DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:ACelLocatie CLASS(RelationManager),TYPE        ! RelationManager for ACelLocatie
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:AACelLocatie CLASS(FileManager),TYPE           ! FileManager for AACelLocatie
DeleteRecord           PROCEDURE(BYTE Query=1),BYTE,PROC,DERIVED
Init                   PROCEDURE(),DERIVED
Insert                 PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),DERIVED
TryInsert              PROCEDURE(),BYTE,PROC,DERIVED
TryUpdate              PROCEDURE(),BYTE,PROC,DERIVED
Update                 PROCEDURE(),BYTE,PROC,DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:AACelLocatie CLASS(RelationManager),TYPE       ! RelationManager for AACelLocatie
Init                   PROCEDURE
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:AAACelLocatie CLASS(FileManager),TYPE          ! FileManager for AAACelLocatie
DeleteRecord           PROCEDURE(BYTE Query=1),BYTE,PROC,DERIVED
Init                   PROCEDURE(),DERIVED
Insert                 PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),DERIVED
TryInsert              PROCEDURE(),BYTE,PROC,DERIVED
TryUpdate              PROCEDURE(),BYTE,PROC,DERIVED
Update                 PROCEDURE(),BYTE,PROC,DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:AAACelLocatie CLASS(RelationManager),TYPE      ! RelationManager for AAACelLocatie
Init                   PROCEDURE
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:AAAACelLocatie CLASS(FileManager),TYPE         ! FileManager for AAAACelLocatie
DeleteRecord           PROCEDURE(BYTE Query=1),BYTE,PROC,DERIVED
Init                   PROCEDURE(),DERIVED
Insert                 PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),DERIVED
TryInsert              PROCEDURE(),BYTE,PROC,DERIVED
TryUpdate              PROCEDURE(),BYTE,PROC,DERIVED
Update                 PROCEDURE(),BYTE,PROC,DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:AAAACelLocatie CLASS(RelationManager),TYPE     ! RelationManager for AAAACelLocatie
Init                   PROCEDURE
Kill                   PROCEDURE(),DERIVED
                     END


_Hide:Access:AMutatie &Hide:Access:AMutatie,AUTO,THREAD
_Hide:Relate:AMutatie &Hide:Relate:AMutatie,AUTO,THREAD
_Hide:Access:AAViewVoorraadPartij &Hide:Access:AAViewVoorraadPartij,AUTO,THREAD
_Hide:Relate:AAViewVoorraadPartij &Hide:Relate:AAViewVoorraadPartij,AUTO,THREAD
_Hide:Access:AAAViewVoorraadPartij &Hide:Access:AAAViewVoorraadPartij,AUTO,THREAD
_Hide:Relate:AAAViewVoorraadPartij &Hide:Relate:AAAViewVoorraadPartij,AUTO,THREAD
_Hide:Access:APartij &Hide:Access:APartij,AUTO,THREAD
_Hide:Relate:APartij &Hide:Relate:APartij,AUTO,THREAD
_Hide:Access:AAViewArtikel &Hide:Access:AAViewArtikel,AUTO,THREAD
_Hide:Relate:AAViewArtikel &Hide:Relate:AAViewArtikel,AUTO,THREAD
_Hide:Access:AAVerpakking &Hide:Access:AAVerpakking,AUTO,THREAD
_Hide:Relate:AAVerpakking &Hide:Relate:AAVerpakking,AUTO,THREAD
_Hide:Access:AAAAViewVoorraadPartij &Hide:Access:AAAAViewVoorraadPartij,AUTO,THREAD
_Hide:Relate:AAAAViewVoorraadPartij &Hide:Relate:AAAAViewVoorraadPartij,AUTO,THREAD
_Hide:Access:AOverboekingRitRegel &Hide:Access:AOverboekingRitRegel,AUTO,THREAD
_Hide:Relate:AOverboekingRitRegel &Hide:Relate:AOverboekingRitRegel,AUTO,THREAD
_Hide:Access:AAPlanning &Hide:Access:AAPlanning,AUTO,THREAD
_Hide:Relate:AAPlanning &Hide:Relate:AAPlanning,AUTO,THREAD
_Hide:Access:AAPartij &Hide:Access:AAPartij,AUTO,THREAD
_Hide:Relate:AAPartij &Hide:Relate:AAPartij,AUTO,THREAD
_Hide:Access:AAAACel &Hide:Access:AAAACel,AUTO,THREAD
_Hide:Relate:AAAACel &Hide:Relate:AAAACel,AUTO,THREAD
_Hide:Access:AOverboekingRit &Hide:Access:AOverboekingRit,AUTO,THREAD
_Hide:Relate:AOverboekingRit &Hide:Relate:AOverboekingRit,AUTO,THREAD
_Hide:Access:APlanningInkoop &Hide:Access:APlanningInkoop,AUTO,THREAD
_Hide:Relate:APlanningInkoop &Hide:Relate:APlanningInkoop,AUTO,THREAD
_Hide:Access:APlanningOverboeking &Hide:Access:APlanningOverboeking,AUTO,THREAD
_Hide:Relate:APlanningOverboeking &Hide:Relate:APlanningOverboeking,AUTO,THREAD
_Hide:Access:APlanningVerkoop &Hide:Access:APlanningVerkoop,AUTO,THREAD
_Hide:Relate:APlanningVerkoop &Hide:Relate:APlanningVerkoop,AUTO,THREAD
_Hide:Access:APalletSoort &Hide:Access:APalletSoort,AUTO,THREAD
_Hide:Relate:APalletSoort &Hide:Relate:APalletSoort,AUTO,THREAD
_Hide:Access:ACelLocatie &Hide:Access:ACelLocatie,AUTO,THREAD
_Hide:Relate:ACelLocatie &Hide:Relate:ACelLocatie,AUTO,THREAD
_Hide:Access:AACelLocatie &Hide:Access:AACelLocatie,AUTO,THREAD
_Hide:Relate:AACelLocatie &Hide:Relate:AACelLocatie,AUTO,THREAD
_Hide:Access:AAACelLocatie &Hide:Access:AAACelLocatie,AUTO,THREAD
_Hide:Relate:AAACelLocatie &Hide:Relate:AAACelLocatie,AUTO,THREAD
_Hide:Access:AAAACelLocatie &Hide:Access:AAAACelLocatie,AUTO,THREAD
_Hide:Relate:AAAACelLocatie &Hide:Relate:AAAACelLocatie,AUTO,THREAD


VoorrDct_BC4:DctInit PROCEDURE()
  CODE
  _Hide:Access:AMutatie &= NEW(Hide:Access:AMutatie)
  _Hide:Relate:AMutatie &= NEW(Hide:Relate:AMutatie)
  _Hide:Access:AAViewVoorraadPartij &= NEW(Hide:Access:AAViewVoorraadPartij)
  _Hide:Relate:AAViewVoorraadPartij &= NEW(Hide:Relate:AAViewVoorraadPartij)
  _Hide:Access:AAAViewVoorraadPartij &= NEW(Hide:Access:AAAViewVoorraadPartij)
  _Hide:Relate:AAAViewVoorraadPartij &= NEW(Hide:Relate:AAAViewVoorraadPartij)
  _Hide:Access:APartij &= NEW(Hide:Access:APartij)
  _Hide:Relate:APartij &= NEW(Hide:Relate:APartij)
  _Hide:Access:AAViewArtikel &= NEW(Hide:Access:AAViewArtikel)
  _Hide:Relate:AAViewArtikel &= NEW(Hide:Relate:AAViewArtikel)
  _Hide:Access:AAVerpakking &= NEW(Hide:Access:AAVerpakking)
  _Hide:Relate:AAVerpakking &= NEW(Hide:Relate:AAVerpakking)
  _Hide:Access:AAAAViewVoorraadPartij &= NEW(Hide:Access:AAAAViewVoorraadPartij)
  _Hide:Relate:AAAAViewVoorraadPartij &= NEW(Hide:Relate:AAAAViewVoorraadPartij)
  _Hide:Access:AOverboekingRitRegel &= NEW(Hide:Access:AOverboekingRitRegel)
  _Hide:Relate:AOverboekingRitRegel &= NEW(Hide:Relate:AOverboekingRitRegel)
  _Hide:Access:AAPlanning &= NEW(Hide:Access:AAPlanning)
  _Hide:Relate:AAPlanning &= NEW(Hide:Relate:AAPlanning)
  _Hide:Access:AAPartij &= NEW(Hide:Access:AAPartij)
  _Hide:Relate:AAPartij &= NEW(Hide:Relate:AAPartij)
  _Hide:Access:AAAACel &= NEW(Hide:Access:AAAACel)
  _Hide:Relate:AAAACel &= NEW(Hide:Relate:AAAACel)
  _Hide:Access:AOverboekingRit &= NEW(Hide:Access:AOverboekingRit)
  _Hide:Relate:AOverboekingRit &= NEW(Hide:Relate:AOverboekingRit)
  _Hide:Access:APlanningInkoop &= NEW(Hide:Access:APlanningInkoop)
  _Hide:Relate:APlanningInkoop &= NEW(Hide:Relate:APlanningInkoop)
  _Hide:Access:APlanningOverboeking &= NEW(Hide:Access:APlanningOverboeking)
  _Hide:Relate:APlanningOverboeking &= NEW(Hide:Relate:APlanningOverboeking)
  _Hide:Access:APlanningVerkoop &= NEW(Hide:Access:APlanningVerkoop)
  _Hide:Relate:APlanningVerkoop &= NEW(Hide:Relate:APlanningVerkoop)
  _Hide:Access:APalletSoort &= NEW(Hide:Access:APalletSoort)
  _Hide:Relate:APalletSoort &= NEW(Hide:Relate:APalletSoort)
  _Hide:Access:ACelLocatie &= NEW(Hide:Access:ACelLocatie)
  _Hide:Relate:ACelLocatie &= NEW(Hide:Relate:ACelLocatie)
  _Hide:Access:AACelLocatie &= NEW(Hide:Access:AACelLocatie)
  _Hide:Relate:AACelLocatie &= NEW(Hide:Relate:AACelLocatie)
  _Hide:Access:AAACelLocatie &= NEW(Hide:Access:AAACelLocatie)
  _Hide:Relate:AAACelLocatie &= NEW(Hide:Relate:AAACelLocatie)
  _Hide:Access:AAAACelLocatie &= NEW(Hide:Access:AAAACelLocatie)
  _Hide:Relate:AAAACelLocatie &= NEW(Hide:Relate:AAAACelLocatie)
  Relate:AMutatie &= _Hide:Relate:AMutatie
  Relate:AAViewVoorraadPartij &= _Hide:Relate:AAViewVoorraadPartij
  Relate:AAAViewVoorraadPartij &= _Hide:Relate:AAAViewVoorraadPartij
  Relate:APartij &= _Hide:Relate:APartij
  Relate:AAViewArtikel &= _Hide:Relate:AAViewArtikel
  Relate:AAVerpakking &= _Hide:Relate:AAVerpakking
  Relate:AAAAViewVoorraadPartij &= _Hide:Relate:AAAAViewVoorraadPartij
  Relate:AOverboekingRitRegel &= _Hide:Relate:AOverboekingRitRegel
  Relate:AAPlanning &= _Hide:Relate:AAPlanning
  Relate:AAPartij &= _Hide:Relate:AAPartij
  Relate:AAAACel &= _Hide:Relate:AAAACel
  Relate:AOverboekingRit &= _Hide:Relate:AOverboekingRit
  Relate:APlanningInkoop &= _Hide:Relate:APlanningInkoop
  Relate:APlanningOverboeking &= _Hide:Relate:APlanningOverboeking
  Relate:APlanningVerkoop &= _Hide:Relate:APlanningVerkoop
  Relate:APalletSoort &= _Hide:Relate:APalletSoort
  Relate:ACelLocatie &= _Hide:Relate:ACelLocatie
  Relate:AACelLocatie &= _Hide:Relate:AACelLocatie
  Relate:AAACelLocatie &= _Hide:Relate:AAACelLocatie
  Relate:AAAACelLocatie &= _Hide:Relate:AAAACelLocatie


VoorrDct_BC4:FilesInit PROCEDURE()
  CODE
  _Hide:Relate:AMutatie.Init
  _Hide:Relate:AAViewVoorraadPartij.Init
  _Hide:Relate:AAAViewVoorraadPartij.Init
  _Hide:Relate:APartij.Init
  _Hide:Relate:AAViewArtikel.Init
  _Hide:Relate:AAVerpakking.Init
  _Hide:Relate:AAAAViewVoorraadPartij.Init
  _Hide:Relate:AOverboekingRitRegel.Init
  _Hide:Relate:AAPlanning.Init
  _Hide:Relate:AAPartij.Init
  _Hide:Relate:AAAACel.Init
  _Hide:Relate:AOverboekingRit.Init
  _Hide:Relate:APlanningInkoop.Init
  _Hide:Relate:APlanningOverboeking.Init
  _Hide:Relate:APlanningVerkoop.Init
  _Hide:Relate:APalletSoort.Init
  _Hide:Relate:ACelLocatie.Init
  _Hide:Relate:AACelLocatie.Init
  _Hide:Relate:AAACelLocatie.Init
  _Hide:Relate:AAAACelLocatie.Init


VoorrDct_BC4:DctKill PROCEDURE()
  CODE
  _Hide:Relate:AMutatie.Kill
  DISPOSE(_Hide:Relate:AMutatie)
  _Hide:Relate:AAViewVoorraadPartij.Kill
  DISPOSE(_Hide:Relate:AAViewVoorraadPartij)
  _Hide:Relate:AAAViewVoorraadPartij.Kill
  DISPOSE(_Hide:Relate:AAAViewVoorraadPartij)
  _Hide:Relate:APartij.Kill
  DISPOSE(_Hide:Relate:APartij)
  _Hide:Relate:AAViewArtikel.Kill
  DISPOSE(_Hide:Relate:AAViewArtikel)
  _Hide:Relate:AAVerpakking.Kill
  DISPOSE(_Hide:Relate:AAVerpakking)
  _Hide:Relate:AAAAViewVoorraadPartij.Kill
  DISPOSE(_Hide:Relate:AAAAViewVoorraadPartij)
  _Hide:Relate:AOverboekingRitRegel.Kill
  DISPOSE(_Hide:Relate:AOverboekingRitRegel)
  _Hide:Relate:AAPlanning.Kill
  DISPOSE(_Hide:Relate:AAPlanning)
  _Hide:Relate:AAPartij.Kill
  DISPOSE(_Hide:Relate:AAPartij)
  _Hide:Relate:AAAACel.Kill
  DISPOSE(_Hide:Relate:AAAACel)
  _Hide:Relate:AOverboekingRit.Kill
  DISPOSE(_Hide:Relate:AOverboekingRit)
  _Hide:Relate:APlanningInkoop.Kill
  DISPOSE(_Hide:Relate:APlanningInkoop)
  _Hide:Relate:APlanningOverboeking.Kill
  DISPOSE(_Hide:Relate:APlanningOverboeking)
  _Hide:Relate:APlanningVerkoop.Kill
  DISPOSE(_Hide:Relate:APlanningVerkoop)
  _Hide:Relate:APalletSoort.Kill
  DISPOSE(_Hide:Relate:APalletSoort)
  _Hide:Relate:ACelLocatie.Kill
  DISPOSE(_Hide:Relate:ACelLocatie)
  _Hide:Relate:AACelLocatie.Kill
  DISPOSE(_Hide:Relate:AACelLocatie)
  _Hide:Relate:AAACelLocatie.Kill
  DISPOSE(_Hide:Relate:AAACelLocatie)
  _Hide:Relate:AAAACelLocatie.Kill
  DISPOSE(_Hide:Relate:AAAACelLocatie)


Hide:Relate:AMutatie.Init PROCEDURE()
  CODE
  _Hide:Access:AMutatie.Init
  SELF.Init(Access:AMutatie,1)
  SELF.SetAlias(Relate:Mutatie)


Hide:Access:AMutatie.DeleteRecord PROCEDURE(BYTE Query=1)

ReturnValue          BYTE,AUTO

  CODE
  GebruikerLogClass.Log('Delete', 'Mutatie', GebruikerLogClass.BepaalRecordContent(AMut:Record))
  ReturnValue = PARENT.DeleteRecord(Query)
  RETURN ReturnValue


Hide:Access:AMutatie.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= AMut:Record
  SELF.AliasedFile &= Access:Mutatie                       !This is a File Alias, so assign aliased file manager
  SELF.FileNameValue = 'AMutatie'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= AMutatie
  PARENT.Init
  Access:AMutatie &= SELF
  SELF.LazyOpen = False
  SELF.DoNotAssertOnCloseMisuse = 1  ! ABCDefaults
   IF SELF.File{prop:sqldriver} THEN SELF.create = 0.         ! ABCDefaults


Hide:Access:AMutatie.Insert PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GebruikerLogClass.Log('Insert', 'Mutatie', GebruikerLogClass.BepaalRecordContent(AMut:Record))
  ReturnValue = PARENT.Insert()
  RETURN ReturnValue


Hide:Access:AMutatie.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:AMutatie &= NULL                                  ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:AMutatie.TryInsert PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GebruikerLogClass.Log('Insert', 'Mutatie', GebruikerLogClass.BepaalRecordContent(AMut:Record))
  ReturnValue = PARENT.TryInsert()
  RETURN ReturnValue


Hide:Access:AMutatie.TryUpdate PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GebruikerLogClass.Log('Update', 'Mutatie', GebruikerLogClass.BepaalRecordContent(AMut:Record))
  ReturnValue = PARENT.TryUpdate()
  RETURN ReturnValue


Hide:Access:AMutatie.Update PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GebruikerLogClass.Log('Update', 'Mutatie', GebruikerLogClass.BepaalRecordContent(AMut:Record))
  ReturnValue = PARENT.Update()
  RETURN ReturnValue


Hide:Access:AMutatie.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(AMutatie,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(AMut:Mutatie_PK,'AMut:Mutatie_PK',0)
    SELF.AddKey(AMut:Mutatie_FK01,'AMut:Mutatie_FK01',0)
    SELF.AddKey(AMut:Mutatie_FK02,'AMut:Mutatie_FK02',0)
    SELF.AddKey(AMut:Mutatie_FK03,'Op ArtikelID/DatumTijd',0)
    SELF.AddKey(AMut:Mutatie_FK04,'AMut:Mutatie_FK04',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  IF SELF.File{prop:sqldriver} THEN SELF.create = 0.          ! ABCDefaults
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:AMutatie.Kill PROCEDURE

  CODE
  _Hide:Access:AMutatie.Kill                               ! Kill the file manager
  PARENT.Kill
  Relate:AMutatie &= NULL                                  ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:AMutatie)                           ! destroy the file manager


Hide:Relate:AAViewVoorraadPartij.Init PROCEDURE()
  CODE
  _Hide:Access:AAViewVoorraadPartij.Init
  SELF.Init(Access:AAViewVoorraadPartij,1)
  SELF.SetAlias(Relate:ViewVoorraadPartij)


Hide:Access:AAViewVoorraadPartij.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= AAVVPar:Record
  SELF.AliasedFile &= Access:ViewVoorraadPartij            !This is a File Alias, so assign aliased file manager
  SELF.FileNameValue = 'AAViewVoorraadPartij'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= AAViewVoorraadPartij
  PARENT.Init
  Access:AAViewVoorraadPartij &= SELF
  SELF.LazyOpen = False
  SELF.DoNotAssertOnCloseMisuse = 1  ! ABCDefaults
   IF SELF.File{prop:sqldriver} THEN SELF.create = 0.         ! ABCDefaults


Hide:Access:AAViewVoorraadPartij.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:AAViewVoorraadPartij &= NULL                      ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:AAViewVoorraadPartij.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(AAViewVoorraadPartij,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(AAVVPar:ExternPartijnr_PartijID_CelID_K,'AAVVPar:ExternPartijnr_PartijID_CelID_K',0)
    SELF.AddKey(AAVVPar:PartijID_CelID_K,'AAVVPar:PartijID_CelID_K',0)
    SELF.AddKey(AAVVPar:PartijCelID_K,'AAVVPar:PartijCelID_K',0)
    SELF.AddKey(AAVVPar:ArtikelID_PartijID_CelID_K,'AAVVPar:ArtikelID_PartijID_CelID_K',0)
    SELF.AddKey(AAVVPar:ArtikelOms_PartijID_CelID_K,'AAVVPar:ArtikelOms_PartijID_CelID_K',0)
    SELF.AddKey(AAVVPar:ArtikelID_CelID_PartijID_K,'AAVVPar:ArtikelID_CelID_PartijID_K',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  IF SELF.File{prop:sqldriver} THEN SELF.create = 0.          ! ABCDefaults
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:AAViewVoorraadPartij.Kill PROCEDURE

  CODE
  _Hide:Access:AAViewVoorraadPartij.Kill                   ! Kill the file manager
  PARENT.Kill
  Relate:AAViewVoorraadPartij &= NULL                      ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:AAViewVoorraadPartij)               ! destroy the file manager


Hide:Relate:AAAViewVoorraadPartij.Init PROCEDURE()
  CODE
  _Hide:Access:AAAViewVoorraadPartij.Init
  SELF.Init(Access:AAAViewVoorraadPartij,1)
  SELF.SetAlias(Relate:ViewVoorraadPartij)


Hide:Access:AAAViewVoorraadPartij.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= AAAVVPar:Record
  SELF.AliasedFile &= Access:ViewVoorraadPartij            !This is a File Alias, so assign aliased file manager
  SELF.FileNameValue = 'AAAViewVoorraadPartij'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= AAAViewVoorraadPartij
  PARENT.Init
  Access:AAAViewVoorraadPartij &= SELF
  SELF.LazyOpen = False
  SELF.DoNotAssertOnCloseMisuse = 1  ! ABCDefaults
   IF SELF.File{prop:sqldriver} THEN SELF.create = 0.         ! ABCDefaults


Hide:Access:AAAViewVoorraadPartij.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:AAAViewVoorraadPartij &= NULL                     ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:AAAViewVoorraadPartij.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(AAAViewVoorraadPartij,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(AAAVVPar:ExternPartijnr_PartijID_CelID_K,'AAAVVPar:ExternPartijnr_PartijID_CelID_K',0)
    SELF.AddKey(AAAVVPar:PartijID_CelID_K,'AAAVVPar:PartijID_CelID_K',0)
    SELF.AddKey(AAAVVPar:PartijCelID_K,'AAAVVPar:PartijCelID_K',0)
    SELF.AddKey(AAAVVPar:ArtikelID_PartijID_CelID_K,'AAAVVPar:ArtikelID_PartijID_CelID_K',0)
    SELF.AddKey(AAAVVPar:ArtikelOms_PartijID_CelID_K,'AAAVVPar:ArtikelOms_PartijID_CelID_K',0)
    SELF.AddKey(AAAVVPar:ArtikelID_CelID_PartijID_K,'AAAVVPar:ArtikelID_CelID_PartijID_K',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  IF SELF.File{prop:sqldriver} THEN SELF.create = 0.          ! ABCDefaults
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:AAAViewVoorraadPartij.Kill PROCEDURE

  CODE
  _Hide:Access:AAAViewVoorraadPartij.Kill                  ! Kill the file manager
  PARENT.Kill
  Relate:AAAViewVoorraadPartij &= NULL                     ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:AAAViewVoorraadPartij)              ! destroy the file manager


Hide:Relate:APartij.Init PROCEDURE()
  CODE
  _Hide:Access:APartij.Init
  SELF.Init(Access:APartij,1)
  SELF.SetAlias(Relate:Partij)


Hide:Access:APartij.DeleteRecord PROCEDURE(BYTE Query=1)

ReturnValue          BYTE,AUTO

  CODE
  GebruikerLogClass.Log('Delete', 'Partij', GebruikerLogClass.BepaalRecordContent(APar:Record))
  ReturnValue = PARENT.DeleteRecord(Query)
  RETURN ReturnValue


Hide:Access:APartij.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= APar:Record
  SELF.AliasedFile &= Access:Partij                        !This is a File Alias, so assign aliased file manager
  SELF.FileNameValue = 'APartij'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= APartij
  PARENT.Init
  Access:APartij &= SELF
  SELF.LazyOpen = False
  SELF.DoNotAssertOnCloseMisuse = 1  ! ABCDefaults
   IF SELF.File{prop:sqldriver} THEN SELF.create = 0.         ! ABCDefaults


Hide:Access:APartij.Insert PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GebruikerLogClass.Log('Insert', 'Partij', GebruikerLogClass.BepaalRecordContent(APar:Record))
  ReturnValue = PARENT.Insert()
  RETURN ReturnValue


Hide:Access:APartij.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:APartij &= NULL                                   ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:APartij.TryInsert PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GebruikerLogClass.Log('Insert', 'Partij', GebruikerLogClass.BepaalRecordContent(APar:Record))
  ReturnValue = PARENT.TryInsert()
  RETURN ReturnValue


Hide:Access:APartij.TryUpdate PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GebruikerLogClass.Log('Update', 'Partij', GebruikerLogClass.BepaalRecordContent(APar:Record))
  ReturnValue = PARENT.TryUpdate()
  RETURN ReturnValue


Hide:Access:APartij.Update PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GebruikerLogClass.Log('Update', 'Partij', GebruikerLogClass.BepaalRecordContent(APar:Record))
  ReturnValue = PARENT.Update()
  RETURN ReturnValue


Hide:Access:APartij.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(APartij,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(APar:Partij_FK02,'APar:Partij_FK02',0)
    SELF.AddKey(APar:Partij_FK03,'APar:Partij_FK03',0)
    SELF.AddKey(APar:Partij_FK01,'APar:Partij_FK01',0)
    SELF.AddKey(APar:Partij_PK,'APar:Partij_PK',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  IF SELF.File{prop:sqldriver} THEN SELF.create = 0.          ! ABCDefaults
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:APartij.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:APlanning)

  SELF.AddRelation(Relate:ARelatie,RI:None,RI:None,AREL:Relatie_PK)
  SELF.AddRelationLink(APar:Leverancier,AREL:RelatieID)

  SELF.AddRelation(Relate:AAPlanning)


Hide:Relate:APartij.Kill PROCEDURE

  CODE
  _Hide:Access:APartij.Kill                                ! Kill the file manager
  PARENT.Kill
  Relate:APartij &= NULL                                   ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:APartij)                            ! destroy the file manager


Hide:Relate:AAViewArtikel.Init PROCEDURE()
  CODE
  _Hide:Access:AAViewArtikel.Init
  SELF.Init(Access:AAViewArtikel,1)
  SELF.SetAlias(Relate:ViewArtikel)


Hide:Access:AAViewArtikel.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= AAArt:Record
  SELF.AliasedFile &= Access:ViewArtikel                   !This is a File Alias, so assign aliased file manager
  SELF.FileNameValue = 'AAViewArtikel'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= AAViewArtikel
  PARENT.Init
  Access:AAViewArtikel &= SELF
  SELF.LazyOpen = False
  SELF.DoNotAssertOnCloseMisuse = 1  ! ABCDefaults
   IF SELF.File{prop:sqldriver} THEN SELF.create = 0.         ! ABCDefaults


Hide:Access:AAViewArtikel.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:AAViewArtikel &= NULL                             ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:AAViewArtikel.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(AAViewArtikel,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(AAArt:Artikel_PK,'AAArt:Artikel_PK',0)
    SELF.AddKey(AAArt:Artikel_FK01,'AAArt:Artikel_FK01',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  IF SELF.File{prop:sqldriver} THEN SELF.create = 0.          ! ABCDefaults
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:AAViewArtikel.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:Planning)


Hide:Relate:AAViewArtikel.Kill PROCEDURE

  CODE
  _Hide:Access:AAViewArtikel.Kill                          ! Kill the file manager
  PARENT.Kill
  Relate:AAViewArtikel &= NULL                             ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:AAViewArtikel)                      ! destroy the file manager


Hide:Relate:AAVerpakking.Init PROCEDURE()
  CODE
  _Hide:Access:AAVerpakking.Init
  SELF.Init(Access:AAVerpakking,1)
  SELF.SetAlias(Relate:Verpakking)


Hide:Access:AAVerpakking.DeleteRecord PROCEDURE(BYTE Query=1)

ReturnValue          BYTE,AUTO

  CODE
  GebruikerLogClass.Log('Delete', 'Verpakking', GebruikerLogClass.BepaalRecordContent(AAVer:Record))
  ReturnValue = PARENT.DeleteRecord(Query)
  RETURN ReturnValue


Hide:Access:AAVerpakking.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= AAVer:Record
  SELF.AliasedFile &= Access:Verpakking                    !This is a File Alias, so assign aliased file manager
  SELF.FileNameValue = 'AAVerpakking'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= AAVerpakking
  PARENT.Init
  Access:AAVerpakking &= SELF
  SELF.LazyOpen = False
  SELF.DoNotAssertOnCloseMisuse = 1  ! ABCDefaults
   IF SELF.File{prop:sqldriver} THEN SELF.create = 0.         ! ABCDefaults


Hide:Access:AAVerpakking.Insert PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GebruikerLogClass.Log('Insert', 'Verpakking', GebruikerLogClass.BepaalRecordContent(AAVer:Record))
  ReturnValue = PARENT.Insert()
  RETURN ReturnValue


Hide:Access:AAVerpakking.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:AAVerpakking &= NULL                              ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:AAVerpakking.TryInsert PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GebruikerLogClass.Log('Insert', 'Verpakking', GebruikerLogClass.BepaalRecordContent(AAVer:Record))
  ReturnValue = PARENT.TryInsert()
  RETURN ReturnValue


Hide:Access:AAVerpakking.TryUpdate PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GebruikerLogClass.Log('Update', 'Verpakking', GebruikerLogClass.BepaalRecordContent(AAVer:Record))
  ReturnValue = PARENT.TryUpdate()
  RETURN ReturnValue


Hide:Access:AAVerpakking.Update PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GebruikerLogClass.Log('Update', 'Verpakking', GebruikerLogClass.BepaalRecordContent(AAVer:Record))
  ReturnValue = PARENT.Update()
  RETURN ReturnValue


Hide:Access:AAVerpakking.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(AAVerpakking,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(AAVer:Verpakking_PK,'AAVer:Verpakking_PK',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  IF SELF.File{prop:sqldriver} THEN SELF.create = 0.          ! ABCDefaults
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:AAVerpakking.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:AAPlanning)


Hide:Relate:AAVerpakking.Kill PROCEDURE

  CODE
  _Hide:Access:AAVerpakking.Kill                           ! Kill the file manager
  PARENT.Kill
  Relate:AAVerpakking &= NULL                              ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:AAVerpakking)                       ! destroy the file manager


Hide:Relate:AAAAViewVoorraadPartij.Init PROCEDURE()
  CODE
  _Hide:Access:AAAAViewVoorraadPartij.Init
  SELF.Init(Access:AAAAViewVoorraadPartij,1)
  SELF.SetAlias(Relate:ViewVoorraadPartij)


Hide:Access:AAAAViewVoorraadPartij.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= AAAAVVPar:Record
  SELF.AliasedFile &= Access:ViewVoorraadPartij            !This is a File Alias, so assign aliased file manager
  SELF.FileNameValue = 'AAAAViewVoorraadPartij'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= AAAAViewVoorraadPartij
  PARENT.Init
  Access:AAAAViewVoorraadPartij &= SELF
  SELF.LazyOpen = False
  SELF.DoNotAssertOnCloseMisuse = 1  ! ABCDefaults
   IF SELF.File{prop:sqldriver} THEN SELF.create = 0.         ! ABCDefaults


Hide:Access:AAAAViewVoorraadPartij.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:AAAAViewVoorraadPartij &= NULL                    ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:AAAAViewVoorraadPartij.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(AAAAViewVoorraadPartij,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(AAAAVVPar:ExternPartijnr_PartijID_CelID_K,'AAAAVVPar:ExternPartijnr_PartijID_CelID_K',0)
    SELF.AddKey(AAAAVVPar:PartijID_CelID_K,'AAAAVVPar:PartijID_CelID_K',0)
    SELF.AddKey(AAAAVVPar:PartijCelID_K,'AAAAVVPar:PartijCelID_K',0)
    SELF.AddKey(AAAAVVPar:ArtikelID_PartijID_CelID_K,'AAAAVVPar:ArtikelID_PartijID_CelID_K',0)
    SELF.AddKey(AAAAVVPar:ArtikelOms_PartijID_CelID_K,'AAAAVVPar:ArtikelOms_PartijID_CelID_K',0)
    SELF.AddKey(AAAAVVPar:ArtikelID_CelID_PartijID_K,'AAAAVVPar:ArtikelID_CelID_PartijID_K',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  IF SELF.File{prop:sqldriver} THEN SELF.create = 0.          ! ABCDefaults
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:AAAAViewVoorraadPartij.Kill PROCEDURE

  CODE
  _Hide:Access:AAAAViewVoorraadPartij.Kill                 ! Kill the file manager
  PARENT.Kill
  Relate:AAAAViewVoorraadPartij &= NULL                    ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:AAAAViewVoorraadPartij)             ! destroy the file manager


Hide:Relate:AOverboekingRitRegel.Init PROCEDURE()
  CODE
  _Hide:Access:AOverboekingRitRegel.Init
  SELF.Init(Access:AOverboekingRitRegel,1)
  SELF.SetAlias(Relate:OverboekingRitRegel)


Hide:Access:AOverboekingRitRegel.DeleteRecord PROCEDURE(BYTE Query=1)

ReturnValue          BYTE,AUTO

  CODE
  GebruikerLogClass.Log('Delete', 'OverboekingRitRegel', GebruikerLogClass.BepaalRecordContent(AORR:Record))
  ReturnValue = PARENT.DeleteRecord(Query)
  RETURN ReturnValue


Hide:Access:AOverboekingRitRegel.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= AORR:Record
  SELF.AliasedFile &= Access:OverboekingRitRegel           !This is a File Alias, so assign aliased file manager
  SELF.FileNameValue = 'AOverboekingRitRegel'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= AOverboekingRitRegel
  PARENT.Init
  Access:AOverboekingRitRegel &= SELF
  SELF.LazyOpen = False
  SELF.DoNotAssertOnCloseMisuse = 1  ! ABCDefaults
   IF SELF.File{prop:sqldriver} THEN SELF.create = 0.         ! ABCDefaults


Hide:Access:AOverboekingRitRegel.Insert PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GebruikerLogClass.Log('Insert', 'OverboekingRitRegel', GebruikerLogClass.BepaalRecordContent(AORR:Record))
  ReturnValue = PARENT.Insert()
  RETURN ReturnValue


Hide:Access:AOverboekingRitRegel.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:AOverboekingRitRegel &= NULL                      ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:AOverboekingRitRegel.TryInsert PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GebruikerLogClass.Log('Insert', 'OverboekingRitRegel', GebruikerLogClass.BepaalRecordContent(AORR:Record))
  ReturnValue = PARENT.TryInsert()
  RETURN ReturnValue


Hide:Access:AOverboekingRitRegel.TryUpdate PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GebruikerLogClass.Log('Update', 'OverboekingRitRegel', GebruikerLogClass.BepaalRecordContent(AORR:Record))
  ReturnValue = PARENT.TryUpdate()
  RETURN ReturnValue


Hide:Access:AOverboekingRitRegel.Update PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GebruikerLogClass.Log('Update', 'OverboekingRitRegel', GebruikerLogClass.BepaalRecordContent(AORR:Record))
  ReturnValue = PARENT.Update()
  RETURN ReturnValue


Hide:Access:AOverboekingRitRegel.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(AOverboekingRitRegel,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(AORR:PK_OverboekingRitRegel,'AORR:PK_OverboekingRitRegel',0)
    SELF.AddKey(AORR:FK_OverboekingRitRegel,'AORR:FK_OverboekingRitRegel',0)
    SELF.AddKey(AORR:FK2_OverboekingRitRegel,'AORR:FK2_OverboekingRitRegel',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  IF SELF.File{prop:sqldriver} THEN SELF.create = 0.          ! ABCDefaults
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:AOverboekingRitRegel.Kill PROCEDURE

  CODE
  _Hide:Access:AOverboekingRitRegel.Kill                   ! Kill the file manager
  PARENT.Kill
  Relate:AOverboekingRitRegel &= NULL                      ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:AOverboekingRitRegel)               ! destroy the file manager


Hide:Relate:AAPlanning.Init PROCEDURE()
  CODE
  _Hide:Access:AAPlanning.Init
  SELF.Init(Access:AAPlanning,1)
  SELF.SetAlias(Relate:Planning)


Hide:Access:AAPlanning.DeleteRecord PROCEDURE(BYTE Query=1)

ReturnValue          BYTE,AUTO

  CODE
  GebruikerLogClass.Log('Delete', 'Planning', GebruikerLogClass.BepaalRecordContent(AAPla:Record))
  ReturnValue = PARENT.DeleteRecord(Query)
  RETURN ReturnValue


Hide:Access:AAPlanning.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= AAPla:Record
  SELF.AliasedFile &= Access:Planning                      !This is a File Alias, so assign aliased file manager
  SELF.FileNameValue = 'AAPlanning'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= AAPlanning
  PARENT.Init
  Access:AAPlanning &= SELF
  SELF.LazyOpen = False
  SELF.DoNotAssertOnCloseMisuse = 1  ! ABCDefaults
   IF SELF.File{prop:sqldriver} THEN SELF.create = 0.         ! ABCDefaults


Hide:Access:AAPlanning.Insert PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GebruikerLogClass.Log('Insert', 'Planning', GebruikerLogClass.BepaalRecordContent(AAPla:Record))
  ReturnValue = PARENT.Insert()
  RETURN ReturnValue


Hide:Access:AAPlanning.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:AAPlanning &= NULL                                ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:AAPlanning.TryInsert PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GebruikerLogClass.Log('Insert', 'Planning', GebruikerLogClass.BepaalRecordContent(AAPla:Record))
  ReturnValue = PARENT.TryInsert()
  RETURN ReturnValue


Hide:Access:AAPlanning.TryUpdate PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GebruikerLogClass.Log('Update', 'Planning', GebruikerLogClass.BepaalRecordContent(AAPla:Record))
  ReturnValue = PARENT.TryUpdate()
  RETURN ReturnValue


Hide:Access:AAPlanning.Update PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GebruikerLogClass.Log('Update', 'Planning', GebruikerLogClass.BepaalRecordContent(AAPla:Record))
  ReturnValue = PARENT.Update()
  RETURN ReturnValue


Hide:Access:AAPlanning.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(AAPlanning,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(AAPla:Datum_Tijd_K,'AAPla:Datum_Tijd_K',0)
    SELF.AddKey(AAPla:OverboekingCelID_Planning_K,'AAPla:OverboekingCelID_Planning_K',0)
    SELF.AddKey(AAPla:PK_Planning,'AAPla:PK_Planning',0)
    SELF.AddKey(AAPla:Planning_FK01,'Op InkoopID/Planning',0)
    SELF.AddKey(AAPla:Planning_FK02,'Op VerkoopID. PlanningID',0)
    SELF.AddKey(AAPla:Planning_FK03,'Op Planning',0)
    SELF.AddKey(AAPla:Planning_FK04,'AAPla:Planning_FK04',0)
    SELF.AddKey(AAPla:Planning_FK05,'AAPla:Planning_FK05',0)
    SELF.AddKey(AAPla:Verwerkt_Artikel_Planning_K,'AAPla:Verwerkt_Artikel_Planning_K',0)
    SELF.AddKey(AAPla:Verwerkt_OverboekingCelID_Planning_K,'AAPla:Verwerkt_OverboekingCelID_Planning_K',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  IF SELF.File{prop:sqldriver} THEN SELF.create = 0.          ! ABCDefaults
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:AAPlanning.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:PlanningInkoop)

  SELF.AddRelation(Relate:AACel,RI:None,RI:None,AACel:CEL_PK)
  SELF.AddRelationLink(AAPla:CelID,AACel:CelID)

  SELF.AddRelation(Relate:APartij,RI:None,RI:None,APar:Partij_PK)
  SELF.AddRelationLink(AAPla:PartijID,APar:PartijID)

  SELF.AddRelation(Relate:AAPartij,RI:None,RI:None,AAPar:Partij_PK)
  SELF.AddRelationLink(AAPla:PartijID,AAPar:PartijID)

  SELF.AddRelation(Relate:AAACel,RI:None,RI:None,AAACel:CEL_PK)
  SELF.AddRelationLink(AAPla:CelID,AAACel:CelID)

  SELF.AddRelation(Relate:AAAACel,RI:None,RI:None,AAAACEL:CEL_PK)
  SELF.AddRelationLink(AAPla:CelID,AAAACEL:CelID)

  SELF.AddRelation(Relate:PlanningVerkoop)

  SELF.AddRelation(Relate:AAVerpakking,RI:None,RI:None,AAVer:Verpakking_PK)
  SELF.AddRelationLink(AAPla:VerpakkingID,AAVer:VerpakkingID)

  SELF.AddRelation(Relate:Activiteit,RI:None,RI:None,ACT:FK1_Activiteit)
  SELF.AddRelationLink(AAPla:PlanningID,ACT:PlanningID)


Hide:Relate:AAPlanning.Kill PROCEDURE

  CODE
  _Hide:Access:AAPlanning.Kill                             ! Kill the file manager
  PARENT.Kill
  Relate:AAPlanning &= NULL                                ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:AAPlanning)                         ! destroy the file manager


Hide:Relate:AAPartij.Init PROCEDURE()
  CODE
  _Hide:Access:AAPartij.Init
  SELF.Init(Access:AAPartij,1)
  SELF.SetAlias(Relate:Partij)


Hide:Access:AAPartij.DeleteRecord PROCEDURE(BYTE Query=1)

ReturnValue          BYTE,AUTO

  CODE
  GebruikerLogClass.Log('Delete', 'Partij', GebruikerLogClass.BepaalRecordContent(AAPar:Record))
  ReturnValue = PARENT.DeleteRecord(Query)
  RETURN ReturnValue


Hide:Access:AAPartij.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= AAPar:Record
  SELF.AliasedFile &= Access:Partij                        !This is a File Alias, so assign aliased file manager
  SELF.FileNameValue = 'AAPartij'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= AAPartij
  PARENT.Init
  Access:AAPartij &= SELF
  SELF.LazyOpen = False
  SELF.DoNotAssertOnCloseMisuse = 1  ! ABCDefaults
   IF SELF.File{prop:sqldriver} THEN SELF.create = 0.         ! ABCDefaults


Hide:Access:AAPartij.Insert PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GebruikerLogClass.Log('Insert', 'Partij', GebruikerLogClass.BepaalRecordContent(AAPar:Record))
  ReturnValue = PARENT.Insert()
  RETURN ReturnValue


Hide:Access:AAPartij.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:AAPartij &= NULL                                  ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:AAPartij.TryInsert PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GebruikerLogClass.Log('Insert', 'Partij', GebruikerLogClass.BepaalRecordContent(AAPar:Record))
  ReturnValue = PARENT.TryInsert()
  RETURN ReturnValue


Hide:Access:AAPartij.TryUpdate PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GebruikerLogClass.Log('Update', 'Partij', GebruikerLogClass.BepaalRecordContent(AAPar:Record))
  ReturnValue = PARENT.TryUpdate()
  RETURN ReturnValue


Hide:Access:AAPartij.Update PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GebruikerLogClass.Log('Update', 'Partij', GebruikerLogClass.BepaalRecordContent(AAPar:Record))
  ReturnValue = PARENT.Update()
  RETURN ReturnValue


Hide:Access:AAPartij.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(AAPartij,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(AAPar:Partij_FK02,'AAPar:Partij_FK02',0)
    SELF.AddKey(AAPar:Partij_FK03,'AAPar:Partij_FK03',0)
    SELF.AddKey(AAPar:Partij_FK01,'AAPar:Partij_FK01',0)
    SELF.AddKey(AAPar:Partij_PK,'AAPar:Partij_PK',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  IF SELF.File{prop:sqldriver} THEN SELF.create = 0.          ! ABCDefaults
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:AAPartij.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:AAPlanning)


Hide:Relate:AAPartij.Kill PROCEDURE

  CODE
  _Hide:Access:AAPartij.Kill                               ! Kill the file manager
  PARENT.Kill
  Relate:AAPartij &= NULL                                  ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:AAPartij)                           ! destroy the file manager


Hide:Relate:AAAACel.Init PROCEDURE()
  CODE
  _Hide:Access:AAAACel.Init
  SELF.Init(Access:AAAACel,1)
  SELF.SetAlias(Relate:Cel)


Hide:Access:AAAACel.DeleteRecord PROCEDURE(BYTE Query=1)

ReturnValue          BYTE,AUTO

  CODE
  GebruikerLogClass.Log('Delete', 'Cel', GebruikerLogClass.BepaalRecordContent(AAAACEL:Record))
  ReturnValue = PARENT.DeleteRecord(Query)
  RETURN ReturnValue


Hide:Access:AAAACel.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= AAAACEL:Record
  SELF.AliasedFile &= Access:Cel                           !This is a File Alias, so assign aliased file manager
  SELF.FileNameValue = 'AAAACel'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= AAAACel
  PARENT.Init
  Access:AAAACel &= SELF
  SELF.LazyOpen = False
  SELF.DoNotAssertOnCloseMisuse = 1  ! ABCDefaults
   IF SELF.File{prop:sqldriver} THEN SELF.create = 0.         ! ABCDefaults


Hide:Access:AAAACel.Insert PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GebruikerLogClass.Log('Insert', 'Cel', GebruikerLogClass.BepaalRecordContent(AAAACEL:Record))
  ReturnValue = PARENT.Insert()
  RETURN ReturnValue


Hide:Access:AAAACel.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:AAAACel &= NULL                                   ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:AAAACel.TryInsert PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GebruikerLogClass.Log('Insert', 'Cel', GebruikerLogClass.BepaalRecordContent(AAAACEL:Record))
  ReturnValue = PARENT.TryInsert()
  RETURN ReturnValue


Hide:Access:AAAACel.TryUpdate PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GebruikerLogClass.Log('Update', 'Cel', GebruikerLogClass.BepaalRecordContent(AAAACEL:Record))
  ReturnValue = PARENT.TryUpdate()
  RETURN ReturnValue


Hide:Access:AAAACel.Update PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GebruikerLogClass.Log('Update', 'Cel', GebruikerLogClass.BepaalRecordContent(AAAACEL:Record))
  ReturnValue = PARENT.Update()
  RETURN ReturnValue


Hide:Access:AAAACel.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(AAAACel,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(AAAACEL:CEL_PK,'AAAACEL:CEL_PK',0)
    SELF.AddKey(AAAACEL:Cel_FK1,'Op Volgnr, CelID',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  IF SELF.File{prop:sqldriver} THEN SELF.create = 0.          ! ABCDefaults
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:AAAACel.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:AAPlanning)

  SELF.AddRelation(Relate:CelLocatie,RI:None,RI:None,CL:PK_CelLocatie)
  SELF.AddRelationLink(AAAACEL:CelID,CL:CelLocatieID)


Hide:Relate:AAAACel.Kill PROCEDURE

  CODE
  _Hide:Access:AAAACel.Kill                                ! Kill the file manager
  PARENT.Kill
  Relate:AAAACel &= NULL                                   ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:AAAACel)                            ! destroy the file manager


Hide:Relate:AOverboekingRit.Init PROCEDURE()
  CODE
  _Hide:Access:AOverboekingRit.Init
  SELF.Init(Access:AOverboekingRit,1)
  SELF.SetAlias(Relate:OverboekingRit)


Hide:Access:AOverboekingRit.DeleteRecord PROCEDURE(BYTE Query=1)

ReturnValue          BYTE,AUTO

  CODE
  GebruikerLogClass.Log('Delete', 'OverboekingRit', GebruikerLogClass.BepaalRecordContent(AOR:Record))
  ReturnValue = PARENT.DeleteRecord(Query)
  RETURN ReturnValue


Hide:Access:AOverboekingRit.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= AOR:Record
  SELF.AliasedFile &= Access:OverboekingRit                !This is a File Alias, so assign aliased file manager
  SELF.FileNameValue = 'AOverboekingRit'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= AOverboekingRit
  PARENT.Init
  Access:AOverboekingRit &= SELF
  SELF.LazyOpen = False
  SELF.DoNotAssertOnCloseMisuse = 1  ! ABCDefaults
   IF SELF.File{prop:sqldriver} THEN SELF.create = 0.         ! ABCDefaults


Hide:Access:AOverboekingRit.Insert PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GebruikerLogClass.Log('Insert', 'OverboekingRit', GebruikerLogClass.BepaalRecordContent(AOR:Record))
  ReturnValue = PARENT.Insert()
  RETURN ReturnValue


Hide:Access:AOverboekingRit.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:AOverboekingRit &= NULL                           ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:AOverboekingRit.TryInsert PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GebruikerLogClass.Log('Insert', 'OverboekingRit', GebruikerLogClass.BepaalRecordContent(AOR:Record))
  ReturnValue = PARENT.TryInsert()
  RETURN ReturnValue


Hide:Access:AOverboekingRit.TryUpdate PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GebruikerLogClass.Log('Update', 'OverboekingRit', GebruikerLogClass.BepaalRecordContent(AOR:Record))
  ReturnValue = PARENT.TryUpdate()
  RETURN ReturnValue


Hide:Access:AOverboekingRit.Update PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GebruikerLogClass.Log('Update', 'OverboekingRit', GebruikerLogClass.BepaalRecordContent(AOR:Record))
  ReturnValue = PARENT.Update()
  RETURN ReturnValue


Hide:Access:AOverboekingRit.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(AOverboekingRit,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(AOR:PK_OverboekingRit,'AOR:PK_OverboekingRit',0)
    SELF.AddKey(AOR:FK_OverboekingRit,'AOR:FK_OverboekingRit',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  IF SELF.File{prop:sqldriver} THEN SELF.create = 0.          ! ABCDefaults
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:AOverboekingRit.Kill PROCEDURE

  CODE
  _Hide:Access:AOverboekingRit.Kill                        ! Kill the file manager
  PARENT.Kill
  Relate:AOverboekingRit &= NULL                           ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:AOverboekingRit)                    ! destroy the file manager


Hide:Relate:APlanningInkoop.Init PROCEDURE()
  CODE
  _Hide:Access:APlanningInkoop.Init
  SELF.Init(Access:APlanningInkoop,1)
  SELF.SetAlias(Relate:PlanningInkoop)


Hide:Access:APlanningInkoop.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= APla2:Record
  SELF.AliasedFile &= Access:PlanningInkoop                !This is a File Alias, so assign aliased file manager
  SELF.FileNameValue = 'APlanningInkoop'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= APlanningInkoop
  PARENT.Init
  Access:APlanningInkoop &= SELF
  SELF.LazyOpen = False
  SELF.DoNotAssertOnCloseMisuse = 1  ! ABCDefaults
   IF SELF.File{prop:sqldriver} THEN SELF.create = 0.         ! ABCDefaults


Hide:Access:APlanningInkoop.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:APlanningInkoop &= NULL                           ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:APlanningInkoop.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(APlanningInkoop,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(APla2:Planning_K,'APla2:Planning_K',0)
    SELF.AddKey(APla2:PlanningID_K,'APla2:PlanningID_K',0)
    SELF.AddKey(APla2:Planning_FirmaNaam_K,'APla2:Planning_FirmaNaam_K',0)
    SELF.AddKey(APla2:Verwerkt_Planning_FirmaNaam_K,'APla2:Verwerkt_Planning_FirmaNaam_K',0)
    SELF.AddKey(APla2:Verwerkt_Planning_K,'APla2:Verwerkt_Planning_K',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  IF SELF.File{prop:sqldriver} THEN SELF.create = 0.          ! ABCDefaults
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:APlanningInkoop.Kill PROCEDURE

  CODE
  _Hide:Access:APlanningInkoop.Kill                        ! Kill the file manager
  PARENT.Kill
  Relate:APlanningInkoop &= NULL                           ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:APlanningInkoop)                    ! destroy the file manager


Hide:Relate:APlanningOverboeking.Init PROCEDURE()
  CODE
  _Hide:Access:APlanningOverboeking.Init
  SELF.Init(Access:APlanningOverboeking,1)
  SELF.SetAlias(Relate:PlanningOverboeking)


Hide:Access:APlanningOverboeking.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= APla4:Record
  SELF.AliasedFile &= Access:PlanningOverboeking           !This is a File Alias, so assign aliased file manager
  SELF.FileNameValue = 'APlanningOverboeking'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= APlanningOverboeking
  PARENT.Init
  Access:APlanningOverboeking &= SELF
  SELF.LazyOpen = False
  SELF.DoNotAssertOnCloseMisuse = 1  ! ABCDefaults
   IF SELF.File{prop:sqldriver} THEN SELF.create = 0.         ! ABCDefaults


Hide:Access:APlanningOverboeking.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:APlanningOverboeking &= NULL                      ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:APlanningOverboeking.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(APlanningOverboeking,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(APla4:PlanningID_K,'APla4:PlanningID_K',0)
    SELF.AddKey(APla4:Planning_K,'APla4:Planning_K',0)
    SELF.AddKey(APla4:Planning_FirmaNaam_k,'APla4:Planning_FirmaNaam_k',0)
    SELF.AddKey(APla4:Verwerkt_Planning_K,'APla4:Verwerkt_Planning_K',0)
    SELF.AddKey(APla4:Verwerkt_Planning_FirmaNaam_K,'APla4:Verwerkt_Planning_FirmaNaam_K',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  IF SELF.File{prop:sqldriver} THEN SELF.create = 0.          ! ABCDefaults
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:APlanningOverboeking.Kill PROCEDURE

  CODE
  _Hide:Access:APlanningOverboeking.Kill                   ! Kill the file manager
  PARENT.Kill
  Relate:APlanningOverboeking &= NULL                      ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:APlanningOverboeking)               ! destroy the file manager


Hide:Relate:APlanningVerkoop.Init PROCEDURE()
  CODE
  _Hide:Access:APlanningVerkoop.Init
  SELF.Init(Access:APlanningVerkoop,1)
  SELF.SetAlias(Relate:PlanningVerkoop)


Hide:Access:APlanningVerkoop.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= APla3:Record
  SELF.AliasedFile &= Access:PlanningVerkoop               !This is a File Alias, so assign aliased file manager
  SELF.FileNameValue = 'APlanningVerkoop'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= APlanningVerkoop
  PARENT.Init
  Access:APlanningVerkoop &= SELF
  SELF.LazyOpen = False
  SELF.DoNotAssertOnCloseMisuse = 1  ! ABCDefaults
   IF SELF.File{prop:sqldriver} THEN SELF.create = 0.         ! ABCDefaults


Hide:Access:APlanningVerkoop.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:APlanningVerkoop &= NULL                          ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:APlanningVerkoop.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(APlanningVerkoop,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(APla3:PlanningID_K,'APla3:PlanningID_K',0)
    SELF.AddKey(APla3:Verwerkt_Planning_FirmaNaam_K,'APla3:Verwerkt_Planning_FirmaNaam_K',0)
    SELF.AddKey(APla3:Planning_FirmaNaam_K,'APla3:Planning_FirmaNaam_K',0)
    SELF.AddKey(APla3:Planning_K,'APla3:Planning_K',0)
    SELF.AddKey(APla3:Verwerkt_Planning_K,'APla3:Verwerkt_Planning_K',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  IF SELF.File{prop:sqldriver} THEN SELF.create = 0.          ! ABCDefaults
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:APlanningVerkoop.Kill PROCEDURE

  CODE
  _Hide:Access:APlanningVerkoop.Kill                       ! Kill the file manager
  PARENT.Kill
  Relate:APlanningVerkoop &= NULL                          ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:APlanningVerkoop)                   ! destroy the file manager


Hide:Relate:APalletSoort.Init PROCEDURE()
  CODE
  _Hide:Access:APalletSoort.Init
  SELF.Init(Access:APalletSoort,1)
  SELF.SetAlias(Relate:PalletSoort)


Hide:Access:APalletSoort.DeleteRecord PROCEDURE(BYTE Query=1)

ReturnValue          BYTE,AUTO

  CODE
  GebruikerLogClass.Log('Delete', 'PalletSoort', GebruikerLogClass.BepaalRecordContent(APalSrt:Record))
  ReturnValue = PARENT.DeleteRecord(Query)
  RETURN ReturnValue


Hide:Access:APalletSoort.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= APalSrt:Record
  SELF.AliasedFile &= Access:PalletSoort                   !This is a File Alias, so assign aliased file manager
  SELF.FileNameValue = 'APalletSoort'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= APalletSoort
  PARENT.Init
  Access:APalletSoort &= SELF
  SELF.LazyOpen = False
  SELF.DoNotAssertOnCloseMisuse = 1  ! ABCDefaults
   IF SELF.File{prop:sqldriver} THEN SELF.create = 0.         ! ABCDefaults


Hide:Access:APalletSoort.Insert PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GebruikerLogClass.Log('Insert', 'PalletSoort', GebruikerLogClass.BepaalRecordContent(APalSrt:Record))
  ReturnValue = PARENT.Insert()
  RETURN ReturnValue


Hide:Access:APalletSoort.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:APalletSoort &= NULL                              ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:APalletSoort.TryInsert PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GebruikerLogClass.Log('Insert', 'PalletSoort', GebruikerLogClass.BepaalRecordContent(APalSrt:Record))
  ReturnValue = PARENT.TryInsert()
  RETURN ReturnValue


Hide:Access:APalletSoort.TryUpdate PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GebruikerLogClass.Log('Update', 'PalletSoort', GebruikerLogClass.BepaalRecordContent(APalSrt:Record))
  ReturnValue = PARENT.TryUpdate()
  RETURN ReturnValue


Hide:Access:APalletSoort.Update PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GebruikerLogClass.Log('Update', 'PalletSoort', GebruikerLogClass.BepaalRecordContent(APalSrt:Record))
  ReturnValue = PARENT.Update()
  RETURN ReturnValue


Hide:Access:APalletSoort.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(APalletSoort,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(APalSrt:PK_PalletSoort,'APalSrt:PK_PalletSoort',0)
    SELF.AddKey(APalSrt:FK_PalletSoort,'Op PalletOmschrijving/PalletSoortID',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  IF SELF.File{prop:sqldriver} THEN SELF.create = 0.          ! ABCDefaults
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:APalletSoort.Kill PROCEDURE

  CODE
  _Hide:Access:APalletSoort.Kill                           ! Kill the file manager
  PARENT.Kill
  Relate:APalletSoort &= NULL                              ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:APalletSoort)                       ! destroy the file manager


Hide:Relate:ACelLocatie.Init PROCEDURE()
  CODE
  _Hide:Access:ACelLocatie.Init
  SELF.Init(Access:ACelLocatie,1)
  SELF.SetAlias(Relate:CelLocatie)


Hide:Access:ACelLocatie.DeleteRecord PROCEDURE(BYTE Query=1)

ReturnValue          BYTE,AUTO

  CODE
  GebruikerLogClass.Log('Delete', 'CelLocatie', GebruikerLogClass.BepaalRecordContent(ACL:Record))
  ReturnValue = PARENT.DeleteRecord(Query)
  RETURN ReturnValue


Hide:Access:ACelLocatie.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= ACL:Record
  SELF.AliasedFile &= Access:CelLocatie                    !This is a File Alias, so assign aliased file manager
  SELF.FileNameValue = 'ACelLocatie'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= ACelLocatie
  PARENT.Init
  Access:ACelLocatie &= SELF
  SELF.LazyOpen = False
  SELF.DoNotAssertOnCloseMisuse = 1  ! ABCDefaults
   IF SELF.File{prop:sqldriver} THEN SELF.create = 0.         ! ABCDefaults


Hide:Access:ACelLocatie.Insert PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GebruikerLogClass.Log('Insert', 'CelLocatie', GebruikerLogClass.BepaalRecordContent(ACL:Record))
  ReturnValue = PARENT.Insert()
  RETURN ReturnValue


Hide:Access:ACelLocatie.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:ACelLocatie &= NULL                               ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:ACelLocatie.TryInsert PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GebruikerLogClass.Log('Insert', 'CelLocatie', GebruikerLogClass.BepaalRecordContent(ACL:Record))
  ReturnValue = PARENT.TryInsert()
  RETURN ReturnValue


Hide:Access:ACelLocatie.TryUpdate PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GebruikerLogClass.Log('Update', 'CelLocatie', GebruikerLogClass.BepaalRecordContent(ACL:Record))
  ReturnValue = PARENT.TryUpdate()
  RETURN ReturnValue


Hide:Access:ACelLocatie.Update PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GebruikerLogClass.Log('Update', 'CelLocatie', GebruikerLogClass.BepaalRecordContent(ACL:Record))
  ReturnValue = PARENT.Update()
  RETURN ReturnValue


Hide:Access:ACelLocatie.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(ACelLocatie,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(ACL:PK_CelLocatie,'ACL:PK_CelLocatie',0)
    SELF.AddKey(ACL:FK_CelLocatie,'ACL:FK_CelLocatie',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  IF SELF.File{prop:sqldriver} THEN SELF.create = 0.          ! ABCDefaults
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:ACelLocatie.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:Planning)


Hide:Relate:ACelLocatie.Kill PROCEDURE

  CODE
  _Hide:Access:ACelLocatie.Kill                            ! Kill the file manager
  PARENT.Kill
  Relate:ACelLocatie &= NULL                               ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:ACelLocatie)                        ! destroy the file manager


Hide:Relate:AACelLocatie.Init PROCEDURE()
  CODE
  _Hide:Access:AACelLocatie.Init
  SELF.Init(Access:AACelLocatie,1)
  SELF.SetAlias(Relate:CelLocatie)


Hide:Access:AACelLocatie.DeleteRecord PROCEDURE(BYTE Query=1)

ReturnValue          BYTE,AUTO

  CODE
  GebruikerLogClass.Log('Delete', 'CelLocatie', GebruikerLogClass.BepaalRecordContent(AACL:Record))
  ReturnValue = PARENT.DeleteRecord(Query)
  RETURN ReturnValue


Hide:Access:AACelLocatie.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= AACL:Record
  SELF.AliasedFile &= Access:CelLocatie                    !This is a File Alias, so assign aliased file manager
  SELF.FileNameValue = 'AACelLocatie'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= AACelLocatie
  PARENT.Init
  Access:AACelLocatie &= SELF
  SELF.LazyOpen = False
  SELF.DoNotAssertOnCloseMisuse = 1  ! ABCDefaults
   IF SELF.File{prop:sqldriver} THEN SELF.create = 0.         ! ABCDefaults


Hide:Access:AACelLocatie.Insert PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GebruikerLogClass.Log('Insert', 'CelLocatie', GebruikerLogClass.BepaalRecordContent(AACL:Record))
  ReturnValue = PARENT.Insert()
  RETURN ReturnValue


Hide:Access:AACelLocatie.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:AACelLocatie &= NULL                              ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:AACelLocatie.TryInsert PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GebruikerLogClass.Log('Insert', 'CelLocatie', GebruikerLogClass.BepaalRecordContent(AACL:Record))
  ReturnValue = PARENT.TryInsert()
  RETURN ReturnValue


Hide:Access:AACelLocatie.TryUpdate PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GebruikerLogClass.Log('Update', 'CelLocatie', GebruikerLogClass.BepaalRecordContent(AACL:Record))
  ReturnValue = PARENT.TryUpdate()
  RETURN ReturnValue


Hide:Access:AACelLocatie.Update PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GebruikerLogClass.Log('Update', 'CelLocatie', GebruikerLogClass.BepaalRecordContent(AACL:Record))
  ReturnValue = PARENT.Update()
  RETURN ReturnValue


Hide:Access:AACelLocatie.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(AACelLocatie,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(AACL:PK_CelLocatie,'AACL:PK_CelLocatie',0)
    SELF.AddKey(AACL:FK_CelLocatie,'AACL:FK_CelLocatie',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  IF SELF.File{prop:sqldriver} THEN SELF.create = 0.          ! ABCDefaults
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:AACelLocatie.Kill PROCEDURE

  CODE
  _Hide:Access:AACelLocatie.Kill                           ! Kill the file manager
  PARENT.Kill
  Relate:AACelLocatie &= NULL                              ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:AACelLocatie)                       ! destroy the file manager


Hide:Relate:AAACelLocatie.Init PROCEDURE()
  CODE
  _Hide:Access:AAACelLocatie.Init
  SELF.Init(Access:AAACelLocatie,1)
  SELF.SetAlias(Relate:CelLocatie)


Hide:Access:AAACelLocatie.DeleteRecord PROCEDURE(BYTE Query=1)

ReturnValue          BYTE,AUTO

  CODE
  GebruikerLogClass.Log('Delete', 'CelLocatie', GebruikerLogClass.BepaalRecordContent(AAACL:Record))
  ReturnValue = PARENT.DeleteRecord(Query)
  RETURN ReturnValue


Hide:Access:AAACelLocatie.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= AAACL:Record
  SELF.AliasedFile &= Access:CelLocatie                    !This is a File Alias, so assign aliased file manager
  SELF.FileNameValue = 'AAACelLocatie'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= AAACelLocatie
  PARENT.Init
  Access:AAACelLocatie &= SELF
  SELF.LazyOpen = False
  SELF.DoNotAssertOnCloseMisuse = 1  ! ABCDefaults
   IF SELF.File{prop:sqldriver} THEN SELF.create = 0.         ! ABCDefaults


Hide:Access:AAACelLocatie.Insert PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GebruikerLogClass.Log('Insert', 'CelLocatie', GebruikerLogClass.BepaalRecordContent(AAACL:Record))
  ReturnValue = PARENT.Insert()
  RETURN ReturnValue


Hide:Access:AAACelLocatie.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:AAACelLocatie &= NULL                             ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:AAACelLocatie.TryInsert PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GebruikerLogClass.Log('Insert', 'CelLocatie', GebruikerLogClass.BepaalRecordContent(AAACL:Record))
  ReturnValue = PARENT.TryInsert()
  RETURN ReturnValue


Hide:Access:AAACelLocatie.TryUpdate PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GebruikerLogClass.Log('Update', 'CelLocatie', GebruikerLogClass.BepaalRecordContent(AAACL:Record))
  ReturnValue = PARENT.TryUpdate()
  RETURN ReturnValue


Hide:Access:AAACelLocatie.Update PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GebruikerLogClass.Log('Update', 'CelLocatie', GebruikerLogClass.BepaalRecordContent(AAACL:Record))
  ReturnValue = PARENT.Update()
  RETURN ReturnValue


Hide:Access:AAACelLocatie.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(AAACelLocatie,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(AAACL:PK_CelLocatie,'AAACL:PK_CelLocatie',0)
    SELF.AddKey(AAACL:FK_CelLocatie,'AAACL:FK_CelLocatie',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  IF SELF.File{prop:sqldriver} THEN SELF.create = 0.          ! ABCDefaults
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:AAACelLocatie.Kill PROCEDURE

  CODE
  _Hide:Access:AAACelLocatie.Kill                          ! Kill the file manager
  PARENT.Kill
  Relate:AAACelLocatie &= NULL                             ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:AAACelLocatie)                      ! destroy the file manager


Hide:Relate:AAAACelLocatie.Init PROCEDURE()
  CODE
  _Hide:Access:AAAACelLocatie.Init
  SELF.Init(Access:AAAACelLocatie,1)
  SELF.SetAlias(Relate:CelLocatie)


Hide:Access:AAAACelLocatie.DeleteRecord PROCEDURE(BYTE Query=1)

ReturnValue          BYTE,AUTO

  CODE
  GebruikerLogClass.Log('Delete', 'CelLocatie', GebruikerLogClass.BepaalRecordContent(AAAACL:Record))
  ReturnValue = PARENT.DeleteRecord(Query)
  RETURN ReturnValue


Hide:Access:AAAACelLocatie.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= AAAACL:Record
  SELF.AliasedFile &= Access:CelLocatie                    !This is a File Alias, so assign aliased file manager
  SELF.FileNameValue = 'AAAACelLocatie'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= AAAACelLocatie
  PARENT.Init
  Access:AAAACelLocatie &= SELF
  SELF.LazyOpen = False
  SELF.DoNotAssertOnCloseMisuse = 1  ! ABCDefaults
   IF SELF.File{prop:sqldriver} THEN SELF.create = 0.         ! ABCDefaults


Hide:Access:AAAACelLocatie.Insert PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GebruikerLogClass.Log('Insert', 'CelLocatie', GebruikerLogClass.BepaalRecordContent(AAAACL:Record))
  ReturnValue = PARENT.Insert()
  RETURN ReturnValue


Hide:Access:AAAACelLocatie.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:AAAACelLocatie &= NULL                            ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:AAAACelLocatie.TryInsert PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GebruikerLogClass.Log('Insert', 'CelLocatie', GebruikerLogClass.BepaalRecordContent(AAAACL:Record))
  ReturnValue = PARENT.TryInsert()
  RETURN ReturnValue


Hide:Access:AAAACelLocatie.TryUpdate PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GebruikerLogClass.Log('Update', 'CelLocatie', GebruikerLogClass.BepaalRecordContent(AAAACL:Record))
  ReturnValue = PARENT.TryUpdate()
  RETURN ReturnValue


Hide:Access:AAAACelLocatie.Update PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GebruikerLogClass.Log('Update', 'CelLocatie', GebruikerLogClass.BepaalRecordContent(AAAACL:Record))
  ReturnValue = PARENT.Update()
  RETURN ReturnValue


Hide:Access:AAAACelLocatie.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(AAAACelLocatie,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(AAAACL:PK_CelLocatie,'AAAACL:PK_CelLocatie',0)
    SELF.AddKey(AAAACL:FK_CelLocatie,'AAAACL:FK_CelLocatie',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  IF SELF.File{prop:sqldriver} THEN SELF.create = 0.          ! ABCDefaults
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:AAAACelLocatie.Kill PROCEDURE

  CODE
  _Hide:Access:AAAACelLocatie.Kill                         ! Kill the file manager
  PARENT.Kill
  Relate:AAAACelLocatie &= NULL                            ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:AAAACelLocatie)                     ! destroy the file manager

