 

{{ config(materialized='view') }} 

select * from {{ source('sample','emp_detail') }} 