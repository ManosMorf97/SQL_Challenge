drop table if exists commision;
drop table if exists salesmast;

create table salesmast(
salesman_id int not null primary key,
salesman_name varchar(20) not null,
yearly_sale int not null
);

create table commision(
salesman_id int not null primary key,
commision_amt int not null,
foreign key (salesman_id) references salesmast(salesman_id)
);

insert into salesmast values
(101,'Adam',250000),
(103,'Mark',100000),
(104,'Liam',200000),
(102,'Evan',150000),
(105,'Blake',275000),
(106,'Noah',50000);


insert into commision values
(101,10000),
(103,4000),
(104,8000),
(102,6000),
(105,11000);

select salesman_name,commision_amt from salesmast 
inner join commision on salesmast.salesman_id=commision.salesman_id
where commision_amt<10000;