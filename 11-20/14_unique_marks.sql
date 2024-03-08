drop table if exists student_test;
create table if not exists student_test(
student_id int primary key auto_increment,
marks_achieved int);

insert into student_test (marks_achieved) values (56),(74),(15),(74),(89),(56),(93);

select distinct marks_achieved as 'Unique Marks' from student_test;