{{ config(materialized='view') }}

SELECT
  o.orderid,
  od.unitprice,
  quantity,
  discount,
  productname,
  SupplierId,
  p.CategoryId,
  CategoryName,
  QuantityPerUnit,
  reorderlevel,
  discontinued,
  unitcost,
  OrderDate,
  EXTRACT(MONTH FROM OrderDate) AS OrderMonth,
  EXTRACT(YEAR FROM OrderDate) AS OrderYear,
  SUM((od.unitprice * (1 - discount)) * Quantity) AS Revenue,
  SUM(od.unitprice * (1 - discount)) - unitcost AS Profit,
  SUM((od.unitprice - unitcost) / od.unitprice) AS ProfitMargin,
  SUM((od.unitprice * (1 - discount)) - unitcost) * quantity AS TotalProfit

FROM {{ ref('intermediate_order') }} AS o
JOIN {{ ref('intermediate_order_detail') }} AS od ON o.OrderId = od.OrderId
JOIN {{ ref('intermediate_product') }} AS p ON od.ProductId = p.ProductId
JOIN {{ ref('intermediate_category') }} AS c ON p.CategoryId = c.CategoryId
GROUP BY productname, categoryname, p.categoryid, o.orderid, od.unitprice, quantity, discount, supplierid, QuantityPerUnit, reorderlevel, discontinued, unitcost, orderdate
