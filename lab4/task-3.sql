-- Remove military deployment locations in Ukraine, the area of ​​which exceeds 10 square kilometers

select * from [Location]
where Country = 'Ukraine' and Area > 10