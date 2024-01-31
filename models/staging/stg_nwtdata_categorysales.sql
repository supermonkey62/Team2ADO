{{ config(materialized='view') }}

SELECT
  c.CategoryId,
  CategoryName,
  SUM((od.unitprice * (1 - discount)) * Quantity) AS Revenue

FROM {{ ref('intermediate_product') }} AS p
JOIN {{ ref('intermediate_order_detail') }} AS od ON p.ProductId = od.ProductId
JOIN {{ ref('intermediate_category') }} AS c ON p.CategoryId = c.CategoryId

GROUP BY CategoryName, c.CategoryId, od.unitprice, od.discount, od.Quantity
ORDER BY Revenue DESC