
  
  

  
  USE [WALMART_RAW];
  EXEC('create view 

    [dbt_test__audit.testview_34ad53b86b8c9ffeb2013035b98291f3]
   as 
    
    



select customer_id
from "WALMART_MASTER"."master"."dimProgramaLealtad"
where customer_id is null


;')
  select
    count(*) as failures,
    case when count(*) != 0
      then 'true' else 'false' end as should_warn,
    case when count(*) != 0
      then 'true' else 'false' end as should_error
  from (
    select  * from 

    [dbt_test__audit.testview_34ad53b86b8c9ffeb2013035b98291f3]
  
  ) dbt_internal_test;

  USE [WALMART_RAW];
  EXEC('drop view 

    [dbt_test__audit.testview_34ad53b86b8c9ffeb2013035b98291f3]
  ;')