use sprk_weekdays;

show tables;

select * from student;

delete from student
where roll_no = 10;

delete from student;

select * from student;

insert into student(first_name,age,last_name,gender,email,phone) values
("Pranjal",20,"Shinde","Female","pr@gmail.com","5120");
select * from student;

truncate table student;

select * from student;
insert into student(first_name,age,last_name,gender,email,phone) values
("Pranjal",20,"Shinde","Female","pr@gmail.com","5120");

select * from student;

drop table student;

create table course
(
	c_id int primary key,
    c_name varchar(20) not null,
    c_duration varchar(40) not null
);

/*
create table student
(
	roll_no int not null,
    name varchar(50) not null,
    phone varchar(15) not null,
    course_id int,
    foreign key(course_id) references course(c_id)
);
*/

create table student
(
	roll_no int not null,
    name varchar(50) not null,
    phone varchar(15) not null,
    course_id int
);

select * from student;
show create table student;

alter table student 
add constraint foreign key(course_id) references course(c_id);

show create table student;

insert into student values
(1,"Akash","121212",null);
/*Error Code: 1452. Cannot add or update a child row: 
a foreign key constraint fails 
(`sprk_weekdays`.`student`, CONSTRAINT `student_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `course` (`c_id`))
*/


select * from student;

insert into course
values(1001,"SQL","20 hours"),(1005,"Python","25 hours"),
(1008,"Java","40 hours"),(1010,"Excel","16 hours");

select * from course;

insert into  student values
(2,"Pranjal","181818",1005),
(3,"Shubham","161616",1008),
(4,"Shubham","111333",1005);

select * from student;
select * from course;

