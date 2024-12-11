

   MEMBER('VoorrPln.clw')                                  ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABPOPUP.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('VOORRPLN037.INC'),ONCE        !Local module procedure declarations
                     END


!!! <summary>
!!! Generated from procedure template - Window
!!! Browse the Activiteit file
!!! </summary>
BrowseActiviteit PROCEDURE 

udpt            UltimateDebugProcedureTracker
CurrentTab           STRING(80)                            ! 
LOC:Locatienaam3     STRING(50)                            ! 
LOC:VerkoopKG3       DECIMAL(7,2)                          ! 
LOC:VerkoopPallets3  LONG                                  ! 
LOC:NietUitgevoerd   BYTE                                  ! 
LOC:Uitgevoerd       BYTE                                  ! 
BRW1::View:Browse    VIEW(Activiteit)
                       PROJECT(ACT:Datum)
                       PROJECT(ACT:Tijd)
                       PROJECT(ACT:Uitgevoerd)
                       PROJECT(ACT:Omschrijving)
                       PROJECT(ACT:ActiviteitID)
                       PROJECT(ACT:DatumTijd)
                       PROJECT(ACT:PlanningID)
                       JOIN(AAPla3:PlanningID_K,ACT:PlanningID)
                         PROJECT(AAPla3:ArtikelID)
                         PROJECT(AAPla3:ArtikelOms)
                         PROJECT(AAPla3:FirmaNaam)
                         PROJECT(AAPla3:PartijID)
                         PROJECT(AAPla3:ExternPartijnr)
                         PROJECT(AAPla3:Planning_TIME)
                         PROJECT(AAPla3:Planning_DATE)
                         PROJECT(AAPla3:Instructie)
                         PROJECT(AAPla3:VerpakkingOmschrijving)
                         PROJECT(AAPla3:MutatieGemaakt)
                         PROJECT(AAPla3:Geprint)
                         PROJECT(AAPla3:Verwerkt)
                         PROJECT(AAPla3:Gewogen)
                         PROJECT(AAPla3:CelOms)
                         PROJECT(AAPla3:LeverancierFirmaNaam)
                         PROJECT(AAPla3:Transport)
                         PROJECT(AAPla3:PlanningID)
                         PROJECT(AAPla3:MutatieKG)
                         PROJECT(AAPla3:MutatiePallets)
                         PROJECT(AAPla3:KG)
                         PROJECT(AAPla3:Pallets)
                       END
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
ACT:Datum              LIKE(ACT:Datum)                !List box control field - type derived from field
ACT:Datum_NormalFG     LONG                           !Normal forground color
ACT:Datum_NormalBG     LONG                           !Normal background color
ACT:Datum_SelectedFG   LONG                           !Selected forground color
ACT:Datum_SelectedBG   LONG                           !Selected background color
ACT:Tijd               LIKE(ACT:Tijd)                 !List box control field - type derived from field
ACT:Tijd_NormalFG      LONG                           !Normal forground color
ACT:Tijd_NormalBG      LONG                           !Normal background color
ACT:Tijd_SelectedFG    LONG                           !Selected forground color
ACT:Tijd_SelectedBG    LONG                           !Selected background color
ACT:Uitgevoerd         LIKE(ACT:Uitgevoerd)           !List box control field - type derived from field
ACT:Uitgevoerd_NormalFG LONG                          !Normal forground color
ACT:Uitgevoerd_NormalBG LONG                          !Normal background color
ACT:Uitgevoerd_SelectedFG LONG                        !Selected forground color
ACT:Uitgevoerd_SelectedBG LONG                        !Selected background color
ACT:Uitgevoerd_Icon    LONG                           !Entry's icon ID
ACT:Omschrijving       LIKE(ACT:Omschrijving)         !List box control field - type derived from field
ACT:Omschrijving_NormalFG LONG                        !Normal forground color
ACT:Omschrijving_NormalBG LONG                        !Normal background color
ACT:Omschrijving_SelectedFG LONG                      !Selected forground color
ACT:Omschrijving_SelectedBG LONG                      !Selected background color
AAPla3:ArtikelID       LIKE(AAPla3:ArtikelID)         !List box control field - type derived from field
AAPla3:ArtikelID_NormalFG LONG                        !Normal forground color
AAPla3:ArtikelID_NormalBG LONG                        !Normal background color
AAPla3:ArtikelID_SelectedFG LONG                      !Selected forground color
AAPla3:ArtikelID_SelectedBG LONG                      !Selected background color
AAPla3:ArtikelOms      LIKE(AAPla3:ArtikelOms)        !List box control field - type derived from field
AAPla3:ArtikelOms_NormalFG LONG                       !Normal forground color
AAPla3:ArtikelOms_NormalBG LONG                       !Normal background color
AAPla3:ArtikelOms_SelectedFG LONG                     !Selected forground color
AAPla3:ArtikelOms_SelectedBG LONG                     !Selected background color
AAPla3:FirmaNaam       LIKE(AAPla3:FirmaNaam)         !List box control field - type derived from field
AAPla3:FirmaNaam_NormalFG LONG                        !Normal forground color
AAPla3:FirmaNaam_NormalBG LONG                        !Normal background color
AAPla3:FirmaNaam_SelectedFG LONG                      !Selected forground color
AAPla3:FirmaNaam_SelectedBG LONG                      !Selected background color
AAPla3:PartijID        LIKE(AAPla3:PartijID)          !List box control field - type derived from field
AAPla3:PartijID_NormalFG LONG                         !Normal forground color
AAPla3:PartijID_NormalBG LONG                         !Normal background color
AAPla3:PartijID_SelectedFG LONG                       !Selected forground color
AAPla3:PartijID_SelectedBG LONG                       !Selected background color
AAPla3:ExternPartijnr  LIKE(AAPla3:ExternPartijnr)    !List box control field - type derived from field
AAPla3:ExternPartijnr_NormalFG LONG                   !Normal forground color
AAPla3:ExternPartijnr_NormalBG LONG                   !Normal background color
AAPla3:ExternPartijnr_SelectedFG LONG                 !Selected forground color
AAPla3:ExternPartijnr_SelectedBG LONG                 !Selected background color
LOC:VerkoopKG3         LIKE(LOC:VerkoopKG3)           !List box control field - type derived from local data
LOC:VerkoopKG3_NormalFG LONG                          !Normal forground color
LOC:VerkoopKG3_NormalBG LONG                          !Normal background color
LOC:VerkoopKG3_SelectedFG LONG                        !Selected forground color
LOC:VerkoopKG3_SelectedBG LONG                        !Selected background color
AAPla3:Planning_TIME   LIKE(AAPla3:Planning_TIME)     !List box control field - type derived from field
AAPla3:Planning_TIME_NormalFG LONG                    !Normal forground color
AAPla3:Planning_TIME_NormalBG LONG                    !Normal background color
AAPla3:Planning_TIME_SelectedFG LONG                  !Selected forground color
AAPla3:Planning_TIME_SelectedBG LONG                  !Selected background color
AAPla3:Planning_DATE   LIKE(AAPla3:Planning_DATE)     !List box control field - type derived from field
AAPla3:Planning_DATE_NormalFG LONG                    !Normal forground color
AAPla3:Planning_DATE_NormalBG LONG                    !Normal background color
AAPla3:Planning_DATE_SelectedFG LONG                  !Selected forground color
AAPla3:Planning_DATE_SelectedBG LONG                  !Selected background color
AAPla3:Instructie      LIKE(AAPla3:Instructie)        !List box control field - type derived from field
AAPla3:Instructie_NormalFG LONG                       !Normal forground color
AAPla3:Instructie_NormalBG LONG                       !Normal background color
AAPla3:Instructie_SelectedFG LONG                     !Selected forground color
AAPla3:Instructie_SelectedBG LONG                     !Selected background color
AAPla3:Instructie_Tip  STRING(80)                     !Field tooltip
AAPla3:VerpakkingOmschrijving LIKE(AAPla3:VerpakkingOmschrijving) !List box control field - type derived from field
AAPla3:VerpakkingOmschrijving_NormalFG LONG           !Normal forground color
AAPla3:VerpakkingOmschrijving_NormalBG LONG           !Normal background color
AAPla3:VerpakkingOmschrijving_SelectedFG LONG         !Selected forground color
AAPla3:VerpakkingOmschrijving_SelectedBG LONG         !Selected background color
LOC:VerkoopPallets3    LIKE(LOC:VerkoopPallets3)      !List box control field - type derived from local data
LOC:VerkoopPallets3_NormalFG LONG                     !Normal forground color
LOC:VerkoopPallets3_NormalBG LONG                     !Normal background color
LOC:VerkoopPallets3_SelectedFG LONG                   !Selected forground color
LOC:VerkoopPallets3_SelectedBG LONG                   !Selected background color
AAPla3:MutatieGemaakt  LIKE(AAPla3:MutatieGemaakt)    !List box control field - type derived from field
AAPla3:MutatieGemaakt_NormalFG LONG                   !Normal forground color
AAPla3:MutatieGemaakt_NormalBG LONG                   !Normal background color
AAPla3:MutatieGemaakt_SelectedFG LONG                 !Selected forground color
AAPla3:MutatieGemaakt_SelectedBG LONG                 !Selected background color
AAPla3:MutatieGemaakt_Icon LONG                       !Entry's icon ID
AAPla3:Geprint         LIKE(AAPla3:Geprint)           !List box control field - type derived from field
AAPla3:Geprint_NormalFG LONG                          !Normal forground color
AAPla3:Geprint_NormalBG LONG                          !Normal background color
AAPla3:Geprint_SelectedFG LONG                        !Selected forground color
AAPla3:Geprint_SelectedBG LONG                        !Selected background color
AAPla3:Geprint_Icon    LONG                           !Entry's icon ID
AAPla3:Verwerkt        LIKE(AAPla3:Verwerkt)          !List box control field - type derived from field
AAPla3:Verwerkt_NormalFG LONG                         !Normal forground color
AAPla3:Verwerkt_NormalBG LONG                         !Normal background color
AAPla3:Verwerkt_SelectedFG LONG                       !Selected forground color
AAPla3:Verwerkt_SelectedBG LONG                       !Selected background color
AAPla3:Verwerkt_Icon   LONG                           !Entry's icon ID
AAPla3:Gewogen         LIKE(AAPla3:Gewogen)           !List box control field - type derived from field
AAPla3:Gewogen_NormalFG LONG                          !Normal forground color
AAPla3:Gewogen_NormalBG LONG                          !Normal background color
AAPla3:Gewogen_SelectedFG LONG                        !Selected forground color
AAPla3:Gewogen_SelectedBG LONG                        !Selected background color
AAPla3:Gewogen_Icon    LONG                           !Entry's icon ID
AAPla3:CelOms          LIKE(AAPla3:CelOms)            !List box control field - type derived from field
AAPla3:CelOms_NormalFG LONG                           !Normal forground color
AAPla3:CelOms_NormalBG LONG                           !Normal background color
AAPla3:CelOms_SelectedFG LONG                         !Selected forground color
AAPla3:CelOms_SelectedBG LONG                         !Selected background color
LOC:Locatienaam3       LIKE(LOC:Locatienaam3)         !List box control field - type derived from local data
LOC:Locatienaam3_NormalFG LONG                        !Normal forground color
LOC:Locatienaam3_NormalBG LONG                        !Normal background color
LOC:Locatienaam3_SelectedFG LONG                      !Selected forground color
LOC:Locatienaam3_SelectedBG LONG                      !Selected background color
AAPla3:LeverancierFirmaNaam LIKE(AAPla3:LeverancierFirmaNaam) !List box control field - type derived from field
AAPla3:LeverancierFirmaNaam_NormalFG LONG             !Normal forground color
AAPla3:LeverancierFirmaNaam_NormalBG LONG             !Normal background color
AAPla3:LeverancierFirmaNaam_SelectedFG LONG           !Selected forground color
AAPla3:LeverancierFirmaNaam_SelectedBG LONG           !Selected background color
AAPla3:Transport       LIKE(AAPla3:Transport)         !List box control field - type derived from field
AAPla3:Transport_NormalFG LONG                        !Normal forground color
AAPla3:Transport_NormalBG LONG                        !Normal background color
AAPla3:Transport_SelectedFG LONG                      !Selected forground color
AAPla3:Transport_SelectedBG LONG                      !Selected background color
AAPla3:Transport_Tip   STRING(80)                     !Field tooltip
AAPla3:PlanningID      LIKE(AAPla3:PlanningID)        !List box control field - type derived from field
AAPla3:PlanningID_NormalFG LONG                       !Normal forground color
AAPla3:PlanningID_NormalBG LONG                       !Normal background color
AAPla3:PlanningID_SelectedFG LONG                     !Selected forground color
AAPla3:PlanningID_SelectedBG LONG                     !Selected background color
AAPla3:PlanningID_Tip  STRING(80)                     !Field tooltip
AAPla3:MutatieKG       LIKE(AAPla3:MutatieKG)         !Browse hot field - type derived from field
AAPla3:MutatiePallets  LIKE(AAPla3:MutatiePallets)    !Browse hot field - type derived from field
AAPla3:KG              LIKE(AAPla3:KG)                !Browse hot field - type derived from field
AAPla3:Pallets         LIKE(AAPla3:Pallets)           !Browse hot field - type derived from field
ACT:ActiviteitID       LIKE(ACT:ActiviteitID)         !Primary key field - type derived from field
ACT:DatumTijd          LIKE(ACT:DatumTijd)            !Browse key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
LocEnableEnterByTab  BYTE(1)                               !Used by the ENTER Instead of Tab template
EnterByTabManager    EnterByTabClass
NetLocalRefreshDate     Long     ! NetTalk (NetRefresh)
NetLocalRefreshTime     Long
NetLocalDependancies    String('|Activiteit|AAPlanningVerkoop|')
QuickWindow          WINDOW('Activiteiten.'),AT(,,358,198),FONT('Microsoft Sans Serif',8,,FONT:regular,CHARSET:DEFAULT), |
  RESIZE,CENTER,GRAY,IMM,MAX,MDI,HLP('BrowseActiviteit'),SYSTEM
                       LIST,AT(8,22,342,134),USE(?Browse:1),HVSCROLL,FORMAT('[63L(2)|M*~Datum~C(0)@d6-@40L(2)|' & |
  'M*~Tijd~C(0)@t7B@37L(2)|M*I~Uitgevoerd~C(0)@p p@200L(2)|M*~Omschrijving~@s255@]|~Act' & |
  'iviteit~[30L(2)|M*~ID~C(0)@s30@66L(2)|M*~Omschrijving~C(0)@s60@]|M~Artikel~110L(2)|M' & |
  '*~Afnemer~C(0)@s50@[30R(2)|M*~Intern~C(0)@n_10B@30R(2)|M*~Extern~C(1)@s20@]|M~Partij' & |
  '-nummer~40R(2)|M*~KG~C(0)@n-14`2@[22R(2)|M*~Tijd~C(0)@t7@40R(2)|M*~Datum~C(0)@d17@](' & |
  '70)|~Ingepland~170L(2)|M*P~Instructie~C(2)@s100@50L(2)|M*~Verpakking~C(0)@s50@30R(2)' & |
  '|M*~Pallets~C(1)@n_10@22R(2)|M*I~Uitslag~C(0)@p p@20C(2)|M*I~Print~C(0)@p p@30C(2)|M' & |
  '*I~Verwerkt~C(0)@p p@30C(2)|M*I~Gewogen~C(0)@p p@[20L(2)|M*@s50@40L(2)|M*@s50@]|M~Ce' & |
  'l~50L(2)|M*~Leverancier~C(0)@s50@50L(2)|M*P~Transport~C(0)@s100@60L(2)|M*P~Planning ' & |
  'ID~L(0)@n-14@'),FROM(Queue:Browse:1),IMM
                       BUTTON('&Bekijken'),AT(7,158,58,14),USE(?View:2),LEFT,ICON('WAVIEW.ICO'),FLAT,HIDE,MSG('View Record'), |
  TIP('View Record')
                       BUTTON('&Toevoegen'),AT(157,158,64,14),USE(?Insert:3),LEFT,ICON('WAINSERT.ICO'),FLAT,MSG('Insert a Record'), |
  TIP('Insert a Record')
                       BUTTON('&Wijzigen'),AT(225,158,57,14),USE(?Change:3),LEFT,ICON('WACHANGE.ICO'),DEFAULT,FLAT, |
  MSG('Change the Record'),TIP('Change the Record')
                       BUTTON('&Verwijderen'),AT(286,158,65,14),USE(?Delete:3),LEFT,ICON('WADELETE.ICO'),FLAT,MSG('Delete the Record'), |
  TIP('Delete the Record')
                       SHEET,AT(4,4,350,172),USE(?CurrentTab)
                         TAB('Nog niet uitgevoerd'),USE(?Tab:1)
                         END
                         TAB('Uitgevoerd'),USE(?Tab:4)
                         END
                         TAB('Alle'),USE(?Tab:5)
                         END
                       END
                       BUTTON('&Afsluiten'),AT(295,180,57,14),USE(?Close),LEFT,ICON('WACLOSE.ICO'),FLAT,MSG('Close Window'), |
  TIP('Close Window')
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
TakeEvent              PROCEDURE(),BYTE,PROC,DERIVED
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
BRW1                 CLASS(BrowseClass)                    ! Browse using ?Browse:1
Q                      &Queue:Browse:1                !Reference to browse queue
Fetch                  PROCEDURE(BYTE Direction),DERIVED
Init                   PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)
ResetSort              PROCEDURE(BYTE Force),BYTE,PROC,DERIVED
SetQueueRecord         PROCEDURE(),DERIVED
SetSort                PROCEDURE(BYTE NewOrder,BYTE Force),BYTE,PROC,DERIVED
                     END

BRW1::Sort0:Locator  StepLocatorClass                      ! Default Locator
BRW1::Sort1:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 2
BRW1::Sort2:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 3
Resizer              CLASS(WindowResizeClass)
Init                   PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)
                     END


  CODE
? DEBUGHOOK(Activiteit:Record)
? DEBUGHOOK(ViewPartijCelLocaties:Record)
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
        udpt.Init(UD,'BrowseActiviteit','VoorrPln037.clw','VoorrPln.DLL','09/02/2021 @ 01:27PM')    
             
  GlobalErrors.SetProcedureName('BrowseActiviteit')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  GLO:Activiteit_ThreadID = THREAD() 
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Browse:1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('LOC:VerkoopKG3',LOC:VerkoopKG3)                    ! Added by: BrowseBox(ABC)
  BIND('LOC:VerkoopPallets3',LOC:VerkoopPallets3)          ! Added by: BrowseBox(ABC)
  BIND('LOC:Locatienaam3',LOC:Locatienaam3)                ! Added by: BrowseBox(ABC)
  BIND('ACT:ActiviteitID',ACT:ActiviteitID)                ! Added by: BrowseBox(ABC)
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  IF SELF.Request = SelectRecord
     SELF.AddItem(?Close,RequestCancelled)                 ! Add the close control to the window manger
  ELSE
     SELF.AddItem(?Close,RequestCompleted)                 ! Add the close control to the window manger
  END
  Relate:Activiteit.Open                                   ! File Activiteit used by this procedure, so make sure it's RelationManager is open
  Relate:ViewPartijCelLocaties.Open                        ! File ViewPartijCelLocaties used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  LOC:NietUitgevoerd=0
  LOC:Uitgevoerd=1
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:Activiteit,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  Do DefineListboxStyle
  Alert(AltKeyPressed)  ! WinEvent : These keys cause a program to crash on Windows 7 and Windows 10.
  Alert(F10Key)         !
  Alert(CtrlF10)        !
  Alert(ShiftF10)       !
  Alert(CtrlShiftF10)   !
  Alert(AltSpace)       !
  WinAlertMouseZoom()
  QuickWindow{Prop:Alrt,255} = CtrlShiftP
  BRW1.Q &= Queue:Browse:1
  BRW1.AddSortOrder(,ACT:FK3_Activiteit)                   ! Add the sort order for ACT:FK3_Activiteit for sort order 1
  BRW1.AddRange(ACT:Uitgevoerd,LOC:Uitgevoerd)             ! Add single value range limit for sort order 1
  BRW1.AddLocator(BRW1::Sort1:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort1:Locator.Init(,ACT:DatumTijd,1,BRW1)          ! Initialize the browse locator using  using key: ACT:FK3_Activiteit , ACT:DatumTijd
  BRW1.AddSortOrder(,ACT:FK4_Activiteit)                   ! Add the sort order for ACT:FK4_Activiteit for sort order 2
  BRW1.AddLocator(BRW1::Sort2:Locator)                     ! Browse has a locator for sort order 2
  BRW1::Sort2:Locator.Init(,ACT:DatumTijd,1,BRW1)          ! Initialize the browse locator using  using key: ACT:FK4_Activiteit , ACT:DatumTijd
  BRW1.AddSortOrder(,ACT:FK3_Activiteit)                   ! Add the sort order for ACT:FK3_Activiteit for sort order 3
  BRW1.AddRange(ACT:Uitgevoerd,LOC:NietUitgevoerd)         ! Add single value range limit for sort order 3
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 3
  BRW1::Sort0:Locator.Init(,ACT:DatumTijd,1,BRW1)          ! Initialize the browse locator using  using key: ACT:FK3_Activiteit , ACT:DatumTijd
  ?Browse:1{PROP:IconList,1} = '~off.ico'
  ?Browse:1{PROP:IconList,2} = '~on.ico'
  BRW1.AddField(ACT:Datum,BRW1.Q.ACT:Datum)                ! Field ACT:Datum is a hot field or requires assignment from browse
  BRW1.AddField(ACT:Tijd,BRW1.Q.ACT:Tijd)                  ! Field ACT:Tijd is a hot field or requires assignment from browse
  BRW1.AddField(ACT:Uitgevoerd,BRW1.Q.ACT:Uitgevoerd)      ! Field ACT:Uitgevoerd is a hot field or requires assignment from browse
  BRW1.AddField(ACT:Omschrijving,BRW1.Q.ACT:Omschrijving)  ! Field ACT:Omschrijving is a hot field or requires assignment from browse
  BRW1.AddField(AAPla3:ArtikelID,BRW1.Q.AAPla3:ArtikelID)  ! Field AAPla3:ArtikelID is a hot field or requires assignment from browse
  BRW1.AddField(AAPla3:ArtikelOms,BRW1.Q.AAPla3:ArtikelOms) ! Field AAPla3:ArtikelOms is a hot field or requires assignment from browse
  BRW1.AddField(AAPla3:FirmaNaam,BRW1.Q.AAPla3:FirmaNaam)  ! Field AAPla3:FirmaNaam is a hot field or requires assignment from browse
  BRW1.AddField(AAPla3:PartijID,BRW1.Q.AAPla3:PartijID)    ! Field AAPla3:PartijID is a hot field or requires assignment from browse
  BRW1.AddField(AAPla3:ExternPartijnr,BRW1.Q.AAPla3:ExternPartijnr) ! Field AAPla3:ExternPartijnr is a hot field or requires assignment from browse
  BRW1.AddField(LOC:VerkoopKG3,BRW1.Q.LOC:VerkoopKG3)      ! Field LOC:VerkoopKG3 is a hot field or requires assignment from browse
  BRW1.AddField(AAPla3:Planning_TIME,BRW1.Q.AAPla3:Planning_TIME) ! Field AAPla3:Planning_TIME is a hot field or requires assignment from browse
  BRW1.AddField(AAPla3:Planning_DATE,BRW1.Q.AAPla3:Planning_DATE) ! Field AAPla3:Planning_DATE is a hot field or requires assignment from browse
  BRW1.AddField(AAPla3:Instructie,BRW1.Q.AAPla3:Instructie) ! Field AAPla3:Instructie is a hot field or requires assignment from browse
  BRW1.AddField(AAPla3:VerpakkingOmschrijving,BRW1.Q.AAPla3:VerpakkingOmschrijving) ! Field AAPla3:VerpakkingOmschrijving is a hot field or requires assignment from browse
  BRW1.AddField(LOC:VerkoopPallets3,BRW1.Q.LOC:VerkoopPallets3) ! Field LOC:VerkoopPallets3 is a hot field or requires assignment from browse
  BRW1.AddField(AAPla3:MutatieGemaakt,BRW1.Q.AAPla3:MutatieGemaakt) ! Field AAPla3:MutatieGemaakt is a hot field or requires assignment from browse
  BRW1.AddField(AAPla3:Geprint,BRW1.Q.AAPla3:Geprint)      ! Field AAPla3:Geprint is a hot field or requires assignment from browse
  BRW1.AddField(AAPla3:Verwerkt,BRW1.Q.AAPla3:Verwerkt)    ! Field AAPla3:Verwerkt is a hot field or requires assignment from browse
  BRW1.AddField(AAPla3:Gewogen,BRW1.Q.AAPla3:Gewogen)      ! Field AAPla3:Gewogen is a hot field or requires assignment from browse
  BRW1.AddField(AAPla3:CelOms,BRW1.Q.AAPla3:CelOms)        ! Field AAPla3:CelOms is a hot field or requires assignment from browse
  BRW1.AddField(LOC:Locatienaam3,BRW1.Q.LOC:Locatienaam3)  ! Field LOC:Locatienaam3 is a hot field or requires assignment from browse
  BRW1.AddField(AAPla3:LeverancierFirmaNaam,BRW1.Q.AAPla3:LeverancierFirmaNaam) ! Field AAPla3:LeverancierFirmaNaam is a hot field or requires assignment from browse
  BRW1.AddField(AAPla3:Transport,BRW1.Q.AAPla3:Transport)  ! Field AAPla3:Transport is a hot field or requires assignment from browse
  BRW1.AddField(AAPla3:PlanningID,BRW1.Q.AAPla3:PlanningID) ! Field AAPla3:PlanningID is a hot field or requires assignment from browse
  BRW1.AddField(AAPla3:MutatieKG,BRW1.Q.AAPla3:MutatieKG)  ! Field AAPla3:MutatieKG is a hot field or requires assignment from browse
  BRW1.AddField(AAPla3:MutatiePallets,BRW1.Q.AAPla3:MutatiePallets) ! Field AAPla3:MutatiePallets is a hot field or requires assignment from browse
  BRW1.AddField(AAPla3:KG,BRW1.Q.AAPla3:KG)                ! Field AAPla3:KG is a hot field or requires assignment from browse
  BRW1.AddField(AAPla3:Pallets,BRW1.Q.AAPla3:Pallets)      ! Field AAPla3:Pallets is a hot field or requires assignment from browse
  BRW1.AddField(ACT:ActiviteitID,BRW1.Q.ACT:ActiviteitID)  ! Field ACT:ActiviteitID is a hot field or requires assignment from browse
  BRW1.AddField(ACT:DatumTijd,BRW1.Q.ACT:DatumTijd)        ! Field ACT:DatumTijd is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('BrowseActiviteit',QuickWindow)             ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  BRW1.AskProcedure = 1                                    ! Will call: UpdateActiviteit((0))
  SELF.SetAlerts()
  NetLocalRefreshDate = today()         ! NetTalk (NetRefresh)
  NetLocalRefreshTime = clock()
  EnterByTabManager.Init(False)
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  GLO:Activiteit_ThreadID = 0
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:Activiteit.Close
    Relate:ViewPartijCelLocaties.Close
  END
  IF SELF.Opened
    INIMgr.Update('BrowseActiviteit',QuickWindow)          ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
            
   
  RETURN ReturnValue


ThisWindow.Reset PROCEDURE(BYTE Force=0)

  CODE
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
    UpdateActiviteit((0))
    ReturnValue = GlobalResponse
  END
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
  If event() = event:VisibleOnDesktop !or event() = event:moved
    ds_VisibleOnDesktop()
  end
     IF KEYCODE()=CtrlShiftP AND EVENT() = Event:PreAlertKey
       CYCLE
     END
     IF KEYCODE()=CtrlShiftP  
        UD.ShowProcedureInfo('BrowseActiviteit',UD.SetApplicationName('VoorrPln','DLL'),QuickWindow{PROP:Hlp},'06/05/2013 @ 12:50PM','09/02/2021 @ 01:27PM','10/11/2024 @ 01:55PM')  
    
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
    OF EVENT:Notify
        ! Focus overnemen
        !NOTIFICATION(LOC:NotifyCode)
        !IF LOC:NotifyCode = 1 THEN
        ThisWindow{Prop:Active} = 1
        !END
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


BRW1.Fetch PROCEDURE(BYTE Direction)

GreenBarIndex   LONG,AUTO
  CODE
  PARENT.Fetch(Direction)
  !----------------------------------------------------------------------
    LOOP GreenBarIndex=1 TO RECORDS(SELF.Q)
      GET(SELF.Q,GreenBarIndex)
      SELF.Q.ACT:Datum_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for ACT:Datum
      SELF.Q.ACT:Datum_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.ACT:Datum_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.ACT:Datum_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.ACT:Tijd_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for ACT:Tijd
      SELF.Q.ACT:Tijd_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.ACT:Tijd_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.ACT:Tijd_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.ACT:Uitgevoerd_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for ACT:Uitgevoerd
      SELF.Q.ACT:Uitgevoerd_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.ACT:Uitgevoerd_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.ACT:Uitgevoerd_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.ACT:Omschrijving_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for ACT:Omschrijving
      SELF.Q.ACT:Omschrijving_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.ACT:Omschrijving_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.ACT:Omschrijving_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.AAPla3:ArtikelID_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for AAPla3:ArtikelID
      SELF.Q.AAPla3:ArtikelID_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.AAPla3:ArtikelID_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.AAPla3:ArtikelID_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.AAPla3:ArtikelOms_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for AAPla3:ArtikelOms
      SELF.Q.AAPla3:ArtikelOms_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.AAPla3:ArtikelOms_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.AAPla3:ArtikelOms_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.AAPla3:FirmaNaam_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for AAPla3:FirmaNaam
      SELF.Q.AAPla3:FirmaNaam_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.AAPla3:FirmaNaam_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.AAPla3:FirmaNaam_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.AAPla3:PartijID_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for AAPla3:PartijID
      SELF.Q.AAPla3:PartijID_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.AAPla3:PartijID_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.AAPla3:PartijID_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.AAPla3:ExternPartijnr_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for AAPla3:ExternPartijnr
      SELF.Q.AAPla3:ExternPartijnr_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.AAPla3:ExternPartijnr_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.AAPla3:ExternPartijnr_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.LOC:VerkoopKG3_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for LOC:VerkoopKG3
      SELF.Q.LOC:VerkoopKG3_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.LOC:VerkoopKG3_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.LOC:VerkoopKG3_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.AAPla3:Planning_TIME_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for AAPla3:Planning_TIME
      SELF.Q.AAPla3:Planning_TIME_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.AAPla3:Planning_TIME_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.AAPla3:Planning_TIME_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.AAPla3:Planning_DATE_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for AAPla3:Planning_DATE
      SELF.Q.AAPla3:Planning_DATE_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.AAPla3:Planning_DATE_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.AAPla3:Planning_DATE_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.AAPla3:Instructie_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for AAPla3:Instructie
      SELF.Q.AAPla3:Instructie_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.AAPla3:Instructie_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.AAPla3:Instructie_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.AAPla3:VerpakkingOmschrijving_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for AAPla3:VerpakkingOmschrijving
      SELF.Q.AAPla3:VerpakkingOmschrijving_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.AAPla3:VerpakkingOmschrijving_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.AAPla3:VerpakkingOmschrijving_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.LOC:VerkoopPallets3_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for LOC:VerkoopPallets3
      SELF.Q.LOC:VerkoopPallets3_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.LOC:VerkoopPallets3_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.LOC:VerkoopPallets3_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.AAPla3:MutatieGemaakt_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for AAPla3:MutatieGemaakt
      SELF.Q.AAPla3:MutatieGemaakt_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.AAPla3:MutatieGemaakt_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.AAPla3:MutatieGemaakt_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.AAPla3:Geprint_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for AAPla3:Geprint
      SELF.Q.AAPla3:Geprint_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.AAPla3:Geprint_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.AAPla3:Geprint_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.AAPla3:Verwerkt_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for AAPla3:Verwerkt
      SELF.Q.AAPla3:Verwerkt_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.AAPla3:Verwerkt_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.AAPla3:Verwerkt_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.AAPla3:Gewogen_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for AAPla3:Gewogen
      SELF.Q.AAPla3:Gewogen_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.AAPla3:Gewogen_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.AAPla3:Gewogen_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.AAPla3:CelOms_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for AAPla3:CelOms
      SELF.Q.AAPla3:CelOms_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.AAPla3:CelOms_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.AAPla3:CelOms_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.LOC:Locatienaam3_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for LOC:Locatienaam3
      SELF.Q.LOC:Locatienaam3_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.LOC:Locatienaam3_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.LOC:Locatienaam3_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.AAPla3:LeverancierFirmaNaam_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for AAPla3:LeverancierFirmaNaam
      SELF.Q.AAPla3:LeverancierFirmaNaam_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.AAPla3:LeverancierFirmaNaam_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.AAPla3:LeverancierFirmaNaam_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.AAPla3:Transport_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for AAPla3:Transport
      SELF.Q.AAPla3:Transport_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.AAPla3:Transport_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.AAPla3:Transport_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.AAPla3:PlanningID_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for AAPla3:PlanningID
      SELF.Q.AAPla3:PlanningID_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.AAPla3:PlanningID_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.AAPla3:PlanningID_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
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
  SELF.ViewControl = ?View:2                               ! Setup the control used to initiate view only mode


BRW1.ResetSort PROCEDURE(BYTE Force)

ReturnValue          BYTE,AUTO

  CODE
  IF CHOICE(?CurrentTab) = 2
    RETURN SELF.SetSort(1,Force)
  ELSIF CHOICE(?CurrentTab) = 3
    RETURN SELF.SetSort(2,Force)
  ELSE
    RETURN SELF.SetSort(3,Force)
  END
  ReturnValue = PARENT.ResetSort(Force)
  RETURN ReturnValue


BRW1.SetQueueRecord PROCEDURE

  CODE
  LOC:Locatienaam3 = CachingClass.GetCelLocatieNaam(AAPla3:PartijID,AAPla3:CelID)
  
  IF AAPla3:MutatieGemaakt THEN
  	LOC:VerkoopKG3 = AAPla3:MutatieKG
  	LOC:VerkoopPallets3 = AAPla3:MutatiePallets
  ELSE
  	LOC:VerkoopKG3 = AAPla3:KG
  	LOC:VerkoopPallets3 = AAPla3:Pallets
  END
  PARENT.SetQueueRecord
  If SELF.Q.LOC:VerkoopKG3<0
  	Self.Q.LOC:VerkoopKG3_NormalFG   = Color:Red
  	Self.Q.LOC:VerkoopKG3_NormalBG   = Color:Red
  	Self.Q.LOC:VerkoopKG3_SelectedFG = Color:Red
  	Self.Q.LOC:VerkoopKG3_SelectedBG = Color:Red
  	Self.Q.LOC:VerkoopPallets3_NormalFG   = Color:Red
  	Self.Q.LOC:VerkoopPallets3_SelectedFG = Color:Red
  END
  
  IF (ACT:Uitgevoerd)
    SELF.Q.ACT:Uitgevoerd_Icon = 2                         ! Set icon from icon list
  ELSE
    SELF.Q.ACT:Uitgevoerd_Icon = 1                         ! Set icon from icon list
  END
  CLEAR (SELF.Q.AAPla3:Instructie_Tip)
  IF (AAPla3:MutatieGemaakt=1)
    SELF.Q.AAPla3:MutatieGemaakt_Icon = 2                  ! Set icon from icon list
  ELSE
    SELF.Q.AAPla3:MutatieGemaakt_Icon = 1                  ! Set icon from icon list
  END
  IF (AAPla3:Geprint)
    SELF.Q.AAPla3:Geprint_Icon = 2                         ! Set icon from icon list
  ELSE
    SELF.Q.AAPla3:Geprint_Icon = 1                         ! Set icon from icon list
  END
  IF (AAPla3:Verwerkt)
    SELF.Q.AAPla3:Verwerkt_Icon = 2                        ! Set icon from icon list
  ELSE
    SELF.Q.AAPla3:Verwerkt_Icon = 1                        ! Set icon from icon list
  END
  IF (AAPla3:Gewogen)
    SELF.Q.AAPla3:Gewogen_Icon = 2                         ! Set icon from icon list
  ELSE
    SELF.Q.AAPla3:Gewogen_Icon = 1                         ! Set icon from icon list
  END
  CLEAR (SELF.Q.AAPla3:Transport_Tip)
  CLEAR (SELF.Q.AAPla3:PlanningID_Tip)
  !----------------------------------------------------------------------
      SELF.Q.ACT:Datum_NormalFG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1) ! Set color values for ACT:Datum
      SELF.Q.ACT:Datum_NormalBG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,8454143)
      SELF.Q.ACT:Datum_SelectedFG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.ACT:Datum_SelectedBG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.ACT:Tijd_NormalFG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1) ! Set color values for ACT:Tijd
      SELF.Q.ACT:Tijd_NormalBG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,8454143)
      SELF.Q.ACT:Tijd_SelectedFG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.ACT:Tijd_SelectedBG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.ACT:Uitgevoerd_NormalFG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1) ! Set color values for ACT:Uitgevoerd
      SELF.Q.ACT:Uitgevoerd_NormalBG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,8454143)
      SELF.Q.ACT:Uitgevoerd_SelectedFG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.ACT:Uitgevoerd_SelectedBG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.ACT:Omschrijving_NormalFG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1) ! Set color values for ACT:Omschrijving
      SELF.Q.ACT:Omschrijving_NormalBG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,8454143)
      SELF.Q.ACT:Omschrijving_SelectedFG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.ACT:Omschrijving_SelectedBG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.AAPla3:ArtikelID_NormalFG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1) ! Set color values for AAPla3:ArtikelID
      SELF.Q.AAPla3:ArtikelID_NormalBG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,8454143)
      SELF.Q.AAPla3:ArtikelID_SelectedFG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.AAPla3:ArtikelID_SelectedBG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.AAPla3:ArtikelOms_NormalFG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1) ! Set color values for AAPla3:ArtikelOms
      SELF.Q.AAPla3:ArtikelOms_NormalBG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,8454143)
      SELF.Q.AAPla3:ArtikelOms_SelectedFG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.AAPla3:ArtikelOms_SelectedBG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.AAPla3:FirmaNaam_NormalFG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1) ! Set color values for AAPla3:FirmaNaam
      SELF.Q.AAPla3:FirmaNaam_NormalBG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,8454143)
      SELF.Q.AAPla3:FirmaNaam_SelectedFG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.AAPla3:FirmaNaam_SelectedBG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.AAPla3:PartijID_NormalFG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1) ! Set color values for AAPla3:PartijID
      SELF.Q.AAPla3:PartijID_NormalBG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,8454143)
      SELF.Q.AAPla3:PartijID_SelectedFG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.AAPla3:PartijID_SelectedBG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.AAPla3:ExternPartijnr_NormalFG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1) ! Set color values for AAPla3:ExternPartijnr
      SELF.Q.AAPla3:ExternPartijnr_NormalBG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,8454143)
      SELF.Q.AAPla3:ExternPartijnr_SelectedFG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.AAPla3:ExternPartijnr_SelectedBG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.LOC:VerkoopKG3_NormalFG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1) ! Set color values for LOC:VerkoopKG3
      SELF.Q.LOC:VerkoopKG3_NormalBG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,8454143)
      SELF.Q.LOC:VerkoopKG3_SelectedFG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.LOC:VerkoopKG3_SelectedBG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.AAPla3:Planning_TIME_NormalFG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1) ! Set color values for AAPla3:Planning_TIME
      SELF.Q.AAPla3:Planning_TIME_NormalBG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,8454143)
      SELF.Q.AAPla3:Planning_TIME_SelectedFG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.AAPla3:Planning_TIME_SelectedBG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.AAPla3:Planning_DATE_NormalFG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1) ! Set color values for AAPla3:Planning_DATE
      SELF.Q.AAPla3:Planning_DATE_NormalBG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,8454143)
      SELF.Q.AAPla3:Planning_DATE_SelectedFG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.AAPla3:Planning_DATE_SelectedBG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.AAPla3:Instructie_NormalFG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1) ! Set color values for AAPla3:Instructie
      SELF.Q.AAPla3:Instructie_NormalBG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,8454143)
      SELF.Q.AAPla3:Instructie_SelectedFG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.AAPla3:Instructie_SelectedBG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.AAPla3:VerpakkingOmschrijving_NormalFG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1) ! Set color values for AAPla3:VerpakkingOmschrijving
      SELF.Q.AAPla3:VerpakkingOmschrijving_NormalBG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,8454143)
      SELF.Q.AAPla3:VerpakkingOmschrijving_SelectedFG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.AAPla3:VerpakkingOmschrijving_SelectedBG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.LOC:VerkoopPallets3_NormalFG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1) ! Set color values for LOC:VerkoopPallets3
      SELF.Q.LOC:VerkoopPallets3_NormalBG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,8454143)
      SELF.Q.LOC:VerkoopPallets3_SelectedFG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.LOC:VerkoopPallets3_SelectedBG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.AAPla3:MutatieGemaakt_NormalFG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1) ! Set color values for AAPla3:MutatieGemaakt
      SELF.Q.AAPla3:MutatieGemaakt_NormalBG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,8454143)
      SELF.Q.AAPla3:MutatieGemaakt_SelectedFG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.AAPla3:MutatieGemaakt_SelectedBG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.AAPla3:Geprint_NormalFG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1) ! Set color values for AAPla3:Geprint
      SELF.Q.AAPla3:Geprint_NormalBG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,8454143)
      SELF.Q.AAPla3:Geprint_SelectedFG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.AAPla3:Geprint_SelectedBG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.AAPla3:Verwerkt_NormalFG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1) ! Set color values for AAPla3:Verwerkt
      SELF.Q.AAPla3:Verwerkt_NormalBG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,8454143)
      SELF.Q.AAPla3:Verwerkt_SelectedFG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.AAPla3:Verwerkt_SelectedBG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.AAPla3:Gewogen_NormalFG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1) ! Set color values for AAPla3:Gewogen
      SELF.Q.AAPla3:Gewogen_NormalBG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,8454143)
      SELF.Q.AAPla3:Gewogen_SelectedFG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.AAPla3:Gewogen_SelectedBG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.AAPla3:CelOms_NormalFG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1) ! Set color values for AAPla3:CelOms
      SELF.Q.AAPla3:CelOms_NormalBG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,8454143)
      SELF.Q.AAPla3:CelOms_SelectedFG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.AAPla3:CelOms_SelectedBG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.LOC:Locatienaam3_NormalFG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1) ! Set color values for LOC:Locatienaam3
      SELF.Q.LOC:Locatienaam3_NormalBG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,8454143)
      SELF.Q.LOC:Locatienaam3_SelectedFG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.LOC:Locatienaam3_SelectedBG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.AAPla3:LeverancierFirmaNaam_NormalFG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1) ! Set color values for AAPla3:LeverancierFirmaNaam
      SELF.Q.AAPla3:LeverancierFirmaNaam_NormalBG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,8454143)
      SELF.Q.AAPla3:LeverancierFirmaNaam_SelectedFG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.AAPla3:LeverancierFirmaNaam_SelectedBG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.AAPla3:Transport_NormalFG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1) ! Set color values for AAPla3:Transport
      SELF.Q.AAPla3:Transport_NormalBG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,8454143)
      SELF.Q.AAPla3:Transport_SelectedFG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.AAPla3:Transport_SelectedBG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.AAPla3:PlanningID_NormalFG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1) ! Set color values for AAPla3:PlanningID
      SELF.Q.AAPla3:PlanningID_NormalBG   = CHOOSE(CHOICE(?Browse:1) % 2,-1,8454143)
      SELF.Q.AAPla3:PlanningID_SelectedFG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
      SELF.Q.AAPla3:PlanningID_SelectedBG = CHOOSE(CHOICE(?Browse:1) % 2,-1,-1)
  !----------------------------------------------------------------------


BRW1.SetSort PROCEDURE(BYTE NewOrder,BYTE Force)

ReturnValue          BYTE,AUTO

_starttijd              TIME
  CODE
  _starttijd = CLOCK()
  ReturnValue = PARENT.SetSort(NewOrder,Force)
  IF ReturnValue
      LogSetSort('Activiteit','NewOrder: '&NewOrder&' Force: '&Force& ' ReturnValue: '&ReturnValue&' '&(Clock()-_starttijd)/100&' sec')
  END
  RETURN ReturnValue


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window

