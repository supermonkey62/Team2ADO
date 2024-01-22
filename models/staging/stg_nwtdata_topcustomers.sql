{{ config(materialized='view') }}

SELECT
  c.CustomerId,
  ContactName,
  CompanyName,
  ContactTitle,
  ((od.unitprice * (1 - discount)) * Quantity) AS CustomerSales,
  City,
  Country,
  Address,
  ShipCountry,
  ShipCity,
  od.OrderId,
  od.Unitprice,
  Quantity,
  Discount
  
FROM {{ ref('raw_customer') }} AS c
JOIN {{ ref('raw_order') }} AS o ON c.CustomerId = o.CustomerId
JOIN {{ ref('raw_order_detail') }} AS od ON od.OrderId = o.OrderID
JOIN {{ ref('raw_product') }} AS p ON p.ProductId = od.ProductId

GROUP BY c.CustomerId, ContactName, CompanyName, ContactTitle, CustomerSales, City, Country, Address, ShipCountry, ShipCity, od.OrderId, od.UnitPrice, Quantity, Discount
ORDER BY
  CustomerSales DESC