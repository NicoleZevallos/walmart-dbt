SELECT 
    loyalty_program,
    membership_years,
    t.store_id,
    p.customer_id
FROM "WALMART_STAGING"."staging"."stgProgramaLealtad" p
JOIN "WALMART_STAGING"."staging"."stgTienda" t
    ON p.preferred_store_id = t.store_id