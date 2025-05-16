
  
  

  
  USE [WALMART_RAW];
  EXEC('create view 

    [dbt_test__audit.testview_68d8bcb33ba05f5a797ef720155cd1e7]
   as 
    
    



select churn_status
from "WALMART_MASTER"."master"."dimChurn"
where churn_status is null


;')
  select
    count(*) as failures,
    case when count(*) != 0
      then 'true' else 'false' end as should_warn,
    case when count(*) != 0
      then 'true' else 'false' end as should_error
  from (
    select  * from 

    [dbt_test__audit.testview_68d8bcb33ba05f5a797ef720155cd1e7]
  
  ) dbt_internal_test;

  USE [WALMART_RAW];
  EXEC('drop view 

    [dbt_test__audit.testview_68d8bcb33ba05f5a797ef720155cd1e7]
  ;')