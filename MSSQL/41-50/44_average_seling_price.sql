drop table if exists item_price

if object_id(N'item_price','U') is null
create table item_price(
item_code int,
date_from date,
date_to date,
date_cost int)

drop table if exists sales

if object_id(N'sales','U') is null
create table sales(
sale_date date,
item_code int,
sales_qty int
)

insert into item_price values
	  (101,'2018-04-07','2018-06-28', 8),
      (102,'2018-02-15','2018-04-17',13),
      (103,'2018-03-12','2018-04-30',10),
      (101,'2018-06-29','2018-10-31',15),
      (103,'2018-05-01','2019-08-24',14),
      (102,'2018-04-18','2018-07-10',25),
      (104,'2018-06-11','2018-10-10',25),
      (101,'2018-11-01','2019-01-15',20)

insert into sales values
('2018-05-15',101,120),
('2018-04-27',103,80),
('2018-04-10',102,200),
('2018-07-12',101,100),
('2018-07-07',103,50),
('2018-09-17',104,100),
('2018-06-25',102,100)

select item_price.item_code,ROUND( cast(SUM(date_cost*sales_qty) as real )/cast(SUM(sales_qty) as real),2) as average_selling_price from item_price 
left join sales on item_price.item_code=sales.item_code and sale_date between date_from and date_to
group by item_price.item_code
