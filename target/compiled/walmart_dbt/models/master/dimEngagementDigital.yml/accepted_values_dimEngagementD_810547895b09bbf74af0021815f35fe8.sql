
    
    

with all_values as (

    select
        social_media_engagement as value_field,
        count(*) as n_records

    from "WALMART_MASTER"."master"."dimEngagementDigital"
    group by social_media_engagement

)

select *
from all_values
where value_field not in (
    'High','Medium','Low'
)


