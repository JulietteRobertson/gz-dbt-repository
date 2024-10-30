WITH sub1 AS (SELECT *,
FROM {{ref("stg_gz_raw_data__raw_gz_ship")}}
JOIN {{ref("int_orders_margin")}} 
USING (orders_id) )

SELECT
*,
tot_margin+shipping_fee-logCost-ship_cost AS Operational_margin
FROM sub1