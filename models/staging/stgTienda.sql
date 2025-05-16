<<<<<<< HEAD
with raw as (
  select *
  from {{ ref('raw_walmart_data') }}
)

select
  row_number() over (order by store_location) as store_id,
  store_location
from (
  select distinct store_location
  from raw
) t
=======
WITH raw AS (
    SELECT *
    FROM {{ ref('raw_walmart_data') }}
)

SELECT 
    row_number() OVER (ORDER BY store_location) AS store_id,
    store_location
FROM (
    SELECT DISTINCT store_location
    FROM raw
) t
>>>>>>> 7993812 (Primer commit del proyecto walmart_dbt)
