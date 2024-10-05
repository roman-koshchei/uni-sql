CREATE DATABASE UniversityDB;
GO

USE UniversityDB;
GO

CREATE TABLE Departments (
    Id INT PRIMARY KEY IDENTITY(1,1),
    Name NVARCHAR(100),
    Faculty NVARCHAR(100)
);

CREATE TABLE Teachers (
    Id INT PRIMARY KEY IDENTITY(1,1),
    FullName NVARCHAR(100),
    Position NVARCHAR(20) CHECK (Position IN ('professor', 'docent', 'assistant')),
    Experience INT,
    DepartmentId INT,

    FOREIGN KEY (DepartmentId) REFERENCES Departments(Id) ON DELETE SET NULL
);

INSERT INTO Departments (Name, Faculty) VALUES 
('Applied Mathematics', 'Faculty of Mathematics'),
('Computer Science', 'Faculty of Computer Science'),
('Physics', 'Faculty of Physics'),
('Chemistry', 'Faculty of Chemistry'),
('Biology', 'Faculty of Biology');

INSERT INTO Teachers (FullName, Position, Experience, DepartmentId) VALUES 
('Ivanov Ivan Ivanovich', 'professor', 20, 1),
('Petrov Petro Petrovich', 'docent', 15, 2),
('Sydorenko Sydir Sydorovych', 'assistant', 5, 3),
('Kovalenko Olga Oleksandrivna', 'professor', 25, 4),
('Honcharuk Andriy Andriyovych', 'docent', 10, NULL);
