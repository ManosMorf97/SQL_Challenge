drop table  if exists product

if object_id(N'product','U') is null
create table product(
product_id int primary key identity(8001,1),
category_id int not null
)

drop table  if exists purchase 

if object_id(N'purchase','U') is null
create table purchase(
purchase_no int primary key identity(1001,1),
item_code int,
purchase_qty int,
purchase_date date,
foreign key(item_code) references product(product_id)
)

insert into product (category_id) values
	  (150),
      (160),
      (160),
      (150),
      (160);

insert into purchase (item_code,purchase_qty,purchase_date) values
	   (8001,240,'2019-12-17'),
       (8002,150,'2019-12-17'),
       (8003,175,'2020-11-15'),
       (8004,150,'2019-12-17'),
       (8005,145,'2019-12-05'),
       (8001,150,'2020-01-05'),
       (8002,200,'2020-01-15'),
       (8003,150,'2020-12-17'),
       (8001,200,'2020-01-28'),
       (8002,180,'2020-02-07'),
       (8001,300,'2020-02-25'),
       (8005,100,'2020-01-27');

--select concat(year(p1.purchase_date),'-',month(p1.purchase_date)), from purchase p1 join purchase p2 on year(p1.purchase_date)>year(p2.purchase_date) or 
--(year(p1.purchase_date)=year(p2.purchase_date) and month(p1.purchase_date)>month(p2.purchase_date))

--avg(bought quantity) per category
GO
create or alter function y_m
(@mydate date) 
returns varchar(20) as
begin
	return (concat(year(@mydate),'-',dbo.addzero(month(@mydate))))
end
GO

with avg_purchase_category as
(select dbo.y_m(purchase_date) year_month,category_id,avg(purchase_qty) 
as avg_qty
from purchase join product on purchase.item_code=product.product_id
group by dbo.y_m(purchase_date),category_id
)
,avg_purchase_y_m as
(select dbo.y_m(purchase_date) year_month,avg(purchase_qty) avg_qty from purchase 
group by dbo.y_m(purchase_date))
select avg_purchase_category.year_month,avg_purchase_category.category_id,
case
	when avg_purchase_category.avg_qty>avg_purchase_y_m.avg_qty then 'increase'
	when avg_purchase_category.avg_qty<avg_purchase_y_m.avg_qty then 'decrease'
	else 'remain_same' end product_status
from avg_purchase_category 
join avg_purchase_y_m on avg_purchase_category.year_month=avg_purchase_y_m.year_month
order by avg_purchase_category.category_id,avg_purchase_category.year_month

