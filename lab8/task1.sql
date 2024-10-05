USE MilitaryDistrictRelations
GO

CREATE VIEW UnitsAndPersonnelView AS
SELECT 
    MilitaryBranches.Name AS MilitaryBranch,
    Units.Id AS UnitId,
    Person.*
FROM MilitaryBranches
JOIN Units ON MilitaryBranches.Id = Units.MilitaryBranchId
JOIN Companies ON Units.Id = Companies.UnitId
JOIN Person ON Companies.Id = Person.CompanyId
GO

SELECT * FROM UnitsAndPersonnelView
GO