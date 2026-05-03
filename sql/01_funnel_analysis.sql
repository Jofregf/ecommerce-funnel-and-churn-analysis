WITH user_events AS (
    SELECT
        user_id,
        MAX(CASE WHEN event_type = 'view' THEN 1 ELSE 0 END) AS viewed,
        MAX(CASE WHEN event_type = 'cart' THEN 1 ELSE 0 END) AS carted,
        MAX(CASE WHEN event_type = 'purchase' THEN 1 ELSE 0 END) AS purchesed
    FROM events
    GROUP BY user_id
)

SELECT
    COUNT(*) AS total_users,
    SUM(viewed) AS views,
    SUM(CASE WHEN viewed = 1 AND carted = 1 THEN 1 ELSE 0 END) AS carts,
    SUM(CASE WHEN viewed = 1 AND purchesed = 1 THEN 1 ELSE 0 END) AS purchases
FROM user_events;