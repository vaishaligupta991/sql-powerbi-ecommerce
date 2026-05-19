SELECT seller_id,
       ROUND(SUM(price), 2) AS total_revenue,
       RANK() OVER (ORDER BY SUM(price) DESC) AS revenue_rank
FROM order_items 
GROUP BY seller_id 
LIMIT 20;