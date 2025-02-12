

   MEMBER('VoorrPln.clw')                                  ! This is a MEMBER module


   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('VOORRPLN008.INC'),ONCE        !Local module procedure declarations
                     END


!!! <summary>
!!! Generated from procedure template - Window
!!! </summary>
WindowRedenRetour PROCEDURE (string pVerkoopInkoop,Long pID,*CString pRedenRetour,*Date pRetourDatum)

udpt            UltimateDebugProcedureTracker
Loc:ReturnValue      BYTE                                  ! 
Loc:RetourKG         DECIMAL(11,2)                         ! 
Loc:RetourPallets    LONG                                  ! 
Loc:RedenRetour      CSTRING(51)                           ! 
Loc:RetourDatum      DATE                                  ! 
Loc:CelID            LONG                                  ! 
Loc:CelLokatieID     LONG                                  ! 
Loc:ListQ            QUEUE,PRE(LQ)                         ! 
ArtikelID            CSTRING(31)                           ! 
ArtikelOmschrijving  CSTRING(100)                          ! 
KG                   DECIMAL(7,2)                          ! 
Pallets              LONG                                  ! 
KGRetour             LONG                                  ! 
PalletsRetour        LONG                                  ! 
PlanningID           LONG                                  ! 
CelID                LONG                                  ! 
CelLocatieID         LONG                                  ! 
UitgevoerdDoor       CSTRING(41)                           ! 
Temperatuur1         CSTRING(21)                           ! 
Temperatuur2         CSTRING(21)                           ! 
Temperatuur3         CSTRING(21)                           ! 
TemperatuurVervoermiddel CSTRING(21)                       ! 
                     END                                   ! 
LocEnableEnterByTab  BYTE(1)                               !Used by the ENTER Instead of Tab template
EnterByTabManager    EnterByTabClass
Window               WINDOW('Retourboeken'),AT(,,415,199),FONT('Microsoft Sans Serif',8,,FONT:regular),RESIZE,GRAY, |
  MDI,SYSTEM
                       ENTRY(@s50),AT(67,9,303,10),USE(Loc:RedenRetour),REQ
                       SPIN(@d17),AT(67,23,60,10),USE(Loc:RetourDatum),REQ
                       STRING('Reden'),AT(15,9),USE(?STRING1)
                       LIST,AT(15,39,392,139),USE(?LIST1),HVSCROLL,ALRT(MouseLeft),ALRT(MouseLeft2),FORMAT('60L(2)|M~A' & |
  'rtikel ID~L(1)@S30@124L(2)|M~Artikel Omschrijving~L(0)@s99@[49R(2)|M~KG~@n-12_`2@46R' & |
  '(2)|M~Pallets~R(1)@n-14.@]|~Verkoop of Inkoop~[50R(2)|M~KG ~@n-12_`2B@60R(2)|M~Palle' & |
  'ts~R(1)@n-14.B@]|~Retour~60L(2)|M~Planning ID~L(1)@n-14@60L(2)|M~Cel ID~L(1)@n-14@60' & |
  'L(2)|M~Cel Locatie ID~L(1)@n-14@160L(2)|M~Uitgevoerd Door~L(0)@s40@80L(2)|M~Temperat' & |
  'uur 1~L(0)@s20@80L(2)|M~Temperatuur 2~L(0)@s20@80L(2)|M~Temperatuur 3~L(0)@s20@80L(2' & |
  ')|M~Temperatuur Vervoermiddel~L(0)@s20@'),FROM(Loc:ListQ)
                       BUTTON('&OK'),AT(322,183,35,14),USE(?OkButton),DEFAULT
                       BUTTON('&Cancel'),AT(365,183,36,14),USE(?CancelButton)
                       PROMPT('Retour Datum:'),AT(15,24),USE(?Lco:RetourDatum:Prompt)
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
TakeFieldEvent         PROCEDURE(),BYTE,PROC,DERIVED
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
LocalClass          CLASS
Verwerk                 Procedure()
InitQ                   Procedure()
AddQ                    PROCEDURE()
                    END

  CODE
? DEBUGHOOK(Inkoop:Record)
? DEBUGHOOK(Verkoop:Record)
? DEBUGHOOK(ViewArtikel:Record)
  GlobalResponse = ThisWindow.Run()                        ! Opens the window and starts an Accept Loop
  RETURN(Loc:ReturnValue)

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
        udpt.Init(UD,'WindowRedenRetour','VoorrPln008.clw','VoorrPln.DLL','12/27/2023 @ 02:53PM')    
             
  GlobalErrors.SetProcedureName('WindowRedenRetour')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Loc:RedenRetour
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:Inkoop.SetOpenRelated()
  Relate:Inkoop.Open                                       ! File Inkoop used by this procedure, so make sure it's RelationManager is open
  Relate:ViewArtikel.Open                                  ! File ViewArtikel used by this procedure, so make sure it's RelationManager is open
  Access:Verkoop.UseFile                                   ! File referenced in 'Other Files' so need to inform it's FileManager
  SELF.FilesOpened = True
  SELF.Open(Window)                                        ! Open window
  Do DefineListboxStyle
  Alert(AltKeyPressed)  ! WinEvent : These keys cause a program to crash on Windows 7 and Windows 10.
  Alert(F10Key)         !
  Alert(CtrlF10)        !
  Alert(ShiftF10)       !
  Alert(CtrlShiftF10)   !
  Alert(AltSpace)       !
  WinAlertMouseZoom()
  Window{Prop:Alrt,255} = CtrlShiftP
  INIMgr.Fetch('WindowRedenRetour',Window)                 ! Restore window settings from non-volatile store
  SELF.SetAlerts()
  LocalClass.InitQ()
  EnterByTabManager.Init(False)
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:Inkoop.Close
    Relate:ViewArtikel.Close
  END
  IF SELF.Opened
    INIMgr.Update('WindowRedenRetour',Window)              ! Save window data to non-volatile store
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
    OF ?LIST1
      IF KEYCode()=MouseLeft2
          Rij#=?LIST1{PROPLIST:MouseDownRow}
          Get(Loc:ListQ,Rij#)
          IF ERROR()
              Message('Rij '&Rij#&' kan niet gevonden worden'&ERROR())
          ELSE
              WindowBoekRetourRegel(LQ:PlanningID, Loc:RetourKG,Loc:RetourPallets,LQ:CelID,LQ:CelLocatieID,LQ:UitgevoerdDoor,LQ:Temperatuur1,LQ:Temperatuur2,LQ:Temperatuur3,LQ:TemperatuurVervoermiddel)
              IF GlobalResponse=RequestCompleted
                  LQ:KGRetour=Loc:RetourKG
                    LQ:PalletsRetour=Loc:RetourPallets
                    ! De TempQ varaiabelen zijn gevuld
                  !=Loc:CelID
                  !=Loc:CelLokatieID
                  Put(Loc:ListQ)
              END    
          END
          DISPLAY()
      END
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?OkButton
      ThisWindow.Update()
      if Loc:RedenRetour=''
          SELECT(?Loc:RedenRetour)
          CYCLE
      elsif Loc:RetourDatum=0
          Select(?Loc:RetourDatum)
          CYCLE
      END
      Aantalkilo# = 0
      Loop i#=1 TO Records(Loc:ListQ) 
          GET(Loc:ListQ,i#)
          Aantalkilo# += LQ:KGRetour
      END
      
      IF Message('Weet u zeker dat er in totaal '&Aantalkilo#&' kilo teruggeboekt moet worden','Retour boeken',ICON:Question,Button:Yes+Button:No, Button:No)=Button:No
          CYCLE
      END
      
      LocalClass.Verwerk()
      
      Loc:ReturnValue=RequestCompleted
      Post(EVENT:CloseWindow)
    OF ?CancelButton
      ThisWindow.Update()
      Loc:ReturnValue=RequestCancelled
      Post(EVENT:CloseDown)
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
        UD.ShowProcedureInfo('WindowRedenRetour',UD.SetApplicationName('VoorrPln','DLL'),Window{PROP:Hlp},'01/12/2017 @ 03:48PM','12/27/2023 @ 02:53PM','10/11/2024 @ 01:54PM')  
    
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
  CASE FIELD()
  OF ?LIST1
    CASE EVENT()
    OF EVENT:PreAlertKey
      IF KEYCode()=MouseLeft OR KEYCode()=MouseLeft2
          CYCLE
      END
    END
  END
  ReturnValue = PARENT.TakeFieldEvent()
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

LocalClass.InitQ    Procedure
CODE
    FREE(Loc:ListQ)
    Loc:RedenRetour=pRedenRetour
    Loc:RetourDatum=PRetourDatum
    IF pVerkoopInkoop='Verkoop'
        Clear(Pla:Record)
        Pla:VerkoopID=pID
        Set(Pla:Planning_FK02,Pla:Planning_FK02)
        LOOP UNTIL Access:Planning.Next()
            IF NOT Pla:VerkoopID=pID THEN BREAK.
    ! De regels die tegengeboekt moeten worden zijn verwerkt=true
    ! De nieuwe regels zetten we eerst op false, anders komen we in een loop
            IF Pla:Verwerkt=FALSE THEN CYCLE.
            LocalClass.AddQ()
!        IF Pla:PlanningIDParent=0
!            LQ:ArtikelID=Pla:ArtikelID
!            Clear(Art:Record)
!            Art:ArtikelID=Pla:ArtikelID
!            IF Access:ViewArtikel.Fetch(Art:Artikel_PK) = Level:Benign
!                LQ:ArtikelOmschrijving=Art:ArtikelOms
!            ELSE
!                LQ:ArtikelOmschrijving='Onbekend artikelid'&Pla:ArtikelID
!            END
!            LQ:KG=Pla:KG
!            LQ:Pallets=Pla:Pallets
!            LQ:KGRetour=0
!            LQ:PalletsRetour=0
!            LQ:PlanningID=Pla:PlanningID
!            IF Pla:PlanningIDRetour<>0
!                APla:PlanningID=Pla:PlanningIDRetour
!                IF Access:APlanning.Fetch(APla:PK_Planning)=Level:Benign
!                    LQ:KGRetour=-APla:KG
!                    LQ:PalletsRetour=-APla:Pallets
!                END
!            END
!            Add(Loc:ListQ)
!        END    
        END 
    ELSE            ! Inkoop dus
    !   Loc:RedenRetour=Ink:RedenRetour
        Clear(Pla:Record)
        Pla:InkoopID=pID
        Set(Pla:Planning_FK01,Pla:Planning_FK01)
        LOOP UNTIL Access:Planning.Next()
            IF NOT Pla:InkoopID=pID THEN BREAK.
            IF Pla:Verwerkt=FALSE THEN CYCLE.
            LocalClass.AddQ()
        END 
    END 
        
    RETURN
    
LocalClass.AddQ     PROCEDURE()
CODE
    !MS(20180606): De regels zijn niet zichtbaar omdat het veld PlanningIDParent in de database de waarde 0 heeft en niet NULL, 
    !              maar ik zie ook regels waarbij dit veld wel NULL is. Daarom controle of beide
    IF NULL(Pla:PlanningIDParent) OR Pla:PlanningIDParent = 0 THEN
        LQ:ArtikelID=Pla:ArtikelID
        Clear(Art:Record)
        Art:ArtikelID=Pla:ArtikelID
        IF Access:ViewArtikel.Fetch(Art:Artikel_PK) = Level:Benign
            LQ:ArtikelOmschrijving=Art:ArtikelOms
        ELSE
            LQ:ArtikelOmschrijving='Onbekend artikelid'&Pla:ArtikelID
        END
        LQ:KG=Pla:KG
        LQ:Pallets=Pla:Pallets
        LQ:KGRetour=0
        LQ:PalletsRetour=0
        LQ:CelID=Pla:CelID
        LQ:CelLocatieID=Pla:CelLocatieID
        IF NOT pVerkoopInkoop='Verkoop'
            IF Pla:CelID=0
                Clear(Mut:Record)
                Mut:PlanningID=Pla:PlanningID
                Set(Mut:Mutatie_FK02,Mut:Mutatie_FK02)
                Loop Until Access:Mutatie.Next()
                IF NOT (Mut:PlanningID=Pla:PlanningID) THEN BREAK.
                    LQ:CelID=Mut:CelID
                    LQ:CelLocatieID=Mut:CelLocatieID
                END
            END
        END    
        LQ:PlanningID=Pla:PlanningID
        IF Pla:PlanningIDRetour<>0
            APla:PlanningID=Pla:PlanningIDRetour
            IF Access:APlanning.Fetch(APla:PK_Planning)=Level:Benign
                LQ:KGRetour=-APla:KG
                LQ:PalletsRetour=-APla:Pallets
                LQ:CelID=APla:CelID
                LQ:CelLocatieID=APla:CelLocatieID
            END
        END
        Add(Loc:ListQ)
    END    
    Return
LocalClass.Verwerk  Procedure
CODE
    Loop i#=1 TO Records(Loc:ListQ) 
        GET(Loc:ListQ,i#)
        Clear(Pla:Record)
        Pla:PlanningID = LQ:PlanningID
        IF Access:Planning.Fetch(Pla:PK_Planning) <> Level:Benign
            Message('Het terugboeken van '&LQ:PlanningID&' is mislukt '&ERROR()) 
        END 
        IF LQ:KGRetour = 0 
            IF Pla:PlanningIDRetour=0 
                CYCLE
            ELSE
                APla:PlanningID = Pla:PlanningIDRetour
                IF Access:APlanning.Fetch(APla:PK_Planning)=Level:Benign
                    Access:APlanning.DeleteRecord(false)
                END
                Clear(Mut:Record)
                Mut:PlanningID=Pla:PlanningIDRetour
                Set(Mut:Mutatie_FK02,Mut:Mutatie_FK02)
                Loop Until Access:Mutatie.Next()
                    IF NOT (Mut:PlanningID=Pla:PlanningIDRetour) THEN BREAK.
                    Access:Mutatie.DeleteRecord(False)
                END
            END
        END
        
        !retour boeken van een planning
        IF Pla:PlanningIDRetour=0
            !planning toevoegen voor de retour boeking
            APla:Record=Pla:Record
            APla:Verwerkt=FALSE
            APla:MutatieGemaakt=FALSE
            APla:KG=-LQ:KGRetour
            APla:Pallets=-LQ:PalletsRetour
            APla:MutatieKG=-LQ:KGRetour
            APla:MutatiePallets=-LQ:PalletsRetour
            APla:Memo=CLIP(Pla:Memo)&'RETOUR'
            APla:CelID=LQ:CelID
            APla:CelLocatieID=LQ:CelLocatieID
            APla:PlanningIDParent = Pla:PlanningID
            Access:APlanning.PrimeRecord(TRUE)
            Pla:PlanningIDRetour=APla:PlanningID
            Access:Planning.Update()
            
            !mutatie(s) aanmaken
            Clear(Mut:Record)
            Mut:PlanningID=Pla:PlanningID
            Set(Mut:Mutatie_FK02,Mut:Mutatie_FK02)
            Loop Until Access:Mutatie.Next()
                IF NOT (Mut:PlanningID=Pla:PlanningID) THEN BREAK.
                AMut:Record=Mut:Record
                
                !MS(20180522): In geval van Verkoop Uitslag mutatie toevoegen
                !              In geval van Inkoop Inslag mutatie toevoegen
                IF pVerkoopInkoop='Verkoop'
                    AMut:InslagKG=0
                    AMut:InslagPallet=0
                    AMut:UitslagKG=-LQ:KGRetour
                    AMut:UitslagPallet=-LQ:PalletsRetour
                ELSE
                    AMut:InslagKG=-LQ:KGRetour
                    AMut:InslagPallet=-LQ:PalletsRetour
                    AMut:UitslagKG=0
                    AMut:UitslagPallet=0
                END
                AMut:CelID=LQ:CelID
                AMut:CelLocatieID=LQ:CelLocatieID
                AMut:RedenAfboeking='RETOUR'
                AMut:PlanningID=APla:PlanningID
                
                AMut:UitslagQAUitgevoerdDoor = LQ:UitgevoerdDoor
                AMut:UitslagQATemperatuur1 = LQ:Temperatuur1
                AMut:UitslagQATemperatuur2 = LQ:Temperatuur2
                AMut:UitslagQATemperatuur3 = LQ:Temperatuur3
                AMut:UitslagQATemperatuurVervoermiddel = LQ:TemperatuurVervoermiddel
                Access:AMutatie.PrimeRecord(True)
            END
            
        !retour boeken van een retourboeking
        ELSE
            !retourboeking opvragen en wijzigen
            APla:PlanningID = Pla:PlanningIDRetour
            IF Access:APlanning.Fetch(APla:PK_Planning)=Level:Benign
                APla:KG=-LQ:KGRetour
                APla:Pallets = -LQ:PalletsRetour
                APla:MutatieKG=-LQ:KGRetour
                APla:MutatiePallets=-LQ:PalletsRetour
                Access:APlanning.Update()
            ELSE 
                ! weghalen 
                Pla:PlanningIDRetour=0
                Access:Planning.Update()
                Message('Let op de Retour Planningsregel '&Pla:PlanningIDRetour&' kan niet gevonden worden','Planning Retour bekend',ICON:Cross)
                ! 2023-12-27 anders worden alle mutaties met planningid 0 gemuteerd
                CYCLE
            END
            
            !mutatie(s) aanpassen
            Clear(Mut:Record)
            Mut:PlanningID=Pla:PlanningIDRetour
            Set(Mut:Mutatie_FK02,Mut:Mutatie_FK02)
            Loop Until Access:Mutatie.Next()
                IF NOT (Mut:PlanningID=Pla:PlanningIDRetour) THEN BREAK.
                
                !MS(20180522): In geval van Verkoop Uitslag mutatie aanpassen
                !              In geval van Inkoop Inslag mutatie aanpassen
                IF pVerkoopInkoop='Verkoop'
                    Mut:UitslagKG=-LQ:KGRetour
                    Mut:UitslagPallet=-LQ:PalletsRetour
                ELSE
                    Mut:InslagKG=-LQ:KGRetour
                    Mut:InslagPallet=-LQ:PalletsRetour
                END
                
                Access:Mutatie.Update()                
            END
        END
    END
    
    ! en nu op verwerkt zetten.....
    IF pVerkoopInkoop='Verkoop'
        Clear(Pla:Record)
        Pla:VerkoopID=pID
        Set(Pla:Planning_FK02,Pla:Planning_FK02)
        LOOP UNTIL Access:Planning.Next()
            IF NOT Pla:VerkoopID=pID THEN BREAK.
            IF Pla:Verwerkt=TRUE THEN CYCLE.
            Pla:Verwerkt=TRUE
            Pla:MutatieGemaakt=TRUE
            Access:Planning.Update()
        END
         ! reden retour wegscvhrijven
!        Ver2:RedenRetour=Loc:RedenRetour
!        Ver2:RetourDatum_DATE = Lco:RetourDatum
!        IF Access:Verkoop.Update()<> Level:Benign
!            Message('Het wegschrijven is foutgegaan'&ERROR())
!        END 
    ELSE
        Clear(Pla:Record)
        Pla:InkoopID=pID
        Set(Pla:Planning_FK01,Pla:Planning_FK01)
        LOOP UNTIL Access:Planning.Next()
            IF NOT Pla:InkoopID=pID THEN BREAK.
            IF Pla:Verwerkt=TRUE THEN CYCLE.
            Pla:Verwerkt=TRUE
            Pla:MutatieGemaakt=TRUE
            Access:Planning.Update()
        END
         ! reden retour wegscvhrijven
!        Ink:RedenRetour=Loc:RedenRetour
!        Ink:RetourDatum_DATE = Lco:RetourDatum
!        IF Access:Inkoop.Update()<> Level:Benign
!            Message('Het wegschrijven is foutgegaan'&ERROR())
!        END 
    END 
    
    pRedenRetour=Loc:RedenRetour
    pRetourDatum= Loc:RetourDatum
    
    RETURN
    
