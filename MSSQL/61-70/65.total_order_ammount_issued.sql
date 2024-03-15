drop table if exists customers

if object_id(N'customers','U') is null
create table customers(
customer_id varchar(10) primary key,
cust_name varchar(25),
cust_city varchar(25),
working_area varchar(25),
cust_country varchar(25),
grade int,
opening_amt decimal(10,2),
recieve_amt decimal(10,2),
payment_amt decimal(10,2),
outstanding_amt decimal(10,2),
phone_no varchar(15))

drop table if exists orders

if object_id(N'orders','U') is null
create table orders(
ord_num int primary key identity(200100,1),
ord_amount int,
advance_ammount int,
ord_date date,
cust_code varchar(10),
ord_description varchar(15),
foreign key (cust_code) references customers(customer_id)
)

insert into customers values
('C00001','Micheal    ','New York ','New York ','USA         ',2, 3000.00, 5000.00,2000.00, 6000.00,'CCCCCCC     '),
('C00002','Bolt       ','New York ','New York ','USA         ',3, 5000.00, 7000.00,9000.00, 3000.00,'DDNRDRH     '),
('C00003','Martin     ','Torento  ','Torento  ','Canada      ',2, 8000.00, 7000.00,7000.00, 8000.00,'MJYURFD     '),
('C00004','Winston    ','Brisban  ','Brisban  ','Australia   ',1, 5000.00, 8000.00,7000.00, 6000.00,'AAAAAAA     '),
('C00005','Sasikant   ','Mumbai   ','Mumbai   ','India       ',1, 7000.00,11000.00,7000.00,11000.00,'147-25896312'),
('C00006','Shilton    ','Torento  ','Torento  ','Canada      ',1,10000.00, 7000.00,6000.00,11000.00,'DDDDDDD     '),
('C00007','Ramanathan ','Chennai  ','Chennai  ','India       ',1, 7000.00,11000.00,9000.00, 9000.00,'GHRDWSD     '),
('C00008','Karolina   ','Torento  ','Torento  ','Canada      ',1, 7000.00, 7000.00,9000.00, 5000.00,'HJKORED     '),
('C00009','Ramesh     ','Mumbai   ','Mumbai   ','India       ',3, 8000.00, 7000.00,3000.00,12000.00,'Phone No    '),
('C00010','Charles    ','Hampshair','Hampshair','UK          ',3, 6000.00, 4000.00,5000.00, 5000.00,'MMMMMMM     '),
('C00011','Sundariya  ','Chennai  ','Chennai  ','India       ',3, 7000.00,11000.00,7000.00,11000.00,'PPHGRTS     '),
('C00012','Steven     ','San Jose ','San Jose ','USA         ',1, 5000.00, 7000.00,9000.00, 3000.00,'KRFYGJK     '),
('C00013','Holmes     ','London   ','London   ','UK          ',2, 6000.00, 5000.00,7000.00, 4000.00,'BBBBBBB     '),
('C00014','Rangarappa ','Bangalore','Bangalore','India       ',2, 8000.00,11000.00,7000.00,12000.00,'AAAATGF     '),
('C00015','Stuart     ','London   ','London   ','UK          ',1, 6000.00, 8000.00,3000.00,11000.00,'GFSGERS     '),
('C00016','Venkatpati ','Bangalore','Bangalore','India       ',2, 8000.00,11000.00,7000.00,12000.00,'JRTVFDD     '),
('C00017','Srinivas   ','Bangalore','Bangalore','India       ',2, 8000.00, 4000.00,3000.00, 9000.00,'AAAAAAB     '),
('C00018','Fleming    ','Brisban  ','Brisban  ','Australia   ',2, 7000.00, 7000.00,9000.00, 5000.00,'NHBGVFC     '),
('C00019','Yearannaidu','Chennai  ','Chennai  ','India       ',1, 8000.00, 7000.00,7000.00, 8000.00,'ZZZZBFV     '),
('C00020','Albert     ','New York ','New York ','USA         ',3, 5000.00, 7000.00,6000.00, 6000.00,'BBBBSBB     '),
('C00021','Jacks      ','Brisban  ','Brisban  ','Australia   ',1, 7000.00, 7000.00,7000.00, 7000.00,'WERTGDF     '),
('C00022','Avinash    ','Mumbai   ','Mumbai   ','India       ',2, 7000.00,11000.00,9000.00, 9000.00,'113-12345678'),
('C00023','Karl       ','London   ','London   ','UK          ',0, 4000.00, 6000.00,7000.00, 3000.00,'AAAABAA     '),
('C00024','Cook       ','London   ','London   ','UK          ',2, 4000.00, 9000.00,7000.00, 6000.00,'FSDDSDF     '),
('C00025','Ravindran  ','Bangalore','Bangalore','India       ',2, 5000.00, 7000.00,4000.00, 8000.00,'AVAVAVA     ')

insert into orders (ord_amount,advance_ammount,ord_date,cust_code) values
 (1000, 600,'2008-01-08','C00015'),
 (3000,1000,'2008-07-15','C00001'),
 (2000, 300,'2008-05-25','C00012'),
 (1500, 700,'2008-05-15','C00021'),
 (1500, 500,'2008-03-13','C00006'),
 (2500, 500,'2008-07-18','C00025'),
 (2500, 700,'2008-04-20','C00005'),
 (4500, 900,'2008-08-30','C00007'),
 (4000, 600,'2008-02-15','C00008'),
 (3500, 800,'2008-07-30','C00011'),
 (3000, 500,'2008-04-15','C00019'),
 (1000, 300,'2008-07-10','C00020'),
 (2000, 400,'2008-05-30','C00016'),
 (4000, 600,'2008-06-10','C00022'),
 (3500,2000,'2008-08-15','C00002'),
 ( 500, 100,'2008-07-13','C00010'),
 ( 800, 200,'2008-10-20','C00014'),
 ( 500, 100,'2008-07-20','C00023'),
 (4000, 700,'2008-09-16','C00007'),
 ( 500, 100,'2008-07-20','C00009'),
 (1500, 600,'2008-09-23','C00008'),
 (2500, 400,'2008-09-16','C00003'),
 ( 500, 100,'2008-09-16','C00022'),
 ( 500, 100,'2008-06-20','C00017'),
 (2000, 600,'2008-10-10','C00018'),
 ( 500, 100,'2008-06-24','C00022'),
 (2500, 400,'2008-07-20','C00015'),
 (3500,1500,'2008-07-20','C00009'),
 (2500, 500,'2008-07-20','C00024'),
 (2500, 400,'2008-07-30','C00025'),
 ( 900, 150,'2008-08-26','C00012'),
 (1200, 400,'2008-06-29','C00009'),
 (4200,1800,'2008-09-25','C00004'),
 (2000, 800,'2008-09-16','C00007')

 select cust_code,sum(ord_amount) "Total Order" from orders
 where year(ord_date)=2008 and month(ord_date)=9
 group by cust_code order by sum(ord_amount) desc

