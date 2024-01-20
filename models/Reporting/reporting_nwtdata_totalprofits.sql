SELECT
    OrderId,
    ProductName,
    CategoryName,
    QuantityPerUnit,
    UnitPrice,
    UnitCost,
    Quantity,
    Discount,
    TotalProfits

from {{ ref('stg_nwtdata_totalprofits') }}