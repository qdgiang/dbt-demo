select 
    name,
    count(*)
from 
    {{ ref('stg_postgres__category') }}
group by 
    name
having count(*) > 1
