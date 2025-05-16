
  
    USE [WALMART_MASTER];
    USE [WALMART_MASTER];
    
    

    

    
    USE [WALMART_MASTER];
    EXEC('
        create view "master"."dimEngagementDigital__dbt_tmp__dbt_tmp_vw" as SELECT DISTINCT
    email_subscriptions,
    app_usage,
    website_visits,
    social_media_engagement,
    customer_id
FROM "WALMART_STAGING"."staging"."stgEngagementDigital";
    ')

EXEC('
            SELECT * INTO "WALMART_MASTER"."master"."dimEngagementDigital__dbt_tmp" FROM "WALMART_MASTER"."master"."dimEngagementDigital__dbt_tmp__dbt_tmp_vw" 
    OPTION (LABEL = ''dbt-sqlserver'');

        ')

    
    EXEC('DROP VIEW IF EXISTS master.dimEngagementDigital__dbt_tmp__dbt_tmp_vw')



    
    use [WALMART_MASTER];
    if EXISTS (
        SELECT *
        FROM sys.indexes with (nolock)
        WHERE name = 'master_dimEngagementDigital__dbt_tmp_cci'
        AND object_id=object_id('master_dimEngagementDigital__dbt_tmp')
    )
    DROP index "master"."dimEngagementDigital__dbt_tmp".master_dimEngagementDigital__dbt_tmp_cci
    CREATE CLUSTERED COLUMNSTORE INDEX master_dimEngagementDigital__dbt_tmp_cci
    ON "master"."dimEngagementDigital__dbt_tmp"

   


  