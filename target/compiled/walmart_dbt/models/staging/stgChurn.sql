SELECT DISTINCT
    customer_id,
    days_since_last_purchase,
    churned AS churn_status
FROM "WALMART_RAW"."raw"."raw_walmart_data"