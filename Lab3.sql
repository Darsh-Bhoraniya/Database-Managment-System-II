select * from Person
--1. Find all persons with their department name & code.

select Person.personName,
		Department.DepartmentName,
		Department.DepartmentCode
from Person inner join Department 
on Person.DepartmentID = Department.DepartmentId

--2. Give department wise maximum & minimum salary with department name

select	max(Person.Salary) "Max Salary" ,min(Person.Salary) as MinSalary,
		Department.DepartmentName
from	Person inner join Department 
on		Person.DepartmentID = Department.DepartmentId
group by Department.DepartmentName

--3. Find all departments whose total salary is exceeding 100000.

select	sum(Person.salary),Department.
		DepartmentName
from Person inner join Department
on  Person.DepartmentID = Department.DepartmentId
group by Department.DepartmentName
having sum(Person.salary)>100000

--4. Retrieve person name, salary & department name who belongs to Jamnagar city.

select	Person.personName,
		Person.Salary,
		Department.DepartmentName
from Person inner join	Department
on  Person.DepartmentID = Department.DepartmentId
where Person.City='jamanagr'
--here speling mistake for only one record right is two recortd show

--5. Find all persons who does not belongs to any department.

select	Person.personName
from	Person left outer join	Department
on  Person.DepartmentID = Department.DepartmentId
where Department.DepartmentId is null

--6. Find department wise person counts.

select Department.DepartmentName,
		   count(Person.personName)
	from Person INNER JOIN Department
	on Person.DepartmentID=Department.DepartmentId
	group by Department.DepartmentName

--7. Find average salary of person who belongs to Ahmedabad city.
SELECT AVG(PERSON.SALARY)
	FROM PERSON LEFT OUTER JOIN DEPARTMENT
	ON Person.DepartmentID=Department.DepartmentId
	WHERE PERSON.CITY='AHMEDABAD'
--8. Produce Output Like: <PersonName> earns <Salary> from department <DepartmentName> monthly.
--(In single column)

select (Person.personName) +' Earns '+cast(Person.Salary as varchar)+' From Department '+ Department.DepartmentName
from Person INNER JOIN Department 
on Person.DepartmentID=Department.DepartmentId

--9. List all departments who have no persons.

select Department.DepartmentName,person.personName
from Person full outer join Department
on Person.DepartmentID=Department.DepartmentId
where Department.DepartmentID is null

--10. Find city & department wise total, average & maximum salaries.

select person.City,avg(Person.Salary),max(person.Salary),sum(Person.Salary)
from Person 
group by Person.City

select avg(Person.Salary) as avgsalary,max(person.Salary) as maxsalary,sum(Person.Salary) as totalsalry
from Person inner join Department
on Person.DepartmentID=Department.DepartmentId
group by Department.DepartmentName




--11. Display Unique city names.

select distinct city from Person

--12. List out department names in which more than two persons.

select Department.DepartmentName,
		   count(Person.PersonID)
	from Person INNER JOIN Department
	on Person.DepartmentID=Department.DepartmentId
	group by Department.DepartmentName
	having count(Person.PersonID)>2
--13. Combine person name’s first three characters with city name’s last three characters in single column.

select left(personname,3)+right(city,3) from person

--14. Give 10% increment in Computer department employee’s salary.

select * from person
update person set salary = salary + salary*.1
where departmentid = (select departmentid from department where departmentname = 'computer')

--15. Display all the person name’s who’s joining dates difference with current date is more than 365 days.

select Person.personName FROM Person
where (GETDATE()-joiningdate)>365
