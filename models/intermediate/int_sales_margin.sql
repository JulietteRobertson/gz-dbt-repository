WITH sub1 AS (SELECT *
FROM {{ref("stg_gz_raw_data__raw_gz_product")}}
JOIN {{ref("stg_gz_raw_data__raw_gz_sales")}}
USING (products_id))

SELECT *,
quantity*purchase_price AS purchase_cost,
ROUND(revenue-(quantity*purchase_price),2) AS margin,
{{ margin_percent('revenue', 'quantity*purchase_price') }} AS margin_percent
FROM sub1