IF OBJECT_ID('VerwerkPartijCelVoorraad_Mutatie','P') IS NOT NULL
    DROP PROCEDURE VerwerkPartijCelVoorraad_Mutatie;
GO

CREATE PROCEDURE VerwerkPartijCelVoorraad_Mutatie
@Deleted tinyint, -- 1 = deleted / 0 = inserted
@PartijID int,
@CelID int,
@SoortMutatie varchar(4),
@InslagKG decimal(18,2),
@InslagPallets int,
@UitslagKG decimal(18,2),
@UitslagPallets int
AS
BEGIN
	DECLARE @CorrectieVoorraadKG decimal(18,2)

	-- Controleren of ArtikelID gevuld is
	-- Namelijk: Clarion Insert = SQL-INSERT + SQL-UPDATE
	-- De deleted v/d SQL-UPDATE bevat dan een record met enkel de ge-prime-de gegevens
	IF (@PartijID > 0)
	BEGIN
		-- Controleren of voorraad-stand voor de gewenste DatumTijd/Artikel/Cel al bestaat
		IF (SELECT COUNT(*) FROM PartijCelVoorraad AS VS WHERE VS.PartijID = @PartijID AND VS.CelID = @CelID) = 0
		BEGIN
			-- Lege telling toevoegen
			INSERT INTO PartijCelVoorraad (PartijID, CelID, PartijCelVoorraadKG, PartijCelVerkochtKG, PartijVoorraadKG, PartijVerkochtKG, ExternPartijnr)
				VALUES(@PartijID, @CelID, 0, 0,	0, 0, '');
				
			UPDATE PartijCelVoorraad SET
				ExternPartijnr = (SELECT ExternPartijnr FROM Partij	WHERE PartijID = @PartijID)
			
			-- Andere tellingen dan de PartijCelVoorraadKG kunnen wel al gevuld zijn	
			UPDATE PartijCelVoorraad SET			
				PartijVoorraadKG = (SELECT SUM((CASE SoortMutatie
						WHEN 'IN' THEN InslagKG
						WHEN 'EIN' THEN InslagKG
						WHEN 'OIN' THEN InslagKG
						WHEN 'UIT' THEN -UitslagKG
						WHEN 'EUIT' THEN -UitslagKG
						WHEN 'OUIT' THEN -UitslagKG
					END)) FROM Mutatie WHERE Mutatie.PartijID = @PartijID GROUP BY Mutatie.PartijID)
					
			UPDATE PartijCelVoorraad SET
				PartijCelVerkochtKG = (SELECT SUM(Planning.KG) FROM Planning WHERE Planning.PartijID = @PartijID AND Planning.CelID = @CelID AND Planning.VerkoopID > 0 AND Planning.MutatieGemaakt = 0 GROUP BY Planning.PartijID, Planning.CelID)

			UPDATE PartijCelVoorraad SET			
				PartijVerkochtKG = (SELECT SUM(Planning.KG) FROM Planning WHERE Planning.PartijID = @PartijID AND Planning.VerkoopID > 0 AND Planning.MutatieGemaakt = 0 GROUP BY Planning.PartijID)
		END
		
		IF (@SoortMutatie = 'IN' OR @SoortMutatie = 'OIN' OR @SoortMutatie = 'EIN')
			BEGIN
				SET @CorrectieVoorraadKG = @InslagKG
			END
		ELSE IF (@SoortMutatie = 'UIT' OR @SoortMutatie = 'OUIT' OR @SoortMutatie = 'EUIT')
			BEGIN
				SET @CorrectieVoorraadKG = -@UitslagKG
			END
		
		IF (@Deleted = 1)
		BEGIN
			SET @CorrectieVoorraadKG = -@CorrectieVoorraadKG
		END

		-- Alle voorraad-standen (inclusief de eventueel aangemaakte) vanaf de DatumTijd bijwerken
		UPDATE PartijCelVoorraad SET
			PartijCelVoorraadKG = PartijCelVoorraadKG + @CorrectieVoorraadKG
			WHERE PartijID = @PartijID AND CelID = @CelID
			
		UPDATE PartijCelVoorraad SET
			PartijVoorraadKG = PartijVoorraadKG + @CorrectieVoorraadKG
			WHERE PartijID = @PartijID
	END			
END
GO

IF OBJECT_ID('VerwerkPartijCelVoorraad_Planning','P') IS NOT NULL
    DROP PROCEDURE VerwerkPartijCelVoorraad_Planning;
GO

CREATE PROCEDURE VerwerkPartijCelVoorraad_Planning
@Deleted tinyint, -- 1 = deleted / 0 = inserted
@PartijID int,
@CelID int,
@KG decimal(18,2)
AS
BEGIN
	DECLARE @CorrectieKG decimal(18,2)

	-- Controleren of ArtikelID gevuld is
	-- Namelijk: Clarion Insert = SQL-INSERT + SQL-UPDATE
	-- De deleted v/d SQL-UPDATE bevat dan een record met enkel de ge-prime-de gegevens
	IF (@PartijID > 0)
	BEGIN
		-- Controleren of voorraad-stand voor de gewenste DatumTijd/Artikel/Cel al bestaat
		IF (SELECT COUNT(*) FROM PartijCelVoorraad AS VS WHERE VS.PartijID = @PartijID AND VS.CelID = @CelID) = 0
		BEGIN
			-- Lege telling toevoegen
			INSERT INTO PartijCelVoorraad (PartijID, CelID, PartijCelVoorraadKG, PartijCelVerkochtKG, PartijVoorraadKG, PartijVerkochtKG)
				VALUES(@PartijID, @CelID, 0, 0,	0,0);
				
			-- Andere tellingen dan de PartijCelVerkochtKG kunnen wel al gevuld zijn	
			UPDATE PartijCelVoorraad SET			
				PartijVoorraadKG = (SELECT SUM((CASE SoortMutatie
						WHEN 'IN' THEN InslagKG
						WHEN 'EIN' THEN InslagKG
						WHEN 'OIN' THEN InslagKG
						WHEN 'UIT' THEN -UitslagKG
						WHEN 'EUIT' THEN -UitslagKG
						WHEN 'OUIT' THEN -UitslagKG
					END)) FROM Mutatie WHERE Mutatie.PartijID = @PartijID GROUP BY Mutatie.PartijID)
					
			UPDATE PartijCelVoorraad SET			
				PartijCelVoorraadKG = (SELECT SUM((CASE SoortMutatie
						WHEN 'IN' THEN InslagKG
						WHEN 'EIN' THEN InslagKG
						WHEN 'OIN' THEN InslagKG
						WHEN 'UIT' THEN -UitslagKG
						WHEN 'EUIT' THEN -UitslagKG
						WHEN 'OUIT' THEN -UitslagKG
					END)) FROM Mutatie WHERE Mutatie.PartijID = @PartijID AND Mutatie.CelID = @CelID GROUP BY Mutatie.PartijID, Mutatie.CelID)

			UPDATE PartijCelVoorraad SET			
				PartijVerkochtKG = (SELECT SUM(Planning.KG) FROM Planning WHERE Planning.PartijID = @PartijID AND Planning.VerkoopID > 0 AND Planning.MutatieGemaakt = 0 GROUP BY Planning.PartijID)
		END
		
		IF (@Deleted = 1)
			SET @CorrectieKG = -@KG
		ELSE
			SET @CorrectieKG = @KG

		-- Alle voorraad-standen (inclusief de eventueel aangemaakte) vanaf de DatumTijd bijwerken
		UPDATE PartijCelVoorraad SET
			PartijCelVerkochtKG = PartijCelVerkochtKG + @CorrectieKG
			WHERE PartijID = @PartijID AND CelID = @CelID
			
		UPDATE PartijCelVoorraad SET
			PartijVerkochtKG = PartijVerkochtKG + @CorrectieKG
			WHERE PartijID = @PartijID
	END			
END
GO

-- Triggers

IF OBJECT_ID ('PartijCelVoorraadTrigger_Mutatie','TR') IS NOT NULL
    DROP TRIGGER PartijCelVoorraadTrigger_Mutatie;
GO

CREATE TRIGGER PartijCelVoorraadTrigger_Mutatie
ON dbo.Mutatie
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
	-- Relevante variabelen
	DECLARE @CelID int
	DECLARE @SoortMutatie varchar(4)
	DECLARE @PartijID int
	DECLARE @UitslagKG decimal(18,2)
	DECLARE @UitslagPallets int
	DECLARE @InslagKG decimal(18,2)
	DECLARE @InslagPallets int

	SET NOCOUNT ON;
	
	-- Deleted verwerken
	IF (SELECT COUNT(*) FROM Deleted) = 1
	BEGIN 
		-- Ophalen velden van het verwijderde record
		SELECT @CelID = mut.CelID
			  ,@SoortMutatie = mut.SoortMutatie
			  ,@PartijID = mut.PartijID
			  ,@InslagKG = mut.InslagKG
			  ,@InslagPallets = mut.InslagPallet
			  ,@UitslagKG = mut.UitslagKG
			  ,@UitslagPallets = mut.UitslagPallet
			FROM deleted AS mut;

		EXECUTE VerwerkPartijCelVoorraad_Mutatie 1, @PartijID, @CelID, @SoortMutatie, @InslagKG, @InslagPallets, @UitslagKG, @UitslagPallets;
	END		
	
	-- Inserted verwerken
	IF (SELECT COUNT(*) FROM Inserted) = 1
	BEGIN 
		SELECT @CelID = mut.CelID
			  ,@SoortMutatie = mut.SoortMutatie
			  ,@PartijID = mut.PartijID
			  ,@InslagKG = mut.InslagKG
			  ,@InslagPallets = mut.InslagPallet
			  ,@UitslagKG = mut.UitslagKG
			  ,@UitslagPallets = mut.UitslagPallet
			FROM inserted AS mut;

		EXECUTE VerwerkPartijCelVoorraad_Mutatie 0, @PartijID, @CelID, @SoortMutatie, @InslagKG, @InslagPallets, @UitslagKG, @UitslagPallets;
	END		
END
GO

IF OBJECT_ID ('PartijCelVoorraadTrigger_Planning','TR') IS NOT NULL
    DROP TRIGGER PartijCelVoorraadTrigger_Planning;
GO

CREATE TRIGGER PartijCelVoorraadTrigger_Planning
ON dbo.Planning
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
	-- Relevante variabelen
	DECLARE @PartijID int
	DECLARE @CelID int
	DECLARE @KG decimal(18,2)

	SET NOCOUNT ON;
	
	-- Deleted verwerken
	IF (SELECT COUNT(*) FROM Deleted AS pln WHERE pln.VerkoopID > 0 AND pln.MutatieGemaakt = 0) = 1
	BEGIN 
		-- Ophalen velden van het verwijderde record
		SELECT @PartijID = pln.PartijID
			  ,@CelID = pln.CelID
			  ,@KG = pln.KG
			FROM Deleted AS pln WHERE pln.VerkoopID > 0 AND pln.MutatieGemaakt = 0;

		EXECUTE VerwerkPartijCelVoorraad_Planning 1, @PartijID, @CelID, @KG;
	END		
	
	-- Inserted verwerken
	IF (SELECT COUNT(*) FROM Inserted AS pln WHERE pln.VerkoopID > 0 AND pln.MutatieGemaakt = 0) = 1
	BEGIN 
		SELECT @PartijID = pln.PartijID
			  ,@CelID = pln.CelID
			  ,@KG = pln.KG
			FROM Inserted AS pln WHERE pln.VerkoopID > 0 AND pln.MutatieGemaakt = 0

		EXECUTE VerwerkPartijCelVoorraad_Planning 0, @PartijID, @CelID, @KG;
	END		
END
GO


IF OBJECT_ID ('PartijCelVoorraadTrigger_Partij','TR') IS NOT NULL
    DROP TRIGGER PartijCelVoorraadTrigger_Partij;
GO

CREATE TRIGGER PartijCelVoorraadTrigger_Partij
ON dbo.Partij
AFTER INSERT, UPDATE
AS
BEGIN
	-- Relevante variabelen
	DECLARE @PartijID int
	DECLARE @ArtikelID varchar(30)
	DECLARE @ExternPartijnr varchar(20)

	SET NOCOUNT ON;
	
	-- Inserted verwerken
	IF (SELECT COUNT(*) FROM Inserted AS pln) = 1
	BEGIN 
		-- Ophalen velden van het toegevoegde/gewijzigde record
		SELECT @PartijID = par.PartijID,
			@ArtikelID = par.ArtikelID,
			@ExternPartijnr = par.ExternPartijnr
			FROM Inserted AS par;
		
		UPDATE PartijCelVoorraad SET
			ExternPartijnr = @ExternPartijnr WHERE PartijID = @PartijID;
			
		UPDATE PartijCelVoorraad SET
			ArtikelOms = (SELECT ArtikelOms FROM Artikel WHERE ArtikelID = @ArtikelID)
			
	END		
END
GO


-- Initieel vullen van de voorraadstand

IF OBJECT_ID('VulPartijCelVoorraad','P') IS NOT NULL
    DROP PROCEDURE VulPartijCelVoorraad;
GO

CREATE PROCEDURE VulPartijCelVoorraad
AS
BEGIN
	-- Voorraadstand leeggooien
	DELETE FROM PartijCelVoorraad
	
	-- Voorraadstand opnieuw opbouwen
	INSERT INTO PartijCelVoorraad (PartijID, CelID, PartijCelVoorraadKG)
		SELECT PartijID, CelID, 
			SUM((CASE SoortMutatie
				WHEN 'IN' THEN InslagKG
				WHEN 'EIN' THEN InslagKG
				WHEN 'OIN' THEN InslagKG
				WHEN 'UIT' THEN -UitslagKG
				WHEN 'EUIT' THEN -UitslagKG
				WHEN 'OUIT' THEN -UitslagKG
			END)) FROM Mutatie GROUP BY PartijID, CelID

	UPDATE PartijCelVoorraad SET
		ExternPartijnr = (SELECT ExternPartijnr FROM Partij	WHERE PartijID = PartijCelVoorraad.PartijID)

	UPDATE PartijCelVoorraad SET
		ArtikelOms = (SELECT ArtikelOms FROM Partij INNER JOIN Artikel_SyncExact ON Partij.ArtikelID=Artikel_SyncExact.ArtikelID WHERE PartijID = PartijCelVoorraad.PartijID)
			
	UPDATE PartijCelVoorraad SET			
		PartijVoorraadKG = (SELECT SUM((CASE SoortMutatie
				WHEN 'IN' THEN InslagKG
				WHEN 'EIN' THEN InslagKG
				WHEN 'OIN' THEN InslagKG
				WHEN 'UIT' THEN -UitslagKG
				WHEN 'EUIT' THEN -UitslagKG
				WHEN 'OUIT' THEN -UitslagKG
			END)) FROM Mutatie WHERE Mutatie.PartijID = PartijCelVoorraad.PartijID GROUP BY Mutatie.PartijID)
			
	UPDATE PartijCelVoorraad SET
		PartijCelVerkochtKG = (SELECT SUM(Planning.KG) FROM Planning WHERE Planning.PartijID = PartijCelVoorraad.PartijID AND Planning.CelID = PartijCelVoorraad.CelID AND Planning.VerkoopID > 0 AND Planning.MutatieGemaakt = 0 GROUP BY Planning.PartijID, Planning.CelID)

	UPDATE PartijCelVoorraad SET			
		PartijVerkochtKG = (SELECT SUM(Planning.KG) FROM Planning WHERE Planning.PartijID = PartijCelVoorraad.PartijID AND Planning.VerkoopID > 0 AND Planning.MutatieGemaakt = 0 GROUP BY Planning.PartijID)
END
GO

EXECUTE VulPartijCelVoorraad