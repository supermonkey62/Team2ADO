{{ config(materialized='view') }}

SELECT
  c.CategoryName,
  SUM((p.unitprice * (1 - discount)) * Quantity) AS ProductSales

FROM {{ ref('nwtdata_product') }} AS p
JOIN {{ ref('nwtdata_order_detail') }} AS o ON p.ProductId = o.ProductId
JOIN {{ ref('nwtdata_category') }} AS c ON p.CategoryId = c.CategoryId

GROUP BY c.CategoryName
