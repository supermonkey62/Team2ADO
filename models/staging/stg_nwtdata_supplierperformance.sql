{{ config(materialized='view') }}

WITH SupplierProducts AS (
    SELECT
        SupplierID,
        SUM(UnitsInStock + UnitsOnOrder) AS TotalProductsSupplied
    FROM {{ ref('raw_product') }}
    GROUP BY SupplierID
)

SELECT
    S.SupplierID,
    S.CompanyName AS SupplierCompanyName,
    S.City AS SupplierCity,
    S.Country AS SupplierCountry,
    COUNT(DISTINCT P.ProductID) AS UniqueProductsSupplied,
    COALESCE(SP.TotalProductsSupplied, 0) AS TotalProductsSupplied,
    SUM(P.UnitCost) AS TotalProductCost
FROM {{ ref('raw_supplier') }} AS S
LEFT JOIN SupplierProducts AS SP ON S.SupplierID = SP.SupplierID
LEFT JOIN {{ ref('raw_product') }} AS P ON S.SupplierID = P.SupplierID
LEFT JOIN {{ ref('raw_order_detail') }} AS OD ON P.ProductID = OD.ProductID
LEFT JOIN {{ ref('raw_order') }} AS O ON OD.OrderID = O.OrderID
GROUP BY
    S.SupplierID, S.CompanyName, S.City, S.Country, SP.TotalProductsSupplied
ORDER BY
    S.SupplierID ASC
