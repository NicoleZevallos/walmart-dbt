select distinct
    customer_id,
    customer_support_calls
from "WALMART_RAW"."raw"."raw_walmart_data"
where customer_support_calls is not null