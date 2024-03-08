drop table if exists bank_trans;

create table bank_trans(
trans_id int not null,
customer_id int not null,
login_date date not null
);

insert into bank_trans values
 (101,3002,'2019-09-01')
,(101,3002,'2019-08-01')
,(102,3003,'2018-09-13')
,(102,3002,'2018-07-24')
,(103,3001,'2019-09-25')
,(102,3004,'2017-09-05');

select customer_id,min(login_date) as first_login from bank_trans group by customer_id
order by customer_id;

