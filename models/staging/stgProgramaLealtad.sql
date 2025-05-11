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