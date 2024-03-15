update employees
set salary=11000 where employee_id=104

select e1.employee_id,e1.emp_name,e1.hire_date,e1.job_id,
e1.salary,e2.employee_id manager_id,e2.emp_name 
"Manager Name",e2.salary
"Manager Salary"
from employees e1 join employees e2 
on e1.manager_id=e2.employee_id 
where e1.salary>e2.salary