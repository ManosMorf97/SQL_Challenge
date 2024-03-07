drop table if exists match_crowd;
create table if not exists match_crowd(
match_no int primary key auto_increment,
match_date date not null,
audience int not null);

insert into match_crowd(match_date,audience) values
('2016-06-11',75113),
('2016-06-12',62343),
('2016-06-13',43035),
('2016-06-14',55408),
('2016-06-15',38742),
('2016-06-16',63670),
('2016-06-17',73648),
('2016-06-18',52409),
('2016-06-19',67291),
('2016-06-20',49752),
('2016-06-21',28840),
('2016-06-22',32836),
('2016-06-23',44268);

with match_crowd_joined as
(select mc1.match_no as match_no_left,
mc2.match_no as match_no_right
from match_crowd as mc1 
inner join match_crowd as mc2 
on mc1.match_no=mc2.match_no+1 and mc1.audience>=50000 and mc2.audience>=50000),
match_crowd_joined_double as
(select 
mc1.match_no_left as match_no_left_left,mc1.match_no_right as match_no_left_right,
mc2.match_no_left as match_no_right_left,mc2.match_no_right as match_no_right_right
from match_crowd_joined as mc1 inner join match_crowd_joined as mc2 
on mc1.match_no_left=mc2.match_no_left+2
and  mc1.match_no_right=mc2.match_no_right+2)
select * from match_crowd where 
match_no in (select match_no_left_left from match_crowd_joined_double)
or match_no in (select match_no_left_right from match_crowd_joined_double)
or match_no in (select match_no_right_left from match_crowd_joined_double)
or match_no in (select match_no_right_right from match_crowd_joined_double);

