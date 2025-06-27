{{ config(materialized='table') }}

with base as (
    select *
    from {{ ref('obt_orders') }}
    where year = '2023'
    and is_cancelled = true
    and is_discounted = true
)

select * from base
