drop table if exists tablefortest;
create table if not exists tablefortest(
id int primary key auto_increment,
date_of_birth date not null);

insert into tablefortest (date_of_birth) values('1907-08-15'),('1883-06-27'),
('1900-01-01'),
('1901-01-01'),
('2005-09-01'),
('1775-11-23'),
('1800-01-01');

select *,ceiling(YEAR(date_of_birth)/100) as Century from tablefortest;