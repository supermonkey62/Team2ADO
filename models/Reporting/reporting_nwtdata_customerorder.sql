SELECT
    OrderID,
    OrderDate,
    RequiredDate,
    ShippedDate,
    OrderStatus,
    CustomerID,
    CompanyName,
    ShipCity,
    ShipRegion,
    ShipCountry,
    ShipName

from {{ ref('stg_nwtdata_customerorder') }}