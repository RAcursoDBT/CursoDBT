{%- set chanels_to_pivot= get_distinct_values_simplified(table_relation=source("raw_bi_car", 'MARKETING_PIVOTED_PERFORMANCE'),
    column_name='CHANNEL_NAME') -%}

{%- set metrics_to_pivot= get_distinct_values_simplified(table_relation=source("raw_bi_car", 'MARKETING_PIVOTED_PERFORMANCE'),
    column_name='METRIC_NAME') -%}

SELECT 
    campaign_id,
    report_date,
    {% for chanel in  chanels_to_pivot %}
        {% for metric in  metrics_to_pivot %}
            SUM(CASE WHEN CHANNEL_NAME = '{{ chanel }}' and  METRIC_NAME = '{{ metric }}' THEN METRIC_VALUE ELSE 0 END) 
            AS {{ chanel.lower().replace(' ','_') }}_{{ metric.lower() }}
            {% if not loop.last %}, {% endif %}
        {%- endfor %}
        {% if not loop.last %}, {% endif %}
    {%- endfor %}
from {{ source("raw_bi_car",'MARKETING_PIVOTED_PERFORMANCE')}}
group by
    campaign_id,
    report_date
order by
    campaign_id,
    report_date