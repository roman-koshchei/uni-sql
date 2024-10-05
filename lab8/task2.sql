--DROP FUNCTION SolveQuadraticEquation

CREATE FUNCTION dbo.SolveQuadraticEquation 
(
    @A FLOAT, 
    @B FLOAT, 
    @C FLOAT
)
RETURNS NVARCHAR(255) -- Return type is string, because it's scalar function
AS
BEGIN
    DECLARE @Discriminant FLOAT;
    DECLARE @Root1 FLOAT;
    DECLARE @Root2 FLOAT;
    DECLARE @Result NVARCHAR(255);

    -- Calculate the discriminant
    SET @Discriminant = POWER(@B, 2) - 4 * @A * @C;

    -- Check if A is zero or if the discriminant is negative
    IF @A = 0 
    BEGIN
        SET @Result = 'Not a quadratic equation';
        RETURN @Result;
    END

    IF @Discriminant < 0 
    BEGIN
        SET @Result = 'Complex roots';
        RETURN @Result;
    END

    -- Calculate the roots
    SET @Root1 = (-@B + SQRT(@Discriminant)) / (2 * @A);
    SET @Root2 = (-@B - SQRT(@Discriminant)) / (2 * @A);

    -- Format the result as a string
    SET @Result = CONCAT('Root1: ', CAST(@Root1 AS NVARCHAR(50)), ', Root2: ', CAST(@Root2 AS NVARCHAR(50)));
    
    RETURN @Result;
END;
GO


SELECT dbo.SolveQuadraticEquation(1, -3, 2) 