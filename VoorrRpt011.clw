

   MEMBER('VoorrRpt.clw')                                  ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABREPORT.INC'),ONCE

                     MAP
                       INCLUDE('VOORRRPT011.INC'),ONCE        !Local module procedure declarations
                     END


!!! <summary>
!!! Generated from procedure template - Process
!!! </summary>
ProcessExcel PROCEDURE 

Progress:Thermometer BYTE                                  ! 
Process:View         VIEW(ViewVoorraadCelTotaal)
                     END
LocEnableEnterByTab  BYTE(1)                               !Used by the ENTER Instead of Tab template
EnterByTabManager    EnterByTabClass
ProgressWindow       WINDOW('Progress...'),AT(,,142,59),DOUBLE,CENTER,GRAY,TIMER(1)
                       PROGRESS,AT(15,15,111,12),USE(Progress:Thermometer),RANGE(0,100)
                       STRING(''),AT(0,3,141,10),USE(?Progress:UserString),CENTER
                       STRING(''),AT(0,30,141,10),USE(?Progress:PctText),CENTER
                       BUTTON('Cancel'),AT(45,42,50,15),USE(?Progress:Cancel)
                     END

    omit('***',WE::CantCloseNowSetHereDone=1)  !Getting Nested omit compile error, then uncheck the "Check for duplicate CantCloseNowSetHere variable declaration" in the WinEvent local template
WE::CantCloseNowSetHereDone equate(1)
WE::CantCloseNowSetHere     long
    !***
ThisWindow           CLASS(ReportManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Init                   PROCEDURE(ProcessClass PC,<REPORT R>,<PrintPreviewClass PV>)
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
TakeEvent              PROCEDURE(),BYTE,PROC,DERIVED
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED
                     END

ThisProcess          CLASS(ProcessClass)                   ! Process Manager
Kill                   PROCEDURE(),DERIVED
TakeRecord             PROCEDURE(),BYTE,PROC,DERIVED
                     END

ProgressMgr          StepLongClass                         ! Progress Manager
ExcelOleClass        Class
Init                  Procedure(String)
Output                Procedure()
Close                 Procedure()
          End
Loc:Ole             Long
Loc:Rij             Long
Loc:OleInit         Byte

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
  GlobalErrors.SetProcedureName('ProcessExcel')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:ViewVoorraadCelTotaal.Open                        ! File ViewVoorraadCelTotaal used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(ProgressWindow)                                ! Open window
  WinAlertMouseZoom()
  Do DefineListboxStyle
  INIMgr.Fetch('ProcessExcel',ProgressWindow)              ! Restore window settings from non-volatile store
  ProgressWindow{Prop:Timer} = 10                          ! Assign timer interval
  ProgressMgr.Init(ScrollSort:AllowNumeric,)
  ThisProcess.Init(Process:View, Relate:ViewVoorraadCelTotaal, ?Progress:PctText, Progress:Thermometer, ProgressMgr, VVCT:CeliD)
  ThisProcess.AddSortOrder(VVCT:ViewVoorraadCelTotaal_PK)
  ProgressWindow{Prop:Text} = 'Processing Records'
  ?Progress:PctText{Prop:Text} = '0% Completed'
  SELF.Init(ThisProcess)
  ?Progress:UserString{Prop:Text}='Export naar Excel'
  SELF.AddItem(?Progress:Cancel, RequestCancelled)
  SEND(ViewVoorraadCelTotaal,'QUICKSCAN=on')
  SELF.SetAlerts()
  EnterByTabManager.Init(False)
  RETURN ReturnValue


ThisWindow.Init PROCEDURE(ProcessClass PC,<REPORT R>,<PrintPreviewClass PV>)

  CODE
  PARENT.Init(PC,R,PV)
  WinAlertMouseZoom()


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
        ThisNetRefresh.Send('|ViewVoorraadCelTotaal|') ! NetTalk (NetRefresh)
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:ViewVoorraadCelTotaal.Close
  END
  IF SELF.Opened
    INIMgr.Update('ProcessExcel',ProgressWindow)           ! Save window data to non-volatile store
  END
  ProgressMgr.Kill()
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
    OF EVENT:OpenWindow
        WE::CantCloseNow += 1
        WE::CantCloseNowSetHere = 1
    END
  ReturnValue = PARENT.TakeWindowEvent()
    CASE EVENT()
    OF EVENT:CloseWindow
      if WE::CantCloseNow > 0 and ReturnValue = Level:Benign and WE::CantCloseNowSetHere
        WE::CantCloseNow -= 1
        WE::CantCloseNowSetHere = 0
      end
    OF EVENT:OpenWindow
        post(event:visibleondesktop)
    END
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue

ExcelOleClass.Init       Procedure(String prm:Bestandsnaam)

  Code
  Loc:Ole  = Create(0,Create:Ole)
  Loc:Ole{Prop:Create}='Excel.Application'
  Loc:Ole{Prop:ReportException}=True                   !  dwz fouten worden niet genegeerd

  Loc:Ole{Prop:DoVerb}=1                               !  dit doet iedereen dus ik ook
  Loc:Ole{'Application.WindowState'}=1                 !  maximaliseer scherm
  Loc:Ole{'Application.Visible'}=False 

  If prm:Bestandsnaam=''
		Loc:Ole{'Application.Workbooks.Add'}            ! leeg worksheet openen
		Loc:Rij=1
   		 Loc:Ole{'Application.Range(A'&Loc:Rij&').Value'}='Cel'
   		 Loc:Ole{'Application.Range(B'&Loc:Rij&').Value'}='Omschrijving'
   		 Loc:Ole{'Application.Range(C'&Loc:Rij&').Value'}='Voorraad'
  Else
     Loc:Ole{'Application.Workbooks.Open ("'&prm:Bestandsnaam&'")'}           
  End


ExcelOleClass.Output   Procedure()
    Code
    If Loc:OleInit=False
       ExcelOleClass.Init('')
       Loc:OleInit=True
    End
    Loc:Rij+=1
	Loc:Ole{'Application.Range(A'&Loc:Rij&').Value'}=VVCT:CeliD
	Loc:Ole{'Application.Range(B'&Loc:Rij&').Value'}=VVCT:ArtikelOms
	Loc:Ole{'Application.Range(C'&Loc:Rij&').Value'}=VVCT:kg
	Loc:Ole{'Application.Range(D'&Loc:Rij&').Value'}='kg '

ExcelOleClass.Close      Procedure()

  Code
	 IF Loc:OleInit=True
     Loc:Ole{'Application.Columns(A:S).AutoFit'}
     Loc:Ole{'Application.Rows(1:'&Loc:Rij&').AutoFit'}
     Loc:Ole{'Application.Visible'}=true  ! nu pas excel laten zien
     Loc:Ole{Prop:Deactivate}
     Destroy(Loc:Ole)
  End

ThisProcess.Kill PROCEDURE

  CODE
  PARENT.Kill
    ExcelOleClass.Close      


ThisProcess.TakeRecord PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.TakeRecord()
  ExcelOleClass.Output
  RETURN ReturnValue

