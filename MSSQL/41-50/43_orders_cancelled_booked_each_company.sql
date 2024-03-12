select concat(year(stat_date),'-',dbo.addzero(month(stat_date)))as "month",com_name,
sum(iif(ord_stat='Booked',1,0)) as booked_count,sum(iif(ord_stat='Booked',ord_qty,0)) as booked_qty,
sum(iif(ord_stat='Cancelled',1,0)) as cancelled_count,
sum(iif(ord_stat='Cancelled',ord_qty,0)) as cancelled_qty
 from order_stat group by 
com_name,concat(year(stat_date),'-',dbo.addzero(month(stat_date)))