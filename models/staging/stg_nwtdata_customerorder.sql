{{ config(materialized='view') }}

SELECT
    O.OrderID,
    O.OrderDate,
    O.RequiredDate,
    O.ShippedDate,
    CASE
        WHEN O.ShippedDate IS NULL THEN 'Pending'
        WHEN O.ShippedDate <= O.RequiredDate THEN 'On Time'
        ELSE 'Shipped Late'
    END AS OrderStatus,
    C.CustomerID,
    C.CompanyName
FROM {{ ref('raw_orders') }} AS O
JOIN {{ ref('raw_customers') }} AS C ON O.CustomerID = C.CustomerID
