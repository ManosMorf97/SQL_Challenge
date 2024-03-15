drop table if exists orderdetails

if object_id(N'orderdetails','U') is null
create table orderdetails(
order_id int,
order_status varchar(30) not null,
order_date date not null)

insert into orderdetails values
   (10001,'booked   ','2008-08-15'),
   (10001,'shipped  ','2008-08-16'),
   (10002,'booked   ','2008-07-13'),
   (10002,'delivered','2008-07-19'),
   (10003,'booked   ','2008-08-15'),
   (10003,'delivered','2008-08-18'),
   (10004,'booked   ','2008-08-19'),
   (10004,'shipped  ','2008-08-19')

   select order_id, cast (cast(sum(iif(order_status='shipped  ',1,0)) as real)/count(*) as decimal(6,5)) shipped_perc,
   cast (cast(sum(iif(order_status='delivered',1,0)) as real)/count(*) as decimal(6,5)) delivered_prec from orderdetails
   where order_status in('delivered','shipped  ') group by order_id