{{ config(materialized='view') }}

SELECT
    DISTINCT(OD.OrderID) AS OrderID,
    C.CustomerID,
    C.CompanyName,
    C.ContactName,
    O.OrderDate,
    O.RequiredDate,
    O.ShippedDate,
    ShipCity,
    ShipRegion,
    ShipCountry,
    ShipName,
    productName,
    CategoryName,
    ReorderLevel,
    UnitsInStock,
    UnitsOnOrder,
    Description,
    CASE
        WHEN O.ShippedDate IS NULL THEN 'Pending'
        WHEN O.ShippedDate <= O.RequiredDate THEN 'On Time'
        ELSE 'Shipped Late'
    END AS OrderStatus

FROM {{ ref('raw_order') }} AS O
JOIN {{ ref('raw_customer') }} AS C ON O.CustomerID = C.CustomerID
JOIN {{ ref('raw_order_detail') }} AS OD ON O.OrderID = OD.OrderID
JOIN {{ ref('raw_product') }} AS P ON OD.ProductID = P.ProductID
JOIN {{ ref('raw_category') }} AS Ca ON p.CategoryId = Ca.CategoryId