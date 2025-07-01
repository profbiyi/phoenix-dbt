{{ config(materialized='view') }}

with distinct_products as (

    select distinct
        {{ dbt_utils.generate_surrogate_key(['product_category', 'product_name']) }} as product_id,
        product_name,
        product_category,
         {{ dbt_utils.generate_surrogate_key(['product_category']) }} as category_id
    from {{ ref('stg_customer_orders') }}

)

select *
from distinct_products
