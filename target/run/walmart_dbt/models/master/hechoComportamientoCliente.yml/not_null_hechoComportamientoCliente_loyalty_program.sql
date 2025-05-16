
  
  

  
  USE [WALMART_RAW];
  EXEC('create view 

    [dbt_test__audit.testview_fe2ee0c0e65229bf408d9cbd449acc57]
   as 
    
    



select loyalty_program
from "WALMART_MASTER"."master"."hechoComportamientoCliente"
where loyalty_program is null


;')
  select
    count(*) as failures,
    case when count(*) != 0
      then 'true' else 'false' end as should_warn,
    case when count(*) != 0
      then 'true' else 'false' end as should_error
  from (
    select  * from 

    [dbt_test__audit.testview_fe2ee0c0e65229bf408d9cbd449acc57]
  
  ) dbt_internal_test;

  USE [WALMART_RAW];
  EXEC('drop view 

    [dbt_test__audit.testview_fe2ee0c0e65229bf408d9cbd449acc57]
  ;')