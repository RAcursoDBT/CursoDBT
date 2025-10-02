{{ config(materialized = 'view') }}

select 
    cliente_id,
    tipo_seguro ,
    zona ,
    edad ,
    valor_propiedad ,
    valor_auto ,
    valor_total ,
    siniestro ,
    c.ciudad ,
    c.mes ,
    c.anyo ,
    r.temp_media,
    r.precipitacion_mm,
    r.eventos_extremos,
    r.riesgo_climatico,
    riesgo_total,
    c.fecha

FROM {{ source('raw_cli_clima', 'clientes') }} c
join {{ ref('stg_riesgos_climaticos') }} r 
on c.ciudad =r.ciudad and c.fecha=r.fecha