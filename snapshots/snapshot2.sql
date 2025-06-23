{% SNAPSHOT FIRST_MODEL_SNAPSHOT_1 %} 

    {{ 

        CONFIG( 

          TARGET_DATABASE='ANALYTICS', 

          TARGET_SCHEMA='SNAPSHOTS', 

          UNIQUE_KEY='ID', 

 

          STRATEGY='TIMESTAMP', 

          UPDATED_AT='UPDATED_AT', 

        ) 

    }} 

 

    SELECT * FROM {{ REF('snap_model2') }} 

 

  {% ENDSNAPSHOT %} 

 