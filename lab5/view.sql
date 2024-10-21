CREATE OR ALTER VIEW vw_PersonLocationInYear AS
SELECT 
    Person.*, 
    Locations.Country, Locations.Address, Locations.Area, Locations.City
FROM 
    Person
JOIN 
    Companies ON Person.CompanyId = Companies.Id
JOIN 
    Units ON Companies.UnitId = Units.Id
JOIN 
    Locations ON Locations.Id = Units.LocationId
WHERE 
    (2014 BETWEEN YearOfServiceStart AND (YearOfServiceStart + YearsOfService));
GO

SELECT * FROM vw_PersonLocationInYear;