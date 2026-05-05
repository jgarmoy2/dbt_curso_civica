{{
    config(materialized = 'table')
}}

with source as (
    select * from {{ ref("stg_postgre_db__orders")}}
)
select * from source