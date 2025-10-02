{{ config(tags=['dash_riesgos_bi'])}}

SELECT
    CLIENTE_ID,
    EDAD,
    TEMP_MEDIA,
    RIESGO_TOTAL,
    SINIESTRO,
    VALOR_TOTAL
FROM {{ ref("stg_clientes_riesgo_clima") }}