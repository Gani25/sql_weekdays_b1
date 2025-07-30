-- day 15 stored procedure
/*
Syntax Of Procedure
without parameters
(in, out, inout)
delimiter $
create procedure proc_name()
begin 
	sql stmnt 1;
	sql stmnt 2;
end $
delimiter ;
*/

use sprk_weekdays;
drop view category_revenue;
drop view emp_info;
drop view emp_info_it;
drop view emp_info_it_with_a;

show tables;

delimiter $

create procedure show_cust_and_ord()
begin	
	select * from orders;
	select * from customers;
end $
delimiter ;

call show_cust_and_ord();

-- Procedure with in parameters
-- Give customer number and get list of product 
-- he purchased

select * from customers where customer_id = 1;
select * from products;
select * from orders  where customer_id = 1;
select * from order_items;

SELECT 
    c.customer_id,
    c.name,
    city,
    p.product_id,
    p.name,
    category,
    price,
    quantity,
    order_date,
    status
FROM
    customers c
        JOIN
    orders o ON c.customer_id = o.customer_id
        JOIN
    order_items o_it ON o.order_id = o_it.order_id
        JOIN
    products p ON o_it.product_id = p.product_id
WHERE
    c.customer_id = 4;

-- Convert above query into procedure

delimiter $

create procedure cust_info(cust_id int)
begin
	SELECT 
		c.customer_id,
		c.name,
		city,
		p.product_id,
		p.name,
		category,
		price,
		quantity,
		order_date,
		status
	FROM
		customers c
			JOIN
		orders o ON c.customer_id = o.customer_id
			JOIN
		order_items o_it ON o.order_id = o_it.order_id
			JOIN
		products p ON o_it.product_id = p.product_id
	WHERE
		c.customer_id = cust_id;
end $

delimiter ;

call cust_info(10);


-- task
-- find customer details along with product info based on
-- customerNumber
use classicmodels;

show tables; 
select * from customers;
select * from orders;
select * from orderdetails;
select * from products;