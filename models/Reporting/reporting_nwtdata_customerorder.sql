SELECT
    OrderID,
    CustomerID,
    CompanyName,
    ContactName,
    OrderDate,
    RequiredDate,
    ShippedDate,
    ShipCity,
    ShipRegion,
    ShipCountry,
    ShipName,
    productName,
    CategoryName,
    ReorderLevel,
    UnitsInStock,
    UnitsOnOrder,
    Description,
    OrderStatus


from {{ ref('stg_nwtdata_customerorder') }}