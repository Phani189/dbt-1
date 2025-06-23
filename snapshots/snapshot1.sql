{% snapshots FIRST_MODEL_SNAPSHOT %} 

    {{ 

        config( 

          target_database='ANALYTICS', 

          target_schema='SNAPSHOTS', 

          unique_key='emp_id', 

 

          strategy='timestamp', 

          updated_at='UPDATED_AT', 

        ) 

    }} 

 

    SELECT * FROM {{ REF('MY_FIRST_DBT_MODEL') }} 

 

  {% ENDSNAPSHOT %}


 