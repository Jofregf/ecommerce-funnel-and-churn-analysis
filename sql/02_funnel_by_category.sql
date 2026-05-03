WITH user_category_events AS (
    SELECT
        category_code,
        user_id,
        MAX(CASE WHEN event_type = 'view' THEN 1 ELSE 0 END) AS viewed,
        MAX(CASE WHEN event_type = 'cart' THEN 1 ELSE 0 END) AS carted,
        MAX(CASE WHEN event_type = 'purchase' THEN 1 ELSE 0 END) AS purchased
    FROM events
    WHERE category_code IS NOT NULL
    GROUP BY category_code, user_id
)

SELECT
    category_code,
    COUNT (*) AS users,
    SUM(viewed) AS views,
    SUM(CASE WHEN viewed = 1 AND carted = 1 THEN 1 ELSE 0 END) AS carts,
    SUM(CASE WHEN viewed = 1 AND carted = 1 AND purchased = 1 THEN 1 ELSE 0 END) AS purchases
FROM user_category_events
GROUP BY category_code;
