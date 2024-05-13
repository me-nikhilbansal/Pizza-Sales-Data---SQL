-- Calculate the percentage contribution of each pizza type to total revenue.

SELECT 
    pt.category,
    ROUND((ROUND(SUM(p.price * od.quantity), 2) / (SELECT 
                    ROUND(SUM(p.price * od.quantity), 2)
                FROM
                    pizzas AS p
                        JOIN
                    order_details AS od ON p.pizza_id = od.pizza_id)) * 100,
            2) AS total_category_sales_percentage
FROM
    pizzas AS p
        JOIN
    pizza_types AS pt ON p.pizza_type_id = pt.pizza_type_id
        JOIN
    order_details AS od ON p.pizza_id = od.pizza_id
GROUP BY pt.category;