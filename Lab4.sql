use Worker_Info

--• Stored Procedures
--1. All tables Insert, Update & Delete
	--Insert departent table
		create procedure pr_department_insert
		@departmentId		int,
		@departmentName		varchar(100)
		as
		begin
		insert into	Department(
		departmentId,
		departmentName
		)
		values(
		@departmentId,	
		@departmentName
		)
		end
		exec pr_department_insert 1,'Admin'
		exec pr_department_insert 2,'IT'
		exec pr_department_insert 3,'HR'
		exec pr_department_insert 4,'account'

		select * from Department
		
	--Insert designation table
		create procedure pr_designation_insert
		@designatioId			int,
		@designationName		varchar(100)
		as
		begin
		insert into	designation(
		DesignationID,	
		designationName)
		values(
		@DesignationID,	
		@designationName
		)
		end
		exec pr_designation_insert 11,'JOBBER'
		exec pr_designation_insert 12,'WELDER'
		exec pr_designation_insert 13,'CLERK'
		exec pr_designation_insert 14,'MANGER'
		exec pr_designation_insert 15,'CEO'

		select * from designation

		--Insert person table
		create procedure pr_person_insert
		@Firstname		varchar(100),
		@Lastname		varchar(100),
		@salary			decimal(8,2),
		@joiningdate	datetime,
		@departmentid	int,
		@designationid	int
		as
		begin
		insert into	person(
		Firstname,
		Lastname,
		salary,
		joiningdate,
		Depatrmentid,
		designationid
		)
		values(
		@Firstname,	
		@Lastname,	
		@salary		,
		@joiningdate,
		@departmentid,
		@designationid

		)
		end
		exec pr_Person_insert 'rahul','anshu',56000,'1990-01-01',1,12
		exec pr_Person_insert 'Hardik','Hinsu',18000,'1990-09-25',2,11
		exec pr_Person_insert 'Bhavin','Kamani',25000,'1991-05-14',Null,11
		exec pr_Person_insert 'Bhoomi ','Patel',39000,'2014-02-20',1,13
		exec pr_Person_insert 'Rohit','Rajgor',17000,'1990-07-23',2,15
		exec pr_Person_insert 'Priya','mehta',25000,'1990-10-18',2,null
		exec pr_Person_insert 'Neha','trivedi',18000,'2014-02-20',3,15

		select * from person
		truncate table person

		--===================================================================
-- upadate


Create proc PR_Department_Update
	@Department int,
	@DepartmentName varchar(100)
	as
	update Department
	set
		DepartmentID = @DepartmentID,
		DepartmentName = @DepartmentName		
	where 
		DepartmentID = @DepartmentID

exec PR_Department_Update 1,admin1
select 
* from department

--2
Create proc PR_Designation2_Update
	@DesignationID int,
	@DesignationName varchar(100)
	as
	begin
	update Designation
	set
		DesignationID =  @DesignationID,
		DesignationName = @DesignationName		
	where 
		DesignationID =  @DesignationID
exec PR_Designation2_Update 11,Jobber1
select * from Designation

--3
Create Proc PR_Person_1_Update
	@WorkerID   int,
	@FirstName	varchar(100),
	@LastName	varchar(100),
	@Salary		decimal(8,2),
	@JoiningDate datetime,
	@DepartmentID int,
	@DesignationID int
	as
	begin
	update Person_1
	set
		FirstName=@FirstName	,
		LastName=@LastName	,
		Salary=@Salary		,
		JoiningDate=@JoiningDate,
		DepartmentID=@DepartmentID,
		DesignationID=@DesignationID
	where WorkerId = @WorkerID
	end
	---------------------delete----------------------------
	--1
	Create Proc PR_Department_delete
	@DepartmentID	 int
	as 
	begin

	delete from Department
	where DepartmentId=@DepartmentID
	end

	exec PR_Department_delete 4
	select * from Department
	--2-------------------
	create procedure PR_Designation_Delete
	@Designationid int
AS
BEGIN
	DELETE FROM Designation
	WHERE DesignationID=@Designationid
END

exec PR_Designation_Delete 14
select * from Designation

--=---------------------------3-----------------
create procedure PR_Person_Delete
@WorkerId int
AS
BEGIN
	DELETE FROM Person
	WHERE WorkerID = @WorkerId
END
exec PR_Person_Delete 107
select * from Person

--2. All tables SelectAll (If foreign key is available than do write join and take columns on select list)


	create procedure Pr_person_Selectall
		as
		begin
		select Person.WorkerID,
		Person.FirstName,
		Person.LastName,
		Person.Salary,
		Person.JoiningDate,
		Department.DepartmentName,
		Designation.DesignationID
		from Person inner join Department
		on Person.Depatrmentid = Department.DepartmentId inner join Designation
		on Person.DesignationID=Designation.DesignationID
		end

		exec Pr_person_Selectall 
--3. All tables SelectPK
	create procedure PR_Person_SelectByPK
	@WorkerID int
AS
BEGIN
	SELECT * FROM Person
	WHERE WorkerID = @WorkerID
END
execute PR_Person_SelectByPK 104


------------------------------2
create procedure PR_Department_SelectByPK
@DepartmentId int
AS
BEGIN
	SELECT * FROM Department
	WHERE DepartmentId = @DepartmentId
END

execute PR_Department_SelectByPK 2
-------------3
	create proc PR_designation_selectbypk
	@designationid  int 

as
begin
	select * from Designation
	where DesignationID=@designationid
	end

	exec PR_designation_selectbypk 12
--4. Create Procedure that takes Department Name & Designation Name as Input and Returns a 
--	 table with Worker’s First Name, Salary, Joining Date & Department Name.
create procedure PR_selectedtable_personselectbyspecification
	@DepartmentName varchar(100),
	@Desiganationame varchar(100)
	as
	begin
	select Person.FirstName,
		Person.Salary,
		Person.JoiningDate,
		Department.DepartmentName

		from
		Person inner join Department
		on Person.Depatrmentid = Department.DepartmentId inner join Designation
		on Person.DesignationID = Designation.DesignationID
		where DepartmentName=@DepartmentName and
			DesignationName=@Desiganationame
		end
			execute PR_selectedtable_personselectbyspecification IT , ceo

--5. Create Procedure that takes FirstName as an input parameter and displays’ all the details of 
--the worker with their department & designation name.
create procedure Pr__partucularname
@FirstName varchar(100)
		as
		begin
		select Person.WorkerID,
		Person.FirstName,
		Person.LastName,
		Person.Salary,
		Person.JoiningDate,
		Department.DepartmentName,
		Designation.DesignationID
		from Person inner join Department
		on Person.Depatrmentid = Department.DepartmentId inner join Designation
		on Person.DesignationID=Designation.DesignationID
		where FirstName=@FirstName
		end
		exec Pr__partucularname 'Neha'


--6. Create Procedure which displays department wise maximum, minimum & total salaries.
create procedure PR_depart
as
begin
select  Department.DepartmentName,MAX(Person.Salary) as maxium,min(Person.Salary)as minimum,sum(Person.Salary) as total
from Person left outer join Department
on Person.Depatrmentid = Department.DepartmentId
group by Department.DepartmentName 
end
EXECUTE	PR_depart











--Views
--1. Create a view that display first 100 workers details.
create view pr_Displaydetails
as

select top 100* from Person
select * from pr_Displaydetails

--2. Create a view that displays designation wise maximum, minimum & total salaries.
create view VW_Designationwise
as
select Designation.DesignationName, MAX(Person.Salary) as maxium,min(Person.Salary)as minimum,sum(Person.Salary) as total
from Person right outer join Designation
on Person.DesignationID=Designation.DesignationID
group by Designation.DesignationName

select * from VW_Designationwise
--3. Create a view that displays Worker’s first name with their salaries & joining date, it also displays 
--duration column which is difference of joining date with respect to current date.
	create view vw_workername_withtheirsalaryanddate
	as 
	select FirstName,JoiningDate,DATEDIFF(YEAR,JoiningDate,GETDATE()) AS workingfor 
	from Person
	select * from vw_workername_withtheirsalaryanddate

--4. Create a view which shows department & designation wise total number of workers.
create view vw_totaldeptdesignation
as
select DepartmentID,DesignationID,COUNT(WorkerID) from Person
group by DepartmentID or DesignationID
--5. Create a view that displays worker names who don’t have either in any department or 
--designation.
	alter view VW_DEPT_DESIGNATION
	as
	select * from Person
	where Depatrmentid is null
	or Designationid is null
	
	select *from VW_DEPT_DESIGNATION
---------------------------------------------------------------
--User Define Function
--1. Create a table valued function which accepts DepartmentID as 
--a parameter & returns a worker table based on DepartmentID.
create function fn_deptid(@id int)
returns table
as 
return(
select * from Person
where Depatrmentid=@id
)
select * from fn_deptid(2)
--2. Create a table valued function which returns a table with
--unique city names from worker table.
--3. Create a scalar valued function which accepts two 
--parameters start date & end date, and returns a date difference in days.
ALTER function fn_ddiffrance
(
@d1 datetime,
@d2 datetime
)
returns varchar(100)
as
begin
	return (select convert (varchar(100),datediff(YEAR,@d1,@d2)));
end
select dbo.fn_ddiffrance('2009-03-18','2022-03-18')
--4. Create a scalar valued function which accepts two 
--parameters year in integer & month in integer and returns total days in passed month & year.
create function Fn_Diffrance(
@year int,
@month int
)
returns int
as
begin
return (day(eomonth(cast((cast(@year as varchar(4))+'-'+cast(@month as varchar(2))+'-01')as datetime))))
end
select dbo.Fn_Diffrance(2004,12)
--5. Create a scalar valued function which accepts 
--two parameters year in integer & month in integer and returns first date in passed month & year.