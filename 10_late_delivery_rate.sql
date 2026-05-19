SELECT p.product_category_name,
       COUNT(*) AS total_orders,
       SUM(CASE WHEN o.order_delivered_customer_date > 
           o.order_estimated_delivery_date THEN 1 ELSE 0 END) AS late_count,
       ROUND(100.0 * SUM(CASE WHEN o.order_delivered_customer_date > 
           o.order_estimated_delivery_date THEN 1 ELSE 0 END) / COUNT(*), 1) AS late_pct
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
WHERE o.order_status = 'delivered'
GROUP BY p.product_category_name 
ORDER BY late_pct DESC 
LIMIT 10;