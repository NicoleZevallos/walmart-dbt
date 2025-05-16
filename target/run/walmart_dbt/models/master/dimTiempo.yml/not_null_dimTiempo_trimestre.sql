
  
  

  
  USE [WALMART_RAW];
  EXEC('create view 

    [dbt_test__audit.testview_10433be81c1037a39741b58dbdab0969]
   as 
    
    



select trimestre
from "WALMART_MASTER"."master"."dimTiempo"
where trimestre is null


;')
  select
    count(*) as failures,
    case when count(*) != 0
      then 'true' else 'false' end as should_warn,
    case when count(*) != 0
      then 'true' else 'false' end as should_error
  from (
    select  * from 

    [dbt_test__audit.testview_10433be81c1037a39741b58dbdab0969]
  
  ) dbt_internal_test;

  USE [WALMART_RAW];
  EXEC('drop view 

    [dbt_test__audit.testview_10433be81c1037a39741b58dbdab0969]
  ;')