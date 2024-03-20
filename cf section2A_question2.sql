WITH product_sales AS (
    SELECT 
        oi.name AS product_name,
        o.country,
        SUM(oi.quantity) AS total_quantity_sold
    FROM 
        order_items oi
    INNER JOIN 
        orders o ON oi.order_id = o.id
    GROUP BY 
        oi.name, o.country
), max_sales_per_product AS (
    SELECT 
        product_name,
        country,
        total_quantity_sold,
        RANK() OVER(PARTITION BY product_name ORDER BY total_quantity_sold DESC) AS sales_rank
    FROM 
        product_sales
)
SELECT 
    product_name,
    country AS most_sold_in_country
FROM 
    max_sales_per_product
WHERE 
    sales_rank = 1;
