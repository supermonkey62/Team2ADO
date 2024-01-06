{{ config(materialized='view') }}

SELECT
  c.CustomerId,
  c.CustomerName,
  SUM((p.unitprice * (1 - discount)) * Quantity) AS CustomerSales
FROM {{ ref('nwtdata_customers') }} AS c
JOIN {{ ref('nwtdata_orders') }} AS o ON c.CustomerId = o.CustomerId
JOIN {{ ref('nwtdata_order_detail') }} AS od ON od.OrderId = o.OrderID
JOIN {{ ref('nwtdata_product') }} AS p ON p.ProductId = od.ProductId

GROUP BY c.CustomerId, c.CustomerName