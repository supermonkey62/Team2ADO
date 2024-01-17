SELECT
    CustomerID,
    CustomerContactName,
    CustomerCompanyName,
    CustomerContactTitle,
    CustomerCity,
    CustomerRegion,
    CustomerTerritory,
    NumberOfOrders,
    TotalSales,
    TotalProfit



from {{ ref('stg_nwtdata_customerdemographics') }}