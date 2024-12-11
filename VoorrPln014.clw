

   MEMBER('VoorrPln.clw')                                  ! This is a MEMBER module


   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('VOORRPLN014.INC'),ONCE        !Local module procedure declarations
                     END


!!! <summary>
!!! Generated from procedure template - Window
!!! </summary>
BrowseSSOPRegistratie PROCEDURE 

udpt            UltimateDebugProcedureTracker
Loc:Datum            DATE                                  ! 
Loc:TijdStip         TIME                                  ! 
Loc:ControleDoor     CSTRING(101)                          ! 
Loc:RegistratieQ     QUEUE,PRE(LRQ)                        ! 
Categorie            CSTRING(40)                           ! 
Object               CSTRING(40)                           ! 
Resultaat            STRING(1)                             ! 
Opmerking            CSTRING(1001)                         ! 
CorrigerendeActie    CSTRING(1001)                         ! 
ObjID                LONG                                  ! 
                     END                                   ! 
LocEnableEnterByTab  BYTE(1)                               !Used by the ENTER Instead of Tab template
EnterByTabManager    EnterByTabClass
Window               WINDOW('SSOP Registratie'),AT(,,667,337),FONT('Microsoft Sans Serif',8,,FONT:regular),RESIZE, |
  GRAY,IMM,MAX,MDI,SYSTEM
                       BUTTON('Sluiten'),AT(599,313,64),USE(?Close),LEFT,ICON('WAClose.ico')
                       LIST,AT(14,47,651,262),USE(?List),VSCROLL,ALRT(MouseLeft2),FORMAT('100L(2)|_M~Categorie' & |
  '~L(1)@s39@100L(2)|_M~Object~L(1)@s39@46L(2)|_M~Resultaat~L(0)@s1@200L(2)|_M~Opmerkin' & |
  'g~L(0)@s255@200L(2)|_M~Corrigerende Actie~L(0)@s255@'),FROM(Loc:RegistratieQ)
                       BUTTON('&Insert'),AT(369,318,40,12),USE(?Insert),KEY(InsertKey),DISABLE,HIDE
                       BUTTON('&Edit'),AT(421,318,40,12),USE(?Change),KEY(CtrlEnter)
                       BUTTON('&Delete'),AT(479,318,40,12),USE(?Delete),KEY(DeleteKey),DISABLE,HIDE
                       BUTTON('Opslaan'),AT(531,313,64,23),USE(?Opslaan),LEFT,ICON('WAOK.ico')
                       SHEET,AT(7,4,659,311),USE(?SHEET1)
                         TAB('Registraties'),USE(?TAB1)
                           SPIN(@d6-),AT(73,30,60,10),USE(Loc:Datum)
                           PROMPT('Tijdstip:'),AT(139,29),USE(?Loc:TijdStip:Prompt)
                           SPIN(@t1),AT(167,30,36,10),USE(Loc:TijdStip)
                           PROMPT('Controle Door:'),AT(208,29),USE(?Loc:ControleDoor:Prompt)
                           ENTRY(@s100),AT(259,30,107,10),USE(Loc:ControleDoor)
                           BUTTON('Vul regels'),AT(375,23),USE(?VulRegels)
                           PROMPT('Registratiedatum:'),AT(13,29),USE(?Loc:Datum:Prompt)
                         END
                       END
                     END

QEIP4:SaveEntry      GROUP,PRE(QEIP4)
Categorie              LIKE(LRQ:Categorie)
Object                 LIKE(LRQ:Object)
Resultaat              LIKE(LRQ:Resultaat)
Opmerking              LIKE(LRQ:Opmerking)
CorrigerendeActie      LIKE(LRQ:CorrigerendeActie)
                     END
QEIP4:Fields         FieldPairsClass
QEIP4:PopupString    STRING(20)
QEIP4:PopupMgr       PopupClass
QEIP4:EditList       QUEUE(EditQueue),PRE(QEIP4)
                     END
QEIP4:EM             CLASS(EIPManager)
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

QEIP4::LRQ:Resultaat CLASS(EditDropListClass)
CreateControl          PROCEDURE(),DERIVED                      ! Method added to host embed code
Init                   PROCEDURE(UNSIGNED FieldNumber,UNSIGNED ListBox,*? UseVar),DERIVED ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                      ! Method added to host embed code
SetAlerts              PROCEDURE(),DERIVED                      ! Method added to host embed code
SetReadOnly            PROCEDURE(BYTE State),DERIVED            ! Method added to host embed code
TakeAccepted           PROCEDURE(BYTE Action),BYTE,DERIVED      ! Method added to host embed code
TakeEvent              PROCEDURE(UNSIGNED Event),BYTE,DERIVED   ! Method added to host embed code
                     END
QEIP4::LRQ:Opmerking CLASS(EditTextClass)
CreateControl          PROCEDURE(),DERIVED                      ! Method added to host embed code
Init                   PROCEDURE(UNSIGNED FieldNumber,UNSIGNED ListBox,*? UseVar),DERIVED ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                      ! Method added to host embed code
SetAlerts              PROCEDURE(),DERIVED                      ! Method added to host embed code
SetReadOnly            PROCEDURE(BYTE State),DERIVED            ! Method added to host embed code
TakeAccepted           PROCEDURE(BYTE Action),BYTE,DERIVED      ! Method added to host embed code
TakeEvent              PROCEDURE(UNSIGNED Event),BYTE,DERIVED   ! Method added to host embed code
                     END
QEIP4::LRQ:CorrigerendeActie CLASS(EditTextClass)
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
TakeNewSelection       PROCEDURE(),BYTE,PROC,DERIVED
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
Resizer              CLASS(WindowResizeClass)
Init                   PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)
                     END

LocalClass          CLASS
VulResultaatQ           PROCEDURE()
                    END

  CODE
? DEBUGHOOK(SSOPCategorie:Record)
? DEBUGHOOK(SSOPObject:Record)
? DEBUGHOOK(SSOPRegistratie:Record)
? DEBUGHOOK(SSOPTijd:Record)
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
        udpt.Init(UD,'BrowseSSOPRegistratie','VoorrPln014.clw','VoorrPln.DLL','09/02/2021 @ 01:30PM')    
             
  GlobalErrors.SetProcedureName('BrowseSSOPRegistratie')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Close
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  IF SELF.Request = SelectRecord
     SELF.AddItem(?Close,RequestCancelled)                 ! Add the close control to the window manger
  ELSE
     SELF.AddItem(?Close,RequestCompleted)                 ! Add the close control to the window manger
  END
      Loc:Datum=Today()
  Relate:SSOPCategorie.Open                                ! File SSOPCategorie used by this procedure, so make sure it's RelationManager is open
  Relate:SSOPObject.Open                                   ! File SSOPObject used by this procedure, so make sure it's RelationManager is open
  Relate:SSOPRegistratie.Open                              ! File SSOPRegistratie used by this procedure, so make sure it's RelationManager is open
  Relate:SSOPTijd.Open                                     ! File SSOPTijd used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(Window)                                        ! Open window
  LocalClass.VulResultaatQ()
  Do DefineListboxStyle
  Alert(AltKeyPressed)  ! WinEvent : These keys cause a program to crash on Windows 7 and Windows 10.
  Alert(F10Key)         !
  Alert(CtrlF10)        !
  Alert(ShiftF10)       !
  Alert(CtrlShiftF10)   !
  Alert(AltSpace)       !
  WinAlertMouseZoom()
  Window{Prop:Alrt,255} = CtrlShiftP
  Resizer.Init(AppStrategy:Spread)                         ! Controls will spread out as the window gets bigger
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('BrowseSSOPRegistratie',Window)             ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
    ?List{PROP:LineHeight}=10
  SELF.SetAlerts()
  QEIP4:Fields.Init()
  QEIP4:Fields.AddPair(QEIP4:SaveEntry.Categorie,Loc:RegistratieQ.Categorie)
  QEIP4:Fields.AddPair(QEIP4:SaveEntry.Object,Loc:RegistratieQ.Object)
  QEIP4:Fields.AddPair(QEIP4:SaveEntry.Resultaat,Loc:RegistratieQ.Resultaat)
  QEIP4:Fields.AddPair(QEIP4:SaveEntry.Opmerking,Loc:RegistratieQ.Opmerking)
  QEIP4:Fields.AddPair(QEIP4:SaveEntry.CorrigerendeActie,Loc:RegistratieQ.CorrigerendeActie)
  QEIP4:PopupMgr.Init()
  QEIP4:PopupMgr.AddItemMimic('Add',?Insert)
  QEIP4:PopupMgr.AddItemMimic('Edit',?Change)
  QEIP4:PopupMgr.AddItemMimic('Delete',?Delete)
  GlobalErrors.AddErrors(QEIP:Errors)
  ?List{Prop:Alrt,QEIP:MouseLeft2Index} = MouseLeft2
  ?List{Prop:Alrt,QEIP:MouseRightIndex} = MouseRight
  EnterByTabManager.Init(False)
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:SSOPCategorie.Close
    Relate:SSOPObject.Close
    Relate:SSOPRegistratie.Close
    Relate:SSOPTijd.Close
  END
  IF SELF.Opened
    INIMgr.Update('BrowseSSOPRegistratie',Window)          ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
            
   
  RETURN ReturnValue


ThisWindow.Reset PROCEDURE(BYTE Force=0)

  CODE
  SELF.ForcedReset += Force
  IF Window{Prop:AcceptAll} THEN RETURN.
  PARENT.Reset(Force)
  IF RECORDS(Loc:RegistratieQ)
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
    OF ?Insert
      ThisWindow.Update()
      LOOP
        ThisWindow.VCRRequest = VCR:None
        IF KEYCODE() = MouseRightUp
          SETKEYCODE(0)
        END
        ReturnValue = QEIP4:EM.Run(InsertRecord)
        CASE ThisWindow.VCRRequest
          OF VCR:Forward
             IF POINTER(Loc:RegistratieQ) < RECORDS(Loc:RegistratieQ)
                ?List{PROP:Selected} = POINTER(Loc:RegistratieQ)
             ELSE
                ThisWindow.VCRRequest = VCR:None
             END
          OF VCR:Backward
             IF POINTER(Loc:RegistratieQ) > 1
                ?List{PROP:Selected} = POINTER(Loc:RegistratieQ)
             ELSE
                ThisWindow.VCRRequest = VCR:None
             END
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
        ReturnValue = QEIP4:EM.Run(ChangeRecord)
        CASE ThisWindow.VCRRequest
          OF VCR:Forward
             IF POINTER(Loc:RegistratieQ) < RECORDS(Loc:RegistratieQ)
                GET(Loc:RegistratieQ,POINTER(Loc:RegistratieQ)+1)
                ?List{PROP:Selected} = POINTER(Loc:RegistratieQ)
             ELSE
                ThisWindow.VCRRequest = VCR:None
             END
          OF VCR:Backward
             IF POINTER(Loc:RegistratieQ) > 1
                GET(Loc:RegistratieQ,POINTER(Loc:RegistratieQ)-1)
                ?List{PROP:Selected} = POINTER(Loc:RegistratieQ)
             ELSE
                ThisWindow.VCRRequest = VCR:None
             END
        END
      UNTIL ThisWindow.VCRRequest = VCR:None
      SELECT(?List)
      ThisWindow.Reset()
    OF ?Delete
      ThisWindow.Update()
      ReturnValue = QEIP4:EM.Run(DeleteRecord)
      ThisWindow.Reset()
    OF ?Opslaan
      ThisWindow.Update()
              ! datum uitlezen
      Clear(STijd:Record)
      STijd:DatumTijd_DATE=Loc:Datum
      Set(STijd:SSOPTijd_FK1,STijd:SSOPTijd_FK1)
      IF ACCESS:SSOPTijd.Next()=Level:Benign AND STijd:DatumTijd_DATE=Loc:Datum
          STijd:DatumTijd_TIME=Loc:TijdStip
          STijd:Door=Loc:ControleDoor
          Access:SSOPTIjd.Update()
      ELSE
          Clear(STijd:Record)
          STijd:DatumTijd_DATE=Loc:Datum
          STijd:DatumTijd_TIME=Loc:TijdStip
          STijd:Door=Loc:ControleDoor
          Access:SSOPTIjd.Insert()
      END
              
      Loop i#=1 To Records(Loc:RegistratieQ)
          GET(Loc:RegistratieQ,i#)
          Clear(SReg:Record)
          SReg:ObjID=LRQ:ObjID
          SReg:Datum_DATE=Loc:Datum
          IF Access:SSOPRegistratie.Fetch(SReg:SSOPRegistratie_FK1)<>Level:Benign
              Clear(SReg:Record)
              SReg:ObjID=LRQ:ObjID
              SReg:Datum_DATE=Loc:Datum
              SReg:Resultaat=LRQ:Resultaat
              SReg:Opmerking=LRQ:Opmerking
              SReg:CorrigerendeActie=LRQ:CorrigerendeActie
              SReg:TijdID=STijd:TijdID
              Access:SSOPRegistratie.Insert()
          ELSE
              SReg:TijdID=STijd:TijdID
              SReg:Resultaat=LRQ:Resultaat
              SReg:Opmerking=LRQ:Opmerking
              SReg:CorrigerendeActie=LRQ:CorrigerendeActie
              Access:SSOPRegistratie.Update
          END
      END
      
          
    OF ?Loc:Datum
          LocalClass.VulResultaatQ()
    OF ?VulRegels
      ThisWindow.Update()
      Loop i#=1 to Records(Loc:RegistratieQ)
          Get(Loc:RegistratieQ,i#)
          IF LRQ:Resultaat=''
              LRQ:Resultaat='V'
              Put(Loc:RegistratieQ)
          END
      END
      Display()
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
  If event() = event:VisibleOnDesktop !or event() = event:moved
    ds_VisibleOnDesktop()
  end
     IF KEYCODE()=CtrlShiftP AND EVENT() = Event:PreAlertKey
       CYCLE
     END
     IF KEYCODE()=CtrlShiftP  
        UD.ShowProcedureInfo('BrowseSSOPRegistratie',UD.SetApplicationName('VoorrPln','DLL'),Window{PROP:Hlp},'04/17/2019 @ 03:48PM','09/02/2021 @ 01:30PM','10/11/2024 @ 01:54PM')  
    
       CYCLE
     END
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
  IF Loc:TijdStip=0 OR Loc:ControleDoor=''
      DISABLE(?VulRegels)
      DISABLE(?Opslaan)
  ELSE
      ENABLE(?VulRegels)
      ENABLE(?Opslaan)
  END
  CASE FIELD()
  OF ?List
    CASE EVENT()
    OF EVENT:AlertKey
      CASE KEYCODE()
        OF MouseLeft2
           IF ~?Change{PROP:Disable} AND RECORDS(Loc:RegistratieQ)
              POST(EVENT:Accepted,?Change)
           END
        OF MouseRight
           QEIP4:PopupString = QEIP4:PopupMgr.Ask()
      END
    END
  END
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue


ThisWindow.TakeNewSelection PROCEDURE

ReturnValue          BYTE,AUTO

Looped BYTE
  CODE
  LOOP                                                     ! This method receives all NewSelection events
    IF Looped
      RETURN Level:Notify
    ELSE
      Looped = 1
    END
  ReturnValue = PARENT.TakeNewSelection()
    CASE FIELD()
    OF ?Loc:Datum
          LocalClass.VulResultaatQ()
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

LocalClass.VulResultaatQ    PROCEDURE()
CODE
    ! 2021-3-20 Ze hoeven alleen op vrijdag in te voeren
    IF Loc:Datum%7<>5
        ?Loc:Datum{PROP:Background}=Color:Red
        ?Loc:Datum{PROP:ToolTip}='Dit is geen vrijdag'
    ELSE
        ?Loc:Datum{PROP:Background}=Color:Lime
    END
    
    
    Clear(Loc:TijdStip)
    Clear(Loc:ControleDoor)
    Clear(STijd:Record)
    STijd:DatumTijd_DATE=Loc:Datum
    Set(STijd:SSOPTijd_FK1,STijd:SSOPTijd_FK1)
    IF ACCESS:SSOPTijd.Next()=Level:Benign AND STijd:DatumTijd_DATE=Loc:Datum
        Loc:TijdStip=STijd:DatumTijd_TIME
        Loc:ControleDoor=STijd:Door
    END
    Display(?Loc:ControleDoor)
    Display(?Loc:TijdStip)
    Free(Loc:RegistratieQ)
    Clear(SCat:Record)
    Set(SCat:SSOPCategorie_PK,SCat:SSOPCategorie_PK)
    Loop Until Access:SSOPCategorie.Next()
        Clear(SObj:Record)
        SObj:CatergorieID=SCat:CategorieID
        Set(SObj:SSOPObject_FK1,SObj:SSOPObject_FK1)
        Loop Until Access:SsopObject.Next()
            IF NOT(SObj:CatergorieID=SCat:CategorieID) THEN Break.
            IF NOT ((Loc:Datum%7=1 AND SObj:Maandag) OR | 
                (Loc:Datum%7=2 AND SObj:Dinsdag) OR | 
                (Loc:Datum%7=3 AND SObj:Woensdag) OR | 
                (Loc:Datum%7=4 AND SObj:Donderdag) OR | 
                (Loc:Datum%7=5 AND SObj:Vrijdag))
                CYCLE
            END
            Clear(Loc:RegistratieQ)
            LRQ:Categorie=SCat:Omschrijving
            LRQ:Object=SObj:Omschrijving
            Clear(SReg:Record)
            SReg:ObjID=SObj:ObjID
            SReg:Datum_DATE=Loc:Datum
            IF Access:SSOPRegistratie.Fetch(SReg:SSOPRegistratie_FK1)=Level:Benign
                LRQ:Resultaat=SReg:Resultaat
                LRQ:Opmerking=SReg:Opmerking
                LRQ:CorrigerendeActie=SReg:CorrigerendeActie
            ELSE
               ! LRQ:Resultaat='V'
            END
            LRQ:ObjID=SObj:ObjID
            Add(Loc:RegistratieQ)
        END
    END 
    Return
QEIP4:EM.AddControl            PROCEDURE(<EditClass E>,UNSIGNED Column,BYTE AutoFree)
  CODE
  PARENT.AddControl(E,Column,AutoFree)
  RETURN

QEIP4:EM.ClearColumn           PROCEDURE
  CODE
  IF KEYCODE() <> EscKey
     IF SELF.LastColumn
        UPDATE
        GET(SELF.EQ,SELF.Column)
        PUT(Loc:RegistratieQ)
        ASSERT(~ERRORCODE())
     END
  END
  PARENT.ClearColumn()
  RETURN

QEIP4:EM.Init                  PROCEDURE
RetVal BYTE(RequestCancelled)
AtEnd  BYTE,AUTO
  CODE
  SELF.TabAction = EIPAction:Always+EIPAction:Remain
  SELF.EnterAction = EIPAction:Always+EIPAction:Remain
  SELF.FocusLossAction = EIPAction:Always
  SELF.ArrowAction = EIPAction:Always+EIPAction:Remain
  SELF.Arrow &= SELF.ArrowAction
  SELF.Enter &= SELF.EnterAction
  SELF.EQ &= QEIP4:EditList
  SELF.Errors &= NULL
  SELF.Fields &= QEIP4:Fields
  SELF.FocusLoss &= SELF.FocusLossAction
  SELF.ListControl = ?List
  SELF.Tab &= SELF.TabAction
  SELF.VCRRequest &= ThisWindow.VCRRequest
  SELF.AddControl(,1,0)
  SELF.AddControl(,2,0)
  SELF.AddControl(QEIP4::LRQ:Resultaat,3,0)
  SELF.AddControl(QEIP4::LRQ:Opmerking,4,0)
  SELF.AddControl(QEIP4::LRQ:CorrigerendeActie,5,0)
  SELF.CurrentChoice = CHOICE(?List)
  IF ~SELF.CurrentChoice
     SELF.CurrentChoice = 1
     ?List{PROP:Selected} = 1
  END
  GET(Loc:RegistratieQ,SELF.CurrentChoice)
  CASE SELF.Req
  OF InsertRecord
    IF RECORDS(Loc:RegistratieQ)
      AtEnd = CHOOSE(SELF.CurrentChoice = RECORDS(Loc:RegistratieQ))
      CASE(SELF.Insert)
        OF EIPAction:Before
           !Default
        OF EIPAction:Append
           SELF.CurrentChoice = RECORDS(Loc:RegistratieQ)+1
      ELSE
           SELF.CurrentChoice += 1
      END
    ELSE
      SELF.CurrentChoice = 1
    END
    SELF.PrimeRecord()
    ADD(Loc:RegistratieQ,SELF.CurrentChoice)
    ASSERT(~ERRORCODE())
    DISPLAY(?List)
    SELECT(?List,SELF.CurrentChoice)
    SELF.Column = 1
  OF DeleteRecord
    RetVal = CHOOSE(GlobalErrors.Throw(Msg:ConfirmDelete) = Level:Benign,RequestCompleted,RequestCancelled)
    IF RetVal = RequestCompleted
       DELETE(Loc:RegistratieQ)
    END
    SELF.Response = RetVal
    RETURN Level:Fatal
  OF ChangeRecord
    QEIP4:SaveEntry = Loc:RegistratieQ
    IF KEYCODE() = MouseLeft2
      SELF.Column = ?List{PROPLIST:MouseUpField}
    END
  ELSE
    ASSERT(0)
  END
  GET(Loc:RegistratieQ,SELF.CurrentChoice)
  SELF.Fields.AssignRightToLeft()
  ?List{PROP:Alrt,QEIP:MouseLeft2Index} = 0 ! Prevent alert short-stopping double click
  RetVal = PARENT.Init()
  RETURN(RetVal)

QEIP4:EM.InitControls          PROCEDURE
  CODE
  SELF.EQ.Field = 1
  PARENT.InitControls()
  RETURN

QEIP4:EM.Kill                  PROCEDURE
ReturnValue BYTE,AUTO
I           LONG,AUTO
J           LONG,AUTO
  CODE
  ReturnValue = PARENT.Kill()
  !Now dispose of any edit classes we created
  J = RECORDS(QEIP4:EditList)
  LOOP I = 1 TO J
    GET(QEIP4:EditList,I)
    IF ~QEIP4:EditList.Control &= NULL AND QEIP4:EditList.FreeUp = TRUE
       DISPOSE(QEIP4:EditList.Control)
    END
  END
  !and free up the edit queue
  FREE(QEIP4:EditList)
  RETURN(ReturnValue)

QEIP4:EM.Next                  PROCEDURE
  CODE
  PARENT.Next()
  RETURN

QEIP4:EM.GetEdit               PROCEDURE
ReturnValue BYTE,AUTO
  CODE
  ReturnValue = PARENT.GetEdit()
  RETURN(ReturnValue)

QEIP4:EM.PrimeRecord           PROCEDURE(BYTE SC)
  CODE
  IF ~SC
     CLEAR(Loc:RegistratieQ)
  END
  CLEAR(Loc:RegistratieQ.LRQ:Categorie)
  CLEAR(Loc:RegistratieQ.LRQ:Object)
  Loc:RegistratieQ.LRQ:Resultaat = 'Voldoende'
  CLEAR(Loc:RegistratieQ.LRQ:Opmerking)
  CLEAR(Loc:RegistratieQ.LRQ:CorrigerendeActie)
  RETURN

QEIP4:EM.ResetColumn           PROCEDURE
  CODE
  PARENT.ResetColumn()
  RETURN

QEIP4:EM.Run                   PROCEDURE(BYTE Req)
ReturnValue BYTE,AUTO
  CODE
  ReturnValue = PARENT.Run(Req)
  RETURN(ReturnValue)

QEIP4:EM.TakeAction            PROCEDURE(UNSIGNED Action)
  CODE
  PARENT.TakeAction(Action)

QEIP4:EM.TakeCompleted         PROCEDURE(BYTE Force)
SaveAns UNSIGNED,AUTO
  CODE
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
          DELETE(Loc:RegistratieQ)
          IF SELF.CurrentChoice AND SELF.Insert <> EIPAction:Before
             SELF.CurrentChoice -= 1
          END
       ELSE
          SELF.Fields.AssignLeftToRight
          PUT(Loc:RegistratieQ)
       END
    OF Button:Yes
       SELF.Response = RequestCompleted
  END
  PARENT.TakeCompleted(Force)
  RETURN

QEIP4:EM.TakeEvent             PROCEDURE
ReturnValue BYTE,AUTO
  CODE
  ReturnValue = PARENT.TakeEvent()
  RETURN(ReturnValue)

QEIP4:EM.TakeFieldEvent        PROCEDURE
ReturnValue BYTE,AUTO
  CODE
  ReturnValue = PARENT.TakeFieldEvent()
  RETURN(ReturnValue)

QEIP4:EM.TakeFocusLoss         PROCEDURE
  CODE
  PARENT.TakeFocusLoss()
  RETURN

QEIP4:EM.TakeNewSelection      PROCEDURE
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



QEIP4::LRQ:Resultaat.CreateControl    PROCEDURE
  CODE
  PARENT.CreateControl()
  Self.Feq{Prop:From}='Voldoende|#V|Onvoldoende|#O|Niet van toepassing|#X'
  Self.Feq{Prop:Drop}=3   
  Self.Feq{PROP:Width}=100
  RETURN

QEIP4::LRQ:Resultaat.Init    PROCEDURE(UNSIGNED FieldNumber,UNSIGNED ListBox,*? UseVar)
  CODE
  PARENT.Init(FieldNumber,ListBox,UseVar)
  RETURN

QEIP4::LRQ:Resultaat.Kill    PROCEDURE
  CODE
  PARENT.Kill()
  RETURN

QEIP4::LRQ:Resultaat.SetAlerts    PROCEDURE
  CODE
  PARENT.SetAlerts()
  RETURN

QEIP4::LRQ:Resultaat.SetReadOnly    PROCEDURE(BYTE State)
  CODE
  PARENT.SetReadOnly(State)
  RETURN

QEIP4::LRQ:Resultaat.TakeAccepted    PROCEDURE(BYTE Action)
ReturnValue BYTE
  CODE
  ReturnValue = PARENT.TakeAccepted(Action)
  RETURN(ReturnValue)

QEIP4::LRQ:Resultaat.TakeEvent    PROCEDURE(UNSIGNED Event)
ReturnValue BYTE
  CODE
  ReturnValue = PARENT.TakeEvent(Event)
  RETURN(ReturnValue)



QEIP4::LRQ:Opmerking.CreateControl    PROCEDURE
  CODE
  PARENT.CreateControl()
  RETURN

QEIP4::LRQ:Opmerking.Init    PROCEDURE(UNSIGNED FieldNumber,UNSIGNED ListBox,*? UseVar)
  CODE
  PARENT.Init(FieldNumber,ListBox,UseVar)
  RETURN

QEIP4::LRQ:Opmerking.Kill    PROCEDURE
  CODE
  PARENT.Kill()
  RETURN

QEIP4::LRQ:Opmerking.SetAlerts    PROCEDURE
  CODE
  PARENT.SetAlerts()
  RETURN

QEIP4::LRQ:Opmerking.SetReadOnly    PROCEDURE(BYTE State)
  CODE
  PARENT.SetReadOnly(State)
  RETURN

QEIP4::LRQ:Opmerking.TakeAccepted    PROCEDURE(BYTE Action)
ReturnValue BYTE
  CODE
  ReturnValue = PARENT.TakeAccepted(Action)
  RETURN(ReturnValue)

QEIP4::LRQ:Opmerking.TakeEvent    PROCEDURE(UNSIGNED Event)
ReturnValue BYTE
  CODE
  ReturnValue = PARENT.TakeEvent(Event)
  RETURN(ReturnValue)



QEIP4::LRQ:CorrigerendeActie.CreateControl    PROCEDURE
  CODE
  PARENT.CreateControl()
  RETURN

QEIP4::LRQ:CorrigerendeActie.Init    PROCEDURE(UNSIGNED FieldNumber,UNSIGNED ListBox,*? UseVar)
  CODE
  PARENT.Init(FieldNumber,ListBox,UseVar)
  RETURN

QEIP4::LRQ:CorrigerendeActie.Kill    PROCEDURE
  CODE
  PARENT.Kill()
  RETURN

QEIP4::LRQ:CorrigerendeActie.SetAlerts    PROCEDURE
  CODE
  PARENT.SetAlerts()
  RETURN

QEIP4::LRQ:CorrigerendeActie.SetReadOnly    PROCEDURE(BYTE State)
  CODE
  PARENT.SetReadOnly(State)
  RETURN

QEIP4::LRQ:CorrigerendeActie.TakeAccepted    PROCEDURE(BYTE Action)
ReturnValue BYTE
  CODE
  ReturnValue = PARENT.TakeAccepted(Action)
  RETURN(ReturnValue)

QEIP4::LRQ:CorrigerendeActie.TakeEvent    PROCEDURE(UNSIGNED Event)
ReturnValue BYTE
  CODE
  ReturnValue = PARENT.TakeEvent(Event)
  RETURN(ReturnValue)


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window

