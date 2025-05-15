with raw as (
  select *
  from raw.raw_walmart_data
)

select
  row_number() over (order by store_location) as store_id,
  store_location
from (
  select distinct store_location
  from raw
) t