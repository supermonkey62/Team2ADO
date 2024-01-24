SELECT
    ShipperID,
    ShipperCompanyName,
    TotalOrdersShipped,
    UniqueCustomersServed,
    TotalProductsShipped,
    TotalRevenueGenerated,
    AverageFreightCost,
    TotalFreightCost,
    OnTimeShipments,
    TotalShipments,
    OnTimeDeliveryRate

from {{ ref('stg_nwtdata_shipperperformance') }}