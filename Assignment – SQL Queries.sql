use Sam;

create table Studies(
PNAME varchar(30),
INSTITUTE varchar(50),
COURSE varchar(30),
COURSE_FEE int
);

insert into Studies values('ANAND','SABHARI','PGDCA',4500);
insert into Studies values('ALTAF','COIT','DCA',7200);
insert into Studies values('JULIANA','BDPS','MCA',22000);
insert into Studies values('KAMALA','PRAGATHI','DCA',5000);
insert into Studies values('MARY','SABHARI','PGDCA',4500);
insert into Studies values('NIELSON','PRAGATHI','DAP',6200);
insert into Studies values('PATRICK','PRAGATHI','DCAP',5200);
insert into Studies values('QADIR','APPLE','HDCA',14000);
insert into Studies values('RAMESH','SABHARI','PGDCA',4500);                                                                                                                            
insert into Studies values('REBECCA','BRILLIANT','DCAP',11000);
insert into Studies values('REMITHA','BDPS','DCS',6000);
insert into Studies values('REVATHI','SABHARI','DAP',5000);
insert into Studies values('VIJAYA','BDPS','DCA',48000);
select * from Studies;

create table Software(
PNAME VARCHAR(30),
TITLE VARCHAR(20),
DEVELOPIN VARCHAR(20),
SCOST int,
DCOST int,
SOLD int
);

insert into Software values('MARY','README','CPP',300,1200,84);
insert into Software values('ANAND','PARACHUTES','BASIC',399.95,6000,43);
insert into Software values('ANAND','VIDEO TITLING','PASCAL',7500,16000,9);
insert into Software values('JULIANA','INVENTORY','COBOL',3000,3500,0);
insert into Software values('KAMALA','PAYROLL PKG.','DBASE',9000,20000,7);
insert into Software values('MARY','FINANCIAL ACCT.','ORACLE',18000,85000,4);
insert into Software values('MARY','CODE GENERATOR','C',4500,20000,23);
insert into Software values('PATRICK','README','CPP',300,1200,84);
insert into Software values('QADIR','BOMBS AWAY','ASSEMBLY',750,3000,11);
insert into Software values('QADIR','VACCINES','C',1900,3100,21);
insert into Software values('RAMESH','HOTEL MGMT','DBASE',13000,3500,4);
insert into Software values('RAMESH','DEAD LEE','PASCAL',599.95,4500,73);
insert into Software values('REMITHA','PC UTILITIES','C',725,5000,51);
insert into Software values('REMITHA','TSR HELP PKG','ASSEMBLY',2500,6000,7);
insert into Software values('REVATHI','HOSPITAL MGMT.','PASCAL',1100,75000,2);
insert into Software values('VIJAYA','TSR EDITOR','C',900,700,6);
select * from Software;
;
create table Programmer(
PNAME VARCHAR(30),
DOB date,
DOJ date,
GENDER varchar(3),
PROF1 varchar(20),
PROF2 varchar(20),
SALARY int
);

insert into Programmer values('ANAND','12-APR-66','21-APR-92','M','PASCAL','BASIC',3200);
insert into Programmer values('ALTAF','02-JUL-64','13-NOV-90','M','CLIPPER','COBOL',2800);
insert into Programmer values('JULIANA','31-JAN-60','21-APR-90','F','COBOL','DBASE',3000);
insert into Programmer values('KAMALA','30-OCT-68','02-JAN-92','F','C','DBASE',2900);
insert into Programmer values('MARY','24-JUN-70','02-FEB-9','F','CPP','ORACLE',4500);
insert into Programmer values('NIELSON','1-SEP-65','21-OCT-89','M','COBOL','DBASE',2500);
insert into Programmer values('PATRICK','10-SEP-65','21-APR-90','M','PASCAL','CLIPPER',2800);
insert into Programmer values('QADIR','31-AUG-65','21-APR-91','M','ASSEMBLY','C',3000);
insert into Programmer values('RAMESH','03-MAY-67','28-FEB-91','M','PASCAL','DBASE',3200);
insert into Programmer values('REBECCA','01-JAN-67','01-DEC-90','F','BASIC','COBOL',2500);
insert into Programmer values('REMITHA','19-APR-70','20-APR-93','F','C','ASSEMBLY',3600);
insert into Programmer values('REVATHI','02-DEC-69','02-JAN-92','F','PASCAL','BASIC',3700);
insert into Programmer values('VIJAYA','14-DEC-65','02-MAY-92','F','FOXPRO','C',3500);
select * from Programmer;

select * from Studies;
select * from Software;
select * from Programmer;

--1. Find out the selling cost AVG for packages developed in Pascal. 
select avg(SCOST) as AVG_SCOST from Software where DEVELOPIN = 'PASCAL';

--2. Display Names, Ages of all Programmers.
select PNAME,DOB,getdate() as CDATE, year(getdate()) - year(DOB) as AGE from Programmer;

--3. Display the Names of those who have done the DAP Course. 
select PNAME from Studies where COURSE = 'DAP';

--4. Display the Names and Date of Births of all Programmers Born in January. 
select PNAME,DOB from Programmer where DOB = ''; /*Unfinished question*/

--5. What is the Highest Number of copies sold by a Package? 
select max(SOLD) as Highest_Sold from Software;+9
--select PNAME,TITLE from Software where SOLD = 84;/*Give another look.*/

--6. Display lowest course Fee.
select min(COURSE_FEE) as Lowest_CF from Studies;

--7. How many programmers done the PGDCA Course?
select count(PNAME) as COUNT_PROGRAMMERS from Studies where COURSE = 'PGDCA';

--8. How much revenue has been earned thru sales of Packages Developed in C.
select sum((SCOST + DCOST)*SOLD) as Revenue from Software where DEVELOPIN = 'C';

--9. Display the Details of the Software Developed by Ramesh. 
select * from Software where PNAME = 'RAMESH';

--10. How many Programmers Studied at Sabhari? 
select count(PNAME) as STUDIED_at_SABHARI from Studies where INSTITUTE = 'SABHARI';

--11. Display details of Packages whose sales crossed the 2000 Mark. Sales = (SCOST + DCOST)*SOLD
select * from Software where (SCOST + DCOST)*SOLD > 2000; /*Displaying everything, Caution*/

--12. Display the Details of Packages for which Development Cost have been recovered. 
select * from Software where SCOST > DCOST;

--13. What is the cost of the costliest software development in Basic? 
select max(SCOST + DCOST) as COSTLIEST_SOFTWARE from Software s
inner join Programmer p
on s.PNAME = p.PNAME
where PROF2 = 'BASIC';

--14. How many Packages Developed in DBASE?
select count(DEVELOPIN) as COUNT_DBASE from Software where DEVELOPIN = 'DBASE';

--15. How many programmers studied in Pragathi?
select count(PNAME) as STUDIED_IN_PRAGATHI from Studies where INSTITUTE = 'PRAGATHI';

--16. How many Programmers Paid 5000 to 10000 for their course?
select count(PNAME) as CF1 from Studies where COURSE_FEE between 5000 and 10000;

--17. What is AVG Course Fee
select avg(COURSE_FEE) as AVG_CF from Studies;

--18. Display the details of the Programmers Knowing C
select * from Programmer where PROF1 = 'C' or PROF2 = 'C';

--19. How many Programmers know either COBOL or PASCAL. 
select count(PNAME) as COUNT_CoPa from Programmer
where PROF1 in ('COBOL','PASCAL') or PROF2 in ('COBOL','PASCAL');

--20. How many Programmers Don’t know PASCAL and C 
select count(PNAME) as COUNT_NoPaC from Programmer
where PROF1 not in ('PASCAL','C') or PROF2 not in ('PASCAL','C'); 

--21. How old is the Oldest Male Programmer.
select  max(year(getdate()) - year(DOB)) as OLDEST from Programmer;

--22. What is the AVG age of Female Programmers?
select  avg(year(getdate()) - year(DOB)) as AVG_FPROG from Programmer where GENDER = 'F';

--23. Calculate the Experience in Years for each Programmer and Display with their names in Descending order. 
select PNAME,year(getdate())-year(DOJ) as Experience from Programmer order by PNAME desc;

--24. Who are the Programmers who celebrate their Birthday’s During the Current Month?
select PNAME from Programmer where month(DOB) = month((getdate()));

--25. How many Female Programmers are there?
select count(PNAME) as FPROG from Programmer where GENDER = 'F';

--26. What are the Languages studied by Male Programmers. 
select PROF1, PROF2 from Programmer where GENDER = 'M';

--27. What is the AVG Salary?+
select avg(SALARY) as AVG_SALARY from Programmer;

--28. How many people draw salary 2000 to 4000?
select count(PNAME) as COUNT_PROG from Programmer where SALARY between 2000 and 4000;

--29. Display the details of those who don’t know Clipper, COBOL or PASCAL.
select * from Programmer
where PROF1 not in ('CLIPPER','COBOL','PASCAL') 
and PROF2 not in ('CLIPPER','COBOL','PASCAL');

--30. Display the Cost of Package Developed By each Programmer. 
select PNAME,sum(DCOST) as COST_OF_PACKAGE from Software group by PNAME;

--31. Display the sales values of the Packages Developed by the each Programmer. 
select PNAME,sum(SCOST) as COST_OF_PACKAGE from Software group by PNAME;

--32. Display the Number of Packages sold by Each Programmer
select PNAME, count(TITLE) as No_PACKAGES from Software group by PNAME;

--33. Display the sales cost of the packages Developed by each Programmer Language wise
select DEVELOPIN, sum(SCOST) COST_OF_PACKAGES from Software group by DEVELOPIN;

--34. Display each language name with AVG Development Cost, AVG Selling Cost and AVG Price per Copy.
select DEVELOPIN,avg(DCOST), avg(SCOST),avg(SCOST) AVG_PRICE_PERCOPY from Software group by DEVELOPIN;

--35. Display each programmer’s name, costliest and cheapest Packages Developed by him or her.
select PNAME, max(DCOST) COSTLIEST, min(DCOST) CHEAPEST from Software group by PNAME;

--36. Display each institute name with number of Courses, Average Cost per Course
select INSTITUTE, count(COURSE) No_Of_Courses, avg(COURSE_FEE) AVG_CF from Studies group by INSTITUTE; 

--37. Display each institute Name with Number of Students. 
select INSTITUTE,count(PNAME) No_of_Students from Studies group by INSTITUTE;

--38. Display Names of Male and Female Programmers. Gender also. 
select PNAME,GENDER from Programmer group by PNAME,GENDER;

--39. Display the Name of Programmers and Their Packages
select PNAME, SALARY from Programmer;

--40. Display the Number of Packages in Each Language Except C and C++. 
select PNAME,count(SALARY) as No_of_Packages from Programmer 
where PROF1 not in ('C','CPP') and PROF2 not in ('C','CPP') group by PNAME;

--41. Display the Number of Packages in Each Language for which Development Cost is less than 1000.
select TITLE, count(SALARY) No_of_Packages from Software s
inner join Programmer p
on s.PNAME = p.PNAME
where DCOST < 1000
group by TITLE;

--42. Display AVG Difference between SCOST, DCOST for Each Package. 
select avg(DCOST-SCOST) Avg_DIFF, SALARY from Software s
inner join Programmer p
on s.PNAME = p.PNAME
group by SALARY;

--43. Display the total SCOST, DCOST and amount to Be Recovered for each 
--Programmer for Those Whose Cost has not yet been Recovered. 
select PNAME,sum(SCOST) Total_SC, sum(DCOST) Total_DC, sum(DCOST-(SCOST*SOLD)) Amt_Recovered from Software
group by PNAME
having sum(DCOST) > sum(SCOST*SOLD);

--44. Display Highest, Lowest and Average Salaries for those earning more than 2000. 
select max(SALARY) HIGHEST, min(SALARY) LOWEST, avg(SALARY) AVG_SALARY from Programmer 
where SALARY > 2000 group by PNAME;

--45. Who is the Highest Paid C Programmers? 
select PNAME,SALARY from Programmer
where SALARY = (select max(SALARY) from Programmer /*Loop is required to find highest from students who studied C*/ 
where PROF1 LIKE 'C' or PROF2 like 'C');

--46. Who is the Highest Paid Female COBOL Programmer? 
select PNAME,SALARY from Programmer
where GENDER = 'F' 
and SALARY = (select max(SALARY) from Programmer
where PROF1 like 'COBOL' or PROF2 like 'COBOL');

--47. Display the names of the highest paid programmers for each Language.
select distinct PNAME,SALARY, PROF1 FROM Programmer WHERE (SALARY) IN 
(SELECT MAX(SALARY) from Programmer group by PROF1);


--48. Who is the least experienced Programmer. 
select PNAME,year(getdate())-year(DOJ) as Least_Exp_Yrs from Programmer
where year(getdate())-year(DOJ) = (select min(year(getdate())-year(DOJ)) from Programmer)
order by PNAME;

--49. Who is the most experienced male programmer knowing PASCAL.
select PNAME,year(getdate())-year(DOJ) as Most_Exp_Yrs from Programmer
where year(getdate())-year(DOJ) = (select max(year(getdate())-year(DOJ)) from Programmer 
where PROF1 in ('PASCAL') or PROF2 in ('PASCAL')) 
and GENDER = 'M'
order by PNAME; 

--50. Which Language is known by only one Programmer?
select PROF1 from Programmer group by PROF1 
having PROF1 not in(select PROF2 from Programmer) and count(PROF1) = 1 /* we checked if given language is not repeated and in PROF1 is not present in PROF2.*/
union
select PROF2 from Programmer group by PROF2
having PROF2 not in (select PROF1 from Programmer) and count(PROF2) = 1; /* we checked if given language is not repeated and in PROF2 is not present in PROF1.*/

--51. Who is the Above Programmer Referred in 50?
with all_languages_known as
(
  select PROF1 language from Programmer
  union all
  select PROF2 from Programmer
),  languages_known_by_one_programmer as
(
  select language
  from all_languages_known
  group by language
  having count(*) = 1
)
select * from Programmer
where PROF1 in (select language from languages_known_by_one_programmer)
   or PROF2 in (select language from languages_known_by_one_programmer);



--52. Who is the Youngest Programmer knowing DBASE? 
select PNAME, year(getdate())-year(DOB) as Youngest_Prog from Programmer
where year(getdate())-year(DOB) = (select min(year(getdate())-year(DOB)) from Programmer 
where PROF1 in ('DBASE') or PROF2 in ('DBASE')) 
order by PNAME;

--53. Which Female Programmer earning more than 3000 does not know C, C++, ORACLE or DBASE?
select * from Programmer
where GENDER = 'F' and SALARY > 3000 and (PROF1 not in ('C', 'CPP', 'ORACLE', 'DBASE')
and PROF2 not in ('C', 'CPP', 'ORACLE', 'DBASE'));

--54. Which Institute has most number of Students?
select INSTITUTE, count(ds.count_pname) as Count_Stu
from (select INSTITUTE, max(PNAME) as count_pname from Studies group by INSTITUTE, PNAME) as ds
group by INSTITUTE;

--55. What is the Costliest course?
select max(COURSE_FEE) Costliest_Course from Studies; 

--56. Which course has been done by the most of the Students?
select count(COURSE) from Studies
where count(COURSE) = (select max(count(COURSE)) from Studies);
/*same as 54*/

--57. Which Institute conducts costliest course.
select INSTITUTE,COURSE_FEE from Studies 
where COURSE_FEE = (select  max(COURSE_FEE) from Studies); 

--58. Display the name of the Institute and Course, which has below AVG course fee.
select INSTITUTE, COURSE, COURSE_FEE from Studies 
where COURSE_FEE < (select avg(COURSE_FEE) from Studies); 
SELECT avg(COURSE_FEE) FROM Studies;

--59. Display the names of the courses whose fees are within 1000 (+ or -) of the Average Fee, 
select COURSE from Studies where COURSE_FEE < (select avg(COURSE_FEE)+1000 from Studies)
and COURSE_FEE < (select avg(COURSE_FEE)-1000 from Studies);

--60. Which package has the Highest Development cost? 
select DEVELOPIN from Software where DCOST = (select max(DCOST) from Software);

--61. Which course has below AVG number of Students?
with CTE_AVG as
(select COURSE, count(PNAME) as CNT from Studies group by COURSE)
select COURSE, CNT from CTE_AVG where CNT = (select avg(CNT) from CTE_AVG);


--62. Which Package has the lowest selling cost?
select distinct DEVELOPIN from Software where SCOST = (select min(SCOST) from Software);

--63. Who Developed the Package that has sold the least number of copies? 
select PNAME,SOLD from Software where SOLD = (select min(SOLD) from Software);

--64. Which language has used to develop the package, which has the highest sales amount? 
select distinct DEVELOPIN from Software where SOLD = (select max(SOLD) from Software);

--65. How many copies of package that has the least difference between development and selling cost where sold.
select SOLD, (DCOST-SCOST) Diff from Software where DCOST-SCOST = (select min(DCOST-SCOST) from Software);

--66. Which is the costliest package developed in PASCAL.
select TITLE from Software
where DCOST = (select max(DCOST) FROM Software where DEVELOPIN = 'PASCAL');

--67. Which language was used to develop the most number of Packages.
select distinct DEVELOPIN from Software where SOLD = (select max(SOLD) from Software);

--68. Which programmer has developed the highest number of Packages? 
select PNAME, count(ds.count_title) as Highest_Package from
(select  PNAME, max(TITLE) as count_title from Software
group by TITLE,PNAME) as ds group by PNAME; /* unfinished*/

--69. Who is the Author of the Costliest Package?
select PNAME from Software
where SCOST = (select max(SCOST) from Software);

--70. Display the names of the packages, which have sold less than the AVG number of copies.
select TITLE from Software 
where SOLD < (select avg(SOLD) from Software);

--71. Who are the authors of the Packages, which have recovered more than double the Development cost?
select PNAME from Software where SCOST*SOLD > 2*DCOST;

--72. Display the programmer Name and the cheapest packages developed by them in each language.
select PNAME,TITLE from Software where DCOST in (select min(DCOST) from Software group by DCOST);

--73. Display the language used by each programmer to develop the Highest Selling and Lowest-selling package.
select DEVELOPIN,PNAME from Software 
where SOLD in (select max(SOLD) from Software group by SOLD)
union 
select DEVELOPIN, PNAME from Software
where SOLD in (select min(SOLD) from Software group by SOLD);

--75. Who is the oldest Female Programmer who joined in 1992?
select PNAME from Programmer where DOJ= (select min(DOJ) from Programmer
where year(DOJ) = '1992');**

--76. In which year was the most number of Programmers born?
select top(1) Born_year, CNT from
(select year(DOB) as Born_year, count(year(DOB)) as CNT from Programmer group by year(DOB)) t
order by CNT desc;
/*Below is the solution using CTE.*/
with CTE_PBorn as
(select year(DOB) as Born_Year, count(year(DOB)) as CNT from Programmer group by year(DOB))
select Born_Year, CNT from CTE_PBorn where CNT = (select max(CNT) from CTE_PBorn);

--77. In which month did most number of programmers join? 
select top(1) Join_year, CNT from
(select year(DOJ) as Join_year, count(year(DOJ)) as CNT from Programmer group by year(DOJ)) t
order by CNT desc;

--78. In which language are most of the programmer’s proficient?
select top(1) Loved_Lang, CNT_P from
(select PROF1 Loved_Lang, count(PROF1) CNT_P from Programmer group by PROF1) t
order by CNT_P desc;

--79. Who are the male programmers earning below the AVG salary of Female Programmers?
select PNAME,SALARY from Programmer where GENDER = 'M' and 
SALARY < (select avg(SALARY) from Programmer where GENDER = 'F');

--80. Who are the Female Programmers earning more than the Highest Paid Male Programmers?
select PNAME, SALARY from Programmer
where GENDER = 'F'
and SALARY > (select max(SALARY) from Programmer where GENDER = 'M');

--81. Which language has been stated as the proficiency by most of the Programmers?
select PROF1 from Programmer
group by PROF1
having PROF1 = (select max(PROF1) from Programmer);

--82. Display the details of those who are drawing the same salary.
select PNAME, SALARY from Programmer where SALARY = any(select SALARY from Programmer p
group by SALARY HAVING SALARY = p.SALARY and count(*) > 1);

select a.PNAME, a.SALARY from Programmer a, Programmer b 
where a.SALARY = B.SALARY and a.PNAME <> b.PNAME;
 
 select PNAME, SALARY from Programmer
 where SALARY in (select SALARY from Programmer p where Programmer.PNAME <> p.PNAME)
 order by SALARY;

 --83. Display the details of the Software Developed by the Male Programmers Earning More than 3000/-.
 select PNAME, SALARY from Programmer where GENDER = 'M'and SALARY > 3000;

 --84. Display the details of the packages developed in Pascal by the Female Programmers
 select TITLE,SCOST, DCOST from Software s
 inner join Programmer p
 on s.PNAME = p.PNAME
 where DEVELOPIN = 'PASCAL' and GENDER = 'F';

 --85. Display the details of the Programmers who joined before 1990. 
 select * from Programmer where year(DOJ) < '1990';

 --86. Display the details of the Software Developed in C By female programmers of Pragathi.
 select s.* from Studies st, Software s, Programmer p    /* Note alias.*    */
 where st.PNAME = s.PNAME and p.PNAME = st.PNAME
 and GENDER = 'F' and INSTITUTE = 'PRAGATHI';

--87. Display the number of packages, No. of Copies Sold and sales value of each programmer institute wise.
select Studies.INSTITUTE, count(Software.TITLE) CNT_T, count(Software.SOLD) CNT_S, 
(Software.SCOST*Software.SOLD) Sales_Value from Software, Studies
where Software.PNAME = Studies.PNAME group by Studies.INSTITUTE, Software.SCOST, Software.SOLD;

--88. Display the details of the software developed in DBASE by Male Programmers, who
--belong to the institute in which most number of Programmers studied.
select p.* from Programmer p, Studies st 
where p.PNAME = st.PNAME
and PROF1 = 'DBASE' and INSTITUTE = (select max(INSTITUTE) from Studies group by INSTITUTE);
	
--89. Display the details of the software Developed by the male programmers Born before 1965 and female programmers born after 1975.
select s.* from Software s, Programmer p
where year(DOB) < '1965' and GENDER = 'M'
union
select s.* from Software s, Programmer p
where year(DOB) > '1975' and GENDER = 'F';

--90. Display the details of the software that has developed in the language which is neither the first nor the second proficiency of the programmers.
select s.* from Software s, Programmer p
where s.PNAME = p.PNAME and DEVELOPIN not in (PROF1, PROF2);

select s.*
from programmer p,software s
where s.PNAME=p.PNAME and (DEVELOPIN <> PROF1 and DEVELOPIN <> PROF2);

--91. Display the details of the software developed by the male students of Sabhari.
select s.* from Software s, Studies st, Programmer p
where s.PNAME = st.PNAME and p.PNAME = s.PNAME
and GENDER = 'M' and INSTITUTE = 'SABHARI';

--92. Display the names of the programmers who have not developed any packages.
select PNAME from Programmer p
where PROF1 not in (select DEVELOPIN from Software)
union 
select PNAME from Programmer p
where PROF2 not in (select DEVELOPIN from Software);

select PNAME
from Programmer
where PNAME not in(select PNAME
from Software);

--93. What is the total cost of the Software developed by the programmers of Apple?
select sum(Software.DCOST) Total_Cost from Software, Studies
where Software.PNAME = Studies.PNAME
and INSTITUTE = 'APPLE';

--94. Who are the programmers who joined on the same day?
select a.PNAME, a.DOJ from Programmer a, Programmer b
where a.DOJ = b.DOJ and a.PNAME <> b.PNAME
order by DOJ;

--95. Who are the programmers who have the same Prof2?
select a.PNAME, a.PROF2
from Programmer a, Programmer b
where a.PROF2 = b.PROF2 and a.PNAME <> b.PNAME;

--96. Display the total sales value of the software, institute wise.
select Studies.INSTITUTE, sum(Software.SCOST*Software.SOLD) Total_Sales_Value from Software, Studies
where Software.PNAME = Studies.PNAME
group by INSTITUTE;

--97. In which institute does the person who developed the costliest package studied.
select INSTITUTE from Studies st , Software s
where st.PNAME = s.PNAME 
and DCOST = (select max(DCOST) from Software);

--98. Which language listed in prof1, prof2 has not been used to develop any package.
select PROF1 from Programmer where PROF1 not in (select DEVELOPIN from Software)
union
select PROF2 from Programmer where PROF2 not in (select DEVELOPIN from Software);

--99. How much does the person who developed the highest selling package earn and what course did HE/SHE undergo. 
select SALARY, COURSE from Programmer p, Studies st, Software s
where p.PNAME = st.PNAME and s.PNAME = p.PNAME
and SCOST = (select max(SCOST) from Software);

--100. What is the AVG salary for those whose software sales is more than 50,000/-.
select avg(SALARY) AVG_Sal from Programmer p, Software s
where p.PNAME = s.PNAME and (SCOST*SOLD) > 50000;

--101. How many packages were developed by students, who studied in institute that charge the lowest course fee?
select count(*) from Software s, Studies st
where s.PNAME= st.PNAME and COURSE_FEE = (select min(COURSE_FEE) from Studies);

--102. How many packages were developed by the person who developed the cheapest package, where did HE/SHE study?
select count(*) from Software s, Studies st
where s.PNAME = st.PNAME 
group by DEVELOPIN
having min(DCOST) = (select min(DCOST) from Software);

--103. How many packages were developed by the female programmers earning more than the highest paid male programmer?
select distinct count(TITLE) Dev_Pack from Software s, Programmer p
where s.PNAME = p.PNAME and GENDER = 'F'
and SALARY > (select max(SALARY) from Programmer p, Software s
where p.PNAME = s.PNAME and GENDER = 'M');

--104. How many packages are developed by the most experienced programmer form BDPS.
select TITLE, count(s.TITLE) from Software s, Programmer p, Studies st
where s.PNAME = p.PNAME 
group by DOJ, TITLE
having max(DOJ) = (select max(DOJ) from Studies st, Programmer p, Software s
where p.PNAME = s.PNAME and st.PNAME = p.PNAME and (INSTITUTE = 'BDPS'));

--105. List the programmers (form the software table) and the institutes they studied.
select s.PNAME, st.INSTITUTE from Software s, Studies st
where s.PNAME = st.PNAME
group by s.PNAME, st.INSTITUTE;

--106. List each PROF with the number of Programmers having that PROF and the number of the packages in that PROF.
select p.PROF1, count(p.PROF1) No_Of_Prog, count(s.TITLE) No_of_Packages from Programmer p, Software s
where p.PNAME = s.PNAME
group by PROF1;

--107. List the programmer names (from the programmer table) and No. Of Packages each has developed.
select Programmer.PNAME, count(Software.TITLE) No_of_Packages from Programmer, Software
where Programmer.PNAME = Software.PNAME
group by Programmer.PNAME;