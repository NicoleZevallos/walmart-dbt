with raw as (
  select *
  from raw.raw_walmart_data
)

select distinct
  customer_id,
  email_subscriptions,
  app_usage,
  website_visits,
  social_media_engagement
from raw