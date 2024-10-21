USE MilitaryDistrictRelations;

-- with join
select Person.*, MilitaryBranches.[Name] as 'Military Branch'
from Person
join Companies on Person.CompanyId = Companies.Id
join Units on Companies.UnitId = Units.Id
join MilitaryBranches on MilitaryBranches.Id = Units.MilitaryBranchId

-- without join
select Person.*, MilitaryBranches.[Name] as 'Military Branch'
from Person, Companies, Units, MilitaryBranches
where Person.CompanyId = Companies.Id and Companies.UnitId = Units.Id and MilitaryBranches.Id = Units.MilitaryBranchId
