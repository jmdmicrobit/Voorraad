  MEMBER('VoorrDct.clw')

  INCLUDE('ABFILE.INC'),ONCE

  MAP
VoorrDct_BC2:DctInit    PROCEDURE()
VoorrDct_BC2:DctKill    PROCEDURE()
VoorrDct_BC2:FilesInit  PROCEDURE()
  END

Hide:Access:GebruikerLog CLASS(FileManager),TYPE           ! FileManager for GebruikerLog
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
PreInsert              PROCEDURE(SIGNED OpCode,UNSIGNED AddLen,*CSTRING ErrCode,*CSTRING ErrMsg),BYTE,DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:GebruikerLog CLASS(RelationManager),TYPE       ! RelationManager for GebruikerLog
Init                   PROCEDURE
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:SnelheidLogging CLASS(FileManager),TYPE        ! FileManager for SnelheidLogging
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:SnelheidLogging CLASS(RelationManager),TYPE    ! RelationManager for SnelheidLogging
Init                   PROCEDURE
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:CelArtikelVoorraad CLASS(FileManager),TYPE     ! FileManager for CelArtikelVoorraad
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
PreInsert              PROCEDURE(SIGNED OpCode,UNSIGNED AddLen,*CSTRING ErrCode,*CSTRING ErrMsg),BYTE,DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:CelArtikelVoorraad CLASS(RelationManager),TYPE ! RelationManager for CelArtikelVoorraad
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:PartijCelVoorraad CLASS(FileManager),TYPE      ! FileManager for PartijCelVoorraad
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
PreInsert              PROCEDURE(SIGNED OpCode,UNSIGNED AddLen,*CSTRING ErrCode,*CSTRING ErrMsg),BYTE,DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:PartijCelVoorraad CLASS(RelationManager),TYPE  ! RelationManager for PartijCelVoorraad
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:Activiteit CLASS(FileManager),TYPE             ! FileManager for Activiteit
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
PreInsert              PROCEDURE(SIGNED OpCode,UNSIGNED AddLen,*CSTRING ErrCode,*CSTRING ErrMsg),BYTE,DERIVED
PrimeFields            PROCEDURE(),PROC,DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:Activiteit CLASS(RelationManager),TYPE         ! RelationManager for Activiteit
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:PalletBladSjabloon CLASS(FileManager),TYPE     ! FileManager for PalletBladSjabloon
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
PreInsert              PROCEDURE(SIGNED OpCode,UNSIGNED AddLen,*CSTRING ErrCode,*CSTRING ErrMsg),BYTE,DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:PalletBladSjabloon CLASS(RelationManager),TYPE ! RelationManager for PalletBladSjabloon
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:PalletBladSjabloonCountry CLASS(FileManager),TYPE ! FileManager for PalletBladSjabloonCountry
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
PreInsert              PROCEDURE(SIGNED OpCode,UNSIGNED AddLen,*CSTRING ErrCode,*CSTRING ErrMsg),BYTE,DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:PalletBladSjabloonCountry CLASS(RelationManager),TYPE ! RelationManager for PalletBladSjabloonCountry
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:RelatieArtikelOmschrijving CLASS(FileManager),TYPE ! FileManager for RelatieArtikelOmschrijving
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
PreInsert              PROCEDURE(SIGNED OpCode,UNSIGNED AddLen,*CSTRING ErrCode,*CSTRING ErrMsg),BYTE,DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
ValidateFieldServer    PROCEDURE(UNSIGNED Id,BYTE HandleErrors),BYTE,PROC,DERIVED
                     END


Hide:Relate:RelatieArtikelOmschrijving CLASS(RelationManager),TYPE ! RelationManager for RelatieArtikelOmschrijving
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:Pallet   CLASS(FileManager),TYPE               ! FileManager for Pallet
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
PreInsert              PROCEDURE(SIGNED OpCode,UNSIGNED AddLen,*CSTRING ErrCode,*CSTRING ErrMsg),BYTE,DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:Pallet   CLASS(RelationManager),TYPE           ! RelationManager for Pallet
Init                   PROCEDURE
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:KostenStamgeg CLASS(FileManager),TYPE          ! FileManager for KostenStamgeg
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
PreInsert              PROCEDURE(SIGNED OpCode,UNSIGNED AddLen,*CSTRING ErrCode,*CSTRING ErrMsg),BYTE,DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:KostenStamgeg CLASS(RelationManager),TYPE      ! RelationManager for KostenStamgeg
Init                   PROCEDURE
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:ExtraKosten CLASS(FileManager),TYPE            ! FileManager for ExtraKosten
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:ExtraKosten CLASS(RelationManager),TYPE        ! RelationManager for ExtraKosten
Init                   PROCEDURE
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:ViewBetcd CLASS(FileManager),TYPE              ! FileManager for ViewBetcd
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:ViewBetcd CLASS(RelationManager),TYPE          ! RelationManager for ViewBetcd
Init                   PROCEDURE
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:DeliveryTerms CLASS(FileManager),TYPE          ! FileManager for DeliveryTerms
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:DeliveryTerms CLASS(RelationManager),TYPE      ! RelationManager for DeliveryTerms
Init                   PROCEDURE
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:ISOCountries CLASS(FileManager),TYPE           ! FileManager for ISOCountries
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:ISOCountries CLASS(RelationManager),TYPE       ! RelationManager for ISOCountries
Init                   PROCEDURE
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:SSOPCategorie CLASS(FileManager),TYPE          ! FileManager for SSOPCategorie
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
PreInsert              PROCEDURE(SIGNED OpCode,UNSIGNED AddLen,*CSTRING ErrCode,*CSTRING ErrMsg),BYTE,DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:SSOPCategorie CLASS(RelationManager),TYPE      ! RelationManager for SSOPCategorie
Init                   PROCEDURE
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:SSOPObject CLASS(FileManager),TYPE             ! FileManager for SSOPObject
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
PreInsert              PROCEDURE(SIGNED OpCode,UNSIGNED AddLen,*CSTRING ErrCode,*CSTRING ErrMsg),BYTE,DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:SSOPObject CLASS(RelationManager),TYPE         ! RelationManager for SSOPObject
Init                   PROCEDURE
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:SSOPRegistratie CLASS(FileManager),TYPE        ! FileManager for SSOPRegistratie
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
ValidateFieldServer    PROCEDURE(UNSIGNED Id,BYTE HandleErrors),BYTE,PROC,DERIVED
                     END


Hide:Relate:SSOPRegistratie CLASS(RelationManager),TYPE    ! RelationManager for SSOPRegistratie
Init                   PROCEDURE
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:SSOPTijd CLASS(FileManager),TYPE               ! FileManager for SSOPTijd
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
PreInsert              PROCEDURE(SIGNED OpCode,UNSIGNED AddLen,*CSTRING ErrCode,*CSTRING ErrMsg),BYTE,DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:SSOPTijd CLASS(RelationManager),TYPE           ! RelationManager for SSOPTijd
Init                   PROCEDURE
Kill                   PROCEDURE(),DERIVED
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


_Hide:Access:GebruikerLog &Hide:Access:GebruikerLog,AUTO,THREAD
_Hide:Relate:GebruikerLog &Hide:Relate:GebruikerLog,AUTO,THREAD
_Hide:Access:SnelheidLogging &Hide:Access:SnelheidLogging,AUTO,THREAD
_Hide:Relate:SnelheidLogging &Hide:Relate:SnelheidLogging,AUTO,THREAD
_Hide:Access:CelArtikelVoorraad &Hide:Access:CelArtikelVoorraad,AUTO,THREAD
_Hide:Relate:CelArtikelVoorraad &Hide:Relate:CelArtikelVoorraad,AUTO,THREAD
_Hide:Access:PartijCelVoorraad &Hide:Access:PartijCelVoorraad,AUTO,THREAD
_Hide:Relate:PartijCelVoorraad &Hide:Relate:PartijCelVoorraad,AUTO,THREAD
_Hide:Access:Activiteit &Hide:Access:Activiteit,AUTO,THREAD
_Hide:Relate:Activiteit &Hide:Relate:Activiteit,AUTO,THREAD
_Hide:Access:PalletBladSjabloon &Hide:Access:PalletBladSjabloon,AUTO,THREAD
_Hide:Relate:PalletBladSjabloon &Hide:Relate:PalletBladSjabloon,AUTO,THREAD
_Hide:Access:PalletBladSjabloonCountry &Hide:Access:PalletBladSjabloonCountry,AUTO,THREAD
_Hide:Relate:PalletBladSjabloonCountry &Hide:Relate:PalletBladSjabloonCountry,AUTO,THREAD
_Hide:Access:RelatieArtikelOmschrijving &Hide:Access:RelatieArtikelOmschrijving,AUTO,THREAD
_Hide:Relate:RelatieArtikelOmschrijving &Hide:Relate:RelatieArtikelOmschrijving,AUTO,THREAD
_Hide:Access:Pallet  &Hide:Access:Pallet,AUTO,THREAD
_Hide:Relate:Pallet  &Hide:Relate:Pallet,AUTO,THREAD
_Hide:Access:KostenStamgeg &Hide:Access:KostenStamgeg,AUTO,THREAD
_Hide:Relate:KostenStamgeg &Hide:Relate:KostenStamgeg,AUTO,THREAD
_Hide:Access:ExtraKosten &Hide:Access:ExtraKosten,AUTO,THREAD
_Hide:Relate:ExtraKosten &Hide:Relate:ExtraKosten,AUTO,THREAD
_Hide:Access:ViewBetcd &Hide:Access:ViewBetcd,AUTO,THREAD
_Hide:Relate:ViewBetcd &Hide:Relate:ViewBetcd,AUTO,THREAD
_Hide:Access:DeliveryTerms &Hide:Access:DeliveryTerms,AUTO,THREAD
_Hide:Relate:DeliveryTerms &Hide:Relate:DeliveryTerms,AUTO,THREAD
_Hide:Access:ISOCountries &Hide:Access:ISOCountries,AUTO,THREAD
_Hide:Relate:ISOCountries &Hide:Relate:ISOCountries,AUTO,THREAD
_Hide:Access:SSOPCategorie &Hide:Access:SSOPCategorie,AUTO,THREAD
_Hide:Relate:SSOPCategorie &Hide:Relate:SSOPCategorie,AUTO,THREAD
_Hide:Access:SSOPObject &Hide:Access:SSOPObject,AUTO,THREAD
_Hide:Relate:SSOPObject &Hide:Relate:SSOPObject,AUTO,THREAD
_Hide:Access:SSOPRegistratie &Hide:Access:SSOPRegistratie,AUTO,THREAD
_Hide:Relate:SSOPRegistratie &Hide:Relate:SSOPRegistratie,AUTO,THREAD
_Hide:Access:SSOPTijd &Hide:Access:SSOPTijd,AUTO,THREAD
_Hide:Relate:SSOPTijd &Hide:Relate:SSOPTijd,AUTO,THREAD
_Hide:Access:GNCode  &Hide:Access:GNCode,AUTO,THREAD
_Hide:Relate:GNCode  &Hide:Relate:GNCode,AUTO,THREAD
_Hide:Access:GNCodeArtikelen &Hide:Access:GNCodeArtikelen,AUTO,THREAD
_Hide:Relate:GNCodeArtikelen &Hide:Relate:GNCodeArtikelen,AUTO,THREAD


VoorrDct_BC2:DctInit PROCEDURE()
  CODE
  _Hide:Access:GebruikerLog &= NEW(Hide:Access:GebruikerLog)
  _Hide:Relate:GebruikerLog &= NEW(Hide:Relate:GebruikerLog)
  _Hide:Access:SnelheidLogging &= NEW(Hide:Access:SnelheidLogging)
  _Hide:Relate:SnelheidLogging &= NEW(Hide:Relate:SnelheidLogging)
  _Hide:Access:CelArtikelVoorraad &= NEW(Hide:Access:CelArtikelVoorraad)
  _Hide:Relate:CelArtikelVoorraad &= NEW(Hide:Relate:CelArtikelVoorraad)
  _Hide:Access:PartijCelVoorraad &= NEW(Hide:Access:PartijCelVoorraad)
  _Hide:Relate:PartijCelVoorraad &= NEW(Hide:Relate:PartijCelVoorraad)
  _Hide:Access:Activiteit &= NEW(Hide:Access:Activiteit)
  _Hide:Relate:Activiteit &= NEW(Hide:Relate:Activiteit)
  _Hide:Access:PalletBladSjabloon &= NEW(Hide:Access:PalletBladSjabloon)
  _Hide:Relate:PalletBladSjabloon &= NEW(Hide:Relate:PalletBladSjabloon)
  _Hide:Access:PalletBladSjabloonCountry &= NEW(Hide:Access:PalletBladSjabloonCountry)
  _Hide:Relate:PalletBladSjabloonCountry &= NEW(Hide:Relate:PalletBladSjabloonCountry)
  _Hide:Access:RelatieArtikelOmschrijving &= NEW(Hide:Access:RelatieArtikelOmschrijving)
  _Hide:Relate:RelatieArtikelOmschrijving &= NEW(Hide:Relate:RelatieArtikelOmschrijving)
  _Hide:Access:Pallet &= NEW(Hide:Access:Pallet)
  _Hide:Relate:Pallet &= NEW(Hide:Relate:Pallet)
  _Hide:Access:KostenStamgeg &= NEW(Hide:Access:KostenStamgeg)
  _Hide:Relate:KostenStamgeg &= NEW(Hide:Relate:KostenStamgeg)
  _Hide:Access:ExtraKosten &= NEW(Hide:Access:ExtraKosten)
  _Hide:Relate:ExtraKosten &= NEW(Hide:Relate:ExtraKosten)
  _Hide:Access:ViewBetcd &= NEW(Hide:Access:ViewBetcd)
  _Hide:Relate:ViewBetcd &= NEW(Hide:Relate:ViewBetcd)
  _Hide:Access:DeliveryTerms &= NEW(Hide:Access:DeliveryTerms)
  _Hide:Relate:DeliveryTerms &= NEW(Hide:Relate:DeliveryTerms)
  _Hide:Access:ISOCountries &= NEW(Hide:Access:ISOCountries)
  _Hide:Relate:ISOCountries &= NEW(Hide:Relate:ISOCountries)
  _Hide:Access:SSOPCategorie &= NEW(Hide:Access:SSOPCategorie)
  _Hide:Relate:SSOPCategorie &= NEW(Hide:Relate:SSOPCategorie)
  _Hide:Access:SSOPObject &= NEW(Hide:Access:SSOPObject)
  _Hide:Relate:SSOPObject &= NEW(Hide:Relate:SSOPObject)
  _Hide:Access:SSOPRegistratie &= NEW(Hide:Access:SSOPRegistratie)
  _Hide:Relate:SSOPRegistratie &= NEW(Hide:Relate:SSOPRegistratie)
  _Hide:Access:SSOPTijd &= NEW(Hide:Access:SSOPTijd)
  _Hide:Relate:SSOPTijd &= NEW(Hide:Relate:SSOPTijd)
  _Hide:Access:GNCode &= NEW(Hide:Access:GNCode)
  _Hide:Relate:GNCode &= NEW(Hide:Relate:GNCode)
  _Hide:Access:GNCodeArtikelen &= NEW(Hide:Access:GNCodeArtikelen)
  _Hide:Relate:GNCodeArtikelen &= NEW(Hide:Relate:GNCodeArtikelen)
  Relate:GebruikerLog &= _Hide:Relate:GebruikerLog
  Relate:SnelheidLogging &= _Hide:Relate:SnelheidLogging
  Relate:CelArtikelVoorraad &= _Hide:Relate:CelArtikelVoorraad
  Relate:PartijCelVoorraad &= _Hide:Relate:PartijCelVoorraad
  Relate:Activiteit &= _Hide:Relate:Activiteit
  Relate:PalletBladSjabloon &= _Hide:Relate:PalletBladSjabloon
  Relate:PalletBladSjabloonCountry &= _Hide:Relate:PalletBladSjabloonCountry
  Relate:RelatieArtikelOmschrijving &= _Hide:Relate:RelatieArtikelOmschrijving
  Relate:Pallet &= _Hide:Relate:Pallet
  Relate:KostenStamgeg &= _Hide:Relate:KostenStamgeg
  Relate:ExtraKosten &= _Hide:Relate:ExtraKosten
  Relate:ViewBetcd &= _Hide:Relate:ViewBetcd
  Relate:DeliveryTerms &= _Hide:Relate:DeliveryTerms
  Relate:ISOCountries &= _Hide:Relate:ISOCountries
  Relate:SSOPCategorie &= _Hide:Relate:SSOPCategorie
  Relate:SSOPObject &= _Hide:Relate:SSOPObject
  Relate:SSOPRegistratie &= _Hide:Relate:SSOPRegistratie
  Relate:SSOPTijd &= _Hide:Relate:SSOPTijd
  Relate:GNCode &= _Hide:Relate:GNCode
  Relate:GNCodeArtikelen &= _Hide:Relate:GNCodeArtikelen


VoorrDct_BC2:FilesInit PROCEDURE()
  CODE
  _Hide:Relate:GebruikerLog.Init
  _Hide:Relate:SnelheidLogging.Init
  _Hide:Relate:CelArtikelVoorraad.Init
  _Hide:Relate:PartijCelVoorraad.Init
  _Hide:Relate:Activiteit.Init
  _Hide:Relate:PalletBladSjabloon.Init
  _Hide:Relate:PalletBladSjabloonCountry.Init
  _Hide:Relate:RelatieArtikelOmschrijving.Init
  _Hide:Relate:Pallet.Init
  _Hide:Relate:KostenStamgeg.Init
  _Hide:Relate:ExtraKosten.Init
  _Hide:Relate:ViewBetcd.Init
  _Hide:Relate:DeliveryTerms.Init
  _Hide:Relate:ISOCountries.Init
  _Hide:Relate:SSOPCategorie.Init
  _Hide:Relate:SSOPObject.Init
  _Hide:Relate:SSOPRegistratie.Init
  _Hide:Relate:SSOPTijd.Init
  _Hide:Relate:GNCode.Init
  _Hide:Relate:GNCodeArtikelen.Init


VoorrDct_BC2:DctKill PROCEDURE()
  CODE
  _Hide:Relate:GebruikerLog.Kill
  DISPOSE(_Hide:Relate:GebruikerLog)
  _Hide:Relate:SnelheidLogging.Kill
  DISPOSE(_Hide:Relate:SnelheidLogging)
  _Hide:Relate:CelArtikelVoorraad.Kill
  DISPOSE(_Hide:Relate:CelArtikelVoorraad)
  _Hide:Relate:PartijCelVoorraad.Kill
  DISPOSE(_Hide:Relate:PartijCelVoorraad)
  _Hide:Relate:Activiteit.Kill
  DISPOSE(_Hide:Relate:Activiteit)
  _Hide:Relate:PalletBladSjabloon.Kill
  DISPOSE(_Hide:Relate:PalletBladSjabloon)
  _Hide:Relate:PalletBladSjabloonCountry.Kill
  DISPOSE(_Hide:Relate:PalletBladSjabloonCountry)
  _Hide:Relate:RelatieArtikelOmschrijving.Kill
  DISPOSE(_Hide:Relate:RelatieArtikelOmschrijving)
  _Hide:Relate:Pallet.Kill
  DISPOSE(_Hide:Relate:Pallet)
  _Hide:Relate:KostenStamgeg.Kill
  DISPOSE(_Hide:Relate:KostenStamgeg)
  _Hide:Relate:ExtraKosten.Kill
  DISPOSE(_Hide:Relate:ExtraKosten)
  _Hide:Relate:ViewBetcd.Kill
  DISPOSE(_Hide:Relate:ViewBetcd)
  _Hide:Relate:DeliveryTerms.Kill
  DISPOSE(_Hide:Relate:DeliveryTerms)
  _Hide:Relate:ISOCountries.Kill
  DISPOSE(_Hide:Relate:ISOCountries)
  _Hide:Relate:SSOPCategorie.Kill
  DISPOSE(_Hide:Relate:SSOPCategorie)
  _Hide:Relate:SSOPObject.Kill
  DISPOSE(_Hide:Relate:SSOPObject)
  _Hide:Relate:SSOPRegistratie.Kill
  DISPOSE(_Hide:Relate:SSOPRegistratie)
  _Hide:Relate:SSOPTijd.Kill
  DISPOSE(_Hide:Relate:SSOPTijd)
  _Hide:Relate:GNCode.Kill
  DISPOSE(_Hide:Relate:GNCode)
  _Hide:Relate:GNCodeArtikelen.Kill
  DISPOSE(_Hide:Relate:GNCodeArtikelen)


Hide:Relate:GebruikerLog.Init PROCEDURE()
  CODE
  _Hide:Access:GebruikerLog.Init
  SELF.Init(Access:GebruikerLog,1)


Hide:Access:GebruikerLog.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= Log:Record
  SELF.FileNameValue = 'GebruikerLog'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= GebruikerLog
  PARENT.Init
  Access:GebruikerLog &= SELF
  SELF.LazyOpen = False
  SELF.DoNotAssertOnCloseMisuse = 1  ! ABCDefaults
   IF SELF.File{prop:sqldriver} THEN SELF.create = 0.         ! ABCDefaults


Hide:Access:GebruikerLog.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:GebruikerLog &= NULL                              ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:GebruikerLog.PreInsert PROCEDURE(SIGNED OpCode,UNSIGNED AddLen,*CSTRING ErrCode,*CSTRING ErrMsg)

ReturnValue          BYTE,AUTO

Buffer LIKE(Log:RECORD)
  CODE
  PUSHERRORS()
  IF SELF.SavePreviousBuffer AND NOT(SELF.PreviousBuffer &= NULL)
     Buffer = SELF.PreviousBuffer
  END
  GebruikerLog{PROP:ServerAutoInc}
  GebruikerLog{PROP:ServerAutoInc,1}=1 !Log:ID
  ReturnValue = PARENT.PreInsert(OpCode,AddLen,ErrCode,ErrMsg)
  POPERRORS()
  RETURN ReturnValue


Hide:Access:GebruikerLog.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

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
    SELF.Init(GebruikerLog,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(Log:FK1_GebruikerLog,'Log:FK1_GebruikerLog',0)
    SELF.AddKey(Log:FK2_GebruikerLog,'Log:FK2_GebruikerLog',0)
    SELF.AddKey(Log:PK_GebruikerLog,'Log:PK_GebruikerLog',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  IF SELF.File{prop:sqldriver} THEN SELF.create = 0.          ! ABCDefaults
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:GebruikerLog.Kill PROCEDURE

  CODE
  _Hide:Access:GebruikerLog.Kill                           ! Kill the file manager
  PARENT.Kill
  Relate:GebruikerLog &= NULL                              ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:GebruikerLog)                       ! destroy the file manager


Hide:Relate:SnelheidLogging.Init PROCEDURE()
  CODE
  _Hide:Access:SnelheidLogging.Init
  SELF.Init(Access:SnelheidLogging,1)


Hide:Access:SnelheidLogging.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= Sne:Record
  SELF.FileNameValue = 'SnelheidLogging'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= SnelheidLogging
  PARENT.Init
  Access:SnelheidLogging &= SELF
  SELF.LazyOpen = False
  SELF.DoNotAssertOnCloseMisuse = 1  ! ABCDefaults
   IF SELF.File{prop:sqldriver} THEN SELF.create = 0.         ! ABCDefaults


Hide:Access:SnelheidLogging.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:SnelheidLogging &= NULL                           ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:SnelheidLogging.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(SnelheidLogging,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(Sne:PK_SnelheidLogging,'Sne:PK_SnelheidLogging',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  IF SELF.File{prop:sqldriver} THEN SELF.create = 0.          ! ABCDefaults
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:SnelheidLogging.Kill PROCEDURE

  CODE
  _Hide:Access:SnelheidLogging.Kill                        ! Kill the file manager
  PARENT.Kill
  Relate:SnelheidLogging &= NULL                           ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:SnelheidLogging)                    ! destroy the file manager


Hide:Relate:CelArtikelVoorraad.Init PROCEDURE()
  CODE
  _Hide:Access:CelArtikelVoorraad.Init
  SELF.Init(Access:CelArtikelVoorraad,1)


Hide:Access:CelArtikelVoorraad.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= CAV:Record
  SELF.FileNameValue = 'CelArtikelVoorraad'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= CelArtikelVoorraad
  PARENT.Init
  Access:CelArtikelVoorraad &= SELF
  SELF.LazyOpen = False
  SELF.DoNotAssertOnCloseMisuse = 1  ! ABCDefaults
   IF SELF.File{prop:sqldriver} THEN SELF.create = 0.         ! ABCDefaults


Hide:Access:CelArtikelVoorraad.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:CelArtikelVoorraad &= NULL                        ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:CelArtikelVoorraad.PreInsert PROCEDURE(SIGNED OpCode,UNSIGNED AddLen,*CSTRING ErrCode,*CSTRING ErrMsg)

ReturnValue          BYTE,AUTO

Buffer LIKE(CAV:RECORD)
  CODE
  PUSHERRORS()
  IF SELF.SavePreviousBuffer AND NOT(SELF.PreviousBuffer &= NULL)
     Buffer = SELF.PreviousBuffer
  END
  CelArtikelVoorraad{PROP:ServerAutoInc}
  CelArtikelVoorraad{PROP:ServerAutoInc,1}=1 !CAV:CelArtikelVoorraadID
  ReturnValue = PARENT.PreInsert(OpCode,AddLen,ErrCode,ErrMsg)
  POPERRORS()
  RETURN ReturnValue


Hide:Access:CelArtikelVoorraad.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(CelArtikelVoorraad,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(CAV:PK_CelArtikelVoorraad,'CAV:PK_CelArtikelVoorraad',0)
    SELF.AddKey(CAV:FK1_CelArtikelVoorraad,'Op CelID / ArtikelID',0)
    SELF.AddKey(CAV:FK2_CelArtikelVoorraad,'Op ArtikelID / CelID',0)
    SELF.AddKey(CAV:FK3_CelArtikelVoorraad,'Op CelID / ArtikelOms',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  IF SELF.File{prop:sqldriver} THEN SELF.create = 0.          ! ABCDefaults
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:CelArtikelVoorraad.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:Cel)

  SELF.AddRelation(Relate:ViewArtikel)


Hide:Relate:CelArtikelVoorraad.Kill PROCEDURE

  CODE
  _Hide:Access:CelArtikelVoorraad.Kill                     ! Kill the file manager
  PARENT.Kill
  Relate:CelArtikelVoorraad &= NULL                        ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:CelArtikelVoorraad)                 ! destroy the file manager


Hide:Relate:PartijCelVoorraad.Init PROCEDURE()
  CODE
  _Hide:Access:PartijCelVoorraad.Init
  SELF.Init(Access:PartijCelVoorraad,1)


Hide:Access:PartijCelVoorraad.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= PCV:Record
  SELF.FileNameValue = 'PartijCelVoorraad'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= PartijCelVoorraad
  PARENT.Init
  Access:PartijCelVoorraad &= SELF
  SELF.LazyOpen = False
  SELF.DoNotAssertOnCloseMisuse = 1  ! ABCDefaults
   IF SELF.File{prop:sqldriver} THEN SELF.create = 0.         ! ABCDefaults


Hide:Access:PartijCelVoorraad.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:PartijCelVoorraad &= NULL                         ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:PartijCelVoorraad.PreInsert PROCEDURE(SIGNED OpCode,UNSIGNED AddLen,*CSTRING ErrCode,*CSTRING ErrMsg)

ReturnValue          BYTE,AUTO

Buffer LIKE(PCV:RECORD)
  CODE
  PUSHERRORS()
  IF SELF.SavePreviousBuffer AND NOT(SELF.PreviousBuffer &= NULL)
     Buffer = SELF.PreviousBuffer
  END
  PartijCelVoorraad{PROP:ServerAutoInc}
  PartijCelVoorraad{PROP:ServerAutoInc,1}=1 !PCV:PartijCelVoorraadID
  ReturnValue = PARENT.PreInsert(OpCode,AddLen,ErrCode,ErrMsg)
  POPERRORS()
  RETURN ReturnValue


Hide:Access:PartijCelVoorraad.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(PartijCelVoorraad,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(PCV:PK_PartijCelVoorraad,'PCV:PK_PartijCelVoorraad',0)
    SELF.AddKey(PCV:FK1_PartijCelVoorraad,'Op PartijID / CelID',0)
    SELF.AddKey(PCV:FK2_PartijCelVoorraad,'Op CelID / PartijID',0)
    SELF.AddKey(PCV:FK3_PartijCelVoorraad,'Op ExternPartijnr/PartijID/CelID',0)
    SELF.AddKey(PCV:FK4_PartijCelVoorraad,'Op ArtikelOms/PartijID/CelID',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  IF SELF.File{prop:sqldriver} THEN SELF.create = 0.          ! ABCDefaults
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:PartijCelVoorraad.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:Partij)

  SELF.AddRelation(Relate:Cel)


Hide:Relate:PartijCelVoorraad.Kill PROCEDURE

  CODE
  _Hide:Access:PartijCelVoorraad.Kill                      ! Kill the file manager
  PARENT.Kill
  Relate:PartijCelVoorraad &= NULL                         ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:PartijCelVoorraad)                  ! destroy the file manager


Hide:Relate:Activiteit.Init PROCEDURE()
  CODE
  _Hide:Access:Activiteit.Init
  SELF.Init(Access:Activiteit,1)


Hide:Access:Activiteit.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= ACT:Record
  SELF.FileNameValue = 'Activiteit'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= Activiteit
  PARENT.Init
  Access:Activiteit &= SELF
  SELF.LazyOpen = False
  SELF.DoNotAssertOnCloseMisuse = 1  ! ABCDefaults
   IF SELF.File{prop:sqldriver} THEN SELF.create = 0.         ! ABCDefaults


Hide:Access:Activiteit.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:Activiteit &= NULL                                ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:Activiteit.PreInsert PROCEDURE(SIGNED OpCode,UNSIGNED AddLen,*CSTRING ErrCode,*CSTRING ErrMsg)

ReturnValue          BYTE,AUTO

Buffer LIKE(ACT:RECORD)
  CODE
  PUSHERRORS()
  IF SELF.SavePreviousBuffer AND NOT(SELF.PreviousBuffer &= NULL)
     Buffer = SELF.PreviousBuffer
  END
  Activiteit{PROP:ServerAutoInc}
  Activiteit{PROP:ServerAutoInc,1}=1 !ACT:ActiviteitID
  ReturnValue = PARENT.PreInsert(OpCode,AddLen,ErrCode,ErrMsg)
  POPERRORS()
  RETURN ReturnValue


Hide:Access:Activiteit.PrimeFields PROCEDURE

  CODE
  ACT:Uitgevoerd = 0                                       ! Assign initial field value
  PARENT.PrimeFields


Hide:Access:Activiteit.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

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
    SELF.Init(Activiteit,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(ACT:PK_Activiteit,'ACT:PK_Activiteit',0)
    SELF.AddKey(ACT:FK1_Activiteit,'ACT:FK1_Activiteit',0)
    SELF.AddKey(ACT:FK2_Activiteit,'ACT:FK2_Activiteit',0)
    SELF.AddKey(ACT:FK3_Activiteit,'ACT:FK3_Activiteit',0)
    SELF.AddKey(ACT:FK4_Activiteit,'ACT:FK4_Activiteit',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  IF SELF.File{prop:sqldriver} THEN SELF.create = 0.          ! ABCDefaults
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:Activiteit.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:Planning)

  SELF.AddRelation(Relate:AAPlanning)

  SELF.AddRelation(Relate:APlanning)

  SELF.AddRelation(Relate:AAPlanningVerkoop,RI:None,RI:None,AAPla3:PlanningID_K)
  SELF.AddRelationLink(ACT:PlanningID,AAPla3:PlanningID)


Hide:Relate:Activiteit.Kill PROCEDURE

  CODE
  _Hide:Access:Activiteit.Kill                             ! Kill the file manager
  PARENT.Kill
  Relate:Activiteit &= NULL                                ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:Activiteit)                         ! destroy the file manager


Hide:Relate:PalletBladSjabloon.Init PROCEDURE()
  CODE
  _Hide:Access:PalletBladSjabloon.Init
  SELF.Init(Access:PalletBladSjabloon,1)


Hide:Access:PalletBladSjabloon.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= PBS:Record
  SELF.FileNameValue = 'PalletBladSjabloon'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= PalletBladSjabloon
  PARENT.Init
  Access:PalletBladSjabloon &= SELF
  SELF.LazyOpen = False
  SELF.DoNotAssertOnCloseMisuse = 1  ! ABCDefaults
   IF SELF.File{prop:sqldriver} THEN SELF.create = 0.         ! ABCDefaults


Hide:Access:PalletBladSjabloon.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:PalletBladSjabloon &= NULL                        ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:PalletBladSjabloon.PreInsert PROCEDURE(SIGNED OpCode,UNSIGNED AddLen,*CSTRING ErrCode,*CSTRING ErrMsg)

ReturnValue          BYTE,AUTO

Buffer LIKE(PBS:RECORD)
  CODE
  PUSHERRORS()
  IF SELF.SavePreviousBuffer AND NOT(SELF.PreviousBuffer &= NULL)
     Buffer = SELF.PreviousBuffer
  END
  PalletBladSjabloon{PROP:ServerAutoInc}
  PalletBladSjabloon{PROP:ServerAutoInc,1}=1 !PBS:PalletBladSjabloonID
  ReturnValue = PARENT.PreInsert(OpCode,AddLen,ErrCode,ErrMsg)
  POPERRORS()
  RETURN ReturnValue


Hide:Access:PalletBladSjabloon.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

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
    SELF.Init(PalletBladSjabloon,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(PBS:PK_PalletBladSjabloon,'PBS:PK_PalletBladSjabloon',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  IF SELF.File{prop:sqldriver} THEN SELF.create = 0.          ! ABCDefaults
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:PalletBladSjabloon.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:PalletBladSjabloonCountry,RI:None,RI:None,PBSC:FK1_PalletBladSjabloonCountry)
  SELF.AddRelationLink(PBS:PalletBladSjabloonID,PBSC:PalletBladSjabloonID)


Hide:Relate:PalletBladSjabloon.Kill PROCEDURE

  CODE
  _Hide:Access:PalletBladSjabloon.Kill                     ! Kill the file manager
  PARENT.Kill
  Relate:PalletBladSjabloon &= NULL                        ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:PalletBladSjabloon)                 ! destroy the file manager


Hide:Relate:PalletBladSjabloonCountry.Init PROCEDURE()
  CODE
  _Hide:Access:PalletBladSjabloonCountry.Init
  SELF.Init(Access:PalletBladSjabloonCountry,1)


Hide:Access:PalletBladSjabloonCountry.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= PBSC:Record
  SELF.FileNameValue = 'PalletBladSjabloonCountry'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= PalletBladSjabloonCountry
  PARENT.Init
  Access:PalletBladSjabloonCountry &= SELF
  SELF.LazyOpen = False
  SELF.DoNotAssertOnCloseMisuse = 1  ! ABCDefaults
   IF SELF.File{prop:sqldriver} THEN SELF.create = 0.         ! ABCDefaults


Hide:Access:PalletBladSjabloonCountry.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:PalletBladSjabloonCountry &= NULL                 ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:PalletBladSjabloonCountry.PreInsert PROCEDURE(SIGNED OpCode,UNSIGNED AddLen,*CSTRING ErrCode,*CSTRING ErrMsg)

ReturnValue          BYTE,AUTO

Buffer LIKE(PBSC:RECORD)
  CODE
  PUSHERRORS()
  IF SELF.SavePreviousBuffer AND NOT(SELF.PreviousBuffer &= NULL)
     Buffer = SELF.PreviousBuffer
  END
  PalletBladSjabloonCountry{PROP:ServerAutoInc}
  PalletBladSjabloonCountry{PROP:ServerAutoInc,1}=1 !PBSC:PalletBladSjabloonCountryID
  ReturnValue = PARENT.PreInsert(OpCode,AddLen,ErrCode,ErrMsg)
  POPERRORS()
  RETURN ReturnValue


Hide:Access:PalletBladSjabloonCountry.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

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
    SELF.Init(PalletBladSjabloonCountry,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(PBSC:PK_PalletBladSjabloonCountry,'PBSC:PK_PalletBladSjabloonCountry',0)
    SELF.AddKey(PBSC:FK1_PalletBladSjabloonCountry,'PBSC:FK1_PalletBladSjabloonCountry',0)
    SELF.AddKey(PBSC:FK2_PalletBladSjabloonCountry,'PBSC:FK2_PalletBladSjabloonCountry',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  IF SELF.File{prop:sqldriver} THEN SELF.create = 0.          ! ABCDefaults
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:PalletBladSjabloonCountry.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:PalletBladSjabloon)


Hide:Relate:PalletBladSjabloonCountry.Kill PROCEDURE

  CODE
  _Hide:Access:PalletBladSjabloonCountry.Kill              ! Kill the file manager
  PARENT.Kill
  Relate:PalletBladSjabloonCountry &= NULL                 ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:PalletBladSjabloonCountry)          ! destroy the file manager


Hide:Relate:RelatieArtikelOmschrijving.Init PROCEDURE()
  CODE
  _Hide:Access:RelatieArtikelOmschrijving.Init
  SELF.Init(Access:RelatieArtikelOmschrijving,1)


Hide:Access:RelatieArtikelOmschrijving.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= RAO:Record
  SELF.FileNameValue = 'RelatieArtikelOmschrijving'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= RelatieArtikelOmschrijving
  PARENT.Init
  Access:RelatieArtikelOmschrijving &= SELF
  SELF.LazyOpen = False
  SELF.DoNotAssertOnCloseMisuse = 1  ! ABCDefaults
   IF SELF.File{prop:sqldriver} THEN SELF.create = 0.         ! ABCDefaults


Hide:Access:RelatieArtikelOmschrijving.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:RelatieArtikelOmschrijving &= NULL                ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:RelatieArtikelOmschrijving.PreInsert PROCEDURE(SIGNED OpCode,UNSIGNED AddLen,*CSTRING ErrCode,*CSTRING ErrMsg)

ReturnValue          BYTE,AUTO

Buffer LIKE(RAO:RECORD)
  CODE
  PUSHERRORS()
  IF SELF.SavePreviousBuffer AND NOT(SELF.PreviousBuffer &= NULL)
     Buffer = SELF.PreviousBuffer
  END
  RelatieArtikelOmschrijving{PROP:ServerAutoInc}
  RelatieArtikelOmschrijving{PROP:ServerAutoInc,1}=1 !RAO:RelatieArtikelOmschrijvingID
  ReturnValue = PARENT.PreInsert(OpCode,AddLen,ErrCode,ErrMsg)
  POPERRORS()
  RETURN ReturnValue


Hide:Access:RelatieArtikelOmschrijving.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

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
    SELF.Init(RelatieArtikelOmschrijving,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(RAO:PK_RelatieArtikelOmschrijving,'RAO:PK_RelatieArtikelOmschrijving',0)
    SELF.AddKey(RAO:FK1_RelatieArtikelOmschrijving,'RAO:FK1_RelatieArtikelOmschrijving',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  IF SELF.File{prop:sqldriver} THEN SELF.create = 0.          ! ABCDefaults
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Access:RelatieArtikelOmschrijving.ValidateFieldServer PROCEDURE(UNSIGNED Id,BYTE HandleErrors)

ReturnValue          BYTE,AUTO

Save:ViewArtikel3  USHORT,AUTO
  CODE
  ReturnValue = PARENT.ValidateFieldServer(Id,HandleErrors)
  CASE Id
  OF 3
    GlobalErrors.SetField('RAO:ArtikelID')
    Save:ViewArtikel3 = Access:ViewArtikel.SaveFile()
    Art:ArtikelID = RAO:ArtikelID
    ReturnValue = Access:ViewArtikel.TryFetch(Art:Artikel_PK)
    IF ReturnValue <> Level:Benign
      IF HandleErrors                                      ! Display message if handling errors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldNotInFile,'ViewArtikel')
      END
    END
    Access:ViewArtikel.RestoreFile(Save:ViewArtikel3)
  END
  RETURN ReturnValue


Hide:Relate:RelatieArtikelOmschrijving.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:Relatie)

  SELF.AddRelation(Relate:ViewArtikel,RI:None,RI:None,Art:Artikel_PK)
  SELF.AddRelationLink(RAO:ArtikelID,Art:ArtikelID)


Hide:Relate:RelatieArtikelOmschrijving.Kill PROCEDURE

  CODE
  _Hide:Access:RelatieArtikelOmschrijving.Kill             ! Kill the file manager
  PARENT.Kill
  Relate:RelatieArtikelOmschrijving &= NULL                ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:RelatieArtikelOmschrijving)         ! destroy the file manager


Hide:Relate:Pallet.Init PROCEDURE()
  CODE
  _Hide:Access:Pallet.Init
  SELF.Init(Access:Pallet,1)


Hide:Access:Pallet.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= PLL:Record
  SELF.FileNameValue = 'Pallet'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= Pallet
  PARENT.Init
  Access:Pallet &= SELF
  SELF.LazyOpen = False
  SELF.DoNotAssertOnCloseMisuse = 1  ! ABCDefaults
   IF SELF.File{prop:sqldriver} THEN SELF.create = 0.         ! ABCDefaults


Hide:Access:Pallet.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:Pallet &= NULL                                    ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:Pallet.PreInsert PROCEDURE(SIGNED OpCode,UNSIGNED AddLen,*CSTRING ErrCode,*CSTRING ErrMsg)

ReturnValue          BYTE,AUTO

Buffer LIKE(PLL:RECORD)
  CODE
  PUSHERRORS()
  IF SELF.SavePreviousBuffer AND NOT(SELF.PreviousBuffer &= NULL)
     Buffer = SELF.PreviousBuffer
  END
  Pallet{PROP:ServerAutoInc}
  Pallet{PROP:ServerAutoInc,1}=1 !PLL:PalletID
  ReturnValue = PARENT.PreInsert(OpCode,AddLen,ErrCode,ErrMsg)
  POPERRORS()
  RETURN ReturnValue


Hide:Access:Pallet.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

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
    SELF.Init(Pallet,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(PLL:PK_Pallet,'PLL:PK_Pallet',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  IF SELF.File{prop:sqldriver} THEN SELF.create = 0.          ! ABCDefaults
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:Pallet.Kill PROCEDURE

  CODE
  _Hide:Access:Pallet.Kill                                 ! Kill the file manager
  PARENT.Kill
  Relate:Pallet &= NULL                                    ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:Pallet)                             ! destroy the file manager


Hide:Relate:KostenStamgeg.Init PROCEDURE()
  CODE
  _Hide:Access:KostenStamgeg.Init
  SELF.Init(Access:KostenStamgeg,1)


Hide:Access:KostenStamgeg.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= Kos:Record
  SELF.FileNameValue = 'KostenStamgeg'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= KostenStamgeg
  PARENT.Init
  Access:KostenStamgeg &= SELF
  SELF.LazyOpen = False
  SELF.DoNotAssertOnCloseMisuse = 1  ! ABCDefaults
   IF SELF.File{prop:sqldriver} THEN SELF.create = 0.         ! ABCDefaults


Hide:Access:KostenStamgeg.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:KostenStamgeg &= NULL                             ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:KostenStamgeg.PreInsert PROCEDURE(SIGNED OpCode,UNSIGNED AddLen,*CSTRING ErrCode,*CSTRING ErrMsg)

ReturnValue          BYTE,AUTO

Buffer LIKE(Kos:RECORD)
  CODE
  PUSHERRORS()
  IF SELF.SavePreviousBuffer AND NOT(SELF.PreviousBuffer &= NULL)
     Buffer = SELF.PreviousBuffer
  END
  KostenStamgeg{PROP:ServerAutoInc}
  KostenStamgeg{PROP:ServerAutoInc,1}=1 !Kos:KostenID
  ReturnValue = PARENT.PreInsert(OpCode,AddLen,ErrCode,ErrMsg)
  POPERRORS()
  RETURN ReturnValue


Hide:Access:KostenStamgeg.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(KostenStamgeg,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(Kos:PK_KostenStamgeg,'Kos:PK_KostenStamgeg',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  IF SELF.File{prop:sqldriver} THEN SELF.create = 0.          ! ABCDefaults
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:KostenStamgeg.Kill PROCEDURE

  CODE
  _Hide:Access:KostenStamgeg.Kill                          ! Kill the file manager
  PARENT.Kill
  Relate:KostenStamgeg &= NULL                             ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:KostenStamgeg)                      ! destroy the file manager


Hide:Relate:ExtraKosten.Init PROCEDURE()
  CODE
  _Hide:Access:ExtraKosten.Init
  SELF.Init(Access:ExtraKosten,1)


Hide:Access:ExtraKosten.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= Ext:Record
  SELF.FileNameValue = 'ExtraKosten'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= ExtraKosten
  PARENT.Init
  Access:ExtraKosten &= SELF
  SELF.LazyOpen = False
  SELF.DoNotAssertOnCloseMisuse = 1  ! ABCDefaults
   IF SELF.File{prop:sqldriver} THEN SELF.create = 0.         ! ABCDefaults


Hide:Access:ExtraKosten.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:ExtraKosten &= NULL                               ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:ExtraKosten.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(ExtraKosten,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(Ext:PK_ExtraKosten,'Op ExtraKostenID',0)
    SELF.AddKey(Ext:FK1_ExtraKosten,'Op VerkoopID',0)
    SELF.AddKey(Ext:FK2_ExtraKosten,'Op InkoopID',0)
    SELF.AddKey(Ext:FK3_ExtraKosten,'Op PlanningID',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  IF SELF.File{prop:sqldriver} THEN SELF.create = 0.          ! ABCDefaults
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:ExtraKosten.Kill PROCEDURE

  CODE
  _Hide:Access:ExtraKosten.Kill                            ! Kill the file manager
  PARENT.Kill
  Relate:ExtraKosten &= NULL                               ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:ExtraKosten)                        ! destroy the file manager


Hide:Relate:ViewBetcd.Init PROCEDURE()
  CODE
  _Hide:Access:ViewBetcd.Init
  SELF.Init(Access:ViewBetcd,1)


Hide:Access:ViewBetcd.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= BTC:Record
  SELF.FileNameValue = 'ViewBetcd'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= ViewBetcd
  PARENT.Init
  Access:ViewBetcd &= SELF
  SELF.LazyOpen = False
  SELF.DoNotAssertOnCloseMisuse = 1  ! ABCDefaults
   IF SELF.File{prop:sqldriver} THEN SELF.create = 0.         ! ABCDefaults


Hide:Access:ViewBetcd.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:ViewBetcd &= NULL                                 ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:ViewBetcd.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(ViewBetcd,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(BTC:ViewBetcd_PK,'Op betcdID',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  IF SELF.File{prop:sqldriver} THEN SELF.create = 0.          ! ABCDefaults
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:ViewBetcd.Kill PROCEDURE

  CODE
  _Hide:Access:ViewBetcd.Kill                              ! Kill the file manager
  PARENT.Kill
  Relate:ViewBetcd &= NULL                                 ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:ViewBetcd)                          ! destroy the file manager


Hide:Relate:DeliveryTerms.Init PROCEDURE()
  CODE
  _Hide:Access:DeliveryTerms.Init
  SELF.Init(Access:DeliveryTerms,1)


Hide:Access:DeliveryTerms.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= DLT:Record
  SELF.FileNameValue = 'DeliveryTerms'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= DeliveryTerms
  PARENT.Init
  Access:DeliveryTerms &= SELF
  SELF.LazyOpen = False
  SELF.DoNotAssertOnCloseMisuse = 1  ! ABCDefaults
   IF SELF.File{prop:sqldriver} THEN SELF.create = 0.         ! ABCDefaults


Hide:Access:DeliveryTerms.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:DeliveryTerms &= NULL                             ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:DeliveryTerms.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(DeliveryTerms,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(DLT:PK_DeliveryTerms,'DLT:PK_DeliveryTerms',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  IF SELF.File{prop:sqldriver} THEN SELF.create = 0.          ! ABCDefaults
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:DeliveryTerms.Kill PROCEDURE

  CODE
  _Hide:Access:DeliveryTerms.Kill                          ! Kill the file manager
  PARENT.Kill
  Relate:DeliveryTerms &= NULL                             ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:DeliveryTerms)                      ! destroy the file manager


Hide:Relate:ISOCountries.Init PROCEDURE()
  CODE
  _Hide:Access:ISOCountries.Init
  SELF.Init(Access:ISOCountries,1)


Hide:Access:ISOCountries.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= ISO:Record
  SELF.FileNameValue = 'ISOCountries'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= ISOCountries
  PARENT.Init
  Access:ISOCountries &= SELF
  SELF.LazyOpen = False
  SELF.DoNotAssertOnCloseMisuse = 1  ! ABCDefaults
   IF SELF.File{prop:sqldriver} THEN SELF.create = 0.         ! ABCDefaults


Hide:Access:ISOCountries.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:ISOCountries &= NULL                              ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:ISOCountries.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(ISOCountries,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(ISO:PK_ISOCountries,'ISO:PK_ISOCountries',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  IF SELF.File{prop:sqldriver} THEN SELF.create = 0.          ! ABCDefaults
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:ISOCountries.Kill PROCEDURE

  CODE
  _Hide:Access:ISOCountries.Kill                           ! Kill the file manager
  PARENT.Kill
  Relate:ISOCountries &= NULL                              ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:ISOCountries)                       ! destroy the file manager


Hide:Relate:SSOPCategorie.Init PROCEDURE()
  CODE
  _Hide:Access:SSOPCategorie.Init
  SELF.Init(Access:SSOPCategorie,1)


Hide:Access:SSOPCategorie.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= SCat:Record
  SELF.FileNameValue = 'SSOPCategorie'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= SSOPCategorie
  PARENT.Init
  Access:SSOPCategorie &= SELF
  SELF.LazyOpen = False
  SELF.DoNotAssertOnCloseMisuse = 1  ! ABCDefaults
   IF SELF.File{prop:sqldriver} THEN SELF.create = 0.         ! ABCDefaults


Hide:Access:SSOPCategorie.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:SSOPCategorie &= NULL                             ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:SSOPCategorie.PreInsert PROCEDURE(SIGNED OpCode,UNSIGNED AddLen,*CSTRING ErrCode,*CSTRING ErrMsg)

ReturnValue          BYTE,AUTO

Buffer LIKE(SCat:RECORD)
  CODE
  PUSHERRORS()
  IF SELF.SavePreviousBuffer AND NOT(SELF.PreviousBuffer &= NULL)
     Buffer = SELF.PreviousBuffer
  END
  SSOPCategorie{PROP:ServerAutoInc}
  SSOPCategorie{PROP:ServerAutoInc,1}=1 !SCat:CategorieID
  ReturnValue = PARENT.PreInsert(OpCode,AddLen,ErrCode,ErrMsg)
  POPERRORS()
  RETURN ReturnValue


Hide:Access:SSOPCategorie.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(SSOPCategorie,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(SCat:SSOPCategorie_PK,'SCat:SSOPCategorie_PK',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  IF SELF.File{prop:sqldriver} THEN SELF.create = 0.          ! ABCDefaults
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:SSOPCategorie.Kill PROCEDURE

  CODE
  _Hide:Access:SSOPCategorie.Kill                          ! Kill the file manager
  PARENT.Kill
  Relate:SSOPCategorie &= NULL                             ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:SSOPCategorie)                      ! destroy the file manager


Hide:Relate:SSOPObject.Init PROCEDURE()
  CODE
  _Hide:Access:SSOPObject.Init
  SELF.Init(Access:SSOPObject,1)


Hide:Access:SSOPObject.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= SObj:Record
  SELF.FileNameValue = 'SSOPObject'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= SSOPObject
  PARENT.Init
  Access:SSOPObject &= SELF
  SELF.LazyOpen = False
  SELF.DoNotAssertOnCloseMisuse = 1  ! ABCDefaults
   IF SELF.File{prop:sqldriver} THEN SELF.create = 0.         ! ABCDefaults


Hide:Access:SSOPObject.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:SSOPObject &= NULL                                ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:SSOPObject.PreInsert PROCEDURE(SIGNED OpCode,UNSIGNED AddLen,*CSTRING ErrCode,*CSTRING ErrMsg)

ReturnValue          BYTE,AUTO

Buffer LIKE(SObj:RECORD)
  CODE
  PUSHERRORS()
  IF SELF.SavePreviousBuffer AND NOT(SELF.PreviousBuffer &= NULL)
     Buffer = SELF.PreviousBuffer
  END
  SSOPObject{PROP:ServerAutoInc}
  SSOPObject{PROP:ServerAutoInc,1}=1 !SObj:ObjID
  ReturnValue = PARENT.PreInsert(OpCode,AddLen,ErrCode,ErrMsg)
  POPERRORS()
  RETURN ReturnValue


Hide:Access:SSOPObject.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(SSOPObject,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(SObj:SSOPObject_PK,'SObj:SSOPObject_PK',0)
    SELF.AddKey(SObj:SSOPObject_FK1,'SObj:SSOPObject_FK1',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  IF SELF.File{prop:sqldriver} THEN SELF.create = 0.          ! ABCDefaults
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:SSOPObject.Kill PROCEDURE

  CODE
  _Hide:Access:SSOPObject.Kill                             ! Kill the file manager
  PARENT.Kill
  Relate:SSOPObject &= NULL                                ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:SSOPObject)                         ! destroy the file manager


Hide:Relate:SSOPRegistratie.Init PROCEDURE()
  CODE
  _Hide:Access:SSOPRegistratie.Init
  SELF.Init(Access:SSOPRegistratie,1)


Hide:Access:SSOPRegistratie.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= SReg:Record
  SELF.FileNameValue = 'SSOPRegistratie'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= SSOPRegistratie
  PARENT.Init
  Access:SSOPRegistratie &= SELF
  SELF.LazyOpen = False
  SELF.DoNotAssertOnCloseMisuse = 1  ! ABCDefaults
   IF SELF.File{prop:sqldriver} THEN SELF.create = 0.         ! ABCDefaults


Hide:Access:SSOPRegistratie.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:SSOPRegistratie &= NULL                           ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:SSOPRegistratie.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(SSOPRegistratie,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(SReg:SSOPRegistratie_PK,'SReg:SSOPRegistratie_PK',0)
    SELF.AddKey(SReg:SSOPRegistratie_FK1,'SReg:SSOPRegistratie_FK1',0)
    SELF.AddKey(SReg:SSOPRegistratie_FK2,'SReg:SSOPRegistratie_FK2',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  IF SELF.File{prop:sqldriver} THEN SELF.create = 0.          ! ABCDefaults
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Access:SSOPRegistratie.ValidateFieldServer PROCEDURE(UNSIGNED Id,BYTE HandleErrors)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.ValidateFieldServer(Id,HandleErrors)
  CASE Id
  OF 7
    GlobalErrors.SetField('SReg:Resultaat')
    IF INSTRING(']' & CLIP(SReg:Resultaat) & '[', ']V[]O[]X[', 1, 1) = 0
      ReturnValue = Level:Notify
    END
    IF ReturnValue <> Level:Benign
      IF HandleErrors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldNotInList,'''Voldoende'',''Onvoldoende'',''Niet van Toepassing''')
      END
    END
  END
  RETURN ReturnValue


Hide:Relate:SSOPRegistratie.Kill PROCEDURE

  CODE
  _Hide:Access:SSOPRegistratie.Kill                        ! Kill the file manager
  PARENT.Kill
  Relate:SSOPRegistratie &= NULL                           ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:SSOPRegistratie)                    ! destroy the file manager


Hide:Relate:SSOPTijd.Init PROCEDURE()
  CODE
  _Hide:Access:SSOPTijd.Init
  SELF.Init(Access:SSOPTijd,1)


Hide:Access:SSOPTijd.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= STijd:Record
  SELF.FileNameValue = 'SSOPTijd'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= SSOPTijd
  PARENT.Init
  Access:SSOPTijd &= SELF
  SELF.LazyOpen = False
  SELF.DoNotAssertOnCloseMisuse = 1  ! ABCDefaults
   IF SELF.File{prop:sqldriver} THEN SELF.create = 0.         ! ABCDefaults


Hide:Access:SSOPTijd.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:SSOPTijd &= NULL                                  ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:SSOPTijd.PreInsert PROCEDURE(SIGNED OpCode,UNSIGNED AddLen,*CSTRING ErrCode,*CSTRING ErrMsg)

ReturnValue          BYTE,AUTO

Buffer LIKE(STijd:RECORD)
  CODE
  PUSHERRORS()
  IF SELF.SavePreviousBuffer AND NOT(SELF.PreviousBuffer &= NULL)
     Buffer = SELF.PreviousBuffer
  END
  SSOPTijd{PROP:ServerAutoInc}
  SSOPTijd{PROP:ServerAutoInc,1}=1 !STijd:TijdID
  ReturnValue = PARENT.PreInsert(OpCode,AddLen,ErrCode,ErrMsg)
  POPERRORS()
  RETURN ReturnValue


Hide:Access:SSOPTijd.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(SSOPTijd,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(STijd:SSOPTijd_PK,'STijd:SSOPTijd_PK',0)
    SELF.AddKey(STijd:SSOPTijd_FK1,'STijd:SSOPTijd_FK1',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  IF SELF.File{prop:sqldriver} THEN SELF.create = 0.          ! ABCDefaults
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:SSOPTijd.Kill PROCEDURE

  CODE
  _Hide:Access:SSOPTijd.Kill                               ! Kill the file manager
  PARENT.Kill
  Relate:SSOPTijd &= NULL                                  ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:SSOPTijd)                           ! destroy the file manager


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
  SELF.DoNotAssertOnCloseMisuse = 1  ! ABCDefaults
   IF SELF.File{prop:sqldriver} THEN SELF.create = 0.         ! ABCDefaults


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
  IF SELF.File{prop:sqldriver} THEN SELF.create = 0.          ! ABCDefaults
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
  SELF.DoNotAssertOnCloseMisuse = 1  ! ABCDefaults
   IF SELF.File{prop:sqldriver} THEN SELF.create = 0.         ! ABCDefaults


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
  IF SELF.File{prop:sqldriver} THEN SELF.create = 0.          ! ABCDefaults
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

