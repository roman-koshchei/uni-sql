USE MilitaryDistrictRelations;

select 
	Person.*, MilitaryBranches.[Name] as 'Military Branch'
from Person
join Companies on Person.CompanyId = Companies.Id
join Units on Companies.UnitId = Units.Id
join MilitaryBranches on MilitaryBranches.Id = Units.MilitaryBranchId

select 
	Person.*, Locations.*
from Person
join Companies on Person.CompanyId = Companies.Id
join Units on Companies.UnitId = Units.Id
join Locations on Locations.Id = Units.LocationId
where Units.Id = 2 AND (2014 between YearOfServiceStart AND (YearOfServiceStart + YearsOfService));