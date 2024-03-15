drop table if exists orders
drop table if exists customer

if object_id(N'customer','U') is null
create table customer(
cust_code varchar(10) primary key,
cust_name varchar(25),
cust_city varchar(25),
cust_country varchar(25),
grade int)




if object_id(N'orders','U') is null
create table orders(
ord_num int primary key identity(200100,1),
ord_amount int,
ord_date date,
cust_code varchar(10),
foreign key (cust_code) references customer(cust_code))

insert into customer values
('C00001','Micheal    ','New York ','USA      ',2),
('C00002','Bolt       ','New York ','USA      ',3),
('C00003','Martin     ','Torento  ','Canada   ',2),
('C00004','Winston    ','Brisban  ','Australia',1),
('C00005','Sasikant   ','Mumbai   ','India    ',1),
('C00006','Shilton    ','Torento  ','Canada   ',1),
('C00007','Ramanathan ','Chennai  ','India    ',1),
('C00008','Karolina   ','Torento  ','Canada   ',1),
('C00009','Ramesh     ','Mumbai   ','India    ',3),
('C00010','Charles    ','Hampshair','UK       ',3),
('C00011','Sundariya  ','Chennai  ','India    ',3),
('C00012','Steven     ','San Jose ','USA      ',1),
('C00013','Holmes     ','London   ','UK       ',2),
('C00014','Rangarappa ','Bangalore','India    ',2),
('C00015','Stuart     ','London   ','UK       ',1),
('C00016','Venkatpati ','Bangalore','India    ',2),
('C00017','Srinivas   ','Bangalore','India    ',2),
('C00018','Fleming    ','Brisban  ','Australia',2),
('C00019','Yearannaidu','Chennai  ','India    ',1),
('C00020','Albert     ','New York ','USA      ',3),
('C00021','Jacks      ','Brisban  ','Australia',1),
('C00022','Avinash    ','Mumbai   ','India    ',2),
('C00023','Karl       ','London   ','UK       ',0),
('C00024','Cook       ','London   ','UK       ',2),
('C00025','Ravindran  ','Bangalore','India    ',2)


insert into orders (ord_amount,ord_date,cust_code) values
 (1000,'2008-01-08','C00015'),
 (3000,'2008-07-15','C00001'),
 (2000,'2008-05-25','C00012'),
 (1500,'2008-05-15','C00021'),
 (1500,'2008-03-13','C00006'),
 (2500,'2008-07-18','C00025'),
 (2500,'2008-04-20','C00005'),
 (4500,'2008-08-30','C00007'),
 (4000,'2008-02-15','C00008'),
 (3500,'2008-07-30','C00011'),
 (3000,'2008-04-15','C00019'),
 (1000,'2008-07-10','C00020'),
 (2000,'2008-05-30','C00016'),
 (4000,'2008-06-10','C00022'),
 (3500,'2008-08-15','C00002'),
 ( 500,'2008-07-13','C00010'),
 ( 800,'2008-10-20','C00014'),
 ( 500,'2008-07-20','C00023'),
 (4000,'2008-09-16','C00007'),
 ( 500,'2008-07-20','C00009'),
 (1500,'2008-09-23','C00008'),
 (2500,'2008-09-16','C00003'),
 ( 500,'2008-09-16','C00022'),
 ( 500,'2008-06-20','C00017'),
 (2000,'2008-10-10','C00018'),
 ( 500,'2008-06-24','C00022'),
 (2500,'2008-07-20','C00015'),
 (3500,'2008-07-20','C00009'),
 (2500,'2008-07-20','C00024'),
 (2500,'2008-07-30','C00025'),
 ( 900,'2008-08-26','C00012'),
 (1200,'2008-06-29','C00009'),
 (4200,'2008-09-25','C00004'),
 (2000,'2008-09-16','C00007')



select cust_city,count(ord_num) as "Number Of Orders",count(distinct customer_id) as "Number Of Customers", 
sum(ord_amount) as "Total order ammount" from orders right join customers on cust_code=customer_id
group by cust_city having count(ord_num)>=4
