-- Test to ensure that all leading and trailing spaces have been trimmed from customer names

select 
    customer_id,
    first_name,
    last_name
    from {{ref('stg_customers')}}
        where length(first_name) != length(ltrim(rtrim(first_name)))
            or length(last_name) != length(ltrim(rtrim(last_name)))