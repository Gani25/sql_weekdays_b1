-- day 22

-- WINDOW FUNCTIONS
use sprk_morning;

show tables;

select * from employee;
select * from department;

-- Find Highest Salary along with employee Info in each department

select max(salary), dept_id from employee
group by dept_id;

-- Window Function (Aggregate Function)
/*
1. sum
2. min
3. max
4. avg
5. count
*/
select *, max(salary) over(partition by dept_id) as max_sal_dept
from employee;

select *, sum(salary) over(partition by dept_id) as total_sal_dept
from employee;

-- joins

select * from department;
select e.*, dept_name, location, 
sum(salary) over(partition by dept_id) as total_sal_dept
from employee e
join department d on e.dept_id = d.dept_id;

select e.*, dept_name, location, 
count(*) over(partition by dept_id) as total_employees_in_dept
from employee e
join department d on e.dept_id = d.dept_id;

/*
Ranking Functions
1. rank
2. dense_rank
3. row_number
4. cume_dist
5. ntile
*/

select * from employee;

-- row_number

select  row_number() over (order by emp_id) as sr_no, emp_id,
emp_name, phone, salary, date_of_birth,
date_of_joining, dept_id from employee;

-- based on salary highest to lowest
select  row_number() over (order by salary desc) as sr_no, emp_id ,
emp_name, phone, salary, date_of_birth,
date_of_joining, dept_id from employee;
