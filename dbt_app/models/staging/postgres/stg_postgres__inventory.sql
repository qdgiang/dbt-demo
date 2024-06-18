with source as (
    select 
        *
    from {{ source('raw_data', 'inventory') }}
),

renamed as (
    select
        inventory_id::int as nk_inventory_id,
        film_id::int as film_id,
        store_id::int as store_id,
        last_update::TIMESTAMP as last_update
    from source
)

select *
from renamed