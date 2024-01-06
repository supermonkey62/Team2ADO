{{ config(materialized='view') }}

SELECT
  r.RegionId,
  RegionDescription,
  SUM((p.unitprice * (1 - discount)) * Quantity) AS RegionSales

FROM {{ ref('nwtdata_region') }} AS r
JOIN {{ ref('nwtdata_territory') }} AS t ON r.RegionId = t.RegionId
JOIN {{ ref('nwtdata_employee_territory') }} AS et ON t.TerritoryId = et.TerritoryId
JOIN {{ ref('nwtdata_employee') }} AS e ON et.EmployeeId = e.EmployeeId
JOIN {{ ref('nwtdata_orders') }} AS o ON e.EmployeeId = o.EmployeeId
JOIN {{ ref('nwtdata_order_detail') }} AS od ON o.OrderId = od.OrderId
JOIN {{ ref('nwtdata_product') }} AS p ON od.ProductId = p.ProductId

GROUP BY r.RegionId, RegionDescription
ORDER BY RegionSales DESC