SELECT
    OrderId,
    ProductName,
    CategoryName,
    QuantityPerUnit,
    UnitPrice,
    UnitCost,
    Quantity,
    Discount,
    RevenuePerOrderDetail,
    UnitCostPerOrderDetail,
    ProfitPerOrderDetail

from {{ ref('stg_nwtdata_totalprofits') }}