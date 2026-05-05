{{
    config(materialized = 'table')
}}

with source_orders as ( 
    select * from {{ ref('dim_orders') }}
),
source_users as (
    select * from {{ ref('dim_users') }}
),
source_addresses as (
    select * from {{ ref('dim_addresses') }}
),
renamed as (
    select
        do.order_id,
        do.user_id,
        do.address_id,
        cast(do.created_at as timestamp_ntz) as order_date,
        da.country as address_country,
        do.status as status,
        cast(do.order_total as float) as order_total,
        cast(do.order_cost as float) as order_cost,
        cast(do.shipping_cost as float) as shippint_cost 
    from source_orders as do inner join source_addresses as da on do.address_id = da.address_id inner join source_users as du on do.user_id = du.user_id
)

select * from renamed