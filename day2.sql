use sakila;

show tables;

select * from actor;
select * from rental;

select * from customer;

select customer_id, first_name, last_name 
from customer;

select customer_id, first_name as fname, last_name 
from customer;

# Arithmatic Operator
/*

/ -> Divide
DIV -> Divide
* -> Multiply
% -> Modulus
mod -> Modulus
+ -> Add
- -> Subt
*/

select 11/3 as decimal_division, 
11 div 3 as integer_division,
11%3 as remainder,
11 mod 3 as remainder;

select * from film;

select film_id, rental_rate from film;
# Convert rental_rate into INR
select film_id, rental_rate as USD,
rental_rate*85 as INR_RATE
 from film;
 
# Add tax of 18% to INR

select film_id, rental_rate as USD,
rental_rate*85 as INR_RATE,
rental_rate*85 + 0.18 * rental_rate*85
as INR_RATE_TAX
 from film;

# Relational Operators
/*
> - Greater Than
< - Less Than
>= - Greater Than or Equal To
<= - Less Than or Equal To
= - Equal To
!= / <> - Not Equal To
*/


select * from customer;

-- Find customer whose id is 30
-- where clause -> Filter data
select * from customer
where customer_id = 30;

select * from customer
where store_id = 2;

-- Find all customers whose id is less than 20
select * from customer
where customer_id < 20;
select * from customer
where customer_id <= 20;

select * from customer
where customer_id != 30;
select * from customer
where store_id <> 2;

select * from actor
where first_name = "Penelope";


select * from actor
where first_name != "Penelope";

select * from actor
where first_name > "Penelope";

-- Find actor whose 
-- First Name name is Penelope or ed or Sandra, Woody

-- Logical Operator
/*
or
and -> All TRUE -> Result
not -> Negate -> not True = False
*/
select * from actor
where first_name = "Penelope"
or first_name = "ED" or first_name = "Sandra"
or first_name = "Woody" or first_name = "Mahesh";

-- find all actors whose first name is penelope
-- and their id should be less than 60

select * from actor
where first_name = "Penelope"
and actor_id < 60;

select * from actor
where first_name = "Penelope"
and actor_id > 200;


select * from actor
where not first_name = "Penelope";


select * from actor
where not first_name = "Mahesh";

select * from actor
where 1 = 2;
select * from actor
where not 1 = 2;

-- Find all actors whose id is between 20 to 40
select * from actor
where actor_id >=20 and actor_id <= 40;

-- Find all actors whose id is between 20 to 40
-- as well as 80 to 100

select * from actor
where (actor_id >=20 and actor_id <= 40)
or (actor_id >= 80 and actor_id <= 100);

-- between 
select * from actor
where actor_id between 20 and 40
or actor_id between 80 and 100;

-- in 
select * from actor
where first_name in 
("Penelope","ED","Sandra","Woody");

select * from actor
where first_name in 
("Penelope","ED","Sandra","Woody")
and actor_id <=100;

