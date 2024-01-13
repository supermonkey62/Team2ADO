{{ config(materialized='view') }}

SELECT
  r.RegionId,
  RegionDescription,
  SUM((od.unitprice * (1 - discount)) * Quantity) AS RegionSales

FROM {{ ref('raw_region') }} AS r
JOIN {{ ref('raw_territory') }} AS t ON r.RegionId = t.RegionId
JOIN {{ ref('raw_employee_territory') }} AS et ON t.TerritoryId = et.TerritoryId
JOIN {{ ref('raw_employee') }} AS e ON et.EmployeeId = e.EmployeeId
JOIN {{ ref('raw_orders') }} AS o ON e.EmployeeId = o.EmployeeId
JOIN {{ ref('raw_order_detail') }} AS od ON o.OrderId = od.OrderId
JOIN {{ ref('raw_product') }} AS p ON od.ProductId = p.ProductId

GROUP BY r.RegionId, RegionDescription
ORDER BY RegionSales DESC