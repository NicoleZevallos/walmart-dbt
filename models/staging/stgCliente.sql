with raw as (
  select *
  from {{ ref('raw_walmart_data') }}
)

select distinct
  customer_id,
  customer_city
from raw