SELECT
    OrderId,
    ProductName,
    CategoryName,
    QuantityPerUnit,
    UnitPrice,
    UnitCost,
    Quantity,
    Discount,
    TotalProfit

from {{ ref('stg_nwtdata_totalprofits') }}