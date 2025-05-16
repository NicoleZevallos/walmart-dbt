
  
    USE [WALMART_STAGING];
    USE [WALMART_STAGING];
    
    

    

    
    USE [WALMART_STAGING];
    EXEC('
        create view "staging"."stgComportamientoCompra__dbt_tmp__dbt_tmp_vw" as WITH raw AS (
    SELECT *
    FROM "WALMART_RAW"."raw"."raw_walmart_data"
)

SELECT 
    customer_id,
    avg_purchase_value,
    CASE
        WHEN lower(purchase_frequency) = ''daily'' THEN 1
        WHEN lower(purchase_frequency) = ''weekly'' THEN 2
        WHEN lower(purchase_frequency) = ''monthly'' THEN 3
        WHEN lower(purchase_frequency) = ''yearly'' THEN 4
        ELSE NULL
    END AS frecuencia_label,
    try_convert(datetime, transaction_date, 103) AS transaction_date,
    try_convert(datetime, last_purchase_date, 103) AS last_purchase_date,
    avg_discount_used,
    online_purchases,
    in_store_purchases,
    avg_transaction_value,
    total_sales,
    total_transactions,
    days_since_last_purchase
FROM raw;
    ')

EXEC('
            SELECT * INTO "WALMART_STAGING"."staging"."stgComportamientoCompra__dbt_tmp" FROM "WALMART_STAGING"."staging"."stgComportamientoCompra__dbt_tmp__dbt_tmp_vw" 
    OPTION (LABEL = ''dbt-sqlserver'');

        ')

    
    EXEC('DROP VIEW IF EXISTS staging.stgComportamientoCompra__dbt_tmp__dbt_tmp_vw')



    
    use [WALMART_STAGING];
    if EXISTS (
        SELECT *
        FROM sys.indexes with (nolock)
        WHERE name = 'staging_stgComportamientoCompra__dbt_tmp_cci'
        AND object_id=object_id('staging_stgComportamientoCompra__dbt_tmp')
    )
    DROP index "staging"."stgComportamientoCompra__dbt_tmp".staging_stgComportamientoCompra__dbt_tmp_cci
    CREATE CLUSTERED COLUMNSTORE INDEX staging_stgComportamientoCompra__dbt_tmp_cci
    ON "staging"."stgComportamientoCompra__dbt_tmp"

   


  