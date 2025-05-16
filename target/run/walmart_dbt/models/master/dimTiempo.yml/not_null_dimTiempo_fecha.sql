
  
  

  
  USE [WALMART_RAW];
  EXEC('create view 

    [dbt_test__audit.testview_0222be43e44e336b5f3101091152869a]
   as 
    
    



select fecha
from "WALMART_MASTER"."master"."dimTiempo"
where fecha is null


;')
  select
    count(*) as failures,
    case when count(*) != 0
      then 'true' else 'false' end as should_warn,
    case when count(*) != 0
      then 'true' else 'false' end as should_error
  from (
    select  * from 

    [dbt_test__audit.testview_0222be43e44e336b5f3101091152869a]
  
  ) dbt_internal_test;

  USE [WALMART_RAW];
  EXEC('drop view 

    [dbt_test__audit.testview_0222be43e44e336b5f3101091152869a]
  ;')