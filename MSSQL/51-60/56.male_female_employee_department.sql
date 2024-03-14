drop table if exists employee

if object_id(N'employee','U') is null
create table employee(
emp_id int primary key identity(100,1),
emp_name varchar(30),
emp_sex varchar(1),
emp_salary int,
emp_department int)

insert into employee (emp_name,emp_sex,emp_salary,emp_department) values
   ('Steven     ','M',24000, 90),
   ('Neena      ','F',17000, 90),
   ('Lex        ','M',17000, 80),
   ('Alexander  ','M', 9000, 60),
   ('Bruce      ','M', 6000, 60),
   ('David      ','M', 4800, 80),
   ('Valli      ','F', 4800, 60),
   ('Diana      ','F', 4200, 60),
   ('Nancy      ','M',12000,100),
   ('Daniel     ','F', 9000,100),
   ('John       ','M', 8200,100),
   ('Ismael     ','M', 7700,100),
   ('Jose Manuel','M', 7800,100),
   ('Luis       ','F', 6900,100),
   ('Den        ','M',11000, 30),
   ('Alexander  ','M', 3100, 30),
   ('Shelli     ','F', 2900, 30),
   ('Sigal      ','F', 2800, 30),
   ('Jason      ','M', 3300, 50),
   ('Michael    ','F', 2900, 50),
   ('Ki         ','F', 2400, 50)


select emp_department as department,
sum(iif(emp_sex='F',1,0)) as female_employees,sum(iif(emp_sex='F',emp_salary,0)) as female_total_salary,
sum(iif(emp_sex='M',1,0)) as male_employees,sum(iif(emp_sex='M',emp_salary,0)) as male_total_salary
from employee 
group by emp_department