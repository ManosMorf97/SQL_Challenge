create table if not exists `logs`(
student_id int primary key auto_increment,
marks int
)auto_increment=101;

insert into `logs` (marks) values(83),(79),(83),(83),(83),(79),(79),(83);

with rankings_ as (select marks,row_number() over() as ranked from `logs`)
select distinct r1.marks from rankings_ as r1 inner join rankings_ as r2 on r1.ranked=r2.ranked+1 
and r1.marks=r2.marks inner join rankings_ as r3 on r2.marks=r3.marks and 
r2.ranked=r3.ranked+1;