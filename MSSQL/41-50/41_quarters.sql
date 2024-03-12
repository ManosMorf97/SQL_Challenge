drop table  if exists sales

if object_id(N'sales','U') is NULL
create table sales(
	product_id int not null,
	sale_qty int,
	qtr_no varchar(25) not null,
	primary key(product_id,qtr_no)
);

insert into sales values
   (1,15000,'qtr1'),
   (1,10000,'qtr2'),
   (2,20000,'qtr1'),
   (2,12000,'qtr2'),
   (3,20000,'qtr1'),
   (3,15000,'qtr2'),
   (3,23000,'qtr3'),
   (3,22000,'qtr4'),
   (4,25000,'qtr2'),
   (4,18000,'qtr4');


with qtr_sales as(
select product_id,iif(qtr_no='qtr1',sale_qty,0) as qtr1_sale,
iif(qtr_no='qtr2',sale_qty,0) as qtr2_sale,iif(qtr_no='qtr3',sale_qty,0) as qtr3_sale,
iif(qtr_no='qtr4',sale_qty,0) as qtr4_sale from sales)
select product_id,
iif(sum(qtr1_sale)>0,sum(qtr1_sale),NULL) as qtr1_sale,
iif(sum(qtr2_sale)>0,sum(qtr2_sale),NULL) as qtr2_sale,
iif(sum(qtr3_sale)>0,sum(qtr3_sale),NULL) as qtr3_sale,
iif(sum(qtr4_sale)>0,sum(qtr4_sale),NULL) as qtr1_sale
from qtr_sales group by product_id