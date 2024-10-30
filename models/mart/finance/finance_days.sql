WITH revenue_subquery AS (
        SELECT date_date
        ,COUNT(DISTINCT orders_id) AS nb_transactions
        ,ROUND(SUM(revenue),2) AS revenue
        ,ROUND(SUM(revenue)/COUNT(DISTINCT orders_id)) AS average_basket
        FROM {{ref("int_orders_margin")}}
        GROUP BY date_date
        ORDER BY date_date DESC
    )
,
    margin_subquery AS (
        SELECT date_date
        ,ROUND(SUM(tot_margin),2) AS margin
        ,ROUND (SUM(Operational_margin),2) AS operationnal_margin
        ,SUM(quantity) AS quantity
        ,SUM(purchase_cost) AS purchase_cost
        ,SUM (shipping_fee) AS shipping_fee
        ,SUM(logcost) AS logcost
        ,SUM(ship_cost) As shipcost
        FROM {{ref("int_orders_operational")}}
        GROUP BY date_date
        ORDER BY date_date
    )
    SELECT *
    FROM revenue_subquery
    INNER JOIN margin_subquery
    USING (date_date)
    ORDER BY date_date DESC