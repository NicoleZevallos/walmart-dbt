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