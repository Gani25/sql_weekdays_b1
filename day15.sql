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


-- in param and out param
use sprk_weekdays;
select * from orders;
select distinct status from orders;

-- Variables: Named container to store data temporary
select @age;
set @age = 30;
select @age;

-- Procedure pass status as input - 
-- and I want numbers of orders(count) in that status

select count(*) from orders
where status = "Returned";

desc orders;


delimiter $
drop procedure if exists count_by_status $

create procedure count_by_status
(
	in order_status text, 
    out order_count int
)
begin
	select count(*) into order_count from orders
	where status = order_status;
end $
delimiter ;

select @ord_count;
call count_by_status("Delivered", @ord_count);


select @ord_count;

call count_by_status("Returned", @ord_count);
select @ord_count;