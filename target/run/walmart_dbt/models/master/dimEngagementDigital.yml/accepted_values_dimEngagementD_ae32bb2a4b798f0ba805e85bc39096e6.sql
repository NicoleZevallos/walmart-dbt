
  
  

  
  USE [WALMART_RAW];
  EXEC('create view 

    [dbt_test__audit.testview_2cdff9995a88b4180b78b5d0adefa80b]
   as 
    
    

with all_values as (

    select
        app_usage as value_field,
        count(*) as n_records

    from "WALMART_MASTER"."master"."dimEngagementDigital"
    group by app_usage

)

select *
from all_values
where value_field not in (
    ''High'',''Medium'',''Low''
)


;')
  select
    count(*) as failures,
    case when count(*) != 0
      then 'true' else 'false' end as should_warn,
    case when count(*) != 0
      then 'true' else 'false' end as should_error
  from (
    select  * from 

    [dbt_test__audit.testview_2cdff9995a88b4180b78b5d0adefa80b]
  
  ) dbt_internal_test;

  USE [WALMART_RAW];
  EXEC('drop view 

    [dbt_test__audit.testview_2cdff9995a88b4180b78b5d0adefa80b]
  ;')