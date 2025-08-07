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

select *, percent_rank() over(partition by dept_name order by salary) * 100 as sal_rank
from employee;

-- value function lead, lag, nthvalue, first, last

create table train_timetable
(
	t_id int,
	train_time time,
    station varchar(50)
);

insert into train_timetable
values 
(101,"08:10:00","CST"),
(102,"09:15:00","Panvel"),
(101,"08:30:00","Dadar"),
(103,"10:15:00","Virar"),
(102,"09:45:00","Vashi"),
(102,"09:30:00","Belapur"),
(101,"08:18:00","Byculla"),
(103,"10:30:00","Malad"),
(102,"10:15:00","Wadala"),
(102,"10:35:00","CST"),
(101,"08:50:00","Thane"),
(101,"09:25:00","Kalyan"),
(103,"10:50:00","Bandra"),
(103,"11:25:00","Churchgate");

select * from train_timetable;
select *, ifnull(lead(station,1) over(partition by t_id),"train ends" )nxt_station 
from train_timetable;
select *, ifnull(lead(station,2) over(partition by t_id order by train_time ),"train ends" )nxt_station 
from train_timetable;

select *, ifnull(lead(station,1) over(partition by t_id order by train_time ),
"train ends" )nxt_station,
ifnull(lag(station,1) over(partition by t_id order by train_time ),
"train starts" )prev_station
from train_timetable;

select *, last_value(station) over(partition by t_id) last_station 
from train_timetable;

select *, nth_value(station,2) over(partition by t_id order by train_time)  
from train_timetable;