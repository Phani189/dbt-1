select * from {{ ref('dbt3_model10') }} 

minus 

select * from {{ source('sample','emp_detail') }} 

 