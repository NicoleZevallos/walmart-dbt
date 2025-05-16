
  
  

  
  USE [WALMART_RAW];
  EXEC('create view 

    [dbt_test__audit.testview_82b1a3e88555713e0625accd976063e1]
   as 
    
    

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
    ''Monday'',''Tuesday'',''Wednesday'',''Thursday'',''Friday'',''Saturday'',''Sunday''
)


;')
  select
    count(*) as failures,
    case when count(*) != 0
      then 'true' else 'false' end as should_warn,
    case when count(*) != 0
      then 'true' else 'false' end as should_error
  from (
    select  * from 

    [dbt_test__audit.testview_82b1a3e88555713e0625accd976063e1]
  
  ) dbt_internal_test;

  USE [WALMART_RAW];
  EXEC('drop view 

    [dbt_test__audit.testview_82b1a3e88555713e0625accd976063e1]
  ;')