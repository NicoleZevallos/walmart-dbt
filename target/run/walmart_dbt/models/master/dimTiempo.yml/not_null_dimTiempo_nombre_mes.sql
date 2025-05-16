
  
  

  
  USE [WALMART_RAW];
  EXEC('create view 

    [dbt_test__audit.testview_7c379dca31d1501143d81b8044655afe]
   as 
    
    



select nombre_mes
from "WALMART_MASTER"."master"."dimTiempo"
where nombre_mes is null


;')
  select
    count(*) as failures,
    case when count(*) != 0
      then 'true' else 'false' end as should_warn,
    case when count(*) != 0
      then 'true' else 'false' end as should_error
  from (
    select  * from 

    [dbt_test__audit.testview_7c379dca31d1501143d81b8044655afe]
  
  ) dbt_internal_test;

  USE [WALMART_RAW];
  EXEC('drop view 

    [dbt_test__audit.testview_7c379dca31d1501143d81b8044655afe]
  ;')