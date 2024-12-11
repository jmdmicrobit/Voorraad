

   MEMBER('Voorraad.clw')                                  ! This is a MEMBER module

                     MAP
                       INCLUDE('VOORRAAD004.INC'),ONCE        !Local module procedure declarations
                     END


!!! <summary>
!!! Generated from procedure template - Source
!!! </summary>
SourceCheckVersie    PROCEDURE                             ! Declare Procedure
udpt            UltimateDebugProcedureTracker
LOC:ToonWijziging    BYTE                                  ! 
SQLCommando         CSTRING(65000)
Loc:Versie			DECIMAL(7,2)
LocalClass          CLASS
SchrijfVersie           PROCEDURE(Real,String)
ExecuteSQLCommando      PROCEDURE(String)
                    End

!SQLCommando         CSTRING(650000)

st                  StringTheory
FilesOpened     BYTE(0)

  CODE
? DEBUGHOOK(Versie:Record)
        udpt.Init(UD,'SourceCheckVersie','Voorraad004.clw','Voorraad.EXE','06/28/2024 @ 12:06PM')    
             
    GLO:Versie = 3.40
!    IF GLO:Versie <= 3.22                   ! spelvouten....
!        Glo:Owner=GETINI('SQL','OWNER','172.16.0.7\MS$DPM2007$,Voorraad,jmd,superjmd','.\vooraad.ini')&';APP=JMDVoorraad v'&Glo:Versie&';WSID='&GETUSERNAME()
!    ELSE    
!        Glo:Owner=GETINI('SQL','OWNER','172.16.0.7\MS$DPM2007$,Voorraad,jmd,superjmd','.\voorraad.ini')&';APP=JMDVoorraad v'&Glo:Versie&';WSID='&GETUSERNAME()
!    END
	! door de versienummers lopen dan bepalen we eerst de laatst geinstalleerde versie
	!Relate:Versie.Open()            ! access naar Relate aangepast 2019-6-19 ivm sql foutmeldinden
    DO OpenFiles
	SQLCOMMANDO='SELECT TOP 1 VERSIE FROM VERSIE ORDER BY VERSIE DESC'
	Versie{Prop:SQL}=SQLCOMMANDO
	Access:Versie.Next()

	IF VRS:Versie = 0 THEN
        VRS:Versie = 1.38 ! Laatste versie zonder versie-controle
    ELSE 
        Loc:Versie=VRS:Versie
	END
		
	Loop while Loc:Versie < GLO:Versie
		UD.Debug('Versie bijwerken ' & LOC:Versie)
		LOC:ToonWijziging = false
		Loc:Versie += 0.01
		Case Loc:Versie
    of 3.40 ! 2024-6-28                 Weging uitbreiden met Producte, THT en Harvast date 
        LocalClass.ExecuteSQLCommando('ALTER TABLE dbo.Weging Add ProductionDate DateTime, THTDate DateTime, HarvastDate DateTime')

        LocalClass.SchrijfVersie(Loc:Versie,'Weging uitbreiden met Producte, THT en Harvast date ')
            
    of 3.39 ! 2024-2-1                  Filter Exclude bij rapporteren
        LocalClass.ExecuteSQLCommando('ALTER TABLE dbo.Rapporten Add FilterExclude varchar(4000), FilterDatum DateTime')

        LocalClass.SchrijfVersie(Loc:Versie,'Filter exclude bij Rapporten')
            
    of 3.38 ! 2023-2-21                  Inactief bij Relatie en Gebruiker
        LocalClass.ExecuteSQLCommando('ALTER TABLE dbo.Gebruiker Add NietActief bit')
        LocalClass.ExecuteSQLCommando('UPDATE dbo.Gebruiker Set NietActief=<39>False<39>')
        LocalClass.ExecuteSQLCommando('ALTER TABLE dbo.Relatie_SyncExact Add NietActief bit')
        LocalClass.ExecuteSQLCommando('UPDATE dbo.Relatie_SyncExact Set NietActief=<39>False<39>')

        LocalClass.SchrijfVersie(Loc:Versie,'Inactief bij Relatie en Gebruiker')
            
    of 3.37 ! 2022-1-27                  Blokkade Partij
        LocalClass.ExecuteSQLCommando('ALTER TABLE dbo.Partij Add Blokkade DateTime, deBlokkade DateTime')


    LocalClass.ExecuteSQLCommando('IF EXISTS(SELECT * FROM sys.objects WHERE Name = <39>ViewVoorraadPartij<39> AND Type=<39>V<39>) BEGIN '& |
            ' DROP VIEW [dbo].[ViewVoorraadPartij]  ; '&|
            ' END;')
			
			 LocalClass.ExecuteSQLCommando('CREATE VIEW [dbo].[ViewVoorraadPartij] ' & |
            'AS ' & |
            'SELECT     TOP (100) PERCENT dbo.Partij.PartijID, dbo.Partij.ArtikelID, dbo.Artikel_SyncExact.ArtikelOms, dbo.Mutatie.CelID, dbo.Partij.ExternPartijnr, dbo.Partij.AanmaakDatum, ' & |
            '                      dbo.Cel.CelOms, dbo.Verpakking.VerpakkingID, dbo.Verpakking.VerpakkingOmschrijving, dbo.Relatie_SyncExact.FirmaNaam AS LeverancierFirmanaam, ' & |
            '                      SUM(ISNULL(dbo.Mutatie.InslagKG, 0)) AS InslagKG, SUM(ISNULL(dbo.Mutatie.InslagPallet, 0)) AS InslagPallets, SUM(ISNULL(dbo.Mutatie.UitslagKG, 0)) AS UitslagKG, ' & |
            '                       SUM(ISNULL(dbo.Mutatie.UitslagPallet, 0)) AS UitslagPallets, SUM(ISNULL(dbo.Mutatie.InslagKG, 0)) - SUM(ISNULL(dbo.Mutatie.UitslagKG, 0)) AS VoorraadKG, ' & |
            '                      SUM(ISNULL(dbo.Mutatie.InslagPallet, 0)) - SUM(ISNULL(dbo.Mutatie.UitslagPallet, 0)) AS VoorraadPallets, RIGHT(''00000'' + CAST(dbo.Partij.PartijID AS varchar), 5) ' & |
            '                      + ''.'' + CAST(dbo.Mutatie.CelID AS VARCHAR) AS PartijCelID, 0 AS CelLocatieID, '''' AS Locatienaam, dbo.Partij.BerekendeInkoopKGPrijs ' & |
            '                      , dbo.Partij.Blokkade, dbo.Partij.deBlokkade  ' & |
            'FROM         dbo.Partij INNER JOIN ' & |
            '                      dbo.Artikel_SyncExact ON dbo.Partij.ArtikelID = dbo.Artikel_SyncExact.ArtikelID INNER JOIN ' & |
            '                      dbo.Mutatie ON dbo.Partij.PartijID = dbo.Mutatie.PartijID AND dbo.Partij.ArtikelID = dbo.Mutatie.ArtikelID LEFT OUTER JOIN ' & |
            '                      dbo.Cel ON dbo.Mutatie.CelID = dbo.Cel.Celid LEFT OUTER JOIN ' & |
            '                      dbo.Verpakking ON dbo.Partij.VerpakkingID = dbo.Verpakking.VerpakkingID LEFT OUTER JOIN ' & |
            '                      dbo.Relatie_SyncExact ON dbo.Partij.Leverancier = dbo.Relatie_SyncExact.RelatieID ' & |
            'GROUP BY dbo.Partij.PartijID, dbo.Partij.ArtikelID, dbo.Artikel_SyncExact.ArtikelOms, dbo.Mutatie.CelID, dbo.Partij.ExternPartijnr, dbo.Partij.AanmaakDatum, dbo.Partij.Blokkade, dbo.Partij.deBlokkade, dbo.Cel.CelOms, ' & |
            '                      dbo.Verpakking.VerpakkingID, dbo.Verpakking.VerpakkingOmschrijving, dbo.Relatie_SyncExact.FirmaNaam, dbo.Partij.BerekendeInkoopKGPrijs ' & |
            'ORDER BY dbo.Partij.ArtikelID, dbo.Partij.PartijID, dbo.Mutatie.CelID ')







        LocalClass.SchrijfVersie(Loc:Versie,'Blokkade en deBlokkade aan Partij toegevoegd')
            
    of 3.36 ! 2021-9-2                  Boeken RefreshTijdslot 
        LocalClass.ExecuteSQLCommando('IF EXISTS(SELECT * FROM sys.objects WHERE Name = <39>RefreshTijdSlot<39> AND Type=<39>U<39>) BEGIN '& |
            ' DROP TABLE [dbo].[RefreshTijdSlot]  ; '&|
            ' END;')
        LocalClass.ExecuteSQLCommando('CREATE TABLE dbo.RefreshTijdSlot('&|
            'Programma varchar(100) NOT NULL ,'&|
            'Werkstation VARCHAR(100) NOT NULL ,'&|            
            'Requested DateTime, '&|            
            'TijdSlot Int, '&|            
            'Booked DateTime, '&|            
            'Pulse DateTime, '&|            
            'Stopped DateTime '&|            
            ' CONSTRAINT [RefreshTijdSlot_PK] PRIMARY KEY CLUSTERED '&|
            '( '&|
            '	[Programma] ASC, '&|
            '	[Werkstation] ASC '&|
            ')WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY] '&|
            ') ON [PRIMARY]')

            LocalClass.SchrijfVersie(Loc:Versie,'RefreshTijdSlot tabel toegevoegd')
            
    of 3.35 ! 2021-6-4
        LocalClass.ExecuteSQLCommando('DROP VIEW [dbo].[ViewVoorraadPartij_INDEXED]')
        LocalClass.ExecuteSQLCommando('CREATE VIEW [dbo].[ViewVoorraadPartij_INDEXED] ' & |
    'AS ' & |
            'SELECT     dbo.Partij.PartijID, dbo.Partij.ArtikelID, (select dbo.Artikel_SyncExact.ArtikelOms from dbo.Artikel_SyncExact where dbo.Artikel_SyncExact.ArtikelID = dbo.Partij.ArtikelID ) AS ArtikelOms, '&|
            ' dbo.Mutatie.CelID, dbo.Partij.ExternPartijnr, dbo.Partij.AanmaakDatum, ' & |
            '(select dbo.Cel.CelOms from dbo.Cel where dbo.Mutatie.CelID = dbo.Cel.Celid) AS  CelOms, '&|
            ' dbo.Partij.VerpakkingID, '&|
            ' (select dbo.Verpakking.VerpakkingOmschrijving from dbo.Verpakking where dbo.Partij.VerpakkingID = dbo.Verpakking.VerpakkingID) AS VerpakkingOmschrijving, ' & |
    '                      CAST(dbo.Relatie_SyncExact.FirmaNaam + '' ''+ ISNULL(dbo.RelatieAdres.Adres1,'''') AS varchar(50)) AS LeverancierFirmaNaam, ' & |
    '  SUM(ISNULL(dbo.Mutatie.InslagKG, 0)) AS InslagKG, ' & |
    '                      SUM(ISNULL(dbo.Mutatie.InslagPallet, 0)) AS InslagPallets, SUM(ISNULL(dbo.Mutatie.UitslagKG, 0)) AS UitslagKG, ' & |
    '                      SUM(ISNULL(dbo.Mutatie.UitslagPallet, 0)) AS UitslagPallets, dbo.Partij.BerekendeInkoopKGPrijs, COUNT_BIG(*) AS CountBig ' & |
    'FROM         dbo.Partij ' & |
    ' LEFT OUTER JOIN dbo.Relatie_SyncExact ON dbo.Relatie_SyncExact.RelatieID = dbo.Partij.Leverancier INNER JOIN ' & |
    '                      dbo.Mutatie ON dbo.Partij.PartijID = dbo.Mutatie.PartijID AND dbo.Partij.ArtikelID = dbo.Mutatie.ArtikelID ' & |
    '  LEFT JOIN dbo.Inkoop ON dbo.Inkoop.InkoopID = dbo.Partij.InkoopID ' & |
    '  LEFT JOIN dbo.RelatieAdres ON dbo.RelatieAdres.ID = dbo.Inkoop.LeverancierAlternatiefAdres ' & |
    'GROUP BY dbo.Partij.PartijID, dbo.Partij.ArtikelID, dbo.Mutatie.CelID, dbo.Partij.ExternPartijnr, dbo.Partij.AanmaakDatum, ' & |
    '                      dbo.Partij.VerpakkingID, dbo.Relatie_SyncExact.FirmaNaam, dbo.RelatieAdres.Adres1, ' & |
    '                      dbo.Partij.BerekendeInkoopKGPrijs ')
    

            LocalClass.SchrijfVersie(Loc:Versie,'ViewVoorraadPartij_INDEXED geoptimaliseerd')
            
of 3.34             ! 2021-5-31
    Clear(VRS:Record)
    VRS:Versie=Loc:Versie
    If Access:Versie.Fetch(VRS:Versie_PK)
        LocalClass.ExecuteSQLCommando('DROP INDEX [Verkoop_FK3] ON [dbo].[Verkoop]')
        
        LocalClass.ExecuteSQLCommando('CREATE NONCLUSTERED INDEX [Verkoop_FK3] ON [dbo].[Verkoop] '&|
            '('&|
	        '[Exported] ASC,'&|
	        '[Klant] ASC, '&|
	        '[Planning] DESC '&|
            ')WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]')

        LocalClass.ExecuteSQLCommando('ALTER TABLE Inkoop ADD Valuta varchar(50), Koersverschil Decimal(11,3)')

        VRS:Versie = Loc:Versie
        VRS:DatumTijd_DATE = Today()
        VRS:DatumTijd_TIME = Clock()
        VRS:Wijzigingen= 'Verkoop Index op Export/klant aangepast '
        Access:Versie.Insert()
        LOC:ToonWijziging = false
    End


    of 3.33 ! 28-05-2021
    Clear(VRS:Record)
    VRS:Versie=Loc:Versie
    if Access:Versie.Fetch(VRS:Versie_PK)
        LocalClass.ExecuteSQLCommando('ALTER TABLE Cel ADD Volgnr int')
        
        LocalClass.ExecuteSQLCommando('UPDATE Cel Set Volgnr = 100')
            
        LocalClass.ExecuteSQLCommando('CREATE UNIQUE INDEX [Cel_FK1] ON [dbo].[Cel] '&|
            '('&|
            '[Volgnr] ASC, '&|
            '[CelID] ASC '&|
            ')WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]')

        LocalClass.SchrijfVersie(Loc:Versie,'Volgnr toegevoegd aan Cel ')   

        LOC:ToonWijziging = false
    End
                        
    of 3.32 ! 15-3-2021
    Clear(VRS:Record)
    VRS:Versie=Loc:Versie
    if Access:Versie.Fetch(VRS:Versie_PK)
        LocalClass.ExecuteSQLCommando('ALTER TABLE CMR ADD ProductLabelsOnGoods tinyint')
        LocalClass.SchrijfVersie(Loc:Versie,'ProductLabels on goods toegevoegd')   

        LOC:ToonWijziging = false
    End
                    
!    of 3.31 ! 23-09-2020
!    De VIew aanpassing via SQL managementStudio uitgevoerd, heeft geen Database impact
!
!/****** Object:  View [dbo].[ViewVoorraadPartij_INDEXED]    Script Date: 23-9-2020 09:34:49 ******/
!DROP VIEW [dbo].[ViewVoorraadPartij_INDEXED]
!GO
!
!/****** Object:  View [dbo].[ViewVoorraadPartij_INDEXED]    Script Date: 23-9-2020 09:49:09 ******/
!SET ANSI_NULLS ON
!GO
!
!SET QUOTED_IDENTIFIER ON
!GO
!
!CREATE VIEW [dbo].[ViewVoorraadPartij_INDEXED]
!AS
!SELECT     dbo.Partij.PartijID, dbo.Partij.ArtikelID, dbo.Artikel_SyncExact.ArtikelOms, dbo.Mutatie.CelID, dbo.Partij.ExternPartijnr, dbo.Partij.AanmaakDatum, 
!                      dbo.Cel.CelOms, dbo.Verpakking.VerpakkingID, dbo.Verpakking.VerpakkingOmschrijving, 
!                      CAST(dbo.Relatie_SyncExact.FirmaNaam + ' '+ ISNULL(dbo.RelatieAdres.Adres1,'') AS varchar(50)) AS LeverancierFirmaNaam, 
!					  SUM(ISNULL(dbo.Mutatie.InslagKG, 0)) AS InslagKG, 
!                      SUM(ISNULL(dbo.Mutatie.InslagPallet, 0)) AS InslagPallets, SUM(ISNULL(dbo.Mutatie.UitslagKG, 0)) AS UitslagKG, 
!                      SUM(ISNULL(dbo.Mutatie.UitslagPallet, 0)) AS UitslagPallets, dbo.Partij.BerekendeInkoopKGPrijs, COUNT_BIG(*) AS CountBig
!FROM         dbo.Partij INNER JOIN
!                      dbo.Artikel_SyncExact ON dbo.Artikel_SyncExact.ArtikelID = dbo.Partij.ArtikelID LEFT OUTER JOIN
!                      dbo.Relatie_SyncExact ON dbo.Relatie_SyncExact.RelatieID = dbo.Partij.Leverancier INNER JOIN
!                      dbo.Mutatie ON dbo.Partij.PartijID = dbo.Mutatie.PartijID AND dbo.Partij.ArtikelID = dbo.Mutatie.ArtikelID INNER JOIN
!                      dbo.Cel ON dbo.Mutatie.CelID = dbo.Cel.Celid INNER JOIN
!                      dbo.Verpakking ON dbo.Partij.VerpakkingID = dbo.Verpakking.VerpakkingID
!					  LEFT JOIN dbo.Inkoop ON dbo.Inkoop.InkoopID = dbo.Partij.InkoopID
!					  LEFT JOIN dbo.RelatieAdres ON dbo.RelatieAdres.ID = dbo.Inkoop.LeverancierAlternatiefAdres
!GROUP BY dbo.Partij.PartijID, dbo.Partij.ArtikelID, dbo.Artikel_SyncExact.ArtikelOms, dbo.Mutatie.CelID, dbo.Partij.ExternPartijnr, dbo.Partij.AanmaakDatum, 
!                      dbo.Cel.CelOms, dbo.Verpakking.VerpakkingID, dbo.Verpakking.VerpakkingOmschrijving, dbo.Relatie_SyncExact.FirmaNaam, dbo.RelatieAdres.Adres1,
!                      dbo.Partij.BerekendeInkoopKGPrijs
!GO
!
!

 
    of 3.31 ! 12-06-2020
    Clear(VRS:Record)
    VRS:Versie=Loc:Versie
    if Access:Versie.Fetch(VRS:Versie_PK)
        LocalClass.ExecuteSQLCommando('ALTER TABLE GEBRUIKER ADD GeenToegang tinyint')
        LocalClass.SchrijfVersie(Loc:Versie,'GeenToegang aand gebruiker toegevoegd')   

        LOC:ToonWijziging = false
    End
                    
    of 3.30 ! 05-06-2020
    Clear(VRS:Record)
    VRS:Versie=Loc:Versie
    if Access:Versie.Fetch(VRS:Versie_PK)
        LocalClass.ExecuteSQLCommando('IF EXISTS(SELECT * FROM sys.objects WHERE Name = <39>ViewArtikel<39> AND Type=<39>V<39>) BEGIN '& |
            ' DROP VIEW [dbo].[ViewArtikel]  ; '&|
            ' END;')
        LocalClass.ExecuteSQLCommando('IF EXISTS(SELECT * FROM sys.objects WHERE Name = <39>ViewRelatie<39> AND Type=<39>V<39>) BEGIN '& |
            ' DROP VIEW [dbo].[ViewRelatie]  ; '&|
            ' END;')
        LocalClass.ExecuteSQLCommando('IF EXISTS(SELECT * FROM sys.objects WHERE Name = <39>PalletVerloopGeenTotaals_OUD<39> AND Type=<39>V<39>) BEGIN '& |
            ' DROP VIEW [dbo].[PalletVerloopGeenTotaals_OUD]  ; '&|
            ' END;')
        LocalClass.ExecuteSQLCommando('IF EXISTS(SELECT * FROM sys.objects WHERE Name = <39>ViewPlanningPartij_OUD<39> AND Type=<39>V<39>) BEGIN '& |
            ' DROP VIEW [dbo].[ViewPlanningPartij_OUD]  ; '&|
            ' END;')
        LocalClass.ExecuteSQLCommando('IF EXISTS(SELECT * FROM sys.objects WHERE Name = <39>ViewVoorraadPartij_OUD<39> AND Type=<39>V<39>) BEGIN '& |
            ' DROP VIEW [dbo].[ViewVoorraadPartij_OUD]  ; '&|
            ' END;')
 
        LocalClass.ExecuteSQLCommando('IF EXISTS(SELECT * FROM sys.objects WHERE Name = <39>ViewVoorraadPartij<39> AND Type=<39>V<39>) BEGIN '& |
            ' DROP VIEW [dbo].[ViewVoorraadPartij]  ; '&|
            ' END;')
        LocalClass.ExecuteSQLCommando('CREATE VIEW [dbo].[ViewVoorraadPartij] ' & |
            'AS ' & |
            'SELECT     TOP (100) PERCENT dbo.Partij.PartijID, dbo.Partij.ArtikelID, dbo.Artikel_SyncExact.ArtikelOms, dbo.Mutatie.CelID, dbo.Partij.ExternPartijnr, dbo.Partij.AanmaakDatum, ' & |
            '                      dbo.Cel.CelOms, dbo.Verpakking.VerpakkingID, dbo.Verpakking.VerpakkingOmschrijving, dbo.Relatie_SyncExact.FirmaNaam AS LeverancierFirmanaam, ' & |
            '                      SUM(ISNULL(dbo.Mutatie.InslagKG, 0)) AS InslagKG, SUM(ISNULL(dbo.Mutatie.InslagPallet, 0)) AS InslagPallets, SUM(ISNULL(dbo.Mutatie.UitslagKG, 0)) AS UitslagKG, ' & |
            '                       SUM(ISNULL(dbo.Mutatie.UitslagPallet, 0)) AS UitslagPallets, SUM(ISNULL(dbo.Mutatie.InslagKG, 0)) - SUM(ISNULL(dbo.Mutatie.UitslagKG, 0)) AS VoorraadKG, ' & |
            '                      SUM(ISNULL(dbo.Mutatie.InslagPallet, 0)) - SUM(ISNULL(dbo.Mutatie.UitslagPallet, 0)) AS VoorraadPallets, RIGHT(''00000'' + CAST(dbo.Partij.PartijID AS varchar), 5) ' & |
            '                      + ''.'' + CAST(dbo.Mutatie.CelID AS VARCHAR) AS PartijCelID, 0 AS CelLocatieID, '''' AS Locatienaam, dbo.Partij.BerekendeInkoopKGPrijs ' & |
            'FROM         dbo.Partij INNER JOIN ' & |
            '                      dbo.Artikel_SyncExact ON dbo.Partij.ArtikelID = dbo.Artikel_SyncExact.ArtikelID INNER JOIN ' & |
            '                      dbo.Mutatie ON dbo.Partij.PartijID = dbo.Mutatie.PartijID AND dbo.Partij.ArtikelID = dbo.Mutatie.ArtikelID LEFT OUTER JOIN ' & |
            '                      dbo.Cel ON dbo.Mutatie.CelID = dbo.Cel.Celid LEFT OUTER JOIN ' & |
            '                      dbo.Verpakking ON dbo.Partij.VerpakkingID = dbo.Verpakking.VerpakkingID LEFT OUTER JOIN ' & |
            '                      dbo.Relatie_SyncExact ON dbo.Partij.Leverancier = dbo.Relatie_SyncExact.RelatieID ' & |
            'GROUP BY dbo.Partij.PartijID, dbo.Partij.ArtikelID, dbo.Artikel_SyncExact.ArtikelOms, dbo.Mutatie.CelID, dbo.Partij.ExternPartijnr, dbo.Partij.AanmaakDatum, dbo.Cel.CelOms, ' & |
            '                      dbo.Verpakking.VerpakkingID, dbo.Verpakking.VerpakkingOmschrijving, dbo.Relatie_SyncExact.FirmaNaam, dbo.Partij.BerekendeInkoopKGPrijs ' & |
            'ORDER BY dbo.Partij.ArtikelID, dbo.Partij.PartijID, dbo.Mutatie.CelID ')

        LocalClass.ExecuteSQLCommando('IF EXISTS(SELECT * FROM sys.objects WHERE Name = <39>PlanningInkoop<39> AND Type=<39>V<39>) BEGIN '& |
            ' DROP VIEW [dbo].[PlanningInkoop]  ; '&|
            ' END;')
            
        LocalClass.ExecuteSQLCommando('CREATE VIEW [dbo].[PlanningInkoop] ' & |
            'AS ' & |
            'SELECT     dbo.Planning.PlanningID, dbo.Inkoop.Leverancier, dbo.Planning.ArtikelID, dbo.Planning.KG, dbo.Planning.MutatieKG, dbo.Planning.MutatiePallets, ' & |
            '                      dbo.Planning.Pallets, dbo.Planning.Transport, dbo.Planning.Geprint, dbo.Planning.MutatieGemaakt, dbo.Planning.Verwerkt, dbo.Planning.Memo, ' & |
            '                      dbo.Planning.InkoopID, dbo.Planning.Instructie, dbo.Inkoop.Planning, dbo.Relatie_SyncExact.FirmaNaam, dbo.Cel.Celid, dbo.Cel.CelOms, dbo.Partij.PartijID, ' & |
            '                      dbo.Partij.ExternPartijnr, dbo.Artikel_SyncExact.ArtikelOms, dbo.Verpakking.VerpakkingID, dbo.Verpakking.VerpakkingOmschrijving, dbo.Planning.Gewogen, ' & |
            '                      dbo.Planning.CelLocatieID, dbo.CelLocatie.Locatienaam ' & |
            'FROM         dbo.Planning INNER JOIN ' & |
            '                      dbo.Inkoop ON dbo.Planning.InkoopID = dbo.Inkoop.InkoopID INNER JOIN ' & |
            '                      dbo.Relatie_SyncExact ON dbo.Inkoop.Leverancier = dbo.Relatie_SyncExact.RelatieID LEFT OUTER JOIN ' & |
            '                      dbo.CelLocatie ON dbo.Planning.CelLocatieID = dbo.CelLocatie.CelLocatieID LEFT OUTER JOIN ' & |
            '                      dbo.Artikel_SyncExact ON dbo.Artikel_SyncExact.ArtikelID = dbo.Planning.ArtikelID LEFT OUTER JOIN ' & |
            '                      dbo.Verpakking ON dbo.Verpakking.VerpakkingID = dbo.Planning.VerpakkingID LEFT OUTER JOIN ' & |
            '                      dbo.Partij ON dbo.Planning.PartijID = dbo.Partij.PartijID LEFT OUTER JOIN ' & |
            '                      dbo.Cel ON dbo.Planning.CelID = dbo.Cel.Celid ' & |
            'WHERE     (dbo.Planning.InkoopID > 0) AND (dbo.Inkoop.Leverancier > 0) ')
            
        LocalClass.ExecuteSQLCommando('IF EXISTS(SELECT * FROM sys.objects WHERE Name = <39>ViewPlanningPartij<39> AND Type=<39>V<39>) BEGIN '& |
            ' DROP VIEW [dbo].[ViewPlanningPartij]  ; '&|
            ' END;')
            
        LocalClass.ExecuteSQLCommando('CREATE VIEW [dbo].[ViewPlanningPartij] ' & |
            'AS ' & |
            'SELECT     TOP (100) PERCENT dbo.Partij.PartijID, dbo.Partij.ArtikelID, dbo.Artikel_SyncExact.ArtikelOms, dbo.Planning.CelID, dbo.Partij.ExternPartijnr, dbo.Partij.AanmaakDatum, ' & |
            '                      dbo.Cel.CelOms, dbo.Verpakking.VerpakkingOmschrijving, dbo.Relatie_SyncExact.FirmaNaam AS LeverancierFirmanaam, SUM(ISNULL(dbo.Planning.KG, 0)) AS VerkoopKG, ' & |
            '                      SUM(ISNULL(dbo.Planning.Pallets, 0)) AS VerkoopPallets, RIGHT(''00000'' + CAST(dbo.Partij.PartijID AS varchar), 5) + ''.'' + CAST(dbo.Planning.CelID AS VARCHAR) ' & |
            '                      AS PartijCelID ' & |
            'FROM         dbo.Partij INNER JOIN ' & |
            '                      dbo.Artikel_SyncExact ON dbo.Partij.ArtikelID = dbo.Artikel_SyncExact.ArtikelID INNER JOIN ' & |
            '                      dbo.Planning ON dbo.Planning.VerkoopID > 0 AND dbo.Planning.MutatieGemaakt = 0 AND dbo.Planning.Verwerkt = 0 AND dbo.Partij.PartijID = dbo.Planning.PartijID AND ' & |
            '                       dbo.Partij.ArtikelID = dbo.Planning.ArtikelID LEFT OUTER JOIN ' & |
            '                      dbo.Cel ON dbo.Planning.CelID = dbo.Cel.Celid LEFT OUTER JOIN ' & |
            '                      dbo.Verpakking ON dbo.Partij.VerpakkingID = dbo.Verpakking.VerpakkingID LEFT OUTER JOIN ' & |
            '                      dbo.Relatie_SyncExact ON dbo.Partij.Leverancier = dbo.Relatie_SyncExact.RelatieID ' & |
            'GROUP BY dbo.Partij.PartijID, dbo.Partij.ArtikelID, dbo.Artikel_SyncExact.ArtikelOms, dbo.Planning.CelID, dbo.Partij.ExternPartijnr, dbo.Partij.AanmaakDatum, dbo.Cel.CelOms, ' & |
            '                      dbo.Verpakking.VerpakkingOmschrijving, dbo.Relatie_SyncExact.FirmaNaam ' & |
            'ORDER BY dbo.Partij.ArtikelID, dbo.Partij.PartijID, dbo.Planning.CelID')
            
        LocalClass.ExecuteSQLCommando('IF EXISTS(SELECT * FROM sys.objects WHERE Name = <39>ViewVoorraadPartijTotaal<39> AND Type=<39>V<39>) BEGIN '& |
            ' DROP VIEW [dbo].[ViewVoorraadPartijTotaal]  ; '&|
            ' END;')
        LocalClass.ExecuteSQLCommando('CREATE VIEW [dbo].[ViewVoorraadPartijTotaal] ' & |
            'AS ' & |
            'SELECT     TOP (100) PERCENT dbo.Partij.PartijID, dbo.Partij.ArtikelID, dbo.Artikel_SyncExact.ArtikelOms, dbo.Partij.ExternPartijnr, dbo.Partij.AanmaakDatum, ' & |
            '                      dbo.Verpakking.VerpakkingID, dbo.Verpakking.VerpakkingOmschrijving, dbo.Relatie_SyncExact.FirmaNaam AS LeverancierFirmanaam, ' & |
            '                      SUM(ISNULL(dbo.Mutatie.InslagKG, 0)) AS InslagKG, SUM(ISNULL(dbo.Mutatie.InslagPallet, 0)) AS InslagPallets, SUM(ISNULL(dbo.Mutatie.UitslagKG, ' & |
            '                      0)) AS UitslagKG, SUM(ISNULL(dbo.Mutatie.UitslagPallet, 0)) AS UitslagPallets, SUM(ISNULL(dbo.Mutatie.InslagKG, 0)) ' & |
            '                      - SUM(ISNULL(dbo.Mutatie.UitslagKG, 0)) AS VoorraadKG, SUM(ISNULL(dbo.Mutatie.InslagPallet, 0)) - SUM(ISNULL(dbo.Mutatie.UitslagPallet, 0)) ' & |
            '                      AS VoorraadPallets ' & |
            'FROM         dbo.Partij INNER JOIN ' & |
            '                      dbo.Artikel_SyncExact ON dbo.Partij.ArtikelID = dbo.Artikel_SyncExact.ArtikelID INNER JOIN ' & |
            '                      dbo.Mutatie ON dbo.Partij.PartijID = dbo.Mutatie.PartijID AND dbo.Partij.ArtikelID = dbo.Mutatie.ArtikelID LEFT OUTER JOIN ' & |
            '                      dbo.Verpakking ON dbo.Partij.VerpakkingID = dbo.Verpakking.VerpakkingID LEFT OUTER JOIN ' & |
            '                      dbo.Relatie_SyncExact ON dbo.Partij.Leverancier = dbo.Relatie_SyncExact.RelatieID ' & |
            'GROUP BY dbo.Partij.PartijID, dbo.Partij.ArtikelID, dbo.Artikel_SyncExact.ArtikelOms, dbo.Partij.ExternPartijnr, dbo.Partij.AanmaakDatum, dbo.Verpakking.VerpakkingID, ' & |
            '                      dbo.Verpakking.VerpakkingOmschrijving, dbo.Relatie_SyncExact.FirmaNaam ')
            
        LocalClass.ExecuteSQLCommando('IF EXISTS(SELECT * FROM sys.objects WHERE Name = <39>ViewPlanningPartijTotaal<39> AND Type=<39>V<39>) BEGIN '& |
            ' DROP VIEW [dbo].[ViewPlanningPartijTotaal]  ; '&|
            ' END;')
        LocalClass.ExecuteSQLCommando('CREATE VIEW [dbo].[ViewPlanningPartijTotaal] ' & |
            'AS ' & |
            'SELECT     TOP (100) PERCENT dbo.Partij.PartijID, dbo.Partij.ArtikelID, dbo.Artikel_SyncExact.ArtikelOms, dbo.Partij.ExternPartijnr, dbo.Partij.AanmaakDatum, ' & |
            '                      dbo.Verpakking.VerpakkingOmschrijving, dbo.Relatie_SyncExact.FirmaNaam AS LeverancierFirmanaam, SUM(ISNULL(dbo.Planning.KG, 0)) AS VerkoopKG, ' & |
            '                      SUM(ISNULL(dbo.Planning.Pallets, 0)) AS VerkoopPallets ' & |
            'FROM         dbo.Partij INNER JOIN ' & |
            '                      dbo.Artikel_SyncExact ON dbo.Partij.ArtikelID = dbo.Artikel_SyncExact.ArtikelID INNER JOIN ' & |
            '                      dbo.Planning ON dbo.Planning.VerkoopID > 0 AND dbo.Planning.MutatieGemaakt = 0 AND dbo.Planning.Verwerkt = 0 AND ' & |
            '                      dbo.Partij.PartijID = dbo.Planning.PartijID AND dbo.Partij.ArtikelID = dbo.Planning.ArtikelID LEFT OUTER JOIN ' & |
            '                      dbo.Verpakking ON dbo.Partij.VerpakkingID = dbo.Verpakking.VerpakkingID LEFT OUTER JOIN ' & |
            '                      dbo.Relatie_SyncExact ON dbo.Partij.Leverancier = dbo.Relatie_SyncExact.RelatieID ' & |
            'GROUP BY dbo.Partij.PartijID, dbo.Partij.ArtikelID, dbo.Artikel_SyncExact.ArtikelOms, dbo.Partij.ExternPartijnr, dbo.Partij.AanmaakDatum, ' & |
            '                      dbo.Verpakking.VerpakkingOmschrijving, dbo.Relatie_SyncExact.FirmaNaam ')
            
        LocalClass.ExecuteSQLCommando('IF EXISTS(SELECT * FROM sys.objects WHERE Name = <39>PlanningOverboeking<39> AND Type=<39>V<39>) BEGIN '& |
            ' DROP VIEW [dbo].[PlanningOverboeking]  ; '&|
            ' END;')
        LocalClass.ExecuteSQLCommando('CREATE VIEW [dbo].[PlanningOverboeking] AS SELECT     dbo.Planning.PlanningID, ' & |
            'dbo.Planning.ArtikelID, dbo.Planning.KG, dbo.Planning.MutatieKG, ' & |
            'dbo.Planning.MutatiePallets, dbo.Planning.Pallets, ' & |
            'dbo.Planning.Transport, dbo.Planning.Planning, dbo.Planning.Geprint, dbo.Planning.MutatieGemaakt, ' & |
            'dbo.Planning.Verwerkt, dbo.Planning.Memo, ' & |
            'dbo.Planning.Instructie, ISNULL(dbo.Relatie_SyncExact.FirmaNaam, '''') AS FirmaNaam, ' & |
            'dbo.Cel.Celid, dbo.Cel.CelOms, dbo.Partij.PartijID, dbo.Partij.ExternPartijnr, ' & |
            'dbo.Artikel_SyncExact.ArtikelOms, dbo.Verpakking.VerpakkingID, dbo.Verpakking.VerpakkingOmschrijving, ' & |
            'NaarCel.Celid AS NaarCelID, NaarCel.CelOms AS NaarCelOms, ' & |
            'dbo.Planning.CelLocatieID, dbo.CelLocatie.Locatienaam, NaarCelLocatie.Locatienaam as NaarLocatienaam, ' & |
            'dbo.Planning.OverboekSoort FROM dbo.Planning ' & |
            'LEFT OUTER JOIN dbo.Artikel_SyncExact ON dbo.Artikel_SyncExact.ArtikelID = dbo.Planning.ArtikelID ' & |
            'LEFT OUTER JOIN dbo.Verpakking ON dbo.Verpakking.VerpakkingID = dbo.Planning.VerpakkingID ' & |
            'LEFT OUTER JOIN dbo.Partij ON dbo.Planning.PartijID = dbo.Partij.PartijID ' & |
            'LEFT OUTER JOIN dbo.Relatie_SyncExact ON dbo.Partij.Leverancier = dbo.Relatie_SyncExact.RelatieID ' & |
            'LEFT OUTER JOIN dbo.Cel ON dbo.Planning.CelID = dbo.Cel.Celid ' & |
            'LEFT OUTER JOIN dbo.Cel AS NaarCel ON dbo.Planning.OverboekingCelID = NaarCel.Celid ' & |
            'LEFT OUTER JOIN dbo.CelLocatie ON dbo.CelLocatie.CelLocatieID = dbo.Planning.CelLocatieID ' & |
            'LEFT OUTER JOIN dbo.CelLocatie AS NaarCelLocatie ON NaarCelLocatie.CelLocatieID = dbo.Planning.OverboekCelLocatieID ' & |
            'WHERE (dbo.Planning.OverboekingCelID <> 0) ')
            
        LocalClass.ExecuteSQLCommando('IF EXISTS(SELECT * FROM sys.objects WHERE Name = <39>ViewVoorraadPlanning<39> AND Type=<39>V<39>) BEGIN '& |
            ' DROP VIEW [dbo].[ViewVoorraadPlanning]  ; '&|
            ' END;')
        LocalClass.ExecuteSQLCommando('CREATE VIEW [dbo].[ViewVoorraadPlanning] ' & |
            'AS ' & |
            'SELECT     TOP (100) PERCENT ArtikelID, ArtikelOms, SUM(InslagKG) AS InslagKG, SUM(InslagPallets) AS InslagPallets, SUM(UitslagKG) AS UitslagKG, ' & |
            '                      SUM(UitslagPallets) AS UitslagPallets, SUM(InkoopKG) AS InkoopKG, SUM(InkoopPallets) AS InkoopPallets, SUM(VerkoopKG) AS VerkoopKG, ' & |
            '                      SUM(VerkoopPallets) AS VerkoopPallets ' & |
            'FROM         (SELECT     dbo.Artikel_SyncExact.ArtikelID, dbo.Artikel_SyncExact.ArtikelOms, SUM(dbo.Mutatie.InslagKG) AS InslagKG, SUM(dbo.Mutatie.InslagPallet) ' & |
            '                                              AS InslagPallets, SUM(dbo.Mutatie.UitslagKG) AS UitslagKG, SUM(dbo.Mutatie.UitslagPallet) AS UitslagPallets, 0 AS InkoopKG, ' & |
            '                                              0 AS InkoopPallets, 0 AS VerkoopKG, 0 AS VerkoopPallets ' & |
            '                       FROM          dbo.Artikel_SyncExact INNER JOIN ' & |
            '                                              dbo.Mutatie ON dbo.Artikel_SyncExact.ArtikelID = dbo.Mutatie.ArtikelID ' & |
            '                       GROUP BY dbo.Artikel_SyncExact.ArtikelID, dbo.Artikel_SyncExact.ArtikelOms ' & |
            '                       UNION ALL ' & |
            '                       SELECT     ViewArtikel_2.ArtikelID, ViewArtikel_2.ArtikelOms, 0 AS InslagKG, 0 AS InslagPallets, 0 AS UitslagKG, 0 AS UitslagPallets, 0 AS InkoopKG, ' & |
            '                                             0 AS InkoopPallets, SUM(dbo.Planning.KG) AS VerkoopKG, SUM(dbo.Planning.Pallets) AS VerkoopPallets ' & |
            '                       FROM         dbo.Artikel_SyncExact AS ViewArtikel_2 INNER JOIN ' & |
            '                                             dbo.Planning ON ViewArtikel_2.ArtikelID = dbo.Planning.ArtikelID ' & |
            '                       WHERE     (dbo.Planning.Verwerkt <> 1 OR ' & |
            '                                             dbo.Planning.Verwerkt IS NULL) AND (dbo.Planning.VerkoopID > 0) AND (dbo.Planning.VerkoopID > 0) AND ' & |
            '                                             (dbo.Planning.MutatieGemaakt <> 1 OR ' & |
            '                                             dbo.Planning.MutatieGemaakt IS NULL) ' & |
            '                       GROUP BY ViewArtikel_2.ArtikelID, ViewArtikel_2.ArtikelOms ' & |
            '                       UNION ALL ' & |
            '                       SELECT     ViewArtikel_1.ArtikelID, ViewArtikel_1.ArtikelOms, 0 AS InslagKG, 0 AS InslagPallets, 0 AS UitslagKG, 0 AS UitslagPallets, ' & |
            '                                             SUM(Planning_1.KG) AS InkoopKG, SUM(Planning_1.Pallets) AS InkoopPallets, 0 AS VerkoopKG, 0 AS VerkoopPallets ' & |
            '                       FROM         dbo.Artikel_SyncExact AS ViewArtikel_1 INNER JOIN ' & |
            '                                             dbo.Planning AS Planning_1 ON ViewArtikel_1.ArtikelID = Planning_1.ArtikelID ' & |
            '                       WHERE     (Planning_1.Verwerkt <> 1 OR ' & |
            '                                             Planning_1.Verwerkt IS NULL) AND (Planning_1.InkoopID > 0) AND (Planning_1.InkoopID > 0) AND (Planning_1.MutatieGemaakt <> 1 OR ' & |
            '                                             Planning_1.MutatieGemaakt IS NULL) ' & |
            '                       GROUP BY ViewArtikel_1.ArtikelID, ViewArtikel_1.ArtikelOms) AS derivedtbl_1 '&|
            '                       GROUP BY ArtikelID, ArtikelOms')
            
       LocalClass.ExecuteSQLCommando('IF EXISTS(SELECT * FROM sys.objects WHERE Name = <39>ViewVoorraadCelTotaal<39> AND Type=<39>V<39>) BEGIN '& |
            ' DROP VIEW [dbo].[ViewVoorraadCelTotaal]  ; '&|
            ' END;')
        LocalClass.ExecuteSQLCommando('CREATE VIEW [dbo].[ViewVoorraadCelTotaal] ' & |
            'AS ' & |
            'SELECT     TOP (100) PERCENT dbo.Mutatie.CelID, SUM(dbo.Mutatie.InslagKG) AS kg, SUM(dbo.Mutatie.InslagPallet) AS pallets, SUM(dbo.Mutatie.UitslagKG) ' & |
            '                      AS VerkoopKG, SUM(dbo.Mutatie.UitslagPallet) AS VerkoopPallet, dbo.Mutatie.ArtikelID, dbo.Artikel_SyncExact.ArtikelOms ' & |
            'FROM         dbo.Mutatie INNER JOIN ' & |
            '                      dbo.Artikel_SyncExact ON dbo.Mutatie.ArtikelID = dbo.Artikel_SyncExact.ArtikelID LEFT OUTER JOIN ' & |
            '                      dbo.Partij ON dbo.Mutatie.PartijID = dbo.Partij.PartijID ' & |
            'GROUP BY dbo.Mutatie.CelID, dbo.Mutatie.ArtikelID, dbo.Artikel_SyncExact.ArtikelOms ')
            
       LocalClass.ExecuteSQLCommando('IF EXISTS(SELECT * FROM sys.objects WHERE Name = <39>ViewTransporteur<39> AND Type=<39>V<39>) BEGIN '& |
            ' DROP VIEW [dbo].[ViewTransporteur]  ; '&|
            ' END;')
        LocalClass.ExecuteSQLCommando('CREATE VIEW [dbo].[ViewTransporteur] ' & |
            'AS ' & |
            'SELECT     dbo.Transporteur.TransporteurID, dbo.Transporteur.RelatieID, dbo.Relatie_SyncExact.FirmaNaam, dbo.Relatie_SyncExact.Adres1, dbo.Relatie_SyncExact.Adres2, ' & |
            '                      dbo.Relatie_SyncExact.Postcode, dbo.Relatie_SyncExact.Plaats, dbo.Relatie_SyncExact.Telefoon, dbo.Relatie_SyncExact.Mobiel, dbo.Relatie_SyncExact.Fax ' & |
            'FROM         dbo.Transporteur INNER JOIN ' & |
            '                      dbo.Relatie_SyncExact ON dbo.Transporteur.RelatieID = dbo.Relatie_SyncExact.RelatieID ')
 
       LocalClass.ExecuteSQLCommando('IF EXISTS(SELECT * FROM sys.objects WHERE Name = <39>AuditTransactieOverzicht<39> AND Type=<39>V<39>) BEGIN '& |
            ' DROP VIEW [dbo].[AuditTransactieOverzicht]  ; '&|
            ' END;')
        LocalClass.ExecuteSQLCommando('CREATE VIEW [dbo].[AuditTransactieOverzicht] ' & |
            'AS ' & |
            'WITH PartijHerkomst AS (SELECT     M.PartijID, ISNULL(RI.FirmaNaam, '''') AS LeverancierNaam, ISNULL(RI.Adres1, '''') AS LeverancierAdres, ISNULL(RI.Plaats, '''') ' & |
            '                                                                             AS LeverancierPlaats, ISNULL(RI.Country, '''') AS LeverancierLand ' & |
            '                                                       FROM         dbo.Mutatie AS M LEFT OUTER JOIN ' & |
            '                                                                             dbo.Planning AS P ON P.PlanningID = M.PlanningID LEFT OUTER JOIN ' & |
            '                                                                             dbo.Inkoop AS I ON I.InkoopID = P.InkoopID LEFT OUTER JOIN ' & |
            '                                                                             dbo.Relatie_SyncExact AS RI ON RI.RelatieID = I.Leverancier ' & |
            '                                                       WHERE     (M.InslagKG > 0) AND (M.SoortMutatie = ''IN'') ' & |
            '                                                       GROUP BY M.PartijID, RI.FirmaNaam, RI.Adres1, RI.Plaats, RI.Country) ' & |
            '    SELECT     CASE WHEN (M.PartijID > 0) THEN CAST(M.PartijID AS VARCHAR) ELSE ''Historie'' END AS InternPartijnr, PH.LeverancierNaam AS PartijLeverancierNaam, ' & |
            '                            PH.LeverancierAdres AS PartijLeverancierAdres, PH.LeverancierPlaats AS PartijLeverancierPlaats, PH.LeverancierLand AS PartijLeverancierLand, ' & |
            '                            M.ArtikelID AS Artikelnr, A.ArtikelOms AS Artikelnaam, CONVERT(DATE, M.DatumTijd) AS Datum, ' & |
            '                            CASE SoortMutatie WHEN ''IN'' THEN ''Inslag (Vanuit leverancier)'' WHEN ''UIT'' THEN ''Uitslag (Naar afnemer)'' WHEN ''EIN'' THEN ''Historische transactie'' WHEN ''EUIT'' ' & |
            '                             THEN ''Historische transactie'' WHEN ''OIN'' THEN ''Interne Inslag (Overboeking)'' WHEN ''OUIT'' THEN ''Interne Uitslag (Overboeking)'' END AS Handeling, ' & |
            '                            C.CelOms AS Koelcel, M.InslagKG AS IngeslagenKG, M.UitslagKG AS UitgeslagenKG, ISNULL(RI.FirmaNaam, '''') AS LeverancierNaam, ISNULL(RI.Adres1, '''') ' & |
            '                            AS LeverancierAdres, ISNULL(RI.Plaats, '''') AS LeverancierPlaats, ISNULL(RI.Country, '''') AS LeverancierLand, ISNULL(AI.Adres1, '''') AS AfwijkendLeverancierAdres1, ' & |
            '                            ISNULL(AI.Adres1, '''') AS AfwijkendLeverancierAdres2, ISNULL(AI.Plaats, '''') AS AfwijkendLeverancierPlaats, ISNULL(AI.Land, '''') AS AfwijkendLeverancierLand, ' & |
            '                            ISNULL(RV.FirmaNaam, '''') AS AfnemerNaam, ISNULL(RV.Adres1, '''') AS AfnemerAdres, ISNULL(RV.Plaats, '''') AS AfnemerPlaats, ISNULL(RV.Country, '''') ' & |
            '                            AS AfnemerLand, ISNULL(AV.Adres1, '''') AS AfwijkendAfnemerAdres1, ISNULL(AV.Adres2, '''') AS AfwijkendAfnemerAdres2, ISNULL(AV.Plaats, '''') ' & |
            '                            AS AfwijkendAfnemerPlaats, ISNULL(AV.Land, '''') AS AfwijkendAfnemerLand ' & |
            '     FROM         dbo.Mutatie AS M LEFT OUTER JOIN ' & |
            '                            dbo.Planning AS P ON P.PlanningID = M.PlanningID LEFT OUTER JOIN ' & |
            '                            dbo.Cel AS C ON C.Celid = M.CelID LEFT OUTER JOIN ' & |
            '                            dbo.Artikel_SyncExact AS A ON A.ArtikelID = M.ArtikelID LEFT OUTER JOIN ' & |
            '                            dbo.Inkoop AS I ON I.InkoopID = P.InkoopID LEFT OUTER JOIN ' & |
            '                            dbo.Verkoop AS V ON V.VerkoopID = P.VerkoopID LEFT OUTER JOIN ' & |
            '                            dbo.Partij AS PT ON PT.PartijID = M.PartijID LEFT OUTER JOIN ' & |
            '                            PartijHerkomst AS PH ON PH.PartijID = M.PartijID LEFT OUTER JOIN ' & |
            '                            dbo.RelatieAdres AS AI ON AI.ID = I.LeverancierAlternatiefAdres LEFT OUTER JOIN ' & |
            '                            dbo.RelatieAdres AS AV ON AV.ID = V.KlantAlternatiefAdres LEFT OUTER JOIN ' & |
            '                            dbo.Relatie_SyncExact AS RP ON RP.RelatieID = PT.Leverancier LEFT OUTER JOIN ' & |
            '                            dbo.Relatie_SyncExact AS RI ON RI.RelatieID = I.Leverancier LEFT OUTER JOIN ' & |
            '                            dbo.Relatie_SyncExact AS RV ON RV.RelatieID = V.Klant ' & |
            '     WHERE     (M.DatumTijd > ''2012-1-1'') AND (M.InslagKG > 0) OR ' & |
            '                            (M.DatumTijd > ''2012-1-1'') AND (M.UitslagKG > 0) ')
                       
                            
       LocalClass.ExecuteSQLCommando('IF EXISTS(SELECT * FROM sys.objects WHERE Name = <39>ViewVoorraad<39> AND Type=<39>V<39>) BEGIN '& |
            ' DROP VIEW [dbo].[ViewVoorraad]  ; '&|
            ' END;')
        LocalClass.ExecuteSQLCommando('CREATE VIEW [dbo].[ViewVoorraad] ' & |
            'AS ' & |
            'SELECT     TOP (100) PERCENT dbo.Artikel_SyncExact.ArtikelID, SUM(dbo.Mutatie.InslagKG) AS kg, SUM(dbo.Mutatie.InslagPallet) AS pallets, ' & |
            '                      SUM(dbo.Mutatie.UitslagKG) AS VerkoopKG, SUM(dbo.Mutatie.UitslagPallet) AS VerkoopPallet, dbo.Artikel_SyncExact.ArtikelOms ' & |
            'FROM         dbo.Artikel_SyncExact INNER JOIN ' & |
            '                      dbo.Mutatie ON dbo.Artikel_SyncExact.ArtikelID = dbo.Mutatie.ArtikelID ' & |
            'GROUP BY dbo.Artikel_SyncExact.ArtikelOms, dbo.Artikel_SyncExact.ArtikelID ' & |
            'ORDER BY dbo.Artikel_SyncExact.ArtikelOms ')

            
        
        LocalClass.SchrijfVersie(Loc:Versie,'ViewRelatie en ViewArtikel verwijderd')   

        LOC:ToonWijziging = false
    End
                    
    of 3.29 ! 25-05-2020
    Clear(VRS:Record)
    VRS:Versie=Loc:Versie
    if Access:Versie.Fetch(VRS:Versie_PK)
        LocalClass.ExecuteSQLCommando('IF EXISTS(SELECT * FROM sys.objects WHERE Name = <39>ViewBetcd<39> AND Type=<39>V<39>) BEGIN '& |
            ' DROP VIEW [dbo].[ViewBetcd]  ; '&|
            ' END;')
        LocalClass.ExecuteSQLCommando('IF EXISTS(SELECT * FROM sys.objects WHERE Name = <39>ViewBetcd<39> AND Type=<39>U<39>) BEGIN '& |
            ' DROP TABLE [dbo].[ViewBetcd]  ; '&|
            ' END;')
        LocalClass.ExecuteSQLCommando('CREATE TABLE dbo.ViewBetcd('&|
            'BetcdID char(20) NOT NULL ,'&|
            'Omschrijving VARCHAR(30) NOT NULL ,'&|            
            'Description  VARCHAR(30)'&|            
            ' CONSTRAINT [ViewBetcd_PK] PRIMARY KEY CLUSTERED '&|
            '( '&|
            '	[betcdID] ASC '&|
            ')WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY] '&|
            ') ON [PRIMARY]')
        
       LocalClass.ExecuteSQLCommando('IF EXISTS(SELECT * FROM sys.objects WHERE Name = <39>ArtikelOmschrijvingExtra<39> AND Type=<39>V<39>) BEGIN '& |
            ' DROP VIEW [dbo].[ArtikelOmschrijvingExtra]  ; '&|
            ' END;')
        LocalClass.ExecuteSQLCommando('IF EXISTS(SELECT * FROM sys.objects WHERE Name = <39>ArtikelOmschrijvingExtra<39> AND Type=<39>U<39>) BEGIN '& |
            ' DROP TABLE [dbo].[ArtikelOmschrijvingExtra]  ; '&|
            ' END;')
        LocalClass.ExecuteSQLCommando('CREATE TABLE dbo.ArtikelOmschrijvingExtra('&|
            'ID int NOT NULL ,'&|
            'ex_artcode CHAR(2) NOT NULL ,'&|            
            'artcode CHAR(30) NOT NULL ,'&|            
            'tekst CHAR(160) '&|            
            ' CONSTRAINT [PK_ArtikelOmschrijvingExtra] PRIMARY KEY CLUSTERED '&|
            '( '&|
            '	[ex_artcode] ASC, '&|
            '	[artcode] ASC '&|
            ')WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY] '&|
            ') ON [PRIMARY]')

       LocalClass.ExecuteSQLCommando('IF EXISTS(SELECT * FROM sys.objects WHERE Name = <39>ArtikelOmschrijvingExtraGroep<39> AND Type=<39>V<39>) BEGIN '& |
            ' DROP VIEW [dbo].[ArtikelOmschrijvingExtraGroep]  ; '&|
            ' END;')
        LocalClass.ExecuteSQLCommando('IF EXISTS(SELECT * FROM sys.objects WHERE Name = <39>ArtikelOmschrijvingExtraGroep<39> AND Type=<39>U<39>) BEGIN '& |
            ' DROP TABLE [dbo].[ArtikelOmschrijvingExtraGroep]  ; '&|
            ' END;')
        LocalClass.ExecuteSQLCommando('CREATE TABLE dbo.ArtikelOmschrijvingExtraGroep('&|
            'ID int NOT NULL ,'&|
            'ex_artcode CHAR(2) NOT NULL ,'&|            
            'Omschrijving CHAR(20) NOT NULL '&|            
            ' CONSTRAINT [Art3:PK_ArtikelOmschrijvingExtraGroep] PRIMARY KEY CLUSTERED '&|
            '( '&|
            '	[ID] ASC '&|
            ')WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY] '&|
            ') ON [PRIMARY]')
        
            LocalClass.ExecuteSQLCommando('CREATE UNIQUE INDEX [FK_ArtikelOmschrijvingExtraGroep] ON [dbo].[ArtikelOmschrijvingExtraGroep] '&|
            '('&|
	        '[ex_artcode] ASC, '&|
	        '[ID] ASC'&|
            ')WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]')

        LocalClass.SchrijfVersie(Loc:Versie,'Betalingconditie, en ExtraArtikelOmschrijvingen view ombouwen naar table')   

        LOC:ToonWijziging = false
    End
                
    of 3.28 ! 25-05-2020
    Clear(VRS:Record)
    VRS:Versie=Loc:Versie
    if Access:Versie.Fetch(VRS:Versie_PK)

        LocalClass.SchrijfVersie(Loc:Versie,'Extra index toegevoegd op Mutatie tabel ')   

        LOC:ToonWijziging = false
    End
                
    of 3.27 ! 09-04-2020
    Clear(VRS:Record)
    VRS:Versie=Loc:Versie
    if Access:Versie.Fetch(VRS:Versie_PK)
        LocalClass.ExecuteSQLCommando('ALTER TABLE [dbo].[Partij] ALTER COLUMN CorrectieveMaatregel varchar(2000)')
        LocalClass.ExecuteSQLCommando('ALTER TABLE [dbo].[Mutatie] ALTER COLUMN CorrectieveMaatregel varchar(2000)')

        LocalClass.ExecuteSQLCommando('ALTER TABLE [dbo].[Partij] ADD Oorzaak varchar(2000), TransportBedrijf varchar(2000)')
        LocalClass.ExecuteSQLCommando('ALTER TABLE [dbo].[Mutatie] ADD Oorzaak varchar(2000), TransportBedrijf varchar(2000)')

        LocalClass.SchrijfVersie(Loc:Versie,'Oorzaak en TransportBedrijf toegevoegd aan Partij en Mutatie')   

        LOC:ToonWijziging = false
    End
            
    of 3.26 ! 15-01-2020
    Clear(VRS:Record)
    VRS:Versie=Loc:Versie
    if Access:Versie.Fetch(VRS:Versie_PK)
        LocalClass.ExecuteSQLCommando('ALTER TABLE [dbo].[Planning] ADD UitslagPalletbladHarvastDate7007 datetime')

        LocalClass.SchrijfVersie(Loc:Versie,'UitslagPalletbladHarvastDate7007 toegevoegd aan Planning')   

        LOC:ToonWijziging = false
    End
            
    of 3.25 ! 13-01-2020
    Clear(VRS:Record)
    VRS:Versie=Loc:Versie
    if Access:Versie.Fetch(VRS:Versie_PK)
        LocalClass.ExecuteSQLCommando('ALTER TABLE [dbo].[Mutatie] ADD UitslagPalletbladHarvastDate7007 datetime')
        LocalClass.ExecuteSQLCommando('ALTER TABLE [dbo].[PalletBladSjabloon] ADD HarvastDate7007 varchar(100)')

        LocalClass.SchrijfVersie(Loc:Versie,'UitslagPalletbladHarvastDate7007 toegevoegd aan Mutatie')   

        LOC:ToonWijziging = false
    End
            
    of 3.24 ! 13-12-2019
    Clear(VRS:Record)
    VRS:Versie=Loc:Versie
    if Access:Versie.Fetch(VRS:Versie_PK)
        LocalClass.ExecuteSQLCommando('ALTER TABLE [dbo].[Planning] ALTER COLUMN AlternatieveArtikelOms VARCHAR(1000)')

        LocalClass.SchrijfVersie(Loc:Versie,'Alternatieve artikelOmschrijving uitgebreid')   

        LOC:ToonWijziging = false
    End
            
    of 3.23 ! 4-11-2019
    Clear(VRS:Record)
    VRS:Versie=Loc:Versie
    if Access:Versie.Fetch(VRS:Versie_PK)
        LocalClass.ExecuteSQLCommando('ALTER TABLE [dbo].[Verkoop] ADD PaymentCondition char(2)')

        LocalClass.SchrijfVersie(Loc:Versie,'Payment condition toegevoegd aan Verkoop')   

        LOC:ToonWijziging = false
    End
            
    of 3.22 ! 12-9-2019
    Clear(VRS:Record)
    VRS:Versie=Loc:Versie
    if Access:Versie.Fetch(VRS:Versie_PK)
        PUTINI('SQL','OWNER',GETINI('SQL','OWNER',,'.\Vooraad.ini'),'.\Voorraad.ini')
        LocalClass.SchrijfVersie(Loc:Versie,'AutoNet toegevoegd en SQL in ander ini gezet')   

        LOC:ToonWijziging = false
    End
            
    of 3.21 ! 10-9-2019
    Clear(VRS:Record)
    VRS:Versie=Loc:Versie
    If Access:Versie.Fetch(VRS:Versie_PK)
        LocalClass.ExecuteSQLCommando('ALTER TABLE [dbo].[Rapporten] ADD RapportSource Varchar(50)')
        LocalClass.SchrijfVersie(Loc:Versie,'RapportSource toegevoegd aan Rapportage ')   

        LOC:ToonWijziging = false
    End
            
    of 3.20 ! 5-9-2019
    Clear(VRS:Record)
    VRS:Versie=Loc:Versie
    If Access:Versie.Fetch(VRS:Versie_PK)
        LocalClass.ExecuteSQLCommando('CREATE TABLE [dbo].[Havens]( '&|
            '[Haven] [varchar](50) NOT NULL '&|
            ' CONSTRAINT [Haven_PK] PRIMARY KEY CLUSTERED '&|
            '( '&|
            '	[Haven] ASC '&|
            ')WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY] '&|
            ') ON [PRIMARY]')

        LocalClass.ExecuteSQLCommando('CREATE TABLE [dbo].[Rapporten]( '&|
            '[RapportID] [INT] IDENTITY(1,1) NOT NULL , '&|
            '[Onderwerp] [varchar](50) NOT NULL ,  '&|
            '[Titel] [varchar](50) NOT NULL ,  '&|
            '[Emails] [varchar](1000) NOT NULL ,  '&|
            '[Maandag] [tinyint] NOT NULL ,  '&|
            '[Dinsdag] [tinyint] NOT NULL ,  '&|
            '[Woensdag] [tinyint] NOT NULL ,  '&|
            '[Donderdag] [tinyint] NOT NULL ,  '&|
            '[Vrijdag] [tinyint] NOT NULL ,  '&|
            '[Zaterdag] [tinyint] NOT NULL ,  '&|
            '[Zondag] [tinyint] NOT NULL ,  '&|
            '[LstExecution] [Datetime],  '&|
            '[LstResponse] [varchar] (max),  '&|
            ' CONSTRAINT [Rapporten_PK] PRIMARY KEY CLUSTERED '&|
            '( '&|
            '	[RapportID] ASC '&|
            ')WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY] '&|
            ') ON [PRIMARY]')
        LocalClass.SchrijfVersie(Loc:Versie,'Tabel Haven en Rapportage toegevoegd' )   

        LOC:ToonWijziging = false
    End
            
    of 3.19 ! 14-8-2019
    Clear(VRS:Record)
    VRS:Versie=Loc:Versie
    If Access:Versie.Fetch(VRS:Versie_PK)

        LocalClass.ExecuteSQLCommando('ALTER TABLE [dbo].[Verkoop] Add OmschrijvingGoederen Varchar(4000)')
        
        LocalClass.ExecuteSQLCommando('ALTER TABLE CelLocatie '&|
            'DROP CONSTRAINT FK_CelLocatie ')
        
        LocalClass.SchrijfVersie(Loc:Versie,'Verkoop uitgebreid met OmschrijvingGoederen' )   
        LOC:ToonWijziging = false
    End
    of 3.18 ! 13-8-2019
    Clear(VRS:Record)
    VRS:Versie=Loc:Versie
    If Access:Versie.Fetch(VRS:Versie_PK)

        LocalClass.ExecuteSQLCommando('ALTER TABLE [dbo].[Verkoop] DROP Column Referentie ')

        LocalClass.ExecuteSQLCommando('ALTER TABLE [dbo].[Verkoop] Add BESCWaiver Varchar(50), ExpresseRelease Int, Aan Varchar(50)  ')
        
        
        LocalClass.SchrijfVersie(Loc:Versie,'Verkoop uitgebreid met Express Release, BESCWaiver en Aan, Referentie weer verwijderd' )   
        LOC:ToonWijziging = false
    End
    of 3.17 ! 31-7-2019
    Clear(VRS:Record)
    VRS:Versie=Loc:Versie
    If Access:Versie.Fetch(VRS:Versie_PK)

        SQLCommando= 'ALTER TABLE [dbo].[Verkoop] Add TarraContainer int, Laadhaven Varchar(50), Loshaven Varchar(50), Referentie Varchar(50), Boekingsnr Varchar(50)  '
        Versie{Prop:SQL} = SQLCommando
        IF error() then Stop(Error()& FileError()&' bij prop:SQL(4) ' & SQLCommando).        

        LocalClass.SchrijfVersie(Loc:Versie,'Verkoop uigebreid met Tarra, Laadhaven, Loshanvem Referentie en Boekingsnummer' )   
        LOC:ToonWijziging = false
    End
    of 3.16 ! 29-7-2019
    Clear(VRS:Record)
    VRS:Versie=Loc:Versie
    If Access:Versie.Fetch(VRS:Versie_PK)
        LocalClass.ExecuteSQLCommando('Delete [Voorraad].[dbo].[CelLocatie] Where CelID=0')
        
        LocalClass.ExecuteSQLCommando('ALTER TABLE CelLocatie '&|
            'ADD CONSTRAINT FK_CelLocatie '&|
            'FOREIGN KEY (CelID) REFERENCES Cel(CelID); ')

        LocalClass.ExecuteSQLCommando('DROP VIEW [dbo].[ViewPartijCelLocaties]')
        LocalClass.ExecuteSQLCommando('CREATE VIEW [dbo].[ViewPartijCelLocaties] AS ' & |
            'SELECT TOP (100) PERCENT dbo.Mutatie.PartijID, dbo.Mutatie.CelID, ' & |
            'ISNULL(dbo.Mutatie.CelLocatieID, 0) AS CelLocatieID, ' & |
            'dbo.CelLocatie.Locatienaam AS CelLocatienaam , ' & |
            'Sum(dbo.Mutatie.InslagKg-dbo.Mutatie.UitslagKg) as KG   , ' & |
            'Sum(dbo.Mutatie.InslagPallet-dbo.Mutatie.UitslagPallet) as Pallet ' & |
            'FROM dbo.Mutatie ' & |
            'LEFT OUTER JOIN dbo.CelLocatie ON dbo.CelLocatie.CelLocatieID = dbo.Mutatie.CelLocatieID ' & |
            'Where CAST(dbo.Mutatie.PartijID AS VARCHAR(5) ) +''.''+ CAST(dbo.Mutatie.CelID AS VARCHAR(2)) in (SELECT PartijCelID ' & |
            '  FROM [Voorraad].[dbo].[ViewVoorraadPartij] ' & |
            '  Where InslagKG>UitslagKG) ' & |
            'GROUP BY dbo.Mutatie.PartijID, dbo.Mutatie.CelID, dbo.Mutatie.CelLocatieID, dbo.CelLocatie.Locatienaam ' & |
            'HAVING Sum(dbo.Mutatie.InslagKg-dbo.Mutatie.UitslagKg)>0 ' & |
            'ORDER BY dbo.Mutatie.PartijID, dbo.Mutatie.CelID, CelLocatieID')
        LocalClass.SchrijfVersie(Loc:Versie,'Cel- Celocatie contraint toegevoegd' )   

        LOC:ToonWijziging = false
    End
    of 3.15 ! 25-7-2019
    Clear(VRS:Record)
    VRS:Versie=Loc:Versie
    If Access:Versie.Fetch(VRS:Versie_PK)
        SQLCommando= 'CREATE TABLE [dbo].[GNCode]( '&|
            '[GNCode] [varchar](20) , '&|
            '[GNCode_Can] [varchar](20) NULL, '&|
            '[Benaming_NL] [varchar](100) NULL, '&|
            '[Benaming_EN] [varchar](100) NULL, '&|
            '[Benaming_DU] [varchar](100) NULL, '&|
            '[Benaming_FR] [varchar](100) NULL '&|
            ' CONSTRAINT [GNCode_PK] PRIMARY KEY CLUSTERED '&|
            '( '&|
            '	[GNCode] ASC '&|
            ')WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY] '&|
            ') ON [PRIMARY]'
        Versie{Prop:SQL} = SQLCommando
        IF error() then Stop(Error()& FileError()&' bij prop:SQL(1) ' & SQLCommando).

        SQLCommando= 'CREATE TABLE [dbo].[GNCodeArtikelen]( '&|
            '[GNCode] [varchar](20) , '&|
            '[ArtikelID] [varchar](30)  '&|
            ' CONSTRAINT [GNCodeArtikelen_PK] PRIMARY KEY CLUSTERED '&|
            '( '&|
            '	[GNCode] ASC, '&|
            '	[ArtikelID] ASC '&|
            ')WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY] '&|
            ') ON [PRIMARY]'
        Versie{Prop:SQL} = SQLCommando
        IF error() then Stop(Error()& FileError()&' bij prop:SQL(1) ' & SQLCommando).

        SQLCommando='CREATE UNIQUE INDEX [GNCodeArtikelen_FK1] ON [dbo].[GNCodeArtikelen] '&|
            '('&|
	        '[ArtikelID] ASC'&|
            ')WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]'
        Versie{Prop:SQL} = SQLCommando
        IF error() then Stop(Error()& FileError()&' bij prop:SQL(4) ' & SQLCommando).        
        
        VRS:Versie = Loc:Versie
        VRS:DatumTijd_DATE = Today()
        VRS:DatumTijd_TIME = Clock()
        VRS:Wijzigingen= 'GNCodes toegevoegd '
        Access:Versie.Insert()

        LOC:ToonWijziging = false
    End
    of 3.14 ! 18-7-2019
    Clear(VRS:Record)
    VRS:Versie=Loc:Versie
    If Access:Versie.Fetch(VRS:Versie_PK)
        SQLCommando= 'ALTER TABLE [dbo].[Planning] Add OverboekSoort Varchar(50), OverboekCelLocatieID Int, NieuwKg Decimal(10,2),NieuwPallets int  '
        Versie{Prop:SQL} = SQLCommando
        IF error() then Stop(Error()& FileError()&' bij prop:SQL(4) ' & SQLCommando).        
        
        SQLCommando= 'ALTER TABLE [dbo].[Mutatie] Add OverboekSoort Varchar(50), OverboekCelLocatieID Int, NieuwKg Decimal(10,2),NieuwPallets int  '
        Versie{Prop:SQL} = SQLCommando
        IF error() then Stop(Error()& FileError()&' bij prop:SQL(4) ' & SQLCommando).        

        SQLCommando= 'DROP VIEW [dbo].[PlanningOverboeking] '
        Versie{Prop:SQL} = SQLCommando
        IF error() then Stop(Error()& FileError()&' bij prop:SQL(4) ' & SQLCommando).        

        SQLCommando= 'CREATE VIEW [dbo].[PlanningOverboeking] ' & |
        'AS ' & |
        'SELECT     dbo.Planning.PlanningID, dbo.Planning.ArtikelID, dbo.Planning.KG, dbo.Planning.MutatieKG, dbo.Planning.MutatiePallets, dbo.Planning.Pallets, ' & |
        '                      dbo.Planning.Transport, dbo.Planning.Planning, dbo.Planning.Geprint, dbo.Planning.MutatieGemaakt, dbo.Planning.Verwerkt, dbo.Planning.Memo, ' & |
        '                      dbo.Planning.Instructie, ISNULL(dbo.ViewRelatie.FirmaNaam, '''') AS FirmaNaam, dbo.Cel.Celid, dbo.Cel.CelOms, dbo.Partij.PartijID, dbo.Partij.ExternPartijnr, ' & |
        '                      dbo.ViewArtikel.ArtikelOms, dbo.Verpakking.VerpakkingID, dbo.Verpakking.VerpakkingOmschrijving, NaarCel.Celid AS NaarCelID, NaarCel.CelOms AS NaarCelOms, ' & |
        '                      dbo.Planning.CelLocatieID, dbo.CelLocatie.Locatienaam, NaarCelLocatie.Locatienaam as NaarLocatienaam, dbo.Planning.OverboekSoort ' & |
        'FROM         dbo.Planning LEFT OUTER JOIN ' & |
        '                      dbo.ViewArtikel ON dbo.ViewArtikel.ArtikelID = dbo.Planning.ArtikelID LEFT OUTER JOIN ' & |
        '                      dbo.Verpakking ON dbo.Verpakking.VerpakkingID = dbo.Planning.VerpakkingID LEFT OUTER JOIN ' & |
        '                      dbo.Partij ON dbo.Planning.PartijID = dbo.Partij.PartijID LEFT OUTER JOIN ' & |
        '                      dbo.ViewRelatie ON dbo.Partij.Leverancier = dbo.ViewRelatie.RelatieID LEFT OUTER JOIN ' & |
        '                      dbo.Cel ON dbo.Planning.CelID = dbo.Cel.Celid LEFT OUTER JOIN ' & |
        '                      dbo.Cel AS NaarCel ON dbo.Planning.OverboekingCelID = NaarCel.Celid LEFT OUTER JOIN ' & |
        '                      dbo.CelLocatie ON dbo.CelLocatie.CelLocatieID = dbo.Planning.CelLocatieID LEFT OUTER JOIN ' & |
        '  dbo.CelLocatie AS NaarCelLocatie ON NaarCelLocatie.CelLocatieID = dbo.Planning.OverboekCelLocatieID ' & |
        'WHERE     (dbo.Planning.OverboekingCelID <> 0) ' 

        Versie{Prop:SQL} = SQLCommando
        IF error() then Stop(Error()& FileError()&' bij prop:SQL(4) ' & SQLCommando).        
        
        VRS:Versie = Loc:Versie
        VRS:DatumTijd_DATE = Today()
        VRS:DatumTijd_TIME = Clock()
        VRS:Wijzigingen= ' Planning uitgebreid met OverboekSoort en OverboekCelLocatieID ,NieuwKg ,NieuwPallets '
        Access:Versie.Insert()

        LOC:ToonWijziging = false
    End
    of 3.13 ! 12-7-2019
    Clear(VRS:Record)
    VRS:Versie=Loc:Versie
    If Access:Versie.Fetch(VRS:Versie_PK)
        SQLCommando= 'ALTER TABLE [dbo].[Verkoop] Add Vessel Varchar(50), ProFormaMemo Varchar(4000) '
        Versie{Prop:SQL} = SQLCommando
        IF error() then Stop(Error()& FileError()&' bij prop:SQL(4) ' & SQLCommando).        

        SQLCommando= 'ALTER TABLE [dbo].[Planning] Add Dozen Int, GrossWeight Decimal(11,3) '
        Versie{Prop:SQL} = SQLCommando
        IF error() then Stop(Error()& FileError()&' bij prop:SQL(4) ' & SQLCommando).        

        SQLCommando= 'ALTER TABLE [dbo].[Verpakking] Add InhoudKG Decimal(7,3) '
        Versie{Prop:SQL} = SQLCommando
        IF error() then Stop(Error()& FileError()&' bij prop:SQL(4) ' & SQLCommando).        
        
        VRS:Versie = Loc:Versie
        VRS:DatumTijd_DATE = Today()
        VRS:DatumTijd_TIME = Clock()
        VRS:Wijzigingen= 'Verkoop uitgebreid met Vessel en ProFormaMemo, Planning met Dozen, grossweight  en InhoudKG bij verpakking '
        Access:Versie.Insert()

        LOC:ToonWijziging = false
    End
    of 3.12 ! 12-7-2019
    Clear(VRS:Record)
    VRS:Versie=Loc:Versie
    If Access:Versie.Fetch(VRS:Versie_PK)
        SQLCommando= 'ALTER TABLE [dbo].[Verkoop] Add Containernr Varchar(50), Sealnr Varchar(50) '
        Versie{Prop:SQL} = SQLCommando
        IF error() then Stop(Error()& FileError()&' bij prop:SQL(4) ' & SQLCommando).        
        
        VRS:Versie = Loc:Versie
        VRS:DatumTijd_DATE = Today()
        VRS:DatumTijd_TIME = Clock()
        VRS:Wijzigingen= 'Verkoop uitgebreid met Contanernr en Sealnr '
        Access:Versie.Insert()

        LOC:ToonWijziging = false
    End
    of 3.11 ! 9-7-2019
    Clear(VRS:Record)
    VRS:Versie=Loc:Versie
    If Access:Versie.Fetch(VRS:Versie_PK)
        SQLCommando= 'ALTER TABLE [dbo].[Verkoop] Add Valuta Varchar(50), Koersverschil Decimal(11,3) '
        Versie{Prop:SQL} = SQLCommando
        IF error() then Stop(Error()& FileError()&' bij prop:SQL(4) ' & SQLCommando).        
        
        SQLCommando= 'Update [dbo].[Verkoop] '&|
            'Set Valuta = (SELECT TOP 1 [Valuta] FROM [dbo].[Planning] WHERE dbo.Planning.VerkoopID= Verkoop.VerkoopID), '&|
            'Koersverschil = (SELECT TOP 1 [Koersverschil] FROM [dbo].[Planning] WHERE dbo.Planning.VerkoopID= Verkoop.VerkoopID) '
        Versie{Prop:SQL} = SQLCommando
        IF error() then Stop(Error()& FileError()&' bij prop:SQL(4) ' & SQLCommando).        
        
        VRS:Versie = Loc:Versie
        VRS:DatumTijd_DATE = Today()
        VRS:DatumTijd_TIME = Clock()
        VRS:Wijzigingen= 'Verkoop uitgebreid met Valuta en Koersverschil  '
        Access:Versie.Insert()

        LOC:ToonWijziging = false
    End
    of 3.10 ! 4-6-2019
    Clear(VRS:Record)
    VRS:Versie=Loc:Versie
    If Access:Versie.Fetch(VRS:Versie_PK)
        SQLCommando= 'ALTER TABLE [dbo].[CELLocatie] Add Hoogte INT, Direction Varchar(50) '
        Versie{Prop:SQL} = SQLCommando
        IF error() then Stop(Error()& FileError()&' bij prop:SQL(4) ' & SQLCommando).        
        
        VRS:Versie = Loc:Versie
        VRS:DatumTijd_DATE = Today()
        VRS:DatumTijd_TIME = Clock()
        VRS:Wijzigingen= 'Cellocatie uitgebreid met hoogte en Direction '
        Access:Versie.Insert()

        LOC:ToonWijziging = false
    End
    of 3.09 ! 3-6-2019
    Clear(VRS:Record)
    VRS:Versie=Loc:Versie
    If Access:Versie.Fetch(VRS:Versie_PK)
        SQLCommando= 'ALTER TABLE [dbo].[CEL] Add Breedte INT, Lengte INT '
        Versie{Prop:SQL} = SQLCommando
        IF error() then Stop(Error()& FileError()&' bij prop:SQL(4) ' & SQLCommando).        
        
        SQLCommando= 'UPDATE [dbo].[CEL] set Breedte = 164, Lengte = 225 Where CelID=1 '
        Versie{Prop:SQL} = SQLCommando
        IF error() then Stop(Error()& FileError()&' bij prop:SQL(4) ' & SQLCommando).        
        SQLCommando= 'UPDATE [dbo].[CEL] set Breedte = 153, Lengte = 249 Where CelID=2 '
        Versie{Prop:SQL} = SQLCommando
        IF error() then Stop(Error()& FileError()&' bij prop:SQL(4) ' & SQLCommando).        
        SQLCommando= 'UPDATE [dbo].[CEL] set Breedte = 194, Lengte = 120 Where CelID=3 '
        Versie{Prop:SQL} = SQLCommando
        IF error() then Stop(Error()& FileError()&' bij prop:SQL(4) ' & SQLCommando).        
        SQLCommando= 'UPDATE [dbo].[CEL] set Breedte = 194, Lengte = 120 Where CelID=4 '
        Versie{Prop:SQL} = SQLCommando
        IF error() then Stop(Error()& FileError()&' bij prop:SQL(4) ' & SQLCommando).        
        SQLCommando= 'UPDATE [dbo].[CEL] set Breedte = 171, Lengte = 560 Where CelID=34 '
        Versie{Prop:SQL} = SQLCommando
        IF error() then Stop(Error()& FileError()&' bij prop:SQL(4) ' & SQLCommando).        
        
        SQLCommando= 'ALTER TABLE [dbo].[CELLocatie] Add XPOS INT, YPos INT, BreedTe INT, Lengte INT '
        Versie{Prop:SQL} = SQLCommando
        IF error() then Stop(Error()& FileError()&' bij prop:SQL(4) ' & SQLCommando).        
        SQLCommando= 'UPDATE [dbo].[CELLocatie] set XPOS=0, Ypos=96, Breedte = 48, Lengte = 110 Where CelLocatieID=1 '
        Versie{Prop:SQL} = SQLCommando
        IF error() then Stop(Error()& FileError()&' bij prop:SQL(4) ' & SQLCommando).        
        SQLCommando= 'UPDATE [dbo].[CELLocatie] set XPOS=0, Ypos=48, Breedte = 48, Lengte = 110 Where CelLocatieID=177 '
        Versie{Prop:SQL} = SQLCommando
        IF error() then Stop(Error()& FileError()&' bij prop:SQL(4) ' & SQLCommando).        
        SQLCommando= 'UPDATE [dbo].[CELLocatie] set XPOS=0, Ypos=0, Breedte = 48, Lengte = 110 Where CelLocatieID=178 '
        Versie{Prop:SQL} = SQLCommando
        IF error() then Stop(Error()& FileError()&' bij prop:SQL(4) ' & SQLCommando).        
        SQLCommando= 'UPDATE [dbo].[CELLocatie] set XPOS=139, Ypos=96, Breedte = 48, Lengte = 110 Where CelLocatieID=179 '
        Versie{Prop:SQL} = SQLCommando
        IF error() then Stop(Error()& FileError()&' bij prop:SQL(4) ' & SQLCommando).        
        SQLCommando= 'UPDATE [dbo].[CELLocatie] set XPOS=139, Ypos=48, Breedte = 48, Lengte = 110 Where CelLocatieID=180 '
        Versie{Prop:SQL} = SQLCommando
        IF error() then Stop(Error()& FileError()&' bij prop:SQL(4) ' & SQLCommando).        
        SQLCommando= 'UPDATE [dbo].[CELLocatie] set XPOS=139, Ypos=0, Breedte = 48, Lengte = 110 Where CelLocatieID=181 '
        Versie{Prop:SQL} = SQLCommando
        IF error() then Stop(Error()& FileError()&' bij prop:SQL(4) ' & SQLCommando).        
        
        VRS:Versie = Loc:Versie
        VRS:DatumTijd_DATE = Today()
        VRS:DatumTijd_TIME = Clock()
        VRS:Wijzigingen= 'Cel en Cellocatie uitgebreid met posities'
        Access:Versie.Insert()

        LOC:ToonWijziging = false
    End
    of 3.08 ! 23-4-2019
    Clear(VRS:Record)
    VRS:Versie=Loc:Versie
    If Access:Versie.Fetch(VRS:Versie_PK)
        SQLCommando= 'CREATE TABLE [dbo].[SSOPTijd]( '&|
            '[TijdID] [INT] IDENTITY(1,1) NOT NULL , '&|
            '[DatumTijd] [DateTime]  NOT NULL, '&|
            '[Door] [varchar](100) NULL '&|
            ' CONSTRAINT [SSOPTijd_PK] PRIMARY KEY CLUSTERED '&|
            '( '&|
            '	[TijdID] ASC '&|
            ')WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY] '&|
            ') ON [PRIMARY]'
        Versie{Prop:SQL} = SQLCommando
        IF error() then Stop(Error()& FileError()&' bij prop:SQL(1) ' & SQLCommando).

        SQLCommando='CREATE NONCLUSTERED INDEX [SSOPTijd_FK1] ON [dbo].[SSOPTijd] '&|
            '('&|
	        '[DatumTijd] ASC'&|
            ')WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]'
        Versie{Prop:SQL} = SQLCommando
        IF error() then Stop(Error()& FileError()&' bij prop:SQL(4) ' & SQLCommando).        
        
        SQLCommando='ALTER TABLE SSOPRegistratie Add TijdID Int  '
        Versie{Prop:SQL} = SQLCommando
        IF error() then Stop(Error()& FileError()&' bij prop:SQL(4) ' & SQLCommando).        
        
        SQLCommando='CREATE NONCLUSTERED INDEX [SSOPRegistratie_FK2] ON [dbo].[SSOPRegistratie] '&|
            '('&|
	        '[TijdID] ASC,'&|
	        '[ObjID] ASC '&|
            ')WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]'
        Versie{Prop:SQL} = SQLCommando
        IF error() then Stop(Error()& FileError()&' bij prop:SQL(4) ' & SQLCommando).        
        
        
        VRS:Versie = Loc:Versie
        VRS:DatumTijd_DATE = Today()
        VRS:DatumTijd_TIME = Clock()
        VRS:Wijzigingen= 'SSOP Tijd toegevoegd '
        Access:Versie.Insert()

        LOC:ToonWijziging = false
    End
    of 3.07 ! 16-4-2019
    Clear(VRS:Record)
    VRS:Versie=Loc:Versie
    If Access:Versie.Fetch(VRS:Versie_PK)
        SQLCommando='DROP INDEX [SSOPRegistratie_FK1] ON [dbo].[SSOPRegistratie] '
        Versie{Prop:SQL} = SQLCommando
        IF error() then Stop(Error()& FileError()&' bij prop:SQL(4) ' & SQLCommando).        
        SQLCommando='CREATE NONCLUSTERED INDEX [SSOPRegistratie_FK1] ON [dbo].[SSOPRegistratie] '&|
            '('&|
	        '[Datum] ASC,'&|
	        '[ObjID] ASC '&|
            ')WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]'
        Versie{Prop:SQL} = SQLCommando
        IF error() then Stop(Error()& FileError()&' bij prop:SQL(4) ' & SQLCommando).        
        

        VRS:Versie = Loc:Versie
        VRS:DatumTijd_DATE = Today()
        VRS:DatumTijd_TIME = Clock()
        VRS:Wijzigingen= 'SSOP registratie index was fout '
        Access:Versie.Insert()

        LOC:ToonWijziging = false
    End
    of 3.06 ! 16-4-2019
    Clear(VRS:Record)
    VRS:Versie=Loc:Versie
    If Access:Versie.Fetch(VRS:Versie_PK)
        SQLCommando= 'CREATE TABLE [dbo].[SSOPObject]( '&|
            '[ObjID] [INT] IDENTITY(1,1) NOT NULL , '&|
            '[CatergorieID] [INT]  NOT NULL, '&|
            '[Omschrijving] [varchar](100) NULL, '&|
            '[Maandag] [tinyint], '&|
            '[Dinsdag] [tinyint], '&|
            '[Woensdag] [tinyint], '&|
            '[Donderdag] [tinyint], '&|
            '[Vrijdag] [tinyint] '&|
            ' CONSTRAINT [SSOPObject_PK] PRIMARY KEY CLUSTERED '&|
            '( '&|
            '	[ObjID] ASC '&|
            ')WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY] '&|
            ') ON [PRIMARY]'
        Versie{Prop:SQL} = SQLCommando
        IF error() then Stop(Error()& FileError()&' bij prop:SQL(1) ' & SQLCommando).

        SQLCommando='CREATE NONCLUSTERED INDEX [SSOPObject_FK1] ON [dbo].[SSOPObject] '&|
            '('&|
	        '[CatergorieID] ASC,'&|
	        '[ObjID] ASC '&|
            ')WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]'
        Versie{Prop:SQL} = SQLCommando
        IF error() then Stop(Error()& FileError()&' bij prop:SQL(4) ' & SQLCommando).        
        
        SQLCommando= 'CREATE TABLE [dbo].[SSOPCategorie]( '&|
            '[CategorieID] [INT] IDENTITY(1,1) NOT NULL , '&|
            '[Omschrijving] [varchar](100) NULL '&|
            ' CONSTRAINT [SSOPCategorie_PK] PRIMARY KEY CLUSTERED '&|
            '( '&|
            '	[CategorieID] ASC '&|
            ')WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY] '&|
            ') ON [PRIMARY]'
        Versie{Prop:SQL} = SQLCommando
        IF error() then Stop(Error()& FileError()&' bij prop:SQL(1) ' & SQLCommando).
        
        SQLCommando= 'CREATE TABLE [dbo].[SSOPRegistratie]( '&|
            '[RegistratieID] [INT] IDENTITY(1,1) NOT NULL , '&|
            '[ObjID] [INT] NOT NULL , '&|
            '[Datum] [datetime] NOT NULL, '&|
            '[Resultaat] [char] (1) NOT NULL, '&|
            '[Opmerking] [varchar] (2000), '&|
            '[CorrigerendeActie] [varchar] (2000) '&|
            ' CONSTRAINT [SSOPRegistratie_PK] PRIMARY KEY CLUSTERED '&|
            '( '&|
            '	[RegistratieID] ASC '&|
            ')WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY] '&|
            ') ON [PRIMARY]'
        Versie{Prop:SQL} = SQLCommando
        IF error() then Stop(Error()& FileError()&' bij prop:SQL(1) ' & SQLCommando).
        SQLCommando='CREATE NONCLUSTERED INDEX [SSOPRegistratie_FK1] ON [dbo].[SSOPRegistratie] '&|
            '('&|
	        '[Datum] ASC,'&|
	        '[RegistratieID] ASC '&|
            ')WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]'
        Versie{Prop:SQL} = SQLCommando
        IF error() then Stop(Error()& FileError()&' bij prop:SQL(4) ' & SQLCommando).        
        

        VRS:Versie = Loc:Versie
        VRS:DatumTijd_DATE = Today()
        VRS:DatumTijd_TIME = Clock()
        VRS:Wijzigingen= 'SSOP registratie toegevoegd '
        Access:Versie.Insert()

        LOC:ToonWijziging = false
    End
of 3.05 ! 22-3-2019
	Clear(VRS:Record)
	VRS:Versie=Loc:Versie
    If Access:Versie.Fetch(VRS:Versie_PK)
        SQLCommando='Alter Table dbo.Mutatie ADD UitslagQATemperatuurVervoermiddel [varchar](20)'
        Versie{Prop:SQL} = SQLCommando
        IF error() then Stop(Error()& FileError()&' bij prop:SQL ' & SQLCommando).  
		SQLCommando='DROP VIEW [dbo].[ViewPartijCelLocaties]'
		Versie{Prop:SQL} = SQLCommando
		IF error() then Stop(Error()& FileError()&' bij prop:SQL(1) ' & SQLCommando).
        
		SQLCommando='CREATE VIEW [dbo].[ViewPartijCelLocaties] AS '&|
			'SELECT TOP (100) PERCENT dbo.Mutatie.PartijID, dbo.Mutatie.CelID, ISNULL(dbo.Mutatie.CelLocatieID, 0) AS CelLocatieID, dbo.CelLocatie.Locatienaam AS CelLocatienaam ' &|
            ', Sum(dbo.Mutatie.InslagKg-dbo.Mutatie.UitslagKg) as KG   ' &|
            ', Sum(dbo.Mutatie.InslagPallet-dbo.Mutatie.UitslagPallet) as Pallet   ' &|
            'FROM dbo.Mutatie LEFT OUTER JOIN ' &|
            'dbo.CelLocatie ON dbo.CelLocatie.CelLocatieID = dbo.Mutatie.CelLocatieID ' &|
			'GROUP BY dbo.Mutatie.PartijID, dbo.Mutatie.CelID, dbo.Mutatie.CelLocatieID, dbo.CelLocatie.Locatienaam ' &|
			'HAVING Sum(dbo.Mutatie.InslagKg-dbo.Mutatie.UitslagKg)>0 ' &|
			'ORDER BY dbo.Mutatie.PartijID, dbo.Mutatie.CelID, CelLocatieID'
		Versie{Prop:SQL} = SQLCommando
		IF error() then Stop(Error()& FileError()&' bij prop:SQL(2) ' & SQLCommando).
		VRS:Versie = Loc:Versie
		VRS:DatumTijd_DATE = Today()
		VRS:DatumTijd_TIME = Clock()
		VRS:Wijzigingen= 'UitslagQATemperatuurVervoermiddel  toegevoegd '
		Access:Versie.Insert()

		LOC:ToonWijziging = false
	End
of 3.04 ! 13-3-2019
	Clear(VRS:Record)
	VRS:Versie=Loc:Versie
	If Access:Versie.Fetch(VRS:Versie_PK)
	    ! Voor het bepalen van de Cel/CelLocaties wordt alleen naar inslagen gekeken (Bij een uitslag zoals een overboeking geeft de CelLocatie, de CelLocatie weer van waaruit het komt)
		SQLCommando='DROP VIEW [dbo].[ViewPartijCelLocaties]'
		Versie{Prop:SQL} = SQLCommando
		IF error() then Stop(Error()& FileError()&' bij prop:SQL(1) ' & SQLCommando).
			
		SQLCommando='CREATE VIEW [dbo].[ViewPartijCelLocaties] AS '&|
			'SELECT TOP (100) PERCENT dbo.Mutatie.PartijID, dbo.Mutatie.CelID, ISNULL(dbo.Mutatie.CelLocatieID, 0) AS CelLocatieID, dbo.CelLocatie.Locatienaam AS CelLocatienaam ' &|
            ', Sum(dbo.Mutatie.InslagKg-dbo.Mutatie.UitslagKg) as KG   ' &|
            ', Sum(dbo.Mutatie.InslagPallet-dbo.Mutatie.UitslagPallet) as Pallet   ' &|
            'FROM dbo.Mutatie LEFT OUTER JOIN ' &|
            'dbo.CelLocatie ON dbo.CelLocatie.CelLocatieID = dbo.Mutatie.CelLocatieID ' &|
			'WHERE dbo.Mutatie.CelLocatieID<>0  ' &|
			'GROUP BY dbo.Mutatie.PartijID, dbo.Mutatie.CelID, dbo.Mutatie.CelLocatieID, dbo.CelLocatie.Locatienaam ' &|
			'HAVING Sum(dbo.Mutatie.InslagKg-dbo.Mutatie.UitslagKg)>0 ' &|
			'ORDER BY dbo.Mutatie.PartijID, dbo.Mutatie.CelID, CelLocatieID'
		Versie{Prop:SQL} = SQLCommando
		IF error() then Stop(Error()& FileError()&' bij prop:SQL(2) ' & SQLCommando).
	
	
		VRS:Versie = Loc:Versie
		VRS:DatumTijd_DATE = Today()
		VRS:DatumTijd_TIME = Clock()
		VRS:Wijzigingen= 'ViewPartijCelLocaties uitgebreid met Kg en Pallet '
		Access:Versie.Insert()

		LOC:ToonWijziging = false
	End
of 3.03 ! 12-3-2019
	Clear(VRS:Record)
	VRS:Versie=Loc:Versie
	If Access:Versie.Fetch(VRS:Versie_PK)
        SQLCommando='ALTER TABLE [dbo].[Planning] ADD Aanvulling varchar(100)  '
        Versie{Prop:SQL} = SQLCommando
        IF error() then Stop(Error()& FileError()&' bij prop:SQL ' & SQLCommando).        
        SQLCommando='ALTER TABLE [dbo].[Partij] ADD CorrectieveMaatregel Varchar(200) '
        Versie{Prop:SQL} = SQLCommando
        IF error() then Stop(Error()& FileError()&' bij prop:SQL ' & SQLCommando).        
        
        SQLCommando='ALTER TABLE [dbo].[Mutatie] ADD CorrectieveMaatregel Varchar(200) '
        Versie{Prop:SQL} = SQLCommando
        IF error() then Stop(Error()& FileError()&' bij prop:SQL ' & SQLCommando).        

        VRS:Versie = Loc:Versie
		VRS:DatumTijd_DATE = Today()
		VRS:DatumTijd_TIME = Clock()
		VRS:Wijzigingen= 'Aanvulling toegevoegd bij inkoop/planning, Correctieve maatregel bij inslag en uitslag'
		Access:Versie.Insert()
		LOC:ToonWijziging = false
	End


of 3.02 ! 27-2-2019
	Clear(VRS:Record)
	VRS:Versie=Loc:Versie
    If Access:Versie.Fetch(VRS:Versie_PK)
        SQLCommando='Alter Table dbo.Relatie_SyncExact Add PalletBladLayout varchar(50);'
        Versie{Prop:SQL} = SQLCommando
        IF error() then Stop(Error()& FileError()&' bij prop:SQL ' & SQLCommando).        

        VRS:Versie = Loc:Versie
		VRS:DatumTijd_DATE = Today()
		VRS:DatumTijd_TIME = Clock()
		VRS:Wijzigingen= 'PalletBladLayout toegevoegd aan Relatie'
		Access:Versie.Insert()
		LOC:ToonWijziging = false
	End


of 3.01 ! 22-2-2019
	Clear(VRS:Record)
	VRS:Versie=Loc:Versie
	If Access:Versie.Fetch(VRS:Versie_PK)
        SQLCommando='ALTER TABLE [dbo].[Inkoop] ADD ConfirmationDate DateTime,GebruikerID Int,BevestigingGeprint DateTime, DeliveryTermsID int, LoadingDate varchar(50)  '
        Versie{Prop:SQL} = SQLCommando
        IF error() then Stop(Error()& FileError()&' bij prop:SQL ' & SQLCommando).        
        SQLCommando='ALTER TABLE [dbo].[Gebruiker] ADD Email Varchar(100), Telefoon Varchar(20) '
        Versie{Prop:SQL} = SQLCommando
        IF error() then Stop(Error()& FileError()&' bij prop:SQL ' & SQLCommando).        

        VRS:Versie = Loc:Versie
		VRS:DatumTijd_DATE = Today()
		VRS:DatumTijd_TIME = Clock()
		VRS:Wijzigingen= 'Inkoop velden toegevoegd voor de inkoopbevestiging'
		Access:Versie.Insert()
		LOC:ToonWijziging = false
	End


of 3.00 ! 08-2-2019
    Clear(VRS:Record)
    VRS:Versie=Loc:Versie
    If Access:Versie.Fetch(VRS:Versie_PK)
        
        SQLCommando='Alter Table dbo.Mutatie ADD UitslagQAIsGeurKleurProductEigen [tinyint]'
        Versie{Prop:SQL} = SQLCommando
        IF error() then Stop(Error()& FileError()&' bij prop:SQL ' & SQLCommando).        
        SQLCommando='Alter Table dbo.Mutatie ADD UitslagQAGeenGlasbreuk [tinyint]'
        Versie{Prop:SQL} = SQLCommando
        IF error() then Stop(Error()& FileError()&' bij prop:SQL ' & SQLCommando).        
        SQLCommando='Alter Table dbo.Partij ADD InslagQAIsGeurKleurProductEigen [tinyint]'
        Versie{Prop:SQL} = SQLCommando
        IF error() then Stop(Error()& FileError()&' bij prop:SQL ' & SQLCommando).        
        SQLCommando='Alter Table dbo.Partij ADD InslagQAGeenGlasbreuk [tinyint]'
        Versie{Prop:SQL} = SQLCommando
        IF error() then Stop(Error()& FileError()&' bij prop:SQL ' & SQLCommando).        
        SQLCommando='Alter Table dbo.Partij ADD InslagQATemperatuurVervoermiddel [varchar](20)'
        Versie{Prop:SQL} = SQLCommando
        IF error() then Stop(Error()& FileError()&' bij prop:SQL ' & SQLCommando).        

        VRS:Versie = Loc:Versie
        VRS:DatumTijd_DATE = Today()
        VRS:DatumTijd_TIME = Clock()
        VRS:Wijzigingen= 'InslagQAIsGeurKleurProductEigen en InslagQAGeenGalsbreuk toegevoegd aan de mutaties en aan parijt'
        Access:Versie.Insert()
        LOC:ToonWijziging = false
    End


of 2.99 ! 31-1-2019
    Clear(VRS:Record)
    VRS:Versie=Loc:Versie
    If Access:Versie.Fetch(VRS:Versie_PK)
        
        SQLCommando='Alter Table dbo.Mutatie ADD CorrigerendeMaatregel [varchar](2000)'
        Versie{Prop:SQL} = SQLCommando
        IF error() then Stop(Error()& FileError()&' bij prop:SQL ' & SQLCommando).        
        SQLCommando='Alter Table dbo.Mutatie ADD Afgehandeld [varchar](2000)'
        Versie{Prop:SQL} = SQLCommando
        IF error() then Stop(Error()& FileError()&' bij prop:SQL ' & SQLCommando).        

        VRS:Versie = Loc:Versie
        VRS:DatumTijd_DATE = Today()
        VRS:DatumTijd_TIME = Clock()
        VRS:Wijzigingen= 'CorrigerendeMaatregel en Afgehandeld toegevoegd aan de mutaties'
        Access:Versie.Insert()
        LOC:ToonWijziging = false
    End


of 2.98 ! 30-1-2019
    Clear(VRS:Record)
    VRS:Versie=Loc:Versie
    If Access:Versie.Fetch(VRS:Versie_PK)
        SQLCommando='DROP INDEX [Verkoop_FK3] ON [dbo].[Verkoop]'
        Versie{Prop:SQL} = SQLCommando
        IF error() then Stop(Error()& FileError()&' bij prop:SQL ' & SQLCommando).        
        
        SQLCommando='CREATE NONCLUSTERED INDEX [Verkoop_FK3] ON [dbo].[Verkoop] '&|
            '('&|
	        '[Exported] ASC,'&|
	        '[Klant] ASC, '&|
	        '[VerkoopID] DESC '&|
            ')WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]'
        Versie{Prop:SQL} = SQLCommando
        IF error() then Stop(Error()& FileError()&' bij prop:SQL(4) ' & SQLCommando).        
        
        SQLCommando='Alter Table dbo.Partij ADD CorrigerendeMaatregel [varchar](2000)'
        Versie{Prop:SQL} = SQLCommando
        IF error() then Stop(Error()& FileError()&' bij prop:SQL ' & SQLCommando).        
        SQLCommando='Alter Table dbo.Partij ADD Afgehandeld [varchar](2000)'
        Versie{Prop:SQL} = SQLCommando
        IF error() then Stop(Error()& FileError()&' bij prop:SQL ' & SQLCommando).        

        VRS:Versie = Loc:Versie
        VRS:DatumTijd_DATE = Today()
        VRS:DatumTijd_TIME = Clock()
        VRS:Wijzigingen= 'Index op Gefactureerdvolgorde aangepast'
        Access:Versie.Insert()
        LOC:ToonWijziging = false
    End


of 2.97 ! 5-11-2018
    Clear(VRS:Record)
    VRS:Versie=Loc:Versie
    If Access:Versie.Fetch(VRS:Versie_PK)
        SQLCommando='Alter Table dbo.Relatie_SyncExact ADD [CMROpmerking] [varchar](1000)'
        Versie{Prop:SQL} = SQLCommando
        IF error() then Stop(Error()& FileError()&' bij prop:SQL ' & SQLCommando).        
        
        VRS:Versie = Loc:Versie
        VRS:DatumTijd_DATE = Today()
        VRS:DatumTijd_TIME = Clock()
        VRS:Wijzigingen= 'CMROpmerking toegevoegd aan Relatie '
        Access:Versie.Insert()
        LOC:ToonWijziging = false
    End


of 2.96 ! 3-11-2018
    Clear(VRS:Record)
    VRS:Versie=Loc:Versie
    If Access:Versie.Fetch(VRS:Versie_PK)
        SQLCommando='Alter Table dbo.Relatie_SyncExact ADD [cmp_fctry] [char](3)'
        Versie{Prop:SQL} = SQLCommando
        IF error() then Stop(Error()& FileError()&' bij prop:SQL ' & SQLCommando).        
        
        SQLCommando='DROP VIEW [dbo].[ViewRelatie];'
        Versie{Prop:SQL} = SQLCommando
        IF error() then Stop(Error()& FileError()&' bij prop:SQL ' & SQLCommando).        
        SQLCommando='CREATE VIEW [dbo].[ViewRelatie] '&|
                'AS '&|
                'SELECT     [010].dbo.cicmpy.ID AS RelatieID, [010].dbo.cicmpy.cmp_name AS FirmaNaam, [010].dbo.cicmpy.cmp_fadd1 AS Adres1, '&|
                      '[010].dbo.cicmpy.cmp_fadd2 AS Adres2, [010].dbo.cicmpy.cmp_fpc AS Postcode, [010].dbo.cicmpy.cmp_fcity AS Plaats, '&|
                      '[010].dbo.cicmpy.cmp_tel AS Telefoon, [010].dbo.cicmpy.cmp_Directory AS Mobiel, [010].dbo.cicmpy.cmp_fax AS Fax, '&|
            '[010].dbo.cicmpy.cmp_type AS Type, [010].dbo.land.oms60_0 AS Country, [010].dbo.cicmpy.ItemCode, [010].dbo.cicmpy.PaymentCondition, '&|
            '[010].dbo.cicmpy.cmp_code AS Code, '&|
            '[010].dbo.cicmpy.CreditLine AS CreditLine, '&|
            '[010].dbo.cicmpy.cmp_acc_man AS Acc_Man, '&|
            '[010].dbo.cicmpy.VatCode AS VatCode, '&|
            '[010].dbo.cicmpy.cmp_fctry AS cmp_fctry '&|
                'FROM         [010].dbo.cicmpy INNER JOIN '&|
                      '[010].dbo.land ON [010].dbo.cicmpy.cmp_fctry = [010].dbo.land.landcode '&|
                'WHERE [010].dbo.cicmpy.cmp_status NOT IN (<39>E<39>,<39>B<39>) '
        Versie{Prop:SQL} = SQLCommando
        IF error() then Stop(Error()& FileError()&' bij prop:SQL ' & SQLCommando).        

        VRS:Versie = Loc:Versie
        VRS:DatumTijd_DATE = Today()
        VRS:DatumTijd_TIME = Clock()
        VRS:Wijzigingen= 'cmp_fctry toegevoegd aan Relatie '
        Access:Versie.Insert()
        LOC:ToonWijziging = false
    End


of 2.95 ! 1-11-2018
    Clear(VRS:Record)
    VRS:Versie=Loc:Versie
    If Access:Versie.Fetch(VRS:Versie_PK)
        SQLCommando='Alter Table dbo.Relatie_SyncExact ADD VatCode [char](3)'
        Versie{Prop:SQL} = SQLCommando
        IF error() then Stop(Error()& FileError()&' bij prop:SQL ' & SQLCommando).        
        
        SQLCommando='DROP VIEW [dbo].[ViewRelatie];'
        Versie{Prop:SQL} = SQLCommando
        IF error() then Stop(Error()& FileError()&' bij prop:SQL ' & SQLCommando).        
        SQLCommando='CREATE VIEW [dbo].[ViewRelatie] '&|
                'AS '&|
                'SELECT     [010].dbo.cicmpy.ID AS RelatieID, [010].dbo.cicmpy.cmp_name AS FirmaNaam, [010].dbo.cicmpy.cmp_fadd1 AS Adres1, '&|
                      '[010].dbo.cicmpy.cmp_fadd2 AS Adres2, [010].dbo.cicmpy.cmp_fpc AS Postcode, [010].dbo.cicmpy.cmp_fcity AS Plaats, '&|
                      '[010].dbo.cicmpy.cmp_tel AS Telefoon, [010].dbo.cicmpy.cmp_Directory AS Mobiel, [010].dbo.cicmpy.cmp_fax AS Fax, '&|
            '[010].dbo.cicmpy.cmp_type AS Type, [010].dbo.land.oms60_0 AS Country, [010].dbo.cicmpy.ItemCode, [010].dbo.cicmpy.PaymentCondition, '&|
            '[010].dbo.cicmpy.cmp_code AS Code, '&|
            '[010].dbo.cicmpy.CreditLine AS CreditLine, '&|
            '[010].dbo.cicmpy.cmp_acc_man AS Acc_Man, '&|
            '[010].dbo.cicmpy.VatCode AS VatCode '&|
                'FROM         [010].dbo.cicmpy INNER JOIN '&|
                      '[010].dbo.land ON [010].dbo.cicmpy.cmp_fctry = [010].dbo.land.landcode '&|
                'WHERE [010].dbo.cicmpy.cmp_status NOT IN (<39>E<39>,<39>B<39>) '
        Versie{Prop:SQL} = SQLCommando
        IF error() then Stop(Error()& FileError()&' bij prop:SQL ' & SQLCommando).        

        VRS:Versie = Loc:Versie
        VRS:DatumTijd_DATE = Today()
        VRS:DatumTijd_TIME = Clock()
        VRS:Wijzigingen= 'VatCode toegevoegd aan Relatie '
        Access:Versie.Insert()
        LOC:ToonWijziging = false
    End


of 2.94 ! 26-10-2018
    Clear(VRS:Record)
    VRS:Versie=Loc:Versie
    If Access:Versie.Fetch(VRS:Versie_PK)
        SQLCommando='Alter Table dbo.Relatie_SyncExact ADD Acc_Man [int]'
        Versie{Prop:SQL} = SQLCommando
        IF error() then Stop(Error()& FileError()&' bij prop:SQL ' & SQLCommando).        
        
        SQLCommando='DROP VIEW [dbo].[ViewRelatie];'
        Versie{Prop:SQL} = SQLCommando
        IF error() then Stop(Error()& FileError()&' bij prop:SQL ' & SQLCommando).        
        SQLCommando='CREATE VIEW [dbo].[ViewRelatie] '&|
                'AS '&|
                'SELECT     [010].dbo.cicmpy.ID AS RelatieID, [010].dbo.cicmpy.cmp_name AS FirmaNaam, [010].dbo.cicmpy.cmp_fadd1 AS Adres1, '&|
                      '[010].dbo.cicmpy.cmp_fadd2 AS Adres2, [010].dbo.cicmpy.cmp_fpc AS Postcode, [010].dbo.cicmpy.cmp_fcity AS Plaats, '&|
                      '[010].dbo.cicmpy.cmp_tel AS Telefoon, [010].dbo.cicmpy.cmp_Directory AS Mobiel, [010].dbo.cicmpy.cmp_fax AS Fax, '&|
            '[010].dbo.cicmpy.cmp_type AS Type, [010].dbo.land.oms60_0 AS Country, [010].dbo.cicmpy.ItemCode, [010].dbo.cicmpy.PaymentCondition, '&|
            '[010].dbo.cicmpy.cmp_code AS Code, '&|
            '[010].dbo.cicmpy.CreditLine AS CreditLine, '&|
            '[010].dbo.cicmpy.cmp_acc_man AS Acc_Man '&|
                'FROM         [010].dbo.cicmpy INNER JOIN '&|
                      '[010].dbo.land ON [010].dbo.cicmpy.cmp_fctry = [010].dbo.land.landcode '&|
                'WHERE [010].dbo.cicmpy.cmp_status NOT IN (<39>E<39>,<39>B<39>) '
        Versie{Prop:SQL} = SQLCommando
        IF error() then Stop(Error()& FileError()&' bij prop:SQL ' & SQLCommando).        

        SQLCommando='CREATE NONCLUSTERED INDEX [FK1_Gebruiker] ON [dbo].[Gebruiker] '&|
            '('&|
	        '[WindowsInlog] ASC'&|
            ')WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]'
        Versie{Prop:SQL} = SQLCommando
        IF error() then Stop(Error()& FileError()&' bij prop:SQL(4) ' & SQLCommando).        
        
        SQLCommando='CREATE NONCLUSTERED INDEX [FK2_Gebruiker] ON [dbo].[Gebruiker] '&|
            '('&|
	        '[res_id] ASC'&|
            ')WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]'
        Versie{Prop:SQL} = SQLCommando
        IF error() then Stop(Error()& FileError()&' bij prop:SQL(4) ' & SQLCommando).        
        
        VRS:Versie = Loc:Versie
        VRS:DatumTijd_DATE = Today()
        VRS:DatumTijd_TIME = Clock()
        VRS:Wijzigingen= 'Vertegenwoordiger toegevoegd aan Relatie en res_id aan Gebruiker'
        Access:Versie.Insert()
        LOC:ToonWijziging = false
    End


of 2.93 ! 2018-10-18
	Clear(VRS:Record)
    VRS:Versie=Loc:Versie
	If Access:Versie.Fetch(VRS:Versie_PK)
		SQLCommando= 'ALTER TABLE [dbo].[RelatieArtikelOmschrijving] ADD GTIN varchar(20) '
		Versie{Prop:SQL} = SQLCommando
		IF error() then Stop(Error()& FileError()&' bij prop:SQL(1) ' & SQLCommando).
        
        VRS:Versie = Loc:Versie
		VRS:DatumTijd_DATE = Today()
		VRS:DatumTijd_TIME = Clock()
		VRS:Wijzigingen= 'GTIN toegevoegd aan Tabel RelatieArtikelOmschrijving'
		Access:Versie.Insert()
		LOC:ToonWijziging = false
	End


of 2.92 ! 2018-10-15
	Clear(VRS:Record)
    VRS:Versie=Loc:Versie
	If Access:Versie.Fetch(VRS:Versie_PK)
		SQLCommando= 'CREATE TABLE [dbo].[ISOCountries]( '&|
			'[ISCode] [VARCHAR] (2) NOT NULL, '&|
			'[ISNummer] [INT]  NOT NULL, '&|
			'[Country] [varchar](60) NULL '&|
			' CONSTRAINT [PK_ISOCountries] PRIMARY KEY CLUSTERED '&|
			'( '&|
			'	[ISCode] ASC '&|
			')WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY] '&|
			') ON [PRIMARY]'
		Versie{Prop:SQL} = SQLCommando
		IF error() then Stop(Error()& FileError()&' bij prop:SQL(1) ' & SQLCommando).
        
		SQLCommando= 'INSERT INTO  [dbo].[ISOCountries]( '&|
			'[ISCode], [ISNummer], [Country]) VALUES '&|
			'( <39>NL<39>, 528, <39>Nederland<39>), '&|
			'( <39>DE<39>, 267, <39>Duitsland<39>), '&|
			'( <39>CZ<39>, 203, <39>Tsjechië<39>), '&|
			'( <39>HU<39>, 348, <39>Hongarije<39>), '&|
			'( <39>IT<39>, 380, <39>Italie<39>); '
		Versie{Prop:SQL} = SQLCommando
		IF error() then Stop(Error()& FileError()&' bij prop:SQL(1) ' & SQLCommando).
        VRS:Versie = Loc:Versie
		VRS:DatumTijd_DATE = Today()
		VRS:DatumTijd_TIME = Clock()
		VRS:Wijzigingen= 'Tabel ISOCountries toegevoegd'
		Access:Versie.Insert()
		LOC:ToonWijziging = false
	End


of 2.91 ! 19-9-2018
    Clear(VRS:Record)
    VRS:Versie=Loc:Versie
    If Access:Versie.Fetch(VRS:Versie_PK)
        SQLCommando='Alter Table dbo.Verkoop ADD Exported [tinyint]'
        Versie{Prop:SQL} = SQLCommando
        IF error() then Stop(Error()& FileError()&' bij prop:SQL ' & SQLCommando).        
        
        SQLCommando='CREATE NONCLUSTERED INDEX [Verkoop_FK2] ON [dbo].[Verkoop] '&|
            '('&|
	        '[Exported] ASC,'&|
	        '[VerkoopID] ASC '&|
            ')WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]'
        Versie{Prop:SQL} = SQLCommando
        IF error() then Stop(Error()& FileError()&' bij prop:SQL(4) ' & SQLCommando).        
        SQLCommando='CREATE NONCLUSTERED INDEX [Verkoop_FK3] ON [dbo].[Verkoop] '&|
            '('&|
	        '[Exported] ASC,'&|
	        '[Klant] ASC, '&|
	        '[VerkoopID] ASC '&|
            ')WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]'
        Versie{Prop:SQL} = SQLCommando
        IF error() then Stop(Error()& FileError()&' bij prop:SQL(4) ' & SQLCommando).        

        VRS:Versie = Loc:Versie
        VRS:DatumTijd_DATE = Today()
        VRS:DatumTijd_TIME = Clock()
        VRS:Wijzigingen= 'Export toegevoegd aan Verkoop'
        Access:Versie.Insert()
        LOC:ToonWijziging = false
    End


of 2.90 ! 14-9-2018
    Clear(VRS:Record)
    VRS:Versie=Loc:Versie
    If Access:Versie.Fetch(VRS:Versie_PK)
        SQLCommando='Alter Table dbo.Relatie_SyncExact ADD Code [char](20)'
        Versie{Prop:SQL} = SQLCommando
        IF error() then Stop(Error()& FileError()&' bij prop:SQL ' & SQLCommando).        
        
        SQLCommando='Alter Table dbo.Gebruiker ADD res_id [int]'
        Versie{Prop:SQL} = SQLCommando
        IF error() then Stop(Error()& FileError()&' bij prop:SQL ' & SQLCommando).        

        VRS:Versie = Loc:Versie
        VRS:DatumTijd_DATE = Today()
        VRS:DatumTijd_TIME = Clock()
        VRS:Wijzigingen= 'Code toegevoegd aan Relatie en res_id aan Gebruiker'
        Access:Versie.Insert()
        LOC:ToonWijziging = false
    End


of 2.89 ! 2018-6-19
	Clear(VRS:Record)
	VRS:Versie=Loc:Versie
	If Access:Versie.Fetch(VRS:Versie_PK)
        SQLCommando='ALTER TABLE [dbo].[PalletMutatie] ADD TransporteurPalletMutatieID Int '
        Versie{Prop:SQL} = SQLCommando

        SQLCommando='CREATE NONCLUSTERED INDEX [PalletMutatie_FK5] ON [dbo].[PalletMutatie] '&|
            '('&|
	        '[VerkoopID] ASC,'&|
	        '[PalletSoortID] ASC, '&|
	        '[Transporteur] ASC'&|
            ')WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]'
        Versie{Prop:SQL} = SQLCommando
        IF error() then Stop(Error()& FileError()&' bij prop:SQL(4) ' & SQLCommando).        
        
        VRS:Versie = Loc:Versie
		VRS:DatumTijd_DATE = Today()
		VRS:DatumTijd_TIME = Clock()
		VRS:Wijzigingen= 'TransporteurPalletMutatieID toegevoegd aan PalletMutaties, automatisch transporteur regel uitgeschakeld  '
		Access:Versie.Insert()
		LOC:ToonWijziging = false
	End


of 2.88 ! 2018-6-13
	Clear(VRS:Record)
	VRS:Versie=Loc:Versie
	If Access:Versie.Fetch(VRS:Versie_PK)
        VRS:Versie = Loc:Versie
		VRS:DatumTijd_DATE = Today()
		VRS:DatumTijd_TIME = Clock()
		VRS:Wijzigingen= 'Bug bij lotnummers en mutatie gewicht bij sjabloon ipv planning  '
		Access:Versie.Insert()
		LOC:ToonWijziging = false
	End


of 2.87 ! 2018-4-17
	Clear(VRS:Record)
	VRS:Versie=Loc:Versie
	If Access:Versie.Fetch(VRS:Versie_PK)
        SQLCommando='ALTER TABLE [dbo].[Verkoop] ADD RetourDatum DateTime '
        Versie{Prop:SQL} = SQLCommando
        SQLCommando='ALTER TABLE [dbo].[Inkoop] ADD RetourDatum DateTime '
        Versie{Prop:SQL} = SQLCommando
        
        SQLCommando='Insert Into [dbo].[KostenStamgeg] (Omschrijving, Soort,Prijs) VALUES (<39>Retour Vrachtkosten<39>, <39>R<39>,0)'
        Versie{Prop:SQL} = SQLCommando
        
        VRS:Versie = Loc:Versie
		VRS:DatumTijd_DATE = Today()
		VRS:DatumTijd_TIME = Clock()
		VRS:Wijzigingen= 'RetourDatum toegevoegd op verkoop en inkoop en de RetourVrachtkosten  '
		Access:Versie.Insert()
		LOC:ToonWijziging = false
	End


of 2.86 ! 2018-3-29
	Clear(VRS:Record)
	VRS:Versie=Loc:Versie
	If Access:Versie.Fetch(VRS:Versie_PK)
        SQLCommando='ALTER TABLE [dbo].[Planning] ADD PlanningIDRetour int, PlanningIDParent int '
        Versie{Prop:SQL} = SQLCommando
        
        VRS:Versie = Loc:Versie
		VRS:DatumTijd_DATE = Today()
		VRS:DatumTijd_TIME = Clock()
		VRS:Wijzigingen= 'PlanningIDRetour en PlanningIDParent Velden toegevoegd in planningstabel'
		Access:Versie.Insert()
		LOC:ToonWijziging = false
	End


of 2.85 ! 16-03-2018
    Clear(VRS:Record)
    VRS:Versie=Loc:Versie
    If Access:Versie.Fetch(VRS:Versie_PK)

        VRS:Versie = Loc:Versie
        VRS:DatumTijd_DATE = Today()
        VRS:DatumTijd_TIME = Clock()
        VRS:Wijzigingen= 'Alleen lezen aangepast bij de inkoop, bug bij Retourboeken en Leverancier wijzigen'
        Access:Versie.Insert()
        LOC:ToonWijziging = false
    End


of 2.84 ! 31-01-2018
    Clear(VRS:Record)
    VRS:Versie=Loc:Versie
    If Access:Versie.Fetch(VRS:Versie_PK)

        VRS:Versie = Loc:Versie
        VRS:DatumTijd_DATE = Today()
        VRS:DatumTijd_TIME = Clock()
        VRS:Wijzigingen= 'Retour boeken van een gedeelte van de regel'
        Access:Versie.Insert()
        LOC:ToonWijziging = false
    End


of 2.83 ! 30-01-2018
    Clear(VRS:Record)
    VRS:Versie=Loc:Versie
    If Access:Versie.Fetch(VRS:Versie_PK)

        VRS:Versie = Loc:Versie
        VRS:DatumTijd_DATE = Today()
        VRS:DatumTijd_TIME = Clock()
        VRS:Wijzigingen= 'Verwerkte inkopen en verkopen allene nog maar Readonly, De Palletblad-info kan wel aangepast worden'
        Access:Versie.Insert()
        LOC:ToonWijziging = false
    End


of 2.82 ! 18-01-2018
    Clear(VRS:Record)
    VRS:Versie=Loc:Versie
    If Access:Versie.Fetch(VRS:Versie_PK)

        VRS:Versie = Loc:Versie
        VRS:DatumTijd_DATE = Today()
        VRS:DatumTijd_TIME = Clock()
        VRS:Wijzigingen= 'Openstaand saldo wordt niet goed overgenomen door ten onrechte unieke key op naam'
        Access:Versie.Insert()
        LOC:ToonWijziging = false
    End


of 2.81 ! 11-01-2018
    Clear(VRS:Record)
    VRS:Versie=Loc:Versie
    If Access:Versie.Fetch(VRS:Versie_PK)

        VRS:Versie = Loc:Versie
        VRS:DatumTijd_DATE = Today()
        VRS:DatumTijd_TIME = Clock()
        VRS:Wijzigingen= 'Zoeken op naam aangepast en het printen van de CMR'
        Access:Versie.Insert()
        LOC:ToonWijziging = false
    End


of 2.80 ! 22-12-2017
    Clear(VRS:Record)
    VRS:Versie=Loc:Versie
    If Access:Versie.Fetch(VRS:Versie_PK)

        VRS:Versie = Loc:Versie
        VRS:DatumTijd_DATE = Today()
        VRS:DatumTijd_TIME = Clock()
        VRS:Wijzigingen= 'Bug Uitslag bij de Tab verkoop'
        Access:Versie.Insert()
        LOC:ToonWijziging = false
    End


of 2.79 ! 30-11-2017
    Clear(VRS:Record)
    VRS:Versie=Loc:Versie
    If Access:Versie.Fetch(VRS:Versie_PK)

        VRS:Versie = Loc:Versie
        VRS:DatumTijd_DATE = Today()
        VRS:DatumTijd_TIME = Clock()
        VRS:Wijzigingen= 'Versie nummer wegschrijven in connectionstring'
        Access:Versie.Insert()
        LOC:ToonWijziging = false
    End


of 2.78 ! 28-11-2017
    Clear(VRS:Record)
    VRS:Versie=Loc:Versie
    If Access:Versie.Fetch(VRS:Versie_PK)

        VRS:Versie = Loc:Versie
        VRS:DatumTijd_DATE = Today()
        VRS:DatumTijd_TIME = Clock()
        VRS:Wijzigingen= 'Bug bij de inslag wegingen'
        Access:Versie.Insert()
        LOC:ToonWijziging = false
    End


of 2.77 ! 04-10-2017
    Clear(VRS:Record)
    VRS:Versie=Loc:Versie
    If Access:Versie.Fetch(VRS:Versie_PK)

        VRS:Versie = Loc:Versie
        VRS:DatumTijd_DATE = Today()
        VRS:DatumTijd_TIME = Clock()
        VRS:Wijzigingen= 'Bug bij de wegingen'
        Access:Versie.Insert()
        LOC:ToonWijziging = false
    End


of 2.76 ! 13-9-2017
    Clear(VRS:Record)
    VRS:Versie=Loc:Versie
    If Access:Versie.Fetch(VRS:Versie_PK)
        SQLCommando='Alter Table dbo.Relatie_SyncExact ADD DagenOud int;'
        Versie{Prop:SQL} = SQLCommando
        IF error() then Stop(Error()& FileError()&' bij prop:SQL ' & SQLCommando).        
        SQLCommando='IF EXISTS(SELECT * FROM sys.objects WHERE Name = <39>OpenstaandSaldo<39> ) BEGIN '& |
            ' DROP PROCEDURE [dbo].[OpenstaandSaldo]  ; '&|
            ' END;'
        Versie{Prop:SQL} = SQLCommando
        IF error() then Stop(Error()& FileError()&' bij prop:SQL ' & SQLCommando).        
        SQLCommando='CREATE PROCEDURE [dbo].[OpenstaandSaldo] '&|
            'AS '&|
            'BEGIN '&|
            'SELECT [Debtor Code] AS DebtorCode, SUM([Outstanding Amount]) AS Saldo,'&|
            'Max([Invoice Age]) AS DagenOud '&|
            'FROM [010].[dbo].[GRV_DebtorOutstanding] '&|
            'Group by [Debtor Code];'&| 
            'END '
        Versie{Prop:SQL} = SQLCommando
        IF error() then Stop(Error()& FileError()&' bij prop:SQL ' & SQLCommando).        

        VRS:Versie = Loc:Versie
        VRS:DatumTijd_DATE = Today()
        VRS:DatumTijd_TIME = Clock()
        VRS:Wijzigingen= 'Dagen Oud toegevoegd aan View_Relatie'
        Access:Versie.Insert()
        LOC:ToonWijziging = false
    End


of 2.75 ! 13-9-2017
	Clear(VRS:Record)
	VRS:Versie=Loc:Versie
	If Access:Versie.Fetch(VRS:Versie_PK)
        SQLCommando='DROP VIEW [dbo].[ViewRelatie];'
        Versie{Prop:SQL} = SQLCommando
        IF error() then Stop(Error()& FileError()&' bij prop:SQL ' & SQLCommando).        
        SQLCommando='CREATE VIEW [dbo].[ViewRelatie] '&|
                'AS '&|
                'SELECT     [010].dbo.cicmpy.ID AS RelatieID, [010].dbo.cicmpy.cmp_name AS FirmaNaam, [010].dbo.cicmpy.cmp_fadd1 AS Adres1, '&|
                      '[010].dbo.cicmpy.cmp_fadd2 AS Adres2, [010].dbo.cicmpy.cmp_fpc AS Postcode, [010].dbo.cicmpy.cmp_fcity AS Plaats, '&|
                      '[010].dbo.cicmpy.cmp_tel AS Telefoon, [010].dbo.cicmpy.cmp_Directory AS Mobiel, [010].dbo.cicmpy.cmp_fax AS Fax, '&|
            '[010].dbo.cicmpy.cmp_type AS Type, [010].dbo.land.oms60_0 AS Country, [010].dbo.cicmpy.ItemCode, [010].dbo.cicmpy.PaymentCondition, '&|
            '[010].dbo.cicmpy.cmp_code AS Code, '&|
            '[010].dbo.cicmpy.CreditLine AS CreditLine '&|
                'FROM         [010].dbo.cicmpy INNER JOIN '&|
                      '[010].dbo.land ON [010].dbo.cicmpy.cmp_fctry = [010].dbo.land.landcode '&|
                'WHERE [010].dbo.cicmpy.cmp_status NOT IN (<39>E<39>,<39>B<39>) '
        Versie{Prop:SQL} = SQLCommando
        IF error() then Stop(Error()& FileError()&' bij prop:SQL ' & SQLCommando).        
        SQLCommando='Alter Table dbo.Relatie_SyncExact ADD CreditLine float;'
        Versie{Prop:SQL} = SQLCommando
        IF error() then Stop(Error()& FileError()&' bij prop:SQL ' & SQLCommando).        
        VRS:Versie = Loc:Versie
		VRS:DatumTijd_DATE = Today()
		VRS:DatumTijd_TIME = Clock()
		VRS:Wijzigingen= 'CreditLine aan View_Relatie'
		Access:Versie.Insert()
		LOC:ToonWijziging = false
	End


of 2.74 ! 11-9-2017
	Clear(VRS:Record)
	VRS:Versie=Loc:Versie
	If Access:Versie.Fetch(VRS:Versie_PK)
        SQLCommando='DROP VIEW [dbo].[ViewRelatie];'
        Versie{Prop:SQL} = SQLCommando
        IF error() then Stop(Error()& FileError()&' bij prop:SQL ' & SQLCommando).        
        SQLCommando='CREATE VIEW [dbo].[ViewRelatie] '&|
                'AS '&|
                'SELECT     [010].dbo.cicmpy.ID AS RelatieID, [010].dbo.cicmpy.cmp_name AS FirmaNaam, [010].dbo.cicmpy.cmp_fadd1 AS Adres1, '&|
                      '[010].dbo.cicmpy.cmp_fadd2 AS Adres2, [010].dbo.cicmpy.cmp_fpc AS Postcode, [010].dbo.cicmpy.cmp_fcity AS Plaats, '&|
                      '[010].dbo.cicmpy.cmp_tel AS Telefoon, [010].dbo.cicmpy.cmp_Directory AS Mobiel, [010].dbo.cicmpy.cmp_fax AS Fax, '&|
            '[010].dbo.cicmpy.cmp_type AS Type, [010].dbo.land.oms60_0 AS Country, [010].dbo.cicmpy.ItemCode, [010].dbo.cicmpy.PaymentCondition, '&|
            '[010].dbo.cicmpy.cmp_code AS Code '&|
                'FROM         [010].dbo.cicmpy INNER JOIN '&|
                      '[010].dbo.land ON [010].dbo.cicmpy.cmp_fctry = [010].dbo.land.landcode '&|
                'WHERE [010].dbo.cicmpy.cmp_status NOT IN (<39>E<39>,<39>B<39>) '
        Versie{Prop:SQL} = SQLCommando
        IF error() then Stop(Error()& FileError()&' bij prop:SQL ' & SQLCommando).        
        SQLCommando='Alter Table dbo.Relatie_SyncExact ADD OpenstaandSaldo float;'
        Versie{Prop:SQL} = SQLCommando
        IF error() then Stop(Error()& FileError()&' bij prop:SQL ' & SQLCommando).        
        SQLCommando='CREATE PROCEDURE [dbo].[OpenstaandSaldo] '&|
        'AS '&|
        'BEGIN '&|
                'SELECT [Debtor Code] AS DebtorCode, SUM([Outstanding Amount]) AS Saldo '&|
                'FROM [010].[dbo].[GRV_DebtorOutstanding] '&|
                'Group by [Debtor Code];'&| 
        'END '
        Versie{Prop:SQL} = SQLCommando
        IF error() then Stop(Error()& FileError()&' bij prop:SQL ' & SQLCommando).        

        VRS:Versie = Loc:Versie
		VRS:DatumTijd_DATE = Today()
		VRS:DatumTijd_TIME = Clock()
		VRS:Wijzigingen= 'OpenstaandSaldo toegevoegd aan View_Relatie'
		Access:Versie.Insert()
		LOC:ToonWijziging = false
	End


of 2.73 ! 28-6-2017
	Clear(VRS:Record)
	VRS:Versie=Loc:Versie
	If Access:Versie.Fetch(VRS:Versie_PK)
        SQLCommando='DROP VIEW [dbo].[ViewRelatie];'
        Versie{Prop:SQL} = SQLCommando
        IF error() then Stop(Error()& FileError()&' bij prop:SQL ' & SQLCommando).        
        SQLCommando='CREATE VIEW [dbo].[ViewRelatie] '&|
                'AS '&|
                'SELECT     [010].dbo.cicmpy.ID AS RelatieID, [010].dbo.cicmpy.cmp_name AS FirmaNaam, [010].dbo.cicmpy.cmp_fadd1 AS Adres1, '&|
                      '[010].dbo.cicmpy.cmp_fadd2 AS Adres2, [010].dbo.cicmpy.cmp_fpc AS Postcode, [010].dbo.cicmpy.cmp_fcity AS Plaats, '&|
                      '[010].dbo.cicmpy.cmp_tel AS Telefoon, [010].dbo.cicmpy.cmp_Directory AS Mobiel, [010].dbo.cicmpy.cmp_fax AS Fax, '&|
                      '[010].dbo.cicmpy.cmp_type AS Type, [010].dbo.land.oms60_0 AS Country, [010].dbo.cicmpy.ItemCode, [010].dbo.cicmpy.PaymentCondition '&|
                'FROM         [010].dbo.cicmpy INNER JOIN '&|
                      '[010].dbo.land ON [010].dbo.cicmpy.cmp_fctry = [010].dbo.land.landcode '&|
                'WHERE [010].dbo.cicmpy.cmp_status NOT IN (<39>E<39>,<39>B<39>) '
        Versie{Prop:SQL} = SQLCommando
        IF error() then Stop(Error()& FileError()&' bij prop:SQL ' & SQLCommando).        
        SQLCommando='Alter Table dbo.Relatie_SyncExact DROP COLUMN cmp_Note;'
        Versie{Prop:SQL} = SQLCommando
        IF error() then Stop(Error()& FileError()&' bij prop:SQL ' & SQLCommando).        
        SQLCommando='Alter Table dbo.Relatie_SyncExact ADD Note varchar(4000);'
        Versie{Prop:SQL} = SQLCommando
        IF error() then Stop(Error()& FileError()&' bij prop:SQL ' & SQLCommando).        
        SQLCommando='Alter Table dbo.Relatie_SyncExact Add LotID int;'
        Versie{Prop:SQL} = SQLCommando
        IF error() then Stop(Error()& FileError()&' bij prop:SQL ' & SQLCommando).        
        VRS:Versie = Loc:Versie
		VRS:DatumTijd_DATE = Today()
		VRS:DatumTijd_TIME = Clock()
		VRS:Wijzigingen= 'Note en LotID toegevoegd aan de relatie'
		Access:Versie.Insert()
		LOC:ToonWijziging = false
	End


of 2.72 ! 27-6-2017
	Clear(VRS:Record)
	VRS:Versie=Loc:Versie
	If Access:Versie.Fetch(VRS:Versie_PK)
        SQLCommando='DROP VIEW [dbo].[ViewRelatie];'
        Versie{Prop:SQL} = SQLCommando
        IF error() then Stop(Error()& FileError()&' bij prop:SQL ' & SQLCommando).        
        SQLCommando='CREATE VIEW [dbo].[ViewRelatie] '&|
                'AS '&|
                'SELECT     [010].dbo.cicmpy.ID AS RelatieID, [010].dbo.cicmpy.cmp_name AS FirmaNaam, [010].dbo.cicmpy.cmp_fadd1 AS Adres1, '&|
                      '[010].dbo.cicmpy.cmp_fadd2 AS Adres2, [010].dbo.cicmpy.cmp_fpc AS Postcode, [010].dbo.cicmpy.cmp_fcity AS Plaats, '&|
                      '[010].dbo.cicmpy.cmp_tel AS Telefoon, [010].dbo.cicmpy.cmp_Directory AS Mobiel, [010].dbo.cicmpy.cmp_fax AS Fax, '&|
                      '[010].dbo.cicmpy.cmp_type AS Type, [010].dbo.land.oms60_0 AS Country, [010].dbo.cicmpy.ItemCode, [010].dbo.cicmpy.PaymentCondition, '&|
                      '[010].dbo.cicmpy.cmp_note '&|
                'FROM         [010].dbo.cicmpy INNER JOIN '&|
                      '[010].dbo.land ON [010].dbo.cicmpy.cmp_fctry = [010].dbo.land.landcode '&|
                'WHERE [010].dbo.cicmpy.cmp_status NOT IN (<39>E<39>,<39>B<39>) '
        
        Versie{Prop:SQL} = SQLCommando
        IF error() then Stop(Error()& FileError()&' bij prop:SQL ' & SQLCommando).   
        SQLCommando='Alter Table dbo.Relatie_SyncExact Add cmp_Note TEXT;'
        Versie{Prop:SQL} = SQLCommando
        IF error() then Stop(Error()& FileError()&' bij prop:SQL ' & SQLCommando).        
        VRS:Versie = Loc:Versie
		VRS:DatumTijd_DATE = Today()
		VRS:DatumTijd_TIME = Clock()
		VRS:Wijzigingen= 'Note toegevoegd aan de relatie'
		Access:Versie.Insert()
		LOC:ToonWijziging = false
	End


of 2.71 ! 13-6-2017
	Clear(VRS:Record)
	VRS:Versie=Loc:Versie
	If Access:Versie.Fetch(VRS:Versie_PK)
        SQLCommando='ALTER TABLE [dbo].[Verkoop] ADD BevestigingGeprint DateTime, DeliveryTermsID int '
        Versie{Prop:SQL} = SQLCommando
        IF error() then Stop(Error()& FileError()&' bij prop:SQL ' & SQLCommando).        
		SQLCommando= 'CREATE TABLE [dbo].[DeliveryTerms]( '&|
			'[DeliveryTermsID] [int] IDENTITY(1,1) NOT NULL, '&|
			'[Omschrijving] [varchar](60) NULL '&|
			' CONSTRAINT [PK_DeliveryTerms] PRIMARY KEY CLUSTERED '&|
			'( '&|
			'	[DeliveryTermsID] ASC '&|
			')WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY] '&|
			') ON [PRIMARY]'
		Versie{Prop:SQL} = SQLCommando
		IF error() then Stop(Error()& FileError()&' bij prop:SQL(1) ' & SQLCommando).
        
        VRS:Versie = Loc:Versie
		VRS:DatumTijd_DATE = Today()
		VRS:DatumTijd_TIME = Clock()
		VRS:Wijzigingen= 'Tabel delivery terms toegevoegd en velden in verkoop'
		Access:Versie.Insert()
		LOC:ToonWijziging = false
	End


of 2.70 ! 8-6-2017
	Clear(VRS:Record)
	VRS:Versie=Loc:Versie
	If Access:Versie.Fetch(VRS:Versie_PK)
        SQLCommando='ALTER TABLE [dbo].[Planning] ADD DeliveryDate DateTime '
        Versie{Prop:SQL} = SQLCommando
        IF error() then Stop(Error()& FileError()&' bij prop:SQL ' & SQLCommando).        
        SQLCommando='DROP VIEW [dbo].[ViewBetcd];'
        Versie{Prop:SQL} = SQLCommando
        IF error() then Stop(Error()& FileError()&' bij prop:SQL ' & SQLCommando).        
        SQLCommando='CREATE VIEW [dbo].[ViewBetcd] '&|
                'AS '&|
                'SELECT     [010].dbo.betcd.betcond AS betcdID, [010].dbo.betcd.oms30_0 AS Omschrijving, [010].dbo.betcd.oms30_1 AS Description '&|
                'FROM         [010].dbo.betcd  '
        Versie{Prop:SQL} = SQLCommando
        IF error() then Stop(Error()& FileError()&' bij prop:SQL ' & SQLCommando).        
        
        VRS:Versie = Loc:Versie
		VRS:DatumTijd_DATE = Today()
		VRS:DatumTijd_TIME = Clock()
		VRS:Wijzigingen= 'Velden toegevoegd voor orderbevestiging, Deel 2'
		Access:Versie.Insert()
		LOC:ToonWijziging = false
	End


of 2.69 ! 7-6-2017
	Clear(VRS:Record)
	VRS:Versie=Loc:Versie
	If Access:Versie.Fetch(VRS:Versie_PK)
        SQLCommando='ALTER TABLE [dbo].[Verpakking] ADD Description Varchar(50) '
        Versie{Prop:SQL} = SQLCommando
        IF error() then Stop(Error()& FileError()&' bij prop:SQL ' & SQLCommando).        
        SQLCommando='ALTER TABLE [dbo].[Verkoop] ADD ConfirmationDate DateTime,GebruikerID Int  '
        Versie{Prop:SQL} = SQLCommando
        IF error() then Stop(Error()& FileError()&' bij prop:SQL ' & SQLCommando).        
        SQLCommando='ALTER TABLE [dbo].[Planning] ADD LotID Int, PlantNumber Varchar(50) '
        Versie{Prop:SQL} = SQLCommando
        IF error() then Stop(Error()& FileError()&' bij prop:SQL ' & SQLCommando).        
        SQLCommando='ALTER TABLE [dbo].[Gebruiker] ADD VolledigeNaam Varchar(50), Handtekening Varchar(100) '
        Versie{Prop:SQL} = SQLCommando
        IF error() then Stop(Error()& FileError()&' bij prop:SQL ' & SQLCommando).        
        SQLCommando='DROP VIEW [dbo].[ViewRelatie];'
        Versie{Prop:SQL} = SQLCommando
        IF error() then Stop(Error()& FileError()&' bij prop:SQL ' & SQLCommando).        
        SQLCommando='CREATE VIEW [dbo].[ViewRelatie] '&|
                'AS '&|
                'SELECT     [010].dbo.cicmpy.ID AS RelatieID, [010].dbo.cicmpy.cmp_name AS FirmaNaam, [010].dbo.cicmpy.cmp_fadd1 AS Adres1, '&|
                      '[010].dbo.cicmpy.cmp_fadd2 AS Adres2, [010].dbo.cicmpy.cmp_fpc AS Postcode, [010].dbo.cicmpy.cmp_fcity AS Plaats, '&|
                      '[010].dbo.cicmpy.cmp_tel AS Telefoon, [010].dbo.cicmpy.cmp_Directory AS Mobiel, [010].dbo.cicmpy.cmp_fax AS Fax, '&|
                      '[010].dbo.cicmpy.cmp_type AS Type, [010].dbo.land.oms60_0 AS Country, [010].dbo.cicmpy.ItemCode, [010].dbo.cicmpy.PaymentCondition '&|
                'FROM         [010].dbo.cicmpy INNER JOIN '&|
                      '[010].dbo.land ON [010].dbo.cicmpy.cmp_fctry = [010].dbo.land.landcode '&|
                'WHERE [010].dbo.cicmpy.cmp_status NOT IN (<39>E<39>,<39>B<39>) '
        Versie{Prop:SQL} = SQLCommando
        IF error() then Stop(Error()& FileError()&' bij prop:SQL ' & SQLCommando).        
        SQLCommando='CREATE VIEW [dbo].[ViewBetcd] '&|
                'AS '&|
                'SELECT     [010].dbo.betcd.ID AS betcdID, [010].dbo.betcd.oms30_0 AS Omschrijving, [010].dbo.betcd.oms30_1 AS Description '&|
                'FROM         [010].dbo.betcd  '
        Versie{Prop:SQL} = SQLCommando
        IF error() then Stop(Error()& FileError()&' bij prop:SQL ' & SQLCommando).        
        SQLCommando='ALTER TABLE [dbo].[Relatie_SyncExact] Drop Column PalletBladRapportHeaderImage '
        Versie{Prop:SQL} = SQLCommando
        IF error() then Stop(Error()& FileError()&' bij prop:SQL ' & SQLCommando).        
        SQLCommando='ALTER TABLE [dbo].[Relatie_SyncExact] ADD PaymentCondition char(2), PalletBladRapportHeaderImage varchar(512)'
        Versie{Prop:SQL} = SQLCommando
        IF error() then Stop(Error()& FileError()&' bij prop:SQL ' & SQLCommando).        
        
        VRS:Versie = Loc:Versie
		VRS:DatumTijd_DATE = Today()
		VRS:DatumTijd_TIME = Clock()
		VRS:Wijzigingen= 'Velden toegevoegd voor orderbevestiging'
		Access:Versie.Insert()
		LOC:ToonWijziging = false
	End


of 2.68 ! 18-04-2017
	Clear(VRS:Record)
	VRS:Versie=Loc:Versie
	If Access:Versie.Fetch(VRS:Versie_PK)
	
        SQLCommando='ALTER TABLE [dbo].[Inkoop] ADD RedenRetour Varchar(50) '
        Versie{Prop:SQL} = SQLCommando
        IF error() then Stop(Error()& FileError()&' bij prop:SQL(2) ' & SQLCommando).        
        
        VRS:Versie = Loc:Versie
		VRS:DatumTijd_DATE = Today()
		VRS:DatumTijd_TIME = Clock()
		VRS:Wijzigingen= 'Inkoop toevoegen reden retour, datums leegmaken bij kopieren'
		Access:Versie.Insert()
		LOC:ToonWijziging = false
	End


of 2.67 ! 12-01-2017
	Clear(VRS:Record)
	VRS:Versie=Loc:Versie
	If Access:Versie.Fetch(VRS:Versie_PK)
	
        SQLCommando='ALTER TABLE [dbo].[Verkoop] ADD RedenRetour Varchar(50) '
        Versie{Prop:SQL} = SQLCommando
        IF error() then Stop(Error()& FileError()&' bij prop:SQL(2) ' & SQLCommando).        
        
        VRS:Versie = Loc:Versie
		VRS:DatumTijd_DATE = Today()
		VRS:DatumTijd_TIME = Clock()
		VRS:Wijzigingen= 'Verkoop toevoegen reden retour'
		Access:Versie.Insert()
		LOC:ToonWijziging = false
	End


of 2.66 ! 23-12-2016
	Clear(VRS:Record)
	VRS:Versie=Loc:Versie
	If Access:Versie.Fetch(VRS:Versie_PK)
	
        SQLCommando='ALTER TABLE [dbo].[Verkoop] ADD NegatieveOrder Varchar(50) '
        Versie{Prop:SQL} = SQLCommando
        IF error() then Stop(Error()& FileError()&' bij prop:SQL(2) ' & SQLCommando).        
        
        VRS:Versie = Loc:Versie
		VRS:DatumTijd_DATE = Today()
		VRS:DatumTijd_TIME = Clock()
		VRS:Wijzigingen= 'Verkoop toevoegen nagatieveorder '
		Access:Versie.Insert()
		LOC:ToonWijziging = false
	End


of 2.65 ! 8-12-2016
	Clear(VRS:Record)
	VRS:Versie=Loc:Versie
	If Access:Versie.Fetch(VRS:Versie_PK)
	
		SQLCommando= 'CREATE TABLE [dbo].[KostenStamgeg]( '&|
			'[KostenID] [int] IDENTITY(1,1) NOT NULL, '&|
			'[Omschrijving] [varchar](60) NULL, '&|
			'[Soort] [char] NULL, '&|
			'[Prijs] [DECIMAL](11,3) NULL '&|
			' CONSTRAINT [PK_KostenStamgeg] PRIMARY KEY CLUSTERED '&|
			'( '&|
			'	[KostenID] ASC '&|
			')WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY] '&|
			') ON [PRIMARY]'
		Versie{Prop:SQL} = SQLCommando
		IF error() then Stop(Error()& FileError()&' bij prop:SQL(1) ' & SQLCommando).
		
        SQLCommando='ALTER TABLE [dbo].[Planning] ADD ExtraKosten Decimal(11,3) '
        Versie{Prop:SQL} = SQLCommando
        IF error() then Stop(Error()& FileError()&' bij prop:SQL(2) ' & SQLCommando).        

        
		SQLCommando= 'CREATE TABLE [dbo].[ExtraKosten]( '&|
			'[ExtraKostenID] [int] IDENTITY(1,1) NOT NULL, '&|
			'[KostenID] [int] NOT NULL, '&|
			'[VerkoopID] [int] NULL, '&|
			'[InkoopID] [int] NULL, '&|
			'[PlanningID] [int] NULL, '&|
			'[Aantal] [Decimal](10,2) NULL, '&|
			'[Prijs] [DECIMAL](11,3) NULL, '&|
			'[ExtraKosten] [DECIMAL](11,3) NULL '&|
			' CONSTRAINT [PK_ExtraKosten] PRIMARY KEY CLUSTERED '&|
			'( '&|
			'	[ExtraKostenID] ASC '&|
			')WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY] '&|
			') ON [PRIMARY]'
		Versie{Prop:SQL} = SQLCommando
        IF error() then Stop(Error()& FileError()&' bij prop:SQL(3) ' & SQLCommando).
        
        SQLCommando='CREATE NONCLUSTERED INDEX [FK1_ExtraKosten] ON [dbo].[ExtraKosten] '&|
            '('&|
	        '[VerkoopID] ASC,'&|
	        '[KostenID] ASC'&|
            ')WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]'
        Versie{Prop:SQL} = SQLCommando
        IF error() then Stop(Error()& FileError()&' bij prop:SQL(4) ' & SQLCommando).        
        
        SQLCommando='CREATE NONCLUSTERED INDEX [FK2_ExtraKosten] ON [dbo].[ExtraKosten] '&|
            '('&|
	        '[InkoopID] ASC,'&|
	        '[KostenID] ASC'&|
            ')WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]'
        Versie{Prop:SQL} = SQLCommando
        IF error() then Stop(Error()& FileError()&' bij prop:SQL(5) ' & SQLCommando).        

        SQLCommando='CREATE NONCLUSTERED INDEX [FK3_ExtraKosten] ON [dbo].[ExtraKosten] '&|
            '('&|
	        '[PlanningID] ASC,'&|
	        '[KostenID] ASC'&|
            ')WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]'
        Versie{Prop:SQL} = SQLCommando
        IF error() then Stop(Error()& FileError()&' bij prop:SQL(6) ' & SQLCommando).        
        
        VRS:Versie = Loc:Versie
		VRS:DatumTijd_DATE = Today()
		VRS:DatumTijd_TIME = Clock()
		VRS:Wijzigingen= 'KostenStamGeg., extrakosten tabel toegevoegd'
		Access:Versie.Insert()
		LOC:ToonWijziging = false
	End


of 2.64 ! 09-11-2016
	Clear(VRS:Record)
	VRS:Versie=Loc:Versie
    If Access:Versie.Fetch(VRS:Versie_PK)
       
        SQLCommando='DROP VIEW [dbo].[ViewRelatie];'
        Versie{Prop:SQL} = SQLCommando
        IF error() then Stop(Error()& FileError()&' bij prop:SQL ' & SQLCommando).        
        
        SQLCommando='CREATE VIEW [dbo].[ViewRelatie] '&|
                'AS '&|
                'SELECT     [010].dbo.cicmpy.ID AS RelatieID, [010].dbo.cicmpy.cmp_name AS FirmaNaam, [010].dbo.cicmpy.cmp_fadd1 AS Adres1, '&|
                      '[010].dbo.cicmpy.cmp_fadd2 AS Adres2, [010].dbo.cicmpy.cmp_fpc AS Postcode, [010].dbo.cicmpy.cmp_fcity AS Plaats, '&|
                      '[010].dbo.cicmpy.cmp_tel AS Telefoon, [010].dbo.cicmpy.cmp_Directory AS Mobiel, [010].dbo.cicmpy.cmp_fax AS Fax, '&|
                      '[010].dbo.cicmpy.cmp_type AS Type, [010].dbo.land.oms60_0 AS Country, [010].dbo.cicmpy.ItemCode '&|
                'FROM         [010].dbo.cicmpy INNER JOIN '&|
                      '[010].dbo.land ON [010].dbo.cicmpy.cmp_fctry = [010].dbo.land.landcode '&|
                'WHERE [010].dbo.cicmpy.cmp_status NOT IN (<39>E<39>,<39>B<39>) '
        Versie{Prop:SQL} = SQLCommando
        IF error() then Stop(Error()& FileError()&' bij prop:SQL ' & SQLCommando).        

        SQLCommando='DROP VIEW [dbo].[ViewArtikel];'
        Versie{Prop:SQL} = SQLCommando
        IF error() then Stop(Error()& FileError()&' bij prop:SQL ' & SQLCommando).        
        
        SQLCommando='CREATE VIEW [dbo].[ViewArtikel] '&|
            'AS '&|
            'SELECT     ItemCode AS ArtikelID, '&|
            'Description AS ArtikelOms, '&|
            'Assortment AS ArtikelGroep, '&|
            'CostPriceStandard  AS Prijs '&|
            'FROM         [010].dbo.Items WHERE     (Type = <39>S<39>) AND (Condition = <39>A<39>);'
        Versie{Prop:SQL} = SQLCommando
        IF error() then Stop(Error()& FileError()&' bij prop:SQL ' & SQLCommando).        
        
        SQLCommando='ALTER TABLE [dbo].[Artikel_SyncExact] ADD Prijs float '
        Versie{Prop:SQL} = SQLCommando
        IF error() then Stop(Error()& FileError()&' bij prop:SQL ' & SQLCommando).        
        
        SQLCommando='ALTER TABLE [dbo].[Planning] ADD Valuta varchar(50), '&|
            'Koersverschil decimal(11,3) '
        Versie{Prop:SQL} = SQLCommando
        IF error() then Stop(Error()& FileError()&' bij prop:SQL ' & SQLCommando).        
        
		VRS:Versie = Loc:Versie
		VRS:DatumTijd_DATE = Today()
		VRS:DatumTijd_TIME = Clock()
        VRS:Wijzigingen= 'In View Relaties Geblokkeerd en Niet actief gefilterd, de Prijs toegevoegd in de view artikel, In de verkoopregel valuta en koersverschil'
		Access:Versie.Insert()
		
		LOC:ToonWijziging = true
	End
of 2.63 ! 25-03-2016
	Clear(VRS:Record)
	VRS:Versie=Loc:Versie
    If Access:Versie.Fetch(VRS:Versie_PK)
       
        SQLCommando='ALTER TABLE [dbo].[PalletBladSjabloon] ADD NaOntdooien varchar(50), '&|
            'TransportEnOpslag varchar(50) '
        Versie{Prop:SQL} = SQLCommando
        IF error() then Stop(Error()& FileError()&' bij prop:SQL ' & SQLCommando).        
        
		VRS:Versie = Loc:Versie
		VRS:DatumTijd_DATE = Today()
		VRS:DatumTijd_TIME = Clock()
        VRS:Wijzigingen= 'Palletbladen uitbreiden met na ontdooien en transport en opslag'
		Access:Versie.Insert()
		
		LOC:ToonWijziging = true
	End
of 2.62 ! 02-0032016
	Clear(VRS:Record)
	VRS:Versie=Loc:Versie
    If Access:Versie.Fetch(VRS:Versie_PK)
		VRS:Versie = Loc:Versie
		VRS:DatumTijd_DATE = Today()
		VRS:DatumTijd_TIME = Clock()
        VRS:Wijzigingen= 'Bug eruit gehaald in de inkoop kopieer knop'
		Access:Versie.Insert()
		
		LOC:ToonWijziging = true
	End
of 2.61 ! 16-02-2016
	Clear(VRS:Record)
	VRS:Versie=Loc:Versie
    If Access:Versie.Fetch(VRS:Versie_PK)
        SQLCommando='ALTER TABLE [dbo].[CelArtikelVoorraad] ADD ArtikelOms varchar(50) '
        Versie{Prop:SQL} = SQLCommando
        IF error() then Stop(Error()& FileError()&' bij prop:SQL ' & SQLCommando).        
               
		VRS:Versie = Loc:Versie
		VRS:DatumTijd_DATE = Today()
		VRS:DatumTijd_TIME = Clock()
        VRS:Wijzigingen= 'Gemaakt met Clarion 10. Bug eruit gehaald in de inkoop bij het hereberekenen van de eerste order. Snelheidslogging uit de inkoop gehaald '
		Access:Versie.Insert()
		
		LOC:ToonWijziging = true
	End
of 2.60 ! 08-01-2016
	Clear(VRS:Record)
	VRS:Versie=Loc:Versie
    If Access:Versie.Fetch(VRS:Versie_PK)
        SQLCommando='ALTER TABLE [dbo].[Inkoop] ADD TransportKosten decimal(11,3) '
        Versie{Prop:SQL} = SQLCommando
        IF error() then Stop(Error()& FileError()&' bij prop:SQL ' & SQLCommando).        
        
        SQLCommando='UPDATE [dbo].[Inkoop]  SET TransportKosten = ExtraKosten '
        Versie{Prop:SQL} = SQLCommando
        IF error() then Stop(Error()& FileError()&' bij prop:SQL ' & SQLCommando).        
        
        SQLCommando='UPDATE [dbo].[Inkoop]  SET ExtraKosten = 0 '
        Versie{Prop:SQL} = SQLCommando
        IF error() then Stop(Error()& FileError()&' bij prop:SQL ' & SQLCommando).        
        
		VRS:Versie = Loc:Versie
		VRS:DatumTijd_DATE = Today()
		VRS:DatumTijd_TIME = Clock()
        VRS:Wijzigingen= 'Inkoop uitbreiden met Extrakosten (was transportkosten) '
		Access:Versie.Insert()
		
		LOC:ToonWijziging = true
	End
of 2.59 ! 10-04-2015
	Clear(VRS:Record)
	VRS:Versie=Loc:Versie
    If Access:Versie.Fetch(VRS:Versie_PK)
        SQLCommando='ALTER TABLE [dbo].[Planning] ADD UitslagPalletbladOriginLiveBird varchar(50), '&|
            'UitslagPalletbladOriginSlautherHouse varchar(50), '&|
            'UitslagPalletbladOriginProcessing varchar(50), '&|
            'UitslagPalletbladOriginPacking varchar(50) '
        Versie{Prop:SQL} = SQLCommando
        IF error() then Stop(Error()& FileError()&' bij prop:SQL ' & SQLCommando).        
        
        SQLCommando='ALTER TABLE [dbo].[Mutatie] ADD UitslagPalletbladOriginLiveBird varchar(50), '&|
            'UitslagPalletbladOriginSlautherHouse varchar(50), '&|
            'UitslagPalletbladOriginProcessing varchar(50), '&|
            'UitslagPalletbladOriginPacking varchar(50) '
        Versie{Prop:SQL} = SQLCommando
        IF error() then Stop(Error()& FileError()&' bij prop:SQL ' & SQLCommando).        
        
        SQLCommando='ALTER TABLE [dbo].[PalletBladSjabloon] ADD OriginLiveBird varchar(50), '&|
            'OriginSlautherHouse varchar(50), '&|
            'OriginProcessing varchar(50), '&|
            'OriginPacking varchar(50) '
        Versie{Prop:SQL} = SQLCommando
        IF error() then Stop(Error()& FileError()&' bij prop:SQL ' & SQLCommando).        
        
		VRS:Versie = Loc:Versie
		VRS:DatumTijd_DATE = Today()
		VRS:DatumTijd_TIME = Clock()
        VRS:Wijzigingen= 'Palletbladen uitbreiden met origin live birds, slauther house, processing, packing'
		Access:Versie.Insert()
		
		LOC:ToonWijziging = true
	End
of 2.58 ! 30-10-2014
	Clear(VRS:Record)
	VRS:Versie=Loc:Versie
    If Access:Versie.Fetch(VRS:Versie_PK)
		VRS:Versie = Loc:Versie
		VRS:DatumTijd_DATE = Today()
		VRS:DatumTijd_TIME = Clock()
        VRS:Wijzigingen= 'Snelheidsmeetpunten toegevoegd bij kopieren inkoop en in de ASK van de browse in en verkoop de reset eruit gesloopt.'
		Access:Versie.Insert()
		
		LOC:ToonWijziging = true
	End
of 2.57 ! 24-9-2014
	Clear(VRS:Record)
	VRS:Versie=Loc:Versie
    If Access:Versie.Fetch(VRS:Versie_PK)
		VRS:Versie = Loc:Versie
		VRS:DatumTijd_DATE = Today()
		VRS:DatumTijd_TIME = Clock()
        VRS:Wijzigingen= 'Probleem met het blijven hangen van Excel nadat deze is afgesloten, opgelost.'
		Access:Versie.Insert()
		
		LOC:ToonWijziging = true
	End
of 2.56 ! 16-9-2014
	Clear(VRS:Record)
	VRS:Versie=Loc:Versie
    If Access:Versie.Fetch(VRS:Versie_PK)
		VRS:Versie = Loc:Versie
		VRS:DatumTijd_DATE = Today()
		VRS:DatumTijd_TIME = Clock()
        VRS:Wijzigingen= 'Snelheidslogging toegevoegd in het inkoopscherm.'
		Access:Versie.Insert()
		
		LOC:ToonWijziging = true
	End
of 2.55 ! 5-9-2014
	Clear(VRS:Record)
	VRS:Versie=Loc:Versie
    If Access:Versie.Fetch(VRS:Versie_PK)
		VRS:Versie = Loc:Versie
		VRS:DatumTijd_DATE = Today()
		VRS:DatumTijd_TIME = Clock()
        VRS:Wijzigingen= 'Snelheidslogging toegevoegd in het verkoopscherm.'
		Access:Versie.Insert()
		
		LOC:ToonWijziging = true
	End
of 2.54 ! 14-4-2014
	Clear(VRS:Record)
	VRS:Versie=Loc:Versie
    If Access:Versie.Fetch(VRS:Versie_PK)
		VRS:Versie = Loc:Versie
		VRS:DatumTijd_DATE = Today()
		VRS:DatumTijd_TIME = Clock()
        VRS:Wijzigingen= 'Weegscherm verkleint en melding onbekende COM-port niet meer tonen als de COM-string leeg is. Exporteren van palletverloop voor transporteurs werkt nu ook.'
		Access:Versie.Insert()
		
		LOC:ToonWijziging = true
	End
of 2.53 ! 14-4-2014
	Clear(VRS:Record)
	VRS:Versie=Loc:Versie
    If Access:Versie.Fetch(VRS:Versie_PK)
		VRS:Versie = Loc:Versie
		VRS:DatumTijd_DATE = Today()
		VRS:DatumTijd_TIME = Clock()
        VRS:Wijzigingen= 'Weegscherm verkleint en melding onbekende COM-port niet meer tonen als de COM-string leeg is.'
		Access:Versie.Insert()
		
		LOC:ToonWijziging = true
	End
of 2.52 ! 11-4-2014
	Clear(VRS:Record)
	VRS:Versie=Loc:Versie
    If Access:Versie.Fetch(VRS:Versie_PK)
		VRS:Versie = Loc:Versie
		VRS:DatumTijd_DATE = Today()
		VRS:DatumTijd_TIME = Clock()
        VRS:Wijzigingen= 'Nieuwe versie ontwikkelomgeving (C9). Extra knop om palletblad direct 2x te printen in weegscherm.'
		Access:Versie.Insert()
		
		LOC:ToonWijziging = true
	End
of 2.51 ! 10-3-2014
	Clear(VRS:Record)
	VRS:Versie=Loc:Versie
    If Access:Versie.Fetch(VRS:Versie_PK)
		VRS:Versie = Loc:Versie
		VRS:DatumTijd_DATE = Today()
		VRS:DatumTijd_TIME = Clock()
        VRS:Wijzigingen= 'Pallet.Cel combinatie is nu met 5 voorloopnullen zodat een alfanumerieke sortering ook goed werkt.'
		Access:Versie.Insert()
		
		LOC:ToonWijziging = true
	End
of 2.50 ! 28-2-2014
	Clear(VRS:Record)
	VRS:Versie=Loc:Versie
    If Access:Versie.Fetch(VRS:Versie_PK)
		VRS:Versie = Loc:Versie
		VRS:DatumTijd_DATE = Today()
		VRS:DatumTijd_TIME = Clock()
        VRS:Wijzigingen= 'Extra tabel met niet-wijzigende gewogen palletnummers toegevoegd die op de palletbladen(exports) komen. Juiste relatienaam tonen op de Excel-export bij het palletverloop.'
		Access:Versie.Insert()
		
		LOC:ToonWijziging = true
	End
of 2.49 ! 30-1-2014
	Clear(VRS:Record)
	VRS:Versie=Loc:Versie
    If Access:Versie.Fetch(VRS:Versie_PK)
		VRS:Versie = Loc:Versie
		VRS:DatumTijd_DATE = Today()
		VRS:DatumTijd_TIME = Clock()
        VRS:Wijzigingen= 'Bij het instellen van de palletexportdirectory, verandert de werkdirectory niet meer en wordt de diectory goed weggeschreven.'
		Access:Versie.Insert()
		
		LOC:ToonWijziging = true
	End
of 2.48 ! 2-12-2013
	Clear(VRS:Record)
	VRS:Versie=Loc:Versie
    If Access:Versie.Fetch(VRS:Versie_PK)
		VRS:Versie = Loc:Versie
		VRS:DatumTijd_DATE = Today()
		VRS:DatumTijd_TIME = Clock()
        VRS:Wijzigingen= 'Fout bij het automatisch wijzigen van de artikelomschrijving als een ander artikel wordt geselecteerd bij het invoeren van de verkoopregel verholpen.'
		Access:Versie.Insert()
		
		LOC:ToonWijziging = true
	End
of 2.47 ! 29-11-2013
	Clear(VRS:Record)
	VRS:Versie=Loc:Versie
    If Access:Versie.Fetch(VRS:Versie_PK)
		VRS:Versie = Loc:Versie
		VRS:DatumTijd_DATE = Today()
		VRS:DatumTijd_TIME = Clock()
        VRS:Wijzigingen= 'Inslagrapport gerepareerd. Weergave inkoop/verkoop-id bij het invoeren van de inkoop/verkoop. Beveiliging voor niet tonen van nog-te-inserten inkopen/verkopen.'
		Access:Versie.Insert()
		
		LOC:ToonWijziging = true
	End
of 2.46 ! 18-11-2013
	Clear(VRS:Record)
	VRS:Versie=Loc:Versie
    If Access:Versie.Fetch(VRS:Versie_PK)
		VRS:Versie = Loc:Versie
		VRS:DatumTijd_DATE = Today()
		VRS:DatumTijd_TIME = Clock()
        VRS:Wijzigingen= ''
		Access:Versie.Insert()
		
		LOC:ToonWijziging = true
	End
of 2.45 ! 7-10-2013
	Clear(VRS:Record)
	VRS:Versie=Loc:Versie
    If Access:Versie.Fetch(VRS:Versie_PK)
		VRS:Versie = Loc:Versie
		VRS:DatumTijd_DATE = Today()
		VRS:DatumTijd_TIME = Clock()
        VRS:Wijzigingen= 'Annuleren van het kopieren van een verkoop, verwijderd ook de bijbehorende verkoopregels van die geannuleerde verkoop. De maximale omvang van de tekstblokken op het Inkoop/Verkoop-rapport vergroot.'
		Access:Versie.Insert()
		
		LOC:ToonWijziging = true
	End
of 2.44 ! 6-9-2013
	Clear(VRS:Record)
	VRS:Versie=Loc:Versie
    If Access:Versie.Fetch(VRS:Versie_PK)
		VRS:Versie = Loc:Versie
		VRS:DatumTijd_DATE = Today()
		VRS:DatumTijd_TIME = Clock()
        VRS:Wijzigingen= 'Beveiliging wijzigingen van uitgevoerde planningregels teruggedraaid. Tweede keer openen van activiteiten-tab gefixt. Extra kosten tekstblok bij de inkoop vastgezet qua locatie/grootte.'
		Access:Versie.Insert()
		
		LOC:ToonWijziging = true
	End
of 2.43 ! 6-9-2013
    !ALTER TABLE dbo.Planning ADD AlternatieveArtikelOms VARCHAR(200), VerpakkingKlasseID int, AantalVerpakkingen int
    !ALTER TABLE dbo.Mutatie ADD AlternatieveArtikelOms VARCHAR(200), AantalVerpakkingen int
    !ALTER TABLE dbo.Partij ADD VerpakkingKlasseID int

	Clear(VRS:Record)
	VRS:Versie=Loc:Versie
    If Access:Versie.Fetch(VRS:Versie_PK)
		VRS:Versie = Loc:Versie
		VRS:DatumTijd_DATE = Today()
		VRS:DatumTijd_TIME = Clock()
        VRS:Wijzigingen= 'Alternatieve artikelomschrijving per verkoopregel mogelijkheid. Excel-export planning geeft nu ook op de tabbladen Inkoop/Overboeking/Verkoop ook de juiste gegevens voor de gewenste dag. Wijzigingen van uitgevoerde planningregels geblokkeerd.'
		Access:Versie.Insert()
		
		LOC:ToonWijziging = true
	End
of 2.42 ! 22-8-2013
	Clear(VRS:Record)
	VRS:Versie=Loc:Versie
    If Access:Versie.Fetch(VRS:Versie_PK)
		VRS:Versie = Loc:Versie
		VRS:DatumTijd_DATE = Today()
		VRS:DatumTijd_TIME = Clock()
        VRS:Wijzigingen= 'Palletsticker printen via verkoopregels in de planning. Knoppen op de planning geherordend.'
		Access:Versie.Insert()
		
		LOC:ToonWijziging = true
	End
of 2.41 ! 25-7-2013
	Clear(VRS:Record)
	VRS:Versie=Loc:Versie
    If Access:Versie.Fetch(VRS:Versie_PK)
		VRS:Versie = Loc:Versie
		VRS:DatumTijd_DATE = Today()
		VRS:DatumTijd_TIME = Clock()
        VRS:Wijzigingen= 'Tab-volgorde bij invoer verkoop-regels aangepast.'
		Access:Versie.Insert()
		
		LOC:ToonWijziging = true
	End
of 2.40 ! 23-7-2013
	Clear(VRS:Record)
	VRS:Versie=Loc:Versie
    If Access:Versie.Fetch(VRS:Versie_PK)
		VRS:Versie = Loc:Versie
		VRS:DatumTijd_DATE = Today()
		VRS:DatumTijd_TIME = Clock()
        VRS:Wijzigingen= 'Herkomst Cel-kolom toegevoegd in de planning om de oorspronkelijke cel te zien van waaruit een aan een overboeking gekoppelde verkoop komt. De palletblad-data worden bij het annuleren van het doen van een weging ook opgeslagen.'
		Access:Versie.Insert()
		
		LOC:ToonWijziging = true
	End
of 2.39 ! 15-7-2013
	Clear(VRS:Record)
	VRS:Versie=Loc:Versie
    If Access:Versie.Fetch(VRS:Versie_PK)
		VRS:Versie = Loc:Versie
		VRS:DatumTijd_DATE = Today()
		VRS:DatumTijd_TIME = Clock()
        VRS:Wijzigingen= 'Toevoeging van klant-afhankelijke artikelomschrijvingen. Palletblad-datums kunnen al bij de geplande verkoopregels worden ingevuld. Na toevoegen van nieuwe Transfer springt de selectiebalk op die nieuwe transfer.'
		Access:Versie.Insert()
		
		LOC:ToonWijziging = true
	End
of 2.38 ! 17-6-2013
	Clear(VRS:Record)
	VRS:Versie=Loc:Versie
    If Access:Versie.Fetch(VRS:Versie_PK)
		VRS:Versie = Loc:Versie
		VRS:DatumTijd_DATE = Today()
		VRS:DatumTijd_TIME = Clock()
        VRS:Wijzigingen= 'De transfer-uitvoerdatum wijzigt de planningsdatum van de gekoppelde nog niet overgeboekte overboekingen.'
		Access:Versie.Insert()
		
		LOC:ToonWijziging = true
	End
of 2.37 ! 5-6-2013
	Clear(VRS:Record)
	VRS:Versie=Loc:Versie
    If Access:Versie.Fetch(VRS:Versie_PK)
        SQLCommando='ALTER TABLE [dbo].[Activiteit] ADD Uitgevoerd tinyint'
        Versie{Prop:SQL} = SQLCommando
        IF error() then Stop(Error()& FileError()&' bij prop:SQL ' & SQLCommando).        
        
		VRS:Versie = Loc:Versie
		VRS:DatumTijd_DATE = Today()
		VRS:DatumTijd_TIME = Clock()
		!VRS:Wijzigingen= 'Meerdere inslagen naar dezelfde cel maar verschillende locaties. Palletbladen (Abbelen)'
        VRS:Wijzigingen= 'Overzicht activiteiten en mogelijkheid om ze af te kunnen vinken.'
		Access:Versie.Insert()
		
		LOC:ToonWijziging = true
	End
of 2.36 ! 17-5-2013
	Clear(VRS:Record)
	VRS:Versie=Loc:Versie
    If Access:Versie.Fetch(VRS:Versie_PK)
		VRS:Versie = Loc:Versie
		VRS:DatumTijd_DATE = Today()
		VRS:DatumTijd_TIME = Clock()
        VRS:Wijzigingen= 'Rood vakje als indicator aan planning toegevoegd die aangeeft wanneer er activiteiten op een dag zijn (is wel Windows Vista compatible, terwijl gekleurde tabbladen dat niet zijn). Verkoopplanning-regel wordt niet meer gecleard bij toevoegen van een Activiteit. Locale SQL-datumconversie variable uit de bindfield gehaald bij het overzicht van de Transfers zodat deze direct zichtbaar is bij het toevoegen van een nieuwe transfer. Waarschuwingen voor niet kloppende Exact-artikelnummers bij de palletbladen onderdrukt, het reguliere artikelnummer wordt gebruikt bij problemen.'
		Access:Versie.Insert()
		
		LOC:ToonWijziging = true
	End
of 2.35 ! 17-5-2013
	Clear(VRS:Record)
	VRS:Versie=Loc:Versie
    If Access:Versie.Fetch(VRS:Versie_PK)
		VRS:Versie = Loc:Versie
		VRS:DatumTijd_DATE = Today()
		VRS:DatumTijd_TIME = Clock()
        VRS:Wijzigingen= '"Neem Voorraad" knoppen toegevoegd bij de reguliere uitslag en het doen van een overboeking. Palletblad-datum labels van Duits naar Nederland. Activiteit-tab wordt rood op de planning als er iets in staat.'
		Access:Versie.Insert()
		
		LOC:ToonWijziging = true
	End
of 2.34 ! 6-5-2013
	Clear(VRS:Record)
	VRS:Versie=Loc:Versie
    If Access:Versie.Fetch(VRS:Versie_PK)
		VRS:Versie = Loc:Versie
		VRS:DatumTijd_DATE = Today()
		VRS:DatumTijd_TIME = Clock()
        VRS:Wijzigingen= 'Bij overboeking naar meerdere cellen wordt niet meer op negatieve pallet-voorraadstanden gecontroleerd. Palletblad: vertalingen toegevoegd / extra leverancier en klant-kopomschrijving / standaard logo.'
		Access:Versie.Insert()
		
		LOC:ToonWijziging = true
	End
    
of 2.33 ! 22-4-2013
	Clear(VRS:Record)
	VRS:Versie=Loc:Versie
    If Access:Versie.Fetch(VRS:Versie_PK)
		VRS:Versie = Loc:Versie
		VRS:DatumTijd_DATE = Today()
		VRS:DatumTijd_TIME = Clock()
        VRS:Wijzigingen= 'Overboeken naar meerdere cellen. Overboek-regels in de planning vallen niet meer zomaar weg. Verpakking / Leverancier + Verpakking op Excel-export van de Planning. Partijvoorraad laat ook partij/cel voorraden van 0 zien, indien er wel kilos verkocht zijn vanuit die partij/cel (idem bij het invoeren v/d verkoop). Verkoop-activiteiten toegevoegd.'
		Access:Versie.Insert()
		
		LOC:ToonWijziging = true
	End
of 2.32 ! 18-4-2013
	Clear(VRS:Record)
	VRS:Versie=Loc:Versie
    If Access:Versie.Fetch(VRS:Versie_PK)
		VRS:Versie = Loc:Versie
		VRS:DatumTijd_DATE = Today()
		VRS:DatumTijd_TIME = Clock()
        VRS:Wijzigingen= 'Probleem met ophalen "extra artikelomschrijving" bij het printen v/d palletbladen. Bij de Palletbladen-knop via de planning kan je per weging de previews bekijken / of alle palletbladen printen in 1 keer. Waarschuwing voor de niet-numerieke artikelnummer bij het printen van de palletbladen gerepareerd, bij het printen van alle palletbladen wordt vooraf gecontroleerd, zodat er maar 1 popup komt.'
		Access:Versie.Insert()
		
		LOC:ToonWijziging = true
	End
of 2.31 ! 16-4-2013
	Clear(VRS:Record)
	VRS:Versie=Loc:Versie
    If Access:Versie.Fetch(VRS:Versie_PK)
		VRS:Versie = Loc:Versie
		VRS:DatumTijd_DATE = Today()
		VRS:DatumTijd_TIME = Clock()
        VRS:Wijzigingen= 'Waarschuwing toegevoegd als palletblad-rapport geen of een niet-numerieke artikelnummer wil printen.'
		Access:Versie.Insert()
		
		LOC:ToonWijziging = true
	End
of 2.30 ! 5-4-2013
	Clear(VRS:Record)
	VRS:Versie=Loc:Versie
    If Access:Versie.Fetch(VRS:Versie_PK)
		VRS:Versie = Loc:Versie
		VRS:DatumTijd_DATE = Today()
		VRS:DatumTijd_TIME = Clock()
        VRS:Wijzigingen= 'Voorraad-window eenmalig laten openen / Cel-locatie-queue per thread opbouwen'
		Access:Versie.Insert()
		
		LOC:ToonWijziging = true
	End
of 2.29 ! 5-4-2013
	Clear(VRS:Record)
	VRS:Versie=Loc:Versie
    If Access:Versie.Fetch(VRS:Versie_PK)
		VRS:Versie = Loc:Versie
		VRS:DatumTijd_DATE = Today()
		VRS:DatumTijd_TIME = Clock()
        VRS:Wijzigingen= 'Palletbladen: Doorgeven artikel gefixt zodat ook artikelnummer met letters ondersteund worden / Print-preview bij het printen van een individuele weging (niet via het Weeg-scherm)'
		Access:Versie.Insert()
		
		LOC:ToonWijziging = true
	End
of 2.28 ! 5-4-2013
	Clear(VRS:Record)
	VRS:Versie=Loc:Versie
    If Access:Versie.Fetch(VRS:Versie_PK)
		VRS:Versie = Loc:Versie
		VRS:DatumTijd_DATE = Today()
		VRS:DatumTijd_TIME = Clock()
        VRS:Wijzigingen= 'Palletbladen: Header-adressen toegevoegd / Artikel-nummer bepaling toegevoegd uit Extra Artikel-omschrijving. PartijVoorraad-scherm wijzigingen i.v.m. crashes.'
		Access:Versie.Insert()
		
		LOC:ToonWijziging = true
	End
of 2.27 ! 25-3-2013
	Clear(VRS:Record)
	VRS:Versie=Loc:Versie
    If Access:Versie.Fetch(VRS:Versie_PK)
!        SQLCommando='CREATE TABLE [dbo].[PalletBladRapport]('&|
!            '[PalletBladRapportID] [int] IDENTITY(1,1) NOT NULL,'&|
!            '[WegingID] [int] NULL,'&|
!            '[MutatieID] [int] NULL,'&|
!            '[DueDate12] [datetime] NULL,'&|
!            '[ProductionDate11] [datetime] NULL,'&|
!            '[SellByDate15] [datetime] NULL,'&|
!            '[CustomerPurchaseOrderNumber400] [varchar](30) NULL,'&|
!            '[CustomerPartNumber241] [varchar](50) NULL,'&|
!            '[CustomerPartOmschrijving] [varchar](100) NULL,'&|
!            '[ProductNetWeight310] [decimal](18, 2) NULL,'&|
!            'CONSTRAINT [PK_PalletBladRapport] PRIMARY KEY CLUSTERED '&|
!            '('&|
!            '[PalletBladRapportID] ASC'&|
!            ')WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]'&|
!            ') ON [PRIMARY]'
!        Versie{Prop:SQL} = SQLCommando
!        IF error() then Stop(Error()& FileError()&' bij prop:SQL ' & SQLCommando).
!
!        SQLCommando='CREATE NONCLUSTERED INDEX [FK1_PalletBladRapport] ON [dbo].[PalletBladRapport] '&|
!            '('&|
!	        '[WegingID] ASC,'&|
!	        '[PalletBladRapportID] ASC'&|
!            ')WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]'
!        Versie{Prop:SQL} = SQLCommando
!        IF error() then Stop(Error()& FileError()&' bij prop:SQL ' & SQLCommando).        
!        
!        SQLCommando='CREATE NONCLUSTERED INDEX [FK2_PalletBladRapport] ON [dbo].[PalletBladRapport] '&|
!            '('&|
!	        '[MutatieID] ASC,'&|
!	        '[PalletBladRapportID] ASC'&|
!            ')WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]'
!        Versie{Prop:SQL} = SQLCommando
!        IF error() then Stop(Error()& FileError()&' bij prop:SQL ' & SQLCommando).        

        SQLCommando='ALTER TABLE [dbo].[Relatie_SyncExact] ADD PalletBladRapportHeaderImage varchar(512)'
        Versie{Prop:SQL} = SQLCommando
        IF error() then Stop(Error()& FileError()&' bij prop:SQL ' & SQLCommando).        

        SQLCommando='ALTER TABLE [dbo].[Verkoop] ADD ExternVerkoopID varchar(50)'
        Versie{Prop:SQL} = SQLCommando
        IF error() then Stop(Error()& FileError()&' bij prop:SQL ' & SQLCommando).        

        SQLCommando='ALTER TABLE [dbo].[Mutatie] ADD UitslagPalletbladDueDate12 datetime'
        Versie{Prop:SQL} = SQLCommando
        IF error() then Stop(Error()& FileError()&' bij prop:SQL ' & SQLCommando).        
        
        SQLCommando='ALTER TABLE [dbo].[Mutatie] ADD UitslagPalletbladProductionDate11 datetime'
        Versie{Prop:SQL} = SQLCommando
        IF error() then Stop(Error()& FileError()&' bij prop:SQL ' & SQLCommando).        
        
        SQLCommando='ALTER TABLE [dbo].[Mutatie] ADD UitslagPalletbladSellByDate15 datetime'
        Versie{Prop:SQL} = SQLCommando
        IF error() then Stop(Error()& FileError()&' bij prop:SQL ' & SQLCommando).        
        
		VRS:Versie = Loc:Versie
		VRS:DatumTijd_DATE = Today()
		VRS:DatumTijd_TIME = Clock()
		!VRS:Wijzigingen= 'Meerdere inslagen naar dezelfde cel maar verschillende locaties. Palletbladen (Abbelen)'
        VRS:Wijzigingen= 'Meerdere inslagen naar dezelfde cel maar verschillende locaties. Palletbladen (Abbelen)'
		Access:Versie.Insert()
		
		LOC:ToonWijziging = true
	End
of 2.26 ! 4-1-2013
	Clear(VRS:Record)
	VRS:Versie=Loc:Versie
	If Access:Versie.Fetch(VRS:Versie_PK)
		VRS:Versie = Loc:Versie
		VRS:DatumTijd_DATE = Today()
		VRS:DatumTijd_TIME = Clock()
		VRS:Wijzigingen= 'Automatisch meerdere aantalen printen van de CMR gefixt.'
		Access:Versie.Insert()
		
		LOC:ToonWijziging = true
	End
of 2.25 ! 4-1-2013
	Clear(VRS:Record)
	VRS:Versie=Loc:Versie
	If Access:Versie.Fetch(VRS:Versie_PK)
		VRS:Versie = Loc:Versie
		VRS:DatumTijd_DATE = Today()
		VRS:DatumTijd_TIME = Clock()
		VRS:Wijzigingen= 'Fixen knopje "Leeg". "Ververs Scherm" knop om handmatig het inkoop/verkoop-overzicht bij te kunnen werken. Toevoegen getriggerde voorraad-tellingen (nog gehide en niet geactiveerd op de SQL-server).'
		Access:Versie.Insert()
		
		LOC:ToonWijziging = true
	End
of 2.24 ! 27-9-2012
	Clear(VRS:Record)
	VRS:Versie=Loc:Versie
	If Access:Versie.Fetch(VRS:Versie_PK)
		VRS:Versie = Loc:Versie
		VRS:DatumTijd_DATE = Today()
		VRS:DatumTijd_TIME = Clock()
		VRS:Wijzigingen= 'Nog geselecteerde klant/leverancier in het voorraadverloopscherm worden nu ook al direct juist opgehaald.'
		Access:Versie.Insert()
		
		LOC:ToonWijziging = true
	End
of 2.23 ! 06-9-2011
	Clear(VRS:Record)
	VRS:Versie=Loc:Versie
	If Access:Versie.Fetch(VRS:Versie_PK)
		VRS:Versie = Loc:Versie
		VRS:DatumTijd_DATE = Today()
		VRS:DatumTijd_TIME = Clock()
		VRS:Wijzigingen= 'Reparatie schermweergave van voorraadverlopen bij uitgeschakelde prijsweergave. (I.v.m. verschil in de nieuwe ontwikkelomgeving)'
		Access:Versie.Insert()
		
		LOC:ToonWijziging = true
	End
of 2.22 ! 30-8-2011
	Clear(VRS:Record)
	VRS:Versie=Loc:Versie
	If Access:Versie.Fetch(VRS:Versie_PK)
		VRS:Versie = Loc:Versie
		VRS:DatumTijd_DATE = Today()
		VRS:DatumTijd_TIME = Clock()
		VRS:Wijzigingen= 'Nieuwe versie ontwikkelomgeving'
		Access:Versie.Insert()
		
		LOC:ToonWijziging = true
	End
of 2.21 ! 24-8-2011
	Clear(VRS:Record)
	VRS:Versie=Loc:Versie
	If Access:Versie.Fetch(VRS:Versie_PK)
		VRS:Versie = Loc:Versie
		VRS:DatumTijd_DATE = Today()
		VRS:DatumTijd_TIME = Clock()
		VRS:Wijzigingen= '- Ontwikkelomgeving 8. - Bij het bepalen van de CMR-artikellijst werd soms de plannning/mutatie-KG meegenomen terwijl er wel al een weging is voor een dergelijke artikel/verpakking combinatie. - Alternatieve los/laadadres selecteren op naam ipv plaats'
		Access:Versie.Insert()
		
		LOC:ToonWijziging = true
	End
of 2.20 ! 13-7-2011
	Clear(VRS:Record)
	VRS:Versie=Loc:Versie
	If Access:Versie.Fetch(VRS:Versie_PK)
		VRS:Versie = Loc:Versie
		VRS:DatumTijd_DATE = Today()
		VRS:DatumTijd_TIME = Clock()
		VRS:Wijzigingen= 'Bij het kopieren van de inkoop automatisch de vorige regel selecteren. De planning tijd wordt nu meegekopieerd'
		Access:Versie.Insert()
		
		LOC:ToonWijziging = true
	End
of 2.19 ! 9-7-2011
	Clear(VRS:Record)
	VRS:Versie=Loc:Versie
	If Access:Versie.Fetch(VRS:Versie_PK)
		VRS:Versie = Loc:Versie
		VRS:DatumTijd_DATE = Today()
		VRS:DatumTijd_TIME = Clock()
		VRS:Wijzigingen= 'Voorraad-verloop versnelt door de queues on-demand op te bouwen.'
		Access:Versie.Insert()
		
		LOC:ToonWijziging = true
	End
of 2.18 ! 27-6-2011
	Clear(VRS:Record)
	VRS:Versie=Loc:Versie
	If Access:Versie.Fetch(VRS:Versie_PK)
		VRS:Versie = Loc:Versie
		VRS:DatumTijd_DATE = Today()
		VRS:DatumTijd_TIME = Clock()
		VRS:Wijzigingen= 'Probleem met bijwerken Pallet-verloop gefixt.'
		Access:Versie.Insert()
		
		LOC:ToonWijziging = true
	End
of 2.17 ! 21-6-2011
	Clear(VRS:Record)
	VRS:Versie=Loc:Versie
	If Access:Versie.Fetch(VRS:Versie_PK)
		VRS:Versie = Loc:Versie
		VRS:DatumTijd_DATE = Today()
		VRS:DatumTijd_TIME = Clock()
		VRS:Wijzigingen= 'Snelheid-metingen van Pallet-verloop en het reguliere Voorraad-verloop toegevoegd'
		Access:Versie.Insert()
		
		LOC:ToonWijziging = true
	End
of 2.16 ! 21-6-2011
	Clear(VRS:Record)
	VRS:Versie=Loc:Versie
	If Access:Versie.Fetch(VRS:Versie_PK)
		VRS:Versie = Loc:Versie
		VRS:DatumTijd_DATE = Today()
		VRS:DatumTijd_TIME = Clock()
		VRS:Wijzigingen= 'Relatie-filtering van de Pallet-verloop gefixt'
		Access:Versie.Insert()
		
		LOC:ToonWijziging = true
	End
of 2.15 ! 12-1-2011
	Clear(VRS:Record)
	VRS:Versie=Loc:Versie
	If Access:Versie.Fetch(VRS:Versie_PK)
		VRS:Versie = Loc:Versie
		VRS:DatumTijd_DATE = Today()
		VRS:DatumTijd_TIME = Clock()
		VRS:Wijzigingen= 'Pallet-verloop / Voorraadverloop versneld'
		Access:Versie.Insert()
		
		LOC:ToonWijziging = true
	End
of 2.14 ! 20-4-2012
	Clear(VRS:Record)
	VRS:Versie=Loc:Versie
    If Access:Versie.Fetch(VRS:Versie_PK)
        VRS:Versie = Loc:Versie
		VRS:DatumTijd_DATE = Today()
		VRS:DatumTijd_TIME = Clock()
        VRS:Wijzigingen = 'Prijsinformatie bij Partij-voorraad en de voorraadverlopen. Planningregel-invoervakje van instructies en transport vergroot.'
		Access:Versie.Insert()

		LOC:ToonWijziging = true
	End
of 2.13 ! 20-3-2012
	Clear(VRS:Record)
	VRS:Versie=Loc:Versie
    If Access:Versie.Fetch(VRS:Versie_PK)
        VRS:Versie = Loc:Versie
		VRS:DatumTijd_DATE = Today()
		VRS:DatumTijd_TIME = Clock()
        VRS:Wijzigingen = 'Kopieren bij het invoeren van meerdere inkoop/verkoopregel weer geactiveerd. KG-prijzen worden nu ook gekopieerd. Bij de invoer van de verkoopregel: wanneer het artikel gewijzigd wordt en er een partij geselecteerd was, dan wordt niet alleen de partij op leeggezet maar ook de verpakking en de cel.'
		Access:Versie.Insert()

		LOC:ToonWijziging = true
	End
of 2.12 ! 20-3-2012
	Clear(VRS:Record)
	VRS:Versie=Loc:Versie
    If Access:Versie.Fetch(VRS:Versie_PK)
        VRS:Versie = Loc:Versie
		VRS:DatumTijd_DATE = Today()
		VRS:DatumTijd_TIME = Clock()
        VRS:Wijzigingen = 'bij het invoeren van meerdere inkoop/verkoopregel worden de gegevens niet meer overgekopieerd uit de vorige invoer, maar leeg gemaakt.'
		Access:Versie.Insert()

		LOC:ToonWijziging = true
	End
of 2.11 ! 27-2-2012
	Clear(VRS:Record)
	VRS:Versie=Loc:Versie
    If Access:Versie.Fetch(VRS:Versie_PK)
        VRS:Versie = Loc:Versie
		VRS:DatumTijd_DATE = Today()
		VRS:DatumTijd_TIME = Clock()
        VRS:Wijzigingen = 'Op het inslag/uitslagrapport worden de kwaliteit-checks met JA/NEE weergeven i.p.v. vakjes met kruisjes wegens problemen met het printen daarvan. In het uitslagrapport wordt een de Kwaliteit-sectie nog maar 1 keer geprint en geldt dus voor alle mutaties (net zoals in het uitslag-scherm).'
		Access:Versie.Insert()

		LOC:ToonWijziging = true
	End
of 2.10 ! 22-2-2012
	Clear(VRS:Record)
	VRS:Versie=Loc:Versie
    If Access:Versie.Fetch(VRS:Versie_PK)
        VRS:Versie = Loc:Versie
		VRS:DatumTijd_DATE = Today()
		VRS:DatumTijd_TIME = Clock()
        VRS:Wijzigingen = 'Bij het verwerken van een inslaan wordt nu ook bij het tabblad "Inkoop" rekening gehouden met de al gedane wegingen. Deze blijven nu behouden.'
		Access:Versie.Insert()

		LOC:ToonWijziging = true
	End
of 2.09 ! 30-1-2012
	Clear(VRS:Record)
	VRS:Versie=Loc:Versie
    If Access:Versie.Fetch(VRS:Versie_PK)
        VRS:Versie = Loc:Versie
		VRS:DatumTijd_DATE = Today()
		VRS:DatumTijd_TIME = Clock()
        VRS:Wijzigingen = 'Bij het inslaan van een partij wordt gekeken of de temperaturen nog leeg zijn. Als dat zo is, wordt er gekeken of er andere inslagen van dezelfde inkoop zijn die wel al een of meerdere temperaturen hebben. Zo ja, dan worden de eerst gevonden temperaturen overgenomen.'
		Access:Versie.Insert()

		LOC:ToonWijziging = true
	End
of 2.08 ! 23-1-2012
	Clear(VRS:Record)
	VRS:Versie=Loc:Versie
    If Access:Versie.Fetch(VRS:Versie_PK)
        VRS:Versie = Loc:Versie
		VRS:DatumTijd_DATE = Today()
		VRS:DatumTijd_TIME = Clock()
        VRS:Wijzigingen = 'De 2 verkeerd staande velden op de CMR hoger geplaatst.' & CHR(13) & CHR(10) &|
            'Bij het invoeren van de uitslag-mutaties wordt gekeken of de temperaturen nog leeg zijn. Als dat zo is, wordt er gekeken of er andere uitslag-mutaties van dezelfde verkoop zijn die wel al een of meerdere temperaturen hebben. Zo ja, dan worden de eerst gevonden temperaturen overgenomen.'
		Access:Versie.Insert()

		LOC:ToonWijziging = true
	End
of 2.07 ! 20-1-2012
	Clear(VRS:Record)
	VRS:Versie=Loc:Versie
    If Access:Versie.Fetch(VRS:Versie_PK)
        VRS:Versie = Loc:Versie
		VRS:DatumTijd_DATE = Today()
		VRS:DatumTijd_TIME = Clock()
		VRS:Wijzigingen = 'Horizontale positionering CMR-footer gefixt.'
		Access:Versie.Insert()

		LOC:ToonWijziging = true
	End
of 2.06 ! 17-1-2012
	Clear(VRS:Record)
	VRS:Versie=Loc:Versie
    If Access:Versie.Fetch(VRS:Versie_PK)
        VRS:Versie = Loc:Versie
		VRS:DatumTijd_DATE = Today()
		VRS:DatumTijd_TIME = Clock()
		VRS:Wijzigingen = 'Snelheidsmetingen onderaan toegevoegd. Verklaring voor deze timingmetingen zit in het Help-menu'
		Access:Versie.Insert()

		LOC:ToonWijziging = true
	End
of 2.05 ! 6-1-2012
	Clear(VRS:Record)
	VRS:Versie=Loc:Versie
    If Access:Versie.Fetch(VRS:Versie_PK)
        VRS:Versie = Loc:Versie
		VRS:DatumTijd_DATE = Today()
		VRS:DatumTijd_TIME = Clock()
		VRS:Wijzigingen = 'Alternatieve artikel-omschrijving wordt weer opgehaald voor de CMR / Alternatief adres bij de inkoop en verkoop blijft niet langer staan bij het toevoegen van een nieuwe inkoop/verkoop.'
		Access:Versie.Insert()

		LOC:ToonWijziging = true
	End
of 2.04 ! 29-12-2011
	Clear(VRS:Record)
	VRS:Versie=Loc:Versie
    If Access:Versie.Fetch(VRS:Versie_PK)
        ! Prijzen naar 3 decimalen
        SQLCommando='ALTER TABLE Planning ALTER COLUMN VerkoopKGPrijs decimal(11,3)'
        Versie{Prop:SQL} = SQLCommando
        IF error() then Stop(Error()& FileError()&' bij prop:SQL ' & SQLCommando).

        SQLCommando='ALTER TABLE Planning ALTER COLUMN InkoopKGPrijs decimal(11,3)'
        Versie{Prop:SQL} = SQLCommando
        IF error() then Stop(Error()& FileError()&' bij prop:SQL ' & SQLCommando).

        SQLCommando='ALTER TABLE Inkoop ALTER COLUMN ExtraKosten decimal(11,3)'
        Versie{Prop:SQL} = SQLCommando
        IF error() then Stop(Error()& FileError()&' bij prop:SQL ' & SQLCommando).

        SQLCommando='ALTER TABLE Partij ALTER COLUMN BerekendeInkoopKGPrijs decimal(11,3)'
        Versie{Prop:SQL} = SQLCommando
        IF error() then Stop(Error()& FileError()&' bij prop:SQL ' & SQLCommando).
        
        SQLCommando='ALTER TABLE Partij ALTER COLUMN InkoopKGPrijs decimal(11,3)'
        Versie{Prop:SQL} = SQLCommando
        IF error() then Stop(Error()& FileError()&' bij prop:SQL ' & SQLCommando).

        SQLCommando='ALTER TABLE Verkoop ALTER COLUMN ExtraKosten decimal(11,3)'
        Versie{Prop:SQL} = SQLCommando
        IF error() then Stop(Error()& FileError()&' bij prop:SQL ' & SQLCommando).

        ! -- Kwaliteitscontrole velden
        SQLCommando='ALTER TABLE Mutatie ADD UitslagQATransportmiddelSchoon tinyint'
        Versie{Prop:SQL} = SQLCommando
        IF error() then Stop(Error()& FileError()&' bij prop:SQL ' & SQLCommando).
        
        SQLCommando='ALTER TABLE Mutatie ADD UitslagQAVerpakkingSchoonGesloten tinyint'
        Versie{Prop:SQL} = SQLCommando
        IF error() then Stop(Error()& FileError()&' bij prop:SQL ' & SQLCommando).

        SQLCommando='ALTER TABLE Mutatie ADD UitslagQAIdentificatieMerkenVerpakking tinyint'
        Versie{Prop:SQL} = SQLCommando
        IF error() then Stop(Error()& FileError()&' bij prop:SQL ' & SQLCommando).

        SQLCommando='ALTER TABLE Mutatie ADD UitslagQATemperatuur1 varchar(20)'
        Versie{Prop:SQL} = SQLCommando
        IF error() then Stop(Error()& FileError()&' bij prop:SQL ' & SQLCommando).

        SQLCommando='ALTER TABLE Mutatie ADD UitslagQATemperatuur2 varchar(20)'
        Versie{Prop:SQL} = SQLCommando
        IF error() then Stop(Error()& FileError()&' bij prop:SQL ' & SQLCommando).

        SQLCommando='ALTER TABLE Mutatie ADD UitslagQATemperatuur3 varchar(20)'
        Versie{Prop:SQL} = SQLCommando
        IF error() then Stop(Error()& FileError()&' bij prop:SQL ' & SQLCommando).

        SQLCommando='ALTER TABLE Mutatie ADD UitslagQAActieAfwijkingen varchar(2000)'
        Versie{Prop:SQL} = SQLCommando
        IF error() then Stop(Error()& FileError()&' bij prop:SQL ' & SQLCommando).

        
        SQLCommando='ALTER TABLE Partij ADD InslagQATransportmiddelSchoon tinyint'
        Versie{Prop:SQL} = SQLCommando
        IF error() then Stop(Error()& FileError()&' bij prop:SQL ' & SQLCommando).
        
        SQLCommando='ALTER TABLE Partij ADD InslagQAVerpakkingSchoonGesloten tinyint'
        Versie{Prop:SQL} = SQLCommando
        IF error() then Stop(Error()& FileError()&' bij prop:SQL ' & SQLCommando).

        SQLCommando='ALTER TABLE Partij ADD InslagQAIdentificatieMerkenVerpakking tinyint'
        Versie{Prop:SQL} = SQLCommando
        IF error() then Stop(Error()& FileError()&' bij prop:SQL ' & SQLCommando).

        SQLCommando='ALTER TABLE Partij ADD InslagQATemperatuur1 varchar(20)'
        Versie{Prop:SQL} = SQLCommando
        IF error() then Stop(Error()& FileError()&' bij prop:SQL ' & SQLCommando).

        SQLCommando='ALTER TABLE Partij ADD InslagQATemperatuur2 varchar(20)'
        Versie{Prop:SQL} = SQLCommando
        IF error() then Stop(Error()& FileError()&' bij prop:SQL ' & SQLCommando).

        SQLCommando='ALTER TABLE Partij ADD InslagQATemperatuur3 varchar(20)'
        Versie{Prop:SQL} = SQLCommando
        IF error() then Stop(Error()& FileError()&' bij prop:SQL ' & SQLCommando).

        SQLCommando='ALTER TABLE Partij ADD InslagQAActieAfwijkingen varchar(2000)'
        Versie{Prop:SQL} = SQLCommando
        IF error() then Stop(Error()& FileError()&' bij prop:SQL ' & SQLCommando).
        
        VRS:Versie = Loc:Versie
		VRS:DatumTijd_DATE = Today()
		VRS:DatumTijd_TIME = Clock()
		VRS:Wijzigingen = 'Prijzen uitgebreid naar 3 decimalen / Kwaliteitscontroles bij in-/uitslag / Inslag&uitslag-kg totalen bij voorraadverloop / Refresh Transfer-scherm gefixt'
		Access:Versie.Insert()

		LOC:ToonWijziging = true
	End
of 2.03 ! 16-12-2011
	Clear(VRS:Record)
	VRS:Versie=Loc:Versie
    If Access:Versie.Fetch(VRS:Versie_PK)
		VRS:Versie = Loc:Versie
		VRS:DatumTijd_DATE = Today()
		VRS:DatumTijd_TIME = Clock()
		VRS:Wijzigingen = 'Het 4de tabblad (onverwerkte, per klant/leverancier) inkopen / verkopen weer terug op nummer gezet i.v.m. wegvallende regels wanneer geen datum is ingevuld. / Bij de CMR-artikeltekst wordt per artikel/verpakking combinatie gekeken of er sprake is van een gewogen gewicht i.p.v. voor de gehele CMR.'
		Access:Versie.Insert()

		LOC:ToonWijziging = true
	End
of 2.02 ! 13-12-2011
	Clear(VRS:Record)
	VRS:Versie=Loc:Versie
    If Access:Versie.Fetch(VRS:Versie_PK)
!        SELECT     dbo.Mutatie.MutatieID, dbo.Mutatie.DatumTijd, dbo.Partij.PartijID, dbo.Mutatie.ArtikelID, dbo.Mutatie.SoortMutatie, dbo.Mutatie.InslagKG, 
!                              dbo.Mutatie.InslagPallet, dbo.Mutatie.UitslagKG, dbo.Mutatie.UitslagPallet, dbo.Mutatie.CelID, dbo.Mutatie.NaarCELID, 
!                              dbo.ViewRelatie.FirmaNaam AS PartijRelatie, dbo.Partij.Verwerkt, dbo.Partij.ExternPartijnr, dbo.Partij.Referentie, dbo.Planning.PlanningID, 
!                              dbo.Partij.Leverancier AS PartijLeverancier, dbo.Inkoop.InkoopID, dbo.Verkoop.VerkoopID, dbo.Verkoop.Klant AS VerkoopRelatieID, 
!                              ViewRelatie_1.FirmaNaam AS VerkoopRelatie, dbo.Inkoop.Leverancier AS InkoopRelatieID, ViewRelatie_2.FirmaNaam AS InkoopRelatie, 
!                              dbo.Partij.VerpakkingID, dbo.Verpakking.VerpakkingOmschrijving, dbo.Mutatie.CelLocatieID, dbo.CelLocatie.Locatienaam
!        FROM         dbo.Mutatie LEFT OUTER JOIN
!                              dbo.CelLocatie ON dbo.CelLocatie.CelLocatieID = dbo.Mutatie.CelLocatieID LEFT OUTER JOIN
!                              dbo.Verpakking INNER JOIN
!                              dbo.Partij ON dbo.Verpakking.VerpakkingID = dbo.Partij.VerpakkingID LEFT OUTER JOIN
!                              dbo.ViewRelatie ON dbo.Partij.Leverancier = dbo.ViewRelatie.RelatieID ON dbo.Mutatie.PartijID = dbo.Partij.PartijID LEFT OUTER JOIN
!                              dbo.ViewRelatie AS ViewRelatie_2 RIGHT OUTER JOIN
!                              dbo.Inkoop RIGHT OUTER JOIN
!                              dbo.Planning ON dbo.Inkoop.InkoopID = dbo.Planning.InkoopID ON ViewRelatie_2.RelatieID = dbo.Inkoop.Leverancier LEFT OUTER JOIN
!                              dbo.ViewRelatie AS ViewRelatie_1 RIGHT OUTER JOIN
!                              dbo.Verkoop ON ViewRelatie_1.RelatieID = dbo.Verkoop.Klant ON dbo.Planning.VerkoopID = dbo.Verkoop.VerkoopID ON 
!                              dbo.Mutatie.PlanningID = dbo.Planning.PlanningID
		VRS:Versie = Loc:Versie
		VRS:DatumTijd_DATE = Today()
		VRS:DatumTijd_TIME = Clock()
		VRS:Wijzigingen = 'Aanpassing: Geen ongewogen KG’s in CMR bij weging. Inkopen / Verkopen op geplande datum (recentste bovenaan) ipv nummer / Saldo-telling bij voorraadverloop per klant gefixt'
		Access:Versie.Insert()

		LOC:ToonWijziging = true
	End
of 2.01 ! 30-11-2011
	Clear(VRS:Record)
	VRS:Versie=Loc:Versie
    If Access:Versie.Fetch(VRS:Versie_PK)
		VRS:Versie = Loc:Versie
		VRS:DatumTijd_DATE = Today()
		VRS:DatumTijd_TIME = Clock()
		VRS:Wijzigingen = 'Bij invoeren inkoop/verkoop wordt de juiste leverancier/klant overgenomen uit de tabblad-kop. Extra kolom pallet-voorraad bij voorraad per cel. Gebruikers-rechten uitgebreid met optie "Verwerken" (administrator nodig om te activeren). Extra waarschuwing bij afsluiten weegscherm. Partijen ouder dan 60 dagen worden in het partijvoorraad-scherm roodgekleurd.'
		Access:Versie.Insert()

		LOC:ToonWijziging = true
	End
of 2.0 ! 25-11-2011
	Clear(VRS:Record)
	VRS:Versie=Loc:Versie
	If Access:Versie.Fetch(VRS:Versie_PK)
		VRS:Versie = Loc:Versie
		VRS:DatumTijd_DATE = Today()
		VRS:DatumTijd_TIME = Clock()
		VRS:Wijzigingen = 'Foutmelding bij openenen partijvoorraadverloop gefixt. Bij invoeren inkoop /verkoop wordt de jusite leverancier/klant overgenomen uit de tabblad-kop. Bij ingeslagen wegingen worden ook de inkoopprijzen juist gevuld.'
		Access:Versie.Insert()

		LOC:ToonWijziging = true
	End
of 1.99 ! 17-11-2011
	Clear(VRS:Record)
	VRS:Versie=Loc:Versie
	If Access:Versie.Fetch(VRS:Versie_PK)
		VRS:Versie = Loc:Versie
		VRS:DatumTijd_DATE = Today()
		VRS:DatumTijd_TIME = Clock()
		VRS:Wijzigingen = 'Apart tabblad bij inkoop/verkoop voor die zonder geplande datum. FIX: Bij het doen van de uitslag worden de vinkje Gewogen / MutatieGemaakt bij de jusite planning-regel gezet.'
		Access:Versie.Insert()

		LOC:ToonWijziging = true
	End
of 1.98 ! 17-11-2011
	Clear(VRS:Record)
	VRS:Versie=Loc:Versie
	If Access:Versie.Fetch(VRS:Versie_PK)
		VRS:Versie = Loc:Versie
		VRS:DatumTijd_DATE = Today()
		VRS:DatumTijd_TIME = Clock()
		VRS:Wijzigingen = 'Sortering inkoop/verkoop-scherm aangepast zodat inkopen/verkopen met lege datum niet meer wegvallen.'
		Access:Versie.Insert()

		LOC:ToonWijziging = true
	End
of 1.97 ! 9-11-2011
	Clear(VRS:Record)
	VRS:Versie=Loc:Versie
	If Access:Versie.Fetch(VRS:Versie_PK)
		VRS:Versie = Loc:Versie
		VRS:DatumTijd_DATE = Today()
		VRS:DatumTijd_TIME = Clock()
		VRS:Wijzigingen= 'Versnellen voorraadverloop-queues / Excel-export palletverloop d.m.v. PROP:SQL. Knop Leeg bij de verkoopregel maakt ook de verpakking/cel leeg.'
		Access:Versie.Insert()

		LOC:ToonWijziging = true
	End
of 1.96 ! 14-10-2011
	Clear(VRS:Record)
	VRS:Versie=Loc:Versie
	If Access:Versie.Fetch(VRS:Versie_PK)
		VRS:Versie = Loc:Versie
		VRS:DatumTijd_DATE = Today()
		VRS:DatumTijd_TIME = Clock()
		VRS:Wijzigingen= 'Verdwijnende inkopen/verkopen met lege datum in het inkoop/verkoopscherm. Tijdstip in het inkoop/verkoop-rapport. Datum-kalender bij een gekoppelde overboeking werkend gemaakt.'
		Access:Versie.Insert()

		LOC:ToonWijziging = true
	End
of 1.95 ! 14-10-2011
	Clear(VRS:Record)
	VRS:Versie=Loc:Versie
	If Access:Versie.Fetch(VRS:Versie_PK)
		VRS:Versie = Loc:Versie
		VRS:DatumTijd_DATE = Today()
		VRS:DatumTijd_TIME = Clock()
		VRS:Wijzigingen= 'Versnellen / datum-bereik opgave bij de Pallet/Voorraad-verloopschermen. Inslag/uitslagrapporten niet meer automatisch printen bij het doen van een inslag/uitslag.'
		Access:Versie.Insert()

		LOC:ToonWijziging = true
	End
of 1.94 ! 7-10-2011
	Clear(VRS:Record)
	VRS:Versie=Loc:Versie
	If Access:Versie.Fetch(VRS:Versie_PK)
		VRS:Versie = Loc:Versie
		VRS:DatumTijd_DATE = Today()
		VRS:DatumTijd_TIME = Clock()
		VRS:Wijzigingen= 'Kopieer-functie werkt ook voor prijzen. Logging is uitgebreid.'
		Access:Versie.Insert()

		LOC:ToonWijziging = true
	End
of 1.93 ! 7-10-2011
	Clear(VRS:Record)
	VRS:Versie=Loc:Versie
	If Access:Versie.Fetch(VRS:Versie_PK)
		VRS:Versie = Loc:Versie
		VRS:DatumTijd_DATE = Today()
		VRS:DatumTijd_TIME = Clock()
		VRS:Wijzigingen= 'Ontbrekende kolommen excelblad voorraad toegevoegd. Oude sjabloon verkoopmutaties teruggezet.Excelexport van de Transfers aangepast. VoorrPln/VoorrVrd opnieuw aangemaakt om dubbele NetRefresh te fixen.'
		Access:Versie.Insert()

		LOC:ToonWijziging = true
	End
of 1.92 ! 4-10-2011
	Clear(VRS:Record)
	VRS:Versie=Loc:Versie
	If Access:Versie.Fetch(VRS:Versie_PK)
		SQLCommando='ALTER TABLE Inkoop ADD ExtraKostenTekst VARCHAR(1024)'
		Versie{Prop:SQL} = SQLCommando
		IF error() then Stop(Error()& FileError()&' bij prop:SQL(2) ' & SQLCommando).

		SQLCommando='ALTER TABLE Verkoop ADD ExtraKostenTekst VARCHAR(1024)'
		Versie{Prop:SQL} = SQLCommando
		IF error() then Stop(Error()& FileError()&' bij prop:SQL(2) ' & SQLCommando).

		SQLCommando='ALTER TABLE Partij ADD InkoopKGPrijs DECIMAL(10,2)'
		Versie{Prop:SQL} = SQLCommando
		IF error() then Stop(Error()& FileError()&' bij prop:SQL(2) ' & SQLCommando).
		
		VRS:Versie = Loc:Versie
		VRS:DatumTijd_DATE = Today()
		VRS:DatumTijd_TIME = Clock()
		VRS:Wijzigingen= 'Extra kosten uitgebreid. Probleem bij inkoop gefixt.'
		Access:Versie.Insert()

		LOC:ToonWijziging = true
	End
of 1.91 ! 26-9-2011
	Clear(VRS:Record)
	VRS:Versie=Loc:Versie
	If Access:Versie.Fetch(VRS:Versie_PK)
		VRS:Versie = Loc:Versie
		VRS:DatumTijd_DATE = Today()
		VRS:DatumTijd_TIME = Clock()
		VRS:Wijzigingen= 'Bij voorraad-met-peildatum: Mutaties gedurende de peildatum (tijdstip groter dan 0:00) zelf worden ook meegeteld / Totalen worden berekend. Logging verbeterd. Kopieerknop bij inkoop/verkoop blijft zichtbaar.'
		Access:Versie.Insert()

		LOC:ToonWijziging = true
	End
of 1.90 ! 26-9-2011
	Clear(VRS:Record)
	VRS:Versie=Loc:Versie
	If Access:Versie.Fetch(VRS:Versie_PK)
		SQLCommando='ALTER TABLE Inkoop ADD ExtraKosten DECIMAL(10,2)'
		Versie{Prop:SQL} = SQLCommando
		IF error() then Stop(Error()& FileError()&' bij prop:SQL(2) ' & SQLCommando).

		SQLCommando='ALTER TABLE Verkoop ADD ExtraKosten DECIMAL(10,2)'
		Versie{Prop:SQL} = SQLCommando
		IF error() then Stop(Error()& FileError()&' bij prop:SQL(2) ' & SQLCommando).

		SQLCommando='ALTER TABLE Planning ADD InkoopKGPrijs DECIMAL(10,2)'
		Versie{Prop:SQL} = SQLCommando
		IF error() then Stop(Error()& FileError()&' bij prop:SQL(2) ' & SQLCommando).

		SQLCommando='ALTER TABLE Planning ADD VerkoopKGPrijs DECIMAL(10,2)'
		Versie{Prop:SQL} = SQLCommando
		IF error() then Stop(Error()& FileError()&' bij prop:SQL(2) ' & SQLCommando).

		SQLCommando='ALTER TABLE Partij ADD BerekendeInkoopKGPrijs DECIMAL(10,2)'
		Versie{Prop:SQL} = SQLCommando
		IF error() then Stop(Error()& FileError()&' bij prop:SQL(2) ' & SQLCommando).
		
		SQLCommando='ALTER TABLE Partij ADD InkoopID INT'
		Versie{Prop:SQL} = SQLCommando
		IF error() then Stop(Error()& FileError()&' bij prop:SQL(2) ' & SQLCommando).
		
		SQLCommando='ALTER TABLE Partij ADD InkoopPlanningID INT'
		Versie{Prop:SQL} = SQLCommando
		IF error() then Stop(Error()& FileError()&' bij prop:SQL(2) ' & SQLCommando).
		
		VRS:Versie = Loc:Versie
		VRS:DatumTijd_DATE = Today()
		VRS:DatumTijd_TIME = Clock()
		VRS:Wijzigingen= 'Prijzen toegevoegd'
		Access:Versie.Insert()

		LOC:ToonWijziging = true
	End
of 1.89 ! 8-9-2011
	Clear(VRS:Record)
	VRS:Versie=Loc:Versie
	If Access:Versie.Fetch(VRS:Versie_PK)
		!SQLCommando='ALTER TABLE Mutatie ADD MutatieKG DECIMAL(10,2)'
		!Versie{Prop:SQL} = SQLCommando
		!IF error() then Stop(Error()& FileError()&' bij prop:SQL(2) ' & SQLCommando).

		VRS:Versie = Loc:Versie
		VRS:DatumTijd_DATE = Today()
		VRS:DatumTijd_TIME = Clock()
		VRS:Wijzigingen= 'Problemen met nieuwe rapporten (ipv sjablonen) eruit halen. Gekoppelde overboeking kan nu ook geannuleerd worden zonder in onbreekbare loop te komen.'
		Access:Versie.Insert()

		LOC:ToonWijziging = true
	End
of 1.88 ! 8-9-2011
	Clear(VRS:Record)
	VRS:Versie=Loc:Versie
	If Access:Versie.Fetch(VRS:Versie_PK)
		!SQLCommando='ALTER TABLE Mutatie ADD MutatieKG DECIMAL(10,2)'
		!Versie{Prop:SQL} = SQLCommando
		!IF error() then Stop(Error()& FileError()&' bij prop:SQL(2) ' & SQLCommando).

omit('SQLCode')
ALTER TABLE Mutatie ADD MutatieKG DECIMAL(10,2)
		
CREATE  VIEW [dbo].[PlanningInkoop]
AS
SELECT     dbo.Planning.PlanningID, dbo.Inkoop.Leverancier, dbo.Planning.ArtikelID, dbo.Planning.KG, dbo.Planning.MutatieKG, dbo.Planning.Pallets, dbo.Planning.Transport, 
                      dbo.Planning.Geprint, dbo.Planning.MutatieGemaakt, dbo.Planning.Verwerkt, dbo.Planning.Memo, dbo.Planning.InkoopID, dbo.Planning.Instructie, 
                      dbo.Inkoop.Planning, dbo.ViewRelatie.FirmaNaam, dbo.Cel.Celid, dbo.Cel.CelOms, dbo.Partij.PartijID, dbo.Partij.ExternPartijnr, 
                      dbo.ViewArtikel.ArtikelOms, dbo.Verpakking.VerpakkingID, dbo.Verpakking.VerpakkingOmschrijving, dbo.Planning.Gewogen, dbo.Planning.CelLocatieID, 
                      dbo.CelLocatie.Locatienaam
FROM         dbo.Planning INNER JOIN
                      dbo.Inkoop ON dbo.Planning.InkoopID = dbo.Inkoop.InkoopID INNER JOIN
                      dbo.ViewRelatie ON dbo.Inkoop.Leverancier = dbo.ViewRelatie.RelatieID LEFT OUTER JOIN
                      dbo.CelLocatie ON dbo.Planning.CelLocatieID = dbo.CelLocatie.CelLocatieID LEFT OUTER JOIN
                      dbo.ViewArtikel ON dbo.ViewArtikel.ArtikelID = dbo.Planning.ArtikelID LEFT OUTER JOIN
                      dbo.Verpakking ON dbo.Verpakking.VerpakkingID = dbo.Planning.VerpakkingID LEFT OUTER JOIN
                      dbo.Partij ON dbo.Planning.PartijID = dbo.Partij.PartijID LEFT OUTER JOIN
                      dbo.Cel ON dbo.Planning.CelID = dbo.Cel.Celid
WHERE     (dbo.Planning.InkoopID > 0)

CREATE VIEW [dbo].[PlanningOverboeking]
AS
SELECT     dbo.Planning.PlanningID, dbo.Planning.ArtikelID, dbo.Planning.KG, dbo.Planning.MutatieKG, dbo.Planning.Pallets, dbo.Planning.Transport, dbo.Planning.Planning, 
                      dbo.Planning.Geprint, dbo.Planning.MutatieGemaakt, dbo.Planning.Verwerkt, dbo.Planning.Memo, dbo.Planning.Instructie, dbo.ViewRelatie.FirmaNaam, 
                      dbo.Cel.Celid, dbo.Cel.CelOms, dbo.Partij.PartijID, dbo.Partij.ExternPartijnr, dbo.ViewArtikel.ArtikelOms, dbo.Verpakking.VerpakkingID, 
                      dbo.Verpakking.VerpakkingOmschrijving, NaarCel.Celid AS NaarCelID, NaarCel.CelOms AS NaarCelOms, dbo.Planning.CelLocatieID, 
                      dbo.CelLocatie.Locatienaam
FROM         dbo.Planning LEFT OUTER JOIN
                      dbo.ViewArtikel ON dbo.ViewArtikel.ArtikelID = dbo.Planning.ArtikelID LEFT OUTER JOIN
                      dbo.Verpakking ON dbo.Verpakking.VerpakkingID = dbo.Planning.VerpakkingID LEFT OUTER JOIN
                      dbo.Partij ON dbo.Planning.PartijID = dbo.Partij.PartijID LEFT OUTER JOIN
                      dbo.ViewRelatie ON dbo.Partij.Leverancier = dbo.ViewRelatie.RelatieID LEFT OUTER JOIN
                      dbo.Cel ON dbo.Planning.CelID = dbo.Cel.Celid LEFT OUTER JOIN
                      dbo.Cel AS NaarCel ON dbo.Planning.OverboekingCelID = NaarCel.Celid LEFT OUTER JOIN
                      dbo.CelLocatie ON dbo.CelLocatie.CelLocatieID = dbo.Planning.CelLocatieID
WHERE     (dbo.Planning.OverboekingCelID <> 0)

CREATE VIEW [dbo].[PlanningVerkoop]
AS
SELECT     dbo.Planning.PlanningID, dbo.Planning.ArtikelID, dbo.Planning.KG, dbo.Planning.MutatieKG, dbo.Planning.Pallets, dbo.Planning.Geprint, dbo.Planning.MutatieGemaakt, 
                      dbo.Planning.Verwerkt, dbo.Planning.Transport, dbo.Planning.Instructie, dbo.Verkoop.Klant, dbo.Planning.VerkoopID, dbo.Verkoop.Planning, 
                      dbo.Relatie_SyncExact.FirmaNaam, dbo.Cel.Celid, dbo.Cel.CelOms, dbo.Partij.PartijID, dbo.Partij.ExternPartijnr, dbo.Artikel_SyncExact.ArtikelOms, 
                      dbo.Verpakking.VerpakkingID, dbo.Verpakking.VerpakkingOmschrijving, Leverancier.RelatieID AS LeverancierID, 
                      Leverancier.FirmaNaam AS LeverancierFirmaNaam, dbo.Planning.Gewogen
FROM         dbo.Planning INNER JOIN
                      dbo.Verkoop ON dbo.Planning.VerkoopID = dbo.Verkoop.VerkoopID INNER JOIN
                      dbo.Relatie_SyncExact ON dbo.Verkoop.Klant = dbo.Relatie_SyncExact.RelatieID LEFT OUTER JOIN
                      dbo.Artikel_SyncExact ON dbo.Artikel_SyncExact.ArtikelID = dbo.Planning.ArtikelID LEFT OUTER JOIN
                      dbo.Verpakking ON dbo.Verpakking.VerpakkingID = dbo.Planning.VerpakkingID LEFT OUTER JOIN
                      dbo.Partij ON dbo.Planning.PartijID = dbo.Partij.PartijID LEFT OUTER JOIN
                      dbo.Relatie_SyncExact AS Leverancier ON dbo.Partij.Leverancier = Leverancier.RelatieID LEFT OUTER JOIN
                      dbo.Cel ON dbo.Planning.CelID = dbo.Cel.Celid
WHERE     (dbo.Planning.VerkoopID > 0)
'SQLCode'
		
		VRS:Versie = Loc:Versie
		VRS:DatumTijd_DATE = Today()
		VRS:DatumTijd_TIME = Clock()
		VRS:Wijzigingen= 'Gebruikers / Logging / Rapporten i.p.v. sjablonen / MutatieKG in de Planning'
		Access:Versie.Insert()

		LOC:ToonWijziging = true
	End
of 1.87 ! 2-9-2011
	Clear(VRS:Record)
	VRS:Versie=Loc:Versie
	If Access:Versie.Fetch(VRS:Versie_PK)
		VRS:Versie = Loc:Versie
		VRS:DatumTijd_DATE = Today()
		VRS:DatumTijd_TIME = Clock()
		VRS:Wijzigingen= 'Queues worden gerefresht bij wijzingen in het scherm Inkoop / Verkoop'
		Access:Versie.Insert()

		LOC:ToonWijziging = true
	End
of 1.86 ! 2-9-2011
	Clear(VRS:Record)
	VRS:Versie=Loc:Versie
	If Access:Versie.Fetch(VRS:Versie_PK)
		VRS:Versie = Loc:Versie
		VRS:DatumTijd_DATE = Today()
		VRS:DatumTijd_TIME = Clock()
		VRS:Wijzigingen= 'De schermen Inkoop / Verkoop / Planning en Voorraad zijn versneld d.m.v. cache-queues.'
		Access:Versie.Insert()

		LOC:ToonWijziging = true
	End
of 1.85 ! 26-8-2011
	Clear(VRS:Record)
	VRS:Versie=Loc:Versie
	If Access:Versie.Fetch(VRS:Versie_PK)
		VRS:Versie = Loc:Versie
		VRS:DatumTijd_DATE = Today()
		VRS:DatumTijd_TIME = Clock()
		VRS:Wijzigingen= 'Bij selecteren van de partij in de verkoopregels zijn de Cel-voorraden/verkopen/beschikbaar dikgedrukt.'
		Access:Versie.Insert()

		LOC:ToonWijziging = true
	End
of 1.84 ! 24-8-2011
	Clear(VRS:Record)
	VRS:Versie=Loc:Versie
	If Access:Versie.Fetch(VRS:Versie_PK)
		VRS:Versie = Loc:Versie
		VRS:DatumTijd_DATE = Today()
		VRS:DatumTijd_TIME = Clock()
		VRS:Wijzigingen= 'Probleem bij het opstaten van Partijvoorraden dat de gewone voorraad niet meer wordt geopend.'
		Access:Versie.Insert()

		LOC:ToonWijziging = true
	End
of 1.83 ! 23-8-2011
	Clear(VRS:Record)
	VRS:Versie=Loc:Versie
	If Access:Versie.Fetch(VRS:Versie_PK)
		VRS:Versie = Loc:Versie
		VRS:DatumTijd_DATE = Today()
		VRS:DatumTijd_TIME = Clock()
		VRS:Wijzigingen= 'Bij het maken van een verkoop staat bij de PartijCel-selectie nu ook de beschikbare voorraad voor de partij als geheel (cel-onafhankelijk). Daarnaast wordt een waarschuwing getoont als er een verkoop gemaakt wordt die groter is dan de beschikbare voorraad (voorraad - geplande verkopen).'
		Access:Versie.Insert()

		LOC:ToonWijziging = true
	End
of 1.82 ! 12-8-2011
	Clear(VRS:Record)
	VRS:Versie=Loc:Versie
	If Access:Versie.Fetch(VRS:Versie_PK)
		VRS:Versie = Loc:Versie
		VRS:DatumTijd_DATE = Today()
		VRS:DatumTijd_TIME = Clock()
		VRS:Wijzigingen= 'Laadtijden op de excel planning stonden niet goed.'
		Access:Versie.Insert()

		LOC:ToonWijziging = true
	End
of 1.81 ! 10-8-2011
	Clear(VRS:Record)
	VRS:Versie=Loc:Versie
	If Access:Versie.Fetch(VRS:Versie_PK)
		VRS:Versie = Loc:Versie
		VRS:DatumTijd_DATE = Today()
		VRS:DatumTijd_TIME = Clock()
		VRS:Wijzigingen= 'Memory-table uit de planning gehaald waardoor de refresh met minder knipperen kan gebeuren.'
		Access:Versie.Insert()

		LOC:ToonWijziging = true
	End
of 1.80 ! 8-8-2011
	Clear(VRS:Record)
	VRS:Versie=Loc:Versie
	If Access:Versie.Fetch(VRS:Versie_PK)
		VRS:Versie = Loc:Versie
		VRS:DatumTijd_DATE = Today()
		VRS:DatumTijd_TIME = Clock()
		VRS:Wijzigingen= 'Ingeplande inkopen bij bekijken van voorraad van een artikel worden nu goed gefilterd. Sortering partijvoorraadverloop aangepast (OUIT voor OIN). Verwijderen ongewenste wegingen gedurende het wegen.'
		Access:Versie.Insert()

		LOC:ToonWijziging = true
	End
of 1.79 ! 4-7-2011
	Clear(VRS:Record)
	VRS:Versie=Loc:Versie
	If Access:Versie.Fetch(VRS:Versie_PK)
		VRS:Versie = Loc:Versie
		VRS:DatumTijd_DATE = Today()
		VRS:DatumTijd_TIME = Clock()
		VRS:Wijzigingen= 'Bij het printen van de pallet-sticker in inslag via weging worden de ingevoerde maar nog niet opgeslagen partij-gegevens (zoals inslagdatum) behouden. In het partij-voorraadscherm zijn de partij/cel-totalen VET gedrukt, zodat ze meer opvallen dan de partij-totalen.'
		Access:Versie.Insert()

		LOC:ToonWijziging = true
	End
of 1.78 ! 4-7-2011
	Clear(VRS:Record)
	VRS:Versie=Loc:Versie
	If Access:Versie.Fetch(VRS:Versie_PK)
		VRS:Versie = Loc:Versie
		VRS:DatumTijd_DATE = Today()
		VRS:DatumTijd_TIME = Clock()
		VRS:Wijzigingen= 'Beveilig bij het inslag-scherm: gebruiker moet altijd een artikel selecteren & tab-volgorde aangepast zodat de kans dat een artikel per ongeluk gewijzigd wordt verminderd. De selectie-balk in de planning moet na een refresh ook na het indrukken van een knop goed terecht komen. Foutieve controle op bestaande mutaties bij terugdraaien van mutaties gecorrigeerd.'
		Access:Versie.Insert()

		LOC:ToonWijziging = true
	End
of 1.77 ! 30-6-2011
	Clear(VRS:Record)
	VRS:Versie=Loc:Versie
	If Access:Versie.Fetch(VRS:Versie_PK)
		VRS:Versie = Loc:Versie
		VRS:DatumTijd_DATE = Today()
		VRS:DatumTijd_TIME = Clock()
		VRS:Wijzigingen= 'Lay out van CMR aangepast.'
		Access:Versie.Insert()

		LOC:ToonWijziging = true
	End
of 1.76 ! 29-6-2011
	Clear(VRS:Record)
	VRS:Versie=Loc:Versie
	If Access:Versie.Fetch(VRS:Versie_PK)
		VRS:Versie = Loc:Versie
		VRS:DatumTijd_DATE = Today()
		VRS:DatumTijd_TIME = Clock()
		VRS:Wijzigingen= | 
			'Bij wijzigen van verkoop-regels waarvan de partij/cel al leeg is, wordt de geselecteerde partij/cel niet meer leeggegooit, zodat de gereserveerde voorraad niet veranderd.'& CHR(13) & |
			'In het partij/celvoorraad-scherm en het selecteren van een partij in het overboeking-scherm staan nu ook de voorraad en de gereserveerde voorraad voor de partij als geheel.'& CHR(13) & |
			'Gemuteerde inkoop en verkoop-regel in de planning kunnen worden teruggedraait.'& CHR(13) & |
			'Wanneer de planning wordt ververst, blijft de geselecteerde regel geselecteert.'
		Access:Versie.Insert()

		LOC:ToonWijziging = true
	End
of 1.75 ! 21-6-2011
	Clear(VRS:Record)
	VRS:Versie=Loc:Versie
	If Access:Versie.Fetch(VRS:Versie_PK)
		VRS:Versie = Loc:Versie
		VRS:DatumTijd_DATE = Today()
		VRS:DatumTijd_TIME = Clock()
		VRS:Wijzigingen= 'Extra waarschuwing toegevoegd wanneer er geannuleerd wordt bij het ''Inslaan via Weging'' nadat er Partij-stickers zijn geprint.'
		Access:Versie.Insert()

		LOC:ToonWijziging = true
	End
of 1.74 ! 21-6-2011
	Clear(VRS:Record)
	VRS:Versie=Loc:Versie
	If Access:Versie.Fetch(VRS:Versie_PK)
		VRS:Versie = Loc:Versie
		VRS:DatumTijd_DATE = Today()
		VRS:DatumTijd_TIME = Clock()
		VRS:Wijzigingen= 'Partij-locaties in het voorraadscherm worden nu sneller opgehaald waardoor het voorraad-scherm sneller wordt. NetRefresh van de planning uitgebreid waardoor de lege verkoopregels voorkomen moeten worden.'
		Access:Versie.Insert()

		LOC:ToonWijziging = true
	End
of 1.73 ! 21-6-2011
	Clear(VRS:Record)
	VRS:Versie=Loc:Versie
	If Access:Versie.Fetch(VRS:Versie_PK)
		VRS:Versie = Loc:Versie
		VRS:DatumTijd_DATE = Today()
		VRS:DatumTijd_TIME = Clock()
		VRS:Wijzigingen= 'Inslag/uitslagrapport knoppen nu ook op de 2 andere tabbladen in de planning. Pallet-tegoeden zijn nu op klantnaam gesorteerd.'
		Access:Versie.Insert()

		LOC:ToonWijziging = true
	End
of 1.72 ! 21-6-2011
	Clear(VRS:Record)
	VRS:Versie=Loc:Versie
	If Access:Versie.Fetch(VRS:Versie_PK)
		VRS:Versie = Loc:Versie
		VRS:DatumTijd_DATE = Today()
		VRS:DatumTijd_TIME = Clock()
		VRS:Wijzigingen= 'In het pallet-tegoeden scherm kan nu gezocht worden. Bij de partij-voorraden staat nu ook de geplande verkopen (dus de gereserveerde voorraad). Inslag/uitslag-rapportage kan nu apart met een knop worden afgedrukt vanuit de planning. Het verspringen naar lege regels bij de verkoop-regel in de planning moet niet meer voorkomen. In het partij/cel-voorraden scherm kan de cel/locatie worden gewijzigd. Vanuit het ''inslag via weging''- scherm kunnen nu direct stickers worden geprint.'
		Access:Versie.Insert()

		LOC:ToonWijziging = true
	End
of 1.71 ! 16-6-2011
	Clear(VRS:Record)
	VRS:Versie=Loc:Versie
	If Access:Versie.Fetch(VRS:Versie_PK)
	
		VRS:Versie = Loc:Versie
		VRS:DatumTijd_DATE = Today()
		VRS:DatumTijd_TIME = Clock()
		VRS:Wijzigingen= 'Probleem met Enter-knop bij de Verkoop'
		Access:Versie.Insert()

		LOC:ToonWijziging = true
	End
of 1.70 ! 15-6-2011
	Clear(VRS:Record)
	VRS:Versie=Loc:Versie
	If Access:Versie.Fetch(VRS:Versie_PK)
	    ! Voor het bepalen van de Cel/CelLocaties wordt alleen naar inslagen gekeken (Bij een uitslag zoals een overboeking geeft de CelLocatie, de CelLocatie weer van waaruit het komt)
		SQLCommando='DROP VIEW [dbo].[ViewPartijCelLocaties]'
		Versie{Prop:SQL} = SQLCommando
		IF error() then Stop(Error()& FileError()&' bij prop:SQL(1) ' & SQLCommando).
			
		SQLCommando='CREATE VIEW [dbo].[ViewPartijCelLocaties] AS '&|
			'SELECT TOP (100) PERCENT dbo.Mutatie.PartijID, dbo.Mutatie.CelID, ISNULL(dbo.Mutatie.CelLocatieID, 0) AS CelLocatieID, dbo.CelLocatie.Locatienaam AS CelLocatienaam ' &|
            'FROM dbo.Mutatie LEFT OUTER JOIN ' &|
            'dbo.CelLocatie ON dbo.CelLocatie.CelLocatieID = dbo.Mutatie.CelLocatieID ' &|
			'WHERE (dbo.Mutatie.SoortMutatie = ''IN'') OR ' &|
            '(dbo.Mutatie.SoortMutatie = ''OIN'') OR ' &|
            '(dbo.Mutatie.SoortMutatie = ''EIN'') ' &|
			'GROUP BY dbo.Mutatie.PartijID, dbo.Mutatie.CelID, dbo.Mutatie.CelLocatieID, dbo.CelLocatie.Locatienaam ' &|
			'ORDER BY dbo.Mutatie.PartijID, dbo.Mutatie.CelID, CelLocatieID'
		Versie{Prop:SQL} = SQLCommando
		IF error() then Stop(Error()& FileError()&' bij prop:SQL(2) ' & SQLCommando).
	
		SQLCommando='CREATE VIEW [dbo].[ViewPalletTegoeden] AS '&|
			'SELECT TOP (100) PERCENT RelatieID, ISNULL(Transporteur, 0) AS Transporteur, PalletSoortID, SUM(Inkomend) AS Inkomend, SUM(Uitgaand) AS Uitgaand ' &|
			'FROM dbo.PalletMutatie ' &|
			'GROUP BY PalletSoortID, RelatieID, ISNULL(Transporteur, 0) ' &|
			'ORDER BY PalletSoortID, RelatieID, Transporteur'
		
		Versie{Prop:SQL} = SQLCommando
		IF error() then Stop(Error()& FileError()&' bij prop:SQL(2) ' & SQLCommando).
	
		VRS:Versie = Loc:Versie
		VRS:DatumTijd_DATE = Today()
		VRS:DatumTijd_TIME = Clock()
		VRS:Wijzigingen= 'Partij-informatie op weegscherm, Overzicht met pallet-tegoeden, VoorraadVerloop Per Artikel/Cel, FIX: Datum-selectie op de transfers + lege tijd niet in Excel'
		Access:Versie.Insert()

		LOC:ToonWijziging = true
	End
of 1.69 ! 10-6-2011
	Clear(VRS:Record)
	VRS:Versie=Loc:Versie
	If Access:Versie.Fetch(VRS:Versie_PK)
		VRS:Versie = Loc:Versie
		VRS:DatumTijd_DATE = Today()
		VRS:DatumTijd_TIME = Clock()
		VRS:Wijzigingen= 'Multi-DLL'
		Access:Versie.Insert()

		LOC:ToonWijziging = true
	End
of 1.68 ! 10-5-2011
	Clear(VRS:Record)
	VRS:Versie=Loc:Versie
	If Access:Versie.Fetch(VRS:Versie_PK)
				
		VRS:Versie = Loc:Versie
		VRS:DatumTijd_DATE = Today()
		VRS:DatumTijd_TIME = Clock()
		VRS:Wijzigingen= 'Lay-out Laser CMR aangepast (versie 3), vak 18 wordt weer leeggelaten'
		Access:Versie.Insert()

		LOC:ToonWijziging = true
	End


of 1.67 ! 9-5-2011
	Clear(VRS:Record)
	VRS:Versie=Loc:Versie
	If Access:Versie.Fetch(VRS:Versie_PK)
				
		VRS:Versie = Loc:Versie
		VRS:DatumTijd_DATE = Today()
		VRS:DatumTijd_TIME = Clock()
		VRS:Wijzigingen= 'Lay-out Laser CMR aangepast (versie 2), aanpassing weegscherm probeer de scanner eens'
		Access:Versie.Insert()

		LOC:ToonWijziging = true
	End


of 1.66 ! 4-5-2011
	Clear(VRS:Record)
	VRS:Versie=Loc:Versie
	If Access:Versie.Fetch(VRS:Versie_PK)
				
		VRS:Versie = Loc:Versie
		VRS:DatumTijd_DATE = Today()
		VRS:DatumTijd_TIME = Clock()
		VRS:Wijzigingen= 'Lay-out Laser CMR aangepast, aanpassing weegscherm probeer de scanner eens'
		Access:Versie.Insert()

		LOC:ToonWijziging = true
	End


of 1.65 ! 19-4-2011
	Clear(VRS:Record)
	VRS:Versie=Loc:Versie
	If Access:Versie.Fetch(VRS:Versie_PK)
				
		VRS:Versie = Loc:Versie
		VRS:DatumTijd_DATE = Today()
		VRS:DatumTijd_TIME = Clock()
		VRS:Wijzigingen= 'Printerkeuze toegevoegd op de CMR print'
		Access:Versie.Insert()

		LOC:ToonWijziging = true
	End


of 1.64 ! 12-4-2011
	Clear(VRS:Record)
	VRS:Versie=Loc:Versie
	If Access:Versie.Fetch(VRS:Versie_PK)
				
		VRS:Versie = Loc:Versie
		VRS:DatumTijd_DATE = Today()
		VRS:DatumTijd_TIME = Clock()
		VRS:Wijzigingen= 'Datum op de weeglijst uit de mutaties halen ipv printdatum weergeven, lay-out excel weeglijst aangepast'
		Access:Versie.Insert()

		LOC:ToonWijziging = true
	End


of 1.63 ! 11-4-2011
	Clear(VRS:Record)
	VRS:Versie=Loc:Versie
	If Access:Versie.Fetch(VRS:Versie_PK)
				
		VRS:Versie = Loc:Versie
		VRS:DatumTijd_DATE = Today()
		VRS:DatumTijd_TIME = Clock()
		VRS:Wijzigingen= 'Tab op klant bij de voorraadverloop'
		Access:Versie.Insert()

		LOC:ToonWijziging = true
	End


of 1.62 ! 5-4-2011
	Clear(VRS:Record)
	VRS:Versie=Loc:Versie
	If Access:Versie.Fetch(VRS:Versie_PK)
				
		VRS:Versie = Loc:Versie
		VRS:DatumTijd_DATE = Today()
		VRS:DatumTijd_TIME = Clock()
		VRS:Wijzigingen= 'Titel aanmaakdatum over 2 regels verspreid en lege voorraad verborgen bij op aanmaakdatum sortering'
		Access:Versie.Insert()

		LOC:ToonWijziging = true
	End


of 1.61 ! 29-3-2011
	Clear(VRS:Record)
	VRS:Versie=Loc:Versie
	If Access:Versie.Fetch(VRS:Versie_PK)
				
		VRS:Versie = Loc:Versie
		VRS:DatumTijd_DATE = Today()
		VRS:DatumTijd_TIME = Clock()
		VRS:Wijzigingen= 'Voorraadverloop vanuit Voorraad-blad werkt niet meer en standaard wordt Cel 1 nu getoond (met de voorraad)'
		Access:Versie.Insert()

		LOC:ToonWijziging = true
	End


of 1.60 ! 29-3-2011
	Clear(VRS:Record)
	VRS:Versie=Loc:Versie
	If Access:Versie.Fetch(VRS:Versie_PK)
				
		VRS:Versie = Loc:Versie
		VRS:DatumTijd_DATE = Today()
		VRS:DatumTijd_TIME = Clock()
		VRS:Wijzigingen= '(5007) Locaties op excel planning, Snelheid aangepast van het ophalen van de cellocaties, Datum op de weeglijst in excel is planningsdatum ipv vandaag '
		Access:Versie.Insert()

		LOC:ToonWijziging = true
	End


of 1.59 ! 11-2-2011
	Clear(VRS:Record)
	VRS:Versie=Loc:Versie
	If Access:Versie.Fetch(VRS:Versie_PK)
		UD.Debug( 'Conversie 1.59')
				
		VRS:Versie = Loc:Versie
		VRS:DatumTijd_DATE = Today()
		VRS:DatumTijd_TIME = Clock()
		VRS:Wijzigingen= 'Vastleggen van KGs groter dan 100.000'
		Access:Versie.Insert()
		
		SQLCommando= 'ALTER TABLE [dbo].[Mutatie] ALTER COLUMN [InslagKG] decimal(10,2)'
		Versie{Prop:SQL} = SQLCommando
		IF error() then Stop(Error()& FileError()&' bij prop:SQL(2) ' & SQLCommando).

		SQLCommando= 'ALTER TABLE [dbo].[Mutatie] ALTER COLUMN [UitslagKG] decimal(10,2)'
		Versie{Prop:SQL} = SQLCommando
		IF error() then Stop(Error()& FileError()&' bij prop:SQL(2) ' & SQLCommando).
		
		SQLCommando= 'ALTER TABLE [dbo].[Partij] ALTER COLUMN [KG] decimal(10,2)'
		Versie{Prop:SQL} = SQLCommando
		IF error() then Stop(Error()& FileError()&' bij prop:SQL(2) ' & SQLCommando).

		SQLCommando= 'ALTER TABLE [dbo].[Planning] ALTER COLUMN [KG] decimal(10,2)'
		Versie{Prop:SQL} = SQLCommando
		IF error() then Stop(Error()& FileError()&' bij prop:SQL(2) ' & SQLCommando).
		
		LOC:ToonWijziging = true
	End


of 1.58 ! 28-2-2011
	Clear(VRS:Record)
	VRS:Versie=Loc:Versie
	If Access:Versie.Fetch(VRS:Versie_PK)
		VRS:Versie = Loc:Versie
		VRS:DatumTijd_DATE = Today()
		VRS:DatumTijd_TIME = Clock()
		VRS:Wijzigingen= 'Weeglijst in Excel gefixt. Juiste en alle planningsregel worden nu opgehaald.'
		Access:Versie.Insert()
		
		LOC:ToonWijziging = true
	End
of 1.57 ! 11-2-2011
	Clear(VRS:Record)
	VRS:Versie=Loc:Versie
	If Access:Versie.Fetch(VRS:Versie_PK)
		VRS:Versie = Loc:Versie
		VRS:DatumTijd_DATE = Today()
		VRS:DatumTijd_TIME = Clock()
		VRS:Wijzigingen= 'Planningsregel zonder mutatie/weging krijgen wel een CMR-regel'
		Access:Versie.Insert()
		
		LOC:ToonWijziging = true
	End
of 1.56 ! 11-2-2011
	Clear(VRS:Record)
	VRS:Versie=Loc:Versie
	If Access:Versie.Fetch(VRS:Versie_PK)
		VRS:Versie = Loc:Versie
		VRS:DatumTijd_DATE = Today()
		VRS:DatumTijd_TIME = Clock()
		VRS:Wijzigingen= 'De CMR-artikelomschrijving kan d.m.v. een knop opnieuw gevuld worden.'
		Access:Versie.Insert()
		
		LOC:ToonWijziging = true
	End
of 1.55 ! 11-2-2011
	Clear(VRS:Record)
	VRS:Versie=Loc:Versie
	If Access:Versie.Fetch(VRS:Versie_PK)
		UD.Debug( 'Conversie 1.55')
				
		VRS:Versie = Loc:Versie
		VRS:DatumTijd_DATE = Today()
		VRS:DatumTijd_TIME = Clock()
		VRS:Wijzigingen= 'Artikel/Relatie synchroniseren met Exact via tabel'
		Access:Versie.Insert()
		
		SQLCommando= 'CREATE TABLE [dbo].[Artikel_SyncExact]( '&|
			'[ArtikelID] [varchar](30) NOT NULL, '&|
			'[ArtikelOms] [varchar](60) NULL, '&|
			'[ArtikelGroep] [int] NULL, '&|
			' CONSTRAINT [PK_Artikel_SyncExact] PRIMARY KEY CLUSTERED '&|
			'( '&|
			'	[ArtikelID] ASC '&|
			')WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY] '&|
			') ON [PRIMARY]'
		Versie{Prop:SQL} = SQLCommando
		IF error() then Stop(Error()& FileError()&' bij prop:SQL(2) ' & SQLCommando).
		
		SQLCommando= 'CREATE NONCLUSTERED INDEX [FK1_Artikel_SyncExact] ON [dbo].[Artikel_SyncExact] '&|
			'('&|
			'	[ArtikelOms] ASC'&|
			')WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]'
		Versie{Prop:SQL} = SQLCommando
		IF error() then Stop(Error()& FileError()&' bij prop:SQL(2) ' & SQLCommando).
		
		SQLCommando= 'CREATE TABLE [dbo].[Relatie_SyncExact]('&|
			'	[RelatieID] [int] NOT NULL,'&|
			'	[FirmaNaam] [varchar](50) NULL,'&|
			'	[Adres1] [varchar](100) NULL,'&|
			'	[Adres2] [varchar](100) NULL,'&|
			'	[Postcode] [varchar](20) NULL,'&|
			'	[Plaats] [varchar](100) NULL,'&|
			'	[Telefoon] [varchar](25) NULL,'&|
			'	[Mobiel] [varchar](30) NULL,'&|
			'	[Fax] [varchar](25) NULL,'&|
			'	[Type] [varchar](25) NULL,'&|
			'	[Country] [varchar](60) NULL,'&|
			'	[ItemCode] [char](2) NULL,'&|
			' CONSTRAINT [PK_Relatie_SyncExact] PRIMARY KEY CLUSTERED '&|
			'('&|
			'	[RelatieID] ASC'&|
			')WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]'&|
			') ON [PRIMARY]'
		Versie{Prop:SQL} = SQLCommando
		IF error() then Stop(Error()& FileError()&' bij prop:SQL(2) ' & SQLCommando).

		SQLCommando = 'CREATE NONCLUSTERED INDEX [FK1_Relatie_SyncExact] ON [dbo].[Relatie_SyncExact] '&|
			'('&|
			'	[FirmaNaam] ASC'&|
			')WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]'
		Versie{Prop:SQL} = SQLCommando
		IF error() then Stop(Error()& FileError()&' bij prop:SQL(2) ' & SQLCommando).
		
		SQLCommando = 'CREATE VIEW [dbo].[ViewVoorraadPartij_INDEXED] WITH SCHEMABINDING '&|
			'AS '&|
			'SELECT dbo.Partij.PartijID, dbo.Partij.ArtikelID, dbo.Artikel_SyncExact.ArtikelOms, dbo.Mutatie.CelID, dbo.Partij.ExternPartijnr, dbo.Partij.AanmaakDatum, '&|
			'dbo.Cel.CelOms, dbo.Verpakking.VerpakkingID, dbo.Verpakking.VerpakkingOmschrijving, dbo.Relatie_SyncExact.FirmaNaam AS LeverancierFirmaNaam, '&|
			'SUM(ISNULL(dbo.Mutatie.InslagKG, 0)) AS InslagKG, SUM(ISNULL(dbo.Mutatie.InslagPallet, 0)) AS InslagPallets, SUM(ISNULL(dbo.Mutatie.UitslagKG, '&|
			'0)) AS UitslagKG, SUM(ISNULL(dbo.Mutatie.UitslagPallet, 0)) AS UitslagPallets, COUNT_BIG(*) AS CountBig '&|
			'FROM dbo.Partij INNER JOIN '&|
			'dbo.Artikel_SyncExact ON dbo.Artikel_SyncExact.ArtikelID = dbo.Partij.ArtikelID INNER JOIN '&|
			'dbo.Relatie_SyncExact ON dbo.Relatie_SyncExact.RelatieID = dbo.Partij.Leverancier INNER JOIN '&|
			'dbo.Mutatie ON dbo.Partij.PartijID = dbo.Mutatie.PartijID AND dbo.Partij.ArtikelID = dbo.Mutatie.ArtikelID INNER JOIN '&|
			'dbo.Cel ON dbo.Mutatie.CelID = dbo.Cel.Celid INNER JOIN '&|
			'dbo.Verpakking ON dbo.Partij.VerpakkingID = dbo.Verpakking.VerpakkingID '&|
			'GROUP BY dbo.Partij.PartijID, dbo.Partij.ArtikelID, dbo.Artikel_SyncExact.ArtikelOms, dbo.Mutatie.CelID, dbo.Partij.ExternPartijnr, dbo.Partij.AanmaakDatum, '&|
			'dbo.Cel.CelOms, dbo.Verpakking.VerpakkingID, dbo.Verpakking.VerpakkingOmschrijving, dbo.Relatie_SyncExact.FirmaNaam'
		Versie{Prop:SQL} = SQLCommando
		IF error() then Stop(Error()& FileError()&' bij prop:SQL(2) ' & SQLCommando).

		SQLCommando = 'CREATE UNIQUE CLUSTERED INDEX [PK_ViewVoorraadPartij] ON [dbo].[ViewVoorraadPartij_INDEXED] '&|
			'('&|
			'	[ArtikelID] ASC,'&|
			'	[PartijID] ASC,'&|
			'	[CelID] ASC'&|
			')WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]'
		Versie{Prop:SQL} = SQLCommando
		IF error() then Stop(Error()& FileError()&' bij prop:SQL(2) ' & SQLCommando).
		
		SQLCommando = 'CREATE NONCLUSTERED INDEX [FK1_ViewVoorraadPartij] ON [dbo].[ViewVoorraadPartij_INDEXED] '&|
			'('&|
			'	[ArtikelOms] ASC,'&|
			'	[PartijID] ASC,'&|
			'	[CelID] ASC'&|
			')WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]'
		Versie{Prop:SQL} = SQLCommando
		IF error() then Stop(Error()& FileError()&' bij prop:SQL(2) ' & SQLCommando).

		SQLCommando = 'CREATE NONCLUSTERED INDEX [FK2_ViewVoorraadPartij] ON [dbo].[ViewVoorraadPartij_INDEXED] '&|
			'('&|
			'	[ExternPartijnr] ASC,'&|
			'	[PartijID] ASC,'&|
			'	[CelID] ASC'&|
			')WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]'
		Versie{Prop:SQL} = SQLCommando
		IF error() then Stop(Error()& FileError()&' bij prop:SQL(2) ' & SQLCommando).

		SQLCommando = 'CREATE NONCLUSTERED INDEX [FK3_ViewVoorraadPartij] ON [dbo].[ViewVoorraadPartij_INDEXED] '&|
			'('&|
			'	[PartijID] ASC,'&|
			'	[CelID] ASC'&|
			')WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]'
		Versie{Prop:SQL} = SQLCommando
		IF error() then Stop(Error()& FileError()&' bij prop:SQL(2) ' & SQLCommando).
		
		LOC:ToonWijziging = true
	End


of 1.54 ! 9-2-2011
	Clear(VRS:Record)
	VRS:Versie=Loc:Versie
	If Access:Versie.Fetch(VRS:Versie_PK)
				
		VRS:Versie = Loc:Versie
		VRS:DatumTijd_DATE = Today()
		VRS:DatumTijd_TIME = Clock()
		VRS:Wijzigingen= 'CMR aangepast zodat niet per partij maar per artikel een regel wordt geprint. '&|
			'Na het printen van stickers werd dit niet op de de planning getoond, dit is aangepast.'
		Access:Versie.Insert()
		
		LOC:ToonWijziging = true
	End
of 1.53 ! 19-1-2011
	Clear(VRS:Record)
	VRS:Versie=Loc:Versie
	If Access:Versie.Fetch(VRS:Versie_PK)
				
		VRS:Versie = Loc:Versie
		VRS:DatumTijd_DATE = Today()
		VRS:DatumTijd_TIME = Clock()
		VRS:Wijzigingen= 'Verkopen in de planning werkt nu beter. Logging in de weegfunctie toegevoegd.'
		Access:Versie.Insert()
		
		LOC:ToonWijziging = true
	End
of 1.52 ! 12-1-2011
	Clear(VRS:Record)
	VRS:Versie=Loc:Versie
	If Access:Versie.Fetch(VRS:Versie_PK)
				
		VRS:Versie = Loc:Versie
		VRS:DatumTijd_DATE = Today()
		VRS:DatumTijd_TIME = Clock()
		VRS:Wijzigingen= 'Probleem met tarra-telling opgelost. Totalen bij weging zijn voor de hele planningregel.'
		Access:Versie.Insert()
		
		LOC:ToonWijziging = true
	End
of 1.51 ! 12-1-2011
	Clear(VRS:Record)
	VRS:Versie=Loc:Versie
	If Access:Versie.Fetch(VRS:Versie_PK)
				
		VRS:Versie = Loc:Versie
		VRS:DatumTijd_DATE = Today()
		VRS:DatumTijd_TIME = Clock()
		VRS:Wijzigingen= 'Programma gecomplieeerd met verie 7.3 .'
		Access:Versie.Insert()
		
		LOC:ToonWijziging = true
	End
of 1.50 ! 12-1-2011
	Clear(VRS:Record)
	VRS:Versie=Loc:Versie
	If Access:Versie.Fetch(VRS:Versie_PK)
		SQLCommando='DROP VIEW [dbo].[ViewPartijCelLocaties]'
		Versie{Prop:SQL} = SQLCommando
		IF error() then Stop(Error()& FileError()&' bij prop:SQL(1) ' & SQLCommando).

			
		SQLCommando='CREATE VIEW [dbo].[ViewPartijCelLocaties] AS '&|
			'SELECT     TOP (100) PERCENT dbo.Mutatie.PartijID, dbo.Mutatie.CelID, ISNULL(dbo.Mutatie.CelLocatieID, 0) AS CelLocatieID, dbo.CelLocatie.Locatienaam AS CelLocatienaam '&|
			'FROM         dbo.Mutatie LEFT OUTER JOIN '&|
			'dbo.CelLocatie ON dbo.CelLocatie.CelLocatieID = dbo.Mutatie.CelLocatieID '&|
			'GROUP BY dbo.Mutatie.PartijID, dbo.Mutatie.CelID, dbo.Mutatie.CelLocatieID, dbo.CelLocatie.Locatienaam '&|
			'ORDER BY dbo.Mutatie.PartijID, dbo.Mutatie.CelID, CelLocatieID'
		Versie{Prop:SQL} = SQLCommando
		IF error() then Stop(Error()& FileError()&' bij prop:SQL(2) ' & SQLCommando).
				
		VRS:Versie = Loc:Versie
		VRS:DatumTijd_DATE = Today()
		VRS:DatumTijd_TIME = Clock()
		VRS:Wijzigingen= 'In partij-voorraden worden per regel de cel-locaties samengevoegd. Layout van de weging-rapporten aangepast. Gewichten/aantal kunnen bij extra verkoopmutaties nu ook uit de weging worden overgenomen.'
		Access:Versie.Insert()
		
		LOC:ToonWijziging = true
	End
	of 1.49 ! 4-1-2011
			Clear(VRS:Record)
			VRS:Versie=Loc:Versie
			If Access:Versie.Fetch(VRS:Versie_PK)
				VRS:Versie = Loc:Versie
				VRS:DatumTijd_DATE = Today()
				VRS:DatumTijd_TIME = Clock()
				VRS:Wijzigingen= 'Bij wegingen knop toegevoegd om automatisch te KG/Pallets over te nemen. Opmaak wegingsrapport aangepast.'
				Access:Versie.Insert()
				
				LOC:ToonWijziging = true
			End
	of 1.48 ! 4-1-2011
			Clear(VRS:Record)
			VRS:Versie=Loc:Versie
			If Access:Versie.Fetch(VRS:Versie_PK)
				VRS:Versie = Loc:Versie
				VRS:DatumTijd_DATE = Today()
				VRS:DatumTijd_TIME = Clock()
				VRS:Wijzigingen= 'Volgorde kolommen bij Verkoop in planning aangepast. Geen preview/aangepaste layout bij Dymo etiketten. '
				Access:Versie.Insert()
				
				LOC:ToonWijziging = true
			End
		of 1.47 ! 3-1-2011
			Clear(VRS:Record)
			VRS:Versie=Loc:Versie
			If Access:Versie.Fetch(VRS:Versie_PK)
				VRS:Versie = Loc:Versie
				VRS:DatumTijd_DATE = Today()
				VRS:DatumTijd_TIME = Clock()
				VRS:Wijzigingen= 'Etiketten printen via de Dymo. Bugfix toevoegen Wegingen. '
				Access:Versie.Insert()
				
				LOC:ToonWijziging = true
			End		
		of 1.46 ! 31-12-2010
			Clear(VRS:Record)
			VRS:Versie=Loc:Versie
			If Access:Versie.Fetch(VRS:Versie_PK)
				SQLCommando='ALTER TABLE [dbo].[Weging] ADD WeegDatumTijd DATETIME'
				Versie{Prop:SQL} = SQLCommando
				IF error() then Stop(Error()& FileError()&' bij prop:SQL(1) ' & SQLCommando).
				
				VRS:Versie = Loc:Versie
				VRS:DatumTijd_DATE = Today()
				VRS:DatumTijd_TIME = Clock()
				VRS:Wijzigingen= 'Datum en tijd wordt bij de weging vastgelegd.'
				Access:Versie.Insert()
				
				LOC:ToonWijziging = true
			End				
		of 1.45 ! 30-12-2010
			Clear(VRS:Record)
			VRS:Versie=Loc:Versie
			If Access:Versie.Fetch(VRS:Versie_PK)
				SQLCommando='DROP VIEW [dbo].[ViewVoorraadPartij]'
				Versie{Prop:SQL} = SQLCommando
				IF error() then Stop(Error()& FileError()&' bij prop:SQL(1) ' & SQLCommando).

				SQLCommando='CREATE VIEW [dbo].[ViewVoorraadPartij] AS '&|
					'SELECT TOP (100) PERCENT dbo.Partij.PartijID, dbo.Partij.ArtikelID, dbo.ViewArtikel.ArtikelOms, dbo.Mutatie.CelID, dbo.Partij.ExternPartijnr, '&|
                	'dbo.Partij.AanmaakDatum, dbo.Cel.CelOms, dbo.Verpakking.VerpakkingID, dbo.Verpakking.VerpakkingOmschrijving, '&|
                	'dbo.ViewRelatie.FirmaNaam AS LeverancierFirmanaam, SUM(ISNULL(dbo.Mutatie.InslagKG, 0)) AS InslagKG, SUM(ISNULL(dbo.Mutatie.InslagPallet, 0)) '&|
                	'AS InslagPallets, SUM(ISNULL(dbo.Mutatie.UitslagKG, 0)) AS UitslagKG, SUM(ISNULL(dbo.Mutatie.UitslagPallet, 0)) AS UitslagPallets, '&|
                	'SUM(ISNULL(dbo.Mutatie.InslagKG, 0)) - SUM(ISNULL(dbo.Mutatie.UitslagKG, 0)) AS VoorraadKG, SUM(ISNULL(dbo.Mutatie.InslagPallet, 0)) '&|
                	'- SUM(ISNULL(dbo.Mutatie.UitslagPallet, 0)) AS VoorraadPallets, CAST(dbo.Partij.PartijID AS VARCHAR(12)) '&|
                	'+ ''.'' + CAST(dbo.Mutatie.CelID AS VARCHAR(12)) AS PartijCelID, 0 AS CelLocatieID, '''' AS Locatienaam '&|
                'FROM dbo.Partij INNER JOIN '&|
                	'dbo.ViewArtikel ON dbo.Partij.ArtikelID = dbo.ViewArtikel.ArtikelID INNER JOIN '&|
                	'dbo.Mutatie ON dbo.Partij.PartijID = dbo.Mutatie.PartijID AND dbo.Partij.ArtikelID = dbo.Mutatie.ArtikelID INNER JOIN '&|
                	'dbo.Cel ON dbo.Mutatie.CelID = dbo.Cel.Celid INNER JOIN '&|
                	'dbo.Verpakking ON dbo.Partij.VerpakkingID = dbo.Verpakking.VerpakkingID LEFT OUTER JOIN '&|
                	'dbo.ViewRelatie ON dbo.Partij.Leverancier = dbo.ViewRelatie.RelatieID '&|
                'GROUP BY dbo.Partij.PartijID, dbo.Partij.ArtikelID, dbo.ViewArtikel.ArtikelOms, dbo.Mutatie.CelID, dbo.Partij.ExternPartijnr, dbo.Partij.AanmaakDatum, '&|
                	'dbo.Cel.CelOms, dbo.Verpakking.VerpakkingID, dbo.Verpakking.VerpakkingOmschrijving, dbo.ViewRelatie.FirmaNaam '&|
					'ORDER BY dbo.Partij.ArtikelID, dbo.Partij.PartijID, dbo.Mutatie.CelID'
				Versie{Prop:SQL} = SQLCommando
				IF error() then Stop(Error()& FileError()&' bij prop:SQL(2) ' & SQLCommando).
					
				SQLCommando='CREATE VIEW [dbo].[ViewPartijCelLocaties] AS '&|
					'SELECT     TOP (100) PERCENT dbo.Mutatie.PartijID, dbo.Mutatie.CelID, ISNULL(dbo.Mutatie.CelLocatieID, 0) AS CelLocatieID, dbo.CelLocatie.Locatienaam AS CelLocatienaam '&|
					'FROM         dbo.Mutatie LEFT OUTER JOIN '&|
					'dbo.CelLocatie ON dbo.CelLocatie.CelLocatieID = dbo.Mutatie.CelLocatieID '&|
					'ORDER BY dbo.Mutatie.PartijID, dbo.Mutatie.CelID, CelLocatieID'
				Versie{Prop:SQL} = SQLCommando
				IF error() then Stop(Error()& FileError()&' bij prop:SQL(2) ' & SQLCommando).
						
				VRS:Versie = Loc:Versie
				VRS:DatumTijd_DATE = Today()
				VRS:DatumTijd_TIME = Clock()
				VRS:Wijzigingen= 'ViewVoorraadPartij niet meer opsplitsen per locatie. ViewPartijCelLocaties toegevoegd om de locaties van een partij in een cel te bepalen.'
				Access:Versie.Insert()
				
				LOC:ToonWijziging = true
			End
		of 1.44 ! 23-12-2010
			Clear(VRS:Record)
			VRS:Versie=Loc:Versie
			If Access:Versie.Fetch(VRS:Versie_PK)
				VRS:Versie = Loc:Versie
				VRS:DatumTijd_DATE = Today()
				VRS:DatumTijd_TIME = Clock()
				VRS:Wijzigingen= 'Volgorde voorraadverloop aangepast voor overboekingen. Weging-knoppen op de planning toegevoegd.'
				Access:Versie.Insert()
				
				LOC:ToonWijziging = true
			End
		of 1.43 ! 14-12-2010
			Clear(VRS:Record)
			VRS:Versie=Loc:Versie
			If Access:Versie.Fetch(VRS:Versie_PK)
				SQLCommando='DROP VIEW [dbo].[ViewArtikel]'
				Versie{Prop:SQL} = SQLCommando
				IF error() then Stop(Error()& FileError()&' bij prop:SQL(1) ' & SQLCommando). |
					
				SQLCommando='CREATE VIEW [dbo].[ViewArtikel] AS '&|
				'SELECT     ItemCode AS ArtikelID, Description AS ArtikelOms, Assortment AS ArtikelGroep '&|
				'FROM         [010].dbo.Items WHERE     (Type = <39>S<39>) AND (Condition = <39>A<39>)'
				Versie{Prop:SQL} = SQLCommando
				IF error() then Stop(Error()& FileError()&' bij prop:SQL(2) ' & SQLCommando). |
			

				VRS:Versie = Loc:Versie
				VRS:DatumTijd_DATE = Today()
				VRS:DatumTijd_TIME = Clock()
				VRS:Wijzigingen= 'Artikelbestand uitbreiden met artikelgroepent'
				Access:Versie.Insert()
				
				LOC:ToonWijziging = true
			End
		of 1.42 ! 9-12-2010
			Clear(VRS:Record)
			VRS:Versie=Loc:Versie
			If Access:Versie.Fetch(VRS:Versie_PK)
				!SQLCommando='CREATE TABLE [dbo].[Versie]('&|
				!'[VERSIE] [decimal](7, 2) NOT NULL,'&|
				!'[DATUMTIJD] [datetime] NULL,'&|
				!'[WIJZIGINGEN] [varchar](999) NULL,'&|
				!'PRIMARY KEY CLUSTERED'&| 
				!'('&|
				!'[VERSIE] ASC'&|
				!')WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]'&|
				!') ON [PRIMARY]'
				
				!Versie{Prop:SQL} = SQLCommando
				!IF error() then Stop(Error()& FileError()&' bij prop:SQL ' & SQLCommando).

				VRS:Versie = Loc:Versie
				VRS:DatumTijd_DATE = Today()
				VRS:DatumTijd_TIME = Clock()
				VRS:Wijzigingen= 'Het ophalen van de locaties duurde lang in de planning dit is aangepast'
				Access:Versie.Insert()
				
				LOC:ToonWijziging = true
			End
		of 1.41 ! 1-12-2010
			Clear(VRS:Record)
			VRS:Versie=Loc:Versie
			If Access:Versie.Fetch(VRS:Versie_PK)
				!SQLCommando='CREATE TABLE [dbo].[Versie]('&|
				!'[VERSIE] [decimal](7, 2) NOT NULL,'&|
				!'[DATUMTIJD] [datetime] NULL,'&|
				!'[WIJZIGINGEN] [varchar](999) NULL,'&|
				!'PRIMARY KEY CLUSTERED'&| 
				!'('&|
				!'[VERSIE] ASC'&|
				!')WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]'&|
				!') ON [PRIMARY]'
				
				!Versie{Prop:SQL} = SQLCommando
				!IF error() then Stop(Error()& FileError()&' bij prop:SQL ' & SQLCommando).

				VRS:Versie = Loc:Versie
				VRS:DatumTijd_DATE = Today()
				VRS:DatumTijd_TIME = Clock()
				VRS:Wijzigingen= 'Transfers naar Excel aangepast. NetRefresh refresht nu om de 10 seconden.'
				Access:Versie.Insert()
				
				LOC:ToonWijziging = true
			End
		of 1.40 ! 1-12-2010
			Clear(VRS:Record)
			VRS:Versie=Loc:Versie
			If Access:Versie.Fetch(VRS:Versie_PK)
				!SQLCommando='CREATE TABLE [dbo].[Versie]('&|
				!'[VERSIE] [decimal](7, 2) NOT NULL,'&|
				!'[DATUMTIJD] [datetime] NULL,'&|
				!'[WIJZIGINGEN] [varchar](999) NULL,'&|
				!'PRIMARY KEY CLUSTERED'&| 
				!'('&|
				!'[VERSIE] ASC'&|
				!')WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]'&|
				!') ON [PRIMARY]'
				
				!Versie{Prop:SQL} = SQLCommando
				!IF error() then Stop(Error()& FileError()&' bij prop:SQL ' & SQLCommando).

				VRS:Versie = Loc:Versie
				VRS:DatumTijd_DATE = Today()
				VRS:DatumTijd_TIME = Clock()
				VRS:Wijzigingen= 'Print-preview voor de CMR uitgeschakeld. Op de planning bij verkoop staat nu ook de cel-locatie(s) van die partij/cel-combinatie.'
				Access:Versie.Insert()
				
				LOC:ToonWijziging = true
			End
		of 1.39 ! 26-11-2010
			Clear(VRS:Record)
			VRS:Versie=Loc:Versie
			If Access:Versie.Fetch(VRS:Versie_PK)
				!SQLCommando='CREATE TABLE [dbo].[Versie]('&|
				!'[VERSIE] [decimal](7, 2) NOT NULL,'&|
				!'[DATUMTIJD] [datetime] NULL,'&|
				!'[WIJZIGINGEN] [varchar](999) NULL,'&|
				!'PRIMARY KEY CLUSTERED'&| 
				!'('&|
				!'[VERSIE] ASC'&|
				!')WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]'&|
				!') ON [PRIMARY]'
				
				!Versie{Prop:SQL} = SQLCommando
				!IF error() then Stop(Error()& FileError()&' bij prop:SQL ' & SQLCommando).

				VRS:Versie = Loc:Versie
				VRS:DatumTijd_DATE = Today()
				VRS:DatumTijd_TIME = Clock()
				VRS:Wijzigingen= 'Versie-systeem is toegevoegd. Bij het tabblad voorraad per cel wordt nu een totaal telling gedaan.'
				Access:Versie.Insert()
				
				LOC:ToonWijziging = true
			End
		End	
		
!		IF LOC:ToonWijziging THEN
!			MESSAGE(VRS:Wijzigingen, 'Nieuwe wijzigingen '  & VRS:Versie)
!		END
	End		
	!Access:Versie.Close()
	!IF Error() Then Stop(Error()&' bij het sluiten van de versie').
    DO CloseFiles
	!GLO:Versie = VRS:Versie
           
  
!--------------------------------------
OpenFiles  ROUTINE
  Relate:Versie.Open()                                     ! File Versie used by this procedure, so make sure it's RelationManager is open
  FilesOpened = True
!--------------------------------------
CloseFiles ROUTINE
  IF FilesOpened THEN
     Relate:Versie.Close
     FilesOpened = False
  END
LocalClass.SchrijfVersie    PROCEDURE(Real pVersie,String pWijziging)

CODE
        VRS:Versie = pVersie
        VRS:DatumTijd_DATE = Today()
        VRS:DatumTijd_TIME = Clock()
        VRS:Wijzigingen= pWijziging
        Access:Versie.Insert()
        If ErrorCode()
            Message('Error in PROP:SQL (' & ErrorCode() & ') ' & Clip(Error()) & |
                Choose(ErrorCode()=90,'||Server error (' & FileErrorCode() & ') ' & Clip(FileError()),''),'Insert Into', ICON:Exclamation)
        End 
    
LocalClass.ExecuteSQLCommando       PROCEDURE(String pSQLCommando)
ErrorMelding                    Cstring(1000)
CODE
    st.Append(Format(Today(),@d6-)&' '&Format(Clock(),'T4')&' Versie: '&Loc:Versie&' '&pSQLCommando,,'<13,10>')
    Versie{Prop:SQL}=pSQLCommando
    If ErrorCode() 
        ErrorMelding = 'SQL Error (' & ErrorCode() & ') ' & Clip(Error())& Choose(ErrorCode()=90,'||Server error (' & FileErrorCode() & ') ' & Clip(FileError()),'')
        st.Append('Error : '&ErrorMelding,,'<13,10>')
        Message(ErrorMelding, 'Versie: '&Loc:Versie&' '&pSQLCommando, ICON:Exclamation)
    END
    RETURN
    
