drop table  if exists sale

if object_id(N'sale','U') is null
create table sale(
product_name varchar(20),
unit_type varchar(5),
sale_date date,
sale_qty int)

insert into sale values
('Munchos        ','P','2018-05-15',20),
('Boyer Chocolate','P','2018-04-27',30),
('CocaCola       ','L','2018-04-10',25),
('Fruit Cakes    ','P','2018-07-12',30),
('CocaCola       ','L','2018-07-07',50),
('Fanta          ','L','2018-01-27',70),
('Chex Mix       ','P','2018-09-17',40),
('Jaffa Cakes    ','P','2018-06-25',40),
('Pom-Bear       ','P','2018-02-11',30),
('Twix Chocolate ','P','2018-12-24',50),
('Limca          ','L','2018-03-15',50),
('Mirinda        ','L','2018-02-05',40)

select s2.unit_type,s2.sale_date,sum(s1.sale_qty) as running_unit from sale s1
inner join sale s2 on s1.unit_type=s2.unit_type and s1.sale_date<=s2.sale_date
group by s2.unit_type,s2.sale_date
order by s2.unit_type,s2.sale_date

