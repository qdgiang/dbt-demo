with rental as (
    select
        nk_rental_id,
        rental_date,
        inventory_id,
        customer_id,
        return_date,
        staff_id,
        last_update
    from {{ ref('stg_postgres__rental') }}
),

inventory as (
    select
        nk_inventory_id,
        film_id,
        store_id,
        last_update
    from {{ ref('stg_postgres__inventory') }}
)

select 
    r.nk_rental_id,
    {{ generate_dim_date_FK_from_date('rental_date') }} as fk_dim_date_rental_date,
    r.inventory_id,
    r.customer_id,
    {{ generate_dim_date_FK_from_date('return_date') }} as fk_dim_date_return_date,
    r.staff_id,
    r.last_update,
    i.film_id,
    i.store_id
from rental r
left join inventory i
    on r.inventory_id = i.nk_inventory_id
