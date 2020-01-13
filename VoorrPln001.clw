

   MEMBER('VoorrPln.clw')                                  ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABDROPS.INC'),ONCE
   INCLUDE('ABPOPUP.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABUTIL.INC'),ONCE
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
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
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
    
!!! <summary>
!!! Generated from procedure template - Window
!!! </summary>
MainPlanning PROCEDURE 

LocEnableEnterByTab  BYTE(1)                               !Used by the ENTER Instead of Tab template
EnterByTabManager    EnterByTabClass
Window               WINDOW('Caption'),AT(,,260,100),GRAY
                     END

    omit('***',WE::CantCloseNowSetHereDone=1)  !Getting Nested omit compile error, then uncheck the "Check for duplicate CantCloseNowSetHere variable declaration" in the WinEvent local template
WE::CantCloseNowSetHereDone equate(1)
WE::CantCloseNowSetHere     long
    !***
ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
TakeEvent              PROCEDURE(),BYTE,PROC,DERIVED
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass

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
  GlobalErrors.SetProcedureName('MainPlanning')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = 1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:PartijCelVoorraad.Open                            ! File PartijCelVoorraad used by this procedure, so make sure it's RelationManager is open
  Relate:ViewPartijCelLocaties.Open                        ! File ViewPartijCelLocaties used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(Window)                                        ! Open window
  WinAlertMouseZoom()
  Do DefineListboxStyle
  INIMgr.Fetch('MainPlanning',Window)                      ! Restore window settings from non-volatile store
  SELF.SetAlerts()
  EnterByTabManager.Init(False)
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:PartijCelVoorraad.Close
    Relate:ViewPartijCelLocaties.Close
  END
  IF SELF.Opened
    INIMgr.Update('MainPlanning',Window)                   ! Save window data to non-volatile store
  END
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

!!! <summary>
!!! Generated from procedure template - Window
!!! Form Mutatie
!!! </summary>
UpdateOverboekPlanningVanuitVV PROCEDURE 

CurrentTab           STRING(80)                            ! 
Loc:Memo             CSTRING(101)                          ! 
Loc:Transport        CSTRING(101)                          ! 
Loc:KG               DECIMAL(10,2)                         ! 
Loc:CelID            LONG                                  ! 
Loc:CelLokatieID     LONG                                  ! 
Loc:Pallets          LONG                                  ! 
Loc:Artikel          CSTRING(100)                          ! 
LOC:PlanningDatum    DATE                                  ! 
LOC:PlanningTijdstip TIME                                  ! 
ActionMessage        CSTRING(40)                           ! 
Loc:ArtikelID        CSTRING(31)                           ! 
Loc:RelatieID        LONG                                  ! 
Loc:ArtikelOms       CSTRING(101)                          ! 
Loc:Leverancieroms   CSTRING(101)                          ! 
Loc:VerpakkingsID    LONG                                  ! 
Loc:VerpakkingOms    CSTRING(51)                           ! 
LOC:Instructie       CSTRING(101)                          ! 
Loc:OverboekSoort    CSTRING(21)                           ! 
FDCB7::View:FileDropCombo VIEW(ACel)
                       PROJECT(ACel:CelOms)
                       PROJECT(ACel:CelID)
                     END
FDB9::View:FileDrop  VIEW(ACelLocatie)
                       PROJECT(ACL:Locatienaam)
                       PROJECT(ACL:CelLocatieID)
                     END
Queue:FileDropCombo  QUEUE                            !
ACel:CelOms            LIKE(ACel:CelOms)              !List box control field - type derived from field
ACel:CelID             LIKE(ACel:CelID)               !Primary key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
Queue:FileDrop       QUEUE                            !
ACL:Locatienaam        LIKE(ACL:Locatienaam)          !List box control field - type derived from field
ACL:CelLocatieID       LIKE(ACL:CelLocatieID)         !Primary key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
LocEnableEnterByTab  BYTE(1)                               !Used by the ENTER Instead of Tab template
EnterByTabManager    EnterByTabClass
History::Mut:Record  LIKE(Mut:RECORD),THREAD
QuickWindow          WINDOW('OVERBOEKEN'),AT(,,415,257),FONT('MS Sans Serif',8,,,CHARSET:DEFAULT),RESIZE,CENTER, |
  GRAY,IMM,MDI,HLP('UpdateUitslagMutatie'),SYSTEM
                       SHEET,AT(4,4,403,226),USE(?CurrentTab)
                         TAB('&1) General'),USE(?Tab:1)
                           PROMPT('Invoerdatum'),AT(8,22),USE(?Mut:DatumTijd_DATE:Prompt),TRN
                           ENTRY(@d6-),AT(85,21,64,10),USE(Mut:DatumTijd_DATE),DISABLE
                           PROMPT('Invoertijd:'),AT(163,21),USE(?Mut:DatumTijd_TIME:Prompt),TRN
                           ENTRY(@t7),AT(199,22,64,10),USE(Mut:DatumTijd_TIME),DISABLE
                           PROMPT('Artikel:'),AT(8,37),USE(?PROMPT1)
                           ENTRY(@s60),AT(85,37,309,10),USE(Art:ArtikelOms),COLOR(COLOR:White),DISABLE,READONLY
                           PROMPT('Verpakking:'),AT(9,52),USE(?PROMPT2)
                           ENTRY(@s50),AT(85,53,309,10),USE(Ver:VerpakkingOmschrijving),COLOR(COLOR:White),DISABLE
                           PROMPT('Leverancier:'),AT(9,68),USE(?PROMPT4)
                           ENTRY(@s50),AT(85,69,309,10),USE(Rel:FirmaNaam),COLOR(COLOR:White),DISABLE
                           PROMPT('Cel:'),AT(9,85),USE(?CEL:CelOms:Prompt)
                           ENTRY(@s50),AT(85,85,309,10),USE(CEL:CelOms),COLOR(COLOR:White),DISABLE
                           PROMPT('Overboek Soort:'),AT(10,110),USE(?Pla:OverboekSoort:Prompt)
                           LIST,AT(85,111,309,10),USE(Loc:OverboekSoort),DROP(5),FROM('Overboeking|Verplaatsing|Co' & |
  'rrectie|Afboeking')
                           STRING('Ingeslagen:'),AT(9,123),USE(?STRING1)
                           ENTRY(@n-15`2),AT(85,123,60,10),USE(Mut:InslagKG),RIGHT,COLOR(COLOR:White),DISABLE
                           PROMPT('KG'),AT(152,123),USE(?Loc:KG:Prompt),RIGHT
                           ENTRY(@n-14.),AT(199,123,60,10),USE(Mut:InslagPallet),RIGHT,COLOR(COLOR:White),DISABLE
                           PROMPT('Pallets'),AT(264,123),USE(?Loc:Pallets:Prompt),RIGHT
                           PROMPT('Datum:'),AT(10,186),USE(?LOC:PlanningDatum:Prompt)
                           ENTRY(@d6-),AT(85,186,60,10),USE(LOC:PlanningDatum)
                           PROMPT('Tijdstip:'),AT(168,186),USE(?LOC:PlanningTijdstip:Prompt)
                           ENTRY(@t7),AT(198,186,60,10),USE(LOC:PlanningTijdstip)
                           PROMPT('Overboeken:'),AT(10,138),USE(?Mut:UitslagKG:Prompt)
                           ENTRY(@n14`2),AT(85,138,60,10),USE(Loc:KG),RIGHT(1)
                           PROMPT('KG'),AT(151,138),USE(?PROMPT5)
                           ENTRY(@n14.),AT(198,138,60,10),USE(Loc:Pallets),RIGHT(1)
                           PROMPT('Pallets'),AT(264,138),USE(?Mut:UitslagPallet:Prompt)
                           STRING('Cel:'),AT(10,154),USE(?STRING2)
                           COMBO(@s20),AT(85,154,173,10),USE(ACel:CelOms),DROP(5),FORMAT('200L(2)|M~Omschrijving~@s50@'), |
  FROM(Queue:FileDropCombo),IMM
                           PROMPT('Locatie'),AT(11,170),USE(?PROMPT3)
                           LIST,AT(85,170,173,10),USE(ACL:Locatienaam),DROP(25),FORMAT('200L(2)|M~Locatienaam~L(0)@s50@'), |
  FROM(Queue:FileDrop)
                           PROMPT('Instructie:'),AT(10,199),USE(?LOC:Instructie:Prompt)
                           ENTRY(@s100),AT(85,200,309,10),USE(LOC:Instructie)
                           PROMPT('Transport:'),AT(10,214),USE(?Loc:Transport:Prompt)
                           ENTRY(@s100),AT(85,214,309,10),USE(Loc:Transport)
                           PROMPT('Locatienaam:'),AT(9,98),USE(?CL:Locatienaam:Prompt)
                           ENTRY(@s50),AT(85,98,309,10),USE(CL:Locatienaam),DISABLE
                         END
                       END
                       BUTTON('&OK'),AT(305,235,49,14),USE(?OK),LEFT,ICON('WAOK.ICO'),DEFAULT,FLAT,MSG('Accept dat' & |
  'a and close the window'),TIP('Accept data and close the window')
                       BUTTON('&Cancel'),AT(358,235,49,14),USE(?Cancel),LEFT,ICON('WACANCEL.ICO'),FLAT,MSG('Cancel operation'), |
  TIP('Cancel operation')
                     END

    omit('***',WE::CantCloseNowSetHereDone=1)  !Getting Nested omit compile error, then uncheck the "Check for duplicate CantCloseNowSetHere variable declaration" in the WinEvent local template
WE::CantCloseNowSetHereDone equate(1)
WE::CantCloseNowSetHere     long
    !***
ThisWindow           CLASS(WindowManager)
Ask                    PROCEDURE(),DERIVED
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
PrimeUpdate            PROCEDURE(),BYTE,PROC,DERIVED
Reset                  PROCEDURE(BYTE Force=0),DERIVED
Run                    PROCEDURE(),BYTE,PROC,DERIVED
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED
TakeCompleted          PROCEDURE(),BYTE,PROC,DERIVED
TakeEvent              PROCEDURE(),BYTE,PROC,DERIVED
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
Resizer              CLASS(WindowResizeClass)
Init                   PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)
                     END

FDCB7                CLASS(FileDropComboClass)             ! File drop combo manager
Q                      &Queue:FileDropCombo           !Reference to browse queue type
                     END

FDB9                 CLASS(FileDropClass)                  ! File drop manager
Q                      &Queue:FileDrop                !Reference to display queue
                     END

CurCtrlFeq          LONG
FieldColorQueue     QUEUE
Feq                   LONG
OldColor              LONG
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
  CASE SELF.Request                                        ! Configure the action message text
  OF ViewRecord
    ActionMessage = 'View Record'
  OF InsertRecord
    ActionMessage = 'Record Will Be Added'
  OF ChangeRecord
    ActionMessage = 'Record Will Be Changed'
  END
  QuickWindow{PROP:Text} = ActionMessage                   ! Display status message in title bar
  PARENT.Ask


ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('UpdateOverboekPlanningVanuitVV')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Mut:DatumTijd_DATE:Prompt
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.HistoryKey = CtrlH
  SELF.AddHistoryFile(Mut:Record,History::Mut:Record)
  SELF.AddHistoryField(?Mut:DatumTijd_DATE,4)
  SELF.AddHistoryField(?Mut:DatumTijd_TIME,5)
  SELF.AddHistoryField(?Mut:InslagKG,8)
  SELF.AddHistoryField(?Mut:InslagPallet,9)
  SELF.AddUpdateFile(Access:Mutatie)
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  Relate:ACel.Open                                         ! File ACel used by this procedure, so make sure it's RelationManager is open
  Relate:ACelLocatie.Open                                  ! File ACelLocatie used by this procedure, so make sure it's RelationManager is open
  Relate:Mutatie.Open                                      ! File Mutatie used by this procedure, so make sure it's RelationManager is open
  Relate:Planning.SetOpenRelated()
  Relate:Planning.Open                                     ! File Planning used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Primary &= Relate:Mutatie
  IF SELF.Request = ViewRecord AND NOT SELF.BatchProcessing ! Setup actions for ViewOnly Mode
    SELF.InsertAction = Insert:None
    SELF.DeleteAction = Delete:None
    SELF.ChangeAction = Change:None
    SELF.CancelAction = Cancel:Cancel
    SELF.OkControl = 0
  ELSE
    SELF.ChangeAction = Change:Caller                      ! Changes allowed
    SELF.CancelAction = Cancel:Cancel+Cancel:Query         ! Confirm cancel
    SELF.OkControl = ?OK
    IF SELF.PrimeUpdate() THEN RETURN Level:Notify.
  END
  SELF.Open(QuickWindow)                                   ! Open window
   IF Self.Request=ChangeRecord 
  	Clear(PAR:Record)
  	Par:PartijID = Mut:PartijID
  	IF Access:Partij.TryFetch(Par:Partij_PK) = Level:Benign
  		Loc:ArtikelID = Par:ArtikelID
  		Loc:RelatieID = Par:Leverancier
  		Loc:VerpakkingsID = Par:VerpakkingID
  	ELSE
  		Loc:ArtikelID = 0
  		Loc:RelatieID = 0
  		Loc:VerpakkingsID = 0
  	.
  		
  	LOC:PlanningDatum = TODAY()
  	LOC:PlanningTijdstip = CLOCK()
  		
  	Loc:CelID = 0
  	Loc:KG = Mut:InslagKG
  	Loc:Pallets = Mut:InslagPallet
  ELSE
  	RETURN Level:Cancel
  END
  IF GLO:HidePlanningInstructie = 0 THEN
      HIDE(?LOC:Instructie)
      HIDE(?LOC:Instructie:Prompt)
  END
  WinAlertMouseZoom()
  Do DefineListboxStyle
  IF SELF.Request = ViewRecord                             ! Configure controls for View Only mode
    ?Mut:DatumTijd_DATE{PROP:ReadOnly} = True
    ?Mut:DatumTijd_TIME{PROP:ReadOnly} = True
    ?Art:ArtikelOms{PROP:ReadOnly} = True
    ?Ver:VerpakkingOmschrijving{PROP:ReadOnly} = True
    ?Rel:FirmaNaam{PROP:ReadOnly} = True
    ?CEL:CelOms{PROP:ReadOnly} = True
    DISABLE(?Loc:OverboekSoort)
    ?Mut:InslagKG{PROP:ReadOnly} = True
    ?Mut:InslagPallet{PROP:ReadOnly} = True
    ?LOC:PlanningDatum{PROP:ReadOnly} = True
    ?LOC:PlanningTijdstip{PROP:ReadOnly} = True
    ?Loc:KG{PROP:ReadOnly} = True
    ?Loc:Pallets{PROP:ReadOnly} = True
    DISABLE(?ACel:CelOms)
    DISABLE(?ACL:Locatienaam)
    ?LOC:Instructie{PROP:ReadOnly} = True
    ?Loc:Transport{PROP:ReadOnly} = True
    ?CL:Locatienaam{PROP:ReadOnly} = True
  END
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('UpdateOverboekPlanningVanuitVV',QuickWindow) ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  FDCB7.Init(ACel:CelOms,?ACel:CelOms,Queue:FileDropCombo.ViewPosition,FDCB7::View:FileDropCombo,Queue:FileDropCombo,Relate:ACel,ThisWindow,GlobalErrors,0,1,0)
  FDCB7.Q &= Queue:FileDropCombo
  FDCB7.AddSortOrder(ACel:CEL_PK)
  FDCB7.AddField(ACel:CelOms,FDCB7.Q.ACel:CelOms) !List box control field - type derived from field
  FDCB7.AddField(ACel:CelID,FDCB7.Q.ACel:CelID) !Primary key field - type derived from field
  FDCB7.AddUpdateField(ACel:CelID,Loc:CelID)
  ThisWindow.AddItem(FDCB7.WindowComponent)
  FDCB7.DefaultFill = 0
  FDB9.Init(?ACL:Locatienaam,Queue:FileDrop.ViewPosition,FDB9::View:FileDrop,Queue:FileDrop,Relate:ACelLocatie,ThisWindow)
  FDB9.Q &= Queue:FileDrop
  FDB9.AddSortOrder(ACL:FK_CelLocatie)
  FDB9.AddRange(ACL:CelID,ACel:CelID)
  FDB9.AddField(ACL:Locatienaam,FDB9.Q.ACL:Locatienaam) !List box control field - type derived from field
  FDB9.AddField(ACL:CelLocatieID,FDB9.Q.ACL:CelLocatieID) !Primary key field - type derived from field
  FDB9.AddUpdateField(ACL:CelLocatieID,Loc:CelLokatieID)
  ThisWindow.AddItem(FDB9.WindowComponent)
  FDB9.DefaultFill = 0
  SELF.SetAlerts()
  EnterByTabManager.ExcludeControl(?Cancel)
  EnterByTabManager.ExcludeControl(?OK)
  EnterByTabManager.Init(False)
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:ACel.Close
    Relate:ACelLocatie.Close
    Relate:Mutatie.Close
    Relate:Planning.Close
  END
  IF SELF.Opened
    INIMgr.Update('UpdateOverboekPlanningVanuitVV',QuickWindow) ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.PrimeUpdate PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.PrimeUpdate()
    If returnValue = Level:Fatal  ! delete just occured
      ThisNetRefresh.Send('|Mutatie|ACel|ACelLocatie|') ! NetTalk (NetRefresh)
    End
  RETURN ReturnValue


ThisWindow.Reset PROCEDURE(BYTE Force=0)

  CODE
  SELF.ForcedReset += Force
  IF QuickWindow{Prop:AcceptAll} THEN RETURN.
  Par:PartijID = Mut:PartijID                              ! Assign linking field value
  Access:Partij.Fetch(Par:Partij_PK)
  Ver:VerpakkingID = Par:VerpakkingID                      ! Assign linking field value
  Access:Verpakking.Fetch(Ver:Verpakking_PK)
  Rel:RelatieID = Par:Leverancier                          ! Assign linking field value
  Access:Relatie.Fetch(Rel:Relatie_PK)
  Art:ArtikelID = Par:ArtikelID                            ! Assign linking field value
  Access:ViewArtikel.Fetch(Art:Artikel_PK)
  CEL:CelID = Mut:CelID                                    ! Assign linking field value
  Access:Cel.Fetch(CEL:CEL_PK)
  CL:CelLocatieID = Mut:CelLocatieID                       ! Assign linking field value
  Access:CelLocatie.Fetch(CL:PK_CelLocatie)
  PARENT.Reset(Force)


ThisWindow.Run PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Run()
  IF SELF.Request = ViewRecord                             ! In View Only mode always signal RequestCancelled
    ReturnValue = RequestCancelled
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
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?OK
      ThisWindow.Update()
      IF SELF.Request = ViewRecord AND NOT SELF.BatchProcessing THEN
         POST(EVENT:CloseWindow)
      END
    END
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue


ThisWindow.TakeCompleted PROCEDURE

ReturnValue          BYTE,AUTO

Looped BYTE
  CODE
  LOOP
    IF Looped
      RETURN Level:Notify
    ELSE
      Looped = 1
    END
  	IF LOC:CelID = 0 THEN
  		SELECT(?ACel:CelOms)
  		RETURN ReturnValue
  	.
  	
  		
  ReturnValue = PARENT.TakeCompleted()
  	CLEAR(Pla:Record)
  	Pla:ArtikelID = Par:ArtikelID
  	Pla:PartijID=Mut:PartijID
  	Pla:KG=Loc:KG
  	Pla:Pallets =Loc:Pallets 
  	Pla:Planning_DATE=Loc:PlanningDatum
  	Pla:Planning_TIME=Loc:PlanningTijdstip
      Pla:CelID=Mut:CelID
      Pla:CelLocatieID=Mut:CelLocatieID
      Pla:OverboekingCelID=Loc:CelID
      Pla:OverboekCelLocatieID=Loc:CelLokatieID
  	Pla:Verwerkt=false
  	Pla:Leverancier=Par:Leverancier
  	Pla:Instructie=LOC:Instructie
  	Pla:Transport=Loc:Transport
  	Pla:Memo=Loc:Memo
  
      Pla:OverboekSoort=Loc:OverboekSoort
      Pla:NieuwKG=Loc:KG
      Pla:NieuwPallets=Loc:Pallets
  
  	IF NOT(Access:Planning.TryInsert() = Level:Benign)
  		IF ERRORCODE() = 90 THEN
  			MESSAGE('Overboeking record kon niet worden aangemaakt | SQL Error('&FILEERRORCODE()&'):'&FILEERROR()&')')
  		ELSE
  			MESSAGE('Overboeking record kon niet worden aangemaakt | Error('&ERRORCODE()&'):'&ERROR()&')')
  		.
  	.
    ThisNetRefresh.Send('|Mutatie|ACel|ACelLocatie|') ! NetTalk (NetRefresh)
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


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window

!!! <summary>
!!! Generated from procedure template - Window
!!! Form Mutatie
!!! </summary>
UpdateEUitslagMutatie PROCEDURE 

CurrentTab           STRING(80)                            ! 
ActionMessage        CSTRING(40)                           ! 
FDCB8::View:FileDropCombo VIEW(Cel)
                       PROJECT(CEL:CelOms)
                       PROJECT(CEL:CelID)
                     END
Queue:FileDropCombo  QUEUE                            !
CEL:CelOms             LIKE(CEL:CelOms)               !List box control field - type derived from field
CEL:CelID              LIKE(CEL:CelID)                !Primary key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
LocEnableEnterByTab  BYTE(1)                               !Used by the ENTER Instead of Tab template
EnterByTabManager    EnterByTabClass
History::Mut:Record  LIKE(Mut:RECORD),THREAD
QuickWindow          WINDOW('Form Mutatie'),AT(,,249,93),FONT('MS Sans Serif',8,,FONT:regular,CHARSET:DEFAULT), |
  RESIZE,CENTER,GRAY,IMM,MDI,HLP('UpdateEUitslagMutatie'),SYSTEM
                       BUTTON('&OK'),AT(136,68,49,14),USE(?OK),LEFT,ICON('WAOK.ICO'),DEFAULT,FLAT,MSG('Accept dat' & |
  'a and close the window'),TIP('Accept data and close the window')
                       BUTTON('&Cancel'),AT(189,68,49,14),USE(?Cancel),LEFT,ICON('WACANCEL.ICO'),FLAT,MSG('Cancel operation'), |
  TIP('Cancel operation')
                       ENTRY(@s39),AT(77,54,160,10),USE(Mut:RedenAfboeking)
                       PROMPT('Reden Afboeking:'),AT(9,54),USE(?Mut:RedenAfboeking:Prompt),TRN
                       ENTRY(@n12`2),AT(76,9,64,10),USE(Mut:UitslagKG),RIGHT
                       PROMPT('Uitslag KG:'),AT(9,9),USE(?Mut:UitslagKG:Prompt),TRN
                       ENTRY(@n14.),AT(76,24,64,10),USE(Mut:UitslagPallet),RIGHT
                       PROMPT('Uitslag Pallet:'),AT(9,24),USE(?Mut:UitslagPallet:Prompt),TRN
                       PROMPT('Cel:'),AT(9,38),USE(?PROMPT1)
                       COMBO(@s50),AT(77,39,160,10),USE(CEL:CelOms),DROP(5),FORMAT('200L(2)|M~Omschrijving~@s50@'), |
  FROM(Queue:FileDropCombo),IMM
                     END

    omit('***',WE::CantCloseNowSetHereDone=1)  !Getting Nested omit compile error, then uncheck the "Check for duplicate CantCloseNowSetHere variable declaration" in the WinEvent local template
WE::CantCloseNowSetHereDone equate(1)
WE::CantCloseNowSetHere     long
    !***
ThisWindow           CLASS(WindowManager)
Ask                    PROCEDURE(),DERIVED
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
PrimeUpdate            PROCEDURE(),BYTE,PROC,DERIVED
Run                    PROCEDURE(),BYTE,PROC,DERIVED
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED
TakeCompleted          PROCEDURE(),BYTE,PROC,DERIVED
TakeEvent              PROCEDURE(),BYTE,PROC,DERIVED
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
FDCB8                CLASS(FileDropComboClass)             ! File drop combo manager
Q                      &Queue:FileDropCombo           !Reference to browse queue type
                     END

Resizer              CLASS(WindowResizeClass)
Init                   PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)
                     END

CurCtrlFeq          LONG
FieldColorQueue     QUEUE
Feq                   LONG
OldColor              LONG
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
  CASE SELF.Request                                        ! Configure the action message text
  OF ViewRecord
    ActionMessage = 'View Record'
  OF InsertRecord
    ActionMessage = 'Record Will Be Added'
  OF ChangeRecord
    ActionMessage = 'Record Will Be Changed'
  END
  QuickWindow{PROP:Text} = ActionMessage                   ! Display status message in title bar
  PARENT.Ask


ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('UpdateEUitslagMutatie')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?OK
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.HistoryKey = CtrlH
  SELF.AddHistoryFile(Mut:Record,History::Mut:Record)
  SELF.AddHistoryField(?Mut:RedenAfboeking,15)
  SELF.AddHistoryField(?Mut:UitslagKG,10)
  SELF.AddHistoryField(?Mut:UitslagPallet,11)
  SELF.AddUpdateFile(Access:Mutatie)
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  Relate:Cel.SetOpenRelated()
  Relate:Cel.Open                                          ! File Cel used by this procedure, so make sure it's RelationManager is open
  Relate:Mutatie.Open                                      ! File Mutatie used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Primary &= Relate:Mutatie
  IF SELF.Request = ViewRecord AND NOT SELF.BatchProcessing ! Setup actions for ViewOnly Mode
    SELF.InsertAction = Insert:None
    SELF.DeleteAction = Delete:None
    SELF.ChangeAction = Change:None
    SELF.CancelAction = Cancel:Cancel
    SELF.OkControl = 0
  ELSE
    SELF.ChangeAction = Change:Caller                      ! Changes allowed
    SELF.CancelAction = Cancel:Cancel+Cancel:Query         ! Confirm cancel
    SELF.OkControl = ?OK
    IF SELF.PrimeUpdate() THEN RETURN Level:Notify.
  END
  SELF.Open(QuickWindow)                                   ! Open window
  WinAlertMouseZoom()
  Do DefineListboxStyle
  IF SELF.Request = ViewRecord                             ! Configure controls for View Only mode
    ?Mut:RedenAfboeking{PROP:ReadOnly} = True
    ?Mut:UitslagKG{PROP:ReadOnly} = True
    ?Mut:UitslagPallet{PROP:ReadOnly} = True
    DISABLE(?CEL:CelOms)
  END
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('UpdateEUitslagMutatie',QuickWindow)        ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  FDCB8.Init(CEL:CelOms,?CEL:CelOms,Queue:FileDropCombo.ViewPosition,FDCB8::View:FileDropCombo,Queue:FileDropCombo,Relate:Cel,ThisWindow,GlobalErrors,0,1,0)
  FDCB8.Q &= Queue:FileDropCombo
  FDCB8.AddSortOrder(CEL:CEL_PK)
  FDCB8.AddField(CEL:CelOms,FDCB8.Q.CEL:CelOms) !List box control field - type derived from field
  FDCB8.AddField(CEL:CelID,FDCB8.Q.CEL:CelID) !Primary key field - type derived from field
  FDCB8.AddUpdateField(CEL:CelID,Mut:CelID)
  ThisWindow.AddItem(FDCB8.WindowComponent)
  FDCB8.DefaultFill = 0
  SELF.SetAlerts()
  EnterByTabManager.ExcludeControl(?Cancel)
  EnterByTabManager.ExcludeControl(?OK)
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
  END
  IF SELF.Opened
    INIMgr.Update('UpdateEUitslagMutatie',QuickWindow)     ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.PrimeUpdate PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.PrimeUpdate()
    If returnValue = Level:Fatal  ! delete just occured
      ThisNetRefresh.Send('|Mutatie|Cel|') ! NetTalk (NetRefresh)
    End
  RETURN ReturnValue


ThisWindow.Run PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Run()
  IF SELF.Request = ViewRecord                             ! In View Only mode always signal RequestCancelled
    ReturnValue = RequestCancelled
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
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?OK
      ThisWindow.Update()
      IF SELF.Request = ViewRecord AND NOT SELF.BatchProcessing THEN
         POST(EVENT:CloseWindow)
      END
    END
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue


ThisWindow.TakeCompleted PROCEDURE

ReturnValue          BYTE,AUTO

Looped BYTE
  CODE
  LOOP
    IF Looped
      RETURN Level:Notify
    ELSE
      Looped = 1
    END
  ReturnValue = PARENT.TakeCompleted()
    ThisNetRefresh.Send('|Mutatie|Cel|') ! NetTalk (NetRefresh)
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


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window

!!! <summary>
!!! Generated from procedure template - Window
!!! Form Mutatie
!!! </summary>
UpdateEInslagMutatie PROCEDURE 

CurrentTab           STRING(80)                            ! 
ActionMessage        CSTRING(40)                           ! 
FDCB8::View:FileDropCombo VIEW(Cel)
                       PROJECT(CEL:CelOms)
                       PROJECT(CEL:CelID)
                     END
Queue:FileDropCombo  QUEUE                            !
CEL:CelOms             LIKE(CEL:CelOms)               !List box control field - type derived from field
CEL:CelID              LIKE(CEL:CelID)                !Primary key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
LocEnableEnterByTab  BYTE(1)                               !Used by the ENTER Instead of Tab template
EnterByTabManager    EnterByTabClass
History::Mut:Record  LIKE(Mut:RECORD),THREAD
QuickWindow          WINDOW('Form Mutatie'),AT(,,249,93),FONT('MS Sans Serif',8,,FONT:regular,CHARSET:DEFAULT), |
  RESIZE,CENTER,GRAY,IMM,MDI,HLP('UpdateEUitslagMutatie'),SYSTEM
                       BUTTON('&OK'),AT(136,68,49,14),USE(?OK),LEFT,ICON('WAOK.ICO'),DEFAULT,FLAT,MSG('Accept dat' & |
  'a and close the window'),TIP('Accept data and close the window')
                       BUTTON('&Cancel'),AT(189,68,49,14),USE(?Cancel),LEFT,ICON('WACANCEL.ICO'),FLAT,MSG('Cancel operation'), |
  TIP('Cancel operation')
                       ENTRY(@n12`2),AT(76,9,64,10),USE(Mut:InslagKG),RIGHT
                       PROMPT('Inslag KG:'),AT(9,9),USE(?Mut:UitslagKG:Prompt),TRN
                       ENTRY(@n14.),AT(76,24,64,10),USE(Mut:InslagPallet),RIGHT
                       PROMPT('Inslag Pallet:'),AT(9,24),USE(?Mut:UitslagPallet:Prompt),TRN
                       PROMPT('Cel:'),AT(9,38),USE(?PROMPT1)
                       COMBO(@s50),AT(77,39,160,10),USE(CEL:CelOms),DROP(5),FORMAT('200L(2)|M~Omschrijving~@s50@'), |
  FROM(Queue:FileDropCombo),IMM
                     END

    omit('***',WE::CantCloseNowSetHereDone=1)  !Getting Nested omit compile error, then uncheck the "Check for duplicate CantCloseNowSetHere variable declaration" in the WinEvent local template
WE::CantCloseNowSetHereDone equate(1)
WE::CantCloseNowSetHere     long
    !***
ThisWindow           CLASS(WindowManager)
Ask                    PROCEDURE(),DERIVED
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
PrimeUpdate            PROCEDURE(),BYTE,PROC,DERIVED
Run                    PROCEDURE(),BYTE,PROC,DERIVED
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED
TakeCompleted          PROCEDURE(),BYTE,PROC,DERIVED
TakeEvent              PROCEDURE(),BYTE,PROC,DERIVED
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
FDCB8                CLASS(FileDropComboClass)             ! File drop combo manager
Q                      &Queue:FileDropCombo           !Reference to browse queue type
                     END

Resizer              CLASS(WindowResizeClass)
Init                   PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)
                     END

CurCtrlFeq          LONG
FieldColorQueue     QUEUE
Feq                   LONG
OldColor              LONG
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
  CASE SELF.Request                                        ! Configure the action message text
  OF ViewRecord
    ActionMessage = 'View Record'
  OF InsertRecord
    ActionMessage = 'Record Will Be Added'
  OF ChangeRecord
    ActionMessage = 'Record Will Be Changed'
  END
  QuickWindow{PROP:Text} = ActionMessage                   ! Display status message in title bar
  PARENT.Ask


ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('UpdateEInslagMutatie')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?OK
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.HistoryKey = CtrlH
  SELF.AddHistoryFile(Mut:Record,History::Mut:Record)
  SELF.AddHistoryField(?Mut:InslagKG,8)
  SELF.AddHistoryField(?Mut:InslagPallet,9)
  SELF.AddUpdateFile(Access:Mutatie)
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  Relate:Cel.SetOpenRelated()
  Relate:Cel.Open                                          ! File Cel used by this procedure, so make sure it's RelationManager is open
  Relate:Mutatie.Open                                      ! File Mutatie used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Primary &= Relate:Mutatie
  IF SELF.Request = ViewRecord AND NOT SELF.BatchProcessing ! Setup actions for ViewOnly Mode
    SELF.InsertAction = Insert:None
    SELF.DeleteAction = Delete:None
    SELF.ChangeAction = Change:None
    SELF.CancelAction = Cancel:Cancel
    SELF.OkControl = 0
  ELSE
    SELF.ChangeAction = Change:Caller                      ! Changes allowed
    SELF.CancelAction = Cancel:Cancel+Cancel:Query         ! Confirm cancel
    SELF.OkControl = ?OK
    IF SELF.PrimeUpdate() THEN RETURN Level:Notify.
  END
  SELF.Open(QuickWindow)                                   ! Open window
  WinAlertMouseZoom()
  Do DefineListboxStyle
  IF SELF.Request = ViewRecord                             ! Configure controls for View Only mode
    ?Mut:InslagKG{PROP:ReadOnly} = True
    ?Mut:InslagPallet{PROP:ReadOnly} = True
    DISABLE(?CEL:CelOms)
  END
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('UpdateEInslagMutatie',QuickWindow)         ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  FDCB8.Init(CEL:CelOms,?CEL:CelOms,Queue:FileDropCombo.ViewPosition,FDCB8::View:FileDropCombo,Queue:FileDropCombo,Relate:Cel,ThisWindow,GlobalErrors,0,1,0)
  FDCB8.Q &= Queue:FileDropCombo
  FDCB8.AddSortOrder(CEL:CEL_PK)
  FDCB8.AddField(CEL:CelOms,FDCB8.Q.CEL:CelOms) !List box control field - type derived from field
  FDCB8.AddField(CEL:CelID,FDCB8.Q.CEL:CelID) !Primary key field - type derived from field
  FDCB8.AddUpdateField(CEL:CelID,Mut:CelID)
  ThisWindow.AddItem(FDCB8.WindowComponent)
  FDCB8.DefaultFill = 0
  SELF.SetAlerts()
  EnterByTabManager.ExcludeControl(?Cancel)
  EnterByTabManager.ExcludeControl(?OK)
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
  END
  IF SELF.Opened
    INIMgr.Update('UpdateEInslagMutatie',QuickWindow)      ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.PrimeUpdate PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.PrimeUpdate()
    If returnValue = Level:Fatal  ! delete just occured
      ThisNetRefresh.Send('|Mutatie|Cel|') ! NetTalk (NetRefresh)
    End
  RETURN ReturnValue


ThisWindow.Run PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Run()
  IF SELF.Request = ViewRecord                             ! In View Only mode always signal RequestCancelled
    ReturnValue = RequestCancelled
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
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?OK
      ThisWindow.Update()
      IF SELF.Request = ViewRecord AND NOT SELF.BatchProcessing THEN
         POST(EVENT:CloseWindow)
      END
    END
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue


ThisWindow.TakeCompleted PROCEDURE

ReturnValue          BYTE,AUTO

Looped BYTE
  CODE
  LOOP
    IF Looped
      RETURN Level:Notify
    ELSE
      Looped = 1
    END
  ReturnValue = PARENT.TakeCompleted()
    ThisNetRefresh.Send('|Mutatie|Cel|') ! NetTalk (NetRefresh)
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


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window

!!! <summary>
!!! Generated from procedure template - Window
!!! Browse the Verkoop file
!!! </summary>
BrowseVerkoop PROCEDURE 

Loc:Leverancier      LONG                                  ! 
Loc:Leverancier2     LONG                                  ! 
Loc:Leverancier3     LONG                                  ! 
LOC:NietVerwerkt     BYTE                                  ! 
CurrentTab           STRING(80)                            ! 
Loc:DatumLeeg        DATE                                  ! 
LOC:Verwerkt         BYTE                                  ! 
LOC:Artikelen        STRING(300)                           ! 
Loc:Firmanaam        CSTRING(51)                           ! 
Loc:Firmanaam2       STRING(250)                           ! 
LOC:Datum            DATE                                  ! 
LOC:Tijdstip         TIME                                  ! 
LOC:CurrentKlant     LONG                                  ! 
LOC:TimingMeting     LONG,DIM(10)                          ! 
Loc:True             BYTE                                  ! 
Loc:ExportBestand    CSTRING(256)                          ! 
BRW1::View:Browse    VIEW(Verkoop)
                       PROJECT(Ver2:VerkoopID)
                       PROJECT(Ver2:Planning_DATE)
                       PROJECT(Ver2:Planning_TIME)
                       PROJECT(Ver2:Verwerkt)
                       PROJECT(Ver2:Klant)
                       PROJECT(Ver2:Exported)
                       PROJECT(Ver2:Planning)
                       JOIN(AAARel:Relatie_PK,Ver2:Klant)
                         PROJECT(AAARel:FirmaNaam)
                         PROJECT(AAARel:RelatieID)
                       END
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
Ver2:VerkoopID         LIKE(Ver2:VerkoopID)           !List box control field - type derived from field
Ver2:VerkoopID_NormalFG LONG                          !Normal forground color
Ver2:VerkoopID_NormalBG LONG                          !Normal background color
Ver2:VerkoopID_SelectedFG LONG                        !Selected forground color
Ver2:VerkoopID_SelectedBG LONG                        !Selected background color
AAARel:FirmaNaam       LIKE(AAARel:FirmaNaam)         !List box control field - type derived from field
AAARel:FirmaNaam_NormalFG LONG                        !Normal forground color
AAARel:FirmaNaam_NormalBG LONG                        !Normal background color
AAARel:FirmaNaam_SelectedFG LONG                      !Selected forground color
AAARel:FirmaNaam_SelectedBG LONG                      !Selected background color
Ver2:Planning_DATE     LIKE(Ver2:Planning_DATE)       !List box control field - type derived from field
Ver2:Planning_DATE_NormalFG LONG                      !Normal forground color
Ver2:Planning_DATE_NormalBG LONG                      !Normal background color
Ver2:Planning_DATE_SelectedFG LONG                    !Selected forground color
Ver2:Planning_DATE_SelectedBG LONG                    !Selected background color
Ver2:Planning_TIME     LIKE(Ver2:Planning_TIME)       !List box control field - type derived from field
Ver2:Planning_TIME_NormalFG LONG                      !Normal forground color
Ver2:Planning_TIME_NormalBG LONG                      !Normal background color
Ver2:Planning_TIME_SelectedFG LONG                    !Selected forground color
Ver2:Planning_TIME_SelectedBG LONG                    !Selected background color
Ver2:Verwerkt          LIKE(Ver2:Verwerkt)            !List box control field - type derived from field
Ver2:Verwerkt_NormalFG LONG                           !Normal forground color
Ver2:Verwerkt_NormalBG LONG                           !Normal background color
Ver2:Verwerkt_SelectedFG LONG                         !Selected forground color
Ver2:Verwerkt_SelectedBG LONG                         !Selected background color
Ver2:Verwerkt_Icon     LONG                           !Entry's icon ID
LOC:Artikelen          LIKE(LOC:Artikelen)            !List box control field - type derived from local data
LOC:Artikelen_NormalFG LONG                           !Normal forground color
LOC:Artikelen_NormalBG LONG                           !Normal background color
LOC:Artikelen_SelectedFG LONG                         !Selected forground color
LOC:Artikelen_SelectedBG LONG                         !Selected background color
Ver2:Klant             LIKE(Ver2:Klant)               !Browse hot field - type derived from field
Ver2:Exported          LIKE(Ver2:Exported)            !Browse hot field - type derived from field
Ver2:Planning          LIKE(Ver2:Planning)            !Browse key field - type derived from field
AAARel:RelatieID       LIKE(AAARel:RelatieID)         !Related join file key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
FDCB5::View:FileDropCombo VIEW(Relatie)
                       PROJECT(Rel:FirmaNaam)
                       PROJECT(Rel:Type)
                     END
FDCB2::View:FileDropCombo VIEW(AARelatie)
                       PROJECT(AARel:FirmaNaam)
                       PROJECT(AARel:RelatieID)
                       PROJECT(AARel:Type)
                     END
FDCB9::View:FileDropCombo VIEW(ARelatie)
                       PROJECT(AREL:FirmaNaam)
                       PROJECT(AREL:Type)
                     END
Queue:FileDropCombo  QUEUE                            !
Rel:FirmaNaam          LIKE(Rel:FirmaNaam)            !Browse hot field - type derived from field
Rel:Type               LIKE(Rel:Type)                 !Browse hot field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
Queue:FileDropCombo:1 QUEUE                           !
AARel:FirmaNaam        LIKE(AARel:FirmaNaam)          !List box control field - type derived from field
AARel:RelatieID        LIKE(AARel:RelatieID)          !Browse hot field - type derived from field
AARel:Type             LIKE(AARel:Type)               !Browse hot field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
Queue:FileDropCombo:2 QUEUE                           !
AREL:FirmaNaam         LIKE(AREL:FirmaNaam)           !List box control field - type derived from field
AREL:Type              LIKE(AREL:Type)                !Browse hot field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
LocEnableEnterByTab  BYTE(1)                               !Used by the ENTER Instead of Tab template
EnterByTabManager    EnterByTabClass
NetLocalRefreshDate     Long     ! NetTalk (NetRefresh)
NetLocalRefreshTime     Long
NetLocalDependancies    String('|Verkoop|AAARelatie|Relatie|AARelatie|ARelatie|')
QuickWindow          WINDOW('Verkoop'),AT(,,667,217),FONT('MS Sans Serif',8,,,CHARSET:DEFAULT),RESIZE,MAXIMIZE, |
  CENTER,GRAY,IMM,MAX,MDI,HLP('BrowseInkoop'),SYSTEM
                       LIST,AT(11,58,652,128),USE(?Browse:1),HVSCROLL,FORMAT('45R(2)|*~Verkoop-ID~C(0)@n_10@20' & |
  '0L(2)|M*~Afnemer~C(0)@s50@[50L(2)|M*@d6-b@40L(2)|M*@t7b@]|~Tijdstip~37C|*I~Verwerkt~' & |
  '@p p@1020L(2)|*~Artikelen~C(0)@s255@'),FROM(Queue:Browse:1),IMM,MSG('Browsing the Inkoop file')
                       BUTTON('Rapport'),AT(198,39),USE(?SJABLOON)
                       BUTTON('Kopieer'),AT(335,39),USE(?KOPIEER)
                       BUTTON('&Invoegen'),AT(9,39,58,14),USE(?Insert:3),LEFT,ICON('WAINSERT.ICO'),FLAT,MSG('Insert a Record'), |
  TIP('Insert a Record')
                       BUTTON('&Wijzigen'),AT(75,39,53,14),USE(?Change:3),LEFT,ICON('WACHANGE.ICO'),DEFAULT,FLAT, |
  MSG('Change the Record'),TIP('Change the Record')
                       BUTTON('&Verwijderen'),AT(132,39,62,14),USE(?Delete:3),LEFT,ICON('WADELETE.ICO'),FLAT,MSG('Delete the Record'), |
  TIP('Delete the Record')
                       SHEET,AT(4,4,661,192),USE(?CurrentTab)
                         TAB('&1) Onverwerkte verkopen'),USE(?Tab:2)
                         END
                         TAB('&2) Onverwerkte verkopen (zonder datum)'),USE(?TAB4)
                         END
                         TAB('&3) Onverwerkte verkopen gesorteerd op planning'),USE(?Tab:3)
                         END
                         TAB('&4) Onverwerkte verkopen per klant'),USE(?TAB1)
                           COMBO(@s50),AT(377,39,163,12),USE(Rel:FirmaNaam),DROP(25),FORMAT('200L(2)|M~Firmanaam~C(0)@s50@'), |
  FROM(Queue:FileDropCombo),IMM
                           BUTTON('...'),AT(544,39,28,14),USE(?BUTTON2)
                         END
                         TAB('&5) Verwerkte verkopen'),USE(?TAB2)
                         END
                         TAB('&6) Verwerkte verkopen per klant'),USE(?TAB3)
                           COMBO(@s50),AT(379,39,157,13),USE(AARel:FirmaNaam),DROP(25),FORMAT('200L(2)|M~Firma Naa' & |
  'm~L(0)@s50@'),FROM(Queue:FileDropCombo:1),IMM
                           BUTTON('...'),AT(539,38),USE(?BUTTON3)
                         END
                         TAB('&7) Gefactureerde verkopen'),USE(?TAB5)
                         END
                         TAB('&8) Gefactureerde verkopen per klant'),USE(?TAB6)
                           COMBO(@s50),AT(292,39,223,13),USE(AREL:FirmaNaam),DROP(25),FORMAT('200L(2)|M~Firma Naam' & |
  '~L(0)@s50@'),FROM(Queue:FileDropCombo:2),IMM
                         END
                       END
                       BUTTON('&Sluiten'),AT(614,201,49,14),USE(?Close),LEFT,ICON('WACLOSE.ICO'),FLAT,MSG('Close Window'), |
  TIP('Close Window')
                       BUTTON('Weeglijst'),AT(5,199,63),USE(?WeeglijstButton)
                       BUTTON('Weeglijst (Excel)'),AT(71,199,71),USE(?WeeglijstExcelButton)
                       BUTTON('Sjabloon'),AT(291,39,43,14),USE(?SJABLOON:2)
                       BUTTON('Ververs Scherm'),AT(522,201,81,14),USE(?RefreshButton),LEFT,ICON('REFRESH.ICO'),FLAT
                       BUTTON('Bevestiging'),AT(245,39,41,14),USE(?Bevestiging)
                       BUTTON('XML naar Exact'),AT(377,39,57,14),USE(?Xml)
                       BUTTON('Retour Rapport'),AT(429,39,64,14),USE(?RetourRapport)
                       BUTTON,AT(629,38,26,14),USE(?Terug),ICON(ICON:VCRback),TIP('Terug naar verwerkt')
                       BUTTON('Export naar Excel'),AT(145,198,71,15),USE(?Export)
                       BUTTON('XML naar Exact Invoice'),AT(219,199,83,14),USE(?XmlInvoice)
                       BUTTON('PackLijst'),AT(307,199),USE(?PackLijst)
                       BUTTON('PackLijst gegevens'),AT(355,199),USE(?ExportData)
                     END

    omit('***',WE::CantCloseNowSetHereDone=1)  !Getting Nested omit compile error, then uncheck the "Check for duplicate CantCloseNowSetHere variable declaration" in the WinEvent local template
WE::CantCloseNowSetHereDone equate(1)
WE::CantCloseNowSetHere     long
    !***
ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
Reset                  PROCEDURE(BYTE Force=0),DERIVED
Run                    PROCEDURE(USHORT Number,BYTE Request),BYTE,PROC,DERIVED
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED
TakeEvent              PROCEDURE(),BYTE,PROC,DERIVED
TakeFieldEvent         PROCEDURE(),BYTE,PROC,DERIVED
TakeNewSelection       PROCEDURE(),BYTE,PROC,DERIVED
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
BRW1                 CLASS(BrowseClass)                    ! Browse using ?Browse:1
Q                      &Queue:Browse:1                !Reference to browse queue
ApplyRange             PROCEDURE(),BYTE,PROC,DERIVED
Ask                    PROCEDURE(BYTE Request),BYTE,PROC,DERIVED
Fetch                  PROCEDURE(BYTE Direction),DERIVED
Init                   PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)
NotifyUpdateError      PROCEDURE(),BYTE,DERIVED
ResetQueue             PROCEDURE(BYTE ResetMode),DERIVED
ResetSort              PROCEDURE(BYTE Force),BYTE,PROC,DERIVED
SetQueueRecord         PROCEDURE(),DERIVED
ValidateRecord         PROCEDURE(),BYTE,DERIVED
                     END

BRW1::Sort5:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 2
BRW1::Sort6:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 7
BRW1::Sort7:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 8
Resizer              CLASS(WindowResizeClass)
Init                   PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)
                     END

FDCB5                CLASS(FileDropComboClass)             ! File drop combo manager
Q                      &Queue:FileDropCombo           !Reference to browse queue type
SetQueueRecord         PROCEDURE(),DERIVED
                     END

FDCB2                CLASS(FileDropComboClass)             ! File drop combo manager
Q                      &Queue:FileDropCombo:1         !Reference to browse queue type
SetQueueRecord         PROCEDURE(),DERIVED
                     END

FDCB9                CLASS(FileDropComboClass)             ! File drop combo manager
Q                      &Queue:FileDropCombo:2         !Reference to browse queue type
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
VulCurrentKlant     ROUTINE
    db.DebugOut('VulCurrentKlant' & CHOICE(?CurrentTab) & ',' & LOC:CurrentKlant & ', ' & Loc:Leverancier & ',' & Loc:Leverancier2)
    
    IF CHOICE(?CurrentTab) = 4 THEN
        LOC:CurrentKlant = Loc:Leverancier
    ELSIF CHOICE(?CurrentTab) = 6 THEN
        LOC:CurrentKlant = Loc:Leverancier2
    ELSE
        LOC:CurrentKlant = 0
    END

ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('BrowseVerkoop')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  GLO:Verkoop_ThreadID = THREAD()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Browse:1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('LOC:NietVerwerkt',LOC:NietVerwerkt)                ! Added by: BrowseBox(ABC)
  BIND('LOC:Leverancier',LOC:Leverancier)                  ! Added by: BrowseBox(ABC)
  BIND('LOC:Verwerkt',LOC:Verwerkt)                        ! Added by: BrowseBox(ABC)
  BIND('LOC:Leverancier2',LOC:Leverancier2)                ! Added by: BrowseBox(ABC)
  BIND('Ver2:VerkoopID',Ver2:VerkoopID)                    ! Added by: BrowseBox(ABC)
  BIND('LOC:Artikelen',LOC:Artikelen)                      ! Added by: BrowseBox(ABC)
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  IF SELF.Request = SelectRecord
     SELF.AddItem(?Close,RequestCancelled)                 ! Add the close control to the window manger
  ELSE
     SELF.AddItem(?Close,RequestCompleted)                 ! Add the close control to the window manger
  END
  	LOC:NietVerwerkt = false
  	LOC:Verwerkt = true
  Loc:True = true
  Loc:ExportBestand=GETINI('Exact','ExportBestand','','.\Voorraad.ini')
  Relate:AAARelatie.Open                                   ! File AAARelatie used by this procedure, so make sure it's RelationManager is open
  Relate:AARelatie.Open                                    ! File AARelatie used by this procedure, so make sure it's RelationManager is open
  Relate:APlanning.Open                                    ! File APlanning used by this procedure, so make sure it's RelationManager is open
  Relate:ARelatie.Open                                     ! File ARelatie used by this procedure, so make sure it's RelationManager is open
  Relate:AVerkoop.Open                                     ! File AVerkoop used by this procedure, so make sure it's RelationManager is open
  Relate:Planning.SetOpenRelated()
  Relate:Planning.Open                                     ! File Planning used by this procedure, so make sure it's RelationManager is open
  Relate:ViewArtikel.Open                                  ! File ViewArtikel used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:Verkoop,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  WinAlertMouseZoom()
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1.FileLoaded = 1                                      ! This is a 'file loaded' browse
  BRW1.AddSortOrder(,Ver2:Verwerkt_PlanningD_K)            ! Add the sort order for Ver2:Verwerkt_PlanningD_K for sort order 1
  BRW1.AddLocator(BRW1::Sort5:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort5:Locator.Init(,Ver2:Verwerkt,1,BRW1)          ! Initialize the browse locator using  using key: Ver2:Verwerkt_PlanningD_K , Ver2:Verwerkt
  BRW1.SetFilter('(Ver2:Verwerkt = LOC:NietVerwerkt AND Ver2:Klant<<>0)') ! Apply filter expression to browse
  BRW1.AddSortOrder(,Ver2:Verwerkt_PlanningD_K)            ! Add the sort order for Ver2:Verwerkt_PlanningD_K for sort order 2
  BRW1.SetFilter('(Ver2:Verwerkt = LOC:NietVerwerkt AND Ver2:Planning_DATE > DATE(1,1,1900) AND Ver2:Klant<<>0)') ! Apply filter expression to browse
  BRW1.AddSortOrder(,Ver2:Verwerkt_VerkoopIDD_K)           ! Add the sort order for Ver2:Verwerkt_VerkoopIDD_K for sort order 3
  BRW1.SetFilter('(Ver2:Verwerkt = LOC:NietVerwerkt AND Ver2:Klant=LOC:Leverancier)') ! Apply filter expression to browse
  BRW1.AddResetField(Loc:Leverancier)                      ! Apply the reset field
  BRW1.AddSortOrder(,Ver2:Verwerkt_PlanningD_K)            ! Add the sort order for Ver2:Verwerkt_PlanningD_K for sort order 4
  BRW1.SetFilter('(Ver2:Verwerkt = LOC:Verwerkt AND (NULL(Ver2:Exported) OR Ver2:Exported=0) AND Ver2:Klant<<>0)') ! Apply filter expression to browse
  BRW1.AddSortOrder(,Ver2:Verwerkt_PlanningD_K)            ! Add the sort order for Ver2:Verwerkt_PlanningD_K for sort order 5
  BRW1.SetFilter('(Ver2:Verwerkt = LOC:Verwerkt AND Ver2:Klant=LOC:Leverancier2 AND (NULL(Ver2:Exported)  OR Ver2:Exported=0))') ! Apply filter expression to browse
  BRW1.AddResetField(Loc:Leverancier2)                     ! Apply the reset field
  BRW1.AddSortOrder(,Ver2:Verkoop_FK2)                     ! Add the sort order for Ver2:Verkoop_FK2 for sort order 6
  BRW1.AddRange(Ver2:Exported,Loc:True)                    ! Add single value range limit for sort order 6
  BRW1.AddLocator(BRW1::Sort6:Locator)                     ! Browse has a locator for sort order 6
  BRW1::Sort6:Locator.Init(,Ver2:VerkoopID,,BRW1)          ! Initialize the browse locator using  using key: Ver2:Verkoop_FK2 , Ver2:VerkoopID
  BRW1.SetFilter('(Ver2:Klant<<>0)')                       ! Apply filter expression to browse
  BRW1.AddSortOrder(,Ver2:Verkoop_FK3)                     ! Add the sort order for Ver2:Verkoop_FK3 for sort order 7
  BRW1.AddRange(Ver2:Klant,Loc:Leverancier3)               ! Add single value range limit for sort order 7
  BRW1.AddLocator(BRW1::Sort7:Locator)                     ! Browse has a locator for sort order 7
  BRW1::Sort7:Locator.Init(,Ver2:VerkoopID,,BRW1)          ! Initialize the browse locator using  using key: Ver2:Verkoop_FK3 , Ver2:VerkoopID
  BRW1.AddSortOrder(,Ver2:Verwerkt_VerkoopIDD_K)           ! Add the sort order for Ver2:Verwerkt_VerkoopIDD_K for sort order 8
  BRW1.SetFilter('(Ver2:Verwerkt = LOC:NietVerwerkt AND Ver2:Klant<<>0)') ! Apply filter expression to browse
  ?Browse:1{PROP:IconList,1} = '~off.ico'
  ?Browse:1{PROP:IconList,2} = '~on.ico'
  BRW1.AddField(Ver2:VerkoopID,BRW1.Q.Ver2:VerkoopID)      ! Field Ver2:VerkoopID is a hot field or requires assignment from browse
  BRW1.AddField(AAARel:FirmaNaam,BRW1.Q.AAARel:FirmaNaam)  ! Field AAARel:FirmaNaam is a hot field or requires assignment from browse
  BRW1.AddField(Ver2:Planning_DATE,BRW1.Q.Ver2:Planning_DATE) ! Field Ver2:Planning_DATE is a hot field or requires assignment from browse
  BRW1.AddField(Ver2:Planning_TIME,BRW1.Q.Ver2:Planning_TIME) ! Field Ver2:Planning_TIME is a hot field or requires assignment from browse
  BRW1.AddField(Ver2:Verwerkt,BRW1.Q.Ver2:Verwerkt)        ! Field Ver2:Verwerkt is a hot field or requires assignment from browse
  BRW1.AddField(LOC:Artikelen,BRW1.Q.LOC:Artikelen)        ! Field LOC:Artikelen is a hot field or requires assignment from browse
  BRW1.AddField(Ver2:Klant,BRW1.Q.Ver2:Klant)              ! Field Ver2:Klant is a hot field or requires assignment from browse
  BRW1.AddField(Ver2:Exported,BRW1.Q.Ver2:Exported)        ! Field Ver2:Exported is a hot field or requires assignment from browse
  BRW1.AddField(Ver2:Planning,BRW1.Q.Ver2:Planning)        ! Field Ver2:Planning is a hot field or requires assignment from browse
  BRW1.AddField(AAARel:RelatieID,BRW1.Q.AAARel:RelatieID)  ! Field AAARel:RelatieID is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('BrowseVerkoop',QuickWindow)                ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  BRW1.AskProcedure = 1                                    ! Will call: UpdateVerkoop((LOC:CurrentKlant))
  FDCB5.Init(Rel:FirmaNaam,?Rel:FirmaNaam,Queue:FileDropCombo.ViewPosition,FDCB5::View:FileDropCombo,Queue:FileDropCombo,Relate:Relatie,ThisWindow,GlobalErrors,0,0,0)
  FDCB5.RemoveDuplicatesFlag = TRUE
  FDCB5.Q &= Queue:FileDropCombo
  FDCB5.AddSortOrder(Rel:Relatie_FK01)
  FDCB5.SetFilter('Rel:Type=''C''')
  FDCB5.AddField(Rel:FirmaNaam,FDCB5.Q.Rel:FirmaNaam) !Browse hot field - type derived from field
  FDCB5.AddField(Rel:Type,FDCB5.Q.Rel:Type) !Browse hot field - type derived from field
  FDCB5.AddUpdateField(Rel:RelatieID,Loc:Leverancier)
  ThisWindow.AddItem(FDCB5.WindowComponent)
  FDCB5.DefaultFill = 0
  FDCB2.Init(AARel:FirmaNaam,?AARel:FirmaNaam,Queue:FileDropCombo:1.ViewPosition,FDCB2::View:FileDropCombo,Queue:FileDropCombo:1,Relate:AARelatie,ThisWindow,GlobalErrors,0,0,0)
  FDCB2.Q &= Queue:FileDropCombo:1
  FDCB2.AddSortOrder(AARel:Relatie_FK01)
  FDCB2.SetFilter('AAREL:Type=''C''')
  FDCB2.AddField(AARel:FirmaNaam,FDCB2.Q.AARel:FirmaNaam) !List box control field - type derived from field
  FDCB2.AddField(AARel:RelatieID,FDCB2.Q.AARel:RelatieID) !Browse hot field - type derived from field
  FDCB2.AddField(AARel:Type,FDCB2.Q.AARel:Type) !Browse hot field - type derived from field
  FDCB2.AddUpdateField(AARel:RelatieID,Loc:Leverancier2)
  ThisWindow.AddItem(FDCB2.WindowComponent)
  FDCB2.DefaultFill = 0
  FDCB9.Init(AREL:FirmaNaam,?AREL:FirmaNaam,Queue:FileDropCombo:2.ViewPosition,FDCB9::View:FileDropCombo,Queue:FileDropCombo:2,Relate:ARelatie,ThisWindow,GlobalErrors,0,1,0)
  FDCB9.EntryCompletion = FALSE
  FDCB9.Q &= Queue:FileDropCombo:2
  FDCB9.AddSortOrder(AREL:Relatie_FK01)
  FDCB9.SetFilter('AREL:Type=''C''')
  FDCB9.AddField(AREL:FirmaNaam,FDCB9.Q.AREL:FirmaNaam) !List box control field - type derived from field
  FDCB9.AddField(AREL:Type,FDCB9.Q.AREL:Type) !Browse hot field - type derived from field
  FDCB9.AddUpdateField(AREL:RelatieID,Loc:Leverancier3)
  ThisWindow.AddItem(FDCB9.WindowComponent)
  FDCB9.DefaultFill = 0
  SELF.SetAlerts()
  NetLocalRefreshDate = today()         ! NetTalk (NetRefresh)
  NetLocalRefreshTime = clock()
  EnterByTabManager.Init(False)
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  GLO:Verkoop_ThreadID = 0
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:AAARelatie.Close
    Relate:AARelatie.Close
    Relate:APlanning.Close
    Relate:ARelatie.Close
    Relate:AVerkoop.Close
    Relate:Planning.Close
    Relate:ViewArtikel.Close
  END
  IF SELF.Opened
    INIMgr.Update('BrowseVerkoop',QuickWindow)             ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.Reset PROCEDURE(BYTE Force=0)

  CODE
  FREE(VerkoopArtikelQueue)
  SELF.ForcedReset += Force
  IF QuickWindow{Prop:AcceptAll} THEN RETURN.
    NetLocalRefreshDate = today()         ! NetTalk (NetRefresh)
    NetLocalRefreshTime = clock()
  PARENT.Reset(Force)


ThisWindow.Run PROCEDURE(USHORT Number,BYTE Request)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Run(Number,Request)
  IF SELF.Request = ViewRecord
    ReturnValue = RequestCancelled                         ! Always return RequestCancelled if the form was opened in ViewRecord mode
  ELSE
    GlobalRequest = Request
    UpdateVerkoop((LOC:CurrentKlant))
    ReturnValue = GlobalResponse
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
    OF ?SJABLOON
      ! Planningrecord inlezen
      Get(BRW1.Q,Choice(?Browse:1))
      Clear(Ver2:Record)
      Ver2:VerkoopID = BRW1.Q.Ver2:VerkoopID
      IF Access:Verkoop.TryFetch(Ver2:PK_Verkoop) <> Level:Benign THEN
      	RETURN ReturnValue
      END
      
      ReportVerkoop(Ver2:VerkoopID,FALSE)
    OF ?BUTTON2
      AREL:FirmaNaam=Rel:FirmaNaam
    OF ?BUTTON3
      AREL:FirmaNaam=AARel:FirmaNaam
    OF ?WeeglijstButton
      Get(BRW1.Q,Choice(?Browse:1))
      ReportWeeglijst('Verkoop', BRW1.Q.Ver2:VerkoopID)
    OF ?WeeglijstExcelButton
      Get(BRW1.Q,Choice(?Browse:1))
      ReportWeeglijstExcel('Verkoop', BRW1.Q.Ver2:VerkoopID)
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?KOPIEER
      ThisWindow.Update()
      ! Kopieren
      GLO:GebruikerLogHandelingOpmerking = 'Kopieren verkoop'
      
      Get(BRW1.Q,Choice(?Browse:1))
      AVe:VerkoopID = BRW1.Q.Ver2:VerkoopID
      IF Access:AVerkoop.TryFetch(AVe:PK_Verkoop) = Level:Benign
      	Access:Verkoop.PrimeRecord(false)
      	Ver2:Klant = AVE:Klant
      	!Ver2:Planning_DATE=today()
          !uitgeschakeld 18-4-2017
      	!Ver2:Planning_DATE=AVE:Planning_DATE
      	!Ver2:Planning_TIME=AVE:Planning_TIME
      	Ver2:Instructie=CLIP(AVe:Instructie)
      	Ver2:Transport=CLIP(AVe:Transport)
      	Ver2:ExtraKosten=AVE:ExtraKosten
      	Ver2:ExtraKostenTekst=CLIP(AVE:ExtraKostenTekst)
          Ver2:KlantAlternatiefAdres=AVe:KlantAlternatiefAdres
          Ver2:Verwerkt=FALSE
          Ver2:Exported=FALSE
          IF Access:Verkoop.TryInsert() = Level:Benign
      		CLEAR(APla:Record)
      		APla:VerkoopID = AVe:VerkoopID
      		SET(APla:Planning_FK02, APla:Planning_FK02)
      		LOOP
      			Access:APlanning.Next()
      			IF ERROR() THEN BREAK.
      			IF APla:VerkoopID <> AVe:VerkoopID THEN BREAK.
      			
      			Access:Planning.PrimeRecord(false)
      			Pla:VerkoopID = Ver2:VerkoopID
      			Pla:ArtikelID = CLIP(APla:ArtikelID)
      			Pla:PartijID = APla:PartijID
      			Pla:KG = APla:KG
      			Pla:Pallets = APla:Pallets
      			Pla:VerpakkingID = APla:VerpakkingID
      			Pla:CelID = APla:CelID
      			Pla:Memo = CLIP(APla:Memo)
      			Pla:Instructie = CLIP(APla:Instructie)
      			Pla:Transport = CLIP(APla:Transport)
      			Pla:InkoopKGPrijs = APla:InkoopKGPrijs
                  Pla:VerkoopKGPrijs = APla:VerkoopKGPrijs
                  APla:Geprint=FALSE
                  APla:Verwerkt=FALSE
                  
      			Access:Planning.TryInsert()
              .
      		Access:Verkoop.TryFetch(Ver2:PK_Verkoop)
      		verkoopid# = Ver2:VerkoopID
      		
      		GlobalRequest = ChangeRecord
      		UpdateVerkoop()
      		
      		IF GlobalResponse = RequestCancelled THEN
      !			CLEAR(Pla:Record)
      !			Pla:VerkoopID=verkoopid#
      !			SET(Pla:Planning_FK02, Pla:Planning_FK02)
      !			LOOP
      !				Access:Planning.Next()
      !				IF ERROR() THEN BREAK.
      !				IF Pla:VerkoopID <> verkoopid# THEN BREAK.
      !				
      !				!db.DebugOut('Verwijderen planning:' & Pla:PlanningID)
      !				Access:Planning.DeleteRecord(false)
      !			.
      			
      			CLEAR(Ver2:Record)
      			Ver2:VerkoopID = verkoopid#
                  Access:Verkoop.TryFetch(Ver2:PK_Verkoop)
                  Relate:Verkoop.Delete(false)
      			!Access:Verkoop.DeleteRecord(false)
      		ELSE
      			NetRefreshPlanningViews()
      			ThisWindow.Reset(1)
      			! DE NIEUWE REGEL SELECTEREN
      			LOOP I#=1 TO RECORDS(BRW1.q)
      				GET(BRW1.Q,I#)
      				IF BRW1.Q.Ver2:VerkoopID = verkoopid#
      					SELECT(?Browse:1,I#)
      					BREAK
      				END
      			END
      		.
      	ELSE
      		MESSAGE('Verkoop kon niet gekopieerd worden.' & ERRORCODE())
      	.
      .
      GLO:GebruikerLogHandelingOpmerking = ''
    OF ?CurrentTab
      DO VulCurrentKlant
    OF ?BUTTON2
      ThisWindow.Update()
      GlobalRequest = SelectRecord
      SelectArelatie('C')
      ThisWindow.Reset
      	IF globalresponse=RequestCompleted
      		Loc:Leverancier = AREL:RelatieID
              FDCB5.ResetQueue(True)
              
              DO VulCurrentKlant
      	END
    OF ?BUTTON3
      ThisWindow.Update()
      GlobalRequest = SelectRecord
      SelectArelatie('C')
      ThisWindow.Reset
      	if globalresponse=RequestCompleted
      		Loc:Leverancier2 = AREL:RelatieID
              FDCB2.ResetQueue(True)
              
              DO VulCurrentKlant
      	END
    OF ?SJABLOON:2
      ThisWindow.Update()
      WindowCallSjabloon('Verkoop',Ver2:VerkoopID)
      ThisWindow.Reset
    OF ?RefreshButton
      ThisWindow.Update()
      ThisWindow.Reset(1)
    OF ?Bevestiging
      ThisWindow.Update()
      ReportVerkoopBevestiging(Ver2:VerkoopID)
      ThisWindow.Reset
    OF ?Xml
      ThisWindow.Update()
      ExportInvoiceXML(VER:Record,,'Order')
      ThisWindow.Reset
      BRW1.ResetQueue(False)
      Select(?Browse:1)
    OF ?RetourRapport
      ThisWindow.Update()
      ! Planningrecord inlezen
      Get(BRW1.Q,Choice(?Browse:1))
      Clear(Ver2:Record)
      Ver2:VerkoopID = BRW1.Q.Ver2:VerkoopID
      IF Access:Verkoop.TryFetch(Ver2:PK_Verkoop) <> Level:Benign THEN
      	RETURN ReturnValue
      END
      
      ReportVerkoop(Ver2:VerkoopID,TRUE)
    OF ?Terug
      ThisWindow.Update()
      GLO:GebruikerLogHandelingOpmerking='Terugzetten Exported'
      Clear(Ver2:Record)
      Ver2:VerkoopID=BRW1.Q.Ver2:VerkoopID
      IF Access:Verkoop.Fetch(Ver2:PK_Verkoop)=Level:Benign
          Ver2:Exported=FALSE
          Access:Verkoop.Update()
          BRW1.ResetQueue(False)
      ELSE
          Message('Verkoop kan niet gevonden wopren '&ERROR())
      END
      GLO:GebruikerLogHandelingOpmerking=''
      Select(?Browse:1)
    OF ?Export
      ThisWindow.Update()
      IF Choice(?CurrentTab) = 4
          ExportVerkoop(Choice(?CurrentTab), Loc:Leverancier)    ! export
      ELSIF Choice(?CurrentTab) = 6
          ExportVerkoop(Choice(?CurrentTab), Loc:Leverancier2)    ! export
      ELSIF Choice(?CurrentTab) = 8
          ExportVerkoop(Choice(?CurrentTab), Loc:Leverancier3)    ! export
      ELSE    
          ExportVerkoop(Choice(?CurrentTab), 0)    ! export
      END
    OF ?XmlInvoice
      ThisWindow.Update()
      ExportInvoiceXML(Ver:Record,,'Invoice')
      ThisWindow.Reset
    OF ?PackLijst
      ThisWindow.Update()
      ReportPackLijst(Ver2:VerkoopID)
      ThisWindow.Reset
    OF ?ExportData
      ThisWindow.Update()
      GlobalRequest = ChangeRecord
      UpdateVerkoopExport()
      ThisWindow.Reset
    END
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue


ThisWindow.TakeEvent PROCEDURE

ReturnValue          BYTE,AUTO

Looped BYTE
  CODE
    If ThisNetRefresh.NeedReset(NetLocalRefreshDate,NetLocalRefreshTime,NetLocalDependancies) ! NetTalk (NetRefresh)
      db.DebugOut('Template stuurt een netrefresh')
    End
    If ThisNetRefresh.NeedReset(NetLocalRefreshDate,NetLocalRefreshTime,NetLocalDependancies) ! NetTalk (NetRefresh)
      Self.Reset(1)                      ! NetTalk (NetRefresh)
    End
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
  IF Loc:ExportBestand='' 
      IF ?Xml{Prop:Hide}=FALSE
          ?Xml{Prop:Hide}=TRUE
          ?Terug{Prop:Hide}=TRUE
      END
  ELSE
      IF INRANGE(CHOICE(?CurrentTab),1,4) 
          IF ?Xml{Prop:Hide}=FALSE
              ?Xml{Prop:Hide}=TRUE
          END    
          IF ?Terug{Prop:Hide}=FALSE
              ?Terug{Prop:Hide}=TRUE
          END    
          IF ?XmlInvoice{Prop:Hide}=FALSE
              ?XmlInvoice{Prop:Hide}=TRUE
          END    
      ELSIF INRANGE(CHOICE(?CurrentTab),5,6) 
          IF ?Xml{Prop:Hide}=TRUE
              ?Xml{Prop:Hide}=FALSE
          END
          IF ?Terug{Prop:Hide}=FALSE
              ?Terug{Prop:Hide}=TRUE
          END    
          IF ?XmlInvoice{Prop:Hide}=TRUE
              ?XmlInvoice{Prop:Hide}=FALSE
          END    
      ELSIF INRANGE(CHOICE(?CurrentTab),7,8) 
          IF ?Xml{Prop:Hide}=FALSE
              ?Xml{Prop:Hide}=TRUE
          END    
          IF ?Terug{Prop:Hide}=TRUE
              ?Terug{Prop:Hide}=FALSE
          END    
          IF ?XmlInvoice{Prop:Hide}=TRUE          ! tijdelijk ook op deze tab laten zien 
              ?XmlInvoice{Prop:Hide}=FALSE
          END    
  !        IF ?XmlInvoice{Prop:Hide}=FALSE
  !            ?XmlInvoice{Prop:Hide}=TRUE
  !        END    
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
    OF ?CurrentTab
      DO VulCurrentKlant
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
    OF EVENT:Notify
        ! Focus overnemen
        !NOTIFICATION(LOC:NotifyCode)
        !IF LOC:NotifyCode = 1 THEN
            ThisWindow{Prop:Active} = 1
        !END
      	
         !NOTIFICATION(NotifyCode#)
      	!IF NotifyCode# = 1
      	!	0{Prop:Active}=TRUE
      	!ELSIF NotifyCode# = 2
      		!ThisWindow.Reset(True)
      		!ThisWindow.Reset(True)
      	!	BRW1.ResetQueue(True)
      	!.
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


BRW1.ApplyRange PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  IF CHOICE(?CurrentTab) = 2 AND POINTER(SELF.Order)=1
  ELSIF CHOICE(?CurrentTab) = 3 AND POINTER(SELF.Order)=2
  ELSIF CHOICE(?CurrentTab) = 4 AND POINTER(SELF.Order)=3
  ELSIF CHOICE(?CurrentTab) = 5 AND POINTER(SELF.Order)=4
  ELSIF CHOICE(?CurrentTab) = 6 AND POINTER(SELF.Order)=5
  ELSIF CHOICE(?CurrentTab) = 7 AND POINTER(SELF.Order)=6
  ELSIF CHOICE(?CurrentTab) = 8 AND POINTER(SELF.Order)=7
      GET(SELF.Order.RangeList.List,1)
      SELF.Order.RangeList.List.Right = Loc:True ! Ver2:Exported
  ELSE
  END
  ReturnValue = PARENT.ApplyRange()
  RETURN ReturnValue


BRW1.Ask PROCEDURE(BYTE Request)

ReturnValue          BYTE,AUTO

  CODE
  IF Request = ChangeRecord AND (Ver2:Verwerkt AND IGB:Verwerken=0) AND (Ver2:Exported AND IGB:Administrator=0)
     Request = ViewRecord     ! 2018-1-29 Weer geactiveerd 2019-4-19 IGB:Verwerken van gemaakt
  ELSIF Request = DeleteRecord AND Ver2:Verwerkt THEN
      MESSAGE('Geplande verkoop is al verwerkt. Kan dus niet meer verwijderd worden.', 'Al uitgevoerd', ICON:Exclamation)
      RETURN Level:Benign
  END
  ReturnValue = PARENT.Ask(Request)
  IF ReturnValue = RequestCompleted THEN
     ! ThisWindow.Reset(1)                ! deze ook uitgeschakeld omdat dit via de netrefresh anders dubbel loopt
  END
  RETURN ReturnValue


BRW1.Fetch PROCEDURE(BYTE Direction)

GreenBarIndex   LONG,AUTO
  CODE
  PARENT.Fetch(Direction)
  !----------------------------------------------------------------------
    LOOP GreenBarIndex=1 TO RECORDS(SELF.Q)
      GET(SELF.Q,GreenBarIndex)
      SELF.Q.Ver2:VerkoopID_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for Ver2:VerkoopID
      SELF.Q.Ver2:VerkoopID_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.Ver2:VerkoopID_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Ver2:VerkoopID_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.AAARel:FirmaNaam_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for AAARel:FirmaNaam
      SELF.Q.AAARel:FirmaNaam_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.AAARel:FirmaNaam_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.AAARel:FirmaNaam_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Ver2:Planning_DATE_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for Ver2:Planning_DATE
      SELF.Q.Ver2:Planning_DATE_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.Ver2:Planning_DATE_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Ver2:Planning_DATE_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Ver2:Planning_TIME_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for Ver2:Planning_TIME
      SELF.Q.Ver2:Planning_TIME_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.Ver2:Planning_TIME_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Ver2:Planning_TIME_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Ver2:Verwerkt_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for Ver2:Verwerkt
      SELF.Q.Ver2:Verwerkt_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.Ver2:Verwerkt_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Ver2:Verwerkt_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.LOC:Artikelen_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for LOC:Artikelen
      SELF.Q.LOC:Artikelen_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.LOC:Artikelen_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.LOC:Artikelen_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      PUT(SELF.Q)
    END
  !----------------------------------------------------------------------


BRW1.Init PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)

  CODE
  PARENT.Init(ListBox,Posit,V,Q,RM,WM)
  IF WM.Request <> ViewRecord                              ! If called for anything other than ViewMode, make the insert, change & delete controls available
    SELF.InsertControl=?Insert:3
    SELF.ChangeControl=?Change:3
    SELF.DeleteControl=?Delete:3
  END


BRW1.NotifyUpdateError PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  !	Return ReturnValue ! anders krijg ik een update foutmelding
  
  ReturnValue = PARENT.NotifyUpdateError()
  RETURN ReturnValue


BRW1.ResetQueue PROCEDURE(BYTE ResetMode)

  CODE
  DO VulCurrentKlant
  
  PARENT.ResetQueue(ResetMode)


BRW1.ResetSort PROCEDURE(BYTE Force)

ReturnValue          BYTE,AUTO

  CODE
  IF CHOICE(?CurrentTab) = 2
    RETURN SELF.SetSort(1,Force)
  ELSIF CHOICE(?CurrentTab) = 3
    RETURN SELF.SetSort(2,Force)
  ELSIF CHOICE(?CurrentTab) = 4
    RETURN SELF.SetSort(3,Force)
  ELSIF CHOICE(?CurrentTab) = 5
    RETURN SELF.SetSort(4,Force)
  ELSIF CHOICE(?CurrentTab) = 6
    RETURN SELF.SetSort(5,Force)
  ELSIF CHOICE(?CurrentTab) = 7
    RETURN SELF.SetSort(6,Force)
  ELSIF CHOICE(?CurrentTab) = 8
    RETURN SELF.SetSort(7,Force)
  ELSE
    RETURN SELF.SetSort(8,Force)
  END
  ReturnValue = PARENT.ResetSort(Force)
  RETURN ReturnValue


BRW1.SetQueueRecord PROCEDURE

  CODE
  LOC:Artikelen = CachingClass.GetVerkoopArtikelen(Ver2:VerkoopID)
  PARENT.SetQueueRecord
  
  IF (Ver2:Verwerkt)
    SELF.Q.Ver2:Verwerkt_Icon = 2                          ! Set icon from icon list
  ELSE
    SELF.Q.Ver2:Verwerkt_Icon = 1                          ! Set icon from icon list
  END
  !----------------------------------------------------------------------
      SELF.Q.Ver2:VerkoopID_NormalFG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1) ! Set color values for Ver2:VerkoopID
      SELF.Q.Ver2:VerkoopID_NormalBG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,8454143)
      SELF.Q.Ver2:VerkoopID_SelectedFG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.Ver2:VerkoopID_SelectedBG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.AAARel:FirmaNaam_NormalFG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1) ! Set color values for AAARel:FirmaNaam
      SELF.Q.AAARel:FirmaNaam_NormalBG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,8454143)
      SELF.Q.AAARel:FirmaNaam_SelectedFG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.AAARel:FirmaNaam_SelectedBG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.Ver2:Planning_DATE_NormalFG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1) ! Set color values for Ver2:Planning_DATE
      SELF.Q.Ver2:Planning_DATE_NormalBG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,8454143)
      SELF.Q.Ver2:Planning_DATE_SelectedFG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.Ver2:Planning_DATE_SelectedBG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.Ver2:Planning_TIME_NormalFG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1) ! Set color values for Ver2:Planning_TIME
      SELF.Q.Ver2:Planning_TIME_NormalBG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,8454143)
      SELF.Q.Ver2:Planning_TIME_SelectedFG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.Ver2:Planning_TIME_SelectedBG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.Ver2:Verwerkt_NormalFG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1) ! Set color values for Ver2:Verwerkt
      SELF.Q.Ver2:Verwerkt_NormalBG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,8454143)
      SELF.Q.Ver2:Verwerkt_SelectedFG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.Ver2:Verwerkt_SelectedBG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.LOC:Artikelen_NormalFG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1) ! Set color values for LOC:Artikelen
      SELF.Q.LOC:Artikelen_NormalBG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,8454143)
      SELF.Q.LOC:Artikelen_SelectedFG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.LOC:Artikelen_SelectedBG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
  !----------------------------------------------------------------------


BRW1.ValidateRecord PROCEDURE

ReturnValue          BYTE,AUTO

BRW1::RecordStatus   BYTE,AUTO
  CODE
  ReturnValue = PARENT.ValidateRecord()
  !IF VER2:Klant = 0 THEN RETURN Record:Filtered. ! Records die een andere gebruiker aan het toevoegen is, niet tonen.
  !Bovenstaand in de filter gezet
  IF CHOICE(?CurrentTab) = 2
      IF Ver2:Planning_DATE > DATE(1,1,1900) THEN
          RETURN Record:Filtered
      END
  END
  BRW1::RecordStatus=ReturnValue
  RETURN ReturnValue


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window
  SELF.SetStrategy(?Rel:FirmaNaam, Resize:FixLeft+Resize:FixTop, Resize:LockSize) ! Override strategy for ?Rel:FirmaNaam
  SELF.SetStrategy(?AARel:FirmaNaam, Resize:FixLeft+Resize:FixTop, Resize:LockSize) ! Override strategy for ?AARel:FirmaNaam
  SELF.SetStrategy(?Insert:3, Resize:FixLeft+Resize:FixTop, Resize:LockSize) ! Override strategy for ?Insert:3
  SELF.SetStrategy(?Change:3, Resize:FixLeft+Resize:FixTop, Resize:LockSize) ! Override strategy for ?Change:3
  SELF.SetStrategy(?Delete:3, Resize:FixLeft+Resize:FixTop, Resize:LockSize) ! Override strategy for ?Delete:3
  SELF.SetStrategy(?BUTTON3, Resize:FixLeft+Resize:FixTop, Resize:LockSize) ! Override strategy for ?BUTTON3
  SELF.SetStrategy(?BUTTON2, Resize:FixLeft+Resize:FixTop, Resize:LockSize) ! Override strategy for ?BUTTON2
  SELF.SetStrategy(?SJABLOON, Resize:FixLeft+Resize:FixTop, Resize:LockSize) ! Override strategy for ?SJABLOON
  SELF.SetStrategy(?KOPIEER, Resize:FixLeft+Resize:FixTop, Resize:LockSize) ! Override strategy for ?KOPIEER
  SELF.SetStrategy(?SJABLOON:2, Resize:FixLeft+Resize:FixTop, Resize:LockSize) ! Override strategy for ?SJABLOON:2
  SELF.SetStrategy(?RefreshButton, Resize:FixRight+Resize:FixBottom, Resize:LockSize) ! Override strategy for ?RefreshButton
  SELF.SetStrategy(?PackLijst, Resize:FixLeft+Resize:FixBottom, Resize:LockSize) ! Override strategy for ?PackLijst
  SELF.SetStrategy(?ExportData, Resize:FixLeft+Resize:FixBottom, Resize:LockSize) ! Override strategy for ?ExportData


FDCB5.SetQueueRecord PROCEDURE

  CODE
  	i#=INSTRING('<39>',REL:FirmaNaam,1,1)
  	if i#
  		Loc:Firmanaam = Sub(REL:FirmaNaam,1,i#-1)&SUB(REL:FirmaNaam,i#+1,51)
  	ELSE
  		Loc:Firmanaam = REL:FirmaNaam
  	End	
  PARENT.SetQueueRecord
  


FDCB2.SetQueueRecord PROCEDURE

  CODE
  	i#=INSTRING('<39>',AARel:FirmaNaam,1,1)
  	if i#
  		Loc:Firmanaam2 = Sub(AARel:FirmaNaam,1,i#-1)&SUB(AARel:FirmaNaam,i#+1,51)
  	ELSE
  		Loc:Firmanaam2 = AARel:FirmaNaam
  	End	
  PARENT.SetQueueRecord
  

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

!!! <summary>
!!! Generated from procedure template - Window
!!! </summary>
WindowRedenRetour PROCEDURE (string pVerkoopInkoop,Long pID,*CString pRedenRetour,*Date pRetourDatum)

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
                     END                                   ! 
LocEnableEnterByTab  BYTE(1)                               !Used by the ENTER Instead of Tab template
EnterByTabManager    EnterByTabClass
Window               WINDOW('Retourboeken'),AT(,,409,199),FONT('Microsoft Sans Serif',8,,FONT:regular),RESIZE,GRAY, |
  MDI,SYSTEM
                       ENTRY(@s50),AT(67,9,303,10),USE(Loc:RedenRetour),REQ
                       SPIN(@d17),AT(67,23,60,10),USE(Loc:RetourDatum),REQ
                       STRING('Reden'),AT(15,9),USE(?STRING1)
                       LIST,AT(15,39,384,139),USE(?LIST1),HVSCROLL,ALRT(MouseLeft),ALRT(MouseLeft2),FORMAT('60L(2)|M~A' & |
  'rtikel ID~L(1)@S30@124L(2)|M~Artikel Omschrijving~L(0)@s99@[49R(2)|M~KG~@n-12_`2@46R' & |
  '(2)|M~Pallets~R(1)@n-14.@]|~Verkoop of Inkoop~[50R(2)|M~KG ~@n-12_`2B@60R(2)|M~Palle' & |
  'ts~R(1)@n-14.B@]|~Retour~60L(2)|M~Planning ID~L(1)@n-14@60L(2)|M~Cel ID~L(1)@n-14@60' & |
  'L(2)|M~Cel Locatie ID~L(1)@n-14@'),FROM(Loc:ListQ)
                       BUTTON('&OK'),AT(320,183,35,14),USE(?OkButton),DEFAULT
                       BUTTON('&Cancel'),AT(363,183,36,14),USE(?CancelButton)
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
  WinAlertMouseZoom()
  Do DefineListboxStyle
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
              WindowBoekRetourRegel(LQ:PlanningID, Loc:RetourKG,Loc:RetourPallets,LQ:CelID,LQ:CelLocatieID)
              IF GlobalResponse=RequestCompleted
                  LQ:KGRetour=Loc:RetourKG
                  LQ:PalletsRetour=Loc:RetourPallets
                  !=Loc:CelID
                  !=Loc:CelLokatieID
                  Put(Loc:ListQ)
              END    
          END
          DISPLAY()
      END
      !IF KEYCode()=MouseLeft
      !    Rij#=?LIST1{PROPLIST:MouseDownRow}
      !    Get(Loc:ListQ,Rij#)
      !    IF ERROR()
      !        Message('Rij '&Rij#&' kan niet gevonden worden'&ERROR())
      !    ELSE
      !        IF LQ:KGRetour=LQ:KG
      !            LQ:KGRetour=0
      !        ELSE
      !            LQ:KGRetour=LQ:KG
      !        END
      !        Put(Loc:ListQ)
      !    END
      !    DISPLAY()
      !END
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
    
!!! <summary>
!!! Generated from procedure template - Window
!!! Form Verkoop
!!! </summary>
UpdateVerkoop PROCEDURE (PRM:KlantID)

CurrentTab           STRING(80)                            ! 
Loc:RedenRetour      CSTRING(51)                           ! 
Loc:RetourDatum      DATE                                  ! 
ActionMessage        CSTRING(40)                           ! 
Loc:Firmanaam        CSTRING(51)                           ! 
LOC:Gekoppeld        BYTE                                  ! 
Loc:KostKGPrijs      DECIMAL(10,3)                         ! 
Loc:ExtraKosten      DECIMAL(11,3)                         ! 
Loc:TotaalKG         DECIMAL(9,2)                          ! 
Loc:TeFactureren     DECIMAL(7,2)                          ! 
FDCB4::View:FileDropCombo VIEW(ARelatie)
                       PROJECT(AREL:Type)
                       PROJECT(AREL:LotID)
                       PROJECT(AREL:Note)
                       PROJECT(AREL:OpenstaandSaldo)
                       PROJECT(AREL:CreditLine)
                       PROJECT(AREL:DagenOud)
                       PROJECT(AREL:Acc_Man)
                     END
FDCB10::View:FileDropCombo VIEW(RelatieAdres)
                       PROJECT(RAD:Adres1)
                       PROJECT(RAD:Plaats)
                       PROJECT(RAD:Postcode)
                       PROJECT(RAD:Adres2)
                       PROJECT(RAD:ID)
                     END
BRW7::View:Browse    VIEW(Planning)
                       PROJECT(Pla:ArtikelID)
                       PROJECT(Pla:KG)
                       PROJECT(Pla:Pallets)
                       PROJECT(Pla:VerkoopKGPrijs)
                       PROJECT(Pla:MutatieGemaakt)
                       PROJECT(Pla:Verwerkt)
                       PROJECT(Pla:MutatieKG)
                       PROJECT(Pla:MutatiePallets)
                       PROJECT(Pla:OverboekingPlanningID)
                       PROJECT(Pla:PartijID)
                       PROJECT(Pla:Instructie)
                       PROJECT(Pla:Transport)
                       PROJECT(Pla:Memo)
                       PROJECT(Pla:ExtraKosten)
                       PROJECT(Pla:PlanningID)
                       PROJECT(Pla:VerkoopID)
                       PROJECT(Pla:VerpakkingID)
                       PROJECT(Pla:CelID)
                       JOIN(Art:Artikel_PK,Pla:ArtikelID)
                         PROJECT(Art:ArtikelOms)
                         PROJECT(Art:ArtikelID)
                       END
                       JOIN(Ver:Verpakking_PK,Pla:VerpakkingID)
                         PROJECT(Ver:VerpakkingOmschrijving)
                         PROJECT(Ver:VerpakkingID)
                       END
                       JOIN(CEL:CEL_PK,Pla:CelID)
                         PROJECT(CEL:CelOms)
                         PROJECT(CEL:CelID)
                       END
                     END
Queue:Browse         QUEUE                            !Queue declaration for browse/combo box using ?List
Pla:ArtikelID          LIKE(Pla:ArtikelID)            !List box control field - type derived from field
Pla:ArtikelID_NormalFG LONG                           !Normal forground color
Pla:ArtikelID_NormalBG LONG                           !Normal background color
Pla:ArtikelID_SelectedFG LONG                         !Selected forground color
Pla:ArtikelID_SelectedBG LONG                         !Selected background color
Art:ArtikelOms         LIKE(Art:ArtikelOms)           !List box control field - type derived from field
Art:ArtikelOms_NormalFG LONG                          !Normal forground color
Art:ArtikelOms_NormalBG LONG                          !Normal background color
Art:ArtikelOms_SelectedFG LONG                        !Selected forground color
Art:ArtikelOms_SelectedBG LONG                        !Selected background color
Pla:KG                 LIKE(Pla:KG)                   !List box control field - type derived from field
Pla:KG_NormalFG        LONG                           !Normal forground color
Pla:KG_NormalBG        LONG                           !Normal background color
Pla:KG_SelectedFG      LONG                           !Selected forground color
Pla:KG_SelectedBG      LONG                           !Selected background color
Pla:Pallets            LIKE(Pla:Pallets)              !List box control field - type derived from field
Pla:Pallets_NormalFG   LONG                           !Normal forground color
Pla:Pallets_NormalBG   LONG                           !Normal background color
Pla:Pallets_SelectedFG LONG                           !Selected forground color
Pla:Pallets_SelectedBG LONG                           !Selected background color
Pla:VerkoopKGPrijs     LIKE(Pla:VerkoopKGPrijs)       !List box control field - type derived from field
Pla:VerkoopKGPrijs_NormalFG LONG                      !Normal forground color
Pla:VerkoopKGPrijs_NormalBG LONG                      !Normal background color
Pla:VerkoopKGPrijs_SelectedFG LONG                    !Selected forground color
Pla:VerkoopKGPrijs_SelectedBG LONG                    !Selected background color
Loc:KostKGPrijs        LIKE(Loc:KostKGPrijs)          !List box control field - type derived from local data
Loc:KostKGPrijs_NormalFG LONG                         !Normal forground color
Loc:KostKGPrijs_NormalBG LONG                         !Normal background color
Loc:KostKGPrijs_SelectedFG LONG                       !Selected forground color
Loc:KostKGPrijs_SelectedBG LONG                       !Selected background color
Pla:MutatieGemaakt     LIKE(Pla:MutatieGemaakt)       !List box control field - type derived from field
Pla:MutatieGemaakt_NormalFG LONG                      !Normal forground color
Pla:MutatieGemaakt_NormalBG LONG                      !Normal background color
Pla:MutatieGemaakt_SelectedFG LONG                    !Selected forground color
Pla:MutatieGemaakt_SelectedBG LONG                    !Selected background color
Pla:MutatieGemaakt_Icon LONG                          !Entry's icon ID
Pla:Verwerkt           LIKE(Pla:Verwerkt)             !List box control field - type derived from field
Pla:Verwerkt_NormalFG  LONG                           !Normal forground color
Pla:Verwerkt_NormalBG  LONG                           !Normal background color
Pla:Verwerkt_SelectedFG LONG                          !Selected forground color
Pla:Verwerkt_SelectedBG LONG                          !Selected background color
Pla:Verwerkt_Icon      LONG                           !Entry's icon ID
Pla:MutatieKG          LIKE(Pla:MutatieKG)            !List box control field - type derived from field
Pla:MutatieKG_NormalFG LONG                           !Normal forground color
Pla:MutatieKG_NormalBG LONG                           !Normal background color
Pla:MutatieKG_SelectedFG LONG                         !Selected forground color
Pla:MutatieKG_SelectedBG LONG                         !Selected background color
Pla:MutatiePallets     LIKE(Pla:MutatiePallets)       !List box control field - type derived from field
Pla:MutatiePallets_NormalFG LONG                      !Normal forground color
Pla:MutatiePallets_NormalBG LONG                      !Normal background color
Pla:MutatiePallets_SelectedFG LONG                    !Selected forground color
Pla:MutatiePallets_SelectedBG LONG                    !Selected background color
Pla:OverboekingPlanningID LIKE(Pla:OverboekingPlanningID) !List box control field - type derived from field
Pla:OverboekingPlanningID_NormalFG LONG               !Normal forground color
Pla:OverboekingPlanningID_NormalBG LONG               !Normal background color
Pla:OverboekingPlanningID_SelectedFG LONG             !Selected forground color
Pla:OverboekingPlanningID_SelectedBG LONG             !Selected background color
Pla:OverboekingPlanningID_Icon LONG                   !Entry's icon ID
Pla:PartijID           LIKE(Pla:PartijID)             !List box control field - type derived from field
Pla:PartijID_NormalFG  LONG                           !Normal forground color
Pla:PartijID_NormalBG  LONG                           !Normal background color
Pla:PartijID_SelectedFG LONG                          !Selected forground color
Pla:PartijID_SelectedBG LONG                          !Selected background color
CEL:CelOms             LIKE(CEL:CelOms)               !List box control field - type derived from field
CEL:CelOms_NormalFG    LONG                           !Normal forground color
CEL:CelOms_NormalBG    LONG                           !Normal background color
CEL:CelOms_SelectedFG  LONG                           !Selected forground color
CEL:CelOms_SelectedBG  LONG                           !Selected background color
Ver:VerpakkingOmschrijving LIKE(Ver:VerpakkingOmschrijving) !List box control field - type derived from field
Ver:VerpakkingOmschrijving_NormalFG LONG              !Normal forground color
Ver:VerpakkingOmschrijving_NormalBG LONG              !Normal background color
Ver:VerpakkingOmschrijving_SelectedFG LONG            !Selected forground color
Ver:VerpakkingOmschrijving_SelectedBG LONG            !Selected background color
Pla:Instructie         LIKE(Pla:Instructie)           !List box control field - type derived from field
Pla:Instructie_NormalFG LONG                          !Normal forground color
Pla:Instructie_NormalBG LONG                          !Normal background color
Pla:Instructie_SelectedFG LONG                        !Selected forground color
Pla:Instructie_SelectedBG LONG                        !Selected background color
Pla:Transport          LIKE(Pla:Transport)            !List box control field - type derived from field
Pla:Transport_NormalFG LONG                           !Normal forground color
Pla:Transport_NormalBG LONG                           !Normal background color
Pla:Transport_SelectedFG LONG                         !Selected forground color
Pla:Transport_SelectedBG LONG                         !Selected background color
Pla:Memo               LIKE(Pla:Memo)                 !List box control field - type derived from field
Pla:Memo_NormalFG      LONG                           !Normal forground color
Pla:Memo_NormalBG      LONG                           !Normal background color
Pla:Memo_SelectedFG    LONG                           !Selected forground color
Pla:Memo_SelectedBG    LONG                           !Selected background color
Pla:ExtraKosten        LIKE(Pla:ExtraKosten)          !Browse hot field - type derived from field
Pla:PlanningID         LIKE(Pla:PlanningID)           !Primary key field - type derived from field
Pla:VerkoopID          LIKE(Pla:VerkoopID)            !Browse key field - type derived from field
Art:ArtikelID          LIKE(Art:ArtikelID)            !Related join file key field - type derived from field
Ver:VerpakkingID       LIKE(Ver:VerpakkingID)         !Related join file key field - type derived from field
CEL:CelID              LIKE(CEL:CelID)                !Related join file key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
BRW12::View:Browse   VIEW(KostenStamgeg)
                       PROJECT(Kos:Omschrijving)
                       PROJECT(Kos:Soort)
                       PROJECT(Kos:Prijs)
                       PROJECT(Kos:KostenID)
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?ListExtraKosten
Kos:Omschrijving       LIKE(Kos:Omschrijving)         !List box control field - type derived from field
Ext:Aantal             LIKE(Ext:Aantal)               !List box control field - type derived from field
Ext:Prijs              LIKE(Ext:Prijs)                !List box control field - type derived from field
Ext:ExtraKosten        LIKE(Ext:ExtraKosten)          !List box control field - type derived from field
Kos:Soort              LIKE(Kos:Soort)                !Browse hot field - type derived from field
Kos:Prijs              LIKE(Kos:Prijs)                !Browse hot field - type derived from field
Kos:KostenID           LIKE(Kos:KostenID)             !Browse hot field - type derived from field
Ver2:RedenRetour       LIKE(Ver2:RedenRetour)         !Browse hot field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
FDB14::View:FileDrop VIEW(DeliveryTerms)
                       PROJECT(DLT:Omschrijving)
                       PROJECT(DLT:DeliveryTermsID)
                     END
FDB15::View:FileDrop VIEW(Gebruiker)
                       PROJECT(Geb:VolledigeNaam)
                       PROJECT(Geb:ID)
                     END
Queue:FileDropCombo  QUEUE                            !
Loc:Firmanaam          LIKE(Loc:Firmanaam)            !List box control field - type derived from local data
AREL:Type              LIKE(AREL:Type)                !Browse hot field - type derived from field
AREL:LotID             LIKE(AREL:LotID)               !Browse hot field - type derived from field
AREL:Note              LIKE(AREL:Note)                !Browse hot field - type derived from field
AREL:OpenstaandSaldo   LIKE(AREL:OpenstaandSaldo)     !Browse hot field - type derived from field
AREL:CreditLine        LIKE(AREL:CreditLine)          !Browse hot field - type derived from field
AREL:DagenOud          LIKE(AREL:DagenOud)            !Browse hot field - type derived from field
AREL:Acc_Man           LIKE(AREL:Acc_Man)             !Browse hot field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
Queue:FileDropCombo:1 QUEUE                           !
RAD:Adres1             LIKE(RAD:Adres1)               !List box control field - type derived from field
RAD:Plaats             LIKE(RAD:Plaats)               !List box control field - type derived from field
RAD:Postcode           LIKE(RAD:Postcode)             !List box control field - type derived from field
RAD:Adres2             LIKE(RAD:Adres2)               !List box control field - type derived from field
RAD:ID                 LIKE(RAD:ID)                   !Primary key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
Queue:FileDrop       QUEUE                            !
DLT:Omschrijving       LIKE(DLT:Omschrijving)         !List box control field - type derived from field
DLT:DeliveryTermsID    LIKE(DLT:DeliveryTermsID)      !Primary key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
Queue:FileDrop:1     QUEUE                            !
Geb:VolledigeNaam      LIKE(Geb:VolledigeNaam)        !List box control field - type derived from field
Geb:ID                 LIKE(Geb:ID)                   !Primary key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
LocEnableEnterByTab  BYTE(1)                               !Used by the ENTER Instead of Tab template
EnterByTabManager    EnterByTabClass
History::Ver2:Record LIKE(Ver2:RECORD),THREAD
NetLocalRefreshDate     Long     ! NetTalk (NetRefresh)
NetLocalRefreshTime     Long
NetLocalDependancies    String('|Verkoop|AAARelatie|ARelatie|RelatieAdres|Planning|ViewArtikel|Verpakking|Cel|KostenStamgeg|DeliveryTerms|Gebruiker|')
QuickWindow          WINDOW('Verkoop'),AT(,,733,428),FONT('MS Sans Serif',8,,,CHARSET:DEFAULT),RESIZE,CENTER,GRAY, |
  IMM,MAX,MDI,HLP('UpdateInkoop'),SYSTEM
                       PROMPT('Klant:'),AT(5,30),USE(?Ink:Leverancier:Prompt),TRN
                       COMBO(@s50),AT(72,31,285,10),USE(Loc:Firmanaam),DROP(25),FORMAT('200L(2)|M@s50@'),FROM(Queue:FileDropCombo), |
  REQ
                       BUTTON('...'),AT(361,30,23),USE(?LookupButton),ICON('ÿ<01H>')
                       BUTTON('Notitie'),AT(396,30,63),USE(?Note),RIGHT,HIDE
                       CHECK('Verwerkt'),AT(469,32),USE(Ver2:Verwerkt),DISABLE
                       BUTTON('Order retour boeken'),AT(520,30,178,14),USE(?BtnRetour),HIDE
                       PROMPT('Afwijkend losadres:'),AT(5,45),USE(?PROMPT1)
                       COMBO(@s100),AT(72,45,285,10),USE(RAD:Adres1),DROP(5),FORMAT('100L(2)|M~Naam~C(0)@s100@' & |
  '100L(2)|M~Plaats~C(0)@s100@40L(2)|M~Postcode~C(0)@s10@100L(2)|M~Adres 2~C(0)@s100@'),FROM(Queue:FileDropCombo:1), |
  IMM
                       BUTTON('Bevestiging Negatieve order/regel'),AT(552,46,147),USE(?BTNNegatieveOrder)
                       PROMPT('Planning Datum:'),AT(5,60),USE(?Ver2:Planning_DATE:Prompt)
                       SPIN(@d6-),AT(72,61,60,10),USE(Ver2:Planning_DATE,,?Ver2:Planning_DATE:2)
                       BUTTON('...'),AT(137,60,12,12),USE(?Calendar)
                       PROMPT('Planning Tijd:'),AT(160,61),USE(?Ink:Planning_TIME:Prompt),TRN
                       ENTRY(@t7),AT(228,61,60,10),USE(Ver2:Planning_TIME)
                       PROMPT('Valuta:'),AT(324,61),USE(?Ver2:Valuta:Prompt)
                       LIST,AT(365,61,76,10),USE(Ver2:Valuta),DROP(3),FROM('Euro|#Euro|Dollar|#Dollar|Pond|#Pond')
                       PROMPT('Koersverschil:'),AT(449,45),USE(?Ver2:Koersverschil:Prompt)
                       ENTRY(@n-15`3),AT(499,61,60,10),USE(Ver2:Koersverschil),RIGHT(2)
                       PROMPT('Confirmation Date :'),AT(5,74),USE(?Ver2:ConfirmationDate_DATE:Prompt)
                       ENTRY(@d6-),AT(73,76,60,10),USE(Ver2:ConfirmationDate_DATE)
                       STRING('Verkoper:'),AT(160,76),USE(?STRING2)
                       LIST,AT(229,74,149,13),USE(Geb:VolledigeNaam),DROP(25),FORMAT('200L(2)|M~Volledige Naam' & |
  '~L(0)@s50@'),FROM(Queue:FileDrop:1)
                       PROMPT('Delivery Terms:'),AT(449,77),USE(?PROMPT3)
                       LIST,AT(499,77,147,10),USE(DLT:Omschrijving),DROP(25),FORMAT('240L(2)|M~Omschrijving~L(0)@s60@'), |
  FROM(Queue:FileDrop)
                       PROMPT('Externe Verkoop-ID:'),AT(5,90),USE(?Ver2:ExternVerkoopID:Prompt)
                       ENTRY(@s50),AT(72,91,206,10),USE(Ver2:ExternVerkoopID)
                       PROMPT('Instructie:'),AT(5,102),USE(?Ink:Instructie:Prompt),HIDE,TRN
                       ENTRY(@s100),AT(72,103,285,10),USE(Ver2:Instructie),HIDE
                       PROMPT('Transport:'),AT(449,102,37),USE(?Ink:Transport:Prompt),HIDE,TRN
                       ENTRY(@s100),AT(499,103,168,10),USE(Ver2:Transport),HIDE
                       LIST,AT(6,116,309,56),USE(?ListExtraKosten),ALRT(MouseLeft2),FORMAT('169L(2)|M~Extra Ko' & |
  'sten~@s60@45L(2)|M~Aantal~R(2)@n12_`2@41L(2)|M~Prijs~R(2)@n-15.3@64L(2)|M~Extra Kost' & |
  'en~R(2)@n-15.3@'),FROM(Queue:Browse:1),IMM
                       PROMPT('Extra Kosten:'),AT(449,101),USE(?Ver2:ExtraKosten:Prompt),HIDE
                       TEXT,AT(499,100,224,45),USE(Ver2:ExtraKostenTekst),VSCROLL,BOXED,HIDE
                       LIST,AT(6,175,717,207),USE(?List),HVSCROLL,FORMAT('[40L(2)|*~ID~C(0)@s30@120L(2)|*~Omsc' & |
  'hrijving~C(0)@s60@]|~Artikel~57R(2)|*~KG~C(0)@n-15`2@29R(2)|*~Pallets~C(0)@n4.@56R(2' & |
  ')|*~Verkoop KG-Prijs~C(0)@n-13`3@54R(2)|*~Kost KG-prijs~@n-14`3@[30L(2)|*I~Mutatie~C' & |
  '(0)@p p@33L(2)|*I~Verwerkt~C(0)@p p@36R(2)|M*~KG~R(1)@n9`2@30R(2)|M*~Pallets~R(1)@n4' & |
  '@](125)|~Uitslaan~40L(2)|*I~Gekoppeld~C(1)@p p@30R(2)|*~Partij~C(0)@n_10@30L(2)|*~Ce' & |
  'l~C(0)@s50@60L(2)|*~Verpakking~C(0)@s50@100L(2)|*~Instructie~C(0)@s100@100L(2)|*~Tra' & |
  'nsport~C(0)@s100@100L(2)|*~Memo~C(0)@s100@'),FROM(Queue:Browse),IMM
                       BUTTON('&Toevoegen'),AT(417,408,70,17),USE(?Insert)
                       BUTTON('&Wijzigen'),AT(489,408,42,17),USE(?Change)
                       BUTTON('&Verwijderen'),AT(537,408,53,17),USE(?Delete)
                       STRING('Benodigd voor het printen van de palletbladen en export naar Exact.'),AT(284,91),USE(?STRING1), |
  FONT('Microsoft Sans Serif',,,FONT:regular+FONT:italic)
                       PROMPT('Verkoop:'),AT(5,17,61,10),USE(?PROMPT2)
                       STRING(@n_10),AT(71,18),USE(Ver2:VerkoopID),FONT('Microsoft Sans Serif',,,FONT:bold)
                       STRING(@n-11.2),AT(329,18,44),USE(AREL:OpenstaandSaldo),FONT('Microsoft Sans Serif',,,FONT:bold), |
  RIGHT
                       STRING(@n-11.2),AT(253,18),USE(AREL:CreditLine),FONT('Microsoft Sans Serif',,,FONT:bold)
                       STRING('Kredietlimiet:'),AT(208,18),USE(?STRING3)
                       STRING('Saldo:'),AT(305,18,22,10),USE(?STRING3:2)
                       BUTTON,AT(373,0),USE(?Waarschuwing),FLAT
                       BUTTON('&View'),AT(365,408,42,17),USE(?View)
                       STRING('Te factureren:'),AT(377,18,49,10),USE(?STRING3:3)
                       STRING(@n-10`2),AT(428,18,44),USE(Loc:TeFactureren),FONT('Microsoft Sans Serif',,,FONT:bold), |
  RIGHT
                       BUTTON('+'),AT(361,45,23),USE(?VoegToeAdres)
                       BUTTON('&OK'),AT(615,410,49,14),USE(?OK),LEFT,ICON('WAOK.ICO'),DEFAULT,FLAT,MSG('Accept dat' & |
  'a and close the window'),TIP('Accept data and close the window')
                       BUTTON('&Annuleren'),AT(667,410,61,14),USE(?Cancel),LEFT,ICON('WACANCEL.ICO'),FLAT,MSG('Cancel operation'), |
  TIP('Cancel operation')
                     END

    omit('***',WE::CantCloseNowSetHereDone=1)  !Getting Nested omit compile error, then uncheck the "Check for duplicate CantCloseNowSetHere variable declaration" in the WinEvent local template
WE::CantCloseNowSetHereDone equate(1)
WE::CantCloseNowSetHere     long
    !***
ThisWindow           CLASS(WindowManager)
Ask                    PROCEDURE(),DERIVED
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
PrimeUpdate            PROCEDURE(),BYTE,PROC,DERIVED
Reset                  PROCEDURE(BYTE Force=0),DERIVED
Run                    PROCEDURE(),BYTE,PROC,DERIVED
Run                    PROCEDURE(USHORT Number,BYTE Request),BYTE,PROC,DERIVED
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED
TakeCloseEvent         PROCEDURE(),BYTE,PROC,DERIVED
TakeCompleted          PROCEDURE(),BYTE,PROC,DERIVED
TakeEvent              PROCEDURE(),BYTE,PROC,DERIVED
TakeFieldEvent         PROCEDURE(),BYTE,PROC,DERIVED
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
FDCB4                CLASS(FileDropComboClass)             ! File drop combo manager
Q                      &Queue:FileDropCombo           !Reference to browse queue type
SetQueueRecord         PROCEDURE(),DERIVED
                     END

FDCB10               CLASS(FileDropComboClass)             ! File drop combo manager
Q                      &Queue:FileDropCombo:1         !Reference to browse queue type
                     END

BRW7                 CLASS(BrowseClass)                    ! Browse using ?List
Q                      &Queue:Browse                  !Reference to browse queue
Ask                    PROCEDURE(BYTE Request),BYTE,PROC,DERIVED
Fetch                  PROCEDURE(BYTE Direction),DERIVED
Init                   PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)
ResetFromView          PROCEDURE(),DERIVED
SetQueueRecord         PROCEDURE(),DERIVED
                     END

BRW7::Sort0:Locator  StepLocatorClass                      ! Default Locator
BRW12                CLASS(BrowseClass)                    ! Browse using ?ListExtraKosten
Q                      &Queue:Browse:1                !Reference to browse queue
ResetFromView          PROCEDURE(),DERIVED
SetQueueRecord         PROCEDURE(),DERIVED
                     END

BRW12::Sort0:Locator StepLocatorClass                      ! Default Locator
Resizer              CLASS(WindowResizeClass)
Init                   PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)
                     END

Calendar8            CalendarClass
FDB14                CLASS(FileDropClass)                  ! File drop manager
Q                      &Queue:FileDrop                !Reference to display queue
                     END

FDB15                CLASS(FileDropClass)                  ! File drop manager
Q                      &Queue:FileDrop:1              !Reference to display queue
                     END

LocalClass          CLASS
NegatieveOrder          Procedure, BYTE
                    END
SAVAREL:Record  LIKE(AREL:Record)
CurCtrlFeq          LONG
FieldColorQueue     QUEUE
Feq                   LONG
OldColor              LONG
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
UpdateVerwerkStatus    ROUTINE
	Verwerkt# = true
	NoRecord# = true
	
	Pla:VerkoopID = Ver2:VerkoopID
	CLEAR(Pla:PlanningID,-1)
	SET(Pla:Planning_FK02,Pla:Planning_FK02)
	LOOP
		Access:Planning.TryNext()
		IF ERROR() THEN BREAK.
		
		IF Pla:VerkoopID <> Ver2:VerkoopID THEN BREAK.
		
		NoRecord# = false
		
		IF NOT(Pla:Verwerkt)
			Verwerkt# = false
			BREAK
		.
    .
       
	IF NOT(NoRecord#)
		Ver2:Verwerkt = Verwerkt# 
		
		Access:Verkoop.TryUpdate()
		IF ERROR() THEN
			  IF ERRORCODE() = 90 THEN
				  MESSAGE('Verkoop-record kon niet worden bijgewerkt | SQL Error('&FILEERRORCODE()&'):'&FILEERROR()&')')
			  ELSE
				  MESSAGE('Verkoop-record kon niet worden bijgewerkt | Error('&ERRORCODE()&'):'&ERROR()&')')
			.
		.
	.
BepaaldNogTefactureren      ROUTINE
    CLEAR(Loc:TeFactureren)
    IF Ver2:Klant
        ClEAR(AVE:Record)
        AVE:Klant=Ver2:Klant
        SET(AVE:Klant_Verwerkt_Planning_K,AVE:Klant_Verwerkt_Planning_K)
        AVerkoop{PROP:Where}='Exported is NULL'
        LOOP UNTIL Access:AVerkoop.Next()
            IF NOT (AVE:Exported=0 AND AVE:Klant=Ver2:Klant) THEN BREAK.
            Loc:TeFactureren+=AVE:ExtraKosten
            Clear(APla:Record)
            APla:VerkoopID=AVE:VerkoopID
            Set(APla:Planning_FK02,APla:Planning_FK02)
            Loop UNtil Access:APlanning.Next()
                IF NOT APla:VerkoopID=AVE:VerkoopID THEN BREAK.
                Loc:TeFactureren+=APLA:VerkoopKGPrijs*APla:KG
            END
        END
    END
    
    
    
    
    EXIT

ThisWindow.Ask PROCEDURE

  CODE
  CASE SELF.Request                                        ! Configure the action message text
  OF ViewRecord
    ActionMessage = 'View Record'
  OF InsertRecord
    ActionMessage = 'Record Will Be Added'
  OF ChangeRecord
    ActionMessage = 'Record Will Be Changed'
  END
  QuickWindow{PROP:Text} = ActionMessage                   ! Display status message in title bar
  PARENT.Ask


ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('UpdateVerkoop')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Ink:Leverancier:Prompt
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('Loc:KostKGPrijs',Loc:KostKGPrijs)                  ! Added by: BrowseBox(ABC)
  BIND('Pla:PlanningID',Pla:PlanningID)                    ! Added by: BrowseBox(ABC)
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.HistoryKey = CtrlH
  SELF.AddHistoryFile(Ver2:Record,History::Ver2:Record)
  SELF.AddHistoryField(?Ver2:Verwerkt,3)
  SELF.AddHistoryField(?Ver2:Planning_DATE:2,6)
  SELF.AddHistoryField(?Ver2:Planning_TIME,7)
  SELF.AddHistoryField(?Ver2:Valuta,31)
  SELF.AddHistoryField(?Ver2:Koersverschil,32)
  SELF.AddHistoryField(?Ver2:ConfirmationDate_DATE,18)
  SELF.AddHistoryField(?Ver2:ExternVerkoopID,13)
  SELF.AddHistoryField(?Ver2:Instructie,8)
  SELF.AddHistoryField(?Ver2:Transport,9)
  SELF.AddHistoryField(?Ver2:ExtraKostenTekst,12)
  SELF.AddHistoryField(?Ver2:VerkoopID,1)
  SELF.AddUpdateFile(Access:Verkoop)
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  Relate:AMutatie.Open                                     ! File AMutatie used by this procedure, so make sure it's RelationManager is open
  Relate:APlanning.Open                                    ! File APlanning used by this procedure, so make sure it's RelationManager is open
  Relate:ARelatie.Open                                     ! File ARelatie used by this procedure, so make sure it's RelationManager is open
  Relate:AVerkoop.Open                                     ! File AVerkoop used by this procedure, so make sure it's RelationManager is open
  Relate:DeliveryTerms.Open                                ! File DeliveryTerms used by this procedure, so make sure it's RelationManager is open
  Relate:ExtraKosten.Open                                  ! File ExtraKosten used by this procedure, so make sure it's RelationManager is open
  Relate:Gebruiker.Open                                    ! File Gebruiker used by this procedure, so make sure it's RelationManager is open
  Relate:Inkoop.SetOpenRelated()
  Relate:Inkoop.Open                                       ! File Inkoop used by this procedure, so make sure it's RelationManager is open
  Relate:KostenStamgeg.Open                                ! File KostenStamgeg used by this procedure, so make sure it's RelationManager is open
  Relate:Mutatie.Open                                      ! File Mutatie used by this procedure, so make sure it's RelationManager is open
  Relate:Partij.Open                                       ! File Partij used by this procedure, so make sure it's RelationManager is open
  Relate:RelatieAdres.Open                                 ! File RelatieAdres used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Primary &= Relate:Verkoop
  IF SELF.Request = ViewRecord AND NOT SELF.BatchProcessing ! Setup actions for ViewOnly Mode
    SELF.InsertAction = Insert:None
    SELF.DeleteAction = Delete:None
    SELF.ChangeAction = Change:None
    SELF.CancelAction = Cancel:Cancel
    SELF.OkControl = 0
  ELSE
    SELF.ChangeAction = Change:Caller                      ! Changes allowed
    SELF.CancelAction = Cancel:Cancel+Cancel:Query         ! Confirm cancel
    SELF.OkControl = ?OK
    IF SELF.PrimeUpdate() THEN RETURN Level:Notify.
  END
  If Self.Request = InsertRecord then
      Ver2:Planning_DATE = today()
      Ver2:ConfirmationDate_DATE = today()
      Ver2:GebruikerID=IGB:GebruikerID
      Ver2:Klant = PRM:KlantID
      
      Ver2:Exported=FALSE
      
      CLEAR(ARel:Record)
      ARel:RelatieID = PRM:KlantID
      Access:ARelatie.TryFetch(ARel:Relatie_PK)
      ! standaard vertegenwoordiger overnemen
      Clear(GEB:Record)
      Geb:res_id=Arel:Acc_Man
      if Access:Gebruiker.Fetch(Geb:FK2_Gebruiker)=Level:Benign
          Ver2:GebruikerID=Geb:ID
      END
      
      
      CLEAR(RAD:Record)
  ELSIF Self.Request = ChangeRecord THEN
      CLEAR(RAD:Record)
      RAD:ID = Ver2:KlantAlternatiefAdres
      IF Access:RelatieAdres.Fetch(RAD:PK_RelatieAdres) <> Level:Benign THEN
          CLEAR(RAD:Record)
      END
      CLEAR(ARel:Record)
      ARel:RelatieID = Ver2:Klant
      Access:ARelatie.TryFetch(ARel:Relatie_PK)
      
  END
  BRW7.Init(?List,Queue:Browse.ViewPosition,BRW7::View:Browse,Queue:Browse,Relate:Planning,SELF) ! Initialize the browse manager
  BRW12.Init(?ListExtraKosten,Queue:Browse:1.ViewPosition,BRW12::View:Browse,Queue:Browse:1,Relate:KostenStamgeg,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  IF (IGB:BekijkenPrijzen <> 1) THEN
  	!HIDE(?Ver2:ExtraKosten)
      HIDE(?Ver2:ExtraKosten:Prompt)
      HIDE(?Ver2:ExtraKostenTekst)
      ?List{PROPLIST:Width, 5} = 0
      HIDE(?ListExtraKosten)       ! Extra Kosten
  END
  
  IF GLO:HidePlanningInstructie = 1 THEN
      ?List{PROPLIST:Width, 13} = 0 
  END    
  IF Ver2:BevestigingGeprint_DATE
      DISABLE(?Ver2:ConfirmationDate_DATE)  
      IF Ver2:GebruikerID
          DISABLE(?Geb:VolledigeNaam)
      END
  END
  
  
  LocalClass.NegatieveOrder()
  IF Ver2:Verwerkt=1
      UNHIDE(?BtnRetour)
      IF Ver2:RedenRetour = ''
          ?BtnRetour{Prop:Text}='Retour boeken:'
      ELSE
      !    DISABLE(?BtnRetour)
          ?BtnRetour{Prop:Text}='Retour reden:'&Ver2:RedenRetour&' '&Format(Ver2:RetourDatum_DATE,@d5-)
      END
      
  ELSE
      HIDE(?BtnRetour)
  END
  Do BepaaldNogTefactureren
  
  
  !Clear(GEB:Record)
  !Geb:ID=IGB:GebruikerID
  !if Access:Gebruiker.Fetch(Geb:PK_Gebruiker)=Level:Benign
  !END
  
  WinAlertMouseZoom()
  Do DefineListboxStyle
  IF SELF.Request = ViewRecord                             ! Configure controls for View Only mode
    DISABLE(?Loc:Firmanaam)
    DISABLE(?LookupButton)
    DISABLE(?Note)
    DISABLE(?RAD:Adres1)
    DISABLE(?Ver2:Planning_DATE:2)
    DISABLE(?Calendar)
    DISABLE(?Ver2:Planning_TIME)
    DISABLE(?Ver2:Valuta)
    ?Ver2:Koersverschil{PROP:ReadOnly} = True
    ?Ver2:ConfirmationDate_DATE{PROP:ReadOnly} = True
    DISABLE(?Geb:VolledigeNaam)
    DISABLE(?DLT:Omschrijving)
    DISABLE(?Ver2:ExternVerkoopID)
    DISABLE(?Ver2:Instructie)
    DISABLE(?Ver2:Transport)
    DISABLE(?Ver2:ExtraKostenTekst)
    HIDE(?Insert)
    HIDE(?Change)
    HIDE(?Delete)
    DISABLE(?Waarschuwing)
    DISABLE(?VoegToeAdres)
  END
  BRW7.Q &= Queue:Browse
  BRW7.FileLoaded = 1                                      ! This is a 'file loaded' browse
  BRW7.AddSortOrder(,Pla:Planning_FK02)                    ! Add the sort order for Pla:Planning_FK02 for sort order 1
  BRW7.AddRange(Pla:VerkoopID,Ver2:VerkoopID)              ! Add single value range limit for sort order 1
  BRW7.AddLocator(BRW7::Sort0:Locator)                     ! Browse has a locator for sort order 1
  BRW7::Sort0:Locator.Init(,Pla:PlanningID,,BRW7)          ! Initialize the browse locator using  using key: Pla:Planning_FK02 , Pla:PlanningID
  ?List{PROP:IconList,1} = '~off.ico'
  ?List{PROP:IconList,2} = '~on.ico'
  BRW7.AddField(Pla:ArtikelID,BRW7.Q.Pla:ArtikelID)        ! Field Pla:ArtikelID is a hot field or requires assignment from browse
  BRW7.AddField(Art:ArtikelOms,BRW7.Q.Art:ArtikelOms)      ! Field Art:ArtikelOms is a hot field or requires assignment from browse
  BRW7.AddField(Pla:KG,BRW7.Q.Pla:KG)                      ! Field Pla:KG is a hot field or requires assignment from browse
  BRW7.AddField(Pla:Pallets,BRW7.Q.Pla:Pallets)            ! Field Pla:Pallets is a hot field or requires assignment from browse
  BRW7.AddField(Pla:VerkoopKGPrijs,BRW7.Q.Pla:VerkoopKGPrijs) ! Field Pla:VerkoopKGPrijs is a hot field or requires assignment from browse
  BRW7.AddField(Loc:KostKGPrijs,BRW7.Q.Loc:KostKGPrijs)    ! Field Loc:KostKGPrijs is a hot field or requires assignment from browse
  BRW7.AddField(Pla:MutatieGemaakt,BRW7.Q.Pla:MutatieGemaakt) ! Field Pla:MutatieGemaakt is a hot field or requires assignment from browse
  BRW7.AddField(Pla:Verwerkt,BRW7.Q.Pla:Verwerkt)          ! Field Pla:Verwerkt is a hot field or requires assignment from browse
  BRW7.AddField(Pla:MutatieKG,BRW7.Q.Pla:MutatieKG)        ! Field Pla:MutatieKG is a hot field or requires assignment from browse
  BRW7.AddField(Pla:MutatiePallets,BRW7.Q.Pla:MutatiePallets) ! Field Pla:MutatiePallets is a hot field or requires assignment from browse
  BRW7.AddField(Pla:OverboekingPlanningID,BRW7.Q.Pla:OverboekingPlanningID) ! Field Pla:OverboekingPlanningID is a hot field or requires assignment from browse
  BRW7.AddField(Pla:PartijID,BRW7.Q.Pla:PartijID)          ! Field Pla:PartijID is a hot field or requires assignment from browse
  BRW7.AddField(CEL:CelOms,BRW7.Q.CEL:CelOms)              ! Field CEL:CelOms is a hot field or requires assignment from browse
  BRW7.AddField(Ver:VerpakkingOmschrijving,BRW7.Q.Ver:VerpakkingOmschrijving) ! Field Ver:VerpakkingOmschrijving is a hot field or requires assignment from browse
  BRW7.AddField(Pla:Instructie,BRW7.Q.Pla:Instructie)      ! Field Pla:Instructie is a hot field or requires assignment from browse
  BRW7.AddField(Pla:Transport,BRW7.Q.Pla:Transport)        ! Field Pla:Transport is a hot field or requires assignment from browse
  BRW7.AddField(Pla:Memo,BRW7.Q.Pla:Memo)                  ! Field Pla:Memo is a hot field or requires assignment from browse
  BRW7.AddField(Pla:ExtraKosten,BRW7.Q.Pla:ExtraKosten)    ! Field Pla:ExtraKosten is a hot field or requires assignment from browse
  BRW7.AddField(Pla:PlanningID,BRW7.Q.Pla:PlanningID)      ! Field Pla:PlanningID is a hot field or requires assignment from browse
  BRW7.AddField(Pla:VerkoopID,BRW7.Q.Pla:VerkoopID)        ! Field Pla:VerkoopID is a hot field or requires assignment from browse
  BRW7.AddField(Art:ArtikelID,BRW7.Q.Art:ArtikelID)        ! Field Art:ArtikelID is a hot field or requires assignment from browse
  BRW7.AddField(Ver:VerpakkingID,BRW7.Q.Ver:VerpakkingID)  ! Field Ver:VerpakkingID is a hot field or requires assignment from browse
  BRW7.AddField(CEL:CelID,BRW7.Q.CEL:CelID)                ! Field CEL:CelID is a hot field or requires assignment from browse
  BRW12.Q &= Queue:Browse:1
  BRW12.AddSortOrder(,Kos:PK_KostenStamgeg)                ! Add the sort order for Kos:PK_KostenStamgeg for sort order 1
  BRW12.AddLocator(BRW12::Sort0:Locator)                   ! Browse has a locator for sort order 1
  BRW12::Sort0:Locator.Init(,Kos:KostenID,,BRW12)          ! Initialize the browse locator using  using key: Kos:PK_KostenStamgeg , Kos:KostenID
  BRW12.SetFilter('(Kos:Soort=''O'' OR (Kos:Soort=''R'' AND Ver2:RedenRetour<<>''''))') ! Apply filter expression to browse
  BRW12.AddField(Kos:Omschrijving,BRW12.Q.Kos:Omschrijving) ! Field Kos:Omschrijving is a hot field or requires assignment from browse
  BRW12.AddField(Ext:Aantal,BRW12.Q.Ext:Aantal)            ! Field Ext:Aantal is a hot field or requires assignment from browse
  BRW12.AddField(Ext:Prijs,BRW12.Q.Ext:Prijs)              ! Field Ext:Prijs is a hot field or requires assignment from browse
  BRW12.AddField(Ext:ExtraKosten,BRW12.Q.Ext:ExtraKosten)  ! Field Ext:ExtraKosten is a hot field or requires assignment from browse
  BRW12.AddField(Kos:Soort,BRW12.Q.Kos:Soort)              ! Field Kos:Soort is a hot field or requires assignment from browse
  BRW12.AddField(Kos:Prijs,BRW12.Q.Kos:Prijs)              ! Field Kos:Prijs is a hot field or requires assignment from browse
  BRW12.AddField(Kos:KostenID,BRW12.Q.Kos:KostenID)        ! Field Kos:KostenID is a hot field or requires assignment from browse
  BRW12.AddField(Ver2:RedenRetour,BRW12.Q.Ver2:RedenRetour) ! Field Ver2:RedenRetour is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface)                        ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  FDCB4.Init(Loc:Firmanaam,?Loc:Firmanaam,Queue:FileDropCombo.ViewPosition,FDCB4::View:FileDropCombo,Queue:FileDropCombo,Relate:ARelatie,ThisWindow,GlobalErrors,0,0,0)
  FDCB4.RemoveDuplicatesFlag = TRUE
  FDCB4.Q &= Queue:FileDropCombo
  FDCB4.AddSortOrder(AREL:Relatie_FK01)
  FDCB4.SetFilter('arel:type=''C''')
  FDCB4.AddField(Loc:Firmanaam,FDCB4.Q.Loc:Firmanaam) !List box control field - type derived from local data
  FDCB4.AddField(AREL:Type,FDCB4.Q.AREL:Type) !Browse hot field - type derived from field
  FDCB4.AddField(AREL:LotID,FDCB4.Q.AREL:LotID) !Browse hot field - type derived from field
  FDCB4.AddField(AREL:Note,FDCB4.Q.AREL:Note) !Browse hot field - type derived from field
  FDCB4.AddField(AREL:OpenstaandSaldo,FDCB4.Q.AREL:OpenstaandSaldo) !Browse hot field - type derived from field
  FDCB4.AddField(AREL:CreditLine,FDCB4.Q.AREL:CreditLine) !Browse hot field - type derived from field
  FDCB4.AddField(AREL:DagenOud,FDCB4.Q.AREL:DagenOud) !Browse hot field - type derived from field
  FDCB4.AddField(AREL:Acc_Man,FDCB4.Q.AREL:Acc_Man) !Browse hot field - type derived from field
  FDCB4.AddUpdateField(AREL:RelatieID,Ver2:Klant)
  ThisWindow.AddItem(FDCB4.WindowComponent)
  FDCB4.DefaultFill = 0
  FDCB10.Init(RAD:Adres1,?RAD:Adres1,Queue:FileDropCombo:1.ViewPosition,FDCB10::View:FileDropCombo,Queue:FileDropCombo:1,Relate:RelatieAdres,ThisWindow,GlobalErrors,0,0,0)
  FDCB10.Q &= Queue:FileDropCombo:1
  FDCB10.AddSortOrder(RAD:RelatieID_ID_K)
  FDCB10.AddRange(RAD:RelatieID,Ver2:Klant)
  FDCB10.AddField(RAD:Adres1,FDCB10.Q.RAD:Adres1) !List box control field - type derived from field
  FDCB10.AddField(RAD:Plaats,FDCB10.Q.RAD:Plaats) !List box control field - type derived from field
  FDCB10.AddField(RAD:Postcode,FDCB10.Q.RAD:Postcode) !List box control field - type derived from field
  FDCB10.AddField(RAD:Adres2,FDCB10.Q.RAD:Adres2) !List box control field - type derived from field
  FDCB10.AddField(RAD:ID,FDCB10.Q.RAD:ID) !Primary key field - type derived from field
  FDCB10.AddUpdateField(RAD:ID,Ver2:KlantAlternatiefAdres)
  ThisWindow.AddItem(FDCB10.WindowComponent)
  FDCB10.DefaultFill = 0
  BRW7.AskProcedure = 1                                    ! Will call: UpdatePlanningVerkoop
  FDB14.Init(?DLT:Omschrijving,Queue:FileDrop.ViewPosition,FDB14::View:FileDrop,Queue:FileDrop,Relate:DeliveryTerms,ThisWindow)
  FDB14.Q &= Queue:FileDrop
  FDB14.AddSortOrder(DLT:PK_DeliveryTerms)
  FDB14.AddField(DLT:Omschrijving,FDB14.Q.DLT:Omschrijving) !List box control field - type derived from field
  FDB14.AddField(DLT:DeliveryTermsID,FDB14.Q.DLT:DeliveryTermsID) !Primary key field - type derived from field
  FDB14.AddUpdateField(DLT:DeliveryTermsID,Ver2:DeliveryTermsID)
  ThisWindow.AddItem(FDB14.WindowComponent)
  FDB14.DefaultFill = 0
  FDB15.Init(?Geb:VolledigeNaam,Queue:FileDrop:1.ViewPosition,FDB15::View:FileDrop,Queue:FileDrop:1,Relate:Gebruiker,ThisWindow)
  FDB15.Q &= Queue:FileDrop:1
  FDB15.AddSortOrder(Geb:FK1_Gebruiker)
  FDB15.SetFilter('Geb:VolledigeNaam<<>''''')
  FDB15.AddField(Geb:VolledigeNaam,FDB15.Q.Geb:VolledigeNaam) !List box control field - type derived from field
  FDB15.AddField(Geb:ID,FDB15.Q.Geb:ID) !Primary key field - type derived from field
  FDB15.AddUpdateField(Geb:ID,Ver2:GebruikerID)
  ThisWindow.AddItem(FDB15.WindowComponent)
  FDB15.DefaultFill = 0
  BRW7.AddToolbarTarget(Toolbar)                           ! Browse accepts toolbar control
  BRW12.AddToolbarTarget(Toolbar)                          ! Browse accepts toolbar control
  SELF.SetAlerts()
  NetLocalRefreshDate = today()         ! NetTalk (NetRefresh)
  NetLocalRefreshTime = clock()
  EnterByTabManager.ExcludeControl(?Cancel)
  EnterByTabManager.ExcludeControl(?OK)
  EnterByTabManager.Init(False)
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:AMutatie.Close
    Relate:APlanning.Close
    Relate:ARelatie.Close
    Relate:AVerkoop.Close
    Relate:DeliveryTerms.Close
    Relate:ExtraKosten.Close
    Relate:Gebruiker.Close
    Relate:Inkoop.Close
    Relate:KostenStamgeg.Close
    Relate:Mutatie.Close
    Relate:Partij.Close
    Relate:RelatieAdres.Close
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.PrimeUpdate PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.PrimeUpdate()
  !   If returnValue = Level:Fatal  ! delete just occured
  !     db.Debugout('ThisNetRefresh.Send(|Verkoop|ARelatie|RelatieAdres|Planning|Planning|') ! NetTalk (NetRefresh)
  !   End
      
        
    If returnValue = Level:Fatal  ! delete just occured
      ThisNetRefresh.Send('|') ! NetTalk (NetRefresh)
    End
   	If returnValue = Level:Fatal  ! delete just occured
   		NetRefreshPlanningViews()
   	End
  RETURN ReturnValue


ThisWindow.Reset PROCEDURE(BYTE Force=0)

  CODE
  SELF.ForcedReset += Force
  IF QuickWindow{Prop:AcceptAll} THEN RETURN.
  AAARel:RelatieID = Ver2:Klant                            ! Assign linking field value
  Access:AAARelatie.Fetch(AAARel:Relatie_PK)
    NetLocalRefreshDate = today()         ! NetTalk (NetRefresh)
    NetLocalRefreshTime = clock()
  PARENT.Reset(Force)


ThisWindow.Run PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  IF GlobalRequest=DeleteRecord
  	IF Ver2:Verwerkt THEN
  		!MESSAGE('Verkoop is verwerkt en kan niet worden verwijderd.')
  		!RETURN ReturnValue
  	.
  	
  	Verwerkt# = false
  	NoRecord# = true
  	Pla:VerkoopID = Ver2:VerkoopID
  	CLEAR(Pla:PlanningID,-1)
  	SET(Pla:Planning_FK02,Pla:Planning_FK02)
  	LOOP
  		Access:Planning.TryNext()
  		IF ERROR() THEN BREAK.
  		
  		IF Pla:VerkoopID <> Ver2:VerkoopID THEN BREAK.
  		
  		NoRecord# = false
  		
  		IF Pla:Verwerkt THEN
  			Verwerkt# = true
  			BREAK
  		.
  	.
  	
  	IF Verwerkt# THEN
  		!MESSAGE('Verkoopregels zijn verwerkt en de verkoop kan daardoor niet verwijderd worden.')
  		!RETURN ReturnValue
  	END
  END
  
  ReturnValue = PARENT.Run()
  IF SELF.Request = ViewRecord                             ! In View Only mode always signal RequestCancelled
    ReturnValue = RequestCancelled
  END
  RETURN ReturnValue


ThisWindow.Run PROCEDURE(USHORT Number,BYTE Request)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Run(Number,Request)
  SAVAREL:Record = AREL:Record
  DB.Debugout('Voor de update')
  ! Als de Status op View dan moet de UpdatePlanningInkoop ook in View mode geopend worden
    IF SELF.Request = ViewRecord      
        GlobalRequest = ViewRecord
        UpdatePlanningVerkoop
        ReturnValue = GlobalResponse
    END
  IF SELF.Request = ViewRecord
    ReturnValue = RequestCancelled                         ! Always return RequestCancelled if the form was opened in ViewRecord mode
  ELSE
    GlobalRequest = Request
    UpdatePlanningVerkoop
    ReturnValue = GlobalResponse
  END
  DB.Debugout('Erna de update')
  AREL:Record=SAVAREL:Record
  		Ver2:Klant = AREL:RelatieID
  		FDCB4.ResetQueue(True)
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
    OF ?VoegToeAdres
      Clear(RAD:Record)
      RAD:RelatieID=Ver2:Klant
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?Loc:Firmanaam
      IF Arel:Note=''
          ?Note{PROP:Icon}=ICON:None
          Hide(?Note)
      ELSE
          ?Note{PROP:Icon}=ICON:Tick
          UnHide(?Note)
      END
      ! vertegenwoordiger uit de relatie halen
      IF AREL:Acc_Man<>0 AND 0{PROP:AcceptAll}=FALSE
          Clear(Geb:Record)
          GEB:Res_id=AREL:Acc_Man
          IF Access:Gebruiker.Fetch(Geb:FK2_Gebruiker)=Level:Benign
              Ver2:GebruikerID=Geb:ID
              FDB15.ResetQueue(false)
          END
      END
      Do BepaaldNogTefactureren
    OF ?LookupButton
      ThisWindow.Update()
      GlobalRequest = SelectRecord
      SelectArelatie('C')
      ThisWindow.Reset
      	if globalresponse=RequestCompleted
      		Ver2:Klant = AREL:RelatieID
              IF Arel:Note=''
                  ?Note{PROP:Icon}=ICON:None
                  Hide(?Note)
              ELSE
                  ?Note{PROP:Icon}=ICON:Tick
                  UnHide(?Note)
              END
      		FDCB4.ResetQueue(True)
      	END
      		
    OF ?Note
      ThisWindow.Update()
          Message(AREL:Note,'Notitie')
    OF ?BtnRetour
      ThisWindow.Update()
          Loc:RedenRetour=Ver2:RedenRetour
          Loc:RetourDatum=Ver2:RetourDatum_DATE
          IF WindowRedenRetour('Verkoop',Ver2:VerkoopID,Loc:RedenRetour,Loc:RetourDatum ) = RequestCompleted
              Ver2:RedenRetour=Loc:RedenRetour
              Ver2:RetourDatum_DATE=Loc:RetourDatum
              
              ?BtnRetour{Prop:Text}='Retour reden:'&Ver2:RedenRetour&' '&Format(Ver2:RetourDatum_DATE,@d5-)
             ! DISABLE(?BtnRetour)
            BRW7.ResetQueue(FALSE)
        END      
    OF ?BTNNegatieveOrder
      ThisWindow.Update()
          Ver2:NegatieveOrder=Format(TODAY(),@d5-)&' '&Format(Clock(),@T4)&' '&IGB:WindowsInlog
    OF ?Calendar
      ThisWindow.Update()
      Calendar8.SelectOnClose = True
      Calendar8.Ask('Select a Date',Ver2:Planning_DATE)
      IF Calendar8.Response = RequestCompleted THEN
      Ver2:Planning_DATE=Calendar8.SelectedDate
      DISPLAY(?Ver2:Planning_DATE:2)
      END
      ThisWindow.Reset(True)
    OF ?VoegToeAdres
      ThisWindow.Update()
      GlobalRequest = InsertRecord
      UpdateRelatieAdres()
      ThisWindow.Reset
        IF 0{PROP:AcceptAll}=FALSE 
            FDCB10.ResetQueue(True)
            Select(?RAD:Adres1)
        END
        
    OF ?OK
      ThisWindow.Update()
      IF SELF.Request = ViewRecord AND NOT SELF.BatchProcessing THEN
         POST(EVENT:CloseWindow)
      END
    END
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue


ThisWindow.TakeCloseEvent PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
      ! op het aller laatste moment controleren of dit een negatieve order is
      ! Voor de parent gezet anders raken we header kwijt
      IF LocalClass.NegatieveOrder() = TRUE AND Ver2:NegatieveOrder=''
          ! je mag het scherm niet sluiten
          Message('Er zijn negatieve orderregels!. Bevestig dit anders kan dit scherm niet gesloten worden','Negatieve order',ICON:Question)
          Return Level:Notify
      END
  ReturnValue = PARENT.TakeCloseEvent()
  RETURN ReturnValue


ThisWindow.TakeCompleted PROCEDURE

ReturnValue          BYTE,AUTO

Looped BYTE
  CODE
  LOOP
    IF Looped
      RETURN Level:Notify
    ELSE
      Looped = 1
    END
  IF Ver2:Planning_DATE = 0 THEN
      Ver2:Planning_TIME = 0
  END
  ReturnValue = PARENT.TakeCompleted()
  DO UpdateVerwerkStatus
    ThisNetRefresh.Send('|') ! NetTalk (NetRefresh)
  NetRefreshPlanningViews()
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue


ThisWindow.TakeEvent PROCEDURE

ReturnValue          BYTE,AUTO

Looped BYTE
  CODE
    If ThisNetRefresh.NeedReset(NetLocalRefreshDate,NetLocalRefreshTime,NetLocalDependancies) ! NetTalk (NetRefresh)
      Self.Reset(1)                      ! NetTalk (NetRefresh)
    End
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
  CASE FIELD()
  OF ?ListExtraKosten
    CASE EVENT()
    OF EVENT:PreAlertKey
      IF KeyCODE()=MouseLeft2
          CYCLE
      END
    END
  END
  ReturnValue = PARENT.TakeFieldEvent()
  IF 0{PROP:AcceptAll}=FALSE THEN LocalClass.NegatieveOrder().
  CASE FIELD()
  OF ?ListExtraKosten
    CASE EVENT()
    OF EVENT:AlertKey
      IF KeyCODE()=MouseLeft2
          Rij#=?ListExtraKosten{PROPLIST:MouseDownRow}
          GET(BRW12.Q,Rij#)
          IF NOT ERROR()
              Clear(Ext:Record)
              Ext:VerkoopID=Ver2:VerkoopID
              Ext:KostenID=BRW12.Q.Kos:KostenID
              IF Access:ExtraKosten.Fetch(Ext:FK1_ExtraKosten)
                  Access:ExtraKosten.PrimeRecord()
                  Ext:VerkoopID=Ver2:VerkoopID
                  Ext:KostenID=BRW12.Q.Kos:KostenID
                  Ext:Prijs=BRW12.Q.Ext:Prijs
                  Access:ExtraKosten.Insert()
                  Clear(Ext:Record)
                  Ext:VerkoopID=Ver2:VerkoopID
                  Ext:KostenID=BRW12.Q.Kos:KostenID
                  Access:ExtraKosten.Fetch(Ext:FK1_ExtraKosten)
              END
              GlobalRequest=ChangeRecord
              UpdateExtraKosten
              BRW12.ResetFromView()
              BRW12.ResetQueue(True)
              BRW7.ResetFromView()
              BRW7.ResetQueue(True)
          END
          CYCLE
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

LocalClass.NegatieveOrder   Procedure
negatieveorder          Byte
CODE
    negatieveorder = FALSE
    Loop i#=1 to records(BRW7.q)
        GET(BRW7.Q,i#)
        IF BRW7.q.Loc:KostKGPrijs > BRW7.q.Pla:VerkoopKGPrijs
            negatieveorder = TRUE
        END
    END
    IF negatieveorder
        ?BTNNegatieveOrder{Prop:Hide}=false
    ELSE    
        ?BTNNegatieveOrder{Prop:Hide}=true
    END
    if Ver2:NegatieveOrder=''
        ?BTNNegatieveOrder{Prop:Icon}=ICON:Cross
    ELSE    
        ?BTNNegatieveOrder{Prop:Icon}=ICON:Tick
    END    
    
    IF AREL:OpenstaandSaldo > AREL:CreditLine
        ?Waarschuwing{Prop:Icon}=ICON:Cross
    ELSE    
        ?Waarschuwing{Prop:Icon}=icon:None
    END 
    IF AREL:DagenOud>30
        ?AREL:OpenstaandSaldo{PROP:Color} = COLOR:Red
        ?AREL:OpenstaandSaldo{PROP:ToolTip} = 'De oudste post is  '&AREL:DagenOud&' dagen oud'
    ELSE        
        ?AREL:OpenstaandSaldo{PROP:Color} = COLOR:None
        ?AREL:OpenstaandSaldo{PROP:ToolTip} = ''
    END
    IF Arel:Note=''
        ?Note{PROP:Icon}=ICON:None
        Hide(?Note)
    ELSE
        ?Note{PROP:Icon}=ICON:Tick
        UnHide(?Note)
    END
    
    
    DISPLAY(?Waarschuwing)
    Return negatieveorder
                    

FDCB4.SetQueueRecord PROCEDURE

  CODE
  	i#=INSTRING('<39>',AREL:FirmaNaam,1,1)
  	IF i#
  		Loc:Firmanaam = Sub(AREL:FirmaNaam,1,i#-1)&SUB(AREL:FirmaNaam,i#+1,51)
  	ELSE
  		Loc:Firmanaam = AREL:FirmaNaam
  	END	
  PARENT.SetQueueRecord
  


BRW7.Ask PROCEDURE(BYTE Request)

ReturnValue          BYTE,AUTO

  CODE
  IF Request = ChangeRecord AND Pla:MutatieGemaakt THEN
      !Request = ViewRecord
  ELSIF Request = DeleteRecord AND Pla:MutatieGemaakt THEN
      MESSAGE('Geplande verkoopregel is al uitgevoerd. Kan dus niet meer verwijderd worden. Draait eerst de mutaties terug.', 'Al uitgevoerd', ICON:Exclamation)
      RETURN Level:Benign
  END
  ReturnValue = PARENT.Ask(Request)
  RETURN ReturnValue


BRW7.Fetch PROCEDURE(BYTE Direction)

GreenBarIndex   LONG,AUTO
  CODE
  PARENT.Fetch(Direction)
  !----------------------------------------------------------------------
    LOOP GreenBarIndex=1 TO RECORDS(SELF.Q)
      GET(SELF.Q,GreenBarIndex)
      SELF.Q.Pla:ArtikelID_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for Pla:ArtikelID
      SELF.Q.Pla:ArtikelID_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.Pla:ArtikelID_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla:ArtikelID_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Art:ArtikelOms_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for Art:ArtikelOms
      SELF.Q.Art:ArtikelOms_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.Art:ArtikelOms_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Art:ArtikelOms_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla:KG_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for Pla:KG
      SELF.Q.Pla:KG_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.Pla:KG_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla:KG_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla:Pallets_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for Pla:Pallets
      SELF.Q.Pla:Pallets_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.Pla:Pallets_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla:Pallets_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla:VerkoopKGPrijs_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for Pla:VerkoopKGPrijs
      SELF.Q.Pla:VerkoopKGPrijs_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.Pla:VerkoopKGPrijs_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla:VerkoopKGPrijs_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Loc:KostKGPrijs_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for Loc:KostKGPrijs
      SELF.Q.Loc:KostKGPrijs_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.Loc:KostKGPrijs_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Loc:KostKGPrijs_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla:MutatieGemaakt_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for Pla:MutatieGemaakt
      SELF.Q.Pla:MutatieGemaakt_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.Pla:MutatieGemaakt_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla:MutatieGemaakt_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla:Verwerkt_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for Pla:Verwerkt
      SELF.Q.Pla:Verwerkt_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.Pla:Verwerkt_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla:Verwerkt_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla:MutatieKG_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for Pla:MutatieKG
      SELF.Q.Pla:MutatieKG_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.Pla:MutatieKG_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla:MutatieKG_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla:MutatiePallets_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for Pla:MutatiePallets
      SELF.Q.Pla:MutatiePallets_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.Pla:MutatiePallets_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla:MutatiePallets_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla:OverboekingPlanningID_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for Pla:OverboekingPlanningID
      SELF.Q.Pla:OverboekingPlanningID_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.Pla:OverboekingPlanningID_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla:OverboekingPlanningID_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla:PartijID_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for Pla:PartijID
      SELF.Q.Pla:PartijID_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.Pla:PartijID_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla:PartijID_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.CEL:CelOms_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for CEL:CelOms
      SELF.Q.CEL:CelOms_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.CEL:CelOms_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.CEL:CelOms_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Ver:VerpakkingOmschrijving_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for Ver:VerpakkingOmschrijving
      SELF.Q.Ver:VerpakkingOmschrijving_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.Ver:VerpakkingOmschrijving_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Ver:VerpakkingOmschrijving_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla:Instructie_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for Pla:Instructie
      SELF.Q.Pla:Instructie_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.Pla:Instructie_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla:Instructie_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla:Transport_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for Pla:Transport
      SELF.Q.Pla:Transport_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.Pla:Transport_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla:Transport_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla:Memo_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for Pla:Memo
      SELF.Q.Pla:Memo_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.Pla:Memo_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Pla:Memo_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      PUT(SELF.Q)
    END
  !----------------------------------------------------------------------
  LOOP GreenBarIndex=1 TO RECORDS(SELF.Q)
      GET(SELF.Q,GreenBarIndex)
      IF (SELF.Q.Loc:KostKGPrijs > SELF.Q.Pla:VerkoopKGPrijs)
          SELF.Q.Loc:KostKGPrijs_NormalBG   = Color:Red
          SELF.Q.Loc:KostKGPrijs_SelectedBG   = Color:Red
          PUT(SELF.Q)
      END    
  END
                


BRW7.Init PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)

  CODE
  PARENT.Init(ListBox,Posit,V,Q,RM,WM)
  IF WM.Request <> ViewRecord                              ! If called for anything other than ViewMode, make the insert, change & delete controls available
    SELF.InsertControl=?Insert
    SELF.ChangeControl=?Change
    SELF.DeleteControl=?Delete
  END
  SELF.ViewControl = ?View                                 ! Setup the control used to initiate view only mode


BRW7.ResetFromView PROCEDURE

Loc:TotaalKG:Sum     REAL                                  ! Sum variable for browse totals
  CODE
  SETCURSOR(Cursor:Wait)
  Relate:Planning.SetQuickScan(1)
  SELF.Reset
  IF SELF.UseMRP
     IF SELF.View{PROP:IPRequestCount} = 0
          SELF.View{PROP:IPRequestCount} = 60
     END
  END
  LOOP
    IF SELF.UseMRP
       IF SELF.View{PROP:IPRequestCount} = 0
            SELF.View{PROP:IPRequestCount} = 60
       END
    END
    CASE SELF.Next()
    OF Level:Notify
      BREAK
    OF Level:Fatal
      SETCURSOR()
      RETURN
    END
    SELF.SetQueueRecord
    Loc:TotaalKG:Sum += Pla:KG
  END
  SELF.View{PROP:IPRequestCount} = 0
  Loc:TotaalKG = Loc:TotaalKG:Sum
  PARENT.ResetFromView
  Relate:Planning.SetQuickScan(0)
  SETCURSOR()


BRW7.SetQueueRecord PROCEDURE

  CODE
  PARENT.SetQueueRecord
  
  IF (Pla:MutatieGemaakt)
    SELF.Q.Pla:MutatieGemaakt_Icon = 2                     ! Set icon from icon list
  ELSE
    SELF.Q.Pla:MutatieGemaakt_Icon = 1                     ! Set icon from icon list
  END
  IF (Pla:Verwerkt)
    SELF.Q.Pla:Verwerkt_Icon = 2                           ! Set icon from icon list
  ELSE
    SELF.Q.Pla:Verwerkt_Icon = 1                           ! Set icon from icon list
  END
  IF (Pla:OverboekingPlanningID > 0)
    SELF.Q.Pla:OverboekingPlanningID_Icon = 2              ! Set icon from icon list
  ELSE
    SELF.Q.Pla:OverboekingPlanningID_Icon = 1              ! Set icon from icon list
  END
  !----------------------------------------------------------------------
      SELF.Q.Pla:ArtikelID_NormalFG   = CHOOSE(CHOICE(?List) % 2,-1,-1) ! Set color values for Pla:ArtikelID
      SELF.Q.Pla:ArtikelID_NormalBG   = CHOOSE(CHOICE(?List) % 2,-1,8454143)
      SELF.Q.Pla:ArtikelID_SelectedFG = CHOOSE(CHOICE(?List) % 2,-1,-1)
      SELF.Q.Pla:ArtikelID_SelectedBG = CHOOSE(CHOICE(?List) % 2,-1,-1)
      SELF.Q.Art:ArtikelOms_NormalFG   = CHOOSE(CHOICE(?List) % 2,-1,-1) ! Set color values for Art:ArtikelOms
      SELF.Q.Art:ArtikelOms_NormalBG   = CHOOSE(CHOICE(?List) % 2,-1,8454143)
      SELF.Q.Art:ArtikelOms_SelectedFG = CHOOSE(CHOICE(?List) % 2,-1,-1)
      SELF.Q.Art:ArtikelOms_SelectedBG = CHOOSE(CHOICE(?List) % 2,-1,-1)
      SELF.Q.Pla:KG_NormalFG   = CHOOSE(CHOICE(?List) % 2,-1,-1) ! Set color values for Pla:KG
      SELF.Q.Pla:KG_NormalBG   = CHOOSE(CHOICE(?List) % 2,-1,8454143)
      SELF.Q.Pla:KG_SelectedFG = CHOOSE(CHOICE(?List) % 2,-1,-1)
      SELF.Q.Pla:KG_SelectedBG = CHOOSE(CHOICE(?List) % 2,-1,-1)
      SELF.Q.Pla:Pallets_NormalFG   = CHOOSE(CHOICE(?List) % 2,-1,-1) ! Set color values for Pla:Pallets
      SELF.Q.Pla:Pallets_NormalBG   = CHOOSE(CHOICE(?List) % 2,-1,8454143)
      SELF.Q.Pla:Pallets_SelectedFG = CHOOSE(CHOICE(?List) % 2,-1,-1)
      SELF.Q.Pla:Pallets_SelectedBG = CHOOSE(CHOICE(?List) % 2,-1,-1)
      SELF.Q.Pla:VerkoopKGPrijs_NormalFG   = CHOOSE(CHOICE(?List) % 2,-1,-1) ! Set color values for Pla:VerkoopKGPrijs
      SELF.Q.Pla:VerkoopKGPrijs_NormalBG   = CHOOSE(CHOICE(?List) % 2,-1,8454143)
      SELF.Q.Pla:VerkoopKGPrijs_SelectedFG = CHOOSE(CHOICE(?List) % 2,-1,-1)
      SELF.Q.Pla:VerkoopKGPrijs_SelectedBG = CHOOSE(CHOICE(?List) % 2,-1,-1)
      SELF.Q.Loc:KostKGPrijs_NormalFG   = CHOOSE(CHOICE(?List) % 2,-1,-1) ! Set color values for Loc:KostKGPrijs
      SELF.Q.Loc:KostKGPrijs_NormalBG   = CHOOSE(CHOICE(?List) % 2,-1,8454143)
      SELF.Q.Loc:KostKGPrijs_SelectedFG = CHOOSE(CHOICE(?List) % 2,-1,-1)
      SELF.Q.Loc:KostKGPrijs_SelectedBG = CHOOSE(CHOICE(?List) % 2,-1,-1)
      SELF.Q.Pla:MutatieGemaakt_NormalFG   = CHOOSE(CHOICE(?List) % 2,-1,-1) ! Set color values for Pla:MutatieGemaakt
      SELF.Q.Pla:MutatieGemaakt_NormalBG   = CHOOSE(CHOICE(?List) % 2,-1,8454143)
      SELF.Q.Pla:MutatieGemaakt_SelectedFG = CHOOSE(CHOICE(?List) % 2,-1,-1)
      SELF.Q.Pla:MutatieGemaakt_SelectedBG = CHOOSE(CHOICE(?List) % 2,-1,-1)
      SELF.Q.Pla:Verwerkt_NormalFG   = CHOOSE(CHOICE(?List) % 2,-1,-1) ! Set color values for Pla:Verwerkt
      SELF.Q.Pla:Verwerkt_NormalBG   = CHOOSE(CHOICE(?List) % 2,-1,8454143)
      SELF.Q.Pla:Verwerkt_SelectedFG = CHOOSE(CHOICE(?List) % 2,-1,-1)
      SELF.Q.Pla:Verwerkt_SelectedBG = CHOOSE(CHOICE(?List) % 2,-1,-1)
      SELF.Q.Pla:MutatieKG_NormalFG   = CHOOSE(CHOICE(?List) % 2,-1,-1) ! Set color values for Pla:MutatieKG
      SELF.Q.Pla:MutatieKG_NormalBG   = CHOOSE(CHOICE(?List) % 2,-1,8454143)
      SELF.Q.Pla:MutatieKG_SelectedFG = CHOOSE(CHOICE(?List) % 2,-1,-1)
      SELF.Q.Pla:MutatieKG_SelectedBG = CHOOSE(CHOICE(?List) % 2,-1,-1)
      SELF.Q.Pla:MutatiePallets_NormalFG   = CHOOSE(CHOICE(?List) % 2,-1,-1) ! Set color values for Pla:MutatiePallets
      SELF.Q.Pla:MutatiePallets_NormalBG   = CHOOSE(CHOICE(?List) % 2,-1,8454143)
      SELF.Q.Pla:MutatiePallets_SelectedFG = CHOOSE(CHOICE(?List) % 2,-1,-1)
      SELF.Q.Pla:MutatiePallets_SelectedBG = CHOOSE(CHOICE(?List) % 2,-1,-1)
      SELF.Q.Pla:OverboekingPlanningID_NormalFG   = CHOOSE(CHOICE(?List) % 2,-1,-1) ! Set color values for Pla:OverboekingPlanningID
      SELF.Q.Pla:OverboekingPlanningID_NormalBG   = CHOOSE(CHOICE(?List) % 2,-1,8454143)
      SELF.Q.Pla:OverboekingPlanningID_SelectedFG = CHOOSE(CHOICE(?List) % 2,-1,-1)
      SELF.Q.Pla:OverboekingPlanningID_SelectedBG = CHOOSE(CHOICE(?List) % 2,-1,-1)
      SELF.Q.Pla:PartijID_NormalFG   = CHOOSE(CHOICE(?List) % 2,-1,-1) ! Set color values for Pla:PartijID
      SELF.Q.Pla:PartijID_NormalBG   = CHOOSE(CHOICE(?List) % 2,-1,8454143)
      SELF.Q.Pla:PartijID_SelectedFG = CHOOSE(CHOICE(?List) % 2,-1,-1)
      SELF.Q.Pla:PartijID_SelectedBG = CHOOSE(CHOICE(?List) % 2,-1,-1)
      SELF.Q.CEL:CelOms_NormalFG   = CHOOSE(CHOICE(?List) % 2,-1,-1) ! Set color values for CEL:CelOms
      SELF.Q.CEL:CelOms_NormalBG   = CHOOSE(CHOICE(?List) % 2,-1,8454143)
      SELF.Q.CEL:CelOms_SelectedFG = CHOOSE(CHOICE(?List) % 2,-1,-1)
      SELF.Q.CEL:CelOms_SelectedBG = CHOOSE(CHOICE(?List) % 2,-1,-1)
      SELF.Q.Ver:VerpakkingOmschrijving_NormalFG   = CHOOSE(CHOICE(?List) % 2,-1,-1) ! Set color values for Ver:VerpakkingOmschrijving
      SELF.Q.Ver:VerpakkingOmschrijving_NormalBG   = CHOOSE(CHOICE(?List) % 2,-1,8454143)
      SELF.Q.Ver:VerpakkingOmschrijving_SelectedFG = CHOOSE(CHOICE(?List) % 2,-1,-1)
      SELF.Q.Ver:VerpakkingOmschrijving_SelectedBG = CHOOSE(CHOICE(?List) % 2,-1,-1)
      SELF.Q.Pla:Instructie_NormalFG   = CHOOSE(CHOICE(?List) % 2,-1,-1) ! Set color values for Pla:Instructie
      SELF.Q.Pla:Instructie_NormalBG   = CHOOSE(CHOICE(?List) % 2,-1,8454143)
      SELF.Q.Pla:Instructie_SelectedFG = CHOOSE(CHOICE(?List) % 2,-1,-1)
      SELF.Q.Pla:Instructie_SelectedBG = CHOOSE(CHOICE(?List) % 2,-1,-1)
      SELF.Q.Pla:Transport_NormalFG   = CHOOSE(CHOICE(?List) % 2,-1,-1) ! Set color values for Pla:Transport
      SELF.Q.Pla:Transport_NormalBG   = CHOOSE(CHOICE(?List) % 2,-1,8454143)
      SELF.Q.Pla:Transport_SelectedFG = CHOOSE(CHOICE(?List) % 2,-1,-1)
      SELF.Q.Pla:Transport_SelectedBG = CHOOSE(CHOICE(?List) % 2,-1,-1)
      SELF.Q.Pla:Memo_NormalFG   = CHOOSE(CHOICE(?List) % 2,-1,-1) ! Set color values for Pla:Memo
      SELF.Q.Pla:Memo_NormalBG   = CHOOSE(CHOICE(?List) % 2,-1,8454143)
      SELF.Q.Pla:Memo_SelectedFG = CHOOSE(CHOICE(?List) % 2,-1,-1)
      SELF.Q.Pla:Memo_SelectedBG = CHOOSE(CHOICE(?List) % 2,-1,-1)
  !----------------------------------------------------------------------
      ! Kostprijs hier berekenen
  Clear(Par:Record)
  Par:PartijID=SELF.Q.Pla:PartijID
  Access:Partij.Fetch(Par:Partij_PK)
  !Loc:KostKGPrijs = Par:BerekendeInkoopKGPrijs 
  !IF (SELF.Q.Pla:KG <>0)
  !    Loc:KostKGPrijs += (SELF.q.Pla:ExtraKosten / SELF.Q.Pla:KG)
  !END
  !IF (Loc:TotaalKG<>0)
  !    Loc:KostKGPrijs += (Loc:ExtraKosten / Loc:TotaalKG)
  !END
  SELF.Q.Loc:KostKGPrijs = Par:BerekendeInkoopKGPrijs 
  IF (SELF.Q.Pla:KG <>0)
      SELF.Q.Loc:KostKGPrijs += (SELF.q.Pla:ExtraKosten / SELF.Q.Pla:KG)
  END
  IF (Loc:TotaalKG<>0)
      SELF.Q.Loc:KostKGPrijs += (Loc:ExtraKosten / Loc:TotaalKG)
  END
      
  ! extra kosten meenemen
  
  !  IF SELF.Q.Pla:VerkoopKGPrijs < SELF.Q.Loc:KostKGPrijs
  !      ! VERKOOPPRIJS ROOD MAKEN
  !      DB.Debugout(SELF.Q.Pla:VerkoopKGPrijs&' < '&SELF.Q.Loc:KostKGPrijs)
  !      SELF.Q.Pla:VerkoopKGPrijs_NormalBG=Color:Red
  !        SELF.Q.Pla:VerkoopKGPrijs_SelectedBG=Color:Red
  !  END
  ! extra kosten kleuren
  IF SELF.Q.Pla:VerkoopKGPrijs < SELF.Q.Loc:KostKGPrijs
      ! VERKOOPPRIJS ROOD MAKEN
      DB.Debugout(SELF.Q.Pla:VerkoopKGPrijs&' < '&SELF.Q.Loc:KostKGPrijs)
      SELF.Q.Pla:VerkoopKGPrijs_NormalBG=Color:Red
      SELF.Q.Pla:VerkoopKGPrijs_SelectedBG=Color:Red
      
  END


BRW12.ResetFromView PROCEDURE

Loc:ExtraKosten:Sum  REAL                                  ! Sum variable for browse totals
  CODE
  SETCURSOR(Cursor:Wait)
  Relate:KostenStamgeg.SetQuickScan(1)
  SELF.Reset
  IF SELF.UseMRP
     IF SELF.View{PROP:IPRequestCount} = 0
          SELF.View{PROP:IPRequestCount} = 60
     END
  END
  LOOP
    IF SELF.UseMRP
       IF SELF.View{PROP:IPRequestCount} = 0
            SELF.View{PROP:IPRequestCount} = 60
       END
    END
    CASE SELF.Next()
    OF Level:Notify
      BREAK
    OF Level:Fatal
      SETCURSOR()
      RETURN
    END
    SELF.SetQueueRecord
    Loc:ExtraKosten:Sum += Ext:ExtraKosten
  END
  SELF.View{PROP:IPRequestCount} = 0
  Loc:ExtraKosten = Loc:ExtraKosten:Sum
  PARENT.ResetFromView
  Relate:KostenStamgeg.SetQuickScan(0)
  SETCURSOR()


BRW12.SetQueueRecord PROCEDURE

  CODE
      ! als bij de kostengege de prijs is ingevoerd deze hier overnemen
  Clear(Ext:Record)
  Ext:VerkoopID=Ver2:VerkoopID
  Ext:KostenID=Kos:KostenID
  IF Access:ExtraKosten.Fetch(Ext:FK1_ExtraKosten)
      Ext:Prijs=Kos:Prijs
  ELSE
      ! dan laat hij het sowiesow goed zien
  END
  PARENT.SetQueueRecord
  


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window
  SELF.SetStrategy(?Ink:Leverancier:Prompt, Resize:FixLeft+Resize:FixTop, Resize:LockSize) ! Override strategy for ?Ink:Leverancier:Prompt
  SELF.SetStrategy(?RAD:Adres1, Resize:FixLeft+Resize:FixTop, Resize:LockSize) ! Override strategy for ?RAD:Adres1
  SELF.SetStrategy(?Ver2:Planning_DATE:Prompt, Resize:FixLeft+Resize:FixTop, Resize:LockSize) ! Override strategy for ?Ver2:Planning_DATE:Prompt
  SELF.SetStrategy(?Ver2:Planning_DATE:2, Resize:FixLeft+Resize:FixTop, Resize:LockSize) ! Override strategy for ?Ver2:Planning_DATE:2
  SELF.SetStrategy(?Calendar, Resize:FixLeft+Resize:FixTop, Resize:LockSize) ! Override strategy for ?Calendar
  SELF.SetStrategy(?Ink:Planning_TIME:Prompt, Resize:FixLeft+Resize:FixTop, Resize:LockSize) ! Override strategy for ?Ink:Planning_TIME:Prompt
  SELF.SetStrategy(?Ver2:Planning_TIME, Resize:FixLeft+Resize:FixTop, Resize:LockSize) ! Override strategy for ?Ver2:Planning_TIME
  SELF.SetStrategy(?Ink:Instructie:Prompt, Resize:FixLeft+Resize:FixTop, Resize:LockSize) ! Override strategy for ?Ink:Instructie:Prompt
  SELF.SetStrategy(?Ver2:Instructie, Resize:FixLeft+Resize:FixTop, Resize:LockSize) ! Override strategy for ?Ver2:Instructie
  SELF.SetStrategy(?Ink:Transport:Prompt, Resize:FixLeft+Resize:FixTop, Resize:LockSize) ! Override strategy for ?Ink:Transport:Prompt
  SELF.SetStrategy(?Ver2:Transport, Resize:FixLeft+Resize:FixTop, Resize:LockSize) ! Override strategy for ?Ver2:Transport
  SELF.SetStrategy(?Ver2:Verwerkt, Resize:FixRight+Resize:FixTop, Resize:LockSize) ! Override strategy for ?Ver2:Verwerkt
  SELF.SetStrategy(?List, Resize:FixLeft+Resize:FixTop, Resize:ConstantRight) ! Override strategy for ?List
  SELF.SetStrategy(?Insert, Resize:FixRight+Resize:FixBottom, Resize:LockSize) ! Override strategy for ?Insert
  SELF.SetStrategy(?Change, Resize:FixRight+Resize:FixBottom, Resize:LockSize) ! Override strategy for ?Change
  SELF.SetStrategy(?Delete, Resize:FixRight+Resize:FixBottom, Resize:LockSize) ! Override strategy for ?Delete
  SELF.SetStrategy(?PROMPT1, Resize:FixLeft+Resize:FixTop, Resize:LockSize) ! Override strategy for ?PROMPT1
  SELF.SetStrategy(?Ver2:ExternVerkoopID:Prompt, Resize:FixLeft+Resize:FixTop, Resize:LockSize) ! Override strategy for ?Ver2:ExternVerkoopID:Prompt
  SELF.SetStrategy(?Ver2:ExternVerkoopID, Resize:FixLeft+Resize:FixTop, Resize:LockSize) ! Override strategy for ?Ver2:ExternVerkoopID
  SELF.SetStrategy(?Ver2:ExtraKosten:Prompt, Resize:FixLeft+Resize:FixTop, Resize:LockSize) ! Override strategy for ?Ver2:ExtraKosten:Prompt
  SELF.SetStrategy(?Ver2:ExtraKostenTekst, Resize:FixLeft+Resize:FixTop, Resize:LockSize) ! Override strategy for ?Ver2:ExtraKostenTekst
  SELF.SetStrategy(?OK, Resize:FixRight+Resize:FixBottom, Resize:LockSize) ! Override strategy for ?OK
  SELF.SetStrategy(?Cancel, Resize:FixRight+Resize:FixBottom, Resize:LockSize) ! Override strategy for ?Cancel
  SELF.SetStrategy(?ListExtraKosten, Resize:FixLeft+Resize:FixTop, Resize:LockHeight) ! Override strategy for ?ListExtraKosten
  SELF.SetStrategy(?BTNNegatieveOrder, Resize:FixLeft+Resize:FixTop, Resize:LockSize) ! Override strategy for ?BTNNegatieveOrder

!!! <summary>
!!! Generated from procedure template - Window
!!! Form ExtraKosten
!!! </summary>
UpdateExtraKosten PROCEDURE 

CurrentTab           STRING(80)                            ! 
ActionMessage        CSTRING(40)                           ! 
LocEnableEnterByTab  BYTE(1)                               !Used by the ENTER Instead of Tab template
EnterByTabManager    EnterByTabClass
History::Ext:Record  LIKE(Ext:RECORD),THREAD
QuickWindow          WINDOW('Form ExtraKosten'),AT(,,244,154),FONT('Microsoft Sans Serif',8,,FONT:regular,CHARSET:DEFAULT), |
  RESIZE,CENTER,GRAY,IMM,MDI,HLP('UpdateExtraKosten'),SYSTEM
                       SHEET,AT(4,4,231,128),USE(?CurrentTab)
                         TAB('&1) General'),USE(?Tab:1)
                           PROMPT('Extra Kosten ID:'),AT(8,20),USE(?Ext:ExtraKostenID:Prompt),TRN
                           ENTRY(@n-14),AT(76,20,64,10),USE(Ext:ExtraKostenID),COLOR(COLOR:Silver),DISABLE
                           PROMPT('Aantal:'),AT(8,47),USE(?Ext:Aantal:Prompt),TRN
                           ENTRY(@n12_`2),AT(76,47,64,10),USE(Ext:Aantal),RIGHT
                           PROMPT('Prijs:'),AT(8,61),USE(?Ext:Prijs:Prompt),TRN
                           ENTRY(@n-15.3),AT(76,61,68,10),USE(Ext:Prijs),RIGHT
                           PROMPT('Extra Kosten:'),AT(8,75),USE(?Ext:ExtraKosten:Prompt),TRN
                           ENTRY(@n-15.3),AT(76,75,68,10),USE(Ext:ExtraKosten),RIGHT,COLOR(COLOR:Silver),DISABLE
                           PROMPT('Omschrijving:'),AT(9,33),USE(?Kos:Omschrijving:Prompt)
                           ENTRY(@s60),AT(76,32,148,10),USE(Kos:Omschrijving),COLOR(COLOR:Silver),DISABLE
                         END
                       END
                       BUTTON('&OK'),AT(131,134,49,14),USE(?OK),LEFT,ICON('WAOK.ICO'),DEFAULT,FLAT,MSG('Accept dat' & |
  'a and close the window'),TIP('Accept data and close the window')
                       BUTTON('&Cancel'),AT(185,134,49,14),USE(?Cancel),LEFT,ICON('WACANCEL.ICO'),FLAT,MSG('Cancel operation'), |
  TIP('Cancel operation')
                     END

    omit('***',WE::CantCloseNowSetHereDone=1)  !Getting Nested omit compile error, then uncheck the "Check for duplicate CantCloseNowSetHere variable declaration" in the WinEvent local template
WE::CantCloseNowSetHereDone equate(1)
WE::CantCloseNowSetHere     long
    !***
ThisWindow           CLASS(WindowManager)
Ask                    PROCEDURE(),DERIVED
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
PrimeUpdate            PROCEDURE(),BYTE,PROC,DERIVED
Run                    PROCEDURE(),BYTE,PROC,DERIVED
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED
TakeCompleted          PROCEDURE(),BYTE,PROC,DERIVED
TakeEvent              PROCEDURE(),BYTE,PROC,DERIVED
TakeFieldEvent         PROCEDURE(),BYTE,PROC,DERIVED
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
Resizer              CLASS(WindowResizeClass)
Init                   PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)
                     END

CurCtrlFeq          LONG
FieldColorQueue     QUEUE
Feq                   LONG
OldColor              LONG
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
  CASE SELF.Request                                        ! Configure the action message text
  OF ViewRecord
    ActionMessage = 'View Record'
  OF InsertRecord
    GlobalErrors.Throw(Msg:InsertIllegal)
    RETURN
  OF ChangeRecord
    ActionMessage = 'Extra kosten toevoegen'
  OF DeleteRecord
    GlobalErrors.Throw(Msg:DeleteIllegal)
    RETURN
  END
  QuickWindow{PROP:Text} = ActionMessage                   ! Display status message in title bar
  PARENT.Ask


ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('UpdateExtraKosten')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Ext:ExtraKostenID:Prompt
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.HistoryKey = CtrlH
  SELF.AddHistoryFile(Ext:Record,History::Ext:Record)
  SELF.AddHistoryField(?Ext:ExtraKostenID,1)
  SELF.AddHistoryField(?Ext:Aantal,6)
  SELF.AddHistoryField(?Ext:Prijs,7)
  SELF.AddHistoryField(?Ext:ExtraKosten,8)
  SELF.AddUpdateFile(Access:ExtraKosten)
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  Relate:ExtraKosten.Open                                  ! File ExtraKosten used by this procedure, so make sure it's RelationManager is open
  Relate:KostenStamgeg.Open                                ! File KostenStamgeg used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Primary &= Relate:ExtraKosten
  IF SELF.Request = ViewRecord AND NOT SELF.BatchProcessing ! Setup actions for ViewOnly Mode
    SELF.InsertAction = Insert:None
    SELF.DeleteAction = Delete:None
    SELF.ChangeAction = Change:None
    SELF.CancelAction = Cancel:Cancel
    SELF.OkControl = 0
  ELSE
    SELF.InsertAction = Insert:None                        ! Inserts not allowed
    SELF.DeleteAction = Delete:None                        ! Deletes not allowed
    SELF.ChangeAction = Change:Caller                      ! Changes allowed
    SELF.CancelAction = Cancel:Cancel+Cancel:Query         ! Confirm cancel
    SELF.OkControl = ?OK
    IF SELF.PrimeUpdate() THEN RETURN Level:Notify.
  END
  SELF.Open(QuickWindow)                                   ! Open window
  IF Kos:Prijs<>0
      ?Ext:Prijs{PROP:Disable}=TRUE
      ?Ext:Prijs{PROP:Background}=COLOR:Silver
  END
  WinAlertMouseZoom()
  Do DefineListboxStyle
  IF SELF.Request = ViewRecord                             ! Configure controls for View Only mode
    ?Ext:ExtraKostenID{PROP:ReadOnly} = True
    ?Ext:Aantal{PROP:ReadOnly} = True
    ?Ext:Prijs{PROP:ReadOnly} = True
    ?Ext:ExtraKosten{PROP:ReadOnly} = True
    ?Kos:Omschrijving{PROP:ReadOnly} = True
  END
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('UpdateExtraKosten',QuickWindow)            ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  SELF.SetAlerts()
  EnterByTabManager.ExcludeControl(?Cancel)
  EnterByTabManager.ExcludeControl(?OK)
  EnterByTabManager.Init(False)
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:ExtraKosten.Close
    Relate:KostenStamgeg.Close
  END
  IF SELF.Opened
    INIMgr.Update('UpdateExtraKosten',QuickWindow)         ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.PrimeUpdate PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.PrimeUpdate()
    If returnValue = Level:Fatal  ! delete just occured
      ThisNetRefresh.Send('|ExtraKosten|') ! NetTalk (NetRefresh)
    End
  RETURN ReturnValue


ThisWindow.Run PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Run()
  IF SELF.Request = ViewRecord                             ! In View Only mode always signal RequestCancelled
    ReturnValue = RequestCancelled
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
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?OK
      ThisWindow.Update()
      IF SELF.Request = ViewRecord AND NOT SELF.BatchProcessing THEN
         POST(EVENT:CloseWindow)
      END
    END
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue


ThisWindow.TakeCompleted PROCEDURE

ReturnValue          BYTE,AUTO

Looped BYTE
  CODE
  LOOP
    IF Looped
      RETURN Level:Notify
    ELSE
      Looped = 1
    END
  ReturnValue = PARENT.TakeCompleted()
    ThisNetRefresh.Send('|ExtraKosten|') ! NetTalk (NetRefresh)
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
  Ext:ExtraKosten=Ext:Aantal*Ext:Prijs
  Display()
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

