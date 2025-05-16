
  
  

  
  USE [WALMART_RAW];
  EXEC('create view 

    [dbt_test__audit.testview_ecdbd4a32eb3ac0777e6b2592b445f0d]
   as 
    
    



select customer_id
from "WALMART_MASTER"."master"."dimEngagementDigital"
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

    [dbt_test__audit.testview_ecdbd4a32eb3ac0777e6b2592b445f0d]
  
  ) dbt_internal_test;

  USE [WALMART_RAW];
  EXEC('drop view 

    [dbt_test__audit.testview_ecdbd4a32eb3ac0777e6b2592b445f0d]
  ;')