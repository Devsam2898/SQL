use Sam;

--1. Display the names of the highest paid programmers for each Language.
select distinct PNAME,SALARY, PROF1 FROM Programmer WHERE (SALARY) IN 
(SELECT MAX(SALARY) from Programmer group by PROF1);

--2. Display the details of those who are drawing the same salary.
select a.PNAME, a.SALARY from Programmer a, Programmer b 
where a.SALARY = B.SALARY and a.PNAME <> b.PNAME;

--3. Who are the programmers who joined on the same day?
select a.PNAME, a.DOJ from Programmer a, Programmer b
where a.DOJ = b.DOJ and a.PNAME <> b.PNAME
order by DOJ;

--4. Who are the programmers who have the same Prof2?
select a.PNAME, a.PROF2
from Programmer a, Programmer b
where a.PROF2 = b.PROF2 and a.PNAME <> b.PNAME;

--5. How many packages were developed by the person who developed the cheapest package,
--where did he/she study?
select count(*) from Software s, Studies st
where s.PNAME = st.PNAME 
group by DEVELOPIN
having min(DCOST) = (select min(DCOST) from Software);