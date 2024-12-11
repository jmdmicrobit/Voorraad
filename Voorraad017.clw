

   MEMBER('Voorraad.clw')                                  ! This is a MEMBER module


   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('VOORRAAD017.INC'),ONCE        !Local module procedure declarations
                     END


!!! <summary>
!!! Generated from procedure template - Window
!!! </summary>
WindowSQLBackup PROCEDURE 

udpt            UltimateDebugProcedureTracker
Loc:Connectie        STRING(100)                           ! 
BestandsQ            QUEUE,PRE(BQ)                         ! 
Bestandsnaam         CSTRING(51)                           ! 
Records              LONG                                  ! 
Start                TIME                                  ! 
Download             TIME                                  ! 
Klaar                TIME                                  ! 
Duur                 TIME                                  ! 
Gemiddeld            LONG                                  ! 
                     END                                   ! 
Loc:Conversie        LONG                                  ! 
Loc:KleineBackup     BYTE                                  ! 
Loc:Datum            DATE                                  ! 
LocEnableEnterByTab  BYTE(1)                               !Used by the ENTER Instead of Tab template
EnterByTabManager    EnterByTabClass
Window               WINDOW('SQL Backup'),AT(,,419,334),FONT('MS Sans Serif',8,,FONT:regular),RESIZE,GRAY,MDI,SYSTEM, |
  TIMER(1)
                       CHECK('Kleine Backup'),AT(11,7),USE(Loc:KleineBackup),SKIP
                       PROMPT('vanaf :'),AT(74,8),USE(?Loc:Datum:Prompt)
                       ENTRY(@d17),AT(99,8,60,10),USE(Loc:Datum)
                       BUTTON('Connect'),AT(165,5,45,14),USE(?Connect)
                       LIST,AT(13,25,376,290),USE(?List1),VSCROLL,FORMAT('131L(2)|M~Bestandsnaam~@s50@44R(2)|M' & |
  '~Records~@n-14@32R(2)|M~Start~@t4@41R(2)|M~Download~@t4@32R(2)|M~Klaar~@t4@32R(2)|M~' & |
  'Duur~@t4@56R(2)|M~Gemiddeld~@n-14@'),FROM(BestandsQ)
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
VulField               PROCEDURE(*GROUP PRM:Group, LONG PRM:Veld), ANY ! New method added to this class instance
Synchroniseer          PROCEDURE()                         ! New method added to this class instance
KopieerFile2Remote     PROCEDURE(FILE pFile)               ! New method added to this class instance
KopieerView2Remote     PROCEDURE(FILE pFile)               ! New method added to this class instance
                     END

Toolbar              ToolbarClass

  CODE
? DEBUGHOOK(BulkOverboeking:Record)
? DEBUGHOOK(CMR:Record)
? DEBUGHOOK(OverboekingRit:Record)
? DEBUGHOOK(OverboekingRitRegel:Record)
? DEBUGHOOK(PalletSoort:Record)
? DEBUGHOOK(PalletVerloop:Record)
? DEBUGHOOK(PlanningInkoop:Record)
? DEBUGHOOK(PlanningOverboeking:Record)
? DEBUGHOOK(PlanningVerkoop:Record)
? DEBUGHOOK(RelatieAdres:Record)
? DEBUGHOOK(Transporteur:Record)
? DEBUGHOOK(Verpakking:Record)
? DEBUGHOOK(ViewArtikel:Record)
? DEBUGHOOK(VoorraadVerloop:Record)
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
        udpt.Init(UD,'WindowSQLBackup','Voorraad017.clw','Voorraad.EXE','06/05/2020 @ 04:03PM')    
             
  GlobalErrors.SetProcedureName('WindowSQLBackup')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Loc:KleineBackup
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:BulkOverboeking.Open                              ! File BulkOverboeking used by this procedure, so make sure it's RelationManager is open
  Relate:CMR.Open                                          ! File CMR used by this procedure, so make sure it's RelationManager is open
  Relate:OverboekingRit.SetOpenRelated()
  Relate:OverboekingRit.Open                               ! File OverboekingRit used by this procedure, so make sure it's RelationManager is open
  Relate:PalletSoort.Open                                  ! File PalletSoort used by this procedure, so make sure it's RelationManager is open
  Relate:PalletVerloop.Open                                ! File PalletVerloop used by this procedure, so make sure it's RelationManager is open
  Relate:PlanningInkoop.Open                               ! File PlanningInkoop used by this procedure, so make sure it's RelationManager is open
  Relate:PlanningOverboeking.Open                          ! File PlanningOverboeking used by this procedure, so make sure it's RelationManager is open
  Relate:PlanningVerkoop.Open                              ! File PlanningVerkoop used by this procedure, so make sure it's RelationManager is open
  Relate:RelatieAdres.Open                                 ! File RelatieAdres used by this procedure, so make sure it's RelationManager is open
  Relate:Transporteur.Open                                 ! File Transporteur used by this procedure, so make sure it's RelationManager is open
  Relate:Verpakking.Open                                   ! File Verpakking used by this procedure, so make sure it's RelationManager is open
  Relate:ViewArtikel.Open                                  ! File ViewArtikel used by this procedure, so make sure it's RelationManager is open
  Relate:VoorraadVerloop.Open                              ! File VoorraadVerloop used by this procedure, so make sure it's RelationManager is open
  Relate:Weging.Open                                       ! File Weging used by this procedure, so make sure it's RelationManager is open
  Access:OverboekingRitRegel.UseFile                       ! File referenced in 'Other Files' so need to inform it's FileManager
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
  WinAlert(WE::WM_QueryEndSession,,Return1+PostUser)
  Window{Prop:Alrt,255} = CtrlShiftP
  INIMgr.Fetch('WindowSQLBackup',Window)                   ! Restore window settings from non-volatile store
  SELF.SetAlerts()
  EnterByTabManager.Init(False)
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  If self.opened Then WinAlert().
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:BulkOverboeking.Close
    Relate:CMR.Close
    Relate:OverboekingRit.Close
    Relate:PalletSoort.Close
    Relate:PalletVerloop.Close
    Relate:PlanningInkoop.Close
    Relate:PlanningOverboeking.Close
    Relate:PlanningVerkoop.Close
    Relate:RelatieAdres.Close
    Relate:Transporteur.Close
    Relate:Verpakking.Close
    Relate:ViewArtikel.Close
    Relate:VoorraadVerloop.Close
    Relate:Weging.Close
  END
  IF SELF.Opened
    INIMgr.Update('WindowSQLBackup',Window)                ! Save window data to non-volatile store
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
    OF ?Connect
      ThisWindow.Update()
          Loc:Conversie=1
          0{Prop:Timer}=1
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
        UD.ShowProcedureInfo('WindowSQLBackup',UD.SetApplicationName('Voorraad','EXE'),Window{PROP:Hlp},'03/04/2011 @ 03:50PM','06/05/2020 @ 04:03PM','10/11/2024 @ 01:55PM')  
    
       CYCLE
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
    OF EVENT:Timer
       0{Prop:Timer}=0                ! timer uitschakelen totdat procedure klaar is
       IF Loc:Conversie<>0 AND Loc:Conversie<29
          SetCursor(Cursor:Wait)
          ThisWindow.Synchroniseer()
          Loc:Conversie+=1
          SetCursor()
          0{Prop:Timer}=1             ! timer weer aanzetten
        END
    END
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue

ThisWindow.VulField PROCEDURE(*GROUP PRM:Group, LONG PRM:Veld)

SQLField                                ANY


  CODE
      SQLField &= WHAT(PRM:Group,PRM:Veld)
      DebugField"=SQLField
      RETURN SQLField
      


ThisWindow.Synchroniseer PROCEDURE()

  CODE
  !Loc:Connectie='web2003.microbit.nl,BACKUP,sa,@lb@tr0s'
  !Loc:Connectie='ML110\ms$dpm2007$,BACKUP,sa,@lb@tr0s'
  Loc:Connectie='HAR-HP\SQLEXPRESS2008,[BACKUP],sa,@lb@tr0s'
  !Loc:Connectie='pbq716su8b.database.windows.net,BINK,jmd@pbq716su8b,@lb@tr0s'
  Execute Loc:Conversie
  	!ThisWindow.KopieerView2Remote(ArtikelOmschrijvingExtra)
  	!ThisWindow.KopieerView2Remote(ArtikelOmschrijvingExtraGroep)
  	ThisWindow.KopieerFile2Remote(BulkOverboeking)
  	ThisWindow.KopieerFile2Remote(Cel)
  	ThisWindow.KopieerFile2Remote(CelLocatie)
  	ThisWindow.KopieerFile2Remote(CMR)
  	ThisWindow.KopieerView2Remote(DubbeleInslagMutaties)
  	ThisWindow.KopieerFile2Remote(Inkoop)
  	ThisWindow.KopieerFile2Remote(Mutatie)
  	ThisWindow.KopieerFile2Remote(OverboekingRit)
  	ThisWindow.KopieerFile2Remote(OverboekingRitRegel)
  	ThisWindow.KopieerFile2Remote(PalletMutatie)
  	ThisWindow.KopieerFile2Remote(PalletSoort)
  	ThisWindow.KopieerView2Remote(PalletVerloop)
  	ThisWindow.KopieerFile2Remote(Partij)
  	ThisWindow.KopieerFile2Remote(Planning)
  	ThisWindow.KopieerView2Remote(PlanningINkoop)
  	ThisWindow.KopieerView2Remote(PlanningOverboeking)
  	ThisWindow.KopieerView2Remote(PlanningVerkoop)
  	ThisWindow.KopieerView2Remote(Relatie)
  	ThisWindow.KopieerFile2Remote(RelatieAdres)
  	!ThisWindow.KopieerFile2Remote(Sjabloon)
  	ThisWindow.KopieerFile2Remote(Transporteur)
  	ThisWindow.KopieerFile2Remote(Verkoop)
  	ThisWindow.KopieerFile2Remote(Verpakking)
  	ThisWindow.KopieerFile2Remote(Versie)
  	ThisWindow.KopieerFile2Remote(ViewArtikel)
  	ThisWindow.KopieerView2Remote(Voorraadverloop)
  	ThisWindow.KopieerFile2Remote(Weging)
  END


ThisWindow.KopieerFile2Remote PROCEDURE(FILE pFile)

_record             &GROUP

_Queue              Queue,PRE(_que)
rec                  String(4096)
                   END

_sqlFilter          String(255)

  CODE
    _record &= pFile{PROP:Record}
  
    BQ:Bestandsnaam=pFile{Prop:Name}
    BQ:Records=0
    BQ:Start=Clock()
    Clear(_sqlFilter)
  !  IF Loc:KleineBackup
  !     Case pFile{Prop:Name}
  !     of BestelClient{Prop:Name} orof Bestelling{Prop:Name} orof BezorgMut{Prop:Name}  orof ComponentMut{Prop:Name} |
  !     orof ImportMutatie{Prop:Name}
  !        _sqlFilter='Datum_DATETIME >= <39>'&Year(Loc:Datum)&'-'&Month(Loc:Datum)&'-'&Day(Loc:Datum)&' 00:00:00.000<39>'
  !     END
  !  END
  
    OPEN(pFile)
    IF ERROR() THEN Stop(Error()&' bij het openen van de pFile').
    BUFFER(pFile,100)
    IF ERROR() THEN Stop(Error()&' bij het bufferen van de pFile').
    Clear(pFile)
    Set(pFile)
    IF _sqlFilter THEN   pFile{Prop:Where}=_sqlFilter.
    Loop
        Next(pFile)
        IF ERROR() THEN BREAK.
        _Queue.Rec = _record
        Add(_Queue)
        BQ:Records+=1
     !   IF BQ:Records>2000 THEN break.
  	End
    CLOSE(pFile)
  pFile{PROP:Disconnect}
  BQ:Download=Clock()
  
  
  
  
  
    pFile{Prop:Create}=TRUE
    !pFile{PROP:ConnectString}=Loc:Connectie		! ipv prop:owner
  	!GLO:OWNER=Loc:Connectie
  	pFile{PROP:OWNER}='HAR-HP\SQLEXPRESS2008,[BACKUP],sa,@lb@tr0s'
  !	Message(pFile{PROP:ConnectString})
    pFile{Prop:DriverString}='/BUSYHANDLING=2'
    Create(pFile)
   !IF ERROR() THEN Stop(Error()&' bij de create van de pFile').
    Open(pFile)
    IF ERROR() THEN Stop(Error()&' bij het openen van de pFile').
    LOGOUT(.1,pFile)
    IF ERROR() THEN Stop(Error()&' bij het logout  van de pFile').
    Loop i#=1 to BQ:Records
      GET(_Queue,i#)
      _record = _Queue.Rec
      IF ERROR() THEN BREAK.
  
      Add(pFile)
      IF ERRORCODE()=90 THEN Stop(FILEERROR()).
    END
    COMMIT
    IF ERROR() THEN Stop(Error()&' bij de commit van de pFile').
    CLOSE(pFile)
    IF ERROR() THEN Stop(Error()&' bij de close van de pFile').
    FREE(_Queue)
  
    BQ:Klaar=Clock()
    BQ:Duur=BQ:Klaar-BQ:Start
    IF BQ:Duur=0 THEN
        BQ:Gemiddeld=0
    ELSE
       BQ:Gemiddeld=BQ:Records/(BQ:Duur/100)
    END
    Add(BestandsQ)
    DISPLAY()


ThisWindow.KopieerView2Remote PROCEDURE(FILE pFile)

_file				&FILE
_view				&FILE

_sqlstring          String(4096)
_tabelnaam           CString(255)

_memogrp 			GROUP
Text  					STRING(4096)
					END	

  CODE
    BQ:Bestandsnaam=pFile{Prop:Name}
    BQ:Records=0
    BQ:Start=Clock()
  
  
  _tabelnaam = pFile{Prop:Name}
  IF instring('dbo.',_tabelnaam,1,1)
  	_tabelnaam = Sub(pFile{Prop:Name},5,LEN(pFile{Prop:Name}) - 4)
  END	
  
  _file &= NEW(FILE)
  _file{PROP:Driver} = 'MSSQL'
  !_file{Prop:OWNER}=GLO:OWNER
  _file{Prop:ConnectString}=GLO:OWNER
  _file{Prop:SQL} = 'SELECT m.definition FROM sys.sql_modules m, sys.views v  WHERE m.object_id = v.object_id AND v.name = <39>'&_tabelnaam& '<39>'
  IF ERRORCODE()=90 THEN Stop(FILEERROR()).
  FIXFORMAT(_file)
  IF ERROR() THEN Stop(Error()&' bij de fixformat').
  Next(_file)
  IF ERROR() THEN Stop(Error()&' bij de Next').
  _memogrp = _file{Prop:Text,-1}	
  _sqlstring = Clip(_memogrp.Text)
  DISPOSE(_file)
  IF ERROR() THEN Stop(Error()&' bij de Dispose').
  
  SETCLIPBOARD(_sqlstring)
  
  _view &= NEW(FILE)
  _view{PROP:Driver} = 'MSSQL'
  _view{Prop:OWNER}='HAR-HP\SQLEXPRESS2008,[BACKUP],sa,@lb@tr0s'
  _view{Prop:ConnectString}=Loc:Connectie
  _view{Prop:SQL} = _sqlString
  IF ERRORCODE()=90 or ERRORCODE() = 80 THEN Stop(FILEERROR()).
  FIXFORMAT(_view)
  IF ERROR() THEN Stop(Error()&' bij de fixformat').
  !_record &= _view{Prop:Record}		
  Next(_view)
  IF ERROR() THEN Stop(Error()&' bij de Next').
  
  DISPOSE(_view)
  IF ERROR() THEN Stop(Error()&' bij de DISPOSE').
  
    BQ:Klaar=Clock()
    BQ:Duur=BQ:Klaar-BQ:Start
    IF BQ:Duur=0 THEN
        BQ:Gemiddeld=0
    ELSE
       BQ:Gemiddeld=BQ:Records/(BQ:Duur/100)
    END
    Add(BestandsQ)
    DISPLAY()


