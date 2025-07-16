-- day 9
-- CROSS JOIN / CARTESIAN JOIN -> PRODUCT

use sprk_weekdays;

create table food_items
(
	menu varchar(30),
    price int
);

insert into food_items
values ("Burger",60),("Pizza",150),("Frankie",45),("Sandwich",100);

select * from food_items;

create table extras
(
	toppings_name varchar(30),
    extra_amount int
);
insert into extras values
("Butter",30),("Sada",0),("Butter Cheese",60),("Cheese",40);
select * from food_items;
select * from extras;

select e.toppings_name, fi.menu, fi.price, e.extra_amount,
(fi.price+e.extra_amount) total
from food_items fi 
cross join extras e;

select toppings_name, menu, price, extra_amount,
(price+ extra_amount) total
from food_items fi 
cross join extras e;

-- Combine -> STRING -> concat


select concat(toppings_name," ", menu) food, 
(price+ extra_amount) total
from food_items fi 
cross join extras e
order by menu, total;

/*
Types Of Joins
1. Inner Join
2. Outer Join
	a. Left join
	b. Right join
	c. Full Join
3. Cross Join
4. Self Join
5. Natural Join
6. EQUI / Non equi join
*/

-- self join have only one table
create table employee 
(
	emp_id int primary key auto_increment,
    name varchar(50),
    manager_id int,
    foreign key(manager_id) references employee(emp_id)
);

desc employee;
show create table employee;

insert into employee (name)
values ("Parth Gupta"),("Rohini Jadhav"),("Shreyas Shinde"),
("Ashutosh Verma"),("Memon Abdul"),("Mahesh Murugan"),
("Iyer"),("John Doe"),("Shukla Abhishek");

select * from employee;
update employee set manager_id = 1
where emp_id = 7;

select * from employee;

update employee set manager_id = 4
where emp_id = 9;

update employee set manager_id = 9
where emp_id in (2,5);

update employee set manager_id = 7
where emp_id in (3,6);
update employee set manager_id = 6
where emp_id = 8;

select * from employee e1
inner join employee e2
on e1.manager_id = e2.emp_id;

select e1.emp_id, e1.name emp_name, e2.name manager_name from employee e1
inner join employee e2
on e1.manager_id = e2.emp_id;

show databases;
use classicmodels;

show tables;
select * from employees;

use sprk_weekdays;

select e1.emp_id, e1.name emp_name, 
ifnull(e2.name,"Co-founder") manager_name from employee e1
left join employee e2
on e1.manager_id = e2.emp_id;
