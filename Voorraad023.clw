

   MEMBER('Voorraad.clw')                                  ! This is a MEMBER module


   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('VOORRAAD023.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('VOORRAAD022.INC'),ONCE        !Req'd for module callout resolution
                     END


!!! <summary>
!!! Generated from procedure template - Splash
!!! </summary>
ShowNewVersion PROCEDURE 

udpt            UltimateDebugProcedureTracker
Loc:Versie           DECIMAL(7,2)                          ! 
LocEnableEnterByTab  BYTE(1)                               !Used by the ENTER Instead of Tab template
EnterByTabManager    EnterByTabClass
window               WINDOW,AT(,,206,192),FONT('MS Sans Serif',8,,FONT:regular),CENTER,GRAY,MDI
                       PANEL,AT(-73,-186,279,376),USE(?PANEL1),BEVEL(6)
                       PANEL,AT(7,6,191,159),USE(?PANEL2),BEVEL(-2,1)
                       STRING('JMDBewind'),AT(13,12,182,10),USE(?String2),CENTER
                       PANEL,AT(12,12,182,12),USE(?PANEL3),BEVEL(-1,1,9)
                       STRING('Copyright 1999-2016'),AT(13,28,182,10),USE(?String1),CENTER
                       IMAGE('main.jpg'),AT(30,38,147,94),USE(?Image1),CENTERED
                       STRING('Telefoon: 0495-531698    Fax:0495-533555'),AT(36,135),USE(?String3)
                       STRING('jmd@microbit.nl {17}www.microbit.nl'),AT(35,148),USE(?String4)
                       STRING('Nieuwe versie geïnstalleerd'),AT(13,170),USE(?STRING5),HIDE
                       BUTTON('Bekijk wijzigingen'),AT(108,168),USE(?BUTTON1),HIDE
                     END

    omit('***',WE::CantCloseNowSetHereDone=1)  !Getting Nested omit compile error, then uncheck the "Check for duplicate CantCloseNowSetHere variable declaration" in the WinEvent local template
WE::CantCloseNowSetHereDone equate(1)
WE::CantCloseNowSetHere     long
    !***
ThisWindow           CLASS(WindowManager)
Ask                    PROCEDURE(),DERIVED
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
TakeEvent              PROCEDURE(),BYTE,PROC,DERIVED
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass

  CODE
? DEBUGHOOK(Versie:Record)
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
  PARENT.Ask
  ! hier checken op een nieuwe versie
  
  If Loc:Versie<GLO:Versie Then 
  !	Message('Er is een nieuwe versie geïnstalleerd.||Via Help, Versie informatie kan men de wijzigingen raadplegen?','Nieuwe versie gevonden',ICON:Question)
  !END
  !IF FALSE 
  	Case Message('Er is een nieuwe versie geïnstalleerd.||Wilt u de wijzigingen raadplegen?','Nieuwe versie gevonden',ICON:Question,Button:Yes+BUTTON:NO,BUTTON:YES)
  	of BUTTON:YES
  		Clear(VRS:Record)
      	VRS:Versie=format(Loc:Versie,@n-7.2)
      	Set(VRS:Versie_PK,VRS:Versie_PK)
  		Loop Until Access:Versie.Next()
  			if VRS:Versie<=Loc:Versie then cycle.  	! niet de laatste versie nog een keer tonen
  			GlobalRequest=ChangeRecord
  UpdateVersie()
  		  	If GlobalResponse=RequestCancelled Then Break.
  		End	
  	End
    PUTINI('Voorraad','Versie',GLO:Versie,PQ:IniFile)
  End


ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
        udpt.Init(UD,'ShowNewVersion','Voorraad023.clw','Voorraad.EXE','06/25/2020 @ 11:14AM')    
             
  GlobalErrors.SetProcedureName('ShowNewVersion')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?PANEL1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:Versie.Open                                       ! File Versie used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(window)                                        ! Open window
  Loc:Versie=GETINI('Voorraad','Versie',0,PQ:IniFile)
  
  ?String2{Prop:Text}='Voorraad versie '&GLO:Versie&' (laatste gebruikte versie '&Loc:Versie&')'
  Do DefineListboxStyle
  Alert(AltKeyPressed)  ! WinEvent : These keys cause a program to crash on Windows 7 and Windows 10.
  Alert(F10Key)         !
  Alert(CtrlF10)        !
  Alert(ShiftF10)       !
  Alert(CtrlShiftF10)   !
  Alert(AltSpace)       !
  WinAlertMouseZoom()
  WinAlert(WE::WM_QueryEndSession,,Return1+PostUser)
  window{Prop:Alrt,255} = CtrlShiftP
  INIMgr.Fetch('ShowNewVersion',window)                    ! Restore window settings from non-volatile store
  TARGET{Prop:Timer} = 500                                 ! Close window on timer event, so configure timer
  TARGET{Prop:Alrt,255} = MouseLeft                        ! Alert mouse clicks that will close window
  TARGET{Prop:Alrt,254} = MouseLeft2
  TARGET{Prop:Alrt,253} = MouseRight
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
    Relate:Versie.Close
  END
  IF SELF.Opened
    INIMgr.Update('ShowNewVersion',window)                 ! Save window data to non-volatile store
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
  If event() = event:VisibleOnDesktop !or event() = event:moved
    ds_VisibleOnDesktop()
  end
     IF KEYCODE()=CtrlShiftP AND EVENT() = Event:PreAlertKey
       CYCLE
     END
     IF KEYCODE()=CtrlShiftP  
        UD.ShowProcedureInfo('ShowNewVersion',UD.SetApplicationName('Voorraad','EXE'),window{PROP:Hlp},'12/24/2010 @ 12:19PM','06/25/2020 @ 11:14AM','10/11/2024 @ 01:55PM')  
    
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
    OF EVENT:AlertKey
      CASE KEYCODE()
      OF MouseLeft
      OROF MouseLeft2
      OROF MouseRight
        POST(Event:CloseWindow)                            ! Splash window will close on mouse click
      END
    OF EVENT:LoseFocus
        POST(Event:CloseWindow)                            ! Splash window will close when focus is lost
    OF EVENT:OpenWindow
        post(event:visibleondesktop)
    OF Event:Timer
      POST(Event:CloseWindow)                              ! Splash window will close on event timer
    OF Event:AlertKey
      CASE KEYCODE()                                       ! Splash window will close on mouse click
      OF MouseLeft
      OROF MouseLeft2
      OROF MouseRight
        POST(Event:CloseWindow)
      END
    ELSE
    END
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue

