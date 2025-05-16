
  
  

  
  USE [WALMART_RAW];
  EXEC('create view 

    [dbt_test__audit.testview_34984172f58fa69426c40926733485c2]
   as 
    
    



select año
from "WALMART_MASTER"."master"."dimTiempo"
where año is null


;')
  select
    count(*) as failures,
    case when count(*) != 0
      then 'true' else 'false' end as should_warn,
    case when count(*) != 0
      then 'true' else 'false' end as should_error
  from (
    select  * from 

    [dbt_test__audit.testview_34984172f58fa69426c40926733485c2]
  
  ) dbt_internal_test;

  USE [WALMART_RAW];
  EXEC('drop view 

    [dbt_test__audit.testview_34984172f58fa69426c40926733485c2]
  ;')