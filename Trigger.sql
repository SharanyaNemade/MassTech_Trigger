create database Triggers;


use Triggers;


CREATE TABLE Employee
(
    EmpId INT IDENTITY PRIMARY KEY,
    EmpName VARCHAR(100) NOT NULL
);




create trigger emp_InsertTrigger
on Employee
after insert 
as begin
	print 'Employee saved successfully';
end





insert into Employee
values('Sam');





CREATE TABLE Employee_Logs
(
    EmpId INT IDENTITY,
    EmpName VARCHAR(100) NOT NULL,
	created_at varchar(100),		--logs
	created_by varchar(100),	    --logs
);


--INSERT INTO Employee (EmpName)
--VALUES ('Rahul'), ('Priya'), ('Amit'), ('Sneha');


select * from Employee_Logs;


EXEC sp_rename 'Employee', 'Employee_Logs';


create trigger save_EmpTrigger
on Employee
after insert
as begin
	insert into Employee_Logs select EmpName, GETDATE(),'Admin' from inserted;
END


insert into Employee
values('Sabhya');


select * from Employee_Logs;

select * from Employee;
