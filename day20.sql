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
select * from employee;

create index idx1 on employee(dept_name,dob);
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