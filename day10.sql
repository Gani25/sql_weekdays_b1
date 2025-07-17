-- day 10

-- FUNCTIONS
-- BUILT IN (STRING)

use sakila;

select concat("SPRK"," ","TECHNOLOGIES"," ","PVT"," ","LTD.") as institute;

show tables;
select * from film;
select concat(title,", ", release_year,", ",description) movies
from film;

select concat_ws(" - ",title, release_year,description) movies
from film;

select actor_id, first_name, last_name,
concat(left(first_name,1), left(last_name,1)) as sign
from actor;

select actor_id, first_name, last_name,
concat(right(first_name,2), right(last_name,1)) as sign
from actor;

select length("ABDUL GANI");
select first_name,length(first_name) from actor;

select "    ABDUL GANI      " name, 
length("    ABDUL GANI      ") size,
ltrim("    ABDUL GANI      "),
length(ltrim("    ABDUL GANI      ")),
rtrim("    ABDUL GANI      "),
length(rtrim("    ABDUL GANI      ")),
trim("    ABDUL GANI      "),
length(trim("    ABDUL GANI      "));

select first_name, reverse(first_name) from actor;

select first_name, replace(first_name,"A","") from actor;
select first_name, replace(first_name,"A","@") from actor;

select upper("aBduL"), ucase("aBdUl");

select "SPRK TECHNOLOGIES", substr("SPRK TECHNOLOGIES",6);
select "SPRK TECHNOLOGIES", substr("SPRK TECHNOLOGIES",12);
select "SPRK TECHNOLOGIES", substr("SPRK TECHNOLOGIES",1,4);
select "SPRK TECHNOLOGIES", substr("SPRK TECHNOLOGIES",6,6);