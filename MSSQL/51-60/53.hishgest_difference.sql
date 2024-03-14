drop table if exists sales

if object_id(N'sales','U') is null
create table sales(
company_id int primary key identity(10001,1),
qtr1_sale int,
qtr2_sale int,
qtr3_sale int,
qtr4_sale int)

insert into sales (qtr1_sale,qtr2_sale,qtr3_sale,qtr4_sale) values
	(240,310,330,400),
    (310,250,320,280),
    (370,420,400,450),
    (400,340,320,350),
    (270,350,340,360),
    (160,200,220,200),
    (340,350,370,400),
    (250,280,300,350),
    (350,300,280,350),
    (230,260,280,300)



select MAX(qtr1_sale+qtr2_sale+qtr3_sale+qtr4_sale) as max_sale,
MIN(qtr1_sale+qtr2_sale+qtr3_sale+qtr4_sale) as min_sale,
MAX(qtr1_sale+qtr2_sale+qtr3_sale+qtr4_sale)-MIN(qtr1_sale+qtr2_sale+qtr3_sale+qtr4_sale) 
as sale_differnce from sales