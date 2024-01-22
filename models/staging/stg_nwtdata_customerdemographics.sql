{{ config(materialized='view') }}
SELECT
    MAX(C.CustomerID) AS CustomerID,
    MAX(C.ContactName) AS CustomerContactName,
    MAX(C.CompanyName) AS CustomerCompanyName,
    MAX(C.ContactTitle) AS CustomerContactTitle,
    MAX(C.City) AS CustomerCity,
    MAX(C.Region) AS CustomerRegion,
    MAX(T.TerritoryDescription) AS CustomerTerritory,
    COUNT(DISTINCT OD.OrderID) AS NumberOfOrders,
    SUM(OD.UnitPrice * OD.Quantity * (1 - OD.Discount)) AS TotalSales,
    SUM((OD.UnitPrice - P.UnitCost) * OD.Quantity) AS TotalProfit,
    OD.Discount,
    Quantity,
    ProductName,
    CategoryName

FROM {{ ref('raw_customer') }} AS C
JOIN {{ ref('raw_order') }} AS O ON C.CustomerID = O.CustomerID
JOIN {{ ref('raw_order_detail') }} AS OD ON O.OrderID = OD.OrderID
JOIN {{ ref('raw_product') }} AS P ON OD.ProductID = P.ProductID
JOIN {{ ref('raw_employee') }} AS E ON O.EmployeeID = E.EmployeeID
JOIN {{ ref('raw_employee_territory') }} AS ET ON E.EmployeeID = ET.EmployeeID
JOIN {{ ref('raw_territory') }} AS T ON ET.TerritoryID = T.TerritoryID
JOIN {{ ref('raw_category') }} AS Ca ON p.CategoryId = Ca.CategoryId

GROUP BY CustomerID, OD.Discount,Quantity,ProductName,CategoryName
ORDER BY TotalSales DESC -- To get top customers by net sales
