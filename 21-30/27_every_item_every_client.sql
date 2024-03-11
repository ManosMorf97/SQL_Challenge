drop table if exists orders;
drop table if exists items;

create table if not exists items(
item_code int primary key auto_increment,
item_name varchar(20) not null
)auto_increment=10091;

create table if not exists orders(
order_id int primary key auto_increment,
distributor_id int not null,
item_ordered int not null,
item_quantity int not null,
foreign key(item_ordered) references items(item_code)
);

insert into items (item_name) values
('juice    '),
('chocolate'),
('cookies  '),
('cake     ');

insert into orders (distributor_id,item_ordered,item_quantity) values
(501,10091,250),
(502,10093,100),
(503,10091,200),
(502,10091,150),
(502,10092,300),
(504,10094,200),
(503,10093,250),
(503,10092,250),
(501,10094,180),
(503,10094,350);

select distributor_id from orders group by distributor_id having count(distributor_id)=(select count(*) from items);