{{ config(materialized='table') }} 

 

select emp_id, 

      {{ first_upper(emp_name) }} as emp_name, 

      {{ upper_macro(dept) }} as dept, 

      salary, 

      comm, 

      {{ calc_bonus(salary,comm) }} as bonus 

      from training_1.tr_schema.stage_emp 

 