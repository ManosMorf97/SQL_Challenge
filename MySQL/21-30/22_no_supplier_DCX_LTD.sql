drop table if exists orders;
drop table if exists supplier;
drop table if exists customers;

create table if not exists customers(
customer_id int primary key auto_increment,
customer_name varchar(20) not null,
customer_city varchar(20) not null,
avg_profit int not null
)auto_increment=101;

create table if not exists supplier(
supplier_id int primary key auto_increment,
supplier_name varchar(20) not null,
supplier_city varchar(20) not null
)auto_increment=501;

create table if not exists orders(
order_id int primary key auto_increment,
customer_id int not null,
supplier_id int not null,
order_date date not null,
order_amount int not null,
foreign key (customer_id) references customers(customer_id),
foreign key (supplier_id) references supplier(supplier_id)
)auto_increment=401;

insert into customers (customer_name,customer_city,avg_profit) values
('Liam','New York',25000),
('Josh','Atlanta',22000),
('Sean','New York',27000),
('Evan','Toronto',15000),
('Toby','Dallas',20000);

insert into supplier(supplier_name,supplier_city)values
('ABC INC','Dallas'),  
('DCX LTD','Atlanta'), 
('PUC ENT','New York'),
('JCR INC','Toronto');

insert into orders  (customer_id,supplier_id,order_date,order_amount)  values
(103,501,'2012-03-08',4500),
(101,503,'2012-09-15',3650),
(102,503,'2012-06-27',4800),
(104,502,'2012-06-17',5600),
(104,504,'2012-06-22',6000),
(105,502,'2012-06-25',5600);

select customer_name from customers where customer_id not in(
select customer_id from orders 
join supplier on orders.supplier_id=supplier.supplier_id
where supplier.supplier_name='DCX LTD');

