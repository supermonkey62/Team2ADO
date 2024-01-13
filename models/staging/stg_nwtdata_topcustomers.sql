{{ config(materialized='view') }}

SELECT
  c.CustomerId,
  SUM((od.unitprice * (1 - discount)) * Quantity) AS CustomerSales
FROM {{ ref('raw_customers') }} AS c
JOIN {{ ref('raw_orders') }} AS o ON c.CustomerId = o.CustomerId
JOIN {{ ref('raw_order_detail') }} AS od ON od.OrderId = o.OrderID
JOIN {{ ref('raw_product') }} AS p ON p.ProductId = od.ProductId

GROUP BY c.CustomerId
ORDER BY
  CustomerSales DESC