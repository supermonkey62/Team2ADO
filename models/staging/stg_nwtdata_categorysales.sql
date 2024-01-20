{{ config(materialized='view') }}

SELECT
  c.CategoryId,
  CategoryName,
  ((od.unitprice * (1 - discount)) * Quantity) AS CategorySales

FROM {{ ref('raw_product') }} AS p
JOIN {{ ref('raw_order_detail') }} AS od ON p.ProductId = od.ProductId
JOIN {{ ref('raw_category') }} AS c ON p.CategoryId = c.CategoryId

GROUP BY CategoryName, c.CategoryId, od.unitprice, od.discount, od.Quantity
ORDER BY CategorySales DESC