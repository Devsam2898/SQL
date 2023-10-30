create database Sam;
use Sam;

create table Cust_details(
c_id tinyint,
c_firstname varchar(20),
c_lastname varchar(20),
c_email varchar(30),
c_address varchar(20),
c_city varchar(20),
c_state varchar(20),
c_zip int
)

select * from Cust_details;

insert into Cust_details values(1,'George','Smith','george@gmail.com','New York City','New York','Boston',101);
insert into Cust_details values(2,'Gelert','Rowle','gelert@gmail.com','Detroit City','Detroit','Michigan',102);
insert into Cust_details values(3,'Alan','Harris','alan@gmail.com','New Hampshire City','New Hampshire','Pennsylvania',103);
insert into Cust_details values(4,'Angelina','Jolie','angelina@gmail.com','Hollywood','Las Vegas','California',104);
insert into Cust_details values(5,'George','Smith','george@gmail.com','Dallas','San Jose','California',105);

select c_firstname, c_lastname from Cust_details;

select * from Cust_details where c_city = 'San Jose';
select * from Cust_details where c_firstname like 'G%';
select * from Cust_details where c_firstname like '%a';
select * from Cust_details where c_firstname like '%l%';
select * from Cust_details where c_firstname like '_e%';
select * from Cust_details where c_firstname like 'e_%';
select * from Cust_details where c_firstname like 'e__%';
select * from Cust_details where c_firstname like 'e%r';