with 

source as (

    select * from {{ source('gz_raw_data', 'raw_gz_sales') }}

),

renamed as (

    select
        date_date,
        orders_id,
        pdt_id AS products_id,
        revenue,
        quantity,
        CONCAT (pdt_id, "-",orders_id) AS primer_key

    from source

)

select * from renamed
