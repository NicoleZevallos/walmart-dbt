WITH raw AS (
    SELECT *
    FROM "WALMART_RAW"."raw"."raw_walmart_data"
),
store AS (
    SELECT *
    FROM "WALMART_STAGING"."staging"."stgTienda"
)

SELECT DISTINCT
    raw.customer_id,
    raw.loyalty_program,
    raw.membership_years,
    store.store_id AS preferred_store_id
FROM raw
LEFT JOIN store
    ON raw.store_location = store.store_location
WHERE raw.loyalty_program IS NOT NULL