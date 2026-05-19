WITH monthly_revenue AS (
  SELECT DATE_FORMAT(o.order_purchase_timestamp, '%Y-%m') AS month,
         ROUND(SUM(p.payment_value), 2) AS revenue
  FROM orders o 
  JOIN payments p ON o.order_id = p.order_id
  GROUP BY month
)
SELECT *, 
       revenue - LAG(revenue) OVER (ORDER BY month) AS mom_change
FROM monthly_revenue
ORDER BY month;