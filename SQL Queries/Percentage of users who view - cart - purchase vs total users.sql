-- Percentage of users who viewed > carted > purchased vs all of users
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
WHERE event_type = 'cart'),

funnel_users AS (
    SELECT vu.user_id
    FROM viewed_users AS vu
    INNER JOIN carted_users cu ON vu.user_id = cu.user_id
    INNER JOIN purchased_users pu ON vu.user_id = pu.user_id
)

SELECT
COUNT(DISTINCT fu.user_id) AS funnel_users,
(SELECT COUNT(DISTINCT user_id) FROM EcommerceAnalytics.dbo.ecommerce_user_events_oct_2019) AS total_users,
(COUNT(DISTINCT fu.user_id) * 100.0) / 
(SELECT COUNT(DISTINCT user_id) FROM EcommerceAnalytics.dbo.ecommerce_user_events_oct_2019) AS conversion_percentage
FROM funnel_users AS fu;