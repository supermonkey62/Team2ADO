SELECT
    MAX(O.OrderID) AS OrderID,
    MAX(C.CustomerID) AS CustomerID,
    MAX(C.CompanyName) AS CustomerCompanyName,
    MAX(C.ContactName) AS CustomerContactName,
    MAX(C.ContactTitle) AS CustomerContactTitle,
    MAX(O.OrderDate) AS OrderDate,
    MAX(O.RequiredDate) AS RequiredDate,
    MAX(O.ShippedDate) AS ShippedDate,
    MAX(ShipCity) AS ShipCity,
    MAX(ShipRegion) AS ShipRegion,
    MAX(ShipCountry) AS ShipCountry,
    MAX(ShipName) AS ShipName,
    MAX(productName) AS productName,
    MAX(CategoryName) AS CategoryName,
    MAX(ReorderLevel) AS ReorderLevel,
    MAX(UnitsInStock) AS UnitsInStock,
    MAX(UnitsOnOrder) AS UnitsOnOrder,
    MAX(Description) AS Description,
    CASE
        WHEN MAX(O.ShippedDate) IS NULL THEN 'Pending'
        WHEN MAX(O.ShippedDate) <= MAX(O.RequiredDate) THEN 'On Time'
        ELSE 'Shipped Late'
    END AS OrderStatus

FROM {{ ref('intermediate_order') }} AS O
JOIN {{ ref('intermediate_customer') }} AS C ON O.CustomerID = C.CustomerID
JOIN {{ ref('intermediate_order_detail') }} AS OD ON O.OrderID = OD.OrderID
JOIN {{ ref('intermediate_product') }} AS P ON OD.ProductID = P.ProductID
JOIN {{ ref('intermediate_category') }} AS Ca ON P.CategoryId = Ca.CategoryId

GROUP BY O.OrderID
