-- day 14

-- Q4. Which product category generated the highest revenue?

use sprk_weekdays;

select * from products;
select * from order_items WHERE PRODUCT_ID = 5;

select p.category, SUM(p.price * od_it.quantity) as revenue
from order_items od_it
inner join products p
group by p.category
order by revenue desc;

select p.category, 
concat(round(SUM(p.price * od_it.quantity)/1000000,2),"mn")
as revenue
from order_items od_it
inner join products p
group by p.category
order by revenue desc;


create view category_revenue as
select p.category, 
concat(round(SUM(p.price * od_it.quantity)/1000000,2),"mn")
as revenue
from order_items od_it
inner join products p
group by p.category
order by revenue desc;

select * from category_revenue;

-- Example of modification and tables and that will 
-- be reflected in views

select distinct category from products;
-- Medicine
select * from products;
insert into products values
(51,"Ondem 3d","Medicine",55),
(52,"Iodex","Medicine",155);

select * from orders;
select * from customers;
insert into orders values(1301,100,now(),"Pending");
select * from order_items;
insert into order_items 
values
(772,1301,52,1000),
(772,1301,51,15000);

select * from category_revenue;


-- Views More Examples
-- Abstraction (hiding things)
show tables;
select * from employee;

create view emp_info as
select emp_id, name, dept_name, dob
from employee;

select * from emp_info;

-- mysql supported nested views

create view emp_info_it as
select * from emp_info
where dept_name = "IT";

select * from emp_info_it;

create view emp_info_it_with_a
as
select * from emp_info_it 
where name like "%a%";
select * from emp_info_it_with_a;

select * from employee
where name like "%a%" and 
dept_name = "IT";

select * from emp_info;
-- VIEW Supports DML(Insert, Update, Delete) Operations 
update emp_info
set name = "Abdul Gani Memon"
where emp_id = 10;

select * from emp_info;
select * from employee;