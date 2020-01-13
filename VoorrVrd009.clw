

   MEMBER('VoorrVrd.clw')                                  ! This is a MEMBER module


   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('VOORRVRD009.INC'),ONCE        !Local module procedure declarations
                     END


!!! <summary>
!!! Generated from procedure template - Window
!!! Cel / Lokatie wijzigen
!!! </summary>
WijzigLocatie PROCEDURE (LONG PRM:PartijID,LONG PRM:CelID)

LOC:PartijID         LONG                                  ! 
Loc:CelKG            LONG                                  ! 
Loc:CelPallet        LONG                                  ! 
Loc:HuidigeKG        DECIMAL(9,2)                          ! 
Loc:HuidigeKGWijzing LONG                                  ! 
Loc:HuidigeKGRest    LONG                                  ! 
Loc:HuidigePalletWijzig LONG                               ! 
Loc:HuidigePalletRest LONG                                 ! 
Loc:HuidigePallet    LONG                                  ! 
Loc:NaarLocatieQ     QUEUE,PRE(NLQ)                        ! 
CelOmschrijving      CSTRING(21)                           ! 
LocatieNaam          CSTRING(51)                           ! 
Kg                   LONG                                  ! 
Pallet               LONG                                  ! 
CelID                LONG                                  ! 
CelLocatieID         LONG                                  ! 
                     END                                   ! 
LOC:CelID            LONG                                  ! 
LOC:NieuweCelID      LONG                                  ! 
LOC:NieuweCelLocatieID LONG                                ! 
Loc:HuidgeCelLocatieNamen CSTRING(255)                     ! 
Loc:HuidigeCelNaam   CSTRING(51)                           ! 
Loc:HuidigeCelLocatieID LONG                               ! 
Loc:GekozenCel       STRING(20)                            ! 
Loc:HuidigeLocatieQ  QUEUE,PRE(HLQ)                        ! 
LocatieNaam          CSTRING(51)                           ! 
KG                   LONG                                  ! 
Pallet               LONG                                  ! 
CelLocatieID         LONG                                  ! 
                     END                                   ! 
Loc:CelQ             QUEUE,PRE(LCQ)                        ! 
CelNaam              CSTRING(21)                           ! 
CelID                LONG                                  ! 
                     END                                   ! 
Loc:CelLocatieQ      QUEUE,PRE(CLQ)                        ! 
LocatieNaam          STRING(20)                            ! 
CelLocatieID         LONG                                  ! 
                     END                                   ! 
LocEnableEnterByTab  BYTE(1)                               !Used by the ENTER Instead of Tab template
EnterByTabManager    EnterByTabClass
QuickWindow          WINDOW('Cel / Locatie wijzigen'),AT(,,436,168),FONT('MS Sans Serif',8,,FONT:regular,CHARSET:DEFAULT), |
  DOUBLE,CENTER,GRAY,IMM,HLP('WijzigLocatie'),SYSTEM
                       GROUP('Cel / Partij'),AT(4,4,169,46),USE(?GROUP1),BOXED,TRN
                       END
                       PROMPT('Huidige Cel:'),AT(9,12),USE(?PROMPT3:2)
                       STRING(@s50),AT(61,12,103),USE(Loc:HuidigeCelNaam),FONT('Microsoft Sans Serif',,,FONT:bold)
                       PROMPT('Huidige locatie:'),AT(9,57),USE(?PROMPT3)
                       BUTTON('&Cancel'),AT(379,148,49,14),USE(?Cancel),LEFT,ICON('WACANCEL.ICO'),FLAT,MSG('Cancel Operation'), |
  TIP('Cancel Operation')
                       BUTTON('&OK'),AT(327,148,49,14),USE(?Ok),LEFT,ICON('WAOK.ICO'),DISABLE,FLAT,MSG('Accept operation'), |
  TIP('Accept Operation')
                       COMBO(@s254),AT(62,54,111),USE(Loc:HuidgeCelLocatieNamen),DROP(10,200),FORMAT('64L(2)|M~L' & |
  'ocatie Naam~L(0)@s50@56R(2)|M~KG~R(1)@N-13`2@60R(2)|M~Pallet~R(1)@n-14@'),FROM(Loc:HuidigeLocatieQ)
                       PROMPT('KG:'),AT(9,74),USE(?PROMPT4)
                       PROMPT('Pallet:'),AT(9,92),USE(?PROMPT5)
                       STRING(@n-13`2),AT(43,74),USE(Loc:HuidigeKG),FONT('Microsoft Sans Serif',,,FONT:bold)
                       STRING(@n-14),AT(43,93),USE(Loc:HuidigePallet),FONT('Microsoft Sans Serif',,,FONT:bold)
                       STRING(@n-14),AT(104,39),USE(Loc:CelPallet),FONT('Microsoft Sans Serif',,,FONT:bold)
                       STRING(@N-13`2),AT(109,26),USE(Loc:CelKG),FONT('Microsoft Sans Serif',,,FONT:bold)
                       PROMPT('Pallet:'),AT(9,39),USE(?PROMPT5:2)
                       PROMPT('KG:'),AT(9,26),USE(?PROMPT4:2)
                       LIST,AT(185,22,241,84),USE(?List),VSCROLL,ALRT(MouseLeft2),FORMAT('58L(2)|M~Cel Omschri' & |
  'jving~@s20@50L(2)|M~Locatie Naam~L(0)@s50@55L(2)|M~Kg~L(1)@n-13`2@60L(2)|M~Pallet~L(1)@n-14@'), |
  FROM(Loc:NaarLocatieQ)
                       BUTTON('&Voeg toe'),AT(300,112,40,12),USE(?Insert),KEY(InsertKey)
                       BUTTON('&Wijzig'),AT(345,112,40,12),USE(?Change),KEY(CtrlEnter)
                       BUTTON('&Verwijder'),AT(389,112,40,12),USE(?Delete),KEY(DeleteKey)
                       ENTRY(@n-13`2),AT(114,74),USE(Loc:HuidigeKGWijzing),RIGHT
                       ENTRY(@n-14),AT(109,92),USE(Loc:HuidigePalletWijzig),RIGHT
                       STRING(@n-13`2),AT(291,128),USE(Loc:HuidigeKGRest),FONT('Microsoft Sans Serif',,,FONT:bold)
                       STRING(@n-14),AT(367,128),USE(Loc:HuidigePalletRest),FONT('Microsoft Sans Serif',,,FONT:bold)
                       GROUP('Nieuw Cel/Locatie'),AT(179,7,255,117),USE(?GROUP2),BOXED,TRN
                       END
                     END

QEIP3:SaveEntry      GROUP,PRE(QEIP3)
CelOmschrijving        LIKE(NLQ:CelOmschrijving)
LocatieNaam            LIKE(NLQ:LocatieNaam)
Kg                     LIKE(NLQ:Kg)
Pallet                 LIKE(NLQ:Pallet)
                     END
QEIP3:Fields         FieldPairsClass
QEIP3:PopupString    STRING(20)
QEIP3:PopupMgr       PopupClass
QEIP3:EditList       QUEUE(EditQueue),PRE(QEIP3)
                     END
QEIP3:EM             CLASS(EIPManager)
TabAction              BYTE
EnterAction            BYTE
ArrowAction            BYTE
FocusLossAction        BYTE
CurrentChoice          LONG,PRIVATE
AddControl             PROCEDURE(<EditClass EC>,UNSIGNED Column,BYTE AutoFree = 0)
ClearColumn            PROCEDURE,DERIVED
Init                   PROCEDURE,BYTE,DERIVED,PROC
InitControls           PROCEDURE,DERIVED
Kill                   PROCEDURE,PROC,BYTE,DERIVED
Next                   PROCEDURE,PROTECTED
GetEdit                PROCEDURE,BYTE,DERIVED,PROTECTED
PrimeRecord            PROCEDURE(BYTE SuppressClear = 0)
ResetColumn            PROCEDURE,DERIVED,PROTECTED
Run                    PROCEDURE(BYTE Req),BYTE
TakeAction             PROCEDURE(UNSIGNED Action),DERIVED
TakeCompleted          PROCEDURE(BYTE Force),DERIVED   ! Note this does -not- override the WindowManager variant
TakeEvent              PROCEDURE,DERIVED,BYTE,PROC
TakeFieldEvent         PROCEDURE,DERIVED,BYTE,PROC
TakeFocusLoss          PROCEDURE,DERIVED
TakeNewSelection       PROCEDURE,DERIVED,BYTE,PROC
                     END

QEIP3::NLQ:CelOmschrijving CLASS(EditDropListClass)
CreateControl          PROCEDURE(),DERIVED                      ! Method added to host embed code
Init                   PROCEDURE(UNSIGNED FieldNumber,UNSIGNED ListBox,*? UseVar),DERIVED ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                      ! Method added to host embed code
SetAlerts              PROCEDURE(),DERIVED                      ! Method added to host embed code
SetReadOnly            PROCEDURE(BYTE State),DERIVED            ! Method added to host embed code
TakeAccepted           PROCEDURE(BYTE Action),BYTE,DERIVED      ! Method added to host embed code
TakeEvent              PROCEDURE(UNSIGNED Event),BYTE,DERIVED   ! Method added to host embed code
                     END
QEIP3::NLQ:LocatieNaam CLASS(EditDropListClass)
CreateControl          PROCEDURE(),DERIVED                      ! Method added to host embed code
Init                   PROCEDURE(UNSIGNED FieldNumber,UNSIGNED ListBox,*? UseVar),DERIVED ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                      ! Method added to host embed code
SetAlerts              PROCEDURE(),DERIVED                      ! Method added to host embed code
SetReadOnly            PROCEDURE(BYTE State),DERIVED            ! Method added to host embed code
TakeAccepted           PROCEDURE(BYTE Action),BYTE,DERIVED      ! Method added to host embed code
TakeEvent              PROCEDURE(UNSIGNED Event),BYTE,DERIVED   ! Method added to host embed code
                     END
QEIP3::NLQ:Kg        CLASS(EditEntryClass)
CreateControl          PROCEDURE(),DERIVED                      ! Method added to host embed code
Init                   PROCEDURE(UNSIGNED FieldNumber,UNSIGNED ListBox,*? UseVar),DERIVED ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                      ! Method added to host embed code
SetAlerts              PROCEDURE(),DERIVED                      ! Method added to host embed code
SetReadOnly            PROCEDURE(BYTE State),DERIVED            ! Method added to host embed code
TakeAccepted           PROCEDURE(BYTE Action),BYTE,DERIVED      ! Method added to host embed code
TakeEvent              PROCEDURE(UNSIGNED Event),BYTE,DERIVED   ! Method added to host embed code
                     END
QEIP3::NLQ:Pallet    CLASS(EditEntryClass)
CreateControl          PROCEDURE(),DERIVED                      ! Method added to host embed code
Init                   PROCEDURE(UNSIGNED FieldNumber,UNSIGNED ListBox,*? UseVar),DERIVED ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                      ! Method added to host embed code
SetAlerts              PROCEDURE(),DERIVED                      ! Method added to host embed code
SetReadOnly            PROCEDURE(BYTE State),DERIVED            ! Method added to host embed code
TakeAccepted           PROCEDURE(BYTE Action),BYTE,DERIVED      ! Method added to host embed code
TakeEvent              PROCEDURE(UNSIGNED Event),BYTE,DERIVED   ! Method added to host embed code
                     END
    omit('***',WE::CantCloseNowSetHereDone=1)  !Getting Nested omit compile error, then uncheck the "Check for duplicate CantCloseNowSetHere variable declaration" in the WinEvent local template
WE::CantCloseNowSetHereDone equate(1)
WE::CantCloseNowSetHere     long
    !***
ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
Reset                  PROCEDURE(BYTE Force=0),DERIVED
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED
TakeEvent              PROCEDURE(),BYTE,PROC,DERIVED
TakeFieldEvent         PROCEDURE(),BYTE,PROC,DERIVED
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
Resizer              CLASS(WindowResizeClass)
Init                   PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)
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
VulHuidigeCelLocatieQueue   ROUTINE
	!CLEAR(Loc:HuidgeCelLocatieNamen)
    FREE(Loc:HuidigeLocatieQ)
	Clear(VPCL:Record)	
	VPCL:PartijID = LOC:PartijID
	VPCL:CelID = LOC:CelID
	SET(VPCL:ViewPartijCelLocaties_PK,VPCL:ViewPartijCelLocaties_PK)
	LOOP UNTIL Access:ViewPartijCelLocaties.Next()
		IF NOT (VPCL:PartijID = LOC:PartijID AND VPCL:CelID = LOC:CelID) THEN BREAK.
		
!        IF NOT INSTRING(CLIP(VPCL:CelLocatienaam),Loc:HuidgeCelLocatieNamen,1,1)
!            if Loc:HuidgeCelLocatieNamen=''
!                Loc:HuidgeCelLocatieNamen=VPCL:CelLocatienaam
!            ELSE
!                Loc:HuidgeCelLocatieNamen=CLIP(Loc:HuidgeCelLocatieNamen)&','&VPCL:CelLocatienaam
!            END
!        END
        HLQ:CelLocatieID=VPCL:CelLocatieID
        HLQ:LocatieNaam=VPCL:CelLocatienaam
        HLQ:KG=VPCL:KG
        HLQ:Pallet=VPCL:Pallet
        Add(Loc:HuidigeLocatieQ)
	END	
	
    
	EXIT
ToonCelLocatieKG    ROUTINE
    !Message(Loc:HuidgeCelLocatieNamen)
    IF 0{PROP:AcceptAll}=FALSE
        Loop i#=1 to Records(Loc:HuidigeLocatieQ)
            Get(Loc:HuidigeLocatieQ,i#)
            IF HLQ:LocatieNaam=Loc:HuidgeCelLocatieNamen
                Loc:HuidigeCelLocatieID=HLQ:CelLocatieID
                Loc:HuidigeKG=CHOOSE(HLQ:KG>Loc:CelKG,Loc:CelKG,HLQ:KG)
                Loc:HuidigePallet=CHOOSE(HLQ:Pallet>Loc:CelPallet,Loc:CelPallet,HLQ:Pallet)
                Loc:HuidigeKGWijzing=Loc:HuidigeKG
                Display(?Loc:HuidigeKGWijzing)
                Loc:HuidigePalletWijzig=Loc:HuidigePallet
                Display(?Loc:HuidigePalletWijzig)
                Loc:HuidigeKGRest=Loc:HuidigeKGWijzing
                Loc:HuidigePalletRest=Loc:HuidigePalletWijzig
                BREAK
            END
        END
    !Message(Loc:HuidigeCelLocatieID)
    END        
    EXIT
    
BerekenRest         ROUTINE
    Loc:HuidigeKGRest=Loc:HuidigeKGWijzing
    Loc:HuidigePalletRest=Loc:HuidigePalletWijzig
    Loop i#=1 to Records(Loc:NaarLocatieQ)
        Get(Loc:NaarLocatieQ,i#)
        Loc:HuidigeKGRest-=NLQ:Kg
        Loc:HuidigePalletRest-=NLQ:Pallet
    END
    IF Loc:HuidigeKGRest=0
        ENABLE(?Ok)
    ELSE
        DISABLE(?Ok)
    END

ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('WijzigLocatie')
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
  Relate:ViewVoorraadPartij_INDEXED.Open                   ! File ViewVoorraadPartij_INDEXED used by this procedure, so make sure it's RelationManager is open
  Access:CelLocatie.UseFile                                ! File referenced in 'Other Files' so need to inform it's FileManager
  SELF.FilesOpened = True
  db.DebugOut('WijzigLocatie:' & PRM:PartijID & ', ' & PRM:CelID)
  LOC:PartijID = PRM:PartijID
  LOC:CelID = PRM:CelID
  Clear(Cel:Record)
  Cel:CelID=LOC:CelID 
  IF Access:Cel.Fetch(CEL:CEL_PK)=Level:Benign
      Loc:HuidigeCelNaam=CEL:CelOms
  END
  
  Clear(VVParI:Record)
  VVParI:PartijID=PRM:PartijID
  VVParI:CelID=PRM:CelID
  IF Access:ViewVoorraadPartij_INDEXED.Fetch(VVParI:PartijID_CelID_K)<>Level:Benign
      Message('Voorraad per partij cel kon niet bepaald worden','Error',ICON:Cross)
  END
  
  Loc:CelKG=VVParI:InslagKG-VVParI:UitslagKG
  Loc:CelPallet=VVParI:InslagPallets-VVParI:UitslagPallets
  
  !LOC:HuidigeCelLocatieNaam = 'Alle locatie''s'
  DO VulHuidigeCelLocatieQueue
  
  LOC:NieuweCelID = LOC:CelID
  
  CLEAR(CL:Record)
  
  Free(Loc:CelQ)
  Clear(Cel:Record)
  Set(CEL:CEL_PK,CEL:CEL_PK)
  Loop Until Access:Cel.Next()
      LCQ:CelNaam=CEL:CelOms
      LCQ:CelID=CEL:CelID
      Add(Loc:CelQ)
  END
  
  
  SELF.Open(QuickWindow)                                   ! Open window
  WinAlertMouseZoom()
  Do DefineListboxStyle
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('WijzigLocatie',QuickWindow)                ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
    ! eerste Cellocatie vullen
    ?List{PROP:LineHeight}=12
  Select(?Loc:HuidgeCelLocatieNamen,1)
  DO ToonCelLocatieKG
  SELF.SetAlerts()
  QEIP3:Fields.Init()
  QEIP3:Fields.AddPair(QEIP3:SaveEntry.CelOmschrijving,Loc:NaarLocatieQ.CelOmschrijving)
  QEIP3:Fields.AddPair(QEIP3:SaveEntry.LocatieNaam,Loc:NaarLocatieQ.LocatieNaam)
  QEIP3:Fields.AddPair(QEIP3:SaveEntry.Kg,Loc:NaarLocatieQ.Kg)
  QEIP3:Fields.AddPair(QEIP3:SaveEntry.Pallet,Loc:NaarLocatieQ.Pallet)
  QEIP3:PopupMgr.Init()
  QEIP3:PopupMgr.AddItemMimic('Add',?Insert)
  QEIP3:PopupMgr.AddItemMimic('Edit',?Change)
  QEIP3:PopupMgr.AddItemMimic('Delete',?Delete)
  GlobalErrors.AddErrors(QEIP:Errors)
  ?List{Prop:Alrt,QEIP:MouseLeft2Index} = MouseLeft2
  ?List{Prop:Alrt,QEIP:MouseRightIndex} = MouseRight
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
    Relate:ViewVoorraadPartij_INDEXED.Close
  END
  IF SELF.Opened
    INIMgr.Update('WijzigLocatie',QuickWindow)             ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.Reset PROCEDURE(BYTE Force=0)

  CODE
  SELF.ForcedReset += Force
  IF QuickWindow{Prop:AcceptAll} THEN RETURN.
  PARENT.Reset(Force)
  IF RECORDS(Loc:NaarLocatieQ)
     ?Change{PROP:Disable} = FALSE
     ?Delete{PROP:Disable} = FALSE
  ELSE
     ?Change{PROP:Disable} = TRUE
     ?Delete{PROP:Disable} = TRUE
  END


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
      ! Mutaties toevoegen voor het overboeken
      CLEAR(Mut:Record)
      Access:Mutatie.PrimeRecord(false)
      Mut:DatumTijd_DATE=TODAY()
      Mut:DatumTijd_TIME=CLOCK()
      Mut:PartijID=PRM:PartijID
      Mut:CelID=PRM:CelID
      Mut:CelLocatieID=Loc:HuidigeCelLocatieID
      Mut:InslagKG=0
      Mut:InslagPallet=0
      Mut:UitslagKG=Loc:HuidigeKGWijzing
      Mut:UitslagPallet=Loc:HuidigePalletWijzig
      Mut:SoortMutatie='OUIT'
      Mut:NaarCELID=NLQ:CelID
      Mut:RedenAfboeking=''
      Mut:ArtikelID=VVParI:ArtikelID
      Mut:PlanningID=0
      GLO:GebruikerLogHandelingOpmerking='Corrigeer Cel/Locatie van'	
      Access:Mutatie.Insert()
      
      Loop i#=1 to Records(Loc:NaarLocatieQ)
          Get(Loc:NaarLocatieQ,i#)
          ! (1) Eerst  OUIT-mutatie
          CLEAR(Mut:Record)
          Access:Mutatie.PrimeRecord(false)
          Mut:DatumTijd_DATE=TODAY()
          Mut:DatumTijd_TIME=CLOCK()
          Mut:PartijID=PRM:PartijID
          Mut:CelID=NLQ:CelID
          Mut:CelLocatieID=NLQ:CelLocatieID
          Mut:InslagKG=NLQ:Kg
          Mut:InslagPallet=NLQ:Pallet
          Mut:UitslagKG=0
          Mut:UitslagPallet=0
          Mut:SoortMutatie='OIN'
          Mut:NaarCELID=PRM:CelID
          Mut:RedenAfboeking=''
          Mut:ArtikelID=VVParI:ArtikelID
          Mut:PlanningID=0
          GLO:GebruikerLogHandelingOpmerking='Corrigeer Cel/Locatie naar'	
          Access:Mutatie.Insert()
      
      END
    OF ?Loc:HuidgeCelLocatieNamen
          ! Huidige cellocatie opslaan
          DO ToonCelLocatieKG
          !Message(Loc:HuidgeCelLocatieNamen)
    OF ?Insert
      ThisWindow.Update()
      LOOP
        ThisWindow.VCRRequest = VCR:None
        IF KEYCODE() = MouseRightUp
          SETKEYCODE(0)
        END
        ReturnValue = QEIP3:EM.Run(InsertRecord)
        CASE ThisWindow.VCRRequest
          OF VCR:Forward OROF VCR:Backward
             ?List{PROP:Selected} = POINTER(Loc:NaarLocatieQ)
        END
      UNTIL ThisWindow.VCRRequest = VCR:None
      SELECT(?List)
      ThisWindow.Reset()
    OF ?Change
      ThisWindow.Update()
      LOOP
        ThisWindow.VCRRequest = VCR:None
        IF KEYCODE() = MouseRightUp
          SETKEYCODE(0)
        END
        ReturnValue = QEIP3:EM.Run(ChangeRecord)
        CASE ThisWindow.VCRRequest
          OF VCR:Forward
             IF POINTER(Loc:NaarLocatieQ) < RECORDS(Loc:NaarLocatieQ)
                GET(Loc:NaarLocatieQ,POINTER(Loc:NaarLocatieQ)+1)
                ?List{PROP:Selected} = POINTER(Loc:NaarLocatieQ)
             ELSE
                ThisWindow.VCRRequest = VCR:None
             END
          OF VCR:Backward
             IF POINTER(Loc:NaarLocatieQ) > 1
                GET(Loc:NaarLocatieQ,POINTER(Loc:NaarLocatieQ)-1)
                ?List{PROP:Selected} = POINTER(Loc:NaarLocatieQ)
             ELSE
                ThisWindow.VCRRequest = VCR:None
             END
        END
      UNTIL ThisWindow.VCRRequest = VCR:None
      SELECT(?List)
      ThisWindow.Reset()
    OF ?Delete
      ThisWindow.Update()
      ReturnValue = QEIP3:EM.Run(DeleteRecord)
      ThisWindow.Reset()
      DO BerekenRest
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


ThisWindow.TakeFieldEvent PROCEDURE

ReturnValue          BYTE,AUTO

Looped BYTE
  CODE
  LOOP                                                     ! This method receives all field specific events
    IF Looped
      RETURN Level:Notify
    ELSE
      Looped = 1
    END
  ReturnValue = PARENT.TakeFieldEvent()
  CASE FIELD()
  OF ?List
    CASE EVENT()
    OF EVENT:AlertKey
      CASE KEYCODE()
        OF MouseLeft2
           IF ~?Change{PROP:Disable} AND RECORDS(Loc:NaarLocatieQ)
              POST(EVENT:Accepted,?Change)
           END
        OF MouseRight
           QEIP3:PopupString = QEIP3:PopupMgr.Ask()
      END
    END
  END
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


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window

QEIP3:EM.AddControl            PROCEDURE(<EditClass E>,UNSIGNED Column,BYTE AutoFree)
  CODE
  PARENT.AddControl(E,Column,AutoFree)
  RETURN

QEIP3:EM.ClearColumn           PROCEDURE
  CODE
  IF KEYCODE() <> EscKey
     IF SELF.LastColumn
        UPDATE
        GET(SELF.EQ,SELF.Column)
        PUT(Loc:NaarLocatieQ)
        ASSERT(~ERRORCODE())
     END
  END
  PARENT.ClearColumn()
  RETURN

QEIP3:EM.Init                  PROCEDURE
RetVal BYTE(RequestCancelled)
AtEnd  BYTE,AUTO
  CODE
  SELF.TabAction = EIPAction:Always+EIPAction:Remain
  SELF.EnterAction = EIPAction:Always+EIPAction:Remain
  SELF.FocusLossAction = EIPAction:Always
  SELF.ArrowAction = EIPAction:Always+EIPAction:Remain
  SELF.Insert = EIPAction:Append
  SELF.Arrow &= SELF.ArrowAction
  SELF.Enter &= SELF.EnterAction
  SELF.EQ &= QEIP3:EditList
  SELF.Errors &= NULL
  SELF.Fields &= QEIP3:Fields
  SELF.FocusLoss &= SELF.FocusLossAction
  SELF.ListControl = ?List
  SELF.Tab &= SELF.TabAction
  SELF.VCRRequest &= ThisWindow.VCRRequest
  SELF.AddControl(QEIP3::NLQ:CelOmschrijving,1,0)
  SELF.AddControl(QEIP3::NLQ:LocatieNaam,2,0)
  SELF.AddControl(QEIP3::NLQ:Kg,3,0)
  SELF.AddControl(QEIP3::NLQ:Pallet,4,0)
  SELF.CurrentChoice = CHOICE(?List)
  IF ~SELF.CurrentChoice
     SELF.CurrentChoice = 1
     ?List{PROP:Selected} = 1
  END
  GET(Loc:NaarLocatieQ,SELF.CurrentChoice)
  CASE SELF.Req
  OF InsertRecord
    IF RECORDS(Loc:NaarLocatieQ)
      AtEnd = CHOOSE(SELF.CurrentChoice = RECORDS(Loc:NaarLocatieQ))
      CASE(SELF.Insert)
        OF EIPAction:Before
           !Default
        OF EIPAction:Append
           SELF.CurrentChoice = RECORDS(Loc:NaarLocatieQ)+1
      ELSE
           SELF.CurrentChoice += 1
      END
    ELSE
      SELF.CurrentChoice = 1
    END
    SELF.PrimeRecord()
    ADD(Loc:NaarLocatieQ,SELF.CurrentChoice)
    ASSERT(~ERRORCODE())
    DISPLAY(?List)
    SELECT(?List,SELF.CurrentChoice)
    SELF.Column = 1
  OF DeleteRecord
    RetVal = CHOOSE(GlobalErrors.Throw(Msg:ConfirmDelete) = Level:Benign,RequestCompleted,RequestCancelled)
    IF RetVal = RequestCompleted
       DELETE(Loc:NaarLocatieQ)
    END
    SELF.Response = RetVal
    RETURN Level:Fatal
  OF ChangeRecord
    QEIP3:SaveEntry = Loc:NaarLocatieQ
    IF KEYCODE() = MouseLeft2
      SELF.Column = ?List{PROPLIST:MouseUpField}
    END
  ELSE
    ASSERT(0)
  END
  GET(Loc:NaarLocatieQ,SELF.CurrentChoice)
  SELF.Fields.AssignRightToLeft()
  ?List{PROP:Alrt,QEIP:MouseLeft2Index} = 0 ! Prevent alert short-stopping double click
  RetVal = PARENT.Init()
  RETURN(RetVal)

QEIP3:EM.InitControls          PROCEDURE
  CODE
  SELF.EQ.Field = 1
  PARENT.InitControls()
  RETURN

QEIP3:EM.Kill                  PROCEDURE
ReturnValue BYTE,AUTO
I           LONG,AUTO
J           LONG,AUTO
  CODE
  ReturnValue = PARENT.Kill()
  !Now dispose of any edit classes we created
  J = RECORDS(QEIP3:EditList)
  LOOP I = 1 TO J
    GET(QEIP3:EditList,I)
    IF ~QEIP3:EditList.Control &= NULL AND QEIP3:EditList.FreeUp = TRUE
       DISPOSE(QEIP3:EditList.Control)
    END
  END
  !and free up the edit queue
  FREE(QEIP3:EditList)
  RETURN(ReturnValue)

QEIP3:EM.Next                  PROCEDURE
  CODE
  PARENT.Next()
  RETURN

QEIP3:EM.GetEdit               PROCEDURE
ReturnValue BYTE,AUTO
  CODE
  ReturnValue = PARENT.GetEdit()
  RETURN(ReturnValue)

QEIP3:EM.PrimeRecord           PROCEDURE(BYTE SC)
  CODE
  IF ~SC
     CLEAR(Loc:NaarLocatieQ)
  END
  CLEAR(Loc:NaarLocatieQ.NLQ:CelOmschrijving)
  CLEAR(Loc:NaarLocatieQ.NLQ:LocatieNaam)
  Loc:NaarLocatieQ.NLQ:Kg = Loc:HuidigeKGRest
  Loc:NaarLocatieQ.NLQ:Pallet = Loc:HuidigePalletRest
  RETURN

QEIP3:EM.ResetColumn           PROCEDURE
  CODE
  PARENT.ResetColumn()
  RETURN

QEIP3:EM.Run                   PROCEDURE(BYTE Req)
ReturnValue BYTE,AUTO
  CODE
  ReturnValue = PARENT.Run(Req)
  RETURN(ReturnValue)

QEIP3:EM.TakeAction            PROCEDURE(UNSIGNED Action)
  CODE
  PARENT.TakeAction(Action)

QEIP3:EM.TakeCompleted         PROCEDURE(BYTE Force)
SaveAns UNSIGNED,AUTO
  CODE
  ! controle of er niet te veel wordt afgeboekt
  IF SELF.Req = ChangeRecord
      Loc:HuidigeKGRest=Loc:HuidigeKGRest+QEIP3:SaveEntry.Kg
      Loc:HuidigePalletRest=Loc:HuidigePalletRest+QEIP3:SaveEntry.Pallet
  END
  
  IF NLQ:Kg > Loc:HuidigeKGRest AND NLQ:Pallet > Loc:HuidigePalletRest
      Message('Er kan niet meer dan '&Loc:HuidigeKGRest&' Kg en '&Loc:HuidigePalletRest&' pallets gewijzigd worden')
      NLQ:Kg = Loc:HuidigeKGRest 
      NLQ:Pallet= Loc:HuidigePalletRest
      Put(Loc:NaarLocatieQ)
  ELSIF NLQ:Kg > Loc:HuidigeKGRest 
      Message('Er kan niet meer dan '&Loc:HuidigeKGRest&' Kg  gewijzigd worden')
      NLQ:Kg = Loc:HuidigeKGRest 
      Put(Loc:NaarLocatieQ)
  ELSIF NLQ:Pallet > Loc:HuidigePalletRest
      Message('Er kan niet meer dan '&Loc:HuidigePalletRest&' pallets gewijzigd worden')
      NLQ:Pallet= Loc:HuidigePalletRest
      Put(Loc:NaarLocatieQ)
  END
        
  SELF.Again = 0
  SELF.ClearColumn
  SaveAns = CHOOSE(Force = 0,Button:Yes,Force)
  IF SELF.Fields.Equal()
      SaveAns = Button:No
  ELSE
     IF ~Force
        SaveAns = GlobalErrors.Message(Msg:SaveRecord,Button:Yes+Button:No+Button:Cancel,Button:Yes)
     END
  END
  Force = 0
  SELF.Response = RequestCancelled
  CASE SaveAns
    OF Button:Cancel
       SELF.Again = 1
    OF Button:No
       IF SELF.Req = InsertRecord
          DELETE(Loc:NaarLocatieQ)
          IF SELF.CurrentChoice AND SELF.Insert <> EIPAction:Before
             SELF.CurrentChoice -= 1
          END
       ELSE
          SELF.Fields.AssignLeftToRight
          PUT(Loc:NaarLocatieQ)
       END
    OF Button:Yes
       SELF.Response = RequestCompleted
  END
  DO BerekenRest
  PARENT.TakeCompleted(Force)
  RETURN

QEIP3:EM.TakeEvent             PROCEDURE
ReturnValue BYTE,AUTO
  CODE
  ReturnValue = PARENT.TakeEvent()
  RETURN(ReturnValue)

QEIP3:EM.TakeFieldEvent        PROCEDURE
ReturnValue BYTE,AUTO
  CODE
  ReturnValue = PARENT.TakeFieldEvent()
  RETURN(ReturnValue)

QEIP3:EM.TakeFocusLoss         PROCEDURE
  CODE
  PARENT.TakeFocusLoss()
  RETURN

QEIP3:EM.TakeNewSelection      PROCEDURE
ReturnValue BYTE,AUTO
  CODE
  IF FIELD() = ?List
    IF CHOICE(?List) = SELF.CurrentChoice
      ReturnValue = PARENT.TakeNewSelection()
    ELSE                                  ! Focus change to different record
      SELF.TakeFocusLoss
      IF SELF.Again
        SELECT(?List,SELF.CurrentChoice)
        ReturnValue = Level:Benign
      ELSE
        SELF.CurrentChoice = CHOICE(?List)
        SELF.Response = RequestCancelled           ! Avoid cursor following 'new' record
        ReturnValue = Level:Fatal
      END
    END
  END
  RETURN(ReturnValue)



QEIP3::NLQ:CelOmschrijving.CreateControl    PROCEDURE
  CODE
  PARENT.CreateControl()
      ! De Cel dropdown vullen
  Self.Feq{Prop:From}=LCQ:CelNaam
  Self.Feq{Prop:Drop}=20
  Self.Feq{PROP:Width}=100
  !Self.Feq{Prop:Use}=Loc:GekozenCel
  RETURN

QEIP3::NLQ:CelOmschrijving.Init    PROCEDURE(UNSIGNED FieldNumber,UNSIGNED ListBox,*? UseVar)
  CODE
  PARENT.Init(FieldNumber,ListBox,UseVar)
  RETURN

QEIP3::NLQ:CelOmschrijving.Kill    PROCEDURE
  CODE
  PARENT.Kill()
  RETURN

QEIP3::NLQ:CelOmschrijving.SetAlerts    PROCEDURE
  CODE
  PARENT.SetAlerts()
  RETURN

QEIP3::NLQ:CelOmschrijving.SetReadOnly    PROCEDURE(BYTE State)
  CODE
  PARENT.SetReadOnly(State)
  RETURN

QEIP3::NLQ:CelOmschrijving.TakeAccepted    PROCEDURE(BYTE Action)
ReturnValue BYTE
  CODE
  ReturnValue = PARENT.TakeAccepted(Action)
  ! welke cel heb ik gekozen ?Loc:NaarLocatieQ.NLQ:CelOmschrijving
  LCQ:CelNaam=Loc:NaarLocatieQ.NLQ:CelOmschrijving
  Get(Loc:CelQ,+LCQ:CelNaam)
  IF ERROR()
      Message('Error '&Loc:NaarLocatieQ.NLQ:CelOmschrijving&' error '&Error())
  END 
  NLQ:CelID=LCQ:CelID
  Free(Loc:CelLocatieQ)
  Clear(CL:Record)
  CL:CelID=LCQ:CelID
  Set(CL:FK_CelLocatie,CL:FK_CelLocatie)
  Loop Until Access:CelLocatie.Next()
      IF NOT CL:CelID=LCQ:CelID THEN BREAK.
      CLQ:LocatieNaam=CL:Locatienaam
      CLQ:CelLocatieID=CL:CelLocatieID
      CLQ:CelID=LCQ:CelID
      Add(Loc:CelLocatieQ)
  END
  
  QEIP3::NLQ:LocatieNaam.Feq{Prop:From}=CLQ:LocatieNaam
  QEIP3::NLQ:LocatieNaam.Feq{Prop:Drop}=20
  QEIP3::NLQ:LocatieNaam.Feq{PROP:Width}=100
  RETURN(ReturnValue)

QEIP3::NLQ:CelOmschrijving.TakeEvent    PROCEDURE(UNSIGNED Event)
ReturnValue BYTE
  CODE
  ReturnValue = PARENT.TakeEvent(Event)
  RETURN(ReturnValue)



QEIP3::NLQ:LocatieNaam.CreateControl    PROCEDURE
  CODE
  PARENT.CreateControl()
  RETURN

QEIP3::NLQ:LocatieNaam.Init    PROCEDURE(UNSIGNED FieldNumber,UNSIGNED ListBox,*? UseVar)
  CODE
  PARENT.Init(FieldNumber,ListBox,UseVar)
  RETURN

QEIP3::NLQ:LocatieNaam.Kill    PROCEDURE
  CODE
  PARENT.Kill()
  RETURN

QEIP3::NLQ:LocatieNaam.SetAlerts    PROCEDURE
  CODE
  PARENT.SetAlerts()
  RETURN

QEIP3::NLQ:LocatieNaam.SetReadOnly    PROCEDURE(BYTE State)
  CODE
  PARENT.SetReadOnly(State)
  RETURN

QEIP3::NLQ:LocatieNaam.TakeAccepted    PROCEDURE(BYTE Action)
ReturnValue BYTE
  CODE
  ReturnValue = PARENT.TakeAccepted(Action)
  ! welke cel heb ik gekozen ?Loc:NaarLocatieQ.NLQ:CelOmschrijving
  CLQ:LocatieNaam=Loc:NaarLocatieQ.NLQ:LocatieNaam
  Get(Loc:CelLocatieQ,+CLQ:LocatieNaam)
  IF ERROR()
      Message('Error '&Loc:NaarLocatieQ.NLQ:LocatieNaam&' error '&Error())
  END 
  NLQ:CelLocatieID=CLQ:CelLocatieID
  RETURN(ReturnValue)

QEIP3::NLQ:LocatieNaam.TakeEvent    PROCEDURE(UNSIGNED Event)
ReturnValue BYTE
  CODE
  ReturnValue = PARENT.TakeEvent(Event)
  RETURN(ReturnValue)



QEIP3::NLQ:Kg.CreateControl    PROCEDURE
  CODE
  PARENT.CreateControl()
  RETURN

QEIP3::NLQ:Kg.Init    PROCEDURE(UNSIGNED FieldNumber,UNSIGNED ListBox,*? UseVar)
  CODE
  PARENT.Init(FieldNumber,ListBox,UseVar)
  RETURN

QEIP3::NLQ:Kg.Kill    PROCEDURE
  CODE
  PARENT.Kill()
  RETURN

QEIP3::NLQ:Kg.SetAlerts    PROCEDURE
  CODE
  PARENT.SetAlerts()
  RETURN

QEIP3::NLQ:Kg.SetReadOnly    PROCEDURE(BYTE State)
  CODE
  PARENT.SetReadOnly(State)
  RETURN

QEIP3::NLQ:Kg.TakeAccepted    PROCEDURE(BYTE Action)
ReturnValue BYTE
  CODE
  ReturnValue = PARENT.TakeAccepted(Action)
  RETURN(ReturnValue)

QEIP3::NLQ:Kg.TakeEvent    PROCEDURE(UNSIGNED Event)
ReturnValue BYTE
  CODE
  ReturnValue = PARENT.TakeEvent(Event)
  RETURN(ReturnValue)



QEIP3::NLQ:Pallet.CreateControl    PROCEDURE
  CODE
  PARENT.CreateControl()
  RETURN

QEIP3::NLQ:Pallet.Init    PROCEDURE(UNSIGNED FieldNumber,UNSIGNED ListBox,*? UseVar)
  CODE
  PARENT.Init(FieldNumber,ListBox,UseVar)
  RETURN

QEIP3::NLQ:Pallet.Kill    PROCEDURE
  CODE
  PARENT.Kill()
  RETURN

QEIP3::NLQ:Pallet.SetAlerts    PROCEDURE
  CODE
  PARENT.SetAlerts()
  RETURN

QEIP3::NLQ:Pallet.SetReadOnly    PROCEDURE(BYTE State)
  CODE
  PARENT.SetReadOnly(State)
  RETURN

QEIP3::NLQ:Pallet.TakeAccepted    PROCEDURE(BYTE Action)
ReturnValue BYTE
  CODE
  ReturnValue = PARENT.TakeAccepted(Action)
  RETURN(ReturnValue)

QEIP3::NLQ:Pallet.TakeEvent    PROCEDURE(UNSIGNED Event)
ReturnValue BYTE
  CODE
  ReturnValue = PARENT.TakeEvent(Event)
  RETURN(ReturnValue)

