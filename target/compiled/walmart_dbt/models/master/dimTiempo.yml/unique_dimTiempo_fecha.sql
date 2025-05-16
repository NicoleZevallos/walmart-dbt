
    
    

select
    fecha as unique_field,
    count(*) as n_records

from "WALMART_MASTER"."master"."dimTiempo"
where fecha is not null
group by fecha
having count(*) > 1


