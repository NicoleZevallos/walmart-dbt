with raw as (
  select *
  from raw.raw_walmart_data
)

select
  customer_id,
  avg_purchase_value,
  case
    when lower(purchase_frequency) = 'daily'   then 1
    when lower(purchase_frequency) = 'weekly'  then 2
    when lower(purchase_frequency) = 'monthly' then 3
    when lower(purchase_frequency) = 'yearly'  then 4
    else null
  end as frecuencia_label,
  try_convert(datetime, transaction_date, 103) AS transaction_date,
  try_convert(datetime, last_purchase_date, 103) AS last_purchase_date,
  avg_discount_used,
  online_purchases,
  in_store_purchases,
  avg_transaction_value,
  total_sales,
  total_transactions,
  days_since_last_purchase
from raw