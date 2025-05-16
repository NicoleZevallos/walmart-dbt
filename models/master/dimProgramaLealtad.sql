<<<<<<< HEAD
SELECT
=======
SELECT 
>>>>>>> 7993812 (Primer commit del proyecto walmart_dbt)
    loyalty_program,
    membership_years,
    t.store_id,
    p.customer_id
FROM {{ ref('stgProgramaLealtad') }} p
JOIN {{ ref('stgTienda') }} t
<<<<<<< HEAD
  ON p.preferred_store_id = t.store_id
=======
    ON p.preferred_store_id = t.store_id
>>>>>>> 7993812 (Primer commit del proyecto walmart_dbt)
