USE MilitaryDistrictRelations
GO

CREATE OR ALTER PROCEDURE dbo.CalculateTotalAreaOfLocations
AS
BEGIN
    DECLARE @TotalArea DECIMAL(10, 2);

    -- Calculate the total area of all locations
    SELECT @TotalArea = SUM(Locations.Area)
    FROM Locations;

    -- Return the total area
    SELECT @TotalArea AS TotalArea;
END
GO

EXEC dbo.CalculateTotalAreaOfLocations
GO

