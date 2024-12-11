

   MEMBER('VoorrVrd.clw')                                  ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABPOPUP.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('VOORRVRD007.INC'),ONCE        !Local module procedure declarations
                     END


!!! <summary>
!!! Generated from procedure template - Window
!!! Browse the ViewVoorraad file
!!! </summary>
BrowsePartijVoorraad_WORDTNIETGEBRUIKT PROCEDURE 

udpt            UltimateDebugProcedureTracker
LOC:TempFormat       STRING(2000)                          ! 
Loc:Start            LONG                                  ! 
LOC:CelLocatieNamen  CSTRING('<0>{50}')                    ! 
CurrentTab           STRING(80)                            ! 
LOC:Cel1KG           DECIMAL(9,2)                          ! 
LOC:Cel2KG           DECIMAL(9,2)                          ! 
LOC:Cel3KG           DECIMAL(9,2)                          ! 
LOC:Cel4KG           DECIMAL(9,2)                          ! 
LOC:Cel5KG           DECIMAL(9,2)                          ! 
LOC:Cel6KG           DECIMAL(9,2)                          ! 
LOC:Cel7KG           DECIMAL(9,2)                          ! 
LOC:Cel8KG           DECIMAL(9,2)                          ! 
LOC:Cel9KG           DECIMAL(9,2)                          ! 
LOC:Cel10KG          DECIMAL(9,2)                          ! 
LOC:Cel11KG          DECIMAL(9,2)                          ! 
LOC:Cel12KG          DECIMAL(9,2)                          ! 
LOC:Cel13KG          DECIMAL(9,2)                          ! 
LOC:Cel14KG          DECIMAL(9,2)                          ! 
LOC:Cel15KG          DECIMAL(9,2)                          ! 
Loc:CelID2           LONG                                  ! 
Loc:CelID            LONG                                  ! 
LOC:CelPointer       LONG                                  ! 
LOC:CelValue         DECIMAL(9,2)                          ! 
Loc:CelOms           CSTRING(51)                           ! 
Loc:TotaalKG         LONG                                  ! 
Loc:TotaalPallets    LONG                                  ! 
LOC:VVCTVoorraadKG   DECIMAL(9,2)                          ! 
LOC:ArtikelID        CSTRING('<0>{30}')                    ! 
LOC:PartijCelID      CSTRING('<0>{25}')                    ! 
Loc:CelLocatieID     LONG                                  ! 
LOC:PartijVoorraadSortering STRING(20)                     ! 
LOC:ZoekVak          STRING(20)                            ! 
LOC:DatumNU          LONG                                  ! 
LOC:TotaalVoorraad   DECIMAL(12,2)                         ! 
Loc:LegeVoorraadVerbergen BYTE                             ! 
LOC:VoorraadKG       DECIMAL(9,2)                          ! 
LOC:PartijRoodkleurenNaDagen LONG                          ! 
BRW2::View:Browse    VIEW(PartijCelVoorraad)
                       PROJECT(PCV:ArtikelOms)
                       PROJECT(PCV:PartijID)
                       PROJECT(PCV:ExternPartijnr)
                       PROJECT(PCV:PartijVoorraadKG)
                       PROJECT(PCV:PartijVerkochtKG)
                       PROJECT(PCV:PartijCelVoorraadKG)
                       PROJECT(PCV:PartijCelVerkochtKG)
                       PROJECT(PCV:PartijCelVoorraadID)
                       PROJECT(PCV:CelID)
                       JOIN(Par:Partij_PK,PCV:PartijID)
                         PROJECT(Par:ArtikelID)
                         PROJECT(Par:BerekendeInkoopKGPrijs)
                         PROJECT(Par:AanmaakDatum_DATE)
                         PROJECT(Par:PartijID)
                         PROJECT(Par:VerpakkingID)
                         PROJECT(Par:Leverancier)
                         JOIN(Ver:Verpakking_PK,Par:VerpakkingID)
                           PROJECT(Ver:VerpakkingOmschrijving)
                           PROJECT(Ver:VerpakkingID)
                         END
                         JOIN(AREL:Relatie_PK,Par:Leverancier)
                           PROJECT(AREL:FirmaNaam)
                           PROJECT(AREL:RelatieID)
                         END
                       END
                       JOIN(CEL:CEL_PK,PCV:CelID)
                         PROJECT(CEL:CelOms)
                         PROJECT(CEL:CelID)
                       END
                     END
Queue:Browse         QUEUE                            !Queue declaration for browse/combo box using ?List
Par:ArtikelID          LIKE(Par:ArtikelID)            !List box control field - type derived from field
Par:ArtikelID_NormalFG LONG                           !Normal forground color
Par:ArtikelID_NormalBG LONG                           !Normal background color
Par:ArtikelID_SelectedFG LONG                         !Selected forground color
Par:ArtikelID_SelectedBG LONG                         !Selected background color
PCV:ArtikelOms         LIKE(PCV:ArtikelOms)           !List box control field - type derived from field
PCV:ArtikelOms_NormalFG LONG                          !Normal forground color
PCV:ArtikelOms_NormalBG LONG                          !Normal background color
PCV:ArtikelOms_SelectedFG LONG                        !Selected forground color
PCV:ArtikelOms_SelectedBG LONG                        !Selected background color
PCV:PartijID           LIKE(PCV:PartijID)             !List box control field - type derived from field
PCV:PartijID_NormalFG  LONG                           !Normal forground color
PCV:PartijID_NormalBG  LONG                           !Normal background color
PCV:PartijID_SelectedFG LONG                          !Selected forground color
PCV:PartijID_SelectedBG LONG                          !Selected background color
PCV:ExternPartijnr     LIKE(PCV:ExternPartijnr)       !List box control field - type derived from field
PCV:ExternPartijnr_NormalFG LONG                      !Normal forground color
PCV:ExternPartijnr_NormalBG LONG                      !Normal background color
PCV:ExternPartijnr_SelectedFG LONG                    !Selected forground color
PCV:ExternPartijnr_SelectedBG LONG                    !Selected background color
PCV:PartijVoorraadKG   LIKE(PCV:PartijVoorraadKG)     !List box control field - type derived from field
PCV:PartijVoorraadKG_NormalFG LONG                    !Normal forground color
PCV:PartijVoorraadKG_NormalBG LONG                    !Normal background color
PCV:PartijVoorraadKG_SelectedFG LONG                  !Selected forground color
PCV:PartijVoorraadKG_SelectedBG LONG                  !Selected background color
PCV:PartijVoorraadKG_Style LONG                       !Field style
PCV:PartijVerkochtKG   LIKE(PCV:PartijVerkochtKG)     !List box control field - type derived from field
PCV:PartijVerkochtKG_NormalFG LONG                    !Normal forground color
PCV:PartijVerkochtKG_NormalBG LONG                    !Normal background color
PCV:PartijVerkochtKG_SelectedFG LONG                  !Selected forground color
PCV:PartijVerkochtKG_SelectedBG LONG                  !Selected background color
PCV:PartijVerkochtKG_Style LONG                       !Field style
CEL:CelOms             LIKE(CEL:CelOms)               !List box control field - type derived from field
CEL:CelOms_NormalFG    LONG                           !Normal forground color
CEL:CelOms_NormalBG    LONG                           !Normal background color
CEL:CelOms_SelectedFG  LONG                           !Selected forground color
CEL:CelOms_SelectedBG  LONG                           !Selected background color
LOC:CelLocatieNamen    LIKE(LOC:CelLocatieNamen)      !List box control field - type derived from local data
LOC:CelLocatieNamen_NormalFG LONG                     !Normal forground color
LOC:CelLocatieNamen_NormalBG LONG                     !Normal background color
LOC:CelLocatieNamen_SelectedFG LONG                   !Selected forground color
LOC:CelLocatieNamen_SelectedBG LONG                   !Selected background color
PCV:PartijCelVoorraadKG LIKE(PCV:PartijCelVoorraadKG) !List box control field - type derived from field
PCV:PartijCelVoorraadKG_NormalFG LONG                 !Normal forground color
PCV:PartijCelVoorraadKG_NormalBG LONG                 !Normal background color
PCV:PartijCelVoorraadKG_SelectedFG LONG               !Selected forground color
PCV:PartijCelVoorraadKG_SelectedBG LONG               !Selected background color
PCV:PartijCelVerkochtKG LIKE(PCV:PartijCelVerkochtKG) !List box control field - type derived from field
PCV:PartijCelVerkochtKG_NormalFG LONG                 !Normal forground color
PCV:PartijCelVerkochtKG_NormalBG LONG                 !Normal background color
PCV:PartijCelVerkochtKG_SelectedFG LONG               !Selected forground color
PCV:PartijCelVerkochtKG_SelectedBG LONG               !Selected background color
Par:BerekendeInkoopKGPrijs LIKE(Par:BerekendeInkoopKGPrijs) !List box control field - type derived from field
Par:BerekendeInkoopKGPrijs_NormalFG LONG              !Normal forground color
Par:BerekendeInkoopKGPrijs_NormalBG LONG              !Normal background color
Par:BerekendeInkoopKGPrijs_SelectedFG LONG            !Selected forground color
Par:BerekendeInkoopKGPrijs_SelectedBG LONG            !Selected background color
Par:AanmaakDatum_DATE  LIKE(Par:AanmaakDatum_DATE)    !List box control field - type derived from field
Par:AanmaakDatum_DATE_NormalFG LONG                   !Normal forground color
Par:AanmaakDatum_DATE_NormalBG LONG                   !Normal background color
Par:AanmaakDatum_DATE_SelectedFG LONG                 !Selected forground color
Par:AanmaakDatum_DATE_SelectedBG LONG                 !Selected background color
Ver:VerpakkingOmschrijving LIKE(Ver:VerpakkingOmschrijving) !List box control field - type derived from field
Ver:VerpakkingOmschrijving_NormalFG LONG              !Normal forground color
Ver:VerpakkingOmschrijving_NormalBG LONG              !Normal background color
Ver:VerpakkingOmschrijving_SelectedFG LONG            !Selected forground color
Ver:VerpakkingOmschrijving_SelectedBG LONG            !Selected background color
AREL:FirmaNaam         LIKE(AREL:FirmaNaam)           !List box control field - type derived from field
AREL:FirmaNaam_NormalFG LONG                          !Normal forground color
AREL:FirmaNaam_NormalBG LONG                          !Normal background color
AREL:FirmaNaam_SelectedFG LONG                        !Selected forground color
AREL:FirmaNaam_SelectedBG LONG                        !Selected background color
PCV:PartijCelVoorraadID LIKE(PCV:PartijCelVoorraadID) !Primary key field - type derived from field
PCV:CelID              LIKE(PCV:CelID)                !Browse key field - type derived from field
Par:PartijID           LIKE(Par:PartijID)             !Related join file key field - type derived from field
Ver:VerpakkingID       LIKE(Ver:VerpakkingID)         !Related join file key field - type derived from field
AREL:RelatieID         LIKE(AREL:RelatieID)           !Related join file key field - type derived from field
CEL:CelID              LIKE(CEL:CelID)                !Related join file key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
LocEnableEnterByTab  BYTE(1)                               !Used by the ENTER Instead of Tab template
EnterByTabManager    EnterByTabClass
NetLocalRefreshDate     Long     ! NetTalk (NetRefresh)
NetLocalRefreshTime     Long
NetLocalDependancies    String('|PartijCelVoorraad|Partij|Verpakking|ARelatie|Cel|')
QuickWindow          WINDOW('Partij-Voorraad'),AT(,,581,274),FONT('MS Sans Serif',8,,,CHARSET:DEFAULT),RESIZE,CENTER, |
  GRAY,IMM,MAX,MDI,HLP('BrowseVoorraad'),SYSTEM
                       SHEET,AT(4,4,575,250),USE(?CurrentTab)
                         TAB('Partij-voorraden'),USE(?TAB1)
                           LIST,AT(11,46,561,199),USE(?List),HVSCROLL,FORMAT('[50L(2)|M*~ID~C(0)@s30@240L(2)|M*~Om' & |
  'schrijving~C(0)@s60@](150)|~Artikel~[43R(2)|M*~Intern~C(0)@n_10@40R(2)|M*~Extern~C(0' & |
  ')@s20@56R(2)|M*Y~Voorraad (KG)~C(0)@n-13`2@57R(2)|M*Y~Verkocht (KG)~C(0)@n-13`2@]|~P' & |
  'artij~[60L(2)|M*~Cel~C(0)@s50@77L(2)|M*~Locatie~C(0)@s50@56R(2)|M*~Voorraad (KG)~C(0' & |
  ')@n-13`2@Z(1)57R(2)|M*~Verkocht (KG)~C(0)@n-13`2@Z(1)]|~Cel~61R(2)|M*~Inkoop KG-Prij' & |
  's~C(0)@n14`3@[40R(2)|M*~Datum ~C(0)@d17@](46)|~Aanmaak~60L(2)|M*~Verpakking~C(0)@s50' & |
  '@200L(2)|M*~Leverancier~C(0)@s50@'),FROM(Queue:Browse),IMM
                           BUTTON('Partij-voorraad verloop'),AT(11,25),USE(?PartijVoorraadVerloop)
                           BUTTON('Overboeken'),AT(104,25,73),USE(?Overboeken2)
                           PROMPT('in sortering:'),AT(440,28),USE(?LOC:PartijVoorraadSortering:Prompt)
                           BUTTON('Extra stickers'),AT(181,25),USE(?ExtraStickers)
                           BUTTON('Wijzig cel/locatie'),AT(243,25),USE(?WijzigLocatie)
                           ENTRY(@s20),AT(347,25,88),USE(LOC:ZoekVak)
                           LIST,AT(479,25,90,13),USE(LOC:PartijVoorraadSortering),DROP(10),FROM('Op artikel|#Op ar' & |
  'tikel|Op intern partijnr.|#Op intern partijnr.|Op extern partijnr.|#Op extern partij' & |
  'nr.|Op aanmaakdatum|#Op aanmaakdatum'),IMM
                           PROMPT('Zoeken:'),AT(315,28),USE(?ZoekPrompt)
                         END
                       END
                       BUTTON('&Sluiten'),AT(527,258,49,14),USE(?Close),LEFT,ICON('WACLOSE.ICO'),FLAT,MSG('Close Window'), |
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
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED
TakeEvent              PROCEDURE(),BYTE,PROC,DERIVED
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
BRW2                 CLASS(BrowseClass)                    ! Browse using ?List
Q                      &Queue:Browse                  !Reference to browse queue
Fetch                  PROCEDURE(BYTE Direction),DERIVED
ResetQueue             PROCEDURE(BYTE ResetMode),DERIVED
ResetSort              PROCEDURE(BYTE Force),BYTE,PROC,DERIVED
SetQueueRecord         PROCEDURE(),DERIVED
                     END

BRW2::Sort0:Locator  IncrementalLocatorClass               ! Default Locator
BRW2::Sort1:Locator  IncrementalLocatorClass               ! Conditional Locator - CLIP(LOC:PartijVoorraadSortering) = CLIP('Op extern partijnr.')
BRW2::Sort2:Locator  IncrementalLocatorClass               ! Conditional Locator - CLIP(LOC:PartijVoorraadSortering) = CLIP('Op intern partijnr.')
BRW2::Sort3:Locator  StepLocatorClass                      ! Conditional Locator - CLIP(LOC:PartijVoorraadSortering) = CLIP('Op aanmaakdatum')
Resizer              CLASS(WindowResizeClass)
Init                   PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)
                     END


  CODE
  GlobalResponse = ThisWindow.Run()                        ! Opens the window and starts an Accept Loop

!---------------------------------------------------------------------------
DefineListboxStyle ROUTINE
!|
!| This routine create all the styles to be shared in this window
!| It`s called after the window open
!|
  !------------------------------------
  !Style for ?List
  !------------------------------------
  ?List{PROPSTYLE:FontName, 1}      = 'MS Sans Serif'
  ?List{PROPSTYLE:FontSize, 1}      = 10
  ?List{PROPSTYLE:FontStyle, 1}     = 700
  ?List{PROPSTYLE:TextColor, 1}     = -1
  ?List{PROPSTYLE:BackColor, 1}     = -1
  ?List{PROPSTYLE:TextSelected, 1}  = -1
  ?List{PROPSTYLE:BackSelected, 1}  = -1
  !------------------------------------
!---------------------------------------------------------------------------
VulCelKG ROUTINE
	CASE LOC:CelPointer
	OF 0
		LOC:Cel1KG = LOC:CelValue
	OF 1
		LOC:Cel2KG = LOC:CelValue
	OF 2
		LOC:Cel3KG = LOC:CelValue
	OF 3
		LOC:Cel4KG = LOC:CelValue
	OF 4
		LOC:Cel5KG = LOC:CelValue
	OF 5
		LOC:Cel6KG = LOC:CelValue
	OF 6
		LOC:Cel7KG = LOC:CelValue
	OF 7
		LOC:Cel8KG = LOC:CelValue
	OF 8
		LOC:Cel9KG = LOC:CelValue
	OF 9
		LOC:Cel10KG = LOC:CelValue
	OF 10
		LOC:Cel11KG = LOC:CelValue
	OF 11
		LOC:Cel12KG = LOC:CelValue
	OF 12
		LOC:Cel13KG = LOC:CelValue
	OF 13
		LOC:Cel14KG = LOC:CelValue
	OF 14
		LOC:Cel15KG = LOC:CelValue
	END
	EXIT
ResetBrowse  ROUTINE
	FREE(CelLocatieQueue)
	BRW2.ResetQueue(0)
	EXIT

ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

TempFormat CSTRING(10000)
  CODE
        udpt.Init(UD,'BrowsePartijVoorraad_WORDTNIETGEBRUIKT','VoorrVrd007.clw','VoorrVrd.DLL','06/05/2020 @ 08:47PM')    
             
  GlobalErrors.SetProcedureName('BrowsePartijVoorraad_WORDTNIETGEBRUIKT')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  GLO:PartijVoorraad_ThreadID = THREAD()
  LOC:PartijVoorraadSortering = 'Op artikel'
  Loc:LegeVoorraadVerbergen=TRUE
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?List
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('LOC:CelLocatieNamen',LOC:CelLocatieNamen)          ! Added by: BrowseBox(ABC)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
  IF SELF.Request = SelectRecord
     SELF.AddItem(?Close,RequestCancelled)                 ! Add the close control to the window manger
  ELSE
     SELF.AddItem(?Close,RequestCompleted)                 ! Add the close control to the window manger
  END
  Relate:AACel.Open                                        ! File AACel used by this procedure, so make sure it's RelationManager is open
  Relate:AViewVoorraadCelTotaal.Open                       ! File AViewVoorraadCelTotaal used by this procedure, so make sure it's RelationManager is open
  Relate:PartijCelVoorraad.Open                            ! File PartijCelVoorraad used by this procedure, so make sure it's RelationManager is open
  Relate:ViewPartijCelLocaties.Open                        ! File ViewPartijCelLocaties used by this procedure, so make sure it's RelationManager is open
  Relate:ViewPlanningPartij.Open                           ! File ViewPlanningPartij used by this procedure, so make sure it's RelationManager is open
  Relate:ViewPlanningPartijTotaal.Open                     ! File ViewPlanningPartijTotaal used by this procedure, so make sure it's RelationManager is open
  Relate:ViewVoorraadPartijTotaal.Open                     ! File ViewVoorraadPartijTotaal used by this procedure, so make sure it's RelationManager is open
  Relate:ViewVoorraadPartij_INDEXED.Open                   ! File ViewVoorraadPartij_INDEXED used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  LOC:PartijRoodkleurenNaDagen = GETINI('Voorraad','PartijRoodkleurenNaDagen',180,'.\Voorraad.ini')
  BRW2.Init(?List,Queue:Browse.ViewPosition,BRW2::View:Browse,Queue:Browse,Relate:PartijCelVoorraad,SELF) ! Initialize the browse manager
  BRW2.SetUseMRP(False)
  SELF.Open(QuickWindow)                                   ! Open window
  IF IGB:BekijkenPrijzen <> 1 THEN
  	! Prijzen niet tonen, format string wijzigen 53R(2)|M*~Inkoop KG-Prijs
      startidx# = INSTRING(CLIP('Inkoop KG-Prijs'), CLIP(?List{PROP:Format}), 1, 1)
  
      IF (startidx# - 10 > 0)
          ! Gevonden
          TempFormat = ?List{PROP:Format}
          ?List{PROP:Format} = SUB(TempFormat, 1, startidx# - 11) & '0' & CLIP(SUB(TempFormat, startidx# - 8, LEN(TempFormat)))
          !?List{PROP:Format} = SUB(TempFormat, 1, (startidx# - 10) - 1) & '0' & SUB(TempFormat, (startidx# - 10) + 2, LEN(TempFormat) - (startidx# - 10) + 2)
      END
  END
  WinAlertMouseZoom()
  Do DefineListboxStyle
  QuickWindow{Prop:Alrt,255} = CtrlShiftP
  BRW2.Q &= Queue:Browse
  BRW2.AddSortOrder(,PCV:FK3_PartijCelVoorraad)            ! Add the sort order for PCV:FK3_PartijCelVoorraad for sort order 1
  BRW2.AddLocator(BRW2::Sort1:Locator)                     ! Browse has a locator for sort order 1
  BRW2::Sort1:Locator.Init(?LOC:ZoekVak,PCV:ExternPartijnr,1,BRW2) ! Initialize the browse locator using ?LOC:ZoekVak using key: PCV:FK3_PartijCelVoorraad , PCV:ExternPartijnr
  BRW2.SetFilter('(PCV:PartijID<<>0 AND CLIP(PCV:ArtikelOms)<<>'''')') ! Apply filter expression to browse
  BRW2.AddResetField(LOC:PartijVoorraadSortering)          ! Apply the reset field
  BRW2.AddSortOrder(,PCV:FK1_PartijCelVoorraad)            ! Add the sort order for PCV:FK1_PartijCelVoorraad for sort order 2
  BRW2.AddLocator(BRW2::Sort2:Locator)                     ! Browse has a locator for sort order 2
  BRW2::Sort2:Locator.Init(?LOC:ZoekVak,PCV:PartijID,1,BRW2) ! Initialize the browse locator using ?LOC:ZoekVak using key: PCV:FK1_PartijCelVoorraad , PCV:PartijID
  BRW2.SetFilter('(PCV:PartijID<<>0 AND CLIP(PCV:ArtikelOms)<<>'''')') ! Apply filter expression to browse
  BRW2.AddResetField(LOC:PartijVoorraadSortering)          ! Apply the reset field
  BRW2.AddSortOrder(,PCV:FK1_PartijCelVoorraad)            ! Add the sort order for PCV:FK1_PartijCelVoorraad for sort order 3
  BRW2.AddLocator(BRW2::Sort3:Locator)                     ! Browse has a locator for sort order 3
  BRW2::Sort3:Locator.Init(,PCV:PartijID,1,BRW2)           ! Initialize the browse locator using  using key: PCV:FK1_PartijCelVoorraad , PCV:PartijID
  BRW2.SetFilter('(PCV:PartijID<<>0 AND PCV:PartijVoorraadKG<<>0 AND PCV:PartijCelVoorraadKG<<>0 AND CLIP(PCV:ArtikelOms)<<>'''')') ! Apply filter expression to browse
  BRW2.AddResetField(LOC:PartijVoorraadSortering)          ! Apply the reset field
  BRW2.AddSortOrder(,PCV:FK4_PartijCelVoorraad)            ! Add the sort order for PCV:FK4_PartijCelVoorraad for sort order 4
  BRW2.AddLocator(BRW2::Sort0:Locator)                     ! Browse has a locator for sort order 4
  BRW2::Sort0:Locator.Init(?LOC:ZoekVak,PCV:ArtikelOms,1,BRW2) ! Initialize the browse locator using ?LOC:ZoekVak using key: PCV:FK4_PartijCelVoorraad , PCV:ArtikelOms
  BRW2.SetFilter('(PCV:PartijID<<>0 AND PCV:PartijVoorraadKG<<>0 AND PCV:PartijCelVoorraadKG<<>0 AND CLIP(PCV:ArtikelOms)<<>'''')') ! Apply filter expression to browse
  BRW2.AddResetField(LOC:PartijVoorraadSortering)          ! Apply the reset field
  BRW2.AddField(Par:ArtikelID,BRW2.Q.Par:ArtikelID)        ! Field Par:ArtikelID is a hot field or requires assignment from browse
  BRW2.AddField(PCV:ArtikelOms,BRW2.Q.PCV:ArtikelOms)      ! Field PCV:ArtikelOms is a hot field or requires assignment from browse
  BRW2.AddField(PCV:PartijID,BRW2.Q.PCV:PartijID)          ! Field PCV:PartijID is a hot field or requires assignment from browse
  BRW2.AddField(PCV:ExternPartijnr,BRW2.Q.PCV:ExternPartijnr) ! Field PCV:ExternPartijnr is a hot field or requires assignment from browse
  BRW2.AddField(PCV:PartijVoorraadKG,BRW2.Q.PCV:PartijVoorraadKG) ! Field PCV:PartijVoorraadKG is a hot field or requires assignment from browse
  BRW2.AddField(PCV:PartijVerkochtKG,BRW2.Q.PCV:PartijVerkochtKG) ! Field PCV:PartijVerkochtKG is a hot field or requires assignment from browse
  BRW2.AddField(CEL:CelOms,BRW2.Q.CEL:CelOms)              ! Field CEL:CelOms is a hot field or requires assignment from browse
  BRW2.AddField(LOC:CelLocatieNamen,BRW2.Q.LOC:CelLocatieNamen) ! Field LOC:CelLocatieNamen is a hot field or requires assignment from browse
  BRW2.AddField(PCV:PartijCelVoorraadKG,BRW2.Q.PCV:PartijCelVoorraadKG) ! Field PCV:PartijCelVoorraadKG is a hot field or requires assignment from browse
  BRW2.AddField(PCV:PartijCelVerkochtKG,BRW2.Q.PCV:PartijCelVerkochtKG) ! Field PCV:PartijCelVerkochtKG is a hot field or requires assignment from browse
  BRW2.AddField(Par:BerekendeInkoopKGPrijs,BRW2.Q.Par:BerekendeInkoopKGPrijs) ! Field Par:BerekendeInkoopKGPrijs is a hot field or requires assignment from browse
  BRW2.AddField(Par:AanmaakDatum_DATE,BRW2.Q.Par:AanmaakDatum_DATE) ! Field Par:AanmaakDatum_DATE is a hot field or requires assignment from browse
  BRW2.AddField(Ver:VerpakkingOmschrijving,BRW2.Q.Ver:VerpakkingOmschrijving) ! Field Ver:VerpakkingOmschrijving is a hot field or requires assignment from browse
  BRW2.AddField(AREL:FirmaNaam,BRW2.Q.AREL:FirmaNaam)      ! Field AREL:FirmaNaam is a hot field or requires assignment from browse
  BRW2.AddField(PCV:PartijCelVoorraadID,BRW2.Q.PCV:PartijCelVoorraadID) ! Field PCV:PartijCelVoorraadID is a hot field or requires assignment from browse
  BRW2.AddField(PCV:CelID,BRW2.Q.PCV:CelID)                ! Field PCV:CelID is a hot field or requires assignment from browse
  BRW2.AddField(Par:PartijID,BRW2.Q.Par:PartijID)          ! Field Par:PartijID is a hot field or requires assignment from browse
  BRW2.AddField(Ver:VerpakkingID,BRW2.Q.Ver:VerpakkingID)  ! Field Ver:VerpakkingID is a hot field or requires assignment from browse
  BRW2.AddField(AREL:RelatieID,BRW2.Q.AREL:RelatieID)      ! Field AREL:RelatieID is a hot field or requires assignment from browse
  BRW2.AddField(CEL:CelID,BRW2.Q.CEL:CelID)                ! Field CEL:CelID is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface)                        ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('BrowsePartijVoorraad_WORDTNIETGEBRUIKT',QuickWindow) ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  BRW2.AddToolbarTarget(Toolbar)                           ! Browse accepts toolbar control
  SELF.SetAlerts()
  NetLocalRefreshDate = today()         ! NetTalk (NetRefresh)
  NetLocalRefreshTime = clock()
  EnterByTabManager.Init(False)
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  GLO:PartijVoorraad_ThreadID = 0
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:AACel.Close
    Relate:AViewVoorraadCelTotaal.Close
    Relate:PartijCelVoorraad.Close
    Relate:ViewPartijCelLocaties.Close
    Relate:ViewPlanningPartij.Close
    Relate:ViewPlanningPartijTotaal.Close
    Relate:ViewVoorraadPartijTotaal.Close
    Relate:ViewVoorraadPartij_INDEXED.Close
  END
  IF SELF.Opened
    INIMgr.Update('BrowsePartijVoorraad_WORDTNIETGEBRUIKT',QuickWindow) ! Save window data to non-volatile store
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
  			Message('AUB een schermprint maken en naar JMD mailen','Request = ViewRecord',ICON:Hand)
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
    CASE ACCEPTED()
    OF ?Overboeken2
      Get(BRW2.Q,Choice(?List))
      LOC:ArtikelID = CLIP(BRW2.Q.Par:ArtikelID)
      LOC:PartijCelID = CLIP(FORMAT(BRW2.Q.PCV:PartijID, @N05)) & '.' & CLIP(BRW2.Q.PCV:CelID)
      !Loc:CelLocatieID= BRW2.Q.VVPar:CelLocatieID
      Loc:CelLocatieID = 0
    OF ?WijzigLocatie
      Get(BRW2.Q,Choice(?List))
      WijzigLocatie(BRW2.Q.PCV:PartijID, BRW2.Q.PCV:CelID)
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?PartijVoorraadVerloop
      ThisWindow.Update()
      	IF CLIP(BRW2.Q.Par:ArtikelID) <> '' THEN
      		BrowseVoorraadVerloopPerPartij(CLIP(BRW2.Q.Par:ArtikelID), CLIP(BRW2.Q.PCV:PartijID))
      		ThisWindow.Reset(True)
      	ELSE
      		message('Geen voorraad-regel geselecteerd')
      	.
    OF ?Overboeken2
      ThisWindow.Update()
      GlobalRequest = InsertRecord
      UpdateOverboeking(LOC:ArtikelID, LOC:PartijCelID,Loc:CelLocatieID)
      ThisWindow.Reset
    OF ?ExtraStickers
      ThisWindow.Update()
      ! Planningrecord inlezen
      Get(BRW2.Q, Choice(?List))
      CLEAR(Par:Record)
      Par:PartijID = BRW2.Q.PCV:PartijID
      IF NOT(Access:Partij.TryFetch(Par:Partij_PK) = Level:Benign)
      	Message('Partij kan niet gevonden worden','Fout',Icon:Hand)
      	CYCLE
      END
      
      aantalpallets# = ReportPalletStickers()
    OF ?WijzigLocatie
      ThisWindow.Update()
      DO ResetBrowse
    END
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
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
  if event() = event:VisibleOnDesktop
    ds_VisibleOnDesktop()
  end
     IF KEYCODE()=CtrlShiftP AND EVENT() = Event:PreAlertKey
       CYCLE
     END
     IF KEYCODE()=CtrlShiftP  
        UD.ShowProcedureInfo('BrowsePartijVoorraad_WORDTNIETGEBRUIKT',UD.SetApplicationName('VoorrVrd','DLL'),QuickWindow{PROP:Hlp},'10/07/2011 @ 08:55AM','06/05/2020 @ 08:47PM','06/05/2020 @ 08:51PM')  
    
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
    END
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue


BRW2.Fetch PROCEDURE(BYTE Direction)

GreenBarIndex   LONG,AUTO
  CODE
  PARENT.Fetch(Direction)
  !----------------------------------------------------------------------
    LOOP GreenBarIndex=1 TO RECORDS(SELF.Q)
      GET(SELF.Q,GreenBarIndex)
      SELF.Q.Par:ArtikelID_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for Par:ArtikelID
      SELF.Q.Par:ArtikelID_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.Par:ArtikelID_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.Par:ArtikelID_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.PCV:ArtikelOms_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for PCV:ArtikelOms
      SELF.Q.PCV:ArtikelOms_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.PCV:ArtikelOms_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.PCV:ArtikelOms_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.PCV:PartijID_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for PCV:PartijID
      SELF.Q.PCV:PartijID_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.PCV:PartijID_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.PCV:PartijID_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.PCV:ExternPartijnr_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for PCV:ExternPartijnr
      SELF.Q.PCV:ExternPartijnr_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.PCV:ExternPartijnr_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.PCV:ExternPartijnr_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.PCV:PartijVoorraadKG_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for PCV:PartijVoorraadKG
      SELF.Q.PCV:PartijVoorraadKG_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.PCV:PartijVoorraadKG_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.PCV:PartijVoorraadKG_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.PCV:PartijVerkochtKG_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for PCV:PartijVerkochtKG
      SELF.Q.PCV:PartijVerkochtKG_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.PCV:PartijVerkochtKG_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.PCV:PartijVerkochtKG_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.CEL:CelOms_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for CEL:CelOms
      SELF.Q.CEL:CelOms_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.CEL:CelOms_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.CEL:CelOms_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.LOC:CelLocatieNamen_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for LOC:CelLocatieNamen
      SELF.Q.LOC:CelLocatieNamen_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.LOC:CelLocatieNamen_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.LOC:CelLocatieNamen_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.PCV:PartijCelVoorraadKG_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for PCV:PartijCelVoorraadKG
      SELF.Q.PCV:PartijCelVoorraadKG_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.PCV:PartijCelVoorraadKG_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.PCV:PartijCelVoorraadKG_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.PCV:PartijCelVerkochtKG_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for PCV:PartijCelVerkochtKG
      SELF.Q.PCV:PartijCelVerkochtKG_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.PCV:PartijCelVerkochtKG_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.PCV:PartijCelVerkochtKG_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Par:BerekendeInkoopKGPrijs_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for Par:BerekendeInkoopKGPrijs
      SELF.Q.Par:BerekendeInkoopKGPrijs_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.Par:BerekendeInkoopKGPrijs_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.Par:BerekendeInkoopKGPrijs_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Par:AanmaakDatum_DATE_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for Par:AanmaakDatum_DATE
      SELF.Q.Par:AanmaakDatum_DATE_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.Par:AanmaakDatum_DATE_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.Par:AanmaakDatum_DATE_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.Ver:VerpakkingOmschrijving_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for Ver:VerpakkingOmschrijving
      SELF.Q.Ver:VerpakkingOmschrijving_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.Ver:VerpakkingOmschrijving_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.Ver:VerpakkingOmschrijving_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      SELF.Q.AREL:FirmaNaam_NormalFG   = CHOOSE(GreenBarIndex % 2,-1,-1) ! Set color values for AREL:FirmaNaam
      SELF.Q.AREL:FirmaNaam_NormalBG   = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.AREL:FirmaNaam_SelectedFG = CHOOSE(GreenBarIndex % 2,-1,8454143)
      SELF.Q.AREL:FirmaNaam_SelectedBG = CHOOSE(GreenBarIndex % 2,-1,-1)
      PUT(SELF.Q)
    END
  !----------------------------------------------------------------------
  ! Kleuren van de cellen bij partijen ouder dan XX dagen
  LOOP GreenBarIndex=1 TO RECORDS(SELF.Q)
      GET(SELF.Q,GreenBarIndex)  
      IF SELF.Q.Par:AanmaakDatum_DATE < (TODAY() - LOC:PartijRoodkleurenNaDagen) THEN
          SELF.Q.Par:AanmaakDatum_DATE_NormalFG = Color:Black
          SELF.Q.Par:AanmaakDatum_DATE_NormalBG = Color:Red
          SELF.Q.Par:AanmaakDatum_DATE_SelectedFG = Color:Black
          SELF.Q.Par:AanmaakDatum_DATE_SelectedBG = Color:Red
          PUT(SELF.Q)
      END
  END


BRW2.ResetQueue PROCEDURE(BYTE ResetMode)

  CODE
  db.DebugOut('START DUUR PlanningVerkoop.ResetQueue')
  pre_timing# = CLOCK()
  PARENT.ResetQueue(ResetMode)
  post_timing# = CLOCK()
  db.DebugOut('METING DUUR PlanningVerkoop.ResetQueue : ' & (post_timing# - pre_timing#))


BRW2.ResetSort PROCEDURE(BYTE Force)

ReturnValue          BYTE,AUTO

  CODE
  IF CLIP(LOC:PartijVoorraadSortering) = CLIP('Op extern partijnr.')
    RETURN SELF.SetSort(1,Force)
  ELSIF CLIP(LOC:PartijVoorraadSortering) = CLIP('Op intern partijnr.')
    RETURN SELF.SetSort(2,Force)
  ELSIF CLIP(LOC:PartijVoorraadSortering) = CLIP('Op aanmaakdatum')
    RETURN SELF.SetSort(3,Force)
  ELSE
    RETURN SELF.SetSort(4,Force)
  END
  ReturnValue = PARENT.ResetSort(Force)
  RETURN ReturnValue


BRW2.SetQueueRecord PROCEDURE

  CODE
  LOC:CelLocatieNamen = CachingClass.GetCelLocatieNaam(PCV:PartijID, PCV:CelID)
  !LOC:VoorraadKG = VVParI:InslagKG - VVParI:UitslagKG
  PARENT.SetQueueRecord
  
  SELF.Q.PCV:PartijVoorraadKG_Style = 0 ! 
  SELF.Q.PCV:PartijVerkochtKG_Style = 0 ! 
  !----------------------------------------------------------------------
      SELF.Q.Par:ArtikelID_NormalFG   = CHOOSE(CHOICE(?List) % 2,-1,-1) ! Set color values for Par:ArtikelID
      SELF.Q.Par:ArtikelID_NormalBG   = CHOOSE(CHOICE(?List) % 2,-1,8454143)
      SELF.Q.Par:ArtikelID_SelectedFG = CHOOSE(CHOICE(?List) % 2,-1,8454143)
      SELF.Q.Par:ArtikelID_SelectedBG = CHOOSE(CHOICE(?List) % 2,-1,-1)
      SELF.Q.PCV:ArtikelOms_NormalFG   = CHOOSE(CHOICE(?List) % 2,-1,-1) ! Set color values for PCV:ArtikelOms
      SELF.Q.PCV:ArtikelOms_NormalBG   = CHOOSE(CHOICE(?List) % 2,-1,8454143)
      SELF.Q.PCV:ArtikelOms_SelectedFG = CHOOSE(CHOICE(?List) % 2,-1,8454143)
      SELF.Q.PCV:ArtikelOms_SelectedBG = CHOOSE(CHOICE(?List) % 2,-1,-1)
      SELF.Q.PCV:PartijID_NormalFG   = CHOOSE(CHOICE(?List) % 2,-1,-1) ! Set color values for PCV:PartijID
      SELF.Q.PCV:PartijID_NormalBG   = CHOOSE(CHOICE(?List) % 2,-1,8454143)
      SELF.Q.PCV:PartijID_SelectedFG = CHOOSE(CHOICE(?List) % 2,-1,8454143)
      SELF.Q.PCV:PartijID_SelectedBG = CHOOSE(CHOICE(?List) % 2,-1,-1)
      SELF.Q.PCV:ExternPartijnr_NormalFG   = CHOOSE(CHOICE(?List) % 2,-1,-1) ! Set color values for PCV:ExternPartijnr
      SELF.Q.PCV:ExternPartijnr_NormalBG   = CHOOSE(CHOICE(?List) % 2,-1,8454143)
      SELF.Q.PCV:ExternPartijnr_SelectedFG = CHOOSE(CHOICE(?List) % 2,-1,8454143)
      SELF.Q.PCV:ExternPartijnr_SelectedBG = CHOOSE(CHOICE(?List) % 2,-1,-1)
      SELF.Q.PCV:PartijVoorraadKG_NormalFG   = CHOOSE(CHOICE(?List) % 2,-1,-1) ! Set color values for PCV:PartijVoorraadKG
      SELF.Q.PCV:PartijVoorraadKG_NormalBG   = CHOOSE(CHOICE(?List) % 2,-1,8454143)
      SELF.Q.PCV:PartijVoorraadKG_SelectedFG = CHOOSE(CHOICE(?List) % 2,-1,8454143)
      SELF.Q.PCV:PartijVoorraadKG_SelectedBG = CHOOSE(CHOICE(?List) % 2,-1,-1)
      SELF.Q.PCV:PartijVerkochtKG_NormalFG   = CHOOSE(CHOICE(?List) % 2,-1,-1) ! Set color values for PCV:PartijVerkochtKG
      SELF.Q.PCV:PartijVerkochtKG_NormalBG   = CHOOSE(CHOICE(?List) % 2,-1,8454143)
      SELF.Q.PCV:PartijVerkochtKG_SelectedFG = CHOOSE(CHOICE(?List) % 2,-1,8454143)
      SELF.Q.PCV:PartijVerkochtKG_SelectedBG = CHOOSE(CHOICE(?List) % 2,-1,-1)
      SELF.Q.CEL:CelOms_NormalFG   = CHOOSE(CHOICE(?List) % 2,-1,-1) ! Set color values for CEL:CelOms
      SELF.Q.CEL:CelOms_NormalBG   = CHOOSE(CHOICE(?List) % 2,-1,8454143)
      SELF.Q.CEL:CelOms_SelectedFG = CHOOSE(CHOICE(?List) % 2,-1,8454143)
      SELF.Q.CEL:CelOms_SelectedBG = CHOOSE(CHOICE(?List) % 2,-1,-1)
      SELF.Q.LOC:CelLocatieNamen_NormalFG   = CHOOSE(CHOICE(?List) % 2,-1,-1) ! Set color values for LOC:CelLocatieNamen
      SELF.Q.LOC:CelLocatieNamen_NormalBG   = CHOOSE(CHOICE(?List) % 2,-1,8454143)
      SELF.Q.LOC:CelLocatieNamen_SelectedFG = CHOOSE(CHOICE(?List) % 2,-1,8454143)
      SELF.Q.LOC:CelLocatieNamen_SelectedBG = CHOOSE(CHOICE(?List) % 2,-1,-1)
      SELF.Q.PCV:PartijCelVoorraadKG_NormalFG   = CHOOSE(CHOICE(?List) % 2,-1,-1) ! Set color values for PCV:PartijCelVoorraadKG
      SELF.Q.PCV:PartijCelVoorraadKG_NormalBG   = CHOOSE(CHOICE(?List) % 2,-1,8454143)
      SELF.Q.PCV:PartijCelVoorraadKG_SelectedFG = CHOOSE(CHOICE(?List) % 2,-1,8454143)
      SELF.Q.PCV:PartijCelVoorraadKG_SelectedBG = CHOOSE(CHOICE(?List) % 2,-1,-1)
      SELF.Q.PCV:PartijCelVerkochtKG_NormalFG   = CHOOSE(CHOICE(?List) % 2,-1,-1) ! Set color values for PCV:PartijCelVerkochtKG
      SELF.Q.PCV:PartijCelVerkochtKG_NormalBG   = CHOOSE(CHOICE(?List) % 2,-1,8454143)
      SELF.Q.PCV:PartijCelVerkochtKG_SelectedFG = CHOOSE(CHOICE(?List) % 2,-1,8454143)
      SELF.Q.PCV:PartijCelVerkochtKG_SelectedBG = CHOOSE(CHOICE(?List) % 2,-1,-1)
      SELF.Q.Par:BerekendeInkoopKGPrijs_NormalFG   = CHOOSE(CHOICE(?List) % 2,-1,-1) ! Set color values for Par:BerekendeInkoopKGPrijs
      SELF.Q.Par:BerekendeInkoopKGPrijs_NormalBG   = CHOOSE(CHOICE(?List) % 2,-1,8454143)
      SELF.Q.Par:BerekendeInkoopKGPrijs_SelectedFG = CHOOSE(CHOICE(?List) % 2,-1,8454143)
      SELF.Q.Par:BerekendeInkoopKGPrijs_SelectedBG = CHOOSE(CHOICE(?List) % 2,-1,-1)
      SELF.Q.Par:AanmaakDatum_DATE_NormalFG   = CHOOSE(CHOICE(?List) % 2,-1,-1) ! Set color values for Par:AanmaakDatum_DATE
      SELF.Q.Par:AanmaakDatum_DATE_NormalBG   = CHOOSE(CHOICE(?List) % 2,-1,8454143)
      SELF.Q.Par:AanmaakDatum_DATE_SelectedFG = CHOOSE(CHOICE(?List) % 2,-1,8454143)
      SELF.Q.Par:AanmaakDatum_DATE_SelectedBG = CHOOSE(CHOICE(?List) % 2,-1,-1)
      SELF.Q.Ver:VerpakkingOmschrijving_NormalFG   = CHOOSE(CHOICE(?List) % 2,-1,-1) ! Set color values for Ver:VerpakkingOmschrijving
      SELF.Q.Ver:VerpakkingOmschrijving_NormalBG   = CHOOSE(CHOICE(?List) % 2,-1,8454143)
      SELF.Q.Ver:VerpakkingOmschrijving_SelectedFG = CHOOSE(CHOICE(?List) % 2,-1,8454143)
      SELF.Q.Ver:VerpakkingOmschrijving_SelectedBG = CHOOSE(CHOICE(?List) % 2,-1,-1)
      SELF.Q.AREL:FirmaNaam_NormalFG   = CHOOSE(CHOICE(?List) % 2,-1,-1) ! Set color values for AREL:FirmaNaam
      SELF.Q.AREL:FirmaNaam_NormalBG   = CHOOSE(CHOICE(?List) % 2,-1,8454143)
      SELF.Q.AREL:FirmaNaam_SelectedFG = CHOOSE(CHOICE(?List) % 2,-1,8454143)
      SELF.Q.AREL:FirmaNaam_SelectedBG = CHOOSE(CHOICE(?List) % 2,-1,-1)
  !----------------------------------------------------------------------


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window
  SELF.SetStrategy(?PartijVoorraadVerloop, Resize:FixLeft+Resize:FixTop, Resize:LockSize) ! Override strategy for ?PartijVoorraadVerloop
  SELF.SetStrategy(?Overboeken2, Resize:FixLeft+Resize:FixTop, Resize:LockSize) ! Override strategy for ?Overboeken2
  SELF.SetStrategy(?ExtraStickers, Resize:FixLeft+Resize:FixTop, Resize:LockSize) ! Override strategy for ?ExtraStickers
  SELF.SetStrategy(?WijzigLocatie, Resize:FixLeft+Resize:FixTop, Resize:LockSize) ! Override strategy for ?WijzigLocatie
  SELF.SetStrategy(?ZoekPrompt, Resize:FixRight+Resize:FixTop, Resize:LockSize) ! Override strategy for ?ZoekPrompt
  SELF.SetStrategy(?LOC:ZoekVak, Resize:FixRight+Resize:FixTop, Resize:LockSize) ! Override strategy for ?LOC:ZoekVak
  SELF.SetStrategy(?LOC:PartijVoorraadSortering:Prompt, Resize:FixRight+Resize:FixTop, Resize:LockSize) ! Override strategy for ?LOC:PartijVoorraadSortering:Prompt
  SELF.SetStrategy(?LOC:PartijVoorraadSortering, Resize:FixRight+Resize:FixTop, Resize:LockSize) ! Override strategy for ?LOC:PartijVoorraadSortering
  SELF.SetStrategy(?List, Resize:FixLeft+Resize:FixTop, Resize:ConstantRight+Resize:ConstantBottom) ! Override strategy for ?List

