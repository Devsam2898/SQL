use Sam;

--1. Find out the selling cost AVG for packages developed in Pascal.
select avg(SCOST) as AVG_SCOST from Software where DEVELOPIN = 'PASCAL';

--2. Display Names, Ages of all Programmers.
select PNAME,DOB,getdate() as CDATE, year(getdate()) - year(DOB) as AGE from Programmer;

--3. Display the Names of those who have done the DAP Course.
select PNAME from Studies where COURSE = 'DAP';

--4. Display the Names and Date of Births of all Programmers Born in January.
select PNAME,DOB from Programmer where month(DOB) = '01';

--5. Display the Details of the Software Developed by Ramesh.
--Development cost?
select TITLE from Software where (SOLD*SCOST) > 2*DCOST;