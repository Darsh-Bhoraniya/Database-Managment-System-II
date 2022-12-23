--INSERT INTO Employee VALUES(1,'Nick','Male','01-JAN-13',4000,'London')
--INSERT INTO Employee VALUES(2 ,'Julian','Female','01-OCT-14',3000, 'New York')
--INSERT INTO Employee VALUES(3 ,'Roy', 'Male', '01-JUN-16', 3500 ,'London')
--INSERT INTO Employee VALUES(4, 'Tom', 'Male', NULL, 4500, 'London')
--INSERT INTO Employee VALUES(5, 'Jerry', 'Male', '01-FEB-13', 2800, 'Sydney')
--INSERT INTO Employee VALUES(6, 'Philip', 'Male', '01-JAN-15', 7000,'New York')
--INSERT INTO Employee VALUES(7, 'Sara', 'Female', '01-AUG-17', 4800, 'Sydney')
--INSERT INTO Employee VALUES(8, 'Emily', 'Female', '01-JAN-15', 5500, 'New York')
--INSERT INTO Employee VALUES(9 ,'Michael', 'Male', NULL, 6500, 'London')
--INSERT INTO Employee VALUES(10, 'John', 'Male', '01-JAN-15', 8800, 'London')

--select*from Employee

--1. Display all the employees whose name starts with “m” and 4 th character is “h”
SELECT Ename FROM Employee WHERE Ename like 'm__h%'

--2 Find the value of 3 raised to 5. Label the column as output
SELECT POWER(3,5) AS Power

--3 Write a query to subtract 20 days from the current date
select getdate()-20

--4 Write a query to display name of employees whose name starts with “j” and contains “n” in their name
select Ename from Employee where Ename like 'j%n%'

--5. Display 2nd to 9th character of the given string “SQL Programming”.
select SUBSTRING('SQL Programming',2,9)
--6. Display name of the employees whose city name ends with “ney” &contains six character.
select Ename from Employee WHERE city like'___ney'
----7. Write a query to convert value 15 to string.
select CONVERT(varchar(20),15)
--8. Add department column with varchar (20) to Employee table.
alter table Employee add department varchar(20)
--9. Set the value of department to Marketing who belongs to London city.
update Employee 
SET department='Marketing'
where city= 'London' 
--10. Display all the employees whose name ends with either “n” or “y”.
select Ename from Employee where Ename like '%n' or Ename like '%y'
--11. Find smallest integer value that is greater than or equal to 63.1, 63.8 and -63.2.
select CEILING(63.1)
select CEILING(63.8)
select CEILING(-63.2)
--12. Display all employees whose joining date is not available.
select *  from Employee where Joiningdate is null
--13. Display name of the employees in capital letters and city in small letters.
select upper(Ename),lower(city) from Employee
--14. Change the data type of Ename from varchar (30) to char (30).
alter table Employee alter column Ename char(30)
--15. Display city wise maximum salary.
select city,max(salary) as maxsalry from Employee group by city
--16. Produce output like <Ename> works at <city> and earns <salary> (In single column).
select Ename+'work'+city +'earns'+cast (salary as varchar(30)) from Employee
--17. Find total number of employees whose salary is more than 5000.
SELECT COUNT(Ename) from Employee WHERE SALARY>5000
--18. Write a query to display first 4 & last 3 characters of all the employees.
SELECT LEFT(Ename,4) ,RIGHT(Ename,3) from Employee
--19. List the city having total salaries more than 15000 and employees joined after 1st January, 2014.
select city from Employee
where Joiningdate>'2014-01-01'
group by city 
having sum(salary)>15000
--20. Write a query to replace “u” with “oo” in Ename.
select REPLACE(Ename ,'u','oo') from Employee
--21. Display city with average salaries and total number of employees belongs to each city.
select avg(salary),count(Ename) from Employee group by city
--22. Display total salaries paid to female employees.
select sum(salary) from Employee where Gender ='female'
--23. Display name of the employees and their experience in years.
select Ename,datediff(YEAR,joiningdate,GETDATE()) from Employee
--24. Remove column department from employee table.
alter table Employee drop column department
--25. Update the value of city from syndey to null.
update Employee set city = null 
--26. Retrieve all Employee name, Salary & Joining date.
select Ename,salary,joiningdate from Employee
--27. Find out combine length of Ename & Gender.
select len(Ename),len(Gender) from Employee
--28. Find the difference between highest & lowest salary.
select max(salary)-min(salary) as salaryDiffrance from Employee
--29. Rename a column from Ename to FirstName.
sp_rename 'Employee.Ename','Firstname'
select * from EmpMaster
--30. Rename a table from Employee to EmpMaster.sp_rename 'Employee','EmpMaster'