
    
    

with all_values as (

    select
        nombre_mes as value_field,
        count(*) as n_records

    from "WALMART_MASTER"."master"."dimTiempo"
    group by nombre_mes

)

select *
from all_values
where value_field not in (
    'January','February','March','April','May','June','July','August','September','October','November','December'
)


