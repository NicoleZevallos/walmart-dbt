SELECT DISTINCT
    store_id,
    store_location
FROM {{ ref('stgTienda') }}