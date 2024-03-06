create table students(
student_id int primary key auto_increment,
student_name varchar(20) not null,
teacher_id int)auto_increment=1001;

insert into students (student_name,teacher_id) values('Alex',601),('Jhon',NULL),
('Peter',NULL),('Minto',604),('Crage',NULL),('Chang',601),('Philip',602);

select student_name from students where teacher_id is not null and teacher_id<>602;
