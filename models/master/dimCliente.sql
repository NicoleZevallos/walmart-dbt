SELECT DISTINCT
    customer_id,
    customer_city
FROM {{ ref('stgCliente') }}