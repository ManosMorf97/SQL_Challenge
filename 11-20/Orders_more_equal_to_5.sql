drop table if exists orders;
create table if not exists orders(
ORDER_ID int primary key,
CUSTOMER int not null,
ITEM_DESC varchar(20) not null);

INSERT INTO orders VALUES(101,2109,'juice');
INSERT INTO orders VALUES(102,2139,'chocolate');
INSERT INTO orders VALUES(103,2120,'juice');
INSERT INTO orders VALUES(104,2108,'cookies');
INSERT INTO orders VALUES(105,2130,'juice');
INSERT INTO orders VALUES(106,2103,'cake');
INSERT INTO orders VALUES(107,2122,'cookies');
INSERT INTO orders VALUES(108,2125,'cake');
INSERT INTO orders VALUES(109,2139,'cake');
INSERT INTO orders VALUES(110,2141,'cookies');
INSERT INTO orders VALUES(111,2116,'cake');
INSERT INTO orders VALUES(112,2128,'cake');
INSERT INTO orders VALUES(113,2146,'chocolate');
INSERT INTO orders VALUES(114,2119,'cookies');
INSERT INTO orders VALUES(115,2142,'cake');

select ITEM_DESC as item_desc,count(1) as 'Number of orders' from orders group by ITEM_DESC having count(1)>=5;