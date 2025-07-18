with customers as (

    select * from {{ ref('stg_customers') }}

),

orders as (

    select * from {{ ref('stg_orders') }}

),

payments as (

    select * from {{ ref('stg_payment') }}

),

customer_orders as (

        select
        user_id,

        min(order_date) as first_order,
        max(order_date) as most_recent_order,
        count(id) as number_of_orders
    from raw.jaffle_shop.orders
    group by user_id

),

customer_payments as (

    select
        orders.user_id,
        sum(amount) as total_amount

    from raw.stripe.payment

    left join raw.jaffle_shop.orders on
         payments.orderid = orders.id

    group by orders.user_id

),

final as (

    select
        customers.id,
        customers.first_name,
        customers.last_name,
        customer_orders.first_order,
        customer_orders.most_recent_order,
        customer_orders.number_of_orders,
        customer_payments.total_amount as customer_lifetime_value

    from raw.jaffle_shop.customers

    left join customer_orders
        on customers.id = customer_orders.user_id

    left join customer_payments
        on  customers.id = customer_payments.user_id

)

select * from final