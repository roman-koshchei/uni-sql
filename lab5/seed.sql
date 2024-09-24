USE MilitaryDistrictRelations
GO

-- Seed Locations Table
INSERT INTO Locations (Country, City, Address, Area) VALUES 
('USA', 'Fort Bragg', '1234 Main St', 2500.00),
('Germany', 'Ramstein', '5678 Elm St', 1800.50),
('Japan', 'Yokota', '9101 Cherry St', 1500.75),
('Canada', 'Ottawa', '111 Maple Ave', 2000.00),
('UK', 'London', '222 Oak Rd', 3000.00),
('Australia', 'Sydney', '333 Pine Blvd', 2800.00);
GO

-- Seed MilitaryBranches Table
INSERT INTO MilitaryBranches (Name) VALUES 
('Army'),
('Navy'),
('Air Force'),
('Marine Corps'),
('Coast Guard');
GO

-- Seed Units Table
INSERT INTO Units (MilitaryBranchId, LocationId) VALUES 
(1, 1),  -- Army at Fort Bragg
(2, 2),  -- Navy at Ramstein
(3, 3),  -- Air Force at Yokota
(4, 4),  -- Marine Corps at Ottawa
(5, 5),  -- Coast Guard at London
(1, 6);  -- Army at Sydney
GO

-- Seed Companies Table
INSERT INTO Companies (UnitId) VALUES 
(1),  -- Company in Army Unit at Fort Bragg
(2),  -- Company in Navy Unit at Ramstein
(3),  -- Company in Air Force Unit at Yokota
(4),  -- Company in Marine Corps Unit at Ottawa
(5),  -- Company in Coast Guard Unit at London
(6);  -- Company in Army Unit at Sydney
GO

-- Seed Person Table
INSERT INTO Person (FullName, CompanyId, Position, YearOfBirth, YearOfServiceStart, YearsOfService, Awards, ParticipationInMilitaryEvents) VALUES 
('John Doe', 1, 'Sergeant', 1985, 2005, 15, 'Bronze Star', 'Operation Enduring Freedom'),
('Jane Smith', 2, 'Lieutenant', 1990, 2010, 10, 'Meritorious Service Medal', 'Operation Iraqi Freedom'),
('Mike Johnson', 3, 'Captain', 1980, 2000, 20, 'Defense Meritorious Service Medal', 'Operation Noble Eagle'),
('Emily Davis', 4, 'Major', 1982, 2003, 18, 'Commendation Medal', 'Operation Inherent Resolve'),
('Chris Brown', 5, 'Private First Class', 1995, 2018, 6, NULL, NULL),
('Sarah Wilson', 6, 'Corporal', 1988, 2012, 12, 'Army Achievement Medal', NULL),
('David Lee', 1, 'Colonel', 1975, 1995, 25, 'Legion of Merit', NULL),
('Jessica Taylor', 2, 'Commander', 1980, 2000, 20, NULL, NULL);
GO
