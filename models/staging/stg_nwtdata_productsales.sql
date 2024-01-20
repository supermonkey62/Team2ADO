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
  (od.unitprice * (1 - discount)) * Quantity AS SalesRevenue,
  ((od.unitprice * (1 - discount)) - unitcost) AS Profit

FROM {{ ref('raw_order') }} AS o
JOIN {{ ref('raw_order_detail') }} AS od ON o.OrderId = od.OrderId
JOIN {{ ref('raw_product') }} AS p ON od.ProductId = p.ProductId
JOIN {{ ref('raw_category') }} AS c ON p.CategoryId = c.CategoryId
GROUP BY productname, categoryname, p.categoryid, o.orderid, od.unitprice, quantity, discount, supplierid, QuantityPerUnit, reorderlevel, discontinued, unitcost, orderdate, SalesRevenue, Profit
