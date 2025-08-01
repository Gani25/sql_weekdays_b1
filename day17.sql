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


select * from order_items;
select * from orders;
