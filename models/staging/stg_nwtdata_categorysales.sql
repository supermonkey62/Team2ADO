{{ config(materialized='view') }}

SELECT
  c.CategoryId,
  CategoryName,
  SUM((od.unitprice * (1 - discount)) * Quantity) AS ProductSales

FROM {{ ref('nwtdata_product') }} AS p
JOIN {{ ref('nwtdata_order_detail') }} AS od ON p.ProductId = od.ProductId
JOIN {{ ref('nwtdata_category') }} AS c ON p.CategoryId = c.CategoryId

GROUP BY CategoryName, c.CategoryId
ORDER BY ProductSales DESC