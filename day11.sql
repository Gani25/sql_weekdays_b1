-- day 11
select extract(year from now());
select year(now());

select concat("Q",extract(quarter from now()));
select quarter(now());

-- Calculate Age Based on DOB
select timestampdiff(year, "1999-11-26", now()) as age;
select year(now())-year("1999-11-26") as age;

select timestampdiff(year, "1999-11-26", now()) as age,
timestampdiff(month, "1999-11-26", now()) as months;

select concat(timestampdiff(year, "1999-11-26", now())," years ",
timestampdiff(month, "1999-11-26", now()) % 12," months") as age ;


-- union
/*
Union is used to combine resultset of multiple table into single table
Coloumn count in tables should be same 
*/

show databases;
use sprk_weekdays;

select * from my_table_one;
select * from my_table_two;
 
select * from my_table_one
union
select * from my_table_two;

select * from my_table_one
union all
select * from my_table_two;

/*FULL OUTER JOIN = left join + right join*/

select * from my_table_one t1
left join my_table_two t2
on t1.id = t2.id
union
select * from my_table_one t1
right join my_table_two t2
on t1.id = t2.id;

-- UTILIZE ALL JOINS THEORY INTO PRACTICE
use classicmodels;

select * from customers;
select * from employees;
-- 2 table joins
select c.customerNumber, c.customerName, 
concat_ws(" ",c.contactFirstName, c.contactLastName) contactName,
e.employeeNumber,concat_ws(" ",e.firstName, e.lastName) emp_name
from customers c
inner join employees e
on c.salesRepEmployeeNumber = e.employeeNumber;

select c.customerNumber, c.customerName, c.phone, 
concat_ws(" ",c.contactFirstName, c.contactLastName) contactName,
e.employeeNumber,concat_ws(" ",e.firstName, e.lastName) emp_name
from customers c
left join employees e
on salesRepEmployeeNumber = employeeNumber
where employeeNumber is null;

-- 4 Table Join 
select * from customers;
select * from orders;
select * from orderdetails;
select * from products;

select c.customerNumber, customerName, o.orderNumber, quantityOrdered,
p.productCode, productName
from customers c 
inner join orders o on c.customerNumber = o.customerNumber
inner join orderdetails odtl on o.orderNumber = odtl.orderNumber
inner join products p on odtl.productCode = p.productCode;

select c.customerNumber, customerName, o.orderNumber, quantityOrdered,
p.productCode, productName
from customers c 
inner join orders o on c.customerNumber = o.customerNumber
inner join orderdetails odtl on o.orderNumber = odtl.orderNumber
inner join products p on odtl.productCode = p.productCode
where c.customerNumber = 121;