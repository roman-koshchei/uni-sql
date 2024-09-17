-- Inserting records into the Location table
INSERT INTO [dbo].[Location] (Country, City, Address, Area) VALUES
  ('Ukraine', 'Kyiv', 'Shevchenka Blvd, 1', 150.50),
  ('USA', 'New York', '5th Ave, 10', 200.75),
  ('Germany', 'Berlin', 'Alexanderplatz, 3', 120.00)
GO

-- Inserting records into the MilitaryBranch table
INSERT INTO [dbo].[MilitaryBranch] (Name) VALUES
  ('Ground Forces'),
  ('Naval Forces'),
  ('Air Forces'),
  ('Special Operations Forces'),
  ('Cyber Warfare Division');
GO