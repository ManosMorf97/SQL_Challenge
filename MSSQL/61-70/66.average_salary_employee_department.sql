select e1.job_id,emp_name,salary,"Average_Salary" from employees e1 join
(select job_id,avg(salary) "Average_Salary" from employees
group by job_id) e2 on e1.job_id=e2.job_id 
order by job_id