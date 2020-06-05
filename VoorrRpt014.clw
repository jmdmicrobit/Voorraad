

   MEMBER('VoorrRpt.clw')                                  ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABREPORT.INC'),ONCE

                     MAP
                       INCLUDE('VOORRRPT014.INC'),ONCE        !Local module procedure declarations
                     END


!!! <summary>
!!! Generated from procedure template - Process
!!! Process the ViewPalletTegoeden File
!!! </summary>
ReportPalletTegoedenExcel PROCEDURE (BYTE PRM:EnkelTegoedTonen)

udpt            UltimateDebugProcedureTracker
LOC:PalletSoortID    BYTE                                  ! 
Progress:Thermometer BYTE                                  ! 
LOC:Geexporteerd     BYTE                                  ! 
Process:View         VIEW(ViewPalletTegoeden)
                       PROJECT(PTG:RelatieID)
                       JOIN(Rel:Relatie_PK,PTG:RelatieID)
                         PROJECT(Rel:FirmaNaam)
                       END
                     END
LocEnableEnterByTab  BYTE(1)                               !Used by the ENTER Instead of Tab template
EnterByTabManager    EnterByTabClass
ProgressWindow       WINDOW('Exporteren'),AT(,,142,59),FONT('MS Sans Serif',8,,FONT:regular,CHARSET:DEFAULT),DOUBLE, |
  CENTER,GRAY,TIMER(1)
                       PROGRESS,AT(15,15,111,12),USE(Progress:Thermometer),RANGE(0,100)
                       STRING(''),AT(0,3,141,10),USE(?Progress:UserString),CENTER
                       STRING(''),AT(0,30,141,10),USE(?Progress:PctText),CENTER
                       BUTTON('Cancel'),AT(46,42,49,15),USE(?Progress:Cancel),LEFT,ICON('WACANCEL.ICO'),FLAT,MSG('Cancel Process'), |
  TIP('Cancel Process')
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
TakeRecord             PROCEDURE(),BYTE,PROC,DERIVED
                     END

ProgressMgr          StepLongClass                         ! Progress Manager
ExcelExport &ExcelExportClass

  CODE
  GlobalResponse = ThisWindow.Run()                        ! Opens the window and starts an Accept Loop

!---------------------------------------------------------------------------
DefineListboxStyle ROUTINE
!|
!| This routine create all the styles to be shared in this window
!| It`s called after the window open
!|
!---------------------------------------------------------------------------
Header ROUTINE
	ExcelExport.Row = 1
	ExcelExport.BoldMode = 1
	ExcelExport.PrintString('Klant-Nr.')
	ExcelExport.PrintString('Firmanaam')
	ExcelExport.PrintString('Transporteur')
	ExcelExport.PrintString('Inkomend')
	ExcelExport.PrintString('Uitgaand')
	ExcelExport.PrintString('Totaal')
	ExcelExport.BoldMode = 0
	ExcelExport.NextRow()

ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
        udpt.Init(UD,'ReportPalletTegoedenExcel','VoorrRpt014.clw','VoorrRpt.DLL','06/02/2020 @ 02:25PM')    
             
  GlobalErrors.SetProcedureName('ReportPalletTegoedenExcel')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  ExcelExport &= NEW(ExcelExportClass)
  LOC:Geexporteerd = 0
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:ViewPalletTegoeden.Open                           ! File ViewPalletTegoeden used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(ProgressWindow)                                ! Open window
  WinAlertMouseZoom()
  Do DefineListboxStyle
  ProgressWindow{Prop:Alrt,255} = CtrlShiftP
  INIMgr.Fetch('ReportPalletTegoedenExcel',ProgressWindow) ! Restore window settings from non-volatile store
  ProgressWindow{Prop:Timer} = 10                          ! Assign timer interval
  ProgressMgr.Init(ScrollSort:AllowNumeric,)
  ThisProcess.Init(Process:View, Relate:ViewPalletTegoeden, ?Progress:PctText, Progress:Thermometer, ProgressMgr, PTG:PalletSoortID)
  ThisProcess.AddSortOrder(PTG:ViewPalletTegoeden_PK)
  ProgressWindow{Prop:Text} = 'Processing Records'
  ?Progress:PctText{Prop:Text} = '0% Completed'
  SELF.Init(ThisProcess)
  ?Progress:UserString{Prop:Text}='Exporteren'
  SELF.AddItem(?Progress:Cancel, RequestCancelled)
  SEND(ViewPalletTegoeden,'QUICKSCAN=on')
  SEND(Relatie,'QUICKSCAN=on')
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
        ThisNetRefresh.Send('|ViewPalletTegoeden|') ! NetTalk (NetRefresh)
  ReturnValue = PARENT.Kill()
  IF LOC:Geexporteerd THEN
  	ExcelExport.AutoFit(1, 6)
      ExcelExport.Finish()
      ExcelExport.OleID{Prop:Deactivate}
  END
  DISPOSE(ExcelExport)
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:ViewPalletTegoeden.Close
  END
  IF SELF.Opened
    INIMgr.Update('ReportPalletTegoedenExcel',ProgressWindow) ! Save window data to non-volatile store
  END
  ProgressMgr.Kill()
  GlobalErrors.SetProcedureName
            
   
  IF BAND(Keystate(),KeyStateUD:Shift) 
        UD.ShowProcedureInfo('ReportPalletTegoedenExcel',UD.SetApplicationName('VoorrRpt','DLL'),ProgressWindow{PROP:Hlp},'06/15/2011 @ 10:59AM','06/02/2020 @ 02:25PM','06/03/2020 @ 11:38AM')  
    
  END
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


ThisProcess.TakeRecord PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  Access:ViewPalletTegoeden.TryFetch(PTG:ViewPalletTegoeden_PK)
  
  IF NOT(PTG:Inkomend = 0 AND PTG:Uitgaand = 0) AND NOT(PRM:EnkelTegoedTonen AND PTG:Inkomend = PTG:Uitgaand) THEN
  	CLEAR(Rel:Record)
  	Rel:RelatieID = PTG:RelatieID
  	Access:Relatie.TryFetch(Rel:Relatie_PK)
  	
  	IF LOC:PalletSoortID = 0 THEN
  		! Eerste regel
  		ExcelExport.Init()
  		ExcelExport.OleID{'Application.Workbooks.Add'}          ! lege worksheet maken
  		ExcelExport.Row = 1
  		
  		CASE PTG:PalletSoortID
  		OF 1
  			!ExcelExport.CreateNew('H1')
  			ExcelExport.AddSheet('H1')
  		OF 2
  			!ExcelExport.CreateNew('1-way')
              ExcelExport.AddSheet('1-way')
  		OF 3
  			!ExcelExport.CreateNew('EURO')
              ExcelExport.AddSheet('EURO')
  		OF 4
  			!ExcelExport.CreateNew('CKW')			
              ExcelExport.AddSheet('CKW')
  		END
  
  		DO Header
  		
  		LOC:PalletSoortID = PTG:PalletSoortID
  		LOC:Geexporteerd = 1
  	END
  	
  	IF LOC:PalletSoortID <> PTG:PalletSoortID THEN
  		ExcelExport.AutoFit(1, 6)
  		
  		! Eerste regel
  		CASE PTG:PalletSoortID
  		OF 1
  			ExcelExport.AddSheet('H1')
  		OF 2
  			ExcelExport.AddSheet('1-way')
  		OF 3
  			ExcelExport.AddSheet('EURO')
  		OF 4
  			ExcelExport.AddSheet('CKW')			
  		END
  		
  		DO Header
  	
  		LOC:PalletSoortID = PTG:PalletSoortID
  	END
  	
  	ExcelExport.PrintString(PTG:RelatieID)	
  	ExcelExport.PrintString(Rel:FirmaNaam)
  	IF PTG:Transporteur THEN
  		ExcelExport.PrintString('Ja')
  	ELSE
  		ExcelExport.PrintString('Nee')
  	END
  	ExcelExport.PrintNumber(PTG:Inkomend)
  	ExcelExport.PrintNumber(PTG:Uitgaand)
  	ExcelExport.PrintNumber(PTG:Uitgaand - PTG:Inkomend)
  	
  	ExcelExport.NextRow()
  END
  	
  ReturnValue = PARENT.TakeRecord()
  RETURN ReturnValue

