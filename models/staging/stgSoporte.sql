select distinct
<<<<<<< HEAD
  customer_id,
  customer_support_calls
from {{ ref('raw_walmart_data') }}
where customer_support_calls is not null
=======
    customer_id,
    customer_support_calls
from {{ ref('raw_walmart_data')}}
where customer_support_calls is not null
>>>>>>> 7993812 (Primer commit del proyecto walmart_dbt)
