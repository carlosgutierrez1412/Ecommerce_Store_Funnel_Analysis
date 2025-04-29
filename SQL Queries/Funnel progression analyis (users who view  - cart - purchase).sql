-- Analyze funnel progression (users who viewed > carted > purchased)
WITH viewed_users AS (
SELECT DISTINCT(user_id)
FROM EcommerceAnalytics.dbo.ecommerce_user_events_oct_2019
WHERE event_type = 'view'),

purchased_users AS (
SELECT DISTINCT(user_id)
FROM EcommerceAnalytics.dbo.ecommerce_user_events_oct_2019
WHERE event_type = 'purchase'),

carted_users AS (
SELECT DISTINCT(user_id)
FROM EcommerceAnalytics.dbo.ecommerce_user_events_oct_2019
WHERE event_type = 'cart')

SELECT COUNT(DISTINCT viewed_users.user_id) AS funnel_users
FROM viewed_users
INNER JOIN carted_users ON viewed_users.user_id = carted_users.user_id
INNER JOIN purchased_users ON viewed_users.user_id = purchased_users.user_id;