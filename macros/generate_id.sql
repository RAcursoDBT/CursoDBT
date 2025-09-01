{% macro generate_id(column_name) %}
rank() over ( order by {{ column_name }} )
{% endmacro %}