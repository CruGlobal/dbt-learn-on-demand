with payments as (select * from {{ref("stg_payments")}}),
payment as (
select
    order_id,
    id as customer_id,
    amount
    from payments
    )

select * from payment