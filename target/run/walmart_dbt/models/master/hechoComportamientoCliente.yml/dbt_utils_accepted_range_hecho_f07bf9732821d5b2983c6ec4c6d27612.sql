
  
  

  
  USE [WALMART_RAW];
  EXEC('create view 

    [dbt_test__audit.testview_a4f1b4a390b502c5da4e04bddd998830]
   as 

with meet_condition as(
  select *
  from "WALMART_MASTER"."master"."hechoComportamientoCliente"
),

validation_errors as (
  select *
  from meet_condition
  where
    -- never true, defaults to an empty result set. Exists to ensure any combo of the `or` clauses below succeeds
    1 = 2
    -- records with a value >= min_value are permitted. The `not` flips this to find records that don''t meet the rule.
    or not online_purchases >= 0
)

select *
from validation_errors

;')
  select
    count(*) as failures,
    case when count(*) != 0
      then 'true' else 'false' end as should_warn,
    case when count(*) != 0
      then 'true' else 'false' end as should_error
  from (
    select  * from 

    [dbt_test__audit.testview_a4f1b4a390b502c5da4e04bddd998830]
  
  ) dbt_internal_test;

  USE [WALMART_RAW];
  EXEC('drop view 

    [dbt_test__audit.testview_a4f1b4a390b502c5da4e04bddd998830]
  ;')