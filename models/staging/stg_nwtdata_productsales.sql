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
  (od.unitprice * (1 - discount)) * Quantity AS Sales

FROM {{ ref('nwtdata_product') }} AS p
JOIN {{ ref('nwtdata_order_detail') }} AS od ON p.ProductId = od.ProductId