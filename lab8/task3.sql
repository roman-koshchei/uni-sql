CREATE OR ALTER FUNCTION dbo.GetPersonnelByYear(@Year INT)
RETURNS TABLE
AS
RETURN 
(
    SELECT 
        p.FullName,
        p.Position,
        p.YearOfBirth,
        p.YearOfServiceStart,
        p.YearsOfService,
        p.Awards,
        p.ParticipationInMilitaryEvents
    FROM 
		Person p
    WHERE 
        @Year BETWEEN p.YearOfServiceStart AND (p.YearOfServiceStart + p.YearsOfService)
);
GO

SELECT * FROM dbo.GetPersonnelByYear(2021)
GO