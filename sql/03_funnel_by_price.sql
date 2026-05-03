WITH events_with_price_range AS (
    SELECT *,
        CASE
            WHEN price < 50 THEN '0-50'
            WHEN price < 150 THEN '50-150'
            WHEN price < 300 THEN '150-300'
            WHEN price < 600 THEN '300-600'
            WHEN price < 1000 THEN '600-1000'
            ELSE '1000+'
        ENS AS price_range
    FROM events
),

user_price_events AS (
    SELECT
        price_range,
        user_id,
        MAX(CASE WHEN event_type = 'view' THEN 1 ELSE 0 END) AS viewed,
        MAX(CASE WHEN event_type = 'cart' THEN 1 ELSE 0 END) AS carted,
        MAX(CASE WHEN event_type = 'purchase' THEN 1 ELSE 0 END) AS purchased
    FROM events_with_price_range
    GROUP BY price_range, user_id
)

SELECT
    price_range,
    COUNT(*) AS users,
    SUM(viewed) AS views,
    SUM(CASE WHEN viewed = 1 AND carted = 1 THEN 1 ELSE 0 END) AS carts,
    SUM(CASE WHEN viewed = 1 AND carted = 1 AND purchased = 1 THEN 1 ELSE 0 END) AS purchases
FROM user_price_events
GROUP BY price_range;