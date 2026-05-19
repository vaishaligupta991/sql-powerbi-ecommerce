SELECT YEAR(order_purchase_timestamp) AS year,
       ROUND(SUM(payment_value), 2) AS total_revenue
FROM orders o 
JOIN payments p ON o.order_id = p.order_id
GROUP BY year 
ORDER BY year;