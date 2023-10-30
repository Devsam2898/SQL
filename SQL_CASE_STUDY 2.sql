use CaseStudy;

create table Location_CS2(
Location_Id int,
City varchar(50)
);

create table Department_CS2(
Department_id int,
D_Name varchar(50),
Location_Id int
);

create table Job_CS2(
Job_Id int,
Designation varchar(50)
);

create table Employee_CS2(
Employee_Id int,
Last_Name varchar(50),
First_Name varchar(50),
Middle_Name varchar(20),
Job_Id int,
Manager_Id int,
Hire_Date date,
Salary int,
Comm varchar(20),
Department_id int
);

insert into Location_CS2 values(122, 'New York');
insert into Location_CS2 values(123, 'Dallas');
insert into Location_CS2 values(124, 'Chicago');
insert into Location_CS2 values(167, 'Boston');

insert into Department_CS2 values(10, 'Accounting', 122);
insert into Department_CS2 values(20, 'Sales', 124);
insert into Department_CS2 values(30, 'Research', 123);
insert into Department_CS2 values(40, 'Operation', 167);

insert into Job_CS2 values(667, 'Clerk');
insert into Job_CS2 values(668, 'Staff');
insert into Job_CS2 values(669, 'Analyst');
insert into Job_CS2 values(670, 'Sales Person');
insert into Job_CS2 values(671, 'Manager');
insert into Job_CS2 values(672, 'President');

insert into Employee_CS2 values(7369,'Smith','John','Q',667,7902,'17-DEC-84',800,'Null',20);
insert into Employee_CS2 values(7499,'Allen','Kevin','J',670,7698,'20-FEB-85',1600,'300',30);
insert into Employee_CS2 values(7505,'Doyle','Jean','K',671,7839,'04-APR-85',2850,'Null',30);
insert into Employee_CS2 values(7506,'Dennis','Lynn','S',671,7839,'15-MAY-85',2750,'Null',30);
insert into Employee_CS2 values(7507,'Baker','Leslie','D',671,7839,'10-JUNE-85',2200,'Null',40);
insert into Employee_CS2 values(7521,'Wark','Cynthia','D',670,7698,'22-FEB-85',1250,'500',30);

select * from Location_CS2;
select * from Department_CS2;
select * from Job_CS2;
select * from Employee_CS2;

--SIMPLE QUERIES:
--1. LIST ALL THE EMPLOYEE DETAILS.
select * from Employee_CS2;

--2. LIST ALL THE DEPARTMENT DETAILS
select * from Department_CS2;

--3. LIST ALL JOB DETAILS.
select * from Job_CS2;

--4. LIST ALL THE LOCATIONS.
select * from Location_CS2;

--5. LIST OUT THE FIRSTNAME, LASTNAME, SALARY, COMMISSION FOR ALL EMPLOYEES.
select First_Name,Last_Name,Salary,Comm from Employee_CS2;

--6. LIST OUT EMPLOYEEID,LAST NAME, DEPARTMENT ID FOR ALL EMPLOYEES AND ALIAS
--EMPLOYEEID AS "ID OF THE EMPLOYEE", LAST NAME AS "NAME OF THE EMPLOYEE", DEPARTMENTID AS "DEP_ID".
select Employee_Id as 'ID of the Employee', Last_Name as 'Name of the Employee', Department_Id as 'Dep_ID'
from Employee_CS2;

--7. LIST OUT THE EMPLOYEES ANNUAL SALARY WITH THEIR NAMES ONLY.
select First_Name + ' ' +  Middle_Name + ' ' + Last_Name as Full_Name,Salary from Employee_CS2;


--WHERE CONDITION:
--1. LIST THE DETAILS ABOUT "SMITH"
select * from Employee_CS2 where Last_Name = 'Smith';

--2. LIST OUT THE EMPLOYEES WHO ARE WORKING IN DEPARTMENT 20.
select First_Name + ' ' +  Middle_Name + ' ' + Last_Name as Full_Name from Employee_CS2
where Department_id = 20;

--3. LIST OUT THE EMPLOYEES WHO ARE EARNING SALARY BETWEEN 3000 AND 4500.
select First_Name + ' ' +  Middle_Name + ' ' + Last_Name as Full_Name from Employee_CS2
where Salary between 3000 and 4500;

--4. LIST OUT THE EMPLOYEES WHO ARE WORKING IN DEPARTMENT 10 OR 20.
select First_Name + ' ' +  Middle_Name + ' ' + Last_Name as Full_Name from Employee_CS2
where Department_id = 10 or Department_id = 20;

--5. FIND OUT THE EMPLOYEES WHO ARE NOT WORKING IN DEPARTMENT 10 OR 30.
select First_Name + ' ' +  Middle_Name + ' ' + Last_Name as Full_Name from Employee_CS2
where Department_id not in (10, 30);

--6. LIST OUT THE EMPLOYEES WHOSE NAME STARTS WITH 'S'.
select First_Name + ' ' +  Middle_Name + ' ' + Last_Name as Full_Name from Employee_CS2
where Last_Name like 'S%';

--7. LIST OUT THE EMPLOYEES WHOSE NAME STARTS WITH 'S' AND ENDS WITH 'H'.
select First_Name + ' ' +  Middle_Name + ' ' + Last_Name as Full_Name from Employee_CS2
where Last_Name like 'S%h'

--8. LIST OUT THE EMPLOYEES WHOSE NAME LENGTH IS 4 AND START WITH 'S'.
select First_Name + ' ' +  Middle_Name + ' ' + Last_Name as Full_Name from Employee_CS2
where Last_Name like 'S____';/* */

--9. LIST OUT EMPLOYEES WHO ARE WORKING IN DEPARRTMENT 10 AND DRAW THE SALARIES MORE THAN 3500.
select First_Name + ' ' +  Middle_Name + ' ' + Last_Name as Full_Name from Employee_CS2
where Department_id = 10 and Salary > 3500;

--10. LIST OUT THE EMPLOYEES WHO ARE NOT RECEVING COMMISSION.
select First_Name + ' ' +  Middle_Name + ' ' + Last_Name as Full_Name from Employee_CS2
where Comm = 'Null';


--ORDER BY CLAUSE:
--1. LIST OUT THE EMPLOYEE ID, LAST NAME IN ASCENDING ORDER BASED ON THE EMPLOYEE ID.
select Employee_Id, Last_Name from Employee_CS2 order by Employee_Id asc;

--2. LIST OUT THE EMPLOYEE ID, NAME IN DESCENDING ORDER BASED ON SALARY.
Select Employee_Id, First_Name + ' ' +  Middle_Name + ' ' + Last_Name as Full_Name from Employee_CS2
order by Salary;

--3. LIST OUT THE EMPLOYEE DETAILS ACCORDING TO THEIR LAST-NAME IN ASCENDING ORDER 
select * from Employee_CS2 order by Last_Name asc;

--4. LIST OUT THE EMPLOYEE DETAILS ACCORDING TO THEIR LAST-NAME IN ASCENDING ORDER AND
--THEN ON DEPARTMENT_ID IN DESCENDING ORDER.
select * from Employee_CS2 order by Last_Name asc;
select * from Employee_CS2 order by Department_id desc;


--GROUP BY & HAVING CLAUSE
--1. HOW MANY EMPLOYEES WHO ARE IN DIFFERENT DEPARTMENTS WISE IN THE ORGANIZATION.
select count(*) as Count_of_Employees, Department_Id 
from Employee_CS2 group by Department_Id;

--2. LIST OUT THE DEPARTMENT WISE MAXIMUM SALARY, MINIMUM SALARY, AVERAGE SALARY OF THE EMPLOYEES.
select Department_Id, max(Salary) Max_Sal, min(Salary) Min_Sal, avg(Salary) Avg_Sal
from Employee_CS2 group by Department_Id;

--3. LIST OUT JOB WISE MAXIMUM SALARY, MINIMUM SALARY, AVERAGE SALARIES OF THE EMPLOYEES.
select Job_Id, max(Salary) Max_Sal, min(Salary) Min_Sal, avg(Salary) Avg_Sal 
from Employee_CS2 group by Job_Id;

--4. LIST OUT THE NUMBER OF EMPLOYEES JOINED IN EVERY MONTH IN ASCENDING ORDER.
select month(Hire_Date),count(*) from Employee_CS2 group by month(Hire_Date)
order by month(Hire_Date) asc;  

--5. LIST OUT THE NUMBER OF EMPLOYEES FOR EACH MONTH AND YEAR, IN THE ASCENDING 
--ORDER BASED ON THE YEAR, MONTH.
select year(Hire_Date) Yr_HD, month(Hire_Date) M_HD, count(*) No_of_Emp from Employee_CS2
group by year(Hire_Date), month(Hire_Date) order by year(Hire_Date), month(Hire_Date);

--6. LIST OUT THE DEPARTMENT ID HAVING ATLEAST FOUR EMPLOYEES.
select Department_Id, count(*) from Employee_CS2 group by Department_Id
having count( *) >= 4;

--7. HOW MANY EMPLOYEES JOINED IN JANUARY MONTH.
select month(Hire_Date), count(*) from Employee_CS2 group by month(Hire_Date)
having month(Hire_Date) = '01';

--8. HOW MANY EMPLOYEES JOINED IN JANUARY OR SEPTEMBER MONTH.
select month(Hire_Date), count(*) from Employee_CS2 group by month(Hire_Date)
having month(Hire_Date) = '01'
union 
select month(Hire_Date), count(*) from Employee_CS2 group by month(Hire_Date)
having month(Hire_Date) = '09';

--9. HOW MANY EMPLOYEES WERE JOINED IN 1985?
select year(Hire_Date) Hiring_Year, count(*) Emp_Joined_in_1985 from Employee_CS2 
group by year(Hire_Date) having year(Hire_Date) = '1985';

--10. HOW MANY EMPLOYEES WERE JOINED EACH MONTH IN 1985.
select year(Hire_Date) Year_Emp, month(Hire_Date) Month_Emp, count(*) Count_Emp from Employee_CS2
group by year(Hire_Date), month(Hire_Date) having year(Hire_Date) = '1985';

--11. HOW MANY EMPLOYEES WERE JOINED IN MARCH 1985?
select year(Hire_Date) Year_Emp, month(Hire_Date) Month_Emp, count(*) Count_Emp from Employee_CS2
group by year(Hire_Date), month(Hire_Date) having year(Hire_Date) = '1985' and month(Hire_Date) = '03';

--12. WHICH IS THE DEPARTMENT ID, HAVING GREATER THAN OR EQUAL TO 3 EMPLOYEES JOINED IN
--APRIL 1985?
select Department_Id, count(*), year(Hire_Date), month(Hire_Date) from Employee_CS2
group by  Department_Id, year(Hire_Date), month(Hire_Date)
having count(*) <= 3 and year(Hire_Date) = '1985' and month(Hire_Date) = '04';


--JOINS:
--1. LIST OUT EMPLOYEES WITH THEIR DEPARTMENT NAMES.
select First_Name + ' ' +  Middle_Name + ' ' + Last_Name as Full_Name, D_Name
from Employee_CS2 e inner join Department_CS2 d on e.Department_Id = d.Department_Id; 

--2. DISPLAY EMPLOYEES WITH THEIR DESIGNATIONS.
select  First_Name + ' ' +  Middle_Name + ' ' + Last_Name as Full_Name, Designation
from Employee_CS2 e inner join Job_CS2 j on e.Job_Id = j.Job_Id;

--3. DISPLAY THE EMPLOYEES WITH THEIR DEPARTMENT NAMES AND REGIONAL GROUPS.
select First_Name + ' ' +  Middle_Name + ' ' + Last_Name as Full_Name, D_Name, City
from Employee_CS2 e inner join Department_CS2 d on e.Department_Id = d.Department_Id
inner join Location_CS2 l on d.Location_Id = l.Location_Id;

--4. HOW MANY EMPLOYEES WHO ARE WORKING IN DIFFERENT DEPARTMENTS AND DISPLAY WITH DEPARTMENT NAMES.
select * from Department_CS2;
select * from Employee_CS2;
select D_Name, count(*) from Employee_CS2 e inner join Department_CS2 d
on e.Department_Id = d.Department_Id group by D_Name;

--5. HOW MANY EMPLOYEES WHO ARE WORKING IN SALES DEPARTMENT.
select D_Name, count(*) from Employee_CS2 e inner join Department_CS2 d
on e.Department_Id = d.Department_Id group by D_Name having D_Name = 'Sales';

--6. WHICH IS THE DEPARTMENT HAVING GREATER THAN OR EQUAL TO 5 EMPLOYEES AND DISPLAY THE 
--DEPARTMENT NAMES IN ASCENDING ORDER.
  select count(*) Department_Id,D_Name from Employee_CS2 e,Department_CS2 d 
  where e.Department_Id = d.Department_Id  
  group by D_Name having count(*)>=5 order by D_Name;

--7. HOW MANY JOBS IN THE ORGANIZATION WITH DESIGNATIONS.
select Designation, count(*) from Employee_CS2 e inner join Job_CS2 j on e.Job_Id = j.Job_Id
group by j.Designation;

--8. HOW MANY EMPLOYEES ARE WORKING IN "NEW YORK".
select count(*) from Employee_CS2 e, Department_CS2 d, Location_CS2 l 
where e.Department_Id = d.Department_Id and d.Location_Id = l.Location_Id
and City = 'New York';
 
--12. DISPLAY THE EMPLOYEE DETAILS WITH THEIR MANAGER NAMES.
select * from Job_CS2;
select * from Employee_CS2;
select First_Name + ' ' +  Middle_Name + ' ' + Last_Name as Full_Name, Designation 
from Employee_CS2 e, Job_CS2 j where e.Job_Id = j.Job_Id and Designation = 'Manager';

--13. DISPLAY THE EMPLOYEE DETAILS WHO EARN MORE THAN THEIR MANAGERS SALARIES.
select First_Name + ' ' +  Middle_Name + ' ' + Last_Name as Full_Name

--16. DISPLAY ALL EMPLOYEES IN SALES OR OPERATION DEPARTMENTS.
select First_Name + ' ' +  Middle_Name + ' ' + Last_Name as Full_Name, D_Name 
from Employee_CS2 e, Department_CS2 d where e.Department_id = d.Department_id
and D_Name = 'Sales' or D_Name = 'Operation';
;
select * from Department_CS2;
select * from Employee_CS2;


--SET OPERATORS
--1. LIST OUT THE DISTINCT JOBS IN SALES AND ACCOUNTING DEPARTMENTS.
select Designation from Job_CS2 where Job_Id in (select Job_Id from Employee_CS2 where 
Department_id = (select Department_id from Department_CS2 where D_Name = 'Sales'))
union
select Designation from Job_CS2 where Job_Id in (select Job_Id from Employee_CS2 where 
Department_id = (select Department_id from Department_CS2 where D_Name = 'Accounting'));

--2. LIST OUT ALL THE JOBS IN SALES AND ACCOUNTING DEPARTMENTS.
select Designation from Job_CS2 where Job_Id in (select Job_Id from Employee_CS2 where
Department_id = (select Department_id from Department_CS2 where D_Name = 'Sales'))
union all
select Designation from Job_CS2 where Job_Id in (select Job_Id from Employee_CS2 where
Department_id = (select Department_id from Department_CS2 where D_Name = 'Accounting'));

--3. LIST OUT THE COMMON JOBS IN RESEARCH AND ACCOUNTING DEPARTMENTS IN ASCENDING ORDER.
select Designation from Job_CS2 where Job_Id in (select Job_Id from Employee_CS2 where
Department_id = (select Department_id from Department_CS2 where D_Name = '	Research'))
intersect
select Designation from Job_CS2 where Job_Id in (select Job_Id from Employee_CS2 where
Department_id = (select Department_id from Department_CS2 where D_Name = 'Accounting'));


--SUB QUERIES
--1. DISPLAY THE EMPLOYEES LIST WHO GOT THE MAXIMUM SALARY.
select * from Employee_CS2 where Salary = (select max(Salary) from Employee_CS2);

--2. DISPLAY THE EMPLOYEES WHO ARE WORKING IN SALES DEPARTMENT.
select * from Employee_CS2 where Department_Id in (select Department_Id from Department_CS2
where D_Name = 'Sales'); 

--3. DISPLAY THE EMPLOYEES WHO ARE WORKING AS 'CLERCK'.
select * from Employee_CS2 where Job_Id in (select Job_Id from Job_CS2 where Designation = 'Clerk');

--4. DISPLAY THE LIST OF EMPLOYEES WHO ARE LIVING IN "NEW YORK".
select * from Employee_CS2 where Department_id in (select Department_id from Department_CS2 
where Location_Id in (select Location_Id from Location_CS2 where City = 'New York'));

--5. FIND OUT NO. OF EMPLOYEES WORKING IN "SALES" DEPARTMENT.
select count(*) No_of_Emp from Employee_CS2 where Department_id in (select Department_id 
from Department_CS2 where D_Name = 'Sales');

--6. UPDATE THE EMPLOYEES SALARIES, WHO ARE WORKING AS CLERK ON THE BASIS OF 10%.
update Employee_CS2 set Salary = 0.1*Salary where Job_Id in (select Job_Id from Job_CS2
where Designation = 'Clerk');
select Salary from Employee_CS2;

--7. DELETE THE EMPLOYEES WHO ARE WORKING IN ACCOUNTING DEPARTMENT.
delete from Employee_CS2 where Department_id in (select Department_id from Department_CS2
where D_Name = 'Accounting');

--8. DISPLAY THE SECOND HIGHEST SALARY DRAWING EMPLOYEE DETAILS.
select * from Employee_CS2 where Salary in (select max(Salary) from Employee_CS2 
where Salary < (select max(Salary) from Employee_CS2));

--9. DISPLAY THE N'TH HIGHEST SALARY DRAWING EMPLOYEE DETAILS.
SELECT * from Employee_CS2 e1 where 
N-1 = (SELECT COUNT(DISTINCT Salary)from Employee e2 where e2.Salary > e1.Salary);
/*Where N is Desired highest number*/

--10. LIST OUT THE EMPLOYEES WHO EARN MORE THAN EVERY EMPLOYEE IN DEPARTMENT 30.
select * from Employee_CS2 where Salary > all(select Salary from Employee_CS2 where Department_id = 30);

--11. LIST OUT THE EMPLOYEES WHO EARN MORE THAN THE LOWEST SALARY IN DEPARTMENT 30.
select * from Employee_CS2 where Salary < all(select Salary from Employee_CS2 where Department_id = 30);

--12. FIND OUT WHOSE DEPARTMENT HAS NOT EMPLOYEES.
select * from Employee_CS2 e where not exists(select Department_id from Department_CS2 d
where d.Department_id = e.Department_id);

--13. FIND OUT WHICH DEPARTMENT DOES NOT HAVE ANY EMPLOYEES.
select Department_Id from Employee_CS2 where Department_id not in 
(select Department_Id from Department_CS2);

--14. FIND OUT THE EMPLOYEES WHO EARN GREATER THAN THE AVERAGE SALARY FOR THEIR DEPARTMENT.
select * from Employee_CS2 e where Salary > (select avg(Salary) from Employee_CS2
where Department_id = e.Department_id);