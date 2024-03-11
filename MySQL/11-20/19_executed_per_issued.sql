drop table if exists orders_issued;
create table if not exists orders_issued(
distributor_id int not null,
company_id int not null,
quotation_date date not null);

drop table if exists orders_executed;
create table if not exists orders_executed(
orders_from int not null,
executed_from int not null,
execution_date date not null);

INSERT INTO orders_issued VALUES (101, 202, '2019-11-15'),(101, 203, '2019-11-15')
,(101, 204, '2019-11-15'),(102, 202, '2019-11-16'),(102, 201, '2019-11-15')
,(103, 203, '2019-11-17'),(103, 202, '2019-11-17'),(104, 203, '2019-11-18')
,(104, 204, '2019-11-18');

INSERT INTO orders_executed VALUES (101, 202, '2019-11-17'),(101, 203, '2019-11-17')
,(102, 202, '2019-11-17'),(103, 203, '2019-11-18')
,(103, 202, '2019-11-19'),(104, 203, '2019-11-20');

select @executed:=count(1) from orders_executed;
select @issued:=count(1) from orders_issued;
select round(@executed/(@issued),2) as rate_of_execution;