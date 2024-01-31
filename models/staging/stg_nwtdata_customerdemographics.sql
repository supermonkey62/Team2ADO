SELECT
    O.CustomerID,
    MAX(C.ContactName) AS CustomerContactName,
    MAX(C.CompanyName) AS CustomerCompanyName,
    MAX(C.ContactTitle) AS CustomerContactTitle,
    MAX(C.City) AS CustomerCity,
    MAX(C.Region) AS CustomerRegion,
    MAX(T.TerritoryDescription) AS CustomerTerritory,
    COUNT(DISTINCT OD.OrderID) AS NumberOfOrders,
    SUM((od.unitprice * (1 - discount)) * Quantity) AS Revenue,
    SUM((OD.UnitPrice - P.UnitCost) * OD.Quantity) AS TotalProfit,
    MAX(OD.Discount) AS Discount,
    MAX(Quantity) AS Quantity,
    MAX(ProductName) AS ProductName,
    MAX(CategoryName) AS CategoryName

FROM {{ ref('intermediate_customer') }} AS C
JOIN {{ ref('intermediate_order') }} AS O ON C.CustomerID = O.CustomerID
JOIN {{ ref('intermediate_order_detail') }} AS OD ON O.OrderID = OD.OrderID
JOIN {{ ref('intermediate_product') }} AS P ON OD.ProductID = P.ProductID
JOIN {{ ref('intermediate_employee') }} AS E ON O.EmployeeID = E.EmployeeID
JOIN {{ ref('intermediate_employee_territory') }} AS ET ON E.EmployeeID = ET.EmployeeID
JOIN {{ ref('intermediate_territory') }} AS T ON ET.TerritoryID = T.TerritoryID
JOIN {{ ref('intermediate_category') }} AS Ca ON P.CategoryId = Ca.CategoryId

GROUP BY O.CustomerID
ORDER BY Revenue DESC -- To get top customers by net sales

