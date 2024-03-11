drop table if exists students;
create table students(
student_id int primary key auto_increment,
student_name varchar(20) not null,
marks_achieved int not null
);

insert into students (student_name,marks_achieved) values
('Alex',87)
,('Jhon',92)
,('Pain',83)
,('Danny',87)
,('Paul',92)
,('Rex',89)
,('Philip',87)
,('Josh',83)
,('Evan',92)
,('Larry',87); 



select max(s1.marks_achieved) from students as s1 left join students as s2 
on s1.marks_achieved=s2.marks_achieved and s1.student_id<>s2.student_id
where s2.student_id is null