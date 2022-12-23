--1. Create INSERT, UPDATE & DELETE Stored Procedures for Person table.
create procedure Pr_person_insert
@personid			int,
@personName			varchar(50),
@salary				decimal(8,2),
@joiningdate		datetime,
@city				varchar(50),
@age				int,
@Birthddate			datetime
as
begin
	insert into Person
	values
	(
	@personid,
	@personName,
	@salary	,
	@joiningdate,
	@city	,
	@age	,
	@Birthddate	
	)
end

-----------------UPDATE


create procedure Pr_person_insert
@personid			int,
@personName			varchar(50),
@salary				decimal(8,2),
@joiningdate		datetime,
@city				varchar(50),
@age				int,
@Birthddate			datetime
as
begin
	insert into Person
	values
	(
	personName,
	salary	,
	joiningdate,
	city	,
	age	,
	Birthddate	
	)
end
--2. Create a trigger that fires on INSERT, UPDATE and
--DELETE operation on the Person table. For that, create
--a new table PersonLog to log (enter) all operations performed on the Employee table.

create trigger tr__person_insert
on Person
for insert 
as
begin
	declare @personid int,
			@personname varchar(50)

			select @personid = PersonID from inserted
			select @personname = PersonName from inserted
		insert into Personlog
		values(@personid,@personname ,'insert',CAST(GETDATE() as varchar(100)))
end

insert into Person values(1,'krish',3000,'3-12-2003','surat',30,'28-03-2010')
insert into Person values(3,'chirag',10000,'01-02-2003','rajkot',29,'01-03-2010')

select * from Person
select * from Personlog

--------update
create trigger tr_update
on person
for update
as
begin
	declare @personid int,
			@personname varchar(50)

			select @personid = PersonID from inserted
			select @personname = PersonName from inserted
		insert into Personlog
		values(@personid,@personname ,'update',CAST(GETDATE() as varchar(100)))
end


update Person set PersonName='darsh'
where PersonID=1

select * from Person
select * from Personlog

-------delete
alter trigger tr_delete
on person
for delete
as
begin
	declare @personid int,
			@personname varchar(50)

			select @personid = PersonID from deleted
			select @personname = PersonName from deleted
		insert into Personlog
		values(@personid,@personname ,'delete',CAST(GETDATE() as varchar(100)))
end

delete from Person where PersonID=1
select * from Person
select * from Personlog

--3. Create an INSTEAD OF trigger that fires on INSERT, UPDATE and
--log all operation performed on the Employee table into PersonLog.
--DELETE operation on the Person table. For that, 

create trigger tr_insert_Person
on Person
instead of insert
as
begin
	declare @personid int,
			@personname varchar(50)

			select @personid = PersonID from inserted
			select @personname = PersonName from inserted
		insert into Personlog
		values(@personid,@personname ,'insert',CAST(GETDATE() as varchar(100)))
end

insert into Person values(5,'da',10000,'01-02-2005','delhi',30,'01-05-2004')
select * from Person
select * from[Personlog]


-----update

create trigger tr_UPDATE_PERSONLOG
on Person
instead of update
as
begin
	declare @personid int,
			@personname varchar(50)

			select @personid = PersonID from inserted
			select @personname = PersonName from inserted
		insert into Personlog
		values(@personid,@personname ,'update',CAST(GETDATE() as varchar(100)))
end

update Person set age=35 where PersonID=2
select * from Person
select * from[Personlog]

-------------------------delete 


create trigger tr_delete_PERSONLOG
on Person
instead of delete
as
begin
	declare @personid int,
			@personname varchar(50)

			select @personid = PersonID from deleted
			select @personname = PersonName from deleted
		insert into Personlog
		values(@personid,@personname ,'delete',CAST(GETDATE() as varchar(100)))
end
delete from Person where PersonID=2

select * from Person
select * from Personlog
--4. Create DELETE trigger on PersonLog table, when we 
--delete any record of PersonLog table it prints ‘Record deleted successfully from PersonLog’.

alter trigger tr_msg_plog
on personlog
after delete
as
begin
	print 'record deleted sucessfully'
end

delete from Personlog where PlogID = 3

--5. Create INSERT trigger on person table, which calculates the age and update that age in Person table.
create trigger update_age_for
on person
for insert
as
begin
	declare @age int,
			@personid int,
			@birthdate datetime
			select @age =DATEDIFF(YEAR,GETDATE(),Birthdate) from Person
			select @personid= personID from inserted
			select @birthdate = birthdate from inserted
			update Person
			set age=CONVERT(int,DATEDIFF(year,@birthdate,getdate()))
			where @personid =PersonID
end
select * from Person
select * from Personlog
