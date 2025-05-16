/*
    Welcome to your first dbt model!
    Did you know that you can also configure models directly within SQL files?
    This will override configurations stated in dbt_project.yml

    Try changing "table" to "view" below
*/

  -- Asegúrate de que el modelo esté siendo materializado como una tabla

with source_data as (
    -- Este CTE (Common Table Expression) es donde creamos nuestros datos de ejemplo
    select 1 as id
    union all
    select null as id  -- Introducimos un valor nulo aquí para probar el filtro que puedes agregar más tarde
)

select *
from source_data
-- Puedes descomentar la siguiente línea para excluir los valores nulos de la columna 'id'
-- where id is not null