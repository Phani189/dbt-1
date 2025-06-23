{% snapshots FIRST_MODEL_SNAPSHOT %} 

    {{ 

        config( 

          TARGET_DATABASE='ANALYTICS', 

          TARGET_SCHEMA='SNAPSHOTS', 

          UNIQUE_KEY='emp_id', 

 

          STRATEGY='TIMESTAMP', 

          UPDATED_AT='UPDATED_AT', 

        ) 

    }} 

 

    SELECT * FROM {{ REF('MY_FIRST_DBT_MODEL') }} 

 

  {% ENDSNAPSHOT %} 

 