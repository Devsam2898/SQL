use Sam;

--1. Find out the selling cost AVG for packages developed in Pascal.
select avg(SCOST) as AVG_SCOST from Software where DEVELOPIN = 'PASCAL';

--2. Display Names, Ages of all Programmers.
select PNAME,DOB,getdate() as CDATE, year(getdate()) - year(DOB) as AGE from Programmer;

--3. Display the Names of those who have done the DAP Course.
select PNAME from Studies where COURSE = 'DAP';

--4. Display the Names and Date of Births of all Programmers Born in January.
select PNAME,DOB from Programmer where month(DOB) = '01';

--5. Display the Details of the Software Developed by Ramesh.select * from Software where PNAME = 'RAMESH';--6. Display the Details of Packages for which Development Cost have been recovered.select * from Software where SCOST > DCOST;--7. Display the details of the Programmers Knowing C.select * from Programmer where PROF1 = 'C' or PROF2 = 'C';--8. What are the Languages studied by Male Programmers?select distinct PROF1 from Programmer where GENDER = 'M';--9. Display the details of the Programmers who joined before 1990.select * from Programmer where year(DOJ) < '1990';--10. Who are the authors of the Packages, which have recovered more than double the
--Development cost?
select TITLE from Software where (SOLD*SCOST) > 2*DCOST;