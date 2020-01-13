/* INSERT INTO Pallet DEFAULT VALUES

'SELECT * FROM Weging

'select COUNT(*), MAX(WegingID) from Weging */

DECLARE @counter int
SET @counter = 0
UPDATE [dbo].[Weging] SET @counter = [dbo].[Weging].PalletID = @counter + 1 

WHILE (SELECT COUNT(*) FROM [dbo].[Weging]) <> (SELECT COUNT(*) FROM [dbo].[Pallet])
BEGIN
	INSERT INTO Pallet DEFAULT VALUES
END

