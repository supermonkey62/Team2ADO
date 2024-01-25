SELECT
    ShipperID,
    ShipperCompanyName,
    TotalOrdersShipped,
    UniqueCustomersServed,
    TotalProductsShipped,
    TotalRevenueGeneratedByShipper,
    TotalProfitGeneratedByShipper,
    AverageFreightCost,
    TotalFreightCost,
    OnTimeShipments,
    TotalShipments,
    OnTimeDeliveryRate

from {{ ref('stg_nwtdata_shipperperformance') }}