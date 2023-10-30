use Sam;

--1) What is the Highest Number of copies sold by a Package?
select TITLE, max(SOLD) Highest_No_Copies from Software
group by TITLE
having max(SOLD) = (select max(SOLD) from Software);

--2) Display lowest course Fee.
select COURSE_FEE from Studies
group by COURSE_FEE
having COURSE_FEE = (select min(COURSE_FEE) from Studies);

--3) How old is the Oldest Male Programmer
select  max(year(getdate()) - year(DOB)) as OLDEST from Programmer where GENDER = 'M';

--4) What is the AVG age of Female Programmers?
select  avg(year(getdate()) - year(DOB)) as AVG_FP from Programmer where GENDER = 'F';

--5) Calculate the Experience in Years for each Programmer and Display with
--their names in Descending order.
select PNAME,year(getdate())-year(DOJ) Experience from Programmer
order by PNAME desc;

--6) How many programmers have done the PGDCA Course?
select count(PNAME) from Studies where COURSE = 'PGDCA';

--7) How much revenue has been earned thru sales of Packages Developed in C.select sum((SCOST + DCOST)*SOLD) as Revenue from Software where DEVELOPIN = 'C';--8) How many Programmers Studied at Sabhari?
select count(PNAME) as STUDIED_at_SABHARI from Studies where INSTITUTE = 'SABHARI';

--9) How many Packages Developed in DBASE?
select count(DEVELOPIN) as COUNT_DBASE from Software where DEVELOPIN = 'DBASE';

--10) How many programmers studied in Pragathi?
select count(PNAME) as STUDIED_IN_PRAGATHI from Studies where INSTITUTE = 'PRAGATHI';

--11) How many Programmers Paid 5000 to 10000 for their course?
select count(PNAME) as CF1 from Studies where COURSE_FEE between 5000 and 10000;

--12) How many Programmers know either COBOL or PASCAL?
select count(PNAME) as COUNT_CoPa from Programmer
where PROF1 in ('COBOL','PASCAL') or PROF2 in ('COBOL','PASCAL');

--13) How many Female Programmers are there?
select count(PNAME) as FPROG from Programmer where GENDER = 'F';

--14) What is the AVG Salary?
select avg(SALARY) AVG_SAL from Programmer;

--15) How many people draw salary 2000 to 4000?
select count(PNAME) as COUNT_PROG from Programmer where SALARY between 2000 and 4000;

--16) Display the sales cost of the packages Developed by each Programmer Language wise
select DEVELOPIN, sum(SCOST) COST_OF_PACKAGES from Software group by DEVELOPIN;

--17) Display the details of the software developed by the male students of Sabhari.select s.* from Software s, Programmer p, Studies st
where s.PNAME = p.PNAME and st.PNAME = s.PNAME
and GENDER = 'M' and INSTITUTE = 'SABHARI';

--18) Who is the oldest Female Programmer who joined in 1992?
select PNAME from Programmer where DOB= (select min(DOB) from Programmer
where year(DOJ) = '1992' and GENDER = 'F'); 

--19) Who is the youngest male Programmer born in 1965?
select PNAME from Programmer where DOB = (select min(DOB) from Programmer
where year(DOB) = '1965' and GENDER = 'M');

--20) Which Package has the lowest selling cost?
select distinct TITLE from Software where SCOST = (select min(SCOST) from Software);

--21) Which Female Programmer earning more than 3000 does not know C, C++,
--ORACLE or DBASE?
select * from Programmer
where GENDER = 'F' and SALARY > 3000 and (PROF1 not in ('C', 'CPP', 'ORACLE', 'DBASE')
and PROF2 not in ('C', 'CPP', 'ORACLE', 'DBASE'));

--22) Who is the Youngest Programmer knowing DBASE?
select PNAME, year(getdate())-year(DOB) as Youngest_Prog from Programmer
where year(getdate())-year(DOB) = (select min(year(getdate())-year(DOB)) from Programmer 
where PROF1 in ('DBASE') or PROF2 in ('DBASE'));

--23) Which Language is known by only one Programmer?
select PROF1 from Programmer group by PROF1 
having PROF1 not in(select PROF2 from Programmer) and count(PROF1) = 1 /* we checked if given language is not repeated and in PROF1 is not present in PROF2.*/
union
select PROF2 from Programmer group by PROF2
having PROF2 not in (select PROF1 from Programmer) and count(PROF2) = 1; /* we checked if given language is not repeated and in PROF2 is not present in PROF1.*/

--24) Who is the most experienced male programmer knowing PASCAL?
select PNAME,year(getdate())-year(DOJ) as Most_Exp_Yrs from Programmer
where year(getdate())-year(DOJ) = (select max(year(getdate())-year(DOJ)) from Programmer 
where PROF1 in ('PASCAL') or PROF2 in ('PASCAL')) 
and GENDER = 'M'
order by PNAME;

--25) Who is the least experienced Programmer?
select PNAME,year(getdate())-year(DOJ) as Least_Exp_Yrs from Programmer
where year(getdate())-year(DOJ) = (select min(year(getdate())-year(DOJ)) from Programmer)
order by PNAME;

--26) Display the Number of Packages in Each Language for which Development Cost is less than 1000.select TITLE, count(SALARY) No_of_Packages from Software s
inner join Programmer p
on s.PNAME = p.PNAME
where DCOST < 1000
group by TITLE;--27) Display Highest, Lowest and Average Salaries for those earning more than 2000select max(SALARY) HIGHEST, min(SALARY) LOWEST, avg(SALARY) AVG_SALARY from Programmer 
where SALARY > 2000 group by PNAME;