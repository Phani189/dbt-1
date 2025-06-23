{{ config(materialized='table', alias='FIRST_MODEL_SNAPSHOT') }} 

WITH SOURCE_DATA AS ( 

select * from TRAINING_1.TR_SCHEMA.employee_dim
 
) 

 

SELECT * 

FROM SOURCE_DATA 