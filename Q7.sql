-- Determine the distribution of orders by hour of the day.

SELECT 
    HOUR(o.order_time) AS hour,
    COUNT(o.order_id) AS total_orders
FROM
    orders AS o
GROUP BY HOUR(o.order_time);