use Sam;

--1. What is the cost of the costliest software development in Basic?
select max(SCOST + DCOST) as COSTLIEST_SOFTWARE from Software s
inner join Programmer p
on s.PNAME = p.PNAME
where PROF2 = 'BASIC';

--2. Display details of Packages whose sales crossed the 2000 Mark.
select * from Software where (SCOST + DCOST)*SOLD > 2000;

--3. Who are the Programmers who celebrate their Birthdays during the Current Month?
select PNAME from Programmer where month(DOB) = month((getdate()));

--4. Display the Cost of Package Developed By each Programmer.
select PNAME,sum(DCOST) as COST_OF_PACKAGE from Software group by PNAME;

--5. Display the sales values of the Packages Developed by each Programmer.
select PNAME,sum(SCOST) as COST_OF_PACKAGE from Software group by PNAME;

--6. Display the Number of Packages sold by Each Programmer.
select PNAME, count(TITLE) as No_PACKAGES from Software group by PNAME;

--7. Display each programmer’s name, costliest and cheapest Packages Developed by him or her.
select PNAME, max(DCOST) COSTLIEST, min(DCOST) CHEAPEST from Software group by PNAME;

--8. Display each institute name with the number of Courses, Average Cost per Course.
select INSTITUTE, count(COURSE) No_Of_Courses, avg(COURSE_FEE) AVG_CF from Studies 
group by INSTITUTE; 

--9. Display each institute Name with Number of Students.
select INSTITUTE,count(PNAME) No_of_Students from Studies group by INSTITUTE;

--10. List the programmers (form the software table) and the institutes they studied.
select s.PNAME, st.INSTITUTE from Software s, Studies st
where s.PNAME = st.PNAME
group by s.PNAME, st.INSTITUTE;

--11. How many packages were developed by students, who studied in institute that charge the
--lowest course fee?
select count(*) from Software s, Studies st
where s.PNAME= st.PNAME and COURSE_FEE = (select min(COURSE_FEE) from Studies);


--12. What is the AVG salary for those whose software sales is more than 50,000/-.
select avg(SALARY) AVG_Sal from Programmer p, Software s
where p.PNAME = s.PNAME and (SCOST*SOLD) > 50000;

--13. Which language listed in prof1, prof2 has not been used to develop any package.
select PROF1 from Programmer where PROF1 not in (select DEVELOPIN from Software)
union
select PROF2 from Programmer where PROF2 not in (select DEVELOPIN from Software);

--14. Display the total sales value of the software, institute wise.
select Studies.INSTITUTE, sum(Software.SCOST*Software.SOLD) Total_Sales_Value from Software, Studies
where Software.PNAME = Studies.PNAME
group by INSTITUTE;

--15. Display the details of the Software Developed in C By female programmers of
--Pragathi.
 select s.* from Studies st, Software s, Programmer p    /* Note alias.*    */
 where st.PNAME = s.PNAME and p.PNAME = st.PNAME
 and GENDER = 'F' and INSTITUTE = 'PRAGATHI';

--16. Display the details of the packages developed in Pascal by the Female Programmers.
 select TITLE,SCOST, DCOST from Software s
 inner join Programmer p
 on s.PNAME = p.PNAME
 where DEVELOPIN = 'PASCAL' and GENDER = 'F';

--17. Which language has been stated as the proficiency by most of the Programmers?
select PROF1 from Programmer
group by PROF1
having PROF1 = (select max(PROF1) from Programmer);

--18. Who is the Author of the Costliest Package?
select PNAME from Software
where SCOST = (select max(SCOST) from Software);

--19. Which package has the Highest Development cost?
select DEVELOPIN from Software where DCOST = (select max(DCOST) from Software);

--20. Who is the Highest Paid Female COBOL Programmer?
select PNAME,SALARY from Programmer
where GENDER = 'F' 
and SALARY = (select max(SALARY) from Programmer
where PROF1 like 'COBOL' or PROF2 like 'COBOL');

--21. Display the Name of Programmers and Their Packages.
select PNAME, TITLE from Software;

--22. Display the Number of Packages in Each Language Except C and C++.
select PNAME,count(SALARY) as No_of_Packages from Programmer 
where PROF1 not in ('C','CPP') and PROF2 not in ('C','CPP') group by PNAME;

--23. Display AVG Difference between SCOST, DCOST for Each Package.
select avg(DCOST-SCOST) Avg_DIFF, SALARY from Software s
inner join Programmer p
on s.PNAME = p.PNAME
group by SALARY;

--24. Display the total SCOST, DCOST and amount to Be Recovered for each Programmer for
--Those Whose Cost has not yet been Recovered.
select PNAME,sum(SCOST) Total_SC, sum(DCOST) Total_DC, sum(DCOST-(SCOST*SOLD)) Amt_Recovered from Software
group by PNAME
having sum(DCOST) > sum(SCOST*SOLD);


--25. Who is the Highest Paid C Programmers?
select PNAME,SALARY from Programmer
where SALARY = (select max(SALARY) from Programmer /*Loop is required to find highest from students who studied C*/ 
where PROF1 LIKE 'C' or PROF2 like 'C');


--26. Who is the Highest Paid Female COBOL Programmer?
select PNAME,SALARY from Programmer
where GENDER = 'F' 
and SALARY = (select max(SALARY) from Programmer
where PROF1 like 'COBOL' or PROF2 like 'COBOL');