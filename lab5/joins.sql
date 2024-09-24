USE MilitaryDistrictRelations;

SELECT *
FROM Locations
CROSS JOIN Units;

SELECT *
FROM Locations
LEFT JOIN Units ON Locations.Id = Units.LocationId; 

SELECT *
FROM Locations
RIGHT JOIN Units ON Locations.Id = Units.LocationId; 