

   MEMBER('VoorrPln.clw')                                  ! This is a MEMBER module


   INCLUDE('ABDROPS.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('VOORRPLN001.INC'),ONCE        !Local module procedure declarations
                     END


!!! <summary>
!!! Generated from procedure template - Window
!!! </summary>
WindowCelLocaties PROCEDURE 

Loc:Zoom             LONG(300)                             ! 
Loc:Lagen            BYTE                                  ! 
Loc:CelID            LONG                                  ! 
Loc:PlannningTonen   BYTE                                  ! 
FDB3::View:FileDrop  VIEW(Cel)
                       PROJECT(CEL:CelOms)
                       PROJECT(CEL:Breedte)
                       PROJECT(CEL:Lengte)
                       PROJECT(CEL:CelID)
                     END
Queue:FileDrop       QUEUE                            !
CEL:CelOms             LIKE(CEL:CelOms)               !List box control field - type derived from field
CEL:Breedte            LIKE(CEL:Breedte)              !Browse hot field - type derived from field
CEL:Lengte             LIKE(CEL:Lengte)               !Browse hot field - type derived from field
CEL:CelID              LIKE(CEL:CelID)                !Primary key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
LocEnableEnterByTab  BYTE(1)                               !Used by the ENTER Instead of Tab template
EnterByTabManager    EnterByTabClass
Window               WINDOW('CelLocatie'),AT(,,668,444),FONT('Microsoft Sans Serif',8,,FONT:regular),RESIZE,ICON(ICON:Application), |
  GRAY,MAX,MDI,SYSTEM,IMM
                       LIST,AT(3,2,105),USE(CEL:CelOms),DROP(25),FORMAT('200L(2)|M~Cel Oms~L(0)@s50@'),FROM(Queue:FileDrop)
                       PROMPT('Zoom:'),AT(306,5),USE(?Loc:Zoom:Prompt)
                       LIST,AT(331,2),USE(Loc:Zoom),RIGHT(1),DROP(10),FROM('25|50|100|150|200|300|400|800')
                       CHECK('Plannning Tonen:'),AT(113,5),USE(Loc:PlannningTonen)
                       PROMPT('Lagen:'),AT(192,5),USE(?Loc:Lagen:Prompt)
                       LIST,AT(219,2),USE(Loc:Lagen),DROP(5),FROM('Alle Lagen|#0|Grond|#1|a|#2|b|#4|c|#8')
                       BOX,AT(416,1,50,20),USE(?BOX1),COLOR(COLOR:White),FILL(COLOR:Blue),LINEWIDTH(1)
                       BOX,AT(470,1,50,20),USE(?BOX1:2),COLOR(COLOR:White),FILL(COLOR:Navy),LINEWIDTH(1)
                       BOX,AT(523,1,50,20),USE(?BOX1:3),COLOR(COLOR:White),FILL(COLOR:Green),LINEWIDTH(1)
                       BOX,AT(577,1,50,20),USE(?BOX1:4),COLOR(COLOR:White),FILL(COLOR:Yellow),LINEWIDTH(1)
                       BOX,AT(631,1,50,20),USE(?BOX1:5),COLOR(COLOR:White),FILL(COLOR:Orange),LINEWIDTH(1)
                       STRING('Cel-Locatie'),AT(423,7),USE(?STRING1),FONT(,,COLOR:White),TRN
                       STRING('Grond'),AT(483,7,24,10),USE(?STRING1:2),FONT(,,COLOR:White),TRN
                       STRING('stelling a'),AT(534,7,39,10),USE(?STRING1:3),FONT(,,COLOR:White),TRN
                       STRING('stelling b'),AT(587,7,29,10),USE(?STRING1:4),FONT(,,COLOR:Black),TRN
                       STRING('stelling c'),AT(638,7,28,10),USE(?STRING1:5),FONT(,,COLOR:White),TRN
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
FDB3                 CLASS(FileDropClass)                  ! File drop manager
Q                      &Queue:FileDrop                !Reference to display queue
                     END

SoortBox            ITEMIZE,PRE
Cel                     EQUATE(1)         
CelLokatie              EQUATE(2)         
Pallet                  EQUATE(4)         
                    END
SoortPallet         ITEMIZE,PRE
GrondPallet             EQUATE(1)         
Locatie_a               EQUATE(2)         
Locatie_b               EQUATE(4)         
Locatie_c               EQUATE(8)         
                    END
           
Direction:BovenOnder              String('BovenOnder')
Direction:OnderBoven              String('OnderBoven')
Direction:RechtsLinks             String('RechtsLinks')
Direction:LinksRechts             String('LinksRechts')
                   

BoxGroup            GROUP,TYPE
SoortBox                LONG
SoortPallet             LONG
Direction               String(20)    
Actief                  BYTE
tekst                   Cstring(100)
tooltip                 Cstring(100)
                    END
LocalClass          CLASS
DrawCel                 Procedure(Cel:Record)
DrawBox                 Procedure(*Long _eq, Long _x, Long _y, Long _h, Long _w, BoxGroup _boxcs)
VulBoxQ                 Procedure(Long _x, Long _y, Long _h, Long _w, BoxGroup _boxcs)
ShowBoxQ                Procedure()

YPosOrigineel           LONG(30)        ! zodat ik in een ring van 5 de tekst kan tonen
XPosOrigineel           LONG(5)        ! zodat ik in een ring van 5 de tekst kan tonen
CelEQ                   LONG()

                    END

BoxQ                QUEUE,PRE(BQ)
_x                      Long 
_y                      Long 
_h                      Long 
_w                      Long                    
_boxcs                  GROUP(BoxGroup)
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
  GlobalErrors.SetProcedureName('WindowCelLocaties')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?CEL:CelOms
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
  Relate:ACelLocatie.Open                                  ! File ACelLocatie used by this procedure, so make sure it's RelationManager is open
  Relate:Cel.SetOpenRelated()
  Relate:Cel.Open                                          ! File Cel used by this procedure, so make sure it's RelationManager is open
  Relate:PlanningVerkoop.Open                              ! File PlanningVerkoop used by this procedure, so make sure it's RelationManager is open
  Relate:ViewPartijCelLocaties.Open                        ! File ViewPartijCelLocaties used by this procedure, so make sure it's RelationManager is open
  Relate:ViewVoorraadPartij.Open                           ! File ViewVoorraadPartij used by this procedure, so make sure it's RelationManager is open
  Access:CelLocatie.UseFile                                ! File referenced in 'Other Files' so need to inform it's FileManager
  SELF.FilesOpened = True
  SELF.Open(Window)                                        ! Open window
  WinAlertMouseZoom()
  Do DefineListboxStyle
  INIMgr.Fetch('WindowCelLocaties',Window)                 ! Restore window settings from non-volatile store
  FDB3.Init(?CEL:CelOms,Queue:FileDrop.ViewPosition,FDB3::View:FileDrop,Queue:FileDrop,Relate:Cel,ThisWindow)
  FDB3.Q &= Queue:FileDrop
  FDB3.AddSortOrder(CEL:CEL_PK)
  FDB3.AddField(CEL:CelOms,FDB3.Q.CEL:CelOms) !List box control field - type derived from field
  FDB3.AddField(CEL:Breedte,FDB3.Q.CEL:Breedte) !Browse hot field - type derived from field
  FDB3.AddField(CEL:Lengte,FDB3.Q.CEL:Lengte) !Browse hot field - type derived from field
  FDB3.AddField(CEL:CelID,FDB3.Q.CEL:CelID) !Primary key field - type derived from field
  FDB3.AddUpdateField(CEL:CelID,Loc:CelID)
  ThisWindow.AddItem(FDB3.WindowComponent)
  FDB3.DefaultFill = 0
  SELF.SetAlerts()
  EnterByTabManager.Init(False)
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:ACelLocatie.Close
    Relate:Cel.Close
    Relate:PlanningVerkoop.Close
    Relate:ViewPartijCelLocaties.Close
    Relate:ViewVoorraadPartij.Close
  END
  IF SELF.Opened
    INIMgr.Update('WindowCelLocaties',Window)              ! Save window data to non-volatile store
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
    OF ?CEL:CelOms
      LocalClass.DrawCel(CEL:Record)
    OF ?Loc:Zoom
      LocalClass.ShowBoxQ()
    OF ?Loc:PlannningTonen
      LocalClass.ShowBoxQ()
      
    OF ?Loc:Lagen
      LocalClass.ShowBoxQ()
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

LocalClass.DrawCel  Procedure(Cel:Record)
PalletTeller            LONG
PartijTeller            LONG
MaxPalletRij            LONG
CurrentPalletRij        LONG
CurrentPalletPlaats     LONG
PalletHoogte            LONG

PartijQ                 QUEUE,PRE(PQ)
PartijID                    LONG
KG                          LONG
Pallet                      LONG
PalletRij                   LONG
PalletPlaats                LONG
AantalPalletPlaatsen        LONG
Actief                      BYTE
Direction               String(20)    
                        END

PalletRijQ              Queue,PRE(PRQ)
PalletRij                   LONG
AantalPalletsPlaatsen       LONG
                        END

RijQ                    QUEUE,Pre(RQ)
CelLocatieID                LONG
PalletPLaats                LONG
                        END

_Xpos                   LONG
_Ypos                   LONG
_Breedte                LONG
_Lengte                 Long
_hoogte                 Long
_Locatienaam            Cstring(51)    

_boxcs                  GROUP(BoxGroup)
                        END
starttime                   TIME

CODE
    starttime=Clock()
    SETCURSOR(CURSOR:Wait)
    Free(BoxQ)
    Free(RijQ)
    !LocalClass.CelEQ = 4000    
    
    _boxcs.SoortBox=SoortBox:Cel
    _boxcs.Direction=Direction:LinksRechts
    _boxcs.tekst=''         !CEL:CelOms
    _boxcs.tooltip=''       !
    !LocalClass.DrawBox(LocalClass.CelEQ ,0,0, Cel:Breedte,Cel:Lengte, _boxcs) 
    LocalClass.VulBoxQ(0,0, Cel:Breedte,Cel:Lengte, _boxcs) 
    CLEAR(CL:RECORD)    
    CL:CelID=Loc:CelID
    Set(CL:FK_CelLocatie,CL:FK_CelLocatie)
    Loop until Access:CelLocatie.Next()
        IF NOT CL:CelID=Loc:CelID THEN Break.
        if CL:Xpos=0 and CL:Ypos=0 and CL:Breedte=0 and CL:Lengte=0 then cycle.
        LocalClass.CelEQ+=1
        _boxcs.SoortBox=SoortBox:CelLokatie
        _boxcs.Direction=CL:Direction
        _boxcs.tekst=CL:Locatienaam
        _boxcs.tooltip=CL:Locatienaam
        IF CL:Direction='OnderBoven'
            LocalClass.VulBoxQ(CL:Xpos,|
                CL:Ypos-CL:Lengte, |
                CL:Lengte,|
                CL:Breedte , _boxcs) 
        ELSIF CL:Direction='BovenOnder' 
            LocalClass.VulBoxQ(CL:Xpos,|
                CL:Ypos, |
                CL:Lengte,|
                CL:Breedte , _boxcs) 
        ELSE    
            LocalClass.VulBoxQ(CL:Xpos,CL:Ypos, CL:Breedte,CL:Lengte, _boxcs) 
        END
    END
    
    CLEAR(CL:RECORD)    
    CL:CelID=Loc:CelID
    Set(CL:FK_CelLocatie,CL:FK_CelLocatie)
    Loop until Access:CelLocatie.Next()
        IF NOT CL:CelID=Loc:CelID THEN Break.
        ! als de cellocatie  eindigt op abc 
        IF SUB(CL:Locatienaam,-1,1)='a' OR SUB(CL:Locatienaam,-1,1)='b'|
            OR SUB(CL:Locatienaam,-1,1)='c'
            CLEAR(ACL:Record)
            Set(ACelLocatie)
            ACelLocatie{Prop:Where}='Locatienaam = <39>'&SUB(CL:Locatienaam,1,LEN(CL:Locatienaam)-1)&|
                '<39> AND CelID='&CL:CelID
            Loop Until Access:ACelLocatie.Next()
                _Xpos=ACL:Xpos                    
                _Ypos=ACL:Ypos                    
                _Breedte=ACL:Breedte                 
                _Lengte=ACL:Lengte                  
                _hoogte=ACL:Hoogte
                
                _Locatienaam=ACL:Locatienaam
                _boxcs.SoortBox=SoortBox:Pallet
                _boxcs:Direction=ACL:Direction
                IF SUB(CL:Locatienaam,-1,1)='a' THEN _boxcs.SoortPallet=SoortPallet:Locatie_a.
                IF SUB(CL:Locatienaam,-1,1)='b' THEN _boxcs.SoortPallet=SoortPallet:Locatie_b.
                IF SUB(CL:Locatienaam,-1,1)='c' THEN _boxcs.SoortPallet=SoortPallet:Locatie_c.
            END
        ELSE
            _Xpos=CL:Xpos                    
            _Ypos=CL:Ypos                    
            _Breedte=CL:Breedte                 
            _Lengte=CL:Lengte                  
            _hoogte=CL:Hoogte
            _Locatienaam=CL:Locatienaam
            _boxcs.SoortBox=SoortBox:Pallet
            _boxcs.SoortPallet=SoortPallet:GrondPallet
            _boxcs:Direction=CL:Direction
        END
        if _Xpos=0 and _Ypos=0 and _Breedte=0 and _Lengte=0 then cycle.

        ! pallets
        FREE(PartijQ)
        PalletTeller=0
        PartijTeller=0
        Clear(VPCL:Record)
        !Set(VPCL:ViewPartijCelLocaties_PK,VPCL:ViewPartijCelLocaties_PK)
        SET(ViewPartijCelLocaties)
        ViewPartijCelLocaties{Prop:Where}='CelID='&CL:CelID&' AND CelLocatieID='&CL:CelLocatieID&' AND KG > 0' ! AND Pallet > 0 '
        ViewPartijCelLocaties{Prop:SQLOrder}='PartijID' 
        Loop UNtil Access:ViewPartijCelLocaties.Next()
            Clear(VVPar:Record)
            VVPar:PartijID=VPCL:PartijID
            VVPar:CelID=VPCL:CelID
            IF Access:ViewVoorraadPartij.Fetch(VVPar:PartijID_CelID_K)=Level:Benign
                IF VVPar:VoorraadKG<=0 THEN CYCLE.
            ELSE    
                CYCLE
            END    
            PQ:PartijID=VPCL:PartijID
            PQ:KG=CHOOSE(VPCL:KG > VVPar:VoorraadKG, VVPar:VoorraadKG, VPCL:KG)
            PQ:Pallet = CHOOSE(VPCL:Pallet > VVPar:VoorraadPallets,VVPar:VoorraadPallets, VPCL:Pallet)
            PQ:Actief=FALSE
            PQ:Direction = _boxcs:Direction
            ADD(PartijQ,+PQ:PartijID)
        END
        ! Hoeveel pallets kunnen er naast elkaar geplaats worden
        MaxPalletRij = INT(_Breedte/12)
        IF MaxPalletRij =0 THEN MaxPalletRij=1.
        
        FREE(PalletRijQ)
        
        Loop i#=1 TO MaxPalletRij
            PRQ:PalletRij=i#
            PRQ:AantalPalletsPlaatsen=0
            Add(PalletRijQ,-PRQ:AantalPalletsPlaatsen)
        END    
        RQ:CelLocatieID=CL:CelLocatieID
        Get(RIjQ,+RQ:CelLocatieID)
        IF ERROR()
            RQ:CelLocatieID=CL:CelLocatieID
            RQ:PalletPLaats=1
            Add(RIjQ,+RQ:CelLocatieID)
        END
        CurrentPalletPlaats=RQ:PalletPLaats
        CurrentPalletRij=0
        IF _Hoogte<>0
            PalletHoogte=_Hoogte
        ELSE    
            PalletHoogte=1
        END
        Loop i#=1 TO Records(PartijQ)
            GET(PartijQ,+i#)
            IF PQ:Pallet<=0
                PQ:AantalPalletPlaatsen=1
            ELSE
                PQ:AantalPalletPlaatsen = ROUND(((PQ:Pallet/PalletHoogte)+0.49),1)     ! naar boven afronden
            END
            Sort(PalletRijQ,+PRQ:AantalPalletsPlaatsen)
            Get(PalletRijQ,1)
            if error()
                CurrentPalletRij=1
                PRQ:PalletRij=1
                PRQ:AantalPalletsPlaatsen=PQ:AantalPalletPlaatsen
                Add(PalletRijQ,-PRQ:AantalPalletsPlaatsen)
            ELSE
                CurrentPalletRij=PRQ:PalletRij
                CurrentPalletPlaats=PRQ:AantalPalletsPlaatsen+1
                PRQ:AantalPalletsPlaatsen+=PQ:AantalPalletPlaatsen
                PUT(PalletRijQ)
            END
            PQ:PalletPlaats=CurrentPalletPlaats
            PQ:PalletRij=CurrentPalletRij
            PUT(PartijQ)
            RQ:CelLocatieID=CL:CelLocatieID
            Get(RIjQ,+RQ:CelLocatieID)
            IF ERROR()
                RQ:CelLocatieID=CL:CelLocatieID
                RQ:PalletPLaats=CurrentPalletPlaats
                Add(RIjQ,+RQ:CelLocatieID)
            ELSE
                RQ:PalletPLaats=CurrentPalletPlaats
                PUT(RIjQ,+RQ:CelLocatieID)
            END

        END
        !IF Loc:PlannningTonen
            Relate:PlanningVerkoop.Open()
            Loop i#=1 TO Records(PartijQ)
                GET(PartijQ,+i#)
                Clear(Pla3:Record)
                Set(PlanningVerkoop)
                PlanningVerkoop{Prop:Where}='PartijID = '&PQ:PartijID&' AND CelID='&Loc:CelID&|
                    ' AND Planning>=<39>'&Format(Today(),@D10-)&'<39> AND Planning<60><39>'&Format(Today()+1,@D10-)&'<39>'
                Loop Until Access:PlanningVerkoop.Next()
                    ! als deze bestaat actief maken
                    PQ:Actief=TRUE
                    Put(PartijQ)
                END
            END
            Relate:PlanningVerkoop.Close()
        !END
        
        Loop i#=1 TO Records(PartijQ)
            GET(PartijQ,+i#)
            _boxcs.Actief = PQ:Actief
            _boxcs.Direction = PQ:Direction
            _boxcs.tekst=PQ:PartijID&':'&PQ:Pallet
            _boxcs.tooltip=PQ:PartijID
            LocalClass.CelEQ+=1
            ! een pallet is 100x120 dus 10x12
            ! in PG:Pallet staat het aantal pallet stel je voor max 3 hoog
            PalletTeller+=VPCL:Pallet
            IF _boxcs:Direction='RechtsLinks'
                ! palletplaats 1 = XPOS+Lengte 2 = XPOS+Lengte-PP
                LocalClass.VulBoxQ(_Xpos+_Lengte-((PQ:PalletPlaats-1+PQ:AantalPalletPlaatsen-1+1)*10),|
                    _Ypos+((PQ:PalletRij-1)*12), |
                    12, |
                    10+10*(PQ:AantalPalletPlaatsen-1) , |
                    _boxcs) 
            ELSIF _boxcs:Direction='OnderBoven'                 
                LocalClass.VulBoxQ(_Xpos-((PQ:PalletRij-1)*12),|
                    _Ypos-((PQ:PalletPlaats+PQ:AantalPalletPlaatsen-1)*10), |
                    10+10*(PQ:AantalPalletPlaatsen-1), |
                    12 , _boxcs) 
            ELSIF _boxcs:Direction='BovenOnder'                                 
                LocalClass.VulBoxQ(_Xpos+((PQ:PalletRij-1)*12),|
                    _Ypos+((PQ:PalletPlaats-1)*10), |
                    10+10*(PQ:AantalPalletPlaatsen-1) , |
                    12, _boxcs) 
            ELSE    
                LocalClass.VulBoxQ(_Xpos+((PQ:PalletPlaats-1)*10),|
                    _Ypos+((PQ:PalletRij-1)*12), |
                    12, |
                    10+10*(PQ:AantalPalletPlaatsen-1) , _boxcs) 
            END    
            PartijTeller+=1
        END
        
    END
    LocalClass.ShowBoxQ()
    SETCURSOR()
    0{PROP:MSG} = (Clock()-starttime)/100&' sec'
    DISPLAY()
    return
LocalClass.DrawBox  Procedure(*Long _eq, Long _x, Long _y, Long _h, Long _w, BoxGroup _boxcs)
aantalblokken           LONG
PalletHoogte            EQUATE(12)
PalletBreedte           EQUATE(10)
CODE
    ! Lagen filter 0= Alle lagen 
    IF Loc:Lagen<>0 
        IF _boxcs.SoortBox = SoortBox:Pallet AND Loc:Lagen<>_boxcs.SoortPallet
            RETURN
        END    
    END    
    
    CREATE(_eq,CREATE:box)           !Create the control
    _eq{PROP:Xpos} = _x*Loc:Zoom/100+LocalClass.XPosOrigineel           
    _eq{PROP:Ypos} = _y*Loc:Zoom/100+LocalClass.YPosOrigineel
    _eq{Prop:Height}=_h*Loc:Zoom/100
    _eq{Prop:Width}=_w*Loc:Zoom/100
    _eq{Prop:Tooltip}=_boxcs:tooltip
    
    Case _boxcs.SoortBox
    of SoortBox:Pallet
        IF _boxcs.SoortPallet=SoortPallet:GrondPallet
            _eq{PROP:Fill}=COLOR:Navy
        ELSIF _boxcs.SoortPallet=SoortPallet:Locatie_a
            _eq{PROP:Fill}=COLOR:Green
        ELSIF _boxcs.SoortPallet=SoortPallet:Locatie_b
            _eq{PROP:Fill}=COLOR:Yellow
        ELSIF _boxcs.SoortPallet=SoortPallet:Locatie_c
            _eq{PROP:Fill}=COLOR:Orange 
        End
        _eq{PROP:Color}=CHOOSE(Loc:PlannningTonen AND _boxcs.Actief,Color:Red,Color:White)
        _eq{PROP:LINEWIDTH}=3
    of SoortBox:CelLokatie
        _eq{PROP:Fill}=COLOR:Blue
        _eq{PROP:Color}=Color:Yellow
    of SoortBox:Cel
        _eq{PROP:Fill}=COLOR:None
        _eq{PROP:Color}=Color:Black
    END 
    UNHIDE(_eq)                        !Display the new control
    
    ! palletplaatsen weergeven
    IF _boxcs.SoortBox=SoortBox:Pallet
        ! eerst uitzoeken hoe groot de rechthoek is
        !if _boxcs.Direction='LinksRechts' OR _boxcs.Direction='RechtsLinks'
        if _boxcs.Direction=Direction:LinksRechts OR _boxcs.Direction=Direction:RechtsLinks
            aantalBlokken = _w/PalletBreedte
        ELSE
            aantalBlokken = _h/PalletBreedte
        END    
        !Message('Aantal blokken '&aantalBlokken &' w:'&_w&'h:'&_h,_boxcs.Direction)
        LOOP i#=1 TO aantalblokken-1
            _eq+=1
            CREATE(_eq,CREATE:Line)           !Create the control
            if _boxcs.Direction=Direction:LinksRechts OR _boxcs.Direction=Direction:RechtsLinks
                _eq{PROP:Xpos} = ((10*i#)+_x)*Loc:Zoom/100+LocalClass.XPosOrigineel           
                _eq{PROP:Ypos} = (_y+1)*Loc:Zoom/100+LocalClass.YPosOrigineel
                _eq{Prop:Height}=(12-2)*Loc:Zoom/100
                _eq{Prop:Width}=0   !_w*Loc:Zoom/100
            ELSE
                _eq{PROP:Xpos} = (_x+1)*Loc:Zoom/100+LocalClass.XPosOrigineel       ! boven onder + 1    
                _eq{PROP:Ypos} = ((10*i#)+_y)*Loc:Zoom/100+LocalClass.YPosOrigineel
                _eq{Prop:Height}=0
                _eq{Prop:Width}=(12-2)*Loc:Zoom/100
            END
            _eq{PROP:Color}=Color:Silver
            _eq{PROP:LINEWIDTH}=1
            
            UNHIDE(_eq)                        !Display the new control
        END
    END
    IF _boxcs:tekst<>''
        _eq+=1
        CREATE(_eq,CREATE:string)           
        _eq{PROP:Ypos} = _y*Loc:Zoom/100+LocalClass.YPosOrigineel
        _eq{PROP:Xpos} = _x*Loc:Zoom/100+LocalClass.XPosOrigineel           
        _eq{Prop:Text} = _boxcs:tekst
        _eq{PROP:Color}=CHOOSE(Loc:PlannningTonen AND _boxcs.Actief,Color:Red,Color:None)
        Case _boxcs.SoortBox
            OF SoortBox:Pallet
            IF _boxcs.Direction=Direction:RechtsLinks
                _eq{PROP:Xpos} = (_x+_w)*Loc:Zoom/100+LocalClass.XPosOrigineel-30            ! de -30 is onstaat door rechtsuitlijnen
            END
        OF SoortBox:CelLokatie
            IF _boxcs.Direction=Direction:BovenOnder
                _eq{PROP:Xpos} = (_x+(_w/2))*Loc:Zoom/100             ! in het midden van de locatie laten zien
                _eq{PROP:Ypos} = _y*Loc:Zoom/100+LocalClass.YPosOrigineel-10  ! bovenaan cellocatie weegeven
            ELSIF _boxcs.Direction=Direction:OnderBoven
                _eq{PROP:Xpos} = (_x+(_w/2))*Loc:Zoom/100+LocalClass.XPosOrigineel             ! in het midden van de locatie laten zien
                _eq{PROP:Ypos} = (_y+_h)*Loc:Zoom/100+LocalClass.YPosOrigineel                    ! en 
            ELSIF _boxcs.Direction=Direction:RechtsLinks
                _eq{PROP:Xpos} = (_x+_w)*Loc:Zoom/100+LocalClass.XPosOrigineel            ! andersom uitgelijnd
            ELSE
                _eq{PROP:Xpos} = _x*Loc:Zoom/100           
            END
        ELSE
            _eq{PROP:Xpos} = (_x+_w)*Loc:Zoom/100+LocalClass.XPosOrigineel               
        END
        UNHIDE(_eq)                        !Display the new control
    END
   
    return
LocalClass.VulBoxQ  Procedure(Long _x, Long _y, Long _h, Long _w, BoxGroup _boxcs)

CODE
    BQ:_x=_x
    BQ:_y=_y
    BQ:_h=_h
    BQ:_w=_w
    BQ:_boxcs = _boxcs
    Add(BoxQ)
    
    RETURN
LocalClass.ShowBoxQ Procedure()
CODE
    Loop i#=4000 to LocalClass.CelEQ 
        DESTROY(i#)
    END
    LocalClass.CelEQ = 4000    

    LOOP i#=1 to Records(BoxQ)
        GET(BoxQ,i#)
        LocalClass.CelEQ+=1
        LocalClass.DrawBox(LocalClass.CelEQ ,BQ:_x, BQ:_y, BQ:_h, BQ:_w, BQ:_boxcs)
      !  Message('Box '&i#&' eq:'&LocalClass.CelEQ&' x:'&BQ:_x&' y:'&BQ:_y&' h:'&BQ:_h&' w:'&BQ:_w&' soortbox '&BQ:_boxcs:SoortBox&' SoortPallet '&BQ:_boxcs:SoortPallet, BQ:_boxcs:Direction)
    END
    
    RETURN
    
