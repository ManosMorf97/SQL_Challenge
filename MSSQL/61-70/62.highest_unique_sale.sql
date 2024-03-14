drop table if exists sales

if object_id(N'sales','U') is null
create table sales(
TRANSACTION_ID int primary key identity(501,1),
SALESMAN_ID int not null,
SALE_AMOUNT decimal(8,2))

insert into sales (SALESMAN_ID,SALE_AMOUNT) values
	(18, 5200.00),
    (50, 5566.00),
    (38, 8400.00),
    (43, 8400.00),
    (11, 9000.00),
    (42,12200.00),
    (13, 7000.00),
    (33, 6000.00),
    (41, 8200.00),
    (11, 4500.00),
    (51,10000.00),
    (29, 9500.00),
    (59, 6500.00),
    (38, 7800.00),
    (58, 9800.00),
    (60,12000.00),
    (58,14000.00),
    (23,12200.00),
    (34, 5480.00),
    (35, 8129.00),
    (49, 9323.00),
    (46, 8200.00),
    (47, 9990.00),
    (42,14000.00),
    (44, 7890.00),
    (47, 5990.00),
    (21, 7770.00),
    (57, 6645.00),
    (56, 5125.00),
    (25,10990.00)

select SALESMAN_ID salesperson_ID,SALE_AMOUNT sale_ammount from sales where SALE_AMOUNT=
(select max(SALE_AMOUNT) from sales where SALE_AMOUNT not in 
(select s1.SALE_AMOUNT from sales s1 join sales s2
on s1.SALE_AMOUNT=s2.SALE_AMOUNT and s1.SALESMAN_ID<>s2.SALESMAN_ID))