
  
  

  
  USE [WALMART_RAW];
  EXEC('create view 

    [dbt_test__audit.testview_9bb0813e34bd2f92296a9e930da993ca]
   as 
    
    



select store_id
from "WALMART_MASTER"."master"."dimProgramaLealtad"
where store_id is null


;')
  select
    count(*) as failures,
    case when count(*) != 0
      then 'true' else 'false' end as should_warn,
    case when count(*) != 0
      then 'true' else 'false' end as should_error
  from (
    select  * from 

    [dbt_test__audit.testview_9bb0813e34bd2f92296a9e930da993ca]
  
  ) dbt_internal_test;

  USE [WALMART_RAW];
  EXEC('drop view 

    [dbt_test__audit.testview_9bb0813e34bd2f92296a9e930da993ca]
  ;')