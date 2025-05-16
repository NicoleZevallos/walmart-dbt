
  
  

  
  USE [WALMART_RAW];
  EXEC('create view 

    [dbt_test__audit.testview_2a3eac2c00a50659a4142de2e8eddc6a]
   as 
    
    



select id
from "WALMART_RAW"."dbo"."my_first_dbt_model"
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

    [dbt_test__audit.testview_2a3eac2c00a50659a4142de2e8eddc6a]
  
  ) dbt_internal_test;

  USE [WALMART_RAW];
  EXEC('drop view 

    [dbt_test__audit.testview_2a3eac2c00a50659a4142de2e8eddc6a]
  ;')