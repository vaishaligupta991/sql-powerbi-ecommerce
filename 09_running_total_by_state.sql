SELECT c.customer_state,
       COUNT(*) AS orders,
       SUM(COUNT(*)) OVER (ORDER BY c.customer_state) AS running_total
FROM customers c 
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_state;