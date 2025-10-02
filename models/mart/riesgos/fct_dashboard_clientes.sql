-- models/fct_dashboard_clientes.sql

{{ config(
    materialized='table',
    description='Modelo para alimentar gráficos en Snowsight con datos agregados por cliente'
) }}

SELECT
    CLIENTE_ID,
    CIUDAD,
    SINIESTRO,
    AVG(TEMP_MEDIA) AS TEMP_MEDIA,
    SUM(RIESGO_TOTAL) AS RIESGO_TOTAL,
    SUM(VALOR_TOTAL) AS VALOR_TOTAL,
    MAX(EDAD) AS EDAD
FROM {{ ref('stg_clientes_riesgo_clima') }}
WHERE TEMP_MEDIA IS NOT NULL AND RIESGO_TOTAL IS NOT NULL
GROUP BY CLIENTE_ID, CIUDAD, SINIESTRO