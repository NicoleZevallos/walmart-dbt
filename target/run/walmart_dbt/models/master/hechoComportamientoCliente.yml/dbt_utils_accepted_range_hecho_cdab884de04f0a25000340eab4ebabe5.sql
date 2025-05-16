
  
  

  
  USE [WALMART_RAW];
  EXEC('create view 

    [dbt_test__audit.testview_15b36ce613e226d2ed684c137c5744f6]
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
    or not in_store_purchases >= 0
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

    [dbt_test__audit.testview_15b36ce613e226d2ed684c137c5744f6]
  
  ) dbt_internal_test;

  USE [WALMART_RAW];
  EXEC('drop view 

    [dbt_test__audit.testview_15b36ce613e226d2ed684c137c5744f6]
  ;')