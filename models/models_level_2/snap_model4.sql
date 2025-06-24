{{ config(materialized='ephemeral') }}

select * from {{ source('raw_source', 'orders') }}
