create table if not exists `logs`(
student_id int primary key auto_increment,
marks int
)auto_increment=101;

insert into `logs` (marks) values(83),(79),(83),(83),(83),(79),(79),(83);

with rankings_ as (select marks,row_number() over() as ranked from `logs`)
select joined.marks as ConsecutiveNums from (select r1.marks from rankings_ as r1 
inner join rankings_ as r2 on r2.marks=r1.marks and r2.ranked=r1.ranked+1) as joined
group by joined.marks having count(joined.marks)>=2;
