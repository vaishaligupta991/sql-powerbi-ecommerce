SELECT p.product_category_name,
       ROUND(AVG(r.review_score), 2) AS avg_score,
       COUNT(r.review_id) AS review_count
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
JOIN order_reviews r ON oi.order_id = r.order_id
GROUP BY p.product_category_name
ORDER BY avg_score DESC 
LIMIT 10;