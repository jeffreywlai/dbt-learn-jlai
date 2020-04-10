with source_orders as (

    select * from {{ source('jaffle_shop', 'orders') }}

),

final_orders as (

    select
        id as order_id,
        user_id as customer_id,
        order_date,
        status

    from source_orders

)

select * from final_orders
