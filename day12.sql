-- day 12
-- SUBQUERIES -> Nested Queries

use sprk_weekdays;
drop table if exists employee ;

create table employee
(
	emp_id int primary key auto_increment,
    name varchar(50) not null,
    dept_name varchar(80) not null,
    dob date not null,
	salary decimal(10,2)
);

insert into employee(name,dept_name, dob, salary) values
("Rohit Raj","Sales","1995-11-25",3500),
("Rohit Gupta","IT","1999-02-22",5500),
("Nikhil Sharma","Sales","2004-05-02",1200),
("Suyash Yadav","HR","1985-04-20",5600),
("Ayush Shinde","Sales","1998-05-22",3500),
("Rohan Deshmukh","Sales","1997-04-18",3000),
("Pranjal Raibole","HR","1997-10-10",5000),
("Prakash Jha","Admin","2005-10-15",800),
("Kavita Suryavanshi","Sales","1988-12-10",3600),
("Abdul Memon","IT","1999-12-10",1200),
("Shruti Shinde","IT","2001-05-15",1900),
("Mayuri Revande","IT","1995-02-25",2600);

select * from employee;
select distinct dept_name from employee;

-- FIND ALL EMPLOYEES WHO EARNS HIGHEST SALARY IN COMPANY
-- Step 1: Calculate max salary
select max(salary) from employee;
-- Step 2: Find employee with max salary
-- MAX 5600.00
select * from employee where salary = 5600.00;

insert into employee(name,dept_name, dob, salary) values
("Shubham Deshmukh","IT","1999-10-20",6000);

-- Step 1: Calculate max salary
select max(salary) from employee;
-- Step 2: Find employee with max salary
-- MAX 6000.00
select * from employee where salary = 6000.00;

/*-----------------------------------------*/
-- Single Row Subquery (when inner query returns only one row)
/*-----------------------------------------*/
-- First Highest Salary
select * from employee 
where salary =(select max(salary) from employee);

select * from employee 
where salary =(select min(salary) from employee);


/*FIND ALL EMPLOYEES WHO EARNS LESS THAN AVERAGE SALARY*/

select * from employee 
where salary < (select avg(salary) from employee) ;

-- FIND BOTH EMPLOYEES WHO EARNS HIGHEST AND LOWEST IN COMPANY
select max(salary) from employee
union
select min(salary) from employee;

select * from employee where salary in (6000, 800);
select * from employee 
where salary in 
(
select max(salary) from employee
union
select min(salary) from employee
);

select * from employee 
where salary in 
(
(select max(salary) from employee),
(select min(salary) from employee)
);

-- FIND ALL EMPLOYEES WHO EARNS HIGHEST SALARY IN THEIR DEPARTMENT
-- Find max according to department
select dept_name, max(salary) from employee
group by dept_name;

/*
Sales	3600.00
IT	6000.00
HR	5600.00
Admin	800.00
*/

select * from employee
where dept_name = "Sales" and salary = 3600;
insert into employee(name,dept_name, dob, salary) values 
("Shruti Shinde","IT", "1988-10-25",3600),
("Pratik Mhatre","HR", "1995-08-20",3600),
("Vipul Deshmukh","Admin", "1995-08-20",5600);

select max(salary) from employee
group by dept_name;
/*
3600.00
6000.00
5600.00
5600.00
*/

select * from employee;

select * from employee
where  salary in 
(select max(salary) from employee
group by dept_name);


select * from employee
where (dept_name, salary) in 
(select dept_name, max(salary) from employee
group by dept_name);

use classicmodels;
select * from customers;
select * from orders;
select * from orderdetails;
select * from products;

-- S12_1099, S10_1678, S12_4473 
-- FIND ALL CUSTOMERS INFO WHO BOUGHT ANY OF THE ABOVE PRODUCT

select * from orderdetails 
where productCode in ("S12_1099", "S10_1678", "S12_4473");

select * from customers
where customerNumber in 
(
	select customerNumber from orders 
    where orderNumber in
    (
		select orderNumber from orderDetails
        where productCode in ("S12_1099", "S10_1678", "S12_4473")
	)
);

select * from customers
where customerNumber in 
(
	select customerNumber from orders 
    where orderNumber in
    (
		select orderNumber from orderDetails
        where productCode = "S10_1678"
	)
);
-- = any same as in

select * from customers
where customerNumber =any
(
	select customerNumber from orders 
    where orderNumber =any
    (
		select orderNumber from orderDetails
        where productCode = "S10_1678"
	)
);