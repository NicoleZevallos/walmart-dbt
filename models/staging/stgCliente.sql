<<<<<<< HEAD
with raw as (
  select *
  from {{ ref('raw_walmart_data') }}
)

select distinct
  customer_id,
  customer_city
from raw
=======
WITH raw AS (
    SELECT *
    FROM {{ ref('raw_walmart_data') }}
)

SELECT DISTINCT
    customer_id,
    customer_city
FROM raw
>>>>>>> 7993812 (Primer commit del proyecto walmart_dbt)
