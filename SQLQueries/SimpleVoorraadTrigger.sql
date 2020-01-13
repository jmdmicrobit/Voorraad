IF OBJECT_ID ('VerwerkMutatie','TR') IS NOT NULL
    DROP TRIGGER VerwerkMutatie;
GO

CREATE TRIGGER VerwerkMutatie
ON dbo.Mutatie
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
	-- Relevante variabelen
	DECLARE @DatumTijd datetime
	DECLARE @ArtikelID varchar(30)
	DECLARE @CelID int
	DECLARE @SoortMutatie varchar(4)
	DECLARE @UitslagKG int
	DECLARE @UitslagPallets int
	DECLARE @InslagKG int
	DECLARE @InslagPallets int
	
	DECLARE @CorrectieKG int
	DECLARE @CorrectiePallets int

	SET NOCOUNT ON;
	
	-- Deleted verwerken
	IF (SELECT COUNT(*) FROM Deleted) = 1
	BEGIN 
		-- Ophalen velden van het verwijderde record
		SELECT @DatumTijd = mut.DatumTijd
			  ,@ArtikelID = mut.ArtikelID
			  ,@CelID = mut.CelID
			  ,@SoortMutatie = mut.SoortMutatie
			  ,@InslagKG = mut.InslagKG
			  ,@InslagPallets = mut.InslagPallet
			  ,@UitslagKG = mut.UitslagKG
			  ,@UitslagPallets = mut.UitslagPallet
			FROM deleted AS mut;

		-- Controleren of ArtikelID gevuld is
		-- Namelijk: Clarion Insert = SQL-INSERT + SQL-UPDATE
		-- De deleted v/d SQL-UPDATE bevat dan een record met enkel de ge-prime-de gegevens
		IF NOT(@ArtikelID = '')
		BEGIN
			-- Controleren of voorraad-stand voor de gewenste DatumTijd/Artikel/Cel al bestaat
			IF (SELECT COUNT(*) FROM VoorraadStand AS VS WHERE VS.DatumTijd = @DatumTijd AND VS.ArtikelID = @ArtikelID AND VS.CelID = @CelID) = 0
			BEGIN
				-- Toevoegen op basis van de laatste voorraad-stand voor de gewenste DatumTijd
				INSERT INTO VoorraadStand SELECT TOP 1 @DatumTijd, @ArtikelID, @CelID, KG, Pallets FROM VoorraadStand AS VS WHERE VS.DatumTijd < @DatumTijd AND VS.ArtikelID = @ArtikelID AND VS.CelID = @CelID ORDER BY VS.DatumTijd DESC

				IF (@@rowcount = 0)
				BEGIN
					-- Toevoegen mislukt, omdat er nog geen voorraad was, lege telling toevoegen
					INSERT INTO VoorraadStand (DatumTijd, ArtikelID, CelID, KG, Pallets)
						VALUES(@DatumTijd, @ArtikelID, @CelID, 0, 0);
				END
			END

			-- Alle voorraad-standen (inclusief de eventueel aangemaakte) vanaf de DatumTijd bijwerken
			UPDATE VoorraadStand SET
				KG = KG + (CASE @SoortMutatie
					WHEN 'IN' THEN -@InslagKG
					WHEN 'EIN' THEN -@InslagKG
					WHEN 'OIN' THEN -@InslagKG
					WHEN 'UIT' THEN @UitslagKG
					WHEN 'EUIT' THEN @UitslagKG
					WHEN 'OUIT' THEN @UitslagKG
				END),
				Pallets = Pallets + (CASE @SoortMutatie
					WHEN 'IN' THEN -@InslagPallets
					WHEN 'EIN' THEN -@InslagPallets
					WHEN 'OIN' THEN -@InslagPallets
					WHEN 'UIT' THEN @UitslagPallets
					WHEN 'EUIT' THEN @UitslagPallets
					WHEN 'OUIT' THEN @UitslagPallets
				END) WHERE DatumTijd >= @DatumTijd AND ArtikelID = @ArtikelID AND CelID = @CelID
		END			
	END		
	
	-- Inserted verwerken
	IF (SELECT COUNT(*) FROM Inserted) = 1
	BEGIN 
		SELECT @DatumTijd = mut.DatumTijd
			  ,@ArtikelID = mut.ArtikelID
			  ,@CelID = mut.CelID
			  ,@SoortMutatie = mut.SoortMutatie
			  ,@InslagKG = mut.InslagKG
			  ,@InslagPallets = mut.InslagPallet
			  ,@UitslagKG = mut.UitslagKG
			  ,@UitslagPallets = mut.UitslagPallet
			FROM inserted AS mut;

		-- Controleren of ArtikelID gevuld is
		-- Namelijk: Clarion Insert = SQL-INSERT + SQL-UPDATE
		-- De inserted v/d SQL-INSERT bevat dan een record met enkel de ge-prime-de gegevens
		IF NOT(@ArtikelID = '')
		BEGIN
			-- Controleren of voorraad-stand voor de gewenste DatumTijd/Artikel/Cel al bestaat
			IF (SELECT COUNT(*) FROM VoorraadStand AS VS WHERE VS.DatumTijd = @DatumTijd AND VS.ArtikelID = @ArtikelID AND VS.CelID = @CelID) = 0
			BEGIN
				-- Toevoegen op basis van de laatste voorraad-stand voor de gewenste DatumTijd
				INSERT INTO VoorraadStand SELECT TOP 1 @DatumTijd, @ArtikelID, @CelID, KG, Pallets FROM VoorraadStand AS VS WHERE VS.DatumTijd < @DatumTijd AND VS.ArtikelID = @ArtikelID AND VS.CelID = @CelID ORDER BY VS.DatumTijd DESC

				IF (@@rowcount = 0)
				BEGIN
					-- Toevoegen mislukt, omdat er nog geen voorraad was, lege telling toevoegen
					INSERT INTO VoorraadStand (DatumTijd, ArtikelID, CelID, KG, Pallets)
						VALUES(@DatumTijd, @ArtikelID, @CelID, 0, 0);
				END
			END

			-- Alle voorraad-standen (inclusief de eventueel aangemaakte) vanaf de DatumTijd bijwerken
			UPDATE VoorraadStand SET
				KG = KG + (CASE @SoortMutatie
					WHEN 'IN' THEN @InslagKG
					WHEN 'EIN' THEN @InslagKG
					WHEN 'OIN' THEN @InslagKG
					WHEN 'UIT' THEN -@UitslagKG
					WHEN 'EUIT' THEN -@UitslagKG
					WHEN 'OUIT' THEN -@UitslagKG
				END),
				Pallets = Pallets + (CASE @SoortMutatie
					WHEN 'IN' THEN @InslagPallets
					WHEN 'EIN' THEN @InslagPallets
					WHEN 'OIN' THEN @InslagPallets
					WHEN 'UIT' THEN -@UitslagPallets
					WHEN 'EUIT' THEN -@UitslagPallets
					WHEN 'OUIT' THEN -@UitslagPallets
				END) WHERE DatumTijd >= @DatumTijd AND ArtikelID = @ArtikelID AND CelID = @CelID
		END			
	END		
END

GO