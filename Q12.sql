-- Analyze the cumulative revenue generated over time.

select order_date, sum(sales) over(order by order_date) as cumulative_revenue
from 
(SELECT 
    o.order_date,
    ROUND(SUM(p.price * od.quantity), 2) AS sales
FROM
    pizzas AS p
        JOIN
    order_details AS od ON p.pizza_id = od.pizza_id
        JOIN
    orders AS o ON od.order_id = o.order_id
GROUP BY o.order_date) as revenue;