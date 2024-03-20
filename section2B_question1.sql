SELECT 
    o.id AS order_id,
    o.amount AS order_amount,
    COALESCE(SUM(c.amount), 0) AS total_charges_amount,
    o.amount - COALESCE(SUM(c.amount), 0) AS difference_value,
    CASE 
        WHEN o.amount = 0 THEN NULL
        ELSE (o.amount - COALESCE(SUM(c.amount), 0)) * 100.0 / o.amount
    END AS difference_percentage
FROM 
    orders o
LEFT JOIN 
    charges c ON o.id = c.order_id
GROUP BY 
    o.id, o.amount;
