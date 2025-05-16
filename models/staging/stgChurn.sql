<<<<<<< HEAD
select distinct
  customer_id,
  days_since_last_purchase,
  churned as churn_status
from {{ ref('raw_walmart_data') }}
=======
SELECT DISTINCT
    customer_id,
    days_since_last_purchase,
    churned AS churn_status
FROM {{ ref('raw_walmart_data') }}
>>>>>>> 7993812 (Primer commit del proyecto walmart_dbt)
