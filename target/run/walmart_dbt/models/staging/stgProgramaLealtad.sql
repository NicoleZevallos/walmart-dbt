
  
    USE [WALMART_STAGING];
    USE [WALMART_STAGING];
    
    

    

    
    USE [WALMART_STAGING];
    EXEC('
        create view "staging"."stgProgramaLealtad__dbt_tmp__dbt_tmp_vw" as WITH raw AS (
    SELECT *
    FROM "WALMART_RAW"."raw"."raw_walmart_data"
),
store AS (
    SELECT *
    FROM "WALMART_STAGING"."staging"."stgTienda"
)

SELECT DISTINCT
    raw.customer_id,
    raw.loyalty_program,
    raw.membership_years,
    store.store_id AS preferred_store_id
FROM raw
LEFT JOIN store
    ON raw.store_location = store.store_location
WHERE raw.loyalty_program IS NOT NULL;
    ')

EXEC('
            SELECT * INTO "WALMART_STAGING"."staging"."stgProgramaLealtad__dbt_tmp" FROM "WALMART_STAGING"."staging"."stgProgramaLealtad__dbt_tmp__dbt_tmp_vw" 
    OPTION (LABEL = ''dbt-sqlserver'');

        ')

    
    EXEC('DROP VIEW IF EXISTS staging.stgProgramaLealtad__dbt_tmp__dbt_tmp_vw')



    
    use [WALMART_STAGING];
    if EXISTS (
        SELECT *
        FROM sys.indexes with (nolock)
        WHERE name = 'staging_stgProgramaLealtad__dbt_tmp_cci'
        AND object_id=object_id('staging_stgProgramaLealtad__dbt_tmp')
    )
    DROP index "staging"."stgProgramaLealtad__dbt_tmp".staging_stgProgramaLealtad__dbt_tmp_cci
    CREATE CLUSTERED COLUMNSTORE INDEX staging_stgProgramaLealtad__dbt_tmp_cci
    ON "staging"."stgProgramaLealtad__dbt_tmp"

   


  