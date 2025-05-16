
  
  

  
  USE [WALMART_RAW];
  EXEC('create view 

    [dbt_test__audit.testview_52e1835a5aa9ae7c932652a3a987bf4d]
   as 
    
    

select
    customer_id as unique_field,
    count(*) as n_records

from "WALMART_MASTER"."master"."dimEngagementDigital"
where customer_id is not null
group by customer_id
having count(*) > 1


;')
  select
    count(*) as failures,
    case when count(*) != 0
      then 'true' else 'false' end as should_warn,
    case when count(*) != 0
      then 'true' else 'false' end as should_error
  from (
    select  * from 

    [dbt_test__audit.testview_52e1835a5aa9ae7c932652a3a987bf4d]
  
  ) dbt_internal_test;

  USE [WALMART_RAW];
  EXEC('drop view 

    [dbt_test__audit.testview_52e1835a5aa9ae7c932652a3a987bf4d]
  ;')