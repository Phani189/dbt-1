{{config(materialized='incremental',
unique_key='emp_id',
incremental_strategy='delete+insert'
)}}

select * from {{source('jaffle_shop','stage_emp')}}

{%if is_incremental()%}

where emp_id>(select max(emp_id) from {{this}})

{% endif %}