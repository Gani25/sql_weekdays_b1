-- day 13

use sprk_weekdays;

select * from employee;

-- Calculate Age
select *,timestampdiff(year, dob, now()) age from employee;

select *,year(now())- year(dob) age from employee;


select *,timestampdiff(year, dob, now()) age from employee;

-- Find all employees whose age is between 30 to 40
select *,timestampdiff(year, dob, now()) age from employee
having age between 30 and 40;

-- subquery in from clause

select * from 
(select *,timestampdiff(year, dob, now()) age 
from employee) emp_with_age
where age between 30 and 40;

-- find all employee who earns more than average 
-- salary in company
select * from employee
where salary > (select avg(salary) from employee);

-- Correlated Subquery
-- Find All Employees who earns more than average 
-- salary in their department
select dept_name, avg(salary) from employee
group by dept_name;


select * from employee;
select avg(salary) from employee e2
where e2.dept_name = "Sales";

select * from employee e1
where salary >
	(
		select avg(salary) from employee e2
        where e2.dept_name = e1.dept_name
	);

explain analyze
select * from employee e1
where salary >
	(
		select avg(salary) from employee e2
        where e2.dept_name = e1.dept_name
	);


-- Corelated Subquery
-- Subquery in select statement as a column
use classicmodels;
select * from customers;
select customerNumber, customerName,
concat_ws(" ", contactFirstName, contactLastName) contactName
 from customers;
select * from orders;
select * from orderdetails;
select count(*) from orders
where customerNumber = 319;


select customerNumber, customerName,
concat_ws(" ", contactFirstName, contactLastName) contactName,
	(
		select count(*) 
		from orders o 
		where o.customerNumber = c.customerNumber
	) order_count
 from customers c;
 
-- Find customer with 0 orders

select * from
(
	select customerNumber, customerName,
	concat_ws(" ", contactFirstName, contactLastName) contactName,
		(
			select count(*) 
			from orders o 
			where o.customerNumber = c.customerNumber
		) order_count
	 from customers c
) cust_order_count
where order_count =0;

use sprk_weekdays;

-- Find Employee who earns second highest salary
select * from employee;
select * from employee
order by salary desc;
select * from employee
order by salary desc
limit 2 offset 1;

-- Subquery
select max(salary) from employee; #highest
select max(salary) from employee
where salary < (select max(salary) from employee); #2nd highest


select * from employee
where salary = (
	select max(salary) from employee
	where salary < (select max(salary) from employee)
);
