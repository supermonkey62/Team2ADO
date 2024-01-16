{{ config(materialized='view') }}

SELECT
    S.SupplierID,
    S.CompanyName AS SupplierCompanyName,
    COUNT(DISTINCT P.ProductID) AS TotalProductsSupplied,
    AVG(P.UnitPrice) AS AverageProductPrice,
    AVG(CASE WHEN O.ShippedDate IS NOT NULL THEN 1 ELSE 0 END) AS OnTimeDeliveryRate
FROM {{ ref('raw_supplier') }} AS S
JOIN {{ ref('raw_product') }} AS P ON S.SupplierID = P.SupplierID
JOIN {{ ref('raw_order_detail') }} AS OD ON P.ProductID = OD.ProductID
JOIN {{ ref('raw_order') }} AS O ON OD.OrderID = O.OrderID
GROUP BY
    S.SupplierID, S.CompanyName
ORDER BY
    S.SupplierID DESC
