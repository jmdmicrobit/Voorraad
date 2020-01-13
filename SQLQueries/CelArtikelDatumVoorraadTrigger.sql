IF OBJECT_ID('VerwerkCelArtikelDatumVoorraad_Mutatie','P') IS NOT NULL
    DROP PROCEDURE VerwerkCelArtikelDatumVoorraad_Mutatie;
GO

CREATE PROCEDURE VerwerkCelArtikelDatumVoorraad_Mutatie
@Deleted tinyint, -- 1 = deleted / 0 = inserted
@CelID int,
@ArtikelID varchar(30),
@DatumTijd datetime,
@SoortMutatie varchar(4),
@InslagKG decimal(18,2),
@InslagPallets int,
@UitslagKG decimal(18,2),
@UitslagPallets int
AS
BEGIN
	--DECLARE @CorrectieInslagKG decimal(18,2)
	--DECLARE @CorrectieUitslagKG decimal(18,2)
	DECLARE @CorrectieVoorraadKG decimal(18,2)
	DECLARE @VoorraadKG decimal(18,2)
	--DECLARE @CorrectieInslagPallets int
	--DECLARE @CorrectieUitslagPallets int
	--DECLARE @CorrectieVoorraadPallets int

	-- Controleren of ArtikelID gevuld is
	-- Namelijk: Clarion Insert = SQL-INSERT + SQL-UPDATE
	-- De deleted v/d SQL-UPDATE bevat dan een record met enkel de ge-prime-de gegevens
	IF NOT(@ArtikelID = '')
	BEGIN
		-- Controleren of voorraad-stand voor de gewenste DatumTijd/Artikel/Cel al bestaat
		IF (SELECT COUNT(*) FROM CelArtikelDatumVoorraad AS VS WHERE VS.ArtikelID = @ArtikelID AND VS.CelID = @CelID AND VS.DatumTijd = @DatumTijd) = 0
		BEGIN
			--SELECT TOP(1) VoorraadKG FROM CelArtikelDatumVoorraad AS VS WHERE VS.ArtikelID = @ArtikelID AND VS.CelID = @CelID AND VS.DatumTijd < @DatumTijd ORDER BY VS.DatumTijd DESC
			
			SET @VoorraadKG = SELECT TOP(1) VoorraadKG FROM CelArtikelDatumVoorraad AS VS WHERE VS.ArtikelID = @ArtikelID AND VS.CelID = @CelID AND VS.DatumTijd < @DatumTijd ORDER BY VS.DatumTijd DESC
		
			-- Lege telling toevoegen
			INSERT INTO CelArtikelDatumVoorraad (CelID, ArtikelID, DatumTijd, VoorraadKG)
				VALUES(@CelID, @ArtikelID, @DatumTijd, @VoorraadKG);
		END
		
		IF (@SoortMutatie = 'IN' OR @SoortMutatie = 'OIN' OR @SoortMutatie = 'EIN')
			BEGIN
				--SET @CorrectieInslagKG = @InslagKG
				--SET @CorrectieInslagPallets = @InslagPallets
				--SET @CorrectieUitslagKG = 0
				--SET @CorrectieUitslagPallets = 0
				SET @CorrectieVoorraadKG = @InslagKG
				--SET @CorrectieVoorraadPallets = @InslagPallets
			END
		ELSE IF (@SoortMutatie = 'UIT' OR @SoortMutatie = 'OUIT' OR @SoortMutatie = 'EUIT')
			BEGIN
				--SET @CorrectieInslagKG = 0
				--SET @CorrectieInslagPallets = 0
				--SET @CorrectieUitslagKG = @UitslagKG
				--SET @CorrectieUitslagPallets = @UitslagPallets
				SET @CorrectieVoorraadKG = -@UitslagKG
				--SET @CorrectieVoorraadPallets = -@UitslagPallets
			END
		
		IF (@Deleted = 1)
		BEGIN
			--SET @CorrectieInslagKG = -@CorrectieInslagKG
			--SET @CorrectieInslagPallets = -@CorrectieInslagPallets
			--SET @CorrectieUitslagKG = -@CorrectieUitslagKG
			--SET @CorrectieUitslagPallets = -@CorrectieUitslagPallets
			SET @CorrectieVoorraadKG = -@CorrectieVoorraadKG
			--SET @CorrectieVoorraadPallets = -@CorrectieVoorraadPallets
		END

		-- Alle voorraad-standen (inclusief de eventueel aangemaakte) vanaf de DatumTijd bijwerken
		UPDATE CelArtikelDatumVoorraad SET
			--InslagKG = InslagKG + @CorrectieInslagKG,
			--UitslagKG = UitslagKG + @CorrectieUitslagKG,
			VoorraadKG = VoorraadKG + @CorrectieVoorraadKG
			--InslagPallets = InslagPallets + @CorrectieInslagPallets,
			--UitslagPallets = UitslagPallets + @CorrectieUitslagPallets,
			--VoorraadPallets = VoorraadPallets + @CorrectieVoorraadPallets
			WHERE ArtikelID = @ArtikelID AND CelID = @CelID AND DatumTijd >= @DatumTijd
	END			
END
GO

IF OBJECT_ID ('CelArtikelDatumVoorraadTrigger_Mutatie','TR') IS NOT NULL
    DROP TRIGGER CelArtikelDatumVoorraadTrigger_Mutatie;
GO

CREATE TRIGGER CelArtikelDatumVoorraadTrigger_Mutatie
ON dbo.Mutatie
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
	-- Relevante variabelen
	DECLARE @ArtikelID varchar(30)
	DECLARE @CelID int
	DECLARE @DatumTijd datetime
	DECLARE @SoortMutatie varchar(4)
	DECLARE @UitslagKG decimal(18,2)
	DECLARE @UitslagPallets int
	DECLARE @InslagKG decimal(18,2)
	DECLARE @InslagPallets int

	SET NOCOUNT ON;
	
	-- Deleted verwerken
	IF (SELECT COUNT(*) FROM Deleted) = 1
	BEGIN 
		-- Ophalen velden van het verwijderde record
		--SELECT DATEADD(dd, 0, DATEDIFF(dd, 0, @your_date))
		SELECT @ArtikelID = mut.ArtikelID
			  ,@CelID = mut.CelID
			  ,@DatumTijd = DATEADD(dd, 0, DATEDIFF(dd, 0, mut.DatumTijd))
			  ,@SoortMutatie = mut.SoortMutatie
			  ,@InslagKG = mut.InslagKG
			  ,@InslagPallets = mut.InslagPallet
			  ,@UitslagKG = mut.UitslagKG
			  ,@UitslagPallets = mut.UitslagPallet
			FROM deleted AS mut;

		EXECUTE VerwerkCelArtikelDatumVoorraad_Mutatie 1, @CelID, @ArtikelID, @DatumTijd, @SoortMutatie, @InslagKG, @InslagPallets, @UitslagKG, @UitslagPallets;
	END		
	
	-- Inserted verwerken
	IF (SELECT COUNT(*) FROM Inserted) = 1
	BEGIN 
		SELECT @ArtikelID = mut.ArtikelID
			  ,@CelID = mut.CelID
			  ,@DatumTijd = DATEADD(dd, 0, DATEDIFF(dd, 0, mut.DatumTijd))
			  ,@SoortMutatie = mut.SoortMutatie
			  ,@InslagKG = mut.InslagKG
			  ,@InslagPallets = mut.InslagPallet
			  ,@UitslagKG = mut.UitslagKG
			  ,@UitslagPallets = mut.UitslagPallet
			FROM inserted AS mut;

		EXECUTE VerwerkCelArtikelVoorraad_Mutatie 0, @CelID, @ArtikelID, @DatumTijd, @SoortMutatie, @InslagKG, @InslagPallets, @UitslagKG, @UitslagPallets;
	END		
END
GO

IF OBJECT_ID('VulCelArtikelDatumVoorraad','P') IS NOT NULL
    DROP PROCEDURE VulCelArtikelDatumVoorraad;
GO

CREATE PROCEDURE VulCelArtikelDatumVoorraad
AS
BEGIN
	-- Voorraadstand leeggooien
	DELETE FROM CelArtikelDatumVoorraad
	
	-- Voorraadstand opnieuw opbouwen
	INSERT INTO CelArtikelDatumVoorraad (CelID, ArtikelID, DatumTijd, VoorraadKG)
		SELECT CelID, ArtikelID, DatumTijd,  
			(SUM(CASE SoortMutatie
				WHEN 'IN' THEN InslagKG
				WHEN 'EIN' THEN InslagKG
				WHEN 'OIN' THEN InslagKG
				WHEN 'UIT' THEN -UitslagKG
				WHEN 'EUIT' THEN -UitslagKG
				WHEN 'OUIT' THEN -UitslagKG
			END) + (SELECT TOP(1) VoorraadKG FROM
			CelArtikelDatumVoorraad AS VS WHERE VS.ArtikelID = ArtikelID AND
			VS.CelID = CelID AND VS.DatumTijd < DatumTijd
			ORDER BY VS.DatumTijd DESC)
			FROM Mutatie GROUP BY CelID, ArtikelID, DatumTijd	
END
GO

EXECUTE VulCelArtikelDatumVoorraad