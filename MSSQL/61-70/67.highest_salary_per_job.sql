select e1.job_id,emp_name,e1.salary from employees e1 join
(select job_id,max(salary) as highest_salary from employees group by job_id) e2
on e1.job_id=e2.job_id and e1.salary=e2.highest_salary