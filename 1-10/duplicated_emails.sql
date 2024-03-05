create table if not exists employees(
employee_id int primary key auto_increment,
employee_name varchar(40),
email_id varchar(40)
)auto_increment=101;

insert into employees (employee_name,email_id) values ('Liam Alton','li.al@abc.com'),('Josh Day','jo.da@abc.com'),
('Sean Mann','se.ma@abc.com'),('Evan Blake','ev.bl@abc.com'),('Toby Scott','jo.da@abc.com');

select email_id from employees group by email_id having count(email_id)=2;