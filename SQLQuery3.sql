create trigger tr_insert_department
on Department
for insert
as
begin
	declare @departmentid int
	select @departmentid=departmentid from inserted
	
	insert into log
	values	('record with departmentid	'+CAST(@departmentid as varchar)+'is inserted on '+
	CAST(getdate() as varchar(50)))
end 

insert into Department values('6','ec','ec','e-block')
insert into Department values('7','ce','ce','c-block')

select * from log
-----------------------------------------------------------
create trigger tr_update_department
on Department
for update
as
begin
	declare @departmentid int
	select @departmentid=departmentid from inserted
	
	insert into log
	values	('record with departmentid	'+CAST(@departmentid as varchar)+'is update on '+
	CAST(getdate() as varchar(50)))

end
select * from log

update Department set Departmentname ='ce'where departmentid='6'