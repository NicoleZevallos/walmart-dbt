<<<<<<< HEAD
with raw as (
  select *
  from {{ ref('raw_walmart_data') }}
)

select distinct
  customer_id,
  email_subscriptions,
  app_usage,
  website_visits,
  social_media_engagement
from raw
=======
WITH raw AS (
    SELECT *
    FROM {{ ref('raw_walmart_data') }}
)

SELECT DISTINCT
    customer_id,
    email_subscriptions,
    app_usage,
    website_visits,
    social_media_engagement
FROM raw
>>>>>>> 7993812 (Primer commit del proyecto walmart_dbt)
