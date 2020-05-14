

   MEMBER('VoorrPln.clw')                                  ! This is a MEMBER module


   INCLUDE('ABDROPS.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('VOORRPLN027.INC'),ONCE        !Local module procedure declarations
                     END


!!! <summary>
!!! Generated from procedure template - Window
!!! </summary>
UpdateOverboekingMutatieQueue PROCEDURE 

FDCB3::View:FileDropCombo VIEW(AAAACel)
                       PROJECT(AAAACEL:CelOms)
                       PROJECT(AAAACEL:CelID)
                     END
FDCB4::View:FileDropCombo VIEW(AAAACelLocatie)
                       PROJECT(AAAACL:Locatienaam)
                       PROJECT(AAAACL:CelLocatieID)
                     END
Queue:FileDropCombo  QUEUE                            !
AAAACEL:CelOms         LIKE(AAAACEL:CelOms)           !List box control field - type derived from field
AAAACEL:CelID          LIKE(AAAACEL:CelID)            !Primary key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
Queue:FileDropCombo:1 QUEUE                           !
AAAACL:Locatienaam     LIKE(AAAACL:Locatienaam)       !List box control field - type derived from field
AAAACL:CelLocatieID    LIKE(AAAACL:CelLocatieID)      !Primary key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
LocEnableEnterByTab  BYTE(1)                               !Used by the ENTER Instead of Tab template
EnterByTabManager    EnterByTabClass
Window               WINDOW('Extra Overboeking-mutatie'),AT(,,303,95),FONT('Microsoft Sans Serif',8),GRAY
                       BUTTON('&OK'),AT(201,76,41,14),USE(?OkButton),DEFAULT
                       BUTTON('&Annuleren'),AT(246,76,53,14),USE(?CancelButton)
                       PROMPT('KG:'),AT(5,42),USE(?OMQ:KG:Prompt)
                       ENTRY(@n-14`2),AT(37,43,60,10),USE(OMQ:KG),RIGHT
                       PROMPT('Pallets:'),AT(5,58),USE(?OMQ:Pallet:Prompt),RIGHT
                       ENTRY(@n_10),AT(37,59,60,10),USE(OMQ:Pallet),RIGHT(1)
                       COMBO(@s50),AT(37,9,261,10),USE(AAAACEL:CelOms),DROP(5),FORMAT('200L(2)|M~Cel Oms~L(0)@s50@'), |
  FROM(Queue:FileDropCombo),IMM
                       COMBO(@s50),AT(87,27,211,10),USE(AAAACL:Locatienaam),DROP(5),FORMAT('200L(2)|M~Locatien' & |
  'aam~L(0)@s50@'),FROM(Queue:FileDropCombo:1),IMM
                       PROMPT('Cel:'),AT(5,8),USE(?CelPrompt),FONT(,,,FONT:regular)
                       PROMPT('Locatie:'),AT(35,26),USE(?LocatiePrompt)
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
FDCB3                CLASS(FileDropComboClass)             ! File drop combo manager
Q                      &Queue:FileDropCombo           !Reference to browse queue type
                     END

FDCB4                CLASS(FileDropComboClass)             ! File drop combo manager
Q                      &Queue:FileDropCombo:1         !Reference to browse queue type
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
  GlobalErrors.SetProcedureName('UpdateOverboekingMutatieQueue')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?OkButton
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
  Relate:AAAACel.Open                                      ! File AAAACel used by this procedure, so make sure it's RelationManager is open
  Relate:AAAACelLocatie.Open                               ! File AAAACelLocatie used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  IF ThisWindow.Request = InsertRecord THEN
      OMQ:KG = 0
      OMQ:Pallet = 0
      OMQ:CelID = 0
      OMQ:CelLocatieID = 0
  .
  
  CLEAR(AAAACEL:Record)
  AAAACEL:CelID = OMQ:CelID
  IF Access:AAAACel.TryFetch(AAAACEL:CEL_PK) <> Level:Benign THEN CLEAR(AAAACEL:Record).
  
  CLEAR(AAAACL:Record)
  AAAACL:CelLocatieID = OMQ:CelLocatieID
  IF Access:AAAACelLocatie.TryFetch(AAAACL:PK_CelLocatie) <> Level:Benign THEN CLEAR(AAAACL:Record).
  SELF.Open(Window)                                        ! Open window
  SELF.AddItem(?OKButton,RequestCompleted)
  SELF.AddItem(?CancelButton,RequestCancelled)
  
  SELF.OKControl=?OKButton
  WinAlertMouseZoom()
  Do DefineListboxStyle
  INIMgr.Fetch('UpdateOverboekingMutatieQueue',Window)     ! Restore window settings from non-volatile store
  FDCB3.Init(AAAACEL:CelOms,?AAAACEL:CelOms,Queue:FileDropCombo.ViewPosition,FDCB3::View:FileDropCombo,Queue:FileDropCombo,Relate:AAAACel,ThisWindow,GlobalErrors,0,1,0)
  FDCB3.Q &= Queue:FileDropCombo
  FDCB3.AddSortOrder(AAAACEL:CEL_PK)
  FDCB3.AddField(AAAACEL:CelOms,FDCB3.Q.AAAACEL:CelOms) !List box control field - type derived from field
  FDCB3.AddField(AAAACEL:CelID,FDCB3.Q.AAAACEL:CelID) !Primary key field - type derived from field
  FDCB3.AddUpdateField(AAAACEL:CelID,OMQ:CelID)
  FDCB3.AddUpdateField(AAAACEL:CelOms,UMQ:CelOms)
  ThisWindow.AddItem(FDCB3.WindowComponent)
  FDCB3.DefaultFill = 0
  FDCB4.Init(AAAACL:Locatienaam,?AAAACL:Locatienaam,Queue:FileDropCombo:1.ViewPosition,FDCB4::View:FileDropCombo,Queue:FileDropCombo:1,Relate:AAAACelLocatie,ThisWindow,GlobalErrors,0,1,0)
  FDCB4.Q &= Queue:FileDropCombo:1
  FDCB4.AddSortOrder(AAAACL:FK_CelLocatie)
  FDCB4.AddRange(AAAACL:CelID,OMQ:CelID)
  FDCB4.AddField(AAAACL:Locatienaam,FDCB4.Q.AAAACL:Locatienaam) !List box control field - type derived from field
  FDCB4.AddField(AAAACL:CelLocatieID,FDCB4.Q.AAAACL:CelLocatieID) !Primary key field - type derived from field
  FDCB4.AddUpdateField(AAAACL:CelLocatieID,OMQ:CelLocatieID)
  FDCB4.AddUpdateField(AAAACL:Locatienaam,OMQ:CelLocatieNaam)
  ThisWindow.AddItem(FDCB4.WindowComponent)
  FDCB4.DefaultFill = 0
  SELF.SetAlerts()
  EnterByTabManager.Init(False)
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:AAAACel.Close
    Relate:AAAACelLocatie.Close
  END
  IF SELF.Opened
    INIMgr.Update('UpdateOverboekingMutatieQueue',Window)  ! Save window data to non-volatile store
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
    CASE ACCEPTED()
    OF ?OkButton
      ! Controleren
      IF OMQ:KG = 0 AND OMQ:Pallet = 0 THEN
      	SELECT(?OMQ:KG)
      	RETURN Level:Notify
      .
      
      ! Handmatig Cel-locatie vullen
      CLEAR(AAAACL:Record)
      AAAACL:CelLocatieID = OMQ:CelLocatieID
      IF Access:AAAACelLocatie.TryFetch(AAAACL:PK_CelLocatie) = Level:Benign THEN
          IF AAAACL:CelID <> OMQ:CelID THEN
              OMQ:CelLocatieID = 0
              OMQ:CelLocatieNaam = ''
          END
      ELSE
          OMQ:CelLocatieID = 0
          OMQ:CelLocatieNaam = ''
      END
          
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?OkButton
      ThisWindow.Update()
      ! Opslaan
      IF ThisWindow.Request = InsertRecord
      	ADD(GLO:OverboekingMutatieQueue)
      ELSIF ThisWindow.Request = ChangeRecord
      	PUT(GLO:OverboekingMutatieQueue)
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

