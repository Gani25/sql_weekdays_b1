-- day 18
-- Triggers
use sprk_weekdays;

create table user_info
(
	id int primary key auto_increment,
    first_name varchar(50) not null,
    last_name varchar(50) not null,
    password varchar(66) not null,
    last_update datetime default now() on update now()

);

show create table user_info;

insert into user_info (first_name, last_name, password) values
("roHiT","sHArma","1234"),
("rushikesh","deshmukh","4100"),
("Abdul","Memon","4888");

select "ruSHikESh",concat(upper(substring("ruSHikESh",1,1)), 
lower(substring("ruSHikESh",2)));

select * from user_info;

delimiter $
create trigger tr1
before insert  on user_info
for each row
begin
	set new.first_name = concat(
		upper(substring(new.first_name,1,1)), 
		lower(substring(new.first_name,2))
    );
    set new.last_name = concat(
		upper(substring(new.last_name,1,1)), 
		lower(substring(new.last_name,2))
    );
end $
delimiter ;

show triggers ;
insert into user_info (first_name, last_name, password) values
("roHiT","sHArma","1234"),
("rushikesh","deshmukh","4100"),
("Abdul","Memon","4888");

select * from user_info;

update user_info 
set first_name = "aBdUL", last_name = "mEMon"
where id = 6;

select * from user_info;


delimiter $
create trigger tr2
before update  on user_info
for each row
begin
	set new.first_name = concat(
		upper(substring(new.first_name,1,1)), 
		lower(substring(new.first_name,2))
    );
    set new.last_name = concat(
		upper(substring(new.last_name,1,1)), 
		lower(substring(new.last_name,2))
    );
end $
delimiter ;

show triggers ;

select * from user_info;
update user_info 
set first_name = "aBdUL", last_name = "mEMon"
where id = 6;
select * from user_info;

-- Update
create table user_info_metadata as
select * from user_info;

select * from user_info_metadata;
desc user_info_metadata;
truncate table user_info_metadata;

alter table user_info_metadata 
modify id int;

desc user_info_metadata;

alter table user_info_metadata 
modify first_name varchar(50);
alter table user_info_metadata 
modify last_name varchar(50);
alter table user_info_metadata 
modify password varchar(66);

alter table user_info_metadata 
modify last_update datetime;

select * from user_info_metadata;

alter table user_info_metadata
add status varchar(60) after password;

select * from user_info;
select * from user_info_metadata;

delimiter $
create trigger tr3
after update on user_info
for each row
begin
	insert into user_info_metadata values
    (old.id, old.first_name, old.last_name, 
    old.password, "Before Update", old.last_update);
    insert into user_info_metadata values
    (new.id, new.first_name, new.last_name, 
    new.password, "After Update", new.last_update);

end $
delimiter ;


show triggers;

select * from user_info;
update user_info
set password = "885556"
where id = 4;


select * from user_info;
select * from user_info_metadata;

update user_info
set password = "4108520", first_name="Kshitij"
where id = 4;


select * from user_info;
select * from user_info_metadata;