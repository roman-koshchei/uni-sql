use MilitaryDistrictRelations
go

-- users
create login UpdateLogin
with password = 'UpdateLogin';

create user UpdateUser
for login UpdateLogin;

create login InsertLogin
with password = 'InsertLogin';

create user InsertUser
for login InsertLogin;

create login SelectLogin
with password = 'SelectLogin';

create user SelectUser
for login SelectLogin;


-- roles
create role UpdateRole;
grant update to UpdateRole;

create role SelectRole;
grant select to SelectRole;

create role InsertRole;
grant insert to InsertRole;

-- assign roles
exec sp_addrolemember 'UpdateRole', 'UpdateUser';
exec sp_addrolemember 'InsertRole', 'InsertUser';
exec sp_addrolemember 'SelectRole', 'SelectUser';