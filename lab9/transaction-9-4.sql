BEGIN TRANSACTION T1

INSERT INTO Locations(Country, City, Address, Area)
VALUES ('Ukraine', 'Kiev', 'St. Shevchenko', 100.00)

BEGIN TRANSACTION T2

UPDATE Locations
SET Area = 200.00
WHERE Address LIKE 'St. Shevchenko'

COMMIT TRANSACTION T2

COMMIT TRANSACTION T1

SELECT * FROM Locations