with source as (
    select 
        *,
        make_date(release_year, 1, 1) as release_date
    from {{ source('raw_data', 'film') }}
),

renamed as (
    select 
        film_id::int,
        title::varchar(255),
        release_year::YEAR,
        release_date::DATE,
        rental_duration::int,
        rental_rate::numeric(4,2),
        length::int as film_length,
        replacement_cost::numeric(5,2),
        rating::varchar(10),
        special_features::varchar(255),
        language_id::int
    from source
)

select *
from renamed