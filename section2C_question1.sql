SELECT 
    o.id AS order_id,
    o.order_date,
    o.customer_id,
    MIN(o_first.order_date) AS first_order_date
FROM 
    orders o
INNER JOIN 
    (SELECT 
        customer_id,
        MIN(order_date) AS order_date
    FROM 
        orders
    GROUP BY 
        customer_id) AS o_first ON o.customer_id = o_first.customer_id
GROUP BY 
    o.id, o.order_date, o.customer_id;
