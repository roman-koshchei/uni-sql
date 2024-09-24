use MilitaryDistrict

UPDATE [Location]
SET 
    Country = 'USA',
    City = 'New York',
    Address = '5th Avenue, NY',
    Area = 100.00
WHERE Id = 1;
GO

UPDATE [Location]
SET 
    Country = 'Canada',
    City = 'Toronto',
    Address = 'Queen St W, Toronto',
    Area = 200.00
WHERE Id = 2;
GO

UPDATE [Location]
SET 
    Country = 'Mexico',
    City = 'Mexico City',
    Address = 'Paseo de la Reforma, CDMX',
    Area = 150.00
WHERE Id = 3;
GO