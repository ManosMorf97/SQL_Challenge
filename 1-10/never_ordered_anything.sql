drop table if exists orders;
drop table if exists customers;

create table if not exists customers(
customer_id int primary key auto_increment,
customer_name varchar(40))auto_increment=101;

insert into customers (customer_name) values("Liam"),("Josh"),("Sean"),("Evan"),("Tobby"); 

create table if not exists orders(
order_id int primary key auto_increment,
customer_id int,
order_date date,
order_ammount int,
foreign key(customer_id) references customers(customer_id) )auto_increment=401;

insert into orders (customer_id,order_date,order_ammount) 
values(103,'2012-03-08',4500),(101,'2012-09-15',3650),(102,'2012-06-27',4800);

select customer_name as `Customers` from customers 
left join orders on customers.customer_id=orders.customer_id
where order_id is null;

