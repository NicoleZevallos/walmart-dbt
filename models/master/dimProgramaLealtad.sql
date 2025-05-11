SELECT
    loyalty_program,
    membership_years,
    t.store_id,
    p.customer_id
FROM {{ ref('stgProgramaLealtad') }} p
JOIN {{ ref('stgTienda') }} t
  ON p.preferred_store_id = t.store_id
