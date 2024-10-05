-- users
create login ReadOnlyLogin
with password = 'readonlylogin';

create user ReadOnlyUser
for login ReadOnlyLogin;

create login EditLogin
with password = 'editlogin';

create user EditUser
for login EditLogin;


-- roles
create role EditRole;
grant select, insert, update, delete to EditRole;

create role ReadRole;
grant select to ReadRole;


-- assign roles
exec sp_addrolemember 'ReadRole', 'ReadOnlyUser';
exec sp_addrolemember 'EditRole', 'EditUser';