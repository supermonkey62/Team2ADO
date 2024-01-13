{{ config(materialized='view') }}

SELECT
  c.CategoryId,
  CategoryName,
  SUM((od.unitprice * (1 - discount)) * Quantity) AS ProductSales

FROM {{ ref('raw_product') }} AS p
JOIN {{ ref('raw_order_detail') }} AS od ON p.ProductId = od.ProductId
JOIN {{ ref('raw_category') }} AS c ON p.CategoryId = c.CategoryId

GROUP BY CategoryName, c.CategoryId
ORDER BY ProductSales DESC