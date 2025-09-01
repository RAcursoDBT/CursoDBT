select *
from {{ ref("psg_montly_sales_make") }}
{% if target.name != 'prod_databoosters' %}
limit 10
{% endif %}