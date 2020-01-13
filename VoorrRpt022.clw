

   MEMBER('VoorrRpt.clw')                                  ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABPRPDF.INC'),ONCE
   INCLUDE('ABREPORT.INC'),ONCE
   INCLUDE('ABUTIL.INC'),ONCE
   INCLUDE('abrppsel.inc'),ONCE

                     MAP
                       INCLUDE('VOORRRPT022.INC'),ONCE        !Local module procedure declarations
                     END


!!! <summary>
!!! Generated from procedure template - Process
!!! </summary>
ReportPalletBlad PROCEDURE (PRM:PlanningID)

Progress:Thermometer BYTE                                  ! 
LOC:PlanningID       LONG                                  ! 
LOC:ARTNUM241        CSTRING(101)                          ! 
LOC:ARTOMS           CSTRING(101)                          ! 
LOC:FOUTGEVONDEN     BYTE                                  ! 
Process:View         VIEW(Mutatie)
                       PROJECT(Mut:AlternatieveArtikelOms)
                       PROJECT(Mut:ArtikelID)
                       PROJECT(Mut:MutatieID)
                       PROJECT(Mut:PartijID)
                     END
LocEnableEnterByTab  BYTE(1)                               !Used by the ENTER Instead of Tab template
EnterByTabManager    EnterByTabClass
ProgressWindow       WINDOW('Voortgang Palletbladen...'),AT(,,236,203),DOUBLE,CENTER,GRAY,TIMER(1)
                       PROGRESS,AT(63,15,111,12),USE(Progress:Thermometer),RANGE(0,100)
                       STRING(''),AT(48,3,141,10),USE(?Progress:UserString),CENTER
                       STRING(''),AT(48,30,141,10),USE(?Progress:PctText),CENTER
                       PROMPT('Extern Verkoop-ID:'),AT(6,58),USE(?GLO:UitslagPalletbladExternVerkoopID:Prompt)
                       ENTRY(@s50),AT(82,57,150,10),USE(GLO:UitslagPalletbladExternVerkoopID),LEFT
                       PROMPT('Afleverdatum (12):'),AT(6,70),USE(?GLO:UitslagPalletbladDueDate12:Prompt)
                       ENTRY(@d6-B),AT(82,71,46,10),USE(GLO:UitslagPalletbladDueDate12)
                       PROMPT(' Productiedatum (11):'),AT(6,84),USE(?GLO:UitslagPalletbladProductionDate11:Prompt)
                       ENTRY(@d6-B),AT(82,86,46,10),USE(GLO:UitslagPalletbladProductionDate11)
                       PROMPT('THT (15)'),AT(6,98),USE(?GLO:UitslagPalletbladSellByDate15:Prompt)
                       ENTRY(@d6-B),AT(82,100,46,10),USE(GLO:UitslagPalletbladSellByDate15)
                       STRING(@n_10),AT(84,44),USE(LOC:PlanningID)
                       PROMPT('Planning-ID:'),AT(6,44),USE(?GLO:UitslagPalletbladExternVerkoopID:Prompt:2)
                       PROMPT('Datums invullen als DD-MM-JJ !!!'),AT(134,85),USE(?PROMPT1)
                       PROMPT('Origin Live Bird:'),AT(6,114),USE(?GLO:UitslagPalletbladOriginLiveBird:Prompt)
                       ENTRY(@s50),AT(82,114,150,10),USE(GLO:UitslagPalletbladOriginLiveBird)
                       PROMPT('Origin Slauther House:'),AT(6,128),USE(?GLO:UitslagPalletbladOriginSlautherHouse:Prompt)
                       ENTRY(@s50),AT(82,128,150,10),USE(GLO:UitslagPalletbladOriginSlautherHouse)
                       PROMPT('Origin Processing:'),AT(6,142),USE(?GLO:UitslagPalletbladOriginProcessing:Prompt)
                       ENTRY(@s50),AT(82,142,150,10),USE(GLO:UitslagPalletbladOriginProcessing)
                       PROMPT('Origin Packing:'),AT(6,156),USE(?GLO:UitslagPalletbladOriginPacking:Prompt)
                       ENTRY(@s50),AT(82,156,150,10),USE(GLO:UitslagPalletbladOriginPacking)
                       BUTTON('Cancel'),AT(126,179,50,15),USE(?Progress:Cancel)
                       BUTTON('Pause'),AT(56,179,50,15),USE(?Pause),DEFAULT
                     END

    omit('***',WE::CantCloseNowSetHereDone=1)  !Getting Nested omit compile error, then uncheck the "Check for duplicate CantCloseNowSetHere variable declaration" in the WinEvent local template
WE::CantCloseNowSetHereDone equate(1)
WE::CantCloseNowSetHere     long
    !***
ThisWindow           CLASS(ReportManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Init                   PROCEDURE(ProcessClass PC,<REPORT R>,<PrintPreviewClass PV>)
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
Paused                 BYTE
Timer                  LONG
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED
TakeEvent              PROCEDURE(),BYTE,PROC,DERIVED
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED
                     END

ThisProcess          CLASS(ProcessClass)                   ! Process Manager
TakeRecord             PROCEDURE(),BYTE,PROC,DERIVED
                     END

ProgressMgr          StepLongClass                         ! Progress Manager

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
  GlobalErrors.SetProcedureName('ReportPalletBlad')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  LOC:PlanningID = PRM:PlanningID
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('Mut:MutatieID',Mut:MutatieID)                      ! Added by: Process
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:AAPlanning.Open                                   ! File AAPlanning used by this procedure, so make sure it's RelationManager is open
  Relate:AARelatie.Open                                    ! File AARelatie used by this procedure, so make sure it's RelationManager is open
  Relate:AAViewArtikel.Open                                ! File AAViewArtikel used by this procedure, so make sure it's RelationManager is open
  Relate:AMutatie.Open                                     ! File AMutatie used by this procedure, so make sure it's RelationManager is open
  Relate:AVerkoop.Open                                     ! File AVerkoop used by this procedure, so make sure it's RelationManager is open
  Relate:ArtikelOmschrijvingExtra.Open                     ! File ArtikelOmschrijvingExtra used by this procedure, so make sure it's RelationManager is open
  Relate:Mutatie.Open                                      ! File Mutatie used by this procedure, so make sure it's RelationManager is open
  Relate:Weging.Open                                       ! File Weging used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  GLO:UitslagPalletbladExternVerkoopID = ''
  
  CLEAR(AAPla:Record)
  AAPla:PlanningID = LOC:PlanningID
  IF Access:AAPlanning.TryFetch(AAPla:PK_Planning) = Level:Benign THEN
      CLEAR(AVE:Record)
      AVE:VerkoopID = AAPla:VerkoopID
      IF Access:AVerkoop.TryFetch(AVE:PK_Verkoop) = Level:Benign THEN
          GLO:UitslagPalletbladExternVerkoopID = AVE:ExternVerkoopID
      END        
  END
      
  GLO:UitslagPalletbladDueDate12 = 0
  GLO:UitslagPalletbladProductionDate11 = 0
  GLO:UitslagPalletbladSellByDate15 = 0
  CLEAR(GLO:UitslagPalletbladOriginLiveBird)
  CLEAR(GLO:UitslagPalletbladOriginSlautherHouse)
  CLEAR(GLO:UitslagPalletbladOriginProcessing)
  CLEAR(GLO:UitslagPalletbladOriginPacking)
  ! Uitslag-palletblad datums van rapport vullen en vooraf controleren of alle gegevens gevonden kunnen worden die nodig zijn voor het rapport.
  LOC:FOUTGEVONDEN = false
  
  CLEAR(AMut:Record)
  AMut:PlanningID = LOC:PlanningID
  SET(AMut:Mutatie_FK02,AMut:Mutatie_FK02)
  LOOP UNTIL Access:AMutatie.Next()
      IF AMut:PlanningID = LOC:PlanningID THEN
          GLO:UitslagPalletbladDueDate12 = AMut:UitslagPalletbladDueDate12_DATE
          GLO:UitslagPalletbladProductionDate11 = AMut:UitslagPalletbladProductionDate11_DATE
          GLO:UitslagPalletbladSellByDate15 = AMut:UitslagPalletbladSellByDate15_DATE
          GLO:UitslagPalletbladOriginLiveBird = AMut:UitslagPalletbladOriginLiveBird
          GLO:UitslagPalletbladOriginSlautherHouse = Mut:UitslagPalletbladOriginSlautherHouse
          GLO:UitslagPalletbladOriginProcessing = Mut:UitslagPalletbladOriginProcessing
          GLO:UitslagPalletbladOriginPacking = Mut:UitslagPalletbladOriginPacking
          ! Controle
          LOC:FOUTGEVONDEN = true
          
          CLEAR(Weg:Record)
          Weg:MutatieID = Mut:MutatieID
          SET(Weg:FK_Weging, Weg:FK_Weging)
          LOOP UNTIL Access:Weging.Next()
              IF Weg:MutatieID <> Mut:MutatieID THEN BREAK.
          
              ! Eerst controleren of alle gegevens gevonden kunnen worden
              CLEAR(AAPla:Record)
              AAPla:PlanningID = GLO:UitslagPalletbladPlanningID
              IF Access:AAPlanning.TryFetch(AAPla:PK_Planning) <> Level:Benign THEN
                  MESSAGE('Planning ('&GLO:UitslagPalletbladPlanningID&') niet gevonden.', 'Ontbrekende gegevens', ICON:Exclamation)
                  BREAK
              END
                         
             ! Bepalen artikel-omschrijving
              IF CLIP(AMut:AlternatieveArtikelOms) = '' THEN
                  CLEAR(AVE:Record)
                  AVE:VerkoopID = AAPla:VerkoopID
                  IF Access:AVerkoop.TryFetch(AVE:PK_Verkoop) <> Level:Benign THEN
                      MESSAGE('Verkoop ('&AAPla:VerkoopID&') niet gevonden.')
                      BREAK
                  END
                  
                  AARel:RelatieID = AVE:Klant
                  IF Access:AARelatie.TryFetch(AARel:Relatie_PK) <> Level:Benign THEN
                      MESSAGE('Klant ('&AVE:Klant&') niet gevonden.', 'Ontbrekende gegevens', ICON:Exclamation)
                      BREAK
                  END
                  
                  CLEAR(AAArt:Record)
                  AAArt:ArtikelID = GLO:UitslagPalletbladArtikelID
                  IF Access:AAViewArtikel.TryFetch(AAArt:Artikel_PK) <> Level:Benign THEN
                      MESSAGE('Artikel ('&CLIP(GLO:UitslagPalletbladArtikelID)&') niet gevonden.', 'Ontbrekende gegevens', ICON:Exclamation)
                      BREAK
                  END
                  
                  LOC:ARTOMS = GlobalClass.CMRArtikelOms(AARel:RelatieID, AAArt:ArtikelID)
              ELSE
                  LOC:ARTOMS = AMut:AlternatieveArtikelOms
              END
              
              artikelseparator# = INSTRING(' ', CLIP(LOC:ARTOMS), 1, 1)
              IF artikelseparator# <> 0 THEN
                  LOC:ARTNUM241 = CLIP(LEFT(SUB(LOC:ARTOMS, 1, artikelseparator#)))
                  LOC:ARTOMS = CLIP((SUB(LOC:ARTOMS, artikelseparator#, LEN(LOC:ARTOMS) - (artikelseparator# - 1))))
              ELSE
                  LOC:ARTNUM241 = ''
              END
  
              IF CLIP(LOC:ARTNUM241) = '' THEN
                  MESSAGE('Artikelnummer kon niet worden bepaald op basis van de artikelomschrijving "' & CLIP(LOC:ARTOMS) & '" van het artikel "' & CLIP(AAArt:ArtikelOms) & '".', 'Artikelnummer', ICON:Exclamation)
                  BREAK
              ELSE
                  error# = 0
                  LOOP i# = 1 TO (LEN(CLIP(LOC:ARTNUM241)) - 1)
                      IF (VAL(LOC:ARTNUM241[i#]) < 48 OR VAL(LOC:ARTNUM241[i#]) > 57) THEN 
                          error# = 1
                          BREAK
                      END
                  END
                  
                  IF error# = 1 THEN
                      MESSAGE('Artikelnummer "' & CLIP(LOC:ARTNUM241) & '" bepaald op basis van de artikelomschrijving "' & CLIP(LOC:ARTOMS) & '" van het artikel "' & CLIP(AAArt:ArtikelOms) & '" bevat ook niet-cijfers.', 'Artikelnummer', ICON:Exclamation)
                      BREAK
                  END
              END
              
              LOC:FOUTGEVONDEN = false
          END
          
          IF LOC:FOUTGEVONDEN = true THEN
              RETURN Level:Notify
          END
      END    
  END
  SELF.Open(ProgressWindow)                                ! Open window
  WinAlertMouseZoom()
  Do DefineListboxStyle
  INIMgr.Fetch('ReportPalletBlad',ProgressWindow)          ! Restore window settings from non-volatile store
  ProgressWindow{Prop:Timer} = 10                          ! Assign timer interval
  ProgressMgr.Init(ScrollSort:AllowNumeric,)
  ThisProcess.Init(Process:View, Relate:Mutatie, ?Progress:PctText, Progress:Thermometer, ProgressMgr, Mut:MutatieID)
  ThisProcess.AddSortOrder(Mut:Mutatie_FK02)
  ThisProcess.AddRange(Mut:PlanningID,LOC:PlanningID)
  ProgressWindow{Prop:Text} = 'Processing Records'
  ?Progress:PctText{Prop:Text} = '0% Completed'
  SELF.Init(ThisProcess)
  SELF.SetUseMRP(False)
  ?Progress:UserString{Prop:Text}='Printen Palletbladen'
  SELF.AddItem(?Progress:Cancel, RequestCancelled)
  SEND(Mutatie,'QUICKSCAN=on')
  ASSERT(~SELF.DeferWindow) ! A hidden Go button is not smart ...
  SELF.KeepVisible = 1
  SELF.DeferOpenReport = 1
  SELF.Timer = TARGET{PROP:Timer}
  TARGET{PROP:Timer} = 0
  ?Pause{PROP:Text} = 'Start'
  SELF.Paused = 1
  ?Progress:Cancel{PROP:Key} = EscKey
  SELF.SetAlerts()
  EnterByTabManager.Init(False)
  RETURN ReturnValue


ThisWindow.Init PROCEDURE(ProcessClass PC,<REPORT R>,<PrintPreviewClass PV>)

  CODE
  PARENT.Init(PC,R,PV)
  WinAlertMouseZoom()


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
        ThisNetRefresh.Send('|Mutatie|') ! NetTalk (NetRefresh)
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:AAPlanning.Close
    Relate:AARelatie.Close
    Relate:AAViewArtikel.Close
    Relate:AMutatie.Close
    Relate:AVerkoop.Close
    Relate:ArtikelOmschrijvingExtra.Close
    Relate:Mutatie.Close
    Relate:Weging.Close
  END
  IF SELF.Opened
    INIMgr.Update('ReportPalletBlad',ProgressWindow)       ! Save window data to non-volatile store
  END
  ProgressMgr.Kill()
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
    CASE ACCEPTED()
    OF ?Pause
      IF SELF.Paused
        TARGET{PROP:Timer} = SELF.Timer
        ?Pause{PROP:Text} = 'Pause'
      ELSE
        SELF.Timer = TARGET{PROP:Timer}
        TARGET{PROP:Timer} = 0
        ?Pause{PROP:Text} = 'Restart'
      END
      SELF.Paused = 1 - SELF.Paused
      AVE:ExternVerkoopID = GLO:UitslagPalletbladExternVerkoopID
      Access:AVerkoop.Update()
    END
  ReturnValue = PARENT.TakeAccepted()
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
    OF EVENT:OpenWindow
        WE::CantCloseNow += 1
        WE::CantCloseNowSetHere = 1
    OF EVENT:Timer
      IF SELF.Paused THEN RETURN Level:Benign .
    END
  ReturnValue = PARENT.TakeWindowEvent()
    CASE EVENT()
    OF EVENT:CloseWindow
      if WE::CantCloseNow > 0 and ReturnValue = Level:Benign and WE::CantCloseNowSetHere
        WE::CantCloseNow -= 1
        WE::CantCloseNowSetHere = 0
      end
    OF EVENT:OpenWindow
        post(event:visibleondesktop)
    END
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue


ThisProcess.TakeRecord PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  Mut:UitslagPalletbladDueDate12_DATE = GLO:UitslagPalletbladDueDate12
  Mut:UitslagPalletbladProductionDate11_DATE = GLO:UitslagPalletbladProductionDate11
  Mut:UitslagPalletbladSellByDate15_DATE = GLO:UitslagPalletbladSellByDate15
  
  Mut:UitslagPalletbladOriginLiveBird= GLO:UitslagPalletbladOriginLiveBird
  Mut:UitslagPalletbladOriginSlautherHouse= GLO:UitslagPalletbladOriginSlautherHouse
  Mut:UitslagPalletbladOriginProcessing= GLO:UitslagPalletbladOriginProcessing
  Mut:UitslagPalletbladOriginPacking=GLO:UitslagPalletbladOriginPacking
  ReturnValue = PARENT.TakeRecord()
  GLO:UitslagPalletbladPlanningID = Mut:PlanningID
  GLO:UitslagPalletbladArtikelID = Mut:ArtikelID
  GLO:UitslagPalletbladPartijID = Mut:PartijID
  GLO:UitslagPalletbladArtikelOms = ''
  
  db.DebugOut('Palletblad (1) - ' & Mut:MutatieID & ' - ' & Mut:AlternatieveArtikelOms)
  
  IF CLIP(Mut:AlternatieveArtikelOms) = ''
      ! Benodigde gegevens ophalen
      CLEAR(AAPla:Record)
      AAPla:PlanningID = GLO:UitslagPalletbladPlanningID
      IF Access:AAPlanning.TryFetch(AAPla:PK_Planning) <> Level:Benign THEN
          MESSAGE('Planning ('&GLO:UitslagPalletbladPlanningID&') niet gevonden.', 'Ontbrekende gegevens', ICON:Exclamation)
          RETURN Level:Benign
      END
                 
      CLEAR(AVE:Record)
      AVE:VerkoopID = AAPla:VerkoopID
      IF Access:AVerkoop.TryFetch(AVE:PK_Verkoop) <> Level:Benign THEN
          MESSAGE('Verkoop ('&AAPla:VerkoopID&') niet gevonden.', 'Ontbrekende gegevens', ICON:Exclamation)
          RETURN Level:Benign
      END
      
      AARel:RelatieID = AVE:Klant
      IF Access:AARelatie.TryFetch(AARel:Relatie_PK) <> Level:Benign THEN
          MESSAGE('Klant ('&AVE:Klant&') niet gevonden.', 'Ontbrekende gegevens', ICON:Exclamation)
          RETURN Level:Benign
      END
  
      GLO:UitslagPalletbladArtikelOms = GlobalClass.CMRArtikelOms(AARel:RelatieID, Mut:ArtikelID)
  ELSE
      GLO:UitslagPalletbladArtikelOms = Mut:AlternatieveArtikelOms
  END
  
  db.DebugOut('Palletblad (2) - ' & GLO:UitslagPalletbladArtikelOms)
  
  CLEAR(Weg:Record)
  Weg:MutatieID = Mut:MutatieID
  SET(Weg:FK_Weging, Weg:FK_Weging)
  LOOP UNTIL Access:Weging.Next()
      IF Weg:MutatieID <> Mut:MutatieID THEN BREAK.
      
      ReportPalletBladEnkel(Weg:PalletID, Weg:NettoGewicht, False, 1) ! Geen preview
      !ReportPalletBladEnkel(Weg:PalletID, Weg:NettoGewicht, True, 1) ! preview
  END
  PUT(Process:View)
  IF ERRORCODE()
    GlobalErrors.ThrowFile(Msg:PutFailed,'Process:View')
    ThisWindow.Response = RequestCompleted
    ReturnValue = Level:Fatal
  END
  RETURN ReturnValue

!!! <summary>
!!! Generated from procedure template - Process
!!! Process the Mutatie File
!!! </summary>
WindowPalletbladExport PROCEDURE 

Progress:Thermometer BYTE                                  ! 
LOC:ExportFolder     CSTRING(512)                          ! 
LOC:ExportNaam       CSTRING(256)                          ! 
LOC:ARTNUM241        CSTRING(101)                          ! 
LOC:ARTOMS           CSTRING(101)                          ! 
LOC:Writing          BYTE                                  ! 
LOC:VerkoopFound     BYTE                                  ! 
LOC:CountryCompanySSCCNVE LONG                             ! 
LOC:SSCCNVE          STRING(18)                            ! 
Process:View         VIEW(Mutatie)
                       PROJECT(Mut:AlternatieveArtikelOms)
                       PROJECT(Mut:ArtikelID)
                       PROJECT(Mut:PartijID)
                       PROJECT(Mut:UitslagPalletbladDueDate12_DATE)
                       PROJECT(Mut:UitslagPalletbladProductionDate11_DATE)
                       PROJECT(Mut:UitslagPalletbladSellByDate15_DATE)
                     END
LocEnableEnterByTab  BYTE(1)                               !Used by the ENTER Instead of Tab template
EnterByTabManager    EnterByTabClass
ProgressWindow       WINDOW('Exporteren Palletbladen'),AT(,,267,136),FONT(,8,,,CHARSET:DEFAULT),DOUBLE,CENTER,GRAY, |
  TIMER(1)
                       GROUP('Exporteren naar..'),AT(5,4,257,50),USE(?ExportGroup),BOXED
                         PROMPT('Directory:'),AT(14,17),USE(?LOC:ExportFolder:Prompt)
                         ENTRY(@s255),AT(69,17,168,10),USE(LOC:ExportFolder)
                         BUTTON('...'),AT(242,16,12,12),USE(?LookupFile)
                         PROMPT('Bestandsnaam:'),AT(14,33),USE(?LOC:ExportNaam:Prompt)
                         ENTRY(@s255),AT(69,33,168,10),USE(LOC:ExportNaam)
                       END
                       PROGRESS,AT(37,71,181,12),USE(Progress:Thermometer),RANGE(0,100)
                       STRING(''),AT(57,58,141,10),USE(?Progress:UserString),CENTER
                       STRING(''),AT(57,87,141,10),USE(?Progress:PctText),CENTER
                       BUTTON('Annuleren'),AT(131,102,81,26),USE(?Progress:Cancel),LEFT,ICON('WACANCEL.ICO'),FLAT, |
  MSG('Cancel Process'),TIP('Cancel Process')
                       BUTTON('Exporteren'),AT(37,102,81,26),USE(?Pause),LEFT,ICON(ICON:Connect),FLAT
                     END

    omit('***',WE::CantCloseNowSetHereDone=1)  !Getting Nested omit compile error, then uncheck the "Check for duplicate CantCloseNowSetHere variable declaration" in the WinEvent local template
WE::CantCloseNowSetHereDone equate(1)
WE::CantCloseNowSetHere     long
    !***
    omit('***',WE::CantCloseNowSetHereDone=1)  !Getting Nested omit compile error, then uncheck the "Check for duplicate CantCloseNowSetHere variable declaration" in the WinEvent local template
WE::CantCloseNowSetHereDone equate(1)
WE::CantCloseNowSetHere     long
    !***
ThisWindow           CLASS(ReportManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Init                   PROCEDURE(ProcessClass PC,<REPORT R>,<PrintPreviewClass PV>)
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
Paused                 BYTE
Timer                  LONG
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED
TakeEvent              PROCEDURE(),BYTE,PROC,DERIVED
TakeRecord             PROCEDURE(),BYTE,PROC,DERIVED
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED
                     END

ThisProcess          CLASS(ProcessClass)                   ! Process Manager
Close                  PROCEDURE(),DERIVED
                     END

ProgressMgr          StepLongClass                         ! Progress Manager
FileLookup2          SelectFileClass
AsciiFile FILE,DRIVER('ASCII','/FILEBUFFERS=8'),PRE(ASC),CREATE,THREAD
Record     RECORD,PRE()
Line        STRING(1024)
           END
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
  GlobalErrors.SetProcedureName('WindowPalletbladExport')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?LOC:ExportFolder:Prompt
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:ARelatie.Open                                     ! File ARelatie used by this procedure, so make sure it's RelationManager is open
  Relate:AViewArtikel.Open                                 ! File AViewArtikel used by this procedure, so make sure it's RelationManager is open
  Relate:ArtikelOmschrijvingExtra.Open                     ! File ArtikelOmschrijvingExtra used by this procedure, so make sure it's RelationManager is open
  Relate:Mutatie.Open                                      ! File Mutatie used by this procedure, so make sure it's RelationManager is open
  Relate:Planning.SetOpenRelated()
  Relate:Planning.Open                                     ! File Planning used by this procedure, so make sure it's RelationManager is open
  Relate:RelatieArtikelOmschrijving.Open                   ! File RelatieArtikelOmschrijving used by this procedure, so make sure it's RelationManager is open
  Relate:Weging.Open                                       ! File Weging used by this procedure, so make sure it's RelationManager is open
  Access:Verkoop.UseFile                                   ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:Relatie.UseFile                                   ! File referenced in 'Other Files' so need to inform it's FileManager
  SELF.FilesOpened = True
  db.DebugOut('WindowPalletBladExport (1) - Pla:PlanningID:' & Pla:PlanningID)
  CLEAR(Ver2:Record)
  Ver2:VerkoopID = Pla:VerkoopID
  IF Access:Verkoop.Fetch(Ver2:PK_Verkoop) <> Level:Benign THEN
      MESSAGE('Verkoop ' & Pla:VerkoopID & ' kon niet worden opgehaald. ', 'Fout', ICON:Exclamation)
      RETURN Level:Fatal
  END
  
  db.DebugOut('WindowPalletBladExport (2) - Pla:PlanningID:' & Pla:PlanningID & ', Ver2:VerkoopID:' & Ver2:VerkoopID)
  
  LOC:VerkoopFound = FALSE
  LOC:Writing = FALSE
  LOC:ExportFolder = GETINI('Palletblad', 'ExportFolder', PATH(), '.\Voorraad.ini')
  LOC:ExportNaam = 'sale_' & CLIP(LEFT(FORMAT(Pla:VerkoopID, @n_10))) & '_' & CLIP(LEFT(FORMAT(Pla:PlanningID, @n_10))) & '.csv'
  
  LOC:CountryCompanySSCCNVE = GETINI('Palletblad','CountryCompanyPrefix','870123456','.\Voorraad.ini')
  SELF.Open(ProgressWindow)                                ! Open window
  WinAlertMouseZoom()
  WinAlertMouseZoom()
  Do DefineListboxStyle
  INIMgr.Fetch('WindowPalletbladExport',ProgressWindow)    ! Restore window settings from non-volatile store
  ProgressWindow{Prop:Timer} = 10                          ! Assign timer interval
  ProgressMgr.Init(ScrollSort:AllowNumeric,)
  ThisProcess.Init(Process:View, Relate:Mutatie, ?Progress:PctText, Progress:Thermometer, ProgressMgr, Mut:MutatieID)
  ThisProcess.AddSortOrder(Mut:Mutatie_PK)
  ProgressWindow{Prop:Text} = 'Processing Records'
  ?Progress:PctText{Prop:Text} = '0% Completed'
  SELF.Init(ThisProcess)
  ?Progress:UserString{Prop:Text}='Exporteren Palletbladen'
  SELF.AddItem(?Progress:Cancel, RequestCancelled)
  FileLookup2.Init
  FileLookup2.ClearOnCancel = True
  FileLookup2.Flags=BOR(FileLookup2.Flags,FILE:LongName)   ! Allow long filenames
  FileLookup2.Flags=BOR(FileLookup2.Flags,FILE:Directory)  ! Allow Directory Dialog
  FileLookup2.SetMask('All Files','*.*')                   ! Set the file mask
  FileLookup2.WindowTitle='Export-directory Selecteren'
  SEND(Mutatie,'QUICKSCAN=on')
  ASSERT(~SELF.DeferWindow) ! A hidden Go button is not smart ...
  SELF.KeepVisible = 1
  SELF.DeferOpenReport = 1
  SELF.Timer = TARGET{PROP:Timer}
  TARGET{PROP:Timer} = 0
  ?Pause{PROP:Text} = 'Exporteren'
  SELF.Paused = 1
  ?Progress:Cancel{PROP:Key} = EscKey
  SELF.SetAlerts()
  EnterByTabManager.Init(False)
  RETURN ReturnValue


ThisWindow.Init PROCEDURE(ProcessClass PC,<REPORT R>,<PrintPreviewClass PV>)

  CODE
  PARENT.Init(PC,R,PV)
  WinAlertMouseZoom()
  WinAlertMouseZoom()


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
        ThisNetRefresh.Send('|Mutatie|') ! NetTalk (NetRefresh)
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:ARelatie.Close
    Relate:AViewArtikel.Close
    Relate:ArtikelOmschrijvingExtra.Close
    Relate:Mutatie.Close
    Relate:Planning.Close
    Relate:RelatieArtikelOmschrijving.Close
    Relate:Weging.Close
  END
  IF SELF.Opened
    INIMgr.Update('WindowPalletbladExport',ProgressWindow) ! Save window data to non-volatile store
  END
  ProgressMgr.Kill()
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
    CASE ACCEPTED()
    OF ?Pause
      IF SELF.Paused
        TARGET{PROP:Timer} = SELF.Timer
        ?Pause{PROP:Text} = 'Pauzeren'
      ELSE
        SELF.Timer = TARGET{PROP:Timer}
        TARGET{PROP:Timer} = 0
        ?Pause{PROP:Text} = 'Restart'
      END
      SELF.Paused = 1 - SELF.Paused
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?LookupFile
      ThisWindow.Update()
      LOC:ExportFolder = FileLookup2.Ask(1)
      DISPLAY
    OF ?Pause
      ThisWindow.Update()
      PUTINI('Palletblad', 'ExportFolder', LOC:ExportFolder, '.\Voorraad.ini')
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
  if event() = event:VisibleOnDesktop
    ds_VisibleOnDesktop()
  end
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue


ThisWindow.TakeRecord PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.TakeRecord()
  !IF NOT(LOC:VerkoopFound)
  !    CLEAR(Ver2:Record)
  !    Ver2:VerkoopID = Pla:VerkoopID
  !    Access:Verkoop.Fetch(Ver2:PK_Verkoop)
  !    LOC:VerkoopFound = TRUE
  !END 
  
  !db.DebugOUt('Exporteren wegingen van MutatieID - FILTER: ' & Mut:MutatieID & ', PlanningID: ' & Mut:PlanningID)
  
  IF Mut:PlanningID = Pla:PlanningID THEN ! VIA FILTER / RANGE-FILTER WERKT NIET. KRIJG DAN DUBBELE RECORDS
      !db.DebugOUt('Exporteren wegingen van MutatieID - DONE: ' & Mut:MutatieID & ', PlanningID: ' & Mut:PlanningID)
      CLEAR(Weg:Record)
      Weg:MutatieID = Mut:MutatieID
      SET(Weg:FK_Weging, Weg:FK_Weging)
      LOOP UNTIL Access:Weging.Next()
          IF NOT(Weg:MutatieID = Mut:MutatieID) THEN BREAK.
          
          ! Bepalen artikel-omschrijving
          IF CLIP(Mut:AlternatieveArtikelOms) = ''
              ! Benodigde gegevens ophalen
              Rel:RelatieID = Ver2:Klant
              IF Access:Relatie.TryFetch(Rel:Relatie_PK) <> Level:Benign THEN
                  MESSAGE('Klant ('&Ver2:Klant&') niet gevonden. ', 'Ontbrekende gegevens', ICON:Exclamation)
                  RETURN Level:Benign
              END
  
              LOC:ARTOMS = GlobalClass.CMRArtikelOms(Rel:RelatieID, Mut:ArtikelID)
          ELSE
              LOC:ARTOMS = Mut:AlternatieveArtikelOms
          END
  
          artikelseparator# = INSTRING(' ', CLIP(LOC:ARTOMS), 1, 1)
          IF artikelseparator# <> 0 THEN
              LOC:ARTNUM241 = CLIP(LEFT(SUB(LOC:ARTOMS, 1, artikelseparator#)))
              LOC:ARTOMS = CLIP((SUB(LOC:ARTOMS, artikelseparator# + 1, LEN(LOC:ARTOMS) - (artikelseparator# - 1))))
          ELSE
              LOC:ARTNUM241 = ''
          END
          
          IF CLIP(LOC:ARTNUM241) = '' THEN
              LOC:ARTNUM241=Mut:ArtikelID
              !MESSAGE('Artikelnummer kon niet worden bepaald op basis van de artikelomschrijving "' & CLIP(LOC:ARTOMS) & '" van het artikel "' & CLIP(AAArt:ArtikelOms) & '".', 'Artikelnummer', ICON:Exclamation)
          ELSE
              LOOP i# = 1 TO (LEN(CLIP(LOC:ARTNUM241)) - 1)
                  !MESSAGE('Controleren (' & LOC:ARTNUM241 & ') - ' & i# & ' /  ' & (LEN(LOC:ARTNUM241) - 1) & ' = ' & VAL(LOC:ARTNUM241[i#]))
                  IF (VAL(LOC:ARTNUM241[i#]) < 48) OR (VAL(LOC:ARTNUM241[i#]) > 57) THEN 
                      !MESSAGE('Artikelnummer "' & CLIP(LOC:ARTNUM241) & '" bepaald op basis van de artikelomschrijving "' & CLIP(LOC:ARTOMS) & '" van het artikel "' & CLIP(AAArt:ArtikelOms) & '" bevat ook niet-cijfers. Controleer of dit klopt.', 'Artikelnummer', ICON:Exclamation)
                      LOC:ARTOMS=CLIP(LOC:ARTNUM241) & ' ' & CLIP(LOC:ARTOMS)
                      LOC:ARTNUM241=Mut:ArtikelID
                      BREAK
                  END
              END
          END    
          
          ! Wegschrijven naar ASCII-bestand
          IF NOT(LOC:Writing)
              IF SUB(LOC:ExportFolder, LEN(LOC:ExportFolder), 1) = '\' THEN
                  LOC:ExportFolder = SUB(LOC:ExportFolder, 1, LEN(LOC:ExportFolder) - 1)
              END
              
              AsciiFile{PROP:Name} = LOC:ExportFolder & '\' & LOC:ExportNaam
              CREATE(AsciiFile)
              IF ERROR() THEN
                  MESSAGE('Bestand ' & CLIP(LOC:ExportFolder & '\' & LOC:ExportNaam) & ' kon niet worden aangemaakt. ' & CLIP(ERROR()))
                  RETURN Level:Fatal
              ELSE
                  OPEN(AsciiFile)
                  IF ERROR() THEN MESSAGE('OPEN - Fout ' & CLIP(ERRORCODE()) & ' - ' & CLIP(ERROR())).
  
                  CLEAR(ASC:Record)    
                  ASC:Line = 'SSCC_NVE_00;CustomerPurchaseOrderNumber_400;BatchNumber_10;' & |
                      'CustomerPartNumber_241;CustomerPartName;' & |
                      'ProductionDate_11;DueDate_12;SellByDate_15;NumberOfUnitsContained_37;ProductNetWeight_310'
                  ADD(AsciiFile)
              END            
              
              LOC:Writing = TRUE
          END
          
          CLEAR(ASC:Record)
          
          !LOC:SSCCNVE = '387012345600000003'
          LOC:SSCCNVE = '3' & FORMAT(LOC:CountryCompanySSCCNVE, @N09) & FORMAT(Weg:PalletID, @N07)
          
          ! Bepalen checksum (http://www.gs1sy.org/GS1System/id_keys/CheckDigit.htm)
          CHECKSUMS# = 0
          
          LOOP I# = 1 TO 17
              IF I# % 2 = 1 THEN
                  CHECKSUMS# += 3 * (VAL(LOC:SSCCNVE[I#]) - 48)
              ELSE    
                  CHECKSUMS# += (VAL(LOC:SSCCNVE[I#]) - 48)
              END
              db.DebugOut('Checksum-telling (' & I# & '): ' & CHECKSUMS# & ' <= ' & LOC:SSCCNVE[I#] & ' - ' & (VAL(LOC:SSCCNVE[I#])))
          END
          
          CHECKSUM# = 10 - (CHECKSUMS# - (INT(CHECKSUMS# / 10) * 10))
          IF CHECKSUM# = 10 THEN CHECKSUM# = 0.
          db.DebugOut('Checksum-berekening: ' & CHECKSUMS# & ' => ' & CHECKSUM#)
          LOC:SSCCNVE = CLIP(LOC:SSCCNVE) & FORMAT(CHECKSUM#, @N01)
  
          ASC:Line = CLIP(LOC:SSCCNVE) & ';' & CLIP(LEFT(Ver2:ExternVerkoopID)) & ';' & CLIP(LEFT(FORMAT(Mut:PartijID,@N_10))) & ';' & |
              CLIP(LOC:ARTNUM241) & ';' & CLIP(LOC:ARTOMS) & ';' & |
              CLIP(LEFT(FORMAT(Mut:UitslagPalletbladProductionDate11_DATE, @d11))) & ';' & CLIP(LEFT(FORMAT(Mut:UitslagPalletbladDueDate12_DATE, @d11))) & ';' & |
              CLIP(LEFT(FORMAT(Mut:UitslagPalletbladSellByDate15_DATE, @d11))) & ';1;' & CLIP(LEFT(FORMAT(ROUND(Weg:NettoGewicht, 0.1), @n-_8.1)))
          ADD(AsciiFile)
      END
  END
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
      if WE::CantCloseNow
        WE::MustClose = 1
        cycle
      else
        self.CancelAction = cancel:cancel
        self.response = requestcancelled
      end
    OF EVENT:OpenWindow
        WE::CantCloseNow += 1
        WE::CantCloseNowSetHere = 1
        WE::CantCloseNow += 1
        WE::CantCloseNowSetHere = 1
    OF EVENT:Timer
      IF SELF.Paused THEN RETURN Level:Benign .
    END
  ReturnValue = PARENT.TakeWindowEvent()
    CASE EVENT()
    OF EVENT:CloseWindow
      if WE::CantCloseNow > 0 and ReturnValue = Level:Benign and WE::CantCloseNowSetHere
        WE::CantCloseNow -= 1
        WE::CantCloseNowSetHere = 0
      end
      if WE::CantCloseNow > 0 and ReturnValue = Level:Benign and WE::CantCloseNowSetHere
        WE::CantCloseNow -= 1
        WE::CantCloseNowSetHere = 0
      end
    OF EVENT:OpenWindow
        post(event:visibleondesktop)
        post(event:visibleondesktop)
    END
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue


ThisProcess.Close PROCEDURE

  CODE
  IF LOC:Writing THEN
      CLOSE(AsciiFile)
      IF ERROR() THEN MESSAGE('CLOSE - Fout ' & CLIP(ERRORCODE()) & ' - ' & CLIP(ERROR())).
      
      MESSAGE('CSV-bestand staat klaar.','Export voltooid', ICON:Hand)
  END    
  PARENT.Close

!!! <summary>
!!! Generated from procedure template - Report
!!! </summary>
ReportVerkoopBevestiging PROCEDURE (LONG pVerkoopID)

Progress:Thermometer BYTE                                  ! 
Loc:ArtikelOmschrijving STRING(160)                        ! 
Loc:VerkoopID        LONG                                  ! 
Loc:PostcodePlaats   STRING(50)                            ! 
Loc:VerpakkingOmschrijving CSTRING(50)                     ! 
Loc:BetaalConditie   CSTRING(51)                           ! 
Loc:DeliveryTerms    CSTRING(81)                           ! 
Loc:TotaalBedrag     DECIMAL(9,2)                          ! 
Loc:Voettekst        CSTRING(1000)                         ! 
Loc:SavePath         STRING(255)                           ! 
Loc:TMPDirectory     STRING(255)                           ! 
Loc:Commando         CSTRING(10000)                        ! 
Loc:TmpAtt           STRING(255)                           ! 
Loc:Landscape        BYTE                                  ! 
Loc:LandscapeOverride BYTE                                 ! 
Loc:MailButtonID     LONG                                  ! 
Loc:PDFFileName      CSTRING(1001)                         ! 
Process:View         VIEW(Verkoop)
                       PROJECT(Ver2:ConfirmationDate_DATE)
                       PROJECT(Ver2:VerkoopID)
                       PROJECT(Ver2:Klant)
                       JOIN(Pla:Planning_FK02,Ver2:VerkoopID)
                         PROJECT(Pla:ArtikelID)
                         PROJECT(Pla:DeliveryDate_DATE)
                         PROJECT(Pla:KG)
                         PROJECT(Pla:LotID)
                         PROJECT(Pla:PlantNumber)
                         PROJECT(Pla:VerkoopKGPrijs)
                         PROJECT(Pla:VerpakkingID)
                         JOIN(Art:Artikel_PK,Pla:ArtikelID)
                         END
                         JOIN(Ver:Verpakking_PK,Pla:VerpakkingID)
                         END
                       END
                       JOIN(AREL:Relatie_PK,Ver2:Klant)
                         PROJECT(AREL:Adres1)
                         PROJECT(AREL:Country)
                         PROJECT(AREL:FirmaNaam)
                         PROJECT(AREL:PaymentCondition)
                         PROJECT(AREL:Plaats)
                         PROJECT(AREL:Postcode)
                       END
                     END
LocEnableEnterByTab  BYTE(1)                               !Used by the ENTER Instead of Tab template
EnterByTabManager    EnterByTabClass
ProgressWindow       WINDOW('Progress...'),AT(,,142,59),DOUBLE,CENTER,GRAY,TIMER(1)
                       PROGRESS,AT(15,15,111,12),USE(Progress:Thermometer),RANGE(0,100)
                       STRING(''),AT(0,3,141,10),USE(?Progress:UserString),CENTER
                       STRING(''),AT(0,30,141,10),USE(?Progress:PctText),CENTER
                       BUTTON('Cancel'),AT(45,42,50,15),USE(?Progress:Cancel)
                     END

Report               REPORT,AT(500,4042,7042,5646),PRE(RPT),PAPER(PAPER:A4),FONT('Arial',10,,FONT:regular,CHARSET:ANSI), |
  THOUS
                       HEADER,AT(500,448,7042,3552),USE(?Header)
                         IMAGE('VENBriefhoofd.jpg'),AT(167,156,6667,1250),USE(?IMAGE1)
                         STRING('Ven Poultry B.V.'),AT(42,1521),USE(?STRING1)
                         STRING('Stipdonk 46 A'),AT(42,1750,1010,198),USE(?STRING1:2)
                         STRING('5715 PD Lierop'),AT(42,2010,1010,198),USE(?STRING1:3)
                         STRING('The Netherlands'),AT(42,2240,1010,198),USE(?STRING1:4)
                         STRING('SALES CONFIRMATION'),AT(2635,2583,2375,198),USE(?STRING1:5),FONT(,14,,FONT:regular+FONT:underline)
                         STRING('Confirmation Date'),AT(42,2917,1229,198),USE(?STRING1:6)
                         STRING('PO Number: '),AT(4823,2896,896,198),USE(?STRING1:7)
                         STRING(@n_6),AT(5833,2885),USE(Ver2:VerkoopID)
                         STRING(@s50),AT(4333,1521),USE(AREL:FirmaNaam),LEFT
                         STRING(@s100),AT(4333,1750),USE(AREL:Adres1),LEFT
                         STRING(@s50),AT(4333,2010,2656),USE(Loc:PostcodePlaats),LEFT
                         STRING('Ven Poultry'),AT(385,3177),USE(?STRING4),FONT(,8)
                         STRING('ID number'),AT(385,3333,708,198),USE(?STRING4:2),FONT(,8)
                         STRING('Description'),AT(1198,3177,1344,198),USE(?STRING4:3),FONT(,8)
                         STRING('Delivery Date'),AT(2979,3156),USE(?STRING5),FONT(,8)
                         STRING('Packaging'),AT(4406,3156,802,198),USE(?STRING5:2),FONT(,8)
                         STRING('Volume (kgs)'),AT(5312,3177,802,198),USE(?STRING5:3),FONT(,8),RIGHT
                         STRING('Price (per kg)'),AT(6187,3177,802,198),USE(?STRING5:4),FONT(,8),RIGHT
                         BOX,AT(10,3135,7021,417),USE(?BOX1),COLOR(COLOR:Black),LINEWIDTH(1)
                         STRING('Plantnumber'),AT(3667,3156,677,177),USE(?STRING5:5),FONT(,8)
                         STRING('Lot ID'),AT(42,3167),USE(?STRING9),FONT(,8)
                         STRING(@d6-),AT(1187,2917),USE(Ver2:ConfirmationDate_DATE,,?Ver2:ConfirmationDate_DATE:4)
                         STRING(@s60),AT(4333,2240),USE(AREL:Country)
                         LINE,AT(354,3135,0,417),USE(?LINE1)
                         LINE,AT(1167,3135,0,417),USE(?LINE1:2)
                         LINE,AT(2948,3135,0,417),USE(?LINE1:3)
                         LINE,AT(3656,3135,0,417),USE(?LINE1:4)
                         LINE,AT(4344,3135,0,417),USE(?LINE1:5)
                         LINE,AT(5260,3135,0,417),USE(?LINE1:6)
                         LINE,AT(6125,3135,0,417),USE(?LINE1:7)
                       END
breakVerkoopID         BREAK(Ver2:VerkoopID),USE(?BREAK1)
Detail                   DETAIL,AT(0,0,7042,198),USE(?Detail),FONT(,10)
                           STRING(@s13),AT(375,31,1240),USE(Pla:ArtikelID),FONT(,8)
                           STRING(@n-13`2),AT(5240,31,875),USE(Pla:KG),FONT('Arial',8),RIGHT
                           STRING(@N~€~-9`2),AT(6375,31),USE(Pla:VerkoopKGPrijs),FONT(,8),RIGHT(2)
                           STRING(@s49),AT(4406,31,802),USE(Loc:VerpakkingOmschrijving),FONT(,8,,FONT:regular)
                           STRING(@s50),AT(1198,31,1687),USE(Loc:ArtikelOmschrijving),FONT(,8)
                           STRING(@N2~*~B),AT(52,31,240),USE(Pla:LotID,,?Pla:LotID:2),FONT(,8),RIGHT(2)
                           STRING(@s8),AT(3667,31,677),USE(Pla:PlantNumber),FONT(,8)
                           STRING(@d6-),AT(2979,31),USE(Pla:DeliveryDate_DATE),FONT(,8)
                           LINE,AT(354,0,0,200),USE(?LINE1:8)
                           LINE,AT(1167,0,0,198),USE(?LINE1:9)
                           LINE,AT(2948,0,0,198),USE(?LINE1:10)
                           LINE,AT(4344,0,0,198),USE(?LINE1:11)
                           LINE,AT(5260,0,0,198),USE(?LINE1:12)
                           LINE,AT(6125,0,0,198),USE(?LINE1:13)
                           LINE,AT(3656,0,0,198),USE(?LINE1:14)
                           LINE,AT(10,0,0,198),USE(?LINE1:15)
                           LINE,AT(7031,0,0,198),USE(?LINE1:16)
                         END
                         FOOTER,AT(0,0,7042,4469),USE(?GROUPFOOTER1)
                           STRING('Total:'),AT(4406,52),USE(?STRING3)
                           STRING(@n-13`2),AT(5094,52,1021,198),USE(Pla:KG,,?Pla:KG:2),FONT(,8),RIGHT,SUM,TALLY(Detail), |
  RESET(breakVerkoopID)
                           STRING('Stamped and signed for and behalf of:'),AT(167,760,2427,198),USE(?STRING2:2)
                           STRING('Date'),AT(187,2604,1229,198),USE(?STRING1:8)
                           STRING(@s50),AT(5292,2198,2500,198),USE(AREL:FirmaNaam,,?AREL:FirmaNaam:2),LEFT
                           BOX,AT(31,969,2854,1854),USE(?BOX1:2),COLOR(COLOR:Black),LINEWIDTH(1)
                           STRING('The Supllier:'),AT(146,1052),USE(?STRING6),FONT(,,,FONT:regular+FONT:underline)
                           STRING('Company name: Ven Poultry B.V.'),AT(167,2198),USE(?STRING7)
                           STRING('Name'),AT(177,2396),USE(?STRING8)
                           BOX,AT(4135,979,2854,1854),USE(?BOX1:3),COLOR(COLOR:Black),LINEWIDTH(1)
                           STRING('The Customer:'),AT(4250,1052,958,198),USE(?STRING6:2),FONT(,,,FONT:regular+FONT:underline)
                           STRING('Company name: '),AT(4250,2198,979,198),USE(?STRING7:2)
                           STRING('Name'),AT(4250,2406,365,198),USE(?STRING8:2)
                           STRING('Date'),AT(4271,2594,1229,198),USE(?STRING1:9)
                           TEXT,AT(31,2885,6958,1573),USE(Loc:Voettekst),FONT(,9)
                           STRING(@s50),AT(167,333),USE(Loc:BetaalConditie)
                           STRING(@s50),AT(604,2396,2281),USE(Geb:VolledigeNaam)
                           STRING(@d17),AT(604,2594,823,198),USE(Ver2:ConfirmationDate_DATE,,?Ver2:ConfirmationDate_DATE:5)
                           STRING(@N~€~-13`2),AT(6187,52,802,167),USE(Loc:TotaalBedrag),FONT(,8),RIGHT(2)
                           IMAGE,AT(969,1052,1240,1083),USE(?IMAGE2)
                           BOX,AT(10,0,7021,240),USE(?BOX1:4),COLOR(COLOR:Black),LINEWIDTH(1)
                           STRING(@s80),AT(167,531,3333),USE(Loc:DeliveryTerms)
                         END
                       END
                       FOOTER,AT(500,10750,7042,812),USE(?Footer)
                       END
                       FORM,AT(542,479,7000,11083),USE(?Form)
                       END
                     END
    omit('***',WE::CantCloseNowSetHereDone=1)  !Getting Nested omit compile error, then uncheck the "Check for duplicate CantCloseNowSetHere variable declaration" in the WinEvent local template
WE::CantCloseNowSetHereDone equate(1)
WE::CantCloseNowSetHere     long
    !***
ThisWindow           CLASS(ReportManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Init                   PROCEDURE(ProcessClass PC,<REPORT R>,<PrintPreviewClass PV>)
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
OpenReport             PROCEDURE(),BYTE,PROC,DERIVED
PrintReport            PROCEDURE(),DERIVED
TakeEvent              PROCEDURE(),BYTE,PROC,DERIVED
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED
                     END

ThisReport           CLASS(ProcessClass)                   ! Process Manager
TakeRecord             PROCEDURE(),BYTE,PROC,DERIVED
                     END

ProgressMgr          StepLongClass                         ! Progress Manager
Previewer            CLASS(PrintPreviewClass)              ! Print Previewer
Open                   PROCEDURE(),DERIVED
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED
                     END

TargetSelector       ReportTargetSelectorClass             ! Report Target Selector
PDFReporter          CLASS(PDFReportGenerator)             ! PDF
SetUp                  PROCEDURE(),DERIVED
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
  GlobalErrors.SetProcedureName('ReportVerkoopBevestiging')
  Loc:VerkoopID=PVerkoopID
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:ArtikelOmschrijvingExtra.Open                     ! File ArtikelOmschrijvingExtra used by this procedure, so make sure it's RelationManager is open
  Relate:DeliveryTerms.Open                                ! File DeliveryTerms used by this procedure, so make sure it's RelationManager is open
  Relate:Gebruiker.Open                                    ! File Gebruiker used by this procedure, so make sure it's RelationManager is open
  Relate:Verkoop.Open                                      ! File Verkoop used by this procedure, so make sure it's RelationManager is open
  Relate:ViewBetcd.Open                                    ! File ViewBetcd used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(ProgressWindow)                                ! Open window
  WinAlertMouseZoom()
  Do DefineListboxStyle
  INIMgr.Fetch('ReportVerkoopBevestiging',ProgressWindow)  ! Restore window settings from non-volatile store
  TargetSelector.AddItem(PDFReporter.IReportGenerator)
  SELF.AddItem(TargetSelector)
  ProgressMgr.Init(ScrollSort:AllowNumeric,)
  ThisReport.Init(Process:View, Relate:Verkoop, ?Progress:PctText, Progress:Thermometer, ProgressMgr, Ver2:VerkoopID)
  ThisReport.AddSortOrder(Ver2:PK_Verkoop)
  ThisReport.AddRange(Ver2:VerkoopID,Loc:VerkoopID)
  SELF.AddItem(?Progress:Cancel,RequestCancelled)
  SELF.Init(ThisReport,Report,Previewer)
  ?Progress:UserString{PROP:Text} = ''
  Relate:Verkoop.SetQuickScan(1,Propagate:OneMany)
  ProgressWindow{PROP:Timer} = 10                          ! Assign timer interval
  SELF.SkipPreview = False
  Previewer.SetINIManager(INIMgr)
  Previewer.AllowUserZoom = True
  SELF.SetAlerts()
  EnterByTabManager.Init(False)
  RETURN ReturnValue


ThisWindow.Init PROCEDURE(ProcessClass PC,<REPORT R>,<PrintPreviewClass PV>)

  CODE
  PARENT.Init(PC,R,PV)
  WinAlertMouseZoom()


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:ArtikelOmschrijvingExtra.Close
    Relate:DeliveryTerms.Close
    Relate:Gebruiker.Close
    Relate:Verkoop.Close
    Relate:ViewBetcd.Close
  END
  IF SELF.Opened
    INIMgr.Update('ReportVerkoopBevestiging',ProgressWindow) ! Save window data to non-volatile store
  END
  ProgressMgr.Kill()
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.OpenReport PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  SYSTEM{PROP:PrintMode} = 3
  ReturnValue = PARENT.OpenReport()
  IF ReturnValue = Level:Benign
    SELF.Report{PROPPRINT:Extend}=True
  END
  RETURN ReturnValue


ThisWindow.PrintReport PROCEDURE

  CODE
  PARENT.PrintReport
   ! al je print kom je hier 
  if Ver2:BevestigingGeprint_DATE=0
      Ver2:BevestigingGeprint_DATE=today()
      Ver2:BevestigingGeprint_TIME=clock()
      Access:Verkoop.Update()
  END
  


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


ThisReport.TakeRecord PROCEDURE

ReturnValue          BYTE,AUTO

SkipDetails BYTE
  CODE
  ReturnValue = PARENT.TakeRecord()
  Loc:PostcodePlaats=CLIP(AREL:Postcode)&Clip(' '&AREL:Plaats)
  
  Loc:TotaalBedrag+=Pla:KG*Pla:VerkoopKGPrijs
  
  CLEAR(Art2:RECORD)
  Art2:ex_artcode='GB'
  Art2:artcode=Pla:ArtikelID
  IF Access:ArtikelOmschrijvingExtra.Fetch(Art2:PK_ArtikelOmschrijvingExtra)=Level:Benign AND Art2:tekst<>''
      Loc:ArtikelOmschrijving=Art2:tekst
  ELSE
      Loc:ArtikelOmschrijving=Art:ArtikelOms
  END
  
  IF Ver:Description=''
      Loc:VerpakkingOmschrijving=Ver:VerpakkingOmschrijving
  ELSE
      Loc:VerpakkingOmschrijving=Ver:Description
  END
  
  Clear(BTC:Record)
  BTC:betcdID=AREL:PaymentCondition
  if Access:ViewBetCD.Fetch(BTC:ViewBetcd_PK)=Level:Benign
      if BTC:Description=''
          Loc:BetaalConditie=BTC:Omschrijving
      ELSE
          Loc:BetaalConditie=BTC:Description
      END
  END
  
  Clear(DLT:Record)
  DLT:DeliveryTermsID=Ver2:DeliveryTermsID
  If Access:DeliveryTerms.Fetch(DLT:PK_DeliveryTerms)=Level:Benign
      Loc:DeliveryTerms='Delivery Terms: '&DLT:Omschrijving
  END
  
  IF Ver2:GebruikerID<>0
      Clear(GEB:Record)
      Geb:ID=Ver2:GebruikerID
      Access:Gebruiker.Fetch(Geb:PK_Gebruiker)   
      SetTarget(REPORT)
      ?IMAGE2{Prop:Text}=Geb:Handtekening
      SetTarget()
  END
  
  Loc:Voettekst='1* I am please to confirm our sale/ your purchase as per this confirmation. Our terms and conditions apply to this contract.  '&|
      'products deliverd by Ven Poultry are coming from companies who are GFSI certified, however not exclusively IFS'&|
      '<13><10> '&|
      '<13><10> '&|
      '2*  I am please to confirm our sale/ your purchase as per this confirmation. Our terms and conditions apply to this contract.  '&|
      'products deliverd by Ven Poultry are coming from companies who are IFS certified. '&|
      '<13><10> '&|
      '<13><10> '&|
      '3*  I am please to confirm our sale/ your purchase as per this confirmation. Our terms and conditions apply to this contract. '&|
      'products deliverd by Ven Poultry are coming from companies who are not IFS or GFSI certified, but are checked and screened so  '&|
      'that we can insure the quality of the delivered products. '&|
      '<13><10> '&|
      '<13><10> '&|
      'If not agreed, please contact us within 24 hours. '
          
  PRINT(RPT:Detail)
  RETURN ReturnValue


Previewer.Open PROCEDURE

  CODE
  PARENT.Open
    !Find equate for the toolbar
    Findtoolbar#= 0
    loop
      Findtoolbar#= target{prop:nextfield,Findtoolbar#}
      if Findtoolbar# = 0 then break.
      if Findtoolbar#{prop:type} = create:toolbar then break.
    end
    ! MailButton
    Loc:MailButtonID=CREATE(0,CREATE:Button,Findtoolbar#)
    Loc:MailButtonID{prop:msg}       = 'Printvoorbeeld emailen'
    Loc:MailButtonID{Prop:Icon}      = '~Send.ico'
    Loc:MailButtonID{Prop:Flat}     = true
    Loc:MailButtonID{Prop:Text}     = ''
  
    Setposition(Loc:MailButtonID,4,2,32,32)   ! Mail-button weer voorraan zetten
    UNHIDE(Loc:MailButtonID)
    DISPLAY(Loc:MailButtonID)
  
    if Findtoolbar# > 0 then
      Controls# = 0
      loop
        Controls#= target{prop:nextfield,Controls#}
        if Controls# = 0 then break.
        ! De controls van de toolbar verplaatsen (behalve de mailbutton). Controls met een hoge equate zijn ondersteunde controls van de listbox? (i.i.g. niet verplaatsen)
        if Controls#{prop:parent} = Findtoolbar# AND Controls# <> Loc:MailButtonID AND Controls# < 30000 THEN
          HIDE(Controls#)
          SetPosition(Controls#, Controls#{PROP:XPos} + 34,Controls#{PROP:YPos}, Controls#{PROP:Width} , Controls#{PROP:Height})
          UNHIDE(Controls#)
          DISPLAY(Controls#)
        end
      end
     end


Previewer.TakeAccepted PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  I#=1 ! hier een debugpunt maken
  ReturnValue = PARENT.TakeAccepted()
    IF FIELD()=Loc:MailButtonID
       Loc:SavePath=Clip(Path())
       if not(Records(Self.ImageQueue)) then
          Message('Er is niet om gestuurd te worden')
          Return Level:Fatal
       end
       Loc:Commando=GetIni('Mail','wmf2pdf','wmf2pdf.exe',path()&'\mail.ini')
       Loc:TMPDirectory=''
       ! kijken wat de tijdelijke directory is van de wmf bestanden
       !Message(GETTEMPPATH()&Shortpath('SalesConfirmation' &'.pdf'))
       !PDFReporter.SetFileName(GETTEMPPATH()&Shortpath('SalesConfirmation' &'.pdf'))
       Loc:PDFFileName=GETTEMPPATH()&Shortpath('SalesConfirmation' &'.pdf')
       ThisWindow.SetReportTarget(PDFReporter.IReportGenerator)
       Previewer.OnSaveAs()  
       
        IF FALSE
       Loop i#=1 to Records(Self.ImageQueue)
         Get(Self.ImageQueue,i#)
         if not error()
            if Loc:TMPDirectory=''
               Loop j#=Len(Clip(Self.ImageQueue.FileName)) to 1 by -1
                  if Sub(Clip(Self.ImageQueue.FileName),j#,1)='\'
                     Loc:TMPDirectory=Sub(Clip(Self.ImageQueue.FileName),1,j#)
                     Break
                   end
               end
               Loc:TmpAtt='"'&Clip(Loc:TMPDirectory)&Shortpath('SalesConfirmation' &'.pdf')&'"'
                IF Records(Self.ImageQueue) <= 200
                  Loc:Commando=Clip(Loc:Commando)& ' Output='& Clip(Loc:TmpAtt) &' Input="'&Clip(Self.ImageQueue.FileName)
                ELSE
                   Ini"=Today()&'.'&Clock()
                   Loc:Commando=Clip(Loc:Commando)& ' Output='& Clip(Loc:TmpAtt) &' Ini='&path()&'\'&Ini"&'"'
                   PUTINI('Export','Totaal',Records(Self.ImageQueue),path()&'\'&Ini")
                   PUTINI('Export',i#,Clip(Self.ImageQueue.FileName),path()&'\'&Ini")
                END
            else
                IF Records(Self.ImageQueue) <= 200
                   Loc:Commando=Clip(Loc:Commando)& ';'& Clip(Self.ImageQueue.FileName)
                ELSE
                   PUTINI('Export',i#,Clip(Self.ImageQueue.FileName),path()&'\'&Ini")
                END
            end
         end
       end
        END
        Loc:Commando='wmf2pdf.exe output="'&Loc:PDFFileName
        
       IF Loc:LandscapeOverride THEN
          IF Loc:Landscape THEN
              Loc:Commando=Clip(Loc:Commando)& '" Landscape'
          ELSE
              Loc:Commando=Clip(Loc:Commando)& '"'
          END
       ELSE
          IF Report{PROP:Landscape} THEN
              Loc:Commando=Clip(Loc:Commando)& '" Landscape'
          ELSE
              Loc:Commando=Clip(Loc:Commando)& '"'
          END
       END
  
       Loc:Commando=Clip(Loc:Commando)& ' Subject="'& 'SalesConfirmation' &'"'
       ! Message(Loc:Commando)
       !Loc:Commando=Clip(Loc:Commando)& ' To="'& &'"'
       Run(Loc:Commando,1)
       ! al je mailt kom je hier 
       if Ver2:BevestigingGeprint_DATE=0
           Ver2:BevestigingGeprint_DATE=today()
           Ver2:BevestigingGeprint_TIME=clock()
           Access:Verkoop.Update()
       END
       
  
       if path()<>Loc:SavePath
          setpath(Loc:SavePath)
          if error() then stop(Error()&'  bij het terugzetten van het path').
       end
  
       POST(Event:CloseDown)
    END
  RETURN ReturnValue


PDFReporter.SetUp PROCEDURE

  CODE
  PARENT.SetUp
  !
  SELF.SetFileName(Loc:PDFFileName)
  SELF.SetDocumentInfo('CW Report','VoorrRpt','ReportVerkoopBevestiging','ReportVerkoopBevestiging','','')
  SELF.SetPagesAsParentBookmark(False)
  SELF.SetScanCopyMode(False)
  SELF.CompressText   = True
  SELF.CompressImages = True

!!! <summary>
!!! Generated from procedure template - Process
!!! </summary>
ReportMutaties PROCEDURE 

Progress:Thermometer BYTE                                  ! 
Loc:DatumVanaf       DATE                                  ! 
Loc:DatumTM          DATE                                  ! 
Process:View         VIEW(Mutatie)
                       PROJECT(Mut:InslagKG)
                       PROJECT(Mut:InslagPallet)
                       PROJECT(Mut:RedenAfboeking)
                       PROJECT(Mut:SoortMutatie)
                       PROJECT(Mut:UitslagKG)
                       PROJECT(Mut:UitslagPallet)
                       PROJECT(Mut:ArtikelID)
                       PROJECT(Mut:CelID)
                       PROJECT(Mut:CelLocatieID)
                       JOIN(Art:Artikel_PK,Mut:ArtikelID)
                       END
                       JOIN(CEL:CEL_PK,Mut:CelID)
                       END
                       JOIN(CL:PK_CelLocatie,Mut:CelLocatieID)
                       END
                     END
LocEnableEnterByTab  BYTE(1)                               !Used by the ENTER Instead of Tab template
EnterByTabManager    EnterByTabClass
ProgressWindow       WINDOW('Progress...'),AT(,,142,100),DOUBLE,CENTER,GRAY,TIMER(1)
                       PROGRESS,AT(15,15,111,12),USE(Progress:Thermometer),RANGE(0,100)
                       STRING(''),AT(0,3,141,10),USE(?Progress:UserString),CENTER
                       STRING(''),AT(0,30,141,10),USE(?Progress:PctText),CENTER
                       PROMPT('Datum Vanaf:'),AT(15,44),USE(?Loc:DatumVanaf:Prompt)
                       SPIN(@d17),AT(72,43,60,10),USE(Loc:DatumVanaf)
                       PROMPT('Datum tot en met:'),AT(16,58),USE(?Loc:DatumTM:Prompt)
                       SPIN(@d17),AT(72,57,60,10),USE(Loc:DatumTM)
                       BUTTON('Pause'),AT(15,78),USE(?Pause)
                       BUTTON('Cancel'),AT(82,78,50,15),USE(?Progress:Cancel)
                     END

    omit('***',WE::CantCloseNowSetHereDone=1)  !Getting Nested omit compile error, then uncheck the "Check for duplicate CantCloseNowSetHere variable declaration" in the WinEvent local template
WE::CantCloseNowSetHereDone equate(1)
WE::CantCloseNowSetHere     long
    !***
ThisWindow           CLASS(ReportManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Init                   PROCEDURE(ProcessClass PC,<REPORT R>,<PrintPreviewClass PV>)
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
Paused                 BYTE
Timer                  LONG
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED
TakeEvent              PROCEDURE(),BYTE,PROC,DERIVED
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED
                     END

ThisProcess          CLASS(ProcessClass)                   ! Process Manager
Kill                   PROCEDURE(),DERIVED
TakeRecord             PROCEDURE(),BYTE,PROC,DERIVED
                     END

ProgressMgr          StepLongClass                         ! Progress Manager
ExcelClass         Class
InitOle                 Procedure()
MaakExcel               Procedure()
OpenExcel               Procedure(String)
SluitExcel              Procedure(Byte)
BepaalKolom             Procedure(LONG),String
SchrijfExcel            Procedure(String, LONG, String)
MaakWerkBlad            Procedure(<String>)
                   End
Loc:Ole            CString(21)
Loc:Rij            Long
Loc:OleInit        Byte


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
  GlobalErrors.SetProcedureName('ReportMutaties')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('Loc:DatumVanaf',Loc:DatumVanaf)                    ! Added by: Process
  BIND('Loc:DatumTM',Loc:DatumTM)                          ! Added by: Process
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:Mutatie.Open                                      ! File Mutatie used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(ProgressWindow)                                ! Open window
  Loc:DatumTM=today()
  Loc:DatumVanaf=Date(01,01,Year(TODAY()))
  WinAlertMouseZoom()
  Do DefineListboxStyle
  INIMgr.Fetch('ReportMutaties',ProgressWindow)            ! Restore window settings from non-volatile store
  ProgressWindow{Prop:Timer} = 10                          ! Assign timer interval
  ProgressMgr.Init(ScrollSort:AllowNumeric,)
  ThisProcess.Init(Process:View, Relate:Mutatie, ?Progress:PctText, Progress:Thermometer, ProgressMgr, Mut:MutatieID)
  ThisProcess.AddSortOrder(Mut:Mutatie_PK)
  ProgressWindow{Prop:Text} = 'Processing Records'
  ?Progress:PctText{Prop:Text} = '0% Completed'
  SELF.Init(ThisProcess)
  ?Progress:UserString{Prop:Text}='Export mutaties'
  SELF.AddItem(?Progress:Cancel, RequestCancelled)
  SEND(Mutatie,'QUICKSCAN=on')
  SEND(ViewArtikel,'QUICKSCAN=on')
  SEND(CelLocatie,'QUICKSCAN=on')
  ASSERT(~SELF.DeferWindow) ! A hidden Go button is not smart ...
  SELF.KeepVisible = 1
  SELF.DeferOpenReport = 1
  SELF.Timer = TARGET{PROP:Timer}
  TARGET{PROP:Timer} = 0
  ?Pause{PROP:Text} = 'Start'
  SELF.Paused = 1
  ?Progress:Cancel{PROP:Key} = EscKey
  SELF.SetAlerts()
  EnterByTabManager.Init(False)
  RETURN ReturnValue


ThisWindow.Init PROCEDURE(ProcessClass PC,<REPORT R>,<PrintPreviewClass PV>)

  CODE
  PARENT.Init(PC,R,PV)
  WinAlertMouseZoom()


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
        ThisNetRefresh.Send('|Mutatie|') ! NetTalk (NetRefresh)
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:Mutatie.Close
  END
  IF SELF.Opened
    INIMgr.Update('ReportMutaties',ProgressWindow)         ! Save window data to non-volatile store
  END
  ProgressMgr.Kill()
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
    CASE ACCEPTED()
    OF ?Pause
      IF SELF.Paused
        TARGET{PROP:Timer} = SELF.Timer
        ?Pause{PROP:Text} = 'Pause'
      ELSE
        SELF.Timer = TARGET{PROP:Timer}
        TARGET{PROP:Timer} = 0
        ?Pause{PROP:Text} = 'Restart'
      END
      SELF.Paused = 1 - SELF.Paused
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?Pause
      ThisWindow.Update()
        ThisProcess.SetFilter('Mut:DatumTijd_DATE >=Loc:DatumVanaf AND Mut:DatumTijd_DATE <=Loc:DatumTM')
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
    OF EVENT:OpenWindow
        WE::CantCloseNow += 1
        WE::CantCloseNowSetHere = 1
    OF EVENT:Timer
      IF SELF.Paused THEN RETURN Level:Benign .
    END
  ReturnValue = PARENT.TakeWindowEvent()
    CASE EVENT()
    OF EVENT:CloseWindow
      if WE::CantCloseNow > 0 and ReturnValue = Level:Benign and WE::CantCloseNowSetHere
        WE::CantCloseNow -= 1
        WE::CantCloseNowSetHere = 0
      end
    OF EVENT:OpenWindow
        post(event:visibleondesktop)
    END
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue

ExcelClass.SchrijfExcel         Procedure(String PRM:Kolom,LONG PRM:Rij, String PRM:Value)
   Code
   Loc:Ole{'Application.Range('&Clip(PRM:Kolom)&Prm:Rij&').Value'}=PRM:Value
   RETURN
ExcelClass.MaakWerkBlad         Procedure(<String PRM:WerkBladNaam>)
   Code
   Loc:Ole{'Application.ActiveWorkBook.Sheets.Add'}
   IF PRM:WerkBladNaam<>''
    Loc:Ole{'Application.ActiveWorkBook.ActiveSheet.Name'}=Clip(PRM:WerkBladNaam)
   End
   ! Loc:Ole{'Application.ActiveWorkBook.Sheets.Select'}
   RETURN
ExcelClass.BepaalKolom    Procedure(LONG PRM:Kolom )
PRM:KolomString  string(3)
Loc:TweedeLetter    Long
Loc:EersteLetter    Long
    CODE
    PRM:Kolom-=1
    Loc:TweedeLetter=PRM:Kolom  % 26
    Loc:EersteLetter=Int(PRM:Kolom /26)

    if Loc:EersteLetter<>0
       PRM:KolomString[1]=Chr(64+Loc:EersteLetter)       ! chr(65)= 'A'
       PRM:KolomString[2]=Chr(65+Loc:TweedeLetter)
    Else
       PRM:KolomString[1]=Chr(65+Loc:TweedeLetter)
    End

    RETURN(PRM:KolomString)
ExcelClass.InitOle     Procedure
    code
    Loc:Ole  = Create(0,Create:Ole)
    Loc:Ole{Prop:Create}='Excel.Application'

    Loc:Ole{Prop:DoVerb}=1                               !  dit doet iedereen dus ik ook
    Loc:Ole{'Application.WindowState'}=1                 !  maximaliseer scherm
    Loc:Ole{'Application.Visible'}=True ! nu pas excel laten zien
    RETURN
ExcelClass.MaakExcel       Procedure
    CODE
    Loc:Ole{'Application.Workbooks.Add'}            ! leeg worksheet openen
    RETURN
ExcelClass.OpenExcel       Procedure(String prm:Bestandsnaam)
    Code
    Loc:Ole{'Application.Workbooks.Open ("'&prm:Bestandsnaam&'")'}           ! leeg worksheet openen
    RETURN
ExcelClass.SluitExcel       Procedure(Byte PRM:Close)
   Code
   If PRM:Close
       Loc:Ole{'Application.Workbooks.Close'}
   END     
   Loc:Ole{'Application.Visible'}=true  ! nu pas excel laten zien
   Loc:Ole{'Prop:Deactivate'}
   Destroy(Loc:Ole)
   RETURN

ThisProcess.Kill PROCEDURE

  CODE
      ExcelClass.SluitExcel(FALSE)
  PARENT.Kill


ThisProcess.TakeRecord PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  IF Loc:OleInit=FALSE
      Loc:OleInit=TRUE
      ExcelClass.InitOle()
      ExcelClass.MaakExcel()
      Loc:Rij=1
      ExcelClass.SchrijfExcel('A',Loc:Rij,'Datum')
      ExcelClass.SchrijfExcel('B',Loc:Rij,'ArtikelID')
      ExcelClass.SchrijfExcel('C',Loc:Rij,'ArtikelOms')
      ExcelClass.SchrijfExcel('D',Loc:Rij,'PartijID')
      ExcelClass.SchrijfExcel('E',Loc:Rij,'Cel')
      ExcelClass.SchrijfExcel('F',Loc:Rij,'Locatie')
      ExcelClass.SchrijfExcel('G',Loc:Rij,'Inslag KG')
      ExcelClass.SchrijfExcel('H',Loc:Rij,'Inslag Pallet')
      ExcelClass.SchrijfExcel('I',Loc:Rij,'Uitslag KG')
      ExcelClass.SchrijfExcel('J',Loc:Rij,'Uitslag Pallet')
      ExcelClass.SchrijfExcel('K',Loc:Rij,'Soort mutatie')
      ExcelClass.SchrijfExcel('L',Loc:Rij,'Reden afboeking')
  END
  Loc:Rij+=1
  ExcelClass.SchrijfExcel('A',Loc:Rij,Mut:DatumTijd_DATE-36161)
  Loc:Ole{'Application.Range(A'&Loc:Rij&').NumberFormat'}='dd/mm/jjjj'
  ExcelClass.SchrijfExcel('B',Loc:Rij,Mut:ArtikelID)
  ExcelClass.SchrijfExcel('C',Loc:Rij,Art:ArtikelOms)
  ExcelClass.SchrijfExcel('D',Loc:Rij,Mut:PartijID)
  ExcelClass.SchrijfExcel('E',Loc:Rij,CEL:CelOms)
  ExcelClass.SchrijfExcel('F',Loc:Rij,CL:Locatienaam)
  ExcelClass.SchrijfExcel('G',Loc:Rij,Mut:InslagKG)
  ExcelClass.SchrijfExcel('H',Loc:Rij,Mut:InslagPallet)
  ExcelClass.SchrijfExcel('I',Loc:Rij,Mut:UitslagKG)
  ExcelClass.SchrijfExcel('J',Loc:Rij,Mut:UitslagPallet)
  ExcelClass.SchrijfExcel('K',Loc:Rij,Mut:SoortMutatie)
  ExcelClass.SchrijfExcel('L',Loc:Rij,Mut:RedenAfboeking)
  
  
  ReturnValue = PARENT.TakeRecord()
  RETURN ReturnValue

!!! <summary>
!!! Generated from procedure template - Process
!!! </summary>
ReportActieAfwijkingen PROCEDURE 

Progress:Thermometer BYTE                                  ! 
Loc:DatumVanaf       DATE                                  ! 
Loc:DatumTM          DATE                                  ! 
Loc:ExportQ          QUEUE,PRE(LEQ)                        ! 
Datum                DATE                                  ! 
PartijID             LONG                                  ! 
ArtikelID            CSTRING(31)                           ! 
ArtikelOmschrijving  CSTRING(61)                           ! 
ActieAfwijkingen     CSTRING(2001)                         ! 
CorrigerendeMaatregel CSTRING(2001)                        ! 
CorrectieveMaatregel CSTRING(2001)                         ! 
Afgehandeld          CSTRING(2001)                         ! 
Soort                CSTRING(21)                           ! 
Leverancier_Klant    CSTRING(51)                           ! 
                     END                                   ! 
Process:View         VIEW(Versie)
                     END
LocEnableEnterByTab  BYTE(1)                               !Used by the ENTER Instead of Tab template
EnterByTabManager    EnterByTabClass
ProgressWindow       WINDOW('Progress...'),AT(,,142,100),DOUBLE,CENTER,GRAY,TIMER(1)
                       PROGRESS,AT(15,15,111,12),USE(Progress:Thermometer),RANGE(0,100)
                       STRING(''),AT(0,3,141,10),USE(?Progress:UserString),CENTER
                       STRING(''),AT(0,30,141,10),USE(?Progress:PctText),CENTER
                       PROMPT('Datum Vanaf:'),AT(15,44),USE(?Loc:DatumVanaf:Prompt)
                       SPIN(@d17),AT(72,43,60,10),USE(Loc:DatumVanaf)
                       PROMPT('Datum tot en met:'),AT(16,58),USE(?Loc:DatumTM:Prompt)
                       SPIN(@d17),AT(72,57,60,10),USE(Loc:DatumTM)
                       BUTTON('Pause'),AT(15,78),USE(?Pause)
                       BUTTON('Cancel'),AT(82,78,50,15),USE(?Progress:Cancel)
                     END

    omit('***',WE::CantCloseNowSetHereDone=1)  !Getting Nested omit compile error, then uncheck the "Check for duplicate CantCloseNowSetHere variable declaration" in the WinEvent local template
WE::CantCloseNowSetHereDone equate(1)
WE::CantCloseNowSetHere     long
    !***
ThisWindow           CLASS(ReportManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Init                   PROCEDURE(ProcessClass PC,<REPORT R>,<PrintPreviewClass PV>)
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
Paused                 BYTE
Timer                  LONG
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED
TakeEvent              PROCEDURE(),BYTE,PROC,DERIVED
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED
                     END

ThisProcess          CLASS(ProcessClass)                   ! Process Manager
Kill                   PROCEDURE(),DERIVED
TakeRecord             PROCEDURE(),BYTE,PROC,DERIVED
                     END

ProgressMgr          StepRealClass                         ! Progress Manager
ExcelClass         Class
InitOle                 Procedure()
MaakExcel               Procedure()
OpenExcel               Procedure(String)
SluitExcel              Procedure(Byte)
BepaalKolom             Procedure(LONG),String
SchrijfExcel            Procedure(String, LONG, String)
MaakWerkBlad            Procedure(<String>)
                   End
Loc:Ole            CString(21)
Loc:Rij            Long
Loc:OleInit        Byte


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
  GlobalErrors.SetProcedureName('ReportActieAfwijkingen')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('Loc:DatumVanaf',Loc:DatumVanaf)                    ! Added by: Process
  BIND('Loc:DatumTM',Loc:DatumTM)                          ! Added by: Process
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:Mutatie.Open                                      ! File Mutatie used by this procedure, so make sure it's RelationManager is open
  Relate:Partij.Open                                       ! File Partij used by this procedure, so make sure it's RelationManager is open
  Relate:Planning.SetOpenRelated()
  Relate:Planning.Open                                     ! File Planning used by this procedure, so make sure it's RelationManager is open
  Relate:Versie.Open                                       ! File Versie used by this procedure, so make sure it's RelationManager is open
  Relate:ViewArtikel.Open                                  ! File ViewArtikel used by this procedure, so make sure it's RelationManager is open
  Access:Verkoop.UseFile                                   ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:Relatie.UseFile                                   ! File referenced in 'Other Files' so need to inform it's FileManager
  SELF.FilesOpened = True
  SELF.Open(ProgressWindow)                                ! Open window
  Loc:DatumTM=today()
  Loc:DatumVanaf=Date(01,01,Year(TODAY()))
  WinAlertMouseZoom()
  Do DefineListboxStyle
  ProgressWindow{Prop:Timer} = 10                          ! Assign timer interval
  ProgressMgr.Init(ScrollSort:AllowNumeric,)
  ThisProcess.Init(Process:View, Relate:Versie, ?Progress:PctText, Progress:Thermometer, ProgressMgr, VRS:Versie)
  ThisProcess.AddSortOrder(VRS:Versie_PK)
  ThisProcess.AddRange(VRS:Versie,GLO:Versie)
  ProgressWindow{Prop:Text} = 'Processing Records'
  ?Progress:PctText{Prop:Text} = '0% Completed'
  SELF.Init(ThisProcess)
  ?Progress:UserString{Prop:Text}='ActieAfwijkingen'
  SELF.AddItem(?Progress:Cancel, RequestCancelled)
  SEND(Versie,'QUICKSCAN=on')
  ASSERT(~SELF.DeferWindow) ! A hidden Go button is not smart ...
  SELF.KeepVisible = 1
  SELF.DeferOpenReport = 1
  SELF.Timer = TARGET{PROP:Timer}
  TARGET{PROP:Timer} = 0
  ?Pause{PROP:Text} = 'Start'
  SELF.Paused = 1
  ?Progress:Cancel{PROP:Key} = EscKey
  SELF.SetAlerts()
  EnterByTabManager.Init(False)
  RETURN ReturnValue


ThisWindow.Init PROCEDURE(ProcessClass PC,<REPORT R>,<PrintPreviewClass PV>)

  CODE
  PARENT.Init(PC,R,PV)
  WinAlertMouseZoom()


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
        ThisNetRefresh.Send('|Versie|') ! NetTalk (NetRefresh)
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:Mutatie.Close
    Relate:Partij.Close
    Relate:Planning.Close
    Relate:Versie.Close
    Relate:ViewArtikel.Close
  END
  ProgressMgr.Kill()
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
    CASE ACCEPTED()
    OF ?Pause
      IF SELF.Paused
        TARGET{PROP:Timer} = SELF.Timer
        ?Pause{PROP:Text} = 'Pause'
      ELSE
        SELF.Timer = TARGET{PROP:Timer}
        TARGET{PROP:Timer} = 0
        ?Pause{PROP:Text} = 'Restart'
      END
      SELF.Paused = 1 - SELF.Paused
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?Pause
      ThisWindow.Update()
       ! ThisProcess.SetFilter('Par:AanmaakDatum_DATE >=Loc:DatumVanaf AND Par:AanmaakDatum_DATE <=Loc:DatumTM AND NOT Par:InslagQAActieAfwijkingen=<39><39>')
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
    OF EVENT:OpenWindow
        WE::CantCloseNow += 1
        WE::CantCloseNowSetHere = 1
    OF EVENT:Timer
      IF SELF.Paused THEN RETURN Level:Benign .
    END
  ReturnValue = PARENT.TakeWindowEvent()
    CASE EVENT()
    OF EVENT:CloseWindow
      if WE::CantCloseNow > 0 and ReturnValue = Level:Benign and WE::CantCloseNowSetHere
        WE::CantCloseNow -= 1
        WE::CantCloseNowSetHere = 0
      end
    OF EVENT:OpenWindow
        post(event:visibleondesktop)
    END
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue

ExcelClass.SchrijfExcel         Procedure(String PRM:Kolom,LONG PRM:Rij, String PRM:Value)
   Code
   Loc:Ole{'Application.Range('&Clip(PRM:Kolom)&Prm:Rij&').Value'}=PRM:Value
   RETURN
ExcelClass.MaakWerkBlad         Procedure(<String PRM:WerkBladNaam>)
   Code
   Loc:Ole{'Application.ActiveWorkBook.Sheets.Add'}
   IF PRM:WerkBladNaam<>''
    Loc:Ole{'Application.ActiveWorkBook.ActiveSheet.Name'}=Clip(PRM:WerkBladNaam)
   End
   ! Loc:Ole{'Application.ActiveWorkBook.Sheets.Select'}
   RETURN
ExcelClass.BepaalKolom    Procedure(LONG PRM:Kolom )
PRM:KolomString  string(3)
Loc:TweedeLetter    Long
Loc:EersteLetter    Long
    CODE
    PRM:Kolom-=1
    Loc:TweedeLetter=PRM:Kolom  % 26
    Loc:EersteLetter=Int(PRM:Kolom /26)

    if Loc:EersteLetter<>0
       PRM:KolomString[1]=Chr(64+Loc:EersteLetter)       ! chr(65)= 'A'
       PRM:KolomString[2]=Chr(65+Loc:TweedeLetter)
    Else
       PRM:KolomString[1]=Chr(65+Loc:TweedeLetter)
    End

    RETURN(PRM:KolomString)
ExcelClass.InitOle     Procedure
    code
    Loc:Ole  = Create(0,Create:Ole)
    Loc:Ole{Prop:Create}='Excel.Application'

    Loc:Ole{Prop:DoVerb}=1                               !  dit doet iedereen dus ik ook
    Loc:Ole{'Application.WindowState'}=1                 !  maximaliseer scherm
    Loc:Ole{'Application.Visible'}=True ! nu pas excel laten zien
    RETURN
ExcelClass.MaakExcel       Procedure
    CODE
    Loc:Ole{'Application.Workbooks.Add'}            ! leeg worksheet openen
    RETURN
ExcelClass.OpenExcel       Procedure(String prm:Bestandsnaam)
    Code
    Loc:Ole{'Application.Workbooks.Open ("'&prm:Bestandsnaam&'")'}           ! leeg worksheet openen
    RETURN
ExcelClass.SluitExcel       Procedure(Byte PRM:Close)
   Code
   If PRM:Close
       Loc:Ole{'Application.Workbooks.Close'}
   END     
   Loc:Ole{'Application.Visible'}=true  ! nu pas excel laten zien
   Loc:Ole{'Prop:Deactivate'}
   Destroy(Loc:Ole)
   RETURN

ThisProcess.Kill PROCEDURE

  CODE
     Loc:Ole{'Application.Columns(A:J).AutoFit'}
     Loc:Ole{'Application.Rows(1:'&Loc:Rij&').AutoFit'}
      ExcelClass.SluitExcel(FALSE)
  PARENT.Kill


ThisProcess.TakeRecord PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  IF Loc:OleInit=FALSE
      Loc:OleInit=TRUE
      ExcelClass.InitOle()
      ExcelClass.MaakExcel()
      Loc:Rij=1
      ExcelClass.SchrijfExcel('A',Loc:Rij,'Aanmaakdatum')
      ExcelClass.SchrijfExcel('B',Loc:Rij,'ArtikelID')
      ExcelClass.SchrijfExcel('C',Loc:Rij,'ArtikelOms')
      ExcelClass.SchrijfExcel('D',Loc:Rij,'Soort')
      ExcelClass.SchrijfExcel('E',Loc:Rij,'Leverancier')
      ExcelClass.SchrijfExcel('F',Loc:Rij,'PartijID')
      ExcelClass.SchrijfExcel('G',Loc:Rij,'Actie Afwijkingen')
      ExcelClass.SchrijfExcel('H',Loc:Rij,'Correctieve maatregel')
      ExcelClass.SchrijfExcel('I',Loc:Rij,'Corrigerende maatregel')
      ExcelClass.SchrijfExcel('J',Loc:Rij,'Afgehandeld')
  END
  Free(Loc:ExportQ)
  ! Partijen doorlopen
  Clear(Par:Record)
  Set(Par:Partij_PK,Par:Partij_PK)
  Partij{Prop:Where}='AanmaakDatum >=<39>'&Format(Loc:DatumVanaf,@D10-)&' 00:00:00<39> AND AanmaakDatum <=<39>'&Format(Loc:DatumTM,@D10-)&' 00:00:00<39> AND NOT InslagQAActieAfwijkingen=<39><39>'
  Loop until Access:Partij.Next()
      LEQ:Datum=Par:AanmaakDatum_DATE
      LEQ:PartijID=Par:PartijID
      LEQ:ArtikelID=Par:ArtikelID
      Clear(Art:Record)
      Art:ArtikelID=Par:ArtikelID
      IF Access:ViewArtikel.Fetch(Art:Artikel_PK)=Level:Benign
          LEQ:ArtikelOmschrijving=Art:ArtikelOms
      ELSE
          LEQ:ArtikelOmschrijving=''
      END
      LEQ:ActieAfwijkingen=Par:InslagQAActieAfwijkingen
      LEQ:CorrigerendeMaatregel=Par:CorrigerendeMaatregel
      LEQ:Afgehandeld=Par:Afgehandeld
      LEQ:CorrectieveMaatregel=Par:CorrectieveMaatregel
      LEQ:Soort='Inslag'
      Clear(Rel:Record)
      Rel:RelatieID=Par:Leverancier
      IF Access:Relatie.Fetch(Rel:Relatie_PK)=Level:Benign
          LEQ:Leverancier_Klant=Rel:FirmaNaam
      ELSE
          LEQ:Leverancier_Klant=''
      END
      
      Add(Loc:ExportQ)
  END
  
  ! mutaties doorlopen
  Clear(MUT:Record)
  Set(Mut:Mutatie_PK,Mut:Mutatie_PK)
  Mutatie{Prop:Where}='DatumTijd >=<39>'&Format(Loc:DatumVanaf,@D10-)&' 00:00:00<39> AND DatumTijd <=<39>'&Format(Loc:DatumTM,@D10-)&' 00:00:00<39> AND NOT UitslagQAActieAfwijkingen=<39><39>'
  Loop until Access:Mutatie.Next()
      LEQ:Datum=Mut:DatumTijd_DATE
      LEQ:PartijID=Mut:PartijID
      LEQ:ArtikelID=Mut:ArtikelID
      Clear(Art:Record)
      Art:ArtikelID=Mut:ArtikelID
      IF Access:ViewArtikel.Fetch(Art:Artikel_PK)=Level:Benign
          LEQ:ArtikelOmschrijving=Art:ArtikelOms
      ELSE
          LEQ:ArtikelOmschrijving=''
      END
      LEQ:ActieAfwijkingen=Mut:UitslagQAActieAfwijkingen
      LEQ:CorrigerendeMaatregel=Mut:CorrigerendeMaatregel
      LEQ:Afgehandeld=Mut:Afgehandeld
      LEQ:CorrectieveMaatregel=Mut:CorrectieveMaatregel
      LEQ:Soort='Uitslag'
      LEQ:Leverancier_Klant=''
      Clear(Pla:Record)
      Pla:PlanningID=Mut:PlanningID
      IF Access:Planning.Fetch(Pla:PK_Planning)=Level:Benign
          Clear(Ver2:Record)
          Ver2:VerkoopID=Pla:VerkoopID
          IF Access:Verkoop.Fetch(Ver2:PK_Verkoop)=Level:Benign
             Clear(Rel:Record)
             Rel:RelatieID=Ver2:Klant
             IF Access:Relatie.Fetch(Rel:Relatie_PK)=Level:Benign
                  LEQ:Leverancier_Klant=Rel:FirmaNaam
              END
          END
      END
      Add(Loc:ExportQ)
  END
  
  !Sort(Loc:ExportQ,+LEQ:Datum)
  Loop i#=1 TO Records(Loc:ExportQ)
      GET(Loc:ExportQ,i#)
      Loc:Rij+=1
      ExcelClass.SchrijfExcel('A',Loc:Rij,LEQ:Datum-36161)
      Loc:Ole{'Application.Range(A'&Loc:Rij&').NumberFormat'}='dd/mm/jjjj'
      ExcelClass.SchrijfExcel('B',Loc:Rij,LEQ:ArtikelID)
      ExcelClass.SchrijfExcel('C',Loc:Rij,LEQ:ArtikelOmschrijving)
      ExcelClass.SchrijfExcel('D',Loc:Rij,LEQ:Soort)
      ExcelClass.SchrijfExcel('E',Loc:Rij,LEQ:Leverancier_Klant)
      ExcelClass.SchrijfExcel('F',Loc:Rij,LEQ:PartijID)
      ExcelClass.SchrijfExcel('G',Loc:Rij,LEQ:ActieAfwijkingen)
      ExcelClass.SchrijfExcel('H',Loc:Rij,LEQ:CorrectieveMaatregel)
      ExcelClass.SchrijfExcel('I',Loc:Rij,LEQ:CorrigerendeMaatregel)
      ExcelClass.SchrijfExcel('J',Loc:Rij,LEQ:Afgehandeld)
      
  END
  
  !Return Record:OutOfRange
  ReturnValue = PARENT.TakeRecord()
  RETURN ReturnValue

!!! <summary>
!!! Generated from procedure template - Report
!!! </summary>
ReportInkoopBevestiging PROCEDURE (LONG pVerkoopID)

Progress:Thermometer BYTE                                  ! 
Loc:ArtikelOmschrijving STRING(260)                        ! 
Loc:VerkoopID        LONG                                  ! 
Loc:PostcodePlaats   STRING(50)                            ! 
Loc:VerpakkingOmschrijving CSTRING(50)                     ! 
Loc:BetaalConditie   CSTRING(51)                           ! 
Loc:DeliveryTerms    CSTRING(81)                           ! 
Loc:TotaalBedrag     DECIMAL(9,2)                          ! 
Loc:Voettekst        CSTRING(1000)                         ! 
Loc:SavePath         STRING(255)                           ! 
Loc:TMPDirectory     STRING(255)                           ! 
Loc:Commando         CSTRING(10000)                        ! 
Loc:TmpAtt           STRING(255)                           ! 
Loc:Landscape        BYTE                                  ! 
Loc:LandscapeOverride BYTE                                 ! 
Loc:MailButtonID     LONG                                  ! 
Loc:PDFFileName      CSTRING(1001)                         ! 
Process:View         VIEW(Inkoop)
                       PROJECT(Ink:ConfirmationDate_DATE)
                       PROJECT(Ink:InkoopID)
                       PROJECT(Ink:LoadingDate)
                       PROJECT(Ink:Leverancier)
                       JOIN(Rel:Relatie_PK,Ink:Leverancier)
                         PROJECT(Rel:Adres1)
                         PROJECT(Rel:Country)
                         PROJECT(Rel:FirmaNaam)
                       END
                       JOIN(Pla:Planning_FK01,Ink:InkoopID)
                         PROJECT(Pla:Aanvulling)
                         PROJECT(Pla:InkoopKGPrijs)
                         PROJECT(Pla:KG)
                         PROJECT(Pla:ArtikelID)
                         PROJECT(Pla:VerpakkingID)
                         JOIN(Art:Artikel_PK,Pla:ArtikelID)
                         END
                         JOIN(Ver:Verpakking_PK,Pla:VerpakkingID)
                         END
                       END
                     END
LocEnableEnterByTab  BYTE(1)                               !Used by the ENTER Instead of Tab template
EnterByTabManager    EnterByTabClass
ProgressWindow       WINDOW('Progress...'),AT(,,142,59),DOUBLE,CENTER,GRAY,TIMER(1)
                       PROGRESS,AT(15,15,111,12),USE(Progress:Thermometer),RANGE(0,100)
                       STRING(''),AT(0,3,141,10),USE(?Progress:UserString),CENTER
                       STRING(''),AT(0,30,141,10),USE(?Progress:PctText),CENTER
                       BUTTON('Cancel'),AT(45,42,50,15),USE(?Progress:Cancel)
                     END

Report               REPORT,AT(500,4333,7042,4323),PRE(RPT),PAPER(PAPER:A4),FONT('Arial',10,,FONT:regular,CHARSET:ANSI), |
  THOUS
                       HEADER,AT(500,448,7042,3844),USE(?Header)
                         STRING('Ven Poultry B.V.'),AT(42,1865),USE(?STRING1),FONT(,,,FONT:bold)
                         STRING('Stipdonk 46 A'),AT(42,2042,1010,198),USE(?STRING1:2)
                         STRING('5715 PD Lierop'),AT(42,2260,1010,198),USE(?STRING1:3)
                         STRING('The Netherlands'),AT(42,2469,1010,198),USE(?STRING1:4)
                         STRING('PURCHASE ORDER'),AT(3833,1583,2375,198),USE(?STRING1:5),FONT(,14,,FONT:bold+FONT:underline)
                         STRING('Purchase Order'),AT(3833,3177,1073,198),USE(?STRING1:7),FONT(,,,FONT:bold)
                         STRING(@n_6),AT(5010,3177),USE(Ink:InkoopID)
                         STRING(@s50),AT(3833,1865),USE(Rel:FirmaNaam),LEFT
                         STRING(@s100),AT(3833,2042),USE(Rel:Adres1),LEFT
                         STRING(@s50),AT(3833,2260,2656),USE(Loc:PostcodePlaats),LEFT
                         STRING('Description'),AT(42,3615,1344,198),USE(?STRING4:3),FONT(,8,,FONT:bold)
                         STRING('Packaging'),AT(3833,3615,802,198),USE(?STRING5:2),FONT(,8,,FONT:bold)
                         STRING('Volume (kgs)'),AT(4812,3615,802,198),USE(?STRING5:3),FONT(,8,,FONT:bold),RIGHT
                         STRING('Price (per kg) ex BTW'),AT(5687,3615,1302,198),USE(?STRING5:4),FONT(,8,,FONT:bold), |
  RIGHT
                         STRING(@s60),AT(3833,2469),USE(Rel:Country)
                         STRING('Confirmation Date: '),AT(42,3177,1229,198),USE(?STRING1:6),FONT(,8,,FONT:bold)
                         STRING('LoadingDate: '),AT(42,3406,802,198),USE(?STRING5),FONT(,8,,FONT:bold)
                         IMAGE('VENBriefhoofd.jpg'),AT(-10,-260),USE(?IMAGE1),CENTERED
                         STRING(@s100),AT(42,2729),USE(Geb:Email)
                         STRING(@s20),AT(42,2917),USE(Geb:Telefoon)
                         STRING(@d17),AT(1135,3177),USE(Ink:ConfirmationDate_DATE),FONT(,8)
                         STRING(@s50),AT(1135,3417),USE(Ink:LoadingDate),FONT(,8)
                       END
breakVerkoopID         BREAK(Ink:InkoopID),USE(?BREAK1)
Detail                   DETAIL,AT(0,0,7042,198),USE(?Detail),FONT(,10)
                           STRING(@n-13`2),AT(4740,31,875),USE(Pla:KG),FONT('Arial',8),RIGHT
                           STRING(@n~€~-9`3),AT(6375,31),USE(Pla:InkoopKGPrijs),FONT(,8),RIGHT(2)
                           STRING(@s49),AT(3833,31,1073),USE(Loc:VerpakkingOmschrijving),FONT(,8,,FONT:regular)
                           TEXT,AT(42,31,3729),USE(Loc:ArtikelOmschrijving,,?Loc:ArtikelOmschrijving:2),RESIZE
                         END
                         FOOTER,AT(0,0,7042,656),USE(?GROUPFOOTER1)
                           STRING('Total:'),AT(3833,52),USE(?STRING3),FONT(,,,FONT:bold)
                           STRING(@n-13`2),AT(4594,52,1021,198),USE(Pla:KG,,?Pla:KG:2),FONT(,8,,FONT:bold),RIGHT,SUM, |
  TALLY(Detail),RESET(breakVerkoopID)
                           STRING(@N~€~-13`2),AT(6187,52,802,167),USE(Loc:TotaalBedrag),FONT(,8,,FONT:bold),RIGHT(2)
                         END
                       END
                       FOOTER,AT(542,8677,7042,2802),USE(?Footer)
                         STRING(@s50),AT(5177,2292,2500,198),USE(Rel:FirmaNaam,,?AREL:FirmaNaam:2),LEFT
                         STRING('Name:'),AT(73,2250),USE(?STRING8)
                         STRING('Company name: '),AT(4073,2292,979,198),USE(?STRING7:2)
                         STRING('Name:'),AT(4073,2500,521,198),USE(?STRING8:2)
                         TEXT,AT(73,510,6958,1000),USE(Loc:Voettekst),FONT(,9),TRN
                         STRING(@s50),AT(1156,31),USE(Loc:BetaalConditie),FONT(,8)
                         STRING(@s50),AT(573,2250,2281),USE(Geb:VolledigeNaam),TRN
                         IMAGE,AT(458,1333,1240,1083),USE(?IMAGE2)
                         STRING(@s80),AT(1156,260,3281),USE(Loc:DeliveryTerms),FONT(,8),LEFT
                         STRING('Payment terms:'),AT(62,31,1010,198),USE(?STRING1:10),FONT(,8,,FONT:bold)
                         STRING('Term of Delivery:'),AT(62,250,1062,198),USE(?STRING1:11),FONT(,8,,FONT:bold)
                         STRING('.{56}'),AT(73,2052,2698),USE(?STRING2),TRN
                         STRING('.{56}'),AT(4073,2031,2344,198),USE(?STRING2:2)
                       END
                       FORM,AT(542,479,7000,11083),USE(?Form)
                       END
                     END
    omit('***',WE::CantCloseNowSetHereDone=1)  !Getting Nested omit compile error, then uncheck the "Check for duplicate CantCloseNowSetHere variable declaration" in the WinEvent local template
WE::CantCloseNowSetHereDone equate(1)
WE::CantCloseNowSetHere     long
    !***
ThisWindow           CLASS(ReportManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Init                   PROCEDURE(ProcessClass PC,<REPORT R>,<PrintPreviewClass PV>)
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
OpenReport             PROCEDURE(),BYTE,PROC,DERIVED
PrintReport            PROCEDURE(),DERIVED
TakeEvent              PROCEDURE(),BYTE,PROC,DERIVED
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED
                     END

ThisReport           CLASS(ProcessClass)                   ! Process Manager
TakeRecord             PROCEDURE(),BYTE,PROC,DERIVED
                     END

ProgressMgr          StepLongClass                         ! Progress Manager
Previewer            CLASS(PrintPreviewClass)              ! Print Previewer
Open                   PROCEDURE(),DERIVED
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED
                     END

TargetSelector       ReportTargetSelectorClass             ! Report Target Selector
PDFReporter          CLASS(PDFReportGenerator)             ! PDF
SetUp                  PROCEDURE(),DERIVED
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
  GlobalErrors.SetProcedureName('ReportInkoopBevestiging')
  Loc:VerkoopID=PVerkoopID
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:ArtikelOmschrijvingExtra.Open                     ! File ArtikelOmschrijvingExtra used by this procedure, so make sure it's RelationManager is open
  Relate:DeliveryTerms.Open                                ! File DeliveryTerms used by this procedure, so make sure it's RelationManager is open
  Relate:Gebruiker.Open                                    ! File Gebruiker used by this procedure, so make sure it's RelationManager is open
  Relate:Inkoop.SetOpenRelated()
  Relate:Inkoop.Open                                       ! File Inkoop used by this procedure, so make sure it's RelationManager is open
  Relate:ViewBetcd.Open                                    ! File ViewBetcd used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(ProgressWindow)                                ! Open window
  WinAlertMouseZoom()
  Do DefineListboxStyle
  INIMgr.Fetch('ReportInkoopBevestiging',ProgressWindow)   ! Restore window settings from non-volatile store
  TargetSelector.AddItem(PDFReporter.IReportGenerator)
  SELF.AddItem(TargetSelector)
  ProgressMgr.Init(ScrollSort:AllowNumeric,)
  ThisReport.Init(Process:View, Relate:Inkoop, ?Progress:PctText, Progress:Thermometer, ProgressMgr, Ink:InkoopID)
  ThisReport.AddSortOrder(Ink:PK_Inkoop)
  ThisReport.AddRange(Ink:InkoopID,Loc:VerkoopID)
  SELF.AddItem(?Progress:Cancel,RequestCancelled)
  SELF.Init(ThisReport,Report,Previewer)
  ?Progress:UserString{PROP:Text} = ''
  Relate:Inkoop.SetQuickScan(1,Propagate:OneMany)
  ProgressWindow{PROP:Timer} = 10                          ! Assign timer interval
  SELF.SkipPreview = False
  Previewer.SetINIManager(INIMgr)
  Previewer.AllowUserZoom = True
  SELF.SetAlerts()
  EnterByTabManager.Init(False)
  RETURN ReturnValue


ThisWindow.Init PROCEDURE(ProcessClass PC,<REPORT R>,<PrintPreviewClass PV>)

  CODE
  PARENT.Init(PC,R,PV)
  WinAlertMouseZoom()


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:ArtikelOmschrijvingExtra.Close
    Relate:DeliveryTerms.Close
    Relate:Gebruiker.Close
    Relate:Inkoop.Close
    Relate:ViewBetcd.Close
  END
  IF SELF.Opened
    INIMgr.Update('ReportInkoopBevestiging',ProgressWindow) ! Save window data to non-volatile store
  END
  ProgressMgr.Kill()
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.OpenReport PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  SYSTEM{PROP:PrintMode} = 3
  ReturnValue = PARENT.OpenReport()
  IF ReturnValue = Level:Benign
    SELF.Report{PROPPRINT:Extend}=True
  END
  RETURN ReturnValue


ThisWindow.PrintReport PROCEDURE

  CODE
  PARENT.PrintReport
   ! al je print kom je hier 
  if Ink:BevestigingGeprint_DATE=0
      Ink:BevestigingGeprint_DATE=today()
      Ink:BevestigingGeprint_TIME=clock()
      Access:Inkoop.Update()
  END
  !


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


ThisReport.TakeRecord PROCEDURE

ReturnValue          BYTE,AUTO

SkipDetails BYTE
  CODE
  ReturnValue = PARENT.TakeRecord()
  Loc:PostcodePlaats=CLIP(Rel:Postcode)&Clip(' '&REL:Plaats)
  
  Loc:TotaalBedrag+=Pla:KG*Pla:InkoopKGPrijs
  
  CLEAR(Art2:RECORD)
  Art2:ex_artcode='GB'
  Art2:artcode=Pla:ArtikelID
  IF Access:ArtikelOmschrijvingExtra.Fetch(Art2:PK_ArtikelOmschrijvingExtra)=Level:Benign AND Art2:tekst<>''
      Loc:ArtikelOmschrijving=Art2:tekst
  ELSE
      Loc:ArtikelOmschrijving=Art:ArtikelOms
  END
  IF Pla:Aanvulling<>''
      Loc:ArtikelOmschrijving=CLIP(Loc:ArtikelOmschrijving)&' '&Pla:Aanvulling
  END
  
  IF Ver:Description=''
      Loc:VerpakkingOmschrijving=Ver:VerpakkingOmschrijving
  ELSE
      Loc:VerpakkingOmschrijving=Ver:Description
  END
  
  Clear(BTC:Record)
  BTC:betcdID=REL:PaymentCondition
  if Access:ViewBetCD.Fetch(BTC:ViewBetcd_PK)=Level:Benign
      if BTC:Description=''
          Loc:BetaalConditie=BTC:Omschrijving
      ELSE
          Loc:BetaalConditie=BTC:Description
      END
  END
  
  Clear(DLT:Record)
  DLT:DeliveryTermsID=Ink:DeliveryTermsID
  If Access:DeliveryTerms.Fetch(DLT:PK_DeliveryTerms)=Level:Benign
      Loc:DeliveryTerms=DLT:Omschrijving
  END
  
  IF Ink:GebruikerID<>0
      Clear(GEB:Record)
      Geb:ID=Ink:GebruikerID
      Access:Gebruiker.Fetch(Geb:PK_Gebruiker)   
      SetTarget(REPORT)
      ?IMAGE2{Prop:Text}=Geb:Handtekening
      SetTarget()
  END
  
  Loc:Voettekst='Thank you for the order, herewith I confirm you our purchase/your sale of the products as described above.  A-quality as usual, not smelly, no bruises, thick plastic, no added water, deep frozen , -18 C. Europe-proved, recent production. Just like specification/ pictures. '&|
      'For full terms and conditions see www.venpoultry.nl. '&|
      '<13><10> '&|
      '<13><10> '&|
      'Please sign, stamp and send back to us. '
          
  PRINT(RPT:Detail)
  RETURN ReturnValue


Previewer.Open PROCEDURE

  CODE
  PARENT.Open
    !Find equate for the toolbar
    Findtoolbar#= 0
    loop
      Findtoolbar#= target{prop:nextfield,Findtoolbar#}
      if Findtoolbar# = 0 then break.
      if Findtoolbar#{prop:type} = create:toolbar then break.
    end
    ! MailButton
    Loc:MailButtonID=CREATE(0,CREATE:Button,Findtoolbar#)
    Loc:MailButtonID{prop:msg}       = 'Printvoorbeeld emailen'
    Loc:MailButtonID{Prop:Icon}      = '~Send.ico'
    Loc:MailButtonID{Prop:Flat}     = true
    Loc:MailButtonID{Prop:Text}     = ''
  
    Setposition(Loc:MailButtonID,4,2,32,32)   ! Mail-button weer voorraan zetten
    UNHIDE(Loc:MailButtonID)
    DISPLAY(Loc:MailButtonID)
  
    if Findtoolbar# > 0 then
      Controls# = 0
      loop
        Controls#= target{prop:nextfield,Controls#}
        if Controls# = 0 then break.
        ! De controls van de toolbar verplaatsen (behalve de mailbutton). Controls met een hoge equate zijn ondersteunde controls van de listbox? (i.i.g. niet verplaatsen)
        if Controls#{prop:parent} = Findtoolbar# AND Controls# <> Loc:MailButtonID AND Controls# < 30000 THEN
          HIDE(Controls#)
          SetPosition(Controls#, Controls#{PROP:XPos} + 34,Controls#{PROP:YPos}, Controls#{PROP:Width} , Controls#{PROP:Height})
          UNHIDE(Controls#)
          DISPLAY(Controls#)
        end
      end
     end


Previewer.TakeAccepted PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.TakeAccepted()
    IF FIELD()=Loc:MailButtonID
       Loc:SavePath=Clip(Path())
       if not(Records(Self.ImageQueue)) then
          Message('Er is niet om gestuurd te worden')
          Return Level:Fatal
       end
       Loc:Commando=GetIni('Mail','wmf2pdf','wmf2pdf.exe',path()&'\mail.ini')
       Loc:TMPDirectory=''
       ! kijken wat de tijdelijke directory is van de wmf bestanden
       Loc:PDFFileName=GETTEMPPATH()&Shortpath('PurchaseOrder' &'.pdf')
       ThisWindow.SetReportTarget(PDFReporter.IReportGenerator)
       Previewer.OnSaveAs()  
       
        IF FALSE
       Loop i#=1 to Records(Self.ImageQueue)
         Get(Self.ImageQueue,i#)
         if not error()
            if Loc:TMPDirectory=''
               Loop j#=Len(Clip(Self.ImageQueue.FileName)) to 1 by -1
                  if Sub(Clip(Self.ImageQueue.FileName),j#,1)='\'
                     Loc:TMPDirectory=Sub(Clip(Self.ImageQueue.FileName),1,j#)
                     Break
                   end
               end
               Loc:TmpAtt='"'&Clip(Loc:TMPDirectory)&Shortpath('PurchaseOrder' &'.pdf')&'"'
                IF Records(Self.ImageQueue) <= 200
                  Loc:Commando=Clip(Loc:Commando)& ' Output='& Clip(Loc:TmpAtt) &' Input="'&Clip(Self.ImageQueue.FileName)
                ELSE
                   Ini"=Today()&'.'&Clock()
                   Loc:Commando=Clip(Loc:Commando)& ' Output='& Clip(Loc:TmpAtt) &' Ini='&path()&'\'&Ini"&'"'
                   PUTINI('Export','Totaal',Records(Self.ImageQueue),path()&'\'&Ini")
                   PUTINI('Export',i#,Clip(Self.ImageQueue.FileName),path()&'\'&Ini")
                END
            else
                IF Records(Self.ImageQueue) <= 200
                   Loc:Commando=Clip(Loc:Commando)& ';'& Clip(Self.ImageQueue.FileName)
                ELSE
                   PUTINI('Export',i#,Clip(Self.ImageQueue.FileName),path()&'\'&Ini")
                END
            end
         end
       end
        END
        Loc:Commando='wmf2pdf.exe output="'&Loc:PDFFileName
        
       IF Loc:LandscapeOverride THEN
          IF Loc:Landscape THEN
              Loc:Commando=Clip(Loc:Commando)& '" Landscape'
          ELSE
              Loc:Commando=Clip(Loc:Commando)& '"'
          END
       ELSE
          IF Report{PROP:Landscape} THEN
              Loc:Commando=Clip(Loc:Commando)& '" Landscape'
          ELSE
              Loc:Commando=Clip(Loc:Commando)& '"'
          END
       END
  
       Loc:Commando=Clip(Loc:Commando)& ' Subject="'& 'PurchaseOrder' &'"'
       !Loc:Commando=Clip(Loc:Commando)& ' To="'& &'"'
       Run(Loc:Commando,1)
       if Ink:BevestigingGeprint_DATE=0
           Ink:BevestigingGeprint_DATE=today()
           Ink:BevestigingGeprint_TIME=clock()
           Access:Inkoop.Update()
       END
       !
       ! al je mailt kom je hier 
       !if Ver2:BevestigingGeprint_DATE=0
       !    Ver2:BevestigingGeprint_DATE=today()
       !    Ver2:BevestigingGeprint_TIME=clock()
       !    Access:Verkoop.Update()
       !END
       !
  
       if path()<>Loc:SavePath
          setpath(Loc:SavePath)
          if error() then stop(Error()&'  bij het terugzetten van het path').
       end
  
       POST(Event:CloseDown)
    END
  RETURN ReturnValue


PDFReporter.SetUp PROCEDURE

  CODE
  PARENT.SetUp
  SELF.SetFileName(Loc:PDFFileName)
  SELF.SetDocumentInfo('CW Report','VoorrRpt','ReportVerkoopBevestiging','ReportVerkoopBevestiging','','')
  SELF.SetPagesAsParentBookmark(False)
  SELF.SetScanCopyMode(False)
  SELF.CompressText   = True
  SELF.CompressImages = True

!!! <summary>
!!! Generated from procedure template - Process
!!! </summary>
ReportSSOPRegistraties PROCEDURE 

Progress:Thermometer BYTE                                  ! 
Loc:DatumVanaf       DATE                                  ! 
Loc:DatumTM          DATE                                  ! 
Process:View         VIEW(Versie)
                     END
LocEnableEnterByTab  BYTE(1)                               !Used by the ENTER Instead of Tab template
EnterByTabManager    EnterByTabClass
ProgressWindow       WINDOW('Progress...'),AT(,,142,100),DOUBLE,CENTER,GRAY,TIMER(1)
                       PROGRESS,AT(15,15,111,12),USE(Progress:Thermometer),RANGE(0,100)
                       STRING(''),AT(0,3,141,10),USE(?Progress:UserString),CENTER
                       STRING(''),AT(0,30,141,10),USE(?Progress:PctText),CENTER
                       PROMPT('Datum Vanaf:'),AT(15,44),USE(?Loc:DatumVanaf:Prompt)
                       SPIN(@d17),AT(72,43,60,10),USE(Loc:DatumVanaf)
                       PROMPT('Datum tot en met:'),AT(16,58),USE(?Loc:DatumTM:Prompt)
                       SPIN(@d17),AT(72,57,60,10),USE(Loc:DatumTM)
                       BUTTON('Pause'),AT(15,78),USE(?Pause)
                       BUTTON('Cancel'),AT(82,78,50,15),USE(?Progress:Cancel)
                     END

    omit('***',WE::CantCloseNowSetHereDone=1)  !Getting Nested omit compile error, then uncheck the "Check for duplicate CantCloseNowSetHere variable declaration" in the WinEvent local template
WE::CantCloseNowSetHereDone equate(1)
WE::CantCloseNowSetHere     long
    !***
ThisWindow           CLASS(ReportManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Init                   PROCEDURE(ProcessClass PC,<REPORT R>,<PrintPreviewClass PV>)
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
Paused                 BYTE
Timer                  LONG
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED
TakeEvent              PROCEDURE(),BYTE,PROC,DERIVED
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED
                     END

ThisProcess          CLASS(ProcessClass)                   ! Process Manager
Kill                   PROCEDURE(),DERIVED
TakeRecord             PROCEDURE(),BYTE,PROC,DERIVED
                     END

ProgressMgr          StepRealClass                         ! Progress Manager
ExcelClass         Class
InitOle                 Procedure()
MaakExcel               Procedure()
OpenExcel               Procedure(String)
SluitExcel              Procedure(Byte)
BepaalKolom             Procedure(LONG),String
SchrijfExcel            Procedure(String, LONG, String)
MaakWerkBlad            Procedure(<String>)
                   End
Loc:Ole            CString(21)
Loc:Rij            Long
Loc:OleInit        Byte


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
  GlobalErrors.SetProcedureName('ReportSSOPRegistraties')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('Loc:DatumVanaf',Loc:DatumVanaf)                    ! Added by: Process
  BIND('Loc:DatumTM',Loc:DatumTM)                          ! Added by: Process
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:SSOPObject.Open                                   ! File SSOPObject used by this procedure, so make sure it's RelationManager is open
  Relate:SSOPRegistratie.Open                              ! File SSOPRegistratie used by this procedure, so make sure it's RelationManager is open
  Relate:SSOPTijd.Open                                     ! File SSOPTijd used by this procedure, so make sure it's RelationManager is open
  Relate:Versie.Open                                       ! File Versie used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(ProgressWindow)                                ! Open window
  Loc:DatumTM=today()
  Loc:DatumVanaf=Date(01,01,Year(TODAY()))
  WinAlertMouseZoom()
  Do DefineListboxStyle
  ProgressWindow{Prop:Timer} = 10                          ! Assign timer interval
  ProgressMgr.Init(ScrollSort:AllowNumeric,)
  ThisProcess.Init(Process:View, Relate:Versie, ?Progress:PctText, Progress:Thermometer, ProgressMgr, VRS:Versie)
  ThisProcess.AddSortOrder(VRS:Versie_PK)
  ThisProcess.AddRange(VRS:Versie,GLO:Versie)
  ProgressWindow{Prop:Text} = 'Processing Records'
  ?Progress:PctText{Prop:Text} = '0% Completed'
  SELF.Init(ThisProcess)
  ?Progress:UserString{Prop:Text}='ActieAfwijkingen'
  SELF.AddItem(?Progress:Cancel, RequestCancelled)
  SEND(Versie,'QUICKSCAN=on')
  ASSERT(~SELF.DeferWindow) ! A hidden Go button is not smart ...
  SELF.KeepVisible = 1
  SELF.DeferOpenReport = 1
  SELF.Timer = TARGET{PROP:Timer}
  TARGET{PROP:Timer} = 0
  ?Pause{PROP:Text} = 'Start'
  SELF.Paused = 1
  ?Progress:Cancel{PROP:Key} = EscKey
  SELF.SetAlerts()
  EnterByTabManager.Init(False)
  RETURN ReturnValue


ThisWindow.Init PROCEDURE(ProcessClass PC,<REPORT R>,<PrintPreviewClass PV>)

  CODE
  PARENT.Init(PC,R,PV)
  WinAlertMouseZoom()


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
        ThisNetRefresh.Send('|Versie|') ! NetTalk (NetRefresh)
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:SSOPObject.Close
    Relate:SSOPRegistratie.Close
    Relate:SSOPTijd.Close
    Relate:Versie.Close
  END
  ProgressMgr.Kill()
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
    CASE ACCEPTED()
    OF ?Pause
      IF SELF.Paused
        TARGET{PROP:Timer} = SELF.Timer
        ?Pause{PROP:Text} = 'Pause'
      ELSE
        SELF.Timer = TARGET{PROP:Timer}
        TARGET{PROP:Timer} = 0
        ?Pause{PROP:Text} = 'Restart'
      END
      SELF.Paused = 1 - SELF.Paused
    END
  ReturnValue = PARENT.TakeAccepted()
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
    OF EVENT:OpenWindow
        WE::CantCloseNow += 1
        WE::CantCloseNowSetHere = 1
    OF EVENT:Timer
      IF SELF.Paused THEN RETURN Level:Benign .
    END
  ReturnValue = PARENT.TakeWindowEvent()
    CASE EVENT()
    OF EVENT:CloseWindow
      if WE::CantCloseNow > 0 and ReturnValue = Level:Benign and WE::CantCloseNowSetHere
        WE::CantCloseNow -= 1
        WE::CantCloseNowSetHere = 0
      end
    OF EVENT:OpenWindow
        post(event:visibleondesktop)
    END
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue

ExcelClass.SchrijfExcel         Procedure(String PRM:Kolom,LONG PRM:Rij, String PRM:Value)
   Code
   Loc:Ole{'Application.Range('&Clip(PRM:Kolom)&Prm:Rij&').Value'}=PRM:Value
   RETURN
ExcelClass.MaakWerkBlad         Procedure(<String PRM:WerkBladNaam>)
   Code
   Loc:Ole{'Application.ActiveWorkBook.Sheets.Add'}
   IF PRM:WerkBladNaam<>''
    Loc:Ole{'Application.ActiveWorkBook.ActiveSheet.Name'}=Clip(PRM:WerkBladNaam)
   End
   ! Loc:Ole{'Application.ActiveWorkBook.Sheets.Select'}
   RETURN
ExcelClass.BepaalKolom    Procedure(LONG PRM:Kolom )
PRM:KolomString  string(3)
Loc:TweedeLetter    Long
Loc:EersteLetter    Long
    CODE
    PRM:Kolom-=1
    Loc:TweedeLetter=PRM:Kolom  % 26
    Loc:EersteLetter=Int(PRM:Kolom /26)

    if Loc:EersteLetter<>0
       PRM:KolomString[1]=Chr(64+Loc:EersteLetter)       ! chr(65)= 'A'
       PRM:KolomString[2]=Chr(65+Loc:TweedeLetter)
    Else
       PRM:KolomString[1]=Chr(65+Loc:TweedeLetter)
    End

    RETURN(PRM:KolomString)
ExcelClass.InitOle     Procedure
    code
    Loc:Ole  = Create(0,Create:Ole)
    Loc:Ole{Prop:Create}='Excel.Application'

    Loc:Ole{Prop:DoVerb}=1                               !  dit doet iedereen dus ik ook
    Loc:Ole{'Application.WindowState'}=1                 !  maximaliseer scherm
    Loc:Ole{'Application.Visible'}=True ! nu pas excel laten zien
    RETURN
ExcelClass.MaakExcel       Procedure
    CODE
    Loc:Ole{'Application.Workbooks.Add'}            ! leeg worksheet openen
    RETURN
ExcelClass.OpenExcel       Procedure(String prm:Bestandsnaam)
    Code
    Loc:Ole{'Application.Workbooks.Open ("'&prm:Bestandsnaam&'")'}           ! leeg worksheet openen
    RETURN
ExcelClass.SluitExcel       Procedure(Byte PRM:Close)
   Code
   If PRM:Close
       Loc:Ole{'Application.Workbooks.Close'}
   END     
   Loc:Ole{'Application.Visible'}=true  ! nu pas excel laten zien
   Loc:Ole{'Prop:Deactivate'}
   Destroy(Loc:Ole)
   RETURN

ThisProcess.Kill PROCEDURE

  CODE
     Loc:Ole{'Application.Columns(A:J).AutoFit'}
     Loc:Ole{'Application.Rows(1:'&Loc:Rij&').AutoFit'}
      ExcelClass.SluitExcel(FALSE)
  PARENT.Kill


ThisProcess.TakeRecord PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  IF Loc:OleInit=FALSE
      Loc:OleInit=TRUE
      ExcelClass.InitOle()
      ExcelClass.MaakExcel()
      Loc:Rij=1
      ExcelClass.SchrijfExcel('A',Loc:Rij,'Datum')
      ExcelClass.SchrijfExcel('B',Loc:Rij,'Tijd Rondgang')
      ExcelClass.SchrijfExcel('C',Loc:Rij,'Controle door')
      Clear(SObj:Record)
      Set(SObj:SSOPObject_FK1,SObj:SSOPObject_FK1)
      Loop Until Access:SSOPOBject.Next()
          i#+=1
          ExcelClass.SchrijfExcel(ExcelClass.BepaalKolom(3+i#),Loc:Rij,SObj:Omschrijving)
      END
  END
  
  Clear(STijd:Record)
  STijd:DatumTijd_DATE=Loc:DatumVanaf
  Set(STijd:SSOPTijd_FK1,STijd:SSOPTijd_FK1)
  Loop Until Access:SSOPTIJD.Next()
      IF NOT (STijd:DatumTijd_DATE>=Loc:DatumVanaf AND STijd:DatumTijd_DATE<=Loc:DatumTM+1)
          BREAK
      END
      Loc:Rij+=1
      i#=0
      ExcelClass.SchrijfExcel('A',Loc:Rij,STijd:DatumTijd_DATE-36161)
      Loc:Ole{'Application.Range(A'&Loc:Rij&').NumberFormat'}='dd/mm/jjjj'
      ExcelClass.SchrijfExcel('B',Loc:Rij,Format(STijd:DatumTijd_TIME,@t1))
      ExcelClass.SchrijfExcel('C',Loc:Rij,STijd:Door)
      Clear(SObj:Record)
      Set(SObj:SSOPObject_FK1,SObj:SSOPObject_FK1)
      Loop Until Access:SSOPOBject.Next()
          i#+=1
          Clear(SREG:Record)
          SReg:TijdID=STijd:TijdID
          SReg:ObjID=SObj:ObjID
          IF Access:SSOPRegistratie.Fetch(SReg:SSOPRegistratie_FK2)=Level:Benign
              ExcelClass.SchrijfExcel(ExcelClass.BepaalKolom(3+i#),Loc:Rij,SReg:Resultaat)
              IF SReg:Opmerking<>'' AND SReg:CorrigerendeActie<>''
                 Loc:Ole{'Application.Range('&CLIP(ExcelClass.BepaalKolom(3+i#))&Loc:Rij&').AddComment("Opmerking:<13,10>'&SReg:Opmerking&'<13,10>Corrigerende Actie:<13,10>'&SReg:CorrigerendeActie&'")'}
              ELSIF SReg:Opmerking<>'' 
                 Loc:Ole{'Application.Range('&CLIP(ExcelClass.BepaalKolom(3+i#))&Loc:Rij&').AddComment("Opmerking:<13,10>'&SReg:Opmerking&'")'}
              ELSIF SReg:CorrigerendeActie<>''
                 Loc:Ole{'Application.Range('&CLIP(ExcelClass.BepaalKolom(3+i#))&Loc:Rij&').AddComment("Corrigerende Actie:<13,10>'&SReg:CorrigerendeActie&'")'}
              END
              
          END
      END
      
  END
  !Return Record:OutOfRange
  ReturnValue = PARENT.TakeRecord()
  RETURN ReturnValue

!!! <summary>
!!! Generated from procedure template - Process
!!! Export naar Excel van Cel Voorraad Locatie
!!! </summary>
ReportVrdCelLocatie PROCEDURE (LONG __celid,QUEUE __queue)

Progress:Thermometer BYTE                                  ! 
Loc:CelID            LONG                                  ! 
Process:View         VIEW(Versie)
                     END
LocEnableEnterByTab  BYTE(1)                               !Used by the ENTER Instead of Tab template
EnterByTabManager    EnterByTabClass
ProgressWindow       WINDOW('Process ViewPartijCelLocaties'),AT(,,142,59),FONT('Microsoft Sans Serif',8,,FONT:regular, |
  CHARSET:DEFAULT),DOUBLE,CENTER,GRAY,TIMER(1)
                       PROGRESS,AT(15,15,111,12),USE(Progress:Thermometer),RANGE(0,100)
                       STRING(''),AT(0,3,141,10),USE(?Progress:UserString),CENTER
                       STRING(''),AT(0,30,141,10),USE(?Progress:PctText),CENTER
                       BUTTON('Cancel'),AT(46,42,49,15),USE(?Progress:Cancel),LEFT,ICON('WACANCEL.ICO'),FLAT,MSG('Cancel Process'), |
  TIP('Cancel Process')
                     END

    omit('***',WE::CantCloseNowSetHereDone=1)  !Getting Nested omit compile error, then uncheck the "Check for duplicate CantCloseNowSetHere variable declaration" in the WinEvent local template
WE::CantCloseNowSetHereDone equate(1)
WE::CantCloseNowSetHere     long
    !***
ThisWindow           CLASS(ReportManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Init                   PROCEDURE(ProcessClass PC,<REPORT R>,<PrintPreviewClass PV>)
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
TakeEvent              PROCEDURE(),BYTE,PROC,DERIVED
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED
                     END

ThisProcess          CLASS(ProcessClass)                   ! Process Manager
Close                  PROCEDURE(),DERIVED
TakeRecord             PROCEDURE(),BYTE,PROC,DERIVED
ValidateRecord         PROCEDURE(),BYTE,DERIVED
                     END

ProgressMgr          StepRealClass                         ! Progress Manager
ExcelClass         Class
InitOle                 Procedure()
MaakExcel               Procedure()
OpenExcel               Procedure(String)
SluitExcel              Procedure(Byte)
BepaalKolom             Procedure(LONG),String
SchrijfExcel            Procedure(String, LONG, String)
MaakWerkBlad            Procedure(<String>)
                   End
Loc:Ole            CString(21)
Loc:Rij            Long
Loc:OleInit        Byte


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
  GlobalErrors.SetProcedureName('ReportVrdCelLocatie')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
      Loc:CelID=__celid
  BIND('Loc:CelID',Loc:CelID)                              ! Added by: Process
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:Partij.Open                                       ! File Partij used by this procedure, so make sure it's RelationManager is open
  Relate:Versie.Open                                       ! File Versie used by this procedure, so make sure it's RelationManager is open
  Relate:ViewArtikel.Open                                  ! File ViewArtikel used by this procedure, so make sure it's RelationManager is open
  Relate:ViewPartijCelLocaties.Open                        ! File ViewPartijCelLocaties used by this procedure, so make sure it's RelationManager is open
  Relate:ViewVoorraadPartij.Open                           ! File ViewVoorraadPartij used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(ProgressWindow)                                ! Open window
  WinAlertMouseZoom()
  Do DefineListboxStyle
  INIMgr.Fetch('ReportVrdCelLocatie',ProgressWindow)       ! Restore window settings from non-volatile store
  ProgressWindow{Prop:Timer} = 10                          ! Assign timer interval
  ProgressMgr.Init(ScrollSort:AllowNumeric,)
  ThisProcess.Init(Process:View, Relate:Versie, ?Progress:PctText, Progress:Thermometer, ProgressMgr, VRS:Versie)
  ThisProcess.AddSortOrder(VRS:Versie_PK)
  ThisProcess.SetFilter('VPCL:CelID=Loc:CelID AND VPCL:KG >0')
  ProgressWindow{Prop:Text} = 'Processing Records'
  ?Progress:PctText{Prop:Text} = '0% Completed'
  SELF.Init(ThisProcess)
  ?Progress:UserString{Prop:Text}='Export voorraad per cel lokatie'
  SELF.AddItem(?Progress:Cancel, RequestCancelled)
  SEND(Versie,'QUICKSCAN=on')
  SELF.SetAlerts()
  EnterByTabManager.Init(False)
  RETURN ReturnValue


ThisWindow.Init PROCEDURE(ProcessClass PC,<REPORT R>,<PrintPreviewClass PV>)

  CODE
  PARENT.Init(PC,R,PV)
  WinAlertMouseZoom()


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
        ThisNetRefresh.Send('|Versie|') ! NetTalk (NetRefresh)
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:Partij.Close
    Relate:Versie.Close
    Relate:ViewArtikel.Close
    Relate:ViewPartijCelLocaties.Close
    Relate:ViewVoorraadPartij.Close
  END
  IF SELF.Opened
    INIMgr.Update('ReportVrdCelLocatie',ProgressWindow)    ! Save window data to non-volatile store
  END
  ProgressMgr.Kill()
  GlobalErrors.SetProcedureName
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
    OF EVENT:OpenWindow
        WE::CantCloseNow += 1
        WE::CantCloseNowSetHere = 1
    END
  ReturnValue = PARENT.TakeWindowEvent()
    CASE EVENT()
    OF EVENT:CloseWindow
      if WE::CantCloseNow > 0 and ReturnValue = Level:Benign and WE::CantCloseNowSetHere
        WE::CantCloseNow -= 1
        WE::CantCloseNowSetHere = 0
      end
    OF EVENT:OpenWindow
        post(event:visibleondesktop)
    END
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue

ExcelClass.SchrijfExcel         Procedure(String PRM:Kolom,LONG PRM:Rij, String PRM:Value)
   Code
   Loc:Ole{'Application.Range('&Clip(PRM:Kolom)&Prm:Rij&').Value'}=PRM:Value
   RETURN
ExcelClass.MaakWerkBlad         Procedure(<String PRM:WerkBladNaam>)
   Code
   Loc:Ole{'Application.ActiveWorkBook.Sheets.Add'}
   IF PRM:WerkBladNaam<>''
    Loc:Ole{'Application.ActiveWorkBook.ActiveSheet.Name'}=Clip(PRM:WerkBladNaam)
   End
   ! Loc:Ole{'Application.ActiveWorkBook.Sheets.Select'}
   RETURN
ExcelClass.BepaalKolom    Procedure(LONG PRM:Kolom )
PRM:KolomString  string(3)
Loc:TweedeLetter    Long
Loc:EersteLetter    Long
    CODE
    PRM:Kolom-=1
    Loc:TweedeLetter=PRM:Kolom  % 26
    Loc:EersteLetter=Int(PRM:Kolom /26)

    if Loc:EersteLetter<>0
       PRM:KolomString[1]=Chr(64+Loc:EersteLetter)       ! chr(65)= 'A'
       PRM:KolomString[2]=Chr(65+Loc:TweedeLetter)
    Else
       PRM:KolomString[1]=Chr(65+Loc:TweedeLetter)
    End

    RETURN(PRM:KolomString)
ExcelClass.InitOle     Procedure
    code
    Loc:Ole  = Create(0,Create:Ole)
    Loc:Ole{Prop:Create}='Excel.Application'

    Loc:Ole{Prop:DoVerb}=1                               !  dit doet iedereen dus ik ook
    Loc:Ole{'Application.WindowState'}=1                 !  maximaliseer scherm
    Loc:Ole{'Application.Visible'}=True ! nu pas excel laten zien
     Loc:Ole{Prop:ReportException}=True                   !  dwz fouten worden niet genegeerd
    RETURN
ExcelClass.MaakExcel       Procedure
    CODE
    Loc:Ole{'Application.Workbooks.Add'}            ! leeg worksheet openen
    RETURN
ExcelClass.OpenExcel       Procedure(String prm:Bestandsnaam)
    Code
    Loc:Ole{'Application.Workbooks.Open ("'&prm:Bestandsnaam&'")'}           ! leeg worksheet openen
    RETURN
ExcelClass.SluitExcel       Procedure(Byte PRM:Close)
   Code
   If PRM:Close
       Loc:Ole{'Application.Workbooks.Close'}
   END     
   Loc:Ole{'Application.Visible'}=true  ! nu pas excel laten zien
   Loc:Ole{'Prop:Deactivate'}
   Destroy(Loc:Ole)
   RETURN

ThisProcess.Close PROCEDURE

  CODE
  PARENT.Close
  IF Loc:OleInit=TRUE
      !Loc:Ole{'Application.Range(A1).Select'}
      !Loc:Ole{'ActiveSheet.ListObjects.Add(1, Range("$A$1:$F$'&loc:Rij&'"), , 1, "A1").Name'} = 'Tabel2'
      !Loc:Ole{'ActiveSheet.ListObjects.Add(1, Range("$A$1:$F$'&loc:Rij&'"), , 1, "A1")'} 
      Loc:OleInit=FALSE
  END


ThisProcess.TakeRecord PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  IF Loc:OleInit=FALSE
      Loc:OleInit=TRUE
      ExcelClass.InitOle()
      ExcelClass.MaakExcel()
      Loc:Rij=1
      ExcelClass.SchrijfExcel('A',Loc:RIj,'Locatie')
      ExcelClass.SchrijfExcel('B',Loc:RIj,'Partij')
      ExcelClass.SchrijfExcel('C',Loc:RIj,'ArtikelID')
      ExcelClass.SchrijfExcel('D',Loc:RIj,'Omschrijving')
      ExcelClass.SchrijfExcel('E',Loc:RIj,'KG')
      ExcelClass.SchrijfExcel('F',Loc:RIj,'Pallet')
      Loop i#=1 TO Records(__queue)
          Get(__queue,i#)
          Loc:Rij+=1
          ExcelClass.SchrijfExcel('A',Loc:Rij,WHAT(__queue,11))
          ExcelClass.SchrijfExcel('B',Loc:Rij,WHAT(__queue,6))
          ExcelClass.SchrijfExcel('C',Loc:RIJ,WHAT(__queue,16))
          ExcelClass.SchrijfExcel('D',Loc:RIj,WHAT(__queue,21))
          ExcelClass.SchrijfExcel('E',Loc:RIj,WHAT(__queue,26))
          ExcelClass.SchrijfExcel('F',Loc:RIj,WHAT(__queue,31))
      END
  END
      
  Return Record:OutOfRange
  
  
  
  
  
  !Clear(VVPar:Record)
  !VVPar:PartijID=VPCL:PartijID
  !VVPar:CelID=Loc:CelID
  !IF Access:ViewVoorraadPartij.Fetch(VVPar:PartijID_CelID_K)=Level:Benign
  !    IF VVPar:VoorraadKG <= 0 Then Return Record:Filtered.
  !ELSE
  !    Return Record:Filtered
  !END
  !
  !    ! exporteren
  !IF Loc:OleInit=FALSE
  !    Loc:OleInit=TRUE
  !    ExcelClass.InitOle()
  !    ExcelClass.MaakExcel()
  !    Loc:Rij=1
  !    ExcelClass.SchrijfExcel('A',Loc:RIj,'Locatie')
  !    ExcelClass.SchrijfExcel('B',Loc:RIj,'Partij')
  !    ExcelClass.SchrijfExcel('C',Loc:RIj,'ArtikelID')
  !    ExcelClass.SchrijfExcel('D',Loc:RIj,'Omschrijving')
  !    ExcelClass.SchrijfExcel('E',Loc:RIj,'KG')
  !    ExcelClass.SchrijfExcel('F',Loc:RIj,'Pallet')
  !END
  !! Eerst controle of er nog wel celpartij voorraad is
  !
  !Loc:Rij+=1
  !ExcelClass.SchrijfExcel('A',Loc:RIj,VPCL:CelLocatienaam)
  !ExcelClass.SchrijfExcel('B',Loc:RIj,VPCL:PartijID)
  !Clear(Par:Record)
  !Par:PartijID=VPCL:PartijID
  !IF Access:Partij.Fetch(Par:Partij_PK)=Level:Benign
  !    ExcelClass.SchrijfExcel('C',Loc:RIj,Par:ArtikelID)
  !    Clear(Art:Record)
  !    Art:ArtikelID=Par:ArtikelID
  !    IF Access:ViewArtikel.Fetch(Art:Artikel_PK)=Level:Benign
  !        ExcelClass.SchrijfExcel('D',Loc:RIj,Art:ArtikelOms)
  !    END
  !    
  !END
  !
  !ExcelClass.SchrijfExcel('E',Loc:RIj,CHOOSE(VPCL:KG > VVPar:VoorraadKG, VVPar:VoorraadKG, VPCL:KG))
  !ExcelClass.SchrijfExcel('F',Loc:RIj,CHOOSE(VPCL:Pallet > VVPar:VoorraadPallets, VVPar:VoorraadPallets, VPCL:Pallet))
  ReturnValue = PARENT.TakeRecord()
  RETURN ReturnValue


ThisProcess.ValidateRecord PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.ValidateRecord()
  IF Loc:OleInit=TRUE
      Return Record:OutOfRange
  END
      
  RETURN ReturnValue

!!! <summary>
!!! Generated from procedure template - Process
!!! </summary>
ExportVerkoop PROCEDURE (LONG __currentTab,LONG __relatieid)

Progress:Thermometer BYTE                                  ! 
Loc:Soort            LONG                                  ! 
Loc:VanafDatum       DATE                                  ! 
Loc:TMDatum          DATE                                  ! 
Loc:Extrakosten      DECIMAL(7,2)                          ! 
Loc:VerkoopID        LONG                                  ! 
Loc:TotaalKG         DECIMAL(7,2)                          ! 
Loc:TotaalExtrakosten DECIMAL(7,2)                         ! 
Loc:ExtraKostenQ     QUEUE,PRE(LEQ)                        ! 
PlanningID           LONG                                  ! 
KG                   DECIMAL(7,2)                          ! 
ExtraKosten          DECIMAL(7,2)                          ! 
                     END                                   ! 
Process:View         VIEW(Verkoop)
                       PROJECT(Ver2:Exported)
                       PROJECT(Ver2:GebruikerID)
                       PROJECT(Ver2:Koersverschil)
                       PROJECT(Ver2:Planning)
                       PROJECT(Ver2:Valuta)
                       PROJECT(Ver2:Verwerkt)
                       PROJECT(Ver2:Klant)
                       JOIN(AREL:Relatie_PK,Ver2:Klant)
                       END
                     END
LocEnableEnterByTab  BYTE(1)                               !Used by the ENTER Instead of Tab template
EnterByTabManager    EnterByTabClass
ProgressWindow       WINDOW('Progress...'),AT(,,142,109),DOUBLE,CENTER,GRAY,TIMER(1)
                       PROGRESS,AT(15,15,111,12),USE(Progress:Thermometer),RANGE(0,100)
                       STRING(''),AT(0,3,141,10),USE(?Progress:UserString),CENTER
                       STRING(''),AT(0,30,141,10),USE(?Progress:PctText),CENTER
                       PROMPT('Soort:'),AT(5,49),USE(?Loc:Soort:Prompt)
                       LIST,AT(26,48,114,12),USE(Loc:Soort,,?Loc:Soort:2),DROP(7),FROM('Onverwerkte verkopen|#' & |
  '1|Onverwerkte verkopen zonder datum|#2|Onverwerkte verkopen op planning|#3|Onverwerk' & |
  't per Klant|#4|Verwerkt|#5|Verwerk per Klant|#6|Gefactureerd|#7|Gefactureerd per Klant|#8')
                       PROMPT('Vanaf:'),AT(5,63),USE(?Loc:VanafDatum:Prompt)
                       ENTRY(@D6),AT(80,64,60,10),USE(Loc:VanafDatum)
                       PROMPT('Tot en met:'),AT(5,77),USE(?Loc:TMDatum:Prompt)
                       ENTRY(@d6),AT(80,78,60,10),USE(Loc:TMDatum)
                       BUTTON('Pause'),AT(15,90),USE(?Pause)
                       BUTTON('Cancel'),AT(76,90,50,15),USE(?Progress:Cancel)
                     END

    omit('***',WE::CantCloseNowSetHereDone=1)  !Getting Nested omit compile error, then uncheck the "Check for duplicate CantCloseNowSetHere variable declaration" in the WinEvent local template
WE::CantCloseNowSetHereDone equate(1)
WE::CantCloseNowSetHere     long
    !***
ThisWindow           CLASS(ReportManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Init                   PROCEDURE(ProcessClass PC,<REPORT R>,<PrintPreviewClass PV>)
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
Paused                 BYTE
Timer                  LONG
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED
TakeEvent              PROCEDURE(),BYTE,PROC,DERIVED
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED
                     END

ThisProcess          CLASS(ProcessClass)                   ! Process Manager
TakeRecord             PROCEDURE(),BYTE,PROC,DERIVED
                     END

ProgressMgr          StepLongClass                         ! Progress Manager
ExcelClass         Class
InitOle                 Procedure()
MaakExcel               Procedure()
OpenExcel               Procedure(String)
SluitExcel              Procedure(Byte)
BepaalKolom             Procedure(LONG),String
SchrijfExcel            Procedure(String, LONG, String)
MaakWerkBlad            Procedure(<String>)
                   End
Loc:Ole            CString(21)
Loc:Rij            Long
Loc:OleInit        Byte

LocalClass          CLASS
NextKolom            Procedure(),String

CurrentKolom        LONG
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
  GlobalErrors.SetProcedureName('ExportVerkoop')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:APlanning.Open                                    ! File APlanning used by this procedure, so make sure it's RelationManager is open
  Relate:ExtraKosten.Open                                  ! File ExtraKosten used by this procedure, so make sure it's RelationManager is open
  Relate:Gebruiker.Open                                    ! File Gebruiker used by this procedure, so make sure it's RelationManager is open
  Relate:Partij.Open                                       ! File Partij used by this procedure, so make sure it's RelationManager is open
  Relate:Planning.SetOpenRelated()
  Relate:Planning.Open                                     ! File Planning used by this procedure, so make sure it's RelationManager is open
  Relate:ViewArtikel.Open                                  ! File ViewArtikel used by this procedure, so make sure it's RelationManager is open
  Access:Relatie.UseFile                                   ! File referenced in 'Other Files' so need to inform it's FileManager
  SELF.FilesOpened = True
  SELF.Open(ProgressWindow)                                ! Open window
  Loc:Soort=__currentTab
  Loc:VanafDatum=Date(1,1,Year(TODAY()))
  Loc:TMDatum=TODAY()
  IF Loc:Soort<=6      ! verwerkte verkoop 
    HIDE(?Loc:TMDatum)
    HIDE(?Loc:TMDatum:Prompt)
    HIDE(?Loc:VanafDatum)
    HIDE(?Loc:VanafDatum:Prompt)
  ELSE
    UNHIDE(?Loc:TMDatum)
    UNHIDE(?Loc:TMDatum:Prompt)
    UNHIDE(?Loc:VanafDatum)
    UNHIDE(?Loc:VanafDatum:Prompt)
  END
  WinAlertMouseZoom()
  Do DefineListboxStyle
  INIMgr.Fetch('ExportVerkoop',ProgressWindow)             ! Restore window settings from non-volatile store
  ProgressWindow{Prop:Timer} = 10                          ! Assign timer interval
  ProgressMgr.Init(ScrollSort:AllowNumeric,)
  ThisProcess.Init(Process:View, Relate:Verkoop, ?Progress:PctText, Progress:Thermometer, ProgressMgr, Ver2:VerkoopID)
  ThisProcess.AddSortOrder(Ver2:PK_Verkoop)
  ProgressWindow{Prop:Text} = 'Processing Records'
  ?Progress:PctText{Prop:Text} = '0% Completed'
  SELF.Init(ThisProcess)
  ?Progress:UserString{Prop:Text}=''
  SELF.AddItem(?Progress:Cancel, RequestCancelled)
  SEND(Verkoop,'QUICKSCAN=on')
  SEND(ARelatie,'QUICKSCAN=on')
  ASSERT(~SELF.DeferWindow) ! A hidden Go button is not smart ...
  SELF.KeepVisible = 1
  SELF.DeferOpenReport = 1
  SELF.Timer = TARGET{PROP:Timer}
  TARGET{PROP:Timer} = 0
  ?Pause{PROP:Text} = 'Start'
  SELF.Paused = 1
  ?Progress:Cancel{PROP:Key} = EscKey
  SELF.SetAlerts()
  EnterByTabManager.Init(False)
  RETURN ReturnValue


ThisWindow.Init PROCEDURE(ProcessClass PC,<REPORT R>,<PrintPreviewClass PV>)

  CODE
  PARENT.Init(PC,R,PV)
  WinAlertMouseZoom()


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
        ThisNetRefresh.Send('|Verkoop|') ! NetTalk (NetRefresh)
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:APlanning.Close
    Relate:ExtraKosten.Close
    Relate:Gebruiker.Close
    Relate:Partij.Close
    Relate:Planning.Close
    Relate:ViewArtikel.Close
  END
  IF SELF.Opened
    INIMgr.Update('ExportVerkoop',ProgressWindow)          ! Save window data to non-volatile store
  END
  ProgressMgr.Kill()
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
    CASE ACCEPTED()
    OF ?Pause
      IF SELF.Paused
        TARGET{PROP:Timer} = SELF.Timer
        ?Pause{PROP:Text} = 'Pause'
      ELSE
        SELF.Timer = TARGET{PROP:Timer}
        TARGET{PROP:Timer} = 0
        ?Pause{PROP:Text} = 'Restart'
      END
      SELF.Paused = 1 - SELF.Paused
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?Pause
      ThisWindow.Update()
          ! sortering of selectie opgelev
      IF Loc:Soort=1      ! onverwerkte verkoop
        ThisProcess.SetFilter('Ver2:Verwerkt = 0')
      ELSIF Loc:Soort=2      ! onverwerkte verkoop zonder Datum
        ThisProcess.SetFilter('Ver2:Verwerkt = 0 AND NULL(Ver2:Planning)')
      ELSIF Loc:Soort=3      ! onverwerkte verkoop + sorteren
        ThisProcess.AddSortOrder(Ver2:Verkoop_FK01)
        ThisProcess.SetFilter('Ver2:Verwerkt = 0')
      ELSIF Loc:Soort=4      ! onverwerkte verkoop + per klant
        ThisProcess.SetFilter('Ver2:Verwerkt = 0 AND Ver2:Klant = '&__RelatieID)
      ELSIF Loc:Soort=5      ! verwerkte verkoop 
        ThisProcess.SetFilter('Ver2:Verwerkt = 1 AND Ver2:Exported = 0')
      ELSIF Loc:Soort=6      ! verwerkte verkoop 
        ThisProcess.SetFilter('Ver2:Verwerkt = 1 AND Ver2:Exported = 0 AND Ver2:Klant = '&__RelatieID)
      ELSIF Loc:Soort=7      ! verwerkte verkoop 
        ThisProcess.SetFilter('Ver2:Verwerkt = 1 AND Ver2:Exported = 1 AND Ver2:Planning >= <39>'&Format(Loc:VanafDatum,@D10-)&' 00:00<39> AND Ver2:Planning <= <39>'&Format(Loc:TMDatum,@D10-)&' 23:59<39>')
      ELSIF Loc:Soort=8      ! verwerkte verkoop 
        ThisProcess.SetFilter('Ver2:Verwerkt = 1 AND Ver2:Exported = 1 AND Ver2:Klant = '&__RelatieID&' AND Ver2:Planning >= <39>'&Format(Loc:VanafDatum,@D10-)&' 00:00<39> AND Ver2:Planning <= <39>'&Format(Loc:TMDatum,@D10-)&' 23:59<39>')
      END
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
    OF EVENT:OpenWindow
        WE::CantCloseNow += 1
        WE::CantCloseNowSetHere = 1
    OF EVENT:Timer
      IF SELF.Paused THEN RETURN Level:Benign .
    END
  ReturnValue = PARENT.TakeWindowEvent()
    CASE EVENT()
    OF EVENT:CloseWindow
      if WE::CantCloseNow > 0 and ReturnValue = Level:Benign and WE::CantCloseNowSetHere
        WE::CantCloseNow -= 1
        WE::CantCloseNowSetHere = 0
      end
    OF EVENT:OpenWindow
        post(event:visibleondesktop)
    END
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue

ExcelClass.SchrijfExcel         Procedure(String PRM:Kolom,LONG PRM:Rij, String PRM:Value)
   Code
   Loc:Ole{'Application.Range('&Clip(PRM:Kolom)&Prm:Rij&').Value'}=PRM:Value
   RETURN
ExcelClass.MaakWerkBlad         Procedure(<String PRM:WerkBladNaam>)
   Code
   Loc:Ole{'Application.ActiveWorkBook.Sheets.Add'}
   IF PRM:WerkBladNaam<>''
    Loc:Ole{'Application.ActiveWorkBook.ActiveSheet.Name'}=Clip(PRM:WerkBladNaam)
   End
   ! Loc:Ole{'Application.ActiveWorkBook.Sheets.Select'}
   RETURN
ExcelClass.BepaalKolom    Procedure(LONG PRM:Kolom )
PRM:KolomString  string(3)
Loc:TweedeLetter    Long
Loc:EersteLetter    Long
    CODE
    PRM:Kolom-=1
    Loc:TweedeLetter=PRM:Kolom  % 26
    Loc:EersteLetter=Int(PRM:Kolom /26)

    if Loc:EersteLetter<>0
       PRM:KolomString[1]=Chr(64+Loc:EersteLetter)       ! chr(65)= 'A'
       PRM:KolomString[2]=Chr(65+Loc:TweedeLetter)
    Else
       PRM:KolomString[1]=Chr(65+Loc:TweedeLetter)
    End

    RETURN(PRM:KolomString)
ExcelClass.InitOle     Procedure
    code
    Loc:Ole  = Create(0,Create:Ole)
    Loc:Ole{Prop:Create}='Excel.Application'

    Loc:Ole{Prop:DoVerb}=1                               !  dit doet iedereen dus ik ook
    Loc:Ole{'Application.WindowState'}=1                 !  maximaliseer scherm
    Loc:Ole{'Application.Visible'}=True ! nu pas excel laten zien
    RETURN
ExcelClass.MaakExcel       Procedure
    CODE
    Loc:Ole{'Application.Workbooks.Add'}            ! leeg worksheet openen
    RETURN
ExcelClass.OpenExcel       Procedure(String prm:Bestandsnaam)
    Code
    Loc:Ole{'Application.Workbooks.Open ("'&prm:Bestandsnaam&'")'}           ! leeg worksheet openen
    RETURN
ExcelClass.SluitExcel       Procedure(Byte PRM:Close)
   Code
   If PRM:Close
       Loc:Ole{'Application.Workbooks.Close'}
   END     
   Loc:Ole{'Application.Visible'}=true  ! nu pas excel laten zien
   Loc:Ole{'Prop:Deactivate'}
   Destroy(Loc:Ole)
   RETURN
LocalClass.NextKolom        Procedure()

CODE
    SELF.CurrentKolom+=1
    RETURN ExcelClass.BepaalKolom(SELF.CurrentKolom)
    

ThisProcess.TakeRecord PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.TakeRecord()
      ! exporteren die handel
  IF Loc:OleInit=FALSE
      Loc:OleInit=TRUE
      ExcelClass.InitOle()
      ExcelClass.MaakExcel()
      Loc:Rij=1
      LocalClass.CurrentKolom=0
      ExcelClass.SchrijfExcel(LocalClass.NextKolom(),Loc:Rij,'Verkoop')
      ExcelClass.SchrijfExcel(LocalClass.NextKolom(),Loc:Rij,'DebCode')
      Loc:Ole{'Columns("'&ExcelClass.BepaalKolom(LocalClass.CurrentKolom)&':'&ExcelClass.BepaalKolom(LocalClass.CurrentKolom)&'").ColumnWidth'} = 20
      ExcelClass.SchrijfExcel(LocalClass.NextKolom(),Loc:Rij,'Klant')
      ExcelClass.SchrijfExcel(LocalClass.NextKolom(),Loc:Rij,'Vertegenwoordiger')
      ExcelClass.SchrijfExcel(LocalClass.NextKolom(),Loc:Rij,'Planning')
      ExcelClass.SchrijfExcel(LocalClass.NextKolom(),Loc:Rij,'Tijdstip')
      ExcelClass.SchrijfExcel(LocalClass.NextKolom(),Loc:Rij,'Verwerkt')
      ExcelClass.SchrijfExcel(LocalClass.NextKolom(),Loc:Rij,'Gefactureerd')
      ExcelClass.SchrijfExcel(LocalClass.NextKolom(),Loc:Rij,'Artikel')
      Loc:Ole{'Columns("'&ExcelClass.BepaalKolom(LocalClass.CurrentKolom)&':'&ExcelClass.BepaalKolom(LocalClass.CurrentKolom)&'").ColumnWidth'} = 30
      ExcelClass.SchrijfExcel(LocalClass.NextKolom(),Loc:Rij,'ArtikelOmschrijving')
      ExcelClass.SchrijfExcel(LocalClass.NextKolom(),Loc:Rij,'KG')
      ExcelClass.SchrijfExcel(LocalClass.NextKolom(),Loc:Rij,'Partij')
      ExcelClass.SchrijfExcel(LocalClass.NextKolom(),Loc:Rij,'Aanmaakdatum')
      ExcelClass.SchrijfExcel(LocalClass.NextKolom(),Loc:Rij,'Leverancier')
      ExcelClass.SchrijfExcel(LocalClass.NextKolom(),Loc:Rij,'Inkoopprijs')
      ExcelClass.SchrijfExcel(LocalClass.NextKolom(),Loc:Rij,'Verkoopprijs')
      ExcelClass.SchrijfExcel(LocalClass.NextKolom(),Loc:Rij,'Extra orderkosten')
      ExcelClass.SchrijfExcel(LocalClass.NextKolom(),Loc:Rij,'Extra regelkosten')
      ExcelClass.SchrijfExcel(LocalClass.NextKolom(),Loc:Rij,'Valuta')
      ExcelClass.SchrijfExcel(LocalClass.NextKolom(),Loc:Rij,'Koersverschil')
  END
  Clear(Pla:Record)
  Pla:VerkoopID=Ver2:VerkoopID
  Set(Pla:Planning_FK02,Pla:Planning_FK02)
  Loop until access:Planning.Next()
      IF NOT Pla:VerkoopID=Ver2:VerkoopID then Break.
      Loc:Rij+=1
      LocalClass.CurrentKolom=0
      ExcelClass.SchrijfExcel(LocalClass.NextKolom(),Loc:Rij,Ver2:VerkoopID)
      ExcelClass.SchrijfExcel(LocalClass.NextKolom(),Loc:Rij,AREL:Code)
      IF AREL:FirmaNaam=''
          ExcelClass.SchrijfExcel(LocalClass.NextKolom(),Loc:Rij,'Onbekende klantid: '&Ver2:Klant)
      ELSE
          ExcelClass.SchrijfExcel(LocalClass.NextKolom(),Loc:Rij,AREL:FirmaNaam)
      END
      Clear(Geb:Record)
      Geb:ID=Ver2:GebruikerID
      IF Access:Gebruiker.Fetch(Geb:PK_Gebruiker)=Level:Benign
      END
      ExcelClass.SchrijfExcel(LocalClass.NextKolom(),Loc:Rij,Geb:VolledigeNaam)
      
      ExcelClass.SchrijfExcel(LocalClass.NextKolom(),Loc:Rij,Format(Ver2:Planning_DATE,@D10-))
      ExcelClass.SchrijfExcel(LocalClass.NextKolom(),Loc:Rij,Format(Ver2:Planning_TIME,@T04))
      ExcelClass.SchrijfExcel(LocalClass.NextKolom(),Loc:Rij,Ver2:Verwerkt)
      ExcelClass.SchrijfExcel(LocalClass.NextKolom(),Loc:Rij,Ver2:Exported)
      
      ExcelClass.SchrijfExcel(LocalClass.NextKolom(),Loc:Rij,Pla:ArtikelID)
      Clear(Art:Record)
      Art:ArtikelID=Pla:ArtikelID
      if Access:ViewArtikel.Fetch(Art:Artikel_PK)=Level:Benign
          ExcelClass.SchrijfExcel(LocalClass.NextKolom(),Loc:Rij,Art:ArtikelOms)
      ELSE
          ExcelClass.SchrijfExcel(LocalClass.NextKolom(),Loc:Rij,'ArtikelOmschrijving onbekend')
      END
      ExcelClass.SchrijfExcel(LocalClass.NextKolom(),Loc:Rij,Pla:KG)
      ExcelClass.SchrijfExcel(LocalClass.NextKolom(),Loc:Rij,Pla:PartijID)
      IF Pla:PartijID<>0
          Clear(Par:Record)
          Par:PartijID=Pla:PartijID
          IF Access:Partij.Fetch(Par:Partij_PK)=Level:Benign
              ExcelClass.SchrijfExcel(LocalClass.NextKolom(),Loc:Rij,Format(Par:AanmaakDatum_DATE,@D10-))
              Clear(Rel:Record)
              Rel:RelatieID=Par:Leverancier
              if Access:Relatie.Fetch(Rel:Relatie_PK)=Level:Benign
              END
              ExcelClass.SchrijfExcel(LocalClass.NextKolom(),Loc:Rij,Rel:FirmaNaam)
              ExcelClass.SchrijfExcel(LocalClass.NextKolom(),Loc:Rij,Format(Par:InkoopKGPrijs,@N-7`3))
          ELSE
              ExcelClass.SchrijfExcel(LocalClass.NextKolom(),Loc:Rij,'')
              ExcelClass.SchrijfExcel(LocalClass.NextKolom(),Loc:Rij,'')
              ExcelClass.SchrijfExcel(LocalClass.NextKolom(),Loc:Rij,Format(Pla:InkoopKGPrijs,@N-7`3))
          END
      ELSE
          ExcelClass.SchrijfExcel(LocalClass.NextKolom(),Loc:Rij,'')
          ExcelClass.SchrijfExcel(LocalClass.NextKolom(),Loc:Rij,'')
          ExcelClass.SchrijfExcel(LocalClass.NextKolom(),Loc:Rij,Format(Pla:InkoopKGPrijs,@N-7`3))
      END
      ExcelClass.SchrijfExcel(LocalClass.NextKolom(),Loc:Rij,Format(Pla:VerkoopKGPrijs,@N-7`3))
      
      IF Loc:VerkoopID<>PLA:VerkoopID        ! deze maar 1 keer per verkoop  bepalen
          Loc:VerkoopID=PLA:VerkoopID
          Clear(Loc:TotaalKG)
          Clear(Loc:TotaalExtrakosten)
          FREE(Loc:ExtraKostenQ)
          Clear(Ext:Record)
          Ext:VerkoopID=PLA:VerkoopID
          Set(Ext:FK1_ExtraKosten,Ext:FK1_ExtraKosten)
          Loop Until Access:ExtraKosten.Next()
              IF not Ext:VerkoopID=PLA:VerkoopID THEN Break.
              Loc:TotaalExtrakosten+=Ext:ExtraKosten
          END
          IF Loc:TotaalExtrakosten<>0
              Clear(APla:Record)
              APla:VerkoopID=PLA:VerkoopID
              Set(APla:Planning_FK02,APla:Planning_FK02)
              Loop until access:APlanning.Next()
              IF NOT APla:VerkoopID=PLA:VerkoopID then Break.
                  LEQ:PlanningID=APla:PlanningID
                  LEQ:KG=APla:KG
                  Add(Loc:ExtraKostenQ,+LEQ:PlanningID)
                  Loc:TotaalKG+=APla:KG
                  db.DebugOut('LEQ toegevoegd Totaalkosten '&Loc:TotaalExtrakosten&' Planning '&LEQ:PlanningID&' kg '&LEQ:KG)
              END
          END
      END
      IF Records(Loc:ExtraKostenQ)=0 OR Loc:TotaalKG=0 OR Loc:TotaalExtrakosten=0
          Clear(Loc:Extrakosten)
      ELSE
          LEQ:PlanningID=Pla:PlanningID
          GET(Loc:ExtraKostenQ,+LEQ:PlanningID)
          IF NOT ERROR() AND LEQ:KG<>0
              Loc:Extrakosten = Loc:TotaalExtrakosten*LEQ:KG/Loc:TotaalKG
          END
      END
      ExcelClass.SchrijfExcel(LocalClass.NextKolom(),Loc:Rij,Format(CHOOSE(Pla:KG=0,0,Loc:Extrakosten/Pla:KG),@N-7`3))
      Clear(Loc:Extrakosten)
      Clear(Ext:Record)
      Ext:PlanningID=Pla:PlanningID
      Set(Ext:FK3_ExtraKosten,Ext:FK3_ExtraKosten)
      Loop Until Access:ExtraKosten.Next()
          IF not Ext:PlanningID=Pla:PlanningID THEN Break.
          Loc:Extrakosten+=Ext:ExtraKosten
      END
      ExcelClass.SchrijfExcel(LocalClass.NextKolom(),Loc:Rij,Format(CHOOSE(Pla:KG=0,0,Loc:Extrakosten/Pla:KG),@N-7`3))
      
      ExcelClass.SchrijfExcel(LocalClass.NextKolom(),Loc:Rij,Ver2:Valuta)
      ExcelClass.SchrijfExcel(LocalClass.NextKolom(),Loc:Rij,Format(Ver2:Koersverschil,@N-7`2))
      
  END
  RETURN ReturnValue

!!! <summary>
!!! Generated from procedure template - Report
!!! Proform Packinglist en Seaway bill
!!! </summary>
ReportPackLijst PROCEDURE (LONG pVerkoopID)

Progress:Thermometer BYTE                                  ! 
Loc:ArtikelOmschrijving STRING(160)                        ! 
Loc:VerkoopID        LONG                                  ! 
Loc:PostcodePlaats   STRING(50)                            ! 
Loc:VerpakkingOmschrijving CSTRING(50)                     ! 
Loc:Invoice          CSTRING(51)                           ! VerkoopID of ExternVerkoopID
Loc:BetaalConditie   CSTRING(51)                           ! 
Loc:DeliveryTerms    CSTRING(81)                           ! 
Loc:TotaalBedrag     DECIMAL(9,2)                          ! 
Loc:UnloadingAdress1 CSTRING(51)                           ! 
Loc:UnloadingAdress2 CSTRING(51)                           ! 
Loc:UnloadingAdress3 CSTRING(51)                           ! 
Loc:UnloadingAdress4 CSTRING(51)                           ! 
Loc:TotaalKG         DECIMAL(7,2)                          ! 
Loc:TotaalDozen      LONG                                  ! 
Loc:TotaalGrossWeight DECIMAL(9,3)                         ! 
Loc:DozenPallet      CSTRING(21)                           ! 
Loc:VoetTekst        CSTRING(20001)                        ! 
Loc:SavePath         STRING(255)                           ! 
Loc:TMPDirectory     STRING(255)                           ! 
Loc:Commando         CSTRING(10000)                        ! 
Loc:TmpAtt           STRING(255)                           ! 
Loc:Landscape        BYTE                                  ! 
Loc:LandscapeOverride BYTE                                 ! 
Loc:ExpresseRelease  CSTRING(1001)                         ! 
Loc:MailButtonID     LONG                                  ! 
Loc:PDFFileName      CSTRING(1001)                         ! 
Loc:ProForma         BYTE(1)                               ! 
Loc:PackingList      BYTE(1)                               ! 
Loc:SeaWayBill       BYTE                                  ! 
Loc:GNCodes          CSTRING(1000)                         ! 
Loc:PrintGrossWeight CSTRING(21)                           ! 
Loc:PrintNetWeight   CSTRING(21)                           ! 
Loc:PrintDozen       CSTRING(21)                           ! 
Loc:BestemmingTekst  CSTRING(1001)                         ! 
Loc:Valuta           STRING(3)                             ! 
Loc:Layout           CSTRING(21)                           ! 
Loc:Banker           CSTRING(51)                           ! 
LOC:IBANEUR          CSTRING(51)                           ! 
Loc:IBANUSD          CSTRING(51)                           ! 
LOC:BIC              CSTRING(51)                           ! 
Loc:PackLijstQ       QUEUE(PackLijstQ),PRE(LPQ)            ! 
                     END                                   ! 
Loc:TotaalQ          QUEUE,PRE(LTQ)                        ! 
ArtikelID            CSTRING(31)                           ! 
ArtikelOms           CSTRING(201)                          ! 
ArtikelOmsAlt        CSTRING(1001)                         ! 
KG                   DECIMAL(10,2)                         ! 
Pallet               LONG                                  ! 
Dozen                LONG                                  ! 
Aantal               LONG                                  ! 
GrossWeight          DECIMAL(8,3)                          ! 
VerkoopPrijs         DECIMAL(11,3)                         ! 
VerpakkingID         LONG                                  ! 
VerpakkingOmschrijving CSTRING(51)                         ! 
Bedrag               DECIMAL(11,2)                         ! 
PlantNumber          CSTRING(51)                           ! 
ProductieDatum       DATE                                  ! 
THTDatum             DATE                                  ! 
GNCode               CSTRING(100)                          ! 
                     END                                   ! 
Process:View         VIEW(Verkoop)
                       PROJECT(Ver2:Aan)
                       PROJECT(Ver2:BESCWaiver)
                       PROJECT(Ver2:Boekingsnr)
                       PROJECT(Ver2:Containernr)
                       PROJECT(Ver2:ExpresseRelease)
                       PROJECT(Ver2:ExternVerkoopID)
                       PROJECT(Ver2:Laadhaven)
                       PROJECT(Ver2:OmschrijvingGoederen)
                       PROJECT(Ver2:Planning_DATE)
                       PROJECT(Ver2:ProFormaMemo)
                       PROJECT(Ver2:Sealnr)
                       PROJECT(Ver2:TarraContainer)
                       PROJECT(Ver2:VerkoopID)
                       PROJECT(Ver2:Vessel)
                       PROJECT(Ver2:Klant)
                       JOIN(AREL:Relatie_PK,Ver2:Klant)
                         PROJECT(AREL:Adres1)
                         PROJECT(AREL:Country)
                         PROJECT(AREL:FirmaNaam)
                         PROJECT(AREL:PaymentCondition)
                         PROJECT(AREL:Plaats)
                         PROJECT(AREL:Postcode)
                       END
                     END
LocEnableEnterByTab  BYTE(1)                               !Used by the ENTER Instead of Tab template
EnterByTabManager    EnterByTabClass
ProgressWindow       WINDOW('Progress...'),AT(,,142,143),DOUBLE,CENTER,GRAY,TIMER(1)
                       PROGRESS,AT(15,15,111,12),USE(Progress:Thermometer),RANGE(0,100)
                       STRING(''),AT(0,3,141,10),USE(?Progress:UserString),CENTER
                       STRING(''),AT(0,30,141,10),USE(?Progress:PctText),CENTER
                       CHECK(' ProForma:'),AT(15,43),USE(Loc:ProForma)
                       CHECK(' Packing List:'),AT(15,57),USE(Loc:PackingList)
                       CHECK('Sea Way Bill:'),AT(15,71),USE(Loc:SeaWayBill)
                       BUTTON('Pause'),AT(15,122,50,15),USE(?Pause),DEFAULT
                       BUTTON('Cancel'),AT(76,122,50,15),USE(?Progress:Cancel)
                       PROMPT('Layout:'),AT(15,85),USE(?Loc:Layout:Prompt)
                       LIST,AT(40,84,93,11),USE(Loc:Layout),DROP(3),FROM('ABN|RABO|BLANCO')
                     END

Report               REPORT,AT(500,2052,7042,8708),PRE(RPT),PAPER(PAPER:A4),FONT('Arial',10,,FONT:regular,CHARSET:ANSI), |
  THOUS
                       HEADER,AT(500,448,7042,1552),USE(?Header)
                         IMAGE('VENBriefhoofd.jpg'),AT(167,156,6667,1250),USE(?IMAGE1)
                         IMAGE('IFS.jpg'),AT(5740,1083,1062,323),USE(?IMAGEIFSKOP)
                       END
detailKop              DETAIL,AT(0,0,7042,2656),USE(?DETAIL3)
                         STRING('Mail address:'),AT(31,31),USE(?STRING1),FONT(,8,,FONT:bold)
                         STRING('P.O. Box 467 - 5700 AL - Helmond - NL Netherlands'),AT(31,187,2812,198),USE(?STRING1:2), |
  FONT(,8)
                         STRING(@s50),AT(4292,31),USE(AREL:FirmaNaam),LEFT
                         STRING(@s100),AT(4292,260),USE(AREL:Adres1),LEFT
                         STRING(@s50),AT(4292,521,2656),USE(Loc:PostcodePlaats),LEFT
                         STRING(@s60),AT(4292,750),USE(AREL:Country)
                         STRING('Invoice:'),AT(4312,1865,562,198),USE(?STRING2)
                         STRING('Visiting address:'),AT(31,406,1042,177),USE(?STRING1:3),FONT(,8,,FONT:bold)
                         STRING('Stipdonk 46A - 5715 PD - Lierop - NL Netherlands'),AT(31,562,2615,198),USE(?STRING1:4), |
  FONT(,8)
                         STRING('Tel:'),AT(31,802,792,177),USE(?STRING1:5),FONT(,8,,FONT:bold)
                         STRING('Fax:'),AT(31,969,792,177),USE(?STRING1:10),FONT(,8,,FONT:bold)
                         STRING('Internet:'),AT(31,1135,792,177),USE(?STRING1:11),FONT(,8,,FONT:bold)
                         STRING('E-mail:'),AT(31,1292,792,177),USE(?STRING1:12),FONT(,8,,FONT:bold)
                         STRING('Banker:'),AT(31,1490,792,177),USE(?STRING1:6),FONT(,8,,FONT:bold)
                         STRING(@s50),AT(4875,1875,2073),USE(Loc:Invoice)
                         STRING('Date:'),AT(4312,2125,562,198),USE(?STRING2:3)
                         STRING(@d17),AT(4854,2146),USE(Ver2:Planning_DATE)
                         STRING('IBAN EUR:'),AT(31,1667,792,177),USE(?STRING1:7),FONT(,8,,FONT:bold)
                         STRING('IBAN USD:'),AT(31,1833,792,177),USE(?IBANUSD),FONT(,8,,FONT:bold)
                         STRING('BIC:'),AT(31,2010,792,177),USE(?STRING1:14),FONT(,8,,FONT:bold)
                         STRING('K.v.K.:'),AT(31,2187,792,177),USE(?STRING1:15),FONT(,8,,FONT:bold)
                         STRING('VAT no.:'),AT(31,2385,792,177),USE(?STRING1:16),FONT(,8,,FONT:bold)
                         STRING('+31 (0) 492-537066'),AT(750,792,1135,198),USE(?STRING1:17),FONT(,8)
                         STRING('+31 (0) 492-529655'),AT(750,969,1135,198),USE(?STRING1:18),FONT(,8)
                         STRING('www.venpoultry.nl'),AT(750,1115,1135,198),USE(?STRING1:19),FONT(,8)
                         STRING('info@venpoultry.nl'),AT(750,1292,1135,198),USE(?STRING1:20),FONT(,8)
                         STRING(@s50),AT(750,1510,1896,198),USE(Loc:Banker),FONT(,8)
                         STRING(@s50),AT(750,1667,1896,198),USE(LOC:IBANEUR),FONT(,8)
                         STRING(@s50),AT(750,1833,1896,198),USE(Loc:IBANUSD),FONT(,8)
                         STRING(@s50),AT(750,2010,1448,198),USE(LOC:BIC),FONT(,8)
                         STRING('17082395'),AT(750,2187,1448,198),USE(?KVK),FONT(,8)
                         STRING('NL802389521B01'),AT(750,2396,1448,198),USE(?BTWnummer),FONT(,8)
                         STRING(@s100),AT(4312,1187),USE(RAD:Adres1),FONT(,,,FONT:bold)
                         STRING(@s100),AT(4312,1406),USE(RAD:Adres2),FONT(,,,FONT:bold)
                         STRING(@s10),AT(4312,1677),USE(RAD:Postcode),FONT(,,,FONT:bold)
                         STRING(@s100),AT(5125,1667,1844),USE(RAD:Plaats),FONT(,,,FONT:bold)
                         STRING('B.O.O.'),AT(4323,969),USE(?boo),FONT(,8,,FONT:bold)
                       END
detailMemo             DETAIL,AT(0,0,7042,250),USE(?DETAILMEMO)
                         TEXT,AT(31,0,6844,927),USE(Ver2:ProFormaMemo),RESIZE
                       END
detailTotaal           DETAIL,AT(0,0,7042,1292),USE(?DETAILTotaal),PAGEAFTER(1)
                         STRING('Delivery terms:'),AT(3312,333),USE(?Deliveryterms)
                         STRING(@s80),AT(4312,333),USE(Loc:DeliveryTerms)
                         STRING('Container:'),AT(3312,562,906,198),USE(?Container)
                         STRING('Seal:'),AT(3312,802,906,198),USE(?Seal)
                         STRING('Vessel:'),AT(3312,1031,906,198),USE(?Vessel)
                         STRING('Total:'),AT(31,83,906,198),USE(?STRING3:5),FONT(,,,FONT:bold+FONT:underline)
                         STRING('Gross weight:'),AT(31,333,906,198),USE(?STRING3:6)
                         STRING('Net weight:'),AT(31,562,906,198),USE(?STRING3:7)
                         STRING(@s20),AT(31,802,906,198),USE(Loc:DozenPallet)
                         STRING(@n-14.1),AT(1000,562),USE(Loc:TotaalKG),RIGHT(2)
                         STRING(@s50),AT(4312,562),USE(Ver2:Containernr)
                         STRING(@s50),AT(4312,802),USE(Ver2:Sealnr)
                         STRING(@s50),AT(4312,1031),USE(Ver2:Vessel)
                         STRING(@n-14),AT(1000,802),USE(Loc:TotaalDozen),RIGHT(2)
                         STRING(@n-14.1),AT(1000,333),USE(Loc:TotaalGrossWeight,,?Loc:TotaalGrossWeight:2),RIGHT(2)
                         STRING('Payment terms:'),AT(3312,83,1042,198),USE(?Paymentterms)
                         STRING(@s50),AT(4312,83),USE(Loc:BetaalConditie)
                       END
detailBillKop          DETAIL,AT(0,0,7042,4156),USE(?DETAIL5)
                         STRING('Referentie:'),AT(177,2156),USE(?STRING8),FONT(,,,FONT:regular)
                         STRING('Boeking:'),AT(177,1906,656,198),USE(?STRING8:2),FONT(,,,FONT:regular)
                         STRING('Opdrachtgever:'),AT(177,2510,1000,198),USE(?STRING8:7)
                         STRING('Ven Poultry b.v.'),AT(1677,2510,969,198),USE(?STRING7:9),FONT(,,,FONT:regular)
                         STRING('P.O. Box 467'),AT(1677,2719),USE(?STRING12)
                         STRING('5700 AL Helmond'),AT(1677,2948,1167,198),USE(?STRING12:2)
                         STRING('Ontvanger / Notify:'),AT(177,3271,1292,198),USE(?STRING8:8)
                         STRING('Aan:'),AT(177,135),USE(?STRING18),FONT(,,,FONT:bold)
                         STRING('Van:'),AT(177,490,292,198),USE(?STRING18:2),FONT(,,,FONT:bold)
                         LINE,AT(198,417,6375,0),USE(?LINE2)
                         LINE,AT(187,781,6375,0),USE(?LINE2:2)
                         LINE,AT(198,1187,6375,0),USE(?LINE2:3)
                         STRING('Betreft:'),AT(177,896),USE(?STRING19),FONT(,,,FONT:bold)
                         STRING('VEN Poultry B.V.'),AT(781,490),USE(?STRING20)
                         STRING('Seaway Bill'),AT(802,885),USE(?STRING21)
                         STRING(@s50),AT(1677,3271),USE(Loc:UnloadingAdress1,,?Loc:UnloadingAdress1:2)
                         STRING(@s50),AT(1677,3469),USE(Loc:UnloadingAdress2,,?Loc:UnloadingAdress2:2)
                         STRING(@s50),AT(1677,3667),USE(Loc:UnloadingAdress3,,?Loc:UnloadingAdress3:2)
                         STRING(@s50),AT(1677,3865),USE(Loc:UnloadingAdress4,,?Loc:UnloadingAdress4:2)
                         STRING(@s50),AT(1677,2156,2500,198),USE(AREL:FirmaNaam,,?AREL:FirmaNaam:4),LEFT
                         STRING(@s50),AT(1677,1906),USE(Ver2:Boekingsnr)
                         STRING(@d17),AT(4792,490,823,198),USE(Ver2:Planning_DATE,,?Ver2:Planning_DATE:2)
                         STRING('Datum / Date:'),AT(3635,490),USE(?STRING9),FONT(,,,FONT:bold)
                         STRING('Fax:'),AT(3635,135),USE(?STRING23),FONT(,,,FONT:bold)
                         STRING('Pag.:'),AT(3635,865),USE(?STRING24),FONT(,,,FONT:bold)
                         STRING('1'),AT(4740,885),USE(?STRING25)
                         LINE,AT(198,1833,6375,0),USE(?LINE2:4)
                         LINE,AT(198,2427,6375,0),USE(?LINE2:5)
                         LINE,AT(198,3187,6375,0),USE(?LINE2:6)
                         STRING(@s50),AT(781,135),USE(Ver2:Aan)
                         TEXT,AT(177,1260,6385,500),USE(Loc:BestemmingTekst)
                       END
detailBillGoederen     DETAIL,AT(0,0),USE(?DETAIL2)
                         LINE,AT(198,62,6375,0),USE(?LINE2:7)
                         STRING('Omschrijving goederen:'),AT(177,156),USE(?STRING26)
                         TEXT,AT(1698,156,5250,979),USE(Ver2:OmschrijvingGoederen),RESIZE
                       END
detailBillVoet         DETAIL,AT(0,0,7042,3125),USE(?DETAIL6)
                         STRING('Seal:'),AT(198,625,656,198),USE(?STRING8:3)
                         STRING(@s50),AT(1698,625,2500,198),USE(Ver2:Sealnr,,?Ver2:Sealnr:2)
                         STRING('Bootnaam:'),AT(198,385),USE(?STRING11)
                         STRING(@s50),AT(1698,385),USE(Ver2:Vessel,,?Ver2:Vessel:2)
                         STRING('Uitvoerhaven:'),AT(198,1365,927,198),USE(?STRING8:4),FONT(,,,FONT:regular)
                         STRING('GNCodes:'),AT(198,146,656,198),USE(?STRING8:6)
                         STRING(@s255),AT(1698,146,5333),USE(Loc:GNCodes)
                         STRING('Tarra Container:'),AT(198,1854),USE(?STRING13),FONT(,,,FONT:regular)
                         STRING('BESC/Waiver:'),AT(198,1604,958,198),USE(?STRING13:2),FONT(,,,FONT:regular)
                         STRING('Express Release:'),AT(198,854,1281,198),USE(?STRING13:3),FONT(,,,FONT:regular)
                         STRING('Draft B/L ter controle a.u.b. mailen naar: <09H>logistics@venpoultry.nl'),AT(198,2135), |
  USE(?STRING14),FONT(,,,FONT:regular)
                         STRING('Met vriendelijke groet,'),AT(198,2427),USE(?STRING16)
                         STRING('Ven Poultry B.V'),AT(198,2844,1323,198),USE(?STRING16:2)
                         STRING(@s50),AT(1698,1365),USE(Ver2:Laadhaven)
                         STRING(@n6),AT(1687,1875),USE(Ver2:TarraContainer),RIGHT(1)
                         LINE,AT(198,73,6375,0),USE(?LINE2:8)
                         STRING(@s20),AT(1740,1625),USE(Ver2:BESCWaiver)
                         TEXT,AT(1719,854,5250,490),USE(Loc:ExpresseRelease)
                       END
Detail                 DETAIL,AT(0,0,7042,198),USE(?Detail),FONT(,10)
                         STRING(@n-11.2),AT(31,10,604),USE(LTQ:KG),FONT('Arial',8),RIGHT
                         STRING(@n-11.3),AT(4854,10),USE(LTQ:VerkoopPrijs),FONT(,8,,FONT:regular),RIGHT(2)
                         STRING(@s60),AT(990,10,3000),USE(LTQ:ArtikelOms),FONT(,8)
                         STRING(@s3),AT(6500,10,469),USE(Loc:Valuta),FONT(,8)
                         STRING(@n-15.2),AT(5625,10,792),USE(LTQ:Bedrag),FONT(,8),RIGHT(2)
                         STRING('kg'),AT(729,10),USE(?STRING22),FONT(,8)
                       END
DetailBodyTotaal       DETAIL,AT(0,0,7042,437),USE(?DETAILBodyTotaal)
                         STRING(@s3),AT(6500,104,500,198),USE(Loc:Valuta,,?Loc:Valuta:2),FONT(,,,FONT:bold)
                         STRING('Total:'),AT(4792,115,562,198),USE(?STRING2:2),FONT(,,,FONT:bold)
                         STRING(@n-13`2),AT(5396,104),USE(Loc:TotaalBedrag),FONT(,,,FONT:bold),RIGHT(2)
                       END
detailKaart            DETAIL,AT(0,0,2323,2031),USE(?DETAIL1)
                         STRING('Gross weight:'),AT(31,427,906,198),USE(?Grossweight),FONT(,8,,FONT:regular)
                         STRING('Net weight:'),AT(31,615,906,198),USE(?Netweight),FONT(,8)
                         STRING('Origin:'),AT(31,1021,740,198),USE(?Origin),FONT(,8)
                         STRING('GN code:'),AT(31,229,740,198),USE(?GNCode),FONT(,8,,FONT:regular)
                         STRING('Description:'),AT(31,31,729,198),USE(?STRING2:9),FONT(,8)
                         STRING(@s50),AT(552,1021,1562),USE(LTQ:PlantNumber),FONT(,8),RIGHT
                         STRING('Production date:'),AT(31,1260),USE(?Productiondate),FONT(,8)
                         STRING('Expiry date:'),AT(31,1458,,198),USE(?Expirydate),FONT(,8)
                         STRING(@s20),AT(1052,812,1062),USE(Loc:PrintDozen),FONT(,8),RIGHT
                         STRING(@s20),AT(906,417,1208),USE(Loc:PrintGrossWeight),FONT(,8),RIGHT
                         STRING(@s20),AT(906,615,1208,198),USE(Loc:PrintNetWeight),FONT(,8),RIGHT
                         STRING(@s99),AT(562,240,1552),USE(LTQ:GNCode),FONT(,8),RIGHT
                         STRING(@d17),AT(1437,1260),USE(LTQ:ProductieDatum,,?LTQ:ProductieDatum:2),FONT(,8),RIGHT
                         STRING(@d17),AT(1437,1458),USE(LTQ:THTDatum,,?LTQ:THTDatum:2),FONT(,8),RIGHT
                         TEXT,AT(729,31,1406,198),USE(LTQ:ArtikelOmsAlt),FONT(,8),RESIZE
                         STRING('Cartons:'),AT(31,792,906,198),USE(?Cartons),FONT(,8)
                       END
detailPackList         DETAIL,AT(0,0,7042,3240),USE(?DETAIL4),FONT(,,,FONT:bold)
                         STRING('PACKINGLIST'),AT(2604,31),USE(?STRING4),FONT(,,,FONT:bold)
                         LINE,AT(83,177,6900,0),USE(?LINE1)
                         STRING('Receiver:'),AT(167,302),USE(?STRING5),FONT(,,,FONT:regular+FONT:underline)
                         STRING('Sender:'),AT(4156,302,562,198),USE(?STRING5:2),FONT(,,,FONT:regular+FONT:underline)
                         STRING('Unloading:'),AT(167,1490,781,198),USE(?STRING5:3),FONT(,,,FONT:regular+FONT:underline)
                         STRING('Loading:'),AT(4156,1490,562,198),USE(?STRING5:4),FONT(,,,FONT:regular+FONT:underline)
                         LINE,AT(62,3104,6896,0),USE(?LINE1:2)
                         STRING('Date'),AT(146,2823),USE(?STRING6)
                         STRING('coldstore Ven Poultry'),AT(4156,2823,1521,198),USE(?STRING6:2)
                         IMAGE('NL5664EG.png'),AT(5740,1958,1255,1130),USE(?IMAGE2)
                         STRING(@s50),AT(906,302),USE(AREL:FirmaNaam,,?AREL:FirmaNaam:2),FONT(,,,FONT:bold),LEFT
                         STRING(@s100),AT(906,531),USE(AREL:Adres1,,?AREL:Adres1:2),FONT(,,,FONT:bold),LEFT
                         STRING(@s99),AT(906,719,2917),USE(Loc:PostcodePlaats,,?Loc:PostcodePlaats:2),FONT(,,,FONT:bold)
                         STRING(@s60),AT(906,937),USE(AREL:Country,,?AREL:Country:2)
                         STRING('Ven Poultry b.v.'),AT(4958,281),USE(?STRING7),FONT(,,,FONT:regular)
                         STRING('Stipdonk 46A'),AT(4958,490,948,198),USE(?STRING7:2),FONT(,,,FONT:regular)
                         STRING('5715 PD Lierop'),AT(4958,719,948,198),USE(?STRING7:3),FONT(,,,FONT:regular)
                         STRING('The Netherlands'),AT(4958,937,1187,198),USE(?STRING7:4),FONT(,,,FONT:regular)
                         STRING('Ven Poultry b.v.'),AT(4958,1490,948,198),USE(?STRING7:5),FONT(,,,FONT:regular)
                         STRING('Stipdonk 46A'),AT(4958,1698,948,198),USE(?STRING7:6),FONT(,,,FONT:regular)
                         STRING('5715 PD Lierop'),AT(4958,1937,948,198),USE(?STRING7:7),FONT(,,,FONT:regular)
                         STRING('The Netherlands'),AT(4958,2177,1010,198),USE(?STRING7:8),FONT(,,,FONT:regular)
                         STRING(@s50),AT(906,1490),USE(Loc:UnloadingAdress1)
                         STRING(@s50),AT(906,1698),USE(Loc:UnloadingAdress2)
                         STRING(@s50),AT(906,1937),USE(Loc:UnloadingAdress3)
                         STRING(@s50),AT(906,2177),USE(Loc:UnloadingAdress4)
                         STRING(@D6-),AT(906,2823),USE(Ver2:Planning_DATE,,?Ver2:Planning_DATE:3)
                       END
                       FOOTER,AT(594,10823,7042,677),USE(?Footer)
                         LINE,AT(10,417,6896,0),USE(?LINE1:3),COLOR(COLOR:Red)
                         TEXT,AT(-21,437,7542,208),USE(Loc:VoetTekst),FONT(,7)
                         IMAGE('IFS.jpg'),AT(5875,0),USE(?IMAGEIFSVOET)
                       END
                       FORM,AT(542,479,7052,11073),USE(?Form)
                       END
                     END
    omit('***',WE::CantCloseNowSetHereDone=1)  !Getting Nested omit compile error, then uncheck the "Check for duplicate CantCloseNowSetHere variable declaration" in the WinEvent local template
WE::CantCloseNowSetHereDone equate(1)
WE::CantCloseNowSetHere     long
    !***
ThisWindow           CLASS(ReportManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Init                   PROCEDURE(ProcessClass PC,<REPORT R>,<PrintPreviewClass PV>)
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
OpenReport             PROCEDURE(),BYTE,PROC,DERIVED
Paused                 BYTE
Timer                  LONG
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED
TakeEvent              PROCEDURE(),BYTE,PROC,DERIVED
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED
                     END

ThisReport           CLASS(ProcessClass)                   ! Process Manager
TakeRecord             PROCEDURE(),BYTE,PROC,DERIVED
                     END

ProgressMgr          StepLongClass                         ! Progress Manager
Previewer            CLASS(PrintPreviewClass)              ! Print Previewer
Open                   PROCEDURE(),DERIVED
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED
                     END

TargetSelector       ReportTargetSelectorClass             ! Report Target Selector
PDFReporter          CLASS(PDFReportGenerator)             ! PDF
SetUp                  PROCEDURE(),DERIVED
                     END

LocalPrintClass     CLASS
MarkeerEQ               Procedure(LONG _equate, BOOL _gevuld)
PrintTotalQ             Procedure(Loc:TotaalQ _ltq)
                    END
PackLijstClass      ClassPackLijst

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
  GlobalErrors.SetProcedureName('ReportPackLijst')
  Loc:VerkoopID=PVerkoopID
  
  Loc:VoetTekst='All our quotations, agreements and commitments are subject to our General Conditions registerd with the Chamber of Commerce for Brabant, Eindhoven Netherlands'
  Loc:Layout='ABN'
  
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:ArtikelOmschrijvingExtra.Open                     ! File ArtikelOmschrijvingExtra used by this procedure, so make sure it's RelationManager is open
  Relate:DeliveryTerms.Open                                ! File DeliveryTerms used by this procedure, so make sure it's RelationManager is open
  Relate:GNCode.Open                                       ! File GNCode used by this procedure, so make sure it's RelationManager is open
  Relate:GNCodeArtikelen.Open                              ! File GNCodeArtikelen used by this procedure, so make sure it's RelationManager is open
  Relate:Gebruiker.Open                                    ! File Gebruiker used by this procedure, so make sure it's RelationManager is open
  Relate:Planning.SetOpenRelated()
  Relate:Planning.Open                                     ! File Planning used by this procedure, so make sure it's RelationManager is open
  Relate:RelatieAdres.Open                                 ! File RelatieAdres used by this procedure, so make sure it's RelationManager is open
  Relate:Verpakking.Open                                   ! File Verpakking used by this procedure, so make sure it's RelationManager is open
  Relate:ViewArtikel.Open                                  ! File ViewArtikel used by this procedure, so make sure it's RelationManager is open
  Relate:ViewBetcd.Open                                    ! File ViewBetcd used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(ProgressWindow)                                ! Open window
  WinAlertMouseZoom()
  Do DefineListboxStyle
  INIMgr.Fetch('ReportPackLijst',ProgressWindow)           ! Restore window settings from non-volatile store
  TargetSelector.AddItem(PDFReporter.IReportGenerator)
  SELF.AddItem(TargetSelector)
  ProgressMgr.Init(ScrollSort:AllowNumeric,)
  ThisReport.Init(Process:View, Relate:Verkoop, ?Progress:PctText, Progress:Thermometer, ProgressMgr, Ver2:VerkoopID)
  ThisReport.AddSortOrder(Ver2:PK_Verkoop)
  ThisReport.AddRange(Ver2:VerkoopID,Loc:VerkoopID)
  SELF.AddItem(?Progress:Cancel,RequestCancelled)
  SELF.Init(ThisReport,Report,Previewer)
  ?Progress:UserString{PROP:Text} = ''
  Relate:Verkoop.SetQuickScan(1,Propagate:OneMany)
  ProgressWindow{PROP:Timer} = 10                          ! Assign timer interval
  SELF.SkipPreview = False
  Previewer.SetINIManager(INIMgr)
  Previewer.AllowUserZoom = True
  ASSERT(~SELF.DeferWindow) ! A hidden Go button is not smart ...
  SELF.KeepVisible = 1
  SELF.DeferOpenReport = 1
  SELF.Timer = TARGET{PROP:Timer}
  TARGET{PROP:Timer} = 0
  ?Pause{PROP:Text} = 'Start'
  SELF.Paused = 1
  ?Progress:Cancel{PROP:Key} = EscKey
  SELF.SetAlerts()
  EnterByTabManager.Init(False)
  RETURN ReturnValue


ThisWindow.Init PROCEDURE(ProcessClass PC,<REPORT R>,<PrintPreviewClass PV>)

  CODE
  PARENT.Init(PC,R,PV)
  WinAlertMouseZoom()


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:ArtikelOmschrijvingExtra.Close
    Relate:DeliveryTerms.Close
    Relate:GNCode.Close
    Relate:GNCodeArtikelen.Close
    Relate:Gebruiker.Close
    Relate:Planning.Close
    Relate:RelatieAdres.Close
    Relate:Verpakking.Close
    Relate:ViewArtikel.Close
    Relate:ViewBetcd.Close
  END
  IF SELF.Opened
    INIMgr.Update('ReportPackLijst',ProgressWindow)        ! Save window data to non-volatile store
  END
  ProgressMgr.Kill()
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.OpenReport PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  SYSTEM{PROP:PrintMode} = 3
  ReturnValue = PARENT.OpenReport()
  IF ReturnValue = Level:Benign
    SELF.Report{PROPPRINT:Extend}=True
  END
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
    CASE ACCEPTED()
    OF ?Pause
      IF SELF.Paused
        TARGET{PROP:Timer} = SELF.Timer
        ?Pause{PROP:Text} = 'Pause'
      ELSE
        SELF.Timer = TARGET{PROP:Timer}
        TARGET{PROP:Timer} = 0
        ?Pause{PROP:Text} = 'Restart'
      END
      SELF.Paused = 1 - SELF.Paused
    END
  ReturnValue = PARENT.TakeAccepted()
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
    OF EVENT:Timer
      IF SELF.Paused THEN RETURN Level:Benign .
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

LocalPrintClass.MarkeerEQ   Procedure(LONG _equate, BOOL _gevuld)

CODE
    IF (_gevuld)
        REPORT$_equate{PROP:Color,1}=COLOR:None
    ELSE
        REPORT$_equate{PROP:Color,1}=COLOR:Red
    END
    
    RETURN
    
LocalPrintClass.PrintTotalQ Procedure(Loc:TotaalQ _ltq)
YPosGNCode                      LONG(240)
YPosGrossweight                 LONG(427)
YPosNetweigt                    LONG(615)
YPosDozen                       LONG(802)
YPosOrigin                      LONG(1021)
YPosProductionDate             LONG(1260)
YPosExpirationDate              LONG(1458)

HoogteRegel                     LONG(25)
CODE
    Loc:PrintGrossWeight=Format(_ltq:GrossWeight,@n14.1)&' kg'
    Loc:PrintNetWeight=Format(_ltq:KG,@n14.1)&' kg'
    IF _ltq:Dozen<>0
        Loc:PrintDozen=_ltq:Dozen
        !Loc:PromptDozen='Cartons'
    ELSIF _ltq:Aantal<>0
        Loc:PrintDozen=_ltq:Aantal
        !Loc:PromptDozen=''
        Report$?Cartons{Prop:Text}='Pallets'
    ELSE
        Loc:PrintDozen=''
        !Loc:PromptDozen=''
        Report$?Cartons{Prop:Text}=''
    END
    
    LocalPrintClass.MarkeerEQ(?Loc:PrintGrossWeight, CHOOSE(_ltq:GrossWeight<_ltq:KG, FALSE,TRUE))
    LocalPrintClass.MarkeerEQ(?Loc:PrintNetWeight, CHOOSE(_ltq:KG=0, FALSE,TRUE))
    !LocalPrintClass.MarkeerEQ(?Loc:PrintDozen, CHOOSE(_ltq:Aantal=0, FALSE,TRUE))
    
    LocalPrintClass.MarkeerEQ(?Origin, CHOOSE(_LTQ:PlantNumber='', FALSE,TRUE))
    LocalPrintClass.MarkeerEQ(?GNCode, CHOOSE(_LTQ:GNCode='', FALSE,TRUE))
    LocalPrintClass.MarkeerEQ(?Productiondate, CHOOSE(_LTQ:ProductieDatum=0, FALSE,TRUE))
    LocalPrintClass.MarkeerEQ(?Expirydate, CHOOSE(_LTQ:THTDatum=0, FALSE,TRUE))
    ! Onder de artikelomschrijving staan de Productie en Expirydate 
    ! Deze staan goed als Report$?LTQ:ArtikelOms:3{PROP:LineCount } = 1
    ! en anders omlaag zetten 
    Report$?Productiondate{Prop:Ypos}=YPosProductionDate+(Report$?LTQ:ArtikelOmsAlt{PROP:LineCount } - 1)*HoogteRegel
    Report$?LTQ:ProductieDatum:2{Prop:Ypos}=YPosProductionDate+(Report$?LTQ:ArtikelOmsAlt{PROP:LineCount } - 1)*HoogteRegel
    Report$?Expirydate{Prop:Ypos}=YPosExpirationDate+(Report$?LTQ:ArtikelOmsAlt{PROP:LineCount } - 1)*HoogteRegel
    Report$?LTQ:THTDatum:2{Prop:Ypos}=YPosExpirationDate+(Report$?LTQ:ArtikelOmsAlt{PROP:LineCount } - 1)*HoogteRegel
    !2019-18-11 en nu willen ze artikel omschrijving als eerst veld dus alleenmaal verplaatsten
    Report$?GNCode{Prop:Ypos}=YPosGNCode+(Report$?LTQ:ArtikelOmsAlt{PROP:LineCount } - 1)*HoogteRegel    
    Report$?LTQ:GNCode{Prop:Ypos}=YPosGNCode+(Report$?LTQ:ArtikelOmsAlt{PROP:LineCount } - 1)*HoogteRegel
    
    Report$?Grossweight{Prop:Ypos}=YPosGrossweight+(Report$?LTQ:ArtikelOmsAlt{PROP:LineCount } - 1)*HoogteRegel
    Report$?Loc:PrintGrossWeight{Prop:Ypos}=YPosGrossweight+(Report$?LTQ:ArtikelOmsAlt{PROP:LineCount } - 1)*HoogteRegel
    Report$?Netweight{Prop:Ypos}=YPosNetweigt+(Report$?LTQ:ArtikelOmsAlt{PROP:LineCount } - 1)*HoogteRegel
    Report$?Loc:PrintNetWeight{Prop:Ypos}=YPosNetweigt+(Report$?LTQ:ArtikelOmsAlt{PROP:LineCount } - 1)*HoogteRegel
    Report$?Cartons{Prop:Ypos}=YPosDozen+(Report$?LTQ:ArtikelOmsAlt{PROP:LineCount } - 1)*HoogteRegel
    Report$?Loc:PrintDozen{Prop:Ypos}=YPosDozen+(Report$?LTQ:ArtikelOmsAlt{PROP:LineCount } - 1)*HoogteRegel
    Report$?Origin{Prop:Ypos}=YPosOrigin+(Report$?LTQ:ArtikelOmsAlt{PROP:LineCount } - 1)*HoogteRegel
    Report$?LTQ:PlantNumber{Prop:Ypos}=YPosOrigin+(Report$?LTQ:ArtikelOmsAlt{PROP:LineCount } - 1)*HoogteRegel
    PRINT(RPT:DetailKaart)
    Return
    

ThisReport.TakeRecord PROCEDURE

ReturnValue          BYTE,AUTO

SkipDetails BYTE
  CODE
  IF Loc:Layout='ABN'
      Loc:Banker='ABN AMRO BANK Amsterdam'
      LOC:IBANEUR='NL17 ABNA 0819 2365 00'
      Loc:IBANUSD='NL12 ABNA 0819 2370 27'
      LOC:BIC='ABNANL2A'
      Report$?IMAGEIFSKOP{Prop:hide}=TRUE
  ELSIF Loc:Layout='RABO'
      Loc:Banker='RABOBANK Utrecht'
      LOC:IBANEUR='NL79 RABO 0134 121600'
      Report$?IBANUSD{Prop:Text}='Accountno.:' 
      Loc:IBANUSD='13.41.21.600'
      LOC:BIC='RABONL2U'
      Report$?IMAGEIFSVOET{Prop:hide}=TRUE
  ELSE
      Report$?IMAGEIFSVOET{Prop:hide}=TRUE
      Report$?IMAGEIFSKOP{Prop:hide}=TRUE
      Loc:Banker=''
      LOC:IBANEUR=''
      Loc:IBANUSD=''
      LOC:BIC=''
      Report$?Image1{Prop:hide}=TRUE
      Report$?IMAGEIFSKOP{Prop:hide}=TRUE
      Report$?IMAGEIFSVOET{Prop:hide}=TRUE
      Report$?STRING1{Prop:hide}=TRUE
      Report$?STRING1:2{Prop:hide}=TRUE
      Report$?STRING1:3{Prop:hide}=TRUE
      Report$?STRING1:4{Prop:hide}=TRUE
      Report$?STRING1:5{Prop:hide}=TRUE
      Report$?STRING1:17{Prop:hide}=TRUE
      Report$?STRING1:10{Prop:hide}=TRUE
      Report$?STRING1:18{Prop:hide}=TRUE
      Report$?STRING1:11{Prop:hide}=TRUE
      Report$?STRING1:19{Prop:hide}=TRUE
      Report$?STRING1:12{Prop:hide}=TRUE
      Report$?STRING1:20{Prop:hide}=TRUE
      Report$?STRING1:6{Prop:hide}=TRUE
      Report$?STRING1:7{Prop:hide}=TRUE
      Report$?IBANUSD{Prop:hide}=TRUE
      Report$?STRING1:14{Prop:hide}=TRUE
      Report$?STRING1:15{Prop:hide}=TRUE
      Report$?STRING1:16{Prop:hide}=TRUE
      Report$?Loc:VoetTekst{Prop:hide}=TRUE
      Report$?LINE1:3{Prop:hide}=TRUE
      Report$?KVK{Prop:hide}=TRUE
      Report$?BTWnummer{Prop:hide}=TRUE
  END
  ReturnValue = PARENT.TakeRecord()
  Free(Loc:PackLijstQ)
  PackLijstClass.VulPackLijstQ(Ver2:VerkoopID, Loc:PackLijstQ)
  FREE(Loc:TotaalQ)
  Clear(Loc:GNCodes)
  Loop i#=1 TO Records(Loc:PackLijstQ)
      GET(Loc:PackLijstQ,i#)
      LTQ:ArtikelID=LPQ:ArtikelID
      LTQ:ArtikelOms=LPQ:ArtikelOms
      LTQ:ArtikelOmsAlt=LPQ:ArtikelOmsAlt
      LTQ:KG=LPQ:KG
      LTQ:Pallet=LPQ:Pallet
      LTQ:Dozen=LPQ:Dozen
      LTQ:Aantal=LPQ:Aantal
      LTQ:GrossWeight=LPQ:GrossWeight
      LTQ:VerkoopPrijs=LPQ:VerkoopPrijs
      LTQ:VerpakkingID=LPQ:VerpakkingID
      LTQ:VerpakkingOmschrijving=LPQ:VerpakkingOmschrijving
      LTQ:Bedrag=LPQ:Bedrag
      LTQ:PlantNumber=LPQ:PlantNumber
      LTQ:ProductieDatum=LPQ:ProductieDatum
      LTQ:THTDatum=LPQ:THTDatum
      LTQ:GNCode=LPQ:GNCode
      
      ! Loc:TotaalQ :=: Loc:PackLijstQ            wERKT NIET VOOR DE DATUMS
      IF Loc:GNCodes=''
          Loc:GNCodes=LTQ:GNCode
      ELSIF NOT Instring(LTQ:GNCode,Loc:GNCodes,1,1)
          Loc:GNCodes=CLIP(Loc:GNCodes)&', '&LTQ:GNCode
      END
      Add(Loc:TotaalQ)
      Loc:TotaalDozen+=LTQ:Dozen
      Loc:TotaalKG+=LTQ:KG
      Loc:TotaalGrossWeight+=LTQ:GrossWeight
      Loc:TotaalBedrag+=LTQ:KG*LTQ:VerkoopPrijs
  END
  IF Loc:TotaalDozen=0
      Loc:DozenPallet=''
      !Loc:PromptDozen=''
       Report$?Cartons{Prop:Text}=''
  ELSE
      Loc:DozenPallet='Cartons'
      !Loc:PromptDozen='Cartons'
  END
  
  Loc:PostcodePlaats=CLIP(AREL:Postcode)&Clip(' '&AREL:Plaats)
  IF Ver2:ExternVerkoopID=''
      Loc:Invoice = Ver2:VerkoopID
  ELSE
      Loc:Invoice = Ver2:ExternVerkoopID
  END    
  !Loc:Invoice=CHOOSE(Ver2:ExternVerkoopID='',Ver2:VerkoopID,Ver2:ExternVerkoopID)
  !Message(Loc:Invoice&'|'&Ver2:ExternVerkoopID&'|'&Ver2:VerkoopID)
  Clear(RAD:Record)
  IF Ver2:KlantAlternatiefAdres=0
      Report$?boo{Prop:Hide}=TRUE
      Loc:UnloadingAdress1=AREL:FirmaNaam
      Loc:UnloadingAdress2=AREL:Adres1
      Loc:UnloadingAdress3=Loc:PostcodePlaats
      Loc:UnloadingAdress4=AREL:Country
  ELSE
      RAD:ID=Ver2:KlantAlternatiefAdres
      IF Access:RelatieAdres.Fetch(RAD:PK_RelatieAdres)=Level:Benign
          Loc:UnloadingAdress1=RAD:Adres1
          Loc:UnloadingAdress2=RAD:Adres2
          Loc:UnloadingAdress3=CLIP(RAD:Postcode)&CLIP(' '&RAD:Plaats)
          Loc:UnloadingAdress4=RAD:Land
      END
  END
  
  Clear(BTC:Record)
  BTC:betcdID=Ver2:PaymentCondition
  if Access:ViewBetCD.Fetch(BTC:ViewBetcd_PK)=Level:Benign
      if BTC:Description=''
          Loc:BetaalConditie=BTC:Omschrijving
      ELSE
          Loc:BetaalConditie=BTC:Description
      END
  END
  
  Clear(DLT:Record)
  DLT:DeliveryTermsID=Ver2:DeliveryTermsID
  If Access:DeliveryTerms.Fetch(DLT:PK_DeliveryTerms)=Level:Benign
      Loc:DeliveryTerms=DLT:Omschrijving
  END
  
  Loc:BestemmingTekst='Hier volgen de gegevens betreffende de verlading heden van container '&CLIP(Ver2:Containernr)&|
      'met bestemming '&Ver2:Loshaven
  IF Loc:ProForma  
      LocalPrintClass.MarkeerEQ(?AREL:FirmaNaam, CHOOSE(AREL:FirmaNaam='', FALSE,TRUE))
      LocalPrintClass.MarkeerEQ(?AREL:FirmaNaam:2, CHOOSE(AREL:FirmaNaam='', FALSE,TRUE))
      LocalPrintClass.MarkeerEQ(?AREL:Adres1, CHOOSE(AREL:Adres1='', FALSE,TRUE))
      LocalPrintClass.MarkeerEQ(?AREL:Adres1:2, CHOOSE(AREL:Adres1='', FALSE,TRUE))
      LocalPrintClass.MarkeerEQ(?STRING2, CHOOSE(Loc:Invoice='', FALSE,TRUE))
      LocalPrintClass.MarkeerEQ(?Ver2:Planning_DATE, CHOOSE(Ver2:Planning_DATE=0, FALSE,TRUE))
      PRINT(RPT:detailKop)        
      Report$?Productiondate{Prop:Hide}=TRUE
      Report$?Expirydate{Prop:Hide}=TRUE
      Report$?LTQ:ProductieDatum:2{Prop:Hide}=TRUE
      Report$?LTQ:THTDatum:2{Prop:Hide}=TRUE
      Report$?Paymentterms{Prop:Hide}=FALSE
      Report$?Loc:BetaalConditie{Prop:Hide}=FALSE
      Report$?Deliveryterms{Prop:Hide}=FALSE
      Report$?Loc:DeliveryTerms{Prop:Hide}=FALSE
          ! door de planning lopen en de Queue vullen
      Loop i#=1 TO Records(Loc:TotaalQ)
          GET(Loc:TotaalQ,i#)
          LocalPrintClass.MarkeerEQ(?LTQ:VerkoopPrijs, CHOOSE(LTQ:VerkoopPrijs=0, FALSE,TRUE))
          LocalPrintClass.MarkeerEQ(?LTQ:KG, CHOOSE(LTQ:KG=0, FALSE,TRUE))
          LocalPrintClass.MarkeerEQ(?LTQ:ArtikelOms, CHOOSE(LTQ:ArtikelOms='', FALSE,TRUE))
          Case Ver2:Valuta
          of 'Dollar'
              Loc:Valuta='USD'
          of 'Pond'
              Loc:Valuta='GBP'
          ELSE
              Loc:Valuta='EUR'
          END
          PRINT(RPT:Detail)
      END
      Print(RPT:detailBodyTotaal)
      Loop i#=1 TO Records(Loc:TotaalQ)
          GET(Loc:TotaalQ,i#)
          LocalPrintClass.PrintTotalQ(Loc:TotaalQ)
      END
      IF Ver2:ProFormaMemo<>''
          PRINT(RPT:DETAILMEMO)
      END
      
      LocalPrintClass.MarkeerEQ(?Paymentterms, CHOOSE(Loc:BetaalConditie='', FALSE,TRUE))
      LocalPrintClass.MarkeerEQ(?Deliveryterms, CHOOSE(Loc:DeliveryTerms='', FALSE,TRUE))
      LocalPrintClass.MarkeerEQ(?Container, CHOOSE(Ver2:Containernr='', FALSE,TRUE))
      LocalPrintClass.MarkeerEQ(?Seal, CHOOSE(Ver2:Sealnr='', FALSE,TRUE))
      LocalPrintClass.MarkeerEQ(?Vessel, CHOOSE(Ver2:Vessel='', FALSE,TRUE))
      PRINT(RPT:DetailTotaal)
  END
  IF Loc:PackingList
      ! 2e pagina 
      Report$?Productiondate{Prop:Hide}=FALSE
      Report$?Expirydate{Prop:Hide}=FALSE
      Report$?LTQ:ProductieDatum:2{Prop:Hide}=FALSE
      Report$?LTQ:THTDatum:2{Prop:Hide}=FALSE
      Report$?Paymentterms{Prop:Hide}=TRUE
      Report$?Loc:BetaalConditie{Prop:Hide}=TRUE
      Report$?Deliveryterms{Prop:Hide}=FALSE          ! Delivery terms laten zien op Packinglijst
      Report$?Loc:DeliveryTerms{Prop:Hide}=FALSE
      PRINT(RPT:detailPackList)
      Loop i#=1 TO Records(Loc:TotaalQ)
          GET(Loc:TotaalQ,i#)
          LocalPrintClass.PrintTotalQ(Loc:TotaalQ)
      END
      IF Ver2:ProFormaMemo<>''
          PRINT(RPT:DETAILMEMO)
      END
      LocalPrintClass.MarkeerEQ(?Paymentterms, CHOOSE(Loc:BetaalConditie='', FALSE,TRUE))
      LocalPrintClass.MarkeerEQ(?Deliveryterms, CHOOSE(Loc:DeliveryTerms='', FALSE,TRUE))
      LocalPrintClass.MarkeerEQ(?Container, CHOOSE(Ver2:Containernr='', FALSE,TRUE))
      LocalPrintClass.MarkeerEQ(?Seal, CHOOSE(Ver2:Sealnr='', FALSE,TRUE))
      LocalPrintClass.MarkeerEQ(?Vessel, CHOOSE(Ver2:Vessel='', FALSE,TRUE))
      PRINT(RPT:DetailTotaal)
      
  END
  IF Loc:SeaWayBill
      ! 3e pagina 
    !  PRINT(RPT:detailKop)        
      ! footer uitschakelen
      Report$?Footer{Prop:Hide}=TRUE
      Case  Ver2:ExpresseRelease
      OF 1
          Loc:ExpresseRelease='Ja'
      OF 2
          Loc:ExpresseRelease= 'Draft B/L ter controle a.u.b. mailen na : logistics@venpoultry.nl<13,10>Na goedkeuring Ven Poultry per koerier (DHL) originele B/L naar Ven Poultry opsturen'
      OF 3
          Loc:ExpresseRelease= 'Ja, Telex release na akkoord Bart !!!!!!!<13,10>deze expresse Release dient in eerste instantie bij jullie vastgehouden te worden. Niet naar ons opsturen AUB|<13,10>Zodra Bart hiervoor toestemming geeft evt, via Marcel, dan pas de B/L oer telex release vrijgeven AUB'
      END
      
      PRINT(RPT:detailBillKop)
      PRINT(RPT:detailBillGoederen)
      PRINT(RPT:detailBillVoet)
  END
  IF FALSE
  PRINT(RPT:detailKop)
  PRINT(RPT:detailMemo)
  PRINT(RPT:detailTotaal)
  PRINT(RPT:detailBillKop)
  PRINT(RPT:detailBillGoederen)
  PRINT(RPT:detailBillVoet)
  PRINT(RPT:Detail)
  PRINT(RPT:DetailBodyTotaal)
  PRINT(RPT:detailKaart)
  PRINT(RPT:detailPackList)
      END
  RETURN ReturnValue


Previewer.Open PROCEDURE

  CODE
  PARENT.Open
    !Find equate for the toolbar
    Findtoolbar#= 0
    loop
      Findtoolbar#= target{prop:nextfield,Findtoolbar#}
      if Findtoolbar# = 0 then break.
      if Findtoolbar#{prop:type} = create:toolbar then break.
    end
    ! MailButton
    Loc:MailButtonID=CREATE(0,CREATE:Button,Findtoolbar#)
    Loc:MailButtonID{prop:msg}       = 'Printvoorbeeld emailen'
    Loc:MailButtonID{Prop:Icon}      = '~Send.ico'
    Loc:MailButtonID{Prop:Flat}     = true
    Loc:MailButtonID{Prop:Text}     = ''
  
    Setposition(Loc:MailButtonID,4,2,32,32)   ! Mail-button weer voorraan zetten
    UNHIDE(Loc:MailButtonID)
    DISPLAY(Loc:MailButtonID)
  
    if Findtoolbar# > 0 then
      Controls# = 0
      loop
        Controls#= target{prop:nextfield,Controls#}
        if Controls# = 0 then break.
        ! De controls van de toolbar verplaatsen (behalve de mailbutton). Controls met een hoge equate zijn ondersteunde controls van de listbox? (i.i.g. niet verplaatsen)
        if Controls#{prop:parent} = Findtoolbar# AND Controls# <> Loc:MailButtonID AND Controls# < 30000 THEN
          HIDE(Controls#)
          SetPosition(Controls#, Controls#{PROP:XPos} + 34,Controls#{PROP:YPos}, Controls#{PROP:Width} , Controls#{PROP:Height})
          UNHIDE(Controls#)
          DISPLAY(Controls#)
        end
      end
     end


Previewer.TakeAccepted PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.TakeAccepted()
    IF FIELD()=Loc:MailButtonID
       Loc:SavePath=Clip(Path())
       if not(Records(Self.ImageQueue)) then
          Message('Er is niet om gestuurd te worden')
          Return Level:Fatal
       end
       Loc:Commando=GetIni('Mail','wmf2pdf','wmf2pdf.exe',path()&'\mail.ini')
       Loc:TMPDirectory=''
       ! kijken wat de tijdelijke directory is van de wmf bestanden
       Loc:PDFFileName=GETTEMPPATH()
       IF Loc:ProForma 
           Loc:PDFFileName=CLIP(Loc:PDFFileName)&'Invoice'
       END
       IF Loc:PackingList 
           Loc:PDFFileName=CLIP(Loc:PDFFileName)&'PackingList'
       END
       IF Loc:SeaWayBill
           Loc:PDFFileName=CLIP(Loc:PDFFileName)&'SeaWayBill'
       END    
       Loc:PDFFileName=CLIP(Loc:PDFFileName)&'.pdf'
       ThisWindow.SetReportTarget(PDFReporter.IReportGenerator)
       Previewer.OnSaveAs()  
       
        IF FALSE
       Loop i#=1 to Records(Self.ImageQueue)
         Get(Self.ImageQueue,i#)
         if not error()
            if Loc:TMPDirectory=''
               Loop j#=Len(Clip(Self.ImageQueue.FileName)) to 1 by -1
                  if Sub(Clip(Self.ImageQueue.FileName),j#,1)='\'
                     Loc:TMPDirectory=Sub(Clip(Self.ImageQueue.FileName),1,j#)
                     Break
                   end
               end
               Loc:TmpAtt='"'&Clip(Loc:TMPDirectory)&Shortpath('InvoiceSeaWayBill' &'.pdf')&'"'
                IF Records(Self.ImageQueue) <= 200
                  Loc:Commando=Clip(Loc:Commando)& ' Output='& Clip(Loc:TmpAtt) &' Input="'&Clip(Self.ImageQueue.FileName)
                ELSE
                   Ini"=Today()&'.'&Clock()
                   Loc:Commando=Clip(Loc:Commando)& ' Output='& Clip(Loc:TmpAtt) &' Ini='&path()&'\'&Ini"&'"'
                   PUTINI('Export','Totaal',Records(Self.ImageQueue),path()&'\'&Ini")
                   PUTINI('Export',i#,Clip(Self.ImageQueue.FileName),path()&'\'&Ini")
                END
            else
                IF Records(Self.ImageQueue) <= 200
                   Loc:Commando=Clip(Loc:Commando)& ';'& Clip(Self.ImageQueue.FileName)
                ELSE
                   PUTINI('Export',i#,Clip(Self.ImageQueue.FileName),path()&'\'&Ini")
                END
            end
         end
       end
        END
        Loc:Commando='wmf2pdf.exe output="'&Loc:PDFFileName
        
       IF Loc:LandscapeOverride THEN
          IF Loc:Landscape THEN
              Loc:Commando=Clip(Loc:Commando)& '" Landscape'
          ELSE
              Loc:Commando=Clip(Loc:Commando)& '"'
          END
       ELSE
          IF Report{PROP:Landscape} THEN
              Loc:Commando=Clip(Loc:Commando)& '" Landscape'
          ELSE
              Loc:Commando=Clip(Loc:Commando)& '"'
          END
       END
  
       Loc:Commando=Clip(Loc:Commando)& ' Subject="'& 'InvoiceSeaWayBill' &'"'
       !Loc:Commando=Clip(Loc:Commando)& ' Subject="'& 'SalesConfirmation' &'"'
       !Loc:Commando=Clip(Loc:Commando)& ' To="'& &'"'
       Run(Loc:Commando,1)
  
       if path()<>Loc:SavePath
          setpath(Loc:SavePath)
          if error() then stop(Error()&'  bij het terugzetten van het path').
       end
  
       POST(Event:CloseDown)
    END
  RETURN ReturnValue


PDFReporter.SetUp PROCEDURE

  CODE
  PARENT.SetUp
  SELF.SetFileName(Loc:PDFFileName)
  SELF.SetDocumentInfo('CW Report','VoorrRpt','ReportVerkoopBevestiging','ReportVerkoopBevestiging','','')
  SELF.SetPagesAsParentBookmark(False)
  SELF.SetScanCopyMode(False)
  SELF.CompressText   = True
  SELF.CompressImages = True

