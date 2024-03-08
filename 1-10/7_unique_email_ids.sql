select * from employees;

delete from employees where employee_id not in (select emp.min_emp from (select min(employee_id) as min_emp from employees
group by email_id)as emp);