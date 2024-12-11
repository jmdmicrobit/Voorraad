!--------------------------------------------------------------------
! APPLICATION:  VoorrDct.APP   
! PROCEDURE:    CachingClassSource
! INC file:     CachingClassSrc.inc
!--------------------------------------------------------------------

!CachingClass.GetVerkoopArtikelen PROCEDURE(LONG PRM:VerkoopID, Long pCurrentTab, Long pKlantID)
!SQLFile                                 &File
!SQLGroup 								&GROUP
!SQLField                                ANY
!LastVerkoopID                           LONG
!Artikelen                               CSTRING(512)
!
!VerkoopFilter                            CString(512)
!CODE
!    IF RECORDS(VerkoopArtikelQueue) = 0 OR Self.CurrentVerkoopTab <> pCurrentTab OR Self.CurrentKlantID <> pKlantID
!        Execute pCurrentTab
!          VerkoopFilter = '(Select VerkoopID From Verkoop Where Verwerkt = 0 and Klant <>0)'
!          VerkoopFilter = '(Select VerkoopID From Verkoop Where Verwerkt = 0 and Klant <>0)'
!          VerkoopFilter = '(Select VerkoopID From Verkoop Where Verwerkt = 0 and Klant <>0 AND Planning > <39>1900-1-1<39>)'
!          VerkoopFilter = '(Select VerkoopID From Verkoop Where Verwerkt = 0 and Klant = '&pKlantID&')'
!          VerkoopFilter = '(Select VerkoopID From Verkoop Where Verwerkt = 1 and Klant <> 0 AND ISNULL(Exported,0) = 0) '
!          VerkoopFilter = '(Select VerkoopID From Verkoop Where Verwerkt = 1 and Klant = '&pKlantID&' AND ISNULL(Exported,0) = 0)'
!          VerkoopFilter = '(Select VerkoopID From Verkoop Where Exported = 1 and Klant <>0)'
!          VerkoopFilter = '(Select VerkoopID From Verkoop Where Exported = 1 and Klant = '&pKlantID&' )'
!        END
!        UD.Debug('CachingClass.GetVerkoopArtikelen('&PRM:VerkoopID&', '&pCurrentTab&', '&pKlantID&') VerkoopFilter:'&VerkoopFilter)
!        Self.CurrentVerkoopTab = pCurrentTab
!        Self.CurrentKlantID = pKlantID
!
!		SQLFile &= NEW(File)
!
!		SQLFile{Prop:Driver}='MSSQL'
!		SQLFile{Prop:DriverString}='/BUSYHANDLING=2'
!		SQLFile{Prop:Owner}=GLO:Owner
!		SQLFile{Prop:Sql}='SELECT Planning.VerkoopID, Planning.KG, Artikel_SyncExact.ArtikelOms, Planning.MutatieGemaakt, Planning.MutatieKG '&|
!			'FROM Planning INNER JOIN Artikel_SyncExact ON Artikel_SyncExact.ArtikelID = Planning.ArtikelID '&|
!			'WHERE Planning.VerkoopID in '&VerkoopFilter&| 
!			' ORDER BY Planning.VerkoopID, Planning.PlanningID'
!
!		LastVerkoopID = -1
!		LaatsteRecord# = 0
!		
!		FIXFORMAT(SQLFile)	
!		IF ERROR() THEN STOP(ERROR()&' bij de fixformat').
!		SQLGroup &= SQLFile{Prop:Record}
!		
!		LOOP
!			Next(SQLFile)
!			IF ERROR() THEN LaatsteRecord# = 1.
!			SQLField &= WHAT(SQLGroup,1)
!			IF (LastVerkoopID <> SQLField OR LaatsteRecord#) THEN
!				IF LastVerkoopID <> -1 THEN
!					VAQ:VerkoopID = LastVerkoopID
!					VAQ:Artikelen = Artikelen
!					ADD(VerkoopArtikelQueue, +VAQ:VerkoopID)
!				END
!				IF LaatsteRecord# THEN
!					BREAK
!				ELSE
!					LastVerkoopID = SQLField
!					
!					SQLField &= WHAT(SQLGroup,4) ! Pla:MutatieGemaakt
!					IF SQLField = 1 THEN
!						SQLField &= WHAT(SQLGroup,5)
!					ELSE
!						SQLField &= WHAT(SQLGroup,2)
!					END
!					Artikelen = CLIP(LEFT(FORMAT(SQLField,@n-12_`2))) & ' '& PQ:StandaardEenheid                !' kg'
!					SQLField &= WHAT(SQLGroup,3)
!					Artikelen = CLIP(Artikelen) & ' ' & CLIP(SQLField)
!				END
!			ELSE
!				SQLField &= WHAT(SQLGroup,4) ! Pla:MutatieGemaakt
!				IF SQLField = 1 THEN
!					SQLField &= WHAT(SQLGroup,5)
!				ELSE
!					SQLField &= WHAT(SQLGroup,2)
!				END
!				Artikelen = CLIP(Artikelen) & ' | ' & CLIP(LEFT(FORMAT(SQLField,@n-12_`2))) & ' '& PQ:StandaardEenheid ! ' kg'
!				SQLField &= WHAT(SQLGroup,3)
!				Artikelen = CLIP(Artikelen) & ' ' & CLIP(SQLField)
!			END
!		END	
!		
!		CLOSE(SQLFile)
!		!IF ERROR() THEN STOP(ERROR()&' bij de close').             ! als er geen records voldoen geef thij foutmelding op de close
!		DISPOSE(SQLFile)
!        IF ERROR() THEN STOP(ERROR()&' bij de dispose').
!        
!        GLO:TimingMeting[1] = CLOCK() - timingmeting#
!        GlobalClass.RefreshTiming()
!    END
!
!	VAQ:VerkoopID = PRM:VerkoopID
!	GET(VerkoopArtikelQueue, +VAQ:VerkoopID)
!	IF NOT(ERROR()) THEN
!		RETURN CLIP(VAQ:Artikelen)
!	ELSE
!		RETURN ''
!	END
!
!CachingClass.GetInkoopArtikelen     PROCEDURE(LONG PRM:InkoopID, Long pCurrentTab, Long pLeverancierID)
!
!SQLFILE                                 FILE,DRIVER('MSSQL','/TURBOSQL=True'),Pre(SBC),OWNER(GLO:OWNER)
!Record                                      RECORD,PRE()
!InkoopID                                        LONG
!KG                                              SREAL
!ArtikelOms                                      CSTRING(61)
!MutatieGemaakt                                  BYTE
!MutatieKG                                       SREAL
!                                            END
!                                        END
!
!LastInkoopID                            LONG
!Artikelen                               CSTRING(512)
!
!InkoopFilter                            CString(512)
!CODE
!    IF RECORDS(InkoopArtikelQueue) = 0 OR pCurrentTab <> Self.CurrentInkoopTab OR pLeverancierID<>Self.CurrentLeverancierID
!        UD.Debug('CachingClass.GetInkoopArtikelen RECORDS(InkoopArtikelQueue) = 0 pLeverancierID:'&pLeverancierID&' pCurrentTab'&pCurrentTab&' Self.CurrentInkoopTab:'&Self.CurrentInkoopTab)
!        ! Tab 1 Filter van de inkoop is Ink:Verwerkt = LOC:NietVerwerkt
!        ! Tab 2 Ink:Verwerkt = LOC:NietVerwerkt
!        ! Tab 3 Ink:Verwerkt = LOC:NietVerwerkt AND Ink:Planning_DATE > DATE(1,1,1900)
!        ! Tab 4 Ink:Verwerkt = LOC:NietVerwerkt AND Ink:Leverancier = Loc:Leverancier
!        ! Tab 5 Ink:Verwerkt = LOC:Verwerkt
!        ! Tab 6 Ink:Verwerkt = LOC:Verwerkt AND Ink:Leverancier = Loc:Leverancier2
!        Execute pCurrentTab
!          InkoopFilter = '(Select InkoopID From Inkoop Where Verwerkt = 0)'
!          InkoopFilter = '(Select InkoopID From Inkoop Where Verwerkt = 0)'
!          InkoopFilter = '(Select InkoopID From Inkoop Where Verwerkt = 0 AND Planning > <39>1900-1-1<39>)'
!          InkoopFilter = '(Select InkoopID From Inkoop Where Verwerkt = 0 AND Leverancier = '&pLeverancierID&')'
!          InkoopFilter = '(Select InkoopID From Inkoop Where Verwerkt = 1)'
!          InkoopFilter = '(Select InkoopID From Inkoop Where Verwerkt = 1 AND Leverancier = '&pLeverancierID&')'
!        END
!        
!        Self.CurrentInkoopTab = pCurrentTab
!        Self.CurrentLeverancierID = pLeverancierID
!        OPEN(SQLFILE)
!        IF UD.Error('Open')
!            Message('Fout bij openen SQFILE'&Error())
!        END
!        SQLFile{Prop:Sql}='SELECT Planning.InkoopID, Planning.KG, Artikel_SyncExact.ArtikelOms, Planning.MutatieGemaakt, Planning.MutatieKG '&|
!            'FROM Planning INNER JOIN Artikel_SyncExact ON Artikel_SyncExact.ArtikelID = Planning.ArtikelID '&|
!            'WHERE Planning.InkoopID in '&InkoopFilter&' '& |
!            'ORDER BY Planning.InkoopID, Planning.PlanningID'
!        IF UD.Error()
!            Message('Fout bij Execute SQLFILE:'&FileError(),'LocalClass.ProcessBetCD')
!        END
!        LastInkoopID = -1
!        LaatsteRecord# = 0
!        LOOP
!            Next(SQLFile)
!            IF ERROR() THEN LaatsteRecord# = 1.
!			
!            IF (LastInkoopID <> SBC:InkoopID OR LaatsteRecord#) THEN
!                IF LastInkoopID <> -1 THEN
!                    IAQ:InkoopID = LastInkoopID
!                    IAQ:Artikelen = Artikelen
!                    ADD(InkoopArtikelQueue, +IAQ:InkoopID)
!                END
!				
!                IF LaatsteRecord# THEN
!                    BREAK
!                ELSE
!                    LastInkoopID = SBC:InkoopID 
!                    IF SBC:MutatieGemaakt = 1 THEN
!                        Artikelen = CLIP(LEFT(FORMAT(SBC:MutatieKG,@n-12_`2))) & ' '&PQ:StandaardEenheid&' '& CLIP(SBC:ArtikelOms)
!                    ELSE
!                        Artikelen = CLIP(LEFT(FORMAT(SBC:KG,@n-12_`2))) & ' '&PQ:StandaardEenheid&' '& CLIP(SBC:ArtikelOms)
!                    END
!                END
!            ELSE
!                IF SBC:MutatieGemaakt = 1 THEN
!                    Artikelen = CLIP(Artikelen) & ' | ' & CLIP(LEFT(FORMAT(SBC:MutatieKG,@n-12_`2))) & ' '&PQ:StandaardEenheid&' '& CLIP(SBC:ArtikelOms)
!                ELSE
!                    Artikelen = CLIP(Artikelen) & ' | ' & CLIP(LEFT(FORMAT(SBC:KG,@n-12_`2))) & ' '&PQ:StandaardEenheid&' '& CLIP(SBC:ArtikelOms)
!                END
!            END
!        END	
!		
!        CLOSE(SQLFile)
!        IF ERROR() THEN STOP(ERROR()&' bij de close').
!        UD.Debug('CachingClass.GetInkoopArtikelen FILLED RECORDS('&RECORDS(InkoopArtikelQueue)&')')
!    END
!
!    IAQ:InkoopID = PRM:InkoopID
!    GET(InkoopArtikelQueue, +IAQ:InkoopID)
!    IF NOT(ERROR()) THEN
!        RETURN CLIP(IAQ:Artikelen)
!    ELSE
!        RETURN ''
!    END
!
!CachingClass.GetCelLocatieNaam PROCEDURE(LONG PRM:PartijID, LONG PRM:CelID)
!CODE
!    IF RECORDS(CelLocatieQueue)=0
!        !timingmeting# = CLOCK()
!        
!		BUFFER(ViewPartijCelLocaties,5000)
!		CLEAR(VPCL:Record)	
!		SET(VPCL:ViewPartijCelLocaties_PK,VPCL:ViewPartijCelLocaties_PK)
!		Loop Until Access:ViewPartijCelLocaties.Next()
!			CLQ:PartijID=VPCL:PartijID
!			CLQ:CelID=VPCL:CELID
!			GET(CelLocatieQueue,+CLQ:PartijID,+CLQ:CelID)
!			IF ERROR()
!				CLQ:PartijID=VPCL:PartijID
!				CLQ:CelID=VPCL:CELID
!				if CLIP(VPCL:CelLocatienaam) = ''
!					CLQ:LocatieNaam='?'
!				ELSE
!					CLQ:LocatieNaam=VPCL:CelLocatienaam 
!				END			
!				ADD(CelLocatieQueue,+CLQ:PartijID,+CLQ:CelID)
!			ELSE
!				if CLIP(VPCL:CelLocatienaam) = ''
!					! Controle of er een vraagteken in staat
!					IF INSTRING('?',CLIP(CLQ:LocatieNaam),1,1)=0 ! Not Found
!						CLQ:LocatieNaam = CLIP(CLQ:LocatieNaam) & ', ?' 
!					END	
!				ELSE
!					CLQ:LocatieNaam = CLIP(CLQ:LocatieNaam) & ', ' & CLIP(VPCL:CelLocatienaam)
!				END	
!				PUT(CelLocatieQueue)
!			END
!        END	
!        
!        FLUSH(ViewPartijCelLocaties)
!		
!		Loop i#=1 to Records(CelLocatieQueue)
!			GET(CelLocatieQueue,i#)
!			IF CLQ:LocatieNaam='?' THEN 
!				!Clear(CLQ:LocatieNaam)
!                CLQ:LocatieNaam = ''
!				PUT(CelLocatieQueue)
!			END
!        END	
!        
!        !GLO:TimingMeting[3] = CLOCK() - timingmeting#
!        !GlobalClass.RefreshTiming()
!	END
!
!	CLQ:PartijID=PRM:PartijID
!	CLQ:CelID=PRM:CELID
!	GET(CelLocatieQueue,+CLQ:PartijID,+CLQ:CelID)
!	IF ERROR()
!		Return('')
!	ELSE
!		Return(CLIP(CLQ:LocatieNaam))
!	END
