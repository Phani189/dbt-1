{% set payment_methods = ['credit_card', 'coupon', 'bank_transfer', 'gift_card'] %}

with orders as (

    select * from {{ ref('stg_orders') }}

),

payments as (

    select * from {{ ref('stg_payment') }}

),

order_payments as (

    select
        orderid,

        {% for payment_method in payment_methods -%}
        sum(case when paymentmethod = '{{ payment_method }}' then amount else 0 end) as {{ payment_method }}_amount,
        {% endfor -%}

        sum(amount) as total_amount

    from raw.stripe.payment

    group by orderid

),

final as (

    select
        orders.id,
        orders.user_id,
        orders.order_date,
        orders.status,

        {% for payment_method in payment_methods -%}

        order_payments.{{ payment_method }}_amount,

        {% endfor -%}

        order_payments.total_amount as amount

    from raw.jaffle_shop.orders


    left join order_payments
        on orders.id = order_payments.orderid

)

select * from final