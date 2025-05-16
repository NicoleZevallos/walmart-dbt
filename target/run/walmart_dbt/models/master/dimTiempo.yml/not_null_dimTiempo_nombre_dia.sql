
  
  

  
  USE [WALMART_RAW];
  EXEC('create view 

    [dbt_test__audit.testview_edf726ee43094876cd2f14787fc7e58f]
   as 
    
    



select nombre_dia
from "WALMART_MASTER"."master"."dimTiempo"
where nombre_dia is null


;')
  select
    count(*) as failures,
    case when count(*) != 0
      then 'true' else 'false' end as should_warn,
    case when count(*) != 0
      then 'true' else 'false' end as should_error
  from (
    select  * from 

    [dbt_test__audit.testview_edf726ee43094876cd2f14787fc7e58f]
  
  ) dbt_internal_test;

  USE [WALMART_RAW];
  EXEC('drop view 

    [dbt_test__audit.testview_edf726ee43094876cd2f14787fc7e58f]
  ;')