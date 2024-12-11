

   MEMBER('VoorrStm.clw')                                  ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABPOPUP.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('VOORRSTM019.INC'),ONCE        !Local module procedure declarations
                     END


!!! <summary>
!!! Generated from procedure template - Window
!!! Browse the Relatie file
!!! </summary>
BrowseRelatie PROCEDURE 

CurrentTab           STRING(80)                            ! 
BRW1::View:Browse    VIEW(Relatie)
                       PROJECT(Rel:NietActief)
                       PROJECT(Rel:FirmaNaam)
                       PROJECT(Rel:Adres1)
                       PROJECT(Rel:Adres2)
                       PROJECT(Rel:Postcode)
                       PROJECT(Rel:Plaats)
                       PROJECT(Rel:Telefoon)
                       PROJECT(Rel:Mobiel)
                       PROJECT(Rel:Fax)
                       PROJECT(Rel:Country)
                       PROJECT(Rel:PalletBladRapportHeaderImage)
                       PROJECT(Rel:RelatieID)
                       PROJECT(Rel:PaymentCondition)
                       PROJECT(Rel:OpenstaandSaldo)
                       PROJECT(Rel:CreditLine)
                       PROJECT(Rel:Code)
                       PROJECT(Rel:Acc_Man)
                       PROJECT(Rel:VatCode)
                       PROJECT(Rel:cmp_fctry)
                       PROJECT(Rel:Type)
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
Rel:NietActief         LIKE(Rel:NietActief)           !List box control field - type derived from field
Rel:NietActief_NormalFG LONG                          !Normal forground color
Rel:NietActief_NormalBG LONG                          !Normal background color
Rel:NietActief_SelectedFG LONG                        !Selected forground color
Rel:NietActief_SelectedBG LONG                        !Selected background color
Rel:NietActief_Icon    LONG                           !Entry's icon ID
Rel:FirmaNaam          LIKE(Rel:FirmaNaam)            !List box control field - type derived from field
Rel:FirmaNaam_NormalFG LONG                           !Normal forground color
Rel:FirmaNaam_NormalBG LONG                           !Normal background color
Rel:FirmaNaam_SelectedFG LONG                         !Selected forground color
Rel:FirmaNaam_SelectedBG LONG                         !Selected background color
Rel:Adres1             LIKE(Rel:Adres1)               !List box control field - type derived from field
Rel:Adres1_NormalFG    LONG                           !Normal forground color
Rel:Adres1_NormalBG    LONG                           !Normal background color
Rel:Adres1_SelectedFG  LONG                           !Selected forground color
Rel:Adres1_SelectedBG  LONG                           !Selected background color
Rel:Adres2             LIKE(Rel:Adres2)               !List box control field - type derived from field
Rel:Adres2_NormalFG    LONG                           !Normal forground color
Rel:Adres2_NormalBG    LONG                           !Normal background color
Rel:Adres2_SelectedFG  LONG                           !Selected forground color
Rel:Adres2_SelectedBG  LONG                           !Selected background color
Rel:Postcode           LIKE(Rel:Postcode)             !List box control field - type derived from field
Rel:Postcode_NormalFG  LONG                           !Normal forground color
Rel:Postcode_NormalBG  LONG                           !Normal background color
Rel:Postcode_SelectedFG LONG                          !Selected forground color
Rel:Postcode_SelectedBG LONG                          !Selected background color
Rel:Plaats             LIKE(Rel:Plaats)               !List box control field - type derived from field
Rel:Plaats_NormalFG    LONG                           !Normal forground color
Rel:Plaats_NormalBG    LONG                           !Normal background color
Rel:Plaats_SelectedFG  LONG                           !Selected forground color
Rel:Plaats_SelectedBG  LONG                           !Selected background color
Rel:Telefoon           LIKE(Rel:Telefoon)             !List box control field - type derived from field
Rel:Telefoon_NormalFG  LONG                           !Normal forground color
Rel:Telefoon_NormalBG  LONG                           !Normal background color
Rel:Telefoon_SelectedFG LONG                          !Selected forground color
Rel:Telefoon_SelectedBG LONG                          !Selected background color
Rel:Mobiel             LIKE(Rel:Mobiel)               !List box control field - type derived from field
Rel:Mobiel_NormalFG    LONG                           !Normal forground color
Rel:Mobiel_NormalBG    LONG                           !Normal background color
Rel:Mobiel_SelectedFG  LONG                           !Selected forground color
Rel:Mobiel_SelectedBG  LONG                           !Selected background color
Rel:Fax                LIKE(Rel:Fax)                  !List box control field - type derived from field
Rel:Fax_NormalFG       LONG                           !Normal forground color
Rel:Fax_NormalBG       LONG                           !Normal background color
Rel:Fax_SelectedFG     LONG                           !Selected forground color
Rel:Fax_SelectedBG     LONG                           !Selected background color
Rel:Country            LIKE(Rel:Country)              !List box control field - type derived from field
Rel:Country_NormalFG   LONG                           !Normal forground color
Rel:Country_NormalBG   LONG                           !Normal background color
Rel:Country_SelectedFG LONG                           !Selected forground color
Rel:Country_SelectedBG LONG                           !Selected background color
Rel:PalletBladRapportHeaderImage LIKE(Rel:PalletBladRapportHeaderImage) !List box control field - type derived from field
Rel:PalletBladRapportHeaderImage_NormalFG LONG        !Normal forground color
Rel:PalletBladRapportHeaderImage_NormalBG LONG        !Normal background color
Rel:PalletBladRapportHeaderImage_SelectedFG LONG      !Selected forground color
Rel:PalletBladRapportHeaderImage_SelectedBG LONG      !Selected background color
Rel:RelatieID          LIKE(Rel:RelatieID)            !List box control field - type derived from field
Rel:RelatieID_NormalFG LONG                           !Normal forground color
Rel:RelatieID_NormalBG LONG                           !Normal background color
Rel:RelatieID_SelectedFG LONG                         !Selected forground color
Rel:RelatieID_SelectedBG LONG                         !Selected background color
Rel:PaymentCondition   LIKE(Rel:PaymentCondition)     !List box control field - type derived from field
Rel:PaymentCondition_NormalFG LONG                    !Normal forground color
Rel:PaymentCondition_NormalBG LONG                    !Normal background color
Rel:PaymentCondition_SelectedFG LONG                  !Selected forground color
Rel:PaymentCondition_SelectedBG LONG                  !Selected background color
Rel:OpenstaandSaldo    LIKE(Rel:OpenstaandSaldo)      !List box control field - type derived from field
Rel:OpenstaandSaldo_NormalFG LONG                     !Normal forground color
Rel:OpenstaandSaldo_NormalBG LONG                     !Normal background color
Rel:OpenstaandSaldo_SelectedFG LONG                   !Selected forground color
Rel:OpenstaandSaldo_SelectedBG LONG                   !Selected background color
Rel:CreditLine         LIKE(Rel:CreditLine)           !List box control field - type derived from field
Rel:CreditLine_NormalFG LONG                          !Normal forground color
Rel:CreditLine_NormalBG LONG                          !Normal background color
Rel:CreditLine_SelectedFG LONG                        !Selected forground color
Rel:CreditLine_SelectedBG LONG                        !Selected background color
Rel:Code               LIKE(Rel:Code)                 !List box control field - type derived from field
Rel:Code_NormalFG      LONG                           !Normal forground color
Rel:Code_NormalBG      LONG                           !Normal background color
Rel:Code_SelectedFG    LONG                           !Selected forground color
Rel:Code_SelectedBG    LONG                           !Selected background color
Rel:Acc_Man            LIKE(Rel:Acc_Man)              !List box control field - type derived from field
Rel:Acc_Man_NormalFG   LONG                           !Normal forground color
Rel:Acc_Man_NormalBG   LONG                           !Normal background color
Rel:Acc_Man_SelectedFG LONG                           !Selected forground color
Rel:Acc_Man_SelectedBG LONG                           !Selected background color
Rel:VatCode            LIKE(Rel:VatCode)              !List box control field - type derived from field
Rel:VatCode_NormalFG   LONG                           !Normal forground color
Rel:VatCode_NormalBG   LONG                           !Normal background color
Rel:VatCode_SelectedFG LONG                           !Selected forground color
Rel:VatCode_SelectedBG LONG                           !Selected background color
Rel:cmp_fctry          LIKE(Rel:cmp_fctry)            !List box control field - type derived from field
Rel:cmp_fctry_NormalFG LONG                           !Normal forground color
Rel:cmp_fctry_NormalBG LONG                           !Normal background color
Rel:cmp_fctry_SelectedFG LONG                         !Selected forground color
Rel:cmp_fctry_SelectedBG LONG                         !Selected background color
Rel:Type               LIKE(Rel:Type)                 !Browse hot field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
LocEnableEnterByTab  BYTE(1)                               !Used by the ENTER Instead of Tab template
EnterByTabManager    EnterByTabClass
QuickWindow          WINDOW('Relaties'),AT(,,527,337),FONT('MS Sans Serif',8,,,CHARSET:DEFAULT),RESIZE,CENTER,GRAY, |
  IMM,MAX,MDI,HLP('BrowseRelatie'),SYSTEM
                       LIST,AT(8,30,507,250),USE(?Browse:1),HVSCROLL,FORMAT('34L(2)|M*I~Niet Actief~L(0)@p p@8' & |
  '0L(2)|M*~Firma Naam~@s50@80L(2)|M*~Adres 1~@s50@80L(2)|M*~Adres 2~@s50@44L(2)|M*~Pos' & |
  'tcode~@s10@80L(2)|M*~Plaats~@s50@64L(2)|M*~Telefoon~@s15@64L(2)|M*~Mobiel~@s15@64L(2' & |
  ')|M*~Fax~@s15@64L(2)|M*~Land~@s60@102L(2)|M*~Palletbladreport-header Afbeelding~@s25' & |
  '5@57L(2)|M*~Relatie ID~L(0)@n-14@26L(2)|M*~Payment Condition~L(0)@s2@40L(2)|M*~Opens' & |
  'taand Saldo~D(14)@n10.2@40L(2)|M*~Credit Line~D(14)@n10.2@80L(2)|M*~Code~D(0)@s20@38' & |
  'R(2)|M*~Acc Man~R(1)@n_6@30R(2)|M*~Vat Code~R(0)@s3@12R(2)|M*~cmp_fctry~R(0)@s3@'),FROM(Queue:Browse:1), |
  IMM,MSG('Browsing the Relatie file')
                       BUTTON('&Wijzigen'),AT(459,285,57,14),USE(?Change:3),LEFT,ICON('WACHANGE.ICO'),DEFAULT,FLAT, |
  MSG('Change the Record'),TIP('Change the Record')
                       SHEET,AT(4,4,521,303),USE(?CurrentTab)
                         TAB('&1) Alle relaties'),USE(?Tab:2)
                         END
                         TAB('&2) Klanten'),USE(?TAB1)
                         END
                         TAB('&3) Leveranciers'),USE(?TAB2)
                         END
                       END
                       BUTTON('&Sluiten'),AT(475,318,49,14),USE(?Close),LEFT,ICON('WACLOSE.ICO'),FLAT,MSG('Close Window'), |
  TIP('Close Window')
                       GROUP('Fu&zzy Search Options'),AT(7,309,199,24),USE(?FuzzyGroup),BOXED
                         ENTRY(@S255),AT(11,319,100,10),USE(?FuzzyQuery)
                         BUTTON('&Search'),AT(115,318,42,12),USE(?FuzzyGo)
                         BUTTON('&Clear'),AT(159,318,42,12),USE(?FuzzyClear)
                       END
                       BUTTON('Excel'),AT(432,318),USE(?Excel)
                     END
FuzzyOrder7          BYTE,AUTO
FuzzyQuery7          STRING(255)

ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
Run                    PROCEDURE(USHORT Number,BYTE Request),BYTE,PROC,DERIVED
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED
TakeEvent              PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
BRW1                 CLASS(BrowseClass)                    ! Browse using ?Browse:1
Q                      &Queue:Browse:1                !Reference to browse queue
Fetch                  PROCEDURE(BYTE Direction),DERIVED
Init                   PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)
ResetSort              PROCEDURE(BYTE Force),BYTE,PROC,DERIVED
SetQueueRecord         PROCEDURE(),DERIVED
                     END

BRW1::Sort0:Locator  IncrementalLocatorClass               ! Default Locator
BRW1::Sort1:Locator  IncrementalLocatorClass               ! Conditional Locator - CHOICE(?CurrentTab)=2
BRW1::Sort2:Locator  IncrementalLocatorClass               ! Conditional Locator - CHOICE(?CurrentTab)=3
Resizer              CLASS(WindowResizeClass)
Init                   PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)
                     END



ExcelClass         Class
InitOle                 Procedure(<BYTE pDebug>)
MaakExcel               Procedure()
OpenExcel               Procedure(String)
SluitExcel              Procedure(Byte)
BepaalKolom             Procedure(LONG),String
SchrijfExcel            Procedure(String, LONG, String)
MaakWerkBlad            Procedure(<String>)
NumberFormat            Procedure(String pKolomVanaf, LONG pRijVanaf, String pKolomTM, LONG pRijTM, String pNumberFormat)
AutoFitColumns          Procedure(String pKolomVanaf, String pKolomTM)
AutoFitRows             Procedure(LONG pRijVanaf,LONG pRijTM)

FullDebug               BYTE

Bedrag              STRING('Bedrag')
Datum               STRING('Datum')

                   End
                   
                   
Loc:Ole            CString(21)
Loc:Rij            Long
Loc:OleInit        Byte


  CODE
? DEBUGHOOK(Inkoop:Record)
? DEBUGHOOK(Relatie:Record)
? DEBUGHOOK(Verkoop:Record)
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
  GlobalErrors.SetProcedureName('BrowseRelatie')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Browse:1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('FuzzyMatch',FuzzyMatch)                            ! Added by: BrowseFuzzyMatching(ABC)
  BIND('FuzzyQuery7',FuzzyQuery7)                          ! Added by: BrowseFuzzyMatching(ABC)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
  IF SELF.Request = SelectRecord
     SELF.AddItem(?Close,RequestCancelled)                 ! Add the close control to the window manger
  ELSE
     SELF.AddItem(?Close,RequestCompleted)                 ! Add the close control to the window manger
  END
  Relate:Inkoop.SetOpenRelated()
  Relate:Inkoop.Open                                       ! File Inkoop used by this procedure, so make sure it's RelationManager is open
  Access:Verkoop.UseFile                                   ! File referenced in 'Other Files' so need to inform it's FileManager
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:Relatie,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1.FileLoaded = 1                                      ! This is a 'file loaded' browse
  BRW1.ActiveInvisible = 1
  BRW1.RetainRow = 0
  BRW1.AddSortOrder(,Rel:Relatie_FK01)                     ! Add the sort order for Rel:Relatie_FK01 for sort order 1
  BRW1.AddLocator(BRW1::Sort1:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort1:Locator.Init(,Rel:FirmaNaam,,BRW1)           ! Initialize the browse locator using  using key: Rel:Relatie_FK01 , Rel:FirmaNaam
  BRW1.SetFilter('(Rel:Type=''C'')')                       ! Apply filter expression to browse
  BRW1.AddSortOrder(,Rel:Relatie_FK01)                     ! Add the sort order for Rel:Relatie_FK01 for sort order 2
  BRW1.AddLocator(BRW1::Sort2:Locator)                     ! Browse has a locator for sort order 2
  BRW1::Sort2:Locator.Init(,Rel:FirmaNaam,,BRW1)           ! Initialize the browse locator using  using key: Rel:Relatie_FK01 , Rel:FirmaNaam
  BRW1.SetFilter('(Rel:Type=''S'')')                       ! Apply filter expression to browse
  BRW1.AddSortOrder(,Rel:Relatie_FK01)                     ! Add the sort order for Rel:Relatie_FK01 for sort order 3
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 3
  BRW1::Sort0:Locator.Init(,Rel:FirmaNaam,,BRW1)           ! Initialize the browse locator using  using key: Rel:Relatie_FK01 , Rel:FirmaNaam
  ?Browse:1{PROP:IconList,1} = '~off.ico'
  ?Browse:1{PROP:IconList,2} = '~on.ico'
  BRW1.AddField(Rel:NietActief,BRW1.Q.Rel:NietActief)      ! Field Rel:NietActief is a hot field or requires assignment from browse
  BRW1.AddField(Rel:FirmaNaam,BRW1.Q.Rel:FirmaNaam)        ! Field Rel:FirmaNaam is a hot field or requires assignment from browse
  BRW1.AddField(Rel:Adres1,BRW1.Q.Rel:Adres1)              ! Field Rel:Adres1 is a hot field or requires assignment from browse
  BRW1.AddField(Rel:Adres2,BRW1.Q.Rel:Adres2)              ! Field Rel:Adres2 is a hot field or requires assignment from browse
  BRW1.AddField(Rel:Postcode,BRW1.Q.Rel:Postcode)          ! Field Rel:Postcode is a hot field or requires assignment from browse
  BRW1.AddField(Rel:Plaats,BRW1.Q.Rel:Plaats)              ! Field Rel:Plaats is a hot field or requires assignment from browse
  BRW1.AddField(Rel:Telefoon,BRW1.Q.Rel:Telefoon)          ! Field Rel:Telefoon is a hot field or requires assignment from browse
  BRW1.AddField(Rel:Mobiel,BRW1.Q.Rel:Mobiel)              ! Field Rel:Mobiel is a hot field or requires assignment from browse
  BRW1.AddField(Rel:Fax,BRW1.Q.Rel:Fax)                    ! Field Rel:Fax is a hot field or requires assignment from browse
  BRW1.AddField(Rel:Country,BRW1.Q.Rel:Country)            ! Field Rel:Country is a hot field or requires assignment from browse
  BRW1.AddField(Rel:PalletBladRapportHeaderImage,BRW1.Q.Rel:PalletBladRapportHeaderImage) ! Field Rel:PalletBladRapportHeaderImage is a hot field or requires assignment from browse
  BRW1.AddField(Rel:RelatieID,BRW1.Q.Rel:RelatieID)        ! Field Rel:RelatieID is a hot field or requires assignment from browse
  BRW1.AddField(Rel:PaymentCondition,BRW1.Q.Rel:PaymentCondition) ! Field Rel:PaymentCondition is a hot field or requires assignment from browse
  BRW1.AddField(Rel:OpenstaandSaldo,BRW1.Q.Rel:OpenstaandSaldo) ! Field Rel:OpenstaandSaldo is a hot field or requires assignment from browse
  BRW1.AddField(Rel:CreditLine,BRW1.Q.Rel:CreditLine)      ! Field Rel:CreditLine is a hot field or requires assignment from browse
  BRW1.AddField(Rel:Code,BRW1.Q.Rel:Code)                  ! Field Rel:Code is a hot field or requires assignment from browse
  BRW1.AddField(Rel:Acc_Man,BRW1.Q.Rel:Acc_Man)            ! Field Rel:Acc_Man is a hot field or requires assignment from browse
  BRW1.AddField(Rel:VatCode,BRW1.Q.Rel:VatCode)            ! Field Rel:VatCode is a hot field or requires assignment from browse
  BRW1.AddField(Rel:cmp_fctry,BRW1.Q.Rel:cmp_fctry)        ! Field Rel:cmp_fctry is a hot field or requires assignment from browse
  BRW1.AddField(Rel:Type,BRW1.Q.Rel:Type)                  ! Field Rel:Type is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  ?FuzzyQuery{PROP:Use} = FuzzyQuery7
  FuzzyOrder7 = BRW1.AddSortOrder()
  BRW1.AppendOrder('200-FuzzyMatch(FuzzyQuery7,Rel:NietActief&'' ''&Rel:FirmaNaam&'' ''&Rel:Adres1&'' ''&Rel:Adres2&'' ''&Rel:Postcode&'' ''&Rel:Plaats&'' ''&Rel:Telefoon&'' ''&Rel:Mobiel&'' ''&Rel:Fax&'' ''&Rel:Country&'' ''&Rel:PalletBladRapportHeaderImage&'' ''&Rel:RelatieID&'' ''&Rel:PaymentCondition&'' ''&Rel:OpenstaandSaldo&'' ''&Rel:CreditLine&'' ''&Rel:Code&'' ''&Rel:Acc_Man&'' ''&Rel:VatCode&'' ''&Rel:cmp_fctry&'' ''&Rel:Type)')
  BRW1.SetFilter('FuzzyMatch(FuzzyQuery7,Rel:NietActief&'' ''&Rel:FirmaNaam&'' ''&Rel:Adres1&'' ''&Rel:Adres2&'' ''&Rel:Postcode&'' ''&Rel:Plaats&'' ''&Rel:Telefoon&'' ''&Rel:Mobiel&'' ''&Rel:Fax&'' ''&Rel:Country&'' ''&Rel:PalletBladRapportHeaderImage&'' ''&Rel:RelatieID&'' ''&Rel:PaymentCondition&'' ''&Rel:OpenstaandSaldo&'' ''&Rel:CreditLine&'' ''&Rel:Code&'' ''&Rel:Acc_Man&'' ''&Rel:VatCode&'' ''&Rel:cmp_fctry&'' ''&Rel:Type)>=1', 'FuzzyFilter')
  INIMgr.Fetch('BrowseRelatie',QuickWindow)                ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  BRW1.AskProcedure = 1                                    ! Will call: UpdateRelatie
  SELF.SetAlerts()
  EnterByTabManager.Init(False)
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:Inkoop.Close
  END
  IF SELF.Opened
    INIMgr.Update('BrowseRelatie',QuickWindow)             ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.Run PROCEDURE(USHORT Number,BYTE Request)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Run(Number,Request)
  IF SELF.Request = ViewRecord
    ReturnValue = RequestCancelled                         ! Always return RequestCancelled if the form was opened in ViewRecord mode
  ELSE
    GlobalRequest = Request
    UpdateRelatie
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
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?FuzzyGo
      ThisWindow.Update()
      BRW1.ResetSort(1)
    OF ?FuzzyClear
      ThisWindow.Update()
      BRW1.ResetSort(1)
    OF ?Excel
      ThisWindow.Update()
      SETCURSOR(CURSOR:Wait)
      !Execute Choice(?CurrentTab)
      !    Alle
      !    Klantren
      !    Levernacier
      !END
      ExcelClass.InitOle()
      ExcelClass.MaakExcel()
      Loc:Rij = 1
      ExcelClass.SchrijfExcel('A',Loc:Rij,'FirmaNaam' )
      ExcelClass.SchrijfExcel('B',Loc:Rij,'Adres1' )
      ExcelClass.SchrijfExcel('C',Loc:Rij,'Adres2' )
      ExcelClass.SchrijfExcel('D',Loc:Rij,'Postcode' )
      ExcelClass.SchrijfExcel('E',Loc:Rij,'Plaats' )
      ExcelClass.SchrijfExcel('F',Loc:Rij,'Telefoon' )
      ExcelClass.SchrijfExcel('G',Loc:Rij,'Mobiel' )
      ExcelClass.SchrijfExcel('H',Loc:Rij,'Fax' )
      ExcelClass.SchrijfExcel('I',Loc:Rij,'Land' )
      ExcelClass.SchrijfExcel('J',Loc:Rij,'SaLdo' )
      Loop i#=1 to RECORDS(BRW1.Q)
          Get(BRW1.Q,i#)
          Voldoet#=False
          IF BRW1.Q.Rel:Type='S'
              Clear(Ink:Record)
              Ink:Leverancier=BRW1.Q.Rel:RelatieID
              Set(Ink:Leverancier_Verwerkt_Planning_K,Ink:Leverancier_Verwerkt_Planning_K)
              Loop Until Access:Inkoop.Next()
                  IF NOT (Ink:Leverancier=BRW1.Q.Rel:RelatieID) THEN BREAK.
                  Voldoet#=True
                  break
              END
              IF Voldoet#=False THEN CYCLE.
          ELSIF BRW1.Q.Rel:Type='C'
              Clear(Ver2:Record)
              Ver2:Klant=BRW1.Q.Rel:RelatieID
              Set(Ver2:Klant_Verwerkt_Planning_K,Ver2:Klant_Verwerkt_Planning_K)
              Loop Until Access:Verkoop.Next()
                  IF NOT (Ver2:Klant=BRW1.Q.Rel:RelatieID) THEN BREAK.
                  Voldoet#=True
                  break
              END
              IF Voldoet#=False THEN CYCLE.
          ELSE
              CYCLE
          END    
          Loc:Rij += 1
          ExcelClass.SchrijfExcel('A',Loc:Rij,BRW1.Q.Rel:FirmaNaam)
          ExcelClass.SchrijfExcel('B',Loc:Rij,BRW1.Q.Rel:Adres1 )
          ExcelClass.SchrijfExcel('C',Loc:Rij,BRW1.Q.Rel:Adres2 )
          ExcelClass.SchrijfExcel('D',Loc:Rij,BRW1.Q.Rel:Postcode )
          ExcelClass.SchrijfExcel('E',Loc:Rij,BRW1.Q.Rel:Plaats)
          ExcelClass.SchrijfExcel('F',Loc:Rij,BRW1.Q.Rel:Telefoon)
          ExcelClass.SchrijfExcel('G',Loc:Rij,BRW1.Q.Rel:Mobiel)
          ExcelClass.SchrijfExcel('H',Loc:Rij,BRW1.Q.Rel:Fax)
          ExcelClass.SchrijfExcel('I',Loc:Rij,BRW1.Q.Rel:Country)
          ExcelClass.SchrijfExcel('J',Loc:Rij,Format(BRW1.Q.Rel:OpenstaandSaldo,@n7`2))
      END    
      Loc:Ole{'Application.Columns(A:J).AutoFit'}
      Loc:Ole{'Application.Rows(1:'&Loc:Rij&').AutoFit'}
      !
      Loc:Ole{'Application.Visible'}=true  ! nu pas excel laten zien
      ExcelClass.SluitExcel(false)
      Loc:Ole{Prop:Deactivate}
      
      SETCURSOR()
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

ExcelClass.MaakWerkBlad         Procedure(<String PRM:WerkBladNaam>)
   Code
   Loc:Ole{'Application.ActiveWorkBook.Sheets.Add'}
   IF PRM:WerkBladNaam<>''
    Loc:Ole{'Application.ActiveWorkBook.ActiveSheet.Name'}=Clip(PRM:WerkBladNaam)
   End
   ! Loc:Ole{'Application.ActiveWorkBook.Sheets.Select'}
   RETURN
ExcelClass.NumberFormat            Procedure(String pKolomVanaf, LONG pRijVanaf, String pKolomTM, LONG pRijTM, String pNumberFormat)
   Code
   Case pNumberFormat 
   OF  Self.Bedrag
       Loc:Ole{'Application.Range('&CLIP(pKolomVanaf)&pRijVanaf&':'&CLIP(pKolomTM)&pRijTM&').NumberFormat'}='#.##0,00'
   OF  Self.Datum
       Loc:Ole{'Application.Range('&CLIP(pKolomVanaf)&pRijVanaf&':'&CLIP(pKolomTM)&pRijTM&').NumberFormat'}='m/d/yyyy'
   ELSE
       !! foutmelding 
       IF Self.FullDebug = TRUE
           MESSAGE('Onbekende NumberFormat '&pNumberFormat,'ExcelClass.NumberFormat')
       END
   END
   RETURN
ExcelClass.BepaalKolom    Procedure(LONG PRM:Kolom )
PRM:KolomString  string(3)
Loc:TweedeLetter    Long
Loc:EersteLetter    Long
    CODE
    PRM:Kolom-=1
    Loc:TweedeLetter=PRM:Kolom  % 26
    Loc:EersteLetter=Int(PRM:Kolom /26)

    if Loc:EersteLetter<>0
       PRM:KolomString[1]=Chr(64+Loc:EersteLetter)       ! chr(65)= 'A'
       PRM:KolomString[2]=Chr(65+Loc:TweedeLetter)
    Else
       PRM:KolomString[1]=Chr(65+Loc:TweedeLetter)
    End

    RETURN(PRM:KolomString)
ExcelClass.AutoFitColumns          Procedure(String pKolomVanaf, String pKolomTM)
   Code
   Loc:Ole{'Application.Columns('&CLIP(pKolomVanaf)&':'&CLIP(pKolomTM)&').AutoFit'}
   RETURN
ExcelClass.AutoFitRows          Procedure(LONG pRijVanaf,LONG pRijTM)
   Code
   Loc:Ole{'Application.Rows('&pRijVanaf&':'&pRijTM&').AutoFit'}
   RETURN
ExcelClass.InitOle     Procedure(<BYTE pDebug>)
    code
    Loc:Ole  = Create(0,Create:Ole)
    Loc:Ole{Prop:Create}='Excel.Application'

    Loc:Ole{Prop:DoVerb}=1                               !  dit doet iedereen dus ik ook
    Loc:Ole{'Application.WindowState'}=1                 !  maximaliseer scherm
    Loc:Ole{'Application.Visible'}=True ! nu pas excel laten zien
    IF pDebug
        Loc:Ole{Prop:ReportException}=True
        Self.FullDebug = TRUE
    END
    
    RETURN
ExcelClass.MaakExcel       Procedure
    CODE
    Loc:Ole{'Application.Workbooks.Add'}            ! leeg worksheet openen
    RETURN
ExcelClass.OpenExcel       Procedure(String prm:Bestandsnaam)
    Code
    Loc:Ole{'Application.Workbooks.Open ("'&prm:Bestandsnaam&'")'}           ! leeg worksheet openen
    RETURN
ExcelClass.SluitExcel       Procedure(Byte PRM:Close)
   Code
   If PRM:Close
       Loc:Ole{'Application.Workbooks.Close'}
   END     
   Loc:Ole{'Application.Visible'}=true  ! nu pas excel laten zien
   Loc:Ole{'Prop:Deactivate'}
   Destroy(Loc:Ole)
   RETURN
ExcelClass.SchrijfExcel         Procedure(String PRM:Kolom,LONG PRM:Rij, String PRM:Value)
   Code
   Loc:Ole{'Application.Range('&Clip(PRM:Kolom)&Prm:Rij&').Value'}=PRM:Value
   RETURN

BRW1.Fetch PROCEDURE(BYTE Direction)

GreenBarIndex   LONG,AUTO
  CODE
  PARENT.Fetch(Direction)
  !----------------------------------------------------------------------
    LOOP GreenBarIndex=1 TO RECORDS(SELF.Q)
      GET(SELF.Q,GreenBarIndex)
      SELF.Q.Rel:NietActief_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for Rel:NietActief
      SELF.Q.Rel:NietActief_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.Rel:NietActief_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Rel:NietActief_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Rel:FirmaNaam_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for Rel:FirmaNaam
      SELF.Q.Rel:FirmaNaam_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.Rel:FirmaNaam_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Rel:FirmaNaam_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Rel:Adres1_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for Rel:Adres1
      SELF.Q.Rel:Adres1_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.Rel:Adres1_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Rel:Adres1_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Rel:Adres2_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for Rel:Adres2
      SELF.Q.Rel:Adres2_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.Rel:Adres2_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Rel:Adres2_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Rel:Postcode_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for Rel:Postcode
      SELF.Q.Rel:Postcode_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.Rel:Postcode_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Rel:Postcode_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Rel:Plaats_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for Rel:Plaats
      SELF.Q.Rel:Plaats_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.Rel:Plaats_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Rel:Plaats_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Rel:Telefoon_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for Rel:Telefoon
      SELF.Q.Rel:Telefoon_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.Rel:Telefoon_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Rel:Telefoon_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Rel:Mobiel_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for Rel:Mobiel
      SELF.Q.Rel:Mobiel_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.Rel:Mobiel_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Rel:Mobiel_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Rel:Fax_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for Rel:Fax
      SELF.Q.Rel:Fax_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.Rel:Fax_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Rel:Fax_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Rel:Country_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for Rel:Country
      SELF.Q.Rel:Country_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.Rel:Country_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Rel:Country_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Rel:PalletBladRapportHeaderImage_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for Rel:PalletBladRapportHeaderImage
      SELF.Q.Rel:PalletBladRapportHeaderImage_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.Rel:PalletBladRapportHeaderImage_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Rel:PalletBladRapportHeaderImage_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Rel:RelatieID_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for Rel:RelatieID
      SELF.Q.Rel:RelatieID_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.Rel:RelatieID_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Rel:RelatieID_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Rel:PaymentCondition_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for Rel:PaymentCondition
      SELF.Q.Rel:PaymentCondition_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.Rel:PaymentCondition_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Rel:PaymentCondition_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Rel:OpenstaandSaldo_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for Rel:OpenstaandSaldo
      SELF.Q.Rel:OpenstaandSaldo_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.Rel:OpenstaandSaldo_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Rel:OpenstaandSaldo_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Rel:CreditLine_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for Rel:CreditLine
      SELF.Q.Rel:CreditLine_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.Rel:CreditLine_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Rel:CreditLine_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Rel:Code_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for Rel:Code
      SELF.Q.Rel:Code_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.Rel:Code_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Rel:Code_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Rel:Acc_Man_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for Rel:Acc_Man
      SELF.Q.Rel:Acc_Man_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.Rel:Acc_Man_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Rel:Acc_Man_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Rel:VatCode_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for Rel:VatCode
      SELF.Q.Rel:VatCode_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.Rel:VatCode_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Rel:VatCode_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Rel:cmp_fctry_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for Rel:cmp_fctry
      SELF.Q.Rel:cmp_fctry_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.Rel:cmp_fctry_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Rel:cmp_fctry_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      PUT(SELF.Q)
    END
  !----------------------------------------------------------------------


BRW1.Init PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)

  CODE
  PARENT.Init(ListBox,Posit,V,Q,RM,WM)
  IF WM.Request <> ViewRecord                              ! If called for anything other than ViewMode, make the insert, change & delete controls available
    SELF.ChangeControl=?Change:3
  END


BRW1.ResetSort PROCEDURE(BYTE Force)

ReturnValue          BYTE,AUTO

FuzzyMatched         BYTE(False),STATIC
  CODE
  IF EVENT() = EVENT:Accepted
    CASE ACCEPTED()
    OF ?FuzzyGo
      IF FuzzyQuery7
        FuzzyMatched = True
        RETURN SELF.SetSort(FuzzyOrder7, Force)
      END
    OF ?FuzzyClear
      FuzzyMatched = False
      CLEAR(FuzzyQuery7)
    END
  END
  IF FuzzyMatched = True THEN RETURN PARENT.ResetSort(Force).
  IF CHOICE(?CurrentTab)=2
    RETURN SELF.SetSort(1,Force)
  ELSIF CHOICE(?CurrentTab)=3
    RETURN SELF.SetSort(2,Force)
  ELSE
    RETURN SELF.SetSort(3,Force)
  END
  ReturnValue = PARENT.ResetSort(Force)
  RETURN ReturnValue


BRW1.SetQueueRecord PROCEDURE

  CODE
  PARENT.SetQueueRecord
  
  IF (Rel:NietActief)
    SELF.Q.Rel:NietActief_Icon = 2                         ! Set icon from icon list
  ELSE
    SELF.Q.Rel:NietActief_Icon = 1                         ! Set icon from icon list
  END
  !----------------------------------------------------------------------
      SELF.Q.Rel:NietActief_NormalFG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1) ! Set color values for Rel:NietActief
      SELF.Q.Rel:NietActief_NormalBG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,8454143)
      SELF.Q.Rel:NietActief_SelectedFG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.Rel:NietActief_SelectedBG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.Rel:FirmaNaam_NormalFG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1) ! Set color values for Rel:FirmaNaam
      SELF.Q.Rel:FirmaNaam_NormalBG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,8454143)
      SELF.Q.Rel:FirmaNaam_SelectedFG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.Rel:FirmaNaam_SelectedBG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.Rel:Adres1_NormalFG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1) ! Set color values for Rel:Adres1
      SELF.Q.Rel:Adres1_NormalBG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,8454143)
      SELF.Q.Rel:Adres1_SelectedFG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.Rel:Adres1_SelectedBG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.Rel:Adres2_NormalFG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1) ! Set color values for Rel:Adres2
      SELF.Q.Rel:Adres2_NormalBG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,8454143)
      SELF.Q.Rel:Adres2_SelectedFG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.Rel:Adres2_SelectedBG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.Rel:Postcode_NormalFG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1) ! Set color values for Rel:Postcode
      SELF.Q.Rel:Postcode_NormalBG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,8454143)
      SELF.Q.Rel:Postcode_SelectedFG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.Rel:Postcode_SelectedBG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.Rel:Plaats_NormalFG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1) ! Set color values for Rel:Plaats
      SELF.Q.Rel:Plaats_NormalBG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,8454143)
      SELF.Q.Rel:Plaats_SelectedFG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.Rel:Plaats_SelectedBG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.Rel:Telefoon_NormalFG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1) ! Set color values for Rel:Telefoon
      SELF.Q.Rel:Telefoon_NormalBG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,8454143)
      SELF.Q.Rel:Telefoon_SelectedFG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.Rel:Telefoon_SelectedBG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.Rel:Mobiel_NormalFG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1) ! Set color values for Rel:Mobiel
      SELF.Q.Rel:Mobiel_NormalBG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,8454143)
      SELF.Q.Rel:Mobiel_SelectedFG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.Rel:Mobiel_SelectedBG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.Rel:Fax_NormalFG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1) ! Set color values for Rel:Fax
      SELF.Q.Rel:Fax_NormalBG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,8454143)
      SELF.Q.Rel:Fax_SelectedFG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.Rel:Fax_SelectedBG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.Rel:Country_NormalFG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1) ! Set color values for Rel:Country
      SELF.Q.Rel:Country_NormalBG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,8454143)
      SELF.Q.Rel:Country_SelectedFG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.Rel:Country_SelectedBG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.Rel:PalletBladRapportHeaderImage_NormalFG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1) ! Set color values for Rel:PalletBladRapportHeaderImage
      SELF.Q.Rel:PalletBladRapportHeaderImage_NormalBG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,8454143)
      SELF.Q.Rel:PalletBladRapportHeaderImage_SelectedFG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.Rel:PalletBladRapportHeaderImage_SelectedBG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.Rel:RelatieID_NormalFG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1) ! Set color values for Rel:RelatieID
      SELF.Q.Rel:RelatieID_NormalBG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,8454143)
      SELF.Q.Rel:RelatieID_SelectedFG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.Rel:RelatieID_SelectedBG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.Rel:PaymentCondition_NormalFG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1) ! Set color values for Rel:PaymentCondition
      SELF.Q.Rel:PaymentCondition_NormalBG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,8454143)
      SELF.Q.Rel:PaymentCondition_SelectedFG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.Rel:PaymentCondition_SelectedBG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.Rel:OpenstaandSaldo_NormalFG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1) ! Set color values for Rel:OpenstaandSaldo
      SELF.Q.Rel:OpenstaandSaldo_NormalBG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,8454143)
      SELF.Q.Rel:OpenstaandSaldo_SelectedFG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.Rel:OpenstaandSaldo_SelectedBG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.Rel:CreditLine_NormalFG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1) ! Set color values for Rel:CreditLine
      SELF.Q.Rel:CreditLine_NormalBG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,8454143)
      SELF.Q.Rel:CreditLine_SelectedFG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.Rel:CreditLine_SelectedBG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.Rel:Code_NormalFG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1) ! Set color values for Rel:Code
      SELF.Q.Rel:Code_NormalBG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,8454143)
      SELF.Q.Rel:Code_SelectedFG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.Rel:Code_SelectedBG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.Rel:Acc_Man_NormalFG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1) ! Set color values for Rel:Acc_Man
      SELF.Q.Rel:Acc_Man_NormalBG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,8454143)
      SELF.Q.Rel:Acc_Man_SelectedFG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.Rel:Acc_Man_SelectedBG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.Rel:VatCode_NormalFG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1) ! Set color values for Rel:VatCode
      SELF.Q.Rel:VatCode_NormalBG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,8454143)
      SELF.Q.Rel:VatCode_SelectedFG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.Rel:VatCode_SelectedBG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.Rel:cmp_fctry_NormalFG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1) ! Set color values for Rel:cmp_fctry
      SELF.Q.Rel:cmp_fctry_NormalBG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,8454143)
      SELF.Q.Rel:cmp_fctry_SelectedFG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.Rel:cmp_fctry_SelectedBG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
  !----------------------------------------------------------------------


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window
  SELF.SetStrategy(?Close, Resize:FixRight+Resize:FixBottom, Resize:LockSize) ! Override strategy for ?Close
  SELF.SetStrategy(?Change:3, Resize:FixRight+Resize:FixBottom, Resize:LockSize) ! Override strategy for ?Change:3
  SELF.SetStrategy(?FuzzyGroup, Resize:FixNearestX + Resize:FixNearestY, Resize:LockSize)

