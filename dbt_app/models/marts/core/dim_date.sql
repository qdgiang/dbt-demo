with initial_date as (
    {{ dbt_date.get_date_dimension("1990-01-01", "2050-12-31") }}
) 

select 
    {{ generate_dim_date_FK_from_date('date_day')}} as dim_date_id,
    *
from initial_date


