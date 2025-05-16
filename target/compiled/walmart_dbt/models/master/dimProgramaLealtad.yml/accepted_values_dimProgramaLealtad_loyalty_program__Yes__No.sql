
    
    

with all_values as (

    select
        loyalty_program as value_field,
        count(*) as n_records

    from "WALMART_MASTER"."master"."dimProgramaLealtad"
    group by loyalty_program

)

select *
from all_values
where value_field not in (
    'Yes','No'
)


