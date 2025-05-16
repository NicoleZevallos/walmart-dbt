
  
  

  
  USE [WALMART_RAW];
  EXEC('create view 

    [dbt_test__audit.testview_a3c7ebb7ce38c3e7e46ba5a81c3db1b5]
   as 
    
    



select mes
from "WALMART_MASTER"."master"."dimTiempo"
where mes is null


;')
  select
    count(*) as failures,
    case when count(*) != 0
      then 'true' else 'false' end as should_warn,
    case when count(*) != 0
      then 'true' else 'false' end as should_error
  from (
    select  * from 

    [dbt_test__audit.testview_a3c7ebb7ce38c3e7e46ba5a81c3db1b5]
  
  ) dbt_internal_test;

  USE [WALMART_RAW];
  EXEC('drop view 

    [dbt_test__audit.testview_a3c7ebb7ce38c3e7e46ba5a81c3db1b5]
  ;')