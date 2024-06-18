select * from dbt_schema_staging.stg_postgres__film;
select * from dbt_schema_staging.stg_postgres__language;
select * from dbt_schema_marts.dim_film;
select * from public.film_category;
INSERT INTO public.film_category
(film_id, category_id, last_update)
VALUES(1, 10, now());

select *
from dbt_schema_marts.dim_film df 
join dbt_schema_marts.dim_date dd 
	on df.fk_dim_date = dd.dim_date_id ;

select *
from dbt_schema_marts.fact_rental fr 
left join dbt_schema_marts.dim_date dd 
	on fr.fk_dim_date_rental_date = dd.dim_date_id 
where dd.month_name = 'May' and dd.year_number = '2005';


	
