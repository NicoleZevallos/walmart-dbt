
    
    

with all_values as (

    select
        nombre_dia as value_field,
        count(*) as n_records

    from "WALMART_MASTER"."master"."dimTiempo"
    group by nombre_dia

)

select *
from all_values
where value_field not in (
    'Monday','Tuesday','Wednesday','Thursday','Friday','Saturday','Sunday'
)


