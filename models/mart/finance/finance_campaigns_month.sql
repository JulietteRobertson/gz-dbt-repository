SELECT 
FORMAT_DATE('%Y-%m',DATE (date_date)) AS datemonth,
SUM(ads_cost) AS ads_cost,
SUM(ads_impression) AS ads_impression, 
SUM(ads_clicks) AS ads_clicks,
SUM(nb_transactions) AS nb_transactions,
SUM(revenue) AS revenue,
SUM(average_basket) AS average_basket,
SUM(margin) AS margin,
SUM(operationnal_margin) AS operationnal_margin,
SUM(quantity) AS quantity,
SUM(ads_margin) AS ads_margin,
SUM(purchase_cost) AS purchase_cost,
SUM(shipping_fee) As shipping_fee,
SUM(logcost) AS logcost,
SUM(shipcost) As ship_cost,
FROM {{ ref('Finance_campaigns_day') }}
GROUP BY datemonth 