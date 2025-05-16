
  
  

  
  USE [WALMART_RAW];
  EXEC('create view 

    [dbt_test__audit.testview_148bd2327a284e991d2d72a5fc3ac352]
   as 
    
    



select avg_discount_used
from "WALMART_MASTER"."master"."hechoComportamientoCliente"
where avg_discount_used is null


;')
  select
    count(*) as failures,
    case when count(*) != 0
      then 'true' else 'false' end as should_warn,
    case when count(*) != 0
      then 'true' else 'false' end as should_error
  from (
    select  * from 

    [dbt_test__audit.testview_148bd2327a284e991d2d72a5fc3ac352]
  
  ) dbt_internal_test;

  USE [WALMART_RAW];
  EXEC('drop view 

    [dbt_test__audit.testview_148bd2327a284e991d2d72a5fc3ac352]
  ;')