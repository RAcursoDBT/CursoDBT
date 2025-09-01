--este test pasa si la consulta devuelve 0 filas
--selecciona cualquier registro de la tabla de hechos donde las métricas clave sean negativas

SELECT 
    ID_SALESPERSON,
    ID_CARMAKE,
    TOTALSALE,
    TOTALCOM
FROM {{ ref("fct_montly_sales")}}
WHERE TOTALSALE < 0 or TOTALCOM <0
