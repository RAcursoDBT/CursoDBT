{{ config(tags=['dash_riesgos_bi'])}}

SELECT
    CIUDAD,
    MES,
    ANYO,
    RIESGO_PROMEDIO,
    TOTAL_CLIENTES
FROM {{ ref("psg_clientes_riesgo")}}
