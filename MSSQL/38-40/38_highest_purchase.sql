drop table if exists purchase

if object_id(N'purchase',N'U') is null
create table purchase(
customer_id int not null,
item_code int not null,
purch_qty int not null
)

INSERT INTO purchase values
(101,504,25),
(101,503,50),
(102,502,40),
(102,503,25),
(102,501,45),
(103,505,30),
(103,503,25),
(104,505,40),
(101,502,25),
(102,504,40),
(102,505,50),
(103,502,25),
(104,504,40),
(103,501,35);

with min_ammount as
(select customer_id,max(purch_qty) as min_qty from purchase group by customer_id)
select purchase.customer_id,min(item_code) as item_code,purchase.purch_qty 
from purchase right join min_ammount on purchase.customer_id=min_ammount.customer_id and purch_qty=min_qty
group by purchase.customer_id,purchase.purch_qty order by purchase.customer_id 