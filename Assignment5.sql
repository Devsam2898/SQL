use sam;


select SALARY from employees order by SALARY desc;

create table Employee_details1(Emp_id int,Emp_name varchar(20),Emp_salary int);

create table Employee_details2(Emp_id int,Emp_name varchar(20),Emp_salary int);

select * from Employee_details1;
insert into Employee_details1 values(1,'Donald OConnel',2600);
insert into Employee_details1 values(2,'Douglas Grant',2600);
insert into Employee_details1 values(3,'Shanta Wholman',6500);
insert into Employee_details1 values(4,'Michael Hartstein',6000);
insert into Employee_details1 values(5,'Pat Fay',6000);

select *  from Employee_details2;
insert into Employee_details2 values(1,'Doglas Grant',2600);
insert into Employee_details2 values(2,'Susan Mavris',4000);
insert into Employee_details2 values(3,'Michael Hartstein',6000);
insert into Employee_details2 values(4,'Pat Fay',6000);
insert into Employee_details2 values(5,'Bruce Ernst',6000);

drop table Employee_details1;
drop table Employee_details2;

select * from Employee_details1;
select *  from Employee_details2;

--Union operatoris used to combine the result set of two or more SELECT statements.
select distinct * from Employee_details1 where Emp_salary = 6000 union select distinct * from Employee_details2 
where Emp_salary = 6000 order by Emp_id; 

--Intersect Operator helps to combine two select statements and returns the records which are
--common to both the select statements.
select Emp_salary from Employee_details1 intersect select Emp_salary from Employee_details2;


--Except Operator combines two select statements and returns unique records from the left
--query which are not part of the right query.
--Below is the SQL code to use 'EXCEPT' operator on EmployeeDetails1 and EmployeeDetails2.
select * from Employee_details1 except select * from Employee_details2;