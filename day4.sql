-- Day 4

use world;

-- Find all the countries whose indep year is null
select * from country
where indepyear is null;

-- index year is not null
select * from country
where indepyear is not null;

-- Find all the country count based on continent
select continent, count(*) from country
group by continent;


-- Find all the country count based on continent
-- then filter only those continent which 
-- have more than 40 countries
select continent, count(*) as total_countries from country
group by continent 
having total_countries > 40;


-- DDL
create database sprk_weekdays;

use sprk_weekdays;
-- Table
create table student
(
	roll_no int,
    first_name varchar(20),
    last_name varchar(20),
    email varchar(45),
    phone varchar(15),
    acc_created_on timestamp
);
    
select * from student;
describe student;
select now();
-- Insert (DML)
insert into student values
(10,"Rushikesh","Gupta",null,"5858958745",now());


select * from student;
insert into student(first_name, last_name, roll_no) values
("Hritik","Sharma",5);

select * from student;