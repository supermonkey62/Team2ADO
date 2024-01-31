{{ config(materialized='view') }}

WITH SupplierProducts AS (
    SELECT
        SupplierID,
        SUM(UnitsInStock + UnitsOnOrder) AS TotalProductsSupplied
    FROM {{ ref('intermediate_product') }}
    GROUP BY SupplierID
)

SELECT
    S.SupplierID,
    S.CompanyName AS SupplierCompanyName,
    S.City AS SupplierCity,
    S.Country AS SupplierCountry,
    COUNT(DISTINCT P.ProductID) AS UniqueProductsSupplied,
    COALESCE(SP.TotalProductsSupplied, 0) AS TotalProductsSupplied,
    SUM(P.UnitCost * P.UnitsInStock) AS InventoryValue,
    SUM(OD.UnitPrice * OD.Quantity) AS TotalSalesBySupplier,
    SUM((OD.UnitPrice - P.UnitCost) * OD.Quantity) AS TotalProfitBySupplier
FROM {{ ref('intermediate_supplier') }} AS S
LEFT JOIN SupplierProducts AS SP ON S.SupplierID = SP.SupplierID
LEFT JOIN {{ ref('intermediate_product') }} AS P ON S.SupplierID = P.SupplierID
LEFT JOIN {{ ref('intermediate_order_detail') }} AS OD ON P.ProductID = OD.ProductID
GROUP BY
    S.SupplierID, S.CompanyName, S.City, S.Country, SP.TotalProductsSupplied
ORDER BY
    S.SupplierID ASC

