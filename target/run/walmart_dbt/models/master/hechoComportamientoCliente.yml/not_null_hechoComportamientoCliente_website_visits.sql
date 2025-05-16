
  
  

  
  USE [WALMART_RAW];
  EXEC('create view 

    [dbt_test__audit.testview_69e8d57c3cb6cd2244edc53640c1d36b]
   as 
    
    



select website_visits
from "WALMART_MASTER"."master"."hechoComportamientoCliente"
where website_visits is null


;')
  select
    count(*) as failures,
    case when count(*) != 0
      then 'true' else 'false' end as should_warn,
    case when count(*) != 0
      then 'true' else 'false' end as should_error
  from (
    select  * from 

    [dbt_test__audit.testview_69e8d57c3cb6cd2244edc53640c1d36b]
  
  ) dbt_internal_test;

  USE [WALMART_RAW];
  EXEC('drop view 

    [dbt_test__audit.testview_69e8d57c3cb6cd2244edc53640c1d36b]
  ;')