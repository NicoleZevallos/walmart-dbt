<<<<<<< HEAD
with raw as (
  select *
  from {{ ref('raw_walmart_data') }}
),

store as (
  select *
  from {{ ref('stgTienda') }}
)

select distinct
  raw.customer_id,
  raw.loyalty_program,
  raw.membership_years,
  store.store_id as preferred_store_id
from raw
left join store
  on raw.store_location = store.store_location
where raw.loyalty_program is not null
=======
WITH raw AS (
    SELECT *
    FROM {{ ref('raw_walmart_data') }}
),
store AS (
    SELECT *
    FROM {{ ref('stgTienda') }}
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

>>>>>>> 7993812 (Primer commit del proyecto walmart_dbt)
