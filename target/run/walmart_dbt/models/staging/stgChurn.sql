
  
    USE [WALMART_STAGING];
    USE [WALMART_STAGING];
    
    

    

    
    USE [WALMART_STAGING];
    EXEC('
        create view "staging"."stgChurn__dbt_tmp__dbt_tmp_vw" as SELECT DISTINCT
    customer_id,
    days_since_last_purchase,
    churned AS churn_status
FROM "WALMART_RAW"."raw"."raw_walmart_data";
    ')

EXEC('
            SELECT * INTO "WALMART_STAGING"."staging"."stgChurn__dbt_tmp" FROM "WALMART_STAGING"."staging"."stgChurn__dbt_tmp__dbt_tmp_vw" 
    OPTION (LABEL = ''dbt-sqlserver'');

        ')

    
    EXEC('DROP VIEW IF EXISTS staging.stgChurn__dbt_tmp__dbt_tmp_vw')



    
    use [WALMART_STAGING];
    if EXISTS (
        SELECT *
        FROM sys.indexes with (nolock)
        WHERE name = 'staging_stgChurn__dbt_tmp_cci'
        AND object_id=object_id('staging_stgChurn__dbt_tmp')
    )
    DROP index "staging"."stgChurn__dbt_tmp".staging_stgChurn__dbt_tmp_cci
    CREATE CLUSTERED COLUMNSTORE INDEX staging_stgChurn__dbt_tmp_cci
    ON "staging"."stgChurn__dbt_tmp"

   


  