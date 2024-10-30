SELECT
date_date,
COUNT(orders_id) AS nb_transactions, 
SUM(revenue) AS tot_revenue,
AVG(revenue) AS average_basket,
SUM(tot_margin) AS margin, 
SUM(tot_margin-logcost) AS operational_margin, 
SUM(purchase_cost) AS tot_purchase_cost,
SUM(shipping_fee) AS tot_shipping_fee,
SUM(quantity) AS tot_quantity,
SUM(logcost) AS tot_logcost
FROM {{ref("int_orders_operational")}}
GROUP BY date_date
ORDER BY date_date DESC