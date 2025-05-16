
  
  

  
  USE [WALMART_RAW];
  EXEC('create view 

    [dbt_test__audit.testview_8f269f90aa8f02b286a55ab9bcabca4c]
   as 
    
    



select store_id
from "WALMART_MASTER"."master"."dimTienda"
where store_id is null


;')
  select
    count(*) as failures,
    case when count(*) != 0
      then 'true' else 'false' end as should_warn,
    case when count(*) != 0
      then 'true' else 'false' end as should_error
  from (
    select  * from 

    [dbt_test__audit.testview_8f269f90aa8f02b286a55ab9bcabca4c]
  
  ) dbt_internal_test;

  USE [WALMART_RAW];
  EXEC('drop view 

    [dbt_test__audit.testview_8f269f90aa8f02b286a55ab9bcabca4c]
  ;')