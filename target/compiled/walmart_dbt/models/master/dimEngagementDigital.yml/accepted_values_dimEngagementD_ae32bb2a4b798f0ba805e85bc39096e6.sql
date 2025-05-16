
    
    

with all_values as (

    select
        app_usage as value_field,
        count(*) as n_records

    from "WALMART_MASTER"."master"."dimEngagementDigital"
    group by app_usage

)

select *
from all_values
where value_field not in (
    'High','Medium','Low'
)


