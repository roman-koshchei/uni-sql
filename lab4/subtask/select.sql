

SELECT *
FROM Teacher
WHERE address = 'Kyiv' AND (YEAR(GETDATE()) - year_of_birth) <= 30;
