-- Identify drop-off percentages
-- CTE to get users who added to cart
WITH carted_users AS (
    SELECT DISTINCT user_id
    FROM EcommerceAnalytics.dbo.ecommerce_user_events_oct_2019
    WHERE event_type = 'cart'
),
-- CTE to get users who purchased
purchased_users AS (
    SELECT DISTINCT user_id
    FROM EcommerceAnalytics.dbo.ecommerce_user_events_oct_2019
    WHERE event_type = 'purchase'
),
-- CTE to get users who both carted AND purchased
carted_and_purchased AS (
    SELECT cu.user_id
    FROM carted_users cu
    INNER JOIN purchased_users pu ON cu.user_id = pu.user_id
)

SELECT
    -- Viewers
    (SELECT COUNT(DISTINCT user_id)
     FROM EcommerceAnalytics.dbo.ecommerce_user_events_oct_2019
     WHERE event_type = 'view') AS total_viewers,

    -- Carted
    (SELECT COUNT(DISTINCT user_id)
     FROM carted_users) AS total_carted,

    -- Purchasers
    (SELECT COUNT(DISTINCT user_id)
     FROM purchased_users) AS total_purchasers,

    -- Carted AND Purchased
    (SELECT COUNT(DISTINCT user_id)
     FROM carted_and_purchased) AS carted_and_purchased,

    -- View-to-Cart Conversion
    (
        (SELECT COUNT(DISTINCT user_id)
         FROM carted_users) * 100.0
        /
        (SELECT COUNT(DISTINCT user_id)
         FROM EcommerceAnalytics.dbo.ecommerce_user_events_oct_2019
         WHERE event_type = 'view')
    ) AS view_to_cart_conversion,

    -- View-to-Cart Drop-off
    (
        100.0 -
        (
            (SELECT COUNT(DISTINCT user_id)
             FROM carted_users) * 100.0
            /
            (SELECT COUNT(DISTINCT user_id)
             FROM EcommerceAnalytics.dbo.ecommerce_user_events_oct_2019
             WHERE event_type = 'view')
        )
    ) AS view_to_cart_dropoff,

    -- Cart-to-Purchase Conversion (only users who carted and purchased)
    (
        (SELECT COUNT(DISTINCT user_id)
         FROM carted_and_purchased) * 100.0
        /
        (SELECT COUNT(DISTINCT user_id)
         FROM carted_users)
    ) AS cart_to_purchase_conversion,

    -- Cart-to-Purchase Drop-off
    (
        100.0 -
        (
            (SELECT COUNT(DISTINCT user_id)
             FROM carted_and_purchased) * 100.0
            /
            (SELECT COUNT(DISTINCT user_id)
             FROM carted_users)
        )
    ) AS cart_to_purchase_dropoff;