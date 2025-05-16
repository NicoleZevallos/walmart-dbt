WITH comportamiento AS (
<<<<<<< HEAD
    SELECT
=======
    SELECT 
>>>>>>> 7993812 (Primer commit del proyecto walmart_dbt)
        customer_id,
        last_purchase_date,
        avg_purchase_value,
        avg_discount_used,
        online_purchases,
        in_store_purchases,
        avg_transaction_value,
        total_sales,
        total_transactions,
        days_since_last_purchase,
        frecuencia_label
    FROM {{ ref('stgComportamientoCompra') }}
),
<<<<<<< HEAD

dimFecha AS (
    SELECT
=======
dimFecha AS (
    SELECT 
>>>>>>> 7993812 (Primer commit del proyecto walmart_dbt)
        fecha,
        MIN(fecha) AS mapped_fecha
    FROM {{ ref('dimTiempo') }}
    GROUP BY fecha
),
<<<<<<< HEAD

frecuenciaMapeada AS (
    SELECT *,
        frecuencia_label AS frecuencia_label_num 
    FROM comportamiento
),

joined AS (
    SELECT
=======
frecuenciaMapeada AS (
    SELECT *,
        frecuencia_label AS frecuencia_label_num
    FROM comportamiento
),
joined AS (
    SELECT 
>>>>>>> 7993812 (Primer commit del proyecto walmart_dbt)
        dc.customer_id,
        dp.loyalty_program,
        ds.customer_support_calls,
        de.website_visits,
        dch.churn_status,
        ft.fecha AS fecha_compra,
        fc.avg_purchase_value,
        fc.avg_discount_used,
        fc.online_purchases,
        fc.in_store_purchases,
        fc.avg_transaction_value,
        fc.total_sales,
        fc.total_transactions,
        fc.days_since_last_purchase,
        fc.frecuencia_label_num AS frecuencia_label
    FROM frecuenciaMapeada fc
    JOIN {{ ref('dimCliente') }} dc ON fc.customer_id = dc.customer_id
    LEFT JOIN {{ ref('dimProgramaLealtad') }} dp ON fc.customer_id = dp.customer_id
    LEFT JOIN {{ ref('dimSoporte') }} ds ON fc.customer_id = ds.customer_id
    LEFT JOIN {{ ref('dimEngagementDigital') }} de ON fc.customer_id = de.customer_id
    LEFT JOIN {{ ref('dimChurn') }} dch ON fc.customer_id = dch.customer_id
    LEFT JOIN {{ ref('dimTiempo') }} ft ON CAST(fc.last_purchase_date AS DATE) = ft.fecha
)

<<<<<<< HEAD
SELECT * FROM joined
=======
SELECT * FROM joined;
>>>>>>> 7993812 (Primer commit del proyecto walmart_dbt)
