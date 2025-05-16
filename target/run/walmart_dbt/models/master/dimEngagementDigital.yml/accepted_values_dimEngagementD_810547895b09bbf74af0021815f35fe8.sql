
  
  

  
  USE [WALMART_RAW];
  EXEC('create view 

    [dbt_test__audit.testview_80033d795aaac5c06aee9f04c3024f6f]
   as 
    
    

with all_values as (

    select
        social_media_engagement as value_field,
        count(*) as n_records

    from "WALMART_MASTER"."master"."dimEngagementDigital"
    group by social_media_engagement

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

    [dbt_test__audit.testview_80033d795aaac5c06aee9f04c3024f6f]
  
  ) dbt_internal_test;

  USE [WALMART_RAW];
  EXEC('drop view 

    [dbt_test__audit.testview_80033d795aaac5c06aee9f04c3024f6f]
  ;')