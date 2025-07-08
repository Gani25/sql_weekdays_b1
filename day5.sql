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
