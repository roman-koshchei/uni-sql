select MIN(Area) as 'Min area'
from Locations;

select count(*) as 'Units count'
from Units
join Locations on Units.LocationId = Locations.Id
where Locations.Area > 2000

select Companies.Id as CompanyId, COUNT(Person.Id) as PersonnelCount
from Companies
join Person on Companies.Id = Person.CompanyId
group by Companies.Id;

select *
from Person
where Person.CompanyId = 1