WITH sub1 AS (SELECT *
FROM {{ ref('int_campaigns_day') }}
INNER JOIN {{ ref('finance_days') }}
USING (date_date))

SELECT *,
operationnal_margin-ads_cost AS ads_margin
FROM sub1
ORDER BY date_date DESC
