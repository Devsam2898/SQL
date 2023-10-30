use Sam;

--1. How many Programmers Don’t know PASCAL and C
select count(PNAME) as COUNT_NoPaC from Programmer
where PROF1 not in ('PASCAL','C') or PROF2 not in ('PASCAL','C'); 

--2. Display the details of those who don’t know Clipper, COBOL or PASCAL.
select * from Programmer
where PROF1 not in ('CLIPPER','COBOL','PASCAL') 
and PROF2 not in ('CLIPPER','COBOL','PASCAL');

--3. Display each language name with AVG Development Cost, AVG Selling Cost and AVG Price
---per Copy.
select DEVELOPIN,avg(DCOST), avg(SCOST),avg(SCOST) AVG_PRICE_PERCOPY from Software 
group by DEVELOPIN;

--4. List the programmer names (from the programmer table) and No. Of Packages each has
--developed.
select Programmer.PNAME, count(Software.TITLE) No_of_Packages from Programmer, Software
where Programmer.PNAME = Software.PNAME
group by Programmer.PNAME;

--5. How many packages were developed by the female programmers earning more than the
--highest paid male programmer?
select distinct count(TITLE) Dev_Pack from Software s, Programmer p
where s.PNAME = p.PNAME and GENDER = 'F'
and SALARY > (select max(SALARY) from Programmer p, Software s
where p.PNAME = s.PNAME and GENDER = 'M');

--6. How much does the person who developed the highest selling package earn and what course
--did HE/SHE undergo.
select SALARY, COURSE from Programmer p, Studies st, Software s
where p.PNAME = st.PNAME and s.PNAME = p.PNAME
and SCOST = (select max(SCOST) from Software);

--7. In which institute did the person who developed the costliest package study?
select INSTITUTE from Studies st , Software s
where st.PNAME = s.PNAME 
and DCOST = (select max(DCOST) from Software);

--8. Display the names of the programmers who have not developed any packages.
select PNAME from Programmer p
where PROF1 not in (select DEVELOPIN from Software)
union 
select PNAME from Programmer p
where PROF2 not in (select DEVELOPIN from Software);

--9. Display the details of the software that has developed in the language which is neither the first
--nor the second proficiency
select s.* from Software s, Programmer p
where s.PNAME = p.PNAME and DEVELOPIN not in (PROF1, PROF2);

--10. Display the details of the software Developed by the male programmers Born before 1965
--and female programmers born after 1975
select s.* from Software s, Programmer p
where year(DOB) < '1965' and GENDER = 'M'
union
select s.* from Software s, Programmer p
where year(DOB) > '1975' and GENDER = 'F';

--11. Display the number of packages, No. of Copies Sold and sales value of each programmer
--institute wise.
select Studies.INSTITUTE, count(Software.TITLE) CNT_T, count(Software.SOLD) CNT_S, 
(Software.SCOST*Software.SOLD) Sales_Value from Software, Studies
where Software.PNAME = Studies.PNAME group by Studies.INSTITUTE, Software.SCOST, Software.SOLD;

--12. Display the details of the Software Developed by the Male Programmers Earning More
--than 3000/
 select PNAME, SALARY from Programmer where GENDER = 'M'and SALARY > 3000;

--13. Who are the Female Programmers earning more than the Highest Paid male?
select PNAME, SALARY from Programmer
where GENDER = 'F'
and SALARY > (select max(SALARY) from Programmer where GENDER = 'M');

--14. Who are the male programmers earning below the AVG salary of Female Programmers?
select PNAME,SALARY from Programmer where GENDER = 'M' and 
SALARY < (select avg(SALARY) from Programmer where GENDER = 'F');

--15. Display the language used by each programmer to develop the Highest Selling and
--Lowest-selling package.
select DEVELOPIN,PNAME from Software 
where SOLD in (select max(SOLD) from Software group by SOLD)
union 
select DEVELOPIN, PNAME from Software
where SOLD in (select min(SOLD) from Software group by SOLD);

--16. Display the names of the packages, which have sold less than the AVG number of copies.
select TITLE from Software 
where SOLD < (select avg(SOLD) from Software);

--17. Which is the costliest package developed in PASCAL.
select TITLE from Software
where DCOST = (select max(DCOST) FROM Software where DEVELOPIN = 'PASCAL');

--18. How many copies of the package that has the least difference between development and
--selling cost were sold.
select SOLD, (DCOST-SCOST) Diff from Software where DCOST-SCOST = (select min(DCOST-SCOST) 
from Software);
