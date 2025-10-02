{{ config(materialized='view') }}

SELECT
    *
FROM {{ source('raw_cli_clima', 'clientes') }}
WHERE UPPER(tipo_seguro) = 'HOGAR'
