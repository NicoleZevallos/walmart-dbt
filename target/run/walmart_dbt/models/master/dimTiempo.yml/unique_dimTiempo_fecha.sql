
  
  

  
  USE [WALMART_RAW];
  EXEC('create view 

    [dbt_test__audit.testview_3da79cdc7104672c36486e9305ac2884]
   as 
    
    

select
    fecha as unique_field,
    count(*) as n_records

from "WALMART_MASTER"."master"."dimTiempo"
where fecha is not null
group by fecha
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

    [dbt_test__audit.testview_3da79cdc7104672c36486e9305ac2884]
  
  ) dbt_internal_test;

  USE [WALMART_RAW];
  EXEC('drop view 

    [dbt_test__audit.testview_3da79cdc7104672c36486e9305ac2884]
  ;')