USE MilitaryDistrictRelations
GO

CREATE TABLE [Locations] (
	[Id] [int] IDENTITY(1,1) PRIMARY KEY,
	[Country] [nvarchar](100) NULL,
	[City] [nvarchar](100) NULL,
	[Address] [nvarchar](255) NULL,
	[Area] [decimal](10, 2) NULL
)
GO

CREATE TABLE [MilitaryBranches](
	[Id] [int] IDENTITY(1,1) PRIMARY KEY,
	[Name] [varchar](100) NOT NULL
)
GO

CREATE TABLE [Units] (
	[Id] [int] IDENTITY(1,1) PRIMARY KEY,
	[MilitaryBranchId] INT NOT NULL,
	[LocationId] INT NOT NULL,

    FOREIGN KEY (LocationId) REFERENCES Locations (Id),
    FOREIGN KEY (MilitaryBranchId) REFERENCES MilitaryBranches (Id)
)
GO

CREATE TABLE [Companies] (
    [Id] INT IDENTITY(1,1) PRIMARY KEY,
	[UnitId] INT NOT NULL,

    FOREIGN KEY (UnitId) REFERENCES Units (Id) 
)
GO

-- Creating the Person table
CREATE TABLE Person (
    [Id] INT IDENTITY(1,1) PRIMARY KEY,
    [FullName] VARCHAR(100) NOT NULL,
    [CompanyId] INT NOT NULL,
    [Position] VARCHAR(100) NOT NULL,
    [YearOfBirth] INT NOT NULL,
    [YearOfServiceStart] INT NOT NULL, 
    [YearsOfService] INT NOT NULL,
    [Awards] VARCHAR(255),
    [ParticipationInMilitaryEvents] VARCHAR(255),

    FOREIGN KEY (CompanyId) REFERENCES Companies (Id) 
)
GO
