WITH fechas AS (
  SELECT 
    DATEADD(DAY, number, '2021-01-01') AS fecha
  FROM master.dbo.spt_values
  WHERE type = 'P'
    AND number <= DATEDIFF(DAY, '2021-01-01', '2021-12-31')
)
SELECT
  fecha,
  YEAR(fecha) AS anio,
  MONTH(fecha) AS mes,
  DAY(fecha) AS dia,
  DATENAME(WEEKDAY, fecha) AS nombre_dia,
  DATENAME(MONTH, fecha) AS nombre_mes,
  DATEPART(QUARTER, fecha) AS trimestre
FROM fechas
