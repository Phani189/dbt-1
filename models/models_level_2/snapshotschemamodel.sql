{{config(materialized='table')}}


select * from {{ ref('snapshot_model_5') }}
