drop table if exists employees

if object_id(N'employees','U') is null
create table employees(
employee_id int primary key identity(100,1),
emp_name varchar(25),
hire_date date,
job_id varchar(25),
salary decimal(10,2),
manager_id int,
department_id int)

insert into employees (emp_name,hire_date,job_id,salary,manager_id,department_id) values
	    ('Steven     ','1987-06-17','AD_PRES   ',24000.00,  0, 90),
        ('Neena      ','1987-06-18','AD_VP     ',17000.00,100, 90),
        ('Lex        ','1987-06-19','AD_VP     ',17000.00,100, 90),
        ('Alexander  ','1987-06-20','IT_PROG   ', 9000.00,102, 60),
        ('Bruce      ','1987-06-21','IT_PROG   ', 6000.00,103, 60),
        ('David      ','1987-06-22','IT_PROG   ', 4800.00,103, 60),
        ('Valli      ','1987-06-23','IT_PROG   ', 4800.00,103, 60),
        ('Diana      ','1987-06-24','IT_PROG   ', 4200.00,103, 60),
        ('Nancy      ','1987-06-25','FI_MGR    ',12000.00,101,100),
        ('Daniel     ','1987-06-26','FI_ACCOUNT', 9000.00,108,100),
        ('John       ','1987-06-27','FI_ACCOUNT', 8200.00,108,100),
        ('Ismael     ','1987-06-28','FI_ACCOUNT', 7700.00,108,100),
        ('Jose Manuel','1987-06-29','FI_ACCOUNT', 7800.00,108,100),
        ('Luis       ','1987-06-30','FI_ACCOUNT', 6900.00,108,100),
        ('Den        ','1987-07-01','PU_MAN    ',11000.00,100, 30),
        ('Alexander  ','1987-07-02','PU_CLERK  ', 3100.00,114, 30),
        ('Shelli     ','1987-07-03','PU_CLERK  ', 2900.00,114, 30),
        ('Sigal      ','1987-07-04','PU_CLERK  ', 2800.00,114, 30),
        ('Jason      ','1987-07-20','ST_CLERK  ', 3300.00,122, 50),
        ('Michael    ','1987-07-21','ST_CLERK  ', 2900.00,122, 50),
        ('Ki         ','1987-07-22','ST_CLERK  ', 2400.00,122, 50),
        ('Hazel      ','1987-07-23','ST_CLERK  ', 2200.00,122, 50),
        ('Renske     ','1987-07-24','ST_CLERK  ', 3600.00,123, 50),
        ('Stephen    ','1987-07-25','ST_CLERK  ', 3200.00,123, 50),
        ('John       ','1987-07-26','ST_CLERK  ', 2700.00,123, 50)


	select department_id,salary from 
	(select distinct department_id,salary,dense_rank() over(partition by department_id order by salary desc) as ranking 
	from employees) emp where ranking between 1 and 3 
	order by department_id,salary desc
	