{{config(materialized='table')}}
with cte as
(
    select * from {{ref('dbt1_model_6')}}
)
select * from cte