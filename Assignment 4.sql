show databases;
use school;
show tables;
desc student;
select *from student;

-- Using select Query  
-- 1.Order by Clause :
select * from student order by Blood_Group;

-- 2. Group by and having :
select count(studentID),City from student group by City;
select count(studentID),City from student group by City Having count(studentID)>2;

-- 3. Aggregate functions :
	-- (i).MIN   :
select MIN(studentId) from student;
	-- (ii).MAX  :
select MAX(studentID),c from student;
	-- (iii).COUNT   :
select count(studentID) from student where City='New York';
	-- (iV).AVG    :
select avg(studentID) from student;
	-- (V).SUM	:
select sum(studentID) from student;

-- 4. Logical operators especially with LIKE :
select * from student where First_Name like 'A%';
select * from student where Last_Name like '%e';
select * from student where Last_Name like '_a%';
select * from student where First_Name like 'B_';
select * from student where First_Name like 'B%a';

-- 5. At least 4 Nested queries specific to your Database, out of which at least 2 should
-- have multiple subquery :
select First_Name as Candidates,City
from student
where studentID in (
   select studentID
   from student
   where City in (
		select City 
        from student
		having (Phone in ( 901 , 890 , 907 , 999 , 838 ) or Blood_Group='A+') and (Last_Name like 'W%') and (studentId between 1 and 5 )
   )
) ;


