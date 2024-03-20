SELECT 
    oi.name AS product_name,
    SUM(oi.quantity) AS total_quantity_sold,
    SUM(oi.quantity * oi.unit_amount) AS total_revenue,
    AVG(oi.unit_amount) AS average_sales_price,
    COUNT(DISTINCT o.customer_id) AS total_customers,
    MIN(o.order_date) AS first_sale_date
FROM 
    order_items oi
INNER JOIN 
    orders o ON oi.order_id = o.id
GROUP BY 
    oi.name;
