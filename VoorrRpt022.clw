

   MEMBER('VoorrRpt.clw')                                  ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABREPORT.INC'),ONCE

                     MAP
                       INCLUDE('VOORRRPT022.INC'),ONCE        !Local module procedure declarations
                     END


!!! <summary>
!!! Generated from procedure template - Process
!!! </summary>
ReportPalletBlad PROCEDURE (PRM:PlanningID)

udpt            UltimateDebugProcedureTracker
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

ThisWindow           CLASS(ReportManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
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
? DEBUGHOOK(AAPlanning:Record)
? DEBUGHOOK(AARelatie:Record)
? DEBUGHOOK(AAViewArtikel:Record)
? DEBUGHOOK(AMutatie:Record)
? DEBUGHOOK(AVerkoop:Record)
? DEBUGHOOK(ArtikelOmschrijvingExtra:Record)
? DEBUGHOOK(Mutatie:Record)
? DEBUGHOOK(Weging:Record)
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
        udpt.Init(UD,'ReportPalletBlad','VoorrRpt022.clw','VoorrRpt.DLL','07/01/2024 @ 08:52PM')    
             
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
  Do DefineListboxStyle
  ProgressWindow{Prop:Alrt,255} = CtrlShiftP
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


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
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
            
   
  IF BAND(Keystate(),KeyStateUD:Shift) 
        UD.ShowProcedureInfo('ReportPalletBlad',UD.SetApplicationName('VoorrRpt','DLL'),ProgressWindow{PROP:Hlp},'03/29/2013 @ 03:46PM','07/01/2024 @ 08:52PM','10/11/2024 @ 01:54PM')  
    
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
    OF EVENT:Timer
      IF SELF.Paused THEN RETURN Level:Benign .
    END
  ReturnValue = PARENT.TakeWindowEvent()
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
      
      IF WEG:ProductionDate_DATE
          GLO:UitslagPalletbladProductionDate11 = WEG:ProductionDate_DATE
      END
      IF WEG:THTDate_DATE
          GLO:UitslagPalletbladSellByDate15 = WEG:THTDate_DATE
      END
      IF WEG:HarvastDate_DATE
          GLO:UitslagPalletbladHarvastDate7007 = WEG:HarvastDate_DATE
      END
  
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

