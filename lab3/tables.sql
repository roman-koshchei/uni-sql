-- Creating the Units table
CREATE TABLE [dbo].[Units] (
    [Id] INT IDENTITY(1,1) PRIMARY KEY,
    [MilitaryType] VARCHAR(100) NOT NULL,
    [Location] VARCHAR(255) NOT NULL
);
GO

-- Creating the Companies table
CREATE TABLE [dbo].[Companies] (
    [Id] INT IDENTITY(1,1) PRIMARY KEY,
    [UnitId] INT NOT NULL, 
);
GO