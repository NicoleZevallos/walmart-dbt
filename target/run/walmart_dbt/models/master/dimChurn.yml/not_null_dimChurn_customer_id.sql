
  
  

  
  USE [WALMART_RAW];
  EXEC('create view 

    [dbt_test__audit.testview_84d01daaf49581831692471e67b6578d]
   as 
    
    



select customer_id
from "WALMART_MASTER"."master"."dimChurn"
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

    [dbt_test__audit.testview_84d01daaf49581831692471e67b6578d]
  
  ) dbt_internal_test;

  USE [WALMART_RAW];
  EXEC('drop view 

    [dbt_test__audit.testview_84d01daaf49581831692471e67b6578d]
  ;')