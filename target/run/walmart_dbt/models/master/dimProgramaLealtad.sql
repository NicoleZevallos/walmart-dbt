
  
    USE [WALMART_MASTER];
    USE [WALMART_MASTER];
    
    

    

    
    USE [WALMART_MASTER];
    EXEC('
        create view "master"."dimProgramaLealtad__dbt_tmp__dbt_tmp_vw" as SELECT 
    loyalty_program,
    membership_years,
    t.store_id,
    p.customer_id
FROM "WALMART_STAGING"."staging"."stgProgramaLealtad" p
JOIN "WALMART_STAGING"."staging"."stgTienda" t
    ON p.preferred_store_id = t.store_id;
    ')

EXEC('
            SELECT * INTO "WALMART_MASTER"."master"."dimProgramaLealtad__dbt_tmp" FROM "WALMART_MASTER"."master"."dimProgramaLealtad__dbt_tmp__dbt_tmp_vw" 
    OPTION (LABEL = ''dbt-sqlserver'');

        ')

    
    EXEC('DROP VIEW IF EXISTS master.dimProgramaLealtad__dbt_tmp__dbt_tmp_vw')



    
    use [WALMART_MASTER];
    if EXISTS (
        SELECT *
        FROM sys.indexes with (nolock)
        WHERE name = 'master_dimProgramaLealtad__dbt_tmp_cci'
        AND object_id=object_id('master_dimProgramaLealtad__dbt_tmp')
    )
    DROP index "master"."dimProgramaLealtad__dbt_tmp".master_dimProgramaLealtad__dbt_tmp_cci
    CREATE CLUSTERED COLUMNSTORE INDEX master_dimProgramaLealtad__dbt_tmp_cci
    ON "master"."dimProgramaLealtad__dbt_tmp"

   


  