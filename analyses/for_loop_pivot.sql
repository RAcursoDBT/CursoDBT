{# pivotar una tabla usando bucle for #}
{% set target_makes = ['Toyota','Ford','Chevrolet','Honda','Nissan'] %}

SELECT 
    DDATE,
    SALESPERSON,
    {% for make in target_makes %}
        SUM(CASE WHEN carmake = '{{ make }}' THEN TOTALSALE ELSE 0 END) AS sales_{{ make | lower }}{% if not loop.last %}, {% endif %}
    {% endfor %}
FROM {{ ref("psg_montly_sales_make") }}
GROUP BY DDATE, SALESPERSON
