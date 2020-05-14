

   MEMBER('VoorrRpt.clw')                                  ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABREPORT.INC'),ONCE

                     MAP
                       INCLUDE('VOORRRPT009.INC'),ONCE        !Local module procedure declarations
                     END


!!! <summary>
!!! Generated from procedure template - Report
!!! </summary>
ReportDymoStickers PROCEDURE (PRM:Bron, PRM:ID)

udpt            UltimateDebugProcedureTracker
Progress:Thermometer BYTE                                  ! 
LOC:EenKeer          LONG                                  ! 
LOC:Weging1          STRING(50)                            ! 
LOC:Weging2          STRING(50)                            ! 
LOC:Weging3          STRING(50)                            ! 
LOC:Weging4          STRING(50)                            ! 
SAV:Printer          CSTRING(200)                          ! 
LOC:DymoPrinter      CSTRING(200)                          ! 
Process:View         VIEW(Versie)
                       PROJECT(VRS:Versie)
                     END
LocEnableEnterByTab  BYTE(1)                               !Used by the ENTER Instead of Tab template
EnterByTabManager    EnterByTabClass
ProgressWindow       WINDOW('Voortgang Stickers...'),AT(,,142,59),DOUBLE,CENTER,GRAY,TIMER(1)
                       PROGRESS,AT(15,15,111,12),USE(Progress:Thermometer),RANGE(0,100)
                       STRING(''),AT(0,3,141,10),USE(?Progress:UserString),CENTER
                       STRING(''),AT(0,30,141,10),USE(?Progress:PctText),CENTER
                       BUTTON('Cancel'),AT(45,42,50,15),USE(?Progress:Cancel)
                     END

Report               REPORT,AT(0,0,8250,6031),PRE(RPT),PAPER(PAPER:USER,8250,11688),LANDSCAPE,FONT('Arial',10,, |
  FONT:regular,CHARSET:ANSI),THOUS
Detail                 DETAIL,AT(0,0,3177,1479),USE(?Detail)
                         STRING(@s50),AT(375,958,3450),USE(LOC:Weging1)
                         STRING(@s50),AT(375,1171,3450),USE(LOC:Weging2)
                         STRING(@s50),AT(375,1371,3450),USE(LOC:Weging3)
                         STRING(@s50),AT(375,1571,3450),USE(LOC:Weging4)
                       END
                     END
    omit('***',WE::CantCloseNowSetHereDone=1)  !Getting Nested omit compile error, then uncheck the "Check for duplicate CantCloseNowSetHere variable declaration" in the WinEvent local template
WE::CantCloseNowSetHereDone equate(1)
WE::CantCloseNowSetHere     long
    !***
ThisWindow           CLASS(ReportManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Init                   PROCEDURE(ProcessClass PC,<REPORT R>,<PrintPreviewClass PV>)
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
OpenReport             PROCEDURE(),BYTE,PROC,DERIVED
TakeEvent              PROCEDURE(),BYTE,PROC,DERIVED
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED
                     END

ThisReport           CLASS(ProcessClass)                   ! Process Manager
Close                  PROCEDURE(),DERIVED
TakeRecord             PROCEDURE(),BYTE,PROC,DERIVED
                     END

ProgressMgr          StepRealClass                         ! Progress Manager

  CODE
  GlobalResponse = ThisWindow.Run()                        ! Opens the window and starts an Accept Loop

!---------------------------------------------------------------------------
DefineListboxStyle ROUTINE
!|
!| This routine create all the styles to be shared in this window
!| It`s called after the window open
!|
!---------------------------------------------------------------------------
VulSticker          ROUTINE
	LOC:Weging1 = ''
	LOC:Weging2 = ''
	LOC:Weging3 = ''
	LOC:Weging4 = ''

	IF (PRM:Bron = 1) ! Bron is de weging-tabel
		Weg:WegingID = PRM:ID
		IF(Access:Weging.TryFetch(Weg:PK_Weging) = Level:Benign)
			CLEAR(PalSrt:Record)
			PalSrt:PalletSoortID = Weg:PalletSoortID
			Access:PalletSoort.TryFetch(PalSrt:PK_PalletSoort)
			
			LOC:Weging1 = 'BRUTO: ' & CLIP(LEFT(FORMAT(Weg:BrutoGewicht,@n14`2))) & ' KG'
			LOC:Weging2 = 'TARRA: ' & CLIP(PalSrt:PalletOmschrijving) & ' / ' & CLIP(LEFT(FORMAT(Weg:Tarra,@n14`2))) & ' KG'
			LOC:Weging3 = 'NETTO: ' & CLIP(LEFT(FORMAT(Weg:NettoGewicht,@n14`2))) & ' KG'
		.
	ELSIF (PRM:Bron = 2) ! Bron is de GLO:WegingQueue
		CLEAR(GLO:WegingQueue)
		GET(GLO:WegingQueue, PRM:ID)
		IF NOT(ERROR())
			CLEAR(PalSrt:Record)
			PalSrt:PalletSoortID = WGQ:PalletsoortID
			Access:PalletSoort.TryFetch(PalSrt:PK_PalletSoort)
			
			LOC:Weging1 = 'BRUTO: ' & CLIP(LEFT(FORMAT(WGQ:BrutoGewichtKG,@n14`2))) & ' KG'
			LOC:Weging2 = 'TARRA: ' & CLIP(PalSrt:PalletOmschrijving) & ' / ' & CLIP(LEFT(FORMAT(PalSrt:Tarra,@n14`2))) & ' KG'
			LOC:Weging3 = 'NETTO: ' & CLIP(LEFT(FORMAT(WGQ:NettoGewichtKG,@n14`2))) & ' KG'
		END
	END
	
	EXIT

ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
        udpt.Init(UD,'ReportDymoStickers','VoorrRpt009.clw','VoorrRpt.DLL','05/14/2020 @ 05:27PM')    
             
  GlobalErrors.SetProcedureName('ReportDymoStickers')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  LOC:EenKeer = 0
  LOC:DymoPrinter=GETINI('Printer','DymoPrinter',,'.\Voorraad.ini')
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:PalletSoort.Open                                  ! File PalletSoort used by this procedure, so make sure it's RelationManager is open
  Relate:Versie.Open                                       ! File Versie used by this procedure, so make sure it's RelationManager is open
  Relate:Weging.Open                                       ! File Weging used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(ProgressWindow)                                ! Open window
  WinAlertMouseZoom()
  Do DefineListboxStyle
  ProgressWindow{Prop:Alrt,255} = CtrlShiftP
  INIMgr.Fetch('ReportDymoStickers',ProgressWindow)        ! Restore window settings from non-volatile store
  ProgressMgr.Init(ScrollSort:AllowNumeric,)
  ThisReport.Init(Process:View, Relate:Versie, ?Progress:PctText, Progress:Thermometer, ProgressMgr, VRS:Versie)
  ThisReport.AddSortOrder(VRS:Versie_PK)
  SELF.AddItem(?Progress:Cancel,RequestCancelled)
  SELF.Init(ThisReport,Report)
  ?Progress:UserString{PROP:Text} = ''
  Relate:Versie.SetQuickScan(1,Propagate:OneMany)
  ProgressWindow{PROP:Timer} = 10                          ! Assign timer interval
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
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:PalletSoort.Close
    Relate:Versie.Close
    Relate:Weging.Close
  END
  IF SELF.Opened
    INIMgr.Update('ReportDymoStickers',ProgressWindow)     ! Save window data to non-volatile store
  END
  ProgressMgr.Kill()
  GlobalErrors.SetProcedureName
            
   
  IF BAND(Keystate(),KeyStateUD:Shift) 
        UD.ShowProcedureInfo('ReportDymoStickers',UD.SetApplicationName('VoorrRpt','DLL'),ProgressWindow{PROP:Hlp},'06/10/2011 @ 11:53AM','05/14/2020 @ 05:27PM','05/15/2020 @ 11:19AM')  
    
  END
  RETURN ReturnValue


ThisWindow.OpenReport PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  	SAV:Printer=PRINTER{PROPPRINT:Device}
  	IF LOC:DymoPrinter<>''
  		PRINTER{PROPPRINT:Device}=Loc:DymoPrinter
  	End
  ReturnValue = PARENT.OpenReport()
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


ThisReport.Close PROCEDURE

  CODE
  PARENT.Close
      if SAV:Printer<>''
  		PRINTER{PROPPRINT:Device}=SAV:Printer
  	END


ThisReport.TakeRecord PROCEDURE

ReturnValue          BYTE,AUTO

SkipDetails BYTE
  CODE
  ReturnValue = PARENT.TakeRecord()
  IF (LOC:EenKeer = 0)
  	DO VulSticker
  PRINT(RPT:Detail)
  	LOC:EenKeer = 1
  END
  RETURN ReturnValue

