with numeros as (
  select ROW_NUMBER() OVER (ORDER BY (select NULL)) - 1 as n
  from (values (0),(0),(0),(0),(0),(0),(0),(0),(0),(0)) a(n)
  cross join (values (0),(0),(0),(0),(0),(0),(0),(0),(0),(0)) b(n)
  cross join (values (0),(0),(0),(0),(0),(0),(0),(0),(0),(0)) c(n)
)

select
  dateadd(day, n, cast('2021-01-01' as date)) as fecha,
  year(dateadd(day, n, cast('2021-01-01' as date))) as año,
  month(dateadd(day, n, cast('2021-01-01' as date))) as mes,
  day(dateadd(day, n, cast('2021-01-01' as date))) as dia,
  datename(weekday, dateadd(day, n, cast('2021-01-01' as date))) as nombre_dia,
  datename(month, dateadd(day, n, cast('2021-01-01' as date))) as nombre_mes,
  datepart(quarter, dateadd(day, n, cast('2021-01-01' as date))) as trimestre

from numeros
where n < datediff(day, '2021-01-01', '2021-12-31') + 1
order by fecha