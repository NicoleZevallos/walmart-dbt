
  
  

  
  USE [WALMART_RAW];
  EXEC('create view 

    [dbt_test__audit.testview_acafcfe5de0a90b525ccb65b8e565238]
   as 
    
    



select customer_id
from "WALMART_MASTER"."master"."dimSoporte"
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

    [dbt_test__audit.testview_acafcfe5de0a90b525ccb65b8e565238]
  
  ) dbt_internal_test;

  USE [WALMART_RAW];
  EXEC('drop view 

    [dbt_test__audit.testview_acafcfe5de0a90b525ccb65b8e565238]
  ;')