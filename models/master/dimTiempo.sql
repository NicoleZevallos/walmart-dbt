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