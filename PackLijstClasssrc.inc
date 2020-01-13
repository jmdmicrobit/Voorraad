!--------------------------------------------------------------------
! APPLICATION:  VoorrDct.APP   
! PROCEDURE:    PackLijstClassSource
! INC file:     PackLijstClasssrc.inc
!--------------------------------------------------------------------

PackLijstClass.VulPackLijstQ        PROCEDURE(Long _verkoopID, *PackLijstQ _PackLijstQ)
CODE
    Access:Planning.Open()
    Access:Planning.UseFile()
    Clear(Pla:Record)
    Pla:VerkoopID=_verkoopID
    Set(Pla:Planning_FK02,Pla:Planning_FK02)
    Loop Until Access:Planning.Next()
        IF NOT Pla:VerkoopID=_verkoopID THEN BREAK.
        _PackLijstQ:ArtikelID=Pla:ArtikelID
        _PackLijstQ:VerkoopPrijs=Pla:VerkoopKGPrijs
        _PackLijstQ:VerpakkingID=Pla:VerpakkingID
        _PackLijstQ:PlantNumber=Pla:PlantNumber
        GET(_PackLijstQ,+_PackLijstQ:ArtikelID,+_PackLijstQ:VerkoopPrijs,+_PackLijstQ:VerpakkingID,+_PackLijstQ:PlantNumber)
        IF NOT ERROR()
            _PackLijstQ:KG+=CHOOSE(Pla:MutatieGemaakt, Pla:MutatieKG,Pla:Kg)
            _PackLijstQ:Bedrag+=CHOOSE(Pla:MutatieGemaakt, Pla:MutatieKG,Pla:Kg)*_PackLijstQ:VerkoopPrijs
            _PackLijstQ:Pallet+=CHOOSE(Pla:MutatieGemaakt, Pla:MutatiePallets,Pla:Pallets)
            _PackLijstQ:Dozen+=Pla:Dozen
            _PackLijstQ:GrossWeight+=Pla:GrossWeight
            IF _PackLijstQ:DozenPallets='Pallet'
                _PackLijstQ:Aantal+=Pla:Pallets
                _PackLijstQ:Aantal+=Pla:Dozen
            END
            Put(_PackLijstQ)
        ELSE    
            _PackLijstQ:ArtikelID=Pla:ArtikelID
            CLEAR(Art2:RECORD)
            Art2:ex_artcode='GB'
            Art2:artcode=Pla:ArtikelID
            IF Pla:AlternatieveArtikelOms<>''
                _PackLijstQ:ArtikelOms=Pla:AlternatieveArtikelOms
            ELSIF Access:ArtikelOmschrijvingExtra.Fetch(Art2:PK_ArtikelOmschrijvingExtra)=Level:Benign AND Art2:tekst<>''
                _PackLijstQ:ArtikelOms=Art2:tekst
            ELSE
                _PackLijstQ:ArtikelOms=Art:ArtikelOms
            END
            _PackLijstQ:VerkoopPrijs=Pla:VerkoopKGPrijs
            _PackLijstQ:VerpakkingID=Pla:VerpakkingID
            Clear(Ver:Record)
            Ver:VerpakkingID=Pla:VerpakkingID
            IF Access:Verpakking.Fetch(Ver:Verpakking_PK)=Level:Benign
                IF Ver:Description=''
                    _PackLijstQ:VerpakkingOmschrijving=Ver:VerpakkingOmschrijving
                ELSE
                    _PackLijstQ:VerpakkingOmschrijving=Ver:Description
                END
            END
            _PackLijstQ:KG=CHOOSE(Pla:MutatieGemaakt, Pla:MutatieKG,Pla:Kg)
            _PackLijstQ:Dozen=Pla:Dozen
            IF _PackLijstQ:Dozen=0
                _PackLijstQ:DozenPallets='Pallet'
                _PackLijstQ:Aantal=CHOOSE(Pla:MutatieGemaakt, Pla:MutatiePallets,Pla:Pallets)
            ELSE
                _PackLijstQ:DozenPallets='Cartons'
                _PackLijstQ:Aantal=Pla:Dozen
            END
            !Loc:DozenPallet=_PackLijstQ:DozenPallets
            _PackLijstQ:GrossWeight=Pla:GrossWeight
            _PackLijstQ:VerkoopPrijs=Pla:VerkoopKGPrijs
            _PackLijstQ:Bedrag=_PackLijstQ:KG*_PackLijstQ:VerkoopPrijs
            _PackLijstQ:Pallet=CHOOSE(Pla:MutatieGemaakt, Pla:MutatiePallets,Pla:Pallets)
            _PackLijstQ:PlantNumber=Pla:PlantNumber
            _PackLijstQ:ProductieDatum=Pla:UitslagPalletbladProductionDate11_DATE
            _PackLijstQ:THTDatum=Pla:UitslagPalletbladSellByDate15_DATE
            Clear(GNA:Record)
            GNA:ArtikelID=Pla:ArtikelID
            IF  Access:GNCodeArtikelen.Fetch(GNA:GNCodeArtikelen_FK1)=Level:Benign
                _PackLijstQ:GNCode=GNA:GNCode
                IF AREL:Country='ISLAS CANARIAS - ESPANA'
                    Clear(GNC:Record)
                    GNC:GNCode=GNA:GNCode
                    IF Access:GNCode.Fetch(GNC:GNCode_PK)=Level:Benign
                        _PackLijstQ:GNCode=GNC:GNCode_Can
                    END
                END
            ELSE
                _PackLijstQ:GNCode=''
            END
!            IF Loc:GNCodes=''
!                Loc:GNCodes=_PackLijstQ:GNCode
!            ELSIF NOT Instring(_PackLijstQ:GNCode,Loc:GNCodes,1,1)
!                Loc:GNCodes=CLIP(Loc:GNCodes)&', '&_PackLijstQ:GNCode
!            END
                
            ADD(_PackLijstQ,+_PackLijstQ:ArtikelID)
        END
        !Loc:TotaalBedrag+=CHOOSE(Pla:MutatieGemaakt, Pla:MutatieKG,Pla:KG)*Pla:VerkoopKGPrijs
        !Loc:TotaalKG+=CHOOSE(Pla:MutatieGemaakt, Pla:MutatieKG,Pla:KG)
        !IF Loc:DozenPallet='Pallet'
        !    Loc:TotaalDozen+=CHOOSE(Pla:MutatieGemaakt, Pla:MutatiePallets,Pla:Pallets)
        !ELSE
        !    Loc:TotaalDozen+=Pla:Dozen
        !END
        !Loc:TotaalGrossWeight+=Pla:GrossWeight
        
    END
    Access:Planning.Close()
    Return
