SELECT c.customer_state,
       COUNT(DISTINCT o.order_id) AS total_orders,
       SUM(CASE WHEN p.payment_type = 'credit_card' THEN 1 ELSE 0 END) AS credit_orders,
       SUM(CASE WHEN p.payment_type = 'boleto' THEN 1 ELSE 0 END) AS boleto_orders
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN payments p ON o.order_id = p.order_id
GROUP BY c.customer_state 
ORDER BY total_orders DESC;