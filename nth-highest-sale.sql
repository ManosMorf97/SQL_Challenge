delete from salesmast where sales_amt=2500;

DELIMITER //
create function getNthHighestSale(pos int) 
returns int deterministic
Begin
	DECLARE returned int;
    
	with rankings as
	(select *,dense_rank() over(order by sales_amt desc) as ranking from salesmast)
	select sales_amt into returned from rankings where ranking=pos;
	
    return returned;
END//
DELIMITER ;

select getNthHighestSale(1);
select getNthHighestSale(2);
select getNthHighestSale(3);