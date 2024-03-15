truncate table orders

insert into orders (ord_amount,advance_ammount,ord_date,cust_code,ord_description) values
 (1000, 600,'2008-01-08','C00015','RAM         '   ),
 (2000, 300,'2008-05-25','C00012','mother board'   ),
 (2500, 500,'2008-07-18','C00025','RAM         '   ),
 (4500, 900,'2008-08-30','C00007','hard disk   '   ),
 (4000, 600,'2008-02-15','C00008','mouse       '   ),
 (3500, 800,'2008-07-30','C00015','key board   '   ),
 (4000, 600,'2008-06-10','C00022','key board   '   ),
 ( 500, 100,'2008-07-13','C00010','mouse       '   ),
 ( 500, 100,'2008-07-20','C00022','mouse       '   ),
 (4000, 700,'2008-09-16','C00007','RAM         '   ),
 (1500, 600,'2008-09-23','C00008','key board   '   ),
 (2500, 400,'2008-09-16','C00007','mother board'   ),
 ( 500, 100,'2008-09-16','C00022','mother board'   ),
 (2000, 600,'2008-10-10','C00008','hard disk   '   ),
 ( 500, 100,'2008-06-24','C00022','hard disk   '   ),
 (2500, 400,'2008-07-20','C00015','mouse       '   ),
 (3500,1500,'2008-07-20','C00009','mother board'   ),
 (2500, 500,'2008-07-20','C00022','RAM         '   ),
 (2500, 400,'2008-07-30','C00025','mother board'   ),
 ( 900, 150,'2008-08-26','C00012','hard disk   '   ),
 (1200, 400,'2008-06-29','C00009','mouse       '   )


select o1.cust_code,cust_name,ord_description,ord_amount,cast (ord_amount/cast(total_orders as real) as decimal(5,4))
Percentage_of_Cost from orders o1
join customers on cust_code=customer_id join
(select cust_code,sum(ord_amount) as total_orders from orders
group by cust_code) o2 on o1.cust_code=o2.cust_code
order by cust_name