-- day 20

use sprk_weekdays;

select * from employee;
desc employee;
show index from employee;
desc employee;
alter table employee
add email varchar(50) unique after dept_name;

desc employee;

show index from employee;

explain
select * from employee
where emp_id = 23;
explain analyze
select * from employee
where emp_id = 23;

select * from employee
where dept_name = "IT";

explain select * from employee
where dept_name = "IT";
explain analyze select * from employee
where dept_name = "IT";


create index idx1 on employee(dept_name,dob);
create index idx1 on employee(dept_name);

select * from employee
where dept_name = "IT";

explain select * from employee
where dept_name = "IT";
explain analyze select * from employee
where dept_name = "IT";


create unique index idx2 on employee(name);

show index from employee;
drop index idx2 on employee;

drop index idx1 on employee;
drop index email on employee;

show index from employee;
alter table employee
modify emp_id int;
desc employee;

drop index `PRIMARY` on employee;

desc employee;
show index from employee;

select * from employee;

insert into employee values
(20,"Rohan Updadhyay","IT",null,"1999-11-26",2500);

select * from employee
where emp_id = 20;

desc employee;
alter table employee
drop email;
desc employee;

alter table employee
add constraint primary key (emp_id) ;

select * from employee;

alter table employee
modify emp_id int auto_increment;
desc employee;

explain select * from employee where emp_id = 20;
explain select * from employee where name = "Pranjal Sharma" ;
explain analyze select * from employee where salary = 3500;
explain analyze select * from employee where dept_name = "IT";

-- Exception Handling
show tables;
delimiter $
drop procedure if exists get_all $
create procedure get_all()
begin
	declare exit handler for 1146 
    select "Table not Found" as errorMessage;

	select * from employee;
	select * from customers;
	select * from ordrs;
	select * from order_items;
	select * from products;
    
end $
delimiter ;

call get_all();

delimiter $
drop procedure if exists get_all $
create procedure get_all()
begin
	declare continue handler for 1146 
    select "Table not Found" as errorMessage;

	select * from demo;
	select * from employee;
	select * from customers;
	select * from ordrs;
	select * from order_items;
	select * from products;
    
end $
delimiter ;

call get_all();
