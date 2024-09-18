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
);
GO
