select item_code,item_desc from item where item_code in
(select item_code from sales_info where month(date_of_sell)  between 4 AND 6);