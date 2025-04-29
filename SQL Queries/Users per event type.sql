-- Identify Users per Event Type
SELECT 
event_type,
COUNT(DISTINCT(user_id)) AS users_per_event_type
FROM EcommerceAnalytics.dbo.ecommerce_user_events_oct_2019
GROUP BY event_type
ORDER BY event_type DESC