with film as (
    select *
    from {{ ref("stg_postgres__film") }}
),

category as (
    select *
    from {{ ref("stg_postgres__category") }}
),

film_category as (
    select *
    from {{ ref("stg_postgres__film_category") }}
),

language as (
    select *
    from {{ ref("stg_postgres__language") }}
)

select
    f.film_id,
    {{ generate_dim_date_FK_from_date('f.release_date') }} as fk_dim_date,
    f.title,
    f.release_year,
    f.film_length,
    f.rating,
    concat_ws(', ', array_agg(c.name)) as categories,
    l.language_name as language
from film f
left join film_category fc
    on f.film_id = fc.film_id
left join category c
    on fc.category_id = c.category_id
left join language l
    on f.language_id = l.language_id
group by f.film_id, fk_dim_date, f.title, f.release_year, f.film_length, f.rating, l.language_name

