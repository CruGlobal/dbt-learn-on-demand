{% set payment_methods = ['bank_transfer', 'credit_card', 'coupon', 'gift_card'] %}

with orders as (select * from {{ ref('stg_payments') }} ),

orders_pivoted as (
    select 
        order_id,      
        {% for payment_method in payment_methods -%}
        sum(case when paymentmethod = '{{payment_method}}' then amount else 0 end) as {{payment_method}}_amount
        {%- if not loop.last -%}
        ,
        {% endif -%}
        {%- endfor %}
        from orders
            group by order_id
)

select * from orders_pivoted
