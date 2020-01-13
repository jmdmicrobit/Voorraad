

   MEMBER('VoorrPln.clw')                                  ! This is a MEMBER module


   INCLUDE('ABDROPS.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('VOORRPLN008.INC'),ONCE        !Local module procedure declarations
                     END


!!! <summary>
!!! Generated from procedure template - Window
!!! </summary>
WindowBoekRetourRegel PROCEDURE (LONG pPlanningID,*DECIMAL pRetourKg,*LONG pRetourPallets,*LONG pCelID,*LONG pCelLokatieID)

Loc:RetourKG         DECIMAL(11,2)                         ! 
Loc:CelID            LONG                                  ! 
Loc:CelLokatieID     LONG                                  ! 
Loc:RetourPallets    LONG                                  ! 
FDB5::View:FileDrop  VIEW(Cel)
                       PROJECT(CEL:CelOms)
                       PROJECT(CEL:CelID)
                     END
FDB6::View:FileDrop  VIEW(CelLocatie)
                       PROJECT(CL:Locatienaam)
                       PROJECT(CL:CelLocatieID)
                     END
Queue:FileDrop       QUEUE                            !
CEL:CelOms             LIKE(CEL:CelOms)               !List box control field - type derived from field
CEL:CelID              LIKE(CEL:CelID)                !Primary key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
Queue:FileDrop:1     QUEUE                            !
CL:Locatienaam         LIKE(CL:Locatienaam)           !List box control field - type derived from field
CL:CelLocatieID        LIKE(CL:CelLocatieID)          !Primary key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
LocEnableEnterByTab  BYTE(1)                               !Used by the ENTER Instead of Tab template
EnterByTabManager    EnterByTabClass
Window               WINDOW('Retourboeken regel'),AT(,,395,103),FONT('Microsoft Sans Serif',8,,FONT:regular),RESIZE, |
  GRAY,MDI,SYSTEM
                       PROMPT('Artikel ID:'),AT(17,9),USE(?Pla:ArtikelID:Prompt)
                       ENTRY(@s30),AT(67,8,60,10),USE(Pla:ArtikelID),DISABLE,READONLY
                       PROMPT('Artikel Oms:'),AT(17,22,45,12),USE(?Art:ArtikelOms:Prompt)
                       ENTRY(@s60),AT(67,23,178,10),USE(Art:ArtikelOms),DISABLE,READONLY
                       PROMPT('KG:'),AT(17,36,44,12),USE(?Pla:KG:Prompt)
                       ENTRY(@n-12_`2),AT(67,37,59,10),USE(Pla:KG),RIGHT,DISABLE,READONLY
                       PROMPT('Pallets:'),AT(17,52),USE(?Pla:Pallets:Prompt)
                       ENTRY(@n-14.),AT(67,52,60,10),USE(Pla:Pallets),RIGHT,DISABLE,READONLY
                       PROMPT('Retour KG:'),AT(137,37),USE(?Loc:RetourKG:Prompt)
                       ENTRY(@n-12_`2),AT(189,37,60,10),USE(Loc:RetourKG),RIGHT(1)
                       PROMPT('Retour Pallets:'),AT(137,52),USE(?Loc:RetourPallets:Prompt)
                       ENTRY(@n-14),AT(189,52,60,10),USE(Loc:RetourPallets),RIGHT(1)
                       PROMPT('Cel:'),AT(258,37),USE(?PROMPT1)
                       LIST,AT(293,37,,10),USE(CEL:CelOms),DROP(25),FORMAT('200L(2)|M~Cel Oms~L(0)@s50@'),FROM(Queue:FileDrop)
                       PROMPT('Locatie:'),AT(258,52),USE(?PROMPT2)
                       LIST,AT(294,52,,10),USE(CL:Locatienaam),DROP(25),FORMAT('200L(2)|M~Locatienaam~L(0)@s50@'), |
  FROM(Queue:FileDrop:1)
                       BUTTON('Ok'),AT(299,80),USE(?Close)
                       BUTTON('Annuleer'),AT(335,80),USE(?Cancel)
                     END

    omit('***',WE::CantCloseNowSetHereDone=1)  !Getting Nested omit compile error, then uncheck the "Check for duplicate CantCloseNowSetHere variable declaration" in the WinEvent local template
WE::CantCloseNowSetHereDone equate(1)
WE::CantCloseNowSetHere     long
    !***
ThisWindow           CLASS(WindowManager)
Ask                    PROCEDURE(),DERIVED
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED
TakeEvent              PROCEDURE(),BYTE,PROC,DERIVED
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
FDB5                 CLASS(FileDropClass)                  ! File drop manager
Q                      &Queue:FileDrop                !Reference to display queue
                     END

FDB6                 CLASS(FileDropClass)                  ! File drop manager
Q                      &Queue:FileDrop:1              !Reference to display queue
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

ThisWindow.Ask PROCEDURE

  CODE
      0{Prop:Text}='Boek retourregel '&pPlanningID
  PARENT.Ask


ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('WindowBoekRetourRegel')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Pla:ArtikelID:Prompt
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  IF SELF.Request = SelectRecord
     SELF.AddItem(?Close,RequestCancelled)                 ! Add the close control to the window manger
  ELSE
     SELF.AddItem(?Close,RequestCompleted)                 ! Add the close control to the window manger
  END
  Relate:Cel.SetOpenRelated()
  Relate:Cel.Open                                          ! File Cel used by this procedure, so make sure it's RelationManager is open
  Relate:Planning.SetOpenRelated()
  Relate:Planning.Open                                     ! File Planning used by this procedure, so make sure it's RelationManager is open
  Relate:ViewArtikel.Open                                  ! File ViewArtikel used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(Window)                                        ! Open window
  Loc:CelID=pCelID
  Loc:CelLokatieID=pCelLokatieID
  
  Clear(Pla:Record)
  Pla:PlanningID=pPlanningID
  IF Access:Planning.Fetch(Pla:PK_Planning)<>Level:Benign
      Message('Planningsregel '&pPlanningID&' kan niet ingelezen worden|Error:'&ERROR())
  END
  Clear(Art:Record)
  Art:ArtikelID=Pla:ArtikelID
  IF Access:ViewArtikel.Fetch(Art:Artikel_PK) <> Level:Benign
  ELSE
      Art:ArtikelOms='Onbekend artikelid'&Pla:ArtikelID
  END
  IF Pla:PlanningIDRetour<>0
      APla:PlanningID=Pla:PlanningIDRetour
      IF Access:APlanning.Fetch(APla:PK_Planning)=Level:Benign
          Loc:RetourKG=-APla:KG
          Loc:RetourPallets=-APla:Pallets
          ! default terug naar de originele
          Loc:CelID=APla:CelID
          Loc:CelLokatieID=APla:CelLocatieID
      END
  ELSE
  END
  WinAlertMouseZoom()
  Do DefineListboxStyle
  FDB5.Init(?CEL:CelOms,Queue:FileDrop.ViewPosition,FDB5::View:FileDrop,Queue:FileDrop,Relate:Cel,ThisWindow)
  FDB5.Q &= Queue:FileDrop
  FDB5.AddSortOrder(CEL:CEL_PK)
  FDB5.AddField(CEL:CelOms,FDB5.Q.CEL:CelOms) !List box control field - type derived from field
  FDB5.AddField(CEL:CelID,FDB5.Q.CEL:CelID) !Primary key field - type derived from field
  FDB5.AddUpdateField(CEL:CelID,Loc:CelID)
  ThisWindow.AddItem(FDB5.WindowComponent)
  FDB5.DefaultFill = 0
  FDB6.Init(?CL:Locatienaam,Queue:FileDrop:1.ViewPosition,FDB6::View:FileDrop,Queue:FileDrop:1,Relate:CelLocatie,ThisWindow)
  FDB6.Q &= Queue:FileDrop:1
  FDB6.AddSortOrder(CL:FK_CelLocatie)
  FDB6.AddRange(CL:CelID,CEL:CelID)
  FDB6.AddField(CL:Locatienaam,FDB6.Q.CL:Locatienaam) !List box control field - type derived from field
  FDB6.AddField(CL:CelLocatieID,FDB6.Q.CL:CelLocatieID) !Primary key field - type derived from field
  FDB6.AddUpdateField(CL:CelLocatieID,Loc:CelLokatieID)
  ThisWindow.AddItem(FDB6.WindowComponent)
  FDB6.DefaultFill = 0
  SELF.SetAlerts()
  EnterByTabManager.ExcludeControl(?Cancel)
  EnterByTabManager.Init(False)
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:Cel.Close
    Relate:Planning.Close
    Relate:ViewArtikel.Close
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
    OF ?Close
      pRetourKG=Loc:RetourKG
      pRetourPallets=Loc:RetourPallets
      pCelID=Loc:CelID
      pCelLokatieID=Loc:CelLokatieID
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

