WITH raw AS (
    SELECT *
    FROM "WALMART_RAW"."raw"."raw_walmart_data"
)

SELECT 
    row_number() OVER (ORDER BY store_location) AS store_id,
    store_location
FROM (
    SELECT DISTINCT store_location
    FROM raw
) t