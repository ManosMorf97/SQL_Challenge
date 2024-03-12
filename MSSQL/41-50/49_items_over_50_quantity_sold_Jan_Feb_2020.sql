drop table if exists sales_info;
drop table if exists item;


if object_id(N'item','U') is null
create table item(
	item_code int primary key identity(101,1),
	item_desc varchar(25),
	cost int
)

if object_id(N'sales_info','U') is null
create table sales_info(
distributor_id int,
item_code int,
retailer_id int,
date_of_sell date,
quantity int,
total_cost int,
foreign key (item_code) references item(item_code)
)

insert into item (item_desc,cost) values
	('mother board',2700),
    ('RAM         ', 800),
    ('key board   ', 300),
    ('mouse       ', 300)

insert into sales_info values
	(5001,101,1001,'2020-01-12', 30, 8100),
    (5001,103,1002,'2020-01-15', 25, 4500),
    (5002,101,1001,'2019-01-30', 25, 5400),
    (5001,104,1003,'2019-02-17', 75, 2400),
    (5003,101,1003,'2020-03-07', 55,13500),
    (5003,104,1002,'2020-05-27',100, 3000),
    (5002,102,1001,'2020-05-18', 65, 9600),
    (5002,103,1004,'2020-01-30', 45, 2400),
    (5003,103,1001,'2020-03-12', 30,  900);

select * from item where item_code in(select item_code,sum(quantiy) from sales_info where year(date_of_sell)=2020 and month(date_of_sell) between 1 and 2
group by item_code having sum(quantity)>50)

with items_sold as
(select item_code,sum(quantity) as sale_quantity from sales_info where year(date_of_sell)<2020 and month(date_of_sell) between 1 and 2
group by item_code having sum(quantity)>50)
select items_sold.item_code,items_sold.sale_quantity,item.item_desc from items_sold 
left join item on items_sold.item_code=item.item_code
