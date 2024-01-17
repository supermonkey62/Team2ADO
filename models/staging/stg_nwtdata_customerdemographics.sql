-- {{ config(materialized='view') }}

-- SELECT
--     C.CustomerID,
--     MAX(C.ContactName) AS CustomerContactName,
--     MAX(C.CompanyName) AS CustomerCompanyName,
--     MAX(C.ContactTitle) AS CustomerContactTitle,
--     MAX(C.City) AS CustomerCity,
--     MAX(C.Region) AS CustomerRegion,
--     MAX(T.TerritoryDescription) AS CustomerTerritory
    
-- FROM {{ ref('raw_customer') }} AS C
-- JOIN {{ ref('raw_order') }} AS O ON C.CustomerID = O.CustomerID
-- JOIN {{ ref('raw_employee') }} AS E ON O.EmployeeID = E.EmployeeID
-- JOIN {{ ref('raw_employee_territory') }} AS ET ON E.EmployeeID = ET.EmployeeID
-- JOIN {{ ref('raw_territory') }} AS T ON ET.TerritoryID = T.TerritoryID
-- GROUP BY C.CustomerID
{{ config(materialized='view') }}
SELECT
    C.CustomerID,
    MAX(C.ContactName) AS CustomerContactName,
    MAX(C.CompanyName) AS CustomerCompanyName,
    MAX(C.ContactTitle) AS CustomerContactTitle,
    MAX(C.City) AS CustomerCity,
    MAX(C.Region) AS CustomerRegion,
    MAX(T.TerritoryDescription) AS CustomerTerritory,
    COUNT(DISTINCT O.OrderID) AS NumberOfOrders,
    SUM(OD.UnitPrice * OD.Quantity * (1 - OD.Discount)) AS TotalSales,
    SUM((OD.UnitPrice - P.UnitCost) * OD.Quantity) AS TotalProfit

FROM {{ ref('raw_customer') }} AS C
JOIN {{ ref('raw_order') }} AS O ON C.CustomerID = O.CustomerID
JOIN {{ ref('raw_order_detail') }} AS OD ON O.OrderID = OD.OrderID
JOIN {{ ref('raw_product') }} AS P ON OD.ProductID = P.ProductID
JOIN {{ ref('raw_employee') }} AS E ON O.EmployeeID = E.EmployeeID
JOIN {{ ref('raw_employee_territory') }} AS ET ON E.EmployeeID = ET.EmployeeID
JOIN {{ ref('raw_territory') }} AS T ON ET.TerritoryID = T.TerritoryID
GROUP BY C.CustomerID
ORDER BY TotalSales DESC -- To get top customers by net sales
