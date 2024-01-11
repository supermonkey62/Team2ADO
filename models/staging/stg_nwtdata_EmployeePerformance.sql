{{ config(materialized='view') }}
SELECT
    E.EmployeeID,
    CONCAT(E.FirstName, ' ', E.LastName) AS EmployeeName,
    COUNT(O.OrderID) AS TotalOrders,
    SUM(OD.Quantity * OD.UnitPrice * (1 - OD.Discount)) AS TotalSales,
    AVG(OD.Quantity * OD.UnitPrice * (1 - OD.Discount)) AS AvgOrderValue
FROM {{ ref('nwtdata_employee') }} AS E
JOIN {{ ref('nwtdata_orders') }} AS O ON E.EmployeeID = O.EmployeeID
JOIN {{ ref('nwtdata_order_detail') }} AS OD ON O.OrderID = OD.OrderID
GROUP BY E.EmployeeID, EmployeeName
ORDER BY TotalOrders DESC

