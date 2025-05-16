
  
    USE [WALMART_MASTER];
    USE [WALMART_MASTER];
    
    

    

    
    USE [WALMART_MASTER];
    EXEC('
        create view "master"."dimChurn__dbt_tmp__dbt_tmp_vw" as SELECT DISTINCT
    churn_status,
    customer_id
FROM "WALMART_STAGING"."staging"."stgChurn";
    ')

EXEC('
            SELECT * INTO "WALMART_MASTER"."master"."dimChurn__dbt_tmp" FROM "WALMART_MASTER"."master"."dimChurn__dbt_tmp__dbt_tmp_vw" 
    OPTION (LABEL = ''dbt-sqlserver'');

        ')

    
    EXEC('DROP VIEW IF EXISTS master.dimChurn__dbt_tmp__dbt_tmp_vw')



    
    use [WALMART_MASTER];
    if EXISTS (
        SELECT *
        FROM sys.indexes with (nolock)
        WHERE name = 'master_dimChurn__dbt_tmp_cci'
        AND object_id=object_id('master_dimChurn__dbt_tmp')
    )
    DROP index "master"."dimChurn__dbt_tmp".master_dimChurn__dbt_tmp_cci
    CREATE CLUSTERED COLUMNSTORE INDEX master_dimChurn__dbt_tmp_cci
    ON "master"."dimChurn__dbt_tmp"

   


  