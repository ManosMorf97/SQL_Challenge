with scheme_users as
(select scheme_code,count(scheme_manager_id) as users_no from scheme
group by scheme_code)
select scheme_code from scheme_users where users_no=(select min(users_no) from scheme_users);