{{ config(materialized='view') }}
SELECT
    E.EmployeeID,
    CONCAT(E.FirstName, ' ', E.LastName) AS EmployeeName,
    COUNT(O.OrderID) AS TotalOrders,
    SUM(OD.Quantity * OD.UnitPrice * (1 - OD.Discount)) AS TotalSales,
    AVG(OD.Quantity * OD.UnitPrice * (1 - OD.Discount)) AS AvgOrderValue
FROM {{ ref('raw_employee') }} AS E
JOIN {{ ref('raw_order') }} AS O ON E.EmployeeID = O.EmployeeID
JOIN {{ ref('raw_order_detail') }} AS OD ON O.OrderID = OD.OrderID
GROUP BY E.EmployeeID, EmployeeName
ORDER BY TotalOrders DESC

