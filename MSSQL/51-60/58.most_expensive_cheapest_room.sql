drop table if exists hotels

if object_id(N'hotels','U') is null
create table hotels(
hotel_id int,
floor_id int,
room_no int,
room_type varchar(2),
price_weekdays int,
price_holidays int)

insert into hotels values
     (201,1,2005,'D', 5500, 6000),
     (201,1,2007,'Q', 7500, 9000),
     (201,2,3008,'D', 5300, 5000),
     (201,5,5005,'D', 6200, 6000),
     (201,5,5010,'Q',10000,15000),
     (203,2,4051,'S', 4200, 3800),
     (203,2,4056,'D', 4800, 5000),
     (203,4,5058,'D', 5700, 6300),
     (203,4,5065,'S', 8000, 6500),
     (204,1,3825,'S', 4000, 3800),
     (204,1,3830,'D', 3900, 4500),
     (204,2,4620,'D', 6500, 7000),
     (204,2,4625,'Q', 8000,10000),
     (204,2,4630,'S', 9500, 8500),
     (204,2,4635,'Q',15000,20000),
     (205,2,5525,'S', 4800, 4300),
     (205,3,5652,'Q', 7200, 9000),
     (205,3,5658,'D', 5200, 5000),
     (205,5,6010,'D', 6500, 6300),
     (205,3,5670,'S', 5500, 5000),
     (205,5,6015,'Q',18500,16300)
GO
create or alter function hotels_info()
returns table as
return (select hotel_id,room_no,price_weekdays from hotels)
GO
select h1.hotel_id "hotel",h3.room_no most_expensive_room_no,h2.room_no cheapest_room_no from
(
(select hotel_id,min(price_weekdays) cheapest_price,max(price_weekdays) most_expensive_price
from hotels group by hotel_id) h1
join
dbo.hotels_info() h2 
on h1.hotel_id=h2.hotel_id and cheapest_price=h2.price_weekdays
join dbo.hotels_info() h3 
on h1.hotel_id=h3.hotel_id and most_expensive_price=h3.price_weekdays
)