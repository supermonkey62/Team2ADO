{{ config(materialized='view') }}

SELECT
    od.OrderId,
    p.ProductName,
    p.ProductId,
    c.CategoryName,
    p.QuantityPerUnit,
    od.UnitPrice,
    UnitCost,  -- Assuming UnitCost comes from one of the joined tables
    od.Quantity,
    od.Discount,
    (od.UnitPrice * (1 - od.Discount)) * od.Quantity AS RevenuePerOrderDetail,
    UnitCost * od.Quantity AS UnitCostPerOrderDetail,
    ((od.UnitPrice * (1 - od.Discount)) * od.Quantity) - (UnitCost * od.Quantity) AS ProfitPerOrderDetail

FROM {{ ref('intermediate_product') }} AS p
JOIN {{ ref('intermediate_order_detail') }} AS od ON p.ProductId = od.ProductId
JOIN {{ ref('intermediate_category') }} AS c ON p.CategoryId = c.CategoryId

GROUP BY 
    od.OrderId,
    p.ProductName,
    p.ProductId,
    c.CategoryName,
    p.QuantityPerUnit,
    od.UnitPrice,
    UnitCost,  -- Assuming UnitCost comes from one of the joined tables
    od.Quantity,
    od.Discount
