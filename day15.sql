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