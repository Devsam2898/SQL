use Sam;
--Create a customer table which comprises of these columns – ‘customer_id’, ‘first_name’,
--last_name’, ‘email’, ‘address’, ‘city’,’state’,’zip’
create table Cust_id(
C_id int,
C_firstname varchar(20),
C_lastname varchar(20),
C_email varchar(30),
C_address varchar(30),
C_city varchar(15),
C_state varchar(20),
C_zip int
)

--Insert 5 new records into the table
select * from Cust_id;
insert into Cust_id values(1,'John','McNally','johnm@gmail.com','21 Street','Boston','Masachussetts',1001);
insert into Cust_id values(2,'Glenn','Maxwell','glennm@gmail.com','22 Street','San Jose','California',1005);
insert into Cust_id values(3,'Adam','Smith','adams@gmail.com','25 Street','Las Vegas','Newada',1008);
insert into Cust_id values(4,'Harry','Potter','harryp@gmail.com','28 Street','Detroit','Michigan',1012);
insert into Cust_id values(5,'Gilbert','Mathews','gilbertm@gmail.com','29 Street','San Jose','California',1017);

--Select only the ‘first_name’ & ‘last_name’ columns from the customer table
select C_firstname, C_lastname from Cust_id;

--. Select those records where ‘first_name’ starts with “G” and city is ‘San Jose’
select * from Cust_id where C_firstname like ('G%') and C_city = 'San Jose';