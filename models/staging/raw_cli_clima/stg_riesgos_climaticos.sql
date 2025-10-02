{{ config(materialized = 'view') }}

-- Nos quedamos con el riesgo mayor por coiudad ames y año
with riesgos_ciudad as (
select *,
       row_number() over( partition by ciudad, anyo, mes order by riesgo_total DESC) as mevale
    from {{ source('raw_cli_clima','riesgos_climaticos') }}
)
select * 
from riesgos_ciudad
where mevale=1
order by ciudad, fecha