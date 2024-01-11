SELECT
    OrderID,
    OrderDate,
    RequiredDate,
    ShippedDate,
    OrderStatus,
    CustomerID,
    CompanyName

from {{ ref('stg_nwtdata_customerorder') }}