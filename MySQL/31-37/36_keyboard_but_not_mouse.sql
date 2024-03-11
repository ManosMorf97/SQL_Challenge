select retailer_id from sales_info where 
item_code=(select item_code from item where item_desc='key board   ')
except
select retailer_id from sales_info where 
item_code=(select item_code from item where item_desc='mouse       ');


