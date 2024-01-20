{{ config(materialized='view') }}
SELECT
    E.EmployeeID,
    P.ProductID,
    P.ProductName,
    CONCAT(E.FirstName, ' ', E.LastName) AS EmployeeName,
    SUM(OD.Quantity) AS TotalQuantity,
    SUM(OD.Quantity * P.UnitPrice) AS TotalValue
FROM {{ ref('raw_employee') }} AS E
JOIN {{ ref('raw_order') }} AS O ON E.EmployeeID = O.EmployeeID
JOIN {{ ref('raw_order_detail') }} AS OD ON O.OrderID = OD.OrderID
JOIN {{ ref('raw_product') }} AS P ON OD.ProductID = P.ProductID
GROUP BY E.EmployeeID, P.ProductID, P.ProductName, CONCAT(E.FirstName, ' ', E.LastName)

