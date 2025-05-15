WITH calendar AS (
    SELECT
        date_day AS fecha,
        DATEPART(YEAR, date_day) AS año,
        DATEPART(QUARTER, date_day) AS trimestre,
        DATEPART(MONTH, date_day) AS mes,
        DATEPART(DAY, date_day) AS dia,
        DATENAME(MONTH, date_day) AS nombre_mes,
        DATENAME(WEEKDAY, date_day) AS nombre_dia
    FROM (
        SELECT 
            DATEADD(DAY, number, '2021-01-01') AS date_day
        FROM master..spt_values
        WHERE type = 'P' AND number <= DATEDIFF(DAY, '2021-01-01', '2021-12-31')
    ) AS fechas
)

SELECT * FROM calendar

with numbers as (
  select 0 as n
  union all
  select n + 1 from numbers where n + 1 < 365
),
fechas as (
  select dateadd(day, n, cast('2021-01-01' as date)) as fecha
  from numbers
)
select
  fecha,
  year(fecha) as año,
  month(fecha) as mes,
  day(fecha) as dia,
  datename(weekday, fecha) as nombre_dia,
  datename(month, fecha) as nombre_mes,
  datepart(quarter, fecha) as trimestre
from fechas
option (maxrecursion 365)