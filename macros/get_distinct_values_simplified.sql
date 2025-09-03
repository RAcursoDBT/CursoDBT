{% macro get_distinct_values_simplified(table_relation, column_name)%}

    {% set query_text %}
        select distinct {{ adapter.quote(column_name) }} from {{ table_relation}} order by 1
    {% endset%}

    {% set results = run_query(query_text) %}

    {% if execute %}
        {# convierte la columna en una lista de python #}
        {% set distinct_values= results.columns[0].values() %}
    {% else %}
        {# durante el parseo no hay valores reales la lista es vacia#}
        {% set distinct_values= [] %}
    {% endif %}
    {{ return(distinct_values) }}

{% endmacro %}