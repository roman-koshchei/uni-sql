USE MilitaryDistrictRelations
GO

INSERT INTO Person (FullName, CompanyId, Position, YearOfBirth, YearOfServiceStart, YearsOfService)
VALUES ('John Doe', 1, 'Sergeant', 1990, 2020, 4);
GO

UPDATE Person
SET Position = 'Lieutenant'
WHERE FullName = 'John Doe'
GO

DELETE FROM Person
WHERE FullName = 'John Doe'
GO

SELECT * FROM Logs
GO