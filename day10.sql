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

-- Maths Functions
select round(5.22286), round(5.22286,2);
select ceil(5.22286), ceil(-5.22286);
select floor(5.22286), floor(-5.22286);
select pow(5,3);
select abs(-5);
select pi();
select rand();
select sqrt(9);

select now(), current_timestamp();

select adddate(now(), interval 10 day);
select adddate(now(), interval 1 month);
select adddate(now(), interval 1 year);
select adddate(now(), interval -1 year);
select adddate("2025-01-31", interval 1 month);
select addtime("2025-01-31 10:15:20", "4:00:00");

select now(), date(now());

select date_format(now(),"%d-%m-%Y %h:%i:%s %p");
select date_format(now(),"%d-%m-%Y %r");

select day(now());
select dayname(now());
select monthname(now());
select dayofmonth(now());
select dayofweek(now());
select dayofyear(now());
select last_day(now());

select "1999-11-26", year(now()) - year("1999-11-26") age
