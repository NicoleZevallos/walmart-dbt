
  
  

  
  USE [WALMART_RAW];
  EXEC('create view 

    [dbt_test__audit.testview_2331630042d975568b4163439ca290d4]
   as 
    
    

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
    ''January'',''February'',''March'',''April'',''May'',''June'',''July'',''August'',''September'',''October'',''November'',''December''
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

    [dbt_test__audit.testview_2331630042d975568b4163439ca290d4]
  
  ) dbt_internal_test;

  USE [WALMART_RAW];
  EXEC('drop view 

    [dbt_test__audit.testview_2331630042d975568b4163439ca290d4]
  ;')