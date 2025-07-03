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

