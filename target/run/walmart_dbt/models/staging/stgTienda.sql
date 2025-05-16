
  
    USE [WALMART_STAGING];
    USE [WALMART_STAGING];
    
    

    

    
    USE [WALMART_STAGING];
    EXEC('
        create view "staging"."stgTienda__dbt_tmp__dbt_tmp_vw" as WITH raw AS (
    SELECT *
    FROM "WALMART_RAW"."raw"."raw_walmart_data"
)

SELECT 
    row_number() OVER (ORDER BY store_location) AS store_id,
    store_location
FROM (
    SELECT DISTINCT store_location
    FROM raw
) t;
    ')

EXEC('
            SELECT * INTO "WALMART_STAGING"."staging"."stgTienda__dbt_tmp" FROM "WALMART_STAGING"."staging"."stgTienda__dbt_tmp__dbt_tmp_vw" 
    OPTION (LABEL = ''dbt-sqlserver'');

        ')

    
    EXEC('DROP VIEW IF EXISTS staging.stgTienda__dbt_tmp__dbt_tmp_vw')



    
    use [WALMART_STAGING];
    if EXISTS (
        SELECT *
        FROM sys.indexes with (nolock)
        WHERE name = 'staging_stgTienda__dbt_tmp_cci'
        AND object_id=object_id('staging_stgTienda__dbt_tmp')
    )
    DROP index "staging"."stgTienda__dbt_tmp".staging_stgTienda__dbt_tmp_cci
    CREATE CLUSTERED COLUMNSTORE INDEX staging_stgTienda__dbt_tmp_cci
    ON "staging"."stgTienda__dbt_tmp"

   


  