WITH raw AS (
    SELECT *
    FROM "WALMART_RAW"."raw"."raw_walmart_data"
)

SELECT DISTINCT
    customer_id,
    customer_city
FROM raw