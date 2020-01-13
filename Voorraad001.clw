

   MEMBER('Voorraad.clw')                                  ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABREPORT.INC'),ONCE

                     MAP
                       INCLUDE('VOORRAAD001.INC'),ONCE        !Local module procedure declarations
                     END


!!! <summary>
!!! Generated from procedure template - Process
!!! </summary>
ProcessSyncRelatie PROCEDURE 

Loc:PalletBladLayout CSTRING(51)                           ! 
Progress:Thermometer BYTE                                  ! 
Loc:Note             CSTRING(4001)                         ! 
Loc:LotID            LONG                                  ! 
LOC:PalletBladRapportHeaderImage CSTRING(513)              ! 
OpenStaandSaldoQ     QUEUE,PRE(OPQ)                        ! 
DebtorCode           CSTRING(21)                           ! 
Saldo                REAL                                  ! 
DagenOud             LONG                                  ! 
                     END                                   ! 
SynchedRelatieQueue  QUEUE,PRE(SRQ)                        ! 
RelatieID            LONG                                  ! 
                     END                                   ! 
Process:View         VIEW(Relatie_Exact)
                     END
LocEnableEnterByTab  BYTE(1)                               !Used by the ENTER Instead of Tab template
EnterByTabManager    EnterByTabClass
ProgressWindow       WINDOW('Progress...'),AT(,,142,59),FONT('Microsoft Sans Serif',10,,FONT:regular,CHARSET:DEFAULT), |
  DOUBLE,CENTER,GRAY,TIMER(1)
                       PROGRESS,AT(15,15,111,12),USE(Progress:Thermometer),RANGE(0,100)
                       STRING(''),AT(0,3,141,10),USE(?Progress:UserString),CENTER
                       STRING(''),AT(0,30,141,10),USE(?Progress:PctText),CENTER
                       BUTTON('Cancel'),AT(45,42,50,15),USE(?Progress:Cancel),HIDE
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
SQLFILE            FILE,DRIVER('MSSQL','/TURBOSQL=True'),Pre(SF),OWNER(GLO:OWNER)
Record                    RECORD,PRE()
DebtorCode                      String(20)
Saldo                           REAL    
DagenOud                        LONG
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
  GlobalErrors.SetProcedureName('ProcessSyncRelatie')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:Relatie.SetOpenRelated()
  Relate:Relatie.Open                                      ! File Relatie used by this procedure, so make sure it's RelationManager is open
  Relate:Relatie_Exact.Open                                ! File Relatie_Exact used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  FREE(SynchedRelatieQueue)
  SELF.Open(ProgressWindow)                                ! Open window
  WinAlertMouseZoom()
  Do DefineListboxStyle
  INIMgr.Fetch('ProcessSyncRelatie',ProgressWindow)        ! Restore window settings from non-volatile store
  ProgressWindow{Prop:Timer} = 10                          ! Assign timer interval
  ProgressMgr.Init(ScrollSort:AllowNumeric,)
  ThisProcess.Init(Process:View, Relate:Relatie_Exact, ?Progress:PctText, Progress:Thermometer, ProgressMgr, RelE:RelatieID)
  ThisProcess.AddSortOrder(RelE:Relatie_PK)
  ProgressWindow{Prop:Text} = 'Processing Records'
  ?Progress:PctText{Prop:Text} = '0% Completed'
  SELF.Init(ThisProcess)
  ?Progress:UserString{Prop:Text}='Synchroniseren Klanten met Exact'
  SELF.AddItem(?Progress:Cancel, RequestCancelled)
  SEND(Relatie_Exact,'QUICKSCAN=on')
  SELF.SetAlerts()
  Free(OpenStaandSaldoQ)
  
  OPEN(SQLFile)             ! Openstaand Saldo Inlezen
  IF ERROR() THEN STOP(ERROR()&'bij het openen van GRV_DebtorOutstanding').
  
  SQLFile{Prop:SQL} ='CALL dbo.[OpenstaandSaldo]' 
  IF ERROR() THEN STOP(ERROR()&FILEERROR()&'bij het uitvoeren van de SQL ').
  LOOP 
      Next(SQLFile)
      !IF ERROR() THEN STOP(ERROR()&FILEERROR()&'bij de Next op SQL ').
      IF ERROR() THEN BREAK.
      OPQ:DebtorCode=CLIP(LEFT(SQLFile.DebtorCode))
      OPQ:Saldo=SQLFile.Saldo
      OPQ:DagenOud=SQLFILE.DagenOud
      Add(OpenStaandSaldoQ,+OPQ:DebtorCode)
  END
  
  CLOSE(SQLFile)             ! Openstaand Saldo Inlezen
  
  
  !OPQ:DebtorCode='110196'
  !GET(OpenStaandSaldoQ,+OPQ:DebtorCode)
  !IF ERROR() THEN STOP(ERROR()&' bij de GET').
  !Message('Saldo '&OPQ:Saldo)
  EnterByTabManager.Init(False)
  RETURN ReturnValue


ThisWindow.Init PROCEDURE(ProcessClass PC,<REPORT R>,<PrintPreviewClass PV>)

  CODE
  PARENT.Init(PC,R,PV)
  WinAlertMouseZoom()


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
        ThisNetRefresh.Send('|Relatie_Exact|') ! NetTalk (NetRefresh)
  ReturnValue = PARENT.Kill()
  ! Niet gevonden artikel in Relatie verwijderen
  CLEAR(Rel:RelatieID)
  SET(Rel:Relatie_PK,Rel:Relatie_PK)
  LOOP UNTIL Access:Relatie.Next()
  	SRQ:RelatieID = Rel:RelatieID
  	GET(SynchedRelatieQueue, +SRQ:RelatieID)
  	IF ERROR() THEN
  		!db.DebugOut('Relatie Verwijderen OK:' & Rel:RelatieID)
  		Access:Relatie.DeleteRecord(false)
  	ELSE
  		!db.DebugOut('Relatie Verwijderen NO:' & Rel:RelatieID)
  	END
  END
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:Relatie.Close
    Relate:Relatie_Exact.Close
  END
  IF SELF.Opened
    INIMgr.Update('ProcessSyncRelatie',ProgressWindow)     ! Save window data to non-volatile store
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


ThisProcess.TakeRecord PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.TakeRecord()
  Access:Relatie_Exact.TryFetch(RelE:Relatie_PK)
  Rel:RelatieID = RelE:RelatieID
  IF (Access:Relatie.TryFetch(Rel:Relatie_PK) = Level:Benign)
      LOC:PalletBladRapportHeaderImage = Rel:PalletBladRapportHeaderImage
      Loc:Note=Rel:Note
      Loc:LotID=Rel:LotID
      Loc:PalletBladLayout=Rel:PalletBladLayout
  	! Gevonden, dus updaten
      Rel:RelatieID = RelE:RelatieID
      Rel:FirmaNaam=Rele:FirmaNaam
      Rel:Adres1=Rele:Adres1
      Rel:Adres2=Rele:Adres2
      Rel:Postcode=Rele:Postcode
      Rel:Plaats=Rele:Plaats
      Rel:Telefoon=Rele:Telefoon
      Rel:Mobiel=Rele:Mobiel
      Rel:Fax=Rele:Fax
      Rel:Type=Rele:Type
      Rel:Country=Rele:Country
      Rel:ItemCode=Rele:ItemCode
      Rel:PaymentCondition=Rele:PaymentCondition
      
      Rel:PalletBladRapportHeaderImage = LOC:PalletBladRapportHeaderImage
      Rel:Note=Loc:Note
      Rel:LotID=Loc:LotID
      Rel:PalletBladLayout=Loc:PalletBladLayout
      Rel:CreditLine = RelE:CreditLine
      OPQ:DebtorCode=CLIP(LEFT(RelE:Code))
      GET(OpenStaandSaldoQ,+OPQ:DebtorCode)
      IF ERROR()
          Rel:OpenstaandSaldo= 0
          Rel:DagenOud = 0
      ELSE
          Rel:OpenstaandSaldo= OPQ:Saldo
          Rel:DagenOud = OPQ:DagenOud
      END
      Rel:Code=CLIP(LEFT(RelE:Code))
      Rel:Acc_Man=RelE:Acc_Man
      Rel:VatCode=RelE:VatCode
      Rel:cmp_fctry=RelE:cmp_fctry
  	Access:Relatie.Update()
  ELSE
      !Rel:Record = RelE:Record
      Rel:RelatieID = RelE:RelatieID
      Rel:FirmaNaam=Rele:FirmaNaam
      Rel:Adres1=Rele:Adres1
      Rel:Adres2=Rele:Adres2
      Rel:Postcode=Rele:Postcode
      Rel:Plaats=Rele:Plaats
      Rel:Telefoon=Rele:Telefoon
      Rel:Mobiel=Rele:Mobiel
      Rel:Fax=Rele:Fax
      Rel:Type=Rele:Type
      Rel:Country=Rele:Country
      Rel:ItemCode=Rele:ItemCode
      Rel:PaymentCondition=Rele:PaymentCondition
      
      Rel:PalletBladRapportHeaderImage = ''
      Clear(Rel:Note)
      Clear(Rel:LotID)
      Clear(Rel:PalletBladLayout)
      Rel:CreditLine = RelE:CreditLine
      OPQ:DebtorCode=CLIP(LEFT(RelE:Code))
      GET(OpenStaandSaldoQ,+OPQ:DebtorCode)
      IF ERROR()
          Rel:OpenstaandSaldo= 0
          Rel:DagenOud = 0
      ELSE
          Rel:OpenstaandSaldo= OPQ:Saldo
          Rel:DagenOud = OPQ:DagenOud
      END
      Rel:Code=CLIP(LEFT(RelE:Code))
      Rel:Acc_Man=RelE:Acc_Man
      Rel:VatCode=RelE:VatCode
  	Access:Relatie.TryInsert()
  END
  
  ! Verwerkt, dus hoeft niet verwijderd te worden
  SRQ:RelatieID = Rel:RelatieID
  ADD(SynchedRelatieQueue, +SRQ:RelatieID)
  
  RETURN ReturnValue

