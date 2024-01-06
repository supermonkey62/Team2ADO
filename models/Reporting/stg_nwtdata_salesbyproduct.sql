{{ config(materialized='view') }}

SELECT
  orderid,
  p.unitprice,
  quantity,
  discount,
  productname,
  supplierid,
  categoryid,
  QuantityPerUnit,
  unitsinstock,
  unitsonorder,
  reorderlevel,
  discontinued,
  (p.unitprice * (1 - discount)) * Quantity AS Sales

FROM {{ ref('nwtdata_product') }} AS p
JOIN {{ ref('nwtdata_order_detail') }} AS o ON p.ProductId = o.ProductId