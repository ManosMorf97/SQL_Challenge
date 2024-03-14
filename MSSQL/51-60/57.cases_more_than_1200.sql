drop table if exists employee

if object_id(N'employee','U') is null
create table employee(
	emp_id int primary key identity(101,1),
	emp_name varchar(30),
	emp_sex varchar(1),
	depart_name varchar(25),
	emp_salary int,
	qtr1 int,
	qtr2 int,
	qtr3 int,
	qtr4 int,
	emp_department int
)

insert into employee (emp_name,emp_sex,depart_name,emp_salary,qtr1,qtr2,qtr3,qtr4,emp_department) values
   ('Steven     ','M','Production    ',24000,240,310,275,300, 90),
   ('Neena      ','F','Production    ',17000,270,300,275,290, 90),
   ('Lex        ','M','Audit         ',17000,300,290,285,310, 80),
   ('Alexander  ','M','Marketing     ', 9000, 25,270,260,280, 60),
   ('Bruce      ','M','Marketing     ', 6000,300,280,275,290, 60),
   ('David      ','M','Audit         ', 4800,200,220,250,270, 80),
   ('Valli      ','F','Marketing     ', 4800,300,320,330,350, 60),
   ('Diana      ','F','Marketing     ', 4200,280,270,310,320, 60),
   ('Nancy      ','M','Administration',12000,260,280,300,310,100),
   ('Daniel     ','F','Administration', 9000,220,210,240,260,100),
   ('John       ','M','Administration', 8200,300,290,280,320,100),
   ('Ismael     ','M','Administration', 7700,280,300,270,310,100),
   ('Jose Manuel','M','Administration', 7800,250,280,260,300,100),
   ('Luis       ','F','Administration', 6900,300,280,270,310,100),
   ('Den        ','M','Sales         ',11000,280,290,300,320, 30),
   ('Alexander  ','M','Sales         ', 3100,310,300,320,340, 30),
   ('Shelli     ','F','Sales         ', 2900,245,260,280,300, 30),
   ('Sigal      ','F','Sales         ', 2800,250,370,290,320, 30),
   ('Jason      ','M','Export        ', 3300,280,270,300,290, 50),
   ('Michael    ','F','Export        ', 2900,260,280,290,300, 50),
   ('Ki         ','F','Export        ', 2400,240,260,270,290, 50)


select emp_name,qtr1+qtr2+qtr3+qtr4 as total_cases_solved from employee where qtr1+qtr2+qtr3+qtr4>1200 and depart_name='Sales'