drop table if exists employees

if object_id(N'employees','U') is null
create table employees(
	emp_id int primary key,
	emp_name varchar(30),
	emp_sex varchar(1),
	depart_name varchar(25),
	emp_salary int,
	qtr1 int,
	qtr2 int,
	qtr3 int,
	qtr4 int,
	emp_department int,
   manager_id int
)

insert into employees values
  (100,'Steven     ','M','Production    ',24000,240,310,275,300, 90,  0),
  (101,'Neena      ','F','Production    ',17000,270,300,275,290, 90,100),
  (102,'Lex        ','M','Audit         ',17000,300,290,285,310, 80,100),
  (103,'Alexander  ','M','Marketing     ', 9000, 25,270,260,280, 60,102),
  (104,'Bruce      ','M','Marketing     ', 6000,300,280,275,290, 60,103),
  (105,'David      ','M','Audit         ', 4800,200,220,250,270, 80,103),
  (106,'Valli      ','F','Marketing     ', 4800,300,320,330,350, 60,103),
  (107,'Diana      ','F','Marketing     ', 4200,280,270,310,320, 60,103),
  (108,'Nancy      ','M','Administration',12000,260,280,300,310,100,101),
  (109,'Daniel     ','F','Administration', 9000,220,210,240,260,100,108),
  (110,'John       ','M','Administration', 8200,300,290,280,320,100,108),
  (111,'Ismael     ','M','Administration', 7700,280,300,270,310,100,108),
  (112,'Jose Manuel','M','Administration', 7800,250,280,260,300,100,108),
  (113,'Luis       ','F','Administration', 6900,300,280,270,310,100,108),
  (114,'Den        ','M','Sales         ',11000,280,290,300,320, 30,100),
  (115,'Alexander  ','M','Sales         ', 3100,310,300,320,340, 30,114),
  (116,'Shelli     ','F','Sales         ', 2900,245,260,280,300, 30,114),
  (117,'Sigal      ','F','Sales         ', 2800,250,370,290,320, 30,114),
  (133,'Jason      ','M','Export        ', 3300,280,270,300,290, 50,122),
  (134,'Michael    ','F','Export        ', 2900,260,280,290,300, 50,122),
  (135,'Ki         ','F','Export        ', 2400,240,260,270,290, 50,122)


select emp_name,(qtr1+qtr2+qtr3+qtr4) "Case Resolved" from employees join
(select max(qtr1+qtr2+qtr3+qtr4) max_qtrs from employees where manager_id=114) max_emp on qtr1+qtr2+qtr3+qtr4=max_qtrs
where manager_id=114
