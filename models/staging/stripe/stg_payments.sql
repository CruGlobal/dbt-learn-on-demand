with payments as (
    select 
        id,
        orderid as order_id,
        paymentmethod,
        status,
        {{cents_to_dollars('amount')}} as amount,
        created,
        _batched_at
        from {{source('stripe','payment') }}
)

select * from payments