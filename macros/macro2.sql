{% macro first_upper(emp_name) %} 

  (concat(upper(substr(emp_name,1,1)),substr(emp_name,2))) 

{% endmacro %} 

 

{% macro upper_macro(dept) %} 

  (upper(dept)) 

{% endmacro %} 

 

{% macro calc_bonus(salary,comm) %} 

  (round((salary*(comm/100)))) 

{% endmacro %} 