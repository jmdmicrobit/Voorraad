

   MEMBER('VoorrVrd.clw')                                  ! This is a MEMBER module


   INCLUDE('ABDROPS.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('VOORRVRD014.INC'),ONCE        !Local module procedure declarations
                     END


!!! <summary>
!!! Generated from procedure template - Window
!!! Cel / Lokatie wijzigen
!!! </summary>
WijzigLocatie_Orgineel PROCEDURE (PRM:PartijID, PRM:CelID)

udpt            UltimateDebugProcedureTracker
LOC:PartijID         LONG                                  ! 
LOC:CelID            LONG                                  ! 
LOC:NieuweCelID      LONG                                  ! 
LOC:NieuweCelLocatieID LONG                                ! 
Loc:HuidgeCelLocatieNamen CSTRING(255)                     ! 
Loc:HuidigeCelNaam   CSTRING(51)                           ! 
FDCB7::View:FileDropCombo VIEW(CelLocatie)
                       PROJECT(CL:Locatienaam)
                       PROJECT(CL:CelLocatieID)
                     END
FDCB10::View:FileDropCombo VIEW(Cel)
                       PROJECT(CEL:CelOms)
                       PROJECT(CEL:CelID)
                     END
Queue:FileDropCombo  QUEUE                            !
CL:Locatienaam         LIKE(CL:Locatienaam)           !List box control field - type derived from field
CL:CelLocatieID        LIKE(CL:CelLocatieID)          !Primary key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
Queue:FileDropCombo:1 QUEUE                           !
CEL:CelOms             LIKE(CEL:CelOms)               !List box control field - type derived from field
CEL:CelID              LIKE(CEL:CelID)                !Primary key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
LocEnableEnterByTab  BYTE(1)                               !Used by the ENTER Instead of Tab template
EnterByTabManager    EnterByTabClass
QuickWindow          WINDOW('Cel / Locatie wijzigen'),AT(,,436,86),FONT('MS Sans Serif',8,,FONT:regular,CHARSET:DEFAULT), |
  DOUBLE,CENTER,GRAY,IMM,HLP('WijzigLocatie'),SYSTEM
                       PROMPT('Huidige Cel:'),AT(9,12),USE(?PROMPT3:2)
                       STRING(@s50),AT(61,12),USE(Loc:HuidigeCelNaam),FONT('Microsoft Sans Serif',,,FONT:bold)
                       PROMPT('Huidige locatie:'),AT(9,35),USE(?PROMPT3)
                       PROMPT('Nieuwe Cel:'),AT(235,12),USE(?PROMPT2)
                       COMBO(@s50),AT(289,12,135,12),USE(CEL:CelOms),DROP(25),FORMAT('200L(2)|M~Cel Oms~L(0)@s50@'), |
  FROM(Queue:FileDropCombo:1),IMM
                       PROMPT('Nieuwe locatie:'),AT(235,35),USE(?PROMPT1)
                       COMBO(@s50),AT(289,36,135,12),USE(CL:Locatienaam),DROP(25),FORMAT('200L(2)|M~Locatienaa' & |
  'm~L(0)@s50@'),FROM(Queue:FileDropCombo),IMM
                       BUTTON('&Cancel'),AT(374,64,49,14),USE(?Cancel),LEFT,ICON('WACANCEL.ICO'),FLAT,MSG('Cancel Operation'), |
  TIP('Cancel Operation')
                       BUTTON('&OK'),AT(322,64,49,14),USE(?Ok),LEFT,ICON('WAOK.ICO'),FLAT,MSG('Accept operation'), |
  TIP('Accept Operation')
                       STRING(@s254),AT(63,35,159),USE(Loc:HuidgeCelLocatieNamen,,?Loc:HuidgeCelLocatieNamen:2),FONT('Microsoft ' & |
  'Sans Serif',,,FONT:bold)
                     END

ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED
TakeEvent              PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
FDCB7                CLASS(FileDropComboClass)             ! File drop combo manager
Q                      &Queue:FileDropCombo           !Reference to browse queue type
                     END

FDCB10               CLASS(FileDropComboClass)             ! File drop combo manager
Q                      &Queue:FileDropCombo:1         !Reference to browse queue type
                     END

Resizer              CLASS(WindowResizeClass)
Init                   PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)
                     END


  CODE
? DEBUGHOOK(Cel:Record)
? DEBUGHOOK(CelLocatie:Record)
? DEBUGHOOK(Mutatie:Record)
? DEBUGHOOK(ViewPartijCelLocaties:Record)
  GlobalResponse = ThisWindow.Run()                        ! Opens the window and starts an Accept Loop

!---------------------------------------------------------------------------
DefineListboxStyle ROUTINE
!|
!| This routine create all the styles to be shared in this window
!| It`s called after the window open
!|
!---------------------------------------------------------------------------
VulHuidigeCelLocatieQueue   ROUTINE
	CLEAR(Loc:HuidgeCelLocatieNamen)
	Clear(VPCL:Record)	
	VPCL:PartijID = LOC:PartijID
	VPCL:CelID = LOC:CelID
	SET(VPCL:ViewPartijCelLocaties_PK,VPCL:ViewPartijCelLocaties_PK)
	LOOP UNTIL Access:ViewPartijCelLocaties.Next()
		IF NOT (VPCL:PartijID = LOC:PartijID AND VPCL:CelID = LOC:CelID) THEN BREAK.
		
        IF NOT INSTRING(CLIP(VPCL:CelLocatienaam),Loc:HuidgeCelLocatieNamen,1,1)
            if Loc:HuidgeCelLocatieNamen=''
                Loc:HuidgeCelLocatieNamen=VPCL:CelLocatienaam
            ELSE
                Loc:HuidgeCelLocatieNamen=CLIP(Loc:HuidgeCelLocatieNamen)&','&VPCL:CelLocatienaam
            END
        END
        
	END	
	
	EXIT

ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
        udpt.Init(UD,'WijzigLocatie_Orgineel','VoorrVrd014.clw','VoorrVrd.DLL','03/13/2019 @ 01:43PM')    
             
  GlobalErrors.SetProcedureName('WijzigLocatie_Orgineel')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?PROMPT3:2
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  IF SELF.Request = SelectRecord
     SELF.AddItem(?Ok,RequestCancelled)                    ! Add the close control to the window manger
  ELSE
     SELF.AddItem(?Ok,RequestCompleted)                    ! Add the close control to the window manger
  END
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  Relate:Cel.SetOpenRelated()
  Relate:Cel.Open                                          ! File Cel used by this procedure, so make sure it's RelationManager is open
  Relate:Mutatie.Open                                      ! File Mutatie used by this procedure, so make sure it's RelationManager is open
  Relate:ViewPartijCelLocaties.Open                        ! File ViewPartijCelLocaties used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  db.DebugOut('WijzigLocatie:' & PRM:PartijID & ', ' & PRM:CelID)
  LOC:PartijID = PRM:PartijID
  LOC:CelID = PRM:CelID
  Clear(Cel:Record)
  Cel:CelID=LOC:CelID 
  IF Access:Cel.Fetch(CEL:CEL_PK)=Level:Benign
      Loc:HuidigeCelNaam=CEL:CelOms
  END
  
  !LOC:HuidigeCelLocatieNaam = 'Alle locatie''s'
  DO VulHuidigeCelLocatieQueue
  
  LOC:NieuweCelID = LOC:CelID
  
  CLEAR(CL:Record)
  
  SELF.Open(QuickWindow)                                   ! Open window
  Do DefineListboxStyle
  QuickWindow{Prop:Alrt,255} = CtrlShiftP
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('WijzigLocatie_Orgineel',QuickWindow)       ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  FDCB7.Init(CL:Locatienaam,?CL:Locatienaam,Queue:FileDropCombo.ViewPosition,FDCB7::View:FileDropCombo,Queue:FileDropCombo,Relate:CelLocatie,ThisWindow,GlobalErrors,0,1,0)
  FDCB7.Q &= Queue:FileDropCombo
  FDCB7.AddSortOrder(CL:FK_CelLocatie)
  FDCB7.AddRange(CL:CelID,LOC:NieuweCelID)
  FDCB7.AddField(CL:Locatienaam,FDCB7.Q.CL:Locatienaam) !List box control field - type derived from field
  FDCB7.AddField(CL:CelLocatieID,FDCB7.Q.CL:CelLocatieID) !Primary key field - type derived from field
  FDCB7.AddUpdateField(CL:CelLocatieID,LOC:NieuweCelLocatieID)
  ThisWindow.AddItem(FDCB7.WindowComponent)
  FDCB7.DefaultFill = 0
  FDCB10.Init(CEL:CelOms,?CEL:CelOms,Queue:FileDropCombo:1.ViewPosition,FDCB10::View:FileDropCombo,Queue:FileDropCombo:1,Relate:Cel,ThisWindow,GlobalErrors,0,1,0)
  FDCB10.Q &= Queue:FileDropCombo:1
  FDCB10.AddSortOrder(CEL:CEL_PK)
  FDCB10.AddField(CEL:CelOms,FDCB10.Q.CEL:CelOms) !List box control field - type derived from field
  FDCB10.AddField(CEL:CelID,FDCB10.Q.CEL:CelID) !Primary key field - type derived from field
  FDCB10.AddUpdateField(CEL:CelID,LOC:NieuweCelID)
  ThisWindow.AddItem(FDCB10.WindowComponent)
  FDCB10.DefaultFill = 0
  SELF.SetAlerts()
  EnterByTabManager.ExcludeControl(?Cancel)
  EnterByTabManager.ExcludeControl(?Ok)
  EnterByTabManager.Init(False)
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:Cel.Close
    Relate:Mutatie.Close
    Relate:ViewPartijCelLocaties.Close
  END
  IF SELF.Opened
    INIMgr.Update('WijzigLocatie_Orgineel',QuickWindow)    ! Save window data to non-volatile store
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
    OF ?Ok
      ThisWindow.Update()
      !IF MEssage('Weet u zeker dat de voorraad van '&CLIP(Loc:HuidigeCelNaam)&'('&LOC:CelID&') en locatie '&Loc:HuidgeCelLocatieNamen&|
      !    '|overgeboekt moet worden op '&LOC:NieuweCelID&' met locatie '&LOC:NieuweCelLocatieID,'Corrigeer Cel/Locatie',ICON:Question,BUTTON:NO+BUTTON:YES, BUTTON:YES)=Button:No
      !    CYCLE
      !END
      
      ! 2018-10-9 Omdat alle UIT mutaties niet op locatie gaan is het niet mogelijk per locatie te corrigeren
      ! allen per cel. 
      
      !Stop(LOC:CelID&' '&LOC:NieuweCelID&' '&LOC:NieuweCelLocatieID) 
      
      ! 2018-9-4 Pff eens proberen te begrijpen wat Dimitri hiermee van plan is
      ! De voorraad bestaat uit mutaties, dus als we de voorraad willen verplaatsten (zonder overboeking)
      CLEAR(Mut:Record)
      Mut:PartijID = LOC:PartijID
      SET(Mut:Mutatie_FK01,Mut:Mutatie_FK01)
      LOOP UNTIL Access:Mutatie.Next()
          IF NOT Mut:PartijID = LOC:PartijID THEN BREAK.
          IF Mut:CelID <> LOC:CelID AND Mut:NaarCELID <> LOC:CelID THEN CYCLE.    ! alleen de mutaties van Loc:CelID of naar de betreffende Cel
      
          IF Mut:CelID = LOC:CelID  
              ! 15-10-2018 Onderstaand aangepast omdat sommige INslag mutaties wel op locatie nul zijn  (bijv Perron)
              !F (Mut:CelLocatieID <> 0  AND INSTRING('IN',Mut:SoortMutatie,1,1))            ! IN en OIN 
              IF INSTRING('IN',Mut:SoortMutatie,1,1)            ! IN en OIN 
                  Mut:CelLocatieID = LOC:NieuweCelLocatieID
                  Mut:CelID = LOC:NieuweCelID
              ELSIF (Mut:CelLocatieID=0 AND Mut:SoortMutatie='UIT') THEN  ! alleen de gekozen Locatie nemen
                  Mut:CelID = LOC:NieuweCelID
              ELSIF (Mut:SoortMutatie='OUIT') THEN  
                  Mut:CelID = LOC:NieuweCelID
                  Mut:CelLocatieID = LOC:NieuweCelLocatieID
              END
          END
          IF Mut:NaarCELID = LOC:CelID AND Mut:CelLocatieID <> 0 THEN   			! Betreft een OUIT / OIN
              IF Mut:SoortMutatie = 'OUIT' 
      				! Bij uitgaande overboeking, geeft de cel-locatie die van de Mut:NaarCelID weer
                  Mut:CelLocatieID = LOC:NieuweCelLocatieID
                  Mut:NaarCELID = LOC:NieuweCelID
              END
          END		
      !	IF LOC:CelID <> LOC:NieuweCelID THEN 		            ! Cel wijziging, huidige cel-locatie keuze negeren
      !		IF Mut:CelID = LOC:CelID THEN           			! Geen inkomende overboeking
      !			Mut:CelID = LOC:NieuweCelID
      !			IF Mut:SoortMutatie <> 'OUIT' THEN
      !				! Bij uitgaande overboeking, geeft de cel-locatie die van de Mut:NaarCelID weer
      !				Mut:CelLocatieID = LOC:NieuweCelLocatieID
      !			END
      !		END
      !		
      !		IF Mut:NaarCELID = LOC:CelID THEN
      !			! Betreft een OUIT / OIN
      !			Mut:NaarCELID = LOC:NieuweCelID
      !			IF Mut:SoortMutatie = 'OUIT'
      !				! Bij uitgaande overboeking, geeft de cel-locatie die van de Mut:NaarCelID weer
      !				Mut:CelLocatieID = LOC:NieuweCelLocatieID
      !			END
      !		END
      !	ELSE        		! Geen cel wijziging, huidige cel-locatie keuze niet negeren
      !		HLQ:LocatieNaam = LOC:HuidigeCelLocatieNaam
      !        GET(LOC:HuidigeLocatieQueue, +HLQ:LocatieNaam)
      !        IF ERROR() THEN MESSAGE('ERROR '&ERROR()&' bij het inlezen van de LOC:HuidigeCelLocatieNaam').
      !        
      !		IF HLQ:LocatieID = -1 OR HLQ:LocatieID = Mut:CelLocatieID THEN  ! als Alle Locaties of Gekozen  locatie gelijk aan huidige lokatie
      !			IF Mut:SoortMutatie <> 'OUIT' THEN  ! Bij uitgaande overboeking, geeft de cel-locatie die van de Mut:NaarCelID weer
      !				Mut:CelLocatieID = LOC:NieuweCelLocatieID
      !			END
      !		END
      !		IF Mut:NaarCELID = LOC:CelID THEN   			! Betreft een OUIT / OIN
      !			IF Mut:SoortMutatie = 'OUIT'
      !				! Bij uitgaande overboeking, geeft de cel-locatie die van de Mut:NaarCelID weer
      !				IF HLQ:LocatieID = -1 OR HLQ:LocatieID = Mut:CelLocatieID THEN
      !					Mut:CelLocatieID = LOC:NieuweCelLocatieID
      !				END
      !			END
      !		END		
      !	END
          GLO:GebruikerLogHandelingOpmerking='Corrigeer Cel/Locatie'	
          Access:Mutatie.Update()
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
     IF KEYCODE()=CtrlShiftP AND EVENT() = Event:PreAlertKey
       CYCLE
     END
     IF KEYCODE()=CtrlShiftP  
        UD.ShowProcedureInfo('WijzigLocatie_Orgineel',UD.SetApplicationName('VoorrVrd','DLL'),QuickWindow{PROP:Hlp},'03/13/2019 @ 01:42PM','03/13/2019 @ 01:43PM','10/11/2024 @ 01:55PM')  
    
       CYCLE
     END
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window

