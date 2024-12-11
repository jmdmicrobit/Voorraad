

   MEMBER('VoorrStm.clw')                                  ! This is a MEMBER module


   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABUTIL.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('VOORRSTM018.INC'),ONCE        !Local module procedure declarations
                     END


!!! <summary>
!!! Generated from procedure template - Window
!!! Form Relatie
!!! </summary>
UpdateRelatie PROCEDURE 

CurrentTab           STRING(80)                            ! 
Loc:Text             STRING(64000)                         ! 
ActionMessage        CSTRING(40)                           ! 
LocEnableEnterByTab  BYTE(1)                               !Used by the ENTER Instead of Tab template
EnterByTabManager    EnterByTabClass
History::Rel:Record  LIKE(Rel:RECORD),THREAD
QuickWindow          WINDOW('Form Relatie'),AT(,,328,388),FONT('MS Sans Serif',8,,,CHARSET:DEFAULT),RESIZE,CENTER, |
  GRAY,IMM,MDI,HLP('UpdateRelatie'),SYSTEM
                       PROMPT('Firma Naam:'),AT(3,5),USE(?Rel:FirmaNaam:Prompt),TRN
                       ENTRY(@s50),AT(119,6,204,10),USE(Rel:FirmaNaam),DISABLE
                       PROMPT('Adres 1:'),AT(3,18),USE(?Rel:Adres1:Prompt),TRN
                       ENTRY(@s50),AT(119,21,204,10),USE(Rel:Adres1),DISABLE
                       PROMPT('Adres 2:'),AT(3,34),USE(?Rel:Adres2:Prompt),TRN
                       ENTRY(@s50),AT(119,34,204,10),USE(Rel:Adres2),DISABLE
                       PROMPT('Postcode:'),AT(3,48),USE(?Rel:Postcode:Prompt),TRN
                       ENTRY(@s10),AT(119,49,44,10),USE(Rel:Postcode),DISABLE
                       PROMPT('Plaats:'),AT(3,61),USE(?Rel:Plaats:Prompt),TRN
                       ENTRY(@s50),AT(119,62,204,10),USE(Rel:Plaats),DISABLE
                       PROMPT('Telefoon:'),AT(3,74),USE(?Rel:Telefoon:Prompt),TRN
                       ENTRY(@s15),AT(119,77,64,10),USE(Rel:Telefoon),DISABLE
                       PROMPT('Mobiel:'),AT(3,90),USE(?Rel:Mobiel:Prompt),TRN
                       ENTRY(@s15),AT(119,90,64,10),USE(Rel:Mobiel),DISABLE
                       PROMPT('Fax:'),AT(3,103),USE(?Rel:Fax:Prompt),TRN
                       ENTRY(@s15),AT(119,103,64,10),USE(Rel:Fax),DISABLE
                       ENTRY(@s255),AT(119,131,179),USE(Rel:PalletBladRapportHeaderImage)
                       BUTTON('...'),AT(304,130,12,12),USE(?LookupFile)
                       STRING('Palletbladrapport-header afbeelding:'),AT(3,131),USE(?AfbeeldingString)
                       ENTRY(@s60),AT(119,116,64,10),USE(Rel:Country),DISABLE
                       PROMPT('Land:'),AT(3,116),USE(?Rel:Fax:Prompt:2),TRN
                       STRING('Beeldverhouding 1:3,333'),AT(118,148,93,10),USE(?AfbeeldingString:2),FONT('Microsoft ' & |
  'Sans Serif',,,FONT:regular+FONT:italic)
                       PROMPT('Payment Condition:'),AT(4,160),USE(?Rel:PaymentCondition:Prompt)
                       ENTRY(@s2),AT(119,161,60,10),USE(Rel:PaymentCondition),DISABLE
                       PROMPT('Lot ID:'),AT(4,175),USE(?Rel:LotID:Prompt)
                       LIST,AT(119,175,,10),USE(Rel:LotID),RIGHT(1),DROP(3),FROM('1|2|3')
                       PROMPT('Note:'),AT(4,189),USE(?Rel:Note:Prompt)
                       TEXT,AT(119,190,197),USE(Rel:Note,,?Rel:Note:2)
                       PROMPT('Acc Man:'),AT(4,245),USE(?Rel:Acc_Man:Prompt)
                       ENTRY(@n_10),AT(119,244,60,10),USE(Rel:Acc_Man),RIGHT(1),DISABLE
                       PROMPT('Vat Code:'),AT(4,258),USE(?Rel:VatCode:Prompt)
                       ENTRY(@s3),AT(119,257,60,10),USE(Rel:VatCode),DISABLE
                       PROMPT('cmp_fctry:'),AT(4,271),USE(?Rel:cmp_fctry:Prompt)
                       ENTRY(@s3),AT(119,271,60,10),USE(Rel:cmp_fctry),DISABLE
                       PROMPT('CMROpmerking'),AT(4,286),USE(?PROMPT1)
                       TEXT,AT(119,286,197,31),USE(Rel:CMROpmerking)
                       BUTTON('&OK'),AT(219,351,49,14),USE(?OK),LEFT,ICON('WAOK.ICO'),DEFAULT,FLAT,MSG('Accept dat' & |
  'a and close the window'),TIP('Accept data and close the window')
                       BUTTON('&Cancel'),AT(271,351,49,14),USE(?Cancel),LEFT,ICON('WACANCEL.ICO'),FLAT,MSG('Cancel operation'), |
  TIP('Cancel operation')
                       PROMPT('Pallet Blad Layout:'),AT(3,326),USE(?Rel:PalletBladLayout:Prompt)
                       LIST,AT(119,323,197),USE(Rel:PalletBladLayout),DROP(5),FROM('Mantos|#Mantos|Abbelen|#Abbelen')
                     END

ThisWindow           CLASS(WindowManager)
Ask                    PROCEDURE(),DERIVED
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
Run                    PROCEDURE(),BYTE,PROC,DERIVED
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED
TakeEvent              PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
Resizer              CLASS(WindowResizeClass)
Init                   PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)
                     END

FileLookup9          SelectFileClass
CurCtrlFeq          LONG
FieldColorQueue     QUEUE
Feq                   LONG
OldColor              LONG
                    END

  CODE
? DEBUGHOOK(Relatie:Record)
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
  GlobalErrors.SetProcedureName('UpdateRelatie')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Rel:FirmaNaam:Prompt
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
  SELF.HistoryKey = CtrlH
  SELF.AddHistoryFile(Rel:Record,History::Rel:Record)
  SELF.AddHistoryField(?Rel:FirmaNaam,2)
  SELF.AddHistoryField(?Rel:Adres1,3)
  SELF.AddHistoryField(?Rel:Adres2,4)
  SELF.AddHistoryField(?Rel:Postcode,5)
  SELF.AddHistoryField(?Rel:Plaats,6)
  SELF.AddHistoryField(?Rel:Telefoon,7)
  SELF.AddHistoryField(?Rel:Mobiel,8)
  SELF.AddHistoryField(?Rel:Fax,9)
  SELF.AddHistoryField(?Rel:PalletBladRapportHeaderImage,14)
  SELF.AddHistoryField(?Rel:Country,11)
  SELF.AddHistoryField(?Rel:PaymentCondition,13)
  SELF.AddHistoryField(?Rel:LotID,16)
  SELF.AddHistoryField(?Rel:Note:2,15)
  SELF.AddHistoryField(?Rel:Acc_Man,21)
  SELF.AddHistoryField(?Rel:VatCode,22)
  SELF.AddHistoryField(?Rel:cmp_fctry,23)
  SELF.AddHistoryField(?Rel:CMROpmerking,24)
  SELF.AddHistoryField(?Rel:PalletBladLayout,25)
  SELF.AddUpdateFile(Access:Relatie)
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  Relate:Relatie.SetOpenRelated()
  Relate:Relatie.Open                                      ! File Relatie used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Primary &= Relate:Relatie
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
  Do DefineListboxStyle
  IF SELF.Request = ViewRecord                             ! Configure controls for View Only mode
    ?Rel:FirmaNaam{PROP:ReadOnly} = True
    ?Rel:Adres1{PROP:ReadOnly} = True
    ?Rel:Adres2{PROP:ReadOnly} = True
    ?Rel:Postcode{PROP:ReadOnly} = True
    ?Rel:Plaats{PROP:ReadOnly} = True
    ?Rel:Telefoon{PROP:ReadOnly} = True
    ?Rel:Mobiel{PROP:ReadOnly} = True
    ?Rel:Fax{PROP:ReadOnly} = True
    ?Rel:PalletBladRapportHeaderImage{PROP:ReadOnly} = True
    DISABLE(?LookupFile)
    ?Rel:Country{PROP:ReadOnly} = True
    ?Rel:PaymentCondition{PROP:ReadOnly} = True
    DISABLE(?Rel:LotID)
    ?Rel:Acc_Man{PROP:ReadOnly} = True
    ?Rel:VatCode{PROP:ReadOnly} = True
    ?Rel:cmp_fctry{PROP:ReadOnly} = True
    DISABLE(?Rel:PalletBladLayout)
  END
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('UpdateRelatie',QuickWindow)                ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  FileLookup9.Init
  FileLookup9.ClearOnCancel = True
  FileLookup9.Flags=BOR(FileLookup9.Flags,FILE:LongName)   ! Allow long filenames
  FileLookup9.SetMask('All Files','*.*')                   ! Set the file mask
  FileLookup9.WindowTitle='Selecteren palletbladrapport-header afbeelding.'
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
    Relate:Relatie.Close
  END
  IF SELF.Opened
    INIMgr.Update('UpdateRelatie',QuickWindow)             ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
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
    OF ?LookupFile
      ThisWindow.Update()
      Rel:PalletBladRapportHeaderImage = FileLookup9.Ask(0)
      DISPLAY
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
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window

