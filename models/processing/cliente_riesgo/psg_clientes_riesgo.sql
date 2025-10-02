{{ config(materialized = 'view')}}

SELECT
    ciudad,
    mes,
    anyo,
    substr(fecha,6,2) as mes_num,
    AVG(riesgo_total) AS riesgo_promedio,
    COUNT(*) AS total_clientes
FROM {{ ref("stg_clientes_riesgo_clima")}}
GROUP BY ciudad, anyo, mes_num, mes
ORDER BY ciudad, anyo, mes_num, mes