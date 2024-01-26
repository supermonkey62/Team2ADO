{{ config(materialized='view') }}

SELECT
  c.CustomerID,
  ContactName,
  CompanyName,
  ContactTitle,
  SUM((od.unitprice * (1 - discount)) * Quantity) AS Revenue,
  City,
  Country,
  Address,
  ShipCountry,
  ShipCity,
  od.OrderID,
  od.Unitprice,
  Quantity,
  Discount
  
FROM {{ ref('raw_customer') }} AS c
JOIN {{ ref('raw_order') }} AS o ON c.CustomerID = o.CustomerID
JOIN {{ ref('raw_order_detail') }} AS od ON od.OrderID = o.OrderID
JOIN {{ ref('raw_product') }} AS p ON p.ProductID = od.ProductID

GROUP BY c.CustomerID, ContactName, CompanyName, ContactTitle, City, Country, Address, ShipCountry, ShipCity, od.OrderId, od.UnitPrice, Quantity, Discount
ORDER BY
  Revenue DESC