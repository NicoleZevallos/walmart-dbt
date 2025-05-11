SELECT DISTINCT
    churn_status,
    customer_id
FROM {{ ref('stgChurn') }}