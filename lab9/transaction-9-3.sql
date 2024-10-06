USE MilitaryDistrictRelations

BEGIN TRANSACTION

INSERT INTO MilitaryBranches(Name)
VALUES ('Tmp Branch')

UPDATE MilitaryBranches
SET Name = 'Strategy Branch'
WHERE Name LIKE 'Tmp Branch'

COMMIT TRANSACTION


BEGIN TRANSACTION

UPDATE MilitaryBranches
SET Name = 'New Strategy Branch'
WHERE Name LIKE 'Strategy Branch'

ROLLBACK TRANSACTION


SELECT * FROM MilitaryBranches