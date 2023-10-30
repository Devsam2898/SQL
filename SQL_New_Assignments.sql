use Sam;

create table Employee(
Emp_id int not null,
Firstname varchar(20),
Lastname varchar(20),
Salary int,
Joining_date datetime,
Department varchar(20)
);

create table Employee_Bonus(
Emp_ref_id int,
Bonus_amount int,
Bonus_date datetime
);

create table Employee_Title(
Emp_ref_id int,
Employee_Title varchar(25),
Affective_date datetime
)

insert into Employee values(1,'Anika','Arora',100000,'2020-02-14 9:00:00','HR');
insert into Employee values(2,'Veena ','Verma',80000,'2011-06-15 9:00:00','Admin');
insert into Employee values(3,'Vishal','Singhal',300000,'2020-02-16 9:00:00','HR');
insert into Employee values(4,'Sushanth','Singh',500000,'2020-02-17 9:00:00','Admin');
insert into Employee values(5,'Bhupal','Bhati',500000,'2011-06-18 9:00:00','Admin');
insert into Employee values(6,'Dheeraj','Diwan',200000,'2011-06-19 9:00:00','Account');
insert into Employee values(7,'Karan','Kumar',85000,'2020-01-14 9:00:00','Account');
insert into Employee values(8,'Chandrika','Chouhan',90000,'2011-04-15 9:00:00','Admin');
 
insert into Employee_Bonus values(1,5000,'2020-02-16 0:00:00');
insert into Employee_Bonus values(2,3000,'2011-06-16 0:00:00');
insert into Employee_Bonus values(3,4000,'2020-02-16 0:00:00');
insert into Employee_Bonus values(1,4500,'2020-02-16 0:00:00');
insert into Employee_Bonus values(2,3500,'2011-06-16 0:00:00');

insert into Employee_Title values(1,'Manager','2016-02-20 0:00:00');
insert into Employee_Title values(2,'Executive','2016-06-11 0:00:00');
insert into Employee_Title values(8,'Executive','2016-06-11 0:00:00');
insert into Employee_Title values(5,'Manager','2016-06-11 0:00:00');
insert into Employee_Title values(4,'Asst.Manager','2016-06-11 0:00:00');
insert into Employee_Title values(7,'Executive','2016-06-11 0:00:00');
insert into Employee_Title values(6,'Lead','2016-06-11 0:00:00');
insert into Employee_Title values(3,'Lead','2016-06-11 0:00:00');

select * from Employee;
select * from Employee_Bonus;
select *  from Employee_Title;

--1 Display the “FIRST_NAME” from Employee table using the alias name
--as Employee_name.
select Firstname as Employee_name from Employee;

--2 Display “LAST_NAME” from Employee table in upper case.
select upper(Lastname) as Upper_Lastname from Employee;

--3 Display unique values of DEPARTMENT from EMPLOYEE table.
select distinct Department from Employee; 

--4 Display the first three characters of LAST_NAME from EMPLOYEE table.
select SUBSTRING(Lastname,1,3) as Lastname1 from Employee;

--5 Display the unique values of DEPARTMENT from EMPLOYEE table and
--prints its length.
select distinct len(Department) as Number_of_Departments from Employee;

--6 Display the FIRST_NAME and LAST_NAME from EMPLOYEE table into a
--single column AS FULL_NAME.  a space char should separate them.
select Firstname + ' ' + Lastname as Full_Name from Employee;

--7 DISPLAY all EMPLOYEE details from the employee table
--order by FIRST_NAME Ascending
select * from Employee order by Firstname asc;

--8. Display all EMPLOYEE details order by FIRST_NAME Ascending and
--DEPARTMENT Descending.
select * from Employee order by Firstname asc, Department desc;

--9 Display details for EMPLOYEE with the first name as “VEENA” and
--“KARAN” from EMPLOYEE table.
select * from Employee where Firstname in ('Veena','Karan');

--10 Display details of EMPLOYEE with DEPARTMENT name as “Admin”.
select * from Employee where Department = 'Admin';

--11 DISPLAY details of the EMPLOYEES whose FIRST_NAME contains ‘V’
select * from Employee where Firstname like '%V%';

--12 DISPLAY details of the EMPLOYEES whose SALARY lies between
--100000 and 500000.
select * from Employee where Salary between 100000 and 500000;
--select * from Employee where Salary between 100000 and 500000 order by Salary asc;

--13 Display details of the employees who have joined in Feb-2020.
select * from Employee where Joining_date between '2020-02-01' and '2020-02-28';

--14 Display employee names with salaries >= 50000 and <= 100000.
select * from Employee where Salary >= 50000 and Salary<= 100000;

--15 DISPLAY details of the EMPLOYEES who are also Managers.
select Emp_id,Firstname,Lastname,Salary,Joining_date,Employee_Title,Affective_date from Employee e inner join
Employee_Title t on e.Emp_id = t.Emp_ref_id where Employee_Title = 'Manager';

--16 DISPLAY duplicate records having matching data in some fields of a
--table.
select Salary,Department from Employee 
group by Salary,Department 
having count(Salary) > 1 and count(Department) > 1;


--17 Display only odd rows from a table.
select * from Employee where Emp_id % 2 != 0;

--18 Clone a new table from EMPLOYEE table.
select * into Employee_Clone from Employee where 1 = 1;
select * from Employee_Clone;

--19 DISPLAY the TOP 2 highest salary from a table.
select distinct top 2 Salary from Employee order by Salary desc;
--select Salary from Employee;

--20 DISPLAY the list of employees with the same salary.
select * from Employee e, Employee e1
where 
e.Salary = e1.Salary
and e.Emp_id != e1.Emp_id order by e.Salary;


--21 Display the second highest salary from a table.
SELECT MAX(Salary) AS Second_Highest_Salary 
FROM employee 
WHERE Salary < (select max(Salary) from Employee);


--22  Display the first 50% records from a table.
select top 50 percent * from Employee;


--23 Display the departments that have less than 4 people in it.
select Department as List from Employee 
group by Department having count(Department) <= 4;


--24 Display all departments along with the number of people in there.
select  Department as Dept,count(*) as No_of_Emp from Employee
group by Department;

--25 Display the name of employees having the highest salary in each
--department.
select Firstname,Lastname,Department,Salary from Employee 
where Salary in (select max(Salary) from Employee group by Department);

--26 Display the names of employees who earn the highest salary
select Firstname,Lastname,Salary from Employee
where Salary = (select max(Salary) from Employee);

--27 Diplay the average salaries for each department
select Department,avg(Salary) as Avg_Salary from Employee group by Department;

--28 Display the name of the employee who has got maximum bonus
select Firstname,Lastname from Employee e
inner join Employee_Bonus b
on e.Emp_id = b.Emp_ref_id
where Bonus_amount = (select max(Bonus_amount) from Employee_Bonus);
select * from Employee;
select * from Employee_Bonus;
select * from Employee_Title;

--29 Display the first name and title of all the employees
select Firstname,Employee_Title from Employee e
inner join Employee_Title t
on e.Emp_id = t.Emp_ref_id;
