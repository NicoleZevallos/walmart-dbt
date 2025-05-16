
  
  

  
  USE [WALMART_RAW];
  EXEC('create view 

    [dbt_test__audit.testview_5b9cd68c43927afbbfd7e1686a732b86]
   as 
    
    



select store_location
from "WALMART_MASTER"."master"."dimTienda"
where store_location is null


;')
  select
    count(*) as failures,
    case when count(*) != 0
      then 'true' else 'false' end as should_warn,
    case when count(*) != 0
      then 'true' else 'false' end as should_error
  from (
    select  * from 

    [dbt_test__audit.testview_5b9cd68c43927afbbfd7e1686a732b86]
  
  ) dbt_internal_test;

  USE [WALMART_RAW];
  EXEC('drop view 

    [dbt_test__audit.testview_5b9cd68c43927afbbfd7e1686a732b86]
  ;')