{{ config(materialized='view') }}

SELECT
    OrderId,
    ProductName,
    CategoryName,
    QuantityPerUnit,
    od.UnitPrice,
    UnitCost,
    Quantity,
    Discount,
    ((od.unitprice * (1 - discount)) - unitcost) * Quantity AS TotalProfits

FROM {{ ref('raw_product') }} AS p
JOIN {{ ref('raw_order_detail') }} AS od ON p.ProductId = od.ProductId
JOIN {{ ref('raw_category') }} AS c ON p.CategoryId = c.CategoryId

GROUP BY OrderId,ProductName, CategoryName, QuantityPerUnit, od.UnitPrice, UnitCost, Quantity, Discount, TotalProfits