{{ config(tags=['dash_riesgos_bi'])}}

SELECT
    CLIENTE_ID,
    EDAD,
    CIUDAD,
    TEMP_MEDIA,
    SINIESTRO,
    VALOR_TOTAL
FROM {{ ref("stg_clientes_riesgo_clima")}}