drop table if exists city;
create table if not exists city(
city_id int primary key auto_increment,
`date` date,
so2_amt int
)auto_increment=701;

insert into city(`date`,so2_amt) values('2015-10-15',5),('2015-10-16',7),
('2015-10-17',9),('2018-10-18',15),('2015-10-19',14);

select c2.city_id as `City ID` from city as c1 inner join city as c2 on c1.`date`+1=c2.`date`
and c1.so2_amt<c2.so2_amt;