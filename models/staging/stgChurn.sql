select distinct
  customer_id,
  days_since_last_purchase,
  churned as churn_status
from {{ ref('raw_walmart_data') }}