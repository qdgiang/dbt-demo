with source as (
    select 
        *
    from {{ source('raw_data', 'rental') }}
),

renamed as (
    select
        rental_id::int as nk_rental_id,
        rental_date::DATE as rental_date,
        inventory_id::int as inventory_id,
        customer_id::int as customer_id,
        return_date::DATE as return_date,
        staff_id::int as staff_id,
        last_update::TIMESTAMP as last_update
    from source
)

select *
from renamed
