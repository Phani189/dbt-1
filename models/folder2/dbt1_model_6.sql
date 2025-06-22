with customers as (

    select * from {{ ref('dbt1_model_4') }}

)
select * from customers