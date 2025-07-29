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
