
    
    

select
    store_id as unique_field,
    count(*) as n_records

from "WALMART_MASTER"."master"."dimTienda"
where store_id is not null
group by store_id
having count(*) > 1


