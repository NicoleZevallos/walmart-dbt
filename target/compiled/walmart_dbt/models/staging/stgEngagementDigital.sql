WITH raw AS (
    SELECT *
    FROM "WALMART_RAW"."raw"."raw_walmart_data"
)

SELECT DISTINCT
    customer_id,
    email_subscriptions,
    app_usage,
    website_visits,
    social_media_engagement
FROM raw