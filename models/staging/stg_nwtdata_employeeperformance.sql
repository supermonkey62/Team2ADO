{{ config(materialized='view') }}
SELECT
    E.EmployeeID,
    CONCAT(E.FirstName, ' ', E.LastName) AS EmployeeName,
    SUM((od.unitprice * (1 - discount)) * Quantity) AS Revenue,
    AVG(OD.Quantity * OD.UnitPrice * (1 - OD.Discount)) AS AvgOrderValue,
    COUNT(DISTINCT O.OrderID) AS NumberOfOrders,
    SUM((OD.UnitPrice - P.UnitCost) * OD.Quantity) AS TotalProfit
FROM {{ ref('raw_employee') }} AS E
JOIN {{ ref('raw_order') }} AS O ON E.EmployeeID = O.EmployeeID
JOIN {{ ref('raw_order_detail') }} AS OD ON O.OrderID = OD.OrderID
JOIN {{ ref('raw_product') }} AS P ON OD.ProductID = P.ProductID
GROUP BY E.EmployeeID, EmployeeName
ORDER BY NumberOfOrders DESC
