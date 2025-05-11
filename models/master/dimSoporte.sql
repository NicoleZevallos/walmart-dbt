SELECT DISTINCT
    customer_support_calls,
    customer_id
FROM {{ ref('stgSoporte') }}