{{config(materialized='view')}}

select * from {{ref('dbt3_model9')}}
