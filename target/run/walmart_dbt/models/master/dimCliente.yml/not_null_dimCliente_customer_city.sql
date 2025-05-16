
  
  

  
  USE [WALMART_RAW];
  EXEC('create view 

    [dbt_test__audit.testview_b974f63f347512cfb4138451914c7267]
   as 
    
    



select customer_city
from "WALMART_MASTER"."master"."dimCliente"
where customer_city is null


;')
  select
    count(*) as failures,
    case when count(*) != 0
      then 'true' else 'false' end as should_warn,
    case when count(*) != 0
      then 'true' else 'false' end as should_error
  from (
    select  * from 

    [dbt_test__audit.testview_b974f63f347512cfb4138451914c7267]
  
  ) dbt_internal_test;

  USE [WALMART_RAW];
  EXEC('drop view 

    [dbt_test__audit.testview_b974f63f347512cfb4138451914c7267]
  ;')