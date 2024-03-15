drop table if exists employees

if object_id(N'employees','U') is null
create table employees(
emp_id int primary key,
emp_name varchar(25),
hire_date date,
job_id varchar(25),
salary decimal(10,2),
manager_id int,
department_id int
)

insert into employees values
	    (100,'Steven     ','1987-06-17','AD_PRES   ',24000.00,  0, 90),
        (101,'Neena      ','1987-06-18','AD_VP     ',17000.00,100, 90),
        (102,'Lex        ','1987-06-19','AD_VP     ',17000.00,100, 90),
        (103,'Alexander  ','1987-06-20','IT_PROG   ', 9000.00,102, 60),
        (104,'Bruce      ','1987-06-21','IT_PROG   ', 6000.00,103, 60),
        (105,'David      ','1987-06-22','IT_PROG   ', 4800.00,103, 60),
        (106,'Valli      ','1987-06-23','IT_PROG   ', 4800.00,103, 60),
        (107,'Diana      ','1987-06-24','IT_PROG   ', 4200.00,103, 60),
        (108,'Nancy      ','1987-06-25','FI_MGR    ',12000.00,101,100),
        (109,'Daniel     ','1987-06-26','FI_ACCOUNT', 9000.00,108,100),
        (110,'John       ','1987-06-27','FI_ACCOUNT', 8200.00,108,100),
        (111,'Ismael     ','1987-06-28','FI_ACCOUNT', 7700.00,108,100),
        (112,'Jose Manuel','1987-06-29','FI_ACCOUNT', 7800.00,108,100),
        (113,'Luis       ','1987-06-30','FI_ACCOUNT', 6900.00,108,100),
        (114,'Den        ','1987-07-01','PU_MAN    ',11000.00,100, 30),
        (115,'Alexander  ','1987-07-02','PU_CLERK  ', 3100.00,114, 30),
        (116,'Shelli     ','1987-07-03','PU_CLERK  ', 2900.00,114, 30),
        (117,'Sigal      ','1987-07-04','PU_CLERK  ', 2800.00,114, 30),
        (133,'Jason      ','1987-07-20','ST_CLERK  ', 3300.00,122, 50),
        (134,'Michael    ','1987-07-21','ST_CLERK  ', 2900.00,122, 50),
        (135,'Ki         ','1987-07-22','ST_CLERK  ', 2400.00,122, 50),
        (136,'Hazel      ','1987-07-23','ST_CLERK  ', 2200.00,122, 50),
        (137,'Renske     ','1987-07-24','ST_CLERK  ', 3600.00,123, 50),
        (138,'Stephen    ','1987-07-25','ST_CLERK  ', 3200.00,123, 50),
        (139,'John       ','1987-07-26','ST_CLERK  ', 2700.00,123, 50)


select * from employees where salary=
( select max(salary) from employees where emp_id not in
	( select emp_id from employees where salary=(select max(salary)  from employees) )
)
