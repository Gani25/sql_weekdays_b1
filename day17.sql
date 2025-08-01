-- day 17
-- Functions return Varchar(text)
use sprk_weekdays;

select * from customers;

delimiter $

create function getName(cust_id int)
returns varchar(50)
deterministic
begin
	-- create variable 
	declare cust_name varchar(50);
    select name into cust_name 
    from customers
    where customer_id = cust_id;

	return cust_name;
end $
delimiter ;

select getName(100);
select getName(1000);

select * from orders;
select order_id, customer_id, getName(customer_id) as name, status from orders;

show tables;
select * from order_items;


select o.order_id, customer_id, getName(customer_id) as name, status,
o_it.* 
from orders o
join order_items o_it
on o. order_id = o_it.order_id;

select * from products;
delimiter $

create function get_prod_name(prod_id int)
returns varchar(50)
deterministic
begin
	-- create variable 
	declare prod_name varchar(50);
    select name into prod_name 
    from products
    where product_id = prod_id;

	return prod_name;
end $
delimiter ;

select o.order_id, customer_id, getName(customer_id) as name, status,
o_it.*, get_prod_name(product_id) as product_name
from orders o
join order_items o_it
on o. order_id = o_it.order_id;


select * from order_items
where order_id = 1004;
select * from orders;

delimiter $
drop function if exists count_products $

create function count_products(ord_id int)
returns int 
deterministic
begin
	declare prod_count int;
    select count(*) into prod_count from order_items
    where order_id = ord_id;
    
    return prod_count;
end $
delimiter ;

select count_products(1004);
select *, count_products(order_id) product_count from orders;


-- Group concat
select * from products;
select distinct category from products;
select category, count(*) prod_count, name
 from products
group by category; -- ERROR / Bad Data
select category, count(*) prod_count, group_concat(name separator ", ") as product_names
 from products
group by category;

use sakila;

show tables;
select * from film_actor ;
select * from actor;
select * from film;

select film_id,
group_concat(concat_ws(" ", a.first_name, a.last_name) separator ", ") 
actor_names
from actor a
join film_actor fa on a.actor_id = fa.actor_id
group by film_id;

select fa.film_id, title,
group_concat(concat_ws(" ", a.first_name, a.last_name) separator ", ") 
actor_names
from actor a
join film_actor fa on a.actor_id = fa.actor_id
join film f on fa.film_id = f.film_id
group by fa.film_id;
