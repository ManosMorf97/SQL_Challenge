drop table  if exists emp_test_table

if object_id(N'emp_test_table','U') is null
create table emp_test_table(
employee_id int primary key identity(100,1),
first_name varchar(25),
manager_id int,
constraint manager_company
check(manager_id<=employee_id)
)

insert into emp_test_table (first_name,manager_id) values
	('Steven   ',100),
    ('Neena    ',100),
    ('Lex      ',100),
    ('Alexander',102),
    ('Bruce    ',103),
    ('David    ',103),
    ('Valli    ',103),
    ('Diana    ',103),
    ('Nancy    ',101),
    ('Daniel   ',108),
    ('John     ',108)

select * from emp_test_table where manager_id<>employee_id