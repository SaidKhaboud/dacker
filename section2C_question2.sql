WITH cohort_first_purchase AS (
    SELECT 
        customer_id,
        MIN(order_date) AS first_purchase_date
    FROM 
        orders
    GROUP BY 
        customer_id
),
cohort_monthly_spending AS (
    SELECT 
        cfp.customer_id,
        DATE_PART('month', o.order_date) - DATE_PART('month', cfp.first_purchase_date) AS month_of_purchase,
        TO_CHAR(cfp.first_purchase_date, 'Month YYYY') AS first_purchase_month,
        SUM(o.amount) AS monthly_spending
    FROM 
        cohort_first_purchase cfp
    JOIN 
        orders o ON cfp.customer_id = o.customer_id
    GROUP BY 
        cfp.customer_id, month_of_purchase, first_purchase_month
)
SELECT 
    month_of_purchase,
    first_purchase_month,
    SUM(monthly_spending) AS LTV
FROM 
    cohort_monthly_spending
GROUP BY 
    month_of_purchase, first_purchase_month
ORDER BY 
    first_purchase_month, month_of_purchase;
