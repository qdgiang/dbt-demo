with source as (
    select *
    from {{ source('raw_data', 'language') }}
),

renamed as (
    select
        language_id::int as language_id,
        name::varchar(20) as language_name,
        last_update::TIMESTAMP as last_update
    from source
)

select *
from renamed