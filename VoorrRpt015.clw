

   MEMBER('VoorrRpt.clw')                                  ! This is a MEMBER module


   INCLUDE('ABDROPS.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('VOORRRPT015.INC'),ONCE        !Local module procedure declarations
                     END


!!! <summary>
!!! Generated from procedure template - Window
!!! </summary>
WindowCallSjabloonOUD PROCEDURE (PRM:SoortData,PRM:RelatieID)

Loc:TempFile         CSTRING(256)                          ! 
Loc:SjabloonID       CSTRING(20)                           ! 
Loc:TempSjabllonID   STRING(20)                            ! 
FDCB1::View:FileDropCombo VIEW(Sjabloon)
                       PROJECT(Sja:SjabloonID)
                       PROJECT(Sja:SoortData)
                     END
Queue:FileDropCombo  QUEUE                            !
Sja:SjabloonID         LIKE(Sja:SjabloonID)           !List box control field - type derived from field
Sja:SoortData          LIKE(Sja:SoortData)            !Browse hot field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
LocEnableEnterByTab  BYTE(1)                               !Used by the ENTER Instead of Tab template
EnterByTabManager    EnterByTabClass
Window               WINDOW('Call Sjabloon'),AT(,,230,65),FONT('MS Sans Serif',8),GRAY
                       PROMPT('Sjabloon:'),AT(13,12),USE(?PROMPT1)
                       COMBO(@s20),AT(61,10,163,13),USE(Loc:TempSjabllonID),DROP(5),FORMAT('76L(2)|M~Sjabloon ' & |
  'ID~L(0)@s19@'),FROM(Queue:FileDropCombo),IMM
                       BUTTON('&OK'),AT(130,46,41,14),USE(?OkButton),LEFT,ICON('WAOk.ico'),DEFAULT
                       BUTTON('&Cancel'),AT(179,46,47,14),USE(?CancelButton),LEFT,ICON('WACancel.ico'),STD(STD:Close)
                     END

    omit('***',WE::CantCloseNowSetHereDone=1)  !Getting Nested omit compile error, then uncheck the "Check for duplicate CantCloseNowSetHere variable declaration" in the WinEvent local template
WE::CantCloseNowSetHereDone equate(1)
WE::CantCloseNowSetHere     long
    !***
ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED
TakeEvent              PROCEDURE(),BYTE,PROC,DERIVED
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
FDCB1                CLASS(FileDropComboClass)             ! File drop combo manager
Q                      &Queue:FileDropCombo           !Reference to browse queue type
ValidateRecord         PROCEDURE(),BYTE,DERIVED
                     END

ExportClass         CLASS
Inkoop                  PROCEDURE(LONG)
Verkoop                 PROCEDURE(LONG)
VerkoopMutaties			PROCEDURE(LONG)
Overboeking				PROCEDURE(LONG)
					END
							

  CODE
  GlobalResponse = ThisWindow.Run()                        ! Opens the window and starts an Accept Loop

!---------------------------------------------------------------------------
DefineListboxStyle ROUTINE
!|
!| This routine create all the styles to be shared in this window
!| It`s called after the window open
!|
!---------------------------------------------------------------------------

ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('WindowCallSjabloonOUD')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?PROMPT1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
  Relate:AAACel.Open                                       ! File AAACel used by this procedure, so make sure it's RelationManager is open
  Relate:AACel.Open                                        ! File AACel used by this procedure, so make sure it's RelationManager is open
  Relate:Inkoop.SetOpenRelated()
  Relate:Inkoop.Open                                       ! File Inkoop used by this procedure, so make sure it's RelationManager is open
  Relate:Partij.Open                                       ! File Partij used by this procedure, so make sure it's RelationManager is open
  Relate:RelatieAdres.Open                                 ! File RelatieAdres used by this procedure, so make sure it's RelationManager is open
  Relate:Sjabloon.Open                                     ! File Sjabloon used by this procedure, so make sure it's RelationManager is open
  Relate:Verpakking.Open                                   ! File Verpakking used by this procedure, so make sure it's RelationManager is open
  Relate:ViewArtikel.Open                                  ! File ViewArtikel used by this procedure, so make sure it's RelationManager is open
  Access:Verkoop.UseFile                                   ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:Planning.UseFile                                  ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:Relatie.UseFile                                   ! File referenced in 'Other Files' so need to inform it's FileManager
  SELF.FilesOpened = True
  SELF.Open(Window)                                        ! Open window
  WinAlertMouseZoom()
  Do DefineListboxStyle
  INIMgr.Fetch('WindowCallSjabloonOUD',Window)             ! Restore window settings from non-volatile store
  FDCB1.Init(Loc:TempSjabllonID,?Loc:TempSjabllonID,Queue:FileDropCombo.ViewPosition,FDCB1::View:FileDropCombo,Queue:FileDropCombo,Relate:Sjabloon,ThisWindow,GlobalErrors,0,1,0)
  FDCB1.Q &= Queue:FileDropCombo
  FDCB1.AddSortOrder(Sja:Sjabloon_PK)
  FDCB1.AddField(Sja:SjabloonID,FDCB1.Q.Sja:SjabloonID) !List box control field - type derived from field
  FDCB1.AddField(Sja:SoortData,FDCB1.Q.Sja:SoortData) !Browse hot field - type derived from field
  FDCB1.AddUpdateField(Sja:SjabloonID,Loc:SjabloonID)
  ThisWindow.AddItem(FDCB1.WindowComponent)
  SELF.SetAlerts()
  EnterByTabManager.Init(False)
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:AAACel.Close
    Relate:AACel.Close
    Relate:Inkoop.Close
    Relate:Partij.Close
    Relate:RelatieAdres.Close
    Relate:Sjabloon.Close
    Relate:Verpakking.Close
    Relate:ViewArtikel.Close
  END
  IF SELF.Opened
    INIMgr.Update('WindowCallSjabloonOUD',Window)          ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.TakeAccepted PROCEDURE

ReturnValue          BYTE,AUTO

Looped BYTE
  CODE
  LOOP                                                     ! This method receive all EVENT:Accepted's
    IF Looped
      RETURN Level:Notify
    ELSE
      Looped = 1
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?OkButton
      ThisWindow.Update()
      	If Loc:SjabloonID
      		Clear(REL:Record)
      		!message(PRM:RelatieID)
      		IF PRM:SoortData<>'Overboeking'
      			REL:RelatieID=PRM:RelatieID
      			Access:Relatie.Fetch(Rel:Relatie_PK)
      		ELSE
      			CLEAR(Rel:Record)
      		.
      		Clear(Sja:Record)
      		Sja:SjabloonID = Loc:SjabloonID
      		Access:Sjabloon.Fetch(Sja:Sjabloon_PK)
      		CASE Sja:SoortSjabloon
      		of 'W'
      			GlobalClass.InitWordOle()
      			
      			GlobalClass.MaakWord(Loc:SjabloonID)
      		     Loc:tempFile=GETTEMPFILENAME('')
      			 if Loc:tempFile=''
      				Loc:tempFile='jmd.doc'
      			 Else
      				Loc:tempFile=SUB(Loc:tempFile,1,LEN(Clip(Loc:tempFile))-3)&'doc'
      			End
      				
      			!MESSAGE(Loc:tempFile)
      			
      			Loc:Ole{'ActiveDocument.MailMerge.CreateDataSource("'&Loc:tempFile&'",,,'&|
      			'"'&GlobalClass.DataSource(Clip(Sja:SoortData))&'" )'}  ! 1= wdOpenFormatDocument
      			Loc:Ole{'Application.Documents.Open("'&Loc:tempFile&'")'}   !
      			Loc:Ole{'Application.Visible'}=false 
      			Loc:Rij# = 2
      			Loc:Ole{'Application.Selection.Tables(1).Rows('&Loc:Rij#&').Select'}!
      			CASE PRM:SoortData
      			OF 	'Inkoop'
      				ExportClass.Inkoop(PRM:RelatieID)
      			OF 	'Verkoop'
      				ExportClass.Verkoop(PRM:RelatieID)
      			OF 'Overboeking'
      				db.DebugOut('ExportClass.Overboeking('&PRM:RelatieID&')')
      				ExportClass.Overboeking(PRM:RelatieID)
      			OF 'VerkoopMutaties'
      				ExportClass.VerkoopMutaties(PRM:RelatieID)
      			ELSE
      				Loc:Ole{'Application.Selection.TypeText("'&Rel:FirmaNaam&'")'} 
      			   Loc:Ole{'Application.Selection.MoveRight(12,1)'}   ! 12=wdCell
      				 Loc:Ole{'Application.Selection.TypeText("'&Rel:Fax&'")'} !
      			   Loc:Ole{'Application.Selection.MoveRight(12,1)'}   ! 12=wdCell
      				Loc:Ole{'Application.Selection.TypeText("'&GETUSERNAME()&'")'} !
      			.
      			
      		    !Loc:Ole{'ActiveDocument.SaveAs("'&Loc:tempFile&'", , , , , , , , , True, , , , , , )'} ! True = SaveFormsData
      		    Loc:Ole{'ActiveDocument.SaveAs("'&Loc:tempFile&'", , , , , , , , , , , , , , , )'} ! True = SaveFormsData
      			Loc:Ole{'ActiveDocument.Close'}           ! als test dan kan ik zien wat hij heeft gefdaan
      
      		 	Loc:Ole{GLO:MyWordDoc & '.MailMerge.Destination'}=0    ! wdSendToNewDocument=0
      			Loc:Ole{GLO:MyWordDoc & '.MailMerge.Execute'}
      			Loc:Ole{GLO:MyWordDoc&'.Close(0)'}      ! 0=wdDoNotSaveChanges
      			
      			Loc:WindowName = Loc:Ole{'ActiveDocument.Name'}&' - Microsoft Word'
      			Loc:Ole{'Application.Visible'}=true !
      
      			IF Exists(Loc:tempFile) Then Remove(Loc:tempFile).
      
      			Loc:HWND = FindWindow(0,Loc:WindowName)
      			If Loc:HWND<>0
      			   SetForegroundWindow(Loc:HWND)
      			End			 
      		of 'E'
      			GlobalClass.InitExcelOle
      			GlobalClass.MaakExcel(Loc:SjabloonID)
      			
      			Loc:Ole{'Application.Visible'}=true ! nu pas excel laten zien
      		ELSE
      			Message('Onbekende soort '&Sja:SoortSjabloon,,Icon:Hand)	
      		END
      	END
      		
      	Post(EVENT:CloseWindow)
    END
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue


ThisWindow.TakeEvent PROCEDURE

ReturnValue          BYTE,AUTO

Looped BYTE
  CODE
  LOOP                                                     ! This method receives all events
    IF Looped
      RETURN Level:Notify
    ELSE
      Looped = 1
    END
  IF EnterByTabManager.TakeEvent()
     RETURN(Level:Notify)
  END
  ReturnValue = PARENT.TakeEvent()
  if event() = event:VisibleOnDesktop
    ds_VisibleOnDesktop()
  end
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue


ThisWindow.TakeWindowEvent PROCEDURE

ReturnValue          BYTE,AUTO

Looped BYTE
  CODE
  LOOP                                                     ! This method receives all window specific events
    IF Looped
      RETURN Level:Notify
    ELSE
      Looped = 1
    END
    CASE EVENT()
    OF EVENT:CloseDown
      if WE::CantCloseNow
        WE::MustClose = 1
        cycle
      else
        self.CancelAction = cancel:cancel
        self.response = requestcancelled
      end
    END
  ReturnValue = PARENT.TakeWindowEvent()
    CASE EVENT()
    OF EVENT:OpenWindow
        post(event:visibleondesktop)
    END
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue

ExportClass.Inkoop  PROCEDURE(Long PRM:InkoopID)
Loc:Product				Cstring(1000)
Loc:Planning			Cstring(1000)
Loc:Memo				Cstring(1000)
Loc:Instructie			Cstring(1000)
Loc:Transport			Cstring(1000)
	CODE
		
		Clear(Ink:Record)
		Ink:InkoopID = PRM:InkoopID
		Access:Inkoop.Fetch(Ink:PK_Inkoop)
		
		Clear(Rel:Record)
		Rel:RelatieID = Ink:Leverancier
		Access:Relatie.Fetch(Rel:Relatie_PK)
		Loc:Ole{'Application.Selection.TypeText("'&Rel:FirmaNaam&'")'} 
	    Loc:Ole{'Application.Selection.MoveRight(12,1)'}   ! 12=wdCell
    	Loc:Ole{'Application.Selection.TypeText("'&Rel:Fax&'")'} !
	    Loc:Ole{'Application.Selection.MoveRight(12,1)'}   ! 12=wdCell
		Loc:Ole{'Application.Selection.TypeText("'&GETUSERNAME()&'")'} !

		Clear(Loc:Product)
		EXECUTE 1+(Ink:Planning_DATE%7)
			Loc:Planning = 'Zondag ' &Format(Ink:Planning_DATE,@d6-)
			Loc:Planning = 'Maandag ' &Format(Ink:Planning_DATE,@d6-)
			Loc:Planning = 'Dinsdag ' &Format(Ink:Planning_DATE,@d6-)
			Loc:Planning = 'Woensdag ' &Format(Ink:Planning_DATE,@d6-)
			Loc:Planning = 'Donderdag ' &Format(Ink:Planning_DATE,@d6-)
			Loc:Planning = 'Vrijdag ' &Format(Ink:Planning_DATE,@d6-)
			Loc:Planning = 'Zaterdag ' &Format(Ink:Planning_DATE,@d6-)
		END	
		Clear(Loc:Memo)
		Clear(Loc:Instructie)
		Clear(Loc:Transport)
		
		Clear(Pla:Record)
		Pla:InkoopID = Ink:InkoopID
		Set(Pla:Planning_FK01,Pla:Planning_FK01)
		Loop until Access:Planning.Next()
			If not Pla:InkoopID = Ink:InkoopID Then Break.
			Clear(Art:Record)
			Art:ArtikelID=Pla:ArtikelID
			Access:ViewArtikel.Fetch(Art:Artikel_PK)
			Clear(Ver:Record)
			Ver:VerpakkingID = Pla:VerpakkingID
			Access:Verpakking.Fetch(Ver:Verpakking_PK)
			if Loc:Product =''
				Loc:Product = LEFT(Format(Pla:KG,@n-13`2)&' '&Art:ArtikelOms&' '&Ver:VerpakkingOmschrijving)
			ELSE
				Loc:Product = Clip(Loc:Product)&'<13><10>'&LEFT(Format(Pla:KG,@n-13`2)&' '&Art:ArtikelOms&' '&Ver:VerpakkingOmschrijving)
			END
			If Loc:Memo=''
				Loc:Memo = Pla:Memo
			ELSE
				Loc:Memo = Loc:Memo&'<13><10>'&Pla:Memo
			END
			If Loc:Instructie=''
				Loc:Instructie = Pla:Instructie
			ELSE
				Loc:Instructie = Loc:Instructie&'<13><10>'&Pla:Instructie
			END
			IF CLIP(Loc:Transport)=''
				Loc:Transport = CLIP(Pla:Transport)
			ELSE
				! Geen twee transport instructies
				!Loc:Transport = Loc:Transport &'<13><10>'&Pla:Transport
			END
		END
		
		! product;planning;memo;instrctie
		   Loc:Ole{'Application.Selection.MoveRight(12,1)'}   ! 12=wdCell
		Loc:Ole{'Application.Selection.TypeText("'&Loc:Product&'")'} !
		   Loc:Ole{'Application.Selection.MoveRight(12,1)'}   ! 12=wdCell
		Loc:Ole{'Application.Selection.TypeText("'&Loc:Planning&'")'} !
		   Loc:Ole{'Application.Selection.MoveRight(12,1)'}   ! 12=wdCell
		Loc:Ole{'Application.Selection.TypeText("'&Loc:Memo&'")'} !
		   Loc:Ole{'Application.Selection.MoveRight(12,1)'}   ! 12=wdCell
		Loc:Ole{'Application.Selection.TypeText("'&Loc:Instructie&'")'} !
		   Loc:Ole{'Application.Selection.MoveRight(12,1)'}   ! 12=wdCell
		Loc:Ole{'Application.Selection.TypeText("'&Loc:Transport&'")'} !

		RETURN
		
ExportClass.Verkoop  PROCEDURE(Long PRM:InkoopID)
Loc:Product				Cstring(1000)
Loc:Planning			Cstring(1000)
Loc:Memo				Cstring(1000)
Loc:Instructie			Cstring(1000)
Loc:Transport			Cstring(1000)
	CODE
		
		Clear(Ver2:Record)
		Ver2:VerkoopID = PRM:InkoopID
		Access:Verkoop.Fetch(Ver2:PK_Verkoop)
		
		Clear(Rel:Record)
		Rel:RelatieID = Ver2:Klant
		Access:Relatie.Fetch(Rel:Relatie_PK)
		
		Loc:Ole{'Application.Selection.TypeText("'&Rel:FirmaNaam&'")'} 
	    Loc:Ole{'Application.Selection.MoveRight(12,1)'}   ! 12=wdCell
    	Loc:Ole{'Application.Selection.TypeText("'&Rel:Fax&'")'} !
	    Loc:Ole{'Application.Selection.MoveRight(12,1)'}   ! 12=wdCell
		Loc:Ole{'Application.Selection.TypeText("'&GETUSERNAME()&'")'} !

		Clear(Loc:Product)
		IF Ver2:Planning_DATE > 0 THEN
			EXECUTE 1+(Ver2:Planning_DATE%7)
				Loc:Planning = 'Zondag ' &Format(Ver2:Planning_DATE,@d6-)
				Loc:Planning = 'Maandag ' &Format(Ver2:Planning_DATE,@d6-)
				Loc:Planning = 'Dinsdag ' &Format(Ver2:Planning_DATE,@d6-)
				Loc:Planning = 'Woensdag ' &Format(Ver2:Planning_DATE,@d6-)
				Loc:Planning = 'Donderdag ' &Format(Ver2:Planning_DATE,@d6-)
				Loc:Planning = 'Vrijdag ' &Format(Ver2:Planning_DATE,@d6-)
				Loc:Planning = 'Zaterdag ' &Format(Ver2:Planning_DATE,@d6-)
			END	
		ELSE
			Loc:Planning = ''
		.
		
		Clear(Loc:Memo)
		Clear(Loc:Instructie)
		Clear(Loc:Transport)
		
		Clear(Pla:Record)
		Pla:VerkoopID = Ver2:VerkoopID
		Set(Pla:Planning_FK02,Pla:Planning_FK02)
		Loop until Access:Planning.Next()
			If not Pla:VerkoopID = Ver2:VerkoopID Then Break.
			
			Clear(Art:Record)
			Art:ArtikelID=Pla:ArtikelID
			Access:ViewArtikel.Fetch(Art:Artikel_PK)
			Clear(Ver:Record)
			Ver:VerpakkingID = Pla:VerpakkingID
			Access:Verpakking.Fetch(Ver:Verpakking_PK)
			if Loc:Product =''
				Loc:Product = LEFT(Format(Pla:KG,@n-13`2)&' '&Art:ArtikelOms&' '&Ver:VerpakkingOmschrijving)
			ELSE
				Loc:Product = Clip(Loc:Product)&'<13><10>'&LEFT(Format(Pla:KG,@n-13`2)&' '&Art:ArtikelOms&' '&Ver:VerpakkingOmschrijving)
			END
			
			IF Pla:PartijID > 0 THEN
				CLEAR(Par:Record)
				Par:PartijID = Pla:PartijID
				Access:Partij.TryFetch(Par:Partij_PK)
				IF Par:ExternPartijnr = 0 
					Loc:Product = Clip(Loc:Product)&' (Partij:'&Pla:PartijID&')'
				ELSE
					Loc:Product = Clip(Loc:Product)&' (Partij:'&Pla:PartijID&'/Extern partij:'&Par:ExternPartijnr&')'
				.
			.
			
			If Loc:Memo=''
				Loc:Memo = Pla:Memo
			ELSE
				Loc:Memo = Loc:Memo&'<13><10>'&Pla:Memo
			END
			If Loc:Instructie=''
				Loc:Instructie = Pla:Instructie
			ELSE
				Loc:Instructie = Loc:Instructie&'<13><10>'&Pla:Instructie
			END
			IF CLIP(Loc:Transport)=''
				Loc:Transport = CLIP(Pla:Transport)
			ELSE
				! Geen twee transport instructies
				!Loc:Transport = Loc:Transport &'<13><10>'&Pla:Transport
			END
		END
		
		! product;planning;memo;instrctie
		   Loc:Ole{'Application.Selection.MoveRight(12,1)'}   ! 12=wdCell
		Loc:Ole{'Application.Selection.TypeText("'&Loc:Product&'")'} !
		   Loc:Ole{'Application.Selection.MoveRight(12,1)'}   ! 12=wdCell
		Loc:Ole{'Application.Selection.TypeText("'&Loc:Planning&'")'} !
		   Loc:Ole{'Application.Selection.MoveRight(12,1)'}   ! 12=wdCell
		Loc:Ole{'Application.Selection.TypeText("'&Loc:Memo&'")'} !
		   Loc:Ole{'Application.Selection.MoveRight(12,1)'}   ! 12=wdCell
		Loc:Ole{'Application.Selection.TypeText("'&Loc:Instructie&'")'} !
		   Loc:Ole{'Application.Selection.MoveRight(12,1)'}   ! 12=wdCell
		Loc:Ole{'Application.Selection.TypeText("'&Loc:Transport&'")'} !

		RETURN
		
ExportClass.Overboeking  PROCEDURE(Long PRM:PlanningID)
Loc:Product				Cstring(1000)
Loc:Planning			Cstring(1000)
Loc:Memo				Cstring(1000)
Loc:Instructie			Cstring(1000)
Loc:Transport			Cstring(1000)
	CODE
		
		Clear(Pla:Record)
		Pla:PlanningID = PRM:PlanningID
		Access:Planning.Fetch(Pla:PK_Planning)
		
		!Clear(Rel:Record)
		!Rel:RelatieID = Ink:Leverancier
		!Access:Relatie.Fetch(Rel:Relatie_PK)
		!Loc:Ole{'Application.Selection.TypeText("'&Rel:FirmaNaam&'")'} 
	    !Loc:Ole{'Application.Selection.MoveRight(12,1)'}   ! 12=wdCell
    	!Loc:Ole{'Application.Selection.TypeText("'&Rel:Fax&'")'} !
	    !Loc:Ole{'Application.Selection.MoveRight(12,1)'}   ! 12=wdCell
		Loc:Ole{'Application.Selection.TypeText("'&GETUSERNAME()&'")'} !

		Clear(Loc:Product)
		EXECUTE 1+(Pla:Planning_DATE%7)
			Loc:Planning = 'Zondag ' &Format(Pla:Planning_DATE,@d6-)
			Loc:Planning = 'Maandag ' &Format(Pla:Planning_DATE,@d6-)
			Loc:Planning = 'Dinsdag ' &Format(Pla:Planning_DATE,@d6-)
			Loc:Planning = 'Woensdag ' &Format(Pla:Planning_DATE,@d6-)
			Loc:Planning = 'Donderdag ' &Format(Pla:Planning_DATE,@d6-)
			Loc:Planning = 'Vrijdag ' &Format(Pla:Planning_DATE,@d6-)
			Loc:Planning = 'Zaterdag ' &Format(Pla:Planning_DATE,@d6-)
		END	
		Clear(Loc:Memo)
		Clear(Loc:Instructie)
		Clear(Loc:Transport)
		
		Clear(Art:Record)
		Art:ArtikelID=Pla:ArtikelID
		Access:ViewArtikel.Fetch(Art:Artikel_PK)
		Clear(Ver:Record)
		Ver:VerpakkingID = Pla:VerpakkingID
		Access:Verpakking.Fetch(Ver:Verpakking_PK)
		if Loc:Product =''
			Loc:Product = LEFT(Format(Pla:KG,@n-13`2)&' '&Art:ArtikelOms&' '&Ver:VerpakkingOmschrijving)
		ELSE
			Loc:Product = Clip(Loc:Product)&'<13><10>'&LEFT(Format(Pla:KG,@n-13`2)&' '&Art:ArtikelOms&' '&Ver:VerpakkingOmschrijving)
		END
		If Loc:Memo=''
			Loc:Memo = Pla:Memo
		ELSE
			Loc:Memo = Loc:Memo&'<13><10>'&Pla:Memo
		END
		If Loc:Instructie=''
			Loc:Instructie = Pla:Instructie
		ELSE
			Loc:Instructie = Loc:Instructie&'<13><10>'&Pla:Instructie
		END
		IF CLIP(Loc:Transport)=''
			Loc:Transport = CLIP(Pla:Transport)
		ELSE
			! Geen twee transport instructies
			!Loc:Transport = Loc:Transport &'<13><10>'&Pla:Transport
		END
		
		CLEAR(AACEL:Record)
		AACel:CelID=Pla:CelID
		Access:AACel.TryFetch(AACel:CEL_PK)

		CLEAR(AAACel:Record)
		AAACel:CelID=Pla:OverboekingCelID
		Access:AAACel.TryFetch(AAACel:CEL_PK)
		
		CLEAR(Par:Record)
		Par:PartijID=Pla:PartijID
		Access:Partij.TryFetch(Par:Partij_PK)
		
		! cel;partij;product;planning;memo;instrctie
		Loc:Ole{'Application.Selection.MoveRight(12,1)'}   ! 12=wdCell
		Loc:Ole{'Application.Selection.TypeText("'& CLIP(AACel:CelOms) & ' => ' & CLIP(AAACel:CelOms) & '")'} !
		Loc:Ole{'Application.Selection.MoveRight(12,1)'}   ! 12=wdCell
		IF Par:ExternPartijnr > 0 THEN
			Loc:Ole{'Application.Selection.TypeText("'& FORMAT(Par:PartijID,@n_10B) & ' /  Extern: ' & FORMAT(Par:ExternPartijnr,@n_10B) & '")'} !
		ELSE
			Loc:Ole{'Application.Selection.TypeText("'& FORMAT(Par:PartijID,@n_10B) & '")'} !
		.
		   Loc:Ole{'Application.Selection.MoveRight(12,1)'}   ! 12=wdCell
		Loc:Ole{'Application.Selection.TypeText("'&Loc:Product&'")'} !
		   Loc:Ole{'Application.Selection.MoveRight(12,1)'}   ! 12=wdCell
		Loc:Ole{'Application.Selection.TypeText("'&Loc:Planning&'")'} !
		   Loc:Ole{'Application.Selection.MoveRight(12,1)'}   ! 12=wdCell
		Loc:Ole{'Application.Selection.TypeText("'&Loc:Memo&'")'} !
		   Loc:Ole{'Application.Selection.MoveRight(12,1)'}   ! 12=wdCell
		Loc:Ole{'Application.Selection.TypeText("'&Loc:Instructie&'")'} !
		   Loc:Ole{'Application.Selection.MoveRight(12,1)'}   ! 12=wdCell
		Loc:Ole{'Application.Selection.TypeText("'&Loc:Transport&'")'} !

		RETURN
		
ExportClass.VerkoopMutaties  PROCEDURE(Long PRM:InkoopID)
Loc:Product				Cstring(1000)
Loc:Planning			Cstring(1000)
Loc:Memo				Cstring(1000)
Loc:Instructie			Cstring(1000)
Loc:Transport			Cstring(1000)
	CODE
		
		Clear(Ver2:Record)
		Ver2:VerkoopID = PRM:InkoopID
		Access:Verkoop.Fetch(Ver2:PK_Verkoop)
		
		Clear(Rel:Record)
		Rel:RelatieID = Ver2:Klant
		Access:Relatie.Fetch(Rel:Relatie_PK)
		
		Loc:Ole{'Application.Selection.TypeText("'&Rel:FirmaNaam&'")'} 
		Loc:Ole{'Application.Selection.MoveRight(12,1)'}   ! 12=wdCell
		
		CLEAR(RAD:Record)
		RAD:ID=Ver2:KlantAlternatiefAdres
		IF Ver2:KlantAlternatiefAdres > 0 AND (Access:RelatieAdres.TryFetch(RAD:PK_RelatieAdres) = Level:Benign)
			Loc:Ole{'Application.Selection.TypeText("'&RAD:Adres1&'")'} !
			Loc:Ole{'Application.Selection.MoveRight(12,1)'}   ! 12=wdCell
			!IF CLIP(RAD:Adres2) <> '' THEN
				Loc:Ole{'Application.Selection.TypeText("'&RAD:Adres2&'")'} !
				Loc:Ole{'Application.Selection.MoveRight(12,1)'}   ! 12=wdCell
			!END
			Loc:Ole{'Application.Selection.TypeText("'&CLIP(RAD:Postcode)&' '&CLIP(RAD:Plaats)&'")'} !
			Loc:Ole{'Application.Selection.MoveRight(12,1)'}   ! 12=wdCell
			!IF CLIP(RAD:Land) <> '' THEN
				Loc:Ole{'Application.Selection.TypeText("'&RAD:Land&'")'} !
				Loc:Ole{'Application.Selection.MoveRight(12,1)'}   ! 12=wdCell
			!END
			Loc:Ole{'Application.Selection.TypeText("'&RAD:Fax&'")'} !
		ELSE
			Loc:Ole{'Application.Selection.TypeText("'&Rel:Adres1&'")'} !
			Loc:Ole{'Application.Selection.MoveRight(12,1)'}   ! 12=wdCell
			!IF CLIP(Rel:Adres2) <> '' THEN
				Loc:Ole{'Application.Selection.TypeText("'&Rel:Adres2&'")'} !
				Loc:Ole{'Application.Selection.MoveRight(12,1)'}   ! 12=wdCell
			!.
			Loc:Ole{'Application.Selection.TypeText("'&CLIP(Rel:Postcode)&' '&CLIP(Rel:Plaats)&'")'} !
			Loc:Ole{'Application.Selection.MoveRight(12,1)'}   ! 12=wdCell
			!IF CLIP(Rel:Country) <> '' THEN
				Loc:Ole{'Application.Selection.TypeText("'&Rel:Country&'")'} !
				Loc:Ole{'Application.Selection.MoveRight(12,1)'}   ! 12=wdCell
			!END
			Loc:Ole{'Application.Selection.TypeText("'&Rel:Fax&'")'} !
		.
	    Loc:Ole{'Application.Selection.MoveRight(12,1)'}   ! 12=wdCell
		Loc:Ole{'Application.Selection.TypeText("'&GETUSERNAME()&'")'} !

		Clear(Loc:Product)
		IF Ver2:Planning_DATE > 0 THEN
			EXECUTE 1+(Ver2:Planning_DATE%7)
				Loc:Planning = 'Zondag ' &Format(Ver2:Planning_DATE,@d6-)
				Loc:Planning = 'Maandag ' &Format(Ver2:Planning_DATE,@d6-)
				Loc:Planning = 'Dinsdag ' &Format(Ver2:Planning_DATE,@d6-)
				Loc:Planning = 'Woensdag ' &Format(Ver2:Planning_DATE,@d6-)
				Loc:Planning = 'Donderdag ' &Format(Ver2:Planning_DATE,@d6-)
				Loc:Planning = 'Vrijdag ' &Format(Ver2:Planning_DATE,@d6-)
				Loc:Planning = 'Zaterdag ' &Format(Ver2:Planning_DATE,@d6-)
			END	
		ELSE
			Loc:Planning = ''
		.
	
		Clear(Loc:Memo)
		Clear(Loc:Instructie)
		Clear(Loc:Transport)
		
		Clear(Pla:Record)
		Pla:VerkoopID = Ver2:VerkoopID
		Set(Pla:Planning_FK02,Pla:Planning_FK02)
		Loop until Access:Planning.Next()
			If not Pla:VerkoopID = Ver2:VerkoopID Then Break.
			
			Clear(Art:Record)
			Art:ArtikelID=Pla:ArtikelID
			Access:ViewArtikel.Fetch(Art:Artikel_PK)
			Clear(Ver:Record)
			Ver:VerpakkingID = Pla:VerpakkingID
			Access:Verpakking.Fetch(Ver:Verpakking_PK)
			IF LOC:Product <> '' 
				Loc:Product = Clip(Loc:Product)&'<13><10>'
			.
			
			IF Ver:VerpakkingOmschrijving <> '' THEN
				Loc:Product = Clip(Loc:Product)&LEFT(Format(Pla:KG,@n-13`2)&' kg X '&CLIP(Art:ArtikelOms)&', '&CLIP(Ver:VerpakkingOmschrijving))
			ELSE
				Loc:Product = Clip(Loc:Product)&LEFT(Format(Pla:KG,@n-13`2)&' kg X '&CLIP(Art:ArtikelOms))
			.
			
			IF Pla:PartijID > 0 THEN
				CLEAR(Par:Record)
				Par:PartijID = Pla:PartijID
				Access:Partij.TryFetch(Par:Partij_PK)
				IF Par:ExternPartijnr = 0 
					Loc:Product = Clip(Loc:Product)&'<13><9>'&' Partij:'&Pla:PartijID&')'
				ELSE
					Loc:Product = Clip(Loc:Product)&'<13><9>'&' Partij:'&Pla:PartijID&' / Extern partij:'&Par:ExternPartijnr
				.
			.
			
			IF CLIP(Pla:Transport) <> ''
				Loc:Product = Clip(Loc:Product) &'<13><9>'&CLIP(Pla:Transport)
			.
			
			If Loc:Memo=''
				Loc:Memo = Pla:Memo
			ELSE
				Loc:Memo = Loc:Memo&'<13><10>'&Pla:Memo
			END
			If Loc:Instructie=''
				Loc:Instructie = Pla:Instructie
			ELSE
				Loc:Instructie = Loc:Instructie&'<13><10>'&Pla:Instructie
			END
			IF CLIP(Loc:Transport)=''
				Loc:Transport = CLIP(Pla:Transport)
			ELSE
				! Geen twee transport instructies
				!Loc:Transport = Loc:Transport &'<13><10>'&Pla:Transport
			END
		END
		
		! product;planning;memo;instrctie
		   Loc:Ole{'Application.Selection.MoveRight(12,1)'}   ! 12=wdCell
		Loc:Ole{'Application.Selection.TypeText("'&Loc:Product&'")'} !
		   Loc:Ole{'Application.Selection.MoveRight(12,1)'}   ! 12=wdCell
		Loc:Ole{'Application.Selection.TypeText("'&Loc:Planning&'")'} !
		   Loc:Ole{'Application.Selection.MoveRight(12,1)'}   ! 12=wdCell
		Loc:Ole{'Application.Selection.TypeText("'&Loc:Memo&'")'} !
		   Loc:Ole{'Application.Selection.MoveRight(12,1)'}   ! 12=wdCell
		Loc:Ole{'Application.Selection.TypeText("'&Loc:Instructie&'")'} !
		   Loc:Ole{'Application.Selection.MoveRight(12,1)'}   ! 12=wdCell
		Loc:Ole{'Application.Selection.TypeText("'&Loc:Transport&'")'} !

		RETURN

FDCB1.ValidateRecord PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  		Case PRM:SoortData
  		of 'Inkoop'
  			IF Sja:SoortData<>'Inkoop' and Sja:SoortData<>'Inkoopregel 'then Return Record:Filtered.
  		of 'Verkoop'
  			IF Sja:SoortData<>'Verkoop' and Sja:SoortData<>'Verkoopregel 'then Return Record:Filtered.
  		of 'Overboeking'			
  			IF Sja:SoortData<>'Overboeking' then Return Record:Filtered.
  		of 'VerkoopMutaties'
  			IF Sja:SoortData<>'VerkoopMutaties' then Return Record:Filtered.
  		END
  		
  			
  			
  ReturnValue = PARENT.ValidateRecord()
  RETURN ReturnValue

