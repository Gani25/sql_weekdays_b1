use sprk_weekdays;

show tables;
select * from student;
update student
set gender = "Female"
where roll_no in (15,17);

select * from student;
desc student;

alter table student
modify gender varchar(10) not null;

desc student;

-- add constraint
-- drop constraint

show create table student;

alter table student
add age int not null after first_name;

select * from student;
-- add cosntraint check age >= 5 and age <=60

#ERROR
alter table student
add constraint check (age >=5 and  age <= 60); 

update student
set age = 10;

select * from student;
#After fixing bad data in age column now we can apply 
#Constraint
alter table student
add constraint check (age >=5 and  age <= 60); 

desc student;
show create table student;
select * from student;

insert into student(email,first_name, last_name, phone, age, gender)
values
("rohit@gmail.com", "Rohit","Raj",
"1012012585",25,"Male");

select * from student;

-- drop constraint
show create table student;

alter table student
drop constraint student_chk_1;

show create table student;

-- Drop Primary Key Constraint