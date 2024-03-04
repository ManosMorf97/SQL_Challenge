create table if not exists salespersons(
	salesperson_id int primary key auto_increment,
    firstname varchar(10) not null,
    lastname varchar(20) not null
);

create table if not exists address(
	address_id int primary key auto_increment,
    salesperson_id int not null,
    city varchar(20) not null,
    state varchar(20) not null,
    country varchar(20) default "USA"
);

insert into salespersons (firstname,lastname) values
("Green","Wright"),("Jones","Collins"),("Bryant","Davis");

insert into address (salesperson_id,city,state) values
(2,"Los Angeles","California"),(3,"Denver","Colorado"),(4,"Atlanta","Georgia");

select distinct firstname,lastname,city,state,country from salespersons as sp 
left join address as ad on sp.salesperson_id=ad.salesperson_id order by lastname;
 