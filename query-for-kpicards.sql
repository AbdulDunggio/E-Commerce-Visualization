-- total revenue
select
year(order_purchase_timestamp) as year,
month(order_purchase_timestamp) as month,
day(order_purchase_timestamp) as day,
oi.price + oi.shipping_charges as total_revenue
from orders o
join order_items oi
on o.order_id = oi.order_id
