use sprk_weekdays;

show tables;
describe student;

select * from student;

insert into student values
(10,"Ashutosh","Verma","ashu@gmail.com",
"9858857585","2025-01-25"),
(15,"Pranjal","Gupta","pranjal@gmail.com",
"9858581200",default);

select * from student;
insert into student values
(default,"Abdul","Memon","abdu@gmail.com",
"1245124512",default);

select * from student;

insert into student(roll_no,email,first_name, last_name, phone)
 values
(2,"soham@gmail.com", "Soham","Deshmukh",
"4574859568");

select * from student;

insert into student(email,first_name, last_name, phone)
values
("shruti@gmail.com", "Shruti","Sharma",
"4852100255");


select * from student;

/*
Alter
1. Add Column | Constraint
2. Drop Column | Constraint
3. Modify Column
4. Rename Coloumn | Table
*/

select * from student;

alter table student 
add gender varchar(10);

select * from student;

alter table student
drop gender;

select * from student;

alter table student
add gender varchar(10) after last_name;

select * from student;

alter table student 
add college_id int first;

select *  from student;

alter table student
drop college_id;

select * from student;


alter table student
drop gender;


alter table student
add gender varchar(10) not null default "Male" after last_name;

select * from student;

alter table student
drop gender;


alter table student
add gender varchar(1) after last_name;

select * from student;

-- update
update student 
set gender = "Male"
where roll_no = 1; -- ERROR
describe student;
-- modify 
alter table student
modify gender varchar(12);

desc student;

update student 
set gender = "Male"
where roll_no = 1;

select * from student;

update student 
set gender = "Male"
where roll_no in (2,3,10,16);

select * from student;
