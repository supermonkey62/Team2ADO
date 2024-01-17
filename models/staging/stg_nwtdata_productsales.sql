{{ config(materialized='view') }}

SELECT
  orderid,
  od.unitprice,
  quantity,
  discount,
  productname,
  supplierid,
  categoryid,
  QuantityPerUnit,
  reorderlevel,
  discontinued,
  unitcost,
  (od.unitprice * (1 - discount)) * Quantity AS Sales,
  (od.unitprice * (1 - discount) * Quantity) - (unitcost*quantity) AS Profit,
  p.unitprice - unitcost AS ProfitMargin

FROM {{ ref('raw_product') }} AS p
JOIN {{ ref('raw_order_detail') }} AS od ON p.ProductId = od.ProductId