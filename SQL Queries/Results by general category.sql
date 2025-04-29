-- Segment results by General category
SELECT 
    LEFT(category_code, CHARINDEX('.', category_code + '.') - 1) AS general_category,
    COUNT(*) AS products_purchased,
    ROUND(SUM(price), 2) AS total_revenue
FROM EcommerceAnalytics.dbo.ecommerce_user_events_oct_2019
WHERE event_type = 'purchase'
  AND category_code IS NOT NULL
GROUP BY 
    LEFT(category_code, CHARINDEX('.', category_code + '.') - 1)
ORDER BY products_purchased DESC;

