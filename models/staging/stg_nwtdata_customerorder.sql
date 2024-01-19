{{ config(materialized='view') }}

SELECT
    O.OrderID,
    O.OrderDate,
    O.RequiredDate,
    O.ShippedDate,
    ShipCity,
    ShipRegion,
    ShipCountry,
    ShipName,
    CASE
        WHEN O.ShippedDate IS NULL THEN 'Pending'
        WHEN O.ShippedDate <= O.RequiredDate THEN 'On Time'
        ELSE 'Shipped Late'
    END AS OrderStatus,
    C.CustomerID,
    C.CompanyName
FROM {{ ref('raw_order') }} AS O
JOIN {{ ref('raw_customer') }} AS C ON O.CustomerID = C.CustomerID
