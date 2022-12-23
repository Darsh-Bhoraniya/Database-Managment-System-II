alter trigger tr_msg_inserted
on Employee
after insert
as
begin
	print 'record Is inserted'
	--select * from inserted
end

insert into Employee values (10, 'John', 'Male', '01-JAN-15', 8800, 'London')
select * from Employee


create trigger tr_msg_updated
on employee
after update
as
begin
	print 'record is updated '
	--select * from inserted
end

update Employee set gender='male' where eid=10

