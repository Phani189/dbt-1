{{ config(materialized='table') }} 

with source_data as ( 

 

    select 1 AS id, 'NY' AS state, '2020-02-01 00:00:00.000'::timestamp AS updated_at 
    union all
    select null as id, 'CT' as state ,'2020-01-01 00:00:00.000'::timestamp AS updated_at 
    union all
    select 3 as id,'VT' as state,'2020-01-01 00:00:00.000'::timestamp AS updated_at 

) 
select * from source_data