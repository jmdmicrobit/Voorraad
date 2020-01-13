!--------------------------------------------------------------------
! APPLICATION:  VoorrDct.APP   
! PROCEDURE:    GebruikerLogClassSource
! INC file:     GebruikerLogClassSrc.inc
!--------------------------------------------------------------------

GebruikerLogClass.Log       PROCEDURE(STRING PRM:Handeling, STRING PRM:Tabel, STRING PRM:RecordInhoudPre, <STRING PRM:RecordInhoudPost>)
CODE
    !db.Debugout('Voor Access:GebruikerLog.Open()')
	Access:GebruikerLog.Open()
    !db.Debugout('Na Access:GebruikerLog.Open()')
	
	CLEAR(LOG:Record)
	Log:WindowsInlog = IGB:WindowsInlog
	Log:Uitgevoerd_DATE = TODAY()
	Log:Uitgevoerd_TIME = CLOCK()
    Log:Handeling = PRM:Handeling
    IF CLIP(GLO:GebruikerLogHandelingOpmerking)=''
        Log:HandelingOpmerking = GlobalErrors.GetProcedureName()
    ELSE    
        Log:HandelingOpmerking = GLO:GebruikerLogHandelingOpmerking
    END    
	Log:Tabel = PRM:Tabel
	Log:RecordInhoudPre = PRM:RecordInhoudPre
	IF NOT(OMITTED(5))
		Log:RecordInhoudPost = PRM:RecordInhoudPost
	END
	
    !db.Debugout('Voor Access:GebruikerLog.Insert()')
	Access:GebruikerLog.Insert()
    !db.Debugout('Na Access:GebruikerLog.Insert()')
	Access:GebruikerLog.Close()
    !db.Debugout('Na Access:GebruikerLog.Close()')
	
	GLO:GebruikerLogHandelingOpmerking = ''
GebruikerLogClass.BepaalRecordContent  PROCEDURE(*GROUP RecordContent)
TempAny                                     ANY
FieldName                                   STRING(100)
CountFields                                 LONG
ReturnString                                STRING(5000)
Eerste										BYTE
CODE
	LOOP i# = 1000 TO 1 BY -1
		IF CLIP(WHO(RecordContent, i#)) <> '' THEN
			CountFields = i#
			BREAK
		END
	END
	
	Eerste = true
	
	LOOP i# = 1 TO CountFields
		FieldName = WHO(RecordContent, i#)
		TempAny &= WHAT(RecordContent, i#)
		
		IF Eerste THEN
			ReturnString = ''
			Eerste = false
		ELSE
			ReturnString = CLIP(ReturnString) & CHR(13) & CHR(10)
		END
		
		IF LEN(TempAny) > 0 THEN
			ReturnString = CLIP(ReturnString) & CLIP(FieldName) & '=' & SELF.CleanString(TempAny) &|
				'            , ' & FORMAT(SELF.CleanString(TempAny), @d6-) &|
				'            , ' & FORMAT(SELF.CleanString(TempAny), @t1) &|
				'            , ' & (VAL(SUB(TempAny, 1, 1)) - 48)
		ELSE
			ReturnString = CLIP(ReturnString) & CLIP(FieldName) & '=' & SELF.CleanString(TempAny) &|
				'            , ' & FORMAT(SELF.CleanString(TempAny), @d6-) &|
				'            , ' & FORMAT(SELF.CleanString(TempAny), @t1)
		END
	END
	
	RETURN CLIP(ReturnString)
GebruikerLogClass.CleanString       PROCEDURE(STRING PRM:String)
ReturnString                            STRING(5000)
SubString								STRING(1)
CODE
	IF LEN(PRM:String) > 1 THEN
		LOOP i# = 1 TO LEN(PRM:String)
			SubString = SUB(PRM:String,i#,1)
			IF (SubString <> CHR(10) AND SubString <> CHR(13) AND SubString <> CHR(7) AND SubString <> CHR(0))
				ReturnString = CLIP(ReturnString) & SubString
			END
		END
	
		RETURN CLIP(ReturnString)
	ELSE
		RETURN ''
	END
