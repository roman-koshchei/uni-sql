USE MilitaryDistrictRelations


BEGIN TRANSACTION T1

INSERT INTO Locations(Country, City, Address, Area)
VALUES ('Ukraine', 'Lviv', 'St. Kharkivska', 1500.00)

SAVE TRANSACTION LocationInserted

UPDATE Locations
SET Area = 2000.00
WHERE Address LIKE 'St. Kharkivska'

ROLLBACK TRANSACTION LocationInserted

COMMIT TRANSACTION T1


SELECT * FROM Locations
