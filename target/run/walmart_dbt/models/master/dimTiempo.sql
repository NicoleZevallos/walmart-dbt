
  
    USE [WALMART_MASTER];
    USE [WALMART_MASTER];
    
    

    

    
    USE [WALMART_MASTER];
    EXEC('
        create view "master"."dimTiempo__dbt_tmp__dbt_tmp_vw" as WITH calendar AS (
    SELECT 
        date_day AS fecha,
        DATEPART(YEAR, date_day) AS año,
        DATEPART(QUARTER, date_day) AS trimestre,
        DATEPART(MONTH, date_day) AS mes,
        DATEPART(DAY, date_day) AS dia,
        DATENAME(MONTH, date_day) AS nombre_mes,
        DATENAME(WEEKDAY, date_day) AS nombre_dia
    FROM (
        SELECT 
            DATEADD(DAY, number, ''2021-01-01'') AS date_day
        FROM master..spt_values
        WHERE type = ''p'' AND number <= DATEDIFF(DAY, ''2021-01-01'', ''2021-12-31'')
    ) AS fechas
)

SELECT * FROM calendar;;
    ')

EXEC('
            SELECT * INTO "WALMART_MASTER"."master"."dimTiempo__dbt_tmp" FROM "WALMART_MASTER"."master"."dimTiempo__dbt_tmp__dbt_tmp_vw" 
    OPTION (LABEL = ''dbt-sqlserver'');

        ')

    
    EXEC('DROP VIEW IF EXISTS master.dimTiempo__dbt_tmp__dbt_tmp_vw')



    
    use [WALMART_MASTER];
    if EXISTS (
        SELECT *
        FROM sys.indexes with (nolock)
        WHERE name = 'master_dimTiempo__dbt_tmp_cci'
        AND object_id=object_id('master_dimTiempo__dbt_tmp')
    )
    DROP index "master"."dimTiempo__dbt_tmp".master_dimTiempo__dbt_tmp_cci
    CREATE CLUSTERED COLUMNSTORE INDEX master_dimTiempo__dbt_tmp_cci
    ON "master"."dimTiempo__dbt_tmp"

   


  