
  
  

  
  USE [WALMART_RAW];
  EXEC('create view 

    [dbt_test__audit.testview_57f06ee525d5ca7880bb09d87252d675]
   as 
    
    

select
    id as unique_field,
    count(*) as n_records

from "WALMART_RAW"."dbo"."my_first_dbt_model"
where id is not null
group by id
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

    [dbt_test__audit.testview_57f06ee525d5ca7880bb09d87252d675]
  
  ) dbt_internal_test;

  USE [WALMART_RAW];
  EXEC('drop view 

    [dbt_test__audit.testview_57f06ee525d5ca7880bb09d87252d675]
  ;')