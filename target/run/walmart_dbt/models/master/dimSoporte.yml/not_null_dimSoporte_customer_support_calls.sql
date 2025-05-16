
  
  

  
  USE [WALMART_RAW];
  EXEC('create view 

    [dbt_test__audit.testview_4504dfa7011461140fa8adcf851696e0]
   as 
    
    



select customer_support_calls
from "WALMART_MASTER"."master"."dimSoporte"
where customer_support_calls is null


;')
  select
    count(*) as failures,
    case when count(*) != 0
      then 'true' else 'false' end as should_warn,
    case when count(*) != 0
      then 'true' else 'false' end as should_error
  from (
    select  * from 

    [dbt_test__audit.testview_4504dfa7011461140fa8adcf851696e0]
  
  ) dbt_internal_test;

  USE [WALMART_RAW];
  EXEC('drop view 

    [dbt_test__audit.testview_4504dfa7011461140fa8adcf851696e0]
  ;')