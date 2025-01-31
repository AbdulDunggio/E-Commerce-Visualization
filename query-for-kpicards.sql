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

-- total unique customer
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

-- ontime orders percentage
select
order_id,
order_status,
order_delivered_timestamp,
order_estimated_delivery_date,
CASE
WHEN order_delivered_timestamp <= order_estimated_delivery_date
then 'On-Time' ELSE 'Delay' end as deliv_p
from orders
where order_status = 'delivered'
limit 10

-- counting products sold
select
p.product_id,
oi.order_id,
count(*) over() as total
from products p
join order_items oi
on oi.product_id = p.product_id
