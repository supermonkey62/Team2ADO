SELECT
    --CustomerID,
    CustomerContactName,
    CustomerCompanyName,
    CustomerContactTitle,
    CustomerCity,
    CustomerRegion,
    CustomerTerritory,
    NumberOfOrders,
    TotalSales,
    TotalProfit,
    Discount,
    Quantity,
    ProductName,
    CategoryName


from {{ ref('stg_nwtdata_customerdemographics') }}