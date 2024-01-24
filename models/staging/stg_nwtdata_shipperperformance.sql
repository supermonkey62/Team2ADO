{{ config(materialized='view') }}

WITH ShipperMetrics AS (
    SELECT
        O.ShipVia AS ShipperID,
        COUNT(DISTINCT O.OrderID) AS TotalOrdersShipped,
        COUNT(DISTINCT O.CustomerID) AS UniqueCustomersServed,
        SUM(OD.Quantity) AS TotalProductsShipped,
        ROUND(SUM((OD.UnitPrice * OD.Quantity) * (1 - OD.Discount) - O.Freight), 2) AS TotalRevenueGenerated,
        ROUND(AVG(O.Freight), 2) AS AverageFreightCost,
        ROUND(SUM(O.Freight), 2) As TotalFreightCost,
        COUNT(RequiredDate > ShippedDate OR ShippedDate NOT LIKE 'null') AS OnTimeShipments,
        COUNT(*) AS TotalShipments
    FROM {{ ref('raw_order') }} AS O
    JOIN {{ ref('raw_order_detail') }} AS OD ON O.OrderID = OD.OrderID
    GROUP BY O.ShipVia
)

SELECT
    S.ShipperID,
    S.CompanyName AS ShipperCompanyName,
    SM.TotalOrdersShipped,
    SM.UniqueCustomersServed,
    SM.TotalProductsShipped,
    SM.TotalRevenueGenerated,
    SM.AverageFreightCost,
    SM.TotalFreightCost,
    SM.OnTimeShipments,
    SM.TotalShipments,
    ROUND(1.0 * SM.OnTimeShipments / SM.TotalShipments, 2) AS OnTimeDeliveryRate
FROM {{ ref('raw_shipper') }} AS S
LEFT JOIN ShipperMetrics AS SM ON S.ShipperID = SM.ShipperID
ORDER BY S.ShipperID

