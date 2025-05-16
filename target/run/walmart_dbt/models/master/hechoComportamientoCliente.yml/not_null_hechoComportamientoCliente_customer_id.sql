
  
  

  
  USE [WALMART_RAW];
  EXEC('create view 

    [dbt_test__audit.testview_34426ad9ead5113e6ce8985fdd27f6f7]
   as 
    
    



select customer_id
from "WALMART_MASTER"."master"."hechoComportamientoCliente"
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

    [dbt_test__audit.testview_34426ad9ead5113e6ce8985fdd27f6f7]
  
  ) dbt_internal_test;

  USE [WALMART_RAW];
  EXEC('drop view 

    [dbt_test__audit.testview_34426ad9ead5113e6ce8985fdd27f6f7]
  ;')