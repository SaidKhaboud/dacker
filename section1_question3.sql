WITH OrderedOrders AS (
    SELECT *,
           ROW_NUMBER() OVER (PARTITION BY id ORDER BY updated_at DESC) AS rn
    FROM raw_orders
)
SELECT id, order_date, status, country, customer_id, amount, updated_at
FROM OrderedOrders
WHERE rn = 1;
