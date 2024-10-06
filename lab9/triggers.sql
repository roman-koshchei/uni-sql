USE MilitaryDistrictRelations
GO

CREATE TABLE Logs (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    Operation NVARCHAR(50) NOT NULL,
    Message NVARCHAR(255) NOT NULL,
    CreatedOn DATETIME DEFAULT GETDATE()
)
GO


CREATE TRIGGER TriggerPersonInsert
ON Person
AFTER INSERT
AS
BEGIN
    INSERT INTO Logs (Operation, Message)
    SELECT 'INSERT', CONCAT('Inserted person record with ID: ', CAST(Id AS NVARCHAR(10)))
    FROM inserted
END
GO

CREATE TRIGGER TriggerPersonUpdate
ON Person
AFTER UPDATE
AS
BEGIN
    INSERT INTO Logs (Operation, Message)
    SELECT 'UPDATE', CONCAT('Updated person record with ID: ', CAST(Id AS NVARCHAR(10)))
    FROM inserted
END
GO

CREATE TRIGGER TriggerPersonDelete
ON Person
AFTER DELETE
AS
BEGIN
    INSERT INTO Logs (Operation, Message)
    SELECT 'DELETE', CONCAT('Deleted person record with ID: ', CAST(Id AS NVARCHAR(10)))
    FROM deleted
END
GO

