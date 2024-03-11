drop table if exists exam_test;
drop table if exists subject_test;

create table if not exists subject_test(
subject_id int primary key auto_increment,
subject_name varchar(20) not null)auto_increment=201;

create table exam_test(
exam_id int not null,
subject_id int not null,
exam_year int not null,
no_of_student int not null,
foreign key(subject_id) references subject_test(subject_id));

insert into subject_test (subject_name) values
('Mathematics'),
('Physics    '),
('Chemistry  ');

insert into exam_test values
(71,201,2017,5146),
(71,201,2018,3545),
(71,202,2017,2701),
(71,202,2018,5945),
(71,202,2019,2500),
(71,203,2017,2500),
(72,201,2018,3500),
(72,202,2017,3651),
(73,201,2017,1000),
(73,201,2018,2647),
(73,201,2019,2647),
(73,202,2018,4501);


select exam_id,subject_name,exam_year,no_of_student from exam_test as et 
join subject_test as st on et.subject_id=st.subject_id 
order by exam_id,subject_name;

select exam_id,subject_name,exam_year as first_year,no_of_student
from exam_test join subject_test on exam_test.subject_id=subject_test.subject_id
where exam_year=(select min(exam_year) from exam_test);