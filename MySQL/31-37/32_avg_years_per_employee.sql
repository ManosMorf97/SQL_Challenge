drop table if exists scheme;
drop table if exists managing_body;

create table if not exists managing_body(
	manager_id int primary key auto_increment,
	manager_name varchar(20) not null,
	running_years int not null)
auto_increment=51;

create table if not exists scheme(
	scheme_code int not null,
	scheme_manager_id int not null,
	primary key(scheme_code,scheme_manager_id),
	foreign key(scheme_manager_id) references managing_body(manager_id)
);

insert into managing_body (manager_name,running_years) values
	('James',5),
    ('Cork ',3),
    ('Paul ',4),
    ('Adam ',3),
    ('Hense',4),
    ('Peter',2);

insert into scheme values
	(1001,51),
    (1001,53),
    (1001,54),
    (1001,56),
    (1002,51),
    (1002,55),
    (1003,51),
    (1004,52);

select scheme_code,round(avg(running_years),2) as 'Average year of experience' 
from scheme 
join managing_body on scheme.scheme_manager_id=managing_body.manager_id
group by scheme_code;

