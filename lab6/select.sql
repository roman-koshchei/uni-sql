-- 1
select MilitaryBranches.Name, Locations.Country, Locations.City
from MilitaryBranches
join Units on Units.MilitaryBranchId = MilitaryBranches.Id
join Locations on Locations.Id = Units.LocationId
where Locations.Country = 'Japan' or Locations.Country = 'UK'

-- 2
select Person.FullName, Units.Id as 'Unit Id'
from Person
join Companies on Person.CompanyId = Companies.Id
join Units on Units.Id = Companies.UnitId

-- 3
select 
	Person.FullName, 
	Units.Id as 'Unit Id', 
	MilitaryBranches.Name as 'Military Branch',
	Locations.Country, Locations.City, Locations.Address
from Person
join Companies on Person.CompanyId = Companies.Id
join Units on Units.Id = Companies.UnitId
join MilitaryBranches on MilitaryBranches.Id = Units.MilitaryBranchId
join Locations on Locations.Id = Units.LocationId
