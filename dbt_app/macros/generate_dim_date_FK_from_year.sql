{% macro generate_dim_date_FK_from_date(date) %}

{{ dbt_utils.generate_surrogate_key([date]) }}

{% endmacro %}