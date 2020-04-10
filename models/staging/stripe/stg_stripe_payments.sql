with source_payments as (

    select * from {{ source('stripe', 'payment') }}

),

final_payments as (

    select
        id as payment_id,
        "orderID" as order_id,
        "paymentMethod" as payment_method,

        -- amount is stored in cents, convert it to dollars
        amount / 100 as amount,
        created as created_at

    from source_payments

)

select * from final_payments
