-- day 8
create database sprk_weekdays;
use sprk_weekdays;

create table my_table_one
(
	id int ,
    value varchar(20)
);
insert into my_table_one values
(1,"One"),(2,"Two"),(3,"Three"),(4,"Four"),(12,"Twelve"),
(6,"Six");

select * from my_table_one;
create table my_table_two
(
	id int ,
    value varchar(20)
);

insert into my_table_two values
(1,"One"),(2,"Two - 2"),(7,"Seven"),(8,"Eight"),(12,"Twelve"),
(9,"Nine"),(3,"Three"),(13,"Thirteen");

select * from my_table_one;
select * from my_table_two;

select * from my_table_one
join my_table_two
on my_table_one.id = my_table_two.id;

select * from my_table_one
inner join my_table_two
on my_table_one.id = my_table_two.id;

select my_table_one.id as T1ID, my_table_one.value as T1Value,
my_table_two.id as T2ID, my_table_two.value as T2Value 
from my_table_one
join my_table_two
on my_table_one.id = my_table_two.id;

select t1.id as T1ID, t1.value as T1Value,
t2.id as T2ID, t2.value as T2Value 
from my_table_one as t1
join my_table_two as t2
on t1.id = t2.id;

select t1.id T1ID, t1.value T1Value,
t2.id T2ID, t2.value T2Value 
from my_table_one t1
join my_table_two t2
on t1.id = t2.id;

select t1.id T1ID, t1.value T1Value,
t2.id T2ID, t2.value T2Value 
from my_table_one t1
join my_table_two t2
on t1.value = t2.value;