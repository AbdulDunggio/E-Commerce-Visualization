-- checking the table 'products' format
desc products 

-- modifying format column to the appropriate format
alter table orders 
modify column order_estimated_delivery_date datetime

-- checking missing value (null)
select 
count(*)
from products
where product_weight_g is null
limit 10

-- remove null values
delete from products
where product_weight_g is null

-- delete duplicate data
with del_pr as (select *,
ROW_NUMBER() over(partition by product_id, product_category_name,
product_weight_g, product_length_cm, product_height_cm,
product_width_cm) as increment
from products
)
delete from products
where (product_id, product_category_name,
product_weight_g, product_length_cm, product_height_cm,
product_width_cm)
in (select product_id, product_category_name,
product_weight_g, product_length_cm, product_height_cm,
product_width_cm
from del_pr where increment > 1 )
