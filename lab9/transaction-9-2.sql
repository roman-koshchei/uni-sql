USE MilitaryDistrictRelations

BEGIN TRANSACTION 

DELETE Person

SELECT * FROM Person

ROLLBACK TRANSACTION

SELECT * FROM Person