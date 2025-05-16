
  
    USE [WALMART_MASTER];
    USE [WALMART_MASTER];
    
    

    

    
    USE [WALMART_MASTER];
    EXEC('
        create view "master"."dimTienda__dbt_tmp__dbt_tmp_vw" as SELECT DISTINCT
    store_id,
    store_location
FROM "WALMART_STAGING"."staging"."stgTienda";
    ')

EXEC('
            SELECT * INTO "WALMART_MASTER"."master"."dimTienda__dbt_tmp" FROM "WALMART_MASTER"."master"."dimTienda__dbt_tmp__dbt_tmp_vw" 
    OPTION (LABEL = ''dbt-sqlserver'');

        ')

    
    EXEC('DROP VIEW IF EXISTS master.dimTienda__dbt_tmp__dbt_tmp_vw')



    
    use [WALMART_MASTER];
    if EXISTS (
        SELECT *
        FROM sys.indexes with (nolock)
        WHERE name = 'master_dimTienda__dbt_tmp_cci'
        AND object_id=object_id('master_dimTienda__dbt_tmp')
    )
    DROP index "master"."dimTienda__dbt_tmp".master_dimTienda__dbt_tmp_cci
    CREATE CLUSTERED COLUMNSTORE INDEX master_dimTienda__dbt_tmp_cci
    ON "master"."dimTienda__dbt_tmp"

   


  