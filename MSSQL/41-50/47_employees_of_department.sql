drop table if exists emp_test_table

if object_id(N'emp_test_table','U') is null
create table emp_test_table(
employee_id int primary key identity(100,1),
first_name varchar(25),
department_id int
)

insert into emp_test_table (first_name,department_id) values
	    ('Steven   ',90),
        ('Neena    ',90),
        ('Lex      ',90),
        ('Alexander',60),
        ('Bruce    ',60),
        ('David    ',60),
        ('Valli    ',60),
        ('Diana    ',60),
        ('Nancy    ',100),
        ('Daniel   ',100),
        ('John     ',100);

with employees_per_department as
(select department_id,count(*) as employees_in_department from emp_test_table group by department_id)
select employee_id,employees_in_department from emp_test_table join employees_per_department
on emp_test_table.department_id=employees_per_department.department_id
order by employee_id
