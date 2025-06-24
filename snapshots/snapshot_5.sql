{% snapshot first_model_snapshot_3 %} 

    {{ 

        config( 

          target_database='analytics', 

          target_schema='snapshots', 

          unique_key='emp_id', 

 

          strategy='timestamp', 

          updated_at='updated_at', 

        ) 

    }} 

 

    select * from {{ ref('snap_model1') }} 

 

  {% endsnapshot %} 

 