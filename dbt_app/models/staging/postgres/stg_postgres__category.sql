with source as (
    select *
    from {{ source('raw_data', 'category') }}
),

renamed as (
    select
        category_id::int as category_id,
        name::varchar(25) as name,
        last_update::TIMESTAMP as last_update
    from source
)

select *
from renamed