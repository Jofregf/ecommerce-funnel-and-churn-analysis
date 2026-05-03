WITH events_with_price_range AS (
    SELECT *,
        CASE
            WHEN price < 50 THEN '0-50'
            WHEN price < 150 THEN '50-150'
            WHEN price < 300 THEN '150-300'
            WHEN price < 600 THEN '300-600'
            WHEN price < 1000 THEN '600-1000'
            ELSE '1000+'
        END AS price_range
    FROM events
),

price_purchases AS (
    SELECT
        price_range,
        user_id,
        COUNT(*) AS purchase_count
    FROM events_with_price_range
    WHERE event_type = 'purchase'
    GROUP BY price_range, user_id
)

SELECT
    price_range,
    AVG(CASE WHEN purchase_count = 1 THEN 1.0 ELSE 0.0 END) AS churn_rate
FROM price_purchases
GROUP BY price_range
ORDER BY churn_rate DESC;