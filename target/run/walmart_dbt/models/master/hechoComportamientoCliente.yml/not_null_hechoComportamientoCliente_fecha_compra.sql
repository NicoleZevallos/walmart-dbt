
  
  

  
  USE [WALMART_RAW];
  EXEC('create view 

    [dbt_test__audit.testview_66123f3160e65dcd37e0ad51e1d85b8b]
   as 
    
    



select fecha_compra
from "WALMART_MASTER"."master"."hechoComportamientoCliente"
where fecha_compra is null


;')
  select
    count(*) as failures,
    case when count(*) != 0
      then 'true' else 'false' end as should_warn,
    case when count(*) != 0
      then 'true' else 'false' end as should_error
  from (
    select  * from 

    [dbt_test__audit.testview_66123f3160e65dcd37e0ad51e1d85b8b]
  
  ) dbt_internal_test;

  USE [WALMART_RAW];
  EXEC('drop view 

    [dbt_test__audit.testview_66123f3160e65dcd37e0ad51e1d85b8b]
  ;')