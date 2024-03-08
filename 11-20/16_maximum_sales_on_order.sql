drop table if exists salesmast;
create table if not exists salesmast(
salesperson_id int primary key auto_increment,
order_id int not null)auto_increment=5000;

insert into salesmast (order_id) values(1001),(1002),(1002),(1002),(1003),
(1004),(1004),(1004);

with total_orders_sales as
(select order_id,count(order_id)as total_sales from salesmast group by order_id),
max_sales as (select max(total_sales) as maximum_sales from total_orders_sales)
select order_id
from total_orders_sales,max_sales
where total_sales=maximum_sales;
