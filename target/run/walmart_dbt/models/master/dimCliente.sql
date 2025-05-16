
  
    USE [WALMART_MASTER];
    USE [WALMART_MASTER];
    
    

    

    
    USE [WALMART_MASTER];
    EXEC('
        create view "master"."dimCliente__dbt_tmp__dbt_tmp_vw" as SELECT DISTINCT
    customer_id,
    customer_city
FROM "WALMART_STAGING"."staging"."stgCliente";
    ')

EXEC('
            SELECT * INTO "WALMART_MASTER"."master"."dimCliente__dbt_tmp" FROM "WALMART_MASTER"."master"."dimCliente__dbt_tmp__dbt_tmp_vw" 
    OPTION (LABEL = ''dbt-sqlserver'');

        ')

    
    EXEC('DROP VIEW IF EXISTS master.dimCliente__dbt_tmp__dbt_tmp_vw')



    
    use [WALMART_MASTER];
    if EXISTS (
        SELECT *
        FROM sys.indexes with (nolock)
        WHERE name = 'master_dimCliente__dbt_tmp_cci'
        AND object_id=object_id('master_dimCliente__dbt_tmp')
    )
    DROP index "master"."dimCliente__dbt_tmp".master_dimCliente__dbt_tmp_cci
    CREATE CLUSTERED COLUMNSTORE INDEX master_dimCliente__dbt_tmp_cci
    ON "master"."dimCliente__dbt_tmp"

   


  