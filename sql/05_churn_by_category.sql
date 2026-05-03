WITH category_purchases AS (
    SELECT
        category_code,
        user_id,
        COUNT(*) AS purchase_count
    FROM events
    WHERE event_type = 'purchase'
        AND category_code IS NOT NULL
    GROUP BY category_code, user_id
)

SELECT
    category_code,
    AVG(CASE WHEN purchase_count = 1 THEN 1.0 ELSE 0.0 END) AS churn_rate
FROM category_purchases
GROUP BY category_code
ORDER BY churn_rate DESC;