select 
	Person.*, Units.MilitaryType
from Person
join Companies on Person.CompanyId = Companies.Id
join Units on Companies.UnitId = Units.Id

select 
	Person.*, Units.MilitaryType, Units.[Location]
from Person
join Companies on Person.CompanyId = Companies.Id
join Units on Companies.UnitId = Units.Id
where 2014 between YearOfServiceStart AND (YearOfServiceStart + YearsOfService);