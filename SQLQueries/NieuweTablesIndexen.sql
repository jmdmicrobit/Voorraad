USE [Voorraad]
GO

/****** Object:  Table [dbo].[PartijCelVoorraad]    Script Date: 01/04/2013 13:23:31 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[PartijCelVoorraad](
	[PartijCelVoorraadID] [bigint] IDENTITY(1,1) NOT NULL,
	[PartijID] [int] NULL,
	[CelID] [int] NULL,
	[PartijCelVoorraadKG] [decimal](18, 2) NULL,
	[PartijCelVerkochtKG] [decimal](18, 2) NULL,
	[PartijVoorraadKG] [decimal](18, 2) NULL,
	[PartijVerkochtKG] [decimal](18, 2) NULL,
	[ExternPartijnr] [varchar](20) NULL,
	[ArtikelOms] [varchar](60) NULL,
 CONSTRAINT [PK_PartijCelVoorraad] PRIMARY KEY CLUSTERED 
(
	[PartijCelVoorraadID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

/****** Object:  Index [FK1_PartijCelVoorraad]    Script Date: 01/04/2013 13:24:29 ******/
CREATE UNIQUE NONCLUSTERED INDEX [FK1_PartijCelVoorraad] ON [dbo].[PartijCelVoorraad] 
(
	[PartijID] ASC,
	[CelID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO

/****** Object:  Index [FK2_PartijCelVoorraad]    Script Date: 01/04/2013 13:24:23 ******/
CREATE UNIQUE NONCLUSTERED INDEX [FK2_PartijCelVoorraad] ON [dbo].[PartijCelVoorraad] 
(
	[CelID] ASC,
	[PartijID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO

CREATE TABLE [dbo].[CelArtikelDatumVoorraad](
	[CelArtikelDatumVoorraadID] [bigint] IDENTITY(1,1) NOT NULL,
	[CelID] [int] NULL,
	[ArtikelID] [varchar](40) NULL,
	[DatumTijd] [datetime] NULL,
	[VoorraadKG] [decimal](18, 2) NULL,
 CONSTRAINT [PK_CelArtikelDatumVoorraad] PRIMARY KEY CLUSTERED 
(
	[CelArtikelDatumVoorraadID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

CREATE TABLE [dbo].[CelArtikelVoorraad](
	[CelArtikelVoorraadID] [bigint] IDENTITY(1,1) NOT NULL,
	[CelID] [int] NULL,
	[ArtikelID] [varchar](40) NULL,
	[InslagKG] [int] NULL,
	[UitslagKG] [int] NULL,
	[VoorraadKG] [int] NULL,
	[InslagPallets] [int] NULL,
	[UitslagPallets] [int] NULL,
	[VoorraadPallets] [int] NULL,
 CONSTRAINT [PK_CelArtikelVoorraad] PRIMARY KEY CLUSTERED 
(
	[CelArtikelVoorraadID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

/****** Object:  Index [FK1_CelArtikelVoorrraad]    Script Date: 01/04/2013 14:03:28 ******/
CREATE UNIQUE NONCLUSTERED INDEX [FK1_CelArtikelVoorrraad] ON [dbo].[CelArtikelVoorraad] 
(
	[CelID] ASC,
	[ArtikelID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO

/****** Object:  Index [FK2_CelArtikelVoorraad]    Script Date: 01/04/2013 14:03:31 ******/
CREATE UNIQUE NONCLUSTERED INDEX [FK2_CelArtikelVoorraad] ON [dbo].[CelArtikelVoorraad] 
(
	[ArtikelID] ASC,
	[CelID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO


SET ANSI_PADDING OFF
GO


