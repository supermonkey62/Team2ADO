select (UnitPrice * (1 - Discount)) * Quantity as Sales

from {{ ref('Product') }} as p
join {{ ref('OrderDetail') }} as o
on p.ProductId = o.ProductId
-- {{ config (materialized='view')}}

-- select
-- orderid
-- p.productid
-- unitprice
-- quantity
-- discount
-- productname
-- supplierid
-- categoryid
-- quantityperunit
-- unitprice
-- unitsinstock
-- unitsinorder
-- reorderlevel
-- discontinued
-- (unitprice * (1 - discount)) * Quantity as Sales

-- from {{ ref('nwtdata_product') }} as p
-- inner join {{ ref('nwtdata_order_detail') }} as o
-- on p.productid = o.productid