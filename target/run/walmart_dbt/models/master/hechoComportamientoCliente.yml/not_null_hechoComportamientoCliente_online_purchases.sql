
  
  

  
  USE [WALMART_RAW];
  EXEC('create view 

    [dbt_test__audit.testview_d363a559253ea8a5e3330114d261a6bd]
   as 
    
    



select online_purchases
from "WALMART_MASTER"."master"."hechoComportamientoCliente"
where online_purchases is null


;')
  select
    count(*) as failures,
    case when count(*) != 0
      then 'true' else 'false' end as should_warn,
    case when count(*) != 0
      then 'true' else 'false' end as should_error
  from (
    select  * from 

    [dbt_test__audit.testview_d363a559253ea8a5e3330114d261a6bd]
  
  ) dbt_internal_test;

  USE [WALMART_RAW];
  EXEC('drop view 

    [dbt_test__audit.testview_d363a559253ea8a5e3330114d261a6bd]
  ;')