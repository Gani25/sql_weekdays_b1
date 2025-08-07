use sprk_weekdays;

select * from employee;

-- group by
select max(salary) from employee;
select dept_name, max(salary) from employee; -- error
select dept_name, max(salary) from employee
group by dept_name;

-- window functions
-- Aggregate (sum, min, max, count avg)
select *, max(salary) over(order by salary desc) max_sal
from employee;


select *, max(salary) over() max_sal
from employee;

select *, max(salary) over(partition by dept_name) max_sal_dept
from employee;

select *, count(*) over(partition by dept_name) max_sal_dept
from employee;

-- RANKING (row_num(), rank, dense_rank, percent_Rank, ntile)
select row_number() over() as sr_no, name,dept_name, dob, salary
from employee; 

select row_number() over(order by salary desc) as sr_no, name,dept_name, dob, salary
from employee; 
select row_number() over(order by dob asc) as sr_no, name,dept_name, dob, salary
from employee; 

select row_number() over(partition by dept_name order by dob asc) as sr_no, 
name,dept_name, dob, salary
from employee; 

-- rank()
select *, rank() over(order by salary desc) as sal_rank
from employee; 
select *, rank() over(partition by dept_name order by salary desc) as sal_rank
from employee; 

select *, dense_rank() over(order by salary desc) as sal_rank
from employee; 
select *, dense_rank() over(order by salary desc) as sal_rank
from employee
having sal_rank <= 5; -- ERROR

-- CTE common Table Expression (temp table)
with emp_rank as
(select *, dense_rank() over(order by salary desc) as sal_rank
from employee)
select * from emp_rank
where sal_rank <=5;

with emp_rank as
(select *, dense_rank() over(order by salary desc) as sal_rank
from employee)
select * from emp_rank
where sal_rank =3;

select * from
(select *, dense_rank() over(order by salary desc) as sal_rank
from employee) emp_rank
where sal_rank =3;