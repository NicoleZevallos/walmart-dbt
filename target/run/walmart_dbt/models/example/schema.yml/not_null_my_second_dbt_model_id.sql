
  
  

  
  USE [WALMART_RAW];
  EXEC('create view 

    [dbt_test__audit.testview_c877c259b6bc3250af51107682549957]
   as 
    
    



select id
from "WALMART_RAW"."dbo"."my_second_dbt_model"
where id is null


;')
  select
    count(*) as failures,
    case when count(*) != 0
      then 'true' else 'false' end as should_warn,
    case when count(*) != 0
      then 'true' else 'false' end as should_error
  from (
    select  * from 

    [dbt_test__audit.testview_c877c259b6bc3250af51107682549957]
  
  ) dbt_internal_test;

  USE [WALMART_RAW];
  EXEC('drop view 

    [dbt_test__audit.testview_c877c259b6bc3250af51107682549957]
  ;')