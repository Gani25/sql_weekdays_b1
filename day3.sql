/*
Like -> it is used for pattern matching
Wild Card
%
_
*/

use sakila;

select * from actor
where first_name like "%";

select * from actor
where first_name like "P%";
select * from actor
where first_name like "A%";
select * from actor
where first_name like "AU%";

select * from actor
where first_name like "%A";

select * from actor
where first_name like "%A%";

select * from actor
where first_name like "A%E%";

select * from actor
where first_name like "__";

select * from actor
where first_name like "____";

select * from actor
where first_name like "A___";

select * from actor
where first_name like "A__E";
select * from actor
where first_name like "A__E%";


select * from country;
select * from sprk;

select distinct continent from world.country;

-- Order By Default ASC
select * from actor;

-- Single Level SOrting
select * from actor
order by first_name;

select * from actor
order by first_name desc;

-- Multi level sort
select * from actor
order by first_name, actor_id desc;

-- Aggregate Functions -> Scalar Fn
/*
1. sum()
2. min()
3. max()
4. count()
5. avg()
*/

use world;

select sum(population) as total_population
from country;

select max(population) as highest_population
from country;

select * from country
where population = 1277558000;

select min(population) as highest_population
from country;

select * from country
where population = 0;

select count(name) as num_of_rows
from country;
select * from country;
select count(indepyear) as num_of_rows
from country;

select count(*) as num_of_rows
from country;

select avg(population), sum(population)/count(*)
 from country;
 
select *, sum(population) from country; -- Invalid use of group by clause

select * from country
where continent = "Africa";

select count(*), sum(population) from country
where continent = "Africa";

select continent, count(*) as total_countries
,sum(population) as total_population from country
group by continent;