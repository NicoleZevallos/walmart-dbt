select distinct
  customer_id,
  customer_support_calls
from raw.raw_walmart_data
where customer_support_calls is not null