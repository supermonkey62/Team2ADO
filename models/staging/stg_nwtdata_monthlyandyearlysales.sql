{{ config(materialized='view') }}

SELECT
  o.OrderId,
  OrderDate,
  EXTRACT(MONTH FROM OrderDate) AS OrderMonth,
  EXTRACT(YEAR FROM OrderDate) AS OrderYear,
  Quantity,
  CategoryName,
  ProductName,
  SUM((od.unitprice * (1 - discount)) * Quantity) AS Revenue,
  SUM((p.unitcost * od.Quantity)) AS CostOfSales,
  (Revenue - CostOfSales) AS GrossProfit,
  (GrossProfit/ Revenue) AS GrossProfitMargin
  
FROM {{ ref('intermediate_order') }} AS o
JOIN {{ ref('intermediate_order_detail') }} AS od ON o.OrderId = od.OrderId
JOIN {{ ref('intermediate_product') }} AS p ON od.ProductId = p.ProductId
JOIN {{ ref('intermediate_category') }} AS c ON p.CategoryId = c.CategoryId

GROUP BY o.OrderId, OrderDate, OrderMonth, Quantity, CategoryName, ProductName
ORDER BY OrderMonth ASC
