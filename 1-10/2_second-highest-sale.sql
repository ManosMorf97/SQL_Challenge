with rankings as
(select *,dense_rank() over(order by sales_amt desc) as ranking from salesmast)
select sales_amt from rankings where ranking=2;