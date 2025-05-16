
  
  

  
  USE [WALMART_RAW];
  EXEC('create view 

    [dbt_test__audit.testview_a9d608bb131c26a9207a142d5442d18b]
   as 
    
    



select dia
from "WALMART_MASTER"."master"."dimTiempo"
where dia is null


;')
  select
    count(*) as failures,
    case when count(*) != 0
      then 'true' else 'false' end as should_warn,
    case when count(*) != 0
      then 'true' else 'false' end as should_error
  from (
    select  * from 

    [dbt_test__audit.testview_a9d608bb131c26a9207a142d5442d18b]
  
  ) dbt_internal_test;

  USE [WALMART_RAW];
  EXEC('drop view 

    [dbt_test__audit.testview_a9d608bb131c26a9207a142d5442d18b]
  ;')