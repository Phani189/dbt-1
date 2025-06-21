{{ config(
    materialized="view",
    schema="marketing"
) }}
with customer_orders as (
SELECT
id AS customer_id,
first_name,
last_name
FROM raw.jaffle_shop.customers
)
select * from customer_orders
