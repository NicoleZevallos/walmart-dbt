
  
  

  
  USE [WALMART_RAW];
  EXEC('create view 

    [dbt_test__audit.testview_72f45f4f3eaa9b3d10a5f3f224b91d50]
   as 
    
    



select in_store_purchases
from "WALMART_MASTER"."master"."hechoComportamientoCliente"
where in_store_purchases is null


;')
  select
    count(*) as failures,
    case when count(*) != 0
      then 'true' else 'false' end as should_warn,
    case when count(*) != 0
      then 'true' else 'false' end as should_error
  from (
    select  * from 

    [dbt_test__audit.testview_72f45f4f3eaa9b3d10a5f3f224b91d50]
  
  ) dbt_internal_test;

  USE [WALMART_RAW];
  EXEC('drop view 

    [dbt_test__audit.testview_72f45f4f3eaa9b3d10a5f3f224b91d50]
  ;')