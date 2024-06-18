with source as (
    select *
    from {{ source('raw_data', 'film_category') }}
),

renamed as (
    select
        film_id::int as film_id,
        category_id::int as category_id,
        last_update::TIMESTAMP as last_update
    from source
)

select *
from renamed