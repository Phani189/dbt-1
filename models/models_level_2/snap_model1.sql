{{config(materialized='table')}}

select * from {{source('emp_details_source','employee_dim')}}