drop table if exists employees
drop table if exists departments 


if object_id(N'departments','U') is null
create table departments(
department_id int primary key,
department_name varchar(30))

if object_id(N'employees','U') is null
create table employees(
emp_id int primary key,
emp_name varchar(30),
emp_sex varchar(1),
emp_salary int,
emp_department int,
foreign key(emp_department) references departments(department_id))

insert into departments values
	( 30,'Sales         '),
    ( 50,'Export        '),
    ( 60,'Marketing     '),
    ( 80,'Audit         '),
    ( 90,'Production    '),
    (100,'Administration')


insert into employees values
   (100,'Steven     ','M',24000, 90),
   (101,'Neena      ','F',17000, 90),
   (102,'Lex        ','M',17000, 80),
   (103,'Alexander  ','M', 9000, 60),
   (104,'Bruce      ','M', 6000, 60),
   (105,'David      ','M', 4800, 80),
   (106,'Valli      ','F', 4800, 60),
   (107,'Diana      ','F', 4200, 60),
   (108,'Nancy      ','M',12000,100),
   (109,'Daniel     ','F', 9000,100),
   (110,'John       ','M', 8200,100),
   (111,'Ismael     ','M', 7700,100),
   (112,'Jose Manuel','M', 7800,100),
   (113,'Luis       ','F', 6900,100),
   (114,'Den        ','M',11000, 30),
   (115,'Alexander  ','M', 3100, 30),
   (116,'Shelli     ','F', 2900, 30),
   (117,'Sigal      ','F', 2800, 30),
   (133,'Jason      ','M', 3300, 50),
   (134,'Michael    ','F', 2900, 50),
   (135,'Ki         ','F', 2400, 50)


select department_name,emp_salary from departments join    
(select emp_department,emp_salary from employees where emp_salary=
(select max(emp_salary) salary from employees)) max_salary 
on department_id=emp_department

