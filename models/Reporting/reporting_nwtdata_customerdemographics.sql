SELECT
    CustomerID,
    CustomerContactName,
    CustomerCompanyName,
    CustomerContactTitle,
    CustomerCity,
    CustomerRegion,
    CustomerTerritory,
    NumberOfOrders,
    Revenue,
    TotalProfit,
    Discount,
    Quantity,
    ProductName,
    CategoryName


from {{ ref('stg_nwtdata_customerdemographics') }}