-- Determine the top 3 most ordered pizza types based on revenue for each pizza category.

Select name, category, revenue from
(Select category, name, revenue, 
rank() over(partition by category order by revenue desc) as rank_number
from
(SELECT 
    pt.category, pt.name,
    ROUND(SUM(p.price * od.quantity), 2) as revenue
FROM
    pizzas AS p
        JOIN
    pizza_types AS pt ON p.pizza_type_id = pt.pizza_type_id
        JOIN
    order_details AS od ON p.pizza_id = od.pizza_id
GROUP BY pt.category, pt.name) as table_a) as table_b
where rank_number <= 3;