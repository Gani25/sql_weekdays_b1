-- day 16
use sprk_weekdays;

-- stored procedure inout
-- out concept of variable @var_name
select * from customers;
select count(*) from orders
where customer_id = 100;

-- find frequency(int) of order based on customer_id(int)
delimiter $

create procedure count_by_id(
	inout data int 
)
begin
	select count(*) into data from orders
	where customer_id = data;
end $
delimiter ;

-- whenever we have out we have to pass variable

set @data_var = 100;
select @data_var;
call count_by_id(@data_var);
select @data_var;

set @data_var = 97;
select @data_var;
call count_by_id(@data_var);
select @data_var;

-- create a procedure which is used to insert values
show tables;
select * from employee;
desc employee;
delimiter $
drop procedure if exists insert_emp $
create procedure insert_emp
(
	emp_name varchar(100),
    department varchar(100),
    date_of_birth date,
    salary decimal(10,2)
)
begin
	insert into employee(name, dept_name, dob, salary) 
    values
    (emp_name, department, date_of_birth, salary);
    
    select * from employee
    where emp_id = last_insert_id();
end $
delimiter ;

call insert_emp("Rohit Gupta","Sales","1988-05-25",3000);

select last_insert_id();


call insert_emp("Ashutosh Sharma","IT","1998-01-20",4500);
