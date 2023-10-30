use Sam;

--1. Display the details of the software developed in DBASE by Male Programmers, who belong
--to the institute in which most number of Programmer.
select p.* from Programmer p, Studies st 
where p.PNAME = st.PNAME
and PROF1 = 'DBASE' and INSTITUTE = (select max(INSTITUTE) from Studies group by INSTITUTE);

--2. In which language are most of the programmer’s proficient?
select top(1) Loved_Lang, CNT_P from
(select PROF1 Loved_Lang, count(PROF1) CNT_P from Programmer group by PROF1) t
order by CNT_P desc;

--3. In which month did the most number of programmers join?
select top(1) Join_year, CNT from
(select year(DOJ) as Join_year, count(year(DOJ)) as CNT from Programmer group by year(DOJ)) t
order by CNT desc;


--4. In which year was the most number of Programmers born.
with CTE_PBorn as
(select year(DOB) as Born_Year, count(year(DOB)) as CNT from Programmer group by year(DOB))
select Born_Year, CNT from CTE_PBorn where CNT = (select max(CNT) from CTE_PBorn);

--5. Which programmer has developed the highest number of Packages?
select PNAME, count(ds.count_title) as Highest_Package from
(select  PNAME, max(TITLE) as count_title from Software
group by TITLE,PNAME) as ds group by PNAME

--6. Which language was used to develop the most number of Packages.
select distinct DEVELOPIN from Software where SOLD = (select max(SOLD) from Software);

--7. Which course has below average number of Students?
with CTE_BAvg as
(select COURSE, count(COURSE) as CNT_PN from Studies group by COURSE)
select COURSE,CNT_PN from CTE_BAvg where CNT_PN = (select avg(CNT_PN) from CTE_BAvg);

--8. Which course has been done by the most of the Students?
select count(COURSE) from Studies
where count(COURSE) = (select max(count(COURSE)) from Studies);

--9. Which Institute has the most number of Students?
select INSTITUTE, count(ds.count_pname) as Count_Stu
from (select INSTITUTE, max(PNAME) as count_pname from Studies group by INSTITUTE, PNAME) as ds
group by INSTITUTE;

--10. Who is the Above Programmer Referred in 50?
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

--11. Display the names of the highest paid programmers for each Language.
select distinct PNAME,SALARY, PROF1 FROM Programmer WHERE (SALARY) IN 
(SELECT MAX(SALARY) from Programmer group by PROF1);