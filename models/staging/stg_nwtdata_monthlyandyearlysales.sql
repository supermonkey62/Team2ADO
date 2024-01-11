{{ config(materialized='view') }}

SELECT
  o.OrderId,
  OrderDate,
  EXTRACT(MONTH FROM OrderDate) AS OrderMonth,
  EXTRACT(YEAR FROM OrderDate) AS OrderYear,
  Quantity,
  CategoryName,
  ProductName,
  SUM((od.unitprice * (1 - discount)) * Quantity) AS ProductSales

FROM {{ ref('nwtdata_orders') }} AS o
JOIN {{ ref('nwtdata_order_detail') }} AS od ON o.OrderId = od.OrderId
JOIN {{ ref('nwtdata_product') }} AS p ON od.ProductId = p.ProductId
JOIN {{ ref('nwtdata_category') }} AS c ON p.CategoryId = c.CategoryId

GROUP BY o.OrderId, OrderDate, OrderMonth, Quantity, CategoryName, ProductName
ORDER BY OrderMonth ASC