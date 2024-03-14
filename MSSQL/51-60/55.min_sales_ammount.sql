select salesman.SALESMAN_ID,SALESMAN_NAME,min(SALE_AMMOUNT) as min_sale_ammount from sales
join salesman on sales.SALESMAN_ID=salesman.SALESMAN_ID group by salesman.SALESMAN_ID,SALESMAN_NAME