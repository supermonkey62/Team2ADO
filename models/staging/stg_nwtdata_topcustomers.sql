{{ config(materialized='view') }}

SELECT
  c.CustomerId,
  ((od.unitprice * (1 - discount)) * Quantity) AS CustomerSales

FROM {{ ref('raw_customer') }} AS c
JOIN {{ ref('raw_order') }} AS o ON c.CustomerId = o.CustomerId
JOIN {{ ref('raw_order_detail') }} AS od ON od.OrderId = o.OrderID
JOIN {{ ref('raw_product') }} AS p ON p.ProductId = od.ProductId

GROUP BY c.CustomerId, CustomerSales
ORDER BY
  CustomerSales DESC