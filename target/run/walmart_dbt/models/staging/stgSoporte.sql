
  
    USE [WALMART_STAGING];
    USE [WALMART_STAGING];
    
    

    

    
    USE [WALMART_STAGING];
    EXEC('
        create view "staging"."stgSoporte__dbt_tmp__dbt_tmp_vw" as select distinct
    customer_id,
    customer_support_calls
from "WALMART_RAW"."raw"."raw_walmart_data"
where customer_support_calls is not null;
    ')

EXEC('
            SELECT * INTO "WALMART_STAGING"."staging"."stgSoporte__dbt_tmp" FROM "WALMART_STAGING"."staging"."stgSoporte__dbt_tmp__dbt_tmp_vw" 
    OPTION (LABEL = ''dbt-sqlserver'');

        ')

    
    EXEC('DROP VIEW IF EXISTS staging.stgSoporte__dbt_tmp__dbt_tmp_vw')



    
    use [WALMART_STAGING];
    if EXISTS (
        SELECT *
        FROM sys.indexes with (nolock)
        WHERE name = 'staging_stgSoporte__dbt_tmp_cci'
        AND object_id=object_id('staging_stgSoporte__dbt_tmp')
    )
    DROP index "staging"."stgSoporte__dbt_tmp".staging_stgSoporte__dbt_tmp_cci
    CREATE CLUSTERED COLUMNSTORE INDEX staging_stgSoporte__dbt_tmp_cci
    ON "staging"."stgSoporte__dbt_tmp"

   


  