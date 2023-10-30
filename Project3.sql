create database UserRoles;

use UserRoles;

create table Role(
Id int not null primary key,
Roll_Name varchar(100)
)

insert into Role values(1, 'Devavrat');
insert into Role values(2, 'Prathamesh');

select * from Role; 

create table User_as_Role(
Id int primary key,
Role_start_time datetime,
Role_end_time datetime,
User_account_id int foreign key references User_Account(Id) ,
Role_id int foreign key references Role(Id)
)

insert into User_as_Role values(11, '02-28-2020', '10-04-2022', 101, 1);
insert into User_as_Role values(12, '03-28-2020', '11-15-2022', 102, 2);

select * from User_as_Role;

create table User_Account(
Id int primary key,
User_name varchar(100),
Email varchar(254),
Password varchar(200),
Password_salt nchar(50),
Password_hash_algorithm varchar(50)
)

insert into User_Account values(101, 'devsam', 'dev28@gmail.com', 'DevSam02', 'D@S', 'DMS@SQL');
insert into User_Account values(102, 'pcpatil', 'pp04@gmail.com', 'PCP02', 'P@P', 'PCP@SQL');

select * from User_Account;

create table User_has_status(
Id int primary key,
Status_start_time datetime,
Status_end_time datetime,
User_account_id int foreign key references User_Account(Id),
Status_id int foreign key references Status(Id)
)

insert into User_has_status values(1001, '04-15-2020 20:00:00', '04-16-2020 20:00:00', 101,1011); 
insert into User_has_status values(1002, '04-15-2020 20:00:00', '04-16-2020 20:00:00', 102,1022); 

select * from User_has_status;

create table Status(
Id int primary key,
Status_name varchar(100),
Is_user_working bit
)

insert into Status values(1011, 'Working Professional', 1); 
insert into Status values(1022, 'Unemployed', 0);

select * from Status;


truncate table Role;
--truncate table User_as_Role;
truncate table User_Account;
--truncate table User_has_Status;
truncate table Status;

--Due to foreign key connections, we need to firstly delete those connections and then we can truncate 
--the data from the tables.
SELECT * 
FROM sys.foreign_keys
WHERE referenced_object_id = object_id('dbo.Role');

SELECT 
    'ALTER TABLE ' 
    +  OBJECT_SCHEMA_NAME(parent_object_id) 
    +'.[' + OBJECT_NAME(parent_object_id) 
    +'] DROP CONSTRAINT ' 
    + name as DropFKConstraint
FROM sys.foreign_keys
WHERE referenced_object_id = object_id('dbo.Role');

ALTER TABLE dbo.[User_as_Role] DROP CONSTRAINT FK__User_as_R__Role___2F10007B;

truncate table Role;

SELECT * 
FROM sys.foreign_keys
WHERE referenced_object_id = object_id('dbo.User_Account');

SELECT 
    'ALTER TABLE ' 
    +  OBJECT_SCHEMA_NAME(parent_object_id) 
    +'.[' + OBJECT_NAME(parent_object_id) 
    +'] DROP CONSTRAINT ' 
    + name as DropFKConstraint
FROM sys.foreign_keys
WHERE referenced_object_id = object_id('dbo.User_Account');

ALTER TABLE dbo.[User_as_Role] DROP CONSTRAINT FK__User_as_R__User___2E1BDC42;
ALTER TABLE dbo.[User_has_status] DROP CONSTRAINT FK__User_has___User___31EC6D26;

truncate table User_Account;

SELECT * 
FROM sys.foreign_keys
WHERE referenced_object_id = object_id('dbo.Status');

SELECT 
    'ALTER TABLE ' 
    +  OBJECT_SCHEMA_NAME(parent_object_id) 
    +'.[' + OBJECT_NAME(parent_object_id) 
    +'] DROP CONSTRAINT ' 
    + name as DropFKConstraint
FROM sys.foreign_keys
WHERE referenced_object_id = object_id('dbo.Status');

ALTER TABLE dbo.[User_has_status] DROP CONSTRAINT FK__User_has___Statu__32E0915F;

truncate table Status;

