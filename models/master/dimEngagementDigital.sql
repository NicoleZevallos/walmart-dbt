SELECT DISTINCT
    email_subscriptions,
    app_usage,
    website_visits,
    social_media_engagement,
    customer_id
FROM {{ ref('stgEngagementDigital') }}