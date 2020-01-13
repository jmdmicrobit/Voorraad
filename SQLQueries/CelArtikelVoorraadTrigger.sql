IF OBJECT_ID('VerwerkCelArtikelVoorraad_Mutatie','P') IS NOT NULL
    DROP PROCEDURE VerwerkCelArtikelVoorraad_Mutatie;
GO

CREATE PROCEDURE VerwerkCelArtikelVoorraad_Mutatie
@Deleted tinyint, -- 1 = deleted / 0 = inserted
@CelID int,
@ArtikelID varchar(30),
@SoortMutatie varchar(4),
@InslagKG decimal(18,2),
@InslagPallets int,
@UitslagKG decimal(18,2),
@UitslagPallets int
AS
BEGIN
	DECLARE @CorrectieInslagKG decimal(18,2)
	DECLARE @CorrectieUitslagKG decimal(18,2)
	DECLARE @CorrectieVoorraadKG decimal(18,2)
	DECLARE @CorrectieInslagPallets int
	DECLARE @CorrectieUitslagPallets int
	DECLARE @CorrectieVoorraadPallets int

	-- Controleren of ArtikelID gevuld is
	-- Namelijk: Clarion Insert = SQL-INSERT + SQL-UPDATE
	-- De deleted v/d SQL-UPDATE bevat dan een record met enkel de ge-prime-de gegevens
	IF NOT(@ArtikelID = '')
	BEGIN
		-- Controleren of voorraad-stand voor de gewenste DatumTijd/Artikel/Cel al bestaat
		IF (SELECT COUNT(*) FROM CelArtikelVoorraad AS VS WHERE VS.ArtikelID = @ArtikelID AND VS.CelID = @CelID) = 0
		BEGIN
			-- Lege telling toevoegen
			INSERT INTO CelArtikelVoorraad (CelID, ArtikelID, InslagKG, UitslagKG, VoorraadKG, InslagPallets, UitslagPallets, VoorraadPallets)
				VALUES(@CelID, @ArtikelID, 0, 0, 0, 0, 0, 0);
		END
		
		IF (@SoortMutatie = 'IN' OR @SoortMutatie = 'OIN' OR @SoortMutatie = 'EIN')
			BEGIN
				SET @CorrectieInslagKG = @InslagKG
				SET @CorrectieInslagPallets = @InslagPallets
				SET @CorrectieUitslagKG = 0
				SET @CorrectieUitslagPallets = 0
				SET @CorrectieVoorraadKG = @InslagKG
				SET @CorrectieVoorraadPallets = @InslagPallets
			END
		ELSE IF (@SoortMutatie = 'UIT' OR @SoortMutatie = 'OUIT' OR @SoortMutatie = 'EUIT')
			BEGIN
				SET @CorrectieInslagKG = 0
				SET @CorrectieInslagPallets = 0
				SET @CorrectieUitslagKG = @UitslagKG
				SET @CorrectieUitslagPallets = @UitslagPallets
				SET @CorrectieVoorraadKG = -@UitslagKG
				SET @CorrectieVoorraadPallets = -@UitslagPallets
			END
		
		IF (@Deleted = 1)
		BEGIN
			SET @CorrectieInslagKG = -@CorrectieInslagKG
			SET @CorrectieInslagPallets = -@CorrectieInslagPallets
			SET @CorrectieUitslagKG = -@CorrectieUitslagKG
			SET @CorrectieUitslagPallets = -@CorrectieUitslagPallets
			SET @CorrectieVoorraadKG = -@CorrectieVoorraadKG
			SET @CorrectieVoorraadPallets = -@CorrectieVoorraadPallets
		END

		-- Alle voorraad-standen (inclusief de eventueel aangemaakte) vanaf de DatumTijd bijwerken
		UPDATE CelArtikelVoorraad SET
			InslagKG = InslagKG + @CorrectieInslagKG,
			UitslagKG = UitslagKG + @CorrectieUitslagKG,
			VoorraadKG = VoorraadKG + @CorrectieVoorraadKG,
			InslagPallets = InslagPallets + @CorrectieInslagPallets,
			UitslagPallets = UitslagPallets + @CorrectieUitslagPallets,
			VoorraadPallets = VoorraadPallets + @CorrectieVoorraadPallets
			WHERE ArtikelID = @ArtikelID AND CelID = @CelID
	END			
END
GO

IF OBJECT_ID ('CelArtikelVoorraadTrigger_Mutatie','TR') IS NOT NULL
    DROP TRIGGER CelArtikelVoorraadTrigger_Mutatie;
GO

CREATE TRIGGER CelArtikelVoorraadTrigger_Mutatie
ON dbo.Mutatie
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
	-- Relevante variabelen
	DECLARE @ArtikelID varchar(30)
	DECLARE @CelID int
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
		SELECT @ArtikelID = mut.ArtikelID
			  ,@CelID = mut.CelID
			  ,@SoortMutatie = mut.SoortMutatie
			  ,@InslagKG = mut.InslagKG
			  ,@InslagPallets = mut.InslagPallet
			  ,@UitslagKG = mut.UitslagKG
			  ,@UitslagPallets = mut.UitslagPallet
			FROM deleted AS mut;

		EXECUTE VerwerkCelArtikelVoorraad_Mutatie 1, @CelID, @ArtikelID, @SoortMutatie, @InslagKG, @InslagPallets, @UitslagKG, @UitslagPallets;
	END		
	
	-- Inserted verwerken
	IF (SELECT COUNT(*) FROM Inserted) = 1
	BEGIN 
		SELECT @ArtikelID = mut.ArtikelID
			  ,@CelID = mut.CelID
			  ,@SoortMutatie = mut.SoortMutatie
			  ,@InslagKG = mut.InslagKG
			  ,@InslagPallets = mut.InslagPallet
			  ,@UitslagKG = mut.UitslagKG
			  ,@UitslagPallets = mut.UitslagPallet
			FROM inserted AS mut;

		EXECUTE VerwerkCelArtikelVoorraad_Mutatie 0, @CelID, @ArtikelID, @SoortMutatie, @InslagKG, @InslagPallets, @UitslagKG, @UitslagPallets;
	END		
END
GO

IF OBJECT_ID('VulCelArtikelVoorraad','P') IS NOT NULL
    DROP PROCEDURE VulCelArtikelVoorraad;
GO

CREATE PROCEDURE VulCelArtikelVoorraad
AS
BEGIN
	-- Voorraadstand leeggooien
	DELETE FROM CelArtikelVoorraad
	
	-- Voorraadstand opnieuw opbouwen
	INSERT INTO CelArtikelVoorraad (CelID, ArtikelID, InslagKG, UitslagKG, VoorraadKG, InslagPallets, UitslagPallets, VoorraadPallets)
		SELECT CelID, ArtikelID, 
			SUM((CASE SoortMutatie
				WHEN 'IN' THEN InslagKG
				WHEN 'EIN' THEN InslagKG
				WHEN 'OIN' THEN InslagKG
				WHEN 'UIT' THEN 0
				WHEN 'EUIT' THEN 0
				WHEN 'OUIT' THEN 0
			END)),
			SUM((CASE SoortMutatie
				WHEN 'IN' THEN 0
				WHEN 'EIN' THEN 0
				WHEN 'OIN' THEN 0
				WHEN 'UIT' THEN UitslagKG
				WHEN 'EUIT' THEN UitslagKG
				WHEN 'OUIT' THEN UitslagKG
			END)),
			SUM((CASE SoortMutatie
				WHEN 'IN' THEN InslagKG
				WHEN 'EIN' THEN InslagKG
				WHEN 'OIN' THEN InslagKG
				WHEN 'UIT' THEN -UitslagKG
				WHEN 'EUIT' THEN -UitslagKG
				WHEN 'OUIT' THEN -UitslagKG
			END)),
			SUM((CASE SoortMutatie
				WHEN 'IN' THEN InslagPallet
				WHEN 'EIN' THEN InslagPallet
				WHEN 'OIN' THEN InslagPallet
				WHEN 'UIT' THEN 0
				WHEN 'EUIT' THEN 0
				WHEN 'OUIT' THEN 0
			END)),
			SUM((CASE SoortMutatie
				WHEN 'IN' THEN 0
				WHEN 'EIN' THEN 0
				WHEN 'OIN' THEN 0
				WHEN 'UIT' THEN UitslagPallet
				WHEN 'EUIT' THEN UitslagPallet
				WHEN 'OUIT' THEN UitslagPallet
			END)),
			SUM((CASE SoortMutatie
				WHEN 'IN' THEN InslagPallet
				WHEN 'EIN' THEN InslagPallet
				WHEN 'OIN' THEN InslagPallet
				WHEN 'UIT' THEN -UitslagPallet
				WHEN 'EUIT' THEN -UitslagPallet
				WHEN 'OUIT' THEN -UitslagPallet
			END)) FROM Mutatie GROUP BY CelID, ArtikelID
END
GO

EXECUTE VulCelArtikelVoorraad