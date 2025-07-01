{{ config(
    materialized='incremental',
    incremental_strategy='microbatch',
    event_time='session_start',
    begin='2024-10-01',
    batch_size='day'
) }}

WITH page_views AS (
    SELECT * FROM {{ ref('pre_micro_1') }}
),

customers AS (
    SELECT * FROM {{ ref('pre_micro_2') }}
)

SELECT
  page_views.id AS session_id,
  page_views.page_view_start AS session_start,
  customers.*
FROM page_views
LEFT JOIN customers
  ON page_views.customer_id = customers.id
