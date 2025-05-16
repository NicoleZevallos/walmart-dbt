
  
  

  
  USE [WALMART_RAW];
  EXEC('create view 

    [dbt_test__audit.testview_f23a33512b5ef9668ccbb29b52828bda]
   as 
    
    

with all_values as (

    select
        churn_status as value_field,
        count(*) as n_records

    from "WALMART_MASTER"."master"."hechoComportamientoCliente"
    group by churn_status

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

    [dbt_test__audit.testview_f23a33512b5ef9668ccbb29b52828bda]
  
  ) dbt_internal_test;

  USE [WALMART_RAW];
  EXEC('drop view 

    [dbt_test__audit.testview_f23a33512b5ef9668ccbb29b52828bda]
  ;')