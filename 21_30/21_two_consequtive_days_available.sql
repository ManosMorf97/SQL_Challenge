drop table if exists dr_clinic;
create table if not exists dr_clinic(
visiting_date date primary key,
availability bool);

insert into dr_clinic values
('2016-06-11',1),
('2016-06-12',1),
('2016-06-13',0),
('2016-06-14',1),
('2016-06-15',0),
('2016-06-16',0),
('2016-06-17',1),
('2016-06-18',1),
('2016-06-19',1),
('2016-06-20',1),
('2016-06-21',1);

select distinct dc3.visiting_date from dr_clinic as dc1 inner join dr_clinic as dc2 on 
dc1.visiting_date+1=dc2.visiting_date and dc1.availability and dc2.availability
inner join dr_clinic as dc3 
on dc3.visiting_date=dc1.visiting_date or dc3.visiting_date=dc2.visiting_date;