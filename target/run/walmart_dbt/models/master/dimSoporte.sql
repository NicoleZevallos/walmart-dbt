
  
    USE [WALMART_MASTER];
    USE [WALMART_MASTER];
    
    

    

    
    USE [WALMART_MASTER];
    EXEC('
        create view "master"."dimSoporte__dbt_tmp__dbt_tmp_vw" as SELECT DISTINCT
    customer_support_calls,
    customer_id
FROM "WALMART_STAGING"."staging"."stgSoporte";
    ')

EXEC('
            SELECT * INTO "WALMART_MASTER"."master"."dimSoporte__dbt_tmp" FROM "WALMART_MASTER"."master"."dimSoporte__dbt_tmp__dbt_tmp_vw" 
    OPTION (LABEL = ''dbt-sqlserver'');

        ')

    
    EXEC('DROP VIEW IF EXISTS master.dimSoporte__dbt_tmp__dbt_tmp_vw')



    
    use [WALMART_MASTER];
    if EXISTS (
        SELECT *
        FROM sys.indexes with (nolock)
        WHERE name = 'master_dimSoporte__dbt_tmp_cci'
        AND object_id=object_id('master_dimSoporte__dbt_tmp')
    )
    DROP index "master"."dimSoporte__dbt_tmp".master_dimSoporte__dbt_tmp_cci
    CREATE CLUSTERED COLUMNSTORE INDEX master_dimSoporte__dbt_tmp_cci
    ON "master"."dimSoporte__dbt_tmp"

   


  