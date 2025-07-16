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
