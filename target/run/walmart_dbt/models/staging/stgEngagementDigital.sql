
  
    USE [WALMART_STAGING];
    USE [WALMART_STAGING];
    
    

    

    
    USE [WALMART_STAGING];
    EXEC('
        create view "staging"."stgEngagementDigital__dbt_tmp__dbt_tmp_vw" as WITH raw AS (
    SELECT *
    FROM "WALMART_RAW"."raw"."raw_walmart_data"
)

SELECT DISTINCT
    customer_id,
    email_subscriptions,
    app_usage,
    website_visits,
    social_media_engagement
FROM raw;
    ')

EXEC('
            SELECT * INTO "WALMART_STAGING"."staging"."stgEngagementDigital__dbt_tmp" FROM "WALMART_STAGING"."staging"."stgEngagementDigital__dbt_tmp__dbt_tmp_vw" 
    OPTION (LABEL = ''dbt-sqlserver'');

        ')

    
    EXEC('DROP VIEW IF EXISTS staging.stgEngagementDigital__dbt_tmp__dbt_tmp_vw')



    
    use [WALMART_STAGING];
    if EXISTS (
        SELECT *
        FROM sys.indexes with (nolock)
        WHERE name = 'staging_stgEngagementDigital__dbt_tmp_cci'
        AND object_id=object_id('staging_stgEngagementDigital__dbt_tmp')
    )
    DROP index "staging"."stgEngagementDigital__dbt_tmp".staging_stgEngagementDigital__dbt_tmp_cci
    CREATE CLUSTERED COLUMNSTORE INDEX staging_stgEngagementDigital__dbt_tmp_cci
    ON "staging"."stgEngagementDigital__dbt_tmp"

   


  