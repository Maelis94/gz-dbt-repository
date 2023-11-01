with 

source as (

    select * from {{ source('raw', 'product') }}

),

renamed as (

    select
        products_id,
        CAST (purchSE_PRICE as float64) AS purchase_price

    from source

)

select * from renamed
