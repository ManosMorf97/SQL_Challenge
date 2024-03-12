drop table if exists order_stat
GO

if object_id(N'order_stat','U') is null
create table order_stat(
order_id int  primary key identity(151,1),
com_name varchar(25),
ord_qty int,
ord_stat varchar(25),
stat_date date
)
GO

create or alter function addzero(@value_ int) 
returns varchar(2) as
BEGIN
	
	IF @value_<10 
		return concat('0',@value_)
	ELSE
		return @value_
	return ''
END
GO


insert into order_stat (com_name,ord_qty,ord_stat,stat_date) values
     ('MMS INC',500,'Booked','2020-08-15'),
     ('BCT LTD',300,'Cancelled','2020-08-15'),
     ('MMS INC',400,'Cancelled','2020-08-26'),
     ('XYZ COR',500,'Booked','2020-08-15'),
     ('MMS INC',500,'Cancelled','2020-10-11'),
     ('BWD PRO LTD',250,'Cancelled','2020-11-15'),
     ('BCT LTD',600,'Booked','2020-10-07'),
     ('MMS INC',300,'Booked','2020-12-11'),
     ('XYZ COR',300,'Booked','2020-08-26'),
     ('BCT LTD',400,'Booked','2020-11-15')
GO

select concat(year(stat_date),'-',dbo.addzero(month(stat_date)))as "month year",com_name,count(ord_stat) as no_of_orders,
sum(iif(ord_stat='Booked',1,0)) as booked_orders,sum(ord_qty) as total_order_quantity,
sum(iif(ord_stat='Booked',ord_qty,0)) as no_of_booked_qty from order_stat group by 
com_name,concat(year(stat_date),'-',dbo.addzero(month(stat_date)))

