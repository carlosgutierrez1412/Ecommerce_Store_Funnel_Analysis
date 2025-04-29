-- Segment results by Exact category
SELECT 
    category_code,
    COUNT(*) AS products_purchased,
    ROUND(SUM(price), 2) AS total_revenue
FROM EcommerceAnalytics.dbo.ecommerce_user_events_oct_2019
WHERE event_type = 'purchase'
  AND category_code IS NOT NULL
GROUP BY category_code
ORDER BY products_purchased DESC;