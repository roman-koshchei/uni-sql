CREATE TABLE Teacher (
    id INT NOT NULL PRIMARY KEY,
    full_name NVARCHAR(255) NOT NULL,
    year_of_birth INT NOT NULL,
    address NVARCHAR(255) NOT NULL
);


INSERT INTO Teacher (id, full_name, year_of_birth, address)
VALUES 
(1, 'Ivan Petrov', 1995, 'Kyiv'),
(2, 'Olena Ivanova', 1992, 'Kyiv'),
(3, 'Sergiy Shevchenko', 1988, 'Lviv'),
(4, 'Anastasiya Sokolova', 2000, 'Kyiv'),
(5, 'Dmytro Korol', 1985, 'Odesa');