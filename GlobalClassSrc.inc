!--------------------------------------------------------------------
! APPLICATION:  VoorrDct.APP   
! PROCEDURE:    GlobalClassSource
! INC file:     GlobalClassSrc.inc
!--------------------------------------------------------------------

GlobalClass.InitWordOle     Procedure
code
	db.DebugOut('GlobalClass.InitWordOle(1)')
	Loc:Ole  = Create(0,Create:Ole)
	db.DebugOut('GlobalClass.InitWordOle(2)')	
	Loc:Ole{Prop:Create}='Word.Application'
	db.DebugOut('GlobalClass.InitWordOle(3)')	
    Loc:Ole{Prop:ReportException}=False                   !  dwz fouten worden niet genegeerd

    Loc:Ole{Prop:DoVerb}=1                               !  dit doet iedereen dus ik ook
    Loc:Ole{'Application.WindowState'}=1                 !  maximaliseer scherm
	Loc:Ole{'Application.Visible'}=False  
	Loc:Ole{'Application.NormalTemplate.Saved'}=True ! Geen gezanik over NORMAL.DOT in use, Word denkt dat die NORMAL.DOT niet opgeslagen hoeft te worden
GlobalClass.OpenWord        Procedure(String Prm:Bestandsnaam)
    Code
    GLO:MyWordDoc = Loc:Ole{'Application.Documents.Open ("'&Prm:Bestandsnaam&'",,,,"")'}   !  Visual basic
GlobalClass.MaakWord        Procedure(String Prm:Sjabloon)
    Code
    IF Prm:Sjabloon=''
       GLO:MyWordDoc = Loc:Ole{'Application.Documents.Add'}   !  Visual basic
    Else
        Clear(SJA:Record)
        Sja:SjabloonID=Prm:Sjabloon
        Access:Sjabloon.Fetch(SJA:Sjabloon_pk)
       IF Not exists(SJA:Bestandsnaam)
          Message('We kunnen het sjabloon:|'&SJA:Bestandsnaam&'|niet vinden')
       End
       GLO:MyWordDoc = Loc:Ole{'Application.Documents.Add("'&SJA:Bestandsnaam&'")'}   !  Sjabloon opnemen
    End
GlobalClass.InitExcelOle     Procedure
    code
	Loc:Ole  = Create(0,Create:Ole)
    Loc:Ole{Prop:Create}='Excel.Application'
    Loc:Ole{Prop:ReportException}=False                   !  dwz fouten worden niet genegeerd

    Loc:Ole{Prop:DoVerb}=1                               !  dit doet iedereen dus ik ook
    Loc:Ole{'Application.WindowState'}=1                 !  maximaliseer scherm
    Loc:Ole{'Application.Visible'}=False ! nu pas excel laten zien
GlobalClass.OpenExcel       Procedure
    Code
	Loc:Ole{'Application.Workbooks.Open ("'&Loc:Bestandsnaam&'")'}           ! leeg worksheet openen
GlobalClass.MaakExcel       Procedure(String Prm:Sjabloon)
Loc:Bestaat	Byte
    Code
    IF PRM:Sjabloon=''
      Loc:Ole{'Application.Workbooks.Add'}            ! leeg worksheet openen
   !   Loc:Ole{'ActiveWorkbook.SaveAs("'&Loc:Bestandsnaam&'")'}
    Else
        Clear(SJA:Record)
        Sja:SjabloonID=PRM:Sjabloon
        Access:Sjabloon.Fetch(SJA:Sjabloon_pk)
       IF Not exists(SJA:Bestandsnaam)
          Message('We kunnen het sjabloon:|'&SJA:Bestandsnaam&'|niet vinden')
       End
       GLO:MyWordDoc = Loc:Ole{'Application.Workbooks.Add("'&SJA:Bestandsnaam&'")'}   !  Sjabloon opnemen
       Loc:Ole{'ActiveWorkbook.SaveAs("'&Loc:Bestandsnaam&'")'}
	End
GlobalClass.InitMailOle Procedure
Loc:Emailadressen       Cstring(10000)
    code
    Loc:Ole{Prop:Create}='Outlook.Application'
    Loc:Ole{Prop:DoVerb}=-4                              !  dit doet iedereen dus ik ook
    Loc:Ole{'Application.WindowState'}=1                 !  maximaliseer scherm
    Loc:Ole{'Application.Visible'}=False ! nu pas excel laten zien
    GLO:MyItem=Loc:Ole{'Application.CreateItem(0)'}

!    Loc:OLE{clip(GLO:MyItem) & '.subject'}=Clip(CON:Onderwerp)
!        Loc:OLE{clip(GLO:MyItem) & '.Body'}=Clip(CON:Log)
        Clear(Loc:Emailadressen)
!        if CON:Mail2Client=True And CLI:EMail<>''
!            Loc:Emailadressen=CLI:EMail
!        End
!     Clear(CONR:Record)
!     CONR:ContactID=CON:ContactID
!     Set(CONR:ContactRelaties_FK01,CONR:ContactRelaties_FK01)
!     Loop Until Access:ContactRelaties.Next()
!       If not CONR:ContactID=CON:ContactID Then Break.
!       ! relatie erbij halen
!       Clear(REL:Record)
!       REL:RelatieID=CONR:RelatieID
!       Access:Relatie.Fetch(REL:Relatie_PK)
!       Clear(CONP:Record)
!       CONP:ContactPersoonID=CONR:ContactpersoonID
!       Access:Contactpersoon.fetch(CONP:ContactPersoon_PK)
!       IF CONP:Email
!             if Loc:Emailadressen=''
!                Loc:Emailadressen=CONP:Email
!             Else
!                Loc:Emailadressen=Clip(Loc:Emailadressen)&';'&CONP:Email
!             End    
!        Elsif REL:EMail
!             if Loc:Emailadressen=''
!                Loc:Emailadressen=REL:EMail
!             Else
!                Loc:Emailadressen=Clip(Loc:Emailadressen)&';'&REL:EMail
!             End    
!        End
!     End   
!    Clear(REL:Record)
!    REL:RelatieID=CON:RelatieID
!    Access:Relatie.Fetch(REL:Relatie_PK)
!    Clear(CONP:Record)
!    CONP:ContactPersoonID=CON:ContactPersoonID
!    Access:ContactPersoon.Fetch(CONP:ContactPersoon_PK)
!    IF CONP:Email
!       ?OLE{clip(GLO:MyItem) & '.to'}=CONP:Email
!    Elsif REL:EMail
!       ?OLE{clip(GLO:MyItem) & '.to'}=REL:EMail
!    End
    Loc:OLE{clip(GLO:MyItem) & '.to'}=Loc:Emailadressen
    Loc:OLE{clip(GLO:MyItem) & '.Display'}

    GLO:MyItem{prop:release}
    GLO:MyItem{prop:deactivate}
    Loc:ole{prop:release}
    Loc:ole{prop:deactivate}
GlobalClass.DataSource      Procedure(String PRM:SoortData )
	CODE
		Case PRM:SoortData
		of 'Inkoop' 
		Return('naam;fax;username;product;planning;memo;instructie;transport')
		of 'Inkoopregel' 
		Return('naam;fax;username')
		of 'Verkoop' 
		Return('naam;fax;username;product;planning;memo;instructie;transport')
		of 'VerkoopMutaties' 
		Return('naam;adres1;adres2;postcodeplaats;land;fax;username;product;planning;memo;instructie;transport')
		of 'Verkoopregel' 
		Return('naam;fax;username')
		of 'Overboeking'
		Return('username;cel;partij;product;planning;memo;instructie;transport')
		ELSE
		Return('naam;fax;username')
		END
GlobalClass.RefreshTiming   Procedure()
StatusText CSTRING(1025)
CODE
    StatusText = ''
    LOOP i# = 1 TO 15
        IF i# = 4 THEN
            StatusText=StatusText &  '---------------/'
        ELSIF i# = 8 THEN
            StatusText=StatusText &  '---------------/'
        ELSIF i# = 11 THEN
            StatusText=StatusText &  '---------------/'
        ELSIF i# = 14 THEN
            StatusText=StatusText &  '---------------/'
        END
            
        IF i# = 15 THEN
            StatusText=StatusText &  i# & ': ' & CLIP(LEFT(FORMAT(GLO:TimingMeting[i#], @n_10))) & ' ms'
        ELSE
            StatusText=StatusText & i# & ': ' & CLIP(LEFT(FORMAT(GLO:TimingMeting[i#], @n_10))) & ' ms /'
        END
    END
    
    0{Prop:StatusText,4} = StatusText
GlobalClass.CMRArtikelOms Procedure(Long PRM:RelatieID, String PRM:ArtikelID)
CODE
    CLEAR(RAO:Record)
    RAO:RelatieID = PRM:RelatieID
    RAO:ArtikelID = PRM:ArtikelID
    IF Access:RelatieArtikelOmschrijving.Fetch(RAO:FK1_RelatieArtikelOmschrijving) = Level:Benign
        IF CLIP(RAO:RelatieArtikelID) = '' THEN
            RETURN CLIP(RAO:ArtikelOmschrijving)
        ELSE
            RETURN CLIP(RAO:RelatieArtikelID) & ' ' & CLIP(RAO:ArtikelOmschrijving)
        END            
    END

    CLEAR(ARel:Record)
    AREL:RelatieID = PRM:RelatieID
    IF Access:ARelatie.Fetch(AREL:Relatie_PK) = Level:Benign
        IF (CLIP(AREL:ItemCode)<> '')
            CLEAR(Art2:Record)
            Art2:ex_artcode=AREL:ItemCode
            Art2:artcode=PRM:ArtikelID
            IF (Access:ArtikelOmschrijvingExtra.Fetch(Art2:PK_ArtikelOmschrijvingExtra) = Level:Benign)
                RETURN CLIP(Art2:tekst)
            END
        END
    END

    CLEAR(AArt:Record)
    AArt:ArtikelID = PRM:ArtikelID
    IF Access:AViewArtikel.Fetch(AArt:Artikel_PK) = Level:Benign
        RETURN CLIP(AArt:ArtikelOms)
    END
    
    RETURN ''
