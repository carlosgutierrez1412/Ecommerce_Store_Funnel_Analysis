-- Segment results by brand
SELECT brand,
	COUNT(*) AS total_products,
	ROUND(SUM(price), 2) AS total_revenue
FROM EcommerceAnalytics.dbo.ecommerce_user_events_oct_2019
WHERE event_type = 'purchase'
AND brand IS NOT NULL
GROUP BY brand
ORDER BY total_products DESC