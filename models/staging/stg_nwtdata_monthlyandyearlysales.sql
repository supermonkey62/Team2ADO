{{ config(materialized='view') }}

SELECT
  o.OrderId,
  OrderDate,
  EXTRACT(MONTH FROM OrderDate) AS OrderMonth,
  EXTRACT(YEAR FROM OrderDate) AS OrderYear,
  Quantity,
  CategoryName,
  ProductName,
  ((od.unitprice * (1 - discount)) * Quantity) AS TotalRevenue,
  ((p.unitcost * od.Quantity)) AS CostOfSales,
  (SUM(TotalRevenue) - SUM(CostOfSales)) AS GrossProfit,
  ((GrossProfit/ SUM(TotalRevenue))) AS GrossProfitMargin
  --((SUM((od.unitprice * (1 - discount)) * Quantity)) - SUM(p.unitcost * od.Quantity)) AS GrossProfit
  --((((SUM((od.unitprice * (1 - discount)) * Quantity)) - SUM(p.unitcost * od.Quantity))/(SUM((od.unitprice * (1 - discount)) * Quantity))) * 100) AS GrossProfitMargin

FROM {{ ref('raw_order') }} AS o
JOIN {{ ref('raw_order_detail') }} AS od ON o.OrderId = od.OrderId
JOIN {{ ref('raw_product') }} AS p ON od.ProductId = p.ProductId
JOIN {{ ref('raw_category') }} AS c ON p.CategoryId = c.CategoryId

GROUP BY o.OrderId, OrderDate, OrderMonth, Quantity, CategoryName, ProductName, TotalRevenue, CostOfSales
ORDER BY OrderMonth ASC
