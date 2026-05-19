SELECT p.product_category_name, COUNT(*) AS total_orders
FROM order_items oi 
JOIN products p ON oi.product_id = p.product_id
GROUP BY p.product_category_name
ORDER BY total_orders DESC 
LIMIT 5;