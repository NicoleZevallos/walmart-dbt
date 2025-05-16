
  
    USE [WALMART_RAW];
    USE [WALMART_RAW];
    
    

    

    
    USE [WALMART_RAW];
    EXEC('
        create view "dbo"."my_first_dbt_model__dbt_tmp__dbt_tmp_vw" as /*
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
-- Puedes descomentar la siguiente línea para excluir los valores nulos de la columna ''id''
-- where id is not null;
    ')

EXEC('
            SELECT * INTO "WALMART_RAW"."dbo"."my_first_dbt_model__dbt_tmp" FROM "WALMART_RAW"."dbo"."my_first_dbt_model__dbt_tmp__dbt_tmp_vw" 
    OPTION (LABEL = ''dbt-sqlserver'');

        ')

    
    EXEC('DROP VIEW IF EXISTS dbo.my_first_dbt_model__dbt_tmp__dbt_tmp_vw')



    
    use [WALMART_RAW];
    if EXISTS (
        SELECT *
        FROM sys.indexes with (nolock)
        WHERE name = 'dbo_my_first_dbt_model__dbt_tmp_cci'
        AND object_id=object_id('dbo_my_first_dbt_model__dbt_tmp')
    )
    DROP index "dbo"."my_first_dbt_model__dbt_tmp".dbo_my_first_dbt_model__dbt_tmp_cci
    CREATE CLUSTERED COLUMNSTORE INDEX dbo_my_first_dbt_model__dbt_tmp_cci
    ON "dbo"."my_first_dbt_model__dbt_tmp"

   


  