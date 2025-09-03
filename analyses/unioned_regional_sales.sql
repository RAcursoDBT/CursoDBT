{# definimos las variables con las listas a usar en el FOR #}
{%- set regional_sources =[
    'REGIONAL_SALES_APAC',
    'REGIONAL_SALES_EU',
    'REGIONAL_SALES_NA'
    ]
-%}

{%- set lista_campos =[
    'order_id',
    'order_date',
    'customer_id',
    'product_id',
    'quantity',
    'total_amount'
    ]
-%}

{# ahora construimos la unión de las tablas usando bucle for #}

{% for tabla in regional_sources %}

    select 
        '{{ tabla }}' as source_region_table,
        {% for campo in lista_campos -%}
            {{ campo }}
            {%- if not loop.last %},{% endif %}
        {% endfor %}
    from {{ source("raw_bi_car",tabla) }}
        {% if not loop.last %}
            UNION ALL
        {% endif %}

 {% endfor %}

