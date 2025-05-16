
  
  

  
  USE [WALMART_RAW];
  EXEC('create view 

    [dbt_test__audit.testview_f16bce8eedeb01e49dae099ec4fb8022]
   as 
    
    

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
    ''Yes'',''No''
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

    [dbt_test__audit.testview_f16bce8eedeb01e49dae099ec4fb8022]
  
  ) dbt_internal_test;

  USE [WALMART_RAW];
  EXEC('drop view 

    [dbt_test__audit.testview_f16bce8eedeb01e49dae099ec4fb8022]
  ;')