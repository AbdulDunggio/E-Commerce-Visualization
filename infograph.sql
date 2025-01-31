-- Sales Performance
-- Line Chart total orders by datetime
select
quarter(order_purchase_timestamp) as quarter,
year(order_purchase_timestamp) as year,
monthname(order_purchase_timestamp) as month,
day(order_purchase_timestamp) as day,
oi.price + oi.shipping_charges as total_revenue
from orders o
join order_items oi
on o.order_id = oi.order_id

--Bar Chart total orders by product category
select
product_category_name,
count(oi.order_id) as total
from products p
join order_items oi
on oi.product_id = p.product_id
group by product_category_name
order by total desc

--Pie Chart for payment type
--Using orders table

--Shipping performance
-- Bar Chart avg shipping by region
select
customer_city,
avg(datediff(order_delivered_timestamp,order_approved_at)) as avg_shipping
from customers c
join orders o
on c.customer_id = o.customer_id
group BY customer_city
order by avg_shipping 

--Bar Chart/Map Total Orders by region
select
customer_city,
count(o.order_id) as total_orders
from customers c
join orders o
on c.customer_id = o.customer_id
group by customer_city
order by total_orders desc
