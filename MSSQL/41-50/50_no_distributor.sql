drop table if exists company_info 
drop table if exists orders

if object_id(N'company_info','U') is null
create table company_info(
company_id int primary key identity(5001,1),
company_name varchar(25)
)

if object_id(N'orders','U') is null
create table orders(
order_id int primary key identity(101,1),
item_name varchar(25),
company_id int
)

insert into company_info (company_name) values
	  ('Intel   '),
      ('Kingston'),
      ('Dell    '),
      ('Sony    '),
      ('Iball   '),
      ('Canon   ')

insert into orders (item_name,company_id) values
	 ('mother board',5001),
     ('RAM         ',5002),
     ('printer     ',5006),
     ('keyboard    ',5005),
     ('mouse       ',6051),
     ('speaker     ',6009),
     ('web cam     ',5005),
     ('hard disk   ',5002),
     ('monitor     ',5003),
     ('scanner     ',7023)


select order_id,item_name from orders where company_id not in(
select orders.company_id from orders inner join company_info on orders.company_id=company_info.company_id)

