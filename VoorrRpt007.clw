

   MEMBER('VoorrRpt.clw')                                  ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABREPORT.INC'),ONCE

                     MAP
                       INCLUDE('VOORRRPT007.INC'),ONCE        !Local module procedure declarations
                     END


!!! <summary>
!!! Generated from procedure template - Report
!!! </summary>
ReportPalletStickers PROCEDURE 

udpt            UltimateDebugProcedureTracker
Progress:Thermometer BYTE                                  ! 
Loc:AansturingsString STRING(256)                          ! 
Loc:PalletNummer     LONG                                  ! 
Loc:AantalPallets    BYTE                                  ! 
Loc:PalletEtiketPrinter CSTRING(199)                       ! 
LOC:LabelLength      LONG                                  ! 
LOC:LabelLengthZPL   LONG                                  ! 
LOC:LabelPositieZPL  STRING(50)                            ! 
SAV:Printer          CSTRING(199)                          ! 
Process:View         VIEW(Partij)
                       PROJECT(Par:PartijID)
                     END
LocEnableEnterByTab  BYTE(1)                               !Used by the ENTER Instead of Tab template
EnterByTabManager    EnterByTabClass
ProgressWindow       WINDOW('Voortgang Palletstickers...'),AT(,,142,77),FONT('Microsoft Sans Serif',10,,,CHARSET:DEFAULT), |
  DOUBLE,CENTER,GRAY,TIMER(1)
                       PROMPT('Aantal Pallets:'),AT(14,3),USE(?Loc:AantalPallets:Prompt)
                       ENTRY(@n3),AT(64,2,20,10),USE(Loc:AantalPallets)
                       PROGRESS,AT(15,34,111,12),USE(Progress:Thermometer),RANGE(0,100)
                       STRING(''),AT(0,22,141,10),USE(?Progress:UserString),CENTER
                       STRING(''),AT(0,48,141,10),USE(?Progress:PctText),CENTER
                       BUTTON('Cancel'),AT(76,60,50,15),USE(?Progress:Cancel)
                       BUTTON('Pause'),AT(19,62),USE(?Pause),KEY(F2Key),DEFAULT
                     END

Report               REPORT,AT(0,0,7740,10875),PRE(RPT),PAPER(PAPER:A4),FONT(,,,,CHARSET:ANSI),THOUS
Detail                 DETAIL,AT(0,0),USE(?Detail)
                         STRING(@s255),AT(0,0,7365),USE(Loc:AansturingsString)
                       END
                     END
    omit('***',WE::CantCloseNowSetHereDone=1)  !Getting Nested omit compile error, then uncheck the "Check for duplicate CantCloseNowSetHere variable declaration" in the WinEvent local template
WE::CantCloseNowSetHereDone equate(1)
WE::CantCloseNowSetHere     long
    !***
ReportMemoryRecords     BYTE(0)                            ! Used to do the first Next call
ThisWindow           CLASS(ReportManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Init                   PROCEDURE(ProcessClass PC,<REPORT R>,<PrintPreviewClass PV>)
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
Next                   PROCEDURE(),BYTE,PROC,DERIVED
OpenReport             PROCEDURE(),BYTE,PROC,DERIVED
Paused                 BYTE
Timer                  LONG
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED
TakeEvent              PROCEDURE(),BYTE,PROC,DERIVED
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED
                     END

ThisReport           CLASS(ProcessClass)                   ! Process Manager
Close                  PROCEDURE(),DERIVED
TakeRecord             PROCEDURE(),BYTE,PROC,DERIVED
                     END

ProgressMgr          StepLongClass                         ! Progress Manager

  CODE
  GlobalResponse = ThisWindow.Run()                        ! Opens the window and starts an Accept Loop
  RETURN(Loc:AantalPallets)

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
        udpt.Init(UD,'ReportPalletStickers','VoorrRpt007.clw','VoorrRpt.DLL','06/02/2020 @ 02:25PM')    
             
  GlobalErrors.SetProcedureName('ReportPalletStickers')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Loc:AantalPallets:Prompt
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Loc:PalletEtiketPrinter=GETINI('Printer','PalletEtiket',,'.\Voorraad.ini')
  LOC:LabelLength=GETINI('Printer','LabelLength',104, '.\Voorraad.ini')
  LOC:LabelLengthZPL=ROUND(LOC:LabelLength*8.8173,1)
  LOC:LabelPositieZPL=GETINI('Printer','LabelPositieZPL','^FO100,120^AFR,560,200^FD','.\Voorraad.ini')
  db.DebugOut('LOC:LabelLengthZPL:'&LOC:LabelLengthZPL)
  Relate:Partij.Open                                       ! File Partij used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  db.DebugOut('Printen pallets ' & Par:Pallets & ',' & Par:PalletsGeprint)
  IF Par:Pallets>=Par:PalletsGeprint THEN
  	Loc:AantalPallets=Par:Pallets-Par:PalletsGeprint
  ELSE
  	Loc:AantalPallets=0
  END
  SELF.Open(ProgressWindow)                                ! Open window
  WinAlertMouseZoom()
  Do DefineListboxStyle
  ProgressWindow{Prop:Alrt,255} = CtrlShiftP
  INIMgr.Fetch('ReportPalletStickers',ProgressWindow)      ! Restore window settings from non-volatile store
  ProgressMgr.Init(ScrollSort:AllowNumeric,)
  ThisReport.Init(Process:View, Relate:Partij, ?Progress:PctText, Progress:Thermometer, 0)
  ThisReport.AddSortOrder()
  SELF.AddItem(?Progress:Cancel,RequestCancelled)
  SELF.Init(ThisReport,Report)
  ?Progress:UserString{PROP:Text} = ''
  ProgressWindow{PROP:Timer} = 10                          ! Assign timer interval
  ASSERT(~SELF.DeferWindow) ! A hidden Go button is not smart ...
  SELF.KeepVisible = 1
  SELF.DeferOpenReport = 1
  SELF.Timer = TARGET{PROP:Timer}
  TARGET{PROP:Timer} = 0
  ?Pause{PROP:Text} = 'F2 = Start'
  SELF.Paused = 1
  ?Progress:Cancel{PROP:Key} = EscKey
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
    Relate:Partij.Close
  END
  IF SELF.Opened
    INIMgr.Update('ReportPalletStickers',ProgressWindow)   ! Save window data to non-volatile store
  END
  ProgressMgr.Kill()
  GlobalErrors.SetProcedureName
            
   
  IF BAND(Keystate(),KeyStateUD:Shift) 
        UD.ShowProcedureInfo('ReportPalletStickers',UD.SetApplicationName('VoorrRpt','DLL'),ProgressWindow{PROP:Hlp},'06/10/2011 @ 11:53AM','06/02/2020 @ 02:25PM','06/03/2020 @ 11:38AM')  
    
  END
  RETURN ReturnValue


ThisWindow.Next PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
    IF ReportMemoryRecords=0 THEN
       ReportMemoryRecords+=1
       RETURN Level:Benign
    ELSE
       SELF.Response = RequestCompleted
       POST(EVENT:CloseWindow)
       RETURN Level:Notify
    END
  ReturnValue = PARENT.Next()
  RETURN ReturnValue


ThisWindow.OpenReport PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  	SAV:Printer=PRINTER{PROPPRINT:Device}
  	IF Loc:PalletEtiketPrinter<>''
  		PRINTER{PROPPRINT:Device}=Loc:PalletEtiketPrinter
  	End
  ReturnValue = PARENT.OpenReport()
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
    OF ?Pause
      IF SELF.Paused
        TARGET{PROP:Timer} = SELF.Timer
        ?Pause{PROP:Text} = 'Pause'
      ELSE
        SELF.Timer = TARGET{PROP:Timer}
        TARGET{PROP:Timer} = 0
        ?Pause{PROP:Text} = 'Restart'
      END
      SELF.Paused = 1 - SELF.Paused
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
    OF EVENT:Timer
      IF SELF.Paused THEN RETURN Level:Benign .
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
  Loc:AansturingsString = '^XA'
  PRINT(RPT:Detail)
  Loc:AansturingsString = '^LL'&CLIP(LOC:LabelLengthZPL) ! was 816
  PRINT(RPT:Detail)
  Loc:AansturingsString = '^LH2,2'
  PRINT(RPT:Detail)
  Loc:AansturingsString = '^FO1,1^AD,1,1^FD.^FS'
  PRINT(RPT:Detail)
  Loc:AansturingsString = CLIP(LOC:LabelPositieZPL)&'.'&CLIP(Par:PartijID)&'^FS'
  !Loc:AansturingsString = '^FO100,120^AFR,560,200^FD.'&CLIP(Par:PartijID)&'^FS'
  PRINT(RPT:Detail)
  Loc:AansturingsString = '^PQ'&Loc:AantalPallets
  PRINT(RPT:Detail)
  Loc:AansturingsString = '^XZ'
  PRINT(RPT:Detail)
  RETURN ReturnValue

