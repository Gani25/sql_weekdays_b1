-- day 19
-- Transactions (TCL)
/*
comit
rollback
savepoint
*/
-- default auto-commit is on

set autocommit = false;

use sprk_weekdays;

show tables;
select * from employee;

show create table employee;
/*
CREATE TABLE `employee` (
  `emp_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `dept_name` varchar(80) NOT NULL,
  `dob` date NOT NULL,
  `salary` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`emp_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci
*/

select * from employee;
/*
INSERT INTO `` (`emp_id`,`name`,`dept_name`,`dob`,`salary`) VALUES (1,'Rohit Raj','Sales','1995-11-25',3500.00);
INSERT INTO `` (`emp_id`,`name`,`dept_name`,`dob`,`salary`) VALUES (2,'Rohit Gupta','IT','1999-02-22',5500.00);
INSERT INTO `` (`emp_id`,`name`,`dept_name`,`dob`,`salary`) VALUES (3,'Nikhil Sharma','Sales','2004-05-02',1200.00);
INSERT INTO `` (`emp_id`,`name`,`dept_name`,`dob`,`salary`) VALUES (4,'Suyash Yadav','HR','1985-04-20',5600.00);
INSERT INTO `` (`emp_id`,`name`,`dept_name`,`dob`,`salary`) VALUES (5,'Ayush Shinde','Sales','1998-05-22',3500.00);
INSERT INTO `` (`emp_id`,`name`,`dept_name`,`dob`,`salary`) VALUES (6,'Rohan Deshmukh','Sales','1997-04-18',3000.00);
INSERT INTO `` (`emp_id`,`name`,`dept_name`,`dob`,`salary`) VALUES (7,'Pranjal Raibole','HR','1997-10-10',5000.00);
INSERT INTO `` (`emp_id`,`name`,`dept_name`,`dob`,`salary`) VALUES (8,'Prakash Jha','Admin','2005-10-15',800.00);
INSERT INTO `` (`emp_id`,`name`,`dept_name`,`dob`,`salary`) VALUES (9,'Kavita Suryavanshi','Sales','1988-12-10',3600.00);
INSERT INTO `` (`emp_id`,`name`,`dept_name`,`dob`,`salary`) VALUES (10,'Abdul Gani Memon','IT','1999-12-10',1200.00);
INSERT INTO `` (`emp_id`,`name`,`dept_name`,`dob`,`salary`) VALUES (11,'Shruti Shinde','IT','2001-05-15',1900.00);
INSERT INTO `` (`emp_id`,`name`,`dept_name`,`dob`,`salary`) VALUES (12,'Mayuri Revande','IT','1995-02-25',2600.00);
INSERT INTO `` (`emp_id`,`name`,`dept_name`,`dob`,`salary`) VALUES (13,'Shubham Deshmukh','IT','1999-10-20',6000.00);
INSERT INTO `` (`emp_id`,`name`,`dept_name`,`dob`,`salary`) VALUES (14,'Shruti Shinde','IT','1988-10-25',3600.00);
INSERT INTO `` (`emp_id`,`name`,`dept_name`,`dob`,`salary`) VALUES (15,'Pratik Mhatre','HR','1995-08-20',3600.00);
INSERT INTO `` (`emp_id`,`name`,`dept_name`,`dob`,`salary`) VALUES (16,'Vipul Deshmukh','Admin','1995-08-20',5600.00);
INSERT INTO `` (`emp_id`,`name`,`dept_name`,`dob`,`salary`) VALUES (17,'Rohit Gupta','Sales','1988-05-25',3000.00);
INSERT INTO `` (`emp_id`,`name`,`dept_name`,`dob`,`salary`) VALUES (18,'Ashutosh Sharma','IT','1998-01-20',4500.00);
*/

select * from employee;
set autocommit = false;

delete from employee;

select * from employee;
rollback;
select * from employee;

insert into employee values
(default,"Demo Demo","IT","2003-02-25",523),
(default,"Demo Demo","IT","2003-02-25",523);

select * from employee;
insert into employee values
(default,"Demo 3","Sales","2004-08-20",58963);

select * from employee;

update employee set name = "Demo 5" where emp_id = 21;

select * from employee;

delete from employee;
select * from employee;
rollback;

select * from employee;


insert into employee values
(default,"Abdul Memon","IT","2003-02-25",5000),
(default,"Pranjal Sharma","Sales","1999-01-15",5300);

savepoint s1;

select * from employee;
insert into employee values
(default,"Ayush Gupta","Sales","1999-08-22",8500);
savepoint s2;
select * from employee;

update employee set name = "Ayush Sharma" where emp_id = 24;

select * from employee;

savepoint s3;

delete from employee;
select * from employee;
rollback to s3;

select * from employee;
rollback to s2;
select * from employee;

rollback to s3; -- ERROR
commit;

select * from employee;
rollback;
select * from employee;
