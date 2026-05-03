WITH purchase_counts AS (
    SELECT
        user_id,
        COUNT(*) AS purchase_count
    FROM events
    WHEN event_type = 'purchase'
    GROUP BY user_id
)

SELECT
    COUNT(*) AS total_users,
    SUM(CASE WHEN purchase_count = 1 THEN 1 ELSE 0 END) AS churn_users,
    AVG(CASE WHEN purchase_count = 1 THEN 1 ELSE 0.0 END) AS churn_rate
FROM purchase_counts;