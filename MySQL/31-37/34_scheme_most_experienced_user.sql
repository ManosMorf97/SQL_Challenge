with max_experience as
(select scheme_code,max(running_years) as max_years from scheme join managing_body 
on scheme_manager_id=manager_id group by scheme_code)
select max_experience.scheme_code,manager_id from max_experience join scheme 
on max_experience.scheme_code=scheme.scheme_code
join managing_body on scheme_manager_id=manager_id
where max_years=running_years;