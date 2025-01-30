-- total revenue & orders
select
quarter(order_purchase_timestamp) as quarter,
year(order_purchase_timestamp) as year,
monthname(order_purchase_timestamp) as month,
day(order_purchase_timestamp) as day,
oi.price + oi.shipping_charges as total_revenue
from orders o
join order_items oi
on o.order_id = oi.order_id

-- total unique subscriber
select distinct
c.customer_id,
quarter(o.order_delivered_timestamp) as quarter,
year(o.order_delivered_timestamp) as year,
monthname(o.order_delivered_timestamp) as month,
day(o.order_delivered_timestamp) as day
from customers c
join orders o
on c.customer_id = o.customer_id
where order_status = 'delivered'
