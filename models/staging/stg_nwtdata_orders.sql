SELECT od.*,
    (od.unitprice * (1 - od.discount) - p.unitprice) AS orderprofit
FROM
    {{ ref('nwtdata_order_detail')}} AS od
JOIN
    {{ ref('nwtdata_product')}} AS p
ON
    od.productid = p.productid