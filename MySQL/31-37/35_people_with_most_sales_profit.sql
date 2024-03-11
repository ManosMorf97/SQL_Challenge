drop table if exists sales_info;
drop table if exists item;

create table if not exists item(
	item_code int primary key auto_increment,
	item_desc varchar(20) not null,
	cost int not null
)auto_increment=101;

create table if not exists sales_info(
	distributor_id int not null,
	item_code int not null,
	retailer_id int not null,
	date_of_sell date not null,
	quantity int not null,
	total_cost int not null,
	foreign key (item_code) references item(item_code) 
);

insert into item (item_desc,cost) values
	('mother board',2700),
    ('RAM         ', 800),
    ('key board   ', 300),
    ('mouse       ', 300);

insert into sales_info values
	(5001,101,1001,'2020-02-12', 3, 8100),
    (5001,103,1002,'2020-03-15',15, 4500),
    (5002,101,1001,'2019-06-24', 2, 5400),
    (5001,104,1003,'2019-09-11', 8, 2400),
    (5003,101,1003,'2020-10-21', 5,13500),
    (5003,104,1002,'2020-12-27',10, 3000),
    (5002,102,1001,'2019-05-18',12, 9600),
    (5002,103,1004,'2020-06-17', 8, 2400),
    (5003,103,1001,'2020-04-12', 3,  900);


with total_profit_per_distributor as
(select distributor_id,sum(total_cost) as total_profit from sales_info group by distributor_id)
select distributor_id from total_profit_per_distributor where total_profit=(select max(total_profit) from total_profit_per_distributor); 

